//pass
//--num_groups=1 --local_size=1


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel5(__global double *y, __global double *r, __global double *sum, int n, int h0, int h3)
{
    __requires(n == 4096);
    double private_r[1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    {
      private_r[0] = r[h0 - h3 - 1];
      sum[(h3 + 1) * n + h0] = (sum[h3 * n + h0] + (private_r[0] * y[h3 * n + (h0 - 1)]));
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

