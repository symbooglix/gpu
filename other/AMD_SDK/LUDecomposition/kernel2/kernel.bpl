type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



axiom {:array_info "$$LMatrix"} {:global} {:elem_width 64} {:source_name "LMatrix"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$LMatrix: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$LMatrix: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$LMatrix: bool;

var {:source_name "inplaceMatrix"} {:global} $$inplaceMatrix: [bv32]bv64;

axiom {:array_info "$$inplaceMatrix"} {:global} {:elem_width 64} {:source_name "inplaceMatrix"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$inplaceMatrix: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$inplaceMatrix: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$inplaceMatrix: bool;

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

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

procedure {:source_name "kernelLUCombine"} {:kernel} $kernelLUCombine();
  requires !_READ_HAS_OCCURRED_$$LMatrix && !_WRITE_HAS_OCCURRED_$$LMatrix && !_ATOMIC_HAS_OCCURRED_$$LMatrix;
  requires !_READ_HAS_OCCURRED_$$inplaceMatrix && !_WRITE_HAS_OCCURRED_$$inplaceMatrix && !_ATOMIC_HAS_OCCURRED_$$inplaceMatrix;
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
  modifies _WRITE_HAS_OCCURRED_$$inplaceMatrix, _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix, _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix;



implementation {:source_name "kernelLUCombine"} {:kernel} $kernelLUCombine()
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v4$1: bv64;
  var v4$2: bv64;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var _HAVOC_bv64$1: bv64;
  var _HAVOC_bv64$2: bv64;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v2$1 := BV32_SGT(v0$1, v1$1);
    v2$2 := BV32_SGT(v0$2, v1$2);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v2$1 then v2$1 else p0$1);
    p0$2 := (if v2$2 then v2$2 else p0$2);
    v3$1 := (if p0$1 then BV32_MUL(group_size_x, num_groups_x) else v3$1);
    v3$2 := (if p0$2 then BV32_MUL(group_size_x, num_groups_x) else v3$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v4$1 := (if p0$1 then _HAVOC_bv64$1 else v4$1);
    v4$2 := (if p0$2 then _HAVOC_bv64$2 else v4$2);
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$inplaceMatrix(p0$1, BV32_ADD(BV32_MUL(v0$1, v3$1), v1$1), v4$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v0$1, v3$1), v1$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p0$2, BV32_ADD(BV32_MUL(v0$2, v3$2), v1$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$inplaceMatrix(p0$2, BV32_ADD(BV32_MUL(v0$2, v3$2), v1$2), v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v0$1, v3$1), v1$1)] := (if p0$1 then v4$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v0$1, v3$1), v1$1)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v0$2, v3$2), v1$2)] := (if p0$2 then v4$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v0$2, v3$2), v1$2)]);
    return;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 4bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$LMatrix: bv64;

procedure {:inline 1} _LOG_READ_$$LMatrix(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$LMatrix;



implementation {:inline 1} _LOG_READ_$$LMatrix(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$LMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LMatrix == _value then true else _READ_HAS_OCCURRED_$$LMatrix);
    return;
}



procedure _CHECK_READ_$$LMatrix(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "LMatrix"} {:array "$$LMatrix"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$LMatrix);
  requires {:source_name "LMatrix"} {:array "$$LMatrix"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$LMatrix: bool;

procedure {:inline 1} _LOG_WRITE_$$LMatrix(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$LMatrix, _WRITE_READ_BENIGN_FLAG_$$LMatrix;



implementation {:inline 1} _LOG_WRITE_$$LMatrix(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$LMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LMatrix == _value then true else _WRITE_HAS_OCCURRED_$$LMatrix);
    _WRITE_READ_BENIGN_FLAG_$$LMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LMatrix == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$LMatrix);
    return;
}



procedure _CHECK_WRITE_$$LMatrix(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "LMatrix"} {:array "$$LMatrix"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LMatrix != _value);
  requires {:source_name "LMatrix"} {:array "$$LMatrix"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LMatrix != _value);
  requires {:source_name "LMatrix"} {:array "$$LMatrix"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$LMatrix(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$LMatrix;



implementation {:inline 1} _LOG_ATOMIC_$$LMatrix(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$LMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$LMatrix);
    return;
}



procedure _CHECK_ATOMIC_$$LMatrix(_P: bool, _offset: bv32);
  requires {:source_name "LMatrix"} {:array "$$LMatrix"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset);
  requires {:source_name "LMatrix"} {:array "$$LMatrix"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$LMatrix;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$LMatrix := (if _P && _WRITE_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$LMatrix);
    return;
}



const _WATCHED_VALUE_$$inplaceMatrix: bv64;

procedure {:inline 1} _LOG_READ_$$inplaceMatrix(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$inplaceMatrix;



implementation {:inline 1} _LOG_READ_$$inplaceMatrix(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$inplaceMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inplaceMatrix == _value then true else _READ_HAS_OCCURRED_$$inplaceMatrix);
    return;
}



procedure _CHECK_READ_$$inplaceMatrix(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "inplaceMatrix"} {:array "$$inplaceMatrix"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix);
  requires {:source_name "inplaceMatrix"} {:array "$$inplaceMatrix"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix: bool;

procedure {:inline 1} _LOG_WRITE_$$inplaceMatrix(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$inplaceMatrix, _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix;



implementation {:inline 1} _LOG_WRITE_$$inplaceMatrix(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$inplaceMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inplaceMatrix == _value then true else _WRITE_HAS_OCCURRED_$$inplaceMatrix);
    _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inplaceMatrix == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix);
    return;
}



procedure _CHECK_WRITE_$$inplaceMatrix(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "inplaceMatrix"} {:array "$$inplaceMatrix"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inplaceMatrix != _value);
  requires {:source_name "inplaceMatrix"} {:array "$$inplaceMatrix"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inplaceMatrix != _value);
  requires {:source_name "inplaceMatrix"} {:array "$$inplaceMatrix"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$inplaceMatrix(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$inplaceMatrix;



implementation {:inline 1} _LOG_ATOMIC_$$inplaceMatrix(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$inplaceMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$inplaceMatrix);
    return;
}



procedure _CHECK_ATOMIC_$$inplaceMatrix(_P: bool, _offset: bv32);
  requires {:source_name "inplaceMatrix"} {:array "$$inplaceMatrix"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset);
  requires {:source_name "inplaceMatrix"} {:array "$$inplaceMatrix"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix := (if _P && _WRITE_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
