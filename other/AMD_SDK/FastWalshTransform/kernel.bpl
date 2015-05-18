type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "tArray"} {:global} $$tArray: [bv32]bv32;

axiom {:array_info "$$tArray"} {:global} {:elem_width 32} {:source_name "tArray"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$tArray: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$tArray: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$tArray: bool;

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

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvurem"} BV32_UREM(bv32, bv32) : bv32;

procedure {:source_name "fastWalshTransform"} {:kernel} $fastWalshTransform($step: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $step == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$tArray && !_WRITE_HAS_OCCURRED_$$tArray && !_ATOMIC_HAS_OCCURRED_$$tArray;
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
  modifies _READ_HAS_OCCURRED_$$tArray, _WRITE_HAS_OCCURRED_$$tArray, _WRITE_READ_BENIGN_FLAG_$$tArray, _WRITE_READ_BENIGN_FLAG_$$tArray;



implementation {:source_name "fastWalshTransform"} {:kernel} $fastWalshTransform($step: bv32)
{
  var v3$1: bv32;
  var v3$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(BV32_MUL(2bv32, $step), BV32_UDIV(v0$1, $step)), BV32_UREM(v0$1, $step));
    v1$2 := BV32_ADD(BV32_MUL(BV32_MUL(2bv32, $step), BV32_UDIV(v0$2, $step)), BV32_UREM(v0$2, $step));
    v2$1 := BV32_ADD(v1$1, $step);
    v2$2 := BV32_ADD(v1$2, $step);
    call {:sourceloc} {:sourceloc_num 2} _LOG_READ_$$tArray(true, v1$1, $$tArray[v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 2} _CHECK_READ_$$tArray(true, v1$2, $$tArray[v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$tArray"} true;
    v3$1 := $$tArray[v1$1];
    v3$2 := $$tArray[v1$2];
    call {:sourceloc} {:sourceloc_num 3} _LOG_READ_$$tArray(true, v2$1, $$tArray[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 3} _CHECK_READ_$$tArray(true, v2$2, $$tArray[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$tArray"} true;
    v4$1 := $$tArray[v2$1];
    v4$2 := $$tArray[v2$2];
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$tArray(true, v1$1, FADD32(v3$1, v4$1), $$tArray[v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$tArray(true, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$tArray(true, v1$2, FADD32(v3$2, v4$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$tArray"} true;
    $$tArray[v1$1] := FADD32(v3$1, v4$1);
    $$tArray[v1$2] := FADD32(v3$2, v4$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$tArray(true, v2$1, FSUB32(v3$1, v4$1), $$tArray[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$tArray(true, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$tArray(true, v2$2, FSUB32(v3$2, v4$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$tArray"} true;
    $$tArray[v2$1] := FSUB32(v3$1, v4$1);
    $$tArray[v2$2] := FSUB32(v3$2, v4$2);
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$tArray: bv32;

procedure {:inline 1} _LOG_READ_$$tArray(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$tArray;



implementation {:inline 1} _LOG_READ_$$tArray(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$tArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tArray == _value then true else _READ_HAS_OCCURRED_$$tArray);
    return;
}



procedure _CHECK_READ_$$tArray(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "tArray"} {:array "$$tArray"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$tArray && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$tArray);
  requires {:source_name "tArray"} {:array "$$tArray"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$tArray && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$tArray: bool;

procedure {:inline 1} _LOG_WRITE_$$tArray(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$tArray, _WRITE_READ_BENIGN_FLAG_$$tArray;



implementation {:inline 1} _LOG_WRITE_$$tArray(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$tArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tArray == _value then true else _WRITE_HAS_OCCURRED_$$tArray);
    _WRITE_READ_BENIGN_FLAG_$$tArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tArray == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$tArray);
    return;
}



procedure _CHECK_WRITE_$$tArray(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "tArray"} {:array "$$tArray"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$tArray && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tArray != _value);
  requires {:source_name "tArray"} {:array "$$tArray"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$tArray && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tArray != _value);
  requires {:source_name "tArray"} {:array "$$tArray"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$tArray && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$tArray(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$tArray;



implementation {:inline 1} _LOG_ATOMIC_$$tArray(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$tArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$tArray);
    return;
}



procedure _CHECK_ATOMIC_$$tArray(_P: bool, _offset: bv32);
  requires {:source_name "tArray"} {:array "$$tArray"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$tArray && _WATCHED_OFFSET == _offset);
  requires {:source_name "tArray"} {:array "$$tArray"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$tArray && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$tArray(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$tArray;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$tArray(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$tArray := (if _P && _WRITE_HAS_OCCURRED_$$tArray && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$tArray);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
