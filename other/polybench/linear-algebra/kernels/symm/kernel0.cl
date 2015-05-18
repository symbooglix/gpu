//pass
//--num_groups=[32,16] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable


__kernel void kernel0(__global double *B, __global double *A, double alpha, __global double *C, int nj, int ni, int h0)
{
    __requires(nj == 1024);
    __requires(ni == 1024);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);
    double private_B[2][1];
    __local double shared_A[32][32];
    double private_C[2][1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    for (int g1 = 32 * b0 + 8192 * floord(-32 * b0 - h0 - 30, 8192) + 8192; g1 < nj; g1 += 8192)
      for (int g3 = 32 * b1; g3 <= min(min((nj + h0 + 1) / 2 - 2, ni - 1), floord(h0 + g1 + 1, 2) + 14); g3 += 8192) {
        if ((t0 + h0 + g1 >= 2 * t1 + 2 * g3 + 2 && ni >= 8161 && nj >= t0 + g1 + 1 && ni >= t1 + g3 + 1 && nj >= 16323) || (g3 == 32 * b1 && ni <= 8160 && nj >= 2 * ni + 1 && t0 + h0 + g1 >= 64 * b1 + 2 * t1 + 2 && ni >= 32 * b1 + t1 + 1 && nj >= t0 + g1 + 1 && nj >= 8161) || (g3 == 32 * b1 && t0 + h0 + g1 >= 64 * b1 + 2 * t1 + 2 && nj <= 16322 && nj >= 8161 && 2 * ni >= nj && nj >= t0 + g1 + 1) || (g3 == 32 * b1 && g1 == 32 * b0 && 32 * b0 + t0 + h0 >= 64 * b1 + 2 * t1 + 2 && ni >= 32 * b1 + t1 + 1 && nj >= 32 * b0 + t0 + 1 && nj <= 8160)) {
          private_C[0][0] = C[(2 * t1 - h0 + 2 * g3) * nj + (t0 + g1)];
          if ((ni >= t1 + g3 + 17 && t0 + h0 + g1 >= 2 * t1 + 2 * g3 + 34 && nj >= 16323 && ni >= 8161) || (g3 == 32 * b1 && 2 * ni >= nj && t0 + h0 + g1 >= 64 * b1 + 2 * t1 + 34 && nj <= 16322 && nj >= 8161) || (g3 == 32 * b1 && ni >= 32 * b1 + t1 + 17 && t0 + h0 + g1 >= 64 * b1 + 2 * t1 + 34 && nj >= 8161 && ni <= 8160 && nj >= 2 * ni + 1) || (g3 == 32 * b1 && g1 == 32 * b0 && 32 * b0 + t0 + h0 >= 64 * b1 + 2 * t1 + 34 && ni >= 32 * b1 + t1 + 17 && nj <= 8160))
            private_C[1][0] = C[(2 * t1 - h0 + 2 * g3 + 32) * nj + (t0 + g1)];
        }
        if ((ni >= nj && nj + h0 >= 2 * t0 + 2 * g3 + 1 && nj >= 16323) || (g3 == 32 * b1 && ni >= nj && nj + h0 >= 64 * b1 + 2 * t0 + 1 && nj <= 16322 && nj >= 8161) || (g3 == 32 * b1 && g1 == 32 * b0 && nj + h0 >= 64 * b1 + 2 * t0 + 1 && nj <= 8160 && ni >= nj)) {
          for (int c1 = t1; c1 <= min(nj - g3 - 1, 31); c1 += 16)
            shared_A[t0][c1] = A[(2 * t0 - h0 + 2 * g3) * nj + (g3 + c1)];
        } else if ((ni + 1 == nj && nj >= 16323 && nj + h0 >= 2 * t0 + 2 * g3 + 2) || (g3 == 32 * b1 && ni + 1 == nj && nj + h0 >= 64 * b1 + 2 * t0 + 2 && nj <= 16322 && nj >= 8161) || (g3 == 32 * b1 && g1 == 32 * b0 && ni + 1 == nj && nj <= 8160 && nj + h0 >= 64 * b1 + 2 * t0 + 2)) {
          for (int c1 = t1; c1 <= min(31, nj - g3 - 1); c1 += 16)
            shared_A[t0][c1] = A[(2 * t0 - h0 + 2 * g3) * nj + (g3 + c1)];
        } else if ((ni >= 8161 && nj + h0 >= 2 * t0 + 2 * g3 + 3 && nj >= 16323 && nj >= ni + 2) || (g3 == 32 * b1 && nj >= 8161 && ni <= 8160 && nj >= 2 * ni + 1 && nj + h0 >= 64 * b1 + 2 * t0 + 3) || (g3 == 32 * b1 && nj <= 16322 && nj >= 8161 && 2 * ni >= nj && nj + h0 >= 64 * b1 + 2 * t0 + 3 && nj >= ni + 2) || (g3 == 32 * b1 && g1 == 32 * b0 && nj + h0 >= 64 * b1 + 2 * t0 + 3 && nj >= ni + 2 && nj <= 8160))
          for (int c1 = t1; c1 <= min(31, nj - g3 - 1); c1 += 16)
            shared_A[t0][c1] = A[(2 * t0 - h0 + 2 * g3) * nj + (g3 + c1)];
        if ((t0 + h0 + g1 >= 2 * t1 + 2 * g3 + 2 && ni >= 8161 && nj >= t0 + g1 + 1 && ni >= t1 + g3 + 1 && nj >= 16323) || (g3 == 32 * b1 && ni <= 8160 && nj >= 2 * ni + 1 && t0 + h0 + g1 >= 64 * b1 + 2 * t1 + 2 && ni >= 32 * b1 + t1 + 1 && nj >= t0 + g1 + 1 && nj >= 8161) || (g3 == 32 * b1 && t0 + h0 + g1 >= 64 * b1 + 2 * t1 + 2 && nj <= 16322 && nj >= 8161 && 2 * ni >= nj && nj >= t0 + g1 + 1) || (g3 == 32 * b1 && g1 == 32 * b0 && 32 * b0 + t0 + h0 >= 64 * b1 + 2 * t1 + 2 && ni >= 32 * b1 + t1 + 1 && nj >= 32 * b0 + t0 + 1 && nj <= 8160)) {
          private_B[0][0] = B[(t1 + g3) * nj + (t0 + g1)];
          if ((ni >= t1 + g3 + 17 && t0 + h0 + g1 >= 2 * t1 + 2 * g3 + 34 && nj >= 16323 && ni >= 8161) || (g3 == 32 * b1 && 2 * ni >= nj && t0 + h0 + g1 >= 64 * b1 + 2 * t1 + 34 && nj <= 16322 && nj >= 8161) || (g3 == 32 * b1 && ni >= 32 * b1 + t1 + 17 && t0 + h0 + g1 >= 64 * b1 + 2 * t1 + 34 && nj >= 8161 && ni <= 8160 && nj >= 2 * ni + 1) || (g3 == 32 * b1 && g1 == 32 * b0 && 32 * b0 + t0 + h0 >= 64 * b1 + 2 * t1 + 34 && ni >= 32 * b1 + t1 + 17 && nj <= 8160))
            private_B[1][0] = B[(t1 + g3 + 16) * nj + (t0 + g1)];
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (nj >= t0 + g1 + 1 && t0 + h0 + g1 >= 2 * t1 + 2 * g3 + 2)
          if ((ni >= t1 + g3 + 1 && nj >= 16323 && ni >= 8161) || (g3 == 32 * b1 && nj <= 16322 && nj >= 8161 && 2 * ni >= nj) || (g3 == 32 * b1 && ni >= 32 * b1 + t1 + 1 && nj >= 8161 && ni <= 8160 && nj >= 2 * ni + 1) || (g3 == 32 * b1 && g1 == 32 * b0 && ni >= 32 * b1 + t1 + 1 && nj <= 8160)) {
            private_C[0][0] += ((alpha * shared_A[t1][t1]) * private_B[0][0]);
            if ((nj >= 16323 && ni >= 8161 && t0 + h0 + g1 >= 2 * t1 + 2 * g3 + 34 && ni >= t1 + g3 + 17) || (g3 == 32 * b1 && nj <= 16322 && nj >= 8161 && 2 * ni >= nj && t0 + h0 + g1 >= 64 * b1 + 2 * t1 + 34) || (g3 == 32 * b1 && nj >= 8161 && ni <= 8160 && nj >= 2 * ni + 1 && ni >= 32 * b1 + t1 + 17 && t0 + h0 + g1 >= 64 * b1 + 2 * t1 + 34) || (g3 == 32 * b1 && g1 == 32 * b0 && nj <= 8160 && ni >= 32 * b1 + t1 + 17 && 32 * b0 + t0 + h0 >= 64 * b1 + 2 * t1 + 34))
              private_C[1][0] += ((alpha * shared_A[t1 + 16][t1 + 16]) * private_B[1][0]);
          }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if ((t0 + h0 + g1 >= 2 * t1 + 2 * g3 + 2 && ni >= 8161 && nj >= t0 + g1 + 1 && ni >= t1 + g3 + 1 && nj >= 16323) || (g3 == 32 * b1 && ni <= 8160 && nj >= 2 * ni + 1 && t0 + h0 + g1 >= 64 * b1 + 2 * t1 + 2 && ni >= 32 * b1 + t1 + 1 && nj >= t0 + g1 + 1 && nj >= 8161) || (g3 == 32 * b1 && t0 + h0 + g1 >= 64 * b1 + 2 * t1 + 2 && nj <= 16322 && nj >= 8161 && 2 * ni >= nj && nj >= t0 + g1 + 1) || (g3 == 32 * b1 && g1 == 32 * b0 && 32 * b0 + t0 + h0 >= 64 * b1 + 2 * t1 + 2 && ni >= 32 * b1 + t1 + 1 && nj >= 32 * b0 + t0 + 1 && nj <= 8160)) {
          C[(2 * t1 - h0 + 2 * g3) * nj + (t0 + g1)] = private_C[0][0];
          if ((ni >= t1 + g3 + 17 && t0 + h0 + g1 >= 2 * t1 + 2 * g3 + 34 && nj >= 16323 && ni >= 8161) || (g3 == 32 * b1 && 2 * ni >= nj && t0 + h0 + g1 >= 64 * b1 + 2 * t1 + 34 && nj <= 16322 && nj >= 8161) || (g3 == 32 * b1 && ni >= 32 * b1 + t1 + 17 && t0 + h0 + g1 >= 64 * b1 + 2 * t1 + 34 && nj >= 8161 && ni <= 8160 && nj >= 2 * ni + 1) || (g3 == 32 * b1 && g1 == 32 * b0 && 32 * b0 + t0 + h0 >= 64 * b1 + 2 * t1 + 34 && ni >= 32 * b1 + t1 + 17 && nj <= 8160))
            C[(2 * t1 - h0 + 2 * g3 + 32) * nj + (t0 + g1)] = private_C[1][0];
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

