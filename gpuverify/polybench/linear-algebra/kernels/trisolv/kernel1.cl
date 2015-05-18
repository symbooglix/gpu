//pass
//--num_groups=128 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel1(__global double *A, __global double *x, int n, int h1)
{
    __requires(n == 4096);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    __local double shared_A[32][32];
    double private_x_0[1];
    double private_x_1[1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    #define max(x,y)    ((x) > (y) ? (x) : (y))
    for (int g1 = max(32 * b0 + 1048576 * floord(-n - 32 * b0 + h1 - 31, 1048576) + 1048576, 32 * b0); g1 < (h1 + 1) / 2; g1 += 1048576) {
      if (n + t0 + g1 >= h1 + 1 && h1 >= 2 * t0 + 2 * g1 + 1)
        private_x_1[0] = x[t0 + g1];
      if (n + t0 + g1 >= h1 + 1 && h1 >= 2 * t0 + 2 * g1 + 1)
        private_x_0[0] = x[-t0 + h1 - g1];
      if (n >= t0 + g1 + 1)
        for (int c0 = max(-h1 + g1 + 31, 0); c0 <= min(n - h1 + g1 + 30, 31); c0 += 1)
          shared_A[c0][t0] = A[(h1 - g1 + c0 - 31) * n + (t0 + g1)];
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      if (n + t0 + g1 >= h1 + 1 && h1 >= 2 * t0 + 2 * g1 + 1)
        private_x_0[0] = (private_x_0[0] - (shared_A[-t0 + 31][t0] * private_x_1[0]));
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      if (n + t0 + g1 >= h1 + 1 && h1 >= 2 * t0 + 2 * g1 + 1)
        x[-t0 + h1 - g1] = private_x_0[0];
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

