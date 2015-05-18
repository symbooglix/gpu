//pass
//--num_groups=128 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel8(__global double *alpha, __global double *y, int n, int h0)
{
    __requires(n == 4096);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    __local double shared_alpha[1];
    __local double shared_y_0[32][1];
    __local double shared_y_1[32][1];
    __local double shared_y_2[32][1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    #define max(x,y)    ((x) > (y) ? (x) : (y))
    {
      if (32768 * ((1048544 * b0 + h0 + 1048575) / 1048576) >= 32767 * b0 + 32768)
        if (t0 == 0)
          shared_alpha[0] = alpha[h0];
      for (int g1 = 32 * b0; g1 < h0; g1 += 1048576) {
        if (t0 == 0)
          for (int c0 = max(0, -h0 + g1 + 32); c0 <= 31; c0 += 1)
            shared_y_2[c0][0] = y[(h0 - g1 + c0 - 32) * n + (h0 - 1)];
        if (t0 == 0)
          for (int c0 = 0; c0 <= min(n - g1 - 1, 31); c0 += 1)
            shared_y_1[c0][0] = y[(g1 + c0) * n + (h0 - 1)];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (h0 >= t0 + g1 + 1)
          shared_y_0[t0][0] = (shared_y_1[t0][0] + (shared_alpha[0] * shared_y_2[-t0 + 31][0]));
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (t0 == 0)
          for (int c0 = 0; c0 <= min(h0 - g1 - 1, 31); c0 += 1)
            y[(g1 + c0) * n + h0] = shared_y_0[c0][0];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
    }
}

