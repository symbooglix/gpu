type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



var {:source_name "LMatrix"} {:global} $$LMatrix: [bv32]bv64;

axiom {:array_info "$$LMatrix"} {:global} {:elem_width 64} {:source_name "LMatrix"} {:source_elem_width 256} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$LMatrix: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$LMatrix: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$LMatrix: bool;

var {:source_name "inplaceMatrix"} {:global} $$inplaceMatrix: [bv32]bv64;

axiom {:array_info "$$inplaceMatrix"} {:global} {:elem_width 64} {:source_name "inplaceMatrix"} {:source_elem_width 256} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$inplaceMatrix: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$inplaceMatrix: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$inplaceMatrix: bool;

var {:source_name "ratio"} {:group_shared} $$ratio: [bv1][bv32]bv64;

axiom {:array_info "$$ratio"} {:group_shared} {:elem_width 64} {:source_name "ratio"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$ratio: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$ratio: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$ratio: bool;

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

function FADD64(bv64, bv64) : bv64;

function FDIV64(bv64, bv64) : bv64;

function FMUL64(bv64, bv64) : bv64;

function FSUB64(bv64, bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

procedure {:source_name "kernelLUDecompose"} {:kernel} $kernelLUDecompose($d: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $d == 1bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$LMatrix && !_WRITE_HAS_OCCURRED_$$LMatrix && !_ATOMIC_HAS_OCCURRED_$$LMatrix;
  requires !_READ_HAS_OCCURRED_$$inplaceMatrix && !_WRITE_HAS_OCCURRED_$$inplaceMatrix && !_ATOMIC_HAS_OCCURRED_$$inplaceMatrix;
  requires !_READ_HAS_OCCURRED_$$ratio && !_WRITE_HAS_OCCURRED_$$ratio && !_ATOMIC_HAS_OCCURRED_$$ratio;
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
  modifies $$ratio, _READ_HAS_OCCURRED_$$inplaceMatrix, _WRITE_HAS_OCCURRED_$$ratio, _WRITE_READ_BENIGN_FLAG_$$ratio, _WRITE_READ_BENIGN_FLAG_$$ratio, $$LMatrix, $$inplaceMatrix, _TRACKING, _READ_HAS_OCCURRED_$$ratio, _READ_HAS_OCCURRED_$$LMatrix, _WRITE_HAS_OCCURRED_$$LMatrix, _WRITE_READ_BENIGN_FLAG_$$LMatrix, _WRITE_READ_BENIGN_FLAG_$$LMatrix, _WRITE_HAS_OCCURRED_$$inplaceMatrix, _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix, _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix;



implementation {:source_name "kernelLUDecompose"} {:kernel} $kernelLUDecompose($d: bv32)
{
  var $0$1: bv64;
  var $0$2: bv64;
  var $1$1: bv64;
  var $1$2: bv64;
  var $2$1: bv64;
  var $2$2: bv64;
  var $3$1: bv64;
  var $3$2: bv64;
  var $4$1: bv64;
  var $4$2: bv64;
  var $5$1: bv64;
  var $5$2: bv64;
  var $6$1: bv64;
  var $6$2: bv64;
  var $7$1: bv64;
  var $7$2: bv64;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v68$1: bv64;
  var v68$2: bv64;
  var v69$1: bv64;
  var v69$2: bv64;
  var v70$1: bv64;
  var v70$2: bv64;
  var v71$1: bv64;
  var v71$2: bv64;
  var v72$1: bv64;
  var v72$2: bv64;
  var v3: bv32;
  var v4: bv32;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bv64;
  var v7$2: bv64;
  var v8$1: bv64;
  var v8$2: bv64;
  var v9$1: bv64;
  var v9$2: bv64;
  var v10$1: bv64;
  var v10$2: bv64;
  var v11$1: bv64;
  var v11$2: bv64;
  var v12$1: bv64;
  var v12$2: bv64;
  var v13$1: bv64;
  var v13$2: bv64;
  var v14$1: bv64;
  var v14$2: bv64;
  var v15$1: bv64;
  var v15$2: bv64;
  var v16$1: bool;
  var v16$2: bool;
  var v17$1: bv64;
  var v17$2: bv64;
  var v18$1: bv64;
  var v18$2: bv64;
  var v19$1: bv64;
  var v19$2: bv64;
  var v20$1: bv64;
  var v20$2: bv64;
  var v21$1: bv64;
  var v21$2: bv64;
  var v22$1: bv64;
  var v22$2: bv64;
  var v23$1: bv64;
  var v23$2: bv64;
  var v24$1: bv64;
  var v24$2: bv64;
  var v25$1: bv64;
  var v25$2: bv64;
  var v26$1: bool;
  var v26$2: bool;
  var v27$1: bv64;
  var v27$2: bv64;
  var v28$1: bv64;
  var v28$2: bv64;
  var v29$1: bv64;
  var v29$2: bv64;
  var v30$1: bv64;
  var v30$2: bv64;
  var v31$1: bv64;
  var v31$2: bv64;
  var v32$1: bv64;
  var v32$2: bv64;
  var v33$1: bv64;
  var v33$2: bv64;
  var v34$1: bv64;
  var v34$2: bv64;
  var v35$1: bv64;
  var v35$2: bv64;
  var v36$1: bool;
  var v36$2: bool;
  var v37$1: bv64;
  var v37$2: bv64;
  var v38$1: bv64;
  var v38$2: bv64;
  var v39$1: bv64;
  var v39$2: bv64;
  var v40$1: bv64;
  var v40$2: bv64;
  var v41$1: bv64;
  var v41$2: bv64;
  var v42$1: bv64;
  var v42$2: bv64;
  var v43$1: bv64;
  var v43$2: bv64;
  var v44$1: bv64;
  var v44$2: bv64;
  var v45$1: bv64;
  var v45$2: bv64;
  var v46$1: bool;
  var v46$2: bool;
  var v47$1: bool;
  var v47$2: bool;
  var v48$1: bv64;
  var v48$2: bv64;
  var v49$1: bv64;
  var v49$2: bv64;
  var v50$1: bv64;
  var v50$2: bv64;
  var v51$1: bv64;
  var v51$2: bv64;
  var v52$1: bv64;
  var v52$2: bv64;
  var v53$1: bv64;
  var v53$2: bv64;
  var v54$1: bv64;
  var v54$2: bv64;
  var v55$1: bv64;
  var v55$2: bv64;
  var v56$1: bv64;
  var v56$2: bv64;
  var v57$1: bv64;
  var v57$2: bv64;
  var v58$1: bv64;
  var v58$2: bv64;
  var v59$1: bv64;
  var v59$2: bv64;
  var v60$1: bv64;
  var v60$2: bv64;
  var v61$1: bv64;
  var v61$2: bv64;
  var v62$1: bv64;
  var v62$2: bv64;
  var v63$1: bv64;
  var v63$2: bv64;
  var v64$1: bv64;
  var v64$2: bv64;
  var v65$1: bv64;
  var v65$2: bv64;
  var v66$1: bv64;
  var v66$2: bv64;
  var v67$1: bv64;
  var v67$2: bv64;
  var v73$1: bv64;
  var v73$2: bv64;
  var v74$1: bv64;
  var v74$2: bv64;
  var v75$1: bv64;
  var v75$2: bv64;
  var v76$1: bv64;
  var v76$2: bv64;
  var v77$1: bv64;
  var v77$2: bv64;
  var v78$1: bv64;
  var v78$2: bv64;
  var v79$1: bv64;
  var v79$2: bv64;
  var v80$1: bv64;
  var v80$2: bv64;
  var v81$1: bv64;
  var v81$2: bv64;
  var v82$1: bv64;
  var v82$2: bv64;
  var v83$1: bv64;
  var v83$2: bv64;
  var v84$1: bv64;
  var v84$2: bv64;
  var v85$1: bv64;
  var v85$2: bv64;
  var v86$1: bv64;
  var v86$2: bv64;
  var v87$1: bv64;
  var v87$2: bv64;
  var v88$1: bool;
  var v88$2: bool;
  var v89$1: bool;
  var v89$2: bool;
  var v90$1: bv64;
  var v90$2: bv64;
  var v91$1: bv32;
  var v91$2: bv32;
  var v92$1: bv64;
  var v92$2: bv64;
  var v93$1: bv64;
  var v93$2: bv64;
  var v94$1: bv64;
  var v94$2: bv64;
  var v95$1: bv64;
  var v95$2: bv64;
  var v96$1: bv32;
  var v96$2: bv32;
  var v97$1: bv64;
  var v97$2: bv64;
  var v98$1: bv64;
  var v98$2: bv64;
  var v99$1: bv64;
  var v99$2: bv64;
  var v100$1: bv64;
  var v100$2: bv64;
  var v101$1: bool;
  var v101$2: bool;
  var v102$1: bv64;
  var v102$2: bv64;
  var v103$1: bv32;
  var v103$2: bv32;
  var v104$1: bv64;
  var v104$2: bv64;
  var v105$1: bv64;
  var v105$2: bv64;
  var v106$1: bv64;
  var v106$2: bv64;
  var v107$1: bv64;
  var v107$2: bv64;
  var v108$1: bv32;
  var v108$2: bv32;
  var v109$1: bv64;
  var v109$2: bv64;
  var v110$1: bv64;
  var v110$2: bv64;
  var v111$1: bv64;
  var v111$2: bv64;
  var v112$1: bv64;
  var v112$2: bv64;
  var v113$1: bool;
  var v113$2: bool;
  var v114$1: bv64;
  var v114$2: bv64;
  var v115$1: bv32;
  var v115$2: bv32;
  var v116$1: bv64;
  var v116$2: bv64;
  var v117$1: bv64;
  var v117$2: bv64;
  var v118$1: bv64;
  var v118$2: bv64;
  var v119$1: bv64;
  var v119$2: bv64;
  var v120$1: bv32;
  var v120$2: bv32;
  var v121$1: bv64;
  var v121$2: bv64;
  var v122$1: bv64;
  var v122$2: bv64;
  var v123$1: bv64;
  var v123$2: bv64;
  var v124$1: bv64;
  var v124$2: bv64;
  var v125$1: bool;
  var v125$2: bool;
  var v126$1: bv64;
  var v126$2: bv64;
  var v127$1: bv32;
  var v127$2: bv32;
  var v128$1: bv64;
  var v128$2: bv64;
  var v129$1: bv64;
  var v129$2: bv64;
  var v130$1: bv64;
  var v130$2: bv64;
  var v131$1: bv64;
  var v131$2: bv64;
  var v132$1: bv32;
  var v132$2: bv32;
  var v133$1: bv64;
  var v133$2: bv64;
  var v134$1: bv64;
  var v134$2: bv64;
  var v135$1: bv64;
  var v135$2: bv64;
  var v136$1: bv64;
  var v136$2: bv64;
  var v137$1: bv32;
  var v137$2: bv32;
  var v138$1: bv64;
  var v138$2: bv64;
  var v139$1: bv64;
  var v139$2: bv64;
  var v140$1: bv64;
  var v140$2: bv64;
  var v141$1: bv64;
  var v141$2: bv64;
  var v142$1: bv32;
  var v142$2: bv32;
  var v151$1: bv64;
  var v151$2: bv64;
  var v143$1: bv64;
  var v143$2: bv64;
  var v144$1: bv64;
  var v144$2: bv64;
  var v145$1: bv64;
  var v145$2: bv64;
  var v146$1: bv64;
  var v146$2: bv64;
  var v147$1: bv32;
  var v147$2: bv32;
  var v148$1: bv64;
  var v148$2: bv64;
  var v149$1: bv64;
  var v149$2: bv64;
  var v150$1: bv64;
  var v150$2: bv64;
  var v152$1: bv32;
  var v152$2: bv32;
  var v153$1: bv64;
  var v153$2: bv64;
  var v154$1: bv64;
  var v154$2: bv64;
  var v155$1: bv64;
  var v155$2: bv64;
  var v156$1: bv64;
  var v156$2: bv64;
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


  __partitioned_block_$0_0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v2$1 := local_id_y$1;
    v2$2 := local_id_y$2;
    v3 := BV32_ADD(BV32_MUL(group_size_x, num_groups_x), BV32_SDIV($d, 4bv32));
    v4 := BV32_SREM($d, 4bv32);
    v5$1 := local_id_x$1 == 0bv32;
    v5$2 := local_id_x$2 == 0bv32;
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    p9$1 := false;
    p9$2 := false;
    p10$1 := false;
    p10$2 := false;
    p11$1 := false;
    p11$2 := false;
    p12$1 := false;
    p12$2 := false;
    p13$1 := false;
    p13$2 := false;
    p14$1 := false;
    p14$2 := false;
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
    p0$1 := (if v5$1 then v5$1 else p0$1);
    p0$2 := (if v5$2 then v5$2 else p0$2);
    v6$1 := (if p0$1 then v4 == 0bv32 else v6$1);
    v6$2 := (if p0$2 then v4 == 0bv32 else v6$2);
    p1$1 := (if p0$1 && v6$1 then v6$1 else p1$1);
    p1$2 := (if p0$2 && v6$2 then v6$2 else p1$2);
    p2$1 := (if p0$1 && !v6$1 then !v6$1 else p2$1);
    p2$2 := (if p0$2 && !v6$2 then !v6$2 else p2$2);
    call {:sourceloc} {:sourceloc_num 4} _LOG_READ_$$inplaceMatrix(p1$1, BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_163"} {:captureState "check_state_163"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_163"} {:sourceloc} {:sourceloc_num 4} _CHECK_READ_$$inplaceMatrix(p1$2, BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v7$1 := (if p1$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v7$1);
    v7$2 := (if p1$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v7$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$inplaceMatrix(p1$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_164"} {:captureState "check_state_164"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_164"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$inplaceMatrix(p1$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v8$1 := (if p1$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v8$1);
    v8$2 := (if p1$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v8$2);
    call {:sourceloc} {:sourceloc_num 6} _LOG_READ_$$inplaceMatrix(p1$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_165"} {:captureState "check_state_165"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_165"} {:sourceloc} {:sourceloc_num 6} _CHECK_READ_$$inplaceMatrix(p1$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v9$1 := (if p1$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v9$1);
    v9$2 := (if p1$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v9$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_READ_$$inplaceMatrix(p1$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_166"} {:captureState "check_state_166"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_166"} {:sourceloc} {:sourceloc_num 7} _CHECK_READ_$$inplaceMatrix(p1$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v10$1 := (if p1$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v10$1);
    v10$2 := (if p1$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v10$2);
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$inplaceMatrix(p1$1, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_167"} {:captureState "check_state_167"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_167"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$inplaceMatrix(p1$2, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v11$1 := (if p1$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v11$1);
    v11$2 := (if p1$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v11$2);
    call {:sourceloc} {:sourceloc_num 9} _LOG_READ_$$inplaceMatrix(p1$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_168"} {:captureState "check_state_168"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_168"} {:sourceloc} {:sourceloc_num 9} _CHECK_READ_$$inplaceMatrix(p1$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v12$1 := (if p1$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v12$1);
    v12$2 := (if p1$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v12$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$inplaceMatrix(p1$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_169"} {:captureState "check_state_169"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_169"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$inplaceMatrix(p1$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v13$1 := (if p1$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v13$1);
    v13$2 := (if p1$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v13$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$inplaceMatrix(p1$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_170"} {:captureState "check_state_170"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_170"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$inplaceMatrix(p1$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v14$1 := (if p1$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v14$1);
    v14$2 := (if p1$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v14$2);
    v15$1 := (if p1$1 then FDIV64(v7$1, v11$1) else v15$1);
    v15$2 := (if p1$2 then FDIV64(v7$2, v11$2) else v15$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$ratio(p1$1, v2$1, v15$1, $$ratio[1bv1][v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$ratio(p1$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_171"} {:captureState "check_state_171"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_171"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$ratio(p1$2, v2$2, v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$ratio"} true;
    $$ratio[1bv1][v2$1] := (if p1$1 then v15$1 else $$ratio[1bv1][v2$1]);
    $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2] := (if p1$2 then v15$2 else $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2]);
    $0$1 := (if p1$1 then v15$1 else $0$1);
    $0$2 := (if p1$2 then v15$2 else $0$2);
    $0$1 := (if p2$1 then 4607182418800017408bv64 else $0$1);
    $0$2 := (if p2$2 then 4607182418800017408bv64 else $0$2);
    v16$1 := (if p0$1 then v4 == 1bv32 else v16$1);
    v16$2 := (if p0$2 then v4 == 1bv32 else v16$2);
    p3$1 := (if p0$1 && v16$1 then v16$1 else p3$1);
    p3$2 := (if p0$2 && v16$2 then v16$2 else p3$2);
    p4$1 := (if p0$1 && !v16$1 then !v16$1 else p4$1);
    p4$2 := (if p0$2 && !v16$2 then !v16$2 else p4$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$inplaceMatrix(p3$1, BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_154"} {:captureState "check_state_154"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_154"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$inplaceMatrix(p3$2, BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v17$1 := (if p3$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v17$1);
    v17$2 := (if p3$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v17$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$inplaceMatrix(p3$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_155"} {:captureState "check_state_155"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_155"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$inplaceMatrix(p3$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v18$1 := (if p3$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v18$1);
    v18$2 := (if p3$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v18$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_READ_$$inplaceMatrix(p3$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_156"} {:captureState "check_state_156"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_156"} {:sourceloc} {:sourceloc_num 18} _CHECK_READ_$$inplaceMatrix(p3$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v19$1 := (if p3$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v19$1);
    v19$2 := (if p3$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v19$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$inplaceMatrix(p3$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_157"} {:captureState "check_state_157"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_157"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$inplaceMatrix(p3$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v20$1 := (if p3$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v20$1);
    v20$2 := (if p3$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v20$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_READ_$$inplaceMatrix(p3$1, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_158"} {:captureState "check_state_158"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_158"} {:sourceloc} {:sourceloc_num 20} _CHECK_READ_$$inplaceMatrix(p3$2, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v21$1 := (if p3$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v21$1);
    v21$2 := (if p3$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v21$2);
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$inplaceMatrix(p3$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_159"} {:captureState "check_state_159"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_159"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$inplaceMatrix(p3$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v22$1 := (if p3$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v22$1);
    v22$2 := (if p3$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v22$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$inplaceMatrix(p3$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_160"} {:captureState "check_state_160"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_160"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$inplaceMatrix(p3$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v23$1 := (if p3$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v23$1);
    v23$2 := (if p3$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v23$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$inplaceMatrix(p3$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_161"} {:captureState "check_state_161"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_161"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$inplaceMatrix(p3$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v24$1 := (if p3$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v24$1);
    v24$2 := (if p3$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v24$2);
    v25$1 := (if p3$1 then FDIV64(v18$1, v22$1) else v25$1);
    v25$2 := (if p3$2 then FDIV64(v18$2, v22$2) else v25$2);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$ratio(p3$1, v2$1, v25$1, $$ratio[1bv1][v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$ratio(p3$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_162"} {:captureState "check_state_162"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_162"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$ratio(p3$2, v2$2, v25$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$ratio"} true;
    $$ratio[1bv1][v2$1] := (if p3$1 then v25$1 else $$ratio[1bv1][v2$1]);
    $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2] := (if p3$2 then v25$2 else $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2]);
    $1$1 := (if p3$1 then v25$1 else $1$1);
    $1$2 := (if p3$2 then v25$2 else $1$2);
    $1$1 := (if p4$1 then 4607182418800017408bv64 else $1$1);
    $1$2 := (if p4$2 then 4607182418800017408bv64 else $1$2);
    v26$1 := (if p0$1 then v4 == 2bv32 else v26$1);
    v26$2 := (if p0$2 then v4 == 2bv32 else v26$2);
    p5$1 := (if p0$1 && v26$1 then v26$1 else p5$1);
    p5$2 := (if p0$2 && v26$2 then v26$2 else p5$2);
    p6$1 := (if p0$1 && !v26$1 then !v26$1 else p6$1);
    p6$2 := (if p0$2 && !v26$2 then !v26$2 else p6$2);
    call {:sourceloc} {:sourceloc_num 28} _LOG_READ_$$inplaceMatrix(p5$1, BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_145"} {:captureState "check_state_145"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_145"} {:sourceloc} {:sourceloc_num 28} _CHECK_READ_$$inplaceMatrix(p5$2, BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v27$1 := (if p5$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v27$1);
    v27$2 := (if p5$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v27$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_READ_$$inplaceMatrix(p5$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_146"} {:captureState "check_state_146"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_146"} {:sourceloc} {:sourceloc_num 29} _CHECK_READ_$$inplaceMatrix(p5$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v28$1 := (if p5$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v28$1);
    v28$2 := (if p5$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v28$2);
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$inplaceMatrix(p5$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_147"} {:captureState "check_state_147"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_147"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$inplaceMatrix(p5$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v29$1 := (if p5$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v29$1);
    v29$2 := (if p5$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v29$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_READ_$$inplaceMatrix(p5$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_148"} {:captureState "check_state_148"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_148"} {:sourceloc} {:sourceloc_num 31} _CHECK_READ_$$inplaceMatrix(p5$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v30$1 := (if p5$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v30$1);
    v30$2 := (if p5$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v30$2);
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$inplaceMatrix(p5$1, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_149"} {:captureState "check_state_149"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_149"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$inplaceMatrix(p5$2, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v31$1 := (if p5$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v31$1);
    v31$2 := (if p5$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v31$2);
    call {:sourceloc} {:sourceloc_num 33} _LOG_READ_$$inplaceMatrix(p5$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_150"} {:captureState "check_state_150"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_150"} {:sourceloc} {:sourceloc_num 33} _CHECK_READ_$$inplaceMatrix(p5$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v32$1 := (if p5$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v32$1);
    v32$2 := (if p5$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v32$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$inplaceMatrix(p5$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_151"} {:captureState "check_state_151"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_151"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$inplaceMatrix(p5$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v33$1 := (if p5$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v33$1);
    v33$2 := (if p5$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v33$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_READ_$$inplaceMatrix(p5$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_152"} {:captureState "check_state_152"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_152"} {:sourceloc} {:sourceloc_num 35} _CHECK_READ_$$inplaceMatrix(p5$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v34$1 := (if p5$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v34$1);
    v34$2 := (if p5$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v34$2);
    v35$1 := (if p5$1 then FDIV64(v29$1, v33$1) else v35$1);
    v35$2 := (if p5$2 then FDIV64(v29$2, v33$2) else v35$2);
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$ratio(p5$1, v2$1, v35$1, $$ratio[1bv1][v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$ratio(p5$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_153"} {:captureState "check_state_153"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_153"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$ratio(p5$2, v2$2, v35$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$ratio"} true;
    $$ratio[1bv1][v2$1] := (if p5$1 then v35$1 else $$ratio[1bv1][v2$1]);
    $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2] := (if p5$2 then v35$2 else $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2]);
    $2$1 := (if p5$1 then v35$1 else $2$1);
    $2$2 := (if p5$2 then v35$2 else $2$2);
    $2$1 := (if p6$1 then 4607182418800017408bv64 else $2$1);
    $2$2 := (if p6$2 then 4607182418800017408bv64 else $2$2);
    v36$1 := (if p0$1 then v4 == 3bv32 else v36$1);
    v36$2 := (if p0$2 then v4 == 3bv32 else v36$2);
    p7$1 := (if p0$1 && v36$1 then v36$1 else p7$1);
    p7$2 := (if p0$2 && v36$2 then v36$2 else p7$2);
    p8$1 := (if p0$1 && !v36$1 then !v36$1 else p8$1);
    p8$2 := (if p0$2 && !v36$2 then !v36$2 else p8$2);
    call {:sourceloc} {:sourceloc_num 40} _LOG_READ_$$inplaceMatrix(p7$1, BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_136"} {:captureState "check_state_136"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_136"} {:sourceloc} {:sourceloc_num 40} _CHECK_READ_$$inplaceMatrix(p7$2, BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v37$1 := (if p7$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v37$1);
    v37$2 := (if p7$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v37$2);
    call {:sourceloc} {:sourceloc_num 41} _LOG_READ_$$inplaceMatrix(p7$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_137"} {:captureState "check_state_137"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_137"} {:sourceloc} {:sourceloc_num 41} _CHECK_READ_$$inplaceMatrix(p7$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v38$1 := (if p7$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v38$1);
    v38$2 := (if p7$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v38$2);
    call {:sourceloc} {:sourceloc_num 42} _LOG_READ_$$inplaceMatrix(p7$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_138"} {:captureState "check_state_138"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_138"} {:sourceloc} {:sourceloc_num 42} _CHECK_READ_$$inplaceMatrix(p7$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v39$1 := (if p7$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v39$1);
    v39$2 := (if p7$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v39$2);
    call {:sourceloc} {:sourceloc_num 43} _LOG_READ_$$inplaceMatrix(p7$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_139"} {:captureState "check_state_139"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_139"} {:sourceloc} {:sourceloc_num 43} _CHECK_READ_$$inplaceMatrix(p7$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v40$1 := (if p7$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v40$1);
    v40$2 := (if p7$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v40$2);
    call {:sourceloc} {:sourceloc_num 44} _LOG_READ_$$inplaceMatrix(p7$1, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_140"} {:captureState "check_state_140"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_140"} {:sourceloc} {:sourceloc_num 44} _CHECK_READ_$$inplaceMatrix(p7$2, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v41$1 := (if p7$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v41$1);
    v41$2 := (if p7$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32)] else v41$2);
    call {:sourceloc} {:sourceloc_num 45} _LOG_READ_$$inplaceMatrix(p7$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_141"} {:captureState "check_state_141"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_141"} {:sourceloc} {:sourceloc_num 45} _CHECK_READ_$$inplaceMatrix(p7$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v42$1 := (if p7$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v42$1);
    v42$2 := (if p7$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 1bv32)] else v42$2);
    call {:sourceloc} {:sourceloc_num 46} _LOG_READ_$$inplaceMatrix(p7$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_142"} {:captureState "check_state_142"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_142"} {:sourceloc} {:sourceloc_num 46} _CHECK_READ_$$inplaceMatrix(p7$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v43$1 := (if p7$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v43$1);
    v43$2 := (if p7$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 2bv32)] else v43$2);
    call {:sourceloc} {:sourceloc_num 47} _LOG_READ_$$inplaceMatrix(p7$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_143"} {:captureState "check_state_143"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_143"} {:sourceloc} {:sourceloc_num 47} _CHECK_READ_$$inplaceMatrix(p7$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v44$1 := (if p7$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v44$1);
    v44$2 := (if p7$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), BV32_SDIV($d, 4bv32)), 4bv32), 3bv32)] else v44$2);
    v45$1 := (if p7$1 then FDIV64(v40$1, v44$1) else v45$1);
    v45$2 := (if p7$2 then FDIV64(v40$2, v44$2) else v45$2);
    call {:sourceloc} {:sourceloc_num 48} _LOG_WRITE_$$ratio(p7$1, v2$1, v45$1, $$ratio[1bv1][v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$ratio(p7$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_144"} {:captureState "check_state_144"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_144"} {:sourceloc} {:sourceloc_num 48} _CHECK_WRITE_$$ratio(p7$2, v2$2, v45$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$ratio"} true;
    $$ratio[1bv1][v2$1] := (if p7$1 then v45$1 else $$ratio[1bv1][v2$1]);
    $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2] := (if p7$2 then v45$2 else $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2]);
    $3$1 := (if p7$1 then v45$1 else $3$1);
    $3$2 := (if p7$2 then v45$2 else $3$2);
    $3$1 := (if p8$1 then 4607182418800017408bv64 else $3$1);
    $3$2 := (if p8$2 then 4607182418800017408bv64 else $3$2);
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 52} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    v46$1 := BV32_SGE(v0$1, BV32_ADD($d, 1bv32));
    v46$2 := BV32_SGE(v0$2, BV32_ADD($d, 1bv32));
    p10$1 := (if v46$1 then v46$1 else p10$1);
    p10$2 := (if v46$2 then v46$2 else p10$2);
    v47$1 := (if p10$1 then BV32_SGT(BV32_MUL(BV32_ADD(v1$1, 1bv32), 4bv32), $d) else v47$1);
    v47$2 := (if p10$2 then BV32_SGT(BV32_MUL(BV32_ADD(v1$2, 1bv32), 4bv32), $d) else v47$2);
    p11$1 := (if p10$1 && v47$1 then v47$1 else p11$1);
    p11$2 := (if p10$2 && v47$2 then v47$2 else p11$2);
    call {:sourceloc} {:sourceloc_num 55} _LOG_READ_$$inplaceMatrix(p11$1, BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 55} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v48$1 := (if p11$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32)] else v48$1);
    v48$2 := (if p11$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32)] else v48$2);
    call {:sourceloc} {:sourceloc_num 56} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 56} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v49$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 1bv32)] else v49$1);
    v49$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 1bv32)] else v49$2);
    call {:sourceloc} {:sourceloc_num 57} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 57} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 57} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v50$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 2bv32)] else v50$1);
    v50$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 2bv32)] else v50$2);
    call {:sourceloc} {:sourceloc_num 58} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 58} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v51$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 3bv32)] else v51$1);
    v51$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 3bv32)] else v51$2);
    call {:sourceloc} {:sourceloc_num 59} _LOG_READ_$$ratio(p11$1, v2$1, $$ratio[1bv1][v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 59} _CHECK_READ_$$ratio(p11$2, v2$2, $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$ratio"} true;
    v52$1 := (if p11$1 then $$ratio[1bv1][v2$1] else v52$1);
    v52$2 := (if p11$2 then $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2] else v52$2);
    call {:sourceloc} {:sourceloc_num 60} _LOG_READ_$$inplaceMatrix(p11$1, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 60} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v53$1 := (if p11$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32)] else v53$1);
    v53$2 := (if p11$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32)] else v53$2);
    call {:sourceloc} {:sourceloc_num 61} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 61} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v54$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 1bv32)] else v54$1);
    v54$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 1bv32)] else v54$2);
    call {:sourceloc} {:sourceloc_num 62} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 62} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v55$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 2bv32)] else v55$1);
    v55$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 2bv32)] else v55$2);
    call {:sourceloc} {:sourceloc_num 63} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 63} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v56$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 3bv32)] else v56$1);
    v56$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 3bv32)] else v56$2);
    v57$1 := (if p11$1 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v52$1), v53$1), v48$1) else v57$1);
    v57$2 := (if p11$2 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v52$2), v53$2), v48$2) else v57$2);
    call {:sourceloc} {:sourceloc_num 64} _LOG_READ_$$inplaceMatrix(p11$1, BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 64} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v58$1 := (if p11$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32)] else v58$1);
    v58$2 := (if p11$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32)] else v58$2);
    call {:sourceloc} {:sourceloc_num 65} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 65} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v59$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 1bv32)] else v59$1);
    v59$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 1bv32)] else v59$2);
    call {:sourceloc} {:sourceloc_num 66} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 66} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 66} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v60$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 2bv32)] else v60$1);
    v60$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 2bv32)] else v60$2);
    call {:sourceloc} {:sourceloc_num 67} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 67} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 67} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v61$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 3bv32)] else v61$1);
    v61$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 3bv32)] else v61$2);
    call {:sourceloc} {:sourceloc_num 68} _LOG_READ_$$ratio(p11$1, v2$1, $$ratio[1bv1][v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 68} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 68} _CHECK_READ_$$ratio(p11$2, v2$2, $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$ratio"} true;
    v62$1 := (if p11$1 then $$ratio[1bv1][v2$1] else v62$1);
    v62$2 := (if p11$2 then $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2] else v62$2);
    call {:sourceloc} {:sourceloc_num 69} _LOG_READ_$$inplaceMatrix(p11$1, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 69} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 69} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v63$1 := (if p11$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32)] else v63$1);
    v63$2 := (if p11$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32)] else v63$2);
    call {:sourceloc} {:sourceloc_num 70} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 70} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 70} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v64$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 1bv32)] else v64$1);
    v64$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 1bv32)] else v64$2);
    call {:sourceloc} {:sourceloc_num 71} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 71} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 71} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v65$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 2bv32)] else v65$1);
    v65$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 2bv32)] else v65$2);
    call {:sourceloc} {:sourceloc_num 72} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 72} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 72} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v66$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 3bv32)] else v66$1);
    v66$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 3bv32)] else v66$2);
    v67$1 := (if p11$1 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v62$1), v64$1), v59$1) else v67$1);
    v67$2 := (if p11$2 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v62$2), v64$2), v59$2) else v67$2);
    call {:sourceloc} {:sourceloc_num 73} _LOG_READ_$$inplaceMatrix(p11$1, BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 73} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 73} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v68$1 := (if p11$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32)] else v68$1);
    v68$2 := (if p11$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32)] else v68$2);
    call {:sourceloc} {:sourceloc_num 74} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 74} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 74} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v69$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 1bv32)] else v69$1);
    v69$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 1bv32)] else v69$2);
    call {:sourceloc} {:sourceloc_num 75} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 75} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 75} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v70$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 2bv32)] else v70$1);
    v70$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 2bv32)] else v70$2);
    call {:sourceloc} {:sourceloc_num 76} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 76} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v71$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 3bv32)] else v71$1);
    v71$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 3bv32)] else v71$2);
    call {:sourceloc} {:sourceloc_num 77} _LOG_READ_$$ratio(p11$1, v2$1, $$ratio[1bv1][v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 77} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 77} _CHECK_READ_$$ratio(p11$2, v2$2, $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$ratio"} true;
    v72$1 := (if p11$1 then $$ratio[1bv1][v2$1] else v72$1);
    v72$2 := (if p11$2 then $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2] else v72$2);
    call {:sourceloc} {:sourceloc_num 78} _LOG_READ_$$inplaceMatrix(p11$1, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 78} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 78} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v73$1 := (if p11$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32)] else v73$1);
    v73$2 := (if p11$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32)] else v73$2);
    call {:sourceloc} {:sourceloc_num 79} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 79} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 79} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v74$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 1bv32)] else v74$1);
    v74$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 1bv32)] else v74$2);
    call {:sourceloc} {:sourceloc_num 80} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 80} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 80} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v75$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 2bv32)] else v75$1);
    v75$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 2bv32)] else v75$2);
    call {:sourceloc} {:sourceloc_num 81} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 81} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 81} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v76$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 3bv32)] else v76$1);
    v76$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 3bv32)] else v76$2);
    v77$1 := (if p11$1 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v72$1), v75$1), v70$1) else v77$1);
    v77$2 := (if p11$2 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v72$2), v75$2), v70$2) else v77$2);
    call {:sourceloc} {:sourceloc_num 82} _LOG_READ_$$inplaceMatrix(p11$1, BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 82} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 82} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v78$1 := (if p11$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32)] else v78$1);
    v78$2 := (if p11$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32)] else v78$2);
    call {:sourceloc} {:sourceloc_num 83} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 83} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 83} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v79$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 1bv32)] else v79$1);
    v79$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 1bv32)] else v79$2);
    call {:sourceloc} {:sourceloc_num 84} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 84} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 84} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v80$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 2bv32)] else v80$1);
    v80$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 2bv32)] else v80$2);
    call {:sourceloc} {:sourceloc_num 85} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 85} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 85} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v81$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$1, v3), v1$1), 4bv32), 3bv32)] else v81$1);
    v81$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v0$2, v3), v1$2), 4bv32), 3bv32)] else v81$2);
    call {:sourceloc} {:sourceloc_num 86} _LOG_READ_$$ratio(p11$1, v2$1, $$ratio[1bv1][v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 86} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 86} _CHECK_READ_$$ratio(p11$2, v2$2, $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$ratio"} true;
    v82$1 := (if p11$1 then $$ratio[1bv1][v2$1] else v82$1);
    v82$2 := (if p11$2 then $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2] else v82$2);
    call {:sourceloc} {:sourceloc_num 87} _LOG_READ_$$inplaceMatrix(p11$1, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 87} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 87} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v83$1 := (if p11$1 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32)] else v83$1);
    v83$2 := (if p11$2 then $$inplaceMatrix[BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32)] else v83$2);
    call {:sourceloc} {:sourceloc_num 88} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 88} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 88} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v84$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 1bv32)] else v84$1);
    v84$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 1bv32)] else v84$2);
    call {:sourceloc} {:sourceloc_num 89} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 89} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 89} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v85$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 2bv32)] else v85$1);
    v85$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 2bv32)] else v85$2);
    call {:sourceloc} {:sourceloc_num 90} _LOG_READ_$$inplaceMatrix(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 90} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 90} _CHECK_READ_$$inplaceMatrix(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v86$1 := (if p11$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$1), 4bv32), 3bv32)] else v86$1);
    v86$2 := (if p11$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL($d, v3), v1$2), 4bv32), 3bv32)] else v86$2);
    v87$1 := (if p11$1 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v82$1), v86$1), v81$1) else v87$1);
    v87$2 := (if p11$2 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v82$2), v86$2), v81$2) else v87$2);
    v88$1 := (if p11$1 then v1$1 == BV32_SDIV($d, 4bv32) else v88$1);
    v88$2 := (if p11$2 then v1$2 == BV32_SDIV($d, 4bv32) else v88$2);
    p12$1 := (if p11$1 && v88$1 then v88$1 else p12$1);
    p12$2 := (if p11$2 && v88$2 then v88$2 else p12$2);
    p21$1 := (if p11$1 && !v88$1 then !v88$1 else p21$1);
    p21$2 := (if p11$2 && !v88$2 then !v88$2 else p21$2);
    v89$1 := (if p12$1 then v4 == 0bv32 else v89$1);
    v89$2 := (if p12$2 then v4 == 0bv32 else v89$2);
    p13$1 := (if p12$1 && v89$1 then v89$1 else p13$1);
    p13$2 := (if p12$2 && v89$2 then v89$2 else p13$2);
    p14$1 := (if p12$1 && !v89$1 then !v89$1 else p14$1);
    p14$2 := (if p12$2 && !v89$2 then !v89$2 else p14$2);
    call {:sourceloc} {:sourceloc_num 93} _LOG_READ_$$ratio(p13$1, v2$1, $$ratio[1bv1][v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_127"} {:captureState "check_state_127"} {:sourceloc} {:sourceloc_num 93} true;
    call {:check_id "check_state_127"} {:sourceloc} {:sourceloc_num 93} _CHECK_READ_$$ratio(p13$2, v2$2, $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$ratio"} true;
    v90$1 := (if p13$1 then $$ratio[1bv1][v2$1] else v90$1);
    v90$2 := (if p13$2 then $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2] else v90$2);
    v91$1 := (if p13$1 then BV32_ADD(BV32_MUL(v0$1, v3), v1$1) else v91$1);
    v91$2 := (if p13$2 then BV32_ADD(BV32_MUL(v0$2, v3), v1$2) else v91$2);
    call {:sourceloc} {:sourceloc_num 94} _LOG_READ_$$LMatrix(p13$1, BV32_MUL(v91$1, 4bv32), $$LMatrix[BV32_MUL(v91$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_128"} {:captureState "check_state_128"} {:sourceloc} {:sourceloc_num 94} true;
    call {:check_id "check_state_128"} {:sourceloc} {:sourceloc_num 94} _CHECK_READ_$$LMatrix(p13$2, BV32_MUL(v91$2, 4bv32), $$LMatrix[BV32_MUL(v91$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v92$1 := (if p13$1 then $$LMatrix[BV32_MUL(v91$1, 4bv32)] else v92$1);
    v92$2 := (if p13$2 then $$LMatrix[BV32_MUL(v91$2, 4bv32)] else v92$2);
    call {:sourceloc} {:sourceloc_num 95} _LOG_READ_$$LMatrix(p13$1, BV32_ADD(BV32_MUL(v91$1, 4bv32), 1bv32), $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_129"} {:captureState "check_state_129"} {:sourceloc} {:sourceloc_num 95} true;
    call {:check_id "check_state_129"} {:sourceloc} {:sourceloc_num 95} _CHECK_READ_$$LMatrix(p13$2, BV32_ADD(BV32_MUL(v91$2, 4bv32), 1bv32), $$LMatrix[BV32_ADD(BV32_MUL(v91$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v93$1 := (if p13$1 then $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 1bv32)] else v93$1);
    v93$2 := (if p13$2 then $$LMatrix[BV32_ADD(BV32_MUL(v91$2, 4bv32), 1bv32)] else v93$2);
    call {:sourceloc} {:sourceloc_num 96} _LOG_READ_$$LMatrix(p13$1, BV32_ADD(BV32_MUL(v91$1, 4bv32), 2bv32), $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_130"} {:captureState "check_state_130"} {:sourceloc} {:sourceloc_num 96} true;
    call {:check_id "check_state_130"} {:sourceloc} {:sourceloc_num 96} _CHECK_READ_$$LMatrix(p13$2, BV32_ADD(BV32_MUL(v91$2, 4bv32), 2bv32), $$LMatrix[BV32_ADD(BV32_MUL(v91$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v94$1 := (if p13$1 then $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 2bv32)] else v94$1);
    v94$2 := (if p13$2 then $$LMatrix[BV32_ADD(BV32_MUL(v91$2, 4bv32), 2bv32)] else v94$2);
    call {:sourceloc} {:sourceloc_num 97} _LOG_READ_$$LMatrix(p13$1, BV32_ADD(BV32_MUL(v91$1, 4bv32), 3bv32), $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_131"} {:captureState "check_state_131"} {:sourceloc} {:sourceloc_num 97} true;
    call {:check_id "check_state_131"} {:sourceloc} {:sourceloc_num 97} _CHECK_READ_$$LMatrix(p13$2, BV32_ADD(BV32_MUL(v91$2, 4bv32), 3bv32), $$LMatrix[BV32_ADD(BV32_MUL(v91$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v95$1 := (if p13$1 then $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 3bv32)] else v95$1);
    v95$2 := (if p13$2 then $$LMatrix[BV32_ADD(BV32_MUL(v91$2, 4bv32), 3bv32)] else v95$2);
    call {:sourceloc} {:sourceloc_num 98} _LOG_WRITE_$$LMatrix(p13$1, BV32_MUL(v91$1, 4bv32), v90$1, $$LMatrix[BV32_MUL(v91$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p13$2, BV32_MUL(v91$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_132"} {:captureState "check_state_132"} {:sourceloc} {:sourceloc_num 98} true;
    call {:check_id "check_state_132"} {:sourceloc} {:sourceloc_num 98} _CHECK_WRITE_$$LMatrix(p13$2, BV32_MUL(v91$2, 4bv32), v90$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_MUL(v91$1, 4bv32)] := (if p13$1 then v90$1 else $$LMatrix[BV32_MUL(v91$1, 4bv32)]);
    $$LMatrix[BV32_MUL(v91$2, 4bv32)] := (if p13$2 then v90$2 else $$LMatrix[BV32_MUL(v91$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 99} _LOG_WRITE_$$LMatrix(p13$1, BV32_ADD(BV32_MUL(v91$1, 4bv32), 1bv32), v93$1, $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p13$2, BV32_ADD(BV32_MUL(v91$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_133"} {:captureState "check_state_133"} {:sourceloc} {:sourceloc_num 99} true;
    call {:check_id "check_state_133"} {:sourceloc} {:sourceloc_num 99} _CHECK_WRITE_$$LMatrix(p13$2, BV32_ADD(BV32_MUL(v91$2, 4bv32), 1bv32), v93$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 1bv32)] := (if p13$1 then v93$1 else $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 1bv32)]);
    $$LMatrix[BV32_ADD(BV32_MUL(v91$2, 4bv32), 1bv32)] := (if p13$2 then v93$2 else $$LMatrix[BV32_ADD(BV32_MUL(v91$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 100} _LOG_WRITE_$$LMatrix(p13$1, BV32_ADD(BV32_MUL(v91$1, 4bv32), 2bv32), v94$1, $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p13$2, BV32_ADD(BV32_MUL(v91$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_134"} {:captureState "check_state_134"} {:sourceloc} {:sourceloc_num 100} true;
    call {:check_id "check_state_134"} {:sourceloc} {:sourceloc_num 100} _CHECK_WRITE_$$LMatrix(p13$2, BV32_ADD(BV32_MUL(v91$2, 4bv32), 2bv32), v94$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 2bv32)] := (if p13$1 then v94$1 else $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 2bv32)]);
    $$LMatrix[BV32_ADD(BV32_MUL(v91$2, 4bv32), 2bv32)] := (if p13$2 then v94$2 else $$LMatrix[BV32_ADD(BV32_MUL(v91$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 101} _LOG_WRITE_$$LMatrix(p13$1, BV32_ADD(BV32_MUL(v91$1, 4bv32), 3bv32), v95$1, $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p13$2, BV32_ADD(BV32_MUL(v91$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_135"} {:captureState "check_state_135"} {:sourceloc} {:sourceloc_num 101} true;
    call {:check_id "check_state_135"} {:sourceloc} {:sourceloc_num 101} _CHECK_WRITE_$$LMatrix(p13$2, BV32_ADD(BV32_MUL(v91$2, 4bv32), 3bv32), v95$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 3bv32)] := (if p13$1 then v95$1 else $$LMatrix[BV32_ADD(BV32_MUL(v91$1, 4bv32), 3bv32)]);
    $$LMatrix[BV32_ADD(BV32_MUL(v91$2, 4bv32), 3bv32)] := (if p13$2 then v95$2 else $$LMatrix[BV32_ADD(BV32_MUL(v91$2, 4bv32), 3bv32)]);
    $4$1 := (if p13$1 then v90$1 else $4$1);
    $4$2 := (if p13$2 then v90$2 else $4$2);
    v96$1 := (if p14$1 then BV32_ADD(BV32_MUL(v0$1, v3), v1$1) else v96$1);
    v96$2 := (if p14$2 then BV32_ADD(BV32_MUL(v0$2, v3), v1$2) else v96$2);
    call {:sourceloc} {:sourceloc_num 103} _LOG_READ_$$inplaceMatrix(p14$1, BV32_MUL(v96$1, 4bv32), $$inplaceMatrix[BV32_MUL(v96$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_68"} {:captureState "check_state_68"} {:sourceloc} {:sourceloc_num 103} true;
    call {:check_id "check_state_68"} {:sourceloc} {:sourceloc_num 103} _CHECK_READ_$$inplaceMatrix(p14$2, BV32_MUL(v96$2, 4bv32), $$inplaceMatrix[BV32_MUL(v96$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v97$1 := (if p14$1 then $$inplaceMatrix[BV32_MUL(v96$1, 4bv32)] else v97$1);
    v97$2 := (if p14$2 then $$inplaceMatrix[BV32_MUL(v96$2, 4bv32)] else v97$2);
    call {:sourceloc} {:sourceloc_num 104} _LOG_READ_$$inplaceMatrix(p14$1, BV32_ADD(BV32_MUL(v96$1, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_69"} {:captureState "check_state_69"} {:sourceloc} {:sourceloc_num 104} true;
    call {:check_id "check_state_69"} {:sourceloc} {:sourceloc_num 104} _CHECK_READ_$$inplaceMatrix(p14$2, BV32_ADD(BV32_MUL(v96$2, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v98$1 := (if p14$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 1bv32)] else v98$1);
    v98$2 := (if p14$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$2, 4bv32), 1bv32)] else v98$2);
    call {:sourceloc} {:sourceloc_num 105} _LOG_READ_$$inplaceMatrix(p14$1, BV32_ADD(BV32_MUL(v96$1, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_70"} {:captureState "check_state_70"} {:sourceloc} {:sourceloc_num 105} true;
    call {:check_id "check_state_70"} {:sourceloc} {:sourceloc_num 105} _CHECK_READ_$$inplaceMatrix(p14$2, BV32_ADD(BV32_MUL(v96$2, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v99$1 := (if p14$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 2bv32)] else v99$1);
    v99$2 := (if p14$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$2, 4bv32), 2bv32)] else v99$2);
    call {:sourceloc} {:sourceloc_num 106} _LOG_READ_$$inplaceMatrix(p14$1, BV32_ADD(BV32_MUL(v96$1, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_71"} {:captureState "check_state_71"} {:sourceloc} {:sourceloc_num 106} true;
    call {:check_id "check_state_71"} {:sourceloc} {:sourceloc_num 106} _CHECK_READ_$$inplaceMatrix(p14$2, BV32_ADD(BV32_MUL(v96$2, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v100$1 := (if p14$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 3bv32)] else v100$1);
    v100$2 := (if p14$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$2, 4bv32), 3bv32)] else v100$2);
    call {:sourceloc} {:sourceloc_num 107} _LOG_WRITE_$$inplaceMatrix(p14$1, BV32_MUL(v96$1, 4bv32), v57$1, $$inplaceMatrix[BV32_MUL(v96$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p14$2, BV32_MUL(v96$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_72"} {:captureState "check_state_72"} {:sourceloc} {:sourceloc_num 107} true;
    call {:check_id "check_state_72"} {:sourceloc} {:sourceloc_num 107} _CHECK_WRITE_$$inplaceMatrix(p14$2, BV32_MUL(v96$2, 4bv32), v57$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_MUL(v96$1, 4bv32)] := (if p14$1 then v57$1 else $$inplaceMatrix[BV32_MUL(v96$1, 4bv32)]);
    $$inplaceMatrix[BV32_MUL(v96$2, 4bv32)] := (if p14$2 then v57$2 else $$inplaceMatrix[BV32_MUL(v96$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 108} _LOG_WRITE_$$inplaceMatrix(p14$1, BV32_ADD(BV32_MUL(v96$1, 4bv32), 1bv32), v98$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p14$2, BV32_ADD(BV32_MUL(v96$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_73"} {:captureState "check_state_73"} {:sourceloc} {:sourceloc_num 108} true;
    call {:check_id "check_state_73"} {:sourceloc} {:sourceloc_num 108} _CHECK_WRITE_$$inplaceMatrix(p14$2, BV32_ADD(BV32_MUL(v96$2, 4bv32), 1bv32), v98$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 1bv32)] := (if p14$1 then v98$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 1bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$2, 4bv32), 1bv32)] := (if p14$2 then v98$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 109} _LOG_WRITE_$$inplaceMatrix(p14$1, BV32_ADD(BV32_MUL(v96$1, 4bv32), 2bv32), v99$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p14$2, BV32_ADD(BV32_MUL(v96$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_74"} {:captureState "check_state_74"} {:sourceloc} {:sourceloc_num 109} true;
    call {:check_id "check_state_74"} {:sourceloc} {:sourceloc_num 109} _CHECK_WRITE_$$inplaceMatrix(p14$2, BV32_ADD(BV32_MUL(v96$2, 4bv32), 2bv32), v99$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 2bv32)] := (if p14$1 then v99$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 2bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$2, 4bv32), 2bv32)] := (if p14$2 then v99$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 110} _LOG_WRITE_$$inplaceMatrix(p14$1, BV32_ADD(BV32_MUL(v96$1, 4bv32), 3bv32), v100$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p14$2, BV32_ADD(BV32_MUL(v96$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_75"} {:captureState "check_state_75"} {:sourceloc} {:sourceloc_num 110} true;
    call {:check_id "check_state_75"} {:sourceloc} {:sourceloc_num 110} _CHECK_WRITE_$$inplaceMatrix(p14$2, BV32_ADD(BV32_MUL(v96$2, 4bv32), 3bv32), v100$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 3bv32)] := (if p14$1 then v100$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$1, 4bv32), 3bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$2, 4bv32), 3bv32)] := (if p14$2 then v100$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v96$2, 4bv32), 3bv32)]);
    $4$1 := (if p14$1 then v57$1 else $4$1);
    $4$2 := (if p14$2 then v57$2 else $4$2);
    v101$1 := (if p12$1 then v4 == 1bv32 else v101$1);
    v101$2 := (if p12$2 then v4 == 1bv32 else v101$2);
    p15$1 := (if p12$1 && v101$1 then v101$1 else p15$1);
    p15$2 := (if p12$2 && v101$2 then v101$2 else p15$2);
    p16$1 := (if p12$1 && !v101$1 then !v101$1 else p16$1);
    p16$2 := (if p12$2 && !v101$2 then !v101$2 else p16$2);
    call {:sourceloc} {:sourceloc_num 113} _LOG_READ_$$ratio(p15$1, v2$1, $$ratio[1bv1][v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_118"} {:captureState "check_state_118"} {:sourceloc} {:sourceloc_num 113} true;
    call {:check_id "check_state_118"} {:sourceloc} {:sourceloc_num 113} _CHECK_READ_$$ratio(p15$2, v2$2, $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$ratio"} true;
    v102$1 := (if p15$1 then $$ratio[1bv1][v2$1] else v102$1);
    v102$2 := (if p15$2 then $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2] else v102$2);
    v103$1 := (if p15$1 then BV32_ADD(BV32_MUL(v0$1, v3), v1$1) else v103$1);
    v103$2 := (if p15$2 then BV32_ADD(BV32_MUL(v0$2, v3), v1$2) else v103$2);
    call {:sourceloc} {:sourceloc_num 114} _LOG_READ_$$LMatrix(p15$1, BV32_MUL(v103$1, 4bv32), $$LMatrix[BV32_MUL(v103$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_119"} {:captureState "check_state_119"} {:sourceloc} {:sourceloc_num 114} true;
    call {:check_id "check_state_119"} {:sourceloc} {:sourceloc_num 114} _CHECK_READ_$$LMatrix(p15$2, BV32_MUL(v103$2, 4bv32), $$LMatrix[BV32_MUL(v103$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v104$1 := (if p15$1 then $$LMatrix[BV32_MUL(v103$1, 4bv32)] else v104$1);
    v104$2 := (if p15$2 then $$LMatrix[BV32_MUL(v103$2, 4bv32)] else v104$2);
    call {:sourceloc} {:sourceloc_num 115} _LOG_READ_$$LMatrix(p15$1, BV32_ADD(BV32_MUL(v103$1, 4bv32), 1bv32), $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_120"} {:captureState "check_state_120"} {:sourceloc} {:sourceloc_num 115} true;
    call {:check_id "check_state_120"} {:sourceloc} {:sourceloc_num 115} _CHECK_READ_$$LMatrix(p15$2, BV32_ADD(BV32_MUL(v103$2, 4bv32), 1bv32), $$LMatrix[BV32_ADD(BV32_MUL(v103$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v105$1 := (if p15$1 then $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 1bv32)] else v105$1);
    v105$2 := (if p15$2 then $$LMatrix[BV32_ADD(BV32_MUL(v103$2, 4bv32), 1bv32)] else v105$2);
    call {:sourceloc} {:sourceloc_num 116} _LOG_READ_$$LMatrix(p15$1, BV32_ADD(BV32_MUL(v103$1, 4bv32), 2bv32), $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_121"} {:captureState "check_state_121"} {:sourceloc} {:sourceloc_num 116} true;
    call {:check_id "check_state_121"} {:sourceloc} {:sourceloc_num 116} _CHECK_READ_$$LMatrix(p15$2, BV32_ADD(BV32_MUL(v103$2, 4bv32), 2bv32), $$LMatrix[BV32_ADD(BV32_MUL(v103$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v106$1 := (if p15$1 then $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 2bv32)] else v106$1);
    v106$2 := (if p15$2 then $$LMatrix[BV32_ADD(BV32_MUL(v103$2, 4bv32), 2bv32)] else v106$2);
    call {:sourceloc} {:sourceloc_num 117} _LOG_READ_$$LMatrix(p15$1, BV32_ADD(BV32_MUL(v103$1, 4bv32), 3bv32), $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_122"} {:captureState "check_state_122"} {:sourceloc} {:sourceloc_num 117} true;
    call {:check_id "check_state_122"} {:sourceloc} {:sourceloc_num 117} _CHECK_READ_$$LMatrix(p15$2, BV32_ADD(BV32_MUL(v103$2, 4bv32), 3bv32), $$LMatrix[BV32_ADD(BV32_MUL(v103$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v107$1 := (if p15$1 then $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 3bv32)] else v107$1);
    v107$2 := (if p15$2 then $$LMatrix[BV32_ADD(BV32_MUL(v103$2, 4bv32), 3bv32)] else v107$2);
    call {:sourceloc} {:sourceloc_num 118} _LOG_WRITE_$$LMatrix(p15$1, BV32_MUL(v103$1, 4bv32), v104$1, $$LMatrix[BV32_MUL(v103$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p15$2, BV32_MUL(v103$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_123"} {:captureState "check_state_123"} {:sourceloc} {:sourceloc_num 118} true;
    call {:check_id "check_state_123"} {:sourceloc} {:sourceloc_num 118} _CHECK_WRITE_$$LMatrix(p15$2, BV32_MUL(v103$2, 4bv32), v104$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_MUL(v103$1, 4bv32)] := (if p15$1 then v104$1 else $$LMatrix[BV32_MUL(v103$1, 4bv32)]);
    $$LMatrix[BV32_MUL(v103$2, 4bv32)] := (if p15$2 then v104$2 else $$LMatrix[BV32_MUL(v103$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 119} _LOG_WRITE_$$LMatrix(p15$1, BV32_ADD(BV32_MUL(v103$1, 4bv32), 1bv32), v102$1, $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p15$2, BV32_ADD(BV32_MUL(v103$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_124"} {:captureState "check_state_124"} {:sourceloc} {:sourceloc_num 119} true;
    call {:check_id "check_state_124"} {:sourceloc} {:sourceloc_num 119} _CHECK_WRITE_$$LMatrix(p15$2, BV32_ADD(BV32_MUL(v103$2, 4bv32), 1bv32), v102$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 1bv32)] := (if p15$1 then v102$1 else $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 1bv32)]);
    $$LMatrix[BV32_ADD(BV32_MUL(v103$2, 4bv32), 1bv32)] := (if p15$2 then v102$2 else $$LMatrix[BV32_ADD(BV32_MUL(v103$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 120} _LOG_WRITE_$$LMatrix(p15$1, BV32_ADD(BV32_MUL(v103$1, 4bv32), 2bv32), v106$1, $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p15$2, BV32_ADD(BV32_MUL(v103$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_125"} {:captureState "check_state_125"} {:sourceloc} {:sourceloc_num 120} true;
    call {:check_id "check_state_125"} {:sourceloc} {:sourceloc_num 120} _CHECK_WRITE_$$LMatrix(p15$2, BV32_ADD(BV32_MUL(v103$2, 4bv32), 2bv32), v106$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 2bv32)] := (if p15$1 then v106$1 else $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 2bv32)]);
    $$LMatrix[BV32_ADD(BV32_MUL(v103$2, 4bv32), 2bv32)] := (if p15$2 then v106$2 else $$LMatrix[BV32_ADD(BV32_MUL(v103$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 121} _LOG_WRITE_$$LMatrix(p15$1, BV32_ADD(BV32_MUL(v103$1, 4bv32), 3bv32), v107$1, $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p15$2, BV32_ADD(BV32_MUL(v103$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_126"} {:captureState "check_state_126"} {:sourceloc} {:sourceloc_num 121} true;
    call {:check_id "check_state_126"} {:sourceloc} {:sourceloc_num 121} _CHECK_WRITE_$$LMatrix(p15$2, BV32_ADD(BV32_MUL(v103$2, 4bv32), 3bv32), v107$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 3bv32)] := (if p15$1 then v107$1 else $$LMatrix[BV32_ADD(BV32_MUL(v103$1, 4bv32), 3bv32)]);
    $$LMatrix[BV32_ADD(BV32_MUL(v103$2, 4bv32), 3bv32)] := (if p15$2 then v107$2 else $$LMatrix[BV32_ADD(BV32_MUL(v103$2, 4bv32), 3bv32)]);
    $5$1 := (if p15$1 then v102$1 else $5$1);
    $5$2 := (if p15$2 then v102$2 else $5$2);
    v108$1 := (if p16$1 then BV32_ADD(BV32_MUL(v0$1, v3), v1$1) else v108$1);
    v108$2 := (if p16$2 then BV32_ADD(BV32_MUL(v0$2, v3), v1$2) else v108$2);
    call {:sourceloc} {:sourceloc_num 123} _LOG_READ_$$inplaceMatrix(p16$1, BV32_MUL(v108$1, 4bv32), $$inplaceMatrix[BV32_MUL(v108$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_76"} {:captureState "check_state_76"} {:sourceloc} {:sourceloc_num 123} true;
    call {:check_id "check_state_76"} {:sourceloc} {:sourceloc_num 123} _CHECK_READ_$$inplaceMatrix(p16$2, BV32_MUL(v108$2, 4bv32), $$inplaceMatrix[BV32_MUL(v108$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v109$1 := (if p16$1 then $$inplaceMatrix[BV32_MUL(v108$1, 4bv32)] else v109$1);
    v109$2 := (if p16$2 then $$inplaceMatrix[BV32_MUL(v108$2, 4bv32)] else v109$2);
    call {:sourceloc} {:sourceloc_num 124} _LOG_READ_$$inplaceMatrix(p16$1, BV32_ADD(BV32_MUL(v108$1, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_77"} {:captureState "check_state_77"} {:sourceloc} {:sourceloc_num 124} true;
    call {:check_id "check_state_77"} {:sourceloc} {:sourceloc_num 124} _CHECK_READ_$$inplaceMatrix(p16$2, BV32_ADD(BV32_MUL(v108$2, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v110$1 := (if p16$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 1bv32)] else v110$1);
    v110$2 := (if p16$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$2, 4bv32), 1bv32)] else v110$2);
    call {:sourceloc} {:sourceloc_num 125} _LOG_READ_$$inplaceMatrix(p16$1, BV32_ADD(BV32_MUL(v108$1, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_78"} {:captureState "check_state_78"} {:sourceloc} {:sourceloc_num 125} true;
    call {:check_id "check_state_78"} {:sourceloc} {:sourceloc_num 125} _CHECK_READ_$$inplaceMatrix(p16$2, BV32_ADD(BV32_MUL(v108$2, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v111$1 := (if p16$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 2bv32)] else v111$1);
    v111$2 := (if p16$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$2, 4bv32), 2bv32)] else v111$2);
    call {:sourceloc} {:sourceloc_num 126} _LOG_READ_$$inplaceMatrix(p16$1, BV32_ADD(BV32_MUL(v108$1, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_79"} {:captureState "check_state_79"} {:sourceloc} {:sourceloc_num 126} true;
    call {:check_id "check_state_79"} {:sourceloc} {:sourceloc_num 126} _CHECK_READ_$$inplaceMatrix(p16$2, BV32_ADD(BV32_MUL(v108$2, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v112$1 := (if p16$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 3bv32)] else v112$1);
    v112$2 := (if p16$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$2, 4bv32), 3bv32)] else v112$2);
    call {:sourceloc} {:sourceloc_num 127} _LOG_WRITE_$$inplaceMatrix(p16$1, BV32_MUL(v108$1, 4bv32), v109$1, $$inplaceMatrix[BV32_MUL(v108$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p16$2, BV32_MUL(v108$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_80"} {:captureState "check_state_80"} {:sourceloc} {:sourceloc_num 127} true;
    call {:check_id "check_state_80"} {:sourceloc} {:sourceloc_num 127} _CHECK_WRITE_$$inplaceMatrix(p16$2, BV32_MUL(v108$2, 4bv32), v109$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_MUL(v108$1, 4bv32)] := (if p16$1 then v109$1 else $$inplaceMatrix[BV32_MUL(v108$1, 4bv32)]);
    $$inplaceMatrix[BV32_MUL(v108$2, 4bv32)] := (if p16$2 then v109$2 else $$inplaceMatrix[BV32_MUL(v108$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 128} _LOG_WRITE_$$inplaceMatrix(p16$1, BV32_ADD(BV32_MUL(v108$1, 4bv32), 1bv32), v67$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p16$2, BV32_ADD(BV32_MUL(v108$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_81"} {:captureState "check_state_81"} {:sourceloc} {:sourceloc_num 128} true;
    call {:check_id "check_state_81"} {:sourceloc} {:sourceloc_num 128} _CHECK_WRITE_$$inplaceMatrix(p16$2, BV32_ADD(BV32_MUL(v108$2, 4bv32), 1bv32), v67$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 1bv32)] := (if p16$1 then v67$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 1bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$2, 4bv32), 1bv32)] := (if p16$2 then v67$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 129} _LOG_WRITE_$$inplaceMatrix(p16$1, BV32_ADD(BV32_MUL(v108$1, 4bv32), 2bv32), v111$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p16$2, BV32_ADD(BV32_MUL(v108$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_82"} {:captureState "check_state_82"} {:sourceloc} {:sourceloc_num 129} true;
    call {:check_id "check_state_82"} {:sourceloc} {:sourceloc_num 129} _CHECK_WRITE_$$inplaceMatrix(p16$2, BV32_ADD(BV32_MUL(v108$2, 4bv32), 2bv32), v111$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 2bv32)] := (if p16$1 then v111$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 2bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$2, 4bv32), 2bv32)] := (if p16$2 then v111$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 130} _LOG_WRITE_$$inplaceMatrix(p16$1, BV32_ADD(BV32_MUL(v108$1, 4bv32), 3bv32), v112$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p16$2, BV32_ADD(BV32_MUL(v108$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_83"} {:captureState "check_state_83"} {:sourceloc} {:sourceloc_num 130} true;
    call {:check_id "check_state_83"} {:sourceloc} {:sourceloc_num 130} _CHECK_WRITE_$$inplaceMatrix(p16$2, BV32_ADD(BV32_MUL(v108$2, 4bv32), 3bv32), v112$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 3bv32)] := (if p16$1 then v112$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$1, 4bv32), 3bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$2, 4bv32), 3bv32)] := (if p16$2 then v112$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v108$2, 4bv32), 3bv32)]);
    $5$1 := (if p16$1 then v67$1 else $5$1);
    $5$2 := (if p16$2 then v67$2 else $5$2);
    v113$1 := (if p12$1 then v4 == 2bv32 else v113$1);
    v113$2 := (if p12$2 then v4 == 2bv32 else v113$2);
    p17$1 := (if p12$1 && v113$1 then v113$1 else p17$1);
    p17$2 := (if p12$2 && v113$2 then v113$2 else p17$2);
    p18$1 := (if p12$1 && !v113$1 then !v113$1 else p18$1);
    p18$2 := (if p12$2 && !v113$2 then !v113$2 else p18$2);
    call {:sourceloc} {:sourceloc_num 133} _LOG_READ_$$ratio(p17$1, v2$1, $$ratio[1bv1][v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_109"} {:captureState "check_state_109"} {:sourceloc} {:sourceloc_num 133} true;
    call {:check_id "check_state_109"} {:sourceloc} {:sourceloc_num 133} _CHECK_READ_$$ratio(p17$2, v2$2, $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$ratio"} true;
    v114$1 := (if p17$1 then $$ratio[1bv1][v2$1] else v114$1);
    v114$2 := (if p17$2 then $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2] else v114$2);
    v115$1 := (if p17$1 then BV32_ADD(BV32_MUL(v0$1, v3), v1$1) else v115$1);
    v115$2 := (if p17$2 then BV32_ADD(BV32_MUL(v0$2, v3), v1$2) else v115$2);
    call {:sourceloc} {:sourceloc_num 134} _LOG_READ_$$LMatrix(p17$1, BV32_MUL(v115$1, 4bv32), $$LMatrix[BV32_MUL(v115$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_110"} {:captureState "check_state_110"} {:sourceloc} {:sourceloc_num 134} true;
    call {:check_id "check_state_110"} {:sourceloc} {:sourceloc_num 134} _CHECK_READ_$$LMatrix(p17$2, BV32_MUL(v115$2, 4bv32), $$LMatrix[BV32_MUL(v115$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v116$1 := (if p17$1 then $$LMatrix[BV32_MUL(v115$1, 4bv32)] else v116$1);
    v116$2 := (if p17$2 then $$LMatrix[BV32_MUL(v115$2, 4bv32)] else v116$2);
    call {:sourceloc} {:sourceloc_num 135} _LOG_READ_$$LMatrix(p17$1, BV32_ADD(BV32_MUL(v115$1, 4bv32), 1bv32), $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_111"} {:captureState "check_state_111"} {:sourceloc} {:sourceloc_num 135} true;
    call {:check_id "check_state_111"} {:sourceloc} {:sourceloc_num 135} _CHECK_READ_$$LMatrix(p17$2, BV32_ADD(BV32_MUL(v115$2, 4bv32), 1bv32), $$LMatrix[BV32_ADD(BV32_MUL(v115$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v117$1 := (if p17$1 then $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 1bv32)] else v117$1);
    v117$2 := (if p17$2 then $$LMatrix[BV32_ADD(BV32_MUL(v115$2, 4bv32), 1bv32)] else v117$2);
    call {:sourceloc} {:sourceloc_num 136} _LOG_READ_$$LMatrix(p17$1, BV32_ADD(BV32_MUL(v115$1, 4bv32), 2bv32), $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_112"} {:captureState "check_state_112"} {:sourceloc} {:sourceloc_num 136} true;
    call {:check_id "check_state_112"} {:sourceloc} {:sourceloc_num 136} _CHECK_READ_$$LMatrix(p17$2, BV32_ADD(BV32_MUL(v115$2, 4bv32), 2bv32), $$LMatrix[BV32_ADD(BV32_MUL(v115$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v118$1 := (if p17$1 then $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 2bv32)] else v118$1);
    v118$2 := (if p17$2 then $$LMatrix[BV32_ADD(BV32_MUL(v115$2, 4bv32), 2bv32)] else v118$2);
    call {:sourceloc} {:sourceloc_num 137} _LOG_READ_$$LMatrix(p17$1, BV32_ADD(BV32_MUL(v115$1, 4bv32), 3bv32), $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_113"} {:captureState "check_state_113"} {:sourceloc} {:sourceloc_num 137} true;
    call {:check_id "check_state_113"} {:sourceloc} {:sourceloc_num 137} _CHECK_READ_$$LMatrix(p17$2, BV32_ADD(BV32_MUL(v115$2, 4bv32), 3bv32), $$LMatrix[BV32_ADD(BV32_MUL(v115$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v119$1 := (if p17$1 then $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 3bv32)] else v119$1);
    v119$2 := (if p17$2 then $$LMatrix[BV32_ADD(BV32_MUL(v115$2, 4bv32), 3bv32)] else v119$2);
    call {:sourceloc} {:sourceloc_num 138} _LOG_WRITE_$$LMatrix(p17$1, BV32_MUL(v115$1, 4bv32), v116$1, $$LMatrix[BV32_MUL(v115$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p17$2, BV32_MUL(v115$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_114"} {:captureState "check_state_114"} {:sourceloc} {:sourceloc_num 138} true;
    call {:check_id "check_state_114"} {:sourceloc} {:sourceloc_num 138} _CHECK_WRITE_$$LMatrix(p17$2, BV32_MUL(v115$2, 4bv32), v116$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_MUL(v115$1, 4bv32)] := (if p17$1 then v116$1 else $$LMatrix[BV32_MUL(v115$1, 4bv32)]);
    $$LMatrix[BV32_MUL(v115$2, 4bv32)] := (if p17$2 then v116$2 else $$LMatrix[BV32_MUL(v115$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 139} _LOG_WRITE_$$LMatrix(p17$1, BV32_ADD(BV32_MUL(v115$1, 4bv32), 1bv32), v117$1, $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p17$2, BV32_ADD(BV32_MUL(v115$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_115"} {:captureState "check_state_115"} {:sourceloc} {:sourceloc_num 139} true;
    call {:check_id "check_state_115"} {:sourceloc} {:sourceloc_num 139} _CHECK_WRITE_$$LMatrix(p17$2, BV32_ADD(BV32_MUL(v115$2, 4bv32), 1bv32), v117$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 1bv32)] := (if p17$1 then v117$1 else $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 1bv32)]);
    $$LMatrix[BV32_ADD(BV32_MUL(v115$2, 4bv32), 1bv32)] := (if p17$2 then v117$2 else $$LMatrix[BV32_ADD(BV32_MUL(v115$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 140} _LOG_WRITE_$$LMatrix(p17$1, BV32_ADD(BV32_MUL(v115$1, 4bv32), 2bv32), v114$1, $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p17$2, BV32_ADD(BV32_MUL(v115$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_116"} {:captureState "check_state_116"} {:sourceloc} {:sourceloc_num 140} true;
    call {:check_id "check_state_116"} {:sourceloc} {:sourceloc_num 140} _CHECK_WRITE_$$LMatrix(p17$2, BV32_ADD(BV32_MUL(v115$2, 4bv32), 2bv32), v114$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 2bv32)] := (if p17$1 then v114$1 else $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 2bv32)]);
    $$LMatrix[BV32_ADD(BV32_MUL(v115$2, 4bv32), 2bv32)] := (if p17$2 then v114$2 else $$LMatrix[BV32_ADD(BV32_MUL(v115$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 141} _LOG_WRITE_$$LMatrix(p17$1, BV32_ADD(BV32_MUL(v115$1, 4bv32), 3bv32), v119$1, $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p17$2, BV32_ADD(BV32_MUL(v115$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_117"} {:captureState "check_state_117"} {:sourceloc} {:sourceloc_num 141} true;
    call {:check_id "check_state_117"} {:sourceloc} {:sourceloc_num 141} _CHECK_WRITE_$$LMatrix(p17$2, BV32_ADD(BV32_MUL(v115$2, 4bv32), 3bv32), v119$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 3bv32)] := (if p17$1 then v119$1 else $$LMatrix[BV32_ADD(BV32_MUL(v115$1, 4bv32), 3bv32)]);
    $$LMatrix[BV32_ADD(BV32_MUL(v115$2, 4bv32), 3bv32)] := (if p17$2 then v119$2 else $$LMatrix[BV32_ADD(BV32_MUL(v115$2, 4bv32), 3bv32)]);
    $6$1 := (if p17$1 then v114$1 else $6$1);
    $6$2 := (if p17$2 then v114$2 else $6$2);
    v120$1 := (if p18$1 then BV32_ADD(BV32_MUL(v0$1, v3), v1$1) else v120$1);
    v120$2 := (if p18$2 then BV32_ADD(BV32_MUL(v0$2, v3), v1$2) else v120$2);
    call {:sourceloc} {:sourceloc_num 143} _LOG_READ_$$inplaceMatrix(p18$1, BV32_MUL(v120$1, 4bv32), $$inplaceMatrix[BV32_MUL(v120$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_84"} {:captureState "check_state_84"} {:sourceloc} {:sourceloc_num 143} true;
    call {:check_id "check_state_84"} {:sourceloc} {:sourceloc_num 143} _CHECK_READ_$$inplaceMatrix(p18$2, BV32_MUL(v120$2, 4bv32), $$inplaceMatrix[BV32_MUL(v120$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v121$1 := (if p18$1 then $$inplaceMatrix[BV32_MUL(v120$1, 4bv32)] else v121$1);
    v121$2 := (if p18$2 then $$inplaceMatrix[BV32_MUL(v120$2, 4bv32)] else v121$2);
    call {:sourceloc} {:sourceloc_num 144} _LOG_READ_$$inplaceMatrix(p18$1, BV32_ADD(BV32_MUL(v120$1, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_85"} {:captureState "check_state_85"} {:sourceloc} {:sourceloc_num 144} true;
    call {:check_id "check_state_85"} {:sourceloc} {:sourceloc_num 144} _CHECK_READ_$$inplaceMatrix(p18$2, BV32_ADD(BV32_MUL(v120$2, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v122$1 := (if p18$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 1bv32)] else v122$1);
    v122$2 := (if p18$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$2, 4bv32), 1bv32)] else v122$2);
    call {:sourceloc} {:sourceloc_num 145} _LOG_READ_$$inplaceMatrix(p18$1, BV32_ADD(BV32_MUL(v120$1, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_86"} {:captureState "check_state_86"} {:sourceloc} {:sourceloc_num 145} true;
    call {:check_id "check_state_86"} {:sourceloc} {:sourceloc_num 145} _CHECK_READ_$$inplaceMatrix(p18$2, BV32_ADD(BV32_MUL(v120$2, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v123$1 := (if p18$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 2bv32)] else v123$1);
    v123$2 := (if p18$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$2, 4bv32), 2bv32)] else v123$2);
    call {:sourceloc} {:sourceloc_num 146} _LOG_READ_$$inplaceMatrix(p18$1, BV32_ADD(BV32_MUL(v120$1, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_87"} {:captureState "check_state_87"} {:sourceloc} {:sourceloc_num 146} true;
    call {:check_id "check_state_87"} {:sourceloc} {:sourceloc_num 146} _CHECK_READ_$$inplaceMatrix(p18$2, BV32_ADD(BV32_MUL(v120$2, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v124$1 := (if p18$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 3bv32)] else v124$1);
    v124$2 := (if p18$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$2, 4bv32), 3bv32)] else v124$2);
    call {:sourceloc} {:sourceloc_num 147} _LOG_WRITE_$$inplaceMatrix(p18$1, BV32_MUL(v120$1, 4bv32), v121$1, $$inplaceMatrix[BV32_MUL(v120$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p18$2, BV32_MUL(v120$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_88"} {:captureState "check_state_88"} {:sourceloc} {:sourceloc_num 147} true;
    call {:check_id "check_state_88"} {:sourceloc} {:sourceloc_num 147} _CHECK_WRITE_$$inplaceMatrix(p18$2, BV32_MUL(v120$2, 4bv32), v121$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_MUL(v120$1, 4bv32)] := (if p18$1 then v121$1 else $$inplaceMatrix[BV32_MUL(v120$1, 4bv32)]);
    $$inplaceMatrix[BV32_MUL(v120$2, 4bv32)] := (if p18$2 then v121$2 else $$inplaceMatrix[BV32_MUL(v120$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 148} _LOG_WRITE_$$inplaceMatrix(p18$1, BV32_ADD(BV32_MUL(v120$1, 4bv32), 1bv32), v122$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p18$2, BV32_ADD(BV32_MUL(v120$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_89"} {:captureState "check_state_89"} {:sourceloc} {:sourceloc_num 148} true;
    call {:check_id "check_state_89"} {:sourceloc} {:sourceloc_num 148} _CHECK_WRITE_$$inplaceMatrix(p18$2, BV32_ADD(BV32_MUL(v120$2, 4bv32), 1bv32), v122$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 1bv32)] := (if p18$1 then v122$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 1bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$2, 4bv32), 1bv32)] := (if p18$2 then v122$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 149} _LOG_WRITE_$$inplaceMatrix(p18$1, BV32_ADD(BV32_MUL(v120$1, 4bv32), 2bv32), v77$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p18$2, BV32_ADD(BV32_MUL(v120$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_90"} {:captureState "check_state_90"} {:sourceloc} {:sourceloc_num 149} true;
    call {:check_id "check_state_90"} {:sourceloc} {:sourceloc_num 149} _CHECK_WRITE_$$inplaceMatrix(p18$2, BV32_ADD(BV32_MUL(v120$2, 4bv32), 2bv32), v77$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 2bv32)] := (if p18$1 then v77$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 2bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$2, 4bv32), 2bv32)] := (if p18$2 then v77$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 150} _LOG_WRITE_$$inplaceMatrix(p18$1, BV32_ADD(BV32_MUL(v120$1, 4bv32), 3bv32), v124$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p18$2, BV32_ADD(BV32_MUL(v120$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_91"} {:captureState "check_state_91"} {:sourceloc} {:sourceloc_num 150} true;
    call {:check_id "check_state_91"} {:sourceloc} {:sourceloc_num 150} _CHECK_WRITE_$$inplaceMatrix(p18$2, BV32_ADD(BV32_MUL(v120$2, 4bv32), 3bv32), v124$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 3bv32)] := (if p18$1 then v124$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$1, 4bv32), 3bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$2, 4bv32), 3bv32)] := (if p18$2 then v124$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v120$2, 4bv32), 3bv32)]);
    $6$1 := (if p18$1 then v77$1 else $6$1);
    $6$2 := (if p18$2 then v77$2 else $6$2);
    v125$1 := (if p12$1 then v4 == 3bv32 else v125$1);
    v125$2 := (if p12$2 then v4 == 3bv32 else v125$2);
    p19$1 := (if p12$1 && v125$1 then v125$1 else p19$1);
    p19$2 := (if p12$2 && v125$2 then v125$2 else p19$2);
    p20$1 := (if p12$1 && !v125$1 then !v125$1 else p20$1);
    p20$2 := (if p12$2 && !v125$2 then !v125$2 else p20$2);
    call {:sourceloc} {:sourceloc_num 153} _LOG_READ_$$ratio(p19$1, v2$1, $$ratio[1bv1][v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_100"} {:captureState "check_state_100"} {:sourceloc} {:sourceloc_num 153} true;
    call {:check_id "check_state_100"} {:sourceloc} {:sourceloc_num 153} _CHECK_READ_$$ratio(p19$2, v2$2, $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$ratio"} true;
    v126$1 := (if p19$1 then $$ratio[1bv1][v2$1] else v126$1);
    v126$2 := (if p19$2 then $$ratio[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2] else v126$2);
    v127$1 := (if p19$1 then BV32_ADD(BV32_MUL(v0$1, v3), v1$1) else v127$1);
    v127$2 := (if p19$2 then BV32_ADD(BV32_MUL(v0$2, v3), v1$2) else v127$2);
    call {:sourceloc} {:sourceloc_num 154} _LOG_READ_$$LMatrix(p19$1, BV32_MUL(v127$1, 4bv32), $$LMatrix[BV32_MUL(v127$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_101"} {:captureState "check_state_101"} {:sourceloc} {:sourceloc_num 154} true;
    call {:check_id "check_state_101"} {:sourceloc} {:sourceloc_num 154} _CHECK_READ_$$LMatrix(p19$2, BV32_MUL(v127$2, 4bv32), $$LMatrix[BV32_MUL(v127$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v128$1 := (if p19$1 then $$LMatrix[BV32_MUL(v127$1, 4bv32)] else v128$1);
    v128$2 := (if p19$2 then $$LMatrix[BV32_MUL(v127$2, 4bv32)] else v128$2);
    call {:sourceloc} {:sourceloc_num 155} _LOG_READ_$$LMatrix(p19$1, BV32_ADD(BV32_MUL(v127$1, 4bv32), 1bv32), $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_102"} {:captureState "check_state_102"} {:sourceloc} {:sourceloc_num 155} true;
    call {:check_id "check_state_102"} {:sourceloc} {:sourceloc_num 155} _CHECK_READ_$$LMatrix(p19$2, BV32_ADD(BV32_MUL(v127$2, 4bv32), 1bv32), $$LMatrix[BV32_ADD(BV32_MUL(v127$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v129$1 := (if p19$1 then $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 1bv32)] else v129$1);
    v129$2 := (if p19$2 then $$LMatrix[BV32_ADD(BV32_MUL(v127$2, 4bv32), 1bv32)] else v129$2);
    call {:sourceloc} {:sourceloc_num 156} _LOG_READ_$$LMatrix(p19$1, BV32_ADD(BV32_MUL(v127$1, 4bv32), 2bv32), $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_103"} {:captureState "check_state_103"} {:sourceloc} {:sourceloc_num 156} true;
    call {:check_id "check_state_103"} {:sourceloc} {:sourceloc_num 156} _CHECK_READ_$$LMatrix(p19$2, BV32_ADD(BV32_MUL(v127$2, 4bv32), 2bv32), $$LMatrix[BV32_ADD(BV32_MUL(v127$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v130$1 := (if p19$1 then $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 2bv32)] else v130$1);
    v130$2 := (if p19$2 then $$LMatrix[BV32_ADD(BV32_MUL(v127$2, 4bv32), 2bv32)] else v130$2);
    call {:sourceloc} {:sourceloc_num 157} _LOG_READ_$$LMatrix(p19$1, BV32_ADD(BV32_MUL(v127$1, 4bv32), 3bv32), $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_104"} {:captureState "check_state_104"} {:sourceloc} {:sourceloc_num 157} true;
    call {:check_id "check_state_104"} {:sourceloc} {:sourceloc_num 157} _CHECK_READ_$$LMatrix(p19$2, BV32_ADD(BV32_MUL(v127$2, 4bv32), 3bv32), $$LMatrix[BV32_ADD(BV32_MUL(v127$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$LMatrix"} true;
    v131$1 := (if p19$1 then $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 3bv32)] else v131$1);
    v131$2 := (if p19$2 then $$LMatrix[BV32_ADD(BV32_MUL(v127$2, 4bv32), 3bv32)] else v131$2);
    call {:sourceloc} {:sourceloc_num 158} _LOG_WRITE_$$LMatrix(p19$1, BV32_MUL(v127$1, 4bv32), v128$1, $$LMatrix[BV32_MUL(v127$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p19$2, BV32_MUL(v127$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_105"} {:captureState "check_state_105"} {:sourceloc} {:sourceloc_num 158} true;
    call {:check_id "check_state_105"} {:sourceloc} {:sourceloc_num 158} _CHECK_WRITE_$$LMatrix(p19$2, BV32_MUL(v127$2, 4bv32), v128$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_MUL(v127$1, 4bv32)] := (if p19$1 then v128$1 else $$LMatrix[BV32_MUL(v127$1, 4bv32)]);
    $$LMatrix[BV32_MUL(v127$2, 4bv32)] := (if p19$2 then v128$2 else $$LMatrix[BV32_MUL(v127$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 159} _LOG_WRITE_$$LMatrix(p19$1, BV32_ADD(BV32_MUL(v127$1, 4bv32), 1bv32), v129$1, $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p19$2, BV32_ADD(BV32_MUL(v127$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_106"} {:captureState "check_state_106"} {:sourceloc} {:sourceloc_num 159} true;
    call {:check_id "check_state_106"} {:sourceloc} {:sourceloc_num 159} _CHECK_WRITE_$$LMatrix(p19$2, BV32_ADD(BV32_MUL(v127$2, 4bv32), 1bv32), v129$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 1bv32)] := (if p19$1 then v129$1 else $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 1bv32)]);
    $$LMatrix[BV32_ADD(BV32_MUL(v127$2, 4bv32), 1bv32)] := (if p19$2 then v129$2 else $$LMatrix[BV32_ADD(BV32_MUL(v127$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 160} _LOG_WRITE_$$LMatrix(p19$1, BV32_ADD(BV32_MUL(v127$1, 4bv32), 2bv32), v130$1, $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p19$2, BV32_ADD(BV32_MUL(v127$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_107"} {:captureState "check_state_107"} {:sourceloc} {:sourceloc_num 160} true;
    call {:check_id "check_state_107"} {:sourceloc} {:sourceloc_num 160} _CHECK_WRITE_$$LMatrix(p19$2, BV32_ADD(BV32_MUL(v127$2, 4bv32), 2bv32), v130$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 2bv32)] := (if p19$1 then v130$1 else $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 2bv32)]);
    $$LMatrix[BV32_ADD(BV32_MUL(v127$2, 4bv32), 2bv32)] := (if p19$2 then v130$2 else $$LMatrix[BV32_ADD(BV32_MUL(v127$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 161} _LOG_WRITE_$$LMatrix(p19$1, BV32_ADD(BV32_MUL(v127$1, 4bv32), 3bv32), v126$1, $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(p19$2, BV32_ADD(BV32_MUL(v127$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_108"} {:captureState "check_state_108"} {:sourceloc} {:sourceloc_num 161} true;
    call {:check_id "check_state_108"} {:sourceloc} {:sourceloc_num 161} _CHECK_WRITE_$$LMatrix(p19$2, BV32_ADD(BV32_MUL(v127$2, 4bv32), 3bv32), v126$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$LMatrix"} true;
    $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 3bv32)] := (if p19$1 then v126$1 else $$LMatrix[BV32_ADD(BV32_MUL(v127$1, 4bv32), 3bv32)]);
    $$LMatrix[BV32_ADD(BV32_MUL(v127$2, 4bv32), 3bv32)] := (if p19$2 then v126$2 else $$LMatrix[BV32_ADD(BV32_MUL(v127$2, 4bv32), 3bv32)]);
    $7$1 := (if p19$1 then v126$1 else $7$1);
    $7$2 := (if p19$2 then v126$2 else $7$2);
    v132$1 := (if p20$1 then BV32_ADD(BV32_MUL(v0$1, v3), v1$1) else v132$1);
    v132$2 := (if p20$2 then BV32_ADD(BV32_MUL(v0$2, v3), v1$2) else v132$2);
    call {:sourceloc} {:sourceloc_num 163} _LOG_READ_$$inplaceMatrix(p20$1, BV32_MUL(v132$1, 4bv32), $$inplaceMatrix[BV32_MUL(v132$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_92"} {:captureState "check_state_92"} {:sourceloc} {:sourceloc_num 163} true;
    call {:check_id "check_state_92"} {:sourceloc} {:sourceloc_num 163} _CHECK_READ_$$inplaceMatrix(p20$2, BV32_MUL(v132$2, 4bv32), $$inplaceMatrix[BV32_MUL(v132$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v133$1 := (if p20$1 then $$inplaceMatrix[BV32_MUL(v132$1, 4bv32)] else v133$1);
    v133$2 := (if p20$2 then $$inplaceMatrix[BV32_MUL(v132$2, 4bv32)] else v133$2);
    call {:sourceloc} {:sourceloc_num 164} _LOG_READ_$$inplaceMatrix(p20$1, BV32_ADD(BV32_MUL(v132$1, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_93"} {:captureState "check_state_93"} {:sourceloc} {:sourceloc_num 164} true;
    call {:check_id "check_state_93"} {:sourceloc} {:sourceloc_num 164} _CHECK_READ_$$inplaceMatrix(p20$2, BV32_ADD(BV32_MUL(v132$2, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v134$1 := (if p20$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 1bv32)] else v134$1);
    v134$2 := (if p20$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$2, 4bv32), 1bv32)] else v134$2);
    call {:sourceloc} {:sourceloc_num 165} _LOG_READ_$$inplaceMatrix(p20$1, BV32_ADD(BV32_MUL(v132$1, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_94"} {:captureState "check_state_94"} {:sourceloc} {:sourceloc_num 165} true;
    call {:check_id "check_state_94"} {:sourceloc} {:sourceloc_num 165} _CHECK_READ_$$inplaceMatrix(p20$2, BV32_ADD(BV32_MUL(v132$2, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v135$1 := (if p20$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 2bv32)] else v135$1);
    v135$2 := (if p20$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$2, 4bv32), 2bv32)] else v135$2);
    call {:sourceloc} {:sourceloc_num 166} _LOG_READ_$$inplaceMatrix(p20$1, BV32_ADD(BV32_MUL(v132$1, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_95"} {:captureState "check_state_95"} {:sourceloc} {:sourceloc_num 166} true;
    call {:check_id "check_state_95"} {:sourceloc} {:sourceloc_num 166} _CHECK_READ_$$inplaceMatrix(p20$2, BV32_ADD(BV32_MUL(v132$2, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v136$1 := (if p20$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 3bv32)] else v136$1);
    v136$2 := (if p20$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$2, 4bv32), 3bv32)] else v136$2);
    call {:sourceloc} {:sourceloc_num 167} _LOG_WRITE_$$inplaceMatrix(p20$1, BV32_MUL(v132$1, 4bv32), v133$1, $$inplaceMatrix[BV32_MUL(v132$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p20$2, BV32_MUL(v132$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_96"} {:captureState "check_state_96"} {:sourceloc} {:sourceloc_num 167} true;
    call {:check_id "check_state_96"} {:sourceloc} {:sourceloc_num 167} _CHECK_WRITE_$$inplaceMatrix(p20$2, BV32_MUL(v132$2, 4bv32), v133$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_MUL(v132$1, 4bv32)] := (if p20$1 then v133$1 else $$inplaceMatrix[BV32_MUL(v132$1, 4bv32)]);
    $$inplaceMatrix[BV32_MUL(v132$2, 4bv32)] := (if p20$2 then v133$2 else $$inplaceMatrix[BV32_MUL(v132$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 168} _LOG_WRITE_$$inplaceMatrix(p20$1, BV32_ADD(BV32_MUL(v132$1, 4bv32), 1bv32), v134$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p20$2, BV32_ADD(BV32_MUL(v132$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_97"} {:captureState "check_state_97"} {:sourceloc} {:sourceloc_num 168} true;
    call {:check_id "check_state_97"} {:sourceloc} {:sourceloc_num 168} _CHECK_WRITE_$$inplaceMatrix(p20$2, BV32_ADD(BV32_MUL(v132$2, 4bv32), 1bv32), v134$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 1bv32)] := (if p20$1 then v134$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 1bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$2, 4bv32), 1bv32)] := (if p20$2 then v134$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 169} _LOG_WRITE_$$inplaceMatrix(p20$1, BV32_ADD(BV32_MUL(v132$1, 4bv32), 2bv32), v135$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p20$2, BV32_ADD(BV32_MUL(v132$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_98"} {:captureState "check_state_98"} {:sourceloc} {:sourceloc_num 169} true;
    call {:check_id "check_state_98"} {:sourceloc} {:sourceloc_num 169} _CHECK_WRITE_$$inplaceMatrix(p20$2, BV32_ADD(BV32_MUL(v132$2, 4bv32), 2bv32), v135$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 2bv32)] := (if p20$1 then v135$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 2bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$2, 4bv32), 2bv32)] := (if p20$2 then v135$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 170} _LOG_WRITE_$$inplaceMatrix(p20$1, BV32_ADD(BV32_MUL(v132$1, 4bv32), 3bv32), v87$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p20$2, BV32_ADD(BV32_MUL(v132$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_99"} {:captureState "check_state_99"} {:sourceloc} {:sourceloc_num 170} true;
    call {:check_id "check_state_99"} {:sourceloc} {:sourceloc_num 170} _CHECK_WRITE_$$inplaceMatrix(p20$2, BV32_ADD(BV32_MUL(v132$2, 4bv32), 3bv32), v87$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 3bv32)] := (if p20$1 then v87$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$1, 4bv32), 3bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$2, 4bv32), 3bv32)] := (if p20$2 then v87$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v132$2, 4bv32), 3bv32)]);
    $7$1 := (if p20$1 then v87$1 else $7$1);
    $7$2 := (if p20$2 then v87$2 else $7$2);
    v137$1 := (if p21$1 then BV32_ADD(BV32_MUL(v0$1, v3), v1$1) else v137$1);
    v137$2 := (if p21$2 then BV32_ADD(BV32_MUL(v0$2, v3), v1$2) else v137$2);
    call {:sourceloc} {:sourceloc_num 173} _LOG_READ_$$inplaceMatrix(p21$1, BV32_MUL(v137$1, 4bv32), $$inplaceMatrix[BV32_MUL(v137$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 173} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 173} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_MUL(v137$2, 4bv32), $$inplaceMatrix[BV32_MUL(v137$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v138$1 := (if p21$1 then $$inplaceMatrix[BV32_MUL(v137$1, 4bv32)] else v138$1);
    v138$2 := (if p21$2 then $$inplaceMatrix[BV32_MUL(v137$2, 4bv32)] else v138$2);
    call {:sourceloc} {:sourceloc_num 174} _LOG_READ_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v137$1, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 174} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 174} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v137$2, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v139$1 := (if p21$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 1bv32)] else v139$1);
    v139$2 := (if p21$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$2, 4bv32), 1bv32)] else v139$2);
    call {:sourceloc} {:sourceloc_num 175} _LOG_READ_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v137$1, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 175} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 175} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v137$2, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v140$1 := (if p21$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 2bv32)] else v140$1);
    v140$2 := (if p21$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$2, 4bv32), 2bv32)] else v140$2);
    call {:sourceloc} {:sourceloc_num 176} _LOG_READ_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v137$1, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 176} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 176} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v137$2, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v141$1 := (if p21$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 3bv32)] else v141$1);
    v141$2 := (if p21$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$2, 4bv32), 3bv32)] else v141$2);
    call {:sourceloc} {:sourceloc_num 177} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_MUL(v137$1, 4bv32), v57$1, $$inplaceMatrix[BV32_MUL(v137$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_MUL(v137$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 177} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 177} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_MUL(v137$2, 4bv32), v57$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_MUL(v137$1, 4bv32)] := (if p21$1 then v57$1 else $$inplaceMatrix[BV32_MUL(v137$1, 4bv32)]);
    $$inplaceMatrix[BV32_MUL(v137$2, 4bv32)] := (if p21$2 then v57$2 else $$inplaceMatrix[BV32_MUL(v137$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 178} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v137$1, 4bv32), 1bv32), v139$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v137$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 178} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 178} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v137$2, 4bv32), 1bv32), v139$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 1bv32)] := (if p21$1 then v139$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 1bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$2, 4bv32), 1bv32)] := (if p21$2 then v139$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 179} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v137$1, 4bv32), 2bv32), v140$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v137$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 179} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 179} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v137$2, 4bv32), 2bv32), v140$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 2bv32)] := (if p21$1 then v140$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 2bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$2, 4bv32), 2bv32)] := (if p21$2 then v140$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 180} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v137$1, 4bv32), 3bv32), v141$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v137$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 180} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 180} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v137$2, 4bv32), 3bv32), v141$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 3bv32)] := (if p21$1 then v141$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$1, 4bv32), 3bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$2, 4bv32), 3bv32)] := (if p21$2 then v141$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v137$2, 4bv32), 3bv32)]);
    v142$1 := (if p21$1 then BV32_ADD(BV32_MUL(v0$1, v3), v1$1) else v142$1);
    v142$2 := (if p21$2 then BV32_ADD(BV32_MUL(v0$2, v3), v1$2) else v142$2);
    call {:sourceloc} {:sourceloc_num 181} _LOG_READ_$$inplaceMatrix(p21$1, BV32_MUL(v142$1, 4bv32), $$inplaceMatrix[BV32_MUL(v142$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 181} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 181} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_MUL(v142$2, 4bv32), $$inplaceMatrix[BV32_MUL(v142$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v143$1 := (if p21$1 then $$inplaceMatrix[BV32_MUL(v142$1, 4bv32)] else v143$1);
    v143$2 := (if p21$2 then $$inplaceMatrix[BV32_MUL(v142$2, 4bv32)] else v143$2);
    call {:sourceloc} {:sourceloc_num 182} _LOG_READ_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v142$1, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 182} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 182} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v142$2, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v144$1 := (if p21$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 1bv32)] else v144$1);
    v144$2 := (if p21$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$2, 4bv32), 1bv32)] else v144$2);
    call {:sourceloc} {:sourceloc_num 183} _LOG_READ_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v142$1, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 183} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 183} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v142$2, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v145$1 := (if p21$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 2bv32)] else v145$1);
    v145$2 := (if p21$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$2, 4bv32), 2bv32)] else v145$2);
    call {:sourceloc} {:sourceloc_num 184} _LOG_READ_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v142$1, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 184} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 184} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v142$2, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v146$1 := (if p21$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 3bv32)] else v146$1);
    v146$2 := (if p21$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$2, 4bv32), 3bv32)] else v146$2);
    call {:sourceloc} {:sourceloc_num 185} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_MUL(v142$1, 4bv32), v143$1, $$inplaceMatrix[BV32_MUL(v142$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_MUL(v142$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 185} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 185} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_MUL(v142$2, 4bv32), v143$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_MUL(v142$1, 4bv32)] := (if p21$1 then v143$1 else $$inplaceMatrix[BV32_MUL(v142$1, 4bv32)]);
    $$inplaceMatrix[BV32_MUL(v142$2, 4bv32)] := (if p21$2 then v143$2 else $$inplaceMatrix[BV32_MUL(v142$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 186} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v142$1, 4bv32), 1bv32), v67$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v142$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 186} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 186} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v142$2, 4bv32), 1bv32), v67$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 1bv32)] := (if p21$1 then v67$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 1bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$2, 4bv32), 1bv32)] := (if p21$2 then v67$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 187} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v142$1, 4bv32), 2bv32), v145$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v142$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 187} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 187} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v142$2, 4bv32), 2bv32), v145$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 2bv32)] := (if p21$1 then v145$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 2bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$2, 4bv32), 2bv32)] := (if p21$2 then v145$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 188} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v142$1, 4bv32), 3bv32), v146$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v142$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 188} true;
    call {:check_id "check_state_51"} {:sourceloc} {:sourceloc_num 188} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v142$2, 4bv32), 3bv32), v146$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 3bv32)] := (if p21$1 then v146$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$1, 4bv32), 3bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$2, 4bv32), 3bv32)] := (if p21$2 then v146$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v142$2, 4bv32), 3bv32)]);
    v147$1 := (if p21$1 then BV32_ADD(BV32_MUL(v0$1, v3), v1$1) else v147$1);
    v147$2 := (if p21$2 then BV32_ADD(BV32_MUL(v0$2, v3), v1$2) else v147$2);
    call {:sourceloc} {:sourceloc_num 189} _LOG_READ_$$inplaceMatrix(p21$1, BV32_MUL(v147$1, 4bv32), $$inplaceMatrix[BV32_MUL(v147$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 189} true;
    call {:check_id "check_state_52"} {:sourceloc} {:sourceloc_num 189} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_MUL(v147$2, 4bv32), $$inplaceMatrix[BV32_MUL(v147$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v148$1 := (if p21$1 then $$inplaceMatrix[BV32_MUL(v147$1, 4bv32)] else v148$1);
    v148$2 := (if p21$2 then $$inplaceMatrix[BV32_MUL(v147$2, 4bv32)] else v148$2);
    call {:sourceloc} {:sourceloc_num 190} _LOG_READ_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v147$1, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 190} true;
    call {:check_id "check_state_53"} {:sourceloc} {:sourceloc_num 190} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v147$2, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v149$1 := (if p21$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 1bv32)] else v149$1);
    v149$2 := (if p21$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$2, 4bv32), 1bv32)] else v149$2);
    call {:sourceloc} {:sourceloc_num 191} _LOG_READ_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v147$1, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 191} true;
    call {:check_id "check_state_54"} {:sourceloc} {:sourceloc_num 191} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v147$2, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v150$1 := (if p21$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 2bv32)] else v150$1);
    v150$2 := (if p21$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$2, 4bv32), 2bv32)] else v150$2);
    call {:sourceloc} {:sourceloc_num 192} _LOG_READ_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v147$1, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 192} true;
    call {:check_id "check_state_55"} {:sourceloc} {:sourceloc_num 192} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v147$2, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v151$1 := (if p21$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 3bv32)] else v151$1);
    v151$2 := (if p21$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$2, 4bv32), 3bv32)] else v151$2);
    call {:sourceloc} {:sourceloc_num 193} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_MUL(v147$1, 4bv32), v148$1, $$inplaceMatrix[BV32_MUL(v147$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_MUL(v147$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_56"} {:captureState "check_state_56"} {:sourceloc} {:sourceloc_num 193} true;
    call {:check_id "check_state_56"} {:sourceloc} {:sourceloc_num 193} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_MUL(v147$2, 4bv32), v148$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_MUL(v147$1, 4bv32)] := (if p21$1 then v148$1 else $$inplaceMatrix[BV32_MUL(v147$1, 4bv32)]);
    $$inplaceMatrix[BV32_MUL(v147$2, 4bv32)] := (if p21$2 then v148$2 else $$inplaceMatrix[BV32_MUL(v147$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 194} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v147$1, 4bv32), 1bv32), v149$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v147$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_57"} {:captureState "check_state_57"} {:sourceloc} {:sourceloc_num 194} true;
    call {:check_id "check_state_57"} {:sourceloc} {:sourceloc_num 194} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v147$2, 4bv32), 1bv32), v149$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 1bv32)] := (if p21$1 then v149$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 1bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$2, 4bv32), 1bv32)] := (if p21$2 then v149$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 195} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v147$1, 4bv32), 2bv32), v77$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v147$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_58"} {:captureState "check_state_58"} {:sourceloc} {:sourceloc_num 195} true;
    call {:check_id "check_state_58"} {:sourceloc} {:sourceloc_num 195} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v147$2, 4bv32), 2bv32), v77$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 2bv32)] := (if p21$1 then v77$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 2bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$2, 4bv32), 2bv32)] := (if p21$2 then v77$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 196} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v147$1, 4bv32), 3bv32), v151$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v147$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_59"} {:captureState "check_state_59"} {:sourceloc} {:sourceloc_num 196} true;
    call {:check_id "check_state_59"} {:sourceloc} {:sourceloc_num 196} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v147$2, 4bv32), 3bv32), v151$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 3bv32)] := (if p21$1 then v151$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$1, 4bv32), 3bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$2, 4bv32), 3bv32)] := (if p21$2 then v151$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v147$2, 4bv32), 3bv32)]);
    v152$1 := (if p21$1 then BV32_ADD(BV32_MUL(v0$1, v3), v1$1) else v152$1);
    v152$2 := (if p21$2 then BV32_ADD(BV32_MUL(v0$2, v3), v1$2) else v152$2);
    call {:sourceloc} {:sourceloc_num 197} _LOG_READ_$$inplaceMatrix(p21$1, BV32_MUL(v152$1, 4bv32), $$inplaceMatrix[BV32_MUL(v152$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_60"} {:captureState "check_state_60"} {:sourceloc} {:sourceloc_num 197} true;
    call {:check_id "check_state_60"} {:sourceloc} {:sourceloc_num 197} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_MUL(v152$2, 4bv32), $$inplaceMatrix[BV32_MUL(v152$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v153$1 := (if p21$1 then $$inplaceMatrix[BV32_MUL(v152$1, 4bv32)] else v153$1);
    v153$2 := (if p21$2 then $$inplaceMatrix[BV32_MUL(v152$2, 4bv32)] else v153$2);
    call {:sourceloc} {:sourceloc_num 198} _LOG_READ_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v152$1, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_61"} {:captureState "check_state_61"} {:sourceloc} {:sourceloc_num 198} true;
    call {:check_id "check_state_61"} {:sourceloc} {:sourceloc_num 198} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v152$2, 4bv32), 1bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v154$1 := (if p21$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 1bv32)] else v154$1);
    v154$2 := (if p21$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$2, 4bv32), 1bv32)] else v154$2);
    call {:sourceloc} {:sourceloc_num 199} _LOG_READ_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v152$1, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_62"} {:captureState "check_state_62"} {:sourceloc} {:sourceloc_num 199} true;
    call {:check_id "check_state_62"} {:sourceloc} {:sourceloc_num 199} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v152$2, 4bv32), 2bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v155$1 := (if p21$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 2bv32)] else v155$1);
    v155$2 := (if p21$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$2, 4bv32), 2bv32)] else v155$2);
    call {:sourceloc} {:sourceloc_num 200} _LOG_READ_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v152$1, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_63"} {:captureState "check_state_63"} {:sourceloc} {:sourceloc_num 200} true;
    call {:check_id "check_state_63"} {:sourceloc} {:sourceloc_num 200} _CHECK_READ_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v152$2, 4bv32), 3bv32), $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$inplaceMatrix"} true;
    v156$1 := (if p21$1 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 3bv32)] else v156$1);
    v156$2 := (if p21$2 then $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$2, 4bv32), 3bv32)] else v156$2);
    call {:sourceloc} {:sourceloc_num 201} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_MUL(v152$1, 4bv32), v153$1, $$inplaceMatrix[BV32_MUL(v152$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_MUL(v152$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_64"} {:captureState "check_state_64"} {:sourceloc} {:sourceloc_num 201} true;
    call {:check_id "check_state_64"} {:sourceloc} {:sourceloc_num 201} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_MUL(v152$2, 4bv32), v153$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_MUL(v152$1, 4bv32)] := (if p21$1 then v153$1 else $$inplaceMatrix[BV32_MUL(v152$1, 4bv32)]);
    $$inplaceMatrix[BV32_MUL(v152$2, 4bv32)] := (if p21$2 then v153$2 else $$inplaceMatrix[BV32_MUL(v152$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 202} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v152$1, 4bv32), 1bv32), v154$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v152$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_65"} {:captureState "check_state_65"} {:sourceloc} {:sourceloc_num 202} true;
    call {:check_id "check_state_65"} {:sourceloc} {:sourceloc_num 202} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v152$2, 4bv32), 1bv32), v154$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 1bv32)] := (if p21$1 then v154$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 1bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$2, 4bv32), 1bv32)] := (if p21$2 then v154$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 203} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v152$1, 4bv32), 2bv32), v155$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v152$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_66"} {:captureState "check_state_66"} {:sourceloc} {:sourceloc_num 203} true;
    call {:check_id "check_state_66"} {:sourceloc} {:sourceloc_num 203} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v152$2, 4bv32), 2bv32), v155$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 2bv32)] := (if p21$1 then v155$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 2bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$2, 4bv32), 2bv32)] := (if p21$2 then v155$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 204} _LOG_WRITE_$$inplaceMatrix(p21$1, BV32_ADD(BV32_MUL(v152$1, 4bv32), 3bv32), v87$1, $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v152$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_67"} {:captureState "check_state_67"} {:sourceloc} {:sourceloc_num 204} true;
    call {:check_id "check_state_67"} {:sourceloc} {:sourceloc_num 204} _CHECK_WRITE_$$inplaceMatrix(p21$2, BV32_ADD(BV32_MUL(v152$2, 4bv32), 3bv32), v87$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$inplaceMatrix"} true;
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 3bv32)] := (if p21$1 then v87$1 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$1, 4bv32), 3bv32)]);
    $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$2, 4bv32), 3bv32)] := (if p21$2 then v87$2 else $$inplaceMatrix[BV32_ADD(BV32_MUL(v152$2, 4bv32), 3bv32)]);
    return;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$ratio, $$LMatrix, $$inplaceMatrix, _TRACKING;



const _WATCHED_VALUE_$$LMatrix: bv64;

procedure {:inline 1} _LOG_READ_$$LMatrix(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$LMatrix;



implementation {:inline 1} _LOG_READ_$$LMatrix(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$LMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LMatrix == _value then true else _READ_HAS_OCCURRED_$$LMatrix);
    return;
}



procedure _CHECK_READ_$$LMatrix(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "LMatrix"} {:array "$$LMatrix"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$LMatrix);
  requires {:source_name "LMatrix"} {:array "$$LMatrix"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$LMatrix: bool;

procedure {:inline 1} _LOG_WRITE_$$LMatrix(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$LMatrix, _WRITE_READ_BENIGN_FLAG_$$LMatrix;



implementation {:inline 1} _LOG_WRITE_$$LMatrix(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$LMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LMatrix == _value then true else _WRITE_HAS_OCCURRED_$$LMatrix);
    _WRITE_READ_BENIGN_FLAG_$$LMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LMatrix == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$LMatrix);
    return;
}



procedure _CHECK_WRITE_$$LMatrix(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "LMatrix"} {:array "$$LMatrix"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LMatrix != _value);
  requires {:source_name "LMatrix"} {:array "$$LMatrix"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$LMatrix != _value);
  requires {:source_name "LMatrix"} {:array "$$LMatrix"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$LMatrix(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$LMatrix;



implementation {:inline 1} _LOG_ATOMIC_$$LMatrix(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$LMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$LMatrix);
    return;
}



procedure _CHECK_ATOMIC_$$LMatrix(_P: bool, _offset: bv32);
  requires {:source_name "LMatrix"} {:array "$$LMatrix"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset);
  requires {:source_name "LMatrix"} {:array "$$LMatrix"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$LMatrix;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$LMatrix(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$LMatrix := (if _P && _WRITE_HAS_OCCURRED_$$LMatrix && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$LMatrix);
    return;
}



const _WATCHED_VALUE_$$inplaceMatrix: bv64;

procedure {:inline 1} _LOG_READ_$$inplaceMatrix(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$inplaceMatrix;



implementation {:inline 1} _LOG_READ_$$inplaceMatrix(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$inplaceMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inplaceMatrix == _value then true else _READ_HAS_OCCURRED_$$inplaceMatrix);
    return;
}



procedure _CHECK_READ_$$inplaceMatrix(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "inplaceMatrix"} {:array "$$inplaceMatrix"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix);
  requires {:source_name "inplaceMatrix"} {:array "$$inplaceMatrix"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix: bool;

procedure {:inline 1} _LOG_WRITE_$$inplaceMatrix(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$inplaceMatrix, _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix;



implementation {:inline 1} _LOG_WRITE_$$inplaceMatrix(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$inplaceMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inplaceMatrix == _value then true else _WRITE_HAS_OCCURRED_$$inplaceMatrix);
    _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inplaceMatrix == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix);
    return;
}



procedure _CHECK_WRITE_$$inplaceMatrix(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "inplaceMatrix"} {:array "$$inplaceMatrix"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inplaceMatrix != _value);
  requires {:source_name "inplaceMatrix"} {:array "$$inplaceMatrix"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inplaceMatrix != _value);
  requires {:source_name "inplaceMatrix"} {:array "$$inplaceMatrix"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$inplaceMatrix(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$inplaceMatrix;



implementation {:inline 1} _LOG_ATOMIC_$$inplaceMatrix(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$inplaceMatrix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$inplaceMatrix);
    return;
}



procedure _CHECK_ATOMIC_$$inplaceMatrix(_P: bool, _offset: bv32);
  requires {:source_name "inplaceMatrix"} {:array "$$inplaceMatrix"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset);
  requires {:source_name "inplaceMatrix"} {:array "$$inplaceMatrix"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$inplaceMatrix(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix := (if _P && _WRITE_HAS_OCCURRED_$$inplaceMatrix && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$inplaceMatrix);
    return;
}



const _WATCHED_VALUE_$$ratio: bv64;

procedure {:inline 1} _LOG_READ_$$ratio(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$ratio;



implementation {:inline 1} _LOG_READ_$$ratio(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$ratio := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ratio == _value then true else _READ_HAS_OCCURRED_$$ratio);
    return;
}



procedure _CHECK_READ_$$ratio(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "ratio"} {:array "$$ratio"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$ratio && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$ratio && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "ratio"} {:array "$$ratio"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$ratio && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$ratio: bool;

procedure {:inline 1} _LOG_WRITE_$$ratio(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$ratio, _WRITE_READ_BENIGN_FLAG_$$ratio;



implementation {:inline 1} _LOG_WRITE_$$ratio(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$ratio := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ratio == _value then true else _WRITE_HAS_OCCURRED_$$ratio);
    _WRITE_READ_BENIGN_FLAG_$$ratio := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ratio == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$ratio);
    return;
}



procedure _CHECK_WRITE_$$ratio(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "ratio"} {:array "$$ratio"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$ratio && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ratio != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "ratio"} {:array "$$ratio"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$ratio && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ratio != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "ratio"} {:array "$$ratio"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$ratio && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$ratio(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$ratio;



implementation {:inline 1} _LOG_ATOMIC_$$ratio(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$ratio := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$ratio);
    return;
}



procedure _CHECK_ATOMIC_$$ratio(_P: bool, _offset: bv32);
  requires {:source_name "ratio"} {:array "$$ratio"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$ratio && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "ratio"} {:array "$$ratio"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$ratio && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$ratio(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$ratio;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$ratio(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$ratio := (if _P && _WRITE_HAS_OCCURRED_$$ratio && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$ratio);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$ratio;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$ratio;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$ratio;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$LMatrix;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$LMatrix;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$LMatrix;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$inplaceMatrix;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$inplaceMatrix;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$inplaceMatrix;
    goto anon5;

  anon5:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$LMatrix;
    goto anon7;

  anon7:
    havoc $$inplaceMatrix;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$ratio;
    goto anon3;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
