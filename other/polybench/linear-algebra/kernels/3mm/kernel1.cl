//pass
//--num_groups=[32,32] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel1(__global double *E, int nl, int nm, int nj, int nk, int ni)
{
    __requires(nm == 1024);
    __requires(nl == 1024);
    __requires(nk == 1024);
    __requires(nj == 1024);
    __requires(ni == 1024);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    for (int g1 = 32 * b0; g1 < ni; g1 += 8192)
      for (int g3 = 32 * b1; g3 < nj; g3 += 8192) {
        if (ni >= t0 + g1 + 1)
          for (int c1 = t1; c1 <= min(31, nj - g3 - 1); c1 += 16)
            E[(t0 + g1) * nj + (g3 + c1)] = (0);
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

