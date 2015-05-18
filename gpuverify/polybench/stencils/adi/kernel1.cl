//pass
//--num_groups=32 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel1(__global double *X, __global double *A, __global double *B, int n, int tsteps, int h0)
{
    __requires(tsteps == 32);
    __requires(n == 1024);
    int b0 = get_group_id(0);
    int t0 = get_local_id(0);
    __local double shared_A[32][32];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    #define min(x,y)    ((x) < (y) ? (x) : (y))
    #define max(x,y)    ((x) > (y) ? (x) : (y))
    for (int g1 = 32 * b0;
         __global_invariant(__implies(__same_group, __no_write(shared_A))),
         __global_invariant(__implies(__same_group, __no_read(shared_A))),
         __global_invariant(__implies(g1 < n, __enabled())),
         __global_invariant(__write_implies(X, (((__write_offset_bytes(X)/sizeof(double))/n - t0) % 1048576) == 32 * b0)),
         __global_invariant(__read_implies(X, (((__read_offset_bytes(X)/sizeof(double))/n - t0) % 1048576) == 32 * b0)),
         g1 < n; g1 += 1048576)
      for (int g5 = 0;
           __global_invariant(__implies(__same_group, __no_write(shared_A))),
           __global_invariant(__implies(__same_group, __no_read(shared_A))),
           __global_invariant(__implies((g1 < n) & (g5 < n), __enabled())),
           __global_invariant(__write_implies(X, (((__write_offset_bytes(X)/sizeof(double))/n - t0) % 1048576) == 32 * b0)),
           __global_invariant(__read_implies(X, (((__read_offset_bytes(X)/sizeof(double))/n - t0) % 1048576) == 32 * b0)),
           __invariant(g5 <= n - 1 + 32),
           g5 < n; g5 += 32) {
        if (n >= t0 + g5 + 1) {
          for (int c0 = 0;
               __global_invariant(__implies(__same_group & __write(shared_A), (g1 < n) & (g5 < n) & (n >= t0 + g5 + 1))),
               c0 <= min(31, n - g1 - 1); c0 += 1) {
            shared_A[c0][t0] = A[(g1 + c0) * n + (t0 + g5)];
          }
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (n >= t0 + g1 + 1) {
          for (int c2 = max(-g5 + 1, 0);
               #define __inv_max(x,y)    __ite((x) > (y), (x), (y))
               __invariant(c2 >= __inv_max(-g5 + 1, 0)), 
               __global_invariant(__write_implies(X, (((__write_offset_bytes(X)/sizeof(double))/n - t0) % 1048576) == 32 * b0)),
               __global_invariant(__read_implies(X, (((__read_offset_bytes(X)/sizeof(double))/n - t0) % 1048576) == 32 * b0)),
               __global_invariant(__implies(__same_group & __read(shared_A), (g1 < n) & (g5 < n) & (n >= t0 + g1 + 1))),
               c2 <= min(31, n - g5 - 1); c2 += 1) {
              X[(t0 + g1) * n + (g5 + c2)] = (X[(t0 + g1) * n + (g5 + c2)] - ((X[(t0 + g1) * n + (g5 + c2 - 1)] * shared_A[t0][c2] ) / B[(t0 + g1) * n + (g5 + c2 - 1)]));
          }
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

