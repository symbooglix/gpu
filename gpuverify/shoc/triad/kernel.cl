//pass
//--num_groups=128 --local_size=128

__kernel void Triad(__global const float *memA,
__global const float *memB, __global float *memC,
const float s)
{
    int gid = get_global_id(0);
    memC[gid] = memA[gid] + s*memB[gid];
}
