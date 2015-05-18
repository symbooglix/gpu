//pass
//--num_groups=[32,32] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel2(__global double *E, __global double *A, __global double *B, int nl, int nm, int nj, int nk, int ni)
{
    __requires(nm == 1024);
    __requires(nl == 1024);
    __requires(nk == 1024);
    __requires(nj == 1024);
    __requires(ni == 1024);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);
    double private_E[1][2];
    __local double shared_A[32][32];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    for (int g1 = 32 * b0; g1 < ni; g1 += 8192)
      for (int g3 = 32 * b1; g3 < nj; g3 += 8192) {
        if (nj >= t1 + g3 + 1 && ni >= t0 + g1 + 1) {
          private_E[0][0] = E[(t0 + g1) * nj + (t1 + g3)];
          if (nj >= t1 + g3 + 17)
            private_E[0][1] = E[(t0 + g1) * nj + (t1 + g3 + 16)];
        }
        for (int g9 = 0; g9 < nk; g9 += 32) {
          if (ni >= t0 + g1 + 1)
            for (int c1 = t1; c1 <= min(31, nk - g9 - 1); c1 += 16)
              shared_A[t0][c1] = A[(t0 + g1) * nk + (g9 + c1)];
          barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
          if (nj >= t1 + g3 + 1 && ni >= t0 + g1 + 1)
            for (int c3 = 0; c3 <= min(31, nk - g9 - 1); c3 += 1) {
              private_E[0][0] += (shared_A[t0][c3] * B[(g9 + c3) * nj + (t1 + g3)]);
              if (nj >= t1 + g3 + 17)
                private_E[0][1] += (shared_A[t0][c3] * B[(g9 + c3) * nj + (t1 + g3 + 16)]);
            }
          barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        }
        if (nj >= t1 + g3 + 1 && ni >= t0 + g1 + 1) {
          E[(t0 + g1) * nj + (t1 + g3)] = private_E[0][0];
          if (nj >= t1 + g3 + 17)
            E[(t0 + g1) * nj + (t1 + g3 + 16)] = private_E[0][1];
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

