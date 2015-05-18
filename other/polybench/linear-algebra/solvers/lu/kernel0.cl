//pass
//--num_groups=[32,32] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable


__kernel void kernel0(__global double *A, int n, int h0)
{
    __requires(n == 1024);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);
    double private_A_0[1][2];
    double private_A_1[1][2];
    __local double shared_A_2[32][32];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    #define max(x,y)    ((x) > (y) ? (x) : (y))
    for (int g1 = 32 * b0 + 8192 * floord(-64 * b0 + h0 - 62, 16384) + 8192; g1 <= min(n - 1, h0); g1 += 8192) {
      if (n + g1 + 60 >= ((n - 32 * b1 - 1) % 8192) + h0 && 2 * n + 28 >= ((n - 32 * b1 - 1) % 8192) + h0)
        if (n >= t0 + g1 + 1)
          for (int c1 = max(((t1 + h0 - g1 + 17) % 16) - h0 + g1 + 31, t1); c1 <= min(31, n - h0 + g1 + 30); c1 += 16)
            shared_A_2[t0][c1] = A[(t0 + g1) * n + (h0 - g1 + c1 - 31)];
      for (int g3 = max(max(32 * b1 + 8192 * floord(-n - 32 * b1 + h0 - 30, 8192) + 8192, 32 * b1), 32 * b1 + 8192 * floord(-32 * b1 + h0 - g1 - 62, 8192) + 8192); g3 < n; g3 += 8192) {
        if (n >= t1 + g3 + 1 && t0 + t1 + g1 + g3 + 15 >= h0 && h0 >= t0 + g1 && n >= t0 + g1 + 1 && 2 * t0 + 2 * g1 >= h0 + 1) {
          if (t0 + t1 + g1 + g3 >= h0 + 1)
            private_A_1[0][0] = A[(-t0 + h0 - g1) * n + (t1 + g3)];
          if (n >= t1 + g3 + 17)
            private_A_1[0][1] = A[(-t0 + h0 - g1) * n + (t1 + g3 + 16)];
        }
        if (n >= t1 + g3 + 1 && t0 + t1 + g1 + g3 + 15 >= h0 && h0 >= t0 + g1 && n >= t0 + g1 + 1 && 2 * t0 + 2 * g1 >= h0 + 1) {
          if (t0 + t1 + g1 + g3 >= h0 + 1)
            private_A_0[0][0] = A[(t0 + g1) * n + (t1 + g3)];
          if (n >= t1 + g3 + 17)
            private_A_0[0][1] = A[(t0 + g1) * n + (t1 + g3 + 16)];
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (n >= t1 + g3 + 1 && t0 + t1 + g1 + g3 + 15 >= h0 && h0 >= t0 + g1 && n >= t0 + g1 + 1 && 2 * t0 + 2 * g1 >= h0 + 1) {
          if (t0 + t1 + g1 + g3 >= h0 + 1)
            private_A_0[0][0] = (private_A_0[0][0] - (shared_A_2[t0][-t0 + 31] * private_A_1[0][0]));
          if (n >= t1 + g3 + 17)
            private_A_0[0][1] = (private_A_0[0][1] - (shared_A_2[t0][-t0 + 31] * private_A_1[0][1]));
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (n >= t1 + g3 + 1 && t0 + t1 + g1 + g3 + 15 >= h0 && h0 >= t0 + g1 && n >= t0 + g1 + 1 && 2 * t0 + 2 * g1 >= h0 + 1) {
          if (t0 + t1 + g1 + g3 >= h0 + 1)
            A[(t0 + g1) * n + (t1 + g3)] = private_A_0[0][0];
          if (n >= t1 + g3 + 17)
            A[(t0 + g1) * n + (t1 + g3 + 16)] = private_A_0[0][1];
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
    }
}

