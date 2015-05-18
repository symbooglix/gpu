type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "odata"} {:global} $$odata: [bv32]bv32;

axiom {:array_info "$$odata"} {:global} {:elem_width 32} {:source_name "odata"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$odata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$odata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$odata: bool;

axiom {:array_info "$$0"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$texRefPL"} {:global} {:elem_width 8} {:source_name "texRefPL"} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$texRefPL: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$texRefPL: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$texRefPL: bool;

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

function FDIV32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "shiftPitchLinear"} {:kernel} $_Z16shiftPitchLinearPfiiiii($pitch: bv32, $width: bv32, $height: bv32, $shiftX: bv32, $shiftY: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $pitch == 2048bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $width == 2048bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $height == 2048bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$odata && !_WRITE_HAS_OCCURRED_$$odata && !_ATOMIC_HAS_OCCURRED_$$odata;
  requires !_READ_HAS_OCCURRED_$$texRefPL && !_WRITE_HAS_OCCURRED_$$texRefPL && !_ATOMIC_HAS_OCCURRED_$$texRefPL;
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
  modifies _WRITE_HAS_OCCURRED_$$odata, _WRITE_READ_BENIGN_FLAG_$$odata, _WRITE_READ_BENIGN_FLAG_$$odata;



implementation {:source_name "shiftPitchLinear"} {:kernel} $_Z16shiftPitchLinearPfiiiii($pitch: bv32, $width: bv32, $height: bv32, $shiftX: bv32, $shiftY: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv8;
  var v2$2: bv8;
  var v3$1: bv8;
  var v3$2: bv8;
  var v4$1: bv8;
  var v4$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v5$1: bv8;
  var v5$2: bv8;
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v8$1: bv8;
  var v8$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
  var v16$1: bv8;
  var v16$2: bv8;
  var v17$1: bv8;
  var v17$2: bv8;
  var v18$1: bv8;
  var v18$2: bv8;
  var v19$1: bv8;
  var v19$2: bv8;
  var v20$1: bv8;
  var v20$2: bv8;
  var v21$1: bv8;
  var v21$2: bv8;
  var v22$1: bv8;
  var v22$2: bv8;
  var v23$1: bv8;
  var v23$2: bv8;
  var v24$1: bv8;
  var v24$2: bv8;
  var v25$1: bv8;
  var v25$2: bv8;
  var v26$1: bv32;
  var v26$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2);
    havoc v2$1, v2$2;
    $$0$0bv32$1 := v2$1;
    $$0$0bv32$2 := v2$2;
    havoc v3$1, v3$2;
    $$0$1bv32$1 := v3$1;
    $$0$1bv32$2 := v3$2;
    havoc v4$1, v4$2;
    $$0$2bv32$1 := v4$1;
    $$0$2bv32$2 := v4$2;
    havoc v5$1, v5$2;
    $$0$3bv32$1 := v5$1;
    $$0$3bv32$2 := v5$2;
    havoc v6$1, v6$2;
    $$0$4bv32$1 := v6$1;
    $$0$4bv32$2 := v6$2;
    havoc v7$1, v7$2;
    $$0$5bv32$1 := v7$1;
    $$0$5bv32$2 := v7$2;
    havoc v8$1, v8$2;
    $$0$6bv32$1 := v8$1;
    $$0$6bv32$2 := v8$2;
    havoc v9$1, v9$2;
    $$0$7bv32$1 := v9$1;
    $$0$7bv32$2 := v9$2;
    havoc v10$1, v10$2;
    $$0$8bv32$1 := v10$1;
    $$0$8bv32$2 := v10$2;
    havoc v11$1, v11$2;
    $$0$9bv32$1 := v11$1;
    $$0$9bv32$2 := v11$2;
    havoc v12$1, v12$2;
    $$0$10bv32$1 := v12$1;
    $$0$10bv32$2 := v12$2;
    havoc v13$1, v13$2;
    $$0$11bv32$1 := v13$1;
    $$0$11bv32$2 := v13$2;
    v14$1 := $$0$0bv32$1;
    v14$2 := $$0$0bv32$2;
    v15$1 := $$0$1bv32$1;
    v15$2 := $$0$1bv32$2;
    v16$1 := $$0$2bv32$1;
    v16$2 := $$0$2bv32$2;
    v17$1 := $$0$3bv32$1;
    v17$2 := $$0$3bv32$2;
    v18$1 := $$0$4bv32$1;
    v18$2 := $$0$4bv32$2;
    v19$1 := $$0$5bv32$1;
    v19$2 := $$0$5bv32$2;
    v20$1 := $$0$6bv32$1;
    v20$2 := $$0$6bv32$2;
    v21$1 := $$0$7bv32$1;
    v21$2 := $$0$7bv32$2;
    v22$1 := $$0$8bv32$1;
    v22$2 := $$0$8bv32$2;
    v23$1 := $$0$9bv32$1;
    v23$2 := $$0$9bv32$2;
    v24$1 := $$0$10bv32$1;
    v24$2 := $$0$10bv32$2;
    v25$1 := $$0$11bv32$1;
    v25$2 := $$0$11bv32$2;
    call {:sourceloc_num 40} v26$1, v26$2 := $_Z5tex2DIfET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(v17$1 ++ v16$1 ++ v15$1 ++ v14$1, v21$1 ++ v20$1 ++ v19$1 ++ v18$1, v25$1 ++ v24$1 ++ v23$1 ++ v22$1, FDIV32(SI32_TO_FP32(BV32_ADD(v0$1, $shiftX)), SI32_TO_FP32($width)), FDIV32(SI32_TO_FP32(BV32_ADD(v1$1, $shiftY)), SI32_TO_FP32($height)), v17$2 ++ v16$2 ++ v15$2 ++ v14$2, v21$2 ++ v20$2 ++ v19$2 ++ v18$2, v25$2 ++ v24$2 ++ v23$2 ++ v22$2, FDIV32(SI32_TO_FP32(BV32_ADD(v0$2, $shiftX)), SI32_TO_FP32($width)), FDIV32(SI32_TO_FP32(BV32_ADD(v1$2, $shiftY)), SI32_TO_FP32($height)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIfET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$odata(true, BV32_ADD(BV32_MUL(v1$1, $pitch), v0$1), v26$1, $$odata[BV32_ADD(BV32_MUL(v1$1, $pitch), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$odata(true, BV32_ADD(BV32_MUL(v1$2, $pitch), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$odata(true, BV32_ADD(BV32_MUL(v1$2, $pitch), v0$2), v26$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$odata"} true;
    $$odata[BV32_ADD(BV32_MUL(v1$1, $pitch), v0$1)] := v26$1;
    $$odata[BV32_ADD(BV32_MUL(v1$2, $pitch), v0$2)] := v26$2;
    return;
}



procedure {:source_name "_Z5tex2DIfET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} $_Z5tex2DIfET_7textureIS0_Li2EL19cudaTextureReadMode0EEff($0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$0$0bv32$1: bv8;

var $$0$0bv32$2: bv8;

var $$0$1bv32$1: bv8;

var $$0$1bv32$2: bv8;

var $$0$2bv32$1: bv8;

var $$0$2bv32$2: bv8;

var $$0$3bv32$1: bv8;

var $$0$3bv32$2: bv8;

var $$0$4bv32$1: bv8;

var $$0$4bv32$2: bv8;

var $$0$5bv32$1: bv8;

var $$0$5bv32$2: bv8;

var $$0$6bv32$1: bv8;

var $$0$6bv32$2: bv8;

var $$0$7bv32$1: bv8;

var $$0$7bv32$2: bv8;

var $$0$8bv32$1: bv8;

var $$0$8bv32$2: bv8;

var $$0$9bv32$1: bv8;

var $$0$9bv32$2: bv8;

var $$0$10bv32$1: bv8;

var $$0$10bv32$2: bv8;

var $$0$11bv32$1: bv8;

var $$0$11bv32$2: bv8;

const _WATCHED_VALUE_$$odata: bv32;

procedure {:inline 1} _LOG_READ_$$odata(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$odata;



implementation {:inline 1} _LOG_READ_$$odata(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata == _value then true else _READ_HAS_OCCURRED_$$odata);
    return;
}



procedure _CHECK_READ_$$odata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$odata);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$odata: bool;

procedure {:inline 1} _LOG_WRITE_$$odata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$odata, _WRITE_READ_BENIGN_FLAG_$$odata;



implementation {:inline 1} _LOG_WRITE_$$odata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata == _value then true else _WRITE_HAS_OCCURRED_$$odata);
    _WRITE_READ_BENIGN_FLAG_$$odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$odata);
    return;
}



procedure _CHECK_WRITE_$$odata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata != _value);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata != _value);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$odata(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$odata;



implementation {:inline 1} _LOG_ATOMIC_$$odata(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$odata);
    return;
}



procedure _CHECK_ATOMIC_$$odata(_P: bool, _offset: bv32);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$odata(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$odata;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$odata(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$odata := (if _P && _WRITE_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$odata);
    return;
}



const _WATCHED_VALUE_$$texRefPL: bv8;

procedure {:inline 1} _LOG_READ_$$texRefPL(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$texRefPL;



implementation {:inline 1} _LOG_READ_$$texRefPL(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$texRefPL := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texRefPL == _value then true else _READ_HAS_OCCURRED_$$texRefPL);
    return;
}



procedure _CHECK_READ_$$texRefPL(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "texRefPL"} {:array "$$texRefPL"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$texRefPL && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$texRefPL);
  requires {:source_name "texRefPL"} {:array "$$texRefPL"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$texRefPL && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$texRefPL: bool;

procedure {:inline 1} _LOG_WRITE_$$texRefPL(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$texRefPL, _WRITE_READ_BENIGN_FLAG_$$texRefPL;



implementation {:inline 1} _LOG_WRITE_$$texRefPL(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$texRefPL := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texRefPL == _value then true else _WRITE_HAS_OCCURRED_$$texRefPL);
    _WRITE_READ_BENIGN_FLAG_$$texRefPL := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texRefPL == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$texRefPL);
    return;
}



procedure _CHECK_WRITE_$$texRefPL(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "texRefPL"} {:array "$$texRefPL"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$texRefPL && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texRefPL != _value);
  requires {:source_name "texRefPL"} {:array "$$texRefPL"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$texRefPL && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texRefPL != _value);
  requires {:source_name "texRefPL"} {:array "$$texRefPL"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$texRefPL && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$texRefPL(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$texRefPL;



implementation {:inline 1} _LOG_ATOMIC_$$texRefPL(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$texRefPL := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$texRefPL);
    return;
}



procedure _CHECK_ATOMIC_$$texRefPL(_P: bool, _offset: bv32);
  requires {:source_name "texRefPL"} {:array "$$texRefPL"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$texRefPL && _WATCHED_OFFSET == _offset);
  requires {:source_name "texRefPL"} {:array "$$texRefPL"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$texRefPL && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$texRefPL(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$texRefPL;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$texRefPL(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$texRefPL := (if _P && _WRITE_HAS_OCCURRED_$$texRefPL && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$texRefPL);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
