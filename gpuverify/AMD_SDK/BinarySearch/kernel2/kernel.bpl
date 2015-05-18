type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "keys"} {:global} $$keys: [bv32]bv32;

axiom {:array_info "$$keys"} {:global} {:elem_width 32} {:source_name "keys"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$keys: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$keys: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$keys: bool;

var {:source_name "input"} {:global} $$input: [bv32]bv32;

axiom {:array_info "$$input"} {:global} {:elem_width 32} {:source_name "input"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input: bool;

var {:source_name "output"} {:global} $$output: [bv32]bv32;

axiom {:array_info "$$output"} {:global} {:elem_width 32} {:source_name "output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output: bool;

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

function __other_bv32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

procedure {:source_name "binarySearch_mulkeys"} {:kernel} $binarySearch_mulkeys($numKeys: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if BV32_ULT($numKeys, 16777216bv32) then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$keys && !_WRITE_HAS_OCCURRED_$$keys && !_ATOMIC_HAS_OCCURRED_$$keys;
  requires !_READ_HAS_OCCURRED_$$input && !_WRITE_HAS_OCCURRED_$$input && !_ATOMIC_HAS_OCCURRED_$$input;
  requires !_READ_HAS_OCCURRED_$$output && !_WRITE_HAS_OCCURRED_$$output && !_ATOMIC_HAS_OCCURRED_$$output;
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
  modifies _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:source_name "binarySearch_mulkeys"} {:kernel} $binarySearch_mulkeys($numKeys: bv32)
{
  var $i.0: bv32;
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
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8: bool;
  var v9$1: bv32;
  var v9$2: bv32;
  var v11$1: bool;
  var v11$2: bool;
  var v10$1: bv32;
  var v10$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v14$1: bool;
  var v14$2: bool;
  var v13$1: bv32;
  var v13$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;


  $0:
    v0$1 := BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), 256bv32);
    v0$2 := BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), 256bv32);
    v1$1 := BV32_ADD(v0$1, 255bv32);
    v1$2 := BV32_ADD(v0$2, 255bv32);
    v2$1 := $$input[v0$1];
    v2$2 := $$input[v0$2];
    v3$1 := $$input[v1$1];
    v3$2 := $$input[v1$2];
    assume BV1_ZEXT32((if BV32_SLT(v0$1, v1$1) ==> BV32_ULT(v2$1, v3$1) then 1bv1 else 0bv1)) != 0bv32 && BV1_ZEXT32((if BV32_SLT(v0$2, v1$2) ==> BV32_ULT(v2$2, v3$2) then 1bv1 else 0bv1)) != 0bv32;
    v4$1 := $$input[v1$2];
    v4$2 := $$input[v1$1];
    v5$1 := $$input[v0$1];
    v5$2 := $$input[v0$2];
    assume BV1_ZEXT32((if BV32_SLT(v1$2, v0$1) ==> BV32_ULT(v4$1, v5$1) then 1bv1 else 0bv1)) != 0bv32 && BV1_ZEXT32((if BV32_SLT(v1$1, v0$2) ==> BV32_ULT(v4$2, v5$2) then 1bv1 else 0bv1)) != 0bv32;
    v6$1 := $$input[v1$1];
    v6$2 := $$input[v1$2];
    v7$1 := $$input[v0$2];
    v7$2 := $$input[v0$1];
    assume BV1_ZEXT32((if BV32_SLT(v1$1, v0$2) ==> BV32_ULT(v6$1, v7$1) then 1bv1 else 0bv1)) != 0bv32 && BV1_ZEXT32((if BV32_SLT(v1$2, v0$1) ==> BV32_ULT(v6$2, v7$2) then 1bv1 else 0bv1)) != 0bv32;
    $i.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_UGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_UGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_ULE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_ULE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b0 ==> BV32_SLE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b0 ==> BV32_SLE($i.0, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 8} true;
    v8 := BV32_ULT($i.0, $numKeys);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v8 && !v8;
    return;

  $truebb:
    assume {:partition} v8 && v8;
    v9$1 := $$keys[$i.0];
    v9$2 := $$keys[$i.0];
    v10$1 := $$input[v0$1];
    v10$2 := $$input[v0$2];
    v11$1 := BV32_UGE(v9$1, v10$1);
    v11$2 := BV32_UGE(v9$2, v10$2);
    p1$1 := (if v11$1 then v11$1 else p1$1);
    p1$2 := (if v11$2 then v11$2 else p1$2);
    v12$1 := (if p1$1 then $$keys[$i.0] else v12$1);
    v12$2 := (if p1$2 then $$keys[$i.0] else v12$2);
    v13$1 := (if p1$1 then $$input[v1$1] else v13$1);
    v13$2 := (if p1$2 then $$input[v1$2] else v13$2);
    v14$1 := (if p1$1 then BV32_ULE(v12$1, v13$1) else v14$1);
    v14$2 := (if p1$2 then BV32_ULE(v12$2, v13$2) else v14$2);
    p3$1 := (if p1$1 && v14$1 then v14$1 else p3$1);
    p3$2 := (if p1$2 && v14$2 then v14$2 else p3$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$output(p3$1, $i.0, v0$1, $$output[$i.0]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p3$2, $i.0);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$output(p3$2, $i.0, v0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[$i.0] := (if p3$1 then v0$1 else $$output[$i.0]);
    $$output[$i.0] := (if p3$2 then v0$2 else $$output[$i.0]);
    $i.0 := BV32_ADD($i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

const {:existential true} _b3: bool;

const _WATCHED_VALUE_$$keys: bv32;

procedure {:inline 1} _LOG_READ_$$keys(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$keys;



implementation {:inline 1} _LOG_READ_$$keys(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$keys := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$keys == _value then true else _READ_HAS_OCCURRED_$$keys);
    return;
}



procedure _CHECK_READ_$$keys(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "keys"} {:array "$$keys"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$keys && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$keys);
  requires {:source_name "keys"} {:array "$$keys"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$keys && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$keys: bool;

procedure {:inline 1} _LOG_WRITE_$$keys(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$keys, _WRITE_READ_BENIGN_FLAG_$$keys;



implementation {:inline 1} _LOG_WRITE_$$keys(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$keys := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$keys == _value then true else _WRITE_HAS_OCCURRED_$$keys);
    _WRITE_READ_BENIGN_FLAG_$$keys := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$keys == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$keys);
    return;
}



procedure _CHECK_WRITE_$$keys(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "keys"} {:array "$$keys"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$keys && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$keys != _value);
  requires {:source_name "keys"} {:array "$$keys"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$keys && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$keys != _value);
  requires {:source_name "keys"} {:array "$$keys"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$keys && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$keys(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$keys;



implementation {:inline 1} _LOG_ATOMIC_$$keys(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$keys := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$keys);
    return;
}



procedure _CHECK_ATOMIC_$$keys(_P: bool, _offset: bv32);
  requires {:source_name "keys"} {:array "$$keys"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$keys && _WATCHED_OFFSET == _offset);
  requires {:source_name "keys"} {:array "$$keys"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$keys && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$keys(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$keys;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$keys(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$keys := (if _P && _WRITE_HAS_OCCURRED_$$keys && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$keys);
    return;
}



const _WATCHED_VALUE_$$input: bv32;

procedure {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _READ_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_READ_$$input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$input);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$input: bool;

procedure {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$input, _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _WRITE_HAS_OCCURRED_$$input);
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



procedure _CHECK_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_ATOMIC_$$input(_P: bool, _offset: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



const _WATCHED_VALUE_$$output: bv32;

procedure {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _READ_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_READ_$$output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$output);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$output: bool;

procedure {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _WRITE_HAS_OCCURRED_$$output);
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



procedure _CHECK_WRITE_$$output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_ATOMIC_$$output(_P: bool, _offset: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
