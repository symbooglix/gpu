//pass
//--num_groups=32 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel1(__global double *data, __global double *mean, double float_n, int m, int n)
{
    __requires(m == 1024);
    __requires(n == 1024);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    double private_mean[1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    #define max(x,y)    ((x) > (y) ? (x) : (y))
    for (int g1 = 32 * b0; g1 < m; g1 += 1048576) {
      if (m >= t0 + g1 + 1)
        private_mean[0] = mean[t0 + g1];
      for (int g5 = ((n + 31) % 32) - n - 31; g5 <= (n >= 1 ? n - 1 : 0); g5 += 32) {
        if (g5 == 0 && m >= t0 + g1 + 1)
          private_mean[0] /= float_n;
        if (m >= t0 + g1 + 1)
          for (int c2 = max(-n - g5, 0); c2 <= min(n - g5 - 1, 31); c2 += 1)
            if (g5 + c2 <= -1) {
              private_mean[0] += data[(n + g5 + c2) * n + (t0 + g1)];
            } else
              data[(g5 + c2) * n + (t0 + g1)] -= private_mean[0];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
      if (m >= t0 + g1 + 1)
        mean[t0 + g1] = private_mean[0];
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

