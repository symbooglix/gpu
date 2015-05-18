//pass
//--num_groups=32 --local_size=32


#pragma OPENCL EXTENSION cl_khr_fp64 : enable

__kernel void kernel5(__global double *X, __global double *A, __global double *B, int n, int tsteps, int h0)
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
         __global_invariant(__implies(g1 < n, __enabled())),
         __global_invariant(__implies(__same_group, __no_read(shared_A))),
         __global_invariant(__implies(__same_group, __no_write(shared_A))),
         __global_invariant(__write_implies(X, (((__write_offset_bytes(X)/sizeof(double)) - t0) % n) == 32*b0)),
         __global_invariant(__read_implies(X, (((__read_offset_bytes(X)/sizeof(double)) - t0) % n) == 32*b0)),
         g1 < n; g1 += 1048576) {
      for (int g5 = 0;
           __global_invariant(__implies((g1 < n) & (g5 < n), __enabled())),
           __global_invariant(__implies(__same_group, __no_read(shared_A))),
           __global_invariant(__implies(__same_group, __no_write(shared_A))),
           __global_invariant(__write_implies(X, (((__write_offset_bytes(X)/sizeof(double)) - t0) % n) == 32*b0)),
           __global_invariant(__read_implies(X, (((__read_offset_bytes(X)/sizeof(double)) - t0) % n) == 32*b0)),
           g5 < n; g5 += 32) {
        if (n >= t0 + g1 + 1) {
          for (int c0 = 0;
               __global_invariant(__implies(__same_group & __write(shared_A), (g1 < n) & (g5 < n) & (n >= t0 + g1 + 1))),
               c0 <= min(31, n - g5 - 1); c0 += 1) {
            shared_A[c0][t0] = A[(g5 + c0) * n + (t0 + g1)];
          }
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (n >= t0 + g1 + 1) {
          for (int c2 = max(-g5 + 1, 0);
               __global_invariant(__implies(__same_group, __no_write(shared_A))),
               __global_invariant(__implies(__same_group & __read(shared_A), (g1 < n) & (g5 < n) & (n >= t0 + g1 + 1))),
               __global_invariant(__write_implies(X, (((__write_offset_bytes(X)/sizeof(double)) - t0) % n) == 32*b0)),
               __global_invariant(__read_implies(X, (((__read_offset_bytes(X)/sizeof(double)) - t0) % n) == 32*b0)),
               c2 <= min(31, n - g5 - 1); c2 += 1) {
            X[(g5 + c2) * n + (t0 + g1)] = (X[(g5 + c2) * n + (t0 + g1)] - ((X[(g5 + c2 - 1) * n + (t0 + g1)] * shared_A[c2][t0]) / B[(g5 + c2 - 1) * n + (t0 + g1)]));
          }
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
    }
}

