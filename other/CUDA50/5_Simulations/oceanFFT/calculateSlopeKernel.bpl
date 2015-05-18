type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$h"} {:global} {:elem_width 32} {:source_name "h"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$h: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$h: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$h: bool;

var {:source_name "slopeOut"} {:global} $$slopeOut: [bv32]bv32;

axiom {:array_info "$$slopeOut"} {:global} {:elem_width 32} {:source_name "slopeOut"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$slopeOut: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$slopeOut: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$slopeOut: bool;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$slope"} {:elem_width 32} {:source_name "slope"} {:source_elem_width 64} {:source_dimensions "1"} true;

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

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "calculateSlopeKernel"} {:kernel} $_Z20calculateSlopeKernelPfP6float2jj($width: bv32, $height: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 256bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $height == 256bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$h && !_WRITE_HAS_OCCURRED_$$h && !_ATOMIC_HAS_OCCURRED_$$h;
  requires !_READ_HAS_OCCURRED_$$slopeOut && !_WRITE_HAS_OCCURRED_$$slopeOut && !_ATOMIC_HAS_OCCURRED_$$slopeOut;
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
  modifies _WRITE_HAS_OCCURRED_$$slopeOut, _WRITE_READ_BENIGN_FLAG_$$slopeOut, _WRITE_READ_BENIGN_FLAG_$$slopeOut;



implementation {:source_name "calculateSlopeKernel"} {:kernel} $_Z20calculateSlopeKernelPfP6float2jj($width: bv32, $height: bv32)
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
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
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
  var p6$1: bool;
  var p6$2: bool;
  var p7$1: bool;
  var p7$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2);
    v2$1 := BV32_ADD(BV32_MUL(v1$1, $width), v0$1);
    v2$2 := BV32_ADD(BV32_MUL(v1$2, $width), v0$2);
    $$0$0bv32$1 := 0bv32;
    $$0$0bv32$2 := 0bv32;
    $$0$1bv32$1 := 0bv32;
    $$0$1bv32$2 := 0bv32;
    v3$1 := $$0$0bv32$1;
    v3$2 := $$0$0bv32$2;
    v4$1 := $$0$1bv32$1;
    v4$2 := $$0$1bv32$2;
    $$slope$0bv32$1 := v3$1;
    $$slope$0bv32$2 := v3$2;
    $$slope$1bv32$1 := v4$1;
    $$slope$1bv32$2 := v4$2;
    v5$1 := BV32_UGT(v0$1, 0bv32);
    v5$2 := BV32_UGT(v0$2, 0bv32);
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
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    p0$1 := (if v5$1 then v5$1 else p0$1);
    p0$2 := (if v5$2 then v5$2 else p0$2);
    v6$1 := (if p0$1 then BV32_UGT(v1$1, 0bv32) else v6$1);
    v6$2 := (if p0$2 then BV32_UGT(v1$2, 0bv32) else v6$2);
    p1$1 := (if p0$1 && v6$1 then v6$1 else p1$1);
    p1$2 := (if p0$2 && v6$2 then v6$2 else p1$2);
    v7$1 := (if p1$1 then BV32_ULT(v0$1, BV32_SUB($width, 1bv32)) else v7$1);
    v7$2 := (if p1$2 then BV32_ULT(v0$2, BV32_SUB($width, 1bv32)) else v7$2);
    p2$1 := (if p1$1 && v7$1 then v7$1 else p2$1);
    p2$2 := (if p1$2 && v7$2 then v7$2 else p2$2);
    v8$1 := (if p2$1 then BV32_ULT(v1$1, BV32_SUB($height, 1bv32)) else v8$1);
    v8$2 := (if p2$2 then BV32_ULT(v1$2, BV32_SUB($height, 1bv32)) else v8$2);
    p3$1 := (if p2$1 && v8$1 then v8$1 else p3$1);
    p3$2 := (if p2$2 && v8$2 then v8$2 else p3$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v9$1 := (if p3$1 then _HAVOC_bv32$1 else v9$1);
    v9$2 := (if p3$2 then _HAVOC_bv32$2 else v9$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v10$1 := (if p3$1 then _HAVOC_bv32$1 else v10$1);
    v10$2 := (if p3$2 then _HAVOC_bv32$2 else v10$2);
    $$slope$0bv32$1 := (if p3$1 then FSUB32(v9$1, v10$1) else $$slope$0bv32$1);
    $$slope$0bv32$2 := (if p3$2 then FSUB32(v9$2, v10$2) else $$slope$0bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v11$1 := (if p3$1 then _HAVOC_bv32$1 else v11$1);
    v11$2 := (if p3$2 then _HAVOC_bv32$2 else v11$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v12$1 := (if p3$1 then _HAVOC_bv32$1 else v12$1);
    v12$2 := (if p3$2 then _HAVOC_bv32$2 else v12$2);
    $$slope$1bv32$1 := (if p3$1 then FSUB32(v11$1, v12$1) else $$slope$1bv32$1);
    $$slope$1bv32$2 := (if p3$2 then FSUB32(v11$2, v12$2) else $$slope$1bv32$2);
    v13$1 := $$slope$0bv32$1;
    v13$2 := $$slope$0bv32$2;
    call {:sourceloc} {:sourceloc_num 21} _LOG_WRITE_$$slopeOut(true, BV32_MUL(v2$1, 2bv32), v13$1, $$slopeOut[BV32_MUL(v2$1, 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$slopeOut(true, BV32_MUL(v2$2, 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 21} _CHECK_WRITE_$$slopeOut(true, BV32_MUL(v2$2, 2bv32), v13$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$slopeOut"} true;
    $$slopeOut[BV32_MUL(v2$1, 2bv32)] := v13$1;
    $$slopeOut[BV32_MUL(v2$2, 2bv32)] := v13$2;
    v14$1 := $$slope$1bv32$1;
    v14$2 := $$slope$1bv32$2;
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$slopeOut(true, BV32_ADD(BV32_MUL(v2$1, 2bv32), 1bv32), v14$1, $$slopeOut[BV32_ADD(BV32_MUL(v2$1, 2bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$slopeOut(true, BV32_ADD(BV32_MUL(v2$2, 2bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$slopeOut(true, BV32_ADD(BV32_MUL(v2$2, 2bv32), 1bv32), v14$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$slopeOut"} true;
    $$slopeOut[BV32_ADD(BV32_MUL(v2$1, 2bv32), 1bv32)] := v14$1;
    $$slopeOut[BV32_ADD(BV32_MUL(v2$2, 2bv32), 1bv32)] := v14$2;
    return;
}



axiom (if group_size_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$0$0bv32$1: bv32;

var $$0$0bv32$2: bv32;

var $$0$1bv32$1: bv32;

var $$0$1bv32$2: bv32;

var $$slope$0bv32$1: bv32;

var $$slope$0bv32$2: bv32;

var $$slope$1bv32$1: bv32;

var $$slope$1bv32$2: bv32;

const _WATCHED_VALUE_$$h: bv32;

procedure {:inline 1} _LOG_READ_$$h(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$h;



implementation {:inline 1} _LOG_READ_$$h(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$h := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$h == _value then true else _READ_HAS_OCCURRED_$$h);
    return;
}



procedure _CHECK_READ_$$h(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "h"} {:array "$$h"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$h && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$h);
  requires {:source_name "h"} {:array "$$h"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$h && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$h: bool;

procedure {:inline 1} _LOG_WRITE_$$h(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$h, _WRITE_READ_BENIGN_FLAG_$$h;



implementation {:inline 1} _LOG_WRITE_$$h(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$h := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$h == _value then true else _WRITE_HAS_OCCURRED_$$h);
    _WRITE_READ_BENIGN_FLAG_$$h := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$h == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$h);
    return;
}



procedure _CHECK_WRITE_$$h(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "h"} {:array "$$h"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$h && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$h != _value);
  requires {:source_name "h"} {:array "$$h"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$h && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$h != _value);
  requires {:source_name "h"} {:array "$$h"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$h && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$h(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$h;



implementation {:inline 1} _LOG_ATOMIC_$$h(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$h := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$h);
    return;
}



procedure _CHECK_ATOMIC_$$h(_P: bool, _offset: bv32);
  requires {:source_name "h"} {:array "$$h"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$h && _WATCHED_OFFSET == _offset);
  requires {:source_name "h"} {:array "$$h"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$h && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$h(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$h;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$h(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$h := (if _P && _WRITE_HAS_OCCURRED_$$h && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$h);
    return;
}



const _WATCHED_VALUE_$$slopeOut: bv32;

procedure {:inline 1} _LOG_READ_$$slopeOut(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$slopeOut;



implementation {:inline 1} _LOG_READ_$$slopeOut(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$slopeOut := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$slopeOut == _value then true else _READ_HAS_OCCURRED_$$slopeOut);
    return;
}



procedure _CHECK_READ_$$slopeOut(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "slopeOut"} {:array "$$slopeOut"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$slopeOut && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$slopeOut);
  requires {:source_name "slopeOut"} {:array "$$slopeOut"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$slopeOut && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$slopeOut: bool;

procedure {:inline 1} _LOG_WRITE_$$slopeOut(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$slopeOut, _WRITE_READ_BENIGN_FLAG_$$slopeOut;



implementation {:inline 1} _LOG_WRITE_$$slopeOut(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$slopeOut := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$slopeOut == _value then true else _WRITE_HAS_OCCURRED_$$slopeOut);
    _WRITE_READ_BENIGN_FLAG_$$slopeOut := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$slopeOut == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$slopeOut);
    return;
}



procedure _CHECK_WRITE_$$slopeOut(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "slopeOut"} {:array "$$slopeOut"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$slopeOut && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$slopeOut != _value);
  requires {:source_name "slopeOut"} {:array "$$slopeOut"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$slopeOut && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$slopeOut != _value);
  requires {:source_name "slopeOut"} {:array "$$slopeOut"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$slopeOut && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$slopeOut(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$slopeOut;



implementation {:inline 1} _LOG_ATOMIC_$$slopeOut(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$slopeOut := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$slopeOut);
    return;
}



procedure _CHECK_ATOMIC_$$slopeOut(_P: bool, _offset: bv32);
  requires {:source_name "slopeOut"} {:array "$$slopeOut"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$slopeOut && _WATCHED_OFFSET == _offset);
  requires {:source_name "slopeOut"} {:array "$$slopeOut"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$slopeOut && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$slopeOut(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$slopeOut;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$slopeOut(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$slopeOut := (if _P && _WRITE_HAS_OCCURRED_$$slopeOut && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$slopeOut);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
