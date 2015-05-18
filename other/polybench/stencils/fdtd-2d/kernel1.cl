//pass
//--num_groups=[32,32] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel1(__global double *hz, __global double *ey, int ny, int tmax, int nx, int h0)
{
    __requires(ny == 1024);
    __requires(nx == 1024);
    __requires(tmax == 32);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);
    double private_ey[1][2];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    for (int g1 = 32 * b0; g1 < nx; g1 += 8192)
      for (int g3 = 32 * b1; g3 < ny; g3 += 8192) {
        if (nx >= t0 + g1 + 1 && t0 + g1 >= 1 && ny >= t1 + g3 + 1) {
          private_ey[0][0] = ey[(t0 + g1) * ny + (t1 + g3)];
          if (ny >= t1 + g3 + 17)
            private_ey[0][1] = ey[(t0 + g1) * ny + (t1 + g3 + 16)];
        }
        if (nx >= t0 + g1 + 1 && t0 + g1 >= 1 && ny >= t1 + g3 + 1) {
          private_ey[0][0] = (private_ey[0][0] - (0.5 * (hz[(t0 + g1) * ny + (t1 + g3)] - hz[(t0 + g1 - 1) * ny + (t1 + g3)])));
          if (ny >= t1 + g3 + 17)
            private_ey[0][1] = (private_ey[0][1] - (0.5 * (hz[(t0 + g1) * ny + (t1 + g3 + 16)] - hz[(t0 + g1 - 1) * ny + (t1 + g3 + 16)])));
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (nx >= t0 + g1 + 1 && t0 + g1 >= 1 && ny >= t1 + g3 + 1) {
          ey[(t0 + g1) * ny + (t1 + g3)] = private_ey[0][0];
          if (ny >= t1 + g3 + 17)
            ey[(t0 + g1) * ny + (t1 + g3 + 16)] = private_ey[0][1];
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

