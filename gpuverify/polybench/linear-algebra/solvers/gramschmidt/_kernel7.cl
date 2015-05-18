//pass
//--num_groups=1 --local_size=1


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel7(__global double *A, __global double *nrm, int nj, int ni, int h0, int h2)
{
    __requires(nj == 512);
    __requires(ni == 512);
    double private_nrm;

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    {
      private_nrm = *nrm;
      private_nrm += (A[h2 * nj + ((h0 - 1) / 5)] * A[h2 * nj + ((h0 - 1) / 5)]);
      *nrm = private_nrm;
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

