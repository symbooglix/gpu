type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "values"} {:global} $$values: [bv32]bv32;

axiom {:array_info "$$values"} {:global} {:elem_width 32} {:source_name "values"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$values: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$values: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$values: bool;

var {:source_name "shared"} {:group_shared} $$shared: [bv1][bv32]bv32;

axiom {:array_info "$$shared"} {:group_shared} {:elem_width 32} {:source_name "shared"} {:source_elem_width 32} {:source_dimensions "32"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$shared: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$shared: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$shared: bool;

const _WATCHED_OFFSET: bv32;

const {:group_size_x} group_size_x: bv32;

const {:group_size_y} group_size_y: bv32;

const {:group_size_z} group_size_z: bv32;

const {:local_id_x} local_id_x$1: bv32;

const {:local_id_x} local_id_x$2: bv32;

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

function {:bvbuiltin "bvxor"} BV32_XOR(bv32, bv32) : bv32;

procedure {:source_name "BitonicKernel"} {:kernel} $_Z13BitonicKernelPi();
  requires !_READ_HAS_OCCURRED_$$values && !_WRITE_HAS_OCCURRED_$$values && !_ATOMIC_HAS_OCCURRED_$$values;
  requires !_READ_HAS_OCCURRED_$$shared && !_WRITE_HAS_OCCURRED_$$shared && !_ATOMIC_HAS_OCCURRED_$$shared;
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
  modifies $$shared, _READ_HAS_OCCURRED_$$values, _WRITE_HAS_OCCURRED_$$shared, _WRITE_READ_BENIGN_FLAG_$$shared, _WRITE_READ_BENIGN_FLAG_$$shared, $$values, _TRACKING, _READ_HAS_OCCURRED_$$shared, _WRITE_HAS_OCCURRED_$$values, _WRITE_READ_BENIGN_FLAG_$$values, _WRITE_READ_BENIGN_FLAG_$$values, _TRACKING;



implementation {:source_name "BitonicKernel"} {:kernel} $_Z13BitonicKernelPi()
{
  var $k.0: bv32;
  var $j.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2: bool;
  var v3: bool;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bv32;
  var v7$2: bv32;
  var v9$1: bool;
  var v9$2: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v15$1: bool;
  var v15$2: bool;
  var v14$1: bv32;
  var v14$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
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
  var p6$1: bool;
  var p6$2: bool;
  var p7$1: bool;
  var p7$2: bool;
  var p8$1: bool;
  var p8$2: bool;
  var p9$1: bool;
  var p9$2: bool;


  __partitioned_block_$0_0:
    call {:sourceloc} {:sourceloc_num 1} _LOG_READ_$$values(true, local_id_x$1, $$values[local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 1} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 1} _CHECK_READ_$$values(true, local_id_x$2, $$values[local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$values"} true;
    v0$1 := $$values[local_id_x$1];
    v0$2 := $$values[local_id_x$2];
    call {:sourceloc} {:sourceloc_num 2} _LOG_WRITE_$$shared(true, local_id_x$1, v0$1, $$shared[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$shared(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 2} _CHECK_WRITE_$$shared(true, local_id_x$2, v0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$shared"} true;
    $$shared[1bv1][local_id_x$1] := v0$1;
    $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := v0$2;
    v1$1 := local_id_x$1 == 0bv32;
    v1$2 := local_id_x$2 == 0bv32;
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 4} $bugle_barrier_duplicated_1(1bv1, 1bv1, p0$1, p0$2);
    $k.0 := 2bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b13 ==> _WRITE_HAS_OCCURRED_$$shared ==> _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b12 ==> _READ_HAS_OCCURRED_$$shared ==> _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b11 ==> !_WRITE_HAS_OCCURRED_$$shared;
    assert {:tag "noread"} _b10 ==> !_READ_HAS_OCCURRED_$$shared;
    assert {:tag "pow2NotZero"} _b9 ==> $k.0 != 0bv32;
    assert {:tag "pow2"} _b8 ==> $k.0 == 0bv32 || BV32_AND($k.0, BV32_SUB($k.0, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$shared ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$shared ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$shared ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_UGE($k.0, 2bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_UGE($k.0, 2bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_ULE($k.0, 2bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_ULE($k.0, 2bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SGE($k.0, 2bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SGE($k.0, 2bv32);
    assert {:tag "loopBound"} {:thread 1} _b0 ==> BV32_SLE($k.0, 2bv32);
    assert {:tag "loopBound"} {:thread 2} _b0 ==> BV32_SLE($k.0, 2bv32);
    assert {:block_sourceloc} {:sourceloc_num 6} true;
    v2 := BV32_ULE($k.0, 32bv32);
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v2 && !v2;
    call {:sourceloc} {:sourceloc_num 37} _LOG_READ_$$shared(true, local_id_x$1, $$shared[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 37} _CHECK_READ_$$shared(true, local_id_x$2, $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v19$1 := $$shared[1bv1][local_id_x$1];
    v19$2 := $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2];
    call {:sourceloc} {:sourceloc_num 38} _LOG_WRITE_$$values(true, local_id_x$1, v19$1, $$values[local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$values(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 38} _CHECK_WRITE_$$values(true, local_id_x$2, v19$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$values"} true;
    $$values[local_id_x$1] := v19$1;
    $$values[local_id_x$2] := v19$2;
    return;

  $truebb0:
    assume {:partition} v2 && v2;
    $j.0 := BV32_UDIV($k.0, 2bv32);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b17 ==> _WRITE_HAS_OCCURRED_$$shared ==> _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b16 ==> _READ_HAS_OCCURRED_$$shared ==> _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b15 ==> !_WRITE_HAS_OCCURRED_$$shared;
    assert {:tag "noread"} _b14 ==> !_READ_HAS_OCCURRED_$$shared;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$shared ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$shared ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$shared ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b7 ==> BV32_UGE($j.0, BV32_UDIV($k.0, 2bv32));
    assert {:tag "loopBound"} {:thread 2} _b7 ==> BV32_UGE($j.0, BV32_UDIV($k.0, 2bv32));
    assert {:tag "loopBound"} {:thread 1} _b6 ==> BV32_ULE($j.0, BV32_UDIV($k.0, 2bv32));
    assert {:tag "loopBound"} {:thread 2} _b6 ==> BV32_ULE($j.0, BV32_UDIV($k.0, 2bv32));
    assert {:tag "loopBound"} {:thread 1} _b5 ==> BV32_SGE($j.0, BV32_UDIV($k.0, 2bv32));
    assert {:tag "loopBound"} {:thread 2} _b5 ==> BV32_SGE($j.0, BV32_UDIV($k.0, 2bv32));
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_SLE($j.0, BV32_UDIV($k.0, 2bv32));
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_SLE($j.0, BV32_UDIV($k.0, 2bv32));
    assert {:block_sourceloc} {:sourceloc_num 8} true;
    v3 := BV32_UGT($j.0, 0bv32);
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    p9$1 := false;
    p9$2 := false;
    goto __partitioned_block_$truebb1_0, $falsebb1;

  $falsebb1:
    assume {:partition} !v3 && !v3;
    $k.0 := BV32_MUL($k.0, 2bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $3;

  __partitioned_block_$truebb1_0:
    assume {:partition} v3 && v3;
    v4$1 := BV32_XOR(local_id_x$1, $j.0);
    v4$2 := BV32_XOR(local_id_x$2, $j.0);
    v5$1 := BV32_UGT(v4$1, local_id_x$1);
    v5$2 := BV32_UGT(v4$2, local_id_x$2);
    p3$1 := (if v5$1 then v5$1 else p3$1);
    p3$2 := (if v5$2 then v5$2 else p3$2);
    v6$1 := (if p3$1 then BV32_AND(local_id_x$1, $k.0) == 0bv32 else v6$1);
    v6$2 := (if p3$2 then BV32_AND(local_id_x$2, $k.0) == 0bv32 else v6$2);
    p4$1 := (if p3$1 && v6$1 then v6$1 else p4$1);
    p4$2 := (if p3$2 && v6$2 then v6$2 else p4$2);
    p7$1 := (if p3$1 && !v6$1 then !v6$1 else p7$1);
    p7$2 := (if p3$2 && !v6$2 then !v6$2 else p7$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$shared(p4$1, local_id_x$1, $$shared[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$shared(p4$2, local_id_x$2, $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v7$1 := (if p4$1 then $$shared[1bv1][local_id_x$1] else v7$1);
    v7$2 := (if p4$2 then $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v7$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$shared(p4$1, v4$1, $$shared[1bv1][v4$1]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$shared(p4$2, v4$2, $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v8$1 := (if p4$1 then $$shared[1bv1][v4$1] else v8$1);
    v8$2 := (if p4$2 then $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2] else v8$2);
    v9$1 := (if p4$1 then BV32_SGT(v7$1, v8$1) else v9$1);
    v9$2 := (if p4$2 then BV32_SGT(v7$2, v8$2) else v9$2);
    p6$1 := (if p4$1 && v9$1 then v9$1 else p6$1);
    p6$2 := (if p4$2 && v9$2 then v9$2 else p6$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$shared(p6$1, local_id_x$1, $$shared[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$shared(p6$2, local_id_x$2, $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v10$1 := (if p6$1 then $$shared[1bv1][local_id_x$1] else v10$1);
    v10$2 := (if p6$2 then $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v10$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$shared(p6$1, v4$1, $$shared[1bv1][v4$1]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$shared(p6$2, v4$2, $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v11$1 := (if p6$1 then $$shared[1bv1][v4$1] else v11$1);
    v11$2 := (if p6$2 then $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2] else v11$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$shared(p6$1, local_id_x$1, v11$1, $$shared[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$shared(p6$2, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$shared(p6$2, local_id_x$2, v11$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$shared"} true;
    $$shared[1bv1][local_id_x$1] := (if p6$1 then v11$1 else $$shared[1bv1][local_id_x$1]);
    $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := (if p6$2 then v11$2 else $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    call {:sourceloc} {:sourceloc_num 18} _LOG_READ_$$shared(p6$1, local_id_x$1, $$shared[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 18} _CHECK_READ_$$shared(p6$2, local_id_x$2, $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v12$1 := (if p6$1 then $$shared[1bv1][local_id_x$1] else v12$1);
    v12$2 := (if p6$2 then $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v12$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$shared(p6$1, v4$1, v12$1, $$shared[1bv1][v4$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$shared(p6$2, v4$2);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$shared(p6$2, v4$2, v12$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$shared"} true;
    $$shared[1bv1][v4$1] := (if p6$1 then v12$1 else $$shared[1bv1][v4$1]);
    $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2] := (if p6$2 then v12$2 else $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2]);
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$shared(p7$1, local_id_x$1, $$shared[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$shared(p7$2, local_id_x$2, $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v13$1 := (if p7$1 then $$shared[1bv1][local_id_x$1] else v13$1);
    v13$2 := (if p7$2 then $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v13$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$shared(p7$1, v4$1, $$shared[1bv1][v4$1]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$shared(p7$2, v4$2, $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v14$1 := (if p7$1 then $$shared[1bv1][v4$1] else v14$1);
    v14$2 := (if p7$2 then $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2] else v14$2);
    v15$1 := (if p7$1 then BV32_SLT(v13$1, v14$1) else v15$1);
    v15$2 := (if p7$2 then BV32_SLT(v13$2, v14$2) else v15$2);
    p9$1 := (if p7$1 && v15$1 then v15$1 else p9$1);
    p9$2 := (if p7$2 && v15$2 then v15$2 else p9$2);
    call {:sourceloc} {:sourceloc_num 25} _LOG_READ_$$shared(p9$1, local_id_x$1, $$shared[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 25} _CHECK_READ_$$shared(p9$2, local_id_x$2, $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v16$1 := (if p9$1 then $$shared[1bv1][local_id_x$1] else v16$1);
    v16$2 := (if p9$2 then $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v16$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_READ_$$shared(p9$1, v4$1, $$shared[1bv1][v4$1]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 26} _CHECK_READ_$$shared(p9$2, v4$2, $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v17$1 := (if p9$1 then $$shared[1bv1][v4$1] else v17$1);
    v17$2 := (if p9$2 then $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2] else v17$2);
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$shared(p9$1, local_id_x$1, v17$1, $$shared[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$shared(p9$2, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$shared(p9$2, local_id_x$2, v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$shared"} true;
    $$shared[1bv1][local_id_x$1] := (if p9$1 then v17$1 else $$shared[1bv1][local_id_x$1]);
    $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := (if p9$2 then v17$2 else $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    call {:sourceloc} {:sourceloc_num 28} _LOG_READ_$$shared(p9$1, local_id_x$1, $$shared[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 28} _CHECK_READ_$$shared(p9$2, local_id_x$2, $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shared"} true;
    v18$1 := (if p9$1 then $$shared[1bv1][local_id_x$1] else v18$1);
    v18$2 := (if p9$2 then $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v18$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$shared(p9$1, v4$1, v18$1, $$shared[1bv1][v4$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$shared(p9$2, v4$2);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$shared(p9$2, v4$2, v18$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$shared"} true;
    $$shared[1bv1][v4$1] := (if p9$1 then v18$1 else $$shared[1bv1][v4$1]);
    $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2] := (if p9$2 then v18$2 else $$shared[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2]);
    goto __partitioned_block_$truebb1_1;

  __partitioned_block_$truebb1_1:
    call {:sourceloc_num 32} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $j.0 := BV32_UDIV($j.0, 2bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $5;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$shared, $$values, _TRACKING;



procedure {:inline 1} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  requires {:barrier_divergence} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 == _P$2;
  modifies $$shared, $$values, _TRACKING;



function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

const {:existential true} _b4: bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const _WATCHED_VALUE_$$values: bv32;

procedure {:inline 1} _LOG_READ_$$values(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$values;



implementation {:inline 1} _LOG_READ_$$values(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$values := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$values == _value then true else _READ_HAS_OCCURRED_$$values);
    return;
}



procedure _CHECK_READ_$$values(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "values"} {:array "$$values"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$values);
  requires {:source_name "values"} {:array "$$values"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$values: bool;

procedure {:inline 1} _LOG_WRITE_$$values(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$values, _WRITE_READ_BENIGN_FLAG_$$values;



implementation {:inline 1} _LOG_WRITE_$$values(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$values := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$values == _value then true else _WRITE_HAS_OCCURRED_$$values);
    _WRITE_READ_BENIGN_FLAG_$$values := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$values == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$values);
    return;
}



procedure _CHECK_WRITE_$$values(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "values"} {:array "$$values"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$values != _value);
  requires {:source_name "values"} {:array "$$values"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$values != _value);
  requires {:source_name "values"} {:array "$$values"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$values(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$values;



implementation {:inline 1} _LOG_ATOMIC_$$values(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$values := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$values);
    return;
}



procedure _CHECK_ATOMIC_$$values(_P: bool, _offset: bv32);
  requires {:source_name "values"} {:array "$$values"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset);
  requires {:source_name "values"} {:array "$$values"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$values(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$values;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$values(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$values := (if _P && _WRITE_HAS_OCCURRED_$$values && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$values);
    return;
}



const _WATCHED_VALUE_$$shared: bv32;

procedure {:inline 1} _LOG_READ_$$shared(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$shared;



implementation {:inline 1} _LOG_READ_$$shared(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$shared := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shared == _value then true else _READ_HAS_OCCURRED_$$shared);
    return;
}



procedure _CHECK_READ_$$shared(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "shared"} {:array "$$shared"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$shared && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared"} {:array "$$shared"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$shared: bool;

procedure {:inline 1} _LOG_WRITE_$$shared(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$shared, _WRITE_READ_BENIGN_FLAG_$$shared;



implementation {:inline 1} _LOG_WRITE_$$shared(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$shared := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shared == _value then true else _WRITE_HAS_OCCURRED_$$shared);
    _WRITE_READ_BENIGN_FLAG_$$shared := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shared == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$shared);
    return;
}



procedure _CHECK_WRITE_$$shared(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "shared"} {:array "$$shared"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shared != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared"} {:array "$$shared"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shared != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared"} {:array "$$shared"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$shared(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$shared;



implementation {:inline 1} _LOG_ATOMIC_$$shared(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$shared := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$shared);
    return;
}



procedure _CHECK_ATOMIC_$$shared(_P: bool, _offset: bv32);
  requires {:source_name "shared"} {:array "$$shared"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared"} {:array "$$shared"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$shared(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$shared;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$shared(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$shared := (if _P && _WRITE_HAS_OCCURRED_$$shared && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$shared);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$shared;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$shared;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$shared;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$values;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$values;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$values;
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
    havoc $$values;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$shared;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$shared;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$shared;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$shared;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$values;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$values;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$values;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$values;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$shared;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

const {:existential true} _b8: bool;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

const {:existential true} _b11: bool;

const {:existential true} _b12: bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const {:existential true} _b17: bool;
