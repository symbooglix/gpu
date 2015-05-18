//pass
//--global_size=494080 --local_size=256

__kernel void
kmeans_swap(__global float  *feature,   
			__global float  *feature_swap,
			int     npoints,
			int     nfeatures
){
  __requires(npoints == 494020);

	unsigned int tid = get_global_id(0);
	for(int i = 0; i <  nfeatures; i++)
		feature_swap[i * npoints + tid] = feature[tid * nfeatures + i];

} 
