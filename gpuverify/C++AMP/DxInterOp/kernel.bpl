type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "data_refY"} {:global} $$data_refY: [bv32]bv32;

axiom {:array_info "$$data_refY"} {:global} {:elem_width 32} {:source_name "data_refY"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data_refY: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data_refY: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data_refY: bool;

var {:source_name "data_refX"} {:global} $$data_refX: [bv32]bv32;

axiom {:array_info "$$data_refX"} {:global} {:elem_width 32} {:source_name "data_refX"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data_refX: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data_refX: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data_refX: bool;

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

function FADD64(bv64, bv64) : bv64;

function FCOS64(bv64) : bv64;

function FMUL64(bv64, bv64) : bv64;

function FP32_CONV64(bv32) : bv64;

function FP64_CONV32(bv64) : bv32;

function FSIN64(bv64) : bv64;

function FSUB64(bv64, bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "run"} {:kernel} $_Z3runPfS_();
  requires !_READ_HAS_OCCURRED_$$data_refY && !_WRITE_HAS_OCCURRED_$$data_refY && !_ATOMIC_HAS_OCCURRED_$$data_refY;
  requires !_READ_HAS_OCCURRED_$$data_refX && !_WRITE_HAS_OCCURRED_$$data_refX && !_ATOMIC_HAS_OCCURRED_$$data_refX;
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
  modifies _READ_HAS_OCCURRED_$$data_refY, _READ_HAS_OCCURRED_$$data_refX, _WRITE_HAS_OCCURRED_$$data_refY, _WRITE_READ_BENIGN_FLAG_$$data_refY, _WRITE_READ_BENIGN_FLAG_$$data_refY, _WRITE_HAS_OCCURRED_$$data_refX, _WRITE_READ_BENIGN_FLAG_$$data_refX, _WRITE_READ_BENIGN_FLAG_$$data_refX;



implementation {:source_name "run"} {:kernel} $_Z3runPfS_()
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    call {:sourceloc} {:sourceloc_num 1} _LOG_READ_$$data_refY(true, v0$1, $$data_refY[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 1} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 1} _CHECK_READ_$$data_refY(true, v0$2, $$data_refY[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data_refY"} true;
    v1$1 := $$data_refY[v0$1];
    v1$2 := $$data_refY[v0$2];
    call {:sourceloc} {:sourceloc_num 2} _LOG_READ_$$data_refX(true, v0$1, $$data_refX[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 2} _CHECK_READ_$$data_refX(true, v0$2, $$data_refX[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data_refX"} true;
    v2$1 := $$data_refX[v0$1];
    v2$2 := $$data_refX[v0$2];
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$data_refY(true, v0$1, FP64_CONV32(FSUB64(FMUL64(FP32_CONV64(v1$1), FCOS64(4569220451632414720bv64)), FMUL64(FP32_CONV64(v2$1), FSIN64(4569220451632414720bv64)))), $$data_refY[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_refY(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$data_refY(true, v0$2, FP64_CONV32(FSUB64(FMUL64(FP32_CONV64(v1$2), FCOS64(4569220451632414720bv64)), FMUL64(FP32_CONV64(v2$2), FSIN64(4569220451632414720bv64)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_refY"} true;
    $$data_refY[v0$1] := FP64_CONV32(FSUB64(FMUL64(FP32_CONV64(v1$1), FCOS64(4569220451632414720bv64)), FMUL64(FP32_CONV64(v2$1), FSIN64(4569220451632414720bv64))));
    $$data_refY[v0$2] := FP64_CONV32(FSUB64(FMUL64(FP32_CONV64(v1$2), FCOS64(4569220451632414720bv64)), FMUL64(FP32_CONV64(v2$2), FSIN64(4569220451632414720bv64))));
    call {:sourceloc} {:sourceloc_num 4} _LOG_READ_$$data_refY(true, v0$1, $$data_refY[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 4} _CHECK_READ_$$data_refY(true, v0$2, $$data_refY[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data_refY"} true;
    v3$1 := $$data_refY[v0$1];
    v3$2 := $$data_refY[v0$2];
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$data_refX(true, v0$1, $$data_refX[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$data_refX(true, v0$2, $$data_refX[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data_refX"} true;
    v4$1 := $$data_refX[v0$1];
    v4$2 := $$data_refX[v0$2];
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$data_refX(true, v0$1, FP64_CONV32(FADD64(FMUL64(FP32_CONV64(v3$1), FSIN64(4569220451632414720bv64)), FMUL64(FP32_CONV64(v4$1), FCOS64(4569220451632414720bv64)))), $$data_refX[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_refX(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$data_refX(true, v0$2, FP64_CONV32(FADD64(FMUL64(FP32_CONV64(v3$2), FSIN64(4569220451632414720bv64)), FMUL64(FP32_CONV64(v4$2), FCOS64(4569220451632414720bv64)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_refX"} true;
    $$data_refX[v0$1] := FP64_CONV32(FADD64(FMUL64(FP32_CONV64(v3$1), FSIN64(4569220451632414720bv64)), FMUL64(FP32_CONV64(v4$1), FCOS64(4569220451632414720bv64))));
    $$data_refX[v0$2] := FP64_CONV32(FADD64(FMUL64(FP32_CONV64(v3$2), FSIN64(4569220451632414720bv64)), FMUL64(FP32_CONV64(v4$2), FCOS64(4569220451632414720bv64))));
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 1024bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$data_refY: bv32;

procedure {:inline 1} _LOG_READ_$$data_refY(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data_refY;



implementation {:inline 1} _LOG_READ_$$data_refY(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data_refY := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_refY == _value then true else _READ_HAS_OCCURRED_$$data_refY);
    return;
}



procedure _CHECK_READ_$$data_refY(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_refY"} {:array "$$data_refY"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data_refY && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data_refY);
  requires {:source_name "data_refY"} {:array "$$data_refY"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data_refY && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data_refY: bool;

procedure {:inline 1} _LOG_WRITE_$$data_refY(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data_refY, _WRITE_READ_BENIGN_FLAG_$$data_refY;



implementation {:inline 1} _LOG_WRITE_$$data_refY(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data_refY := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_refY == _value then true else _WRITE_HAS_OCCURRED_$$data_refY);
    _WRITE_READ_BENIGN_FLAG_$$data_refY := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_refY == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data_refY);
    return;
}



procedure _CHECK_WRITE_$$data_refY(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_refY"} {:array "$$data_refY"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data_refY && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_refY != _value);
  requires {:source_name "data_refY"} {:array "$$data_refY"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data_refY && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_refY != _value);
  requires {:source_name "data_refY"} {:array "$$data_refY"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data_refY && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data_refY(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data_refY;



implementation {:inline 1} _LOG_ATOMIC_$$data_refY(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data_refY := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data_refY);
    return;
}



procedure _CHECK_ATOMIC_$$data_refY(_P: bool, _offset: bv32);
  requires {:source_name "data_refY"} {:array "$$data_refY"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data_refY && _WATCHED_OFFSET == _offset);
  requires {:source_name "data_refY"} {:array "$$data_refY"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data_refY && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_refY(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data_refY;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_refY(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data_refY := (if _P && _WRITE_HAS_OCCURRED_$$data_refY && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data_refY);
    return;
}



const _WATCHED_VALUE_$$data_refX: bv32;

procedure {:inline 1} _LOG_READ_$$data_refX(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data_refX;



implementation {:inline 1} _LOG_READ_$$data_refX(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data_refX := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_refX == _value then true else _READ_HAS_OCCURRED_$$data_refX);
    return;
}



procedure _CHECK_READ_$$data_refX(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_refX"} {:array "$$data_refX"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data_refX && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data_refX);
  requires {:source_name "data_refX"} {:array "$$data_refX"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data_refX && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data_refX: bool;

procedure {:inline 1} _LOG_WRITE_$$data_refX(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data_refX, _WRITE_READ_BENIGN_FLAG_$$data_refX;



implementation {:inline 1} _LOG_WRITE_$$data_refX(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data_refX := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_refX == _value then true else _WRITE_HAS_OCCURRED_$$data_refX);
    _WRITE_READ_BENIGN_FLAG_$$data_refX := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_refX == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data_refX);
    return;
}



procedure _CHECK_WRITE_$$data_refX(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_refX"} {:array "$$data_refX"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data_refX && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_refX != _value);
  requires {:source_name "data_refX"} {:array "$$data_refX"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data_refX && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_refX != _value);
  requires {:source_name "data_refX"} {:array "$$data_refX"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data_refX && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data_refX(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data_refX;



implementation {:inline 1} _LOG_ATOMIC_$$data_refX(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data_refX := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data_refX);
    return;
}



procedure _CHECK_ATOMIC_$$data_refX(_P: bool, _offset: bv32);
  requires {:source_name "data_refX"} {:array "$$data_refX"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data_refX && _WATCHED_OFFSET == _offset);
  requires {:source_name "data_refX"} {:array "$$data_refX"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data_refX && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_refX(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data_refX;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_refX(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data_refX := (if _P && _WRITE_HAS_OCCURRED_$$data_refX && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data_refX);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
