//pass
//--num_groups=1 --local_size=1


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel4(__global double *beta, __global double *alpha, int n, int h0)
{
    __requires(n == 4096);

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    {
      beta[h0] = (beta[h0 - 1] - ((alpha[h0 - 1] * alpha[h0 - 1]) * beta[h0 - 1]));
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

