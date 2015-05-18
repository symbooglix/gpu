//pass
//--num_groups=128 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable


__kernel void kernel0(__global double *x, __global double *tmp, __global double *A, int ny, int nx)
{
    __requires(ny == 4096);
    __requires(nx == 4096);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    __local double shared_x[32];
    double private_tmp[1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    for (int g1 = 32 * b0; g1 < nx; g1 += 1048576) {
      if (ny >= 1)
        if (nx >= t0 + g1 + 1)
          private_tmp[0] = tmp[t0 + g1];
      for (int g5 = 0; g5 <= (ny >= 1 ? ny - 1 : 0); g5 += 32) {
        if (ny >= g5 + 1)
          if (ny >= t0 + g5 + 1)
            shared_x[t0] = x[t0 + g5];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (g5 == 0 && nx >= t0 + g1 + 1)
          private_tmp[0] = (0);
        if (nx >= t0 + g1 + 1)
          for (int c2 = 0; c2 <= min(31, ny - g5 - 1); c2 += 1)
            private_tmp[0] = (private_tmp[0] + (A[(t0 + g1) * ny + (g5 + c2)] * shared_x[c2]));
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
      if (nx >= t0 + g1 + 1)
        tmp[t0 + g1] = private_tmp[0];
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

