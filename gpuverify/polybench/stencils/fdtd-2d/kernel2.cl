//pass
//--num_groups=32 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel2(__global double *_fict_, __global double *ey, int ny, int tmax, int nx, int h0)
{
    __requires(ny == 1024);
    __requires(nx == 1024);
    __requires(tmax == 32);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    __local double shared__fict_[1];
    double private_ey[1][1];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    {
      if (t0 == 0)
        shared__fict_[0] = _fict_[h0];
      for (int g1 = 32 * b0; g1 < ny; g1 += 1048576) {
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (ny >= t0 + g1 + 1)
          private_ey[0][0] = shared__fict_[0];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (ny >= t0 + g1 + 1)
          ey[0 * ny + (t0 + g1)] = private_ey[0][0];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
    }
}

