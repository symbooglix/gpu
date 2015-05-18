type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_Result"} {:global} $$d_Result: [bv32]bv32;

axiom {:array_info "$$d_Result"} {:global} {:elem_width 32} {:source_name "d_Result"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Result: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Result: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Result: bool;

axiom {:array_info "$$d_Input"} {:global} {:elem_width 32} {:source_name "d_Input"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Input: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "reduceKernel"} {:kernel} $_Z12reduceKernelPfS_i($N: bv32);
  requires !_READ_HAS_OCCURRED_$$d_Result && !_WRITE_HAS_OCCURRED_$$d_Result && !_ATOMIC_HAS_OCCURRED_$$d_Result;
  requires !_READ_HAS_OCCURRED_$$d_Input && !_WRITE_HAS_OCCURRED_$$d_Input && !_ATOMIC_HAS_OCCURRED_$$d_Input;
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
  modifies _WRITE_HAS_OCCURRED_$$d_Result, _WRITE_READ_BENIGN_FLAG_$$d_Result, _WRITE_READ_BENIGN_FLAG_$$d_Result;



implementation {:source_name "reduceKernel"} {:kernel} $_Z12reduceKernelPfS_i($N: bv32)
{
  var $sum.0$1: bv32;
  var $sum.0$2: bv32;
  var $pos.0$1: bv32;
  var $pos.0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    $sum.0$1, $pos.0$1 := 0bv32, v0$1;
    $sum.0$2, $pos.0$2 := 0bv32, v0$2;
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 1} p0$1 ==> true;
    v1$1 := (if p0$1 then BV32_SLT($pos.0$1, $N) else v1$1);
    v1$2 := (if p0$2 then BV32_SLT($pos.0$2, $N) else v1$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p1$1 := (if p0$1 && v1$1 then v1$1 else p1$1);
    p1$2 := (if p0$2 && v1$2 then v1$2 else p1$2);
    p0$1 := (if p0$1 && !v1$1 then v1$1 else p0$1);
    p0$2 := (if p0$2 && !v1$2 then v1$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p1$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p1$2 then _HAVOC_bv32$2 else v2$2);
    $sum.0$1, $pos.0$1 := (if p1$1 then FADD32($sum.0$1, v2$1) else $sum.0$1), (if p1$1 then BV32_ADD($pos.0$1, BV32_MUL(num_groups_x, group_size_x)) else $pos.0$1);
    $sum.0$2, $pos.0$2 := (if p1$2 then FADD32($sum.0$2, v2$2) else $sum.0$2), (if p1$2 then BV32_ADD($pos.0$2, BV32_MUL(num_groups_x, group_size_x)) else $pos.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$d_Result(true, v0$1, $sum.0$1, $$d_Result[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Result(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$d_Result(true, v0$2, $sum.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Result"} true;
    $$d_Result[v0$1] := $sum.0$1;
    $$d_Result[v0$2] := $sum.0$2;
    return;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

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



const _WATCHED_VALUE_$$d_Input: bv32;

procedure {:inline 1} _LOG_READ_$$d_Input(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Input;



implementation {:inline 1} _LOG_READ_$$d_Input(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input == _value then true else _READ_HAS_OCCURRED_$$d_Input);
    return;
}



procedure _CHECK_READ_$$d_Input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Input);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Input: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Input, _WRITE_READ_BENIGN_FLAG_$$d_Input;



implementation {:inline 1} _LOG_WRITE_$$d_Input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input == _value then true else _WRITE_HAS_OCCURRED_$$d_Input);
    _WRITE_READ_BENIGN_FLAG_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Input);
    return;
}



procedure _CHECK_WRITE_$$d_Input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input != _value);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Input != _value);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Input(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Input;



implementation {:inline 1} _LOG_ATOMIC_$$d_Input(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Input);
    return;
}



procedure _CHECK_ATOMIC_$$d_Input(_P: bool, _offset: bv32);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Input"} {:array "$$d_Input"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Input(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Input;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Input(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Input := (if _P && _WRITE_HAS_OCCURRED_$$d_Input && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Input);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
