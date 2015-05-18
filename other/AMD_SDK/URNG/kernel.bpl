type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "inputImage"} {:global} $$inputImage: [bv32]bv8;

axiom {:array_info "$$inputImage"} {:global} {:elem_width 8} {:source_name "inputImage"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$inputImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$inputImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$inputImage: bool;

var {:source_name "outputImage"} {:global} $$outputImage: [bv32]bv8;

axiom {:array_info "$$outputImage"} {:global} {:elem_width 8} {:source_name "outputImage"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$outputImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$outputImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$outputImage: bool;

var {:source_name "iv"} {:group_shared} $$noise_uniform.iv: [bv1][bv32]bv32;

axiom {:array_info "$$noise_uniform.iv"} {:group_shared} {:elem_width 32} {:source_name "iv"} {:source_elem_width 32} {:source_dimensions "1024"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$noise_uniform.iv: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$noise_uniform.iv: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$noise_uniform.iv: bool;

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

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FP32_TO_SI32(bv32) : bv32;

function FP32_TO_UI8(bv32) : bv8;

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function UI8_TO_FP32(bv8) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV8_AND(bv8, bv8) : bv8;

function {:bvbuiltin "bvashr"} BV8_ASHR(bv8, bv8) : bv8;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV8_OR(bv8, bv8) : bv8;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvxor"} BV8_XOR(bv8, bv8) : bv8;

function {:bvbuiltin "sign_extend 31"} BV1_SEXT32(bv1) : bv32;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

procedure {:source_name "noise_uniform"} {:kernel} $noise_uniform($factor: bv32);
  requires !_READ_HAS_OCCURRED_$$inputImage && !_WRITE_HAS_OCCURRED_$$inputImage && !_ATOMIC_HAS_OCCURRED_$$inputImage;
  requires !_READ_HAS_OCCURRED_$$outputImage && !_WRITE_HAS_OCCURRED_$$outputImage && !_ATOMIC_HAS_OCCURRED_$$outputImage;
  requires !_READ_HAS_OCCURRED_$$noise_uniform.iv && !_WRITE_HAS_OCCURRED_$$noise_uniform.iv && !_ATOMIC_HAS_OCCURRED_$$noise_uniform.iv;
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
  modifies $$noise_uniform.iv, _READ_HAS_OCCURRED_$$noise_uniform.iv, _WRITE_HAS_OCCURRED_$$outputImage, _WRITE_READ_BENIGN_FLAG_$$outputImage, _WRITE_READ_BENIGN_FLAG_$$outputImage, _WRITE_HAS_OCCURRED_$$noise_uniform.iv, _WRITE_READ_BENIGN_FLAG_$$noise_uniform.iv, _WRITE_READ_BENIGN_FLAG_$$noise_uniform.iv;



implementation {:source_name "noise_uniform"} {:kernel} $noise_uniform($factor: bv32)
{
  var $j.i.0: bv32;
  var $.0$1: bv32;
  var $.0$2: bv32;
  var $.1$1: bv32;
  var $.1$2: bv32;
  var v1$1: bv8;
  var v1$2: bv8;
  var v0$1: bv32;
  var v0$2: bv32;
  var v2$1: bv8;
  var v2$2: bv8;
  var v3$1: bv8;
  var v3$2: bv8;
  var v4$1: bv8;
  var v4$2: bv8;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9: bool;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bool;
  var v12$2: bool;
  var v13: bool;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bool;
  var v17$2: bool;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv8;
  var v25$2: bv8;
  var v26$1: bv8;
  var v26$2: bv8;
  var v27$1: bv8;
  var v27$2: bv8;
  var v28$1: bv8;
  var v28$2: bv8;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;


  $0:
    v0$1 := BV32_ADD(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), BV32_MUL(group_size_x, num_groups_x)));
    v0$2 := BV32_ADD(BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), BV32_MUL(group_size_x, num_groups_x)));
    v1$1 := $$inputImage[BV32_MUL(v0$1, 4bv32)];
    v1$2 := $$inputImage[BV32_MUL(v0$2, 4bv32)];
    v2$1 := $$inputImage[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v2$2 := $$inputImage[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    v3$1 := $$inputImage[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v3$2 := $$inputImage[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    v4$1 := $$inputImage[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v4$2 := $$inputImage[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    v5$1 := UI8_TO_FP32(v1$1);
    v5$2 := UI8_TO_FP32(v1$2);
    v6$1 := UI8_TO_FP32(v2$1);
    v6$2 := UI8_TO_FP32(v2$2);
    v7$1 := UI8_TO_FP32(v3$1);
    v7$2 := UI8_TO_FP32(v3$2);
    v8$1 := local_id_x$1;
    v8$2 := local_id_x$2;
    $j.i.0, $.0$1 := 16bv32, FP32_TO_SI32(FSUB32(2147483648bv32, FDIV32(FADD32(FADD32(FADD32(v5$1, v6$1), v7$1), v6$1), 1082130432bv32)));
    $.0$2 := FP32_TO_SI32(FSUB32(2147483648bv32, FDIV32(FADD32(FADD32(FADD32(v5$2, v6$2), v7$2), v6$2), 1082130432bv32)));
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$noise_uniform.iv ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$noise_uniform.iv ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$noise_uniform.iv ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 5} true;
    v9 := BV32_SGE($j.i.0, 0bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v9 && !v9;
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$noise_uniform.iv(true, BV32_MUL(16bv32, v8$1), $$noise_uniform.iv[1bv1][BV32_MUL(16bv32, v8$1)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$noise_uniform.iv(true, BV32_MUL(16bv32, v8$2), $$noise_uniform.iv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(16bv32, v8$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$noise_uniform.iv"} true;
    v14$1 := $$noise_uniform.iv[1bv1][BV32_MUL(16bv32, v8$1)];
    v14$2 := $$noise_uniform.iv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(16bv32, v8$2)];
    v15$1 := BV32_SDIV($.0$1, 127773bv32);
    v15$2 := BV32_SDIV($.0$2, 127773bv32);
    v16$1 := BV32_SUB(BV32_MUL(16807bv32, BV32_SUB($.0$1, BV32_MUL(v15$1, 127773bv32))), BV32_MUL(2836bv32, v15$1));
    v16$2 := BV32_SUB(BV32_MUL(16807bv32, BV32_SUB($.0$2, BV32_MUL(v15$2, 127773bv32))), BV32_MUL(2836bv32, v15$2));
    v17$1 := BV32_SLT(v16$1, 0bv32);
    v17$2 := BV32_SLT(v16$2, 0bv32);
    v18$1 := BV32_SDIV(v14$1, 134217728bv32);
    v18$2 := BV32_SDIV(v14$2, 134217728bv32);
    assume BV1_ZEXT32((if BV32_SGE(v18$1, 0bv32) then 1bv1 else 0bv1)) != 0bv32 && BV1_ZEXT32((if BV32_SGE(v18$2, 0bv32) then 1bv1 else 0bv1)) != 0bv32;
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$noise_uniform.iv(true, BV32_ADD(BV32_MUL(16bv32, v8$1), v18$1), $$noise_uniform.iv[1bv1][BV32_ADD(BV32_MUL(16bv32, v8$1), v18$1)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$noise_uniform.iv(true, BV32_ADD(BV32_MUL(16bv32, v8$2), v18$2), $$noise_uniform.iv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(16bv32, v8$2), v18$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$noise_uniform.iv"} true;
    v19$1 := $$noise_uniform.iv[1bv1][BV32_ADD(BV32_MUL(16bv32, v8$1), v18$1)];
    v19$2 := $$noise_uniform.iv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(16bv32, v8$2), v18$2)];
    v20$1 := FMUL32(FSUB32(FMUL32(805306368bv32, SI32_TO_FP32(v19$1)), 1057803469bv32), SI32_TO_FP32($factor));
    v20$2 := FMUL32(FSUB32(FMUL32(805306368bv32, SI32_TO_FP32(v19$2)), 1057803469bv32), SI32_TO_FP32($factor));
    v21$1 := FADD32(v5$1, v20$1);
    v21$2 := FADD32(v5$2, v20$2);
    v22$1 := FADD32(v6$1, v20$1);
    v22$2 := FADD32(v6$2, v20$2);
    v23$1 := FADD32(v7$1, v20$1);
    v23$2 := FADD32(v7$2, v20$2);
    v24$1 := FADD32(UI8_TO_FP32(v4$1), v20$1);
    v24$2 := FADD32(UI8_TO_FP32(v4$2), v20$2);
    v25$1 := BV8_ASHR(BV1_SEXT32((if FLT32(1132396544bv32, v21$1) then 1bv1 else 0bv1))[8:0], 7bv8);
    v25$2 := BV8_ASHR(BV1_SEXT32((if FLT32(1132396544bv32, v21$2) then 1bv1 else 0bv1))[8:0], 7bv8);
    v26$1 := BV8_ASHR(BV1_SEXT32((if FLT32(1132396544bv32, v22$1) then 1bv1 else 0bv1))[8:0], 7bv8);
    v26$2 := BV8_ASHR(BV1_SEXT32((if FLT32(1132396544bv32, v22$2) then 1bv1 else 0bv1))[8:0], 7bv8);
    v27$1 := BV8_ASHR(BV1_SEXT32((if FLT32(1132396544bv32, v23$1) then 1bv1 else 0bv1))[8:0], 7bv8);
    v27$2 := BV8_ASHR(BV1_SEXT32((if FLT32(1132396544bv32, v23$2) then 1bv1 else 0bv1))[8:0], 7bv8);
    v28$1 := BV8_ASHR(BV1_SEXT32((if FLT32(1132396544bv32, v24$1) then 1bv1 else 0bv1))[8:0], 7bv8);
    v28$2 := BV8_ASHR(BV1_SEXT32((if FLT32(1132396544bv32, v24$2) then 1bv1 else 0bv1))[8:0], 7bv8);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$outputImage(true, BV32_MUL(v0$1, 4bv32), BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v21$1), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v21$1, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v25$1, 255bv8)), v25$1), $$outputImage[BV32_MUL(v0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(true, BV32_MUL(v0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$outputImage(true, BV32_MUL(v0$2, 4bv32), BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v21$2), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v21$2, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v25$2, 255bv8)), v25$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_MUL(v0$1, 4bv32)] := BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v21$1), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v21$1, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v25$1, 255bv8)), v25$1);
    $$outputImage[BV32_MUL(v0$2, 4bv32)] := BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v21$2), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v21$2, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v25$2, 255bv8)), v25$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$outputImage(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32), BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v22$1), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v22$1, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v26$1, 255bv8)), v26$1), $$outputImage[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$outputImage(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32), BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v22$2), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v22$2, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v26$2, 255bv8)), v26$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)] := BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v22$1), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v22$1, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v26$1, 255bv8)), v26$1);
    $$outputImage[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)] := BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v22$2), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v22$2, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v26$2, 255bv8)), v26$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$outputImage(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32), BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v23$1), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v23$1, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v27$1, 255bv8)), v27$1), $$outputImage[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$outputImage(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32), BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v23$2), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v23$2, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v27$2, 255bv8)), v27$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)] := BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v23$1), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v23$1, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v27$1, 255bv8)), v27$1);
    $$outputImage[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)] := BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v23$2), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v23$2, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v27$2, 255bv8)), v27$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$outputImage(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32), BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v24$1), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v24$1, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v28$1, 255bv8)), v28$1), $$outputImage[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$outputImage(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32), BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v24$2), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v24$2, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v28$2, 255bv8)), v28$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)] := BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v24$1), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v24$1, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v28$1, 255bv8)), v28$1);
    $$outputImage[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)] := BV8_OR(BV8_AND(BV8_AND(FP32_TO_UI8(v24$2), BV8_XOR(BV8_ASHR(BV1_SEXT32((if FLT32(v24$2, 0bv32) then 1bv1 else 0bv1))[8:0], 7bv8), 255bv8)), BV8_XOR(v28$2, 255bv8)), v28$2);
    return;

  $truebb:
    assume {:partition} v9 && v9;
    v10$1 := BV32_SDIV($.0$1, 127773bv32);
    v10$2 := BV32_SDIV($.0$2, 127773bv32);
    v11$1 := BV32_SUB(BV32_MUL(16807bv32, BV32_SUB($.0$1, BV32_MUL(v10$1, 127773bv32))), BV32_MUL(2836bv32, v10$1));
    v11$2 := BV32_SUB(BV32_MUL(16807bv32, BV32_SUB($.0$2, BV32_MUL(v10$2, 127773bv32))), BV32_MUL(2836bv32, v10$2));
    v12$1 := BV32_SLT(v11$1, 0bv32);
    v12$2 := BV32_SLT(v11$2, 0bv32);
    p1$1 := (if v12$1 then v12$1 else p1$1);
    p1$2 := (if v12$2 then v12$2 else p1$2);
    p0$1 := (if !v12$1 then !v12$1 else p0$1);
    p0$2 := (if !v12$2 then !v12$2 else p0$2);
    $.1$1 := (if p0$1 then v11$1 else $.1$1);
    $.1$2 := (if p0$2 then v11$2 else $.1$2);
    $.1$1 := (if p1$1 then BV32_ADD(v11$1, 2147483647bv32) else $.1$1);
    $.1$2 := (if p1$2 then BV32_ADD(v11$2, 2147483647bv32) else $.1$2);
    v13 := BV32_SLT($j.i.0, 16bv32);
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v13 && !v13;
    goto $6;

  $6:
    $j.i.0, $.0$1 := BV32_ADD($j.i.0, 4294967295bv32), $.1$1;
    $.0$2 := $.1$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $truebb1:
    assume {:partition} v13 && v13;
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$noise_uniform.iv(true, BV32_ADD(BV32_MUL(16bv32, v8$1), $j.i.0), $.1$1, $$noise_uniform.iv[1bv1][BV32_ADD(BV32_MUL(16bv32, v8$1), $j.i.0)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$noise_uniform.iv(true, BV32_ADD(BV32_MUL(16bv32, v8$2), $j.i.0));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$noise_uniform.iv(true, BV32_ADD(BV32_MUL(16bv32, v8$2), $j.i.0), $.1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$noise_uniform.iv"} true;
    $$noise_uniform.iv[1bv1][BV32_ADD(BV32_MUL(16bv32, v8$1), $j.i.0)] := $.1$1;
    $$noise_uniform.iv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(16bv32, v8$2), $j.i.0)] := $.1$2;
    goto $6;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$inputImage: bv8;

procedure {:inline 1} _LOG_READ_$$inputImage(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$inputImage;



implementation {:inline 1} _LOG_READ_$$inputImage(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$inputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inputImage == _value then true else _READ_HAS_OCCURRED_$$inputImage);
    return;
}



procedure _CHECK_READ_$$inputImage(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$inputImage);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$inputImage: bool;

procedure {:inline 1} _LOG_WRITE_$$inputImage(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$inputImage, _WRITE_READ_BENIGN_FLAG_$$inputImage;



implementation {:inline 1} _LOG_WRITE_$$inputImage(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$inputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inputImage == _value then true else _WRITE_HAS_OCCURRED_$$inputImage);
    _WRITE_READ_BENIGN_FLAG_$$inputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inputImage == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$inputImage);
    return;
}



procedure _CHECK_WRITE_$$inputImage(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inputImage != _value);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inputImage != _value);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$inputImage(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$inputImage;



implementation {:inline 1} _LOG_ATOMIC_$$inputImage(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$inputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$inputImage);
    return;
}



procedure _CHECK_ATOMIC_$$inputImage(_P: bool, _offset: bv32);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$inputImage(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$inputImage;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$inputImage(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$inputImage := (if _P && _WRITE_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$inputImage);
    return;
}



const _WATCHED_VALUE_$$outputImage: bv8;

procedure {:inline 1} _LOG_READ_$$outputImage(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$outputImage;



implementation {:inline 1} _LOG_READ_$$outputImage(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$outputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputImage == _value then true else _READ_HAS_OCCURRED_$$outputImage);
    return;
}



procedure _CHECK_READ_$$outputImage(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "outputImage"} {:array "$$outputImage"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$outputImage);
  requires {:source_name "outputImage"} {:array "$$outputImage"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$outputImage: bool;

procedure {:inline 1} _LOG_WRITE_$$outputImage(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$outputImage, _WRITE_READ_BENIGN_FLAG_$$outputImage;



implementation {:inline 1} _LOG_WRITE_$$outputImage(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$outputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputImage == _value then true else _WRITE_HAS_OCCURRED_$$outputImage);
    _WRITE_READ_BENIGN_FLAG_$$outputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputImage == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$outputImage);
    return;
}



procedure _CHECK_WRITE_$$outputImage(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "outputImage"} {:array "$$outputImage"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputImage != _value);
  requires {:source_name "outputImage"} {:array "$$outputImage"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputImage != _value);
  requires {:source_name "outputImage"} {:array "$$outputImage"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$outputImage(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$outputImage;



implementation {:inline 1} _LOG_ATOMIC_$$outputImage(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$outputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$outputImage);
    return;
}



procedure _CHECK_ATOMIC_$$outputImage(_P: bool, _offset: bv32);
  requires {:source_name "outputImage"} {:array "$$outputImage"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset);
  requires {:source_name "outputImage"} {:array "$$outputImage"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$outputImage;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$outputImage := (if _P && _WRITE_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$outputImage);
    return;
}



const _WATCHED_VALUE_$$noise_uniform.iv: bv32;

procedure {:inline 1} _LOG_READ_$$noise_uniform.iv(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$noise_uniform.iv;



implementation {:inline 1} _LOG_READ_$$noise_uniform.iv(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$noise_uniform.iv := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$noise_uniform.iv == _value then true else _READ_HAS_OCCURRED_$$noise_uniform.iv);
    return;
}



procedure _CHECK_READ_$$noise_uniform.iv(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "iv"} {:array "$$noise_uniform.iv"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$noise_uniform.iv && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$noise_uniform.iv && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "iv"} {:array "$$noise_uniform.iv"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$noise_uniform.iv && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$noise_uniform.iv: bool;

procedure {:inline 1} _LOG_WRITE_$$noise_uniform.iv(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$noise_uniform.iv, _WRITE_READ_BENIGN_FLAG_$$noise_uniform.iv;



implementation {:inline 1} _LOG_WRITE_$$noise_uniform.iv(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$noise_uniform.iv := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$noise_uniform.iv == _value then true else _WRITE_HAS_OCCURRED_$$noise_uniform.iv);
    _WRITE_READ_BENIGN_FLAG_$$noise_uniform.iv := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$noise_uniform.iv == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$noise_uniform.iv);
    return;
}



procedure _CHECK_WRITE_$$noise_uniform.iv(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "iv"} {:array "$$noise_uniform.iv"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$noise_uniform.iv && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$noise_uniform.iv != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "iv"} {:array "$$noise_uniform.iv"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$noise_uniform.iv && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$noise_uniform.iv != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "iv"} {:array "$$noise_uniform.iv"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$noise_uniform.iv && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$noise_uniform.iv(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$noise_uniform.iv;



implementation {:inline 1} _LOG_ATOMIC_$$noise_uniform.iv(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$noise_uniform.iv := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$noise_uniform.iv);
    return;
}



procedure _CHECK_ATOMIC_$$noise_uniform.iv(_P: bool, _offset: bv32);
  requires {:source_name "iv"} {:array "$$noise_uniform.iv"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$noise_uniform.iv && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "iv"} {:array "$$noise_uniform.iv"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$noise_uniform.iv && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$noise_uniform.iv(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$noise_uniform.iv;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$noise_uniform.iv(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$noise_uniform.iv := (if _P && _WRITE_HAS_OCCURRED_$$noise_uniform.iv && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$noise_uniform.iv);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
