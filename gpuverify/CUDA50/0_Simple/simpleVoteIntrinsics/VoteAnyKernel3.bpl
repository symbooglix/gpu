type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "info"} {:global} $$info: [bv32]bv8;

axiom {:array_info "$$info"} {:global} {:elem_width 8} {:source_name "info"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$info: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$info: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$info: bool;

const _WATCHED_OFFSET: bv32;

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

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

function {:bvbuiltin "zero_extend 7"} BV1_ZEXT8(bv1) : bv8;

procedure {:source_name "VoteAnyKernel3"} {:kernel} $_Z14VoteAnyKernel3Pbi($warp_size: bv32);
  requires !_READ_HAS_OCCURRED_$$info && !_WRITE_HAS_OCCURRED_$$info && !_ATOMIC_HAS_OCCURRED_$$info;
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
  modifies _WRITE_HAS_OCCURRED_$$info, _WRITE_READ_BENIGN_FLAG_$$info, _WRITE_READ_BENIGN_FLAG_$$info;



implementation {:source_name "VoteAnyKernel3"} {:kernel} $_Z14VoteAnyKernel3Pbi($warp_size: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bool;
  var v3$2: bool;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;


  $0:
    v0$1 := BV32_MUL(local_id_x$1, 3bv32);
    v0$2 := BV32_MUL(local_id_x$2, 3bv32);
    call {:sourceloc_num 1} v1$1, v1$2 := $_Z3anyj(BV1_ZEXT32((if BV32_SGE(local_id_x$1, BV32_SDIV(BV32_MUL($warp_size, 3bv32), 2bv32)) then 1bv1 else 0bv1)), BV1_ZEXT32((if BV32_SGE(local_id_x$2, BV32_SDIV(BV32_MUL($warp_size, 3bv32), 2bv32)) then 1bv1 else 0bv1)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z3anyj"} true;
    call {:sourceloc} {:sourceloc_num 2} _LOG_WRITE_$$info(true, v0$1, BV1_ZEXT8((if v1$1 != 0bv32 then 1bv1 else 0bv1)), $$info[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$info(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 2} _CHECK_WRITE_$$info(true, v0$2, BV1_ZEXT8((if v1$2 != 0bv32 then 1bv1 else 0bv1)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$info"} true;
    $$info[v0$1] := BV1_ZEXT8((if v1$1 != 0bv32 then 1bv1 else 0bv1));
    $$info[v0$2] := BV1_ZEXT8((if v1$2 != 0bv32 then 1bv1 else 0bv1));
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$info(true, BV32_ADD(v0$1, 1bv32), BV1_ZEXT8((if BV32_SGE(local_id_x$1, BV32_SDIV(BV32_MUL($warp_size, 3bv32), 2bv32)) then 1bv1 else 0bv1)), $$info[BV32_ADD(v0$1, 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$info(true, BV32_ADD(v0$2, 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$info(true, BV32_ADD(v0$2, 1bv32), BV1_ZEXT8((if BV32_SGE(local_id_x$2, BV32_SDIV(BV32_MUL($warp_size, 3bv32), 2bv32)) then 1bv1 else 0bv1)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$info"} true;
    $$info[BV32_ADD(v0$1, 1bv32)] := BV1_ZEXT8((if BV32_SGE(local_id_x$1, BV32_SDIV(BV32_MUL($warp_size, 3bv32), 2bv32)) then 1bv1 else 0bv1));
    $$info[BV32_ADD(v0$2, 1bv32)] := BV1_ZEXT8((if BV32_SGE(local_id_x$2, BV32_SDIV(BV32_MUL($warp_size, 3bv32), 2bv32)) then 1bv1 else 0bv1));
    call {:sourceloc_num 4} v2$1, v2$2 := $_Z3allj(BV1_ZEXT32((if BV32_SGE(local_id_x$1, BV32_SDIV(BV32_MUL($warp_size, 3bv32), 2bv32)) then 1bv1 else 0bv1)), BV1_ZEXT32((if BV32_SGE(local_id_x$2, BV32_SDIV(BV32_MUL($warp_size, 3bv32), 2bv32)) then 1bv1 else 0bv1)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z3allj"} true;
    v3$1 := v2$1 != 0bv32;
    v3$2 := v2$2 != 0bv32;
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v3$1 then v3$1 else p0$1);
    p0$2 := (if v3$2 then v3$2 else p0$2);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$info(p0$1, BV32_ADD(v0$1, 2bv32), 1bv8, $$info[BV32_ADD(v0$1, 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$info(p0$2, BV32_ADD(v0$2, 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$info(p0$2, BV32_ADD(v0$2, 2bv32), 1bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$info"} true;
    $$info[BV32_ADD(v0$1, 2bv32)] := (if p0$1 then 1bv8 else $$info[BV32_ADD(v0$1, 2bv32)]);
    $$info[BV32_ADD(v0$2, 2bv32)] := (if p0$2 then 1bv8 else $$info[BV32_ADD(v0$2, 2bv32)]);
    return;
}



procedure {:source_name "_Z3anyj"} $_Z3anyj($0$1: bv32, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "_Z3allj"} $_Z3allj($0$1: bv32, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$info: bv8;

procedure {:inline 1} _LOG_READ_$$info(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$info;



implementation {:inline 1} _LOG_READ_$$info(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$info := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$info == _value then true else _READ_HAS_OCCURRED_$$info);
    return;
}



procedure _CHECK_READ_$$info(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "info"} {:array "$$info"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$info && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$info);
  requires {:source_name "info"} {:array "$$info"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$info && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$info: bool;

procedure {:inline 1} _LOG_WRITE_$$info(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$info, _WRITE_READ_BENIGN_FLAG_$$info;



implementation {:inline 1} _LOG_WRITE_$$info(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$info := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$info == _value then true else _WRITE_HAS_OCCURRED_$$info);
    _WRITE_READ_BENIGN_FLAG_$$info := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$info == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$info);
    return;
}



procedure _CHECK_WRITE_$$info(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "info"} {:array "$$info"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$info && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$info != _value);
  requires {:source_name "info"} {:array "$$info"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$info && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$info != _value);
  requires {:source_name "info"} {:array "$$info"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$info && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$info(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$info;



implementation {:inline 1} _LOG_ATOMIC_$$info(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$info := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$info);
    return;
}



procedure _CHECK_ATOMIC_$$info(_P: bool, _offset: bv32);
  requires {:source_name "info"} {:array "$$info"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$info && _WATCHED_OFFSET == _offset);
  requires {:source_name "info"} {:array "$$info"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$info && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$info(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$info;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$info(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$info := (if _P && _WRITE_HAS_OCCURRED_$$info && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$info);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
