//pass
//--num_groups=1 --local_size=1


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel2(__global double *acc, __global double *B, __global double *A, int nj, int ni, int h0, int h2, int h5)
{
    __requires(nj == 1024);
    __requires(ni == 1024);
    double private_acc;
    double private_B[1][1];
    double private_A[1][1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    {
      private_A[0][0] = A[h5 * nj + (h0 - 1)];
      private_B[0][0] = B[h5 * nj + h2];
      private_acc = *acc;
      private_acc += (private_B[0][0] * private_A[0][0]);
      *acc = private_acc;
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

