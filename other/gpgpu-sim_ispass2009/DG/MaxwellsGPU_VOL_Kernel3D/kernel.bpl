type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "g_rhsQ"} {:global} $$g_rhsQ: [bv32]bv32;

axiom {:array_info "$$g_rhsQ"} {:global} {:elem_width 32} {:source_name "g_rhsQ"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$g_rhsQ: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$g_rhsQ: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$g_rhsQ: bool;

axiom {:array_info "$$0"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$D"} {:elem_width 32} {:source_name "D"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 8} {:source_name ""} {:source_elem_width 192} {:source_dimensions "1"} true;

axiom {:array_info "$$8"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$9"} {:elem_width 8} {:source_name ""} {:source_elem_width 192} {:source_dimensions "1"} true;

axiom {:array_info "$$10"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$11"} {:elem_width 8} {:source_name ""} {:source_elem_width 192} {:source_dimensions "1"} true;

axiom {:array_info "$$t_Q"} {:global} {:elem_width 8} {:source_name "t_Q"} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$t_Q: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$t_Q: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$t_Q: bool;

var {:source_name "s_Q"} {:group_shared} $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} {:group_shared} {:elem_width 32} {:source_name "s_Q"} {:source_elem_width 32} {:source_dimensions "576"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q: bool;

axiom {:array_info "$$t_vgeo"} {:global} {:elem_width 8} {:source_name "t_vgeo"} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$t_vgeo: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$t_vgeo: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$t_vgeo: bool;

var {:source_name "s_facs"} {:group_shared} $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} {:group_shared} {:elem_width 32} {:source_name "s_facs"} {:source_elem_width 32} {:source_dimensions "12"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs: bool;

axiom {:array_info "$$t_DrDsDt"} {:global} {:elem_width 8} {:source_name "t_DrDsDt"} {:source_elem_width 192} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 192} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$t_DrDsDt: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 192} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$t_DrDsDt: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 192} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$t_DrDsDt: bool;

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

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "MaxwellsGPU_VOL_Kernel3D"} {:kernel} $_Z24MaxwellsGPU_VOL_Kernel3DPf();
  requires !_READ_HAS_OCCURRED_$$g_rhsQ && !_WRITE_HAS_OCCURRED_$$g_rhsQ && !_ATOMIC_HAS_OCCURRED_$$g_rhsQ;
  requires !_READ_HAS_OCCURRED_$$t_Q && !_WRITE_HAS_OCCURRED_$$t_Q && !_ATOMIC_HAS_OCCURRED_$$t_Q;
  requires !_READ_HAS_OCCURRED_$$t_vgeo && !_WRITE_HAS_OCCURRED_$$t_vgeo && !_ATOMIC_HAS_OCCURRED_$$t_vgeo;
  requires !_READ_HAS_OCCURRED_$$t_DrDsDt && !_WRITE_HAS_OCCURRED_$$t_DrDsDt && !_ATOMIC_HAS_OCCURRED_$$t_DrDsDt;
  requires !_READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q && !_WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q && !_ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q;
  requires !_READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs && !_WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs && !_ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs;
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
  modifies $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs, _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q, _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q, _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q, _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs, _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs, _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs, $$g_rhsQ, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs, _WRITE_HAS_OCCURRED_$$g_rhsQ, _WRITE_READ_BENIGN_FLAG_$$g_rhsQ, _WRITE_READ_BENIGN_FLAG_$$g_rhsQ, _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q;



implementation {:source_name "MaxwellsGPU_VOL_Kernel3D"} {:kernel} $_Z24MaxwellsGPU_VOL_Kernel3DPf()
{
  var $dEydt.0$1: bv32;
  var $dEydt.0$2: bv32;
  var $dEyds.0$1: bv32;
  var $dEyds.0$2: bv32;
  var $dEydr.0$1: bv32;
  var $dEydr.0$2: bv32;
  var $dExdt.0$1: bv32;
  var $dExdt.0$2: bv32;
  var $dExds.0$1: bv32;
  var $dExds.0$2: bv32;
  var $dExdr.0$1: bv32;
  var $dExdr.0$2: bv32;
  var $dHzdt.0$1: bv32;
  var $dHzdt.0$2: bv32;
  var $dHzds.0$1: bv32;
  var $dHzds.0$2: bv32;
  var $dHzdr.0$1: bv32;
  var $dHzdr.0$2: bv32;
  var $dHydt.0$1: bv32;
  var $dHydt.0$2: bv32;
  var $dHyds.0$1: bv32;
  var $dHyds.0$2: bv32;
  var $dHydr.0$1: bv32;
  var $dHydr.0$2: bv32;
  var $dHxdt.0$1: bv32;
  var $dHxdt.0$2: bv32;
  var $dHxds.0$1: bv32;
  var $dHxds.0$2: bv32;
  var $dHxdr.0$1: bv32;
  var $dHxdr.0$2: bv32;
  var $m.0: bv32;
  var $dEzdr.0$1: bv32;
  var $dEzdr.0$2: bv32;
  var $dEzds.0$1: bv32;
  var $dEzds.0$2: bv32;
  var $dEzdt.0$1: bv32;
  var $dEzdt.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v9$1: bv8;
  var v9$2: bv8;
  var v1$1: bv8;
  var v1$2: bv8;
  var v2$1: bv8;
  var v2$2: bv8;
  var v3$1: bv8;
  var v3$2: bv8;
  var v4$1: bv8;
  var v4$2: bv8;
  var v5$1: bv8;
  var v5$2: bv8;
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v8$1: bv8;
  var v8$2: bv8;
  var v28$1: bv8;
  var v28$2: bv8;
  var v29$1: bv8;
  var v29$2: bv8;
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
  var v15$1: bv8;
  var v15$2: bv8;
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
  var v25$1: bv32;
  var v25$2: bv32;
  var v27$1: bv8;
  var v27$2: bv8;
  var v26$1: bv8;
  var v26$2: bv8;
  var v61$1: bv8;
  var v61$2: bv8;
  var v62$1: bv8;
  var v62$2: bv8;
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
  var v50$1: bv32;
  var v50$2: bv32;
  var v60$1: bv8;
  var v60$2: bv8;
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
  var v63$1: bv8;
  var v63$2: bv8;
  var v64$1: bv8;
  var v64$2: bv8;
  var v65$1: bv8;
  var v65$2: bv8;
  var v305$1: bv32;
  var v305$2: bv32;
  var v306$1: bv32;
  var v306$2: bv32;
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
  var v75$1: bv32;
  var v75$2: bv32;
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
  var v100$1: bv32;
  var v100$2: bv32;
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
  var v125$1: bv32;
  var v125$2: bv32;
  var v126$1: bv8;
  var v126$2: bv8;
  var v127$1: bv8;
  var v127$2: bv8;
  var v128$1: bv8;
  var v128$2: bv8;
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
  var v150$1: bv32;
  var v150$2: bv32;
  var v151$1: bool;
  var v151$2: bool;
  var v152$1: bv8;
  var v152$2: bv8;
  var v153$1: bv8;
  var v153$2: bv8;
  var v154$1: bv8;
  var v154$2: bv8;
  var v155$1: bv8;
  var v155$2: bv8;
  var v160$1: bv8;
  var v160$2: bv8;
  var v156$1: bv8;
  var v156$2: bv8;
  var v157$1: bv8;
  var v157$2: bv8;
  var v158$1: bv8;
  var v158$2: bv8;
  var v159$1: bv8;
  var v159$2: bv8;
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
  var v176$1: bv32;
  var v176$2: bv32;
  var v177: bool;
  var v178$1: bv8;
  var v178$2: bv8;
  var v179$1: bv8;
  var v179$2: bv8;
  var v215$1: bv8;
  var v215$2: bv8;
  var v180$1: bv8;
  var v180$2: bv8;
  var v181$1: bv8;
  var v181$2: bv8;
  var v186$1: bv8;
  var v186$2: bv8;
  var v182$1: bv8;
  var v182$2: bv8;
  var v183$1: bv8;
  var v183$2: bv8;
  var v184$1: bv8;
  var v184$2: bv8;
  var v185$1: bv8;
  var v185$2: bv8;
  var v195$1: bv8;
  var v195$2: bv8;
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
  var v216$1: bv8;
  var v216$2: bv8;
  var v217$1: bv8;
  var v217$2: bv8;
  var v196$1: bv8;
  var v196$2: bv8;
  var v197$1: bv8;
  var v197$2: bv8;
  var v198$1: bv8;
  var v198$2: bv8;
  var v199$1: bv8;
  var v199$2: bv8;
  var v200$1: bv8;
  var v200$2: bv8;
  var v201$1: bv8;
  var v201$2: bv8;
  var v202$1: bv8;
  var v202$2: bv8;
  var v203$1: bv8;
  var v203$2: bv8;
  var v204$1: bv8;
  var v204$2: bv8;
  var v205$1: bv8;
  var v205$2: bv8;
  var v206$1: bv8;
  var v206$2: bv8;
  var v207$1: bv8;
  var v207$2: bv8;
  var v208$1: bv8;
  var v208$2: bv8;
  var v209$1: bv8;
  var v209$2: bv8;
  var v210$1: bv8;
  var v210$2: bv8;
  var v211$1: bv8;
  var v211$2: bv8;
  var v212$1: bv8;
  var v212$2: bv8;
  var v213$1: bv8;
  var v213$2: bv8;
  var v214$1: bv8;
  var v214$2: bv8;
  var v218$1: bv8;
  var v218$2: bv8;
  var v219$1: bv8;
  var v219$2: bv8;
  var v220$1: bv8;
  var v220$2: bv8;
  var v221$1: bv8;
  var v221$2: bv8;
  var v222$1: bv8;
  var v222$2: bv8;
  var v223$1: bv8;
  var v223$2: bv8;
  var v224$1: bv8;
  var v224$2: bv8;
  var v225$1: bv8;
  var v225$2: bv8;
  var v226$1: bv128;
  var v226$2: bv128;
  var v227$1: bv32;
  var v227$2: bv32;
  var v228$1: bv32;
  var v228$2: bv32;
  var v229$1: bv32;
  var v229$2: bv32;
  var v230$1: bv32;
  var v230$2: bv32;
  var v231$1: bv32;
  var v231$2: bv32;
  var v232$1: bv32;
  var v232$2: bv32;
  var v233$1: bv32;
  var v233$2: bv32;
  var v234$1: bv32;
  var v234$2: bv32;
  var v235$1: bv32;
  var v235$2: bv32;
  var v236$1: bv32;
  var v236$2: bv32;
  var v296$1: bv8;
  var v296$2: bv8;
  var v297$1: bv8;
  var v297$2: bv8;
  var v298$1: bv8;
  var v298$2: bv8;
  var v299$1: bv8;
  var v299$2: bv8;
  var v237$1: bv32;
  var v237$2: bv32;
  var v238$1: bv32;
  var v238$2: bv32;
  var v239$1: bv32;
  var v239$2: bv32;
  var v240$1: bv32;
  var v240$2: bv32;
  var v241$1: bv32;
  var v241$2: bv32;
  var v242$1: bv32;
  var v242$2: bv32;
  var v243$1: bv32;
  var v243$2: bv32;
  var v244$1: bv32;
  var v244$2: bv32;
  var v245$1: bv32;
  var v245$2: bv32;
  var v246$1: bv32;
  var v246$2: bv32;
  var v247$1: bv32;
  var v247$2: bv32;
  var v248$1: bv32;
  var v248$2: bv32;
  var v249$1: bv32;
  var v249$2: bv32;
  var v250$1: bv32;
  var v250$2: bv32;
  var v251: bv32;
  var v252$1: bv8;
  var v252$2: bv8;
  var v253$1: bv8;
  var v253$2: bv8;
  var v254$1: bv8;
  var v254$2: bv8;
  var v255$1: bv8;
  var v255$2: bv8;
  var v256$1: bv8;
  var v256$2: bv8;
  var v257$1: bv8;
  var v257$2: bv8;
  var v258$1: bv8;
  var v258$2: bv8;
  var v259$1: bv8;
  var v259$2: bv8;
  var v260$1: bv8;
  var v260$2: bv8;
  var v261$1: bv8;
  var v261$2: bv8;
  var v262$1: bv8;
  var v262$2: bv8;
  var v263$1: bv8;
  var v263$2: bv8;
  var v264$1: bv8;
  var v264$2: bv8;
  var v265$1: bv8;
  var v265$2: bv8;
  var v266$1: bv8;
  var v266$2: bv8;
  var v267$1: bv8;
  var v267$2: bv8;
  var v268$1: bv8;
  var v268$2: bv8;
  var v269$1: bv8;
  var v269$2: bv8;
  var v270$1: bv8;
  var v270$2: bv8;
  var v271$1: bv8;
  var v271$2: bv8;
  var v272$1: bv8;
  var v272$2: bv8;
  var v273$1: bv8;
  var v273$2: bv8;
  var v274$1: bv8;
  var v274$2: bv8;
  var v275$1: bv8;
  var v275$2: bv8;
  var v276$1: bv8;
  var v276$2: bv8;
  var v277$1: bv8;
  var v277$2: bv8;
  var v278$1: bv8;
  var v278$2: bv8;
  var v279$1: bv8;
  var v279$2: bv8;
  var v280$1: bv8;
  var v280$2: bv8;
  var v281$1: bv8;
  var v281$2: bv8;
  var v282$1: bv8;
  var v282$2: bv8;
  var v283$1: bv8;
  var v283$2: bv8;
  var v284$1: bv8;
  var v284$2: bv8;
  var v285$1: bv8;
  var v285$2: bv8;
  var v286$1: bv8;
  var v286$2: bv8;
  var v287$1: bv8;
  var v287$2: bv8;
  var v288$1: bv8;
  var v288$2: bv8;
  var v289$1: bv8;
  var v289$2: bv8;
  var v290$1: bv8;
  var v290$2: bv8;
  var v291$1: bv8;
  var v291$2: bv8;
  var v292$1: bv8;
  var v292$2: bv8;
  var v293$1: bv8;
  var v293$2: bv8;
  var v294$1: bv8;
  var v294$2: bv8;
  var v295$1: bv8;
  var v295$2: bv8;
  var v394$1: bv32;
  var v394$2: bv32;
  var v300$1: bv128;
  var v300$2: bv128;
  var v301$1: bv32;
  var v301$2: bv32;
  var v302$1: bv32;
  var v302$2: bv32;
  var v303$1: bv32;
  var v303$2: bv32;
  var v304$1: bv32;
  var v304$2: bv32;
  var v307$1: bv32;
  var v307$2: bv32;
  var v308$1: bv32;
  var v308$2: bv32;
  var v309$1: bv32;
  var v309$2: bv32;
  var v310$1: bv32;
  var v310$2: bv32;
  var v311$1: bv32;
  var v311$2: bv32;
  var v312$1: bv32;
  var v312$2: bv32;
  var v313$1: bv32;
  var v313$2: bv32;
  var v314$1: bv32;
  var v314$2: bv32;
  var v315$1: bv32;
  var v315$2: bv32;
  var v316$1: bv32;
  var v316$2: bv32;
  var v317$1: bv32;
  var v317$2: bv32;
  var v318$1: bv32;
  var v318$2: bv32;
  var v319$1: bv32;
  var v319$2: bv32;
  var v320$1: bv32;
  var v320$2: bv32;
  var v321$1: bv32;
  var v321$2: bv32;
  var v322$1: bv32;
  var v322$2: bv32;
  var v323$1: bv32;
  var v323$2: bv32;
  var v324$1: bv32;
  var v324$2: bv32;
  var v325$1: bv32;
  var v325$2: bv32;
  var v326$1: bv32;
  var v326$2: bv32;
  var v327$1: bv32;
  var v327$2: bv32;
  var v328$1: bv32;
  var v328$2: bv32;
  var v329: bv32;
  var v330$1: bv8;
  var v330$2: bv8;
  var v331$1: bv8;
  var v331$2: bv8;
  var v332$1: bv8;
  var v332$2: bv8;
  var v333$1: bv8;
  var v333$2: bv8;
  var v334$1: bv8;
  var v334$2: bv8;
  var v335$1: bv8;
  var v335$2: bv8;
  var v336$1: bv8;
  var v336$2: bv8;
  var v337$1: bv8;
  var v337$2: bv8;
  var v338$1: bv8;
  var v338$2: bv8;
  var v339$1: bv8;
  var v339$2: bv8;
  var v340$1: bv8;
  var v340$2: bv8;
  var v341$1: bv8;
  var v341$2: bv8;
  var v342$1: bv8;
  var v342$2: bv8;
  var v343$1: bv8;
  var v343$2: bv8;
  var v344$1: bv8;
  var v344$2: bv8;
  var v345$1: bv8;
  var v345$2: bv8;
  var v346$1: bv8;
  var v346$2: bv8;
  var v347$1: bv8;
  var v347$2: bv8;
  var v348$1: bv8;
  var v348$2: bv8;
  var v349$1: bv8;
  var v349$2: bv8;
  var v350$1: bv8;
  var v350$2: bv8;
  var v351$1: bv8;
  var v351$2: bv8;
  var v352$1: bv8;
  var v352$2: bv8;
  var v353$1: bv8;
  var v353$2: bv8;
  var v354$1: bv8;
  var v354$2: bv8;
  var v355$1: bv8;
  var v355$2: bv8;
  var v356$1: bv8;
  var v356$2: bv8;
  var v357$1: bv8;
  var v357$2: bv8;
  var v358$1: bv8;
  var v358$2: bv8;
  var v359$1: bv8;
  var v359$2: bv8;
  var v360$1: bv8;
  var v360$2: bv8;
  var v361$1: bv8;
  var v361$2: bv8;
  var v362$1: bv8;
  var v362$2: bv8;
  var v363$1: bv8;
  var v363$2: bv8;
  var v364$1: bv8;
  var v364$2: bv8;
  var v365$1: bv8;
  var v365$2: bv8;
  var v366$1: bv8;
  var v366$2: bv8;
  var v367$1: bv8;
  var v367$2: bv8;
  var v368$1: bv8;
  var v368$2: bv8;
  var v369$1: bv8;
  var v369$2: bv8;
  var v370$1: bv8;
  var v370$2: bv8;
  var v371$1: bv8;
  var v371$2: bv8;
  var v372$1: bv8;
  var v372$2: bv8;
  var v373$1: bv8;
  var v373$2: bv8;
  var v374$1: bv8;
  var v374$2: bv8;
  var v375$1: bv8;
  var v375$2: bv8;
  var v376$1: bv8;
  var v376$2: bv8;
  var v377$1: bv8;
  var v377$2: bv8;
  var v378$1: bv128;
  var v378$2: bv128;
  var v379$1: bv32;
  var v379$2: bv32;
  var v380$1: bv32;
  var v380$2: bv32;
  var v381$1: bv32;
  var v381$2: bv32;
  var v382$1: bv32;
  var v382$2: bv32;
  var v383$1: bv32;
  var v383$2: bv32;
  var v384$1: bv32;
  var v384$2: bv32;
  var v385$1: bv32;
  var v385$2: bv32;
  var v386$1: bv32;
  var v386$2: bv32;
  var v387$1: bv32;
  var v387$2: bv32;
  var v388$1: bv32;
  var v388$2: bv32;
  var v389$1: bv32;
  var v389$2: bv32;
  var v390$1: bv32;
  var v390$2: bv32;
  var v391$1: bv32;
  var v391$2: bv32;
  var v392$1: bv32;
  var v392$2: bv32;
  var v393$1: bv32;
  var v393$2: bv32;
  var v395$1: bv32;
  var v395$2: bv32;
  var v396$1: bv32;
  var v396$2: bv32;
  var v397$1: bv32;
  var v397$2: bv32;
  var v398$1: bv32;
  var v398$2: bv32;
  var v399$1: bv32;
  var v399$2: bv32;
  var v400$1: bv32;
  var v400$2: bv32;
  var v401$1: bv32;
  var v401$2: bv32;
  var v402$1: bv32;
  var v402$2: bv32;
  var v403$1: bv32;
  var v403$2: bv32;
  var v404$1: bv32;
  var v404$2: bv32;
  var v405$1: bv32;
  var v405$2: bv32;
  var v406$1: bv32;
  var v406$2: bv32;
  var v407$1: bv32;
  var v407$2: bv32;
  var v408$1: bv32;
  var v408$2: bv32;
  var v409$1: bv32;
  var v409$2: bv32;
  var v410$1: bv32;
  var v410$2: bv32;
  var v411$1: bv32;
  var v411$2: bv32;
  var v412$1: bv32;
  var v412$2: bv32;
  var v413$1: bv32;
  var v413$2: bv32;
  var v414$1: bv32;
  var v414$2: bv32;
  var v415$1: bv32;
  var v415$2: bv32;
  var v416$1: bv32;
  var v416$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var _HAVOC_bv8$1: bv8;
  var _HAVOC_bv8$2: bv8;


  __partitioned_block_$0_0:
    v0$1 := BV32_ADD(local_id_x$1, BV32_MUL(BV32_MUL(group_id_x$1, 6bv32), 96bv32));
    v0$2 := BV32_ADD(local_id_x$2, BV32_MUL(BV32_MUL(group_id_x$2, 6bv32), 96bv32));
    havoc v1$1, v1$2;
    $$0$0bv32$1 := v1$1;
    $$0$0bv32$2 := v1$2;
    havoc v2$1, v2$2;
    $$0$1bv32$1 := v2$1;
    $$0$1bv32$2 := v2$2;
    havoc v3$1, v3$2;
    $$0$2bv32$1 := v3$1;
    $$0$2bv32$2 := v3$2;
    havoc v4$1, v4$2;
    $$0$3bv32$1 := v4$1;
    $$0$3bv32$2 := v4$2;
    havoc v5$1, v5$2;
    $$0$4bv32$1 := v5$1;
    $$0$4bv32$2 := v5$2;
    havoc v6$1, v6$2;
    $$0$5bv32$1 := v6$1;
    $$0$5bv32$2 := v6$2;
    havoc v7$1, v7$2;
    $$0$6bv32$1 := v7$1;
    $$0$6bv32$2 := v7$2;
    havoc v8$1, v8$2;
    $$0$7bv32$1 := v8$1;
    $$0$7bv32$2 := v8$2;
    havoc v9$1, v9$2;
    $$0$8bv32$1 := v9$1;
    $$0$8bv32$2 := v9$2;
    havoc v10$1, v10$2;
    $$0$9bv32$1 := v10$1;
    $$0$9bv32$2 := v10$2;
    havoc v11$1, v11$2;
    $$0$10bv32$1 := v11$1;
    $$0$10bv32$2 := v11$2;
    havoc v12$1, v12$2;
    $$0$11bv32$1 := v12$1;
    $$0$11bv32$2 := v12$2;
    v13$1 := $$0$0bv32$1;
    v13$2 := $$0$0bv32$2;
    v14$1 := $$0$1bv32$1;
    v14$2 := $$0$1bv32$2;
    v15$1 := $$0$2bv32$1;
    v15$2 := $$0$2bv32$2;
    v16$1 := $$0$3bv32$1;
    v16$2 := $$0$3bv32$2;
    v17$1 := $$0$4bv32$1;
    v17$2 := $$0$4bv32$2;
    v18$1 := $$0$5bv32$1;
    v18$2 := $$0$5bv32$2;
    v19$1 := $$0$6bv32$1;
    v19$2 := $$0$6bv32$2;
    v20$1 := $$0$7bv32$1;
    v20$2 := $$0$7bv32$2;
    v21$1 := $$0$8bv32$1;
    v21$2 := $$0$8bv32$2;
    v22$1 := $$0$9bv32$1;
    v22$2 := $$0$9bv32$2;
    v23$1 := $$0$10bv32$1;
    v23$2 := $$0$10bv32$2;
    v24$1 := $$0$11bv32$1;
    v24$2 := $$0$11bv32$2;
    call {:sourceloc_num 37} v25$1, v25$2 := $_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(true, v16$1 ++ v15$1 ++ v14$1 ++ v13$1, v20$1 ++ v19$1 ++ v18$1 ++ v17$1, v24$1 ++ v23$1 ++ v22$1 ++ v21$1, v0$1, true, v16$2 ++ v15$2 ++ v14$2 ++ v13$2, v20$2 ++ v19$2 ++ v18$2 ++ v17$2, v24$2 ++ v23$2 ++ v22$2 ++ v21$2, v0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    call {:sourceloc} {:sourceloc_num 38} _LOG_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, local_id_x$1, v25$1, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 38} _CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, local_id_x$2, v25$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][local_id_x$1] := v25$1;
    $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := v25$2;
    havoc v26$1, v26$2;
    $$1$0bv32$1 := v26$1;
    $$1$0bv32$2 := v26$2;
    havoc v27$1, v27$2;
    $$1$1bv32$1 := v27$1;
    $$1$1bv32$2 := v27$2;
    havoc v28$1, v28$2;
    $$1$2bv32$1 := v28$1;
    $$1$2bv32$2 := v28$2;
    havoc v29$1, v29$2;
    $$1$3bv32$1 := v29$1;
    $$1$3bv32$2 := v29$2;
    havoc v30$1, v30$2;
    $$1$4bv32$1 := v30$1;
    $$1$4bv32$2 := v30$2;
    havoc v31$1, v31$2;
    $$1$5bv32$1 := v31$1;
    $$1$5bv32$2 := v31$2;
    havoc v32$1, v32$2;
    $$1$6bv32$1 := v32$1;
    $$1$6bv32$2 := v32$2;
    havoc v33$1, v33$2;
    $$1$7bv32$1 := v33$1;
    $$1$7bv32$2 := v33$2;
    havoc v34$1, v34$2;
    $$1$8bv32$1 := v34$1;
    $$1$8bv32$2 := v34$2;
    havoc v35$1, v35$2;
    $$1$9bv32$1 := v35$1;
    $$1$9bv32$2 := v35$2;
    havoc v36$1, v36$2;
    $$1$10bv32$1 := v36$1;
    $$1$10bv32$2 := v36$2;
    havoc v37$1, v37$2;
    $$1$11bv32$1 := v37$1;
    $$1$11bv32$2 := v37$2;
    v38$1 := $$1$0bv32$1;
    v38$2 := $$1$0bv32$2;
    v39$1 := $$1$1bv32$1;
    v39$2 := $$1$1bv32$2;
    v40$1 := $$1$2bv32$1;
    v40$2 := $$1$2bv32$2;
    v41$1 := $$1$3bv32$1;
    v41$2 := $$1$3bv32$2;
    v42$1 := $$1$4bv32$1;
    v42$2 := $$1$4bv32$2;
    v43$1 := $$1$5bv32$1;
    v43$2 := $$1$5bv32$2;
    v44$1 := $$1$6bv32$1;
    v44$2 := $$1$6bv32$2;
    v45$1 := $$1$7bv32$1;
    v45$2 := $$1$7bv32$2;
    v46$1 := $$1$8bv32$1;
    v46$2 := $$1$8bv32$2;
    v47$1 := $$1$9bv32$1;
    v47$2 := $$1$9bv32$2;
    v48$1 := $$1$10bv32$1;
    v48$2 := $$1$10bv32$2;
    v49$1 := $$1$11bv32$1;
    v49$2 := $$1$11bv32$2;
    call {:sourceloc_num 75} v50$1, v50$2 := $_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(true, v41$1 ++ v40$1 ++ v39$1 ++ v38$1, v45$1 ++ v44$1 ++ v43$1 ++ v42$1, v49$1 ++ v48$1 ++ v47$1 ++ v46$1, BV32_ADD(v0$1, 96bv32), true, v41$2 ++ v40$2 ++ v39$2 ++ v38$2, v45$2 ++ v44$2 ++ v43$2 ++ v42$2, v49$2 ++ v48$2 ++ v47$2 ++ v46$2, BV32_ADD(v0$2, 96bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    call {:sourceloc} {:sourceloc_num 76} _LOG_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$1, 96bv32), v50$1, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD(local_id_x$1, 96bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$2, 96bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 76} _CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$2, 96bv32), v50$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD(local_id_x$1, 96bv32)] := v50$1;
    $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 96bv32)] := v50$2;
    havoc v51$1, v51$2;
    $$2$0bv32$1 := v51$1;
    $$2$0bv32$2 := v51$2;
    havoc v52$1, v52$2;
    $$2$1bv32$1 := v52$1;
    $$2$1bv32$2 := v52$2;
    havoc v53$1, v53$2;
    $$2$2bv32$1 := v53$1;
    $$2$2bv32$2 := v53$2;
    havoc v54$1, v54$2;
    $$2$3bv32$1 := v54$1;
    $$2$3bv32$2 := v54$2;
    havoc v55$1, v55$2;
    $$2$4bv32$1 := v55$1;
    $$2$4bv32$2 := v55$2;
    havoc v56$1, v56$2;
    $$2$5bv32$1 := v56$1;
    $$2$5bv32$2 := v56$2;
    havoc v57$1, v57$2;
    $$2$6bv32$1 := v57$1;
    $$2$6bv32$2 := v57$2;
    havoc v58$1, v58$2;
    $$2$7bv32$1 := v58$1;
    $$2$7bv32$2 := v58$2;
    havoc v59$1, v59$2;
    $$2$8bv32$1 := v59$1;
    $$2$8bv32$2 := v59$2;
    havoc v60$1, v60$2;
    $$2$9bv32$1 := v60$1;
    $$2$9bv32$2 := v60$2;
    havoc v61$1, v61$2;
    $$2$10bv32$1 := v61$1;
    $$2$10bv32$2 := v61$2;
    havoc v62$1, v62$2;
    $$2$11bv32$1 := v62$1;
    $$2$11bv32$2 := v62$2;
    v63$1 := $$2$0bv32$1;
    v63$2 := $$2$0bv32$2;
    v64$1 := $$2$1bv32$1;
    v64$2 := $$2$1bv32$2;
    v65$1 := $$2$2bv32$1;
    v65$2 := $$2$2bv32$2;
    v66$1 := $$2$3bv32$1;
    v66$2 := $$2$3bv32$2;
    v67$1 := $$2$4bv32$1;
    v67$2 := $$2$4bv32$2;
    v68$1 := $$2$5bv32$1;
    v68$2 := $$2$5bv32$2;
    v69$1 := $$2$6bv32$1;
    v69$2 := $$2$6bv32$2;
    v70$1 := $$2$7bv32$1;
    v70$2 := $$2$7bv32$2;
    v71$1 := $$2$8bv32$1;
    v71$2 := $$2$8bv32$2;
    v72$1 := $$2$9bv32$1;
    v72$2 := $$2$9bv32$2;
    v73$1 := $$2$10bv32$1;
    v73$2 := $$2$10bv32$2;
    v74$1 := $$2$11bv32$1;
    v74$2 := $$2$11bv32$2;
    call {:sourceloc_num 113} v75$1, v75$2 := $_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(true, v66$1 ++ v65$1 ++ v64$1 ++ v63$1, v70$1 ++ v69$1 ++ v68$1 ++ v67$1, v74$1 ++ v73$1 ++ v72$1 ++ v71$1, BV32_ADD(v0$1, 192bv32), true, v66$2 ++ v65$2 ++ v64$2 ++ v63$2, v70$2 ++ v69$2 ++ v68$2 ++ v67$2, v74$2 ++ v73$2 ++ v72$2 ++ v71$2, BV32_ADD(v0$2, 192bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    call {:sourceloc} {:sourceloc_num 114} _LOG_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$1, 192bv32), v75$1, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD(local_id_x$1, 192bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$2, 192bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 114} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 114} _CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$2, 192bv32), v75$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD(local_id_x$1, 192bv32)] := v75$1;
    $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 192bv32)] := v75$2;
    havoc v76$1, v76$2;
    $$3$0bv32$1 := v76$1;
    $$3$0bv32$2 := v76$2;
    havoc v77$1, v77$2;
    $$3$1bv32$1 := v77$1;
    $$3$1bv32$2 := v77$2;
    havoc v78$1, v78$2;
    $$3$2bv32$1 := v78$1;
    $$3$2bv32$2 := v78$2;
    havoc v79$1, v79$2;
    $$3$3bv32$1 := v79$1;
    $$3$3bv32$2 := v79$2;
    havoc v80$1, v80$2;
    $$3$4bv32$1 := v80$1;
    $$3$4bv32$2 := v80$2;
    havoc v81$1, v81$2;
    $$3$5bv32$1 := v81$1;
    $$3$5bv32$2 := v81$2;
    havoc v82$1, v82$2;
    $$3$6bv32$1 := v82$1;
    $$3$6bv32$2 := v82$2;
    havoc v83$1, v83$2;
    $$3$7bv32$1 := v83$1;
    $$3$7bv32$2 := v83$2;
    havoc v84$1, v84$2;
    $$3$8bv32$1 := v84$1;
    $$3$8bv32$2 := v84$2;
    havoc v85$1, v85$2;
    $$3$9bv32$1 := v85$1;
    $$3$9bv32$2 := v85$2;
    havoc v86$1, v86$2;
    $$3$10bv32$1 := v86$1;
    $$3$10bv32$2 := v86$2;
    havoc v87$1, v87$2;
    $$3$11bv32$1 := v87$1;
    $$3$11bv32$2 := v87$2;
    v88$1 := $$3$0bv32$1;
    v88$2 := $$3$0bv32$2;
    v89$1 := $$3$1bv32$1;
    v89$2 := $$3$1bv32$2;
    v90$1 := $$3$2bv32$1;
    v90$2 := $$3$2bv32$2;
    v91$1 := $$3$3bv32$1;
    v91$2 := $$3$3bv32$2;
    v92$1 := $$3$4bv32$1;
    v92$2 := $$3$4bv32$2;
    v93$1 := $$3$5bv32$1;
    v93$2 := $$3$5bv32$2;
    v94$1 := $$3$6bv32$1;
    v94$2 := $$3$6bv32$2;
    v95$1 := $$3$7bv32$1;
    v95$2 := $$3$7bv32$2;
    v96$1 := $$3$8bv32$1;
    v96$2 := $$3$8bv32$2;
    v97$1 := $$3$9bv32$1;
    v97$2 := $$3$9bv32$2;
    v98$1 := $$3$10bv32$1;
    v98$2 := $$3$10bv32$2;
    v99$1 := $$3$11bv32$1;
    v99$2 := $$3$11bv32$2;
    call {:sourceloc_num 151} v100$1, v100$2 := $_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(true, v91$1 ++ v90$1 ++ v89$1 ++ v88$1, v95$1 ++ v94$1 ++ v93$1 ++ v92$1, v99$1 ++ v98$1 ++ v97$1 ++ v96$1, BV32_ADD(v0$1, 288bv32), true, v91$2 ++ v90$2 ++ v89$2 ++ v88$2, v95$2 ++ v94$2 ++ v93$2 ++ v92$2, v99$2 ++ v98$2 ++ v97$2 ++ v96$2, BV32_ADD(v0$2, 288bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    call {:sourceloc} {:sourceloc_num 152} _LOG_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$1, 288bv32), v100$1, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD(local_id_x$1, 288bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$2, 288bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 152} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 152} _CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$2, 288bv32), v100$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD(local_id_x$1, 288bv32)] := v100$1;
    $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 288bv32)] := v100$2;
    havoc v101$1, v101$2;
    $$4$0bv32$1 := v101$1;
    $$4$0bv32$2 := v101$2;
    havoc v102$1, v102$2;
    $$4$1bv32$1 := v102$1;
    $$4$1bv32$2 := v102$2;
    havoc v103$1, v103$2;
    $$4$2bv32$1 := v103$1;
    $$4$2bv32$2 := v103$2;
    havoc v104$1, v104$2;
    $$4$3bv32$1 := v104$1;
    $$4$3bv32$2 := v104$2;
    havoc v105$1, v105$2;
    $$4$4bv32$1 := v105$1;
    $$4$4bv32$2 := v105$2;
    havoc v106$1, v106$2;
    $$4$5bv32$1 := v106$1;
    $$4$5bv32$2 := v106$2;
    havoc v107$1, v107$2;
    $$4$6bv32$1 := v107$1;
    $$4$6bv32$2 := v107$2;
    havoc v108$1, v108$2;
    $$4$7bv32$1 := v108$1;
    $$4$7bv32$2 := v108$2;
    havoc v109$1, v109$2;
    $$4$8bv32$1 := v109$1;
    $$4$8bv32$2 := v109$2;
    havoc v110$1, v110$2;
    $$4$9bv32$1 := v110$1;
    $$4$9bv32$2 := v110$2;
    havoc v111$1, v111$2;
    $$4$10bv32$1 := v111$1;
    $$4$10bv32$2 := v111$2;
    havoc v112$1, v112$2;
    $$4$11bv32$1 := v112$1;
    $$4$11bv32$2 := v112$2;
    v113$1 := $$4$0bv32$1;
    v113$2 := $$4$0bv32$2;
    v114$1 := $$4$1bv32$1;
    v114$2 := $$4$1bv32$2;
    v115$1 := $$4$2bv32$1;
    v115$2 := $$4$2bv32$2;
    v116$1 := $$4$3bv32$1;
    v116$2 := $$4$3bv32$2;
    v117$1 := $$4$4bv32$1;
    v117$2 := $$4$4bv32$2;
    v118$1 := $$4$5bv32$1;
    v118$2 := $$4$5bv32$2;
    v119$1 := $$4$6bv32$1;
    v119$2 := $$4$6bv32$2;
    v120$1 := $$4$7bv32$1;
    v120$2 := $$4$7bv32$2;
    v121$1 := $$4$8bv32$1;
    v121$2 := $$4$8bv32$2;
    v122$1 := $$4$9bv32$1;
    v122$2 := $$4$9bv32$2;
    v123$1 := $$4$10bv32$1;
    v123$2 := $$4$10bv32$2;
    v124$1 := $$4$11bv32$1;
    v124$2 := $$4$11bv32$2;
    call {:sourceloc_num 189} v125$1, v125$2 := $_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(true, v116$1 ++ v115$1 ++ v114$1 ++ v113$1, v120$1 ++ v119$1 ++ v118$1 ++ v117$1, v124$1 ++ v123$1 ++ v122$1 ++ v121$1, BV32_ADD(v0$1, 384bv32), true, v116$2 ++ v115$2 ++ v114$2 ++ v113$2, v120$2 ++ v119$2 ++ v118$2 ++ v117$2, v124$2 ++ v123$2 ++ v122$2 ++ v121$2, BV32_ADD(v0$2, 384bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    call {:sourceloc} {:sourceloc_num 190} _LOG_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$1, 384bv32), v125$1, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD(local_id_x$1, 384bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$2, 384bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 190} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 190} _CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$2, 384bv32), v125$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD(local_id_x$1, 384bv32)] := v125$1;
    $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 384bv32)] := v125$2;
    havoc v126$1, v126$2;
    $$5$0bv32$1 := v126$1;
    $$5$0bv32$2 := v126$2;
    havoc v127$1, v127$2;
    $$5$1bv32$1 := v127$1;
    $$5$1bv32$2 := v127$2;
    havoc v128$1, v128$2;
    $$5$2bv32$1 := v128$1;
    $$5$2bv32$2 := v128$2;
    havoc v129$1, v129$2;
    $$5$3bv32$1 := v129$1;
    $$5$3bv32$2 := v129$2;
    havoc v130$1, v130$2;
    $$5$4bv32$1 := v130$1;
    $$5$4bv32$2 := v130$2;
    havoc v131$1, v131$2;
    $$5$5bv32$1 := v131$1;
    $$5$5bv32$2 := v131$2;
    havoc v132$1, v132$2;
    $$5$6bv32$1 := v132$1;
    $$5$6bv32$2 := v132$2;
    havoc v133$1, v133$2;
    $$5$7bv32$1 := v133$1;
    $$5$7bv32$2 := v133$2;
    havoc v134$1, v134$2;
    $$5$8bv32$1 := v134$1;
    $$5$8bv32$2 := v134$2;
    havoc v135$1, v135$2;
    $$5$9bv32$1 := v135$1;
    $$5$9bv32$2 := v135$2;
    havoc v136$1, v136$2;
    $$5$10bv32$1 := v136$1;
    $$5$10bv32$2 := v136$2;
    havoc v137$1, v137$2;
    $$5$11bv32$1 := v137$1;
    $$5$11bv32$2 := v137$2;
    v138$1 := $$5$0bv32$1;
    v138$2 := $$5$0bv32$2;
    v139$1 := $$5$1bv32$1;
    v139$2 := $$5$1bv32$2;
    v140$1 := $$5$2bv32$1;
    v140$2 := $$5$2bv32$2;
    v141$1 := $$5$3bv32$1;
    v141$2 := $$5$3bv32$2;
    v142$1 := $$5$4bv32$1;
    v142$2 := $$5$4bv32$2;
    v143$1 := $$5$5bv32$1;
    v143$2 := $$5$5bv32$2;
    v144$1 := $$5$6bv32$1;
    v144$2 := $$5$6bv32$2;
    v145$1 := $$5$7bv32$1;
    v145$2 := $$5$7bv32$2;
    v146$1 := $$5$8bv32$1;
    v146$2 := $$5$8bv32$2;
    v147$1 := $$5$9bv32$1;
    v147$2 := $$5$9bv32$2;
    v148$1 := $$5$10bv32$1;
    v148$2 := $$5$10bv32$2;
    v149$1 := $$5$11bv32$1;
    v149$2 := $$5$11bv32$2;
    call {:sourceloc_num 227} v150$1, v150$2 := $_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(true, v141$1 ++ v140$1 ++ v139$1 ++ v138$1, v145$1 ++ v144$1 ++ v143$1 ++ v142$1, v149$1 ++ v148$1 ++ v147$1 ++ v146$1, BV32_ADD(v0$1, 480bv32), true, v141$2 ++ v140$2 ++ v139$2 ++ v138$2, v145$2 ++ v144$2 ++ v143$2 ++ v142$2, v149$2 ++ v148$2 ++ v147$2 ++ v146$2, BV32_ADD(v0$2, 480bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    call {:sourceloc} {:sourceloc_num 228} _LOG_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$1, 480bv32), v150$1, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD(local_id_x$1, 480bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$2, 480bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 228} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 228} _CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD(local_id_x$2, 480bv32), v150$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD(local_id_x$1, 480bv32)] := v150$1;
    $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 480bv32)] := v150$2;
    v151$1 := BV32_SLT(local_id_x$1, 12bv32);
    v151$2 := BV32_SLT(local_id_x$2, 12bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v151$1 then v151$1 else p0$1);
    p0$2 := (if v151$2 then v151$2 else p0$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v152$1 := (if p0$1 then _HAVOC_bv8$1 else v152$1);
    v152$2 := (if p0$2 then _HAVOC_bv8$2 else v152$2);
    $$6$0bv32$1 := (if p0$1 then v152$1 else $$6$0bv32$1);
    $$6$0bv32$2 := (if p0$2 then v152$2 else $$6$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v153$1 := (if p0$1 then _HAVOC_bv8$1 else v153$1);
    v153$2 := (if p0$2 then _HAVOC_bv8$2 else v153$2);
    $$6$1bv32$1 := (if p0$1 then v153$1 else $$6$1bv32$1);
    $$6$1bv32$2 := (if p0$2 then v153$2 else $$6$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v154$1 := (if p0$1 then _HAVOC_bv8$1 else v154$1);
    v154$2 := (if p0$2 then _HAVOC_bv8$2 else v154$2);
    $$6$2bv32$1 := (if p0$1 then v154$1 else $$6$2bv32$1);
    $$6$2bv32$2 := (if p0$2 then v154$2 else $$6$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v155$1 := (if p0$1 then _HAVOC_bv8$1 else v155$1);
    v155$2 := (if p0$2 then _HAVOC_bv8$2 else v155$2);
    $$6$3bv32$1 := (if p0$1 then v155$1 else $$6$3bv32$1);
    $$6$3bv32$2 := (if p0$2 then v155$2 else $$6$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v156$1 := (if p0$1 then _HAVOC_bv8$1 else v156$1);
    v156$2 := (if p0$2 then _HAVOC_bv8$2 else v156$2);
    $$6$4bv32$1 := (if p0$1 then v156$1 else $$6$4bv32$1);
    $$6$4bv32$2 := (if p0$2 then v156$2 else $$6$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v157$1 := (if p0$1 then _HAVOC_bv8$1 else v157$1);
    v157$2 := (if p0$2 then _HAVOC_bv8$2 else v157$2);
    $$6$5bv32$1 := (if p0$1 then v157$1 else $$6$5bv32$1);
    $$6$5bv32$2 := (if p0$2 then v157$2 else $$6$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v158$1 := (if p0$1 then _HAVOC_bv8$1 else v158$1);
    v158$2 := (if p0$2 then _HAVOC_bv8$2 else v158$2);
    $$6$6bv32$1 := (if p0$1 then v158$1 else $$6$6bv32$1);
    $$6$6bv32$2 := (if p0$2 then v158$2 else $$6$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v159$1 := (if p0$1 then _HAVOC_bv8$1 else v159$1);
    v159$2 := (if p0$2 then _HAVOC_bv8$2 else v159$2);
    $$6$7bv32$1 := (if p0$1 then v159$1 else $$6$7bv32$1);
    $$6$7bv32$2 := (if p0$2 then v159$2 else $$6$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v160$1 := (if p0$1 then _HAVOC_bv8$1 else v160$1);
    v160$2 := (if p0$2 then _HAVOC_bv8$2 else v160$2);
    $$6$8bv32$1 := (if p0$1 then v160$1 else $$6$8bv32$1);
    $$6$8bv32$2 := (if p0$2 then v160$2 else $$6$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v161$1 := (if p0$1 then _HAVOC_bv8$1 else v161$1);
    v161$2 := (if p0$2 then _HAVOC_bv8$2 else v161$2);
    $$6$9bv32$1 := (if p0$1 then v161$1 else $$6$9bv32$1);
    $$6$9bv32$2 := (if p0$2 then v161$2 else $$6$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v162$1 := (if p0$1 then _HAVOC_bv8$1 else v162$1);
    v162$2 := (if p0$2 then _HAVOC_bv8$2 else v162$2);
    $$6$10bv32$1 := (if p0$1 then v162$1 else $$6$10bv32$1);
    $$6$10bv32$2 := (if p0$2 then v162$2 else $$6$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v163$1 := (if p0$1 then _HAVOC_bv8$1 else v163$1);
    v163$2 := (if p0$2 then _HAVOC_bv8$2 else v163$2);
    $$6$11bv32$1 := (if p0$1 then v163$1 else $$6$11bv32$1);
    $$6$11bv32$2 := (if p0$2 then v163$2 else $$6$11bv32$2);
    v164$1 := (if p0$1 then $$6$0bv32$1 else v164$1);
    v164$2 := (if p0$2 then $$6$0bv32$2 else v164$2);
    v165$1 := (if p0$1 then $$6$1bv32$1 else v165$1);
    v165$2 := (if p0$2 then $$6$1bv32$2 else v165$2);
    v166$1 := (if p0$1 then $$6$2bv32$1 else v166$1);
    v166$2 := (if p0$2 then $$6$2bv32$2 else v166$2);
    v167$1 := (if p0$1 then $$6$3bv32$1 else v167$1);
    v167$2 := (if p0$2 then $$6$3bv32$2 else v167$2);
    v168$1 := (if p0$1 then $$6$4bv32$1 else v168$1);
    v168$2 := (if p0$2 then $$6$4bv32$2 else v168$2);
    v169$1 := (if p0$1 then $$6$5bv32$1 else v169$1);
    v169$2 := (if p0$2 then $$6$5bv32$2 else v169$2);
    v170$1 := (if p0$1 then $$6$6bv32$1 else v170$1);
    v170$2 := (if p0$2 then $$6$6bv32$2 else v170$2);
    v171$1 := (if p0$1 then $$6$7bv32$1 else v171$1);
    v171$2 := (if p0$2 then $$6$7bv32$2 else v171$2);
    v172$1 := (if p0$1 then $$6$8bv32$1 else v172$1);
    v172$2 := (if p0$2 then $$6$8bv32$2 else v172$2);
    v173$1 := (if p0$1 then $$6$9bv32$1 else v173$1);
    v173$2 := (if p0$2 then $$6$9bv32$2 else v173$2);
    v174$1 := (if p0$1 then $$6$10bv32$1 else v174$1);
    v174$2 := (if p0$2 then $$6$10bv32$2 else v174$2);
    v175$1 := (if p0$1 then $$6$11bv32$1 else v175$1);
    v175$2 := (if p0$2 then $$6$11bv32$2 else v175$2);
    call {:sourceloc_num 266} v176$1, v176$2 := $_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(p0$1, v167$1 ++ v166$1 ++ v165$1 ++ v164$1, v171$1 ++ v170$1 ++ v169$1 ++ v168$1, v175$1 ++ v174$1 ++ v173$1 ++ v172$1, BV32_ADD(BV32_MUL(12bv32, group_id_x$1), local_id_x$1), p0$2, v167$2 ++ v166$2 ++ v165$2 ++ v164$2, v171$2 ++ v170$2 ++ v169$2 ++ v168$2, v175$2 ++ v174$2 ++ v173$2 ++ v172$2, BV32_ADD(BV32_MUL(12bv32, group_id_x$2), local_id_x$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    call {:sourceloc} {:sourceloc_num 267} _LOG_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(p0$1, local_id_x$1, v176$1, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(p0$2, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 267} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 267} _CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(p0$2, local_id_x$2, v176$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} true;
    $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][local_id_x$1] := (if p0$1 then v176$1 else $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][local_id_x$1]);
    $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := (if p0$2 then v176$2 else $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 269} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $dEydt.0$1, $dEyds.0$1, $dEydr.0$1, $dExdt.0$1, $dExds.0$1, $dExdr.0$1, $dHzdt.0$1, $dHzds.0$1, $dHzdr.0$1, $dHydt.0$1, $dHyds.0$1, $dHydr.0$1, $dHxdt.0$1, $dHxds.0$1, $dHxdr.0$1, $m.0, $dEzdr.0$1, $dEzds.0$1, $dEzdt.0$1 := 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32;
    $dEydt.0$2, $dEyds.0$2, $dEydr.0$2, $dExdt.0$2, $dExds.0$2, $dExdr.0$2, $dHzdt.0$2, $dHzds.0$2, $dHzdr.0$2, $dHydt.0$2, $dHyds.0$2, $dHydr.0$2, $dHxdt.0$2, $dHxds.0$2, $dHxdr.0$2, $dEzdr.0$2, $dEzds.0$2, $dEzdt.0$2 := 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32, 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 270} true;
    v177 := BV32_SUB(84bv32, $m.0) != 0bv32;
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v177 && !v177;
    call {:sourceloc} {:sourceloc_num 592} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 0bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 592} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 592} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 0bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} true;
    v407$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][0bv32];
    v407$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    call {:sourceloc} {:sourceloc_num 593} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 1bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][1bv32]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 593} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 593} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 1bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} true;
    v408$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][1bv32];
    v408$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32];
    call {:sourceloc} {:sourceloc_num 594} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 2bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][2bv32]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 594} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 594} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 2bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} true;
    v409$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][2bv32];
    v409$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32];
    call {:sourceloc} {:sourceloc_num 595} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 4bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][4bv32]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 595} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 595} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 4bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][4bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} true;
    v410$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][4bv32];
    v410$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][4bv32];
    call {:sourceloc} {:sourceloc_num 596} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 5bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][5bv32]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 596} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 596} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 5bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][5bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} true;
    v411$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][5bv32];
    v411$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][5bv32];
    call {:sourceloc} {:sourceloc_num 597} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 6bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][6bv32]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 597} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 597} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 6bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][6bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} true;
    v412$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][6bv32];
    v412$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][6bv32];
    call {:sourceloc} {:sourceloc_num 598} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 8bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][8bv32]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 598} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 598} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 8bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][8bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} true;
    v413$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][8bv32];
    v413$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][8bv32];
    call {:sourceloc} {:sourceloc_num 599} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 9bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][9bv32]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 599} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 599} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 9bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][9bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} true;
    v414$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][9bv32];
    v414$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][9bv32];
    call {:sourceloc} {:sourceloc_num 600} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 10bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][10bv32]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 600} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 600} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(true, 10bv32, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][10bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} true;
    v415$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[1bv1][10bv32];
    v415$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][10bv32];
    v416$1 := BV32_ADD(local_id_x$1, BV32_MUL(576bv32, group_id_x$1));
    v416$2 := BV32_ADD(local_id_x$2, BV32_MUL(576bv32, group_id_x$2));
    call {:sourceloc} {:sourceloc_num 601} _LOG_WRITE_$$g_rhsQ(true, v416$1, FSUB32(2147483648bv32, FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v408$1, $dEzdr.0$1), FMUL32(v411$1, $dEzds.0$1)), FMUL32(v414$1, $dEzdt.0$1)), FMUL32(v409$1, $dEydr.0$1)), FMUL32(v412$1, $dEyds.0$1)), FMUL32(v415$1, $dEydt.0$1))), $$g_rhsQ[v416$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_rhsQ(true, v416$2);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 601} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 601} _CHECK_WRITE_$$g_rhsQ(true, v416$2, FSUB32(2147483648bv32, FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v408$2, $dEzdr.0$2), FMUL32(v411$2, $dEzds.0$2)), FMUL32(v414$2, $dEzdt.0$2)), FMUL32(v409$2, $dEydr.0$2)), FMUL32(v412$2, $dEyds.0$2)), FMUL32(v415$2, $dEydt.0$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_rhsQ"} true;
    $$g_rhsQ[v416$1] := FSUB32(2147483648bv32, FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v408$1, $dEzdr.0$1), FMUL32(v411$1, $dEzds.0$1)), FMUL32(v414$1, $dEzdt.0$1)), FMUL32(v409$1, $dEydr.0$1)), FMUL32(v412$1, $dEyds.0$1)), FMUL32(v415$1, $dEydt.0$1)));
    $$g_rhsQ[v416$2] := FSUB32(2147483648bv32, FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v408$2, $dEzdr.0$2), FMUL32(v411$2, $dEzds.0$2)), FMUL32(v414$2, $dEzdt.0$2)), FMUL32(v409$2, $dEydr.0$2)), FMUL32(v412$2, $dEyds.0$2)), FMUL32(v415$2, $dEydt.0$2)));
    call {:sourceloc} {:sourceloc_num 602} _LOG_WRITE_$$g_rhsQ(true, BV32_ADD(v416$1, 96bv32), FSUB32(2147483648bv32, FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v409$1, $dExdr.0$1), FMUL32(v412$1, $dExds.0$1)), FMUL32(v415$1, $dExdt.0$1)), FMUL32(v407$1, $dEzdr.0$1)), FMUL32(v410$1, $dEzds.0$1)), FMUL32(v413$1, $dEzdt.0$1))), $$g_rhsQ[BV32_ADD(v416$1, 96bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_rhsQ(true, BV32_ADD(v416$2, 96bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 602} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 602} _CHECK_WRITE_$$g_rhsQ(true, BV32_ADD(v416$2, 96bv32), FSUB32(2147483648bv32, FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v409$2, $dExdr.0$2), FMUL32(v412$2, $dExds.0$2)), FMUL32(v415$2, $dExdt.0$2)), FMUL32(v407$2, $dEzdr.0$2)), FMUL32(v410$2, $dEzds.0$2)), FMUL32(v413$2, $dEzdt.0$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_rhsQ"} true;
    $$g_rhsQ[BV32_ADD(v416$1, 96bv32)] := FSUB32(2147483648bv32, FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v409$1, $dExdr.0$1), FMUL32(v412$1, $dExds.0$1)), FMUL32(v415$1, $dExdt.0$1)), FMUL32(v407$1, $dEzdr.0$1)), FMUL32(v410$1, $dEzds.0$1)), FMUL32(v413$1, $dEzdt.0$1)));
    $$g_rhsQ[BV32_ADD(v416$2, 96bv32)] := FSUB32(2147483648bv32, FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v409$2, $dExdr.0$2), FMUL32(v412$2, $dExds.0$2)), FMUL32(v415$2, $dExdt.0$2)), FMUL32(v407$2, $dEzdr.0$2)), FMUL32(v410$2, $dEzds.0$2)), FMUL32(v413$2, $dEzdt.0$2)));
    call {:sourceloc} {:sourceloc_num 603} _LOG_WRITE_$$g_rhsQ(true, BV32_ADD(v416$1, 192bv32), FSUB32(2147483648bv32, FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v407$1, $dEydr.0$1), FMUL32(v410$1, $dEyds.0$1)), FMUL32(v413$1, $dEydt.0$1)), FMUL32(v408$1, $dExdr.0$1)), FMUL32(v411$1, $dExds.0$1)), FMUL32(v414$1, $dExdt.0$1))), $$g_rhsQ[BV32_ADD(v416$1, 192bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_rhsQ(true, BV32_ADD(v416$2, 192bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 603} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 603} _CHECK_WRITE_$$g_rhsQ(true, BV32_ADD(v416$2, 192bv32), FSUB32(2147483648bv32, FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v407$2, $dEydr.0$2), FMUL32(v410$2, $dEyds.0$2)), FMUL32(v413$2, $dEydt.0$2)), FMUL32(v408$2, $dExdr.0$2)), FMUL32(v411$2, $dExds.0$2)), FMUL32(v414$2, $dExdt.0$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_rhsQ"} true;
    $$g_rhsQ[BV32_ADD(v416$1, 192bv32)] := FSUB32(2147483648bv32, FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v407$1, $dEydr.0$1), FMUL32(v410$1, $dEyds.0$1)), FMUL32(v413$1, $dEydt.0$1)), FMUL32(v408$1, $dExdr.0$1)), FMUL32(v411$1, $dExds.0$1)), FMUL32(v414$1, $dExdt.0$1)));
    $$g_rhsQ[BV32_ADD(v416$2, 192bv32)] := FSUB32(2147483648bv32, FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v407$2, $dEydr.0$2), FMUL32(v410$2, $dEyds.0$2)), FMUL32(v413$2, $dEydt.0$2)), FMUL32(v408$2, $dExdr.0$2)), FMUL32(v411$2, $dExds.0$2)), FMUL32(v414$2, $dExdt.0$2)));
    call {:sourceloc} {:sourceloc_num 604} _LOG_WRITE_$$g_rhsQ(true, BV32_ADD(v416$1, 288bv32), FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v408$1, $dHzdr.0$1), FMUL32(v411$1, $dHzds.0$1)), FMUL32(v414$1, $dHzdt.0$1)), FMUL32(v409$1, $dHydr.0$1)), FMUL32(v412$1, $dHyds.0$1)), FMUL32(v415$1, $dHydt.0$1)), $$g_rhsQ[BV32_ADD(v416$1, 288bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_rhsQ(true, BV32_ADD(v416$2, 288bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 604} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 604} _CHECK_WRITE_$$g_rhsQ(true, BV32_ADD(v416$2, 288bv32), FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v408$2, $dHzdr.0$2), FMUL32(v411$2, $dHzds.0$2)), FMUL32(v414$2, $dHzdt.0$2)), FMUL32(v409$2, $dHydr.0$2)), FMUL32(v412$2, $dHyds.0$2)), FMUL32(v415$2, $dHydt.0$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_rhsQ"} true;
    $$g_rhsQ[BV32_ADD(v416$1, 288bv32)] := FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v408$1, $dHzdr.0$1), FMUL32(v411$1, $dHzds.0$1)), FMUL32(v414$1, $dHzdt.0$1)), FMUL32(v409$1, $dHydr.0$1)), FMUL32(v412$1, $dHyds.0$1)), FMUL32(v415$1, $dHydt.0$1));
    $$g_rhsQ[BV32_ADD(v416$2, 288bv32)] := FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v408$2, $dHzdr.0$2), FMUL32(v411$2, $dHzds.0$2)), FMUL32(v414$2, $dHzdt.0$2)), FMUL32(v409$2, $dHydr.0$2)), FMUL32(v412$2, $dHyds.0$2)), FMUL32(v415$2, $dHydt.0$2));
    call {:sourceloc} {:sourceloc_num 605} _LOG_WRITE_$$g_rhsQ(true, BV32_ADD(v416$1, 384bv32), FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v409$1, $dHxdr.0$1), FMUL32(v412$1, $dHxds.0$1)), FMUL32(v415$1, $dHxdt.0$1)), FMUL32(v407$1, $dHzdr.0$1)), FMUL32(v410$1, $dHzds.0$1)), FMUL32(v413$1, $dHzdt.0$1)), $$g_rhsQ[BV32_ADD(v416$1, 384bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_rhsQ(true, BV32_ADD(v416$2, 384bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 605} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 605} _CHECK_WRITE_$$g_rhsQ(true, BV32_ADD(v416$2, 384bv32), FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v409$2, $dHxdr.0$2), FMUL32(v412$2, $dHxds.0$2)), FMUL32(v415$2, $dHxdt.0$2)), FMUL32(v407$2, $dHzdr.0$2)), FMUL32(v410$2, $dHzds.0$2)), FMUL32(v413$2, $dHzdt.0$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_rhsQ"} true;
    $$g_rhsQ[BV32_ADD(v416$1, 384bv32)] := FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v409$1, $dHxdr.0$1), FMUL32(v412$1, $dHxds.0$1)), FMUL32(v415$1, $dHxdt.0$1)), FMUL32(v407$1, $dHzdr.0$1)), FMUL32(v410$1, $dHzds.0$1)), FMUL32(v413$1, $dHzdt.0$1));
    $$g_rhsQ[BV32_ADD(v416$2, 384bv32)] := FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v409$2, $dHxdr.0$2), FMUL32(v412$2, $dHxds.0$2)), FMUL32(v415$2, $dHxdt.0$2)), FMUL32(v407$2, $dHzdr.0$2)), FMUL32(v410$2, $dHzds.0$2)), FMUL32(v413$2, $dHzdt.0$2));
    call {:sourceloc} {:sourceloc_num 606} _LOG_WRITE_$$g_rhsQ(true, BV32_ADD(v416$1, 480bv32), FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v407$1, $dHydr.0$1), FMUL32(v410$1, $dHyds.0$1)), FMUL32(v413$1, $dHydt.0$1)), FMUL32(v408$1, $dHxdr.0$1)), FMUL32(v411$1, $dHxds.0$1)), FMUL32(v414$1, $dHxdt.0$1)), $$g_rhsQ[BV32_ADD(v416$1, 480bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_rhsQ(true, BV32_ADD(v416$2, 480bv32));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 606} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 606} _CHECK_WRITE_$$g_rhsQ(true, BV32_ADD(v416$2, 480bv32), FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v407$2, $dHydr.0$2), FMUL32(v410$2, $dHyds.0$2)), FMUL32(v413$2, $dHydt.0$2)), FMUL32(v408$2, $dHxdr.0$2)), FMUL32(v411$2, $dHxds.0$2)), FMUL32(v414$2, $dHxdt.0$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_rhsQ"} true;
    $$g_rhsQ[BV32_ADD(v416$1, 480bv32)] := FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v407$1, $dHydr.0$1), FMUL32(v410$1, $dHyds.0$1)), FMUL32(v413$1, $dHydt.0$1)), FMUL32(v408$1, $dHxdr.0$1)), FMUL32(v411$1, $dHxds.0$1)), FMUL32(v414$1, $dHxdt.0$1));
    $$g_rhsQ[BV32_ADD(v416$2, 480bv32)] := FSUB32(FSUB32(FSUB32(FADD32(FADD32(FMUL32(v407$2, $dHydr.0$2), FMUL32(v410$2, $dHyds.0$2)), FMUL32(v413$2, $dHydt.0$2)), FMUL32(v408$2, $dHxdr.0$2)), FMUL32(v411$2, $dHxds.0$2)), FMUL32(v414$2, $dHxdt.0$2));
    return;

  $truebb0:
    assume {:partition} v177 && v177;
    havoc v178$1, v178$2;
    $$7$0bv32$1 := v178$1;
    $$7$0bv32$2 := v178$2;
    havoc v179$1, v179$2;
    $$7$1bv32$1 := v179$1;
    $$7$1bv32$2 := v179$2;
    havoc v180$1, v180$2;
    $$7$2bv32$1 := v180$1;
    $$7$2bv32$2 := v180$2;
    havoc v181$1, v181$2;
    $$7$3bv32$1 := v181$1;
    $$7$3bv32$2 := v181$2;
    havoc v182$1, v182$2;
    $$7$4bv32$1 := v182$1;
    $$7$4bv32$2 := v182$2;
    havoc v183$1, v183$2;
    $$7$5bv32$1 := v183$1;
    $$7$5bv32$2 := v183$2;
    havoc v184$1, v184$2;
    $$7$6bv32$1 := v184$1;
    $$7$6bv32$2 := v184$2;
    havoc v185$1, v185$2;
    $$7$7bv32$1 := v185$1;
    $$7$7bv32$2 := v185$2;
    havoc v186$1, v186$2;
    $$7$8bv32$1 := v186$1;
    $$7$8bv32$2 := v186$2;
    havoc v187$1, v187$2;
    $$7$9bv32$1 := v187$1;
    $$7$9bv32$2 := v187$2;
    havoc v188$1, v188$2;
    $$7$10bv32$1 := v188$1;
    $$7$10bv32$2 := v188$2;
    havoc v189$1, v189$2;
    $$7$11bv32$1 := v189$1;
    $$7$11bv32$2 := v189$2;
    havoc v190$1, v190$2;
    $$7$12bv32$1 := v190$1;
    $$7$12bv32$2 := v190$2;
    havoc v191$1, v191$2;
    $$7$13bv32$1 := v191$1;
    $$7$13bv32$2 := v191$2;
    havoc v192$1, v192$2;
    $$7$14bv32$1 := v192$1;
    $$7$14bv32$2 := v192$2;
    havoc v193$1, v193$2;
    $$7$15bv32$1 := v193$1;
    $$7$15bv32$2 := v193$2;
    havoc v194$1, v194$2;
    $$7$16bv32$1 := v194$1;
    $$7$16bv32$2 := v194$2;
    havoc v195$1, v195$2;
    $$7$17bv32$1 := v195$1;
    $$7$17bv32$2 := v195$2;
    havoc v196$1, v196$2;
    $$7$18bv32$1 := v196$1;
    $$7$18bv32$2 := v196$2;
    havoc v197$1, v197$2;
    $$7$19bv32$1 := v197$1;
    $$7$19bv32$2 := v197$2;
    havoc v198$1, v198$2;
    $$7$20bv32$1 := v198$1;
    $$7$20bv32$2 := v198$2;
    havoc v199$1, v199$2;
    $$7$21bv32$1 := v199$1;
    $$7$21bv32$2 := v199$2;
    havoc v200$1, v200$2;
    $$7$22bv32$1 := v200$1;
    $$7$22bv32$2 := v200$2;
    havoc v201$1, v201$2;
    $$7$23bv32$1 := v201$1;
    $$7$23bv32$2 := v201$2;
    v202$1 := $$7$0bv32$1;
    v202$2 := $$7$0bv32$2;
    v203$1 := $$7$1bv32$1;
    v203$2 := $$7$1bv32$2;
    v204$1 := $$7$2bv32$1;
    v204$2 := $$7$2bv32$2;
    v205$1 := $$7$3bv32$1;
    v205$2 := $$7$3bv32$2;
    v206$1 := $$7$4bv32$1;
    v206$2 := $$7$4bv32$2;
    v207$1 := $$7$5bv32$1;
    v207$2 := $$7$5bv32$2;
    v208$1 := $$7$6bv32$1;
    v208$2 := $$7$6bv32$2;
    v209$1 := $$7$7bv32$1;
    v209$2 := $$7$7bv32$2;
    v210$1 := $$7$8bv32$1;
    v210$2 := $$7$8bv32$2;
    v211$1 := $$7$9bv32$1;
    v211$2 := $$7$9bv32$2;
    v212$1 := $$7$10bv32$1;
    v212$2 := $$7$10bv32$2;
    v213$1 := $$7$11bv32$1;
    v213$2 := $$7$11bv32$2;
    v214$1 := $$7$12bv32$1;
    v214$2 := $$7$12bv32$2;
    v215$1 := $$7$13bv32$1;
    v215$2 := $$7$13bv32$2;
    v216$1 := $$7$14bv32$1;
    v216$2 := $$7$14bv32$2;
    v217$1 := $$7$15bv32$1;
    v217$2 := $$7$15bv32$2;
    v218$1 := $$7$16bv32$1;
    v218$2 := $$7$16bv32$2;
    v219$1 := $$7$17bv32$1;
    v219$2 := $$7$17bv32$2;
    v220$1 := $$7$18bv32$1;
    v220$2 := $$7$18bv32$2;
    v221$1 := $$7$19bv32$1;
    v221$2 := $$7$19bv32$2;
    v222$1 := $$7$20bv32$1;
    v222$2 := $$7$20bv32$2;
    v223$1 := $$7$21bv32$1;
    v223$2 := $$7$21bv32$2;
    v224$1 := $$7$22bv32$1;
    v224$2 := $$7$22bv32$2;
    v225$1 := $$7$23bv32$1;
    v225$2 := $$7$23bv32$2;
    call {:sourceloc_num 344} v226$1, v226$2 := $_Z10tex1DfetchI6float4ET_7textureIS1_Li1EL19cudaTextureReadMode0EEi(v217$1 ++ v216$1 ++ v215$1 ++ v214$1 ++ v213$1 ++ v212$1 ++ v211$1 ++ v210$1 ++ v209$1 ++ v208$1 ++ v207$1 ++ v206$1 ++ v205$1 ++ v204$1 ++ v203$1 ++ v202$1, v221$1 ++ v220$1 ++ v219$1 ++ v218$1, v225$1 ++ v224$1 ++ v223$1 ++ v222$1, BV32_ADD(local_id_x$1, BV32_MUL($m.0, 96bv32)), v217$2 ++ v216$2 ++ v215$2 ++ v214$2 ++ v213$2 ++ v212$2 ++ v211$2 ++ v210$2 ++ v209$2 ++ v208$2 ++ v207$2 ++ v206$2 ++ v205$2 ++ v204$2 ++ v203$2 ++ v202$2, v221$2 ++ v220$2 ++ v219$2 ++ v218$2, v225$2 ++ v224$2 ++ v223$2 ++ v222$2, BV32_ADD(local_id_x$2, BV32_MUL($m.0, 96bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchI6float4ET_7textureIS1_Li1EL19cudaTextureReadMode0EEi"} true;
    $$D$0bv32$1 := v226$1[32:0];
    $$D$0bv32$2 := v226$2[32:0];
    $$D$1bv32$1 := v226$1[64:32];
    $$D$1bv32$2 := v226$2[64:32];
    $$D$2bv32$1 := v226$1[96:64];
    $$D$2bv32$2 := v226$2[96:64];
    $$D$3bv32$1 := v226$1[128:96];
    $$D$3bv32$2 := v226$2[128:96];
    call {:sourceloc} {:sourceloc_num 349} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, $m.0, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][$m.0]);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 349} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 349} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, $m.0, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$m.0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v227$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][$m.0];
    v227$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$m.0];
    v228$1 := $$D$0bv32$1;
    v228$2 := $$D$0bv32$2;
    v229$1 := $$D$1bv32$1;
    v229$2 := $$D$1bv32$2;
    v230$1 := $$D$2bv32$1;
    v230$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 353} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 96bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 96bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 353} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 353} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 96bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 96bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v231$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 96bv32)];
    v231$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 96bv32)];
    v232$1 := $$D$0bv32$1;
    v232$2 := $$D$0bv32$2;
    v233$1 := $$D$1bv32$1;
    v233$2 := $$D$1bv32$2;
    v234$1 := $$D$2bv32$1;
    v234$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 357} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 192bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 192bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 357} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 357} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 192bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 192bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v235$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 192bv32)];
    v235$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 192bv32)];
    v236$1 := $$D$0bv32$1;
    v236$2 := $$D$0bv32$2;
    v237$1 := $$D$1bv32$1;
    v237$2 := $$D$1bv32$2;
    v238$1 := $$D$2bv32$1;
    v238$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 361} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 288bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 288bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 361} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 361} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 288bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 288bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v239$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 288bv32)];
    v239$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 288bv32)];
    v240$1 := $$D$0bv32$1;
    v240$2 := $$D$0bv32$2;
    v241$1 := $$D$1bv32$1;
    v241$2 := $$D$1bv32$2;
    v242$1 := $$D$2bv32$1;
    v242$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 365} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 384bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 384bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 365} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 365} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 384bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 384bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v243$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 384bv32)];
    v243$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 384bv32)];
    v244$1 := $$D$0bv32$1;
    v244$2 := $$D$0bv32$2;
    v245$1 := $$D$1bv32$1;
    v245$2 := $$D$1bv32$2;
    v246$1 := $$D$2bv32$1;
    v246$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 369} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 480bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 480bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 369} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 369} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 480bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 480bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v247$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 480bv32)];
    v247$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 480bv32)];
    v248$1 := $$D$0bv32$1;
    v248$2 := $$D$0bv32$2;
    v249$1 := $$D$1bv32$1;
    v249$2 := $$D$1bv32$2;
    v250$1 := $$D$2bv32$1;
    v250$2 := $$D$2bv32$2;
    v251 := BV32_ADD($m.0, 1bv32);
    havoc v252$1, v252$2;
    $$9$0bv32$1 := v252$1;
    $$9$0bv32$2 := v252$2;
    havoc v253$1, v253$2;
    $$9$1bv32$1 := v253$1;
    $$9$1bv32$2 := v253$2;
    havoc v254$1, v254$2;
    $$9$2bv32$1 := v254$1;
    $$9$2bv32$2 := v254$2;
    havoc v255$1, v255$2;
    $$9$3bv32$1 := v255$1;
    $$9$3bv32$2 := v255$2;
    havoc v256$1, v256$2;
    $$9$4bv32$1 := v256$1;
    $$9$4bv32$2 := v256$2;
    havoc v257$1, v257$2;
    $$9$5bv32$1 := v257$1;
    $$9$5bv32$2 := v257$2;
    havoc v258$1, v258$2;
    $$9$6bv32$1 := v258$1;
    $$9$6bv32$2 := v258$2;
    havoc v259$1, v259$2;
    $$9$7bv32$1 := v259$1;
    $$9$7bv32$2 := v259$2;
    havoc v260$1, v260$2;
    $$9$8bv32$1 := v260$1;
    $$9$8bv32$2 := v260$2;
    havoc v261$1, v261$2;
    $$9$9bv32$1 := v261$1;
    $$9$9bv32$2 := v261$2;
    havoc v262$1, v262$2;
    $$9$10bv32$1 := v262$1;
    $$9$10bv32$2 := v262$2;
    havoc v263$1, v263$2;
    $$9$11bv32$1 := v263$1;
    $$9$11bv32$2 := v263$2;
    havoc v264$1, v264$2;
    $$9$12bv32$1 := v264$1;
    $$9$12bv32$2 := v264$2;
    havoc v265$1, v265$2;
    $$9$13bv32$1 := v265$1;
    $$9$13bv32$2 := v265$2;
    havoc v266$1, v266$2;
    $$9$14bv32$1 := v266$1;
    $$9$14bv32$2 := v266$2;
    havoc v267$1, v267$2;
    $$9$15bv32$1 := v267$1;
    $$9$15bv32$2 := v267$2;
    havoc v268$1, v268$2;
    $$9$16bv32$1 := v268$1;
    $$9$16bv32$2 := v268$2;
    havoc v269$1, v269$2;
    $$9$17bv32$1 := v269$1;
    $$9$17bv32$2 := v269$2;
    havoc v270$1, v270$2;
    $$9$18bv32$1 := v270$1;
    $$9$18bv32$2 := v270$2;
    havoc v271$1, v271$2;
    $$9$19bv32$1 := v271$1;
    $$9$19bv32$2 := v271$2;
    havoc v272$1, v272$2;
    $$9$20bv32$1 := v272$1;
    $$9$20bv32$2 := v272$2;
    havoc v273$1, v273$2;
    $$9$21bv32$1 := v273$1;
    $$9$21bv32$2 := v273$2;
    havoc v274$1, v274$2;
    $$9$22bv32$1 := v274$1;
    $$9$22bv32$2 := v274$2;
    havoc v275$1, v275$2;
    $$9$23bv32$1 := v275$1;
    $$9$23bv32$2 := v275$2;
    v276$1 := $$9$0bv32$1;
    v276$2 := $$9$0bv32$2;
    v277$1 := $$9$1bv32$1;
    v277$2 := $$9$1bv32$2;
    v278$1 := $$9$2bv32$1;
    v278$2 := $$9$2bv32$2;
    v279$1 := $$9$3bv32$1;
    v279$2 := $$9$3bv32$2;
    v280$1 := $$9$4bv32$1;
    v280$2 := $$9$4bv32$2;
    v281$1 := $$9$5bv32$1;
    v281$2 := $$9$5bv32$2;
    v282$1 := $$9$6bv32$1;
    v282$2 := $$9$6bv32$2;
    v283$1 := $$9$7bv32$1;
    v283$2 := $$9$7bv32$2;
    v284$1 := $$9$8bv32$1;
    v284$2 := $$9$8bv32$2;
    v285$1 := $$9$9bv32$1;
    v285$2 := $$9$9bv32$2;
    v286$1 := $$9$10bv32$1;
    v286$2 := $$9$10bv32$2;
    v287$1 := $$9$11bv32$1;
    v287$2 := $$9$11bv32$2;
    v288$1 := $$9$12bv32$1;
    v288$2 := $$9$12bv32$2;
    v289$1 := $$9$13bv32$1;
    v289$2 := $$9$13bv32$2;
    v290$1 := $$9$14bv32$1;
    v290$2 := $$9$14bv32$2;
    v291$1 := $$9$15bv32$1;
    v291$2 := $$9$15bv32$2;
    v292$1 := $$9$16bv32$1;
    v292$2 := $$9$16bv32$2;
    v293$1 := $$9$17bv32$1;
    v293$2 := $$9$17bv32$2;
    v294$1 := $$9$18bv32$1;
    v294$2 := $$9$18bv32$2;
    v295$1 := $$9$19bv32$1;
    v295$2 := $$9$19bv32$2;
    v296$1 := $$9$20bv32$1;
    v296$2 := $$9$20bv32$2;
    v297$1 := $$9$21bv32$1;
    v297$2 := $$9$21bv32$2;
    v298$1 := $$9$22bv32$1;
    v298$2 := $$9$22bv32$2;
    v299$1 := $$9$23bv32$1;
    v299$2 := $$9$23bv32$2;
    call {:sourceloc_num 445} v300$1, v300$2 := $_Z10tex1DfetchI6float4ET_7textureIS1_Li1EL19cudaTextureReadMode0EEi(v291$1 ++ v290$1 ++ v289$1 ++ v288$1 ++ v287$1 ++ v286$1 ++ v285$1 ++ v284$1 ++ v283$1 ++ v282$1 ++ v281$1 ++ v280$1 ++ v279$1 ++ v278$1 ++ v277$1 ++ v276$1, v295$1 ++ v294$1 ++ v293$1 ++ v292$1, v299$1 ++ v298$1 ++ v297$1 ++ v296$1, BV32_ADD(local_id_x$1, BV32_MUL(v251, 96bv32)), v291$2 ++ v290$2 ++ v289$2 ++ v288$2 ++ v287$2 ++ v286$2 ++ v285$2 ++ v284$2 ++ v283$2 ++ v282$2 ++ v281$2 ++ v280$2 ++ v279$2 ++ v278$2 ++ v277$2 ++ v276$2, v295$2 ++ v294$2 ++ v293$2 ++ v292$2, v299$2 ++ v298$2 ++ v297$2 ++ v296$2, BV32_ADD(local_id_x$2, BV32_MUL(v251, 96bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchI6float4ET_7textureIS1_Li1EL19cudaTextureReadMode0EEi"} true;
    $$8$0bv32$1 := v300$1[32:0];
    $$8$0bv32$2 := v300$2[32:0];
    $$8$1bv32$1 := v300$1[64:32];
    $$8$1bv32$2 := v300$2[64:32];
    $$8$2bv32$1 := v300$1[96:64];
    $$8$2bv32$2 := v300$2[96:64];
    $$8$3bv32$1 := v300$1[128:96];
    $$8$3bv32$2 := v300$2[128:96];
    v301$1 := $$8$0bv32$1;
    v301$2 := $$8$0bv32$2;
    $$D$0bv32$1 := v301$1;
    $$D$0bv32$2 := v301$2;
    v302$1 := $$8$1bv32$1;
    v302$2 := $$8$1bv32$2;
    $$D$1bv32$1 := v302$1;
    $$D$1bv32$2 := v302$2;
    v303$1 := $$8$2bv32$1;
    v303$2 := $$8$2bv32$2;
    $$D$2bv32$1 := v303$1;
    $$D$2bv32$2 := v303$2;
    v304$1 := $$8$3bv32$1;
    v304$2 := $$8$3bv32$2;
    $$D$3bv32$1 := v304$1;
    $$D$3bv32$2 := v304$2;
    call {:sourceloc} {:sourceloc_num 458} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, v251, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][v251]);
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 458} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 458} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, v251, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v251]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v305$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][v251];
    v305$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v251];
    v306$1 := $$D$0bv32$1;
    v306$2 := $$D$0bv32$2;
    v307$1 := $$D$1bv32$1;
    v307$2 := $$D$1bv32$2;
    v308$1 := $$D$2bv32$1;
    v308$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 462} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 97bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 97bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 462} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 462} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 97bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 97bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v309$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 97bv32)];
    v309$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 97bv32)];
    v310$1 := $$D$0bv32$1;
    v310$2 := $$D$0bv32$2;
    v311$1 := $$D$1bv32$1;
    v311$2 := $$D$1bv32$2;
    v312$1 := $$D$2bv32$1;
    v312$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 466} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 193bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 193bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 466} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 466} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 193bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 193bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v313$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 193bv32)];
    v313$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 193bv32)];
    v314$1 := $$D$0bv32$1;
    v314$2 := $$D$0bv32$2;
    v315$1 := $$D$1bv32$1;
    v315$2 := $$D$1bv32$2;
    v316$1 := $$D$2bv32$1;
    v316$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 470} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 289bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 289bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 470} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 470} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 289bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 289bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v317$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 289bv32)];
    v317$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 289bv32)];
    v318$1 := $$D$0bv32$1;
    v318$2 := $$D$0bv32$2;
    v319$1 := $$D$1bv32$1;
    v319$2 := $$D$1bv32$2;
    v320$1 := $$D$2bv32$1;
    v320$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 474} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 385bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 385bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 474} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 474} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 385bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 385bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v321$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 385bv32)];
    v321$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 385bv32)];
    v322$1 := $$D$0bv32$1;
    v322$2 := $$D$0bv32$2;
    v323$1 := $$D$1bv32$1;
    v323$2 := $$D$1bv32$2;
    v324$1 := $$D$2bv32$1;
    v324$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 478} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 481bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 481bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 478} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 478} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 481bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 481bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v325$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 481bv32)];
    v325$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 481bv32)];
    v326$1 := $$D$0bv32$1;
    v326$2 := $$D$0bv32$2;
    v327$1 := $$D$1bv32$1;
    v327$2 := $$D$1bv32$2;
    v328$1 := $$D$2bv32$1;
    v328$2 := $$D$2bv32$2;
    v329 := BV32_ADD($m.0, 2bv32);
    havoc v330$1, v330$2;
    $$11$0bv32$1 := v330$1;
    $$11$0bv32$2 := v330$2;
    havoc v331$1, v331$2;
    $$11$1bv32$1 := v331$1;
    $$11$1bv32$2 := v331$2;
    havoc v332$1, v332$2;
    $$11$2bv32$1 := v332$1;
    $$11$2bv32$2 := v332$2;
    havoc v333$1, v333$2;
    $$11$3bv32$1 := v333$1;
    $$11$3bv32$2 := v333$2;
    havoc v334$1, v334$2;
    $$11$4bv32$1 := v334$1;
    $$11$4bv32$2 := v334$2;
    havoc v335$1, v335$2;
    $$11$5bv32$1 := v335$1;
    $$11$5bv32$2 := v335$2;
    havoc v336$1, v336$2;
    $$11$6bv32$1 := v336$1;
    $$11$6bv32$2 := v336$2;
    havoc v337$1, v337$2;
    $$11$7bv32$1 := v337$1;
    $$11$7bv32$2 := v337$2;
    havoc v338$1, v338$2;
    $$11$8bv32$1 := v338$1;
    $$11$8bv32$2 := v338$2;
    havoc v339$1, v339$2;
    $$11$9bv32$1 := v339$1;
    $$11$9bv32$2 := v339$2;
    havoc v340$1, v340$2;
    $$11$10bv32$1 := v340$1;
    $$11$10bv32$2 := v340$2;
    havoc v341$1, v341$2;
    $$11$11bv32$1 := v341$1;
    $$11$11bv32$2 := v341$2;
    havoc v342$1, v342$2;
    $$11$12bv32$1 := v342$1;
    $$11$12bv32$2 := v342$2;
    havoc v343$1, v343$2;
    $$11$13bv32$1 := v343$1;
    $$11$13bv32$2 := v343$2;
    havoc v344$1, v344$2;
    $$11$14bv32$1 := v344$1;
    $$11$14bv32$2 := v344$2;
    havoc v345$1, v345$2;
    $$11$15bv32$1 := v345$1;
    $$11$15bv32$2 := v345$2;
    havoc v346$1, v346$2;
    $$11$16bv32$1 := v346$1;
    $$11$16bv32$2 := v346$2;
    havoc v347$1, v347$2;
    $$11$17bv32$1 := v347$1;
    $$11$17bv32$2 := v347$2;
    havoc v348$1, v348$2;
    $$11$18bv32$1 := v348$1;
    $$11$18bv32$2 := v348$2;
    havoc v349$1, v349$2;
    $$11$19bv32$1 := v349$1;
    $$11$19bv32$2 := v349$2;
    havoc v350$1, v350$2;
    $$11$20bv32$1 := v350$1;
    $$11$20bv32$2 := v350$2;
    havoc v351$1, v351$2;
    $$11$21bv32$1 := v351$1;
    $$11$21bv32$2 := v351$2;
    havoc v352$1, v352$2;
    $$11$22bv32$1 := v352$1;
    $$11$22bv32$2 := v352$2;
    havoc v353$1, v353$2;
    $$11$23bv32$1 := v353$1;
    $$11$23bv32$2 := v353$2;
    v354$1 := $$11$0bv32$1;
    v354$2 := $$11$0bv32$2;
    v355$1 := $$11$1bv32$1;
    v355$2 := $$11$1bv32$2;
    v356$1 := $$11$2bv32$1;
    v356$2 := $$11$2bv32$2;
    v357$1 := $$11$3bv32$1;
    v357$2 := $$11$3bv32$2;
    v358$1 := $$11$4bv32$1;
    v358$2 := $$11$4bv32$2;
    v359$1 := $$11$5bv32$1;
    v359$2 := $$11$5bv32$2;
    v360$1 := $$11$6bv32$1;
    v360$2 := $$11$6bv32$2;
    v361$1 := $$11$7bv32$1;
    v361$2 := $$11$7bv32$2;
    v362$1 := $$11$8bv32$1;
    v362$2 := $$11$8bv32$2;
    v363$1 := $$11$9bv32$1;
    v363$2 := $$11$9bv32$2;
    v364$1 := $$11$10bv32$1;
    v364$2 := $$11$10bv32$2;
    v365$1 := $$11$11bv32$1;
    v365$2 := $$11$11bv32$2;
    v366$1 := $$11$12bv32$1;
    v366$2 := $$11$12bv32$2;
    v367$1 := $$11$13bv32$1;
    v367$2 := $$11$13bv32$2;
    v368$1 := $$11$14bv32$1;
    v368$2 := $$11$14bv32$2;
    v369$1 := $$11$15bv32$1;
    v369$2 := $$11$15bv32$2;
    v370$1 := $$11$16bv32$1;
    v370$2 := $$11$16bv32$2;
    v371$1 := $$11$17bv32$1;
    v371$2 := $$11$17bv32$2;
    v372$1 := $$11$18bv32$1;
    v372$2 := $$11$18bv32$2;
    v373$1 := $$11$19bv32$1;
    v373$2 := $$11$19bv32$2;
    v374$1 := $$11$20bv32$1;
    v374$2 := $$11$20bv32$2;
    v375$1 := $$11$21bv32$1;
    v375$2 := $$11$21bv32$2;
    v376$1 := $$11$22bv32$1;
    v376$2 := $$11$22bv32$2;
    v377$1 := $$11$23bv32$1;
    v377$2 := $$11$23bv32$2;
    call {:sourceloc_num 554} v378$1, v378$2 := $_Z10tex1DfetchI6float4ET_7textureIS1_Li1EL19cudaTextureReadMode0EEi(v369$1 ++ v368$1 ++ v367$1 ++ v366$1 ++ v365$1 ++ v364$1 ++ v363$1 ++ v362$1 ++ v361$1 ++ v360$1 ++ v359$1 ++ v358$1 ++ v357$1 ++ v356$1 ++ v355$1 ++ v354$1, v373$1 ++ v372$1 ++ v371$1 ++ v370$1, v377$1 ++ v376$1 ++ v375$1 ++ v374$1, BV32_ADD(local_id_x$1, BV32_MUL(v329, 96bv32)), v369$2 ++ v368$2 ++ v367$2 ++ v366$2 ++ v365$2 ++ v364$2 ++ v363$2 ++ v362$2 ++ v361$2 ++ v360$2 ++ v359$2 ++ v358$2 ++ v357$2 ++ v356$2 ++ v355$2 ++ v354$2, v373$2 ++ v372$2 ++ v371$2 ++ v370$2, v377$2 ++ v376$2 ++ v375$2 ++ v374$2, BV32_ADD(local_id_x$2, BV32_MUL(v329, 96bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchI6float4ET_7textureIS1_Li1EL19cudaTextureReadMode0EEi"} true;
    $$10$0bv32$1 := v378$1[32:0];
    $$10$0bv32$2 := v378$2[32:0];
    $$10$1bv32$1 := v378$1[64:32];
    $$10$1bv32$2 := v378$2[64:32];
    $$10$2bv32$1 := v378$1[96:64];
    $$10$2bv32$2 := v378$2[96:64];
    $$10$3bv32$1 := v378$1[128:96];
    $$10$3bv32$2 := v378$2[128:96];
    v379$1 := $$10$0bv32$1;
    v379$2 := $$10$0bv32$2;
    $$D$0bv32$1 := v379$1;
    $$D$0bv32$2 := v379$2;
    v380$1 := $$10$1bv32$1;
    v380$2 := $$10$1bv32$2;
    $$D$1bv32$1 := v380$1;
    $$D$1bv32$2 := v380$2;
    v381$1 := $$10$2bv32$1;
    v381$2 := $$10$2bv32$2;
    $$D$2bv32$1 := v381$1;
    $$D$2bv32$2 := v381$2;
    v382$1 := $$10$3bv32$1;
    v382$2 := $$10$3bv32$2;
    $$D$3bv32$1 := v382$1;
    $$D$3bv32$2 := v382$2;
    call {:sourceloc} {:sourceloc_num 567} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, v329, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][v329]);
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 567} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 567} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, v329, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v329]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v383$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][v329];
    v383$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v329];
    v384$1 := $$D$0bv32$1;
    v384$2 := $$D$0bv32$2;
    v385$1 := $$D$1bv32$1;
    v385$2 := $$D$1bv32$2;
    v386$1 := $$D$2bv32$1;
    v386$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 571} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 98bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 98bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 571} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 571} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 98bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 98bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v387$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 98bv32)];
    v387$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 98bv32)];
    v388$1 := $$D$0bv32$1;
    v388$2 := $$D$0bv32$2;
    v389$1 := $$D$1bv32$1;
    v389$2 := $$D$1bv32$2;
    v390$1 := $$D$2bv32$1;
    v390$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 575} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 194bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 194bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 575} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 575} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 194bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 194bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v391$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 194bv32)];
    v391$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 194bv32)];
    v392$1 := $$D$0bv32$1;
    v392$2 := $$D$0bv32$2;
    v393$1 := $$D$1bv32$1;
    v393$2 := $$D$1bv32$2;
    v394$1 := $$D$2bv32$1;
    v394$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 579} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 290bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 290bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 579} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 579} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 290bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 290bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v395$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 290bv32)];
    v395$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 290bv32)];
    v396$1 := $$D$0bv32$1;
    v396$2 := $$D$0bv32$2;
    v397$1 := $$D$1bv32$1;
    v397$2 := $$D$1bv32$2;
    v398$1 := $$D$2bv32$1;
    v398$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 583} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 386bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 386bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 583} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 583} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 386bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 386bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v399$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 386bv32)];
    v399$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 386bv32)];
    v400$1 := $$D$0bv32$1;
    v400$2 := $$D$0bv32$2;
    v401$1 := $$D$1bv32$1;
    v401$2 := $$D$1bv32$2;
    v402$1 := $$D$2bv32$1;
    v402$2 := $$D$2bv32$2;
    call {:sourceloc} {:sourceloc_num 587} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 482bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 482bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 587} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 587} _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(true, BV32_ADD($m.0, 482bv32), $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 482bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} true;
    v403$1 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[1bv1][BV32_ADD($m.0, 482bv32)];
    v403$2 := $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($m.0, 482bv32)];
    v404$1 := $$D$0bv32$1;
    v404$2 := $$D$0bv32$2;
    v405$1 := $$D$1bv32$1;
    v405$2 := $$D$1bv32$2;
    v406$1 := $$D$2bv32$1;
    v406$2 := $$D$2bv32$2;
    $dEydt.0$1, $dEyds.0$1, $dEydr.0$1, $dExdt.0$1, $dExds.0$1, $dExdr.0$1, $dHzdt.0$1, $dHzds.0$1, $dHzdr.0$1, $dHydt.0$1, $dHyds.0$1, $dHydr.0$1, $dHxdt.0$1, $dHxds.0$1, $dHxdr.0$1, $m.0, $dEzdr.0$1, $dEzds.0$1, $dEzdt.0$1 := FADD32(FADD32(FADD32($dEydt.0$1, FMUL32(v246$1, v243$1)), FMUL32(v324$1, v321$1)), FMUL32(v402$1, v399$1)), FADD32(FADD32(FADD32($dEyds.0$1, FMUL32(v245$1, v243$1)), FMUL32(v323$1, v321$1)), FMUL32(v401$1, v399$1)), FADD32(FADD32(FADD32($dEydr.0$1, FMUL32(v244$1, v243$1)), FMUL32(v322$1, v321$1)), FMUL32(v400$1, v399$1)), FADD32(FADD32(FADD32($dExdt.0$1, FMUL32(v242$1, v239$1)), FMUL32(v320$1, v317$1)), FMUL32(v398$1, v395$1)), FADD32(FADD32(FADD32($dExds.0$1, FMUL32(v241$1, v239$1)), FMUL32(v319$1, v317$1)), FMUL32(v397$1, v395$1)), FADD32(FADD32(FADD32($dExdr.0$1, FMUL32(v240$1, v239$1)), FMUL32(v318$1, v317$1)), FMUL32(v396$1, v395$1)), FADD32(FADD32(FADD32($dHzdt.0$1, FMUL32(v238$1, v235$1)), FMUL32(v316$1, v313$1)), FMUL32(v394$1, v391$1)), FADD32(FADD32(FADD32($dHzds.0$1, FMUL32(v237$1, v235$1)), FMUL32(v315$1, v313$1)), FMUL32(v393$1, v391$1)), FADD32(FADD32(FADD32($dHzdr.0$1, FMUL32(v236$1, v235$1)), FMUL32(v314$1, v313$1)), FMUL32(v392$1, v391$1)), FADD32(FADD32(FADD32($dHydt.0$1, FMUL32(v234$1, v231$1)), FMUL32(v312$1, v309$1)), FMUL32(v390$1, v387$1)), FADD32(FADD32(FADD32($dHyds.0$1, FMUL32(v233$1, v231$1)), FMUL32(v311$1, v309$1)), FMUL32(v389$1, v387$1)), FADD32(FADD32(FADD32($dHydr.0$1, FMUL32(v232$1, v231$1)), FMUL32(v310$1, v309$1)), FMUL32(v388$1, v387$1)), FADD32(FADD32(FADD32($dHxdt.0$1, FMUL32(v230$1, v227$1)), FMUL32(v308$1, v305$1)), FMUL32(v386$1, v383$1)), FADD32(FADD32(FADD32($dHxds.0$1, FMUL32(v229$1, v227$1)), FMUL32(v307$1, v305$1)), FMUL32(v385$1, v383$1)), FADD32(FADD32(FADD32($dHxdr.0$1, FMUL32(v228$1, v227$1)), FMUL32(v306$1, v305$1)), FMUL32(v384$1, v383$1)), BV32_ADD($m.0, 3bv32), FADD32(FADD32(FADD32($dEzdr.0$1, FMUL32(v248$1, v247$1)), FMUL32(v326$1, v325$1)), FMUL32(v404$1, v403$1)), FADD32(FADD32(FADD32($dEzds.0$1, FMUL32(v249$1, v247$1)), FMUL32(v327$1, v325$1)), FMUL32(v405$1, v403$1)), FADD32(FADD32(FADD32($dEzdt.0$1, FMUL32(v250$1, v247$1)), FMUL32(v328$1, v325$1)), FMUL32(v406$1, v403$1));
    $dEydt.0$2, $dEyds.0$2, $dEydr.0$2, $dExdt.0$2, $dExds.0$2, $dExdr.0$2, $dHzdt.0$2, $dHzds.0$2, $dHzdr.0$2, $dHydt.0$2, $dHyds.0$2, $dHydr.0$2, $dHxdt.0$2, $dHxds.0$2, $dHxdr.0$2, $dEzdr.0$2, $dEzds.0$2, $dEzdt.0$2 := FADD32(FADD32(FADD32($dEydt.0$2, FMUL32(v246$2, v243$2)), FMUL32(v324$2, v321$2)), FMUL32(v402$2, v399$2)), FADD32(FADD32(FADD32($dEyds.0$2, FMUL32(v245$2, v243$2)), FMUL32(v323$2, v321$2)), FMUL32(v401$2, v399$2)), FADD32(FADD32(FADD32($dEydr.0$2, FMUL32(v244$2, v243$2)), FMUL32(v322$2, v321$2)), FMUL32(v400$2, v399$2)), FADD32(FADD32(FADD32($dExdt.0$2, FMUL32(v242$2, v239$2)), FMUL32(v320$2, v317$2)), FMUL32(v398$2, v395$2)), FADD32(FADD32(FADD32($dExds.0$2, FMUL32(v241$2, v239$2)), FMUL32(v319$2, v317$2)), FMUL32(v397$2, v395$2)), FADD32(FADD32(FADD32($dExdr.0$2, FMUL32(v240$2, v239$2)), FMUL32(v318$2, v317$2)), FMUL32(v396$2, v395$2)), FADD32(FADD32(FADD32($dHzdt.0$2, FMUL32(v238$2, v235$2)), FMUL32(v316$2, v313$2)), FMUL32(v394$2, v391$2)), FADD32(FADD32(FADD32($dHzds.0$2, FMUL32(v237$2, v235$2)), FMUL32(v315$2, v313$2)), FMUL32(v393$2, v391$2)), FADD32(FADD32(FADD32($dHzdr.0$2, FMUL32(v236$2, v235$2)), FMUL32(v314$2, v313$2)), FMUL32(v392$2, v391$2)), FADD32(FADD32(FADD32($dHydt.0$2, FMUL32(v234$2, v231$2)), FMUL32(v312$2, v309$2)), FMUL32(v390$2, v387$2)), FADD32(FADD32(FADD32($dHyds.0$2, FMUL32(v233$2, v231$2)), FMUL32(v311$2, v309$2)), FMUL32(v389$2, v387$2)), FADD32(FADD32(FADD32($dHydr.0$2, FMUL32(v232$2, v231$2)), FMUL32(v310$2, v309$2)), FMUL32(v388$2, v387$2)), FADD32(FADD32(FADD32($dHxdt.0$2, FMUL32(v230$2, v227$2)), FMUL32(v308$2, v305$2)), FMUL32(v386$2, v383$2)), FADD32(FADD32(FADD32($dHxds.0$2, FMUL32(v229$2, v227$2)), FMUL32(v307$2, v305$2)), FMUL32(v385$2, v383$2)), FADD32(FADD32(FADD32($dHxdr.0$2, FMUL32(v228$2, v227$2)), FMUL32(v306$2, v305$2)), FMUL32(v384$2, v383$2)), FADD32(FADD32(FADD32($dEzdr.0$2, FMUL32(v248$2, v247$2)), FMUL32(v326$2, v325$2)), FMUL32(v404$2, v403$2)), FADD32(FADD32(FADD32($dEzds.0$2, FMUL32(v249$2, v247$2)), FMUL32(v327$2, v325$2)), FMUL32(v405$2, v403$2)), FADD32(FADD32(FADD32($dEzdt.0$2, FMUL32(v250$2, v247$2)), FMUL32(v328$2, v325$2)), FMUL32(v406$2, v403$2));
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $3;
}



procedure {:source_name "_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} $_Z10tex1DfetchIfET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(_P$1: bool, $0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "_Z10tex1DfetchI6float4ET_7textureIS1_Li1EL19cudaTextureReadMode0EEi"} $_Z10tex1DfetchI6float4ET_7textureIS1_Li1EL19cudaTextureReadMode0EEi($0$1: bv128, $1$1: bv32, $2$1: bv32, $3$1: bv32, $0$2: bv128, $1$2: bv32, $2$2: bv32, $3$2: bv32) returns ($ret$1: bv128, $ret$2: bv128);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q, $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs, $$g_rhsQ, _TRACKING;



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

var $$D$0bv32$1: bv32;

var $$D$0bv32$2: bv32;

var $$D$1bv32$1: bv32;

var $$D$1bv32$2: bv32;

var $$D$2bv32$1: bv32;

var $$D$2bv32$2: bv32;

var $$D$3bv32$1: bv32;

var $$D$3bv32$2: bv32;

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

var $$7$12bv32$1: bv8;

var $$7$12bv32$2: bv8;

var $$7$13bv32$1: bv8;

var $$7$13bv32$2: bv8;

var $$7$14bv32$1: bv8;

var $$7$14bv32$2: bv8;

var $$7$15bv32$1: bv8;

var $$7$15bv32$2: bv8;

var $$7$16bv32$1: bv8;

var $$7$16bv32$2: bv8;

var $$7$17bv32$1: bv8;

var $$7$17bv32$2: bv8;

var $$7$18bv32$1: bv8;

var $$7$18bv32$2: bv8;

var $$7$19bv32$1: bv8;

var $$7$19bv32$2: bv8;

var $$7$20bv32$1: bv8;

var $$7$20bv32$2: bv8;

var $$7$21bv32$1: bv8;

var $$7$21bv32$2: bv8;

var $$7$22bv32$1: bv8;

var $$7$22bv32$2: bv8;

var $$7$23bv32$1: bv8;

var $$7$23bv32$2: bv8;

var $$8$0bv32$1: bv32;

var $$8$0bv32$2: bv32;

var $$8$1bv32$1: bv32;

var $$8$1bv32$2: bv32;

var $$8$2bv32$1: bv32;

var $$8$2bv32$2: bv32;

var $$8$3bv32$1: bv32;

var $$8$3bv32$2: bv32;

var $$9$0bv32$1: bv8;

var $$9$0bv32$2: bv8;

var $$9$1bv32$1: bv8;

var $$9$1bv32$2: bv8;

var $$9$2bv32$1: bv8;

var $$9$2bv32$2: bv8;

var $$9$3bv32$1: bv8;

var $$9$3bv32$2: bv8;

var $$9$4bv32$1: bv8;

var $$9$4bv32$2: bv8;

var $$9$5bv32$1: bv8;

var $$9$5bv32$2: bv8;

var $$9$6bv32$1: bv8;

var $$9$6bv32$2: bv8;

var $$9$7bv32$1: bv8;

var $$9$7bv32$2: bv8;

var $$9$8bv32$1: bv8;

var $$9$8bv32$2: bv8;

var $$9$9bv32$1: bv8;

var $$9$9bv32$2: bv8;

var $$9$10bv32$1: bv8;

var $$9$10bv32$2: bv8;

var $$9$11bv32$1: bv8;

var $$9$11bv32$2: bv8;

var $$9$12bv32$1: bv8;

var $$9$12bv32$2: bv8;

var $$9$13bv32$1: bv8;

var $$9$13bv32$2: bv8;

var $$9$14bv32$1: bv8;

var $$9$14bv32$2: bv8;

var $$9$15bv32$1: bv8;

var $$9$15bv32$2: bv8;

var $$9$16bv32$1: bv8;

var $$9$16bv32$2: bv8;

var $$9$17bv32$1: bv8;

var $$9$17bv32$2: bv8;

var $$9$18bv32$1: bv8;

var $$9$18bv32$2: bv8;

var $$9$19bv32$1: bv8;

var $$9$19bv32$2: bv8;

var $$9$20bv32$1: bv8;

var $$9$20bv32$2: bv8;

var $$9$21bv32$1: bv8;

var $$9$21bv32$2: bv8;

var $$9$22bv32$1: bv8;

var $$9$22bv32$2: bv8;

var $$9$23bv32$1: bv8;

var $$9$23bv32$2: bv8;

var $$10$0bv32$1: bv32;

var $$10$0bv32$2: bv32;

var $$10$1bv32$1: bv32;

var $$10$1bv32$2: bv32;

var $$10$2bv32$1: bv32;

var $$10$2bv32$2: bv32;

var $$10$3bv32$1: bv32;

var $$10$3bv32$2: bv32;

var $$11$0bv32$1: bv8;

var $$11$0bv32$2: bv8;

var $$11$1bv32$1: bv8;

var $$11$1bv32$2: bv8;

var $$11$2bv32$1: bv8;

var $$11$2bv32$2: bv8;

var $$11$3bv32$1: bv8;

var $$11$3bv32$2: bv8;

var $$11$4bv32$1: bv8;

var $$11$4bv32$2: bv8;

var $$11$5bv32$1: bv8;

var $$11$5bv32$2: bv8;

var $$11$6bv32$1: bv8;

var $$11$6bv32$2: bv8;

var $$11$7bv32$1: bv8;

var $$11$7bv32$2: bv8;

var $$11$8bv32$1: bv8;

var $$11$8bv32$2: bv8;

var $$11$9bv32$1: bv8;

var $$11$9bv32$2: bv8;

var $$11$10bv32$1: bv8;

var $$11$10bv32$2: bv8;

var $$11$11bv32$1: bv8;

var $$11$11bv32$2: bv8;

var $$11$12bv32$1: bv8;

var $$11$12bv32$2: bv8;

var $$11$13bv32$1: bv8;

var $$11$13bv32$2: bv8;

var $$11$14bv32$1: bv8;

var $$11$14bv32$2: bv8;

var $$11$15bv32$1: bv8;

var $$11$15bv32$2: bv8;

var $$11$16bv32$1: bv8;

var $$11$16bv32$2: bv8;

var $$11$17bv32$1: bv8;

var $$11$17bv32$2: bv8;

var $$11$18bv32$1: bv8;

var $$11$18bv32$2: bv8;

var $$11$19bv32$1: bv8;

var $$11$19bv32$2: bv8;

var $$11$20bv32$1: bv8;

var $$11$20bv32$2: bv8;

var $$11$21bv32$1: bv8;

var $$11$21bv32$2: bv8;

var $$11$22bv32$1: bv8;

var $$11$22bv32$2: bv8;

var $$11$23bv32$1: bv8;

var $$11$23bv32$2: bv8;

const _WATCHED_VALUE_$$g_rhsQ: bv32;

procedure {:inline 1} _LOG_READ_$$g_rhsQ(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$g_rhsQ;



implementation {:inline 1} _LOG_READ_$$g_rhsQ(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$g_rhsQ := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_rhsQ == _value then true else _READ_HAS_OCCURRED_$$g_rhsQ);
    return;
}



procedure _CHECK_READ_$$g_rhsQ(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_rhsQ"} {:array "$$g_rhsQ"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$g_rhsQ);
  requires {:source_name "g_rhsQ"} {:array "$$g_rhsQ"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$g_rhsQ: bool;

procedure {:inline 1} _LOG_WRITE_$$g_rhsQ(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$g_rhsQ, _WRITE_READ_BENIGN_FLAG_$$g_rhsQ;



implementation {:inline 1} _LOG_WRITE_$$g_rhsQ(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$g_rhsQ := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_rhsQ == _value then true else _WRITE_HAS_OCCURRED_$$g_rhsQ);
    _WRITE_READ_BENIGN_FLAG_$$g_rhsQ := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_rhsQ == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$g_rhsQ);
    return;
}



procedure _CHECK_WRITE_$$g_rhsQ(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_rhsQ"} {:array "$$g_rhsQ"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_rhsQ != _value);
  requires {:source_name "g_rhsQ"} {:array "$$g_rhsQ"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_rhsQ != _value);
  requires {:source_name "g_rhsQ"} {:array "$$g_rhsQ"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$g_rhsQ(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$g_rhsQ;



implementation {:inline 1} _LOG_ATOMIC_$$g_rhsQ(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$g_rhsQ := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$g_rhsQ);
    return;
}



procedure _CHECK_ATOMIC_$$g_rhsQ(_P: bool, _offset: bv32);
  requires {:source_name "g_rhsQ"} {:array "$$g_rhsQ"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset);
  requires {:source_name "g_rhsQ"} {:array "$$g_rhsQ"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_rhsQ(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$g_rhsQ;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_rhsQ(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$g_rhsQ := (if _P && _WRITE_HAS_OCCURRED_$$g_rhsQ && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$g_rhsQ);
    return;
}



const _WATCHED_VALUE_$$t_Q: bv8;

procedure {:inline 1} _LOG_READ_$$t_Q(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$t_Q;



implementation {:inline 1} _LOG_READ_$$t_Q(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$t_Q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_Q == _value then true else _READ_HAS_OCCURRED_$$t_Q);
    return;
}



procedure _CHECK_READ_$$t_Q(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "t_Q"} {:array "$$t_Q"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$t_Q && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$t_Q);
  requires {:source_name "t_Q"} {:array "$$t_Q"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$t_Q && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$t_Q: bool;

procedure {:inline 1} _LOG_WRITE_$$t_Q(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$t_Q, _WRITE_READ_BENIGN_FLAG_$$t_Q;



implementation {:inline 1} _LOG_WRITE_$$t_Q(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$t_Q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_Q == _value then true else _WRITE_HAS_OCCURRED_$$t_Q);
    _WRITE_READ_BENIGN_FLAG_$$t_Q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_Q == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$t_Q);
    return;
}



procedure _CHECK_WRITE_$$t_Q(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "t_Q"} {:array "$$t_Q"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$t_Q && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_Q != _value);
  requires {:source_name "t_Q"} {:array "$$t_Q"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$t_Q && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_Q != _value);
  requires {:source_name "t_Q"} {:array "$$t_Q"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$t_Q && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$t_Q(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$t_Q;



implementation {:inline 1} _LOG_ATOMIC_$$t_Q(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$t_Q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$t_Q);
    return;
}



procedure _CHECK_ATOMIC_$$t_Q(_P: bool, _offset: bv32);
  requires {:source_name "t_Q"} {:array "$$t_Q"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$t_Q && _WATCHED_OFFSET == _offset);
  requires {:source_name "t_Q"} {:array "$$t_Q"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$t_Q && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$t_Q(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$t_Q;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$t_Q(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$t_Q := (if _P && _WRITE_HAS_OCCURRED_$$t_Q && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$t_Q);
    return;
}



const _WATCHED_VALUE_$$t_vgeo: bv8;

procedure {:inline 1} _LOG_READ_$$t_vgeo(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$t_vgeo;



implementation {:inline 1} _LOG_READ_$$t_vgeo(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$t_vgeo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_vgeo == _value then true else _READ_HAS_OCCURRED_$$t_vgeo);
    return;
}



procedure _CHECK_READ_$$t_vgeo(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "t_vgeo"} {:array "$$t_vgeo"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$t_vgeo && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$t_vgeo);
  requires {:source_name "t_vgeo"} {:array "$$t_vgeo"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$t_vgeo && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$t_vgeo: bool;

procedure {:inline 1} _LOG_WRITE_$$t_vgeo(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$t_vgeo, _WRITE_READ_BENIGN_FLAG_$$t_vgeo;



implementation {:inline 1} _LOG_WRITE_$$t_vgeo(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$t_vgeo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_vgeo == _value then true else _WRITE_HAS_OCCURRED_$$t_vgeo);
    _WRITE_READ_BENIGN_FLAG_$$t_vgeo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_vgeo == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$t_vgeo);
    return;
}



procedure _CHECK_WRITE_$$t_vgeo(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "t_vgeo"} {:array "$$t_vgeo"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$t_vgeo && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_vgeo != _value);
  requires {:source_name "t_vgeo"} {:array "$$t_vgeo"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$t_vgeo && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_vgeo != _value);
  requires {:source_name "t_vgeo"} {:array "$$t_vgeo"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$t_vgeo && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$t_vgeo(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$t_vgeo;



implementation {:inline 1} _LOG_ATOMIC_$$t_vgeo(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$t_vgeo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$t_vgeo);
    return;
}



procedure _CHECK_ATOMIC_$$t_vgeo(_P: bool, _offset: bv32);
  requires {:source_name "t_vgeo"} {:array "$$t_vgeo"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$t_vgeo && _WATCHED_OFFSET == _offset);
  requires {:source_name "t_vgeo"} {:array "$$t_vgeo"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$t_vgeo && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$t_vgeo(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$t_vgeo;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$t_vgeo(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$t_vgeo := (if _P && _WRITE_HAS_OCCURRED_$$t_vgeo && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$t_vgeo);
    return;
}



const _WATCHED_VALUE_$$t_DrDsDt: bv8;

procedure {:inline 1} _LOG_READ_$$t_DrDsDt(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$t_DrDsDt;



implementation {:inline 1} _LOG_READ_$$t_DrDsDt(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$t_DrDsDt := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_DrDsDt == _value then true else _READ_HAS_OCCURRED_$$t_DrDsDt);
    return;
}



procedure _CHECK_READ_$$t_DrDsDt(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "t_DrDsDt"} {:array "$$t_DrDsDt"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$t_DrDsDt && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$t_DrDsDt);
  requires {:source_name "t_DrDsDt"} {:array "$$t_DrDsDt"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$t_DrDsDt && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$t_DrDsDt: bool;

procedure {:inline 1} _LOG_WRITE_$$t_DrDsDt(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$t_DrDsDt, _WRITE_READ_BENIGN_FLAG_$$t_DrDsDt;



implementation {:inline 1} _LOG_WRITE_$$t_DrDsDt(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$t_DrDsDt := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_DrDsDt == _value then true else _WRITE_HAS_OCCURRED_$$t_DrDsDt);
    _WRITE_READ_BENIGN_FLAG_$$t_DrDsDt := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_DrDsDt == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$t_DrDsDt);
    return;
}



procedure _CHECK_WRITE_$$t_DrDsDt(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "t_DrDsDt"} {:array "$$t_DrDsDt"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$t_DrDsDt && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_DrDsDt != _value);
  requires {:source_name "t_DrDsDt"} {:array "$$t_DrDsDt"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$t_DrDsDt && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$t_DrDsDt != _value);
  requires {:source_name "t_DrDsDt"} {:array "$$t_DrDsDt"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$t_DrDsDt && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$t_DrDsDt(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$t_DrDsDt;



implementation {:inline 1} _LOG_ATOMIC_$$t_DrDsDt(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$t_DrDsDt := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$t_DrDsDt);
    return;
}



procedure _CHECK_ATOMIC_$$t_DrDsDt(_P: bool, _offset: bv32);
  requires {:source_name "t_DrDsDt"} {:array "$$t_DrDsDt"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$t_DrDsDt && _WATCHED_OFFSET == _offset);
  requires {:source_name "t_DrDsDt"} {:array "$$t_DrDsDt"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$t_DrDsDt && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$t_DrDsDt(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$t_DrDsDt;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$t_DrDsDt(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$t_DrDsDt := (if _P && _WRITE_HAS_OCCURRED_$$t_DrDsDt && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$t_DrDsDt);
    return;
}



const _WATCHED_VALUE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q;



implementation {:inline 1} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q == _value then true else _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q);
    return;
}



procedure _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_Q"} {:array "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Q"} {:array "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q, _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q;



implementation {:inline 1} _LOG_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q);
    return;
}



procedure _CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_Q"} {:array "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Q"} {:array "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Q"} {:array "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(_P: bool, _offset: bv32);
  requires {:source_name "s_Q"} {:array "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Q"} {:array "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q);
    return;
}



const _WATCHED_VALUE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs;



implementation {:inline 1} _LOG_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs == _value then true else _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs);
    return;
}



procedure _CHECK_READ_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_facs"} {:array "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_facs"} {:array "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs, _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs;



implementation {:inline 1} _LOG_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs);
    return;
}



procedure _CHECK_WRITE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_facs"} {:array "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_facs"} {:array "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_facs"} {:array "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(_P: bool, _offset: bv32);
  requires {:source_name "s_facs"} {:array "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_facs"} {:array "$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$g_rhsQ;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$g_rhsQ;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$g_rhsQ;
    goto anon6;

  anon6:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$g_rhsQ;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE3s_Q;
    goto anon4;

  anon4:
    havoc $$_ZZ24MaxwellsGPU_VOL_Kernel3DPfE6s_facs;
    goto anon5;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
