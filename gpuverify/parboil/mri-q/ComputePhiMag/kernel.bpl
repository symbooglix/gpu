type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$phiR"} {:global} {:elem_width 32} {:source_name "phiR"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$phiR: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$phiR: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$phiR: bool;

axiom {:array_info "$$phiI"} {:global} {:elem_width 32} {:source_name "phiI"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$phiI: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$phiI: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$phiI: bool;

var {:source_name "phiMag"} {:global} $$phiMag: [bv32]bv32;

axiom {:array_info "$$phiMag"} {:global} {:elem_width 32} {:source_name "phiMag"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$phiMag: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$phiMag: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$phiMag: bool;

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

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "ComputePhiMag_GPU"} {:kernel} $ComputePhiMag_GPU($numK: bv32);
  requires !_READ_HAS_OCCURRED_$$phiR && !_WRITE_HAS_OCCURRED_$$phiR && !_ATOMIC_HAS_OCCURRED_$$phiR;
  requires !_READ_HAS_OCCURRED_$$phiI && !_WRITE_HAS_OCCURRED_$$phiI && !_ATOMIC_HAS_OCCURRED_$$phiI;
  requires !_READ_HAS_OCCURRED_$$phiMag && !_WRITE_HAS_OCCURRED_$$phiMag && !_ATOMIC_HAS_OCCURRED_$$phiMag;
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
  modifies _WRITE_HAS_OCCURRED_$$phiMag, _WRITE_READ_BENIGN_FLAG_$$phiMag, _WRITE_READ_BENIGN_FLAG_$$phiMag;



implementation {:source_name "ComputePhiMag_GPU"} {:kernel} $ComputePhiMag_GPU($numK: bv32)
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
    v1$1 := BV32_SLT(v0$1, $numK);
    v1$2 := BV32_SLT(v0$2, $numK);
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
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$phiMag(p0$1, v0$1, FADD32(FMUL32(v2$1, v2$1), FMUL32(v3$1, v3$1)), $$phiMag[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$phiMag(p0$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$phiMag(p0$2, v0$2, FADD32(FMUL32(v2$2, v2$2), FMUL32(v3$2, v3$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$phiMag"} true;
    $$phiMag[v0$1] := (if p0$1 then FADD32(FMUL32(v2$1, v2$1), FMUL32(v3$1, v3$1)) else $$phiMag[v0$1]);
    $$phiMag[v0$2] := (if p0$2 then FADD32(FMUL32(v2$2, v2$2), FMUL32(v3$2, v3$2)) else $$phiMag[v0$2]);
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 12bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$phiR: bv32;

procedure {:inline 1} _LOG_READ_$$phiR(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$phiR;



implementation {:inline 1} _LOG_READ_$$phiR(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$phiR := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiR == _value then true else _READ_HAS_OCCURRED_$$phiR);
    return;
}



procedure _CHECK_READ_$$phiR(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "phiR"} {:array "$$phiR"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$phiR && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$phiR);
  requires {:source_name "phiR"} {:array "$$phiR"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$phiR && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$phiR: bool;

procedure {:inline 1} _LOG_WRITE_$$phiR(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$phiR, _WRITE_READ_BENIGN_FLAG_$$phiR;



implementation {:inline 1} _LOG_WRITE_$$phiR(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$phiR := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiR == _value then true else _WRITE_HAS_OCCURRED_$$phiR);
    _WRITE_READ_BENIGN_FLAG_$$phiR := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiR == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$phiR);
    return;
}



procedure _CHECK_WRITE_$$phiR(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "phiR"} {:array "$$phiR"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$phiR && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiR != _value);
  requires {:source_name "phiR"} {:array "$$phiR"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$phiR && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiR != _value);
  requires {:source_name "phiR"} {:array "$$phiR"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$phiR && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$phiR(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$phiR;



implementation {:inline 1} _LOG_ATOMIC_$$phiR(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$phiR := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$phiR);
    return;
}



procedure _CHECK_ATOMIC_$$phiR(_P: bool, _offset: bv32);
  requires {:source_name "phiR"} {:array "$$phiR"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$phiR && _WATCHED_OFFSET == _offset);
  requires {:source_name "phiR"} {:array "$$phiR"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$phiR && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$phiR(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$phiR;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$phiR(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$phiR := (if _P && _WRITE_HAS_OCCURRED_$$phiR && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$phiR);
    return;
}



const _WATCHED_VALUE_$$phiI: bv32;

procedure {:inline 1} _LOG_READ_$$phiI(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$phiI;



implementation {:inline 1} _LOG_READ_$$phiI(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$phiI := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiI == _value then true else _READ_HAS_OCCURRED_$$phiI);
    return;
}



procedure _CHECK_READ_$$phiI(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "phiI"} {:array "$$phiI"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$phiI && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$phiI);
  requires {:source_name "phiI"} {:array "$$phiI"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$phiI && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$phiI: bool;

procedure {:inline 1} _LOG_WRITE_$$phiI(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$phiI, _WRITE_READ_BENIGN_FLAG_$$phiI;



implementation {:inline 1} _LOG_WRITE_$$phiI(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$phiI := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiI == _value then true else _WRITE_HAS_OCCURRED_$$phiI);
    _WRITE_READ_BENIGN_FLAG_$$phiI := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiI == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$phiI);
    return;
}



procedure _CHECK_WRITE_$$phiI(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "phiI"} {:array "$$phiI"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$phiI && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiI != _value);
  requires {:source_name "phiI"} {:array "$$phiI"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$phiI && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiI != _value);
  requires {:source_name "phiI"} {:array "$$phiI"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$phiI && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$phiI(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$phiI;



implementation {:inline 1} _LOG_ATOMIC_$$phiI(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$phiI := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$phiI);
    return;
}



procedure _CHECK_ATOMIC_$$phiI(_P: bool, _offset: bv32);
  requires {:source_name "phiI"} {:array "$$phiI"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$phiI && _WATCHED_OFFSET == _offset);
  requires {:source_name "phiI"} {:array "$$phiI"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$phiI && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$phiI(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$phiI;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$phiI(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$phiI := (if _P && _WRITE_HAS_OCCURRED_$$phiI && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$phiI);
    return;
}



const _WATCHED_VALUE_$$phiMag: bv32;

procedure {:inline 1} _LOG_READ_$$phiMag(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$phiMag;



implementation {:inline 1} _LOG_READ_$$phiMag(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$phiMag := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiMag == _value then true else _READ_HAS_OCCURRED_$$phiMag);
    return;
}



procedure _CHECK_READ_$$phiMag(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "phiMag"} {:array "$$phiMag"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$phiMag && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$phiMag);
  requires {:source_name "phiMag"} {:array "$$phiMag"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$phiMag && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$phiMag: bool;

procedure {:inline 1} _LOG_WRITE_$$phiMag(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$phiMag, _WRITE_READ_BENIGN_FLAG_$$phiMag;



implementation {:inline 1} _LOG_WRITE_$$phiMag(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$phiMag := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiMag == _value then true else _WRITE_HAS_OCCURRED_$$phiMag);
    _WRITE_READ_BENIGN_FLAG_$$phiMag := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiMag == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$phiMag);
    return;
}



procedure _CHECK_WRITE_$$phiMag(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "phiMag"} {:array "$$phiMag"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$phiMag && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiMag != _value);
  requires {:source_name "phiMag"} {:array "$$phiMag"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$phiMag && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$phiMag != _value);
  requires {:source_name "phiMag"} {:array "$$phiMag"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$phiMag && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$phiMag(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$phiMag;



implementation {:inline 1} _LOG_ATOMIC_$$phiMag(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$phiMag := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$phiMag);
    return;
}



procedure _CHECK_ATOMIC_$$phiMag(_P: bool, _offset: bv32);
  requires {:source_name "phiMag"} {:array "$$phiMag"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$phiMag && _WATCHED_OFFSET == _offset);
  requires {:source_name "phiMag"} {:array "$$phiMag"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$phiMag && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$phiMag(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$phiMag;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$phiMag(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$phiMag := (if _P && _WRITE_HAS_OCCURRED_$$phiMag && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$phiMag);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
