type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "output"} {:global} $$output: [bv32]bv8;

axiom {:array_info "$$output"} {:global} {:elem_width 8} {:source_name "output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output: bool;

axiom {:array_info "$$input"} {:global} {:elem_width 8} {:source_name "input"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input: bool;

axiom {:array_info "$$roundKey"} {:global} {:elem_width 8} {:source_name "roundKey"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$roundKey: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$roundKey: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$roundKey: bool;

axiom {:array_info "$$SBox"} {:global} {:elem_width 8} {:source_name "SBox"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$SBox: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$SBox: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$SBox: bool;

var {:source_name "block0"} {:group_shared} $$block0: [bv1][bv32]bv8;

axiom {:array_info "$$block0"} {:group_shared} {:elem_width 8} {:source_name "block0"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$block0: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$block0: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$block0: bool;

var {:source_name "block1"} {:group_shared} $$block1: [bv1][bv32]bv8;

axiom {:array_info "$$block1"} {:group_shared} {:elem_width 8} {:source_name "block1"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$block1: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$block1: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$block1: bool;

var {:source_name "galiosCoeff"} $$galiosCoeff$1: [bv32]bv8;

var {:source_name "galiosCoeff"} $$galiosCoeff$2: [bv32]bv8;

axiom {:array_info "$$galiosCoeff"} {:elem_width 8} {:source_name "galiosCoeff"} {:source_elem_width 32} {:source_dimensions "4"} true;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "bvurem"} BV32_UREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvxor"} BV32_XOR(bv32, bv32) : bv32;

function {:bvbuiltin "bvxor"} BV8_XOR(bv8, bv8) : bv8;

function {:bvbuiltin "zero_extend 24"} BV8_ZEXT32(bv8) : bv32;

procedure {:source_name "AESDecrypt"} {:kernel} $AESDecrypt($width: bv32, $rounds: bv32);
  requires !_READ_HAS_OCCURRED_$$output && !_WRITE_HAS_OCCURRED_$$output && !_ATOMIC_HAS_OCCURRED_$$output;
  requires !_READ_HAS_OCCURRED_$$input && !_WRITE_HAS_OCCURRED_$$input && !_ATOMIC_HAS_OCCURRED_$$input;
  requires !_READ_HAS_OCCURRED_$$roundKey && !_WRITE_HAS_OCCURRED_$$roundKey && !_ATOMIC_HAS_OCCURRED_$$roundKey;
  requires !_READ_HAS_OCCURRED_$$SBox && !_WRITE_HAS_OCCURRED_$$SBox && !_ATOMIC_HAS_OCCURRED_$$SBox;
  requires !_READ_HAS_OCCURRED_$$block0 && !_WRITE_HAS_OCCURRED_$$block0 && !_ATOMIC_HAS_OCCURRED_$$block0;
  requires !_READ_HAS_OCCURRED_$$block1 && !_WRITE_HAS_OCCURRED_$$block1 && !_ATOMIC_HAS_OCCURRED_$$block1;
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
  modifies $$block0, $$block1, _WRITE_HAS_OCCURRED_$$block0, _WRITE_READ_BENIGN_FLAG_$$block0, _WRITE_READ_BENIGN_FLAG_$$block0, _READ_HAS_OCCURRED_$$block0, _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _WRITE_READ_BENIGN_FLAG_$$output, $$output, _TRACKING, _WRITE_HAS_OCCURRED_$$block1, _WRITE_READ_BENIGN_FLAG_$$block1, _WRITE_READ_BENIGN_FLAG_$$block1, _TRACKING, _READ_HAS_OCCURRED_$$block1;



implementation {:source_name "AESDecrypt"} {:kernel} $AESDecrypt($width: bv32, $rounds: bv32)
{
  var $r.0: bv32;
  var $tempValue.i.0$1: bv32;
  var $tempValue.i.0$2: bv32;
  var $i.i.0$1: bv32;
  var $i.i.0$2: bv32;
  var $.021$1: bv8;
  var $.021$2: bv8;
  var $.017$1: bv8;
  var $.017$2: bv8;
  var $p.i.i.0$1: bv8;
  var $p.i.i.0$2: bv8;
  var $i.i.i.0: bv32;
  var $p.i.i.1$1: bv8;
  var $p.i.i.1$2: bv8;
  var $.122$1: bv8;
  var $.122$2: bv8;
  var $i.i26.i.0: bv32;
  var $p.i25.i.0$1: bv8;
  var $p.i25.i.0$2: bv8;
  var $.01$1: bv8;
  var $.01$2: bv8;
  var $.0$1: bv8;
  var $.0$2: bv8;
  var $p.i25.i.1$1: bv8;
  var $p.i25.i.1$2: bv8;
  var $.1$1: bv8;
  var $.1$2: bv8;
  var $i.i22.i.0: bv32;
  var $p.i21.i.0$1: bv8;
  var $p.i21.i.0$2: bv8;
  var $.04$1: bv8;
  var $.04$2: bv8;
  var $.02$1: bv8;
  var $.02$2: bv8;
  var $p.i21.i.1$1: bv8;
  var $p.i21.i.1$2: bv8;
  var $.13$1: bv8;
  var $.13$2: bv8;
  var $i.i18.i.0: bv32;
  var $p.i17.i.0$1: bv8;
  var $p.i17.i.0$2: bv8;
  var $.07$1: bv8;
  var $.07$2: bv8;
  var $.05$1: bv8;
  var $.05$2: bv8;
  var $p.i17.i.1$1: bv8;
  var $p.i17.i.1$2: bv8;
  var $.16$1: bv8;
  var $.16$2: bv8;
  var $x.i.0$1: bv8;
  var $x.i.0$2: bv8;
  var $y.i.0$1: bv8;
  var $y.i.0$2: bv8;
  var $z.i.0$1: bv8;
  var $z.i.0$2: bv8;
  var $w.i.0$1: bv8;
  var $w.i.0$2: bv8;
  var $k.i.0: bv32;
  var $i.i14.i.0: bv32;
  var $p.i13.i.0$1: bv8;
  var $p.i13.i.0$2: bv8;
  var $.010$1: bv8;
  var $.010$2: bv8;
  var $.08$1: bv8;
  var $.08$2: bv8;
  var $p.i13.i.1$1: bv8;
  var $p.i13.i.1$2: bv8;
  var $.19$1: bv8;
  var $.19$2: bv8;
  var $i.i10.i.0: bv32;
  var $p.i9.i.0$1: bv8;
  var $p.i9.i.0$2: bv8;
  var $.013$1: bv8;
  var $.013$2: bv8;
  var $.011$1: bv8;
  var $.011$2: bv8;
  var $p.i9.i.1$1: bv8;
  var $p.i9.i.1$2: bv8;
  var $.112$1: bv8;
  var $.112$2: bv8;
  var $i.i6.i.0: bv32;
  var $p.i5.i.0$1: bv8;
  var $p.i5.i.0$2: bv8;
  var $.016$1: bv8;
  var $.016$2: bv8;
  var $.014$1: bv8;
  var $.014$2: bv8;
  var $p.i5.i.1$1: bv8;
  var $p.i5.i.1$2: bv8;
  var $.115$1: bv8;
  var $.115$2: bv8;
  var $i.i2.i.0: bv32;
  var $p.i1.i.0$1: bv8;
  var $p.i1.i.0$2: bv8;
  var $.020$1: bv8;
  var $.020$2: bv8;
  var $.018$1: bv8;
  var $.018$2: bv8;
  var $p.i1.i.1$1: bv8;
  var $p.i1.i.1$2: bv8;
  var $.119$1: bv8;
  var $.119$2: bv8;
  var $i.i2.0$1: bv32;
  var $i.i2.0$2: bv32;
  var $tempValue.i1.0$1: bv32;
  var $tempValue.i1.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v1: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
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
  var v9$1: bv8;
  var v9$2: bv8;
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
  var v16: bool;
  var v17$1: bv8;
  var v17$2: bv8;
  var v18$1: bv8;
  var v18$2: bv8;
  var v19$1: bv8;
  var v19$2: bv8;
  var v20$1: bv8;
  var v20$2: bv8;
  var v21$1: bool;
  var v21$2: bool;
  var v22$1: bv8;
  var v22$2: bv8;
  var v23$1: bv8;
  var v23$2: bv8;
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
  var v40$1: bv8;
  var v40$2: bv8;
  var v41$1: bv8;
  var v41$2: bv8;
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
  var v38$1: bv32;
  var v38$2: bv32;
  var v39$1: bv8;
  var v39$2: bv8;
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
  var v47: bool;
  var v48$1: bool;
  var v48$2: bool;
  var v49$1: bv8;
  var v49$2: bv8;
  var v50$1: bool;
  var v50$2: bool;
  var v51$1: bv8;
  var v51$2: bv8;
  var v52$1: bv8;
  var v52$2: bv8;
  var v53$1: bv8;
  var v53$2: bv8;
  var v54$1: bv8;
  var v54$2: bv8;
  var v59: bool;
  var v55$1: bv8;
  var v55$2: bv8;
  var v56$1: bv8;
  var v56$2: bv8;
  var v57$1: bv8;
  var v57$2: bv8;
  var v58$1: bv8;
  var v58$2: bv8;
  var v60$1: bool;
  var v60$2: bool;
  var v61$1: bv8;
  var v61$2: bv8;
  var v62$1: bool;
  var v62$2: bool;
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
  var v71: bool;
  var v72$1: bool;
  var v72$2: bool;
  var v73$1: bv8;
  var v73$2: bv8;
  var v74$1: bool;
  var v74$2: bool;
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
  var v83: bool;
  var v84$1: bool;
  var v84$2: bool;
  var v85$1: bv8;
  var v85$2: bv8;
  var v86$1: bool;
  var v86$2: bool;
  var v87: bool;
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
  var v96: bool;
  var v97$1: bool;
  var v97$2: bool;
  var v98$1: bv8;
  var v98$2: bv8;
  var v99$1: bool;
  var v99$2: bool;
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
  var v108: bool;
  var v109$1: bool;
  var v109$2: bool;
  var v110$1: bv8;
  var v110$2: bv8;
  var v111$1: bool;
  var v111$2: bool;
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
  var v120: bool;
  var v121$1: bool;
  var v121$2: bool;
  var v122$1: bv8;
  var v122$2: bv8;
  var v123$1: bool;
  var v123$2: bool;
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
  var v132: bool;
  var v133$1: bool;
  var v133$2: bool;
  var v134$1: bv8;
  var v134$2: bv8;
  var v135$1: bool;
  var v135$2: bool;
  var v136$1: bv8;
  var v136$2: bv8;
  var v137$1: bv8;
  var v137$2: bv8;
  var v138$1: bv8;
  var v138$2: bv8;
  var v139$1: bv8;
  var v139$2: bv8;
  var v140$1: bool;
  var v140$2: bool;
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
  var p29$1: bool;
  var p29$2: bool;
  var p30$1: bool;
  var p30$2: bool;
  var p31$1: bool;
  var p31$2: bool;
  var p32$1: bool;
  var p32$2: bool;
  var p33$1: bool;
  var p33$2: bool;
  var p34$1: bool;
  var p34$2: bool;
  var p35$1: bool;
  var p35$2: bool;
  var p36$1: bool;
  var p36$2: bool;
  var p37$1: bool;
  var p37$2: bool;


  $0:
    v0$1 := local_id_y$1;
    v0$2 := local_id_y$2;
    v1 := group_size_x;
    v2$1 := BV32_ADD(BV32_MUL(v0$1, v1), local_id_x$1);
    v2$2 := BV32_ADD(BV32_MUL(v0$2, v1), local_id_x$2);
    v3$1 := BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), BV32_MUL(group_size_x, num_groups_x)), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    v3$2 := BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), BV32_MUL(group_size_x, num_groups_x)), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    havoc v4$1, v4$2;
    havoc v5$1, v5$2;
    havoc v6$1, v6$2;
    havoc v7$1, v7$2;
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$block0(true, BV32_MUL(v2$1, 4bv32), v4$1, $$block0[1bv1][BV32_MUL(v2$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_MUL(v2$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$block0(true, BV32_MUL(v2$2, 4bv32), v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_MUL(v2$1, 4bv32)] := v4$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)] := v4$2;
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), v5$1, $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), v5$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)] := v5$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)] := v5$2;
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), v6$1, $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)] := v6$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)] := v6$2;
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), v7$1, $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)] := v7$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)] := v7$2;
    $$galiosCoeff$1[0bv32] := 14bv8;
    $$galiosCoeff$2[0bv32] := 14bv8;
    $$galiosCoeff$1[1bv32] := 0bv8;
    $$galiosCoeff$2[1bv32] := 0bv8;
    $$galiosCoeff$1[2bv32] := 0bv8;
    $$galiosCoeff$2[2bv32] := 0bv8;
    $$galiosCoeff$1[3bv32] := 0bv8;
    $$galiosCoeff$2[3bv32] := 0bv8;
    $$galiosCoeff$1[4bv32] := 11bv8;
    $$galiosCoeff$2[4bv32] := 11bv8;
    $$galiosCoeff$1[5bv32] := 0bv8;
    $$galiosCoeff$2[5bv32] := 0bv8;
    $$galiosCoeff$1[6bv32] := 0bv8;
    $$galiosCoeff$2[6bv32] := 0bv8;
    $$galiosCoeff$1[7bv32] := 0bv8;
    $$galiosCoeff$2[7bv32] := 0bv8;
    $$galiosCoeff$1[8bv32] := 13bv8;
    $$galiosCoeff$2[8bv32] := 13bv8;
    $$galiosCoeff$1[9bv32] := 0bv8;
    $$galiosCoeff$2[9bv32] := 0bv8;
    $$galiosCoeff$1[10bv32] := 0bv8;
    $$galiosCoeff$2[10bv32] := 0bv8;
    $$galiosCoeff$1[11bv32] := 0bv8;
    $$galiosCoeff$2[11bv32] := 0bv8;
    $$galiosCoeff$1[12bv32] := 9bv8;
    $$galiosCoeff$2[12bv32] := 9bv8;
    $$galiosCoeff$1[13bv32] := 0bv8;
    $$galiosCoeff$2[13bv32] := 0bv8;
    $$galiosCoeff$1[14bv32] := 0bv8;
    $$galiosCoeff$2[14bv32] := 0bv8;
    $$galiosCoeff$1[15bv32] := 0bv8;
    $$galiosCoeff$2[15bv32] := 0bv8;
    havoc v8$1, v8$2;
    havoc v9$1, v9$2;
    havoc v10$1, v10$2;
    havoc v11$1, v11$2;
    call {:sourceloc} {:sourceloc_num 29} _LOG_READ_$$block0(true, BV32_MUL(v2$1, 4bv32), $$block0[1bv1][BV32_MUL(v2$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 29} _CHECK_READ_$$block0(true, BV32_MUL(v2$2, 4bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v12$1 := $$block0[1bv1][BV32_MUL(v2$1, 4bv32)];
    v12$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)];
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v13$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)];
    v13$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 31} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 31} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v14$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)];
    v14$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v15$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)];
    v15$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$block0(true, BV32_MUL(v2$1, 4bv32), BV8_XOR(v12$1, v8$1), $$block0[1bv1][BV32_MUL(v2$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_MUL(v2$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$block0(true, BV32_MUL(v2$2, 4bv32), BV8_XOR(v12$2, v8$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_MUL(v2$1, 4bv32)] := BV8_XOR(v12$1, v8$1);
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)] := BV8_XOR(v12$2, v8$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), BV8_XOR(v13$1, v9$1), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), BV8_XOR(v13$2, v9$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)] := BV8_XOR(v13$1, v9$1);
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)] := BV8_XOR(v13$2, v9$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), BV8_XOR(v14$1, v10$1), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), BV8_XOR(v14$2, v10$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)] := BV8_XOR(v14$1, v10$1);
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)] := BV8_XOR(v14$2, v10$2);
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), BV8_XOR(v15$1, v11$1), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), BV8_XOR(v15$2, v11$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)] := BV8_XOR(v15$1, v11$1);
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)] := BV8_XOR(v15$2, v11$2);
    $r.0 := BV32_SUB($rounds, 1bv32);
    p35$1 := false;
    p35$2 := false;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b16 ==> _WRITE_HAS_OCCURRED_$$block1 ==> _WATCHED_OFFSET == BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 3bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b15 ==> _READ_HAS_OCCURRED_$$block1 ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || _WATCHED_OFFSET == BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 3bv32) || _WATCHED_OFFSET == BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 3bv32) || _WATCHED_OFFSET == BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 3bv32) || _WATCHED_OFFSET == BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 3bv32);
    assert {:tag "nowrite"} _b14 ==> !_WRITE_HAS_OCCURRED_$$block1;
    assert {:tag "noread"} _b13 ==> !_READ_HAS_OCCURRED_$$block1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b12 ==> _WRITE_HAS_OCCURRED_$$block0 ==> _WATCHED_OFFSET == BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 3bv32) || _WATCHED_OFFSET == BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 3bv32) || _WATCHED_OFFSET == BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 3bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b11 ==> _READ_HAS_OCCURRED_$$block0 ==> _WATCHED_OFFSET == BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 3bv32) || _WATCHED_OFFSET == BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), local_id_x$1), 4bv32), 3bv32);
    assert {:tag "nowrite"} _b10 ==> !_WRITE_HAS_OCCURRED_$$block0;
    assert {:tag "noread"} _b9 ==> !_READ_HAS_OCCURRED_$$block0;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($r.0, BV32_SUB($rounds, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($r.0, BV32_SUB($rounds, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($r.0, BV32_SUB($rounds, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($r.0, BV32_SUB($rounds, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($r.0, BV32_SUB($rounds, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($r.0, BV32_SUB($rounds, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($r.0, BV32_SUB($rounds, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($r.0, BV32_SUB($rounds, 1bv32));
    assert {:tag "loopCounterIsStrided"} {:thread 1} _b0 ==> BV32_AND(BV32_SUB(4294967295bv32, 1bv32), $r.0) == BV32_AND(BV32_SUB(4294967295bv32, 1bv32), BV32_SUB($rounds, 1bv32));
    assert {:tag "loopCounterIsStrided"} {:thread 2} _b0 ==> BV32_AND(BV32_SUB(4294967295bv32, 1bv32), $r.0) == BV32_AND(BV32_SUB(4294967295bv32, 1bv32), BV32_SUB($rounds, 1bv32));
    assert {:block_sourceloc} {:sourceloc_num 37} true;
    v16 := BV32_UGT($r.0, 0bv32);
    p0$1 := false;
    p0$2 := false;
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v16 && !v16;
    call {:sourceloc} {:sourceloc_num 205} _LOG_READ_$$block0(true, BV32_MUL(v2$1, 4bv32), $$block0[1bv1][BV32_MUL(v2$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 205} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 205} _CHECK_READ_$$block0(true, BV32_MUL(v2$2, 4bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v136$1 := $$block0[1bv1][BV32_MUL(v2$1, 4bv32)];
    v136$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)];
    call {:sourceloc} {:sourceloc_num 206} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 206} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 206} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v137$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)];
    v137$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 207} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 207} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 207} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v138$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)];
    v138$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 208} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 208} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 208} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v139$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)];
    v139$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)];
    $i.i2.0$1, $tempValue.i1.0$1 := 0bv32, v139$1 ++ v138$1 ++ v137$1 ++ v136$1;
    $i.i2.0$2, $tempValue.i1.0$2 := 0bv32, v139$2 ++ v138$2 ++ v137$2 ++ v136$2;
    p35$1 := true;
    p35$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $57;

  $57:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 209} p35$1 ==> true;
    v140$1 := (if p35$1 then BV32_ULT($i.i2.0$1, v0$1) else v140$1);
    v140$2 := (if p35$2 then BV32_ULT($i.i2.0$2, v0$2) else v140$2);
    p36$1 := false;
    p36$2 := false;
    p37$1 := false;
    p37$2 := false;
    p36$1 := (if p35$1 && v140$1 then v140$1 else p36$1);
    p36$2 := (if p35$2 && v140$2 then v140$2 else p36$2);
    p35$1 := (if p35$1 && !v140$1 then v140$1 else p35$1);
    p35$2 := (if p35$2 && !v140$2 then v140$2 else p35$2);
    $i.i2.0$1, $tempValue.i1.0$1 := (if p36$1 then BV32_ADD($i.i2.0$1, 1bv32) else $i.i2.0$1), (if p36$1 then $tempValue.i1.0$1[24:16] ++ $tempValue.i1.0$1[16:8] ++ $tempValue.i1.0$1[8:0] ++ $tempValue.i1.0$1[32:24] else $tempValue.i1.0$1);
    $i.i2.0$2, $tempValue.i1.0$2 := (if p36$2 then BV32_ADD($i.i2.0$2, 1bv32) else $i.i2.0$2), (if p36$2 then $tempValue.i1.0$2[24:16] ++ $tempValue.i1.0$2[16:8] ++ $tempValue.i1.0$2[8:0] ++ $tempValue.i1.0$2[32:24] else $tempValue.i1.0$2);
    p35$1 := (if p36$1 then true else p35$1);
    p35$2 := (if p36$2 then true else p35$2);
    goto $57.backedge, $57.tail;

  $57.tail:
    assume !p35$1 && !p35$2;
    call {:sourceloc} {:sourceloc_num 212} _LOG_WRITE_$$block0(true, BV32_MUL(v2$1, 4bv32), $tempValue.i1.0$1[8:0], $$block0[1bv1][BV32_MUL(v2$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_MUL(v2$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 212} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 212} _CHECK_WRITE_$$block0(true, BV32_MUL(v2$2, 4bv32), $tempValue.i1.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_MUL(v2$1, 4bv32)] := $tempValue.i1.0$1[8:0];
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)] := $tempValue.i1.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 213} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), $tempValue.i1.0$1[16:8], $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 213} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 213} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), $tempValue.i1.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)] := $tempValue.i1.0$1[16:8];
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)] := $tempValue.i1.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 214} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), $tempValue.i1.0$1[24:16], $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 214} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 214} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), $tempValue.i1.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)] := $tempValue.i1.0$1[24:16];
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)] := $tempValue.i1.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 215} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), $tempValue.i1.0$1[32:24], $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 215} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 215} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), $tempValue.i1.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)] := $tempValue.i1.0$1[32:24];
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)] := $tempValue.i1.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 216} _LOG_READ_$$block0(true, BV32_MUL(v2$1, 4bv32), $$block0[1bv1][BV32_MUL(v2$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 216} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 216} _CHECK_READ_$$block0(true, BV32_MUL(v2$2, 4bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v141$1 := $$block0[1bv1][BV32_MUL(v2$1, 4bv32)];
    v141$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)];
    call {:sourceloc} {:sourceloc_num 217} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 217} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 217} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v142$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)];
    v142$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 218} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 218} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 218} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v143$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)];
    v143$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 219} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 219} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 219} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v144$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)];
    v144$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)];
    havoc v145$1, v145$2;
    havoc v146$1, v146$2;
    havoc v147$1, v147$2;
    havoc v148$1, v148$2;
    call {:sourceloc} {:sourceloc_num 224} _LOG_WRITE_$$block0(true, BV32_MUL(v2$1, 4bv32), v145$1, $$block0[1bv1][BV32_MUL(v2$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_MUL(v2$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 224} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 224} _CHECK_WRITE_$$block0(true, BV32_MUL(v2$2, 4bv32), v145$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_MUL(v2$1, 4bv32)] := v145$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)] := v145$2;
    call {:sourceloc} {:sourceloc_num 225} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), v146$1, $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 225} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 225} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), v146$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)] := v146$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)] := v146$2;
    call {:sourceloc} {:sourceloc_num 226} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), v147$1, $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 226} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 226} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), v147$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)] := v147$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)] := v147$2;
    call {:sourceloc} {:sourceloc_num 227} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), v148$1, $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 227} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 227} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), v148$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)] := v148$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)] := v148$2;
    call {:sourceloc} {:sourceloc_num 228} _LOG_READ_$$block0(true, BV32_MUL(v2$1, 4bv32), $$block0[1bv1][BV32_MUL(v2$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 228} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 228} _CHECK_READ_$$block0(true, BV32_MUL(v2$2, 4bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v149$1 := $$block0[1bv1][BV32_MUL(v2$1, 4bv32)];
    v149$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)];
    call {:sourceloc} {:sourceloc_num 229} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 229} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 229} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v150$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)];
    v150$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 230} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 230} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 230} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v151$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)];
    v151$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 231} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 231} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 231} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v152$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)];
    v152$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)];
    havoc v153$1, v153$2;
    havoc v154$1, v154$2;
    havoc v155$1, v155$2;
    havoc v156$1, v156$2;
    call {:sourceloc} {:sourceloc_num 236} _LOG_WRITE_$$output(true, BV32_MUL(v3$1, 4bv32), BV8_XOR(v149$1, v153$1), $$output[BV32_MUL(v3$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_MUL(v3$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 236} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 236} _CHECK_WRITE_$$output(true, BV32_MUL(v3$2, 4bv32), BV8_XOR(v149$2, v153$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_MUL(v3$1, 4bv32)] := BV8_XOR(v149$1, v153$1);
    $$output[BV32_MUL(v3$2, 4bv32)] := BV8_XOR(v149$2, v153$2);
    call {:sourceloc} {:sourceloc_num 237} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32), BV8_XOR(v150$1, v154$1), $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 237} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 237} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32), BV8_XOR(v150$2, v154$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32)] := BV8_XOR(v150$1, v154$1);
    $$output[BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32)] := BV8_XOR(v150$2, v154$2);
    call {:sourceloc} {:sourceloc_num 238} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32), BV8_XOR(v151$1, v155$1), $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 238} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 238} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32), BV8_XOR(v151$2, v155$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32)] := BV8_XOR(v151$1, v155$1);
    $$output[BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32)] := BV8_XOR(v151$2, v155$2);
    call {:sourceloc} {:sourceloc_num 239} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32), BV8_XOR(v152$1, v156$1), $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 239} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 239} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32), BV8_XOR(v152$2, v156$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32)] := BV8_XOR(v152$1, v156$1);
    $$output[BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32)] := BV8_XOR(v152$2, v156$2);
    return;

  $57.backedge:
    assume {:backedge} p35$1 || p35$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $57;

  $truebb:
    assume {:partition} v16 && v16;
    call {:sourceloc} {:sourceloc_num 39} _LOG_READ_$$block0(true, BV32_MUL(v2$1, 4bv32), $$block0[1bv1][BV32_MUL(v2$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 39} _CHECK_READ_$$block0(true, BV32_MUL(v2$2, 4bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v17$1 := $$block0[1bv1][BV32_MUL(v2$1, 4bv32)];
    v17$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)];
    call {:sourceloc} {:sourceloc_num 40} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 40} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v18$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)];
    v18$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 41} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 41} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v19$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)];
    v19$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 42} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 42} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v20$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)];
    v20$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)];
    $tempValue.i.0$1, $i.i.0$1 := v20$1 ++ v19$1 ++ v18$1 ++ v17$1, 0bv32;
    $tempValue.i.0$2, $i.i.0$2 := v20$2 ++ v19$2 ++ v18$2 ++ v17$2, 0bv32;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_11_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_11"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 43} p0$1 ==> true;
    v21$1 := (if p0$1 then BV32_ULT($i.i.0$1, v0$1) else v21$1);
    v21$2 := (if p0$2 then BV32_ULT($i.i.0$2, v0$2) else v21$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p1$1 := (if p0$1 && v21$1 then v21$1 else p1$1);
    p1$2 := (if p0$2 && v21$2 then v21$2 else p1$2);
    p0$1 := (if p0$1 && !v21$1 then v21$1 else p0$1);
    p0$2 := (if p0$2 && !v21$2 then v21$2 else p0$2);
    $tempValue.i.0$1, $i.i.0$1 := (if p1$1 then $tempValue.i.0$1[24:16] ++ $tempValue.i.0$1[16:8] ++ $tempValue.i.0$1[8:0] ++ $tempValue.i.0$1[32:24] else $tempValue.i.0$1), (if p1$1 then BV32_ADD($i.i.0$1, 1bv32) else $i.i.0$1);
    $tempValue.i.0$2, $i.i.0$2 := (if p1$2 then $tempValue.i.0$2[24:16] ++ $tempValue.i.0$2[16:8] ++ $tempValue.i.0$2[8:0] ++ $tempValue.i.0$2[32:24] else $tempValue.i.0$2), (if p1$2 then BV32_ADD($i.i.0$2, 1bv32) else $i.i.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $3.backedge, __partitioned_block_$3.tail_0;

  __partitioned_block_$3.tail_0:
    assume !p0$1 && !p0$2;
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$block0(true, BV32_MUL(v2$1, 4bv32), $tempValue.i.0$1[8:0], $$block0[1bv1][BV32_MUL(v2$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_MUL(v2$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$block0(true, BV32_MUL(v2$2, 4bv32), $tempValue.i.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_MUL(v2$1, 4bv32)] := $tempValue.i.0$1[8:0];
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)] := $tempValue.i.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 47} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), $tempValue.i.0$1[16:8], $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 47} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), $tempValue.i.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)] := $tempValue.i.0$1[16:8];
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)] := $tempValue.i.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 48} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), $tempValue.i.0$1[24:16], $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 48} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), $tempValue.i.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)] := $tempValue.i.0$1[24:16];
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)] := $tempValue.i.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 49} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), $tempValue.i.0$1[32:24], $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 49} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), $tempValue.i.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)] := $tempValue.i.0$1[32:24];
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)] := $tempValue.i.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 50} _LOG_READ_$$block0(true, BV32_MUL(v2$1, 4bv32), $$block0[1bv1][BV32_MUL(v2$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 50} _CHECK_READ_$$block0(true, BV32_MUL(v2$2, 4bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v22$1 := $$block0[1bv1][BV32_MUL(v2$1, 4bv32)];
    v22$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)];
    call {:sourceloc} {:sourceloc_num 51} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 51} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v23$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)];
    v23$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 52} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 52} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v24$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)];
    v24$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 53} _LOG_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 53} _CHECK_READ_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block0"} true;
    v25$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)];
    v25$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)];
    havoc v26$1, v26$2;
    havoc v27$1, v27$2;
    havoc v28$1, v28$2;
    havoc v29$1, v29$2;
    call {:sourceloc} {:sourceloc_num 58} _LOG_WRITE_$$block0(true, BV32_MUL(v2$1, 4bv32), v26$1, $$block0[1bv1][BV32_MUL(v2$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_MUL(v2$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 58} _CHECK_WRITE_$$block0(true, BV32_MUL(v2$2, 4bv32), v26$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_MUL(v2$1, 4bv32)] := v26$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)] := v26$2;
    call {:sourceloc} {:sourceloc_num 59} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), v27$1, $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 59} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), v27$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)] := v27$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)] := v27$2;
    call {:sourceloc} {:sourceloc_num 60} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), v28$1, $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 60} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), v28$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)] := v28$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)] := v28$2;
    call {:sourceloc} {:sourceloc_num 61} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), v29$1, $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_51"} {:sourceloc} {:sourceloc_num 61} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), v29$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)] := v29$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)] := v29$2;
    goto __partitioned_block_$3.tail_1;

  __partitioned_block_$3.tail_1:
    call {:sourceloc_num 62} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 63} true;
    v30$1 := $$block0[1bv1][BV32_MUL(v2$1, 4bv32)];
    v30$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)];
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 64} true;
    v31$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)];
    v31$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 65} true;
    v32$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)];
    v32$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)];
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 66} true;
    v33$1 := $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)];
    v33$2 := $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)];
    havoc v34$1, v34$2;
    havoc v35$1, v35$2;
    havoc v36$1, v36$2;
    havoc v37$1, v37$2;
    call {:sourceloc} {:sourceloc_num 71} _LOG_WRITE_$$block1(true, BV32_MUL(v2$1, 4bv32), BV8_XOR(v30$1, v34$1), $$block1[1bv1][BV32_MUL(v2$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block1(true, BV32_MUL(v2$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_56"} {:captureState "check_state_56"} {:sourceloc} {:sourceloc_num 71} true;
    call {:check_id "check_state_56"} {:sourceloc} {:sourceloc_num 71} _CHECK_WRITE_$$block1(true, BV32_MUL(v2$2, 4bv32), BV8_XOR(v30$2, v34$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block1"} true;
    $$block1[1bv1][BV32_MUL(v2$1, 4bv32)] := BV8_XOR(v30$1, v34$1);
    $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)] := BV8_XOR(v30$2, v34$2);
    call {:sourceloc} {:sourceloc_num 72} _LOG_WRITE_$$block1(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), BV8_XOR(v31$1, v35$1), $$block1[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block1(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_57"} {:captureState "check_state_57"} {:sourceloc} {:sourceloc_num 72} true;
    call {:check_id "check_state_57"} {:sourceloc} {:sourceloc_num 72} _CHECK_WRITE_$$block1(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), BV8_XOR(v31$2, v35$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block1"} true;
    $$block1[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)] := BV8_XOR(v31$1, v35$1);
    $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)] := BV8_XOR(v31$2, v35$2);
    call {:sourceloc} {:sourceloc_num 73} _LOG_WRITE_$$block1(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), BV8_XOR(v32$1, v36$1), $$block1[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block1(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_58"} {:captureState "check_state_58"} {:sourceloc} {:sourceloc_num 73} true;
    call {:check_id "check_state_58"} {:sourceloc} {:sourceloc_num 73} _CHECK_WRITE_$$block1(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), BV8_XOR(v32$2, v36$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block1"} true;
    $$block1[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)] := BV8_XOR(v32$1, v36$1);
    $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)] := BV8_XOR(v32$2, v36$2);
    call {:sourceloc} {:sourceloc_num 74} _LOG_WRITE_$$block1(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), BV8_XOR(v33$1, v37$1), $$block1[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block1(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_59"} {:captureState "check_state_59"} {:sourceloc} {:sourceloc_num 74} true;
    call {:check_id "check_state_59"} {:sourceloc} {:sourceloc_num 74} _CHECK_WRITE_$$block1(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), BV8_XOR(v33$2, v37$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block1"} true;
    $$block1[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)] := BV8_XOR(v33$1, v37$1);
    $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)] := BV8_XOR(v33$2, v37$2);
    goto __partitioned_block_$3.tail_2;

  __partitioned_block_$3.tail_2:
    call {:sourceloc_num 75} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    v38$1 := BV32_SUB(v2$1, BV32_MUL(v1, v0$1));
    v38$2 := BV32_SUB(v2$2, BV32_MUL(v1, v0$2));
    call {:sourceloc} {:sourceloc_num 76} _LOG_READ_$$block1(true, BV32_MUL(v38$1, 4bv32), $$block1[1bv1][BV32_MUL(v38$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_60"} {:captureState "check_state_60"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_60"} {:sourceloc} {:sourceloc_num 76} _CHECK_READ_$$block1(true, BV32_MUL(v38$2, 4bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v38$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v39$1 := $$block1[1bv1][BV32_MUL(v38$1, 4bv32)];
    v39$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v38$2, 4bv32)];
    call {:sourceloc} {:sourceloc_num 77} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$1, 4bv32), 1bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_61"} {:captureState "check_state_61"} {:sourceloc} {:sourceloc_num 77} true;
    call {:check_id "check_state_61"} {:sourceloc} {:sourceloc_num 77} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$2, 4bv32), 1bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v40$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 1bv32)];
    v40$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 78} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$1, 4bv32), 2bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_62"} {:captureState "check_state_62"} {:sourceloc} {:sourceloc_num 78} true;
    call {:check_id "check_state_62"} {:sourceloc} {:sourceloc_num 78} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$2, 4bv32), 2bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v41$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 2bv32)];
    v41$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 79} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$1, 4bv32), 3bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_63"} {:captureState "check_state_63"} {:sourceloc} {:sourceloc_num 79} true;
    call {:check_id "check_state_63"} {:sourceloc} {:sourceloc_num 79} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$2, 4bv32), 3bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v42$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 3bv32)];
    v42$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 3bv32)];
    v43$1 := $$galiosCoeff$1[BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32)];
    v43$2 := $$galiosCoeff$2[BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32)];
    v44$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32), 1bv32)];
    v44$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32), 1bv32)];
    v45$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32), 2bv32)];
    v45$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32), 2bv32)];
    v46$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32), 3bv32)];
    v46$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32), 3bv32)];
    $.021$1, $.017$1, $p.i.i.0$1, $i.i.i.0 := v39$1, v43$1, 0bv8, 0bv32;
    $.021$2, $.017$2, $p.i.i.0$2 := v39$2, v43$2, 0bv8;
    assume {:captureState "loop_entry_state_10_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_10"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 84} true;
    v47 := BV32_ULT($i.i.i.0, 8bv32);
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v47 && !v47;
    call {:sourceloc} {:sourceloc_num 91} _LOG_READ_$$block1(true, BV32_MUL(v38$1, 4bv32), $$block1[1bv1][BV32_MUL(v38$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_64"} {:captureState "check_state_64"} {:sourceloc} {:sourceloc_num 91} true;
    call {:check_id "check_state_64"} {:sourceloc} {:sourceloc_num 91} _CHECK_READ_$$block1(true, BV32_MUL(v38$2, 4bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v38$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v51$1 := $$block1[1bv1][BV32_MUL(v38$1, 4bv32)];
    v51$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v38$2, 4bv32)];
    call {:sourceloc} {:sourceloc_num 92} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$1, 4bv32), 1bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_65"} {:captureState "check_state_65"} {:sourceloc} {:sourceloc_num 92} true;
    call {:check_id "check_state_65"} {:sourceloc} {:sourceloc_num 92} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$2, 4bv32), 1bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v52$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 1bv32)];
    v52$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 93} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$1, 4bv32), 2bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_66"} {:captureState "check_state_66"} {:sourceloc} {:sourceloc_num 93} true;
    call {:check_id "check_state_66"} {:sourceloc} {:sourceloc_num 93} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$2, 4bv32), 2bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v53$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 2bv32)];
    v53$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 94} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$1, 4bv32), 3bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_67"} {:captureState "check_state_67"} {:sourceloc} {:sourceloc_num 94} true;
    call {:check_id "check_state_67"} {:sourceloc} {:sourceloc_num 94} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$2, 4bv32), 3bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v54$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 3bv32)];
    v54$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 3bv32)];
    v55$1 := $$galiosCoeff$1[BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32)];
    v55$2 := $$galiosCoeff$2[BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32)];
    v56$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32), 1bv32)];
    v56$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32), 1bv32)];
    v57$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32), 2bv32)];
    v57$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32), 2bv32)];
    v58$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32), 3bv32)];
    v58$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32), 3bv32)];
    $i.i26.i.0, $p.i25.i.0$1, $.01$1, $.0$1 := 0bv32, 0bv8, v55$1, v52$1;
    $p.i25.i.0$2, $.01$2, $.0$2 := 0bv8, v55$2, v52$2;
    assume {:captureState "loop_entry_state_9_0"} true;
    goto $11;

  $11:
    assume {:captureState "loop_head_state_9"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 99} true;
    v59 := BV32_ULT($i.i26.i.0, 8bv32);
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    p9$1 := false;
    p9$2 := false;
    p10$1 := false;
    p10$2 := false;
    goto $truebb4, $falsebb4;

  $falsebb4:
    assume {:partition} !v59 && !v59;
    call {:sourceloc} {:sourceloc_num 106} _LOG_READ_$$block1(true, BV32_MUL(v38$1, 4bv32), $$block1[1bv1][BV32_MUL(v38$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_68"} {:captureState "check_state_68"} {:sourceloc} {:sourceloc_num 106} true;
    call {:check_id "check_state_68"} {:sourceloc} {:sourceloc_num 106} _CHECK_READ_$$block1(true, BV32_MUL(v38$2, 4bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v38$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v63$1 := $$block1[1bv1][BV32_MUL(v38$1, 4bv32)];
    v63$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v38$2, 4bv32)];
    call {:sourceloc} {:sourceloc_num 107} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$1, 4bv32), 1bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_69"} {:captureState "check_state_69"} {:sourceloc} {:sourceloc_num 107} true;
    call {:check_id "check_state_69"} {:sourceloc} {:sourceloc_num 107} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$2, 4bv32), 1bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v64$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 1bv32)];
    v64$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 108} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$1, 4bv32), 2bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_70"} {:captureState "check_state_70"} {:sourceloc} {:sourceloc_num 108} true;
    call {:check_id "check_state_70"} {:sourceloc} {:sourceloc_num 108} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$2, 4bv32), 2bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v65$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 2bv32)];
    v65$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 109} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$1, 4bv32), 3bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_71"} {:captureState "check_state_71"} {:sourceloc} {:sourceloc_num 109} true;
    call {:check_id "check_state_71"} {:sourceloc} {:sourceloc_num 109} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$2, 4bv32), 3bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v66$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 3bv32)];
    v66$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 3bv32)];
    v67$1 := $$galiosCoeff$1[BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32)];
    v67$2 := $$galiosCoeff$2[BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32)];
    v68$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32), 1bv32)];
    v68$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32), 1bv32)];
    v69$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32), 2bv32)];
    v69$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32), 2bv32)];
    v70$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32), 3bv32)];
    v70$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32), 3bv32)];
    $i.i22.i.0, $p.i21.i.0$1, $.04$1, $.02$1 := 0bv32, 0bv8, v67$1, v65$1;
    $p.i21.i.0$2, $.04$2, $.02$2 := 0bv8, v67$2, v65$2;
    assume {:captureState "loop_entry_state_8_0"} true;
    goto $17;

  $17:
    assume {:captureState "loop_head_state_8"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 114} true;
    v71 := BV32_ULT($i.i22.i.0, 8bv32);
    p11$1 := false;
    p11$2 := false;
    p12$1 := false;
    p12$2 := false;
    p13$1 := false;
    p13$2 := false;
    p14$1 := false;
    p14$2 := false;
    goto $truebb7, $falsebb7;

  $falsebb7:
    assume {:partition} !v71 && !v71;
    call {:sourceloc} {:sourceloc_num 121} _LOG_READ_$$block1(true, BV32_MUL(v38$1, 4bv32), $$block1[1bv1][BV32_MUL(v38$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_72"} {:captureState "check_state_72"} {:sourceloc} {:sourceloc_num 121} true;
    call {:check_id "check_state_72"} {:sourceloc} {:sourceloc_num 121} _CHECK_READ_$$block1(true, BV32_MUL(v38$2, 4bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v38$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v75$1 := $$block1[1bv1][BV32_MUL(v38$1, 4bv32)];
    v75$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v38$2, 4bv32)];
    call {:sourceloc} {:sourceloc_num 122} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$1, 4bv32), 1bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_73"} {:captureState "check_state_73"} {:sourceloc} {:sourceloc_num 122} true;
    call {:check_id "check_state_73"} {:sourceloc} {:sourceloc_num 122} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$2, 4bv32), 1bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v76$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 1bv32)];
    v76$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 123} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$1, 4bv32), 2bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_74"} {:captureState "check_state_74"} {:sourceloc} {:sourceloc_num 123} true;
    call {:check_id "check_state_74"} {:sourceloc} {:sourceloc_num 123} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$2, 4bv32), 2bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v77$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 2bv32)];
    v77$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 124} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$1, 4bv32), 3bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_75"} {:captureState "check_state_75"} {:sourceloc} {:sourceloc_num 124} true;
    call {:check_id "check_state_75"} {:sourceloc} {:sourceloc_num 124} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(v38$2, 4bv32), 3bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v78$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(v38$1, 4bv32), 3bv32)];
    v78$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v38$2, 4bv32), 3bv32)];
    v79$1 := $$galiosCoeff$1[BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32)];
    v79$2 := $$galiosCoeff$2[BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32)];
    v80$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32), 1bv32)];
    v80$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32), 1bv32)];
    v81$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32), 2bv32)];
    v81$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32), 2bv32)];
    v82$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$1), 4bv32), 4bv32), 3bv32)];
    v82$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(4bv32, v0$2), 4bv32), 4bv32), 3bv32)];
    $i.i18.i.0, $p.i17.i.0$1, $.07$1, $.05$1 := 0bv32, 0bv8, v79$1, v78$1;
    $p.i17.i.0$2, $.07$2, $.05$2 := 0bv8, v79$2, v78$2;
    assume {:captureState "loop_entry_state_7_0"} true;
    goto $23;

  $23:
    assume {:captureState "loop_head_state_7"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 129} true;
    v83 := BV32_ULT($i.i18.i.0, 8bv32);
    p15$1 := false;
    p15$2 := false;
    p16$1 := false;
    p16$2 := false;
    p17$1 := false;
    p17$2 := false;
    p18$1 := false;
    p18$2 := false;
    goto $truebb10, $falsebb10;

  $falsebb10:
    assume {:partition} !v83 && !v83;
    $x.i.0$1, $y.i.0$1, $z.i.0$1, $w.i.0$1, $k.i.0 := $p.i.i.0$1, $p.i25.i.0$1, $p.i21.i.0$1, $p.i17.i.0$1, 1bv32;
    $x.i.0$2, $y.i.0$2, $z.i.0$2, $w.i.0$2 := $p.i.i.0$2, $p.i25.i.0$2, $p.i21.i.0$2, $p.i17.i.0$2;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $29;

  $29:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b17 ==> _READ_HAS_OCCURRED_$$block1 ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_MUL(0bv32, 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4bv32), 3bv32));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_UGE($k.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_UGE($k.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b7 ==> BV32_ULE($k.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b7 ==> BV32_ULE($k.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b6 ==> BV32_SGE($k.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b6 ==> BV32_SGE($k.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b5 ==> BV32_SLE($k.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b5 ==> BV32_SLE($k.i.0, 1bv32);
    assert {:block_sourceloc} {:sourceloc_num 136} true;
    v87 := BV32_ULT($k.i.0, 4bv32);
    goto $truebb13, $falsebb13;

  $falsebb13:
    assume {:partition} !v87 && !v87;
    call {:sourceloc} {:sourceloc_num 199} _LOG_WRITE_$$block0(true, BV32_MUL(v2$1, 4bv32), $x.i.0$1, $$block0[1bv1][BV32_MUL(v2$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_MUL(v2$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_76"} {:captureState "check_state_76"} {:sourceloc} {:sourceloc_num 199} true;
    call {:check_id "check_state_76"} {:sourceloc} {:sourceloc_num 199} _CHECK_WRITE_$$block0(true, BV32_MUL(v2$2, 4bv32), $x.i.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_MUL(v2$1, 4bv32)] := $x.i.0$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v2$2, 4bv32)] := $x.i.0$2;
    call {:sourceloc} {:sourceloc_num 200} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), $y.i.0$1, $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_77"} {:captureState "check_state_77"} {:sourceloc} {:sourceloc_num 200} true;
    call {:check_id "check_state_77"} {:sourceloc} {:sourceloc_num 200} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), $y.i.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)] := $y.i.0$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)] := $y.i.0$2;
    call {:sourceloc} {:sourceloc_num 201} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), $z.i.0$1, $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_78"} {:captureState "check_state_78"} {:sourceloc} {:sourceloc_num 201} true;
    call {:check_id "check_state_78"} {:sourceloc} {:sourceloc_num 201} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), $z.i.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)] := $z.i.0$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)] := $z.i.0$2;
    call {:sourceloc} {:sourceloc_num 202} _LOG_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), $w.i.0$1, $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_79"} {:captureState "check_state_79"} {:sourceloc} {:sourceloc_num 202} true;
    call {:check_id "check_state_79"} {:sourceloc} {:sourceloc_num 202} _CHECK_WRITE_$$block0(true, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), $w.i.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block0"} true;
    $$block0[1bv1][BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)] := $w.i.0$1;
    $$block0[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)] := $w.i.0$2;
    $r.0 := BV32_ADD($r.0, 4294967295bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $1;

  $truebb13:
    assume {:partition} v87 && v87;
    call {:sourceloc} {:sourceloc_num 138} _LOG_READ_$$block1(true, BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), $$block1[1bv1][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_80"} {:captureState "check_state_80"} {:sourceloc} {:sourceloc_num 138} true;
    call {:check_id "check_state_80"} {:sourceloc} {:sourceloc_num 138} _CHECK_READ_$$block1(true, BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v88$1 := $$block1[1bv1][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32)];
    v88$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32)];
    call {:sourceloc} {:sourceloc_num 139} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 1bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_81"} {:captureState "check_state_81"} {:sourceloc} {:sourceloc_num 139} true;
    call {:check_id "check_state_81"} {:sourceloc} {:sourceloc_num 139} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 1bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v89$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 1bv32)];
    v89$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 140} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 2bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_82"} {:captureState "check_state_82"} {:sourceloc} {:sourceloc_num 140} true;
    call {:check_id "check_state_82"} {:sourceloc} {:sourceloc_num 140} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 2bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v90$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 2bv32)];
    v90$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 141} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 3bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_83"} {:captureState "check_state_83"} {:sourceloc} {:sourceloc_num 141} true;
    call {:check_id "check_state_83"} {:sourceloc} {:sourceloc_num 141} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 3bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v91$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 3bv32)];
    v91$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 3bv32)];
    v92$1 := $$galiosCoeff$1[BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32)];
    v92$2 := $$galiosCoeff$2[BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32)];
    v93$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32), 1bv32)];
    v93$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32), 1bv32)];
    v94$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32), 2bv32)];
    v94$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32), 2bv32)];
    v95$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32), 3bv32)];
    v95$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32), 3bv32)];
    $i.i14.i.0, $p.i13.i.0$1, $.010$1, $.08$1 := 0bv32, 0bv8, v92$1, v88$1;
    $p.i13.i.0$2, $.010$2, $.08$2 := 0bv8, v92$2, v88$2;
    assume {:captureState "loop_entry_state_6_0"} true;
    goto $31;

  $31:
    assume {:captureState "loop_head_state_6"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 146} true;
    v96 := BV32_ULT($i.i14.i.0, 8bv32);
    p19$1 := false;
    p19$2 := false;
    p20$1 := false;
    p20$2 := false;
    p21$1 := false;
    p21$2 := false;
    p22$1 := false;
    p22$2 := false;
    goto $truebb14, $falsebb14;

  $falsebb14:
    assume {:partition} !v96 && !v96;
    call {:sourceloc} {:sourceloc_num 153} _LOG_READ_$$block1(true, BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), $$block1[1bv1][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_84"} {:captureState "check_state_84"} {:sourceloc} {:sourceloc_num 153} true;
    call {:check_id "check_state_84"} {:sourceloc} {:sourceloc_num 153} _CHECK_READ_$$block1(true, BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v100$1 := $$block1[1bv1][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32)];
    v100$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32)];
    call {:sourceloc} {:sourceloc_num 154} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 1bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_85"} {:captureState "check_state_85"} {:sourceloc} {:sourceloc_num 154} true;
    call {:check_id "check_state_85"} {:sourceloc} {:sourceloc_num 154} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 1bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v101$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 1bv32)];
    v101$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 155} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 2bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_86"} {:captureState "check_state_86"} {:sourceloc} {:sourceloc_num 155} true;
    call {:check_id "check_state_86"} {:sourceloc} {:sourceloc_num 155} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 2bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v102$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 2bv32)];
    v102$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 156} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 3bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_87"} {:captureState "check_state_87"} {:sourceloc} {:sourceloc_num 156} true;
    call {:check_id "check_state_87"} {:sourceloc} {:sourceloc_num 156} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 3bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v103$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 3bv32)];
    v103$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 3bv32)];
    v104$1 := $$galiosCoeff$1[BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32)];
    v104$2 := $$galiosCoeff$2[BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32)];
    v105$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32), 1bv32)];
    v105$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32), 1bv32)];
    v106$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32), 2bv32)];
    v106$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32), 2bv32)];
    v107$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32), 3bv32)];
    v107$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32), 3bv32)];
    $i.i10.i.0, $p.i9.i.0$1, $.013$1, $.011$1 := 0bv32, 0bv8, v104$1, v101$1;
    $p.i9.i.0$2, $.013$2, $.011$2 := 0bv8, v104$2, v101$2;
    assume {:captureState "loop_entry_state_5_0"} true;
    goto $37;

  $37:
    assume {:captureState "loop_head_state_5"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 161} true;
    v108 := BV32_ULT($i.i10.i.0, 8bv32);
    p23$1 := false;
    p23$2 := false;
    p24$1 := false;
    p24$2 := false;
    p25$1 := false;
    p25$2 := false;
    p26$1 := false;
    p26$2 := false;
    goto $truebb17, $falsebb17;

  $falsebb17:
    assume {:partition} !v108 && !v108;
    call {:sourceloc} {:sourceloc_num 168} _LOG_READ_$$block1(true, BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), $$block1[1bv1][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_88"} {:captureState "check_state_88"} {:sourceloc} {:sourceloc_num 168} true;
    call {:check_id "check_state_88"} {:sourceloc} {:sourceloc_num 168} _CHECK_READ_$$block1(true, BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v112$1 := $$block1[1bv1][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32)];
    v112$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32)];
    call {:sourceloc} {:sourceloc_num 169} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 1bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_89"} {:captureState "check_state_89"} {:sourceloc} {:sourceloc_num 169} true;
    call {:check_id "check_state_89"} {:sourceloc} {:sourceloc_num 169} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 1bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v113$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 1bv32)];
    v113$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 170} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 2bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_90"} {:captureState "check_state_90"} {:sourceloc} {:sourceloc_num 170} true;
    call {:check_id "check_state_90"} {:sourceloc} {:sourceloc_num 170} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 2bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v114$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 2bv32)];
    v114$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 171} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 3bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_91"} {:captureState "check_state_91"} {:sourceloc} {:sourceloc_num 171} true;
    call {:check_id "check_state_91"} {:sourceloc} {:sourceloc_num 171} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 3bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v115$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 3bv32)];
    v115$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 3bv32)];
    v116$1 := $$galiosCoeff$1[BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32)];
    v116$2 := $$galiosCoeff$2[BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32)];
    v117$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32), 1bv32)];
    v117$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32), 1bv32)];
    v118$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32), 2bv32)];
    v118$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32), 2bv32)];
    v119$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32), 3bv32)];
    v119$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32), 3bv32)];
    $i.i6.i.0, $p.i5.i.0$1, $.016$1, $.014$1 := 0bv32, 0bv8, v116$1, v114$1;
    $p.i5.i.0$2, $.016$2, $.014$2 := 0bv8, v116$2, v114$2;
    assume {:captureState "loop_entry_state_4_0"} true;
    goto $43;

  $43:
    assume {:captureState "loop_head_state_4"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 176} true;
    v120 := BV32_ULT($i.i6.i.0, 8bv32);
    p27$1 := false;
    p27$2 := false;
    p28$1 := false;
    p28$2 := false;
    p29$1 := false;
    p29$2 := false;
    p30$1 := false;
    p30$2 := false;
    goto $truebb20, $falsebb20;

  $falsebb20:
    assume {:partition} !v120 && !v120;
    call {:sourceloc} {:sourceloc_num 183} _LOG_READ_$$block1(true, BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), $$block1[1bv1][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_92"} {:captureState "check_state_92"} {:sourceloc} {:sourceloc_num 183} true;
    call {:check_id "check_state_92"} {:sourceloc} {:sourceloc_num 183} _CHECK_READ_$$block1(true, BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v124$1 := $$block1[1bv1][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32)];
    v124$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32)];
    call {:sourceloc} {:sourceloc_num 184} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 1bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_93"} {:captureState "check_state_93"} {:sourceloc} {:sourceloc_num 184} true;
    call {:check_id "check_state_93"} {:sourceloc} {:sourceloc_num 184} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 1bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v125$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 1bv32)];
    v125$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 185} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 2bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_94"} {:captureState "check_state_94"} {:sourceloc} {:sourceloc_num 185} true;
    call {:check_id "check_state_94"} {:sourceloc} {:sourceloc_num 185} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 2bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v126$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 2bv32)];
    v126$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 186} _LOG_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 3bv32), $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_95"} {:captureState "check_state_95"} {:sourceloc} {:sourceloc_num 186} true;
    call {:check_id "check_state_95"} {:sourceloc} {:sourceloc_num 186} _CHECK_READ_$$block1(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 3bv32), $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block1"} true;
    v127$1 := $$block1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$1), 4bv32), 3bv32)];
    v127$2 := $$block1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($k.i.0, v1), v38$2), 4bv32), 3bv32)];
    v128$1 := $$galiosCoeff$1[BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32)];
    v128$2 := $$galiosCoeff$2[BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32)];
    v129$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32), 1bv32)];
    v129$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32), 1bv32)];
    v130$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32), 2bv32)];
    v130$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32), 2bv32)];
    v131$1 := $$galiosCoeff$1[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$1), 4bv32), 4bv32), 3bv32)];
    v131$2 := $$galiosCoeff$2[BV32_ADD(BV32_MUL(BV32_UREM(BV32_SUB(BV32_ADD($k.i.0, 4bv32), v0$2), 4bv32), 4bv32), 3bv32)];
    $i.i2.i.0, $p.i1.i.0$1, $.020$1, $.018$1 := 0bv32, 0bv8, v128$1, v127$1;
    $p.i1.i.0$2, $.020$2, $.018$2 := 0bv8, v128$2, v127$2;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $49;

  $49:
    assume {:captureState "loop_head_state_3"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$block0 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 191} true;
    v132 := BV32_ULT($i.i2.i.0, 8bv32);
    p31$1 := false;
    p31$2 := false;
    p32$1 := false;
    p32$2 := false;
    p33$1 := false;
    p33$2 := false;
    p34$1 := false;
    p34$2 := false;
    goto $truebb23, $falsebb23;

  $falsebb23:
    assume {:partition} !v132 && !v132;
    $x.i.0$1, $y.i.0$1, $z.i.0$1, $w.i.0$1, $k.i.0 := BV32_XOR(BV8_ZEXT32($x.i.0$1), BV8_ZEXT32($p.i13.i.0$1))[8:0], BV32_XOR(BV8_ZEXT32($y.i.0$1), BV8_ZEXT32($p.i9.i.0$1))[8:0], BV32_XOR(BV8_ZEXT32($z.i.0$1), BV8_ZEXT32($p.i5.i.0$1))[8:0], BV32_XOR(BV8_ZEXT32($w.i.0$1), BV8_ZEXT32($p.i1.i.0$1))[8:0], BV32_ADD($k.i.0, 1bv32);
    $x.i.0$2, $y.i.0$2, $z.i.0$2, $w.i.0$2 := BV32_XOR(BV8_ZEXT32($x.i.0$2), BV8_ZEXT32($p.i13.i.0$2))[8:0], BV32_XOR(BV8_ZEXT32($y.i.0$2), BV8_ZEXT32($p.i9.i.0$2))[8:0], BV32_XOR(BV8_ZEXT32($z.i.0$2), BV8_ZEXT32($p.i5.i.0$2))[8:0], BV32_XOR(BV8_ZEXT32($w.i.0$2), BV8_ZEXT32($p.i1.i.0$2))[8:0];
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $29;

  $truebb23:
    assume {:partition} v132 && v132;
    v133$1 := BV32_AND(BV8_ZEXT32($.020$1), 1bv32) == 1bv32;
    v133$2 := BV32_AND(BV8_ZEXT32($.020$2), 1bv32) == 1bv32;
    p32$1 := (if v133$1 then v133$1 else p32$1);
    p32$2 := (if v133$2 then v133$2 else p32$2);
    p31$1 := (if !v133$1 then !v133$1 else p31$1);
    p31$2 := (if !v133$2 then !v133$2 else p31$2);
    $p.i1.i.1$1 := (if p31$1 then $p.i1.i.0$1 else $p.i1.i.1$1);
    $p.i1.i.1$2 := (if p31$2 then $p.i1.i.0$2 else $p.i1.i.1$2);
    $p.i1.i.1$1 := (if p32$1 then BV32_XOR(BV8_ZEXT32($p.i1.i.0$1), BV8_ZEXT32($.018$1))[8:0] else $p.i1.i.1$1);
    $p.i1.i.1$2 := (if p32$2 then BV32_XOR(BV8_ZEXT32($p.i1.i.0$2), BV8_ZEXT32($.018$2))[8:0] else $p.i1.i.1$2);
    v134$1 := BV32_SHL(BV8_ZEXT32($.018$1), 1bv32)[8:0];
    v134$2 := BV32_SHL(BV8_ZEXT32($.018$2), 1bv32)[8:0];
    v135$1 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.018$1), 128bv32)[8:0]) == 128bv32;
    v135$2 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.018$2), 128bv32)[8:0]) == 128bv32;
    p34$1 := (if v135$1 then v135$1 else p34$1);
    p34$2 := (if v135$2 then v135$2 else p34$2);
    p33$1 := (if !v135$1 then !v135$1 else p33$1);
    p33$2 := (if !v135$2 then !v135$2 else p33$2);
    $.119$1 := (if p33$1 then v134$1 else $.119$1);
    $.119$2 := (if p33$2 then v134$2 else $.119$2);
    $.119$1 := (if p34$1 then BV32_XOR(BV8_ZEXT32(v134$1), 27bv32)[8:0] else $.119$1);
    $.119$2 := (if p34$2 then BV32_XOR(BV8_ZEXT32(v134$2), 27bv32)[8:0] else $.119$2);
    $i.i2.i.0, $p.i1.i.0$1, $.020$1, $.018$1 := BV32_ADD($i.i2.i.0, 1bv32), $p.i1.i.1$1, BV32_ASHR(BV8_ZEXT32($.020$1), 1bv32)[8:0], $.119$1;
    $p.i1.i.0$2, $.020$2, $.018$2 := $p.i1.i.1$2, BV32_ASHR(BV8_ZEXT32($.020$2), 1bv32)[8:0], $.119$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $49;

  $truebb20:
    assume {:partition} v120 && v120;
    v121$1 := BV32_AND(BV8_ZEXT32($.016$1), 1bv32) == 1bv32;
    v121$2 := BV32_AND(BV8_ZEXT32($.016$2), 1bv32) == 1bv32;
    p28$1 := (if v121$1 then v121$1 else p28$1);
    p28$2 := (if v121$2 then v121$2 else p28$2);
    p27$1 := (if !v121$1 then !v121$1 else p27$1);
    p27$2 := (if !v121$2 then !v121$2 else p27$2);
    $p.i5.i.1$1 := (if p27$1 then $p.i5.i.0$1 else $p.i5.i.1$1);
    $p.i5.i.1$2 := (if p27$2 then $p.i5.i.0$2 else $p.i5.i.1$2);
    $p.i5.i.1$1 := (if p28$1 then BV32_XOR(BV8_ZEXT32($p.i5.i.0$1), BV8_ZEXT32($.014$1))[8:0] else $p.i5.i.1$1);
    $p.i5.i.1$2 := (if p28$2 then BV32_XOR(BV8_ZEXT32($p.i5.i.0$2), BV8_ZEXT32($.014$2))[8:0] else $p.i5.i.1$2);
    v122$1 := BV32_SHL(BV8_ZEXT32($.014$1), 1bv32)[8:0];
    v122$2 := BV32_SHL(BV8_ZEXT32($.014$2), 1bv32)[8:0];
    v123$1 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.014$1), 128bv32)[8:0]) == 128bv32;
    v123$2 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.014$2), 128bv32)[8:0]) == 128bv32;
    p30$1 := (if v123$1 then v123$1 else p30$1);
    p30$2 := (if v123$2 then v123$2 else p30$2);
    p29$1 := (if !v123$1 then !v123$1 else p29$1);
    p29$2 := (if !v123$2 then !v123$2 else p29$2);
    $.115$1 := (if p29$1 then v122$1 else $.115$1);
    $.115$2 := (if p29$2 then v122$2 else $.115$2);
    $.115$1 := (if p30$1 then BV32_XOR(BV8_ZEXT32(v122$1), 27bv32)[8:0] else $.115$1);
    $.115$2 := (if p30$2 then BV32_XOR(BV8_ZEXT32(v122$2), 27bv32)[8:0] else $.115$2);
    $i.i6.i.0, $p.i5.i.0$1, $.016$1, $.014$1 := BV32_ADD($i.i6.i.0, 1bv32), $p.i5.i.1$1, BV32_ASHR(BV8_ZEXT32($.016$1), 1bv32)[8:0], $.115$1;
    $p.i5.i.0$2, $.016$2, $.014$2 := $p.i5.i.1$2, BV32_ASHR(BV8_ZEXT32($.016$2), 1bv32)[8:0], $.115$2;
    assume {:captureState "loop_back_edge_state_4_0"} true;
    goto $43;

  $truebb17:
    assume {:partition} v108 && v108;
    v109$1 := BV32_AND(BV8_ZEXT32($.013$1), 1bv32) == 1bv32;
    v109$2 := BV32_AND(BV8_ZEXT32($.013$2), 1bv32) == 1bv32;
    p24$1 := (if v109$1 then v109$1 else p24$1);
    p24$2 := (if v109$2 then v109$2 else p24$2);
    p23$1 := (if !v109$1 then !v109$1 else p23$1);
    p23$2 := (if !v109$2 then !v109$2 else p23$2);
    $p.i9.i.1$1 := (if p23$1 then $p.i9.i.0$1 else $p.i9.i.1$1);
    $p.i9.i.1$2 := (if p23$2 then $p.i9.i.0$2 else $p.i9.i.1$2);
    $p.i9.i.1$1 := (if p24$1 then BV32_XOR(BV8_ZEXT32($p.i9.i.0$1), BV8_ZEXT32($.011$1))[8:0] else $p.i9.i.1$1);
    $p.i9.i.1$2 := (if p24$2 then BV32_XOR(BV8_ZEXT32($p.i9.i.0$2), BV8_ZEXT32($.011$2))[8:0] else $p.i9.i.1$2);
    v110$1 := BV32_SHL(BV8_ZEXT32($.011$1), 1bv32)[8:0];
    v110$2 := BV32_SHL(BV8_ZEXT32($.011$2), 1bv32)[8:0];
    v111$1 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.011$1), 128bv32)[8:0]) == 128bv32;
    v111$2 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.011$2), 128bv32)[8:0]) == 128bv32;
    p26$1 := (if v111$1 then v111$1 else p26$1);
    p26$2 := (if v111$2 then v111$2 else p26$2);
    p25$1 := (if !v111$1 then !v111$1 else p25$1);
    p25$2 := (if !v111$2 then !v111$2 else p25$2);
    $.112$1 := (if p25$1 then v110$1 else $.112$1);
    $.112$2 := (if p25$2 then v110$2 else $.112$2);
    $.112$1 := (if p26$1 then BV32_XOR(BV8_ZEXT32(v110$1), 27bv32)[8:0] else $.112$1);
    $.112$2 := (if p26$2 then BV32_XOR(BV8_ZEXT32(v110$2), 27bv32)[8:0] else $.112$2);
    $i.i10.i.0, $p.i9.i.0$1, $.013$1, $.011$1 := BV32_ADD($i.i10.i.0, 1bv32), $p.i9.i.1$1, BV32_ASHR(BV8_ZEXT32($.013$1), 1bv32)[8:0], $.112$1;
    $p.i9.i.0$2, $.013$2, $.011$2 := $p.i9.i.1$2, BV32_ASHR(BV8_ZEXT32($.013$2), 1bv32)[8:0], $.112$2;
    assume {:captureState "loop_back_edge_state_5_0"} true;
    goto $37;

  $truebb14:
    assume {:partition} v96 && v96;
    v97$1 := BV32_AND(BV8_ZEXT32($.010$1), 1bv32) == 1bv32;
    v97$2 := BV32_AND(BV8_ZEXT32($.010$2), 1bv32) == 1bv32;
    p20$1 := (if v97$1 then v97$1 else p20$1);
    p20$2 := (if v97$2 then v97$2 else p20$2);
    p19$1 := (if !v97$1 then !v97$1 else p19$1);
    p19$2 := (if !v97$2 then !v97$2 else p19$2);
    $p.i13.i.1$1 := (if p19$1 then $p.i13.i.0$1 else $p.i13.i.1$1);
    $p.i13.i.1$2 := (if p19$2 then $p.i13.i.0$2 else $p.i13.i.1$2);
    $p.i13.i.1$1 := (if p20$1 then BV32_XOR(BV8_ZEXT32($p.i13.i.0$1), BV8_ZEXT32($.08$1))[8:0] else $p.i13.i.1$1);
    $p.i13.i.1$2 := (if p20$2 then BV32_XOR(BV8_ZEXT32($p.i13.i.0$2), BV8_ZEXT32($.08$2))[8:0] else $p.i13.i.1$2);
    v98$1 := BV32_SHL(BV8_ZEXT32($.08$1), 1bv32)[8:0];
    v98$2 := BV32_SHL(BV8_ZEXT32($.08$2), 1bv32)[8:0];
    v99$1 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.08$1), 128bv32)[8:0]) == 128bv32;
    v99$2 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.08$2), 128bv32)[8:0]) == 128bv32;
    p22$1 := (if v99$1 then v99$1 else p22$1);
    p22$2 := (if v99$2 then v99$2 else p22$2);
    p21$1 := (if !v99$1 then !v99$1 else p21$1);
    p21$2 := (if !v99$2 then !v99$2 else p21$2);
    $.19$1 := (if p21$1 then v98$1 else $.19$1);
    $.19$2 := (if p21$2 then v98$2 else $.19$2);
    $.19$1 := (if p22$1 then BV32_XOR(BV8_ZEXT32(v98$1), 27bv32)[8:0] else $.19$1);
    $.19$2 := (if p22$2 then BV32_XOR(BV8_ZEXT32(v98$2), 27bv32)[8:0] else $.19$2);
    $i.i14.i.0, $p.i13.i.0$1, $.010$1, $.08$1 := BV32_ADD($i.i14.i.0, 1bv32), $p.i13.i.1$1, BV32_ASHR(BV8_ZEXT32($.010$1), 1bv32)[8:0], $.19$1;
    $p.i13.i.0$2, $.010$2, $.08$2 := $p.i13.i.1$2, BV32_ASHR(BV8_ZEXT32($.010$2), 1bv32)[8:0], $.19$2;
    assume {:captureState "loop_back_edge_state_6_0"} true;
    goto $31;

  $truebb10:
    assume {:partition} v83 && v83;
    v84$1 := BV32_AND(BV8_ZEXT32($.07$1), 1bv32) == 1bv32;
    v84$2 := BV32_AND(BV8_ZEXT32($.07$2), 1bv32) == 1bv32;
    p16$1 := (if v84$1 then v84$1 else p16$1);
    p16$2 := (if v84$2 then v84$2 else p16$2);
    p15$1 := (if !v84$1 then !v84$1 else p15$1);
    p15$2 := (if !v84$2 then !v84$2 else p15$2);
    $p.i17.i.1$1 := (if p15$1 then $p.i17.i.0$1 else $p.i17.i.1$1);
    $p.i17.i.1$2 := (if p15$2 then $p.i17.i.0$2 else $p.i17.i.1$2);
    $p.i17.i.1$1 := (if p16$1 then BV32_XOR(BV8_ZEXT32($p.i17.i.0$1), BV8_ZEXT32($.05$1))[8:0] else $p.i17.i.1$1);
    $p.i17.i.1$2 := (if p16$2 then BV32_XOR(BV8_ZEXT32($p.i17.i.0$2), BV8_ZEXT32($.05$2))[8:0] else $p.i17.i.1$2);
    v85$1 := BV32_SHL(BV8_ZEXT32($.05$1), 1bv32)[8:0];
    v85$2 := BV32_SHL(BV8_ZEXT32($.05$2), 1bv32)[8:0];
    v86$1 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.05$1), 128bv32)[8:0]) == 128bv32;
    v86$2 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.05$2), 128bv32)[8:0]) == 128bv32;
    p18$1 := (if v86$1 then v86$1 else p18$1);
    p18$2 := (if v86$2 then v86$2 else p18$2);
    p17$1 := (if !v86$1 then !v86$1 else p17$1);
    p17$2 := (if !v86$2 then !v86$2 else p17$2);
    $.16$1 := (if p17$1 then v85$1 else $.16$1);
    $.16$2 := (if p17$2 then v85$2 else $.16$2);
    $.16$1 := (if p18$1 then BV32_XOR(BV8_ZEXT32(v85$1), 27bv32)[8:0] else $.16$1);
    $.16$2 := (if p18$2 then BV32_XOR(BV8_ZEXT32(v85$2), 27bv32)[8:0] else $.16$2);
    $i.i18.i.0, $p.i17.i.0$1, $.07$1, $.05$1 := BV32_ADD($i.i18.i.0, 1bv32), $p.i17.i.1$1, BV32_ASHR(BV8_ZEXT32($.07$1), 1bv32)[8:0], $.16$1;
    $p.i17.i.0$2, $.07$2, $.05$2 := $p.i17.i.1$2, BV32_ASHR(BV8_ZEXT32($.07$2), 1bv32)[8:0], $.16$2;
    assume {:captureState "loop_back_edge_state_7_0"} true;
    goto $23;

  $truebb7:
    assume {:partition} v71 && v71;
    v72$1 := BV32_AND(BV8_ZEXT32($.04$1), 1bv32) == 1bv32;
    v72$2 := BV32_AND(BV8_ZEXT32($.04$2), 1bv32) == 1bv32;
    p12$1 := (if v72$1 then v72$1 else p12$1);
    p12$2 := (if v72$2 then v72$2 else p12$2);
    p11$1 := (if !v72$1 then !v72$1 else p11$1);
    p11$2 := (if !v72$2 then !v72$2 else p11$2);
    $p.i21.i.1$1 := (if p11$1 then $p.i21.i.0$1 else $p.i21.i.1$1);
    $p.i21.i.1$2 := (if p11$2 then $p.i21.i.0$2 else $p.i21.i.1$2);
    $p.i21.i.1$1 := (if p12$1 then BV32_XOR(BV8_ZEXT32($p.i21.i.0$1), BV8_ZEXT32($.02$1))[8:0] else $p.i21.i.1$1);
    $p.i21.i.1$2 := (if p12$2 then BV32_XOR(BV8_ZEXT32($p.i21.i.0$2), BV8_ZEXT32($.02$2))[8:0] else $p.i21.i.1$2);
    v73$1 := BV32_SHL(BV8_ZEXT32($.02$1), 1bv32)[8:0];
    v73$2 := BV32_SHL(BV8_ZEXT32($.02$2), 1bv32)[8:0];
    v74$1 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.02$1), 128bv32)[8:0]) == 128bv32;
    v74$2 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.02$2), 128bv32)[8:0]) == 128bv32;
    p14$1 := (if v74$1 then v74$1 else p14$1);
    p14$2 := (if v74$2 then v74$2 else p14$2);
    p13$1 := (if !v74$1 then !v74$1 else p13$1);
    p13$2 := (if !v74$2 then !v74$2 else p13$2);
    $.13$1 := (if p13$1 then v73$1 else $.13$1);
    $.13$2 := (if p13$2 then v73$2 else $.13$2);
    $.13$1 := (if p14$1 then BV32_XOR(BV8_ZEXT32(v73$1), 27bv32)[8:0] else $.13$1);
    $.13$2 := (if p14$2 then BV32_XOR(BV8_ZEXT32(v73$2), 27bv32)[8:0] else $.13$2);
    $i.i22.i.0, $p.i21.i.0$1, $.04$1, $.02$1 := BV32_ADD($i.i22.i.0, 1bv32), $p.i21.i.1$1, BV32_ASHR(BV8_ZEXT32($.04$1), 1bv32)[8:0], $.13$1;
    $p.i21.i.0$2, $.04$2, $.02$2 := $p.i21.i.1$2, BV32_ASHR(BV8_ZEXT32($.04$2), 1bv32)[8:0], $.13$2;
    assume {:captureState "loop_back_edge_state_8_0"} true;
    goto $17;

  $truebb4:
    assume {:partition} v59 && v59;
    v60$1 := BV32_AND(BV8_ZEXT32($.01$1), 1bv32) == 1bv32;
    v60$2 := BV32_AND(BV8_ZEXT32($.01$2), 1bv32) == 1bv32;
    p8$1 := (if v60$1 then v60$1 else p8$1);
    p8$2 := (if v60$2 then v60$2 else p8$2);
    p7$1 := (if !v60$1 then !v60$1 else p7$1);
    p7$2 := (if !v60$2 then !v60$2 else p7$2);
    $p.i25.i.1$1 := (if p7$1 then $p.i25.i.0$1 else $p.i25.i.1$1);
    $p.i25.i.1$2 := (if p7$2 then $p.i25.i.0$2 else $p.i25.i.1$2);
    $p.i25.i.1$1 := (if p8$1 then BV32_XOR(BV8_ZEXT32($p.i25.i.0$1), BV8_ZEXT32($.0$1))[8:0] else $p.i25.i.1$1);
    $p.i25.i.1$2 := (if p8$2 then BV32_XOR(BV8_ZEXT32($p.i25.i.0$2), BV8_ZEXT32($.0$2))[8:0] else $p.i25.i.1$2);
    v61$1 := BV32_SHL(BV8_ZEXT32($.0$1), 1bv32)[8:0];
    v61$2 := BV32_SHL(BV8_ZEXT32($.0$2), 1bv32)[8:0];
    v62$1 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.0$1), 128bv32)[8:0]) == 128bv32;
    v62$2 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.0$2), 128bv32)[8:0]) == 128bv32;
    p10$1 := (if v62$1 then v62$1 else p10$1);
    p10$2 := (if v62$2 then v62$2 else p10$2);
    p9$1 := (if !v62$1 then !v62$1 else p9$1);
    p9$2 := (if !v62$2 then !v62$2 else p9$2);
    $.1$1 := (if p9$1 then v61$1 else $.1$1);
    $.1$2 := (if p9$2 then v61$2 else $.1$2);
    $.1$1 := (if p10$1 then BV32_XOR(BV8_ZEXT32(v61$1), 27bv32)[8:0] else $.1$1);
    $.1$2 := (if p10$2 then BV32_XOR(BV8_ZEXT32(v61$2), 27bv32)[8:0] else $.1$2);
    $i.i26.i.0, $p.i25.i.0$1, $.01$1, $.0$1 := BV32_ADD($i.i26.i.0, 1bv32), $p.i25.i.1$1, BV32_ASHR(BV8_ZEXT32($.01$1), 1bv32)[8:0], $.1$1;
    $p.i25.i.0$2, $.01$2, $.0$2 := $p.i25.i.1$2, BV32_ASHR(BV8_ZEXT32($.01$2), 1bv32)[8:0], $.1$2;
    assume {:captureState "loop_back_edge_state_9_0"} true;
    goto $11;

  $truebb1:
    assume {:partition} v47 && v47;
    v48$1 := BV32_AND(BV8_ZEXT32($.017$1), 1bv32) == 1bv32;
    v48$2 := BV32_AND(BV8_ZEXT32($.017$2), 1bv32) == 1bv32;
    p4$1 := (if v48$1 then v48$1 else p4$1);
    p4$2 := (if v48$2 then v48$2 else p4$2);
    p3$1 := (if !v48$1 then !v48$1 else p3$1);
    p3$2 := (if !v48$2 then !v48$2 else p3$2);
    $p.i.i.1$1 := (if p3$1 then $p.i.i.0$1 else $p.i.i.1$1);
    $p.i.i.1$2 := (if p3$2 then $p.i.i.0$2 else $p.i.i.1$2);
    $p.i.i.1$1 := (if p4$1 then BV32_XOR(BV8_ZEXT32($p.i.i.0$1), BV8_ZEXT32($.021$1))[8:0] else $p.i.i.1$1);
    $p.i.i.1$2 := (if p4$2 then BV32_XOR(BV8_ZEXT32($p.i.i.0$2), BV8_ZEXT32($.021$2))[8:0] else $p.i.i.1$2);
    v49$1 := BV32_SHL(BV8_ZEXT32($.021$1), 1bv32)[8:0];
    v49$2 := BV32_SHL(BV8_ZEXT32($.021$2), 1bv32)[8:0];
    v50$1 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.021$1), 128bv32)[8:0]) == 128bv32;
    v50$2 := BV8_ZEXT32(BV32_AND(BV8_ZEXT32($.021$2), 128bv32)[8:0]) == 128bv32;
    p6$1 := (if v50$1 then v50$1 else p6$1);
    p6$2 := (if v50$2 then v50$2 else p6$2);
    p5$1 := (if !v50$1 then !v50$1 else p5$1);
    p5$2 := (if !v50$2 then !v50$2 else p5$2);
    $.122$1 := (if p5$1 then v49$1 else $.122$1);
    $.122$2 := (if p5$2 then v49$2 else $.122$2);
    $.122$1 := (if p6$1 then BV32_XOR(BV8_ZEXT32(v49$1), 27bv32)[8:0] else $.122$1);
    $.122$2 := (if p6$2 then BV32_XOR(BV8_ZEXT32(v49$2), 27bv32)[8:0] else $.122$2);
    $.021$1, $.017$1, $p.i.i.0$1, $i.i.i.0 := $.122$1, BV32_ASHR(BV8_ZEXT32($.017$1), 1bv32)[8:0], $p.i.i.1$1, BV32_ADD($i.i.i.0, 1bv32);
    $.021$2, $.017$2, $p.i.i.0$2 := $.122$2, BV32_ASHR(BV8_ZEXT32($.017$2), 1bv32)[8:0], $p.i.i.1$2;
    assume {:captureState "loop_back_edge_state_10_0"} true;
    goto $5;

  $3.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_11_0"} true;
    goto $3;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 128bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$block0, $$block1, $$output, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$block0, $$block1, $$output, _TRACKING;



const {:existential true} _b0: bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

const _WATCHED_VALUE_$$output: bv8;

procedure {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _READ_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_READ_$$output(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$output);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$output: bool;

procedure {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _WRITE_HAS_OCCURRED_$$output);
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



procedure _CHECK_WRITE_$$output(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_ATOMIC_$$output(_P: bool, _offset: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



const _WATCHED_VALUE_$$input: bv8;

procedure {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _READ_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_READ_$$input(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$input);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$input: bool;

procedure {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$input, _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _WRITE_HAS_OCCURRED_$$input);
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



procedure _CHECK_WRITE_$$input(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_ATOMIC_$$input(_P: bool, _offset: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



const _WATCHED_VALUE_$$roundKey: bv8;

procedure {:inline 1} _LOG_READ_$$roundKey(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$roundKey;



implementation {:inline 1} _LOG_READ_$$roundKey(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$roundKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$roundKey == _value then true else _READ_HAS_OCCURRED_$$roundKey);
    return;
}



procedure _CHECK_READ_$$roundKey(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "roundKey"} {:array "$$roundKey"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$roundKey && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$roundKey);
  requires {:source_name "roundKey"} {:array "$$roundKey"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$roundKey && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$roundKey: bool;

procedure {:inline 1} _LOG_WRITE_$$roundKey(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$roundKey, _WRITE_READ_BENIGN_FLAG_$$roundKey;



implementation {:inline 1} _LOG_WRITE_$$roundKey(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$roundKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$roundKey == _value then true else _WRITE_HAS_OCCURRED_$$roundKey);
    _WRITE_READ_BENIGN_FLAG_$$roundKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$roundKey == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$roundKey);
    return;
}



procedure _CHECK_WRITE_$$roundKey(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "roundKey"} {:array "$$roundKey"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$roundKey && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$roundKey != _value);
  requires {:source_name "roundKey"} {:array "$$roundKey"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$roundKey && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$roundKey != _value);
  requires {:source_name "roundKey"} {:array "$$roundKey"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$roundKey && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$roundKey(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$roundKey;



implementation {:inline 1} _LOG_ATOMIC_$$roundKey(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$roundKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$roundKey);
    return;
}



procedure _CHECK_ATOMIC_$$roundKey(_P: bool, _offset: bv32);
  requires {:source_name "roundKey"} {:array "$$roundKey"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$roundKey && _WATCHED_OFFSET == _offset);
  requires {:source_name "roundKey"} {:array "$$roundKey"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$roundKey && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$roundKey(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$roundKey;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$roundKey(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$roundKey := (if _P && _WRITE_HAS_OCCURRED_$$roundKey && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$roundKey);
    return;
}



const _WATCHED_VALUE_$$SBox: bv8;

procedure {:inline 1} _LOG_READ_$$SBox(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$SBox;



implementation {:inline 1} _LOG_READ_$$SBox(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$SBox := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$SBox == _value then true else _READ_HAS_OCCURRED_$$SBox);
    return;
}



procedure _CHECK_READ_$$SBox(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "SBox"} {:array "$$SBox"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$SBox && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$SBox);
  requires {:source_name "SBox"} {:array "$$SBox"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$SBox && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$SBox: bool;

procedure {:inline 1} _LOG_WRITE_$$SBox(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$SBox, _WRITE_READ_BENIGN_FLAG_$$SBox;



implementation {:inline 1} _LOG_WRITE_$$SBox(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$SBox := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$SBox == _value then true else _WRITE_HAS_OCCURRED_$$SBox);
    _WRITE_READ_BENIGN_FLAG_$$SBox := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$SBox == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$SBox);
    return;
}



procedure _CHECK_WRITE_$$SBox(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "SBox"} {:array "$$SBox"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$SBox && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$SBox != _value);
  requires {:source_name "SBox"} {:array "$$SBox"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$SBox && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$SBox != _value);
  requires {:source_name "SBox"} {:array "$$SBox"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$SBox && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$SBox(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$SBox;



implementation {:inline 1} _LOG_ATOMIC_$$SBox(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$SBox := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$SBox);
    return;
}



procedure _CHECK_ATOMIC_$$SBox(_P: bool, _offset: bv32);
  requires {:source_name "SBox"} {:array "$$SBox"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$SBox && _WATCHED_OFFSET == _offset);
  requires {:source_name "SBox"} {:array "$$SBox"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$SBox && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$SBox(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$SBox;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$SBox(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$SBox := (if _P && _WRITE_HAS_OCCURRED_$$SBox && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$SBox);
    return;
}



const _WATCHED_VALUE_$$block0: bv8;

procedure {:inline 1} _LOG_READ_$$block0(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$block0;



implementation {:inline 1} _LOG_READ_$$block0(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$block0 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block0 == _value then true else _READ_HAS_OCCURRED_$$block0);
    return;
}



procedure _CHECK_READ_$$block0(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "block0"} {:array "$$block0"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$block0 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$block0 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block0"} {:array "$$block0"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$block0 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$block0: bool;

procedure {:inline 1} _LOG_WRITE_$$block0(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$block0, _WRITE_READ_BENIGN_FLAG_$$block0;



implementation {:inline 1} _LOG_WRITE_$$block0(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$block0 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block0 == _value then true else _WRITE_HAS_OCCURRED_$$block0);
    _WRITE_READ_BENIGN_FLAG_$$block0 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block0 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$block0);
    return;
}



procedure _CHECK_WRITE_$$block0(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "block0"} {:array "$$block0"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$block0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block0 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block0"} {:array "$$block0"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$block0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block0 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block0"} {:array "$$block0"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$block0 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$block0(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$block0;



implementation {:inline 1} _LOG_ATOMIC_$$block0(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$block0 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$block0);
    return;
}



procedure _CHECK_ATOMIC_$$block0(_P: bool, _offset: bv32);
  requires {:source_name "block0"} {:array "$$block0"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$block0 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block0"} {:array "$$block0"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$block0 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$block0;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$block0(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$block0 := (if _P && _WRITE_HAS_OCCURRED_$$block0 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$block0);
    return;
}



const _WATCHED_VALUE_$$block1: bv8;

procedure {:inline 1} _LOG_READ_$$block1(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$block1;



implementation {:inline 1} _LOG_READ_$$block1(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$block1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block1 == _value then true else _READ_HAS_OCCURRED_$$block1);
    return;
}



procedure _CHECK_READ_$$block1(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "block1"} {:array "$$block1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$block1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$block1 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block1"} {:array "$$block1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$block1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$block1: bool;

procedure {:inline 1} _LOG_WRITE_$$block1(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$block1, _WRITE_READ_BENIGN_FLAG_$$block1;



implementation {:inline 1} _LOG_WRITE_$$block1(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$block1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block1 == _value then true else _WRITE_HAS_OCCURRED_$$block1);
    _WRITE_READ_BENIGN_FLAG_$$block1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$block1);
    return;
}



procedure _CHECK_WRITE_$$block1(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "block1"} {:array "$$block1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$block1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block1"} {:array "$$block1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$block1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block1"} {:array "$$block1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$block1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$block1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$block1;



implementation {:inline 1} _LOG_ATOMIC_$$block1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$block1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$block1);
    return;
}



procedure _CHECK_ATOMIC_$$block1(_P: bool, _offset: bv32);
  requires {:source_name "block1"} {:array "$$block1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$block1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block1"} {:array "$$block1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$block1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$block1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$block1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$block1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$block1 := (if _P && _WRITE_HAS_OCCURRED_$$block1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$block1);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$block0;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$block0;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$block0;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$block1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$block1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$block1;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$output;
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
    havoc $$output;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$block0;
    goto anon4;

  anon4:
    havoc $$block1;
    goto anon5;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$block0;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$block0;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$block0;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$block1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$block1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$block1;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$output;
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
    havoc $$output;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$block0;
    goto anon4;

  anon4:
    havoc $$block1;
    goto anon5;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

const {:existential true} _b11: bool;

const {:existential true} _b12: bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const {:existential true} _b17: bool;
