type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "data"} {:global} $$data: [bv32]bv32;

axiom {:array_info "$$data"} {:global} {:elem_width 32} {:source_name "data"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data: bool;

var {:source_name "s_data"} {:group_shared} $$scan_inter2_kernel.s_data: [bv1][bv32]bv32;

axiom {:array_info "$$scan_inter2_kernel.s_data"} {:group_shared} {:elem_width 32} {:source_name "s_data"} {:source_elem_width 32} {:source_dimensions "544"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$scan_inter2_kernel.s_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$scan_inter2_kernel.s_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$scan_inter2_kernel.s_data: bool;

const _WATCHED_OFFSET: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

const {:group_size_x} group_size_x: bv32;

const {:group_size_y} group_size_y: bv32;

const {:group_size_z} group_size_z: bv32;

const {:local_id_x} local_id_x$1: bv32;

const {:local_id_x} local_id_x$2: bv32;

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "scan_inter2_kernel"} {:kernel} $scan_inter2_kernel($iter: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $iter == 1bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$data && !_WRITE_HAS_OCCURRED_$$data && !_ATOMIC_HAS_OCCURRED_$$data;
  requires !_READ_HAS_OCCURRED_$$scan_inter2_kernel.s_data && !_WRITE_HAS_OCCURRED_$$scan_inter2_kernel.s_data && !_ATOMIC_HAS_OCCURRED_$$scan_inter2_kernel.s_data;
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
  modifies $$scan_inter2_kernel.s_data, _READ_HAS_OCCURRED_$$data, _WRITE_HAS_OCCURRED_$$scan_inter2_kernel.s_data, _WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data, _WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data, $$data, _TRACKING, _READ_HAS_OCCURRED_$$scan_inter2_kernel.s_data, _WRITE_HAS_OCCURRED_$$data, _WRITE_READ_BENIGN_FLAG_$$data, _WRITE_READ_BENIGN_FLAG_$$data, _TRACKING;



implementation {:source_name "scan_inter2_kernel"} {:kernel} $scan_inter2_kernel($iter: bv32)
{
  var $stride.0: bv32;
  var $d.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12: bool;
  var v13: bv32;
  var v14$1: bool;
  var v14$2: bool;
  var v16$1: bv32;
  var v16$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1$1 := BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL(2bv32, $iter), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $iter), 1bv32);
    v1$2 := BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL(2bv32, $iter), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $iter), 1bv32);
    v2$1 := BV32_ADD(v1$1, $iter);
    v2$2 := BV32_ADD(v1$2, $iter);
    v3$1 := BV32_MUL(2bv32, v0$1);
    v3$2 := BV32_MUL(2bv32, v0$2);
    v4$1 := BV32_MUL(2bv32, v0$1);
    v4$2 := BV32_MUL(2bv32, v0$2);
    v5$1 := BV32_ADD(v4$1, 1bv32);
    v5$2 := BV32_ADD(v4$2, 1bv32);
    v6$1 := BV32_ADD(4bv32, v3$1);
    v6$2 := BV32_ADD(4bv32, v3$2);
    v7$1 := BV32_ADD(v3$1, BV32_LSHR(BV32_LSHR(v3$1, BV32_AND((if BV32_ULT(v6$1, 24bv32) then v6$1 else 24bv32), 31bv32)), 8bv32));
    v7$2 := BV32_ADD(v3$2, BV32_LSHR(BV32_LSHR(v3$2, BV32_AND((if BV32_ULT(v6$2, 24bv32) then v6$2 else 24bv32), 31bv32)), 8bv32));
    v8$1 := BV32_ADD(v4$1, 5bv32);
    v8$2 := BV32_ADD(v4$2, 5bv32);
    v9$1 := BV32_ADD(v5$1, BV32_LSHR(BV32_LSHR(v5$1, BV32_AND((if BV32_ULT(v8$1, 24bv32) then v8$1 else 24bv32), 31bv32)), 8bv32));
    v9$2 := BV32_ADD(v5$2, BV32_LSHR(BV32_LSHR(v5$2, BV32_AND((if BV32_ULT(v8$2, 24bv32) then v8$2 else 24bv32), 31bv32)), 8bv32));
    call {:sourceloc} {:sourceloc_num 2} _LOG_READ_$$data(true, v1$1, $$data[v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 2} _CHECK_READ_$$data(true, v1$2, $$data[v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data"} true;
    v10$1 := $$data[v1$1];
    v10$2 := $$data[v1$2];
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$scan_inter2_kernel.s_data(true, v7$1, v10$1, $$scan_inter2_kernel.s_data[1bv1][v7$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data(true, v7$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$scan_inter2_kernel.s_data(true, v7$2, v10$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$scan_inter2_kernel.s_data"} true;
    $$scan_inter2_kernel.s_data[1bv1][v7$1] := v10$1;
    $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v7$2] := v10$2;
    call {:sourceloc} {:sourceloc_num 4} _LOG_READ_$$data(true, v2$1, $$data[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 4} _CHECK_READ_$$data(true, v2$2, $$data[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data"} true;
    v11$1 := $$data[v2$1];
    v11$2 := $$data[v2$2];
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$scan_inter2_kernel.s_data(true, v9$1, v11$1, $$scan_inter2_kernel.s_data[1bv1][v9$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data(true, v9$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$scan_inter2_kernel.s_data(true, v9$2, v11$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$scan_inter2_kernel.s_data"} true;
    $$scan_inter2_kernel.s_data[1bv1][v9$1] := v11$1;
    $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2] := v11$2;
    $stride.0, $d.0 := BV32_MUL(group_size_x, 2bv32), 1bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$scan_inter2_kernel.s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$scan_inter2_kernel.s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$scan_inter2_kernel.s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 6} true;
    v12 := BV32_ULE($d.0, group_size_x);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    goto __partitioned_block_$truebb_0, __partitioned_block_$falsebb_0;

  __partitioned_block_$falsebb_0:
    assume {:partition} !v12 && !v12;
    goto __partitioned_block_$falsebb_1;

  __partitioned_block_$falsebb_1:
    call {:sourceloc_num 18} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$scan_inter2_kernel.s_data(true, v7$1, $$scan_inter2_kernel.s_data[1bv1][v7$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$scan_inter2_kernel.s_data(true, v7$2, $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v7$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_inter2_kernel.s_data"} true;
    v24$1 := $$scan_inter2_kernel.s_data[1bv1][v7$1];
    v24$2 := $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v7$2];
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$data(true, v1$1, v24$1, $$data[v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(true, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$data(true, v1$2, v24$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data"} true;
    $$data[v1$1] := v24$1;
    $$data[v1$2] := v24$2;
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$scan_inter2_kernel.s_data(true, v9$1, $$scan_inter2_kernel.s_data[1bv1][v9$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$scan_inter2_kernel.s_data(true, v9$2, $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_inter2_kernel.s_data"} true;
    v25$1 := $$scan_inter2_kernel.s_data[1bv1][v9$1];
    v25$2 := $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2];
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$data(true, v2$1, v25$1, $$data[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(true, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$data(true, v2$2, v25$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data"} true;
    $$data[v2$1] := v25$1;
    $$data[v2$2] := v25$2;
    return;

  __partitioned_block_$truebb_0:
    assume {:partition} v12 && v12;
    v13 := BV32_LSHR($stride.0, 1bv32);
    goto __partitioned_block_$truebb_1;

  __partitioned_block_$truebb_1:
    call {:sourceloc_num 8} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    v14$1 := BV32_ULT(v0$1, $d.0);
    v14$2 := BV32_ULT(v0$2, $d.0);
    p1$1 := (if v14$1 then v14$1 else p1$1);
    p1$2 := (if v14$2 then v14$2 else p1$2);
    v15$1 := (if p1$1 then BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL(2bv32, v13), v0$1), v13), 1bv32) else v15$1);
    v15$2 := (if p1$2 then BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL(2bv32, v13), v0$2), v13), 1bv32) else v15$2);
    v16$1 := (if p1$1 then BV32_ADD(v15$1, v13) else v16$1);
    v16$2 := (if p1$2 then BV32_ADD(v15$2, v13) else v16$2);
    v17$1 := (if p1$1 then BV32_ADD(4bv32, v15$1) else v17$1);
    v17$2 := (if p1$2 then BV32_ADD(4bv32, v15$2) else v17$2);
    v18$1 := (if p1$1 then BV32_ADD(v15$1, BV32_LSHR(BV32_LSHR(v15$1, BV32_AND((if BV32_ULT(v17$1, 24bv32) then v17$1 else 24bv32), 31bv32)), 8bv32)) else v18$1);
    v18$2 := (if p1$2 then BV32_ADD(v15$2, BV32_LSHR(BV32_LSHR(v15$2, BV32_AND((if BV32_ULT(v17$2, 24bv32) then v17$2 else 24bv32), 31bv32)), 8bv32)) else v18$2);
    v19$1 := (if p1$1 then BV32_ADD(4bv32, v16$1) else v19$1);
    v19$2 := (if p1$2 then BV32_ADD(4bv32, v16$2) else v19$2);
    v20$1 := (if p1$1 then BV32_ADD(v16$1, BV32_LSHR(BV32_LSHR(v16$1, BV32_AND((if BV32_ULT(v19$1, 24bv32) then v19$1 else 24bv32), 31bv32)), 8bv32)) else v20$1);
    v20$2 := (if p1$2 then BV32_ADD(v16$2, BV32_LSHR(BV32_LSHR(v16$2, BV32_AND((if BV32_ULT(v19$2, 24bv32) then v19$2 else 24bv32), 31bv32)), 8bv32)) else v20$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$scan_inter2_kernel.s_data(p1$1, v18$1, $$scan_inter2_kernel.s_data[1bv1][v18$1]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$scan_inter2_kernel.s_data(p1$2, v18$2, $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_inter2_kernel.s_data"} true;
    v21$1 := (if p1$1 then $$scan_inter2_kernel.s_data[1bv1][v18$1] else v21$1);
    v21$2 := (if p1$2 then $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2] else v21$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$scan_inter2_kernel.s_data(p1$1, v20$1, $$scan_inter2_kernel.s_data[1bv1][v20$1]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$scan_inter2_kernel.s_data(p1$2, v20$2, $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v20$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_inter2_kernel.s_data"} true;
    v22$1 := (if p1$1 then $$scan_inter2_kernel.s_data[1bv1][v20$1] else v22$1);
    v22$2 := (if p1$2 then $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v20$2] else v22$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$scan_inter2_kernel.s_data(p1$1, v18$1, v22$1, $$scan_inter2_kernel.s_data[1bv1][v18$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data(p1$2, v18$2);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$scan_inter2_kernel.s_data(p1$2, v18$2, v22$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$scan_inter2_kernel.s_data"} true;
    $$scan_inter2_kernel.s_data[1bv1][v18$1] := (if p1$1 then v22$1 else $$scan_inter2_kernel.s_data[1bv1][v18$1]);
    $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2] := (if p1$2 then v22$2 else $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2]);
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$scan_inter2_kernel.s_data(p1$1, v20$1, $$scan_inter2_kernel.s_data[1bv1][v20$1]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$scan_inter2_kernel.s_data(p1$2, v20$2, $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v20$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_inter2_kernel.s_data"} true;
    v23$1 := (if p1$1 then $$scan_inter2_kernel.s_data[1bv1][v20$1] else v23$1);
    v23$2 := (if p1$2 then $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v20$2] else v23$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$scan_inter2_kernel.s_data(p1$1, v20$1, BV32_ADD(v23$1, v21$1), $$scan_inter2_kernel.s_data[1bv1][v20$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data(p1$2, v20$2);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$scan_inter2_kernel.s_data(p1$2, v20$2, BV32_ADD(v23$2, v21$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$scan_inter2_kernel.s_data"} true;
    $$scan_inter2_kernel.s_data[1bv1][v20$1] := (if p1$1 then BV32_ADD(v23$1, v21$1) else $$scan_inter2_kernel.s_data[1bv1][v20$1]);
    $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v20$2] := (if p1$2 then BV32_ADD(v23$2, v21$2) else $$scan_inter2_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v20$2]);
    $stride.0, $d.0 := v13, BV32_MUL($d.0, 2bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$scan_inter2_kernel.s_data, $$data, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$scan_inter2_kernel.s_data, $$data, _TRACKING;



const _WATCHED_VALUE_$$data: bv32;

procedure {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data;



implementation {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _READ_HAS_OCCURRED_$$data);
    return;
}



procedure _CHECK_READ_$$data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data);
  requires {:source_name "data"} {:array "$$data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data: bool;

procedure {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data, _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _WRITE_HAS_OCCURRED_$$data);
    _WRITE_READ_BENIGN_FLAG_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data);
    return;
}



procedure _CHECK_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data != _value);
  requires {:source_name "data"} {:array "$$data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data != _value);
  requires {:source_name "data"} {:array "$$data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data;



implementation {:inline 1} _LOG_ATOMIC_$$data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data);
    return;
}



procedure _CHECK_ATOMIC_$$data(_P: bool, _offset: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);
  requires {:source_name "data"} {:array "$$data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data := (if _P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data);
    return;
}



const _WATCHED_VALUE_$$scan_inter2_kernel.s_data: bv32;

procedure {:inline 1} _LOG_READ_$$scan_inter2_kernel.s_data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$scan_inter2_kernel.s_data;



implementation {:inline 1} _LOG_READ_$$scan_inter2_kernel.s_data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$scan_inter2_kernel.s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_inter2_kernel.s_data == _value then true else _READ_HAS_OCCURRED_$$scan_inter2_kernel.s_data);
    return;
}



procedure _CHECK_READ_$$scan_inter2_kernel.s_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_data"} {:array "$$scan_inter2_kernel.s_data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$scan_inter2_kernel.s_data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$scan_inter2_kernel.s_data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$scan_inter2_kernel.s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data: bool;

procedure {:inline 1} _LOG_WRITE_$$scan_inter2_kernel.s_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$scan_inter2_kernel.s_data, _WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data;



implementation {:inline 1} _LOG_WRITE_$$scan_inter2_kernel.s_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$scan_inter2_kernel.s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_inter2_kernel.s_data == _value then true else _WRITE_HAS_OCCURRED_$$scan_inter2_kernel.s_data);
    _WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_inter2_kernel.s_data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data);
    return;
}



procedure _CHECK_WRITE_$$scan_inter2_kernel.s_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_data"} {:array "$$scan_inter2_kernel.s_data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$scan_inter2_kernel.s_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_inter2_kernel.s_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$scan_inter2_kernel.s_data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$scan_inter2_kernel.s_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_inter2_kernel.s_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$scan_inter2_kernel.s_data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$scan_inter2_kernel.s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$scan_inter2_kernel.s_data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$scan_inter2_kernel.s_data;



implementation {:inline 1} _LOG_ATOMIC_$$scan_inter2_kernel.s_data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$scan_inter2_kernel.s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$scan_inter2_kernel.s_data);
    return;
}



procedure _CHECK_ATOMIC_$$scan_inter2_kernel.s_data(_P: bool, _offset: bv32);
  requires {:source_name "s_data"} {:array "$$scan_inter2_kernel.s_data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$scan_inter2_kernel.s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$scan_inter2_kernel.s_data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$scan_inter2_kernel.s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data := (if _P && _WRITE_HAS_OCCURRED_$$scan_inter2_kernel.s_data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$scan_inter2_kernel.s_data);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$scan_inter2_kernel.s_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$scan_inter2_kernel.s_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$scan_inter2_kernel.s_data;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$data;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$scan_inter2_kernel.s_data;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$scan_inter2_kernel.s_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$scan_inter2_kernel.s_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$scan_inter2_kernel.s_data;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$data;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$scan_inter2_kernel.s_data;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
