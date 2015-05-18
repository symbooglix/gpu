type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$survivedEdgesIDs"} {:global} {:elem_width 32} {:source_name "survivedEdgesIDs"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$survivedEdgesIDs: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$survivedEdgesIDs: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$survivedEdgesIDs: bool;

axiom {:array_info "$$verticesMapping"} {:global} {:elem_width 32} {:source_name "verticesMapping"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$verticesMapping: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$verticesMapping: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$verticesMapping: bool;

axiom {:array_info "$$edges"} {:global} {:elem_width 32} {:source_name "edges"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$edges: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$edges: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$edges: bool;

axiom {:array_info "$$weights"} {:global} {:elem_width 32} {:source_name "weights"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$weights: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$weights: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$weights: bool;

var {:source_name "newEdges"} {:global} $$newEdges: [bv32]bv32;

axiom {:array_info "$$newEdges"} {:global} {:elem_width 32} {:source_name "newEdges"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$newEdges: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$newEdges: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$newEdges: bool;

var {:source_name "newWeights"} {:global} $$newWeights: [bv32]bv32;

axiom {:array_info "$$newWeights"} {:global} {:elem_width 32} {:source_name "newWeights"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$newWeights: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$newWeights: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$newWeights: bool;

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

procedure {:source_name "makeNewEdges"} {:kernel} $_Z12makeNewEdgesPKjS0_S0_PKfPjPfj($edgesCount: bv32);
  requires !_READ_HAS_OCCURRED_$$survivedEdgesIDs && !_WRITE_HAS_OCCURRED_$$survivedEdgesIDs && !_ATOMIC_HAS_OCCURRED_$$survivedEdgesIDs;
  requires !_READ_HAS_OCCURRED_$$verticesMapping && !_WRITE_HAS_OCCURRED_$$verticesMapping && !_ATOMIC_HAS_OCCURRED_$$verticesMapping;
  requires !_READ_HAS_OCCURRED_$$edges && !_WRITE_HAS_OCCURRED_$$edges && !_ATOMIC_HAS_OCCURRED_$$edges;
  requires !_READ_HAS_OCCURRED_$$weights && !_WRITE_HAS_OCCURRED_$$weights && !_ATOMIC_HAS_OCCURRED_$$weights;
  requires !_READ_HAS_OCCURRED_$$newEdges && !_WRITE_HAS_OCCURRED_$$newEdges && !_ATOMIC_HAS_OCCURRED_$$newEdges;
  requires !_READ_HAS_OCCURRED_$$newWeights && !_WRITE_HAS_OCCURRED_$$newWeights && !_ATOMIC_HAS_OCCURRED_$$newWeights;
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
  modifies _WRITE_HAS_OCCURRED_$$newEdges, _WRITE_READ_BENIGN_FLAG_$$newEdges, _WRITE_READ_BENIGN_FLAG_$$newEdges, _WRITE_HAS_OCCURRED_$$newWeights, _WRITE_READ_BENIGN_FLAG_$$newWeights, _WRITE_READ_BENIGN_FLAG_$$newWeights;



implementation {:source_name "makeNewEdges"} {:kernel} $_Z12makeNewEdgesPKjS0_S0_PKfPjPfj($edgesCount: bv32)
{
  var v1$1: bool;
  var v1$2: bool;
  var v0$1: bv32;
  var v0$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
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
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p0$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p0$2 then _HAVOC_bv32$2 else v2$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p0$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p0$2 then _HAVOC_bv32$2 else v3$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v4$1 := (if p0$1 then _HAVOC_bv32$1 else v4$1);
    v4$2 := (if p0$2 then _HAVOC_bv32$2 else v4$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$newEdges(p0$1, v0$1, v4$1, $$newEdges[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newEdges(p0$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$newEdges(p0$2, v0$2, v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newEdges"} true;
    $$newEdges[v0$1] := (if p0$1 then v4$1 else $$newEdges[v0$1]);
    $$newEdges[v0$2] := (if p0$2 then v4$2 else $$newEdges[v0$2]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v5$1 := (if p0$1 then _HAVOC_bv32$1 else v5$1);
    v5$2 := (if p0$2 then _HAVOC_bv32$2 else v5$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$newWeights(p0$1, v0$1, v5$1, $$newWeights[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newWeights(p0$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$newWeights(p0$2, v0$2, v5$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newWeights"} true;
    $$newWeights[v0$1] := (if p0$1 then v5$1 else $$newWeights[v0$1]);
    $$newWeights[v0$2] := (if p0$2 then v5$2 else $$newWeights[v0$2]);
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



const _WATCHED_VALUE_$$newEdges: bv32;

procedure {:inline 1} _LOG_READ_$$newEdges(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$newEdges;



implementation {:inline 1} _LOG_READ_$$newEdges(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$newEdges := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newEdges == _value then true else _READ_HAS_OCCURRED_$$newEdges);
    return;
}



procedure _CHECK_READ_$$newEdges(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "newEdges"} {:array "$$newEdges"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$newEdges && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$newEdges);
  requires {:source_name "newEdges"} {:array "$$newEdges"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$newEdges && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$newEdges: bool;

procedure {:inline 1} _LOG_WRITE_$$newEdges(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$newEdges, _WRITE_READ_BENIGN_FLAG_$$newEdges;



implementation {:inline 1} _LOG_WRITE_$$newEdges(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$newEdges := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newEdges == _value then true else _WRITE_HAS_OCCURRED_$$newEdges);
    _WRITE_READ_BENIGN_FLAG_$$newEdges := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newEdges == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$newEdges);
    return;
}



procedure _CHECK_WRITE_$$newEdges(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "newEdges"} {:array "$$newEdges"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$newEdges && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newEdges != _value);
  requires {:source_name "newEdges"} {:array "$$newEdges"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$newEdges && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newEdges != _value);
  requires {:source_name "newEdges"} {:array "$$newEdges"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$newEdges && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$newEdges(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$newEdges;



implementation {:inline 1} _LOG_ATOMIC_$$newEdges(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$newEdges := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$newEdges);
    return;
}



procedure _CHECK_ATOMIC_$$newEdges(_P: bool, _offset: bv32);
  requires {:source_name "newEdges"} {:array "$$newEdges"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$newEdges && _WATCHED_OFFSET == _offset);
  requires {:source_name "newEdges"} {:array "$$newEdges"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$newEdges && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$newEdges(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$newEdges;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$newEdges(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$newEdges := (if _P && _WRITE_HAS_OCCURRED_$$newEdges && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$newEdges);
    return;
}



const _WATCHED_VALUE_$$newWeights: bv32;

procedure {:inline 1} _LOG_READ_$$newWeights(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$newWeights;



implementation {:inline 1} _LOG_READ_$$newWeights(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$newWeights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newWeights == _value then true else _READ_HAS_OCCURRED_$$newWeights);
    return;
}



procedure _CHECK_READ_$$newWeights(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "newWeights"} {:array "$$newWeights"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$newWeights && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$newWeights);
  requires {:source_name "newWeights"} {:array "$$newWeights"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$newWeights && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$newWeights: bool;

procedure {:inline 1} _LOG_WRITE_$$newWeights(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$newWeights, _WRITE_READ_BENIGN_FLAG_$$newWeights;



implementation {:inline 1} _LOG_WRITE_$$newWeights(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$newWeights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newWeights == _value then true else _WRITE_HAS_OCCURRED_$$newWeights);
    _WRITE_READ_BENIGN_FLAG_$$newWeights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newWeights == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$newWeights);
    return;
}



procedure _CHECK_WRITE_$$newWeights(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "newWeights"} {:array "$$newWeights"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$newWeights && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newWeights != _value);
  requires {:source_name "newWeights"} {:array "$$newWeights"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$newWeights && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newWeights != _value);
  requires {:source_name "newWeights"} {:array "$$newWeights"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$newWeights && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$newWeights(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$newWeights;



implementation {:inline 1} _LOG_ATOMIC_$$newWeights(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$newWeights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$newWeights);
    return;
}



procedure _CHECK_ATOMIC_$$newWeights(_P: bool, _offset: bv32);
  requires {:source_name "newWeights"} {:array "$$newWeights"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$newWeights && _WATCHED_OFFSET == _offset);
  requires {:source_name "newWeights"} {:array "$$newWeights"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$newWeights && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$newWeights(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$newWeights;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$newWeights(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$newWeights := (if _P && _WRITE_HAS_OCCURRED_$$newWeights && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$newWeights);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
