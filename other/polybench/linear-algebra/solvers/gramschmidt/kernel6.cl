//pass
//--num_groups=32 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel6(__global double *A, __global double *Q, __global double *R, int nj, int ni, int h0)
{
    __requires(nj == 512);
    __requires(ni == 512);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    __local double shared_A[32][32];
    double private_R[1][1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    #define max(x,y)    ((x) > (y) ? (x) : (y))
    if (5 * nj >= h0 + 6 && h0 >= 4)
      for (int g1 = max(32 * b0 + 1048576 * floord(-nj - 64 * b0 + h0 - 63, 2097152) + 1048576, 32 * b0 + 1048576 * floord(-96 * b0 + h0 - 95, 3145728) + 1048576); g1 < (2 * h0 + 2) / 5; g1 += 1048576) {
        if (3 * t0 + 3 * g1 + 1 >= h0 && 2 * h0 >= 5 * t0 + 5 * g1 + 3 && nj + 2 * t0 + 2 * g1 >= h0)
          private_R[0][0] = R[(3 * t0 - h0 + 3 * g1 + 1) * nj + (-2 * t0 + h0 - 2 * g1 - 1)];
        for (int g5 = 0; g5 < ni; g5 += 32) {
          if ((2 * t0 + h0 >= 2 * g1 + 63 && 3 * g1 >= h0 && 3 * nj >= h0 + 3) || (h0 + 2 >= 3 * nj && 5 * ((nj + h0) / 2) >= 3 * h0 + 3 && nj + 2 * g1 + 62 >= 2 * t0 + h0 && 2 * t0 + h0 >= 2 * g1 + 63) || (h0 >= 3 * g1 + 1 && 3 * nj >= h0 + 3 && 5 * ((2 * h0 + 1) / 3) >= 3 * h0 + 3 && nj + 2 * g1 + 62 >= 2 * t0 + h0 && 2 * t0 + h0 >= 2 * g1 + 63))
            for (int c0 = 0; c0 <= min(31, ni - g5 - 1); c0 += 1)
              shared_A[c0][t0] = A[(g5 + c0) * nj + (2 * t0 + h0 - 2 * g1 - 63)];
          barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
          if (3 * t0 + 3 * g1 + 1 >= h0 && 2 * h0 >= 5 * t0 + 5 * g1 + 3 && nj + 2 * t0 + 2 * g1 >= h0)
            for (int c2 = 0; c2 <= min(ni - g5 - 1, 31); c2 += 1)
              private_R[0][0] += (Q[(g5 + c2) * nj + (3 * t0 - h0 + 3 * g1 + 1)] * shared_A[c2][-t0 + 31]);
          barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        }
        if (3 * t0 + 3 * g1 + 1 >= h0 && 2 * h0 >= 5 * t0 + 5 * g1 + 3 && nj + 2 * t0 + 2 * g1 >= h0)
          R[(3 * t0 - h0 + 3 * g1 + 1) * nj + (-2 * t0 + h0 - 2 * g1 - 1)] = private_R[0][0];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

