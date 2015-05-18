//pass
//--num_groups=16 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel5(__global double *A, __global double *Q, __global double *R, int nj, int ni, int h0)
{
    __requires(nj == 512);
    __requires(ni == 512);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    __local double shared_A[32][1];
    __local double shared_Q[32][1];
    __local double shared_R[1][1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    {
      if (t0 == 0)
        shared_R[0][0] = R[((h0 - 3) / 5) * nj + ((h0 - 3) / 5)];
      for (int g1 = 32 * b0; g1 < ni; g1 += 1048576) {
        if (t0 == 0)
          for (int c0 = 0; c0 <= min(ni - g1 - 1, 31); c0 += 1)
            shared_A[c0][0] = A[(g1 + c0) * nj + ((h0 - 3) / 5)];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (ni >= t0 + g1 + 1)
          shared_Q[t0][0] = (shared_A[t0][0] / shared_R[0][0]);
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (t0 == 0)
          for (int c0 = 0; c0 <= min(ni - g1 - 1, 31); c0 += 1)
            Q[(g1 + c0) * nj + ((h0 - 3) / 5)] = shared_Q[c0][0];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
    }
}

