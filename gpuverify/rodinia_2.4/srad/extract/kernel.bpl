type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_I"} {:global} $$d_I: [bv32]bv32;

axiom {:array_info "$$d_I"} {:global} {:elem_width 32} {:source_name "d_I"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_I: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_I: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_I: bool;

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

function FEXP32(bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV64_SLT(bv64, bv64) : bool;

function {:bvbuiltin "sign_extend 32"} BV32_SEXT64(bv32) : bv64;

procedure {:source_name "extract_kernel"} {:kernel} $extract_kernel($d_Ne: bv64);
  requires !_READ_HAS_OCCURRED_$$d_I && !_WRITE_HAS_OCCURRED_$$d_I && !_ATOMIC_HAS_OCCURRED_$$d_I;
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
  modifies _READ_HAS_OCCURRED_$$d_I, _WRITE_HAS_OCCURRED_$$d_I, _WRITE_READ_BENIGN_FLAG_$$d_I, _WRITE_READ_BENIGN_FLAG_$$d_I;



implementation {:source_name "extract_kernel"} {:kernel} $extract_kernel($d_Ne: bv64)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, 512bv32), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, 512bv32), local_id_x$2);
    v1$1 := BV64_SLT(BV32_SEXT64(v0$1), $d_Ne);
    v1$2 := BV64_SLT(BV32_SEXT64(v0$2), $d_Ne);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    call {:sourceloc} {:sourceloc_num 2} _LOG_READ_$$d_I(p0$1, v0$1, $$d_I[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 2} _CHECK_READ_$$d_I(p0$2, v0$2, $$d_I[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_I"} true;
    v2$1 := (if p0$1 then $$d_I[v0$1] else v2$1);
    v2$2 := (if p0$2 then $$d_I[v0$2] else v2$2);
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$d_I(p0$1, v0$1, FEXP32(FMUL32(FDIV32(v2$1, 1132396544bv32), 1069066811bv32)), $$d_I[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_I(p0$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$d_I(p0$2, v0$2, FEXP32(FMUL32(FDIV32(v2$2, 1132396544bv32), 1069066811bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_I"} true;
    $$d_I[v0$1] := (if p0$1 then FEXP32(FMUL32(FDIV32(v2$1, 1132396544bv32), 1069066811bv32)) else $$d_I[v0$1]);
    $$d_I[v0$2] := (if p0$2 then FEXP32(FMUL32(FDIV32(v2$2, 1132396544bv32), 1069066811bv32)) else $$d_I[v0$2]);
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 450bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$d_I: bv32;

procedure {:inline 1} _LOG_READ_$$d_I(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_I;



implementation {:inline 1} _LOG_READ_$$d_I(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_I := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_I == _value then true else _READ_HAS_OCCURRED_$$d_I);
    return;
}



procedure _CHECK_READ_$$d_I(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_I"} {:array "$$d_I"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_I);
  requires {:source_name "d_I"} {:array "$$d_I"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_I: bool;

procedure {:inline 1} _LOG_WRITE_$$d_I(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_I, _WRITE_READ_BENIGN_FLAG_$$d_I;



implementation {:inline 1} _LOG_WRITE_$$d_I(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_I := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_I == _value then true else _WRITE_HAS_OCCURRED_$$d_I);
    _WRITE_READ_BENIGN_FLAG_$$d_I := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_I == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_I);
    return;
}



procedure _CHECK_WRITE_$$d_I(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_I"} {:array "$$d_I"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_I != _value);
  requires {:source_name "d_I"} {:array "$$d_I"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_I != _value);
  requires {:source_name "d_I"} {:array "$$d_I"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_I(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_I;



implementation {:inline 1} _LOG_ATOMIC_$$d_I(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_I := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_I);
    return;
}



procedure _CHECK_ATOMIC_$$d_I(_P: bool, _offset: bv32);
  requires {:source_name "d_I"} {:array "$$d_I"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_I"} {:array "$$d_I"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_I(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_I;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_I(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_I := (if _P && _WRITE_HAS_OCCURRED_$$d_I && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_I);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
