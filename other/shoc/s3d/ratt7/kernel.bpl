type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$T"} {:global} {:elem_width 32} {:source_name "T"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$T: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$T: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$T: bool;

axiom {:array_info "$$RF"} {:global} {:elem_width 32} {:source_name "RF"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$RF: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$RF: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$RF: bool;

var {:source_name "RB"} {:global} $$RB: [bv32]bv32;

axiom {:array_info "$$RB"} {:global} {:elem_width 32} {:source_name "RB"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$RB: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$RB: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$RB: bool;

axiom {:array_info "$$EG"} {:global} {:elem_width 32} {:source_name "EG"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$EG: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$EG: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$EG: bool;

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

function FDIV32(bv32, bv32) : bv32;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "ratt7_kernel"} {:kernel} $ratt7_kernel($TCONV: bv32);
  requires !_READ_HAS_OCCURRED_$$T && !_WRITE_HAS_OCCURRED_$$T && !_ATOMIC_HAS_OCCURRED_$$T;
  requires !_READ_HAS_OCCURRED_$$RF && !_WRITE_HAS_OCCURRED_$$RF && !_ATOMIC_HAS_OCCURRED_$$RF;
  requires !_READ_HAS_OCCURRED_$$RB && !_WRITE_HAS_OCCURRED_$$RB && !_ATOMIC_HAS_OCCURRED_$$RB;
  requires !_READ_HAS_OCCURRED_$$EG && !_WRITE_HAS_OCCURRED_$$EG && !_ATOMIC_HAS_OCCURRED_$$EG;
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
  modifies _WRITE_HAS_OCCURRED_$$RB, _WRITE_READ_BENIGN_FLAG_$$RB, _WRITE_READ_BENIGN_FLAG_$$RB;



implementation {:source_name "ratt7_kernel"} {:kernel} $ratt7_kernel($TCONV: bv32)
{
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
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
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
  var v55$1: bv32;
  var v55$2: bv32;
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
  var v110$1: bv32;
  var v110$2: bv32;
  var v111$1: bv32;
  var v111$2: bv32;
  var v112$1: bv32;
  var v112$2: bv32;
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


  $0:
    havoc v0$1, v0$2;
    v1$1 := FMUL32(1232560160bv32, FDIV32(1065353216bv32, FMUL32(1285461554bv32, FMUL32(v0$1, $TCONV))));
    v1$2 := FMUL32(1232560160bv32, FDIV32(1065353216bv32, FMUL32(1285461554bv32, FMUL32(v0$2, $TCONV))));
    havoc v2$1, v2$2;
    havoc v3$1, v3$2;
    havoc v4$1, v4$2;
    v5$1 := FMUL32(FMUL32(FMUL32(v2$1, v3$1), v1$1), FDIV32(1065353216bv32, v4$1));
    v5$2 := FMUL32(FMUL32(FMUL32(v2$2, v3$2), v1$2), FDIV32(1065353216bv32, v4$2));
    havoc v6$1, v6$2;
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$RB(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v6$1, (if FLT32(1621981420bv32, v5$1) then 1621981420bv32 else v5$1)), $$RB[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$RB(true, BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v6$2, (if FLT32(1621981420bv32, v5$2) then 1621981420bv32 else v5$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v6$1, (if FLT32(1621981420bv32, v5$1) then 1621981420bv32 else v5$1));
    $$RB[BV32_ADD(1728000bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v6$2, (if FLT32(1621981420bv32, v5$2) then 1621981420bv32 else v5$2));
    havoc v7$1, v7$2;
    havoc v8$1, v8$2;
    havoc v9$1, v9$2;
    havoc v10$1, v10$2;
    v11$1 := FMUL32(FMUL32(v7$1, v8$1), FDIV32(1065353216bv32, FMUL32(v9$1, v10$1)));
    v11$2 := FMUL32(FMUL32(v7$2, v8$2), FDIV32(1065353216bv32, FMUL32(v9$2, v10$2)));
    havoc v12$1, v12$2;
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$RB(true, BV32_ADD(1741824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v12$1, (if FLT32(1621981420bv32, v11$1) then 1621981420bv32 else v11$1)), $$RB[BV32_ADD(1741824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1741824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$RB(true, BV32_ADD(1741824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v12$2, (if FLT32(1621981420bv32, v11$2) then 1621981420bv32 else v11$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1741824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v12$1, (if FLT32(1621981420bv32, v11$1) then 1621981420bv32 else v11$1));
    $$RB[BV32_ADD(1741824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v12$2, (if FLT32(1621981420bv32, v11$2) then 1621981420bv32 else v11$2));
    havoc v13$1, v13$2;
    havoc v14$1, v14$2;
    havoc v15$1, v15$2;
    havoc v16$1, v16$2;
    v17$1 := FMUL32(FMUL32(v13$1, v14$1), FDIV32(1065353216bv32, FMUL32(v15$1, v16$1)));
    v17$2 := FMUL32(FMUL32(v13$2, v14$2), FDIV32(1065353216bv32, FMUL32(v15$2, v16$2)));
    havoc v18$1, v18$2;
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$RB(true, BV32_ADD(1755648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v18$1, (if FLT32(1621981420bv32, v17$1) then 1621981420bv32 else v17$1)), $$RB[BV32_ADD(1755648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1755648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$RB(true, BV32_ADD(1755648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v18$2, (if FLT32(1621981420bv32, v17$2) then 1621981420bv32 else v17$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1755648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v18$1, (if FLT32(1621981420bv32, v17$1) then 1621981420bv32 else v17$1));
    $$RB[BV32_ADD(1755648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v18$2, (if FLT32(1621981420bv32, v17$2) then 1621981420bv32 else v17$2));
    havoc v19$1, v19$2;
    havoc v20$1, v20$2;
    havoc v21$1, v21$2;
    havoc v22$1, v22$2;
    v23$1 := FMUL32(FMUL32(v19$1, v20$1), FDIV32(1065353216bv32, FMUL32(v21$1, v22$1)));
    v23$2 := FMUL32(FMUL32(v19$2, v20$2), FDIV32(1065353216bv32, FMUL32(v21$2, v22$2)));
    havoc v24$1, v24$2;
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$RB(true, BV32_ADD(1769472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v24$1, (if FLT32(1621981420bv32, v23$1) then 1621981420bv32 else v23$1)), $$RB[BV32_ADD(1769472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1769472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$RB(true, BV32_ADD(1769472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v24$2, (if FLT32(1621981420bv32, v23$2) then 1621981420bv32 else v23$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1769472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v24$1, (if FLT32(1621981420bv32, v23$1) then 1621981420bv32 else v23$1));
    $$RB[BV32_ADD(1769472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v24$2, (if FLT32(1621981420bv32, v23$2) then 1621981420bv32 else v23$2));
    havoc v25$1, v25$2;
    havoc v26$1, v26$2;
    havoc v27$1, v27$2;
    havoc v28$1, v28$2;
    v29$1 := FMUL32(FMUL32(v25$1, v26$1), FDIV32(1065353216bv32, FMUL32(v27$1, v28$1)));
    v29$2 := FMUL32(FMUL32(v25$2, v26$2), FDIV32(1065353216bv32, FMUL32(v27$2, v28$2)));
    havoc v30$1, v30$2;
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$RB(true, BV32_ADD(1783296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v30$1, (if FLT32(1621981420bv32, v29$1) then 1621981420bv32 else v29$1)), $$RB[BV32_ADD(1783296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1783296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$RB(true, BV32_ADD(1783296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v30$2, (if FLT32(1621981420bv32, v29$2) then 1621981420bv32 else v29$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1783296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v30$1, (if FLT32(1621981420bv32, v29$1) then 1621981420bv32 else v29$1));
    $$RB[BV32_ADD(1783296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v30$2, (if FLT32(1621981420bv32, v29$2) then 1621981420bv32 else v29$2));
    havoc v31$1, v31$2;
    havoc v32$1, v32$2;
    havoc v33$1, v33$2;
    havoc v34$1, v34$2;
    v35$1 := FMUL32(FMUL32(v31$1, v32$1), FDIV32(1065353216bv32, FMUL32(v33$1, v34$1)));
    v35$2 := FMUL32(FMUL32(v31$2, v32$2), FDIV32(1065353216bv32, FMUL32(v33$2, v34$2)));
    havoc v36$1, v36$2;
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$RB(true, BV32_ADD(1797120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v36$1, (if FLT32(1621981420bv32, v35$1) then 1621981420bv32 else v35$1)), $$RB[BV32_ADD(1797120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1797120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$RB(true, BV32_ADD(1797120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v36$2, (if FLT32(1621981420bv32, v35$2) then 1621981420bv32 else v35$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1797120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v36$1, (if FLT32(1621981420bv32, v35$1) then 1621981420bv32 else v35$1));
    $$RB[BV32_ADD(1797120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v36$2, (if FLT32(1621981420bv32, v35$2) then 1621981420bv32 else v35$2));
    havoc v37$1, v37$2;
    havoc v38$1, v38$2;
    havoc v39$1, v39$2;
    v40$1 := FMUL32(FMUL32(FMUL32(v37$1, v38$1), v1$1), FDIV32(1065353216bv32, v39$1));
    v40$2 := FMUL32(FMUL32(FMUL32(v37$2, v38$2), v1$2), FDIV32(1065353216bv32, v39$2));
    havoc v41$1, v41$2;
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$RB(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v41$1, (if FLT32(1621981420bv32, v40$1) then 1621981420bv32 else v40$1)), $$RB[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$RB(true, BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v41$2, (if FLT32(1621981420bv32, v40$2) then 1621981420bv32 else v40$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v41$1, (if FLT32(1621981420bv32, v40$1) then 1621981420bv32 else v40$1));
    $$RB[BV32_ADD(1810944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v41$2, (if FLT32(1621981420bv32, v40$2) then 1621981420bv32 else v40$2));
    havoc v42$1, v42$2;
    havoc v43$1, v43$2;
    havoc v44$1, v44$2;
    havoc v45$1, v45$2;
    v46$1 := FMUL32(FMUL32(v42$1, v43$1), FDIV32(1065353216bv32, FMUL32(v44$1, v45$1)));
    v46$2 := FMUL32(FMUL32(v42$2, v43$2), FDIV32(1065353216bv32, FMUL32(v44$2, v45$2)));
    havoc v47$1, v47$2;
    call {:sourceloc} {:sourceloc_num 47} _LOG_WRITE_$$RB(true, BV32_ADD(1824768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v47$1, (if FLT32(1621981420bv32, v46$1) then 1621981420bv32 else v46$1)), $$RB[BV32_ADD(1824768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1824768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 47} _CHECK_WRITE_$$RB(true, BV32_ADD(1824768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v47$2, (if FLT32(1621981420bv32, v46$2) then 1621981420bv32 else v46$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1824768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v47$1, (if FLT32(1621981420bv32, v46$1) then 1621981420bv32 else v46$1));
    $$RB[BV32_ADD(1824768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v47$2, (if FLT32(1621981420bv32, v46$2) then 1621981420bv32 else v46$2));
    havoc v48$1, v48$2;
    havoc v49$1, v49$2;
    havoc v50$1, v50$2;
    havoc v51$1, v51$2;
    v52$1 := FMUL32(FMUL32(v48$1, v49$1), FDIV32(1065353216bv32, FMUL32(v50$1, v51$1)));
    v52$2 := FMUL32(FMUL32(v48$2, v49$2), FDIV32(1065353216bv32, FMUL32(v50$2, v51$2)));
    havoc v53$1, v53$2;
    call {:sourceloc} {:sourceloc_num 53} _LOG_WRITE_$$RB(true, BV32_ADD(1838592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v53$1, (if FLT32(1621981420bv32, v52$1) then 1621981420bv32 else v52$1)), $$RB[BV32_ADD(1838592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1838592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 53} _CHECK_WRITE_$$RB(true, BV32_ADD(1838592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v53$2, (if FLT32(1621981420bv32, v52$2) then 1621981420bv32 else v52$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1838592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v53$1, (if FLT32(1621981420bv32, v52$1) then 1621981420bv32 else v52$1));
    $$RB[BV32_ADD(1838592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v53$2, (if FLT32(1621981420bv32, v52$2) then 1621981420bv32 else v52$2));
    havoc v54$1, v54$2;
    havoc v55$1, v55$2;
    havoc v56$1, v56$2;
    havoc v57$1, v57$2;
    v58$1 := FMUL32(FMUL32(v54$1, v55$1), FDIV32(1065353216bv32, FMUL32(v56$1, v57$1)));
    v58$2 := FMUL32(FMUL32(v54$2, v55$2), FDIV32(1065353216bv32, FMUL32(v56$2, v57$2)));
    havoc v59$1, v59$2;
    call {:sourceloc} {:sourceloc_num 59} _LOG_WRITE_$$RB(true, BV32_ADD(1852416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v59$1, (if FLT32(1621981420bv32, v58$1) then 1621981420bv32 else v58$1)), $$RB[BV32_ADD(1852416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1852416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 59} _CHECK_WRITE_$$RB(true, BV32_ADD(1852416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v59$2, (if FLT32(1621981420bv32, v58$2) then 1621981420bv32 else v58$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1852416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v59$1, (if FLT32(1621981420bv32, v58$1) then 1621981420bv32 else v58$1));
    $$RB[BV32_ADD(1852416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v59$2, (if FLT32(1621981420bv32, v58$2) then 1621981420bv32 else v58$2));
    havoc v60$1, v60$2;
    havoc v61$1, v61$2;
    havoc v62$1, v62$2;
    havoc v63$1, v63$2;
    v64$1 := FMUL32(FMUL32(v60$1, v61$1), FDIV32(1065353216bv32, FMUL32(v62$1, v63$1)));
    v64$2 := FMUL32(FMUL32(v60$2, v61$2), FDIV32(1065353216bv32, FMUL32(v62$2, v63$2)));
    havoc v65$1, v65$2;
    call {:sourceloc} {:sourceloc_num 65} _LOG_WRITE_$$RB(true, BV32_ADD(1866240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v65$1, (if FLT32(1621981420bv32, v64$1) then 1621981420bv32 else v64$1)), $$RB[BV32_ADD(1866240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1866240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 65} _CHECK_WRITE_$$RB(true, BV32_ADD(1866240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v65$2, (if FLT32(1621981420bv32, v64$2) then 1621981420bv32 else v64$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1866240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v65$1, (if FLT32(1621981420bv32, v64$1) then 1621981420bv32 else v64$1));
    $$RB[BV32_ADD(1866240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v65$2, (if FLT32(1621981420bv32, v64$2) then 1621981420bv32 else v64$2));
    havoc v66$1, v66$2;
    havoc v67$1, v67$2;
    havoc v68$1, v68$2;
    havoc v69$1, v69$2;
    v70$1 := FMUL32(FMUL32(v66$1, v67$1), FDIV32(1065353216bv32, FMUL32(v68$1, v69$1)));
    v70$2 := FMUL32(FMUL32(v66$2, v67$2), FDIV32(1065353216bv32, FMUL32(v68$2, v69$2)));
    havoc v71$1, v71$2;
    call {:sourceloc} {:sourceloc_num 71} _LOG_WRITE_$$RB(true, BV32_ADD(1880064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v71$1, (if FLT32(1621981420bv32, v70$1) then 1621981420bv32 else v70$1)), $$RB[BV32_ADD(1880064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1880064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 71} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 71} _CHECK_WRITE_$$RB(true, BV32_ADD(1880064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v71$2, (if FLT32(1621981420bv32, v70$2) then 1621981420bv32 else v70$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1880064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v71$1, (if FLT32(1621981420bv32, v70$1) then 1621981420bv32 else v70$1));
    $$RB[BV32_ADD(1880064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v71$2, (if FLT32(1621981420bv32, v70$2) then 1621981420bv32 else v70$2));
    havoc v72$1, v72$2;
    havoc v73$1, v73$2;
    havoc v74$1, v74$2;
    havoc v75$1, v75$2;
    v76$1 := FMUL32(FMUL32(v72$1, v73$1), FDIV32(1065353216bv32, FMUL32(v74$1, v75$1)));
    v76$2 := FMUL32(FMUL32(v72$2, v73$2), FDIV32(1065353216bv32, FMUL32(v74$2, v75$2)));
    havoc v77$1, v77$2;
    call {:sourceloc} {:sourceloc_num 77} _LOG_WRITE_$$RB(true, BV32_ADD(1893888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v77$1, (if FLT32(1621981420bv32, v76$1) then 1621981420bv32 else v76$1)), $$RB[BV32_ADD(1893888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1893888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 77} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 77} _CHECK_WRITE_$$RB(true, BV32_ADD(1893888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v77$2, (if FLT32(1621981420bv32, v76$2) then 1621981420bv32 else v76$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1893888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v77$1, (if FLT32(1621981420bv32, v76$1) then 1621981420bv32 else v76$1));
    $$RB[BV32_ADD(1893888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v77$2, (if FLT32(1621981420bv32, v76$2) then 1621981420bv32 else v76$2));
    havoc v78$1, v78$2;
    havoc v79$1, v79$2;
    havoc v80$1, v80$2;
    havoc v81$1, v81$2;
    v82$1 := FMUL32(FMUL32(v78$1, v79$1), FDIV32(1065353216bv32, FMUL32(v80$1, v81$1)));
    v82$2 := FMUL32(FMUL32(v78$2, v79$2), FDIV32(1065353216bv32, FMUL32(v80$2, v81$2)));
    havoc v83$1, v83$2;
    call {:sourceloc} {:sourceloc_num 83} _LOG_WRITE_$$RB(true, BV32_ADD(1907712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v83$1, (if FLT32(1621981420bv32, v82$1) then 1621981420bv32 else v82$1)), $$RB[BV32_ADD(1907712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1907712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 83} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 83} _CHECK_WRITE_$$RB(true, BV32_ADD(1907712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v83$2, (if FLT32(1621981420bv32, v82$2) then 1621981420bv32 else v82$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1907712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v83$1, (if FLT32(1621981420bv32, v82$1) then 1621981420bv32 else v82$1));
    $$RB[BV32_ADD(1907712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v83$2, (if FLT32(1621981420bv32, v82$2) then 1621981420bv32 else v82$2));
    havoc v84$1, v84$2;
    havoc v85$1, v85$2;
    havoc v86$1, v86$2;
    havoc v87$1, v87$2;
    v88$1 := FMUL32(FMUL32(v84$1, v85$1), FDIV32(1065353216bv32, FMUL32(v86$1, v87$1)));
    v88$2 := FMUL32(FMUL32(v84$2, v85$2), FDIV32(1065353216bv32, FMUL32(v86$2, v87$2)));
    havoc v89$1, v89$2;
    call {:sourceloc} {:sourceloc_num 89} _LOG_WRITE_$$RB(true, BV32_ADD(1921536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v89$1, (if FLT32(1621981420bv32, v88$1) then 1621981420bv32 else v88$1)), $$RB[BV32_ADD(1921536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1921536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 89} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 89} _CHECK_WRITE_$$RB(true, BV32_ADD(1921536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v89$2, (if FLT32(1621981420bv32, v88$2) then 1621981420bv32 else v88$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1921536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v89$1, (if FLT32(1621981420bv32, v88$1) then 1621981420bv32 else v88$1));
    $$RB[BV32_ADD(1921536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v89$2, (if FLT32(1621981420bv32, v88$2) then 1621981420bv32 else v88$2));
    havoc v90$1, v90$2;
    havoc v91$1, v91$2;
    havoc v92$1, v92$2;
    havoc v93$1, v93$2;
    v94$1 := FMUL32(FMUL32(v90$1, v91$1), FDIV32(1065353216bv32, FMUL32(v92$1, v93$1)));
    v94$2 := FMUL32(FMUL32(v90$2, v91$2), FDIV32(1065353216bv32, FMUL32(v92$2, v93$2)));
    havoc v95$1, v95$2;
    call {:sourceloc} {:sourceloc_num 95} _LOG_WRITE_$$RB(true, BV32_ADD(1935360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v95$1, (if FLT32(1621981420bv32, v94$1) then 1621981420bv32 else v94$1)), $$RB[BV32_ADD(1935360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1935360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 95} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 95} _CHECK_WRITE_$$RB(true, BV32_ADD(1935360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v95$2, (if FLT32(1621981420bv32, v94$2) then 1621981420bv32 else v94$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1935360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v95$1, (if FLT32(1621981420bv32, v94$1) then 1621981420bv32 else v94$1));
    $$RB[BV32_ADD(1935360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v95$2, (if FLT32(1621981420bv32, v94$2) then 1621981420bv32 else v94$2));
    havoc v96$1, v96$2;
    havoc v97$1, v97$2;
    havoc v98$1, v98$2;
    havoc v99$1, v99$2;
    v100$1 := FMUL32(FMUL32(v96$1, v97$1), FDIV32(1065353216bv32, FMUL32(v98$1, v99$1)));
    v100$2 := FMUL32(FMUL32(v96$2, v97$2), FDIV32(1065353216bv32, FMUL32(v98$2, v99$2)));
    havoc v101$1, v101$2;
    call {:sourceloc} {:sourceloc_num 101} _LOG_WRITE_$$RB(true, BV32_ADD(1949184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v101$1, (if FLT32(1621981420bv32, v100$1) then 1621981420bv32 else v100$1)), $$RB[BV32_ADD(1949184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1949184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 101} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 101} _CHECK_WRITE_$$RB(true, BV32_ADD(1949184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v101$2, (if FLT32(1621981420bv32, v100$2) then 1621981420bv32 else v100$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1949184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v101$1, (if FLT32(1621981420bv32, v100$1) then 1621981420bv32 else v100$1));
    $$RB[BV32_ADD(1949184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v101$2, (if FLT32(1621981420bv32, v100$2) then 1621981420bv32 else v100$2));
    havoc v102$1, v102$2;
    havoc v103$1, v103$2;
    havoc v104$1, v104$2;
    havoc v105$1, v105$2;
    v106$1 := FMUL32(FMUL32(v102$1, v103$1), FDIV32(1065353216bv32, FMUL32(v104$1, v105$1)));
    v106$2 := FMUL32(FMUL32(v102$2, v103$2), FDIV32(1065353216bv32, FMUL32(v104$2, v105$2)));
    havoc v107$1, v107$2;
    call {:sourceloc} {:sourceloc_num 107} _LOG_WRITE_$$RB(true, BV32_ADD(1963008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v107$1, (if FLT32(1621981420bv32, v106$1) then 1621981420bv32 else v106$1)), $$RB[BV32_ADD(1963008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1963008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 107} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 107} _CHECK_WRITE_$$RB(true, BV32_ADD(1963008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v107$2, (if FLT32(1621981420bv32, v106$2) then 1621981420bv32 else v106$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1963008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v107$1, (if FLT32(1621981420bv32, v106$1) then 1621981420bv32 else v106$1));
    $$RB[BV32_ADD(1963008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v107$2, (if FLT32(1621981420bv32, v106$2) then 1621981420bv32 else v106$2));
    havoc v108$1, v108$2;
    havoc v109$1, v109$2;
    havoc v110$1, v110$2;
    havoc v111$1, v111$2;
    v112$1 := FMUL32(FMUL32(v108$1, v109$1), FDIV32(1065353216bv32, FMUL32(v110$1, v111$1)));
    v112$2 := FMUL32(FMUL32(v108$2, v109$2), FDIV32(1065353216bv32, FMUL32(v110$2, v111$2)));
    havoc v113$1, v113$2;
    call {:sourceloc} {:sourceloc_num 113} _LOG_WRITE_$$RB(true, BV32_ADD(1976832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v113$1, (if FLT32(1621981420bv32, v112$1) then 1621981420bv32 else v112$1)), $$RB[BV32_ADD(1976832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1976832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 113} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 113} _CHECK_WRITE_$$RB(true, BV32_ADD(1976832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v113$2, (if FLT32(1621981420bv32, v112$2) then 1621981420bv32 else v112$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1976832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v113$1, (if FLT32(1621981420bv32, v112$1) then 1621981420bv32 else v112$1));
    $$RB[BV32_ADD(1976832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v113$2, (if FLT32(1621981420bv32, v112$2) then 1621981420bv32 else v112$2));
    havoc v114$1, v114$2;
    havoc v115$1, v115$2;
    havoc v116$1, v116$2;
    v117$1 := FMUL32(FMUL32(FMUL32(v114$1, v115$1), v1$1), FDIV32(1065353216bv32, v116$1));
    v117$2 := FMUL32(FMUL32(FMUL32(v114$2, v115$2), v1$2), FDIV32(1065353216bv32, v116$2));
    havoc v118$1, v118$2;
    call {:sourceloc} {:sourceloc_num 118} _LOG_WRITE_$$RB(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v118$1, (if FLT32(1621981420bv32, v117$1) then 1621981420bv32 else v117$1)), $$RB[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 118} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 118} _CHECK_WRITE_$$RB(true, BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v118$2, (if FLT32(1621981420bv32, v117$2) then 1621981420bv32 else v117$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v118$1, (if FLT32(1621981420bv32, v117$1) then 1621981420bv32 else v117$1));
    $$RB[BV32_ADD(1990656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v118$2, (if FLT32(1621981420bv32, v117$2) then 1621981420bv32 else v117$2));
    havoc v119$1, v119$2;
    havoc v120$1, v120$2;
    havoc v121$1, v121$2;
    havoc v122$1, v122$2;
    v123$1 := FMUL32(FMUL32(v119$1, v120$1), FDIV32(1065353216bv32, FMUL32(v121$1, v122$1)));
    v123$2 := FMUL32(FMUL32(v119$2, v120$2), FDIV32(1065353216bv32, FMUL32(v121$2, v122$2)));
    havoc v124$1, v124$2;
    call {:sourceloc} {:sourceloc_num 124} _LOG_WRITE_$$RB(true, BV32_ADD(2004480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v124$1, (if FLT32(1621981420bv32, v123$1) then 1621981420bv32 else v123$1)), $$RB[BV32_ADD(2004480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(2004480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 124} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 124} _CHECK_WRITE_$$RB(true, BV32_ADD(2004480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v124$2, (if FLT32(1621981420bv32, v123$2) then 1621981420bv32 else v123$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(2004480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v124$1, (if FLT32(1621981420bv32, v123$1) then 1621981420bv32 else v123$1));
    $$RB[BV32_ADD(2004480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v124$2, (if FLT32(1621981420bv32, v123$2) then 1621981420bv32 else v123$2));
    havoc v125$1, v125$2;
    havoc v126$1, v126$2;
    havoc v127$1, v127$2;
    v128$1 := FMUL32(v125$1, FDIV32(1065353216bv32, FMUL32(FMUL32(v126$1, v127$1), v1$1)));
    v128$2 := FMUL32(v125$2, FDIV32(1065353216bv32, FMUL32(FMUL32(v126$2, v127$2), v1$2)));
    havoc v129$1, v129$2;
    call {:sourceloc} {:sourceloc_num 129} _LOG_WRITE_$$RB(true, BV32_ADD(2018304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v129$1, (if FLT32(1621981420bv32, v128$1) then 1621981420bv32 else v128$1)), $$RB[BV32_ADD(2018304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(2018304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 129} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 129} _CHECK_WRITE_$$RB(true, BV32_ADD(2018304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v129$2, (if FLT32(1621981420bv32, v128$2) then 1621981420bv32 else v128$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(2018304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v129$1, (if FLT32(1621981420bv32, v128$1) then 1621981420bv32 else v128$1));
    $$RB[BV32_ADD(2018304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v129$2, (if FLT32(1621981420bv32, v128$2) then 1621981420bv32 else v128$2));
    havoc v130$1, v130$2;
    havoc v131$1, v131$2;
    havoc v132$1, v132$2;
    v133$1 := FMUL32(FMUL32(FMUL32(v130$1, v131$1), v1$1), FDIV32(1065353216bv32, v132$1));
    v133$2 := FMUL32(FMUL32(FMUL32(v130$2, v131$2), v1$2), FDIV32(1065353216bv32, v132$2));
    havoc v134$1, v134$2;
    call {:sourceloc} {:sourceloc_num 134} _LOG_WRITE_$$RB(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v134$1, (if FLT32(1621981420bv32, v133$1) then 1621981420bv32 else v133$1)), $$RB[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 134} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 134} _CHECK_WRITE_$$RB(true, BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v134$2, (if FLT32(1621981420bv32, v133$2) then 1621981420bv32 else v133$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v134$1, (if FLT32(1621981420bv32, v133$1) then 1621981420bv32 else v133$1));
    $$RB[BV32_ADD(2032128bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v134$2, (if FLT32(1621981420bv32, v133$2) then 1621981420bv32 else v133$2));
    havoc v135$1, v135$2;
    havoc v136$1, v136$2;
    havoc v137$1, v137$2;
    havoc v138$1, v138$2;
    v139$1 := FMUL32(FMUL32(v135$1, v136$1), FDIV32(1065353216bv32, FMUL32(v137$1, v138$1)));
    v139$2 := FMUL32(FMUL32(v135$2, v136$2), FDIV32(1065353216bv32, FMUL32(v137$2, v138$2)));
    havoc v140$1, v140$2;
    call {:sourceloc} {:sourceloc_num 140} _LOG_WRITE_$$RB(true, BV32_ADD(2045952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v140$1, (if FLT32(1621981420bv32, v139$1) then 1621981420bv32 else v139$1)), $$RB[BV32_ADD(2045952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(2045952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 140} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 140} _CHECK_WRITE_$$RB(true, BV32_ADD(2045952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v140$2, (if FLT32(1621981420bv32, v139$2) then 1621981420bv32 else v139$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(2045952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v140$1, (if FLT32(1621981420bv32, v139$1) then 1621981420bv32 else v139$1));
    $$RB[BV32_ADD(2045952bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v140$2, (if FLT32(1621981420bv32, v139$2) then 1621981420bv32 else v139$2));
    havoc v141$1, v141$2;
    havoc v142$1, v142$2;
    havoc v143$1, v143$2;
    havoc v144$1, v144$2;
    v145$1 := FMUL32(FMUL32(v141$1, v142$1), FDIV32(1065353216bv32, FMUL32(v143$1, v144$1)));
    v145$2 := FMUL32(FMUL32(v141$2, v142$2), FDIV32(1065353216bv32, FMUL32(v143$2, v144$2)));
    havoc v146$1, v146$2;
    call {:sourceloc} {:sourceloc_num 146} _LOG_WRITE_$$RB(true, BV32_ADD(2059776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32(v146$1, (if FLT32(1621981420bv32, v145$1) then 1621981420bv32 else v145$1)), $$RB[BV32_ADD(2059776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$RB(true, BV32_ADD(2059776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 146} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 146} _CHECK_WRITE_$$RB(true, BV32_ADD(2059776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32(v146$2, (if FLT32(1621981420bv32, v145$2) then 1621981420bv32 else v145$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$RB"} true;
    $$RB[BV32_ADD(2059776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32(v146$1, (if FLT32(1621981420bv32, v145$1) then 1621981420bv32 else v145$1));
    $$RB[BV32_ADD(2059776bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32(v146$2, (if FLT32(1621981420bv32, v145$2) then 1621981420bv32 else v145$2));
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



const _WATCHED_VALUE_$$EG: bv32;

procedure {:inline 1} _LOG_READ_$$EG(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$EG;



implementation {:inline 1} _LOG_READ_$$EG(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$EG := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$EG == _value then true else _READ_HAS_OCCURRED_$$EG);
    return;
}



procedure _CHECK_READ_$$EG(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "EG"} {:array "$$EG"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$EG);
  requires {:source_name "EG"} {:array "$$EG"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$EG: bool;

procedure {:inline 1} _LOG_WRITE_$$EG(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$EG, _WRITE_READ_BENIGN_FLAG_$$EG;



implementation {:inline 1} _LOG_WRITE_$$EG(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$EG := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$EG == _value then true else _WRITE_HAS_OCCURRED_$$EG);
    _WRITE_READ_BENIGN_FLAG_$$EG := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$EG == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$EG);
    return;
}



procedure _CHECK_WRITE_$$EG(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "EG"} {:array "$$EG"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$EG != _value);
  requires {:source_name "EG"} {:array "$$EG"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$EG != _value);
  requires {:source_name "EG"} {:array "$$EG"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$EG(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$EG;



implementation {:inline 1} _LOG_ATOMIC_$$EG(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$EG := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$EG);
    return;
}



procedure _CHECK_ATOMIC_$$EG(_P: bool, _offset: bv32);
  requires {:source_name "EG"} {:array "$$EG"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset);
  requires {:source_name "EG"} {:array "$$EG"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$EG;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$EG(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$EG := (if _P && _WRITE_HAS_OCCURRED_$$EG && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$EG);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
