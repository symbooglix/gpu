type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$matrixA"} {:global} {:elem_width 8} {:source_name "matrixA"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$matrixA: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$matrixA: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$matrixA: bool;

axiom {:array_info "$$matrixB"} {:global} {:elem_width 8} {:source_name "matrixB"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$matrixB: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$matrixB: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$matrixB: bool;

var {:source_name "matrixC"} {:global} $$matrixC: [bv32]bv8;

axiom {:array_info "$$matrixC"} {:global} {:elem_width 8} {:source_name "matrixC"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$matrixC: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$matrixC: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$matrixC: bool;

var {:source_name "imageSampler"} {:constant} $$imageSampler$1: [bv32]bv32;

var {:source_name "imageSampler"} {:constant} $$imageSampler$2: [bv32]bv32;

axiom {:array_info "$$imageSampler"} {:constant} {:elem_width 32} {:source_name "imageSampler"} {:source_elem_width 32} {:source_dimensions "1"} true;

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

function FADD32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "mmmKernel"} {:kernel} $mmmKernel($widthA: bv32, $widthB: bv32);
  requires $$imageSampler$1[0bv32] == 7bv32;
  requires $$imageSampler$2[0bv32] == 7bv32;
  requires !_READ_HAS_OCCURRED_$$matrixA && !_WRITE_HAS_OCCURRED_$$matrixA && !_ATOMIC_HAS_OCCURRED_$$matrixA;
  requires !_READ_HAS_OCCURRED_$$matrixB && !_WRITE_HAS_OCCURRED_$$matrixB && !_ATOMIC_HAS_OCCURRED_$$matrixB;
  requires !_READ_HAS_OCCURRED_$$matrixC && !_WRITE_HAS_OCCURRED_$$matrixC && !_ATOMIC_HAS_OCCURRED_$$matrixC;
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
  modifies _WRITE_HAS_OCCURRED_$$matrixC, _WRITE_READ_BENIGN_FLAG_$$matrixC, _WRITE_READ_BENIGN_FLAG_$$matrixC;



implementation {:source_name "mmmKernel"} {:kernel} $mmmKernel($widthA: bv32, $widthB: bv32)
{
  var $sum0.0$1: bv128;
  var $sum0.0$2: bv128;
  var $sum1.0$1: bv128;
  var $sum1.0$2: bv128;
  var $sum2.0$1: bv128;
  var $sum2.0$2: bv128;
  var $sum3.0$1: bv128;
  var $sum3.0$2: bv128;
  var $i.0: bv32;
  var $0: bv32;
  var $1: bv32;
  var $2$1: bv32;
  var $2$2: bv32;
  var $3$1: bv32;
  var $3$2: bv32;
  var $4: bv32;
  var $5: bv32;
  var $6$1: bv32;
  var $6$2: bv32;
  var $7$1: bv32;
  var $7$2: bv32;
  var $8: bv32;
  var $9: bv32;
  var $10$1: bv32;
  var $10$2: bv32;
  var $11$1: bv32;
  var $11$2: bv32;
  var $12: bv32;
  var $13: bv32;
  var $14$1: bv32;
  var $14$2: bv32;
  var $15$1: bv32;
  var $15$2: bv32;
  var $16$1: bv32;
  var $16$2: bv32;
  var $17$1: bv32;
  var $17$2: bv32;
  var $18: bv32;
  var $19: bv32;
  var $20$1: bv32;
  var $20$2: bv32;
  var $21$1: bv32;
  var $21$2: bv32;
  var $22: bv32;
  var $23: bv32;
  var $24$1: bv32;
  var $24$2: bv32;
  var $25$1: bv32;
  var $25$2: bv32;
  var $26: bv32;
  var $27: bv32;
  var $28$1: bv32;
  var $28$2: bv32;
  var $29$1: bv32;
  var $29$2: bv32;
  var $30: bv32;
  var $31: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bool;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6: bool;
  var v7: bool;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bool;
  var v9$2: bool;
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
  var v25$1: bv8;
  var v25$2: bv8;
  var v182$1: bv32;
  var v182$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27: bv32;
  var v28$1: bv32;
  var v28$2: bv32;
  var v29: bool;
  var v30: bool;
  var v31$1: bool;
  var v31$2: bool;
  var v32$1: bool;
  var v32$2: bool;
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
  var v190$1: bv32;
  var v190$2: bv32;
  var v49$1: bv32;
  var v49$2: bv32;
  var v50: bv32;
  var v51$1: bv32;
  var v51$2: bv32;
  var v52: bool;
  var v53: bool;
  var v54$1: bool;
  var v54$2: bool;
  var v55$1: bool;
  var v55$2: bool;
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
  var v194$1: bv32;
  var v194$2: bv32;
  var v72$1: bv32;
  var v72$2: bv32;
  var v73: bv32;
  var v74$1: bv32;
  var v74$2: bv32;
  var v75: bool;
  var v76: bool;
  var v77$1: bool;
  var v77$2: bool;
  var v78$1: bool;
  var v78$2: bool;
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
  var v198$1: bv32;
  var v198$2: bv32;
  var v95$1: bv32;
  var v95$2: bv32;
  var v96$1: bool;
  var v96$2: bool;
  var v97$1: bool;
  var v97$2: bool;
  var v98: bool;
  var v99: bool;
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
  var v185$1: bv32;
  var v185$2: bv32;
  var v116$1: bv32;
  var v116$2: bv32;
  var v117: bv32;
  var v118$1: bool;
  var v118$2: bool;
  var v119$1: bool;
  var v119$2: bool;
  var v120: bool;
  var v121: bool;
  var v122$1: bv8;
  var v122$2: bv8;
  var v123$1: bv8;
  var v123$2: bv8;
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
  var v137$1: bv8;
  var v137$2: bv8;
  var v186$1: bv32;
  var v186$2: bv32;
  var v138$1: bv32;
  var v138$2: bv32;
  var v139: bv32;
  var v140$1: bool;
  var v140$2: bool;
  var v141$1: bool;
  var v141$2: bool;
  var v142: bool;
  var v143: bool;
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
  var v157$1: bv8;
  var v157$2: bv8;
  var v158$1: bv8;
  var v158$2: bv8;
  var v159$1: bv8;
  var v159$2: bv8;
  var v187$1: bv32;
  var v187$2: bv32;
  var v160$1: bv32;
  var v160$2: bv32;
  var v161: bv32;
  var v162$1: bool;
  var v162$2: bool;
  var v163$1: bool;
  var v163$2: bool;
  var v164: bool;
  var v165: bool;
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
  var v176$1: bv8;
  var v176$2: bv8;
  var v177$1: bv8;
  var v177$2: bv8;
  var v178$1: bv8;
  var v178$2: bv8;
  var v179$1: bv8;
  var v179$2: bv8;
  var v180$1: bv8;
  var v180$2: bv8;
  var v181$1: bv8;
  var v181$2: bv8;
  var v188$1: bv32;
  var v188$2: bv32;
  var v183$1: bv32;
  var v183$2: bv32;
  var v184$1: bv32;
  var v184$2: bv32;
  var v189$1: bv32;
  var v189$2: bv32;
  var v191$1: bv32;
  var v191$2: bv32;
  var v192$1: bv32;
  var v192$2: bv32;
  var v193$1: bv32;
  var v193$2: bv32;
  var v195$1: bv32;
  var v195$2: bv32;
  var v196$1: bv32;
  var v196$2: bv32;
  var v197$1: bv32;
  var v197$2: bv32;
  var v199$1: bv32;
  var v199$2: bv32;
  var v200$1: bv32;
  var v200$2: bv32;
  var v201$1: bv32;
  var v201$2: bv32;
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


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    $sum0.0$1, $sum1.0$1, $sum2.0$1, $sum3.0$1, $i.0 := 0bv128, 0bv128, 0bv128, 0bv128, 0bv32;
    $sum0.0$2, $sum1.0$2, $sum2.0$2, $sum3.0$2 := 0bv128, 0bv128, 0bv128, 0bv128;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v2 := BV32_ULT($i.0, $widthA);
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
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v2 && !v2;
    call {:sourceloc} {:sourceloc_num 237} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), $sum0.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 237} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 237} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), $sum0.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32)] := $sum0.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32)] := $sum0.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 238} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum0.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 238} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 238} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum0.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum0.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum0.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 239} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum0.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 239} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 239} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum0.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum0.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum0.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 240} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum0.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 240} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 240} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum0.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum0.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum0.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 241} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum0.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 241} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 241} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum0.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum0.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum0.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 242} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum0.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 242} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 242} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum0.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum0.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum0.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 243} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum0.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 243} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 243} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum0.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum0.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum0.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 244} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum0.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 244} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 244} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum0.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum0.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum0.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 245} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum0.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 245} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 245} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum0.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum0.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum0.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 246} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum0.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 246} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 246} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum0.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum0.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum0.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 247} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum0.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 247} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 247} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum0.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum0.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum0.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 248} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum0.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 248} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 248} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum0.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum0.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum0.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 249} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum0.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 249} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 249} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum0.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum0.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum0.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 250} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum0.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 250} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 250} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum0.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum0.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum0.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 251} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum0.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 251} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 251} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum0.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum0.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum0.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 252} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum0.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 252} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 252} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum0.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 4bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum0.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 4bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum0.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 253} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), $sum1.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 253} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 253} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), $sum1.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32)] := $sum1.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32)] := $sum1.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 254} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum1.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 254} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 254} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum1.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum1.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum1.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 255} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum1.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 255} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 255} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum1.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum1.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum1.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 256} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum1.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 256} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 256} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum1.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum1.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum1.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 257} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum1.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 257} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 257} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum1.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum1.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum1.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 258} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum1.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 258} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 258} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum1.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum1.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum1.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 259} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum1.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 259} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 259} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum1.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum1.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum1.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 260} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum1.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 260} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 260} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum1.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum1.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum1.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 261} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum1.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 261} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 261} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum1.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum1.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum1.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 262} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum1.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 262} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 262} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum1.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum1.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum1.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 263} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum1.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 263} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 263} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum1.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum1.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum1.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 264} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum1.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 264} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 264} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum1.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum1.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum1.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 265} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum1.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 265} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 265} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum1.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum1.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum1.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 266} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum1.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 266} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 266} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum1.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum1.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum1.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 267} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum1.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 267} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 267} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum1.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum1.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum1.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 268} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum1.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 268} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 268} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum1.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 1bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum1.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 1bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum1.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 269} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), $sum2.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 269} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 269} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), $sum2.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32)] := $sum2.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32)] := $sum2.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 270} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum2.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 270} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 270} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum2.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum2.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum2.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 271} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum2.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 271} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 271} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum2.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum2.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum2.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 272} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum2.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 272} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 272} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum2.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum2.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum2.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 273} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum2.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 273} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 273} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum2.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum2.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum2.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 274} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum2.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 274} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 274} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum2.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum2.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum2.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 275} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum2.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 275} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 275} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum2.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum2.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum2.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 276} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum2.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 276} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 276} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum2.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum2.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum2.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 277} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum2.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 277} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 277} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum2.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum2.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum2.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 278} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum2.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 278} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 278} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum2.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum2.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum2.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 279} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum2.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 279} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 279} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum2.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum2.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum2.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 280} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum2.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 280} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 280} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum2.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum2.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum2.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 281} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum2.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 281} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 281} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum2.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum2.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum2.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 282} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum2.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 282} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 282} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum2.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum2.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum2.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 283} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum2.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 283} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 283} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum2.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum2.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum2.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 284} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum2.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 284} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 284} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum2.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 2bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum2.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 2bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum2.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 285} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), $sum3.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 285} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 285} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), $sum3.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32)] := $sum3.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32)] := $sum3.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 286} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum3.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 286} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 286} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum3.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum3.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum3.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 287} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum3.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 287} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 287} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum3.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum3.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum3.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 288} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum3.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 288} true;
    call {:check_id "check_state_51"} {:sourceloc} {:sourceloc_num 288} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum3.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum3.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum3.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 289} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum3.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 289} true;
    call {:check_id "check_state_52"} {:sourceloc} {:sourceloc_num 289} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum3.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum3.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum3.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 290} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum3.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 290} true;
    call {:check_id "check_state_53"} {:sourceloc} {:sourceloc_num 290} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum3.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum3.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum3.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 291} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum3.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 291} true;
    call {:check_id "check_state_54"} {:sourceloc} {:sourceloc_num 291} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum3.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum3.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum3.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 292} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum3.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 292} true;
    call {:check_id "check_state_55"} {:sourceloc} {:sourceloc_num 292} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum3.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum3.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum3.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 293} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum3.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_56"} {:captureState "check_state_56"} {:sourceloc} {:sourceloc_num 293} true;
    call {:check_id "check_state_56"} {:sourceloc} {:sourceloc_num 293} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum3.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum3.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum3.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 294} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum3.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_57"} {:captureState "check_state_57"} {:sourceloc} {:sourceloc_num 294} true;
    call {:check_id "check_state_57"} {:sourceloc} {:sourceloc_num 294} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum3.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum3.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum3.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 295} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum3.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_58"} {:captureState "check_state_58"} {:sourceloc} {:sourceloc_num 295} true;
    call {:check_id "check_state_58"} {:sourceloc} {:sourceloc_num 295} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum3.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum3.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum3.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 296} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum3.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_59"} {:captureState "check_state_59"} {:sourceloc} {:sourceloc_num 296} true;
    call {:check_id "check_state_59"} {:sourceloc} {:sourceloc_num 296} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum3.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum3.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum3.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 297} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum3.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_60"} {:captureState "check_state_60"} {:sourceloc} {:sourceloc_num 297} true;
    call {:check_id "check_state_60"} {:sourceloc} {:sourceloc_num 297} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum3.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum3.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum3.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 298} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum3.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_61"} {:captureState "check_state_61"} {:sourceloc} {:sourceloc_num 298} true;
    call {:check_id "check_state_61"} {:sourceloc} {:sourceloc_num 298} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum3.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum3.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum3.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 299} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum3.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_62"} {:captureState "check_state_62"} {:sourceloc} {:sourceloc_num 299} true;
    call {:check_id "check_state_62"} {:sourceloc} {:sourceloc_num 299} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum3.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum3.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum3.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 300} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum3.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_63"} {:captureState "check_state_63"} {:sourceloc} {:sourceloc_num 300} true;
    call {:check_id "check_state_63"} {:sourceloc} {:sourceloc_num 300} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum3.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 4bv32), 3bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum3.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 4bv32), 3bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum3.0$2[128:120];
    return;

  $truebb:
    assume {:partition} v2 && v2;
    v3$1 := $$imageSampler$1[0bv32];
    v3$2 := $$imageSampler$2[0bv32];
    v4 := BV32_SDIV($i.0, 4bv32);
    v5$1 := BV32_SHL(v1$1, 2bv32);
    v5$2 := BV32_SHL(v1$2, 2bv32);
    v6 := BV32_SLT(v4, 0bv32);
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v6 && !v6;
    v7 := BV32_SGE(v4, 32768bv32);
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v7 && !v7;
    $1 := v4;
    goto $7;

  $7:
    $0 := $1;
    goto $8;

  $8:
    v8$1 := BV32_SLT(v5$1, 0bv32);
    v8$2 := BV32_SLT(v5$2, 0bv32);
    p0$1 := (if v8$1 then v8$1 else p0$1);
    p0$2 := (if v8$2 then v8$2 else p0$2);
    p1$1 := (if !v8$1 then !v8$1 else p1$1);
    p1$2 := (if !v8$2 then !v8$2 else p1$2);
    $2$1 := (if p0$1 then 0bv32 else $2$1);
    $2$2 := (if p0$2 then 0bv32 else $2$2);
    v9$1 := (if p1$1 then BV32_SGE(v5$1, 32768bv32) else v9$1);
    v9$2 := (if p1$2 then BV32_SGE(v5$2, 32768bv32) else v9$2);
    p3$1 := (if p1$1 && v9$1 then v9$1 else p3$1);
    p3$2 := (if p1$2 && v9$2 then v9$2 else p3$2);
    p2$1 := (if p1$1 && !v9$1 then !v9$1 else p2$1);
    p2$2 := (if p1$2 && !v9$2 then !v9$2 else p2$2);
    $3$1 := (if p2$1 then v5$1 else $3$1);
    $3$2 := (if p2$2 then v5$2 else $3$2);
    $3$1 := (if p3$1 then 32767bv32 else $3$1);
    $3$2 := (if p3$2 then 32767bv32 else $3$2);
    $2$1 := (if p1$1 then $3$1 else $2$1);
    $2$2 := (if p1$2 then $3$2 else $2$2);
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
    v26$1 := $$imageSampler$1[0bv32];
    v26$2 := $$imageSampler$2[0bv32];
    v27 := BV32_SDIV($i.0, 4bv32);
    v28$1 := BV32_ADD(BV32_SHL(v1$1, 2bv32), 1bv32);
    v28$2 := BV32_ADD(BV32_SHL(v1$2, 2bv32), 1bv32);
    v29 := BV32_SLT(v27, 0bv32);
    goto $truebb4, $falsebb4;

  $falsebb4:
    assume {:partition} !v29 && !v29;
    v30 := BV32_SGE(v27, 32768bv32);
    goto $truebb5, $falsebb5;

  $falsebb5:
    assume {:partition} !v30 && !v30;
    $5 := v27;
    goto $18;

  $18:
    $4 := $5;
    goto $19;

  $19:
    v31$1 := BV32_SLT(v28$1, 0bv32);
    v31$2 := BV32_SLT(v28$2, 0bv32);
    p4$1 := (if v31$1 then v31$1 else p4$1);
    p4$2 := (if v31$2 then v31$2 else p4$2);
    p5$1 := (if !v31$1 then !v31$1 else p5$1);
    p5$2 := (if !v31$2 then !v31$2 else p5$2);
    $6$1 := (if p4$1 then 0bv32 else $6$1);
    $6$2 := (if p4$2 then 0bv32 else $6$2);
    v32$1 := (if p5$1 then BV32_SGE(v28$1, 32768bv32) else v32$1);
    v32$2 := (if p5$2 then BV32_SGE(v28$2, 32768bv32) else v32$2);
    p7$1 := (if p5$1 && v32$1 then v32$1 else p7$1);
    p7$2 := (if p5$2 && v32$2 then v32$2 else p7$2);
    p6$1 := (if p5$1 && !v32$1 then !v32$1 else p6$1);
    p6$2 := (if p5$2 && !v32$2 then !v32$2 else p6$2);
    $7$1 := (if p6$1 then v28$1 else $7$1);
    $7$2 := (if p6$2 then v28$2 else $7$2);
    $7$1 := (if p7$1 then 32767bv32 else $7$1);
    $7$2 := (if p7$2 then 32767bv32 else $7$2);
    $6$1 := (if p5$1 then $7$1 else $6$1);
    $6$2 := (if p5$2 then $7$2 else $6$2);
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
    v49$1 := $$imageSampler$1[0bv32];
    v49$2 := $$imageSampler$2[0bv32];
    v50 := BV32_SDIV($i.0, 4bv32);
    v51$1 := BV32_ADD(BV32_SHL(v1$1, 2bv32), 2bv32);
    v51$2 := BV32_ADD(BV32_SHL(v1$2, 2bv32), 2bv32);
    v52 := BV32_SLT(v50, 0bv32);
    goto $truebb8, $falsebb8;

  $falsebb8:
    assume {:partition} !v52 && !v52;
    v53 := BV32_SGE(v50, 32768bv32);
    goto $truebb9, $falsebb9;

  $falsebb9:
    assume {:partition} !v53 && !v53;
    $9 := v50;
    goto $29;

  $29:
    $8 := $9;
    goto $30;

  $30:
    v54$1 := BV32_SLT(v51$1, 0bv32);
    v54$2 := BV32_SLT(v51$2, 0bv32);
    p8$1 := (if v54$1 then v54$1 else p8$1);
    p8$2 := (if v54$2 then v54$2 else p8$2);
    p9$1 := (if !v54$1 then !v54$1 else p9$1);
    p9$2 := (if !v54$2 then !v54$2 else p9$2);
    $10$1 := (if p8$1 then 0bv32 else $10$1);
    $10$2 := (if p8$2 then 0bv32 else $10$2);
    v55$1 := (if p9$1 then BV32_SGE(v51$1, 32768bv32) else v55$1);
    v55$2 := (if p9$2 then BV32_SGE(v51$2, 32768bv32) else v55$2);
    p11$1 := (if p9$1 && v55$1 then v55$1 else p11$1);
    p11$2 := (if p9$2 && v55$2 then v55$2 else p11$2);
    p10$1 := (if p9$1 && !v55$1 then !v55$1 else p10$1);
    p10$2 := (if p9$2 && !v55$2 then !v55$2 else p10$2);
    $11$1 := (if p10$1 then v51$1 else $11$1);
    $11$2 := (if p10$2 then v51$2 else $11$2);
    $11$1 := (if p11$1 then 32767bv32 else $11$1);
    $11$2 := (if p11$2 then 32767bv32 else $11$2);
    $10$1 := (if p9$1 then $11$1 else $10$1);
    $10$2 := (if p9$2 then $11$2 else $10$2);
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
    v72$1 := $$imageSampler$1[0bv32];
    v72$2 := $$imageSampler$2[0bv32];
    v73 := BV32_SDIV($i.0, 4bv32);
    v74$1 := BV32_ADD(BV32_SHL(v1$1, 2bv32), 3bv32);
    v74$2 := BV32_ADD(BV32_SHL(v1$2, 2bv32), 3bv32);
    v75 := BV32_SLT(v73, 0bv32);
    goto $truebb12, $falsebb12;

  $falsebb12:
    assume {:partition} !v75 && !v75;
    v76 := BV32_SGE(v73, 32768bv32);
    goto $truebb13, $falsebb13;

  $falsebb13:
    assume {:partition} !v76 && !v76;
    $13 := v73;
    goto $40;

  $40:
    $12 := $13;
    goto $41;

  $41:
    v77$1 := BV32_SLT(v74$1, 0bv32);
    v77$2 := BV32_SLT(v74$2, 0bv32);
    p12$1 := (if v77$1 then v77$1 else p12$1);
    p12$2 := (if v77$2 then v77$2 else p12$2);
    p13$1 := (if !v77$1 then !v77$1 else p13$1);
    p13$2 := (if !v77$2 then !v77$2 else p13$2);
    $14$1 := (if p12$1 then 0bv32 else $14$1);
    $14$2 := (if p12$2 then 0bv32 else $14$2);
    v78$1 := (if p13$1 then BV32_SGE(v74$1, 32768bv32) else v78$1);
    v78$2 := (if p13$2 then BV32_SGE(v74$2, 32768bv32) else v78$2);
    p15$1 := (if p13$1 && v78$1 then v78$1 else p15$1);
    p15$2 := (if p13$2 && v78$2 then v78$2 else p15$2);
    p14$1 := (if p13$1 && !v78$1 then !v78$1 else p14$1);
    p14$2 := (if p13$2 && !v78$2 then !v78$2 else p14$2);
    $15$1 := (if p14$1 then v74$1 else $15$1);
    $15$2 := (if p14$2 then v74$2 else $15$2);
    $15$1 := (if p15$1 then 32767bv32 else $15$1);
    $15$2 := (if p15$2 then 32767bv32 else $15$2);
    $14$1 := (if p13$1 then $15$1 else $14$1);
    $14$2 := (if p13$2 then $15$2 else $14$2);
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
    v95$1 := $$imageSampler$1[0bv32];
    v95$2 := $$imageSampler$2[0bv32];
    v96$1 := BV32_SLT(v0$1, 0bv32);
    v96$2 := BV32_SLT(v0$2, 0bv32);
    p16$1 := (if v96$1 then v96$1 else p16$1);
    p16$2 := (if v96$2 then v96$2 else p16$2);
    p17$1 := (if !v96$1 then !v96$1 else p17$1);
    p17$2 := (if !v96$2 then !v96$2 else p17$2);
    $16$1 := (if p16$1 then 0bv32 else $16$1);
    $16$2 := (if p16$2 then 0bv32 else $16$2);
    v97$1 := (if p17$1 then BV32_SGE(v0$1, 32768bv32) else v97$1);
    v97$2 := (if p17$2 then BV32_SGE(v0$2, 32768bv32) else v97$2);
    p19$1 := (if p17$1 && v97$1 then v97$1 else p19$1);
    p19$2 := (if p17$2 && v97$2 then v97$2 else p19$2);
    p18$1 := (if p17$1 && !v97$1 then !v97$1 else p18$1);
    p18$2 := (if p17$2 && !v97$2 then !v97$2 else p18$2);
    $17$1 := (if p18$1 then v0$1 else $17$1);
    $17$2 := (if p18$2 then v0$2 else $17$2);
    $17$1 := (if p19$1 then 32767bv32 else $17$1);
    $17$2 := (if p19$2 then 32767bv32 else $17$2);
    $16$1 := (if p17$1 then $17$1 else $16$1);
    $16$2 := (if p17$2 then $17$2 else $16$2);
    v98 := BV32_SLT($i.0, 0bv32);
    goto $truebb18, $falsebb18;

  $falsebb18:
    assume {:partition} !v98 && !v98;
    v99 := BV32_SGE($i.0, 32768bv32);
    goto $truebb19, $falsebb19;

  $falsebb19:
    assume {:partition} !v99 && !v99;
    $19 := $i.0;
    goto $57;

  $57:
    $18 := $19;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit16;

  $_Z11read_imagefPU3AS1vjDv2_i.exit16:
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
    v116$1 := $$imageSampler$1[0bv32];
    v116$2 := $$imageSampler$2[0bv32];
    v117 := BV32_ADD($i.0, 1bv32);
    v118$1 := BV32_SLT(v0$1, 0bv32);
    v118$2 := BV32_SLT(v0$2, 0bv32);
    p20$1 := (if v118$1 then v118$1 else p20$1);
    p20$2 := (if v118$2 then v118$2 else p20$2);
    p21$1 := (if !v118$1 then !v118$1 else p21$1);
    p21$2 := (if !v118$2 then !v118$2 else p21$2);
    $20$1 := (if p20$1 then 0bv32 else $20$1);
    $20$2 := (if p20$2 then 0bv32 else $20$2);
    v119$1 := (if p21$1 then BV32_SGE(v0$1, 32768bv32) else v119$1);
    v119$2 := (if p21$2 then BV32_SGE(v0$2, 32768bv32) else v119$2);
    p23$1 := (if p21$1 && v119$1 then v119$1 else p23$1);
    p23$2 := (if p21$2 && v119$2 then v119$2 else p23$2);
    p22$1 := (if p21$1 && !v119$1 then !v119$1 else p22$1);
    p22$2 := (if p21$2 && !v119$2 then !v119$2 else p22$2);
    $21$1 := (if p22$1 then v0$1 else $21$1);
    $21$2 := (if p22$2 then v0$2 else $21$2);
    $21$1 := (if p23$1 then 32767bv32 else $21$1);
    $21$2 := (if p23$2 then 32767bv32 else $21$2);
    $20$1 := (if p21$1 then $21$1 else $20$1);
    $20$2 := (if p21$2 then $21$2 else $20$2);
    v120 := BV32_SLT(v117, 0bv32);
    goto $truebb22, $falsebb22;

  $falsebb22:
    assume {:partition} !v120 && !v120;
    v121 := BV32_SGE(v117, 32768bv32);
    goto $truebb23, $falsebb23;

  $falsebb23:
    assume {:partition} !v121 && !v121;
    $23 := v117;
    goto $68;

  $68:
    $22 := $23;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit32;

  $_Z11read_imagefPU3AS1vjDv2_i.exit32:
    havoc v122$1, v122$2;
    havoc v123$1, v123$2;
    havoc v124$1, v124$2;
    havoc v125$1, v125$2;
    havoc v126$1, v126$2;
    havoc v127$1, v127$2;
    havoc v128$1, v128$2;
    havoc v129$1, v129$2;
    havoc v130$1, v130$2;
    havoc v131$1, v131$2;
    havoc v132$1, v132$2;
    havoc v133$1, v133$2;
    havoc v134$1, v134$2;
    havoc v135$1, v135$2;
    havoc v136$1, v136$2;
    havoc v137$1, v137$2;
    v138$1 := $$imageSampler$1[0bv32];
    v138$2 := $$imageSampler$2[0bv32];
    v139 := BV32_ADD($i.0, 2bv32);
    v140$1 := BV32_SLT(v0$1, 0bv32);
    v140$2 := BV32_SLT(v0$2, 0bv32);
    p24$1 := (if v140$1 then v140$1 else p24$1);
    p24$2 := (if v140$2 then v140$2 else p24$2);
    p25$1 := (if !v140$1 then !v140$1 else p25$1);
    p25$2 := (if !v140$2 then !v140$2 else p25$2);
    $24$1 := (if p24$1 then 0bv32 else $24$1);
    $24$2 := (if p24$2 then 0bv32 else $24$2);
    v141$1 := (if p25$1 then BV32_SGE(v0$1, 32768bv32) else v141$1);
    v141$2 := (if p25$2 then BV32_SGE(v0$2, 32768bv32) else v141$2);
    p27$1 := (if p25$1 && v141$1 then v141$1 else p27$1);
    p27$2 := (if p25$2 && v141$2 then v141$2 else p27$2);
    p26$1 := (if p25$1 && !v141$1 then !v141$1 else p26$1);
    p26$2 := (if p25$2 && !v141$2 then !v141$2 else p26$2);
    $25$1 := (if p26$1 then v0$1 else $25$1);
    $25$2 := (if p26$2 then v0$2 else $25$2);
    $25$1 := (if p27$1 then 32767bv32 else $25$1);
    $25$2 := (if p27$2 then 32767bv32 else $25$2);
    $24$1 := (if p25$1 then $25$1 else $24$1);
    $24$2 := (if p25$2 then $25$2 else $24$2);
    v142 := BV32_SLT(v139, 0bv32);
    goto $truebb26, $falsebb26;

  $falsebb26:
    assume {:partition} !v142 && !v142;
    v143 := BV32_SGE(v139, 32768bv32);
    goto $truebb27, $falsebb27;

  $falsebb27:
    assume {:partition} !v143 && !v143;
    $27 := v139;
    goto $79;

  $79:
    $26 := $27;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit28;

  $_Z11read_imagefPU3AS1vjDv2_i.exit28:
    havoc v144$1, v144$2;
    havoc v145$1, v145$2;
    havoc v146$1, v146$2;
    havoc v147$1, v147$2;
    havoc v148$1, v148$2;
    havoc v149$1, v149$2;
    havoc v150$1, v150$2;
    havoc v151$1, v151$2;
    havoc v152$1, v152$2;
    havoc v153$1, v153$2;
    havoc v154$1, v154$2;
    havoc v155$1, v155$2;
    havoc v156$1, v156$2;
    havoc v157$1, v157$2;
    havoc v158$1, v158$2;
    havoc v159$1, v159$2;
    v160$1 := $$imageSampler$1[0bv32];
    v160$2 := $$imageSampler$2[0bv32];
    v161 := BV32_ADD($i.0, 3bv32);
    v162$1 := BV32_SLT(v0$1, 0bv32);
    v162$2 := BV32_SLT(v0$2, 0bv32);
    p28$1 := (if v162$1 then v162$1 else p28$1);
    p28$2 := (if v162$2 then v162$2 else p28$2);
    p29$1 := (if !v162$1 then !v162$1 else p29$1);
    p29$2 := (if !v162$2 then !v162$2 else p29$2);
    $28$1 := (if p28$1 then 0bv32 else $28$1);
    $28$2 := (if p28$2 then 0bv32 else $28$2);
    v163$1 := (if p29$1 then BV32_SGE(v0$1, 32768bv32) else v163$1);
    v163$2 := (if p29$2 then BV32_SGE(v0$2, 32768bv32) else v163$2);
    p31$1 := (if p29$1 && v163$1 then v163$1 else p31$1);
    p31$2 := (if p29$2 && v163$2 then v163$2 else p31$2);
    p30$1 := (if p29$1 && !v163$1 then !v163$1 else p30$1);
    p30$2 := (if p29$2 && !v163$2 then !v163$2 else p30$2);
    $29$1 := (if p30$1 then v0$1 else $29$1);
    $29$2 := (if p30$2 then v0$2 else $29$2);
    $29$1 := (if p31$1 then 32767bv32 else $29$1);
    $29$2 := (if p31$2 then 32767bv32 else $29$2);
    $28$1 := (if p29$1 then $29$1 else $28$1);
    $28$2 := (if p29$2 then $29$2 else $28$2);
    v164 := BV32_SLT(v161, 0bv32);
    goto $truebb30, $falsebb30;

  $falsebb30:
    assume {:partition} !v164 && !v164;
    v165 := BV32_SGE(v161, 32768bv32);
    goto $truebb31, $falsebb31;

  $falsebb31:
    assume {:partition} !v165 && !v165;
    $31 := v161;
    goto $90;

  $90:
    $30 := $31;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit24;

  $_Z11read_imagefPU3AS1vjDv2_i.exit24:
    havoc v166$1, v166$2;
    havoc v167$1, v167$2;
    havoc v168$1, v168$2;
    havoc v169$1, v169$2;
    havoc v170$1, v170$2;
    havoc v171$1, v171$2;
    havoc v172$1, v172$2;
    havoc v173$1, v173$2;
    havoc v174$1, v174$2;
    havoc v175$1, v175$2;
    havoc v176$1, v176$2;
    havoc v177$1, v177$2;
    havoc v178$1, v178$2;
    havoc v179$1, v179$2;
    havoc v180$1, v180$2;
    havoc v181$1, v181$2;
    v182$1 := v25$1 ++ v24$1 ++ v23$1 ++ v22$1;
    v182$2 := v25$2 ++ v24$2 ++ v23$2 ++ v22$2;
    v183$1 := $sum0.0$1[64:32];
    v183$2 := $sum0.0$2[64:32];
    v184$1 := $sum0.0$1[96:64];
    v184$2 := $sum0.0$2[96:64];
    v185$1 := v115$1 ++ v114$1 ++ v113$1 ++ v112$1;
    v185$2 := v115$2 ++ v114$2 ++ v113$2 ++ v112$2;
    v186$1 := v137$1 ++ v136$1 ++ v135$1 ++ v134$1;
    v186$2 := v137$2 ++ v136$2 ++ v135$2 ++ v134$2;
    v187$1 := v159$1 ++ v158$1 ++ v157$1 ++ v156$1;
    v187$2 := v159$2 ++ v158$2 ++ v157$2 ++ v156$2;
    v188$1 := v181$1 ++ v180$1 ++ v179$1 ++ v178$1;
    v188$2 := v181$2 ++ v180$2 ++ v179$2 ++ v178$2;
    v189$1 := $sum0.0$1[128:96];
    v189$2 := $sum0.0$2[128:96];
    v190$1 := v48$1 ++ v47$1 ++ v46$1 ++ v45$1;
    v190$2 := v48$2 ++ v47$2 ++ v46$2 ++ v45$2;
    v191$1 := $sum1.0$1[64:32];
    v191$2 := $sum1.0$2[64:32];
    v192$1 := $sum1.0$1[96:64];
    v192$2 := $sum1.0$2[96:64];
    v193$1 := $sum1.0$1[128:96];
    v193$2 := $sum1.0$2[128:96];
    v194$1 := v71$1 ++ v70$1 ++ v69$1 ++ v68$1;
    v194$2 := v71$2 ++ v70$2 ++ v69$2 ++ v68$2;
    v195$1 := $sum2.0$1[64:32];
    v195$2 := $sum2.0$2[64:32];
    v196$1 := $sum2.0$1[96:64];
    v196$2 := $sum2.0$2[96:64];
    v197$1 := $sum2.0$1[128:96];
    v197$2 := $sum2.0$2[128:96];
    v198$1 := v94$1 ++ v93$1 ++ v92$1 ++ v91$1;
    v198$2 := v94$2 ++ v93$2 ++ v92$2 ++ v91$2;
    v199$1 := $sum3.0$1[64:32];
    v199$2 := $sum3.0$2[64:32];
    v200$1 := $sum3.0$1[96:64];
    v200$2 := $sum3.0$2[96:64];
    v201$1 := $sum3.0$1[128:96];
    v201$2 := $sum3.0$2[128:96];
    $sum0.0$1, $sum1.0$1, $sum2.0$1, $sum3.0$1, $i.0 := FADD32(v189$1, FADD32(FMUL32(v182$1, v188$1), FADD32(FMUL32(v21$1 ++ v20$1 ++ v19$1 ++ v18$1, v187$1), FADD32(FMUL32(v13$1 ++ v12$1 ++ v11$1 ++ v10$1, v185$1), FMUL32(v17$1 ++ v16$1 ++ v15$1 ++ v14$1, v186$1))))) ++ FADD32(v184$1, FADD32(FMUL32(v182$1, v177$1 ++ v176$1 ++ v175$1 ++ v174$1), FADD32(FMUL32(v21$1 ++ v20$1 ++ v19$1 ++ v18$1, v155$1 ++ v154$1 ++ v153$1 ++ v152$1), FADD32(FMUL32(v13$1 ++ v12$1 ++ v11$1 ++ v10$1, v111$1 ++ v110$1 ++ v109$1 ++ v108$1), FMUL32(v17$1 ++ v16$1 ++ v15$1 ++ v14$1, v133$1 ++ v132$1 ++ v131$1 ++ v130$1))))) ++ FADD32(v183$1, FADD32(FMUL32(v182$1, v173$1 ++ v172$1 ++ v171$1 ++ v170$1), FADD32(FMUL32(v21$1 ++ v20$1 ++ v19$1 ++ v18$1, v151$1 ++ v150$1 ++ v149$1 ++ v148$1), FADD32(FMUL32(v13$1 ++ v12$1 ++ v11$1 ++ v10$1, v107$1 ++ v106$1 ++ v105$1 ++ v104$1), FMUL32(v17$1 ++ v16$1 ++ v15$1 ++ v14$1, v129$1 ++ v128$1 ++ v127$1 ++ v126$1))))) ++ FADD32($sum0.0$1[32:0], FADD32(FMUL32(v182$1, v169$1 ++ v168$1 ++ v167$1 ++ v166$1), FADD32(FMUL32(v21$1 ++ v20$1 ++ v19$1 ++ v18$1, v147$1 ++ v146$1 ++ v145$1 ++ v144$1), FADD32(FMUL32(v13$1 ++ v12$1 ++ v11$1 ++ v10$1, v103$1 ++ v102$1 ++ v101$1 ++ v100$1), FMUL32(v17$1 ++ v16$1 ++ v15$1 ++ v14$1, v125$1 ++ v124$1 ++ v123$1 ++ v122$1))))), FADD32(v193$1, FADD32(FMUL32(v190$1, v188$1), FADD32(FMUL32(v44$1 ++ v43$1 ++ v42$1 ++ v41$1, v187$1), FADD32(FMUL32(v36$1 ++ v35$1 ++ v34$1 ++ v33$1, v185$1), FMUL32(v40$1 ++ v39$1 ++ v38$1 ++ v37$1, v186$1))))) ++ FADD32(v192$1, FADD32(FMUL32(v190$1, v177$1 ++ v176$1 ++ v175$1 ++ v174$1), FADD32(FMUL32(v44$1 ++ v43$1 ++ v42$1 ++ v41$1, v155$1 ++ v154$1 ++ v153$1 ++ v152$1), FADD32(FMUL32(v36$1 ++ v35$1 ++ v34$1 ++ v33$1, v111$1 ++ v110$1 ++ v109$1 ++ v108$1), FMUL32(v40$1 ++ v39$1 ++ v38$1 ++ v37$1, v133$1 ++ v132$1 ++ v131$1 ++ v130$1))))) ++ FADD32(v191$1, FADD32(FMUL32(v190$1, v173$1 ++ v172$1 ++ v171$1 ++ v170$1), FADD32(FMUL32(v44$1 ++ v43$1 ++ v42$1 ++ v41$1, v151$1 ++ v150$1 ++ v149$1 ++ v148$1), FADD32(FMUL32(v36$1 ++ v35$1 ++ v34$1 ++ v33$1, v107$1 ++ v106$1 ++ v105$1 ++ v104$1), FMUL32(v40$1 ++ v39$1 ++ v38$1 ++ v37$1, v129$1 ++ v128$1 ++ v127$1 ++ v126$1))))) ++ FADD32($sum1.0$1[32:0], FADD32(FMUL32(v190$1, v169$1 ++ v168$1 ++ v167$1 ++ v166$1), FADD32(FMUL32(v44$1 ++ v43$1 ++ v42$1 ++ v41$1, v147$1 ++ v146$1 ++ v145$1 ++ v144$1), FADD32(FMUL32(v36$1 ++ v35$1 ++ v34$1 ++ v33$1, v103$1 ++ v102$1 ++ v101$1 ++ v100$1), FMUL32(v40$1 ++ v39$1 ++ v38$1 ++ v37$1, v125$1 ++ v124$1 ++ v123$1 ++ v122$1))))), FADD32(v197$1, FADD32(FMUL32(v194$1, v188$1), FADD32(FMUL32(v67$1 ++ v66$1 ++ v65$1 ++ v64$1, v187$1), FADD32(FMUL32(v59$1 ++ v58$1 ++ v57$1 ++ v56$1, v185$1), FMUL32(v63$1 ++ v62$1 ++ v61$1 ++ v60$1, v186$1))))) ++ FADD32(v196$1, FADD32(FMUL32(v194$1, v177$1 ++ v176$1 ++ v175$1 ++ v174$1), FADD32(FMUL32(v67$1 ++ v66$1 ++ v65$1 ++ v64$1, v155$1 ++ v154$1 ++ v153$1 ++ v152$1), FADD32(FMUL32(v59$1 ++ v58$1 ++ v57$1 ++ v56$1, v111$1 ++ v110$1 ++ v109$1 ++ v108$1), FMUL32(v63$1 ++ v62$1 ++ v61$1 ++ v60$1, v133$1 ++ v132$1 ++ v131$1 ++ v130$1))))) ++ FADD32(v195$1, FADD32(FMUL32(v194$1, v173$1 ++ v172$1 ++ v171$1 ++ v170$1), FADD32(FMUL32(v67$1 ++ v66$1 ++ v65$1 ++ v64$1, v151$1 ++ v150$1 ++ v149$1 ++ v148$1), FADD32(FMUL32(v59$1 ++ v58$1 ++ v57$1 ++ v56$1, v107$1 ++ v106$1 ++ v105$1 ++ v104$1), FMUL32(v63$1 ++ v62$1 ++ v61$1 ++ v60$1, v129$1 ++ v128$1 ++ v127$1 ++ v126$1))))) ++ FADD32($sum2.0$1[32:0], FADD32(FMUL32(v194$1, v169$1 ++ v168$1 ++ v167$1 ++ v166$1), FADD32(FMUL32(v67$1 ++ v66$1 ++ v65$1 ++ v64$1, v147$1 ++ v146$1 ++ v145$1 ++ v144$1), FADD32(FMUL32(v59$1 ++ v58$1 ++ v57$1 ++ v56$1, v103$1 ++ v102$1 ++ v101$1 ++ v100$1), FMUL32(v63$1 ++ v62$1 ++ v61$1 ++ v60$1, v125$1 ++ v124$1 ++ v123$1 ++ v122$1))))), FADD32(v201$1, FADD32(FMUL32(v198$1, v188$1), FADD32(FMUL32(v90$1 ++ v89$1 ++ v88$1 ++ v87$1, v187$1), FADD32(FMUL32(v82$1 ++ v81$1 ++ v80$1 ++ v79$1, v185$1), FMUL32(v86$1 ++ v85$1 ++ v84$1 ++ v83$1, v186$1))))) ++ FADD32(v200$1, FADD32(FMUL32(v198$1, v177$1 ++ v176$1 ++ v175$1 ++ v174$1), FADD32(FMUL32(v90$1 ++ v89$1 ++ v88$1 ++ v87$1, v155$1 ++ v154$1 ++ v153$1 ++ v152$1), FADD32(FMUL32(v82$1 ++ v81$1 ++ v80$1 ++ v79$1, v111$1 ++ v110$1 ++ v109$1 ++ v108$1), FMUL32(v86$1 ++ v85$1 ++ v84$1 ++ v83$1, v133$1 ++ v132$1 ++ v131$1 ++ v130$1))))) ++ FADD32(v199$1, FADD32(FMUL32(v198$1, v173$1 ++ v172$1 ++ v171$1 ++ v170$1), FADD32(FMUL32(v90$1 ++ v89$1 ++ v88$1 ++ v87$1, v151$1 ++ v150$1 ++ v149$1 ++ v148$1), FADD32(FMUL32(v82$1 ++ v81$1 ++ v80$1 ++ v79$1, v107$1 ++ v106$1 ++ v105$1 ++ v104$1), FMUL32(v86$1 ++ v85$1 ++ v84$1 ++ v83$1, v129$1 ++ v128$1 ++ v127$1 ++ v126$1))))) ++ FADD32($sum3.0$1[32:0], FADD32(FMUL32(v198$1, v169$1 ++ v168$1 ++ v167$1 ++ v166$1), FADD32(FMUL32(v90$1 ++ v89$1 ++ v88$1 ++ v87$1, v147$1 ++ v146$1 ++ v145$1 ++ v144$1), FADD32(FMUL32(v82$1 ++ v81$1 ++ v80$1 ++ v79$1, v103$1 ++ v102$1 ++ v101$1 ++ v100$1), FMUL32(v86$1 ++ v85$1 ++ v84$1 ++ v83$1, v125$1 ++ v124$1 ++ v123$1 ++ v122$1))))), BV32_ADD($i.0, 4bv32);
    $sum0.0$2, $sum1.0$2, $sum2.0$2, $sum3.0$2 := FADD32(v189$2, FADD32(FMUL32(v182$2, v188$2), FADD32(FMUL32(v21$2 ++ v20$2 ++ v19$2 ++ v18$2, v187$2), FADD32(FMUL32(v13$2 ++ v12$2 ++ v11$2 ++ v10$2, v185$2), FMUL32(v17$2 ++ v16$2 ++ v15$2 ++ v14$2, v186$2))))) ++ FADD32(v184$2, FADD32(FMUL32(v182$2, v177$2 ++ v176$2 ++ v175$2 ++ v174$2), FADD32(FMUL32(v21$2 ++ v20$2 ++ v19$2 ++ v18$2, v155$2 ++ v154$2 ++ v153$2 ++ v152$2), FADD32(FMUL32(v13$2 ++ v12$2 ++ v11$2 ++ v10$2, v111$2 ++ v110$2 ++ v109$2 ++ v108$2), FMUL32(v17$2 ++ v16$2 ++ v15$2 ++ v14$2, v133$2 ++ v132$2 ++ v131$2 ++ v130$2))))) ++ FADD32(v183$2, FADD32(FMUL32(v182$2, v173$2 ++ v172$2 ++ v171$2 ++ v170$2), FADD32(FMUL32(v21$2 ++ v20$2 ++ v19$2 ++ v18$2, v151$2 ++ v150$2 ++ v149$2 ++ v148$2), FADD32(FMUL32(v13$2 ++ v12$2 ++ v11$2 ++ v10$2, v107$2 ++ v106$2 ++ v105$2 ++ v104$2), FMUL32(v17$2 ++ v16$2 ++ v15$2 ++ v14$2, v129$2 ++ v128$2 ++ v127$2 ++ v126$2))))) ++ FADD32($sum0.0$2[32:0], FADD32(FMUL32(v182$2, v169$2 ++ v168$2 ++ v167$2 ++ v166$2), FADD32(FMUL32(v21$2 ++ v20$2 ++ v19$2 ++ v18$2, v147$2 ++ v146$2 ++ v145$2 ++ v144$2), FADD32(FMUL32(v13$2 ++ v12$2 ++ v11$2 ++ v10$2, v103$2 ++ v102$2 ++ v101$2 ++ v100$2), FMUL32(v17$2 ++ v16$2 ++ v15$2 ++ v14$2, v125$2 ++ v124$2 ++ v123$2 ++ v122$2))))), FADD32(v193$2, FADD32(FMUL32(v190$2, v188$2), FADD32(FMUL32(v44$2 ++ v43$2 ++ v42$2 ++ v41$2, v187$2), FADD32(FMUL32(v36$2 ++ v35$2 ++ v34$2 ++ v33$2, v185$2), FMUL32(v40$2 ++ v39$2 ++ v38$2 ++ v37$2, v186$2))))) ++ FADD32(v192$2, FADD32(FMUL32(v190$2, v177$2 ++ v176$2 ++ v175$2 ++ v174$2), FADD32(FMUL32(v44$2 ++ v43$2 ++ v42$2 ++ v41$2, v155$2 ++ v154$2 ++ v153$2 ++ v152$2), FADD32(FMUL32(v36$2 ++ v35$2 ++ v34$2 ++ v33$2, v111$2 ++ v110$2 ++ v109$2 ++ v108$2), FMUL32(v40$2 ++ v39$2 ++ v38$2 ++ v37$2, v133$2 ++ v132$2 ++ v131$2 ++ v130$2))))) ++ FADD32(v191$2, FADD32(FMUL32(v190$2, v173$2 ++ v172$2 ++ v171$2 ++ v170$2), FADD32(FMUL32(v44$2 ++ v43$2 ++ v42$2 ++ v41$2, v151$2 ++ v150$2 ++ v149$2 ++ v148$2), FADD32(FMUL32(v36$2 ++ v35$2 ++ v34$2 ++ v33$2, v107$2 ++ v106$2 ++ v105$2 ++ v104$2), FMUL32(v40$2 ++ v39$2 ++ v38$2 ++ v37$2, v129$2 ++ v128$2 ++ v127$2 ++ v126$2))))) ++ FADD32($sum1.0$2[32:0], FADD32(FMUL32(v190$2, v169$2 ++ v168$2 ++ v167$2 ++ v166$2), FADD32(FMUL32(v44$2 ++ v43$2 ++ v42$2 ++ v41$2, v147$2 ++ v146$2 ++ v145$2 ++ v144$2), FADD32(FMUL32(v36$2 ++ v35$2 ++ v34$2 ++ v33$2, v103$2 ++ v102$2 ++ v101$2 ++ v100$2), FMUL32(v40$2 ++ v39$2 ++ v38$2 ++ v37$2, v125$2 ++ v124$2 ++ v123$2 ++ v122$2))))), FADD32(v197$2, FADD32(FMUL32(v194$2, v188$2), FADD32(FMUL32(v67$2 ++ v66$2 ++ v65$2 ++ v64$2, v187$2), FADD32(FMUL32(v59$2 ++ v58$2 ++ v57$2 ++ v56$2, v185$2), FMUL32(v63$2 ++ v62$2 ++ v61$2 ++ v60$2, v186$2))))) ++ FADD32(v196$2, FADD32(FMUL32(v194$2, v177$2 ++ v176$2 ++ v175$2 ++ v174$2), FADD32(FMUL32(v67$2 ++ v66$2 ++ v65$2 ++ v64$2, v155$2 ++ v154$2 ++ v153$2 ++ v152$2), FADD32(FMUL32(v59$2 ++ v58$2 ++ v57$2 ++ v56$2, v111$2 ++ v110$2 ++ v109$2 ++ v108$2), FMUL32(v63$2 ++ v62$2 ++ v61$2 ++ v60$2, v133$2 ++ v132$2 ++ v131$2 ++ v130$2))))) ++ FADD32(v195$2, FADD32(FMUL32(v194$2, v173$2 ++ v172$2 ++ v171$2 ++ v170$2), FADD32(FMUL32(v67$2 ++ v66$2 ++ v65$2 ++ v64$2, v151$2 ++ v150$2 ++ v149$2 ++ v148$2), FADD32(FMUL32(v59$2 ++ v58$2 ++ v57$2 ++ v56$2, v107$2 ++ v106$2 ++ v105$2 ++ v104$2), FMUL32(v63$2 ++ v62$2 ++ v61$2 ++ v60$2, v129$2 ++ v128$2 ++ v127$2 ++ v126$2))))) ++ FADD32($sum2.0$2[32:0], FADD32(FMUL32(v194$2, v169$2 ++ v168$2 ++ v167$2 ++ v166$2), FADD32(FMUL32(v67$2 ++ v66$2 ++ v65$2 ++ v64$2, v147$2 ++ v146$2 ++ v145$2 ++ v144$2), FADD32(FMUL32(v59$2 ++ v58$2 ++ v57$2 ++ v56$2, v103$2 ++ v102$2 ++ v101$2 ++ v100$2), FMUL32(v63$2 ++ v62$2 ++ v61$2 ++ v60$2, v125$2 ++ v124$2 ++ v123$2 ++ v122$2))))), FADD32(v201$2, FADD32(FMUL32(v198$2, v188$2), FADD32(FMUL32(v90$2 ++ v89$2 ++ v88$2 ++ v87$2, v187$2), FADD32(FMUL32(v82$2 ++ v81$2 ++ v80$2 ++ v79$2, v185$2), FMUL32(v86$2 ++ v85$2 ++ v84$2 ++ v83$2, v186$2))))) ++ FADD32(v200$2, FADD32(FMUL32(v198$2, v177$2 ++ v176$2 ++ v175$2 ++ v174$2), FADD32(FMUL32(v90$2 ++ v89$2 ++ v88$2 ++ v87$2, v155$2 ++ v154$2 ++ v153$2 ++ v152$2), FADD32(FMUL32(v82$2 ++ v81$2 ++ v80$2 ++ v79$2, v111$2 ++ v110$2 ++ v109$2 ++ v108$2), FMUL32(v86$2 ++ v85$2 ++ v84$2 ++ v83$2, v133$2 ++ v132$2 ++ v131$2 ++ v130$2))))) ++ FADD32(v199$2, FADD32(FMUL32(v198$2, v173$2 ++ v172$2 ++ v171$2 ++ v170$2), FADD32(FMUL32(v90$2 ++ v89$2 ++ v88$2 ++ v87$2, v151$2 ++ v150$2 ++ v149$2 ++ v148$2), FADD32(FMUL32(v82$2 ++ v81$2 ++ v80$2 ++ v79$2, v107$2 ++ v106$2 ++ v105$2 ++ v104$2), FMUL32(v86$2 ++ v85$2 ++ v84$2 ++ v83$2, v129$2 ++ v128$2 ++ v127$2 ++ v126$2))))) ++ FADD32($sum3.0$2[32:0], FADD32(FMUL32(v198$2, v169$2 ++ v168$2 ++ v167$2 ++ v166$2), FADD32(FMUL32(v90$2 ++ v89$2 ++ v88$2 ++ v87$2, v147$2 ++ v146$2 ++ v145$2 ++ v144$2), FADD32(FMUL32(v82$2 ++ v81$2 ++ v80$2 ++ v79$2, v103$2 ++ v102$2 ++ v101$2 ++ v100$2), FMUL32(v86$2 ++ v85$2 ++ v84$2 ++ v83$2, v125$2 ++ v124$2 ++ v123$2 ++ v122$2)))));
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $truebb31:
    assume {:partition} v165 && v165;
    $31 := 32767bv32;
    goto $90;

  $truebb30:
    assume {:partition} v164 && v164;
    $30 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit24;

  $truebb27:
    assume {:partition} v143 && v143;
    $27 := 32767bv32;
    goto $79;

  $truebb26:
    assume {:partition} v142 && v142;
    $26 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit28;

  $truebb23:
    assume {:partition} v121 && v121;
    $23 := 32767bv32;
    goto $68;

  $truebb22:
    assume {:partition} v120 && v120;
    $22 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit32;

  $truebb19:
    assume {:partition} v99 && v99;
    $19 := 32767bv32;
    goto $57;

  $truebb18:
    assume {:partition} v98 && v98;
    $18 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit16;

  $truebb13:
    assume {:partition} v76 && v76;
    $13 := 32767bv32;
    goto $40;

  $truebb12:
    assume {:partition} v75 && v75;
    $12 := 0bv32;
    goto $41;

  $truebb9:
    assume {:partition} v53 && v53;
    $9 := 32767bv32;
    goto $29;

  $truebb8:
    assume {:partition} v52 && v52;
    $8 := 0bv32;
    goto $30;

  $truebb5:
    assume {:partition} v30 && v30;
    $5 := 32767bv32;
    goto $18;

  $truebb4:
    assume {:partition} v29 && v29;
    $4 := 0bv32;
    goto $19;

  $truebb1:
    assume {:partition} v7 && v7;
    $1 := 32767bv32;
    goto $7;

  $truebb0:
    assume {:partition} v6 && v6;
    $0 := 0bv32;
    goto $8;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 4bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$matrixA: bv8;

procedure {:inline 1} _LOG_READ_$$matrixA(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$matrixA;



implementation {:inline 1} _LOG_READ_$$matrixA(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$matrixA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixA == _value then true else _READ_HAS_OCCURRED_$$matrixA);
    return;
}



procedure _CHECK_READ_$$matrixA(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "matrixA"} {:array "$$matrixA"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$matrixA);
  requires {:source_name "matrixA"} {:array "$$matrixA"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$matrixA: bool;

procedure {:inline 1} _LOG_WRITE_$$matrixA(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$matrixA, _WRITE_READ_BENIGN_FLAG_$$matrixA;



implementation {:inline 1} _LOG_WRITE_$$matrixA(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$matrixA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixA == _value then true else _WRITE_HAS_OCCURRED_$$matrixA);
    _WRITE_READ_BENIGN_FLAG_$$matrixA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixA == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$matrixA);
    return;
}



procedure _CHECK_WRITE_$$matrixA(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "matrixA"} {:array "$$matrixA"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixA != _value);
  requires {:source_name "matrixA"} {:array "$$matrixA"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixA != _value);
  requires {:source_name "matrixA"} {:array "$$matrixA"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$matrixA(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$matrixA;



implementation {:inline 1} _LOG_ATOMIC_$$matrixA(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$matrixA := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$matrixA);
    return;
}



procedure _CHECK_ATOMIC_$$matrixA(_P: bool, _offset: bv32);
  requires {:source_name "matrixA"} {:array "$$matrixA"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset);
  requires {:source_name "matrixA"} {:array "$$matrixA"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixA(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$matrixA;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixA(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$matrixA := (if _P && _WRITE_HAS_OCCURRED_$$matrixA && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$matrixA);
    return;
}



const _WATCHED_VALUE_$$matrixB: bv8;

procedure {:inline 1} _LOG_READ_$$matrixB(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$matrixB;



implementation {:inline 1} _LOG_READ_$$matrixB(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$matrixB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixB == _value then true else _READ_HAS_OCCURRED_$$matrixB);
    return;
}



procedure _CHECK_READ_$$matrixB(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "matrixB"} {:array "$$matrixB"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$matrixB);
  requires {:source_name "matrixB"} {:array "$$matrixB"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$matrixB: bool;

procedure {:inline 1} _LOG_WRITE_$$matrixB(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$matrixB, _WRITE_READ_BENIGN_FLAG_$$matrixB;



implementation {:inline 1} _LOG_WRITE_$$matrixB(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$matrixB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixB == _value then true else _WRITE_HAS_OCCURRED_$$matrixB);
    _WRITE_READ_BENIGN_FLAG_$$matrixB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixB == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$matrixB);
    return;
}



procedure _CHECK_WRITE_$$matrixB(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "matrixB"} {:array "$$matrixB"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixB != _value);
  requires {:source_name "matrixB"} {:array "$$matrixB"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixB != _value);
  requires {:source_name "matrixB"} {:array "$$matrixB"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$matrixB(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$matrixB;



implementation {:inline 1} _LOG_ATOMIC_$$matrixB(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$matrixB := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$matrixB);
    return;
}



procedure _CHECK_ATOMIC_$$matrixB(_P: bool, _offset: bv32);
  requires {:source_name "matrixB"} {:array "$$matrixB"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset);
  requires {:source_name "matrixB"} {:array "$$matrixB"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixB(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$matrixB;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixB(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$matrixB := (if _P && _WRITE_HAS_OCCURRED_$$matrixB && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$matrixB);
    return;
}



const _WATCHED_VALUE_$$matrixC: bv8;

procedure {:inline 1} _LOG_READ_$$matrixC(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$matrixC;



implementation {:inline 1} _LOG_READ_$$matrixC(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$matrixC := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixC == _value then true else _READ_HAS_OCCURRED_$$matrixC);
    return;
}



procedure _CHECK_READ_$$matrixC(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "matrixC"} {:array "$$matrixC"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$matrixC);
  requires {:source_name "matrixC"} {:array "$$matrixC"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$matrixC: bool;

procedure {:inline 1} _LOG_WRITE_$$matrixC(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$matrixC, _WRITE_READ_BENIGN_FLAG_$$matrixC;



implementation {:inline 1} _LOG_WRITE_$$matrixC(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$matrixC := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixC == _value then true else _WRITE_HAS_OCCURRED_$$matrixC);
    _WRITE_READ_BENIGN_FLAG_$$matrixC := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixC == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$matrixC);
    return;
}



procedure _CHECK_WRITE_$$matrixC(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "matrixC"} {:array "$$matrixC"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixC != _value);
  requires {:source_name "matrixC"} {:array "$$matrixC"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$matrixC != _value);
  requires {:source_name "matrixC"} {:array "$$matrixC"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$matrixC(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$matrixC;



implementation {:inline 1} _LOG_ATOMIC_$$matrixC(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$matrixC := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$matrixC);
    return;
}



procedure _CHECK_ATOMIC_$$matrixC(_P: bool, _offset: bv32);
  requires {:source_name "matrixC"} {:array "$$matrixC"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset);
  requires {:source_name "matrixC"} {:array "$$matrixC"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$matrixC;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$matrixC := (if _P && _WRITE_HAS_OCCURRED_$$matrixC && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$matrixC);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
