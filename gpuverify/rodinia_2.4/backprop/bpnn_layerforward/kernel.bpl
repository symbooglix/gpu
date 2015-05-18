type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$input_cuda"} {:global} {:elem_width 32} {:source_name "input_cuda"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input_cuda: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input_cuda: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input_cuda: bool;

axiom {:array_info "$$output_hidden_cuda"} {:global} {:elem_width 32} {:source_name "output_hidden_cuda"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output_hidden_cuda: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output_hidden_cuda: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output_hidden_cuda: bool;

var {:source_name "input_hidden_cuda"} {:global} $$input_hidden_cuda: [bv32]bv32;

axiom {:array_info "$$input_hidden_cuda"} {:global} {:elem_width 32} {:source_name "input_hidden_cuda"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input_hidden_cuda: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input_hidden_cuda: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input_hidden_cuda: bool;

var {:source_name "hidden_partial_sum"} {:global} $$hidden_partial_sum: [bv32]bv32;

axiom {:array_info "$$hidden_partial_sum"} {:global} {:elem_width 32} {:source_name "hidden_partial_sum"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$hidden_partial_sum: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$hidden_partial_sum: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$hidden_partial_sum: bool;

var {:source_name "input_node"} {:group_shared} $$input_node: [bv1][bv32]bv32;

axiom {:array_info "$$input_node"} {:group_shared} {:elem_width 32} {:source_name "input_node"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input_node: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input_node: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input_node: bool;

var {:source_name "weight_matrix"} {:group_shared} $$weight_matrix: [bv1][bv32]bv32;

axiom {:array_info "$$weight_matrix"} {:group_shared} {:elem_width 32} {:source_name "weight_matrix"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$weight_matrix: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$weight_matrix: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$weight_matrix: bool;

const _WATCHED_OFFSET: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_size_x} group_size_x: bv32;

const {:group_size_y} group_size_y: bv32;

const {:group_size_z} group_size_z: bv32;

const {:local_id_x} local_id_x$1: bv32;

const {:local_id_x} local_id_x$2: bv32;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function FADD32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

procedure {:source_name "bpnn_layerforward_ocl"} {:kernel} $bpnn_layerforward_ocl($in: bv32, $hid: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $in == 65536bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $hid == 16bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$input_cuda && !_WRITE_HAS_OCCURRED_$$input_cuda && !_ATOMIC_HAS_OCCURRED_$$input_cuda;
  requires !_READ_HAS_OCCURRED_$$output_hidden_cuda && !_WRITE_HAS_OCCURRED_$$output_hidden_cuda && !_ATOMIC_HAS_OCCURRED_$$output_hidden_cuda;
  requires !_READ_HAS_OCCURRED_$$input_hidden_cuda && !_WRITE_HAS_OCCURRED_$$input_hidden_cuda && !_ATOMIC_HAS_OCCURRED_$$input_hidden_cuda;
  requires !_READ_HAS_OCCURRED_$$hidden_partial_sum && !_WRITE_HAS_OCCURRED_$$hidden_partial_sum && !_ATOMIC_HAS_OCCURRED_$$hidden_partial_sum;
  requires !_READ_HAS_OCCURRED_$$input_node && !_WRITE_HAS_OCCURRED_$$input_node && !_ATOMIC_HAS_OCCURRED_$$input_node;
  requires !_READ_HAS_OCCURRED_$$weight_matrix && !_WRITE_HAS_OCCURRED_$$weight_matrix && !_ATOMIC_HAS_OCCURRED_$$weight_matrix;
  requires BV32_SGT(group_size_x, 0bv32);
  requires BV32_SGT(num_groups_x, 0bv32);
  requires BV32_SGE(group_id_x$1, 0bv32);
  requires BV32_SGE(group_id_x$2, 0bv32);
  requires BV32_SLT(group_id_x$1, num_groups_x);
  requires BV32_SLT(group_id_x$2, num_groups_x);
  requires BV32_SGE(local_id_x$1, 0bv32);
  requires BV32_SGE(local_id_x$2, 0bv32);
  requires BV32_SLT(local_id_x$1, group_size_x);
  requires BV32_SLT(local_id_x$2, group_size_x);
  requires BV32_SGT(group_size_y, 0bv32);
  requires BV32_SGT(num_groups_y, 0bv32);
  requires BV32_SGE(group_id_y$1, 0bv32);
  requires BV32_SGE(group_id_y$2, 0bv32);
  requires BV32_SLT(group_id_y$1, num_groups_y);
  requires BV32_SLT(group_id_y$2, num_groups_y);
  requires BV32_SGE(local_id_y$1, 0bv32);
  requires BV32_SGE(local_id_y$2, 0bv32);
  requires BV32_SLT(local_id_y$1, group_size_y);
  requires BV32_SLT(local_id_y$2, group_size_y);
  requires BV32_SGT(group_size_z, 0bv32);
  requires BV32_SGT(num_groups_z, 0bv32);
  requires BV32_SGE(group_id_z$1, 0bv32);
  requires BV32_SGE(group_id_z$2, 0bv32);
  requires BV32_SLT(group_id_z$1, num_groups_z);
  requires BV32_SLT(group_id_z$2, num_groups_z);
  requires BV32_SGE(local_id_z$1, 0bv32);
  requires BV32_SGE(local_id_z$2, 0bv32);
  requires BV32_SLT(local_id_z$1, group_size_z);
  requires BV32_SLT(local_id_z$2, group_size_z);
  requires group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> local_id_x$1 != local_id_x$2 || local_id_y$1 != local_id_y$2 || local_id_z$1 != local_id_z$2;
  modifies $$input_node, $$weight_matrix, _WRITE_HAS_OCCURRED_$$input_node, _WRITE_READ_BENIGN_FLAG_$$input_node, _WRITE_READ_BENIGN_FLAG_$$input_node, $$input_hidden_cuda, $$hidden_partial_sum, _TRACKING, _READ_HAS_OCCURRED_$$input_hidden_cuda, _WRITE_HAS_OCCURRED_$$weight_matrix, _WRITE_READ_BENIGN_FLAG_$$weight_matrix, _WRITE_READ_BENIGN_FLAG_$$weight_matrix, _TRACKING, _READ_HAS_OCCURRED_$$weight_matrix, _READ_HAS_OCCURRED_$$input_node, _TRACKING, _WRITE_HAS_OCCURRED_$$input_hidden_cuda, _WRITE_READ_BENIGN_FLAG_$$input_hidden_cuda, _WRITE_READ_BENIGN_FLAG_$$input_hidden_cuda, _TRACKING, _WRITE_HAS_OCCURRED_$$hidden_partial_sum, _WRITE_READ_BENIGN_FLAG_$$hidden_partial_sum, _WRITE_READ_BENIGN_FLAG_$$hidden_partial_sum, _TRACKING;



implementation {:source_name "bpnn_layerforward_ocl"} {:kernel} $bpnn_layerforward_ocl($in: bv32, $hid: bv32)
{
  var $i.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v15$1: bool;
  var v15$2: bool;
  var v10: bool;
  var v11$1: bool;
  var v11$2: bool;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;
  var p4$1: bool;
  var p4$2: bool;
  var p5$1: bool;
  var p5$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  __partitioned_block_$0_0:
    v0$1 := group_id_y$1;
    v0$2 := group_id_y$2;
    v1$1 := local_id_x$1;
    v1$2 := local_id_x$2;
    v2$1 := local_id_y$1;
    v2$2 := local_id_y$2;
    v3$1 := BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD($hid, 1bv32), 16bv32), v0$1), BV32_MUL(BV32_ADD($hid, 1bv32), v2$1)), v1$1), 1bv32), BV32_ADD($hid, 1bv32));
    v3$2 := BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD($hid, 1bv32), 16bv32), v0$2), BV32_MUL(BV32_ADD($hid, 1bv32), v2$2)), v1$2), 1bv32), BV32_ADD($hid, 1bv32));
    v4$1 := BV32_ADD(BV32_ADD(BV32_MUL(16bv32, v0$1), v2$1), 1bv32);
    v4$2 := BV32_ADD(BV32_ADD(BV32_MUL(16bv32, v0$2), v2$2), 1bv32);
    v5$1 := v1$1 == 0bv32;
    v5$2 := v1$2 == 0bv32;
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v5$1 then v5$1 else p0$1);
    p0$2 := (if v5$2 then v5$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v6$1 := (if p0$1 then _HAVOC_bv32$1 else v6$1);
    v6$2 := (if p0$2 then _HAVOC_bv32$2 else v6$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$input_node(p0$1, v2$1, v6$1, $$input_node[1bv1][v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_node(p0$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$input_node(p0$2, v2$2, v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$input_node"} true;
    $$input_node[1bv1][v2$1] := (if p0$1 then v6$1 else $$input_node[1bv1][v2$1]);
    $$input_node[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2] := (if p0$2 then v6$2 else $$input_node[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2]);
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 7} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$input_hidden_cuda(true, v3$1, $$input_hidden_cuda[v3$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$input_hidden_cuda(true, v3$2, $$input_hidden_cuda[v3$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$input_hidden_cuda"} true;
    v7$1 := $$input_hidden_cuda[v3$1];
    v7$2 := $$input_hidden_cuda[v3$2];
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$weight_matrix(true, BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1), v7$1, $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$weight_matrix(true, BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$weight_matrix(true, BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2), v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$weight_matrix"} true;
    $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1)] := v7$1;
    $$weight_matrix[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2)] := v7$2;
    goto __partitioned_block_$0_2;

  __partitioned_block_$0_2:
    call {:sourceloc_num 10} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$weight_matrix(true, BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1), $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$weight_matrix(true, BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2), $$weight_matrix[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$weight_matrix"} true;
    v8$1 := $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1)];
    v8$2 := $$weight_matrix[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2)];
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 12} true;
    v9$1 := $$input_node[1bv1][v2$1];
    v9$2 := $$input_node[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2];
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$weight_matrix(true, BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1), FMUL32(v8$1, v9$1), $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$weight_matrix(true, BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$weight_matrix(true, BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2), FMUL32(v8$2, v9$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$weight_matrix"} true;
    $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1)] := FMUL32(v8$1, v9$1);
    $$weight_matrix[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2)] := FMUL32(v8$2, v9$2);
    goto __partitioned_block_$0_3;

  __partitioned_block_$0_3:
    call {:sourceloc_num 14} $bugle_barrier_duplicated_2(1bv1, 0bv1);
    $i.0 := 1bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b10 ==> _WRITE_HAS_OCCURRED_$$weight_matrix ==> _WATCHED_OFFSET == BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b9 ==> _READ_HAS_OCCURRED_$$weight_matrix ==> _WATCHED_OFFSET == BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, local_id_y$1), 16bv32), local_id_x$1));
    assert {:tag "nowrite"} _b8 ==> !_WRITE_HAS_OCCURRED_$$weight_matrix;
    assert {:tag "noread"} _b7 ==> !_READ_HAS_OCCURRED_$$weight_matrix;
    assert {:tag "pow2NotZero"} _b6 ==> $i.0 != 0bv32;
    assert {:tag "pow2"} _b5 ==> $i.0 == 0bv32 || BV32_AND($i.0, BV32_SUB($i.0, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$weight_matrix ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$weight_matrix ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$weight_matrix ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$input_node ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$input_node ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$input_node ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($i.0, 1bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $i.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $i.0);
    assert {:block_sourceloc} {:sourceloc_num 15} true;
    v10 := BV32_SLE($i.0, 16bv32);
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    goto __partitioned_block_$truebb0_0, __partitioned_block_$falsebb0_0;

  __partitioned_block_$falsebb0_0:
    assume {:partition} !v10 && !v10;
    call {:sourceloc} {:sourceloc_num 25} _LOG_READ_$$weight_matrix(true, BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1), $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 25} _CHECK_READ_$$weight_matrix(true, BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2), $$weight_matrix[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$weight_matrix"} true;
    v14$1 := $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1)];
    v14$2 := $$weight_matrix[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2)];
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$input_hidden_cuda(true, v3$1, v14$1, $$input_hidden_cuda[v3$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_hidden_cuda(true, v3$2);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$input_hidden_cuda(true, v3$2, v14$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$input_hidden_cuda"} true;
    $$input_hidden_cuda[v3$1] := v14$1;
    $$input_hidden_cuda[v3$2] := v14$2;
    goto __partitioned_block_$falsebb0_1;

  __partitioned_block_$falsebb0_1:
    call {:sourceloc_num 27} $bugle_barrier_duplicated_3(1bv1, 0bv1);
    v15$1 := v1$1 == 0bv32;
    v15$2 := v1$2 == 0bv32;
    p4$1 := (if v15$1 then v15$1 else p4$1);
    p4$2 := (if v15$2 then v15$2 else p4$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_READ_$$weight_matrix(p4$1, BV32_ADD(BV32_MUL(v1$1, 16bv32), v2$1), $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v1$1, 16bv32), v2$1)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 29} _CHECK_READ_$$weight_matrix(p4$2, BV32_ADD(BV32_MUL(v1$2, 16bv32), v2$2), $$weight_matrix[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, 16bv32), v2$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$weight_matrix"} true;
    v16$1 := (if p4$1 then $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v1$1, 16bv32), v2$1)] else v16$1);
    v16$2 := (if p4$2 then $$weight_matrix[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, 16bv32), v2$2)] else v16$2);
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$hidden_partial_sum(p4$1, BV32_ADD(BV32_MUL(v0$1, $hid), v2$1), v16$1, $$hidden_partial_sum[BV32_ADD(BV32_MUL(v0$1, $hid), v2$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$hidden_partial_sum(p4$2, BV32_ADD(BV32_MUL(v0$2, $hid), v2$2));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$hidden_partial_sum(p4$2, BV32_ADD(BV32_MUL(v0$2, $hid), v2$2), v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$hidden_partial_sum"} true;
    $$hidden_partial_sum[BV32_ADD(BV32_MUL(v0$1, $hid), v2$1)] := (if p4$1 then v16$1 else $$hidden_partial_sum[BV32_ADD(BV32_MUL(v0$1, $hid), v2$1)]);
    $$hidden_partial_sum[BV32_ADD(BV32_MUL(v0$2, $hid), v2$2)] := (if p4$2 then v16$2 else $$hidden_partial_sum[BV32_ADD(BV32_MUL(v0$2, $hid), v2$2)]);
    return;

  __partitioned_block_$truebb0_0:
    assume {:partition} v10 && v10;
    v11$1 := BV32_SREM(v2$1, $i.0) == 0bv32;
    v11$2 := BV32_SREM(v2$2, $i.0) == 0bv32;
    p3$1 := (if v11$1 then v11$1 else p3$1);
    p3$2 := (if v11$2 then v11$2 else p3$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_READ_$$weight_matrix(p3$1, BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1), $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1)]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 18} _CHECK_READ_$$weight_matrix(p3$2, BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2), $$weight_matrix[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$weight_matrix"} true;
    v12$1 := (if p3$1 then $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1)] else v12$1);
    v12$2 := (if p3$2 then $$weight_matrix[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2)] else v12$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$weight_matrix(p3$1, BV32_ADD(BV32_MUL(BV32_ADD(v2$1, BV32_SDIV($i.0, 2bv32)), 16bv32), v1$1), $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v2$1, BV32_SDIV($i.0, 2bv32)), 16bv32), v1$1)]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$weight_matrix(p3$2, BV32_ADD(BV32_MUL(BV32_ADD(v2$2, BV32_SDIV($i.0, 2bv32)), 16bv32), v1$2), $$weight_matrix[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v2$2, BV32_SDIV($i.0, 2bv32)), 16bv32), v1$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$weight_matrix"} true;
    v13$1 := (if p3$1 then $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v2$1, BV32_SDIV($i.0, 2bv32)), 16bv32), v1$1)] else v13$1);
    v13$2 := (if p3$2 then $$weight_matrix[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v2$2, BV32_SDIV($i.0, 2bv32)), 16bv32), v1$2)] else v13$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$weight_matrix(p3$1, BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1), FADD32(v12$1, v13$1), $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$weight_matrix(p3$2, BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$weight_matrix(p3$2, BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2), FADD32(v12$2, v13$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$weight_matrix"} true;
    $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1)] := (if p3$1 then FADD32(v12$1, v13$1) else $$weight_matrix[1bv1][BV32_ADD(BV32_MUL(v2$1, 16bv32), v1$1)]);
    $$weight_matrix[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2)] := (if p3$2 then FADD32(v12$2, v13$2) else $$weight_matrix[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 16bv32), v1$2)]);
    goto __partitioned_block_$truebb0_1;

  __partitioned_block_$truebb0_1:
    call {:sourceloc_num 22} $bugle_barrier_duplicated_4(1bv1, 0bv1);
    $i.0 := BV32_MUL($i.0, 2bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $3;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 4096bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$input_node, $$weight_matrix, $$input_hidden_cuda, $$hidden_partial_sum, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$input_node, $$weight_matrix, $$input_hidden_cuda, $$hidden_partial_sum, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$input_node, $$weight_matrix, $$input_hidden_cuda, $$hidden_partial_sum, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_3($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$input_node, $$weight_matrix, $$input_hidden_cuda, $$hidden_partial_sum, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_4($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$input_node, $$weight_matrix, $$input_hidden_cuda, $$hidden_partial_sum, _TRACKING;



const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

const _WATCHED_VALUE_$$input_cuda: bv32;

procedure {:inline 1} _LOG_READ_$$input_cuda(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$input_cuda;



implementation {:inline 1} _LOG_READ_$$input_cuda(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$input_cuda := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_cuda == _value then true else _READ_HAS_OCCURRED_$$input_cuda);
    return;
}



procedure _CHECK_READ_$$input_cuda(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input_cuda"} {:array "$$input_cuda"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$input_cuda && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$input_cuda);
  requires {:source_name "input_cuda"} {:array "$$input_cuda"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$input_cuda && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$input_cuda: bool;

procedure {:inline 1} _LOG_WRITE_$$input_cuda(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$input_cuda, _WRITE_READ_BENIGN_FLAG_$$input_cuda;



implementation {:inline 1} _LOG_WRITE_$$input_cuda(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$input_cuda := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_cuda == _value then true else _WRITE_HAS_OCCURRED_$$input_cuda);
    _WRITE_READ_BENIGN_FLAG_$$input_cuda := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_cuda == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$input_cuda);
    return;
}



procedure _CHECK_WRITE_$$input_cuda(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input_cuda"} {:array "$$input_cuda"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$input_cuda && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_cuda != _value);
  requires {:source_name "input_cuda"} {:array "$$input_cuda"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$input_cuda && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_cuda != _value);
  requires {:source_name "input_cuda"} {:array "$$input_cuda"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$input_cuda && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$input_cuda(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$input_cuda;



implementation {:inline 1} _LOG_ATOMIC_$$input_cuda(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$input_cuda := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$input_cuda);
    return;
}



procedure _CHECK_ATOMIC_$$input_cuda(_P: bool, _offset: bv32);
  requires {:source_name "input_cuda"} {:array "$$input_cuda"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$input_cuda && _WATCHED_OFFSET == _offset);
  requires {:source_name "input_cuda"} {:array "$$input_cuda"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$input_cuda && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_cuda(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$input_cuda;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_cuda(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$input_cuda := (if _P && _WRITE_HAS_OCCURRED_$$input_cuda && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$input_cuda);
    return;
}



const _WATCHED_VALUE_$$output_hidden_cuda: bv32;

procedure {:inline 1} _LOG_READ_$$output_hidden_cuda(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$output_hidden_cuda;



implementation {:inline 1} _LOG_READ_$$output_hidden_cuda(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$output_hidden_cuda := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output_hidden_cuda == _value then true else _READ_HAS_OCCURRED_$$output_hidden_cuda);
    return;
}



procedure _CHECK_READ_$$output_hidden_cuda(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "output_hidden_cuda"} {:array "$$output_hidden_cuda"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$output_hidden_cuda && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$output_hidden_cuda);
  requires {:source_name "output_hidden_cuda"} {:array "$$output_hidden_cuda"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$output_hidden_cuda && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$output_hidden_cuda: bool;

procedure {:inline 1} _LOG_WRITE_$$output_hidden_cuda(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$output_hidden_cuda, _WRITE_READ_BENIGN_FLAG_$$output_hidden_cuda;



implementation {:inline 1} _LOG_WRITE_$$output_hidden_cuda(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$output_hidden_cuda := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output_hidden_cuda == _value then true else _WRITE_HAS_OCCURRED_$$output_hidden_cuda);
    _WRITE_READ_BENIGN_FLAG_$$output_hidden_cuda := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output_hidden_cuda == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$output_hidden_cuda);
    return;
}



procedure _CHECK_WRITE_$$output_hidden_cuda(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "output_hidden_cuda"} {:array "$$output_hidden_cuda"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$output_hidden_cuda && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output_hidden_cuda != _value);
  requires {:source_name "output_hidden_cuda"} {:array "$$output_hidden_cuda"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$output_hidden_cuda && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output_hidden_cuda != _value);
  requires {:source_name "output_hidden_cuda"} {:array "$$output_hidden_cuda"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$output_hidden_cuda && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$output_hidden_cuda(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$output_hidden_cuda;



implementation {:inline 1} _LOG_ATOMIC_$$output_hidden_cuda(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$output_hidden_cuda := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$output_hidden_cuda);
    return;
}



procedure _CHECK_ATOMIC_$$output_hidden_cuda(_P: bool, _offset: bv32);
  requires {:source_name "output_hidden_cuda"} {:array "$$output_hidden_cuda"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$output_hidden_cuda && _WATCHED_OFFSET == _offset);
  requires {:source_name "output_hidden_cuda"} {:array "$$output_hidden_cuda"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$output_hidden_cuda && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output_hidden_cuda(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$output_hidden_cuda;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output_hidden_cuda(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$output_hidden_cuda := (if _P && _WRITE_HAS_OCCURRED_$$output_hidden_cuda && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$output_hidden_cuda);
    return;
}



const _WATCHED_VALUE_$$input_hidden_cuda: bv32;

procedure {:inline 1} _LOG_READ_$$input_hidden_cuda(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$input_hidden_cuda;



implementation {:inline 1} _LOG_READ_$$input_hidden_cuda(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$input_hidden_cuda := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_hidden_cuda == _value then true else _READ_HAS_OCCURRED_$$input_hidden_cuda);
    return;
}



procedure _CHECK_READ_$$input_hidden_cuda(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input_hidden_cuda"} {:array "$$input_hidden_cuda"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$input_hidden_cuda && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$input_hidden_cuda);
  requires {:source_name "input_hidden_cuda"} {:array "$$input_hidden_cuda"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$input_hidden_cuda && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$input_hidden_cuda: bool;

procedure {:inline 1} _LOG_WRITE_$$input_hidden_cuda(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$input_hidden_cuda, _WRITE_READ_BENIGN_FLAG_$$input_hidden_cuda;



implementation {:inline 1} _LOG_WRITE_$$input_hidden_cuda(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$input_hidden_cuda := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_hidden_cuda == _value then true else _WRITE_HAS_OCCURRED_$$input_hidden_cuda);
    _WRITE_READ_BENIGN_FLAG_$$input_hidden_cuda := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_hidden_cuda == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$input_hidden_cuda);
    return;
}



procedure _CHECK_WRITE_$$input_hidden_cuda(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input_hidden_cuda"} {:array "$$input_hidden_cuda"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$input_hidden_cuda && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_hidden_cuda != _value);
  requires {:source_name "input_hidden_cuda"} {:array "$$input_hidden_cuda"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$input_hidden_cuda && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_hidden_cuda != _value);
  requires {:source_name "input_hidden_cuda"} {:array "$$input_hidden_cuda"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$input_hidden_cuda && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$input_hidden_cuda(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$input_hidden_cuda;



implementation {:inline 1} _LOG_ATOMIC_$$input_hidden_cuda(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$input_hidden_cuda := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$input_hidden_cuda);
    return;
}



procedure _CHECK_ATOMIC_$$input_hidden_cuda(_P: bool, _offset: bv32);
  requires {:source_name "input_hidden_cuda"} {:array "$$input_hidden_cuda"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$input_hidden_cuda && _WATCHED_OFFSET == _offset);
  requires {:source_name "input_hidden_cuda"} {:array "$$input_hidden_cuda"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$input_hidden_cuda && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_hidden_cuda(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$input_hidden_cuda;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_hidden_cuda(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$input_hidden_cuda := (if _P && _WRITE_HAS_OCCURRED_$$input_hidden_cuda && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$input_hidden_cuda);
    return;
}



const _WATCHED_VALUE_$$hidden_partial_sum: bv32;

procedure {:inline 1} _LOG_READ_$$hidden_partial_sum(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$hidden_partial_sum;



implementation {:inline 1} _LOG_READ_$$hidden_partial_sum(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$hidden_partial_sum := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$hidden_partial_sum == _value then true else _READ_HAS_OCCURRED_$$hidden_partial_sum);
    return;
}



procedure _CHECK_READ_$$hidden_partial_sum(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "hidden_partial_sum"} {:array "$$hidden_partial_sum"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$hidden_partial_sum && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$hidden_partial_sum);
  requires {:source_name "hidden_partial_sum"} {:array "$$hidden_partial_sum"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$hidden_partial_sum && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$hidden_partial_sum: bool;

procedure {:inline 1} _LOG_WRITE_$$hidden_partial_sum(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$hidden_partial_sum, _WRITE_READ_BENIGN_FLAG_$$hidden_partial_sum;



implementation {:inline 1} _LOG_WRITE_$$hidden_partial_sum(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$hidden_partial_sum := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$hidden_partial_sum == _value then true else _WRITE_HAS_OCCURRED_$$hidden_partial_sum);
    _WRITE_READ_BENIGN_FLAG_$$hidden_partial_sum := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$hidden_partial_sum == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$hidden_partial_sum);
    return;
}



procedure _CHECK_WRITE_$$hidden_partial_sum(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "hidden_partial_sum"} {:array "$$hidden_partial_sum"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$hidden_partial_sum && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$hidden_partial_sum != _value);
  requires {:source_name "hidden_partial_sum"} {:array "$$hidden_partial_sum"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$hidden_partial_sum && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$hidden_partial_sum != _value);
  requires {:source_name "hidden_partial_sum"} {:array "$$hidden_partial_sum"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$hidden_partial_sum && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$hidden_partial_sum(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$hidden_partial_sum;



implementation {:inline 1} _LOG_ATOMIC_$$hidden_partial_sum(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$hidden_partial_sum := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$hidden_partial_sum);
    return;
}



procedure _CHECK_ATOMIC_$$hidden_partial_sum(_P: bool, _offset: bv32);
  requires {:source_name "hidden_partial_sum"} {:array "$$hidden_partial_sum"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$hidden_partial_sum && _WATCHED_OFFSET == _offset);
  requires {:source_name "hidden_partial_sum"} {:array "$$hidden_partial_sum"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$hidden_partial_sum && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$hidden_partial_sum(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$hidden_partial_sum;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$hidden_partial_sum(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$hidden_partial_sum := (if _P && _WRITE_HAS_OCCURRED_$$hidden_partial_sum && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$hidden_partial_sum);
    return;
}



const _WATCHED_VALUE_$$input_node: bv32;

procedure {:inline 1} _LOG_READ_$$input_node(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$input_node;



implementation {:inline 1} _LOG_READ_$$input_node(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$input_node := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_node == _value then true else _READ_HAS_OCCURRED_$$input_node);
    return;
}



procedure _CHECK_READ_$$input_node(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input_node"} {:array "$$input_node"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$input_node && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$input_node && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "input_node"} {:array "$$input_node"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$input_node && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$input_node: bool;

procedure {:inline 1} _LOG_WRITE_$$input_node(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$input_node, _WRITE_READ_BENIGN_FLAG_$$input_node;



implementation {:inline 1} _LOG_WRITE_$$input_node(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$input_node := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_node == _value then true else _WRITE_HAS_OCCURRED_$$input_node);
    _WRITE_READ_BENIGN_FLAG_$$input_node := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_node == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$input_node);
    return;
}



procedure _CHECK_WRITE_$$input_node(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input_node"} {:array "$$input_node"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$input_node && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_node != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "input_node"} {:array "$$input_node"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$input_node && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_node != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "input_node"} {:array "$$input_node"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$input_node && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$input_node(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$input_node;



implementation {:inline 1} _LOG_ATOMIC_$$input_node(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$input_node := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$input_node);
    return;
}



procedure _CHECK_ATOMIC_$$input_node(_P: bool, _offset: bv32);
  requires {:source_name "input_node"} {:array "$$input_node"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$input_node && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "input_node"} {:array "$$input_node"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$input_node && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_node(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$input_node;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_node(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$input_node := (if _P && _WRITE_HAS_OCCURRED_$$input_node && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$input_node);
    return;
}



const _WATCHED_VALUE_$$weight_matrix: bv32;

procedure {:inline 1} _LOG_READ_$$weight_matrix(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$weight_matrix;



implementation {:inline 1} _LOG_READ_$$weight_matrix(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$weight_matrix := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weight_matrix == _value then true else _READ_HAS_OCCURRED_$$weight_matrix);
    return;
}



procedure _CHECK_READ_$$weight_matrix(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "weight_matrix"} {:array "$$weight_matrix"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$weight_matrix && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$weight_matrix && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "weight_matrix"} {:array "$$weight_matrix"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$weight_matrix && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$weight_matrix: bool;

procedure {:inline 1} _LOG_WRITE_$$weight_matrix(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$weight_matrix, _WRITE_READ_BENIGN_FLAG_$$weight_matrix;



implementation {:inline 1} _LOG_WRITE_$$weight_matrix(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$weight_matrix := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weight_matrix == _value then true else _WRITE_HAS_OCCURRED_$$weight_matrix);
    _WRITE_READ_BENIGN_FLAG_$$weight_matrix := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weight_matrix == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$weight_matrix);
    return;
}



procedure _CHECK_WRITE_$$weight_matrix(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "weight_matrix"} {:array "$$weight_matrix"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$weight_matrix && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weight_matrix != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "weight_matrix"} {:array "$$weight_matrix"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$weight_matrix && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weight_matrix != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "weight_matrix"} {:array "$$weight_matrix"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$weight_matrix && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$weight_matrix(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$weight_matrix;



implementation {:inline 1} _LOG_ATOMIC_$$weight_matrix(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$weight_matrix := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$weight_matrix);
    return;
}



procedure _CHECK_ATOMIC_$$weight_matrix(_P: bool, _offset: bv32);
  requires {:source_name "weight_matrix"} {:array "$$weight_matrix"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$weight_matrix && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "weight_matrix"} {:array "$$weight_matrix"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$weight_matrix && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$weight_matrix(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$weight_matrix;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$weight_matrix(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$weight_matrix := (if _P && _WRITE_HAS_OCCURRED_$$weight_matrix && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$weight_matrix);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_node;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_node;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_node;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$weight_matrix;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$weight_matrix;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$weight_matrix;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_hidden_cuda;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_hidden_cuda;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_hidden_cuda;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$hidden_partial_sum;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$hidden_partial_sum;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$hidden_partial_sum;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$input_hidden_cuda;
    goto anon9;

  anon9:
    havoc $$hidden_partial_sum;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$input_node;
    goto anon4;

  anon4:
    havoc $$weight_matrix;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_node;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_node;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_node;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$weight_matrix;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$weight_matrix;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$weight_matrix;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_hidden_cuda;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_hidden_cuda;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_hidden_cuda;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$hidden_partial_sum;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$hidden_partial_sum;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$hidden_partial_sum;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$input_hidden_cuda;
    goto anon9;

  anon9:
    havoc $$hidden_partial_sum;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$input_node;
    goto anon4;

  anon4:
    havoc $$weight_matrix;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_node;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_node;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_node;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$weight_matrix;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$weight_matrix;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$weight_matrix;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_hidden_cuda;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_hidden_cuda;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_hidden_cuda;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$hidden_partial_sum;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$hidden_partial_sum;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$hidden_partial_sum;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$input_hidden_cuda;
    goto anon9;

  anon9:
    havoc $$hidden_partial_sum;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$input_node;
    goto anon4;

  anon4:
    havoc $$weight_matrix;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_3($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_node;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_node;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_node;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$weight_matrix;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$weight_matrix;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$weight_matrix;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_hidden_cuda;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_hidden_cuda;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_hidden_cuda;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$hidden_partial_sum;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$hidden_partial_sum;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$hidden_partial_sum;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$input_hidden_cuda;
    goto anon9;

  anon9:
    havoc $$hidden_partial_sum;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$input_node;
    goto anon4;

  anon4:
    havoc $$weight_matrix;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_4($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_node;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_node;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_node;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$weight_matrix;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$weight_matrix;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$weight_matrix;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_hidden_cuda;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_hidden_cuda;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_hidden_cuda;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$hidden_partial_sum;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$hidden_partial_sum;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$hidden_partial_sum;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$input_hidden_cuda;
    goto anon9;

  anon9:
    havoc $$hidden_partial_sum;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$input_node;
    goto anon4;

  anon4:
    havoc $$weight_matrix;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;
