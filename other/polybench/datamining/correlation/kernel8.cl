//pass
//--num_groups=32 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel8(__global double *symmat, int m, int n)
{
    __requires(m == 1024);
    __requires(n == 1024);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    __local double shared_symmat[32][32];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    for (int g1 = 32 * b0; g1 < m - 1; g1 += 1048576) {
      if (m >= t0 + g1 + 2)
        shared_symmat[t0][t0] = 1.0;
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      if (m >= t0 + g1 + 2)
        symmat[(t0 + g1) * m + (t0 + g1)] = shared_symmat[t0][t0];
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

