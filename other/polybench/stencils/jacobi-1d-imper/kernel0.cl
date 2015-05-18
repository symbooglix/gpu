//pass
//--num_groups=32 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable


__kernel void kernel0(__global double *B, __global double *A, int tsteps, int n, int h0)
{
    __requires(tsteps == 128);
    __requires(n == 1024);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    double private_B[1];
    __local double shared_A[34];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    #define max(x,y)    ((x) > (y) ? (x) : (y))
    for (int g1 = 32 * b0;
         g1 < n - 1; g1 += 1048576) {
      for (int c0 = max(((t0 + g1 + 31) % 32) - g1 + 1, t0);
           __global_invariant(__write_implies(shared_A, ((__write_offset_bytes(shared_A)/sizeof(double))%32) == t0)),
           __invariant((((unsigned)c0)%32) == t0),
           c0 <= min(33, n - g1); c0 += 32)
        shared_A[c0] = A[g1 + c0 - 1];
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      if (t0 + g1 >= 1 && n >= t0 + g1 + 2)
        private_B[0] = (0.33333 * ((shared_A[t0] + shared_A[t0 + 1]) + shared_A[t0 + 2]));
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      if (t0 + g1 >= 1 && n >= t0 + g1 + 2)
        B[t0 + g1] = private_B[0];
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

