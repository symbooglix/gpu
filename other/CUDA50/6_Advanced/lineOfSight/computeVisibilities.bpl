type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



axiom {:array_info "$$angles"} {:global} {:elem_width 32} {:source_name "angles"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$angles: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$angles: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$angles: bool;

axiom {:array_info "$$scannedAngles"} {:global} {:elem_width 32} {:source_name "scannedAngles"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$scannedAngles: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$scannedAngles: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$scannedAngles: bool;

var {:source_name "visibilities"} {:global} $$visibilities: [bv32]bv8;

axiom {:array_info "$$visibilities"} {:global} {:elem_width 8} {:source_name "visibilities"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$visibilities: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$visibilities: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$visibilities: bool;

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

function FEQ32(bv32, bv32) : bool;

function FLT32(bv32, bv32) : bool;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 7"} BV1_ZEXT8(bv1) : bv8;

procedure {:source_name "computeVisibilities_kernel"} {:kernel} $_Z26computeVisibilities_kernelPKfS0_iPh($numAngles: bv32);
  requires !_READ_HAS_OCCURRED_$$angles && !_WRITE_HAS_OCCURRED_$$angles && !_ATOMIC_HAS_OCCURRED_$$angles;
  requires !_READ_HAS_OCCURRED_$$scannedAngles && !_WRITE_HAS_OCCURRED_$$scannedAngles && !_ATOMIC_HAS_OCCURRED_$$scannedAngles;
  requires !_READ_HAS_OCCURRED_$$visibilities && !_WRITE_HAS_OCCURRED_$$visibilities && !_ATOMIC_HAS_OCCURRED_$$visibilities;
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
  modifies _WRITE_HAS_OCCURRED_$$visibilities, _WRITE_READ_BENIGN_FLAG_$$visibilities, _WRITE_READ_BENIGN_FLAG_$$visibilities;



implementation {:source_name "computeVisibilities_kernel"} {:kernel} $_Z26computeVisibilities_kernelPKfS0_iPh($numAngles: bv32)
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
    v1$1 := BV32_ULT(v0$1, $numAngles);
    v1$2 := BV32_ULT(v0$2, $numAngles);
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
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$visibilities(p0$1, v0$1, BV1_ZEXT8((if FEQ32(v2$1, v3$1) || FLT32(v2$1, v3$1) then 1bv1 else 0bv1)), $$visibilities[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$visibilities(p0$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$visibilities(p0$2, v0$2, BV1_ZEXT8((if FEQ32(v2$2, v3$2) || FLT32(v2$2, v3$2) then 1bv1 else 0bv1)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$visibilities"} true;
    $$visibilities[v0$1] := (if p0$1 then BV1_ZEXT8((if FEQ32(v2$1, v3$1) || FLT32(v2$1, v3$1) then 1bv1 else 0bv1)) else $$visibilities[v0$1]);
    $$visibilities[v0$2] := (if p0$2 then BV1_ZEXT8((if FEQ32(v2$2, v3$2) || FLT32(v2$2, v3$2) then 1bv1 else 0bv1)) else $$visibilities[v0$2]);
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 40bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$angles: bv32;

procedure {:inline 1} _LOG_READ_$$angles(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$angles;



implementation {:inline 1} _LOG_READ_$$angles(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$angles := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$angles == _value then true else _READ_HAS_OCCURRED_$$angles);
    return;
}



procedure _CHECK_READ_$$angles(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "angles"} {:array "$$angles"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$angles && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$angles);
  requires {:source_name "angles"} {:array "$$angles"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$angles && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$angles: bool;

procedure {:inline 1} _LOG_WRITE_$$angles(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$angles, _WRITE_READ_BENIGN_FLAG_$$angles;



implementation {:inline 1} _LOG_WRITE_$$angles(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$angles := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$angles == _value then true else _WRITE_HAS_OCCURRED_$$angles);
    _WRITE_READ_BENIGN_FLAG_$$angles := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$angles == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$angles);
    return;
}



procedure _CHECK_WRITE_$$angles(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "angles"} {:array "$$angles"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$angles && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$angles != _value);
  requires {:source_name "angles"} {:array "$$angles"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$angles && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$angles != _value);
  requires {:source_name "angles"} {:array "$$angles"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$angles && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$angles(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$angles;



implementation {:inline 1} _LOG_ATOMIC_$$angles(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$angles := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$angles);
    return;
}



procedure _CHECK_ATOMIC_$$angles(_P: bool, _offset: bv32);
  requires {:source_name "angles"} {:array "$$angles"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$angles && _WATCHED_OFFSET == _offset);
  requires {:source_name "angles"} {:array "$$angles"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$angles && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$angles(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$angles;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$angles(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$angles := (if _P && _WRITE_HAS_OCCURRED_$$angles && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$angles);
    return;
}



const _WATCHED_VALUE_$$scannedAngles: bv32;

procedure {:inline 1} _LOG_READ_$$scannedAngles(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$scannedAngles;



implementation {:inline 1} _LOG_READ_$$scannedAngles(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$scannedAngles := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scannedAngles == _value then true else _READ_HAS_OCCURRED_$$scannedAngles);
    return;
}



procedure _CHECK_READ_$$scannedAngles(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "scannedAngles"} {:array "$$scannedAngles"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$scannedAngles && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$scannedAngles);
  requires {:source_name "scannedAngles"} {:array "$$scannedAngles"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$scannedAngles && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$scannedAngles: bool;

procedure {:inline 1} _LOG_WRITE_$$scannedAngles(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$scannedAngles, _WRITE_READ_BENIGN_FLAG_$$scannedAngles;



implementation {:inline 1} _LOG_WRITE_$$scannedAngles(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$scannedAngles := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scannedAngles == _value then true else _WRITE_HAS_OCCURRED_$$scannedAngles);
    _WRITE_READ_BENIGN_FLAG_$$scannedAngles := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scannedAngles == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$scannedAngles);
    return;
}



procedure _CHECK_WRITE_$$scannedAngles(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "scannedAngles"} {:array "$$scannedAngles"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$scannedAngles && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scannedAngles != _value);
  requires {:source_name "scannedAngles"} {:array "$$scannedAngles"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$scannedAngles && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scannedAngles != _value);
  requires {:source_name "scannedAngles"} {:array "$$scannedAngles"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$scannedAngles && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$scannedAngles(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$scannedAngles;



implementation {:inline 1} _LOG_ATOMIC_$$scannedAngles(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$scannedAngles := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$scannedAngles);
    return;
}



procedure _CHECK_ATOMIC_$$scannedAngles(_P: bool, _offset: bv32);
  requires {:source_name "scannedAngles"} {:array "$$scannedAngles"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$scannedAngles && _WATCHED_OFFSET == _offset);
  requires {:source_name "scannedAngles"} {:array "$$scannedAngles"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$scannedAngles && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$scannedAngles(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$scannedAngles;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$scannedAngles(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$scannedAngles := (if _P && _WRITE_HAS_OCCURRED_$$scannedAngles && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$scannedAngles);
    return;
}



const _WATCHED_VALUE_$$visibilities: bv8;

procedure {:inline 1} _LOG_READ_$$visibilities(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$visibilities;



implementation {:inline 1} _LOG_READ_$$visibilities(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$visibilities := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$visibilities == _value then true else _READ_HAS_OCCURRED_$$visibilities);
    return;
}



procedure _CHECK_READ_$$visibilities(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "visibilities"} {:array "$$visibilities"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$visibilities && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$visibilities);
  requires {:source_name "visibilities"} {:array "$$visibilities"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$visibilities && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$visibilities: bool;

procedure {:inline 1} _LOG_WRITE_$$visibilities(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$visibilities, _WRITE_READ_BENIGN_FLAG_$$visibilities;



implementation {:inline 1} _LOG_WRITE_$$visibilities(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$visibilities := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$visibilities == _value then true else _WRITE_HAS_OCCURRED_$$visibilities);
    _WRITE_READ_BENIGN_FLAG_$$visibilities := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$visibilities == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$visibilities);
    return;
}



procedure _CHECK_WRITE_$$visibilities(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "visibilities"} {:array "$$visibilities"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$visibilities && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$visibilities != _value);
  requires {:source_name "visibilities"} {:array "$$visibilities"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$visibilities && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$visibilities != _value);
  requires {:source_name "visibilities"} {:array "$$visibilities"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$visibilities && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$visibilities(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$visibilities;



implementation {:inline 1} _LOG_ATOMIC_$$visibilities(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$visibilities := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$visibilities);
    return;
}



procedure _CHECK_ATOMIC_$$visibilities(_P: bool, _offset: bv32);
  requires {:source_name "visibilities"} {:array "$$visibilities"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$visibilities && _WATCHED_OFFSET == _offset);
  requires {:source_name "visibilities"} {:array "$$visibilities"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$visibilities && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$visibilities(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$visibilities;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$visibilities(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$visibilities := (if _P && _WRITE_HAS_OCCURRED_$$visibilities && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$visibilities);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
