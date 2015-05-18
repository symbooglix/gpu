//pass
//--num_groups=1 --local_size=1


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel3(__global double *acc, __global double *B, double beta, __global double *A, double alpha, __global double *C, int nj, int ni, int h0, int h2)
{
    __requires(nj == 1024);
    __requires(ni == 1024);
    double private_acc;
    double private_A[1][1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    {
      private_A[0][0] = A[(h0 - 1) * nj + (h0 - 1)];
      private_acc = *acc;
      C[(h0 - 1) * nj + h2] = (((beta * C[(h0 - 1) * nj + h2]) + ((alpha * private_A[0][0]) * B[(h0 - 1) * nj + h2])) + (alpha * private_acc));
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

