type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_Output"} {:global} $$d_Output: [bv32]bv32;

axiom {:array_info "$$d_Output"} {:global} {:elem_width 32} {:source_name "d_Output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Output: bool;

var {:source_name "c_Table"} {:constant} $$_ZL7c_Table$1: [bv32]bv32;

var {:source_name "c_Table"} {:constant} $$_ZL7c_Table$2: [bv32]bv32;

axiom {:array_info "$$_ZL7c_Table"} {:constant} {:elem_width 32} {:source_name "c_Table"} {:source_elem_width 32} {:source_dimensions "3,31"} true;

const _WATCHED_OFFSET: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

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

function FMUL32(bv32, bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "bvxor"} BV32_XOR(bv32, bv32) : bv32;

procedure {:source_name "quasirandomGeneratorKernel"} {:kernel} $_Z26quasirandomGeneratorKernelPfjj($seed: bv32, $N: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $N == 1048576bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$d_Output && !_WRITE_HAS_OCCURRED_$$d_Output && !_ATOMIC_HAS_OCCURRED_$$d_Output;
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
  modifies _WRITE_HAS_OCCURRED_$$d_Output, _WRITE_READ_BENIGN_FLAG_$$d_Output, _WRITE_READ_BENIGN_FLAG_$$d_Output;



implementation {:source_name "quasirandomGeneratorKernel"} {:kernel} $_Z26quasirandomGeneratorKernelPfjj($seed: bv32, $N: bv32)
{
  var $pos.0$1: bv32;
  var $pos.0$2: bv32;
  var $result.0$1: bv32;
  var $result.0$2: bv32;
  var $data.0$1: bv32;
  var $data.0$2: bv32;
  var $bit.0$1: bv32;
  var $bit.0$2: bv32;
  var $result.1$1: bv32;
  var $result.1$2: bv32;
  var v0$1: bool;
  var v0$2: bool;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bv32;
  var v3$2: bv32;
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


  $0:
    $pos.0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    $pos.0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b11 ==> _WRITE_HAS_OCCURRED_$$d_Output ==> local_id_y$1 == BV32_DIV(_WATCHED_OFFSET, $N);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b10 ==> _WRITE_HAS_OCCURRED_$$d_Output ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), BV32_MUL(local_id_y$1, $N)));
    assert {:tag "pow2NotZero"} _b9 ==> $data.0$2 != 0bv32;
    assert {:tag "pow2"} _b8 ==> $data.0$2 == 0bv32 || BV32_AND($data.0$2, BV32_SUB($data.0$2, 1bv32)) == 0bv32;
    assert {:tag "pow2NotZero"} _b7 ==> $data.0$1 != 0bv32;
    assert {:tag "pow2"} _b6 ==> $data.0$1 == 0bv32 || BV32_AND($data.0$1, BV32_SUB($data.0$1, 1bv32)) == 0bv32;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b5 ==> BV32_ULT($pos.0$1, $N) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b5 ==> BV32_ULT($pos.0$2, $N) ==> p0$2;
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b4 ==> BV32_UGE($pos.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b4 ==> BV32_UGE($pos.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b3 ==> BV32_ULE($pos.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b3 ==> BV32_ULE($pos.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b2 ==> BV32_SGE($pos.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b2 ==> BV32_SGE($pos.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b1 ==> BV32_SLE($pos.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b1 ==> BV32_SLE($pos.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b0 ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), $pos.0$1) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b0 ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), $pos.0$2) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:block_sourceloc} {:sourceloc_num 2} p0$1 ==> true;
    v0$1 := (if p0$1 then BV32_ULT($pos.0$1, $N) else v0$1);
    v0$2 := (if p0$2 then BV32_ULT($pos.0$2, $N) else v0$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p6$1 := false;
    p6$2 := false;
    p1$1 := (if p0$1 && v0$1 then v0$1 else p1$1);
    p1$2 := (if p0$2 && v0$2 then v0$2 else p1$2);
    p0$1 := (if p0$1 && !v0$1 then v0$1 else p0$1);
    p0$2 := (if p0$2 && !v0$2 then v0$2 else p0$2);
    $result.0$1, $data.0$1, $bit.0$1 := (if p1$1 then 0bv32 else $result.0$1), (if p1$1 then BV32_ADD($seed, $pos.0$1) else $data.0$1), (if p1$1 then 0bv32 else $bit.0$1);
    $result.0$2, $data.0$2, $bit.0$2 := (if p1$2 then 0bv32 else $result.0$2), (if p1$2 then BV32_ADD($seed, $pos.0$2) else $data.0$2), (if p1$2 then 0bv32 else $bit.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_1"} true;
    assume {:invGenSkippedLoop} true;
    assert p2$1 ==> p0$1;
    assert p2$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 4} p2$1 ==> true;
    v1$1 := (if p2$1 then BV32_SLT($bit.0$1, 31bv32) else v1$1);
    v1$2 := (if p2$2 then BV32_SLT($bit.0$2, 31bv32) else v1$2);
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p3$1 := (if p2$1 && v1$1 then v1$1 else p3$1);
    p3$2 := (if p2$2 && v1$2 then v1$2 else p3$2);
    p2$1 := (if p2$1 && !v1$1 then v1$1 else p2$1);
    p2$2 := (if p2$2 && !v1$2 then v1$2 else p2$2);
    v2$1 := (if p3$1 then BV32_AND($data.0$1, 1bv32) != 0bv32 else v2$1);
    v2$2 := (if p3$2 then BV32_AND($data.0$2, 1bv32) != 0bv32 else v2$2);
    p5$1 := (if p3$1 && v2$1 then v2$1 else p5$1);
    p5$2 := (if p3$2 && v2$2 then v2$2 else p5$2);
    p4$1 := (if p3$1 && !v2$1 then !v2$1 else p4$1);
    p4$2 := (if p3$2 && !v2$2 then !v2$2 else p4$2);
    $result.1$1 := (if p4$1 then $result.0$1 else $result.1$1);
    $result.1$2 := (if p4$2 then $result.0$2 else $result.1$2);
    v3$1 := (if p5$1 then $$_ZL7c_Table$1[BV32_ADD(BV32_MUL(local_id_y$1, 31bv32), $bit.0$1)] else v3$1);
    v3$2 := (if p5$2 then $$_ZL7c_Table$2[BV32_ADD(BV32_MUL(local_id_y$2, 31bv32), $bit.0$2)] else v3$2);
    $result.1$1 := (if p5$1 then BV32_XOR($result.0$1, v3$1) else $result.1$1);
    $result.1$2 := (if p5$2 then BV32_XOR($result.0$2, v3$2) else $result.1$2);
    $result.0$1, $data.0$1, $bit.0$1 := (if p3$1 then $result.1$1 else $result.0$1), (if p3$1 then BV32_LSHR($data.0$1, 1bv32) else $data.0$1), (if p3$1 then BV32_ADD($bit.0$1, 1bv32) else $bit.0$1);
    $result.0$2, $data.0$2, $bit.0$2 := (if p3$2 then $result.1$2 else $result.0$2), (if p3$2 then BV32_LSHR($data.0$2, 1bv32) else $data.0$2), (if p3$2 then BV32_ADD($bit.0$2, 1bv32) else $bit.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, $3.tail;

  $3.tail:
    assume !p2$1 && !p2$2;
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$d_Output(p1$1, BV32_ADD(BV32_MUL(local_id_y$1, $N), $pos.0$1), FMUL32(UI32_TO_FP32(BV32_ADD($result.0$1, 1bv32)), 805306368bv32), $$d_Output[BV32_ADD(BV32_MUL(local_id_y$1, $N), $pos.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Output(p1$2, BV32_ADD(BV32_MUL(local_id_y$2, $N), $pos.0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$d_Output(p1$2, BV32_ADD(BV32_MUL(local_id_y$2, $N), $pos.0$2), FMUL32(UI32_TO_FP32(BV32_ADD($result.0$2, 1bv32)), 805306368bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Output"} true;
    $$d_Output[BV32_ADD(BV32_MUL(local_id_y$1, $N), $pos.0$1)] := (if p1$1 then FMUL32(UI32_TO_FP32(BV32_ADD($result.0$1, 1bv32)), 805306368bv32) else $$d_Output[BV32_ADD(BV32_MUL(local_id_y$1, $N), $pos.0$1)]);
    $$d_Output[BV32_ADD(BV32_MUL(local_id_y$2, $N), $pos.0$2)] := (if p1$2 then FMUL32(UI32_TO_FP32(BV32_ADD($result.0$2, 1bv32)), 805306368bv32) else $$d_Output[BV32_ADD(BV32_MUL(local_id_y$2, $N), $pos.0$2)]);
    $pos.0$1 := (if p1$1 then BV32_ADD($pos.0$1, BV32_MUL(group_size_x, num_groups_x)) else $pos.0$1);
    $pos.0$2 := (if p1$2 then BV32_ADD($pos.0$2, BV32_MUL(group_size_x, num_groups_x)) else $pos.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    return;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $3;
}



axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 3bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

const {:existential true} _b5: bool;

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



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b11: bool;
