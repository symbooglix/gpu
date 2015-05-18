type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "rngState"} {:global} $$rngState: [bv32]bv32;

axiom {:array_info "$$rngState"} {:global} {:elem_width 32} {:source_name "rngState"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$rngState: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$rngState: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$rngState: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "rngSetupStates"} {:kernel} $_Z14rngSetupStatesP17curandStateXORWOWyy($seed: bv64, $offset: bv64);
  requires !_READ_HAS_OCCURRED_$$rngState && !_WRITE_HAS_OCCURRED_$$rngState && !_ATOMIC_HAS_OCCURRED_$$rngState;
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
  modifies _WRITE_HAS_OCCURRED_$$rngState, _WRITE_READ_BENIGN_FLAG_$$rngState, _WRITE_READ_BENIGN_FLAG_$$rngState;



implementation {:source_name "rngSetupStates"} {:kernel} $_Z14rngSetupStatesP17curandStateXORWOWyy($seed: bv64, $offset: bv64)
{
  var v0$1: bv32;
  var v0$2: bv32;


  $0:
    call {:sourceloc_num 1} v0$1, v0$2 := $_Z19__bugle_random_uintv();
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z19__bugle_random_uintv"} true;
    call {:sourceloc} {:sourceloc_num 2} _LOG_WRITE_$$rngState(true, BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, group_size_x)), v0$1, $$rngState[BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, group_size_x))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$rngState(true, BV32_ADD(local_id_x$2, BV32_MUL(group_id_x$2, group_size_x)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 2} _CHECK_WRITE_$$rngState(true, BV32_ADD(local_id_x$2, BV32_MUL(group_id_x$2, group_size_x)), v0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$rngState"} true;
    $$rngState[BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, group_size_x))] := v0$1;
    $$rngState[BV32_ADD(local_id_x$2, BV32_MUL(group_id_x$2, group_size_x))] := v0$2;
    return;
}



procedure {:source_name "_Z19__bugle_random_uintv"} $_Z19__bugle_random_uintv() returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$rngState: bv32;

procedure {:inline 1} _LOG_READ_$$rngState(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$rngState;



implementation {:inline 1} _LOG_READ_$$rngState(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$rngState := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngState == _value then true else _READ_HAS_OCCURRED_$$rngState);
    return;
}



procedure _CHECK_READ_$$rngState(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "rngState"} {:array "$$rngState"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$rngState && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$rngState);
  requires {:source_name "rngState"} {:array "$$rngState"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$rngState && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$rngState: bool;

procedure {:inline 1} _LOG_WRITE_$$rngState(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$rngState, _WRITE_READ_BENIGN_FLAG_$$rngState;



implementation {:inline 1} _LOG_WRITE_$$rngState(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$rngState := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngState == _value then true else _WRITE_HAS_OCCURRED_$$rngState);
    _WRITE_READ_BENIGN_FLAG_$$rngState := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngState == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$rngState);
    return;
}



procedure _CHECK_WRITE_$$rngState(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "rngState"} {:array "$$rngState"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$rngState && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngState != _value);
  requires {:source_name "rngState"} {:array "$$rngState"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$rngState && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngState != _value);
  requires {:source_name "rngState"} {:array "$$rngState"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$rngState && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$rngState(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$rngState;



implementation {:inline 1} _LOG_ATOMIC_$$rngState(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$rngState := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$rngState);
    return;
}



procedure _CHECK_ATOMIC_$$rngState(_P: bool, _offset: bv32);
  requires {:source_name "rngState"} {:array "$$rngState"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$rngState && _WATCHED_OFFSET == _offset);
  requires {:source_name "rngState"} {:array "$$rngState"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$rngState && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$rngState(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$rngState;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$rngState(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$rngState := (if _P && _WRITE_HAS_OCCURRED_$$rngState && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$rngState);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
