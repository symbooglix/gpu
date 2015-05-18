type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$memA"} {:global} {:elem_width 32} {:source_name "memA"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$memA: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$memA: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$memA: bool;

axiom {:array_info "$$memB"} {:global} {:elem_width 32} {:source_name "memB"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$memB: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$memB: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$memB: bool;

var {:source_name "memC"} {:global} $$memC: [bv32]bv32;

axiom {:array_info "$$memC"} {:global} {:elem_width 32} {:source_name "memC"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$memC: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$memC: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$memC: bool;

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

function FADD32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "Triad"} {:kernel} $Triad();
  requires !_READ_HAS_OCCURRED_$$memA && !_WRITE_HAS_OCCURRED_$$memA && !_ATOMIC_HAS_OCCURRED_$$memA;
  requires !_READ_HAS_OCCURRED_$$memB && !_WRITE_HAS_OCCURRED_$$memB && !_ATOMIC_HAS_OCCURRED_$$memB;
  requires !_READ_HAS_OCCURRED_$$memC && !_WRITE_HAS_OCCURRED_$$memC && !_ATOMIC_HAS_OCCURRED_$$memC;
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
  modifies _WRITE_HAS_OCCURRED_$$memC, _WRITE_READ_BENIGN_FLAG_$$memC, _WRITE_READ_BENIGN_FLAG_$$memC;



implementation {:source_name "Triad"} {:kernel} $Triad()
{
  var v1$1: bv32;
  var v1$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    havoc v1$1, v1$2;
    havoc v2$1, v2$2;
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$memC(true, v0$1, FADD32(v1$1, v2$1), $$memC[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$memC(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$memC(true, v0$2, FADD32(v1$2, v2$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$memC"} true;
    $$memC[v0$1] := FADD32(v1$1, v2$1);
    $$memC[v0$2] := FADD32(v1$2, v2$2);
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 1024bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1024bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$memA: bv32;

procedure {:inline 1} _LOG_READ_$$memA(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$memA;



implementation {:inline 1} _LOG_READ_$$memA(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$memA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memA == _value then true else _READ_HAS_OCCURRED_$$memA);
    return;
}



procedure _CHECK_READ_$$memA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "memA"} {:array "$$memA"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$memA && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$memA);
  requires {:source_name "memA"} {:array "$$memA"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$memA && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$memA: bool;

procedure {:inline 1} _LOG_WRITE_$$memA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$memA, _WRITE_READ_BENIGN_FLAG_$$memA;



implementation {:inline 1} _LOG_WRITE_$$memA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$memA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memA == _value then true else _WRITE_HAS_OCCURRED_$$memA);
    _WRITE_READ_BENIGN_FLAG_$$memA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memA == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$memA);
    return;
}



procedure _CHECK_WRITE_$$memA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "memA"} {:array "$$memA"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$memA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memA != _value);
  requires {:source_name "memA"} {:array "$$memA"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$memA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memA != _value);
  requires {:source_name "memA"} {:array "$$memA"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$memA && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$memA(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$memA;



implementation {:inline 1} _LOG_ATOMIC_$$memA(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$memA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$memA);
    return;
}



procedure _CHECK_ATOMIC_$$memA(_P: bool, _offset: bv32);
  requires {:source_name "memA"} {:array "$$memA"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$memA && _WATCHED_OFFSET == _offset);
  requires {:source_name "memA"} {:array "$$memA"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$memA && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$memA(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$memA;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$memA(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$memA := (if _P && _WRITE_HAS_OCCURRED_$$memA && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$memA);
    return;
}



const _WATCHED_VALUE_$$memB: bv32;

procedure {:inline 1} _LOG_READ_$$memB(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$memB;



implementation {:inline 1} _LOG_READ_$$memB(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$memB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memB == _value then true else _READ_HAS_OCCURRED_$$memB);
    return;
}



procedure _CHECK_READ_$$memB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "memB"} {:array "$$memB"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$memB && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$memB);
  requires {:source_name "memB"} {:array "$$memB"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$memB && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$memB: bool;

procedure {:inline 1} _LOG_WRITE_$$memB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$memB, _WRITE_READ_BENIGN_FLAG_$$memB;



implementation {:inline 1} _LOG_WRITE_$$memB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$memB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memB == _value then true else _WRITE_HAS_OCCURRED_$$memB);
    _WRITE_READ_BENIGN_FLAG_$$memB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memB == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$memB);
    return;
}



procedure _CHECK_WRITE_$$memB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "memB"} {:array "$$memB"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$memB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memB != _value);
  requires {:source_name "memB"} {:array "$$memB"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$memB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memB != _value);
  requires {:source_name "memB"} {:array "$$memB"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$memB && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$memB(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$memB;



implementation {:inline 1} _LOG_ATOMIC_$$memB(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$memB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$memB);
    return;
}



procedure _CHECK_ATOMIC_$$memB(_P: bool, _offset: bv32);
  requires {:source_name "memB"} {:array "$$memB"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$memB && _WATCHED_OFFSET == _offset);
  requires {:source_name "memB"} {:array "$$memB"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$memB && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$memB(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$memB;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$memB(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$memB := (if _P && _WRITE_HAS_OCCURRED_$$memB && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$memB);
    return;
}



const _WATCHED_VALUE_$$memC: bv32;

procedure {:inline 1} _LOG_READ_$$memC(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$memC;



implementation {:inline 1} _LOG_READ_$$memC(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$memC := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memC == _value then true else _READ_HAS_OCCURRED_$$memC);
    return;
}



procedure _CHECK_READ_$$memC(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "memC"} {:array "$$memC"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$memC && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$memC);
  requires {:source_name "memC"} {:array "$$memC"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$memC && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$memC: bool;

procedure {:inline 1} _LOG_WRITE_$$memC(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$memC, _WRITE_READ_BENIGN_FLAG_$$memC;



implementation {:inline 1} _LOG_WRITE_$$memC(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$memC := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memC == _value then true else _WRITE_HAS_OCCURRED_$$memC);
    _WRITE_READ_BENIGN_FLAG_$$memC := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memC == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$memC);
    return;
}



procedure _CHECK_WRITE_$$memC(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "memC"} {:array "$$memC"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$memC && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memC != _value);
  requires {:source_name "memC"} {:array "$$memC"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$memC && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$memC != _value);
  requires {:source_name "memC"} {:array "$$memC"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$memC && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$memC(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$memC;



implementation {:inline 1} _LOG_ATOMIC_$$memC(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$memC := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$memC);
    return;
}



procedure _CHECK_ATOMIC_$$memC(_P: bool, _offset: bv32);
  requires {:source_name "memC"} {:array "$$memC"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$memC && _WATCHED_OFFSET == _offset);
  requires {:source_name "memC"} {:array "$$memC"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$memC && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$memC(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$memC;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$memC(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$memC := (if _P && _WRITE_HAS_OCCURRED_$$memC && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$memC);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
