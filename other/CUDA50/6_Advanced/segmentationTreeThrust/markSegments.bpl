type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$verticesOffsets"} {:global} {:elem_width 32} {:source_name "verticesOffsets"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$verticesOffsets: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$verticesOffsets: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$verticesOffsets: bool;

var {:source_name "flags"} {:global} $$flags: [bv32]bv32;

axiom {:array_info "$$flags"} {:global} {:elem_width 32} {:source_name "flags"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$flags: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$flags: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$flags: bool;

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

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "markSegments"} {:kernel} $_Z12markSegmentsPKjPjj($verticesCount: bv32);
  requires !_READ_HAS_OCCURRED_$$verticesOffsets && !_WRITE_HAS_OCCURRED_$$verticesOffsets && !_ATOMIC_HAS_OCCURRED_$$verticesOffsets;
  requires !_READ_HAS_OCCURRED_$$flags && !_WRITE_HAS_OCCURRED_$$flags && !_ATOMIC_HAS_OCCURRED_$$flags;
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
  modifies _WRITE_HAS_OCCURRED_$$flags, _WRITE_READ_BENIGN_FLAG_$$flags, _WRITE_READ_BENIGN_FLAG_$$flags;



implementation {:source_name "markSegments"} {:kernel} $_Z12markSegmentsPKjPjj($verticesCount: bv32)
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_ULT(v0$1, $verticesCount);
    v1$2 := BV32_ULT(v0$2, $verticesCount);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p0$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p0$2 then _HAVOC_bv32$2 else v2$2);
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$flags(p0$1, v2$1, 1bv32, $$flags[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$flags(p0$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$flags(p0$2, v2$2, 1bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$flags"} true;
    $$flags[v2$1] := (if p0$1 then 1bv32 else $$flags[v2$1]);
    $$flags[v2$2] := (if p0$2 then 1bv32 else $$flags[v2$2]);
    return;
}



axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4800bv32 then 1bv1 else 0bv1) != 0bv1;

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

const _WATCHED_VALUE_$$verticesOffsets: bv32;

procedure {:inline 1} _LOG_READ_$$verticesOffsets(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$verticesOffsets;



implementation {:inline 1} _LOG_READ_$$verticesOffsets(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$verticesOffsets := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$verticesOffsets == _value then true else _READ_HAS_OCCURRED_$$verticesOffsets);
    return;
}



procedure _CHECK_READ_$$verticesOffsets(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "verticesOffsets"} {:array "$$verticesOffsets"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$verticesOffsets && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$verticesOffsets);
  requires {:source_name "verticesOffsets"} {:array "$$verticesOffsets"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$verticesOffsets && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$verticesOffsets: bool;

procedure {:inline 1} _LOG_WRITE_$$verticesOffsets(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$verticesOffsets, _WRITE_READ_BENIGN_FLAG_$$verticesOffsets;



implementation {:inline 1} _LOG_WRITE_$$verticesOffsets(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$verticesOffsets := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$verticesOffsets == _value then true else _WRITE_HAS_OCCURRED_$$verticesOffsets);
    _WRITE_READ_BENIGN_FLAG_$$verticesOffsets := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$verticesOffsets == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$verticesOffsets);
    return;
}



procedure _CHECK_WRITE_$$verticesOffsets(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "verticesOffsets"} {:array "$$verticesOffsets"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$verticesOffsets && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$verticesOffsets != _value);
  requires {:source_name "verticesOffsets"} {:array "$$verticesOffsets"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$verticesOffsets && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$verticesOffsets != _value);
  requires {:source_name "verticesOffsets"} {:array "$$verticesOffsets"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$verticesOffsets && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$verticesOffsets(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$verticesOffsets;



implementation {:inline 1} _LOG_ATOMIC_$$verticesOffsets(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$verticesOffsets := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$verticesOffsets);
    return;
}



procedure _CHECK_ATOMIC_$$verticesOffsets(_P: bool, _offset: bv32);
  requires {:source_name "verticesOffsets"} {:array "$$verticesOffsets"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$verticesOffsets && _WATCHED_OFFSET == _offset);
  requires {:source_name "verticesOffsets"} {:array "$$verticesOffsets"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$verticesOffsets && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$verticesOffsets(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$verticesOffsets;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$verticesOffsets(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$verticesOffsets := (if _P && _WRITE_HAS_OCCURRED_$$verticesOffsets && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$verticesOffsets);
    return;
}



const _WATCHED_VALUE_$$flags: bv32;

procedure {:inline 1} _LOG_READ_$$flags(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$flags;



implementation {:inline 1} _LOG_READ_$$flags(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$flags := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$flags == _value then true else _READ_HAS_OCCURRED_$$flags);
    return;
}



procedure _CHECK_READ_$$flags(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "flags"} {:array "$$flags"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$flags && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$flags);
  requires {:source_name "flags"} {:array "$$flags"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$flags && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$flags: bool;

procedure {:inline 1} _LOG_WRITE_$$flags(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$flags, _WRITE_READ_BENIGN_FLAG_$$flags;



implementation {:inline 1} _LOG_WRITE_$$flags(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$flags := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$flags == _value then true else _WRITE_HAS_OCCURRED_$$flags);
    _WRITE_READ_BENIGN_FLAG_$$flags := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$flags == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$flags);
    return;
}



procedure _CHECK_WRITE_$$flags(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "flags"} {:array "$$flags"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$flags && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$flags != _value);
  requires {:source_name "flags"} {:array "$$flags"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$flags && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$flags != _value);
  requires {:source_name "flags"} {:array "$$flags"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$flags && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$flags(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$flags;



implementation {:inline 1} _LOG_ATOMIC_$$flags(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$flags := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$flags);
    return;
}



procedure _CHECK_ATOMIC_$$flags(_P: bool, _offset: bv32);
  requires {:source_name "flags"} {:array "$$flags"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$flags && _WATCHED_OFFSET == _offset);
  requires {:source_name "flags"} {:array "$$flags"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$flags && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$flags(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$flags;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$flags(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$flags := (if _P && _WRITE_HAS_OCCURRED_$$flags && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$flags);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
