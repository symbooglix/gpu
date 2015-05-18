type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "outputData"} {:global} $$outputData: [bv32]bv32;

axiom {:array_info "$$outputData"} {:global} {:elem_width 32} {:source_name "outputData"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$outputData: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$outputData: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$outputData: bool;

axiom {:array_info "$$0"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$tex"} {:global} {:elem_width 8} {:source_name "tex"} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$tex: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$tex: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$tex: bool;

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

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "transformKernel"} {:kernel} $_Z15transformKernelPfiif($width: bv32, $height: bv32, $theta: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$outputData && !_WRITE_HAS_OCCURRED_$$outputData && !_ATOMIC_HAS_OCCURRED_$$outputData;
  requires !_READ_HAS_OCCURRED_$$tex && !_WRITE_HAS_OCCURRED_$$tex && !_ATOMIC_HAS_OCCURRED_$$tex;
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
  modifies _WRITE_HAS_OCCURRED_$$outputData, _WRITE_READ_BENIGN_FLAG_$$outputData, _WRITE_READ_BENIGN_FLAG_$$outputData;



implementation {:source_name "transformKernel"} {:kernel} $_Z15transformKernelPfiif($width: bv32, $height: bv32, $theta: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v11$1: bv8;
  var v11$2: bv8;
  var v5$1: bv32;
  var v5$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v28$1: bv8;
  var v28$2: bv8;
  var v8$1: bv8;
  var v8$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v29$1: bv8;
  var v29$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
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
  var v26$1: bv8;
  var v26$2: bv8;
  var v27$1: bv8;
  var v27$2: bv8;
  var v30$1: bv8;
  var v30$2: bv8;
  var v31$1: bv8;
  var v31$2: bv8;
  var v32$1: bv32;
  var v32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2);
    v2$1 := FSUB32(FDIV32(UI32_TO_FP32(v0$1), SI32_TO_FP32($width)), 1056964608bv32);
    v2$2 := FSUB32(FDIV32(UI32_TO_FP32(v0$2), SI32_TO_FP32($width)), 1056964608bv32);
    v3$1 := FSUB32(FDIV32(UI32_TO_FP32(v1$1), SI32_TO_FP32($height)), 1056964608bv32);
    v3$2 := FSUB32(FDIV32(UI32_TO_FP32(v1$2), SI32_TO_FP32($height)), 1056964608bv32);
    call {:sourceloc_num 2} v4$1, v4$2 := $cosf($theta);
    assume {:captureState "call_return_state_0"} {:procedureName "$cosf"} true;
    call {:sourceloc_num 3} v5$1, v5$2 := $sinf($theta);
    assume {:captureState "call_return_state_0"} {:procedureName "$sinf"} true;
    call {:sourceloc_num 4} v6$1, v6$2 := $cosf($theta);
    assume {:captureState "call_return_state_0"} {:procedureName "$cosf"} true;
    call {:sourceloc_num 5} v7$1, v7$2 := $sinf($theta);
    assume {:captureState "call_return_state_0"} {:procedureName "$sinf"} true;
    havoc v8$1, v8$2;
    $$0$0bv32$1 := v8$1;
    $$0$0bv32$2 := v8$2;
    havoc v9$1, v9$2;
    $$0$1bv32$1 := v9$1;
    $$0$1bv32$2 := v9$2;
    havoc v10$1, v10$2;
    $$0$2bv32$1 := v10$1;
    $$0$2bv32$2 := v10$2;
    havoc v11$1, v11$2;
    $$0$3bv32$1 := v11$1;
    $$0$3bv32$2 := v11$2;
    havoc v12$1, v12$2;
    $$0$4bv32$1 := v12$1;
    $$0$4bv32$2 := v12$2;
    havoc v13$1, v13$2;
    $$0$5bv32$1 := v13$1;
    $$0$5bv32$2 := v13$2;
    havoc v14$1, v14$2;
    $$0$6bv32$1 := v14$1;
    $$0$6bv32$2 := v14$2;
    havoc v15$1, v15$2;
    $$0$7bv32$1 := v15$1;
    $$0$7bv32$2 := v15$2;
    havoc v16$1, v16$2;
    $$0$8bv32$1 := v16$1;
    $$0$8bv32$2 := v16$2;
    havoc v17$1, v17$2;
    $$0$9bv32$1 := v17$1;
    $$0$9bv32$2 := v17$2;
    havoc v18$1, v18$2;
    $$0$10bv32$1 := v18$1;
    $$0$10bv32$2 := v18$2;
    havoc v19$1, v19$2;
    $$0$11bv32$1 := v19$1;
    $$0$11bv32$2 := v19$2;
    v20$1 := $$0$0bv32$1;
    v20$2 := $$0$0bv32$2;
    v21$1 := $$0$1bv32$1;
    v21$2 := $$0$1bv32$2;
    v22$1 := $$0$2bv32$1;
    v22$2 := $$0$2bv32$2;
    v23$1 := $$0$3bv32$1;
    v23$2 := $$0$3bv32$2;
    v24$1 := $$0$4bv32$1;
    v24$2 := $$0$4bv32$2;
    v25$1 := $$0$5bv32$1;
    v25$2 := $$0$5bv32$2;
    v26$1 := $$0$6bv32$1;
    v26$2 := $$0$6bv32$2;
    v27$1 := $$0$7bv32$1;
    v27$2 := $$0$7bv32$2;
    v28$1 := $$0$8bv32$1;
    v28$2 := $$0$8bv32$2;
    v29$1 := $$0$9bv32$1;
    v29$2 := $$0$9bv32$2;
    v30$1 := $$0$10bv32$1;
    v30$2 := $$0$10bv32$2;
    v31$1 := $$0$11bv32$1;
    v31$2 := $$0$11bv32$2;
    call {:sourceloc_num 42} v32$1, v32$2 := $_Z5tex2DIfET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(v23$1 ++ v22$1 ++ v21$1 ++ v20$1, v27$1 ++ v26$1 ++ v25$1 ++ v24$1, v31$1 ++ v30$1 ++ v29$1 ++ v28$1, FADD32(FSUB32(FMUL32(v2$1, v4$1), FMUL32(v3$1, v5$1)), 1056964608bv32), FADD32(FADD32(FMUL32(v3$1, v6$1), FMUL32(v2$1, v7$1)), 1056964608bv32), v23$2 ++ v22$2 ++ v21$2 ++ v20$2, v27$2 ++ v26$2 ++ v25$2 ++ v24$2, v31$2 ++ v30$2 ++ v29$2 ++ v28$2, FADD32(FSUB32(FMUL32(v2$2, v4$2), FMUL32(v3$2, v5$2)), 1056964608bv32), FADD32(FADD32(FMUL32(v3$2, v6$2), FMUL32(v2$2, v7$2)), 1056964608bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIfET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    call {:sourceloc} {:sourceloc_num 43} _LOG_WRITE_$$outputData(true, BV32_ADD(BV32_MUL(v1$1, $width), v0$1), v32$1, $$outputData[BV32_ADD(BV32_MUL(v1$1, $width), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputData(true, BV32_ADD(BV32_MUL(v1$2, $width), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 43} _CHECK_WRITE_$$outputData(true, BV32_ADD(BV32_MUL(v1$2, $width), v0$2), v32$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputData"} true;
    $$outputData[BV32_ADD(BV32_MUL(v1$1, $width), v0$1)] := v32$1;
    $$outputData[BV32_ADD(BV32_MUL(v1$2, $width), v0$2)] := v32$2;
    return;
}



procedure {:source_name "cosf"} $cosf($0: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "sinf"} $sinf($0: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "_Z5tex2DIfET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} $_Z5tex2DIfET_7textureIS0_Li2EL19cudaTextureReadMode0EEff($0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 64bv32 then 1bv1 else 0bv1) != 0bv1;

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

const _WATCHED_VALUE_$$outputData: bv32;

procedure {:inline 1} _LOG_READ_$$outputData(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$outputData;



implementation {:inline 1} _LOG_READ_$$outputData(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$outputData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputData == _value then true else _READ_HAS_OCCURRED_$$outputData);
    return;
}



procedure _CHECK_READ_$$outputData(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "outputData"} {:array "$$outputData"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$outputData && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$outputData);
  requires {:source_name "outputData"} {:array "$$outputData"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$outputData && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$outputData: bool;

procedure {:inline 1} _LOG_WRITE_$$outputData(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$outputData, _WRITE_READ_BENIGN_FLAG_$$outputData;



implementation {:inline 1} _LOG_WRITE_$$outputData(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$outputData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputData == _value then true else _WRITE_HAS_OCCURRED_$$outputData);
    _WRITE_READ_BENIGN_FLAG_$$outputData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputData == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$outputData);
    return;
}



procedure _CHECK_WRITE_$$outputData(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "outputData"} {:array "$$outputData"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$outputData && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputData != _value);
  requires {:source_name "outputData"} {:array "$$outputData"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$outputData && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputData != _value);
  requires {:source_name "outputData"} {:array "$$outputData"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$outputData && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$outputData(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$outputData;



implementation {:inline 1} _LOG_ATOMIC_$$outputData(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$outputData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$outputData);
    return;
}



procedure _CHECK_ATOMIC_$$outputData(_P: bool, _offset: bv32);
  requires {:source_name "outputData"} {:array "$$outputData"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$outputData && _WATCHED_OFFSET == _offset);
  requires {:source_name "outputData"} {:array "$$outputData"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$outputData && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputData(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$outputData;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputData(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$outputData := (if _P && _WRITE_HAS_OCCURRED_$$outputData && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$outputData);
    return;
}



const _WATCHED_VALUE_$$tex: bv8;

procedure {:inline 1} _LOG_READ_$$tex(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$tex;



implementation {:inline 1} _LOG_READ_$$tex(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$tex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tex == _value then true else _READ_HAS_OCCURRED_$$tex);
    return;
}



procedure _CHECK_READ_$$tex(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "tex"} {:array "$$tex"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$tex);
  requires {:source_name "tex"} {:array "$$tex"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$tex: bool;

procedure {:inline 1} _LOG_WRITE_$$tex(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$tex, _WRITE_READ_BENIGN_FLAG_$$tex;



implementation {:inline 1} _LOG_WRITE_$$tex(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$tex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tex == _value then true else _WRITE_HAS_OCCURRED_$$tex);
    _WRITE_READ_BENIGN_FLAG_$$tex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tex == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$tex);
    return;
}



procedure _CHECK_WRITE_$$tex(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "tex"} {:array "$$tex"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tex != _value);
  requires {:source_name "tex"} {:array "$$tex"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tex != _value);
  requires {:source_name "tex"} {:array "$$tex"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$tex(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$tex;



implementation {:inline 1} _LOG_ATOMIC_$$tex(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$tex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$tex);
    return;
}



procedure _CHECK_ATOMIC_$$tex(_P: bool, _offset: bv32);
  requires {:source_name "tex"} {:array "$$tex"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset);
  requires {:source_name "tex"} {:array "$$tex"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$tex(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$tex;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$tex(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$tex := (if _P && _WRITE_HAS_OCCURRED_$$tex && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$tex);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
