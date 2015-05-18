//pass
//--num_groups=128 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable


__kernel void kernel0(__global double *c, __global double *x, int n)
{
    __requires(n == 4096);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    for (int g1 = 32 * b0; g1 < n; g1 += 1048576) {
      if (n >= t0 + g1 + 1)
        x[t0 + g1] = c[t0 + g1];
      barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
    }
}

