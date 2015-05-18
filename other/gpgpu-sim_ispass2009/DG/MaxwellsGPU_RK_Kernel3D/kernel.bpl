type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "g_resQ"} {:global} $$g_resQ: [bv32]bv32;

axiom {:array_info "$$g_resQ"} {:global} {:elem_width 32} {:source_name "g_resQ"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$g_resQ: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$g_resQ: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$g_resQ: bool;

axiom {:array_info "$$g_rhsQ"} {:global} {:elem_width 32} {:source_name "g_rhsQ"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$g_rhsQ: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$g_rhsQ: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$g_rhsQ: bool;

var {:source_name "g_Q"} {:global} $$g_Q: [bv32]bv32;

axiom {:array_info "$$g_Q"} {:global} {:elem_width 32} {:source_name "g_Q"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$g_Q: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$g_Q: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$g_Q: bool;

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

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "MaxwellsGPU_RK_Kernel3D"} {:kernel} $_Z23MaxwellsGPU_RK_Kernel3DiPfS_S_fff($Ntotal: bv32, $fa: bv32, $fb: bv32, $fdt: bv32);
  requires !_READ_HAS_OCCURRED_$$g_resQ && !_WRITE_HAS_OCCURRED_$$g_resQ && !_ATOMIC_HAS_OCCURRED_$$g_resQ;
  requires !_READ_HAS_OCCURRED_$$g_rhsQ && !_WRITE_HAS_OCCURRED_$$g_rhsQ && !_ATOMIC_HAS_OCCURRED_$$g_rhsQ;
  requires !_READ_HAS_OCCURRED_$$g_Q && !_WRITE_HAS_OCCURRED_$$g_Q && !_ATOMIC_HAS_OCCURRED_$$g_Q;
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
  modifies _READ_HAS_OCCURRED_$$g_resQ, _WRITE_HAS_OCCURRED_$$g_resQ, _WRITE_READ_BENIGN_FLAG_$$g_resQ, _WRITE_READ_BENIGN_FLAG_$$g_resQ, _READ_HAS_OCCURRED_$$g_Q, _WRITE_HAS_OCCURRED_$$g_Q, _WRITE_READ_BENIGN_FLAG_$$g_Q, _WRITE_READ_BENIGN_FLAG_$$g_Q;



implementation {:source_name "MaxwellsGPU_RK_Kernel3D"} {:kernel} $_Z23MaxwellsGPU_RK_Kernel3DiPfS_S_fff($Ntotal: bv32, $fa: bv32, $fb: bv32, $fdt: bv32)
{
  var v2$1: bv32;
  var v2$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
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
    v1$1 := BV32_SLT(v0$1, $Ntotal);
    v1$2 := BV32_SLT(v0$2, $Ntotal);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p0$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p0$2 then _HAVOC_bv32$2 else v2$2);
    call {:sourceloc} {:sourceloc_num 3} _LOG_READ_$$g_resQ(p0$1, v0$1, $$g_resQ[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 3} _CHECK_READ_$$g_resQ(p0$2, v0$2, $$g_resQ[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$g_resQ"} true;
    v3$1 := (if p0$1 then $$g_resQ[v0$1] else v3$1);
    v3$2 := (if p0$2 then $$g_resQ[v0$2] else v3$2);
    v4$1 := (if p0$1 then FADD32(FMUL32($fa, v3$1), FMUL32($fdt, v2$1)) else v4$1);
    v4$2 := (if p0$2 then FADD32(FMUL32($fa, v3$2), FMUL32($fdt, v2$2)) else v4$2);
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$g_resQ(p0$1, v0$1, v4$1, $$g_resQ[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_resQ(p0$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$g_resQ(p0$2, v0$2, v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_resQ"} true;
    $$g_resQ[v0$1] := (if p0$1 then v4$1 else $$g_resQ[v0$1]);
    $$g_resQ[v0$2] := (if p0$2 then v4$2 else $$g_resQ[v0$2]);
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$g_Q(p0$1, v0$1, $$g_Q[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$g_Q(p0$2, v0$2, $$g_Q[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$g_Q"} true;
    v5$1 := (if p0$1 then $$g_Q[v0$1] else v5$1);
    v5$2 := (if p0$2 then $$g_Q[v0$2] else v5$2);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$g_Q(p0$1, v0$1, FADD32(v5$1, FMUL32($fb, v4$1)), $$g_Q[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_Q(p0$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$g_Q(p0$2, v0$2, FADD32(v5$2, FMUL32($fb, v4$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_Q"} true;
    $$g_Q[v0$1] := (if p0$1 then FADD32(v5$1, FMUL32($fb, v4$1)) else $$g_Q[v0$1]);
    $$g_Q[v0$2] := (if p0$2 then FADD32(v5$2, FMUL32($fb, v4$2)) else $$g_Q[v0$2]);
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$g_resQ: bv32;

procedure {:inline 1} _LOG_READ_$$g_resQ(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$g_resQ;



implementation {:inline 1} _LOG_READ_$$g_resQ(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$g_resQ := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_resQ == _value then true else _READ_HAS_OCCURRED_$$g_resQ);
    return;
}



procedure _CHECK_READ_$$g_resQ(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_resQ"} {:array "$$g_resQ"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$g_resQ && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$g_resQ);
  requires {:source_name "g_resQ"} {:array "$$g_resQ"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$g_resQ && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$g_resQ: bool;

procedure {:inline 1} _LOG_WRITE_$$g_resQ(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$g_resQ, _WRITE_READ_BENIGN_FLAG_$$g_resQ;



implementation {:inline 1} _LOG_WRITE_$$g_resQ(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$g_resQ := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_resQ == _value then true else _WRITE_HAS_OCCURRED_$$g_resQ);
    _WRITE_READ_BENIGN_FLAG_$$g_resQ := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_resQ == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$g_resQ);
    return;
}



procedure _CHECK_WRITE_$$g_resQ(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_resQ"} {:array "$$g_resQ"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$g_resQ && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_resQ != _value);
  requires {:source_name "g_resQ"} {:array "$$g_resQ"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$g_resQ && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_resQ != _value);
  requires {:source_name "g_resQ"} {:array "$$g_resQ"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$g_resQ && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$g_resQ(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$g_resQ;



implementation {:inline 1} _LOG_ATOMIC_$$g_resQ(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$g_resQ := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$g_resQ);
    return;
}



procedure _CHECK_ATOMIC_$$g_resQ(_P: bool, _offset: bv32);
  requires {:source_name "g_resQ"} {:array "$$g_resQ"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$g_resQ && _WATCHED_OFFSET == _offset);
  requires {:source_name "g_resQ"} {:array "$$g_resQ"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$g_resQ && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_resQ(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$g_resQ;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_resQ(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$g_resQ := (if _P && _WRITE_HAS_OCCURRED_$$g_resQ && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$g_resQ);
    return;
}



const _WATCHED_VALUE_$$g_rhsQ: bv32;

procedure {:inline 1} _LOG_READ_$$g_rhsQ(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$g_rhsQ;



implementation {:inline 1} _LOG_READ_$$g_rhsQ(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$g_rhsQ := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_rhsQ == _value then true else _READ_HAS_OCCURRED_$$g_rhsQ);
    return;
}



procedure _CHECK_READ_$$g_rhsQ(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_rhsQ"} {:array "$$g_rhsQ"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$g_rhsQ);
  requires {:source_name "g_rhsQ"} {:array "$$g_rhsQ"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$g_rhsQ: bool;

procedure {:inline 1} _LOG_WRITE_$$g_rhsQ(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$g_rhsQ, _WRITE_READ_BENIGN_FLAG_$$g_rhsQ;



implementation {:inline 1} _LOG_WRITE_$$g_rhsQ(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$g_rhsQ := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_rhsQ == _value then true else _WRITE_HAS_OCCURRED_$$g_rhsQ);
    _WRITE_READ_BENIGN_FLAG_$$g_rhsQ := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_rhsQ == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$g_rhsQ);
    return;
}



procedure _CHECK_WRITE_$$g_rhsQ(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_rhsQ"} {:array "$$g_rhsQ"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_rhsQ != _value);
  requires {:source_name "g_rhsQ"} {:array "$$g_rhsQ"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_rhsQ != _value);
  requires {:source_name "g_rhsQ"} {:array "$$g_rhsQ"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$g_rhsQ(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$g_rhsQ;



implementation {:inline 1} _LOG_ATOMIC_$$g_rhsQ(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$g_rhsQ := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$g_rhsQ);
    return;
}



procedure _CHECK_ATOMIC_$$g_rhsQ(_P: bool, _offset: bv32);
  requires {:source_name "g_rhsQ"} {:array "$$g_rhsQ"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset);
  requires {:source_name "g_rhsQ"} {:array "$$g_rhsQ"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_rhsQ(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$g_rhsQ;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_rhsQ(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$g_rhsQ := (if _P && _WRITE_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$g_rhsQ);
    return;
}



const _WATCHED_VALUE_$$g_Q: bv32;

procedure {:inline 1} _LOG_READ_$$g_Q(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$g_Q;



implementation {:inline 1} _LOG_READ_$$g_Q(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$g_Q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_Q == _value then true else _READ_HAS_OCCURRED_$$g_Q);
    return;
}



procedure _CHECK_READ_$$g_Q(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_Q"} {:array "$$g_Q"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$g_Q && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$g_Q);
  requires {:source_name "g_Q"} {:array "$$g_Q"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$g_Q && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$g_Q: bool;

procedure {:inline 1} _LOG_WRITE_$$g_Q(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$g_Q, _WRITE_READ_BENIGN_FLAG_$$g_Q;



implementation {:inline 1} _LOG_WRITE_$$g_Q(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$g_Q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_Q == _value then true else _WRITE_HAS_OCCURRED_$$g_Q);
    _WRITE_READ_BENIGN_FLAG_$$g_Q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_Q == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$g_Q);
    return;
}



procedure _CHECK_WRITE_$$g_Q(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_Q"} {:array "$$g_Q"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$g_Q && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_Q != _value);
  requires {:source_name "g_Q"} {:array "$$g_Q"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$g_Q && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_Q != _value);
  requires {:source_name "g_Q"} {:array "$$g_Q"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$g_Q && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$g_Q(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$g_Q;



implementation {:inline 1} _LOG_ATOMIC_$$g_Q(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$g_Q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$g_Q);
    return;
}



procedure _CHECK_ATOMIC_$$g_Q(_P: bool, _offset: bv32);
  requires {:source_name "g_Q"} {:array "$$g_Q"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$g_Q && _WATCHED_OFFSET == _offset);
  requires {:source_name "g_Q"} {:array "$$g_Q"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$g_Q && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_Q(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$g_Q;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_Q(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$g_Q := (if _P && _WRITE_HAS_OCCURRED_$$g_Q && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$g_Q);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
