type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "pSobelOriginal"} {:global} $$pSobelOriginal: [bv32]bv8;

axiom {:array_info "$$pSobelOriginal"} {:global} {:elem_width 8} {:source_name "pSobelOriginal"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$pSobelOriginal: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$pSobelOriginal: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$pSobelOriginal: bool;

axiom {:array_info "$$0"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$out"} {:elem_width 8} {:source_name "out"} {:source_elem_width 32} {:source_dimensions "1"} true;

axiom {:array_info "$$tex"} {:global} {:elem_width 8} {:source_name "tex"} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$tex: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$tex: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$tex: bool;

var {:source_name "LocalBlock"} {:group_shared} $$LocalBlock: [bv1][bv32]bv8;

axiom {:array_info "$$LocalBlock"} {:group_shared} {:elem_width 8} {:source_name "LocalBlock"} {:source_elem_width 8} {:source_dimensions "0"} true;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$LocalBlock: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$LocalBlock: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$LocalBlock: bool;

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

function FP32_TO_SI16(bv32) : bv16;

function SI32_TO_FP32(bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "sign_extend 16"} BV16_SEXT32(bv16) : bv32;

function {:bvbuiltin "zero_extend 16"} BV16_ZEXT32(bv16) : bv32;

function {:bvbuiltin "zero_extend 24"} BV8_ZEXT32(bv8) : bv32;

procedure {:source_name "SobelShared"} {:kernel} $_Z11SobelSharedP6uchar4tssssf($SobelPitch: bv16, $BlockWidth: bv16, $SharedPitch: bv16, $w: bv16, $h: bv16, $fScale: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if BV16_ZEXT32($SobelPitch) == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if BV16_SEXT32($BlockWidth) == 80bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if BV16_SEXT32($SharedPitch) == 384bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 3} {:thread 1} (if BV16_SEXT32($w) == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$pSobelOriginal && !_WRITE_HAS_OCCURRED_$$pSobelOriginal && !_ATOMIC_HAS_OCCURRED_$$pSobelOriginal;
  requires !_READ_HAS_OCCURRED_$$tex && !_WRITE_HAS_OCCURRED_$$tex && !_ATOMIC_HAS_OCCURRED_$$tex;
  requires !_READ_HAS_OCCURRED_$$LocalBlock && !_WRITE_HAS_OCCURRED_$$LocalBlock && !_ATOMIC_HAS_OCCURRED_$$LocalBlock;
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
  modifies $$LocalBlock, _WRITE_HAS_OCCURRED_$$LocalBlock, _WRITE_READ_BENIGN_FLAG_$$LocalBlock, _WRITE_READ_BENIGN_FLAG_$$LocalBlock, $$pSobelOriginal, _TRACKING, _READ_HAS_OCCURRED_$$LocalBlock, _WRITE_HAS_OCCURRED_$$pSobelOriginal, _WRITE_READ_BENIGN_FLAG_$$pSobelOriginal, _WRITE_READ_BENIGN_FLAG_$$pSobelOriginal, _TRACKING;



implementation {:source_name "SobelShared"} {:kernel} $_Z11SobelSharedP6uchar4tssssf($SobelPitch: bv16, $BlockWidth: bv16, $SharedPitch: bv16, $w: bv16, $h: bv16, $fScale: bv32)
{
  var $ib.0$1: bv16;
  var $ib.0$2: bv16;
  var $ib.1$1: bv16;
  var $ib.1$2: bv16;
  var $ib.2$1: bv16;
  var $ib.2$2: bv16;
  var $.01$1: bv8;
  var $.01$2: bv8;
  var $.03$1: bv8;
  var $.03$2: bv8;
  var $.02$1: bv8;
  var $.02$2: bv8;
  var $.0$1: bv8;
  var $.0$2: bv8;
  var v0$1: bv16;
  var v0$2: bv16;
  var v1$1: bv16;
  var v1$2: bv16;
  var v2$1: bv32;
  var v2$2: bv32;
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
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
  var v33$1: bv8;
  var v33$2: bv8;
  var v34$1: bv8;
  var v34$2: bv8;
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
  var v32$1: bv8;
  var v32$2: bv8;
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
  var v59$1: bv8;
  var v59$2: bv8;
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
  var v58$1: bv8;
  var v58$2: bv8;
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
  var v66$1: bv8;
  var v66$2: bv8;
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
  var v92$1: bool;
  var v92$2: bool;
  var v93$1: bv32;
  var v93$2: bv32;
  var v94$1: bool;
  var v94$2: bool;
  var v122$1: bv8;
  var v122$2: bv8;
  var v95$1: bv8;
  var v95$2: bv8;
  var v96$1: bv8;
  var v96$2: bv8;
  var v97$1: bv8;
  var v97$2: bv8;
  var v98$1: bv8;
  var v98$2: bv8;
  var v103$1: bv8;
  var v103$2: bv8;
  var v99$1: bv8;
  var v99$2: bv8;
  var v100$1: bv8;
  var v100$2: bv8;
  var v101$1: bv8;
  var v101$2: bv8;
  var v102$1: bv8;
  var v102$2: bv8;
  var v104$1: bv8;
  var v104$2: bv8;
  var v105$1: bv8;
  var v105$2: bv8;
  var v106$1: bv8;
  var v106$2: bv8;
  var v123$1: bv8;
  var v123$2: bv8;
  var v124$1: bv8;
  var v124$2: bv8;
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
  var v149$1: bv8;
  var v149$2: bv8;
  var v150$1: bv8;
  var v150$2: bv8;
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
  var v132$1: bv8;
  var v132$2: bv8;
  var v133$1: bv8;
  var v133$2: bv8;
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
  var v148$1: bv8;
  var v148$2: bv8;
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
  var v183$1: bv16;
  var v183$2: bv16;
  var v184$1: bv32;
  var v184$2: bv32;
  var v185$1: bool;
  var v185$2: bool;
  var v186$1: bv8;
  var v186$2: bv8;
  var v189$1: bv8;
  var v189$2: bv8;
  var v187$1: bv8;
  var v187$2: bv8;
  var v188$1: bv8;
  var v188$2: bv8;
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
  var v195$1: bv32;
  var v195$2: bv32;
  var v196$1: bv32;
  var v196$2: bv32;
  var v197$1: bv16;
  var v197$2: bv16;
  var v198$1: bool;
  var v198$2: bool;
  var v199$1: bool;
  var v199$2: bool;
  var v200$1: bv8;
  var v200$2: bv8;
  var v201$1: bv8;
  var v201$2: bv8;
  var v202$1: bv8;
  var v202$2: bv8;
  var v203$1: bv32;
  var v203$2: bv32;
  var v204$1: bv32;
  var v204$2: bv32;
  var v205$1: bv16;
  var v205$2: bv16;
  var v206$1: bool;
  var v206$2: bool;
  var v207$1: bool;
  var v207$2: bool;
  var v208$1: bv8;
  var v208$2: bv8;
  var v209$1: bv8;
  var v209$2: bv8;
  var v210$1: bv8;
  var v210$2: bv8;
  var v211$1: bv32;
  var v211$2: bv32;
  var v212$1: bv32;
  var v212$2: bv32;
  var v213$1: bv16;
  var v213$2: bv16;
  var v214$1: bool;
  var v214$2: bool;
  var v215$1: bool;
  var v215$2: bool;
  var v216$1: bv8;
  var v216$2: bv8;
  var v217$1: bv8;
  var v217$2: bv8;
  var v218$1: bv8;
  var v218$2: bv8;
  var v219$1: bv32;
  var v219$2: bv32;
  var v220$1: bv32;
  var v220$2: bv32;
  var v221$1: bv16;
  var v221$2: bv16;
  var v222$1: bool;
  var v222$2: bool;
  var v223$1: bool;
  var v223$2: bool;
  var v224$1: bool;
  var v224$2: bool;
  var v225$1: bool;
  var v225$2: bool;
  var v226$1: bv8;
  var v226$2: bv8;
  var v227$1: bv8;
  var v227$2: bv8;
  var v228$1: bv8;
  var v228$2: bv8;
  var v229$1: bv8;
  var v229$2: bv8;
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
  var p14$1: bool;
  var p14$2: bool;
  var p15$1: bool;
  var p15$2: bool;
  var p16$1: bool;
  var p16$2: bool;
  var p17$1: bool;
  var p17$2: bool;
  var p18$1: bool;
  var p18$2: bool;
  var p19$1: bool;
  var p19$2: bool;
  var p20$1: bool;
  var p20$2: bool;
  var p21$1: bool;
  var p21$2: bool;
  var p22$1: bool;
  var p22$2: bool;
  var p23$1: bool;
  var p23$2: bool;
  var p24$1: bool;
  var p24$2: bool;
  var p25$1: bool;
  var p25$2: bool;
  var p26$1: bool;
  var p26$2: bool;
  var p27$1: bool;
  var p27$2: bool;
  var p28$1: bool;
  var p28$2: bool;
  var _HAVOC_bv8$1: bv8;
  var _HAVOC_bv8$2: bv8;


  $0:
    v0$1 := BV32_MUL(BV32_MUL(4bv32, group_id_x$1), BV16_SEXT32($BlockWidth))[16:0];
    v0$2 := BV32_MUL(BV32_MUL(4bv32, group_id_x$2), BV16_SEXT32($BlockWidth))[16:0];
    v1$1 := BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1)[16:0];
    v1$2 := BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2)[16:0];
    v2$1 := BV32_MUL(local_id_y$1, BV16_SEXT32($SharedPitch));
    v2$2 := BV32_MUL(local_id_y$2, BV16_SEXT32($SharedPitch));
    $ib.0$1 := local_id_x$1[16:0];
    $ib.0$2 := local_id_x$2[16:0];
    p0$1 := false;
    p0$2 := false;
    p4$1 := false;
    p4$2 := false;
    p7$1 := false;
    p7$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$LocalBlock ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$LocalBlock ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$LocalBlock ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 5} p0$1 ==> true;
    v3$1 := (if p0$1 then BV32_SLT(BV16_SEXT32($ib.0$1), BV32_ADD(BV16_SEXT32($BlockWidth), 2bv32)) else v3$1);
    v3$2 := (if p0$2 then BV32_SLT(BV16_SEXT32($ib.0$2), BV32_ADD(BV16_SEXT32($BlockWidth), 2bv32)) else v3$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p6$1 := false;
    p6$2 := false;
    p1$1 := (if p0$1 && v3$1 then v3$1 else p1$1);
    p1$2 := (if p0$2 && v3$2 then v3$2 else p1$2);
    p0$1 := (if p0$1 && !v3$1 then v3$1 else p0$1);
    p0$2 := (if p0$2 && !v3$2 then v3$2 else p0$2);
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
    v17$1 := (if p1$1 then $$0$4bv32$1 else v17$1);
    v17$2 := (if p1$2 then $$0$4bv32$2 else v17$2);
    v18$1 := (if p1$1 then $$0$5bv32$1 else v18$1);
    v18$2 := (if p1$2 then $$0$5bv32$2 else v18$2);
    v19$1 := (if p1$1 then $$0$6bv32$1 else v19$1);
    v19$2 := (if p1$2 then $$0$6bv32$2 else v19$2);
    v20$1 := (if p1$1 then $$0$7bv32$1 else v20$1);
    v20$2 := (if p1$2 then $$0$7bv32$2 else v20$2);
    v21$1 := (if p1$1 then $$0$8bv32$1 else v21$1);
    v21$2 := (if p1$2 then $$0$8bv32$2 else v21$2);
    v22$1 := (if p1$1 then $$0$9bv32$1 else v22$1);
    v22$2 := (if p1$2 then $$0$9bv32$2 else v22$2);
    v23$1 := (if p1$1 then $$0$10bv32$1 else v23$1);
    v23$2 := (if p1$2 then $$0$10bv32$2 else v23$2);
    v24$1 := (if p1$1 then $$0$11bv32$1 else v24$1);
    v24$2 := (if p1$2 then $$0$11bv32$2 else v24$2);
    call {:sourceloc_num 40} v25$1, v25$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p1$1, v16$1, v20$1 ++ v19$1 ++ v18$1 ++ v17$1, v24$1 ++ v23$1 ++ v22$1 ++ v21$1, SI32_TO_FP32(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$1), BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 1bv32)), SI32_TO_FP32(BV32_SUB(BV16_SEXT32(v1$1), 1bv32)), p1$2, v16$2, v20$2 ++ v19$2 ++ v18$2 ++ v17$2, v24$2 ++ v23$2 ++ v22$2 ++ v21$2, SI32_TO_FP32(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$2), BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 1bv32)), SI32_TO_FP32(BV32_SUB(BV16_SEXT32(v1$2), 1bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$LocalBlock(p1$1, BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), v25$1, $$LocalBlock[1bv1][BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1)))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LocalBlock(p1$2, BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))));
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$LocalBlock(p1$2, BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), v25$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LocalBlock"} true;
    $$LocalBlock[1bv1][BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1)))] := (if p1$1 then v25$1 else $$LocalBlock[1bv1][BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1)))]);
    $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2)))] := (if p1$2 then v25$2 else $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2)))]);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v26$1 := (if p1$1 then _HAVOC_bv8$1 else v26$1);
    v26$2 := (if p1$2 then _HAVOC_bv8$2 else v26$2);
    $$1$0bv32$1 := (if p1$1 then v26$1 else $$1$0bv32$1);
    $$1$0bv32$2 := (if p1$2 then v26$2 else $$1$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v27$1 := (if p1$1 then _HAVOC_bv8$1 else v27$1);
    v27$2 := (if p1$2 then _HAVOC_bv8$2 else v27$2);
    $$1$1bv32$1 := (if p1$1 then v27$1 else $$1$1bv32$1);
    $$1$1bv32$2 := (if p1$2 then v27$2 else $$1$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v28$1 := (if p1$1 then _HAVOC_bv8$1 else v28$1);
    v28$2 := (if p1$2 then _HAVOC_bv8$2 else v28$2);
    $$1$2bv32$1 := (if p1$1 then v28$1 else $$1$2bv32$1);
    $$1$2bv32$2 := (if p1$2 then v28$2 else $$1$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v29$1 := (if p1$1 then _HAVOC_bv8$1 else v29$1);
    v29$2 := (if p1$2 then _HAVOC_bv8$2 else v29$2);
    $$1$3bv32$1 := (if p1$1 then v29$1 else $$1$3bv32$1);
    $$1$3bv32$2 := (if p1$2 then v29$2 else $$1$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v30$1 := (if p1$1 then _HAVOC_bv8$1 else v30$1);
    v30$2 := (if p1$2 then _HAVOC_bv8$2 else v30$2);
    $$1$4bv32$1 := (if p1$1 then v30$1 else $$1$4bv32$1);
    $$1$4bv32$2 := (if p1$2 then v30$2 else $$1$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v31$1 := (if p1$1 then _HAVOC_bv8$1 else v31$1);
    v31$2 := (if p1$2 then _HAVOC_bv8$2 else v31$2);
    $$1$5bv32$1 := (if p1$1 then v31$1 else $$1$5bv32$1);
    $$1$5bv32$2 := (if p1$2 then v31$2 else $$1$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v32$1 := (if p1$1 then _HAVOC_bv8$1 else v32$1);
    v32$2 := (if p1$2 then _HAVOC_bv8$2 else v32$2);
    $$1$6bv32$1 := (if p1$1 then v32$1 else $$1$6bv32$1);
    $$1$6bv32$2 := (if p1$2 then v32$2 else $$1$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v33$1 := (if p1$1 then _HAVOC_bv8$1 else v33$1);
    v33$2 := (if p1$2 then _HAVOC_bv8$2 else v33$2);
    $$1$7bv32$1 := (if p1$1 then v33$1 else $$1$7bv32$1);
    $$1$7bv32$2 := (if p1$2 then v33$2 else $$1$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v34$1 := (if p1$1 then _HAVOC_bv8$1 else v34$1);
    v34$2 := (if p1$2 then _HAVOC_bv8$2 else v34$2);
    $$1$8bv32$1 := (if p1$1 then v34$1 else $$1$8bv32$1);
    $$1$8bv32$2 := (if p1$2 then v34$2 else $$1$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v35$1 := (if p1$1 then _HAVOC_bv8$1 else v35$1);
    v35$2 := (if p1$2 then _HAVOC_bv8$2 else v35$2);
    $$1$9bv32$1 := (if p1$1 then v35$1 else $$1$9bv32$1);
    $$1$9bv32$2 := (if p1$2 then v35$2 else $$1$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v36$1 := (if p1$1 then _HAVOC_bv8$1 else v36$1);
    v36$2 := (if p1$2 then _HAVOC_bv8$2 else v36$2);
    $$1$10bv32$1 := (if p1$1 then v36$1 else $$1$10bv32$1);
    $$1$10bv32$2 := (if p1$2 then v36$2 else $$1$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v37$1 := (if p1$1 then _HAVOC_bv8$1 else v37$1);
    v37$2 := (if p1$2 then _HAVOC_bv8$2 else v37$2);
    $$1$11bv32$1 := (if p1$1 then v37$1 else $$1$11bv32$1);
    $$1$11bv32$2 := (if p1$2 then v37$2 else $$1$11bv32$2);
    v38$1 := (if p1$1 then $$1$0bv32$1 else v38$1);
    v38$2 := (if p1$2 then $$1$0bv32$2 else v38$2);
    v39$1 := (if p1$1 then $$1$4bv32$1 else v39$1);
    v39$2 := (if p1$2 then $$1$4bv32$2 else v39$2);
    v40$1 := (if p1$1 then $$1$5bv32$1 else v40$1);
    v40$2 := (if p1$2 then $$1$5bv32$2 else v40$2);
    v41$1 := (if p1$1 then $$1$6bv32$1 else v41$1);
    v41$2 := (if p1$2 then $$1$6bv32$2 else v41$2);
    v42$1 := (if p1$1 then $$1$7bv32$1 else v42$1);
    v42$2 := (if p1$2 then $$1$7bv32$2 else v42$2);
    v43$1 := (if p1$1 then $$1$8bv32$1 else v43$1);
    v43$2 := (if p1$2 then $$1$8bv32$2 else v43$2);
    v44$1 := (if p1$1 then $$1$9bv32$1 else v44$1);
    v44$2 := (if p1$2 then $$1$9bv32$2 else v44$2);
    v45$1 := (if p1$1 then $$1$10bv32$1 else v45$1);
    v45$2 := (if p1$2 then $$1$10bv32$2 else v45$2);
    v46$1 := (if p1$1 then $$1$11bv32$1 else v46$1);
    v46$2 := (if p1$2 then $$1$11bv32$2 else v46$2);
    call {:sourceloc_num 75} v47$1, v47$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p1$1, v38$1, v42$1 ++ v41$1 ++ v40$1 ++ v39$1, v46$1 ++ v45$1 ++ v44$1 ++ v43$1, SI32_TO_FP32(BV32_ADD(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$1), BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 1bv32), 1bv32)), SI32_TO_FP32(BV32_SUB(BV16_SEXT32(v1$1), 1bv32)), p1$2, v38$2, v42$2 ++ v41$2 ++ v40$2 ++ v39$2, v46$2 ++ v45$2 ++ v44$2 ++ v43$2, SI32_TO_FP32(BV32_ADD(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$2), BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 1bv32), 1bv32)), SI32_TO_FP32(BV32_SUB(BV16_SEXT32(v1$2), 1bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    call {:sourceloc} {:sourceloc_num 76} _LOG_WRITE_$$LocalBlock(p1$1, BV32_ADD(BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 1bv32), v47$1, $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LocalBlock(p1$2, BV32_ADD(BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 76} _CHECK_WRITE_$$LocalBlock(p1$2, BV32_ADD(BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 1bv32), v47$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LocalBlock"} true;
    $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 1bv32)] := (if p1$1 then v47$1 else $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 1bv32)]);
    $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 1bv32)] := (if p1$2 then v47$2 else $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 1bv32)]);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v48$1 := (if p1$1 then _HAVOC_bv8$1 else v48$1);
    v48$2 := (if p1$2 then _HAVOC_bv8$2 else v48$2);
    $$2$0bv32$1 := (if p1$1 then v48$1 else $$2$0bv32$1);
    $$2$0bv32$2 := (if p1$2 then v48$2 else $$2$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v49$1 := (if p1$1 then _HAVOC_bv8$1 else v49$1);
    v49$2 := (if p1$2 then _HAVOC_bv8$2 else v49$2);
    $$2$1bv32$1 := (if p1$1 then v49$1 else $$2$1bv32$1);
    $$2$1bv32$2 := (if p1$2 then v49$2 else $$2$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v50$1 := (if p1$1 then _HAVOC_bv8$1 else v50$1);
    v50$2 := (if p1$2 then _HAVOC_bv8$2 else v50$2);
    $$2$2bv32$1 := (if p1$1 then v50$1 else $$2$2bv32$1);
    $$2$2bv32$2 := (if p1$2 then v50$2 else $$2$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v51$1 := (if p1$1 then _HAVOC_bv8$1 else v51$1);
    v51$2 := (if p1$2 then _HAVOC_bv8$2 else v51$2);
    $$2$3bv32$1 := (if p1$1 then v51$1 else $$2$3bv32$1);
    $$2$3bv32$2 := (if p1$2 then v51$2 else $$2$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v52$1 := (if p1$1 then _HAVOC_bv8$1 else v52$1);
    v52$2 := (if p1$2 then _HAVOC_bv8$2 else v52$2);
    $$2$4bv32$1 := (if p1$1 then v52$1 else $$2$4bv32$1);
    $$2$4bv32$2 := (if p1$2 then v52$2 else $$2$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v53$1 := (if p1$1 then _HAVOC_bv8$1 else v53$1);
    v53$2 := (if p1$2 then _HAVOC_bv8$2 else v53$2);
    $$2$5bv32$1 := (if p1$1 then v53$1 else $$2$5bv32$1);
    $$2$5bv32$2 := (if p1$2 then v53$2 else $$2$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v54$1 := (if p1$1 then _HAVOC_bv8$1 else v54$1);
    v54$2 := (if p1$2 then _HAVOC_bv8$2 else v54$2);
    $$2$6bv32$1 := (if p1$1 then v54$1 else $$2$6bv32$1);
    $$2$6bv32$2 := (if p1$2 then v54$2 else $$2$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v55$1 := (if p1$1 then _HAVOC_bv8$1 else v55$1);
    v55$2 := (if p1$2 then _HAVOC_bv8$2 else v55$2);
    $$2$7bv32$1 := (if p1$1 then v55$1 else $$2$7bv32$1);
    $$2$7bv32$2 := (if p1$2 then v55$2 else $$2$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v56$1 := (if p1$1 then _HAVOC_bv8$1 else v56$1);
    v56$2 := (if p1$2 then _HAVOC_bv8$2 else v56$2);
    $$2$8bv32$1 := (if p1$1 then v56$1 else $$2$8bv32$1);
    $$2$8bv32$2 := (if p1$2 then v56$2 else $$2$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v57$1 := (if p1$1 then _HAVOC_bv8$1 else v57$1);
    v57$2 := (if p1$2 then _HAVOC_bv8$2 else v57$2);
    $$2$9bv32$1 := (if p1$1 then v57$1 else $$2$9bv32$1);
    $$2$9bv32$2 := (if p1$2 then v57$2 else $$2$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v58$1 := (if p1$1 then _HAVOC_bv8$1 else v58$1);
    v58$2 := (if p1$2 then _HAVOC_bv8$2 else v58$2);
    $$2$10bv32$1 := (if p1$1 then v58$1 else $$2$10bv32$1);
    $$2$10bv32$2 := (if p1$2 then v58$2 else $$2$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v59$1 := (if p1$1 then _HAVOC_bv8$1 else v59$1);
    v59$2 := (if p1$2 then _HAVOC_bv8$2 else v59$2);
    $$2$11bv32$1 := (if p1$1 then v59$1 else $$2$11bv32$1);
    $$2$11bv32$2 := (if p1$2 then v59$2 else $$2$11bv32$2);
    v60$1 := (if p1$1 then $$2$0bv32$1 else v60$1);
    v60$2 := (if p1$2 then $$2$0bv32$2 else v60$2);
    v61$1 := (if p1$1 then $$2$4bv32$1 else v61$1);
    v61$2 := (if p1$2 then $$2$4bv32$2 else v61$2);
    v62$1 := (if p1$1 then $$2$5bv32$1 else v62$1);
    v62$2 := (if p1$2 then $$2$5bv32$2 else v62$2);
    v63$1 := (if p1$1 then $$2$6bv32$1 else v63$1);
    v63$2 := (if p1$2 then $$2$6bv32$2 else v63$2);
    v64$1 := (if p1$1 then $$2$7bv32$1 else v64$1);
    v64$2 := (if p1$2 then $$2$7bv32$2 else v64$2);
    v65$1 := (if p1$1 then $$2$8bv32$1 else v65$1);
    v65$2 := (if p1$2 then $$2$8bv32$2 else v65$2);
    v66$1 := (if p1$1 then $$2$9bv32$1 else v66$1);
    v66$2 := (if p1$2 then $$2$9bv32$2 else v66$2);
    v67$1 := (if p1$1 then $$2$10bv32$1 else v67$1);
    v67$2 := (if p1$2 then $$2$10bv32$2 else v67$2);
    v68$1 := (if p1$1 then $$2$11bv32$1 else v68$1);
    v68$2 := (if p1$2 then $$2$11bv32$2 else v68$2);
    call {:sourceloc_num 110} v69$1, v69$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p1$1, v60$1, v64$1 ++ v63$1 ++ v62$1 ++ v61$1, v68$1 ++ v67$1 ++ v66$1 ++ v65$1, SI32_TO_FP32(BV32_ADD(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$1), BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 1bv32), 2bv32)), SI32_TO_FP32(BV32_SUB(BV16_SEXT32(v1$1), 1bv32)), p1$2, v60$2, v64$2 ++ v63$2 ++ v62$2 ++ v61$2, v68$2 ++ v67$2 ++ v66$2 ++ v65$2, SI32_TO_FP32(BV32_ADD(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$2), BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 1bv32), 2bv32)), SI32_TO_FP32(BV32_SUB(BV16_SEXT32(v1$2), 1bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    call {:sourceloc} {:sourceloc_num 111} _LOG_WRITE_$$LocalBlock(p1$1, BV32_ADD(BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 2bv32), v69$1, $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LocalBlock(p1$2, BV32_ADD(BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 111} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 111} _CHECK_WRITE_$$LocalBlock(p1$2, BV32_ADD(BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 2bv32), v69$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LocalBlock"} true;
    $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 2bv32)] := (if p1$1 then v69$1 else $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 2bv32)]);
    $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 2bv32)] := (if p1$2 then v69$2 else $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 2bv32)]);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v70$1 := (if p1$1 then _HAVOC_bv8$1 else v70$1);
    v70$2 := (if p1$2 then _HAVOC_bv8$2 else v70$2);
    $$3$0bv32$1 := (if p1$1 then v70$1 else $$3$0bv32$1);
    $$3$0bv32$2 := (if p1$2 then v70$2 else $$3$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v71$1 := (if p1$1 then _HAVOC_bv8$1 else v71$1);
    v71$2 := (if p1$2 then _HAVOC_bv8$2 else v71$2);
    $$3$1bv32$1 := (if p1$1 then v71$1 else $$3$1bv32$1);
    $$3$1bv32$2 := (if p1$2 then v71$2 else $$3$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v72$1 := (if p1$1 then _HAVOC_bv8$1 else v72$1);
    v72$2 := (if p1$2 then _HAVOC_bv8$2 else v72$2);
    $$3$2bv32$1 := (if p1$1 then v72$1 else $$3$2bv32$1);
    $$3$2bv32$2 := (if p1$2 then v72$2 else $$3$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v73$1 := (if p1$1 then _HAVOC_bv8$1 else v73$1);
    v73$2 := (if p1$2 then _HAVOC_bv8$2 else v73$2);
    $$3$3bv32$1 := (if p1$1 then v73$1 else $$3$3bv32$1);
    $$3$3bv32$2 := (if p1$2 then v73$2 else $$3$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v74$1 := (if p1$1 then _HAVOC_bv8$1 else v74$1);
    v74$2 := (if p1$2 then _HAVOC_bv8$2 else v74$2);
    $$3$4bv32$1 := (if p1$1 then v74$1 else $$3$4bv32$1);
    $$3$4bv32$2 := (if p1$2 then v74$2 else $$3$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v75$1 := (if p1$1 then _HAVOC_bv8$1 else v75$1);
    v75$2 := (if p1$2 then _HAVOC_bv8$2 else v75$2);
    $$3$5bv32$1 := (if p1$1 then v75$1 else $$3$5bv32$1);
    $$3$5bv32$2 := (if p1$2 then v75$2 else $$3$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v76$1 := (if p1$1 then _HAVOC_bv8$1 else v76$1);
    v76$2 := (if p1$2 then _HAVOC_bv8$2 else v76$2);
    $$3$6bv32$1 := (if p1$1 then v76$1 else $$3$6bv32$1);
    $$3$6bv32$2 := (if p1$2 then v76$2 else $$3$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v77$1 := (if p1$1 then _HAVOC_bv8$1 else v77$1);
    v77$2 := (if p1$2 then _HAVOC_bv8$2 else v77$2);
    $$3$7bv32$1 := (if p1$1 then v77$1 else $$3$7bv32$1);
    $$3$7bv32$2 := (if p1$2 then v77$2 else $$3$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v78$1 := (if p1$1 then _HAVOC_bv8$1 else v78$1);
    v78$2 := (if p1$2 then _HAVOC_bv8$2 else v78$2);
    $$3$8bv32$1 := (if p1$1 then v78$1 else $$3$8bv32$1);
    $$3$8bv32$2 := (if p1$2 then v78$2 else $$3$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v79$1 := (if p1$1 then _HAVOC_bv8$1 else v79$1);
    v79$2 := (if p1$2 then _HAVOC_bv8$2 else v79$2);
    $$3$9bv32$1 := (if p1$1 then v79$1 else $$3$9bv32$1);
    $$3$9bv32$2 := (if p1$2 then v79$2 else $$3$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v80$1 := (if p1$1 then _HAVOC_bv8$1 else v80$1);
    v80$2 := (if p1$2 then _HAVOC_bv8$2 else v80$2);
    $$3$10bv32$1 := (if p1$1 then v80$1 else $$3$10bv32$1);
    $$3$10bv32$2 := (if p1$2 then v80$2 else $$3$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v81$1 := (if p1$1 then _HAVOC_bv8$1 else v81$1);
    v81$2 := (if p1$2 then _HAVOC_bv8$2 else v81$2);
    $$3$11bv32$1 := (if p1$1 then v81$1 else $$3$11bv32$1);
    $$3$11bv32$2 := (if p1$2 then v81$2 else $$3$11bv32$2);
    v82$1 := (if p1$1 then $$3$0bv32$1 else v82$1);
    v82$2 := (if p1$2 then $$3$0bv32$2 else v82$2);
    v83$1 := (if p1$1 then $$3$4bv32$1 else v83$1);
    v83$2 := (if p1$2 then $$3$4bv32$2 else v83$2);
    v84$1 := (if p1$1 then $$3$5bv32$1 else v84$1);
    v84$2 := (if p1$2 then $$3$5bv32$2 else v84$2);
    v85$1 := (if p1$1 then $$3$6bv32$1 else v85$1);
    v85$2 := (if p1$2 then $$3$6bv32$2 else v85$2);
    v86$1 := (if p1$1 then $$3$7bv32$1 else v86$1);
    v86$2 := (if p1$2 then $$3$7bv32$2 else v86$2);
    v87$1 := (if p1$1 then $$3$8bv32$1 else v87$1);
    v87$2 := (if p1$2 then $$3$8bv32$2 else v87$2);
    v88$1 := (if p1$1 then $$3$9bv32$1 else v88$1);
    v88$2 := (if p1$2 then $$3$9bv32$2 else v88$2);
    v89$1 := (if p1$1 then $$3$10bv32$1 else v89$1);
    v89$2 := (if p1$2 then $$3$10bv32$2 else v89$2);
    v90$1 := (if p1$1 then $$3$11bv32$1 else v90$1);
    v90$2 := (if p1$2 then $$3$11bv32$2 else v90$2);
    call {:sourceloc_num 145} v91$1, v91$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p1$1, v82$1, v86$1 ++ v85$1 ++ v84$1 ++ v83$1, v90$1 ++ v89$1 ++ v88$1 ++ v87$1, SI32_TO_FP32(BV32_ADD(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$1), BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 1bv32), 3bv32)), SI32_TO_FP32(BV32_SUB(BV16_SEXT32(v1$1), 1bv32)), p1$2, v82$2, v86$2 ++ v85$2 ++ v84$2 ++ v83$2, v90$2 ++ v89$2 ++ v88$2 ++ v87$2, SI32_TO_FP32(BV32_ADD(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$2), BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 1bv32), 3bv32)), SI32_TO_FP32(BV32_SUB(BV16_SEXT32(v1$2), 1bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    call {:sourceloc} {:sourceloc_num 146} _LOG_WRITE_$$LocalBlock(p1$1, BV32_ADD(BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 3bv32), v91$1, $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LocalBlock(p1$2, BV32_ADD(BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 146} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 146} _CHECK_WRITE_$$LocalBlock(p1$2, BV32_ADD(BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 3bv32), v91$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LocalBlock"} true;
    $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 3bv32)] := (if p1$1 then v91$1 else $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v2$1, BV32_MUL(4bv32, BV16_SEXT32($ib.0$1))), 3bv32)]);
    $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 3bv32)] := (if p1$2 then v91$2 else $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v2$2, BV32_MUL(4bv32, BV16_SEXT32($ib.0$2))), 3bv32)]);
    $ib.0$1 := (if p1$1 then BV32_ADD(BV16_SEXT32($ib.0$1), group_size_x)[16:0] else $ib.0$1);
    $ib.0$2 := (if p1$2 then BV32_ADD(BV16_SEXT32($ib.0$2), group_size_x)[16:0] else $ib.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    v92$1 := BV32_ULT(local_id_y$1, 2bv32);
    v92$2 := BV32_ULT(local_id_y$2, 2bv32);
    p3$1 := (if v92$1 then v92$1 else p3$1);
    p3$2 := (if v92$2 then v92$2 else p3$2);
    v93$1 := (if p3$1 then BV32_MUL(BV32_ADD(group_size_y, local_id_y$1), BV16_SEXT32($SharedPitch)) else v93$1);
    v93$2 := (if p3$2 then BV32_MUL(BV32_ADD(group_size_y, local_id_y$2), BV16_SEXT32($SharedPitch)) else v93$2);
    $ib.1$1 := (if p3$1 then local_id_x$1[16:0] else $ib.1$1);
    $ib.1$2 := (if p3$2 then local_id_x$2[16:0] else $ib.1$2);
    p4$1 := (if p3$1 then true else p4$1);
    p4$2 := (if p3$2 then true else p4$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $6;

  $6:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$LocalBlock ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$LocalBlock ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$LocalBlock ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 150} p4$1 ==> true;
    v94$1 := (if p4$1 then BV32_SLT(BV16_SEXT32($ib.1$1), BV32_ADD(BV16_SEXT32($BlockWidth), 2bv32)) else v94$1);
    v94$2 := (if p4$2 then BV32_SLT(BV16_SEXT32($ib.1$2), BV32_ADD(BV16_SEXT32($BlockWidth), 2bv32)) else v94$2);
    p5$1 := false;
    p5$2 := false;
    p5$1 := (if p4$1 && v94$1 then v94$1 else p5$1);
    p5$2 := (if p4$2 && v94$2 then v94$2 else p5$2);
    p4$1 := (if p4$1 && !v94$1 then v94$1 else p4$1);
    p4$2 := (if p4$2 && !v94$2 then v94$2 else p4$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v95$1 := (if p5$1 then _HAVOC_bv8$1 else v95$1);
    v95$2 := (if p5$2 then _HAVOC_bv8$2 else v95$2);
    $$4$0bv32$1 := (if p5$1 then v95$1 else $$4$0bv32$1);
    $$4$0bv32$2 := (if p5$2 then v95$2 else $$4$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v96$1 := (if p5$1 then _HAVOC_bv8$1 else v96$1);
    v96$2 := (if p5$2 then _HAVOC_bv8$2 else v96$2);
    $$4$1bv32$1 := (if p5$1 then v96$1 else $$4$1bv32$1);
    $$4$1bv32$2 := (if p5$2 then v96$2 else $$4$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v97$1 := (if p5$1 then _HAVOC_bv8$1 else v97$1);
    v97$2 := (if p5$2 then _HAVOC_bv8$2 else v97$2);
    $$4$2bv32$1 := (if p5$1 then v97$1 else $$4$2bv32$1);
    $$4$2bv32$2 := (if p5$2 then v97$2 else $$4$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v98$1 := (if p5$1 then _HAVOC_bv8$1 else v98$1);
    v98$2 := (if p5$2 then _HAVOC_bv8$2 else v98$2);
    $$4$3bv32$1 := (if p5$1 then v98$1 else $$4$3bv32$1);
    $$4$3bv32$2 := (if p5$2 then v98$2 else $$4$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v99$1 := (if p5$1 then _HAVOC_bv8$1 else v99$1);
    v99$2 := (if p5$2 then _HAVOC_bv8$2 else v99$2);
    $$4$4bv32$1 := (if p5$1 then v99$1 else $$4$4bv32$1);
    $$4$4bv32$2 := (if p5$2 then v99$2 else $$4$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v100$1 := (if p5$1 then _HAVOC_bv8$1 else v100$1);
    v100$2 := (if p5$2 then _HAVOC_bv8$2 else v100$2);
    $$4$5bv32$1 := (if p5$1 then v100$1 else $$4$5bv32$1);
    $$4$5bv32$2 := (if p5$2 then v100$2 else $$4$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v101$1 := (if p5$1 then _HAVOC_bv8$1 else v101$1);
    v101$2 := (if p5$2 then _HAVOC_bv8$2 else v101$2);
    $$4$6bv32$1 := (if p5$1 then v101$1 else $$4$6bv32$1);
    $$4$6bv32$2 := (if p5$2 then v101$2 else $$4$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v102$1 := (if p5$1 then _HAVOC_bv8$1 else v102$1);
    v102$2 := (if p5$2 then _HAVOC_bv8$2 else v102$2);
    $$4$7bv32$1 := (if p5$1 then v102$1 else $$4$7bv32$1);
    $$4$7bv32$2 := (if p5$2 then v102$2 else $$4$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v103$1 := (if p5$1 then _HAVOC_bv8$1 else v103$1);
    v103$2 := (if p5$2 then _HAVOC_bv8$2 else v103$2);
    $$4$8bv32$1 := (if p5$1 then v103$1 else $$4$8bv32$1);
    $$4$8bv32$2 := (if p5$2 then v103$2 else $$4$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v104$1 := (if p5$1 then _HAVOC_bv8$1 else v104$1);
    v104$2 := (if p5$2 then _HAVOC_bv8$2 else v104$2);
    $$4$9bv32$1 := (if p5$1 then v104$1 else $$4$9bv32$1);
    $$4$9bv32$2 := (if p5$2 then v104$2 else $$4$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v105$1 := (if p5$1 then _HAVOC_bv8$1 else v105$1);
    v105$2 := (if p5$2 then _HAVOC_bv8$2 else v105$2);
    $$4$10bv32$1 := (if p5$1 then v105$1 else $$4$10bv32$1);
    $$4$10bv32$2 := (if p5$2 then v105$2 else $$4$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v106$1 := (if p5$1 then _HAVOC_bv8$1 else v106$1);
    v106$2 := (if p5$2 then _HAVOC_bv8$2 else v106$2);
    $$4$11bv32$1 := (if p5$1 then v106$1 else $$4$11bv32$1);
    $$4$11bv32$2 := (if p5$2 then v106$2 else $$4$11bv32$2);
    v107$1 := (if p5$1 then $$4$0bv32$1 else v107$1);
    v107$2 := (if p5$2 then $$4$0bv32$2 else v107$2);
    v108$1 := (if p5$1 then $$4$4bv32$1 else v108$1);
    v108$2 := (if p5$2 then $$4$4bv32$2 else v108$2);
    v109$1 := (if p5$1 then $$4$5bv32$1 else v109$1);
    v109$2 := (if p5$2 then $$4$5bv32$2 else v109$2);
    v110$1 := (if p5$1 then $$4$6bv32$1 else v110$1);
    v110$2 := (if p5$2 then $$4$6bv32$2 else v110$2);
    v111$1 := (if p5$1 then $$4$7bv32$1 else v111$1);
    v111$2 := (if p5$2 then $$4$7bv32$2 else v111$2);
    v112$1 := (if p5$1 then $$4$8bv32$1 else v112$1);
    v112$2 := (if p5$2 then $$4$8bv32$2 else v112$2);
    v113$1 := (if p5$1 then $$4$9bv32$1 else v113$1);
    v113$2 := (if p5$2 then $$4$9bv32$2 else v113$2);
    v114$1 := (if p5$1 then $$4$10bv32$1 else v114$1);
    v114$2 := (if p5$2 then $$4$10bv32$2 else v114$2);
    v115$1 := (if p5$1 then $$4$11bv32$1 else v115$1);
    v115$2 := (if p5$2 then $$4$11bv32$2 else v115$2);
    call {:sourceloc_num 185} v116$1, v116$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p5$1, v107$1, v111$1 ++ v110$1 ++ v109$1 ++ v108$1, v115$1 ++ v114$1 ++ v113$1 ++ v112$1, SI32_TO_FP32(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$1), BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 1bv32)), UI32_TO_FP32(BV32_SUB(BV32_ADD(BV16_SEXT32(v1$1), group_size_y), 1bv32)), p5$2, v107$2, v111$2 ++ v110$2 ++ v109$2 ++ v108$2, v115$2 ++ v114$2 ++ v113$2 ++ v112$2, SI32_TO_FP32(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$2), BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 1bv32)), UI32_TO_FP32(BV32_SUB(BV32_ADD(BV16_SEXT32(v1$2), group_size_y), 1bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    call {:sourceloc} {:sourceloc_num 186} _LOG_WRITE_$$LocalBlock(p5$1, BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), v116$1, $$LocalBlock[1bv1][BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1)))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LocalBlock(p5$2, BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))));
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 186} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 186} _CHECK_WRITE_$$LocalBlock(p5$2, BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), v116$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LocalBlock"} true;
    $$LocalBlock[1bv1][BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1)))] := (if p5$1 then v116$1 else $$LocalBlock[1bv1][BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1)))]);
    $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2)))] := (if p5$2 then v116$2 else $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2)))]);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v117$1 := (if p5$1 then _HAVOC_bv8$1 else v117$1);
    v117$2 := (if p5$2 then _HAVOC_bv8$2 else v117$2);
    $$5$0bv32$1 := (if p5$1 then v117$1 else $$5$0bv32$1);
    $$5$0bv32$2 := (if p5$2 then v117$2 else $$5$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v118$1 := (if p5$1 then _HAVOC_bv8$1 else v118$1);
    v118$2 := (if p5$2 then _HAVOC_bv8$2 else v118$2);
    $$5$1bv32$1 := (if p5$1 then v118$1 else $$5$1bv32$1);
    $$5$1bv32$2 := (if p5$2 then v118$2 else $$5$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v119$1 := (if p5$1 then _HAVOC_bv8$1 else v119$1);
    v119$2 := (if p5$2 then _HAVOC_bv8$2 else v119$2);
    $$5$2bv32$1 := (if p5$1 then v119$1 else $$5$2bv32$1);
    $$5$2bv32$2 := (if p5$2 then v119$2 else $$5$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v120$1 := (if p5$1 then _HAVOC_bv8$1 else v120$1);
    v120$2 := (if p5$2 then _HAVOC_bv8$2 else v120$2);
    $$5$3bv32$1 := (if p5$1 then v120$1 else $$5$3bv32$1);
    $$5$3bv32$2 := (if p5$2 then v120$2 else $$5$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v121$1 := (if p5$1 then _HAVOC_bv8$1 else v121$1);
    v121$2 := (if p5$2 then _HAVOC_bv8$2 else v121$2);
    $$5$4bv32$1 := (if p5$1 then v121$1 else $$5$4bv32$1);
    $$5$4bv32$2 := (if p5$2 then v121$2 else $$5$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v122$1 := (if p5$1 then _HAVOC_bv8$1 else v122$1);
    v122$2 := (if p5$2 then _HAVOC_bv8$2 else v122$2);
    $$5$5bv32$1 := (if p5$1 then v122$1 else $$5$5bv32$1);
    $$5$5bv32$2 := (if p5$2 then v122$2 else $$5$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v123$1 := (if p5$1 then _HAVOC_bv8$1 else v123$1);
    v123$2 := (if p5$2 then _HAVOC_bv8$2 else v123$2);
    $$5$6bv32$1 := (if p5$1 then v123$1 else $$5$6bv32$1);
    $$5$6bv32$2 := (if p5$2 then v123$2 else $$5$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v124$1 := (if p5$1 then _HAVOC_bv8$1 else v124$1);
    v124$2 := (if p5$2 then _HAVOC_bv8$2 else v124$2);
    $$5$7bv32$1 := (if p5$1 then v124$1 else $$5$7bv32$1);
    $$5$7bv32$2 := (if p5$2 then v124$2 else $$5$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v125$1 := (if p5$1 then _HAVOC_bv8$1 else v125$1);
    v125$2 := (if p5$2 then _HAVOC_bv8$2 else v125$2);
    $$5$8bv32$1 := (if p5$1 then v125$1 else $$5$8bv32$1);
    $$5$8bv32$2 := (if p5$2 then v125$2 else $$5$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v126$1 := (if p5$1 then _HAVOC_bv8$1 else v126$1);
    v126$2 := (if p5$2 then _HAVOC_bv8$2 else v126$2);
    $$5$9bv32$1 := (if p5$1 then v126$1 else $$5$9bv32$1);
    $$5$9bv32$2 := (if p5$2 then v126$2 else $$5$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v127$1 := (if p5$1 then _HAVOC_bv8$1 else v127$1);
    v127$2 := (if p5$2 then _HAVOC_bv8$2 else v127$2);
    $$5$10bv32$1 := (if p5$1 then v127$1 else $$5$10bv32$1);
    $$5$10bv32$2 := (if p5$2 then v127$2 else $$5$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v128$1 := (if p5$1 then _HAVOC_bv8$1 else v128$1);
    v128$2 := (if p5$2 then _HAVOC_bv8$2 else v128$2);
    $$5$11bv32$1 := (if p5$1 then v128$1 else $$5$11bv32$1);
    $$5$11bv32$2 := (if p5$2 then v128$2 else $$5$11bv32$2);
    v129$1 := (if p5$1 then $$5$0bv32$1 else v129$1);
    v129$2 := (if p5$2 then $$5$0bv32$2 else v129$2);
    v130$1 := (if p5$1 then $$5$4bv32$1 else v130$1);
    v130$2 := (if p5$2 then $$5$4bv32$2 else v130$2);
    v131$1 := (if p5$1 then $$5$5bv32$1 else v131$1);
    v131$2 := (if p5$2 then $$5$5bv32$2 else v131$2);
    v132$1 := (if p5$1 then $$5$6bv32$1 else v132$1);
    v132$2 := (if p5$2 then $$5$6bv32$2 else v132$2);
    v133$1 := (if p5$1 then $$5$7bv32$1 else v133$1);
    v133$2 := (if p5$2 then $$5$7bv32$2 else v133$2);
    v134$1 := (if p5$1 then $$5$8bv32$1 else v134$1);
    v134$2 := (if p5$2 then $$5$8bv32$2 else v134$2);
    v135$1 := (if p5$1 then $$5$9bv32$1 else v135$1);
    v135$2 := (if p5$2 then $$5$9bv32$2 else v135$2);
    v136$1 := (if p5$1 then $$5$10bv32$1 else v136$1);
    v136$2 := (if p5$2 then $$5$10bv32$2 else v136$2);
    v137$1 := (if p5$1 then $$5$11bv32$1 else v137$1);
    v137$2 := (if p5$2 then $$5$11bv32$2 else v137$2);
    call {:sourceloc_num 220} v138$1, v138$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p5$1, v129$1, v133$1 ++ v132$1 ++ v131$1 ++ v130$1, v137$1 ++ v136$1 ++ v135$1 ++ v134$1, SI32_TO_FP32(BV32_ADD(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$1), BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 1bv32), 1bv32)), UI32_TO_FP32(BV32_SUB(BV32_ADD(BV16_SEXT32(v1$1), group_size_y), 1bv32)), p5$2, v129$2, v133$2 ++ v132$2 ++ v131$2 ++ v130$2, v137$2 ++ v136$2 ++ v135$2 ++ v134$2, SI32_TO_FP32(BV32_ADD(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$2), BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 1bv32), 1bv32)), UI32_TO_FP32(BV32_SUB(BV32_ADD(BV16_SEXT32(v1$2), group_size_y), 1bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    call {:sourceloc} {:sourceloc_num 221} _LOG_WRITE_$$LocalBlock(p5$1, BV32_ADD(BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 1bv32), v138$1, $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LocalBlock(p5$2, BV32_ADD(BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 221} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 221} _CHECK_WRITE_$$LocalBlock(p5$2, BV32_ADD(BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 1bv32), v138$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LocalBlock"} true;
    $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 1bv32)] := (if p5$1 then v138$1 else $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 1bv32)]);
    $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 1bv32)] := (if p5$2 then v138$2 else $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 1bv32)]);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v139$1 := (if p5$1 then _HAVOC_bv8$1 else v139$1);
    v139$2 := (if p5$2 then _HAVOC_bv8$2 else v139$2);
    $$6$0bv32$1 := (if p5$1 then v139$1 else $$6$0bv32$1);
    $$6$0bv32$2 := (if p5$2 then v139$2 else $$6$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v140$1 := (if p5$1 then _HAVOC_bv8$1 else v140$1);
    v140$2 := (if p5$2 then _HAVOC_bv8$2 else v140$2);
    $$6$1bv32$1 := (if p5$1 then v140$1 else $$6$1bv32$1);
    $$6$1bv32$2 := (if p5$2 then v140$2 else $$6$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v141$1 := (if p5$1 then _HAVOC_bv8$1 else v141$1);
    v141$2 := (if p5$2 then _HAVOC_bv8$2 else v141$2);
    $$6$2bv32$1 := (if p5$1 then v141$1 else $$6$2bv32$1);
    $$6$2bv32$2 := (if p5$2 then v141$2 else $$6$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v142$1 := (if p5$1 then _HAVOC_bv8$1 else v142$1);
    v142$2 := (if p5$2 then _HAVOC_bv8$2 else v142$2);
    $$6$3bv32$1 := (if p5$1 then v142$1 else $$6$3bv32$1);
    $$6$3bv32$2 := (if p5$2 then v142$2 else $$6$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v143$1 := (if p5$1 then _HAVOC_bv8$1 else v143$1);
    v143$2 := (if p5$2 then _HAVOC_bv8$2 else v143$2);
    $$6$4bv32$1 := (if p5$1 then v143$1 else $$6$4bv32$1);
    $$6$4bv32$2 := (if p5$2 then v143$2 else $$6$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v144$1 := (if p5$1 then _HAVOC_bv8$1 else v144$1);
    v144$2 := (if p5$2 then _HAVOC_bv8$2 else v144$2);
    $$6$5bv32$1 := (if p5$1 then v144$1 else $$6$5bv32$1);
    $$6$5bv32$2 := (if p5$2 then v144$2 else $$6$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v145$1 := (if p5$1 then _HAVOC_bv8$1 else v145$1);
    v145$2 := (if p5$2 then _HAVOC_bv8$2 else v145$2);
    $$6$6bv32$1 := (if p5$1 then v145$1 else $$6$6bv32$1);
    $$6$6bv32$2 := (if p5$2 then v145$2 else $$6$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v146$1 := (if p5$1 then _HAVOC_bv8$1 else v146$1);
    v146$2 := (if p5$2 then _HAVOC_bv8$2 else v146$2);
    $$6$7bv32$1 := (if p5$1 then v146$1 else $$6$7bv32$1);
    $$6$7bv32$2 := (if p5$2 then v146$2 else $$6$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v147$1 := (if p5$1 then _HAVOC_bv8$1 else v147$1);
    v147$2 := (if p5$2 then _HAVOC_bv8$2 else v147$2);
    $$6$8bv32$1 := (if p5$1 then v147$1 else $$6$8bv32$1);
    $$6$8bv32$2 := (if p5$2 then v147$2 else $$6$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v148$1 := (if p5$1 then _HAVOC_bv8$1 else v148$1);
    v148$2 := (if p5$2 then _HAVOC_bv8$2 else v148$2);
    $$6$9bv32$1 := (if p5$1 then v148$1 else $$6$9bv32$1);
    $$6$9bv32$2 := (if p5$2 then v148$2 else $$6$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v149$1 := (if p5$1 then _HAVOC_bv8$1 else v149$1);
    v149$2 := (if p5$2 then _HAVOC_bv8$2 else v149$2);
    $$6$10bv32$1 := (if p5$1 then v149$1 else $$6$10bv32$1);
    $$6$10bv32$2 := (if p5$2 then v149$2 else $$6$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v150$1 := (if p5$1 then _HAVOC_bv8$1 else v150$1);
    v150$2 := (if p5$2 then _HAVOC_bv8$2 else v150$2);
    $$6$11bv32$1 := (if p5$1 then v150$1 else $$6$11bv32$1);
    $$6$11bv32$2 := (if p5$2 then v150$2 else $$6$11bv32$2);
    v151$1 := (if p5$1 then $$6$0bv32$1 else v151$1);
    v151$2 := (if p5$2 then $$6$0bv32$2 else v151$2);
    v152$1 := (if p5$1 then $$6$4bv32$1 else v152$1);
    v152$2 := (if p5$2 then $$6$4bv32$2 else v152$2);
    v153$1 := (if p5$1 then $$6$5bv32$1 else v153$1);
    v153$2 := (if p5$2 then $$6$5bv32$2 else v153$2);
    v154$1 := (if p5$1 then $$6$6bv32$1 else v154$1);
    v154$2 := (if p5$2 then $$6$6bv32$2 else v154$2);
    v155$1 := (if p5$1 then $$6$7bv32$1 else v155$1);
    v155$2 := (if p5$2 then $$6$7bv32$2 else v155$2);
    v156$1 := (if p5$1 then $$6$8bv32$1 else v156$1);
    v156$2 := (if p5$2 then $$6$8bv32$2 else v156$2);
    v157$1 := (if p5$1 then $$6$9bv32$1 else v157$1);
    v157$2 := (if p5$2 then $$6$9bv32$2 else v157$2);
    v158$1 := (if p5$1 then $$6$10bv32$1 else v158$1);
    v158$2 := (if p5$2 then $$6$10bv32$2 else v158$2);
    v159$1 := (if p5$1 then $$6$11bv32$1 else v159$1);
    v159$2 := (if p5$2 then $$6$11bv32$2 else v159$2);
    call {:sourceloc_num 255} v160$1, v160$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p5$1, v151$1, v155$1 ++ v154$1 ++ v153$1 ++ v152$1, v159$1 ++ v158$1 ++ v157$1 ++ v156$1, SI32_TO_FP32(BV32_ADD(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$1), BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 1bv32), 2bv32)), UI32_TO_FP32(BV32_SUB(BV32_ADD(BV16_SEXT32(v1$1), group_size_y), 1bv32)), p5$2, v151$2, v155$2 ++ v154$2 ++ v153$2 ++ v152$2, v159$2 ++ v158$2 ++ v157$2 ++ v156$2, SI32_TO_FP32(BV32_ADD(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$2), BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 1bv32), 2bv32)), UI32_TO_FP32(BV32_SUB(BV32_ADD(BV16_SEXT32(v1$2), group_size_y), 1bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    call {:sourceloc} {:sourceloc_num 256} _LOG_WRITE_$$LocalBlock(p5$1, BV32_ADD(BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 2bv32), v160$1, $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LocalBlock(p5$2, BV32_ADD(BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 256} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 256} _CHECK_WRITE_$$LocalBlock(p5$2, BV32_ADD(BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 2bv32), v160$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LocalBlock"} true;
    $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 2bv32)] := (if p5$1 then v160$1 else $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 2bv32)]);
    $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 2bv32)] := (if p5$2 then v160$2 else $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 2bv32)]);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v161$1 := (if p5$1 then _HAVOC_bv8$1 else v161$1);
    v161$2 := (if p5$2 then _HAVOC_bv8$2 else v161$2);
    $$7$0bv32$1 := (if p5$1 then v161$1 else $$7$0bv32$1);
    $$7$0bv32$2 := (if p5$2 then v161$2 else $$7$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v162$1 := (if p5$1 then _HAVOC_bv8$1 else v162$1);
    v162$2 := (if p5$2 then _HAVOC_bv8$2 else v162$2);
    $$7$1bv32$1 := (if p5$1 then v162$1 else $$7$1bv32$1);
    $$7$1bv32$2 := (if p5$2 then v162$2 else $$7$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v163$1 := (if p5$1 then _HAVOC_bv8$1 else v163$1);
    v163$2 := (if p5$2 then _HAVOC_bv8$2 else v163$2);
    $$7$2bv32$1 := (if p5$1 then v163$1 else $$7$2bv32$1);
    $$7$2bv32$2 := (if p5$2 then v163$2 else $$7$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v164$1 := (if p5$1 then _HAVOC_bv8$1 else v164$1);
    v164$2 := (if p5$2 then _HAVOC_bv8$2 else v164$2);
    $$7$3bv32$1 := (if p5$1 then v164$1 else $$7$3bv32$1);
    $$7$3bv32$2 := (if p5$2 then v164$2 else $$7$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v165$1 := (if p5$1 then _HAVOC_bv8$1 else v165$1);
    v165$2 := (if p5$2 then _HAVOC_bv8$2 else v165$2);
    $$7$4bv32$1 := (if p5$1 then v165$1 else $$7$4bv32$1);
    $$7$4bv32$2 := (if p5$2 then v165$2 else $$7$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v166$1 := (if p5$1 then _HAVOC_bv8$1 else v166$1);
    v166$2 := (if p5$2 then _HAVOC_bv8$2 else v166$2);
    $$7$5bv32$1 := (if p5$1 then v166$1 else $$7$5bv32$1);
    $$7$5bv32$2 := (if p5$2 then v166$2 else $$7$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v167$1 := (if p5$1 then _HAVOC_bv8$1 else v167$1);
    v167$2 := (if p5$2 then _HAVOC_bv8$2 else v167$2);
    $$7$6bv32$1 := (if p5$1 then v167$1 else $$7$6bv32$1);
    $$7$6bv32$2 := (if p5$2 then v167$2 else $$7$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v168$1 := (if p5$1 then _HAVOC_bv8$1 else v168$1);
    v168$2 := (if p5$2 then _HAVOC_bv8$2 else v168$2);
    $$7$7bv32$1 := (if p5$1 then v168$1 else $$7$7bv32$1);
    $$7$7bv32$2 := (if p5$2 then v168$2 else $$7$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v169$1 := (if p5$1 then _HAVOC_bv8$1 else v169$1);
    v169$2 := (if p5$2 then _HAVOC_bv8$2 else v169$2);
    $$7$8bv32$1 := (if p5$1 then v169$1 else $$7$8bv32$1);
    $$7$8bv32$2 := (if p5$2 then v169$2 else $$7$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v170$1 := (if p5$1 then _HAVOC_bv8$1 else v170$1);
    v170$2 := (if p5$2 then _HAVOC_bv8$2 else v170$2);
    $$7$9bv32$1 := (if p5$1 then v170$1 else $$7$9bv32$1);
    $$7$9bv32$2 := (if p5$2 then v170$2 else $$7$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v171$1 := (if p5$1 then _HAVOC_bv8$1 else v171$1);
    v171$2 := (if p5$2 then _HAVOC_bv8$2 else v171$2);
    $$7$10bv32$1 := (if p5$1 then v171$1 else $$7$10bv32$1);
    $$7$10bv32$2 := (if p5$2 then v171$2 else $$7$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v172$1 := (if p5$1 then _HAVOC_bv8$1 else v172$1);
    v172$2 := (if p5$2 then _HAVOC_bv8$2 else v172$2);
    $$7$11bv32$1 := (if p5$1 then v172$1 else $$7$11bv32$1);
    $$7$11bv32$2 := (if p5$2 then v172$2 else $$7$11bv32$2);
    v173$1 := (if p5$1 then $$7$0bv32$1 else v173$1);
    v173$2 := (if p5$2 then $$7$0bv32$2 else v173$2);
    v174$1 := (if p5$1 then $$7$4bv32$1 else v174$1);
    v174$2 := (if p5$2 then $$7$4bv32$2 else v174$2);
    v175$1 := (if p5$1 then $$7$5bv32$1 else v175$1);
    v175$2 := (if p5$2 then $$7$5bv32$2 else v175$2);
    v176$1 := (if p5$1 then $$7$6bv32$1 else v176$1);
    v176$2 := (if p5$2 then $$7$6bv32$2 else v176$2);
    v177$1 := (if p5$1 then $$7$7bv32$1 else v177$1);
    v177$2 := (if p5$2 then $$7$7bv32$2 else v177$2);
    v178$1 := (if p5$1 then $$7$8bv32$1 else v178$1);
    v178$2 := (if p5$2 then $$7$8bv32$2 else v178$2);
    v179$1 := (if p5$1 then $$7$9bv32$1 else v179$1);
    v179$2 := (if p5$2 then $$7$9bv32$2 else v179$2);
    v180$1 := (if p5$1 then $$7$10bv32$1 else v180$1);
    v180$2 := (if p5$2 then $$7$10bv32$2 else v180$2);
    v181$1 := (if p5$1 then $$7$11bv32$1 else v181$1);
    v181$2 := (if p5$2 then $$7$11bv32$2 else v181$2);
    call {:sourceloc_num 290} v182$1, v182$2 := $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(p5$1, v173$1, v177$1 ++ v176$1 ++ v175$1 ++ v174$1, v181$1 ++ v180$1 ++ v179$1 ++ v178$1, SI32_TO_FP32(BV32_ADD(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$1), BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 1bv32), 3bv32)), UI32_TO_FP32(BV32_SUB(BV32_ADD(BV16_SEXT32(v1$1), group_size_y), 1bv32)), p5$2, v173$2, v177$2 ++ v176$2 ++ v175$2 ++ v174$2, v181$2 ++ v180$2 ++ v179$2 ++ v178$2, SI32_TO_FP32(BV32_ADD(BV32_SUB(BV32_ADD(BV16_SEXT32(v0$2), BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 1bv32), 3bv32)), UI32_TO_FP32(BV32_SUB(BV32_ADD(BV16_SEXT32(v1$2), group_size_y), 1bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} true;
    call {:sourceloc} {:sourceloc_num 291} _LOG_WRITE_$$LocalBlock(p5$1, BV32_ADD(BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 3bv32), v182$1, $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LocalBlock(p5$2, BV32_ADD(BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 291} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 291} _CHECK_WRITE_$$LocalBlock(p5$2, BV32_ADD(BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 3bv32), v182$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LocalBlock"} true;
    $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 3bv32)] := (if p5$1 then v182$1 else $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v93$1, BV32_MUL(4bv32, BV16_SEXT32($ib.1$1))), 3bv32)]);
    $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 3bv32)] := (if p5$2 then v182$2 else $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v93$2, BV32_MUL(4bv32, BV16_SEXT32($ib.1$2))), 3bv32)]);
    $ib.1$1 := (if p5$1 then BV32_ADD(BV16_SEXT32($ib.1$1), group_size_x)[16:0] else $ib.1$1);
    $ib.1$2 := (if p5$2 then BV32_ADD(BV16_SEXT32($ib.1$2), group_size_x)[16:0] else $ib.1$2);
    p4$1 := (if p5$1 then true else p4$1);
    p4$2 := (if p5$2 then true else p4$2);
    goto $6.backedge, __partitioned_block_$6.tail_0;

  __partitioned_block_$6.tail_0:
    assume !p4$1 && !p4$2;
    goto __partitioned_block_$6.tail_1;

  __partitioned_block_$6.tail_1:
    call {:sourceloc_num 295} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    v183$1 := BV32_ASHR(BV16_SEXT32(v0$1), 2bv32)[16:0];
    v183$2 := BV32_ASHR(BV16_SEXT32(v0$2), 2bv32)[16:0];
    v184$1 := BV32_MUL(local_id_y$1, BV16_SEXT32($SharedPitch));
    v184$2 := BV32_MUL(local_id_y$2, BV16_SEXT32($SharedPitch));
    $ib.2$1 := local_id_x$1[16:0];
    $ib.2$2 := local_id_x$2[16:0];
    p7$1 := true;
    p7$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $11;

  $11:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$LocalBlock ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$LocalBlock ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$LocalBlock ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 296} p7$1 ==> true;
    v185$1 := (if p7$1 then BV32_SLT(BV16_SEXT32($ib.2$1), BV16_SEXT32($BlockWidth)) else v185$1);
    v185$2 := (if p7$2 then BV32_SLT(BV16_SEXT32($ib.2$2), BV16_SEXT32($BlockWidth)) else v185$2);
    p8$1 := false;
    p8$2 := false;
    p9$1 := false;
    p9$2 := false;
    p10$1 := false;
    p10$2 := false;
    p11$1 := false;
    p11$2 := false;
    p12$1 := false;
    p12$2 := false;
    p13$1 := false;
    p13$2 := false;
    p14$1 := false;
    p14$2 := false;
    p15$1 := false;
    p15$2 := false;
    p16$1 := false;
    p16$2 := false;
    p17$1 := false;
    p17$2 := false;
    p18$1 := false;
    p18$2 := false;
    p19$1 := false;
    p19$2 := false;
    p20$1 := false;
    p20$2 := false;
    p21$1 := false;
    p21$2 := false;
    p22$1 := false;
    p22$2 := false;
    p23$1 := false;
    p23$2 := false;
    p24$1 := false;
    p24$2 := false;
    p25$1 := false;
    p25$2 := false;
    p26$1 := false;
    p26$2 := false;
    p27$1 := false;
    p27$2 := false;
    p28$1 := false;
    p28$2 := false;
    p8$1 := (if p7$1 && v185$1 then v185$1 else p8$1);
    p8$2 := (if p7$2 && v185$2 then v185$2 else p8$2);
    p7$1 := (if p7$1 && !v185$1 then v185$1 else p7$1);
    p7$2 := (if p7$2 && !v185$2 then v185$2 else p7$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 298} true;
    v186$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV32_MUL(0bv32, BV16_SEXT32($SharedPitch)))] else v186$1);
    v186$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV32_MUL(0bv32, BV16_SEXT32($SharedPitch)))] else v186$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 299} true;
    v187$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV32_MUL(0bv32, BV16_SEXT32($SharedPitch))), 1bv32)] else v187$1);
    v187$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV32_MUL(0bv32, BV16_SEXT32($SharedPitch))), 1bv32)] else v187$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 300} true;
    v188$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV32_MUL(0bv32, BV16_SEXT32($SharedPitch))), 2bv32)] else v188$1);
    v188$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV32_MUL(0bv32, BV16_SEXT32($SharedPitch))), 2bv32)] else v188$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 301} true;
    v189$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV16_SEXT32($SharedPitch))] else v189$1);
    v189$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV16_SEXT32($SharedPitch))] else v189$2);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 302} true;
    v190$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV16_SEXT32($SharedPitch)), 1bv32)] else v190$1);
    v190$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV16_SEXT32($SharedPitch)), 1bv32)] else v190$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 303} true;
    v191$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV16_SEXT32($SharedPitch)), 2bv32)] else v191$1);
    v191$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV16_SEXT32($SharedPitch)), 2bv32)] else v191$2);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 304} true;
    v192$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV32_MUL(2bv32, BV16_SEXT32($SharedPitch)))] else v192$1);
    v192$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV32_MUL(2bv32, BV16_SEXT32($SharedPitch)))] else v192$2);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 305} true;
    v193$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV32_MUL(2bv32, BV16_SEXT32($SharedPitch))), 1bv32)] else v193$1);
    v193$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV32_MUL(2bv32, BV16_SEXT32($SharedPitch))), 1bv32)] else v193$2);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 306} true;
    v194$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV32_MUL(2bv32, BV16_SEXT32($SharedPitch))), 2bv32)] else v194$1);
    v194$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV32_MUL(2bv32, BV16_SEXT32($SharedPitch))), 2bv32)] else v194$2);
    call {:sourceloc_num 307} v195$1, v195$2 := $abs(p8$1, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v188$1), BV32_MUL(2bv32, BV8_ZEXT32(v191$1))), BV8_ZEXT32(v194$1)), BV8_ZEXT32(v186$1)), BV32_MUL(2bv32, BV8_ZEXT32(v189$1))), BV8_ZEXT32(v192$1))[16:0])), p8$2, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v188$2), BV32_MUL(2bv32, BV8_ZEXT32(v191$2))), BV8_ZEXT32(v194$2)), BV8_ZEXT32(v186$2)), BV32_MUL(2bv32, BV8_ZEXT32(v189$2))), BV8_ZEXT32(v192$2))[16:0])));
    assume {:captureState "call_return_state_0"} {:procedureName "$abs"} true;
    call {:sourceloc_num 308} v196$1, v196$2 := $abs(p8$1, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v186$1), BV32_MUL(2bv32, BV8_ZEXT32(v187$1))), BV8_ZEXT32(v188$1)), BV8_ZEXT32(v192$1)), BV32_MUL(2bv32, BV8_ZEXT32(v193$1))), BV8_ZEXT32(v194$1))[16:0])), p8$2, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v186$2), BV32_MUL(2bv32, BV8_ZEXT32(v187$2))), BV8_ZEXT32(v188$2)), BV8_ZEXT32(v192$2)), BV32_MUL(2bv32, BV8_ZEXT32(v193$2))), BV8_ZEXT32(v194$2))[16:0])));
    assume {:captureState "call_return_state_0"} {:procedureName "$abs"} true;
    v197$1 := (if p8$1 then FP32_TO_SI16(FMUL32($fScale, FADD32(v195$1, v196$1))) else v197$1);
    v197$2 := (if p8$2 then FP32_TO_SI16(FMUL32($fScale, FADD32(v195$2, v196$2))) else v197$2);
    v198$1 := (if p8$1 then BV32_SLT(BV16_SEXT32(v197$1), 0bv32) else v198$1);
    v198$2 := (if p8$2 then BV32_SLT(BV16_SEXT32(v197$2), 0bv32) else v198$2);
    p9$1 := (if p8$1 && v198$1 then v198$1 else p9$1);
    p9$2 := (if p8$2 && v198$2 then v198$2 else p9$2);
    p10$1 := (if p8$1 && !v198$1 then !v198$1 else p10$1);
    p10$2 := (if p8$2 && !v198$2 then !v198$2 else p10$2);
    $.01$1 := (if p9$1 then 0bv8 else $.01$1);
    $.01$2 := (if p9$2 then 0bv8 else $.01$2);
    v199$1 := (if p10$1 then BV32_SGT(BV16_SEXT32(v197$1), 255bv32) else v199$1);
    v199$2 := (if p10$2 then BV32_SGT(BV16_SEXT32(v197$2), 255bv32) else v199$2);
    p12$1 := (if p10$1 && v199$1 then v199$1 else p12$1);
    p12$2 := (if p10$2 && v199$2 then v199$2 else p12$2);
    p11$1 := (if p10$1 && !v199$1 then !v199$1 else p11$1);
    p11$2 := (if p10$2 && !v199$2 then !v199$2 else p11$2);
    $.01$1 := (if p11$1 then v197$1[8:0] else $.01$1);
    $.01$2 := (if p11$2 then v197$2[8:0] else $.01$2);
    $.01$1 := (if p12$1 then 255bv8 else $.01$1);
    $.01$2 := (if p12$2 then 255bv8 else $.01$2);
    $$out$0bv32$1 := (if p8$1 then $.01$1 else $$out$0bv32$1);
    $$out$0bv32$2 := (if p8$2 then $.01$2 else $$out$0bv32$2);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 315} true;
    v200$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV32_MUL(0bv32, BV16_SEXT32($SharedPitch))), 3bv32)] else v200$1);
    v200$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV32_MUL(0bv32, BV16_SEXT32($SharedPitch))), 3bv32)] else v200$2);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 316} true;
    v201$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV16_SEXT32($SharedPitch)), 3bv32)] else v201$1);
    v201$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV16_SEXT32($SharedPitch)), 3bv32)] else v201$2);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 317} true;
    v202$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV32_MUL(2bv32, BV16_SEXT32($SharedPitch))), 3bv32)] else v202$1);
    v202$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV32_MUL(2bv32, BV16_SEXT32($SharedPitch))), 3bv32)] else v202$2);
    call {:sourceloc_num 318} v203$1, v203$2 := $abs(p8$1, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v200$1), BV32_MUL(2bv32, BV8_ZEXT32(v201$1))), BV8_ZEXT32(v202$1)), BV8_ZEXT32(v187$1)), BV32_MUL(2bv32, BV8_ZEXT32(v190$1))), BV8_ZEXT32(v193$1))[16:0])), p8$2, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v200$2), BV32_MUL(2bv32, BV8_ZEXT32(v201$2))), BV8_ZEXT32(v202$2)), BV8_ZEXT32(v187$2)), BV32_MUL(2bv32, BV8_ZEXT32(v190$2))), BV8_ZEXT32(v193$2))[16:0])));
    assume {:captureState "call_return_state_0"} {:procedureName "$abs"} true;
    call {:sourceloc_num 319} v204$1, v204$2 := $abs(p8$1, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v187$1), BV32_MUL(2bv32, BV8_ZEXT32(v188$1))), BV8_ZEXT32(v200$1)), BV8_ZEXT32(v193$1)), BV32_MUL(2bv32, BV8_ZEXT32(v194$1))), BV8_ZEXT32(v202$1))[16:0])), p8$2, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v187$2), BV32_MUL(2bv32, BV8_ZEXT32(v188$2))), BV8_ZEXT32(v200$2)), BV8_ZEXT32(v193$2)), BV32_MUL(2bv32, BV8_ZEXT32(v194$2))), BV8_ZEXT32(v202$2))[16:0])));
    assume {:captureState "call_return_state_0"} {:procedureName "$abs"} true;
    v205$1 := (if p8$1 then FP32_TO_SI16(FMUL32($fScale, FADD32(v203$1, v204$1))) else v205$1);
    v205$2 := (if p8$2 then FP32_TO_SI16(FMUL32($fScale, FADD32(v203$2, v204$2))) else v205$2);
    v206$1 := (if p8$1 then BV32_SLT(BV16_SEXT32(v205$1), 0bv32) else v206$1);
    v206$2 := (if p8$2 then BV32_SLT(BV16_SEXT32(v205$2), 0bv32) else v206$2);
    p13$1 := (if p8$1 && v206$1 then v206$1 else p13$1);
    p13$2 := (if p8$2 && v206$2 then v206$2 else p13$2);
    p14$1 := (if p8$1 && !v206$1 then !v206$1 else p14$1);
    p14$2 := (if p8$2 && !v206$2 then !v206$2 else p14$2);
    $.03$1 := (if p13$1 then 0bv8 else $.03$1);
    $.03$2 := (if p13$2 then 0bv8 else $.03$2);
    v207$1 := (if p14$1 then BV32_SGT(BV16_SEXT32(v205$1), 255bv32) else v207$1);
    v207$2 := (if p14$2 then BV32_SGT(BV16_SEXT32(v205$2), 255bv32) else v207$2);
    p16$1 := (if p14$1 && v207$1 then v207$1 else p16$1);
    p16$2 := (if p14$2 && v207$2 then v207$2 else p16$2);
    p15$1 := (if p14$1 && !v207$1 then !v207$1 else p15$1);
    p15$2 := (if p14$2 && !v207$2 then !v207$2 else p15$2);
    $.03$1 := (if p15$1 then v205$1[8:0] else $.03$1);
    $.03$2 := (if p15$2 then v205$2[8:0] else $.03$2);
    $.03$1 := (if p16$1 then 255bv8 else $.03$1);
    $.03$2 := (if p16$2 then 255bv8 else $.03$2);
    $$out$1bv32$1 := (if p8$1 then $.03$1 else $$out$1bv32$1);
    $$out$1bv32$2 := (if p8$2 then $.03$2 else $$out$1bv32$2);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 326} true;
    v208$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV32_MUL(0bv32, BV16_SEXT32($SharedPitch))), 4bv32)] else v208$1);
    v208$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV32_MUL(0bv32, BV16_SEXT32($SharedPitch))), 4bv32)] else v208$2);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 327} true;
    v209$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV16_SEXT32($SharedPitch)), 4bv32)] else v209$1);
    v209$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV16_SEXT32($SharedPitch)), 4bv32)] else v209$2);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 328} true;
    v210$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV32_MUL(2bv32, BV16_SEXT32($SharedPitch))), 4bv32)] else v210$1);
    v210$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV32_MUL(2bv32, BV16_SEXT32($SharedPitch))), 4bv32)] else v210$2);
    call {:sourceloc_num 329} v211$1, v211$2 := $abs(p8$1, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v208$1), BV32_MUL(2bv32, BV8_ZEXT32(v209$1))), BV8_ZEXT32(v210$1)), BV8_ZEXT32(v188$1)), BV32_MUL(2bv32, BV8_ZEXT32(v191$1))), BV8_ZEXT32(v194$1))[16:0])), p8$2, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v208$2), BV32_MUL(2bv32, BV8_ZEXT32(v209$2))), BV8_ZEXT32(v210$2)), BV8_ZEXT32(v188$2)), BV32_MUL(2bv32, BV8_ZEXT32(v191$2))), BV8_ZEXT32(v194$2))[16:0])));
    assume {:captureState "call_return_state_0"} {:procedureName "$abs"} true;
    call {:sourceloc_num 330} v212$1, v212$2 := $abs(p8$1, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v188$1), BV32_MUL(2bv32, BV8_ZEXT32(v200$1))), BV8_ZEXT32(v208$1)), BV8_ZEXT32(v194$1)), BV32_MUL(2bv32, BV8_ZEXT32(v202$1))), BV8_ZEXT32(v210$1))[16:0])), p8$2, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v188$2), BV32_MUL(2bv32, BV8_ZEXT32(v200$2))), BV8_ZEXT32(v208$2)), BV8_ZEXT32(v194$2)), BV32_MUL(2bv32, BV8_ZEXT32(v202$2))), BV8_ZEXT32(v210$2))[16:0])));
    assume {:captureState "call_return_state_0"} {:procedureName "$abs"} true;
    v213$1 := (if p8$1 then FP32_TO_SI16(FMUL32($fScale, FADD32(v211$1, v212$1))) else v213$1);
    v213$2 := (if p8$2 then FP32_TO_SI16(FMUL32($fScale, FADD32(v211$2, v212$2))) else v213$2);
    v214$1 := (if p8$1 then BV32_SLT(BV16_SEXT32(v213$1), 0bv32) else v214$1);
    v214$2 := (if p8$2 then BV32_SLT(BV16_SEXT32(v213$2), 0bv32) else v214$2);
    p17$1 := (if p8$1 && v214$1 then v214$1 else p17$1);
    p17$2 := (if p8$2 && v214$2 then v214$2 else p17$2);
    p18$1 := (if p8$1 && !v214$1 then !v214$1 else p18$1);
    p18$2 := (if p8$2 && !v214$2 then !v214$2 else p18$2);
    $.02$1 := (if p17$1 then 0bv8 else $.02$1);
    $.02$2 := (if p17$2 then 0bv8 else $.02$2);
    v215$1 := (if p18$1 then BV32_SGT(BV16_SEXT32(v213$1), 255bv32) else v215$1);
    v215$2 := (if p18$2 then BV32_SGT(BV16_SEXT32(v213$2), 255bv32) else v215$2);
    p20$1 := (if p18$1 && v215$1 then v215$1 else p20$1);
    p20$2 := (if p18$2 && v215$2 then v215$2 else p20$2);
    p19$1 := (if p18$1 && !v215$1 then !v215$1 else p19$1);
    p19$2 := (if p18$2 && !v215$2 then !v215$2 else p19$2);
    $.02$1 := (if p19$1 then v213$1[8:0] else $.02$1);
    $.02$2 := (if p19$2 then v213$2[8:0] else $.02$2);
    $.02$1 := (if p20$1 then 255bv8 else $.02$1);
    $.02$2 := (if p20$2 then 255bv8 else $.02$2);
    $$out$2bv32$1 := (if p8$1 then $.02$1 else $$out$2bv32$1);
    $$out$2bv32$2 := (if p8$2 then $.02$2 else $$out$2bv32$2);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 337} true;
    v216$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV32_MUL(0bv32, BV16_SEXT32($SharedPitch))), 5bv32)] else v216$1);
    v216$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV32_MUL(0bv32, BV16_SEXT32($SharedPitch))), 5bv32)] else v216$2);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 338} true;
    v217$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV16_SEXT32($SharedPitch)), 5bv32)] else v217$1);
    v217$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV16_SEXT32($SharedPitch)), 5bv32)] else v217$2);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 339} true;
    v218$1 := (if p8$1 then $$LocalBlock[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v184$1, BV32_MUL(4bv32, BV16_SEXT32($ib.2$1))), BV32_MUL(2bv32, BV16_SEXT32($SharedPitch))), 5bv32)] else v218$1);
    v218$2 := (if p8$2 then $$LocalBlock[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v184$2, BV32_MUL(4bv32, BV16_SEXT32($ib.2$2))), BV32_MUL(2bv32, BV16_SEXT32($SharedPitch))), 5bv32)] else v218$2);
    call {:sourceloc_num 340} v219$1, v219$2 := $abs(p8$1, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v216$1), BV32_MUL(2bv32, BV8_ZEXT32(v217$1))), BV8_ZEXT32(v218$1)), BV8_ZEXT32(v200$1)), BV32_MUL(2bv32, BV8_ZEXT32(v201$1))), BV8_ZEXT32(v202$1))[16:0])), p8$2, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v216$2), BV32_MUL(2bv32, BV8_ZEXT32(v217$2))), BV8_ZEXT32(v218$2)), BV8_ZEXT32(v200$2)), BV32_MUL(2bv32, BV8_ZEXT32(v201$2))), BV8_ZEXT32(v202$2))[16:0])));
    assume {:captureState "call_return_state_0"} {:procedureName "$abs"} true;
    call {:sourceloc_num 341} v220$1, v220$2 := $abs(p8$1, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v200$1), BV32_MUL(2bv32, BV8_ZEXT32(v208$1))), BV8_ZEXT32(v216$1)), BV8_ZEXT32(v202$1)), BV32_MUL(2bv32, BV8_ZEXT32(v210$1))), BV8_ZEXT32(v218$1))[16:0])), p8$2, SI32_TO_FP32(BV16_SEXT32(BV32_SUB(BV32_SUB(BV32_SUB(BV32_ADD(BV32_ADD(BV8_ZEXT32(v200$2), BV32_MUL(2bv32, BV8_ZEXT32(v208$2))), BV8_ZEXT32(v216$2)), BV8_ZEXT32(v202$2)), BV32_MUL(2bv32, BV8_ZEXT32(v210$2))), BV8_ZEXT32(v218$2))[16:0])));
    assume {:captureState "call_return_state_0"} {:procedureName "$abs"} true;
    v221$1 := (if p8$1 then FP32_TO_SI16(FMUL32($fScale, FADD32(v219$1, v220$1))) else v221$1);
    v221$2 := (if p8$2 then FP32_TO_SI16(FMUL32($fScale, FADD32(v219$2, v220$2))) else v221$2);
    v222$1 := (if p8$1 then BV32_SLT(BV16_SEXT32(v221$1), 0bv32) else v222$1);
    v222$2 := (if p8$2 then BV32_SLT(BV16_SEXT32(v221$2), 0bv32) else v222$2);
    p21$1 := (if p8$1 && v222$1 then v222$1 else p21$1);
    p21$2 := (if p8$2 && v222$2 then v222$2 else p21$2);
    p22$1 := (if p8$1 && !v222$1 then !v222$1 else p22$1);
    p22$2 := (if p8$2 && !v222$2 then !v222$2 else p22$2);
    $.0$1 := (if p21$1 then 0bv8 else $.0$1);
    $.0$2 := (if p21$2 then 0bv8 else $.0$2);
    v223$1 := (if p22$1 then BV32_SGT(BV16_SEXT32(v221$1), 255bv32) else v223$1);
    v223$2 := (if p22$2 then BV32_SGT(BV16_SEXT32(v221$2), 255bv32) else v223$2);
    p24$1 := (if p22$1 && v223$1 then v223$1 else p24$1);
    p24$2 := (if p22$2 && v223$2 then v223$2 else p24$2);
    p23$1 := (if p22$1 && !v223$1 then !v223$1 else p23$1);
    p23$2 := (if p22$2 && !v223$2 then !v223$2 else p23$2);
    $.0$1 := (if p23$1 then v221$1[8:0] else $.0$1);
    $.0$2 := (if p23$2 then v221$2[8:0] else $.0$2);
    $.0$1 := (if p24$1 then 255bv8 else $.0$1);
    $.0$2 := (if p24$2 then 255bv8 else $.0$2);
    $$out$3bv32$1 := (if p8$1 then $.0$1 else $$out$3bv32$1);
    $$out$3bv32$2 := (if p8$2 then $.0$2 else $$out$3bv32$2);
    v224$1 := (if p8$1 then BV32_SLT(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), BV32_SDIV(BV16_SEXT32($w), 4bv32)) else v224$1);
    v224$2 := (if p8$2 then BV32_SLT(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), BV32_SDIV(BV16_SEXT32($w), 4bv32)) else v224$2);
    p26$1 := (if p8$1 && v224$1 then v224$1 else p26$1);
    p26$2 := (if p8$2 && v224$2 then v224$2 else p26$2);
    v225$1 := (if p26$1 then BV32_SLT(BV16_SEXT32(v1$1), BV16_SEXT32($h)) else v225$1);
    v225$2 := (if p26$2 then BV32_SLT(BV16_SEXT32(v1$2), BV16_SEXT32($h)) else v225$2);
    p28$1 := (if p26$1 && v225$1 then v225$1 else p28$1);
    p28$2 := (if p26$2 && v225$2 then v225$2 else p28$2);
    v226$1 := (if p28$1 then $$out$0bv32$1 else v226$1);
    v226$2 := (if p28$2 then $$out$0bv32$2 else v226$2);
    call {:sourceloc} {:sourceloc_num 351} _LOG_WRITE_$$pSobelOriginal(p28$1, BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32)), v226$1, $$pSobelOriginal[BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pSobelOriginal(p28$2, BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32)));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 351} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 351} _CHECK_WRITE_$$pSobelOriginal(p28$2, BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32)), v226$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pSobelOriginal"} true;
    $$pSobelOriginal[BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32))] := (if p28$1 then v226$1 else $$pSobelOriginal[BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32))]);
    $$pSobelOriginal[BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32))] := (if p28$2 then v226$2 else $$pSobelOriginal[BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32))]);
    v227$1 := (if p28$1 then $$out$1bv32$1 else v227$1);
    v227$2 := (if p28$2 then $$out$1bv32$2 else v227$2);
    call {:sourceloc} {:sourceloc_num 353} _LOG_WRITE_$$pSobelOriginal(p28$1, BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32)), 1bv32), v227$1, $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pSobelOriginal(p28$2, BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 353} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 353} _CHECK_WRITE_$$pSobelOriginal(p28$2, BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32)), 1bv32), v227$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pSobelOriginal"} true;
    $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32)), 1bv32)] := (if p28$1 then v227$1 else $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32)), 1bv32)]);
    $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32)), 1bv32)] := (if p28$2 then v227$2 else $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32)), 1bv32)]);
    v228$1 := (if p28$1 then $$out$2bv32$1 else v228$1);
    v228$2 := (if p28$2 then $$out$2bv32$2 else v228$2);
    call {:sourceloc} {:sourceloc_num 355} _LOG_WRITE_$$pSobelOriginal(p28$1, BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32)), 2bv32), v228$1, $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32)), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pSobelOriginal(p28$2, BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32)), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 355} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 355} _CHECK_WRITE_$$pSobelOriginal(p28$2, BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32)), 2bv32), v228$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pSobelOriginal"} true;
    $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32)), 2bv32)] := (if p28$1 then v228$1 else $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32)), 2bv32)]);
    $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32)), 2bv32)] := (if p28$2 then v228$2 else $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32)), 2bv32)]);
    v229$1 := (if p28$1 then $$out$3bv32$1 else v229$1);
    v229$2 := (if p28$2 then $$out$3bv32$2 else v229$2);
    call {:sourceloc} {:sourceloc_num 357} _LOG_WRITE_$$pSobelOriginal(p28$1, BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32)), 3bv32), v229$1, $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32)), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pSobelOriginal(p28$2, BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32)), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 357} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 357} _CHECK_WRITE_$$pSobelOriginal(p28$2, BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32)), 3bv32), v229$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pSobelOriginal"} true;
    $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32)), 3bv32)] := (if p28$1 then v229$1 else $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$1), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$1), BV16_SEXT32($ib.2$1)), 4bv32)), 3bv32)]);
    $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32)), 3bv32)] := (if p28$2 then v229$2 else $$pSobelOriginal[BV32_ADD(BV32_ADD(BV32_MUL(BV16_SEXT32(v1$2), BV16_ZEXT32($SobelPitch)), BV32_MUL(BV32_ADD(BV16_SEXT32(v183$2), BV16_SEXT32($ib.2$2)), 4bv32)), 3bv32)]);
    $ib.2$1 := (if p8$1 then BV32_ADD(BV16_SEXT32($ib.2$1), group_size_x)[16:0] else $ib.2$1);
    $ib.2$2 := (if p8$2 then BV32_ADD(BV16_SEXT32($ib.2$2), group_size_x)[16:0] else $ib.2$2);
    p7$1 := (if p8$1 then true else p7$1);
    p7$2 := (if p8$2 then true else p7$2);
    goto $11.backedge, __partitioned_block_$11.tail_0;

  __partitioned_block_$11.tail_0:
    assume !p7$1 && !p7$2;
    goto __partitioned_block_$11.tail_1;

  __partitioned_block_$11.tail_1:
    call {:sourceloc_num 361} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    return;

  $11.backedge:
    assume {:backedge} p7$1 || p7$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $11;

  $6.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $6;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $1;
}



procedure {:source_name "_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff"} $_Z5tex2DIhET_7textureIS0_Li2EL19cudaTextureReadMode0EEff(_P$1: bool, $0$1: bv8, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, _P$2: bool, $0$2: bv8, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32) returns ($ret$1: bv8, $ret$2: bv8);



procedure {:source_name "abs"} $abs(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 128bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$LocalBlock, $$pSobelOriginal, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$LocalBlock, $$pSobelOriginal, _TRACKING;



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

var $$out$0bv32$1: bv8;

var $$out$0bv32$2: bv8;

var $$out$1bv32$1: bv8;

var $$out$1bv32$2: bv8;

var $$out$2bv32$1: bv8;

var $$out$2bv32$2: bv8;

var $$out$3bv32$1: bv8;

var $$out$3bv32$2: bv8;

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



const _WATCHED_VALUE_$$LocalBlock: bv8;

procedure {:inline 1} _LOG_READ_$$LocalBlock(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$LocalBlock;



implementation {:inline 1} _LOG_READ_$$LocalBlock(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$LocalBlock := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LocalBlock == _value then true else _READ_HAS_OCCURRED_$$LocalBlock);
    return;
}



procedure _CHECK_READ_$$LocalBlock(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "LocalBlock"} {:array "$$LocalBlock"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$LocalBlock && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$LocalBlock && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "LocalBlock"} {:array "$$LocalBlock"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$LocalBlock && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$LocalBlock: bool;

procedure {:inline 1} _LOG_WRITE_$$LocalBlock(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$LocalBlock, _WRITE_READ_BENIGN_FLAG_$$LocalBlock;



implementation {:inline 1} _LOG_WRITE_$$LocalBlock(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$LocalBlock := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LocalBlock == _value then true else _WRITE_HAS_OCCURRED_$$LocalBlock);
    _WRITE_READ_BENIGN_FLAG_$$LocalBlock := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LocalBlock == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$LocalBlock);
    return;
}



procedure _CHECK_WRITE_$$LocalBlock(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "LocalBlock"} {:array "$$LocalBlock"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$LocalBlock && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LocalBlock != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "LocalBlock"} {:array "$$LocalBlock"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$LocalBlock && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LocalBlock != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "LocalBlock"} {:array "$$LocalBlock"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$LocalBlock && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$LocalBlock(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$LocalBlock;



implementation {:inline 1} _LOG_ATOMIC_$$LocalBlock(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$LocalBlock := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$LocalBlock);
    return;
}



procedure _CHECK_ATOMIC_$$LocalBlock(_P: bool, _offset: bv32);
  requires {:source_name "LocalBlock"} {:array "$$LocalBlock"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$LocalBlock && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "LocalBlock"} {:array "$$LocalBlock"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$LocalBlock && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$LocalBlock(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$LocalBlock;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$LocalBlock(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$LocalBlock := (if _P && _WRITE_HAS_OCCURRED_$$LocalBlock && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$LocalBlock);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$LocalBlock;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$LocalBlock;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$LocalBlock;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$pSobelOriginal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$pSobelOriginal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$pSobelOriginal;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$pSobelOriginal;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$LocalBlock;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$LocalBlock;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$LocalBlock;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$LocalBlock;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$pSobelOriginal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$pSobelOriginal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$pSobelOriginal;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$pSobelOriginal;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$LocalBlock;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
