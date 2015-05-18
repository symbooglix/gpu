//pass
//--num_groups=1 --local_size=1


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel3(__global double *beta, int n)
{
    __requires(n == 4096);

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    {
      beta[0] = (1);
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

