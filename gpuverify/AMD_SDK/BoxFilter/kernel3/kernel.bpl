type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$input"} {:global} {:elem_width 32} {:source_name "input"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input: bool;

var {:source_name "output"} {:global} $$output: [bv32]bv32;

axiom {:array_info "$$output"} {:global} {:elem_width 32} {:source_name "output"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output: bool;

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

function FP32_TO_SI32(bv32) : bv32;

function FPOW32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "horizontalSAT"} {:kernel} $horizontalSAT($i: bv32, $r: bv32, $width: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$input && !_WRITE_HAS_OCCURRED_$$input && !_ATOMIC_HAS_OCCURRED_$$input;
  requires !_READ_HAS_OCCURRED_$$output && !_WRITE_HAS_OCCURRED_$$output && !_ATOMIC_HAS_OCCURRED_$$output;
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
  modifies _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:source_name "horizontalSAT"} {:kernel} $horizontalSAT($i: bv32, $r: bv32, $width: bv32)
{
  var $sum.0$1: bv128;
  var $sum.0$2: bv128;
  var $j.0$1: bv32;
  var $j.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bv32;
  var v3$1: bool;
  var v3$2: bool;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), $width));
    v1$2 := BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), $width));
    v2 := FP32_TO_SI32(FPOW32(SI32_TO_FP32($r), SI32_TO_FP32($i)));
    $sum.0$1, $j.0$1 := 0bv128, 0bv32;
    $sum.0$2, $j.0$2 := 0bv128, 0bv32;
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 2} p0$1 ==> true;
    v3$1 := (if p0$1 then BV32_SLT($j.0$1, $r) else v3$1);
    v3$2 := (if p0$2 then BV32_SLT($j.0$2, $r) else v3$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p1$1 := (if p0$1 && v3$1 then v3$1 else p1$1);
    p1$2 := (if p0$2 && v3$2 then v3$2 else p1$2);
    p3$1 := (if p0$1 && !v3$1 then !v3$1 else p3$1);
    p3$2 := (if p0$2 && !v3$2 then !v3$2 else p3$2);
    p0$1 := (if p0$1 && !v3$1 then v3$1 else p0$1);
    p0$2 := (if p0$2 && !v3$2 then v3$2 else p0$2);
    v4$1 := (if p1$1 then BV32_SLT(BV32_SUB(v0$1, BV32_MUL($j.0$1, v2)), 0bv32) else v4$1);
    v4$2 := (if p1$2 then BV32_SLT(BV32_SUB(v0$2, BV32_MUL($j.0$2, v2)), 0bv32) else v4$2);
    p4$1 := (if p1$1 && v4$1 then v4$1 else p4$1);
    p4$2 := (if p1$2 && v4$2 then v4$2 else p4$2);
    p0$1 := (if p1$1 && v4$1 then !v4$1 else p0$1);
    p0$2 := (if p1$2 && v4$2 then !v4$2 else p0$2);
    p2$1 := (if p1$1 && !v4$1 then !v4$1 else p2$1);
    p2$2 := (if p1$2 && !v4$2 then !v4$2 else p2$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v5$1 := (if p2$1 then _HAVOC_bv32$1 else v5$1);
    v5$2 := (if p2$2 then _HAVOC_bv32$2 else v5$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v6$1 := (if p2$1 then _HAVOC_bv32$1 else v6$1);
    v6$2 := (if p2$2 then _HAVOC_bv32$2 else v6$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v7$1 := (if p2$1 then _HAVOC_bv32$1 else v7$1);
    v7$2 := (if p2$2 then _HAVOC_bv32$2 else v7$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v8$1 := (if p2$1 then _HAVOC_bv32$1 else v8$1);
    v8$2 := (if p2$2 then _HAVOC_bv32$2 else v8$2);
    $sum.0$1, $j.0$1 := (if p2$1 then BV32_ADD($sum.0$1[128:96], v8$1) ++ BV32_ADD($sum.0$1[96:64], v7$1) ++ BV32_ADD($sum.0$1[64:32], v6$1) ++ BV32_ADD($sum.0$1[32:0], v5$1) else $sum.0$1), (if p2$1 then BV32_ADD($j.0$1, 1bv32) else $j.0$1);
    $sum.0$2, $j.0$2 := (if p2$2 then BV32_ADD($sum.0$2[128:96], v8$2) ++ BV32_ADD($sum.0$2[96:64], v7$2) ++ BV32_ADD($sum.0$2[64:32], v6$2) ++ BV32_ADD($sum.0$2[32:0], v5$2) else $sum.0$2), (if p2$2 then BV32_ADD($j.0$2, 1bv32) else $j.0$2);
    p0$1 := (if p2$1 then true else p0$1);
    p0$2 := (if p2$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$output(p3$1, BV32_MUL(v1$1, 4bv32), $sum.0$1[32:0], $$output[BV32_MUL(v1$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p3$2, BV32_MUL(v1$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$output(p3$2, BV32_MUL(v1$2, 4bv32), $sum.0$2[32:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_MUL(v1$1, 4bv32)] := (if p3$1 then $sum.0$1[32:0] else $$output[BV32_MUL(v1$1, 4bv32)]);
    $$output[BV32_MUL(v1$2, 4bv32)] := (if p3$2 then $sum.0$2[32:0] else $$output[BV32_MUL(v1$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$output(p3$1, BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), $sum.0$1[64:32], $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p3$2, BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$output(p3$2, BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), $sum.0$2[64:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32)] := (if p3$1 then $sum.0$1[64:32] else $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32)]);
    $$output[BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32)] := (if p3$2 then $sum.0$2[64:32] else $$output[BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$output(p3$1, BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), $sum.0$1[96:64], $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p3$2, BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$output(p3$2, BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), $sum.0$2[96:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32)] := (if p3$1 then $sum.0$1[96:64] else $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32)]);
    $$output[BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32)] := (if p3$2 then $sum.0$2[96:64] else $$output[BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$output(p3$1, BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), $sum.0$1[128:96], $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p3$2, BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$output(p3$2, BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), $sum.0$2[128:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32)] := (if p3$1 then $sum.0$1[128:96] else $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32)]);
    $$output[BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32)] := (if p3$2 then $sum.0$2[128:96] else $$output[BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32)]);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$output(p4$1, BV32_MUL(v1$1, 4bv32), $sum.0$1[32:0], $$output[BV32_MUL(v1$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p4$2, BV32_MUL(v1$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$output(p4$2, BV32_MUL(v1$2, 4bv32), $sum.0$2[32:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_MUL(v1$1, 4bv32)] := (if p4$1 then $sum.0$1[32:0] else $$output[BV32_MUL(v1$1, 4bv32)]);
    $$output[BV32_MUL(v1$2, 4bv32)] := (if p4$2 then $sum.0$2[32:0] else $$output[BV32_MUL(v1$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$output(p4$1, BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), $sum.0$1[64:32], $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p4$2, BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$output(p4$2, BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), $sum.0$2[64:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32)] := (if p4$1 then $sum.0$1[64:32] else $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32)]);
    $$output[BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32)] := (if p4$2 then $sum.0$2[64:32] else $$output[BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$output(p4$1, BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), $sum.0$1[96:64], $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p4$2, BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$output(p4$2, BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), $sum.0$2[96:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32)] := (if p4$1 then $sum.0$1[96:64] else $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32)]);
    $$output[BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32)] := (if p4$2 then $sum.0$2[96:64] else $$output[BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$output(p4$1, BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), $sum.0$1[128:96], $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p4$2, BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$output(p4$2, BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), $sum.0$2[128:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32)] := (if p4$1 then $sum.0$1[128:96] else $$output[BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32)]);
    $$output[BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32)] := (if p4$2 then $sum.0$2[128:96] else $$output[BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32)]);
    return;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1024bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$input: bv32;

procedure {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _READ_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_READ_$$input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$input);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$input: bool;

procedure {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$input, _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _WRITE_HAS_OCCURRED_$$input);
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



procedure _CHECK_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_ATOMIC_$$input(_P: bool, _offset: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



const _WATCHED_VALUE_$$output: bv32;

procedure {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _READ_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_READ_$$output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$output);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$output: bool;

procedure {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _WRITE_HAS_OCCURRED_$$output);
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



procedure _CHECK_WRITE_$$output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_ATOMIC_$$output(_P: bool, _offset: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
