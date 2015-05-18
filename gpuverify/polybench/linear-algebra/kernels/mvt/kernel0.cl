//pass
//--num_groups=128 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable


__kernel void kernel0(__global double *y_2, __global double *A, __global double *x2, int n)
{
    __requires(n == 4096);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    __local double shared_y_2[32];
    double private_x2[1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    for (int g1 = 32 * b0; g1 < n; g1 += 1048576) {
      if (n >= t0 + g1 + 1)
        private_x2[0] = x2[t0 + g1];
      for (int g5 = 0; g5 < n; g5 += 32) {
        if (n >= t0 + g5 + 1)
          shared_y_2[t0] = y_2[t0 + g5];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (n >= t0 + g1 + 1)
          for (int c2 = 0; c2 <= min(n - g5 - 1, 31); c2 += 1)
            private_x2[0] = (private_x2[0] + (A[(g5 + c2) * n + (t0 + g1)] * shared_y_2[c2]));
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
      if (n >= t0 + g1 + 1)
        x2[t0 + g1] = private_x2[0];
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

