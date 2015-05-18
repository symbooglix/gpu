//pass
//--num_groups=64 --local_size=256

#define FPTYPE float

__kernel void
reduce(__global const FPTYPE *g_idata, __global FPTYPE *g_odata,
       __local FPTYPE* sdata, const unsigned int n)
{
    const unsigned int tid = get_local_id(0);
    unsigned int i = (get_group_id(0)*(get_local_size(0)*2)) + tid;
    const unsigned int gridSize = get_local_size(0)*2*get_num_groups(0);
    const unsigned int blockSize = get_local_size(0);

    sdata[tid] = 0;

    // Reduce multiple elements per thread, strided by grid size
    while (i < n)
    {         
        sdata[tid] += g_idata[i] + g_idata[i+blockSize];
        i += gridSize;
    } 
    barrier(CLK_LOCAL_MEM_FENCE);

    // do reduction in shared mem
    for (unsigned int s = blockSize / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            sdata[tid] += sdata[tid + s];
        }
        barrier(CLK_LOCAL_MEM_FENCE);
    }

    // Write result back to global memory
    if (tid == 0)
    {
        g_odata[get_group_id(0)] = sdata[0];
    }
}
