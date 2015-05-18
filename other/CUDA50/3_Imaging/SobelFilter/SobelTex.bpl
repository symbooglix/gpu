type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "pSobelOriginal"} {:global} $$pSobelOriginal: [bv32]bv8;

axiom {:array_info "$$pSobelOriginal"} {:global} {:elem_width 8} {:source_name "pSobelOriginal"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$pSobelOriginal: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$pSobelOriginal: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$pSobelOriginal: bool;

axiom {:array_info "$$0"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$8"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$tex"} {:global} {:elem_width 8} {:source_name "tex"} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$tex: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$tex: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$tex: bool;

const _WATCHED_OFFSET: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

const {:group_size_x} group_size_x: bv32;

const {:group_size_y} group_size_y: bv32;

const {:group_size_z} group_size_z: bv32;

const {:local_id_x} local_id_x$1: bv32;

const {:local_id_x} local_id_x$2: bv32;

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function FADD32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FP32_TO_SI16(bv32) : bv16;

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "sign_extend 16"} BV16_SEXT32(bv16) : bv32;

function {:bvbuiltin "zero_extend 24"} BV8_ZEXT32(bv8) : bv32;

procedure {:source_name "SobelTex"} {:kernel} $_Z8SobelTexPhjiif($Pitch: bv32, $w: bv32, $h: bv32, $fScale: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $w == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $Pitch == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$pSobelOriginal && !_WRITE_HAS_OCCURRED_$$pSobelOriginal && !_ATOMIC_HAS_OCCURRED_$$pSobelOriginal;
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
  modifies _WRITE_HAS_OCCURRED_$$pSobelOriginal, _WRITE_READ_BENIGN_FLAG_$$pSobelOriginal, _WRITE_READ_BENIGN_FLAG_$$pSobelOriginal;



implementation {:source_name "SobelTex"} {:kernel} $_Z8SobelTexPhjiif($Pitch: bv32, $w: bv32, $h: bv32, $fScale: bv32)
{
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $.0$1: bv8;
  var $.0$2: bv8;
  var v0$1: bool;
  var v0$2: bool;
  var v1$1: bv8;
  var v1$2: bv8;
  var v2$1: bv8;
  var v2$2: bv8;
  var v3$1: bv8;
  var v3$2: bv8;
  var v4$1: bv8;
  var v4$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v5$1: bv8;
  var v5$2: bv8;
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v8$1: bv8;
  var v8$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
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
  var v34$1: bv8;
  var v34$2: bv8;
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
  var v66$1: bv8;
  var v66$2: bv8;
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
  var v57$1: bv8;
  var v57$2: bv8;
  var v58$1: bv8;
  var v58$2: bv8;
  var v59$1: bv8;
  var v59$2: bv8;
  var v60$1: bv8;
  var v60$2: bv8;
  var v61$1: bv8;
  var v61$2: bv8;
  var v62$1: bv8;
  var v62$2: bv8;
  var v63$1: bv8;
  var v63$2: bv8;
  var v64$1: bv8;
  var v64$2: bv8;
  var v65$1: bv8;
  var v65$2: bv8;
  var v132$1: bv8;
  var v132$2: bv8;
  var v133$1: bv8;
  var v133$2: bv8;
  var v67$1: bv8;
  var v67$2: bv8;
  var v68$1: bv8;
  var v68$2: bv8;
  var v69$1: bv8;
  var v69$2: bv8;
  var v70$1: bv8;
  var v70$2: bv8;
  var v71$1: bv8;
  var v71$2: bv8;
  var v72$1: bv8;
  var v72$2: bv8;
  var v73$1: bv8;
  var v73$2: bv8;
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
  var v86$1: bv8;
  var v86$2: bv8;
  var v87$1: bv8;
  var v87$2: bv8;
  var v88$1: bv8;
  var v88$2: bv8;
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
  var v96$1: bv8;
  var v96$2: bv8;
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
  var v106$1: bv8;
  var v106$2: bv8;
  var v107$1: bv8;
  var v107$2: bv8;
  var v108$1: bv8;
  var v108$2: bv8;
  var v109$1: bv8;
  var v109$2: bv8;
  var v110$1: bv8;
  var v110$2: bv8;
  var v111$1: bv8;
  var v111$2: bv8;
  var v112$1: bv8;
  var v112$2: bv8;
  var v113$1: bv8;
  var v113$2: bv8;
  var v114$1: bv8;
  var v114$2: bv8;
  var v115$1: bv8;
  var v115$2: bv8;
  var v116$1: bv8;
  var v116$2: bv8;
  var v117$1: bv8;
  var v117$2: bv8;
  var v118$1: bv8;
  var v118$2: bv8;
  var v119$1: bv8;
  var v119$2: bv8;
  var v120$1: bv8;
  var v120$2: bv8;
  var v121$1: bv8;
  var v121$2: bv8;
  var v122$1: bv8;
  var v122$2: bv8;
  var v123$1: bv8;
  var v123$2: bv8;
  var v124$1: bv8;
  var v124$2: bv8;
  var v125$1: bv8;
  var v125$2: bv8;
  var v126$1: bv8;
  var v126$2: bv8;
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
  var v134$1: bv8;
  var v134$2: bv8;
  var v135$1: bv8;
  var v135$2: bv8;
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
  var v142$1: bv8;
  var v142$2: bv8;
  var v143$1: bv8;
  var v143$2: bv8;
  var v144$1: bv8;
  var v144$2: bv8;
  var v145$1: bv8;
  var v145$2: bv8;
  var v146$1: bv8;
  var v146$2: bv8;
  var v147$1: bv8;
  var v147$2: bv8;
  var v148$1: bv8;
  var v148$2: bv8;
  var v149$1: bv8;
  var v149$2: bv8;
  var v150$1: bv8;
  var v150$2: bv8;
  var v151$1: bv8;
  var v151$2: bv8;
  var v152$1: bv8;
  var v152$2: bv8;
  var v153$1: bv8;
  var v153$2: bv8;
  var v154$1: bv8;
  var v154$2: bv8;
  var v155$1: bv8;
  var v155$2: bv8;
  var v156$1: bv8;
  var v156$2: bv8;
  var v157$1: bv8;
  var v157$2: bv8;
  var v158$1: bv8;
  var v158$2: bv8;
  var v159$1: bv8;
  var v159$2: bv8;
  var v160$1: bv8;
  var v160$2: bv8;
  var v161$1: bv8;
  var v161$2: bv8;
  var v162$1: bv8;
  var v162$2: bv8;
  var v163$1: bv8;
  var v163$2: bv8;
  var v164$1: bv8;
  var v164$2: bv8;
  var v165$1: bv8;
  var v165$2: bv8;
  var v166$1: bv8;
  var v166$2: bv8;
  var v167$1: bv8;
  var v167$2: bv8;
  var v168$1: bv8;
  var v168$2: bv8;
  var v169$1: bv8;
  var v169$2: bv8;
  var v170$1: bv8;
  var v170$2: bv8;
  var v171$1: bv8;
  var v171$2: bv8;
  var v172$1: bv8;
  var v172$2: bv8;
  var v173$1: bv8;
  var v173$2: bv8;
  var v174$1: bv8;
  var v174$2: bv8;
  var v175$1: bv8;
  var v175$2: bv8;
  var v176$1: bv8;
  var v176$2: bv8;
  var v177$1: bv8;
  var v177$2: bv8;
  var v178$1: bv8;
  var v178$2: bv8;
  var v179$1: bv8;
  var v179$2: bv8;
  var v180$1: bv8;
  var v180$2: bv8;
  var v181$1: bv8;
  var v181$2: bv8;
  var v182$1: bv8;
  var v182$2: bv8;
  var v183$1: bv8;
  var v183$2: bv8;
  var v184$1: bv8;
  var v184$2: bv8;
  var v185$1: bv8;
  var v185$2: bv8;
  var v186$1: bv8;
  var v186$2: bv8;
  var v187$1: bv8;
  var v187$2: bv8;
  var v188$1: bv8;
  var v188$2: bv8;
  var v189$1: bv8;
  var v189$2: bv8;
  var v190$1: bv8;
  var v190$2: bv8;
  var v191$1: bv8;
  var v191$2: bv8;
  var v192$1: bv8;
  var v192$2: bv8;
  var v193$1: bv8;
  var v193$2: bv8;
  var v194$1: bv8;
  var v194$2: bv8;
  var v195$1: bv8;
  var v195$2: bv8;
  var v196$1: bv8;
  var v196$2: bv8;
  var v197$1: bv8;
  var v197$2: bv8;
  var v198$1: bv8;
  var v198$2: bv8;
  var v199$1: bv32;
  var v199$2: bv32;
  var v200$1: bv32;
  var v200$2: bv32;
  var v201$1: bv16;
  var v201$2: bv16;
  var v202$1: bool;
  var v202$2: bool;
  var v203$1: bool;
  var v203$2: bool;
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
  var _HAVOC_bv8$1: bv8;
  var _HAVOC_bv8$2: bv8;


  $0:
    $i.0$1 := local_id_x$1;
    $i.0$2 := local_id_x$2;
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 3} p0$1 ==> true;
    v0$1 := (if p0$1 then BV32_SLT($i.0$1, $w) else v0$1);
    v0$2 := (if p0$2 then BV32_SLT($i.0$2, $w) else v0$2);
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
    p1$1 := (if p0$1 && v0$1 then v0$1 else p1$1);
    p1$2 := (if p0$2 && v0$2 then v0$2 else p1$2);
    p0$1 := (if p0$1 && !v0$1 then v0$1 else p0$1);
    p0$2 := (if p0$2 && !v0$2 then v0$2 else p0$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v1$1 := (if p1$1 then _HAVOC_bv8$1 else v1$1);
    v1$2 := (if p1$2 then _HAVOC_bv8$2 else v1$2);
    $$0$0bv32$1 := (if p1$1 then v1$1 else $$0$0bv32$1);
    $$0$0bv32$2 := (if p1$2 then v1$2 else $$0$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v2$1 := (if p1$1 then _HAVOC_bv8$1 else v2$1);
    v2$2 := (if p1$2 then _HAVOC_bv8$2 else v2$2);
    $$0$1bv32$1 := (if p1$1 then v2$1 else $$0$1bv32$1);
    $$0$1bv32$2 := (if p1$2 then v2$2 else $$0$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v3$1 := (if p1$1 then _HAVOC_bv8$1 else v3$1);
    v3$2 := (if p1$2 then _HAVOC_bv8$2 else v3$2);
    $$0$2bv32$1 := (if p1$1 then v3$1 else $$0$2bv32$1);
    $$0$2bv32$2 := (if p1$2 then v3$2 else $$0$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v4$1 := (if p1$1 then _HAVOC_bv8$1 else v4$1);
    v4$2 := (if p1$2 then _HAVOC_bv8$2 else v4$2);
    $$0$3bv32$1 := (if p1$1 then v4$1 else $$0$3bv32$1);
    $$0$3bv32$2 := (if p1$2 then v4$2 else $$0$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v5$1 := (if p1$1 then _HAVOC_bv8$1 else v5$1);
    v5$2 := (if p1$2 then _HAVOC_bv8$2 else v5$2);
    $$0$4bv32$1 := (if p1$1 then v5$1 else $$0$4bv32$1);
    $$0$4bv32$2 := (if p1$2 then v5$2 else $$0$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v6$1 := (if p1$1 then _HAVOC_bv8$1 else v6$1);
    v6$2 := (if p1$2 then _HAVOC_bv8$2 else v6$2);
    $$0$5bv32$1 := (if p1$1 then v6$1 else $$0$5bv32$1);
    $$0$5bv32$2 := (if p1$2 then v6$2 else $$0$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v7$1 := (if p1$1 then _HAVOC_bv8$1 else v7$1);
    v7$2 := (if p1$2 then _HAVOC_bv8$2 else v7$2);
    $$0$6bv32$1 := (if p1$1 then v7$1 else $$0$6bv32$1);
    $$0$6bv32$2 := (if p1$2 then v7$2 else $$0$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v8$1 := (if p1$1 then _HAVOC_bv8$1 else v8$1);
    v8$2 := (if p1$2 then _HAVOC_bv8$2 else v8$2);
    $$0$7bv32$1 := (if p1$1 then v8$1 else $$0$7bv32$1);
    $$0$7bv32$2 := (if p1$2 then v8$2 else $$0$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v9$1 := (if p1$1 then _HAVOC_bv8$1 else v9$1);
    v9$2 := (if p1$2 then _HAVOC_bv8$2 else v9$2);
    $$0$8bv32$1 := (if p1$1 then v9$1 else $$0$8bv32$1);
    $$0$8bv32$2 := (if p1$2 then v9$2 else $$0$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v10$1 := (if p1$1 then _HAVOC_bv8$1 else v10$1);
    v10$2 := (if p1$2 then _HAVOC_bv8$2 else v10$2);
    $$0$9bv32$1 := (if p1$1 then v10$1 else $$0$9bv32$1);
    $$0$9bv32$2 := (if p1$2 then v10$2 else $$0$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v11$1 := (if p1$1 then _HAVOC_bv8$1 else v11$1);
    v11$2 := (if p1$2 then _HAVOC_bv8$2 else v11$2);
    $$0$10bv32$1 := (if p1$1 then v11$1 else $$0$10bv32$1);
    $$0$10bv32$2 := (if p1$2 then v11$2 else $$0$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v12$1 := (if p1$1 then _HAVOC_bv8$1 else v12$1);
    v12$2 := (if p1$2 then _HAVOC_bv8$2 else v12$2);
    $$0$11bv32$1 := (if p1$1 then v12$1 else $$0$11bv32$1);
    $$0$11bv32$2 := (if p1$2 then v12$2 else $$0$11bv32$2);
    v13$1 := (if p1$1 then $$0$0bv32$1 else v13$1);
    v13$2 := (if p1$2 then $$0$0bv32$2 else v13$2);
    v14$1 := (if p1$1 then $$0$4bv32$1 else v14$1);
    v14$2 := (if p1$2 then $$0$4bv32$2 else v14$2);
    v15$1 := (if p1$1 then $$0$5bv32$1 else v15$1);
    v15$2 := (if p1$2 then $$0$5bv32$2 else v15$2);
    v16$1 := (if p1$1 then $$0$6bv32$1 else v16$1);
    v16$2 := (if p1$2 then $$0$6bv32$2 else v16$2);
    v17$1 := (if p1$1 then $$0$7bv32$1 else v17$1);
    v17$2 := (if p1$2 then $$0$7bv32$2 else v17$2);
    v18$1 := (if p1$1 then $$0$8bv32$1 else v18$1);
    v18$2 := (if p1$2 then $$0$8bv32$2 else v18$2);
    v19$1 := (if p1$1 then $$0$9bv32$1 else v19$1);
    v19$2 := (if p1$2 then $$0$9bv32$2 else v19$2);
    v20$1 := (if p1$1 then $$0$10bv32$1 else v20$1);
    v20$2 := (if p1$2 then $$0$10bv32$2 else v20$2);
    v21$1 := (if p1$1 then $$0$11bv32$1 else v21$1);
    v21$2 := (if p1$2 then $$0$11bv32$2 else v21$2);
    call {:sourceloc_num 38} v22$1, v22$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p1$1, v13$1, v17$1 ++ v16$1 ++ v15$1 ++ v14$1, v21$1 ++ v20$1 ++ v19$1 ++ v18$1, FSUB32(SI32_TO_FP32($i.0$1), 1065353216bv32), FSUB32(UI32_TO_FP32(group_id_x$1), 1065353216bv32), p1$2, v13$2, v17$2 ++ v16$2 ++ v15$2 ++ v14$2, v21$2 ++ v20$2 ++ v19$2 ++ v18$2, FSUB32(SI32_TO_FP32($i.0$2), 1065353216bv32), FSUB32(UI32_TO_FP32(group_id_x$2), 1065353216bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v23$1 := (if p1$1 then _HAVOC_bv8$1 else v23$1);
    v23$2 := (if p1$2 then _HAVOC_bv8$2 else v23$2);
    $$1$0bv32$1 := (if p1$1 then v23$1 else $$1$0bv32$1);
    $$1$0bv32$2 := (if p1$2 then v23$2 else $$1$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v24$1 := (if p1$1 then _HAVOC_bv8$1 else v24$1);
    v24$2 := (if p1$2 then _HAVOC_bv8$2 else v24$2);
    $$1$1bv32$1 := (if p1$1 then v24$1 else $$1$1bv32$1);
    $$1$1bv32$2 := (if p1$2 then v24$2 else $$1$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v25$1 := (if p1$1 then _HAVOC_bv8$1 else v25$1);
    v25$2 := (if p1$2 then _HAVOC_bv8$2 else v25$2);
    $$1$2bv32$1 := (if p1$1 then v25$1 else $$1$2bv32$1);
    $$1$2bv32$2 := (if p1$2 then v25$2 else $$1$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v26$1 := (if p1$1 then _HAVOC_bv8$1 else v26$1);
    v26$2 := (if p1$2 then _HAVOC_bv8$2 else v26$2);
    $$1$3bv32$1 := (if p1$1 then v26$1 else $$1$3bv32$1);
    $$1$3bv32$2 := (if p1$2 then v26$2 else $$1$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v27$1 := (if p1$1 then _HAVOC_bv8$1 else v27$1);
    v27$2 := (if p1$2 then _HAVOC_bv8$2 else v27$2);
    $$1$4bv32$1 := (if p1$1 then v27$1 else $$1$4bv32$1);
    $$1$4bv32$2 := (if p1$2 then v27$2 else $$1$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v28$1 := (if p1$1 then _HAVOC_bv8$1 else v28$1);
    v28$2 := (if p1$2 then _HAVOC_bv8$2 else v28$2);
    $$1$5bv32$1 := (if p1$1 then v28$1 else $$1$5bv32$1);
    $$1$5bv32$2 := (if p1$2 then v28$2 else $$1$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v29$1 := (if p1$1 then _HAVOC_bv8$1 else v29$1);
    v29$2 := (if p1$2 then _HAVOC_bv8$2 else v29$2);
    $$1$6bv32$1 := (if p1$1 then v29$1 else $$1$6bv32$1);
    $$1$6bv32$2 := (if p1$2 then v29$2 else $$1$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v30$1 := (if p1$1 then _HAVOC_bv8$1 else v30$1);
    v30$2 := (if p1$2 then _HAVOC_bv8$2 else v30$2);
    $$1$7bv32$1 := (if p1$1 then v30$1 else $$1$7bv32$1);
    $$1$7bv32$2 := (if p1$2 then v30$2 else $$1$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v31$1 := (if p1$1 then _HAVOC_bv8$1 else v31$1);
    v31$2 := (if p1$2 then _HAVOC_bv8$2 else v31$2);
    $$1$8bv32$1 := (if p1$1 then v31$1 else $$1$8bv32$1);
    $$1$8bv32$2 := (if p1$2 then v31$2 else $$1$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v32$1 := (if p1$1 then _HAVOC_bv8$1 else v32$1);
    v32$2 := (if p1$2 then _HAVOC_bv8$2 else v32$2);
    $$1$9bv32$1 := (if p1$1 then v32$1 else $$1$9bv32$1);
    $$1$9bv32$2 := (if p1$2 then v32$2 else $$1$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v33$1 := (if p1$1 then _HAVOC_bv8$1 else v33$1);
    v33$2 := (if p1$2 then _HAVOC_bv8$2 else v33$2);
    $$1$10bv32$1 := (if p1$1 then v33$1 else $$1$10bv32$1);
    $$1$10bv32$2 := (if p1$2 then v33$2 else $$1$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v34$1 := (if p1$1 then _HAVOC_bv8$1 else v34$1);
    v34$2 := (if p1$2 then _HAVOC_bv8$2 else v34$2);
    $$1$11bv32$1 := (if p1$1 then v34$1 else $$1$11bv32$1);
    $$1$11bv32$2 := (if p1$2 then v34$2 else $$1$11bv32$2);
    v35$1 := (if p1$1 then $$1$0bv32$1 else v35$1);
    v35$2 := (if p1$2 then $$1$0bv32$2 else v35$2);
    v36$1 := (if p1$1 then $$1$4bv32$1 else v36$1);
    v36$2 := (if p1$2 then $$1$4bv32$2 else v36$2);
    v37$1 := (if p1$1 then $$1$5bv32$1 else v37$1);
    v37$2 := (if p1$2 then $$1$5bv32$2 else v37$2);
    v38$1 := (if p1$1 then $$1$6bv32$1 else v38$1);
    v38$2 := (if p1$2 then $$1$6bv32$2 else v38$2);
    v39$1 := (if p1$1 then $$1$7bv32$1 else v39$1);
    v39$2 := (if p1$2 then $$1$7bv32$2 else v39$2);
    v40$1 := (if p1$1 then $$1$8bv32$1 else v40$1);
    v40$2 := (if p1$2 then $$1$8bv32$2 else v40$2);
    v41$1 := (if p1$1 then $$1$9bv32$1 else v41$1);
    v41$2 := (if p1$2 then $$1$9bv32$2 else v41$2);
    v42$1 := (if p1$1 then $$1$10bv32$1 else v42$1);
    v42$2 := (if p1$2 then $$1$10bv32$2 else v42$2);
    v43$1 := (if p1$1 then $$1$11bv32$1 else v43$1);
    v43$2 := (if p1$2 then $$1$11bv32$2 else v43$2);
    call {:sourceloc_num 72} v44$1, v44$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p1$1, v35$1, v39$1 ++ v38$1 ++ v37$1 ++ v36$1, v43$1 ++ v42$1 ++ v41$1 ++ v40$1, FADD32(SI32_TO_FP32($i.0$1), 0bv32), FSUB32(UI32_TO_FP32(group_id_x$1), 1065353216bv32), p1$2, v35$2, v39$2 ++ v38$2 ++ v37$2 ++ v36$2, v43$2 ++ v42$2 ++ v41$2 ++ v40$2, FADD32(SI32_TO_FP32($i.0$2), 0bv32), FSUB32(UI32_TO_FP32(group_id_x$2), 1065353216bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v45$1 := (if p1$1 then _HAVOC_bv8$1 else v45$1);
    v45$2 := (if p1$2 then _HAVOC_bv8$2 else v45$2);
    $$2$0bv32$1 := (if p1$1 then v45$1 else $$2$0bv32$1);
    $$2$0bv32$2 := (if p1$2 then v45$2 else $$2$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v46$1 := (if p1$1 then _HAVOC_bv8$1 else v46$1);
    v46$2 := (if p1$2 then _HAVOC_bv8$2 else v46$2);
    $$2$1bv32$1 := (if p1$1 then v46$1 else $$2$1bv32$1);
    $$2$1bv32$2 := (if p1$2 then v46$2 else $$2$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v47$1 := (if p1$1 then _HAVOC_bv8$1 else v47$1);
    v47$2 := (if p1$2 then _HAVOC_bv8$2 else v47$2);
    $$2$2bv32$1 := (if p1$1 then v47$1 else $$2$2bv32$1);
    $$2$2bv32$2 := (if p1$2 then v47$2 else $$2$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v48$1 := (if p1$1 then _HAVOC_bv8$1 else v48$1);
    v48$2 := (if p1$2 then _HAVOC_bv8$2 else v48$2);
    $$2$3bv32$1 := (if p1$1 then v48$1 else $$2$3bv32$1);
    $$2$3bv32$2 := (if p1$2 then v48$2 else $$2$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v49$1 := (if p1$1 then _HAVOC_bv8$1 else v49$1);
    v49$2 := (if p1$2 then _HAVOC_bv8$2 else v49$2);
    $$2$4bv32$1 := (if p1$1 then v49$1 else $$2$4bv32$1);
    $$2$4bv32$2 := (if p1$2 then v49$2 else $$2$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v50$1 := (if p1$1 then _HAVOC_bv8$1 else v50$1);
    v50$2 := (if p1$2 then _HAVOC_bv8$2 else v50$2);
    $$2$5bv32$1 := (if p1$1 then v50$1 else $$2$5bv32$1);
    $$2$5bv32$2 := (if p1$2 then v50$2 else $$2$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v51$1 := (if p1$1 then _HAVOC_bv8$1 else v51$1);
    v51$2 := (if p1$2 then _HAVOC_bv8$2 else v51$2);
    $$2$6bv32$1 := (if p1$1 then v51$1 else $$2$6bv32$1);
    $$2$6bv32$2 := (if p1$2 then v51$2 else $$2$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v52$1 := (if p1$1 then _HAVOC_bv8$1 else v52$1);
    v52$2 := (if p1$2 then _HAVOC_bv8$2 else v52$2);
    $$2$7bv32$1 := (if p1$1 then v52$1 else $$2$7bv32$1);
    $$2$7bv32$2 := (if p1$2 then v52$2 else $$2$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v53$1 := (if p1$1 then _HAVOC_bv8$1 else v53$1);
    v53$2 := (if p1$2 then _HAVOC_bv8$2 else v53$2);
    $$2$8bv32$1 := (if p1$1 then v53$1 else $$2$8bv32$1);
    $$2$8bv32$2 := (if p1$2 then v53$2 else $$2$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v54$1 := (if p1$1 then _HAVOC_bv8$1 else v54$1);
    v54$2 := (if p1$2 then _HAVOC_bv8$2 else v54$2);
    $$2$9bv32$1 := (if p1$1 then v54$1 else $$2$9bv32$1);
    $$2$9bv32$2 := (if p1$2 then v54$2 else $$2$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v55$1 := (if p1$1 then _HAVOC_bv8$1 else v55$1);
    v55$2 := (if p1$2 then _HAVOC_bv8$2 else v55$2);
    $$2$10bv32$1 := (if p1$1 then v55$1 else $$2$10bv32$1);
    $$2$10bv32$2 := (if p1$2 then v55$2 else $$2$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v56$1 := (if p1$1 then _HAVOC_bv8$1 else v56$1);
    v56$2 := (if p1$2 then _HAVOC_bv8$2 else v56$2);
    $$2$11bv32$1 := (if p1$1 then v56$1 else $$2$11bv32$1);
    $$2$11bv32$2 := (if p1$2 then v56$2 else $$2$11bv32$2);
    v57$1 := (if p1$1 then $$2$0bv32$1 else v57$1);
    v57$2 := (if p1$2 then $$2$0bv32$2 else v57$2);
    v58$1 := (if p1$1 then $$2$4bv32$1 else v58$1);
    v58$2 := (if p1$2 then $$2$4bv32$2 else v58$2);
    v59$1 := (if p1$1 then $$2$5bv32$1 else v59$1);
    v59$2 := (if p1$2 then $$2$5bv32$2 else v59$2);
    v60$1 := (if p1$1 then $$2$6bv32$1 else v60$1);
    v60$2 := (if p1$2 then $$2$6bv32$2 else v60$2);
    v61$1 := (if p1$1 then $$2$7bv32$1 else v61$1);
    v61$2 := (if p1$2 then $$2$7bv32$2 else v61$2);
    v62$1 := (if p1$1 then $$2$8bv32$1 else v62$1);
    v62$2 := (if p1$2 then $$2$8bv32$2 else v62$2);
    v63$1 := (if p1$1 then $$2$9bv32$1 else v63$1);
    v63$2 := (if p1$2 then $$2$9bv32$2 else v63$2);
    v64$1 := (if p1$1 then $$2$10bv32$1 else v64$1);
    v64$2 := (if p1$2 then $$2$10bv32$2 else v64$2);
    v65$1 := (if p1$1 then $$2$11bv32$1 else v65$1);
    v65$2 := (if p1$2 then $$2$11bv32$2 else v65$2);
    call {:sourceloc_num 106} v66$1, v66$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p1$1, v57$1, v61$1 ++ v60$1 ++ v59$1 ++ v58$1, v65$1 ++ v64$1 ++ v63$1 ++ v62$1, FADD32(SI32_TO_FP32($i.0$1), 1065353216bv32), FSUB32(UI32_TO_FP32(group_id_x$1), 1065353216bv32), p1$2, v57$2, v61$2 ++ v60$2 ++ v59$2 ++ v58$2, v65$2 ++ v64$2 ++ v63$2 ++ v62$2, FADD32(SI32_TO_FP32($i.0$2), 1065353216bv32), FSUB32(UI32_TO_FP32(group_id_x$2), 1065353216bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v67$1 := (if p1$1 then _HAVOC_bv8$1 else v67$1);
    v67$2 := (if p1$2 then _HAVOC_bv8$2 else v67$2);
    $$3$0bv32$1 := (if p1$1 then v67$1 else $$3$0bv32$1);
    $$3$0bv32$2 := (if p1$2 then v67$2 else $$3$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v68$1 := (if p1$1 then _HAVOC_bv8$1 else v68$1);
    v68$2 := (if p1$2 then _HAVOC_bv8$2 else v68$2);
    $$3$1bv32$1 := (if p1$1 then v68$1 else $$3$1bv32$1);
    $$3$1bv32$2 := (if p1$2 then v68$2 else $$3$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v69$1 := (if p1$1 then _HAVOC_bv8$1 else v69$1);
    v69$2 := (if p1$2 then _HAVOC_bv8$2 else v69$2);
    $$3$2bv32$1 := (if p1$1 then v69$1 else $$3$2bv32$1);
    $$3$2bv32$2 := (if p1$2 then v69$2 else $$3$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v70$1 := (if p1$1 then _HAVOC_bv8$1 else v70$1);
    v70$2 := (if p1$2 then _HAVOC_bv8$2 else v70$2);
    $$3$3bv32$1 := (if p1$1 then v70$1 else $$3$3bv32$1);
    $$3$3bv32$2 := (if p1$2 then v70$2 else $$3$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v71$1 := (if p1$1 then _HAVOC_bv8$1 else v71$1);
    v71$2 := (if p1$2 then _HAVOC_bv8$2 else v71$2);
    $$3$4bv32$1 := (if p1$1 then v71$1 else $$3$4bv32$1);
    $$3$4bv32$2 := (if p1$2 then v71$2 else $$3$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v72$1 := (if p1$1 then _HAVOC_bv8$1 else v72$1);
    v72$2 := (if p1$2 then _HAVOC_bv8$2 else v72$2);
    $$3$5bv32$1 := (if p1$1 then v72$1 else $$3$5bv32$1);
    $$3$5bv32$2 := (if p1$2 then v72$2 else $$3$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v73$1 := (if p1$1 then _HAVOC_bv8$1 else v73$1);
    v73$2 := (if p1$2 then _HAVOC_bv8$2 else v73$2);
    $$3$6bv32$1 := (if p1$1 then v73$1 else $$3$6bv32$1);
    $$3$6bv32$2 := (if p1$2 then v73$2 else $$3$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v74$1 := (if p1$1 then _HAVOC_bv8$1 else v74$1);
    v74$2 := (if p1$2 then _HAVOC_bv8$2 else v74$2);
    $$3$7bv32$1 := (if p1$1 then v74$1 else $$3$7bv32$1);
    $$3$7bv32$2 := (if p1$2 then v74$2 else $$3$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v75$1 := (if p1$1 then _HAVOC_bv8$1 else v75$1);
    v75$2 := (if p1$2 then _HAVOC_bv8$2 else v75$2);
    $$3$8bv32$1 := (if p1$1 then v75$1 else $$3$8bv32$1);
    $$3$8bv32$2 := (if p1$2 then v75$2 else $$3$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v76$1 := (if p1$1 then _HAVOC_bv8$1 else v76$1);
    v76$2 := (if p1$2 then _HAVOC_bv8$2 else v76$2);
    $$3$9bv32$1 := (if p1$1 then v76$1 else $$3$9bv32$1);
    $$3$9bv32$2 := (if p1$2 then v76$2 else $$3$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v77$1 := (if p1$1 then _HAVOC_bv8$1 else v77$1);
    v77$2 := (if p1$2 then _HAVOC_bv8$2 else v77$2);
    $$3$10bv32$1 := (if p1$1 then v77$1 else $$3$10bv32$1);
    $$3$10bv32$2 := (if p1$2 then v77$2 else $$3$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v78$1 := (if p1$1 then _HAVOC_bv8$1 else v78$1);
    v78$2 := (if p1$2 then _HAVOC_bv8$2 else v78$2);
    $$3$11bv32$1 := (if p1$1 then v78$1 else $$3$11bv32$1);
    $$3$11bv32$2 := (if p1$2 then v78$2 else $$3$11bv32$2);
    v79$1 := (if p1$1 then $$3$0bv32$1 else v79$1);
    v79$2 := (if p1$2 then $$3$0bv32$2 else v79$2);
    v80$1 := (if p1$1 then $$3$4bv32$1 else v80$1);
    v80$2 := (if p1$2 then $$3$4bv32$2 else v80$2);
    v81$1 := (if p1$1 then $$3$5bv32$1 else v81$1);
    v81$2 := (if p1$2 then $$3$5bv32$2 else v81$2);
    v82$1 := (if p1$1 then $$3$6bv32$1 else v82$1);
    v82$2 := (if p1$2 then $$3$6bv32$2 else v82$2);
    v83$1 := (if p1$1 then $$3$7bv32$1 else v83$1);
    v83$2 := (if p1$2 then $$3$7bv32$2 else v83$2);
    v84$1 := (if p1$1 then $$3$8bv32$1 else v84$1);
    v84$2 := (if p1$2 then $$3$8bv32$2 else v84$2);
    v85$1 := (if p1$1 then $$3$9bv32$1 else v85$1);
    v85$2 := (if p1$2 then $$3$9bv32$2 else v85$2);
    v86$1 := (if p1$1 then $$3$10bv32$1 else v86$1);
    v86$2 := (if p1$2 then $$3$10bv32$2 else v86$2);
    v87$1 := (if p1$1 then $$3$11bv32$1 else v87$1);
    v87$2 := (if p1$2 then $$3$11bv32$2 else v87$2);
    call {:sourceloc_num 140} v88$1, v88$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p1$1, v79$1, v83$1 ++ v82$1 ++ v81$1 ++ v80$1, v87$1 ++ v86$1 ++ v85$1 ++ v84$1, FSUB32(SI32_TO_FP32($i.0$1), 1065353216bv32), FADD32(UI32_TO_FP32(group_id_x$1), 0bv32), p1$2, v79$2, v83$2 ++ v82$2 ++ v81$2 ++ v80$2, v87$2 ++ v86$2 ++ v85$2 ++ v84$2, FSUB32(SI32_TO_FP32($i.0$2), 1065353216bv32), FADD32(UI32_TO_FP32(group_id_x$2), 0bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v89$1 := (if p1$1 then _HAVOC_bv8$1 else v89$1);
    v89$2 := (if p1$2 then _HAVOC_bv8$2 else v89$2);
    $$4$0bv32$1 := (if p1$1 then v89$1 else $$4$0bv32$1);
    $$4$0bv32$2 := (if p1$2 then v89$2 else $$4$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v90$1 := (if p1$1 then _HAVOC_bv8$1 else v90$1);
    v90$2 := (if p1$2 then _HAVOC_bv8$2 else v90$2);
    $$4$1bv32$1 := (if p1$1 then v90$1 else $$4$1bv32$1);
    $$4$1bv32$2 := (if p1$2 then v90$2 else $$4$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v91$1 := (if p1$1 then _HAVOC_bv8$1 else v91$1);
    v91$2 := (if p1$2 then _HAVOC_bv8$2 else v91$2);
    $$4$2bv32$1 := (if p1$1 then v91$1 else $$4$2bv32$1);
    $$4$2bv32$2 := (if p1$2 then v91$2 else $$4$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v92$1 := (if p1$1 then _HAVOC_bv8$1 else v92$1);
    v92$2 := (if p1$2 then _HAVOC_bv8$2 else v92$2);
    $$4$3bv32$1 := (if p1$1 then v92$1 else $$4$3bv32$1);
    $$4$3bv32$2 := (if p1$2 then v92$2 else $$4$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v93$1 := (if p1$1 then _HAVOC_bv8$1 else v93$1);
    v93$2 := (if p1$2 then _HAVOC_bv8$2 else v93$2);
    $$4$4bv32$1 := (if p1$1 then v93$1 else $$4$4bv32$1);
    $$4$4bv32$2 := (if p1$2 then v93$2 else $$4$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v94$1 := (if p1$1 then _HAVOC_bv8$1 else v94$1);
    v94$2 := (if p1$2 then _HAVOC_bv8$2 else v94$2);
    $$4$5bv32$1 := (if p1$1 then v94$1 else $$4$5bv32$1);
    $$4$5bv32$2 := (if p1$2 then v94$2 else $$4$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v95$1 := (if p1$1 then _HAVOC_bv8$1 else v95$1);
    v95$2 := (if p1$2 then _HAVOC_bv8$2 else v95$2);
    $$4$6bv32$1 := (if p1$1 then v95$1 else $$4$6bv32$1);
    $$4$6bv32$2 := (if p1$2 then v95$2 else $$4$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v96$1 := (if p1$1 then _HAVOC_bv8$1 else v96$1);
    v96$2 := (if p1$2 then _HAVOC_bv8$2 else v96$2);
    $$4$7bv32$1 := (if p1$1 then v96$1 else $$4$7bv32$1);
    $$4$7bv32$2 := (if p1$2 then v96$2 else $$4$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v97$1 := (if p1$1 then _HAVOC_bv8$1 else v97$1);
    v97$2 := (if p1$2 then _HAVOC_bv8$2 else v97$2);
    $$4$8bv32$1 := (if p1$1 then v97$1 else $$4$8bv32$1);
    $$4$8bv32$2 := (if p1$2 then v97$2 else $$4$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v98$1 := (if p1$1 then _HAVOC_bv8$1 else v98$1);
    v98$2 := (if p1$2 then _HAVOC_bv8$2 else v98$2);
    $$4$9bv32$1 := (if p1$1 then v98$1 else $$4$9bv32$1);
    $$4$9bv32$2 := (if p1$2 then v98$2 else $$4$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v99$1 := (if p1$1 then _HAVOC_bv8$1 else v99$1);
    v99$2 := (if p1$2 then _HAVOC_bv8$2 else v99$2);
    $$4$10bv32$1 := (if p1$1 then v99$1 else $$4$10bv32$1);
    $$4$10bv32$2 := (if p1$2 then v99$2 else $$4$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v100$1 := (if p1$1 then _HAVOC_bv8$1 else v100$1);
    v100$2 := (if p1$2 then _HAVOC_bv8$2 else v100$2);
    $$4$11bv32$1 := (if p1$1 then v100$1 else $$4$11bv32$1);
    $$4$11bv32$2 := (if p1$2 then v100$2 else $$4$11bv32$2);
    v101$1 := (if p1$1 then $$4$0bv32$1 else v101$1);
    v101$2 := (if p1$2 then $$4$0bv32$2 else v101$2);
    v102$1 := (if p1$1 then $$4$4bv32$1 else v102$1);
    v102$2 := (if p1$2 then $$4$4bv32$2 else v102$2);
    v103$1 := (if p1$1 then $$4$5bv32$1 else v103$1);
    v103$2 := (if p1$2 then $$4$5bv32$2 else v103$2);
    v104$1 := (if p1$1 then $$4$6bv32$1 else v104$1);
    v104$2 := (if p1$2 then $$4$6bv32$2 else v104$2);
    v105$1 := (if p1$1 then $$4$7bv32$1 else v105$1);
    v105$2 := (if p1$2 then $$4$7bv32$2 else v105$2);
    v106$1 := (if p1$1 then $$4$8bv32$1 else v106$1);
    v106$2 := (if p1$2 then $$4$8bv32$2 else v106$2);
    v107$1 := (if p1$1 then $$4$9bv32$1 else v107$1);
    v107$2 := (if p1$2 then $$4$9bv32$2 else v107$2);
    v108$1 := (if p1$1 then $$4$10bv32$1 else v108$1);
    v108$2 := (if p1$2 then $$4$10bv32$2 else v108$2);
    v109$1 := (if p1$1 then $$4$11bv32$1 else v109$1);
    v109$2 := (if p1$2 then $$4$11bv32$2 else v109$2);
    call {:sourceloc_num 174} v110$1, v110$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p1$1, v101$1, v105$1 ++ v104$1 ++ v103$1 ++ v102$1, v109$1 ++ v108$1 ++ v107$1 ++ v106$1, FADD32(SI32_TO_FP32($i.0$1), 0bv32), FADD32(UI32_TO_FP32(group_id_x$1), 0bv32), p1$2, v101$2, v105$2 ++ v104$2 ++ v103$2 ++ v102$2, v109$2 ++ v108$2 ++ v107$2 ++ v106$2, FADD32(SI32_TO_FP32($i.0$2), 0bv32), FADD32(UI32_TO_FP32(group_id_x$2), 0bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v111$1 := (if p1$1 then _HAVOC_bv8$1 else v111$1);
    v111$2 := (if p1$2 then _HAVOC_bv8$2 else v111$2);
    $$5$0bv32$1 := (if p1$1 then v111$1 else $$5$0bv32$1);
    $$5$0bv32$2 := (if p1$2 then v111$2 else $$5$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v112$1 := (if p1$1 then _HAVOC_bv8$1 else v112$1);
    v112$2 := (if p1$2 then _HAVOC_bv8$2 else v112$2);
    $$5$1bv32$1 := (if p1$1 then v112$1 else $$5$1bv32$1);
    $$5$1bv32$2 := (if p1$2 then v112$2 else $$5$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v113$1 := (if p1$1 then _HAVOC_bv8$1 else v113$1);
    v113$2 := (if p1$2 then _HAVOC_bv8$2 else v113$2);
    $$5$2bv32$1 := (if p1$1 then v113$1 else $$5$2bv32$1);
    $$5$2bv32$2 := (if p1$2 then v113$2 else $$5$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v114$1 := (if p1$1 then _HAVOC_bv8$1 else v114$1);
    v114$2 := (if p1$2 then _HAVOC_bv8$2 else v114$2);
    $$5$3bv32$1 := (if p1$1 then v114$1 else $$5$3bv32$1);
    $$5$3bv32$2 := (if p1$2 then v114$2 else $$5$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v115$1 := (if p1$1 then _HAVOC_bv8$1 else v115$1);
    v115$2 := (if p1$2 then _HAVOC_bv8$2 else v115$2);
    $$5$4bv32$1 := (if p1$1 then v115$1 else $$5$4bv32$1);
    $$5$4bv32$2 := (if p1$2 then v115$2 else $$5$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v116$1 := (if p1$1 then _HAVOC_bv8$1 else v116$1);
    v116$2 := (if p1$2 then _HAVOC_bv8$2 else v116$2);
    $$5$5bv32$1 := (if p1$1 then v116$1 else $$5$5bv32$1);
    $$5$5bv32$2 := (if p1$2 then v116$2 else $$5$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v117$1 := (if p1$1 then _HAVOC_bv8$1 else v117$1);
    v117$2 := (if p1$2 then _HAVOC_bv8$2 else v117$2);
    $$5$6bv32$1 := (if p1$1 then v117$1 else $$5$6bv32$1);
    $$5$6bv32$2 := (if p1$2 then v117$2 else $$5$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v118$1 := (if p1$1 then _HAVOC_bv8$1 else v118$1);
    v118$2 := (if p1$2 then _HAVOC_bv8$2 else v118$2);
    $$5$7bv32$1 := (if p1$1 then v118$1 else $$5$7bv32$1);
    $$5$7bv32$2 := (if p1$2 then v118$2 else $$5$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v119$1 := (if p1$1 then _HAVOC_bv8$1 else v119$1);
    v119$2 := (if p1$2 then _HAVOC_bv8$2 else v119$2);
    $$5$8bv32$1 := (if p1$1 then v119$1 else $$5$8bv32$1);
    $$5$8bv32$2 := (if p1$2 then v119$2 else $$5$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v120$1 := (if p1$1 then _HAVOC_bv8$1 else v120$1);
    v120$2 := (if p1$2 then _HAVOC_bv8$2 else v120$2);
    $$5$9bv32$1 := (if p1$1 then v120$1 else $$5$9bv32$1);
    $$5$9bv32$2 := (if p1$2 then v120$2 else $$5$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v121$1 := (if p1$1 then _HAVOC_bv8$1 else v121$1);
    v121$2 := (if p1$2 then _HAVOC_bv8$2 else v121$2);
    $$5$10bv32$1 := (if p1$1 then v121$1 else $$5$10bv32$1);
    $$5$10bv32$2 := (if p1$2 then v121$2 else $$5$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v122$1 := (if p1$1 then _HAVOC_bv8$1 else v122$1);
    v122$2 := (if p1$2 then _HAVOC_bv8$2 else v122$2);
    $$5$11bv32$1 := (if p1$1 then v122$1 else $$5$11bv32$1);
    $$5$11bv32$2 := (if p1$2 then v122$2 else $$5$11bv32$2);
    v123$1 := (if p1$1 then $$5$0bv32$1 else v123$1);
    v123$2 := (if p1$2 then $$5$0bv32$2 else v123$2);
    v124$1 := (if p1$1 then $$5$4bv32$1 else v124$1);
    v124$2 := (if p1$2 then $$5$4bv32$2 else v124$2);
    v125$1 := (if p1$1 then $$5$5bv32$1 else v125$1);
    v125$2 := (if p1$2 then $$5$5bv32$2 else v125$2);
    v126$1 := (if p1$1 then $$5$6bv32$1 else v126$1);
    v126$2 := (if p1$2 then $$5$6bv32$2 else v126$2);
    v127$1 := (if p1$1 then $$5$7bv32$1 else v127$1);
    v127$2 := (if p1$2 then $$5$7bv32$2 else v127$2);
    v128$1 := (if p1$1 then $$5$8bv32$1 else v128$1);
    v128$2 := (if p1$2 then $$5$8bv32$2 else v128$2);
    v129$1 := (if p1$1 then $$5$9bv32$1 else v129$1);
    v129$2 := (if p1$2 then $$5$9bv32$2 else v129$2);
    v130$1 := (if p1$1 then $$5$10bv32$1 else v130$1);
    v130$2 := (if p1$2 then $$5$10bv32$2 else v130$2);
    v131$1 := (if p1$1 then $$5$11bv32$1 else v131$1);
    v131$2 := (if p1$2 then $$5$11bv32$2 else v131$2);
    call {:sourceloc_num 208} v132$1, v132$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p1$1, v123$1, v127$1 ++ v126$1 ++ v125$1 ++ v124$1, v131$1 ++ v130$1 ++ v129$1 ++ v128$1, FADD32(SI32_TO_FP32($i.0$1), 1065353216bv32), FADD32(UI32_TO_FP32(group_id_x$1), 0bv32), p1$2, v123$2, v127$2 ++ v126$2 ++ v125$2 ++ v124$2, v131$2 ++ v130$2 ++ v129$2 ++ v128$2, FADD32(SI32_TO_FP32($i.0$2), 1065353216bv32), FADD32(UI32_TO_FP32(group_id_x$2), 0bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v133$1 := (if p1$1 then _HAVOC_bv8$1 else v133$1);
    v133$2 := (if p1$2 then _HAVOC_bv8$2 else v133$2);
    $$6$0bv32$1 := (if p1$1 then v133$1 else $$6$0bv32$1);
    $$6$0bv32$2 := (if p1$2 then v133$2 else $$6$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v134$1 := (if p1$1 then _HAVOC_bv8$1 else v134$1);
    v134$2 := (if p1$2 then _HAVOC_bv8$2 else v134$2);
    $$6$1bv32$1 := (if p1$1 then v134$1 else $$6$1bv32$1);
    $$6$1bv32$2 := (if p1$2 then v134$2 else $$6$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v135$1 := (if p1$1 then _HAVOC_bv8$1 else v135$1);
    v135$2 := (if p1$2 then _HAVOC_bv8$2 else v135$2);
    $$6$2bv32$1 := (if p1$1 then v135$1 else $$6$2bv32$1);
    $$6$2bv32$2 := (if p1$2 then v135$2 else $$6$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v136$1 := (if p1$1 then _HAVOC_bv8$1 else v136$1);
    v136$2 := (if p1$2 then _HAVOC_bv8$2 else v136$2);
    $$6$3bv32$1 := (if p1$1 then v136$1 else $$6$3bv32$1);
    $$6$3bv32$2 := (if p1$2 then v136$2 else $$6$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v137$1 := (if p1$1 then _HAVOC_bv8$1 else v137$1);
    v137$2 := (if p1$2 then _HAVOC_bv8$2 else v137$2);
    $$6$4bv32$1 := (if p1$1 then v137$1 else $$6$4bv32$1);
    $$6$4bv32$2 := (if p1$2 then v137$2 else $$6$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v138$1 := (if p1$1 then _HAVOC_bv8$1 else v138$1);
    v138$2 := (if p1$2 then _HAVOC_bv8$2 else v138$2);
    $$6$5bv32$1 := (if p1$1 then v138$1 else $$6$5bv32$1);
    $$6$5bv32$2 := (if p1$2 then v138$2 else $$6$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v139$1 := (if p1$1 then _HAVOC_bv8$1 else v139$1);
    v139$2 := (if p1$2 then _HAVOC_bv8$2 else v139$2);
    $$6$6bv32$1 := (if p1$1 then v139$1 else $$6$6bv32$1);
    $$6$6bv32$2 := (if p1$2 then v139$2 else $$6$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v140$1 := (if p1$1 then _HAVOC_bv8$1 else v140$1);
    v140$2 := (if p1$2 then _HAVOC_bv8$2 else v140$2);
    $$6$7bv32$1 := (if p1$1 then v140$1 else $$6$7bv32$1);
    $$6$7bv32$2 := (if p1$2 then v140$2 else $$6$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v141$1 := (if p1$1 then _HAVOC_bv8$1 else v141$1);
    v141$2 := (if p1$2 then _HAVOC_bv8$2 else v141$2);
    $$6$8bv32$1 := (if p1$1 then v141$1 else $$6$8bv32$1);
    $$6$8bv32$2 := (if p1$2 then v141$2 else $$6$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v142$1 := (if p1$1 then _HAVOC_bv8$1 else v142$1);
    v142$2 := (if p1$2 then _HAVOC_bv8$2 else v142$2);
    $$6$9bv32$1 := (if p1$1 then v142$1 else $$6$9bv32$1);
    $$6$9bv32$2 := (if p1$2 then v142$2 else $$6$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v143$1 := (if p1$1 then _HAVOC_bv8$1 else v143$1);
    v143$2 := (if p1$2 then _HAVOC_bv8$2 else v143$2);
    $$6$10bv32$1 := (if p1$1 then v143$1 else $$6$10bv32$1);
    $$6$10bv32$2 := (if p1$2 then v143$2 else $$6$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v144$1 := (if p1$1 then _HAVOC_bv8$1 else v144$1);
    v144$2 := (if p1$2 then _HAVOC_bv8$2 else v144$2);
    $$6$11bv32$1 := (if p1$1 then v144$1 else $$6$11bv32$1);
    $$6$11bv32$2 := (if p1$2 then v144$2 else $$6$11bv32$2);
    v145$1 := (if p1$1 then $$6$0bv32$1 else v145$1);
    v145$2 := (if p1$2 then $$6$0bv32$2 else v145$2);
    v146$1 := (if p1$1 then $$6$4bv32$1 else v146$1);
    v146$2 := (if p1$2 then $$6$4bv32$2 else v146$2);
    v147$1 := (if p1$1 then $$6$5bv32$1 else v147$1);
    v147$2 := (if p1$2 then $$6$5bv32$2 else v147$2);
    v148$1 := (if p1$1 then $$6$6bv32$1 else v148$1);
    v148$2 := (if p1$2 then $$6$6bv32$2 else v148$2);
    v149$1 := (if p1$1 then $$6$7bv32$1 else v149$1);
    v149$2 := (if p1$2 then $$6$7bv32$2 else v149$2);
    v150$1 := (if p1$1 then $$6$8bv32$1 else v150$1);
    v150$2 := (if p1$2 then $$6$8bv32$2 else v150$2);
    v151$1 := (if p1$1 then $$6$9bv32$1 else v151$1);
    v151$2 := (if p1$2 then $$6$9bv32$2 else v151$2);
    v152$1 := (if p1$1 then $$6$10bv32$1 else v152$1);
    v152$2 := (if p1$2 then $$6$10bv32$2 else v152$2);
    v153$1 := (if p1$1 then $$6$11bv32$1 else v153$1);
    v153$2 := (if p1$2 then $$6$11bv32$2 else v153$2);
    call {:sourceloc_num 242} v154$1, v154$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p1$1, v145$1, v149$1 ++ v148$1 ++ v147$1 ++ v146$1, v153$1 ++ v152$1 ++ v151$1 ++ v150$1, FSUB32(SI32_TO_FP32($i.0$1), 1065353216bv32), FADD32(UI32_TO_FP32(group_id_x$1), 1065353216bv32), p1$2, v145$2, v149$2 ++ v148$2 ++ v147$2 ++ v146$2, v153$2 ++ v152$2 ++ v151$2 ++ v150$2, FSUB32(SI32_TO_FP32($i.0$2), 1065353216bv32), FADD32(UI32_TO_FP32(group_id_x$2), 1065353216bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v155$1 := (if p1$1 then _HAVOC_bv8$1 else v155$1);
    v155$2 := (if p1$2 then _HAVOC_bv8$2 else v155$2);
    $$7$0bv32$1 := (if p1$1 then v155$1 else $$7$0bv32$1);
    $$7$0bv32$2 := (if p1$2 then v155$2 else $$7$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v156$1 := (if p1$1 then _HAVOC_bv8$1 else v156$1);
    v156$2 := (if p1$2 then _HAVOC_bv8$2 else v156$2);
    $$7$1bv32$1 := (if p1$1 then v156$1 else $$7$1bv32$1);
    $$7$1bv32$2 := (if p1$2 then v156$2 else $$7$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v157$1 := (if p1$1 then _HAVOC_bv8$1 else v157$1);
    v157$2 := (if p1$2 then _HAVOC_bv8$2 else v157$2);
    $$7$2bv32$1 := (if p1$1 then v157$1 else $$7$2bv32$1);
    $$7$2bv32$2 := (if p1$2 then v157$2 else $$7$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v158$1 := (if p1$1 then _HAVOC_bv8$1 else v158$1);
    v158$2 := (if p1$2 then _HAVOC_bv8$2 else v158$2);
    $$7$3bv32$1 := (if p1$1 then v158$1 else $$7$3bv32$1);
    $$7$3bv32$2 := (if p1$2 then v158$2 else $$7$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v159$1 := (if p1$1 then _HAVOC_bv8$1 else v159$1);
    v159$2 := (if p1$2 then _HAVOC_bv8$2 else v159$2);
    $$7$4bv32$1 := (if p1$1 then v159$1 else $$7$4bv32$1);
    $$7$4bv32$2 := (if p1$2 then v159$2 else $$7$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v160$1 := (if p1$1 then _HAVOC_bv8$1 else v160$1);
    v160$2 := (if p1$2 then _HAVOC_bv8$2 else v160$2);
    $$7$5bv32$1 := (if p1$1 then v160$1 else $$7$5bv32$1);
    $$7$5bv32$2 := (if p1$2 then v160$2 else $$7$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v161$1 := (if p1$1 then _HAVOC_bv8$1 else v161$1);
    v161$2 := (if p1$2 then _HAVOC_bv8$2 else v161$2);
    $$7$6bv32$1 := (if p1$1 then v161$1 else $$7$6bv32$1);
    $$7$6bv32$2 := (if p1$2 then v161$2 else $$7$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v162$1 := (if p1$1 then _HAVOC_bv8$1 else v162$1);
    v162$2 := (if p1$2 then _HAVOC_bv8$2 else v162$2);
    $$7$7bv32$1 := (if p1$1 then v162$1 else $$7$7bv32$1);
    $$7$7bv32$2 := (if p1$2 then v162$2 else $$7$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v163$1 := (if p1$1 then _HAVOC_bv8$1 else v163$1);
    v163$2 := (if p1$2 then _HAVOC_bv8$2 else v163$2);
    $$7$8bv32$1 := (if p1$1 then v163$1 else $$7$8bv32$1);
    $$7$8bv32$2 := (if p1$2 then v163$2 else $$7$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v164$1 := (if p1$1 then _HAVOC_bv8$1 else v164$1);
    v164$2 := (if p1$2 then _HAVOC_bv8$2 else v164$2);
    $$7$9bv32$1 := (if p1$1 then v164$1 else $$7$9bv32$1);
    $$7$9bv32$2 := (if p1$2 then v164$2 else $$7$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v165$1 := (if p1$1 then _HAVOC_bv8$1 else v165$1);
    v165$2 := (if p1$2 then _HAVOC_bv8$2 else v165$2);
    $$7$10bv32$1 := (if p1$1 then v165$1 else $$7$10bv32$1);
    $$7$10bv32$2 := (if p1$2 then v165$2 else $$7$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v166$1 := (if p1$1 then _HAVOC_bv8$1 else v166$1);
    v166$2 := (if p1$2 then _HAVOC_bv8$2 else v166$2);
    $$7$11bv32$1 := (if p1$1 then v166$1 else $$7$11bv32$1);
    $$7$11bv32$2 := (if p1$2 then v166$2 else $$7$11bv32$2);
    v167$1 := (if p1$1 then $$7$0bv32$1 else v167$1);
    v167$2 := (if p1$2 then $$7$0bv32$2 else v167$2);
    v168$1 := (if p1$1 then $$7$4bv32$1 else v168$1);
    v168$2 := (if p1$2 then $$7$4bv32$2 else v168$2);
    v169$1 := (if p1$1 then $$7$5bv32$1 else v169$1);
    v169$2 := (if p1$2 then $$7$5bv32$2 else v169$2);
    v170$1 := (if p1$1 then $$7$6bv32$1 else v170$1);
    v170$2 := (if p1$2 then $$7$6bv32$2 else v170$2);
    v171$1 := (if p1$1 then $$7$7bv32$1 else v171$1);
    v171$2 := (if p1$2 then $$7$7bv32$2 else v171$2);
    v172$1 := (if p1$1 then $$7$8bv32$1 else v172$1);
    v172$2 := (if p1$2 then $$7$8bv32$2 else v172$2);
    v173$1 := (if p1$1 then $$7$9bv32$1 else v173$1);
    v173$2 := (if p1$2 then $$7$9bv32$2 else v173$2);
    v174$1 := (if p1$1 then $$7$10bv32$1 else v174$1);
    v174$2 := (if p1$2 then $$7$10bv32$2 else v174$2);
    v175$1 := (if p1$1 then $$7$11bv32$1 else v175$1);
    v175$2 := (if p1$2 then $$7$11bv32$2 else v175$2);
    call {:sourceloc_num 276} v176$1, v176$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p1$1, v167$1, v171$1 ++ v170$1 ++ v169$1 ++ v168$1, v175$1 ++ v174$1 ++ v173$1 ++ v172$1, FADD32(SI32_TO_FP32($i.0$1), 0bv32), FADD32(UI32_TO_FP32(group_id_x$1), 1065353216bv32), p1$2, v167$2, v171$2 ++ v170$2 ++ v169$2 ++ v168$2, v175$2 ++ v174$2 ++ v173$2 ++ v172$2, FADD32(SI32_TO_FP32($i.0$2), 0bv32), FADD32(UI32_TO_FP32(group_id_x$2), 1065353216bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v177$1 := (if p1$1 then _HAVOC_bv8$1 else v177$1);
    v177$2 := (if p1$2 then _HAVOC_bv8$2 else v177$2);
    $$8$0bv32$1 := (if p1$1 then v177$1 else $$8$0bv32$1);
    $$8$0bv32$2 := (if p1$2 then v177$2 else $$8$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v178$1 := (if p1$1 then _HAVOC_bv8$1 else v178$1);
    v178$2 := (if p1$2 then _HAVOC_bv8$2 else v178$2);
    $$8$1bv32$1 := (if p1$1 then v178$1 else $$8$1bv32$1);
    $$8$1bv32$2 := (if p1$2 then v178$2 else $$8$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v179$1 := (if p1$1 then _HAVOC_bv8$1 else v179$1);
    v179$2 := (if p1$2 then _HAVOC_bv8$2 else v179$2);
    $$8$2bv32$1 := (if p1$1 then v179$1 else $$8$2bv32$1);
    $$8$2bv32$2 := (if p1$2 then v179$2 else $$8$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v180$1 := (if p1$1 then _HAVOC_bv8$1 else v180$1);
    v180$2 := (if p1$2 then _HAVOC_bv8$2 else v180$2);
    $$8$3bv32$1 := (if p1$1 then v180$1 else $$8$3bv32$1);
    $$8$3bv32$2 := (if p1$2 then v180$2 else $$8$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v181$1 := (if p1$1 then _HAVOC_bv8$1 else v181$1);
    v181$2 := (if p1$2 then _HAVOC_bv8$2 else v181$2);
    $$8$4bv32$1 := (if p1$1 then v181$1 else $$8$4bv32$1);
    $$8$4bv32$2 := (if p1$2 then v181$2 else $$8$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v182$1 := (if p1$1 then _HAVOC_bv8$1 else v182$1);
    v182$2 := (if p1$2 then _HAVOC_bv8$2 else v182$2);
    $$8$5bv32$1 := (if p1$1 then v182$1 else $$8$5bv32$1);
    $$8$5bv32$2 := (if p1$2 then v182$2 else $$8$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v183$1 := (if p1$1 then _HAVOC_bv8$1 else v183$1);
    v183$2 := (if p1$2 then _HAVOC_bv8$2 else v183$2);
    $$8$6bv32$1 := (if p1$1 then v183$1 else $$8$6bv32$1);
    $$8$6bv32$2 := (if p1$2 then v183$2 else $$8$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v184$1 := (if p1$1 then _HAVOC_bv8$1 else v184$1);
    v184$2 := (if p1$2 then _HAVOC_bv8$2 else v184$2);
    $$8$7bv32$1 := (if p1$1 then v184$1 else $$8$7bv32$1);
    $$8$7bv32$2 := (if p1$2 then v184$2 else $$8$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v185$1 := (if p1$1 then _HAVOC_bv8$1 else v185$1);
    v185$2 := (if p1$2 then _HAVOC_bv8$2 else v185$2);
    $$8$8bv32$1 := (if p1$1 then v185$1 else $$8$8bv32$1);
    $$8$8bv32$2 := (if p1$2 then v185$2 else $$8$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v186$1 := (if p1$1 then _HAVOC_bv8$1 else v186$1);
    v186$2 := (if p1$2 then _HAVOC_bv8$2 else v186$2);
    $$8$9bv32$1 := (if p1$1 then v186$1 else $$8$9bv32$1);
    $$8$9bv32$2 := (if p1$2 then v186$2 else $$8$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v187$1 := (if p1$1 then _HAVOC_bv8$1 else v187$1);
    v187$2 := (if p1$2 then _HAVOC_bv8$2 else v187$2);
    $$8$10bv32$1 := (if p1$1 then v187$1 else $$8$10bv32$1);
    $$8$10bv32$2 := (if p1$2 then v187$2 else $$8$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v188$1 := (if p1$1 then _HAVOC_bv8$1 else v188$1);
    v188$2 := (if p1$2 then _HAVOC_bv8$2 else v188$2);
    $$8$11bv32$1 := (if p1$1 then v188$1 else $$8$11bv32$1);
    $$8$11bv32$2 := (if p1$2 then v188$2 else $$8$11bv32$2);
    v189$1 := (if p1$1 then $$8$0bv32$1 else v189$1);
    v189$2 := (if p1$2 then $$8$0bv32$2 else v189$2);
    v190$1 := (if p1$1 then $$8$4bv32$1 else v190$1);
    v190$2 := (if p1$2 then $$8$4bv32$2 else v190$2);
    v191$1 := (if p1$1 then $$8$5bv32$1 else v191$1);
    v191$2 := (if p1$2 then $$8$5bv32$2 else v191$2);
    v192$1 := (if p1$1 then $$8$6bv32$1 else v192$1);
    v192$2 := (if p1$2 then $$8$6bv32$2 else v192$2);
    v193$1 := (if p1$1 then $$8$7bv32$1 else v193$1);
    v193$2 := (if p1$2 then $$8$7bv32$2 else v193$2);
    v194$1 := (if p1$1 then $$8$8bv32$1 else v194$1);
    v194$2 := (if p1$2 then $$8$8bv32$2 else v194$2);
    v195$1 := (if p1$1 then $$8$9bv32$1 else v195$1);
    v195$2 := (if p1$2 then $$8$9bv32$2 else v195$2);
    v196$1 := (if p1$1 then $$8$10bv32$1 else v196$1);
    v196$2 := (if p1$2 then $$8$10bv32$2 else v196$2);
    v197$1 := (if p1$1 then $$8$11bv32$1 else v197$1);
    v197$2 := (if p1$2 then $$8$11bv32$2 else v197$2);
    call {:sourceloc_num 310} v198$1, v198$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p1$1, v189$1, v193$1 ++ v192$1 ++ v191$1 ++ v190$1, v197$1 ++ v196$1 ++ v195$1 ++ v194$1, FADD32(SI32_TO_FP32($i.0$1), 1065353216bv32), FADD32(UI32_TO_FP32(group_id_x$1), 1065353216bv32), p1$2, v189$2, v193$2 ++ v192$2 ++ v191$2 ++ v190$2, v197$2 ++ v196$2 ++ v195$2 ++ v194$2, FADD32(SI32_TO_FP32($i.0$2), 1065353216bv32), FADD32(UI32_TO_FP32(group_id_x$2), 1065353216bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    call {:sourceloc_num 311} v199$1, v199$2 := $abs(p1$1, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v66$1), BV32_MUL(2bv32, BV8_ZEXT32(v132$1))), BV8_ZEXT32(v198$1)), BV8_ZEXT32(v22$1)), BV32_MUL(2bv32, BV8_ZEXT32(v88$1))), BV8_ZEXT32(v154$1))[16:0])), p1$2, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v66$2), BV32_MUL(2bv32, BV8_ZEXT32(v132$2))), BV8_ZEXT32(v198$2)), BV8_ZEXT32(v22$2)), BV32_MUL(2bv32, BV8_ZEXT32(v88$2))), BV8_ZEXT32(v154$2))[16:0])));
    assume {:captureState "call_return_state_0"} {:procedureName "$abs"} true;
    call {:sourceloc_num 312} v200$1, v200$2 := $abs(p1$1, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v22$1), BV32_MUL(2bv32, BV8_ZEXT32(v44$1))), BV8_ZEXT32(v66$1)), BV8_ZEXT32(v154$1)), BV32_MUL(2bv32, BV8_ZEXT32(v176$1))), BV8_ZEXT32(v198$1))[16:0])), p1$2, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v22$2), BV32_MUL(2bv32, BV8_ZEXT32(v44$2))), BV8_ZEXT32(v66$2)), BV8_ZEXT32(v154$2)), BV32_MUL(2bv32, BV8_ZEXT32(v176$2))), BV8_ZEXT32(v198$2))[16:0])));
    assume {:captureState "call_return_state_0"} {:procedureName "$abs"} true;
    v201$1 := (if p1$1 then FP32_TO_SI16(FMUL32($fScale, FADD32(v199$1, v200$1))) else v201$1);
    v201$2 := (if p1$2 then FP32_TO_SI16(FMUL32($fScale, FADD32(v199$2, v200$2))) else v201$2);
    v202$1 := (if p1$1 then BV32_SLT(BV16_SEXT32(v201$1), 0bv32) else v202$1);
    v202$2 := (if p1$2 then BV32_SLT(BV16_SEXT32(v201$2), 0bv32) else v202$2);
    p2$1 := (if p1$1 && v202$1 then v202$1 else p2$1);
    p2$2 := (if p1$2 && v202$2 then v202$2 else p2$2);
    p3$1 := (if p1$1 && !v202$1 then !v202$1 else p3$1);
    p3$2 := (if p1$2 && !v202$2 then !v202$2 else p3$2);
    $.0$1 := (if p2$1 then 0bv8 else $.0$1);
    $.0$2 := (if p2$2 then 0bv8 else $.0$2);
    v203$1 := (if p3$1 then BV32_SGT(BV16_SEXT32(v201$1), 255bv32) else v203$1);
    v203$2 := (if p3$2 then BV32_SGT(BV16_SEXT32(v201$2), 255bv32) else v203$2);
    p5$1 := (if p3$1 && v203$1 then v203$1 else p5$1);
    p5$2 := (if p3$2 && v203$2 then v203$2 else p5$2);
    p4$1 := (if p3$1 && !v203$1 then !v203$1 else p4$1);
    p4$2 := (if p3$2 && !v203$2 then !v203$2 else p4$2);
    $.0$1 := (if p4$1 then v201$1[8:0] else $.0$1);
    $.0$2 := (if p4$2 then v201$2[8:0] else $.0$2);
    $.0$1 := (if p5$1 then 255bv8 else $.0$1);
    $.0$2 := (if p5$2 then 255bv8 else $.0$2);
    call {:sourceloc} {:sourceloc_num 318} _LOG_WRITE_$$pSobelOriginal(p1$1, BV32_ADD(BV32_MUL(group_id_x$1, $Pitch), $i.0$1), $.0$1, $$pSobelOriginal[BV32_ADD(BV32_MUL(group_id_x$1, $Pitch), $i.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pSobelOriginal(p1$2, BV32_ADD(BV32_MUL(group_id_x$2, $Pitch), $i.0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 318} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 318} _CHECK_WRITE_$$pSobelOriginal(p1$2, BV32_ADD(BV32_MUL(group_id_x$2, $Pitch), $i.0$2), $.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pSobelOriginal"} true;
    $$pSobelOriginal[BV32_ADD(BV32_MUL(group_id_x$1, $Pitch), $i.0$1)] := (if p1$1 then $.0$1 else $$pSobelOriginal[BV32_ADD(BV32_MUL(group_id_x$1, $Pitch), $i.0$1)]);
    $$pSobelOriginal[BV32_ADD(BV32_MUL(group_id_x$2, $Pitch), $i.0$2)] := (if p1$2 then $.0$2 else $$pSobelOriginal[BV32_ADD(BV32_MUL(group_id_x$2, $Pitch), $i.0$2)]);
    $i.0$1 := (if p1$1 then BV32_ADD($i.0$1, group_size_x) else $i.0$1);
    $i.0$2 := (if p1$2 then BV32_ADD($i.0$2, group_size_x) else $i.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    return;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



procedure {:source_name "_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(_P$1: bool, $0$1: bv8, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, _P$2: bool, $0$2: bv8, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32) returns ($ret$1: bv8, $ret$2: bv8);



procedure {:source_name "abs"} $abs(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 384bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

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

var $$2$0bv32$1: bv8;

var $$2$0bv32$2: bv8;

var $$2$1bv32$1: bv8;

var $$2$1bv32$2: bv8;

var $$2$2bv32$1: bv8;

var $$2$2bv32$2: bv8;

var $$2$3bv32$1: bv8;

var $$2$3bv32$2: bv8;

var $$2$4bv32$1: bv8;

var $$2$4bv32$2: bv8;

var $$2$5bv32$1: bv8;

var $$2$5bv32$2: bv8;

var $$2$6bv32$1: bv8;

var $$2$6bv32$2: bv8;

var $$2$7bv32$1: bv8;

var $$2$7bv32$2: bv8;

var $$2$8bv32$1: bv8;

var $$2$8bv32$2: bv8;

var $$2$9bv32$1: bv8;

var $$2$9bv32$2: bv8;

var $$2$10bv32$1: bv8;

var $$2$10bv32$2: bv8;

var $$2$11bv32$1: bv8;

var $$2$11bv32$2: bv8;

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

var $$6$0bv32$1: bv8;

var $$6$0bv32$2: bv8;

var $$6$1bv32$1: bv8;

var $$6$1bv32$2: bv8;

var $$6$2bv32$1: bv8;

var $$6$2bv32$2: bv8;

var $$6$3bv32$1: bv8;

var $$6$3bv32$2: bv8;

var $$6$4bv32$1: bv8;

var $$6$4bv32$2: bv8;

var $$6$5bv32$1: bv8;

var $$6$5bv32$2: bv8;

var $$6$6bv32$1: bv8;

var $$6$6bv32$2: bv8;

var $$6$7bv32$1: bv8;

var $$6$7bv32$2: bv8;

var $$6$8bv32$1: bv8;

var $$6$8bv32$2: bv8;

var $$6$9bv32$1: bv8;

var $$6$9bv32$2: bv8;

var $$6$10bv32$1: bv8;

var $$6$10bv32$2: bv8;

var $$6$11bv32$1: bv8;

var $$6$11bv32$2: bv8;

var $$7$0bv32$1: bv8;

var $$7$0bv32$2: bv8;

var $$7$1bv32$1: bv8;

var $$7$1bv32$2: bv8;

var $$7$2bv32$1: bv8;

var $$7$2bv32$2: bv8;

var $$7$3bv32$1: bv8;

var $$7$3bv32$2: bv8;

var $$7$4bv32$1: bv8;

var $$7$4bv32$2: bv8;

var $$7$5bv32$1: bv8;

var $$7$5bv32$2: bv8;

var $$7$6bv32$1: bv8;

var $$7$6bv32$2: bv8;

var $$7$7bv32$1: bv8;

var $$7$7bv32$2: bv8;

var $$7$8bv32$1: bv8;

var $$7$8bv32$2: bv8;

var $$7$9bv32$1: bv8;

var $$7$9bv32$2: bv8;

var $$7$10bv32$1: bv8;

var $$7$10bv32$2: bv8;

var $$7$11bv32$1: bv8;

var $$7$11bv32$2: bv8;

var $$8$0bv32$1: bv8;

var $$8$0bv32$2: bv8;

var $$8$1bv32$1: bv8;

var $$8$1bv32$2: bv8;

var $$8$2bv32$1: bv8;

var $$8$2bv32$2: bv8;

var $$8$3bv32$1: bv8;

var $$8$3bv32$2: bv8;

var $$8$4bv32$1: bv8;

var $$8$4bv32$2: bv8;

var $$8$5bv32$1: bv8;

var $$8$5bv32$2: bv8;

var $$8$6bv32$1: bv8;

var $$8$6bv32$2: bv8;

var $$8$7bv32$1: bv8;

var $$8$7bv32$2: bv8;

var $$8$8bv32$1: bv8;

var $$8$8bv32$2: bv8;

var $$8$9bv32$1: bv8;

var $$8$9bv32$2: bv8;

var $$8$10bv32$1: bv8;

var $$8$10bv32$2: bv8;

var $$8$11bv32$1: bv8;

var $$8$11bv32$2: bv8;

const _WATCHED_VALUE_$$pSobelOriginal: bv8;

procedure {:inline 1} _LOG_READ_$$pSobelOriginal(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$pSobelOriginal;



implementation {:inline 1} _LOG_READ_$$pSobelOriginal(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$pSobelOriginal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pSobelOriginal == _value then true else _READ_HAS_OCCURRED_$$pSobelOriginal);
    return;
}



procedure _CHECK_READ_$$pSobelOriginal(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "pSobelOriginal"} {:array "$$pSobelOriginal"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$pSobelOriginal && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$pSobelOriginal);
  requires {:source_name "pSobelOriginal"} {:array "$$pSobelOriginal"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$pSobelOriginal && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$pSobelOriginal: bool;

procedure {:inline 1} _LOG_WRITE_$$pSobelOriginal(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$pSobelOriginal, _WRITE_READ_BENIGN_FLAG_$$pSobelOriginal;



implementation {:inline 1} _LOG_WRITE_$$pSobelOriginal(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$pSobelOriginal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pSobelOriginal == _value then true else _WRITE_HAS_OCCURRED_$$pSobelOriginal);
    _WRITE_READ_BENIGN_FLAG_$$pSobelOriginal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pSobelOriginal == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$pSobelOriginal);
    return;
}



procedure _CHECK_WRITE_$$pSobelOriginal(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "pSobelOriginal"} {:array "$$pSobelOriginal"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$pSobelOriginal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pSobelOriginal != _value);
  requires {:source_name "pSobelOriginal"} {:array "$$pSobelOriginal"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$pSobelOriginal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pSobelOriginal != _value);
  requires {:source_name "pSobelOriginal"} {:array "$$pSobelOriginal"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$pSobelOriginal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$pSobelOriginal(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$pSobelOriginal;



implementation {:inline 1} _LOG_ATOMIC_$$pSobelOriginal(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$pSobelOriginal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$pSobelOriginal);
    return;
}



procedure _CHECK_ATOMIC_$$pSobelOriginal(_P: bool, _offset: bv32);
  requires {:source_name "pSobelOriginal"} {:array "$$pSobelOriginal"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$pSobelOriginal && _WATCHED_OFFSET == _offset);
  requires {:source_name "pSobelOriginal"} {:array "$$pSobelOriginal"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$pSobelOriginal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pSobelOriginal(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$pSobelOriginal;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pSobelOriginal(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$pSobelOriginal := (if _P && _WRITE_HAS_OCCURRED_$$pSobelOriginal && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$pSobelOriginal);
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

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
