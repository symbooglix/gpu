type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$RKF"} {:global} {:elem_width 32} {:source_name "RKF"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$RKF: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$RKF: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$RKF: bool;

axiom {:array_info "$$RKR"} {:global} {:elem_width 32} {:source_name "RKR"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$RKR: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$RKR: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$RKR: bool;

var {:source_name "WDOT"} {:global} $$WDOT: [bv32]bv32;

axiom {:array_info "$$WDOT"} {:global} {:elem_width 32} {:source_name "WDOT"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$WDOT: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$WDOT: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$WDOT: bool;

axiom {:array_info "$$molwt"} {:global} {:elem_width 32} {:source_name "molwt"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$molwt: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$molwt: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$molwt: bool;

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

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "rdwdot9_kernel"} {:kernel} $rdwdot9_kernel($rateconv: bv32);
  requires !_READ_HAS_OCCURRED_$$RKF && !_WRITE_HAS_OCCURRED_$$RKF && !_ATOMIC_HAS_OCCURRED_$$RKF;
  requires !_READ_HAS_OCCURRED_$$RKR && !_WRITE_HAS_OCCURRED_$$RKR && !_ATOMIC_HAS_OCCURRED_$$RKR;
  requires !_READ_HAS_OCCURRED_$$WDOT && !_WRITE_HAS_OCCURRED_$$WDOT && !_ATOMIC_HAS_OCCURRED_$$WDOT;
  requires !_READ_HAS_OCCURRED_$$molwt && !_WRITE_HAS_OCCURRED_$$molwt && !_ATOMIC_HAS_OCCURRED_$$molwt;
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
  modifies _WRITE_HAS_OCCURRED_$$WDOT, _WRITE_READ_BENIGN_FLAG_$$WDOT, _WRITE_READ_BENIGN_FLAG_$$WDOT;



implementation {:source_name "rdwdot9_kernel"} {:kernel} $rdwdot9_kernel($rateconv: bv32)
{
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
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
  var v57$1: bv32;
  var v57$2: bv32;
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
  var v114$1: bv32;
  var v114$2: bv32;
  var v115$1: bv32;
  var v115$2: bv32;
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


  $0:
    havoc v0$1, v0$2;
    havoc v1$1, v1$2;
    havoc v2$1, v2$2;
    havoc v3$1, v3$2;
    havoc v4$1, v4$2;
    havoc v5$1, v5$2;
    havoc v6$1, v6$2;
    havoc v7$1, v7$2;
    havoc v8$1, v8$2;
    havoc v9$1, v9$2;
    havoc v10$1, v10$2;
    havoc v11$1, v11$2;
    havoc v12$1, v12$2;
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
    havoc v30$1, v30$2;
    havoc v31$1, v31$2;
    havoc v32$1, v32$2;
    havoc v33$1, v33$2;
    havoc v34$1, v34$2;
    havoc v35$1, v35$2;
    havoc v36$1, v36$2;
    havoc v37$1, v37$2;
    havoc v38$1, v38$2;
    havoc v39$1, v39$2;
    havoc v40$1, v40$2;
    havoc v41$1, v41$2;
    havoc v42$1, v42$2;
    havoc v43$1, v43$2;
    havoc v44$1, v44$2;
    havoc v45$1, v45$2;
    havoc v46$1, v46$2;
    havoc v47$1, v47$2;
    havoc v48$1, v48$2;
    havoc v49$1, v49$2;
    havoc v50$1, v50$2;
    havoc v51$1, v51$2;
    havoc v52$1, v52$2;
    havoc v53$1, v53$2;
    havoc v54$1, v54$2;
    havoc v55$1, v55$2;
    havoc v56$1, v56$2;
    havoc v57$1, v57$2;
    havoc v58$1, v58$2;
    havoc v59$1, v59$2;
    havoc v60$1, v60$2;
    havoc v61$1, v61$2;
    havoc v62$1, v62$2;
    havoc v63$1, v63$2;
    havoc v64$1, v64$2;
    havoc v65$1, v65$2;
    havoc v66$1, v66$2;
    havoc v67$1, v67$2;
    havoc v68$1, v68$2;
    havoc v69$1, v69$2;
    havoc v70$1, v70$2;
    havoc v71$1, v71$2;
    havoc v72$1, v72$2;
    havoc v73$1, v73$2;
    havoc v74$1, v74$2;
    havoc v75$1, v75$2;
    havoc v76$1, v76$2;
    havoc v77$1, v77$2;
    havoc v78$1, v78$2;
    havoc v79$1, v79$2;
    havoc v80$1, v80$2;
    havoc v81$1, v81$2;
    havoc v82$1, v82$2;
    havoc v83$1, v83$2;
    havoc v84$1, v84$2;
    havoc v85$1, v85$2;
    havoc v86$1, v86$2;
    havoc v87$1, v87$2;
    havoc v88$1, v88$2;
    havoc v89$1, v89$2;
    havoc v90$1, v90$2;
    havoc v91$1, v91$2;
    havoc v92$1, v92$2;
    havoc v93$1, v93$2;
    havoc v94$1, v94$2;
    havoc v95$1, v95$2;
    havoc v96$1, v96$2;
    havoc v97$1, v97$2;
    havoc v98$1, v98$2;
    havoc v99$1, v99$2;
    havoc v100$1, v100$2;
    havoc v101$1, v101$2;
    havoc v102$1, v102$2;
    havoc v103$1, v103$2;
    havoc v104$1, v104$2;
    havoc v105$1, v105$2;
    havoc v106$1, v106$2;
    havoc v107$1, v107$2;
    havoc v108$1, v108$2;
    havoc v109$1, v109$2;
    havoc v110$1, v110$2;
    havoc v111$1, v111$2;
    havoc v112$1, v112$2;
    havoc v113$1, v113$2;
    havoc v114$1, v114$2;
    havoc v115$1, v115$2;
    havoc v116$1, v116$2;
    havoc v117$1, v117$2;
    havoc v118$1, v118$2;
    havoc v119$1, v119$2;
    havoc v120$1, v120$2;
    havoc v121$1, v121$2;
    havoc v122$1, v122$2;
    call {:sourceloc} {:sourceloc_num 124} _LOG_WRITE_$$WDOT(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(FMUL32(FADD32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FADD32(FADD32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FADD32(FSUB32(FSUB32(FADD32(FSUB32(FSUB32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FADD32(FADD32(FADD32(FSUB32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FSUB32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FADD32(FADD32(FSUB32(FSUB32(FADD32(FSUB32(FSUB32(FSUB32(FSUB32(FADD32(FSUB32(v4$1, v5$1), FSUB32(v6$1, v7$1)), FSUB32(v8$1, v9$1)), FSUB32(v10$1, v11$1)), FSUB32(v12$1, v13$1)), FSUB32(v14$1, v15$1)), FSUB32(v16$1, v17$1)), FSUB32(v18$1, v19$1)), FSUB32(v20$1, v21$1)), FSUB32(v22$1, v23$1)), FSUB32(v24$1, v25$1)), FSUB32(v26$1, v27$1)), FSUB32(v28$1, v29$1)), FSUB32(v30$1, v31$1)), FSUB32(v32$1, v33$1)), FADD32(FSUB32(v0$1, v1$1), FSUB32(v2$1, v3$1))), FSUB32(v34$1, v35$1)), FSUB32(v36$1, v37$1)), FSUB32(v38$1, v39$1)), FSUB32(v40$1, v41$1)), FSUB32(v42$1, v43$1)), FSUB32(v44$1, v45$1)), FSUB32(v46$1, v47$1)), FSUB32(v48$1, v49$1)), FSUB32(v50$1, v51$1)), FSUB32(v52$1, v53$1)), FSUB32(v54$1, v55$1)), FSUB32(v56$1, v57$1)), FSUB32(v58$1, v59$1)), FSUB32(v60$1, v61$1)), FSUB32(v62$1, v63$1)), FSUB32(v64$1, v65$1)), FSUB32(v66$1, v67$1)), FSUB32(v68$1, v69$1)), FSUB32(v70$1, v71$1)), FSUB32(v72$1, v73$1)), FSUB32(v74$1, v75$1)), FSUB32(v76$1, v77$1)), FSUB32(v78$1, v79$1)), FSUB32(v80$1, v81$1)), FSUB32(v82$1, v83$1)), FSUB32(v84$1, v85$1)), FSUB32(v86$1, v87$1)), FSUB32(v88$1, v89$1)), FSUB32(v90$1, v91$1)), FSUB32(v92$1, v93$1)), FSUB32(v94$1, v95$1)), FSUB32(v96$1, v97$1)), FSUB32(v98$1, v99$1)), FSUB32(v100$1, v101$1)), FSUB32(v102$1, v103$1)), FSUB32(v104$1, v105$1)), FSUB32(v106$1, v107$1)), FSUB32(v108$1, v109$1)), FSUB32(v110$1, v111$1)), FSUB32(v112$1, v113$1)), FSUB32(v114$1, v115$1)), FSUB32(v116$1, v117$1)), FSUB32(v118$1, v119$1)), FSUB32(v120$1, v121$1)), $rateconv), v122$1), $$WDOT[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$WDOT(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 124} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 124} _CHECK_WRITE_$$WDOT(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(FMUL32(FADD32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FADD32(FADD32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FADD32(FSUB32(FSUB32(FADD32(FSUB32(FSUB32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FADD32(FADD32(FADD32(FSUB32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FSUB32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FADD32(FADD32(FSUB32(FSUB32(FADD32(FSUB32(FSUB32(FSUB32(FSUB32(FADD32(FSUB32(v4$2, v5$2), FSUB32(v6$2, v7$2)), FSUB32(v8$2, v9$2)), FSUB32(v10$2, v11$2)), FSUB32(v12$2, v13$2)), FSUB32(v14$2, v15$2)), FSUB32(v16$2, v17$2)), FSUB32(v18$2, v19$2)), FSUB32(v20$2, v21$2)), FSUB32(v22$2, v23$2)), FSUB32(v24$2, v25$2)), FSUB32(v26$2, v27$2)), FSUB32(v28$2, v29$2)), FSUB32(v30$2, v31$2)), FSUB32(v32$2, v33$2)), FADD32(FSUB32(v0$2, v1$2), FSUB32(v2$2, v3$2))), FSUB32(v34$2, v35$2)), FSUB32(v36$2, v37$2)), FSUB32(v38$2, v39$2)), FSUB32(v40$2, v41$2)), FSUB32(v42$2, v43$2)), FSUB32(v44$2, v45$2)), FSUB32(v46$2, v47$2)), FSUB32(v48$2, v49$2)), FSUB32(v50$2, v51$2)), FSUB32(v52$2, v53$2)), FSUB32(v54$2, v55$2)), FSUB32(v56$2, v57$2)), FSUB32(v58$2, v59$2)), FSUB32(v60$2, v61$2)), FSUB32(v62$2, v63$2)), FSUB32(v64$2, v65$2)), FSUB32(v66$2, v67$2)), FSUB32(v68$2, v69$2)), FSUB32(v70$2, v71$2)), FSUB32(v72$2, v73$2)), FSUB32(v74$2, v75$2)), FSUB32(v76$2, v77$2)), FSUB32(v78$2, v79$2)), FSUB32(v80$2, v81$2)), FSUB32(v82$2, v83$2)), FSUB32(v84$2, v85$2)), FSUB32(v86$2, v87$2)), FSUB32(v88$2, v89$2)), FSUB32(v90$2, v91$2)), FSUB32(v92$2, v93$2)), FSUB32(v94$2, v95$2)), FSUB32(v96$2, v97$2)), FSUB32(v98$2, v99$2)), FSUB32(v100$2, v101$2)), FSUB32(v102$2, v103$2)), FSUB32(v104$2, v105$2)), FSUB32(v106$2, v107$2)), FSUB32(v108$2, v109$2)), FSUB32(v110$2, v111$2)), FSUB32(v112$2, v113$2)), FSUB32(v114$2, v115$2)), FSUB32(v116$2, v117$2)), FSUB32(v118$2, v119$2)), FSUB32(v120$2, v121$2)), $rateconv), v122$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$WDOT"} true;
    $$WDOT[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(FMUL32(FADD32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FADD32(FADD32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FADD32(FSUB32(FSUB32(FADD32(FSUB32(FSUB32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FADD32(FADD32(FADD32(FSUB32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FSUB32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FADD32(FADD32(FSUB32(FSUB32(FADD32(FSUB32(FSUB32(FSUB32(FSUB32(FADD32(FSUB32(v4$1, v5$1), FSUB32(v6$1, v7$1)), FSUB32(v8$1, v9$1)), FSUB32(v10$1, v11$1)), FSUB32(v12$1, v13$1)), FSUB32(v14$1, v15$1)), FSUB32(v16$1, v17$1)), FSUB32(v18$1, v19$1)), FSUB32(v20$1, v21$1)), FSUB32(v22$1, v23$1)), FSUB32(v24$1, v25$1)), FSUB32(v26$1, v27$1)), FSUB32(v28$1, v29$1)), FSUB32(v30$1, v31$1)), FSUB32(v32$1, v33$1)), FADD32(FSUB32(v0$1, v1$1), FSUB32(v2$1, v3$1))), FSUB32(v34$1, v35$1)), FSUB32(v36$1, v37$1)), FSUB32(v38$1, v39$1)), FSUB32(v40$1, v41$1)), FSUB32(v42$1, v43$1)), FSUB32(v44$1, v45$1)), FSUB32(v46$1, v47$1)), FSUB32(v48$1, v49$1)), FSUB32(v50$1, v51$1)), FSUB32(v52$1, v53$1)), FSUB32(v54$1, v55$1)), FSUB32(v56$1, v57$1)), FSUB32(v58$1, v59$1)), FSUB32(v60$1, v61$1)), FSUB32(v62$1, v63$1)), FSUB32(v64$1, v65$1)), FSUB32(v66$1, v67$1)), FSUB32(v68$1, v69$1)), FSUB32(v70$1, v71$1)), FSUB32(v72$1, v73$1)), FSUB32(v74$1, v75$1)), FSUB32(v76$1, v77$1)), FSUB32(v78$1, v79$1)), FSUB32(v80$1, v81$1)), FSUB32(v82$1, v83$1)), FSUB32(v84$1, v85$1)), FSUB32(v86$1, v87$1)), FSUB32(v88$1, v89$1)), FSUB32(v90$1, v91$1)), FSUB32(v92$1, v93$1)), FSUB32(v94$1, v95$1)), FSUB32(v96$1, v97$1)), FSUB32(v98$1, v99$1)), FSUB32(v100$1, v101$1)), FSUB32(v102$1, v103$1)), FSUB32(v104$1, v105$1)), FSUB32(v106$1, v107$1)), FSUB32(v108$1, v109$1)), FSUB32(v110$1, v111$1)), FSUB32(v112$1, v113$1)), FSUB32(v114$1, v115$1)), FSUB32(v116$1, v117$1)), FSUB32(v118$1, v119$1)), FSUB32(v120$1, v121$1)), $rateconv), v122$1);
    $$WDOT[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(FMUL32(FADD32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FADD32(FADD32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FADD32(FSUB32(FSUB32(FADD32(FSUB32(FSUB32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FADD32(FADD32(FADD32(FSUB32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FSUB32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FSUB32(FADD32(FADD32(FSUB32(FADD32(FADD32(FADD32(FSUB32(FSUB32(FADD32(FSUB32(FSUB32(FSUB32(FSUB32(FADD32(FSUB32(v4$2, v5$2), FSUB32(v6$2, v7$2)), FSUB32(v8$2, v9$2)), FSUB32(v10$2, v11$2)), FSUB32(v12$2, v13$2)), FSUB32(v14$2, v15$2)), FSUB32(v16$2, v17$2)), FSUB32(v18$2, v19$2)), FSUB32(v20$2, v21$2)), FSUB32(v22$2, v23$2)), FSUB32(v24$2, v25$2)), FSUB32(v26$2, v27$2)), FSUB32(v28$2, v29$2)), FSUB32(v30$2, v31$2)), FSUB32(v32$2, v33$2)), FADD32(FSUB32(v0$2, v1$2), FSUB32(v2$2, v3$2))), FSUB32(v34$2, v35$2)), FSUB32(v36$2, v37$2)), FSUB32(v38$2, v39$2)), FSUB32(v40$2, v41$2)), FSUB32(v42$2, v43$2)), FSUB32(v44$2, v45$2)), FSUB32(v46$2, v47$2)), FSUB32(v48$2, v49$2)), FSUB32(v50$2, v51$2)), FSUB32(v52$2, v53$2)), FSUB32(v54$2, v55$2)), FSUB32(v56$2, v57$2)), FSUB32(v58$2, v59$2)), FSUB32(v60$2, v61$2)), FSUB32(v62$2, v63$2)), FSUB32(v64$2, v65$2)), FSUB32(v66$2, v67$2)), FSUB32(v68$2, v69$2)), FSUB32(v70$2, v71$2)), FSUB32(v72$2, v73$2)), FSUB32(v74$2, v75$2)), FSUB32(v76$2, v77$2)), FSUB32(v78$2, v79$2)), FSUB32(v80$2, v81$2)), FSUB32(v82$2, v83$2)), FSUB32(v84$2, v85$2)), FSUB32(v86$2, v87$2)), FSUB32(v88$2, v89$2)), FSUB32(v90$2, v91$2)), FSUB32(v92$2, v93$2)), FSUB32(v94$2, v95$2)), FSUB32(v96$2, v97$2)), FSUB32(v98$2, v99$2)), FSUB32(v100$2, v101$2)), FSUB32(v102$2, v103$2)), FSUB32(v104$2, v105$2)), FSUB32(v106$2, v107$2)), FSUB32(v108$2, v109$2)), FSUB32(v110$2, v111$2)), FSUB32(v112$2, v113$2)), FSUB32(v114$2, v115$2)), FSUB32(v116$2, v117$2)), FSUB32(v118$2, v119$2)), FSUB32(v120$2, v121$2)), $rateconv), v122$2);
    return;
}



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

const _WATCHED_VALUE_$$RKF: bv32;

procedure {:inline 1} _LOG_READ_$$RKF(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$RKF;



implementation {:inline 1} _LOG_READ_$$RKF(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$RKF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKF == _value then true else _READ_HAS_OCCURRED_$$RKF);
    return;
}



procedure _CHECK_READ_$$RKF(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "RKF"} {:array "$$RKF"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$RKF && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$RKF);
  requires {:source_name "RKF"} {:array "$$RKF"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$RKF && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$RKF: bool;

procedure {:inline 1} _LOG_WRITE_$$RKF(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$RKF, _WRITE_READ_BENIGN_FLAG_$$RKF;



implementation {:inline 1} _LOG_WRITE_$$RKF(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$RKF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKF == _value then true else _WRITE_HAS_OCCURRED_$$RKF);
    _WRITE_READ_BENIGN_FLAG_$$RKF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKF == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$RKF);
    return;
}



procedure _CHECK_WRITE_$$RKF(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "RKF"} {:array "$$RKF"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$RKF && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKF != _value);
  requires {:source_name "RKF"} {:array "$$RKF"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$RKF && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKF != _value);
  requires {:source_name "RKF"} {:array "$$RKF"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$RKF && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$RKF(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$RKF;



implementation {:inline 1} _LOG_ATOMIC_$$RKF(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$RKF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$RKF);
    return;
}



procedure _CHECK_ATOMIC_$$RKF(_P: bool, _offset: bv32);
  requires {:source_name "RKF"} {:array "$$RKF"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$RKF && _WATCHED_OFFSET == _offset);
  requires {:source_name "RKF"} {:array "$$RKF"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$RKF && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKF(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$RKF;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKF(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$RKF := (if _P && _WRITE_HAS_OCCURRED_$$RKF && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$RKF);
    return;
}



const _WATCHED_VALUE_$$RKR: bv32;

procedure {:inline 1} _LOG_READ_$$RKR(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$RKR;



implementation {:inline 1} _LOG_READ_$$RKR(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$RKR := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKR == _value then true else _READ_HAS_OCCURRED_$$RKR);
    return;
}



procedure _CHECK_READ_$$RKR(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "RKR"} {:array "$$RKR"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$RKR && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$RKR);
  requires {:source_name "RKR"} {:array "$$RKR"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$RKR && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$RKR: bool;

procedure {:inline 1} _LOG_WRITE_$$RKR(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$RKR, _WRITE_READ_BENIGN_FLAG_$$RKR;



implementation {:inline 1} _LOG_WRITE_$$RKR(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$RKR := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKR == _value then true else _WRITE_HAS_OCCURRED_$$RKR);
    _WRITE_READ_BENIGN_FLAG_$$RKR := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKR == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$RKR);
    return;
}



procedure _CHECK_WRITE_$$RKR(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "RKR"} {:array "$$RKR"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$RKR && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKR != _value);
  requires {:source_name "RKR"} {:array "$$RKR"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$RKR && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$RKR != _value);
  requires {:source_name "RKR"} {:array "$$RKR"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$RKR && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$RKR(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$RKR;



implementation {:inline 1} _LOG_ATOMIC_$$RKR(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$RKR := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$RKR);
    return;
}



procedure _CHECK_ATOMIC_$$RKR(_P: bool, _offset: bv32);
  requires {:source_name "RKR"} {:array "$$RKR"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$RKR && _WATCHED_OFFSET == _offset);
  requires {:source_name "RKR"} {:array "$$RKR"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$RKR && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKR(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$RKR;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$RKR(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$RKR := (if _P && _WRITE_HAS_OCCURRED_$$RKR && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$RKR);
    return;
}



const _WATCHED_VALUE_$$WDOT: bv32;

procedure {:inline 1} _LOG_READ_$$WDOT(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$WDOT;



implementation {:inline 1} _LOG_READ_$$WDOT(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$WDOT := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$WDOT == _value then true else _READ_HAS_OCCURRED_$$WDOT);
    return;
}



procedure _CHECK_READ_$$WDOT(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "WDOT"} {:array "$$WDOT"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$WDOT && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$WDOT);
  requires {:source_name "WDOT"} {:array "$$WDOT"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$WDOT && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$WDOT: bool;

procedure {:inline 1} _LOG_WRITE_$$WDOT(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$WDOT, _WRITE_READ_BENIGN_FLAG_$$WDOT;



implementation {:inline 1} _LOG_WRITE_$$WDOT(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$WDOT := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$WDOT == _value then true else _WRITE_HAS_OCCURRED_$$WDOT);
    _WRITE_READ_BENIGN_FLAG_$$WDOT := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$WDOT == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$WDOT);
    return;
}



procedure _CHECK_WRITE_$$WDOT(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "WDOT"} {:array "$$WDOT"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$WDOT && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$WDOT != _value);
  requires {:source_name "WDOT"} {:array "$$WDOT"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$WDOT && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$WDOT != _value);
  requires {:source_name "WDOT"} {:array "$$WDOT"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$WDOT && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$WDOT(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$WDOT;



implementation {:inline 1} _LOG_ATOMIC_$$WDOT(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$WDOT := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$WDOT);
    return;
}



procedure _CHECK_ATOMIC_$$WDOT(_P: bool, _offset: bv32);
  requires {:source_name "WDOT"} {:array "$$WDOT"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$WDOT && _WATCHED_OFFSET == _offset);
  requires {:source_name "WDOT"} {:array "$$WDOT"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$WDOT && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$WDOT(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$WDOT;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$WDOT(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$WDOT := (if _P && _WRITE_HAS_OCCURRED_$$WDOT && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$WDOT);
    return;
}



const _WATCHED_VALUE_$$molwt: bv32;

procedure {:inline 1} _LOG_READ_$$molwt(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$molwt;



implementation {:inline 1} _LOG_READ_$$molwt(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$molwt := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$molwt == _value then true else _READ_HAS_OCCURRED_$$molwt);
    return;
}



procedure _CHECK_READ_$$molwt(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "molwt"} {:array "$$molwt"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$molwt && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$molwt);
  requires {:source_name "molwt"} {:array "$$molwt"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$molwt && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$molwt: bool;

procedure {:inline 1} _LOG_WRITE_$$molwt(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$molwt, _WRITE_READ_BENIGN_FLAG_$$molwt;



implementation {:inline 1} _LOG_WRITE_$$molwt(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$molwt := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$molwt == _value then true else _WRITE_HAS_OCCURRED_$$molwt);
    _WRITE_READ_BENIGN_FLAG_$$molwt := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$molwt == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$molwt);
    return;
}



procedure _CHECK_WRITE_$$molwt(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "molwt"} {:array "$$molwt"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$molwt && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$molwt != _value);
  requires {:source_name "molwt"} {:array "$$molwt"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$molwt && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$molwt != _value);
  requires {:source_name "molwt"} {:array "$$molwt"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$molwt && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$molwt(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$molwt;



implementation {:inline 1} _LOG_ATOMIC_$$molwt(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$molwt := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$molwt);
    return;
}



procedure _CHECK_ATOMIC_$$molwt(_P: bool, _offset: bv32);
  requires {:source_name "molwt"} {:array "$$molwt"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$molwt && _WATCHED_OFFSET == _offset);
  requires {:source_name "molwt"} {:array "$$molwt"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$molwt && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$molwt(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$molwt;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$molwt(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$molwt := (if _P && _WRITE_HAS_OCCURRED_$$molwt && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$molwt);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
