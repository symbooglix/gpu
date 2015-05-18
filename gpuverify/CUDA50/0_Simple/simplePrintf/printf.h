// --------------------------------------------------------------------------
// GPUVerify additions
// --------------------------------------------------------------------------
__device__ static __attribute__((always_inline)) char *getNextPrintfBufPtr();
__device__ static __attribute__((always_inline)) void writePrintfHeader(char *ptr, char *fmtptr);
__device__ static __attribute__((always_inline)) char *cuPrintfStrncpy(char *dest, const char *src, int n, char *end);
__device__ static __attribute__((always_inline)) char *copyArg(char *ptr, const char *arg, char *end);
template <typename T>  __device__ static __attribute__((always_inline)) char *copyArg(char *ptr, T &arg, char *end);
template <typename T1> __device__ static __attribute__((always_inline)) int cuPrintf(const char *fmt, T1 arg1);
// --------------------------------------------------------------------------

#define CUPRINTF_UNRESTRICTED   -1

// This is the smallest amount of memory, per-thread, which is allowed.
// It is also the largest amount of space a single printf() can take up
const static int CUPRINTF_MAX_LEN = 256;

// This structure is used internally to track block/thread output restrictions.
typedef struct __align__(8)
{
    int threadid;                           // CUPRINTF_UNRESTRICTED for unrestricted
    int blockid;                            // CUPRINTF_UNRESTRICTED for unrestricted
} cuPrintfRestriction;

// The main storage is in a global print buffer, which has a known
// start/end/length. These are atomically updated so it works as a
// circular buffer.
// Since the only control primitive that can be used is atomicAdd(),
// we cannot wrap the pointer as such. The actual address must be
// calculated from printfBufferPtr by mod-ing with printfBufferLength.
// For sm_10 architecture, we must subdivide the buffer per-thread
// since we do not even have an atomic primitive.
__constant__ static char *globalPrintfBuffer = NULL;         // Start of circular buffer (set up by host)
__constant__ static int printfBufferLength = 0;              // Size of circular buffer (set up by host)
__device__ static cuPrintfRestriction restrictRules;         // Output restrictions
__device__ volatile static char *printfBufferPtr = NULL;     // Current atomically-incremented non-wrapped offset

// This is the header preceeding all printf entries.
// NOTE: It *must* be size-aligned to the maximum entity size (size_t)
typedef struct __align__(8)
{
    unsigned short magic;                   // Magic number says we're valid
    unsigned short fmtoffset;               // Offset of fmt string into buffer
    unsigned short blockid;                 // Block ID of author
    unsigned short threadid;                // Thread ID of author
} cuPrintfHeader;

// Special header for sm_10 architecture
#define CUPRINTF_SM10_MAGIC   0xC810        // Not a valid ascii character
typedef struct __align__(16)
{
    unsigned short magic;                   // sm_10 specific magic number
    unsigned short unused;
    unsigned int thread_index;              // thread ID for this buffer
    unsigned int thread_buf_len;            // per-thread buffer length
    unsigned int offset;                    // most recent printf's offset
} cuPrintfHeaderSM10;


// Because we can't write an element which is not aligned to its bit-size,
// we have to align all sizes and variables on maximum-size boundaries.
// That means sizeof(double) in this case, but we'll use (long long) for
// better arch<1.3 support
#define CUPRINTF_ALIGN_SIZE      sizeof(long long)

// All our headers are prefixed with a magic number so we know they're ready
#define CUPRINTF_SM11_MAGIC  (unsigned short)0xC811        // Not a valid ascii character


//
//  getNextPrintfBufPtr
//
//  Grabs a block of space in the general circular buffer, using an
//  atomic function to ensure that it's ours. We handle wrapping
//  around the circular buffer and return a pointer to a place which
//  can be written to.
//
//  Important notes:
//      1. We always grab CUPRINTF_MAX_LEN bytes
//      2. Because of 1, we never worry about wrapping around the end
//      3. Because of 1, printfBufferLength *must* be a factor of CUPRINTF_MAX_LEN
//
//  This returns a pointer to the place where we own.
//
__device__ static __attribute__((always_inline)) char *getNextPrintfBufPtr()
{
    // Initialisation check
    if (!printfBufferPtr)
    {
        return NULL;
    }

    // Thread/block restriction check
    if ((restrictRules.blockid != CUPRINTF_UNRESTRICTED) && (restrictRules.blockid != (blockIdx.x + gridDim.x*blockIdx.y)))
    {
        return NULL;
    }

    if ((restrictRules.threadid != CUPRINTF_UNRESTRICTED) && (restrictRules.threadid != (threadIdx.x + blockDim.x*threadIdx.y + blockDim.x*blockDim.y*threadIdx.z)))
    {
        return NULL;
    }

    // Conditional section, dependent on architecture
#if __CUDA_ARCH__ == 100
    // For sm_10 architectures, we have no atomic add - this means we must split the
    // entire available buffer into per-thread blocks. Inefficient, but what can you do.
    int thread_count = (gridDim.x * gridDim.y) * (blockDim.x * blockDim.y * blockDim.z);
    int thread_index = threadIdx.x + blockDim.x*threadIdx.y + blockDim.x*blockDim.y*threadIdx.z +
                       (blockIdx.x + gridDim.x*blockIdx.y) * (blockDim.x * blockDim.y * blockDim.z);

    // Find our own block of data and go to it. Make sure the per-thread length
    // is a precise multiple of CUPRINTF_MAX_LEN, otherwise we risk size and
    // alignment issues! We must round down, of course.
    unsigned int thread_buf_len = printfBufferLength / thread_count;
    thread_buf_len &= ~(CUPRINTF_MAX_LEN-1);

    // We *must* have a thread buffer length able to fit at least two printfs (one header, one real)
    if (thread_buf_len < (CUPRINTF_MAX_LEN * 2))
    {
        return NULL;
    }

    // Now address our section of the buffer. The first item is a header.
    char *myPrintfBuffer = globalPrintfBuffer + (thread_buf_len * thread_index);
    cuPrintfHeaderSM10 hdr = *(cuPrintfHeaderSM10 *)(void *)myPrintfBuffer;

    if (hdr.magic != CUPRINTF_SM10_MAGIC)
    {
        // If our header is not set up, initialise it
        hdr.magic = CUPRINTF_SM10_MAGIC;
        hdr.thread_index = thread_index;
        hdr.thread_buf_len = thread_buf_len;
        hdr.offset = 0;         // Note we start at 0! We pre-increment below.
        *(cuPrintfHeaderSM10 *)(void *)myPrintfBuffer = hdr;       // Write back the header

        // For initial setup purposes, we might need to init thread0's header too
        // (so that cudaPrintfDisplay() below will work). This is only run once.
        cuPrintfHeaderSM10 *tophdr = (cuPrintfHeaderSM10 *)(void *)globalPrintfBuffer;
        tophdr->thread_buf_len = thread_buf_len;
    }

    // Adjust the offset by the right amount, and wrap it if need be
    unsigned int offset = hdr.offset + CUPRINTF_MAX_LEN;

    if (offset >= hdr.thread_buf_len)
    {
        offset = CUPRINTF_MAX_LEN;
    }

    // Write back the new offset for next time and return a pointer to it
    ((cuPrintfHeaderSM10 *)(void *)myPrintfBuffer)->offset = offset;
    return myPrintfBuffer + offset;
#else
    // Much easier with an atomic operation!
    size_t offset = atomicAdd((unsigned int *)&printfBufferPtr, CUPRINTF_MAX_LEN) - (size_t)globalPrintfBuffer;
    offset %= printfBufferLength;
    return globalPrintfBuffer + offset;
#endif
}


//
//  writePrintfHeader
//
//  Inserts the header for containing our UID, fmt position and
//  block/thread number. We generate it dynamically to avoid
//      issues arising from requiring pre-initialisation.
//
__device__ static __attribute__((always_inline)) void writePrintfHeader(char *ptr, char *fmtptr)
{
    if (ptr)
    {
        cuPrintfHeader header;
        header.magic = CUPRINTF_SM11_MAGIC;
        header.fmtoffset = (unsigned short)(fmtptr - ptr);
        header.blockid = blockIdx.x + gridDim.x*blockIdx.y;
        header.threadid = threadIdx.x + blockDim.x*threadIdx.y + blockDim.x*blockDim.y*threadIdx.z;
      // IMPERIAL EDIT: avoid memcpy complaint
      //*(cuPrintfHeader *)(void *)ptr = header;
        cuPrintfHeader *p = (cuPrintfHeader *)(void *)ptr;
        p->magic = header.magic;
        p->fmtoffset = header.fmtoffset;
        p->blockid = header.blockid;
        p->threadid = header.threadid;
    }
}


//
//  cuPrintfStrncpy
//
//  This special strncpy outputs an aligned length value, followed by the
//  string. It then zero-pads the rest of the string until a 64-aligned
//  boundary. The length *includes* the padding. A pointer to the byte
//  just after the \0 is returned.
//
//  This function could overflow CUPRINTF_MAX_LEN characters in our buffer.
//  To avoid it, we must count as we output and truncate where necessary.
//
__device__ static __attribute__((always_inline)) char *cuPrintfStrncpy(char *dest, const char *src, int n, char *end)
{
    // Initialisation and overflow check
    if (!dest || !src || (dest >= end))
    {
        return NULL;
    }

    // Prepare to write the length specifier. We're guaranteed to have
    // at least "CUPRINTF_ALIGN_SIZE" bytes left because we only write out in
    // chunks that size, and CUPRINTF_MAX_LEN is aligned with CUPRINTF_ALIGN_SIZE.
    int *lenptr = (int *)(void *)dest;
    int len = 0;
    dest += CUPRINTF_ALIGN_SIZE;

    // Now copy the string
    while (n--)
    {
        if (dest >= end)    // Overflow check
        {
            break;
        }

        len++;
        *dest++ = *src;

        if (*src++ == '\0')
        {
            break;
        }
    }

    // Now write out the padding bytes, and we have our length.
    while ((dest < end) && (((size_t)dest & (CUPRINTF_ALIGN_SIZE-1)) != 0))
    {
        len++;
        *dest++ = 0;
    }

    *lenptr = len;
    return (dest < end) ? dest : NULL;        // Overflow means return NULL
}


//
//  copyArg
//
//  This copies a length specifier and then the argument out to the
//  data buffer. Templates let the compiler figure all this out at
//  compile-time, making life much simpler from the programming
//  point of view. I'm assuimg all (const char *) is a string, and
//  everything else is the variable it points at. I'd love to see
//  a better way of doing it, but aside from parsing the format
//  string I can't think of one.
//
//  The length of the data type is inserted at the beginning (so that
//  the display can distinguish between float and double), and the
//  pointer to the end of the entry is returned.
//
__device__ static __attribute__((always_inline)) char *copyArg(char *ptr, const char *arg, char *end)
{
    // Initialisation check
    if (!ptr || !arg)
    {
        return NULL;
    }

    // strncpy does all our work. We just terminate.
    if ((ptr = cuPrintfStrncpy(ptr, arg, CUPRINTF_MAX_LEN, end)) != NULL)
    {
        *ptr = 0;
    }

    return ptr;
}

template <typename T>
__device__ static __attribute__((always_inline)) char *copyArg(char *ptr, T &arg, char *end)
{
    // Initisalisation and overflow check. Alignment rules mean that
    // we're at least CUPRINTF_ALIGN_SIZE away from "end", so we only need
    // to check that one offset.
    if (!ptr || ((ptr+CUPRINTF_ALIGN_SIZE) >= end))
    {
        return NULL;
    }

    // Write the length and argument
    *(int *)(void *)ptr = sizeof(arg);
    ptr += CUPRINTF_ALIGN_SIZE;
    *(T *)(void *)ptr = arg;
    ptr += CUPRINTF_ALIGN_SIZE;
    *ptr = 0;

    return ptr;
}


//
//  cuPrintf
//
//  Templated printf functions to handle multiple arguments.
//  Note we return the total amount of data copied, not the number
//  of characters output. But then again, who ever looks at the
//  return from printf() anyway?
//
//  The format is to grab a block of circular buffer space, the
//  start of which will hold a header and a pointer to the format
//  string. We then write in all the arguments, and finally the
//  format string itself. This is to make it easy to prevent
//  overflow of our buffer (we support up to 10 arguments, each of
//  which can be 12 bytes in length - that means that only the
//  format string (or a %s) can actually overflow; so the overflow
//  check need only be in the strcpy function.
//
//  The header is written at the very last because that's what
//  makes it look like we're done.
//
//  Errors, which are basically lack-of-initialisation, are ignored
//  in the called functions because NULL pointers are passed around
//

// All printf variants basically do the same thing, setting up the
// buffer, writing all arguments, then finalising the header. For
// clarity, we'll pack the code into some big macros.
#define CUPRINTF_PREAMBLE \
    char *start, *end, *bufptr, *fmtstart; \
    if((start = getNextPrintfBufPtr()) == NULL) return 0; \
    end = start + CUPRINTF_MAX_LEN; \
    bufptr = start + sizeof(cuPrintfHeader);

// Posting an argument is easy
#define CUPRINTF_ARG(argname) \
    bufptr = copyArg(bufptr, argname, end);

// After args are done, record start-of-fmt and write the fmt and header
#define CUPRINTF_POSTAMBLE \
    fmtstart = bufptr; \
    end = cuPrintfStrncpy(bufptr, fmt, CUPRINTF_MAX_LEN, end); \
    writePrintfHeader(start, end ? fmtstart : NULL); \
    return end ? (int)(end - start) : 0;

template <typename T1> __device__ static __attribute__((always_inline)) int cuPrintf(const char *fmt, T1 arg1)
{
    CUPRINTF_PREAMBLE;

    CUPRINTF_ARG(arg1);

    CUPRINTF_POSTAMBLE;
}
#undef CUPRINTF_PREAMBLE
#undef CUPRINTF_ARG
#undef CUPRINTF_POSTAMBLE


//
//      cuPrintfRestrict
//
//      Called to restrict output to a given thread/block.
//      We store the info in "restrictRules", which is set up at
//      init time by the host. It's not the cleanest way to do this
//      because it means restrictions will last between
//      invocations, but given the output-pointer continuity,
//      I feel this is reasonable.
//
__device__ static __attribute__((always_inline)) void cuPrintfRestrict(int threadid, int blockid)
{
    int thread_count = blockDim.x * blockDim.y * blockDim.z;

    if (((threadid < thread_count) && (threadid >= 0)) || (threadid == CUPRINTF_UNRESTRICTED))
    {
        restrictRules.threadid = threadid;
    }

    int block_count = gridDim.x * gridDim.y;

    if (((blockid < block_count) && (blockid >= 0)) || (blockid == CUPRINTF_UNRESTRICTED))
    {
        restrictRules.blockid = blockid;
    }
}

// Cleanup
#undef CUPRINTF_MAX_LEN
#undef CUPRINTF_ALIGN_SIZE
#undef CUPRINTF_SM10_MAGIC
#undef CUPRINTF_SM11_MAGIC
