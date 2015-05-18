type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$data_in_pos"} {:global} {:elem_width 32} {:source_name "data_in_pos"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data_in_pos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data_in_pos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data_in_pos: bool;

axiom {:array_info "$$data_in_vel"} {:global} {:elem_width 32} {:source_name "data_in_vel"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data_in_vel: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data_in_vel: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data_in_vel: bool;

var {:source_name "data_out_pos"} {:global} $$data_out_pos: [bv32]bv32;

axiom {:array_info "$$data_out_pos"} {:global} {:elem_width 32} {:source_name "data_out_pos"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data_out_pos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data_out_pos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data_out_pos: bool;

var {:source_name "data_out_vel"} {:global} $$data_out_vel: [bv32]bv32;

axiom {:array_info "$$data_out_vel"} {:global} {:elem_width 32} {:source_name "data_out_vel"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data_out_vel: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data_out_vel: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data_out_vel: bool;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i2"} {:elem_width 32} {:source_name "b.i2"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i1"} {:elem_width 32} {:source_name "a.i1"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i"} {:elem_width 32} {:source_name "b.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$8"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$9"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i"} {:elem_width 32} {:source_name "a.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$10"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$11"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i2.i"} {:elem_width 32} {:source_name "a.i2.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$12"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i1.i"} {:elem_width 32} {:source_name "b.i1.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$13"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$14"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$15"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i.i"} {:elem_width 32} {:source_name "a.i.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i.i"} {:elem_width 32} {:source_name "b.i.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$my_curr_pos.i"} {:elem_width 32} {:source_name "my_curr_pos.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$other_element_old_pos.i"} {:elem_width 32} {:source_name "other_element_old_pos.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$r.i"} {:elem_width 32} {:source_name "r.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$16"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$17"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$18"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$19"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$p_pos"} {:elem_width 32} {:source_name "p_pos"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$p_vel"} {:elem_width 32} {:source_name "p_vel"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$acc"} {:elem_width 32} {:source_name "acc"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$20"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$21"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$22"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$23"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$24"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$25"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

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

function FP32_CONV64(bv32) : bv64;

function FP64_CONV32(bv64) : bv32;

function FRSQRT64(bv64) : bv64;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "simple_implementation"} {:kernel} $_Z21simple_implementationP6float4S0_S0_S0_j($num_bodies: bv32);
  requires !_READ_HAS_OCCURRED_$$data_in_pos && !_WRITE_HAS_OCCURRED_$$data_in_pos && !_ATOMIC_HAS_OCCURRED_$$data_in_pos;
  requires !_READ_HAS_OCCURRED_$$data_in_vel && !_WRITE_HAS_OCCURRED_$$data_in_vel && !_ATOMIC_HAS_OCCURRED_$$data_in_vel;
  requires !_READ_HAS_OCCURRED_$$data_out_pos && !_WRITE_HAS_OCCURRED_$$data_out_pos && !_ATOMIC_HAS_OCCURRED_$$data_out_pos;
  requires !_READ_HAS_OCCURRED_$$data_out_vel && !_WRITE_HAS_OCCURRED_$$data_out_vel && !_ATOMIC_HAS_OCCURRED_$$data_out_vel;
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
  modifies _WRITE_HAS_OCCURRED_$$data_out_pos, _WRITE_READ_BENIGN_FLAG_$$data_out_pos, _WRITE_READ_BENIGN_FLAG_$$data_out_pos, _WRITE_HAS_OCCURRED_$$data_out_vel, _WRITE_READ_BENIGN_FLAG_$$data_out_vel, _WRITE_READ_BENIGN_FLAG_$$data_out_vel, _READ_HAS_OCCURRED_$$data_out_vel;



implementation {:source_name "simple_implementation"} {:kernel} $_Z21simple_implementationP6float4S0_S0_S0_j($num_bodies: bv32)
{
  var $j.0: bv32;
  var v27$1: bv32;
  var v27$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v28$1: bv32;
  var v28$2: bv32;
  var v29$1: bv32;
  var v29$2: bv32;
  var v31$1: bv32;
  var v31$2: bv32;
  var v32$1: bv32;
  var v32$2: bv32;
  var v30$1: bv32;
  var v30$2: bv32;
  var v33$1: bv32;
  var v33$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
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
  var v9: bool;
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
  var v53$1: bv32;
  var v53$2: bv32;
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
  var v67$1: bv32;
  var v67$2: bv32;
  var v66$1: bv32;
  var v66$2: bv32;
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
  var v144$1: bv32;
  var v144$2: bv32;
  var v145$1: bv32;
  var v145$2: bv32;
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
  var v143$1: bv32;
  var v143$2: bv32;
  var v142$1: bv32;
  var v142$2: bv32;
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
  var v155$1: bv32;
  var v155$2: bv32;
  var v154$1: bv32;
  var v154$2: bv32;
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
  var v195$1: bv32;
  var v195$2: bv32;
  var v194$1: bv32;
  var v194$2: bv32;
  var v196$1: bv32;
  var v196$2: bv32;
  var v197$1: bv32;
  var v197$2: bv32;
  var v198$1: bv32;
  var v198$2: bv32;
  var v199$1: bv32;
  var v199$2: bv32;
  var v200$1: bv32;
  var v200$2: bv32;
  var v201$1: bv32;
  var v201$2: bv32;
  var v202$1: bv32;
  var v202$2: bv32;
  var v203$1: bv32;
  var v203$2: bv32;
  var v204$1: bv32;
  var v204$2: bv32;
  var v205$1: bv32;
  var v205$2: bv32;
  var v206$1: bv32;
  var v206$2: bv32;
  var v207$1: bv32;
  var v207$2: bv32;
  var v208$1: bv32;
  var v208$2: bv32;
  var v209$1: bv32;
  var v209$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    havoc v1$1, v1$2;
    $$p_pos$0bv32$1 := v1$1;
    $$p_pos$0bv32$2 := v1$2;
    havoc v2$1, v2$2;
    $$p_pos$1bv32$1 := v2$1;
    $$p_pos$1bv32$2 := v2$2;
    havoc v3$1, v3$2;
    $$p_pos$2bv32$1 := v3$1;
    $$p_pos$2bv32$2 := v3$2;
    havoc v4$1, v4$2;
    $$p_pos$3bv32$1 := v4$1;
    $$p_pos$3bv32$2 := v4$2;
    havoc v5$1, v5$2;
    $$p_vel$0bv32$1 := v5$1;
    $$p_vel$0bv32$2 := v5$2;
    havoc v6$1, v6$2;
    $$p_vel$1bv32$1 := v6$1;
    $$p_vel$1bv32$2 := v6$2;
    havoc v7$1, v7$2;
    $$p_vel$2bv32$1 := v7$1;
    $$p_vel$2bv32$2 := v7$2;
    havoc v8$1, v8$2;
    $$p_vel$3bv32$1 := v8$1;
    $$p_vel$3bv32$2 := v8$2;
    $$acc$0bv32$1 := 0bv32;
    $$acc$0bv32$2 := 0bv32;
    $$acc$1bv32$1 := 0bv32;
    $$acc$1bv32$2 := 0bv32;
    $$acc$2bv32$1 := 0bv32;
    $$acc$2bv32$2 := 0bv32;
    $$acc$3bv32$1 := 0bv32;
    $$acc$3bv32$2 := 0bv32;
    $j.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 21} true;
    v9 := BV32_ULT($j.0, $num_bodies);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v9 && !v9;
    v106$1 := $$acc$0bv32$1;
    v106$2 := $$acc$0bv32$2;
    $$23$0bv32$1 := v106$1;
    $$23$0bv32$2 := v106$2;
    v107$1 := $$acc$1bv32$1;
    v107$2 := $$acc$1bv32$2;
    $$23$1bv32$1 := v107$1;
    $$23$1bv32$2 := v107$2;
    v108$1 := $$acc$2bv32$1;
    v108$2 := $$acc$2bv32$2;
    $$23$2bv32$1 := v108$1;
    $$23$2bv32$2 := v108$2;
    v109$1 := $$acc$3bv32$1;
    v109$2 := $$acc$3bv32$2;
    $$23$3bv32$1 := v109$1;
    $$23$3bv32$2 := v109$2;
    v110$1 := $$23$0bv32$1;
    v110$2 := $$23$0bv32$2;
    v111$1 := $$23$1bv32$1;
    v111$2 := $$23$1bv32$2;
    v112$1 := $$23$2bv32$1;
    v112$2 := $$23$2bv32$2;
    v113$1 := $$23$3bv32$1;
    v113$2 := $$23$3bv32$2;
    $$a.i$0bv32$1 := v110$1;
    $$a.i$0bv32$2 := v110$2;
    $$a.i$1bv32$1 := v111$1;
    $$a.i$1bv32$2 := v111$2;
    $$a.i$2bv32$1 := v112$1;
    $$a.i$2bv32$2 := v112$2;
    $$a.i$3bv32$1 := v113$1;
    $$a.i$3bv32$2 := v113$2;
    v114$1 := $$a.i$0bv32$1;
    v114$2 := $$a.i$0bv32$2;
    v115$1 := $$a.i$1bv32$1;
    v115$2 := $$a.i$1bv32$2;
    v116$1 := $$a.i$2bv32$1;
    v116$2 := $$a.i$2bv32$2;
    v117$1 := $$a.i$3bv32$1;
    v117$2 := $$a.i$3bv32$2;
    $$8$0bv32$1 := FMUL32(v114$1, 1036831949bv32);
    $$8$0bv32$2 := FMUL32(v114$2, 1036831949bv32);
    $$8$1bv32$1 := FMUL32(v115$1, 1036831949bv32);
    $$8$1bv32$2 := FMUL32(v115$2, 1036831949bv32);
    $$8$2bv32$1 := FMUL32(v116$1, 1036831949bv32);
    $$8$2bv32$2 := FMUL32(v116$2, 1036831949bv32);
    $$8$3bv32$1 := FMUL32(v117$1, 1036831949bv32);
    $$8$3bv32$2 := FMUL32(v117$2, 1036831949bv32);
    v118$1 := $$8$0bv32$1;
    v118$2 := $$8$0bv32$2;
    v119$1 := $$8$1bv32$1;
    v119$2 := $$8$1bv32$2;
    v120$1 := $$8$2bv32$1;
    v120$2 := $$8$2bv32$2;
    v121$1 := $$8$3bv32$1;
    v121$2 := $$8$3bv32$2;
    $$9$0bv32$1 := v118$1;
    $$9$0bv32$2 := v118$2;
    $$9$1bv32$1 := v119$1;
    $$9$1bv32$2 := v119$2;
    $$9$2bv32$1 := v120$1;
    $$9$2bv32$2 := v120$2;
    $$9$3bv32$1 := v121$1;
    $$9$3bv32$2 := v121$2;
    v122$1 := $$9$0bv32$1;
    v122$2 := $$9$0bv32$2;
    v123$1 := $$9$1bv32$1;
    v123$2 := $$9$1bv32$2;
    v124$1 := $$9$2bv32$1;
    v124$2 := $$9$2bv32$2;
    v125$1 := $$9$3bv32$1;
    v125$2 := $$9$3bv32$2;
    $$22$0bv32$1 := v122$1;
    $$22$0bv32$2 := v122$2;
    $$22$1bv32$1 := v123$1;
    $$22$1bv32$2 := v123$2;
    $$22$2bv32$1 := v124$1;
    $$22$2bv32$2 := v124$2;
    $$22$3bv32$1 := v125$1;
    $$22$3bv32$2 := v125$2;
    v126$1 := $$22$0bv32$1;
    v126$2 := $$22$0bv32$2;
    v127$1 := $$22$1bv32$1;
    v127$2 := $$22$1bv32$2;
    v128$1 := $$22$2bv32$1;
    v128$2 := $$22$2bv32$2;
    v129$1 := $$22$3bv32$1;
    v129$2 := $$22$3bv32$2;
    $$b.i2$0bv32$1 := v126$1;
    $$b.i2$0bv32$2 := v126$2;
    $$b.i2$1bv32$1 := v127$1;
    $$b.i2$1bv32$2 := v127$2;
    $$b.i2$2bv32$1 := v128$1;
    $$b.i2$2bv32$2 := v128$2;
    $$b.i2$3bv32$1 := v129$1;
    $$b.i2$3bv32$2 := v129$2;
    v130$1 := $$p_vel$0bv32$1;
    v130$2 := $$p_vel$0bv32$2;
    v131$1 := $$b.i2$0bv32$1;
    v131$2 := $$b.i2$0bv32$2;
    v132$1 := $$p_vel$1bv32$1;
    v132$2 := $$p_vel$1bv32$2;
    v133$1 := $$b.i2$1bv32$1;
    v133$2 := $$b.i2$1bv32$2;
    v134$1 := $$p_vel$2bv32$1;
    v134$2 := $$p_vel$2bv32$2;
    v135$1 := $$b.i2$2bv32$1;
    v135$2 := $$b.i2$2bv32$2;
    v136$1 := $$p_vel$3bv32$1;
    v136$2 := $$p_vel$3bv32$2;
    v137$1 := $$b.i2$3bv32$1;
    v137$2 := $$b.i2$3bv32$2;
    $$0$0bv32$1 := FADD32(v130$1, v131$1);
    $$0$0bv32$2 := FADD32(v130$2, v131$2);
    $$0$1bv32$1 := FADD32(v132$1, v133$1);
    $$0$1bv32$2 := FADD32(v132$2, v133$2);
    $$0$2bv32$1 := FADD32(v134$1, v135$1);
    $$0$2bv32$2 := FADD32(v134$2, v135$2);
    $$0$3bv32$1 := FADD32(v136$1, v137$1);
    $$0$3bv32$2 := FADD32(v136$2, v137$2);
    v138$1 := $$0$0bv32$1;
    v138$2 := $$0$0bv32$2;
    v139$1 := $$0$1bv32$1;
    v139$2 := $$0$1bv32$2;
    v140$1 := $$0$2bv32$1;
    v140$2 := $$0$2bv32$2;
    v141$1 := $$0$3bv32$1;
    v141$2 := $$0$3bv32$2;
    $$1$0bv32$1 := v138$1;
    $$1$0bv32$2 := v138$2;
    $$1$1bv32$1 := v139$1;
    $$1$1bv32$2 := v139$2;
    $$1$2bv32$1 := v140$1;
    $$1$2bv32$2 := v140$2;
    $$1$3bv32$1 := v141$1;
    $$1$3bv32$2 := v141$2;
    v142$1 := $$1$0bv32$1;
    v142$2 := $$1$0bv32$2;
    $$p_vel$0bv32$1 := v142$1;
    $$p_vel$0bv32$2 := v142$2;
    v143$1 := $$1$1bv32$1;
    v143$2 := $$1$1bv32$2;
    $$p_vel$1bv32$1 := v143$1;
    $$p_vel$1bv32$2 := v143$2;
    v144$1 := $$1$2bv32$1;
    v144$2 := $$1$2bv32$2;
    $$p_vel$2bv32$1 := v144$1;
    $$p_vel$2bv32$2 := v144$2;
    v145$1 := $$1$3bv32$1;
    v145$2 := $$1$3bv32$2;
    $$p_vel$3bv32$1 := v145$1;
    $$p_vel$3bv32$2 := v145$2;
    v146$1 := $$p_vel$0bv32$1;
    v146$2 := $$p_vel$0bv32$2;
    v147$1 := $$p_vel$1bv32$1;
    v147$2 := $$p_vel$1bv32$2;
    v148$1 := $$p_vel$2bv32$1;
    v148$2 := $$p_vel$2bv32$2;
    v149$1 := $$p_vel$3bv32$1;
    v149$2 := $$p_vel$3bv32$2;
    $$2$0bv32$1 := FMUL32(v146$1, 1065353216bv32);
    $$2$0bv32$2 := FMUL32(v146$2, 1065353216bv32);
    $$2$1bv32$1 := FMUL32(v147$1, 1065353216bv32);
    $$2$1bv32$2 := FMUL32(v147$2, 1065353216bv32);
    $$2$2bv32$1 := FMUL32(v148$1, 1065353216bv32);
    $$2$2bv32$2 := FMUL32(v148$2, 1065353216bv32);
    $$2$3bv32$1 := FMUL32(v149$1, 1065353216bv32);
    $$2$3bv32$2 := FMUL32(v149$2, 1065353216bv32);
    v150$1 := $$2$0bv32$1;
    v150$2 := $$2$0bv32$2;
    v151$1 := $$2$1bv32$1;
    v151$2 := $$2$1bv32$2;
    v152$1 := $$2$2bv32$1;
    v152$2 := $$2$2bv32$2;
    v153$1 := $$2$3bv32$1;
    v153$2 := $$2$3bv32$2;
    $$3$0bv32$1 := v150$1;
    $$3$0bv32$2 := v150$2;
    $$3$1bv32$1 := v151$1;
    $$3$1bv32$2 := v151$2;
    $$3$2bv32$1 := v152$1;
    $$3$2bv32$2 := v152$2;
    $$3$3bv32$1 := v153$1;
    $$3$3bv32$2 := v153$2;
    v154$1 := $$3$0bv32$1;
    v154$2 := $$3$0bv32$2;
    $$p_vel$0bv32$1 := v154$1;
    $$p_vel$0bv32$2 := v154$2;
    v155$1 := $$3$1bv32$1;
    v155$2 := $$3$1bv32$2;
    $$p_vel$1bv32$1 := v155$1;
    $$p_vel$1bv32$2 := v155$2;
    v156$1 := $$3$2bv32$1;
    v156$2 := $$3$2bv32$2;
    $$p_vel$2bv32$1 := v156$1;
    $$p_vel$2bv32$2 := v156$2;
    v157$1 := $$3$3bv32$1;
    v157$2 := $$3$3bv32$2;
    $$p_vel$3bv32$1 := v157$1;
    $$p_vel$3bv32$2 := v157$2;
    v158$1 := $$p_vel$0bv32$1;
    v158$2 := $$p_vel$0bv32$2;
    $$25$0bv32$1 := v158$1;
    $$25$0bv32$2 := v158$2;
    v159$1 := $$p_vel$1bv32$1;
    v159$2 := $$p_vel$1bv32$2;
    $$25$1bv32$1 := v159$1;
    $$25$1bv32$2 := v159$2;
    v160$1 := $$p_vel$2bv32$1;
    v160$2 := $$p_vel$2bv32$2;
    $$25$2bv32$1 := v160$1;
    $$25$2bv32$2 := v160$2;
    v161$1 := $$p_vel$3bv32$1;
    v161$2 := $$p_vel$3bv32$2;
    $$25$3bv32$1 := v161$1;
    $$25$3bv32$2 := v161$2;
    v162$1 := $$25$0bv32$1;
    v162$2 := $$25$0bv32$2;
    v163$1 := $$25$1bv32$1;
    v163$2 := $$25$1bv32$2;
    v164$1 := $$25$2bv32$1;
    v164$2 := $$25$2bv32$2;
    v165$1 := $$25$3bv32$1;
    v165$2 := $$25$3bv32$2;
    $$a.i1$0bv32$1 := v162$1;
    $$a.i1$0bv32$2 := v162$2;
    $$a.i1$1bv32$1 := v163$1;
    $$a.i1$1bv32$2 := v163$2;
    $$a.i1$2bv32$1 := v164$1;
    $$a.i1$2bv32$2 := v164$2;
    $$a.i1$3bv32$1 := v165$1;
    $$a.i1$3bv32$2 := v165$2;
    v166$1 := $$a.i1$0bv32$1;
    v166$2 := $$a.i1$0bv32$2;
    v167$1 := $$a.i1$1bv32$1;
    v167$2 := $$a.i1$1bv32$2;
    v168$1 := $$a.i1$2bv32$1;
    v168$2 := $$a.i1$2bv32$2;
    v169$1 := $$a.i1$3bv32$1;
    v169$2 := $$a.i1$3bv32$2;
    $$4$0bv32$1 := FMUL32(v166$1, 1036831949bv32);
    $$4$0bv32$2 := FMUL32(v166$2, 1036831949bv32);
    $$4$1bv32$1 := FMUL32(v167$1, 1036831949bv32);
    $$4$1bv32$2 := FMUL32(v167$2, 1036831949bv32);
    $$4$2bv32$1 := FMUL32(v168$1, 1036831949bv32);
    $$4$2bv32$2 := FMUL32(v168$2, 1036831949bv32);
    $$4$3bv32$1 := FMUL32(v169$1, 1036831949bv32);
    $$4$3bv32$2 := FMUL32(v169$2, 1036831949bv32);
    v170$1 := $$4$0bv32$1;
    v170$2 := $$4$0bv32$2;
    v171$1 := $$4$1bv32$1;
    v171$2 := $$4$1bv32$2;
    v172$1 := $$4$2bv32$1;
    v172$2 := $$4$2bv32$2;
    v173$1 := $$4$3bv32$1;
    v173$2 := $$4$3bv32$2;
    $$5$0bv32$1 := v170$1;
    $$5$0bv32$2 := v170$2;
    $$5$1bv32$1 := v171$1;
    $$5$1bv32$2 := v171$2;
    $$5$2bv32$1 := v172$1;
    $$5$2bv32$2 := v172$2;
    $$5$3bv32$1 := v173$1;
    $$5$3bv32$2 := v173$2;
    v174$1 := $$5$0bv32$1;
    v174$2 := $$5$0bv32$2;
    v175$1 := $$5$1bv32$1;
    v175$2 := $$5$1bv32$2;
    v176$1 := $$5$2bv32$1;
    v176$2 := $$5$2bv32$2;
    v177$1 := $$5$3bv32$1;
    v177$2 := $$5$3bv32$2;
    $$24$0bv32$1 := v174$1;
    $$24$0bv32$2 := v174$2;
    $$24$1bv32$1 := v175$1;
    $$24$1bv32$2 := v175$2;
    $$24$2bv32$1 := v176$1;
    $$24$2bv32$2 := v176$2;
    $$24$3bv32$1 := v177$1;
    $$24$3bv32$2 := v177$2;
    v178$1 := $$24$0bv32$1;
    v178$2 := $$24$0bv32$2;
    v179$1 := $$24$1bv32$1;
    v179$2 := $$24$1bv32$2;
    v180$1 := $$24$2bv32$1;
    v180$2 := $$24$2bv32$2;
    v181$1 := $$24$3bv32$1;
    v181$2 := $$24$3bv32$2;
    $$b.i$0bv32$1 := v178$1;
    $$b.i$0bv32$2 := v178$2;
    $$b.i$1bv32$1 := v179$1;
    $$b.i$1bv32$2 := v179$2;
    $$b.i$2bv32$1 := v180$1;
    $$b.i$2bv32$2 := v180$2;
    $$b.i$3bv32$1 := v181$1;
    $$b.i$3bv32$2 := v181$2;
    v182$1 := $$p_pos$0bv32$1;
    v182$2 := $$p_pos$0bv32$2;
    v183$1 := $$b.i$0bv32$1;
    v183$2 := $$b.i$0bv32$2;
    v184$1 := $$p_pos$1bv32$1;
    v184$2 := $$p_pos$1bv32$2;
    v185$1 := $$b.i$1bv32$1;
    v185$2 := $$b.i$1bv32$2;
    v186$1 := $$p_pos$2bv32$1;
    v186$2 := $$p_pos$2bv32$2;
    v187$1 := $$b.i$2bv32$1;
    v187$2 := $$b.i$2bv32$2;
    v188$1 := $$p_pos$3bv32$1;
    v188$2 := $$p_pos$3bv32$2;
    v189$1 := $$b.i$3bv32$1;
    v189$2 := $$b.i$3bv32$2;
    $$6$0bv32$1 := FADD32(v182$1, v183$1);
    $$6$0bv32$2 := FADD32(v182$2, v183$2);
    $$6$1bv32$1 := FADD32(v184$1, v185$1);
    $$6$1bv32$2 := FADD32(v184$2, v185$2);
    $$6$2bv32$1 := FADD32(v186$1, v187$1);
    $$6$2bv32$2 := FADD32(v186$2, v187$2);
    $$6$3bv32$1 := FADD32(v188$1, v189$1);
    $$6$3bv32$2 := FADD32(v188$2, v189$2);
    v190$1 := $$6$0bv32$1;
    v190$2 := $$6$0bv32$2;
    v191$1 := $$6$1bv32$1;
    v191$2 := $$6$1bv32$2;
    v192$1 := $$6$2bv32$1;
    v192$2 := $$6$2bv32$2;
    v193$1 := $$6$3bv32$1;
    v193$2 := $$6$3bv32$2;
    $$7$0bv32$1 := v190$1;
    $$7$0bv32$2 := v190$2;
    $$7$1bv32$1 := v191$1;
    $$7$1bv32$2 := v191$2;
    $$7$2bv32$1 := v192$1;
    $$7$2bv32$2 := v192$2;
    $$7$3bv32$1 := v193$1;
    $$7$3bv32$2 := v193$2;
    v194$1 := $$7$0bv32$1;
    v194$2 := $$7$0bv32$2;
    $$p_pos$0bv32$1 := v194$1;
    $$p_pos$0bv32$2 := v194$2;
    v195$1 := $$7$1bv32$1;
    v195$2 := $$7$1bv32$2;
    $$p_pos$1bv32$1 := v195$1;
    $$p_pos$1bv32$2 := v195$2;
    v196$1 := $$7$2bv32$1;
    v196$2 := $$7$2bv32$2;
    $$p_pos$2bv32$1 := v196$1;
    $$p_pos$2bv32$2 := v196$2;
    v197$1 := $$7$3bv32$1;
    v197$2 := $$7$3bv32$2;
    $$p_pos$3bv32$1 := v197$1;
    $$p_pos$3bv32$2 := v197$2;
    v198$1 := $$p_pos$0bv32$1;
    v198$2 := $$p_pos$0bv32$2;
    call {:sourceloc} {:sourceloc_num 376} _LOG_WRITE_$$data_out_pos(true, BV32_MUL(v0$1, 4bv32), v198$1, $$data_out_pos[BV32_MUL(v0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_pos(true, BV32_MUL(v0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 376} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 376} _CHECK_WRITE_$$data_out_pos(true, BV32_MUL(v0$2, 4bv32), v198$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_pos"} true;
    $$data_out_pos[BV32_MUL(v0$1, 4bv32)] := v198$1;
    $$data_out_pos[BV32_MUL(v0$2, 4bv32)] := v198$2;
    v199$1 := $$p_pos$1bv32$1;
    v199$2 := $$p_pos$1bv32$2;
    call {:sourceloc} {:sourceloc_num 378} _LOG_WRITE_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32), v199$1, $$data_out_pos[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 378} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 378} _CHECK_WRITE_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32), v199$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_pos"} true;
    $$data_out_pos[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)] := v199$1;
    $$data_out_pos[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)] := v199$2;
    v200$1 := $$p_pos$2bv32$1;
    v200$2 := $$p_pos$2bv32$2;
    call {:sourceloc} {:sourceloc_num 380} _LOG_WRITE_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32), v200$1, $$data_out_pos[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 380} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 380} _CHECK_WRITE_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32), v200$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_pos"} true;
    $$data_out_pos[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)] := v200$1;
    $$data_out_pos[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)] := v200$2;
    v201$1 := $$p_pos$3bv32$1;
    v201$2 := $$p_pos$3bv32$2;
    call {:sourceloc} {:sourceloc_num 382} _LOG_WRITE_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32), v201$1, $$data_out_pos[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 382} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 382} _CHECK_WRITE_$$data_out_pos(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32), v201$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_pos"} true;
    $$data_out_pos[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)] := v201$1;
    $$data_out_pos[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)] := v201$2;
    v202$1 := $$p_vel$0bv32$1;
    v202$2 := $$p_vel$0bv32$2;
    call {:sourceloc} {:sourceloc_num 384} _LOG_WRITE_$$data_out_vel(true, BV32_MUL(v0$1, 4bv32), v202$1, $$data_out_vel[BV32_MUL(v0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(true, BV32_MUL(v0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 384} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 384} _CHECK_WRITE_$$data_out_vel(true, BV32_MUL(v0$2, 4bv32), v202$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_vel"} true;
    $$data_out_vel[BV32_MUL(v0$1, 4bv32)] := v202$1;
    $$data_out_vel[BV32_MUL(v0$2, 4bv32)] := v202$2;
    v203$1 := $$p_vel$1bv32$1;
    v203$2 := $$p_vel$1bv32$2;
    call {:sourceloc} {:sourceloc_num 386} _LOG_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32), v203$1, $$data_out_vel[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 386} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 386} _CHECK_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32), v203$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_vel"} true;
    $$data_out_vel[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)] := v203$1;
    $$data_out_vel[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)] := v203$2;
    v204$1 := $$p_vel$2bv32$1;
    v204$2 := $$p_vel$2bv32$2;
    call {:sourceloc} {:sourceloc_num 388} _LOG_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32), v204$1, $$data_out_vel[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 388} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 388} _CHECK_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32), v204$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_vel"} true;
    $$data_out_vel[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)] := v204$1;
    $$data_out_vel[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)] := v204$2;
    v205$1 := $$p_vel$3bv32$1;
    v205$2 := $$p_vel$3bv32$2;
    call {:sourceloc} {:sourceloc_num 390} _LOG_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32), v205$1, $$data_out_vel[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 390} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 390} _CHECK_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32), v205$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_vel"} true;
    $$data_out_vel[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)] := v205$1;
    $$data_out_vel[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)] := v205$2;
    call {:sourceloc} {:sourceloc_num 391} _LOG_READ_$$data_out_vel(true, BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), $$data_out_vel[BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 391} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 391} _CHECK_READ_$$data_out_vel(true, BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), $$data_out_vel[BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data_out_vel"} true;
    v206$1 := $$data_out_vel[BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32)];
    v206$2 := $$data_out_vel[BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32)];
    call {:sourceloc} {:sourceloc_num 392} _LOG_WRITE_$$data_out_vel(true, BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), v206$1, $$data_out_vel[BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(true, BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 392} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 392} _CHECK_WRITE_$$data_out_vel(true, BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), v206$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_vel"} true;
    $$data_out_vel[BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32)] := v206$1;
    $$data_out_vel[BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32)] := v206$2;
    call {:sourceloc} {:sourceloc_num 393} _LOG_READ_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 1bv32), $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 393} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 393} _CHECK_READ_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 1bv32), $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data_out_vel"} true;
    v207$1 := $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 1bv32)];
    v207$2 := $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 394} _LOG_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 1bv32), v207$1, $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 394} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 394} _CHECK_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 1bv32), v207$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_vel"} true;
    $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 1bv32)] := v207$1;
    $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 1bv32)] := v207$2;
    call {:sourceloc} {:sourceloc_num 395} _LOG_READ_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 2bv32), $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 395} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 395} _CHECK_READ_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 2bv32), $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data_out_vel"} true;
    v208$1 := $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 2bv32)];
    v208$2 := $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 396} _LOG_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 2bv32), v208$1, $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 396} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 396} _CHECK_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 2bv32), v208$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_vel"} true;
    $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 2bv32)] := v208$1;
    $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 2bv32)] := v208$2;
    call {:sourceloc} {:sourceloc_num 397} _LOG_READ_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 3bv32), $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 397} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 397} _CHECK_READ_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 3bv32), $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data_out_vel"} true;
    v209$1 := $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 3bv32)];
    v209$2 := $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 398} _LOG_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 3bv32), v209$1, $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 398} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 398} _CHECK_WRITE_$$data_out_vel(true, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 3bv32), v209$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data_out_vel"} true;
    $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, 1bv32), 4bv32), 3bv32)] := v209$1;
    $$data_out_vel[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, 1bv32), 4bv32), 3bv32)] := v209$2;
    return;

  $truebb:
    assume {:partition} v9 && v9;
    v10$1 := $$p_pos$0bv32$1;
    v10$2 := $$p_pos$0bv32$2;
    $$20$0bv32$1 := v10$1;
    $$20$0bv32$2 := v10$2;
    v11$1 := $$p_pos$1bv32$1;
    v11$2 := $$p_pos$1bv32$2;
    $$20$1bv32$1 := v11$1;
    $$20$1bv32$2 := v11$2;
    v12$1 := $$p_pos$2bv32$1;
    v12$2 := $$p_pos$2bv32$2;
    $$20$2bv32$1 := v12$1;
    $$20$2bv32$2 := v12$2;
    v13$1 := $$p_pos$3bv32$1;
    v13$2 := $$p_pos$3bv32$2;
    $$20$3bv32$1 := v13$1;
    $$20$3bv32$2 := v13$2;
    havoc v14$1, v14$2;
    $$21$0bv32$1 := v14$1;
    $$21$0bv32$2 := v14$2;
    havoc v15$1, v15$2;
    $$21$1bv32$1 := v15$1;
    $$21$1bv32$2 := v15$2;
    havoc v16$1, v16$2;
    $$21$2bv32$1 := v16$1;
    $$21$2bv32$2 := v16$2;
    havoc v17$1, v17$2;
    $$21$3bv32$1 := v17$1;
    $$21$3bv32$2 := v17$2;
    v18$1 := $$20$0bv32$1;
    v18$2 := $$20$0bv32$2;
    v19$1 := $$20$1bv32$1;
    v19$2 := $$20$1bv32$2;
    v20$1 := $$20$2bv32$1;
    v20$2 := $$20$2bv32$2;
    v21$1 := $$20$3bv32$1;
    v21$2 := $$20$3bv32$2;
    v22$1 := $$21$0bv32$1;
    v22$2 := $$21$0bv32$2;
    v23$1 := $$21$1bv32$1;
    v23$2 := $$21$1bv32$2;
    v24$1 := $$21$2bv32$1;
    v24$2 := $$21$2bv32$2;
    v25$1 := $$21$3bv32$1;
    v25$2 := $$21$3bv32$2;
    $$my_curr_pos.i$0bv32$1 := v18$1;
    $$my_curr_pos.i$0bv32$2 := v18$2;
    $$my_curr_pos.i$1bv32$1 := v19$1;
    $$my_curr_pos.i$1bv32$2 := v19$2;
    $$my_curr_pos.i$2bv32$1 := v20$1;
    $$my_curr_pos.i$2bv32$2 := v20$2;
    $$my_curr_pos.i$3bv32$1 := v21$1;
    $$my_curr_pos.i$3bv32$2 := v21$2;
    $$other_element_old_pos.i$0bv32$1 := v22$1;
    $$other_element_old_pos.i$0bv32$2 := v22$2;
    $$other_element_old_pos.i$1bv32$1 := v23$1;
    $$other_element_old_pos.i$1bv32$2 := v23$2;
    $$other_element_old_pos.i$2bv32$1 := v24$1;
    $$other_element_old_pos.i$2bv32$2 := v24$2;
    $$other_element_old_pos.i$3bv32$1 := v25$1;
    $$other_element_old_pos.i$3bv32$2 := v25$2;
    v26$1 := $$other_element_old_pos.i$0bv32$1;
    v26$2 := $$other_element_old_pos.i$0bv32$2;
    $$16$0bv32$1 := v26$1;
    $$16$0bv32$2 := v26$2;
    v27$1 := $$other_element_old_pos.i$1bv32$1;
    v27$2 := $$other_element_old_pos.i$1bv32$2;
    $$16$1bv32$1 := v27$1;
    $$16$1bv32$2 := v27$2;
    v28$1 := $$other_element_old_pos.i$2bv32$1;
    v28$2 := $$other_element_old_pos.i$2bv32$2;
    $$16$2bv32$1 := v28$1;
    $$16$2bv32$2 := v28$2;
    v29$1 := $$other_element_old_pos.i$3bv32$1;
    v29$2 := $$other_element_old_pos.i$3bv32$2;
    $$16$3bv32$1 := v29$1;
    $$16$3bv32$2 := v29$2;
    v30$1 := $$my_curr_pos.i$0bv32$1;
    v30$2 := $$my_curr_pos.i$0bv32$2;
    $$17$0bv32$1 := v30$1;
    $$17$0bv32$2 := v30$2;
    v31$1 := $$my_curr_pos.i$1bv32$1;
    v31$2 := $$my_curr_pos.i$1bv32$2;
    $$17$1bv32$1 := v31$1;
    $$17$1bv32$2 := v31$2;
    v32$1 := $$my_curr_pos.i$2bv32$1;
    v32$2 := $$my_curr_pos.i$2bv32$2;
    $$17$2bv32$1 := v32$1;
    $$17$2bv32$2 := v32$2;
    v33$1 := $$my_curr_pos.i$3bv32$1;
    v33$2 := $$my_curr_pos.i$3bv32$2;
    $$17$3bv32$1 := v33$1;
    $$17$3bv32$2 := v33$2;
    v34$1 := $$16$0bv32$1;
    v34$2 := $$16$0bv32$2;
    v35$1 := $$16$1bv32$1;
    v35$2 := $$16$1bv32$2;
    v36$1 := $$16$2bv32$1;
    v36$2 := $$16$2bv32$2;
    v37$1 := $$16$3bv32$1;
    v37$2 := $$16$3bv32$2;
    v38$1 := $$17$0bv32$1;
    v38$2 := $$17$0bv32$2;
    v39$1 := $$17$1bv32$1;
    v39$2 := $$17$1bv32$2;
    v40$1 := $$17$2bv32$1;
    v40$2 := $$17$2bv32$2;
    v41$1 := $$17$3bv32$1;
    v41$2 := $$17$3bv32$2;
    $$a.i.i$0bv32$1 := v34$1;
    $$a.i.i$0bv32$2 := v34$2;
    $$a.i.i$1bv32$1 := v35$1;
    $$a.i.i$1bv32$2 := v35$2;
    $$a.i.i$2bv32$1 := v36$1;
    $$a.i.i$2bv32$2 := v36$2;
    $$a.i.i$3bv32$1 := v37$1;
    $$a.i.i$3bv32$2 := v37$2;
    $$b.i.i$0bv32$1 := v38$1;
    $$b.i.i$0bv32$2 := v38$2;
    $$b.i.i$1bv32$1 := v39$1;
    $$b.i.i$1bv32$2 := v39$2;
    $$b.i.i$2bv32$1 := v40$1;
    $$b.i.i$2bv32$2 := v40$2;
    $$b.i.i$3bv32$1 := v41$1;
    $$b.i.i$3bv32$2 := v41$2;
    v42$1 := $$a.i.i$0bv32$1;
    v42$2 := $$a.i.i$0bv32$2;
    v43$1 := $$b.i.i$0bv32$1;
    v43$2 := $$b.i.i$0bv32$2;
    v44$1 := $$a.i.i$1bv32$1;
    v44$2 := $$a.i.i$1bv32$2;
    v45$1 := $$b.i.i$1bv32$1;
    v45$2 := $$b.i.i$1bv32$2;
    v46$1 := $$a.i.i$2bv32$1;
    v46$2 := $$a.i.i$2bv32$2;
    v47$1 := $$b.i.i$2bv32$1;
    v47$2 := $$b.i.i$2bv32$2;
    v48$1 := $$a.i.i$3bv32$1;
    v48$2 := $$a.i.i$3bv32$2;
    v49$1 := $$b.i.i$3bv32$1;
    v49$2 := $$b.i.i$3bv32$2;
    $$14$0bv32$1 := FSUB32(v42$1, v43$1);
    $$14$0bv32$2 := FSUB32(v42$2, v43$2);
    $$14$1bv32$1 := FSUB32(v44$1, v45$1);
    $$14$1bv32$2 := FSUB32(v44$2, v45$2);
    $$14$2bv32$1 := FSUB32(v46$1, v47$1);
    $$14$2bv32$2 := FSUB32(v46$2, v47$2);
    $$14$3bv32$1 := FSUB32(v48$1, v49$1);
    $$14$3bv32$2 := FSUB32(v48$2, v49$2);
    v50$1 := $$14$0bv32$1;
    v50$2 := $$14$0bv32$2;
    v51$1 := $$14$1bv32$1;
    v51$2 := $$14$1bv32$2;
    v52$1 := $$14$2bv32$1;
    v52$2 := $$14$2bv32$2;
    v53$1 := $$14$3bv32$1;
    v53$2 := $$14$3bv32$2;
    $$15$0bv32$1 := v50$1;
    $$15$0bv32$2 := v50$2;
    $$15$1bv32$1 := v51$1;
    $$15$1bv32$2 := v51$2;
    $$15$2bv32$1 := v52$1;
    $$15$2bv32$2 := v52$2;
    $$15$3bv32$1 := v53$1;
    $$15$3bv32$2 := v53$2;
    v54$1 := $$15$0bv32$1;
    v54$2 := $$15$0bv32$2;
    v55$1 := $$15$1bv32$1;
    v55$2 := $$15$1bv32$2;
    v56$1 := $$15$2bv32$1;
    v56$2 := $$15$2bv32$2;
    v57$1 := $$15$3bv32$1;
    v57$2 := $$15$3bv32$2;
    $$r.i$0bv32$1 := v54$1;
    $$r.i$0bv32$2 := v54$2;
    $$r.i$1bv32$1 := v55$1;
    $$r.i$1bv32$2 := v55$2;
    $$r.i$2bv32$1 := v56$1;
    $$r.i$2bv32$2 := v56$2;
    $$r.i$3bv32$1 := v57$1;
    $$r.i$3bv32$2 := v57$2;
    v58$1 := $$r.i$0bv32$1;
    v58$2 := $$r.i$0bv32$2;
    v59$1 := $$r.i$0bv32$1;
    v59$2 := $$r.i$0bv32$2;
    v60$1 := $$r.i$1bv32$1;
    v60$2 := $$r.i$1bv32$2;
    v61$1 := $$r.i$1bv32$1;
    v61$2 := $$r.i$1bv32$2;
    v62$1 := $$r.i$2bv32$1;
    v62$2 := $$r.i$2bv32$2;
    v63$1 := $$r.i$2bv32$1;
    v63$2 := $$r.i$2bv32$2;
    v64$1 := FP64_CONV32(FRSQRT64(FP32_CONV64(FADD32(FADD32(FADD32(FMUL32(v58$1, v59$1), FMUL32(v60$1, v61$1)), FMUL32(v62$1, v63$1)), 902936343bv32))));
    v64$2 := FP64_CONV32(FRSQRT64(FP32_CONV64(FADD32(FADD32(FADD32(FMUL32(v58$2, v59$2), FMUL32(v60$2, v61$2)), FMUL32(v62$2, v63$2)), 902936343bv32))));
    v65$1 := FMUL32(1116042691bv32, FMUL32(FMUL32(v64$1, v64$1), v64$1));
    v65$2 := FMUL32(1116042691bv32, FMUL32(FMUL32(v64$2, v64$2), v64$2));
    v66$1 := $$r.i$0bv32$1;
    v66$2 := $$r.i$0bv32$2;
    $$19$0bv32$1 := v66$1;
    $$19$0bv32$2 := v66$2;
    v67$1 := $$r.i$1bv32$1;
    v67$2 := $$r.i$1bv32$2;
    $$19$1bv32$1 := v67$1;
    $$19$1bv32$2 := v67$2;
    v68$1 := $$r.i$2bv32$1;
    v68$2 := $$r.i$2bv32$2;
    $$19$2bv32$1 := v68$1;
    $$19$2bv32$2 := v68$2;
    v69$1 := $$r.i$3bv32$1;
    v69$2 := $$r.i$3bv32$2;
    $$19$3bv32$1 := v69$1;
    $$19$3bv32$2 := v69$2;
    v70$1 := $$19$0bv32$1;
    v70$2 := $$19$0bv32$2;
    v71$1 := $$19$1bv32$1;
    v71$2 := $$19$1bv32$2;
    v72$1 := $$19$2bv32$1;
    v72$2 := $$19$2bv32$2;
    v73$1 := $$19$3bv32$1;
    v73$2 := $$19$3bv32$2;
    $$a.i2.i$0bv32$1 := v70$1;
    $$a.i2.i$0bv32$2 := v70$2;
    $$a.i2.i$1bv32$1 := v71$1;
    $$a.i2.i$1bv32$2 := v71$2;
    $$a.i2.i$2bv32$1 := v72$1;
    $$a.i2.i$2bv32$2 := v72$2;
    $$a.i2.i$3bv32$1 := v73$1;
    $$a.i2.i$3bv32$2 := v73$2;
    v74$1 := $$a.i2.i$0bv32$1;
    v74$2 := $$a.i2.i$0bv32$2;
    v75$1 := $$a.i2.i$1bv32$1;
    v75$2 := $$a.i2.i$1bv32$2;
    v76$1 := $$a.i2.i$2bv32$1;
    v76$2 := $$a.i2.i$2bv32$2;
    v77$1 := $$a.i2.i$3bv32$1;
    v77$2 := $$a.i2.i$3bv32$2;
    $$10$0bv32$1 := FMUL32(v74$1, v65$1);
    $$10$0bv32$2 := FMUL32(v74$2, v65$2);
    $$10$1bv32$1 := FMUL32(v75$1, v65$1);
    $$10$1bv32$2 := FMUL32(v75$2, v65$2);
    $$10$2bv32$1 := FMUL32(v76$1, v65$1);
    $$10$2bv32$2 := FMUL32(v76$2, v65$2);
    $$10$3bv32$1 := FMUL32(v77$1, v65$1);
    $$10$3bv32$2 := FMUL32(v77$2, v65$2);
    v78$1 := $$10$0bv32$1;
    v78$2 := $$10$0bv32$2;
    v79$1 := $$10$1bv32$1;
    v79$2 := $$10$1bv32$2;
    v80$1 := $$10$2bv32$1;
    v80$2 := $$10$2bv32$2;
    v81$1 := $$10$3bv32$1;
    v81$2 := $$10$3bv32$2;
    $$11$0bv32$1 := v78$1;
    $$11$0bv32$2 := v78$2;
    $$11$1bv32$1 := v79$1;
    $$11$1bv32$2 := v79$2;
    $$11$2bv32$1 := v80$1;
    $$11$2bv32$2 := v80$2;
    $$11$3bv32$1 := v81$1;
    $$11$3bv32$2 := v81$2;
    v82$1 := $$11$0bv32$1;
    v82$2 := $$11$0bv32$2;
    v83$1 := $$11$1bv32$1;
    v83$2 := $$11$1bv32$2;
    v84$1 := $$11$2bv32$1;
    v84$2 := $$11$2bv32$2;
    v85$1 := $$11$3bv32$1;
    v85$2 := $$11$3bv32$2;
    $$18$0bv32$1 := v82$1;
    $$18$0bv32$2 := v82$2;
    $$18$1bv32$1 := v83$1;
    $$18$1bv32$2 := v83$2;
    $$18$2bv32$1 := v84$1;
    $$18$2bv32$2 := v84$2;
    $$18$3bv32$1 := v85$1;
    $$18$3bv32$2 := v85$2;
    v86$1 := $$18$0bv32$1;
    v86$2 := $$18$0bv32$2;
    v87$1 := $$18$1bv32$1;
    v87$2 := $$18$1bv32$2;
    v88$1 := $$18$2bv32$1;
    v88$2 := $$18$2bv32$2;
    v89$1 := $$18$3bv32$1;
    v89$2 := $$18$3bv32$2;
    $$b.i1.i$0bv32$1 := v86$1;
    $$b.i1.i$0bv32$2 := v86$2;
    $$b.i1.i$1bv32$1 := v87$1;
    $$b.i1.i$1bv32$2 := v87$2;
    $$b.i1.i$2bv32$1 := v88$1;
    $$b.i1.i$2bv32$2 := v88$2;
    $$b.i1.i$3bv32$1 := v89$1;
    $$b.i1.i$3bv32$2 := v89$2;
    v90$1 := $$acc$0bv32$1;
    v90$2 := $$acc$0bv32$2;
    v91$1 := $$b.i1.i$0bv32$1;
    v91$2 := $$b.i1.i$0bv32$2;
    v92$1 := $$acc$1bv32$1;
    v92$2 := $$acc$1bv32$2;
    v93$1 := $$b.i1.i$1bv32$1;
    v93$2 := $$b.i1.i$1bv32$2;
    v94$1 := $$acc$2bv32$1;
    v94$2 := $$acc$2bv32$2;
    v95$1 := $$b.i1.i$2bv32$1;
    v95$2 := $$b.i1.i$2bv32$2;
    v96$1 := $$acc$3bv32$1;
    v96$2 := $$acc$3bv32$2;
    v97$1 := $$b.i1.i$3bv32$1;
    v97$2 := $$b.i1.i$3bv32$2;
    $$12$0bv32$1 := FADD32(v90$1, v91$1);
    $$12$0bv32$2 := FADD32(v90$2, v91$2);
    $$12$1bv32$1 := FADD32(v92$1, v93$1);
    $$12$1bv32$2 := FADD32(v92$2, v93$2);
    $$12$2bv32$1 := FADD32(v94$1, v95$1);
    $$12$2bv32$2 := FADD32(v94$2, v95$2);
    $$12$3bv32$1 := FADD32(v96$1, v97$1);
    $$12$3bv32$2 := FADD32(v96$2, v97$2);
    v98$1 := $$12$0bv32$1;
    v98$2 := $$12$0bv32$2;
    v99$1 := $$12$1bv32$1;
    v99$2 := $$12$1bv32$2;
    v100$1 := $$12$2bv32$1;
    v100$2 := $$12$2bv32$2;
    v101$1 := $$12$3bv32$1;
    v101$2 := $$12$3bv32$2;
    $$13$0bv32$1 := v98$1;
    $$13$0bv32$2 := v98$2;
    $$13$1bv32$1 := v99$1;
    $$13$1bv32$2 := v99$2;
    $$13$2bv32$1 := v100$1;
    $$13$2bv32$2 := v100$2;
    $$13$3bv32$1 := v101$1;
    $$13$3bv32$2 := v101$2;
    v102$1 := $$13$0bv32$1;
    v102$2 := $$13$0bv32$2;
    $$acc$0bv32$1 := v102$1;
    $$acc$0bv32$2 := v102$2;
    v103$1 := $$13$1bv32$1;
    v103$2 := $$13$1bv32$2;
    $$acc$1bv32$1 := v103$1;
    $$acc$1bv32$2 := v103$2;
    v104$1 := $$13$2bv32$1;
    v104$2 := $$13$2bv32$2;
    $$acc$2bv32$1 := v104$1;
    $$acc$2bv32$2 := v104$2;
    v105$1 := $$13$3bv32$1;
    v105$2 := $$13$3bv32$2;
    $$acc$3bv32$1 := v105$1;
    $$acc$3bv32$2 := v105$2;
    $j.0 := BV32_ADD($j.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1024bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

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

var $$b.i2$0bv32$1: bv32;

var $$b.i2$0bv32$2: bv32;

var $$b.i2$1bv32$1: bv32;

var $$b.i2$1bv32$2: bv32;

var $$b.i2$2bv32$1: bv32;

var $$b.i2$2bv32$2: bv32;

var $$b.i2$3bv32$1: bv32;

var $$b.i2$3bv32$2: bv32;

var $$1$0bv32$1: bv32;

var $$1$0bv32$2: bv32;

var $$1$1bv32$1: bv32;

var $$1$1bv32$2: bv32;

var $$1$2bv32$1: bv32;

var $$1$2bv32$2: bv32;

var $$1$3bv32$1: bv32;

var $$1$3bv32$2: bv32;

var $$2$0bv32$1: bv32;

var $$2$0bv32$2: bv32;

var $$2$1bv32$1: bv32;

var $$2$1bv32$2: bv32;

var $$2$2bv32$1: bv32;

var $$2$2bv32$2: bv32;

var $$2$3bv32$1: bv32;

var $$2$3bv32$2: bv32;

var $$3$0bv32$1: bv32;

var $$3$0bv32$2: bv32;

var $$3$1bv32$1: bv32;

var $$3$1bv32$2: bv32;

var $$3$2bv32$1: bv32;

var $$3$2bv32$2: bv32;

var $$3$3bv32$1: bv32;

var $$3$3bv32$2: bv32;

var $$4$0bv32$1: bv32;

var $$4$0bv32$2: bv32;

var $$4$1bv32$1: bv32;

var $$4$1bv32$2: bv32;

var $$4$2bv32$1: bv32;

var $$4$2bv32$2: bv32;

var $$4$3bv32$1: bv32;

var $$4$3bv32$2: bv32;

var $$5$0bv32$1: bv32;

var $$5$0bv32$2: bv32;

var $$5$1bv32$1: bv32;

var $$5$1bv32$2: bv32;

var $$5$2bv32$1: bv32;

var $$5$2bv32$2: bv32;

var $$5$3bv32$1: bv32;

var $$5$3bv32$2: bv32;

var $$a.i1$0bv32$1: bv32;

var $$a.i1$0bv32$2: bv32;

var $$a.i1$1bv32$1: bv32;

var $$a.i1$1bv32$2: bv32;

var $$a.i1$2bv32$1: bv32;

var $$a.i1$2bv32$2: bv32;

var $$a.i1$3bv32$1: bv32;

var $$a.i1$3bv32$2: bv32;

var $$6$0bv32$1: bv32;

var $$6$0bv32$2: bv32;

var $$6$1bv32$1: bv32;

var $$6$1bv32$2: bv32;

var $$6$2bv32$1: bv32;

var $$6$2bv32$2: bv32;

var $$6$3bv32$1: bv32;

var $$6$3bv32$2: bv32;

var $$b.i$0bv32$1: bv32;

var $$b.i$0bv32$2: bv32;

var $$b.i$1bv32$1: bv32;

var $$b.i$1bv32$2: bv32;

var $$b.i$2bv32$1: bv32;

var $$b.i$2bv32$2: bv32;

var $$b.i$3bv32$1: bv32;

var $$b.i$3bv32$2: bv32;

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

var $$9$0bv32$1: bv32;

var $$9$0bv32$2: bv32;

var $$9$1bv32$1: bv32;

var $$9$1bv32$2: bv32;

var $$9$2bv32$1: bv32;

var $$9$2bv32$2: bv32;

var $$9$3bv32$1: bv32;

var $$9$3bv32$2: bv32;

var $$a.i$0bv32$1: bv32;

var $$a.i$0bv32$2: bv32;

var $$a.i$1bv32$1: bv32;

var $$a.i$1bv32$2: bv32;

var $$a.i$2bv32$1: bv32;

var $$a.i$2bv32$2: bv32;

var $$a.i$3bv32$1: bv32;

var $$a.i$3bv32$2: bv32;

var $$10$0bv32$1: bv32;

var $$10$0bv32$2: bv32;

var $$10$1bv32$1: bv32;

var $$10$1bv32$2: bv32;

var $$10$2bv32$1: bv32;

var $$10$2bv32$2: bv32;

var $$10$3bv32$1: bv32;

var $$10$3bv32$2: bv32;

var $$11$0bv32$1: bv32;

var $$11$0bv32$2: bv32;

var $$11$1bv32$1: bv32;

var $$11$1bv32$2: bv32;

var $$11$2bv32$1: bv32;

var $$11$2bv32$2: bv32;

var $$11$3bv32$1: bv32;

var $$11$3bv32$2: bv32;

var $$a.i2.i$0bv32$1: bv32;

var $$a.i2.i$0bv32$2: bv32;

var $$a.i2.i$1bv32$1: bv32;

var $$a.i2.i$1bv32$2: bv32;

var $$a.i2.i$2bv32$1: bv32;

var $$a.i2.i$2bv32$2: bv32;

var $$a.i2.i$3bv32$1: bv32;

var $$a.i2.i$3bv32$2: bv32;

var $$12$0bv32$1: bv32;

var $$12$0bv32$2: bv32;

var $$12$1bv32$1: bv32;

var $$12$1bv32$2: bv32;

var $$12$2bv32$1: bv32;

var $$12$2bv32$2: bv32;

var $$12$3bv32$1: bv32;

var $$12$3bv32$2: bv32;

var $$b.i1.i$0bv32$1: bv32;

var $$b.i1.i$0bv32$2: bv32;

var $$b.i1.i$1bv32$1: bv32;

var $$b.i1.i$1bv32$2: bv32;

var $$b.i1.i$2bv32$1: bv32;

var $$b.i1.i$2bv32$2: bv32;

var $$b.i1.i$3bv32$1: bv32;

var $$b.i1.i$3bv32$2: bv32;

var $$13$0bv32$1: bv32;

var $$13$0bv32$2: bv32;

var $$13$1bv32$1: bv32;

var $$13$1bv32$2: bv32;

var $$13$2bv32$1: bv32;

var $$13$2bv32$2: bv32;

var $$13$3bv32$1: bv32;

var $$13$3bv32$2: bv32;

var $$14$0bv32$1: bv32;

var $$14$0bv32$2: bv32;

var $$14$1bv32$1: bv32;

var $$14$1bv32$2: bv32;

var $$14$2bv32$1: bv32;

var $$14$2bv32$2: bv32;

var $$14$3bv32$1: bv32;

var $$14$3bv32$2: bv32;

var $$15$0bv32$1: bv32;

var $$15$0bv32$2: bv32;

var $$15$1bv32$1: bv32;

var $$15$1bv32$2: bv32;

var $$15$2bv32$1: bv32;

var $$15$2bv32$2: bv32;

var $$15$3bv32$1: bv32;

var $$15$3bv32$2: bv32;

var $$a.i.i$0bv32$1: bv32;

var $$a.i.i$0bv32$2: bv32;

var $$a.i.i$1bv32$1: bv32;

var $$a.i.i$1bv32$2: bv32;

var $$a.i.i$2bv32$1: bv32;

var $$a.i.i$2bv32$2: bv32;

var $$a.i.i$3bv32$1: bv32;

var $$a.i.i$3bv32$2: bv32;

var $$b.i.i$0bv32$1: bv32;

var $$b.i.i$0bv32$2: bv32;

var $$b.i.i$1bv32$1: bv32;

var $$b.i.i$1bv32$2: bv32;

var $$b.i.i$2bv32$1: bv32;

var $$b.i.i$2bv32$2: bv32;

var $$b.i.i$3bv32$1: bv32;

var $$b.i.i$3bv32$2: bv32;

var $$my_curr_pos.i$0bv32$1: bv32;

var $$my_curr_pos.i$0bv32$2: bv32;

var $$my_curr_pos.i$1bv32$1: bv32;

var $$my_curr_pos.i$1bv32$2: bv32;

var $$my_curr_pos.i$2bv32$1: bv32;

var $$my_curr_pos.i$2bv32$2: bv32;

var $$my_curr_pos.i$3bv32$1: bv32;

var $$my_curr_pos.i$3bv32$2: bv32;

var $$other_element_old_pos.i$0bv32$1: bv32;

var $$other_element_old_pos.i$0bv32$2: bv32;

var $$other_element_old_pos.i$1bv32$1: bv32;

var $$other_element_old_pos.i$1bv32$2: bv32;

var $$other_element_old_pos.i$2bv32$1: bv32;

var $$other_element_old_pos.i$2bv32$2: bv32;

var $$other_element_old_pos.i$3bv32$1: bv32;

var $$other_element_old_pos.i$3bv32$2: bv32;

var $$r.i$0bv32$1: bv32;

var $$r.i$0bv32$2: bv32;

var $$r.i$1bv32$1: bv32;

var $$r.i$1bv32$2: bv32;

var $$r.i$2bv32$1: bv32;

var $$r.i$2bv32$2: bv32;

var $$r.i$3bv32$1: bv32;

var $$r.i$3bv32$2: bv32;

var $$16$0bv32$1: bv32;

var $$16$0bv32$2: bv32;

var $$16$1bv32$1: bv32;

var $$16$1bv32$2: bv32;

var $$16$2bv32$1: bv32;

var $$16$2bv32$2: bv32;

var $$16$3bv32$1: bv32;

var $$16$3bv32$2: bv32;

var $$17$0bv32$1: bv32;

var $$17$0bv32$2: bv32;

var $$17$1bv32$1: bv32;

var $$17$1bv32$2: bv32;

var $$17$2bv32$1: bv32;

var $$17$2bv32$2: bv32;

var $$17$3bv32$1: bv32;

var $$17$3bv32$2: bv32;

var $$18$0bv32$1: bv32;

var $$18$0bv32$2: bv32;

var $$18$1bv32$1: bv32;

var $$18$1bv32$2: bv32;

var $$18$2bv32$1: bv32;

var $$18$2bv32$2: bv32;

var $$18$3bv32$1: bv32;

var $$18$3bv32$2: bv32;

var $$19$0bv32$1: bv32;

var $$19$0bv32$2: bv32;

var $$19$1bv32$1: bv32;

var $$19$1bv32$2: bv32;

var $$19$2bv32$1: bv32;

var $$19$2bv32$2: bv32;

var $$19$3bv32$1: bv32;

var $$19$3bv32$2: bv32;

var $$p_pos$0bv32$1: bv32;

var $$p_pos$0bv32$2: bv32;

var $$p_pos$1bv32$1: bv32;

var $$p_pos$1bv32$2: bv32;

var $$p_pos$2bv32$1: bv32;

var $$p_pos$2bv32$2: bv32;

var $$p_pos$3bv32$1: bv32;

var $$p_pos$3bv32$2: bv32;

var $$p_vel$0bv32$1: bv32;

var $$p_vel$0bv32$2: bv32;

var $$p_vel$1bv32$1: bv32;

var $$p_vel$1bv32$2: bv32;

var $$p_vel$2bv32$1: bv32;

var $$p_vel$2bv32$2: bv32;

var $$p_vel$3bv32$1: bv32;

var $$p_vel$3bv32$2: bv32;

var $$acc$0bv32$1: bv32;

var $$acc$0bv32$2: bv32;

var $$acc$1bv32$1: bv32;

var $$acc$1bv32$2: bv32;

var $$acc$2bv32$1: bv32;

var $$acc$2bv32$2: bv32;

var $$acc$3bv32$1: bv32;

var $$acc$3bv32$2: bv32;

var $$20$0bv32$1: bv32;

var $$20$0bv32$2: bv32;

var $$20$1bv32$1: bv32;

var $$20$1bv32$2: bv32;

var $$20$2bv32$1: bv32;

var $$20$2bv32$2: bv32;

var $$20$3bv32$1: bv32;

var $$20$3bv32$2: bv32;

var $$21$0bv32$1: bv32;

var $$21$0bv32$2: bv32;

var $$21$1bv32$1: bv32;

var $$21$1bv32$2: bv32;

var $$21$2bv32$1: bv32;

var $$21$2bv32$2: bv32;

var $$21$3bv32$1: bv32;

var $$21$3bv32$2: bv32;

var $$22$0bv32$1: bv32;

var $$22$0bv32$2: bv32;

var $$22$1bv32$1: bv32;

var $$22$1bv32$2: bv32;

var $$22$2bv32$1: bv32;

var $$22$2bv32$2: bv32;

var $$22$3bv32$1: bv32;

var $$22$3bv32$2: bv32;

var $$23$0bv32$1: bv32;

var $$23$0bv32$2: bv32;

var $$23$1bv32$1: bv32;

var $$23$1bv32$2: bv32;

var $$23$2bv32$1: bv32;

var $$23$2bv32$2: bv32;

var $$23$3bv32$1: bv32;

var $$23$3bv32$2: bv32;

var $$24$0bv32$1: bv32;

var $$24$0bv32$2: bv32;

var $$24$1bv32$1: bv32;

var $$24$1bv32$2: bv32;

var $$24$2bv32$1: bv32;

var $$24$2bv32$2: bv32;

var $$24$3bv32$1: bv32;

var $$24$3bv32$2: bv32;

var $$25$0bv32$1: bv32;

var $$25$0bv32$2: bv32;

var $$25$1bv32$1: bv32;

var $$25$1bv32$2: bv32;

var $$25$2bv32$1: bv32;

var $$25$2bv32$2: bv32;

var $$25$3bv32$1: bv32;

var $$25$3bv32$2: bv32;

const _WATCHED_VALUE_$$data_in_pos: bv32;

procedure {:inline 1} _LOG_READ_$$data_in_pos(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data_in_pos;



implementation {:inline 1} _LOG_READ_$$data_in_pos(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data_in_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_pos == _value then true else _READ_HAS_OCCURRED_$$data_in_pos);
    return;
}



procedure _CHECK_READ_$$data_in_pos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_in_pos"} {:array "$$data_in_pos"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data_in_pos);
  requires {:source_name "data_in_pos"} {:array "$$data_in_pos"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data_in_pos: bool;

procedure {:inline 1} _LOG_WRITE_$$data_in_pos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data_in_pos, _WRITE_READ_BENIGN_FLAG_$$data_in_pos;



implementation {:inline 1} _LOG_WRITE_$$data_in_pos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data_in_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_pos == _value then true else _WRITE_HAS_OCCURRED_$$data_in_pos);
    _WRITE_READ_BENIGN_FLAG_$$data_in_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_pos == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data_in_pos);
    return;
}



procedure _CHECK_WRITE_$$data_in_pos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_in_pos"} {:array "$$data_in_pos"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_pos != _value);
  requires {:source_name "data_in_pos"} {:array "$$data_in_pos"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_pos != _value);
  requires {:source_name "data_in_pos"} {:array "$$data_in_pos"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data_in_pos(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data_in_pos;



implementation {:inline 1} _LOG_ATOMIC_$$data_in_pos(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data_in_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data_in_pos);
    return;
}



procedure _CHECK_ATOMIC_$$data_in_pos(_P: bool, _offset: bv32);
  requires {:source_name "data_in_pos"} {:array "$$data_in_pos"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset);
  requires {:source_name "data_in_pos"} {:array "$$data_in_pos"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_in_pos(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data_in_pos;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_in_pos(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data_in_pos := (if _P && _WRITE_HAS_OCCURRED_$$data_in_pos && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data_in_pos);
    return;
}



const _WATCHED_VALUE_$$data_in_vel: bv32;

procedure {:inline 1} _LOG_READ_$$data_in_vel(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data_in_vel;



implementation {:inline 1} _LOG_READ_$$data_in_vel(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data_in_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_vel == _value then true else _READ_HAS_OCCURRED_$$data_in_vel);
    return;
}



procedure _CHECK_READ_$$data_in_vel(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_in_vel"} {:array "$$data_in_vel"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data_in_vel);
  requires {:source_name "data_in_vel"} {:array "$$data_in_vel"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data_in_vel: bool;

procedure {:inline 1} _LOG_WRITE_$$data_in_vel(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data_in_vel, _WRITE_READ_BENIGN_FLAG_$$data_in_vel;



implementation {:inline 1} _LOG_WRITE_$$data_in_vel(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data_in_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_vel == _value then true else _WRITE_HAS_OCCURRED_$$data_in_vel);
    _WRITE_READ_BENIGN_FLAG_$$data_in_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_vel == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data_in_vel);
    return;
}



procedure _CHECK_WRITE_$$data_in_vel(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_in_vel"} {:array "$$data_in_vel"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_vel != _value);
  requires {:source_name "data_in_vel"} {:array "$$data_in_vel"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_in_vel != _value);
  requires {:source_name "data_in_vel"} {:array "$$data_in_vel"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data_in_vel(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data_in_vel;



implementation {:inline 1} _LOG_ATOMIC_$$data_in_vel(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data_in_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data_in_vel);
    return;
}



procedure _CHECK_ATOMIC_$$data_in_vel(_P: bool, _offset: bv32);
  requires {:source_name "data_in_vel"} {:array "$$data_in_vel"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset);
  requires {:source_name "data_in_vel"} {:array "$$data_in_vel"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_in_vel(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data_in_vel;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_in_vel(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data_in_vel := (if _P && _WRITE_HAS_OCCURRED_$$data_in_vel && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data_in_vel);
    return;
}



const _WATCHED_VALUE_$$data_out_pos: bv32;

procedure {:inline 1} _LOG_READ_$$data_out_pos(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data_out_pos;



implementation {:inline 1} _LOG_READ_$$data_out_pos(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data_out_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_pos == _value then true else _READ_HAS_OCCURRED_$$data_out_pos);
    return;
}



procedure _CHECK_READ_$$data_out_pos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_out_pos"} {:array "$$data_out_pos"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data_out_pos);
  requires {:source_name "data_out_pos"} {:array "$$data_out_pos"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data_out_pos: bool;

procedure {:inline 1} _LOG_WRITE_$$data_out_pos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data_out_pos, _WRITE_READ_BENIGN_FLAG_$$data_out_pos;



implementation {:inline 1} _LOG_WRITE_$$data_out_pos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data_out_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_pos == _value then true else _WRITE_HAS_OCCURRED_$$data_out_pos);
    _WRITE_READ_BENIGN_FLAG_$$data_out_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_pos == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data_out_pos);
    return;
}



procedure _CHECK_WRITE_$$data_out_pos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_out_pos"} {:array "$$data_out_pos"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_pos != _value);
  requires {:source_name "data_out_pos"} {:array "$$data_out_pos"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_pos != _value);
  requires {:source_name "data_out_pos"} {:array "$$data_out_pos"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data_out_pos(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data_out_pos;



implementation {:inline 1} _LOG_ATOMIC_$$data_out_pos(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data_out_pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data_out_pos);
    return;
}



procedure _CHECK_ATOMIC_$$data_out_pos(_P: bool, _offset: bv32);
  requires {:source_name "data_out_pos"} {:array "$$data_out_pos"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset);
  requires {:source_name "data_out_pos"} {:array "$$data_out_pos"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_pos(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data_out_pos;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_pos(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data_out_pos := (if _P && _WRITE_HAS_OCCURRED_$$data_out_pos && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data_out_pos);
    return;
}



const _WATCHED_VALUE_$$data_out_vel: bv32;

procedure {:inline 1} _LOG_READ_$$data_out_vel(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data_out_vel;



implementation {:inline 1} _LOG_READ_$$data_out_vel(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data_out_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_vel == _value then true else _READ_HAS_OCCURRED_$$data_out_vel);
    return;
}



procedure _CHECK_READ_$$data_out_vel(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_out_vel"} {:array "$$data_out_vel"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data_out_vel);
  requires {:source_name "data_out_vel"} {:array "$$data_out_vel"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data_out_vel: bool;

procedure {:inline 1} _LOG_WRITE_$$data_out_vel(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data_out_vel, _WRITE_READ_BENIGN_FLAG_$$data_out_vel;



implementation {:inline 1} _LOG_WRITE_$$data_out_vel(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data_out_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_vel == _value then true else _WRITE_HAS_OCCURRED_$$data_out_vel);
    _WRITE_READ_BENIGN_FLAG_$$data_out_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_vel == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data_out_vel);
    return;
}



procedure _CHECK_WRITE_$$data_out_vel(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data_out_vel"} {:array "$$data_out_vel"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_vel != _value);
  requires {:source_name "data_out_vel"} {:array "$$data_out_vel"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data_out_vel != _value);
  requires {:source_name "data_out_vel"} {:array "$$data_out_vel"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data_out_vel(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data_out_vel;



implementation {:inline 1} _LOG_ATOMIC_$$data_out_vel(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data_out_vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data_out_vel);
    return;
}



procedure _CHECK_ATOMIC_$$data_out_vel(_P: bool, _offset: bv32);
  requires {:source_name "data_out_vel"} {:array "$$data_out_vel"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset);
  requires {:source_name "data_out_vel"} {:array "$$data_out_vel"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data_out_vel;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data_out_vel(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data_out_vel := (if _P && _WRITE_HAS_OCCURRED_$$data_out_vel && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data_out_vel);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
