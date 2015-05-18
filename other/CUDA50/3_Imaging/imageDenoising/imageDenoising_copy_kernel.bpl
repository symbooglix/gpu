type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "dst"} {:global} $$dst: [bv32]bv32;

axiom {:array_info "$$dst"} {:global} {:elem_width 32} {:source_name "dst"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$dst: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$dst: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$dst: bool;

axiom {:array_info "$$fresult"} {:elem_width 32} {:source_name "fresult"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$0"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$texImage"} {:global} {:elem_width 8} {:source_name "texImage"} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$texImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$texImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$texImage: bool;

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

function FP32_TO_SI32(bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV32_OR(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "Copy"} {:kernel} $_Z4CopyPjii($imageW: bv32, $imageH: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $imageW == 320bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$dst && !_WRITE_HAS_OCCURRED_$$dst && !_ATOMIC_HAS_OCCURRED_$$dst;
  requires !_READ_HAS_OCCURRED_$$texImage && !_WRITE_HAS_OCCURRED_$$texImage && !_ATOMIC_HAS_OCCURRED_$$texImage;
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
  modifies _WRITE_HAS_OCCURRED_$$dst, _WRITE_READ_BENIGN_FLAG_$$dst, _WRITE_READ_BENIGN_FLAG_$$dst;



implementation {:source_name "Copy"} {:kernel} $_Z4CopyPjii($imageW: bv32, $imageH: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bool;
  var v3$2: bool;
  var v4$1: bv8;
  var v4$2: bv8;
  var v5$1: bv8;
  var v5$2: bv8;
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v8$1: bv8;
  var v8$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v21$1: bv8;
  var v21$2: bv8;
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
  var v28$1: bv128;
  var v28$2: bv128;
  var v29$1: bv32;
  var v29$2: bv32;
  var v30$1: bv32;
  var v30$2: bv32;
  var v31$1: bv32;
  var v31$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;
  var _HAVOC_bv8$1: bv8;
  var _HAVOC_bv8$2: bv8;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    v2$1 := BV32_SLT(v0$1, $imageW);
    v2$2 := BV32_SLT(v0$2, $imageW);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p0$1 := (if v2$1 then v2$1 else p0$1);
    p0$2 := (if v2$2 then v2$2 else p0$2);
    v3$1 := (if p0$1 then BV32_SLT(v1$1, $imageH) else v3$1);
    v3$2 := (if p0$2 then BV32_SLT(v1$2, $imageH) else v3$2);
    p1$1 := (if p0$1 && v3$1 then v3$1 else p1$1);
    p1$2 := (if p0$2 && v3$2 then v3$2 else p1$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v4$1 := (if p1$1 then _HAVOC_bv8$1 else v4$1);
    v4$2 := (if p1$2 then _HAVOC_bv8$2 else v4$2);
    $$0$0bv32$1 := (if p1$1 then v4$1 else $$0$0bv32$1);
    $$0$0bv32$2 := (if p1$2 then v4$2 else $$0$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v5$1 := (if p1$1 then _HAVOC_bv8$1 else v5$1);
    v5$2 := (if p1$2 then _HAVOC_bv8$2 else v5$2);
    $$0$1bv32$1 := (if p1$1 then v5$1 else $$0$1bv32$1);
    $$0$1bv32$2 := (if p1$2 then v5$2 else $$0$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v6$1 := (if p1$1 then _HAVOC_bv8$1 else v6$1);
    v6$2 := (if p1$2 then _HAVOC_bv8$2 else v6$2);
    $$0$2bv32$1 := (if p1$1 then v6$1 else $$0$2bv32$1);
    $$0$2bv32$2 := (if p1$2 then v6$2 else $$0$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v7$1 := (if p1$1 then _HAVOC_bv8$1 else v7$1);
    v7$2 := (if p1$2 then _HAVOC_bv8$2 else v7$2);
    $$0$3bv32$1 := (if p1$1 then v7$1 else $$0$3bv32$1);
    $$0$3bv32$2 := (if p1$2 then v7$2 else $$0$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v8$1 := (if p1$1 then _HAVOC_bv8$1 else v8$1);
    v8$2 := (if p1$2 then _HAVOC_bv8$2 else v8$2);
    $$0$4bv32$1 := (if p1$1 then v8$1 else $$0$4bv32$1);
    $$0$4bv32$2 := (if p1$2 then v8$2 else $$0$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v9$1 := (if p1$1 then _HAVOC_bv8$1 else v9$1);
    v9$2 := (if p1$2 then _HAVOC_bv8$2 else v9$2);
    $$0$5bv32$1 := (if p1$1 then v9$1 else $$0$5bv32$1);
    $$0$5bv32$2 := (if p1$2 then v9$2 else $$0$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v10$1 := (if p1$1 then _HAVOC_bv8$1 else v10$1);
    v10$2 := (if p1$2 then _HAVOC_bv8$2 else v10$2);
    $$0$6bv32$1 := (if p1$1 then v10$1 else $$0$6bv32$1);
    $$0$6bv32$2 := (if p1$2 then v10$2 else $$0$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v11$1 := (if p1$1 then _HAVOC_bv8$1 else v11$1);
    v11$2 := (if p1$2 then _HAVOC_bv8$2 else v11$2);
    $$0$7bv32$1 := (if p1$1 then v11$1 else $$0$7bv32$1);
    $$0$7bv32$2 := (if p1$2 then v11$2 else $$0$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v12$1 := (if p1$1 then _HAVOC_bv8$1 else v12$1);
    v12$2 := (if p1$2 then _HAVOC_bv8$2 else v12$2);
    $$0$8bv32$1 := (if p1$1 then v12$1 else $$0$8bv32$1);
    $$0$8bv32$2 := (if p1$2 then v12$2 else $$0$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v13$1 := (if p1$1 then _HAVOC_bv8$1 else v13$1);
    v13$2 := (if p1$2 then _HAVOC_bv8$2 else v13$2);
    $$0$9bv32$1 := (if p1$1 then v13$1 else $$0$9bv32$1);
    $$0$9bv32$2 := (if p1$2 then v13$2 else $$0$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v14$1 := (if p1$1 then _HAVOC_bv8$1 else v14$1);
    v14$2 := (if p1$2 then _HAVOC_bv8$2 else v14$2);
    $$0$10bv32$1 := (if p1$1 then v14$1 else $$0$10bv32$1);
    $$0$10bv32$2 := (if p1$2 then v14$2 else $$0$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v15$1 := (if p1$1 then _HAVOC_bv8$1 else v15$1);
    v15$2 := (if p1$2 then _HAVOC_bv8$2 else v15$2);
    $$0$11bv32$1 := (if p1$1 then v15$1 else $$0$11bv32$1);
    $$0$11bv32$2 := (if p1$2 then v15$2 else $$0$11bv32$2);
    v16$1 := (if p1$1 then $$0$0bv32$1 else v16$1);
    v16$2 := (if p1$2 then $$0$0bv32$2 else v16$2);
    v17$1 := (if p1$1 then $$0$1bv32$1 else v17$1);
    v17$2 := (if p1$2 then $$0$1bv32$2 else v17$2);
    v18$1 := (if p1$1 then $$0$2bv32$1 else v18$1);
    v18$2 := (if p1$2 then $$0$2bv32$2 else v18$2);
    v19$1 := (if p1$1 then $$0$3bv32$1 else v19$1);
    v19$2 := (if p1$2 then $$0$3bv32$2 else v19$2);
    v20$1 := (if p1$1 then $$0$4bv32$1 else v20$1);
    v20$2 := (if p1$2 then $$0$4bv32$2 else v20$2);
    v21$1 := (if p1$1 then $$0$5bv32$1 else v21$1);
    v21$2 := (if p1$2 then $$0$5bv32$2 else v21$2);
    v22$1 := (if p1$1 then $$0$6bv32$1 else v22$1);
    v22$2 := (if p1$2 then $$0$6bv32$2 else v22$2);
    v23$1 := (if p1$1 then $$0$7bv32$1 else v23$1);
    v23$2 := (if p1$2 then $$0$7bv32$2 else v23$2);
    v24$1 := (if p1$1 then $$0$8bv32$1 else v24$1);
    v24$2 := (if p1$2 then $$0$8bv32$2 else v24$2);
    v25$1 := (if p1$1 then $$0$9bv32$1 else v25$1);
    v25$2 := (if p1$2 then $$0$9bv32$2 else v25$2);
    v26$1 := (if p1$1 then $$0$10bv32$1 else v26$1);
    v26$2 := (if p1$2 then $$0$10bv32$2 else v26$2);
    v27$1 := (if p1$1 then $$0$11bv32$1 else v27$1);
    v27$2 := (if p1$2 then $$0$11bv32$2 else v27$2);
    call {:sourceloc_num 40} v28$1, v28$2 := $_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff(p1$1, v19$1 ++ v18$1 ++ v17$1 ++ v16$1, v23$1 ++ v22$1 ++ v21$1 ++ v20$1, v27$1 ++ v26$1 ++ v25$1 ++ v24$1, FADD32(SI32_TO_FP32(v0$1), 1056964608bv32), FADD32(SI32_TO_FP32(v1$1), 1056964608bv32), p1$2, v19$2 ++ v18$2 ++ v17$2 ++ v16$2, v23$2 ++ v22$2 ++ v21$2 ++ v20$2, v27$2 ++ v26$2 ++ v25$2 ++ v24$2, FADD32(SI32_TO_FP32(v0$2), 1056964608bv32), FADD32(SI32_TO_FP32(v1$2), 1056964608bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff"} true;
    $$fresult$0bv32$1 := (if p1$1 then v28$1[32:0] else $$fresult$0bv32$1);
    $$fresult$0bv32$2 := (if p1$2 then v28$2[32:0] else $$fresult$0bv32$2);
    $$fresult$1bv32$1 := (if p1$1 then v28$1[64:32] else $$fresult$1bv32$1);
    $$fresult$1bv32$2 := (if p1$2 then v28$2[64:32] else $$fresult$1bv32$2);
    $$fresult$2bv32$1 := (if p1$1 then v28$1[96:64] else $$fresult$2bv32$1);
    $$fresult$2bv32$2 := (if p1$2 then v28$2[96:64] else $$fresult$2bv32$2);
    $$fresult$3bv32$1 := (if p1$1 then v28$1[128:96] else $$fresult$3bv32$1);
    $$fresult$3bv32$2 := (if p1$2 then v28$2[128:96] else $$fresult$3bv32$2);
    v29$1 := (if p1$1 then $$fresult$0bv32$1 else v29$1);
    v29$2 := (if p1$2 then $$fresult$0bv32$2 else v29$2);
    v30$1 := (if p1$1 then $$fresult$1bv32$1 else v30$1);
    v30$2 := (if p1$2 then $$fresult$1bv32$2 else v30$2);
    v31$1 := (if p1$1 then $$fresult$2bv32$1 else v31$1);
    v31$2 := (if p1$2 then $$fresult$2bv32$2 else v31$2);
    call {:sourceloc} {:sourceloc_num 48} _LOG_WRITE_$$dst(p1$1, BV32_ADD(BV32_MUL($imageW, v1$1), v0$1), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_SI32(FMUL32(0bv32, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_SI32(FMUL32(v31$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_SI32(FMUL32(v30$1, 1132396544bv32)), 8bv32)), FP32_TO_SI32(FMUL32(v29$1, 1132396544bv32))), $$dst[BV32_ADD(BV32_MUL($imageW, v1$1), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dst(p1$2, BV32_ADD(BV32_MUL($imageW, v1$2), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 48} _CHECK_WRITE_$$dst(p1$2, BV32_ADD(BV32_MUL($imageW, v1$2), v0$2), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_SI32(FMUL32(0bv32, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_SI32(FMUL32(v31$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_SI32(FMUL32(v30$2, 1132396544bv32)), 8bv32)), FP32_TO_SI32(FMUL32(v29$2, 1132396544bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dst"} true;
    $$dst[BV32_ADD(BV32_MUL($imageW, v1$1), v0$1)] := (if p1$1 then BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_SI32(FMUL32(0bv32, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_SI32(FMUL32(v31$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_SI32(FMUL32(v30$1, 1132396544bv32)), 8bv32)), FP32_TO_SI32(FMUL32(v29$1, 1132396544bv32))) else $$dst[BV32_ADD(BV32_MUL($imageW, v1$1), v0$1)]);
    $$dst[BV32_ADD(BV32_MUL($imageW, v1$2), v0$2)] := (if p1$2 then BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_SI32(FMUL32(0bv32, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_SI32(FMUL32(v31$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_SI32(FMUL32(v30$2, 1132396544bv32)), 8bv32)), FP32_TO_SI32(FMUL32(v29$2, 1132396544bv32))) else $$dst[BV32_ADD(BV32_MUL($imageW, v1$2), v0$2)]);
    return;
}



procedure {:source_name "_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff"} $_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff(_P$1: bool, $0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32) returns ($ret$1: bv128, $ret$2: bv128);



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 40bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 51bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$fresult$0bv32$1: bv32;

var $$fresult$0bv32$2: bv32;

var $$fresult$1bv32$1: bv32;

var $$fresult$1bv32$2: bv32;

var $$fresult$2bv32$1: bv32;

var $$fresult$2bv32$2: bv32;

var $$fresult$3bv32$1: bv32;

var $$fresult$3bv32$2: bv32;

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

const _WATCHED_VALUE_$$dst: bv32;

procedure {:inline 1} _LOG_READ_$$dst(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$dst;



implementation {:inline 1} _LOG_READ_$$dst(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dst == _value then true else _READ_HAS_OCCURRED_$$dst);
    return;
}



procedure _CHECK_READ_$$dst(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dst"} {:array "$$dst"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$dst);
  requires {:source_name "dst"} {:array "$$dst"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$dst: bool;

procedure {:inline 1} _LOG_WRITE_$$dst(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$dst, _WRITE_READ_BENIGN_FLAG_$$dst;



implementation {:inline 1} _LOG_WRITE_$$dst(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dst == _value then true else _WRITE_HAS_OCCURRED_$$dst);
    _WRITE_READ_BENIGN_FLAG_$$dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dst == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$dst);
    return;
}



procedure _CHECK_WRITE_$$dst(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dst"} {:array "$$dst"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dst != _value);
  requires {:source_name "dst"} {:array "$$dst"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dst != _value);
  requires {:source_name "dst"} {:array "$$dst"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$dst(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$dst;



implementation {:inline 1} _LOG_ATOMIC_$$dst(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$dst);
    return;
}



procedure _CHECK_ATOMIC_$$dst(_P: bool, _offset: bv32);
  requires {:source_name "dst"} {:array "$$dst"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset);
  requires {:source_name "dst"} {:array "$$dst"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dst(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$dst;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dst(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$dst := (if _P && _WRITE_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$dst);
    return;
}



const _WATCHED_VALUE_$$texImage: bv8;

procedure {:inline 1} _LOG_READ_$$texImage(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$texImage;



implementation {:inline 1} _LOG_READ_$$texImage(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$texImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texImage == _value then true else _READ_HAS_OCCURRED_$$texImage);
    return;
}



procedure _CHECK_READ_$$texImage(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "texImage"} {:array "$$texImage"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$texImage && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$texImage);
  requires {:source_name "texImage"} {:array "$$texImage"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$texImage && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$texImage: bool;

procedure {:inline 1} _LOG_WRITE_$$texImage(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$texImage, _WRITE_READ_BENIGN_FLAG_$$texImage;



implementation {:inline 1} _LOG_WRITE_$$texImage(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$texImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texImage == _value then true else _WRITE_HAS_OCCURRED_$$texImage);
    _WRITE_READ_BENIGN_FLAG_$$texImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texImage == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$texImage);
    return;
}



procedure _CHECK_WRITE_$$texImage(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "texImage"} {:array "$$texImage"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$texImage && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texImage != _value);
  requires {:source_name "texImage"} {:array "$$texImage"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$texImage && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texImage != _value);
  requires {:source_name "texImage"} {:array "$$texImage"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$texImage && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$texImage(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$texImage;



implementation {:inline 1} _LOG_ATOMIC_$$texImage(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$texImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$texImage);
    return;
}



procedure _CHECK_ATOMIC_$$texImage(_P: bool, _offset: bv32);
  requires {:source_name "texImage"} {:array "$$texImage"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$texImage && _WATCHED_OFFSET == _offset);
  requires {:source_name "texImage"} {:array "$$texImage"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$texImage && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$texImage(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$texImage;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$texImage(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$texImage := (if _P && _WRITE_HAS_OCCURRED_$$texImage && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$texImage);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
