//pass
//--num_groups=[128,128] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable


__kernel void kernel0(__global double *v2, __global double *u2, __global double *u1, __global double *v1, __global double *A, int n)
{
    __requires(n == 4096);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);
    __local double shared_v2[32];
    __local double shared_u2[32];
    __local double shared_u1[32];
    __local double shared_v1[32];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    for (int g1 = 32 * b0; g1 < n; g1 += 8192) {
      if (t0 == 0)
        for (int c1 = t1; c1 <= min(n - g1 - 1, 31); c1 += 16)
          shared_u1[c1] = u1[g1 + c1];
      if (t0 == 0)
        for (int c1 = t1; c1 <= min(n - g1 - 1, 31); c1 += 16)
          shared_u2[c1] = u2[g1 + c1];
      for (int g3 = 32 * b1; g3 < n; g3 += 8192) {
        if (t0 == 0)
          for (int c1 = t1; c1 <= min(31, n - g3 - 1); c1 += 16)
            shared_v1[c1] = v1[g3 + c1];
        if (t0 == 0)
          for (int c1 = t1; c1 <= min(31, n - g3 - 1); c1 += 16)
            shared_v2[c1] = v2[g3 + c1];
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (n >= t0 + g1 + 1)
          for (int c1 = t1; c1 <= min(n - g3 - 1, 31); c1 += 16)
            A[(t0 + g1) * n + (g3 + c1)] = ((A[(t0 + g1) * n + (g3 + c1)] + (shared_u1[t0] * shared_v1[c1])) + (shared_u2[t0] * shared_v2[c1]));
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
    }
}

