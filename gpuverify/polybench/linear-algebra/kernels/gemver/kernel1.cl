//pass
//--num_groups=128 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel1(double beta, __global double *y, __global double *x, __global double *A, __global double *z, int n)
{
    __requires(n == 4096);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    __local double shared_y[32];
    double private_x[1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    for (int g1 = 32 * b0; g1 < n; g1 += 1048576) {
      if (n >= t0 + g1 + 1)
        private_x[0] = x[t0 + g1];
      for (int g5 = 0; g5 <= n; g5 += 32) {
        if (n >= g5 + 1)
          if (n >= t0 + g5 + 1)
            shared_y[t0] = y[t0 + g5];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (n >= t0 + g1 + 1)
          if (n >= g5 + 32) {
            for (int c2 = 0; c2 <= 31; c2 += 1)
              private_x[0] = (private_x[0] + ((beta * A[(g5 + c2) * n + (t0 + g1)]) * shared_y[c2]));
          } else {
            for (int c2 = 0; c2 < n - g5; c2 += 1)
              private_x[0] = (private_x[0] + ((beta * A[(g5 + c2) * n + (t0 + g1)]) * shared_y[c2]));
            private_x[0] = (private_x[0] + z[t0 + g1]);
          }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
      if (n >= t0 + g1 + 1)
        x[t0 + g1] = private_x[0];
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

