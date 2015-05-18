type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$va"} {:global} {:elem_width 32} {:source_name "va"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$va: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$va: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$va: bool;

axiom {:array_info "$$vb"} {:global} {:elem_width 32} {:source_name "vb"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$vb: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$vb: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$vb: bool;

var {:source_name "vresult"} {:global} $$vresult: [bv32]bv32;

axiom {:array_info "$$vresult"} {:global} {:elem_width 32} {:source_name "vresult"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$vresult: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$vresult: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$vresult: bool;

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

function FADD32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "mxm_amp_simple"} {:kernel} $_Z14mxm_amp_simplePKfS0_Pf();
  requires !_READ_HAS_OCCURRED_$$va && !_WRITE_HAS_OCCURRED_$$va && !_ATOMIC_HAS_OCCURRED_$$va;
  requires !_READ_HAS_OCCURRED_$$vb && !_WRITE_HAS_OCCURRED_$$vb && !_ATOMIC_HAS_OCCURRED_$$vb;
  requires !_READ_HAS_OCCURRED_$$vresult && !_WRITE_HAS_OCCURRED_$$vresult && !_ATOMIC_HAS_OCCURRED_$$vresult;
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
  modifies _WRITE_HAS_OCCURRED_$$vresult, _WRITE_READ_BENIGN_FLAG_$$vresult, _WRITE_READ_BENIGN_FLAG_$$vresult;



implementation {:source_name "mxm_amp_simple"} {:kernel} $_Z14mxm_amp_simplePKfS0_Pf()
{
  var $result.0$1: bv32;
  var $result.0$2: bv32;
  var $i.0: bv32;
  var v0: bool;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;


  $0:
    $result.0$1, $i.0 := 0bv32, 0bv32;
    $result.0$2 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v0 := BV32_SLT($i.0, 256bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v0 && !v0;
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$vresult(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1), 256bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), $result.0$1, $$vresult[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1), 256bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$vresult(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2), 256bv32), BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$vresult(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2), 256bv32), BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2)), $result.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$vresult"} true;
    $$vresult[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1), 256bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1))] := $result.0$1;
    $$vresult[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2), 256bv32), BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2))] := $result.0$2;
    return;

  $truebb:
    assume {:partition} v0 && v0;
    havoc v1$1, v1$2;
    havoc v2$1, v2$2;
    $result.0$1, $i.0 := FADD32($result.0$1, FMUL32(v1$1, v2$1)), BV32_ADD($i.0, 1bv32);
    $result.0$2 := FADD32($result.0$2, FMUL32(v1$2, v2$2));
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 4bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$va: bv32;

procedure {:inline 1} _LOG_READ_$$va(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$va;



implementation {:inline 1} _LOG_READ_$$va(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$va := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$va == _value then true else _READ_HAS_OCCURRED_$$va);
    return;
}



procedure _CHECK_READ_$$va(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "va"} {:array "$$va"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$va);
  requires {:source_name "va"} {:array "$$va"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$va: bool;

procedure {:inline 1} _LOG_WRITE_$$va(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$va, _WRITE_READ_BENIGN_FLAG_$$va;



implementation {:inline 1} _LOG_WRITE_$$va(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$va := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$va == _value then true else _WRITE_HAS_OCCURRED_$$va);
    _WRITE_READ_BENIGN_FLAG_$$va := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$va == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$va);
    return;
}



procedure _CHECK_WRITE_$$va(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "va"} {:array "$$va"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$va != _value);
  requires {:source_name "va"} {:array "$$va"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$va != _value);
  requires {:source_name "va"} {:array "$$va"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$va(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$va;



implementation {:inline 1} _LOG_ATOMIC_$$va(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$va := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$va);
    return;
}



procedure _CHECK_ATOMIC_$$va(_P: bool, _offset: bv32);
  requires {:source_name "va"} {:array "$$va"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset);
  requires {:source_name "va"} {:array "$$va"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$va(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$va;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$va(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$va := (if _P && _WRITE_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$va);
    return;
}



const _WATCHED_VALUE_$$vb: bv32;

procedure {:inline 1} _LOG_READ_$$vb(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$vb;



implementation {:inline 1} _LOG_READ_$$vb(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$vb := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vb == _value then true else _READ_HAS_OCCURRED_$$vb);
    return;
}



procedure _CHECK_READ_$$vb(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vb"} {:array "$$vb"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$vb);
  requires {:source_name "vb"} {:array "$$vb"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$vb: bool;

procedure {:inline 1} _LOG_WRITE_$$vb(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$vb, _WRITE_READ_BENIGN_FLAG_$$vb;



implementation {:inline 1} _LOG_WRITE_$$vb(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$vb := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vb == _value then true else _WRITE_HAS_OCCURRED_$$vb);
    _WRITE_READ_BENIGN_FLAG_$$vb := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vb == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$vb);
    return;
}



procedure _CHECK_WRITE_$$vb(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vb"} {:array "$$vb"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vb != _value);
  requires {:source_name "vb"} {:array "$$vb"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vb != _value);
  requires {:source_name "vb"} {:array "$$vb"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$vb(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$vb;



implementation {:inline 1} _LOG_ATOMIC_$$vb(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$vb := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$vb);
    return;
}



procedure _CHECK_ATOMIC_$$vb(_P: bool, _offset: bv32);
  requires {:source_name "vb"} {:array "$$vb"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset);
  requires {:source_name "vb"} {:array "$$vb"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vb(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$vb;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vb(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$vb := (if _P && _WRITE_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$vb);
    return;
}



const _WATCHED_VALUE_$$vresult: bv32;

procedure {:inline 1} _LOG_READ_$$vresult(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$vresult;



implementation {:inline 1} _LOG_READ_$$vresult(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$vresult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vresult == _value then true else _READ_HAS_OCCURRED_$$vresult);
    return;
}



procedure _CHECK_READ_$$vresult(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vresult"} {:array "$$vresult"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$vresult);
  requires {:source_name "vresult"} {:array "$$vresult"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$vresult: bool;

procedure {:inline 1} _LOG_WRITE_$$vresult(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$vresult, _WRITE_READ_BENIGN_FLAG_$$vresult;



implementation {:inline 1} _LOG_WRITE_$$vresult(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$vresult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vresult == _value then true else _WRITE_HAS_OCCURRED_$$vresult);
    _WRITE_READ_BENIGN_FLAG_$$vresult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vresult == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$vresult);
    return;
}



procedure _CHECK_WRITE_$$vresult(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vresult"} {:array "$$vresult"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vresult != _value);
  requires {:source_name "vresult"} {:array "$$vresult"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vresult != _value);
  requires {:source_name "vresult"} {:array "$$vresult"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$vresult(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$vresult;



implementation {:inline 1} _LOG_ATOMIC_$$vresult(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$vresult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$vresult);
    return;
}



procedure _CHECK_ATOMIC_$$vresult(_P: bool, _offset: bv32);
  requires {:source_name "vresult"} {:array "$$vresult"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset);
  requires {:source_name "vresult"} {:array "$$vresult"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vresult(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$vresult;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vresult(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$vresult := (if _P && _WRITE_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$vresult);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
