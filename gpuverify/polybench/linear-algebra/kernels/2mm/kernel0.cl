//pass
//--num_groups=[32,32] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable


__kernel void kernel0(double alpha, __global double *tmp, __global double *B, __global double *A, int nl, int nj, int nk, int ni)
{
    __requires(nl == 1024);
    __requires(nk == 1024);
    __requires(nj == 1024);
    __requires(ni == 1024);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);
    double private_tmp[1][2];
    __local double shared_B[32][32];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    for (int g1 = 32 * b0; g1 < ni; g1 += 8192)
      for (int g3 = 32 * b1; g3 < nj; g3 += 8192) {
        if (nk >= 1)
          if (nj >= t1 + g3 + 1 && ni >= t0 + g1 + 1) {
            private_tmp[0][0] = tmp[(t0 + g1) * nj + (t1 + g3)];
            if (nj >= t1 + g3 + 17)
              private_tmp[0][1] = tmp[(t0 + g1) * nj + (t1 + g3 + 16)];
          }
        for (int g9 = 0; g9 <= (nk >= 1 ? nk - 1 : 0); g9 += 32) {
          if (nk >= g9 + 1)
            if (nk >= t0 + g9 + 1)
              for (int c1 = t1; c1 <= min(31, nj - g3 - 1); c1 += 16)
                shared_B[t0][c1] = B[(t0 + g9) * nj + (g3 + c1)];
          barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
          if (g9 == 0 && ni >= t0 + g1 + 1 && nj >= t1 + g3 + 1) {
            private_tmp[0][0] = (0);
            if (nj >= t1 + g3 + 17)
              private_tmp[0][1] = (0);
          }
          if (ni >= t0 + g1 + 1 && nj >= t1 + g3 + 1)
            for (int c3 = 0; c3 <= min(31, nk - g9 - 1); c3 += 1) {
              private_tmp[0][0] += ((alpha * A[(t0 + g1) * nk + (g9 + c3)]) * shared_B[c3][t1]);
              if (nj >= t1 + g3 + 17)
                private_tmp[0][1] += ((alpha * A[(t0 + g1) * nk + (g9 + c3)]) * shared_B[c3][t1 + 16]);
            }
          barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        }
        if (nj >= t1 + g3 + 1 && ni >= t0 + g1 + 1) {
          tmp[(t0 + g1) * nj + (t1 + g3)] = private_tmp[0][0];
          if (nj >= t1 + g3 + 17)
            tmp[(t0 + g1) * nj + (t1 + g3 + 16)] = private_tmp[0][1];
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

