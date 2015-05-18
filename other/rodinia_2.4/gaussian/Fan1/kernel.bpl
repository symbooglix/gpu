type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "m_dev"} {:global} $$m_dev: [bv32]bv32;

axiom {:array_info "$$m_dev"} {:global} {:elem_width 32} {:source_name "m_dev"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$m_dev: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$m_dev: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$m_dev: bool;

axiom {:array_info "$$a_dev"} {:global} {:elem_width 32} {:source_name "a_dev"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$a_dev: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$a_dev: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$a_dev: bool;

axiom {:array_info "$$b_dev"} {:global} {:elem_width 32} {:source_name "b_dev"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$b_dev: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$b_dev: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$b_dev: bool;

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

function FDIV32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

procedure {:source_name "Fan1"} {:kernel} $Fan1($size: bv32, $t: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $size == 256bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if BV32_AND(BV1_ZEXT32((if BV32_SGE($t, 0bv32) then 1bv1 else 0bv1)), BV1_ZEXT32((if BV32_SLE($t, 254bv32) then 1bv1 else 0bv1))) != 0bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$m_dev && !_WRITE_HAS_OCCURRED_$$m_dev && !_ATOMIC_HAS_OCCURRED_$$m_dev;
  requires !_READ_HAS_OCCURRED_$$a_dev && !_WRITE_HAS_OCCURRED_$$a_dev && !_ATOMIC_HAS_OCCURRED_$$a_dev;
  requires !_READ_HAS_OCCURRED_$$b_dev && !_WRITE_HAS_OCCURRED_$$b_dev && !_ATOMIC_HAS_OCCURRED_$$b_dev;
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
  modifies _WRITE_HAS_OCCURRED_$$m_dev, _WRITE_READ_BENIGN_FLAG_$$m_dev, _WRITE_READ_BENIGN_FLAG_$$m_dev;



implementation {:source_name "Fan1"} {:kernel} $Fan1($size: bv32, $t: bv32)
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
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_SLT(v0$1, BV32_SUB(BV32_SUB($size, 1bv32), $t));
    v1$2 := BV32_SLT(v0$2, BV32_SUB(BV32_SUB($size, 1bv32), $t));
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p0$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p0$2 then _HAVOC_bv32$2 else v2$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p0$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p0$2 then _HAVOC_bv32$2 else v3$2);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$m_dev(p0$1, BV32_ADD(BV32_MUL($size, BV32_ADD(BV32_ADD(v0$1, $t), 1bv32)), $t), FDIV32(v2$1, v3$1), $$m_dev[BV32_ADD(BV32_MUL($size, BV32_ADD(BV32_ADD(v0$1, $t), 1bv32)), $t)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$m_dev(p0$2, BV32_ADD(BV32_MUL($size, BV32_ADD(BV32_ADD(v0$2, $t), 1bv32)), $t));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$m_dev(p0$2, BV32_ADD(BV32_MUL($size, BV32_ADD(BV32_ADD(v0$2, $t), 1bv32)), $t), FDIV32(v2$2, v3$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$m_dev"} true;
    $$m_dev[BV32_ADD(BV32_MUL($size, BV32_ADD(BV32_ADD(v0$1, $t), 1bv32)), $t)] := (if p0$1 then FDIV32(v2$1, v3$1) else $$m_dev[BV32_ADD(BV32_MUL($size, BV32_ADD(BV32_ADD(v0$1, $t), 1bv32)), $t)]);
    $$m_dev[BV32_ADD(BV32_MUL($size, BV32_ADD(BV32_ADD(v0$2, $t), 1bv32)), $t)] := (if p0$2 then FDIV32(v2$2, v3$2) else $$m_dev[BV32_ADD(BV32_MUL($size, BV32_ADD(BV32_ADD(v0$2, $t), 1bv32)), $t)]);
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$m_dev: bv32;

procedure {:inline 1} _LOG_READ_$$m_dev(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$m_dev;



implementation {:inline 1} _LOG_READ_$$m_dev(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$m_dev := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m_dev == _value then true else _READ_HAS_OCCURRED_$$m_dev);
    return;
}



procedure _CHECK_READ_$$m_dev(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "m_dev"} {:array "$$m_dev"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$m_dev && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$m_dev);
  requires {:source_name "m_dev"} {:array "$$m_dev"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$m_dev && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$m_dev: bool;

procedure {:inline 1} _LOG_WRITE_$$m_dev(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$m_dev, _WRITE_READ_BENIGN_FLAG_$$m_dev;



implementation {:inline 1} _LOG_WRITE_$$m_dev(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$m_dev := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m_dev == _value then true else _WRITE_HAS_OCCURRED_$$m_dev);
    _WRITE_READ_BENIGN_FLAG_$$m_dev := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m_dev == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$m_dev);
    return;
}



procedure _CHECK_WRITE_$$m_dev(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "m_dev"} {:array "$$m_dev"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$m_dev && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m_dev != _value);
  requires {:source_name "m_dev"} {:array "$$m_dev"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$m_dev && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m_dev != _value);
  requires {:source_name "m_dev"} {:array "$$m_dev"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$m_dev && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$m_dev(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$m_dev;



implementation {:inline 1} _LOG_ATOMIC_$$m_dev(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$m_dev := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$m_dev);
    return;
}



procedure _CHECK_ATOMIC_$$m_dev(_P: bool, _offset: bv32);
  requires {:source_name "m_dev"} {:array "$$m_dev"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$m_dev && _WATCHED_OFFSET == _offset);
  requires {:source_name "m_dev"} {:array "$$m_dev"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$m_dev && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$m_dev(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$m_dev;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$m_dev(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$m_dev := (if _P && _WRITE_HAS_OCCURRED_$$m_dev && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$m_dev);
    return;
}



const _WATCHED_VALUE_$$a_dev: bv32;

procedure {:inline 1} _LOG_READ_$$a_dev(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$a_dev;



implementation {:inline 1} _LOG_READ_$$a_dev(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$a_dev := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$a_dev == _value then true else _READ_HAS_OCCURRED_$$a_dev);
    return;
}



procedure _CHECK_READ_$$a_dev(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "a_dev"} {:array "$$a_dev"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$a_dev && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$a_dev);
  requires {:source_name "a_dev"} {:array "$$a_dev"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$a_dev && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$a_dev: bool;

procedure {:inline 1} _LOG_WRITE_$$a_dev(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$a_dev, _WRITE_READ_BENIGN_FLAG_$$a_dev;



implementation {:inline 1} _LOG_WRITE_$$a_dev(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$a_dev := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$a_dev == _value then true else _WRITE_HAS_OCCURRED_$$a_dev);
    _WRITE_READ_BENIGN_FLAG_$$a_dev := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$a_dev == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$a_dev);
    return;
}



procedure _CHECK_WRITE_$$a_dev(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "a_dev"} {:array "$$a_dev"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$a_dev && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$a_dev != _value);
  requires {:source_name "a_dev"} {:array "$$a_dev"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$a_dev && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$a_dev != _value);
  requires {:source_name "a_dev"} {:array "$$a_dev"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$a_dev && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$a_dev(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$a_dev;



implementation {:inline 1} _LOG_ATOMIC_$$a_dev(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$a_dev := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$a_dev);
    return;
}



procedure _CHECK_ATOMIC_$$a_dev(_P: bool, _offset: bv32);
  requires {:source_name "a_dev"} {:array "$$a_dev"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$a_dev && _WATCHED_OFFSET == _offset);
  requires {:source_name "a_dev"} {:array "$$a_dev"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$a_dev && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$a_dev(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$a_dev;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$a_dev(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$a_dev := (if _P && _WRITE_HAS_OCCURRED_$$a_dev && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$a_dev);
    return;
}



const _WATCHED_VALUE_$$b_dev: bv32;

procedure {:inline 1} _LOG_READ_$$b_dev(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$b_dev;



implementation {:inline 1} _LOG_READ_$$b_dev(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$b_dev := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$b_dev == _value then true else _READ_HAS_OCCURRED_$$b_dev);
    return;
}



procedure _CHECK_READ_$$b_dev(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "b_dev"} {:array "$$b_dev"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$b_dev && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$b_dev);
  requires {:source_name "b_dev"} {:array "$$b_dev"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$b_dev && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$b_dev: bool;

procedure {:inline 1} _LOG_WRITE_$$b_dev(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$b_dev, _WRITE_READ_BENIGN_FLAG_$$b_dev;



implementation {:inline 1} _LOG_WRITE_$$b_dev(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$b_dev := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$b_dev == _value then true else _WRITE_HAS_OCCURRED_$$b_dev);
    _WRITE_READ_BENIGN_FLAG_$$b_dev := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$b_dev == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$b_dev);
    return;
}



procedure _CHECK_WRITE_$$b_dev(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "b_dev"} {:array "$$b_dev"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$b_dev && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$b_dev != _value);
  requires {:source_name "b_dev"} {:array "$$b_dev"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$b_dev && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$b_dev != _value);
  requires {:source_name "b_dev"} {:array "$$b_dev"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$b_dev && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$b_dev(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$b_dev;



implementation {:inline 1} _LOG_ATOMIC_$$b_dev(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$b_dev := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$b_dev);
    return;
}



procedure _CHECK_ATOMIC_$$b_dev(_P: bool, _offset: bv32);
  requires {:source_name "b_dev"} {:array "$$b_dev"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$b_dev && _WATCHED_OFFSET == _offset);
  requires {:source_name "b_dev"} {:array "$$b_dev"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$b_dev && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$b_dev(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$b_dev;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$b_dev(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$b_dev := (if _P && _WRITE_HAS_OCCURRED_$$b_dev && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$b_dev);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
