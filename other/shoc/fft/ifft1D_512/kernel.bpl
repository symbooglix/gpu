type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "work"} {:global} $$work: [bv32]bv32;

axiom {:array_info "$$work"} {:global} {:elem_width 32} {:source_name "work"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$work: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$work: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$work: bool;

var {:source_name "reversed.i"} $$reversed.i$1: [bv32]bv32;

var {:source_name "reversed.i"} $$reversed.i$2: [bv32]bv32;

axiom {:array_info "$$reversed.i"} {:elem_width 32} {:source_name "reversed.i"} {:source_elem_width 32} {:source_dimensions "8"} true;

var {:source_name "data"} $$data$1: [bv32]bv32;

var {:source_name "data"} $$data$2: [bv32]bv32;

axiom {:array_info "$$data"} {:elem_width 32} {:source_name "data"} {:source_elem_width 64} {:source_dimensions "8"} true;

var {:source_name "reversed8"} $$reversed8$1: [bv32]bv32;

var {:source_name "reversed8"} $$reversed8$2: [bv32]bv32;

axiom {:array_info "$$reversed8"} {:elem_width 32} {:source_name "reversed8"} {:source_elem_width 32} {:source_dimensions "8"} true;

var {:source_name "reversed824"} $$reversed824$1: [bv32]bv32;

var {:source_name "reversed824"} $$reversed824$2: [bv32]bv32;

axiom {:array_info "$$reversed824"} {:elem_width 32} {:source_name "reversed824"} {:source_elem_width 32} {:source_dimensions "8"} true;

axiom {:array_info "$$ifft1D_512.reversed8"} {:elem_width 32} {:source_name "ifft1D_512.reversed8"} {:source_elem_width 32} {:source_dimensions "8"} true;

var {:source_name "smem"} {:group_shared} $$ifft1D_512.smem: [bv1][bv32]bv32;

axiom {:array_info "$$ifft1D_512.smem"} {:group_shared} {:elem_width 32} {:source_name "smem"} {:source_elem_width 32} {:source_dimensions "576"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$ifft1D_512.smem: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$ifft1D_512.smem: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem: bool;

axiom {:array_info "$$storex8.reversed"} {:elem_width 32} {:source_name "storex8.reversed"} {:source_elem_width 32} {:source_dimensions "8"} true;

axiom {:array_info "$$storey8.reversed"} {:elem_width 32} {:source_name "storey8.reversed"} {:source_elem_width 32} {:source_dimensions "8"} true;

axiom {:array_info "$$ifft1D_512.reversed81"} {:elem_width 32} {:source_name "ifft1D_512.reversed81"} {:source_elem_width 32} {:source_dimensions "8"} true;

axiom {:array_info "$$globalStores8.reversed"} {:elem_width 32} {:source_name "globalStores8.reversed"} {:source_elem_width 32} {:source_dimensions "8"} true;

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

function FCOS32(bv32) : bv32;

function FDIV32(bv32, bv32) : bv32;

function FDIV64(bv64, bv64) : bv64;

function FMUL32(bv32, bv32) : bv32;

function FMUL64(bv64, bv64) : bv64;

function FP64_CONV32(bv64) : bv32;

function FSIN32(bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP64(bv32) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "ifft1D_512"} {:kernel} $ifft1D_512();
  requires $$ifft1D_512.reversed8$0bv32$1 == 0bv32;
  requires $$ifft1D_512.reversed8$0bv32$2 == 0bv32;
  requires $$ifft1D_512.reversed8$1bv32$1 == 4bv32;
  requires $$ifft1D_512.reversed8$1bv32$2 == 4bv32;
  requires $$ifft1D_512.reversed8$2bv32$1 == 2bv32;
  requires $$ifft1D_512.reversed8$2bv32$2 == 2bv32;
  requires $$ifft1D_512.reversed8$3bv32$1 == 6bv32;
  requires $$ifft1D_512.reversed8$3bv32$2 == 6bv32;
  requires $$ifft1D_512.reversed8$4bv32$1 == 1bv32;
  requires $$ifft1D_512.reversed8$4bv32$2 == 1bv32;
  requires $$ifft1D_512.reversed8$5bv32$1 == 5bv32;
  requires $$ifft1D_512.reversed8$5bv32$2 == 5bv32;
  requires $$ifft1D_512.reversed8$6bv32$1 == 3bv32;
  requires $$ifft1D_512.reversed8$6bv32$2 == 3bv32;
  requires $$ifft1D_512.reversed8$7bv32$1 == 7bv32;
  requires $$ifft1D_512.reversed8$7bv32$2 == 7bv32;
  requires $$storex8.reversed$0bv32$1 == 0bv32;
  requires $$storex8.reversed$0bv32$2 == 0bv32;
  requires $$storex8.reversed$1bv32$1 == 4bv32;
  requires $$storex8.reversed$1bv32$2 == 4bv32;
  requires $$storex8.reversed$2bv32$1 == 2bv32;
  requires $$storex8.reversed$2bv32$2 == 2bv32;
  requires $$storex8.reversed$3bv32$1 == 6bv32;
  requires $$storex8.reversed$3bv32$2 == 6bv32;
  requires $$storex8.reversed$4bv32$1 == 1bv32;
  requires $$storex8.reversed$4bv32$2 == 1bv32;
  requires $$storex8.reversed$5bv32$1 == 5bv32;
  requires $$storex8.reversed$5bv32$2 == 5bv32;
  requires $$storex8.reversed$6bv32$1 == 3bv32;
  requires $$storex8.reversed$6bv32$2 == 3bv32;
  requires $$storex8.reversed$7bv32$1 == 7bv32;
  requires $$storex8.reversed$7bv32$2 == 7bv32;
  requires $$storey8.reversed$0bv32$1 == 0bv32;
  requires $$storey8.reversed$0bv32$2 == 0bv32;
  requires $$storey8.reversed$1bv32$1 == 4bv32;
  requires $$storey8.reversed$1bv32$2 == 4bv32;
  requires $$storey8.reversed$2bv32$1 == 2bv32;
  requires $$storey8.reversed$2bv32$2 == 2bv32;
  requires $$storey8.reversed$3bv32$1 == 6bv32;
  requires $$storey8.reversed$3bv32$2 == 6bv32;
  requires $$storey8.reversed$4bv32$1 == 1bv32;
  requires $$storey8.reversed$4bv32$2 == 1bv32;
  requires $$storey8.reversed$5bv32$1 == 5bv32;
  requires $$storey8.reversed$5bv32$2 == 5bv32;
  requires $$storey8.reversed$6bv32$1 == 3bv32;
  requires $$storey8.reversed$6bv32$2 == 3bv32;
  requires $$storey8.reversed$7bv32$1 == 7bv32;
  requires $$storey8.reversed$7bv32$2 == 7bv32;
  requires $$ifft1D_512.reversed81$0bv32$1 == 0bv32;
  requires $$ifft1D_512.reversed81$0bv32$2 == 0bv32;
  requires $$ifft1D_512.reversed81$1bv32$1 == 4bv32;
  requires $$ifft1D_512.reversed81$1bv32$2 == 4bv32;
  requires $$ifft1D_512.reversed81$2bv32$1 == 2bv32;
  requires $$ifft1D_512.reversed81$2bv32$2 == 2bv32;
  requires $$ifft1D_512.reversed81$3bv32$1 == 6bv32;
  requires $$ifft1D_512.reversed81$3bv32$2 == 6bv32;
  requires $$ifft1D_512.reversed81$4bv32$1 == 1bv32;
  requires $$ifft1D_512.reversed81$4bv32$2 == 1bv32;
  requires $$ifft1D_512.reversed81$5bv32$1 == 5bv32;
  requires $$ifft1D_512.reversed81$5bv32$2 == 5bv32;
  requires $$ifft1D_512.reversed81$6bv32$1 == 3bv32;
  requires $$ifft1D_512.reversed81$6bv32$2 == 3bv32;
  requires $$ifft1D_512.reversed81$7bv32$1 == 7bv32;
  requires $$ifft1D_512.reversed81$7bv32$2 == 7bv32;
  requires $$globalStores8.reversed$0bv32$1 == 0bv32;
  requires $$globalStores8.reversed$0bv32$2 == 0bv32;
  requires $$globalStores8.reversed$1bv32$1 == 4bv32;
  requires $$globalStores8.reversed$1bv32$2 == 4bv32;
  requires $$globalStores8.reversed$2bv32$1 == 2bv32;
  requires $$globalStores8.reversed$2bv32$2 == 2bv32;
  requires $$globalStores8.reversed$3bv32$1 == 6bv32;
  requires $$globalStores8.reversed$3bv32$2 == 6bv32;
  requires $$globalStores8.reversed$4bv32$1 == 1bv32;
  requires $$globalStores8.reversed$4bv32$2 == 1bv32;
  requires $$globalStores8.reversed$5bv32$1 == 5bv32;
  requires $$globalStores8.reversed$5bv32$2 == 5bv32;
  requires $$globalStores8.reversed$6bv32$1 == 3bv32;
  requires $$globalStores8.reversed$6bv32$2 == 3bv32;
  requires $$globalStores8.reversed$7bv32$1 == 7bv32;
  requires $$globalStores8.reversed$7bv32$2 == 7bv32;
  requires !_READ_HAS_OCCURRED_$$work && !_WRITE_HAS_OCCURRED_$$work && !_ATOMIC_HAS_OCCURRED_$$work;
  requires !_READ_HAS_OCCURRED_$$ifft1D_512.smem && !_WRITE_HAS_OCCURRED_$$ifft1D_512.smem && !_ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem;
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
  modifies $$ifft1D_512.smem, $$work, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _WRITE_HAS_OCCURRED_$$work, _WRITE_READ_BENIGN_FLAG_$$work, _WRITE_READ_BENIGN_FLAG_$$work, _READ_HAS_OCCURRED_$$ifft1D_512.smem, _WRITE_HAS_OCCURRED_$$ifft1D_512.smem, _WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem, _WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem, _READ_HAS_OCCURRED_$$work;



implementation {:source_name "ifft1D_512"} {:kernel} $ifft1D_512()
{
  var $i.i.0: bv32;
  var $j.0: bv32;
  var $i.i53.0: bv32;
  var $i.i50.0: bv32;
  var $i.i48.0: bv32;
  var $i.i45.0: bv32;
  var $j25.0: bv32;
  var $i.i44.0: bv32;
  var $i.i42.0: bv32;
  var $i.i41.0: bv32;
  var $i.i39.0: bv32;
  var $i.0: bv32;
  var $i.i38.0: bv32;
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
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4: bool;
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
  var v52$1: bv32;
  var v52$2: bv32;
  var v53$1: bv32;
  var v53$2: bv32;
  var v54$1: bv32;
  var v54$2: bv32;
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
  var v105$1: bv32;
  var v105$2: bv32;
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
  var v97: bool;
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
  var v106$1: bv32;
  var v106$2: bv32;
  var v111$1: bv32;
  var v111$2: bv32;
  var v107$1: bv32;
  var v107$2: bv32;
  var v108$1: bv32;
  var v108$2: bv32;
  var v109$1: bv32;
  var v109$2: bv32;
  var v110$1: bv32;
  var v110$2: bv32;
  var v112$1: bv32;
  var v112$2: bv32;
  var v113: bool;
  var v114$1: bv32;
  var v114$2: bv32;
  var v115$1: bv32;
  var v115$2: bv32;
  var v116$1: bv32;
  var v116$2: bv32;
  var v117$1: bv32;
  var v117$2: bv32;
  var v118: bool;
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
  var v365$1: bv32;
  var v365$2: bv32;
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
  var v131: bool;
  var v132$1: bv32;
  var v132$2: bv32;
  var v133$1: bv32;
  var v133$2: bv32;
  var v134$1: bv32;
  var v134$2: bv32;
  var v135$1: bv32;
  var v135$2: bv32;
  var v136: bool;
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
  var v184$1: bv32;
  var v184$2: bv32;
  var v185$1: bv32;
  var v185$2: bv32;
  var v186$1: bv32;
  var v186$2: bv32;
  var v187$1: bv32;
  var v187$2: bv32;
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
  var v210$1: bv32;
  var v210$2: bv32;
  var v211$1: bv32;
  var v211$2: bv32;
  var v212$1: bv32;
  var v212$2: bv32;
  var v213$1: bv32;
  var v213$2: bv32;
  var v214$1: bv32;
  var v214$2: bv32;
  var v215$1: bv32;
  var v215$2: bv32;
  var v216$1: bv32;
  var v216$2: bv32;
  var v217$1: bv32;
  var v217$2: bv32;
  var v218$1: bv32;
  var v218$2: bv32;
  var v219$1: bv32;
  var v219$2: bv32;
  var v220$1: bv32;
  var v220$2: bv32;
  var v221$1: bv32;
  var v221$2: bv32;
  var v222$1: bv32;
  var v222$2: bv32;
  var v223$1: bv32;
  var v223$2: bv32;
  var v224$1: bv32;
  var v224$2: bv32;
  var v225$1: bv32;
  var v225$2: bv32;
  var v226$1: bv32;
  var v226$2: bv32;
  var v227$1: bv32;
  var v227$2: bv32;
  var v228$1: bv32;
  var v228$2: bv32;
  var v229$1: bv32;
  var v229$2: bv32;
  var v230: bool;
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
  var v237$1: bv32;
  var v237$2: bv32;
  var v238$1: bv32;
  var v238$2: bv32;
  var v239$1: bv32;
  var v239$2: bv32;
  var v244$1: bv32;
  var v244$2: bv32;
  var v240$1: bv32;
  var v240$2: bv32;
  var v241$1: bv32;
  var v241$2: bv32;
  var v242$1: bv32;
  var v242$2: bv32;
  var v243$1: bv32;
  var v243$2: bv32;
  var v245$1: bv32;
  var v245$2: bv32;
  var v246: bool;
  var v247$1: bv32;
  var v247$2: bv32;
  var v248$1: bv32;
  var v248$2: bv32;
  var v249$1: bv32;
  var v249$2: bv32;
  var v250$1: bv32;
  var v250$2: bv32;
  var v251: bool;
  var v252$1: bv32;
  var v252$2: bv32;
  var v253$1: bv32;
  var v253$2: bv32;
  var v254$1: bv32;
  var v254$2: bv32;
  var v255$1: bv32;
  var v255$2: bv32;
  var v256$1: bv32;
  var v256$2: bv32;
  var v257$1: bv32;
  var v257$2: bv32;
  var v258$1: bv32;
  var v258$2: bv32;
  var v259$1: bv32;
  var v259$2: bv32;
  var v260$1: bv32;
  var v260$2: bv32;
  var v261$1: bv32;
  var v261$2: bv32;
  var v262$1: bv32;
  var v262$2: bv32;
  var v263$1: bv32;
  var v263$2: bv32;
  var v264: bool;
  var v265$1: bv32;
  var v265$2: bv32;
  var v266$1: bv32;
  var v266$2: bv32;
  var v267$1: bv32;
  var v267$2: bv32;
  var v268$1: bv32;
  var v268$2: bv32;
  var v269: bool;
  var v270$1: bv32;
  var v270$2: bv32;
  var v271$1: bv32;
  var v271$2: bv32;
  var v272$1: bv32;
  var v272$2: bv32;
  var v273$1: bv32;
  var v273$2: bv32;
  var v274$1: bv32;
  var v274$2: bv32;
  var v275$1: bv32;
  var v275$2: bv32;
  var v276$1: bv32;
  var v276$2: bv32;
  var v277$1: bv32;
  var v277$2: bv32;
  var v278$1: bv32;
  var v278$2: bv32;
  var v279$1: bv32;
  var v279$2: bv32;
  var v280$1: bv32;
  var v280$2: bv32;
  var v281$1: bv32;
  var v281$2: bv32;
  var v282$1: bv32;
  var v282$2: bv32;
  var v283$1: bv32;
  var v283$2: bv32;
  var v284$1: bv32;
  var v284$2: bv32;
  var v285$1: bv32;
  var v285$2: bv32;
  var v286$1: bv32;
  var v286$2: bv32;
  var v287$1: bv32;
  var v287$2: bv32;
  var v288$1: bv32;
  var v288$2: bv32;
  var v289$1: bv32;
  var v289$2: bv32;
  var v290$1: bv32;
  var v290$2: bv32;
  var v291$1: bv32;
  var v291$2: bv32;
  var v292$1: bv32;
  var v292$2: bv32;
  var v293$1: bv32;
  var v293$2: bv32;
  var v294$1: bv32;
  var v294$2: bv32;
  var v295$1: bv32;
  var v295$2: bv32;
  var v296$1: bv32;
  var v296$2: bv32;
  var v297$1: bv32;
  var v297$2: bv32;
  var v298$1: bv32;
  var v298$2: bv32;
  var v318$1: bv32;
  var v318$2: bv32;
  var v319$1: bv32;
  var v319$2: bv32;
  var v320$1: bv32;
  var v320$2: bv32;
  var v299$1: bv32;
  var v299$2: bv32;
  var v300$1: bv32;
  var v300$2: bv32;
  var v301$1: bv32;
  var v301$2: bv32;
  var v302$1: bv32;
  var v302$2: bv32;
  var v303$1: bv32;
  var v303$2: bv32;
  var v304$1: bv32;
  var v304$2: bv32;
  var v305$1: bv32;
  var v305$2: bv32;
  var v306$1: bv32;
  var v306$2: bv32;
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
  var v329$1: bv32;
  var v329$2: bv32;
  var v330$1: bv32;
  var v330$2: bv32;
  var v331$1: bv32;
  var v331$2: bv32;
  var v332$1: bv32;
  var v332$2: bv32;
  var v333$1: bv32;
  var v333$2: bv32;
  var v334$1: bv32;
  var v334$2: bv32;
  var v335$1: bv32;
  var v335$2: bv32;
  var v336$1: bv32;
  var v336$2: bv32;
  var v337$1: bv32;
  var v337$2: bv32;
  var v338$1: bv32;
  var v338$2: bv32;
  var v339$1: bv32;
  var v339$2: bv32;
  var v340$1: bv32;
  var v340$2: bv32;
  var v341$1: bv32;
  var v341$2: bv32;
  var v342$1: bv32;
  var v342$2: bv32;
  var v343$1: bv32;
  var v343$2: bv32;
  var v344$1: bv32;
  var v344$2: bv32;
  var v345$1: bv32;
  var v345$2: bv32;
  var v346$1: bv32;
  var v346$2: bv32;
  var v347$1: bv32;
  var v347$2: bv32;
  var v348$1: bv32;
  var v348$2: bv32;
  var v349$1: bv32;
  var v349$2: bv32;
  var v350$1: bv32;
  var v350$2: bv32;
  var v351$1: bv32;
  var v351$2: bv32;
  var v352$1: bv32;
  var v352$2: bv32;
  var v353$1: bv32;
  var v353$2: bv32;
  var v354$1: bv32;
  var v354$2: bv32;
  var v355: bool;
  var v356$1: bv32;
  var v356$2: bv32;
  var v357$1: bv32;
  var v357$2: bv32;
  var v358$1: bv32;
  var v358$2: bv32;
  var v359$1: bv32;
  var v359$2: bv32;
  var v360$1: bv32;
  var v360$2: bv32;
  var v361$1: bv32;
  var v361$2: bv32;
  var v362$1: bv32;
  var v362$2: bv32;
  var v363$1: bv32;
  var v363$2: bv32;
  var v364$1: bv32;
  var v364$2: bv32;
  var v366$1: bv32;
  var v366$2: bv32;
  var v367$1: bv32;
  var v367$2: bv32;
  var v368$1: bv32;
  var v368$2: bv32;
  var v369$1: bv32;
  var v369$2: bv32;
  var v370$1: bv32;
  var v370$2: bv32;
  var v371$1: bv32;
  var v371$2: bv32;
  var v372: bool;
  var v373$1: bv32;
  var v373$2: bv32;
  var v374$1: bv32;
  var v374$2: bv32;
  var v375$1: bv32;
  var v375$2: bv32;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1$1 := BV32_ADD(BV32_MUL(group_id_x$1, 512bv32), v0$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_x$2, 512bv32), v0$2);
    v2$1 := BV32_ASHR(v0$1, 3bv32);
    v2$2 := BV32_ASHR(v0$2, 3bv32);
    v3$1 := BV32_AND(v0$1, 7bv32);
    v3$2 := BV32_AND(v0$2, 7bv32);
    $i.i.0 := 0bv32;
    assume {:captureState "loop_entry_state_12_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_12"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v4 := BV32_SLT($i.i.0, 8bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v4 && !v4;
    v7$1 := $$data$1[0bv32];
    v7$2 := $$data$2[0bv32];
    v8$1 := $$data$1[1bv32];
    v8$2 := $$data$2[1bv32];
    v9$1 := $$data$1[8bv32];
    v9$2 := $$data$2[8bv32];
    v10$1 := $$data$1[9bv32];
    v10$2 := $$data$2[9bv32];
    $$data$1[0bv32] := FADD32(v7$1, v9$1);
    $$data$2[0bv32] := FADD32(v7$2, v9$2);
    $$data$1[1bv32] := FADD32(v8$1, v10$1);
    $$data$2[1bv32] := FADD32(v8$2, v10$2);
    v11$1 := $$data$1[8bv32];
    v11$2 := $$data$2[8bv32];
    v12$1 := $$data$1[9bv32];
    v12$2 := $$data$2[9bv32];
    $$data$1[8bv32] := FSUB32(v7$1, v11$1);
    $$data$2[8bv32] := FSUB32(v7$2, v11$2);
    $$data$1[9bv32] := FSUB32(v8$1, v12$1);
    $$data$2[9bv32] := FSUB32(v8$2, v12$2);
    v13$1 := $$data$1[2bv32];
    v13$2 := $$data$2[2bv32];
    v14$1 := $$data$1[3bv32];
    v14$2 := $$data$2[3bv32];
    v15$1 := $$data$1[10bv32];
    v15$2 := $$data$2[10bv32];
    v16$1 := $$data$1[11bv32];
    v16$2 := $$data$2[11bv32];
    $$data$1[2bv32] := FADD32(v13$1, v15$1);
    $$data$2[2bv32] := FADD32(v13$2, v15$2);
    $$data$1[3bv32] := FADD32(v14$1, v16$1);
    $$data$2[3bv32] := FADD32(v14$2, v16$2);
    v17$1 := $$data$1[10bv32];
    v17$2 := $$data$2[10bv32];
    v18$1 := $$data$1[11bv32];
    v18$2 := $$data$2[11bv32];
    $$data$1[10bv32] := FSUB32(v13$1, v17$1);
    $$data$2[10bv32] := FSUB32(v13$2, v17$2);
    $$data$1[11bv32] := FSUB32(v14$1, v18$1);
    $$data$2[11bv32] := FSUB32(v14$2, v18$2);
    v19$1 := $$data$1[4bv32];
    v19$2 := $$data$2[4bv32];
    v20$1 := $$data$1[5bv32];
    v20$2 := $$data$2[5bv32];
    v21$1 := $$data$1[12bv32];
    v21$2 := $$data$2[12bv32];
    v22$1 := $$data$1[13bv32];
    v22$2 := $$data$2[13bv32];
    $$data$1[4bv32] := FADD32(v19$1, v21$1);
    $$data$2[4bv32] := FADD32(v19$2, v21$2);
    $$data$1[5bv32] := FADD32(v20$1, v22$1);
    $$data$2[5bv32] := FADD32(v20$2, v22$2);
    v23$1 := $$data$1[12bv32];
    v23$2 := $$data$2[12bv32];
    v24$1 := $$data$1[13bv32];
    v24$2 := $$data$2[13bv32];
    $$data$1[12bv32] := FSUB32(v19$1, v23$1);
    $$data$2[12bv32] := FSUB32(v19$2, v23$2);
    $$data$1[13bv32] := FSUB32(v20$1, v24$1);
    $$data$2[13bv32] := FSUB32(v20$2, v24$2);
    v25$1 := $$data$1[6bv32];
    v25$2 := $$data$2[6bv32];
    v26$1 := $$data$1[7bv32];
    v26$2 := $$data$2[7bv32];
    v27$1 := $$data$1[14bv32];
    v27$2 := $$data$2[14bv32];
    v28$1 := $$data$1[15bv32];
    v28$2 := $$data$2[15bv32];
    $$data$1[6bv32] := FADD32(v25$1, v27$1);
    $$data$2[6bv32] := FADD32(v25$2, v27$2);
    $$data$1[7bv32] := FADD32(v26$1, v28$1);
    $$data$2[7bv32] := FADD32(v26$2, v28$2);
    v29$1 := $$data$1[14bv32];
    v29$2 := $$data$2[14bv32];
    v30$1 := $$data$1[15bv32];
    v30$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FSUB32(v25$1, v29$1);
    $$data$2[14bv32] := FSUB32(v25$2, v29$2);
    $$data$1[15bv32] := FSUB32(v26$1, v30$1);
    $$data$2[15bv32] := FSUB32(v26$2, v30$2);
    v31$1 := $$data$1[10bv32];
    v31$2 := $$data$2[10bv32];
    v32$1 := $$data$1[11bv32];
    v32$2 := $$data$2[11bv32];
    $$data$1[10bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v31$1, 1065353216bv32), FSUB32(2147483648bv32, FMUL32(v32$1, 1065353216bv32))));
    $$data$2[10bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v31$2, 1065353216bv32), FSUB32(2147483648bv32, FMUL32(v32$2, 1065353216bv32))));
    $$data$1[11bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v31$1, 1065353216bv32), FMUL32(v32$1, 1065353216bv32)));
    $$data$2[11bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v31$2, 1065353216bv32), FMUL32(v32$2, 1065353216bv32)));
    v33$1 := $$data$1[12bv32];
    v33$2 := $$data$2[12bv32];
    v34$1 := $$data$1[13bv32];
    v34$2 := $$data$2[13bv32];
    $$data$1[12bv32] := FADD32(FMUL32(v33$1, 0bv32), FSUB32(2147483648bv32, FMUL32(v34$1, 1065353216bv32)));
    $$data$2[12bv32] := FADD32(FMUL32(v33$2, 0bv32), FSUB32(2147483648bv32, FMUL32(v34$2, 1065353216bv32)));
    $$data$1[13bv32] := FADD32(FMUL32(v33$1, 1065353216bv32), FMUL32(v34$1, 0bv32));
    $$data$2[13bv32] := FADD32(FMUL32(v33$2, 1065353216bv32), FMUL32(v34$2, 0bv32));
    v35$1 := $$data$1[14bv32];
    v35$2 := $$data$2[14bv32];
    v36$1 := $$data$1[15bv32];
    v36$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v35$1, 3212836864bv32), FSUB32(2147483648bv32, FMUL32(v36$1, 1065353216bv32))));
    $$data$2[14bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v35$2, 3212836864bv32), FSUB32(2147483648bv32, FMUL32(v36$2, 1065353216bv32))));
    $$data$1[15bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v35$1, 1065353216bv32), FMUL32(v36$1, 3212836864bv32)));
    $$data$2[15bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v35$2, 1065353216bv32), FMUL32(v36$2, 3212836864bv32)));
    v37$1 := $$data$1[0bv32];
    v37$2 := $$data$2[0bv32];
    v38$1 := $$data$1[1bv32];
    v38$2 := $$data$2[1bv32];
    v39$1 := $$data$1[4bv32];
    v39$2 := $$data$2[4bv32];
    v40$1 := $$data$1[5bv32];
    v40$2 := $$data$2[5bv32];
    $$data$1[0bv32] := FADD32(v37$1, v39$1);
    $$data$2[0bv32] := FADD32(v37$2, v39$2);
    $$data$1[1bv32] := FADD32(v38$1, v40$1);
    $$data$2[1bv32] := FADD32(v38$2, v40$2);
    v41$1 := $$data$1[4bv32];
    v41$2 := $$data$2[4bv32];
    v42$1 := $$data$1[5bv32];
    v42$2 := $$data$2[5bv32];
    $$data$1[4bv32] := FSUB32(v37$1, v41$1);
    $$data$2[4bv32] := FSUB32(v37$2, v41$2);
    $$data$1[5bv32] := FSUB32(v38$1, v42$1);
    $$data$2[5bv32] := FSUB32(v38$2, v42$2);
    v43$1 := $$data$1[2bv32];
    v43$2 := $$data$2[2bv32];
    v44$1 := $$data$1[3bv32];
    v44$2 := $$data$2[3bv32];
    v45$1 := $$data$1[6bv32];
    v45$2 := $$data$2[6bv32];
    v46$1 := $$data$1[7bv32];
    v46$2 := $$data$2[7bv32];
    $$data$1[2bv32] := FADD32(v43$1, v45$1);
    $$data$2[2bv32] := FADD32(v43$2, v45$2);
    $$data$1[3bv32] := FADD32(v44$1, v46$1);
    $$data$2[3bv32] := FADD32(v44$2, v46$2);
    v47$1 := $$data$1[6bv32];
    v47$2 := $$data$2[6bv32];
    v48$1 := $$data$1[7bv32];
    v48$2 := $$data$2[7bv32];
    $$data$1[6bv32] := FSUB32(v43$1, v47$1);
    $$data$2[6bv32] := FSUB32(v43$2, v47$2);
    $$data$1[7bv32] := FSUB32(v44$1, v48$1);
    $$data$2[7bv32] := FSUB32(v44$2, v48$2);
    v49$1 := $$data$1[6bv32];
    v49$2 := $$data$2[6bv32];
    v50$1 := $$data$1[7bv32];
    v50$2 := $$data$2[7bv32];
    $$data$1[6bv32] := FADD32(FMUL32(v49$1, 0bv32), FSUB32(2147483648bv32, FMUL32(v50$1, 1065353216bv32)));
    $$data$2[6bv32] := FADD32(FMUL32(v49$2, 0bv32), FSUB32(2147483648bv32, FMUL32(v50$2, 1065353216bv32)));
    $$data$1[7bv32] := FADD32(FMUL32(v49$1, 1065353216bv32), FMUL32(v50$1, 0bv32));
    $$data$2[7bv32] := FADD32(FMUL32(v49$2, 1065353216bv32), FMUL32(v50$2, 0bv32));
    v51$1 := $$data$1[0bv32];
    v51$2 := $$data$2[0bv32];
    v52$1 := $$data$1[1bv32];
    v52$2 := $$data$2[1bv32];
    v53$1 := $$data$1[2bv32];
    v53$2 := $$data$2[2bv32];
    v54$1 := $$data$1[3bv32];
    v54$2 := $$data$2[3bv32];
    $$data$1[0bv32] := FADD32(v51$1, v53$1);
    $$data$2[0bv32] := FADD32(v51$2, v53$2);
    $$data$1[1bv32] := FADD32(v52$1, v54$1);
    $$data$2[1bv32] := FADD32(v52$2, v54$2);
    v55$1 := $$data$1[2bv32];
    v55$2 := $$data$2[2bv32];
    v56$1 := $$data$1[3bv32];
    v56$2 := $$data$2[3bv32];
    $$data$1[2bv32] := FSUB32(v51$1, v55$1);
    $$data$2[2bv32] := FSUB32(v51$2, v55$2);
    $$data$1[3bv32] := FSUB32(v52$1, v56$1);
    $$data$2[3bv32] := FSUB32(v52$2, v56$2);
    v57$1 := $$data$1[4bv32];
    v57$2 := $$data$2[4bv32];
    v58$1 := $$data$1[5bv32];
    v58$2 := $$data$2[5bv32];
    v59$1 := $$data$1[6bv32];
    v59$2 := $$data$2[6bv32];
    v60$1 := $$data$1[7bv32];
    v60$2 := $$data$2[7bv32];
    $$data$1[4bv32] := FADD32(v57$1, v59$1);
    $$data$2[4bv32] := FADD32(v57$2, v59$2);
    $$data$1[5bv32] := FADD32(v58$1, v60$1);
    $$data$2[5bv32] := FADD32(v58$2, v60$2);
    v61$1 := $$data$1[6bv32];
    v61$2 := $$data$2[6bv32];
    v62$1 := $$data$1[7bv32];
    v62$2 := $$data$2[7bv32];
    $$data$1[6bv32] := FSUB32(v57$1, v61$1);
    $$data$2[6bv32] := FSUB32(v57$2, v61$2);
    $$data$1[7bv32] := FSUB32(v58$1, v62$1);
    $$data$2[7bv32] := FSUB32(v58$2, v62$2);
    v63$1 := $$data$1[8bv32];
    v63$2 := $$data$2[8bv32];
    v64$1 := $$data$1[9bv32];
    v64$2 := $$data$2[9bv32];
    v65$1 := $$data$1[12bv32];
    v65$2 := $$data$2[12bv32];
    v66$1 := $$data$1[13bv32];
    v66$2 := $$data$2[13bv32];
    $$data$1[8bv32] := FADD32(v63$1, v65$1);
    $$data$2[8bv32] := FADD32(v63$2, v65$2);
    $$data$1[9bv32] := FADD32(v64$1, v66$1);
    $$data$2[9bv32] := FADD32(v64$2, v66$2);
    v67$1 := $$data$1[12bv32];
    v67$2 := $$data$2[12bv32];
    v68$1 := $$data$1[13bv32];
    v68$2 := $$data$2[13bv32];
    $$data$1[12bv32] := FSUB32(v63$1, v67$1);
    $$data$2[12bv32] := FSUB32(v63$2, v67$2);
    $$data$1[13bv32] := FSUB32(v64$1, v68$1);
    $$data$2[13bv32] := FSUB32(v64$2, v68$2);
    v69$1 := $$data$1[10bv32];
    v69$2 := $$data$2[10bv32];
    v70$1 := $$data$1[11bv32];
    v70$2 := $$data$2[11bv32];
    v71$1 := $$data$1[14bv32];
    v71$2 := $$data$2[14bv32];
    v72$1 := $$data$1[15bv32];
    v72$2 := $$data$2[15bv32];
    $$data$1[10bv32] := FADD32(v69$1, v71$1);
    $$data$2[10bv32] := FADD32(v69$2, v71$2);
    $$data$1[11bv32] := FADD32(v70$1, v72$1);
    $$data$2[11bv32] := FADD32(v70$2, v72$2);
    v73$1 := $$data$1[14bv32];
    v73$2 := $$data$2[14bv32];
    v74$1 := $$data$1[15bv32];
    v74$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FSUB32(v69$1, v73$1);
    $$data$2[14bv32] := FSUB32(v69$2, v73$2);
    $$data$1[15bv32] := FSUB32(v70$1, v74$1);
    $$data$2[15bv32] := FSUB32(v70$2, v74$2);
    v75$1 := $$data$1[14bv32];
    v75$2 := $$data$2[14bv32];
    v76$1 := $$data$1[15bv32];
    v76$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FADD32(FMUL32(v75$1, 0bv32), FSUB32(2147483648bv32, FMUL32(v76$1, 1065353216bv32)));
    $$data$2[14bv32] := FADD32(FMUL32(v75$2, 0bv32), FSUB32(2147483648bv32, FMUL32(v76$2, 1065353216bv32)));
    $$data$1[15bv32] := FADD32(FMUL32(v75$1, 1065353216bv32), FMUL32(v76$1, 0bv32));
    $$data$2[15bv32] := FADD32(FMUL32(v75$2, 1065353216bv32), FMUL32(v76$2, 0bv32));
    v77$1 := $$data$1[8bv32];
    v77$2 := $$data$2[8bv32];
    v78$1 := $$data$1[9bv32];
    v78$2 := $$data$2[9bv32];
    v79$1 := $$data$1[10bv32];
    v79$2 := $$data$2[10bv32];
    v80$1 := $$data$1[11bv32];
    v80$2 := $$data$2[11bv32];
    $$data$1[8bv32] := FADD32(v77$1, v79$1);
    $$data$2[8bv32] := FADD32(v77$2, v79$2);
    $$data$1[9bv32] := FADD32(v78$1, v80$1);
    $$data$2[9bv32] := FADD32(v78$2, v80$2);
    v81$1 := $$data$1[10bv32];
    v81$2 := $$data$2[10bv32];
    v82$1 := $$data$1[11bv32];
    v82$2 := $$data$2[11bv32];
    $$data$1[10bv32] := FSUB32(v77$1, v81$1);
    $$data$2[10bv32] := FSUB32(v77$2, v81$2);
    $$data$1[11bv32] := FSUB32(v78$1, v82$1);
    $$data$2[11bv32] := FSUB32(v78$2, v82$2);
    v83$1 := $$data$1[12bv32];
    v83$2 := $$data$2[12bv32];
    v84$1 := $$data$1[13bv32];
    v84$2 := $$data$2[13bv32];
    v85$1 := $$data$1[14bv32];
    v85$2 := $$data$2[14bv32];
    v86$1 := $$data$1[15bv32];
    v86$2 := $$data$2[15bv32];
    $$data$1[12bv32] := FADD32(v83$1, v85$1);
    $$data$2[12bv32] := FADD32(v83$2, v85$2);
    $$data$1[13bv32] := FADD32(v84$1, v86$1);
    $$data$2[13bv32] := FADD32(v84$2, v86$2);
    v87$1 := $$data$1[14bv32];
    v87$2 := $$data$2[14bv32];
    v88$1 := $$data$1[15bv32];
    v88$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FSUB32(v83$1, v87$1);
    $$data$2[14bv32] := FSUB32(v83$2, v87$2);
    $$data$1[15bv32] := FSUB32(v84$1, v88$1);
    $$data$2[15bv32] := FSUB32(v84$2, v88$2);
    v89$1 := $$ifft1D_512.reversed8$0bv32$1;
    v89$2 := $$ifft1D_512.reversed8$0bv32$2;
    $$reversed8$1[0bv32] := v89$1;
    $$reversed8$2[0bv32] := v89$2;
    v90$1 := $$ifft1D_512.reversed8$1bv32$1;
    v90$2 := $$ifft1D_512.reversed8$1bv32$2;
    $$reversed8$1[1bv32] := v90$1;
    $$reversed8$2[1bv32] := v90$2;
    v91$1 := $$ifft1D_512.reversed8$2bv32$1;
    v91$2 := $$ifft1D_512.reversed8$2bv32$2;
    $$reversed8$1[2bv32] := v91$1;
    $$reversed8$2[2bv32] := v91$2;
    v92$1 := $$ifft1D_512.reversed8$3bv32$1;
    v92$2 := $$ifft1D_512.reversed8$3bv32$2;
    $$reversed8$1[3bv32] := v92$1;
    $$reversed8$2[3bv32] := v92$2;
    v93$1 := $$ifft1D_512.reversed8$4bv32$1;
    v93$2 := $$ifft1D_512.reversed8$4bv32$2;
    $$reversed8$1[4bv32] := v93$1;
    $$reversed8$2[4bv32] := v93$2;
    v94$1 := $$ifft1D_512.reversed8$5bv32$1;
    v94$2 := $$ifft1D_512.reversed8$5bv32$2;
    $$reversed8$1[5bv32] := v94$1;
    $$reversed8$2[5bv32] := v94$2;
    v95$1 := $$ifft1D_512.reversed8$6bv32$1;
    v95$2 := $$ifft1D_512.reversed8$6bv32$2;
    $$reversed8$1[6bv32] := v95$1;
    $$reversed8$2[6bv32] := v95$2;
    v96$1 := $$ifft1D_512.reversed8$7bv32$1;
    v96$2 := $$ifft1D_512.reversed8$7bv32$2;
    $$reversed8$1[7bv32] := v96$1;
    $$reversed8$2[7bv32] := v96$2;
    $j.0 := 1bv32;
    assume {:captureState "loop_entry_state_11_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_11"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 164} true;
    v97 := BV32_SLT($j.0, 8bv32);
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v97 && !v97;
    v104$1 := BV32_ADD(BV32_MUL(v2$1, 8bv32), v3$1);
    v104$2 := BV32_ADD(BV32_MUL(v2$2, 8bv32), v3$2);
    v105$1 := $$storex8.reversed$0bv32$1;
    v105$2 := $$storex8.reversed$0bv32$2;
    $$reversed.i$1[0bv32] := v105$1;
    $$reversed.i$2[0bv32] := v105$2;
    v106$1 := $$storex8.reversed$1bv32$1;
    v106$2 := $$storex8.reversed$1bv32$2;
    $$reversed.i$1[1bv32] := v106$1;
    $$reversed.i$2[1bv32] := v106$2;
    v107$1 := $$storex8.reversed$2bv32$1;
    v107$2 := $$storex8.reversed$2bv32$2;
    $$reversed.i$1[2bv32] := v107$1;
    $$reversed.i$2[2bv32] := v107$2;
    v108$1 := $$storex8.reversed$3bv32$1;
    v108$2 := $$storex8.reversed$3bv32$2;
    $$reversed.i$1[3bv32] := v108$1;
    $$reversed.i$2[3bv32] := v108$2;
    v109$1 := $$storex8.reversed$4bv32$1;
    v109$2 := $$storex8.reversed$4bv32$2;
    $$reversed.i$1[4bv32] := v109$1;
    $$reversed.i$2[4bv32] := v109$2;
    v110$1 := $$storex8.reversed$5bv32$1;
    v110$2 := $$storex8.reversed$5bv32$2;
    $$reversed.i$1[5bv32] := v110$1;
    $$reversed.i$2[5bv32] := v110$2;
    v111$1 := $$storex8.reversed$6bv32$1;
    v111$2 := $$storex8.reversed$6bv32$2;
    $$reversed.i$1[6bv32] := v111$1;
    $$reversed.i$2[6bv32] := v111$2;
    v112$1 := $$storex8.reversed$7bv32$1;
    v112$2 := $$storex8.reversed$7bv32$2;
    $$reversed.i$1[7bv32] := v112$1;
    $$reversed.i$2[7bv32] := v112$2;
    $i.i53.0 := 0bv32;
    assume {:captureState "loop_entry_state_10_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_10"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 189} true;
    v113 := BV32_SLT($i.i53.0, 8bv32);
    goto $truebb1, __partitioned_block_$falsebb1_0;

  __partitioned_block_$falsebb1_0:
    assume {:partition} !v113 && !v113;
    goto __partitioned_block_$falsebb1_1;

  __partitioned_block_$falsebb1_1:
    call {:sourceloc_num 196} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    v117$1 := BV32_ADD(BV32_MUL(v3$1, 66bv32), v2$1);
    v117$2 := BV32_ADD(BV32_MUL(v3$2, 66bv32), v2$2);
    $i.i50.0 := 0bv32;
    assume {:captureState "loop_entry_state_9_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_9"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 197} true;
    v118 := BV32_SLT($i.i50.0, 8bv32);
    goto $truebb2, __partitioned_block_$falsebb2_0;

  __partitioned_block_$falsebb2_0:
    assume {:partition} !v118 && !v118;
    goto __partitioned_block_$falsebb2_1;

  __partitioned_block_$falsebb2_1:
    call {:sourceloc_num 205} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    v122$1 := BV32_ADD(BV32_MUL(v2$1, 8bv32), v3$1);
    v122$2 := BV32_ADD(BV32_MUL(v2$2, 8bv32), v3$2);
    v123$1 := $$storey8.reversed$0bv32$1;
    v123$2 := $$storey8.reversed$0bv32$2;
    $$reversed.i$1[0bv32] := v123$1;
    $$reversed.i$2[0bv32] := v123$2;
    v124$1 := $$storey8.reversed$1bv32$1;
    v124$2 := $$storey8.reversed$1bv32$2;
    $$reversed.i$1[1bv32] := v124$1;
    $$reversed.i$2[1bv32] := v124$2;
    v125$1 := $$storey8.reversed$2bv32$1;
    v125$2 := $$storey8.reversed$2bv32$2;
    $$reversed.i$1[2bv32] := v125$1;
    $$reversed.i$2[2bv32] := v125$2;
    v126$1 := $$storey8.reversed$3bv32$1;
    v126$2 := $$storey8.reversed$3bv32$2;
    $$reversed.i$1[3bv32] := v126$1;
    $$reversed.i$2[3bv32] := v126$2;
    v127$1 := $$storey8.reversed$4bv32$1;
    v127$2 := $$storey8.reversed$4bv32$2;
    $$reversed.i$1[4bv32] := v127$1;
    $$reversed.i$2[4bv32] := v127$2;
    v128$1 := $$storey8.reversed$5bv32$1;
    v128$2 := $$storey8.reversed$5bv32$2;
    $$reversed.i$1[5bv32] := v128$1;
    $$reversed.i$2[5bv32] := v128$2;
    v129$1 := $$storey8.reversed$6bv32$1;
    v129$2 := $$storey8.reversed$6bv32$2;
    $$reversed.i$1[6bv32] := v129$1;
    $$reversed.i$2[6bv32] := v129$2;
    v130$1 := $$storey8.reversed$7bv32$1;
    v130$2 := $$storey8.reversed$7bv32$2;
    $$reversed.i$1[7bv32] := v130$1;
    $$reversed.i$2[7bv32] := v130$2;
    $i.i48.0 := 0bv32;
    assume {:captureState "loop_entry_state_8_0"} true;
    goto $11;

  $11:
    assume {:captureState "loop_head_state_8"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 222} true;
    v131 := BV32_SLT($i.i48.0, 8bv32);
    goto $truebb3, __partitioned_block_$falsebb3_0;

  __partitioned_block_$falsebb3_0:
    assume {:partition} !v131 && !v131;
    goto __partitioned_block_$falsebb3_1;

  __partitioned_block_$falsebb3_1:
    call {:sourceloc_num 229} $bugle_barrier_duplicated_2(1bv1, 0bv1);
    v135$1 := BV32_ADD(BV32_MUL(v3$1, 66bv32), v2$1);
    v135$2 := BV32_ADD(BV32_MUL(v3$2, 66bv32), v2$2);
    $i.i45.0 := 0bv32;
    assume {:captureState "loop_entry_state_7_0"} true;
    goto $13;

  $13:
    assume {:captureState "loop_head_state_7"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 230} true;
    v136 := BV32_SLT($i.i45.0, 8bv32);
    goto $truebb4, __partitioned_block_$falsebb4_0;

  __partitioned_block_$falsebb4_0:
    assume {:partition} !v136 && !v136;
    goto __partitioned_block_$falsebb4_1;

  __partitioned_block_$falsebb4_1:
    call {:sourceloc_num 238} $bugle_barrier_duplicated_3(1bv1, 0bv1);
    v140$1 := $$data$1[0bv32];
    v140$2 := $$data$2[0bv32];
    v141$1 := $$data$1[1bv32];
    v141$2 := $$data$2[1bv32];
    v142$1 := $$data$1[8bv32];
    v142$2 := $$data$2[8bv32];
    v143$1 := $$data$1[9bv32];
    v143$2 := $$data$2[9bv32];
    $$data$1[0bv32] := FADD32(v140$1, v142$1);
    $$data$2[0bv32] := FADD32(v140$2, v142$2);
    $$data$1[1bv32] := FADD32(v141$1, v143$1);
    $$data$2[1bv32] := FADD32(v141$2, v143$2);
    v144$1 := $$data$1[8bv32];
    v144$2 := $$data$2[8bv32];
    v145$1 := $$data$1[9bv32];
    v145$2 := $$data$2[9bv32];
    $$data$1[8bv32] := FSUB32(v140$1, v144$1);
    $$data$2[8bv32] := FSUB32(v140$2, v144$2);
    $$data$1[9bv32] := FSUB32(v141$1, v145$1);
    $$data$2[9bv32] := FSUB32(v141$2, v145$2);
    v146$1 := $$data$1[2bv32];
    v146$2 := $$data$2[2bv32];
    v147$1 := $$data$1[3bv32];
    v147$2 := $$data$2[3bv32];
    v148$1 := $$data$1[10bv32];
    v148$2 := $$data$2[10bv32];
    v149$1 := $$data$1[11bv32];
    v149$2 := $$data$2[11bv32];
    $$data$1[2bv32] := FADD32(v146$1, v148$1);
    $$data$2[2bv32] := FADD32(v146$2, v148$2);
    $$data$1[3bv32] := FADD32(v147$1, v149$1);
    $$data$2[3bv32] := FADD32(v147$2, v149$2);
    v150$1 := $$data$1[10bv32];
    v150$2 := $$data$2[10bv32];
    v151$1 := $$data$1[11bv32];
    v151$2 := $$data$2[11bv32];
    $$data$1[10bv32] := FSUB32(v146$1, v150$1);
    $$data$2[10bv32] := FSUB32(v146$2, v150$2);
    $$data$1[11bv32] := FSUB32(v147$1, v151$1);
    $$data$2[11bv32] := FSUB32(v147$2, v151$2);
    v152$1 := $$data$1[4bv32];
    v152$2 := $$data$2[4bv32];
    v153$1 := $$data$1[5bv32];
    v153$2 := $$data$2[5bv32];
    v154$1 := $$data$1[12bv32];
    v154$2 := $$data$2[12bv32];
    v155$1 := $$data$1[13bv32];
    v155$2 := $$data$2[13bv32];
    $$data$1[4bv32] := FADD32(v152$1, v154$1);
    $$data$2[4bv32] := FADD32(v152$2, v154$2);
    $$data$1[5bv32] := FADD32(v153$1, v155$1);
    $$data$2[5bv32] := FADD32(v153$2, v155$2);
    v156$1 := $$data$1[12bv32];
    v156$2 := $$data$2[12bv32];
    v157$1 := $$data$1[13bv32];
    v157$2 := $$data$2[13bv32];
    $$data$1[12bv32] := FSUB32(v152$1, v156$1);
    $$data$2[12bv32] := FSUB32(v152$2, v156$2);
    $$data$1[13bv32] := FSUB32(v153$1, v157$1);
    $$data$2[13bv32] := FSUB32(v153$2, v157$2);
    v158$1 := $$data$1[6bv32];
    v158$2 := $$data$2[6bv32];
    v159$1 := $$data$1[7bv32];
    v159$2 := $$data$2[7bv32];
    v160$1 := $$data$1[14bv32];
    v160$2 := $$data$2[14bv32];
    v161$1 := $$data$1[15bv32];
    v161$2 := $$data$2[15bv32];
    $$data$1[6bv32] := FADD32(v158$1, v160$1);
    $$data$2[6bv32] := FADD32(v158$2, v160$2);
    $$data$1[7bv32] := FADD32(v159$1, v161$1);
    $$data$2[7bv32] := FADD32(v159$2, v161$2);
    v162$1 := $$data$1[14bv32];
    v162$2 := $$data$2[14bv32];
    v163$1 := $$data$1[15bv32];
    v163$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FSUB32(v158$1, v162$1);
    $$data$2[14bv32] := FSUB32(v158$2, v162$2);
    $$data$1[15bv32] := FSUB32(v159$1, v163$1);
    $$data$2[15bv32] := FSUB32(v159$2, v163$2);
    v164$1 := $$data$1[10bv32];
    v164$2 := $$data$2[10bv32];
    v165$1 := $$data$1[11bv32];
    v165$2 := $$data$2[11bv32];
    $$data$1[10bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v164$1, 1065353216bv32), FSUB32(2147483648bv32, FMUL32(v165$1, 1065353216bv32))));
    $$data$2[10bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v164$2, 1065353216bv32), FSUB32(2147483648bv32, FMUL32(v165$2, 1065353216bv32))));
    $$data$1[11bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v164$1, 1065353216bv32), FMUL32(v165$1, 1065353216bv32)));
    $$data$2[11bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v164$2, 1065353216bv32), FMUL32(v165$2, 1065353216bv32)));
    v166$1 := $$data$1[12bv32];
    v166$2 := $$data$2[12bv32];
    v167$1 := $$data$1[13bv32];
    v167$2 := $$data$2[13bv32];
    $$data$1[12bv32] := FADD32(FMUL32(v166$1, 0bv32), FSUB32(2147483648bv32, FMUL32(v167$1, 1065353216bv32)));
    $$data$2[12bv32] := FADD32(FMUL32(v166$2, 0bv32), FSUB32(2147483648bv32, FMUL32(v167$2, 1065353216bv32)));
    $$data$1[13bv32] := FADD32(FMUL32(v166$1, 1065353216bv32), FMUL32(v167$1, 0bv32));
    $$data$2[13bv32] := FADD32(FMUL32(v166$2, 1065353216bv32), FMUL32(v167$2, 0bv32));
    v168$1 := $$data$1[14bv32];
    v168$2 := $$data$2[14bv32];
    v169$1 := $$data$1[15bv32];
    v169$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v168$1, 3212836864bv32), FSUB32(2147483648bv32, FMUL32(v169$1, 1065353216bv32))));
    $$data$2[14bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v168$2, 3212836864bv32), FSUB32(2147483648bv32, FMUL32(v169$2, 1065353216bv32))));
    $$data$1[15bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v168$1, 1065353216bv32), FMUL32(v169$1, 3212836864bv32)));
    $$data$2[15bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v168$2, 1065353216bv32), FMUL32(v169$2, 3212836864bv32)));
    v170$1 := $$data$1[0bv32];
    v170$2 := $$data$2[0bv32];
    v171$1 := $$data$1[1bv32];
    v171$2 := $$data$2[1bv32];
    v172$1 := $$data$1[4bv32];
    v172$2 := $$data$2[4bv32];
    v173$1 := $$data$1[5bv32];
    v173$2 := $$data$2[5bv32];
    $$data$1[0bv32] := FADD32(v170$1, v172$1);
    $$data$2[0bv32] := FADD32(v170$2, v172$2);
    $$data$1[1bv32] := FADD32(v171$1, v173$1);
    $$data$2[1bv32] := FADD32(v171$2, v173$2);
    v174$1 := $$data$1[4bv32];
    v174$2 := $$data$2[4bv32];
    v175$1 := $$data$1[5bv32];
    v175$2 := $$data$2[5bv32];
    $$data$1[4bv32] := FSUB32(v170$1, v174$1);
    $$data$2[4bv32] := FSUB32(v170$2, v174$2);
    $$data$1[5bv32] := FSUB32(v171$1, v175$1);
    $$data$2[5bv32] := FSUB32(v171$2, v175$2);
    v176$1 := $$data$1[2bv32];
    v176$2 := $$data$2[2bv32];
    v177$1 := $$data$1[3bv32];
    v177$2 := $$data$2[3bv32];
    v178$1 := $$data$1[6bv32];
    v178$2 := $$data$2[6bv32];
    v179$1 := $$data$1[7bv32];
    v179$2 := $$data$2[7bv32];
    $$data$1[2bv32] := FADD32(v176$1, v178$1);
    $$data$2[2bv32] := FADD32(v176$2, v178$2);
    $$data$1[3bv32] := FADD32(v177$1, v179$1);
    $$data$2[3bv32] := FADD32(v177$2, v179$2);
    v180$1 := $$data$1[6bv32];
    v180$2 := $$data$2[6bv32];
    v181$1 := $$data$1[7bv32];
    v181$2 := $$data$2[7bv32];
    $$data$1[6bv32] := FSUB32(v176$1, v180$1);
    $$data$2[6bv32] := FSUB32(v176$2, v180$2);
    $$data$1[7bv32] := FSUB32(v177$1, v181$1);
    $$data$2[7bv32] := FSUB32(v177$2, v181$2);
    v182$1 := $$data$1[6bv32];
    v182$2 := $$data$2[6bv32];
    v183$1 := $$data$1[7bv32];
    v183$2 := $$data$2[7bv32];
    $$data$1[6bv32] := FADD32(FMUL32(v182$1, 0bv32), FSUB32(2147483648bv32, FMUL32(v183$1, 1065353216bv32)));
    $$data$2[6bv32] := FADD32(FMUL32(v182$2, 0bv32), FSUB32(2147483648bv32, FMUL32(v183$2, 1065353216bv32)));
    $$data$1[7bv32] := FADD32(FMUL32(v182$1, 1065353216bv32), FMUL32(v183$1, 0bv32));
    $$data$2[7bv32] := FADD32(FMUL32(v182$2, 1065353216bv32), FMUL32(v183$2, 0bv32));
    v184$1 := $$data$1[0bv32];
    v184$2 := $$data$2[0bv32];
    v185$1 := $$data$1[1bv32];
    v185$2 := $$data$2[1bv32];
    v186$1 := $$data$1[2bv32];
    v186$2 := $$data$2[2bv32];
    v187$1 := $$data$1[3bv32];
    v187$2 := $$data$2[3bv32];
    $$data$1[0bv32] := FADD32(v184$1, v186$1);
    $$data$2[0bv32] := FADD32(v184$2, v186$2);
    $$data$1[1bv32] := FADD32(v185$1, v187$1);
    $$data$2[1bv32] := FADD32(v185$2, v187$2);
    v188$1 := $$data$1[2bv32];
    v188$2 := $$data$2[2bv32];
    v189$1 := $$data$1[3bv32];
    v189$2 := $$data$2[3bv32];
    $$data$1[2bv32] := FSUB32(v184$1, v188$1);
    $$data$2[2bv32] := FSUB32(v184$2, v188$2);
    $$data$1[3bv32] := FSUB32(v185$1, v189$1);
    $$data$2[3bv32] := FSUB32(v185$2, v189$2);
    v190$1 := $$data$1[4bv32];
    v190$2 := $$data$2[4bv32];
    v191$1 := $$data$1[5bv32];
    v191$2 := $$data$2[5bv32];
    v192$1 := $$data$1[6bv32];
    v192$2 := $$data$2[6bv32];
    v193$1 := $$data$1[7bv32];
    v193$2 := $$data$2[7bv32];
    $$data$1[4bv32] := FADD32(v190$1, v192$1);
    $$data$2[4bv32] := FADD32(v190$2, v192$2);
    $$data$1[5bv32] := FADD32(v191$1, v193$1);
    $$data$2[5bv32] := FADD32(v191$2, v193$2);
    v194$1 := $$data$1[6bv32];
    v194$2 := $$data$2[6bv32];
    v195$1 := $$data$1[7bv32];
    v195$2 := $$data$2[7bv32];
    $$data$1[6bv32] := FSUB32(v190$1, v194$1);
    $$data$2[6bv32] := FSUB32(v190$2, v194$2);
    $$data$1[7bv32] := FSUB32(v191$1, v195$1);
    $$data$2[7bv32] := FSUB32(v191$2, v195$2);
    v196$1 := $$data$1[8bv32];
    v196$2 := $$data$2[8bv32];
    v197$1 := $$data$1[9bv32];
    v197$2 := $$data$2[9bv32];
    v198$1 := $$data$1[12bv32];
    v198$2 := $$data$2[12bv32];
    v199$1 := $$data$1[13bv32];
    v199$2 := $$data$2[13bv32];
    $$data$1[8bv32] := FADD32(v196$1, v198$1);
    $$data$2[8bv32] := FADD32(v196$2, v198$2);
    $$data$1[9bv32] := FADD32(v197$1, v199$1);
    $$data$2[9bv32] := FADD32(v197$2, v199$2);
    v200$1 := $$data$1[12bv32];
    v200$2 := $$data$2[12bv32];
    v201$1 := $$data$1[13bv32];
    v201$2 := $$data$2[13bv32];
    $$data$1[12bv32] := FSUB32(v196$1, v200$1);
    $$data$2[12bv32] := FSUB32(v196$2, v200$2);
    $$data$1[13bv32] := FSUB32(v197$1, v201$1);
    $$data$2[13bv32] := FSUB32(v197$2, v201$2);
    v202$1 := $$data$1[10bv32];
    v202$2 := $$data$2[10bv32];
    v203$1 := $$data$1[11bv32];
    v203$2 := $$data$2[11bv32];
    v204$1 := $$data$1[14bv32];
    v204$2 := $$data$2[14bv32];
    v205$1 := $$data$1[15bv32];
    v205$2 := $$data$2[15bv32];
    $$data$1[10bv32] := FADD32(v202$1, v204$1);
    $$data$2[10bv32] := FADD32(v202$2, v204$2);
    $$data$1[11bv32] := FADD32(v203$1, v205$1);
    $$data$2[11bv32] := FADD32(v203$2, v205$2);
    v206$1 := $$data$1[14bv32];
    v206$2 := $$data$2[14bv32];
    v207$1 := $$data$1[15bv32];
    v207$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FSUB32(v202$1, v206$1);
    $$data$2[14bv32] := FSUB32(v202$2, v206$2);
    $$data$1[15bv32] := FSUB32(v203$1, v207$1);
    $$data$2[15bv32] := FSUB32(v203$2, v207$2);
    v208$1 := $$data$1[14bv32];
    v208$2 := $$data$2[14bv32];
    v209$1 := $$data$1[15bv32];
    v209$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FADD32(FMUL32(v208$1, 0bv32), FSUB32(2147483648bv32, FMUL32(v209$1, 1065353216bv32)));
    $$data$2[14bv32] := FADD32(FMUL32(v208$2, 0bv32), FSUB32(2147483648bv32, FMUL32(v209$2, 1065353216bv32)));
    $$data$1[15bv32] := FADD32(FMUL32(v208$1, 1065353216bv32), FMUL32(v209$1, 0bv32));
    $$data$2[15bv32] := FADD32(FMUL32(v208$2, 1065353216bv32), FMUL32(v209$2, 0bv32));
    v210$1 := $$data$1[8bv32];
    v210$2 := $$data$2[8bv32];
    v211$1 := $$data$1[9bv32];
    v211$2 := $$data$2[9bv32];
    v212$1 := $$data$1[10bv32];
    v212$2 := $$data$2[10bv32];
    v213$1 := $$data$1[11bv32];
    v213$2 := $$data$2[11bv32];
    $$data$1[8bv32] := FADD32(v210$1, v212$1);
    $$data$2[8bv32] := FADD32(v210$2, v212$2);
    $$data$1[9bv32] := FADD32(v211$1, v213$1);
    $$data$2[9bv32] := FADD32(v211$2, v213$2);
    v214$1 := $$data$1[10bv32];
    v214$2 := $$data$2[10bv32];
    v215$1 := $$data$1[11bv32];
    v215$2 := $$data$2[11bv32];
    $$data$1[10bv32] := FSUB32(v210$1, v214$1);
    $$data$2[10bv32] := FSUB32(v210$2, v214$2);
    $$data$1[11bv32] := FSUB32(v211$1, v215$1);
    $$data$2[11bv32] := FSUB32(v211$2, v215$2);
    v216$1 := $$data$1[12bv32];
    v216$2 := $$data$2[12bv32];
    v217$1 := $$data$1[13bv32];
    v217$2 := $$data$2[13bv32];
    v218$1 := $$data$1[14bv32];
    v218$2 := $$data$2[14bv32];
    v219$1 := $$data$1[15bv32];
    v219$2 := $$data$2[15bv32];
    $$data$1[12bv32] := FADD32(v216$1, v218$1);
    $$data$2[12bv32] := FADD32(v216$2, v218$2);
    $$data$1[13bv32] := FADD32(v217$1, v219$1);
    $$data$2[13bv32] := FADD32(v217$2, v219$2);
    v220$1 := $$data$1[14bv32];
    v220$2 := $$data$2[14bv32];
    v221$1 := $$data$1[15bv32];
    v221$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FSUB32(v216$1, v220$1);
    $$data$2[14bv32] := FSUB32(v216$2, v220$2);
    $$data$1[15bv32] := FSUB32(v217$1, v221$1);
    $$data$2[15bv32] := FSUB32(v217$2, v221$2);
    v222$1 := $$ifft1D_512.reversed81$0bv32$1;
    v222$2 := $$ifft1D_512.reversed81$0bv32$2;
    $$reversed824$1[0bv32] := v222$1;
    $$reversed824$2[0bv32] := v222$2;
    v223$1 := $$ifft1D_512.reversed81$1bv32$1;
    v223$2 := $$ifft1D_512.reversed81$1bv32$2;
    $$reversed824$1[1bv32] := v223$1;
    $$reversed824$2[1bv32] := v223$2;
    v224$1 := $$ifft1D_512.reversed81$2bv32$1;
    v224$2 := $$ifft1D_512.reversed81$2bv32$2;
    $$reversed824$1[2bv32] := v224$1;
    $$reversed824$2[2bv32] := v224$2;
    v225$1 := $$ifft1D_512.reversed81$3bv32$1;
    v225$2 := $$ifft1D_512.reversed81$3bv32$2;
    $$reversed824$1[3bv32] := v225$1;
    $$reversed824$2[3bv32] := v225$2;
    v226$1 := $$ifft1D_512.reversed81$4bv32$1;
    v226$2 := $$ifft1D_512.reversed81$4bv32$2;
    $$reversed824$1[4bv32] := v226$1;
    $$reversed824$2[4bv32] := v226$2;
    v227$1 := $$ifft1D_512.reversed81$5bv32$1;
    v227$2 := $$ifft1D_512.reversed81$5bv32$2;
    $$reversed824$1[5bv32] := v227$1;
    $$reversed824$2[5bv32] := v227$2;
    v228$1 := $$ifft1D_512.reversed81$6bv32$1;
    v228$2 := $$ifft1D_512.reversed81$6bv32$2;
    $$reversed824$1[6bv32] := v228$1;
    $$reversed824$2[6bv32] := v228$2;
    v229$1 := $$ifft1D_512.reversed81$7bv32$1;
    v229$2 := $$ifft1D_512.reversed81$7bv32$2;
    $$reversed824$1[7bv32] := v229$1;
    $$reversed824$2[7bv32] := v229$2;
    $j25.0 := 1bv32;
    assume {:captureState "loop_entry_state_6_0"} true;
    goto $15;

  $15:
    assume {:captureState "loop_head_state_6"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 395} true;
    v230 := BV32_SLT($j25.0, 8bv32);
    goto $truebb5, $falsebb5;

  $falsebb5:
    assume {:partition} !v230 && !v230;
    v237$1 := BV32_ADD(BV32_MUL(v2$1, 8bv32), v3$1);
    v237$2 := BV32_ADD(BV32_MUL(v2$2, 8bv32), v3$2);
    v238$1 := $$storex8.reversed$0bv32$1;
    v238$2 := $$storex8.reversed$0bv32$2;
    $$reversed.i$1[0bv32] := v238$1;
    $$reversed.i$2[0bv32] := v238$2;
    v239$1 := $$storex8.reversed$1bv32$1;
    v239$2 := $$storex8.reversed$1bv32$2;
    $$reversed.i$1[1bv32] := v239$1;
    $$reversed.i$2[1bv32] := v239$2;
    v240$1 := $$storex8.reversed$2bv32$1;
    v240$2 := $$storex8.reversed$2bv32$2;
    $$reversed.i$1[2bv32] := v240$1;
    $$reversed.i$2[2bv32] := v240$2;
    v241$1 := $$storex8.reversed$3bv32$1;
    v241$2 := $$storex8.reversed$3bv32$2;
    $$reversed.i$1[3bv32] := v241$1;
    $$reversed.i$2[3bv32] := v241$2;
    v242$1 := $$storex8.reversed$4bv32$1;
    v242$2 := $$storex8.reversed$4bv32$2;
    $$reversed.i$1[4bv32] := v242$1;
    $$reversed.i$2[4bv32] := v242$2;
    v243$1 := $$storex8.reversed$5bv32$1;
    v243$2 := $$storex8.reversed$5bv32$2;
    $$reversed.i$1[5bv32] := v243$1;
    $$reversed.i$2[5bv32] := v243$2;
    v244$1 := $$storex8.reversed$6bv32$1;
    v244$2 := $$storex8.reversed$6bv32$2;
    $$reversed.i$1[6bv32] := v244$1;
    $$reversed.i$2[6bv32] := v244$2;
    v245$1 := $$storex8.reversed$7bv32$1;
    v245$2 := $$storex8.reversed$7bv32$2;
    $$reversed.i$1[7bv32] := v245$1;
    $$reversed.i$2[7bv32] := v245$2;
    $i.i44.0 := 0bv32;
    assume {:captureState "loop_entry_state_5_0"} true;
    goto $19;

  $19:
    assume {:captureState "loop_head_state_5"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 420} true;
    v246 := BV32_SLT($i.i44.0, 8bv32);
    goto $truebb6, __partitioned_block_$falsebb6_0;

  __partitioned_block_$falsebb6_0:
    assume {:partition} !v246 && !v246;
    goto __partitioned_block_$falsebb6_1;

  __partitioned_block_$falsebb6_1:
    call {:sourceloc_num 427} $bugle_barrier_duplicated_4(1bv1, 0bv1);
    v250$1 := BV32_ADD(BV32_MUL(BV32_MUL(v2$1, 8bv32), 9bv32), v3$1);
    v250$2 := BV32_ADD(BV32_MUL(BV32_MUL(v2$2, 8bv32), 9bv32), v3$2);
    $i.i42.0 := 0bv32;
    assume {:captureState "loop_entry_state_4_0"} true;
    goto $21;

  $21:
    assume {:captureState "loop_head_state_4"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 428} true;
    v251 := BV32_SLT($i.i42.0, 8bv32);
    goto $truebb7, __partitioned_block_$falsebb7_0;

  __partitioned_block_$falsebb7_0:
    assume {:partition} !v251 && !v251;
    goto __partitioned_block_$falsebb7_1;

  __partitioned_block_$falsebb7_1:
    call {:sourceloc_num 436} $bugle_barrier_duplicated_5(1bv1, 0bv1);
    v255$1 := BV32_ADD(BV32_MUL(v2$1, 8bv32), v3$1);
    v255$2 := BV32_ADD(BV32_MUL(v2$2, 8bv32), v3$2);
    v256$1 := $$storey8.reversed$0bv32$1;
    v256$2 := $$storey8.reversed$0bv32$2;
    $$reversed.i$1[0bv32] := v256$1;
    $$reversed.i$2[0bv32] := v256$2;
    v257$1 := $$storey8.reversed$1bv32$1;
    v257$2 := $$storey8.reversed$1bv32$2;
    $$reversed.i$1[1bv32] := v257$1;
    $$reversed.i$2[1bv32] := v257$2;
    v258$1 := $$storey8.reversed$2bv32$1;
    v258$2 := $$storey8.reversed$2bv32$2;
    $$reversed.i$1[2bv32] := v258$1;
    $$reversed.i$2[2bv32] := v258$2;
    v259$1 := $$storey8.reversed$3bv32$1;
    v259$2 := $$storey8.reversed$3bv32$2;
    $$reversed.i$1[3bv32] := v259$1;
    $$reversed.i$2[3bv32] := v259$2;
    v260$1 := $$storey8.reversed$4bv32$1;
    v260$2 := $$storey8.reversed$4bv32$2;
    $$reversed.i$1[4bv32] := v260$1;
    $$reversed.i$2[4bv32] := v260$2;
    v261$1 := $$storey8.reversed$5bv32$1;
    v261$2 := $$storey8.reversed$5bv32$2;
    $$reversed.i$1[5bv32] := v261$1;
    $$reversed.i$2[5bv32] := v261$2;
    v262$1 := $$storey8.reversed$6bv32$1;
    v262$2 := $$storey8.reversed$6bv32$2;
    $$reversed.i$1[6bv32] := v262$1;
    $$reversed.i$2[6bv32] := v262$2;
    v263$1 := $$storey8.reversed$7bv32$1;
    v263$2 := $$storey8.reversed$7bv32$2;
    $$reversed.i$1[7bv32] := v263$1;
    $$reversed.i$2[7bv32] := v263$2;
    $i.i41.0 := 0bv32;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $23;

  $23:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 453} true;
    v264 := BV32_SLT($i.i41.0, 8bv32);
    goto $truebb8, __partitioned_block_$falsebb8_0;

  __partitioned_block_$falsebb8_0:
    assume {:partition} !v264 && !v264;
    goto __partitioned_block_$falsebb8_1;

  __partitioned_block_$falsebb8_1:
    call {:sourceloc_num 460} $bugle_barrier_duplicated_6(1bv1, 0bv1);
    v268$1 := BV32_ADD(BV32_MUL(BV32_MUL(v2$1, 8bv32), 9bv32), v3$1);
    v268$2 := BV32_ADD(BV32_MUL(BV32_MUL(v2$2, 8bv32), 9bv32), v3$2);
    $i.i39.0 := 0bv32;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $25;

  $25:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 461} true;
    v269 := BV32_SLT($i.i39.0, 8bv32);
    goto $truebb9, $falsebb9;

  $falsebb9:
    assume {:partition} !v269 && !v269;
    v273$1 := $$data$1[0bv32];
    v273$2 := $$data$2[0bv32];
    v274$1 := $$data$1[1bv32];
    v274$2 := $$data$2[1bv32];
    v275$1 := $$data$1[8bv32];
    v275$2 := $$data$2[8bv32];
    v276$1 := $$data$1[9bv32];
    v276$2 := $$data$2[9bv32];
    $$data$1[0bv32] := FADD32(v273$1, v275$1);
    $$data$2[0bv32] := FADD32(v273$2, v275$2);
    $$data$1[1bv32] := FADD32(v274$1, v276$1);
    $$data$2[1bv32] := FADD32(v274$2, v276$2);
    v277$1 := $$data$1[8bv32];
    v277$2 := $$data$2[8bv32];
    v278$1 := $$data$1[9bv32];
    v278$2 := $$data$2[9bv32];
    $$data$1[8bv32] := FSUB32(v273$1, v277$1);
    $$data$2[8bv32] := FSUB32(v273$2, v277$2);
    $$data$1[9bv32] := FSUB32(v274$1, v278$1);
    $$data$2[9bv32] := FSUB32(v274$2, v278$2);
    v279$1 := $$data$1[2bv32];
    v279$2 := $$data$2[2bv32];
    v280$1 := $$data$1[3bv32];
    v280$2 := $$data$2[3bv32];
    v281$1 := $$data$1[10bv32];
    v281$2 := $$data$2[10bv32];
    v282$1 := $$data$1[11bv32];
    v282$2 := $$data$2[11bv32];
    $$data$1[2bv32] := FADD32(v279$1, v281$1);
    $$data$2[2bv32] := FADD32(v279$2, v281$2);
    $$data$1[3bv32] := FADD32(v280$1, v282$1);
    $$data$2[3bv32] := FADD32(v280$2, v282$2);
    v283$1 := $$data$1[10bv32];
    v283$2 := $$data$2[10bv32];
    v284$1 := $$data$1[11bv32];
    v284$2 := $$data$2[11bv32];
    $$data$1[10bv32] := FSUB32(v279$1, v283$1);
    $$data$2[10bv32] := FSUB32(v279$2, v283$2);
    $$data$1[11bv32] := FSUB32(v280$1, v284$1);
    $$data$2[11bv32] := FSUB32(v280$2, v284$2);
    v285$1 := $$data$1[4bv32];
    v285$2 := $$data$2[4bv32];
    v286$1 := $$data$1[5bv32];
    v286$2 := $$data$2[5bv32];
    v287$1 := $$data$1[12bv32];
    v287$2 := $$data$2[12bv32];
    v288$1 := $$data$1[13bv32];
    v288$2 := $$data$2[13bv32];
    $$data$1[4bv32] := FADD32(v285$1, v287$1);
    $$data$2[4bv32] := FADD32(v285$2, v287$2);
    $$data$1[5bv32] := FADD32(v286$1, v288$1);
    $$data$2[5bv32] := FADD32(v286$2, v288$2);
    v289$1 := $$data$1[12bv32];
    v289$2 := $$data$2[12bv32];
    v290$1 := $$data$1[13bv32];
    v290$2 := $$data$2[13bv32];
    $$data$1[12bv32] := FSUB32(v285$1, v289$1);
    $$data$2[12bv32] := FSUB32(v285$2, v289$2);
    $$data$1[13bv32] := FSUB32(v286$1, v290$1);
    $$data$2[13bv32] := FSUB32(v286$2, v290$2);
    v291$1 := $$data$1[6bv32];
    v291$2 := $$data$2[6bv32];
    v292$1 := $$data$1[7bv32];
    v292$2 := $$data$2[7bv32];
    v293$1 := $$data$1[14bv32];
    v293$2 := $$data$2[14bv32];
    v294$1 := $$data$1[15bv32];
    v294$2 := $$data$2[15bv32];
    $$data$1[6bv32] := FADD32(v291$1, v293$1);
    $$data$2[6bv32] := FADD32(v291$2, v293$2);
    $$data$1[7bv32] := FADD32(v292$1, v294$1);
    $$data$2[7bv32] := FADD32(v292$2, v294$2);
    v295$1 := $$data$1[14bv32];
    v295$2 := $$data$2[14bv32];
    v296$1 := $$data$1[15bv32];
    v296$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FSUB32(v291$1, v295$1);
    $$data$2[14bv32] := FSUB32(v291$2, v295$2);
    $$data$1[15bv32] := FSUB32(v292$1, v296$1);
    $$data$2[15bv32] := FSUB32(v292$2, v296$2);
    v297$1 := $$data$1[10bv32];
    v297$2 := $$data$2[10bv32];
    v298$1 := $$data$1[11bv32];
    v298$2 := $$data$2[11bv32];
    $$data$1[10bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v297$1, 1065353216bv32), FSUB32(2147483648bv32, FMUL32(v298$1, 1065353216bv32))));
    $$data$2[10bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v297$2, 1065353216bv32), FSUB32(2147483648bv32, FMUL32(v298$2, 1065353216bv32))));
    $$data$1[11bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v297$1, 1065353216bv32), FMUL32(v298$1, 1065353216bv32)));
    $$data$2[11bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v297$2, 1065353216bv32), FMUL32(v298$2, 1065353216bv32)));
    v299$1 := $$data$1[12bv32];
    v299$2 := $$data$2[12bv32];
    v300$1 := $$data$1[13bv32];
    v300$2 := $$data$2[13bv32];
    $$data$1[12bv32] := FADD32(FMUL32(v299$1, 0bv32), FSUB32(2147483648bv32, FMUL32(v300$1, 1065353216bv32)));
    $$data$2[12bv32] := FADD32(FMUL32(v299$2, 0bv32), FSUB32(2147483648bv32, FMUL32(v300$2, 1065353216bv32)));
    $$data$1[13bv32] := FADD32(FMUL32(v299$1, 1065353216bv32), FMUL32(v300$1, 0bv32));
    $$data$2[13bv32] := FADD32(FMUL32(v299$2, 1065353216bv32), FMUL32(v300$2, 0bv32));
    v301$1 := $$data$1[14bv32];
    v301$2 := $$data$2[14bv32];
    v302$1 := $$data$1[15bv32];
    v302$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v301$1, 3212836864bv32), FSUB32(2147483648bv32, FMUL32(v302$1, 1065353216bv32))));
    $$data$2[14bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v301$2, 3212836864bv32), FSUB32(2147483648bv32, FMUL32(v302$2, 1065353216bv32))));
    $$data$1[15bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v301$1, 1065353216bv32), FMUL32(v302$1, 3212836864bv32)));
    $$data$2[15bv32] := FMUL32(1060439283bv32, FADD32(FMUL32(v301$2, 1065353216bv32), FMUL32(v302$2, 3212836864bv32)));
    v303$1 := $$data$1[0bv32];
    v303$2 := $$data$2[0bv32];
    v304$1 := $$data$1[1bv32];
    v304$2 := $$data$2[1bv32];
    v305$1 := $$data$1[4bv32];
    v305$2 := $$data$2[4bv32];
    v306$1 := $$data$1[5bv32];
    v306$2 := $$data$2[5bv32];
    $$data$1[0bv32] := FADD32(v303$1, v305$1);
    $$data$2[0bv32] := FADD32(v303$2, v305$2);
    $$data$1[1bv32] := FADD32(v304$1, v306$1);
    $$data$2[1bv32] := FADD32(v304$2, v306$2);
    v307$1 := $$data$1[4bv32];
    v307$2 := $$data$2[4bv32];
    v308$1 := $$data$1[5bv32];
    v308$2 := $$data$2[5bv32];
    $$data$1[4bv32] := FSUB32(v303$1, v307$1);
    $$data$2[4bv32] := FSUB32(v303$2, v307$2);
    $$data$1[5bv32] := FSUB32(v304$1, v308$1);
    $$data$2[5bv32] := FSUB32(v304$2, v308$2);
    v309$1 := $$data$1[2bv32];
    v309$2 := $$data$2[2bv32];
    v310$1 := $$data$1[3bv32];
    v310$2 := $$data$2[3bv32];
    v311$1 := $$data$1[6bv32];
    v311$2 := $$data$2[6bv32];
    v312$1 := $$data$1[7bv32];
    v312$2 := $$data$2[7bv32];
    $$data$1[2bv32] := FADD32(v309$1, v311$1);
    $$data$2[2bv32] := FADD32(v309$2, v311$2);
    $$data$1[3bv32] := FADD32(v310$1, v312$1);
    $$data$2[3bv32] := FADD32(v310$2, v312$2);
    v313$1 := $$data$1[6bv32];
    v313$2 := $$data$2[6bv32];
    v314$1 := $$data$1[7bv32];
    v314$2 := $$data$2[7bv32];
    $$data$1[6bv32] := FSUB32(v309$1, v313$1);
    $$data$2[6bv32] := FSUB32(v309$2, v313$2);
    $$data$1[7bv32] := FSUB32(v310$1, v314$1);
    $$data$2[7bv32] := FSUB32(v310$2, v314$2);
    v315$1 := $$data$1[6bv32];
    v315$2 := $$data$2[6bv32];
    v316$1 := $$data$1[7bv32];
    v316$2 := $$data$2[7bv32];
    $$data$1[6bv32] := FADD32(FMUL32(v315$1, 0bv32), FSUB32(2147483648bv32, FMUL32(v316$1, 1065353216bv32)));
    $$data$2[6bv32] := FADD32(FMUL32(v315$2, 0bv32), FSUB32(2147483648bv32, FMUL32(v316$2, 1065353216bv32)));
    $$data$1[7bv32] := FADD32(FMUL32(v315$1, 1065353216bv32), FMUL32(v316$1, 0bv32));
    $$data$2[7bv32] := FADD32(FMUL32(v315$2, 1065353216bv32), FMUL32(v316$2, 0bv32));
    v317$1 := $$data$1[0bv32];
    v317$2 := $$data$2[0bv32];
    v318$1 := $$data$1[1bv32];
    v318$2 := $$data$2[1bv32];
    v319$1 := $$data$1[2bv32];
    v319$2 := $$data$2[2bv32];
    v320$1 := $$data$1[3bv32];
    v320$2 := $$data$2[3bv32];
    $$data$1[0bv32] := FADD32(v317$1, v319$1);
    $$data$2[0bv32] := FADD32(v317$2, v319$2);
    $$data$1[1bv32] := FADD32(v318$1, v320$1);
    $$data$2[1bv32] := FADD32(v318$2, v320$2);
    v321$1 := $$data$1[2bv32];
    v321$2 := $$data$2[2bv32];
    v322$1 := $$data$1[3bv32];
    v322$2 := $$data$2[3bv32];
    $$data$1[2bv32] := FSUB32(v317$1, v321$1);
    $$data$2[2bv32] := FSUB32(v317$2, v321$2);
    $$data$1[3bv32] := FSUB32(v318$1, v322$1);
    $$data$2[3bv32] := FSUB32(v318$2, v322$2);
    v323$1 := $$data$1[4bv32];
    v323$2 := $$data$2[4bv32];
    v324$1 := $$data$1[5bv32];
    v324$2 := $$data$2[5bv32];
    v325$1 := $$data$1[6bv32];
    v325$2 := $$data$2[6bv32];
    v326$1 := $$data$1[7bv32];
    v326$2 := $$data$2[7bv32];
    $$data$1[4bv32] := FADD32(v323$1, v325$1);
    $$data$2[4bv32] := FADD32(v323$2, v325$2);
    $$data$1[5bv32] := FADD32(v324$1, v326$1);
    $$data$2[5bv32] := FADD32(v324$2, v326$2);
    v327$1 := $$data$1[6bv32];
    v327$2 := $$data$2[6bv32];
    v328$1 := $$data$1[7bv32];
    v328$2 := $$data$2[7bv32];
    $$data$1[6bv32] := FSUB32(v323$1, v327$1);
    $$data$2[6bv32] := FSUB32(v323$2, v327$2);
    $$data$1[7bv32] := FSUB32(v324$1, v328$1);
    $$data$2[7bv32] := FSUB32(v324$2, v328$2);
    v329$1 := $$data$1[8bv32];
    v329$2 := $$data$2[8bv32];
    v330$1 := $$data$1[9bv32];
    v330$2 := $$data$2[9bv32];
    v331$1 := $$data$1[12bv32];
    v331$2 := $$data$2[12bv32];
    v332$1 := $$data$1[13bv32];
    v332$2 := $$data$2[13bv32];
    $$data$1[8bv32] := FADD32(v329$1, v331$1);
    $$data$2[8bv32] := FADD32(v329$2, v331$2);
    $$data$1[9bv32] := FADD32(v330$1, v332$1);
    $$data$2[9bv32] := FADD32(v330$2, v332$2);
    v333$1 := $$data$1[12bv32];
    v333$2 := $$data$2[12bv32];
    v334$1 := $$data$1[13bv32];
    v334$2 := $$data$2[13bv32];
    $$data$1[12bv32] := FSUB32(v329$1, v333$1);
    $$data$2[12bv32] := FSUB32(v329$2, v333$2);
    $$data$1[13bv32] := FSUB32(v330$1, v334$1);
    $$data$2[13bv32] := FSUB32(v330$2, v334$2);
    v335$1 := $$data$1[10bv32];
    v335$2 := $$data$2[10bv32];
    v336$1 := $$data$1[11bv32];
    v336$2 := $$data$2[11bv32];
    v337$1 := $$data$1[14bv32];
    v337$2 := $$data$2[14bv32];
    v338$1 := $$data$1[15bv32];
    v338$2 := $$data$2[15bv32];
    $$data$1[10bv32] := FADD32(v335$1, v337$1);
    $$data$2[10bv32] := FADD32(v335$2, v337$2);
    $$data$1[11bv32] := FADD32(v336$1, v338$1);
    $$data$2[11bv32] := FADD32(v336$2, v338$2);
    v339$1 := $$data$1[14bv32];
    v339$2 := $$data$2[14bv32];
    v340$1 := $$data$1[15bv32];
    v340$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FSUB32(v335$1, v339$1);
    $$data$2[14bv32] := FSUB32(v335$2, v339$2);
    $$data$1[15bv32] := FSUB32(v336$1, v340$1);
    $$data$2[15bv32] := FSUB32(v336$2, v340$2);
    v341$1 := $$data$1[14bv32];
    v341$2 := $$data$2[14bv32];
    v342$1 := $$data$1[15bv32];
    v342$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FADD32(FMUL32(v341$1, 0bv32), FSUB32(2147483648bv32, FMUL32(v342$1, 1065353216bv32)));
    $$data$2[14bv32] := FADD32(FMUL32(v341$2, 0bv32), FSUB32(2147483648bv32, FMUL32(v342$2, 1065353216bv32)));
    $$data$1[15bv32] := FADD32(FMUL32(v341$1, 1065353216bv32), FMUL32(v342$1, 0bv32));
    $$data$2[15bv32] := FADD32(FMUL32(v341$2, 1065353216bv32), FMUL32(v342$2, 0bv32));
    v343$1 := $$data$1[8bv32];
    v343$2 := $$data$2[8bv32];
    v344$1 := $$data$1[9bv32];
    v344$2 := $$data$2[9bv32];
    v345$1 := $$data$1[10bv32];
    v345$2 := $$data$2[10bv32];
    v346$1 := $$data$1[11bv32];
    v346$2 := $$data$2[11bv32];
    $$data$1[8bv32] := FADD32(v343$1, v345$1);
    $$data$2[8bv32] := FADD32(v343$2, v345$2);
    $$data$1[9bv32] := FADD32(v344$1, v346$1);
    $$data$2[9bv32] := FADD32(v344$2, v346$2);
    v347$1 := $$data$1[10bv32];
    v347$2 := $$data$2[10bv32];
    v348$1 := $$data$1[11bv32];
    v348$2 := $$data$2[11bv32];
    $$data$1[10bv32] := FSUB32(v343$1, v347$1);
    $$data$2[10bv32] := FSUB32(v343$2, v347$2);
    $$data$1[11bv32] := FSUB32(v344$1, v348$1);
    $$data$2[11bv32] := FSUB32(v344$2, v348$2);
    v349$1 := $$data$1[12bv32];
    v349$2 := $$data$2[12bv32];
    v350$1 := $$data$1[13bv32];
    v350$2 := $$data$2[13bv32];
    v351$1 := $$data$1[14bv32];
    v351$2 := $$data$2[14bv32];
    v352$1 := $$data$1[15bv32];
    v352$2 := $$data$2[15bv32];
    $$data$1[12bv32] := FADD32(v349$1, v351$1);
    $$data$2[12bv32] := FADD32(v349$2, v351$2);
    $$data$1[13bv32] := FADD32(v350$1, v352$1);
    $$data$2[13bv32] := FADD32(v350$2, v352$2);
    v353$1 := $$data$1[14bv32];
    v353$2 := $$data$2[14bv32];
    v354$1 := $$data$1[15bv32];
    v354$2 := $$data$2[15bv32];
    $$data$1[14bv32] := FSUB32(v349$1, v353$1);
    $$data$2[14bv32] := FSUB32(v349$2, v353$2);
    $$data$1[15bv32] := FSUB32(v350$1, v354$1);
    $$data$2[15bv32] := FSUB32(v350$2, v354$2);
    $i.0 := 0bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $27;

  $27:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 609} true;
    v355 := BV32_SLT($i.0, 8bv32);
    goto $truebb10, $falsebb10;

  $falsebb10:
    assume {:partition} !v355 && !v355;
    v364$1 := $$globalStores8.reversed$0bv32$1;
    v364$2 := $$globalStores8.reversed$0bv32$2;
    $$reversed.i$1[0bv32] := v364$1;
    $$reversed.i$2[0bv32] := v364$2;
    v365$1 := $$globalStores8.reversed$1bv32$1;
    v365$2 := $$globalStores8.reversed$1bv32$2;
    $$reversed.i$1[1bv32] := v365$1;
    $$reversed.i$2[1bv32] := v365$2;
    v366$1 := $$globalStores8.reversed$2bv32$1;
    v366$2 := $$globalStores8.reversed$2bv32$2;
    $$reversed.i$1[2bv32] := v366$1;
    $$reversed.i$2[2bv32] := v366$2;
    v367$1 := $$globalStores8.reversed$3bv32$1;
    v367$2 := $$globalStores8.reversed$3bv32$2;
    $$reversed.i$1[3bv32] := v367$1;
    $$reversed.i$2[3bv32] := v367$2;
    v368$1 := $$globalStores8.reversed$4bv32$1;
    v368$2 := $$globalStores8.reversed$4bv32$2;
    $$reversed.i$1[4bv32] := v368$1;
    $$reversed.i$2[4bv32] := v368$2;
    v369$1 := $$globalStores8.reversed$5bv32$1;
    v369$2 := $$globalStores8.reversed$5bv32$2;
    $$reversed.i$1[5bv32] := v369$1;
    $$reversed.i$2[5bv32] := v369$2;
    v370$1 := $$globalStores8.reversed$6bv32$1;
    v370$2 := $$globalStores8.reversed$6bv32$2;
    $$reversed.i$1[6bv32] := v370$1;
    $$reversed.i$2[6bv32] := v370$2;
    v371$1 := $$globalStores8.reversed$7bv32$1;
    v371$2 := $$globalStores8.reversed$7bv32$2;
    $$reversed.i$1[7bv32] := v371$1;
    $$reversed.i$2[7bv32] := v371$2;
    $i.i38.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $31;

  $31:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$ifft1D_512.smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 641} true;
    v372 := BV32_SLT($i.i38.0, 8bv32);
    goto $truebb11, $falsebb11;

  $falsebb11:
    assume {:partition} !v372 && !v372;
    return;

  $truebb11:
    assume {:partition} v372 && v372;
    v373$1 := $$reversed.i$1[$i.i38.0];
    v373$2 := $$reversed.i$2[$i.i38.0];
    v374$1 := $$data$1[BV32_MUL(v373$1, 2bv32)];
    v374$2 := $$data$2[BV32_MUL(v373$2, 2bv32)];
    v375$1 := $$data$1[BV32_ADD(BV32_MUL(v373$1, 2bv32), 1bv32)];
    v375$2 := $$data$2[BV32_ADD(BV32_MUL(v373$2, 2bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 646} _LOG_WRITE_$$work(true, BV32_ADD(BV32_MUL(v1$1, 2bv32), BV32_MUL(BV32_MUL($i.i38.0, 64bv32), 2bv32)), v374$1, $$work[BV32_ADD(BV32_MUL(v1$1, 2bv32), BV32_MUL(BV32_MUL($i.i38.0, 64bv32), 2bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$work(true, BV32_ADD(BV32_MUL(v1$2, 2bv32), BV32_MUL(BV32_MUL($i.i38.0, 64bv32), 2bv32)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 646} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 646} _CHECK_WRITE_$$work(true, BV32_ADD(BV32_MUL(v1$2, 2bv32), BV32_MUL(BV32_MUL($i.i38.0, 64bv32), 2bv32)), v374$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$work"} true;
    $$work[BV32_ADD(BV32_MUL(v1$1, 2bv32), BV32_MUL(BV32_MUL($i.i38.0, 64bv32), 2bv32))] := v374$1;
    $$work[BV32_ADD(BV32_MUL(v1$2, 2bv32), BV32_MUL(BV32_MUL($i.i38.0, 64bv32), 2bv32))] := v374$2;
    call {:sourceloc} {:sourceloc_num 647} _LOG_WRITE_$$work(true, BV32_ADD(BV32_ADD(BV32_MUL(v1$1, 2bv32), BV32_MUL(BV32_MUL($i.i38.0, 64bv32), 2bv32)), 1bv32), v375$1, $$work[BV32_ADD(BV32_ADD(BV32_MUL(v1$1, 2bv32), BV32_MUL(BV32_MUL($i.i38.0, 64bv32), 2bv32)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$work(true, BV32_ADD(BV32_ADD(BV32_MUL(v1$2, 2bv32), BV32_MUL(BV32_MUL($i.i38.0, 64bv32), 2bv32)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 647} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 647} _CHECK_WRITE_$$work(true, BV32_ADD(BV32_ADD(BV32_MUL(v1$2, 2bv32), BV32_MUL(BV32_MUL($i.i38.0, 64bv32), 2bv32)), 1bv32), v375$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$work"} true;
    $$work[BV32_ADD(BV32_ADD(BV32_MUL(v1$1, 2bv32), BV32_MUL(BV32_MUL($i.i38.0, 64bv32), 2bv32)), 1bv32)] := v375$1;
    $$work[BV32_ADD(BV32_ADD(BV32_MUL(v1$2, 2bv32), BV32_MUL(BV32_MUL($i.i38.0, 64bv32), 2bv32)), 1bv32)] := v375$2;
    $i.i38.0 := BV32_ADD($i.i38.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $31;

  $truebb10:
    assume {:partition} v355 && v355;
    v356$1 := $$data$1[BV32_MUL($i.0, 2bv32)];
    v356$2 := $$data$2[BV32_MUL($i.0, 2bv32)];
    v357$1 := $$data$1[BV32_ADD(BV32_MUL($i.0, 2bv32), 1bv32)];
    v357$2 := $$data$2[BV32_ADD(BV32_MUL($i.0, 2bv32), 1bv32)];
    v358$1 := $$data$1[BV32_MUL($i.0, 2bv32)];
    v358$2 := $$data$2[BV32_MUL($i.0, 2bv32)];
    v359$1 := $$data$1[BV32_ADD(BV32_MUL($i.0, 2bv32), 1bv32)];
    v359$2 := $$data$2[BV32_ADD(BV32_MUL($i.0, 2bv32), 1bv32)];
    $$data$1[BV32_MUL($i.0, 2bv32)] := FDIV32(v356$1, 1140850688bv32);
    $$data$2[BV32_MUL($i.0, 2bv32)] := FDIV32(v356$2, 1140850688bv32);
    $$data$1[BV32_ADD(BV32_MUL($i.0, 2bv32), 1bv32)] := v359$1;
    $$data$2[BV32_ADD(BV32_MUL($i.0, 2bv32), 1bv32)] := v359$2;
    v360$1 := $$data$1[BV32_MUL($i.0, 2bv32)];
    v360$2 := $$data$2[BV32_MUL($i.0, 2bv32)];
    v361$1 := $$data$1[BV32_ADD(BV32_MUL($i.0, 2bv32), 1bv32)];
    v361$2 := $$data$2[BV32_ADD(BV32_MUL($i.0, 2bv32), 1bv32)];
    v362$1 := $$data$1[BV32_MUL($i.0, 2bv32)];
    v362$2 := $$data$2[BV32_MUL($i.0, 2bv32)];
    v363$1 := $$data$1[BV32_ADD(BV32_MUL($i.0, 2bv32), 1bv32)];
    v363$2 := $$data$2[BV32_ADD(BV32_MUL($i.0, 2bv32), 1bv32)];
    $$data$1[BV32_MUL($i.0, 2bv32)] := v362$1;
    $$data$2[BV32_MUL($i.0, 2bv32)] := v362$2;
    $$data$1[BV32_ADD(BV32_MUL($i.0, 2bv32), 1bv32)] := FDIV32(v361$1, 1140850688bv32);
    $$data$2[BV32_ADD(BV32_MUL($i.0, 2bv32), 1bv32)] := FDIV32(v361$2, 1140850688bv32);
    $i.0 := BV32_ADD($i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $27;

  $truebb9:
    assume {:partition} v269 && v269;
    call {:sourceloc} {:sourceloc_num 463} _LOG_READ_$$ifft1D_512.smem(true, BV32_ADD(v268$1, BV32_MUL($i.i39.0, 8bv32)), $$ifft1D_512.smem[1bv1][BV32_ADD(v268$1, BV32_MUL($i.i39.0, 8bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 463} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 463} _CHECK_READ_$$ifft1D_512.smem(true, BV32_ADD(v268$2, BV32_MUL($i.i39.0, 8bv32)), $$ifft1D_512.smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v268$2, BV32_MUL($i.i39.0, 8bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$ifft1D_512.smem"} true;
    v270$1 := $$ifft1D_512.smem[1bv1][BV32_ADD(v268$1, BV32_MUL($i.i39.0, 8bv32))];
    v270$2 := $$ifft1D_512.smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v268$2, BV32_MUL($i.i39.0, 8bv32))];
    v271$1 := $$data$1[BV32_MUL($i.i39.0, 2bv32)];
    v271$2 := $$data$2[BV32_MUL($i.i39.0, 2bv32)];
    v272$1 := $$data$1[BV32_ADD(BV32_MUL($i.i39.0, 2bv32), 1bv32)];
    v272$2 := $$data$2[BV32_ADD(BV32_MUL($i.i39.0, 2bv32), 1bv32)];
    $$data$1[BV32_MUL($i.i39.0, 2bv32)] := v271$1;
    $$data$2[BV32_MUL($i.i39.0, 2bv32)] := v271$2;
    $$data$1[BV32_ADD(BV32_MUL($i.i39.0, 2bv32), 1bv32)] := v270$1;
    $$data$2[BV32_ADD(BV32_MUL($i.i39.0, 2bv32), 1bv32)] := v270$2;
    $i.i39.0 := BV32_ADD($i.i39.0, 1bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $25;

  $truebb8:
    assume {:partition} v264 && v264;
    v265$1 := $$reversed.i$1[$i.i41.0];
    v265$2 := $$reversed.i$2[$i.i41.0];
    v266$1 := $$data$1[BV32_MUL(v265$1, 2bv32)];
    v266$2 := $$data$2[BV32_MUL(v265$2, 2bv32)];
    v267$1 := $$data$1[BV32_ADD(BV32_MUL(v265$1, 2bv32), 1bv32)];
    v267$2 := $$data$2[BV32_ADD(BV32_MUL(v265$2, 2bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 458} _LOG_WRITE_$$ifft1D_512.smem(true, BV32_ADD(v255$1, BV32_MUL($i.i41.0, 72bv32)), v267$1, $$ifft1D_512.smem[1bv1][BV32_ADD(v255$1, BV32_MUL($i.i41.0, 72bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem(true, BV32_ADD(v255$2, BV32_MUL($i.i41.0, 72bv32)));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 458} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 458} _CHECK_WRITE_$$ifft1D_512.smem(true, BV32_ADD(v255$2, BV32_MUL($i.i41.0, 72bv32)), v267$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$ifft1D_512.smem"} true;
    $$ifft1D_512.smem[1bv1][BV32_ADD(v255$1, BV32_MUL($i.i41.0, 72bv32))] := v267$1;
    $$ifft1D_512.smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v255$2, BV32_MUL($i.i41.0, 72bv32))] := v267$2;
    $i.i41.0 := BV32_ADD($i.i41.0, 1bv32);
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $23;

  $truebb7:
    assume {:partition} v251 && v251;
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 430} true;
    v252$1 := $$ifft1D_512.smem[1bv1][BV32_ADD(v250$1, BV32_MUL($i.i42.0, 8bv32))];
    v252$2 := $$ifft1D_512.smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v250$2, BV32_MUL($i.i42.0, 8bv32))];
    v253$1 := $$data$1[BV32_MUL($i.i42.0, 2bv32)];
    v253$2 := $$data$2[BV32_MUL($i.i42.0, 2bv32)];
    v254$1 := $$data$1[BV32_ADD(BV32_MUL($i.i42.0, 2bv32), 1bv32)];
    v254$2 := $$data$2[BV32_ADD(BV32_MUL($i.i42.0, 2bv32), 1bv32)];
    $$data$1[BV32_MUL($i.i42.0, 2bv32)] := v252$1;
    $$data$2[BV32_MUL($i.i42.0, 2bv32)] := v252$2;
    $$data$1[BV32_ADD(BV32_MUL($i.i42.0, 2bv32), 1bv32)] := v254$1;
    $$data$2[BV32_ADD(BV32_MUL($i.i42.0, 2bv32), 1bv32)] := v254$2;
    $i.i42.0 := BV32_ADD($i.i42.0, 1bv32);
    assume {:captureState "loop_back_edge_state_4_0"} true;
    goto $21;

  $truebb6:
    assume {:partition} v246 && v246;
    v247$1 := $$reversed.i$1[$i.i44.0];
    v247$2 := $$reversed.i$2[$i.i44.0];
    v248$1 := $$data$1[BV32_MUL(v247$1, 2bv32)];
    v248$2 := $$data$2[BV32_MUL(v247$2, 2bv32)];
    v249$1 := $$data$1[BV32_ADD(BV32_MUL(v247$1, 2bv32), 1bv32)];
    v249$2 := $$data$2[BV32_ADD(BV32_MUL(v247$2, 2bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 425} _LOG_WRITE_$$ifft1D_512.smem(true, BV32_ADD(v237$1, BV32_MUL($i.i44.0, 72bv32)), v248$1, $$ifft1D_512.smem[1bv1][BV32_ADD(v237$1, BV32_MUL($i.i44.0, 72bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem(true, BV32_ADD(v237$2, BV32_MUL($i.i44.0, 72bv32)));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 425} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 425} _CHECK_WRITE_$$ifft1D_512.smem(true, BV32_ADD(v237$2, BV32_MUL($i.i44.0, 72bv32)), v248$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$ifft1D_512.smem"} true;
    $$ifft1D_512.smem[1bv1][BV32_ADD(v237$1, BV32_MUL($i.i44.0, 72bv32))] := v248$1;
    $$ifft1D_512.smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v237$2, BV32_MUL($i.i44.0, 72bv32))] := v248$2;
    $i.i44.0 := BV32_ADD($i.i44.0, 1bv32);
    assume {:captureState "loop_back_edge_state_5_0"} true;
    goto $19;

  $truebb5:
    assume {:partition} v230 && v230;
    v231$1 := $$data$1[BV32_MUL($j25.0, 2bv32)];
    v231$2 := $$data$2[BV32_MUL($j25.0, 2bv32)];
    v232$1 := $$data$1[BV32_ADD(BV32_MUL($j25.0, 2bv32), 1bv32)];
    v232$2 := $$data$2[BV32_ADD(BV32_MUL($j25.0, 2bv32), 1bv32)];
    v233$1 := $$reversed824$1[$j25.0];
    v233$2 := $$reversed824$2[$j25.0];
    v234$1 := FP64_CONV32(FMUL64(FDIV64(FMUL64(4618760256179416344bv64, SI32_TO_FP64(v233$1)), 4634204016564240384bv64), SI32_TO_FP64(v2$1)));
    v234$2 := FP64_CONV32(FMUL64(FDIV64(FMUL64(4618760256179416344bv64, SI32_TO_FP64(v233$2)), 4634204016564240384bv64), SI32_TO_FP64(v2$2)));
    v235$1 := FCOS32(v234$1);
    v235$2 := FCOS32(v234$2);
    v236$1 := FSIN32(v234$1);
    v236$2 := FSIN32(v234$2);
    $$data$1[BV32_MUL($j25.0, 2bv32)] := FADD32(FMUL32(v231$1, v235$1), FSUB32(2147483648bv32, FMUL32(v232$1, v236$1)));
    $$data$2[BV32_MUL($j25.0, 2bv32)] := FADD32(FMUL32(v231$2, v235$2), FSUB32(2147483648bv32, FMUL32(v232$2, v236$2)));
    $$data$1[BV32_ADD(BV32_MUL($j25.0, 2bv32), 1bv32)] := FADD32(FMUL32(v231$1, v236$1), FMUL32(v232$1, v235$1));
    $$data$2[BV32_ADD(BV32_MUL($j25.0, 2bv32), 1bv32)] := FADD32(FMUL32(v231$2, v236$2), FMUL32(v232$2, v235$2));
    $j25.0 := BV32_ADD($j25.0, 1bv32);
    assume {:captureState "loop_back_edge_state_6_0"} true;
    goto $15;

  $truebb4:
    assume {:partition} v136 && v136;
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 232} true;
    v137$1 := $$ifft1D_512.smem[1bv1][BV32_ADD(v135$1, BV32_MUL($i.i45.0, 8bv32))];
    v137$2 := $$ifft1D_512.smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v135$2, BV32_MUL($i.i45.0, 8bv32))];
    v138$1 := $$data$1[BV32_MUL($i.i45.0, 2bv32)];
    v138$2 := $$data$2[BV32_MUL($i.i45.0, 2bv32)];
    v139$1 := $$data$1[BV32_ADD(BV32_MUL($i.i45.0, 2bv32), 1bv32)];
    v139$2 := $$data$2[BV32_ADD(BV32_MUL($i.i45.0, 2bv32), 1bv32)];
    $$data$1[BV32_MUL($i.i45.0, 2bv32)] := v138$1;
    $$data$2[BV32_MUL($i.i45.0, 2bv32)] := v138$2;
    $$data$1[BV32_ADD(BV32_MUL($i.i45.0, 2bv32), 1bv32)] := v137$1;
    $$data$2[BV32_ADD(BV32_MUL($i.i45.0, 2bv32), 1bv32)] := v137$2;
    $i.i45.0 := BV32_ADD($i.i45.0, 1bv32);
    assume {:captureState "loop_back_edge_state_7_0"} true;
    goto $13;

  $truebb3:
    assume {:partition} v131 && v131;
    v132$1 := $$reversed.i$1[$i.i48.0];
    v132$2 := $$reversed.i$2[$i.i48.0];
    v133$1 := $$data$1[BV32_MUL(v132$1, 2bv32)];
    v133$2 := $$data$2[BV32_MUL(v132$2, 2bv32)];
    v134$1 := $$data$1[BV32_ADD(BV32_MUL(v132$1, 2bv32), 1bv32)];
    v134$2 := $$data$2[BV32_ADD(BV32_MUL(v132$2, 2bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 227} _LOG_WRITE_$$ifft1D_512.smem(true, BV32_ADD(v122$1, BV32_MUL($i.i48.0, 66bv32)), v134$1, $$ifft1D_512.smem[1bv1][BV32_ADD(v122$1, BV32_MUL($i.i48.0, 66bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem(true, BV32_ADD(v122$2, BV32_MUL($i.i48.0, 66bv32)));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 227} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 227} _CHECK_WRITE_$$ifft1D_512.smem(true, BV32_ADD(v122$2, BV32_MUL($i.i48.0, 66bv32)), v134$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$ifft1D_512.smem"} true;
    $$ifft1D_512.smem[1bv1][BV32_ADD(v122$1, BV32_MUL($i.i48.0, 66bv32))] := v134$1;
    $$ifft1D_512.smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v122$2, BV32_MUL($i.i48.0, 66bv32))] := v134$2;
    $i.i48.0 := BV32_ADD($i.i48.0, 1bv32);
    assume {:captureState "loop_back_edge_state_8_0"} true;
    goto $11;

  $truebb2:
    assume {:partition} v118 && v118;
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 199} true;
    v119$1 := $$ifft1D_512.smem[1bv1][BV32_ADD(v117$1, BV32_MUL($i.i50.0, 8bv32))];
    v119$2 := $$ifft1D_512.smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v117$2, BV32_MUL($i.i50.0, 8bv32))];
    v120$1 := $$data$1[BV32_MUL($i.i50.0, 2bv32)];
    v120$2 := $$data$2[BV32_MUL($i.i50.0, 2bv32)];
    v121$1 := $$data$1[BV32_ADD(BV32_MUL($i.i50.0, 2bv32), 1bv32)];
    v121$2 := $$data$2[BV32_ADD(BV32_MUL($i.i50.0, 2bv32), 1bv32)];
    $$data$1[BV32_MUL($i.i50.0, 2bv32)] := v119$1;
    $$data$2[BV32_MUL($i.i50.0, 2bv32)] := v119$2;
    $$data$1[BV32_ADD(BV32_MUL($i.i50.0, 2bv32), 1bv32)] := v121$1;
    $$data$2[BV32_ADD(BV32_MUL($i.i50.0, 2bv32), 1bv32)] := v121$2;
    $i.i50.0 := BV32_ADD($i.i50.0, 1bv32);
    assume {:captureState "loop_back_edge_state_9_0"} true;
    goto $9;

  $truebb1:
    assume {:partition} v113 && v113;
    v114$1 := $$reversed.i$1[$i.i53.0];
    v114$2 := $$reversed.i$2[$i.i53.0];
    v115$1 := $$data$1[BV32_MUL(v114$1, 2bv32)];
    v115$2 := $$data$2[BV32_MUL(v114$2, 2bv32)];
    v116$1 := $$data$1[BV32_ADD(BV32_MUL(v114$1, 2bv32), 1bv32)];
    v116$2 := $$data$2[BV32_ADD(BV32_MUL(v114$2, 2bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 194} _LOG_WRITE_$$ifft1D_512.smem(true, BV32_ADD(v104$1, BV32_MUL($i.i53.0, 66bv32)), v115$1, $$ifft1D_512.smem[1bv1][BV32_ADD(v104$1, BV32_MUL($i.i53.0, 66bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem(true, BV32_ADD(v104$2, BV32_MUL($i.i53.0, 66bv32)));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 194} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 194} _CHECK_WRITE_$$ifft1D_512.smem(true, BV32_ADD(v104$2, BV32_MUL($i.i53.0, 66bv32)), v115$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$ifft1D_512.smem"} true;
    $$ifft1D_512.smem[1bv1][BV32_ADD(v104$1, BV32_MUL($i.i53.0, 66bv32))] := v115$1;
    $$ifft1D_512.smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v104$2, BV32_MUL($i.i53.0, 66bv32))] := v115$2;
    $i.i53.0 := BV32_ADD($i.i53.0, 1bv32);
    assume {:captureState "loop_back_edge_state_10_0"} true;
    goto $7;

  $truebb0:
    assume {:partition} v97 && v97;
    v98$1 := $$data$1[BV32_MUL($j.0, 2bv32)];
    v98$2 := $$data$2[BV32_MUL($j.0, 2bv32)];
    v99$1 := $$data$1[BV32_ADD(BV32_MUL($j.0, 2bv32), 1bv32)];
    v99$2 := $$data$2[BV32_ADD(BV32_MUL($j.0, 2bv32), 1bv32)];
    v100$1 := $$reversed8$1[$j.0];
    v100$2 := $$reversed8$2[$j.0];
    v101$1 := FP64_CONV32(FMUL64(FDIV64(FMUL64(4618760256179416344bv64, SI32_TO_FP64(v100$1)), 4647714815446351872bv64), SI32_TO_FP64(v0$1)));
    v101$2 := FP64_CONV32(FMUL64(FDIV64(FMUL64(4618760256179416344bv64, SI32_TO_FP64(v100$2)), 4647714815446351872bv64), SI32_TO_FP64(v0$2)));
    v102$1 := FCOS32(v101$1);
    v102$2 := FCOS32(v101$2);
    v103$1 := FSIN32(v101$1);
    v103$2 := FSIN32(v101$2);
    $$data$1[BV32_MUL($j.0, 2bv32)] := FADD32(FMUL32(v98$1, v102$1), FSUB32(2147483648bv32, FMUL32(v99$1, v103$1)));
    $$data$2[BV32_MUL($j.0, 2bv32)] := FADD32(FMUL32(v98$2, v102$2), FSUB32(2147483648bv32, FMUL32(v99$2, v103$2)));
    $$data$1[BV32_ADD(BV32_MUL($j.0, 2bv32), 1bv32)] := FADD32(FMUL32(v98$1, v103$1), FMUL32(v99$1, v102$1));
    $$data$2[BV32_ADD(BV32_MUL($j.0, 2bv32), 1bv32)] := FADD32(FMUL32(v98$2, v103$2), FMUL32(v99$2, v102$2));
    $j.0 := BV32_ADD($j.0, 1bv32);
    assume {:captureState "loop_back_edge_state_11_0"} true;
    goto $3;

  $truebb:
    assume {:partition} v4 && v4;
    call {:sourceloc} {:sourceloc_num 3} _LOG_READ_$$work(true, BV32_ADD(BV32_MUL(v1$1, 2bv32), BV32_MUL(BV32_MUL($i.i.0, 64bv32), 2bv32)), $$work[BV32_ADD(BV32_MUL(v1$1, 2bv32), BV32_MUL(BV32_MUL($i.i.0, 64bv32), 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 3} _CHECK_READ_$$work(true, BV32_ADD(BV32_MUL(v1$2, 2bv32), BV32_MUL(BV32_MUL($i.i.0, 64bv32), 2bv32)), $$work[BV32_ADD(BV32_MUL(v1$2, 2bv32), BV32_MUL(BV32_MUL($i.i.0, 64bv32), 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$work"} true;
    v5$1 := $$work[BV32_ADD(BV32_MUL(v1$1, 2bv32), BV32_MUL(BV32_MUL($i.i.0, 64bv32), 2bv32))];
    v5$2 := $$work[BV32_ADD(BV32_MUL(v1$2, 2bv32), BV32_MUL(BV32_MUL($i.i.0, 64bv32), 2bv32))];
    call {:sourceloc} {:sourceloc_num 4} _LOG_READ_$$work(true, BV32_ADD(BV32_ADD(BV32_MUL(v1$1, 2bv32), BV32_MUL(BV32_MUL($i.i.0, 64bv32), 2bv32)), 1bv32), $$work[BV32_ADD(BV32_ADD(BV32_MUL(v1$1, 2bv32), BV32_MUL(BV32_MUL($i.i.0, 64bv32), 2bv32)), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 4} _CHECK_READ_$$work(true, BV32_ADD(BV32_ADD(BV32_MUL(v1$2, 2bv32), BV32_MUL(BV32_MUL($i.i.0, 64bv32), 2bv32)), 1bv32), $$work[BV32_ADD(BV32_ADD(BV32_MUL(v1$2, 2bv32), BV32_MUL(BV32_MUL($i.i.0, 64bv32), 2bv32)), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$work"} true;
    v6$1 := $$work[BV32_ADD(BV32_ADD(BV32_MUL(v1$1, 2bv32), BV32_MUL(BV32_MUL($i.i.0, 64bv32), 2bv32)), 1bv32)];
    v6$2 := $$work[BV32_ADD(BV32_ADD(BV32_MUL(v1$2, 2bv32), BV32_MUL(BV32_MUL($i.i.0, 64bv32), 2bv32)), 1bv32)];
    $$data$1[BV32_MUL($i.i.0, 2bv32)] := v5$1;
    $$data$2[BV32_MUL($i.i.0, 2bv32)] := v5$2;
    $$data$1[BV32_ADD(BV32_MUL($i.i.0, 2bv32), 1bv32)] := v6$1;
    $$data$2[BV32_ADD(BV32_MUL($i.i.0, 2bv32), 1bv32)] := v6$2;
    $i.i.0 := BV32_ADD($i.i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_12_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

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
  requires $1 == 0bv1;
  modifies $$ifft1D_512.smem, $$work, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$ifft1D_512.smem, $$work, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$ifft1D_512.smem, $$work, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_3($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$ifft1D_512.smem, $$work, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_4($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$ifft1D_512.smem, $$work, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_5($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$ifft1D_512.smem, $$work, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_6($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$ifft1D_512.smem, $$work, _TRACKING;



var $$ifft1D_512.reversed8$0bv32$1: bv32;

var $$ifft1D_512.reversed8$0bv32$2: bv32;

var $$ifft1D_512.reversed8$1bv32$1: bv32;

var $$ifft1D_512.reversed8$1bv32$2: bv32;

var $$ifft1D_512.reversed8$2bv32$1: bv32;

var $$ifft1D_512.reversed8$2bv32$2: bv32;

var $$ifft1D_512.reversed8$3bv32$1: bv32;

var $$ifft1D_512.reversed8$3bv32$2: bv32;

var $$ifft1D_512.reversed8$4bv32$1: bv32;

var $$ifft1D_512.reversed8$4bv32$2: bv32;

var $$ifft1D_512.reversed8$5bv32$1: bv32;

var $$ifft1D_512.reversed8$5bv32$2: bv32;

var $$ifft1D_512.reversed8$6bv32$1: bv32;

var $$ifft1D_512.reversed8$6bv32$2: bv32;

var $$ifft1D_512.reversed8$7bv32$1: bv32;

var $$ifft1D_512.reversed8$7bv32$2: bv32;

var $$storex8.reversed$0bv32$1: bv32;

var $$storex8.reversed$0bv32$2: bv32;

var $$storex8.reversed$1bv32$1: bv32;

var $$storex8.reversed$1bv32$2: bv32;

var $$storex8.reversed$2bv32$1: bv32;

var $$storex8.reversed$2bv32$2: bv32;

var $$storex8.reversed$3bv32$1: bv32;

var $$storex8.reversed$3bv32$2: bv32;

var $$storex8.reversed$4bv32$1: bv32;

var $$storex8.reversed$4bv32$2: bv32;

var $$storex8.reversed$5bv32$1: bv32;

var $$storex8.reversed$5bv32$2: bv32;

var $$storex8.reversed$6bv32$1: bv32;

var $$storex8.reversed$6bv32$2: bv32;

var $$storex8.reversed$7bv32$1: bv32;

var $$storex8.reversed$7bv32$2: bv32;

var $$storey8.reversed$0bv32$1: bv32;

var $$storey8.reversed$0bv32$2: bv32;

var $$storey8.reversed$1bv32$1: bv32;

var $$storey8.reversed$1bv32$2: bv32;

var $$storey8.reversed$2bv32$1: bv32;

var $$storey8.reversed$2bv32$2: bv32;

var $$storey8.reversed$3bv32$1: bv32;

var $$storey8.reversed$3bv32$2: bv32;

var $$storey8.reversed$4bv32$1: bv32;

var $$storey8.reversed$4bv32$2: bv32;

var $$storey8.reversed$5bv32$1: bv32;

var $$storey8.reversed$5bv32$2: bv32;

var $$storey8.reversed$6bv32$1: bv32;

var $$storey8.reversed$6bv32$2: bv32;

var $$storey8.reversed$7bv32$1: bv32;

var $$storey8.reversed$7bv32$2: bv32;

var $$ifft1D_512.reversed81$0bv32$1: bv32;

var $$ifft1D_512.reversed81$0bv32$2: bv32;

var $$ifft1D_512.reversed81$1bv32$1: bv32;

var $$ifft1D_512.reversed81$1bv32$2: bv32;

var $$ifft1D_512.reversed81$2bv32$1: bv32;

var $$ifft1D_512.reversed81$2bv32$2: bv32;

var $$ifft1D_512.reversed81$3bv32$1: bv32;

var $$ifft1D_512.reversed81$3bv32$2: bv32;

var $$ifft1D_512.reversed81$4bv32$1: bv32;

var $$ifft1D_512.reversed81$4bv32$2: bv32;

var $$ifft1D_512.reversed81$5bv32$1: bv32;

var $$ifft1D_512.reversed81$5bv32$2: bv32;

var $$ifft1D_512.reversed81$6bv32$1: bv32;

var $$ifft1D_512.reversed81$6bv32$2: bv32;

var $$ifft1D_512.reversed81$7bv32$1: bv32;

var $$ifft1D_512.reversed81$7bv32$2: bv32;

var $$globalStores8.reversed$0bv32$1: bv32;

var $$globalStores8.reversed$0bv32$2: bv32;

var $$globalStores8.reversed$1bv32$1: bv32;

var $$globalStores8.reversed$1bv32$2: bv32;

var $$globalStores8.reversed$2bv32$1: bv32;

var $$globalStores8.reversed$2bv32$2: bv32;

var $$globalStores8.reversed$3bv32$1: bv32;

var $$globalStores8.reversed$3bv32$2: bv32;

var $$globalStores8.reversed$4bv32$1: bv32;

var $$globalStores8.reversed$4bv32$2: bv32;

var $$globalStores8.reversed$5bv32$1: bv32;

var $$globalStores8.reversed$5bv32$2: bv32;

var $$globalStores8.reversed$6bv32$1: bv32;

var $$globalStores8.reversed$6bv32$2: bv32;

var $$globalStores8.reversed$7bv32$1: bv32;

var $$globalStores8.reversed$7bv32$2: bv32;

const _WATCHED_VALUE_$$work: bv32;

procedure {:inline 1} _LOG_READ_$$work(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$work;



implementation {:inline 1} _LOG_READ_$$work(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$work := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$work == _value then true else _READ_HAS_OCCURRED_$$work);
    return;
}



procedure _CHECK_READ_$$work(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "work"} {:array "$$work"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$work);
  requires {:source_name "work"} {:array "$$work"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$work: bool;

procedure {:inline 1} _LOG_WRITE_$$work(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$work, _WRITE_READ_BENIGN_FLAG_$$work;



implementation {:inline 1} _LOG_WRITE_$$work(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$work := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$work == _value then true else _WRITE_HAS_OCCURRED_$$work);
    _WRITE_READ_BENIGN_FLAG_$$work := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$work == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$work);
    return;
}



procedure _CHECK_WRITE_$$work(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "work"} {:array "$$work"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$work != _value);
  requires {:source_name "work"} {:array "$$work"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$work != _value);
  requires {:source_name "work"} {:array "$$work"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$work(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$work;



implementation {:inline 1} _LOG_ATOMIC_$$work(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$work := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$work);
    return;
}



procedure _CHECK_ATOMIC_$$work(_P: bool, _offset: bv32);
  requires {:source_name "work"} {:array "$$work"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset);
  requires {:source_name "work"} {:array "$$work"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$work(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$work;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$work(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$work := (if _P && _WRITE_HAS_OCCURRED_$$work && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$work);
    return;
}



const _WATCHED_VALUE_$$ifft1D_512.smem: bv32;

procedure {:inline 1} _LOG_READ_$$ifft1D_512.smem(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$ifft1D_512.smem;



implementation {:inline 1} _LOG_READ_$$ifft1D_512.smem(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$ifft1D_512.smem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ifft1D_512.smem == _value then true else _READ_HAS_OCCURRED_$$ifft1D_512.smem);
    return;
}



procedure _CHECK_READ_$$ifft1D_512.smem(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "smem"} {:array "$$ifft1D_512.smem"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$ifft1D_512.smem && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "smem"} {:array "$$ifft1D_512.smem"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem: bool;

procedure {:inline 1} _LOG_WRITE_$$ifft1D_512.smem(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$ifft1D_512.smem, _WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem;



implementation {:inline 1} _LOG_WRITE_$$ifft1D_512.smem(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$ifft1D_512.smem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ifft1D_512.smem == _value then true else _WRITE_HAS_OCCURRED_$$ifft1D_512.smem);
    _WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ifft1D_512.smem == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem);
    return;
}



procedure _CHECK_WRITE_$$ifft1D_512.smem(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "smem"} {:array "$$ifft1D_512.smem"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$ifft1D_512.smem && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ifft1D_512.smem != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "smem"} {:array "$$ifft1D_512.smem"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$ifft1D_512.smem && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ifft1D_512.smem != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "smem"} {:array "$$ifft1D_512.smem"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$ifft1D_512.smem(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem;



implementation {:inline 1} _LOG_ATOMIC_$$ifft1D_512.smem(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem);
    return;
}



procedure _CHECK_ATOMIC_$$ifft1D_512.smem(_P: bool, _offset: bv32);
  requires {:source_name "smem"} {:array "$$ifft1D_512.smem"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$ifft1D_512.smem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "smem"} {:array "$$ifft1D_512.smem"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$ifft1D_512.smem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem := (if _P && _WRITE_HAS_OCCURRED_$$ifft1D_512.smem && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$ifft1D_512.smem);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$ifft1D_512.smem;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$ifft1D_512.smem;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$work;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$work;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$work;
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
    havoc $$work;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$ifft1D_512.smem;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$ifft1D_512.smem;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$ifft1D_512.smem;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$work;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$work;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$work;
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
    havoc $$work;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$ifft1D_512.smem;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$ifft1D_512.smem;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$ifft1D_512.smem;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$work;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$work;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$work;
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
    havoc $$work;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$ifft1D_512.smem;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_3($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$ifft1D_512.smem;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$ifft1D_512.smem;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$work;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$work;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$work;
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
    havoc $$work;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$ifft1D_512.smem;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_4($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$ifft1D_512.smem;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$ifft1D_512.smem;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$work;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$work;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$work;
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
    havoc $$work;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$ifft1D_512.smem;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_5($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$ifft1D_512.smem;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$ifft1D_512.smem;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$work;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$work;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$work;
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
    havoc $$work;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$ifft1D_512.smem;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_6($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$ifft1D_512.smem;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$ifft1D_512.smem;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$ifft1D_512.smem;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$work;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$work;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$work;
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
    havoc $$work;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$ifft1D_512.smem;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
