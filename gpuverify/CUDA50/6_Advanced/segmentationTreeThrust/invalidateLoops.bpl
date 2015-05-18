type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "startpoints"} {:global} $$startpoints: [bv32]bv32;

axiom {:array_info "$$startpoints"} {:global} {:elem_width 32} {:source_name "startpoints"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$startpoints: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$startpoints: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$startpoints: bool;

var {:source_name "verticesMapping"} {:global} $$verticesMapping: [bv32]bv32;

axiom {:array_info "$$verticesMapping"} {:global} {:elem_width 32} {:source_name "verticesMapping"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$verticesMapping: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$verticesMapping: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$verticesMapping: bool;

var {:source_name "edges"} {:global} $$edges: [bv32]bv32;

axiom {:array_info "$$edges"} {:global} {:elem_width 32} {:source_name "edges"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$edges: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$edges: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$edges: bool;

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

procedure {:source_name "invalidateLoops"} {:kernel} $_Z15invalidateLoopsPKjS0_Pjj($edgesCount: bv32);
  requires !_READ_HAS_OCCURRED_$$startpoints && !_WRITE_HAS_OCCURRED_$$startpoints && !_ATOMIC_HAS_OCCURRED_$$startpoints;
  requires !_READ_HAS_OCCURRED_$$verticesMapping && !_WRITE_HAS_OCCURRED_$$verticesMapping && !_ATOMIC_HAS_OCCURRED_$$verticesMapping;
  requires !_READ_HAS_OCCURRED_$$edges && !_WRITE_HAS_OCCURRED_$$edges && !_ATOMIC_HAS_OCCURRED_$$edges;
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
  modifies _READ_HAS_OCCURRED_$$edges, _WRITE_HAS_OCCURRED_$$edges, _WRITE_READ_BENIGN_FLAG_$$edges, _WRITE_READ_BENIGN_FLAG_$$edges;



implementation {:source_name "invalidateLoops"} {:kernel} $_Z15invalidateLoopsPKjS0_Pjj($edgesCount: bv32)
{
  var v2$1: bv32;
  var v2$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v6$1: bool;
  var v6$2: bool;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_ULT(v0$1, $edgesCount);
    v1$2 := BV32_ULT(v0$2, $edgesCount);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    v2$1 := (if p0$1 then $$startpoints[v0$1] else v2$1);
    v2$2 := (if p0$2 then $$startpoints[v0$2] else v2$2);
    v3$1 := (if p0$1 then $$verticesMapping[v2$1] else v3$1);
    v3$2 := (if p0$2 then $$verticesMapping[v2$2] else v3$2);
    call {:sourceloc} {:sourceloc_num 4} _LOG_READ_$$edges(p0$1, v0$1, $$edges[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 4} _CHECK_READ_$$edges(p0$2, v0$2, $$edges[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$edges"} true;
    v4$1 := (if p0$1 then $$edges[v0$1] else v4$1);
    v4$2 := (if p0$2 then $$edges[v0$2] else v4$2);
    v5$1 := (if p0$1 then $$verticesMapping[v4$1] else v5$1);
    v5$2 := (if p0$2 then $$verticesMapping[v4$2] else v5$2);
    v6$1 := (if p0$1 then v3$1 == v5$1 else v6$1);
    v6$2 := (if p0$2 then v3$2 == v5$2 else v6$2);
    p1$1 := (if p0$1 && v6$1 then v6$1 else p1$1);
    p1$2 := (if p0$2 && v6$2 then v6$2 else p1$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$edges(p1$1, v0$1, 4294967295bv32, $$edges[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$edges(p1$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$edges(p1$2, v0$2, 4294967295bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$edges"} true;
    $$edges[v0$1] := (if p1$1 then 4294967295bv32 else $$edges[v0$1]);
    $$edges[v0$2] := (if p1$2 then 4294967295bv32 else $$edges[v0$2]);
    return;
}



axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 11377bv32 then 1bv1 else 0bv1) != 0bv1;

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

const _WATCHED_VALUE_$$startpoints: bv32;

procedure {:inline 1} _LOG_READ_$$startpoints(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$startpoints;



implementation {:inline 1} _LOG_READ_$$startpoints(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$startpoints := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$startpoints == _value then true else _READ_HAS_OCCURRED_$$startpoints);
    return;
}



procedure _CHECK_READ_$$startpoints(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "startpoints"} {:array "$$startpoints"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$startpoints && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$startpoints);
  requires {:source_name "startpoints"} {:array "$$startpoints"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$startpoints && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$startpoints: bool;

procedure {:inline 1} _LOG_WRITE_$$startpoints(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$startpoints, _WRITE_READ_BENIGN_FLAG_$$startpoints;



implementation {:inline 1} _LOG_WRITE_$$startpoints(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$startpoints := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$startpoints == _value then true else _WRITE_HAS_OCCURRED_$$startpoints);
    _WRITE_READ_BENIGN_FLAG_$$startpoints := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$startpoints == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$startpoints);
    return;
}



procedure _CHECK_WRITE_$$startpoints(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "startpoints"} {:array "$$startpoints"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$startpoints && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$startpoints != _value);
  requires {:source_name "startpoints"} {:array "$$startpoints"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$startpoints && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$startpoints != _value);
  requires {:source_name "startpoints"} {:array "$$startpoints"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$startpoints && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$startpoints(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$startpoints;



implementation {:inline 1} _LOG_ATOMIC_$$startpoints(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$startpoints := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$startpoints);
    return;
}



procedure _CHECK_ATOMIC_$$startpoints(_P: bool, _offset: bv32);
  requires {:source_name "startpoints"} {:array "$$startpoints"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$startpoints && _WATCHED_OFFSET == _offset);
  requires {:source_name "startpoints"} {:array "$$startpoints"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$startpoints && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$startpoints(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$startpoints;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$startpoints(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$startpoints := (if _P && _WRITE_HAS_OCCURRED_$$startpoints && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$startpoints);
    return;
}



const _WATCHED_VALUE_$$verticesMapping: bv32;

procedure {:inline 1} _LOG_READ_$$verticesMapping(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$verticesMapping;



implementation {:inline 1} _LOG_READ_$$verticesMapping(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$verticesMapping := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$verticesMapping == _value then true else _READ_HAS_OCCURRED_$$verticesMapping);
    return;
}



procedure _CHECK_READ_$$verticesMapping(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "verticesMapping"} {:array "$$verticesMapping"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$verticesMapping && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$verticesMapping);
  requires {:source_name "verticesMapping"} {:array "$$verticesMapping"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$verticesMapping && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$verticesMapping: bool;

procedure {:inline 1} _LOG_WRITE_$$verticesMapping(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$verticesMapping, _WRITE_READ_BENIGN_FLAG_$$verticesMapping;



implementation {:inline 1} _LOG_WRITE_$$verticesMapping(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$verticesMapping := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$verticesMapping == _value then true else _WRITE_HAS_OCCURRED_$$verticesMapping);
    _WRITE_READ_BENIGN_FLAG_$$verticesMapping := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$verticesMapping == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$verticesMapping);
    return;
}



procedure _CHECK_WRITE_$$verticesMapping(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "verticesMapping"} {:array "$$verticesMapping"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$verticesMapping && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$verticesMapping != _value);
  requires {:source_name "verticesMapping"} {:array "$$verticesMapping"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$verticesMapping && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$verticesMapping != _value);
  requires {:source_name "verticesMapping"} {:array "$$verticesMapping"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$verticesMapping && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$verticesMapping(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$verticesMapping;



implementation {:inline 1} _LOG_ATOMIC_$$verticesMapping(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$verticesMapping := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$verticesMapping);
    return;
}



procedure _CHECK_ATOMIC_$$verticesMapping(_P: bool, _offset: bv32);
  requires {:source_name "verticesMapping"} {:array "$$verticesMapping"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$verticesMapping && _WATCHED_OFFSET == _offset);
  requires {:source_name "verticesMapping"} {:array "$$verticesMapping"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$verticesMapping && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$verticesMapping(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$verticesMapping;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$verticesMapping(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$verticesMapping := (if _P && _WRITE_HAS_OCCURRED_$$verticesMapping && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$verticesMapping);
    return;
}



const _WATCHED_VALUE_$$edges: bv32;

procedure {:inline 1} _LOG_READ_$$edges(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$edges;



implementation {:inline 1} _LOG_READ_$$edges(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$edges := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$edges == _value then true else _READ_HAS_OCCURRED_$$edges);
    return;
}



procedure _CHECK_READ_$$edges(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "edges"} {:array "$$edges"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$edges && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$edges);
  requires {:source_name "edges"} {:array "$$edges"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$edges && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$edges: bool;

procedure {:inline 1} _LOG_WRITE_$$edges(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$edges, _WRITE_READ_BENIGN_FLAG_$$edges;



implementation {:inline 1} _LOG_WRITE_$$edges(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$edges := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$edges == _value then true else _WRITE_HAS_OCCURRED_$$edges);
    _WRITE_READ_BENIGN_FLAG_$$edges := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$edges == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$edges);
    return;
}



procedure _CHECK_WRITE_$$edges(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "edges"} {:array "$$edges"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$edges && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$edges != _value);
  requires {:source_name "edges"} {:array "$$edges"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$edges && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$edges != _value);
  requires {:source_name "edges"} {:array "$$edges"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$edges && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$edges(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$edges;



implementation {:inline 1} _LOG_ATOMIC_$$edges(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$edges := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$edges);
    return;
}



procedure _CHECK_ATOMIC_$$edges(_P: bool, _offset: bv32);
  requires {:source_name "edges"} {:array "$$edges"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$edges && _WATCHED_OFFSET == _offset);
  requires {:source_name "edges"} {:array "$$edges"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$edges && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$edges(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$edges;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$edges(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$edges := (if _P && _WRITE_HAS_OCCURRED_$$edges && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$edges);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
