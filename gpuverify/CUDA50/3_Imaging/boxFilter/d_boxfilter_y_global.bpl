type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$id"} {:global} {:elem_width 32} {:source_name "id"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$id: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$id: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$id: bool;

var {:source_name "od"} {:global} $$od: [bv32]bv32;

axiom {:array_info "$$od"} {:global} {:elem_width 32} {:source_name "od"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$od: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$od: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$od: bool;

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

function FDIV32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "d_boxfilter_y_global"} {:kernel} $_Z20d_boxfilter_y_globalPfS_iii($w: bv32, $h: bv32, $r: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $w == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $h == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $r == 14bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$id && !_WRITE_HAS_OCCURRED_$$id && !_ATOMIC_HAS_OCCURRED_$$id;
  requires !_READ_HAS_OCCURRED_$$od && !_WRITE_HAS_OCCURRED_$$od && !_ATOMIC_HAS_OCCURRED_$$od;
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
  modifies _WRITE_HAS_OCCURRED_$$od, _WRITE_READ_BENIGN_FLAG_$$od, _WRITE_READ_BENIGN_FLAG_$$od;



implementation {:source_name "d_boxfilter_y_global"} {:kernel} $_Z20d_boxfilter_y_globalPfS_iii($w: bv32, $h: bv32, $r: bv32)
{
  var $t.i.0$1: bv32;
  var $t.i.0$2: bv32;
  var $y.i.0: bv32;
  var $t.i.1$1: bv32;
  var $t.i.1$2: bv32;
  var $y1.i.0: bv32;
  var $t.i.2$1: bv32;
  var $t.i.2$2: bv32;
  var $y2.i.0: bv32;
  var $t.i.3$1: bv32;
  var $t.i.3$2: bv32;
  var $y3.i.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3: bool;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5: bool;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9: bool;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13: bool;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1 := FDIV32(1065353216bv32, SI32_TO_FP32(BV32_ADD(BV32_SHL($r, 1bv32), 1bv32)));
    havoc v2$1, v2$2;
    $t.i.0$1, $y.i.0 := FMUL32(v2$1, SI32_TO_FP32($r)), 0bv32;
    $t.i.0$2 := FMUL32(v2$2, SI32_TO_FP32($r));
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_3"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 5} true;
    v3 := BV32_SLT($y.i.0, BV32_ADD($r, 1bv32));
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v3 && !v3;
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$od(true, v0$1, FMUL32($t.i.0$1, v1), $$od[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$od(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$od(true, v0$2, FMUL32($t.i.0$2, v1));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$od"} true;
    $$od[v0$1] := FMUL32($t.i.0$1, v1);
    $$od[v0$2] := FMUL32($t.i.0$2, v1);
    $t.i.1$1, $y1.i.0 := $t.i.0$1, 1bv32;
    $t.i.1$2 := $t.i.0$2;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $4;

  $4:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "accessBreak"} _b18 ==> _WRITE_HAS_OCCURRED_$$od ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, group_size_x);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b17 ==> _WRITE_HAS_OCCURRED_$$od ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, $w), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, $w), 1bv32), BV32_ADD(BV32_MUL(0bv32, $w), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)));
    assert {:tag "accessUpperBoundBlock"} _b16 ==> _WRITE_HAS_OCCURRED_$$od ==> BV32_SLT(_WATCHED_OFFSET, BV32_ADD(BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), group_size_x), local_id_x$1));
    assert {:tag "accessLowerBoundBlock"} _b15 ==> _WRITE_HAS_OCCURRED_$$od ==> BV32_SLE(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), _WATCHED_OFFSET);
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($y1.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($y1.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($y1.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($y1.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($y1.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($y1.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($y1.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($y1.i.0, 1bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $y1.i.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $y1.i.0);
    assert {:block_sourceloc} {:sourceloc_num 10} true;
    v5 := BV32_SLT($y1.i.0, BV32_ADD($r, 1bv32));
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v5 && !v5;
    $t.i.2$1, $y2.i.0 := $t.i.1$1, BV32_ADD($r, 1bv32);
    $t.i.2$2 := $t.i.1$2;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessBreak"} _b22 ==> _WRITE_HAS_OCCURRED_$$od ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, group_size_x);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b21 ==> _WRITE_HAS_OCCURRED_$$od ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, $w), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, $w), 1bv32), BV32_ADD(BV32_MUL(0bv32, $w), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)));
    assert {:tag "accessUpperBoundBlock"} _b20 ==> _WRITE_HAS_OCCURRED_$$od ==> BV32_SLT(_WATCHED_OFFSET, BV32_ADD(BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), group_size_x), local_id_x$1));
    assert {:tag "accessLowerBoundBlock"} _b19 ==> _WRITE_HAS_OCCURRED_$$od ==> BV32_SLE(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), _WATCHED_OFFSET);
    assert {:tag "loopBound"} {:thread 1} _b9 ==> BV32_UGE($y2.i.0, BV32_ADD($r, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b9 ==> BV32_UGE($y2.i.0, BV32_ADD($r, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_ULE($y2.i.0, BV32_ADD($r, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_ULE($y2.i.0, BV32_ADD($r, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b7 ==> BV32_SGE($y2.i.0, BV32_ADD($r, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b7 ==> BV32_SGE($y2.i.0, BV32_ADD($r, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b6 ==> BV32_SLE($y2.i.0, BV32_ADD($r, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b6 ==> BV32_SLE($y2.i.0, BV32_ADD($r, 1bv32));
    assert {:tag "guardNonNeg"} {:thread 1} _b5 ==> BV32_SLE(0bv32, $y2.i.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b5 ==> BV32_SLE(0bv32, $y2.i.0);
    assert {:block_sourceloc} {:sourceloc_num 16} true;
    v9 := BV32_SLT($y2.i.0, BV32_SUB($h, $r));
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v9 && !v9;
    $t.i.3$1, $y3.i.0 := $t.i.2$1, BV32_SUB($h, $r);
    $t.i.3$2 := $t.i.2$2;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $10;

  $10:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b26 ==> _WRITE_HAS_OCCURRED_$$od ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, group_size_x);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b25 ==> _WRITE_HAS_OCCURRED_$$od ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, $w), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, $w), 1bv32), BV32_ADD(BV32_MUL(0bv32, $w), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)));
    assert {:tag "accessUpperBoundBlock"} _b24 ==> _WRITE_HAS_OCCURRED_$$od ==> BV32_SLT(_WATCHED_OFFSET, BV32_ADD(BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), group_size_x), local_id_x$1));
    assert {:tag "accessLowerBoundBlock"} _b23 ==> _WRITE_HAS_OCCURRED_$$od ==> BV32_SLE(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), _WATCHED_OFFSET);
    assert {:tag "loopBound"} {:thread 1} _b14 ==> BV32_UGE($y3.i.0, BV32_SUB($h, $r));
    assert {:tag "loopBound"} {:thread 2} _b14 ==> BV32_UGE($y3.i.0, BV32_SUB($h, $r));
    assert {:tag "loopBound"} {:thread 1} _b13 ==> BV32_ULE($y3.i.0, BV32_SUB($h, $r));
    assert {:tag "loopBound"} {:thread 2} _b13 ==> BV32_ULE($y3.i.0, BV32_SUB($h, $r));
    assert {:tag "loopBound"} {:thread 1} _b12 ==> BV32_SGE($y3.i.0, BV32_SUB($h, $r));
    assert {:tag "loopBound"} {:thread 2} _b12 ==> BV32_SGE($y3.i.0, BV32_SUB($h, $r));
    assert {:tag "loopBound"} {:thread 1} _b11 ==> BV32_SLE($y3.i.0, BV32_SUB($h, $r));
    assert {:tag "loopBound"} {:thread 2} _b11 ==> BV32_SLE($y3.i.0, BV32_SUB($h, $r));
    assert {:tag "guardNonNeg"} {:thread 1} _b10 ==> BV32_SLE(0bv32, $y3.i.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b10 ==> BV32_SLE(0bv32, $y3.i.0);
    assert {:block_sourceloc} {:sourceloc_num 22} true;
    v13 := BV32_SLT($y3.i.0, $h);
    goto $truebb2, $falsebb2;

  $falsebb2:
    assume {:partition} !v13 && !v13;
    return;

  $truebb2:
    assume {:partition} v13 && v13;
    havoc v14$1, v14$2;
    havoc v15$1, v15$2;
    v16$1 := FSUB32(FADD32($t.i.3$1, v14$1), v15$1);
    v16$2 := FSUB32(FADD32($t.i.3$2, v14$2), v15$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$od(true, BV32_ADD(v0$1, BV32_MUL($y3.i.0, $w)), FMUL32(v16$1, v1), $$od[BV32_ADD(v0$1, BV32_MUL($y3.i.0, $w))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$od(true, BV32_ADD(v0$2, BV32_MUL($y3.i.0, $w)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$od(true, BV32_ADD(v0$2, BV32_MUL($y3.i.0, $w)), FMUL32(v16$2, v1));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$od"} true;
    $$od[BV32_ADD(v0$1, BV32_MUL($y3.i.0, $w))] := FMUL32(v16$1, v1);
    $$od[BV32_ADD(v0$2, BV32_MUL($y3.i.0, $w))] := FMUL32(v16$2, v1);
    $t.i.3$1, $y3.i.0 := v16$1, BV32_ADD($y3.i.0, 1bv32);
    $t.i.3$2 := v16$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $10;

  $truebb1:
    assume {:partition} v9 && v9;
    havoc v10$1, v10$2;
    havoc v11$1, v11$2;
    v12$1 := FSUB32(FADD32($t.i.2$1, v10$1), v11$1);
    v12$2 := FSUB32(FADD32($t.i.2$2, v10$2), v11$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$od(true, BV32_ADD(v0$1, BV32_MUL($y2.i.0, $w)), FMUL32(v12$1, v1), $$od[BV32_ADD(v0$1, BV32_MUL($y2.i.0, $w))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$od(true, BV32_ADD(v0$2, BV32_MUL($y2.i.0, $w)));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$od(true, BV32_ADD(v0$2, BV32_MUL($y2.i.0, $w)), FMUL32(v12$2, v1));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$od"} true;
    $$od[BV32_ADD(v0$1, BV32_MUL($y2.i.0, $w))] := FMUL32(v12$1, v1);
    $$od[BV32_ADD(v0$2, BV32_MUL($y2.i.0, $w))] := FMUL32(v12$2, v1);
    $t.i.2$1, $y2.i.0 := v12$1, BV32_ADD($y2.i.0, 1bv32);
    $t.i.2$2 := v12$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $7;

  $truebb0:
    assume {:partition} v5 && v5;
    havoc v6$1, v6$2;
    havoc v7$1, v7$2;
    v8$1 := FSUB32(FADD32($t.i.1$1, v6$1), v7$1);
    v8$2 := FSUB32(FADD32($t.i.1$2, v6$2), v7$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$od(true, BV32_ADD(v0$1, BV32_MUL($y1.i.0, $w)), FMUL32(v8$1, v1), $$od[BV32_ADD(v0$1, BV32_MUL($y1.i.0, $w))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$od(true, BV32_ADD(v0$2, BV32_MUL($y1.i.0, $w)));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$od(true, BV32_ADD(v0$2, BV32_MUL($y1.i.0, $w)), FMUL32(v8$2, v1));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$od"} true;
    $$od[BV32_ADD(v0$1, BV32_MUL($y1.i.0, $w))] := FMUL32(v8$1, v1);
    $$od[BV32_ADD(v0$2, BV32_MUL($y1.i.0, $w))] := FMUL32(v8$2, v1);
    $t.i.1$1, $y1.i.0 := v8$1, BV32_ADD($y1.i.0, 1bv32);
    $t.i.1$2 := v8$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $4;

  $truebb:
    assume {:partition} v3 && v3;
    havoc v4$1, v4$2;
    $t.i.0$1, $y.i.0 := FADD32($t.i.0$1, v4$1), BV32_ADD($y.i.0, 1bv32);
    $t.i.0$2 := FADD32($t.i.0$2, v4$2);
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

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

const _WATCHED_VALUE_$$id: bv32;

procedure {:inline 1} _LOG_READ_$$id(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$id;



implementation {:inline 1} _LOG_READ_$$id(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$id := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$id == _value then true else _READ_HAS_OCCURRED_$$id);
    return;
}



procedure _CHECK_READ_$$id(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "id"} {:array "$$id"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$id);
  requires {:source_name "id"} {:array "$$id"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$id: bool;

procedure {:inline 1} _LOG_WRITE_$$id(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$id, _WRITE_READ_BENIGN_FLAG_$$id;



implementation {:inline 1} _LOG_WRITE_$$id(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$id := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$id == _value then true else _WRITE_HAS_OCCURRED_$$id);
    _WRITE_READ_BENIGN_FLAG_$$id := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$id == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$id);
    return;
}



procedure _CHECK_WRITE_$$id(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "id"} {:array "$$id"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$id != _value);
  requires {:source_name "id"} {:array "$$id"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$id != _value);
  requires {:source_name "id"} {:array "$$id"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$id(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$id;



implementation {:inline 1} _LOG_ATOMIC_$$id(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$id := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$id);
    return;
}



procedure _CHECK_ATOMIC_$$id(_P: bool, _offset: bv32);
  requires {:source_name "id"} {:array "$$id"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset);
  requires {:source_name "id"} {:array "$$id"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$id(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$id;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$id(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$id := (if _P && _WRITE_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$id);
    return;
}



const _WATCHED_VALUE_$$od: bv32;

procedure {:inline 1} _LOG_READ_$$od(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$od;



implementation {:inline 1} _LOG_READ_$$od(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$od := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$od == _value then true else _READ_HAS_OCCURRED_$$od);
    return;
}



procedure _CHECK_READ_$$od(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "od"} {:array "$$od"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$od);
  requires {:source_name "od"} {:array "$$od"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$od: bool;

procedure {:inline 1} _LOG_WRITE_$$od(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$od, _WRITE_READ_BENIGN_FLAG_$$od;



implementation {:inline 1} _LOG_WRITE_$$od(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$od := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$od == _value then true else _WRITE_HAS_OCCURRED_$$od);
    _WRITE_READ_BENIGN_FLAG_$$od := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$od == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$od);
    return;
}



procedure _CHECK_WRITE_$$od(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "od"} {:array "$$od"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$od != _value);
  requires {:source_name "od"} {:array "$$od"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$od != _value);
  requires {:source_name "od"} {:array "$$od"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$od(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$od;



implementation {:inline 1} _LOG_ATOMIC_$$od(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$od := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$od);
    return;
}



procedure _CHECK_ATOMIC_$$od(_P: bool, _offset: bv32);
  requires {:source_name "od"} {:array "$$od"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset);
  requires {:source_name "od"} {:array "$$od"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$od(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$od;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$od(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$od := (if _P && _WRITE_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$od);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b17: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b18: bool;

const {:existential true} _b19: bool;

const {:existential true} _b20: bool;

const {:existential true} _b21: bool;

const {:existential true} _b22: bool;

const {:existential true} _b23: bool;

const {:existential true} _b24: bool;

const {:existential true} _b25: bool;

const {:existential true} _b26: bool;
