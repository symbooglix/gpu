//pass
//--num_groups=[16,16] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel1(__global double *R, int nj, int ni)
{
    __requires(nj == 512);
    __requires(ni == 512);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    #define max(x,y)    ((x) > (y) ? (x) : (y))
    for (int g1 = 32 * b0; g1 < nj - 1; g1 += 8192)
      for (int g3 = 32 * b1 + 8192 * floord(-32 * b1 + g1 - 1, 8192) + 8192; g3 < nj; g3 += 8192) {
        for (int c1 = max(t1 + 16 * floord(t0 - t1 + g1 - g3, 16) + 16, t1); c1 <= min(31, nj - g3 - 1); c1 += 16)
          R[(t0 + g1) * nj + (g3 + c1)] = (0);
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

