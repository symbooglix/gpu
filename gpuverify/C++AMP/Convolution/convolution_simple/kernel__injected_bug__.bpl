type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$v_img"} {:global} {:elem_width 32} {:source_name "v_img"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$v_img: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$v_img: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$v_img: bool;

axiom {:array_info "$$v_filter"} {:global} {:elem_width 32} {:source_name "v_filter"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$v_filter: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$v_filter: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$v_filter: bool;

var {:source_name "v_result"} {:global} $$v_result: [bv32]bv32;

axiom {:array_info "$$v_result"} {:global} {:elem_width 32} {:source_name "v_result"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$v_result: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$v_result: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$v_result: bool;

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

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

procedure {:source_name "convolution_simple"} {:kernel} $_Z18convolution_simplePfS_S_();
  requires !_READ_HAS_OCCURRED_$$v_img && !_WRITE_HAS_OCCURRED_$$v_img && !_ATOMIC_HAS_OCCURRED_$$v_img;
  requires !_READ_HAS_OCCURRED_$$v_filter && !_WRITE_HAS_OCCURRED_$$v_filter && !_ATOMIC_HAS_OCCURRED_$$v_filter;
  requires !_READ_HAS_OCCURRED_$$v_result && !_WRITE_HAS_OCCURRED_$$v_result && !_ATOMIC_HAS_OCCURRED_$$v_result;
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
  modifies _WRITE_HAS_OCCURRED_$$v_result, _WRITE_READ_BENIGN_FLAG_$$v_result, _WRITE_READ_BENIGN_FLAG_$$v_result, _READ_HAS_OCCURRED_$$v_result;



implementation {:source_name "convolution_simple"} {:kernel} $_Z18convolution_simplePfS_S_()
{
  var $sum.i.0$1: bv32;
  var $sum.i.0$2: bv32;
  var $k.i.0: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var v0: bool;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;


  $0:
    $sum.i.0$1, $k.i.0 := 0bv32, 4294967289bv32;
    $sum.i.0$2 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v0 := BV32_SLE($k.i.0, 7bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v0 && !v0;
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$v_result(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $sum.i.0$1, $$v_result[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v_result(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$v_result(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $sum.i.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v_result"} true;
    $$v_result[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := $sum.i.0$1;
    $$v_result[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := $sum.i.0$2;
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$v_result(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 1bv32), $$v_result[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$v_result(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), 1bv32), $$v_result[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$v_result"} true;
    v4$1 := $$v_result[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 1bv32)];
    v4$2 := $$v_result[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), 1bv32)];
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$v_result(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 1bv32), v4$1, $$v_result[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v_result(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$v_result(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), 1bv32), v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v_result"} true;
    $$v_result[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 1bv32)] := v4$1;
    $$v_result[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), 512bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), 1bv32)] := v4$2;
    return;

  $truebb:
    assume {:partition} v0 && v0;
    v1$1 := BV32_UGT(BV32_ADD(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), $k.i.0), 511bv32);
    v1$2 := BV32_UGT(BV32_ADD(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), $k.i.0), 511bv32);
    p1$1 := (if v1$1 then v1$1 else p1$1);
    p1$2 := (if v1$2 then v1$2 else p1$2);
    p0$1 := (if !v1$1 then !v1$1 else p0$1);
    p0$2 := (if !v1$2 then !v1$2 else p0$2);
    $0$1 := (if p0$1 then BV32_ADD(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), $k.i.0) else $0$1);
    $0$2 := (if p0$2 then BV32_ADD(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), $k.i.0) else $0$2);
    $0$1 := (if p1$1 then 511bv32 else $0$1);
    $0$2 := (if p1$2 then 511bv32 else $0$2);
    havoc v2$1, v2$2;
    havoc v3$1, v3$2;
    $sum.i.0$1, $k.i.0 := FADD32($sum.i.0$1, FMUL32(v2$1, v3$1)), BV32_ADD($k.i.0, 1bv32);
    $sum.i.0$2 := FADD32($sum.i.0$2, FMUL32(v2$2, v3$2));
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 4bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$v_img: bv32;

procedure {:inline 1} _LOG_READ_$$v_img(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$v_img;



implementation {:inline 1} _LOG_READ_$$v_img(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$v_img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_img == _value then true else _READ_HAS_OCCURRED_$$v_img);
    return;
}



procedure _CHECK_READ_$$v_img(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "v_img"} {:array "$$v_img"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$v_img && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$v_img);
  requires {:source_name "v_img"} {:array "$$v_img"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$v_img && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$v_img: bool;

procedure {:inline 1} _LOG_WRITE_$$v_img(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$v_img, _WRITE_READ_BENIGN_FLAG_$$v_img;



implementation {:inline 1} _LOG_WRITE_$$v_img(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$v_img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_img == _value then true else _WRITE_HAS_OCCURRED_$$v_img);
    _WRITE_READ_BENIGN_FLAG_$$v_img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_img == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$v_img);
    return;
}



procedure _CHECK_WRITE_$$v_img(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "v_img"} {:array "$$v_img"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$v_img && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_img != _value);
  requires {:source_name "v_img"} {:array "$$v_img"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$v_img && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_img != _value);
  requires {:source_name "v_img"} {:array "$$v_img"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$v_img && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$v_img(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$v_img;



implementation {:inline 1} _LOG_ATOMIC_$$v_img(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$v_img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$v_img);
    return;
}



procedure _CHECK_ATOMIC_$$v_img(_P: bool, _offset: bv32);
  requires {:source_name "v_img"} {:array "$$v_img"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$v_img && _WATCHED_OFFSET == _offset);
  requires {:source_name "v_img"} {:array "$$v_img"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$v_img && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v_img(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$v_img;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v_img(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$v_img := (if _P && _WRITE_HAS_OCCURRED_$$v_img && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$v_img);
    return;
}



const _WATCHED_VALUE_$$v_filter: bv32;

procedure {:inline 1} _LOG_READ_$$v_filter(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$v_filter;



implementation {:inline 1} _LOG_READ_$$v_filter(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$v_filter := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_filter == _value then true else _READ_HAS_OCCURRED_$$v_filter);
    return;
}



procedure _CHECK_READ_$$v_filter(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "v_filter"} {:array "$$v_filter"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$v_filter && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$v_filter);
  requires {:source_name "v_filter"} {:array "$$v_filter"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$v_filter && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$v_filter: bool;

procedure {:inline 1} _LOG_WRITE_$$v_filter(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$v_filter, _WRITE_READ_BENIGN_FLAG_$$v_filter;



implementation {:inline 1} _LOG_WRITE_$$v_filter(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$v_filter := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_filter == _value then true else _WRITE_HAS_OCCURRED_$$v_filter);
    _WRITE_READ_BENIGN_FLAG_$$v_filter := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_filter == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$v_filter);
    return;
}



procedure _CHECK_WRITE_$$v_filter(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "v_filter"} {:array "$$v_filter"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$v_filter && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_filter != _value);
  requires {:source_name "v_filter"} {:array "$$v_filter"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$v_filter && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_filter != _value);
  requires {:source_name "v_filter"} {:array "$$v_filter"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$v_filter && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$v_filter(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$v_filter;



implementation {:inline 1} _LOG_ATOMIC_$$v_filter(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$v_filter := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$v_filter);
    return;
}



procedure _CHECK_ATOMIC_$$v_filter(_P: bool, _offset: bv32);
  requires {:source_name "v_filter"} {:array "$$v_filter"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$v_filter && _WATCHED_OFFSET == _offset);
  requires {:source_name "v_filter"} {:array "$$v_filter"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$v_filter && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v_filter(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$v_filter;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v_filter(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$v_filter := (if _P && _WRITE_HAS_OCCURRED_$$v_filter && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$v_filter);
    return;
}



const _WATCHED_VALUE_$$v_result: bv32;

procedure {:inline 1} _LOG_READ_$$v_result(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$v_result;



implementation {:inline 1} _LOG_READ_$$v_result(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$v_result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_result == _value then true else _READ_HAS_OCCURRED_$$v_result);
    return;
}



procedure _CHECK_READ_$$v_result(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "v_result"} {:array "$$v_result"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$v_result && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$v_result);
  requires {:source_name "v_result"} {:array "$$v_result"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$v_result && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$v_result: bool;

procedure {:inline 1} _LOG_WRITE_$$v_result(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$v_result, _WRITE_READ_BENIGN_FLAG_$$v_result;



implementation {:inline 1} _LOG_WRITE_$$v_result(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$v_result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_result == _value then true else _WRITE_HAS_OCCURRED_$$v_result);
    _WRITE_READ_BENIGN_FLAG_$$v_result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_result == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$v_result);
    return;
}



procedure _CHECK_WRITE_$$v_result(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "v_result"} {:array "$$v_result"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$v_result && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_result != _value);
  requires {:source_name "v_result"} {:array "$$v_result"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$v_result && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v_result != _value);
  requires {:source_name "v_result"} {:array "$$v_result"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$v_result && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$v_result(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$v_result;



implementation {:inline 1} _LOG_ATOMIC_$$v_result(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$v_result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$v_result);
    return;
}



procedure _CHECK_ATOMIC_$$v_result(_P: bool, _offset: bv32);
  requires {:source_name "v_result"} {:array "$$v_result"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$v_result && _WATCHED_OFFSET == _offset);
  requires {:source_name "v_result"} {:array "$$v_result"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$v_result && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v_result(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$v_result;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v_result(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$v_result := (if _P && _WRITE_HAS_OCCURRED_$$v_result && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$v_result);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
