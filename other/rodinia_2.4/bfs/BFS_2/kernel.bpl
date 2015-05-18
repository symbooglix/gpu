type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "g_graph_mask"} {:global} $$g_graph_mask: [bv32]bv8;

axiom {:array_info "$$g_graph_mask"} {:global} {:elem_width 8} {:source_name "g_graph_mask"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$g_graph_mask: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$g_graph_mask: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$g_graph_mask: bool;

var {:source_name "g_updating_graph_mask"} {:global} $$g_updating_graph_mask: [bv32]bv8;

axiom {:array_info "$$g_updating_graph_mask"} {:global} {:elem_width 8} {:source_name "g_updating_graph_mask"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$g_updating_graph_mask: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$g_updating_graph_mask: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$g_updating_graph_mask: bool;

var {:source_name "g_graph_visited"} {:global} $$g_graph_visited: [bv32]bv8;

axiom {:array_info "$$g_graph_visited"} {:global} {:elem_width 8} {:source_name "g_graph_visited"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$g_graph_visited: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$g_graph_visited: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$g_graph_visited: bool;

var {:source_name "g_over"} {:global} $$g_over: [bv32]bv8;

axiom {:array_info "$$g_over"} {:global} {:elem_width 8} {:source_name "g_over"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$g_over: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$g_over: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$g_over: bool;

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

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "sign_extend 24"} BV8_SEXT32(bv8) : bv32;

procedure {:source_name "BFS_2"} {:kernel} $BFS_2($no_of_nodes: bv32);
  requires !_READ_HAS_OCCURRED_$$g_graph_mask && !_WRITE_HAS_OCCURRED_$$g_graph_mask && !_ATOMIC_HAS_OCCURRED_$$g_graph_mask;
  requires !_READ_HAS_OCCURRED_$$g_updating_graph_mask && !_WRITE_HAS_OCCURRED_$$g_updating_graph_mask && !_ATOMIC_HAS_OCCURRED_$$g_updating_graph_mask;
  requires !_READ_HAS_OCCURRED_$$g_graph_visited && !_WRITE_HAS_OCCURRED_$$g_graph_visited && !_ATOMIC_HAS_OCCURRED_$$g_graph_visited;
  requires !_READ_HAS_OCCURRED_$$g_over && !_WRITE_HAS_OCCURRED_$$g_over && !_ATOMIC_HAS_OCCURRED_$$g_over;
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
  modifies _READ_HAS_OCCURRED_$$g_updating_graph_mask, _WRITE_HAS_OCCURRED_$$g_graph_mask, _WRITE_READ_BENIGN_FLAG_$$g_graph_mask, _WRITE_READ_BENIGN_FLAG_$$g_graph_mask, _WRITE_HAS_OCCURRED_$$g_graph_visited, _WRITE_READ_BENIGN_FLAG_$$g_graph_visited, _WRITE_READ_BENIGN_FLAG_$$g_graph_visited, _WRITE_HAS_OCCURRED_$$g_over, _WRITE_READ_BENIGN_FLAG_$$g_over, _WRITE_READ_BENIGN_FLAG_$$g_over, _WRITE_HAS_OCCURRED_$$g_updating_graph_mask, _WRITE_READ_BENIGN_FLAG_$$g_updating_graph_mask, _WRITE_READ_BENIGN_FLAG_$$g_updating_graph_mask;



implementation {:source_name "BFS_2"} {:kernel} $BFS_2($no_of_nodes: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bv8;
  var v2$2: bv8;
  var v3$1: bool;
  var v3$2: bool;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_SLT(v0$1, $no_of_nodes);
    v1$2 := BV32_SLT(v0$2, $no_of_nodes);
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
    call {:sourceloc} {:sourceloc_num 2} _LOG_READ_$$g_updating_graph_mask(p0$1, v0$1, $$g_updating_graph_mask[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 2} _CHECK_READ_$$g_updating_graph_mask(p0$2, v0$2, $$g_updating_graph_mask[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$g_updating_graph_mask"} true;
    v2$1 := (if p0$1 then $$g_updating_graph_mask[v0$1] else v2$1);
    v2$2 := (if p0$2 then $$g_updating_graph_mask[v0$2] else v2$2);
    v3$1 := (if p0$1 then BV8_SEXT32(v2$1) != 0bv32 else v3$1);
    v3$2 := (if p0$2 then BV8_SEXT32(v2$2) != 0bv32 else v3$2);
    p1$1 := (if p0$1 && v3$1 then v3$1 else p1$1);
    p1$2 := (if p0$2 && v3$2 then v3$2 else p1$2);
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$g_graph_mask(p1$1, v0$1, 1bv8, $$g_graph_mask[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_graph_mask(p1$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$g_graph_mask(p1$2, v0$2, 1bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_graph_mask"} true;
    $$g_graph_mask[v0$1] := (if p1$1 then 1bv8 else $$g_graph_mask[v0$1]);
    $$g_graph_mask[v0$2] := (if p1$2 then 1bv8 else $$g_graph_mask[v0$2]);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$g_graph_visited(p1$1, v0$1, 1bv8, $$g_graph_visited[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_graph_visited(p1$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$g_graph_visited(p1$2, v0$2, 1bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_graph_visited"} true;
    $$g_graph_visited[v0$1] := (if p1$1 then 1bv8 else $$g_graph_visited[v0$1]);
    $$g_graph_visited[v0$2] := (if p1$2 then 1bv8 else $$g_graph_visited[v0$2]);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$g_over(p1$1, 0bv32, 1bv8, $$g_over[0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_over(p1$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$g_over(p1$2, 0bv32, 1bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_over"} true;
    $$g_over[0bv32] := (if p1$1 then 1bv8 else $$g_over[0bv32]);
    $$g_over[0bv32] := (if p1$2 then 1bv8 else $$g_over[0bv32]);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$g_updating_graph_mask(p1$1, v0$1, 0bv8, $$g_updating_graph_mask[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_updating_graph_mask(p1$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$g_updating_graph_mask(p1$2, v0$2, 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_updating_graph_mask"} true;
    $$g_updating_graph_mask[v0$1] := (if p1$1 then 0bv8 else $$g_updating_graph_mask[v0$1]);
    $$g_updating_graph_mask[v0$2] := (if p1$2 then 0bv8 else $$g_updating_graph_mask[v0$2]);
    return;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 3907bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$g_graph_mask: bv8;

procedure {:inline 1} _LOG_READ_$$g_graph_mask(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$g_graph_mask;



implementation {:inline 1} _LOG_READ_$$g_graph_mask(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$g_graph_mask := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_graph_mask == _value then true else _READ_HAS_OCCURRED_$$g_graph_mask);
    return;
}



procedure _CHECK_READ_$$g_graph_mask(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "g_graph_mask"} {:array "$$g_graph_mask"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$g_graph_mask && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$g_graph_mask);
  requires {:source_name "g_graph_mask"} {:array "$$g_graph_mask"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$g_graph_mask && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$g_graph_mask: bool;

procedure {:inline 1} _LOG_WRITE_$$g_graph_mask(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$g_graph_mask, _WRITE_READ_BENIGN_FLAG_$$g_graph_mask;



implementation {:inline 1} _LOG_WRITE_$$g_graph_mask(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$g_graph_mask := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_graph_mask == _value then true else _WRITE_HAS_OCCURRED_$$g_graph_mask);
    _WRITE_READ_BENIGN_FLAG_$$g_graph_mask := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_graph_mask == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$g_graph_mask);
    return;
}



procedure _CHECK_WRITE_$$g_graph_mask(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "g_graph_mask"} {:array "$$g_graph_mask"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$g_graph_mask && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_graph_mask != _value);
  requires {:source_name "g_graph_mask"} {:array "$$g_graph_mask"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$g_graph_mask && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_graph_mask != _value);
  requires {:source_name "g_graph_mask"} {:array "$$g_graph_mask"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$g_graph_mask && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$g_graph_mask(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$g_graph_mask;



implementation {:inline 1} _LOG_ATOMIC_$$g_graph_mask(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$g_graph_mask := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$g_graph_mask);
    return;
}



procedure _CHECK_ATOMIC_$$g_graph_mask(_P: bool, _offset: bv32);
  requires {:source_name "g_graph_mask"} {:array "$$g_graph_mask"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$g_graph_mask && _WATCHED_OFFSET == _offset);
  requires {:source_name "g_graph_mask"} {:array "$$g_graph_mask"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$g_graph_mask && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_graph_mask(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$g_graph_mask;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_graph_mask(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$g_graph_mask := (if _P && _WRITE_HAS_OCCURRED_$$g_graph_mask && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$g_graph_mask);
    return;
}



const _WATCHED_VALUE_$$g_updating_graph_mask: bv8;

procedure {:inline 1} _LOG_READ_$$g_updating_graph_mask(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$g_updating_graph_mask;



implementation {:inline 1} _LOG_READ_$$g_updating_graph_mask(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$g_updating_graph_mask := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_updating_graph_mask == _value then true else _READ_HAS_OCCURRED_$$g_updating_graph_mask);
    return;
}



procedure _CHECK_READ_$$g_updating_graph_mask(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "g_updating_graph_mask"} {:array "$$g_updating_graph_mask"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$g_updating_graph_mask && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$g_updating_graph_mask);
  requires {:source_name "g_updating_graph_mask"} {:array "$$g_updating_graph_mask"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$g_updating_graph_mask && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$g_updating_graph_mask: bool;

procedure {:inline 1} _LOG_WRITE_$$g_updating_graph_mask(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$g_updating_graph_mask, _WRITE_READ_BENIGN_FLAG_$$g_updating_graph_mask;



implementation {:inline 1} _LOG_WRITE_$$g_updating_graph_mask(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$g_updating_graph_mask := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_updating_graph_mask == _value then true else _WRITE_HAS_OCCURRED_$$g_updating_graph_mask);
    _WRITE_READ_BENIGN_FLAG_$$g_updating_graph_mask := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_updating_graph_mask == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$g_updating_graph_mask);
    return;
}



procedure _CHECK_WRITE_$$g_updating_graph_mask(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "g_updating_graph_mask"} {:array "$$g_updating_graph_mask"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$g_updating_graph_mask && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_updating_graph_mask != _value);
  requires {:source_name "g_updating_graph_mask"} {:array "$$g_updating_graph_mask"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$g_updating_graph_mask && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_updating_graph_mask != _value);
  requires {:source_name "g_updating_graph_mask"} {:array "$$g_updating_graph_mask"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$g_updating_graph_mask && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$g_updating_graph_mask(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$g_updating_graph_mask;



implementation {:inline 1} _LOG_ATOMIC_$$g_updating_graph_mask(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$g_updating_graph_mask := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$g_updating_graph_mask);
    return;
}



procedure _CHECK_ATOMIC_$$g_updating_graph_mask(_P: bool, _offset: bv32);
  requires {:source_name "g_updating_graph_mask"} {:array "$$g_updating_graph_mask"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$g_updating_graph_mask && _WATCHED_OFFSET == _offset);
  requires {:source_name "g_updating_graph_mask"} {:array "$$g_updating_graph_mask"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$g_updating_graph_mask && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_updating_graph_mask(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$g_updating_graph_mask;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_updating_graph_mask(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$g_updating_graph_mask := (if _P && _WRITE_HAS_OCCURRED_$$g_updating_graph_mask && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$g_updating_graph_mask);
    return;
}



const _WATCHED_VALUE_$$g_graph_visited: bv8;

procedure {:inline 1} _LOG_READ_$$g_graph_visited(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$g_graph_visited;



implementation {:inline 1} _LOG_READ_$$g_graph_visited(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$g_graph_visited := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_graph_visited == _value then true else _READ_HAS_OCCURRED_$$g_graph_visited);
    return;
}



procedure _CHECK_READ_$$g_graph_visited(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "g_graph_visited"} {:array "$$g_graph_visited"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$g_graph_visited && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$g_graph_visited);
  requires {:source_name "g_graph_visited"} {:array "$$g_graph_visited"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$g_graph_visited && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$g_graph_visited: bool;

procedure {:inline 1} _LOG_WRITE_$$g_graph_visited(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$g_graph_visited, _WRITE_READ_BENIGN_FLAG_$$g_graph_visited;



implementation {:inline 1} _LOG_WRITE_$$g_graph_visited(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$g_graph_visited := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_graph_visited == _value then true else _WRITE_HAS_OCCURRED_$$g_graph_visited);
    _WRITE_READ_BENIGN_FLAG_$$g_graph_visited := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_graph_visited == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$g_graph_visited);
    return;
}



procedure _CHECK_WRITE_$$g_graph_visited(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "g_graph_visited"} {:array "$$g_graph_visited"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$g_graph_visited && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_graph_visited != _value);
  requires {:source_name "g_graph_visited"} {:array "$$g_graph_visited"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$g_graph_visited && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_graph_visited != _value);
  requires {:source_name "g_graph_visited"} {:array "$$g_graph_visited"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$g_graph_visited && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$g_graph_visited(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$g_graph_visited;



implementation {:inline 1} _LOG_ATOMIC_$$g_graph_visited(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$g_graph_visited := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$g_graph_visited);
    return;
}



procedure _CHECK_ATOMIC_$$g_graph_visited(_P: bool, _offset: bv32);
  requires {:source_name "g_graph_visited"} {:array "$$g_graph_visited"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$g_graph_visited && _WATCHED_OFFSET == _offset);
  requires {:source_name "g_graph_visited"} {:array "$$g_graph_visited"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$g_graph_visited && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_graph_visited(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$g_graph_visited;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_graph_visited(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$g_graph_visited := (if _P && _WRITE_HAS_OCCURRED_$$g_graph_visited && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$g_graph_visited);
    return;
}



const _WATCHED_VALUE_$$g_over: bv8;

procedure {:inline 1} _LOG_READ_$$g_over(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$g_over;



implementation {:inline 1} _LOG_READ_$$g_over(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$g_over := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_over == _value then true else _READ_HAS_OCCURRED_$$g_over);
    return;
}



procedure _CHECK_READ_$$g_over(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "g_over"} {:array "$$g_over"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$g_over && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$g_over);
  requires {:source_name "g_over"} {:array "$$g_over"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$g_over && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$g_over: bool;

procedure {:inline 1} _LOG_WRITE_$$g_over(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$g_over, _WRITE_READ_BENIGN_FLAG_$$g_over;



implementation {:inline 1} _LOG_WRITE_$$g_over(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$g_over := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_over == _value then true else _WRITE_HAS_OCCURRED_$$g_over);
    _WRITE_READ_BENIGN_FLAG_$$g_over := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_over == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$g_over);
    return;
}



procedure _CHECK_WRITE_$$g_over(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "g_over"} {:array "$$g_over"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$g_over && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_over != _value);
  requires {:source_name "g_over"} {:array "$$g_over"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$g_over && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_over != _value);
  requires {:source_name "g_over"} {:array "$$g_over"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$g_over && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$g_over(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$g_over;



implementation {:inline 1} _LOG_ATOMIC_$$g_over(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$g_over := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$g_over);
    return;
}



procedure _CHECK_ATOMIC_$$g_over(_P: bool, _offset: bv32);
  requires {:source_name "g_over"} {:array "$$g_over"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$g_over && _WATCHED_OFFSET == _offset);
  requires {:source_name "g_over"} {:array "$$g_over"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$g_over && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_over(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$g_over;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_over(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$g_over := (if _P && _WRITE_HAS_OCCURRED_$$g_over && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$g_over);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
