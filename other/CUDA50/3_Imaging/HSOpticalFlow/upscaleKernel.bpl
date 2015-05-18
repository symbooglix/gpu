type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "out"} {:global} $$out: [bv32]bv32;

axiom {:array_info "$$out"} {:global} {:elem_width 32} {:source_name "out"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$out: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$out: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$out: bool;

axiom {:array_info "$$0"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$texCoarse"} {:global} {:elem_width 8} {:source_name "texCoarse"} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$texCoarse: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$texCoarse: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$texCoarse: bool;

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

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

procedure {:source_name "UpscaleKernel"} {:kernel} $_Z13UpscaleKerneliiifPf($width: bv32, $height: bv32, $stride: bv32, $scale: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 320bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $height == 240bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $stride == 320bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$out && !_WRITE_HAS_OCCURRED_$$out && !_ATOMIC_HAS_OCCURRED_$$out;
  requires !_READ_HAS_OCCURRED_$$texCoarse && !_WRITE_HAS_OCCURRED_$$texCoarse && !_ATOMIC_HAS_OCCURRED_$$texCoarse;
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
  modifies _WRITE_HAS_OCCURRED_$$out, _WRITE_READ_BENIGN_FLAG_$$out, _WRITE_READ_BENIGN_FLAG_$$out;



implementation {:source_name "UpscaleKernel"} {:kernel} $_Z13UpscaleKerneliiifPf($width: bv32, $height: bv32, $stride: bv32, $scale: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bool;
  var v3$2: bool;
  var v8$1: bv8;
  var v8$2: bv8;
  var v4$1: bv8;
  var v4$2: bv8;
  var v5$1: bv8;
  var v5$2: bv8;
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
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
  var v28$1: bv32;
  var v28$2: bv32;
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
  var _HAVOC_bv8$1: bv8;
  var _HAVOC_bv8$2: bv8;


  $0:
    v0$1 := BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, group_size_x));
    v0$2 := BV32_ADD(local_id_x$2, BV32_MUL(group_id_x$2, group_size_x));
    v1$1 := BV32_ADD(local_id_y$1, BV32_MUL(group_id_y$1, group_size_y));
    v1$2 := BV32_ADD(local_id_y$2, BV32_MUL(group_id_y$2, group_size_y));
    v2$1 := BV32_SGE(v0$1, $width);
    v2$2 := BV32_SGE(v0$2, $width);
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
    p3$1 := (if v2$1 then v2$1 else p3$1);
    p3$2 := (if v2$2 then v2$2 else p3$2);
    p1$1 := (if !v2$1 then !v2$1 else p1$1);
    p1$2 := (if !v2$2 then !v2$2 else p1$2);
    p3$1 := (if p0$1 then true else p3$1);
    p3$2 := (if p0$2 then true else p3$2);
    v3$1 := (if p1$1 then BV32_SGE(v1$1, $height) else v3$1);
    v3$2 := (if p1$2 then BV32_SGE(v1$2, $height) else v3$2);
    p3$1 := (if p1$1 && v3$1 then v3$1 else p3$1);
    p3$2 := (if p1$2 && v3$2 then v3$2 else p3$2);
    p4$1 := (if p1$1 && !v3$1 then !v3$1 else p4$1);
    p4$2 := (if p1$2 && !v3$2 then !v3$2 else p4$2);
    p3$1 := (if p2$1 then true else p3$1);
    p3$2 := (if p2$2 then true else p3$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v4$1 := (if p4$1 then _HAVOC_bv8$1 else v4$1);
    v4$2 := (if p4$2 then _HAVOC_bv8$2 else v4$2);
    $$0$0bv32$1 := (if p4$1 then v4$1 else $$0$0bv32$1);
    $$0$0bv32$2 := (if p4$2 then v4$2 else $$0$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v5$1 := (if p4$1 then _HAVOC_bv8$1 else v5$1);
    v5$2 := (if p4$2 then _HAVOC_bv8$2 else v5$2);
    $$0$1bv32$1 := (if p4$1 then v5$1 else $$0$1bv32$1);
    $$0$1bv32$2 := (if p4$2 then v5$2 else $$0$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v6$1 := (if p4$1 then _HAVOC_bv8$1 else v6$1);
    v6$2 := (if p4$2 then _HAVOC_bv8$2 else v6$2);
    $$0$2bv32$1 := (if p4$1 then v6$1 else $$0$2bv32$1);
    $$0$2bv32$2 := (if p4$2 then v6$2 else $$0$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v7$1 := (if p4$1 then _HAVOC_bv8$1 else v7$1);
    v7$2 := (if p4$2 then _HAVOC_bv8$2 else v7$2);
    $$0$3bv32$1 := (if p4$1 then v7$1 else $$0$3bv32$1);
    $$0$3bv32$2 := (if p4$2 then v7$2 else $$0$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v8$1 := (if p4$1 then _HAVOC_bv8$1 else v8$1);
    v8$2 := (if p4$2 then _HAVOC_bv8$2 else v8$2);
    $$0$4bv32$1 := (if p4$1 then v8$1 else $$0$4bv32$1);
    $$0$4bv32$2 := (if p4$2 then v8$2 else $$0$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v9$1 := (if p4$1 then _HAVOC_bv8$1 else v9$1);
    v9$2 := (if p4$2 then _HAVOC_bv8$2 else v9$2);
    $$0$5bv32$1 := (if p4$1 then v9$1 else $$0$5bv32$1);
    $$0$5bv32$2 := (if p4$2 then v9$2 else $$0$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v10$1 := (if p4$1 then _HAVOC_bv8$1 else v10$1);
    v10$2 := (if p4$2 then _HAVOC_bv8$2 else v10$2);
    $$0$6bv32$1 := (if p4$1 then v10$1 else $$0$6bv32$1);
    $$0$6bv32$2 := (if p4$2 then v10$2 else $$0$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v11$1 := (if p4$1 then _HAVOC_bv8$1 else v11$1);
    v11$2 := (if p4$2 then _HAVOC_bv8$2 else v11$2);
    $$0$7bv32$1 := (if p4$1 then v11$1 else $$0$7bv32$1);
    $$0$7bv32$2 := (if p4$2 then v11$2 else $$0$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v12$1 := (if p4$1 then _HAVOC_bv8$1 else v12$1);
    v12$2 := (if p4$2 then _HAVOC_bv8$2 else v12$2);
    $$0$8bv32$1 := (if p4$1 then v12$1 else $$0$8bv32$1);
    $$0$8bv32$2 := (if p4$2 then v12$2 else $$0$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v13$1 := (if p4$1 then _HAVOC_bv8$1 else v13$1);
    v13$2 := (if p4$2 then _HAVOC_bv8$2 else v13$2);
    $$0$9bv32$1 := (if p4$1 then v13$1 else $$0$9bv32$1);
    $$0$9bv32$2 := (if p4$2 then v13$2 else $$0$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v14$1 := (if p4$1 then _HAVOC_bv8$1 else v14$1);
    v14$2 := (if p4$2 then _HAVOC_bv8$2 else v14$2);
    $$0$10bv32$1 := (if p4$1 then v14$1 else $$0$10bv32$1);
    $$0$10bv32$2 := (if p4$2 then v14$2 else $$0$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v15$1 := (if p4$1 then _HAVOC_bv8$1 else v15$1);
    v15$2 := (if p4$2 then _HAVOC_bv8$2 else v15$2);
    $$0$11bv32$1 := (if p4$1 then v15$1 else $$0$11bv32$1);
    $$0$11bv32$2 := (if p4$2 then v15$2 else $$0$11bv32$2);
    v16$1 := (if p4$1 then $$0$0bv32$1 else v16$1);
    v16$2 := (if p4$2 then $$0$0bv32$2 else v16$2);
    v17$1 := (if p4$1 then $$0$1bv32$1 else v17$1);
    v17$2 := (if p4$2 then $$0$1bv32$2 else v17$2);
    v18$1 := (if p4$1 then $$0$2bv32$1 else v18$1);
    v18$2 := (if p4$2 then $$0$2bv32$2 else v18$2);
    v19$1 := (if p4$1 then $$0$3bv32$1 else v19$1);
    v19$2 := (if p4$2 then $$0$3bv32$2 else v19$2);
    v20$1 := (if p4$1 then $$0$4bv32$1 else v20$1);
    v20$2 := (if p4$2 then $$0$4bv32$2 else v20$2);
    v21$1 := (if p4$1 then $$0$5bv32$1 else v21$1);
    v21$2 := (if p4$2 then $$0$5bv32$2 else v21$2);
    v22$1 := (if p4$1 then $$0$6bv32$1 else v22$1);
    v22$2 := (if p4$2 then $$0$6bv32$2 else v22$2);
    v23$1 := (if p4$1 then $$0$7bv32$1 else v23$1);
    v23$2 := (if p4$2 then $$0$7bv32$2 else v23$2);
    v24$1 := (if p4$1 then $$0$8bv32$1 else v24$1);
    v24$2 := (if p4$2 then $$0$8bv32$2 else v24$2);
    v25$1 := (if p4$1 then $$0$9bv32$1 else v25$1);
    v25$2 := (if p4$2 then $$0$9bv32$2 else v25$2);
    v26$1 := (if p4$1 then $$0$10bv32$1 else v26$1);
    v26$2 := (if p4$2 then $$0$10bv32$2 else v26$2);
    v27$1 := (if p4$1 then $$0$11bv32$1 else v27$1);
    v27$2 := (if p4$2 then $$0$11bv32$2 else v27$2);
    call {:sourceloc_num 43} v28$1, v28$2 := $_Z5tex2DIfET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p4$1, v19$1 ++ v18$1 ++ v17$1 ++ v16$1, v23$1 ++ v22$1 ++ v21$1 ++ v20$1, v27$1 ++ v26$1 ++ v25$1 ++ v24$1, FDIV32(FADD32(SI32_TO_FP32(v0$1), 1056964608bv32), SI32_TO_FP32($width)), FDIV32(FADD32(SI32_TO_FP32(v1$1), 1056964608bv32), SI32_TO_FP32($height)), p4$2, v19$2 ++ v18$2 ++ v17$2 ++ v16$2, v23$2 ++ v22$2 ++ v21$2 ++ v20$2, v27$2 ++ v26$2 ++ v25$2 ++ v24$2, FDIV32(FADD32(SI32_TO_FP32(v0$2), 1056964608bv32), SI32_TO_FP32($width)), FDIV32(FADD32(SI32_TO_FP32(v1$2), 1056964608bv32), SI32_TO_FP32($height)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIfET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$out(p4$1, BV32_ADD(v0$1, BV32_MUL(v1$1, $stride)), FMUL32(v28$1, $scale), $$out[BV32_ADD(v0$1, BV32_MUL(v1$1, $stride))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(p4$2, BV32_ADD(v0$2, BV32_MUL(v1$2, $stride)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$out(p4$2, BV32_ADD(v0$2, BV32_MUL(v1$2, $stride)), FMUL32(v28$2, $scale));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(v0$1, BV32_MUL(v1$1, $stride))] := (if p4$1 then FMUL32(v28$1, $scale) else $$out[BV32_ADD(v0$1, BV32_MUL(v1$1, $stride))]);
    $$out[BV32_ADD(v0$2, BV32_MUL(v1$2, $stride))] := (if p4$2 then FMUL32(v28$2, $scale) else $$out[BV32_ADD(v0$2, BV32_MUL(v1$2, $stride))]);
    return;
}



procedure {:source_name "_Z5tex2DIfET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} $_Z5tex2DIfET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(_P$1: bool, $0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 10bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 30bv32 then 1bv1 else 0bv1) != 0bv1;

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

const _WATCHED_VALUE_$$out: bv32;

procedure {:inline 1} _LOG_READ_$$out(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$out;



implementation {:inline 1} _LOG_READ_$$out(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then true else _READ_HAS_OCCURRED_$$out);
    return;
}



procedure _CHECK_READ_$$out(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$out);
  requires {:source_name "out"} {:array "$$out"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$out: bool;

procedure {:inline 1} _LOG_WRITE_$$out(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$out, _WRITE_READ_BENIGN_FLAG_$$out;



implementation {:inline 1} _LOG_WRITE_$$out(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then true else _WRITE_HAS_OCCURRED_$$out);
    _WRITE_READ_BENIGN_FLAG_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$out);
    return;
}



procedure _CHECK_WRITE_$$out(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out != _value);
  requires {:source_name "out"} {:array "$$out"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out != _value);
  requires {:source_name "out"} {:array "$$out"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$out(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$out;



implementation {:inline 1} _LOG_ATOMIC_$$out(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$out);
    return;
}



procedure _CHECK_ATOMIC_$$out(_P: bool, _offset: bv32);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);
  requires {:source_name "out"} {:array "$$out"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$out;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$out := (if _P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$out);
    return;
}



const _WATCHED_VALUE_$$texCoarse: bv8;

procedure {:inline 1} _LOG_READ_$$texCoarse(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$texCoarse;



implementation {:inline 1} _LOG_READ_$$texCoarse(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$texCoarse := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texCoarse == _value then true else _READ_HAS_OCCURRED_$$texCoarse);
    return;
}



procedure _CHECK_READ_$$texCoarse(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "texCoarse"} {:array "$$texCoarse"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$texCoarse && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$texCoarse);
  requires {:source_name "texCoarse"} {:array "$$texCoarse"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$texCoarse && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$texCoarse: bool;

procedure {:inline 1} _LOG_WRITE_$$texCoarse(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$texCoarse, _WRITE_READ_BENIGN_FLAG_$$texCoarse;



implementation {:inline 1} _LOG_WRITE_$$texCoarse(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$texCoarse := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texCoarse == _value then true else _WRITE_HAS_OCCURRED_$$texCoarse);
    _WRITE_READ_BENIGN_FLAG_$$texCoarse := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texCoarse == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$texCoarse);
    return;
}



procedure _CHECK_WRITE_$$texCoarse(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "texCoarse"} {:array "$$texCoarse"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$texCoarse && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texCoarse != _value);
  requires {:source_name "texCoarse"} {:array "$$texCoarse"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$texCoarse && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texCoarse != _value);
  requires {:source_name "texCoarse"} {:array "$$texCoarse"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$texCoarse && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$texCoarse(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$texCoarse;



implementation {:inline 1} _LOG_ATOMIC_$$texCoarse(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$texCoarse := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$texCoarse);
    return;
}



procedure _CHECK_ATOMIC_$$texCoarse(_P: bool, _offset: bv32);
  requires {:source_name "texCoarse"} {:array "$$texCoarse"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$texCoarse && _WATCHED_OFFSET == _offset);
  requires {:source_name "texCoarse"} {:array "$$texCoarse"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$texCoarse && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$texCoarse(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$texCoarse;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$texCoarse(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$texCoarse := (if _P && _WRITE_HAS_OCCURRED_$$texCoarse && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$texCoarse);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
