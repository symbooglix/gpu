type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$id"} {:global} {:elem_width 32} {:source_name "id"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$id: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$id: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$id: bool;

var {:source_name "od"} {:global} $$od: [bv32]bv32;

axiom {:array_info "$$od"} {:global} {:elem_width 32} {:source_name "od"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$od: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$od: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$od: bool;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i16"} {:elem_width 32} {:source_name "a.i16"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i15"} {:elem_width 32} {:source_name "b.i15"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i14"} {:elem_width 32} {:source_name "b.i14"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$rgba.i13"} {:elem_width 32} {:source_name "rgba.i13"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$8"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$9"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i12"} {:elem_width 32} {:source_name "a.i12"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$10"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i11"} {:elem_width 32} {:source_name "b.i11"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$11"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$12"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$13"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i10"} {:elem_width 32} {:source_name "b.i10"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$14"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$15"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$rgba.i9"} {:elem_width 32} {:source_name "rgba.i9"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$rgba.i8"} {:elem_width 32} {:source_name "rgba.i8"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$16"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$17"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i7"} {:elem_width 32} {:source_name "b.i7"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$18"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$19"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$20"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i6"} {:elem_width 32} {:source_name "b.i6"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$21"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$22"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$23"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i5"} {:elem_width 32} {:source_name "a.i5"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$24"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$25"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i4"} {:elem_width 32} {:source_name "a.i4"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$26"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i"} {:elem_width 32} {:source_name "b.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$27"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$28"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$29"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$30"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i"} {:elem_width 32} {:source_name "a.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$rgba.i"} {:elem_width 32} {:source_name "rgba.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$31"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$t"} {:elem_width 32} {:source_name "t"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$32"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$33"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$34"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$35"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$36"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$37"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$38"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$39"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$40"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$41"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$42"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$43"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$44"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$45"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$46"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$47"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$48"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

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

function FDIV32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FP32_TO_UI32(bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV32_OR(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "d_boxfilter_rgba_y"} {:kernel} $_Z18d_boxfilter_rgba_yPjS_iii($w: bv32, $h: bv32, $r: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $w == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $h == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$id && !_WRITE_HAS_OCCURRED_$$id && !_ATOMIC_HAS_OCCURRED_$$id;
  requires !_READ_HAS_OCCURRED_$$od && !_WRITE_HAS_OCCURRED_$$od && !_ATOMIC_HAS_OCCURRED_$$od;
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
  modifies _WRITE_HAS_OCCURRED_$$od, _WRITE_READ_BENIGN_FLAG_$$od, _WRITE_READ_BENIGN_FLAG_$$od;



implementation {:source_name "d_boxfilter_rgba_y"} {:kernel} $_Z18d_boxfilter_rgba_yPjS_iii($w: bv32, $h: bv32, $r: bv32)
{
  var $y.0: bv32;
  var $y1.0: bv32;
  var $y2.0: bv32;
  var $y3.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1: bv32;
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
  var v7: bv32;
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
  var v28: bool;
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
  var v90: bool;
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
  var v103$1: bv32;
  var v103$2: bv32;
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
  var v177: bool;
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
  var v190$1: bv32;
  var v190$2: bv32;
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
  var v242$1: bv32;
  var v242$2: bv32;
  var v243$1: bv32;
  var v243$2: bv32;
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
  var v241$1: bv32;
  var v241$2: bv32;
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
  var v237$1: bv32;
  var v237$2: bv32;
  var v238$1: bv32;
  var v238$2: bv32;
  var v239$1: bv32;
  var v239$2: bv32;
  var v240$1: bv32;
  var v240$2: bv32;
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
  var v251$1: bv32;
  var v251$2: bv32;
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
  var v269$1: bv32;
  var v269$2: bv32;
  var v277$1: bv32;
  var v277$2: bv32;
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
  var v329$1: bv32;
  var v329$2: bv32;
  var v330$1: bv32;
  var v330$2: bv32;
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
  var v328$1: bv32;
  var v328$2: bv32;
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


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1 := FDIV32(1065353216bv32, SI32_TO_FP32(BV32_ADD(BV32_SHL($r, 1bv32), 1bv32)));
    havoc v2$1, v2$2;
    $$31$0bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(v2$1, 255bv32)), 998277249bv32);
    $$31$0bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(v2$2, 255bv32)), 998277249bv32);
    $$31$1bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v2$1, 8bv32), 255bv32)), 998277249bv32);
    $$31$1bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v2$2, 8bv32), 255bv32)), 998277249bv32);
    $$31$2bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v2$1, 16bv32), 255bv32)), 998277249bv32);
    $$31$2bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v2$2, 16bv32), 255bv32)), 998277249bv32);
    $$31$3bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v2$1, 24bv32), 255bv32)), 998277249bv32);
    $$31$3bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v2$2, 24bv32), 255bv32)), 998277249bv32);
    v3$1 := $$31$0bv32$1;
    v3$2 := $$31$0bv32$2;
    v4$1 := $$31$1bv32$1;
    v4$2 := $$31$1bv32$2;
    v5$1 := $$31$2bv32$1;
    v5$2 := $$31$2bv32$2;
    v6$1 := $$31$3bv32$1;
    v6$2 := $$31$3bv32$2;
    $$33$0bv32$1 := v3$1;
    $$33$0bv32$2 := v3$2;
    $$33$1bv32$1 := v4$1;
    $$33$1bv32$2 := v4$2;
    $$33$2bv32$1 := v5$1;
    $$33$2bv32$2 := v5$2;
    $$33$3bv32$1 := v6$1;
    $$33$3bv32$2 := v6$2;
    v7 := SI32_TO_FP32($r);
    v8$1 := $$33$0bv32$1;
    v8$2 := $$33$0bv32$2;
    v9$1 := $$33$1bv32$1;
    v9$2 := $$33$1bv32$2;
    v10$1 := $$33$2bv32$1;
    v10$2 := $$33$2bv32$2;
    v11$1 := $$33$3bv32$1;
    v11$2 := $$33$3bv32$2;
    $$a.i$0bv32$1 := v8$1;
    $$a.i$0bv32$2 := v8$2;
    $$a.i$1bv32$1 := v9$1;
    $$a.i$1bv32$2 := v9$2;
    $$a.i$2bv32$1 := v10$1;
    $$a.i$2bv32$2 := v10$2;
    $$a.i$3bv32$1 := v11$1;
    $$a.i$3bv32$2 := v11$2;
    v12$1 := $$a.i$0bv32$1;
    v12$2 := $$a.i$0bv32$2;
    v13$1 := $$a.i$1bv32$1;
    v13$2 := $$a.i$1bv32$2;
    v14$1 := $$a.i$2bv32$1;
    v14$2 := $$a.i$2bv32$2;
    v15$1 := $$a.i$3bv32$1;
    v15$2 := $$a.i$3bv32$2;
    $$29$0bv32$1 := FMUL32(v12$1, v7);
    $$29$0bv32$2 := FMUL32(v12$2, v7);
    $$29$1bv32$1 := FMUL32(v13$1, v7);
    $$29$1bv32$2 := FMUL32(v13$2, v7);
    $$29$2bv32$1 := FMUL32(v14$1, v7);
    $$29$2bv32$2 := FMUL32(v14$2, v7);
    $$29$3bv32$1 := FMUL32(v15$1, v7);
    $$29$3bv32$2 := FMUL32(v15$2, v7);
    v16$1 := $$29$0bv32$1;
    v16$2 := $$29$0bv32$2;
    v17$1 := $$29$1bv32$1;
    v17$2 := $$29$1bv32$2;
    v18$1 := $$29$2bv32$1;
    v18$2 := $$29$2bv32$2;
    v19$1 := $$29$3bv32$1;
    v19$2 := $$29$3bv32$2;
    $$30$0bv32$1 := v16$1;
    $$30$0bv32$2 := v16$2;
    $$30$1bv32$1 := v17$1;
    $$30$1bv32$2 := v17$2;
    $$30$2bv32$1 := v18$1;
    $$30$2bv32$2 := v18$2;
    $$30$3bv32$1 := v19$1;
    $$30$3bv32$2 := v19$2;
    v20$1 := $$30$0bv32$1;
    v20$2 := $$30$0bv32$2;
    v21$1 := $$30$1bv32$1;
    v21$2 := $$30$1bv32$2;
    v22$1 := $$30$2bv32$1;
    v22$2 := $$30$2bv32$2;
    v23$1 := $$30$3bv32$1;
    v23$2 := $$30$3bv32$2;
    $$32$0bv32$1 := v20$1;
    $$32$0bv32$2 := v20$2;
    $$32$1bv32$1 := v21$1;
    $$32$1bv32$2 := v21$2;
    $$32$2bv32$1 := v22$1;
    $$32$2bv32$2 := v22$2;
    $$32$3bv32$1 := v23$1;
    $$32$3bv32$2 := v23$2;
    v24$1 := $$32$0bv32$1;
    v24$2 := $$32$0bv32$2;
    $$t$0bv32$1 := v24$1;
    $$t$0bv32$2 := v24$2;
    v25$1 := $$32$1bv32$1;
    v25$2 := $$32$1bv32$2;
    $$t$1bv32$1 := v25$1;
    $$t$1bv32$2 := v25$2;
    v26$1 := $$32$2bv32$1;
    v26$2 := $$32$2bv32$2;
    $$t$2bv32$1 := v26$1;
    $$t$2bv32$2 := v26$2;
    v27$1 := $$32$3bv32$1;
    v27$2 := $$32$3bv32$2;
    $$t$3bv32$1 := v27$1;
    $$t$3bv32$2 := v27$2;
    $y.0 := 0bv32;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_3"} true;
    assert {:block_sourceloc} {:sourceloc_num 56} true;
    v28 := BV32_SLT($y.0, BV32_ADD($r, 1bv32));
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v28 && !v28;
    v54$1 := $$t$0bv32$1;
    v54$2 := $$t$0bv32$2;
    $$36$0bv32$1 := v54$1;
    $$36$0bv32$2 := v54$2;
    v55$1 := $$t$1bv32$1;
    v55$2 := $$t$1bv32$2;
    $$36$1bv32$1 := v55$1;
    $$36$1bv32$2 := v55$2;
    v56$1 := $$t$2bv32$1;
    v56$2 := $$t$2bv32$2;
    $$36$2bv32$1 := v56$1;
    $$36$2bv32$2 := v56$2;
    v57$1 := $$t$3bv32$1;
    v57$2 := $$t$3bv32$2;
    $$36$3bv32$1 := v57$1;
    $$36$3bv32$2 := v57$2;
    v58$1 := $$36$0bv32$1;
    v58$2 := $$36$0bv32$2;
    v59$1 := $$36$1bv32$1;
    v59$2 := $$36$1bv32$2;
    v60$1 := $$36$2bv32$1;
    v60$2 := $$36$2bv32$2;
    v61$1 := $$36$3bv32$1;
    v61$2 := $$36$3bv32$2;
    $$a.i4$0bv32$1 := v58$1;
    $$a.i4$0bv32$2 := v58$2;
    $$a.i4$1bv32$1 := v59$1;
    $$a.i4$1bv32$2 := v59$2;
    $$a.i4$2bv32$1 := v60$1;
    $$a.i4$2bv32$2 := v60$2;
    $$a.i4$3bv32$1 := v61$1;
    $$a.i4$3bv32$2 := v61$2;
    v62$1 := $$a.i4$0bv32$1;
    v62$2 := $$a.i4$0bv32$2;
    v63$1 := $$a.i4$1bv32$1;
    v63$2 := $$a.i4$1bv32$2;
    v64$1 := $$a.i4$2bv32$1;
    v64$2 := $$a.i4$2bv32$2;
    v65$1 := $$a.i4$3bv32$1;
    v65$2 := $$a.i4$3bv32$2;
    $$24$0bv32$1 := FMUL32(v62$1, v1);
    $$24$0bv32$2 := FMUL32(v62$2, v1);
    $$24$1bv32$1 := FMUL32(v63$1, v1);
    $$24$1bv32$2 := FMUL32(v63$2, v1);
    $$24$2bv32$1 := FMUL32(v64$1, v1);
    $$24$2bv32$2 := FMUL32(v64$2, v1);
    $$24$3bv32$1 := FMUL32(v65$1, v1);
    $$24$3bv32$2 := FMUL32(v65$2, v1);
    v66$1 := $$24$0bv32$1;
    v66$2 := $$24$0bv32$2;
    v67$1 := $$24$1bv32$1;
    v67$2 := $$24$1bv32$2;
    v68$1 := $$24$2bv32$1;
    v68$2 := $$24$2bv32$2;
    v69$1 := $$24$3bv32$1;
    v69$2 := $$24$3bv32$2;
    $$25$0bv32$1 := v66$1;
    $$25$0bv32$2 := v66$2;
    $$25$1bv32$1 := v67$1;
    $$25$1bv32$2 := v67$2;
    $$25$2bv32$1 := v68$1;
    $$25$2bv32$2 := v68$2;
    $$25$3bv32$1 := v69$1;
    $$25$3bv32$2 := v69$2;
    v70$1 := $$25$0bv32$1;
    v70$2 := $$25$0bv32$2;
    v71$1 := $$25$1bv32$1;
    v71$2 := $$25$1bv32$2;
    v72$1 := $$25$2bv32$1;
    v72$2 := $$25$2bv32$2;
    v73$1 := $$25$3bv32$1;
    v73$2 := $$25$3bv32$2;
    $$35$0bv32$1 := v70$1;
    $$35$0bv32$2 := v70$2;
    $$35$1bv32$1 := v71$1;
    $$35$1bv32$2 := v71$2;
    $$35$2bv32$1 := v72$1;
    $$35$2bv32$2 := v72$2;
    $$35$3bv32$1 := v73$1;
    $$35$3bv32$2 := v73$2;
    v74$1 := $$35$0bv32$1;
    v74$2 := $$35$0bv32$2;
    v75$1 := $$35$1bv32$1;
    v75$2 := $$35$1bv32$2;
    v76$1 := $$35$2bv32$1;
    v76$2 := $$35$2bv32$2;
    v77$1 := $$35$3bv32$1;
    v77$2 := $$35$3bv32$2;
    $$rgba.i9$0bv32$1 := v74$1;
    $$rgba.i9$0bv32$2 := v74$2;
    $$rgba.i9$1bv32$1 := v75$1;
    $$rgba.i9$1bv32$2 := v75$2;
    $$rgba.i9$2bv32$1 := v76$1;
    $$rgba.i9$2bv32$2 := v76$2;
    $$rgba.i9$3bv32$1 := v77$1;
    $$rgba.i9$3bv32$2 := v77$2;
    v78$1 := $$rgba.i9$0bv32$1;
    v78$2 := $$rgba.i9$0bv32$2;
    call {:sourceloc_num 158} v79$1, v79$2 := $__saturatef(v78$1, v78$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i9$0bv32$1 := v79$1;
    $$rgba.i9$0bv32$2 := v79$2;
    v80$1 := $$rgba.i9$1bv32$1;
    v80$2 := $$rgba.i9$1bv32$2;
    call {:sourceloc_num 161} v81$1, v81$2 := $__saturatef(v80$1, v80$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i9$1bv32$1 := v81$1;
    $$rgba.i9$1bv32$2 := v81$2;
    v82$1 := $$rgba.i9$2bv32$1;
    v82$2 := $$rgba.i9$2bv32$2;
    call {:sourceloc_num 164} v83$1, v83$2 := $__saturatef(v82$1, v82$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i9$2bv32$1 := v83$1;
    $$rgba.i9$2bv32$2 := v83$2;
    v84$1 := $$rgba.i9$3bv32$1;
    v84$2 := $$rgba.i9$3bv32$2;
    call {:sourceloc_num 167} v85$1, v85$2 := $__saturatef(v84$1, v84$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i9$3bv32$1 := v85$1;
    $$rgba.i9$3bv32$2 := v85$2;
    v86$1 := $$rgba.i9$3bv32$1;
    v86$2 := $$rgba.i9$3bv32$2;
    v87$1 := $$rgba.i9$2bv32$1;
    v87$2 := $$rgba.i9$2bv32$2;
    v88$1 := $$rgba.i9$1bv32$1;
    v88$2 := $$rgba.i9$1bv32$2;
    v89$1 := $$rgba.i9$0bv32$1;
    v89$2 := $$rgba.i9$0bv32$2;
    call {:sourceloc} {:sourceloc_num 173} _LOG_WRITE_$$od(true, v0$1, BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v86$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v87$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v88$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v89$1, 1132396544bv32))), $$od[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$od(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 173} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 173} _CHECK_WRITE_$$od(true, v0$2, BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v86$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v87$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v88$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v89$2, 1132396544bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$od"} true;
    $$od[v0$1] := BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v86$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v87$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v88$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v89$1, 1132396544bv32)));
    $$od[v0$2] := BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v86$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v87$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v88$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v89$2, 1132396544bv32)));
    $y1.0 := 1bv32;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_2"} true;
    assert {:block_sourceloc} {:sourceloc_num 174} true;
    v90 := BV32_SLT($y1.0, BV32_ADD($r, 1bv32));
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v90 && !v90;
    $y2.0 := BV32_ADD($r, 1bv32);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_1"} true;
    assert {:block_sourceloc} {:sourceloc_num 341} true;
    v177 := BV32_SLT($y2.0, BV32_SUB($h, $r));
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v177 && !v177;
    $y3.0 := BV32_SUB($h, $r);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $13;

  $13:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 508} true;
    v264 := BV32_SLT($y3.0, $h);
    goto $truebb2, $falsebb2;

  $falsebb2:
    assume {:partition} !v264 && !v264;
    return;

  $truebb2:
    assume {:partition} v264 && v264;
    havoc v265$1, v265$2;
    $$16$0bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(v265$1, 255bv32)), 998277249bv32);
    $$16$0bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(v265$2, 255bv32)), 998277249bv32);
    $$16$1bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v265$1, 8bv32), 255bv32)), 998277249bv32);
    $$16$1bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v265$2, 8bv32), 255bv32)), 998277249bv32);
    $$16$2bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v265$1, 16bv32), 255bv32)), 998277249bv32);
    $$16$2bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v265$2, 16bv32), 255bv32)), 998277249bv32);
    $$16$3bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v265$1, 24bv32), 255bv32)), 998277249bv32);
    $$16$3bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v265$2, 24bv32), 255bv32)), 998277249bv32);
    v266$1 := $$16$0bv32$1;
    v266$2 := $$16$0bv32$2;
    v267$1 := $$16$1bv32$1;
    v267$2 := $$16$1bv32$2;
    v268$1 := $$16$2bv32$1;
    v268$2 := $$16$2bv32$2;
    v269$1 := $$16$3bv32$1;
    v269$2 := $$16$3bv32$2;
    $$45$0bv32$1 := v266$1;
    $$45$0bv32$2 := v266$2;
    $$45$1bv32$1 := v267$1;
    $$45$1bv32$2 := v267$2;
    $$45$2bv32$1 := v268$1;
    $$45$2bv32$2 := v268$2;
    $$45$3bv32$1 := v269$1;
    $$45$3bv32$2 := v269$2;
    v270$1 := $$45$0bv32$1;
    v270$2 := $$45$0bv32$2;
    v271$1 := $$45$1bv32$1;
    v271$2 := $$45$1bv32$2;
    v272$1 := $$45$2bv32$1;
    v272$2 := $$45$2bv32$2;
    v273$1 := $$45$3bv32$1;
    v273$2 := $$45$3bv32$2;
    $$b.i7$0bv32$1 := v270$1;
    $$b.i7$0bv32$2 := v270$2;
    $$b.i7$1bv32$1 := v271$1;
    $$b.i7$1bv32$2 := v271$2;
    $$b.i7$2bv32$1 := v272$1;
    $$b.i7$2bv32$2 := v272$2;
    $$b.i7$3bv32$1 := v273$1;
    $$b.i7$3bv32$2 := v273$2;
    v274$1 := $$t$0bv32$1;
    v274$2 := $$t$0bv32$2;
    v275$1 := $$b.i7$0bv32$1;
    v275$2 := $$b.i7$0bv32$2;
    v276$1 := $$t$1bv32$1;
    v276$2 := $$t$1bv32$2;
    v277$1 := $$b.i7$1bv32$1;
    v277$2 := $$b.i7$1bv32$2;
    v278$1 := $$t$2bv32$1;
    v278$2 := $$t$2bv32$2;
    v279$1 := $$b.i7$2bv32$1;
    v279$2 := $$b.i7$2bv32$2;
    v280$1 := $$t$3bv32$1;
    v280$2 := $$t$3bv32$2;
    v281$1 := $$b.i7$3bv32$1;
    v281$2 := $$b.i7$3bv32$2;
    $$17$0bv32$1 := FADD32(v274$1, v275$1);
    $$17$0bv32$2 := FADD32(v274$2, v275$2);
    $$17$1bv32$1 := FADD32(v276$1, v277$1);
    $$17$1bv32$2 := FADD32(v276$2, v277$2);
    $$17$2bv32$1 := FADD32(v278$1, v279$1);
    $$17$2bv32$2 := FADD32(v278$2, v279$2);
    $$17$3bv32$1 := FADD32(v280$1, v281$1);
    $$17$3bv32$2 := FADD32(v280$2, v281$2);
    v282$1 := $$17$0bv32$1;
    v282$2 := $$17$0bv32$2;
    v283$1 := $$17$1bv32$1;
    v283$2 := $$17$1bv32$2;
    v284$1 := $$17$2bv32$1;
    v284$2 := $$17$2bv32$2;
    v285$1 := $$17$3bv32$1;
    v285$2 := $$17$3bv32$2;
    $$18$0bv32$1 := v282$1;
    $$18$0bv32$2 := v282$2;
    $$18$1bv32$1 := v283$1;
    $$18$1bv32$2 := v283$2;
    $$18$2bv32$1 := v284$1;
    $$18$2bv32$2 := v284$2;
    $$18$3bv32$1 := v285$1;
    $$18$3bv32$2 := v285$2;
    v286$1 := $$18$0bv32$1;
    v286$2 := $$18$0bv32$2;
    $$t$0bv32$1 := v286$1;
    $$t$0bv32$2 := v286$2;
    v287$1 := $$18$1bv32$1;
    v287$2 := $$18$1bv32$2;
    $$t$1bv32$1 := v287$1;
    $$t$1bv32$2 := v287$2;
    v288$1 := $$18$2bv32$1;
    v288$2 := $$18$2bv32$2;
    $$t$2bv32$1 := v288$1;
    $$t$2bv32$2 := v288$2;
    v289$1 := $$18$3bv32$1;
    v289$2 := $$18$3bv32$2;
    $$t$3bv32$1 := v289$1;
    $$t$3bv32$2 := v289$2;
    havoc v290$1, v290$2;
    $$19$0bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(v290$1, 255bv32)), 998277249bv32);
    $$19$0bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(v290$2, 255bv32)), 998277249bv32);
    $$19$1bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v290$1, 8bv32), 255bv32)), 998277249bv32);
    $$19$1bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v290$2, 8bv32), 255bv32)), 998277249bv32);
    $$19$2bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v290$1, 16bv32), 255bv32)), 998277249bv32);
    $$19$2bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v290$2, 16bv32), 255bv32)), 998277249bv32);
    $$19$3bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v290$1, 24bv32), 255bv32)), 998277249bv32);
    $$19$3bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v290$2, 24bv32), 255bv32)), 998277249bv32);
    v291$1 := $$19$0bv32$1;
    v291$2 := $$19$0bv32$2;
    v292$1 := $$19$1bv32$1;
    v292$2 := $$19$1bv32$2;
    v293$1 := $$19$2bv32$1;
    v293$2 := $$19$2bv32$2;
    v294$1 := $$19$3bv32$1;
    v294$2 := $$19$3bv32$2;
    $$46$0bv32$1 := v291$1;
    $$46$0bv32$2 := v291$2;
    $$46$1bv32$1 := v292$1;
    $$46$1bv32$2 := v292$2;
    $$46$2bv32$1 := v293$1;
    $$46$2bv32$2 := v293$2;
    $$46$3bv32$1 := v294$1;
    $$46$3bv32$2 := v294$2;
    v295$1 := $$46$0bv32$1;
    v295$2 := $$46$0bv32$2;
    v296$1 := $$46$1bv32$1;
    v296$2 := $$46$1bv32$2;
    v297$1 := $$46$2bv32$1;
    v297$2 := $$46$2bv32$2;
    v298$1 := $$46$3bv32$1;
    v298$2 := $$46$3bv32$2;
    $$b.i6$0bv32$1 := v295$1;
    $$b.i6$0bv32$2 := v295$2;
    $$b.i6$1bv32$1 := v296$1;
    $$b.i6$1bv32$2 := v296$2;
    $$b.i6$2bv32$1 := v297$1;
    $$b.i6$2bv32$2 := v297$2;
    $$b.i6$3bv32$1 := v298$1;
    $$b.i6$3bv32$2 := v298$2;
    v299$1 := $$t$0bv32$1;
    v299$2 := $$t$0bv32$2;
    v300$1 := $$b.i6$0bv32$1;
    v300$2 := $$b.i6$0bv32$2;
    v301$1 := $$t$1bv32$1;
    v301$2 := $$t$1bv32$2;
    v302$1 := $$b.i6$1bv32$1;
    v302$2 := $$b.i6$1bv32$2;
    v303$1 := $$t$2bv32$1;
    v303$2 := $$t$2bv32$2;
    v304$1 := $$b.i6$2bv32$1;
    v304$2 := $$b.i6$2bv32$2;
    v305$1 := $$t$3bv32$1;
    v305$2 := $$t$3bv32$2;
    v306$1 := $$b.i6$3bv32$1;
    v306$2 := $$b.i6$3bv32$2;
    $$20$0bv32$1 := FSUB32(v299$1, v300$1);
    $$20$0bv32$2 := FSUB32(v299$2, v300$2);
    $$20$1bv32$1 := FSUB32(v301$1, v302$1);
    $$20$1bv32$2 := FSUB32(v301$2, v302$2);
    $$20$2bv32$1 := FSUB32(v303$1, v304$1);
    $$20$2bv32$2 := FSUB32(v303$2, v304$2);
    $$20$3bv32$1 := FSUB32(v305$1, v306$1);
    $$20$3bv32$2 := FSUB32(v305$2, v306$2);
    v307$1 := $$20$0bv32$1;
    v307$2 := $$20$0bv32$2;
    v308$1 := $$20$1bv32$1;
    v308$2 := $$20$1bv32$2;
    v309$1 := $$20$2bv32$1;
    v309$2 := $$20$2bv32$2;
    v310$1 := $$20$3bv32$1;
    v310$2 := $$20$3bv32$2;
    $$21$0bv32$1 := v307$1;
    $$21$0bv32$2 := v307$2;
    $$21$1bv32$1 := v308$1;
    $$21$1bv32$2 := v308$2;
    $$21$2bv32$1 := v309$1;
    $$21$2bv32$2 := v309$2;
    $$21$3bv32$1 := v310$1;
    $$21$3bv32$2 := v310$2;
    v311$1 := $$21$0bv32$1;
    v311$2 := $$21$0bv32$2;
    $$t$0bv32$1 := v311$1;
    $$t$0bv32$2 := v311$2;
    v312$1 := $$21$1bv32$1;
    v312$2 := $$21$1bv32$2;
    $$t$1bv32$1 := v312$1;
    $$t$1bv32$2 := v312$2;
    v313$1 := $$21$2bv32$1;
    v313$2 := $$21$2bv32$2;
    $$t$2bv32$1 := v313$1;
    $$t$2bv32$2 := v313$2;
    v314$1 := $$21$3bv32$1;
    v314$2 := $$21$3bv32$2;
    $$t$3bv32$1 := v314$1;
    $$t$3bv32$2 := v314$2;
    v315$1 := $$t$0bv32$1;
    v315$2 := $$t$0bv32$2;
    $$48$0bv32$1 := v315$1;
    $$48$0bv32$2 := v315$2;
    v316$1 := $$t$1bv32$1;
    v316$2 := $$t$1bv32$2;
    $$48$1bv32$1 := v316$1;
    $$48$1bv32$2 := v316$2;
    v317$1 := $$t$2bv32$1;
    v317$2 := $$t$2bv32$2;
    $$48$2bv32$1 := v317$1;
    $$48$2bv32$2 := v317$2;
    v318$1 := $$t$3bv32$1;
    v318$2 := $$t$3bv32$2;
    $$48$3bv32$1 := v318$1;
    $$48$3bv32$2 := v318$2;
    v319$1 := $$48$0bv32$1;
    v319$2 := $$48$0bv32$2;
    v320$1 := $$48$1bv32$1;
    v320$2 := $$48$1bv32$2;
    v321$1 := $$48$2bv32$1;
    v321$2 := $$48$2bv32$2;
    v322$1 := $$48$3bv32$1;
    v322$2 := $$48$3bv32$2;
    $$a.i5$0bv32$1 := v319$1;
    $$a.i5$0bv32$2 := v319$2;
    $$a.i5$1bv32$1 := v320$1;
    $$a.i5$1bv32$2 := v320$2;
    $$a.i5$2bv32$1 := v321$1;
    $$a.i5$2bv32$2 := v321$2;
    $$a.i5$3bv32$1 := v322$1;
    $$a.i5$3bv32$2 := v322$2;
    v323$1 := $$a.i5$0bv32$1;
    v323$2 := $$a.i5$0bv32$2;
    v324$1 := $$a.i5$1bv32$1;
    v324$2 := $$a.i5$1bv32$2;
    v325$1 := $$a.i5$2bv32$1;
    v325$2 := $$a.i5$2bv32$2;
    v326$1 := $$a.i5$3bv32$1;
    v326$2 := $$a.i5$3bv32$2;
    $$22$0bv32$1 := FMUL32(v323$1, v1);
    $$22$0bv32$2 := FMUL32(v323$2, v1);
    $$22$1bv32$1 := FMUL32(v324$1, v1);
    $$22$1bv32$2 := FMUL32(v324$2, v1);
    $$22$2bv32$1 := FMUL32(v325$1, v1);
    $$22$2bv32$2 := FMUL32(v325$2, v1);
    $$22$3bv32$1 := FMUL32(v326$1, v1);
    $$22$3bv32$2 := FMUL32(v326$2, v1);
    v327$1 := $$22$0bv32$1;
    v327$2 := $$22$0bv32$2;
    v328$1 := $$22$1bv32$1;
    v328$2 := $$22$1bv32$2;
    v329$1 := $$22$2bv32$1;
    v329$2 := $$22$2bv32$2;
    v330$1 := $$22$3bv32$1;
    v330$2 := $$22$3bv32$2;
    $$23$0bv32$1 := v327$1;
    $$23$0bv32$2 := v327$2;
    $$23$1bv32$1 := v328$1;
    $$23$1bv32$2 := v328$2;
    $$23$2bv32$1 := v329$1;
    $$23$2bv32$2 := v329$2;
    $$23$3bv32$1 := v330$1;
    $$23$3bv32$2 := v330$2;
    v331$1 := $$23$0bv32$1;
    v331$2 := $$23$0bv32$2;
    v332$1 := $$23$1bv32$1;
    v332$2 := $$23$1bv32$2;
    v333$1 := $$23$2bv32$1;
    v333$2 := $$23$2bv32$2;
    v334$1 := $$23$3bv32$1;
    v334$2 := $$23$3bv32$2;
    $$47$0bv32$1 := v331$1;
    $$47$0bv32$2 := v331$2;
    $$47$1bv32$1 := v332$1;
    $$47$1bv32$2 := v332$2;
    $$47$2bv32$1 := v333$1;
    $$47$2bv32$2 := v333$2;
    $$47$3bv32$1 := v334$1;
    $$47$3bv32$2 := v334$2;
    v335$1 := $$47$0bv32$1;
    v335$2 := $$47$0bv32$2;
    v336$1 := $$47$1bv32$1;
    v336$2 := $$47$1bv32$2;
    v337$1 := $$47$2bv32$1;
    v337$2 := $$47$2bv32$2;
    v338$1 := $$47$3bv32$1;
    v338$2 := $$47$3bv32$2;
    $$rgba.i$0bv32$1 := v335$1;
    $$rgba.i$0bv32$2 := v335$2;
    $$rgba.i$1bv32$1 := v336$1;
    $$rgba.i$1bv32$2 := v336$2;
    $$rgba.i$2bv32$1 := v337$1;
    $$rgba.i$2bv32$2 := v337$2;
    $$rgba.i$3bv32$1 := v338$1;
    $$rgba.i$3bv32$2 := v338$2;
    v339$1 := $$rgba.i$0bv32$1;
    v339$2 := $$rgba.i$0bv32$2;
    call {:sourceloc_num 657} v340$1, v340$2 := $__saturatef(v339$1, v339$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i$0bv32$1 := v340$1;
    $$rgba.i$0bv32$2 := v340$2;
    v341$1 := $$rgba.i$1bv32$1;
    v341$2 := $$rgba.i$1bv32$2;
    call {:sourceloc_num 660} v342$1, v342$2 := $__saturatef(v341$1, v341$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i$1bv32$1 := v342$1;
    $$rgba.i$1bv32$2 := v342$2;
    v343$1 := $$rgba.i$2bv32$1;
    v343$2 := $$rgba.i$2bv32$2;
    call {:sourceloc_num 663} v344$1, v344$2 := $__saturatef(v343$1, v343$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i$2bv32$1 := v344$1;
    $$rgba.i$2bv32$2 := v344$2;
    v345$1 := $$rgba.i$3bv32$1;
    v345$2 := $$rgba.i$3bv32$2;
    call {:sourceloc_num 666} v346$1, v346$2 := $__saturatef(v345$1, v345$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i$3bv32$1 := v346$1;
    $$rgba.i$3bv32$2 := v346$2;
    v347$1 := $$rgba.i$3bv32$1;
    v347$2 := $$rgba.i$3bv32$2;
    v348$1 := $$rgba.i$2bv32$1;
    v348$2 := $$rgba.i$2bv32$2;
    v349$1 := $$rgba.i$1bv32$1;
    v349$2 := $$rgba.i$1bv32$2;
    v350$1 := $$rgba.i$0bv32$1;
    v350$2 := $$rgba.i$0bv32$2;
    call {:sourceloc} {:sourceloc_num 672} _LOG_WRITE_$$od(true, BV32_ADD(v0$1, BV32_MUL($y3.0, $w)), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v347$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v348$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v349$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v350$1, 1132396544bv32))), $$od[BV32_ADD(v0$1, BV32_MUL($y3.0, $w))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$od(true, BV32_ADD(v0$2, BV32_MUL($y3.0, $w)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 672} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 672} _CHECK_WRITE_$$od(true, BV32_ADD(v0$2, BV32_MUL($y3.0, $w)), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v347$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v348$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v349$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v350$2, 1132396544bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$od"} true;
    $$od[BV32_ADD(v0$1, BV32_MUL($y3.0, $w))] := BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v347$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v348$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v349$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v350$1, 1132396544bv32)));
    $$od[BV32_ADD(v0$2, BV32_MUL($y3.0, $w))] := BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v347$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v348$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v349$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v350$2, 1132396544bv32)));
    $y3.0 := BV32_ADD($y3.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $13;

  $truebb1:
    assume {:partition} v177 && v177;
    havoc v178$1, v178$2;
    $$7$0bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(v178$1, 255bv32)), 998277249bv32);
    $$7$0bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(v178$2, 255bv32)), 998277249bv32);
    $$7$1bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v178$1, 8bv32), 255bv32)), 998277249bv32);
    $$7$1bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v178$2, 8bv32), 255bv32)), 998277249bv32);
    $$7$2bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v178$1, 16bv32), 255bv32)), 998277249bv32);
    $$7$2bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v178$2, 16bv32), 255bv32)), 998277249bv32);
    $$7$3bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v178$1, 24bv32), 255bv32)), 998277249bv32);
    $$7$3bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v178$2, 24bv32), 255bv32)), 998277249bv32);
    v179$1 := $$7$0bv32$1;
    v179$2 := $$7$0bv32$2;
    v180$1 := $$7$1bv32$1;
    v180$2 := $$7$1bv32$2;
    v181$1 := $$7$2bv32$1;
    v181$2 := $$7$2bv32$2;
    v182$1 := $$7$3bv32$1;
    v182$2 := $$7$3bv32$2;
    $$41$0bv32$1 := v179$1;
    $$41$0bv32$2 := v179$2;
    $$41$1bv32$1 := v180$1;
    $$41$1bv32$2 := v180$2;
    $$41$2bv32$1 := v181$1;
    $$41$2bv32$2 := v181$2;
    $$41$3bv32$1 := v182$1;
    $$41$3bv32$2 := v182$2;
    v183$1 := $$41$0bv32$1;
    v183$2 := $$41$0bv32$2;
    v184$1 := $$41$1bv32$1;
    v184$2 := $$41$1bv32$2;
    v185$1 := $$41$2bv32$1;
    v185$2 := $$41$2bv32$2;
    v186$1 := $$41$3bv32$1;
    v186$2 := $$41$3bv32$2;
    $$b.i14$0bv32$1 := v183$1;
    $$b.i14$0bv32$2 := v183$2;
    $$b.i14$1bv32$1 := v184$1;
    $$b.i14$1bv32$2 := v184$2;
    $$b.i14$2bv32$1 := v185$1;
    $$b.i14$2bv32$2 := v185$2;
    $$b.i14$3bv32$1 := v186$1;
    $$b.i14$3bv32$2 := v186$2;
    v187$1 := $$t$0bv32$1;
    v187$2 := $$t$0bv32$2;
    v188$1 := $$b.i14$0bv32$1;
    v188$2 := $$b.i14$0bv32$2;
    v189$1 := $$t$1bv32$1;
    v189$2 := $$t$1bv32$2;
    v190$1 := $$b.i14$1bv32$1;
    v190$2 := $$b.i14$1bv32$2;
    v191$1 := $$t$2bv32$1;
    v191$2 := $$t$2bv32$2;
    v192$1 := $$b.i14$2bv32$1;
    v192$2 := $$b.i14$2bv32$2;
    v193$1 := $$t$3bv32$1;
    v193$2 := $$t$3bv32$2;
    v194$1 := $$b.i14$3bv32$1;
    v194$2 := $$b.i14$3bv32$2;
    $$5$0bv32$1 := FADD32(v187$1, v188$1);
    $$5$0bv32$2 := FADD32(v187$2, v188$2);
    $$5$1bv32$1 := FADD32(v189$1, v190$1);
    $$5$1bv32$2 := FADD32(v189$2, v190$2);
    $$5$2bv32$1 := FADD32(v191$1, v192$1);
    $$5$2bv32$2 := FADD32(v191$2, v192$2);
    $$5$3bv32$1 := FADD32(v193$1, v194$1);
    $$5$3bv32$2 := FADD32(v193$2, v194$2);
    v195$1 := $$5$0bv32$1;
    v195$2 := $$5$0bv32$2;
    v196$1 := $$5$1bv32$1;
    v196$2 := $$5$1bv32$2;
    v197$1 := $$5$2bv32$1;
    v197$2 := $$5$2bv32$2;
    v198$1 := $$5$3bv32$1;
    v198$2 := $$5$3bv32$2;
    $$6$0bv32$1 := v195$1;
    $$6$0bv32$2 := v195$2;
    $$6$1bv32$1 := v196$1;
    $$6$1bv32$2 := v196$2;
    $$6$2bv32$1 := v197$1;
    $$6$2bv32$2 := v197$2;
    $$6$3bv32$1 := v198$1;
    $$6$3bv32$2 := v198$2;
    v199$1 := $$6$0bv32$1;
    v199$2 := $$6$0bv32$2;
    $$t$0bv32$1 := v199$1;
    $$t$0bv32$2 := v199$2;
    v200$1 := $$6$1bv32$1;
    v200$2 := $$6$1bv32$2;
    $$t$1bv32$1 := v200$1;
    $$t$1bv32$2 := v200$2;
    v201$1 := $$6$2bv32$1;
    v201$2 := $$6$2bv32$2;
    $$t$2bv32$1 := v201$1;
    $$t$2bv32$2 := v201$2;
    v202$1 := $$6$3bv32$1;
    v202$2 := $$6$3bv32$2;
    $$t$3bv32$1 := v202$1;
    $$t$3bv32$2 := v202$2;
    havoc v203$1, v203$2;
    $$4$0bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(v203$1, 255bv32)), 998277249bv32);
    $$4$0bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(v203$2, 255bv32)), 998277249bv32);
    $$4$1bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v203$1, 8bv32), 255bv32)), 998277249bv32);
    $$4$1bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v203$2, 8bv32), 255bv32)), 998277249bv32);
    $$4$2bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v203$1, 16bv32), 255bv32)), 998277249bv32);
    $$4$2bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v203$2, 16bv32), 255bv32)), 998277249bv32);
    $$4$3bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v203$1, 24bv32), 255bv32)), 998277249bv32);
    $$4$3bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v203$2, 24bv32), 255bv32)), 998277249bv32);
    v204$1 := $$4$0bv32$1;
    v204$2 := $$4$0bv32$2;
    v205$1 := $$4$1bv32$1;
    v205$2 := $$4$1bv32$2;
    v206$1 := $$4$2bv32$1;
    v206$2 := $$4$2bv32$2;
    v207$1 := $$4$3bv32$1;
    v207$2 := $$4$3bv32$2;
    $$42$0bv32$1 := v204$1;
    $$42$0bv32$2 := v204$2;
    $$42$1bv32$1 := v205$1;
    $$42$1bv32$2 := v205$2;
    $$42$2bv32$1 := v206$1;
    $$42$2bv32$2 := v206$2;
    $$42$3bv32$1 := v207$1;
    $$42$3bv32$2 := v207$2;
    v208$1 := $$42$0bv32$1;
    v208$2 := $$42$0bv32$2;
    v209$1 := $$42$1bv32$1;
    v209$2 := $$42$1bv32$2;
    v210$1 := $$42$2bv32$1;
    v210$2 := $$42$2bv32$2;
    v211$1 := $$42$3bv32$1;
    v211$2 := $$42$3bv32$2;
    $$b.i15$0bv32$1 := v208$1;
    $$b.i15$0bv32$2 := v208$2;
    $$b.i15$1bv32$1 := v209$1;
    $$b.i15$1bv32$2 := v209$2;
    $$b.i15$2bv32$1 := v210$1;
    $$b.i15$2bv32$2 := v210$2;
    $$b.i15$3bv32$1 := v211$1;
    $$b.i15$3bv32$2 := v211$2;
    v212$1 := $$t$0bv32$1;
    v212$2 := $$t$0bv32$2;
    v213$1 := $$b.i15$0bv32$1;
    v213$2 := $$b.i15$0bv32$2;
    v214$1 := $$t$1bv32$1;
    v214$2 := $$t$1bv32$2;
    v215$1 := $$b.i15$1bv32$1;
    v215$2 := $$b.i15$1bv32$2;
    v216$1 := $$t$2bv32$1;
    v216$2 := $$t$2bv32$2;
    v217$1 := $$b.i15$2bv32$1;
    v217$2 := $$b.i15$2bv32$2;
    v218$1 := $$t$3bv32$1;
    v218$2 := $$t$3bv32$2;
    v219$1 := $$b.i15$3bv32$1;
    v219$2 := $$b.i15$3bv32$2;
    $$2$0bv32$1 := FSUB32(v212$1, v213$1);
    $$2$0bv32$2 := FSUB32(v212$2, v213$2);
    $$2$1bv32$1 := FSUB32(v214$1, v215$1);
    $$2$1bv32$2 := FSUB32(v214$2, v215$2);
    $$2$2bv32$1 := FSUB32(v216$1, v217$1);
    $$2$2bv32$2 := FSUB32(v216$2, v217$2);
    $$2$3bv32$1 := FSUB32(v218$1, v219$1);
    $$2$3bv32$2 := FSUB32(v218$2, v219$2);
    v220$1 := $$2$0bv32$1;
    v220$2 := $$2$0bv32$2;
    v221$1 := $$2$1bv32$1;
    v221$2 := $$2$1bv32$2;
    v222$1 := $$2$2bv32$1;
    v222$2 := $$2$2bv32$2;
    v223$1 := $$2$3bv32$1;
    v223$2 := $$2$3bv32$2;
    $$3$0bv32$1 := v220$1;
    $$3$0bv32$2 := v220$2;
    $$3$1bv32$1 := v221$1;
    $$3$1bv32$2 := v221$2;
    $$3$2bv32$1 := v222$1;
    $$3$2bv32$2 := v222$2;
    $$3$3bv32$1 := v223$1;
    $$3$3bv32$2 := v223$2;
    v224$1 := $$3$0bv32$1;
    v224$2 := $$3$0bv32$2;
    $$t$0bv32$1 := v224$1;
    $$t$0bv32$2 := v224$2;
    v225$1 := $$3$1bv32$1;
    v225$2 := $$3$1bv32$2;
    $$t$1bv32$1 := v225$1;
    $$t$1bv32$2 := v225$2;
    v226$1 := $$3$2bv32$1;
    v226$2 := $$3$2bv32$2;
    $$t$2bv32$1 := v226$1;
    $$t$2bv32$2 := v226$2;
    v227$1 := $$3$3bv32$1;
    v227$2 := $$3$3bv32$2;
    $$t$3bv32$1 := v227$1;
    $$t$3bv32$2 := v227$2;
    v228$1 := $$t$0bv32$1;
    v228$2 := $$t$0bv32$2;
    $$44$0bv32$1 := v228$1;
    $$44$0bv32$2 := v228$2;
    v229$1 := $$t$1bv32$1;
    v229$2 := $$t$1bv32$2;
    $$44$1bv32$1 := v229$1;
    $$44$1bv32$2 := v229$2;
    v230$1 := $$t$2bv32$1;
    v230$2 := $$t$2bv32$2;
    $$44$2bv32$1 := v230$1;
    $$44$2bv32$2 := v230$2;
    v231$1 := $$t$3bv32$1;
    v231$2 := $$t$3bv32$2;
    $$44$3bv32$1 := v231$1;
    $$44$3bv32$2 := v231$2;
    v232$1 := $$44$0bv32$1;
    v232$2 := $$44$0bv32$2;
    v233$1 := $$44$1bv32$1;
    v233$2 := $$44$1bv32$2;
    v234$1 := $$44$2bv32$1;
    v234$2 := $$44$2bv32$2;
    v235$1 := $$44$3bv32$1;
    v235$2 := $$44$3bv32$2;
    $$a.i16$0bv32$1 := v232$1;
    $$a.i16$0bv32$2 := v232$2;
    $$a.i16$1bv32$1 := v233$1;
    $$a.i16$1bv32$2 := v233$2;
    $$a.i16$2bv32$1 := v234$1;
    $$a.i16$2bv32$2 := v234$2;
    $$a.i16$3bv32$1 := v235$1;
    $$a.i16$3bv32$2 := v235$2;
    v236$1 := $$a.i16$0bv32$1;
    v236$2 := $$a.i16$0bv32$2;
    v237$1 := $$a.i16$1bv32$1;
    v237$2 := $$a.i16$1bv32$2;
    v238$1 := $$a.i16$2bv32$1;
    v238$2 := $$a.i16$2bv32$2;
    v239$1 := $$a.i16$3bv32$1;
    v239$2 := $$a.i16$3bv32$2;
    $$0$0bv32$1 := FMUL32(v236$1, v1);
    $$0$0bv32$2 := FMUL32(v236$2, v1);
    $$0$1bv32$1 := FMUL32(v237$1, v1);
    $$0$1bv32$2 := FMUL32(v237$2, v1);
    $$0$2bv32$1 := FMUL32(v238$1, v1);
    $$0$2bv32$2 := FMUL32(v238$2, v1);
    $$0$3bv32$1 := FMUL32(v239$1, v1);
    $$0$3bv32$2 := FMUL32(v239$2, v1);
    v240$1 := $$0$0bv32$1;
    v240$2 := $$0$0bv32$2;
    v241$1 := $$0$1bv32$1;
    v241$2 := $$0$1bv32$2;
    v242$1 := $$0$2bv32$1;
    v242$2 := $$0$2bv32$2;
    v243$1 := $$0$3bv32$1;
    v243$2 := $$0$3bv32$2;
    $$1$0bv32$1 := v240$1;
    $$1$0bv32$2 := v240$2;
    $$1$1bv32$1 := v241$1;
    $$1$1bv32$2 := v241$2;
    $$1$2bv32$1 := v242$1;
    $$1$2bv32$2 := v242$2;
    $$1$3bv32$1 := v243$1;
    $$1$3bv32$2 := v243$2;
    v244$1 := $$1$0bv32$1;
    v244$2 := $$1$0bv32$2;
    v245$1 := $$1$1bv32$1;
    v245$2 := $$1$1bv32$2;
    v246$1 := $$1$2bv32$1;
    v246$2 := $$1$2bv32$2;
    v247$1 := $$1$3bv32$1;
    v247$2 := $$1$3bv32$2;
    $$43$0bv32$1 := v244$1;
    $$43$0bv32$2 := v244$2;
    $$43$1bv32$1 := v245$1;
    $$43$1bv32$2 := v245$2;
    $$43$2bv32$1 := v246$1;
    $$43$2bv32$2 := v246$2;
    $$43$3bv32$1 := v247$1;
    $$43$3bv32$2 := v247$2;
    v248$1 := $$43$0bv32$1;
    v248$2 := $$43$0bv32$2;
    v249$1 := $$43$1bv32$1;
    v249$2 := $$43$1bv32$2;
    v250$1 := $$43$2bv32$1;
    v250$2 := $$43$2bv32$2;
    v251$1 := $$43$3bv32$1;
    v251$2 := $$43$3bv32$2;
    $$rgba.i8$0bv32$1 := v248$1;
    $$rgba.i8$0bv32$2 := v248$2;
    $$rgba.i8$1bv32$1 := v249$1;
    $$rgba.i8$1bv32$2 := v249$2;
    $$rgba.i8$2bv32$1 := v250$1;
    $$rgba.i8$2bv32$2 := v250$2;
    $$rgba.i8$3bv32$1 := v251$1;
    $$rgba.i8$3bv32$2 := v251$2;
    v252$1 := $$rgba.i8$0bv32$1;
    v252$2 := $$rgba.i8$0bv32$2;
    call {:sourceloc_num 490} v253$1, v253$2 := $__saturatef(v252$1, v252$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i8$0bv32$1 := v253$1;
    $$rgba.i8$0bv32$2 := v253$2;
    v254$1 := $$rgba.i8$1bv32$1;
    v254$2 := $$rgba.i8$1bv32$2;
    call {:sourceloc_num 493} v255$1, v255$2 := $__saturatef(v254$1, v254$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i8$1bv32$1 := v255$1;
    $$rgba.i8$1bv32$2 := v255$2;
    v256$1 := $$rgba.i8$2bv32$1;
    v256$2 := $$rgba.i8$2bv32$2;
    call {:sourceloc_num 496} v257$1, v257$2 := $__saturatef(v256$1, v256$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i8$2bv32$1 := v257$1;
    $$rgba.i8$2bv32$2 := v257$2;
    v258$1 := $$rgba.i8$3bv32$1;
    v258$2 := $$rgba.i8$3bv32$2;
    call {:sourceloc_num 499} v259$1, v259$2 := $__saturatef(v258$1, v258$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i8$3bv32$1 := v259$1;
    $$rgba.i8$3bv32$2 := v259$2;
    v260$1 := $$rgba.i8$3bv32$1;
    v260$2 := $$rgba.i8$3bv32$2;
    v261$1 := $$rgba.i8$2bv32$1;
    v261$2 := $$rgba.i8$2bv32$2;
    v262$1 := $$rgba.i8$1bv32$1;
    v262$2 := $$rgba.i8$1bv32$2;
    v263$1 := $$rgba.i8$0bv32$1;
    v263$2 := $$rgba.i8$0bv32$2;
    call {:sourceloc} {:sourceloc_num 505} _LOG_WRITE_$$od(true, BV32_ADD(v0$1, BV32_MUL($y2.0, $w)), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v260$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v261$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v262$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v263$1, 1132396544bv32))), $$od[BV32_ADD(v0$1, BV32_MUL($y2.0, $w))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$od(true, BV32_ADD(v0$2, BV32_MUL($y2.0, $w)));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 505} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 505} _CHECK_WRITE_$$od(true, BV32_ADD(v0$2, BV32_MUL($y2.0, $w)), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v260$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v261$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v262$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v263$2, 1132396544bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$od"} true;
    $$od[BV32_ADD(v0$1, BV32_MUL($y2.0, $w))] := BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v260$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v261$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v262$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v263$1, 1132396544bv32)));
    $$od[BV32_ADD(v0$2, BV32_MUL($y2.0, $w))] := BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v260$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v261$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v262$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v263$2, 1132396544bv32)));
    $y2.0 := BV32_ADD($y2.0, 1bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $9;

  $truebb0:
    assume {:partition} v90 && v90;
    havoc v91$1, v91$2;
    $$15$0bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(v91$1, 255bv32)), 998277249bv32);
    $$15$0bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(v91$2, 255bv32)), 998277249bv32);
    $$15$1bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v91$1, 8bv32), 255bv32)), 998277249bv32);
    $$15$1bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v91$2, 8bv32), 255bv32)), 998277249bv32);
    $$15$2bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v91$1, 16bv32), 255bv32)), 998277249bv32);
    $$15$2bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v91$2, 16bv32), 255bv32)), 998277249bv32);
    $$15$3bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v91$1, 24bv32), 255bv32)), 998277249bv32);
    $$15$3bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v91$2, 24bv32), 255bv32)), 998277249bv32);
    v92$1 := $$15$0bv32$1;
    v92$2 := $$15$0bv32$2;
    v93$1 := $$15$1bv32$1;
    v93$2 := $$15$1bv32$2;
    v94$1 := $$15$2bv32$1;
    v94$2 := $$15$2bv32$2;
    v95$1 := $$15$3bv32$1;
    v95$2 := $$15$3bv32$2;
    $$37$0bv32$1 := v92$1;
    $$37$0bv32$2 := v92$2;
    $$37$1bv32$1 := v93$1;
    $$37$1bv32$2 := v93$2;
    $$37$2bv32$1 := v94$1;
    $$37$2bv32$2 := v94$2;
    $$37$3bv32$1 := v95$1;
    $$37$3bv32$2 := v95$2;
    v96$1 := $$37$0bv32$1;
    v96$2 := $$37$0bv32$2;
    v97$1 := $$37$1bv32$1;
    v97$2 := $$37$1bv32$2;
    v98$1 := $$37$2bv32$1;
    v98$2 := $$37$2bv32$2;
    v99$1 := $$37$3bv32$1;
    v99$2 := $$37$3bv32$2;
    $$b.i10$0bv32$1 := v96$1;
    $$b.i10$0bv32$2 := v96$2;
    $$b.i10$1bv32$1 := v97$1;
    $$b.i10$1bv32$2 := v97$2;
    $$b.i10$2bv32$1 := v98$1;
    $$b.i10$2bv32$2 := v98$2;
    $$b.i10$3bv32$1 := v99$1;
    $$b.i10$3bv32$2 := v99$2;
    v100$1 := $$t$0bv32$1;
    v100$2 := $$t$0bv32$2;
    v101$1 := $$b.i10$0bv32$1;
    v101$2 := $$b.i10$0bv32$2;
    v102$1 := $$t$1bv32$1;
    v102$2 := $$t$1bv32$2;
    v103$1 := $$b.i10$1bv32$1;
    v103$2 := $$b.i10$1bv32$2;
    v104$1 := $$t$2bv32$1;
    v104$2 := $$t$2bv32$2;
    v105$1 := $$b.i10$2bv32$1;
    v105$2 := $$b.i10$2bv32$2;
    v106$1 := $$t$3bv32$1;
    v106$2 := $$t$3bv32$2;
    v107$1 := $$b.i10$3bv32$1;
    v107$2 := $$b.i10$3bv32$2;
    $$13$0bv32$1 := FADD32(v100$1, v101$1);
    $$13$0bv32$2 := FADD32(v100$2, v101$2);
    $$13$1bv32$1 := FADD32(v102$1, v103$1);
    $$13$1bv32$2 := FADD32(v102$2, v103$2);
    $$13$2bv32$1 := FADD32(v104$1, v105$1);
    $$13$2bv32$2 := FADD32(v104$2, v105$2);
    $$13$3bv32$1 := FADD32(v106$1, v107$1);
    $$13$3bv32$2 := FADD32(v106$2, v107$2);
    v108$1 := $$13$0bv32$1;
    v108$2 := $$13$0bv32$2;
    v109$1 := $$13$1bv32$1;
    v109$2 := $$13$1bv32$2;
    v110$1 := $$13$2bv32$1;
    v110$2 := $$13$2bv32$2;
    v111$1 := $$13$3bv32$1;
    v111$2 := $$13$3bv32$2;
    $$14$0bv32$1 := v108$1;
    $$14$0bv32$2 := v108$2;
    $$14$1bv32$1 := v109$1;
    $$14$1bv32$2 := v109$2;
    $$14$2bv32$1 := v110$1;
    $$14$2bv32$2 := v110$2;
    $$14$3bv32$1 := v111$1;
    $$14$3bv32$2 := v111$2;
    v112$1 := $$14$0bv32$1;
    v112$2 := $$14$0bv32$2;
    $$t$0bv32$1 := v112$1;
    $$t$0bv32$2 := v112$2;
    v113$1 := $$14$1bv32$1;
    v113$2 := $$14$1bv32$2;
    $$t$1bv32$1 := v113$1;
    $$t$1bv32$2 := v113$2;
    v114$1 := $$14$2bv32$1;
    v114$2 := $$14$2bv32$2;
    $$t$2bv32$1 := v114$1;
    $$t$2bv32$2 := v114$2;
    v115$1 := $$14$3bv32$1;
    v115$2 := $$14$3bv32$2;
    $$t$3bv32$1 := v115$1;
    $$t$3bv32$2 := v115$2;
    havoc v116$1, v116$2;
    $$12$0bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(v116$1, 255bv32)), 998277249bv32);
    $$12$0bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(v116$2, 255bv32)), 998277249bv32);
    $$12$1bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v116$1, 8bv32), 255bv32)), 998277249bv32);
    $$12$1bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v116$2, 8bv32), 255bv32)), 998277249bv32);
    $$12$2bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v116$1, 16bv32), 255bv32)), 998277249bv32);
    $$12$2bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v116$2, 16bv32), 255bv32)), 998277249bv32);
    $$12$3bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v116$1, 24bv32), 255bv32)), 998277249bv32);
    $$12$3bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v116$2, 24bv32), 255bv32)), 998277249bv32);
    v117$1 := $$12$0bv32$1;
    v117$2 := $$12$0bv32$2;
    v118$1 := $$12$1bv32$1;
    v118$2 := $$12$1bv32$2;
    v119$1 := $$12$2bv32$1;
    v119$2 := $$12$2bv32$2;
    v120$1 := $$12$3bv32$1;
    v120$2 := $$12$3bv32$2;
    $$38$0bv32$1 := v117$1;
    $$38$0bv32$2 := v117$2;
    $$38$1bv32$1 := v118$1;
    $$38$1bv32$2 := v118$2;
    $$38$2bv32$1 := v119$1;
    $$38$2bv32$2 := v119$2;
    $$38$3bv32$1 := v120$1;
    $$38$3bv32$2 := v120$2;
    v121$1 := $$38$0bv32$1;
    v121$2 := $$38$0bv32$2;
    v122$1 := $$38$1bv32$1;
    v122$2 := $$38$1bv32$2;
    v123$1 := $$38$2bv32$1;
    v123$2 := $$38$2bv32$2;
    v124$1 := $$38$3bv32$1;
    v124$2 := $$38$3bv32$2;
    $$b.i11$0bv32$1 := v121$1;
    $$b.i11$0bv32$2 := v121$2;
    $$b.i11$1bv32$1 := v122$1;
    $$b.i11$1bv32$2 := v122$2;
    $$b.i11$2bv32$1 := v123$1;
    $$b.i11$2bv32$2 := v123$2;
    $$b.i11$3bv32$1 := v124$1;
    $$b.i11$3bv32$2 := v124$2;
    v125$1 := $$t$0bv32$1;
    v125$2 := $$t$0bv32$2;
    v126$1 := $$b.i11$0bv32$1;
    v126$2 := $$b.i11$0bv32$2;
    v127$1 := $$t$1bv32$1;
    v127$2 := $$t$1bv32$2;
    v128$1 := $$b.i11$1bv32$1;
    v128$2 := $$b.i11$1bv32$2;
    v129$1 := $$t$2bv32$1;
    v129$2 := $$t$2bv32$2;
    v130$1 := $$b.i11$2bv32$1;
    v130$2 := $$b.i11$2bv32$2;
    v131$1 := $$t$3bv32$1;
    v131$2 := $$t$3bv32$2;
    v132$1 := $$b.i11$3bv32$1;
    v132$2 := $$b.i11$3bv32$2;
    $$10$0bv32$1 := FSUB32(v125$1, v126$1);
    $$10$0bv32$2 := FSUB32(v125$2, v126$2);
    $$10$1bv32$1 := FSUB32(v127$1, v128$1);
    $$10$1bv32$2 := FSUB32(v127$2, v128$2);
    $$10$2bv32$1 := FSUB32(v129$1, v130$1);
    $$10$2bv32$2 := FSUB32(v129$2, v130$2);
    $$10$3bv32$1 := FSUB32(v131$1, v132$1);
    $$10$3bv32$2 := FSUB32(v131$2, v132$2);
    v133$1 := $$10$0bv32$1;
    v133$2 := $$10$0bv32$2;
    v134$1 := $$10$1bv32$1;
    v134$2 := $$10$1bv32$2;
    v135$1 := $$10$2bv32$1;
    v135$2 := $$10$2bv32$2;
    v136$1 := $$10$3bv32$1;
    v136$2 := $$10$3bv32$2;
    $$11$0bv32$1 := v133$1;
    $$11$0bv32$2 := v133$2;
    $$11$1bv32$1 := v134$1;
    $$11$1bv32$2 := v134$2;
    $$11$2bv32$1 := v135$1;
    $$11$2bv32$2 := v135$2;
    $$11$3bv32$1 := v136$1;
    $$11$3bv32$2 := v136$2;
    v137$1 := $$11$0bv32$1;
    v137$2 := $$11$0bv32$2;
    $$t$0bv32$1 := v137$1;
    $$t$0bv32$2 := v137$2;
    v138$1 := $$11$1bv32$1;
    v138$2 := $$11$1bv32$2;
    $$t$1bv32$1 := v138$1;
    $$t$1bv32$2 := v138$2;
    v139$1 := $$11$2bv32$1;
    v139$2 := $$11$2bv32$2;
    $$t$2bv32$1 := v139$1;
    $$t$2bv32$2 := v139$2;
    v140$1 := $$11$3bv32$1;
    v140$2 := $$11$3bv32$2;
    $$t$3bv32$1 := v140$1;
    $$t$3bv32$2 := v140$2;
    v141$1 := $$t$0bv32$1;
    v141$2 := $$t$0bv32$2;
    $$40$0bv32$1 := v141$1;
    $$40$0bv32$2 := v141$2;
    v142$1 := $$t$1bv32$1;
    v142$2 := $$t$1bv32$2;
    $$40$1bv32$1 := v142$1;
    $$40$1bv32$2 := v142$2;
    v143$1 := $$t$2bv32$1;
    v143$2 := $$t$2bv32$2;
    $$40$2bv32$1 := v143$1;
    $$40$2bv32$2 := v143$2;
    v144$1 := $$t$3bv32$1;
    v144$2 := $$t$3bv32$2;
    $$40$3bv32$1 := v144$1;
    $$40$3bv32$2 := v144$2;
    v145$1 := $$40$0bv32$1;
    v145$2 := $$40$0bv32$2;
    v146$1 := $$40$1bv32$1;
    v146$2 := $$40$1bv32$2;
    v147$1 := $$40$2bv32$1;
    v147$2 := $$40$2bv32$2;
    v148$1 := $$40$3bv32$1;
    v148$2 := $$40$3bv32$2;
    $$a.i12$0bv32$1 := v145$1;
    $$a.i12$0bv32$2 := v145$2;
    $$a.i12$1bv32$1 := v146$1;
    $$a.i12$1bv32$2 := v146$2;
    $$a.i12$2bv32$1 := v147$1;
    $$a.i12$2bv32$2 := v147$2;
    $$a.i12$3bv32$1 := v148$1;
    $$a.i12$3bv32$2 := v148$2;
    v149$1 := $$a.i12$0bv32$1;
    v149$2 := $$a.i12$0bv32$2;
    v150$1 := $$a.i12$1bv32$1;
    v150$2 := $$a.i12$1bv32$2;
    v151$1 := $$a.i12$2bv32$1;
    v151$2 := $$a.i12$2bv32$2;
    v152$1 := $$a.i12$3bv32$1;
    v152$2 := $$a.i12$3bv32$2;
    $$8$0bv32$1 := FMUL32(v149$1, v1);
    $$8$0bv32$2 := FMUL32(v149$2, v1);
    $$8$1bv32$1 := FMUL32(v150$1, v1);
    $$8$1bv32$2 := FMUL32(v150$2, v1);
    $$8$2bv32$1 := FMUL32(v151$1, v1);
    $$8$2bv32$2 := FMUL32(v151$2, v1);
    $$8$3bv32$1 := FMUL32(v152$1, v1);
    $$8$3bv32$2 := FMUL32(v152$2, v1);
    v153$1 := $$8$0bv32$1;
    v153$2 := $$8$0bv32$2;
    v154$1 := $$8$1bv32$1;
    v154$2 := $$8$1bv32$2;
    v155$1 := $$8$2bv32$1;
    v155$2 := $$8$2bv32$2;
    v156$1 := $$8$3bv32$1;
    v156$2 := $$8$3bv32$2;
    $$9$0bv32$1 := v153$1;
    $$9$0bv32$2 := v153$2;
    $$9$1bv32$1 := v154$1;
    $$9$1bv32$2 := v154$2;
    $$9$2bv32$1 := v155$1;
    $$9$2bv32$2 := v155$2;
    $$9$3bv32$1 := v156$1;
    $$9$3bv32$2 := v156$2;
    v157$1 := $$9$0bv32$1;
    v157$2 := $$9$0bv32$2;
    v158$1 := $$9$1bv32$1;
    v158$2 := $$9$1bv32$2;
    v159$1 := $$9$2bv32$1;
    v159$2 := $$9$2bv32$2;
    v160$1 := $$9$3bv32$1;
    v160$2 := $$9$3bv32$2;
    $$39$0bv32$1 := v157$1;
    $$39$0bv32$2 := v157$2;
    $$39$1bv32$1 := v158$1;
    $$39$1bv32$2 := v158$2;
    $$39$2bv32$1 := v159$1;
    $$39$2bv32$2 := v159$2;
    $$39$3bv32$1 := v160$1;
    $$39$3bv32$2 := v160$2;
    v161$1 := $$39$0bv32$1;
    v161$2 := $$39$0bv32$2;
    v162$1 := $$39$1bv32$1;
    v162$2 := $$39$1bv32$2;
    v163$1 := $$39$2bv32$1;
    v163$2 := $$39$2bv32$2;
    v164$1 := $$39$3bv32$1;
    v164$2 := $$39$3bv32$2;
    $$rgba.i13$0bv32$1 := v161$1;
    $$rgba.i13$0bv32$2 := v161$2;
    $$rgba.i13$1bv32$1 := v162$1;
    $$rgba.i13$1bv32$2 := v162$2;
    $$rgba.i13$2bv32$1 := v163$1;
    $$rgba.i13$2bv32$2 := v163$2;
    $$rgba.i13$3bv32$1 := v164$1;
    $$rgba.i13$3bv32$2 := v164$2;
    v165$1 := $$rgba.i13$0bv32$1;
    v165$2 := $$rgba.i13$0bv32$2;
    call {:sourceloc_num 323} v166$1, v166$2 := $__saturatef(v165$1, v165$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i13$0bv32$1 := v166$1;
    $$rgba.i13$0bv32$2 := v166$2;
    v167$1 := $$rgba.i13$1bv32$1;
    v167$2 := $$rgba.i13$1bv32$2;
    call {:sourceloc_num 326} v168$1, v168$2 := $__saturatef(v167$1, v167$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i13$1bv32$1 := v168$1;
    $$rgba.i13$1bv32$2 := v168$2;
    v169$1 := $$rgba.i13$2bv32$1;
    v169$2 := $$rgba.i13$2bv32$2;
    call {:sourceloc_num 329} v170$1, v170$2 := $__saturatef(v169$1, v169$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i13$2bv32$1 := v170$1;
    $$rgba.i13$2bv32$2 := v170$2;
    v171$1 := $$rgba.i13$3bv32$1;
    v171$2 := $$rgba.i13$3bv32$2;
    call {:sourceloc_num 332} v172$1, v172$2 := $__saturatef(v171$1, v171$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i13$3bv32$1 := v172$1;
    $$rgba.i13$3bv32$2 := v172$2;
    v173$1 := $$rgba.i13$3bv32$1;
    v173$2 := $$rgba.i13$3bv32$2;
    v174$1 := $$rgba.i13$2bv32$1;
    v174$2 := $$rgba.i13$2bv32$2;
    v175$1 := $$rgba.i13$1bv32$1;
    v175$2 := $$rgba.i13$1bv32$2;
    v176$1 := $$rgba.i13$0bv32$1;
    v176$2 := $$rgba.i13$0bv32$2;
    call {:sourceloc} {:sourceloc_num 338} _LOG_WRITE_$$od(true, BV32_ADD(v0$1, BV32_MUL($y1.0, $w)), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v173$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v174$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v175$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v176$1, 1132396544bv32))), $$od[BV32_ADD(v0$1, BV32_MUL($y1.0, $w))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$od(true, BV32_ADD(v0$2, BV32_MUL($y1.0, $w)));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 338} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 338} _CHECK_WRITE_$$od(true, BV32_ADD(v0$2, BV32_MUL($y1.0, $w)), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v173$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v174$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v175$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v176$2, 1132396544bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$od"} true;
    $$od[BV32_ADD(v0$1, BV32_MUL($y1.0, $w))] := BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v173$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v174$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v175$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v176$1, 1132396544bv32)));
    $$od[BV32_ADD(v0$2, BV32_MUL($y1.0, $w))] := BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v173$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v174$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v175$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v176$2, 1132396544bv32)));
    $y1.0 := BV32_ADD($y1.0, 1bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $5;

  $truebb:
    assume {:partition} v28 && v28;
    havoc v29$1, v29$2;
    $$28$0bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(v29$1, 255bv32)), 998277249bv32);
    $$28$0bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(v29$2, 255bv32)), 998277249bv32);
    $$28$1bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v29$1, 8bv32), 255bv32)), 998277249bv32);
    $$28$1bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v29$2, 8bv32), 255bv32)), 998277249bv32);
    $$28$2bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v29$1, 16bv32), 255bv32)), 998277249bv32);
    $$28$2bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v29$2, 16bv32), 255bv32)), 998277249bv32);
    $$28$3bv32$1 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v29$1, 24bv32), 255bv32)), 998277249bv32);
    $$28$3bv32$2 := FMUL32(UI32_TO_FP32(BV32_AND(BV32_LSHR(v29$2, 24bv32), 255bv32)), 998277249bv32);
    v30$1 := $$28$0bv32$1;
    v30$2 := $$28$0bv32$2;
    v31$1 := $$28$1bv32$1;
    v31$2 := $$28$1bv32$2;
    v32$1 := $$28$2bv32$1;
    v32$2 := $$28$2bv32$2;
    v33$1 := $$28$3bv32$1;
    v33$2 := $$28$3bv32$2;
    $$34$0bv32$1 := v30$1;
    $$34$0bv32$2 := v30$2;
    $$34$1bv32$1 := v31$1;
    $$34$1bv32$2 := v31$2;
    $$34$2bv32$1 := v32$1;
    $$34$2bv32$2 := v32$2;
    $$34$3bv32$1 := v33$1;
    $$34$3bv32$2 := v33$2;
    v34$1 := $$34$0bv32$1;
    v34$2 := $$34$0bv32$2;
    v35$1 := $$34$1bv32$1;
    v35$2 := $$34$1bv32$2;
    v36$1 := $$34$2bv32$1;
    v36$2 := $$34$2bv32$2;
    v37$1 := $$34$3bv32$1;
    v37$2 := $$34$3bv32$2;
    $$b.i$0bv32$1 := v34$1;
    $$b.i$0bv32$2 := v34$2;
    $$b.i$1bv32$1 := v35$1;
    $$b.i$1bv32$2 := v35$2;
    $$b.i$2bv32$1 := v36$1;
    $$b.i$2bv32$2 := v36$2;
    $$b.i$3bv32$1 := v37$1;
    $$b.i$3bv32$2 := v37$2;
    v38$1 := $$t$0bv32$1;
    v38$2 := $$t$0bv32$2;
    v39$1 := $$b.i$0bv32$1;
    v39$2 := $$b.i$0bv32$2;
    v40$1 := $$t$1bv32$1;
    v40$2 := $$t$1bv32$2;
    v41$1 := $$b.i$1bv32$1;
    v41$2 := $$b.i$1bv32$2;
    v42$1 := $$t$2bv32$1;
    v42$2 := $$t$2bv32$2;
    v43$1 := $$b.i$2bv32$1;
    v43$2 := $$b.i$2bv32$2;
    v44$1 := $$t$3bv32$1;
    v44$2 := $$t$3bv32$2;
    v45$1 := $$b.i$3bv32$1;
    v45$2 := $$b.i$3bv32$2;
    $$26$0bv32$1 := FADD32(v38$1, v39$1);
    $$26$0bv32$2 := FADD32(v38$2, v39$2);
    $$26$1bv32$1 := FADD32(v40$1, v41$1);
    $$26$1bv32$2 := FADD32(v40$2, v41$2);
    $$26$2bv32$1 := FADD32(v42$1, v43$1);
    $$26$2bv32$2 := FADD32(v42$2, v43$2);
    $$26$3bv32$1 := FADD32(v44$1, v45$1);
    $$26$3bv32$2 := FADD32(v44$2, v45$2);
    v46$1 := $$26$0bv32$1;
    v46$2 := $$26$0bv32$2;
    v47$1 := $$26$1bv32$1;
    v47$2 := $$26$1bv32$2;
    v48$1 := $$26$2bv32$1;
    v48$2 := $$26$2bv32$2;
    v49$1 := $$26$3bv32$1;
    v49$2 := $$26$3bv32$2;
    $$27$0bv32$1 := v46$1;
    $$27$0bv32$2 := v46$2;
    $$27$1bv32$1 := v47$1;
    $$27$1bv32$2 := v47$2;
    $$27$2bv32$1 := v48$1;
    $$27$2bv32$2 := v48$2;
    $$27$3bv32$1 := v49$1;
    $$27$3bv32$2 := v49$2;
    v50$1 := $$27$0bv32$1;
    v50$2 := $$27$0bv32$2;
    $$t$0bv32$1 := v50$1;
    $$t$0bv32$2 := v50$2;
    v51$1 := $$27$1bv32$1;
    v51$2 := $$27$1bv32$2;
    $$t$1bv32$1 := v51$1;
    $$t$1bv32$2 := v51$2;
    v52$1 := $$27$2bv32$1;
    v52$2 := $$27$2bv32$2;
    $$t$2bv32$1 := v52$1;
    $$t$2bv32$2 := v52$2;
    v53$1 := $$27$3bv32$1;
    v53$2 := $$27$3bv32$2;
    $$t$3bv32$1 := v53$1;
    $$t$3bv32$2 := v53$2;
    $y.0 := BV32_ADD($y.0, 1bv32);
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $1;
}



procedure {:source_name "__saturatef"} $__saturatef($0$1: bv32, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

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

var $$1$0bv32$1: bv32;

var $$1$0bv32$2: bv32;

var $$1$1bv32$1: bv32;

var $$1$1bv32$2: bv32;

var $$1$2bv32$1: bv32;

var $$1$2bv32$2: bv32;

var $$1$3bv32$1: bv32;

var $$1$3bv32$2: bv32;

var $$a.i16$0bv32$1: bv32;

var $$a.i16$0bv32$2: bv32;

var $$a.i16$1bv32$1: bv32;

var $$a.i16$1bv32$2: bv32;

var $$a.i16$2bv32$1: bv32;

var $$a.i16$2bv32$2: bv32;

var $$a.i16$3bv32$1: bv32;

var $$a.i16$3bv32$2: bv32;

var $$2$0bv32$1: bv32;

var $$2$0bv32$2: bv32;

var $$2$1bv32$1: bv32;

var $$2$1bv32$2: bv32;

var $$2$2bv32$1: bv32;

var $$2$2bv32$2: bv32;

var $$2$3bv32$1: bv32;

var $$2$3bv32$2: bv32;

var $$b.i15$0bv32$1: bv32;

var $$b.i15$0bv32$2: bv32;

var $$b.i15$1bv32$1: bv32;

var $$b.i15$1bv32$2: bv32;

var $$b.i15$2bv32$1: bv32;

var $$b.i15$2bv32$2: bv32;

var $$b.i15$3bv32$1: bv32;

var $$b.i15$3bv32$2: bv32;

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

var $$b.i14$0bv32$1: bv32;

var $$b.i14$0bv32$2: bv32;

var $$b.i14$1bv32$1: bv32;

var $$b.i14$1bv32$2: bv32;

var $$b.i14$2bv32$1: bv32;

var $$b.i14$2bv32$2: bv32;

var $$b.i14$3bv32$1: bv32;

var $$b.i14$3bv32$2: bv32;

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

var $$rgba.i13$0bv32$1: bv32;

var $$rgba.i13$0bv32$2: bv32;

var $$rgba.i13$1bv32$1: bv32;

var $$rgba.i13$1bv32$2: bv32;

var $$rgba.i13$2bv32$1: bv32;

var $$rgba.i13$2bv32$2: bv32;

var $$rgba.i13$3bv32$1: bv32;

var $$rgba.i13$3bv32$2: bv32;

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

var $$a.i12$0bv32$1: bv32;

var $$a.i12$0bv32$2: bv32;

var $$a.i12$1bv32$1: bv32;

var $$a.i12$1bv32$2: bv32;

var $$a.i12$2bv32$1: bv32;

var $$a.i12$2bv32$2: bv32;

var $$a.i12$3bv32$1: bv32;

var $$a.i12$3bv32$2: bv32;

var $$10$0bv32$1: bv32;

var $$10$0bv32$2: bv32;

var $$10$1bv32$1: bv32;

var $$10$1bv32$2: bv32;

var $$10$2bv32$1: bv32;

var $$10$2bv32$2: bv32;

var $$10$3bv32$1: bv32;

var $$10$3bv32$2: bv32;

var $$b.i11$0bv32$1: bv32;

var $$b.i11$0bv32$2: bv32;

var $$b.i11$1bv32$1: bv32;

var $$b.i11$1bv32$2: bv32;

var $$b.i11$2bv32$1: bv32;

var $$b.i11$2bv32$2: bv32;

var $$b.i11$3bv32$1: bv32;

var $$b.i11$3bv32$2: bv32;

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

var $$b.i10$0bv32$1: bv32;

var $$b.i10$0bv32$2: bv32;

var $$b.i10$1bv32$1: bv32;

var $$b.i10$1bv32$2: bv32;

var $$b.i10$2bv32$1: bv32;

var $$b.i10$2bv32$2: bv32;

var $$b.i10$3bv32$1: bv32;

var $$b.i10$3bv32$2: bv32;

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

var $$rgba.i9$0bv32$1: bv32;

var $$rgba.i9$0bv32$2: bv32;

var $$rgba.i9$1bv32$1: bv32;

var $$rgba.i9$1bv32$2: bv32;

var $$rgba.i9$2bv32$1: bv32;

var $$rgba.i9$2bv32$2: bv32;

var $$rgba.i9$3bv32$1: bv32;

var $$rgba.i9$3bv32$2: bv32;

var $$rgba.i8$0bv32$1: bv32;

var $$rgba.i8$0bv32$2: bv32;

var $$rgba.i8$1bv32$1: bv32;

var $$rgba.i8$1bv32$2: bv32;

var $$rgba.i8$2bv32$1: bv32;

var $$rgba.i8$2bv32$2: bv32;

var $$rgba.i8$3bv32$1: bv32;

var $$rgba.i8$3bv32$2: bv32;

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

var $$b.i7$0bv32$1: bv32;

var $$b.i7$0bv32$2: bv32;

var $$b.i7$1bv32$1: bv32;

var $$b.i7$1bv32$2: bv32;

var $$b.i7$2bv32$1: bv32;

var $$b.i7$2bv32$2: bv32;

var $$b.i7$3bv32$1: bv32;

var $$b.i7$3bv32$2: bv32;

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

var $$20$0bv32$1: bv32;

var $$20$0bv32$2: bv32;

var $$20$1bv32$1: bv32;

var $$20$1bv32$2: bv32;

var $$20$2bv32$1: bv32;

var $$20$2bv32$2: bv32;

var $$20$3bv32$1: bv32;

var $$20$3bv32$2: bv32;

var $$b.i6$0bv32$1: bv32;

var $$b.i6$0bv32$2: bv32;

var $$b.i6$1bv32$1: bv32;

var $$b.i6$1bv32$2: bv32;

var $$b.i6$2bv32$1: bv32;

var $$b.i6$2bv32$2: bv32;

var $$b.i6$3bv32$1: bv32;

var $$b.i6$3bv32$2: bv32;

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

var $$a.i5$0bv32$1: bv32;

var $$a.i5$0bv32$2: bv32;

var $$a.i5$1bv32$1: bv32;

var $$a.i5$1bv32$2: bv32;

var $$a.i5$2bv32$1: bv32;

var $$a.i5$2bv32$2: bv32;

var $$a.i5$3bv32$1: bv32;

var $$a.i5$3bv32$2: bv32;

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

var $$a.i4$0bv32$1: bv32;

var $$a.i4$0bv32$2: bv32;

var $$a.i4$1bv32$1: bv32;

var $$a.i4$1bv32$2: bv32;

var $$a.i4$2bv32$1: bv32;

var $$a.i4$2bv32$2: bv32;

var $$a.i4$3bv32$1: bv32;

var $$a.i4$3bv32$2: bv32;

var $$26$0bv32$1: bv32;

var $$26$0bv32$2: bv32;

var $$26$1bv32$1: bv32;

var $$26$1bv32$2: bv32;

var $$26$2bv32$1: bv32;

var $$26$2bv32$2: bv32;

var $$26$3bv32$1: bv32;

var $$26$3bv32$2: bv32;

var $$b.i$0bv32$1: bv32;

var $$b.i$0bv32$2: bv32;

var $$b.i$1bv32$1: bv32;

var $$b.i$1bv32$2: bv32;

var $$b.i$2bv32$1: bv32;

var $$b.i$2bv32$2: bv32;

var $$b.i$3bv32$1: bv32;

var $$b.i$3bv32$2: bv32;

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

var $$a.i$0bv32$1: bv32;

var $$a.i$0bv32$2: bv32;

var $$a.i$1bv32$1: bv32;

var $$a.i$1bv32$2: bv32;

var $$a.i$2bv32$1: bv32;

var $$a.i$2bv32$2: bv32;

var $$a.i$3bv32$1: bv32;

var $$a.i$3bv32$2: bv32;

var $$rgba.i$0bv32$1: bv32;

var $$rgba.i$0bv32$2: bv32;

var $$rgba.i$1bv32$1: bv32;

var $$rgba.i$1bv32$2: bv32;

var $$rgba.i$2bv32$1: bv32;

var $$rgba.i$2bv32$2: bv32;

var $$rgba.i$3bv32$1: bv32;

var $$rgba.i$3bv32$2: bv32;

var $$31$0bv32$1: bv32;

var $$31$0bv32$2: bv32;

var $$31$1bv32$1: bv32;

var $$31$1bv32$2: bv32;

var $$31$2bv32$1: bv32;

var $$31$2bv32$2: bv32;

var $$31$3bv32$1: bv32;

var $$31$3bv32$2: bv32;

var $$t$0bv32$1: bv32;

var $$t$0bv32$2: bv32;

var $$t$1bv32$1: bv32;

var $$t$1bv32$2: bv32;

var $$t$2bv32$1: bv32;

var $$t$2bv32$2: bv32;

var $$t$3bv32$1: bv32;

var $$t$3bv32$2: bv32;

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

var $$36$0bv32$1: bv32;

var $$36$0bv32$2: bv32;

var $$36$1bv32$1: bv32;

var $$36$1bv32$2: bv32;

var $$36$2bv32$1: bv32;

var $$36$2bv32$2: bv32;

var $$36$3bv32$1: bv32;

var $$36$3bv32$2: bv32;

var $$37$0bv32$1: bv32;

var $$37$0bv32$2: bv32;

var $$37$1bv32$1: bv32;

var $$37$1bv32$2: bv32;

var $$37$2bv32$1: bv32;

var $$37$2bv32$2: bv32;

var $$37$3bv32$1: bv32;

var $$37$3bv32$2: bv32;

var $$38$0bv32$1: bv32;

var $$38$0bv32$2: bv32;

var $$38$1bv32$1: bv32;

var $$38$1bv32$2: bv32;

var $$38$2bv32$1: bv32;

var $$38$2bv32$2: bv32;

var $$38$3bv32$1: bv32;

var $$38$3bv32$2: bv32;

var $$39$0bv32$1: bv32;

var $$39$0bv32$2: bv32;

var $$39$1bv32$1: bv32;

var $$39$1bv32$2: bv32;

var $$39$2bv32$1: bv32;

var $$39$2bv32$2: bv32;

var $$39$3bv32$1: bv32;

var $$39$3bv32$2: bv32;

var $$40$0bv32$1: bv32;

var $$40$0bv32$2: bv32;

var $$40$1bv32$1: bv32;

var $$40$1bv32$2: bv32;

var $$40$2bv32$1: bv32;

var $$40$2bv32$2: bv32;

var $$40$3bv32$1: bv32;

var $$40$3bv32$2: bv32;

var $$41$0bv32$1: bv32;

var $$41$0bv32$2: bv32;

var $$41$1bv32$1: bv32;

var $$41$1bv32$2: bv32;

var $$41$2bv32$1: bv32;

var $$41$2bv32$2: bv32;

var $$41$3bv32$1: bv32;

var $$41$3bv32$2: bv32;

var $$42$0bv32$1: bv32;

var $$42$0bv32$2: bv32;

var $$42$1bv32$1: bv32;

var $$42$1bv32$2: bv32;

var $$42$2bv32$1: bv32;

var $$42$2bv32$2: bv32;

var $$42$3bv32$1: bv32;

var $$42$3bv32$2: bv32;

var $$43$0bv32$1: bv32;

var $$43$0bv32$2: bv32;

var $$43$1bv32$1: bv32;

var $$43$1bv32$2: bv32;

var $$43$2bv32$1: bv32;

var $$43$2bv32$2: bv32;

var $$43$3bv32$1: bv32;

var $$43$3bv32$2: bv32;

var $$44$0bv32$1: bv32;

var $$44$0bv32$2: bv32;

var $$44$1bv32$1: bv32;

var $$44$1bv32$2: bv32;

var $$44$2bv32$1: bv32;

var $$44$2bv32$2: bv32;

var $$44$3bv32$1: bv32;

var $$44$3bv32$2: bv32;

var $$45$0bv32$1: bv32;

var $$45$0bv32$2: bv32;

var $$45$1bv32$1: bv32;

var $$45$1bv32$2: bv32;

var $$45$2bv32$1: bv32;

var $$45$2bv32$2: bv32;

var $$45$3bv32$1: bv32;

var $$45$3bv32$2: bv32;

var $$46$0bv32$1: bv32;

var $$46$0bv32$2: bv32;

var $$46$1bv32$1: bv32;

var $$46$1bv32$2: bv32;

var $$46$2bv32$1: bv32;

var $$46$2bv32$2: bv32;

var $$46$3bv32$1: bv32;

var $$46$3bv32$2: bv32;

var $$47$0bv32$1: bv32;

var $$47$0bv32$2: bv32;

var $$47$1bv32$1: bv32;

var $$47$1bv32$2: bv32;

var $$47$2bv32$1: bv32;

var $$47$2bv32$2: bv32;

var $$47$3bv32$1: bv32;

var $$47$3bv32$2: bv32;

var $$48$0bv32$1: bv32;

var $$48$0bv32$2: bv32;

var $$48$1bv32$1: bv32;

var $$48$1bv32$2: bv32;

var $$48$2bv32$1: bv32;

var $$48$2bv32$2: bv32;

var $$48$3bv32$1: bv32;

var $$48$3bv32$2: bv32;

const _WATCHED_VALUE_$$id: bv32;

procedure {:inline 1} _LOG_READ_$$id(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$id;



implementation {:inline 1} _LOG_READ_$$id(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$id := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$id == _value then true else _READ_HAS_OCCURRED_$$id);
    return;
}



procedure _CHECK_READ_$$id(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "id"} {:array "$$id"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$id);
  requires {:source_name "id"} {:array "$$id"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$id: bool;

procedure {:inline 1} _LOG_WRITE_$$id(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$id, _WRITE_READ_BENIGN_FLAG_$$id;



implementation {:inline 1} _LOG_WRITE_$$id(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$id := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$id == _value then true else _WRITE_HAS_OCCURRED_$$id);
    _WRITE_READ_BENIGN_FLAG_$$id := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$id == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$id);
    return;
}



procedure _CHECK_WRITE_$$id(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "id"} {:array "$$id"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$id != _value);
  requires {:source_name "id"} {:array "$$id"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$id != _value);
  requires {:source_name "id"} {:array "$$id"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$id(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$id;



implementation {:inline 1} _LOG_ATOMIC_$$id(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$id := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$id);
    return;
}



procedure _CHECK_ATOMIC_$$id(_P: bool, _offset: bv32);
  requires {:source_name "id"} {:array "$$id"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset);
  requires {:source_name "id"} {:array "$$id"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$id(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$id;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$id(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$id := (if _P && _WRITE_HAS_OCCURRED_$$id && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$id);
    return;
}



const _WATCHED_VALUE_$$od: bv32;

procedure {:inline 1} _LOG_READ_$$od(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$od;



implementation {:inline 1} _LOG_READ_$$od(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$od := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$od == _value then true else _READ_HAS_OCCURRED_$$od);
    return;
}



procedure _CHECK_READ_$$od(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "od"} {:array "$$od"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$od);
  requires {:source_name "od"} {:array "$$od"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$od: bool;

procedure {:inline 1} _LOG_WRITE_$$od(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$od, _WRITE_READ_BENIGN_FLAG_$$od;



implementation {:inline 1} _LOG_WRITE_$$od(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$od := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$od == _value then true else _WRITE_HAS_OCCURRED_$$od);
    _WRITE_READ_BENIGN_FLAG_$$od := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$od == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$od);
    return;
}



procedure _CHECK_WRITE_$$od(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "od"} {:array "$$od"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$od != _value);
  requires {:source_name "od"} {:array "$$od"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$od != _value);
  requires {:source_name "od"} {:array "$$od"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$od(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$od;



implementation {:inline 1} _LOG_ATOMIC_$$od(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$od := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$od);
    return;
}



procedure _CHECK_ATOMIC_$$od(_P: bool, _offset: bv32);
  requires {:source_name "od"} {:array "$$od"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset);
  requires {:source_name "od"} {:array "$$od"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$od(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$od;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$od(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$od := (if _P && _WRITE_HAS_OCCURRED_$$od && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$od);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
