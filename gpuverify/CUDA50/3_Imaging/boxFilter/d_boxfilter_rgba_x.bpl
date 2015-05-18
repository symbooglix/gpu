type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "od"} {:global} $$od: [bv32]bv32;

axiom {:array_info "$$od"} {:global} {:elem_width 32} {:source_name "od"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$od: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$od: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$od: bool;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i5"} {:elem_width 32} {:source_name "a.i5"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i4"} {:elem_width 32} {:source_name "b.i4"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i3"} {:elem_width 32} {:source_name "b.i3"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$rgba.i2"} {:elem_width 32} {:source_name "rgba.i2"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i"} {:elem_width 32} {:source_name "a.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$8"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i"} {:elem_width 32} {:source_name "b.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$9"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$rgba.i"} {:elem_width 32} {:source_name "rgba.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$10"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$11"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$t"} {:elem_width 32} {:source_name "t"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$12"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$13"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$14"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$15"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$16"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$17"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$18"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$19"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$20"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$21"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$rgbaTex"} {:global} {:elem_width 8} {:source_name "rgbaTex"} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$rgbaTex: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$rgbaTex: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 96} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$rgbaTex: bool;

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

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV32_OR(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "d_boxfilter_rgba_x"} {:kernel} $_Z18d_boxfilter_rgba_xPjiii($w: bv32, $h: bv32, $r: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $w == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $h == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$od && !_WRITE_HAS_OCCURRED_$$od && !_ATOMIC_HAS_OCCURRED_$$od;
  requires !_READ_HAS_OCCURRED_$$rgbaTex && !_WRITE_HAS_OCCURRED_$$rgbaTex && !_ATOMIC_HAS_OCCURRED_$$rgbaTex;
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



implementation {:source_name "d_boxfilter_rgba_x"} {:kernel} $_Z18d_boxfilter_rgba_xPjiii($w: bv32, $h: bv32, $r: bv32)
{
  var $x.0$1: bv32;
  var $x.0$2: bv32;
  var $x1.0$1: bv32;
  var $x1.0$2: bv32;
  var v0: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
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
  var v11$1: bool;
  var v11$2: bool;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
  var v20$1: bv8;
  var v20$2: bv8;
  var v16$1: bv8;
  var v16$2: bv8;
  var v17$1: bv8;
  var v17$2: bv8;
  var v18$1: bv8;
  var v18$2: bv8;
  var v19$1: bv8;
  var v19$2: bv8;
  var v21$1: bv8;
  var v21$2: bv8;
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
  var v40$1: bv32;
  var v40$2: bv32;
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
  var v36$1: bv128;
  var v36$2: bv128;
  var v37$1: bv32;
  var v37$2: bv32;
  var v38$1: bv32;
  var v38$2: bv32;
  var v39$1: bv32;
  var v39$2: bv32;
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
  var v90$1: bv32;
  var v90$2: bv32;
  var v91$1: bv32;
  var v91$2: bv32;
  var v92$1: bv32;
  var v92$2: bv32;
  var v93$1: bool;
  var v93$2: bool;
  var v94$1: bv8;
  var v94$2: bv8;
  var v95$1: bv8;
  var v95$2: bv8;
  var v96$1: bv8;
  var v96$2: bv8;
  var v97$1: bv8;
  var v97$2: bv8;
  var v102$1: bv8;
  var v102$2: bv8;
  var v98$1: bv8;
  var v98$2: bv8;
  var v99$1: bv8;
  var v99$2: bv8;
  var v100$1: bv8;
  var v100$2: bv8;
  var v101$1: bv8;
  var v101$2: bv8;
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
  var v118$1: bv128;
  var v118$2: bv128;
  var v119$1: bv32;
  var v119$2: bv32;
  var v120$1: bv32;
  var v120$2: bv32;
  var v121$1: bv32;
  var v121$2: bv32;
  var v143$1: bv8;
  var v143$2: bv8;
  var v144$1: bv8;
  var v144$2: bv8;
  var v145$1: bv8;
  var v145$2: bv8;
  var v146$1: bv8;
  var v146$2: bv8;
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
  var v142$1: bv8;
  var v142$2: bv8;
  var v135$1: bv32;
  var v135$2: bv32;
  var v136$1: bv32;
  var v136$2: bv32;
  var v137$1: bv32;
  var v137$2: bv32;
  var v138$1: bv32;
  var v138$2: bv32;
  var v139$1: bv8;
  var v139$2: bv8;
  var v140$1: bv8;
  var v140$2: bv8;
  var v141$1: bv8;
  var v141$2: bv8;
  var v188$1: bv32;
  var v188$2: bv32;
  var v189$1: bv32;
  var v189$2: bv32;
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
  var v157$1: bv8;
  var v157$2: bv8;
  var v158$1: bv8;
  var v158$2: bv8;
  var v159$1: bv8;
  var v159$2: bv8;
  var v160$1: bv8;
  var v160$2: bv8;
  var v161$1: bv8;
  var v161$2: bv8;
  var v162$1: bv8;
  var v162$2: bv8;
  var v163$1: bv128;
  var v163$2: bv128;
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
  var v184$1: bv32;
  var v184$2: bv32;
  var v180$1: bv32;
  var v180$2: bv32;
  var v181$1: bv32;
  var v181$2: bv32;
  var v182$1: bv32;
  var v182$2: bv32;
  var v183$1: bv32;
  var v183$2: bv32;
  var v185$1: bv32;
  var v185$2: bv32;
  var v186$1: bv32;
  var v186$2: bv32;
  var v187$1: bv32;
  var v187$2: bv32;
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
  var _HAVOC_bv8$1: bv8;
  var _HAVOC_bv8$2: bv8;


  $0:
    v0 := FDIV32(1065353216bv32, SI32_TO_FP32(BV32_ADD(BV32_SHL($r, 1bv32), 1bv32)));
    v1$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v2$1 := BV32_ULT(v1$1, $h);
    v2$2 := BV32_ULT(v1$2, $h);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p3$1 := false;
    p3$2 := false;
    p5$1 := false;
    p5$2 := false;
    p0$1 := (if v2$1 then v2$1 else p0$1);
    p0$2 := (if v2$2 then v2$2 else p0$2);
    $$10$0bv32$1 := (if p0$1 then 0bv32 else $$10$0bv32$1);
    $$10$0bv32$2 := (if p0$2 then 0bv32 else $$10$0bv32$2);
    $$10$1bv32$1 := (if p0$1 then 0bv32 else $$10$1bv32$1);
    $$10$1bv32$2 := (if p0$2 then 0bv32 else $$10$1bv32$2);
    $$10$2bv32$1 := (if p0$1 then 0bv32 else $$10$2bv32$1);
    $$10$2bv32$2 := (if p0$2 then 0bv32 else $$10$2bv32$2);
    $$10$3bv32$1 := (if p0$1 then 0bv32 else $$10$3bv32$1);
    $$10$3bv32$2 := (if p0$2 then 0bv32 else $$10$3bv32$2);
    v3$1 := (if p0$1 then $$10$0bv32$1 else v3$1);
    v3$2 := (if p0$2 then $$10$0bv32$2 else v3$2);
    v4$1 := (if p0$1 then $$10$1bv32$1 else v4$1);
    v4$2 := (if p0$2 then $$10$1bv32$2 else v4$2);
    v5$1 := (if p0$1 then $$10$2bv32$1 else v5$1);
    v5$2 := (if p0$2 then $$10$2bv32$2 else v5$2);
    v6$1 := (if p0$1 then $$10$3bv32$1 else v6$1);
    v6$2 := (if p0$2 then $$10$3bv32$2 else v6$2);
    $$11$0bv32$1 := (if p0$1 then v3$1 else $$11$0bv32$1);
    $$11$0bv32$2 := (if p0$2 then v3$2 else $$11$0bv32$2);
    $$11$1bv32$1 := (if p0$1 then v4$1 else $$11$1bv32$1);
    $$11$1bv32$2 := (if p0$2 then v4$2 else $$11$1bv32$2);
    $$11$2bv32$1 := (if p0$1 then v5$1 else $$11$2bv32$1);
    $$11$2bv32$2 := (if p0$2 then v5$2 else $$11$2bv32$2);
    $$11$3bv32$1 := (if p0$1 then v6$1 else $$11$3bv32$1);
    $$11$3bv32$2 := (if p0$2 then v6$2 else $$11$3bv32$2);
    v7$1 := (if p0$1 then $$11$0bv32$1 else v7$1);
    v7$2 := (if p0$2 then $$11$0bv32$2 else v7$2);
    v8$1 := (if p0$1 then $$11$1bv32$1 else v8$1);
    v8$2 := (if p0$2 then $$11$1bv32$2 else v8$2);
    v9$1 := (if p0$1 then $$11$2bv32$1 else v9$1);
    v9$2 := (if p0$2 then $$11$2bv32$2 else v9$2);
    v10$1 := (if p0$1 then $$11$3bv32$1 else v10$1);
    v10$2 := (if p0$2 then $$11$3bv32$2 else v10$2);
    $$t$0bv32$1 := (if p0$1 then v7$1 else $$t$0bv32$1);
    $$t$0bv32$2 := (if p0$2 then v7$2 else $$t$0bv32$2);
    $$t$1bv32$1 := (if p0$1 then v8$1 else $$t$1bv32$1);
    $$t$1bv32$2 := (if p0$2 then v8$2 else $$t$1bv32$2);
    $$t$2bv32$1 := (if p0$1 then v9$1 else $$t$2bv32$1);
    $$t$2bv32$2 := (if p0$2 then v9$2 else $$t$2bv32$2);
    $$t$3bv32$1 := (if p0$1 then v10$1 else $$t$3bv32$1);
    $$t$3bv32$2 := (if p0$2 then v10$2 else $$t$3bv32$2);
    $x.0$1 := (if p0$1 then BV32_SUB(0bv32, $r) else $x.0$1);
    $x.0$2 := (if p0$2 then BV32_SUB(0bv32, $r) else $x.0$2);
    p1$1 := (if p0$1 then true else p1$1);
    p1$2 := (if p0$2 then true else p1$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $2;

  $2:
    assume {:captureState "loop_head_state_1"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 24} p1$1 ==> true;
    v11$1 := (if p1$1 then BV32_SLE($x.0$1, $r) else v11$1);
    v11$2 := (if p1$2 then BV32_SLE($x.0$2, $r) else v11$2);
    p2$1 := false;
    p2$2 := false;
    p2$1 := (if p1$1 && v11$1 then v11$1 else p2$1);
    p2$2 := (if p1$2 && v11$2 then v11$2 else p2$2);
    p1$1 := (if p1$1 && !v11$1 then v11$1 else p1$1);
    p1$2 := (if p1$2 && !v11$2 then v11$2 else p1$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v12$1 := (if p2$1 then _HAVOC_bv8$1 else v12$1);
    v12$2 := (if p2$2 then _HAVOC_bv8$2 else v12$2);
    $$13$0bv32$1 := (if p2$1 then v12$1 else $$13$0bv32$1);
    $$13$0bv32$2 := (if p2$2 then v12$2 else $$13$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v13$1 := (if p2$1 then _HAVOC_bv8$1 else v13$1);
    v13$2 := (if p2$2 then _HAVOC_bv8$2 else v13$2);
    $$13$1bv32$1 := (if p2$1 then v13$1 else $$13$1bv32$1);
    $$13$1bv32$2 := (if p2$2 then v13$2 else $$13$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v14$1 := (if p2$1 then _HAVOC_bv8$1 else v14$1);
    v14$2 := (if p2$2 then _HAVOC_bv8$2 else v14$2);
    $$13$2bv32$1 := (if p2$1 then v14$1 else $$13$2bv32$1);
    $$13$2bv32$2 := (if p2$2 then v14$2 else $$13$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v15$1 := (if p2$1 then _HAVOC_bv8$1 else v15$1);
    v15$2 := (if p2$2 then _HAVOC_bv8$2 else v15$2);
    $$13$3bv32$1 := (if p2$1 then v15$1 else $$13$3bv32$1);
    $$13$3bv32$2 := (if p2$2 then v15$2 else $$13$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v16$1 := (if p2$1 then _HAVOC_bv8$1 else v16$1);
    v16$2 := (if p2$2 then _HAVOC_bv8$2 else v16$2);
    $$13$4bv32$1 := (if p2$1 then v16$1 else $$13$4bv32$1);
    $$13$4bv32$2 := (if p2$2 then v16$2 else $$13$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v17$1 := (if p2$1 then _HAVOC_bv8$1 else v17$1);
    v17$2 := (if p2$2 then _HAVOC_bv8$2 else v17$2);
    $$13$5bv32$1 := (if p2$1 then v17$1 else $$13$5bv32$1);
    $$13$5bv32$2 := (if p2$2 then v17$2 else $$13$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v18$1 := (if p2$1 then _HAVOC_bv8$1 else v18$1);
    v18$2 := (if p2$2 then _HAVOC_bv8$2 else v18$2);
    $$13$6bv32$1 := (if p2$1 then v18$1 else $$13$6bv32$1);
    $$13$6bv32$2 := (if p2$2 then v18$2 else $$13$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v19$1 := (if p2$1 then _HAVOC_bv8$1 else v19$1);
    v19$2 := (if p2$2 then _HAVOC_bv8$2 else v19$2);
    $$13$7bv32$1 := (if p2$1 then v19$1 else $$13$7bv32$1);
    $$13$7bv32$2 := (if p2$2 then v19$2 else $$13$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v20$1 := (if p2$1 then _HAVOC_bv8$1 else v20$1);
    v20$2 := (if p2$2 then _HAVOC_bv8$2 else v20$2);
    $$13$8bv32$1 := (if p2$1 then v20$1 else $$13$8bv32$1);
    $$13$8bv32$2 := (if p2$2 then v20$2 else $$13$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v21$1 := (if p2$1 then _HAVOC_bv8$1 else v21$1);
    v21$2 := (if p2$2 then _HAVOC_bv8$2 else v21$2);
    $$13$9bv32$1 := (if p2$1 then v21$1 else $$13$9bv32$1);
    $$13$9bv32$2 := (if p2$2 then v21$2 else $$13$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v22$1 := (if p2$1 then _HAVOC_bv8$1 else v22$1);
    v22$2 := (if p2$2 then _HAVOC_bv8$2 else v22$2);
    $$13$10bv32$1 := (if p2$1 then v22$1 else $$13$10bv32$1);
    $$13$10bv32$2 := (if p2$2 then v22$2 else $$13$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v23$1 := (if p2$1 then _HAVOC_bv8$1 else v23$1);
    v23$2 := (if p2$2 then _HAVOC_bv8$2 else v23$2);
    $$13$11bv32$1 := (if p2$1 then v23$1 else $$13$11bv32$1);
    $$13$11bv32$2 := (if p2$2 then v23$2 else $$13$11bv32$2);
    v24$1 := (if p2$1 then $$13$0bv32$1 else v24$1);
    v24$2 := (if p2$2 then $$13$0bv32$2 else v24$2);
    v25$1 := (if p2$1 then $$13$1bv32$1 else v25$1);
    v25$2 := (if p2$2 then $$13$1bv32$2 else v25$2);
    v26$1 := (if p2$1 then $$13$2bv32$1 else v26$1);
    v26$2 := (if p2$2 then $$13$2bv32$2 else v26$2);
    v27$1 := (if p2$1 then $$13$3bv32$1 else v27$1);
    v27$2 := (if p2$2 then $$13$3bv32$2 else v27$2);
    v28$1 := (if p2$1 then $$13$4bv32$1 else v28$1);
    v28$2 := (if p2$2 then $$13$4bv32$2 else v28$2);
    v29$1 := (if p2$1 then $$13$5bv32$1 else v29$1);
    v29$2 := (if p2$2 then $$13$5bv32$2 else v29$2);
    v30$1 := (if p2$1 then $$13$6bv32$1 else v30$1);
    v30$2 := (if p2$2 then $$13$6bv32$2 else v30$2);
    v31$1 := (if p2$1 then $$13$7bv32$1 else v31$1);
    v31$2 := (if p2$2 then $$13$7bv32$2 else v31$2);
    v32$1 := (if p2$1 then $$13$8bv32$1 else v32$1);
    v32$2 := (if p2$2 then $$13$8bv32$2 else v32$2);
    v33$1 := (if p2$1 then $$13$9bv32$1 else v33$1);
    v33$2 := (if p2$2 then $$13$9bv32$2 else v33$2);
    v34$1 := (if p2$1 then $$13$10bv32$1 else v34$1);
    v34$2 := (if p2$2 then $$13$10bv32$2 else v34$2);
    v35$1 := (if p2$1 then $$13$11bv32$1 else v35$1);
    v35$2 := (if p2$2 then $$13$11bv32$2 else v35$2);
    call {:sourceloc_num 62} v36$1, v36$2 := $_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff(p2$1, v27$1 ++ v26$1 ++ v25$1 ++ v24$1, v31$1 ++ v30$1 ++ v29$1 ++ v28$1, v35$1 ++ v34$1 ++ v33$1 ++ v32$1, SI32_TO_FP32($x.0$1), UI32_TO_FP32(v1$1), p2$2, v27$2 ++ v26$2 ++ v25$2 ++ v24$2, v31$2 ++ v30$2 ++ v29$2 ++ v28$2, v35$2 ++ v34$2 ++ v33$2 ++ v32$2, SI32_TO_FP32($x.0$2), UI32_TO_FP32(v1$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff"} true;
    $$12$0bv32$1 := (if p2$1 then v36$1[32:0] else $$12$0bv32$1);
    $$12$0bv32$2 := (if p2$2 then v36$2[32:0] else $$12$0bv32$2);
    $$12$1bv32$1 := (if p2$1 then v36$1[64:32] else $$12$1bv32$1);
    $$12$1bv32$2 := (if p2$2 then v36$2[64:32] else $$12$1bv32$2);
    $$12$2bv32$1 := (if p2$1 then v36$1[96:64] else $$12$2bv32$1);
    $$12$2bv32$2 := (if p2$2 then v36$2[96:64] else $$12$2bv32$2);
    $$12$3bv32$1 := (if p2$1 then v36$1[128:96] else $$12$3bv32$1);
    $$12$3bv32$2 := (if p2$2 then v36$2[128:96] else $$12$3bv32$2);
    v37$1 := (if p2$1 then $$12$0bv32$1 else v37$1);
    v37$2 := (if p2$2 then $$12$0bv32$2 else v37$2);
    v38$1 := (if p2$1 then $$12$1bv32$1 else v38$1);
    v38$2 := (if p2$2 then $$12$1bv32$2 else v38$2);
    v39$1 := (if p2$1 then $$12$2bv32$1 else v39$1);
    v39$2 := (if p2$2 then $$12$2bv32$2 else v39$2);
    v40$1 := (if p2$1 then $$12$3bv32$1 else v40$1);
    v40$2 := (if p2$2 then $$12$3bv32$2 else v40$2);
    $$b.i$0bv32$1 := (if p2$1 then v37$1 else $$b.i$0bv32$1);
    $$b.i$0bv32$2 := (if p2$2 then v37$2 else $$b.i$0bv32$2);
    $$b.i$1bv32$1 := (if p2$1 then v38$1 else $$b.i$1bv32$1);
    $$b.i$1bv32$2 := (if p2$2 then v38$2 else $$b.i$1bv32$2);
    $$b.i$2bv32$1 := (if p2$1 then v39$1 else $$b.i$2bv32$1);
    $$b.i$2bv32$2 := (if p2$2 then v39$2 else $$b.i$2bv32$2);
    $$b.i$3bv32$1 := (if p2$1 then v40$1 else $$b.i$3bv32$1);
    $$b.i$3bv32$2 := (if p2$2 then v40$2 else $$b.i$3bv32$2);
    v41$1 := (if p2$1 then $$t$0bv32$1 else v41$1);
    v41$2 := (if p2$2 then $$t$0bv32$2 else v41$2);
    v42$1 := (if p2$1 then $$b.i$0bv32$1 else v42$1);
    v42$2 := (if p2$2 then $$b.i$0bv32$2 else v42$2);
    v43$1 := (if p2$1 then $$t$1bv32$1 else v43$1);
    v43$2 := (if p2$2 then $$t$1bv32$2 else v43$2);
    v44$1 := (if p2$1 then $$b.i$1bv32$1 else v44$1);
    v44$2 := (if p2$2 then $$b.i$1bv32$2 else v44$2);
    v45$1 := (if p2$1 then $$t$2bv32$1 else v45$1);
    v45$2 := (if p2$2 then $$t$2bv32$2 else v45$2);
    v46$1 := (if p2$1 then $$b.i$2bv32$1 else v46$1);
    v46$2 := (if p2$2 then $$b.i$2bv32$2 else v46$2);
    v47$1 := (if p2$1 then $$t$3bv32$1 else v47$1);
    v47$2 := (if p2$2 then $$t$3bv32$2 else v47$2);
    v48$1 := (if p2$1 then $$b.i$3bv32$1 else v48$1);
    v48$2 := (if p2$2 then $$b.i$3bv32$2 else v48$2);
    $$8$0bv32$1 := (if p2$1 then FADD32(v41$1, v42$1) else $$8$0bv32$1);
    $$8$0bv32$2 := (if p2$2 then FADD32(v41$2, v42$2) else $$8$0bv32$2);
    $$8$1bv32$1 := (if p2$1 then FADD32(v43$1, v44$1) else $$8$1bv32$1);
    $$8$1bv32$2 := (if p2$2 then FADD32(v43$2, v44$2) else $$8$1bv32$2);
    $$8$2bv32$1 := (if p2$1 then FADD32(v45$1, v46$1) else $$8$2bv32$1);
    $$8$2bv32$2 := (if p2$2 then FADD32(v45$2, v46$2) else $$8$2bv32$2);
    $$8$3bv32$1 := (if p2$1 then FADD32(v47$1, v48$1) else $$8$3bv32$1);
    $$8$3bv32$2 := (if p2$2 then FADD32(v47$2, v48$2) else $$8$3bv32$2);
    v49$1 := (if p2$1 then $$8$0bv32$1 else v49$1);
    v49$2 := (if p2$2 then $$8$0bv32$2 else v49$2);
    v50$1 := (if p2$1 then $$8$1bv32$1 else v50$1);
    v50$2 := (if p2$2 then $$8$1bv32$2 else v50$2);
    v51$1 := (if p2$1 then $$8$2bv32$1 else v51$1);
    v51$2 := (if p2$2 then $$8$2bv32$2 else v51$2);
    v52$1 := (if p2$1 then $$8$3bv32$1 else v52$1);
    v52$2 := (if p2$2 then $$8$3bv32$2 else v52$2);
    $$9$0bv32$1 := (if p2$1 then v49$1 else $$9$0bv32$1);
    $$9$0bv32$2 := (if p2$2 then v49$2 else $$9$0bv32$2);
    $$9$1bv32$1 := (if p2$1 then v50$1 else $$9$1bv32$1);
    $$9$1bv32$2 := (if p2$2 then v50$2 else $$9$1bv32$2);
    $$9$2bv32$1 := (if p2$1 then v51$1 else $$9$2bv32$1);
    $$9$2bv32$2 := (if p2$2 then v51$2 else $$9$2bv32$2);
    $$9$3bv32$1 := (if p2$1 then v52$1 else $$9$3bv32$1);
    $$9$3bv32$2 := (if p2$2 then v52$2 else $$9$3bv32$2);
    v53$1 := (if p2$1 then $$9$0bv32$1 else v53$1);
    v53$2 := (if p2$2 then $$9$0bv32$2 else v53$2);
    $$t$0bv32$1 := (if p2$1 then v53$1 else $$t$0bv32$1);
    $$t$0bv32$2 := (if p2$2 then v53$2 else $$t$0bv32$2);
    v54$1 := (if p2$1 then $$9$1bv32$1 else v54$1);
    v54$2 := (if p2$2 then $$9$1bv32$2 else v54$2);
    $$t$1bv32$1 := (if p2$1 then v54$1 else $$t$1bv32$1);
    $$t$1bv32$2 := (if p2$2 then v54$2 else $$t$1bv32$2);
    v55$1 := (if p2$1 then $$9$2bv32$1 else v55$1);
    v55$2 := (if p2$2 then $$9$2bv32$2 else v55$2);
    $$t$2bv32$1 := (if p2$1 then v55$1 else $$t$2bv32$1);
    $$t$2bv32$2 := (if p2$2 then v55$2 else $$t$2bv32$2);
    v56$1 := (if p2$1 then $$9$3bv32$1 else v56$1);
    v56$2 := (if p2$2 then $$9$3bv32$2 else v56$2);
    $$t$3bv32$1 := (if p2$1 then v56$1 else $$t$3bv32$1);
    $$t$3bv32$2 := (if p2$2 then v56$2 else $$t$3bv32$2);
    $x.0$1 := (if p2$1 then BV32_ADD($x.0$1, 1bv32) else $x.0$1);
    $x.0$2 := (if p2$2 then BV32_ADD($x.0$2, 1bv32) else $x.0$2);
    p1$1 := (if p2$1 then true else p1$1);
    p1$2 := (if p2$2 then true else p1$2);
    goto $2.backedge, $2.tail;

  $2.tail:
    assume !p1$1 && !p1$2;
    v57$1 := (if p0$1 then $$t$0bv32$1 else v57$1);
    v57$2 := (if p0$2 then $$t$0bv32$2 else v57$2);
    $$15$0bv32$1 := (if p0$1 then v57$1 else $$15$0bv32$1);
    $$15$0bv32$2 := (if p0$2 then v57$2 else $$15$0bv32$2);
    v58$1 := (if p0$1 then $$t$1bv32$1 else v58$1);
    v58$2 := (if p0$2 then $$t$1bv32$2 else v58$2);
    $$15$1bv32$1 := (if p0$1 then v58$1 else $$15$1bv32$1);
    $$15$1bv32$2 := (if p0$2 then v58$2 else $$15$1bv32$2);
    v59$1 := (if p0$1 then $$t$2bv32$1 else v59$1);
    v59$2 := (if p0$2 then $$t$2bv32$2 else v59$2);
    $$15$2bv32$1 := (if p0$1 then v59$1 else $$15$2bv32$1);
    $$15$2bv32$2 := (if p0$2 then v59$2 else $$15$2bv32$2);
    v60$1 := (if p0$1 then $$t$3bv32$1 else v60$1);
    v60$2 := (if p0$2 then $$t$3bv32$2 else v60$2);
    $$15$3bv32$1 := (if p0$1 then v60$1 else $$15$3bv32$1);
    $$15$3bv32$2 := (if p0$2 then v60$2 else $$15$3bv32$2);
    v61$1 := (if p0$1 then $$15$0bv32$1 else v61$1);
    v61$2 := (if p0$2 then $$15$0bv32$2 else v61$2);
    v62$1 := (if p0$1 then $$15$1bv32$1 else v62$1);
    v62$2 := (if p0$2 then $$15$1bv32$2 else v62$2);
    v63$1 := (if p0$1 then $$15$2bv32$1 else v63$1);
    v63$2 := (if p0$2 then $$15$2bv32$2 else v63$2);
    v64$1 := (if p0$1 then $$15$3bv32$1 else v64$1);
    v64$2 := (if p0$2 then $$15$3bv32$2 else v64$2);
    $$a.i$0bv32$1 := (if p0$1 then v61$1 else $$a.i$0bv32$1);
    $$a.i$0bv32$2 := (if p0$2 then v61$2 else $$a.i$0bv32$2);
    $$a.i$1bv32$1 := (if p0$1 then v62$1 else $$a.i$1bv32$1);
    $$a.i$1bv32$2 := (if p0$2 then v62$2 else $$a.i$1bv32$2);
    $$a.i$2bv32$1 := (if p0$1 then v63$1 else $$a.i$2bv32$1);
    $$a.i$2bv32$2 := (if p0$2 then v63$2 else $$a.i$2bv32$2);
    $$a.i$3bv32$1 := (if p0$1 then v64$1 else $$a.i$3bv32$1);
    $$a.i$3bv32$2 := (if p0$2 then v64$2 else $$a.i$3bv32$2);
    v65$1 := (if p0$1 then $$a.i$0bv32$1 else v65$1);
    v65$2 := (if p0$2 then $$a.i$0bv32$2 else v65$2);
    v66$1 := (if p0$1 then $$a.i$1bv32$1 else v66$1);
    v66$2 := (if p0$2 then $$a.i$1bv32$2 else v66$2);
    v67$1 := (if p0$1 then $$a.i$2bv32$1 else v67$1);
    v67$2 := (if p0$2 then $$a.i$2bv32$2 else v67$2);
    v68$1 := (if p0$1 then $$a.i$3bv32$1 else v68$1);
    v68$2 := (if p0$2 then $$a.i$3bv32$2 else v68$2);
    $$6$0bv32$1 := (if p0$1 then FMUL32(v65$1, v0) else $$6$0bv32$1);
    $$6$0bv32$2 := (if p0$2 then FMUL32(v65$2, v0) else $$6$0bv32$2);
    $$6$1bv32$1 := (if p0$1 then FMUL32(v66$1, v0) else $$6$1bv32$1);
    $$6$1bv32$2 := (if p0$2 then FMUL32(v66$2, v0) else $$6$1bv32$2);
    $$6$2bv32$1 := (if p0$1 then FMUL32(v67$1, v0) else $$6$2bv32$1);
    $$6$2bv32$2 := (if p0$2 then FMUL32(v67$2, v0) else $$6$2bv32$2);
    $$6$3bv32$1 := (if p0$1 then FMUL32(v68$1, v0) else $$6$3bv32$1);
    $$6$3bv32$2 := (if p0$2 then FMUL32(v68$2, v0) else $$6$3bv32$2);
    v69$1 := (if p0$1 then $$6$0bv32$1 else v69$1);
    v69$2 := (if p0$2 then $$6$0bv32$2 else v69$2);
    v70$1 := (if p0$1 then $$6$1bv32$1 else v70$1);
    v70$2 := (if p0$2 then $$6$1bv32$2 else v70$2);
    v71$1 := (if p0$1 then $$6$2bv32$1 else v71$1);
    v71$2 := (if p0$2 then $$6$2bv32$2 else v71$2);
    v72$1 := (if p0$1 then $$6$3bv32$1 else v72$1);
    v72$2 := (if p0$2 then $$6$3bv32$2 else v72$2);
    $$7$0bv32$1 := (if p0$1 then v69$1 else $$7$0bv32$1);
    $$7$0bv32$2 := (if p0$2 then v69$2 else $$7$0bv32$2);
    $$7$1bv32$1 := (if p0$1 then v70$1 else $$7$1bv32$1);
    $$7$1bv32$2 := (if p0$2 then v70$2 else $$7$1bv32$2);
    $$7$2bv32$1 := (if p0$1 then v71$1 else $$7$2bv32$1);
    $$7$2bv32$2 := (if p0$2 then v71$2 else $$7$2bv32$2);
    $$7$3bv32$1 := (if p0$1 then v72$1 else $$7$3bv32$1);
    $$7$3bv32$2 := (if p0$2 then v72$2 else $$7$3bv32$2);
    v73$1 := (if p0$1 then $$7$0bv32$1 else v73$1);
    v73$2 := (if p0$2 then $$7$0bv32$2 else v73$2);
    v74$1 := (if p0$1 then $$7$1bv32$1 else v74$1);
    v74$2 := (if p0$2 then $$7$1bv32$2 else v74$2);
    v75$1 := (if p0$1 then $$7$2bv32$1 else v75$1);
    v75$2 := (if p0$2 then $$7$2bv32$2 else v75$2);
    v76$1 := (if p0$1 then $$7$3bv32$1 else v76$1);
    v76$2 := (if p0$2 then $$7$3bv32$2 else v76$2);
    $$14$0bv32$1 := (if p0$1 then v73$1 else $$14$0bv32$1);
    $$14$0bv32$2 := (if p0$2 then v73$2 else $$14$0bv32$2);
    $$14$1bv32$1 := (if p0$1 then v74$1 else $$14$1bv32$1);
    $$14$1bv32$2 := (if p0$2 then v74$2 else $$14$1bv32$2);
    $$14$2bv32$1 := (if p0$1 then v75$1 else $$14$2bv32$1);
    $$14$2bv32$2 := (if p0$2 then v75$2 else $$14$2bv32$2);
    $$14$3bv32$1 := (if p0$1 then v76$1 else $$14$3bv32$1);
    $$14$3bv32$2 := (if p0$2 then v76$2 else $$14$3bv32$2);
    v77$1 := (if p0$1 then $$14$0bv32$1 else v77$1);
    v77$2 := (if p0$2 then $$14$0bv32$2 else v77$2);
    v78$1 := (if p0$1 then $$14$1bv32$1 else v78$1);
    v78$2 := (if p0$2 then $$14$1bv32$2 else v78$2);
    v79$1 := (if p0$1 then $$14$2bv32$1 else v79$1);
    v79$2 := (if p0$2 then $$14$2bv32$2 else v79$2);
    v80$1 := (if p0$1 then $$14$3bv32$1 else v80$1);
    v80$2 := (if p0$2 then $$14$3bv32$2 else v80$2);
    $$rgba.i2$0bv32$1 := (if p0$1 then v77$1 else $$rgba.i2$0bv32$1);
    $$rgba.i2$0bv32$2 := (if p0$2 then v77$2 else $$rgba.i2$0bv32$2);
    $$rgba.i2$1bv32$1 := (if p0$1 then v78$1 else $$rgba.i2$1bv32$1);
    $$rgba.i2$1bv32$2 := (if p0$2 then v78$2 else $$rgba.i2$1bv32$2);
    $$rgba.i2$2bv32$1 := (if p0$1 then v79$1 else $$rgba.i2$2bv32$1);
    $$rgba.i2$2bv32$2 := (if p0$2 then v79$2 else $$rgba.i2$2bv32$2);
    $$rgba.i2$3bv32$1 := (if p0$1 then v80$1 else $$rgba.i2$3bv32$1);
    $$rgba.i2$3bv32$2 := (if p0$2 then v80$2 else $$rgba.i2$3bv32$2);
    v81$1 := (if p0$1 then $$rgba.i2$0bv32$1 else v81$1);
    v81$2 := (if p0$2 then $$rgba.i2$0bv32$2 else v81$2);
    call {:sourceloc_num 154} v82$1, v82$2 := $__saturatef(p0$1, v81$1, p0$2, v81$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i2$0bv32$1 := (if p0$1 then v82$1 else $$rgba.i2$0bv32$1);
    $$rgba.i2$0bv32$2 := (if p0$2 then v82$2 else $$rgba.i2$0bv32$2);
    v83$1 := (if p0$1 then $$rgba.i2$1bv32$1 else v83$1);
    v83$2 := (if p0$2 then $$rgba.i2$1bv32$2 else v83$2);
    call {:sourceloc_num 157} v84$1, v84$2 := $__saturatef(p0$1, v83$1, p0$2, v83$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i2$1bv32$1 := (if p0$1 then v84$1 else $$rgba.i2$1bv32$1);
    $$rgba.i2$1bv32$2 := (if p0$2 then v84$2 else $$rgba.i2$1bv32$2);
    v85$1 := (if p0$1 then $$rgba.i2$2bv32$1 else v85$1);
    v85$2 := (if p0$2 then $$rgba.i2$2bv32$2 else v85$2);
    call {:sourceloc_num 160} v86$1, v86$2 := $__saturatef(p0$1, v85$1, p0$2, v85$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i2$2bv32$1 := (if p0$1 then v86$1 else $$rgba.i2$2bv32$1);
    $$rgba.i2$2bv32$2 := (if p0$2 then v86$2 else $$rgba.i2$2bv32$2);
    v87$1 := (if p0$1 then $$rgba.i2$3bv32$1 else v87$1);
    v87$2 := (if p0$2 then $$rgba.i2$3bv32$2 else v87$2);
    call {:sourceloc_num 163} v88$1, v88$2 := $__saturatef(p0$1, v87$1, p0$2, v87$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i2$3bv32$1 := (if p0$1 then v88$1 else $$rgba.i2$3bv32$1);
    $$rgba.i2$3bv32$2 := (if p0$2 then v88$2 else $$rgba.i2$3bv32$2);
    v89$1 := (if p0$1 then $$rgba.i2$3bv32$1 else v89$1);
    v89$2 := (if p0$2 then $$rgba.i2$3bv32$2 else v89$2);
    v90$1 := (if p0$1 then $$rgba.i2$2bv32$1 else v90$1);
    v90$2 := (if p0$2 then $$rgba.i2$2bv32$2 else v90$2);
    v91$1 := (if p0$1 then $$rgba.i2$1bv32$1 else v91$1);
    v91$2 := (if p0$2 then $$rgba.i2$1bv32$2 else v91$2);
    v92$1 := (if p0$1 then $$rgba.i2$0bv32$1 else v92$1);
    v92$2 := (if p0$2 then $$rgba.i2$0bv32$2 else v92$2);
    call {:sourceloc} {:sourceloc_num 169} _LOG_WRITE_$$od(p0$1, BV32_MUL(v1$1, $w), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v89$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v90$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v91$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v92$1, 1132396544bv32))), $$od[BV32_MUL(v1$1, $w)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$od(p0$2, BV32_MUL(v1$2, $w));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 169} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 169} _CHECK_WRITE_$$od(p0$2, BV32_MUL(v1$2, $w), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v89$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v90$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v91$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v92$2, 1132396544bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$od"} true;
    $$od[BV32_MUL(v1$1, $w)] := (if p0$1 then BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v89$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v90$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v91$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v92$1, 1132396544bv32))) else $$od[BV32_MUL(v1$1, $w)]);
    $$od[BV32_MUL(v1$2, $w)] := (if p0$2 then BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v89$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v90$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v91$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v92$2, 1132396544bv32))) else $$od[BV32_MUL(v1$2, $w)]);
    $x1.0$1 := (if p0$1 then 1bv32 else $x1.0$1);
    $x1.0$2 := (if p0$2 then 1bv32 else $x1.0$2);
    p3$1 := (if p0$1 then true else p3$1);
    p3$2 := (if p0$2 then true else p3$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $6;

  $6:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b13 ==> _WRITE_HAS_OCCURRED_$$od ==> local_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, $w), BV32_MUL(group_id_x$1, group_size_x));
    assert {:tag "accessBreak"} _b12 ==> _WRITE_HAS_OCCURRED_$$od ==> group_id_x$1 == BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, $w), group_size_x), BV32_DIV(local_id_x$1, group_size_x));
    assert {:tag "accessUpperBoundBlock"} _b11 ==> _WRITE_HAS_OCCURRED_$$od ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), group_size_x), local_id_x$1), $w));
    assert {:tag "accessLowerBoundBlock"} _b10 ==> _WRITE_HAS_OCCURRED_$$od ==> BV32_SLE(BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), $w), _WATCHED_OFFSET);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p3$1 ==> _b9 ==> p3$1 ==> BV32_ULT(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), $h);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p3$2 ==> _b9 ==> p3$2 ==> BV32_ULT(BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2), $h);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b8 ==> BV32_ULT(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), $h) && BV32_SLT($x1.0$1, $w) ==> p3$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b8 ==> BV32_ULT(BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2), $h) && BV32_SLT($x1.0$2, $w) ==> p3$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b7 ==> !BV32_ULT(v1$1, $h) ==> !_READ_HAS_OCCURRED_$$rgbaTex;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b6 ==> !BV32_ULT(v1$1, $h) ==> !_WRITE_HAS_OCCURRED_$$od;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b5 ==> !BV32_ULT(v1$1, $h) ==> !p3$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b5 ==> !BV32_ULT(v1$2, $h) ==> !p3$2;
    assert {:tag "loopBound"} {:thread 1} p3$1 ==> _b4 ==> BV32_UGE($x1.0$1, 1bv32);
    assert {:tag "loopBound"} {:thread 2} p3$2 ==> _b4 ==> BV32_UGE($x1.0$2, 1bv32);
    assert {:tag "loopBound"} {:thread 1} p3$1 ==> _b3 ==> BV32_ULE($x1.0$1, 1bv32);
    assert {:tag "loopBound"} {:thread 2} p3$2 ==> _b3 ==> BV32_ULE($x1.0$2, 1bv32);
    assert {:tag "loopBound"} {:thread 1} p3$1 ==> _b2 ==> BV32_SGE($x1.0$1, 1bv32);
    assert {:tag "loopBound"} {:thread 2} p3$2 ==> _b2 ==> BV32_SGE($x1.0$2, 1bv32);
    assert {:tag "loopBound"} {:thread 1} p3$1 ==> _b1 ==> BV32_SLE($x1.0$1, 1bv32);
    assert {:tag "loopBound"} {:thread 2} p3$2 ==> _b1 ==> BV32_SLE($x1.0$2, 1bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p3$1 ==> _b0 ==> BV32_SLE(0bv32, $x1.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p3$2 ==> _b0 ==> BV32_SLE(0bv32, $x1.0$2);
    assert {:block_sourceloc} {:sourceloc_num 170} p3$1 ==> true;
    v93$1 := (if p3$1 then BV32_SLT($x1.0$1, $w) else v93$1);
    v93$2 := (if p3$2 then BV32_SLT($x1.0$2, $w) else v93$2);
    p4$1 := false;
    p4$2 := false;
    p4$1 := (if p3$1 && v93$1 then v93$1 else p4$1);
    p4$2 := (if p3$2 && v93$2 then v93$2 else p4$2);
    p3$1 := (if p3$1 && !v93$1 then v93$1 else p3$1);
    p3$2 := (if p3$2 && !v93$2 then v93$2 else p3$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v94$1 := (if p4$1 then _HAVOC_bv8$1 else v94$1);
    v94$2 := (if p4$2 then _HAVOC_bv8$2 else v94$2);
    $$17$0bv32$1 := (if p4$1 then v94$1 else $$17$0bv32$1);
    $$17$0bv32$2 := (if p4$2 then v94$2 else $$17$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v95$1 := (if p4$1 then _HAVOC_bv8$1 else v95$1);
    v95$2 := (if p4$2 then _HAVOC_bv8$2 else v95$2);
    $$17$1bv32$1 := (if p4$1 then v95$1 else $$17$1bv32$1);
    $$17$1bv32$2 := (if p4$2 then v95$2 else $$17$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v96$1 := (if p4$1 then _HAVOC_bv8$1 else v96$1);
    v96$2 := (if p4$2 then _HAVOC_bv8$2 else v96$2);
    $$17$2bv32$1 := (if p4$1 then v96$1 else $$17$2bv32$1);
    $$17$2bv32$2 := (if p4$2 then v96$2 else $$17$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v97$1 := (if p4$1 then _HAVOC_bv8$1 else v97$1);
    v97$2 := (if p4$2 then _HAVOC_bv8$2 else v97$2);
    $$17$3bv32$1 := (if p4$1 then v97$1 else $$17$3bv32$1);
    $$17$3bv32$2 := (if p4$2 then v97$2 else $$17$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v98$1 := (if p4$1 then _HAVOC_bv8$1 else v98$1);
    v98$2 := (if p4$2 then _HAVOC_bv8$2 else v98$2);
    $$17$4bv32$1 := (if p4$1 then v98$1 else $$17$4bv32$1);
    $$17$4bv32$2 := (if p4$2 then v98$2 else $$17$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v99$1 := (if p4$1 then _HAVOC_bv8$1 else v99$1);
    v99$2 := (if p4$2 then _HAVOC_bv8$2 else v99$2);
    $$17$5bv32$1 := (if p4$1 then v99$1 else $$17$5bv32$1);
    $$17$5bv32$2 := (if p4$2 then v99$2 else $$17$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v100$1 := (if p4$1 then _HAVOC_bv8$1 else v100$1);
    v100$2 := (if p4$2 then _HAVOC_bv8$2 else v100$2);
    $$17$6bv32$1 := (if p4$1 then v100$1 else $$17$6bv32$1);
    $$17$6bv32$2 := (if p4$2 then v100$2 else $$17$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v101$1 := (if p4$1 then _HAVOC_bv8$1 else v101$1);
    v101$2 := (if p4$2 then _HAVOC_bv8$2 else v101$2);
    $$17$7bv32$1 := (if p4$1 then v101$1 else $$17$7bv32$1);
    $$17$7bv32$2 := (if p4$2 then v101$2 else $$17$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v102$1 := (if p4$1 then _HAVOC_bv8$1 else v102$1);
    v102$2 := (if p4$2 then _HAVOC_bv8$2 else v102$2);
    $$17$8bv32$1 := (if p4$1 then v102$1 else $$17$8bv32$1);
    $$17$8bv32$2 := (if p4$2 then v102$2 else $$17$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v103$1 := (if p4$1 then _HAVOC_bv8$1 else v103$1);
    v103$2 := (if p4$2 then _HAVOC_bv8$2 else v103$2);
    $$17$9bv32$1 := (if p4$1 then v103$1 else $$17$9bv32$1);
    $$17$9bv32$2 := (if p4$2 then v103$2 else $$17$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v104$1 := (if p4$1 then _HAVOC_bv8$1 else v104$1);
    v104$2 := (if p4$2 then _HAVOC_bv8$2 else v104$2);
    $$17$10bv32$1 := (if p4$1 then v104$1 else $$17$10bv32$1);
    $$17$10bv32$2 := (if p4$2 then v104$2 else $$17$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v105$1 := (if p4$1 then _HAVOC_bv8$1 else v105$1);
    v105$2 := (if p4$2 then _HAVOC_bv8$2 else v105$2);
    $$17$11bv32$1 := (if p4$1 then v105$1 else $$17$11bv32$1);
    $$17$11bv32$2 := (if p4$2 then v105$2 else $$17$11bv32$2);
    v106$1 := (if p4$1 then $$17$0bv32$1 else v106$1);
    v106$2 := (if p4$2 then $$17$0bv32$2 else v106$2);
    v107$1 := (if p4$1 then $$17$1bv32$1 else v107$1);
    v107$2 := (if p4$2 then $$17$1bv32$2 else v107$2);
    v108$1 := (if p4$1 then $$17$2bv32$1 else v108$1);
    v108$2 := (if p4$2 then $$17$2bv32$2 else v108$2);
    v109$1 := (if p4$1 then $$17$3bv32$1 else v109$1);
    v109$2 := (if p4$2 then $$17$3bv32$2 else v109$2);
    v110$1 := (if p4$1 then $$17$4bv32$1 else v110$1);
    v110$2 := (if p4$2 then $$17$4bv32$2 else v110$2);
    v111$1 := (if p4$1 then $$17$5bv32$1 else v111$1);
    v111$2 := (if p4$2 then $$17$5bv32$2 else v111$2);
    v112$1 := (if p4$1 then $$17$6bv32$1 else v112$1);
    v112$2 := (if p4$2 then $$17$6bv32$2 else v112$2);
    v113$1 := (if p4$1 then $$17$7bv32$1 else v113$1);
    v113$2 := (if p4$2 then $$17$7bv32$2 else v113$2);
    v114$1 := (if p4$1 then $$17$8bv32$1 else v114$1);
    v114$2 := (if p4$2 then $$17$8bv32$2 else v114$2);
    v115$1 := (if p4$1 then $$17$9bv32$1 else v115$1);
    v115$2 := (if p4$2 then $$17$9bv32$2 else v115$2);
    v116$1 := (if p4$1 then $$17$10bv32$1 else v116$1);
    v116$2 := (if p4$2 then $$17$10bv32$2 else v116$2);
    v117$1 := (if p4$1 then $$17$11bv32$1 else v117$1);
    v117$2 := (if p4$2 then $$17$11bv32$2 else v117$2);
    call {:sourceloc_num 208} v118$1, v118$2 := $_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff(p4$1, v109$1 ++ v108$1 ++ v107$1 ++ v106$1, v113$1 ++ v112$1 ++ v111$1 ++ v110$1, v117$1 ++ v116$1 ++ v115$1 ++ v114$1, SI32_TO_FP32(BV32_ADD($x1.0$1, $r)), UI32_TO_FP32(v1$1), p4$2, v109$2 ++ v108$2 ++ v107$2 ++ v106$2, v113$2 ++ v112$2 ++ v111$2 ++ v110$2, v117$2 ++ v116$2 ++ v115$2 ++ v114$2, SI32_TO_FP32(BV32_ADD($x1.0$2, $r)), UI32_TO_FP32(v1$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff"} true;
    $$16$0bv32$1 := (if p4$1 then v118$1[32:0] else $$16$0bv32$1);
    $$16$0bv32$2 := (if p4$2 then v118$2[32:0] else $$16$0bv32$2);
    $$16$1bv32$1 := (if p4$1 then v118$1[64:32] else $$16$1bv32$1);
    $$16$1bv32$2 := (if p4$2 then v118$2[64:32] else $$16$1bv32$2);
    $$16$2bv32$1 := (if p4$1 then v118$1[96:64] else $$16$2bv32$1);
    $$16$2bv32$2 := (if p4$2 then v118$2[96:64] else $$16$2bv32$2);
    $$16$3bv32$1 := (if p4$1 then v118$1[128:96] else $$16$3bv32$1);
    $$16$3bv32$2 := (if p4$2 then v118$2[128:96] else $$16$3bv32$2);
    v119$1 := (if p4$1 then $$16$0bv32$1 else v119$1);
    v119$2 := (if p4$2 then $$16$0bv32$2 else v119$2);
    v120$1 := (if p4$1 then $$16$1bv32$1 else v120$1);
    v120$2 := (if p4$2 then $$16$1bv32$2 else v120$2);
    v121$1 := (if p4$1 then $$16$2bv32$1 else v121$1);
    v121$2 := (if p4$2 then $$16$2bv32$2 else v121$2);
    v122$1 := (if p4$1 then $$16$3bv32$1 else v122$1);
    v122$2 := (if p4$2 then $$16$3bv32$2 else v122$2);
    $$b.i3$0bv32$1 := (if p4$1 then v119$1 else $$b.i3$0bv32$1);
    $$b.i3$0bv32$2 := (if p4$2 then v119$2 else $$b.i3$0bv32$2);
    $$b.i3$1bv32$1 := (if p4$1 then v120$1 else $$b.i3$1bv32$1);
    $$b.i3$1bv32$2 := (if p4$2 then v120$2 else $$b.i3$1bv32$2);
    $$b.i3$2bv32$1 := (if p4$1 then v121$1 else $$b.i3$2bv32$1);
    $$b.i3$2bv32$2 := (if p4$2 then v121$2 else $$b.i3$2bv32$2);
    $$b.i3$3bv32$1 := (if p4$1 then v122$1 else $$b.i3$3bv32$1);
    $$b.i3$3bv32$2 := (if p4$2 then v122$2 else $$b.i3$3bv32$2);
    v123$1 := (if p4$1 then $$t$0bv32$1 else v123$1);
    v123$2 := (if p4$2 then $$t$0bv32$2 else v123$2);
    v124$1 := (if p4$1 then $$b.i3$0bv32$1 else v124$1);
    v124$2 := (if p4$2 then $$b.i3$0bv32$2 else v124$2);
    v125$1 := (if p4$1 then $$t$1bv32$1 else v125$1);
    v125$2 := (if p4$2 then $$t$1bv32$2 else v125$2);
    v126$1 := (if p4$1 then $$b.i3$1bv32$1 else v126$1);
    v126$2 := (if p4$2 then $$b.i3$1bv32$2 else v126$2);
    v127$1 := (if p4$1 then $$t$2bv32$1 else v127$1);
    v127$2 := (if p4$2 then $$t$2bv32$2 else v127$2);
    v128$1 := (if p4$1 then $$b.i3$2bv32$1 else v128$1);
    v128$2 := (if p4$2 then $$b.i3$2bv32$2 else v128$2);
    v129$1 := (if p4$1 then $$t$3bv32$1 else v129$1);
    v129$2 := (if p4$2 then $$t$3bv32$2 else v129$2);
    v130$1 := (if p4$1 then $$b.i3$3bv32$1 else v130$1);
    v130$2 := (if p4$2 then $$b.i3$3bv32$2 else v130$2);
    $$4$0bv32$1 := (if p4$1 then FADD32(v123$1, v124$1) else $$4$0bv32$1);
    $$4$0bv32$2 := (if p4$2 then FADD32(v123$2, v124$2) else $$4$0bv32$2);
    $$4$1bv32$1 := (if p4$1 then FADD32(v125$1, v126$1) else $$4$1bv32$1);
    $$4$1bv32$2 := (if p4$2 then FADD32(v125$2, v126$2) else $$4$1bv32$2);
    $$4$2bv32$1 := (if p4$1 then FADD32(v127$1, v128$1) else $$4$2bv32$1);
    $$4$2bv32$2 := (if p4$2 then FADD32(v127$2, v128$2) else $$4$2bv32$2);
    $$4$3bv32$1 := (if p4$1 then FADD32(v129$1, v130$1) else $$4$3bv32$1);
    $$4$3bv32$2 := (if p4$2 then FADD32(v129$2, v130$2) else $$4$3bv32$2);
    v131$1 := (if p4$1 then $$4$0bv32$1 else v131$1);
    v131$2 := (if p4$2 then $$4$0bv32$2 else v131$2);
    v132$1 := (if p4$1 then $$4$1bv32$1 else v132$1);
    v132$2 := (if p4$2 then $$4$1bv32$2 else v132$2);
    v133$1 := (if p4$1 then $$4$2bv32$1 else v133$1);
    v133$2 := (if p4$2 then $$4$2bv32$2 else v133$2);
    v134$1 := (if p4$1 then $$4$3bv32$1 else v134$1);
    v134$2 := (if p4$2 then $$4$3bv32$2 else v134$2);
    $$5$0bv32$1 := (if p4$1 then v131$1 else $$5$0bv32$1);
    $$5$0bv32$2 := (if p4$2 then v131$2 else $$5$0bv32$2);
    $$5$1bv32$1 := (if p4$1 then v132$1 else $$5$1bv32$1);
    $$5$1bv32$2 := (if p4$2 then v132$2 else $$5$1bv32$2);
    $$5$2bv32$1 := (if p4$1 then v133$1 else $$5$2bv32$1);
    $$5$2bv32$2 := (if p4$2 then v133$2 else $$5$2bv32$2);
    $$5$3bv32$1 := (if p4$1 then v134$1 else $$5$3bv32$1);
    $$5$3bv32$2 := (if p4$2 then v134$2 else $$5$3bv32$2);
    v135$1 := (if p4$1 then $$5$0bv32$1 else v135$1);
    v135$2 := (if p4$2 then $$5$0bv32$2 else v135$2);
    $$t$0bv32$1 := (if p4$1 then v135$1 else $$t$0bv32$1);
    $$t$0bv32$2 := (if p4$2 then v135$2 else $$t$0bv32$2);
    v136$1 := (if p4$1 then $$5$1bv32$1 else v136$1);
    v136$2 := (if p4$2 then $$5$1bv32$2 else v136$2);
    $$t$1bv32$1 := (if p4$1 then v136$1 else $$t$1bv32$1);
    $$t$1bv32$2 := (if p4$2 then v136$2 else $$t$1bv32$2);
    v137$1 := (if p4$1 then $$5$2bv32$1 else v137$1);
    v137$2 := (if p4$2 then $$5$2bv32$2 else v137$2);
    $$t$2bv32$1 := (if p4$1 then v137$1 else $$t$2bv32$1);
    $$t$2bv32$2 := (if p4$2 then v137$2 else $$t$2bv32$2);
    v138$1 := (if p4$1 then $$5$3bv32$1 else v138$1);
    v138$2 := (if p4$2 then $$5$3bv32$2 else v138$2);
    $$t$3bv32$1 := (if p4$1 then v138$1 else $$t$3bv32$1);
    $$t$3bv32$2 := (if p4$2 then v138$2 else $$t$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v139$1 := (if p4$1 then _HAVOC_bv8$1 else v139$1);
    v139$2 := (if p4$2 then _HAVOC_bv8$2 else v139$2);
    $$19$0bv32$1 := (if p4$1 then v139$1 else $$19$0bv32$1);
    $$19$0bv32$2 := (if p4$2 then v139$2 else $$19$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v140$1 := (if p4$1 then _HAVOC_bv8$1 else v140$1);
    v140$2 := (if p4$2 then _HAVOC_bv8$2 else v140$2);
    $$19$1bv32$1 := (if p4$1 then v140$1 else $$19$1bv32$1);
    $$19$1bv32$2 := (if p4$2 then v140$2 else $$19$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v141$1 := (if p4$1 then _HAVOC_bv8$1 else v141$1);
    v141$2 := (if p4$2 then _HAVOC_bv8$2 else v141$2);
    $$19$2bv32$1 := (if p4$1 then v141$1 else $$19$2bv32$1);
    $$19$2bv32$2 := (if p4$2 then v141$2 else $$19$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v142$1 := (if p4$1 then _HAVOC_bv8$1 else v142$1);
    v142$2 := (if p4$2 then _HAVOC_bv8$2 else v142$2);
    $$19$3bv32$1 := (if p4$1 then v142$1 else $$19$3bv32$1);
    $$19$3bv32$2 := (if p4$2 then v142$2 else $$19$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v143$1 := (if p4$1 then _HAVOC_bv8$1 else v143$1);
    v143$2 := (if p4$2 then _HAVOC_bv8$2 else v143$2);
    $$19$4bv32$1 := (if p4$1 then v143$1 else $$19$4bv32$1);
    $$19$4bv32$2 := (if p4$2 then v143$2 else $$19$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v144$1 := (if p4$1 then _HAVOC_bv8$1 else v144$1);
    v144$2 := (if p4$2 then _HAVOC_bv8$2 else v144$2);
    $$19$5bv32$1 := (if p4$1 then v144$1 else $$19$5bv32$1);
    $$19$5bv32$2 := (if p4$2 then v144$2 else $$19$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v145$1 := (if p4$1 then _HAVOC_bv8$1 else v145$1);
    v145$2 := (if p4$2 then _HAVOC_bv8$2 else v145$2);
    $$19$6bv32$1 := (if p4$1 then v145$1 else $$19$6bv32$1);
    $$19$6bv32$2 := (if p4$2 then v145$2 else $$19$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v146$1 := (if p4$1 then _HAVOC_bv8$1 else v146$1);
    v146$2 := (if p4$2 then _HAVOC_bv8$2 else v146$2);
    $$19$7bv32$1 := (if p4$1 then v146$1 else $$19$7bv32$1);
    $$19$7bv32$2 := (if p4$2 then v146$2 else $$19$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v147$1 := (if p4$1 then _HAVOC_bv8$1 else v147$1);
    v147$2 := (if p4$2 then _HAVOC_bv8$2 else v147$2);
    $$19$8bv32$1 := (if p4$1 then v147$1 else $$19$8bv32$1);
    $$19$8bv32$2 := (if p4$2 then v147$2 else $$19$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v148$1 := (if p4$1 then _HAVOC_bv8$1 else v148$1);
    v148$2 := (if p4$2 then _HAVOC_bv8$2 else v148$2);
    $$19$9bv32$1 := (if p4$1 then v148$1 else $$19$9bv32$1);
    $$19$9bv32$2 := (if p4$2 then v148$2 else $$19$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v149$1 := (if p4$1 then _HAVOC_bv8$1 else v149$1);
    v149$2 := (if p4$2 then _HAVOC_bv8$2 else v149$2);
    $$19$10bv32$1 := (if p4$1 then v149$1 else $$19$10bv32$1);
    $$19$10bv32$2 := (if p4$2 then v149$2 else $$19$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v150$1 := (if p4$1 then _HAVOC_bv8$1 else v150$1);
    v150$2 := (if p4$2 then _HAVOC_bv8$2 else v150$2);
    $$19$11bv32$1 := (if p4$1 then v150$1 else $$19$11bv32$1);
    $$19$11bv32$2 := (if p4$2 then v150$2 else $$19$11bv32$2);
    v151$1 := (if p4$1 then $$19$0bv32$1 else v151$1);
    v151$2 := (if p4$2 then $$19$0bv32$2 else v151$2);
    v152$1 := (if p4$1 then $$19$1bv32$1 else v152$1);
    v152$2 := (if p4$2 then $$19$1bv32$2 else v152$2);
    v153$1 := (if p4$1 then $$19$2bv32$1 else v153$1);
    v153$2 := (if p4$2 then $$19$2bv32$2 else v153$2);
    v154$1 := (if p4$1 then $$19$3bv32$1 else v154$1);
    v154$2 := (if p4$2 then $$19$3bv32$2 else v154$2);
    v155$1 := (if p4$1 then $$19$4bv32$1 else v155$1);
    v155$2 := (if p4$2 then $$19$4bv32$2 else v155$2);
    v156$1 := (if p4$1 then $$19$5bv32$1 else v156$1);
    v156$2 := (if p4$2 then $$19$5bv32$2 else v156$2);
    v157$1 := (if p4$1 then $$19$6bv32$1 else v157$1);
    v157$2 := (if p4$2 then $$19$6bv32$2 else v157$2);
    v158$1 := (if p4$1 then $$19$7bv32$1 else v158$1);
    v158$2 := (if p4$2 then $$19$7bv32$2 else v158$2);
    v159$1 := (if p4$1 then $$19$8bv32$1 else v159$1);
    v159$2 := (if p4$2 then $$19$8bv32$2 else v159$2);
    v160$1 := (if p4$1 then $$19$9bv32$1 else v160$1);
    v160$2 := (if p4$2 then $$19$9bv32$2 else v160$2);
    v161$1 := (if p4$1 then $$19$10bv32$1 else v161$1);
    v161$2 := (if p4$2 then $$19$10bv32$2 else v161$2);
    v162$1 := (if p4$1 then $$19$11bv32$1 else v162$1);
    v162$2 := (if p4$2 then $$19$11bv32$2 else v162$2);
    call {:sourceloc_num 285} v163$1, v163$2 := $_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff(p4$1, v154$1 ++ v153$1 ++ v152$1 ++ v151$1, v158$1 ++ v157$1 ++ v156$1 ++ v155$1, v162$1 ++ v161$1 ++ v160$1 ++ v159$1, SI32_TO_FP32(BV32_SUB(BV32_SUB($x1.0$1, $r), 1bv32)), UI32_TO_FP32(v1$1), p4$2, v154$2 ++ v153$2 ++ v152$2 ++ v151$2, v158$2 ++ v157$2 ++ v156$2 ++ v155$2, v162$2 ++ v161$2 ++ v160$2 ++ v159$2, SI32_TO_FP32(BV32_SUB(BV32_SUB($x1.0$2, $r), 1bv32)), UI32_TO_FP32(v1$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff"} true;
    $$18$0bv32$1 := (if p4$1 then v163$1[32:0] else $$18$0bv32$1);
    $$18$0bv32$2 := (if p4$2 then v163$2[32:0] else $$18$0bv32$2);
    $$18$1bv32$1 := (if p4$1 then v163$1[64:32] else $$18$1bv32$1);
    $$18$1bv32$2 := (if p4$2 then v163$2[64:32] else $$18$1bv32$2);
    $$18$2bv32$1 := (if p4$1 then v163$1[96:64] else $$18$2bv32$1);
    $$18$2bv32$2 := (if p4$2 then v163$2[96:64] else $$18$2bv32$2);
    $$18$3bv32$1 := (if p4$1 then v163$1[128:96] else $$18$3bv32$1);
    $$18$3bv32$2 := (if p4$2 then v163$2[128:96] else $$18$3bv32$2);
    v164$1 := (if p4$1 then $$18$0bv32$1 else v164$1);
    v164$2 := (if p4$2 then $$18$0bv32$2 else v164$2);
    v165$1 := (if p4$1 then $$18$1bv32$1 else v165$1);
    v165$2 := (if p4$2 then $$18$1bv32$2 else v165$2);
    v166$1 := (if p4$1 then $$18$2bv32$1 else v166$1);
    v166$2 := (if p4$2 then $$18$2bv32$2 else v166$2);
    v167$1 := (if p4$1 then $$18$3bv32$1 else v167$1);
    v167$2 := (if p4$2 then $$18$3bv32$2 else v167$2);
    $$b.i4$0bv32$1 := (if p4$1 then v164$1 else $$b.i4$0bv32$1);
    $$b.i4$0bv32$2 := (if p4$2 then v164$2 else $$b.i4$0bv32$2);
    $$b.i4$1bv32$1 := (if p4$1 then v165$1 else $$b.i4$1bv32$1);
    $$b.i4$1bv32$2 := (if p4$2 then v165$2 else $$b.i4$1bv32$2);
    $$b.i4$2bv32$1 := (if p4$1 then v166$1 else $$b.i4$2bv32$1);
    $$b.i4$2bv32$2 := (if p4$2 then v166$2 else $$b.i4$2bv32$2);
    $$b.i4$3bv32$1 := (if p4$1 then v167$1 else $$b.i4$3bv32$1);
    $$b.i4$3bv32$2 := (if p4$2 then v167$2 else $$b.i4$3bv32$2);
    v168$1 := (if p4$1 then $$t$0bv32$1 else v168$1);
    v168$2 := (if p4$2 then $$t$0bv32$2 else v168$2);
    v169$1 := (if p4$1 then $$b.i4$0bv32$1 else v169$1);
    v169$2 := (if p4$2 then $$b.i4$0bv32$2 else v169$2);
    v170$1 := (if p4$1 then $$t$1bv32$1 else v170$1);
    v170$2 := (if p4$2 then $$t$1bv32$2 else v170$2);
    v171$1 := (if p4$1 then $$b.i4$1bv32$1 else v171$1);
    v171$2 := (if p4$2 then $$b.i4$1bv32$2 else v171$2);
    v172$1 := (if p4$1 then $$t$2bv32$1 else v172$1);
    v172$2 := (if p4$2 then $$t$2bv32$2 else v172$2);
    v173$1 := (if p4$1 then $$b.i4$2bv32$1 else v173$1);
    v173$2 := (if p4$2 then $$b.i4$2bv32$2 else v173$2);
    v174$1 := (if p4$1 then $$t$3bv32$1 else v174$1);
    v174$2 := (if p4$2 then $$t$3bv32$2 else v174$2);
    v175$1 := (if p4$1 then $$b.i4$3bv32$1 else v175$1);
    v175$2 := (if p4$2 then $$b.i4$3bv32$2 else v175$2);
    $$2$0bv32$1 := (if p4$1 then FSUB32(v168$1, v169$1) else $$2$0bv32$1);
    $$2$0bv32$2 := (if p4$2 then FSUB32(v168$2, v169$2) else $$2$0bv32$2);
    $$2$1bv32$1 := (if p4$1 then FSUB32(v170$1, v171$1) else $$2$1bv32$1);
    $$2$1bv32$2 := (if p4$2 then FSUB32(v170$2, v171$2) else $$2$1bv32$2);
    $$2$2bv32$1 := (if p4$1 then FSUB32(v172$1, v173$1) else $$2$2bv32$1);
    $$2$2bv32$2 := (if p4$2 then FSUB32(v172$2, v173$2) else $$2$2bv32$2);
    $$2$3bv32$1 := (if p4$1 then FSUB32(v174$1, v175$1) else $$2$3bv32$1);
    $$2$3bv32$2 := (if p4$2 then FSUB32(v174$2, v175$2) else $$2$3bv32$2);
    v176$1 := (if p4$1 then $$2$0bv32$1 else v176$1);
    v176$2 := (if p4$2 then $$2$0bv32$2 else v176$2);
    v177$1 := (if p4$1 then $$2$1bv32$1 else v177$1);
    v177$2 := (if p4$2 then $$2$1bv32$2 else v177$2);
    v178$1 := (if p4$1 then $$2$2bv32$1 else v178$1);
    v178$2 := (if p4$2 then $$2$2bv32$2 else v178$2);
    v179$1 := (if p4$1 then $$2$3bv32$1 else v179$1);
    v179$2 := (if p4$2 then $$2$3bv32$2 else v179$2);
    $$3$0bv32$1 := (if p4$1 then v176$1 else $$3$0bv32$1);
    $$3$0bv32$2 := (if p4$2 then v176$2 else $$3$0bv32$2);
    $$3$1bv32$1 := (if p4$1 then v177$1 else $$3$1bv32$1);
    $$3$1bv32$2 := (if p4$2 then v177$2 else $$3$1bv32$2);
    $$3$2bv32$1 := (if p4$1 then v178$1 else $$3$2bv32$1);
    $$3$2bv32$2 := (if p4$2 then v178$2 else $$3$2bv32$2);
    $$3$3bv32$1 := (if p4$1 then v179$1 else $$3$3bv32$1);
    $$3$3bv32$2 := (if p4$2 then v179$2 else $$3$3bv32$2);
    v180$1 := (if p4$1 then $$3$0bv32$1 else v180$1);
    v180$2 := (if p4$2 then $$3$0bv32$2 else v180$2);
    $$t$0bv32$1 := (if p4$1 then v180$1 else $$t$0bv32$1);
    $$t$0bv32$2 := (if p4$2 then v180$2 else $$t$0bv32$2);
    v181$1 := (if p4$1 then $$3$1bv32$1 else v181$1);
    v181$2 := (if p4$2 then $$3$1bv32$2 else v181$2);
    $$t$1bv32$1 := (if p4$1 then v181$1 else $$t$1bv32$1);
    $$t$1bv32$2 := (if p4$2 then v181$2 else $$t$1bv32$2);
    v182$1 := (if p4$1 then $$3$2bv32$1 else v182$1);
    v182$2 := (if p4$2 then $$3$2bv32$2 else v182$2);
    $$t$2bv32$1 := (if p4$1 then v182$1 else $$t$2bv32$1);
    $$t$2bv32$2 := (if p4$2 then v182$2 else $$t$2bv32$2);
    v183$1 := (if p4$1 then $$3$3bv32$1 else v183$1);
    v183$2 := (if p4$2 then $$3$3bv32$2 else v183$2);
    $$t$3bv32$1 := (if p4$1 then v183$1 else $$t$3bv32$1);
    $$t$3bv32$2 := (if p4$2 then v183$2 else $$t$3bv32$2);
    v184$1 := (if p4$1 then $$t$0bv32$1 else v184$1);
    v184$2 := (if p4$2 then $$t$0bv32$2 else v184$2);
    $$21$0bv32$1 := (if p4$1 then v184$1 else $$21$0bv32$1);
    $$21$0bv32$2 := (if p4$2 then v184$2 else $$21$0bv32$2);
    v185$1 := (if p4$1 then $$t$1bv32$1 else v185$1);
    v185$2 := (if p4$2 then $$t$1bv32$2 else v185$2);
    $$21$1bv32$1 := (if p4$1 then v185$1 else $$21$1bv32$1);
    $$21$1bv32$2 := (if p4$2 then v185$2 else $$21$1bv32$2);
    v186$1 := (if p4$1 then $$t$2bv32$1 else v186$1);
    v186$2 := (if p4$2 then $$t$2bv32$2 else v186$2);
    $$21$2bv32$1 := (if p4$1 then v186$1 else $$21$2bv32$1);
    $$21$2bv32$2 := (if p4$2 then v186$2 else $$21$2bv32$2);
    v187$1 := (if p4$1 then $$t$3bv32$1 else v187$1);
    v187$2 := (if p4$2 then $$t$3bv32$2 else v187$2);
    $$21$3bv32$1 := (if p4$1 then v187$1 else $$21$3bv32$1);
    $$21$3bv32$2 := (if p4$2 then v187$2 else $$21$3bv32$2);
    v188$1 := (if p4$1 then $$21$0bv32$1 else v188$1);
    v188$2 := (if p4$2 then $$21$0bv32$2 else v188$2);
    v189$1 := (if p4$1 then $$21$1bv32$1 else v189$1);
    v189$2 := (if p4$2 then $$21$1bv32$2 else v189$2);
    v190$1 := (if p4$1 then $$21$2bv32$1 else v190$1);
    v190$2 := (if p4$2 then $$21$2bv32$2 else v190$2);
    v191$1 := (if p4$1 then $$21$3bv32$1 else v191$1);
    v191$2 := (if p4$2 then $$21$3bv32$2 else v191$2);
    $$a.i5$0bv32$1 := (if p4$1 then v188$1 else $$a.i5$0bv32$1);
    $$a.i5$0bv32$2 := (if p4$2 then v188$2 else $$a.i5$0bv32$2);
    $$a.i5$1bv32$1 := (if p4$1 then v189$1 else $$a.i5$1bv32$1);
    $$a.i5$1bv32$2 := (if p4$2 then v189$2 else $$a.i5$1bv32$2);
    $$a.i5$2bv32$1 := (if p4$1 then v190$1 else $$a.i5$2bv32$1);
    $$a.i5$2bv32$2 := (if p4$2 then v190$2 else $$a.i5$2bv32$2);
    $$a.i5$3bv32$1 := (if p4$1 then v191$1 else $$a.i5$3bv32$1);
    $$a.i5$3bv32$2 := (if p4$2 then v191$2 else $$a.i5$3bv32$2);
    v192$1 := (if p4$1 then $$a.i5$0bv32$1 else v192$1);
    v192$2 := (if p4$2 then $$a.i5$0bv32$2 else v192$2);
    v193$1 := (if p4$1 then $$a.i5$1bv32$1 else v193$1);
    v193$2 := (if p4$2 then $$a.i5$1bv32$2 else v193$2);
    v194$1 := (if p4$1 then $$a.i5$2bv32$1 else v194$1);
    v194$2 := (if p4$2 then $$a.i5$2bv32$2 else v194$2);
    v195$1 := (if p4$1 then $$a.i5$3bv32$1 else v195$1);
    v195$2 := (if p4$2 then $$a.i5$3bv32$2 else v195$2);
    $$0$0bv32$1 := (if p4$1 then FMUL32(v192$1, v0) else $$0$0bv32$1);
    $$0$0bv32$2 := (if p4$2 then FMUL32(v192$2, v0) else $$0$0bv32$2);
    $$0$1bv32$1 := (if p4$1 then FMUL32(v193$1, v0) else $$0$1bv32$1);
    $$0$1bv32$2 := (if p4$2 then FMUL32(v193$2, v0) else $$0$1bv32$2);
    $$0$2bv32$1 := (if p4$1 then FMUL32(v194$1, v0) else $$0$2bv32$1);
    $$0$2bv32$2 := (if p4$2 then FMUL32(v194$2, v0) else $$0$2bv32$2);
    $$0$3bv32$1 := (if p4$1 then FMUL32(v195$1, v0) else $$0$3bv32$1);
    $$0$3bv32$2 := (if p4$2 then FMUL32(v195$2, v0) else $$0$3bv32$2);
    v196$1 := (if p4$1 then $$0$0bv32$1 else v196$1);
    v196$2 := (if p4$2 then $$0$0bv32$2 else v196$2);
    v197$1 := (if p4$1 then $$0$1bv32$1 else v197$1);
    v197$2 := (if p4$2 then $$0$1bv32$2 else v197$2);
    v198$1 := (if p4$1 then $$0$2bv32$1 else v198$1);
    v198$2 := (if p4$2 then $$0$2bv32$2 else v198$2);
    v199$1 := (if p4$1 then $$0$3bv32$1 else v199$1);
    v199$2 := (if p4$2 then $$0$3bv32$2 else v199$2);
    $$1$0bv32$1 := (if p4$1 then v196$1 else $$1$0bv32$1);
    $$1$0bv32$2 := (if p4$2 then v196$2 else $$1$0bv32$2);
    $$1$1bv32$1 := (if p4$1 then v197$1 else $$1$1bv32$1);
    $$1$1bv32$2 := (if p4$2 then v197$2 else $$1$1bv32$2);
    $$1$2bv32$1 := (if p4$1 then v198$1 else $$1$2bv32$1);
    $$1$2bv32$2 := (if p4$2 then v198$2 else $$1$2bv32$2);
    $$1$3bv32$1 := (if p4$1 then v199$1 else $$1$3bv32$1);
    $$1$3bv32$2 := (if p4$2 then v199$2 else $$1$3bv32$2);
    v200$1 := (if p4$1 then $$1$0bv32$1 else v200$1);
    v200$2 := (if p4$2 then $$1$0bv32$2 else v200$2);
    v201$1 := (if p4$1 then $$1$1bv32$1 else v201$1);
    v201$2 := (if p4$2 then $$1$1bv32$2 else v201$2);
    v202$1 := (if p4$1 then $$1$2bv32$1 else v202$1);
    v202$2 := (if p4$2 then $$1$2bv32$2 else v202$2);
    v203$1 := (if p4$1 then $$1$3bv32$1 else v203$1);
    v203$2 := (if p4$2 then $$1$3bv32$2 else v203$2);
    $$20$0bv32$1 := (if p4$1 then v200$1 else $$20$0bv32$1);
    $$20$0bv32$2 := (if p4$2 then v200$2 else $$20$0bv32$2);
    $$20$1bv32$1 := (if p4$1 then v201$1 else $$20$1bv32$1);
    $$20$1bv32$2 := (if p4$2 then v201$2 else $$20$1bv32$2);
    $$20$2bv32$1 := (if p4$1 then v202$1 else $$20$2bv32$1);
    $$20$2bv32$2 := (if p4$2 then v202$2 else $$20$2bv32$2);
    $$20$3bv32$1 := (if p4$1 then v203$1 else $$20$3bv32$1);
    $$20$3bv32$2 := (if p4$2 then v203$2 else $$20$3bv32$2);
    v204$1 := (if p4$1 then $$20$0bv32$1 else v204$1);
    v204$2 := (if p4$2 then $$20$0bv32$2 else v204$2);
    v205$1 := (if p4$1 then $$20$1bv32$1 else v205$1);
    v205$2 := (if p4$2 then $$20$1bv32$2 else v205$2);
    v206$1 := (if p4$1 then $$20$2bv32$1 else v206$1);
    v206$2 := (if p4$2 then $$20$2bv32$2 else v206$2);
    v207$1 := (if p4$1 then $$20$3bv32$1 else v207$1);
    v207$2 := (if p4$2 then $$20$3bv32$2 else v207$2);
    $$rgba.i$0bv32$1 := (if p4$1 then v204$1 else $$rgba.i$0bv32$1);
    $$rgba.i$0bv32$2 := (if p4$2 then v204$2 else $$rgba.i$0bv32$2);
    $$rgba.i$1bv32$1 := (if p4$1 then v205$1 else $$rgba.i$1bv32$1);
    $$rgba.i$1bv32$2 := (if p4$2 then v205$2 else $$rgba.i$1bv32$2);
    $$rgba.i$2bv32$1 := (if p4$1 then v206$1 else $$rgba.i$2bv32$1);
    $$rgba.i$2bv32$2 := (if p4$2 then v206$2 else $$rgba.i$2bv32$2);
    $$rgba.i$3bv32$1 := (if p4$1 then v207$1 else $$rgba.i$3bv32$1);
    $$rgba.i$3bv32$2 := (if p4$2 then v207$2 else $$rgba.i$3bv32$2);
    v208$1 := (if p4$1 then $$rgba.i$0bv32$1 else v208$1);
    v208$2 := (if p4$2 then $$rgba.i$0bv32$2 else v208$2);
    call {:sourceloc_num 375} v209$1, v209$2 := $__saturatef(p4$1, v208$1, p4$2, v208$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i$0bv32$1 := (if p4$1 then v209$1 else $$rgba.i$0bv32$1);
    $$rgba.i$0bv32$2 := (if p4$2 then v209$2 else $$rgba.i$0bv32$2);
    v210$1 := (if p4$1 then $$rgba.i$1bv32$1 else v210$1);
    v210$2 := (if p4$2 then $$rgba.i$1bv32$2 else v210$2);
    call {:sourceloc_num 378} v211$1, v211$2 := $__saturatef(p4$1, v210$1, p4$2, v210$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i$1bv32$1 := (if p4$1 then v211$1 else $$rgba.i$1bv32$1);
    $$rgba.i$1bv32$2 := (if p4$2 then v211$2 else $$rgba.i$1bv32$2);
    v212$1 := (if p4$1 then $$rgba.i$2bv32$1 else v212$1);
    v212$2 := (if p4$2 then $$rgba.i$2bv32$2 else v212$2);
    call {:sourceloc_num 381} v213$1, v213$2 := $__saturatef(p4$1, v212$1, p4$2, v212$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i$2bv32$1 := (if p4$1 then v213$1 else $$rgba.i$2bv32$1);
    $$rgba.i$2bv32$2 := (if p4$2 then v213$2 else $$rgba.i$2bv32$2);
    v214$1 := (if p4$1 then $$rgba.i$3bv32$1 else v214$1);
    v214$2 := (if p4$2 then $$rgba.i$3bv32$2 else v214$2);
    call {:sourceloc_num 384} v215$1, v215$2 := $__saturatef(p4$1, v214$1, p4$2, v214$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i$3bv32$1 := (if p4$1 then v215$1 else $$rgba.i$3bv32$1);
    $$rgba.i$3bv32$2 := (if p4$2 then v215$2 else $$rgba.i$3bv32$2);
    v216$1 := (if p4$1 then $$rgba.i$3bv32$1 else v216$1);
    v216$2 := (if p4$2 then $$rgba.i$3bv32$2 else v216$2);
    v217$1 := (if p4$1 then $$rgba.i$2bv32$1 else v217$1);
    v217$2 := (if p4$2 then $$rgba.i$2bv32$2 else v217$2);
    v218$1 := (if p4$1 then $$rgba.i$1bv32$1 else v218$1);
    v218$2 := (if p4$2 then $$rgba.i$1bv32$2 else v218$2);
    v219$1 := (if p4$1 then $$rgba.i$0bv32$1 else v219$1);
    v219$2 := (if p4$2 then $$rgba.i$0bv32$2 else v219$2);
    call {:sourceloc} {:sourceloc_num 390} _LOG_WRITE_$$od(p4$1, BV32_ADD(BV32_MUL(v1$1, $w), $x1.0$1), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v216$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v217$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v218$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v219$1, 1132396544bv32))), $$od[BV32_ADD(BV32_MUL(v1$1, $w), $x1.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$od(p4$2, BV32_ADD(BV32_MUL(v1$2, $w), $x1.0$2));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 390} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 390} _CHECK_WRITE_$$od(p4$2, BV32_ADD(BV32_MUL(v1$2, $w), $x1.0$2), BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v216$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v217$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v218$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v219$2, 1132396544bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$od"} true;
    $$od[BV32_ADD(BV32_MUL(v1$1, $w), $x1.0$1)] := (if p4$1 then BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v216$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v217$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v218$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v219$1, 1132396544bv32))) else $$od[BV32_ADD(BV32_MUL(v1$1, $w), $x1.0$1)]);
    $$od[BV32_ADD(BV32_MUL(v1$2, $w), $x1.0$2)] := (if p4$2 then BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v216$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v217$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v218$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v219$2, 1132396544bv32))) else $$od[BV32_ADD(BV32_MUL(v1$2, $w), $x1.0$2)]);
    $x1.0$1 := (if p4$1 then BV32_ADD($x1.0$1, 1bv32) else $x1.0$1);
    $x1.0$2 := (if p4$2 then BV32_ADD($x1.0$2, 1bv32) else $x1.0$2);
    p3$1 := (if p4$1 then true else p3$1);
    p3$2 := (if p4$2 then true else p3$2);
    goto $6.backedge, $6.tail;

  $6.tail:
    assume !p3$1 && !p3$2;
    return;

  $6.backedge:
    assume {:backedge} p3$1 || p3$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $6;

  $2.backedge:
    assume {:backedge} p1$1 || p1$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $2;
}



procedure {:source_name "_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff"} $_Z5tex2D7textureI6uchar4Li2EL19cudaTextureReadMode1EEff(_P$1: bool, $0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32) returns ($ret$1: bv128, $ret$2: bv128);



procedure {:source_name "__saturatef"} $__saturatef(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



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

var $$a.i5$0bv32$1: bv32;

var $$a.i5$0bv32$2: bv32;

var $$a.i5$1bv32$1: bv32;

var $$a.i5$1bv32$2: bv32;

var $$a.i5$2bv32$1: bv32;

var $$a.i5$2bv32$2: bv32;

var $$a.i5$3bv32$1: bv32;

var $$a.i5$3bv32$2: bv32;

var $$2$0bv32$1: bv32;

var $$2$0bv32$2: bv32;

var $$2$1bv32$1: bv32;

var $$2$1bv32$2: bv32;

var $$2$2bv32$1: bv32;

var $$2$2bv32$2: bv32;

var $$2$3bv32$1: bv32;

var $$2$3bv32$2: bv32;

var $$b.i4$0bv32$1: bv32;

var $$b.i4$0bv32$2: bv32;

var $$b.i4$1bv32$1: bv32;

var $$b.i4$1bv32$2: bv32;

var $$b.i4$2bv32$1: bv32;

var $$b.i4$2bv32$2: bv32;

var $$b.i4$3bv32$1: bv32;

var $$b.i4$3bv32$2: bv32;

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

var $$b.i3$0bv32$1: bv32;

var $$b.i3$0bv32$2: bv32;

var $$b.i3$1bv32$1: bv32;

var $$b.i3$1bv32$2: bv32;

var $$b.i3$2bv32$1: bv32;

var $$b.i3$2bv32$2: bv32;

var $$b.i3$3bv32$1: bv32;

var $$b.i3$3bv32$2: bv32;

var $$5$0bv32$1: bv32;

var $$5$0bv32$2: bv32;

var $$5$1bv32$1: bv32;

var $$5$1bv32$2: bv32;

var $$5$2bv32$1: bv32;

var $$5$2bv32$2: bv32;

var $$5$3bv32$1: bv32;

var $$5$3bv32$2: bv32;

var $$rgba.i2$0bv32$1: bv32;

var $$rgba.i2$0bv32$2: bv32;

var $$rgba.i2$1bv32$1: bv32;

var $$rgba.i2$1bv32$2: bv32;

var $$rgba.i2$2bv32$1: bv32;

var $$rgba.i2$2bv32$2: bv32;

var $$rgba.i2$3bv32$1: bv32;

var $$rgba.i2$3bv32$2: bv32;

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

var $$a.i$0bv32$1: bv32;

var $$a.i$0bv32$2: bv32;

var $$a.i$1bv32$1: bv32;

var $$a.i$1bv32$2: bv32;

var $$a.i$2bv32$1: bv32;

var $$a.i$2bv32$2: bv32;

var $$a.i$3bv32$1: bv32;

var $$a.i$3bv32$2: bv32;

var $$8$0bv32$1: bv32;

var $$8$0bv32$2: bv32;

var $$8$1bv32$1: bv32;

var $$8$1bv32$2: bv32;

var $$8$2bv32$1: bv32;

var $$8$2bv32$2: bv32;

var $$8$3bv32$1: bv32;

var $$8$3bv32$2: bv32;

var $$b.i$0bv32$1: bv32;

var $$b.i$0bv32$2: bv32;

var $$b.i$1bv32$1: bv32;

var $$b.i$1bv32$2: bv32;

var $$b.i$2bv32$1: bv32;

var $$b.i$2bv32$2: bv32;

var $$b.i$3bv32$1: bv32;

var $$b.i$3bv32$2: bv32;

var $$9$0bv32$1: bv32;

var $$9$0bv32$2: bv32;

var $$9$1bv32$1: bv32;

var $$9$1bv32$2: bv32;

var $$9$2bv32$1: bv32;

var $$9$2bv32$2: bv32;

var $$9$3bv32$1: bv32;

var $$9$3bv32$2: bv32;

var $$rgba.i$0bv32$1: bv32;

var $$rgba.i$0bv32$2: bv32;

var $$rgba.i$1bv32$1: bv32;

var $$rgba.i$1bv32$2: bv32;

var $$rgba.i$2bv32$1: bv32;

var $$rgba.i$2bv32$2: bv32;

var $$rgba.i$3bv32$1: bv32;

var $$rgba.i$3bv32$2: bv32;

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

var $$t$0bv32$1: bv32;

var $$t$0bv32$2: bv32;

var $$t$1bv32$1: bv32;

var $$t$1bv32$2: bv32;

var $$t$2bv32$1: bv32;

var $$t$2bv32$2: bv32;

var $$t$3bv32$1: bv32;

var $$t$3bv32$2: bv32;

var $$12$0bv32$1: bv32;

var $$12$0bv32$2: bv32;

var $$12$1bv32$1: bv32;

var $$12$1bv32$2: bv32;

var $$12$2bv32$1: bv32;

var $$12$2bv32$2: bv32;

var $$12$3bv32$1: bv32;

var $$12$3bv32$2: bv32;

var $$13$0bv32$1: bv8;

var $$13$0bv32$2: bv8;

var $$13$1bv32$1: bv8;

var $$13$1bv32$2: bv8;

var $$13$2bv32$1: bv8;

var $$13$2bv32$2: bv8;

var $$13$3bv32$1: bv8;

var $$13$3bv32$2: bv8;

var $$13$4bv32$1: bv8;

var $$13$4bv32$2: bv8;

var $$13$5bv32$1: bv8;

var $$13$5bv32$2: bv8;

var $$13$6bv32$1: bv8;

var $$13$6bv32$2: bv8;

var $$13$7bv32$1: bv8;

var $$13$7bv32$2: bv8;

var $$13$8bv32$1: bv8;

var $$13$8bv32$2: bv8;

var $$13$9bv32$1: bv8;

var $$13$9bv32$2: bv8;

var $$13$10bv32$1: bv8;

var $$13$10bv32$2: bv8;

var $$13$11bv32$1: bv8;

var $$13$11bv32$2: bv8;

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

var $$17$0bv32$1: bv8;

var $$17$0bv32$2: bv8;

var $$17$1bv32$1: bv8;

var $$17$1bv32$2: bv8;

var $$17$2bv32$1: bv8;

var $$17$2bv32$2: bv8;

var $$17$3bv32$1: bv8;

var $$17$3bv32$2: bv8;

var $$17$4bv32$1: bv8;

var $$17$4bv32$2: bv8;

var $$17$5bv32$1: bv8;

var $$17$5bv32$2: bv8;

var $$17$6bv32$1: bv8;

var $$17$6bv32$2: bv8;

var $$17$7bv32$1: bv8;

var $$17$7bv32$2: bv8;

var $$17$8bv32$1: bv8;

var $$17$8bv32$2: bv8;

var $$17$9bv32$1: bv8;

var $$17$9bv32$2: bv8;

var $$17$10bv32$1: bv8;

var $$17$10bv32$2: bv8;

var $$17$11bv32$1: bv8;

var $$17$11bv32$2: bv8;

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

var $$19$4bv32$1: bv8;

var $$19$4bv32$2: bv8;

var $$19$5bv32$1: bv8;

var $$19$5bv32$2: bv8;

var $$19$6bv32$1: bv8;

var $$19$6bv32$2: bv8;

var $$19$7bv32$1: bv8;

var $$19$7bv32$2: bv8;

var $$19$8bv32$1: bv8;

var $$19$8bv32$2: bv8;

var $$19$9bv32$1: bv8;

var $$19$9bv32$2: bv8;

var $$19$10bv32$1: bv8;

var $$19$10bv32$2: bv8;

var $$19$11bv32$1: bv8;

var $$19$11bv32$2: bv8;

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

const {:existential true} _b0: bool;

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

const {:existential true} _b9: bool;

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



const _WATCHED_VALUE_$$rgbaTex: bv8;

procedure {:inline 1} _LOG_READ_$$rgbaTex(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$rgbaTex;



implementation {:inline 1} _LOG_READ_$$rgbaTex(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$rgbaTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rgbaTex == _value then true else _READ_HAS_OCCURRED_$$rgbaTex);
    return;
}



procedure _CHECK_READ_$$rgbaTex(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "rgbaTex"} {:array "$$rgbaTex"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$rgbaTex && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$rgbaTex);
  requires {:source_name "rgbaTex"} {:array "$$rgbaTex"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$rgbaTex && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$rgbaTex: bool;

procedure {:inline 1} _LOG_WRITE_$$rgbaTex(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$rgbaTex, _WRITE_READ_BENIGN_FLAG_$$rgbaTex;



implementation {:inline 1} _LOG_WRITE_$$rgbaTex(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$rgbaTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rgbaTex == _value then true else _WRITE_HAS_OCCURRED_$$rgbaTex);
    _WRITE_READ_BENIGN_FLAG_$$rgbaTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rgbaTex == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$rgbaTex);
    return;
}



procedure _CHECK_WRITE_$$rgbaTex(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "rgbaTex"} {:array "$$rgbaTex"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$rgbaTex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rgbaTex != _value);
  requires {:source_name "rgbaTex"} {:array "$$rgbaTex"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$rgbaTex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rgbaTex != _value);
  requires {:source_name "rgbaTex"} {:array "$$rgbaTex"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$rgbaTex && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$rgbaTex(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$rgbaTex;



implementation {:inline 1} _LOG_ATOMIC_$$rgbaTex(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$rgbaTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$rgbaTex);
    return;
}



procedure _CHECK_ATOMIC_$$rgbaTex(_P: bool, _offset: bv32);
  requires {:source_name "rgbaTex"} {:array "$$rgbaTex"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$rgbaTex && _WATCHED_OFFSET == _offset);
  requires {:source_name "rgbaTex"} {:array "$$rgbaTex"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$rgbaTex && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$rgbaTex(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$rgbaTex;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$rgbaTex(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$rgbaTex := (if _P && _WRITE_HAS_OCCURRED_$$rgbaTex && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$rgbaTex);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b10: bool;

const {:existential true} _b11: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b12: bool;

const {:existential true} _b13: bool;
