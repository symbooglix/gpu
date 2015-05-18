type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



axiom {:array_info "$$img"} {:global} {:elem_width 32} {:source_name "img"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$img: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$img: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$img: bool;

var {:source_name "integral_image"} {:global} $$integral_image: [bv32]bv32;

axiom {:array_info "$$integral_image"} {:global} {:elem_width 32} {:source_name "integral_image"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$integral_image: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$integral_image: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$integral_image: bool;

axiom {:array_info "$$0"} {:elem_width 8} {:source_name ""} {:source_elem_width 32} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 8} {:source_name ""} {:source_elem_width 32} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 8} {:source_name ""} {:source_elem_width 32} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$8"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$9"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$10"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$11"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$12"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$13"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$14"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$15"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$16"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$17"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$18"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$19"} {:elem_width 8} {:source_name ""} {:source_elem_width 32} {:source_dimensions "1"} true;

axiom {:array_info "$$data"} {:elem_width 32} {:source_name "data"} {:source_elem_width 128} {:source_dimensions "1"} true;

var {:source_name "result"} $$result$1: [bv32]bv32;

var {:source_name "result"} $$result$2: [bv32]bv32;

axiom {:array_info "$$result"} {:elem_width 32} {:source_name "result"} {:source_elem_width 32} {:source_dimensions "16"} true;

axiom {:array_info "$$a"} {:elem_width 8} {:source_name "a"} {:source_elem_width 32} {:source_dimensions "1"} true;

axiom {:array_info "$$b"} {:elem_width 8} {:source_name "b"} {:source_elem_width 32} {:source_dimensions "1"} true;

axiom {:array_info "$$c"} {:elem_width 8} {:source_name "c"} {:source_elem_width 32} {:source_dimensions "1"} true;

axiom {:array_info "$$d"} {:elem_width 8} {:source_name "d"} {:source_elem_width 32} {:source_dimensions "1"} true;

axiom {:array_info "$$output"} {:elem_width 32} {:source_name "output"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$20"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$21"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$22"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$23"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$24"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$25"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$26"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$27"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$28"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$29"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$30"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$31"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$32"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$33"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$34"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$35"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

var {:source_name "sums"} {:group_shared} $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums"} {:group_shared} {:elem_width 32} {:source_name "sums"} {:source_elem_width 32} {:source_dimensions "128"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

function {:bvbuiltin "bvurem"} BV32_UREM(bv32, bv32) : bv32;

function {:bvbuiltin "zero_extend 24"} BV8_ZEXT32(bv8) : bv32;

procedure {:source_name "shfl_intimage_rows"} {:kernel} $_Z18shfl_intimage_rowsP5uint4S0_();
  requires !_READ_HAS_OCCURRED_$$img && !_WRITE_HAS_OCCURRED_$$img && !_ATOMIC_HAS_OCCURRED_$$img;
  requires !_READ_HAS_OCCURRED_$$integral_image && !_WRITE_HAS_OCCURRED_$$integral_image && !_ATOMIC_HAS_OCCURRED_$$integral_image;
  requires !_READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums && !_WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums && !_ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums;
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
  modifies $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums, _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums, _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums, _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums, $$integral_image, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums, _TRACKING, _WRITE_HAS_OCCURRED_$$integral_image, _WRITE_READ_BENIGN_FLAG_$$integral_image, _WRITE_READ_BENIGN_FLAG_$$integral_image;



implementation {:source_name "shfl_intimage_rows"} {:kernel} $_Z18shfl_intimage_rowsP5uint4S0_()
{
  var $i.0: bv32;
  var $i1.0: bv32;
  var $i2.0: bv32;
  var $sum.0$1: bv32;
  var $sum.0$2: bv32;
  var $i3.0: bv32;
  var $sum.1$1: bv32;
  var $sum.1$2: bv32;
  var $i4.0$1: bv32;
  var $i4.0$2: bv32;
  var $warp_sum.0$1: bv32;
  var $warp_sum.0$2: bv32;
  var $i5.0$1: bv32;
  var $i5.0$2: bv32;
  var $warp_sum.1$1: bv32;
  var $warp_sum.1$2: bv32;
  var $i7.0$1: bv32;
  var $i7.0$2: bv32;
  var $i8.0: bv32;
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
  var v7$1: bv8;
  var v7$2: bv8;
  var v8$1: bv8;
  var v8$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
  var v16$1: bv32;
  var v16$2: bv32;
  var v41$1: bv8;
  var v41$2: bv8;
  var v17$1: bv8;
  var v17$2: bv8;
  var v18$1: bv8;
  var v18$2: bv8;
  var v19$1: bv8;
  var v19$2: bv8;
  var v20$1: bv8;
  var v20$2: bv8;
  var v21$1: bv32;
  var v21$2: bv32;
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
  var v66: bool;
  var v67$1: bv32;
  var v67$2: bv32;
  var v68$1: bv32;
  var v68$2: bv32;
  var v69: bool;
  var v70$1: bv32;
  var v70$2: bv32;
  var v71$1: bv32;
  var v71$2: bv32;
  var v72: bool;
  var v73$1: bv32;
  var v73$2: bv32;
  var v74$1: bv32;
  var v74$2: bv32;
  var v75$1: bv32;
  var v75$2: bv32;
  var v76: bool;
  var v78$1: bool;
  var v78$2: bool;
  var v77$1: bv32;
  var v77$2: bv32;
  var v79$1: bool;
  var v79$2: bool;
  var v80$1: bv32;
  var v80$2: bv32;
  var v81$1: bool;
  var v81$2: bool;
  var v82$1: bv32;
  var v82$2: bv32;
  var v83$1: bool;
  var v83$2: bool;
  var v84$1: bv32;
  var v84$2: bv32;
  var v85$1: bool;
  var v85$2: bool;
  var v86$1: bv32;
  var v86$2: bv32;
  var v87$1: bool;
  var v87$2: bool;
  var v88$1: bool;
  var v88$2: bool;
  var v89$1: bv32;
  var v89$2: bv32;
  var v90$1: bool;
  var v90$2: bool;
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
  var v116$1: bool;
  var v116$2: bool;
  var v117$1: bv32;
  var v117$2: bv32;
  var v118$1: bv32;
  var v118$2: bv32;
  var v119$1: bv32;
  var v119$2: bv32;
  var v120$1: bv32;
  var v120$2: bv32;
  var v127$1: bv32;
  var v127$2: bv32;
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
  var v128$1: bv32;
  var v128$2: bv32;
  var v129$1: bool;
  var v129$2: bool;
  var v130$1: bv32;
  var v130$2: bv32;
  var v131$1: bv32;
  var v131$2: bv32;
  var v132$1: bv32;
  var v132$2: bv32;
  var v133$1: bv32;
  var v133$2: bv32;
  var v140$1: bv32;
  var v140$2: bv32;
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
  var v141$1: bv32;
  var v141$2: bv32;
  var v142$1: bool;
  var v142$2: bool;
  var v143$1: bv32;
  var v143$2: bv32;
  var v144$1: bv32;
  var v144$2: bv32;
  var v145$1: bv32;
  var v145$2: bv32;
  var v146$1: bv32;
  var v146$2: bv32;
  var v153$1: bv32;
  var v153$2: bv32;
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
  var v154$1: bv32;
  var v154$2: bv32;
  var v155$1: bool;
  var v155$2: bool;
  var v156$1: bv32;
  var v156$2: bv32;
  var v157$1: bv32;
  var v157$2: bv32;
  var v158$1: bv32;
  var v158$2: bv32;
  var v159$1: bv32;
  var v159$2: bv32;
  var v166$1: bv32;
  var v166$2: bv32;
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
  var v172$1: bool;
  var v172$2: bool;
  var v173$1: bv32;
  var v173$2: bv32;
  var v174$1: bv32;
  var v174$2: bv32;
  var v175$1: bv32;
  var v175$2: bv32;
  var v176$1: bv32;
  var v176$2: bv32;
  var v183$1: bv32;
  var v183$2: bv32;
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
  var v184$1: bv32;
  var v184$2: bv32;
  var v185$1: bool;
  var v185$2: bool;
  var v186$1: bv32;
  var v186$2: bv32;
  var v187$1: bv32;
  var v187$2: bv32;
  var v188$1: bv32;
  var v188$2: bv32;
  var v189$1: bv32;
  var v189$2: bv32;
  var v196$1: bv32;
  var v196$2: bv32;
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
  var v197$1: bv32;
  var v197$2: bv32;
  var v198$1: bool;
  var v198$2: bool;
  var v199$1: bv32;
  var v199$2: bv32;
  var v200$1: bv32;
  var v200$2: bv32;
  var v201$1: bv32;
  var v201$2: bv32;
  var v202$1: bv32;
  var v202$2: bv32;
  var v209$1: bv32;
  var v209$2: bv32;
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
  var v210$1: bv32;
  var v210$2: bv32;
  var v211$1: bool;
  var v211$2: bool;
  var v212$1: bv32;
  var v212$2: bv32;
  var v213$1: bv32;
  var v213$2: bv32;
  var v214$1: bv32;
  var v214$2: bv32;
  var v215$1: bv32;
  var v215$2: bv32;
  var v222$1: bv32;
  var v222$2: bv32;
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
  var v223$1: bv32;
  var v223$2: bv32;
  var v226$1: bv32;
  var v226$2: bv32;
  var v224$1: bv32;
  var v224$2: bv32;
  var v225$1: bv32;
  var v225$2: bv32;
  var v227$1: bv32;
  var v227$2: bv32;
  var v228: bool;
  var v229$1: bv32;
  var v229$2: bv32;
  var v230$1: bv32;
  var v230$2: bv32;
  var v231$1: bool;
  var v231$2: bool;
  var v232$1: bv32;
  var v232$2: bv32;
  var v233$1: bv32;
  var v233$2: bv32;
  var v234$1: bv32;
  var v234$2: bv32;
  var v235$1: bv32;
  var v235$2: bv32;
  var v242$1: bv32;
  var v242$2: bv32;
  var v236$1: bv32;
  var v236$2: bv32;
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
  var v243$1: bv32;
  var v243$2: bv32;
  var v244$1: bool;
  var v244$2: bool;
  var v245$1: bv32;
  var v245$2: bv32;
  var v246$1: bv32;
  var v246$2: bv32;
  var v247$1: bv32;
  var v247$2: bv32;
  var v248$1: bv32;
  var v248$2: bv32;
  var v255$1: bv32;
  var v255$2: bv32;
  var v249$1: bv32;
  var v249$2: bv32;
  var v250$1: bv32;
  var v250$2: bv32;
  var v251$1: bv32;
  var v251$2: bv32;
  var v252$1: bv32;
  var v252$2: bv32;
  var v253$1: bv32;
  var v253$2: bv32;
  var v254$1: bv32;
  var v254$2: bv32;
  var v256$1: bv32;
  var v256$2: bv32;
  var v257$1: bool;
  var v257$2: bool;
  var v258$1: bv32;
  var v258$2: bv32;
  var v259$1: bv32;
  var v259$2: bv32;
  var v260$1: bv32;
  var v260$2: bv32;
  var v261$1: bv32;
  var v261$2: bv32;
  var v268$1: bv32;
  var v268$2: bv32;
  var v262$1: bv32;
  var v262$2: bv32;
  var v263$1: bv32;
  var v263$2: bv32;
  var v264$1: bv32;
  var v264$2: bv32;
  var v265$1: bv32;
  var v265$2: bv32;
  var v266$1: bv32;
  var v266$2: bv32;
  var v267$1: bv32;
  var v267$2: bv32;
  var v269$1: bv32;
  var v269$2: bv32;
  var v270$1: bool;
  var v270$2: bool;
  var v271$1: bv32;
  var v271$2: bv32;
  var v272$1: bv32;
  var v272$2: bv32;
  var v273$1: bv32;
  var v273$2: bv32;
  var v274$1: bv32;
  var v274$2: bv32;
  var v281$1: bv32;
  var v281$2: bv32;
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
  var v287$1: bool;
  var v287$2: bool;
  var v288$1: bv32;
  var v288$2: bv32;
  var v289$1: bv32;
  var v289$2: bv32;
  var v290$1: bv32;
  var v290$2: bv32;
  var v291$1: bv32;
  var v291$2: bv32;
  var v298$1: bv32;
  var v298$2: bv32;
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
  var v299$1: bv32;
  var v299$2: bv32;
  var v300$1: bool;
  var v300$2: bool;
  var v301$1: bv32;
  var v301$2: bv32;
  var v302$1: bv32;
  var v302$2: bv32;
  var v303$1: bv32;
  var v303$2: bv32;
  var v304$1: bv32;
  var v304$2: bv32;
  var v311$1: bv32;
  var v311$2: bv32;
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
  var v312$1: bv32;
  var v312$2: bv32;
  var v313$1: bool;
  var v313$2: bool;
  var v314$1: bv32;
  var v314$2: bv32;
  var v315$1: bv32;
  var v315$2: bv32;
  var v316$1: bv32;
  var v316$2: bv32;
  var v317$1: bv32;
  var v317$2: bv32;
  var v324$1: bv32;
  var v324$2: bv32;
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
  var v325$1: bv32;
  var v325$2: bv32;
  var v326$1: bool;
  var v326$2: bool;
  var v327$1: bv32;
  var v327$2: bv32;
  var v328$1: bv32;
  var v328$2: bv32;
  var v329$1: bv32;
  var v329$2: bv32;
  var v330$1: bv32;
  var v330$2: bv32;
  var v337$1: bv32;
  var v337$2: bv32;
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
  var p38$1: bool;
  var p38$2: bool;
  var p39$1: bool;
  var p39$2: bool;
  var p40$1: bool;
  var p40$2: bool;
  var p41$1: bool;
  var p41$2: bool;
  var p42$1: bool;
  var p42$2: bool;
  var p43$1: bool;
  var p43$2: bool;
  var p44$1: bool;
  var p44$2: bool;
  var p45$1: bool;
  var p45$2: bool;
  var p46$1: bool;
  var p46$2: bool;
  var p47$1: bool;
  var p47$2: bool;


  $0:
    havoc v0$1, v0$2;
    $$data$0bv32$1 := v0$1;
    $$data$0bv32$2 := v0$2;
    havoc v1$1, v1$2;
    $$data$1bv32$1 := v1$1;
    $$data$1bv32$2 := v1$2;
    havoc v2$1, v2$2;
    $$data$2bv32$1 := v2$1;
    $$data$2bv32$2 := v2$2;
    havoc v3$1, v3$2;
    $$data$3bv32$1 := v3$1;
    $$data$3bv32$2 := v3$2;
    v4$1 := BV32_SREM(local_id_x$1, 32bv32);
    v4$2 := BV32_SREM(local_id_x$2, 32bv32);
    v5$1 := BV32_UDIV(local_id_x$1, 32bv32);
    v5$2 := BV32_UDIV(local_id_x$2, 32bv32);
    v6$1 := $$data$0bv32$1;
    v6$2 := $$data$0bv32$2;
    $$19$0bv32$1 := BV32_AND(v6$1, 255bv32)[8:0];
    $$19$0bv32$2 := BV32_AND(v6$2, 255bv32)[8:0];
    $$19$1bv32$1 := BV32_LSHR(BV32_AND(v6$1, 65280bv32), 8bv32)[8:0];
    $$19$1bv32$2 := BV32_LSHR(BV32_AND(v6$2, 65280bv32), 8bv32)[8:0];
    $$19$2bv32$1 := BV32_LSHR(BV32_AND(v6$1, 16711680bv32), 16bv32)[8:0];
    $$19$2bv32$2 := BV32_LSHR(BV32_AND(v6$2, 16711680bv32), 16bv32)[8:0];
    $$19$3bv32$1 := BV32_LSHR(BV32_AND(v6$1, 4278190080bv32), 24bv32)[8:0];
    $$19$3bv32$2 := BV32_LSHR(BV32_AND(v6$2, 4278190080bv32), 24bv32)[8:0];
    v7$1 := $$19$0bv32$1;
    v7$2 := $$19$0bv32$2;
    v8$1 := $$19$1bv32$1;
    v8$2 := $$19$1bv32$2;
    v9$1 := $$19$2bv32$1;
    v9$2 := $$19$2bv32$2;
    v10$1 := $$19$3bv32$1;
    v10$2 := $$19$3bv32$2;
    $$a$0bv32$1 := v7$1;
    $$a$0bv32$2 := v7$2;
    $$a$1bv32$1 := v8$1;
    $$a$1bv32$2 := v8$2;
    $$a$2bv32$1 := v9$1;
    $$a$2bv32$2 := v9$2;
    $$a$3bv32$1 := v10$1;
    $$a$3bv32$2 := v10$2;
    v11$1 := $$data$1bv32$1;
    v11$2 := $$data$1bv32$2;
    $$0$0bv32$1 := BV32_AND(v11$1, 255bv32)[8:0];
    $$0$0bv32$2 := BV32_AND(v11$2, 255bv32)[8:0];
    $$0$1bv32$1 := BV32_LSHR(BV32_AND(v11$1, 65280bv32), 8bv32)[8:0];
    $$0$1bv32$2 := BV32_LSHR(BV32_AND(v11$2, 65280bv32), 8bv32)[8:0];
    $$0$2bv32$1 := BV32_LSHR(BV32_AND(v11$1, 16711680bv32), 16bv32)[8:0];
    $$0$2bv32$2 := BV32_LSHR(BV32_AND(v11$2, 16711680bv32), 16bv32)[8:0];
    $$0$3bv32$1 := BV32_LSHR(BV32_AND(v11$1, 4278190080bv32), 24bv32)[8:0];
    $$0$3bv32$2 := BV32_LSHR(BV32_AND(v11$2, 4278190080bv32), 24bv32)[8:0];
    v12$1 := $$0$0bv32$1;
    v12$2 := $$0$0bv32$2;
    v13$1 := $$0$1bv32$1;
    v13$2 := $$0$1bv32$2;
    v14$1 := $$0$2bv32$1;
    v14$2 := $$0$2bv32$2;
    v15$1 := $$0$3bv32$1;
    v15$2 := $$0$3bv32$2;
    $$b$0bv32$1 := v12$1;
    $$b$0bv32$2 := v12$2;
    $$b$1bv32$1 := v13$1;
    $$b$1bv32$2 := v13$2;
    $$b$2bv32$1 := v14$1;
    $$b$2bv32$2 := v14$2;
    $$b$3bv32$1 := v15$1;
    $$b$3bv32$2 := v15$2;
    v16$1 := $$data$2bv32$1;
    v16$2 := $$data$2bv32$2;
    $$1$0bv32$1 := BV32_AND(v16$1, 255bv32)[8:0];
    $$1$0bv32$2 := BV32_AND(v16$2, 255bv32)[8:0];
    $$1$1bv32$1 := BV32_LSHR(BV32_AND(v16$1, 65280bv32), 8bv32)[8:0];
    $$1$1bv32$2 := BV32_LSHR(BV32_AND(v16$2, 65280bv32), 8bv32)[8:0];
    $$1$2bv32$1 := BV32_LSHR(BV32_AND(v16$1, 16711680bv32), 16bv32)[8:0];
    $$1$2bv32$2 := BV32_LSHR(BV32_AND(v16$2, 16711680bv32), 16bv32)[8:0];
    $$1$3bv32$1 := BV32_LSHR(BV32_AND(v16$1, 4278190080bv32), 24bv32)[8:0];
    $$1$3bv32$2 := BV32_LSHR(BV32_AND(v16$2, 4278190080bv32), 24bv32)[8:0];
    v17$1 := $$1$0bv32$1;
    v17$2 := $$1$0bv32$2;
    v18$1 := $$1$1bv32$1;
    v18$2 := $$1$1bv32$2;
    v19$1 := $$1$2bv32$1;
    v19$2 := $$1$2bv32$2;
    v20$1 := $$1$3bv32$1;
    v20$2 := $$1$3bv32$2;
    $$c$0bv32$1 := v17$1;
    $$c$0bv32$2 := v17$2;
    $$c$1bv32$1 := v18$1;
    $$c$1bv32$2 := v18$2;
    $$c$2bv32$1 := v19$1;
    $$c$2bv32$2 := v19$2;
    $$c$3bv32$1 := v20$1;
    $$c$3bv32$2 := v20$2;
    v21$1 := $$data$3bv32$1;
    v21$2 := $$data$3bv32$2;
    $$2$0bv32$1 := BV32_AND(v21$1, 255bv32)[8:0];
    $$2$0bv32$2 := BV32_AND(v21$2, 255bv32)[8:0];
    $$2$1bv32$1 := BV32_LSHR(BV32_AND(v21$1, 65280bv32), 8bv32)[8:0];
    $$2$1bv32$2 := BV32_LSHR(BV32_AND(v21$2, 65280bv32), 8bv32)[8:0];
    $$2$2bv32$1 := BV32_LSHR(BV32_AND(v21$1, 16711680bv32), 16bv32)[8:0];
    $$2$2bv32$2 := BV32_LSHR(BV32_AND(v21$2, 16711680bv32), 16bv32)[8:0];
    $$2$3bv32$1 := BV32_LSHR(BV32_AND(v21$1, 4278190080bv32), 24bv32)[8:0];
    $$2$3bv32$2 := BV32_LSHR(BV32_AND(v21$2, 4278190080bv32), 24bv32)[8:0];
    v22$1 := $$2$0bv32$1;
    v22$2 := $$2$0bv32$2;
    v23$1 := $$2$1bv32$1;
    v23$2 := $$2$1bv32$2;
    v24$1 := $$2$2bv32$1;
    v24$2 := $$2$2bv32$2;
    v25$1 := $$2$3bv32$1;
    v25$2 := $$2$3bv32$2;
    $$d$0bv32$1 := v22$1;
    $$d$0bv32$2 := v22$2;
    $$d$1bv32$1 := v23$1;
    $$d$1bv32$2 := v23$2;
    $$d$2bv32$1 := v24$1;
    $$d$2bv32$2 := v24$2;
    $$d$3bv32$1 := v25$1;
    $$d$3bv32$2 := v25$2;
    v26$1 := $$a$0bv32$1;
    v26$2 := $$a$0bv32$2;
    $$result$1[0bv32] := BV8_ZEXT32(v26$1);
    $$result$2[0bv32] := BV8_ZEXT32(v26$2);
    v27$1 := $$a$0bv32$1;
    v27$2 := $$a$0bv32$2;
    v28$1 := $$a$1bv32$1;
    v28$2 := $$a$1bv32$2;
    $$result$1[1bv32] := BV32_ADD(BV8_ZEXT32(v27$1), BV8_ZEXT32(v28$1));
    $$result$2[1bv32] := BV32_ADD(BV8_ZEXT32(v27$2), BV8_ZEXT32(v28$2));
    v29$1 := $$a$0bv32$1;
    v29$2 := $$a$0bv32$2;
    v30$1 := $$a$1bv32$1;
    v30$2 := $$a$1bv32$2;
    v31$1 := $$a$2bv32$1;
    v31$2 := $$a$2bv32$2;
    $$result$1[2bv32] := BV32_ADD(BV32_ADD(BV8_ZEXT32(v29$1), BV8_ZEXT32(v30$1)), BV8_ZEXT32(v31$1));
    $$result$2[2bv32] := BV32_ADD(BV32_ADD(BV8_ZEXT32(v29$2), BV8_ZEXT32(v30$2)), BV8_ZEXT32(v31$2));
    v32$1 := $$a$0bv32$1;
    v32$2 := $$a$0bv32$2;
    v33$1 := $$a$1bv32$1;
    v33$2 := $$a$1bv32$2;
    v34$1 := $$a$2bv32$1;
    v34$2 := $$a$2bv32$2;
    v35$1 := $$a$3bv32$1;
    v35$2 := $$a$3bv32$2;
    $$result$1[3bv32] := BV32_ADD(BV32_ADD(BV32_ADD(BV8_ZEXT32(v32$1), BV8_ZEXT32(v33$1)), BV8_ZEXT32(v34$1)), BV8_ZEXT32(v35$1));
    $$result$2[3bv32] := BV32_ADD(BV32_ADD(BV32_ADD(BV8_ZEXT32(v32$2), BV8_ZEXT32(v33$2)), BV8_ZEXT32(v34$2)), BV8_ZEXT32(v35$2));
    v36$1 := $$b$0bv32$1;
    v36$2 := $$b$0bv32$2;
    $$result$1[4bv32] := BV8_ZEXT32(v36$1);
    $$result$2[4bv32] := BV8_ZEXT32(v36$2);
    v37$1 := $$b$0bv32$1;
    v37$2 := $$b$0bv32$2;
    v38$1 := $$b$1bv32$1;
    v38$2 := $$b$1bv32$2;
    $$result$1[5bv32] := BV32_ADD(BV8_ZEXT32(v37$1), BV8_ZEXT32(v38$1));
    $$result$2[5bv32] := BV32_ADD(BV8_ZEXT32(v37$2), BV8_ZEXT32(v38$2));
    v39$1 := $$b$0bv32$1;
    v39$2 := $$b$0bv32$2;
    v40$1 := $$b$1bv32$1;
    v40$2 := $$b$1bv32$2;
    v41$1 := $$b$2bv32$1;
    v41$2 := $$b$2bv32$2;
    $$result$1[6bv32] := BV32_ADD(BV32_ADD(BV8_ZEXT32(v39$1), BV8_ZEXT32(v40$1)), BV8_ZEXT32(v41$1));
    $$result$2[6bv32] := BV32_ADD(BV32_ADD(BV8_ZEXT32(v39$2), BV8_ZEXT32(v40$2)), BV8_ZEXT32(v41$2));
    v42$1 := $$b$0bv32$1;
    v42$2 := $$b$0bv32$2;
    v43$1 := $$b$1bv32$1;
    v43$2 := $$b$1bv32$2;
    v44$1 := $$b$2bv32$1;
    v44$2 := $$b$2bv32$2;
    v45$1 := $$b$3bv32$1;
    v45$2 := $$b$3bv32$2;
    $$result$1[7bv32] := BV32_ADD(BV32_ADD(BV32_ADD(BV8_ZEXT32(v42$1), BV8_ZEXT32(v43$1)), BV8_ZEXT32(v44$1)), BV8_ZEXT32(v45$1));
    $$result$2[7bv32] := BV32_ADD(BV32_ADD(BV32_ADD(BV8_ZEXT32(v42$2), BV8_ZEXT32(v43$2)), BV8_ZEXT32(v44$2)), BV8_ZEXT32(v45$2));
    v46$1 := $$c$0bv32$1;
    v46$2 := $$c$0bv32$2;
    $$result$1[8bv32] := BV8_ZEXT32(v46$1);
    $$result$2[8bv32] := BV8_ZEXT32(v46$2);
    v47$1 := $$c$0bv32$1;
    v47$2 := $$c$0bv32$2;
    v48$1 := $$c$1bv32$1;
    v48$2 := $$c$1bv32$2;
    $$result$1[9bv32] := BV32_ADD(BV8_ZEXT32(v47$1), BV8_ZEXT32(v48$1));
    $$result$2[9bv32] := BV32_ADD(BV8_ZEXT32(v47$2), BV8_ZEXT32(v48$2));
    v49$1 := $$c$0bv32$1;
    v49$2 := $$c$0bv32$2;
    v50$1 := $$c$1bv32$1;
    v50$2 := $$c$1bv32$2;
    v51$1 := $$c$2bv32$1;
    v51$2 := $$c$2bv32$2;
    $$result$1[10bv32] := BV32_ADD(BV32_ADD(BV8_ZEXT32(v49$1), BV8_ZEXT32(v50$1)), BV8_ZEXT32(v51$1));
    $$result$2[10bv32] := BV32_ADD(BV32_ADD(BV8_ZEXT32(v49$2), BV8_ZEXT32(v50$2)), BV8_ZEXT32(v51$2));
    v52$1 := $$c$0bv32$1;
    v52$2 := $$c$0bv32$2;
    v53$1 := $$c$1bv32$1;
    v53$2 := $$c$1bv32$2;
    v54$1 := $$c$2bv32$1;
    v54$2 := $$c$2bv32$2;
    v55$1 := $$c$3bv32$1;
    v55$2 := $$c$3bv32$2;
    $$result$1[11bv32] := BV32_ADD(BV32_ADD(BV32_ADD(BV8_ZEXT32(v52$1), BV8_ZEXT32(v53$1)), BV8_ZEXT32(v54$1)), BV8_ZEXT32(v55$1));
    $$result$2[11bv32] := BV32_ADD(BV32_ADD(BV32_ADD(BV8_ZEXT32(v52$2), BV8_ZEXT32(v53$2)), BV8_ZEXT32(v54$2)), BV8_ZEXT32(v55$2));
    v56$1 := $$d$0bv32$1;
    v56$2 := $$d$0bv32$2;
    $$result$1[12bv32] := BV8_ZEXT32(v56$1);
    $$result$2[12bv32] := BV8_ZEXT32(v56$2);
    v57$1 := $$d$0bv32$1;
    v57$2 := $$d$0bv32$2;
    v58$1 := $$d$1bv32$1;
    v58$2 := $$d$1bv32$2;
    $$result$1[13bv32] := BV32_ADD(BV8_ZEXT32(v57$1), BV8_ZEXT32(v58$1));
    $$result$2[13bv32] := BV32_ADD(BV8_ZEXT32(v57$2), BV8_ZEXT32(v58$2));
    v59$1 := $$d$0bv32$1;
    v59$2 := $$d$0bv32$2;
    v60$1 := $$d$1bv32$1;
    v60$2 := $$d$1bv32$2;
    v61$1 := $$d$2bv32$1;
    v61$2 := $$d$2bv32$2;
    $$result$1[14bv32] := BV32_ADD(BV32_ADD(BV8_ZEXT32(v59$1), BV8_ZEXT32(v60$1)), BV8_ZEXT32(v61$1));
    $$result$2[14bv32] := BV32_ADD(BV32_ADD(BV8_ZEXT32(v59$2), BV8_ZEXT32(v60$2)), BV8_ZEXT32(v61$2));
    v62$1 := $$d$0bv32$1;
    v62$2 := $$d$0bv32$2;
    v63$1 := $$d$1bv32$1;
    v63$2 := $$d$1bv32$2;
    v64$1 := $$d$2bv32$1;
    v64$2 := $$d$2bv32$2;
    v65$1 := $$d$3bv32$1;
    v65$2 := $$d$3bv32$2;
    $$result$1[15bv32] := BV32_ADD(BV32_ADD(BV32_ADD(BV8_ZEXT32(v62$1), BV8_ZEXT32(v63$1)), BV8_ZEXT32(v64$1)), BV8_ZEXT32(v65$1));
    $$result$2[15bv32] := BV32_ADD(BV32_ADD(BV32_ADD(BV8_ZEXT32(v62$2), BV8_ZEXT32(v63$2)), BV8_ZEXT32(v64$2)), BV8_ZEXT32(v65$2));
    $i.0 := 4bv32;
    p7$1 := false;
    p7$2 := false;
    p13$1 := false;
    p13$2 := false;
    assume {:captureState "loop_entry_state_7_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_7"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 117} true;
    v66 := BV32_SLE($i.0, 7bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v66 && !v66;
    $i1.0 := 8bv32;
    assume {:captureState "loop_entry_state_6_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_6"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 124} true;
    v69 := BV32_SLE($i1.0, 11bv32);
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v69 && !v69;
    $i2.0 := 12bv32;
    assume {:captureState "loop_entry_state_5_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_5"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 131} true;
    v72 := BV32_SLE($i2.0, 15bv32);
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v72 && !v72;
    v75$1 := $$result$1[15bv32];
    v75$2 := $$result$2[15bv32];
    $sum.0$1, $i3.0 := v75$1, 1bv32;
    $sum.0$2 := v75$2;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $13;

  $13:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 139} true;
    v76 := BV32_SLT($i3.0, 32bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p11$1 := false;
    p11$2 := false;
    p12$1 := false;
    p12$2 := false;
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
    p29$1 := false;
    p29$2 := false;
    p30$1 := false;
    p30$2 := false;
    p31$1 := false;
    p31$2 := false;
    goto $truebb2, __partitioned_block_$falsebb2_0;

  __partitioned_block_$falsebb2_0:
    assume {:partition} !v76 && !v76;
    v81$1 := BV32_UREM(local_id_x$1, 32bv32) == 31bv32;
    v81$2 := BV32_UREM(local_id_x$2, 32bv32) == 31bv32;
    p4$1 := (if v81$1 then v81$1 else p4$1);
    p4$2 := (if v81$2 then v81$2 else p4$2);
    v82$1 := (if p4$1 then $$result$1[15bv32] else v82$1);
    v82$2 := (if p4$2 then $$result$2[15bv32] else v82$2);
    call {:sourceloc} {:sourceloc_num 154} _LOG_WRITE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(p4$1, v5$1, v82$1, $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[1bv1][v5$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(p4$2, v5$2);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 154} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 154} _CHECK_WRITE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(p4$2, v5$2, v82$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums"} true;
    $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[1bv1][v5$1] := (if p4$1 then v82$1 else $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[1bv1][v5$1]);
    $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2] := (if p4$2 then v82$2 else $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2]);
    goto __partitioned_block_$falsebb2_1;

  __partitioned_block_$falsebb2_1:
    call {:sourceloc_num 156} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    v83$1 := v5$1 == 0bv32;
    v83$2 := v5$2 == 0bv32;
    p6$1 := (if v83$1 then v83$1 else p6$1);
    p6$2 := (if v83$2 then v83$2 else p6$2);
    call {:sourceloc} {:sourceloc_num 158} _LOG_READ_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(p6$1, v4$1, $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[1bv1][v4$1]);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 158} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 158} _CHECK_READ_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(p6$2, v4$2, $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums"} true;
    v84$1 := (if p6$1 then $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[1bv1][v4$1] else v84$1);
    v84$2 := (if p6$2 then $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2] else v84$2);
    $warp_sum.0$1, $i5.0$1 := (if p6$1 then v84$1 else $warp_sum.0$1), (if p6$1 then 1bv32 else $i5.0$1);
    $warp_sum.0$2, $i5.0$2 := (if p6$2 then v84$2 else $warp_sum.0$2), (if p6$2 then 1bv32 else $i5.0$2);
    p7$1 := (if p6$1 then true else p7$1);
    p7$2 := (if p6$2 then true else p7$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $26;

  $26:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 159} p7$1 ==> true;
    v85$1 := (if p7$1 then BV32_SLE($i5.0$1, 32bv32) else v85$1);
    v85$2 := (if p7$2 then BV32_SLE($i5.0$2, 32bv32) else v85$2);
    p8$1 := false;
    p8$2 := false;
    p9$1 := false;
    p9$2 := false;
    p10$1 := false;
    p10$2 := false;
    p8$1 := (if p7$1 && v85$1 then v85$1 else p8$1);
    p8$2 := (if p7$2 && v85$2 then v85$2 else p8$2);
    p7$1 := (if p7$1 && !v85$1 then v85$1 else p7$1);
    p7$2 := (if p7$2 && !v85$2 then v85$2 else p7$2);
    call {:sourceloc_num 161} v86$1, v86$2 := $_Z9__shfl_upiii(32bv32, p8$1, $warp_sum.0$1, $i5.0$1, p8$2, $warp_sum.0$2, $i5.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z9__shfl_upiii"} true;
    v87$1 := (if p8$1 then BV32_UGE(v4$1, $i5.0$1) else v87$1);
    v87$2 := (if p8$2 then BV32_UGE(v4$2, $i5.0$2) else v87$2);
    p10$1 := (if p8$1 && v87$1 then v87$1 else p10$1);
    p10$2 := (if p8$2 && v87$2 then v87$2 else p10$2);
    p9$1 := (if p8$1 && !v87$1 then !v87$1 else p9$1);
    p9$2 := (if p8$2 && !v87$2 then !v87$2 else p9$2);
    $warp_sum.1$1 := (if p9$1 then $warp_sum.0$1 else $warp_sum.1$1);
    $warp_sum.1$2 := (if p9$2 then $warp_sum.0$2 else $warp_sum.1$2);
    $warp_sum.1$1 := (if p10$1 then BV32_ADD($warp_sum.0$1, v86$1) else $warp_sum.1$1);
    $warp_sum.1$2 := (if p10$2 then BV32_ADD($warp_sum.0$2, v86$2) else $warp_sum.1$2);
    $warp_sum.0$1, $i5.0$1 := (if p8$1 then $warp_sum.1$1 else $warp_sum.0$1), (if p8$1 then BV32_MUL($i5.0$1, 2bv32) else $i5.0$1);
    $warp_sum.0$2, $i5.0$2 := (if p8$2 then $warp_sum.1$2 else $warp_sum.0$2), (if p8$2 then BV32_MUL($i5.0$2, 2bv32) else $i5.0$2);
    p7$1 := (if p8$1 then true else p7$1);
    p7$2 := (if p8$2 then true else p7$2);
    goto $26.backedge, __partitioned_block_$26.tail_0;

  __partitioned_block_$26.tail_0:
    assume !p7$1 && !p7$2;
    call {:sourceloc} {:sourceloc_num 166} _LOG_WRITE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(p6$1, v4$1, $warp_sum.0$1, $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[1bv1][v4$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(p6$2, v4$2);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 166} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 166} _CHECK_WRITE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(p6$2, v4$2, $warp_sum.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums"} true;
    $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[1bv1][v4$1] := (if p6$1 then $warp_sum.0$1 else $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[1bv1][v4$1]);
    $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2] := (if p6$2 then $warp_sum.0$2 else $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2]);
    goto __partitioned_block_$26.tail_1;

  __partitioned_block_$26.tail_1:
    call {:sourceloc_num 168} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    v88$1 := BV32_SGT(v5$1, 0bv32);
    v88$2 := BV32_SGT(v5$2, 0bv32);
    p12$1 := (if v88$1 then v88$1 else p12$1);
    p12$2 := (if v88$2 then v88$2 else p12$2);
    call {:sourceloc} {:sourceloc_num 170} _LOG_READ_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(p12$1, BV32_SUB(v5$1, 1bv32), $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[1bv1][BV32_SUB(v5$1, 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 170} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 170} _CHECK_READ_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(p12$2, BV32_SUB(v5$2, 1bv32), $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v5$2, 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums"} true;
    v89$1 := (if p12$1 then $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[1bv1][BV32_SUB(v5$1, 1bv32)] else v89$1);
    v89$2 := (if p12$2 then $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v5$2, 1bv32)] else v89$2);
    $i7.0$1 := (if p12$1 then 0bv32 else $i7.0$1);
    $i7.0$2 := (if p12$2 then 0bv32 else $i7.0$2);
    p13$1 := (if p12$1 then true else p13$1);
    p13$2 := (if p12$2 then true else p13$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $34;

  $34:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 171} p13$1 ==> true;
    v90$1 := (if p13$1 then BV32_SLT($i7.0$1, 16bv32) else v90$1);
    v90$2 := (if p13$2 then BV32_SLT($i7.0$2, 16bv32) else v90$2);
    p14$1 := false;
    p14$2 := false;
    p14$1 := (if p13$1 && v90$1 then v90$1 else p14$1);
    p14$2 := (if p13$2 && v90$2 then v90$2 else p14$2);
    p13$1 := (if p13$1 && !v90$1 then v90$1 else p13$1);
    p13$2 := (if p13$2 && !v90$2 then v90$2 else p13$2);
    v91$1 := (if p14$1 then $$result$1[$i7.0$1] else v91$1);
    v91$2 := (if p14$2 then $$result$2[$i7.0$2] else v91$2);
    $$result$1[$i7.0$1] := (if p14$1 then BV32_ADD(v91$1, v89$1) else $$result$1[$i7.0$1]);
    $$result$2[$i7.0$2] := (if p14$2 then BV32_ADD(v91$2, v89$2) else $$result$2[$i7.0$2]);
    $i7.0$1 := (if p14$1 then BV32_ADD($i7.0$1, 1bv32) else $i7.0$1);
    $i7.0$2 := (if p14$2 then BV32_ADD($i7.0$2, 1bv32) else $i7.0$2);
    p13$1 := (if p14$1 then true else p13$1);
    p13$2 := (if p14$2 then true else p13$2);
    goto $34.backedge, $34.tail;

  $34.tail:
    assume !p13$1 && !p13$2;
    v92$1 := $$result$1[4bv32];
    v92$2 := $$result$2[4bv32];
    call {:sourceloc_num 179} v93$1, v93$2 := $_Z10__shfl_xoriii(1bv32, 32bv32, v92$1, v92$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10__shfl_xoriii"} true;
    $$result$1[4bv32] := v93$1;
    $$result$2[4bv32] := v93$2;
    v94$1 := $$result$1[5bv32];
    v94$2 := $$result$2[5bv32];
    call {:sourceloc_num 182} v95$1, v95$2 := $_Z10__shfl_xoriii(1bv32, 32bv32, v94$1, v94$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10__shfl_xoriii"} true;
    $$result$1[5bv32] := v95$1;
    $$result$2[5bv32] := v95$2;
    v96$1 := $$result$1[6bv32];
    v96$2 := $$result$2[6bv32];
    call {:sourceloc_num 185} v97$1, v97$2 := $_Z10__shfl_xoriii(1bv32, 32bv32, v96$1, v96$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10__shfl_xoriii"} true;
    $$result$1[6bv32] := v97$1;
    $$result$2[6bv32] := v97$2;
    v98$1 := $$result$1[7bv32];
    v98$2 := $$result$2[7bv32];
    call {:sourceloc_num 188} v99$1, v99$2 := $_Z10__shfl_xoriii(1bv32, 32bv32, v98$1, v98$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10__shfl_xoriii"} true;
    $$result$1[7bv32] := v99$1;
    $$result$2[7bv32] := v99$2;
    v100$1 := $$result$1[8bv32];
    v100$2 := $$result$2[8bv32];
    call {:sourceloc_num 191} v101$1, v101$2 := $_Z10__shfl_xoriii(2bv32, 32bv32, v100$1, v100$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10__shfl_xoriii"} true;
    $$result$1[8bv32] := v101$1;
    $$result$2[8bv32] := v101$2;
    v102$1 := $$result$1[9bv32];
    v102$2 := $$result$2[9bv32];
    call {:sourceloc_num 194} v103$1, v103$2 := $_Z10__shfl_xoriii(2bv32, 32bv32, v102$1, v102$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10__shfl_xoriii"} true;
    $$result$1[9bv32] := v103$1;
    $$result$2[9bv32] := v103$2;
    v104$1 := $$result$1[10bv32];
    v104$2 := $$result$2[10bv32];
    call {:sourceloc_num 197} v105$1, v105$2 := $_Z10__shfl_xoriii(2bv32, 32bv32, v104$1, v104$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10__shfl_xoriii"} true;
    $$result$1[10bv32] := v105$1;
    $$result$2[10bv32] := v105$2;
    v106$1 := $$result$1[11bv32];
    v106$2 := $$result$2[11bv32];
    call {:sourceloc_num 200} v107$1, v107$2 := $_Z10__shfl_xoriii(2bv32, 32bv32, v106$1, v106$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10__shfl_xoriii"} true;
    $$result$1[11bv32] := v107$1;
    $$result$2[11bv32] := v107$2;
    v108$1 := $$result$1[12bv32];
    v108$2 := $$result$2[12bv32];
    call {:sourceloc_num 203} v109$1, v109$2 := $_Z10__shfl_xoriii(3bv32, 32bv32, v108$1, v108$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10__shfl_xoriii"} true;
    $$result$1[12bv32] := v109$1;
    $$result$2[12bv32] := v109$2;
    v110$1 := $$result$1[13bv32];
    v110$2 := $$result$2[13bv32];
    call {:sourceloc_num 206} v111$1, v111$2 := $_Z10__shfl_xoriii(3bv32, 32bv32, v110$1, v110$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10__shfl_xoriii"} true;
    $$result$1[13bv32] := v111$1;
    $$result$2[13bv32] := v111$2;
    v112$1 := $$result$1[14bv32];
    v112$2 := $$result$2[14bv32];
    call {:sourceloc_num 209} v113$1, v113$2 := $_Z10__shfl_xoriii(3bv32, 32bv32, v112$1, v112$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10__shfl_xoriii"} true;
    $$result$1[14bv32] := v113$1;
    $$result$2[14bv32] := v113$2;
    v114$1 := $$result$1[15bv32];
    v114$2 := $$result$2[15bv32];
    call {:sourceloc_num 212} v115$1, v115$2 := $_Z10__shfl_xoriii(3bv32, 32bv32, v114$1, v114$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10__shfl_xoriii"} true;
    $$result$1[15bv32] := v115$1;
    $$result$2[15bv32] := v115$2;
    v116$1 := BV32_UREM(local_id_x$1, 4bv32) == 0bv32;
    v116$2 := BV32_UREM(local_id_x$2, 4bv32) == 0bv32;
    p16$1 := (if v116$1 then v116$1 else p16$1);
    p16$2 := (if v116$2 then v116$2 else p16$2);
    v117$1 := (if p16$1 then $$result$1[0bv32] else v117$1);
    v117$2 := (if p16$2 then $$result$2[0bv32] else v117$2);
    v118$1 := (if p16$1 then $$result$1[1bv32] else v118$1);
    v118$2 := (if p16$2 then $$result$2[1bv32] else v118$2);
    v119$1 := (if p16$1 then $$result$1[2bv32] else v119$1);
    v119$2 := (if p16$2 then $$result$2[2bv32] else v119$2);
    v120$1 := (if p16$1 then $$result$1[3bv32] else v120$1);
    v120$2 := (if p16$2 then $$result$2[3bv32] else v120$2);
    $$3$0bv32$1 := (if p16$1 then v117$1 else $$3$0bv32$1);
    $$3$0bv32$2 := (if p16$2 then v117$2 else $$3$0bv32$2);
    $$3$1bv32$1 := (if p16$1 then v118$1 else $$3$1bv32$1);
    $$3$1bv32$2 := (if p16$2 then v118$2 else $$3$1bv32$2);
    $$3$2bv32$1 := (if p16$1 then v119$1 else $$3$2bv32$1);
    $$3$2bv32$2 := (if p16$2 then v119$2 else $$3$2bv32$2);
    $$3$3bv32$1 := (if p16$1 then v120$1 else $$3$3bv32$1);
    $$3$3bv32$2 := (if p16$2 then v120$2 else $$3$3bv32$2);
    v121$1 := (if p16$1 then $$3$0bv32$1 else v121$1);
    v121$2 := (if p16$2 then $$3$0bv32$2 else v121$2);
    v122$1 := (if p16$1 then $$3$1bv32$1 else v122$1);
    v122$2 := (if p16$2 then $$3$1bv32$2 else v122$2);
    v123$1 := (if p16$1 then $$3$2bv32$1 else v123$1);
    v123$2 := (if p16$2 then $$3$2bv32$2 else v123$2);
    v124$1 := (if p16$1 then $$3$3bv32$1 else v124$1);
    v124$2 := (if p16$2 then $$3$3bv32$2 else v124$2);
    $$20$0bv32$1 := (if p16$1 then v121$1 else $$20$0bv32$1);
    $$20$0bv32$2 := (if p16$2 then v121$2 else $$20$0bv32$2);
    $$20$1bv32$1 := (if p16$1 then v122$1 else $$20$1bv32$1);
    $$20$1bv32$2 := (if p16$2 then v122$2 else $$20$1bv32$2);
    $$20$2bv32$1 := (if p16$1 then v123$1 else $$20$2bv32$1);
    $$20$2bv32$2 := (if p16$2 then v123$2 else $$20$2bv32$2);
    $$20$3bv32$1 := (if p16$1 then v124$1 else $$20$3bv32$1);
    $$20$3bv32$2 := (if p16$2 then v124$2 else $$20$3bv32$2);
    v125$1 := (if p16$1 then $$20$0bv32$1 else v125$1);
    v125$2 := (if p16$2 then $$20$0bv32$2 else v125$2);
    $$output$0bv32$1 := (if p16$1 then v125$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p16$2 then v125$2 else $$output$0bv32$2);
    v126$1 := (if p16$1 then $$20$1bv32$1 else v126$1);
    v126$2 := (if p16$2 then $$20$1bv32$2 else v126$2);
    $$output$1bv32$1 := (if p16$1 then v126$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p16$2 then v126$2 else $$output$1bv32$2);
    v127$1 := (if p16$1 then $$20$2bv32$1 else v127$1);
    v127$2 := (if p16$2 then $$20$2bv32$2 else v127$2);
    $$output$2bv32$1 := (if p16$1 then v127$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p16$2 then v127$2 else $$output$2bv32$2);
    v128$1 := (if p16$1 then $$20$3bv32$1 else v128$1);
    v128$2 := (if p16$2 then $$20$3bv32$2 else v128$2);
    $$output$3bv32$1 := (if p16$1 then v128$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p16$2 then v128$2 else $$output$3bv32$2);
    v129$1 := BV32_UREM(local_id_x$1, 4bv32) == 1bv32;
    v129$2 := BV32_UREM(local_id_x$2, 4bv32) == 1bv32;
    p18$1 := (if v129$1 then v129$1 else p18$1);
    p18$2 := (if v129$2 then v129$2 else p18$2);
    v130$1 := (if p18$1 then $$result$1[4bv32] else v130$1);
    v130$2 := (if p18$2 then $$result$2[4bv32] else v130$2);
    v131$1 := (if p18$1 then $$result$1[5bv32] else v131$1);
    v131$2 := (if p18$2 then $$result$2[5bv32] else v131$2);
    v132$1 := (if p18$1 then $$result$1[6bv32] else v132$1);
    v132$2 := (if p18$2 then $$result$2[6bv32] else v132$2);
    v133$1 := (if p18$1 then $$result$1[7bv32] else v133$1);
    v133$2 := (if p18$2 then $$result$2[7bv32] else v133$2);
    $$4$0bv32$1 := (if p18$1 then v130$1 else $$4$0bv32$1);
    $$4$0bv32$2 := (if p18$2 then v130$2 else $$4$0bv32$2);
    $$4$1bv32$1 := (if p18$1 then v131$1 else $$4$1bv32$1);
    $$4$1bv32$2 := (if p18$2 then v131$2 else $$4$1bv32$2);
    $$4$2bv32$1 := (if p18$1 then v132$1 else $$4$2bv32$1);
    $$4$2bv32$2 := (if p18$2 then v132$2 else $$4$2bv32$2);
    $$4$3bv32$1 := (if p18$1 then v133$1 else $$4$3bv32$1);
    $$4$3bv32$2 := (if p18$2 then v133$2 else $$4$3bv32$2);
    v134$1 := (if p18$1 then $$4$0bv32$1 else v134$1);
    v134$2 := (if p18$2 then $$4$0bv32$2 else v134$2);
    v135$1 := (if p18$1 then $$4$1bv32$1 else v135$1);
    v135$2 := (if p18$2 then $$4$1bv32$2 else v135$2);
    v136$1 := (if p18$1 then $$4$2bv32$1 else v136$1);
    v136$2 := (if p18$2 then $$4$2bv32$2 else v136$2);
    v137$1 := (if p18$1 then $$4$3bv32$1 else v137$1);
    v137$2 := (if p18$2 then $$4$3bv32$2 else v137$2);
    $$21$0bv32$1 := (if p18$1 then v134$1 else $$21$0bv32$1);
    $$21$0bv32$2 := (if p18$2 then v134$2 else $$21$0bv32$2);
    $$21$1bv32$1 := (if p18$1 then v135$1 else $$21$1bv32$1);
    $$21$1bv32$2 := (if p18$2 then v135$2 else $$21$1bv32$2);
    $$21$2bv32$1 := (if p18$1 then v136$1 else $$21$2bv32$1);
    $$21$2bv32$2 := (if p18$2 then v136$2 else $$21$2bv32$2);
    $$21$3bv32$1 := (if p18$1 then v137$1 else $$21$3bv32$1);
    $$21$3bv32$2 := (if p18$2 then v137$2 else $$21$3bv32$2);
    v138$1 := (if p18$1 then $$21$0bv32$1 else v138$1);
    v138$2 := (if p18$2 then $$21$0bv32$2 else v138$2);
    $$output$0bv32$1 := (if p18$1 then v138$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p18$2 then v138$2 else $$output$0bv32$2);
    v139$1 := (if p18$1 then $$21$1bv32$1 else v139$1);
    v139$2 := (if p18$2 then $$21$1bv32$2 else v139$2);
    $$output$1bv32$1 := (if p18$1 then v139$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p18$2 then v139$2 else $$output$1bv32$2);
    v140$1 := (if p18$1 then $$21$2bv32$1 else v140$1);
    v140$2 := (if p18$2 then $$21$2bv32$2 else v140$2);
    $$output$2bv32$1 := (if p18$1 then v140$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p18$2 then v140$2 else $$output$2bv32$2);
    v141$1 := (if p18$1 then $$21$3bv32$1 else v141$1);
    v141$2 := (if p18$2 then $$21$3bv32$2 else v141$2);
    $$output$3bv32$1 := (if p18$1 then v141$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p18$2 then v141$2 else $$output$3bv32$2);
    v142$1 := BV32_UREM(local_id_x$1, 4bv32) == 2bv32;
    v142$2 := BV32_UREM(local_id_x$2, 4bv32) == 2bv32;
    p20$1 := (if v142$1 then v142$1 else p20$1);
    p20$2 := (if v142$2 then v142$2 else p20$2);
    v143$1 := (if p20$1 then $$result$1[8bv32] else v143$1);
    v143$2 := (if p20$2 then $$result$2[8bv32] else v143$2);
    v144$1 := (if p20$1 then $$result$1[9bv32] else v144$1);
    v144$2 := (if p20$2 then $$result$2[9bv32] else v144$2);
    v145$1 := (if p20$1 then $$result$1[10bv32] else v145$1);
    v145$2 := (if p20$2 then $$result$2[10bv32] else v145$2);
    v146$1 := (if p20$1 then $$result$1[11bv32] else v146$1);
    v146$2 := (if p20$2 then $$result$2[11bv32] else v146$2);
    $$5$0bv32$1 := (if p20$1 then v143$1 else $$5$0bv32$1);
    $$5$0bv32$2 := (if p20$2 then v143$2 else $$5$0bv32$2);
    $$5$1bv32$1 := (if p20$1 then v144$1 else $$5$1bv32$1);
    $$5$1bv32$2 := (if p20$2 then v144$2 else $$5$1bv32$2);
    $$5$2bv32$1 := (if p20$1 then v145$1 else $$5$2bv32$1);
    $$5$2bv32$2 := (if p20$2 then v145$2 else $$5$2bv32$2);
    $$5$3bv32$1 := (if p20$1 then v146$1 else $$5$3bv32$1);
    $$5$3bv32$2 := (if p20$2 then v146$2 else $$5$3bv32$2);
    v147$1 := (if p20$1 then $$5$0bv32$1 else v147$1);
    v147$2 := (if p20$2 then $$5$0bv32$2 else v147$2);
    v148$1 := (if p20$1 then $$5$1bv32$1 else v148$1);
    v148$2 := (if p20$2 then $$5$1bv32$2 else v148$2);
    v149$1 := (if p20$1 then $$5$2bv32$1 else v149$1);
    v149$2 := (if p20$2 then $$5$2bv32$2 else v149$2);
    v150$1 := (if p20$1 then $$5$3bv32$1 else v150$1);
    v150$2 := (if p20$2 then $$5$3bv32$2 else v150$2);
    $$22$0bv32$1 := (if p20$1 then v147$1 else $$22$0bv32$1);
    $$22$0bv32$2 := (if p20$2 then v147$2 else $$22$0bv32$2);
    $$22$1bv32$1 := (if p20$1 then v148$1 else $$22$1bv32$1);
    $$22$1bv32$2 := (if p20$2 then v148$2 else $$22$1bv32$2);
    $$22$2bv32$1 := (if p20$1 then v149$1 else $$22$2bv32$1);
    $$22$2bv32$2 := (if p20$2 then v149$2 else $$22$2bv32$2);
    $$22$3bv32$1 := (if p20$1 then v150$1 else $$22$3bv32$1);
    $$22$3bv32$2 := (if p20$2 then v150$2 else $$22$3bv32$2);
    v151$1 := (if p20$1 then $$22$0bv32$1 else v151$1);
    v151$2 := (if p20$2 then $$22$0bv32$2 else v151$2);
    $$output$0bv32$1 := (if p20$1 then v151$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p20$2 then v151$2 else $$output$0bv32$2);
    v152$1 := (if p20$1 then $$22$1bv32$1 else v152$1);
    v152$2 := (if p20$2 then $$22$1bv32$2 else v152$2);
    $$output$1bv32$1 := (if p20$1 then v152$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p20$2 then v152$2 else $$output$1bv32$2);
    v153$1 := (if p20$1 then $$22$2bv32$1 else v153$1);
    v153$2 := (if p20$2 then $$22$2bv32$2 else v153$2);
    $$output$2bv32$1 := (if p20$1 then v153$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p20$2 then v153$2 else $$output$2bv32$2);
    v154$1 := (if p20$1 then $$22$3bv32$1 else v154$1);
    v154$2 := (if p20$2 then $$22$3bv32$2 else v154$2);
    $$output$3bv32$1 := (if p20$1 then v154$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p20$2 then v154$2 else $$output$3bv32$2);
    v155$1 := BV32_UREM(local_id_x$1, 4bv32) == 3bv32;
    v155$2 := BV32_UREM(local_id_x$2, 4bv32) == 3bv32;
    p22$1 := (if v155$1 then v155$1 else p22$1);
    p22$2 := (if v155$2 then v155$2 else p22$2);
    v156$1 := (if p22$1 then $$result$1[12bv32] else v156$1);
    v156$2 := (if p22$2 then $$result$2[12bv32] else v156$2);
    v157$1 := (if p22$1 then $$result$1[13bv32] else v157$1);
    v157$2 := (if p22$2 then $$result$2[13bv32] else v157$2);
    v158$1 := (if p22$1 then $$result$1[14bv32] else v158$1);
    v158$2 := (if p22$2 then $$result$2[14bv32] else v158$2);
    v159$1 := (if p22$1 then $$result$1[15bv32] else v159$1);
    v159$2 := (if p22$2 then $$result$2[15bv32] else v159$2);
    $$6$0bv32$1 := (if p22$1 then v156$1 else $$6$0bv32$1);
    $$6$0bv32$2 := (if p22$2 then v156$2 else $$6$0bv32$2);
    $$6$1bv32$1 := (if p22$1 then v157$1 else $$6$1bv32$1);
    $$6$1bv32$2 := (if p22$2 then v157$2 else $$6$1bv32$2);
    $$6$2bv32$1 := (if p22$1 then v158$1 else $$6$2bv32$1);
    $$6$2bv32$2 := (if p22$2 then v158$2 else $$6$2bv32$2);
    $$6$3bv32$1 := (if p22$1 then v159$1 else $$6$3bv32$1);
    $$6$3bv32$2 := (if p22$2 then v159$2 else $$6$3bv32$2);
    v160$1 := (if p22$1 then $$6$0bv32$1 else v160$1);
    v160$2 := (if p22$2 then $$6$0bv32$2 else v160$2);
    v161$1 := (if p22$1 then $$6$1bv32$1 else v161$1);
    v161$2 := (if p22$2 then $$6$1bv32$2 else v161$2);
    v162$1 := (if p22$1 then $$6$2bv32$1 else v162$1);
    v162$2 := (if p22$2 then $$6$2bv32$2 else v162$2);
    v163$1 := (if p22$1 then $$6$3bv32$1 else v163$1);
    v163$2 := (if p22$2 then $$6$3bv32$2 else v163$2);
    $$23$0bv32$1 := (if p22$1 then v160$1 else $$23$0bv32$1);
    $$23$0bv32$2 := (if p22$2 then v160$2 else $$23$0bv32$2);
    $$23$1bv32$1 := (if p22$1 then v161$1 else $$23$1bv32$1);
    $$23$1bv32$2 := (if p22$2 then v161$2 else $$23$1bv32$2);
    $$23$2bv32$1 := (if p22$1 then v162$1 else $$23$2bv32$1);
    $$23$2bv32$2 := (if p22$2 then v162$2 else $$23$2bv32$2);
    $$23$3bv32$1 := (if p22$1 then v163$1 else $$23$3bv32$1);
    $$23$3bv32$2 := (if p22$2 then v163$2 else $$23$3bv32$2);
    v164$1 := (if p22$1 then $$23$0bv32$1 else v164$1);
    v164$2 := (if p22$2 then $$23$0bv32$2 else v164$2);
    $$output$0bv32$1 := (if p22$1 then v164$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p22$2 then v164$2 else $$output$0bv32$2);
    v165$1 := (if p22$1 then $$23$1bv32$1 else v165$1);
    v165$2 := (if p22$2 then $$23$1bv32$2 else v165$2);
    $$output$1bv32$1 := (if p22$1 then v165$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p22$2 then v165$2 else $$output$1bv32$2);
    v166$1 := (if p22$1 then $$23$2bv32$1 else v166$1);
    v166$2 := (if p22$2 then $$23$2bv32$2 else v166$2);
    $$output$2bv32$1 := (if p22$1 then v166$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p22$2 then v166$2 else $$output$2bv32$2);
    v167$1 := (if p22$1 then $$23$3bv32$1 else v167$1);
    v167$2 := (if p22$2 then $$23$3bv32$2 else v167$2);
    $$output$3bv32$1 := (if p22$1 then v167$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p22$2 then v167$2 else $$output$3bv32$2);
    v168$1 := $$output$0bv32$1;
    v168$2 := $$output$0bv32$2;
    call {:sourceloc} {:sourceloc_num 319} _LOG_WRITE_$$integral_image(true, BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), v168$1, $$integral_image[BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 319} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 319} _CHECK_WRITE_$$integral_image(true, BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), v168$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32)] := v168$1;
    $$integral_image[BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32)] := v168$2;
    v169$1 := $$output$1bv32$1;
    v169$2 := $$output$1bv32$2;
    call {:sourceloc} {:sourceloc_num 321} _LOG_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 1bv32), v169$1, $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 321} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 321} _CHECK_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 1bv32), v169$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 1bv32)] := v169$1;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 1bv32)] := v169$2;
    v170$1 := $$output$2bv32$1;
    v170$2 := $$output$2bv32$2;
    call {:sourceloc} {:sourceloc_num 323} _LOG_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 2bv32), v170$1, $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 323} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 323} _CHECK_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 2bv32), v170$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 2bv32)] := v170$1;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 2bv32)] := v170$2;
    v171$1 := $$output$3bv32$1;
    v171$2 := $$output$3bv32$2;
    call {:sourceloc} {:sourceloc_num 325} _LOG_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 3bv32), v171$1, $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 325} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 325} _CHECK_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 3bv32), v171$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 3bv32)] := v171$1;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 3bv32)] := v171$2;
    v172$1 := BV32_UREM(local_id_x$1, 4bv32) == 2bv32;
    v172$2 := BV32_UREM(local_id_x$2, 4bv32) == 2bv32;
    p24$1 := (if v172$1 then v172$1 else p24$1);
    p24$2 := (if v172$2 then v172$2 else p24$2);
    v173$1 := (if p24$1 then $$result$1[0bv32] else v173$1);
    v173$2 := (if p24$2 then $$result$2[0bv32] else v173$2);
    v174$1 := (if p24$1 then $$result$1[1bv32] else v174$1);
    v174$2 := (if p24$2 then $$result$2[1bv32] else v174$2);
    v175$1 := (if p24$1 then $$result$1[2bv32] else v175$1);
    v175$2 := (if p24$2 then $$result$2[2bv32] else v175$2);
    v176$1 := (if p24$1 then $$result$1[3bv32] else v176$1);
    v176$2 := (if p24$2 then $$result$2[3bv32] else v176$2);
    $$7$0bv32$1 := (if p24$1 then v173$1 else $$7$0bv32$1);
    $$7$0bv32$2 := (if p24$2 then v173$2 else $$7$0bv32$2);
    $$7$1bv32$1 := (if p24$1 then v174$1 else $$7$1bv32$1);
    $$7$1bv32$2 := (if p24$2 then v174$2 else $$7$1bv32$2);
    $$7$2bv32$1 := (if p24$1 then v175$1 else $$7$2bv32$1);
    $$7$2bv32$2 := (if p24$2 then v175$2 else $$7$2bv32$2);
    $$7$3bv32$1 := (if p24$1 then v176$1 else $$7$3bv32$1);
    $$7$3bv32$2 := (if p24$2 then v176$2 else $$7$3bv32$2);
    v177$1 := (if p24$1 then $$7$0bv32$1 else v177$1);
    v177$2 := (if p24$2 then $$7$0bv32$2 else v177$2);
    v178$1 := (if p24$1 then $$7$1bv32$1 else v178$1);
    v178$2 := (if p24$2 then $$7$1bv32$2 else v178$2);
    v179$1 := (if p24$1 then $$7$2bv32$1 else v179$1);
    v179$2 := (if p24$2 then $$7$2bv32$2 else v179$2);
    v180$1 := (if p24$1 then $$7$3bv32$1 else v180$1);
    v180$2 := (if p24$2 then $$7$3bv32$2 else v180$2);
    $$24$0bv32$1 := (if p24$1 then v177$1 else $$24$0bv32$1);
    $$24$0bv32$2 := (if p24$2 then v177$2 else $$24$0bv32$2);
    $$24$1bv32$1 := (if p24$1 then v178$1 else $$24$1bv32$1);
    $$24$1bv32$2 := (if p24$2 then v178$2 else $$24$1bv32$2);
    $$24$2bv32$1 := (if p24$1 then v179$1 else $$24$2bv32$1);
    $$24$2bv32$2 := (if p24$2 then v179$2 else $$24$2bv32$2);
    $$24$3bv32$1 := (if p24$1 then v180$1 else $$24$3bv32$1);
    $$24$3bv32$2 := (if p24$2 then v180$2 else $$24$3bv32$2);
    v181$1 := (if p24$1 then $$24$0bv32$1 else v181$1);
    v181$2 := (if p24$2 then $$24$0bv32$2 else v181$2);
    $$output$0bv32$1 := (if p24$1 then v181$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p24$2 then v181$2 else $$output$0bv32$2);
    v182$1 := (if p24$1 then $$24$1bv32$1 else v182$1);
    v182$2 := (if p24$2 then $$24$1bv32$2 else v182$2);
    $$output$1bv32$1 := (if p24$1 then v182$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p24$2 then v182$2 else $$output$1bv32$2);
    v183$1 := (if p24$1 then $$24$2bv32$1 else v183$1);
    v183$2 := (if p24$2 then $$24$2bv32$2 else v183$2);
    $$output$2bv32$1 := (if p24$1 then v183$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p24$2 then v183$2 else $$output$2bv32$2);
    v184$1 := (if p24$1 then $$24$3bv32$1 else v184$1);
    v184$2 := (if p24$2 then $$24$3bv32$2 else v184$2);
    $$output$3bv32$1 := (if p24$1 then v184$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p24$2 then v184$2 else $$output$3bv32$2);
    v185$1 := BV32_UREM(local_id_x$1, 4bv32) == 3bv32;
    v185$2 := BV32_UREM(local_id_x$2, 4bv32) == 3bv32;
    p26$1 := (if v185$1 then v185$1 else p26$1);
    p26$2 := (if v185$2 then v185$2 else p26$2);
    v186$1 := (if p26$1 then $$result$1[4bv32] else v186$1);
    v186$2 := (if p26$2 then $$result$2[4bv32] else v186$2);
    v187$1 := (if p26$1 then $$result$1[5bv32] else v187$1);
    v187$2 := (if p26$2 then $$result$2[5bv32] else v187$2);
    v188$1 := (if p26$1 then $$result$1[6bv32] else v188$1);
    v188$2 := (if p26$2 then $$result$2[6bv32] else v188$2);
    v189$1 := (if p26$1 then $$result$1[7bv32] else v189$1);
    v189$2 := (if p26$2 then $$result$2[7bv32] else v189$2);
    $$8$0bv32$1 := (if p26$1 then v186$1 else $$8$0bv32$1);
    $$8$0bv32$2 := (if p26$2 then v186$2 else $$8$0bv32$2);
    $$8$1bv32$1 := (if p26$1 then v187$1 else $$8$1bv32$1);
    $$8$1bv32$2 := (if p26$2 then v187$2 else $$8$1bv32$2);
    $$8$2bv32$1 := (if p26$1 then v188$1 else $$8$2bv32$1);
    $$8$2bv32$2 := (if p26$2 then v188$2 else $$8$2bv32$2);
    $$8$3bv32$1 := (if p26$1 then v189$1 else $$8$3bv32$1);
    $$8$3bv32$2 := (if p26$2 then v189$2 else $$8$3bv32$2);
    v190$1 := (if p26$1 then $$8$0bv32$1 else v190$1);
    v190$2 := (if p26$2 then $$8$0bv32$2 else v190$2);
    v191$1 := (if p26$1 then $$8$1bv32$1 else v191$1);
    v191$2 := (if p26$2 then $$8$1bv32$2 else v191$2);
    v192$1 := (if p26$1 then $$8$2bv32$1 else v192$1);
    v192$2 := (if p26$2 then $$8$2bv32$2 else v192$2);
    v193$1 := (if p26$1 then $$8$3bv32$1 else v193$1);
    v193$2 := (if p26$2 then $$8$3bv32$2 else v193$2);
    $$25$0bv32$1 := (if p26$1 then v190$1 else $$25$0bv32$1);
    $$25$0bv32$2 := (if p26$2 then v190$2 else $$25$0bv32$2);
    $$25$1bv32$1 := (if p26$1 then v191$1 else $$25$1bv32$1);
    $$25$1bv32$2 := (if p26$2 then v191$2 else $$25$1bv32$2);
    $$25$2bv32$1 := (if p26$1 then v192$1 else $$25$2bv32$1);
    $$25$2bv32$2 := (if p26$2 then v192$2 else $$25$2bv32$2);
    $$25$3bv32$1 := (if p26$1 then v193$1 else $$25$3bv32$1);
    $$25$3bv32$2 := (if p26$2 then v193$2 else $$25$3bv32$2);
    v194$1 := (if p26$1 then $$25$0bv32$1 else v194$1);
    v194$2 := (if p26$2 then $$25$0bv32$2 else v194$2);
    $$output$0bv32$1 := (if p26$1 then v194$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p26$2 then v194$2 else $$output$0bv32$2);
    v195$1 := (if p26$1 then $$25$1bv32$1 else v195$1);
    v195$2 := (if p26$2 then $$25$1bv32$2 else v195$2);
    $$output$1bv32$1 := (if p26$1 then v195$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p26$2 then v195$2 else $$output$1bv32$2);
    v196$1 := (if p26$1 then $$25$2bv32$1 else v196$1);
    v196$2 := (if p26$2 then $$25$2bv32$2 else v196$2);
    $$output$2bv32$1 := (if p26$1 then v196$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p26$2 then v196$2 else $$output$2bv32$2);
    v197$1 := (if p26$1 then $$25$3bv32$1 else v197$1);
    v197$2 := (if p26$2 then $$25$3bv32$2 else v197$2);
    $$output$3bv32$1 := (if p26$1 then v197$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p26$2 then v197$2 else $$output$3bv32$2);
    v198$1 := BV32_UREM(local_id_x$1, 4bv32) == 0bv32;
    v198$2 := BV32_UREM(local_id_x$2, 4bv32) == 0bv32;
    p28$1 := (if v198$1 then v198$1 else p28$1);
    p28$2 := (if v198$2 then v198$2 else p28$2);
    v199$1 := (if p28$1 then $$result$1[8bv32] else v199$1);
    v199$2 := (if p28$2 then $$result$2[8bv32] else v199$2);
    v200$1 := (if p28$1 then $$result$1[9bv32] else v200$1);
    v200$2 := (if p28$2 then $$result$2[9bv32] else v200$2);
    v201$1 := (if p28$1 then $$result$1[10bv32] else v201$1);
    v201$2 := (if p28$2 then $$result$2[10bv32] else v201$2);
    v202$1 := (if p28$1 then $$result$1[11bv32] else v202$1);
    v202$2 := (if p28$2 then $$result$2[11bv32] else v202$2);
    $$9$0bv32$1 := (if p28$1 then v199$1 else $$9$0bv32$1);
    $$9$0bv32$2 := (if p28$2 then v199$2 else $$9$0bv32$2);
    $$9$1bv32$1 := (if p28$1 then v200$1 else $$9$1bv32$1);
    $$9$1bv32$2 := (if p28$2 then v200$2 else $$9$1bv32$2);
    $$9$2bv32$1 := (if p28$1 then v201$1 else $$9$2bv32$1);
    $$9$2bv32$2 := (if p28$2 then v201$2 else $$9$2bv32$2);
    $$9$3bv32$1 := (if p28$1 then v202$1 else $$9$3bv32$1);
    $$9$3bv32$2 := (if p28$2 then v202$2 else $$9$3bv32$2);
    v203$1 := (if p28$1 then $$9$0bv32$1 else v203$1);
    v203$2 := (if p28$2 then $$9$0bv32$2 else v203$2);
    v204$1 := (if p28$1 then $$9$1bv32$1 else v204$1);
    v204$2 := (if p28$2 then $$9$1bv32$2 else v204$2);
    v205$1 := (if p28$1 then $$9$2bv32$1 else v205$1);
    v205$2 := (if p28$2 then $$9$2bv32$2 else v205$2);
    v206$1 := (if p28$1 then $$9$3bv32$1 else v206$1);
    v206$2 := (if p28$2 then $$9$3bv32$2 else v206$2);
    $$26$0bv32$1 := (if p28$1 then v203$1 else $$26$0bv32$1);
    $$26$0bv32$2 := (if p28$2 then v203$2 else $$26$0bv32$2);
    $$26$1bv32$1 := (if p28$1 then v204$1 else $$26$1bv32$1);
    $$26$1bv32$2 := (if p28$2 then v204$2 else $$26$1bv32$2);
    $$26$2bv32$1 := (if p28$1 then v205$1 else $$26$2bv32$1);
    $$26$2bv32$2 := (if p28$2 then v205$2 else $$26$2bv32$2);
    $$26$3bv32$1 := (if p28$1 then v206$1 else $$26$3bv32$1);
    $$26$3bv32$2 := (if p28$2 then v206$2 else $$26$3bv32$2);
    v207$1 := (if p28$1 then $$26$0bv32$1 else v207$1);
    v207$2 := (if p28$2 then $$26$0bv32$2 else v207$2);
    $$output$0bv32$1 := (if p28$1 then v207$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p28$2 then v207$2 else $$output$0bv32$2);
    v208$1 := (if p28$1 then $$26$1bv32$1 else v208$1);
    v208$2 := (if p28$2 then $$26$1bv32$2 else v208$2);
    $$output$1bv32$1 := (if p28$1 then v208$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p28$2 then v208$2 else $$output$1bv32$2);
    v209$1 := (if p28$1 then $$26$2bv32$1 else v209$1);
    v209$2 := (if p28$2 then $$26$2bv32$2 else v209$2);
    $$output$2bv32$1 := (if p28$1 then v209$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p28$2 then v209$2 else $$output$2bv32$2);
    v210$1 := (if p28$1 then $$26$3bv32$1 else v210$1);
    v210$2 := (if p28$2 then $$26$3bv32$2 else v210$2);
    $$output$3bv32$1 := (if p28$1 then v210$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p28$2 then v210$2 else $$output$3bv32$2);
    v211$1 := BV32_UREM(local_id_x$1, 4bv32) == 1bv32;
    v211$2 := BV32_UREM(local_id_x$2, 4bv32) == 1bv32;
    p30$1 := (if v211$1 then v211$1 else p30$1);
    p30$2 := (if v211$2 then v211$2 else p30$2);
    v212$1 := (if p30$1 then $$result$1[12bv32] else v212$1);
    v212$2 := (if p30$2 then $$result$2[12bv32] else v212$2);
    v213$1 := (if p30$1 then $$result$1[13bv32] else v213$1);
    v213$2 := (if p30$2 then $$result$2[13bv32] else v213$2);
    v214$1 := (if p30$1 then $$result$1[14bv32] else v214$1);
    v214$2 := (if p30$2 then $$result$2[14bv32] else v214$2);
    v215$1 := (if p30$1 then $$result$1[15bv32] else v215$1);
    v215$2 := (if p30$2 then $$result$2[15bv32] else v215$2);
    $$10$0bv32$1 := (if p30$1 then v212$1 else $$10$0bv32$1);
    $$10$0bv32$2 := (if p30$2 then v212$2 else $$10$0bv32$2);
    $$10$1bv32$1 := (if p30$1 then v213$1 else $$10$1bv32$1);
    $$10$1bv32$2 := (if p30$2 then v213$2 else $$10$1bv32$2);
    $$10$2bv32$1 := (if p30$1 then v214$1 else $$10$2bv32$1);
    $$10$2bv32$2 := (if p30$2 then v214$2 else $$10$2bv32$2);
    $$10$3bv32$1 := (if p30$1 then v215$1 else $$10$3bv32$1);
    $$10$3bv32$2 := (if p30$2 then v215$2 else $$10$3bv32$2);
    v216$1 := (if p30$1 then $$10$0bv32$1 else v216$1);
    v216$2 := (if p30$2 then $$10$0bv32$2 else v216$2);
    v217$1 := (if p30$1 then $$10$1bv32$1 else v217$1);
    v217$2 := (if p30$2 then $$10$1bv32$2 else v217$2);
    v218$1 := (if p30$1 then $$10$2bv32$1 else v218$1);
    v218$2 := (if p30$2 then $$10$2bv32$2 else v218$2);
    v219$1 := (if p30$1 then $$10$3bv32$1 else v219$1);
    v219$2 := (if p30$2 then $$10$3bv32$2 else v219$2);
    $$27$0bv32$1 := (if p30$1 then v216$1 else $$27$0bv32$1);
    $$27$0bv32$2 := (if p30$2 then v216$2 else $$27$0bv32$2);
    $$27$1bv32$1 := (if p30$1 then v217$1 else $$27$1bv32$1);
    $$27$1bv32$2 := (if p30$2 then v217$2 else $$27$1bv32$2);
    $$27$2bv32$1 := (if p30$1 then v218$1 else $$27$2bv32$1);
    $$27$2bv32$2 := (if p30$2 then v218$2 else $$27$2bv32$2);
    $$27$3bv32$1 := (if p30$1 then v219$1 else $$27$3bv32$1);
    $$27$3bv32$2 := (if p30$2 then v219$2 else $$27$3bv32$2);
    v220$1 := (if p30$1 then $$27$0bv32$1 else v220$1);
    v220$2 := (if p30$2 then $$27$0bv32$2 else v220$2);
    $$output$0bv32$1 := (if p30$1 then v220$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p30$2 then v220$2 else $$output$0bv32$2);
    v221$1 := (if p30$1 then $$27$1bv32$1 else v221$1);
    v221$2 := (if p30$2 then $$27$1bv32$2 else v221$2);
    $$output$1bv32$1 := (if p30$1 then v221$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p30$2 then v221$2 else $$output$1bv32$2);
    v222$1 := (if p30$1 then $$27$2bv32$1 else v222$1);
    v222$2 := (if p30$2 then $$27$2bv32$2 else v222$2);
    $$output$2bv32$1 := (if p30$1 then v222$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p30$2 then v222$2 else $$output$2bv32$2);
    v223$1 := (if p30$1 then $$27$3bv32$1 else v223$1);
    v223$2 := (if p30$2 then $$27$3bv32$2 else v223$2);
    $$output$3bv32$1 := (if p30$1 then v223$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p30$2 then v223$2 else $$output$3bv32$2);
    v224$1 := $$output$0bv32$1;
    v224$2 := $$output$0bv32$2;
    call {:sourceloc} {:sourceloc_num 431} _LOG_WRITE_$$integral_image(true, BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 8bv32), 4bv32), v224$1, $$integral_image[BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 8bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 8bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 431} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 431} _CHECK_WRITE_$$integral_image(true, BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 8bv32), 4bv32), v224$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 8bv32), 4bv32)] := v224$1;
    $$integral_image[BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 8bv32), 4bv32)] := v224$2;
    v225$1 := $$output$1bv32$1;
    v225$2 := $$output$1bv32$2;
    call {:sourceloc} {:sourceloc_num 433} _LOG_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 8bv32), 4bv32), 1bv32), v225$1, $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 8bv32), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 8bv32), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 433} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 433} _CHECK_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 8bv32), 4bv32), 1bv32), v225$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 8bv32), 4bv32), 1bv32)] := v225$1;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 8bv32), 4bv32), 1bv32)] := v225$2;
    v226$1 := $$output$2bv32$1;
    v226$2 := $$output$2bv32$2;
    call {:sourceloc} {:sourceloc_num 435} _LOG_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 8bv32), 4bv32), 2bv32), v226$1, $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 8bv32), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 8bv32), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 435} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 435} _CHECK_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 8bv32), 4bv32), 2bv32), v226$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 8bv32), 4bv32), 2bv32)] := v226$1;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 8bv32), 4bv32), 2bv32)] := v226$2;
    v227$1 := $$output$3bv32$1;
    v227$2 := $$output$3bv32$2;
    call {:sourceloc} {:sourceloc_num 437} _LOG_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 8bv32), 4bv32), 3bv32), v227$1, $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 8bv32), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 8bv32), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 437} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 437} _CHECK_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 8bv32), 4bv32), 3bv32), v227$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 8bv32), 4bv32), 3bv32)] := v227$1;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 8bv32), 4bv32), 3bv32)] := v227$2;
    $i8.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $55;

  $55:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 438} true;
    v228 := BV32_SLT($i8.0, 16bv32);
    p32$1 := false;
    p32$2 := false;
    p33$1 := false;
    p33$2 := false;
    p34$1 := false;
    p34$2 := false;
    p35$1 := false;
    p35$2 := false;
    p36$1 := false;
    p36$2 := false;
    p37$1 := false;
    p37$2 := false;
    p38$1 := false;
    p38$2 := false;
    p39$1 := false;
    p39$2 := false;
    p40$1 := false;
    p40$2 := false;
    p41$1 := false;
    p41$2 := false;
    p42$1 := false;
    p42$2 := false;
    p43$1 := false;
    p43$2 := false;
    p44$1 := false;
    p44$2 := false;
    p45$1 := false;
    p45$2 := false;
    p46$1 := false;
    p46$2 := false;
    p47$1 := false;
    p47$2 := false;
    goto $truebb19, $falsebb19;

  $falsebb19:
    assume {:partition} !v228 && !v228;
    v231$1 := BV32_UREM(local_id_x$1, 4bv32) == 0bv32;
    v231$2 := BV32_UREM(local_id_x$2, 4bv32) == 0bv32;
    p32$1 := (if v231$1 then v231$1 else p32$1);
    p32$2 := (if v231$2 then v231$2 else p32$2);
    v232$1 := (if p32$1 then $$result$1[0bv32] else v232$1);
    v232$2 := (if p32$2 then $$result$2[0bv32] else v232$2);
    v233$1 := (if p32$1 then $$result$1[1bv32] else v233$1);
    v233$2 := (if p32$2 then $$result$2[1bv32] else v233$2);
    v234$1 := (if p32$1 then $$result$1[2bv32] else v234$1);
    v234$2 := (if p32$2 then $$result$2[2bv32] else v234$2);
    v235$1 := (if p32$1 then $$result$1[3bv32] else v235$1);
    v235$2 := (if p32$2 then $$result$2[3bv32] else v235$2);
    $$11$0bv32$1 := (if p32$1 then v232$1 else $$11$0bv32$1);
    $$11$0bv32$2 := (if p32$2 then v232$2 else $$11$0bv32$2);
    $$11$1bv32$1 := (if p32$1 then v233$1 else $$11$1bv32$1);
    $$11$1bv32$2 := (if p32$2 then v233$2 else $$11$1bv32$2);
    $$11$2bv32$1 := (if p32$1 then v234$1 else $$11$2bv32$1);
    $$11$2bv32$2 := (if p32$2 then v234$2 else $$11$2bv32$2);
    $$11$3bv32$1 := (if p32$1 then v235$1 else $$11$3bv32$1);
    $$11$3bv32$2 := (if p32$2 then v235$2 else $$11$3bv32$2);
    v236$1 := (if p32$1 then $$11$0bv32$1 else v236$1);
    v236$2 := (if p32$2 then $$11$0bv32$2 else v236$2);
    v237$1 := (if p32$1 then $$11$1bv32$1 else v237$1);
    v237$2 := (if p32$2 then $$11$1bv32$2 else v237$2);
    v238$1 := (if p32$1 then $$11$2bv32$1 else v238$1);
    v238$2 := (if p32$2 then $$11$2bv32$2 else v238$2);
    v239$1 := (if p32$1 then $$11$3bv32$1 else v239$1);
    v239$2 := (if p32$2 then $$11$3bv32$2 else v239$2);
    $$28$0bv32$1 := (if p32$1 then v236$1 else $$28$0bv32$1);
    $$28$0bv32$2 := (if p32$2 then v236$2 else $$28$0bv32$2);
    $$28$1bv32$1 := (if p32$1 then v237$1 else $$28$1bv32$1);
    $$28$1bv32$2 := (if p32$2 then v237$2 else $$28$1bv32$2);
    $$28$2bv32$1 := (if p32$1 then v238$1 else $$28$2bv32$1);
    $$28$2bv32$2 := (if p32$2 then v238$2 else $$28$2bv32$2);
    $$28$3bv32$1 := (if p32$1 then v239$1 else $$28$3bv32$1);
    $$28$3bv32$2 := (if p32$2 then v239$2 else $$28$3bv32$2);
    v240$1 := (if p32$1 then $$28$0bv32$1 else v240$1);
    v240$2 := (if p32$2 then $$28$0bv32$2 else v240$2);
    $$output$0bv32$1 := (if p32$1 then v240$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p32$2 then v240$2 else $$output$0bv32$2);
    v241$1 := (if p32$1 then $$28$1bv32$1 else v241$1);
    v241$2 := (if p32$2 then $$28$1bv32$2 else v241$2);
    $$output$1bv32$1 := (if p32$1 then v241$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p32$2 then v241$2 else $$output$1bv32$2);
    v242$1 := (if p32$1 then $$28$2bv32$1 else v242$1);
    v242$2 := (if p32$2 then $$28$2bv32$2 else v242$2);
    $$output$2bv32$1 := (if p32$1 then v242$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p32$2 then v242$2 else $$output$2bv32$2);
    v243$1 := (if p32$1 then $$28$3bv32$1 else v243$1);
    v243$2 := (if p32$2 then $$28$3bv32$2 else v243$2);
    $$output$3bv32$1 := (if p32$1 then v243$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p32$2 then v243$2 else $$output$3bv32$2);
    v244$1 := BV32_UREM(local_id_x$1, 4bv32) == 1bv32;
    v244$2 := BV32_UREM(local_id_x$2, 4bv32) == 1bv32;
    p34$1 := (if v244$1 then v244$1 else p34$1);
    p34$2 := (if v244$2 then v244$2 else p34$2);
    v245$1 := (if p34$1 then $$result$1[4bv32] else v245$1);
    v245$2 := (if p34$2 then $$result$2[4bv32] else v245$2);
    v246$1 := (if p34$1 then $$result$1[5bv32] else v246$1);
    v246$2 := (if p34$2 then $$result$2[5bv32] else v246$2);
    v247$1 := (if p34$1 then $$result$1[6bv32] else v247$1);
    v247$2 := (if p34$2 then $$result$2[6bv32] else v247$2);
    v248$1 := (if p34$1 then $$result$1[7bv32] else v248$1);
    v248$2 := (if p34$2 then $$result$2[7bv32] else v248$2);
    $$12$0bv32$1 := (if p34$1 then v245$1 else $$12$0bv32$1);
    $$12$0bv32$2 := (if p34$2 then v245$2 else $$12$0bv32$2);
    $$12$1bv32$1 := (if p34$1 then v246$1 else $$12$1bv32$1);
    $$12$1bv32$2 := (if p34$2 then v246$2 else $$12$1bv32$2);
    $$12$2bv32$1 := (if p34$1 then v247$1 else $$12$2bv32$1);
    $$12$2bv32$2 := (if p34$2 then v247$2 else $$12$2bv32$2);
    $$12$3bv32$1 := (if p34$1 then v248$1 else $$12$3bv32$1);
    $$12$3bv32$2 := (if p34$2 then v248$2 else $$12$3bv32$2);
    v249$1 := (if p34$1 then $$12$0bv32$1 else v249$1);
    v249$2 := (if p34$2 then $$12$0bv32$2 else v249$2);
    v250$1 := (if p34$1 then $$12$1bv32$1 else v250$1);
    v250$2 := (if p34$2 then $$12$1bv32$2 else v250$2);
    v251$1 := (if p34$1 then $$12$2bv32$1 else v251$1);
    v251$2 := (if p34$2 then $$12$2bv32$2 else v251$2);
    v252$1 := (if p34$1 then $$12$3bv32$1 else v252$1);
    v252$2 := (if p34$2 then $$12$3bv32$2 else v252$2);
    $$29$0bv32$1 := (if p34$1 then v249$1 else $$29$0bv32$1);
    $$29$0bv32$2 := (if p34$2 then v249$2 else $$29$0bv32$2);
    $$29$1bv32$1 := (if p34$1 then v250$1 else $$29$1bv32$1);
    $$29$1bv32$2 := (if p34$2 then v250$2 else $$29$1bv32$2);
    $$29$2bv32$1 := (if p34$1 then v251$1 else $$29$2bv32$1);
    $$29$2bv32$2 := (if p34$2 then v251$2 else $$29$2bv32$2);
    $$29$3bv32$1 := (if p34$1 then v252$1 else $$29$3bv32$1);
    $$29$3bv32$2 := (if p34$2 then v252$2 else $$29$3bv32$2);
    v253$1 := (if p34$1 then $$29$0bv32$1 else v253$1);
    v253$2 := (if p34$2 then $$29$0bv32$2 else v253$2);
    $$output$0bv32$1 := (if p34$1 then v253$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p34$2 then v253$2 else $$output$0bv32$2);
    v254$1 := (if p34$1 then $$29$1bv32$1 else v254$1);
    v254$2 := (if p34$2 then $$29$1bv32$2 else v254$2);
    $$output$1bv32$1 := (if p34$1 then v254$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p34$2 then v254$2 else $$output$1bv32$2);
    v255$1 := (if p34$1 then $$29$2bv32$1 else v255$1);
    v255$2 := (if p34$2 then $$29$2bv32$2 else v255$2);
    $$output$2bv32$1 := (if p34$1 then v255$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p34$2 then v255$2 else $$output$2bv32$2);
    v256$1 := (if p34$1 then $$29$3bv32$1 else v256$1);
    v256$2 := (if p34$2 then $$29$3bv32$2 else v256$2);
    $$output$3bv32$1 := (if p34$1 then v256$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p34$2 then v256$2 else $$output$3bv32$2);
    v257$1 := BV32_UREM(local_id_x$1, 4bv32) == 2bv32;
    v257$2 := BV32_UREM(local_id_x$2, 4bv32) == 2bv32;
    p36$1 := (if v257$1 then v257$1 else p36$1);
    p36$2 := (if v257$2 then v257$2 else p36$2);
    v258$1 := (if p36$1 then $$result$1[8bv32] else v258$1);
    v258$2 := (if p36$2 then $$result$2[8bv32] else v258$2);
    v259$1 := (if p36$1 then $$result$1[9bv32] else v259$1);
    v259$2 := (if p36$2 then $$result$2[9bv32] else v259$2);
    v260$1 := (if p36$1 then $$result$1[10bv32] else v260$1);
    v260$2 := (if p36$2 then $$result$2[10bv32] else v260$2);
    v261$1 := (if p36$1 then $$result$1[11bv32] else v261$1);
    v261$2 := (if p36$2 then $$result$2[11bv32] else v261$2);
    $$13$0bv32$1 := (if p36$1 then v258$1 else $$13$0bv32$1);
    $$13$0bv32$2 := (if p36$2 then v258$2 else $$13$0bv32$2);
    $$13$1bv32$1 := (if p36$1 then v259$1 else $$13$1bv32$1);
    $$13$1bv32$2 := (if p36$2 then v259$2 else $$13$1bv32$2);
    $$13$2bv32$1 := (if p36$1 then v260$1 else $$13$2bv32$1);
    $$13$2bv32$2 := (if p36$2 then v260$2 else $$13$2bv32$2);
    $$13$3bv32$1 := (if p36$1 then v261$1 else $$13$3bv32$1);
    $$13$3bv32$2 := (if p36$2 then v261$2 else $$13$3bv32$2);
    v262$1 := (if p36$1 then $$13$0bv32$1 else v262$1);
    v262$2 := (if p36$2 then $$13$0bv32$2 else v262$2);
    v263$1 := (if p36$1 then $$13$1bv32$1 else v263$1);
    v263$2 := (if p36$2 then $$13$1bv32$2 else v263$2);
    v264$1 := (if p36$1 then $$13$2bv32$1 else v264$1);
    v264$2 := (if p36$2 then $$13$2bv32$2 else v264$2);
    v265$1 := (if p36$1 then $$13$3bv32$1 else v265$1);
    v265$2 := (if p36$2 then $$13$3bv32$2 else v265$2);
    $$30$0bv32$1 := (if p36$1 then v262$1 else $$30$0bv32$1);
    $$30$0bv32$2 := (if p36$2 then v262$2 else $$30$0bv32$2);
    $$30$1bv32$1 := (if p36$1 then v263$1 else $$30$1bv32$1);
    $$30$1bv32$2 := (if p36$2 then v263$2 else $$30$1bv32$2);
    $$30$2bv32$1 := (if p36$1 then v264$1 else $$30$2bv32$1);
    $$30$2bv32$2 := (if p36$2 then v264$2 else $$30$2bv32$2);
    $$30$3bv32$1 := (if p36$1 then v265$1 else $$30$3bv32$1);
    $$30$3bv32$2 := (if p36$2 then v265$2 else $$30$3bv32$2);
    v266$1 := (if p36$1 then $$30$0bv32$1 else v266$1);
    v266$2 := (if p36$2 then $$30$0bv32$2 else v266$2);
    $$output$0bv32$1 := (if p36$1 then v266$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p36$2 then v266$2 else $$output$0bv32$2);
    v267$1 := (if p36$1 then $$30$1bv32$1 else v267$1);
    v267$2 := (if p36$2 then $$30$1bv32$2 else v267$2);
    $$output$1bv32$1 := (if p36$1 then v267$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p36$2 then v267$2 else $$output$1bv32$2);
    v268$1 := (if p36$1 then $$30$2bv32$1 else v268$1);
    v268$2 := (if p36$2 then $$30$2bv32$2 else v268$2);
    $$output$2bv32$1 := (if p36$1 then v268$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p36$2 then v268$2 else $$output$2bv32$2);
    v269$1 := (if p36$1 then $$30$3bv32$1 else v269$1);
    v269$2 := (if p36$2 then $$30$3bv32$2 else v269$2);
    $$output$3bv32$1 := (if p36$1 then v269$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p36$2 then v269$2 else $$output$3bv32$2);
    v270$1 := BV32_UREM(local_id_x$1, 4bv32) == 3bv32;
    v270$2 := BV32_UREM(local_id_x$2, 4bv32) == 3bv32;
    p38$1 := (if v270$1 then v270$1 else p38$1);
    p38$2 := (if v270$2 then v270$2 else p38$2);
    v271$1 := (if p38$1 then $$result$1[12bv32] else v271$1);
    v271$2 := (if p38$2 then $$result$2[12bv32] else v271$2);
    v272$1 := (if p38$1 then $$result$1[13bv32] else v272$1);
    v272$2 := (if p38$2 then $$result$2[13bv32] else v272$2);
    v273$1 := (if p38$1 then $$result$1[14bv32] else v273$1);
    v273$2 := (if p38$2 then $$result$2[14bv32] else v273$2);
    v274$1 := (if p38$1 then $$result$1[15bv32] else v274$1);
    v274$2 := (if p38$2 then $$result$2[15bv32] else v274$2);
    $$14$0bv32$1 := (if p38$1 then v271$1 else $$14$0bv32$1);
    $$14$0bv32$2 := (if p38$2 then v271$2 else $$14$0bv32$2);
    $$14$1bv32$1 := (if p38$1 then v272$1 else $$14$1bv32$1);
    $$14$1bv32$2 := (if p38$2 then v272$2 else $$14$1bv32$2);
    $$14$2bv32$1 := (if p38$1 then v273$1 else $$14$2bv32$1);
    $$14$2bv32$2 := (if p38$2 then v273$2 else $$14$2bv32$2);
    $$14$3bv32$1 := (if p38$1 then v274$1 else $$14$3bv32$1);
    $$14$3bv32$2 := (if p38$2 then v274$2 else $$14$3bv32$2);
    v275$1 := (if p38$1 then $$14$0bv32$1 else v275$1);
    v275$2 := (if p38$2 then $$14$0bv32$2 else v275$2);
    v276$1 := (if p38$1 then $$14$1bv32$1 else v276$1);
    v276$2 := (if p38$2 then $$14$1bv32$2 else v276$2);
    v277$1 := (if p38$1 then $$14$2bv32$1 else v277$1);
    v277$2 := (if p38$2 then $$14$2bv32$2 else v277$2);
    v278$1 := (if p38$1 then $$14$3bv32$1 else v278$1);
    v278$2 := (if p38$2 then $$14$3bv32$2 else v278$2);
    $$31$0bv32$1 := (if p38$1 then v275$1 else $$31$0bv32$1);
    $$31$0bv32$2 := (if p38$2 then v275$2 else $$31$0bv32$2);
    $$31$1bv32$1 := (if p38$1 then v276$1 else $$31$1bv32$1);
    $$31$1bv32$2 := (if p38$2 then v276$2 else $$31$1bv32$2);
    $$31$2bv32$1 := (if p38$1 then v277$1 else $$31$2bv32$1);
    $$31$2bv32$2 := (if p38$2 then v277$2 else $$31$2bv32$2);
    $$31$3bv32$1 := (if p38$1 then v278$1 else $$31$3bv32$1);
    $$31$3bv32$2 := (if p38$2 then v278$2 else $$31$3bv32$2);
    v279$1 := (if p38$1 then $$31$0bv32$1 else v279$1);
    v279$2 := (if p38$2 then $$31$0bv32$2 else v279$2);
    $$output$0bv32$1 := (if p38$1 then v279$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p38$2 then v279$2 else $$output$0bv32$2);
    v280$1 := (if p38$1 then $$31$1bv32$1 else v280$1);
    v280$2 := (if p38$2 then $$31$1bv32$2 else v280$2);
    $$output$1bv32$1 := (if p38$1 then v280$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p38$2 then v280$2 else $$output$1bv32$2);
    v281$1 := (if p38$1 then $$31$2bv32$1 else v281$1);
    v281$2 := (if p38$2 then $$31$2bv32$2 else v281$2);
    $$output$2bv32$1 := (if p38$1 then v281$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p38$2 then v281$2 else $$output$2bv32$2);
    v282$1 := (if p38$1 then $$31$3bv32$1 else v282$1);
    v282$2 := (if p38$2 then $$31$3bv32$2 else v282$2);
    $$output$3bv32$1 := (if p38$1 then v282$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p38$2 then v282$2 else $$output$3bv32$2);
    v283$1 := $$output$0bv32$1;
    v283$2 := $$output$0bv32$2;
    call {:sourceloc} {:sourceloc_num 550} _LOG_WRITE_$$integral_image(true, BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 4bv32), v283$1, $$integral_image[BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 550} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 550} _CHECK_WRITE_$$integral_image(true, BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 4bv32), v283$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 4bv32)] := v283$1;
    $$integral_image[BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 4bv32)] := v283$2;
    v284$1 := $$output$1bv32$1;
    v284$2 := $$output$1bv32$2;
    call {:sourceloc} {:sourceloc_num 552} _LOG_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 4bv32), 1bv32), v284$1, $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 552} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 552} _CHECK_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 4bv32), 1bv32), v284$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 4bv32), 1bv32)] := v284$1;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 4bv32), 1bv32)] := v284$2;
    v285$1 := $$output$2bv32$1;
    v285$2 := $$output$2bv32$2;
    call {:sourceloc} {:sourceloc_num 554} _LOG_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 4bv32), 2bv32), v285$1, $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 554} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 554} _CHECK_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 4bv32), 2bv32), v285$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 4bv32), 2bv32)] := v285$1;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 4bv32), 2bv32)] := v285$2;
    v286$1 := $$output$3bv32$1;
    v286$2 := $$output$3bv32$2;
    call {:sourceloc} {:sourceloc_num 556} _LOG_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 4bv32), 3bv32), v286$1, $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 556} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 556} _CHECK_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 4bv32), 3bv32), v286$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(local_id_x$1, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 4bv32), 4bv32), 3bv32)] := v286$1;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(local_id_x$2, 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 4bv32), 4bv32), 3bv32)] := v286$2;
    v287$1 := BV32_UREM(local_id_x$1, 4bv32) == 2bv32;
    v287$2 := BV32_UREM(local_id_x$2, 4bv32) == 2bv32;
    p40$1 := (if v287$1 then v287$1 else p40$1);
    p40$2 := (if v287$2 then v287$2 else p40$2);
    v288$1 := (if p40$1 then $$result$1[0bv32] else v288$1);
    v288$2 := (if p40$2 then $$result$2[0bv32] else v288$2);
    v289$1 := (if p40$1 then $$result$1[1bv32] else v289$1);
    v289$2 := (if p40$2 then $$result$2[1bv32] else v289$2);
    v290$1 := (if p40$1 then $$result$1[2bv32] else v290$1);
    v290$2 := (if p40$2 then $$result$2[2bv32] else v290$2);
    v291$1 := (if p40$1 then $$result$1[3bv32] else v291$1);
    v291$2 := (if p40$2 then $$result$2[3bv32] else v291$2);
    $$15$0bv32$1 := (if p40$1 then v288$1 else $$15$0bv32$1);
    $$15$0bv32$2 := (if p40$2 then v288$2 else $$15$0bv32$2);
    $$15$1bv32$1 := (if p40$1 then v289$1 else $$15$1bv32$1);
    $$15$1bv32$2 := (if p40$2 then v289$2 else $$15$1bv32$2);
    $$15$2bv32$1 := (if p40$1 then v290$1 else $$15$2bv32$1);
    $$15$2bv32$2 := (if p40$2 then v290$2 else $$15$2bv32$2);
    $$15$3bv32$1 := (if p40$1 then v291$1 else $$15$3bv32$1);
    $$15$3bv32$2 := (if p40$2 then v291$2 else $$15$3bv32$2);
    v292$1 := (if p40$1 then $$15$0bv32$1 else v292$1);
    v292$2 := (if p40$2 then $$15$0bv32$2 else v292$2);
    v293$1 := (if p40$1 then $$15$1bv32$1 else v293$1);
    v293$2 := (if p40$2 then $$15$1bv32$2 else v293$2);
    v294$1 := (if p40$1 then $$15$2bv32$1 else v294$1);
    v294$2 := (if p40$2 then $$15$2bv32$2 else v294$2);
    v295$1 := (if p40$1 then $$15$3bv32$1 else v295$1);
    v295$2 := (if p40$2 then $$15$3bv32$2 else v295$2);
    $$32$0bv32$1 := (if p40$1 then v292$1 else $$32$0bv32$1);
    $$32$0bv32$2 := (if p40$2 then v292$2 else $$32$0bv32$2);
    $$32$1bv32$1 := (if p40$1 then v293$1 else $$32$1bv32$1);
    $$32$1bv32$2 := (if p40$2 then v293$2 else $$32$1bv32$2);
    $$32$2bv32$1 := (if p40$1 then v294$1 else $$32$2bv32$1);
    $$32$2bv32$2 := (if p40$2 then v294$2 else $$32$2bv32$2);
    $$32$3bv32$1 := (if p40$1 then v295$1 else $$32$3bv32$1);
    $$32$3bv32$2 := (if p40$2 then v295$2 else $$32$3bv32$2);
    v296$1 := (if p40$1 then $$32$0bv32$1 else v296$1);
    v296$2 := (if p40$2 then $$32$0bv32$2 else v296$2);
    $$output$0bv32$1 := (if p40$1 then v296$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p40$2 then v296$2 else $$output$0bv32$2);
    v297$1 := (if p40$1 then $$32$1bv32$1 else v297$1);
    v297$2 := (if p40$2 then $$32$1bv32$2 else v297$2);
    $$output$1bv32$1 := (if p40$1 then v297$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p40$2 then v297$2 else $$output$1bv32$2);
    v298$1 := (if p40$1 then $$32$2bv32$1 else v298$1);
    v298$2 := (if p40$2 then $$32$2bv32$2 else v298$2);
    $$output$2bv32$1 := (if p40$1 then v298$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p40$2 then v298$2 else $$output$2bv32$2);
    v299$1 := (if p40$1 then $$32$3bv32$1 else v299$1);
    v299$2 := (if p40$2 then $$32$3bv32$2 else v299$2);
    $$output$3bv32$1 := (if p40$1 then v299$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p40$2 then v299$2 else $$output$3bv32$2);
    v300$1 := BV32_UREM(local_id_x$1, 4bv32) == 3bv32;
    v300$2 := BV32_UREM(local_id_x$2, 4bv32) == 3bv32;
    p42$1 := (if v300$1 then v300$1 else p42$1);
    p42$2 := (if v300$2 then v300$2 else p42$2);
    v301$1 := (if p42$1 then $$result$1[4bv32] else v301$1);
    v301$2 := (if p42$2 then $$result$2[4bv32] else v301$2);
    v302$1 := (if p42$1 then $$result$1[5bv32] else v302$1);
    v302$2 := (if p42$2 then $$result$2[5bv32] else v302$2);
    v303$1 := (if p42$1 then $$result$1[6bv32] else v303$1);
    v303$2 := (if p42$2 then $$result$2[6bv32] else v303$2);
    v304$1 := (if p42$1 then $$result$1[7bv32] else v304$1);
    v304$2 := (if p42$2 then $$result$2[7bv32] else v304$2);
    $$16$0bv32$1 := (if p42$1 then v301$1 else $$16$0bv32$1);
    $$16$0bv32$2 := (if p42$2 then v301$2 else $$16$0bv32$2);
    $$16$1bv32$1 := (if p42$1 then v302$1 else $$16$1bv32$1);
    $$16$1bv32$2 := (if p42$2 then v302$2 else $$16$1bv32$2);
    $$16$2bv32$1 := (if p42$1 then v303$1 else $$16$2bv32$1);
    $$16$2bv32$2 := (if p42$2 then v303$2 else $$16$2bv32$2);
    $$16$3bv32$1 := (if p42$1 then v304$1 else $$16$3bv32$1);
    $$16$3bv32$2 := (if p42$2 then v304$2 else $$16$3bv32$2);
    v305$1 := (if p42$1 then $$16$0bv32$1 else v305$1);
    v305$2 := (if p42$2 then $$16$0bv32$2 else v305$2);
    v306$1 := (if p42$1 then $$16$1bv32$1 else v306$1);
    v306$2 := (if p42$2 then $$16$1bv32$2 else v306$2);
    v307$1 := (if p42$1 then $$16$2bv32$1 else v307$1);
    v307$2 := (if p42$2 then $$16$2bv32$2 else v307$2);
    v308$1 := (if p42$1 then $$16$3bv32$1 else v308$1);
    v308$2 := (if p42$2 then $$16$3bv32$2 else v308$2);
    $$33$0bv32$1 := (if p42$1 then v305$1 else $$33$0bv32$1);
    $$33$0bv32$2 := (if p42$2 then v305$2 else $$33$0bv32$2);
    $$33$1bv32$1 := (if p42$1 then v306$1 else $$33$1bv32$1);
    $$33$1bv32$2 := (if p42$2 then v306$2 else $$33$1bv32$2);
    $$33$2bv32$1 := (if p42$1 then v307$1 else $$33$2bv32$1);
    $$33$2bv32$2 := (if p42$2 then v307$2 else $$33$2bv32$2);
    $$33$3bv32$1 := (if p42$1 then v308$1 else $$33$3bv32$1);
    $$33$3bv32$2 := (if p42$2 then v308$2 else $$33$3bv32$2);
    v309$1 := (if p42$1 then $$33$0bv32$1 else v309$1);
    v309$2 := (if p42$2 then $$33$0bv32$2 else v309$2);
    $$output$0bv32$1 := (if p42$1 then v309$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p42$2 then v309$2 else $$output$0bv32$2);
    v310$1 := (if p42$1 then $$33$1bv32$1 else v310$1);
    v310$2 := (if p42$2 then $$33$1bv32$2 else v310$2);
    $$output$1bv32$1 := (if p42$1 then v310$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p42$2 then v310$2 else $$output$1bv32$2);
    v311$1 := (if p42$1 then $$33$2bv32$1 else v311$1);
    v311$2 := (if p42$2 then $$33$2bv32$2 else v311$2);
    $$output$2bv32$1 := (if p42$1 then v311$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p42$2 then v311$2 else $$output$2bv32$2);
    v312$1 := (if p42$1 then $$33$3bv32$1 else v312$1);
    v312$2 := (if p42$2 then $$33$3bv32$2 else v312$2);
    $$output$3bv32$1 := (if p42$1 then v312$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p42$2 then v312$2 else $$output$3bv32$2);
    v313$1 := BV32_UREM(local_id_x$1, 4bv32) == 0bv32;
    v313$2 := BV32_UREM(local_id_x$2, 4bv32) == 0bv32;
    p44$1 := (if v313$1 then v313$1 else p44$1);
    p44$2 := (if v313$2 then v313$2 else p44$2);
    v314$1 := (if p44$1 then $$result$1[8bv32] else v314$1);
    v314$2 := (if p44$2 then $$result$2[8bv32] else v314$2);
    v315$1 := (if p44$1 then $$result$1[9bv32] else v315$1);
    v315$2 := (if p44$2 then $$result$2[9bv32] else v315$2);
    v316$1 := (if p44$1 then $$result$1[10bv32] else v316$1);
    v316$2 := (if p44$2 then $$result$2[10bv32] else v316$2);
    v317$1 := (if p44$1 then $$result$1[11bv32] else v317$1);
    v317$2 := (if p44$2 then $$result$2[11bv32] else v317$2);
    $$17$0bv32$1 := (if p44$1 then v314$1 else $$17$0bv32$1);
    $$17$0bv32$2 := (if p44$2 then v314$2 else $$17$0bv32$2);
    $$17$1bv32$1 := (if p44$1 then v315$1 else $$17$1bv32$1);
    $$17$1bv32$2 := (if p44$2 then v315$2 else $$17$1bv32$2);
    $$17$2bv32$1 := (if p44$1 then v316$1 else $$17$2bv32$1);
    $$17$2bv32$2 := (if p44$2 then v316$2 else $$17$2bv32$2);
    $$17$3bv32$1 := (if p44$1 then v317$1 else $$17$3bv32$1);
    $$17$3bv32$2 := (if p44$2 then v317$2 else $$17$3bv32$2);
    v318$1 := (if p44$1 then $$17$0bv32$1 else v318$1);
    v318$2 := (if p44$2 then $$17$0bv32$2 else v318$2);
    v319$1 := (if p44$1 then $$17$1bv32$1 else v319$1);
    v319$2 := (if p44$2 then $$17$1bv32$2 else v319$2);
    v320$1 := (if p44$1 then $$17$2bv32$1 else v320$1);
    v320$2 := (if p44$2 then $$17$2bv32$2 else v320$2);
    v321$1 := (if p44$1 then $$17$3bv32$1 else v321$1);
    v321$2 := (if p44$2 then $$17$3bv32$2 else v321$2);
    $$34$0bv32$1 := (if p44$1 then v318$1 else $$34$0bv32$1);
    $$34$0bv32$2 := (if p44$2 then v318$2 else $$34$0bv32$2);
    $$34$1bv32$1 := (if p44$1 then v319$1 else $$34$1bv32$1);
    $$34$1bv32$2 := (if p44$2 then v319$2 else $$34$1bv32$2);
    $$34$2bv32$1 := (if p44$1 then v320$1 else $$34$2bv32$1);
    $$34$2bv32$2 := (if p44$2 then v320$2 else $$34$2bv32$2);
    $$34$3bv32$1 := (if p44$1 then v321$1 else $$34$3bv32$1);
    $$34$3bv32$2 := (if p44$2 then v321$2 else $$34$3bv32$2);
    v322$1 := (if p44$1 then $$34$0bv32$1 else v322$1);
    v322$2 := (if p44$2 then $$34$0bv32$2 else v322$2);
    $$output$0bv32$1 := (if p44$1 then v322$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p44$2 then v322$2 else $$output$0bv32$2);
    v323$1 := (if p44$1 then $$34$1bv32$1 else v323$1);
    v323$2 := (if p44$2 then $$34$1bv32$2 else v323$2);
    $$output$1bv32$1 := (if p44$1 then v323$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p44$2 then v323$2 else $$output$1bv32$2);
    v324$1 := (if p44$1 then $$34$2bv32$1 else v324$1);
    v324$2 := (if p44$2 then $$34$2bv32$2 else v324$2);
    $$output$2bv32$1 := (if p44$1 then v324$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p44$2 then v324$2 else $$output$2bv32$2);
    v325$1 := (if p44$1 then $$34$3bv32$1 else v325$1);
    v325$2 := (if p44$2 then $$34$3bv32$2 else v325$2);
    $$output$3bv32$1 := (if p44$1 then v325$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p44$2 then v325$2 else $$output$3bv32$2);
    v326$1 := BV32_UREM(local_id_x$1, 4bv32) == 1bv32;
    v326$2 := BV32_UREM(local_id_x$2, 4bv32) == 1bv32;
    p46$1 := (if v326$1 then v326$1 else p46$1);
    p46$2 := (if v326$2 then v326$2 else p46$2);
    v327$1 := (if p46$1 then $$result$1[12bv32] else v327$1);
    v327$2 := (if p46$2 then $$result$2[12bv32] else v327$2);
    v328$1 := (if p46$1 then $$result$1[13bv32] else v328$1);
    v328$2 := (if p46$2 then $$result$2[13bv32] else v328$2);
    v329$1 := (if p46$1 then $$result$1[14bv32] else v329$1);
    v329$2 := (if p46$2 then $$result$2[14bv32] else v329$2);
    v330$1 := (if p46$1 then $$result$1[15bv32] else v330$1);
    v330$2 := (if p46$2 then $$result$2[15bv32] else v330$2);
    $$18$0bv32$1 := (if p46$1 then v327$1 else $$18$0bv32$1);
    $$18$0bv32$2 := (if p46$2 then v327$2 else $$18$0bv32$2);
    $$18$1bv32$1 := (if p46$1 then v328$1 else $$18$1bv32$1);
    $$18$1bv32$2 := (if p46$2 then v328$2 else $$18$1bv32$2);
    $$18$2bv32$1 := (if p46$1 then v329$1 else $$18$2bv32$1);
    $$18$2bv32$2 := (if p46$2 then v329$2 else $$18$2bv32$2);
    $$18$3bv32$1 := (if p46$1 then v330$1 else $$18$3bv32$1);
    $$18$3bv32$2 := (if p46$2 then v330$2 else $$18$3bv32$2);
    v331$1 := (if p46$1 then $$18$0bv32$1 else v331$1);
    v331$2 := (if p46$2 then $$18$0bv32$2 else v331$2);
    v332$1 := (if p46$1 then $$18$1bv32$1 else v332$1);
    v332$2 := (if p46$2 then $$18$1bv32$2 else v332$2);
    v333$1 := (if p46$1 then $$18$2bv32$1 else v333$1);
    v333$2 := (if p46$2 then $$18$2bv32$2 else v333$2);
    v334$1 := (if p46$1 then $$18$3bv32$1 else v334$1);
    v334$2 := (if p46$2 then $$18$3bv32$2 else v334$2);
    $$35$0bv32$1 := (if p46$1 then v331$1 else $$35$0bv32$1);
    $$35$0bv32$2 := (if p46$2 then v331$2 else $$35$0bv32$2);
    $$35$1bv32$1 := (if p46$1 then v332$1 else $$35$1bv32$1);
    $$35$1bv32$2 := (if p46$2 then v332$2 else $$35$1bv32$2);
    $$35$2bv32$1 := (if p46$1 then v333$1 else $$35$2bv32$1);
    $$35$2bv32$2 := (if p46$2 then v333$2 else $$35$2bv32$2);
    $$35$3bv32$1 := (if p46$1 then v334$1 else $$35$3bv32$1);
    $$35$3bv32$2 := (if p46$2 then v334$2 else $$35$3bv32$2);
    v335$1 := (if p46$1 then $$35$0bv32$1 else v335$1);
    v335$2 := (if p46$2 then $$35$0bv32$2 else v335$2);
    $$output$0bv32$1 := (if p46$1 then v335$1 else $$output$0bv32$1);
    $$output$0bv32$2 := (if p46$2 then v335$2 else $$output$0bv32$2);
    v336$1 := (if p46$1 then $$35$1bv32$1 else v336$1);
    v336$2 := (if p46$2 then $$35$1bv32$2 else v336$2);
    $$output$1bv32$1 := (if p46$1 then v336$1 else $$output$1bv32$1);
    $$output$1bv32$2 := (if p46$2 then v336$2 else $$output$1bv32$2);
    v337$1 := (if p46$1 then $$35$2bv32$1 else v337$1);
    v337$2 := (if p46$2 then $$35$2bv32$2 else v337$2);
    $$output$2bv32$1 := (if p46$1 then v337$1 else $$output$2bv32$1);
    $$output$2bv32$2 := (if p46$2 then v337$2 else $$output$2bv32$2);
    v338$1 := (if p46$1 then $$35$3bv32$1 else v338$1);
    v338$2 := (if p46$2 then $$35$3bv32$2 else v338$2);
    $$output$3bv32$1 := (if p46$1 then v338$1 else $$output$3bv32$1);
    $$output$3bv32$2 := (if p46$2 then v338$2 else $$output$3bv32$2);
    v339$1 := $$output$0bv32$1;
    v339$2 := $$output$0bv32$2;
    call {:sourceloc} {:sourceloc_num 662} _LOG_WRITE_$$integral_image(true, BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 12bv32), 4bv32), v339$1, $$integral_image[BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 12bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 12bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 662} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 662} _CHECK_WRITE_$$integral_image(true, BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 12bv32), 4bv32), v339$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 12bv32), 4bv32)] := v339$1;
    $$integral_image[BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 12bv32), 4bv32)] := v339$2;
    v340$1 := $$output$1bv32$1;
    v340$2 := $$output$1bv32$2;
    call {:sourceloc} {:sourceloc_num 664} _LOG_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 12bv32), 4bv32), 1bv32), v340$1, $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 12bv32), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 12bv32), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 664} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 664} _CHECK_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 12bv32), 4bv32), 1bv32), v340$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 12bv32), 4bv32), 1bv32)] := v340$1;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 12bv32), 4bv32), 1bv32)] := v340$2;
    v341$1 := $$output$2bv32$1;
    v341$2 := $$output$2bv32$2;
    call {:sourceloc} {:sourceloc_num 666} _LOG_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 12bv32), 4bv32), 2bv32), v341$1, $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 12bv32), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 12bv32), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 666} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 666} _CHECK_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 12bv32), 4bv32), 2bv32), v341$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 12bv32), 4bv32), 2bv32)] := v341$1;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 12bv32), 4bv32), 2bv32)] := v341$2;
    v342$1 := $$output$3bv32$1;
    v342$2 := $$output$3bv32$2;
    call {:sourceloc} {:sourceloc_num 668} _LOG_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 12bv32), 4bv32), 3bv32), v342$1, $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 12bv32), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 12bv32), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 668} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 668} _CHECK_WRITE_$$integral_image(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 12bv32), 4bv32), 3bv32), v342$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$integral_image"} true;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$1, 480bv32), BV32_UREM(BV32_ADD(local_id_x$1, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$1, 4bv32), 16bv32)), 12bv32), 4bv32), 3bv32)] := v342$1;
    $$integral_image[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_x$2, 480bv32), BV32_UREM(BV32_ADD(local_id_x$2, 2bv32), 4bv32)), BV32_MUL(BV32_UDIV(local_id_x$2, 4bv32), 16bv32)), 12bv32), 4bv32), 3bv32)] := v342$2;
    return;

  $truebb19:
    assume {:partition} v228 && v228;
    v229$1 := $$result$1[$i8.0];
    v229$2 := $$result$2[$i8.0];
    call {:sourceloc_num 441} v230$1, v230$2 := $_Z10__shfl_xoriii(1bv32, 32bv32, v229$1, v229$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10__shfl_xoriii"} true;
    $$result$1[$i8.0] := v230$1;
    $$result$2[$i8.0] := v230$2;
    $i8.0 := BV32_ADD($i8.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $55;

  $34.backedge:
    assume {:backedge} p13$1 || p13$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $34;

  $26.backedge:
    assume {:backedge} p7$1 || p7$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $26;

  $truebb2:
    assume {:partition} v76 && v76;
    call {:sourceloc_num 141} v77$1, v77$2 := $_Z9__shfl_upiii(32bv32, true, $sum.0$1, $i3.0, true, $sum.0$2, $i3.0);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z9__shfl_upiii"} true;
    v78$1 := BV32_UGE(v4$1, $i3.0);
    v78$2 := BV32_UGE(v4$2, $i3.0);
    p1$1 := (if v78$1 then v78$1 else p1$1);
    p1$2 := (if v78$2 then v78$2 else p1$2);
    p0$1 := (if !v78$1 then !v78$1 else p0$1);
    p0$2 := (if !v78$2 then !v78$2 else p0$2);
    $sum.1$1 := (if p0$1 then $sum.0$1 else $sum.1$1);
    $sum.1$2 := (if p0$2 then $sum.0$2 else $sum.1$2);
    $i4.0$1 := (if p1$1 then 0bv32 else $i4.0$1);
    $i4.0$2 := (if p1$2 then 0bv32 else $i4.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_4_0"} true;
    goto $16;

  $16:
    assume {:captureState "loop_head_state_4"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 143} p2$1 ==> true;
    v79$1 := (if p2$1 then BV32_SLT($i4.0$1, 16bv32) else v79$1);
    v79$2 := (if p2$2 then BV32_SLT($i4.0$2, 16bv32) else v79$2);
    p3$1 := false;
    p3$2 := false;
    p3$1 := (if p2$1 && v79$1 then v79$1 else p3$1);
    p3$2 := (if p2$2 && v79$2 then v79$2 else p3$2);
    p2$1 := (if p2$1 && !v79$1 then v79$1 else p2$1);
    p2$2 := (if p2$2 && !v79$2 then v79$2 else p2$2);
    v80$1 := (if p3$1 then $$result$1[$i4.0$1] else v80$1);
    v80$2 := (if p3$2 then $$result$2[$i4.0$2] else v80$2);
    $$result$1[$i4.0$1] := (if p3$1 then BV32_ADD(v80$1, v77$1) else $$result$1[$i4.0$1]);
    $$result$2[$i4.0$2] := (if p3$2 then BV32_ADD(v80$2, v77$2) else $$result$2[$i4.0$2]);
    $i4.0$1 := (if p3$1 then BV32_ADD($i4.0$1, 1bv32) else $i4.0$1);
    $i4.0$2 := (if p3$2 then BV32_ADD($i4.0$2, 1bv32) else $i4.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $16.backedge, $16.tail;

  $16.tail:
    assume !p2$1 && !p2$2;
    $sum.1$1 := (if p1$1 then BV32_ADD($sum.0$1, v77$1) else $sum.1$1);
    $sum.1$2 := (if p1$2 then BV32_ADD($sum.0$2, v77$2) else $sum.1$2);
    $sum.0$1, $i3.0 := $sum.1$1, BV32_MUL($i3.0, 2bv32);
    $sum.0$2 := $sum.1$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $13;

  $16.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_4_0"} true;
    goto $16;

  $truebb1:
    assume {:partition} v72 && v72;
    v73$1 := $$result$1[11bv32];
    v73$2 := $$result$2[11bv32];
    v74$1 := $$result$1[$i2.0];
    v74$2 := $$result$2[$i2.0];
    $$result$1[$i2.0] := BV32_ADD(v74$1, v73$1);
    $$result$2[$i2.0] := BV32_ADD(v74$2, v73$2);
    $i2.0 := BV32_ADD($i2.0, 1bv32);
    assume {:captureState "loop_back_edge_state_5_0"} true;
    goto $9;

  $truebb0:
    assume {:partition} v69 && v69;
    v70$1 := $$result$1[7bv32];
    v70$2 := $$result$2[7bv32];
    v71$1 := $$result$1[$i1.0];
    v71$2 := $$result$2[$i1.0];
    $$result$1[$i1.0] := BV32_ADD(v71$1, v70$1);
    $$result$2[$i1.0] := BV32_ADD(v71$2, v70$2);
    $i1.0 := BV32_ADD($i1.0, 1bv32);
    assume {:captureState "loop_back_edge_state_6_0"} true;
    goto $5;

  $truebb:
    assume {:partition} v66 && v66;
    v67$1 := $$result$1[3bv32];
    v67$2 := $$result$2[3bv32];
    v68$1 := $$result$1[$i.0];
    v68$2 := $$result$2[$i.0];
    $$result$1[$i.0] := BV32_ADD(v68$1, v67$1);
    $$result$2[$i.0] := BV32_ADD(v68$2, v67$2);
    $i.0 := BV32_ADD($i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_7_0"} true;
    goto $1;
}



procedure {:source_name "_Z9__shfl_upiii"} $_Z9__shfl_upiii($2: bv32, _P$1: bool, $0$1: bv32, $1$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);
  requires _P$1 ==> $2 == 32bv32;
  requires _P$2 ==> $2 == 32bv32;



procedure {:source_name "_Z10__shfl_xoriii"} $_Z10__shfl_xoriii($1: bv32, $2: bv32, $0$1: bv32, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);
  requires $2 == 32bv32;



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 120bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1080bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums, $$integral_image, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums, $$integral_image, _TRACKING;



var $$0$0bv32$1: bv8;

var $$0$0bv32$2: bv8;

var $$0$1bv32$1: bv8;

var $$0$1bv32$2: bv8;

var $$0$2bv32$1: bv8;

var $$0$2bv32$2: bv8;

var $$0$3bv32$1: bv8;

var $$0$3bv32$2: bv8;

var $$1$0bv32$1: bv8;

var $$1$0bv32$2: bv8;

var $$1$1bv32$1: bv8;

var $$1$1bv32$2: bv8;

var $$1$2bv32$1: bv8;

var $$1$2bv32$2: bv8;

var $$1$3bv32$1: bv8;

var $$1$3bv32$2: bv8;

var $$2$0bv32$1: bv8;

var $$2$0bv32$2: bv8;

var $$2$1bv32$1: bv8;

var $$2$1bv32$2: bv8;

var $$2$2bv32$1: bv8;

var $$2$2bv32$2: bv8;

var $$2$3bv32$1: bv8;

var $$2$3bv32$2: bv8;

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

var $$6$0bv32$1: bv32;

var $$6$0bv32$2: bv32;

var $$6$1bv32$1: bv32;

var $$6$1bv32$2: bv32;

var $$6$2bv32$1: bv32;

var $$6$2bv32$2: bv32;

var $$6$3bv32$1: bv32;

var $$6$3bv32$2: bv32;

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

var $$12$0bv32$1: bv32;

var $$12$0bv32$2: bv32;

var $$12$1bv32$1: bv32;

var $$12$1bv32$2: bv32;

var $$12$2bv32$1: bv32;

var $$12$2bv32$2: bv32;

var $$12$3bv32$1: bv32;

var $$12$3bv32$2: bv32;

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

var $$19$0bv32$1: bv8;

var $$19$0bv32$2: bv8;

var $$19$1bv32$1: bv8;

var $$19$1bv32$2: bv8;

var $$19$2bv32$1: bv8;

var $$19$2bv32$2: bv8;

var $$19$3bv32$1: bv8;

var $$19$3bv32$2: bv8;

var $$data$0bv32$1: bv32;

var $$data$0bv32$2: bv32;

var $$data$1bv32$1: bv32;

var $$data$1bv32$2: bv32;

var $$data$2bv32$1: bv32;

var $$data$2bv32$2: bv32;

var $$data$3bv32$1: bv32;

var $$data$3bv32$2: bv32;

var $$a$0bv32$1: bv8;

var $$a$0bv32$2: bv8;

var $$a$1bv32$1: bv8;

var $$a$1bv32$2: bv8;

var $$a$2bv32$1: bv8;

var $$a$2bv32$2: bv8;

var $$a$3bv32$1: bv8;

var $$a$3bv32$2: bv8;

var $$b$0bv32$1: bv8;

var $$b$0bv32$2: bv8;

var $$b$1bv32$1: bv8;

var $$b$1bv32$2: bv8;

var $$b$2bv32$1: bv8;

var $$b$2bv32$2: bv8;

var $$b$3bv32$1: bv8;

var $$b$3bv32$2: bv8;

var $$c$0bv32$1: bv8;

var $$c$0bv32$2: bv8;

var $$c$1bv32$1: bv8;

var $$c$1bv32$2: bv8;

var $$c$2bv32$1: bv8;

var $$c$2bv32$2: bv8;

var $$c$3bv32$1: bv8;

var $$c$3bv32$2: bv8;

var $$d$0bv32$1: bv8;

var $$d$0bv32$2: bv8;

var $$d$1bv32$1: bv8;

var $$d$1bv32$2: bv8;

var $$d$2bv32$1: bv8;

var $$d$2bv32$2: bv8;

var $$d$3bv32$1: bv8;

var $$d$3bv32$2: bv8;

var $$output$0bv32$1: bv32;

var $$output$0bv32$2: bv32;

var $$output$1bv32$1: bv32;

var $$output$1bv32$2: bv32;

var $$output$2bv32$1: bv32;

var $$output$2bv32$2: bv32;

var $$output$3bv32$1: bv32;

var $$output$3bv32$2: bv32;

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

var $$26$0bv32$1: bv32;

var $$26$0bv32$2: bv32;

var $$26$1bv32$1: bv32;

var $$26$1bv32$2: bv32;

var $$26$2bv32$1: bv32;

var $$26$2bv32$2: bv32;

var $$26$3bv32$1: bv32;

var $$26$3bv32$2: bv32;

var $$27$0bv32$1: bv32;

var $$27$0bv32$2: bv32;

var $$27$1bv32$1: bv32;

var $$27$1bv32$2: bv32;

var $$27$2bv32$1: bv32;

var $$27$2bv32$2: bv32;

var $$27$3bv32$1: bv32;

var $$27$3bv32$2: bv32;

var $$28$0bv32$1: bv32;

var $$28$0bv32$2: bv32;

var $$28$1bv32$1: bv32;

var $$28$1bv32$2: bv32;

var $$28$2bv32$1: bv32;

var $$28$2bv32$2: bv32;

var $$28$3bv32$1: bv32;

var $$28$3bv32$2: bv32;

var $$29$0bv32$1: bv32;

var $$29$0bv32$2: bv32;

var $$29$1bv32$1: bv32;

var $$29$1bv32$2: bv32;

var $$29$2bv32$1: bv32;

var $$29$2bv32$2: bv32;

var $$29$3bv32$1: bv32;

var $$29$3bv32$2: bv32;

var $$30$0bv32$1: bv32;

var $$30$0bv32$2: bv32;

var $$30$1bv32$1: bv32;

var $$30$1bv32$2: bv32;

var $$30$2bv32$1: bv32;

var $$30$2bv32$2: bv32;

var $$30$3bv32$1: bv32;

var $$30$3bv32$2: bv32;

var $$31$0bv32$1: bv32;

var $$31$0bv32$2: bv32;

var $$31$1bv32$1: bv32;

var $$31$1bv32$2: bv32;

var $$31$2bv32$1: bv32;

var $$31$2bv32$2: bv32;

var $$31$3bv32$1: bv32;

var $$31$3bv32$2: bv32;

var $$32$0bv32$1: bv32;

var $$32$0bv32$2: bv32;

var $$32$1bv32$1: bv32;

var $$32$1bv32$2: bv32;

var $$32$2bv32$1: bv32;

var $$32$2bv32$2: bv32;

var $$32$3bv32$1: bv32;

var $$32$3bv32$2: bv32;

var $$33$0bv32$1: bv32;

var $$33$0bv32$2: bv32;

var $$33$1bv32$1: bv32;

var $$33$1bv32$2: bv32;

var $$33$2bv32$1: bv32;

var $$33$2bv32$2: bv32;

var $$33$3bv32$1: bv32;

var $$33$3bv32$2: bv32;

var $$34$0bv32$1: bv32;

var $$34$0bv32$2: bv32;

var $$34$1bv32$1: bv32;

var $$34$1bv32$2: bv32;

var $$34$2bv32$1: bv32;

var $$34$2bv32$2: bv32;

var $$34$3bv32$1: bv32;

var $$34$3bv32$2: bv32;

var $$35$0bv32$1: bv32;

var $$35$0bv32$2: bv32;

var $$35$1bv32$1: bv32;

var $$35$1bv32$2: bv32;

var $$35$2bv32$1: bv32;

var $$35$2bv32$2: bv32;

var $$35$3bv32$1: bv32;

var $$35$3bv32$2: bv32;

const _WATCHED_VALUE_$$img: bv32;

procedure {:inline 1} _LOG_READ_$$img(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$img;



implementation {:inline 1} _LOG_READ_$$img(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then true else _READ_HAS_OCCURRED_$$img);
    return;
}



procedure _CHECK_READ_$$img(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$img);
  requires {:source_name "img"} {:array "$$img"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$img: bool;

procedure {:inline 1} _LOG_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$img, _WRITE_READ_BENIGN_FLAG_$$img;



implementation {:inline 1} _LOG_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then true else _WRITE_HAS_OCCURRED_$$img);
    _WRITE_READ_BENIGN_FLAG_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$img);
    return;
}



procedure _CHECK_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img != _value);
  requires {:source_name "img"} {:array "$$img"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img != _value);
  requires {:source_name "img"} {:array "$$img"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$img(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$img;



implementation {:inline 1} _LOG_ATOMIC_$$img(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$img);
    return;
}



procedure _CHECK_ATOMIC_$$img(_P: bool, _offset: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);
  requires {:source_name "img"} {:array "$$img"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$img(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$img;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$img(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$img := (if _P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$img);
    return;
}



const _WATCHED_VALUE_$$integral_image: bv32;

procedure {:inline 1} _LOG_READ_$$integral_image(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$integral_image;



implementation {:inline 1} _LOG_READ_$$integral_image(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$integral_image := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$integral_image == _value then true else _READ_HAS_OCCURRED_$$integral_image);
    return;
}



procedure _CHECK_READ_$$integral_image(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "integral_image"} {:array "$$integral_image"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$integral_image && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$integral_image);
  requires {:source_name "integral_image"} {:array "$$integral_image"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$integral_image && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$integral_image: bool;

procedure {:inline 1} _LOG_WRITE_$$integral_image(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$integral_image, _WRITE_READ_BENIGN_FLAG_$$integral_image;



implementation {:inline 1} _LOG_WRITE_$$integral_image(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$integral_image := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$integral_image == _value then true else _WRITE_HAS_OCCURRED_$$integral_image);
    _WRITE_READ_BENIGN_FLAG_$$integral_image := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$integral_image == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$integral_image);
    return;
}



procedure _CHECK_WRITE_$$integral_image(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "integral_image"} {:array "$$integral_image"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$integral_image && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$integral_image != _value);
  requires {:source_name "integral_image"} {:array "$$integral_image"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$integral_image && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$integral_image != _value);
  requires {:source_name "integral_image"} {:array "$$integral_image"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$integral_image && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$integral_image(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$integral_image;



implementation {:inline 1} _LOG_ATOMIC_$$integral_image(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$integral_image := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$integral_image);
    return;
}



procedure _CHECK_ATOMIC_$$integral_image(_P: bool, _offset: bv32);
  requires {:source_name "integral_image"} {:array "$$integral_image"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$integral_image && _WATCHED_OFFSET == _offset);
  requires {:source_name "integral_image"} {:array "$$integral_image"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$integral_image && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$integral_image;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$integral_image(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$integral_image := (if _P && _WRITE_HAS_OCCURRED_$$integral_image && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$integral_image);
    return;
}



const _WATCHED_VALUE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums;



implementation {:inline 1} _LOG_READ_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums == _value then true else _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums);
    return;
}



procedure _CHECK_READ_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sums"} {:array "$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sums"} {:array "$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums, _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums;



implementation {:inline 1} _LOG_WRITE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums);
    return;
}



procedure _CHECK_WRITE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sums"} {:array "$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sums"} {:array "$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sums"} {:array "$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(_P: bool, _offset: bv32);
  requires {:source_name "sums"} {:array "$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sums"} {:array "$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$integral_image;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$integral_image;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$integral_image;
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
    havoc $$integral_image;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$integral_image;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$integral_image;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$integral_image;
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
    havoc $$integral_image;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ18shfl_intimage_rowsP5uint4S0_E4sums;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
