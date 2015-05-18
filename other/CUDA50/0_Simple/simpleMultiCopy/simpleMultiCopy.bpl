type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "g_out"} {:global} $$g_out: [bv32]bv32;

axiom {:array_info "$$g_out"} {:global} {:elem_width 32} {:source_name "g_out"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$g_out: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$g_out: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$g_out: bool;

axiom {:array_info "$$g_in"} {:global} {:elem_width 32} {:source_name "g_in"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$g_in: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$g_in: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$g_in: bool;

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

procedure {:source_name "incKernel"} {:kernel} $_Z9incKernelPiS_ii($N: bv32, $inner_reps: bv32);
  requires !_READ_HAS_OCCURRED_$$g_out && !_WRITE_HAS_OCCURRED_$$g_out && !_ATOMIC_HAS_OCCURRED_$$g_out;
  requires !_READ_HAS_OCCURRED_$$g_in && !_WRITE_HAS_OCCURRED_$$g_in && !_ATOMIC_HAS_OCCURRED_$$g_in;
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
  modifies _WRITE_HAS_OCCURRED_$$g_out, _WRITE_READ_BENIGN_FLAG_$$g_out, _WRITE_READ_BENIGN_FLAG_$$g_out;



implementation {:source_name "incKernel"} {:kernel} $_Z9incKernelPiS_ii($N: bv32, $inner_reps: bv32)
{
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bv32;
  var v3$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_SLT(v0$1, $N);
    v1$2 := BV32_SLT(v0$2, $N);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p3$1 := false;
    p3$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    $i.0$1 := (if p0$1 then 0bv32 else $i.0$1);
    $i.0$2 := (if p0$2 then 0bv32 else $i.0$2);
    p1$1 := (if p0$1 then true else p1$1);
    p1$2 := (if p0$2 then true else p1$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $2;

  $2:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 2} p1$1 ==> true;
    v2$1 := (if p1$1 then BV32_SLT($i.0$1, $inner_reps) else v2$1);
    v2$2 := (if p1$2 then BV32_SLT($i.0$2, $inner_reps) else v2$2);
    p2$1 := false;
    p2$2 := false;
    p2$1 := (if p1$1 && v2$1 then v2$1 else p2$1);
    p2$2 := (if p1$2 && v2$2 then v2$2 else p2$2);
    p1$1 := (if p1$1 && !v2$1 then v2$1 else p1$1);
    p1$2 := (if p1$2 && !v2$2 then v2$2 else p1$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p2$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p2$2 then _HAVOC_bv32$2 else v3$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$g_out(p2$1, v0$1, BV32_ADD(v3$1, 1bv32), $$g_out[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_out(p2$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$g_out(p2$2, v0$2, BV32_ADD(v3$2, 1bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_out"} true;
    $$g_out[v0$1] := (if p2$1 then BV32_ADD(v3$1, 1bv32) else $$g_out[v0$1]);
    $$g_out[v0$2] := (if p2$2 then BV32_ADD(v3$2, 1bv32) else $$g_out[v0$2]);
    $i.0$1 := (if p2$1 then BV32_ADD($i.0$1, 1bv32) else $i.0$1);
    $i.0$2 := (if p2$2 then BV32_ADD($i.0$2, 1bv32) else $i.0$2);
    p1$1 := (if p2$1 then true else p1$1);
    p1$2 := (if p2$2 then true else p1$2);
    goto $2.backedge, $2.tail;

  $2.tail:
    assume !p1$1 && !p1$2;
    return;

  $2.backedge:
    assume {:backedge} p1$1 || p1$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $2;
}



axiom (if group_size_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 8192bv32 then 1bv1 else 0bv1) != 0bv1;

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

const _WATCHED_VALUE_$$g_out: bv32;

procedure {:inline 1} _LOG_READ_$$g_out(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$g_out;



implementation {:inline 1} _LOG_READ_$$g_out(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$g_out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_out == _value then true else _READ_HAS_OCCURRED_$$g_out);
    return;
}



procedure _CHECK_READ_$$g_out(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_out"} {:array "$$g_out"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$g_out && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$g_out);
  requires {:source_name "g_out"} {:array "$$g_out"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$g_out && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$g_out: bool;

procedure {:inline 1} _LOG_WRITE_$$g_out(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$g_out, _WRITE_READ_BENIGN_FLAG_$$g_out;



implementation {:inline 1} _LOG_WRITE_$$g_out(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$g_out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_out == _value then true else _WRITE_HAS_OCCURRED_$$g_out);
    _WRITE_READ_BENIGN_FLAG_$$g_out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_out == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$g_out);
    return;
}



procedure _CHECK_WRITE_$$g_out(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_out"} {:array "$$g_out"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$g_out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_out != _value);
  requires {:source_name "g_out"} {:array "$$g_out"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$g_out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_out != _value);
  requires {:source_name "g_out"} {:array "$$g_out"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$g_out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$g_out(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$g_out;



implementation {:inline 1} _LOG_ATOMIC_$$g_out(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$g_out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$g_out);
    return;
}



procedure _CHECK_ATOMIC_$$g_out(_P: bool, _offset: bv32);
  requires {:source_name "g_out"} {:array "$$g_out"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$g_out && _WATCHED_OFFSET == _offset);
  requires {:source_name "g_out"} {:array "$$g_out"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$g_out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_out(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$g_out;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_out(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$g_out := (if _P && _WRITE_HAS_OCCURRED_$$g_out && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$g_out);
    return;
}



const _WATCHED_VALUE_$$g_in: bv32;

procedure {:inline 1} _LOG_READ_$$g_in(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$g_in;



implementation {:inline 1} _LOG_READ_$$g_in(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$g_in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_in == _value then true else _READ_HAS_OCCURRED_$$g_in);
    return;
}



procedure _CHECK_READ_$$g_in(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_in"} {:array "$$g_in"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$g_in && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$g_in);
  requires {:source_name "g_in"} {:array "$$g_in"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$g_in && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$g_in: bool;

procedure {:inline 1} _LOG_WRITE_$$g_in(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$g_in, _WRITE_READ_BENIGN_FLAG_$$g_in;



implementation {:inline 1} _LOG_WRITE_$$g_in(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$g_in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_in == _value then true else _WRITE_HAS_OCCURRED_$$g_in);
    _WRITE_READ_BENIGN_FLAG_$$g_in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_in == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$g_in);
    return;
}



procedure _CHECK_WRITE_$$g_in(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_in"} {:array "$$g_in"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$g_in && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_in != _value);
  requires {:source_name "g_in"} {:array "$$g_in"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$g_in && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_in != _value);
  requires {:source_name "g_in"} {:array "$$g_in"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$g_in && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$g_in(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$g_in;



implementation {:inline 1} _LOG_ATOMIC_$$g_in(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$g_in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$g_in);
    return;
}



procedure _CHECK_ATOMIC_$$g_in(_P: bool, _offset: bv32);
  requires {:source_name "g_in"} {:array "$$g_in"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$g_in && _WATCHED_OFFSET == _offset);
  requires {:source_name "g_in"} {:array "$$g_in"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$g_in && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_in(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$g_in;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_in(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$g_in := (if _P && _WRITE_HAS_OCCURRED_$$g_in && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$g_in);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
