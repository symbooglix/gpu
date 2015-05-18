//pass
//--num_groups=2 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel2(__global int *c, __global int *sum_c, __global int *W, int length, int tsteps, int h0, int h3)
{
    __requires(tsteps == 1024);
    __requires(length == 64);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    int private_c[1][1];
    int private_sum_c[1][1][1];
    int private_W[1][1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    for (int g1 = 32 * b0; g1 < h3 / 2; g1 += 1048576) {
      if (h3 >= 2 * t0 + 2 * g1 + 2)
        private_W[0][0] = W[(t0 + g1) * length + (h3 / 2)];
      if (h3 >= 2 * t0 + 2 * g1 + 2)
        private_sum_c[0][0][0] = sum_c[((t0 + g1) * length + (h3 / 2)) * length + ((h3 / 2) - 1)];
      if (h3 >= 2 * t0 + 2 * g1 + 2)
        private_c[0][0] = (private_sum_c[0][0][0] + private_W[0][0]);
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      if (h3 >= 2 * t0 + 2 * g1 + 2)
        c[(t0 + g1) * length + (h3 / 2)] = private_c[0][0];
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

