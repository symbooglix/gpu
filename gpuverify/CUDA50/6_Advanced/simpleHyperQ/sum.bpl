type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_clocks"} {:global} $$d_clocks: [bv32]bv32;

axiom {:array_info "$$d_clocks"} {:global} {:elem_width 32} {:source_name "d_clocks"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_clocks: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_clocks: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_clocks: bool;

var {:source_name "s_clocks"} {:group_shared} $$_ZZ3sumPjiE8s_clocks: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ3sumPjiE8s_clocks"} {:group_shared} {:elem_width 32} {:source_name "s_clocks"} {:source_elem_width 32} {:source_dimensions "32"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks: bool;

const _WATCHED_OFFSET: bv32;

const {:group_size_x} group_size_x: bv32;

const {:group_size_y} group_size_y: bv32;

const {:group_size_z} group_size_z: bv32;

const {:local_id_x} local_id_x$1: bv32;

const {:local_id_x} local_id_x$2: bv32;

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "sum"} {:kernel} $_Z3sumPji($N: bv32);
  requires !_READ_HAS_OCCURRED_$$d_clocks && !_WRITE_HAS_OCCURRED_$$d_clocks && !_ATOMIC_HAS_OCCURRED_$$d_clocks;
  requires !_READ_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks && !_WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks && !_ATOMIC_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks;
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
  modifies $$_ZZ3sumPjiE8s_clocks, _READ_HAS_OCCURRED_$$d_clocks, _WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks, _WRITE_READ_BENIGN_FLAG_$$_ZZ3sumPjiE8s_clocks, _WRITE_READ_BENIGN_FLAG_$$_ZZ3sumPjiE8s_clocks, $$d_clocks, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks, _WRITE_HAS_OCCURRED_$$d_clocks, _WRITE_READ_BENIGN_FLAG_$$d_clocks, _WRITE_READ_BENIGN_FLAG_$$d_clocks, _TRACKING;



implementation {:source_name "sum"} {:kernel} $_Z3sumPji($N: bv32)
{
  var $my_sum.0$1: bv32;
  var $my_sum.0$2: bv32;
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $i1.0: bv32;
  var v0$1: bool;
  var v0$2: bool;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bool;
  var v3$1: bool;
  var v3$2: bool;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
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


  $0:
    $my_sum.0$1, $i.0$1 := 0bv32, local_id_x$1;
    $my_sum.0$2, $i.0$2 := 0bv32, local_id_x$2;
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b12 ==> _READ_HAS_OCCURRED_$$d_clocks ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$1);
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b6 ==> BV32_SLT($i.0$1, $N) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b6 ==> BV32_SLT($i.0$2, $N) ==> p0$2;
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b5 ==> BV32_UGE($i.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b5 ==> BV32_UGE($i.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b4 ==> BV32_ULE($i.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b4 ==> BV32_ULE($i.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b3 ==> BV32_SGE($i.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b3 ==> BV32_SGE($i.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b2 ==> BV32_SLE($i.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b2 ==> BV32_SLE($i.0$2, local_id_x$2);
    assert {:tag "guardNonNeg"} {:thread 1} p0$1 ==> _b1 ==> BV32_SLE(0bv32, $i.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p0$2 ==> _b1 ==> BV32_SLE(0bv32, $i.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b0 ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), $i.0$1) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$1);
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b0 ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), $i.0$2) == BV32_AND(BV32_SUB(group_size_x, 1bv32), local_id_x$2);
    assert {:block_sourceloc} {:sourceloc_num 1} p0$1 ==> true;
    v0$1 := (if p0$1 then BV32_SLT($i.0$1, $N) else v0$1);
    v0$2 := (if p0$2 then BV32_SLT($i.0$2, $N) else v0$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p1$1 := (if p0$1 && v0$1 then v0$1 else p1$1);
    p1$2 := (if p0$2 && v0$2 then v0$2 else p1$2);
    p0$1 := (if p0$1 && !v0$1 then v0$1 else p0$1);
    p0$2 := (if p0$2 && !v0$2 then v0$2 else p0$2);
    call {:sourceloc} {:sourceloc_num 3} _LOG_READ_$$d_clocks(p1$1, $i.0$1, $$d_clocks[$i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 3} _CHECK_READ_$$d_clocks(p1$2, $i.0$2, $$d_clocks[$i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_clocks"} true;
    v1$1 := (if p1$1 then $$d_clocks[$i.0$1] else v1$1);
    v1$2 := (if p1$2 then $$d_clocks[$i.0$2] else v1$2);
    $my_sum.0$1, $i.0$1 := (if p1$1 then BV32_ADD($my_sum.0$1, v1$1) else $my_sum.0$1), (if p1$1 then BV32_ADD($i.0$1, group_size_x) else $i.0$1);
    $my_sum.0$2, $i.0$2 := (if p1$2 then BV32_ADD($my_sum.0$2, v1$2) else $my_sum.0$2), (if p1$2 then BV32_ADD($i.0$2, group_size_x) else $i.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, __partitioned_block_$1.tail_0;

  __partitioned_block_$1.tail_0:
    assume !p0$1 && !p0$2;
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$_ZZ3sumPjiE8s_clocks(true, local_id_x$1, $my_sum.0$1, $$_ZZ3sumPjiE8s_clocks[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ3sumPjiE8s_clocks(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$_ZZ3sumPjiE8s_clocks(true, local_id_x$2, $my_sum.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ3sumPjiE8s_clocks"} true;
    $$_ZZ3sumPjiE8s_clocks[1bv1][local_id_x$1] := $my_sum.0$1;
    $$_ZZ3sumPjiE8s_clocks[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := $my_sum.0$2;
    goto __partitioned_block_$1.tail_1;

  __partitioned_block_$1.tail_1:
    call {:sourceloc_num 7} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $i1.0 := 16bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b18 ==> _WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b17 ==> _READ_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b16 ==> !_WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks;
    assert {:tag "noread"} _b15 ==> !_READ_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks;
    assert {:tag "pow2NotZero"} _b14 ==> $i1.0 != 0bv32;
    assert {:tag "pow2"} _b13 ==> $i1.0 == 0bv32 || BV32_AND($i1.0, BV32_SUB($i1.0, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b11 ==> BV32_UGE($i1.0, 16bv32);
    assert {:tag "loopBound"} {:thread 2} _b11 ==> BV32_UGE($i1.0, 16bv32);
    assert {:tag "loopBound"} {:thread 1} _b10 ==> BV32_ULE($i1.0, 16bv32);
    assert {:tag "loopBound"} {:thread 2} _b10 ==> BV32_ULE($i1.0, 16bv32);
    assert {:tag "loopBound"} {:thread 1} _b9 ==> BV32_SGE($i1.0, 16bv32);
    assert {:tag "loopBound"} {:thread 2} _b9 ==> BV32_SGE($i1.0, 16bv32);
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_SLE($i1.0, 16bv32);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_SLE($i1.0, 16bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b7 ==> BV32_SLE(0bv32, $i1.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b7 ==> BV32_SLE(0bv32, $i1.0);
    assert {:block_sourceloc} {:sourceloc_num 8} true;
    v2 := BV32_SGT($i1.0, 0bv32);
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    goto __partitioned_block_$truebb0_0, $falsebb0;

  $falsebb0:
    assume {:partition} !v2 && !v2;
    call {:sourceloc} {:sourceloc_num 18} _LOG_READ_$$_ZZ3sumPjiE8s_clocks(true, 0bv32, $$_ZZ3sumPjiE8s_clocks[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 18} _CHECK_READ_$$_ZZ3sumPjiE8s_clocks(true, 0bv32, $$_ZZ3sumPjiE8s_clocks[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ3sumPjiE8s_clocks"} true;
    v6$1 := $$_ZZ3sumPjiE8s_clocks[1bv1][0bv32];
    v6$2 := $$_ZZ3sumPjiE8s_clocks[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$d_clocks(true, 0bv32, v6$1, $$d_clocks[0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_clocks(true, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$d_clocks(true, 0bv32, v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_clocks"} true;
    $$d_clocks[0bv32] := v6$1;
    $$d_clocks[0bv32] := v6$2;
    return;

  __partitioned_block_$truebb0_0:
    assume {:partition} v2 && v2;
    v3$1 := BV32_ULT(local_id_x$1, $i1.0);
    v3$2 := BV32_ULT(local_id_x$2, $i1.0);
    p4$1 := (if v3$1 then v3$1 else p4$1);
    p4$2 := (if v3$2 then v3$2 else p4$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$_ZZ3sumPjiE8s_clocks(p4$1, BV32_ADD(local_id_x$1, $i1.0), $$_ZZ3sumPjiE8s_clocks[1bv1][BV32_ADD(local_id_x$1, $i1.0)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$_ZZ3sumPjiE8s_clocks(p4$2, BV32_ADD(local_id_x$2, $i1.0), $$_ZZ3sumPjiE8s_clocks[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, $i1.0)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ3sumPjiE8s_clocks"} true;
    v4$1 := (if p4$1 then $$_ZZ3sumPjiE8s_clocks[1bv1][BV32_ADD(local_id_x$1, $i1.0)] else v4$1);
    v4$2 := (if p4$2 then $$_ZZ3sumPjiE8s_clocks[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, $i1.0)] else v4$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$_ZZ3sumPjiE8s_clocks(p4$1, local_id_x$1, $$_ZZ3sumPjiE8s_clocks[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$_ZZ3sumPjiE8s_clocks(p4$2, local_id_x$2, $$_ZZ3sumPjiE8s_clocks[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ3sumPjiE8s_clocks"} true;
    v5$1 := (if p4$1 then $$_ZZ3sumPjiE8s_clocks[1bv1][local_id_x$1] else v5$1);
    v5$2 := (if p4$2 then $$_ZZ3sumPjiE8s_clocks[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v5$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$_ZZ3sumPjiE8s_clocks(p4$1, local_id_x$1, BV32_ADD(v5$1, v4$1), $$_ZZ3sumPjiE8s_clocks[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ3sumPjiE8s_clocks(p4$2, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$_ZZ3sumPjiE8s_clocks(p4$2, local_id_x$2, BV32_ADD(v5$2, v4$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ3sumPjiE8s_clocks"} true;
    $$_ZZ3sumPjiE8s_clocks[1bv1][local_id_x$1] := (if p4$1 then BV32_ADD(v5$1, v4$1) else $$_ZZ3sumPjiE8s_clocks[1bv1][local_id_x$1]);
    $$_ZZ3sumPjiE8s_clocks[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := (if p4$2 then BV32_ADD(v5$2, v4$2) else $$_ZZ3sumPjiE8s_clocks[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    goto __partitioned_block_$truebb0_1;

  __partitioned_block_$truebb0_1:
    call {:sourceloc_num 15} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    $i1.0 := BV32_SDIV($i1.0, 2bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $5;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$_ZZ3sumPjiE8s_clocks, $$d_clocks, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ3sumPjiE8s_clocks, $$d_clocks, _TRACKING;



function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

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

const _WATCHED_VALUE_$$d_clocks: bv32;

procedure {:inline 1} _LOG_READ_$$d_clocks(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_clocks;



implementation {:inline 1} _LOG_READ_$$d_clocks(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_clocks := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_clocks == _value then true else _READ_HAS_OCCURRED_$$d_clocks);
    return;
}



procedure _CHECK_READ_$$d_clocks(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_clocks"} {:array "$$d_clocks"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_clocks && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_clocks);
  requires {:source_name "d_clocks"} {:array "$$d_clocks"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_clocks && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_clocks: bool;

procedure {:inline 1} _LOG_WRITE_$$d_clocks(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_clocks, _WRITE_READ_BENIGN_FLAG_$$d_clocks;



implementation {:inline 1} _LOG_WRITE_$$d_clocks(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_clocks := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_clocks == _value then true else _WRITE_HAS_OCCURRED_$$d_clocks);
    _WRITE_READ_BENIGN_FLAG_$$d_clocks := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_clocks == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_clocks);
    return;
}



procedure _CHECK_WRITE_$$d_clocks(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_clocks"} {:array "$$d_clocks"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_clocks && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_clocks != _value);
  requires {:source_name "d_clocks"} {:array "$$d_clocks"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_clocks && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_clocks != _value);
  requires {:source_name "d_clocks"} {:array "$$d_clocks"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_clocks && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_clocks(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_clocks;



implementation {:inline 1} _LOG_ATOMIC_$$d_clocks(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_clocks := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_clocks);
    return;
}



procedure _CHECK_ATOMIC_$$d_clocks(_P: bool, _offset: bv32);
  requires {:source_name "d_clocks"} {:array "$$d_clocks"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_clocks && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_clocks"} {:array "$$d_clocks"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_clocks && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_clocks(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_clocks;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_clocks(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_clocks := (if _P && _WRITE_HAS_OCCURRED_$$d_clocks && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_clocks);
    return;
}



const _WATCHED_VALUE_$$_ZZ3sumPjiE8s_clocks: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ3sumPjiE8s_clocks(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks;



implementation {:inline 1} _LOG_READ_$$_ZZ3sumPjiE8s_clocks(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ3sumPjiE8s_clocks == _value then true else _READ_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks);
    return;
}



procedure _CHECK_READ_$$_ZZ3sumPjiE8s_clocks(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_clocks"} {:array "$$_ZZ3sumPjiE8s_clocks"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ3sumPjiE8s_clocks && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_clocks"} {:array "$$_ZZ3sumPjiE8s_clocks"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ3sumPjiE8s_clocks: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ3sumPjiE8s_clocks(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks, _WRITE_READ_BENIGN_FLAG_$$_ZZ3sumPjiE8s_clocks;



implementation {:inline 1} _LOG_WRITE_$$_ZZ3sumPjiE8s_clocks(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ3sumPjiE8s_clocks == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ3sumPjiE8s_clocks := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ3sumPjiE8s_clocks == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ3sumPjiE8s_clocks);
    return;
}



procedure _CHECK_WRITE_$$_ZZ3sumPjiE8s_clocks(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_clocks"} {:array "$$_ZZ3sumPjiE8s_clocks"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ3sumPjiE8s_clocks != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_clocks"} {:array "$$_ZZ3sumPjiE8s_clocks"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ3sumPjiE8s_clocks != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_clocks"} {:array "$$_ZZ3sumPjiE8s_clocks"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ3sumPjiE8s_clocks(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ3sumPjiE8s_clocks(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ3sumPjiE8s_clocks(_P: bool, _offset: bv32);
  requires {:source_name "s_clocks"} {:array "$$_ZZ3sumPjiE8s_clocks"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_clocks"} {:array "$$_ZZ3sumPjiE8s_clocks"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ3sumPjiE8s_clocks(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ3sumPjiE8s_clocks;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ3sumPjiE8s_clocks(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ3sumPjiE8s_clocks := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ3sumPjiE8s_clocks);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_clocks;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_clocks;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_clocks;
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
    havoc $$d_clocks;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ3sumPjiE8s_clocks;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ3sumPjiE8s_clocks;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_clocks;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_clocks;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_clocks;
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
    havoc $$d_clocks;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ3sumPjiE8s_clocks;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



const {:existential true} _b12: bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const {:existential true} _b17: bool;

const {:existential true} _b18: bool;
