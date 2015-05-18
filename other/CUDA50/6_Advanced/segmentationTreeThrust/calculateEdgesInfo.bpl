type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$startpoints"} {:global} {:elem_width 32} {:source_name "startpoints"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$startpoints: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$startpoints: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$startpoints: bool;

axiom {:array_info "$$verticesMapping"} {:global} {:elem_width 32} {:source_name "verticesMapping"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$verticesMapping: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$verticesMapping: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$verticesMapping: bool;

var {:source_name "edges"} {:global} $$edges: [bv32]bv32;

axiom {:array_info "$$edges"} {:global} {:elem_width 32} {:source_name "edges"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$edges: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$edges: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$edges: bool;

axiom {:array_info "$$weights"} {:global} {:elem_width 32} {:source_name "weights"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$weights: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$weights: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$weights: bool;

var {:source_name "newStartpoints"} {:global} $$newStartpoints: [bv32]bv32;

axiom {:array_info "$$newStartpoints"} {:global} {:elem_width 32} {:source_name "newStartpoints"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$newStartpoints: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$newStartpoints: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$newStartpoints: bool;

var {:source_name "survivedEdgesIDs"} {:global} $$survivedEdgesIDs: [bv32]bv32;

axiom {:array_info "$$survivedEdgesIDs"} {:global} {:elem_width 32} {:source_name "survivedEdgesIDs"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$survivedEdgesIDs: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$survivedEdgesIDs: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$survivedEdgesIDs: bool;

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

procedure {:source_name "calculateEdgesInfo"} {:kernel} $_Z18calculateEdgesInfoPKjS0_S0_PKfPjS3_jj($edgesCount: bv32, $newVerticesCount: bv32);
  requires !_READ_HAS_OCCURRED_$$startpoints && !_WRITE_HAS_OCCURRED_$$startpoints && !_ATOMIC_HAS_OCCURRED_$$startpoints;
  requires !_READ_HAS_OCCURRED_$$verticesMapping && !_WRITE_HAS_OCCURRED_$$verticesMapping && !_ATOMIC_HAS_OCCURRED_$$verticesMapping;
  requires !_READ_HAS_OCCURRED_$$edges && !_WRITE_HAS_OCCURRED_$$edges && !_ATOMIC_HAS_OCCURRED_$$edges;
  requires !_READ_HAS_OCCURRED_$$weights && !_WRITE_HAS_OCCURRED_$$weights && !_ATOMIC_HAS_OCCURRED_$$weights;
  requires !_READ_HAS_OCCURRED_$$newStartpoints && !_WRITE_HAS_OCCURRED_$$newStartpoints && !_ATOMIC_HAS_OCCURRED_$$newStartpoints;
  requires !_READ_HAS_OCCURRED_$$survivedEdgesIDs && !_WRITE_HAS_OCCURRED_$$survivedEdgesIDs && !_ATOMIC_HAS_OCCURRED_$$survivedEdgesIDs;
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
  modifies _WRITE_HAS_OCCURRED_$$newStartpoints, _WRITE_READ_BENIGN_FLAG_$$newStartpoints, _WRITE_READ_BENIGN_FLAG_$$newStartpoints, _WRITE_HAS_OCCURRED_$$survivedEdgesIDs, _WRITE_READ_BENIGN_FLAG_$$survivedEdgesIDs, _WRITE_READ_BENIGN_FLAG_$$survivedEdgesIDs;



implementation {:source_name "calculateEdgesInfo"} {:kernel} $_Z18calculateEdgesInfoPKjS0_S0_PKfPjS3_jj($edgesCount: bv32, $newVerticesCount: bv32)
{
  var $0$1: bv32;
  var $0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bool;
  var v7$2: bool;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;
  var p4$1: bool;
  var p4$2: bool;
  var p5$1: bool;
  var p5$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


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
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p0$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p0$2 then _HAVOC_bv32$2 else v2$2);
    v3$1 := (if p0$1 then $$edges[v0$1] else v3$1);
    v3$2 := (if p0$2 then $$edges[v0$2] else v3$2);
    v4$1 := (if p0$1 then BV32_ULT(v3$1, 4294967295bv32) else v4$1);
    v4$2 := (if p0$2 then BV32_ULT(v3$2, 4294967295bv32) else v4$2);
    p1$1 := (if p0$1 && v4$1 then v4$1 else p1$1);
    p1$2 := (if p0$2 && v4$2 then v4$2 else p1$2);
    p2$1 := (if p0$1 && !v4$1 then !v4$1 else p2$1);
    p2$2 := (if p0$2 && !v4$2 then !v4$2 else p2$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v5$1 := (if p1$1 then _HAVOC_bv32$1 else v5$1);
    v5$2 := (if p1$2 then _HAVOC_bv32$2 else v5$2);
    $0$1 := (if p1$1 then v5$1 else $0$1);
    $0$2 := (if p1$2 then v5$2 else $0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v6$1 := (if p2$1 then _HAVOC_bv32$1 else v6$1);
    v6$2 := (if p2$2 then _HAVOC_bv32$2 else v6$2);
    $0$1 := (if p2$1 then BV32_ADD($newVerticesCount, v6$1) else $0$1);
    $0$2 := (if p2$2 then BV32_ADD($newVerticesCount, v6$2) else $0$2);
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$newStartpoints(p0$1, v0$1, $0$1, $$newStartpoints[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newStartpoints(p0$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$newStartpoints(p0$2, v0$2, $0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newStartpoints"} true;
    $$newStartpoints[v0$1] := (if p0$1 then $0$1 else $$newStartpoints[v0$1]);
    $$newStartpoints[v0$2] := (if p0$2 then $0$2 else $$newStartpoints[v0$2]);
    v7$1 := (if p0$1 then BV32_ULT(v3$1, 4294967295bv32) else v7$1);
    v7$2 := (if p0$2 then BV32_ULT(v3$2, 4294967295bv32) else v7$2);
    p3$1 := (if p0$1 && v7$1 then v7$1 else p3$1);
    p3$2 := (if p0$2 && v7$2 then v7$2 else p3$2);
    p4$1 := (if p0$1 && !v7$1 then !v7$1 else p4$1);
    p4$2 := (if p0$2 && !v7$2 then !v7$2 else p4$2);
    $1$1 := (if p3$1 then v0$1 else $1$1);
    $1$2 := (if p3$2 then v0$2 else $1$2);
    $1$1 := (if p4$1 then 4294967295bv32 else $1$1);
    $1$2 := (if p4$2 then 4294967295bv32 else $1$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$survivedEdgesIDs(p0$1, v0$1, $1$1, $$survivedEdgesIDs[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$survivedEdgesIDs(p0$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$survivedEdgesIDs(p0$2, v0$2, $1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$survivedEdgesIDs"} true;
    $$survivedEdgesIDs[v0$1] := (if p0$1 then $1$1 else $$survivedEdgesIDs[v0$1]);
    $$survivedEdgesIDs[v0$2] := (if p0$2 then $1$2 else $$survivedEdgesIDs[v0$2]);
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



const _WATCHED_VALUE_$$weights: bv32;

procedure {:inline 1} _LOG_READ_$$weights(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$weights;



implementation {:inline 1} _LOG_READ_$$weights(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$weights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights == _value then true else _READ_HAS_OCCURRED_$$weights);
    return;
}



procedure _CHECK_READ_$$weights(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$weights);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$weights: bool;

procedure {:inline 1} _LOG_WRITE_$$weights(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$weights, _WRITE_READ_BENIGN_FLAG_$$weights;



implementation {:inline 1} _LOG_WRITE_$$weights(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$weights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights == _value then true else _WRITE_HAS_OCCURRED_$$weights);
    _WRITE_READ_BENIGN_FLAG_$$weights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$weights);
    return;
}



procedure _CHECK_WRITE_$$weights(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights != _value);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights != _value);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$weights(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$weights;



implementation {:inline 1} _LOG_ATOMIC_$$weights(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$weights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$weights);
    return;
}



procedure _CHECK_ATOMIC_$$weights(_P: bool, _offset: bv32);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$weights(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$weights;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$weights(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$weights := (if _P && _WRITE_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$weights);
    return;
}



const _WATCHED_VALUE_$$newStartpoints: bv32;

procedure {:inline 1} _LOG_READ_$$newStartpoints(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$newStartpoints;



implementation {:inline 1} _LOG_READ_$$newStartpoints(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$newStartpoints := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newStartpoints == _value then true else _READ_HAS_OCCURRED_$$newStartpoints);
    return;
}



procedure _CHECK_READ_$$newStartpoints(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "newStartpoints"} {:array "$$newStartpoints"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$newStartpoints && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$newStartpoints);
  requires {:source_name "newStartpoints"} {:array "$$newStartpoints"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$newStartpoints && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$newStartpoints: bool;

procedure {:inline 1} _LOG_WRITE_$$newStartpoints(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$newStartpoints, _WRITE_READ_BENIGN_FLAG_$$newStartpoints;



implementation {:inline 1} _LOG_WRITE_$$newStartpoints(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$newStartpoints := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newStartpoints == _value then true else _WRITE_HAS_OCCURRED_$$newStartpoints);
    _WRITE_READ_BENIGN_FLAG_$$newStartpoints := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newStartpoints == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$newStartpoints);
    return;
}



procedure _CHECK_WRITE_$$newStartpoints(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "newStartpoints"} {:array "$$newStartpoints"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$newStartpoints && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newStartpoints != _value);
  requires {:source_name "newStartpoints"} {:array "$$newStartpoints"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$newStartpoints && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newStartpoints != _value);
  requires {:source_name "newStartpoints"} {:array "$$newStartpoints"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$newStartpoints && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$newStartpoints(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$newStartpoints;



implementation {:inline 1} _LOG_ATOMIC_$$newStartpoints(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$newStartpoints := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$newStartpoints);
    return;
}



procedure _CHECK_ATOMIC_$$newStartpoints(_P: bool, _offset: bv32);
  requires {:source_name "newStartpoints"} {:array "$$newStartpoints"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$newStartpoints && _WATCHED_OFFSET == _offset);
  requires {:source_name "newStartpoints"} {:array "$$newStartpoints"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$newStartpoints && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$newStartpoints(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$newStartpoints;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$newStartpoints(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$newStartpoints := (if _P && _WRITE_HAS_OCCURRED_$$newStartpoints && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$newStartpoints);
    return;
}



const _WATCHED_VALUE_$$survivedEdgesIDs: bv32;

procedure {:inline 1} _LOG_READ_$$survivedEdgesIDs(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$survivedEdgesIDs;



implementation {:inline 1} _LOG_READ_$$survivedEdgesIDs(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$survivedEdgesIDs := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$survivedEdgesIDs == _value then true else _READ_HAS_OCCURRED_$$survivedEdgesIDs);
    return;
}



procedure _CHECK_READ_$$survivedEdgesIDs(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "survivedEdgesIDs"} {:array "$$survivedEdgesIDs"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$survivedEdgesIDs && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$survivedEdgesIDs);
  requires {:source_name "survivedEdgesIDs"} {:array "$$survivedEdgesIDs"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$survivedEdgesIDs && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$survivedEdgesIDs: bool;

procedure {:inline 1} _LOG_WRITE_$$survivedEdgesIDs(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$survivedEdgesIDs, _WRITE_READ_BENIGN_FLAG_$$survivedEdgesIDs;



implementation {:inline 1} _LOG_WRITE_$$survivedEdgesIDs(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$survivedEdgesIDs := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$survivedEdgesIDs == _value then true else _WRITE_HAS_OCCURRED_$$survivedEdgesIDs);
    _WRITE_READ_BENIGN_FLAG_$$survivedEdgesIDs := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$survivedEdgesIDs == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$survivedEdgesIDs);
    return;
}



procedure _CHECK_WRITE_$$survivedEdgesIDs(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "survivedEdgesIDs"} {:array "$$survivedEdgesIDs"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$survivedEdgesIDs && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$survivedEdgesIDs != _value);
  requires {:source_name "survivedEdgesIDs"} {:array "$$survivedEdgesIDs"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$survivedEdgesIDs && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$survivedEdgesIDs != _value);
  requires {:source_name "survivedEdgesIDs"} {:array "$$survivedEdgesIDs"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$survivedEdgesIDs && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$survivedEdgesIDs(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$survivedEdgesIDs;



implementation {:inline 1} _LOG_ATOMIC_$$survivedEdgesIDs(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$survivedEdgesIDs := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$survivedEdgesIDs);
    return;
}



procedure _CHECK_ATOMIC_$$survivedEdgesIDs(_P: bool, _offset: bv32);
  requires {:source_name "survivedEdgesIDs"} {:array "$$survivedEdgesIDs"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$survivedEdgesIDs && _WATCHED_OFFSET == _offset);
  requires {:source_name "survivedEdgesIDs"} {:array "$$survivedEdgesIDs"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$survivedEdgesIDs && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$survivedEdgesIDs(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$survivedEdgesIDs;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$survivedEdgesIDs(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$survivedEdgesIDs := (if _P && _WRITE_HAS_OCCURRED_$$survivedEdgesIDs && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$survivedEdgesIDs);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
