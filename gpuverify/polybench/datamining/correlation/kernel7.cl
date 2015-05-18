//pass
//--num_groups=[32,32] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel7(__global double *symmat, __global double *data, int m, int n)
{
    __requires(m == 1024);
    __requires(n == 1024);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);
    double private_symmat_0[1][2];
    __local double shared_symmat_1[32][32];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    for (int g1 = 32 * b0; g1 < m - 1; g1 += 8192)
      for (int g3 = 32 * b1 + 8192 * floord(-32 * b1 + g1 - 1, 8192) + 8192; g3 < m; g3 += 8192) {
        if (m >= t1 + g3 + 1 && t1 + g3 + 15 >= t0 + g1 && m >= t0 + g1 + 2) {
          if (t1 + g3 >= t0 + g1 + 1)
            private_symmat_0[0][0] = symmat[(t0 + g1) * m + (t1 + g3)];
          if (m >= t1 + g3 + 17)
            private_symmat_0[0][1] = symmat[(t0 + g1) * m + (t1 + g3 + 16)];
        }
        for (int g9 = 0; g9 <= n; g9 += 32) {
          if (m >= t1 + g3 + 1 && t1 + g3 + 15 >= t0 + g1 && m >= t0 + g1 + 2 && n >= g9 + 32) {
            for (int c3 = 0; c3 <= 31; c3 += 1) {
              if (t1 + g3 >= t0 + g1 + 1)
                private_symmat_0[0][0] += (data[(g9 + c3) * n + (t0 + g1)] * data[(g9 + c3) * n + (t1 + g3)]);
              if (m >= t1 + g3 + 17)
                private_symmat_0[0][1] += (data[(g9 + c3) * n + (t0 + g1)] * data[(g9 + c3) * n + (t1 + g3 + 16)]);
            }
          } else if (m >= t1 + g3 + 1 && t1 + g3 + 15 >= t0 + g1 && m >= t0 + g1 + 2 && g9 + 31 >= n)
            for (int c3 = 0; c3 <= n - g9; c3 += 1)
              if (n >= g9 + c3 + 1) {
                if (t1 + g3 >= t0 + g1 + 1)
                  private_symmat_0[0][0] += (data[(g9 + c3) * n + (t0 + g1)] * data[(g9 + c3) * n + (t1 + g3)]);
                if (m >= t1 + g3 + 17)
                  private_symmat_0[0][1] += (data[(g9 + c3) * n + (t0 + g1)] * data[(g9 + c3) * n + (t1 + g3 + 16)]);
              } else {
                if (t1 + g3 >= t0 + g1 + 1)
                  shared_symmat_1[t1][t0] = private_symmat_0[0][0];
                if (m >= t1 + g3 + 17)
                  shared_symmat_1[t1 + 16][t0] = private_symmat_0[0][1];
              }
          barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        }
        if (n >= 1)
          if (m >= t1 + g3 + 1 && t1 + g3 + 15 >= t0 + g1 && m >= t0 + g1 + 2) {
            if (t1 + g3 >= t0 + g1 + 1)
              symmat[(t0 + g1) * m + (t1 + g3)] = private_symmat_0[0][0];
            if (m >= t1 + g3 + 17)
              symmat[(t0 + g1) * m + (t1 + g3 + 16)] = private_symmat_0[0][1];
          }
        if (t0 + g3 >= g1 + 1 && m >= t0 + g3 + 1)
          for (int c1 = t1; c1 <= min(t0 - g1 + g3 - 1, 31); c1 += 16)
            symmat[(t0 + g3) * m + (g1 + c1)] = shared_symmat_1[t0][c1];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

