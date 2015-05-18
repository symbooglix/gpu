//pass
//--num_groups=[2,2] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel1(__global int *c, int length, int tsteps, int h0)
{
    __requires(tsteps == 1024);
    __requires(length == 64);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);
    int private_c[1][2];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    for (int g1 = 32 * b0; g1 < length; g1 += 8192)
      for (int g3 = 32 * b1; g3 < length; g3 += 8192) {
        if (length >= t0 + g1 + 1 && length >= t1 + g3 + 1) {
          private_c[0][0] = (0);
          if (length >= t1 + g3 + 17)
            private_c[0][1] = (0);
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (length >= t0 + g1 + 1 && length >= t1 + g3 + 1) {
          c[(t0 + g1) * length + (t1 + g3)] = private_c[0][0];
          if (length >= t1 + g3 + 17)
            c[(t0 + g1) * length + (t1 + g3 + 16)] = private_c[0][1];
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

