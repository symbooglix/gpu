//pass
//--num_groups=[32,32] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel3(__global double *data, __global double *mean, int m, int n)
{
    __requires(m == 1024);
    __requires(n == 1024);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);
    __local double shared_mean[32];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    for (int g1 = 32 * b0; g1 < n; g1 += 8192)
      for (int g3 = 32 * b1; g3 < m; g3 += 8192) {
        if (t0 == 0)
          for (int c1 = t1; c1 <= min(m - g3 - 1, 31); c1 += 16)
            shared_mean[c1] = mean[g3 + c1];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (n >= t0 + g1 + 1)
          for (int c1 = t1; c1 <= min(31, m - g3 - 1); c1 += 16)
            data[(t0 + g1) * n + (g3 + c1)] -= shared_mean[c1];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

