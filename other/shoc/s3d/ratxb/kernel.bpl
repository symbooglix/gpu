type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$T"} {:global} {:elem_width 32} {:source_name "T"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$T: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$T: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$T: bool;

axiom {:array_info "$$C"} {:global} {:elem_width 32} {:source_name "C"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$C: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$C: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$C: bool;

var {:source_name "RF"} {:global} $$RF: [bv32]bv32;

axiom {:array_info "$$RF"} {:global} {:elem_width 32} {:source_name "RF"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$RF: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$RF: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$RF: bool;

var {:source_name "RB"} {:global} $$RB: [bv32]bv32;

axiom {:array_info "$$RB"} {:global} {:elem_width 32} {:source_name "RB"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$RB: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$RB: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$RB: bool;

axiom {:array_info "$$RKLOW"} {:global} {:elem_width 32} {:source_name "RKLOW"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$RKLOW: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$RKLOW: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$RKLOW: bool;

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

function FADD64(bv64, bv64) : bv64;

function FDIV32(bv32, bv32) : bv32;

function FDIV64(bv64, bv64) : bv64;

function FEXP32(bv32) : bv32;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FMUL64(bv64, bv64) : bv64;

function FP32_CONV64(bv32) : bv64;

function FP64_CONV32(bv64) : bv32;

function FSUB32(bv32, bv32) : bv32;

function FSUB64(bv64, bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

procedure {:source_name "ratxb_kernel"} {:kernel} $ratxb_kernel($TCONV: bv32);
  requires !_READ_HAS_OCCURRED_$$T && !_WRITE_HAS_OCCURRED_$$T && !_ATOMIC_HAS_OCCURRED_$$T;
  requires !_READ_HAS_OCCURRED_$$C && !_WRITE_HAS_OCCURRED_$$C && !_ATOMIC_HAS_OCCURRED_$$C;
  requires !_READ_HAS_OCCURRED_$$RF && !_WRITE_HAS_OCCURRED_$$RF && !_ATOMIC_HAS_OCCURRED_$$RF;
  requires !_READ_HAS_OCCURRED_$$RB && !_WRITE_HAS_OCCURRED_$$RB && !_ATOMIC_HAS_OCCURRED_$$RB;
  requires !_READ_HAS_OCCURRED_$$RKLOW && !_WRITE_HAS_OCCURRED_$$RKLOW && !_ATOMIC_HAS_OCCURRED_$$RKLOW;
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
  modifies _READ_HAS_OCCURRED_$$RF, _WRITE_HAS_OCCURRED_$$RF, _WRITE_READ_BENIGN_FLAG_$$RF, _WRITE_READ_BENIGN_FLAG_$$RF, _READ_HAS_OCCURRED_$$RB, _WRITE_HAS_OCCURRED_$$RB, _WRITE_READ_BENIGN_FLAG_$$RB, _WRITE_READ_BENIGN_FLAG_$$RB;



implementation {:source_name "ratxb_kernel"} {:kernel} $ratxb_kernel($TCONV: bv32)
{
  var $CTOT.0$1: bv32;
  var $CTOT.0$2: bv32;
  var $k.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bool;
  var v3$1: bv32;
  var v3$2: bv32;
  var v119$1: bv32;
  var v119$2: bv32;
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
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
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
  var v104$1: bv32;
  var v104$2: bv32;
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
  var v93$1: bv32;
  var v93$2: bv32;
  var v94$1: bv32;
  var v94$2: bv32;
  var v95$1: bv32;
  var v95$2: bv32;
  var v96$1: bv32;
  var v96$2: bv32;
  var v97$1: bv32;
  var v97$2: bv32;
  var v98$1: bv32;
  var v98$2: bv32;
  var v99$1: bv32;
  var v99$2: bv32;
  var v100$1: bv32;
  var v100$2: bv32;
  var v101$1: bv32;
  var v101$2: bv32;
  var v102$1: bv32;
  var v102$2: bv32;
  var v103$1: bv32;
  var v103$2: bv32;
  var v105$1: bv32;
  var v105$2: bv32;
  var v106$1: bv32;
  var v106$2: bv32;
  var v107$1: bv32;
  var v107$2: bv32;
  var v108$1: bv32;
  var v108$2: bv32;
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
  var v117$1: bv32;
  var v117$2: bv32;
  var v118$1: bv32;
  var v118$2: bv32;
  var v120$1: bv32;
  var v120$2: bv32;
  var v121$1: bv32;
  var v121$2: bv32;
  var v122$1: bv32;
  var v122$2: bv32;
  var v123$1: bv32;
  var v123$2: bv32;
  var v124$1: bv32;
  var v124$2: bv32;
  var v125$1: bv32;
  var v125$2: bv32;
  var v126$1: bv32;
  var v126$2: bv32;
  var v127$1: bv32;
  var v127$2: bv32;
  var v128$1: bv32;
  var v128$2: bv32;
  var v129$1: bv32;
  var v129$2: bv32;
  var v130$1: bv32;
  var v130$2: bv32;
  var v131$1: bv32;
  var v131$2: bv32;
  var v132$1: bv32;
  var v132$2: bv32;
  var v133$1: bv32;
  var v133$2: bv32;
  var v134$1: bv32;
  var v134$2: bv32;
  var v135$1: bv32;
  var v135$2: bv32;
  var v136$1: bv32;
  var v136$2: bv32;
  var v137$1: bv32;
  var v137$2: bv32;
  var v138$1: bv32;
  var v138$2: bv32;
  var v139$1: bv32;
  var v139$2: bv32;
  var v140$1: bv32;
  var v140$2: bv32;
  var v141$1: bv32;
  var v141$2: bv32;
  var v142$1: bv32;
  var v142$2: bv32;
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
  var v155$1: bv32;
  var v155$2: bv32;
  var v156$1: bv32;
  var v156$2: bv32;
  var v157$1: bv32;
  var v157$2: bv32;
  var v158$1: bv32;
  var v158$2: bv32;
  var v159$1: bv32;
  var v159$2: bv32;
  var v160$1: bv32;
  var v160$2: bv32;
  var v161$1: bv32;
  var v161$2: bv32;
  var v162$1: bv32;
  var v162$2: bv32;
  var v163$1: bv32;
  var v163$2: bv32;
  var v164$1: bv32;
  var v164$2: bv32;
  var v165$1: bv32;
  var v165$2: bv32;
  var v166$1: bv32;
  var v166$2: bv32;
  var v167$1: bv32;
  var v167$2: bv32;
  var v168$1: bv32;
  var v168$2: bv32;
  var v169$1: bv32;
  var v169$2: bv32;
  var v170$1: bv32;
  var v170$2: bv32;
  var v171$1: bv32;
  var v171$2: bv32;
  var v172$1: bv32;
  var v172$2: bv32;
  var v173$1: bv32;
  var v173$2: bv32;
  var v174$1: bv32;
  var v174$2: bv32;
  var v175$1: bv32;
  var v175$2: bv32;
  var v176$1: bv32;
  var v176$2: bv32;
  var v177$1: bv32;
  var v177$2: bv32;
  var v178$1: bv32;
  var v178$2: bv32;
  var v179$1: bv32;
  var v179$2: bv32;
  var v180$1: bv32;
  var v180$2: bv32;
  var v181$1: bv32;
  var v181$2: bv32;
  var v182$1: bv32;
  var v182$2: bv32;
  var v183$1: bv32;
  var v183$2: bv32;
  var v184$1: bv32;
  var v184$2: bv32;
  var v185$1: bv32;
  var v185$2: bv32;
  var v186$1: bv32;
  var v186$2: bv32;
  var v187$1: bv32;
  var v187$2: bv32;
  var v188$1: bv32;
  var v188$2: bv32;
  var v189$1: bv32;
  var v189$2: bv32;
  var v190$1: bv32;
  var v190$2: bv32;
  var v191$1: bv32;
  var v191$2: bv32;
  var v192$1: bv32;
  var v192$2: bv32;
  var v193$1: bv32;
  var v193$2: bv32;
  var v194$1: bv32;
  var v194$2: bv32;
  var v195$1: bv32;
  var v195$2: bv32;
  var v196$1: bv32;
  var v196$2: bv32;
  var v197$1: bv32;
  var v197$2: bv32;
  var v198$1: bv32;
  var v198$2: bv32;
  var v199$1: bv32;
  var v199$2: bv32;


  $0:
    havoc v0$1, v0$2;
    v1$1 := FMUL32(v0$1, $TCONV);
    v1$2 := FMUL32(v0$2, $TCONV);
    $CTOT.0$1, $k.0 := 0bv32, 1bv32;
    $CTOT.0$2 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 2} true;
    v2 := BV32_ULE($k.0, 22bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v2 && !v2;
    havoc v4$1, v4$2;
    havoc v5$1, v5$2;
    havoc v6$1, v6$2;
    havoc v7$1, v7$2;
    havoc v8$1, v8$2;
    havoc v9$1, v9$2;
    havoc v10$1, v10$2;
    v11$1 := FP64_CONV32(FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v10$1)), FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v9$1)), FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v8$1)), FP32_CONV64(FSUB32(FADD32(FSUB32(FSUB32($CTOT.0$1, v4$1), v5$1), v6$1), v7$1))))));
    v11$2 := FP64_CONV32(FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v10$2)), FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v9$2)), FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v8$2)), FP32_CONV64(FSUB32(FADD32(FSUB32(FSUB32($CTOT.0$2, v4$2), v5$2), v6$2), v7$2))))));
    havoc v12$1, v12$2;
    havoc v13$1, v13$2;
    havoc v14$1, v14$2;
    havoc v15$1, v15$2;
    havoc v16$1, v16$2;
    havoc v17$1, v17$2;
    v18$1 := FP64_CONV32(FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v17$1)), FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v16$1)), FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v15$1)), FP32_CONV64(FADD32(FADD32(FMUL32(1076468122bv32, v13$1), FADD32(FMUL32(3196730737bv32, v12$1), $CTOT.0$1)), v14$1))))));
    v18$2 := FP64_CONV32(FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v17$2)), FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v16$2)), FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v15$2)), FP32_CONV64(FADD32(FADD32(FMUL32(1076468122bv32, v13$2), FADD32(FMUL32(3196730737bv32, v12$2), $CTOT.0$2)), v14$2))))));
    havoc v19$1, v19$2;
    havoc v20$1, v20$2;
    havoc v21$1, v21$2;
    havoc v22$1, v22$2;
    havoc v23$1, v23$2;
    havoc v24$1, v24$2;
    havoc v25$1, v25$2;
    havoc v26$1, v26$2;
    v27$1 := FP64_CONV32(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FMUL64(4617315517961601024bv64, FP32_CONV64(v20$1)), FP32_CONV64(FADD32($CTOT.0$1, v19$1))), FP32_CONV64(v21$1)), FMUL64(4602678819172646912bv64, FP32_CONV64(v22$1))), FP32_CONV64(v23$1)), FMUL64(4611686018427387904bv64, FP32_CONV64(v24$1))), FMUL64(4611686018427387904bv64, FP32_CONV64(v25$1))), FMUL64(4611686018427387904bv64, FP32_CONV64(v26$1))));
    v27$2 := FP64_CONV32(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FMUL64(4617315517961601024bv64, FP32_CONV64(v20$2)), FP32_CONV64(FADD32($CTOT.0$2, v19$2))), FP32_CONV64(v21$2)), FMUL64(4602678819172646912bv64, FP32_CONV64(v22$2))), FP32_CONV64(v23$2)), FMUL64(4611686018427387904bv64, FP32_CONV64(v24$2))), FMUL64(4611686018427387904bv64, FP32_CONV64(v25$2))), FMUL64(4611686018427387904bv64, FP32_CONV64(v26$2))));
    havoc v28$1, v28$2;
    havoc v29$1, v29$2;
    havoc v30$1, v30$2;
    havoc v31$1, v31$2;
    havoc v32$1, v32$2;
    havoc v33$1, v33$2;
    havoc v34$1, v34$2;
    havoc v35$1, v35$2;
    v36$1 := FP64_CONV32(FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v35$1)), FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v34$1)), FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v33$1)), FP32_CONV64(FADD32(FADD32(FADD32(FADD32(FMUL32(1097229926bv32, v29$1), FADD32(FMUL32(1068708659bv32, v28$1), $CTOT.0$1)), v30$1), FMUL32(1061158912bv32, v31$1)), FMUL32(1076258406bv32, v32$1)))))));
    v36$2 := FP64_CONV32(FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v35$2)), FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v34$2)), FADD64(FMUL64(4611686018427387904bv64, FP32_CONV64(v33$2)), FP32_CONV64(FADD32(FADD32(FADD32(FADD32(FMUL32(1097229926bv32, v29$2), FADD32(FMUL32(1068708659bv32, v28$2), $CTOT.0$2)), v30$2), FMUL32(1061158912bv32, v31$2)), FMUL32(1076258406bv32, v32$2)))))));
    havoc v37$1, v37$2;
    havoc v38$1, v38$2;
    havoc v39$1, v39$2;
    havoc v40$1, v40$2;
    havoc v41$1, v41$2;
    havoc v42$1, v42$2;
    havoc v43$1, v43$2;
    havoc v44$1, v44$2;
    v45$1 := FP64_CONV32(FADD64(FADD64(FSUB64(FADD64(FMUL64(4602678819172646912bv64, FP32_CONV64(v41$1)), FADD64(FMUL64(4602678819172646912bv64, FP32_CONV64(v40$1)), FP32_CONV64(FSUB32(FSUB32(FSUB32($CTOT.0$1, v37$1), v38$1), FMUL32(1048576000bv32, v39$1))))), FP32_CONV64(v42$1)), FMUL64(4611686018427387904bv64, FP32_CONV64(v43$1))), FMUL64(4611686018427387904bv64, FP32_CONV64(v44$1))));
    v45$2 := FP64_CONV32(FADD64(FADD64(FSUB64(FADD64(FMUL64(4602678819172646912bv64, FP32_CONV64(v41$2)), FADD64(FMUL64(4602678819172646912bv64, FP32_CONV64(v40$2)), FP32_CONV64(FSUB32(FSUB32(FSUB32($CTOT.0$2, v37$2), v38$2), FMUL32(1048576000bv32, v39$2))))), FP32_CONV64(v42$2)), FMUL64(4611686018427387904bv64, FP32_CONV64(v43$2))), FMUL64(4611686018427387904bv64, FP32_CONV64(v44$2))));
    havoc v46$1, v46$2;
    havoc v47$1, v47$2;
    havoc v48$1, v48$2;
    havoc v49$1, v49$2;
    havoc v50$1, v50$2;
    havoc v51$1, v51$2;
    havoc v52$1, v52$2;
    havoc v53$1, v53$2;
    havoc v54$1, v54$2;
    v55$1 := FP64_CONV32(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FMUL64(4617315517961601024bv64, FP32_CONV64(v48$1)), FADD64(FMUL64(4617315517961601024bv64, FP32_CONV64(v47$1)), FP32_CONV64(FADD32($CTOT.0$1, v46$1)))), FP32_CONV64(v49$1)), FMUL64(4602678819172646912bv64, FP32_CONV64(v50$1))), FP32_CONV64(FMUL32(1075838976bv32, v51$1))), FMUL64(4611686018427387904bv64, FP32_CONV64(v52$1))), FMUL64(4611686018427387904bv64, FP32_CONV64(v53$1))), FMUL64(4611686018427387904bv64, FP32_CONV64(v54$1))));
    v55$2 := FP64_CONV32(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FMUL64(4617315517961601024bv64, FP32_CONV64(v48$2)), FADD64(FMUL64(4617315517961601024bv64, FP32_CONV64(v47$2)), FP32_CONV64(FADD32($CTOT.0$2, v46$2)))), FP32_CONV64(v49$2)), FMUL64(4602678819172646912bv64, FP32_CONV64(v50$2))), FP32_CONV64(FMUL32(1075838976bv32, v51$2))), FMUL64(4611686018427387904bv64, FP32_CONV64(v52$2))), FMUL64(4611686018427387904bv64, FP32_CONV64(v53$2))), FMUL64(4611686018427387904bv64, FP32_CONV64(v54$2))));
    havoc v56$1, v56$2;
    havoc v57$1, v57$2;
    havoc v58$1, v58$2;
    havoc v59$1, v59$2;
    havoc v60$1, v60$2;
    havoc v61$1, v61$2;
    call {:sourceloc} {:sourceloc_num 59} _LOG_READ_$$RF(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 59} _CHECK_READ_$$RF(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v62$1 := $$RF[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v62$2 := $$RF[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v63$1, v63$2;
    havoc v64$1, v64$2;
    call {:sourceloc} {:sourceloc_num 62} _LOG_WRITE_$$RF(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(FMUL32(v62$1, v11$1), v63$1), v64$1), $$RF[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 62} _CHECK_WRITE_$$RF(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(FMUL32(v62$2, v11$2), v63$2), v64$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(FMUL32(v62$1, v11$1), v63$1), v64$1);
    $$RF[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(FMUL32(v62$2, v11$2), v63$2), v64$2);
    call {:sourceloc} {:sourceloc_num 63} _LOG_READ_$$RB(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 63} _CHECK_READ_$$RB(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v65$1 := $$RB[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v65$2 := $$RB[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v66$1, v66$2;
    call {:sourceloc} {:sourceloc_num 65} _LOG_WRITE_$$RB(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(v65$1, v11$1), v66$1), $$RB[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 65} _CHECK_WRITE_$$RB(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(v65$2, v11$2), v66$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(v65$1, v11$1), v66$1);
    $$RB[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(v65$2, v11$2), v66$2);
    call {:sourceloc} {:sourceloc_num 66} _LOG_READ_$$RF(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 66} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 66} _CHECK_READ_$$RF(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v67$1 := $$RF[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v67$2 := $$RF[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v68$1, v68$2;
    havoc v69$1, v69$2;
    call {:sourceloc} {:sourceloc_num 69} _LOG_WRITE_$$RF(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(FMUL32(v67$1, v18$1), v68$1), v69$1), $$RF[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 69} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 69} _CHECK_WRITE_$$RF(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(FMUL32(v67$2, v18$2), v68$2), v69$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(FMUL32(v67$1, v18$1), v68$1), v69$1);
    $$RF[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(FMUL32(v67$2, v18$2), v68$2), v69$2);
    call {:sourceloc} {:sourceloc_num 70} _LOG_READ_$$RB(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 70} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 70} _CHECK_READ_$$RB(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v70$1 := $$RB[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v70$2 := $$RB[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v71$1, v71$2;
    call {:sourceloc} {:sourceloc_num 72} _LOG_WRITE_$$RB(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(v70$1, v18$1), v71$1), $$RB[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 72} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 72} _CHECK_WRITE_$$RB(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(v70$2, v18$2), v71$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(v70$1, v18$1), v71$1);
    $$RB[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(v70$2, v18$2), v71$2);
    call {:sourceloc} {:sourceloc_num 73} _LOG_READ_$$RF(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 73} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 73} _CHECK_READ_$$RF(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v72$1 := $$RF[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v72$2 := $$RF[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v73$1, v73$2;
    havoc v74$1, v74$2;
    call {:sourceloc} {:sourceloc_num 76} _LOG_WRITE_$$RF(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(FMUL32(v72$1, v27$1), v73$1), v74$1), $$RF[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 76} _CHECK_WRITE_$$RF(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(FMUL32(v72$2, v27$2), v73$2), v74$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(FMUL32(v72$1, v27$1), v73$1), v74$1);
    $$RF[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(FMUL32(v72$2, v27$2), v73$2), v74$2);
    call {:sourceloc} {:sourceloc_num 77} _LOG_READ_$$RB(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 77} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 77} _CHECK_READ_$$RB(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v75$1 := $$RB[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v75$2 := $$RB[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v76$1, v76$2;
    call {:sourceloc} {:sourceloc_num 79} _LOG_WRITE_$$RB(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(v75$1, v27$1), v76$1), $$RB[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 79} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 79} _CHECK_WRITE_$$RB(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(v75$2, v27$2), v76$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(v75$1, v27$1), v76$1);
    $$RB[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(v75$2, v27$2), v76$2);
    call {:sourceloc} {:sourceloc_num 80} _LOG_READ_$$RF(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 80} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 80} _CHECK_READ_$$RF(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v77$1 := $$RF[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v77$2 := $$RF[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v78$1, v78$2;
    havoc v79$1, v79$2;
    call {:sourceloc} {:sourceloc_num 83} _LOG_WRITE_$$RF(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(FMUL32(v77$1, v36$1), v78$1), v79$1), $$RF[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 83} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 83} _CHECK_WRITE_$$RF(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(FMUL32(v77$2, v36$2), v78$2), v79$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(FMUL32(v77$1, v36$1), v78$1), v79$1);
    $$RF[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(FMUL32(v77$2, v36$2), v78$2), v79$2);
    call {:sourceloc} {:sourceloc_num 84} _LOG_READ_$$RB(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 84} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 84} _CHECK_READ_$$RB(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v80$1 := $$RB[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v80$2 := $$RB[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v81$1, v81$2;
    call {:sourceloc} {:sourceloc_num 86} _LOG_WRITE_$$RB(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(v80$1, v36$1), v81$1), $$RB[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 86} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 86} _CHECK_WRITE_$$RB(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(v80$2, v36$2), v81$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(v80$1, v36$1), v81$1);
    $$RB[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(v80$2, v36$2), v81$2);
    call {:sourceloc} {:sourceloc_num 87} _LOG_READ_$$RF(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 87} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 87} _CHECK_READ_$$RF(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v82$1 := $$RF[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v82$2 := $$RF[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v83$1, v83$2;
    havoc v84$1, v84$2;
    call {:sourceloc} {:sourceloc_num 90} _LOG_WRITE_$$RF(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(FMUL32(v82$1, v45$1), v83$1), v84$1), $$RF[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 90} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 90} _CHECK_WRITE_$$RF(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(FMUL32(v82$2, v45$2), v83$2), v84$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(FMUL32(v82$1, v45$1), v83$1), v84$1);
    $$RF[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(FMUL32(v82$2, v45$2), v83$2), v84$2);
    call {:sourceloc} {:sourceloc_num 91} _LOG_READ_$$RB(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 91} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 91} _CHECK_READ_$$RB(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v85$1 := $$RB[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v85$2 := $$RB[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v86$1, v86$2;
    call {:sourceloc} {:sourceloc_num 93} _LOG_WRITE_$$RB(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(v85$1, v45$1), v86$1), $$RB[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 93} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 93} _CHECK_WRITE_$$RB(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(v85$2, v45$2), v86$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(v85$1, v45$1), v86$1);
    $$RB[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(v85$2, v45$2), v86$2);
    call {:sourceloc} {:sourceloc_num 94} _LOG_READ_$$RF(true, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 94} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 94} _CHECK_READ_$$RF(true, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v87$1 := $$RF[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v87$2 := $$RF[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v88$1, v88$2;
    havoc v89$1, v89$2;
    call {:sourceloc} {:sourceloc_num 97} _LOG_WRITE_$$RF(true, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(FMUL32(v87$1, v55$1), v88$1), v89$1), $$RF[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 97} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 97} _CHECK_WRITE_$$RF(true, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(FMUL32(v87$2, v55$2), v88$2), v89$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(FMUL32(v87$1, v55$1), v88$1), v89$1);
    $$RF[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(FMUL32(v87$2, v55$2), v88$2), v89$2);
    call {:sourceloc} {:sourceloc_num 98} _LOG_READ_$$RB(true, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 98} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 98} _CHECK_READ_$$RB(true, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v90$1 := $$RB[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v90$2 := $$RB[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v91$1, v91$2;
    call {:sourceloc} {:sourceloc_num 100} _LOG_WRITE_$$RB(true, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(v90$1, v55$1), v91$1), $$RB[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 100} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 100} _CHECK_WRITE_$$RB(true, BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(v90$2, v55$2), v91$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(v90$1, v55$1), v91$1);
    $$RB[BV32_ADD(387072bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(v90$2, v55$2), v91$2);
    call {:sourceloc} {:sourceloc_num 101} _LOG_READ_$$RF(true, BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 101} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 101} _CHECK_READ_$$RF(true, BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v92$1 := $$RF[BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v92$2 := $$RF[BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 102} _LOG_WRITE_$$RF(true, BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v92$1, v27$1), $$RF[BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 102} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 102} _CHECK_WRITE_$$RF(true, BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v92$2, v27$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v92$1, v27$1);
    $$RF[BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v92$2, v27$2);
    call {:sourceloc} {:sourceloc_num 103} _LOG_READ_$$RB(true, BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 103} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 103} _CHECK_READ_$$RB(true, BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v93$1 := $$RB[BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v93$2 := $$RB[BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v94$1, v94$2;
    havoc v95$1, v95$2;
    call {:sourceloc} {:sourceloc_num 106} _LOG_WRITE_$$RB(true, BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(FMUL32(v93$1, v27$1), v94$1), v95$1), $$RB[BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 106} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 106} _CHECK_WRITE_$$RB(true, BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(FMUL32(v93$2, v27$2), v94$2), v95$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(FMUL32(v93$1, v27$1), v94$1), v95$1);
    $$RB[BV32_ADD(622080bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(FMUL32(v93$2, v27$2), v94$2), v95$2);
    call {:sourceloc} {:sourceloc_num 107} _LOG_READ_$$RF(true, BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 107} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 107} _CHECK_READ_$$RF(true, BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v96$1 := $$RF[BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v96$2 := $$RF[BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v97$1, v97$2;
    havoc v98$1, v98$2;
    call {:sourceloc} {:sourceloc_num 110} _LOG_WRITE_$$RF(true, BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(FMUL32(v96$1, $CTOT.0$1), v97$1), v98$1), $$RF[BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 110} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 110} _CHECK_WRITE_$$RF(true, BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(FMUL32(v96$2, $CTOT.0$2), v97$2), v98$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(FMUL32(v96$1, $CTOT.0$1), v97$1), v98$1);
    $$RF[BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(FMUL32(v96$2, $CTOT.0$2), v97$2), v98$2);
    call {:sourceloc} {:sourceloc_num 111} _LOG_READ_$$RB(true, BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 111} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 111} _CHECK_READ_$$RB(true, BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v99$1 := $$RB[BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v99$2 := $$RB[BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    havoc v100$1, v100$2;
    call {:sourceloc} {:sourceloc_num 113} _LOG_WRITE_$$RB(true, BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(v99$1, $CTOT.0$1), v100$1), $$RB[BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 113} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 113} _CHECK_WRITE_$$RB(true, BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(v99$2, $CTOT.0$2), v100$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(v99$1, $CTOT.0$1), v100$1);
    $$RB[BV32_ADD(1658880bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(v99$2, $CTOT.0$2), v100$2);
    havoc v101$1, v101$2;
    call {:sourceloc} {:sourceloc_num 115} _LOG_READ_$$RF(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 115} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 115} _CHECK_READ_$$RF(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v102$1 := $$RF[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v102$2 := $$RF[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v103$1 := FMUL32(v101$1, FMUL32(v27$1, FDIV32(1065353216bv32, v102$1)));
    v103$2 := FMUL32(v101$2, FMUL32(v27$2, FDIV32(1065353216bv32, v102$2)));
    call {:sourceloc_num 116} v104$1, v104$2 := $__log10_float((if FLT32(v103$1, 8388608bv32) then 8388608bv32 else v103$1), (if FLT32(v103$2, 8388608bv32) then 8388608bv32 else v103$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v105$1 := FADD32(FADD32(FMUL32(1059699294bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 974754284bv32), 1069066811bv32))), FMUL32(1051495236bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 967038730bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3313571840bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v105$2 := FADD32(FADD32(FMUL32(1059699294bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 974754284bv32), 1069066811bv32))), FMUL32(1051495236bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 967038730bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3313571840bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 117} v106$1, v106$2 := $__log10_float((if FLT32(v105$1, 8388608bv32) then 8388608bv32 else v105$1), (if FLT32(v105$2, 8388608bv32) then 8388608bv32 else v105$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v107$1 := FP64_CONV32(FSUB64(FP32_CONV64(v104$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v106$1)), 4600877379321698714bv64)));
    v107$2 := FP64_CONV32(FSUB64(FP32_CONV64(v104$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v106$2)), 4600877379321698714bv64)));
    v108$1 := FP64_CONV32(FMUL64(FP32_CONV64(v107$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v107$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v106$1)), 4604930618986332160bv64)))))));
    v108$2 := FP64_CONV32(FMUL64(FP32_CONV64(v107$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v107$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v106$2)), 4604930618986332160bv64)))))));
    v109$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v106$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v108$1, v108$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v103$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v103$1))))));
    v109$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v106$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v108$2, v108$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v103$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v103$2))))));
    call {:sourceloc} {:sourceloc_num 118} _LOG_READ_$$RF(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 118} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 118} _CHECK_READ_$$RF(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v110$1 := $$RF[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v110$2 := $$RF[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 119} _LOG_WRITE_$$RF(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v110$1, v109$1), $$RF[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 119} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 119} _CHECK_WRITE_$$RF(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v110$2, v109$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v110$1, v109$1);
    $$RF[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v110$2, v109$2);
    call {:sourceloc} {:sourceloc_num 120} _LOG_READ_$$RB(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 120} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 120} _CHECK_READ_$$RB(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v111$1 := $$RB[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v111$2 := $$RB[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 121} _LOG_WRITE_$$RB(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v111$1, v109$1), $$RB[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 121} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 121} _CHECK_WRITE_$$RB(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v111$2, v109$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v111$1, v109$1);
    $$RB[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v111$2, v109$2);
    havoc v112$1, v112$2;
    call {:sourceloc} {:sourceloc_num 123} _LOG_READ_$$RF(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 123} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 123} _CHECK_READ_$$RF(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v113$1 := $$RF[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v113$2 := $$RF[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v114$1 := FMUL32(v112$1, FMUL32(v27$1, FDIV32(1065353216bv32, v113$1)));
    v114$2 := FMUL32(v112$2, FMUL32(v27$2, FDIV32(1065353216bv32, v113$2)));
    call {:sourceloc_num 124} v115$1, v115$2 := $__log10_float((if FLT32(v114$1, 8388608bv32) then 8388608bv32 else v114$1), (if FLT32(v114$2, 8388608bv32) then 8388608bv32 else v114$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v116$1 := FADD32(FADD32(FMUL32(1046428516bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 1000205063bv32), 1069066811bv32))), FMUL32(1061695783bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 969203955bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3317594112bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v116$2 := FADD32(FADD32(FMUL32(1046428516bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 1000205063bv32), 1069066811bv32))), FMUL32(1061695783bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 969203955bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3317594112bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 125} v117$1, v117$2 := $__log10_float((if FLT32(v116$1, 8388608bv32) then 8388608bv32 else v116$1), (if FLT32(v116$2, 8388608bv32) then 8388608bv32 else v116$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v118$1 := FP64_CONV32(FSUB64(FP32_CONV64(v115$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v117$1)), 4600877379321698714bv64)));
    v118$2 := FP64_CONV32(FSUB64(FP32_CONV64(v115$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v117$2)), 4600877379321698714bv64)));
    v119$1 := FP64_CONV32(FMUL64(FP32_CONV64(v118$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v118$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v117$1)), 4604930618986332160bv64)))))));
    v119$2 := FP64_CONV32(FMUL64(FP32_CONV64(v118$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v118$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v117$2)), 4604930618986332160bv64)))))));
    v120$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v117$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v119$1, v119$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v114$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v114$1))))));
    v120$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v117$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v119$2, v119$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v114$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v114$2))))));
    call {:sourceloc} {:sourceloc_num 126} _LOG_READ_$$RF(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 126} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 126} _CHECK_READ_$$RF(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v121$1 := $$RF[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v121$2 := $$RF[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 127} _LOG_WRITE_$$RF(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v121$1, v120$1), $$RF[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 127} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 127} _CHECK_WRITE_$$RF(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v121$2, v120$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v121$1, v120$1);
    $$RF[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v121$2, v120$2);
    call {:sourceloc} {:sourceloc_num 128} _LOG_READ_$$RB(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 128} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 128} _CHECK_READ_$$RB(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v122$1 := $$RB[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v122$2 := $$RB[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 129} _LOG_WRITE_$$RB(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v122$1, v120$1), $$RB[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 129} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 129} _CHECK_WRITE_$$RB(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v122$2, v120$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v122$1, v120$1);
    $$RB[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v122$2, v120$2);
    havoc v123$1, v123$2;
    call {:sourceloc} {:sourceloc_num 131} _LOG_READ_$$RF(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 131} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 131} _CHECK_READ_$$RF(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v124$1 := $$RF[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v124$2 := $$RF[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v125$1 := FMUL32(v123$1, FMUL32(v27$1, FDIV32(1065353216bv32, v124$1)));
    v125$2 := FMUL32(v123$2, FMUL32(v27$2, FDIV32(1065353216bv32, v124$2)));
    call {:sourceloc_num 132} v126$1, v126$2 := $__log10_float((if FLT32(v125$1, 8388608bv32) then 8388608bv32 else v125$1), (if FLT32(v125$2, 8388608bv32) then 8388608bv32 else v125$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v127$1 := FADD32(FADD32(FMUL32(1062417203bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 977504980bv32), 1069066811bv32))), FMUL32(1043542835bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 931909477bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3323883315bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v127$2 := FADD32(FADD32(FMUL32(1062417203bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 977504980bv32), 1069066811bv32))), FMUL32(1043542835bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 931909477bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3323883315bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 133} v128$1, v128$2 := $__log10_float((if FLT32(v127$1, 8388608bv32) then 8388608bv32 else v127$1), (if FLT32(v127$2, 8388608bv32) then 8388608bv32 else v127$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v129$1 := FP64_CONV32(FSUB64(FP32_CONV64(v126$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v128$1)), 4600877379321698714bv64)));
    v129$2 := FP64_CONV32(FSUB64(FP32_CONV64(v126$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v128$2)), 4600877379321698714bv64)));
    v130$1 := FP64_CONV32(FMUL64(FP32_CONV64(v129$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v129$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v128$1)), 4604930618986332160bv64)))))));
    v130$2 := FP64_CONV32(FMUL64(FP32_CONV64(v129$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v129$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v128$2)), 4604930618986332160bv64)))))));
    v131$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v128$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v130$1, v130$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v125$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v125$1))))));
    v131$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v128$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v130$2, v130$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v125$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v125$2))))));
    call {:sourceloc} {:sourceloc_num 134} _LOG_READ_$$RF(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 134} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 134} _CHECK_READ_$$RF(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v132$1 := $$RF[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v132$2 := $$RF[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 135} _LOG_WRITE_$$RF(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v132$1, v131$1), $$RF[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 135} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 135} _CHECK_WRITE_$$RF(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v132$2, v131$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v132$1, v131$1);
    $$RF[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v132$2, v131$2);
    call {:sourceloc} {:sourceloc_num 136} _LOG_READ_$$RB(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 136} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 136} _CHECK_READ_$$RB(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v133$1 := $$RB[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v133$2 := $$RB[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 137} _LOG_WRITE_$$RB(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v133$1, v131$1), $$RB[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 137} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 137} _CHECK_WRITE_$$RB(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v133$2, v131$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v133$1, v131$1);
    $$RB[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v133$2, v131$2);
    havoc v134$1, v134$2;
    call {:sourceloc} {:sourceloc_num 139} _LOG_READ_$$RF(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 139} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 139} _CHECK_READ_$$RF(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v135$1 := $$RF[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v135$2 := $$RF[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v136$1 := FMUL32(v134$1, FMUL32(v27$1, FDIV32(1065353216bv32, v135$1)));
    v136$2 := FMUL32(v134$2, FMUL32(v27$2, FDIV32(1065353216bv32, v135$2)));
    call {:sourceloc_num 140} v137$1, v137$2 := $__log10_float((if FLT32(v136$1, 8388608bv32) then 8388608bv32 else v136$1), (if FLT32(v136$2, 8388608bv32) then 8388608bv32 else v136$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v138$1 := FADD32(FADD32(FMUL32(1055286886bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 954966675bv32), 1069066811bv32))), FMUL32(1057803469bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 963710285bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3319947264bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v138$2 := FADD32(FADD32(FMUL32(1055286886bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 954966675bv32), 1069066811bv32))), FMUL32(1057803469bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 963710285bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3319947264bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 141} v139$1, v139$2 := $__log10_float((if FLT32(v138$1, 8388608bv32) then 8388608bv32 else v138$1), (if FLT32(v138$2, 8388608bv32) then 8388608bv32 else v138$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v140$1 := FP64_CONV32(FSUB64(FP32_CONV64(v137$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v139$1)), 4600877379321698714bv64)));
    v140$2 := FP64_CONV32(FSUB64(FP32_CONV64(v137$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v139$2)), 4600877379321698714bv64)));
    v141$1 := FP64_CONV32(FMUL64(FP32_CONV64(v140$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v140$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v139$1)), 4604930618986332160bv64)))))));
    v141$2 := FP64_CONV32(FMUL64(FP32_CONV64(v140$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v140$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v139$2)), 4604930618986332160bv64)))))));
    v142$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v139$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v141$1, v141$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v136$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v136$1))))));
    v142$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v139$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v141$2, v141$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v136$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v136$2))))));
    call {:sourceloc} {:sourceloc_num 142} _LOG_READ_$$RF(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 142} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 142} _CHECK_READ_$$RF(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v143$1 := $$RF[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v143$2 := $$RF[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 143} _LOG_WRITE_$$RF(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v143$1, v142$1), $$RF[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 143} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 143} _CHECK_WRITE_$$RF(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v143$2, v142$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v143$1, v142$1);
    $$RF[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v143$2, v142$2);
    call {:sourceloc} {:sourceloc_num 144} _LOG_READ_$$RB(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 144} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 144} _CHECK_READ_$$RB(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v144$1 := $$RB[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v144$2 := $$RB[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 145} _LOG_WRITE_$$RB(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v144$1, v142$1), $$RB[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 145} true;
    call {:check_id "check_state_51"} {:sourceloc} {:sourceloc_num 145} _CHECK_WRITE_$$RB(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v144$2, v142$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v144$1, v142$1);
    $$RB[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v144$2, v142$2);
    havoc v145$1, v145$2;
    call {:sourceloc} {:sourceloc_num 147} _LOG_READ_$$RF(true, BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 147} true;
    call {:check_id "check_state_52"} {:sourceloc} {:sourceloc_num 147} _CHECK_READ_$$RF(true, BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v146$1 := $$RF[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v146$2 := $$RF[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v147$1 := FMUL32(v145$1, FMUL32(v27$1, FDIV32(1065353216bv32, v146$1)));
    v147$2 := FMUL32(v145$2, FMUL32(v27$2, FDIV32(1065353216bv32, v146$2)));
    call {:sourceloc_num 148} v148$1, v148$2 := $__log10_float((if FLT32(v147$1, 8388608bv32) then 8388608bv32 else v147$1), (if FLT32(v147$2, 8388608bv32) then 8388608bv32 else v147$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v149$1 := FADD32(FADD32(FMUL32(1049096094bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 1001786209bv32), 1069066811bv32))), FMUL32(1060898865bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 981288827bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3316205568bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v149$2 := FADD32(FADD32(FMUL32(1049096094bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 1001786209bv32), 1069066811bv32))), FMUL32(1060898865bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 981288827bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3316205568bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 149} v150$1, v150$2 := $__log10_float((if FLT32(v149$1, 8388608bv32) then 8388608bv32 else v149$1), (if FLT32(v149$2, 8388608bv32) then 8388608bv32 else v149$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v151$1 := FP64_CONV32(FSUB64(FP32_CONV64(v148$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v150$1)), 4600877379321698714bv64)));
    v151$2 := FP64_CONV32(FSUB64(FP32_CONV64(v148$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v150$2)), 4600877379321698714bv64)));
    v152$1 := FP64_CONV32(FMUL64(FP32_CONV64(v151$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v151$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v150$1)), 4604930618986332160bv64)))))));
    v152$2 := FP64_CONV32(FMUL64(FP32_CONV64(v151$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v151$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v150$2)), 4604930618986332160bv64)))))));
    v153$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v150$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v152$1, v152$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v147$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v147$1))))));
    v153$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v150$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v152$2, v152$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v147$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v147$2))))));
    call {:sourceloc} {:sourceloc_num 150} _LOG_READ_$$RF(true, BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 150} true;
    call {:check_id "check_state_53"} {:sourceloc} {:sourceloc_num 150} _CHECK_READ_$$RF(true, BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v154$1 := $$RF[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v154$2 := $$RF[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 151} _LOG_WRITE_$$RF(true, BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v154$1, v153$1), $$RF[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 151} true;
    call {:check_id "check_state_54"} {:sourceloc} {:sourceloc_num 151} _CHECK_WRITE_$$RF(true, BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v154$2, v153$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v154$1, v153$1);
    $$RF[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v154$2, v153$2);
    call {:sourceloc} {:sourceloc_num 152} _LOG_READ_$$RB(true, BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 152} true;
    call {:check_id "check_state_55"} {:sourceloc} {:sourceloc_num 152} _CHECK_READ_$$RB(true, BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v155$1 := $$RB[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v155$2 := $$RB[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 153} _LOG_WRITE_$$RB(true, BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v155$1, v153$1), $$RB[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_56"} {:captureState "check_state_56"} {:sourceloc} {:sourceloc_num 153} true;
    call {:check_id "check_state_56"} {:sourceloc} {:sourceloc_num 153} _CHECK_WRITE_$$RB(true, BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v155$2, v153$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v155$1, v153$1);
    $$RB[BV32_ADD(2128896bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v155$2, v153$2);
    havoc v156$1, v156$2;
    call {:sourceloc} {:sourceloc_num 155} _LOG_READ_$$RF(true, BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_57"} {:captureState "check_state_57"} {:sourceloc} {:sourceloc_num 155} true;
    call {:check_id "check_state_57"} {:sourceloc} {:sourceloc_num 155} _CHECK_READ_$$RF(true, BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v157$1 := $$RF[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v157$2 := $$RF[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v158$1 := FMUL32(v156$1, FMUL32(v27$1, FDIV32(1065353216bv32, v157$1)));
    v158$2 := FMUL32(v156$2, FMUL32(v27$2, FDIV32(1065353216bv32, v157$2)));
    call {:sourceloc_num 156} v159$1, v159$2 := $__log10_float((if FLT32(v158$1, 8388608bv32) then 8388608bv32 else v158$1), (if FLT32(v158$2, 8388608bv32) then 8388608bv32 else v158$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v160$1 := FADD32(FADD32(FMUL32(1019893672bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 1000081857bv32), 1069066811bv32))), FMUL32(1064938819bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 981808136bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3314069504bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v160$2 := FADD32(FADD32(FMUL32(1019893672bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 1000081857bv32), 1069066811bv32))), FMUL32(1064938819bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 981808136bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3314069504bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 157} v161$1, v161$2 := $__log10_float((if FLT32(v160$1, 8388608bv32) then 8388608bv32 else v160$1), (if FLT32(v160$2, 8388608bv32) then 8388608bv32 else v160$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v162$1 := FP64_CONV32(FSUB64(FP32_CONV64(v159$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v161$1)), 4600877379321698714bv64)));
    v162$2 := FP64_CONV32(FSUB64(FP32_CONV64(v159$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v161$2)), 4600877379321698714bv64)));
    v163$1 := FP64_CONV32(FMUL64(FP32_CONV64(v162$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v162$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v161$1)), 4604930618986332160bv64)))))));
    v163$2 := FP64_CONV32(FMUL64(FP32_CONV64(v162$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v162$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v161$2)), 4604930618986332160bv64)))))));
    v164$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v161$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v163$1, v163$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v158$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v158$1))))));
    v164$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v161$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v163$2, v163$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v158$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v158$2))))));
    call {:sourceloc} {:sourceloc_num 158} _LOG_READ_$$RF(true, BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_58"} {:captureState "check_state_58"} {:sourceloc} {:sourceloc_num 158} true;
    call {:check_id "check_state_58"} {:sourceloc} {:sourceloc_num 158} _CHECK_READ_$$RF(true, BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v165$1 := $$RF[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v165$2 := $$RF[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 159} _LOG_WRITE_$$RF(true, BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v165$1, v164$1), $$RF[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_59"} {:captureState "check_state_59"} {:sourceloc} {:sourceloc_num 159} true;
    call {:check_id "check_state_59"} {:sourceloc} {:sourceloc_num 159} _CHECK_WRITE_$$RF(true, BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v165$2, v164$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v165$1, v164$1);
    $$RF[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v165$2, v164$2);
    call {:sourceloc} {:sourceloc_num 160} _LOG_READ_$$RB(true, BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_60"} {:captureState "check_state_60"} {:sourceloc} {:sourceloc_num 160} true;
    call {:check_id "check_state_60"} {:sourceloc} {:sourceloc_num 160} _CHECK_READ_$$RB(true, BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v166$1 := $$RB[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v166$2 := $$RB[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 161} _LOG_WRITE_$$RB(true, BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v166$1, v164$1), $$RB[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_61"} {:captureState "check_state_61"} {:sourceloc} {:sourceloc_num 161} true;
    call {:check_id "check_state_61"} {:sourceloc} {:sourceloc_num 161} _CHECK_WRITE_$$RB(true, BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v166$2, v164$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v166$1, v164$1);
    $$RB[BV32_ADD(2142720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v166$2, v164$2);
    havoc v167$1, v167$2;
    call {:sourceloc} {:sourceloc_num 163} _LOG_READ_$$RF(true, BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_62"} {:captureState "check_state_62"} {:sourceloc} {:sourceloc_num 163} true;
    call {:check_id "check_state_62"} {:sourceloc} {:sourceloc_num 163} _CHECK_READ_$$RF(true, BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v168$1 := $$RF[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v168$2 := $$RF[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v169$1 := FMUL32(v167$1, FMUL32(v27$1, FDIV32(1065353216bv32, v168$1)));
    v169$2 := FMUL32(v167$2, FMUL32(v27$2, FDIV32(1065353216bv32, v168$2)));
    call {:sourceloc_num 164} v170$1, v170$2 := $__log10_float((if FLT32(v169$1, 8388608bv32) then 8388608bv32 else v169$1), (if FLT32(v169$2, 8388608bv32) then 8388608bv32 else v169$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v171$1 := FADD32(FADD32(FMUL32(1042388563bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 1006834287bv32), 1069066811bv32))), FMUL32(1062705771bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 971785647bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3319205888bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v171$2 := FADD32(FADD32(FMUL32(1042388563bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 1006834287bv32), 1069066811bv32))), FMUL32(1062705771bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 971785647bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3319205888bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 165} v172$1, v172$2 := $__log10_float((if FLT32(v171$1, 8388608bv32) then 8388608bv32 else v171$1), (if FLT32(v171$2, 8388608bv32) then 8388608bv32 else v171$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v173$1 := FP64_CONV32(FSUB64(FP32_CONV64(v170$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v172$1)), 4600877379321698714bv64)));
    v173$2 := FP64_CONV32(FSUB64(FP32_CONV64(v170$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v172$2)), 4600877379321698714bv64)));
    v174$1 := FP64_CONV32(FMUL64(FP32_CONV64(v173$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v173$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v172$1)), 4604930618986332160bv64)))))));
    v174$2 := FP64_CONV32(FMUL64(FP32_CONV64(v173$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v173$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v172$2)), 4604930618986332160bv64)))))));
    v175$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v172$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v174$1, v174$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v169$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v169$1))))));
    v175$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v172$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v174$2, v174$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v169$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v169$2))))));
    call {:sourceloc} {:sourceloc_num 166} _LOG_READ_$$RF(true, BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_63"} {:captureState "check_state_63"} {:sourceloc} {:sourceloc_num 166} true;
    call {:check_id "check_state_63"} {:sourceloc} {:sourceloc_num 166} _CHECK_READ_$$RF(true, BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v176$1 := $$RF[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v176$2 := $$RF[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 167} _LOG_WRITE_$$RF(true, BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v176$1, v175$1), $$RF[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_64"} {:captureState "check_state_64"} {:sourceloc} {:sourceloc_num 167} true;
    call {:check_id "check_state_64"} {:sourceloc} {:sourceloc_num 167} _CHECK_WRITE_$$RF(true, BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v176$2, v175$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v176$1, v175$1);
    $$RF[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v176$2, v175$2);
    call {:sourceloc} {:sourceloc_num 168} _LOG_READ_$$RB(true, BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_65"} {:captureState "check_state_65"} {:sourceloc} {:sourceloc_num 168} true;
    call {:check_id "check_state_65"} {:sourceloc} {:sourceloc_num 168} _CHECK_READ_$$RB(true, BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v177$1 := $$RB[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v177$2 := $$RB[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 169} _LOG_WRITE_$$RB(true, BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v177$1, v175$1), $$RB[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_66"} {:captureState "check_state_66"} {:sourceloc} {:sourceloc_num 169} true;
    call {:check_id "check_state_66"} {:sourceloc} {:sourceloc_num 169} _CHECK_WRITE_$$RB(true, BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v177$2, v175$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v177$1, v175$1);
    $$RB[BV32_ADD(2336256bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v177$2, v175$2);
    havoc v178$1, v178$2;
    call {:sourceloc} {:sourceloc_num 171} _LOG_READ_$$RF(true, BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_67"} {:captureState "check_state_67"} {:sourceloc} {:sourceloc_num 171} true;
    call {:check_id "check_state_67"} {:sourceloc} {:sourceloc_num 171} _CHECK_READ_$$RF(true, BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v179$1 := $$RF[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v179$2 := $$RF[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v180$1 := FMUL32(v178$1, FMUL32(v27$1, FDIV32(1065353216bv32, v179$1)));
    v180$2 := FMUL32(v178$2, FMUL32(v27$2, FDIV32(1065353216bv32, v179$2)));
    call {:sourceloc_num 172} v181$1, v181$2 := $__log10_float((if FLT32(v180$1, 8388608bv32) then 8388608bv32 else v180$1), (if FLT32(v180$2, 8388608bv32) then 8388608bv32 else v180$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v182$1 := FP64_CONV32(FADD64(FADD64(FMUL64(4581421828931458171bv64, FP32_CONV64(FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 980356407bv32), 1069066811bv32)))), FP32_CONV64(FMUL32(1065017672bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 980356407bv32), 1069066811bv32))))), FP32_CONV64(FEXP32(FMUL32(FMUL32(3319159808bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)))));
    v182$2 := FP64_CONV32(FADD64(FADD64(FMUL64(4581421828931458171bv64, FP32_CONV64(FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 980356407bv32), 1069066811bv32)))), FP32_CONV64(FMUL32(1065017672bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 980356407bv32), 1069066811bv32))))), FP32_CONV64(FEXP32(FMUL32(FMUL32(3319159808bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)))));
    call {:sourceloc_num 173} v183$1, v183$2 := $__log10_float((if FLT32(v182$1, 8388608bv32) then 8388608bv32 else v182$1), (if FLT32(v182$2, 8388608bv32) then 8388608bv32 else v182$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v184$1 := FP64_CONV32(FSUB64(FP32_CONV64(v181$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v183$1)), 4600877379321698714bv64)));
    v184$2 := FP64_CONV32(FSUB64(FP32_CONV64(v181$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v183$2)), 4600877379321698714bv64)));
    v185$1 := FP64_CONV32(FMUL64(FP32_CONV64(v184$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v184$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v183$1)), 4604930618986332160bv64)))))));
    v185$2 := FP64_CONV32(FMUL64(FP32_CONV64(v184$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v184$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v183$2)), 4604930618986332160bv64)))))));
    v186$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v183$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v185$1, v185$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v180$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v180$1))))));
    v186$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v183$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v185$2, v185$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v180$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v180$2))))));
    call {:sourceloc} {:sourceloc_num 174} _LOG_READ_$$RF(true, BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_68"} {:captureState "check_state_68"} {:sourceloc} {:sourceloc_num 174} true;
    call {:check_id "check_state_68"} {:sourceloc} {:sourceloc_num 174} _CHECK_READ_$$RF(true, BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v187$1 := $$RF[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v187$2 := $$RF[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 175} _LOG_WRITE_$$RF(true, BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v187$1, v186$1), $$RF[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_69"} {:captureState "check_state_69"} {:sourceloc} {:sourceloc_num 175} true;
    call {:check_id "check_state_69"} {:sourceloc} {:sourceloc_num 175} _CHECK_WRITE_$$RF(true, BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v187$2, v186$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v187$1, v186$1);
    $$RF[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v187$2, v186$2);
    call {:sourceloc} {:sourceloc_num 176} _LOG_READ_$$RB(true, BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_70"} {:captureState "check_state_70"} {:sourceloc} {:sourceloc_num 176} true;
    call {:check_id "check_state_70"} {:sourceloc} {:sourceloc_num 176} _CHECK_READ_$$RB(true, BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v188$1 := $$RB[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v188$2 := $$RB[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 177} _LOG_WRITE_$$RB(true, BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v188$1, v186$1), $$RB[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_71"} {:captureState "check_state_71"} {:sourceloc} {:sourceloc_num 177} true;
    call {:check_id "check_state_71"} {:sourceloc} {:sourceloc_num 177} _CHECK_WRITE_$$RB(true, BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v188$2, v186$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v188$1, v186$1);
    $$RB[BV32_ADD(2543616bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v188$2, v186$2);
    havoc v189$1, v189$2;
    call {:sourceloc} {:sourceloc_num 179} _LOG_READ_$$RF(true, BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_72"} {:captureState "check_state_72"} {:sourceloc} {:sourceloc_num 179} true;
    call {:check_id "check_state_72"} {:sourceloc} {:sourceloc_num 179} _CHECK_READ_$$RF(true, BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v190$1 := $$RF[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v190$2 := $$RF[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v191$1 := FMUL32(v189$1, FMUL32(FP64_CONV32(FADD64(FADD64(FADD64(FADD64(FADD64(FMUL64(4617315517961601024bv64, FP32_CONV64(v57$1)), FP32_CONV64(FADD32($CTOT.0$1, v56$1))), FP32_CONV64(v58$1)), FMUL64(4602678819172646912bv64, FP32_CONV64(v59$1))), FP32_CONV64(v60$1)), FMUL64(4611686018427387904bv64, FP32_CONV64(v61$1)))), FDIV32(1065353216bv32, v190$1)));
    v191$2 := FMUL32(v189$2, FMUL32(FP64_CONV32(FADD64(FADD64(FADD64(FADD64(FADD64(FMUL64(4617315517961601024bv64, FP32_CONV64(v57$2)), FP32_CONV64(FADD32($CTOT.0$2, v56$2))), FP32_CONV64(v58$2)), FMUL64(4602678819172646912bv64, FP32_CONV64(v59$2))), FP32_CONV64(v60$2)), FMUL64(4611686018427387904bv64, FP32_CONV64(v61$2)))), FDIV32(1065353216bv32, v190$2)));
    call {:sourceloc_num 180} v192$1, v192$2 := $__log10_float((if FLT32(v191$1, 8388608bv32) then 8388608bv32 else v191$1), (if FLT32(v191$2, 8388608bv32) then 8388608bv32 else v191$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v193$1 := FP64_CONV32(FADD64(FADD64(FMUL64(0bv64, FP32_CONV64(FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 981668463bv32), 1069066811bv32)))), FMUL64(4607182418800017408bv64, FP32_CONV64(FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 977804324bv32), 1069066811bv32))))), FP32_CONV64(FEXP32(FMUL32(FMUL32(3342590208bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)))));
    v193$2 := FP64_CONV32(FADD64(FADD64(FMUL64(0bv64, FP32_CONV64(FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 981668463bv32), 1069066811bv32)))), FMUL64(4607182418800017408bv64, FP32_CONV64(FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 977804324bv32), 1069066811bv32))))), FP32_CONV64(FEXP32(FMUL32(FMUL32(3342590208bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)))));
    call {:sourceloc_num 181} v194$1, v194$2 := $__log10_float((if FLT32(v193$1, 8388608bv32) then 8388608bv32 else v193$1), (if FLT32(v193$2, 8388608bv32) then 8388608bv32 else v193$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v195$1 := FP64_CONV32(FSUB64(FP32_CONV64(v192$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v194$1)), 4600877379321698714bv64)));
    v195$2 := FP64_CONV32(FSUB64(FP32_CONV64(v192$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v194$2)), 4600877379321698714bv64)));
    v196$1 := FP64_CONV32(FMUL64(FP32_CONV64(v195$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v195$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v194$1)), 4604930618986332160bv64)))))));
    v196$2 := FP64_CONV32(FMUL64(FP32_CONV64(v195$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v195$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v194$2)), 4604930618986332160bv64)))))));
    v197$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v194$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v196$1, v196$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v191$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v191$1))))));
    v197$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v194$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v196$2, v196$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v191$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v191$2))))));
    call {:sourceloc} {:sourceloc_num 182} _LOG_READ_$$RF(true, BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_73"} {:captureState "check_state_73"} {:sourceloc} {:sourceloc_num 182} true;
    call {:check_id "check_state_73"} {:sourceloc} {:sourceloc_num 182} _CHECK_READ_$$RF(true, BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v198$1 := $$RF[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v198$2 := $$RF[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 183} _LOG_WRITE_$$RF(true, BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v198$1, v197$1), $$RF[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_74"} {:captureState "check_state_74"} {:sourceloc} {:sourceloc_num 183} true;
    call {:check_id "check_state_74"} {:sourceloc} {:sourceloc_num 183} _CHECK_WRITE_$$RF(true, BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v198$2, v197$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v198$1, v197$1);
    $$RF[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v198$2, v197$2);
    call {:sourceloc} {:sourceloc_num 184} _LOG_READ_$$RB(true, BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_75"} {:captureState "check_state_75"} {:sourceloc} {:sourceloc_num 184} true;
    call {:check_id "check_state_75"} {:sourceloc} {:sourceloc_num 184} _CHECK_READ_$$RB(true, BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v199$1 := $$RB[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v199$2 := $$RB[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 185} _LOG_WRITE_$$RB(true, BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v199$1, v197$1), $$RB[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_76"} {:captureState "check_state_76"} {:sourceloc} {:sourceloc_num 185} true;
    call {:check_id "check_state_76"} {:sourceloc} {:sourceloc_num 185} _CHECK_WRITE_$$RB(true, BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v199$2, v197$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v199$1, v197$1);
    $$RB[BV32_ADD(2612736bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v199$2, v197$2);
    return;

  $truebb:
    assume {:partition} v2 && v2;
    havoc v3$1, v3$2;
    $CTOT.0$1, $k.0 := FADD32($CTOT.0$1, v3$1), BV32_ADD($k.0, 1bv32);
    $CTOT.0$2 := FADD32($CTOT.0$2, v3$2);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



procedure {:source_name "__log10_float"} $__log10_float($0$1: bv32, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 108bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$T: bv32;

procedure {:inline 1} _LOG_READ_$$T(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$T;



implementation {:inline 1} _LOG_READ_$$T(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$T := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T == _value then true else _READ_HAS_OCCURRED_$$T);
    return;
}



procedure _CHECK_READ_$$T(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "T"} {:array "$$T"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$T);
  requires {:source_name "T"} {:array "$$T"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$T: bool;

procedure {:inline 1} _LOG_WRITE_$$T(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$T, _WRITE_READ_BENIGN_FLAG_$$T;



implementation {:inline 1} _LOG_WRITE_$$T(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$T := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T == _value then true else _WRITE_HAS_OCCURRED_$$T);
    _WRITE_READ_BENIGN_FLAG_$$T := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$T);
    return;
}



procedure _CHECK_WRITE_$$T(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "T"} {:array "$$T"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T != _value);
  requires {:source_name "T"} {:array "$$T"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T != _value);
  requires {:source_name "T"} {:array "$$T"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$T(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$T;



implementation {:inline 1} _LOG_ATOMIC_$$T(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$T := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$T);
    return;
}



procedure _CHECK_ATOMIC_$$T(_P: bool, _offset: bv32);
  requires {:source_name "T"} {:array "$$T"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset);
  requires {:source_name "T"} {:array "$$T"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$T(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$T;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$T(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$T := (if _P && _WRITE_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$T);
    return;
}



const _WATCHED_VALUE_$$C: bv32;

procedure {:inline 1} _LOG_READ_$$C(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$C;



implementation {:inline 1} _LOG_READ_$$C(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C == _value then true else _READ_HAS_OCCURRED_$$C);
    return;
}



procedure _CHECK_READ_$$C(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "C"} {:array "$$C"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$C);
  requires {:source_name "C"} {:array "$$C"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$C: bool;

procedure {:inline 1} _LOG_WRITE_$$C(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$C, _WRITE_READ_BENIGN_FLAG_$$C;



implementation {:inline 1} _LOG_WRITE_$$C(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C == _value then true else _WRITE_HAS_OCCURRED_$$C);
    _WRITE_READ_BENIGN_FLAG_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$C);
    return;
}



procedure _CHECK_WRITE_$$C(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "C"} {:array "$$C"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C != _value);
  requires {:source_name "C"} {:array "$$C"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C != _value);
  requires {:source_name "C"} {:array "$$C"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$C(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$C;



implementation {:inline 1} _LOG_ATOMIC_$$C(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$C);
    return;
}



procedure _CHECK_ATOMIC_$$C(_P: bool, _offset: bv32);
  requires {:source_name "C"} {:array "$$C"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);
  requires {:source_name "C"} {:array "$$C"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$C;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$C := (if _P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$C);
    return;
}



const _WATCHED_VALUE_$$RF: bv32;

procedure {:inline 1} _LOG_READ_$$RF(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$RF;



implementation {:inline 1} _LOG_READ_$$RF(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$RF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RF == _value then true else _READ_HAS_OCCURRED_$$RF);
    return;
}



procedure _CHECK_READ_$$RF(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "RF"} {:array "$$RF"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$RF && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$RF);
  requires {:source_name "RF"} {:array "$$RF"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$RF && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$RF: bool;

procedure {:inline 1} _LOG_WRITE_$$RF(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$RF, _WRITE_READ_BENIGN_FLAG_$$RF;



implementation {:inline 1} _LOG_WRITE_$$RF(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$RF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RF == _value then true else _WRITE_HAS_OCCURRED_$$RF);
    _WRITE_READ_BENIGN_FLAG_$$RF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RF == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$RF);
    return;
}



procedure _CHECK_WRITE_$$RF(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "RF"} {:array "$$RF"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$RF && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RF != _value);
  requires {:source_name "RF"} {:array "$$RF"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$RF && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RF != _value);
  requires {:source_name "RF"} {:array "$$RF"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$RF && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$RF(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$RF;



implementation {:inline 1} _LOG_ATOMIC_$$RF(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$RF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$RF);
    return;
}



procedure _CHECK_ATOMIC_$$RF(_P: bool, _offset: bv32);
  requires {:source_name "RF"} {:array "$$RF"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$RF && _WATCHED_OFFSET == _offset);
  requires {:source_name "RF"} {:array "$$RF"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$RF && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$RF;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$RF := (if _P && _WRITE_HAS_OCCURRED_$$RF && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$RF);
    return;
}



const _WATCHED_VALUE_$$RB: bv32;

procedure {:inline 1} _LOG_READ_$$RB(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$RB;



implementation {:inline 1} _LOG_READ_$$RB(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$RB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RB == _value then true else _READ_HAS_OCCURRED_$$RB);
    return;
}



procedure _CHECK_READ_$$RB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "RB"} {:array "$$RB"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$RB && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$RB);
  requires {:source_name "RB"} {:array "$$RB"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$RB && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$RB: bool;

procedure {:inline 1} _LOG_WRITE_$$RB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$RB, _WRITE_READ_BENIGN_FLAG_$$RB;



implementation {:inline 1} _LOG_WRITE_$$RB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$RB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RB == _value then true else _WRITE_HAS_OCCURRED_$$RB);
    _WRITE_READ_BENIGN_FLAG_$$RB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RB == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$RB);
    return;
}



procedure _CHECK_WRITE_$$RB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "RB"} {:array "$$RB"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$RB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RB != _value);
  requires {:source_name "RB"} {:array "$$RB"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$RB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RB != _value);
  requires {:source_name "RB"} {:array "$$RB"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$RB && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$RB(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$RB;



implementation {:inline 1} _LOG_ATOMIC_$$RB(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$RB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$RB);
    return;
}



procedure _CHECK_ATOMIC_$$RB(_P: bool, _offset: bv32);
  requires {:source_name "RB"} {:array "$$RB"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$RB && _WATCHED_OFFSET == _offset);
  requires {:source_name "RB"} {:array "$$RB"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$RB && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$RB;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$RB := (if _P && _WRITE_HAS_OCCURRED_$$RB && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$RB);
    return;
}



const _WATCHED_VALUE_$$RKLOW: bv32;

procedure {:inline 1} _LOG_READ_$$RKLOW(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$RKLOW;



implementation {:inline 1} _LOG_READ_$$RKLOW(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$RKLOW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKLOW == _value then true else _READ_HAS_OCCURRED_$$RKLOW);
    return;
}



procedure _CHECK_READ_$$RKLOW(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "RKLOW"} {:array "$$RKLOW"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$RKLOW);
  requires {:source_name "RKLOW"} {:array "$$RKLOW"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$RKLOW: bool;

procedure {:inline 1} _LOG_WRITE_$$RKLOW(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$RKLOW, _WRITE_READ_BENIGN_FLAG_$$RKLOW;



implementation {:inline 1} _LOG_WRITE_$$RKLOW(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$RKLOW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKLOW == _value then true else _WRITE_HAS_OCCURRED_$$RKLOW);
    _WRITE_READ_BENIGN_FLAG_$$RKLOW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKLOW == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$RKLOW);
    return;
}



procedure _CHECK_WRITE_$$RKLOW(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "RKLOW"} {:array "$$RKLOW"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKLOW != _value);
  requires {:source_name "RKLOW"} {:array "$$RKLOW"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKLOW != _value);
  requires {:source_name "RKLOW"} {:array "$$RKLOW"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$RKLOW(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$RKLOW;



implementation {:inline 1} _LOG_ATOMIC_$$RKLOW(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$RKLOW := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$RKLOW);
    return;
}



procedure _CHECK_ATOMIC_$$RKLOW(_P: bool, _offset: bv32);
  requires {:source_name "RKLOW"} {:array "$$RKLOW"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset);
  requires {:source_name "RKLOW"} {:array "$$RKLOW"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$RKLOW;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKLOW(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$RKLOW := (if _P && _WRITE_HAS_OCCURRED_$$RKLOW && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$RKLOW);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
