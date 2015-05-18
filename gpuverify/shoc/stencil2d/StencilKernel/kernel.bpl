type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$data"} {:global} {:elem_width 32} {:source_name "data"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data: bool;

var {:source_name "newData"} {:global} $$newData: [bv32]bv32;

axiom {:array_info "$$newData"} {:global} {:elem_width 32} {:source_name "newData"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$newData: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$newData: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$newData: bool;

var {:source_name "sh"} {:group_shared} $$sh: [bv1][bv32]bv32;

axiom {:array_info "$$sh"} {:group_shared} {:elem_width 32} {:source_name "sh"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sh: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sh: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sh: bool;

const _WATCHED_OFFSET: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

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

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "StencilKernel"} {:kernel} $StencilKernel($alignment: bv32, $wCenter: bv32, $wCardinal: bv32, $wDiagonal: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $alignment == 16bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$data && !_WRITE_HAS_OCCURRED_$$data && !_ATOMIC_HAS_OCCURRED_$$data;
  requires !_READ_HAS_OCCURRED_$$newData && !_WRITE_HAS_OCCURRED_$$newData && !_ATOMIC_HAS_OCCURRED_$$newData;
  requires !_READ_HAS_OCCURRED_$$sh && !_WRITE_HAS_OCCURRED_$$sh && !_ATOMIC_HAS_OCCURRED_$$sh;
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
  modifies $$sh, _WRITE_HAS_OCCURRED_$$sh, _WRITE_READ_BENIGN_FLAG_$$sh, _WRITE_READ_BENIGN_FLAG_$$sh, $$newData, _TRACKING, _READ_HAS_OCCURRED_$$sh, _WRITE_HAS_OCCURRED_$$newData, _WRITE_READ_BENIGN_FLAG_$$newData, _WRITE_READ_BENIGN_FLAG_$$newData;



implementation {:source_name "StencilKernel"} {:kernel} $StencilKernel($alignment: bv32, $wCenter: bv32, $wCardinal: bv32, $wDiagonal: bv32)
{
  var $0: bv32;
  var $i.0: bv32;
  var $i1.0$1: bv32;
  var $i1.0$2: bv32;
  var $i4.0$1: bv32;
  var $i4.0$2: bv32;
  var $i7.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v6: bool;
  var v2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5: bv32;
  var v7: bv32;
  var v8: bool;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bool;
  var v10$2: bool;
  var v11$1: bool;
  var v11$2: bool;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bool;
  var v13$2: bool;
  var v14$1: bool;
  var v14$2: bool;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16: bool;
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
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1$1 := local_id_y$1;
    v1$2 := local_id_y$2;
    v2 := group_size_y;
    v3$1 := BV32_ADD(BV32_MUL(group_id_x$1, 8bv32), v0$1);
    v3$2 := BV32_ADD(BV32_MUL(group_id_x$2, 8bv32), v0$2);
    v4$1 := BV32_ADD(BV32_MUL(group_id_y$1, v2), v1$1);
    v4$2 := BV32_ADD(BV32_MUL(group_id_y$2, v2), v1$2);
    v5 := BV32_ADD(BV32_MUL(num_groups_y, v2), 2bv32);
    v6 := BV32_SREM(v5, $alignment) == 0bv32;
    p1$1 := false;
    p1$2 := false;
    p5$1 := false;
    p5$2 := false;
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v6 && !v6;
    $0 := BV32_SUB($alignment, BV32_SREM(v5, $alignment));
    goto $3;

  $3:
    v7 := BV32_SUB(BV32_ADD(v5, $0), 2bv32);
    $i.0 := 0bv32;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $4;

  $4:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b32 ==> _WRITE_HAS_OCCURRED_$$sh ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, 1bv32), BV32_ADD(group_size_y, 2bv32)), BV32_ADD(local_id_y$1, 1bv32)));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sh ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sh ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sh ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
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
    assert {:block_sourceloc} {:sourceloc_num 5} true;
    v8 := BV32_SLT($i.0, 10bv32);
    p0$1 := false;
    p0$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p7$1 := false;
    p7$2 := false;
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v8 && !v8;
    v10$1 := v1$1 == 0bv32;
    v10$2 := v1$2 == 0bv32;
    p0$1 := (if v10$1 then v10$1 else p0$1);
    p0$2 := (if v10$2 then v10$2 else p0$2);
    p3$1 := (if !v10$1 then !v10$1 else p3$1);
    p3$2 := (if !v10$2 then !v10$2 else p3$2);
    $i1.0$1 := (if p0$1 then 0bv32 else $i1.0$1);
    $i1.0$2 := (if p0$2 then 0bv32 else $i1.0$2);
    p1$1 := (if p0$1 then true else p1$1);
    p1$2 := (if p0$2 then true else p1$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sh ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sh ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sh ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b31 ==> _WRITE_HAS_OCCURRED_$$sh ==> local_id_y$1 == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p1$1 ==> _b30 ==> p1$1 ==> local_id_y$1 == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p1$2 ==> _b30 ==> p1$2 ==> local_id_y$2 == 0bv32;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b29 ==> local_id_y$1 == 0bv32 && BV32_SLT($i1.0$1, 10bv32) ==> p1$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b29 ==> local_id_y$2 == 0bv32 && BV32_SLT($i1.0$2, 10bv32) ==> p1$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b28 ==> v1$1 != 0bv32 ==> !_READ_HAS_OCCURRED_$$data;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b27 ==> v1$1 != 0bv32 ==> !_WRITE_HAS_OCCURRED_$$sh;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b26 ==> v1$1 != 0bv32 ==> !p1$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b26 ==> v1$2 != 0bv32 ==> !p1$2;
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b25 ==> BV32_UGE($i1.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b25 ==> BV32_UGE($i1.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b24 ==> BV32_ULE($i1.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b24 ==> BV32_ULE($i1.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b23 ==> BV32_SGE($i1.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b23 ==> BV32_SGE($i1.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b22 ==> BV32_SLE($i1.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b22 ==> BV32_SLE($i1.0$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p1$1 ==> _b21 ==> BV32_SLE(0bv32, $i1.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p1$2 ==> _b21 ==> BV32_SLE(0bv32, $i1.0$2);
    assert {:block_sourceloc} {:sourceloc_num 12} p1$1 ==> true;
    v11$1 := (if p1$1 then BV32_SLT($i1.0$1, 10bv32) else v11$1);
    v11$2 := (if p1$2 then BV32_SLT($i1.0$2, 10bv32) else v11$2);
    p2$1 := false;
    p2$2 := false;
    p2$1 := (if p1$1 && v11$1 then v11$1 else p2$1);
    p2$2 := (if p1$2 && v11$2 then v11$2 else p2$2);
    p1$1 := (if p1$1 && !v11$1 then v11$1 else p1$1);
    p1$2 := (if p1$2 && !v11$2 then v11$2 else p1$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v12$1 := (if p2$1 then _HAVOC_bv32$1 else v12$1);
    v12$2 := (if p2$2 then _HAVOC_bv32$2 else v12$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$sh(p2$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i1.0$1), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$1, 1bv32), 1bv32)), v12$1, $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i1.0$1), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$1, 1bv32), 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sh(p2$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i1.0$2), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$2, 1bv32), 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$sh(p2$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i1.0$2), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$2, 1bv32), 1bv32)), v12$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sh"} true;
    $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i1.0$1), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$1, 1bv32), 1bv32))] := (if p2$1 then v12$1 else $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i1.0$1), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$1, 1bv32), 1bv32))]);
    $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i1.0$2), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$2, 1bv32), 1bv32))] := (if p2$2 then v12$2 else $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i1.0$2), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$2, 1bv32), 1bv32))]);
    $i1.0$1 := (if p2$1 then BV32_ADD($i1.0$1, 1bv32) else $i1.0$1);
    $i1.0$2 := (if p2$2 then BV32_ADD($i1.0$2, 1bv32) else $i1.0$2);
    p1$1 := (if p2$1 then true else p1$1);
    p1$2 := (if p2$2 then true else p1$2);
    goto $9.backedge, $9.tail;

  $9.tail:
    assume !p1$1 && !p1$2;
    v13$1 := (if p3$1 then v1$1 == BV32_SUB(v2, 1bv32) else v13$1);
    v13$2 := (if p3$2 then v1$2 == BV32_SUB(v2, 1bv32) else v13$2);
    p4$1 := (if p3$1 && v13$1 then v13$1 else p4$1);
    p4$2 := (if p3$2 && v13$2 then v13$2 else p4$2);
    $i4.0$1 := (if p4$1 then 0bv32 else $i4.0$1);
    $i4.0$2 := (if p4$2 then 0bv32 else $i4.0$2);
    p5$1 := (if p4$1 then true else p5$1);
    p5$2 := (if p4$2 then true else p5$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $15;

  $15:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b33 ==> _WRITE_HAS_OCCURRED_$$sh ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, 1bv32), BV32_ADD(group_size_y, 2bv32)), BV32_ADD(local_id_y$1, 2bv32)));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sh ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sh ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sh ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b20 ==> _WRITE_HAS_OCCURRED_$$sh ==> local_id_y$1 == BV32_SUB(group_size_y, 1bv32);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p5$1 ==> _b19 ==> p5$1 ==> local_id_y$1 == BV32_SUB(group_size_y, 1bv32);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p5$2 ==> _b19 ==> p5$2 ==> local_id_y$2 == BV32_SUB(group_size_y, 1bv32);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b18 ==> local_id_y$1 == BV32_SUB(group_size_y, 1bv32) && BV32_SLT($i4.0$1, 10bv32) ==> p5$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b18 ==> local_id_y$2 == BV32_SUB(group_size_y, 1bv32) && BV32_SLT($i4.0$2, 10bv32) ==> p5$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b17 ==> v1$1 == 0bv32 || v1$1 != BV32_SUB(v2, 1bv32) ==> !_READ_HAS_OCCURRED_$$data;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b16 ==> v1$1 == 0bv32 || v1$1 != BV32_SUB(v2, 1bv32) ==> !_WRITE_HAS_OCCURRED_$$sh;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b15 ==> v1$1 == 0bv32 || v1$1 != BV32_SUB(v2, 1bv32) ==> !p5$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b15 ==> v1$2 == 0bv32 || v1$2 != BV32_SUB(v2, 1bv32) ==> !p5$2;
    assert {:tag "loopBound"} {:thread 1} p5$1 ==> _b14 ==> BV32_UGE($i4.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p5$2 ==> _b14 ==> BV32_UGE($i4.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p5$1 ==> _b13 ==> BV32_ULE($i4.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p5$2 ==> _b13 ==> BV32_ULE($i4.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p5$1 ==> _b12 ==> BV32_SGE($i4.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p5$2 ==> _b12 ==> BV32_SGE($i4.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p5$1 ==> _b11 ==> BV32_SLE($i4.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p5$2 ==> _b11 ==> BV32_SLE($i4.0$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p5$1 ==> _b10 ==> BV32_SLE(0bv32, $i4.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p5$2 ==> _b10 ==> BV32_SLE(0bv32, $i4.0$2);
    assert {:block_sourceloc} {:sourceloc_num 20} p5$1 ==> true;
    v14$1 := (if p5$1 then BV32_SLT($i4.0$1, 10bv32) else v14$1);
    v14$2 := (if p5$2 then BV32_SLT($i4.0$2, 10bv32) else v14$2);
    p6$1 := false;
    p6$2 := false;
    p6$1 := (if p5$1 && v14$1 then v14$1 else p6$1);
    p6$2 := (if p5$2 && v14$2 then v14$2 else p6$2);
    p5$1 := (if p5$1 && !v14$1 then v14$1 else p5$1);
    p5$2 := (if p5$2 && !v14$2 then v14$2 else p5$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v15$1 := (if p6$1 then _HAVOC_bv32$1 else v15$1);
    v15$2 := (if p6$2 then _HAVOC_bv32$2 else v15$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$sh(p6$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i4.0$1), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 2bv32)), v15$1, $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i4.0$1), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 2bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sh(p6$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i4.0$2), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 2bv32)));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$sh(p6$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i4.0$2), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 2bv32)), v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sh"} true;
    $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i4.0$1), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 2bv32))] := (if p6$1 then v15$1 else $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i4.0$1), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 2bv32))]);
    $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i4.0$2), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 2bv32))] := (if p6$2 then v15$2 else $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i4.0$2), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 2bv32))]);
    $i4.0$1 := (if p6$1 then BV32_ADD($i4.0$1, 1bv32) else $i4.0$1);
    $i4.0$2 := (if p6$2 then BV32_ADD($i4.0$2, 1bv32) else $i4.0$2);
    p5$1 := (if p6$1 then true else p5$1);
    p5$2 := (if p6$2 then true else p5$2);
    goto $15.backedge, __partitioned_block_$15.tail_0;

  __partitioned_block_$15.tail_0:
    assume !p5$1 && !p5$2;
    goto __partitioned_block_$15.tail_1;

  __partitioned_block_$15.tail_1:
    call {:sourceloc_num 27} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    $i7.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $21;

  $21:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b36 ==> _READ_HAS_OCCURRED_$$sh ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(0bv32, local_id_x$1), 1bv32), BV32_ADD(group_size_y, 2bv32)), BV32_ADD(local_id_y$1, 1bv32))) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, 1bv32), BV32_ADD(group_size_y, 2bv32)), BV32_ADD(local_id_y$1, 1bv32))) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(0bv32, BV32_ADD(local_id_x$1, 1bv32)), 1bv32), BV32_ADD(group_size_y, 2bv32)), BV32_ADD(local_id_y$1, 1bv32))) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(0bv32, local_id_x$1), 1bv32), BV32_ADD(group_size_y, 2bv32)), BV32_ADD(local_id_y$1, 2bv32))) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, 1bv32), BV32_ADD(group_size_y, 2bv32)), BV32_ADD(local_id_y$1, 2bv32))) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, BV32_ADD(group_size_y, 2bv32)), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(0bv32, BV32_ADD(local_id_x$1, 1bv32)), 1bv32), BV32_ADD(group_size_y, 2bv32)), BV32_ADD(local_id_y$1, 2bv32)));
    assert {:tag "accessUpperBoundBlock"} _b35 ==> _WRITE_HAS_OCCURRED_$$newData ==> BV32_SLT(_WATCHED_OFFSET, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(group_id_y$1, 1bv32), group_size_y), local_id_y$1), 1bv32));
    assert {:tag "accessLowerBoundBlock"} _b34 ==> _WRITE_HAS_OCCURRED_$$newData ==> BV32_SLE(BV32_ADD(BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1), 1bv32), _WATCHED_OFFSET);
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sh ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sh ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sh ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b9 ==> BV32_UGE($i7.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b9 ==> BV32_UGE($i7.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_ULE($i7.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_ULE($i7.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b7 ==> BV32_SGE($i7.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b7 ==> BV32_SGE($i7.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b6 ==> BV32_SLE($i7.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b6 ==> BV32_SLE($i7.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b5 ==> BV32_SLE(0bv32, $i7.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b5 ==> BV32_SLE(0bv32, $i7.0);
    assert {:block_sourceloc} {:sourceloc_num 28} true;
    v16 := BV32_SLT($i7.0, 8bv32);
    goto $truebb5, $falsebb5;

  $falsebb5:
    assume {:partition} !v16 && !v16;
    return;

  $truebb5:
    assume {:partition} v16 && v16;
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$1, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 1bv32)), $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$1, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$2, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 1bv32)), $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$2, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sh"} true;
    v17$1 := $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$1, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 1bv32))];
    v17$2 := $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$2, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 1bv32))];
    call {:sourceloc} {:sourceloc_num 31} _LOG_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 1bv32)), $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 31} _CHECK_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 1bv32)), $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sh"} true;
    v18$1 := $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 1bv32))];
    v18$2 := $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 1bv32))];
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 1bv32)), $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 1bv32)), $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sh"} true;
    v19$1 := $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 1bv32))];
    v19$2 := $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 1bv32))];
    call {:sourceloc} {:sourceloc_num 33} _LOG_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$1, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 2bv32)), $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$1, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 33} _CHECK_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$2, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 2bv32)), $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$2, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sh"} true;
    v20$1 := $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$1, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 2bv32))];
    v20$2 := $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$2, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 2bv32))];
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$1, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$1, 1bv32), 1bv32)), $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$1, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$1, 1bv32), 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$2, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$2, 1bv32), 1bv32)), $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$2, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$2, 1bv32), 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sh"} true;
    v21$1 := $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$1, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$1, 1bv32), 1bv32))];
    v21$2 := $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v0$2, $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$2, 1bv32), 1bv32))];
    call {:sourceloc} {:sourceloc_num 35} _LOG_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 2bv32)), $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 35} _CHECK_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 2bv32)), $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sh"} true;
    v22$1 := $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 2bv32))];
    v22$2 := $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 2bv32))];
    call {:sourceloc} {:sourceloc_num 36} _LOG_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 2bv32)), $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 36} _CHECK_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 2bv32)), $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sh"} true;
    v23$1 := $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 2bv32))];
    v23$2 := $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 2bv32))];
    call {:sourceloc} {:sourceloc_num 37} _LOG_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$1, 1bv32), 1bv32)), $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$1, 1bv32), 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 37} _CHECK_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$2, 1bv32), 1bv32)), $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$2, 1bv32), 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sh"} true;
    v24$1 := $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$1, 1bv32), 1bv32))];
    v24$2 := $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$2, 1bv32), 1bv32))];
    call {:sourceloc} {:sourceloc_num 38} _LOG_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$1, 1bv32), 1bv32)), $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$1, 1bv32), 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 38} _CHECK_READ_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$2, 1bv32), 1bv32)), $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$2, 1bv32), 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sh"} true;
    v25$1 := $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$1, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$1, 1bv32), 1bv32))];
    v25$2 := $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(v0$2, 1bv32), $i7.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(BV32_SUB(v1$2, 1bv32), 1bv32))];
    call {:sourceloc} {:sourceloc_num 39} _LOG_WRITE_$$newData(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $i7.0), 1bv32), BV32_ADD(v7, 2bv32)), BV32_ADD(v4$1, 1bv32)), FADD32(FMUL32($wDiagonal, FADD32(FADD32(FADD32(v22$1, v23$1), v24$1), v25$1)), FADD32(FMUL32($wCenter, v17$1), FMUL32($wCardinal, FADD32(FADD32(FADD32(v18$1, v19$1), v20$1), v21$1)))), $$newData[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $i7.0), 1bv32), BV32_ADD(v7, 2bv32)), BV32_ADD(v4$1, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newData(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $i7.0), 1bv32), BV32_ADD(v7, 2bv32)), BV32_ADD(v4$2, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 39} _CHECK_WRITE_$$newData(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $i7.0), 1bv32), BV32_ADD(v7, 2bv32)), BV32_ADD(v4$2, 1bv32)), FADD32(FMUL32($wDiagonal, FADD32(FADD32(FADD32(v22$2, v23$2), v24$2), v25$2)), FADD32(FMUL32($wCenter, v17$2), FMUL32($wCardinal, FADD32(FADD32(FADD32(v18$2, v19$2), v20$2), v21$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newData"} true;
    $$newData[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $i7.0), 1bv32), BV32_ADD(v7, 2bv32)), BV32_ADD(v4$1, 1bv32))] := FADD32(FMUL32($wDiagonal, FADD32(FADD32(FADD32(v22$1, v23$1), v24$1), v25$1)), FADD32(FMUL32($wCenter, v17$1), FMUL32($wCardinal, FADD32(FADD32(FADD32(v18$1, v19$1), v20$1), v21$1))));
    $$newData[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $i7.0), 1bv32), BV32_ADD(v7, 2bv32)), BV32_ADD(v4$2, 1bv32))] := FADD32(FMUL32($wDiagonal, FADD32(FADD32(FADD32(v22$2, v23$2), v24$2), v25$2)), FADD32(FMUL32($wCenter, v17$2), FMUL32($wCardinal, FADD32(FADD32(FADD32(v18$2, v19$2), v20$2), v21$2))));
    $i7.0 := BV32_ADD($i7.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $21;

  $15.backedge:
    assume {:backedge} p5$1 || p5$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $15;

  $9.backedge:
    assume {:backedge} p1$1 || p1$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $9;

  $truebb0:
    assume {:partition} v8 && v8;
    havoc v9$1, v9$2;
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 1bv32)), v9$1, $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$sh(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 1bv32)), v9$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sh"} true;
    $$sh[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$1, 1bv32), $i.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$1, 1bv32))] := v9$1;
    $$sh[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(v0$2, 1bv32), $i.0), 1bv32), BV32_ADD(v2, 2bv32)), BV32_ADD(v1$2, 1bv32))] := v9$2;
    $i.0 := BV32_ADD($i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $4;

  $truebb:
    assume {:partition} v6 && v6;
    $0 := 0bv32;
    goto $3;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 2bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$sh, $$newData, _TRACKING;



function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

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

const {:existential true} _b29: bool;

const {:existential true} _b30: bool;

const {:existential true} _b31: bool;

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



const _WATCHED_VALUE_$$newData: bv32;

procedure {:inline 1} _LOG_READ_$$newData(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$newData;



implementation {:inline 1} _LOG_READ_$$newData(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$newData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newData == _value then true else _READ_HAS_OCCURRED_$$newData);
    return;
}



procedure _CHECK_READ_$$newData(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "newData"} {:array "$$newData"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$newData && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$newData);
  requires {:source_name "newData"} {:array "$$newData"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$newData && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$newData: bool;

procedure {:inline 1} _LOG_WRITE_$$newData(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$newData, _WRITE_READ_BENIGN_FLAG_$$newData;



implementation {:inline 1} _LOG_WRITE_$$newData(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$newData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newData == _value then true else _WRITE_HAS_OCCURRED_$$newData);
    _WRITE_READ_BENIGN_FLAG_$$newData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newData == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$newData);
    return;
}



procedure _CHECK_WRITE_$$newData(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "newData"} {:array "$$newData"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$newData && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newData != _value);
  requires {:source_name "newData"} {:array "$$newData"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$newData && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newData != _value);
  requires {:source_name "newData"} {:array "$$newData"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$newData && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$newData(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$newData;



implementation {:inline 1} _LOG_ATOMIC_$$newData(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$newData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$newData);
    return;
}



procedure _CHECK_ATOMIC_$$newData(_P: bool, _offset: bv32);
  requires {:source_name "newData"} {:array "$$newData"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$newData && _WATCHED_OFFSET == _offset);
  requires {:source_name "newData"} {:array "$$newData"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$newData && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$newData(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$newData;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$newData(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$newData := (if _P && _WRITE_HAS_OCCURRED_$$newData && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$newData);
    return;
}



const _WATCHED_VALUE_$$sh: bv32;

procedure {:inline 1} _LOG_READ_$$sh(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$sh;



implementation {:inline 1} _LOG_READ_$$sh(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sh := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sh == _value then true else _READ_HAS_OCCURRED_$$sh);
    return;
}



procedure _CHECK_READ_$$sh(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sh"} {:array "$$sh"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sh && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sh && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sh"} {:array "$$sh"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sh && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$sh: bool;

procedure {:inline 1} _LOG_WRITE_$$sh(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$sh, _WRITE_READ_BENIGN_FLAG_$$sh;



implementation {:inline 1} _LOG_WRITE_$$sh(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sh := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sh == _value then true else _WRITE_HAS_OCCURRED_$$sh);
    _WRITE_READ_BENIGN_FLAG_$$sh := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sh == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sh);
    return;
}



procedure _CHECK_WRITE_$$sh(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sh"} {:array "$$sh"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sh && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sh != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sh"} {:array "$$sh"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sh && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sh != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sh"} {:array "$$sh"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sh && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$sh(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sh;



implementation {:inline 1} _LOG_ATOMIC_$$sh(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sh := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sh);
    return;
}



procedure _CHECK_ATOMIC_$$sh(_P: bool, _offset: bv32);
  requires {:source_name "sh"} {:array "$$sh"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sh && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sh"} {:array "$$sh"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sh && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sh(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sh;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sh(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sh := (if _P && _WRITE_HAS_OCCURRED_$$sh && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sh);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sh;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sh;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sh;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$newData;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$newData;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$newData;
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
    havoc $$newData;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$sh;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b32: bool;

const {:existential true} _b33: bool;

const {:existential true} _b34: bool;

const {:existential true} _b35: bool;

const {:existential true} _b36: bool;
