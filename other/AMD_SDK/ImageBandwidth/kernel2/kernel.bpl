type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



axiom {:array_info "$$in"} {:global} {:elem_width 32} {:source_name "in"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$in: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$in: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$in: bool;

var {:source_name "out"} {:global} $$out: [bv32]bv8;

axiom {:array_info "$$out"} {:global} {:elem_width 8} {:source_name "out"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$out: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$out: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$out: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "write_kernel"} {:kernel} $write_kernel($np: bv32, $val: bv32, $nk: bv32);
  requires !_READ_HAS_OCCURRED_$$in && !_WRITE_HAS_OCCURRED_$$in && !_ATOMIC_HAS_OCCURRED_$$in;
  requires !_READ_HAS_OCCURRED_$$out && !_WRITE_HAS_OCCURRED_$$out && !_ATOMIC_HAS_OCCURRED_$$out;
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
  modifies _WRITE_HAS_OCCURRED_$$out, _WRITE_READ_BENIGN_FLAG_$$out, _WRITE_READ_BENIGN_FLAG_$$out;



implementation {:source_name "write_kernel"} {:kernel} $write_kernel($np: bv32, $val: bv32, $nk: bv32)
{
  var $coord.0$1: bv64;
  var $coord.0$2: bv64;
  var $n.0: bv32;
  var $i.0: bv32;
  var $idx.0$1: bv32;
  var $idx.0$2: bv32;
  var $coord.1$1: bv64;
  var $coord.1$2: bv64;
  var v0: bool;
  var v1: bool;
  var v2: bool;
  var v3$1: bv32;
  var v3$2: bv32;


  $0:
    v0 := $nk == 0bv32;
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v0 && !v0;
    $coord.0$1, $n.0 := 0bv32 ++ BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), 0bv32;
    $coord.0$2 := 0bv32 ++ BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 3} true;
    v1 := BV32_ULT($n.0, $nk);
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v1 && !v1;
    goto $10;

  $10:
    return;

  $truebb0:
    assume {:partition} v1 && v1;
    $i.0, $idx.0$1, $coord.1$1 := 0bv32, BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), $coord.0$1;
    $idx.0$2, $coord.1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), $coord.0$2;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_1"} true;
    assert {:block_sourceloc} {:sourceloc_num 5} true;
    v2 := BV32_ULT($i.0, $np);
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v2 && !v2;
    $coord.0$1, $n.0 := $coord.1$1, BV32_ADD($n.0, 1bv32);
    $coord.0$2 := $coord.1$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $3;

  $truebb1:
    assume {:partition} v2 && v2;
    v3$1 := $coord.1$1[32:0];
    v3$2 := $coord.1$2[32:0];
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$out(true, BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), $val[8:0], $$out[BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$out(true, BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), $val[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32)] := $val[8:0];
    $$out[BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32)] := $val[8:0];
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 1bv32), $val[16:8], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 1bv32), $val[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 1bv32)] := $val[16:8];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 1bv32)] := $val[16:8];
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 2bv32), $val[24:16], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 2bv32), $val[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 2bv32)] := $val[24:16];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 2bv32)] := $val[24:16];
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 3bv32), $val[32:24], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 3bv32), $val[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 3bv32)] := $val[32:24];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 3bv32)] := $val[32:24];
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 4bv32), $val[8:0], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 4bv32), $val[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 4bv32)] := $val[8:0];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 4bv32)] := $val[8:0];
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 5bv32), $val[16:8], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 5bv32), $val[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 5bv32)] := $val[16:8];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 5bv32)] := $val[16:8];
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 6bv32), $val[24:16], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 6bv32), $val[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 6bv32)] := $val[24:16];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 6bv32)] := $val[24:16];
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 7bv32), $val[32:24], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 7bv32), $val[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 7bv32)] := $val[32:24];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 7bv32)] := $val[32:24];
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 8bv32), $val[8:0], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 8bv32), $val[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 8bv32)] := $val[8:0];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 8bv32)] := $val[8:0];
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 9bv32), $val[16:8], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 9bv32), $val[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 9bv32)] := $val[16:8];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 9bv32)] := $val[16:8];
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 10bv32), $val[24:16], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 10bv32), $val[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 10bv32)] := $val[24:16];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 10bv32)] := $val[24:16];
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 11bv32), $val[32:24], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 11bv32), $val[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 11bv32)] := $val[32:24];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 11bv32)] := $val[32:24];
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 12bv32), $val[8:0], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 12bv32), $val[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 12bv32)] := $val[8:0];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 12bv32)] := $val[8:0];
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 13bv32), $val[16:8], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 13bv32), $val[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 13bv32)] := $val[16:8];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 13bv32)] := $val[16:8];
    call {:sourceloc} {:sourceloc_num 21} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 14bv32), $val[24:16], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 21} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 14bv32), $val[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 14bv32)] := $val[24:16];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 14bv32)] := $val[24:16];
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 15bv32), $val[32:24], $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$out(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 15bv32), $val[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$1, 32768bv32), v3$1), 16bv32), 15bv32)] := $val[32:24];
    $$out[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($idx.0$2, 32768bv32), v3$2), 16bv32), 15bv32)] := $val[32:24];
    $i.0, $idx.0$1, $coord.1$1 := BV32_ADD($i.0, 1bv32), BV32_ADD($idx.0$1, BV32_MUL(group_size_y, num_groups_y)), $idx.0$1 ++ v3$1;
    $idx.0$2, $coord.1$2 := BV32_ADD($idx.0$2, BV32_MUL(group_size_y, num_groups_y)), $idx.0$2 ++ v3$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $5;

  $truebb:
    assume {:partition} v0 && v0;
    goto $10;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$in: bv32;

procedure {:inline 1} _LOG_READ_$$in(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$in;



implementation {:inline 1} _LOG_READ_$$in(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in == _value then true else _READ_HAS_OCCURRED_$$in);
    return;
}



procedure _CHECK_READ_$$in(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "in"} {:array "$$in"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$in);
  requires {:source_name "in"} {:array "$$in"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$in: bool;

procedure {:inline 1} _LOG_WRITE_$$in(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$in, _WRITE_READ_BENIGN_FLAG_$$in;



implementation {:inline 1} _LOG_WRITE_$$in(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in == _value then true else _WRITE_HAS_OCCURRED_$$in);
    _WRITE_READ_BENIGN_FLAG_$$in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$in);
    return;
}



procedure _CHECK_WRITE_$$in(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "in"} {:array "$$in"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in != _value);
  requires {:source_name "in"} {:array "$$in"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in != _value);
  requires {:source_name "in"} {:array "$$in"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$in(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$in;



implementation {:inline 1} _LOG_ATOMIC_$$in(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$in);
    return;
}



procedure _CHECK_ATOMIC_$$in(_P: bool, _offset: bv32);
  requires {:source_name "in"} {:array "$$in"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset);
  requires {:source_name "in"} {:array "$$in"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$in(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$in;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$in(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$in := (if _P && _WRITE_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$in);
    return;
}



const _WATCHED_VALUE_$$out: bv8;

procedure {:inline 1} _LOG_READ_$$out(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$out;



implementation {:inline 1} _LOG_READ_$$out(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then true else _READ_HAS_OCCURRED_$$out);
    return;
}



procedure _CHECK_READ_$$out(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$out);
  requires {:source_name "out"} {:array "$$out"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$out: bool;

procedure {:inline 1} _LOG_WRITE_$$out(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$out, _WRITE_READ_BENIGN_FLAG_$$out;



implementation {:inline 1} _LOG_WRITE_$$out(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then true else _WRITE_HAS_OCCURRED_$$out);
    _WRITE_READ_BENIGN_FLAG_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$out);
    return;
}



procedure _CHECK_WRITE_$$out(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out != _value);
  requires {:source_name "out"} {:array "$$out"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out != _value);
  requires {:source_name "out"} {:array "$$out"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$out(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$out;



implementation {:inline 1} _LOG_ATOMIC_$$out(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$out);
    return;
}



procedure _CHECK_ATOMIC_$$out(_P: bool, _offset: bv32);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);
  requires {:source_name "out"} {:array "$$out"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$out;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$out := (if _P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$out);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
