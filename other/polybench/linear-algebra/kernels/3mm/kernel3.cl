//pass
//--num_groups=[32,32] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel3(__global double *C, __global double *D, __global double *F, int nl, int nm, int nj, int nk, int ni)
{
    __requires(nm == 1024);
    __requires(nl == 1024);
    __requires(nk == 1024);
    __requires(nj == 1024);
    __requires(ni == 1024);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);
    __local double shared_C[32][32];
    double private_F[1][2];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    for (int g1 = 32 * b0; g1 < nj; g1 += 8192)
      for (int g3 = 32 * b1; g3 < nl; g3 += 8192) {
        if (nm >= 1)
          if (nl >= t1 + g3 + 1 && nj >= t0 + g1 + 1) {
            private_F[0][0] = F[(t0 + g1) * nl + (t1 + g3)];
            if (nl >= t1 + g3 + 17)
              private_F[0][1] = F[(t0 + g1) * nl + (t1 + g3 + 16)];
          }
        for (int g9 = 0; g9 <= (nm >= 1 ? nm - 1 : 0); g9 += 32) {
          if (nm >= g9 + 1)
            if (nj >= t0 + g1 + 1)
              for (int c1 = t1; c1 <= min(31, nm - g9 - 1); c1 += 16)
                shared_C[t0][c1] = C[(t0 + g1) * nm + (g9 + c1)];
          barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
          if (g9 == 0 && nj >= t0 + g1 + 1 && nl >= t1 + g3 + 1) {
            private_F[0][0] = (0);
            if (nl >= t1 + g3 + 17)
              private_F[0][1] = (0);
          }
          if (nj >= t0 + g1 + 1 && nl >= t1 + g3 + 1)
            for (int c3 = 0; c3 <= min(31, nm - g9 - 1); c3 += 1) {
              private_F[0][0] += (shared_C[t0][c3] * D[(g9 + c3) * nl + (t1 + g3)]);
              if (nl >= t1 + g3 + 17)
                private_F[0][1] += (shared_C[t0][c3] * D[(g9 + c3) * nl + (t1 + g3 + 16)]);
            }
          barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        }
        if (nl >= t1 + g3 + 1 && nj >= t0 + g1 + 1) {
          F[(t0 + g1) * nl + (t1 + g3)] = private_F[0][0];
          if (nl >= t1 + g3 + 17)
            F[(t0 + g1) * nl + (t1 + g3 + 16)] = private_F[0][1];
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

