//pass
//--num_groups=32 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel4(double float_n, double eps, __global double *stddev, int m, int n)
{
    __requires(m == 1024);
    __requires(n == 1024);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    double private_stddev[1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    for (int g1 = 32 * b0; g1 < m; g1 += 1048576) {
      if (m >= t0 + g1 + 1)
        private_stddev[0] = stddev[t0 + g1];
      if (m >= t0 + g1 + 1) {
        private_stddev[0] /= float_n;
        private_stddev[0] = sqrt(private_stddev[0]);
        private_stddev[0] = ((private_stddev[0] <= eps) ? 1.0 : private_stddev[0]);
      }
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      if (m >= t0 + g1 + 1)
        stddev[t0 + g1] = private_stddev[0];
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

