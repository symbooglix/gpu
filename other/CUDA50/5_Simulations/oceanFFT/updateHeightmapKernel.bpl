type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "heightMap"} {:global} $$heightMap: [bv32]bv32;

axiom {:array_info "$$heightMap"} {:global} {:elem_width 32} {:source_name "heightMap"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$heightMap: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$heightMap: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$heightMap: bool;

axiom {:array_info "$$ht"} {:global} {:elem_width 32} {:source_name "ht"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$ht: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$ht: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$ht: bool;

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

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "updateHeightmapKernel"} {:kernel} $_Z21updateHeightmapKernelPfP6float2j($width: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 256bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$heightMap && !_WRITE_HAS_OCCURRED_$$heightMap && !_ATOMIC_HAS_OCCURRED_$$heightMap;
  requires !_READ_HAS_OCCURRED_$$ht && !_WRITE_HAS_OCCURRED_$$ht && !_ATOMIC_HAS_OCCURRED_$$ht;
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
  modifies _WRITE_HAS_OCCURRED_$$heightMap, _WRITE_READ_BENIGN_FLAG_$$heightMap, _WRITE_READ_BENIGN_FLAG_$$heightMap;



implementation {:source_name "updateHeightmapKernel"} {:kernel} $_Z21updateHeightmapKernelPfP6float2j($width: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2);
    v2$1 := BV32_ADD(BV32_MUL(v1$1, $width), v0$1);
    v2$2 := BV32_ADD(BV32_MUL(v1$2, $width), v0$2);
    havoc v3$1, v3$2;
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$heightMap(true, v2$1, FMUL32(v3$1, (if BV32_AND(BV32_ADD(v0$1, v1$1), 1bv32) != 0bv32 then 3212836864bv32 else 1065353216bv32)), $$heightMap[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$heightMap(true, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$heightMap(true, v2$2, FMUL32(v3$2, (if BV32_AND(BV32_ADD(v0$2, v1$2), 1bv32) != 0bv32 then 3212836864bv32 else 1065353216bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$heightMap"} true;
    $$heightMap[v2$1] := FMUL32(v3$1, (if BV32_AND(BV32_ADD(v0$1, v1$1), 1bv32) != 0bv32 then 3212836864bv32 else 1065353216bv32));
    $$heightMap[v2$2] := FMUL32(v3$2, (if BV32_AND(BV32_ADD(v0$2, v1$2), 1bv32) != 0bv32 then 3212836864bv32 else 1065353216bv32));
    return;
}



axiom (if group_size_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$heightMap: bv32;

procedure {:inline 1} _LOG_READ_$$heightMap(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$heightMap;



implementation {:inline 1} _LOG_READ_$$heightMap(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$heightMap := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$heightMap == _value then true else _READ_HAS_OCCURRED_$$heightMap);
    return;
}



procedure _CHECK_READ_$$heightMap(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "heightMap"} {:array "$$heightMap"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$heightMap && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$heightMap);
  requires {:source_name "heightMap"} {:array "$$heightMap"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$heightMap && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$heightMap: bool;

procedure {:inline 1} _LOG_WRITE_$$heightMap(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$heightMap, _WRITE_READ_BENIGN_FLAG_$$heightMap;



implementation {:inline 1} _LOG_WRITE_$$heightMap(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$heightMap := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$heightMap == _value then true else _WRITE_HAS_OCCURRED_$$heightMap);
    _WRITE_READ_BENIGN_FLAG_$$heightMap := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$heightMap == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$heightMap);
    return;
}



procedure _CHECK_WRITE_$$heightMap(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "heightMap"} {:array "$$heightMap"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$heightMap && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$heightMap != _value);
  requires {:source_name "heightMap"} {:array "$$heightMap"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$heightMap && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$heightMap != _value);
  requires {:source_name "heightMap"} {:array "$$heightMap"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$heightMap && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$heightMap(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$heightMap;



implementation {:inline 1} _LOG_ATOMIC_$$heightMap(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$heightMap := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$heightMap);
    return;
}



procedure _CHECK_ATOMIC_$$heightMap(_P: bool, _offset: bv32);
  requires {:source_name "heightMap"} {:array "$$heightMap"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$heightMap && _WATCHED_OFFSET == _offset);
  requires {:source_name "heightMap"} {:array "$$heightMap"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$heightMap && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$heightMap(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$heightMap;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$heightMap(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$heightMap := (if _P && _WRITE_HAS_OCCURRED_$$heightMap && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$heightMap);
    return;
}



const _WATCHED_VALUE_$$ht: bv32;

procedure {:inline 1} _LOG_READ_$$ht(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$ht;



implementation {:inline 1} _LOG_READ_$$ht(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$ht := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ht == _value then true else _READ_HAS_OCCURRED_$$ht);
    return;
}



procedure _CHECK_READ_$$ht(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "ht"} {:array "$$ht"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$ht);
  requires {:source_name "ht"} {:array "$$ht"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$ht: bool;

procedure {:inline 1} _LOG_WRITE_$$ht(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$ht, _WRITE_READ_BENIGN_FLAG_$$ht;



implementation {:inline 1} _LOG_WRITE_$$ht(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$ht := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ht == _value then true else _WRITE_HAS_OCCURRED_$$ht);
    _WRITE_READ_BENIGN_FLAG_$$ht := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ht == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$ht);
    return;
}



procedure _CHECK_WRITE_$$ht(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "ht"} {:array "$$ht"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ht != _value);
  requires {:source_name "ht"} {:array "$$ht"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ht != _value);
  requires {:source_name "ht"} {:array "$$ht"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$ht(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$ht;



implementation {:inline 1} _LOG_ATOMIC_$$ht(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$ht := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$ht);
    return;
}



procedure _CHECK_ATOMIC_$$ht(_P: bool, _offset: bv32);
  requires {:source_name "ht"} {:array "$$ht"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset);
  requires {:source_name "ht"} {:array "$$ht"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$ht(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$ht;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$ht(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$ht := (if _P && _WRITE_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$ht);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
