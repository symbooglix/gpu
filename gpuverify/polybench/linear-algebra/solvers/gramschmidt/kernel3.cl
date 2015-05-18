//pass
//--num_groups=[32,16] --local_size=[32,16]

#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel3(__global double *A, __global double *Q, __global double *R, int nj, int ni, int h0)
{
    __requires(nj == 512);
    __requires(ni == 512);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);
    double private_A[2][1];
    double private_Q[2][1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define max(x,y)    ((x) > (y) ? (x) : (y))
    if (5 * nj >= h0 + 5 && h0 >= 5)
      for (int g1 = max(32 * b0 + 8192 * floord(-nj - 64 * b0 + h0 - 64, 16384) + 8192, 32 * b0 + 8192 * floord(-96 * b0 + h0 - 96, 24576) + 8192); g1 < 2 * h0 / 5; g1 += 8192)
        for (int g3 = 32 * b1; g3 < ni; g3 += 8192) {
          if (2 * h0 >= 5 * t0 + 5 * g1 + 5 && ni >= t1 + g3 + 1 && nj + 2 * t0 + 2 * g1 + 1 >= h0 && 3 * t0 + 3 * g1 + 2 >= h0) {
            private_Q[0][0] = Q[(t1 + g3) * nj + (3 * t0 - h0 + 3 * g1 + 2)];
            if (ni >= t1 + g3 + 17)
              private_Q[1][0] = Q[(t1 + g3 + 16) * nj + (3 * t0 - h0 + 3 * g1 + 2)];
          }
          if (2 * h0 >= 5 * t0 + 5 * g1 + 5 && ni >= t1 + g3 + 1 && nj + 2 * t0 + 2 * g1 + 1 >= h0 && 3 * t0 + 3 * g1 + 2 >= h0) {
            private_A[0][0] = A[(t1 + g3) * nj + (-2 * t0 + h0 - 2 * g1 - 2)];
            if (ni >= t1 + g3 + 17)
              private_A[1][0] = A[(t1 + g3 + 16) * nj + (-2 * t0 + h0 - 2 * g1 - 2)];
          }
          if (2 * h0 >= 5 * t0 + 5 * g1 + 5 && ni >= t1 + g3 + 1 && nj + 2 * t0 + 2 * g1 + 1 >= h0 && 3 * t0 + 3 * g1 + 2 >= h0) {
            private_A[0][0] = (private_A[0][0] - (private_Q[0][0] * R[(3 * t0 - h0 + 3 * g1 + 2) * nj + (-2 * t0 + h0 - 2 * g1 - 2)]));
            if (ni >= t1 + g3 + 17)
              private_A[1][0] = (private_A[1][0] - (private_Q[1][0] * R[(3 * t0 - h0 + 3 * g1 + 2) * nj + (-2 * t0 + h0 - 2 * g1 - 2)]));
          }
          barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
          if (2 * h0 >= 5 * t0 + 5 * g1 + 5 && ni >= t1 + g3 + 1 && nj + 2 * t0 + 2 * g1 + 1 >= h0 && 3 * t0 + 3 * g1 + 2 >= h0) {
            A[(t1 + g3) * nj + (-2 * t0 + h0 - 2 * g1 - 2)] = private_A[0][0];
            if (ni >= t1 + g3 + 17)
              A[(t1 + g3 + 16) * nj + (-2 * t0 + h0 - 2 * g1 - 2)] = private_A[1][0];
          }
          barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        }
}

