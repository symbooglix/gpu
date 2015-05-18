//pass
//--num_groups=1 --local_size=1


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel1(__global double *y, __global double *r, int n)
{
    __requires(n == 4096);

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    {
      y[0 * n + 0] = r[0];
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

