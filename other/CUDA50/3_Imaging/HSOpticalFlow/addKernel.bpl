type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$op1"} {:global} {:elem_width 32} {:source_name "op1"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$op1: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$op1: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$op1: bool;

axiom {:array_info "$$op2"} {:global} {:elem_width 32} {:source_name "op2"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$op2: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$op2: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$op2: bool;

var {:source_name "sum"} {:global} $$sum: [bv32]bv32;

axiom {:array_info "$$sum"} {:global} {:elem_width 32} {:source_name "sum"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sum: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sum: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sum: bool;

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

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

procedure {:source_name "AddKernel"} {:kernel} $_Z9AddKernelPKfS0_iPf($count: bv32);
  requires !_READ_HAS_OCCURRED_$$op1 && !_WRITE_HAS_OCCURRED_$$op1 && !_ATOMIC_HAS_OCCURRED_$$op1;
  requires !_READ_HAS_OCCURRED_$$op2 && !_WRITE_HAS_OCCURRED_$$op2 && !_ATOMIC_HAS_OCCURRED_$$op2;
  requires !_READ_HAS_OCCURRED_$$sum && !_WRITE_HAS_OCCURRED_$$sum && !_ATOMIC_HAS_OCCURRED_$$sum;
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
  modifies _WRITE_HAS_OCCURRED_$$sum, _WRITE_READ_BENIGN_FLAG_$$sum, _WRITE_READ_BENIGN_FLAG_$$sum;



implementation {:source_name "AddKernel"} {:kernel} $_Z9AddKernelPKfS0_iPf($count: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, group_size_x));
    v0$2 := BV32_ADD(local_id_x$2, BV32_MUL(group_id_x$2, group_size_x));
    v1$1 := BV32_SGE(v0$1, $count);
    v1$2 := BV32_SGE(v0$2, $count);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p1$1 := (if !v1$1 then !v1$1 else p1$1);
    p1$2 := (if !v1$2 then !v1$2 else p1$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p1$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p1$2 then _HAVOC_bv32$2 else v2$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p1$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p1$2 then _HAVOC_bv32$2 else v3$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$sum(p1$1, v0$1, FADD32(v2$1, v3$1), $$sum[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sum(p1$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$sum(p1$2, v0$2, FADD32(v2$2, v3$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sum"} true;
    $$sum[v0$1] := (if p1$1 then FADD32(v2$1, v3$1) else $$sum[v0$1]);
    $$sum[v0$2] := (if p1$2 then FADD32(v2$2, v3$2) else $$sum[v0$2]);
    return;
}



axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1200bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$op1: bv32;

procedure {:inline 1} _LOG_READ_$$op1(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$op1;



implementation {:inline 1} _LOG_READ_$$op1(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$op1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$op1 == _value then true else _READ_HAS_OCCURRED_$$op1);
    return;
}



procedure _CHECK_READ_$$op1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "op1"} {:array "$$op1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$op1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$op1);
  requires {:source_name "op1"} {:array "$$op1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$op1 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$op1: bool;

procedure {:inline 1} _LOG_WRITE_$$op1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$op1, _WRITE_READ_BENIGN_FLAG_$$op1;



implementation {:inline 1} _LOG_WRITE_$$op1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$op1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$op1 == _value then true else _WRITE_HAS_OCCURRED_$$op1);
    _WRITE_READ_BENIGN_FLAG_$$op1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$op1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$op1);
    return;
}



procedure _CHECK_WRITE_$$op1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "op1"} {:array "$$op1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$op1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$op1 != _value);
  requires {:source_name "op1"} {:array "$$op1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$op1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$op1 != _value);
  requires {:source_name "op1"} {:array "$$op1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$op1 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$op1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$op1;



implementation {:inline 1} _LOG_ATOMIC_$$op1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$op1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$op1);
    return;
}



procedure _CHECK_ATOMIC_$$op1(_P: bool, _offset: bv32);
  requires {:source_name "op1"} {:array "$$op1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$op1 && _WATCHED_OFFSET == _offset);
  requires {:source_name "op1"} {:array "$$op1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$op1 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$op1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$op1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$op1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$op1 := (if _P && _WRITE_HAS_OCCURRED_$$op1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$op1);
    return;
}



const _WATCHED_VALUE_$$op2: bv32;

procedure {:inline 1} _LOG_READ_$$op2(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$op2;



implementation {:inline 1} _LOG_READ_$$op2(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$op2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$op2 == _value then true else _READ_HAS_OCCURRED_$$op2);
    return;
}



procedure _CHECK_READ_$$op2(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "op2"} {:array "$$op2"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$op2 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$op2);
  requires {:source_name "op2"} {:array "$$op2"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$op2 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$op2: bool;

procedure {:inline 1} _LOG_WRITE_$$op2(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$op2, _WRITE_READ_BENIGN_FLAG_$$op2;



implementation {:inline 1} _LOG_WRITE_$$op2(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$op2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$op2 == _value then true else _WRITE_HAS_OCCURRED_$$op2);
    _WRITE_READ_BENIGN_FLAG_$$op2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$op2 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$op2);
    return;
}



procedure _CHECK_WRITE_$$op2(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "op2"} {:array "$$op2"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$op2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$op2 != _value);
  requires {:source_name "op2"} {:array "$$op2"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$op2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$op2 != _value);
  requires {:source_name "op2"} {:array "$$op2"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$op2 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$op2(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$op2;



implementation {:inline 1} _LOG_ATOMIC_$$op2(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$op2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$op2);
    return;
}



procedure _CHECK_ATOMIC_$$op2(_P: bool, _offset: bv32);
  requires {:source_name "op2"} {:array "$$op2"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$op2 && _WATCHED_OFFSET == _offset);
  requires {:source_name "op2"} {:array "$$op2"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$op2 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$op2(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$op2;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$op2(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$op2 := (if _P && _WRITE_HAS_OCCURRED_$$op2 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$op2);
    return;
}



const _WATCHED_VALUE_$$sum: bv32;

procedure {:inline 1} _LOG_READ_$$sum(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$sum;



implementation {:inline 1} _LOG_READ_$$sum(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sum := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum == _value then true else _READ_HAS_OCCURRED_$$sum);
    return;
}



procedure _CHECK_READ_$$sum(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sum"} {:array "$$sum"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sum);
  requires {:source_name "sum"} {:array "$$sum"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$sum: bool;

procedure {:inline 1} _LOG_WRITE_$$sum(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$sum, _WRITE_READ_BENIGN_FLAG_$$sum;



implementation {:inline 1} _LOG_WRITE_$$sum(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sum := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum == _value then true else _WRITE_HAS_OCCURRED_$$sum);
    _WRITE_READ_BENIGN_FLAG_$$sum := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sum);
    return;
}



procedure _CHECK_WRITE_$$sum(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sum"} {:array "$$sum"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum != _value);
  requires {:source_name "sum"} {:array "$$sum"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum != _value);
  requires {:source_name "sum"} {:array "$$sum"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$sum(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sum;



implementation {:inline 1} _LOG_ATOMIC_$$sum(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sum := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sum);
    return;
}



procedure _CHECK_ATOMIC_$$sum(_P: bool, _offset: bv32);
  requires {:source_name "sum"} {:array "$$sum"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset);
  requires {:source_name "sum"} {:array "$$sum"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sum(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sum;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sum(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sum := (if _P && _WRITE_HAS_OCCURRED_$$sum && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sum);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
