//pass
//--local_size=[256,1] --num_groups=[3907,1]

#pragma OPENCL EXTENSION cl_khr_byte_addressable_store: enable
//Structure to hold a node information
typedef struct{
	int starting;
	int no_of_edges;
} Node;

__kernel void BFS_2(__global char* g_graph_mask, 
					__global char* g_updating_graph_mask, 
					__global char* g_graph_visited, 
					__global char* g_over,
					const  int no_of_nodes
					) {
	int tid = get_global_id(0);
	if( tid<no_of_nodes && g_updating_graph_mask[tid]){

		g_graph_mask[tid]=true;
		g_graph_visited[tid]=true;
		*g_over=true;
		g_updating_graph_mask[tid]=false;
	}
}


