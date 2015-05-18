//pass
//--num_groups=[2,2] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel0(__global int *sum_c, int length, int tsteps, int h0)
{
    __requires(tsteps == 1024);
    __requires(length == 64);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);
    int private_sum_c[1][2][1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    for (int g1 = 32 * b0; g1 < length - 1; g1 += 8192)
      for (int g3 = 32 * b1 + 8192 * floord(-32 * b1 + g1 - 1, 8192) + 8192; g3 < length; g3 += 8192) {
        if (length >= t1 + g3 + 1 && t1 + g3 + 15 >= t0 + g1 && length >= t0 + g1 + 2) {
          if (t1 + g3 >= t0 + g1 + 1)
            private_sum_c[0][0][0] = (0);
          if (length >= t1 + g3 + 17)
            private_sum_c[0][1][0] = (0);
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (length >= t1 + g3 + 1 && t1 + g3 + 15 >= t0 + g1 && length >= t0 + g1 + 2) {
          if (t1 + g3 >= t0 + g1 + 1)
            sum_c[((t0 + g1) * length + (t1 + g3)) * length + (t0 + g1)] = private_sum_c[0][0][0];
          if (length >= t1 + g3 + 17)
            sum_c[((t0 + g1) * length + (t1 + g3 + 16)) * length + (t0 + g1)] = private_sum_c[0][1][0];
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

