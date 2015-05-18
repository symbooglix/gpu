//pass
//--num_groups=[32,32] --local_size=[32,16]


#pragma OPENCL EXTENSION cl_khr_fp64 : enable


__kernel void kernel0(__global double *B, __global double *A, int n, int tsteps, int h0)
{
    __requires(tsteps == 16);
    __requires(n == 1024);
    int b0 = get_group_id(0), b1 = get_group_id(1);
    int t0 = get_local_id(0), t1 = get_local_id(1);
    double private_B[1][2];

        #define floord(n,d) (((n)<0) ? -((-(n)+(d)-1)/(d)) : (n)/(d))
    for (int g1 = 32 * b0;
           __global_invariant(__write_implies(B, (((__write_offset_bytes(B)/sizeof(double)) / n) % 8192) == 32*b0 + t0)),
           __global_invariant(__write_implies(B,
                              ((((__write_offset_bytes(B)/sizeof(double)) % n) % 8192) == 32*b1 + t1) |
                              ((((__write_offset_bytes(B)/sizeof(double)) % n) % 8192) == 32*b1 + t1 + 16)
           )),
         g1 < n - 1; g1 += 8192)
      for (int g3 = 32 * b1;
           __global_invariant(__write_implies(B, (((__write_offset_bytes(B)/sizeof(double)) / n) % 8192) == 32*b0 + t0)),
           __global_invariant(__write_implies(B,
                              ((((__write_offset_bytes(B)/sizeof(double)) % n) % 8192) == 32*b1 + t1) |
                              ((((__write_offset_bytes(B)/sizeof(double)) % n) % 8192) == 32*b1 + t1 + 16)
           )),
           g3 < n - 1; g3 += 8192) {
        if (t0 + g1 >= 1 && n >= t1 + g3 + 2 && n >= t0 + g1 + 2) {
          if (t1 + g3 >= 1)
            private_B[0][0] = (0.2 * ((((A[(t0 + g1) * n + (t1 + g3)] + A[(t0 + g1) * n + (t1 + g3 - 1)]) + A[(t0 + g1) * n + (t1 + g3 + 1)]) + A[(t0 + g1 + 1) * n + (t1 + g3)]) + A[(t0 + g1 - 1) * n + (t1 + g3)]));
          if (n >= t1 + g3 + 18)
            private_B[0][1] = (0.2 * ((((A[(t0 + g1) * n + (t1 + g3 + 16)] + A[(t0 + g1) * n + (t1 + g3 + 15)]) + A[(t0 + g1) * n + (t1 + g3 + 17)]) + A[(t0 + g1 + 1) * n + (t1 + g3 + 16)]) + A[(t0 + g1 - 1) * n + (t1 + g3 + 16)]));
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
        if (t0 + g1 >= 1 && n >= t1 + g3 + 2 && n >= t0 + g1 + 2) {
          if (t1 + g3 >= 1)
            B[(t0 + g1) * n + (t1 + g3)] = private_B[0][0];
          if (n >= t1 + g3 + 18)
            B[(t0 + g1) * n + (t1 + g3 + 16)] = private_B[0][1];
        }
        barrier(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
      }
}

