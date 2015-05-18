type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "pos"} {:global} $$pos: [bv32]bv32;

axiom {:array_info "$$pos"} {:global} {:elem_width 32} {:source_name "pos"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$pos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$pos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$pos: bool;

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

function FCOS32(bv32) : bv32;

function FDIV32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FSIN32(bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "sineWave"} {:kernel} $sineWave($width: bv32, $height: bv32, $time: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$pos && !_WRITE_HAS_OCCURRED_$$pos && !_ATOMIC_HAS_OCCURRED_$$pos;
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
  modifies _WRITE_HAS_OCCURRED_$$pos, _WRITE_READ_BENIGN_FLAG_$$pos, _WRITE_READ_BENIGN_FLAG_$$pos;



implementation {:source_name "sineWave"} {:kernel} $sineWave($width: bv32, $height: bv32, $time: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    v2$1 := FADD32(FMUL32(FDIV32(UI32_TO_FP32(v0$1), UI32_TO_FP32($width)), 1073741824bv32), 3212836864bv32);
    v2$2 := FADD32(FMUL32(FDIV32(UI32_TO_FP32(v0$2), UI32_TO_FP32($width)), 1073741824bv32), 3212836864bv32);
    v3$1 := FADD32(FMUL32(FDIV32(UI32_TO_FP32(v1$1), UI32_TO_FP32($height)), 1073741824bv32), 3212836864bv32);
    v3$2 := FADD32(FMUL32(FDIV32(UI32_TO_FP32(v1$2), UI32_TO_FP32($height)), 1073741824bv32), 3212836864bv32);
    call {:sourceloc} {:sourceloc_num 2} _LOG_WRITE_$$pos(true, BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $width), v0$1), 4bv32), v2$1, $$pos[BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $width), v0$1), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pos(true, BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $width), v0$2), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 2} _CHECK_WRITE_$$pos(true, BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $width), v0$2), 4bv32), v2$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pos"} true;
    $$pos[BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $width), v0$1), 4bv32)] := v2$1;
    $$pos[BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $width), v0$2), 4bv32)] := v2$2;
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$pos(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $width), v0$1), 4bv32), 1bv32), FMUL32(FMUL32(FSIN32(FADD32(FMUL32(v2$1, 1082130432bv32), $time)), FCOS32(FADD32(FMUL32(v3$1, 1082130432bv32), $time))), 1056964608bv32), $$pos[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $width), v0$1), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pos(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $width), v0$2), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$pos(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $width), v0$2), 4bv32), 1bv32), FMUL32(FMUL32(FSIN32(FADD32(FMUL32(v2$2, 1082130432bv32), $time)), FCOS32(FADD32(FMUL32(v3$2, 1082130432bv32), $time))), 1056964608bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pos"} true;
    $$pos[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $width), v0$1), 4bv32), 1bv32)] := FMUL32(FMUL32(FSIN32(FADD32(FMUL32(v2$1, 1082130432bv32), $time)), FCOS32(FADD32(FMUL32(v3$1, 1082130432bv32), $time))), 1056964608bv32);
    $$pos[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $width), v0$2), 4bv32), 1bv32)] := FMUL32(FMUL32(FSIN32(FADD32(FMUL32(v2$2, 1082130432bv32), $time)), FCOS32(FADD32(FMUL32(v3$2, 1082130432bv32), $time))), 1056964608bv32);
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$pos(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $width), v0$1), 4bv32), 2bv32), v3$1, $$pos[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $width), v0$1), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pos(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $width), v0$2), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$pos(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $width), v0$2), 4bv32), 2bv32), v3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pos"} true;
    $$pos[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $width), v0$1), 4bv32), 2bv32)] := v3$1;
    $$pos[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $width), v0$2), 4bv32), 2bv32)] := v3$2;
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$pos(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $width), v0$1), 4bv32), 3bv32), 1065353216bv32, $$pos[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $width), v0$1), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pos(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $width), v0$2), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$pos(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $width), v0$2), 4bv32), 3bv32), 1065353216bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pos"} true;
    $$pos[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $width), v0$1), 4bv32), 3bv32)] := 1065353216bv32;
    $$pos[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $width), v0$2), 4bv32), 3bv32)] := 1065353216bv32;
    return;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$pos: bv32;

procedure {:inline 1} _LOG_READ_$$pos(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$pos;



implementation {:inline 1} _LOG_READ_$$pos(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pos == _value then true else _READ_HAS_OCCURRED_$$pos);
    return;
}



procedure _CHECK_READ_$$pos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pos"} {:array "$$pos"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$pos);
  requires {:source_name "pos"} {:array "$$pos"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$pos: bool;

procedure {:inline 1} _LOG_WRITE_$$pos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$pos, _WRITE_READ_BENIGN_FLAG_$$pos;



implementation {:inline 1} _LOG_WRITE_$$pos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pos == _value then true else _WRITE_HAS_OCCURRED_$$pos);
    _WRITE_READ_BENIGN_FLAG_$$pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pos == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$pos);
    return;
}



procedure _CHECK_WRITE_$$pos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pos"} {:array "$$pos"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pos != _value);
  requires {:source_name "pos"} {:array "$$pos"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pos != _value);
  requires {:source_name "pos"} {:array "$$pos"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$pos(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$pos;



implementation {:inline 1} _LOG_ATOMIC_$$pos(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$pos);
    return;
}



procedure _CHECK_ATOMIC_$$pos(_P: bool, _offset: bv32);
  requires {:source_name "pos"} {:array "$$pos"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset);
  requires {:source_name "pos"} {:array "$$pos"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pos(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$pos;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pos(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$pos := (if _P && _WRITE_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$pos);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
