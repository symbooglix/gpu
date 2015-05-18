type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "blurimage"} {:global} $$blurimage: [bv32]bv32;

axiom {:array_info "$$blurimage"} {:global} {:elem_width 32} {:source_name "blurimage"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$blurimage: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$blurimage: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$blurimage: bool;

axiom {:array_info "$$img"} {:global} {:elem_width 32} {:source_name "img"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$img: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$img: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$img: bool;

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

function FDIV32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

procedure {:source_name "boxblur"} {:kernel} $_Z7boxblurPfS_();
  requires !_READ_HAS_OCCURRED_$$blurimage && !_WRITE_HAS_OCCURRED_$$blurimage && !_ATOMIC_HAS_OCCURRED_$$blurimage;
  requires !_READ_HAS_OCCURRED_$$img && !_WRITE_HAS_OCCURRED_$$img && !_ATOMIC_HAS_OCCURRED_$$img;
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
  modifies _WRITE_HAS_OCCURRED_$$blurimage, _WRITE_READ_BENIGN_FLAG_$$blurimage, _WRITE_READ_BENIGN_FLAG_$$blurimage;



implementation {:source_name "boxblur"} {:kernel} $_Z7boxblurPfS_()
{
  var $r.0$1: bv32;
  var $r.0$2: bv32;
  var $samples.0: bv32;
  var $dy.0: bv32;
  var $r.1$1: bv32;
  var $r.1$2: bv32;
  var $samples.1: bv32;
  var $dx.0: bv32;
  var v2: bool;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v3: bool;
  var v4$1: bv32;
  var v4$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2);
    $r.0$1, $samples.0, $dy.0 := 0bv32, 0bv32, 4294967295bv32;
    $r.0$2 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v2 := BV32_SLE($dy.0, 1bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v2 && !v2;
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$blurimage(true, BV32_ADD(BV32_MUL(v1$1, 17bv32), v0$1), FDIV32($r.0$1, SI32_TO_FP32($samples.0)), $$blurimage[BV32_ADD(BV32_MUL(v1$1, 17bv32), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blurimage(true, BV32_ADD(BV32_MUL(v1$2, 17bv32), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$blurimage(true, BV32_ADD(BV32_MUL(v1$2, 17bv32), v0$2), FDIV32($r.0$2, SI32_TO_FP32($samples.0)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blurimage"} true;
    $$blurimage[BV32_ADD(BV32_MUL(v1$1, 17bv32), v0$1)] := FDIV32($r.0$1, SI32_TO_FP32($samples.0));
    $$blurimage[BV32_ADD(BV32_MUL(v1$2, 17bv32), v0$2)] := FDIV32($r.0$2, SI32_TO_FP32($samples.0));
    return;

  $truebb:
    assume {:partition} v2 && v2;
    $r.1$1, $samples.1, $dx.0 := $r.0$1, $samples.0, 4294967295bv32;
    $r.1$2 := $r.0$2;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_1"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 3} true;
    v3 := BV32_SLE($dx.0, 1bv32);
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v3 && !v3;
    $r.0$1, $samples.0, $dy.0 := $r.1$1, $samples.1, BV32_ADD($dy.0, 1bv32);
    $r.0$2 := $r.1$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $truebb0:
    assume {:partition} v3 && v3;
    havoc v4$1, v4$2;
    $r.1$1, $samples.1, $dx.0 := FADD32($r.1$1, v4$1), BV32_ADD($samples.1, 1bv32), BV32_ADD($dx.0, 1bv32);
    $r.1$2 := FADD32($r.1$2, v4$2);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $3;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 17bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 17bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$blurimage: bv32;

procedure {:inline 1} _LOG_READ_$$blurimage(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$blurimage;



implementation {:inline 1} _LOG_READ_$$blurimage(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$blurimage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blurimage == _value then true else _READ_HAS_OCCURRED_$$blurimage);
    return;
}



procedure _CHECK_READ_$$blurimage(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "blurimage"} {:array "$$blurimage"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$blurimage && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$blurimage);
  requires {:source_name "blurimage"} {:array "$$blurimage"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$blurimage && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$blurimage: bool;

procedure {:inline 1} _LOG_WRITE_$$blurimage(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$blurimage, _WRITE_READ_BENIGN_FLAG_$$blurimage;



implementation {:inline 1} _LOG_WRITE_$$blurimage(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$blurimage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blurimage == _value then true else _WRITE_HAS_OCCURRED_$$blurimage);
    _WRITE_READ_BENIGN_FLAG_$$blurimage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blurimage == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$blurimage);
    return;
}



procedure _CHECK_WRITE_$$blurimage(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "blurimage"} {:array "$$blurimage"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$blurimage && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blurimage != _value);
  requires {:source_name "blurimage"} {:array "$$blurimage"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$blurimage && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blurimage != _value);
  requires {:source_name "blurimage"} {:array "$$blurimage"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$blurimage && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$blurimage(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$blurimage;



implementation {:inline 1} _LOG_ATOMIC_$$blurimage(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$blurimage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$blurimage);
    return;
}



procedure _CHECK_ATOMIC_$$blurimage(_P: bool, _offset: bv32);
  requires {:source_name "blurimage"} {:array "$$blurimage"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$blurimage && _WATCHED_OFFSET == _offset);
  requires {:source_name "blurimage"} {:array "$$blurimage"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$blurimage && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$blurimage(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$blurimage;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$blurimage(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$blurimage := (if _P && _WRITE_HAS_OCCURRED_$$blurimage && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$blurimage);
    return;
}



const _WATCHED_VALUE_$$img: bv32;

procedure {:inline 1} _LOG_READ_$$img(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$img;



implementation {:inline 1} _LOG_READ_$$img(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then true else _READ_HAS_OCCURRED_$$img);
    return;
}



procedure _CHECK_READ_$$img(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$img);
  requires {:source_name "img"} {:array "$$img"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$img: bool;

procedure {:inline 1} _LOG_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$img, _WRITE_READ_BENIGN_FLAG_$$img;



implementation {:inline 1} _LOG_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then true else _WRITE_HAS_OCCURRED_$$img);
    _WRITE_READ_BENIGN_FLAG_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$img);
    return;
}



procedure _CHECK_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img != _value);
  requires {:source_name "img"} {:array "$$img"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img != _value);
  requires {:source_name "img"} {:array "$$img"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$img(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$img;



implementation {:inline 1} _LOG_ATOMIC_$$img(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$img);
    return;
}



procedure _CHECK_ATOMIC_$$img(_P: bool, _offset: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);
  requires {:source_name "img"} {:array "$$img"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$img(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$img;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$img(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$img := (if _P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$img);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
