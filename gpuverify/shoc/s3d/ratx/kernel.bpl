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

procedure {:source_name "ratx_kernel"} {:kernel} $ratx_kernel($TCONV: bv32);
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



implementation {:source_name "ratx_kernel"} {:kernel} $ratx_kernel($TCONV: bv32)
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
  var v81$1: bv32;
  var v81$2: bv32;
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
  var v29$1: bv32;
  var v29$2: bv32;
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
  var v56$1: bv32;
  var v56$2: bv32;
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
  var v109$1: bv32;
  var v109$2: bv32;
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
  var v104$1: bv32;
  var v104$2: bv32;
  var v105$1: bv32;
  var v105$2: bv32;
  var v106$1: bv32;
  var v106$2: bv32;
  var v107$1: bv32;
  var v107$2: bv32;
  var v108$1: bv32;
  var v108$2: bv32;
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
  var v119$1: bv32;
  var v119$2: bv32;
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
    assume {:invGenSkippedLoop} true;
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
    havoc v11$1, v11$2;
    v12$1 := FP64_CONV32(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FMUL64(4617315517961601024bv64, FP32_CONV64(v5$1)), FP32_CONV64(FADD32($CTOT.0$1, v4$1))), FP32_CONV64(v6$1)), FMUL64(4602678819172646912bv64, FP32_CONV64(v7$1))), FP32_CONV64(v8$1)), FMUL64(4611686018427387904bv64, FP32_CONV64(v9$1))), FMUL64(4611686018427387904bv64, FP32_CONV64(v10$1))), FMUL64(4611686018427387904bv64, FP32_CONV64(v11$1))));
    v12$2 := FP64_CONV32(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FMUL64(4617315517961601024bv64, FP32_CONV64(v5$2)), FP32_CONV64(FADD32($CTOT.0$2, v4$2))), FP32_CONV64(v6$2)), FMUL64(4602678819172646912bv64, FP32_CONV64(v7$2))), FP32_CONV64(v8$2)), FMUL64(4611686018427387904bv64, FP32_CONV64(v9$2))), FMUL64(4611686018427387904bv64, FP32_CONV64(v10$2))), FMUL64(4611686018427387904bv64, FP32_CONV64(v11$2))));
    havoc v13$1, v13$2;
    havoc v14$1, v14$2;
    havoc v15$1, v15$2;
    havoc v16$1, v16$2;
    havoc v17$1, v17$2;
    havoc v18$1, v18$2;
    havoc v19$1, v19$2;
    havoc v20$1, v20$2;
    havoc v21$1, v21$2;
    havoc v22$1, v22$2;
    havoc v23$1, v23$2;
    havoc v24$1, v24$2;
    havoc v25$1, v25$2;
    havoc v26$1, v26$2;
    havoc v27$1, v27$2;
    havoc v28$1, v28$2;
    havoc v29$1, v29$2;
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$RF(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$RF(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v30$1 := $$RF[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v30$2 := $$RF[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v31$1 := FMUL32(v29$1, FMUL32(FP64_CONV32(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FMUL64(4617315517961601024bv64, FP32_CONV64(v22$1)), FP32_CONV64(FADD32($CTOT.0$1, v21$1))), FP32_CONV64(v23$1)), FMUL64(4602678819172646912bv64, FP32_CONV64(v24$1))), FP32_CONV64(v25$1)), FMUL64(4611686018427387904bv64, FP32_CONV64(v26$1))), FMUL64(4611686018427387904bv64, FP32_CONV64(v27$1))), FMUL64(4611686018427387904bv64, FP32_CONV64(v28$1)))), FDIV32(1065353216bv32, v30$1)));
    v31$2 := FMUL32(v29$2, FMUL32(FP64_CONV32(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FMUL64(4617315517961601024bv64, FP32_CONV64(v22$2)), FP32_CONV64(FADD32($CTOT.0$2, v21$2))), FP32_CONV64(v23$2)), FMUL64(4602678819172646912bv64, FP32_CONV64(v24$2))), FP32_CONV64(v25$2)), FMUL64(4611686018427387904bv64, FP32_CONV64(v26$2))), FMUL64(4611686018427387904bv64, FP32_CONV64(v27$2))), FMUL64(4611686018427387904bv64, FP32_CONV64(v28$2)))), FDIV32(1065353216bv32, v30$2)));
    call {:sourceloc_num 33} v32$1, v32$2 := $__log10_float((if FLT32(v31$1, 8388608bv32) then 8388608bv32 else v31$1), (if FLT32(v31$2, 8388608bv32) then 8388608bv32 else v31$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v33$1 := FADD32(FADD32(FMUL32(1049092738bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 1009667137bv32), 1069066811bv32))), FMUL32(1060900543bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 974473445bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3315724288bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v33$2 := FADD32(FADD32(FMUL32(1049092738bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 1009667137bv32), 1069066811bv32))), FMUL32(1060900543bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 974473445bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3315724288bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 34} v34$1, v34$2 := $__log10_float((if FLT32(v33$1, 8388608bv32) then 8388608bv32 else v33$1), (if FLT32(v33$2, 8388608bv32) then 8388608bv32 else v33$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v35$1 := FP64_CONV32(FSUB64(FP32_CONV64(v32$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v34$1)), 4600877379321698714bv64)));
    v35$2 := FP64_CONV32(FSUB64(FP32_CONV64(v32$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v34$2)), 4600877379321698714bv64)));
    v36$1 := FP64_CONV32(FMUL64(FP32_CONV64(v35$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v35$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v34$1)), 4604930618986332160bv64)))))));
    v36$2 := FP64_CONV32(FMUL64(FP32_CONV64(v35$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v35$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v34$2)), 4604930618986332160bv64)))))));
    v37$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v34$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v36$1, v36$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v31$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v31$1))))));
    v37$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v34$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v36$2, v36$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v31$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v31$2))))));
    call {:sourceloc} {:sourceloc_num 35} _LOG_READ_$$RF(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 35} _CHECK_READ_$$RF(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v38$1 := $$RF[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v38$2 := $$RF[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$RF(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v38$1, v37$1), $$RF[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$RF(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v38$2, v37$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v38$1, v37$1);
    $$RF[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v38$2, v37$2);
    call {:sourceloc} {:sourceloc_num 37} _LOG_READ_$$RB(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 37} _CHECK_READ_$$RB(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v39$1 := $$RB[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v39$2 := $$RB[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 38} _LOG_WRITE_$$RB(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v39$1, v37$1), $$RB[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 38} _CHECK_WRITE_$$RB(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v39$2, v37$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v39$1, v37$1);
    $$RB[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v39$2, v37$2);
    havoc v40$1, v40$2;
    call {:sourceloc} {:sourceloc_num 40} _LOG_READ_$$RF(true, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 40} _CHECK_READ_$$RF(true, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v41$1 := $$RF[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v41$2 := $$RF[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v42$1 := FMUL32(v40$1, FMUL32(v12$1, FDIV32(1065353216bv32, v41$1)));
    v42$2 := FMUL32(v40$2, FMUL32(v12$2, FDIV32(1065353216bv32, v41$2)));
    call {:sourceloc_num 41} v43$1, v43$2 := $__log10_float((if FLT32(v42$1, 8388608bv32) then 8388608bv32 else v42$1), (if FLT32(v42$2, 8388608bv32) then 8388608bv32 else v42$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v44$1 := FADD32(FADD32(FMUL32(1032536982bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 1000756676bv32), 1069066811bv32))), FMUL32(1064212365bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 975845679bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3324047360bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v44$2 := FADD32(FADD32(FMUL32(1032536982bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 1000756676bv32), 1069066811bv32))), FMUL32(1064212365bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 975845679bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3324047360bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 42} v45$1, v45$2 := $__log10_float((if FLT32(v44$1, 8388608bv32) then 8388608bv32 else v44$1), (if FLT32(v44$2, 8388608bv32) then 8388608bv32 else v44$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v46$1 := FP64_CONV32(FSUB64(FP32_CONV64(v43$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v45$1)), 4600877379321698714bv64)));
    v46$2 := FP64_CONV32(FSUB64(FP32_CONV64(v43$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v45$2)), 4600877379321698714bv64)));
    v47$1 := FP64_CONV32(FMUL64(FP32_CONV64(v46$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v46$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v45$1)), 4604930618986332160bv64)))))));
    v47$2 := FP64_CONV32(FMUL64(FP32_CONV64(v46$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v46$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v45$2)), 4604930618986332160bv64)))))));
    v48$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v45$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v47$1, v47$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v42$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v42$1))))));
    v48$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v45$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v47$2, v47$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v42$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v42$2))))));
    call {:sourceloc} {:sourceloc_num 43} _LOG_READ_$$RF(true, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 43} _CHECK_READ_$$RF(true, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v49$1 := $$RF[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v49$2 := $$RF[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$RF(true, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v49$1, v48$1), $$RF[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$RF(true, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v49$2, v48$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v49$1, v48$1);
    $$RF[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v49$2, v48$2);
    call {:sourceloc} {:sourceloc_num 45} _LOG_READ_$$RB(true, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 45} _CHECK_READ_$$RB(true, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v50$1 := $$RB[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v50$2 := $$RB[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$RB(true, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v50$1, v48$1), $$RB[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$RB(true, BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v50$2, v48$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v50$1, v48$1);
    $$RB[BV32_ADD(414720bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v50$2, v48$2);
    havoc v51$1, v51$2;
    call {:sourceloc} {:sourceloc_num 48} _LOG_READ_$$RF(true, BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 48} _CHECK_READ_$$RF(true, BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v52$1 := $$RF[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v52$2 := $$RF[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v53$1 := FMUL32(v51$1, FMUL32(v12$1, FDIV32(1065353216bv32, v52$1)));
    v53$2 := FMUL32(v51$2, FMUL32(v12$2, FDIV32(1065353216bv32, v52$2)));
    call {:sourceloc_num 49} v54$1, v54$2 := $__log10_float((if FLT32(v53$1, 8388608bv32) then 8388608bv32 else v53$1), (if FLT32(v53$2, 8388608bv32) then 8388608bv32 else v53$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v55$1 := FADD32(FADD32(FMUL32(1054424537bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 998916856bv32), 1069066811bv32))), FMUL32(1058234643bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 975089357bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3315492864bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v55$2 := FADD32(FADD32(FMUL32(1054424537bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 998916856bv32), 1069066811bv32))), FMUL32(1058234643bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 975089357bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3315492864bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 50} v56$1, v56$2 := $__log10_float((if FLT32(v55$1, 8388608bv32) then 8388608bv32 else v55$1), (if FLT32(v55$2, 8388608bv32) then 8388608bv32 else v55$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v57$1 := FP64_CONV32(FSUB64(FP32_CONV64(v54$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v56$1)), 4600877379321698714bv64)));
    v57$2 := FP64_CONV32(FSUB64(FP32_CONV64(v54$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v56$2)), 4600877379321698714bv64)));
    v58$1 := FP64_CONV32(FMUL64(FP32_CONV64(v57$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v57$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v56$1)), 4604930618986332160bv64)))))));
    v58$2 := FP64_CONV32(FMUL64(FP32_CONV64(v57$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v57$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v56$2)), 4604930618986332160bv64)))))));
    v59$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v56$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v58$1, v58$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v53$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v53$1))))));
    v59$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v56$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v58$2, v58$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v53$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v53$2))))));
    call {:sourceloc} {:sourceloc_num 51} _LOG_READ_$$RF(true, BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 51} _CHECK_READ_$$RF(true, BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v60$1 := $$RF[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v60$2 := $$RF[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 52} _LOG_WRITE_$$RF(true, BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v60$1, v59$1), $$RF[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 52} _CHECK_WRITE_$$RF(true, BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v60$2, v59$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v60$1, v59$1);
    $$RF[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v60$2, v59$2);
    call {:sourceloc} {:sourceloc_num 53} _LOG_READ_$$RB(true, BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 53} _CHECK_READ_$$RB(true, BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v61$1 := $$RB[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v61$2 := $$RB[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 54} _LOG_WRITE_$$RB(true, BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v61$1, v59$1), $$RB[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 54} _CHECK_WRITE_$$RB(true, BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v61$2, v59$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v61$1, v59$1);
    $$RB[BV32_ADD(525312bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v61$2, v59$2);
    havoc v62$1, v62$2;
    call {:sourceloc} {:sourceloc_num 56} _LOG_READ_$$RF(true, BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 56} _CHECK_READ_$$RF(true, BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v63$1 := $$RF[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v63$2 := $$RF[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v64$1 := FMUL32(v62$1, FMUL32(v12$1, FDIV32(1065353216bv32, v63$1)));
    v64$2 := FMUL32(v62$2, FMUL32(v12$2, FDIV32(1065353216bv32, v63$2)));
    call {:sourceloc_num 57} v65$1, v65$2 := $__log10_float((if FLT32(v64$1, 8388608bv32) then 8388608bv32 else v64$1), (if FLT32(v64$2, 8388608bv32) then 8388608bv32 else v64$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v66$1 := FADD32(FADD32(FMUL32(1046401673bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 997315724bv32), 1069066811bv32))), FMUL32(1061702494bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 968773086bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3318566912bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v66$2 := FADD32(FADD32(FMUL32(1046401673bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 997315724bv32), 1069066811bv32))), FMUL32(1061702494bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 968773086bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3318566912bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 58} v67$1, v67$2 := $__log10_float((if FLT32(v66$1, 8388608bv32) then 8388608bv32 else v66$1), (if FLT32(v66$2, 8388608bv32) then 8388608bv32 else v66$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v68$1 := FP64_CONV32(FSUB64(FP32_CONV64(v65$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v67$1)), 4600877379321698714bv64)));
    v68$2 := FP64_CONV32(FSUB64(FP32_CONV64(v65$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v67$2)), 4600877379321698714bv64)));
    v69$1 := FP64_CONV32(FMUL64(FP32_CONV64(v68$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v68$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v67$1)), 4604930618986332160bv64)))))));
    v69$2 := FP64_CONV32(FMUL64(FP32_CONV64(v68$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v68$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v67$2)), 4604930618986332160bv64)))))));
    v70$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v67$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v69$1, v69$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v64$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v64$1))))));
    v70$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v67$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v69$2, v69$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v64$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v64$2))))));
    call {:sourceloc} {:sourceloc_num 59} _LOG_READ_$$RF(true, BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 59} _CHECK_READ_$$RF(true, BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v71$1 := $$RF[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v71$2 := $$RF[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 60} _LOG_WRITE_$$RF(true, BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v71$1, v70$1), $$RF[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 60} _CHECK_WRITE_$$RF(true, BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v71$2, v70$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v71$1, v70$1);
    $$RF[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v71$2, v70$2);
    call {:sourceloc} {:sourceloc_num 61} _LOG_READ_$$RB(true, BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 61} _CHECK_READ_$$RB(true, BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v72$1 := $$RB[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v72$2 := $$RB[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 62} _LOG_WRITE_$$RB(true, BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v72$1, v70$1), $$RB[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 62} _CHECK_WRITE_$$RB(true, BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v72$2, v70$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v72$1, v70$1);
    $$RB[BV32_ADD(552960bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v72$2, v70$2);
    havoc v73$1, v73$2;
    call {:sourceloc} {:sourceloc_num 64} _LOG_READ_$$RF(true, BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 64} _CHECK_READ_$$RF(true, BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v74$1 := $$RF[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v74$2 := $$RF[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v75$1 := FMUL32(v73$1, FMUL32(v12$1, FDIV32(1065353216bv32, v74$1)));
    v75$2 := FMUL32(v73$2, FMUL32(v12$2, FDIV32(1065353216bv32, v74$2)));
    call {:sourceloc_num 65} v76$1, v76$2 := $__log10_float((if FLT32(v75$1, 8388608bv32) then 8388608bv32 else v75$1), (if FLT32(v75$2, 8388608bv32) then 8388608bv32 else v75$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v77$1 := FADD32(FADD32(FMUL32(1050924810bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 1012010273bv32), 1069066811bv32))), FMUL32(1059984507bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 973301383bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3316559872bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v77$2 := FADD32(FADD32(FMUL32(1050924810bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 1012010273bv32), 1069066811bv32))), FMUL32(1059984507bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 973301383bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3316559872bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 66} v78$1, v78$2 := $__log10_float((if FLT32(v77$1, 8388608bv32) then 8388608bv32 else v77$1), (if FLT32(v77$2, 8388608bv32) then 8388608bv32 else v77$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v79$1 := FP64_CONV32(FSUB64(FP32_CONV64(v76$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v78$1)), 4600877379321698714bv64)));
    v79$2 := FP64_CONV32(FSUB64(FP32_CONV64(v76$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v78$2)), 4600877379321698714bv64)));
    v80$1 := FP64_CONV32(FMUL64(FP32_CONV64(v79$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v79$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v78$1)), 4604930618986332160bv64)))))));
    v80$2 := FP64_CONV32(FMUL64(FP32_CONV64(v79$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v79$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v78$2)), 4604930618986332160bv64)))))));
    v81$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v78$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v80$1, v80$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v75$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v75$1))))));
    v81$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v78$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v80$2, v80$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v75$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v75$2))))));
    call {:sourceloc} {:sourceloc_num 67} _LOG_READ_$$RF(true, BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 67} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 67} _CHECK_READ_$$RF(true, BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v82$1 := $$RF[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v82$2 := $$RF[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 68} _LOG_WRITE_$$RF(true, BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v82$1, v81$1), $$RF[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 68} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 68} _CHECK_WRITE_$$RF(true, BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v82$2, v81$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v82$1, v81$1);
    $$RF[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v82$2, v81$2);
    call {:sourceloc} {:sourceloc_num 69} _LOG_READ_$$RB(true, BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 69} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 69} _CHECK_READ_$$RB(true, BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v83$1 := $$RB[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v83$2 := $$RB[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 70} _LOG_WRITE_$$RB(true, BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v83$1, v81$1), $$RB[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 70} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 70} _CHECK_WRITE_$$RB(true, BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v83$2, v81$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v83$1, v81$1);
    $$RB[BV32_ADD(649728bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v83$2, v81$2);
    havoc v84$1, v84$2;
    call {:sourceloc} {:sourceloc_num 72} _LOG_READ_$$RF(true, BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 72} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 72} _CHECK_READ_$$RF(true, BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v85$1 := $$RF[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v85$2 := $$RF[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v86$1 := FMUL32(v84$1, FMUL32(v12$1, FDIV32(1065353216bv32, v85$1)));
    v86$2 := FMUL32(v84$2, FMUL32(v12$2, FDIV32(1065353216bv32, v85$2)));
    call {:sourceloc_num 73} v87$1, v87$2 := $__log10_float((if FLT32(v86$1, 8388608bv32) then 8388608bv32 else v86$1), (if FLT32(v86$2, 8388608bv32) then 8388608bv32 else v86$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v88$1 := FADD32(FADD32(FMUL32(1053921221bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 997085199bv32), 1069066811bv32))), FMUL32(1058486301bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 978702864bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3315730432bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v88$2 := FADD32(FADD32(FMUL32(1053921221bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 997085199bv32), 1069066811bv32))), FMUL32(1058486301bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 978702864bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3315730432bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 74} v89$1, v89$2 := $__log10_float((if FLT32(v88$1, 8388608bv32) then 8388608bv32 else v88$1), (if FLT32(v88$2, 8388608bv32) then 8388608bv32 else v88$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v90$1 := FP64_CONV32(FSUB64(FP32_CONV64(v87$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v89$1)), 4600877379321698714bv64)));
    v90$2 := FP64_CONV32(FSUB64(FP32_CONV64(v87$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v89$2)), 4600877379321698714bv64)));
    v91$1 := FP64_CONV32(FMUL64(FP32_CONV64(v90$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v90$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v89$1)), 4604930618986332160bv64)))))));
    v91$2 := FP64_CONV32(FMUL64(FP32_CONV64(v90$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v90$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v89$2)), 4604930618986332160bv64)))))));
    v92$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v89$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v91$1, v91$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v86$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v86$1))))));
    v92$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v89$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v91$2, v91$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v86$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v86$2))))));
    call {:sourceloc} {:sourceloc_num 75} _LOG_READ_$$RF(true, BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 75} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 75} _CHECK_READ_$$RF(true, BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v93$1 := $$RF[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v93$2 := $$RF[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 76} _LOG_WRITE_$$RF(true, BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v93$1, v92$1), $$RF[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 76} _CHECK_WRITE_$$RF(true, BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v93$2, v92$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v93$1, v92$1);
    $$RF[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v93$2, v92$2);
    call {:sourceloc} {:sourceloc_num 77} _LOG_READ_$$RB(true, BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 77} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 77} _CHECK_READ_$$RB(true, BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v94$1 := $$RB[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v94$2 := $$RB[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 78} _LOG_WRITE_$$RB(true, BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v94$1, v92$1), $$RB[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 78} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 78} _CHECK_WRITE_$$RB(true, BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v94$2, v92$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v94$1, v92$1);
    $$RB[BV32_ADD(760320bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v94$2, v92$2);
    havoc v95$1, v95$2;
    call {:sourceloc} {:sourceloc_num 80} _LOG_READ_$$RF(true, BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 80} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 80} _CHECK_READ_$$RF(true, BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v96$1 := $$RF[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v96$2 := $$RF[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v97$1 := FMUL32(v95$1, FMUL32(v12$1, FDIV32(1065353216bv32, v96$1)));
    v97$2 := FMUL32(v95$2, FMUL32(v12$2, FDIV32(1065353216bv32, v96$2)));
    call {:sourceloc_num 81} v98$1, v98$2 := $__log10_float((if FLT32(v97$1, 8388608bv32) then 8388608bv32 else v97$1), (if FLT32(v97$2, 8388608bv32) then 8388608bv32 else v97$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v99$1 := FADD32(FADD32(FMUL32(1048039129bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 1009667137bv32), 1069066811bv32))), FMUL32(1061293130bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 975738067bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3313713152bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v99$2 := FADD32(FADD32(FMUL32(1048039129bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 1009667137bv32), 1069066811bv32))), FMUL32(1061293130bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 975738067bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3313713152bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 82} v100$1, v100$2 := $__log10_float((if FLT32(v99$1, 8388608bv32) then 8388608bv32 else v99$1), (if FLT32(v99$2, 8388608bv32) then 8388608bv32 else v99$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v101$1 := FP64_CONV32(FSUB64(FP32_CONV64(v98$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v100$1)), 4600877379321698714bv64)));
    v101$2 := FP64_CONV32(FSUB64(FP32_CONV64(v98$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v100$2)), 4600877379321698714bv64)));
    v102$1 := FP64_CONV32(FMUL64(FP32_CONV64(v101$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v101$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v100$1)), 4604930618986332160bv64)))))));
    v102$2 := FP64_CONV32(FMUL64(FP32_CONV64(v101$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v101$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v100$2)), 4604930618986332160bv64)))))));
    v103$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v100$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v102$1, v102$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v97$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v97$1))))));
    v103$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v100$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v102$2, v102$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v97$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v97$2))))));
    call {:sourceloc} {:sourceloc_num 83} _LOG_READ_$$RF(true, BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 83} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 83} _CHECK_READ_$$RF(true, BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v104$1 := $$RF[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v104$2 := $$RF[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 84} _LOG_WRITE_$$RF(true, BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v104$1, v103$1), $$RF[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 84} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 84} _CHECK_WRITE_$$RF(true, BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v104$2, v103$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v104$1, v103$1);
    $$RF[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v104$2, v103$2);
    call {:sourceloc} {:sourceloc_num 85} _LOG_READ_$$RB(true, BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 85} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 85} _CHECK_READ_$$RB(true, BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v105$1 := $$RB[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v105$2 := $$RB[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 86} _LOG_WRITE_$$RB(true, BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v105$1, v103$1), $$RB[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 86} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 86} _CHECK_WRITE_$$RB(true, BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v105$2, v103$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v105$1, v103$1);
    $$RB[BV32_ADD(967680bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v105$2, v103$2);
    havoc v106$1, v106$2;
    call {:sourceloc} {:sourceloc_num 88} _LOG_READ_$$RF(true, BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 88} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 88} _CHECK_READ_$$RF(true, BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v107$1 := $$RF[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v107$2 := $$RF[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v108$1 := FMUL32(v106$1, FMUL32(v12$1, FDIV32(1065353216bv32, v107$1)));
    v108$2 := FMUL32(v106$2, FMUL32(v12$2, FDIV32(1065353216bv32, v107$2)));
    call {:sourceloc_num 89} v109$1, v109$2 := $__log10_float((if FLT32(v108$1, 8388608bv32) then 8388608bv32 else v108$1), (if FLT32(v108$2, 8388608bv32) then 8388608bv32 else v108$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v110$1 := FADD32(FADD32(FMUL32(1046361407bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 1012754377bv32), 1069066811bv32))), FMUL32(1061712560bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 967984324bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3319373824bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v110$2 := FADD32(FADD32(FMUL32(1046361407bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 1012754377bv32), 1069066811bv32))), FMUL32(1061712560bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 967984324bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3319373824bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 90} v111$1, v111$2 := $__log10_float((if FLT32(v110$1, 8388608bv32) then 8388608bv32 else v110$1), (if FLT32(v110$2, 8388608bv32) then 8388608bv32 else v110$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v112$1 := FP64_CONV32(FSUB64(FP32_CONV64(v109$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v111$1)), 4600877379321698714bv64)));
    v112$2 := FP64_CONV32(FSUB64(FP32_CONV64(v109$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v111$2)), 4600877379321698714bv64)));
    v113$1 := FP64_CONV32(FMUL64(FP32_CONV64(v112$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v112$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v111$1)), 4604930618986332160bv64)))))));
    v113$2 := FP64_CONV32(FMUL64(FP32_CONV64(v112$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v112$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v111$2)), 4604930618986332160bv64)))))));
    v114$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v111$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v113$1, v113$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v108$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v108$1))))));
    v114$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v111$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v113$2, v113$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v108$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v108$2))))));
    call {:sourceloc} {:sourceloc_num 91} _LOG_READ_$$RF(true, BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 91} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 91} _CHECK_READ_$$RF(true, BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v115$1 := $$RF[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v115$2 := $$RF[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 92} _LOG_WRITE_$$RF(true, BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v115$1, v114$1), $$RF[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 92} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 92} _CHECK_WRITE_$$RF(true, BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v115$2, v114$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v115$1, v114$1);
    $$RF[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v115$2, v114$2);
    call {:sourceloc} {:sourceloc_num 93} _LOG_READ_$$RB(true, BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 93} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 93} _CHECK_READ_$$RB(true, BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v116$1 := $$RB[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v116$2 := $$RB[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 94} _LOG_WRITE_$$RB(true, BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v116$1, v114$1), $$RB[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 94} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 94} _CHECK_WRITE_$$RB(true, BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v116$2, v114$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v116$1, v114$1);
    $$RB[BV32_ADD(1064448bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v116$2, v114$2);
    havoc v117$1, v117$2;
    call {:sourceloc} {:sourceloc_num 96} _LOG_READ_$$RF(true, BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 96} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 96} _CHECK_READ_$$RF(true, BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v118$1 := $$RF[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v118$2 := $$RF[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v119$1 := FMUL32(v117$1, FMUL32(v12$1, FDIV32(1065353216bv32, v118$1)));
    v119$2 := FMUL32(v117$2, FMUL32(v12$2, FDIV32(1065353216bv32, v118$2)));
    call {:sourceloc_num 97} v120$1, v120$2 := $__log10_float((if FLT32(v119$1, 8388608bv32) then 8388608bv32 else v119$1), (if FLT32(v119$2, 8388608bv32) then 8388608bv32 else v119$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v121$1 := FADD32(FADD32(FMUL32(1053028673bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 1033674609bv32), 1069066811bv32))), FMUL32(1058932575bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 972836316bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3315542016bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v121$2 := FADD32(FADD32(FMUL32(1053028673bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 1033674609bv32), 1069066811bv32))), FMUL32(1058932575bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 972836316bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3315542016bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 98} v122$1, v122$2 := $__log10_float((if FLT32(v121$1, 8388608bv32) then 8388608bv32 else v121$1), (if FLT32(v121$2, 8388608bv32) then 8388608bv32 else v121$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v123$1 := FP64_CONV32(FSUB64(FP32_CONV64(v120$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v122$1)), 4600877379321698714bv64)));
    v123$2 := FP64_CONV32(FSUB64(FP32_CONV64(v120$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v122$2)), 4600877379321698714bv64)));
    v124$1 := FP64_CONV32(FMUL64(FP32_CONV64(v123$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v123$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v122$1)), 4604930618986332160bv64)))))));
    v124$2 := FP64_CONV32(FMUL64(FP32_CONV64(v123$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v123$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v122$2)), 4604930618986332160bv64)))))));
    v125$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v122$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v124$1, v124$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v119$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v119$1))))));
    v125$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v122$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v124$2, v124$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v119$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v119$2))))));
    call {:sourceloc} {:sourceloc_num 99} _LOG_READ_$$RF(true, BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 99} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 99} _CHECK_READ_$$RF(true, BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v126$1 := $$RF[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v126$2 := $$RF[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 100} _LOG_WRITE_$$RF(true, BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v126$1, v125$1), $$RF[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 100} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 100} _CHECK_WRITE_$$RF(true, BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v126$2, v125$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v126$1, v125$1);
    $$RF[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v126$2, v125$2);
    call {:sourceloc} {:sourceloc_num 101} _LOG_READ_$$RB(true, BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 101} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 101} _CHECK_READ_$$RB(true, BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v127$1 := $$RB[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v127$2 := $$RB[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 102} _LOG_WRITE_$$RB(true, BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v127$1, v125$1), $$RB[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 102} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 102} _CHECK_WRITE_$$RB(true, BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v127$2, v125$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v127$1, v125$1);
    $$RB[BV32_ADD(1216512bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v127$2, v125$2);
    havoc v128$1, v128$2;
    call {:sourceloc} {:sourceloc_num 104} _LOG_READ_$$RF(true, BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 104} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 104} _CHECK_READ_$$RF(true, BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v129$1 := $$RF[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v129$2 := $$RF[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v130$1 := FMUL32(v128$1, FMUL32(v12$1, FDIV32(1065353216bv32, v129$1)));
    v130$2 := FMUL32(v128$2, FMUL32(v12$2, FDIV32(1065353216bv32, v129$2)));
    call {:sourceloc_num 105} v131$1, v131$2 := $__log10_float((if FLT32(v130$1, 8388608bv32) then 8388608bv32 else v130$1), (if FLT32(v130$2, 8388608bv32) then 8388608bv32 else v130$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v132$1 := FADD32(FADD32(FMUL32(1055874089bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 1004077490bv32), 1069066811bv32))), FMUL32(1057509868bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 981240854bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3315290112bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v132$2 := FADD32(FADD32(FMUL32(1055874089bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 1004077490bv32), 1069066811bv32))), FMUL32(1057509868bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 981240854bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(3315290112bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 106} v133$1, v133$2 := $__log10_float((if FLT32(v132$1, 8388608bv32) then 8388608bv32 else v132$1), (if FLT32(v132$2, 8388608bv32) then 8388608bv32 else v132$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v134$1 := FP64_CONV32(FSUB64(FP32_CONV64(v131$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v133$1)), 4600877379321698714bv64)));
    v134$2 := FP64_CONV32(FSUB64(FP32_CONV64(v131$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v133$2)), 4600877379321698714bv64)));
    v135$1 := FP64_CONV32(FMUL64(FP32_CONV64(v134$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v134$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v133$1)), 4604930618986332160bv64)))))));
    v135$2 := FP64_CONV32(FMUL64(FP32_CONV64(v134$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v134$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v133$2)), 4604930618986332160bv64)))))));
    v136$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v133$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v135$1, v135$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v130$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v130$1))))));
    v136$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v133$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v135$2, v135$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v130$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v130$2))))));
    call {:sourceloc} {:sourceloc_num 107} _LOG_READ_$$RF(true, BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 107} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 107} _CHECK_READ_$$RF(true, BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v137$1 := $$RF[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v137$2 := $$RF[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 108} _LOG_WRITE_$$RF(true, BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v137$1, v136$1), $$RF[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 108} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 108} _CHECK_WRITE_$$RF(true, BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v137$2, v136$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v137$1, v136$1);
    $$RF[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v137$2, v136$2);
    call {:sourceloc} {:sourceloc_num 109} _LOG_READ_$$RB(true, BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 109} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 109} _CHECK_READ_$$RB(true, BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v138$1 := $$RB[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v138$2 := $$RB[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 110} _LOG_WRITE_$$RB(true, BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v138$1, v136$1), $$RB[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 110} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 110} _CHECK_WRITE_$$RB(true, BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v138$2, v136$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v138$1, v136$1);
    $$RB[BV32_ADD(1271808bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v138$2, v136$2);
    havoc v139$1, v139$2;
    call {:sourceloc} {:sourceloc_num 112} _LOG_READ_$$RF(true, BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 112} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 112} _CHECK_READ_$$RF(true, BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v140$1 := $$RF[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v140$2 := $$RF[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v141$1 := FMUL32(v139$1, FMUL32(FP64_CONV32(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FMUL64(4617315517961601024bv64, FP32_CONV64(v14$1)), FP32_CONV64(FADD32($CTOT.0$1, v13$1))), FP32_CONV64(v15$1)), FMUL64(4602678819172646912bv64, FP32_CONV64(v16$1))), FP32_CONV64(v17$1)), FMUL64(4611686018427387904bv64, FP32_CONV64(v18$1))), FP32_CONV64(FMUL32(1069547520bv32, v19$1))), FP32_CONV64(FMUL32(1069547520bv32, v20$1)))), FDIV32(1065353216bv32, v140$1)));
    v141$2 := FMUL32(v139$2, FMUL32(FP64_CONV32(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FADD64(FMUL64(4617315517961601024bv64, FP32_CONV64(v14$2)), FP32_CONV64(FADD32($CTOT.0$2, v13$2))), FP32_CONV64(v15$2)), FMUL64(4602678819172646912bv64, FP32_CONV64(v16$2))), FP32_CONV64(v17$2)), FMUL64(4611686018427387904bv64, FP32_CONV64(v18$2))), FP32_CONV64(FMUL32(1069547520bv32, v19$2))), FP32_CONV64(FMUL32(1069547520bv32, v20$2)))), FDIV32(1065353216bv32, v140$2)));
    v142$1 := FP64_CONV32(FMUL64(FP32_CONV64(v141$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v141$1)))));
    v142$2 := FP64_CONV32(FMUL64(FP32_CONV64(v141$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v141$2)))));
    call {:sourceloc} {:sourceloc_num 113} _LOG_READ_$$RF(true, BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 113} true;
    call {:check_id "check_state_51"} {:sourceloc} {:sourceloc_num 113} _CHECK_READ_$$RF(true, BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v143$1 := $$RF[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v143$2 := $$RF[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 114} _LOG_WRITE_$$RF(true, BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v143$1, v142$1), $$RF[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 114} true;
    call {:check_id "check_state_52"} {:sourceloc} {:sourceloc_num 114} _CHECK_WRITE_$$RF(true, BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v143$2, v142$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v143$1, v142$1);
    $$RF[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v143$2, v142$2);
    call {:sourceloc} {:sourceloc_num 115} _LOG_READ_$$RB(true, BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 115} true;
    call {:check_id "check_state_53"} {:sourceloc} {:sourceloc_num 115} _CHECK_READ_$$RB(true, BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v144$1 := $$RB[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v144$2 := $$RB[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 116} _LOG_WRITE_$$RB(true, BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v144$1, v142$1), $$RB[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 116} true;
    call {:check_id "check_state_54"} {:sourceloc} {:sourceloc_num 116} _CHECK_WRITE_$$RB(true, BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v144$2, v142$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v144$1, v142$1);
    $$RB[BV32_ADD(1562112bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v144$2, v142$2);
    havoc v145$1, v145$2;
    call {:sourceloc} {:sourceloc_num 118} _LOG_READ_$$RF(true, BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 118} true;
    call {:check_id "check_state_55"} {:sourceloc} {:sourceloc_num 118} _CHECK_READ_$$RF(true, BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v146$1 := $$RF[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v146$2 := $$RF[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    v147$1 := FMUL32(v145$1, FMUL32(v12$1, FDIV32(1065353216bv32, v146$1)));
    v147$2 := FMUL32(v145$2, FMUL32(v12$2, FDIV32(1065353216bv32, v146$2)));
    call {:sourceloc_num 119} v148$1, v148$2 := $__log10_float((if FLT32(v147$1, 8388608bv32) then 8388608bv32 else v147$1), (if FLT32(v147$2, 8388608bv32) then 8388608bv32 else v147$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v149$1 := FADD32(FADD32(FMUL32(3212528163bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 960677062bv32), 1069066811bv32))), FMUL32(1073587474bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$1), 1047430216bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(1034080485bv32, FDIV32(1065353216bv32, v1$1)), 1069066811bv32)));
    v149$2 := FADD32(FADD32(FMUL32(3212528163bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 960677062bv32), 1069066811bv32))), FMUL32(1073587474bv32, FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v1$2), 1047430216bv32), 1069066811bv32)))), FEXP32(FMUL32(FMUL32(1034080485bv32, FDIV32(1065353216bv32, v1$2)), 1069066811bv32)));
    call {:sourceloc_num 120} v150$1, v150$2 := $__log10_float((if FLT32(v149$1, 8388608bv32) then 8388608bv32 else v149$1), (if FLT32(v149$2, 8388608bv32) then 8388608bv32 else v149$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v151$1 := FP64_CONV32(FSUB64(FP32_CONV64(v148$1), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v150$1)), 4600877379321698714bv64)));
    v151$2 := FP64_CONV32(FSUB64(FP32_CONV64(v148$2), FADD64(FMUL64(4604210043045952881bv64, FP32_CONV64(v150$2)), 4600877379321698714bv64)));
    v152$1 := FP64_CONV32(FMUL64(FP32_CONV64(v151$1), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v151$1)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v150$1)), 4604930618986332160bv64)))))));
    v152$2 := FP64_CONV32(FMUL64(FP32_CONV64(v151$2), FDIV64(4607182418800017408bv64, FADD64(FMUL64(13817584088727966188bv64, FP32_CONV64(v151$2)), FP32_CONV64(FP64_CONV32(FADD64(FMUL64(13831770427554183250bv64, FP32_CONV64(v150$2)), 4604930618986332160bv64)))))));
    v153$1 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v150$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v152$1, v152$1)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v147$1), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v147$1))))));
    v153$2 := FMUL32(FEXP32(FMUL32(FP64_CONV32(FMUL64(FP32_CONV64(v150$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v152$2, v152$2)))))), 1079286392bv32)), FP64_CONV32(FMUL64(FP32_CONV64(v147$2), FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FP32_CONV64(v147$2))))));
    call {:sourceloc} {:sourceloc_num 121} _LOG_READ_$$RF(true, BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RF[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_56"} {:captureState "check_state_56"} {:sourceloc} {:sourceloc_num 121} true;
    call {:check_id "check_state_56"} {:sourceloc} {:sourceloc_num 121} _CHECK_READ_$$RF(true, BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RF[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RF"} true;
    v154$1 := $$RF[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v154$2 := $$RF[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 122} _LOG_WRITE_$$RF(true, BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v154$1, v153$1), $$RF[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RF(true, BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_57"} {:captureState "check_state_57"} {:sourceloc} {:sourceloc_num 122} true;
    call {:check_id "check_state_57"} {:sourceloc} {:sourceloc_num 122} _CHECK_WRITE_$$RF(true, BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v154$2, v153$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RF"} true;
    $$RF[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v154$1, v153$1);
    $$RF[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v154$2, v153$2);
    call {:sourceloc} {:sourceloc_num 123} _LOG_READ_$$RB(true, BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$RB[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_58"} {:captureState "check_state_58"} {:sourceloc} {:sourceloc_num 123} true;
    call {:check_id "check_state_58"} {:sourceloc} {:sourceloc_num 123} _CHECK_READ_$$RB(true, BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$RB[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$RB"} true;
    v155$1 := $$RB[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v155$2 := $$RB[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 124} _LOG_WRITE_$$RB(true, BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v155$1, v153$1), $$RB[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_59"} {:captureState "check_state_59"} {:sourceloc} {:sourceloc_num 124} true;
    call {:check_id "check_state_59"} {:sourceloc} {:sourceloc_num 124} _CHECK_WRITE_$$RB(true, BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v155$2, v153$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v155$1, v153$1);
    $$RB[BV32_ADD(1575936bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v155$2, v153$2);
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
