//pass
//--num_groups=[2,2] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel3(__global int *c, __global int *sum_c, int length, int tsteps, int h0, int h3)
{
    __requires(tsteps == 1024);
    __requires(length == 64);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);
    int private_c_0[1][2];
    __local int shared_c_1[32][32];
    int private_sum_c_0[1][2][2];
    int private_sum_c_1[1][2][2];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    #define max(x,y)    ((x) > (y) ? (x) : (y))
    for (int g1 = 32 * b0; g1 < (h3 + 1) / 2 - 1; g1 += 8192)
      for (int g3 = max(32 * b1 + 8192 * floord(-32 * b1 + g1 - 1, 8192) + 8192, 32 * b1 + 8192 * floord(-length - 32 * b1 + h3 - 31, 8192) + 8192); g3 < (h3 + 1) / 2; g3 += 8192) {
        if (h3 >= 2 * t0 + 2 * g1 + 3 && length + t1 + g3 + 15 >= h3 && h3 >= 2 * t1 + 2 * g3 + 1 && t1 + g3 + 15 >= t0 + g1) {
          if (h3 >= 2 * t1 + 2 * g3 + 33)
            private_sum_c_1[0][0][1] = sum_c[((t0 + g1) * length + (-t1 + h3 - g3 - 16)) * length + (t1 + g3 + 15)];
          if (length + t1 + g3 >= h3 + 1 && t1 + g3 >= t0 + g1 + 1)
            private_sum_c_1[0][1][0] = sum_c[((t0 + g1) * length + (-t1 + h3 - g3)) * length + (t1 + g3 - 1)];
        }
        if (length >= t0 + g3 + 1)
          for (int c1 = max(((t1 + h3 - g3 + 17) % 16) - h3 + g3 + 31, t1); c1 <= min(length - h3 + g3 + 30, 31); c1 += 16)
            shared_c_1[t0][c1] = c[(t0 + g3) * length + (h3 - g3 + c1 - 31)];
        if (h3 >= 2 * t0 + 2 * g1 + 3 && length + t1 + g3 + 15 >= h3 && h3 >= 2 * t1 + 2 * g3 + 1 && t1 + g3 + 15 >= t0 + g1) {
          if (length + t1 + g3 >= h3 + 1 && t1 + g3 >= t0 + g1 + 1)
            private_c_0[0][0] = c[(t0 + g1) * length + (t1 + g3)];
          if (h3 >= 2 * t1 + 2 * g3 + 33)
            private_c_0[0][1] = c[(t0 + g1) * length + (t1 + g3 + 16)];
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (h3 >= 2 * t0 + 2 * g1 + 3 && length + t1 + g3 + 15 >= h3 && h3 >= 2 * t1 + 2 * g3 + 1 && t1 + g3 + 15 >= t0 + g1) {
          if (length + t1 + g3 >= h3 + 1 && t1 + g3 >= t0 + g1 + 1)
            private_sum_c_0[0][1][0] = ((private_sum_c_1[0][1][0] + private_c_0[0][0]) + shared_c_1[t1][-t1 + 31]);
          if (h3 >= 2 * t1 + 2 * g3 + 33)
            private_sum_c_0[0][0][1] = ((private_sum_c_1[0][0][1] + private_c_0[0][1]) + shared_c_1[t1 + 16][-t1 + 15]);
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (h3 >= 2 * t0 + 2 * g1 + 3 && length + t1 + g3 + 15 >= h3 && h3 >= 2 * t1 + 2 * g3 + 1 && t1 + g3 + 15 >= t0 + g1) {
          if (h3 >= 2 * t1 + 2 * g3 + 33)
            sum_c[((t0 + g1) * length + (-t1 + h3 - g3 - 16)) * length + (t1 + g3 + 16)] = private_sum_c_0[0][0][1];
          if (length + t1 + g3 >= h3 + 1 && t1 + g3 >= t0 + g1 + 1)
            sum_c[((t0 + g1) * length + (-t1 + h3 - g3)) * length + (t1 + g3)] = private_sum_c_0[0][1][0];
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

