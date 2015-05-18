//pass
//--num_groups=1 --local_size=1


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel8(__global double *nrm, __global double *R, int nj, int ni, int h0)
{
    __requires(nj == 512);
    __requires(ni == 512);
    double private_nrm;

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    {
      private_nrm = *nrm;
      R[((h0 - 2) / 5) * nj + ((h0 - 2) / 5)] = sqrt(private_nrm);
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

