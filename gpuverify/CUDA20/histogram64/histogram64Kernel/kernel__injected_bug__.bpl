type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "d_Result"} {:global} $$d_Result: [bv32]bv32;

axiom {:array_info "$$d_Result"} {:global} {:elem_width 32} {:source_name "d_Result"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Result: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Result: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Result: bool;

axiom {:array_info "$$d_Data"} {:global} {:elem_width 32} {:source_name "d_Data"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Data: bool;

var {:source_name "s_Hist"} {:group_shared} $$_ZZ17histogram64KernelPjS_iE6s_Hist: [bv1][bv32]bv8;

axiom {:array_info "$$_ZZ17histogram64KernelPjS_iE6s_Hist"} {:group_shared} {:elem_width 8} {:source_name "s_Hist"} {:source_elem_width 8} {:source_dimensions "8192"} true;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist: bool;

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

function {:bvbuiltin "bvadd"} BV8_ADD(bv8, bv8) : bv8;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV32_OR(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 24"} BV8_ZEXT32(bv8) : bv32;

procedure {:source_name "histogram64Kernel"} {:kernel} $_Z17histogram64KernelPjS_i($dataN: bv32);
  requires !_READ_HAS_OCCURRED_$$d_Result && !_WRITE_HAS_OCCURRED_$$d_Result && !_ATOMIC_HAS_OCCURRED_$$d_Result;
  requires !_READ_HAS_OCCURRED_$$d_Data && !_WRITE_HAS_OCCURRED_$$d_Data && !_ATOMIC_HAS_OCCURRED_$$d_Data;
  requires !_READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist && !_WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist && !_ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist;
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
  modifies $$_ZZ17histogram64KernelPjS_iE6s_Hist, $$d_Result, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist, _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist, _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist, _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist, _TRACKING, _TRACKING, _WRITE_HAS_OCCURRED_$$d_Result, _WRITE_READ_BENIGN_FLAG_$$d_Result, _WRITE_READ_BENIGN_FLAG_$$d_Result;



implementation {:source_name "histogram64Kernel"} {:kernel} $_Z17histogram64KernelPjS_i($dataN: bv32)
{
  var $i.0: bv32;
  var $pos.0$1: bv32;
  var $pos.0$2: bv32;
  var $sum.0$1: bv32;
  var $sum.0$2: bv32;
  var $j.0$1: bv32;
  var $j.0$2: bv32;
  var $accumPos.0$1: bv32;
  var $accumPos.0$2: bv32;
  var $accumPos.1$1: bv32;
  var $accumPos.1$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1: bool;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv8;
  var v5$2: bv8;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv8;
  var v7$2: bv8;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bool;
  var v13$2: bool;
  var v14$1: bv8;
  var v14$2: bv8;
  var v16$1: bool;
  var v16$2: bool;
  var v15$1: bv32;
  var v15$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_OR(BV32_OR(BV32_LSHR(BV32_AND(local_id_x$1, 4294967232bv32), 0bv32), BV32_SHL(BV32_AND(local_id_x$1, 15bv32), 2bv32)), BV32_LSHR(BV32_AND(local_id_x$1, 48bv32), 4bv32));
    v0$2 := BV32_OR(BV32_OR(BV32_LSHR(BV32_AND(local_id_x$2, 4294967232bv32), 0bv32), BV32_SHL(BV32_AND(local_id_x$2, 15bv32), 2bv32)), BV32_LSHR(BV32_AND(local_id_x$2, 48bv32), 4bv32));
    $i.0 := 0bv32;
    p0$1 := false;
    p0$2 := false;
    p4$1 := false;
    p4$2 := false;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b26 ==> _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 128bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 128bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 128bv32), local_id_x$1));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($i.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $i.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $i.0);
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v1 := BV32_SLT($i.0, 16bv32);
    goto $truebb, __partitioned_block_$falsebb_0;

  __partitioned_block_$falsebb_0:
    assume {:partition} !v1 && !v1;
    goto __partitioned_block_$falsebb_1;

  __partitioned_block_$falsebb_1:
    call {:sourceloc_num 6} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $pos.0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    $pos.0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b11 ==> BV32_SLT($pos.0$1, $dataN) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b11 ==> BV32_SLT($pos.0$2, $dataN) ==> p0$2;
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b10 ==> BV32_UGE($pos.0$1, BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b10 ==> BV32_UGE($pos.0$2, BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b9 ==> BV32_ULE($pos.0$1, BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b9 ==> BV32_ULE($pos.0$2, BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b8 ==> BV32_SGE($pos.0$1, BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b8 ==> BV32_SGE($pos.0$2, BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b7 ==> BV32_SLE($pos.0$1, BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b7 ==> BV32_SLE($pos.0$2, BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2));
    assert {:tag "guardNonNeg"} {:thread 1} p0$1 ==> _b6 ==> BV32_SLE(0bv32, $pos.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p0$2 ==> _b6 ==> BV32_SLE(0bv32, $pos.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b5 ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), $pos.0$1) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b5 ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), $pos.0$2) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2));
    assert {:block_sourceloc} {:sourceloc_num 7} p0$1 ==> true;
    v2$1 := (if p0$1 then BV32_SLT($pos.0$1, $dataN) else v2$1);
    v2$2 := (if p0$2 then BV32_SLT($pos.0$2, $dataN) else v2$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p8$1 := false;
    p8$2 := false;
    p1$1 := (if p0$1 && v2$1 then v2$1 else p1$1);
    p1$2 := (if p0$2 && v2$2 then v2$2 else p1$2);
    p0$1 := (if p0$1 && !v2$1 then v2$1 else p0$1);
    p0$2 := (if p0$2 && !v2$2 then v2$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p1$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p1$2 then _HAVOC_bv32$2 else v3$2);
    v4$1 := (if p1$1 then BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v3$1, 2bv32), 63bv32), 128bv32)) else v4$1);
    v4$2 := (if p1$2 then BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v3$2, 2bv32), 63bv32), 128bv32)) else v4$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$1, v4$1, $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v4$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$2, v4$2, $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist"} true;
    v5$1 := (if p1$1 then $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v4$1] else v5$1);
    v5$2 := (if p1$2 then $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2] else v5$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$1, v4$1, BV8_ADD(v5$1, 1bv8), $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v4$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$2, v4$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$2, v4$2, BV8_ADD(v5$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v4$1] := (if p1$1 then BV8_ADD(v5$1, 1bv8) else $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v4$1]);
    $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2] := (if p1$2 then BV8_ADD(v5$2, 1bv8) else $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2]);
    v6$1 := (if p1$1 then BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v3$1, 10bv32), 63bv32), 128bv32)) else v6$1);
    v6$2 := (if p1$2 then BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v3$2, 10bv32), 63bv32), 128bv32)) else v6$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$1, v6$1, $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v6$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$2, v6$2, $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v6$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist"} true;
    v7$1 := (if p1$1 then $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v6$1] else v7$1);
    v7$2 := (if p1$2 then $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v6$2] else v7$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$1, v6$1, BV8_ADD(v7$1, 1bv8), $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v6$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$2, v6$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$2, v6$2, BV8_ADD(v7$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v6$1] := (if p1$1 then BV8_ADD(v7$1, 1bv8) else $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v6$1]);
    $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v6$2] := (if p1$2 then BV8_ADD(v7$2, 1bv8) else $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v6$2]);
    v8$1 := (if p1$1 then BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v3$1, 18bv32), 63bv32), 128bv32)) else v8$1);
    v8$2 := (if p1$2 then BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v3$2, 18bv32), 63bv32), 128bv32)) else v8$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$1, v8$1, $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v8$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$2, v8$2, $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v8$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist"} true;
    v9$1 := (if p1$1 then $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v8$1] else v9$1);
    v9$2 := (if p1$2 then $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v8$2] else v9$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$1, v8$1, BV8_ADD(v9$1, 1bv8), $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v8$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$2, v8$2);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$2, v8$2, BV8_ADD(v9$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v8$1] := (if p1$1 then BV8_ADD(v9$1, 1bv8) else $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v8$1]);
    $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v8$2] := (if p1$2 then BV8_ADD(v9$2, 1bv8) else $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v8$2]);
    v10$1 := (if p1$1 then BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v3$1, 26bv32), 63bv32), 128bv32)) else v10$1);
    v10$2 := (if p1$2 then BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v3$2, 26bv32), 63bv32), 128bv32)) else v10$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$1, v10$1, $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v10$1]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$2, v10$2, $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v10$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist"} true;
    v11$1 := (if p1$1 then $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v10$1] else v11$1);
    v11$2 := (if p1$2 then $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v10$2] else v11$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$1, v10$1, BV8_ADD(v11$1, 1bv8), $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v10$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$2, v10$2);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p1$2, v10$2, BV8_ADD(v11$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v10$1] := (if p1$1 then BV8_ADD(v11$1, 1bv8) else $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][v10$1]);
    $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v10$2] := (if p1$2 then BV8_ADD(v11$2, 1bv8) else $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v10$2]);
    $pos.0$1 := (if p1$1 then BV32_ADD($pos.0$1, BV32_MUL(group_size_x, num_groups_x)) else $pos.0$1);
    $pos.0$2 := (if p1$2 then BV32_ADD($pos.0$2, BV32_MUL(group_size_x, num_groups_x)) else $pos.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $5.backedge, __partitioned_block_$5.tail_0;

  __partitioned_block_$5.tail_0:
    assume !p0$1 && !p0$2;
    goto __partitioned_block_$5.tail_1;

  __partitioned_block_$5.tail_1:
    call {:sourceloc_num 20} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    v12$1 := BV32_ULT(local_id_x$1, 64bv32);
    v12$2 := BV32_ULT(local_id_x$2, 64bv32);
    p3$1 := (if v12$1 then v12$1 else p3$1);
    p3$2 := (if v12$2 then v12$2 else p3$2);
    goto __partitioned_block_$5.tail_2;

  __partitioned_block_$5.tail_2:
    call {:sourceloc_num 22} $bugle_barrier_duplicated_2(1bv1, 1bv1, p3$1, p3$2);
    $sum.0$1, $j.0$1, $accumPos.0$1 := (if p3$1 then 0bv32 else $sum.0$1), (if p3$1 then 0bv32 else $j.0$1), (if p3$1 then BV32_MUL(BV32_AND(local_id_x$1, 15bv32), 4bv32) else $accumPos.0$1);
    $sum.0$2, $j.0$2, $accumPos.0$2 := (if p3$2 then 0bv32 else $sum.0$2), (if p3$2 then 0bv32 else $j.0$2), (if p3$2 then BV32_MUL(BV32_AND(local_id_x$2, 15bv32), 4bv32) else $accumPos.0$2);
    p4$1 := (if p3$1 then true else p4$1);
    p4$2 := (if p3$2 then true else p4$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $10;

  $10:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b27 ==> _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 128bv32);
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b25 ==> _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist ==> BV32_ULT(local_id_x$1, 64bv32);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p4$1 ==> _b24 ==> p4$1 ==> BV32_ULT(local_id_x$1, 64bv32);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p4$2 ==> _b24 ==> p4$2 ==> BV32_ULT(local_id_x$2, 64bv32);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b23 ==> BV32_ULT(local_id_x$1, 64bv32) && BV32_SLT($j.0$1, 128bv32) ==> p4$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b23 ==> BV32_ULT(local_id_x$2, 64bv32) && BV32_SLT($j.0$2, 128bv32) ==> p4$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b22 ==> !BV32_ULT(local_id_x$1, 64bv32) ==> !_READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b21 ==> !BV32_ULT(local_id_x$1, 64bv32) ==> !p4$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b21 ==> !BV32_ULT(local_id_x$2, 64bv32) ==> !p4$2;
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b20 ==> BV32_UGE($accumPos.0$1, BV32_MUL(BV32_AND(local_id_x$1, 15bv32), 4bv32));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b20 ==> BV32_UGE($accumPos.0$2, BV32_MUL(BV32_AND(local_id_x$2, 15bv32), 4bv32));
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b19 ==> BV32_ULE($accumPos.0$1, BV32_MUL(BV32_AND(local_id_x$1, 15bv32), 4bv32));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b19 ==> BV32_ULE($accumPos.0$2, BV32_MUL(BV32_AND(local_id_x$2, 15bv32), 4bv32));
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b18 ==> BV32_SGE($accumPos.0$1, BV32_MUL(BV32_AND(local_id_x$1, 15bv32), 4bv32));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b18 ==> BV32_SGE($accumPos.0$2, BV32_MUL(BV32_AND(local_id_x$2, 15bv32), 4bv32));
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b17 ==> BV32_SLE($accumPos.0$1, BV32_MUL(BV32_AND(local_id_x$1, 15bv32), 4bv32));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b17 ==> BV32_SLE($accumPos.0$2, BV32_MUL(BV32_AND(local_id_x$2, 15bv32), 4bv32));
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b16 ==> BV32_UGE($j.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b16 ==> BV32_UGE($j.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b15 ==> BV32_ULE($j.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b15 ==> BV32_ULE($j.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b14 ==> BV32_SGE($j.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b14 ==> BV32_SGE($j.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b13 ==> BV32_SLE($j.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b13 ==> BV32_SLE($j.0$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p4$1 ==> _b12 ==> BV32_SLE(0bv32, $j.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p4$2 ==> _b12 ==> BV32_SLE(0bv32, $j.0$2);
    assert {:block_sourceloc} {:sourceloc_num 23} p4$1 ==> true;
    v13$1 := (if p4$1 then BV32_SLT($j.0$1, 128bv32) else v13$1);
    v13$2 := (if p4$2 then BV32_SLT($j.0$2, 128bv32) else v13$2);
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    p5$1 := (if p4$1 && v13$1 then v13$1 else p5$1);
    p5$2 := (if p4$2 && v13$2 then v13$2 else p5$2);
    p4$1 := (if p4$1 && !v13$1 then v13$1 else p4$1);
    p4$2 := (if p4$2 && !v13$2 then v13$2 else p4$2);
    call {:sourceloc} {:sourceloc_num 25} _LOG_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p5$1, BV32_ADD(BV32_MUL(local_id_x$1, 128bv32), $accumPos.0$1), $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 128bv32), $accumPos.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 25} _CHECK_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist(p5$2, BV32_ADD(BV32_MUL(local_id_x$2, 128bv32), $accumPos.0$2), $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 128bv32), $accumPos.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist"} true;
    v14$1 := (if p5$1 then $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 128bv32), $accumPos.0$1)] else v14$1);
    v14$2 := (if p5$2 then $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 128bv32), $accumPos.0$2)] else v14$2);
    v15$1 := (if p5$1 then BV32_ADD($accumPos.0$1, 1bv32) else v15$1);
    v15$2 := (if p5$2 then BV32_ADD($accumPos.0$2, 1bv32) else v15$2);
    v16$1 := (if p5$1 then v15$1 == 128bv32 else v16$1);
    v16$2 := (if p5$2 then v15$2 == 128bv32 else v16$2);
    p7$1 := (if p5$1 && v16$1 then v16$1 else p7$1);
    p7$2 := (if p5$2 && v16$2 then v16$2 else p7$2);
    p6$1 := (if p5$1 && !v16$1 then !v16$1 else p6$1);
    p6$2 := (if p5$2 && !v16$2 then !v16$2 else p6$2);
    $accumPos.1$1 := (if p6$1 then v15$1 else $accumPos.1$1);
    $accumPos.1$2 := (if p6$2 then v15$2 else $accumPos.1$2);
    $accumPos.1$1 := (if p7$1 then 0bv32 else $accumPos.1$1);
    $accumPos.1$2 := (if p7$2 then 0bv32 else $accumPos.1$2);
    $sum.0$1, $j.0$1, $accumPos.0$1 := (if p5$1 then BV32_ADD($sum.0$1, BV8_ZEXT32(v14$1)) else $sum.0$1), (if p5$1 then BV32_ADD($j.0$1, 1bv32) else $j.0$1), (if p5$1 then $accumPos.1$1 else $accumPos.0$1);
    $sum.0$2, $j.0$2, $accumPos.0$2 := (if p5$2 then BV32_ADD($sum.0$2, BV8_ZEXT32(v14$2)) else $sum.0$2), (if p5$2 then BV32_ADD($j.0$2, 1bv32) else $j.0$2), (if p5$2 then $accumPos.1$2 else $accumPos.0$2);
    p4$1 := (if p5$1 then true else p4$1);
    p4$2 := (if p5$2 then true else p4$2);
    goto $10.backedge, $10.tail;

  $10.tail:
    assume !p4$1 && !p4$2;
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$d_Result(p3$1, BV32_ADD(BV32_MUL(group_id_x$1, 64bv32), local_id_x$1), $sum.0$1, $$d_Result[BV32_ADD(BV32_MUL(group_id_x$1, 64bv32), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Result(p3$2, BV32_ADD(BV32_MUL(group_id_x$2, 64bv32), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$d_Result(p3$2, BV32_ADD(BV32_MUL(group_id_x$2, 64bv32), local_id_x$2), $sum.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Result"} true;
    $$d_Result[BV32_ADD(BV32_MUL(group_id_x$1, 64bv32), local_id_x$1)] := (if p3$1 then $sum.0$1 else $$d_Result[BV32_ADD(BV32_MUL(group_id_x$1, 64bv32), local_id_x$1)]);
    $$d_Result[BV32_ADD(BV32_MUL(group_id_x$2, 64bv32), local_id_x$2)] := (if p3$2 then $sum.0$2 else $$d_Result[BV32_ADD(BV32_MUL(group_id_x$2, 64bv32), local_id_x$2)]);
    return;

  $10.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $10;

  $5.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $5;

  $truebb:
    assume {:partition} v1 && v1;
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist(true, BV32_ADD(local_id_x$1, BV32_MUL($i.0, 128bv32)), 0bv8, $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][BV32_ADD(local_id_x$1, BV32_MUL($i.0, 128bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist(true, BV32_ADD(local_id_x$2, BV32_MUL($i.0, 128bv32)));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist(true, BV32_ADD(local_id_x$2, BV32_MUL($i.0, 128bv32)), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjS_iE6s_Hist[1bv1][BV32_ADD(local_id_x$1, BV32_MUL($i.0, 128bv32))] := 0bv8;
    $$_ZZ17histogram64KernelPjS_iE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, BV32_MUL($i.0, 128bv32))] := 0bv8;
    $i.0 := BV32_ADD($i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $1;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$_ZZ17histogram64KernelPjS_iE6s_Hist, $$d_Result, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ17histogram64KernelPjS_iE6s_Hist, $$d_Result, _TRACKING;



procedure {:inline 1} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  requires {:barrier_divergence} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 == _P$2;
  modifies $$_ZZ17histogram64KernelPjS_iE6s_Hist, $$d_Result, _TRACKING;



function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

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

const _WATCHED_VALUE_$$d_Result: bv32;

procedure {:inline 1} _LOG_READ_$$d_Result(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Result;



implementation {:inline 1} _LOG_READ_$$d_Result(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Result == _value then true else _READ_HAS_OCCURRED_$$d_Result);
    return;
}



procedure _CHECK_READ_$$d_Result(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Result"} {:array "$$d_Result"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Result && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Result);
  requires {:source_name "d_Result"} {:array "$$d_Result"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Result && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Result: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Result(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Result, _WRITE_READ_BENIGN_FLAG_$$d_Result;



implementation {:inline 1} _LOG_WRITE_$$d_Result(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Result == _value then true else _WRITE_HAS_OCCURRED_$$d_Result);
    _WRITE_READ_BENIGN_FLAG_$$d_Result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Result == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Result);
    return;
}



procedure _CHECK_WRITE_$$d_Result(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Result"} {:array "$$d_Result"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Result && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Result != _value);
  requires {:source_name "d_Result"} {:array "$$d_Result"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Result && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Result != _value);
  requires {:source_name "d_Result"} {:array "$$d_Result"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Result && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Result(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Result;



implementation {:inline 1} _LOG_ATOMIC_$$d_Result(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Result);
    return;
}



procedure _CHECK_ATOMIC_$$d_Result(_P: bool, _offset: bv32);
  requires {:source_name "d_Result"} {:array "$$d_Result"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Result && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Result"} {:array "$$d_Result"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Result && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Result(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Result;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Result(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Result := (if _P && _WRITE_HAS_OCCURRED_$$d_Result && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Result);
    return;
}



const _WATCHED_VALUE_$$d_Data: bv32;

procedure {:inline 1} _LOG_READ_$$d_Data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Data;



implementation {:inline 1} _LOG_READ_$$d_Data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data == _value then true else _READ_HAS_OCCURRED_$$d_Data);
    return;
}



procedure _CHECK_READ_$$d_Data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Data);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Data: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Data, _WRITE_READ_BENIGN_FLAG_$$d_Data;



implementation {:inline 1} _LOG_WRITE_$$d_Data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data == _value then true else _WRITE_HAS_OCCURRED_$$d_Data);
    _WRITE_READ_BENIGN_FLAG_$$d_Data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Data);
    return;
}



procedure _CHECK_WRITE_$$d_Data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data != _value);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data != _value);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Data;



implementation {:inline 1} _LOG_ATOMIC_$$d_Data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Data);
    return;
}



procedure _CHECK_ATOMIC_$$d_Data(_P: bool, _offset: bv32);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Data := (if _P && _WRITE_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Data);
    return;
}



const _WATCHED_VALUE_$$_ZZ17histogram64KernelPjS_iE6s_Hist: bv8;

procedure {:inline 1} _LOG_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist;



implementation {:inline 1} _LOG_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ17histogram64KernelPjS_iE6s_Hist == _value then true else _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist);
    return;
}



procedure _CHECK_READ_$$_ZZ17histogram64KernelPjS_iE6s_Hist(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "s_Hist"} {:array "$$_ZZ17histogram64KernelPjS_iE6s_Hist"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Hist"} {:array "$$_ZZ17histogram64KernelPjS_iE6s_Hist"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist, _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist;



implementation {:inline 1} _LOG_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ17histogram64KernelPjS_iE6s_Hist == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ17histogram64KernelPjS_iE6s_Hist == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist);
    return;
}



procedure _CHECK_WRITE_$$_ZZ17histogram64KernelPjS_iE6s_Hist(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "s_Hist"} {:array "$$_ZZ17histogram64KernelPjS_iE6s_Hist"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ17histogram64KernelPjS_iE6s_Hist != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Hist"} {:array "$$_ZZ17histogram64KernelPjS_iE6s_Hist"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ17histogram64KernelPjS_iE6s_Hist != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Hist"} {:array "$$_ZZ17histogram64KernelPjS_iE6s_Hist"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ17histogram64KernelPjS_iE6s_Hist(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ17histogram64KernelPjS_iE6s_Hist(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ17histogram64KernelPjS_iE6s_Hist(_P: bool, _offset: bv32);
  requires {:source_name "s_Hist"} {:array "$$_ZZ17histogram64KernelPjS_iE6s_Hist"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Hist"} {:array "$$_ZZ17histogram64KernelPjS_iE6s_Hist"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjS_iE6s_Hist);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_Result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_Result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_Result;
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
    havoc $$d_Result;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ17histogram64KernelPjS_iE6s_Hist;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_Result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_Result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_Result;
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
    havoc $$d_Result;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ17histogram64KernelPjS_iE6s_Hist;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjS_iE6s_Hist;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_Result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_Result;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_Result;
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
    havoc $$d_Result;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$_ZZ17histogram64KernelPjS_iE6s_Hist;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b26: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b27: bool;
