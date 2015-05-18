//pass
//--num_groups=32 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel3(__global double *X, __global double *B, int n, int tsteps, int h0)
{
    __requires(tsteps == 32);
    __requires(n == 1024);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    double private_X[1][1];
    double private_B[1][1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    for (int g1 = 32 * b0;
         __global_invariant(__read_implies(X, (((__read_offset_bytes(X)/sizeof(double))/n - t0) % 1048576) == 32 * b0)),
         __global_invariant(__write_implies(X, (((__write_offset_bytes(X)/sizeof(double))/n - t0) % 1048576) == 32 * b0)),
         g1 < n; g1 += 1048576) {
      if (n >= t0 + g1 + 1)
        private_B[0][0] = B[(t0 + g1) * n + (n - 1)];
      if (n >= t0 + g1 + 1)
        private_X[0][0] = X[(t0 + g1) * n + (n - 1)];
      if (n >= t0 + g1 + 1)
        private_X[0][0] = (private_X[0][0] / private_B[0][0]);
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      if (n >= t0 + g1 + 1)
        X[(t0 + g1) * n + (n - 1)] = private_X[0][0];
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

