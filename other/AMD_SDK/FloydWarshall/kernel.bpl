type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "pathDistanceBuffer"} {:global} $$pathDistanceBuffer: [bv32]bv32;

axiom {:array_info "$$pathDistanceBuffer"} {:global} {:elem_width 32} {:source_name "pathDistanceBuffer"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$pathDistanceBuffer: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$pathDistanceBuffer: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$pathDistanceBuffer: bool;

var {:source_name "pathBuffer"} {:global} $$pathBuffer: [bv32]bv32;

axiom {:array_info "$$pathBuffer"} {:global} {:elem_width 32} {:source_name "pathBuffer"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$pathBuffer: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$pathBuffer: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$pathBuffer: bool;

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

function {:bvbuiltin "bvadd"} BV33_ADD(bv33, bv33) : bv33;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:inline 1} $__add_noovfl_unsigned_32(x$1: bv32, y$1: bv32, x$2: bv32, y$2: bv32) returns (z$1: bv32, z$2: bv32);



implementation {:inline 1} $__add_noovfl_unsigned_32(x$1: bv32, y$1: bv32, x$2: bv32, y$2: bv32) returns (z$1: bv32, z$2: bv32)
{

  anon0:
    assume BV33_ADD(0bv1 ++ x$1, 0bv1 ++ y$1)[33:32] == 0bv1 && BV33_ADD(0bv1 ++ x$2, 0bv1 ++ y$2)[33:32] == 0bv1;
    z$1 := BV32_ADD(x$1, y$1);
    z$2 := BV32_ADD(x$2, y$2);
    return;
}



procedure {:source_name "floydWarshallPass"} {:kernel} $floydWarshallPass($numNodes: bv32, $pass: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $numNodes == 64bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $pass == 0bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$pathDistanceBuffer && !_WRITE_HAS_OCCURRED_$$pathDistanceBuffer && !_ATOMIC_HAS_OCCURRED_$$pathDistanceBuffer;
  requires !_READ_HAS_OCCURRED_$$pathBuffer && !_WRITE_HAS_OCCURRED_$$pathBuffer && !_ATOMIC_HAS_OCCURRED_$$pathBuffer;
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
  modifies _READ_HAS_OCCURRED_$$pathDistanceBuffer, _WRITE_HAS_OCCURRED_$$pathDistanceBuffer, _WRITE_READ_BENIGN_FLAG_$$pathDistanceBuffer, _WRITE_READ_BENIGN_FLAG_$$pathDistanceBuffer, _WRITE_HAS_OCCURRED_$$pathBuffer, _WRITE_READ_BENIGN_FLAG_$$pathBuffer, _WRITE_READ_BENIGN_FLAG_$$pathBuffer;



implementation {:source_name "floydWarshallPass"} {:kernel} $floydWarshallPass($numNodes: bv32, $pass: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bool;
  var v6$2: bool;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    call {:sourceloc} {:sourceloc_num 3} _LOG_READ_$$pathDistanceBuffer(true, BV32_ADD(BV32_MUL(v1$1, $numNodes), v0$1), $$pathDistanceBuffer[BV32_ADD(BV32_MUL(v1$1, $numNodes), v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 3} _CHECK_READ_$$pathDistanceBuffer(true, BV32_ADD(BV32_MUL(v1$2, $numNodes), v0$2), $$pathDistanceBuffer[BV32_ADD(BV32_MUL(v1$2, $numNodes), v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$pathDistanceBuffer"} true;
    v2$1 := $$pathDistanceBuffer[BV32_ADD(BV32_MUL(v1$1, $numNodes), v0$1)];
    v2$2 := $$pathDistanceBuffer[BV32_ADD(BV32_MUL(v1$2, $numNodes), v0$2)];
    call {:sourceloc} {:sourceloc_num 4} _LOG_READ_$$pathDistanceBuffer(true, BV32_ADD(BV32_MUL(v1$1, $numNodes), $pass), $$pathDistanceBuffer[BV32_ADD(BV32_MUL(v1$1, $numNodes), $pass)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 4} _CHECK_READ_$$pathDistanceBuffer(true, BV32_ADD(BV32_MUL(v1$2, $numNodes), $pass), $$pathDistanceBuffer[BV32_ADD(BV32_MUL(v1$2, $numNodes), $pass)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$pathDistanceBuffer"} true;
    v3$1 := $$pathDistanceBuffer[BV32_ADD(BV32_MUL(v1$1, $numNodes), $pass)];
    v3$2 := $$pathDistanceBuffer[BV32_ADD(BV32_MUL(v1$2, $numNodes), $pass)];
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$pathDistanceBuffer(true, BV32_ADD(BV32_MUL($pass, $numNodes), v0$1), $$pathDistanceBuffer[BV32_ADD(BV32_MUL($pass, $numNodes), v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$pathDistanceBuffer(true, BV32_ADD(BV32_MUL($pass, $numNodes), v0$2), $$pathDistanceBuffer[BV32_ADD(BV32_MUL($pass, $numNodes), v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$pathDistanceBuffer"} true;
    v4$1 := $$pathDistanceBuffer[BV32_ADD(BV32_MUL($pass, $numNodes), v0$1)];
    v4$2 := $$pathDistanceBuffer[BV32_ADD(BV32_MUL($pass, $numNodes), v0$2)];
    call v5$1, v5$2 := $__add_noovfl_unsigned_32(v3$1, v4$1, v3$2, v4$2);
    v6$1 := BV32_ULT(v5$1, v2$1);
    v6$2 := BV32_ULT(v5$2, v2$2);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v6$1 then v6$1 else p0$1);
    p0$2 := (if v6$2 then v6$2 else p0$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$pathDistanceBuffer(p0$1, BV32_ADD(BV32_MUL(v1$1, $numNodes), v0$1), v5$1, $$pathDistanceBuffer[BV32_ADD(BV32_MUL(v1$1, $numNodes), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathDistanceBuffer(p0$2, BV32_ADD(BV32_MUL(v1$2, $numNodes), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$pathDistanceBuffer(p0$2, BV32_ADD(BV32_MUL(v1$2, $numNodes), v0$2), v5$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pathDistanceBuffer"} true;
    $$pathDistanceBuffer[BV32_ADD(BV32_MUL(v1$1, $numNodes), v0$1)] := (if p0$1 then v5$1 else $$pathDistanceBuffer[BV32_ADD(BV32_MUL(v1$1, $numNodes), v0$1)]);
    $$pathDistanceBuffer[BV32_ADD(BV32_MUL(v1$2, $numNodes), v0$2)] := (if p0$2 then v5$2 else $$pathDistanceBuffer[BV32_ADD(BV32_MUL(v1$2, $numNodes), v0$2)]);
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$pathBuffer(p0$1, BV32_ADD(BV32_MUL(v1$1, $numNodes), v0$1), $pass, $$pathBuffer[BV32_ADD(BV32_MUL(v1$1, $numNodes), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathBuffer(p0$2, BV32_ADD(BV32_MUL(v1$2, $numNodes), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$pathBuffer(p0$2, BV32_ADD(BV32_MUL(v1$2, $numNodes), v0$2), $pass);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pathBuffer"} true;
    $$pathBuffer[BV32_ADD(BV32_MUL(v1$1, $numNodes), v0$1)] := (if p0$1 then $pass else $$pathBuffer[BV32_ADD(BV32_MUL(v1$1, $numNodes), v0$1)]);
    $$pathBuffer[BV32_ADD(BV32_MUL(v1$2, $numNodes), v0$2)] := (if p0$2 then $pass else $$pathBuffer[BV32_ADD(BV32_MUL(v1$2, $numNodes), v0$2)]);
    return;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$pathDistanceBuffer: bv32;

procedure {:inline 1} _LOG_READ_$$pathDistanceBuffer(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$pathDistanceBuffer;



implementation {:inline 1} _LOG_READ_$$pathDistanceBuffer(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$pathDistanceBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathDistanceBuffer == _value then true else _READ_HAS_OCCURRED_$$pathDistanceBuffer);
    return;
}



procedure _CHECK_READ_$$pathDistanceBuffer(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pathDistanceBuffer"} {:array "$$pathDistanceBuffer"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$pathDistanceBuffer && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$pathDistanceBuffer);
  requires {:source_name "pathDistanceBuffer"} {:array "$$pathDistanceBuffer"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$pathDistanceBuffer && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$pathDistanceBuffer: bool;

procedure {:inline 1} _LOG_WRITE_$$pathDistanceBuffer(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$pathDistanceBuffer, _WRITE_READ_BENIGN_FLAG_$$pathDistanceBuffer;



implementation {:inline 1} _LOG_WRITE_$$pathDistanceBuffer(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$pathDistanceBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathDistanceBuffer == _value then true else _WRITE_HAS_OCCURRED_$$pathDistanceBuffer);
    _WRITE_READ_BENIGN_FLAG_$$pathDistanceBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathDistanceBuffer == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$pathDistanceBuffer);
    return;
}



procedure _CHECK_WRITE_$$pathDistanceBuffer(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pathDistanceBuffer"} {:array "$$pathDistanceBuffer"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$pathDistanceBuffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathDistanceBuffer != _value);
  requires {:source_name "pathDistanceBuffer"} {:array "$$pathDistanceBuffer"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$pathDistanceBuffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathDistanceBuffer != _value);
  requires {:source_name "pathDistanceBuffer"} {:array "$$pathDistanceBuffer"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$pathDistanceBuffer && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$pathDistanceBuffer(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$pathDistanceBuffer;



implementation {:inline 1} _LOG_ATOMIC_$$pathDistanceBuffer(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$pathDistanceBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$pathDistanceBuffer);
    return;
}



procedure _CHECK_ATOMIC_$$pathDistanceBuffer(_P: bool, _offset: bv32);
  requires {:source_name "pathDistanceBuffer"} {:array "$$pathDistanceBuffer"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$pathDistanceBuffer && _WATCHED_OFFSET == _offset);
  requires {:source_name "pathDistanceBuffer"} {:array "$$pathDistanceBuffer"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$pathDistanceBuffer && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathDistanceBuffer(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$pathDistanceBuffer;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathDistanceBuffer(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$pathDistanceBuffer := (if _P && _WRITE_HAS_OCCURRED_$$pathDistanceBuffer && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$pathDistanceBuffer);
    return;
}



const _WATCHED_VALUE_$$pathBuffer: bv32;

procedure {:inline 1} _LOG_READ_$$pathBuffer(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$pathBuffer;



implementation {:inline 1} _LOG_READ_$$pathBuffer(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$pathBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathBuffer == _value then true else _READ_HAS_OCCURRED_$$pathBuffer);
    return;
}



procedure _CHECK_READ_$$pathBuffer(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pathBuffer"} {:array "$$pathBuffer"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$pathBuffer && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$pathBuffer);
  requires {:source_name "pathBuffer"} {:array "$$pathBuffer"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$pathBuffer && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$pathBuffer: bool;

procedure {:inline 1} _LOG_WRITE_$$pathBuffer(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$pathBuffer, _WRITE_READ_BENIGN_FLAG_$$pathBuffer;



implementation {:inline 1} _LOG_WRITE_$$pathBuffer(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$pathBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathBuffer == _value then true else _WRITE_HAS_OCCURRED_$$pathBuffer);
    _WRITE_READ_BENIGN_FLAG_$$pathBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathBuffer == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$pathBuffer);
    return;
}



procedure _CHECK_WRITE_$$pathBuffer(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pathBuffer"} {:array "$$pathBuffer"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$pathBuffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathBuffer != _value);
  requires {:source_name "pathBuffer"} {:array "$$pathBuffer"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$pathBuffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathBuffer != _value);
  requires {:source_name "pathBuffer"} {:array "$$pathBuffer"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$pathBuffer && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$pathBuffer(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$pathBuffer;



implementation {:inline 1} _LOG_ATOMIC_$$pathBuffer(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$pathBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$pathBuffer);
    return;
}



procedure _CHECK_ATOMIC_$$pathBuffer(_P: bool, _offset: bv32);
  requires {:source_name "pathBuffer"} {:array "$$pathBuffer"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$pathBuffer && _WATCHED_OFFSET == _offset);
  requires {:source_name "pathBuffer"} {:array "$$pathBuffer"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$pathBuffer && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathBuffer(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$pathBuffer;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathBuffer(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$pathBuffer := (if _P && _WRITE_HAS_OCCURRED_$$pathBuffer && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$pathBuffer);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
