type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "output"} {:global} $$output: [bv32]bv32;

axiom {:array_info "$$output"} {:global} {:elem_width 32} {:source_name "output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output: bool;

axiom {:array_info "$$input"} {:global} {:elem_width 32} {:source_name "input"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input: bool;

axiom {:array_info "$$dct8x8"} {:global} {:elem_width 32} {:source_name "dct8x8"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$dct8x8: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$dct8x8: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$dct8x8: bool;

var {:source_name "inter"} {:group_shared} $$inter: [bv1][bv32]bv32;

axiom {:array_info "$$inter"} {:group_shared} {:elem_width 32} {:source_name "inter"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$inter: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$inter: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$inter: bool;

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

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "DCT"} {:kernel} $DCT($width: bv32, $blockWidth: bv32, $inverse: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 64bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $blockWidth == 8bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$output && !_WRITE_HAS_OCCURRED_$$output && !_ATOMIC_HAS_OCCURRED_$$output;
  requires !_READ_HAS_OCCURRED_$$input && !_WRITE_HAS_OCCURRED_$$input && !_ATOMIC_HAS_OCCURRED_$$input;
  requires !_READ_HAS_OCCURRED_$$dct8x8 && !_WRITE_HAS_OCCURRED_$$dct8x8 && !_ATOMIC_HAS_OCCURRED_$$dct8x8;
  requires !_READ_HAS_OCCURRED_$$inter && !_WRITE_HAS_OCCURRED_$$inter && !_ATOMIC_HAS_OCCURRED_$$inter;
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
  modifies $$inter, _WRITE_HAS_OCCURRED_$$inter, _WRITE_READ_BENIGN_FLAG_$$inter, _WRITE_READ_BENIGN_FLAG_$$inter, $$output, _TRACKING, _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _READ_HAS_OCCURRED_$$inter;



implementation {:source_name "DCT"} {:kernel} $DCT($width: bv32, $blockWidth: bv32, $inverse: bv32)
{
  var $acc.0$1: bv32;
  var $acc.0$2: bv32;
  var $k.0: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $acc.1$1: bv32;
  var $acc.1$2: bv32;
  var $k1.0: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3: bool;
  var v4: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9: bool;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1$1 := local_id_y$1;
    v1$2 := local_id_y$2;
    v2$1 := BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    v2$2 := BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    $acc.0$1, $k.0 := 0bv32, 0bv32;
    $acc.0$2 := 0bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$inter ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$inter ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$inter ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 3} true;
    v3 := BV32_ULT($k.0, $blockWidth);
    goto $truebb, __partitioned_block_$falsebb_0;

  __partitioned_block_$falsebb_0:
    assume {:partition} !v3 && !v3;
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$inter(true, BV32_ADD(BV32_MUL(v1$1, $blockWidth), v0$1), $acc.0$1, $$inter[1bv1][BV32_ADD(BV32_MUL(v1$1, $blockWidth), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inter(true, BV32_ADD(BV32_MUL(v1$2, $blockWidth), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$inter(true, BV32_ADD(BV32_MUL(v1$2, $blockWidth), v0$2), $acc.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inter"} true;
    $$inter[1bv1][BV32_ADD(BV32_MUL(v1$1, $blockWidth), v0$1)] := $acc.0$1;
    $$inter[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, $blockWidth), v0$2)] := $acc.0$2;
    goto __partitioned_block_$falsebb_1;

  __partitioned_block_$falsebb_1:
    call {:sourceloc_num 13} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    $acc.1$1, $k1.0 := 0bv32, 0bv32;
    $acc.1$2 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $8;

  $8:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$inter ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$inter ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$inter ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 14} true;
    v7 := BV32_ULT($k1.0, $blockWidth);
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v7 && !v7;
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$output(true, v2$1, $acc.1$1, $$output[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$output(true, v2$2, $acc.1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[v2$1] := $acc.1$1;
    $$output[v2$2] := $acc.1$2;
    return;

  $truebb1:
    assume {:partition} v7 && v7;
    v8$1 := BV32_ADD(BV32_MUL(v0$1, $blockWidth), $k1.0);
    v8$2 := BV32_ADD(BV32_MUL(v0$2, $blockWidth), $k1.0);
    v9 := $inverse != 0bv32;
    goto $truebb2, $falsebb2;

  $falsebb2:
    assume {:partition} !v9 && !v9;
    $1$1 := BV32_ADD(BV32_MUL($k1.0, $blockWidth), v1$1);
    $1$2 := BV32_ADD(BV32_MUL($k1.0, $blockWidth), v1$2);
    goto $12;

  $12:
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$inter(true, v8$1, $$inter[1bv1][v8$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$inter(true, v8$2, $$inter[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v8$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inter"} true;
    v10$1 := $$inter[1bv1][v8$1];
    v10$2 := $$inter[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v8$2];
    havoc v11$1, v11$2;
    $acc.1$1, $k1.0 := FADD32($acc.1$1, FMUL32(v10$1, v11$1)), BV32_ADD($k1.0, 1bv32);
    $acc.1$2 := FADD32($acc.1$2, FMUL32(v10$2, v11$2));
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $8;

  $truebb2:
    assume {:partition} v9 && v9;
    $1$1 := BV32_ADD(BV32_MUL(v1$1, $blockWidth), $k1.0);
    $1$2 := BV32_ADD(BV32_MUL(v1$2, $blockWidth), $k1.0);
    goto $12;

  $truebb:
    assume {:partition} v3 && v3;
    v4 := $inverse != 0bv32;
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v4 && !v4;
    $0$1 := BV32_ADD(BV32_MUL($k.0, $blockWidth), v0$1);
    $0$2 := BV32_ADD(BV32_MUL($k.0, $blockWidth), v0$2);
    goto $5;

  $5:
    havoc v5$1, v5$2;
    havoc v6$1, v6$2;
    $acc.0$1, $k.0 := FADD32($acc.0$1, FMUL32(v5$1, v6$1)), BV32_ADD($k.0, 1bv32);
    $acc.0$2 := FADD32($acc.0$2, FMUL32(v5$2, v6$2));
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $1;

  $truebb0:
    assume {:partition} v4 && v4;
    $0$1 := BV32_ADD(BV32_MUL(v0$1, $blockWidth), $k.0);
    $0$2 := BV32_ADD(BV32_MUL(v0$2, $blockWidth), $k.0);
    goto $5;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$inter, $$output, _TRACKING;



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



const _WATCHED_VALUE_$$dct8x8: bv32;

procedure {:inline 1} _LOG_READ_$$dct8x8(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$dct8x8;



implementation {:inline 1} _LOG_READ_$$dct8x8(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$dct8x8 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dct8x8 == _value then true else _READ_HAS_OCCURRED_$$dct8x8);
    return;
}



procedure _CHECK_READ_$$dct8x8(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dct8x8"} {:array "$$dct8x8"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$dct8x8 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$dct8x8);
  requires {:source_name "dct8x8"} {:array "$$dct8x8"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$dct8x8 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$dct8x8: bool;

procedure {:inline 1} _LOG_WRITE_$$dct8x8(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$dct8x8, _WRITE_READ_BENIGN_FLAG_$$dct8x8;



implementation {:inline 1} _LOG_WRITE_$$dct8x8(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$dct8x8 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dct8x8 == _value then true else _WRITE_HAS_OCCURRED_$$dct8x8);
    _WRITE_READ_BENIGN_FLAG_$$dct8x8 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dct8x8 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$dct8x8);
    return;
}



procedure _CHECK_WRITE_$$dct8x8(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dct8x8"} {:array "$$dct8x8"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$dct8x8 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dct8x8 != _value);
  requires {:source_name "dct8x8"} {:array "$$dct8x8"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$dct8x8 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dct8x8 != _value);
  requires {:source_name "dct8x8"} {:array "$$dct8x8"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$dct8x8 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$dct8x8(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$dct8x8;



implementation {:inline 1} _LOG_ATOMIC_$$dct8x8(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$dct8x8 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$dct8x8);
    return;
}



procedure _CHECK_ATOMIC_$$dct8x8(_P: bool, _offset: bv32);
  requires {:source_name "dct8x8"} {:array "$$dct8x8"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$dct8x8 && _WATCHED_OFFSET == _offset);
  requires {:source_name "dct8x8"} {:array "$$dct8x8"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$dct8x8 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dct8x8(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$dct8x8;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dct8x8(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$dct8x8 := (if _P && _WRITE_HAS_OCCURRED_$$dct8x8 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$dct8x8);
    return;
}



const _WATCHED_VALUE_$$inter: bv32;

procedure {:inline 1} _LOG_READ_$$inter(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$inter;



implementation {:inline 1} _LOG_READ_$$inter(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$inter := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inter == _value then true else _READ_HAS_OCCURRED_$$inter);
    return;
}



procedure _CHECK_READ_$$inter(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "inter"} {:array "$$inter"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$inter && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$inter && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "inter"} {:array "$$inter"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$inter && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$inter: bool;

procedure {:inline 1} _LOG_WRITE_$$inter(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$inter, _WRITE_READ_BENIGN_FLAG_$$inter;



implementation {:inline 1} _LOG_WRITE_$$inter(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$inter := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inter == _value then true else _WRITE_HAS_OCCURRED_$$inter);
    _WRITE_READ_BENIGN_FLAG_$$inter := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inter == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$inter);
    return;
}



procedure _CHECK_WRITE_$$inter(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "inter"} {:array "$$inter"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$inter && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inter != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "inter"} {:array "$$inter"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$inter && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inter != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "inter"} {:array "$$inter"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$inter && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$inter(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$inter;



implementation {:inline 1} _LOG_ATOMIC_$$inter(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$inter := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$inter);
    return;
}



procedure _CHECK_ATOMIC_$$inter(_P: bool, _offset: bv32);
  requires {:source_name "inter"} {:array "$$inter"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$inter && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "inter"} {:array "$$inter"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$inter && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$inter(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$inter;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$inter(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$inter := (if _P && _WRITE_HAS_OCCURRED_$$inter && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$inter);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$inter;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$inter;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$inter;
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
    havoc $$inter;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
