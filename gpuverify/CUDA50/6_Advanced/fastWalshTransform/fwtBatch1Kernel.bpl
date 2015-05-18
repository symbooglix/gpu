type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_Output"} {:global} $$d_Output: [bv32]bv32;

axiom {:array_info "$$d_Output"} {:global} {:elem_width 32} {:source_name "d_Output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Output: bool;

axiom {:array_info "$$d_Input"} {:global} {:elem_width 32} {:source_name "d_Input"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Input: bool;

var {:source_name "s_data"} {:group_shared} $$s_data: [bv1][bv32]bv32;

axiom {:array_info "$$s_data"} {:group_shared} {:elem_width 32} {:source_name "s_data"} {:source_elem_width 32} {:source_dimensions "0"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$s_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$s_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$s_data: bool;

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

function FADD32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "fwtBatch1Kernel"} {:kernel} $_Z15fwtBatch1KernelPfS_i($log2N: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $log2N == 11bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$d_Output && !_WRITE_HAS_OCCURRED_$$d_Output && !_ATOMIC_HAS_OCCURRED_$$d_Output;
  requires !_READ_HAS_OCCURRED_$$d_Input && !_WRITE_HAS_OCCURRED_$$d_Input && !_ATOMIC_HAS_OCCURRED_$$d_Input;
  requires !_READ_HAS_OCCURRED_$$s_data && !_WRITE_HAS_OCCURRED_$$s_data && !_ATOMIC_HAS_OCCURRED_$$s_data;
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
  modifies $$s_data, _WRITE_HAS_OCCURRED_$$s_data, _WRITE_READ_BENIGN_FLAG_$$s_data, _WRITE_READ_BENIGN_FLAG_$$s_data, $$d_Output, _TRACKING, _READ_HAS_OCCURRED_$$s_data, _WRITE_HAS_OCCURRED_$$d_Output, _WRITE_READ_BENIGN_FLAG_$$d_Output, _WRITE_READ_BENIGN_FLAG_$$d_Output, _TRACKING, _TRACKING;



implementation {:source_name "fwtBatch1Kernel"} {:kernel} $_Z15fwtBatch1KernelPfS_i($log2N: bv32)
{
  var $pos.0$1: bv32;
  var $pos.0$2: bv32;
  var $stride.0: bv32;
  var $pos2.0$1: bv32;
  var $pos2.0$2: bv32;
  var $pos7.0$1: bv32;
  var $pos7.0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bv32;
  var v3$2: bv32;
  var v0: bv32;
  var v4: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18: bool;
  var v19$1: bool;
  var v19$2: bool;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bool;
  var v24$2: bool;
  var v25$1: bv32;
  var v25$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0 := BV32_SHL(1bv32, $log2N);
    v1$1 := BV32_SHL(group_id_x$1, $log2N);
    v1$2 := BV32_SHL(group_id_x$2, $log2N);
    $pos.0$1 := local_id_x$1;
    $pos.0$2 := local_id_x$2;
    p0$1 := false;
    p0$2 := false;
    p3$1 := false;
    p3$2 := false;
    p6$1 := false;
    p6$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b29 ==> _WRITE_HAS_OCCURRED_$$s_data ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$1);
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b6 ==> BV32_SLT($pos.0$1, BV32_SHL(1bv32, $log2N)) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b6 ==> BV32_SLT($pos.0$2, BV32_SHL(1bv32, $log2N)) ==> p0$2;
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b5 ==> BV32_UGE($pos.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b5 ==> BV32_UGE($pos.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b4 ==> BV32_ULE($pos.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b4 ==> BV32_ULE($pos.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b3 ==> BV32_SGE($pos.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b3 ==> BV32_SGE($pos.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b2 ==> BV32_SLE($pos.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b2 ==> BV32_SLE($pos.0$2, local_id_x$2);
    assert {:tag "guardNonNeg"} {:thread 1} p0$1 ==> _b1 ==> BV32_SLE(0bv32, $pos.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p0$2 ==> _b1 ==> BV32_SLE(0bv32, $pos.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b0 ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), $pos.0$1) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$1);
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b0 ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), $pos.0$2) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$2);
    assert {:block_sourceloc} {:sourceloc_num 2} p0$1 ==> true;
    v2$1 := (if p0$1 then BV32_SLT($pos.0$1, v0) else v2$1);
    v2$2 := (if p0$2 then BV32_SLT($pos.0$2, v0) else v2$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p1$1 := (if p0$1 && v2$1 then v2$1 else p1$1);
    p1$2 := (if p0$2 && v2$2 then v2$2 else p1$2);
    p0$1 := (if p0$1 && !v2$1 then v2$1 else p0$1);
    p0$2 := (if p0$2 && !v2$2 then v2$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p1$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p1$2 then _HAVOC_bv32$2 else v3$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$s_data(p1$1, $pos.0$1, v3$1, $$s_data[1bv1][$pos.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$s_data(p1$2, $pos.0$2);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$s_data(p1$2, $pos.0$2, v3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$s_data"} true;
    $$s_data[1bv1][$pos.0$1] := (if p1$1 then v3$1 else $$s_data[1bv1][$pos.0$1]);
    $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.0$2] := (if p1$2 then v3$2 else $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos.0$2]);
    $pos.0$1 := (if p1$1 then BV32_ADD($pos.0$1, group_size_x) else $pos.0$1);
    $pos.0$2 := (if p1$2 then BV32_ADD($pos.0$2, group_size_x) else $pos.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    $stride.0 := BV32_ASHR(v0, 2bv32);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "nowrite"} _b33 ==> !_WRITE_HAS_OCCURRED_$$s_data;
    assert {:tag "noread"} _b32 ==> !_READ_HAS_OCCURRED_$$s_data;
    assert {:tag "pow2NotZero"} _b31 ==> $stride.0 != 0bv32;
    assert {:tag "pow2"} _b30 ==> $stride.0 == 0bv32 || BV32_AND($stride.0, BV32_SUB($stride.0, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b11 ==> BV32_UGE($stride.0, BV32_ASHR(v0, 2bv32));
    assert {:tag "loopBound"} {:thread 2} _b11 ==> BV32_UGE($stride.0, BV32_ASHR(v0, 2bv32));
    assert {:tag "loopBound"} {:thread 1} _b10 ==> BV32_ULE($stride.0, BV32_ASHR(v0, 2bv32));
    assert {:tag "loopBound"} {:thread 2} _b10 ==> BV32_ULE($stride.0, BV32_ASHR(v0, 2bv32));
    assert {:tag "loopBound"} {:thread 1} _b9 ==> BV32_SGE($stride.0, BV32_ASHR(v0, 2bv32));
    assert {:tag "loopBound"} {:thread 2} _b9 ==> BV32_SGE($stride.0, BV32_ASHR(v0, 2bv32));
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_SLE($stride.0, BV32_ASHR(v0, 2bv32));
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_SLE($stride.0, BV32_ASHR(v0, 2bv32));
    assert {:tag "guardNonNeg"} {:thread 1} _b7 ==> BV32_SLE(0bv32, $stride.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b7 ==> BV32_SLE(0bv32, $stride.0);
    assert {:block_sourceloc} {:sourceloc_num 8} true;
    v4 := BV32_SGT($stride.0, 0bv32);
    goto __partitioned_block_$truebb0_0, $falsebb0;

  $falsebb0:
    assume {:partition} !v4 && !v4;
    v18 := BV32_AND($log2N, 1bv32) != 0bv32;
    goto __partitioned_block_$truebb1_0, $falsebb1;

  $falsebb1:
    assume {:partition} !v18 && !v18;
    goto $14;

  $14:
    call {:sourceloc_num 32} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $pos7.0$1 := local_id_x$1;
    $pos7.0$2 := local_id_x$2;
    p6$1 := true;
    p6$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $15;

  $15:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b36 ==> _READ_HAS_OCCURRED_$$s_data ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$1);
    assert {:tag "accessUpperBoundBlock"} _b35 ==> _WRITE_HAS_OCCURRED_$$d_Output ==> BV32_SLT(_WATCHED_OFFSET, BV32_SHL(BV32_ADD(group_id_x$1, 1bv32), $log2N));
    assert {:tag "accessLowerBoundBlock"} _b34 ==> _WRITE_HAS_OCCURRED_$$d_Output ==> BV32_SLE(BV32_SHL(group_id_x$1, $log2N), _WATCHED_OFFSET);
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b18 ==> BV32_SLT($pos7.0$1, BV32_SHL(1bv32, $log2N)) ==> p6$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b18 ==> BV32_SLT($pos7.0$2, BV32_SHL(1bv32, $log2N)) ==> p6$2;
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b17 ==> BV32_UGE($pos7.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b17 ==> BV32_UGE($pos7.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b16 ==> BV32_ULE($pos7.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b16 ==> BV32_ULE($pos7.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b15 ==> BV32_SGE($pos7.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b15 ==> BV32_SGE($pos7.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b14 ==> BV32_SLE($pos7.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b14 ==> BV32_SLE($pos7.0$2, local_id_x$2);
    assert {:tag "guardNonNeg"} {:thread 1} p6$1 ==> _b13 ==> BV32_SLE(0bv32, $pos7.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p6$2 ==> _b13 ==> BV32_SLE(0bv32, $pos7.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p6$1 ==> _b12 ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), $pos7.0$1) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$1);
    assert {:tag "loopCounterIsStrided"} {:thread 2} p6$2 ==> _b12 ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), $pos7.0$2) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$2);
    assert {:block_sourceloc} {:sourceloc_num 33} p6$1 ==> true;
    v24$1 := (if p6$1 then BV32_SLT($pos7.0$1, v0) else v24$1);
    v24$2 := (if p6$2 then BV32_SLT($pos7.0$2, v0) else v24$2);
    p7$1 := false;
    p7$2 := false;
    p7$1 := (if p6$1 && v24$1 then v24$1 else p7$1);
    p7$2 := (if p6$2 && v24$2 then v24$2 else p7$2);
    p6$1 := (if p6$1 && !v24$1 then v24$1 else p6$1);
    p6$2 := (if p6$2 && !v24$2 then v24$2 else p6$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_READ_$$s_data(p7$1, $pos7.0$1, $$s_data[1bv1][$pos7.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 35} _CHECK_READ_$$s_data(p7$2, $pos7.0$2, $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos7.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$s_data"} true;
    v25$1 := (if p7$1 then $$s_data[1bv1][$pos7.0$1] else v25$1);
    v25$2 := (if p7$2 then $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$pos7.0$2] else v25$2);
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$d_Output(p7$1, BV32_ADD(v1$1, $pos7.0$1), v25$1, $$d_Output[BV32_ADD(v1$1, $pos7.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Output(p7$2, BV32_ADD(v1$2, $pos7.0$2));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$d_Output(p7$2, BV32_ADD(v1$2, $pos7.0$2), v25$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Output"} true;
    $$d_Output[BV32_ADD(v1$1, $pos7.0$1)] := (if p7$1 then v25$1 else $$d_Output[BV32_ADD(v1$1, $pos7.0$1)]);
    $$d_Output[BV32_ADD(v1$2, $pos7.0$2)] := (if p7$2 then v25$2 else $$d_Output[BV32_ADD(v1$2, $pos7.0$2)]);
    $pos7.0$1 := (if p7$1 then BV32_ADD($pos7.0$1, group_size_x) else $pos7.0$1);
    $pos7.0$2 := (if p7$2 then BV32_ADD($pos7.0$2, group_size_x) else $pos7.0$2);
    p6$1 := (if p7$1 then true else p6$1);
    p6$2 := (if p7$2 then true else p6$2);
    goto $15.backedge, $15.tail;

  $15.tail:
    assume !p6$1 && !p6$2;
    return;

  $15.backedge:
    assume {:backedge} p6$1 || p6$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $15;

  __partitioned_block_$truebb1_0:
    assume {:partition} v18 && v18;
    goto __partitioned_block_$truebb1_1;

  __partitioned_block_$truebb1_1:
    call {:sourceloc_num 22} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    $pos2.0$1 := local_id_x$1;
    $pos2.0$2 := local_id_x$2;
    p3$1 := true;
    p3$2 := true;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $10;

  $10:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "pow2NotZero"} _b44 ==> v20$2 != 0bv32;
    assert {:tag "pow2"} _b43 ==> v20$2 == 0bv32 || BV32_AND(v20$2, BV32_SUB(v20$2, 1bv32)) == 0bv32;
    assert {:tag "pow2NotZero"} _b42 ==> v20$1 != 0bv32;
    assert {:tag "pow2"} _b41 ==> v20$1 == 0bv32 || BV32_AND(v20$1, BV32_SUB(v20$1, 1bv32)) == 0bv32;
    assert {:tag "pow2NotZero"} _b40 ==> $pos2.0$2 != 0bv32;
    assert {:tag "pow2"} _b39 ==> $pos2.0$2 == 0bv32 || BV32_AND($pos2.0$2, BV32_SUB($pos2.0$2, 1bv32)) == 0bv32;
    assert {:tag "pow2NotZero"} _b38 ==> $pos2.0$1 != 0bv32;
    assert {:tag "pow2"} _b37 ==> $pos2.0$1 == 0bv32 || BV32_AND($pos2.0$1, BV32_SUB($pos2.0$1, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b28 ==> _WRITE_HAS_OCCURRED_$$s_data ==> BV32_AND($log2N, 1bv32) != 0bv32;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b27 ==> _READ_HAS_OCCURRED_$$s_data ==> BV32_AND($log2N, 1bv32) != 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p3$1 ==> _b26 ==> p3$1 ==> BV32_AND($log2N, 1bv32) != 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p3$2 ==> _b26 ==> p3$2 ==> BV32_AND($log2N, 1bv32) != 0bv32;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b25 ==> BV32_AND($log2N, 1bv32) != 0bv32 && BV32_SLT($pos2.0$1, BV32_SDIV(BV32_SHL(1bv32, $log2N), 2bv32)) ==> p3$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b25 ==> BV32_AND($log2N, 1bv32) != 0bv32 && BV32_SLT($pos2.0$2, BV32_SDIV(BV32_SHL(1bv32, $log2N), 2bv32)) ==> p3$2;
    assert {:tag "loopBound"} {:thread 1} p3$1 ==> _b24 ==> BV32_UGE($pos2.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p3$2 ==> _b24 ==> BV32_UGE($pos2.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p3$1 ==> _b23 ==> BV32_ULE($pos2.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p3$2 ==> _b23 ==> BV32_ULE($pos2.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p3$1 ==> _b22 ==> BV32_SGE($pos2.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p3$2 ==> _b22 ==> BV32_SGE($pos2.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p3$1 ==> _b21 ==> BV32_SLE($pos2.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p3$2 ==> _b21 ==> BV32_SLE($pos2.0$2, local_id_x$2);
    assert {:tag "guardNonNeg"} {:thread 1} p3$1 ==> _b20 ==> BV32_SLE(0bv32, $pos2.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p3$2 ==> _b20 ==> BV32_SLE(0bv32, $pos2.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p3$1 ==> _b19 ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), $pos2.0$1) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$1);
    assert {:tag "loopCounterIsStrided"} {:thread 2} p3$2 ==> _b19 ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), $pos2.0$2) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$2);
    assert {:block_sourceloc} {:sourceloc_num 23} p3$1 ==> true;
    v19$1 := (if p3$1 then BV32_SLT($pos2.0$1, BV32_SDIV(v0, 2bv32)) else v19$1);
    v19$2 := (if p3$2 then BV32_SLT($pos2.0$2, BV32_SDIV(v0, 2bv32)) else v19$2);
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p4$1 := (if p3$1 && v19$1 then v19$1 else p4$1);
    p4$2 := (if p3$2 && v19$2 then v19$2 else p4$2);
    p3$1 := (if p3$1 && !v19$1 then v19$1 else p3$1);
    p3$2 := (if p3$2 && !v19$2 then v19$2 else p3$2);
    v20$1 := (if p4$1 then BV32_SHL($pos2.0$1, 1bv32) else v20$1);
    v20$2 := (if p4$2 then BV32_SHL($pos2.0$2, 1bv32) else v20$2);
    v21$1 := (if p4$1 then BV32_ADD(v20$1, 1bv32) else v21$1);
    v21$2 := (if p4$2 then BV32_ADD(v20$2, 1bv32) else v21$2);
    call {:sourceloc} {:sourceloc_num 25} _LOG_READ_$$s_data(p4$1, v20$1, $$s_data[1bv1][v20$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 25} _CHECK_READ_$$s_data(p4$2, v20$2, $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v20$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$s_data"} true;
    v22$1 := (if p4$1 then $$s_data[1bv1][v20$1] else v22$1);
    v22$2 := (if p4$2 then $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v20$2] else v22$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_READ_$$s_data(p4$1, v21$1, $$s_data[1bv1][v21$1]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 26} _CHECK_READ_$$s_data(p4$2, v21$2, $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v21$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$s_data"} true;
    v23$1 := (if p4$1 then $$s_data[1bv1][v21$1] else v23$1);
    v23$2 := (if p4$2 then $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v21$2] else v23$2);
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$s_data(p4$1, v20$1, FADD32(v22$1, v23$1), $$s_data[1bv1][v20$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$s_data(p4$2, v20$2);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$s_data(p4$2, v20$2, FADD32(v22$2, v23$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$s_data"} true;
    $$s_data[1bv1][v20$1] := (if p4$1 then FADD32(v22$1, v23$1) else $$s_data[1bv1][v20$1]);
    $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v20$2] := (if p4$2 then FADD32(v22$2, v23$2) else $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v20$2]);
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$s_data(p4$1, v21$1, FSUB32(v22$1, v23$1), $$s_data[1bv1][v21$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$s_data(p4$2, v21$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$s_data(p4$2, v21$2, FSUB32(v22$2, v23$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$s_data"} true;
    $$s_data[1bv1][v21$1] := (if p4$1 then FSUB32(v22$1, v23$1) else $$s_data[1bv1][v21$1]);
    $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v21$2] := (if p4$2 then FSUB32(v22$2, v23$2) else $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v21$2]);
    $pos2.0$1 := (if p4$1 then BV32_ADD($pos2.0$1, group_size_x) else $pos2.0$1);
    $pos2.0$2 := (if p4$2 then BV32_ADD($pos2.0$2, group_size_x) else $pos2.0$2);
    p3$1 := (if p4$1 then true else p3$1);
    p3$2 := (if p4$2 then true else p3$2);
    goto $10.backedge, $10.tail;

  $10.tail:
    assume !p3$1 && !p3$2;
    goto $14;

  $10.backedge:
    assume {:backedge} p3$1 || p3$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $10;

  __partitioned_block_$truebb0_0:
    assume {:partition} v4 && v4;
    v5$1 := BV32_AND(local_id_x$1, BV32_SUB($stride.0, 1bv32));
    v5$2 := BV32_AND(local_id_x$2, BV32_SUB($stride.0, 1bv32));
    v6$1 := BV32_ADD(BV32_SHL(BV32_SUB(local_id_x$1, v5$1), 2bv32), v5$1);
    v6$2 := BV32_ADD(BV32_SHL(BV32_SUB(local_id_x$2, v5$2), 2bv32), v5$2);
    v7$1 := BV32_ADD(v6$1, $stride.0);
    v7$2 := BV32_ADD(v6$2, $stride.0);
    v8$1 := BV32_ADD(v7$1, $stride.0);
    v8$2 := BV32_ADD(v7$2, $stride.0);
    v9$1 := BV32_ADD(v8$1, $stride.0);
    v9$2 := BV32_ADD(v8$2, $stride.0);
    goto __partitioned_block_$truebb0_1;

  __partitioned_block_$truebb0_1:
    call {:sourceloc_num 10} $bugle_barrier_duplicated_2(1bv1, 1bv1);
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$s_data(true, v6$1, $$s_data[1bv1][v6$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$s_data(true, v6$2, $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v6$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$s_data"} true;
    v10$1 := $$s_data[1bv1][v6$1];
    v10$2 := $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v6$2];
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$s_data(true, v7$1, $$s_data[1bv1][v7$1]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$s_data(true, v7$2, $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v7$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$s_data"} true;
    v11$1 := $$s_data[1bv1][v7$1];
    v11$2 := $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v7$2];
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$s_data(true, v8$1, $$s_data[1bv1][v8$1]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$s_data(true, v8$2, $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v8$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$s_data"} true;
    v12$1 := $$s_data[1bv1][v8$1];
    v12$2 := $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v8$2];
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$s_data(true, v9$1, $$s_data[1bv1][v9$1]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$s_data(true, v9$2, $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$s_data"} true;
    v13$1 := $$s_data[1bv1][v9$1];
    v13$2 := $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2];
    v14$1 := FADD32(v10$1, v12$1);
    v14$2 := FADD32(v10$2, v12$2);
    v15$1 := FSUB32(v10$1, v12$1);
    v15$2 := FSUB32(v10$2, v12$2);
    v16$1 := FADD32(v11$1, v13$1);
    v16$2 := FADD32(v11$2, v13$2);
    v17$1 := FSUB32(v11$1, v13$1);
    v17$2 := FSUB32(v11$2, v13$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$s_data(true, v6$1, FADD32(v14$1, v16$1), $$s_data[1bv1][v6$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$s_data(true, v6$2);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$s_data(true, v6$2, FADD32(v14$2, v16$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$s_data"} true;
    $$s_data[1bv1][v6$1] := FADD32(v14$1, v16$1);
    $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v6$2] := FADD32(v14$2, v16$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$s_data(true, v7$1, FSUB32(v14$1, v16$1), $$s_data[1bv1][v7$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$s_data(true, v7$2);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$s_data(true, v7$2, FSUB32(v14$2, v16$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$s_data"} true;
    $$s_data[1bv1][v7$1] := FSUB32(v14$1, v16$1);
    $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v7$2] := FSUB32(v14$2, v16$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$s_data(true, v8$1, FADD32(v15$1, v17$1), $$s_data[1bv1][v8$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$s_data(true, v8$2);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$s_data(true, v8$2, FADD32(v15$2, v17$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$s_data"} true;
    $$s_data[1bv1][v8$1] := FADD32(v15$1, v17$1);
    $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v8$2] := FADD32(v15$2, v17$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$s_data(true, v9$1, FSUB32(v15$1, v17$1), $$s_data[1bv1][v9$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$s_data(true, v9$2);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$s_data(true, v9$2, FSUB32(v15$2, v17$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$s_data"} true;
    $$s_data[1bv1][v9$1] := FSUB32(v15$1, v17$1);
    $$s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2] := FSUB32(v15$2, v17$2);
    $stride.0 := BV32_ASHR($stride.0, 2bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $5;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 2048bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4096bv32 then 1bv1 else 0bv1) != 0bv1;

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
  requires $1 == 1bv1;
  modifies $$s_data, $$d_Output, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$s_data, $$d_Output, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$s_data, $$d_Output, _TRACKING;



const {:existential true} _b0: bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

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

const {:existential true} _b18: bool;

const {:existential true} _b19: bool;

const {:existential true} _b20: bool;

const {:existential true} _b21: bool;

const {:existential true} _b22: bool;

const {:existential true} _b23: bool;

const {:existential true} _b24: bool;

const {:existential true} _b25: bool;

const {:existential true} _b26: bool;

const {:existential true} _b27: bool;

const {:existential true} _b28: bool;

const _WATCHED_VALUE_$$d_Output: bv32;

procedure {:inline 1} _LOG_READ_$$d_Output(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Output;



implementation {:inline 1} _LOG_READ_$$d_Output(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output == _value then true else _READ_HAS_OCCURRED_$$d_Output);
    return;
}



procedure _CHECK_READ_$$d_Output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Output);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Output: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Output, _WRITE_READ_BENIGN_FLAG_$$d_Output;



implementation {:inline 1} _LOG_WRITE_$$d_Output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output == _value then true else _WRITE_HAS_OCCURRED_$$d_Output);
    _WRITE_READ_BENIGN_FLAG_$$d_Output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Output);
    return;
}



procedure _CHECK_WRITE_$$d_Output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output != _value);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Output != _value);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Output(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Output;



implementation {:inline 1} _LOG_ATOMIC_$$d_Output(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Output);
    return;
}



procedure _CHECK_ATOMIC_$$d_Output(_P: bool, _offset: bv32);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Output"} {:array "$$d_Output"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Output(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Output;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Output(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Output := (if _P && _WRITE_HAS_OCCURRED_$$d_Output && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Output);
    return;
}



const _WATCHED_VALUE_$$d_Input: bv32;

procedure {:inline 1} _LOG_READ_$$d_Input(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Input;



implementation {:inline 1} _LOG_READ_$$d_Input(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input == _value then true else _READ_HAS_OCCURRED_$$d_Input);
    return;
}



procedure _CHECK_READ_$$d_Input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Input);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Input: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Input, _WRITE_READ_BENIGN_FLAG_$$d_Input;



implementation {:inline 1} _LOG_WRITE_$$d_Input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input == _value then true else _WRITE_HAS_OCCURRED_$$d_Input);
    _WRITE_READ_BENIGN_FLAG_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Input);
    return;
}



procedure _CHECK_WRITE_$$d_Input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input != _value);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input != _value);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Input(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Input;



implementation {:inline 1} _LOG_ATOMIC_$$d_Input(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Input);
    return;
}



procedure _CHECK_ATOMIC_$$d_Input(_P: bool, _offset: bv32);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Input(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Input;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Input(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Input := (if _P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Input);
    return;
}



const _WATCHED_VALUE_$$s_data: bv32;

procedure {:inline 1} _LOG_READ_$$s_data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$s_data;



implementation {:inline 1} _LOG_READ_$$s_data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$s_data == _value then true else _READ_HAS_OCCURRED_$$s_data);
    return;
}



procedure _CHECK_READ_$$s_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_data"} {:array "$$s_data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$s_data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$s_data && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$s_data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$s_data: bool;

procedure {:inline 1} _LOG_WRITE_$$s_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$s_data, _WRITE_READ_BENIGN_FLAG_$$s_data;



implementation {:inline 1} _LOG_WRITE_$$s_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$s_data == _value then true else _WRITE_HAS_OCCURRED_$$s_data);
    _WRITE_READ_BENIGN_FLAG_$$s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$s_data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$s_data);
    return;
}



procedure _CHECK_WRITE_$$s_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_data"} {:array "$$s_data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$s_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$s_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$s_data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$s_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$s_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$s_data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$s_data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$s_data;



implementation {:inline 1} _LOG_ATOMIC_$$s_data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$s_data);
    return;
}



procedure _CHECK_ATOMIC_$$s_data(_P: bool, _offset: bv32);
  requires {:source_name "s_data"} {:array "$$s_data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$s_data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$s_data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$s_data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$s_data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$s_data := (if _P && _WRITE_HAS_OCCURRED_$$s_data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$s_data);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$s_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$s_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$s_data;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_Output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_Output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_Output;
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
    havoc $$d_Output;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$s_data;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$s_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$s_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$s_data;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_Output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_Output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_Output;
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
    havoc $$d_Output;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$s_data;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$s_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$s_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$s_data;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_Output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_Output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_Output;
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
    havoc $$d_Output;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$s_data;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



const {:existential true} _b29: bool;

const {:existential true} _b30: bool;

const {:existential true} _b31: bool;

const {:existential true} _b32: bool;

const {:existential true} _b33: bool;

const {:existential true} _b34: bool;

const {:existential true} _b35: bool;

const {:existential true} _b36: bool;

const {:existential true} _b37: bool;

const {:existential true} _b38: bool;

const {:existential true} _b39: bool;

const {:existential true} _b40: bool;

const {:existential true} _b41: bool;

const {:existential true} _b42: bool;

const {:existential true} _b43: bool;

const {:existential true} _b44: bool;
