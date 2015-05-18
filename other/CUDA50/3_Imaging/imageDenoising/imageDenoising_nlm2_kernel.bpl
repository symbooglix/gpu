type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "dst"} {:global} $$dst: [bv32]bv32;

axiom {:array_info "$$dst"} {:global} {:elem_width 32} {:source_name "dst"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$dst: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$dst: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$dst: bool;

axiom {:array_info "$$a.i"} {:elem_width 32} {:source_name "a.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i"} {:elem_width 32} {:source_name "b.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$clr"} {:elem_width 32} {:source_name "clr"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$clrIJ"} {:elem_width 32} {:source_name "clrIJ"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$clr00"} {:elem_width 32} {:source_name "clr00"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$texImage"} {:global} {:elem_width 8} {:source_name "texImage"} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$texImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$texImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$texImage: bool;

var {:source_name "fWeights"} {:group_shared} $$_ZZ4NLM2PjiiffE8fWeights: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ4NLM2PjiiffE8fWeights"} {:group_shared} {:elem_width 32} {:source_name "fWeights"} {:source_elem_width 32} {:source_dimensions "64"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights: bool;

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

function FEQ32(bv32, bv32) : bool;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FP32_TO_SI32(bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV32_OR(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "NLM2"} {:kernel} $_Z4NLM2Pjiiff($imageW: bv32, $imageH: bv32, $Noise: bv32, $lerpC: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $imageW == 320bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $imageH == 408bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$dst && !_WRITE_HAS_OCCURRED_$$dst && !_ATOMIC_HAS_OCCURRED_$$dst;
  requires !_READ_HAS_OCCURRED_$$texImage && !_WRITE_HAS_OCCURRED_$$texImage && !_ATOMIC_HAS_OCCURRED_$$texImage;
  requires !_READ_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights && !_WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights && !_ATOMIC_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights;
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
  modifies $$_ZZ4NLM2PjiiffE8fWeights, _WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights, _WRITE_READ_BENIGN_FLAG_$$_ZZ4NLM2PjiiffE8fWeights, _WRITE_READ_BENIGN_FLAG_$$_ZZ4NLM2PjiiffE8fWeights, $$dst, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights, _WRITE_HAS_OCCURRED_$$dst, _WRITE_READ_BENIGN_FLAG_$$dst, _WRITE_READ_BENIGN_FLAG_$$dst;



implementation {:source_name "NLM2"} {:kernel} $_Z4NLM2Pjiiff($imageW: bv32, $imageH: bv32, $Noise: bv32, $lerpC: bv32)
{
  var $weight.0$1: bv32;
  var $weight.0$2: bv32;
  var $n.0$1: bv32;
  var $n.0$2: bv32;
  var $weight.1$1: bv32;
  var $weight.1$2: bv32;
  var $m.0$1: bv32;
  var $m.0$2: bv32;
  var $fCount.0$1: bv32;
  var $fCount.0$2: bv32;
  var $sumWeights.0$1: bv32;
  var $sumWeights.0$2: bv32;
  var $idx.0$1: bv32;
  var $idx.0$2: bv32;
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $fCount.1$1: bv32;
  var $fCount.1$2: bv32;
  var $sumWeights.1$1: bv32;
  var $sumWeights.1$2: bv32;
  var $idx.1$1: bv32;
  var $idx.1$2: bv32;
  var $j.0$1: bv32;
  var $j.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v66$1: bv32;
  var v66$2: bv32;
  var v67$1: bv32;
  var v67$2: bv32;
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
  var v16$1: bv8;
  var v16$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
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
  var v38$1: bv8;
  var v38$2: bv8;
  var v39$1: bv8;
  var v39$2: bv8;
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
  var v32$1: bv128;
  var v32$2: bv128;
  var v37$1: bv8;
  var v37$2: bv8;
  var v33$1: bv8;
  var v33$2: bv8;
  var v34$1: bv8;
  var v34$2: bv8;
  var v35$1: bv8;
  var v35$2: bv8;
  var v36$1: bv8;
  var v36$2: bv8;
  var v40$1: bv8;
  var v40$2: bv8;
  var v41$1: bv8;
  var v41$2: bv8;
  var v42$1: bv8;
  var v42$2: bv8;
  var v43$1: bv8;
  var v43$2: bv8;
  var v44$1: bv8;
  var v44$2: bv8;
  var v45$1: bv8;
  var v45$2: bv8;
  var v46$1: bv8;
  var v46$2: bv8;
  var v47$1: bv8;
  var v47$2: bv8;
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
  var v56$1: bv8;
  var v56$2: bv8;
  var v65$1: bv32;
  var v65$2: bv32;
  var v57$1: bv128;
  var v57$2: bv128;
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
  var v79$1: bool;
  var v79$2: bool;
  var v80$1: bool;
  var v80$2: bool;
  var v81$1: bv32;
  var v81$2: bv32;
  var v82$1: bv8;
  var v82$2: bv8;
  var v83$1: bv8;
  var v83$2: bv8;
  var v84$1: bv8;
  var v84$2: bv8;
  var v85$1: bv8;
  var v85$2: bv8;
  var v86$1: bv8;
  var v86$2: bv8;
  var v87$1: bv8;
  var v87$2: bv8;
  var v88$1: bv8;
  var v88$2: bv8;
  var v96$1: bv8;
  var v96$2: bv8;
  var v89$1: bv8;
  var v89$2: bv8;
  var v90$1: bv8;
  var v90$2: bv8;
  var v91$1: bv8;
  var v91$2: bv8;
  var v92$1: bv8;
  var v92$2: bv8;
  var v93$1: bv8;
  var v93$2: bv8;
  var v94$1: bv8;
  var v94$2: bv8;
  var v95$1: bv8;
  var v95$2: bv8;
  var v108$1: bv32;
  var v108$2: bv32;
  var v97$1: bv8;
  var v97$2: bv8;
  var v98$1: bv8;
  var v98$2: bv8;
  var v99$1: bv8;
  var v99$2: bv8;
  var v100$1: bv8;
  var v100$2: bv8;
  var v101$1: bv8;
  var v101$2: bv8;
  var v102$1: bv8;
  var v102$2: bv8;
  var v103$1: bv8;
  var v103$2: bv8;
  var v104$1: bv8;
  var v104$2: bv8;
  var v105$1: bv8;
  var v105$2: bv8;
  var v106$1: bv128;
  var v106$2: bv128;
  var v107$1: bv32;
  var v107$2: bv32;
  var v109$1: bv32;
  var v109$2: bv32;
  var v110$1: bv32;
  var v110$2: bv32;
  var v111$1: bv32;
  var v111$2: bv32;
  var v112$1: bv32;
  var v112$2: bv32;
  var v113$1: bv32;
  var v113$2: bv32;
  var v114$1: bv32;
  var v114$2: bv32;
  var v115$1: bv32;
  var v115$2: bv32;
  var v116$1: bv32;
  var v116$2: bv32;
  var v117$1: bool;
  var v117$2: bool;
  var v118$1: bv8;
  var v118$2: bv8;
  var v119$1: bv8;
  var v119$2: bv8;
  var v120$1: bv8;
  var v120$2: bv8;
  var v121$1: bv8;
  var v121$2: bv8;
  var v126$1: bv8;
  var v126$2: bv8;
  var v122$1: bv8;
  var v122$2: bv8;
  var v123$1: bv8;
  var v123$2: bv8;
  var v124$1: bv8;
  var v124$2: bv8;
  var v125$1: bv8;
  var v125$2: bv8;
  var v135$1: bv8;
  var v135$2: bv8;
  var v127$1: bv8;
  var v127$2: bv8;
  var v128$1: bv8;
  var v128$2: bv8;
  var v129$1: bv8;
  var v129$2: bv8;
  var v130$1: bv8;
  var v130$2: bv8;
  var v131$1: bv8;
  var v131$2: bv8;
  var v132$1: bv8;
  var v132$2: bv8;
  var v133$1: bv8;
  var v133$2: bv8;
  var v134$1: bv8;
  var v134$2: bv8;
  var v136$1: bv8;
  var v136$2: bv8;
  var v137$1: bv8;
  var v137$2: bv8;
  var v138$1: bv8;
  var v138$2: bv8;
  var v139$1: bv8;
  var v139$2: bv8;
  var v140$1: bv8;
  var v140$2: bv8;
  var v141$1: bv8;
  var v141$2: bv8;
  var v142$1: bv128;
  var v142$2: bv128;
  var v143$1: bv32;
  var v143$2: bv32;
  var v144$1: bv32;
  var v144$2: bv32;
  var v145$1: bv32;
  var v145$2: bv32;
  var v146$1: bv32;
  var v146$2: bv32;
  var v147$1: bv32;
  var v147$2: bv32;
  var v148$1: bv32;
  var v148$2: bv32;
  var v149$1: bv32;
  var v149$2: bv32;
  var v150$1: bv32;
  var v150$2: bv32;
  var v151$1: bv32;
  var v151$2: bv32;
  var v152$1: bv32;
  var v152$2: bv32;
  var v153$1: bv32;
  var v153$2: bv32;
  var v154$1: bv32;
  var v154$2: bv32;
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
  var p8$1: bool;
  var p8$2: bool;
  var p9$1: bool;
  var p9$2: bool;
  var p10$1: bool;
  var p10$2: bool;
  var p11$1: bool;
  var p11$2: bool;
  var p12$1: bool;
  var p12$2: bool;
  var p13$1: bool;
  var p13$2: bool;
  var _HAVOC_bv8$1: bv8;
  var _HAVOC_bv8$2: bv8;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    v2$1 := FADD32(SI32_TO_FP32(v0$1), 1056964608bv32);
    v2$2 := FADD32(SI32_TO_FP32(v0$2), 1056964608bv32);
    v3$1 := FADD32(SI32_TO_FP32(v1$1), 1056964608bv32);
    v3$2 := FADD32(SI32_TO_FP32(v1$2), 1056964608bv32);
    v4$1 := BV32_SLT(v0$1, $imageW);
    v4$2 := BV32_SLT(v0$2, $imageW);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p6$1 := false;
    p6$2 := false;
    p12$1 := false;
    p12$2 := false;
    p13$1 := false;
    p13$2 := false;
    p0$1 := (if v4$1 then v4$1 else p0$1);
    p0$2 := (if v4$2 then v4$2 else p0$2);
    v5$1 := (if p0$1 then BV32_SLT(v1$1, $imageH) else v5$1);
    v5$2 := (if p0$2 then BV32_SLT(v1$2, $imageH) else v5$2);
    p1$1 := (if p0$1 && v5$1 then v5$1 else p1$1);
    p1$2 := (if p0$2 && v5$2 then v5$2 else p1$2);
    $weight.0$1, $n.0$1 := (if p1$1 then 0bv32 else $weight.0$1), (if p1$1 then 3225419776bv32 else $n.0$1);
    $weight.0$2, $n.0$2 := (if p1$2 then 0bv32 else $weight.0$2), (if p1$2 then 3225419776bv32 else $n.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 5} p2$1 ==> true;
    v6$1 := (if p2$1 then FEQ32($n.0$1, 1077936128bv32) || FLT32($n.0$1, 1077936128bv32) else v6$1);
    v6$2 := (if p2$2 then FEQ32($n.0$2, 1077936128bv32) || FLT32($n.0$2, 1077936128bv32) else v6$2);
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p3$1 := (if p2$1 && v6$1 then v6$1 else p3$1);
    p3$2 := (if p2$2 && v6$2 then v6$2 else p3$2);
    p2$1 := (if p2$1 && !v6$1 then v6$1 else p2$1);
    p2$2 := (if p2$2 && !v6$2 then v6$2 else p2$2);
    $weight.1$1, $m.0$1 := (if p3$1 then $weight.0$1 else $weight.1$1), (if p3$1 then 3225419776bv32 else $m.0$1);
    $weight.1$2, $m.0$2 := (if p3$2 then $weight.0$2 else $weight.1$2), (if p3$2 then 3225419776bv32 else $m.0$2);
    p4$1 := (if p3$1 then true else p4$1);
    p4$2 := (if p3$2 then true else p4$2);
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p4$1 ==> p2$1;
    assert p4$2 ==> p2$2;
    assert {:block_sourceloc} {:sourceloc_num 7} p4$1 ==> true;
    v7$1 := (if p4$1 then FEQ32($m.0$1, 1077936128bv32) || FLT32($m.0$1, 1077936128bv32) else v7$1);
    v7$2 := (if p4$2 then FEQ32($m.0$2, 1077936128bv32) || FLT32($m.0$2, 1077936128bv32) else v7$2);
    p5$1 := false;
    p5$2 := false;
    p5$1 := (if p4$1 && v7$1 then v7$1 else p5$1);
    p5$2 := (if p4$2 && v7$2 then v7$2 else p5$2);
    p4$1 := (if p4$1 && !v7$1 then v7$1 else p4$1);
    p4$2 := (if p4$2 && !v7$2 then v7$2 else p4$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v8$1 := (if p5$1 then _HAVOC_bv8$1 else v8$1);
    v8$2 := (if p5$2 then _HAVOC_bv8$2 else v8$2);
    $$1$0bv32$1 := (if p5$1 then v8$1 else $$1$0bv32$1);
    $$1$0bv32$2 := (if p5$2 then v8$2 else $$1$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v9$1 := (if p5$1 then _HAVOC_bv8$1 else v9$1);
    v9$2 := (if p5$2 then _HAVOC_bv8$2 else v9$2);
    $$1$1bv32$1 := (if p5$1 then v9$1 else $$1$1bv32$1);
    $$1$1bv32$2 := (if p5$2 then v9$2 else $$1$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v10$1 := (if p5$1 then _HAVOC_bv8$1 else v10$1);
    v10$2 := (if p5$2 then _HAVOC_bv8$2 else v10$2);
    $$1$2bv32$1 := (if p5$1 then v10$1 else $$1$2bv32$1);
    $$1$2bv32$2 := (if p5$2 then v10$2 else $$1$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v11$1 := (if p5$1 then _HAVOC_bv8$1 else v11$1);
    v11$2 := (if p5$2 then _HAVOC_bv8$2 else v11$2);
    $$1$3bv32$1 := (if p5$1 then v11$1 else $$1$3bv32$1);
    $$1$3bv32$2 := (if p5$2 then v11$2 else $$1$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v12$1 := (if p5$1 then _HAVOC_bv8$1 else v12$1);
    v12$2 := (if p5$2 then _HAVOC_bv8$2 else v12$2);
    $$1$4bv32$1 := (if p5$1 then v12$1 else $$1$4bv32$1);
    $$1$4bv32$2 := (if p5$2 then v12$2 else $$1$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v13$1 := (if p5$1 then _HAVOC_bv8$1 else v13$1);
    v13$2 := (if p5$2 then _HAVOC_bv8$2 else v13$2);
    $$1$5bv32$1 := (if p5$1 then v13$1 else $$1$5bv32$1);
    $$1$5bv32$2 := (if p5$2 then v13$2 else $$1$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v14$1 := (if p5$1 then _HAVOC_bv8$1 else v14$1);
    v14$2 := (if p5$2 then _HAVOC_bv8$2 else v14$2);
    $$1$6bv32$1 := (if p5$1 then v14$1 else $$1$6bv32$1);
    $$1$6bv32$2 := (if p5$2 then v14$2 else $$1$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v15$1 := (if p5$1 then _HAVOC_bv8$1 else v15$1);
    v15$2 := (if p5$2 then _HAVOC_bv8$2 else v15$2);
    $$1$7bv32$1 := (if p5$1 then v15$1 else $$1$7bv32$1);
    $$1$7bv32$2 := (if p5$2 then v15$2 else $$1$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v16$1 := (if p5$1 then _HAVOC_bv8$1 else v16$1);
    v16$2 := (if p5$2 then _HAVOC_bv8$2 else v16$2);
    $$1$8bv32$1 := (if p5$1 then v16$1 else $$1$8bv32$1);
    $$1$8bv32$2 := (if p5$2 then v16$2 else $$1$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v17$1 := (if p5$1 then _HAVOC_bv8$1 else v17$1);
    v17$2 := (if p5$2 then _HAVOC_bv8$2 else v17$2);
    $$1$9bv32$1 := (if p5$1 then v17$1 else $$1$9bv32$1);
    $$1$9bv32$2 := (if p5$2 then v17$2 else $$1$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v18$1 := (if p5$1 then _HAVOC_bv8$1 else v18$1);
    v18$2 := (if p5$2 then _HAVOC_bv8$2 else v18$2);
    $$1$10bv32$1 := (if p5$1 then v18$1 else $$1$10bv32$1);
    $$1$10bv32$2 := (if p5$2 then v18$2 else $$1$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v19$1 := (if p5$1 then _HAVOC_bv8$1 else v19$1);
    v19$2 := (if p5$2 then _HAVOC_bv8$2 else v19$2);
    $$1$11bv32$1 := (if p5$1 then v19$1 else $$1$11bv32$1);
    $$1$11bv32$2 := (if p5$2 then v19$2 else $$1$11bv32$2);
    v20$1 := (if p5$1 then $$1$0bv32$1 else v20$1);
    v20$2 := (if p5$2 then $$1$0bv32$2 else v20$2);
    v21$1 := (if p5$1 then $$1$1bv32$1 else v21$1);
    v21$2 := (if p5$2 then $$1$1bv32$2 else v21$2);
    v22$1 := (if p5$1 then $$1$2bv32$1 else v22$1);
    v22$2 := (if p5$2 then $$1$2bv32$2 else v22$2);
    v23$1 := (if p5$1 then $$1$3bv32$1 else v23$1);
    v23$2 := (if p5$2 then $$1$3bv32$2 else v23$2);
    v24$1 := (if p5$1 then $$1$4bv32$1 else v24$1);
    v24$2 := (if p5$2 then $$1$4bv32$2 else v24$2);
    v25$1 := (if p5$1 then $$1$5bv32$1 else v25$1);
    v25$2 := (if p5$2 then $$1$5bv32$2 else v25$2);
    v26$1 := (if p5$1 then $$1$6bv32$1 else v26$1);
    v26$2 := (if p5$2 then $$1$6bv32$2 else v26$2);
    v27$1 := (if p5$1 then $$1$7bv32$1 else v27$1);
    v27$2 := (if p5$2 then $$1$7bv32$2 else v27$2);
    v28$1 := (if p5$1 then $$1$8bv32$1 else v28$1);
    v28$2 := (if p5$2 then $$1$8bv32$2 else v28$2);
    v29$1 := (if p5$1 then $$1$9bv32$1 else v29$1);
    v29$2 := (if p5$2 then $$1$9bv32$2 else v29$2);
    v30$1 := (if p5$1 then $$1$10bv32$1 else v30$1);
    v30$2 := (if p5$2 then $$1$10bv32$2 else v30$2);
    v31$1 := (if p5$1 then $$1$11bv32$1 else v31$1);
    v31$2 := (if p5$2 then $$1$11bv32$2 else v31$2);
    call {:sourceloc_num 45} v32$1, v32$2 := $_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff(p5$1, v23$1 ++ v22$1 ++ v21$1 ++ v20$1, v27$1 ++ v26$1 ++ v25$1 ++ v24$1, v31$1 ++ v30$1 ++ v29$1 ++ v28$1, FADD32(FADD32(UI32_TO_FP32(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), 3bv32)), 1056964608bv32), $m.0$1), FADD32(FADD32(UI32_TO_FP32(BV32_ADD(BV32_MUL(group_size_x, group_id_y$1), 3bv32)), 1056964608bv32), $n.0$1), p5$2, v23$2 ++ v22$2 ++ v21$2 ++ v20$2, v27$2 ++ v26$2 ++ v25$2 ++ v24$2, v31$2 ++ v30$2 ++ v29$2 ++ v28$2, FADD32(FADD32(UI32_TO_FP32(BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), 3bv32)), 1056964608bv32), $m.0$2), FADD32(FADD32(UI32_TO_FP32(BV32_ADD(BV32_MUL(group_size_x, group_id_y$2), 3bv32)), 1056964608bv32), $n.0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff"} true;
    $$0$0bv32$1 := (if p5$1 then v32$1[32:0] else $$0$0bv32$1);
    $$0$0bv32$2 := (if p5$2 then v32$2[32:0] else $$0$0bv32$2);
    $$0$1bv32$1 := (if p5$1 then v32$1[64:32] else $$0$1bv32$1);
    $$0$1bv32$2 := (if p5$2 then v32$2[64:32] else $$0$1bv32$2);
    $$0$2bv32$1 := (if p5$1 then v32$1[96:64] else $$0$2bv32$1);
    $$0$2bv32$2 := (if p5$2 then v32$2[96:64] else $$0$2bv32$2);
    $$0$3bv32$1 := (if p5$1 then v32$1[128:96] else $$0$3bv32$1);
    $$0$3bv32$2 := (if p5$2 then v32$2[128:96] else $$0$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v33$1 := (if p5$1 then _HAVOC_bv8$1 else v33$1);
    v33$2 := (if p5$2 then _HAVOC_bv8$2 else v33$2);
    $$3$0bv32$1 := (if p5$1 then v33$1 else $$3$0bv32$1);
    $$3$0bv32$2 := (if p5$2 then v33$2 else $$3$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v34$1 := (if p5$1 then _HAVOC_bv8$1 else v34$1);
    v34$2 := (if p5$2 then _HAVOC_bv8$2 else v34$2);
    $$3$1bv32$1 := (if p5$1 then v34$1 else $$3$1bv32$1);
    $$3$1bv32$2 := (if p5$2 then v34$2 else $$3$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v35$1 := (if p5$1 then _HAVOC_bv8$1 else v35$1);
    v35$2 := (if p5$2 then _HAVOC_bv8$2 else v35$2);
    $$3$2bv32$1 := (if p5$1 then v35$1 else $$3$2bv32$1);
    $$3$2bv32$2 := (if p5$2 then v35$2 else $$3$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v36$1 := (if p5$1 then _HAVOC_bv8$1 else v36$1);
    v36$2 := (if p5$2 then _HAVOC_bv8$2 else v36$2);
    $$3$3bv32$1 := (if p5$1 then v36$1 else $$3$3bv32$1);
    $$3$3bv32$2 := (if p5$2 then v36$2 else $$3$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v37$1 := (if p5$1 then _HAVOC_bv8$1 else v37$1);
    v37$2 := (if p5$2 then _HAVOC_bv8$2 else v37$2);
    $$3$4bv32$1 := (if p5$1 then v37$1 else $$3$4bv32$1);
    $$3$4bv32$2 := (if p5$2 then v37$2 else $$3$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v38$1 := (if p5$1 then _HAVOC_bv8$1 else v38$1);
    v38$2 := (if p5$2 then _HAVOC_bv8$2 else v38$2);
    $$3$5bv32$1 := (if p5$1 then v38$1 else $$3$5bv32$1);
    $$3$5bv32$2 := (if p5$2 then v38$2 else $$3$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v39$1 := (if p5$1 then _HAVOC_bv8$1 else v39$1);
    v39$2 := (if p5$2 then _HAVOC_bv8$2 else v39$2);
    $$3$6bv32$1 := (if p5$1 then v39$1 else $$3$6bv32$1);
    $$3$6bv32$2 := (if p5$2 then v39$2 else $$3$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v40$1 := (if p5$1 then _HAVOC_bv8$1 else v40$1);
    v40$2 := (if p5$2 then _HAVOC_bv8$2 else v40$2);
    $$3$7bv32$1 := (if p5$1 then v40$1 else $$3$7bv32$1);
    $$3$7bv32$2 := (if p5$2 then v40$2 else $$3$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v41$1 := (if p5$1 then _HAVOC_bv8$1 else v41$1);
    v41$2 := (if p5$2 then _HAVOC_bv8$2 else v41$2);
    $$3$8bv32$1 := (if p5$1 then v41$1 else $$3$8bv32$1);
    $$3$8bv32$2 := (if p5$2 then v41$2 else $$3$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v42$1 := (if p5$1 then _HAVOC_bv8$1 else v42$1);
    v42$2 := (if p5$2 then _HAVOC_bv8$2 else v42$2);
    $$3$9bv32$1 := (if p5$1 then v42$1 else $$3$9bv32$1);
    $$3$9bv32$2 := (if p5$2 then v42$2 else $$3$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v43$1 := (if p5$1 then _HAVOC_bv8$1 else v43$1);
    v43$2 := (if p5$2 then _HAVOC_bv8$2 else v43$2);
    $$3$10bv32$1 := (if p5$1 then v43$1 else $$3$10bv32$1);
    $$3$10bv32$2 := (if p5$2 then v43$2 else $$3$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v44$1 := (if p5$1 then _HAVOC_bv8$1 else v44$1);
    v44$2 := (if p5$2 then _HAVOC_bv8$2 else v44$2);
    $$3$11bv32$1 := (if p5$1 then v44$1 else $$3$11bv32$1);
    $$3$11bv32$2 := (if p5$2 then v44$2 else $$3$11bv32$2);
    v45$1 := (if p5$1 then $$3$0bv32$1 else v45$1);
    v45$2 := (if p5$2 then $$3$0bv32$2 else v45$2);
    v46$1 := (if p5$1 then $$3$1bv32$1 else v46$1);
    v46$2 := (if p5$2 then $$3$1bv32$2 else v46$2);
    v47$1 := (if p5$1 then $$3$2bv32$1 else v47$1);
    v47$2 := (if p5$2 then $$3$2bv32$2 else v47$2);
    v48$1 := (if p5$1 then $$3$3bv32$1 else v48$1);
    v48$2 := (if p5$2 then $$3$3bv32$2 else v48$2);
    v49$1 := (if p5$1 then $$3$4bv32$1 else v49$1);
    v49$2 := (if p5$2 then $$3$4bv32$2 else v49$2);
    v50$1 := (if p5$1 then $$3$5bv32$1 else v50$1);
    v50$2 := (if p5$2 then $$3$5bv32$2 else v50$2);
    v51$1 := (if p5$1 then $$3$6bv32$1 else v51$1);
    v51$2 := (if p5$2 then $$3$6bv32$2 else v51$2);
    v52$1 := (if p5$1 then $$3$7bv32$1 else v52$1);
    v52$2 := (if p5$2 then $$3$7bv32$2 else v52$2);
    v53$1 := (if p5$1 then $$3$8bv32$1 else v53$1);
    v53$2 := (if p5$2 then $$3$8bv32$2 else v53$2);
    v54$1 := (if p5$1 then $$3$9bv32$1 else v54$1);
    v54$2 := (if p5$2 then $$3$9bv32$2 else v54$2);
    v55$1 := (if p5$1 then $$3$10bv32$1 else v55$1);
    v55$2 := (if p5$2 then $$3$10bv32$2 else v55$2);
    v56$1 := (if p5$1 then $$3$11bv32$1 else v56$1);
    v56$2 := (if p5$2 then $$3$11bv32$2 else v56$2);
    call {:sourceloc_num 86} v57$1, v57$2 := $_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff(p5$1, v48$1 ++ v47$1 ++ v46$1 ++ v45$1, v52$1 ++ v51$1 ++ v50$1 ++ v49$1, v56$1 ++ v55$1 ++ v54$1 ++ v53$1, FADD32(v2$1, $m.0$1), FADD32(v3$1, $n.0$1), p5$2, v48$2 ++ v47$2 ++ v46$2 ++ v45$2, v52$2 ++ v51$2 ++ v50$2 ++ v49$2, v56$2 ++ v55$2 ++ v54$2 ++ v53$2, FADD32(v2$2, $m.0$2), FADD32(v3$2, $n.0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff"} true;
    $$2$0bv32$1 := (if p5$1 then v57$1[32:0] else $$2$0bv32$1);
    $$2$0bv32$2 := (if p5$2 then v57$2[32:0] else $$2$0bv32$2);
    $$2$1bv32$1 := (if p5$1 then v57$1[64:32] else $$2$1bv32$1);
    $$2$1bv32$2 := (if p5$2 then v57$2[64:32] else $$2$1bv32$2);
    $$2$2bv32$1 := (if p5$1 then v57$1[96:64] else $$2$2bv32$1);
    $$2$2bv32$2 := (if p5$2 then v57$2[96:64] else $$2$2bv32$2);
    $$2$3bv32$1 := (if p5$1 then v57$1[128:96] else $$2$3bv32$1);
    $$2$3bv32$2 := (if p5$2 then v57$2[128:96] else $$2$3bv32$2);
    v58$1 := (if p5$1 then $$0$0bv32$1 else v58$1);
    v58$2 := (if p5$2 then $$0$0bv32$2 else v58$2);
    v59$1 := (if p5$1 then $$0$1bv32$1 else v59$1);
    v59$2 := (if p5$2 then $$0$1bv32$2 else v59$2);
    v60$1 := (if p5$1 then $$0$2bv32$1 else v60$1);
    v60$2 := (if p5$2 then $$0$2bv32$2 else v60$2);
    v61$1 := (if p5$1 then $$0$3bv32$1 else v61$1);
    v61$2 := (if p5$2 then $$0$3bv32$2 else v61$2);
    v62$1 := (if p5$1 then $$2$0bv32$1 else v62$1);
    v62$2 := (if p5$2 then $$2$0bv32$2 else v62$2);
    v63$1 := (if p5$1 then $$2$1bv32$1 else v63$1);
    v63$2 := (if p5$2 then $$2$1bv32$2 else v63$2);
    v64$1 := (if p5$1 then $$2$2bv32$1 else v64$1);
    v64$2 := (if p5$2 then $$2$2bv32$2 else v64$2);
    v65$1 := (if p5$1 then $$2$3bv32$1 else v65$1);
    v65$2 := (if p5$2 then $$2$3bv32$2 else v65$2);
    $$a.i$0bv32$1 := (if p5$1 then v58$1 else $$a.i$0bv32$1);
    $$a.i$0bv32$2 := (if p5$2 then v58$2 else $$a.i$0bv32$2);
    $$a.i$1bv32$1 := (if p5$1 then v59$1 else $$a.i$1bv32$1);
    $$a.i$1bv32$2 := (if p5$2 then v59$2 else $$a.i$1bv32$2);
    $$a.i$2bv32$1 := (if p5$1 then v60$1 else $$a.i$2bv32$1);
    $$a.i$2bv32$2 := (if p5$2 then v60$2 else $$a.i$2bv32$2);
    $$a.i$3bv32$1 := (if p5$1 then v61$1 else $$a.i$3bv32$1);
    $$a.i$3bv32$2 := (if p5$2 then v61$2 else $$a.i$3bv32$2);
    $$b.i$0bv32$1 := (if p5$1 then v62$1 else $$b.i$0bv32$1);
    $$b.i$0bv32$2 := (if p5$2 then v62$2 else $$b.i$0bv32$2);
    $$b.i$1bv32$1 := (if p5$1 then v63$1 else $$b.i$1bv32$1);
    $$b.i$1bv32$2 := (if p5$2 then v63$2 else $$b.i$1bv32$2);
    $$b.i$2bv32$1 := (if p5$1 then v64$1 else $$b.i$2bv32$1);
    $$b.i$2bv32$2 := (if p5$2 then v64$2 else $$b.i$2bv32$2);
    $$b.i$3bv32$1 := (if p5$1 then v65$1 else $$b.i$3bv32$1);
    $$b.i$3bv32$2 := (if p5$2 then v65$2 else $$b.i$3bv32$2);
    v66$1 := (if p5$1 then $$b.i$0bv32$1 else v66$1);
    v66$2 := (if p5$2 then $$b.i$0bv32$2 else v66$2);
    v67$1 := (if p5$1 then $$a.i$0bv32$1 else v67$1);
    v67$2 := (if p5$2 then $$a.i$0bv32$2 else v67$2);
    v68$1 := (if p5$1 then $$b.i$0bv32$1 else v68$1);
    v68$2 := (if p5$2 then $$b.i$0bv32$2 else v68$2);
    v69$1 := (if p5$1 then $$a.i$0bv32$1 else v69$1);
    v69$2 := (if p5$2 then $$a.i$0bv32$2 else v69$2);
    v70$1 := (if p5$1 then $$b.i$1bv32$1 else v70$1);
    v70$2 := (if p5$2 then $$b.i$1bv32$2 else v70$2);
    v71$1 := (if p5$1 then $$a.i$1bv32$1 else v71$1);
    v71$2 := (if p5$2 then $$a.i$1bv32$2 else v71$2);
    v72$1 := (if p5$1 then $$b.i$1bv32$1 else v72$1);
    v72$2 := (if p5$2 then $$b.i$1bv32$2 else v72$2);
    v73$1 := (if p5$1 then $$a.i$1bv32$1 else v73$1);
    v73$2 := (if p5$2 then $$a.i$1bv32$2 else v73$2);
    v74$1 := (if p5$1 then $$b.i$2bv32$1 else v74$1);
    v74$2 := (if p5$2 then $$b.i$2bv32$2 else v74$2);
    v75$1 := (if p5$1 then $$a.i$2bv32$1 else v75$1);
    v75$2 := (if p5$2 then $$a.i$2bv32$2 else v75$2);
    v76$1 := (if p5$1 then $$b.i$2bv32$1 else v76$1);
    v76$2 := (if p5$2 then $$b.i$2bv32$2 else v76$2);
    v77$1 := (if p5$1 then $$a.i$2bv32$1 else v77$1);
    v77$2 := (if p5$2 then $$a.i$2bv32$2 else v77$2);
    $weight.1$1, $m.0$1 := (if p5$1 then FADD32($weight.1$1, FADD32(FADD32(FMUL32(FSUB32(v66$1, v67$1), FSUB32(v68$1, v69$1)), FMUL32(FSUB32(v70$1, v71$1), FSUB32(v72$1, v73$1))), FMUL32(FSUB32(v74$1, v75$1), FSUB32(v76$1, v77$1)))) else $weight.1$1), (if p5$1 then FADD32($m.0$1, 1065353216bv32) else $m.0$1);
    $weight.1$2, $m.0$2 := (if p5$2 then FADD32($weight.1$2, FADD32(FADD32(FMUL32(FSUB32(v66$2, v67$2), FSUB32(v68$2, v69$2)), FMUL32(FSUB32(v70$2, v71$2), FSUB32(v72$2, v73$2))), FMUL32(FSUB32(v74$2, v75$2), FSUB32(v76$2, v77$2)))) else $weight.1$2), (if p5$2 then FADD32($m.0$2, 1065353216bv32) else $m.0$2);
    p4$1 := (if p5$1 then true else p4$1);
    p4$2 := (if p5$2 then true else p4$2);
    goto $5.backedge, $5.tail;

  $5.tail:
    assume !p4$1 && !p4$2;
    $weight.0$1, $n.0$1 := (if p3$1 then $weight.1$1 else $weight.0$1), (if p3$1 then FADD32($n.0$1, 1065353216bv32) else $n.0$1);
    $weight.0$2, $n.0$2 := (if p3$2 then $weight.1$2 else $weight.0$2), (if p3$2 then FADD32($n.0$2, 1065353216bv32) else $n.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, __partitioned_block_$3.tail_0;

  __partitioned_block_$3.tail_0:
    assume !p2$1 && !p2$2;
    call {:sourceloc_num 123} v78$1, v78$2 := $__expf(p1$1, FSUB32(2147483648bv32, FADD32(FMUL32($weight.0$1, $Noise), FMUL32(UI32_TO_FP32(BV32_ADD(BV32_MUL(BV32_SUB(local_id_x$1, 3bv32), BV32_SUB(local_id_x$1, 3bv32)), BV32_MUL(BV32_SUB(local_id_y$1, 3bv32), BV32_SUB(local_id_y$1, 3bv32)))), 1017589509bv32))), p1$2, FSUB32(2147483648bv32, FADD32(FMUL32($weight.0$2, $Noise), FMUL32(UI32_TO_FP32(BV32_ADD(BV32_MUL(BV32_SUB(local_id_x$2, 3bv32), BV32_SUB(local_id_x$2, 3bv32)), BV32_MUL(BV32_SUB(local_id_y$2, 3bv32), BV32_SUB(local_id_y$2, 3bv32)))), 1017589509bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "$__expf"} true;
    call {:sourceloc} {:sourceloc_num 124} _LOG_WRITE_$$_ZZ4NLM2PjiiffE8fWeights(p1$1, BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1), v78$1, $$_ZZ4NLM2PjiiffE8fWeights[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ4NLM2PjiiffE8fWeights(p1$2, BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 124} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 124} _CHECK_WRITE_$$_ZZ4NLM2PjiiffE8fWeights(p1$2, BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2), v78$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ4NLM2PjiiffE8fWeights"} true;
    $$_ZZ4NLM2PjiiffE8fWeights[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)] := (if p1$1 then v78$1 else $$_ZZ4NLM2PjiiffE8fWeights[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1)]);
    $$_ZZ4NLM2PjiiffE8fWeights[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2)] := (if p1$2 then v78$2 else $$_ZZ4NLM2PjiiffE8fWeights[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2)]);
    goto __partitioned_block_$3.tail_1;

  __partitioned_block_$3.tail_1:
    call {:sourceloc_num 125} $bugle_barrier_duplicated_0(1bv1, 1bv1, p1$1, p1$2);
    $$clr$0bv32$1 := (if p1$1 then 0bv32 else $$clr$0bv32$1);
    $$clr$0bv32$2 := (if p1$2 then 0bv32 else $$clr$0bv32$2);
    $$clr$1bv32$1 := (if p1$1 then 0bv32 else $$clr$1bv32$1);
    $$clr$1bv32$2 := (if p1$2 then 0bv32 else $$clr$1bv32$2);
    $$clr$2bv32$1 := (if p1$1 then 0bv32 else $$clr$2bv32$1);
    $$clr$2bv32$2 := (if p1$2 then 0bv32 else $$clr$2bv32$2);
    $fCount.0$1, $sumWeights.0$1, $idx.0$1, $i.0$1 := (if p1$1 then 0bv32 else $fCount.0$1), (if p1$1 then 0bv32 else $sumWeights.0$1), (if p1$1 then 0bv32 else $idx.0$1), (if p1$1 then 3225419776bv32 else $i.0$1);
    $fCount.0$2, $sumWeights.0$2, $idx.0$2, $i.0$2 := (if p1$2 then 0bv32 else $fCount.0$2), (if p1$2 then 0bv32 else $sumWeights.0$2), (if p1$2 then 0bv32 else $idx.0$2), (if p1$2 then 3225419776bv32 else $i.0$2);
    p6$1 := (if p1$1 then true else p6$1);
    p6$2 := (if p1$2 then true else p6$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $11;

  $11:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 129} p6$1 ==> true;
    v79$1 := (if p6$1 then FEQ32($i.0$1, 1082130432bv32) || FLT32($i.0$1, 1082130432bv32) else v79$1);
    v79$2 := (if p6$2 then FEQ32($i.0$2, 1082130432bv32) || FLT32($i.0$2, 1082130432bv32) else v79$2);
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    p10$1 := false;
    p10$2 := false;
    p11$1 := false;
    p11$2 := false;
    p7$1 := (if p6$1 && v79$1 then v79$1 else p7$1);
    p7$2 := (if p6$2 && v79$2 then v79$2 else p7$2);
    p6$1 := (if p6$1 && !v79$1 then v79$1 else p6$1);
    p6$2 := (if p6$2 && !v79$2 then v79$2 else p6$2);
    $fCount.1$1, $sumWeights.1$1, $idx.1$1, $j.0$1 := (if p7$1 then $fCount.0$1 else $fCount.1$1), (if p7$1 then $sumWeights.0$1 else $sumWeights.1$1), (if p7$1 then $idx.0$1 else $idx.1$1), (if p7$1 then 3225419776bv32 else $j.0$1);
    $fCount.1$2, $sumWeights.1$2, $idx.1$2, $j.0$2 := (if p7$2 then $fCount.0$2 else $fCount.1$2), (if p7$2 then $sumWeights.0$2 else $sumWeights.1$2), (if p7$2 then $idx.0$2 else $idx.1$2), (if p7$2 then 3225419776bv32 else $j.0$2);
    p8$1 := (if p7$1 then true else p8$1);
    p8$2 := (if p7$2 then true else p8$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $13;

  $13:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p8$1 ==> p6$1;
    assert p8$2 ==> p6$2;
    assert {:block_sourceloc} {:sourceloc_num 131} p8$1 ==> true;
    v80$1 := (if p8$1 then FEQ32($j.0$1, 1082130432bv32) || FLT32($j.0$1, 1082130432bv32) else v80$1);
    v80$2 := (if p8$2 then FEQ32($j.0$2, 1082130432bv32) || FLT32($j.0$2, 1082130432bv32) else v80$2);
    p9$1 := false;
    p9$2 := false;
    p9$1 := (if p8$1 && v80$1 then v80$1 else p9$1);
    p9$2 := (if p8$2 && v80$2 then v80$2 else p9$2);
    p8$1 := (if p8$1 && !v80$1 then v80$1 else p8$1);
    p8$2 := (if p8$2 && !v80$2 then v80$2 else p8$2);
    call {:sourceloc} {:sourceloc_num 133} _LOG_READ_$$_ZZ4NLM2PjiiffE8fWeights(p9$1, $idx.1$1, $$_ZZ4NLM2PjiiffE8fWeights[1bv1][$idx.1$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 133} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 133} _CHECK_READ_$$_ZZ4NLM2PjiiffE8fWeights(p9$2, $idx.1$2, $$_ZZ4NLM2PjiiffE8fWeights[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$idx.1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ4NLM2PjiiffE8fWeights"} true;
    v81$1 := (if p9$1 then $$_ZZ4NLM2PjiiffE8fWeights[1bv1][$idx.1$1] else v81$1);
    v81$2 := (if p9$2 then $$_ZZ4NLM2PjiiffE8fWeights[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$idx.1$2] else v81$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v82$1 := (if p9$1 then _HAVOC_bv8$1 else v82$1);
    v82$2 := (if p9$2 then _HAVOC_bv8$2 else v82$2);
    $$4$0bv32$1 := (if p9$1 then v82$1 else $$4$0bv32$1);
    $$4$0bv32$2 := (if p9$2 then v82$2 else $$4$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v83$1 := (if p9$1 then _HAVOC_bv8$1 else v83$1);
    v83$2 := (if p9$2 then _HAVOC_bv8$2 else v83$2);
    $$4$1bv32$1 := (if p9$1 then v83$1 else $$4$1bv32$1);
    $$4$1bv32$2 := (if p9$2 then v83$2 else $$4$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v84$1 := (if p9$1 then _HAVOC_bv8$1 else v84$1);
    v84$2 := (if p9$2 then _HAVOC_bv8$2 else v84$2);
    $$4$2bv32$1 := (if p9$1 then v84$1 else $$4$2bv32$1);
    $$4$2bv32$2 := (if p9$2 then v84$2 else $$4$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v85$1 := (if p9$1 then _HAVOC_bv8$1 else v85$1);
    v85$2 := (if p9$2 then _HAVOC_bv8$2 else v85$2);
    $$4$3bv32$1 := (if p9$1 then v85$1 else $$4$3bv32$1);
    $$4$3bv32$2 := (if p9$2 then v85$2 else $$4$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v86$1 := (if p9$1 then _HAVOC_bv8$1 else v86$1);
    v86$2 := (if p9$2 then _HAVOC_bv8$2 else v86$2);
    $$4$4bv32$1 := (if p9$1 then v86$1 else $$4$4bv32$1);
    $$4$4bv32$2 := (if p9$2 then v86$2 else $$4$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v87$1 := (if p9$1 then _HAVOC_bv8$1 else v87$1);
    v87$2 := (if p9$2 then _HAVOC_bv8$2 else v87$2);
    $$4$5bv32$1 := (if p9$1 then v87$1 else $$4$5bv32$1);
    $$4$5bv32$2 := (if p9$2 then v87$2 else $$4$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v88$1 := (if p9$1 then _HAVOC_bv8$1 else v88$1);
    v88$2 := (if p9$2 then _HAVOC_bv8$2 else v88$2);
    $$4$6bv32$1 := (if p9$1 then v88$1 else $$4$6bv32$1);
    $$4$6bv32$2 := (if p9$2 then v88$2 else $$4$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v89$1 := (if p9$1 then _HAVOC_bv8$1 else v89$1);
    v89$2 := (if p9$2 then _HAVOC_bv8$2 else v89$2);
    $$4$7bv32$1 := (if p9$1 then v89$1 else $$4$7bv32$1);
    $$4$7bv32$2 := (if p9$2 then v89$2 else $$4$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v90$1 := (if p9$1 then _HAVOC_bv8$1 else v90$1);
    v90$2 := (if p9$2 then _HAVOC_bv8$2 else v90$2);
    $$4$8bv32$1 := (if p9$1 then v90$1 else $$4$8bv32$1);
    $$4$8bv32$2 := (if p9$2 then v90$2 else $$4$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v91$1 := (if p9$1 then _HAVOC_bv8$1 else v91$1);
    v91$2 := (if p9$2 then _HAVOC_bv8$2 else v91$2);
    $$4$9bv32$1 := (if p9$1 then v91$1 else $$4$9bv32$1);
    $$4$9bv32$2 := (if p9$2 then v91$2 else $$4$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v92$1 := (if p9$1 then _HAVOC_bv8$1 else v92$1);
    v92$2 := (if p9$2 then _HAVOC_bv8$2 else v92$2);
    $$4$10bv32$1 := (if p9$1 then v92$1 else $$4$10bv32$1);
    $$4$10bv32$2 := (if p9$2 then v92$2 else $$4$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v93$1 := (if p9$1 then _HAVOC_bv8$1 else v93$1);
    v93$2 := (if p9$2 then _HAVOC_bv8$2 else v93$2);
    $$4$11bv32$1 := (if p9$1 then v93$1 else $$4$11bv32$1);
    $$4$11bv32$2 := (if p9$2 then v93$2 else $$4$11bv32$2);
    v94$1 := (if p9$1 then $$4$0bv32$1 else v94$1);
    v94$2 := (if p9$2 then $$4$0bv32$2 else v94$2);
    v95$1 := (if p9$1 then $$4$1bv32$1 else v95$1);
    v95$2 := (if p9$2 then $$4$1bv32$2 else v95$2);
    v96$1 := (if p9$1 then $$4$2bv32$1 else v96$1);
    v96$2 := (if p9$2 then $$4$2bv32$2 else v96$2);
    v97$1 := (if p9$1 then $$4$3bv32$1 else v97$1);
    v97$2 := (if p9$2 then $$4$3bv32$2 else v97$2);
    v98$1 := (if p9$1 then $$4$4bv32$1 else v98$1);
    v98$2 := (if p9$2 then $$4$4bv32$2 else v98$2);
    v99$1 := (if p9$1 then $$4$5bv32$1 else v99$1);
    v99$2 := (if p9$2 then $$4$5bv32$2 else v99$2);
    v100$1 := (if p9$1 then $$4$6bv32$1 else v100$1);
    v100$2 := (if p9$2 then $$4$6bv32$2 else v100$2);
    v101$1 := (if p9$1 then $$4$7bv32$1 else v101$1);
    v101$2 := (if p9$2 then $$4$7bv32$2 else v101$2);
    v102$1 := (if p9$1 then $$4$8bv32$1 else v102$1);
    v102$2 := (if p9$2 then $$4$8bv32$2 else v102$2);
    v103$1 := (if p9$1 then $$4$9bv32$1 else v103$1);
    v103$2 := (if p9$2 then $$4$9bv32$2 else v103$2);
    v104$1 := (if p9$1 then $$4$10bv32$1 else v104$1);
    v104$2 := (if p9$2 then $$4$10bv32$2 else v104$2);
    v105$1 := (if p9$1 then $$4$11bv32$1 else v105$1);
    v105$2 := (if p9$2 then $$4$11bv32$2 else v105$2);
    call {:sourceloc_num 170} v106$1, v106$2 := $_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff(p9$1, v97$1 ++ v96$1 ++ v95$1 ++ v94$1, v101$1 ++ v100$1 ++ v99$1 ++ v98$1, v105$1 ++ v104$1 ++ v103$1 ++ v102$1, FADD32(v2$1, $j.0$1), FADD32(v3$1, $i.0$1), p9$2, v97$2 ++ v96$2 ++ v95$2 ++ v94$2, v101$2 ++ v100$2 ++ v99$2 ++ v98$2, v105$2 ++ v104$2 ++ v103$2 ++ v102$2, FADD32(v2$2, $j.0$2), FADD32(v3$2, $i.0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff"} true;
    $$clrIJ$0bv32$1 := (if p9$1 then v106$1[32:0] else $$clrIJ$0bv32$1);
    $$clrIJ$0bv32$2 := (if p9$2 then v106$2[32:0] else $$clrIJ$0bv32$2);
    $$clrIJ$1bv32$1 := (if p9$1 then v106$1[64:32] else $$clrIJ$1bv32$1);
    $$clrIJ$1bv32$2 := (if p9$2 then v106$2[64:32] else $$clrIJ$1bv32$2);
    $$clrIJ$2bv32$1 := (if p9$1 then v106$1[96:64] else $$clrIJ$2bv32$1);
    $$clrIJ$2bv32$2 := (if p9$2 then v106$2[96:64] else $$clrIJ$2bv32$2);
    $$clrIJ$3bv32$1 := (if p9$1 then v106$1[128:96] else $$clrIJ$3bv32$1);
    $$clrIJ$3bv32$2 := (if p9$2 then v106$2[128:96] else $$clrIJ$3bv32$2);
    v107$1 := (if p9$1 then $$clrIJ$0bv32$1 else v107$1);
    v107$2 := (if p9$2 then $$clrIJ$0bv32$2 else v107$2);
    v108$1 := (if p9$1 then $$clr$0bv32$1 else v108$1);
    v108$2 := (if p9$2 then $$clr$0bv32$2 else v108$2);
    $$clr$0bv32$1 := (if p9$1 then FADD32(v108$1, FMUL32(v107$1, v81$1)) else $$clr$0bv32$1);
    $$clr$0bv32$2 := (if p9$2 then FADD32(v108$2, FMUL32(v107$2, v81$2)) else $$clr$0bv32$2);
    v109$1 := (if p9$1 then $$clrIJ$1bv32$1 else v109$1);
    v109$2 := (if p9$2 then $$clrIJ$1bv32$2 else v109$2);
    v110$1 := (if p9$1 then $$clr$1bv32$1 else v110$1);
    v110$2 := (if p9$2 then $$clr$1bv32$2 else v110$2);
    $$clr$1bv32$1 := (if p9$1 then FADD32(v110$1, FMUL32(v109$1, v81$1)) else $$clr$1bv32$1);
    $$clr$1bv32$2 := (if p9$2 then FADD32(v110$2, FMUL32(v109$2, v81$2)) else $$clr$1bv32$2);
    v111$1 := (if p9$1 then $$clrIJ$2bv32$1 else v111$1);
    v111$2 := (if p9$2 then $$clrIJ$2bv32$2 else v111$2);
    v112$1 := (if p9$1 then $$clr$2bv32$1 else v112$1);
    v112$2 := (if p9$2 then $$clr$2bv32$2 else v112$2);
    $$clr$2bv32$1 := (if p9$1 then FADD32(v112$1, FMUL32(v111$1, v81$1)) else $$clr$2bv32$1);
    $$clr$2bv32$2 := (if p9$2 then FADD32(v112$2, FMUL32(v111$2, v81$2)) else $$clr$2bv32$2);
    $fCount.1$1, $sumWeights.1$1, $idx.1$1, $j.0$1 := (if p9$1 then FADD32($fCount.1$1, (if FLT32(1036831949bv32, v81$1) then 1017589509bv32 else 0bv32)) else $fCount.1$1), (if p9$1 then FADD32($sumWeights.1$1, v81$1) else $sumWeights.1$1), (if p9$1 then BV32_ADD($idx.1$1, 1bv32) else $idx.1$1), (if p9$1 then FADD32($j.0$1, 1065353216bv32) else $j.0$1);
    $fCount.1$2, $sumWeights.1$2, $idx.1$2, $j.0$2 := (if p9$2 then FADD32($fCount.1$2, (if FLT32(1036831949bv32, v81$2) then 1017589509bv32 else 0bv32)) else $fCount.1$2), (if p9$2 then FADD32($sumWeights.1$2, v81$2) else $sumWeights.1$2), (if p9$2 then BV32_ADD($idx.1$2, 1bv32) else $idx.1$2), (if p9$2 then FADD32($j.0$2, 1065353216bv32) else $j.0$2);
    p8$1 := (if p9$1 then true else p8$1);
    p8$2 := (if p9$2 then true else p8$2);
    goto $13.backedge, $13.tail;

  $13.tail:
    assume !p8$1 && !p8$2;
    $fCount.0$1, $sumWeights.0$1, $idx.0$1, $i.0$1 := (if p7$1 then $fCount.1$1 else $fCount.0$1), (if p7$1 then $sumWeights.1$1 else $sumWeights.0$1), (if p7$1 then $idx.1$1 else $idx.0$1), (if p7$1 then FADD32($i.0$1, 1065353216bv32) else $i.0$1);
    $fCount.0$2, $sumWeights.0$2, $idx.0$2, $i.0$2 := (if p7$2 then $fCount.1$2 else $fCount.0$2), (if p7$2 then $sumWeights.1$2 else $sumWeights.0$2), (if p7$2 then $idx.1$2 else $idx.0$2), (if p7$2 then FADD32($i.0$2, 1065353216bv32) else $i.0$2);
    p6$1 := (if p7$1 then true else p6$1);
    p6$2 := (if p7$2 then true else p6$2);
    goto $11.backedge, $11.tail;

  $11.tail:
    assume !p6$1 && !p6$2;
    v113$1 := (if p1$1 then FDIV32(1065353216bv32, $sumWeights.0$1) else v113$1);
    v113$2 := (if p1$2 then FDIV32(1065353216bv32, $sumWeights.0$2) else v113$2);
    v114$1 := (if p1$1 then $$clr$0bv32$1 else v114$1);
    v114$2 := (if p1$2 then $$clr$0bv32$2 else v114$2);
    $$clr$0bv32$1 := (if p1$1 then FMUL32(v114$1, v113$1) else $$clr$0bv32$1);
    $$clr$0bv32$2 := (if p1$2 then FMUL32(v114$2, v113$2) else $$clr$0bv32$2);
    v115$1 := (if p1$1 then $$clr$1bv32$1 else v115$1);
    v115$2 := (if p1$2 then $$clr$1bv32$2 else v115$2);
    $$clr$1bv32$1 := (if p1$1 then FMUL32(v115$1, v113$1) else $$clr$1bv32$1);
    $$clr$1bv32$2 := (if p1$2 then FMUL32(v115$2, v113$2) else $$clr$1bv32$2);
    v116$1 := (if p1$1 then $$clr$2bv32$1 else v116$1);
    v116$2 := (if p1$2 then $$clr$2bv32$2 else v116$2);
    $$clr$2bv32$1 := (if p1$1 then FMUL32(v116$1, v113$1) else $$clr$2bv32$1);
    $$clr$2bv32$2 := (if p1$2 then FMUL32(v116$2, v113$2) else $$clr$2bv32$2);
    v117$1 := (if p1$1 then FLT32(1036831949bv32, $fCount.0$1) else v117$1);
    v117$2 := (if p1$2 then FLT32(1036831949bv32, $fCount.0$2) else v117$2);
    p10$1 := (if p1$1 && v117$1 then v117$1 else p10$1);
    p10$2 := (if p1$2 && v117$2 then v117$2 else p10$2);
    p11$1 := (if p1$1 && !v117$1 then !v117$1 else p11$1);
    p11$2 := (if p1$2 && !v117$2 then !v117$2 else p11$2);
    $0$1 := (if p10$1 then $lerpC else $0$1);
    $0$2 := (if p10$2 then $lerpC else $0$2);
    $0$1 := (if p11$1 then FSUB32(1065353216bv32, $lerpC) else $0$1);
    $0$2 := (if p11$2 then FSUB32(1065353216bv32, $lerpC) else $0$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v118$1 := (if p1$1 then _HAVOC_bv8$1 else v118$1);
    v118$2 := (if p1$2 then _HAVOC_bv8$2 else v118$2);
    $$5$0bv32$1 := (if p1$1 then v118$1 else $$5$0bv32$1);
    $$5$0bv32$2 := (if p1$2 then v118$2 else $$5$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v119$1 := (if p1$1 then _HAVOC_bv8$1 else v119$1);
    v119$2 := (if p1$2 then _HAVOC_bv8$2 else v119$2);
    $$5$1bv32$1 := (if p1$1 then v119$1 else $$5$1bv32$1);
    $$5$1bv32$2 := (if p1$2 then v119$2 else $$5$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v120$1 := (if p1$1 then _HAVOC_bv8$1 else v120$1);
    v120$2 := (if p1$2 then _HAVOC_bv8$2 else v120$2);
    $$5$2bv32$1 := (if p1$1 then v120$1 else $$5$2bv32$1);
    $$5$2bv32$2 := (if p1$2 then v120$2 else $$5$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v121$1 := (if p1$1 then _HAVOC_bv8$1 else v121$1);
    v121$2 := (if p1$2 then _HAVOC_bv8$2 else v121$2);
    $$5$3bv32$1 := (if p1$1 then v121$1 else $$5$3bv32$1);
    $$5$3bv32$2 := (if p1$2 then v121$2 else $$5$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v122$1 := (if p1$1 then _HAVOC_bv8$1 else v122$1);
    v122$2 := (if p1$2 then _HAVOC_bv8$2 else v122$2);
    $$5$4bv32$1 := (if p1$1 then v122$1 else $$5$4bv32$1);
    $$5$4bv32$2 := (if p1$2 then v122$2 else $$5$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v123$1 := (if p1$1 then _HAVOC_bv8$1 else v123$1);
    v123$2 := (if p1$2 then _HAVOC_bv8$2 else v123$2);
    $$5$5bv32$1 := (if p1$1 then v123$1 else $$5$5bv32$1);
    $$5$5bv32$2 := (if p1$2 then v123$2 else $$5$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v124$1 := (if p1$1 then _HAVOC_bv8$1 else v124$1);
    v124$2 := (if p1$2 then _HAVOC_bv8$2 else v124$2);
    $$5$6bv32$1 := (if p1$1 then v124$1 else $$5$6bv32$1);
    $$5$6bv32$2 := (if p1$2 then v124$2 else $$5$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v125$1 := (if p1$1 then _HAVOC_bv8$1 else v125$1);
    v125$2 := (if p1$2 then _HAVOC_bv8$2 else v125$2);
    $$5$7bv32$1 := (if p1$1 then v125$1 else $$5$7bv32$1);
    $$5$7bv32$2 := (if p1$2 then v125$2 else $$5$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v126$1 := (if p1$1 then _HAVOC_bv8$1 else v126$1);
    v126$2 := (if p1$2 then _HAVOC_bv8$2 else v126$2);
    $$5$8bv32$1 := (if p1$1 then v126$1 else $$5$8bv32$1);
    $$5$8bv32$2 := (if p1$2 then v126$2 else $$5$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v127$1 := (if p1$1 then _HAVOC_bv8$1 else v127$1);
    v127$2 := (if p1$2 then _HAVOC_bv8$2 else v127$2);
    $$5$9bv32$1 := (if p1$1 then v127$1 else $$5$9bv32$1);
    $$5$9bv32$2 := (if p1$2 then v127$2 else $$5$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v128$1 := (if p1$1 then _HAVOC_bv8$1 else v128$1);
    v128$2 := (if p1$2 then _HAVOC_bv8$2 else v128$2);
    $$5$10bv32$1 := (if p1$1 then v128$1 else $$5$10bv32$1);
    $$5$10bv32$2 := (if p1$2 then v128$2 else $$5$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v129$1 := (if p1$1 then _HAVOC_bv8$1 else v129$1);
    v129$2 := (if p1$2 then _HAVOC_bv8$2 else v129$2);
    $$5$11bv32$1 := (if p1$1 then v129$1 else $$5$11bv32$1);
    $$5$11bv32$2 := (if p1$2 then v129$2 else $$5$11bv32$2);
    v130$1 := (if p1$1 then $$5$0bv32$1 else v130$1);
    v130$2 := (if p1$2 then $$5$0bv32$2 else v130$2);
    v131$1 := (if p1$1 then $$5$1bv32$1 else v131$1);
    v131$2 := (if p1$2 then $$5$1bv32$2 else v131$2);
    v132$1 := (if p1$1 then $$5$2bv32$1 else v132$1);
    v132$2 := (if p1$2 then $$5$2bv32$2 else v132$2);
    v133$1 := (if p1$1 then $$5$3bv32$1 else v133$1);
    v133$2 := (if p1$2 then $$5$3bv32$2 else v133$2);
    v134$1 := (if p1$1 then $$5$4bv32$1 else v134$1);
    v134$2 := (if p1$2 then $$5$4bv32$2 else v134$2);
    v135$1 := (if p1$1 then $$5$5bv32$1 else v135$1);
    v135$2 := (if p1$2 then $$5$5bv32$2 else v135$2);
    v136$1 := (if p1$1 then $$5$6bv32$1 else v136$1);
    v136$2 := (if p1$2 then $$5$6bv32$2 else v136$2);
    v137$1 := (if p1$1 then $$5$7bv32$1 else v137$1);
    v137$2 := (if p1$2 then $$5$7bv32$2 else v137$2);
    v138$1 := (if p1$1 then $$5$8bv32$1 else v138$1);
    v138$2 := (if p1$2 then $$5$8bv32$2 else v138$2);
    v139$1 := (if p1$1 then $$5$9bv32$1 else v139$1);
    v139$2 := (if p1$2 then $$5$9bv32$2 else v139$2);
    v140$1 := (if p1$1 then $$5$10bv32$1 else v140$1);
    v140$2 := (if p1$2 then $$5$10bv32$2 else v140$2);
    v141$1 := (if p1$1 then $$5$11bv32$1 else v141$1);
    v141$2 := (if p1$2 then $$5$11bv32$2 else v141$2);
    call {:sourceloc_num 233} v142$1, v142$2 := $_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff(p1$1, v133$1 ++ v132$1 ++ v131$1 ++ v130$1, v137$1 ++ v136$1 ++ v135$1 ++ v134$1, v141$1 ++ v140$1 ++ v139$1 ++ v138$1, v2$1, v3$1, p1$2, v133$2 ++ v132$2 ++ v131$2 ++ v130$2, v137$2 ++ v136$2 ++ v135$2 ++ v134$2, v141$2 ++ v140$2 ++ v139$2 ++ v138$2, v2$2, v3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff"} true;
    $$clr00$0bv32$1 := (if p1$1 then v142$1[32:0] else $$clr00$0bv32$1);
    $$clr00$0bv32$2 := (if p1$2 then v142$2[32:0] else $$clr00$0bv32$2);
    $$clr00$1bv32$1 := (if p1$1 then v142$1[64:32] else $$clr00$1bv32$1);
    $$clr00$1bv32$2 := (if p1$2 then v142$2[64:32] else $$clr00$1bv32$2);
    $$clr00$2bv32$1 := (if p1$1 then v142$1[96:64] else $$clr00$2bv32$1);
    $$clr00$2bv32$2 := (if p1$2 then v142$2[96:64] else $$clr00$2bv32$2);
    $$clr00$3bv32$1 := (if p1$1 then v142$1[128:96] else $$clr00$3bv32$1);
    $$clr00$3bv32$2 := (if p1$2 then v142$2[128:96] else $$clr00$3bv32$2);
    v143$1 := (if p1$1 then $$clr$0bv32$1 else v143$1);
    v143$2 := (if p1$2 then $$clr$0bv32$2 else v143$2);
    v144$1 := (if p1$1 then $$clr00$0bv32$1 else v144$1);
    v144$2 := (if p1$2 then $$clr00$0bv32$2 else v144$2);
    call {:sourceloc_num 240} v145$1, v145$2 := $_Z5lerpffff(p1$1, v143$1, v144$1, $0$1, p1$2, v143$2, v144$2, $0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5lerpffff"} true;
    $$clr$0bv32$1 := (if p1$1 then v145$1 else $$clr$0bv32$1);
    $$clr$0bv32$2 := (if p1$2 then v145$2 else $$clr$0bv32$2);
    v146$1 := (if p1$1 then $$clr$1bv32$1 else v146$1);
    v146$2 := (if p1$2 then $$clr$1bv32$2 else v146$2);
    v147$1 := (if p1$1 then $$clr00$1bv32$1 else v147$1);
    v147$2 := (if p1$2 then $$clr00$1bv32$2 else v147$2);
    call {:sourceloc_num 244} v148$1, v148$2 := $_Z5lerpffff(p1$1, v146$1, v147$1, $0$1, p1$2, v146$2, v147$2, $0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5lerpffff"} true;
    $$clr$1bv32$1 := (if p1$1 then v148$1 else $$clr$1bv32$1);
    $$clr$1bv32$2 := (if p1$2 then v148$2 else $$clr$1bv32$2);
    v149$1 := (if p1$1 then $$clr$2bv32$1 else v149$1);
    v149$2 := (if p1$2 then $$clr$2bv32$2 else v149$2);
    v150$1 := (if p1$1 then $$clr00$2bv32$1 else v150$1);
    v150$2 := (if p1$2 then $$clr00$2bv32$2 else v150$2);
    call {:sourceloc_num 248} v151$1, v151$2 := $_Z5lerpffff(p1$1, v149$1, v150$1, $0$1, p1$2, v149$2, v150$2, $0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5lerpffff"} true;
    $$clr$2bv32$1 := (if p1$1 then v151$1 else $$clr$2bv32$1);
    $$clr$2bv32$2 := (if p1$2 then v151$2 else $$clr$2bv32$2);
    v152$1 := (if p1$1 then $$clr$0bv32$1 else v152$1);
    v152$2 := (if p1$2 then $$clr$0bv32$2 else v152$2);
    v153$1 := (if p1$1 then $$clr$1bv32$1 else v153$1);
    v153$2 := (if p1$2 then $$clr$1bv32$2 else v153$2);
    v154$1 := (if p1$1 then $$clr$2bv32$1 else v154$1);
    v154$2 := (if p1$2 then $$clr$2bv32$2 else v154$2);
    call {:sourceloc} {:sourceloc_num 253} _LOG_WRITE_$$dst(p1$1, BV32_ADD(BV32_MUL($imageW, v1$1), v0$1), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_SI32(FMUL32(0bv32, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_SI32(FMUL32(v154$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_SI32(FMUL32(v153$1, 1132396544bv32)), 8bv32)), FP32_TO_SI32(FMUL32(v152$1, 1132396544bv32))), $$dst[BV32_ADD(BV32_MUL($imageW, v1$1), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dst(p1$2, BV32_ADD(BV32_MUL($imageW, v1$2), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 253} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 253} _CHECK_WRITE_$$dst(p1$2, BV32_ADD(BV32_MUL($imageW, v1$2), v0$2), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_SI32(FMUL32(0bv32, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_SI32(FMUL32(v154$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_SI32(FMUL32(v153$2, 1132396544bv32)), 8bv32)), FP32_TO_SI32(FMUL32(v152$2, 1132396544bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dst"} true;
    $$dst[BV32_ADD(BV32_MUL($imageW, v1$1), v0$1)] := (if p1$1 then BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_SI32(FMUL32(0bv32, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_SI32(FMUL32(v154$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_SI32(FMUL32(v153$1, 1132396544bv32)), 8bv32)), FP32_TO_SI32(FMUL32(v152$1, 1132396544bv32))) else $$dst[BV32_ADD(BV32_MUL($imageW, v1$1), v0$1)]);
    $$dst[BV32_ADD(BV32_MUL($imageW, v1$2), v0$2)] := (if p1$2 then BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_SI32(FMUL32(0bv32, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_SI32(FMUL32(v154$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_SI32(FMUL32(v153$2, 1132396544bv32)), 8bv32)), FP32_TO_SI32(FMUL32(v152$2, 1132396544bv32))) else $$dst[BV32_ADD(BV32_MUL($imageW, v1$2), v0$2)]);
    return;

  $11.backedge:
    assume {:backedge} p6$1 || p6$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $11;

  $13.backedge:
    assume {:backedge} p8$1 || p8$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $13;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $3;

  $5.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $5;
}



procedure {:source_name "_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff"} $_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff(_P$1: bool, $0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32) returns ($ret$1: bv128, $ret$2: bv128);



procedure {:source_name "__expf"} $__expf(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "_Z5lerpffff"} $_Z5lerpffff(_P$1: bool, $0$1: bv32, $1$1: bv32, $2$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32, $2$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



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

procedure {:inline 1} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  requires {:barrier_divergence} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 == _P$2;
  modifies $$_ZZ4NLM2PjiiffE8fWeights, $$dst, _TRACKING;



var $$a.i$0bv32$1: bv32;

var $$a.i$0bv32$2: bv32;

var $$a.i$1bv32$1: bv32;

var $$a.i$1bv32$2: bv32;

var $$a.i$2bv32$1: bv32;

var $$a.i$2bv32$2: bv32;

var $$a.i$3bv32$1: bv32;

var $$a.i$3bv32$2: bv32;

var $$b.i$0bv32$1: bv32;

var $$b.i$0bv32$2: bv32;

var $$b.i$1bv32$1: bv32;

var $$b.i$1bv32$2: bv32;

var $$b.i$2bv32$1: bv32;

var $$b.i$2bv32$2: bv32;

var $$b.i$3bv32$1: bv32;

var $$b.i$3bv32$2: bv32;

var $$0$0bv32$1: bv32;

var $$0$0bv32$2: bv32;

var $$0$1bv32$1: bv32;

var $$0$1bv32$2: bv32;

var $$0$2bv32$1: bv32;

var $$0$2bv32$2: bv32;

var $$0$3bv32$1: bv32;

var $$0$3bv32$2: bv32;

var $$1$0bv32$1: bv8;

var $$1$0bv32$2: bv8;

var $$1$1bv32$1: bv8;

var $$1$1bv32$2: bv8;

var $$1$2bv32$1: bv8;

var $$1$2bv32$2: bv8;

var $$1$3bv32$1: bv8;

var $$1$3bv32$2: bv8;

var $$1$4bv32$1: bv8;

var $$1$4bv32$2: bv8;

var $$1$5bv32$1: bv8;

var $$1$5bv32$2: bv8;

var $$1$6bv32$1: bv8;

var $$1$6bv32$2: bv8;

var $$1$7bv32$1: bv8;

var $$1$7bv32$2: bv8;

var $$1$8bv32$1: bv8;

var $$1$8bv32$2: bv8;

var $$1$9bv32$1: bv8;

var $$1$9bv32$2: bv8;

var $$1$10bv32$1: bv8;

var $$1$10bv32$2: bv8;

var $$1$11bv32$1: bv8;

var $$1$11bv32$2: bv8;

var $$2$0bv32$1: bv32;

var $$2$0bv32$2: bv32;

var $$2$1bv32$1: bv32;

var $$2$1bv32$2: bv32;

var $$2$2bv32$1: bv32;

var $$2$2bv32$2: bv32;

var $$2$3bv32$1: bv32;

var $$2$3bv32$2: bv32;

var $$3$0bv32$1: bv8;

var $$3$0bv32$2: bv8;

var $$3$1bv32$1: bv8;

var $$3$1bv32$2: bv8;

var $$3$2bv32$1: bv8;

var $$3$2bv32$2: bv8;

var $$3$3bv32$1: bv8;

var $$3$3bv32$2: bv8;

var $$3$4bv32$1: bv8;

var $$3$4bv32$2: bv8;

var $$3$5bv32$1: bv8;

var $$3$5bv32$2: bv8;

var $$3$6bv32$1: bv8;

var $$3$6bv32$2: bv8;

var $$3$7bv32$1: bv8;

var $$3$7bv32$2: bv8;

var $$3$8bv32$1: bv8;

var $$3$8bv32$2: bv8;

var $$3$9bv32$1: bv8;

var $$3$9bv32$2: bv8;

var $$3$10bv32$1: bv8;

var $$3$10bv32$2: bv8;

var $$3$11bv32$1: bv8;

var $$3$11bv32$2: bv8;

var $$clr$0bv32$1: bv32;

var $$clr$0bv32$2: bv32;

var $$clr$1bv32$1: bv32;

var $$clr$1bv32$2: bv32;

var $$clr$2bv32$1: bv32;

var $$clr$2bv32$2: bv32;

var $$clrIJ$0bv32$1: bv32;

var $$clrIJ$0bv32$2: bv32;

var $$clrIJ$1bv32$1: bv32;

var $$clrIJ$1bv32$2: bv32;

var $$clrIJ$2bv32$1: bv32;

var $$clrIJ$2bv32$2: bv32;

var $$clrIJ$3bv32$1: bv32;

var $$clrIJ$3bv32$2: bv32;

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

var $$clr00$0bv32$1: bv32;

var $$clr00$0bv32$2: bv32;

var $$clr00$1bv32$1: bv32;

var $$clr00$1bv32$2: bv32;

var $$clr00$2bv32$1: bv32;

var $$clr00$2bv32$2: bv32;

var $$clr00$3bv32$1: bv32;

var $$clr00$3bv32$2: bv32;

var $$5$0bv32$1: bv8;

var $$5$0bv32$2: bv8;

var $$5$1bv32$1: bv8;

var $$5$1bv32$2: bv8;

var $$5$2bv32$1: bv8;

var $$5$2bv32$2: bv8;

var $$5$3bv32$1: bv8;

var $$5$3bv32$2: bv8;

var $$5$4bv32$1: bv8;

var $$5$4bv32$2: bv8;

var $$5$5bv32$1: bv8;

var $$5$5bv32$2: bv8;

var $$5$6bv32$1: bv8;

var $$5$6bv32$2: bv8;

var $$5$7bv32$1: bv8;

var $$5$7bv32$2: bv8;

var $$5$8bv32$1: bv8;

var $$5$8bv32$2: bv8;

var $$5$9bv32$1: bv8;

var $$5$9bv32$2: bv8;

var $$5$10bv32$1: bv8;

var $$5$10bv32$2: bv8;

var $$5$11bv32$1: bv8;

var $$5$11bv32$2: bv8;

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



const _WATCHED_VALUE_$$_ZZ4NLM2PjiiffE8fWeights: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ4NLM2PjiiffE8fWeights(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights;



implementation {:inline 1} _LOG_READ_$$_ZZ4NLM2PjiiffE8fWeights(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ4NLM2PjiiffE8fWeights == _value then true else _READ_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights);
    return;
}



procedure _CHECK_READ_$$_ZZ4NLM2PjiiffE8fWeights(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "fWeights"} {:array "$$_ZZ4NLM2PjiiffE8fWeights"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ4NLM2PjiiffE8fWeights && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "fWeights"} {:array "$$_ZZ4NLM2PjiiffE8fWeights"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ4NLM2PjiiffE8fWeights: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ4NLM2PjiiffE8fWeights(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights, _WRITE_READ_BENIGN_FLAG_$$_ZZ4NLM2PjiiffE8fWeights;



implementation {:inline 1} _LOG_WRITE_$$_ZZ4NLM2PjiiffE8fWeights(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ4NLM2PjiiffE8fWeights == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ4NLM2PjiiffE8fWeights := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ4NLM2PjiiffE8fWeights == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ4NLM2PjiiffE8fWeights);
    return;
}



procedure _CHECK_WRITE_$$_ZZ4NLM2PjiiffE8fWeights(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "fWeights"} {:array "$$_ZZ4NLM2PjiiffE8fWeights"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ4NLM2PjiiffE8fWeights != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "fWeights"} {:array "$$_ZZ4NLM2PjiiffE8fWeights"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ4NLM2PjiiffE8fWeights != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "fWeights"} {:array "$$_ZZ4NLM2PjiiffE8fWeights"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ4NLM2PjiiffE8fWeights(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ4NLM2PjiiffE8fWeights(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ4NLM2PjiiffE8fWeights(_P: bool, _offset: bv32);
  requires {:source_name "fWeights"} {:array "$$_ZZ4NLM2PjiiffE8fWeights"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "fWeights"} {:array "$$_ZZ4NLM2PjiiffE8fWeights"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ4NLM2PjiiffE8fWeights(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ4NLM2PjiiffE8fWeights;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ4NLM2PjiiffE8fWeights(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ4NLM2PjiiffE8fWeights := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ4NLM2PjiiffE8fWeights);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ4NLM2PjiiffE8fWeights;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$dst;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$dst;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$dst;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$dst;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$_ZZ4NLM2PjiiffE8fWeights;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
