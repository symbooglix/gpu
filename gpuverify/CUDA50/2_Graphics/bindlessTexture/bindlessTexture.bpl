type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_output"} {:global} $$d_output: [bv32]bv8;

axiom {:array_info "$$d_output"} {:global} {:elem_width 8} {:source_name "d_output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_output: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_output: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_output: bool;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i"} {:elem_width 32} {:source_name "a.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 8} {:source_name ""} {:source_elem_width 32} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 8} {:source_name ""} {:source_elem_width 32} {:source_dimensions "1"} true;

axiom {:array_info "$$vec.i"} {:elem_width 32} {:source_name "vec.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$obj.i"} {:elem_width 32} {:source_name "obj.i"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$texCoded"} {:elem_width 32} {:source_name "texCoded"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 8} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$color"} {:elem_width 32} {:source_name "color"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 8} {:source_name ""} {:source_elem_width 32} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$8"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$atlasTexture"} {:global} {:elem_width 8} {:source_name "atlasTexture"} {:source_elem_width 128} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$atlasTexture: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$atlasTexture: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$atlasTexture: bool;

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

function FMUL32(bv32, bv32) : bv32;

function FP32_TO_UI8(bv32) : bv8;

function FSUB32(bv32, bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV64_OR(bv64, bv64) : bv64;

function {:bvbuiltin "bvshl"} BV64_SHL(bv64, bv64) : bv64;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 32"} BV32_ZEXT64(bv32) : bv64;

procedure {:source_name "d_render"} {:kernel} $_Z8d_renderP6uchar4jjf($imageW: bv32, $imageH: bv32, $lod: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $imageW == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$d_output && !_WRITE_HAS_OCCURRED_$$d_output && !_ATOMIC_HAS_OCCURRED_$$d_output;
  requires !_READ_HAS_OCCURRED_$$atlasTexture && !_WRITE_HAS_OCCURRED_$$atlasTexture && !_ATOMIC_HAS_OCCURRED_$$atlasTexture;
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
  modifies _WRITE_HAS_OCCURRED_$$d_output, _WRITE_READ_BENIGN_FLAG_$$d_output, _WRITE_READ_BENIGN_FLAG_$$d_output;



implementation {:source_name "d_render"} {:kernel} $_Z8d_renderP6uchar4jjf($imageW: bv32, $imageH: bv32, $lod: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v8$1: bv8;
  var v8$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
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
  var v28$1: bv8;
  var v28$2: bv8;
  var v29$1: bv8;
  var v29$2: bv8;
  var v30$1: bv8;
  var v30$2: bv8;
  var v31$1: bv8;
  var v31$2: bv8;
  var v32$1: bv8;
  var v32$2: bv8;
  var v33$1: bv8;
  var v33$2: bv8;
  var v34$1: bv8;
  var v34$2: bv8;
  var v35$1: bv8;
  var v35$2: bv8;
  var v36$1: bv8;
  var v36$2: bv8;
  var v37$1: bv8;
  var v37$2: bv8;
  var v38$1: bv64;
  var v38$2: bv64;
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
  var v45$1: bv128;
  var v45$2: bv128;
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
  var v51$1: bv32;
  var v51$2: bv32;
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
  var v74$1: bv8;
  var v74$2: bv8;
  var v75$1: bv8;
  var v75$2: bv8;
  var v76$1: bv8;
  var v76$2: bv8;
  var v77$1: bv8;
  var v77$2: bv8;
  var v78$1: bv8;
  var v78$2: bv8;
  var v79$1: bv8;
  var v79$2: bv8;
  var v80$1: bv8;
  var v80$2: bv8;
  var v81$1: bv8;
  var v81$2: bv8;
  var v82$1: bv8;
  var v82$2: bv8;
  var v83$1: bv8;
  var v83$2: bv8;
  var v84$1: bv8;
  var v84$2: bv8;
  var v85$1: bv8;
  var v85$2: bv8;
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
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2);
    v2$1 := FDIV32(UI32_TO_FP32(v0$1), UI32_TO_FP32($imageW));
    v2$2 := FDIV32(UI32_TO_FP32(v0$2), UI32_TO_FP32($imageW));
    v3$1 := FDIV32(UI32_TO_FP32(v1$1), UI32_TO_FP32($imageH));
    v3$2 := FDIV32(UI32_TO_FP32(v1$2), UI32_TO_FP32($imageH));
    v4$1 := BV32_ULT(v0$1, $imageW);
    v4$2 := BV32_ULT(v0$2, $imageW);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p0$1 := (if v4$1 then v4$1 else p0$1);
    p0$2 := (if v4$2 then v4$2 else p0$2);
    v5$1 := (if p0$1 then BV32_ULT(v1$1, $imageH) else v5$1);
    v5$2 := (if p0$2 then BV32_ULT(v1$2, $imageH) else v5$2);
    p1$1 := (if p0$1 && v5$1 then v5$1 else p1$1);
    p1$2 := (if p0$2 && v5$2 then v5$2 else p1$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v6$1 := (if p1$1 then _HAVOC_bv8$1 else v6$1);
    v6$2 := (if p1$2 then _HAVOC_bv8$2 else v6$2);
    $$4$0bv32$1 := (if p1$1 then v6$1 else $$4$0bv32$1);
    $$4$0bv32$2 := (if p1$2 then v6$2 else $$4$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v7$1 := (if p1$1 then _HAVOC_bv8$1 else v7$1);
    v7$2 := (if p1$2 then _HAVOC_bv8$2 else v7$2);
    $$4$1bv32$1 := (if p1$1 then v7$1 else $$4$1bv32$1);
    $$4$1bv32$2 := (if p1$2 then v7$2 else $$4$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v8$1 := (if p1$1 then _HAVOC_bv8$1 else v8$1);
    v8$2 := (if p1$2 then _HAVOC_bv8$2 else v8$2);
    $$4$2bv32$1 := (if p1$1 then v8$1 else $$4$2bv32$1);
    $$4$2bv32$2 := (if p1$2 then v8$2 else $$4$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v9$1 := (if p1$1 then _HAVOC_bv8$1 else v9$1);
    v9$2 := (if p1$2 then _HAVOC_bv8$2 else v9$2);
    $$4$3bv32$1 := (if p1$1 then v9$1 else $$4$3bv32$1);
    $$4$3bv32$2 := (if p1$2 then v9$2 else $$4$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v10$1 := (if p1$1 then _HAVOC_bv8$1 else v10$1);
    v10$2 := (if p1$2 then _HAVOC_bv8$2 else v10$2);
    $$4$4bv32$1 := (if p1$1 then v10$1 else $$4$4bv32$1);
    $$4$4bv32$2 := (if p1$2 then v10$2 else $$4$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v11$1 := (if p1$1 then _HAVOC_bv8$1 else v11$1);
    v11$2 := (if p1$2 then _HAVOC_bv8$2 else v11$2);
    $$4$5bv32$1 := (if p1$1 then v11$1 else $$4$5bv32$1);
    $$4$5bv32$2 := (if p1$2 then v11$2 else $$4$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v12$1 := (if p1$1 then _HAVOC_bv8$1 else v12$1);
    v12$2 := (if p1$2 then _HAVOC_bv8$2 else v12$2);
    $$4$6bv32$1 := (if p1$1 then v12$1 else $$4$6bv32$1);
    $$4$6bv32$2 := (if p1$2 then v12$2 else $$4$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v13$1 := (if p1$1 then _HAVOC_bv8$1 else v13$1);
    v13$2 := (if p1$2 then _HAVOC_bv8$2 else v13$2);
    $$4$7bv32$1 := (if p1$1 then v13$1 else $$4$7bv32$1);
    $$4$7bv32$2 := (if p1$2 then v13$2 else $$4$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v14$1 := (if p1$1 then _HAVOC_bv8$1 else v14$1);
    v14$2 := (if p1$2 then _HAVOC_bv8$2 else v14$2);
    $$4$8bv32$1 := (if p1$1 then v14$1 else $$4$8bv32$1);
    $$4$8bv32$2 := (if p1$2 then v14$2 else $$4$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v15$1 := (if p1$1 then _HAVOC_bv8$1 else v15$1);
    v15$2 := (if p1$2 then _HAVOC_bv8$2 else v15$2);
    $$4$9bv32$1 := (if p1$1 then v15$1 else $$4$9bv32$1);
    $$4$9bv32$2 := (if p1$2 then v15$2 else $$4$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v16$1 := (if p1$1 then _HAVOC_bv8$1 else v16$1);
    v16$2 := (if p1$2 then _HAVOC_bv8$2 else v16$2);
    $$4$10bv32$1 := (if p1$1 then v16$1 else $$4$10bv32$1);
    $$4$10bv32$2 := (if p1$2 then v16$2 else $$4$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v17$1 := (if p1$1 then _HAVOC_bv8$1 else v17$1);
    v17$2 := (if p1$2 then _HAVOC_bv8$2 else v17$2);
    $$4$11bv32$1 := (if p1$1 then v17$1 else $$4$11bv32$1);
    $$4$11bv32$2 := (if p1$2 then v17$2 else $$4$11bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v18$1 := (if p1$1 then _HAVOC_bv8$1 else v18$1);
    v18$2 := (if p1$2 then _HAVOC_bv8$2 else v18$2);
    $$4$12bv32$1 := (if p1$1 then v18$1 else $$4$12bv32$1);
    $$4$12bv32$2 := (if p1$2 then v18$2 else $$4$12bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v19$1 := (if p1$1 then _HAVOC_bv8$1 else v19$1);
    v19$2 := (if p1$2 then _HAVOC_bv8$2 else v19$2);
    $$4$13bv32$1 := (if p1$1 then v19$1 else $$4$13bv32$1);
    $$4$13bv32$2 := (if p1$2 then v19$2 else $$4$13bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v20$1 := (if p1$1 then _HAVOC_bv8$1 else v20$1);
    v20$2 := (if p1$2 then _HAVOC_bv8$2 else v20$2);
    $$4$14bv32$1 := (if p1$1 then v20$1 else $$4$14bv32$1);
    $$4$14bv32$2 := (if p1$2 then v20$2 else $$4$14bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v21$1 := (if p1$1 then _HAVOC_bv8$1 else v21$1);
    v21$2 := (if p1$2 then _HAVOC_bv8$2 else v21$2);
    $$4$15bv32$1 := (if p1$1 then v21$1 else $$4$15bv32$1);
    $$4$15bv32$2 := (if p1$2 then v21$2 else $$4$15bv32$2);
    v22$1 := (if p1$1 then $$4$0bv32$1 else v22$1);
    v22$2 := (if p1$2 then $$4$0bv32$2 else v22$2);
    v23$1 := (if p1$1 then $$4$1bv32$1 else v23$1);
    v23$2 := (if p1$2 then $$4$1bv32$2 else v23$2);
    v24$1 := (if p1$1 then $$4$2bv32$1 else v24$1);
    v24$2 := (if p1$2 then $$4$2bv32$2 else v24$2);
    v25$1 := (if p1$1 then $$4$3bv32$1 else v25$1);
    v25$2 := (if p1$2 then $$4$3bv32$2 else v25$2);
    v26$1 := (if p1$1 then $$4$4bv32$1 else v26$1);
    v26$2 := (if p1$2 then $$4$4bv32$2 else v26$2);
    v27$1 := (if p1$1 then $$4$5bv32$1 else v27$1);
    v27$2 := (if p1$2 then $$4$5bv32$2 else v27$2);
    v28$1 := (if p1$1 then $$4$6bv32$1 else v28$1);
    v28$2 := (if p1$2 then $$4$6bv32$2 else v28$2);
    v29$1 := (if p1$1 then $$4$7bv32$1 else v29$1);
    v29$2 := (if p1$2 then $$4$7bv32$2 else v29$2);
    v30$1 := (if p1$1 then $$4$8bv32$1 else v30$1);
    v30$2 := (if p1$2 then $$4$8bv32$2 else v30$2);
    v31$1 := (if p1$1 then $$4$9bv32$1 else v31$1);
    v31$2 := (if p1$2 then $$4$9bv32$2 else v31$2);
    v32$1 := (if p1$1 then $$4$10bv32$1 else v32$1);
    v32$2 := (if p1$2 then $$4$10bv32$2 else v32$2);
    v33$1 := (if p1$1 then $$4$11bv32$1 else v33$1);
    v33$2 := (if p1$2 then $$4$11bv32$2 else v33$2);
    v34$1 := (if p1$1 then $$4$12bv32$1 else v34$1);
    v34$2 := (if p1$2 then $$4$12bv32$2 else v34$2);
    v35$1 := (if p1$1 then $$4$13bv32$1 else v35$1);
    v35$2 := (if p1$2 then $$4$13bv32$2 else v35$2);
    v36$1 := (if p1$1 then $$4$14bv32$1 else v36$1);
    v36$2 := (if p1$2 then $$4$14bv32$2 else v36$2);
    v37$1 := (if p1$1 then $$4$15bv32$1 else v37$1);
    v37$2 := (if p1$2 then $$4$15bv32$2 else v37$2);
    call {:sourceloc_num 52} v38$1, v38$2 := $_Z5tex2DI5uint2ET_7textureIS1_Li2EL19cudaTextureReadMode0EEff(p1$1, v29$1 ++ v28$1 ++ v27$1 ++ v26$1 ++ v25$1 ++ v24$1 ++ v23$1 ++ v22$1, v33$1 ++ v32$1 ++ v31$1 ++ v30$1, v37$1 ++ v36$1 ++ v35$1 ++ v34$1, v2$1, v3$1, p1$2, v29$2 ++ v28$2 ++ v27$2 ++ v26$2 ++ v25$2 ++ v24$2 ++ v23$2 ++ v22$2, v33$2 ++ v32$2 ++ v31$2 ++ v30$2, v37$2 ++ v36$2 ++ v35$2 ++ v34$2, v2$2, v3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DI5uint2ET_7textureIS1_Li2EL19cudaTextureReadMode0EEff"} true;
    $$texCoded$0bv32$1 := (if p1$1 then v38$1[32:0] else $$texCoded$0bv32$1);
    $$texCoded$0bv32$2 := (if p1$2 then v38$2[32:0] else $$texCoded$0bv32$2);
    $$texCoded$1bv32$1 := (if p1$1 then v38$1[64:32] else $$texCoded$1bv32$1);
    $$texCoded$1bv32$2 := (if p1$2 then v38$2[64:32] else $$texCoded$1bv32$2);
    v39$1 := (if p1$1 then $$texCoded$0bv32$1 else v39$1);
    v39$2 := (if p1$2 then $$texCoded$0bv32$2 else v39$2);
    $$5$0bv32$1 := (if p1$1 then v39$1 else $$5$0bv32$1);
    $$5$0bv32$2 := (if p1$2 then v39$2 else $$5$0bv32$2);
    v40$1 := (if p1$1 then $$texCoded$1bv32$1 else v40$1);
    v40$2 := (if p1$2 then $$texCoded$1bv32$2 else v40$2);
    $$5$1bv32$1 := (if p1$1 then v40$1 else $$5$1bv32$1);
    $$5$1bv32$2 := (if p1$2 then v40$2 else $$5$1bv32$2);
    v41$1 := (if p1$1 then $$5$0bv32$1 else v41$1);
    v41$2 := (if p1$2 then $$5$0bv32$2 else v41$2);
    v42$1 := (if p1$1 then $$5$1bv32$1 else v42$1);
    v42$2 := (if p1$2 then $$5$1bv32$2 else v42$2);
    $$obj.i$0bv32$1 := (if p1$1 then v41$1 else $$obj.i$0bv32$1);
    $$obj.i$0bv32$2 := (if p1$2 then v41$2 else $$obj.i$0bv32$2);
    $$obj.i$1bv32$1 := (if p1$1 then v42$1 else $$obj.i$1bv32$1);
    $$obj.i$1bv32$2 := (if p1$2 then v42$2 else $$obj.i$1bv32$2);
    v43$1 := (if p1$1 then $$obj.i$0bv32$1 else v43$1);
    v43$2 := (if p1$2 then $$obj.i$0bv32$2 else v43$2);
    v44$1 := (if p1$1 then $$obj.i$1bv32$1 else v44$1);
    v44$2 := (if p1$2 then $$obj.i$1bv32$2 else v44$2);
    call {:sourceloc_num 65} v45$1, v45$2 := $_Z8tex2DLodI6float4ET_yfff($lod, p1$1, BV64_OR(BV32_ZEXT64(v43$1), BV64_SHL(BV32_ZEXT64(v44$1), 32bv64)), v2$1, FSUB32(1065353216bv32, v3$1), p1$2, BV64_OR(BV32_ZEXT64(v43$2), BV64_SHL(BV32_ZEXT64(v44$2), 32bv64)), v2$2, FSUB32(1065353216bv32, v3$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z8tex2DLodI6float4ET_yfff"} true;
    $$color$0bv32$1 := (if p1$1 then v45$1[32:0] else $$color$0bv32$1);
    $$color$0bv32$2 := (if p1$2 then v45$2[32:0] else $$color$0bv32$2);
    $$color$1bv32$1 := (if p1$1 then v45$1[64:32] else $$color$1bv32$1);
    $$color$1bv32$2 := (if p1$2 then v45$2[64:32] else $$color$1bv32$2);
    $$color$2bv32$1 := (if p1$1 then v45$1[96:64] else $$color$2bv32$1);
    $$color$2bv32$2 := (if p1$2 then v45$2[96:64] else $$color$2bv32$2);
    $$color$3bv32$1 := (if p1$1 then v45$1[128:96] else $$color$3bv32$1);
    $$color$3bv32$2 := (if p1$2 then v45$2[128:96] else $$color$3bv32$2);
    v46$1 := (if p1$1 then $$color$0bv32$1 else v46$1);
    v46$2 := (if p1$2 then $$color$0bv32$2 else v46$2);
    $$8$0bv32$1 := (if p1$1 then v46$1 else $$8$0bv32$1);
    $$8$0bv32$2 := (if p1$2 then v46$2 else $$8$0bv32$2);
    v47$1 := (if p1$1 then $$color$1bv32$1 else v47$1);
    v47$2 := (if p1$2 then $$color$1bv32$2 else v47$2);
    $$8$1bv32$1 := (if p1$1 then v47$1 else $$8$1bv32$1);
    $$8$1bv32$2 := (if p1$2 then v47$2 else $$8$1bv32$2);
    v48$1 := (if p1$1 then $$color$2bv32$1 else v48$1);
    v48$2 := (if p1$2 then $$color$2bv32$2 else v48$2);
    $$8$2bv32$1 := (if p1$1 then v48$1 else $$8$2bv32$1);
    $$8$2bv32$2 := (if p1$2 then v48$2 else $$8$2bv32$2);
    v49$1 := (if p1$1 then $$color$3bv32$1 else v49$1);
    v49$2 := (if p1$2 then $$color$3bv32$2 else v49$2);
    $$8$3bv32$1 := (if p1$1 then v49$1 else $$8$3bv32$1);
    $$8$3bv32$2 := (if p1$2 then v49$2 else $$8$3bv32$2);
    v50$1 := (if p1$1 then $$8$0bv32$1 else v50$1);
    v50$2 := (if p1$2 then $$8$0bv32$2 else v50$2);
    v51$1 := (if p1$1 then $$8$1bv32$1 else v51$1);
    v51$2 := (if p1$2 then $$8$1bv32$2 else v51$2);
    v52$1 := (if p1$1 then $$8$2bv32$1 else v52$1);
    v52$2 := (if p1$2 then $$8$2bv32$2 else v52$2);
    v53$1 := (if p1$1 then $$8$3bv32$1 else v53$1);
    v53$2 := (if p1$2 then $$8$3bv32$2 else v53$2);
    $$a.i$0bv32$1 := (if p1$1 then v50$1 else $$a.i$0bv32$1);
    $$a.i$0bv32$2 := (if p1$2 then v50$2 else $$a.i$0bv32$2);
    $$a.i$1bv32$1 := (if p1$1 then v51$1 else $$a.i$1bv32$1);
    $$a.i$1bv32$2 := (if p1$2 then v51$2 else $$a.i$1bv32$2);
    $$a.i$2bv32$1 := (if p1$1 then v52$1 else $$a.i$2bv32$1);
    $$a.i$2bv32$2 := (if p1$2 then v52$2 else $$a.i$2bv32$2);
    $$a.i$3bv32$1 := (if p1$1 then v53$1 else $$a.i$3bv32$1);
    $$a.i$3bv32$2 := (if p1$2 then v53$2 else $$a.i$3bv32$2);
    v54$1 := (if p1$1 then $$a.i$0bv32$1 else v54$1);
    v54$2 := (if p1$2 then $$a.i$0bv32$2 else v54$2);
    v55$1 := (if p1$1 then $$a.i$1bv32$1 else v55$1);
    v55$2 := (if p1$2 then $$a.i$1bv32$2 else v55$2);
    v56$1 := (if p1$1 then $$a.i$2bv32$1 else v56$1);
    v56$2 := (if p1$2 then $$a.i$2bv32$2 else v56$2);
    v57$1 := (if p1$1 then $$a.i$3bv32$1 else v57$1);
    v57$2 := (if p1$2 then $$a.i$3bv32$2 else v57$2);
    $$0$0bv32$1 := (if p1$1 then FMUL32(v54$1, 1132396544bv32) else $$0$0bv32$1);
    $$0$0bv32$2 := (if p1$2 then FMUL32(v54$2, 1132396544bv32) else $$0$0bv32$2);
    $$0$1bv32$1 := (if p1$1 then FMUL32(v55$1, 1132396544bv32) else $$0$1bv32$1);
    $$0$1bv32$2 := (if p1$2 then FMUL32(v55$2, 1132396544bv32) else $$0$1bv32$2);
    $$0$2bv32$1 := (if p1$1 then FMUL32(v56$1, 1132396544bv32) else $$0$2bv32$1);
    $$0$2bv32$2 := (if p1$2 then FMUL32(v56$2, 1132396544bv32) else $$0$2bv32$2);
    $$0$3bv32$1 := (if p1$1 then FMUL32(v57$1, 1132396544bv32) else $$0$3bv32$1);
    $$0$3bv32$2 := (if p1$2 then FMUL32(v57$2, 1132396544bv32) else $$0$3bv32$2);
    v58$1 := (if p1$1 then $$0$0bv32$1 else v58$1);
    v58$2 := (if p1$2 then $$0$0bv32$2 else v58$2);
    v59$1 := (if p1$1 then $$0$1bv32$1 else v59$1);
    v59$2 := (if p1$2 then $$0$1bv32$2 else v59$2);
    v60$1 := (if p1$1 then $$0$2bv32$1 else v60$1);
    v60$2 := (if p1$2 then $$0$2bv32$2 else v60$2);
    v61$1 := (if p1$1 then $$0$3bv32$1 else v61$1);
    v61$2 := (if p1$2 then $$0$3bv32$2 else v61$2);
    $$1$0bv32$1 := (if p1$1 then v58$1 else $$1$0bv32$1);
    $$1$0bv32$2 := (if p1$2 then v58$2 else $$1$0bv32$2);
    $$1$1bv32$1 := (if p1$1 then v59$1 else $$1$1bv32$1);
    $$1$1bv32$2 := (if p1$2 then v59$2 else $$1$1bv32$2);
    $$1$2bv32$1 := (if p1$1 then v60$1 else $$1$2bv32$1);
    $$1$2bv32$2 := (if p1$2 then v60$2 else $$1$2bv32$2);
    $$1$3bv32$1 := (if p1$1 then v61$1 else $$1$3bv32$1);
    $$1$3bv32$2 := (if p1$2 then v61$2 else $$1$3bv32$2);
    v62$1 := (if p1$1 then $$1$0bv32$1 else v62$1);
    v62$2 := (if p1$2 then $$1$0bv32$2 else v62$2);
    v63$1 := (if p1$1 then $$1$1bv32$1 else v63$1);
    v63$2 := (if p1$2 then $$1$1bv32$2 else v63$2);
    v64$1 := (if p1$1 then $$1$2bv32$1 else v64$1);
    v64$2 := (if p1$2 then $$1$2bv32$2 else v64$2);
    v65$1 := (if p1$1 then $$1$3bv32$1 else v65$1);
    v65$2 := (if p1$2 then $$1$3bv32$2 else v65$2);
    $$7$0bv32$1 := (if p1$1 then v62$1 else $$7$0bv32$1);
    $$7$0bv32$2 := (if p1$2 then v62$2 else $$7$0bv32$2);
    $$7$1bv32$1 := (if p1$1 then v63$1 else $$7$1bv32$1);
    $$7$1bv32$2 := (if p1$2 then v63$2 else $$7$1bv32$2);
    $$7$2bv32$1 := (if p1$1 then v64$1 else $$7$2bv32$1);
    $$7$2bv32$2 := (if p1$2 then v64$2 else $$7$2bv32$2);
    $$7$3bv32$1 := (if p1$1 then v65$1 else $$7$3bv32$1);
    $$7$3bv32$2 := (if p1$2 then v65$2 else $$7$3bv32$2);
    v66$1 := (if p1$1 then $$7$0bv32$1 else v66$1);
    v66$2 := (if p1$2 then $$7$0bv32$2 else v66$2);
    v67$1 := (if p1$1 then $$7$1bv32$1 else v67$1);
    v67$2 := (if p1$2 then $$7$1bv32$2 else v67$2);
    v68$1 := (if p1$1 then $$7$2bv32$1 else v68$1);
    v68$2 := (if p1$2 then $$7$2bv32$2 else v68$2);
    v69$1 := (if p1$1 then $$7$3bv32$1 else v69$1);
    v69$2 := (if p1$2 then $$7$3bv32$2 else v69$2);
    $$vec.i$0bv32$1 := (if p1$1 then v66$1 else $$vec.i$0bv32$1);
    $$vec.i$0bv32$2 := (if p1$2 then v66$2 else $$vec.i$0bv32$2);
    $$vec.i$1bv32$1 := (if p1$1 then v67$1 else $$vec.i$1bv32$1);
    $$vec.i$1bv32$2 := (if p1$2 then v67$2 else $$vec.i$1bv32$2);
    $$vec.i$2bv32$1 := (if p1$1 then v68$1 else $$vec.i$2bv32$1);
    $$vec.i$2bv32$2 := (if p1$2 then v68$2 else $$vec.i$2bv32$2);
    $$vec.i$3bv32$1 := (if p1$1 then v69$1 else $$vec.i$3bv32$1);
    $$vec.i$3bv32$2 := (if p1$2 then v69$2 else $$vec.i$3bv32$2);
    v70$1 := (if p1$1 then $$vec.i$0bv32$1 else v70$1);
    v70$2 := (if p1$2 then $$vec.i$0bv32$2 else v70$2);
    v71$1 := (if p1$1 then $$vec.i$1bv32$1 else v71$1);
    v71$2 := (if p1$2 then $$vec.i$1bv32$2 else v71$2);
    v72$1 := (if p1$1 then $$vec.i$2bv32$1 else v72$1);
    v72$2 := (if p1$2 then $$vec.i$2bv32$2 else v72$2);
    v73$1 := (if p1$1 then $$vec.i$3bv32$1 else v73$1);
    v73$2 := (if p1$2 then $$vec.i$3bv32$2 else v73$2);
    $$2$0bv32$1 := (if p1$1 then FP32_TO_UI8(v70$1) else $$2$0bv32$1);
    $$2$0bv32$2 := (if p1$2 then FP32_TO_UI8(v70$2) else $$2$0bv32$2);
    $$2$1bv32$1 := (if p1$1 then FP32_TO_UI8(v71$1) else $$2$1bv32$1);
    $$2$1bv32$2 := (if p1$2 then FP32_TO_UI8(v71$2) else $$2$1bv32$2);
    $$2$2bv32$1 := (if p1$1 then FP32_TO_UI8(v72$1) else $$2$2bv32$1);
    $$2$2bv32$2 := (if p1$2 then FP32_TO_UI8(v72$2) else $$2$2bv32$2);
    $$2$3bv32$1 := (if p1$1 then FP32_TO_UI8(v73$1) else $$2$3bv32$1);
    $$2$3bv32$2 := (if p1$2 then FP32_TO_UI8(v73$2) else $$2$3bv32$2);
    v74$1 := (if p1$1 then $$2$0bv32$1 else v74$1);
    v74$2 := (if p1$2 then $$2$0bv32$2 else v74$2);
    v75$1 := (if p1$1 then $$2$1bv32$1 else v75$1);
    v75$2 := (if p1$2 then $$2$1bv32$2 else v75$2);
    v76$1 := (if p1$1 then $$2$2bv32$1 else v76$1);
    v76$2 := (if p1$2 then $$2$2bv32$2 else v76$2);
    v77$1 := (if p1$1 then $$2$3bv32$1 else v77$1);
    v77$2 := (if p1$2 then $$2$3bv32$2 else v77$2);
    $$3$0bv32$1 := (if p1$1 then v74$1 else $$3$0bv32$1);
    $$3$0bv32$2 := (if p1$2 then v74$2 else $$3$0bv32$2);
    $$3$1bv32$1 := (if p1$1 then v75$1 else $$3$1bv32$1);
    $$3$1bv32$2 := (if p1$2 then v75$2 else $$3$1bv32$2);
    $$3$2bv32$1 := (if p1$1 then v76$1 else $$3$2bv32$1);
    $$3$2bv32$2 := (if p1$2 then v76$2 else $$3$2bv32$2);
    $$3$3bv32$1 := (if p1$1 then v77$1 else $$3$3bv32$1);
    $$3$3bv32$2 := (if p1$2 then v77$2 else $$3$3bv32$2);
    v78$1 := (if p1$1 then $$3$0bv32$1 else v78$1);
    v78$2 := (if p1$2 then $$3$0bv32$2 else v78$2);
    v79$1 := (if p1$1 then $$3$1bv32$1 else v79$1);
    v79$2 := (if p1$2 then $$3$1bv32$2 else v79$2);
    v80$1 := (if p1$1 then $$3$2bv32$1 else v80$1);
    v80$2 := (if p1$2 then $$3$2bv32$2 else v80$2);
    v81$1 := (if p1$1 then $$3$3bv32$1 else v81$1);
    v81$2 := (if p1$2 then $$3$3bv32$2 else v81$2);
    $$6$0bv32$1 := (if p1$1 then v78$1 else $$6$0bv32$1);
    $$6$0bv32$2 := (if p1$2 then v78$2 else $$6$0bv32$2);
    $$6$1bv32$1 := (if p1$1 then v79$1 else $$6$1bv32$1);
    $$6$1bv32$2 := (if p1$2 then v79$2 else $$6$1bv32$2);
    $$6$2bv32$1 := (if p1$1 then v80$1 else $$6$2bv32$1);
    $$6$2bv32$2 := (if p1$2 then v80$2 else $$6$2bv32$2);
    $$6$3bv32$1 := (if p1$1 then v81$1 else $$6$3bv32$1);
    $$6$3bv32$2 := (if p1$2 then v81$2 else $$6$3bv32$2);
    v82$1 := (if p1$1 then $$6$0bv32$1 else v82$1);
    v82$2 := (if p1$2 then $$6$0bv32$2 else v82$2);
    call {:sourceloc} {:sourceloc_num 143} _LOG_WRITE_$$d_output(p1$1, BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32), v82$1, $$d_output[BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_output(p1$2, BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 143} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 143} _CHECK_WRITE_$$d_output(p1$2, BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32), v82$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_output"} true;
    $$d_output[BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32)] := (if p1$1 then v82$1 else $$d_output[BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32)]);
    $$d_output[BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32)] := (if p1$2 then v82$2 else $$d_output[BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32)]);
    v83$1 := (if p1$1 then $$6$1bv32$1 else v83$1);
    v83$2 := (if p1$2 then $$6$1bv32$2 else v83$2);
    call {:sourceloc} {:sourceloc_num 145} _LOG_WRITE_$$d_output(p1$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32), 1bv32), v83$1, $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_output(p1$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 145} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 145} _CHECK_WRITE_$$d_output(p1$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32), 1bv32), v83$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_output"} true;
    $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32), 1bv32)] := (if p1$1 then v83$1 else $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32), 1bv32)]);
    $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32), 1bv32)] := (if p1$2 then v83$2 else $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32), 1bv32)]);
    v84$1 := (if p1$1 then $$6$2bv32$1 else v84$1);
    v84$2 := (if p1$2 then $$6$2bv32$2 else v84$2);
    call {:sourceloc} {:sourceloc_num 147} _LOG_WRITE_$$d_output(p1$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32), 2bv32), v84$1, $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_output(p1$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 147} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 147} _CHECK_WRITE_$$d_output(p1$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32), 2bv32), v84$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_output"} true;
    $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32), 2bv32)] := (if p1$1 then v84$1 else $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32), 2bv32)]);
    $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32), 2bv32)] := (if p1$2 then v84$2 else $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32), 2bv32)]);
    v85$1 := (if p1$1 then $$6$3bv32$1 else v85$1);
    v85$2 := (if p1$2 then $$6$3bv32$2 else v85$2);
    call {:sourceloc} {:sourceloc_num 149} _LOG_WRITE_$$d_output(p1$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32), 3bv32), v85$1, $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_output(p1$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 149} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 149} _CHECK_WRITE_$$d_output(p1$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32), 3bv32), v85$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_output"} true;
    $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32), 3bv32)] := (if p1$1 then v85$1 else $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $imageW), v0$1), 4bv32), 3bv32)]);
    $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32), 3bv32)] := (if p1$2 then v85$2 else $$d_output[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $imageW), v0$2), 4bv32), 3bv32)]);
    return;
}



procedure {:source_name "_Z5tex2DI5uint2ET_7textureIS1_Li2EL19cudaTextureReadMode0EEff"} $_Z5tex2DI5uint2ET_7textureIS1_Li2EL19cudaTextureReadMode0EEff(_P$1: bool, $0$1: bv64, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, _P$2: bool, $0$2: bv64, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32) returns ($ret$1: bv64, $ret$2: bv64);



procedure {:source_name "_Z8tex2DLodI6float4ET_yfff"} $_Z8tex2DLodI6float4ET_yfff($3: bv32, _P$1: bool, $0$1: bv64, $1$1: bv32, $2$1: bv32, _P$2: bool, $0$2: bv64, $1$2: bv32, $2$2: bv32) returns ($ret$1: bv128, $ret$2: bv128);



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 32bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$0$0bv32$1: bv32;

var $$0$0bv32$2: bv32;

var $$0$1bv32$1: bv32;

var $$0$1bv32$2: bv32;

var $$0$2bv32$1: bv32;

var $$0$2bv32$2: bv32;

var $$0$3bv32$1: bv32;

var $$0$3bv32$2: bv32;

var $$1$0bv32$1: bv32;

var $$1$0bv32$2: bv32;

var $$1$1bv32$1: bv32;

var $$1$1bv32$2: bv32;

var $$1$2bv32$1: bv32;

var $$1$2bv32$2: bv32;

var $$1$3bv32$1: bv32;

var $$1$3bv32$2: bv32;

var $$a.i$0bv32$1: bv32;

var $$a.i$0bv32$2: bv32;

var $$a.i$1bv32$1: bv32;

var $$a.i$1bv32$2: bv32;

var $$a.i$2bv32$1: bv32;

var $$a.i$2bv32$2: bv32;

var $$a.i$3bv32$1: bv32;

var $$a.i$3bv32$2: bv32;

var $$2$0bv32$1: bv8;

var $$2$0bv32$2: bv8;

var $$2$1bv32$1: bv8;

var $$2$1bv32$2: bv8;

var $$2$2bv32$1: bv8;

var $$2$2bv32$2: bv8;

var $$2$3bv32$1: bv8;

var $$2$3bv32$2: bv8;

var $$3$0bv32$1: bv8;

var $$3$0bv32$2: bv8;

var $$3$1bv32$1: bv8;

var $$3$1bv32$2: bv8;

var $$3$2bv32$1: bv8;

var $$3$2bv32$2: bv8;

var $$3$3bv32$1: bv8;

var $$3$3bv32$2: bv8;

var $$vec.i$0bv32$1: bv32;

var $$vec.i$0bv32$2: bv32;

var $$vec.i$1bv32$1: bv32;

var $$vec.i$1bv32$2: bv32;

var $$vec.i$2bv32$1: bv32;

var $$vec.i$2bv32$2: bv32;

var $$vec.i$3bv32$1: bv32;

var $$vec.i$3bv32$2: bv32;

var $$obj.i$0bv32$1: bv32;

var $$obj.i$0bv32$2: bv32;

var $$obj.i$1bv32$1: bv32;

var $$obj.i$1bv32$2: bv32;

var $$texCoded$0bv32$1: bv32;

var $$texCoded$0bv32$2: bv32;

var $$texCoded$1bv32$1: bv32;

var $$texCoded$1bv32$2: bv32;

var $$4$0bv32$1: bv8;

var $$4$0bv32$2: bv8;

var $$4$1bv32$1: bv8;

var $$4$1bv32$2: bv8;

var $$4$2bv32$1: bv8;

var $$4$2bv32$2: bv8;

var $$4$3bv32$1: bv8;

var $$4$3bv32$2: bv8;

var $$4$4bv32$1: bv8;

var $$4$4bv32$2: bv8;

var $$4$5bv32$1: bv8;

var $$4$5bv32$2: bv8;

var $$4$6bv32$1: bv8;

var $$4$6bv32$2: bv8;

var $$4$7bv32$1: bv8;

var $$4$7bv32$2: bv8;

var $$4$8bv32$1: bv8;

var $$4$8bv32$2: bv8;

var $$4$9bv32$1: bv8;

var $$4$9bv32$2: bv8;

var $$4$10bv32$1: bv8;

var $$4$10bv32$2: bv8;

var $$4$11bv32$1: bv8;

var $$4$11bv32$2: bv8;

var $$4$12bv32$1: bv8;

var $$4$12bv32$2: bv8;

var $$4$13bv32$1: bv8;

var $$4$13bv32$2: bv8;

var $$4$14bv32$1: bv8;

var $$4$14bv32$2: bv8;

var $$4$15bv32$1: bv8;

var $$4$15bv32$2: bv8;

var $$5$0bv32$1: bv32;

var $$5$0bv32$2: bv32;

var $$5$1bv32$1: bv32;

var $$5$1bv32$2: bv32;

var $$color$0bv32$1: bv32;

var $$color$0bv32$2: bv32;

var $$color$1bv32$1: bv32;

var $$color$1bv32$2: bv32;

var $$color$2bv32$1: bv32;

var $$color$2bv32$2: bv32;

var $$color$3bv32$1: bv32;

var $$color$3bv32$2: bv32;

var $$6$0bv32$1: bv8;

var $$6$0bv32$2: bv8;

var $$6$1bv32$1: bv8;

var $$6$1bv32$2: bv8;

var $$6$2bv32$1: bv8;

var $$6$2bv32$2: bv8;

var $$6$3bv32$1: bv8;

var $$6$3bv32$2: bv8;

var $$7$0bv32$1: bv32;

var $$7$0bv32$2: bv32;

var $$7$1bv32$1: bv32;

var $$7$1bv32$2: bv32;

var $$7$2bv32$1: bv32;

var $$7$2bv32$2: bv32;

var $$7$3bv32$1: bv32;

var $$7$3bv32$2: bv32;

var $$8$0bv32$1: bv32;

var $$8$0bv32$2: bv32;

var $$8$1bv32$1: bv32;

var $$8$1bv32$2: bv32;

var $$8$2bv32$1: bv32;

var $$8$2bv32$2: bv32;

var $$8$3bv32$1: bv32;

var $$8$3bv32$2: bv32;

const _WATCHED_VALUE_$$d_output: bv8;

procedure {:inline 1} _LOG_READ_$$d_output(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$d_output;



implementation {:inline 1} _LOG_READ_$$d_output(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output == _value then true else _READ_HAS_OCCURRED_$$d_output);
    return;
}



procedure _CHECK_READ_$$d_output(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_output);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_output: bool;

procedure {:inline 1} _LOG_WRITE_$$d_output(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$d_output, _WRITE_READ_BENIGN_FLAG_$$d_output;



implementation {:inline 1} _LOG_WRITE_$$d_output(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output == _value then true else _WRITE_HAS_OCCURRED_$$d_output);
    _WRITE_READ_BENIGN_FLAG_$$d_output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_output);
    return;
}



procedure _CHECK_WRITE_$$d_output(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output != _value);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output != _value);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_output(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_output;



implementation {:inline 1} _LOG_ATOMIC_$$d_output(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_output);
    return;
}



procedure _CHECK_ATOMIC_$$d_output(_P: bool, _offset: bv32);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_output(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_output;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_output(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_output := (if _P && _WRITE_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_output);
    return;
}



const _WATCHED_VALUE_$$atlasTexture: bv8;

procedure {:inline 1} _LOG_READ_$$atlasTexture(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$atlasTexture;



implementation {:inline 1} _LOG_READ_$$atlasTexture(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$atlasTexture := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$atlasTexture == _value then true else _READ_HAS_OCCURRED_$$atlasTexture);
    return;
}



procedure _CHECK_READ_$$atlasTexture(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "atlasTexture"} {:array "$$atlasTexture"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$atlasTexture && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$atlasTexture);
  requires {:source_name "atlasTexture"} {:array "$$atlasTexture"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$atlasTexture && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$atlasTexture: bool;

procedure {:inline 1} _LOG_WRITE_$$atlasTexture(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$atlasTexture, _WRITE_READ_BENIGN_FLAG_$$atlasTexture;



implementation {:inline 1} _LOG_WRITE_$$atlasTexture(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$atlasTexture := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$atlasTexture == _value then true else _WRITE_HAS_OCCURRED_$$atlasTexture);
    _WRITE_READ_BENIGN_FLAG_$$atlasTexture := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$atlasTexture == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$atlasTexture);
    return;
}



procedure _CHECK_WRITE_$$atlasTexture(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "atlasTexture"} {:array "$$atlasTexture"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$atlasTexture && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$atlasTexture != _value);
  requires {:source_name "atlasTexture"} {:array "$$atlasTexture"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$atlasTexture && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$atlasTexture != _value);
  requires {:source_name "atlasTexture"} {:array "$$atlasTexture"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$atlasTexture && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$atlasTexture(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$atlasTexture;



implementation {:inline 1} _LOG_ATOMIC_$$atlasTexture(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$atlasTexture := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$atlasTexture);
    return;
}



procedure _CHECK_ATOMIC_$$atlasTexture(_P: bool, _offset: bv32);
  requires {:source_name "atlasTexture"} {:array "$$atlasTexture"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$atlasTexture && _WATCHED_OFFSET == _offset);
  requires {:source_name "atlasTexture"} {:array "$$atlasTexture"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$atlasTexture && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$atlasTexture(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$atlasTexture;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$atlasTexture(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$atlasTexture := (if _P && _WRITE_HAS_OCCURRED_$$atlasTexture && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$atlasTexture);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
