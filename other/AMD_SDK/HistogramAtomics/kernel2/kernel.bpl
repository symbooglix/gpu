type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "Histogram"} {:global} $$Histogram: [bv32]bv32;

axiom {:array_info "$$Histogram"} {:global} {:elem_width 32} {:source_name "Histogram"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Histogram: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Histogram: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Histogram: bool;

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

procedure {:source_name "reduceKernel"} {:kernel} $reduceKernel($nSubHists: bv32);
  requires !_READ_HAS_OCCURRED_$$Histogram && !_WRITE_HAS_OCCURRED_$$Histogram && !_ATOMIC_HAS_OCCURRED_$$Histogram;
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
  modifies _WRITE_HAS_OCCURRED_$$Histogram, _WRITE_READ_BENIGN_FLAG_$$Histogram, _WRITE_READ_BENIGN_FLAG_$$Histogram, _READ_HAS_OCCURRED_$$Histogram;



implementation {:source_name "reduceKernel"} {:kernel} $reduceKernel($nSubHists: bv32)
{
  var $bin.0$1: bv32;
  var $bin.0$2: bv32;
  var $i.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1: bool;
  var v2$1: bv32;
  var v2$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    $bin.0$1, $i.0 := 0bv32, 0bv32;
    $bin.0$2 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v1 := BV32_ULT($i.0, $nSubHists);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v1 && !v1;
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$Histogram(true, v0$1, $bin.0$1, $$Histogram[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$Histogram(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$Histogram(true, v0$2, $bin.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$Histogram"} true;
    $$Histogram[v0$1] := $bin.0$1;
    $$Histogram[v0$2] := $bin.0$2;
    return;

  $truebb:
    assume {:partition} v1 && v1;
    call {:sourceloc} {:sourceloc_num 3} _LOG_READ_$$Histogram(true, BV32_ADD(BV32_MUL($i.0, 256bv32), v0$1), $$Histogram[BV32_ADD(BV32_MUL($i.0, 256bv32), v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 3} _CHECK_READ_$$Histogram(true, BV32_ADD(BV32_MUL($i.0, 256bv32), v0$2), $$Histogram[BV32_ADD(BV32_MUL($i.0, 256bv32), v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$Histogram"} true;
    v2$1 := $$Histogram[BV32_ADD(BV32_MUL($i.0, 256bv32), v0$1)];
    v2$2 := $$Histogram[BV32_ADD(BV32_MUL($i.0, 256bv32), v0$2)];
    $bin.0$1, $i.0 := BV32_ADD($bin.0$1, v2$1), BV32_ADD($i.0, 1bv32);
    $bin.0$2 := BV32_ADD($bin.0$2, v2$2);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$Histogram: bv32;

procedure {:inline 1} _LOG_READ_$$Histogram(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$Histogram;



implementation {:inline 1} _LOG_READ_$$Histogram(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$Histogram := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Histogram == _value then true else _READ_HAS_OCCURRED_$$Histogram);
    return;
}



procedure _CHECK_READ_$$Histogram(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Histogram"} {:array "$$Histogram"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$Histogram);
  requires {:source_name "Histogram"} {:array "$$Histogram"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$Histogram: bool;

procedure {:inline 1} _LOG_WRITE_$$Histogram(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$Histogram, _WRITE_READ_BENIGN_FLAG_$$Histogram;



implementation {:inline 1} _LOG_WRITE_$$Histogram(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$Histogram := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Histogram == _value then true else _WRITE_HAS_OCCURRED_$$Histogram);
    _WRITE_READ_BENIGN_FLAG_$$Histogram := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Histogram == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$Histogram);
    return;
}



procedure _CHECK_WRITE_$$Histogram(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Histogram"} {:array "$$Histogram"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Histogram != _value);
  requires {:source_name "Histogram"} {:array "$$Histogram"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Histogram != _value);
  requires {:source_name "Histogram"} {:array "$$Histogram"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$Histogram(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$Histogram;



implementation {:inline 1} _LOG_ATOMIC_$$Histogram(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$Histogram := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$Histogram);
    return;
}



procedure _CHECK_ATOMIC_$$Histogram(_P: bool, _offset: bv32);
  requires {:source_name "Histogram"} {:array "$$Histogram"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset);
  requires {:source_name "Histogram"} {:array "$$Histogram"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Histogram(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$Histogram;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Histogram(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$Histogram := (if _P && _WRITE_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$Histogram);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
