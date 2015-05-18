type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "output"} {:global} $$output: [bv32]bv32;

axiom {:array_info "$$output"} {:global} {:elem_width 32} {:source_name "output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output: bool;

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

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "writeGlobalMemoryCoalesced"} {:kernel} $writeGlobalMemoryCoalesced($size: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $size == 16777216bv32 then 1bv1 else 0bv1) != 0bv1;
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



implementation {:source_name "writeGlobalMemoryCoalesced"} {:kernel} $writeGlobalMemoryCoalesced($size: bv32)
{
  var $j.0: bv32;
  var $s.0$1: bv32;
  var $s.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1: bool;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    $j.0, $s.0$1 := 0bv32, v0$1;
    $s.0$2 := v0$2;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($j.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($j.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($j.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($j.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($j.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($j.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($j.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($j.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $j.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $j.0);
    assert {:block_sourceloc} {:sourceloc_num 2} true;
    v1 := BV32_SLT($j.0, 1024bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v1 && !v1;
    return;

  $truebb:
    assume {:partition} v1 && v1;
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$output(true, BV32_AND($s.0$1, BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND($s.0$1, BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND($s.0$2, BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$output(true, BV32_AND($s.0$2, BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND($s.0$1, BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND($s.0$2, BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 10240bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 10240bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 10240bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 10240bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 10240bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 10240bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 20480bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 20480bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 20480bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 20480bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 20480bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 20480bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 30720bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 30720bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 30720bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 30720bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 30720bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 30720bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 40960bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 40960bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 40960bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 40960bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 40960bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 40960bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 51200bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 51200bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 51200bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 51200bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 51200bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 51200bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 61440bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 61440bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 61440bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 61440bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 61440bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 61440bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 71680bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 71680bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 71680bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 71680bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 71680bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 71680bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 81920bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 81920bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 81920bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 81920bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 81920bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 81920bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 92160bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 92160bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 92160bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 92160bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 92160bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 92160bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 102400bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 102400bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 102400bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 102400bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 102400bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 102400bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 112640bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 112640bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 112640bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 112640bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 112640bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 112640bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 122880bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 122880bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 122880bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 122880bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 122880bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 122880bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 133120bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 133120bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 133120bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 133120bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 133120bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 133120bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 143360bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 143360bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 143360bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 143360bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 143360bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 143360bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$1, 153600bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$1), $$output[BV32_AND(BV32_ADD($s.0$1, 153600bv32), BV32_SUB($size, 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_AND(BV32_ADD($s.0$2, 153600bv32), BV32_SUB($size, 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$output(true, BV32_AND(BV32_ADD($s.0$2, 153600bv32), BV32_SUB($size, 1bv32)), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_AND(BV32_ADD($s.0$1, 153600bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$1);
    $$output[BV32_AND(BV32_ADD($s.0$2, 153600bv32), BV32_SUB($size, 1bv32))] := SI32_TO_FP32(v0$2);
    $j.0, $s.0$1 := BV32_ADD($j.0, 1bv32), BV32_AND(BV32_ADD($s.0$1, 163840bv32), BV32_SUB($size, 1bv32));
    $s.0$2 := BV32_AND(BV32_ADD($s.0$2, 163840bv32), BV32_SUB($size, 1bv32));
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 40bv32 then 1bv1 else 0bv1) != 0bv1;

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
