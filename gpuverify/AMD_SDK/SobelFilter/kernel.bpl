type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



axiom {:array_info "$$inputImage"} {:global} {:elem_width 8} {:source_name "inputImage"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$inputImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$inputImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$inputImage: bool;

var {:source_name "outputImage"} {:global} $$outputImage: [bv32]bv8;

axiom {:array_info "$$outputImage"} {:global} {:elem_width 8} {:source_name "outputImage"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$outputImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$outputImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$outputImage: bool;

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

function FP32_TO_UI8(bv32) : bv8;

function FSQRT32(bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function UI8_TO_FP32(bv8) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "sobel_filter"} {:kernel} $sobel_filter();
  requires !_READ_HAS_OCCURRED_$$inputImage && !_WRITE_HAS_OCCURRED_$$inputImage && !_ATOMIC_HAS_OCCURRED_$$inputImage;
  requires !_READ_HAS_OCCURRED_$$outputImage && !_WRITE_HAS_OCCURRED_$$outputImage && !_ATOMIC_HAS_OCCURRED_$$outputImage;
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
  modifies _WRITE_HAS_OCCURRED_$$outputImage, _WRITE_READ_BENIGN_FLAG_$$outputImage, _WRITE_READ_BENIGN_FLAG_$$outputImage;



implementation {:source_name "sobel_filter"} {:kernel} $sobel_filter()
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bv8;
  var v8$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
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
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27$1: bv32;
  var v27$2: bv32;
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
  var v38$1: bv8;
  var v38$2: bv8;
  var v39$1: bv8;
  var v39$2: bv8;
  var v40$1: bv8;
  var v40$2: bv8;
  var v41$1: bv8;
  var v41$2: bv8;
  var v42$1: bv8;
  var v42$2: bv8;
  var v43$1: bv8;
  var v43$2: bv8;
  var v44$1: bv32;
  var v44$2: bv32;
  var v45$1: bv32;
  var v45$2: bv32;
  var v46$1: bv32;
  var v46$2: bv32;
  var v47$1: bv32;
  var v47$2: bv32;
  var v48$1: bv8;
  var v48$2: bv8;
  var v49$1: bv8;
  var v49$2: bv8;
  var v50$1: bv8;
  var v50$2: bv8;
  var v51$1: bv8;
  var v51$2: bv8;
  var v52$1: bv8;
  var v52$2: bv8;
  var v53$1: bv8;
  var v53$2: bv8;
  var v54$1: bv8;
  var v54$2: bv8;
  var v55$1: bv8;
  var v55$2: bv8;
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
  var p5$1: bool;
  var p5$2: bool;
  var p6$1: bool;
  var p6$2: bool;
  var p7$1: bool;
  var p7$2: bool;
  var _HAVOC_bv8$1: bv8;
  var _HAVOC_bv8$2: bv8;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    v2 := BV32_MUL(group_size_x, num_groups_x);
    v3$1 := BV32_ADD(v0$1, BV32_MUL(v1$1, v2));
    v3$2 := BV32_ADD(v0$2, BV32_MUL(v1$2, v2));
    v4$1 := BV32_UGE(v0$1, 1bv32);
    v4$2 := BV32_UGE(v0$2, 1bv32);
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
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    p0$1 := (if v4$1 then v4$1 else p0$1);
    p0$2 := (if v4$2 then v4$2 else p0$2);
    v5$1 := (if p0$1 then BV32_ULT(v0$1, BV32_SUB(v2, 1bv32)) else v5$1);
    v5$2 := (if p0$2 then BV32_ULT(v0$2, BV32_SUB(v2, 1bv32)) else v5$2);
    p1$1 := (if p0$1 && v5$1 then v5$1 else p1$1);
    p1$2 := (if p0$2 && v5$2 then v5$2 else p1$2);
    v6$1 := (if p1$1 then BV32_UGE(v1$1, 1bv32) else v6$1);
    v6$2 := (if p1$2 then BV32_UGE(v1$2, 1bv32) else v6$2);
    p2$1 := (if p1$1 && v6$1 then v6$1 else p2$1);
    p2$2 := (if p1$2 && v6$2 then v6$2 else p2$2);
    v7$1 := (if p2$1 then BV32_ULT(v1$1, BV32_SUB(BV32_MUL(group_size_y, num_groups_y), 1bv32)) else v7$1);
    v7$2 := (if p2$2 then BV32_ULT(v1$2, BV32_SUB(BV32_MUL(group_size_y, num_groups_y), 1bv32)) else v7$2);
    p3$1 := (if p2$1 && v7$1 then v7$1 else p3$1);
    p3$2 := (if p2$2 && v7$2 then v7$2 else p3$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v8$1 := (if p3$1 then _HAVOC_bv8$1 else v8$1);
    v8$2 := (if p3$2 then _HAVOC_bv8$2 else v8$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v9$1 := (if p3$1 then _HAVOC_bv8$1 else v9$1);
    v9$2 := (if p3$2 then _HAVOC_bv8$2 else v9$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v10$1 := (if p3$1 then _HAVOC_bv8$1 else v10$1);
    v10$2 := (if p3$2 then _HAVOC_bv8$2 else v10$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v11$1 := (if p3$1 then _HAVOC_bv8$1 else v11$1);
    v11$2 := (if p3$2 then _HAVOC_bv8$2 else v11$2);
    v12$1 := (if p3$1 then UI8_TO_FP32(v8$1) else v12$1);
    v12$2 := (if p3$2 then UI8_TO_FP32(v8$2) else v12$2);
    v13$1 := (if p3$1 then UI8_TO_FP32(v9$1) else v13$1);
    v13$2 := (if p3$2 then UI8_TO_FP32(v9$2) else v13$2);
    v14$1 := (if p3$1 then UI8_TO_FP32(v10$1) else v14$1);
    v14$2 := (if p3$2 then UI8_TO_FP32(v10$2) else v14$2);
    v15$1 := (if p3$1 then UI8_TO_FP32(v11$1) else v15$1);
    v15$2 := (if p3$2 then UI8_TO_FP32(v11$2) else v15$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v16$1 := (if p3$1 then _HAVOC_bv8$1 else v16$1);
    v16$2 := (if p3$2 then _HAVOC_bv8$2 else v16$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v17$1 := (if p3$1 then _HAVOC_bv8$1 else v17$1);
    v17$2 := (if p3$2 then _HAVOC_bv8$2 else v17$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v18$1 := (if p3$1 then _HAVOC_bv8$1 else v18$1);
    v18$2 := (if p3$2 then _HAVOC_bv8$2 else v18$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v19$1 := (if p3$1 then _HAVOC_bv8$1 else v19$1);
    v19$2 := (if p3$2 then _HAVOC_bv8$2 else v19$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v20$1 := (if p3$1 then _HAVOC_bv8$1 else v20$1);
    v20$2 := (if p3$2 then _HAVOC_bv8$2 else v20$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v21$1 := (if p3$1 then _HAVOC_bv8$1 else v21$1);
    v21$2 := (if p3$2 then _HAVOC_bv8$2 else v21$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v22$1 := (if p3$1 then _HAVOC_bv8$1 else v22$1);
    v22$2 := (if p3$2 then _HAVOC_bv8$2 else v22$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v23$1 := (if p3$1 then _HAVOC_bv8$1 else v23$1);
    v23$2 := (if p3$2 then _HAVOC_bv8$2 else v23$2);
    v24$1 := (if p3$1 then UI8_TO_FP32(v20$1) else v24$1);
    v24$2 := (if p3$2 then UI8_TO_FP32(v20$2) else v24$2);
    v25$1 := (if p3$1 then UI8_TO_FP32(v21$1) else v25$1);
    v25$2 := (if p3$2 then UI8_TO_FP32(v21$2) else v25$2);
    v26$1 := (if p3$1 then UI8_TO_FP32(v22$1) else v26$1);
    v26$2 := (if p3$2 then UI8_TO_FP32(v22$2) else v26$2);
    v27$1 := (if p3$1 then UI8_TO_FP32(v23$1) else v27$1);
    v27$2 := (if p3$2 then UI8_TO_FP32(v23$2) else v27$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v28$1 := (if p3$1 then _HAVOC_bv8$1 else v28$1);
    v28$2 := (if p3$2 then _HAVOC_bv8$2 else v28$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v29$1 := (if p3$1 then _HAVOC_bv8$1 else v29$1);
    v29$2 := (if p3$2 then _HAVOC_bv8$2 else v29$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v30$1 := (if p3$1 then _HAVOC_bv8$1 else v30$1);
    v30$2 := (if p3$2 then _HAVOC_bv8$2 else v30$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v31$1 := (if p3$1 then _HAVOC_bv8$1 else v31$1);
    v31$2 := (if p3$2 then _HAVOC_bv8$2 else v31$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v32$1 := (if p3$1 then _HAVOC_bv8$1 else v32$1);
    v32$2 := (if p3$2 then _HAVOC_bv8$2 else v32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v33$1 := (if p3$1 then _HAVOC_bv8$1 else v33$1);
    v33$2 := (if p3$2 then _HAVOC_bv8$2 else v33$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v34$1 := (if p3$1 then _HAVOC_bv8$1 else v34$1);
    v34$2 := (if p3$2 then _HAVOC_bv8$2 else v34$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v35$1 := (if p3$1 then _HAVOC_bv8$1 else v35$1);
    v35$2 := (if p3$2 then _HAVOC_bv8$2 else v35$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v36$1 := (if p3$1 then _HAVOC_bv8$1 else v36$1);
    v36$2 := (if p3$2 then _HAVOC_bv8$2 else v36$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v37$1 := (if p3$1 then _HAVOC_bv8$1 else v37$1);
    v37$2 := (if p3$2 then _HAVOC_bv8$2 else v37$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v38$1 := (if p3$1 then _HAVOC_bv8$1 else v38$1);
    v38$2 := (if p3$2 then _HAVOC_bv8$2 else v38$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v39$1 := (if p3$1 then _HAVOC_bv8$1 else v39$1);
    v39$2 := (if p3$2 then _HAVOC_bv8$2 else v39$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v40$1 := (if p3$1 then _HAVOC_bv8$1 else v40$1);
    v40$2 := (if p3$2 then _HAVOC_bv8$2 else v40$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v41$1 := (if p3$1 then _HAVOC_bv8$1 else v41$1);
    v41$2 := (if p3$2 then _HAVOC_bv8$2 else v41$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v42$1 := (if p3$1 then _HAVOC_bv8$1 else v42$1);
    v42$2 := (if p3$2 then _HAVOC_bv8$2 else v42$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v43$1 := (if p3$1 then _HAVOC_bv8$1 else v43$1);
    v43$2 := (if p3$2 then _HAVOC_bv8$2 else v43$2);
    v44$1 := (if p3$1 then UI8_TO_FP32(v40$1) else v44$1);
    v44$2 := (if p3$2 then UI8_TO_FP32(v40$2) else v44$2);
    v45$1 := (if p3$1 then UI8_TO_FP32(v41$1) else v45$1);
    v45$2 := (if p3$2 then UI8_TO_FP32(v41$2) else v45$2);
    v46$1 := (if p3$1 then UI8_TO_FP32(v42$1) else v46$1);
    v46$2 := (if p3$2 then UI8_TO_FP32(v42$2) else v46$2);
    v47$1 := (if p3$1 then UI8_TO_FP32(v43$1) else v47$1);
    v47$2 := (if p3$2 then UI8_TO_FP32(v43$2) else v47$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v48$1 := (if p3$1 then _HAVOC_bv8$1 else v48$1);
    v48$2 := (if p3$2 then _HAVOC_bv8$2 else v48$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v49$1 := (if p3$1 then _HAVOC_bv8$1 else v49$1);
    v49$2 := (if p3$2 then _HAVOC_bv8$2 else v49$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v50$1 := (if p3$1 then _HAVOC_bv8$1 else v50$1);
    v50$2 := (if p3$2 then _HAVOC_bv8$2 else v50$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v51$1 := (if p3$1 then _HAVOC_bv8$1 else v51$1);
    v51$2 := (if p3$2 then _HAVOC_bv8$2 else v51$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v52$1 := (if p3$1 then _HAVOC_bv8$1 else v52$1);
    v52$2 := (if p3$2 then _HAVOC_bv8$2 else v52$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v53$1 := (if p3$1 then _HAVOC_bv8$1 else v53$1);
    v53$2 := (if p3$2 then _HAVOC_bv8$2 else v53$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v54$1 := (if p3$1 then _HAVOC_bv8$1 else v54$1);
    v54$2 := (if p3$2 then _HAVOC_bv8$2 else v54$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v55$1 := (if p3$1 then _HAVOC_bv8$1 else v55$1);
    v55$2 := (if p3$2 then _HAVOC_bv8$2 else v55$2);
    v56$1 := (if p3$1 then UI8_TO_FP32(v52$1) else v56$1);
    v56$2 := (if p3$2 then UI8_TO_FP32(v52$2) else v56$2);
    v57$1 := (if p3$1 then UI8_TO_FP32(v53$1) else v57$1);
    v57$2 := (if p3$2 then UI8_TO_FP32(v53$2) else v57$2);
    v58$1 := (if p3$1 then UI8_TO_FP32(v54$1) else v58$1);
    v58$2 := (if p3$2 then UI8_TO_FP32(v54$2) else v58$2);
    v59$1 := (if p3$1 then UI8_TO_FP32(v55$1) else v59$1);
    v59$2 := (if p3$2 then UI8_TO_FP32(v55$2) else v59$2);
    v60$1 := (if p3$1 then FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(1073741824bv32, UI8_TO_FP32(v16$1)), v12$1), v24$1), v44$1), FMUL32(1073741824bv32, UI8_TO_FP32(v48$1))), v56$1) else v60$1);
    v60$2 := (if p3$2 then FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(1073741824bv32, UI8_TO_FP32(v16$2)), v12$2), v24$2), v44$2), FMUL32(1073741824bv32, UI8_TO_FP32(v48$2))), v56$2) else v60$2);
    v61$1 := (if p3$1 then FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(1073741824bv32, UI8_TO_FP32(v17$1)), v13$1), v25$1), v45$1), FMUL32(1073741824bv32, UI8_TO_FP32(v49$1))), v57$1) else v61$1);
    v61$2 := (if p3$2 then FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(1073741824bv32, UI8_TO_FP32(v17$2)), v13$2), v25$2), v45$2), FMUL32(1073741824bv32, UI8_TO_FP32(v49$2))), v57$2) else v61$2);
    v62$1 := (if p3$1 then FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(1073741824bv32, UI8_TO_FP32(v18$1)), v14$1), v26$1), v46$1), FMUL32(1073741824bv32, UI8_TO_FP32(v50$1))), v58$1) else v62$1);
    v62$2 := (if p3$2 then FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(1073741824bv32, UI8_TO_FP32(v18$2)), v14$2), v26$2), v46$2), FMUL32(1073741824bv32, UI8_TO_FP32(v50$2))), v58$2) else v62$2);
    v63$1 := (if p3$1 then FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(1073741824bv32, UI8_TO_FP32(v19$1)), v15$1), v27$1), v47$1), FMUL32(1073741824bv32, UI8_TO_FP32(v51$1))), v59$1) else v63$1);
    v63$2 := (if p3$2 then FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(1073741824bv32, UI8_TO_FP32(v19$2)), v15$2), v27$2), v47$2), FMUL32(1073741824bv32, UI8_TO_FP32(v51$2))), v59$2) else v63$2);
    v64$1 := (if p3$1 then FSUB32(FADD32(FSUB32(FADD32(FSUB32(v12$1, v24$1), FMUL32(1073741824bv32, UI8_TO_FP32(v28$1))), FMUL32(1073741824bv32, UI8_TO_FP32(v36$1))), v44$1), v56$1) else v64$1);
    v64$2 := (if p3$2 then FSUB32(FADD32(FSUB32(FADD32(FSUB32(v12$2, v24$2), FMUL32(1073741824bv32, UI8_TO_FP32(v28$2))), FMUL32(1073741824bv32, UI8_TO_FP32(v36$2))), v44$2), v56$2) else v64$2);
    v65$1 := (if p3$1 then FSUB32(FADD32(FSUB32(FADD32(FSUB32(v13$1, v25$1), FMUL32(1073741824bv32, UI8_TO_FP32(v29$1))), FMUL32(1073741824bv32, UI8_TO_FP32(v37$1))), v45$1), v57$1) else v65$1);
    v65$2 := (if p3$2 then FSUB32(FADD32(FSUB32(FADD32(FSUB32(v13$2, v25$2), FMUL32(1073741824bv32, UI8_TO_FP32(v29$2))), FMUL32(1073741824bv32, UI8_TO_FP32(v37$2))), v45$2), v57$2) else v65$2);
    v66$1 := (if p3$1 then FSUB32(FADD32(FSUB32(FADD32(FSUB32(v14$1, v26$1), FMUL32(1073741824bv32, UI8_TO_FP32(v30$1))), FMUL32(1073741824bv32, UI8_TO_FP32(v38$1))), v46$1), v58$1) else v66$1);
    v66$2 := (if p3$2 then FSUB32(FADD32(FSUB32(FADD32(FSUB32(v14$2, v26$2), FMUL32(1073741824bv32, UI8_TO_FP32(v30$2))), FMUL32(1073741824bv32, UI8_TO_FP32(v38$2))), v46$2), v58$2) else v66$2);
    v67$1 := (if p3$1 then FSUB32(FADD32(FSUB32(FADD32(FSUB32(v15$1, v27$1), FMUL32(1073741824bv32, UI8_TO_FP32(v31$1))), FMUL32(1073741824bv32, UI8_TO_FP32(v39$1))), v47$1), v59$1) else v67$1);
    v67$2 := (if p3$2 then FSUB32(FADD32(FSUB32(FADD32(FSUB32(v15$2, v27$2), FMUL32(1073741824bv32, UI8_TO_FP32(v31$2))), FMUL32(1073741824bv32, UI8_TO_FP32(v39$2))), v47$2), v59$2) else v67$2);
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$outputImage(p3$1, BV32_MUL(v3$1, 4bv32), FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v60$1, v60$1), FMUL32(v64$1, v64$1))), 1073741824bv32)), $$outputImage[BV32_MUL(v3$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p3$2, BV32_MUL(v3$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$outputImage(p3$2, BV32_MUL(v3$2, 4bv32), FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v60$2, v60$2), FMUL32(v64$2, v64$2))), 1073741824bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_MUL(v3$1, 4bv32)] := (if p3$1 then FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v60$1, v60$1), FMUL32(v64$1, v64$1))), 1073741824bv32)) else $$outputImage[BV32_MUL(v3$1, 4bv32)]);
    $$outputImage[BV32_MUL(v3$2, 4bv32)] := (if p3$2 then FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v60$2, v60$2), FMUL32(v64$2, v64$2))), 1073741824bv32)) else $$outputImage[BV32_MUL(v3$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$outputImage(p3$1, BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32), FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v61$1, v61$1), FMUL32(v65$1, v65$1))), 1073741824bv32)), $$outputImage[BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p3$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$outputImage(p3$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32), FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v61$2, v61$2), FMUL32(v65$2, v65$2))), 1073741824bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32)] := (if p3$1 then FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v61$1, v61$1), FMUL32(v65$1, v65$1))), 1073741824bv32)) else $$outputImage[BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32)] := (if p3$2 then FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v61$2, v61$2), FMUL32(v65$2, v65$2))), 1073741824bv32)) else $$outputImage[BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 43} _LOG_WRITE_$$outputImage(p3$1, BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32), FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v62$1, v62$1), FMUL32(v66$1, v66$1))), 1073741824bv32)), $$outputImage[BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p3$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 43} _CHECK_WRITE_$$outputImage(p3$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32), FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v62$2, v62$2), FMUL32(v66$2, v66$2))), 1073741824bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32)] := (if p3$1 then FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v62$1, v62$1), FMUL32(v66$1, v66$1))), 1073741824bv32)) else $$outputImage[BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32)] := (if p3$2 then FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v62$2, v62$2), FMUL32(v66$2, v66$2))), 1073741824bv32)) else $$outputImage[BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$outputImage(p3$1, BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32), FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v63$1, v63$1), FMUL32(v67$1, v67$1))), 1073741824bv32)), $$outputImage[BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p3$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$outputImage(p3$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32), FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v63$2, v63$2), FMUL32(v67$2, v67$2))), 1073741824bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32)] := (if p3$1 then FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v63$1, v63$1), FMUL32(v67$1, v67$1))), 1073741824bv32)) else $$outputImage[BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32)] := (if p3$2 then FP32_TO_UI8(FDIV32(FSQRT32(FADD32(FMUL32(v63$2, v63$2), FMUL32(v67$2, v67$2))), 1073741824bv32)) else $$outputImage[BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32)]);
    return;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 512bv32 then 1bv1 else 0bv1) != 0bv1;

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



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
