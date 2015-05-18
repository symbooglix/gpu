type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$seedArray"} {:global} {:elem_width 32} {:source_name "seedArray"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$seedArray: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$seedArray: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$seedArray: bool;

var {:source_name "gaussianRand"} {:global} $$gaussianRand: [bv32]bv32;

axiom {:array_info "$$gaussianRand"} {:global} {:elem_width 32} {:source_name "gaussianRand"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$gaussianRand: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$gaussianRand: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$gaussianRand: bool;

var {:source_name "temp"} $$temp$1: [bv32]bv32;

var {:source_name "temp"} $$temp$2: [bv32]bv32;

axiom {:array_info "$$temp"} {:elem_width 32} {:source_name "temp"} {:source_elem_width 128} {:source_dimensions "8"} true;

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

function FCOS32(bv32) : bv32;

function FDIV32(bv32, bv32) : bv32;

function FLOG32(bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FSIN32(bv32) : bv32;

function FSQRT32(bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV32_OR(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "bvxor"} BV32_XOR(bv32, bv32) : bv32;

procedure {:source_name "gaussianRand"} {:kernel} $gaussianRand($width: bv32, $mulFactor: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $mulFactor == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$seedArray && !_WRITE_HAS_OCCURRED_$$seedArray && !_ATOMIC_HAS_OCCURRED_$$seedArray;
  requires !_READ_HAS_OCCURRED_$$gaussianRand && !_WRITE_HAS_OCCURRED_$$gaussianRand && !_ATOMIC_HAS_OCCURRED_$$gaussianRand;
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
  modifies _WRITE_HAS_OCCURRED_$$gaussianRand, _WRITE_READ_BENIGN_FLAG_$$gaussianRand, _WRITE_READ_BENIGN_FLAG_$$gaussianRand;



implementation {:source_name "gaussianRand"} {:kernel} $gaussianRand($width: bv32, $mulFactor: bv32)
{
  var $r1.0$1: bv128;
  var $r1.0$2: bv128;
  var $r2.0$1: bv128;
  var $r2.0$2: bv128;
  var $a.0$1: bv128;
  var $a.0$2: bv128;
  var $b.0$1: bv128;
  var $b.0$2: bv128;
  var $i.0: bv32;
  var $r1.1$1: bv128;
  var $r1.1$2: bv128;
  var $r2.1$1: bv128;
  var $r2.1$2: bv128;
  var $a.1$1: bv128;
  var $a.1$2: bv128;
  var $b.1$1: bv128;
  var $b.1$2: bv128;
  var $i.1: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v72$1: bv32;
  var v72$2: bv32;
  var v73$1: bv32;
  var v73$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv128;
  var v6$2: bv128;
  var v8$1: bv32;
  var v8$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv128;
  var v11$2: bv128;
  var v22$1: bv128;
  var v22$2: bv128;
  var v13$1: bv32;
  var v13$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv128;
  var v16$2: bv128;
  var v18$1: bv32;
  var v18$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv128;
  var v21$2: bv128;
  var v23: bool;
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
  var v88$1: bv32;
  var v88$2: bv32;
  var v89$1: bv32;
  var v89$2: bv32;
  var v90$1: bv32;
  var v90$2: bv32;
  var v91$1: bv32;
  var v91$2: bv32;
  var v92$1: bv32;
  var v92$2: bv32;
  var v93: bool;
  var v94$1: bv32;
  var v94$2: bv32;
  var v95$1: bv32;
  var v95$2: bv32;
  var v96$1: bv32;
  var v96$2: bv32;
  var v97$1: bv32;
  var v97$2: bv32;
  var v101$1: bv32;
  var v101$2: bv32;
  var v98$1: bv32;
  var v98$2: bv32;
  var v99$1: bv32;
  var v99$2: bv32;
  var v100$1: bv32;
  var v100$2: bv32;
  var v102$1: bv32;
  var v102$2: bv32;
  var v103$1: bv32;
  var v103$2: bv32;
  var v104$1: bv32;
  var v104$2: bv32;
  var v105$1: bv32;
  var v105$2: bv32;
  var v107$1: bv32;
  var v107$2: bv32;
  var v106$1: bv32;
  var v106$2: bv32;
  var v108$1: bv32;
  var v108$2: bv32;
  var v109$1: bv32;
  var v109$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    havoc v2$1, v2$2;
    havoc v3$1, v3$2;
    havoc v4$1, v4$2;
    havoc v5$1, v5$2;
    v6$1 := v5$1 ++ v4$1 ++ v3$1 ++ v2$1;
    v6$2 := v5$2 ++ v4$2 ++ v3$2 ++ v2$2;
    v7$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v2$1, BV32_LSHR(v2$1, 30bv32))), 1bv32);
    v7$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v2$2, BV32_LSHR(v2$2, 30bv32))), 1bv32);
    v8$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v3$1, BV32_LSHR(v3$1, 30bv32))), 1bv32);
    v8$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v3$2, BV32_LSHR(v3$2, 30bv32))), 1bv32);
    v9$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v4$1, BV32_LSHR(v4$1, 30bv32))), 1bv32);
    v9$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v4$2, BV32_LSHR(v4$2, 30bv32))), 1bv32);
    v10$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v5$1, BV32_LSHR(v5$1, 30bv32))), 1bv32);
    v10$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v5$2, BV32_LSHR(v5$2, 30bv32))), 1bv32);
    v11$1 := v10$1 ++ v9$1 ++ v8$1 ++ v7$1;
    v11$2 := v10$2 ++ v9$2 ++ v8$2 ++ v7$2;
    v12$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v7$1, BV32_LSHR(v7$1, 30bv32))), 2bv32);
    v12$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v7$2, BV32_LSHR(v7$2, 30bv32))), 2bv32);
    v13$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v8$1, BV32_LSHR(v8$1, 30bv32))), 2bv32);
    v13$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v8$2, BV32_LSHR(v8$2, 30bv32))), 2bv32);
    v14$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v9$1, BV32_LSHR(v9$1, 30bv32))), 2bv32);
    v14$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v9$2, BV32_LSHR(v9$2, 30bv32))), 2bv32);
    v15$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v10$1, BV32_LSHR(v10$1, 30bv32))), 2bv32);
    v15$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v10$2, BV32_LSHR(v10$2, 30bv32))), 2bv32);
    v16$1 := v15$1 ++ v14$1 ++ v13$1 ++ v12$1;
    v16$2 := v15$2 ++ v14$2 ++ v13$2 ++ v12$2;
    v17$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v12$1, BV32_LSHR(v12$1, 30bv32))), 3bv32);
    v17$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v12$2, BV32_LSHR(v12$2, 30bv32))), 3bv32);
    v18$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v13$1, BV32_LSHR(v13$1, 30bv32))), 3bv32);
    v18$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v13$2, BV32_LSHR(v13$2, 30bv32))), 3bv32);
    v19$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v14$1, BV32_LSHR(v14$1, 30bv32))), 3bv32);
    v19$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v14$2, BV32_LSHR(v14$2, 30bv32))), 3bv32);
    v20$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v15$1, BV32_LSHR(v15$1, 30bv32))), 3bv32);
    v20$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v15$2, BV32_LSHR(v15$2, 30bv32))), 3bv32);
    v21$1 := v20$1 ++ v19$1 ++ v18$1 ++ v17$1;
    v21$2 := v20$2 ++ v19$2 ++ v18$2 ++ v17$2;
    v22$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v20$1, BV32_LSHR(v20$1, 30bv32))), 4bv32) ++ BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v19$1, BV32_LSHR(v19$1, 30bv32))), 4bv32) ++ BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v18$1, BV32_LSHR(v18$1, 30bv32))), 4bv32) ++ BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v17$1, BV32_LSHR(v17$1, 30bv32))), 4bv32);
    v22$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v20$2, BV32_LSHR(v20$2, 30bv32))), 4bv32) ++ BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v19$2, BV32_LSHR(v19$2, 30bv32))), 4bv32) ++ BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v18$2, BV32_LSHR(v18$2, 30bv32))), 4bv32) ++ BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v17$2, BV32_LSHR(v17$2, 30bv32))), 4bv32);
    $r1.0$1, $r2.0$1, $a.0$1, $b.0$1, $i.0 := 0bv128, 0bv128, 0bv128, 0bv128, 0bv32;
    $r1.0$2, $r2.0$2, $a.0$2, $b.0$2 := 0bv128, 0bv128, 0bv128, 0bv128;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_1"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 7} true;
    v23 := BV32_ULT($i.0, $mulFactor);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v23 && !v23;
    v92$1 := BV32_MUL(BV32_ADD(BV32_MUL(v1$1, $width), v0$1), $mulFactor);
    v92$2 := BV32_MUL(BV32_ADD(BV32_MUL(v1$2, $width), v0$2), $mulFactor);
    $i.1 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $15;

  $15:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b4 ==> _WRITE_HAS_OCCURRED_$$gaussianRand ==> BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), BV32_MUL(BV32_ADD(BV32_MUL(0bv32, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $mulFactor)), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(0bv32, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $mulFactor)), 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(0bv32, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $mulFactor)), 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(0bv32, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $mulFactor)), 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(0bv32, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $mulFactor)), 1bv32), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(0bv32, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $mulFactor)), 1bv32), 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(0bv32, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $mulFactor)), 1bv32), 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 2bv32), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(0bv32, 2bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $mulFactor)), 1bv32), 4bv32), 3bv32));
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_UGE($i.1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_UGE($i.1, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_ULE($i.1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_ULE($i.1, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SGE($i.1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SGE($i.1, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b0 ==> BV32_SLE($i.1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b0 ==> BV32_SLE($i.1, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 105} true;
    v93 := BV32_ULT($i.1, BV32_UDIV($mulFactor, 2bv32));
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v93 && !v93;
    return;

  $truebb0:
    assume {:partition} v93 && v93;
    v94$1 := $$temp$1[BV32_MUL($i.1, 4bv32)];
    v94$2 := $$temp$2[BV32_MUL($i.1, 4bv32)];
    v95$1 := $$temp$1[BV32_ADD(BV32_MUL($i.1, 4bv32), 1bv32)];
    v95$2 := $$temp$2[BV32_ADD(BV32_MUL($i.1, 4bv32), 1bv32)];
    v96$1 := $$temp$1[BV32_ADD(BV32_MUL($i.1, 4bv32), 2bv32)];
    v96$2 := $$temp$2[BV32_ADD(BV32_MUL($i.1, 4bv32), 2bv32)];
    v97$1 := $$temp$1[BV32_ADD(BV32_MUL($i.1, 4bv32), 3bv32)];
    v97$2 := $$temp$2[BV32_ADD(BV32_MUL($i.1, 4bv32), 3bv32)];
    v98$1 := $$temp$1[BV32_MUL(BV32_ADD($i.1, 1bv32), 4bv32)];
    v98$2 := $$temp$2[BV32_MUL(BV32_ADD($i.1, 1bv32), 4bv32)];
    v99$1 := $$temp$1[BV32_ADD(BV32_MUL(BV32_ADD($i.1, 1bv32), 4bv32), 1bv32)];
    v99$2 := $$temp$2[BV32_ADD(BV32_MUL(BV32_ADD($i.1, 1bv32), 4bv32), 1bv32)];
    v100$1 := $$temp$1[BV32_ADD(BV32_MUL(BV32_ADD($i.1, 1bv32), 4bv32), 2bv32)];
    v100$2 := $$temp$2[BV32_ADD(BV32_MUL(BV32_ADD($i.1, 1bv32), 4bv32), 2bv32)];
    v101$1 := $$temp$1[BV32_ADD(BV32_MUL(BV32_ADD($i.1, 1bv32), 4bv32), 3bv32)];
    v101$2 := $$temp$2[BV32_ADD(BV32_MUL(BV32_ADD($i.1, 1bv32), 4bv32), 3bv32)];
    v102$1 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(FMUL32(UI32_TO_FP32(v94$1), 1065353216bv32), 1333788672bv32)), 1060205080bv32)));
    v102$2 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(FMUL32(UI32_TO_FP32(v94$2), 1065353216bv32), 1333788672bv32)), 1060205080bv32)));
    v103$1 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(FMUL32(UI32_TO_FP32(v95$1), 1065353216bv32), 1333788672bv32)), 1060205080bv32)));
    v103$2 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(FMUL32(UI32_TO_FP32(v95$2), 1065353216bv32), 1333788672bv32)), 1060205080bv32)));
    v104$1 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(FMUL32(UI32_TO_FP32(v96$1), 1065353216bv32), 1333788672bv32)), 1060205080bv32)));
    v104$2 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(FMUL32(UI32_TO_FP32(v96$2), 1065353216bv32), 1333788672bv32)), 1060205080bv32)));
    v105$1 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(FMUL32(UI32_TO_FP32(v97$1), 1065353216bv32), 1333788672bv32)), 1060205080bv32)));
    v105$2 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(FMUL32(UI32_TO_FP32(v97$2), 1065353216bv32), 1333788672bv32)), 1060205080bv32)));
    v106$1 := FMUL32(1086918619bv32, FDIV32(FMUL32(UI32_TO_FP32(v98$1), 1065353216bv32), 1333788672bv32));
    v106$2 := FMUL32(1086918619bv32, FDIV32(FMUL32(UI32_TO_FP32(v98$2), 1065353216bv32), 1333788672bv32));
    v107$1 := FMUL32(1086918619bv32, FDIV32(FMUL32(UI32_TO_FP32(v99$1), 1065353216bv32), 1333788672bv32));
    v107$2 := FMUL32(1086918619bv32, FDIV32(FMUL32(UI32_TO_FP32(v99$2), 1065353216bv32), 1333788672bv32));
    v108$1 := FMUL32(1086918619bv32, FDIV32(FMUL32(UI32_TO_FP32(v100$1), 1065353216bv32), 1333788672bv32));
    v108$2 := FMUL32(1086918619bv32, FDIV32(FMUL32(UI32_TO_FP32(v100$2), 1065353216bv32), 1333788672bv32));
    v109$1 := FMUL32(1086918619bv32, FDIV32(FMUL32(UI32_TO_FP32(v101$1), 1065353216bv32), 1333788672bv32));
    v109$2 := FMUL32(1086918619bv32, FDIV32(FMUL32(UI32_TO_FP32(v101$2), 1065353216bv32), 1333788672bv32));
    call {:sourceloc} {:sourceloc_num 115} _LOG_WRITE_$$gaussianRand(true, BV32_MUL(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 4bv32), FMUL32(v102$1, FCOS32(v106$1)), $$gaussianRand[BV32_MUL(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gaussianRand(true, BV32_MUL(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 115} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 115} _CHECK_WRITE_$$gaussianRand(true, BV32_MUL(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 4bv32), FMUL32(v102$2, FCOS32(v106$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gaussianRand"} true;
    $$gaussianRand[BV32_MUL(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 4bv32)] := FMUL32(v102$1, FCOS32(v106$1));
    $$gaussianRand[BV32_MUL(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 4bv32)] := FMUL32(v102$2, FCOS32(v106$2));
    call {:sourceloc} {:sourceloc_num 116} _LOG_WRITE_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 4bv32), 1bv32), FMUL32(v103$1, FCOS32(v107$1)), $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 116} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 116} _CHECK_WRITE_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 4bv32), 1bv32), FMUL32(v103$2, FCOS32(v107$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gaussianRand"} true;
    $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 4bv32), 1bv32)] := FMUL32(v103$1, FCOS32(v107$1));
    $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 4bv32), 1bv32)] := FMUL32(v103$2, FCOS32(v107$2));
    call {:sourceloc} {:sourceloc_num 117} _LOG_WRITE_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 4bv32), 2bv32), FMUL32(v104$1, FCOS32(v108$1)), $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 117} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 117} _CHECK_WRITE_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 4bv32), 2bv32), FMUL32(v104$2, FCOS32(v108$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gaussianRand"} true;
    $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 4bv32), 2bv32)] := FMUL32(v104$1, FCOS32(v108$1));
    $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 4bv32), 2bv32)] := FMUL32(v104$2, FCOS32(v108$2));
    call {:sourceloc} {:sourceloc_num 118} _LOG_WRITE_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 4bv32), 3bv32), FMUL32(v105$1, FCOS32(v109$1)), $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 118} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 118} _CHECK_WRITE_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 4bv32), 3bv32), FMUL32(v105$2, FCOS32(v109$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gaussianRand"} true;
    $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 4bv32), 3bv32)] := FMUL32(v105$1, FCOS32(v109$1));
    $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 4bv32), 3bv32)] := FMUL32(v105$2, FCOS32(v109$2));
    call {:sourceloc} {:sourceloc_num 119} _LOG_WRITE_$$gaussianRand(true, BV32_MUL(BV32_ADD(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), FMUL32(v102$1, FSIN32(v106$1)), $$gaussianRand[BV32_MUL(BV32_ADD(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gaussianRand(true, BV32_MUL(BV32_ADD(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 119} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 119} _CHECK_WRITE_$$gaussianRand(true, BV32_MUL(BV32_ADD(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), FMUL32(v102$2, FSIN32(v106$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gaussianRand"} true;
    $$gaussianRand[BV32_MUL(BV32_ADD(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32)] := FMUL32(v102$1, FSIN32(v106$1));
    $$gaussianRand[BV32_MUL(BV32_ADD(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32)] := FMUL32(v102$2, FSIN32(v106$2));
    call {:sourceloc} {:sourceloc_num 120} _LOG_WRITE_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 1bv32), FMUL32(v103$1, FSIN32(v107$1)), $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 120} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 120} _CHECK_WRITE_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 1bv32), FMUL32(v103$2, FSIN32(v107$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gaussianRand"} true;
    $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 1bv32)] := FMUL32(v103$1, FSIN32(v107$1));
    $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 1bv32)] := FMUL32(v103$2, FSIN32(v107$2));
    call {:sourceloc} {:sourceloc_num 121} _LOG_WRITE_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 2bv32), FMUL32(v104$1, FSIN32(v108$1)), $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 121} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 121} _CHECK_WRITE_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 2bv32), FMUL32(v104$2, FSIN32(v108$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gaussianRand"} true;
    $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 2bv32)] := FMUL32(v104$1, FSIN32(v108$1));
    $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 2bv32)] := FMUL32(v104$2, FSIN32(v108$2));
    call {:sourceloc} {:sourceloc_num 122} _LOG_WRITE_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 3bv32), FMUL32(v105$1, FSIN32(v109$1)), $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 122} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 122} _CHECK_WRITE_$$gaussianRand(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 3bv32), FMUL32(v105$2, FSIN32(v109$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gaussianRand"} true;
    $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$1, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 3bv32)] := FMUL32(v105$1, FSIN32(v109$1));
    $$gaussianRand[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v92$2, BV32_MUL($i.1, 2bv32)), 1bv32), 4bv32), 3bv32)] := FMUL32(v105$2, FSIN32(v109$2));
    $i.1 := BV32_ADD($i.1, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $15;

  $truebb:
    assume {:partition} v23 && v23;
    goto $casebb, $casebb0, $casebb1, $casebb2, $casebb3, $casebb4, $casebb5, $casebb6, $defaultbb;

  $defaultbb:
    assume {:partition} $i.0 != 0bv32 && $i.0 != 1bv32 && $i.0 != 2bv32 && $i.0 != 3bv32 && $i.0 != 4bv32 && $i.0 != 5bv32 && $i.0 != 6bv32 && $i.0 != 7bv32 && $i.0 != 0bv32 && $i.0 != 1bv32 && $i.0 != 2bv32 && $i.0 != 3bv32 && $i.0 != 4bv32 && $i.0 != 5bv32 && $i.0 != 6bv32 && $i.0 != 7bv32;
    $r1.1$1, $r2.1$1, $a.1$1, $b.1$1 := $r1.0$1, $r2.0$1, $a.0$1, $b.0$1;
    $r1.1$2, $r2.1$2, $a.1$2, $b.1$2 := $r1.0$2, $r2.0$2, $a.0$2, $b.0$2;
    goto $12;

  $12:
    v76$1 := $$temp$1[BV32_MUL($i.0, 4bv32)];
    v76$2 := $$temp$2[BV32_MUL($i.0, 4bv32)];
    v77$1 := $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)];
    v77$2 := $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)];
    v78$1 := $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)];
    v78$2 := $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)];
    v79$1 := $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)];
    v79$2 := $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)];
    $$temp$1[BV32_MUL($i.0, 4bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.1$1[32:0], BV32_SHL($a.1$1[32:0], 24bv32)), BV32_AND(BV32_LSHR($b.1$1[32:0], 13bv32), 4261361663bv32)), BV32_OR(BV32_LSHR($r1.1$1[32:0], 24bv32), BV32_SHL($r1.1$1[64:32], 8bv32))), BV32_SHL($r2.1$1[32:0], 15bv32));
    $$temp$2[BV32_MUL($i.0, 4bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.1$2[32:0], BV32_SHL($a.1$2[32:0], 24bv32)), BV32_AND(BV32_LSHR($b.1$2[32:0], 13bv32), 4261361663bv32)), BV32_OR(BV32_LSHR($r1.1$2[32:0], 24bv32), BV32_SHL($r1.1$2[64:32], 8bv32))), BV32_SHL($r2.1$2[32:0], 15bv32));
    $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)] := v77$1;
    $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)] := v77$2;
    $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)] := v78$1;
    $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)] := v78$2;
    $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)] := v79$1;
    $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)] := v79$2;
    v80$1 := $$temp$1[BV32_MUL($i.0, 4bv32)];
    v80$2 := $$temp$2[BV32_MUL($i.0, 4bv32)];
    v81$1 := $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)];
    v81$2 := $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)];
    v82$1 := $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)];
    v82$2 := $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)];
    v83$1 := $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)];
    v83$2 := $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)];
    $$temp$1[BV32_MUL($i.0, 4bv32)] := v80$1;
    $$temp$2[BV32_MUL($i.0, 4bv32)] := v80$2;
    $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.1$1[64:32], BV32_OR(BV32_SHL($a.1$1[64:32], 24bv32), BV32_LSHR($a.1$1[32:0], 8bv32))), BV32_AND(BV32_LSHR($b.1$1[64:32], 13bv32), 4018093949bv32)), BV32_OR(BV32_LSHR($r1.1$1[64:32], 24bv32), BV32_SHL($r1.1$1[96:64], 8bv32))), BV32_SHL($r2.1$1[64:32], 15bv32));
    $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.1$2[64:32], BV32_OR(BV32_SHL($a.1$2[64:32], 24bv32), BV32_LSHR($a.1$2[32:0], 8bv32))), BV32_AND(BV32_LSHR($b.1$2[64:32], 13bv32), 4018093949bv32)), BV32_OR(BV32_LSHR($r1.1$2[64:32], 24bv32), BV32_SHL($r1.1$2[96:64], 8bv32))), BV32_SHL($r2.1$2[64:32], 15bv32));
    $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)] := v82$1;
    $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)] := v82$2;
    $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)] := v83$1;
    $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)] := v83$2;
    v84$1 := $$temp$1[BV32_MUL($i.0, 4bv32)];
    v84$2 := $$temp$2[BV32_MUL($i.0, 4bv32)];
    v85$1 := $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)];
    v85$2 := $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)];
    v86$1 := $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)];
    v86$2 := $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)];
    v87$1 := $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)];
    v87$2 := $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)];
    $$temp$1[BV32_MUL($i.0, 4bv32)] := v84$1;
    $$temp$2[BV32_MUL($i.0, 4bv32)] := v84$2;
    $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)] := v85$1;
    $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)] := v85$2;
    $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.1$1[96:64], BV32_OR(BV32_SHL($a.1$1[96:64], 24bv32), BV32_LSHR($a.1$1[64:32], 8bv32))), BV32_AND(BV32_LSHR($b.1$1[96:64], 13bv32), 4286020477bv32)), BV32_OR(BV32_LSHR($r1.1$1[96:64], 24bv32), BV32_SHL($r1.1$1[128:96], 8bv32))), BV32_SHL($r2.1$1[96:64], 15bv32));
    $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.1$2[96:64], BV32_OR(BV32_SHL($a.1$2[96:64], 24bv32), BV32_LSHR($a.1$2[64:32], 8bv32))), BV32_AND(BV32_LSHR($b.1$2[96:64], 13bv32), 4286020477bv32)), BV32_OR(BV32_LSHR($r1.1$2[96:64], 24bv32), BV32_SHL($r1.1$2[128:96], 8bv32))), BV32_SHL($r2.1$2[96:64], 15bv32));
    $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)] := v87$1;
    $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)] := v87$2;
    v88$1 := $$temp$1[BV32_MUL($i.0, 4bv32)];
    v88$2 := $$temp$2[BV32_MUL($i.0, 4bv32)];
    v89$1 := $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)];
    v89$2 := $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)];
    v90$1 := $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)];
    v90$2 := $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)];
    v91$1 := $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)];
    v91$2 := $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)];
    $$temp$1[BV32_MUL($i.0, 4bv32)] := v88$1;
    $$temp$2[BV32_MUL($i.0, 4bv32)] := v88$2;
    $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)] := v89$1;
    $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 1bv32)] := v89$2;
    $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)] := v90$1;
    $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 2bv32)] := v90$2;
    $$temp$1[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.1$1[128:96], BV32_OR(BV32_SHL($a.1$1[128:96], 24bv32), BV32_LSHR($a.1$1[96:64], 8bv32))), BV32_AND(BV32_LSHR($b.1$1[128:96], 13bv32), 2146958127bv32)), BV32_LSHR($r1.1$1[128:96], 24bv32)), BV32_SHL($r2.1$1[128:96], 15bv32));
    $$temp$2[BV32_ADD(BV32_MUL($i.0, 4bv32), 3bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.1$2[128:96], BV32_OR(BV32_SHL($a.1$2[128:96], 24bv32), BV32_LSHR($a.1$2[96:64], 8bv32))), BV32_AND(BV32_LSHR($b.1$2[128:96], 13bv32), 2146958127bv32)), BV32_LSHR($r1.1$2[128:96], 24bv32)), BV32_SHL($r2.1$2[128:96], 15bv32));
    $r1.0$1, $r2.0$1, $a.0$1, $b.0$1, $i.0 := $r1.1$1, $r2.1$1, $a.1$1, $b.1$1, BV32_ADD($i.0, 1bv32);
    $r1.0$2, $r2.0$2, $a.0$2, $b.0$2 := $r1.1$2, $r2.1$2, $a.1$2, $b.1$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $1;

  $casebb6:
    assume {:partition} $i.0 == 7bv32 && $i.0 == 7bv32;
    v64$1 := $$temp$1[24bv32];
    v64$2 := $$temp$2[24bv32];
    v65$1 := $$temp$1[25bv32];
    v65$2 := $$temp$2[25bv32];
    v66$1 := $$temp$1[26bv32];
    v66$2 := $$temp$2[26bv32];
    v67$1 := $$temp$1[27bv32];
    v67$2 := $$temp$2[27bv32];
    v68$1 := $$temp$1[8bv32];
    v68$2 := $$temp$2[8bv32];
    v69$1 := $$temp$1[9bv32];
    v69$2 := $$temp$2[9bv32];
    v70$1 := $$temp$1[10bv32];
    v70$2 := $$temp$2[10bv32];
    v71$1 := $$temp$1[11bv32];
    v71$2 := $$temp$2[11bv32];
    v72$1 := $$temp$1[16bv32];
    v72$2 := $$temp$2[16bv32];
    v73$1 := $$temp$1[17bv32];
    v73$2 := $$temp$2[17bv32];
    v74$1 := $$temp$1[18bv32];
    v74$2 := $$temp$2[18bv32];
    v75$1 := $$temp$1[19bv32];
    v75$2 := $$temp$2[19bv32];
    $r1.1$1, $r2.1$1, $a.1$1, $b.1$1 := $r2.0$1, v67$1 ++ v66$1 ++ v65$1 ++ v64$1, v71$1 ++ v70$1 ++ v69$1 ++ v68$1, v75$1 ++ v74$1 ++ v73$1 ++ v72$1;
    $r1.1$2, $r2.1$2, $a.1$2, $b.1$2 := $r2.0$2, v67$2 ++ v66$2 ++ v65$2 ++ v64$2, v71$2 ++ v70$2 ++ v69$2 ++ v68$2, v75$2 ++ v74$2 ++ v73$2 ++ v72$2;
    goto $12;

  $casebb5:
    assume {:partition} $i.0 == 6bv32 && $i.0 == 6bv32;
    v52$1 := $$temp$1[20bv32];
    v52$2 := $$temp$2[20bv32];
    v53$1 := $$temp$1[21bv32];
    v53$2 := $$temp$2[21bv32];
    v54$1 := $$temp$1[22bv32];
    v54$2 := $$temp$2[22bv32];
    v55$1 := $$temp$1[23bv32];
    v55$2 := $$temp$2[23bv32];
    v56$1 := $$temp$1[4bv32];
    v56$2 := $$temp$2[4bv32];
    v57$1 := $$temp$1[5bv32];
    v57$2 := $$temp$2[5bv32];
    v58$1 := $$temp$1[6bv32];
    v58$2 := $$temp$2[6bv32];
    v59$1 := $$temp$1[7bv32];
    v59$2 := $$temp$2[7bv32];
    v60$1 := $$temp$1[12bv32];
    v60$2 := $$temp$2[12bv32];
    v61$1 := $$temp$1[13bv32];
    v61$2 := $$temp$2[13bv32];
    v62$1 := $$temp$1[14bv32];
    v62$2 := $$temp$2[14bv32];
    v63$1 := $$temp$1[15bv32];
    v63$2 := $$temp$2[15bv32];
    $r1.1$1, $r2.1$1, $a.1$1, $b.1$1 := $r2.0$1, v55$1 ++ v54$1 ++ v53$1 ++ v52$1, v59$1 ++ v58$1 ++ v57$1 ++ v56$1, v63$1 ++ v62$1 ++ v61$1 ++ v60$1;
    $r1.1$2, $r2.1$2, $a.1$2, $b.1$2 := $r2.0$2, v55$2 ++ v54$2 ++ v53$2 ++ v52$2, v59$2 ++ v58$2 ++ v57$2 ++ v56$2, v63$2 ++ v62$2 ++ v61$2 ++ v60$2;
    goto $12;

  $casebb4:
    assume {:partition} $i.0 == 5bv32 && $i.0 == 5bv32;
    v40$1 := $$temp$1[16bv32];
    v40$2 := $$temp$2[16bv32];
    v41$1 := $$temp$1[17bv32];
    v41$2 := $$temp$2[17bv32];
    v42$1 := $$temp$1[18bv32];
    v42$2 := $$temp$2[18bv32];
    v43$1 := $$temp$1[19bv32];
    v43$2 := $$temp$2[19bv32];
    v44$1 := $$temp$1[0bv32];
    v44$2 := $$temp$2[0bv32];
    v45$1 := $$temp$1[1bv32];
    v45$2 := $$temp$2[1bv32];
    v46$1 := $$temp$1[2bv32];
    v46$2 := $$temp$2[2bv32];
    v47$1 := $$temp$1[3bv32];
    v47$2 := $$temp$2[3bv32];
    v48$1 := $$temp$1[8bv32];
    v48$2 := $$temp$2[8bv32];
    v49$1 := $$temp$1[9bv32];
    v49$2 := $$temp$2[9bv32];
    v50$1 := $$temp$1[10bv32];
    v50$2 := $$temp$2[10bv32];
    v51$1 := $$temp$1[11bv32];
    v51$2 := $$temp$2[11bv32];
    $r1.1$1, $r2.1$1, $a.1$1, $b.1$1 := $r2.0$1, v43$1 ++ v42$1 ++ v41$1 ++ v40$1, v47$1 ++ v46$1 ++ v45$1 ++ v44$1, v51$1 ++ v50$1 ++ v49$1 ++ v48$1;
    $r1.1$2, $r2.1$2, $a.1$2, $b.1$2 := $r2.0$2, v43$2 ++ v42$2 ++ v41$2 ++ v40$2, v47$2 ++ v46$2 ++ v45$2 ++ v44$2, v51$2 ++ v50$2 ++ v49$2 ++ v48$2;
    goto $12;

  $casebb3:
    assume {:partition} $i.0 == 4bv32 && $i.0 == 4bv32;
    v36$1 := $$temp$1[12bv32];
    v36$2 := $$temp$2[12bv32];
    v37$1 := $$temp$1[13bv32];
    v37$2 := $$temp$2[13bv32];
    v38$1 := $$temp$1[14bv32];
    v38$2 := $$temp$2[14bv32];
    v39$1 := $$temp$1[15bv32];
    v39$2 := $$temp$2[15bv32];
    $r1.1$1, $r2.1$1, $a.1$1, $b.1$1 := $r2.0$1, v39$1 ++ v38$1 ++ v37$1 ++ v36$1, v22$1, v11$1;
    $r1.1$2, $r2.1$2, $a.1$2, $b.1$2 := $r2.0$2, v39$2 ++ v38$2 ++ v37$2 ++ v36$2, v22$2, v11$2;
    goto $12;

  $casebb2:
    assume {:partition} $i.0 == 3bv32 && $i.0 == 3bv32;
    v32$1 := $$temp$1[8bv32];
    v32$2 := $$temp$2[8bv32];
    v33$1 := $$temp$1[9bv32];
    v33$2 := $$temp$2[9bv32];
    v34$1 := $$temp$1[10bv32];
    v34$2 := $$temp$2[10bv32];
    v35$1 := $$temp$1[11bv32];
    v35$2 := $$temp$2[11bv32];
    $r1.1$1, $r2.1$1, $a.1$1, $b.1$1 := $r2.0$1, v35$1 ++ v34$1 ++ v33$1 ++ v32$1, v21$1, v6$1;
    $r1.1$2, $r2.1$2, $a.1$2, $b.1$2 := $r2.0$2, v35$2 ++ v34$2 ++ v33$2 ++ v32$2, v21$2, v6$2;
    goto $12;

  $casebb1:
    assume {:partition} $i.0 == 2bv32 && $i.0 == 2bv32;
    v28$1 := $$temp$1[4bv32];
    v28$2 := $$temp$2[4bv32];
    v29$1 := $$temp$1[5bv32];
    v29$2 := $$temp$2[5bv32];
    v30$1 := $$temp$1[6bv32];
    v30$2 := $$temp$2[6bv32];
    v31$1 := $$temp$1[7bv32];
    v31$2 := $$temp$2[7bv32];
    $r1.1$1, $r2.1$1, $a.1$1, $b.1$1 := $r2.0$1, v31$1 ++ v30$1 ++ v29$1 ++ v28$1, v16$1, v22$1;
    $r1.1$2, $r2.1$2, $a.1$2, $b.1$2 := $r2.0$2, v31$2 ++ v30$2 ++ v29$2 ++ v28$2, v16$2, v22$2;
    goto $12;

  $casebb0:
    assume {:partition} $i.0 == 1bv32 && $i.0 == 1bv32;
    v24$1 := $$temp$1[0bv32];
    v24$2 := $$temp$2[0bv32];
    v25$1 := $$temp$1[1bv32];
    v25$2 := $$temp$2[1bv32];
    v26$1 := $$temp$1[2bv32];
    v26$2 := $$temp$2[2bv32];
    v27$1 := $$temp$1[3bv32];
    v27$2 := $$temp$2[3bv32];
    $r1.1$1, $r2.1$1, $a.1$1, $b.1$1 := $r2.0$1, v27$1 ++ v26$1 ++ v25$1 ++ v24$1, v11$1, v21$1;
    $r1.1$2, $r2.1$2, $a.1$2, $b.1$2 := $r2.0$2, v27$2 ++ v26$2 ++ v25$2 ++ v24$2, v11$2, v21$2;
    goto $12;

  $casebb:
    assume {:partition} $i.0 == 0bv32 && $i.0 == 0bv32;
    $r1.1$1, $r2.1$1, $a.1$1, $b.1$1 := v21$1, v22$1, v6$1, v16$1;
    $r1.1$2, $r2.1$2, $a.1$2, $b.1$2 := v21$2, v22$2, v6$2, v16$2;
    goto $12;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

const _WATCHED_VALUE_$$seedArray: bv32;

procedure {:inline 1} _LOG_READ_$$seedArray(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$seedArray;



implementation {:inline 1} _LOG_READ_$$seedArray(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$seedArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seedArray == _value then true else _READ_HAS_OCCURRED_$$seedArray);
    return;
}



procedure _CHECK_READ_$$seedArray(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "seedArray"} {:array "$$seedArray"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$seedArray && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$seedArray);
  requires {:source_name "seedArray"} {:array "$$seedArray"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$seedArray && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$seedArray: bool;

procedure {:inline 1} _LOG_WRITE_$$seedArray(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$seedArray, _WRITE_READ_BENIGN_FLAG_$$seedArray;



implementation {:inline 1} _LOG_WRITE_$$seedArray(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$seedArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seedArray == _value then true else _WRITE_HAS_OCCURRED_$$seedArray);
    _WRITE_READ_BENIGN_FLAG_$$seedArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seedArray == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$seedArray);
    return;
}



procedure _CHECK_WRITE_$$seedArray(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "seedArray"} {:array "$$seedArray"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$seedArray && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seedArray != _value);
  requires {:source_name "seedArray"} {:array "$$seedArray"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$seedArray && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seedArray != _value);
  requires {:source_name "seedArray"} {:array "$$seedArray"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$seedArray && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$seedArray(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$seedArray;



implementation {:inline 1} _LOG_ATOMIC_$$seedArray(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$seedArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$seedArray);
    return;
}



procedure _CHECK_ATOMIC_$$seedArray(_P: bool, _offset: bv32);
  requires {:source_name "seedArray"} {:array "$$seedArray"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$seedArray && _WATCHED_OFFSET == _offset);
  requires {:source_name "seedArray"} {:array "$$seedArray"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$seedArray && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$seedArray(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$seedArray;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$seedArray(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$seedArray := (if _P && _WRITE_HAS_OCCURRED_$$seedArray && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$seedArray);
    return;
}



const _WATCHED_VALUE_$$gaussianRand: bv32;

procedure {:inline 1} _LOG_READ_$$gaussianRand(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$gaussianRand;



implementation {:inline 1} _LOG_READ_$$gaussianRand(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$gaussianRand := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gaussianRand == _value then true else _READ_HAS_OCCURRED_$$gaussianRand);
    return;
}



procedure _CHECK_READ_$$gaussianRand(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "gaussianRand"} {:array "$$gaussianRand"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$gaussianRand && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$gaussianRand);
  requires {:source_name "gaussianRand"} {:array "$$gaussianRand"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$gaussianRand && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$gaussianRand: bool;

procedure {:inline 1} _LOG_WRITE_$$gaussianRand(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$gaussianRand, _WRITE_READ_BENIGN_FLAG_$$gaussianRand;



implementation {:inline 1} _LOG_WRITE_$$gaussianRand(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$gaussianRand := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gaussianRand == _value then true else _WRITE_HAS_OCCURRED_$$gaussianRand);
    _WRITE_READ_BENIGN_FLAG_$$gaussianRand := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gaussianRand == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$gaussianRand);
    return;
}



procedure _CHECK_WRITE_$$gaussianRand(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "gaussianRand"} {:array "$$gaussianRand"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$gaussianRand && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gaussianRand != _value);
  requires {:source_name "gaussianRand"} {:array "$$gaussianRand"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$gaussianRand && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gaussianRand != _value);
  requires {:source_name "gaussianRand"} {:array "$$gaussianRand"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$gaussianRand && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$gaussianRand(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$gaussianRand;



implementation {:inline 1} _LOG_ATOMIC_$$gaussianRand(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$gaussianRand := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$gaussianRand);
    return;
}



procedure _CHECK_ATOMIC_$$gaussianRand(_P: bool, _offset: bv32);
  requires {:source_name "gaussianRand"} {:array "$$gaussianRand"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$gaussianRand && _WATCHED_OFFSET == _offset);
  requires {:source_name "gaussianRand"} {:array "$$gaussianRand"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$gaussianRand && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gaussianRand(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$gaussianRand;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gaussianRand(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$gaussianRand := (if _P && _WRITE_HAS_OCCURRED_$$gaussianRand && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$gaussianRand);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

const {:existential true} _b4: bool;
