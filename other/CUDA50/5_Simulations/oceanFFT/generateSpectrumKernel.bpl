type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$h0"} {:global} {:elem_width 32} {:source_name "h0"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$h0: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$h0: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$h0: bool;

var {:source_name "ht"} {:global} $$ht: [bv32]bv32;

axiom {:array_info "$$ht"} {:global} {:elem_width 32} {:source_name "ht"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$ht: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$ht: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$ht: bool;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$ab.i1"} {:elem_width 32} {:source_name "ab.i1"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$cd.i2"} {:elem_width 32} {:source_name "cd.i2"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i"} {:elem_width 32} {:source_name "a.i"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i"} {:elem_width 32} {:source_name "b.i"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$arg.i"} {:elem_width 32} {:source_name "arg.i"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$8"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$9"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$ab.i"} {:elem_width 32} {:source_name "ab.i"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$cd.i"} {:elem_width 32} {:source_name "cd.i"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$10"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$11"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$k"} {:elem_width 32} {:source_name "k"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$h0_k"} {:elem_width 32} {:source_name "h0_k"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$h0_mk"} {:elem_width 32} {:source_name "h0_mk"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$12"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$13"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$14"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$15"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$16"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$17"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$18"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$19"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

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

function FSQRT32(bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "generateSpectrumKernel"} {:kernel} $_Z22generateSpectrumKernelP6float2S0_jjjff($in_width: bv32, $out_width: bv32, $out_height: bv32, $t: bv32, $patchSize: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $out_width == 256bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $out_height == 256bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$h0 && !_WRITE_HAS_OCCURRED_$$h0 && !_ATOMIC_HAS_OCCURRED_$$h0;
  requires !_READ_HAS_OCCURRED_$$ht && !_WRITE_HAS_OCCURRED_$$ht && !_ATOMIC_HAS_OCCURRED_$$ht;
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
  modifies _WRITE_HAS_OCCURRED_$$ht, _WRITE_READ_BENIGN_FLAG_$$ht, _WRITE_READ_BENIGN_FLAG_$$ht;



implementation {:source_name "generateSpectrumKernel"} {:kernel} $_Z22generateSpectrumKernelP6float2S0_jjjff($in_width: bv32, $out_width: bv32, $out_height: bv32, $t: bv32, $patchSize: bv32)
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
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bool;
  var v10$2: bool;
  var v11$1: bool;
  var v11$2: bool;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27$1: bv32;
  var v27$2: bv32;
  var v28$1: bv32;
  var v28$2: bv32;
  var v29$1: bv32;
  var v29$2: bv32;
  var v30$1: bv32;
  var v30$2: bv32;
  var v31$1: bv32;
  var v31$2: bv32;
  var v32$1: bv32;
  var v32$2: bv32;
  var v51$1: bv32;
  var v51$2: bv32;
  var v33$1: bv32;
  var v33$2: bv32;
  var v34$1: bv32;
  var v34$2: bv32;
  var v35$1: bv32;
  var v35$2: bv32;
  var v36$1: bv32;
  var v36$2: bv32;
  var v37$1: bv32;
  var v37$2: bv32;
  var v38$1: bv32;
  var v38$2: bv32;
  var v39$1: bv32;
  var v39$2: bv32;
  var v40$1: bv32;
  var v40$2: bv32;
  var v41$1: bv32;
  var v41$2: bv32;
  var v42$1: bv32;
  var v42$2: bv32;
  var v43$1: bv32;
  var v43$2: bv32;
  var v44$1: bv32;
  var v44$2: bv32;
  var v45$1: bv32;
  var v45$2: bv32;
  var v46$1: bv32;
  var v46$2: bv32;
  var v47$1: bv32;
  var v47$2: bv32;
  var v48$1: bv32;
  var v48$2: bv32;
  var v49$1: bv32;
  var v49$2: bv32;
  var v50$1: bv32;
  var v50$2: bv32;
  var v52$1: bv32;
  var v52$2: bv32;
  var v53$1: bv32;
  var v53$2: bv32;
  var v54$1: bv32;
  var v54$2: bv32;
  var v55$1: bv32;
  var v55$2: bv32;
  var v56$1: bv32;
  var v56$2: bv32;
  var v57$1: bv32;
  var v57$2: bv32;
  var v58$1: bv32;
  var v58$2: bv32;
  var v59$1: bv32;
  var v59$2: bv32;
  var v60$1: bv32;
  var v60$2: bv32;
  var v61$1: bv32;
  var v61$2: bv32;
  var v62$1: bv32;
  var v62$2: bv32;
  var v63$1: bv32;
  var v63$2: bv32;
  var v64$1: bv32;
  var v64$2: bv32;
  var v65$1: bv32;
  var v65$2: bv32;
  var v66$1: bv32;
  var v66$2: bv32;
  var v67$1: bv32;
  var v67$2: bv32;
  var v68$1: bv32;
  var v68$2: bv32;
  var v69$1: bv32;
  var v69$2: bv32;
  var v70$1: bv32;
  var v70$2: bv32;
  var v71$1: bv32;
  var v71$2: bv32;
  var v72$1: bv32;
  var v72$2: bv32;
  var v73$1: bv32;
  var v73$2: bv32;
  var v74$1: bv32;
  var v74$2: bv32;
  var v75$1: bv32;
  var v75$2: bv32;
  var v76$1: bv32;
  var v76$2: bv32;
  var v77$1: bv32;
  var v77$2: bv32;
  var v78$1: bv32;
  var v78$2: bv32;
  var v79$1: bv32;
  var v79$2: bv32;
  var v80$1: bv32;
  var v80$2: bv32;
  var v81$1: bv32;
  var v81$2: bv32;
  var v82$1: bv32;
  var v82$2: bv32;
  var v83$1: bv32;
  var v83$2: bv32;
  var v84$1: bv32;
  var v84$2: bv32;
  var v85$1: bv32;
  var v85$2: bv32;
  var v86$1: bv32;
  var v86$2: bv32;
  var v87$1: bv32;
  var v87$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2);
    v2$1 := BV32_ADD(BV32_MUL(v1$1, $in_width), v0$1);
    v2$2 := BV32_ADD(BV32_MUL(v1$2, $in_width), v0$2);
    v3$1 := BV32_ADD(BV32_MUL(BV32_SUB($out_height, v1$1), $in_width), BV32_SUB($out_width, v0$1));
    v3$2 := BV32_ADD(BV32_MUL(BV32_SUB($out_height, v1$2), $in_width), BV32_SUB($out_width, v0$2));
    v4$1 := BV32_ADD(BV32_MUL(v1$1, $out_width), v0$1);
    v4$2 := BV32_ADD(BV32_MUL(v1$2, $out_width), v0$2);
    $$k$0bv32$1 := FMUL32(FADD32(FDIV32(SI32_TO_FP32(BV32_SUB(0bv32, $out_width)), 1073741824bv32), UI32_TO_FP32(v0$1)), FDIV32(1086918619bv32, $patchSize));
    $$k$0bv32$2 := FMUL32(FADD32(FDIV32(SI32_TO_FP32(BV32_SUB(0bv32, $out_width)), 1073741824bv32), UI32_TO_FP32(v0$2)), FDIV32(1086918619bv32, $patchSize));
    $$k$1bv32$1 := FMUL32(FADD32(FDIV32(SI32_TO_FP32(BV32_SUB(0bv32, $out_width)), 1073741824bv32), UI32_TO_FP32(v1$1)), FDIV32(1086918619bv32, $patchSize));
    $$k$1bv32$2 := FMUL32(FADD32(FDIV32(SI32_TO_FP32(BV32_SUB(0bv32, $out_width)), 1073741824bv32), UI32_TO_FP32(v1$2)), FDIV32(1086918619bv32, $patchSize));
    v5$1 := $$k$0bv32$1;
    v5$2 := $$k$0bv32$2;
    v6$1 := $$k$0bv32$1;
    v6$2 := $$k$0bv32$2;
    v7$1 := $$k$1bv32$1;
    v7$2 := $$k$1bv32$2;
    v8$1 := $$k$1bv32$1;
    v8$2 := $$k$1bv32$2;
    v9$1 := FSQRT32(FMUL32(1092416963bv32, FSQRT32(FADD32(FMUL32(v5$1, v6$1), FMUL32(v7$1, v8$1)))));
    v9$2 := FSQRT32(FMUL32(1092416963bv32, FSQRT32(FADD32(FMUL32(v5$2, v6$2), FMUL32(v7$2, v8$2)))));
    v10$1 := BV32_ULT(v0$1, $out_width);
    v10$2 := BV32_ULT(v0$2, $out_width);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p0$1 := (if v10$1 then v10$1 else p0$1);
    p0$2 := (if v10$2 then v10$2 else p0$2);
    v11$1 := (if p0$1 then BV32_ULT(v1$1, $out_height) else v11$1);
    v11$2 := (if p0$2 then BV32_ULT(v1$2, $out_height) else v11$2);
    p1$1 := (if p0$1 && v11$1 then v11$1 else p1$1);
    p1$2 := (if p0$2 && v11$2 then v11$2 else p1$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v12$1 := (if p1$1 then _HAVOC_bv32$1 else v12$1);
    v12$2 := (if p1$2 then _HAVOC_bv32$2 else v12$2);
    $$h0_k$0bv32$1 := (if p1$1 then v12$1 else $$h0_k$0bv32$1);
    $$h0_k$0bv32$2 := (if p1$2 then v12$2 else $$h0_k$0bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v13$1 := (if p1$1 then _HAVOC_bv32$1 else v13$1);
    v13$2 := (if p1$2 then _HAVOC_bv32$2 else v13$2);
    $$h0_k$1bv32$1 := (if p1$1 then v13$1 else $$h0_k$1bv32$1);
    $$h0_k$1bv32$2 := (if p1$2 then v13$2 else $$h0_k$1bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v14$1 := (if p1$1 then _HAVOC_bv32$1 else v14$1);
    v14$2 := (if p1$2 then _HAVOC_bv32$2 else v14$2);
    $$h0_mk$0bv32$1 := (if p1$1 then v14$1 else $$h0_mk$0bv32$1);
    $$h0_mk$0bv32$2 := (if p1$2 then v14$2 else $$h0_mk$0bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v15$1 := (if p1$1 then _HAVOC_bv32$1 else v15$1);
    v15$2 := (if p1$2 then _HAVOC_bv32$2 else v15$2);
    $$h0_mk$1bv32$1 := (if p1$1 then v15$1 else $$h0_mk$1bv32$1);
    $$h0_mk$1bv32$2 := (if p1$2 then v15$2 else $$h0_mk$1bv32$2);
    v16$1 := (if p1$1 then $$h0_k$0bv32$1 else v16$1);
    v16$2 := (if p1$2 then $$h0_k$0bv32$2 else v16$2);
    $$14$0bv32$1 := (if p1$1 then v16$1 else $$14$0bv32$1);
    $$14$0bv32$2 := (if p1$2 then v16$2 else $$14$0bv32$2);
    v17$1 := (if p1$1 then $$h0_k$1bv32$1 else v17$1);
    v17$2 := (if p1$2 then $$h0_k$1bv32$2 else v17$2);
    $$14$1bv32$1 := (if p1$1 then v17$1 else $$14$1bv32$1);
    $$14$1bv32$2 := (if p1$2 then v17$2 else $$14$1bv32$2);
    v18$1 := (if p1$1 then FMUL32(v9$1, $t) else v18$1);
    v18$2 := (if p1$2 then FMUL32(v9$2, $t) else v18$2);
    call {:sourceloc_num 23} v19$1, v19$2 := $cosf(p1$1, v18$1, p1$2, v18$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$cosf"} true;
    call {:sourceloc_num 24} v20$1, v20$2 := $sinf(p1$1, v18$1, p1$2, v18$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$sinf"} true;
    $$10$0bv32$1 := (if p1$1 then v19$1 else $$10$0bv32$1);
    $$10$0bv32$2 := (if p1$2 then v19$2 else $$10$0bv32$2);
    $$10$1bv32$1 := (if p1$1 then v20$1 else $$10$1bv32$1);
    $$10$1bv32$2 := (if p1$2 then v20$2 else $$10$1bv32$2);
    v21$1 := (if p1$1 then $$10$0bv32$1 else v21$1);
    v21$2 := (if p1$2 then $$10$0bv32$2 else v21$2);
    v22$1 := (if p1$1 then $$10$1bv32$1 else v22$1);
    v22$2 := (if p1$2 then $$10$1bv32$2 else v22$2);
    $$11$0bv32$1 := (if p1$1 then v21$1 else $$11$0bv32$1);
    $$11$0bv32$2 := (if p1$2 then v21$2 else $$11$0bv32$2);
    $$11$1bv32$1 := (if p1$1 then v22$1 else $$11$1bv32$1);
    $$11$1bv32$2 := (if p1$2 then v22$2 else $$11$1bv32$2);
    v23$1 := (if p1$1 then $$11$0bv32$1 else v23$1);
    v23$2 := (if p1$2 then $$11$0bv32$2 else v23$2);
    v24$1 := (if p1$1 then $$11$1bv32$1 else v24$1);
    v24$2 := (if p1$2 then $$11$1bv32$2 else v24$2);
    $$15$0bv32$1 := (if p1$1 then v23$1 else $$15$0bv32$1);
    $$15$0bv32$2 := (if p1$2 then v23$2 else $$15$0bv32$2);
    $$15$1bv32$1 := (if p1$1 then v24$1 else $$15$1bv32$1);
    $$15$1bv32$2 := (if p1$2 then v24$2 else $$15$1bv32$2);
    v25$1 := (if p1$1 then $$14$0bv32$1 else v25$1);
    v25$2 := (if p1$2 then $$14$0bv32$2 else v25$2);
    v26$1 := (if p1$1 then $$14$1bv32$1 else v26$1);
    v26$2 := (if p1$2 then $$14$1bv32$2 else v26$2);
    v27$1 := (if p1$1 then $$15$0bv32$1 else v27$1);
    v27$2 := (if p1$2 then $$15$0bv32$2 else v27$2);
    v28$1 := (if p1$1 then $$15$1bv32$1 else v28$1);
    v28$2 := (if p1$2 then $$15$1bv32$2 else v28$2);
    $$ab.i$0bv32$1 := (if p1$1 then v25$1 else $$ab.i$0bv32$1);
    $$ab.i$0bv32$2 := (if p1$2 then v25$2 else $$ab.i$0bv32$2);
    $$ab.i$1bv32$1 := (if p1$1 then v26$1 else $$ab.i$1bv32$1);
    $$ab.i$1bv32$2 := (if p1$2 then v26$2 else $$ab.i$1bv32$2);
    $$cd.i$0bv32$1 := (if p1$1 then v27$1 else $$cd.i$0bv32$1);
    $$cd.i$0bv32$2 := (if p1$2 then v27$2 else $$cd.i$0bv32$2);
    $$cd.i$1bv32$1 := (if p1$1 then v28$1 else $$cd.i$1bv32$1);
    $$cd.i$1bv32$2 := (if p1$2 then v28$2 else $$cd.i$1bv32$2);
    v29$1 := (if p1$1 then $$ab.i$0bv32$1 else v29$1);
    v29$2 := (if p1$2 then $$ab.i$0bv32$2 else v29$2);
    v30$1 := (if p1$1 then $$cd.i$0bv32$1 else v30$1);
    v30$2 := (if p1$2 then $$cd.i$0bv32$2 else v30$2);
    v31$1 := (if p1$1 then $$ab.i$1bv32$1 else v31$1);
    v31$2 := (if p1$2 then $$ab.i$1bv32$2 else v31$2);
    v32$1 := (if p1$1 then $$cd.i$1bv32$1 else v32$1);
    v32$2 := (if p1$2 then $$cd.i$1bv32$2 else v32$2);
    v33$1 := (if p1$1 then $$ab.i$0bv32$1 else v33$1);
    v33$2 := (if p1$2 then $$ab.i$0bv32$2 else v33$2);
    v34$1 := (if p1$1 then $$cd.i$1bv32$1 else v34$1);
    v34$2 := (if p1$2 then $$cd.i$1bv32$2 else v34$2);
    v35$1 := (if p1$1 then $$ab.i$1bv32$1 else v35$1);
    v35$2 := (if p1$2 then $$ab.i$1bv32$2 else v35$2);
    v36$1 := (if p1$1 then $$cd.i$0bv32$1 else v36$1);
    v36$2 := (if p1$2 then $$cd.i$0bv32$2 else v36$2);
    $$8$0bv32$1 := (if p1$1 then FSUB32(FMUL32(v29$1, v30$1), FMUL32(v31$1, v32$1)) else $$8$0bv32$1);
    $$8$0bv32$2 := (if p1$2 then FSUB32(FMUL32(v29$2, v30$2), FMUL32(v31$2, v32$2)) else $$8$0bv32$2);
    $$8$1bv32$1 := (if p1$1 then FADD32(FMUL32(v33$1, v34$1), FMUL32(v35$1, v36$1)) else $$8$1bv32$1);
    $$8$1bv32$2 := (if p1$2 then FADD32(FMUL32(v33$2, v34$2), FMUL32(v35$2, v36$2)) else $$8$1bv32$2);
    v37$1 := (if p1$1 then $$8$0bv32$1 else v37$1);
    v37$2 := (if p1$2 then $$8$0bv32$2 else v37$2);
    v38$1 := (if p1$1 then $$8$1bv32$1 else v38$1);
    v38$2 := (if p1$2 then $$8$1bv32$2 else v38$2);
    $$9$0bv32$1 := (if p1$1 then v37$1 else $$9$0bv32$1);
    $$9$0bv32$2 := (if p1$2 then v37$2 else $$9$0bv32$2);
    $$9$1bv32$1 := (if p1$1 then v38$1 else $$9$1bv32$1);
    $$9$1bv32$2 := (if p1$2 then v38$2 else $$9$1bv32$2);
    v39$1 := (if p1$1 then $$9$0bv32$1 else v39$1);
    v39$2 := (if p1$2 then $$9$0bv32$2 else v39$2);
    v40$1 := (if p1$1 then $$9$1bv32$1 else v40$1);
    v40$2 := (if p1$2 then $$9$1bv32$2 else v40$2);
    $$13$0bv32$1 := (if p1$1 then v39$1 else $$13$0bv32$1);
    $$13$0bv32$2 := (if p1$2 then v39$2 else $$13$0bv32$2);
    $$13$1bv32$1 := (if p1$1 then v40$1 else $$13$1bv32$1);
    $$13$1bv32$2 := (if p1$2 then v40$2 else $$13$1bv32$2);
    v41$1 := (if p1$1 then $$h0_mk$0bv32$1 else v41$1);
    v41$2 := (if p1$2 then $$h0_mk$0bv32$2 else v41$2);
    $$18$0bv32$1 := (if p1$1 then v41$1 else $$18$0bv32$1);
    $$18$0bv32$2 := (if p1$2 then v41$2 else $$18$0bv32$2);
    v42$1 := (if p1$1 then $$h0_mk$1bv32$1 else v42$1);
    v42$2 := (if p1$2 then $$h0_mk$1bv32$2 else v42$2);
    $$18$1bv32$1 := (if p1$1 then v42$1 else $$18$1bv32$1);
    $$18$1bv32$2 := (if p1$2 then v42$2 else $$18$1bv32$2);
    v43$1 := (if p1$1 then $$18$0bv32$1 else v43$1);
    v43$2 := (if p1$2 then $$18$0bv32$2 else v43$2);
    v44$1 := (if p1$1 then $$18$1bv32$1 else v44$1);
    v44$2 := (if p1$2 then $$18$1bv32$2 else v44$2);
    $$arg.i$0bv32$1 := (if p1$1 then v43$1 else $$arg.i$0bv32$1);
    $$arg.i$0bv32$2 := (if p1$2 then v43$2 else $$arg.i$0bv32$2);
    $$arg.i$1bv32$1 := (if p1$1 then v44$1 else $$arg.i$1bv32$1);
    $$arg.i$1bv32$2 := (if p1$2 then v44$2 else $$arg.i$1bv32$2);
    v45$1 := (if p1$1 then $$arg.i$0bv32$1 else v45$1);
    v45$2 := (if p1$2 then $$arg.i$0bv32$2 else v45$2);
    v46$1 := (if p1$1 then $$arg.i$1bv32$1 else v46$1);
    v46$2 := (if p1$2 then $$arg.i$1bv32$2 else v46$2);
    $$6$0bv32$1 := (if p1$1 then v45$1 else $$6$0bv32$1);
    $$6$0bv32$2 := (if p1$2 then v45$2 else $$6$0bv32$2);
    $$6$1bv32$1 := (if p1$1 then FSUB32(2147483648bv32, v46$1) else $$6$1bv32$1);
    $$6$1bv32$2 := (if p1$2 then FSUB32(2147483648bv32, v46$2) else $$6$1bv32$2);
    v47$1 := (if p1$1 then $$6$0bv32$1 else v47$1);
    v47$2 := (if p1$2 then $$6$0bv32$2 else v47$2);
    v48$1 := (if p1$1 then $$6$1bv32$1 else v48$1);
    v48$2 := (if p1$2 then $$6$1bv32$2 else v48$2);
    $$7$0bv32$1 := (if p1$1 then v47$1 else $$7$0bv32$1);
    $$7$0bv32$2 := (if p1$2 then v47$2 else $$7$0bv32$2);
    $$7$1bv32$1 := (if p1$1 then v48$1 else $$7$1bv32$1);
    $$7$1bv32$2 := (if p1$2 then v48$2 else $$7$1bv32$2);
    v49$1 := (if p1$1 then $$7$0bv32$1 else v49$1);
    v49$2 := (if p1$2 then $$7$0bv32$2 else v49$2);
    v50$1 := (if p1$1 then $$7$1bv32$1 else v50$1);
    v50$2 := (if p1$2 then $$7$1bv32$2 else v50$2);
    $$17$0bv32$1 := (if p1$1 then v49$1 else $$17$0bv32$1);
    $$17$0bv32$2 := (if p1$2 then v49$2 else $$17$0bv32$2);
    $$17$1bv32$1 := (if p1$1 then v50$1 else $$17$1bv32$1);
    $$17$1bv32$2 := (if p1$2 then v50$2 else $$17$1bv32$2);
    v51$1 := (if p1$1 then FMUL32(FSUB32(2147483648bv32, v9$1), $t) else v51$1);
    v51$2 := (if p1$2 then FMUL32(FSUB32(2147483648bv32, v9$2), $t) else v51$2);
    call {:sourceloc_num 81} v52$1, v52$2 := $cosf(p1$1, v51$1, p1$2, v51$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$cosf"} true;
    call {:sourceloc_num 82} v53$1, v53$2 := $sinf(p1$1, v51$1, p1$2, v51$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$sinf"} true;
    $$0$0bv32$1 := (if p1$1 then v52$1 else $$0$0bv32$1);
    $$0$0bv32$2 := (if p1$2 then v52$2 else $$0$0bv32$2);
    $$0$1bv32$1 := (if p1$1 then v53$1 else $$0$1bv32$1);
    $$0$1bv32$2 := (if p1$2 then v53$2 else $$0$1bv32$2);
    v54$1 := (if p1$1 then $$0$0bv32$1 else v54$1);
    v54$2 := (if p1$2 then $$0$0bv32$2 else v54$2);
    v55$1 := (if p1$1 then $$0$1bv32$1 else v55$1);
    v55$2 := (if p1$2 then $$0$1bv32$2 else v55$2);
    $$1$0bv32$1 := (if p1$1 then v54$1 else $$1$0bv32$1);
    $$1$0bv32$2 := (if p1$2 then v54$2 else $$1$0bv32$2);
    $$1$1bv32$1 := (if p1$1 then v55$1 else $$1$1bv32$1);
    $$1$1bv32$2 := (if p1$2 then v55$2 else $$1$1bv32$2);
    v56$1 := (if p1$1 then $$1$0bv32$1 else v56$1);
    v56$2 := (if p1$2 then $$1$0bv32$2 else v56$2);
    v57$1 := (if p1$1 then $$1$1bv32$1 else v57$1);
    v57$2 := (if p1$2 then $$1$1bv32$2 else v57$2);
    $$19$0bv32$1 := (if p1$1 then v56$1 else $$19$0bv32$1);
    $$19$0bv32$2 := (if p1$2 then v56$2 else $$19$0bv32$2);
    $$19$1bv32$1 := (if p1$1 then v57$1 else $$19$1bv32$1);
    $$19$1bv32$2 := (if p1$2 then v57$2 else $$19$1bv32$2);
    v58$1 := (if p1$1 then $$17$0bv32$1 else v58$1);
    v58$2 := (if p1$2 then $$17$0bv32$2 else v58$2);
    v59$1 := (if p1$1 then $$17$1bv32$1 else v59$1);
    v59$2 := (if p1$2 then $$17$1bv32$2 else v59$2);
    v60$1 := (if p1$1 then $$19$0bv32$1 else v60$1);
    v60$2 := (if p1$2 then $$19$0bv32$2 else v60$2);
    v61$1 := (if p1$1 then $$19$1bv32$1 else v61$1);
    v61$2 := (if p1$2 then $$19$1bv32$2 else v61$2);
    $$ab.i1$0bv32$1 := (if p1$1 then v58$1 else $$ab.i1$0bv32$1);
    $$ab.i1$0bv32$2 := (if p1$2 then v58$2 else $$ab.i1$0bv32$2);
    $$ab.i1$1bv32$1 := (if p1$1 then v59$1 else $$ab.i1$1bv32$1);
    $$ab.i1$1bv32$2 := (if p1$2 then v59$2 else $$ab.i1$1bv32$2);
    $$cd.i2$0bv32$1 := (if p1$1 then v60$1 else $$cd.i2$0bv32$1);
    $$cd.i2$0bv32$2 := (if p1$2 then v60$2 else $$cd.i2$0bv32$2);
    $$cd.i2$1bv32$1 := (if p1$1 then v61$1 else $$cd.i2$1bv32$1);
    $$cd.i2$1bv32$2 := (if p1$2 then v61$2 else $$cd.i2$1bv32$2);
    v62$1 := (if p1$1 then $$ab.i1$0bv32$1 else v62$1);
    v62$2 := (if p1$2 then $$ab.i1$0bv32$2 else v62$2);
    v63$1 := (if p1$1 then $$cd.i2$0bv32$1 else v63$1);
    v63$2 := (if p1$2 then $$cd.i2$0bv32$2 else v63$2);
    v64$1 := (if p1$1 then $$ab.i1$1bv32$1 else v64$1);
    v64$2 := (if p1$2 then $$ab.i1$1bv32$2 else v64$2);
    v65$1 := (if p1$1 then $$cd.i2$1bv32$1 else v65$1);
    v65$2 := (if p1$2 then $$cd.i2$1bv32$2 else v65$2);
    v66$1 := (if p1$1 then $$ab.i1$0bv32$1 else v66$1);
    v66$2 := (if p1$2 then $$ab.i1$0bv32$2 else v66$2);
    v67$1 := (if p1$1 then $$cd.i2$1bv32$1 else v67$1);
    v67$2 := (if p1$2 then $$cd.i2$1bv32$2 else v67$2);
    v68$1 := (if p1$1 then $$ab.i1$1bv32$1 else v68$1);
    v68$2 := (if p1$2 then $$ab.i1$1bv32$2 else v68$2);
    v69$1 := (if p1$1 then $$cd.i2$0bv32$1 else v69$1);
    v69$2 := (if p1$2 then $$cd.i2$0bv32$2 else v69$2);
    $$2$0bv32$1 := (if p1$1 then FSUB32(FMUL32(v62$1, v63$1), FMUL32(v64$1, v65$1)) else $$2$0bv32$1);
    $$2$0bv32$2 := (if p1$2 then FSUB32(FMUL32(v62$2, v63$2), FMUL32(v64$2, v65$2)) else $$2$0bv32$2);
    $$2$1bv32$1 := (if p1$1 then FADD32(FMUL32(v66$1, v67$1), FMUL32(v68$1, v69$1)) else $$2$1bv32$1);
    $$2$1bv32$2 := (if p1$2 then FADD32(FMUL32(v66$2, v67$2), FMUL32(v68$2, v69$2)) else $$2$1bv32$2);
    v70$1 := (if p1$1 then $$2$0bv32$1 else v70$1);
    v70$2 := (if p1$2 then $$2$0bv32$2 else v70$2);
    v71$1 := (if p1$1 then $$2$1bv32$1 else v71$1);
    v71$2 := (if p1$2 then $$2$1bv32$2 else v71$2);
    $$3$0bv32$1 := (if p1$1 then v70$1 else $$3$0bv32$1);
    $$3$0bv32$2 := (if p1$2 then v70$2 else $$3$0bv32$2);
    $$3$1bv32$1 := (if p1$1 then v71$1 else $$3$1bv32$1);
    $$3$1bv32$2 := (if p1$2 then v71$2 else $$3$1bv32$2);
    v72$1 := (if p1$1 then $$3$0bv32$1 else v72$1);
    v72$2 := (if p1$2 then $$3$0bv32$2 else v72$2);
    v73$1 := (if p1$1 then $$3$1bv32$1 else v73$1);
    v73$2 := (if p1$2 then $$3$1bv32$2 else v73$2);
    $$16$0bv32$1 := (if p1$1 then v72$1 else $$16$0bv32$1);
    $$16$0bv32$2 := (if p1$2 then v72$2 else $$16$0bv32$2);
    $$16$1bv32$1 := (if p1$1 then v73$1 else $$16$1bv32$1);
    $$16$1bv32$2 := (if p1$2 then v73$2 else $$16$1bv32$2);
    v74$1 := (if p1$1 then $$13$0bv32$1 else v74$1);
    v74$2 := (if p1$2 then $$13$0bv32$2 else v74$2);
    v75$1 := (if p1$1 then $$13$1bv32$1 else v75$1);
    v75$2 := (if p1$2 then $$13$1bv32$2 else v75$2);
    v76$1 := (if p1$1 then $$16$0bv32$1 else v76$1);
    v76$2 := (if p1$2 then $$16$0bv32$2 else v76$2);
    v77$1 := (if p1$1 then $$16$1bv32$1 else v77$1);
    v77$2 := (if p1$2 then $$16$1bv32$2 else v77$2);
    $$a.i$0bv32$1 := (if p1$1 then v74$1 else $$a.i$0bv32$1);
    $$a.i$0bv32$2 := (if p1$2 then v74$2 else $$a.i$0bv32$2);
    $$a.i$1bv32$1 := (if p1$1 then v75$1 else $$a.i$1bv32$1);
    $$a.i$1bv32$2 := (if p1$2 then v75$2 else $$a.i$1bv32$2);
    $$b.i$0bv32$1 := (if p1$1 then v76$1 else $$b.i$0bv32$1);
    $$b.i$0bv32$2 := (if p1$2 then v76$2 else $$b.i$0bv32$2);
    $$b.i$1bv32$1 := (if p1$1 then v77$1 else $$b.i$1bv32$1);
    $$b.i$1bv32$2 := (if p1$2 then v77$2 else $$b.i$1bv32$2);
    v78$1 := (if p1$1 then $$a.i$0bv32$1 else v78$1);
    v78$2 := (if p1$2 then $$a.i$0bv32$2 else v78$2);
    v79$1 := (if p1$1 then $$b.i$0bv32$1 else v79$1);
    v79$2 := (if p1$2 then $$b.i$0bv32$2 else v79$2);
    v80$1 := (if p1$1 then $$a.i$1bv32$1 else v80$1);
    v80$2 := (if p1$2 then $$a.i$1bv32$2 else v80$2);
    v81$1 := (if p1$1 then $$b.i$1bv32$1 else v81$1);
    v81$2 := (if p1$2 then $$b.i$1bv32$2 else v81$2);
    $$4$0bv32$1 := (if p1$1 then FADD32(v78$1, v79$1) else $$4$0bv32$1);
    $$4$0bv32$2 := (if p1$2 then FADD32(v78$2, v79$2) else $$4$0bv32$2);
    $$4$1bv32$1 := (if p1$1 then FADD32(v80$1, v81$1) else $$4$1bv32$1);
    $$4$1bv32$2 := (if p1$2 then FADD32(v80$2, v81$2) else $$4$1bv32$2);
    v82$1 := (if p1$1 then $$4$0bv32$1 else v82$1);
    v82$2 := (if p1$2 then $$4$0bv32$2 else v82$2);
    v83$1 := (if p1$1 then $$4$1bv32$1 else v83$1);
    v83$2 := (if p1$2 then $$4$1bv32$2 else v83$2);
    $$5$0bv32$1 := (if p1$1 then v82$1 else $$5$0bv32$1);
    $$5$0bv32$2 := (if p1$2 then v82$2 else $$5$0bv32$2);
    $$5$1bv32$1 := (if p1$1 then v83$1 else $$5$1bv32$1);
    $$5$1bv32$2 := (if p1$2 then v83$2 else $$5$1bv32$2);
    v84$1 := (if p1$1 then $$5$0bv32$1 else v84$1);
    v84$2 := (if p1$2 then $$5$0bv32$2 else v84$2);
    v85$1 := (if p1$1 then $$5$1bv32$1 else v85$1);
    v85$2 := (if p1$2 then $$5$1bv32$2 else v85$2);
    $$12$0bv32$1 := (if p1$1 then v84$1 else $$12$0bv32$1);
    $$12$0bv32$2 := (if p1$2 then v84$2 else $$12$0bv32$2);
    $$12$1bv32$1 := (if p1$1 then v85$1 else $$12$1bv32$1);
    $$12$1bv32$2 := (if p1$2 then v85$2 else $$12$1bv32$2);
    v86$1 := (if p1$1 then $$12$0bv32$1 else v86$1);
    v86$2 := (if p1$2 then $$12$0bv32$2 else v86$2);
    call {:sourceloc} {:sourceloc_num 142} _LOG_WRITE_$$ht(p1$1, BV32_MUL(v4$1, 2bv32), v86$1, $$ht[BV32_MUL(v4$1, 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$ht(p1$2, BV32_MUL(v4$2, 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 142} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 142} _CHECK_WRITE_$$ht(p1$2, BV32_MUL(v4$2, 2bv32), v86$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$ht"} true;
    $$ht[BV32_MUL(v4$1, 2bv32)] := (if p1$1 then v86$1 else $$ht[BV32_MUL(v4$1, 2bv32)]);
    $$ht[BV32_MUL(v4$2, 2bv32)] := (if p1$2 then v86$2 else $$ht[BV32_MUL(v4$2, 2bv32)]);
    v87$1 := (if p1$1 then $$12$1bv32$1 else v87$1);
    v87$2 := (if p1$2 then $$12$1bv32$2 else v87$2);
    call {:sourceloc} {:sourceloc_num 144} _LOG_WRITE_$$ht(p1$1, BV32_ADD(BV32_MUL(v4$1, 2bv32), 1bv32), v87$1, $$ht[BV32_ADD(BV32_MUL(v4$1, 2bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$ht(p1$2, BV32_ADD(BV32_MUL(v4$2, 2bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 144} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 144} _CHECK_WRITE_$$ht(p1$2, BV32_ADD(BV32_MUL(v4$2, 2bv32), 1bv32), v87$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$ht"} true;
    $$ht[BV32_ADD(BV32_MUL(v4$1, 2bv32), 1bv32)] := (if p1$1 then v87$1 else $$ht[BV32_ADD(BV32_MUL(v4$1, 2bv32), 1bv32)]);
    $$ht[BV32_ADD(BV32_MUL(v4$2, 2bv32), 1bv32)] := (if p1$2 then v87$2 else $$ht[BV32_ADD(BV32_MUL(v4$2, 2bv32), 1bv32)]);
    return;
}



procedure {:source_name "cosf"} $cosf(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "sinf"} $sinf(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



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

var $$1$0bv32$1: bv32;

var $$1$0bv32$2: bv32;

var $$1$1bv32$1: bv32;

var $$1$1bv32$2: bv32;

var $$2$0bv32$1: bv32;

var $$2$0bv32$2: bv32;

var $$2$1bv32$1: bv32;

var $$2$1bv32$2: bv32;

var $$3$0bv32$1: bv32;

var $$3$0bv32$2: bv32;

var $$3$1bv32$1: bv32;

var $$3$1bv32$2: bv32;

var $$ab.i1$0bv32$1: bv32;

var $$ab.i1$0bv32$2: bv32;

var $$ab.i1$1bv32$1: bv32;

var $$ab.i1$1bv32$2: bv32;

var $$cd.i2$0bv32$1: bv32;

var $$cd.i2$0bv32$2: bv32;

var $$cd.i2$1bv32$1: bv32;

var $$cd.i2$1bv32$2: bv32;

var $$4$0bv32$1: bv32;

var $$4$0bv32$2: bv32;

var $$4$1bv32$1: bv32;

var $$4$1bv32$2: bv32;

var $$5$0bv32$1: bv32;

var $$5$0bv32$2: bv32;

var $$5$1bv32$1: bv32;

var $$5$1bv32$2: bv32;

var $$a.i$0bv32$1: bv32;

var $$a.i$0bv32$2: bv32;

var $$a.i$1bv32$1: bv32;

var $$a.i$1bv32$2: bv32;

var $$b.i$0bv32$1: bv32;

var $$b.i$0bv32$2: bv32;

var $$b.i$1bv32$1: bv32;

var $$b.i$1bv32$2: bv32;

var $$6$0bv32$1: bv32;

var $$6$0bv32$2: bv32;

var $$6$1bv32$1: bv32;

var $$6$1bv32$2: bv32;

var $$7$0bv32$1: bv32;

var $$7$0bv32$2: bv32;

var $$7$1bv32$1: bv32;

var $$7$1bv32$2: bv32;

var $$arg.i$0bv32$1: bv32;

var $$arg.i$0bv32$2: bv32;

var $$arg.i$1bv32$1: bv32;

var $$arg.i$1bv32$2: bv32;

var $$8$0bv32$1: bv32;

var $$8$0bv32$2: bv32;

var $$8$1bv32$1: bv32;

var $$8$1bv32$2: bv32;

var $$9$0bv32$1: bv32;

var $$9$0bv32$2: bv32;

var $$9$1bv32$1: bv32;

var $$9$1bv32$2: bv32;

var $$ab.i$0bv32$1: bv32;

var $$ab.i$0bv32$2: bv32;

var $$ab.i$1bv32$1: bv32;

var $$ab.i$1bv32$2: bv32;

var $$cd.i$0bv32$1: bv32;

var $$cd.i$0bv32$2: bv32;

var $$cd.i$1bv32$1: bv32;

var $$cd.i$1bv32$2: bv32;

var $$10$0bv32$1: bv32;

var $$10$0bv32$2: bv32;

var $$10$1bv32$1: bv32;

var $$10$1bv32$2: bv32;

var $$11$0bv32$1: bv32;

var $$11$0bv32$2: bv32;

var $$11$1bv32$1: bv32;

var $$11$1bv32$2: bv32;

var $$k$0bv32$1: bv32;

var $$k$0bv32$2: bv32;

var $$k$1bv32$1: bv32;

var $$k$1bv32$2: bv32;

var $$h0_k$0bv32$1: bv32;

var $$h0_k$0bv32$2: bv32;

var $$h0_k$1bv32$1: bv32;

var $$h0_k$1bv32$2: bv32;

var $$h0_mk$0bv32$1: bv32;

var $$h0_mk$0bv32$2: bv32;

var $$h0_mk$1bv32$1: bv32;

var $$h0_mk$1bv32$2: bv32;

var $$12$0bv32$1: bv32;

var $$12$0bv32$2: bv32;

var $$12$1bv32$1: bv32;

var $$12$1bv32$2: bv32;

var $$13$0bv32$1: bv32;

var $$13$0bv32$2: bv32;

var $$13$1bv32$1: bv32;

var $$13$1bv32$2: bv32;

var $$14$0bv32$1: bv32;

var $$14$0bv32$2: bv32;

var $$14$1bv32$1: bv32;

var $$14$1bv32$2: bv32;

var $$15$0bv32$1: bv32;

var $$15$0bv32$2: bv32;

var $$15$1bv32$1: bv32;

var $$15$1bv32$2: bv32;

var $$16$0bv32$1: bv32;

var $$16$0bv32$2: bv32;

var $$16$1bv32$1: bv32;

var $$16$1bv32$2: bv32;

var $$17$0bv32$1: bv32;

var $$17$0bv32$2: bv32;

var $$17$1bv32$1: bv32;

var $$17$1bv32$2: bv32;

var $$18$0bv32$1: bv32;

var $$18$0bv32$2: bv32;

var $$18$1bv32$1: bv32;

var $$18$1bv32$2: bv32;

var $$19$0bv32$1: bv32;

var $$19$0bv32$2: bv32;

var $$19$1bv32$1: bv32;

var $$19$1bv32$2: bv32;

const _WATCHED_VALUE_$$h0: bv32;

procedure {:inline 1} _LOG_READ_$$h0(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$h0;



implementation {:inline 1} _LOG_READ_$$h0(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$h0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$h0 == _value then true else _READ_HAS_OCCURRED_$$h0);
    return;
}



procedure _CHECK_READ_$$h0(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "h0"} {:array "$$h0"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$h0 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$h0);
  requires {:source_name "h0"} {:array "$$h0"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$h0 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$h0: bool;

procedure {:inline 1} _LOG_WRITE_$$h0(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$h0, _WRITE_READ_BENIGN_FLAG_$$h0;



implementation {:inline 1} _LOG_WRITE_$$h0(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$h0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$h0 == _value then true else _WRITE_HAS_OCCURRED_$$h0);
    _WRITE_READ_BENIGN_FLAG_$$h0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$h0 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$h0);
    return;
}



procedure _CHECK_WRITE_$$h0(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "h0"} {:array "$$h0"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$h0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$h0 != _value);
  requires {:source_name "h0"} {:array "$$h0"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$h0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$h0 != _value);
  requires {:source_name "h0"} {:array "$$h0"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$h0 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$h0(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$h0;



implementation {:inline 1} _LOG_ATOMIC_$$h0(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$h0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$h0);
    return;
}



procedure _CHECK_ATOMIC_$$h0(_P: bool, _offset: bv32);
  requires {:source_name "h0"} {:array "$$h0"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$h0 && _WATCHED_OFFSET == _offset);
  requires {:source_name "h0"} {:array "$$h0"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$h0 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$h0(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$h0;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$h0(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$h0 := (if _P && _WRITE_HAS_OCCURRED_$$h0 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$h0);
    return;
}



const _WATCHED_VALUE_$$ht: bv32;

procedure {:inline 1} _LOG_READ_$$ht(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$ht;



implementation {:inline 1} _LOG_READ_$$ht(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$ht := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ht == _value then true else _READ_HAS_OCCURRED_$$ht);
    return;
}



procedure _CHECK_READ_$$ht(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "ht"} {:array "$$ht"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$ht);
  requires {:source_name "ht"} {:array "$$ht"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$ht: bool;

procedure {:inline 1} _LOG_WRITE_$$ht(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$ht, _WRITE_READ_BENIGN_FLAG_$$ht;



implementation {:inline 1} _LOG_WRITE_$$ht(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$ht := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ht == _value then true else _WRITE_HAS_OCCURRED_$$ht);
    _WRITE_READ_BENIGN_FLAG_$$ht := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ht == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$ht);
    return;
}



procedure _CHECK_WRITE_$$ht(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "ht"} {:array "$$ht"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ht != _value);
  requires {:source_name "ht"} {:array "$$ht"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ht != _value);
  requires {:source_name "ht"} {:array "$$ht"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$ht(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$ht;



implementation {:inline 1} _LOG_ATOMIC_$$ht(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$ht := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$ht);
    return;
}



procedure _CHECK_ATOMIC_$$ht(_P: bool, _offset: bv32);
  requires {:source_name "ht"} {:array "$$ht"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset);
  requires {:source_name "ht"} {:array "$$ht"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$ht(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$ht;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$ht(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$ht := (if _P && _WRITE_HAS_OCCURRED_$$ht && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$ht);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
