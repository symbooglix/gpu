//pass
//--num_groups=1 --local_size=1


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel6(__global double *beta, __global double *alpha, __global double *sum, int n, int h0)
{
    __requires(n == 4096);

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    {
      alpha[h0] = ((-sum[h0 * n + h0]) * beta[h0]);
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

