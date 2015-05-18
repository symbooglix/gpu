type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "output"} {:global} $$output: [bv32]bv32;

axiom {:array_info "$$output"} {:global} {:elem_width 32} {:source_name "output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output: bool;

var {:source_name "lbuf"} {:group_shared} $$writeLocalMemory.lbuf: [bv1][bv32]bv32;

axiom {:array_info "$$writeLocalMemory.lbuf"} {:group_shared} {:elem_width 32} {:source_name "lbuf"} {:source_elem_width 32} {:source_dimensions "4096"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$writeLocalMemory.lbuf: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$writeLocalMemory.lbuf: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$writeLocalMemory.lbuf: bool;

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

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "writeLocalMemory"} {:kernel} $writeLocalMemory($size: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $size == 16777216bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$output && !_WRITE_HAS_OCCURRED_$$output && !_ATOMIC_HAS_OCCURRED_$$output;
  requires !_READ_HAS_OCCURRED_$$writeLocalMemory.lbuf && !_WRITE_HAS_OCCURRED_$$writeLocalMemory.lbuf && !_ATOMIC_HAS_OCCURRED_$$writeLocalMemory.lbuf;
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
  modifies $$writeLocalMemory.lbuf, $$output, _TRACKING, _READ_HAS_OCCURRED_$$writeLocalMemory.lbuf, _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _WRITE_HAS_OCCURRED_$$writeLocalMemory.lbuf, _WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf, _WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf;



implementation {:source_name "writeLocalMemory"} {:kernel} $writeLocalMemory($size: bv32)
{
  var $j.0: bv32;
  var $s.0$1: bv32;
  var $s.0$2: bv32;
  var $j.1: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bool;
  var v3: bool;
  var v4$1: bv32;
  var v4$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := local_id_x$1;
    v1$2 := local_id_x$2;
    $j.0, $s.0$1 := 0bv32, v1$1;
    $s.0$2 := v1$2;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$writeLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$writeLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$writeLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 2} true;
    v2 := BV32_SLT($j.0, 3000bv32);
    goto $truebb, __partitioned_block_$falsebb_0;

  __partitioned_block_$falsebb_0:
    assume {:partition} !v2 && !v2;
    goto __partitioned_block_$falsebb_1;

  __partitioned_block_$falsebb_1:
    call {:sourceloc_num 22} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    $j.1 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$writeLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$writeLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$writeLocalMemory.lbuf ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 23} true;
    v3 := BV32_SLT($j.1, BV32_SDIV(4096bv32, group_size_x));
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v3 && !v3;
    return;

  $truebb0:
    assume {:partition} v3 && v3;
    call {:sourceloc} {:sourceloc_num 25} _LOG_READ_$$writeLocalMemory.lbuf(true, v1$1, $$writeLocalMemory.lbuf[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 25} _CHECK_READ_$$writeLocalMemory.lbuf(true, v1$2, $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$writeLocalMemory.lbuf"} true;
    v4$1 := $$writeLocalMemory.lbuf[1bv1][v1$1];
    v4$2 := $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2];
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$output(true, v0$1, v4$1, $$output[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$output(true, v0$2, v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[v0$1] := v4$1;
    $$output[v0$2] := v4$2;
    $j.1 := BV32_ADD($j.1, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $5;

  $truebb:
    assume {:partition} v2 && v2;
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND($s.0$1, 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND($s.0$1, 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND($s.0$2, 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND($s.0$2, 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND($s.0$1, 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND($s.0$2, 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 1bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 1bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 1bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 1bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 1bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 1bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 2bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 2bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 2bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 2bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 2bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 2bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 3bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 3bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 3bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 3bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 3bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 3bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 4bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 4bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 4bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 4bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 4bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 4bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 5bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 5bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 5bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 5bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 5bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 5bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 6bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 6bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 6bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 6bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 6bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 6bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 7bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 7bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 7bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 7bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 7bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 7bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 8bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 8bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 8bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 8bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 8bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 8bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 9bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 9bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 9bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 9bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 9bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 9bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 10bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 10bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 10bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 10bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 10bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 10bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 11bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 11bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 11bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 11bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 11bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 11bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 12bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 12bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 12bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 12bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 12bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 12bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 13bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 13bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 13bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 13bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 13bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 13bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 14bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 14bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 14bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 14bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 14bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 14bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$1, 15bv32), 4095bv32), SI32_TO_FP32(v0$1), $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 15bv32), 4095bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 15bv32), 4095bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$writeLocalMemory.lbuf(true, BV32_AND(BV32_ADD($s.0$2, 15bv32), 4095bv32), SI32_TO_FP32(v0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$writeLocalMemory.lbuf"} true;
    $$writeLocalMemory.lbuf[1bv1][BV32_AND(BV32_ADD($s.0$1, 15bv32), 4095bv32)] := SI32_TO_FP32(v0$1);
    $$writeLocalMemory.lbuf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(BV32_ADD($s.0$2, 15bv32), 4095bv32)] := SI32_TO_FP32(v0$2);
    $j.0, $s.0$1 := BV32_ADD($j.0, 1bv32), BV32_AND(BV32_ADD($s.0$1, 16bv32), 4095bv32);
    $s.0$2 := BV32_AND(BV32_ADD($s.0$2, 16bv32), 4095bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
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

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$writeLocalMemory.lbuf, $$output, _TRACKING;



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



const _WATCHED_VALUE_$$writeLocalMemory.lbuf: bv32;

procedure {:inline 1} _LOG_READ_$$writeLocalMemory.lbuf(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$writeLocalMemory.lbuf;



implementation {:inline 1} _LOG_READ_$$writeLocalMemory.lbuf(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$writeLocalMemory.lbuf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$writeLocalMemory.lbuf == _value then true else _READ_HAS_OCCURRED_$$writeLocalMemory.lbuf);
    return;
}



procedure _CHECK_READ_$$writeLocalMemory.lbuf(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "lbuf"} {:array "$$writeLocalMemory.lbuf"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$writeLocalMemory.lbuf && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lbuf"} {:array "$$writeLocalMemory.lbuf"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$writeLocalMemory.lbuf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf: bool;

procedure {:inline 1} _LOG_WRITE_$$writeLocalMemory.lbuf(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$writeLocalMemory.lbuf, _WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf;



implementation {:inline 1} _LOG_WRITE_$$writeLocalMemory.lbuf(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$writeLocalMemory.lbuf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$writeLocalMemory.lbuf == _value then true else _WRITE_HAS_OCCURRED_$$writeLocalMemory.lbuf);
    _WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$writeLocalMemory.lbuf == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf);
    return;
}



procedure _CHECK_WRITE_$$writeLocalMemory.lbuf(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "lbuf"} {:array "$$writeLocalMemory.lbuf"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$writeLocalMemory.lbuf && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$writeLocalMemory.lbuf != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lbuf"} {:array "$$writeLocalMemory.lbuf"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$writeLocalMemory.lbuf && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$writeLocalMemory.lbuf != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lbuf"} {:array "$$writeLocalMemory.lbuf"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$writeLocalMemory.lbuf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$writeLocalMemory.lbuf(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$writeLocalMemory.lbuf;



implementation {:inline 1} _LOG_ATOMIC_$$writeLocalMemory.lbuf(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$writeLocalMemory.lbuf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$writeLocalMemory.lbuf);
    return;
}



procedure _CHECK_ATOMIC_$$writeLocalMemory.lbuf(_P: bool, _offset: bv32);
  requires {:source_name "lbuf"} {:array "$$writeLocalMemory.lbuf"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$writeLocalMemory.lbuf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lbuf"} {:array "$$writeLocalMemory.lbuf"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$writeLocalMemory.lbuf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf := (if _P && _WRITE_HAS_OCCURRED_$$writeLocalMemory.lbuf && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$writeLocalMemory.lbuf);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$writeLocalMemory.lbuf;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$writeLocalMemory.lbuf;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$writeLocalMemory.lbuf;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$output;
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
    havoc $$output;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$writeLocalMemory.lbuf;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
