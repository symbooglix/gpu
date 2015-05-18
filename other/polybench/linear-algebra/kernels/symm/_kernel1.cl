//pass
//--num_groups=1 --local_size=1


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel1(__global double *acc, int nj, int ni, int h0, int h2)
{
    __requires(nj == 1024);
    __requires(ni == 1024);
    double private_acc;

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    {
      private_acc = (0);
      *acc = private_acc;
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

