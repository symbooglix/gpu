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

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "mmmKernel2"} {:kernel} $mmmKernel2($widthA: bv32, $widthB: bv32);
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



implementation {:source_name "mmmKernel2"} {:kernel} $mmmKernel2($widthA: bv32, $widthB: bv32)
{
  var $sum0.0$1: bv128;
  var $sum0.0$2: bv128;
  var $sum1.0$1: bv128;
  var $sum1.0$2: bv128;
  var $sum2.0$1: bv128;
  var $sum2.0$2: bv128;
  var $sum3.0$1: bv128;
  var $sum3.0$2: bv128;
  var $sum4.0$1: bv128;
  var $sum4.0$2: bv128;
  var $sum5.0$1: bv128;
  var $sum5.0$2: bv128;
  var $sum6.0$1: bv128;
  var $sum6.0$2: bv128;
  var $sum7.0$1: bv128;
  var $sum7.0$2: bv128;
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
  var $16: bv32;
  var $17: bv32;
  var $18$1: bv32;
  var $18$2: bv32;
  var $19$1: bv32;
  var $19$2: bv32;
  var $20: bv32;
  var $21: bv32;
  var $22$1: bv32;
  var $22$2: bv32;
  var $23$1: bv32;
  var $23$2: bv32;
  var $24: bv32;
  var $25: bv32;
  var $26$1: bv32;
  var $26$2: bv32;
  var $27$1: bv32;
  var $27$2: bv32;
  var $28: bv32;
  var $29: bv32;
  var $30$1: bv32;
  var $30$2: bv32;
  var $31$1: bv32;
  var $31$2: bv32;
  var $32$1: bv32;
  var $32$2: bv32;
  var $33$1: bv32;
  var $33$2: bv32;
  var $34: bv32;
  var $35: bv32;
  var $36$1: bv32;
  var $36$2: bv32;
  var $37$1: bv32;
  var $37$2: bv32;
  var $38: bv32;
  var $39: bv32;
  var $40$1: bv32;
  var $40$2: bv32;
  var $41$1: bv32;
  var $41$2: bv32;
  var $42: bv32;
  var $43: bv32;
  var $44$1: bv32;
  var $44$2: bv32;
  var $45$1: bv32;
  var $45$2: bv32;
  var $46: bv32;
  var $47: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v2: bool;
  var v1$1: bv32;
  var v1$2: bv32;
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
  var v274$1: bv32;
  var v274$2: bv32;
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
  var v282$1: bv32;
  var v282$2: bv32;
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
  var v286$1: bv32;
  var v286$2: bv32;
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
  var v290$1: bv32;
  var v290$2: bv32;
  var v95$1: bv32;
  var v95$2: bv32;
  var v96: bv32;
  var v97$1: bv32;
  var v97$2: bv32;
  var v98: bool;
  var v99: bool;
  var v100$1: bool;
  var v100$2: bool;
  var v101$1: bool;
  var v101$2: bool;
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
  var v294$1: bv32;
  var v294$2: bv32;
  var v118$1: bv32;
  var v118$2: bv32;
  var v119: bv32;
  var v120$1: bv32;
  var v120$2: bv32;
  var v121: bool;
  var v122: bool;
  var v123$1: bool;
  var v123$2: bool;
  var v124$1: bool;
  var v124$2: bool;
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
  var v138$1: bv8;
  var v138$2: bv8;
  var v139$1: bv8;
  var v139$2: bv8;
  var v140$1: bv8;
  var v140$2: bv8;
  var v298$1: bv32;
  var v298$2: bv32;
  var v141$1: bv32;
  var v141$2: bv32;
  var v142: bv32;
  var v143$1: bv32;
  var v143$2: bv32;
  var v144: bool;
  var v145: bool;
  var v146$1: bool;
  var v146$2: bool;
  var v147$1: bool;
  var v147$2: bool;
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
  var v163$1: bv8;
  var v163$2: bv8;
  var v302$1: bv32;
  var v302$2: bv32;
  var v164$1: bv32;
  var v164$2: bv32;
  var v165: bv32;
  var v166$1: bv32;
  var v166$2: bv32;
  var v167: bool;
  var v168: bool;
  var v169$1: bool;
  var v169$2: bool;
  var v170$1: bool;
  var v170$2: bool;
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
  var v182$1: bv8;
  var v182$2: bv8;
  var v183$1: bv8;
  var v183$2: bv8;
  var v184$1: bv8;
  var v184$2: bv8;
  var v185$1: bv8;
  var v185$2: bv8;
  var v186$1: bv8;
  var v186$2: bv8;
  var v306$1: bv32;
  var v306$2: bv32;
  var v187$1: bv32;
  var v187$2: bv32;
  var v188$1: bool;
  var v188$2: bool;
  var v189$1: bool;
  var v189$2: bool;
  var v190: bool;
  var v191: bool;
  var v192$1: bv8;
  var v192$2: bv8;
  var v193$1: bv8;
  var v193$2: bv8;
  var v194$1: bv8;
  var v194$2: bv8;
  var v195$1: bv8;
  var v195$2: bv8;
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
  var v277$1: bv32;
  var v277$2: bv32;
  var v208$1: bv32;
  var v208$2: bv32;
  var v209: bv32;
  var v210$1: bool;
  var v210$2: bool;
  var v211$1: bool;
  var v211$2: bool;
  var v212: bool;
  var v213: bool;
  var v214$1: bv8;
  var v214$2: bv8;
  var v215$1: bv8;
  var v215$2: bv8;
  var v216$1: bv8;
  var v216$2: bv8;
  var v217$1: bv8;
  var v217$2: bv8;
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
  var v226$1: bv8;
  var v226$2: bv8;
  var v227$1: bv8;
  var v227$2: bv8;
  var v228$1: bv8;
  var v228$2: bv8;
  var v229$1: bv8;
  var v229$2: bv8;
  var v278$1: bv32;
  var v278$2: bv32;
  var v230$1: bv32;
  var v230$2: bv32;
  var v231: bv32;
  var v232$1: bool;
  var v232$2: bool;
  var v233$1: bool;
  var v233$2: bool;
  var v234: bool;
  var v235: bool;
  var v236$1: bv8;
  var v236$2: bv8;
  var v237$1: bv8;
  var v237$2: bv8;
  var v238$1: bv8;
  var v238$2: bv8;
  var v239$1: bv8;
  var v239$2: bv8;
  var v240$1: bv8;
  var v240$2: bv8;
  var v241$1: bv8;
  var v241$2: bv8;
  var v242$1: bv8;
  var v242$2: bv8;
  var v243$1: bv8;
  var v243$2: bv8;
  var v244$1: bv8;
  var v244$2: bv8;
  var v245$1: bv8;
  var v245$2: bv8;
  var v246$1: bv8;
  var v246$2: bv8;
  var v247$1: bv8;
  var v247$2: bv8;
  var v248$1: bv8;
  var v248$2: bv8;
  var v249$1: bv8;
  var v249$2: bv8;
  var v250$1: bv8;
  var v250$2: bv8;
  var v251$1: bv8;
  var v251$2: bv8;
  var v279$1: bv32;
  var v279$2: bv32;
  var v252$1: bv32;
  var v252$2: bv32;
  var v253: bv32;
  var v254$1: bool;
  var v254$2: bool;
  var v255$1: bool;
  var v255$2: bool;
  var v256: bool;
  var v257: bool;
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
  var v280$1: bv32;
  var v280$2: bv32;
  var v275$1: bv32;
  var v275$2: bv32;
  var v276$1: bv32;
  var v276$2: bv32;
  var v281$1: bv32;
  var v281$2: bv32;
  var v283$1: bv32;
  var v283$2: bv32;
  var v284$1: bv32;
  var v284$2: bv32;
  var v285$1: bv32;
  var v285$2: bv32;
  var v287$1: bv32;
  var v287$2: bv32;
  var v288$1: bv32;
  var v288$2: bv32;
  var v289$1: bv32;
  var v289$2: bv32;
  var v291$1: bv32;
  var v291$2: bv32;
  var v292$1: bv32;
  var v292$2: bv32;
  var v293$1: bv32;
  var v293$2: bv32;
  var v295$1: bv32;
  var v295$2: bv32;
  var v296$1: bv32;
  var v296$2: bv32;
  var v297$1: bv32;
  var v297$2: bv32;
  var v299$1: bv32;
  var v299$2: bv32;
  var v300$1: bv32;
  var v300$2: bv32;
  var v301$1: bv32;
  var v301$2: bv32;
  var v303$1: bv32;
  var v303$2: bv32;
  var v304$1: bv32;
  var v304$2: bv32;
  var v305$1: bv32;
  var v305$2: bv32;
  var v307$1: bv32;
  var v307$2: bv32;
  var v308$1: bv32;
  var v308$2: bv32;
  var v309$1: bv32;
  var v309$2: bv32;
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
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    $sum0.0$1, $sum1.0$1, $sum2.0$1, $sum3.0$1, $sum4.0$1, $sum5.0$1, $sum6.0$1, $sum7.0$1, $i.0 := 0bv128, 0bv128, 0bv128, 0bv128, 0bv128, 0bv128, 0bv128, 0bv128, 0bv32;
    $sum0.0$2, $sum1.0$2, $sum2.0$2, $sum3.0$2, $sum4.0$2, $sum5.0$2, $sum6.0$2, $sum7.0$2 := 0bv128, 0bv128, 0bv128, 0bv128, 0bv128, 0bv128, 0bv128, 0bv128;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
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
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v2 && !v2;
    call {:sourceloc} {:sourceloc_num 353} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), $sum0.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 353} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 353} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), $sum0.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32)] := $sum0.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32)] := $sum0.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 354} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum0.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 354} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 354} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum0.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum0.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum0.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 355} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum0.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 355} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 355} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum0.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum0.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum0.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 356} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum0.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 356} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 356} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum0.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum0.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum0.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 357} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum0.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 357} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 357} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum0.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum0.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum0.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 358} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum0.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 358} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 358} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum0.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum0.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum0.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 359} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum0.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 359} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 359} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum0.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum0.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum0.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 360} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum0.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 360} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 360} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum0.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum0.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum0.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 361} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum0.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 361} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 361} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum0.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum0.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum0.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 362} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum0.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 362} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 362} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum0.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum0.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum0.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 363} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum0.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 363} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 363} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum0.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum0.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum0.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 364} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum0.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 364} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 364} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum0.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum0.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum0.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 365} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum0.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 365} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 365} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum0.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum0.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum0.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 366} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum0.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 366} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 366} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum0.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum0.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum0.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 367} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum0.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 367} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 367} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum0.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum0.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum0.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 368} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum0.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 368} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 368} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum0.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$1, 8bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum0.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_MUL(v1$2, 8bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum0.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 369} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), $sum1.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 369} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 369} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), $sum1.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32)] := $sum1.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32)] := $sum1.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 370} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum1.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 370} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 370} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum1.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum1.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum1.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 371} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum1.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 371} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 371} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum1.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum1.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum1.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 372} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum1.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 372} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 372} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum1.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum1.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum1.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 373} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum1.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 373} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 373} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum1.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum1.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum1.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 374} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum1.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 374} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 374} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum1.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum1.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum1.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 375} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum1.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 375} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 375} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum1.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum1.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum1.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 376} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum1.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 376} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 376} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum1.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum1.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum1.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 377} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum1.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 377} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 377} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum1.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum1.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum1.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 378} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum1.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 378} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 378} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum1.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum1.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum1.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 379} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum1.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 379} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 379} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum1.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum1.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum1.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 380} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum1.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 380} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 380} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum1.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum1.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum1.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 381} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum1.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 381} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 381} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum1.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum1.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum1.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 382} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum1.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 382} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 382} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum1.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum1.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum1.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 383} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum1.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 383} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 383} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum1.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum1.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum1.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 384} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum1.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 384} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 384} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum1.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 1bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum1.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 1bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum1.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 385} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), $sum2.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 385} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 385} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), $sum2.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32)] := $sum2.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32)] := $sum2.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 386} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum2.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 386} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 386} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum2.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum2.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum2.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 387} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum2.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 387} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 387} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum2.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum2.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum2.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 388} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum2.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 388} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 388} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum2.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum2.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum2.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 389} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum2.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 389} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 389} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum2.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum2.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum2.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 390} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum2.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 390} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 390} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum2.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum2.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum2.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 391} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum2.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 391} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 391} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum2.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum2.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum2.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 392} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum2.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 392} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 392} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum2.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum2.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum2.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 393} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum2.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 393} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 393} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum2.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum2.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum2.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 394} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum2.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 394} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 394} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum2.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum2.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum2.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 395} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum2.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 395} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 395} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum2.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum2.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum2.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 396} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum2.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 396} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 396} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum2.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum2.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum2.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 397} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum2.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 397} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 397} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum2.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum2.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum2.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 398} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum2.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 398} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 398} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum2.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum2.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum2.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 399} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum2.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 399} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 399} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum2.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum2.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum2.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 400} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum2.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 400} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 400} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum2.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 2bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum2.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 2bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum2.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 401} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), $sum3.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 401} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 401} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), $sum3.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32)] := $sum3.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32)] := $sum3.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 402} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum3.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 402} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 402} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum3.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum3.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum3.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 403} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum3.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 403} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 403} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum3.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum3.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum3.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 404} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum3.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 404} true;
    call {:check_id "check_state_51"} {:sourceloc} {:sourceloc_num 404} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum3.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum3.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum3.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 405} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum3.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 405} true;
    call {:check_id "check_state_52"} {:sourceloc} {:sourceloc_num 405} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum3.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum3.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum3.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 406} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum3.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 406} true;
    call {:check_id "check_state_53"} {:sourceloc} {:sourceloc_num 406} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum3.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum3.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum3.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 407} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum3.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 407} true;
    call {:check_id "check_state_54"} {:sourceloc} {:sourceloc_num 407} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum3.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum3.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum3.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 408} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum3.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 408} true;
    call {:check_id "check_state_55"} {:sourceloc} {:sourceloc_num 408} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum3.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum3.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum3.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 409} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum3.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_56"} {:captureState "check_state_56"} {:sourceloc} {:sourceloc_num 409} true;
    call {:check_id "check_state_56"} {:sourceloc} {:sourceloc_num 409} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum3.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum3.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum3.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 410} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum3.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_57"} {:captureState "check_state_57"} {:sourceloc} {:sourceloc_num 410} true;
    call {:check_id "check_state_57"} {:sourceloc} {:sourceloc_num 410} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum3.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum3.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum3.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 411} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum3.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_58"} {:captureState "check_state_58"} {:sourceloc} {:sourceloc_num 411} true;
    call {:check_id "check_state_58"} {:sourceloc} {:sourceloc_num 411} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum3.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum3.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum3.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 412} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum3.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_59"} {:captureState "check_state_59"} {:sourceloc} {:sourceloc_num 412} true;
    call {:check_id "check_state_59"} {:sourceloc} {:sourceloc_num 412} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum3.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum3.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum3.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 413} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum3.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_60"} {:captureState "check_state_60"} {:sourceloc} {:sourceloc_num 413} true;
    call {:check_id "check_state_60"} {:sourceloc} {:sourceloc_num 413} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum3.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum3.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum3.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 414} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum3.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_61"} {:captureState "check_state_61"} {:sourceloc} {:sourceloc_num 414} true;
    call {:check_id "check_state_61"} {:sourceloc} {:sourceloc_num 414} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum3.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum3.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum3.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 415} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum3.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_62"} {:captureState "check_state_62"} {:sourceloc} {:sourceloc_num 415} true;
    call {:check_id "check_state_62"} {:sourceloc} {:sourceloc_num 415} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum3.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum3.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum3.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 416} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum3.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_63"} {:captureState "check_state_63"} {:sourceloc} {:sourceloc_num 416} true;
    call {:check_id "check_state_63"} {:sourceloc} {:sourceloc_num 416} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum3.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 3bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum3.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 3bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum3.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 417} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), $sum4.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_64"} {:captureState "check_state_64"} {:sourceloc} {:sourceloc_num 417} true;
    call {:check_id "check_state_64"} {:sourceloc} {:sourceloc_num 417} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), $sum4.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32)] := $sum4.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32)] := $sum4.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 418} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum4.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_65"} {:captureState "check_state_65"} {:sourceloc} {:sourceloc_num 418} true;
    call {:check_id "check_state_65"} {:sourceloc} {:sourceloc_num 418} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum4.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum4.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum4.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 419} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum4.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_66"} {:captureState "check_state_66"} {:sourceloc} {:sourceloc_num 419} true;
    call {:check_id "check_state_66"} {:sourceloc} {:sourceloc_num 419} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum4.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum4.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum4.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 420} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum4.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_67"} {:captureState "check_state_67"} {:sourceloc} {:sourceloc_num 420} true;
    call {:check_id "check_state_67"} {:sourceloc} {:sourceloc_num 420} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum4.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum4.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum4.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 421} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum4.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_68"} {:captureState "check_state_68"} {:sourceloc} {:sourceloc_num 421} true;
    call {:check_id "check_state_68"} {:sourceloc} {:sourceloc_num 421} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum4.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum4.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum4.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 422} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum4.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_69"} {:captureState "check_state_69"} {:sourceloc} {:sourceloc_num 422} true;
    call {:check_id "check_state_69"} {:sourceloc} {:sourceloc_num 422} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum4.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum4.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum4.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 423} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum4.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_70"} {:captureState "check_state_70"} {:sourceloc} {:sourceloc_num 423} true;
    call {:check_id "check_state_70"} {:sourceloc} {:sourceloc_num 423} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum4.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum4.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum4.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 424} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum4.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_71"} {:captureState "check_state_71"} {:sourceloc} {:sourceloc_num 424} true;
    call {:check_id "check_state_71"} {:sourceloc} {:sourceloc_num 424} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum4.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum4.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum4.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 425} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum4.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_72"} {:captureState "check_state_72"} {:sourceloc} {:sourceloc_num 425} true;
    call {:check_id "check_state_72"} {:sourceloc} {:sourceloc_num 425} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum4.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum4.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum4.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 426} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum4.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_73"} {:captureState "check_state_73"} {:sourceloc} {:sourceloc_num 426} true;
    call {:check_id "check_state_73"} {:sourceloc} {:sourceloc_num 426} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum4.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum4.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum4.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 427} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum4.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_74"} {:captureState "check_state_74"} {:sourceloc} {:sourceloc_num 427} true;
    call {:check_id "check_state_74"} {:sourceloc} {:sourceloc_num 427} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum4.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum4.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum4.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 428} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum4.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_75"} {:captureState "check_state_75"} {:sourceloc} {:sourceloc_num 428} true;
    call {:check_id "check_state_75"} {:sourceloc} {:sourceloc_num 428} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum4.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum4.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum4.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 429} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum4.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_76"} {:captureState "check_state_76"} {:sourceloc} {:sourceloc_num 429} true;
    call {:check_id "check_state_76"} {:sourceloc} {:sourceloc_num 429} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum4.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum4.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum4.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 430} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum4.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_77"} {:captureState "check_state_77"} {:sourceloc} {:sourceloc_num 430} true;
    call {:check_id "check_state_77"} {:sourceloc} {:sourceloc_num 430} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum4.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum4.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum4.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 431} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum4.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_78"} {:captureState "check_state_78"} {:sourceloc} {:sourceloc_num 431} true;
    call {:check_id "check_state_78"} {:sourceloc} {:sourceloc_num 431} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum4.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum4.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum4.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 432} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum4.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_79"} {:captureState "check_state_79"} {:sourceloc} {:sourceloc_num 432} true;
    call {:check_id "check_state_79"} {:sourceloc} {:sourceloc_num 432} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum4.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 4bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum4.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 4bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum4.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 433} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), $sum5.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_80"} {:captureState "check_state_80"} {:sourceloc} {:sourceloc_num 433} true;
    call {:check_id "check_state_80"} {:sourceloc} {:sourceloc_num 433} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), $sum5.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32)] := $sum5.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32)] := $sum5.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 434} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum5.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_81"} {:captureState "check_state_81"} {:sourceloc} {:sourceloc_num 434} true;
    call {:check_id "check_state_81"} {:sourceloc} {:sourceloc_num 434} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum5.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum5.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum5.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 435} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum5.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_82"} {:captureState "check_state_82"} {:sourceloc} {:sourceloc_num 435} true;
    call {:check_id "check_state_82"} {:sourceloc} {:sourceloc_num 435} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum5.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum5.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum5.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 436} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum5.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_83"} {:captureState "check_state_83"} {:sourceloc} {:sourceloc_num 436} true;
    call {:check_id "check_state_83"} {:sourceloc} {:sourceloc_num 436} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum5.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum5.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum5.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 437} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum5.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_84"} {:captureState "check_state_84"} {:sourceloc} {:sourceloc_num 437} true;
    call {:check_id "check_state_84"} {:sourceloc} {:sourceloc_num 437} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum5.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum5.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum5.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 438} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum5.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_85"} {:captureState "check_state_85"} {:sourceloc} {:sourceloc_num 438} true;
    call {:check_id "check_state_85"} {:sourceloc} {:sourceloc_num 438} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum5.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum5.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum5.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 439} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum5.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_86"} {:captureState "check_state_86"} {:sourceloc} {:sourceloc_num 439} true;
    call {:check_id "check_state_86"} {:sourceloc} {:sourceloc_num 439} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum5.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum5.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum5.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 440} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum5.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_87"} {:captureState "check_state_87"} {:sourceloc} {:sourceloc_num 440} true;
    call {:check_id "check_state_87"} {:sourceloc} {:sourceloc_num 440} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum5.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum5.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum5.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 441} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum5.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_88"} {:captureState "check_state_88"} {:sourceloc} {:sourceloc_num 441} true;
    call {:check_id "check_state_88"} {:sourceloc} {:sourceloc_num 441} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum5.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum5.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum5.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 442} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum5.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_89"} {:captureState "check_state_89"} {:sourceloc} {:sourceloc_num 442} true;
    call {:check_id "check_state_89"} {:sourceloc} {:sourceloc_num 442} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum5.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum5.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum5.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 443} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum5.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_90"} {:captureState "check_state_90"} {:sourceloc} {:sourceloc_num 443} true;
    call {:check_id "check_state_90"} {:sourceloc} {:sourceloc_num 443} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum5.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum5.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum5.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 444} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum5.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_91"} {:captureState "check_state_91"} {:sourceloc} {:sourceloc_num 444} true;
    call {:check_id "check_state_91"} {:sourceloc} {:sourceloc_num 444} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum5.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum5.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum5.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 445} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum5.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_92"} {:captureState "check_state_92"} {:sourceloc} {:sourceloc_num 445} true;
    call {:check_id "check_state_92"} {:sourceloc} {:sourceloc_num 445} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum5.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum5.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum5.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 446} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum5.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_93"} {:captureState "check_state_93"} {:sourceloc} {:sourceloc_num 446} true;
    call {:check_id "check_state_93"} {:sourceloc} {:sourceloc_num 446} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum5.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum5.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum5.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 447} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum5.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_94"} {:captureState "check_state_94"} {:sourceloc} {:sourceloc_num 447} true;
    call {:check_id "check_state_94"} {:sourceloc} {:sourceloc_num 447} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum5.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum5.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum5.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 448} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum5.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_95"} {:captureState "check_state_95"} {:sourceloc} {:sourceloc_num 448} true;
    call {:check_id "check_state_95"} {:sourceloc} {:sourceloc_num 448} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum5.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 5bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum5.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 5bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum5.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 449} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), $sum6.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_96"} {:captureState "check_state_96"} {:sourceloc} {:sourceloc_num 449} true;
    call {:check_id "check_state_96"} {:sourceloc} {:sourceloc_num 449} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), $sum6.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32)] := $sum6.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32)] := $sum6.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 450} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum6.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_97"} {:captureState "check_state_97"} {:sourceloc} {:sourceloc_num 450} true;
    call {:check_id "check_state_97"} {:sourceloc} {:sourceloc_num 450} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum6.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum6.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum6.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 451} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum6.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_98"} {:captureState "check_state_98"} {:sourceloc} {:sourceloc_num 451} true;
    call {:check_id "check_state_98"} {:sourceloc} {:sourceloc_num 451} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum6.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum6.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum6.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 452} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum6.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_99"} {:captureState "check_state_99"} {:sourceloc} {:sourceloc_num 452} true;
    call {:check_id "check_state_99"} {:sourceloc} {:sourceloc_num 452} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum6.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum6.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum6.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 453} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum6.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_100"} {:captureState "check_state_100"} {:sourceloc} {:sourceloc_num 453} true;
    call {:check_id "check_state_100"} {:sourceloc} {:sourceloc_num 453} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum6.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum6.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum6.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 454} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum6.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_101"} {:captureState "check_state_101"} {:sourceloc} {:sourceloc_num 454} true;
    call {:check_id "check_state_101"} {:sourceloc} {:sourceloc_num 454} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum6.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum6.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum6.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 455} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum6.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_102"} {:captureState "check_state_102"} {:sourceloc} {:sourceloc_num 455} true;
    call {:check_id "check_state_102"} {:sourceloc} {:sourceloc_num 455} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum6.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum6.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum6.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 456} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum6.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_103"} {:captureState "check_state_103"} {:sourceloc} {:sourceloc_num 456} true;
    call {:check_id "check_state_103"} {:sourceloc} {:sourceloc_num 456} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum6.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum6.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum6.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 457} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum6.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_104"} {:captureState "check_state_104"} {:sourceloc} {:sourceloc_num 457} true;
    call {:check_id "check_state_104"} {:sourceloc} {:sourceloc_num 457} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum6.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum6.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum6.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 458} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum6.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_105"} {:captureState "check_state_105"} {:sourceloc} {:sourceloc_num 458} true;
    call {:check_id "check_state_105"} {:sourceloc} {:sourceloc_num 458} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum6.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum6.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum6.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 459} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum6.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_106"} {:captureState "check_state_106"} {:sourceloc} {:sourceloc_num 459} true;
    call {:check_id "check_state_106"} {:sourceloc} {:sourceloc_num 459} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum6.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum6.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum6.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 460} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum6.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_107"} {:captureState "check_state_107"} {:sourceloc} {:sourceloc_num 460} true;
    call {:check_id "check_state_107"} {:sourceloc} {:sourceloc_num 460} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum6.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum6.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum6.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 461} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum6.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_108"} {:captureState "check_state_108"} {:sourceloc} {:sourceloc_num 461} true;
    call {:check_id "check_state_108"} {:sourceloc} {:sourceloc_num 461} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum6.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum6.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum6.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 462} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum6.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_109"} {:captureState "check_state_109"} {:sourceloc} {:sourceloc_num 462} true;
    call {:check_id "check_state_109"} {:sourceloc} {:sourceloc_num 462} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum6.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum6.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum6.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 463} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum6.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_110"} {:captureState "check_state_110"} {:sourceloc} {:sourceloc_num 463} true;
    call {:check_id "check_state_110"} {:sourceloc} {:sourceloc_num 463} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum6.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum6.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum6.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 464} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum6.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_111"} {:captureState "check_state_111"} {:sourceloc} {:sourceloc_num 464} true;
    call {:check_id "check_state_111"} {:sourceloc} {:sourceloc_num 464} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum6.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 6bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum6.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 6bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum6.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 465} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), $sum7.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_112"} {:captureState "check_state_112"} {:sourceloc} {:sourceloc_num 465} true;
    call {:check_id "check_state_112"} {:sourceloc} {:sourceloc_num 465} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), $sum7.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32)] := $sum7.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32)] := $sum7.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 466} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum7.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_113"} {:captureState "check_state_113"} {:sourceloc} {:sourceloc_num 466} true;
    call {:check_id "check_state_113"} {:sourceloc} {:sourceloc_num 466} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum7.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum7.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum7.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 467} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum7.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_114"} {:captureState "check_state_114"} {:sourceloc} {:sourceloc_num 467} true;
    call {:check_id "check_state_114"} {:sourceloc} {:sourceloc_num 467} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum7.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum7.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum7.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 468} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum7.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_115"} {:captureState "check_state_115"} {:sourceloc} {:sourceloc_num 468} true;
    call {:check_id "check_state_115"} {:sourceloc} {:sourceloc_num 468} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum7.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum7.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum7.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 469} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum7.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_116"} {:captureState "check_state_116"} {:sourceloc} {:sourceloc_num 469} true;
    call {:check_id "check_state_116"} {:sourceloc} {:sourceloc_num 469} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum7.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum7.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum7.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 470} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum7.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_117"} {:captureState "check_state_117"} {:sourceloc} {:sourceloc_num 470} true;
    call {:check_id "check_state_117"} {:sourceloc} {:sourceloc_num 470} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum7.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum7.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum7.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 471} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum7.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_118"} {:captureState "check_state_118"} {:sourceloc} {:sourceloc_num 471} true;
    call {:check_id "check_state_118"} {:sourceloc} {:sourceloc_num 471} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum7.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum7.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum7.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 472} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum7.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_119"} {:captureState "check_state_119"} {:sourceloc} {:sourceloc_num 472} true;
    call {:check_id "check_state_119"} {:sourceloc} {:sourceloc_num 472} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum7.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum7.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum7.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 473} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum7.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_120"} {:captureState "check_state_120"} {:sourceloc} {:sourceloc_num 473} true;
    call {:check_id "check_state_120"} {:sourceloc} {:sourceloc_num 473} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum7.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum7.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum7.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 474} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum7.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_121"} {:captureState "check_state_121"} {:sourceloc} {:sourceloc_num 474} true;
    call {:check_id "check_state_121"} {:sourceloc} {:sourceloc_num 474} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum7.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum7.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum7.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 475} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum7.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_122"} {:captureState "check_state_122"} {:sourceloc} {:sourceloc_num 475} true;
    call {:check_id "check_state_122"} {:sourceloc} {:sourceloc_num 475} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum7.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum7.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum7.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 476} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum7.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_123"} {:captureState "check_state_123"} {:sourceloc} {:sourceloc_num 476} true;
    call {:check_id "check_state_123"} {:sourceloc} {:sourceloc_num 476} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum7.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum7.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum7.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 477} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum7.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_124"} {:captureState "check_state_124"} {:sourceloc} {:sourceloc_num 477} true;
    call {:check_id "check_state_124"} {:sourceloc} {:sourceloc_num 477} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum7.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum7.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum7.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 478} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum7.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_125"} {:captureState "check_state_125"} {:sourceloc} {:sourceloc_num 478} true;
    call {:check_id "check_state_125"} {:sourceloc} {:sourceloc_num 478} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum7.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum7.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum7.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 479} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum7.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_126"} {:captureState "check_state_126"} {:sourceloc} {:sourceloc_num 479} true;
    call {:check_id "check_state_126"} {:sourceloc} {:sourceloc_num 479} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum7.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum7.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum7.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 480} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum7.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_127"} {:captureState "check_state_127"} {:sourceloc} {:sourceloc_num 480} true;
    call {:check_id "check_state_127"} {:sourceloc} {:sourceloc_num 480} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum7.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$1, 8bv32), 7bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum7.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v1$2, 8bv32), 7bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum7.0$2[128:120];
    return;

  $truebb:
    assume {:partition} v2 && v2;
    v3$1 := $$imageSampler$1[0bv32];
    v3$2 := $$imageSampler$2[0bv32];
    v4 := BV32_ASHR($i.0, 2bv32);
    v5$1 := BV32_SHL(v1$1, 3bv32);
    v5$2 := BV32_SHL(v1$2, 3bv32);
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
    v27 := BV32_ASHR($i.0, 2bv32);
    v28$1 := BV32_ADD(BV32_SHL(v1$1, 3bv32), 1bv32);
    v28$2 := BV32_ADD(BV32_SHL(v1$2, 3bv32), 1bv32);
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
    v50 := BV32_ASHR($i.0, 2bv32);
    v51$1 := BV32_ADD(BV32_SHL(v1$1, 3bv32), 2bv32);
    v51$2 := BV32_ADD(BV32_SHL(v1$2, 3bv32), 2bv32);
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
    v73 := BV32_ASHR($i.0, 2bv32);
    v74$1 := BV32_ADD(BV32_SHL(v1$1, 3bv32), 3bv32);
    v74$2 := BV32_ADD(BV32_SHL(v1$2, 3bv32), 3bv32);
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
    v96 := BV32_ASHR($i.0, 2bv32);
    v97$1 := BV32_ADD(BV32_SHL(v1$1, 3bv32), 4bv32);
    v97$2 := BV32_ADD(BV32_SHL(v1$2, 3bv32), 4bv32);
    v98 := BV32_SLT(v96, 0bv32);
    goto $truebb16, $falsebb16;

  $falsebb16:
    assume {:partition} !v98 && !v98;
    v99 := BV32_SGE(v96, 32768bv32);
    goto $truebb17, $falsebb17;

  $falsebb17:
    assume {:partition} !v99 && !v99;
    $17 := v96;
    goto $51;

  $51:
    $16 := $17;
    goto $52;

  $52:
    v100$1 := BV32_SLT(v97$1, 0bv32);
    v100$2 := BV32_SLT(v97$2, 0bv32);
    p16$1 := (if v100$1 then v100$1 else p16$1);
    p16$2 := (if v100$2 then v100$2 else p16$2);
    p17$1 := (if !v100$1 then !v100$1 else p17$1);
    p17$2 := (if !v100$2 then !v100$2 else p17$2);
    $18$1 := (if p16$1 then 0bv32 else $18$1);
    $18$2 := (if p16$2 then 0bv32 else $18$2);
    v101$1 := (if p17$1 then BV32_SGE(v97$1, 32768bv32) else v101$1);
    v101$2 := (if p17$2 then BV32_SGE(v97$2, 32768bv32) else v101$2);
    p19$1 := (if p17$1 && v101$1 then v101$1 else p19$1);
    p19$2 := (if p17$2 && v101$2 then v101$2 else p19$2);
    p18$1 := (if p17$1 && !v101$1 then !v101$1 else p18$1);
    p18$2 := (if p17$2 && !v101$2 then !v101$2 else p18$2);
    $19$1 := (if p18$1 then v97$1 else $19$1);
    $19$2 := (if p18$2 then v97$2 else $19$2);
    $19$1 := (if p19$1 then 32767bv32 else $19$1);
    $19$2 := (if p19$2 then 32767bv32 else $19$2);
    $18$1 := (if p17$1 then $19$1 else $18$1);
    $18$2 := (if p17$2 then $19$2 else $18$2);
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
    havoc v116$1, v116$2;
    havoc v117$1, v117$2;
    v118$1 := $$imageSampler$1[0bv32];
    v118$2 := $$imageSampler$2[0bv32];
    v119 := BV32_ASHR($i.0, 2bv32);
    v120$1 := BV32_ADD(BV32_SHL(v1$1, 3bv32), 5bv32);
    v120$2 := BV32_ADD(BV32_SHL(v1$2, 3bv32), 5bv32);
    v121 := BV32_SLT(v119, 0bv32);
    goto $truebb20, $falsebb20;

  $falsebb20:
    assume {:partition} !v121 && !v121;
    v122 := BV32_SGE(v119, 32768bv32);
    goto $truebb21, $falsebb21;

  $falsebb21:
    assume {:partition} !v122 && !v122;
    $21 := v119;
    goto $62;

  $62:
    $20 := $21;
    goto $63;

  $63:
    v123$1 := BV32_SLT(v120$1, 0bv32);
    v123$2 := BV32_SLT(v120$2, 0bv32);
    p20$1 := (if v123$1 then v123$1 else p20$1);
    p20$2 := (if v123$2 then v123$2 else p20$2);
    p21$1 := (if !v123$1 then !v123$1 else p21$1);
    p21$2 := (if !v123$2 then !v123$2 else p21$2);
    $22$1 := (if p20$1 then 0bv32 else $22$1);
    $22$2 := (if p20$2 then 0bv32 else $22$2);
    v124$1 := (if p21$1 then BV32_SGE(v120$1, 32768bv32) else v124$1);
    v124$2 := (if p21$2 then BV32_SGE(v120$2, 32768bv32) else v124$2);
    p23$1 := (if p21$1 && v124$1 then v124$1 else p23$1);
    p23$2 := (if p21$2 && v124$2 then v124$2 else p23$2);
    p22$1 := (if p21$1 && !v124$1 then !v124$1 else p22$1);
    p22$2 := (if p21$2 && !v124$2 then !v124$2 else p22$2);
    $23$1 := (if p22$1 then v120$1 else $23$1);
    $23$2 := (if p22$2 then v120$2 else $23$2);
    $23$1 := (if p23$1 then 32767bv32 else $23$1);
    $23$2 := (if p23$2 then 32767bv32 else $23$2);
    $22$1 := (if p21$1 then $23$1 else $22$1);
    $22$2 := (if p21$2 then $23$2 else $22$2);
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
    havoc v138$1, v138$2;
    havoc v139$1, v139$2;
    havoc v140$1, v140$2;
    v141$1 := $$imageSampler$1[0bv32];
    v141$2 := $$imageSampler$2[0bv32];
    v142 := BV32_ASHR($i.0, 2bv32);
    v143$1 := BV32_ADD(BV32_SHL(v1$1, 3bv32), 6bv32);
    v143$2 := BV32_ADD(BV32_SHL(v1$2, 3bv32), 6bv32);
    v144 := BV32_SLT(v142, 0bv32);
    goto $truebb24, $falsebb24;

  $falsebb24:
    assume {:partition} !v144 && !v144;
    v145 := BV32_SGE(v142, 32768bv32);
    goto $truebb25, $falsebb25;

  $falsebb25:
    assume {:partition} !v145 && !v145;
    $25 := v142;
    goto $73;

  $73:
    $24 := $25;
    goto $74;

  $74:
    v146$1 := BV32_SLT(v143$1, 0bv32);
    v146$2 := BV32_SLT(v143$2, 0bv32);
    p24$1 := (if v146$1 then v146$1 else p24$1);
    p24$2 := (if v146$2 then v146$2 else p24$2);
    p25$1 := (if !v146$1 then !v146$1 else p25$1);
    p25$2 := (if !v146$2 then !v146$2 else p25$2);
    $26$1 := (if p24$1 then 0bv32 else $26$1);
    $26$2 := (if p24$2 then 0bv32 else $26$2);
    v147$1 := (if p25$1 then BV32_SGE(v143$1, 32768bv32) else v147$1);
    v147$2 := (if p25$2 then BV32_SGE(v143$2, 32768bv32) else v147$2);
    p27$1 := (if p25$1 && v147$1 then v147$1 else p27$1);
    p27$2 := (if p25$2 && v147$2 then v147$2 else p27$2);
    p26$1 := (if p25$1 && !v147$1 then !v147$1 else p26$1);
    p26$2 := (if p25$2 && !v147$2 then !v147$2 else p26$2);
    $27$1 := (if p26$1 then v143$1 else $27$1);
    $27$2 := (if p26$2 then v143$2 else $27$2);
    $27$1 := (if p27$1 then 32767bv32 else $27$1);
    $27$2 := (if p27$2 then 32767bv32 else $27$2);
    $26$1 := (if p25$1 then $27$1 else $26$1);
    $26$2 := (if p25$2 then $27$2 else $26$2);
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
    havoc v160$1, v160$2;
    havoc v161$1, v161$2;
    havoc v162$1, v162$2;
    havoc v163$1, v163$2;
    v164$1 := $$imageSampler$1[0bv32];
    v164$2 := $$imageSampler$2[0bv32];
    v165 := BV32_ASHR($i.0, 2bv32);
    v166$1 := BV32_ADD(BV32_SHL(v1$1, 3bv32), 7bv32);
    v166$2 := BV32_ADD(BV32_SHL(v1$2, 3bv32), 7bv32);
    v167 := BV32_SLT(v165, 0bv32);
    goto $truebb28, $falsebb28;

  $falsebb28:
    assume {:partition} !v167 && !v167;
    v168 := BV32_SGE(v165, 32768bv32);
    goto $truebb29, $falsebb29;

  $falsebb29:
    assume {:partition} !v168 && !v168;
    $29 := v165;
    goto $84;

  $84:
    $28 := $29;
    goto $85;

  $85:
    v169$1 := BV32_SLT(v166$1, 0bv32);
    v169$2 := BV32_SLT(v166$2, 0bv32);
    p28$1 := (if v169$1 then v169$1 else p28$1);
    p28$2 := (if v169$2 then v169$2 else p28$2);
    p29$1 := (if !v169$1 then !v169$1 else p29$1);
    p29$2 := (if !v169$2 then !v169$2 else p29$2);
    $30$1 := (if p28$1 then 0bv32 else $30$1);
    $30$2 := (if p28$2 then 0bv32 else $30$2);
    v170$1 := (if p29$1 then BV32_SGE(v166$1, 32768bv32) else v170$1);
    v170$2 := (if p29$2 then BV32_SGE(v166$2, 32768bv32) else v170$2);
    p31$1 := (if p29$1 && v170$1 then v170$1 else p31$1);
    p31$2 := (if p29$2 && v170$2 then v170$2 else p31$2);
    p30$1 := (if p29$1 && !v170$1 then !v170$1 else p30$1);
    p30$2 := (if p29$2 && !v170$2 then !v170$2 else p30$2);
    $31$1 := (if p30$1 then v166$1 else $31$1);
    $31$2 := (if p30$2 then v166$2 else $31$2);
    $31$1 := (if p31$1 then 32767bv32 else $31$1);
    $31$2 := (if p31$2 then 32767bv32 else $31$2);
    $30$1 := (if p29$1 then $31$1 else $30$1);
    $30$2 := (if p29$2 then $31$2 else $30$2);
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
    havoc v182$1, v182$2;
    havoc v183$1, v183$2;
    havoc v184$1, v184$2;
    havoc v185$1, v185$2;
    havoc v186$1, v186$2;
    v187$1 := $$imageSampler$1[0bv32];
    v187$2 := $$imageSampler$2[0bv32];
    v188$1 := BV32_SLT(v0$1, 0bv32);
    v188$2 := BV32_SLT(v0$2, 0bv32);
    p32$1 := (if v188$1 then v188$1 else p32$1);
    p32$2 := (if v188$2 then v188$2 else p32$2);
    p33$1 := (if !v188$1 then !v188$1 else p33$1);
    p33$2 := (if !v188$2 then !v188$2 else p33$2);
    $32$1 := (if p32$1 then 0bv32 else $32$1);
    $32$2 := (if p32$2 then 0bv32 else $32$2);
    v189$1 := (if p33$1 then BV32_SGE(v0$1, 32768bv32) else v189$1);
    v189$2 := (if p33$2 then BV32_SGE(v0$2, 32768bv32) else v189$2);
    p35$1 := (if p33$1 && v189$1 then v189$1 else p35$1);
    p35$2 := (if p33$2 && v189$2 then v189$2 else p35$2);
    p34$1 := (if p33$1 && !v189$1 then !v189$1 else p34$1);
    p34$2 := (if p33$2 && !v189$2 then !v189$2 else p34$2);
    $33$1 := (if p34$1 then v0$1 else $33$1);
    $33$2 := (if p34$2 then v0$2 else $33$2);
    $33$1 := (if p35$1 then 32767bv32 else $33$1);
    $33$2 := (if p35$2 then 32767bv32 else $33$2);
    $32$1 := (if p33$1 then $33$1 else $32$1);
    $32$2 := (if p33$2 then $33$2 else $32$2);
    v190 := BV32_SLT($i.0, 0bv32);
    goto $truebb34, $falsebb34;

  $falsebb34:
    assume {:partition} !v190 && !v190;
    v191 := BV32_SGE($i.0, 32768bv32);
    goto $truebb35, $falsebb35;

  $falsebb35:
    assume {:partition} !v191 && !v191;
    $35 := $i.0;
    goto $101;

  $101:
    $34 := $35;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit40;

  $_Z11read_imagefPU3AS1vjDv2_i.exit40:
    havoc v192$1, v192$2;
    havoc v193$1, v193$2;
    havoc v194$1, v194$2;
    havoc v195$1, v195$2;
    havoc v196$1, v196$2;
    havoc v197$1, v197$2;
    havoc v198$1, v198$2;
    havoc v199$1, v199$2;
    havoc v200$1, v200$2;
    havoc v201$1, v201$2;
    havoc v202$1, v202$2;
    havoc v203$1, v203$2;
    havoc v204$1, v204$2;
    havoc v205$1, v205$2;
    havoc v206$1, v206$2;
    havoc v207$1, v207$2;
    v208$1 := $$imageSampler$1[0bv32];
    v208$2 := $$imageSampler$2[0bv32];
    v209 := BV32_ADD($i.0, 1bv32);
    v210$1 := BV32_SLT(v0$1, 0bv32);
    v210$2 := BV32_SLT(v0$2, 0bv32);
    p36$1 := (if v210$1 then v210$1 else p36$1);
    p36$2 := (if v210$2 then v210$2 else p36$2);
    p37$1 := (if !v210$1 then !v210$1 else p37$1);
    p37$2 := (if !v210$2 then !v210$2 else p37$2);
    $36$1 := (if p36$1 then 0bv32 else $36$1);
    $36$2 := (if p36$2 then 0bv32 else $36$2);
    v211$1 := (if p37$1 then BV32_SGE(v0$1, 32768bv32) else v211$1);
    v211$2 := (if p37$2 then BV32_SGE(v0$2, 32768bv32) else v211$2);
    p39$1 := (if p37$1 && v211$1 then v211$1 else p39$1);
    p39$2 := (if p37$2 && v211$2 then v211$2 else p39$2);
    p38$1 := (if p37$1 && !v211$1 then !v211$1 else p38$1);
    p38$2 := (if p37$2 && !v211$2 then !v211$2 else p38$2);
    $37$1 := (if p38$1 then v0$1 else $37$1);
    $37$2 := (if p38$2 then v0$2 else $37$2);
    $37$1 := (if p39$1 then 32767bv32 else $37$1);
    $37$2 := (if p39$2 then 32767bv32 else $37$2);
    $36$1 := (if p37$1 then $37$1 else $36$1);
    $36$2 := (if p37$2 then $37$2 else $36$2);
    v212 := BV32_SLT(v209, 0bv32);
    goto $truebb38, $falsebb38;

  $falsebb38:
    assume {:partition} !v212 && !v212;
    v213 := BV32_SGE(v209, 32768bv32);
    goto $truebb39, $falsebb39;

  $falsebb39:
    assume {:partition} !v213 && !v213;
    $39 := v209;
    goto $112;

  $112:
    $38 := $39;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit36;

  $_Z11read_imagefPU3AS1vjDv2_i.exit36:
    havoc v214$1, v214$2;
    havoc v215$1, v215$2;
    havoc v216$1, v216$2;
    havoc v217$1, v217$2;
    havoc v218$1, v218$2;
    havoc v219$1, v219$2;
    havoc v220$1, v220$2;
    havoc v221$1, v221$2;
    havoc v222$1, v222$2;
    havoc v223$1, v223$2;
    havoc v224$1, v224$2;
    havoc v225$1, v225$2;
    havoc v226$1, v226$2;
    havoc v227$1, v227$2;
    havoc v228$1, v228$2;
    havoc v229$1, v229$2;
    v230$1 := $$imageSampler$1[0bv32];
    v230$2 := $$imageSampler$2[0bv32];
    v231 := BV32_ADD($i.0, 2bv32);
    v232$1 := BV32_SLT(v0$1, 0bv32);
    v232$2 := BV32_SLT(v0$2, 0bv32);
    p40$1 := (if v232$1 then v232$1 else p40$1);
    p40$2 := (if v232$2 then v232$2 else p40$2);
    p41$1 := (if !v232$1 then !v232$1 else p41$1);
    p41$2 := (if !v232$2 then !v232$2 else p41$2);
    $40$1 := (if p40$1 then 0bv32 else $40$1);
    $40$2 := (if p40$2 then 0bv32 else $40$2);
    v233$1 := (if p41$1 then BV32_SGE(v0$1, 32768bv32) else v233$1);
    v233$2 := (if p41$2 then BV32_SGE(v0$2, 32768bv32) else v233$2);
    p43$1 := (if p41$1 && v233$1 then v233$1 else p43$1);
    p43$2 := (if p41$2 && v233$2 then v233$2 else p43$2);
    p42$1 := (if p41$1 && !v233$1 then !v233$1 else p42$1);
    p42$2 := (if p41$2 && !v233$2 then !v233$2 else p42$2);
    $41$1 := (if p42$1 then v0$1 else $41$1);
    $41$2 := (if p42$2 then v0$2 else $41$2);
    $41$1 := (if p43$1 then 32767bv32 else $41$1);
    $41$2 := (if p43$2 then 32767bv32 else $41$2);
    $40$1 := (if p41$1 then $41$1 else $40$1);
    $40$2 := (if p41$2 then $41$2 else $40$2);
    v234 := BV32_SLT(v231, 0bv32);
    goto $truebb42, $falsebb42;

  $falsebb42:
    assume {:partition} !v234 && !v234;
    v235 := BV32_SGE(v231, 32768bv32);
    goto $truebb43, $falsebb43;

  $falsebb43:
    assume {:partition} !v235 && !v235;
    $43 := v231;
    goto $123;

  $123:
    $42 := $43;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit32;

  $_Z11read_imagefPU3AS1vjDv2_i.exit32:
    havoc v236$1, v236$2;
    havoc v237$1, v237$2;
    havoc v238$1, v238$2;
    havoc v239$1, v239$2;
    havoc v240$1, v240$2;
    havoc v241$1, v241$2;
    havoc v242$1, v242$2;
    havoc v243$1, v243$2;
    havoc v244$1, v244$2;
    havoc v245$1, v245$2;
    havoc v246$1, v246$2;
    havoc v247$1, v247$2;
    havoc v248$1, v248$2;
    havoc v249$1, v249$2;
    havoc v250$1, v250$2;
    havoc v251$1, v251$2;
    v252$1 := $$imageSampler$1[0bv32];
    v252$2 := $$imageSampler$2[0bv32];
    v253 := BV32_ADD($i.0, 3bv32);
    v254$1 := BV32_SLT(v0$1, 0bv32);
    v254$2 := BV32_SLT(v0$2, 0bv32);
    p44$1 := (if v254$1 then v254$1 else p44$1);
    p44$2 := (if v254$2 then v254$2 else p44$2);
    p45$1 := (if !v254$1 then !v254$1 else p45$1);
    p45$2 := (if !v254$2 then !v254$2 else p45$2);
    $44$1 := (if p44$1 then 0bv32 else $44$1);
    $44$2 := (if p44$2 then 0bv32 else $44$2);
    v255$1 := (if p45$1 then BV32_SGE(v0$1, 32768bv32) else v255$1);
    v255$2 := (if p45$2 then BV32_SGE(v0$2, 32768bv32) else v255$2);
    p47$1 := (if p45$1 && v255$1 then v255$1 else p47$1);
    p47$2 := (if p45$2 && v255$2 then v255$2 else p47$2);
    p46$1 := (if p45$1 && !v255$1 then !v255$1 else p46$1);
    p46$2 := (if p45$2 && !v255$2 then !v255$2 else p46$2);
    $45$1 := (if p46$1 then v0$1 else $45$1);
    $45$2 := (if p46$2 then v0$2 else $45$2);
    $45$1 := (if p47$1 then 32767bv32 else $45$1);
    $45$2 := (if p47$2 then 32767bv32 else $45$2);
    $44$1 := (if p45$1 then $45$1 else $44$1);
    $44$2 := (if p45$2 then $45$2 else $44$2);
    v256 := BV32_SLT(v253, 0bv32);
    goto $truebb46, $falsebb46;

  $falsebb46:
    assume {:partition} !v256 && !v256;
    v257 := BV32_SGE(v253, 32768bv32);
    goto $truebb47, $falsebb47;

  $falsebb47:
    assume {:partition} !v257 && !v257;
    $47 := v253;
    goto $134;

  $134:
    $46 := $47;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit28;

  $_Z11read_imagefPU3AS1vjDv2_i.exit28:
    havoc v258$1, v258$2;
    havoc v259$1, v259$2;
    havoc v260$1, v260$2;
    havoc v261$1, v261$2;
    havoc v262$1, v262$2;
    havoc v263$1, v263$2;
    havoc v264$1, v264$2;
    havoc v265$1, v265$2;
    havoc v266$1, v266$2;
    havoc v267$1, v267$2;
    havoc v268$1, v268$2;
    havoc v269$1, v269$2;
    havoc v270$1, v270$2;
    havoc v271$1, v271$2;
    havoc v272$1, v272$2;
    havoc v273$1, v273$2;
    v274$1 := v25$1 ++ v24$1 ++ v23$1 ++ v22$1;
    v274$2 := v25$2 ++ v24$2 ++ v23$2 ++ v22$2;
    v275$1 := $sum0.0$1[64:32];
    v275$2 := $sum0.0$2[64:32];
    v276$1 := $sum0.0$1[96:64];
    v276$2 := $sum0.0$2[96:64];
    v277$1 := v207$1 ++ v206$1 ++ v205$1 ++ v204$1;
    v277$2 := v207$2 ++ v206$2 ++ v205$2 ++ v204$2;
    v278$1 := v229$1 ++ v228$1 ++ v227$1 ++ v226$1;
    v278$2 := v229$2 ++ v228$2 ++ v227$2 ++ v226$2;
    v279$1 := v251$1 ++ v250$1 ++ v249$1 ++ v248$1;
    v279$2 := v251$2 ++ v250$2 ++ v249$2 ++ v248$2;
    v280$1 := v273$1 ++ v272$1 ++ v271$1 ++ v270$1;
    v280$2 := v273$2 ++ v272$2 ++ v271$2 ++ v270$2;
    v281$1 := $sum0.0$1[128:96];
    v281$2 := $sum0.0$2[128:96];
    v282$1 := v48$1 ++ v47$1 ++ v46$1 ++ v45$1;
    v282$2 := v48$2 ++ v47$2 ++ v46$2 ++ v45$2;
    v283$1 := $sum1.0$1[64:32];
    v283$2 := $sum1.0$2[64:32];
    v284$1 := $sum1.0$1[96:64];
    v284$2 := $sum1.0$2[96:64];
    v285$1 := $sum1.0$1[128:96];
    v285$2 := $sum1.0$2[128:96];
    v286$1 := v71$1 ++ v70$1 ++ v69$1 ++ v68$1;
    v286$2 := v71$2 ++ v70$2 ++ v69$2 ++ v68$2;
    v287$1 := $sum2.0$1[64:32];
    v287$2 := $sum2.0$2[64:32];
    v288$1 := $sum2.0$1[96:64];
    v288$2 := $sum2.0$2[96:64];
    v289$1 := $sum2.0$1[128:96];
    v289$2 := $sum2.0$2[128:96];
    v290$1 := v94$1 ++ v93$1 ++ v92$1 ++ v91$1;
    v290$2 := v94$2 ++ v93$2 ++ v92$2 ++ v91$2;
    v291$1 := $sum3.0$1[64:32];
    v291$2 := $sum3.0$2[64:32];
    v292$1 := $sum3.0$1[96:64];
    v292$2 := $sum3.0$2[96:64];
    v293$1 := $sum3.0$1[128:96];
    v293$2 := $sum3.0$2[128:96];
    v294$1 := v117$1 ++ v116$1 ++ v115$1 ++ v114$1;
    v294$2 := v117$2 ++ v116$2 ++ v115$2 ++ v114$2;
    v295$1 := $sum4.0$1[64:32];
    v295$2 := $sum4.0$2[64:32];
    v296$1 := $sum4.0$1[96:64];
    v296$2 := $sum4.0$2[96:64];
    v297$1 := $sum4.0$1[128:96];
    v297$2 := $sum4.0$2[128:96];
    v298$1 := v140$1 ++ v139$1 ++ v138$1 ++ v137$1;
    v298$2 := v140$2 ++ v139$2 ++ v138$2 ++ v137$2;
    v299$1 := $sum5.0$1[64:32];
    v299$2 := $sum5.0$2[64:32];
    v300$1 := $sum5.0$1[96:64];
    v300$2 := $sum5.0$2[96:64];
    v301$1 := $sum5.0$1[128:96];
    v301$2 := $sum5.0$2[128:96];
    v302$1 := v163$1 ++ v162$1 ++ v161$1 ++ v160$1;
    v302$2 := v163$2 ++ v162$2 ++ v161$2 ++ v160$2;
    v303$1 := $sum6.0$1[64:32];
    v303$2 := $sum6.0$2[64:32];
    v304$1 := $sum6.0$1[96:64];
    v304$2 := $sum6.0$2[96:64];
    v305$1 := $sum6.0$1[128:96];
    v305$2 := $sum6.0$2[128:96];
    v306$1 := v186$1 ++ v185$1 ++ v184$1 ++ v183$1;
    v306$2 := v186$2 ++ v185$2 ++ v184$2 ++ v183$2;
    v307$1 := $sum7.0$1[64:32];
    v307$2 := $sum7.0$2[64:32];
    v308$1 := $sum7.0$1[96:64];
    v308$2 := $sum7.0$2[96:64];
    v309$1 := $sum7.0$1[128:96];
    v309$2 := $sum7.0$2[128:96];
    $sum0.0$1, $sum1.0$1, $sum2.0$1, $sum3.0$1, $sum4.0$1, $sum5.0$1, $sum6.0$1, $sum7.0$1, $i.0 := FADD32(v281$1, FADD32(FMUL32(v274$1, v280$1), FADD32(FMUL32(v21$1 ++ v20$1 ++ v19$1 ++ v18$1, v279$1), FADD32(FMUL32(v13$1 ++ v12$1 ++ v11$1 ++ v10$1, v277$1), FMUL32(v17$1 ++ v16$1 ++ v15$1 ++ v14$1, v278$1))))) ++ FADD32(v276$1, FADD32(FMUL32(v274$1, v269$1 ++ v268$1 ++ v267$1 ++ v266$1), FADD32(FMUL32(v21$1 ++ v20$1 ++ v19$1 ++ v18$1, v247$1 ++ v246$1 ++ v245$1 ++ v244$1), FADD32(FMUL32(v13$1 ++ v12$1 ++ v11$1 ++ v10$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v17$1 ++ v16$1 ++ v15$1 ++ v14$1, v225$1 ++ v224$1 ++ v223$1 ++ v222$1))))) ++ FADD32(v275$1, FADD32(FMUL32(v274$1, v265$1 ++ v264$1 ++ v263$1 ++ v262$1), FADD32(FMUL32(v21$1 ++ v20$1 ++ v19$1 ++ v18$1, v243$1 ++ v242$1 ++ v241$1 ++ v240$1), FADD32(FMUL32(v13$1 ++ v12$1 ++ v11$1 ++ v10$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v17$1 ++ v16$1 ++ v15$1 ++ v14$1, v221$1 ++ v220$1 ++ v219$1 ++ v218$1))))) ++ FADD32($sum0.0$1[32:0], FADD32(FMUL32(v274$1, v261$1 ++ v260$1 ++ v259$1 ++ v258$1), FADD32(FMUL32(v21$1 ++ v20$1 ++ v19$1 ++ v18$1, v239$1 ++ v238$1 ++ v237$1 ++ v236$1), FADD32(FMUL32(v13$1 ++ v12$1 ++ v11$1 ++ v10$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v17$1 ++ v16$1 ++ v15$1 ++ v14$1, v217$1 ++ v216$1 ++ v215$1 ++ v214$1))))), FADD32(v285$1, FADD32(FMUL32(v282$1, v280$1), FADD32(FMUL32(v44$1 ++ v43$1 ++ v42$1 ++ v41$1, v279$1), FADD32(FMUL32(v36$1 ++ v35$1 ++ v34$1 ++ v33$1, v277$1), FMUL32(v40$1 ++ v39$1 ++ v38$1 ++ v37$1, v278$1))))) ++ FADD32(v284$1, FADD32(FMUL32(v282$1, v269$1 ++ v268$1 ++ v267$1 ++ v266$1), FADD32(FMUL32(v44$1 ++ v43$1 ++ v42$1 ++ v41$1, v247$1 ++ v246$1 ++ v245$1 ++ v244$1), FADD32(FMUL32(v36$1 ++ v35$1 ++ v34$1 ++ v33$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v40$1 ++ v39$1 ++ v38$1 ++ v37$1, v225$1 ++ v224$1 ++ v223$1 ++ v222$1))))) ++ FADD32(v283$1, FADD32(FMUL32(v282$1, v265$1 ++ v264$1 ++ v263$1 ++ v262$1), FADD32(FMUL32(v44$1 ++ v43$1 ++ v42$1 ++ v41$1, v243$1 ++ v242$1 ++ v241$1 ++ v240$1), FADD32(FMUL32(v36$1 ++ v35$1 ++ v34$1 ++ v33$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v40$1 ++ v39$1 ++ v38$1 ++ v37$1, v221$1 ++ v220$1 ++ v219$1 ++ v218$1))))) ++ FADD32($sum1.0$1[32:0], FADD32(FMUL32(v282$1, v261$1 ++ v260$1 ++ v259$1 ++ v258$1), FADD32(FMUL32(v44$1 ++ v43$1 ++ v42$1 ++ v41$1, v239$1 ++ v238$1 ++ v237$1 ++ v236$1), FADD32(FMUL32(v36$1 ++ v35$1 ++ v34$1 ++ v33$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v40$1 ++ v39$1 ++ v38$1 ++ v37$1, v217$1 ++ v216$1 ++ v215$1 ++ v214$1))))), FADD32(v289$1, FADD32(FMUL32(v286$1, v280$1), FADD32(FMUL32(v67$1 ++ v66$1 ++ v65$1 ++ v64$1, v279$1), FADD32(FMUL32(v59$1 ++ v58$1 ++ v57$1 ++ v56$1, v277$1), FMUL32(v63$1 ++ v62$1 ++ v61$1 ++ v60$1, v278$1))))) ++ FADD32(v288$1, FADD32(FMUL32(v286$1, v269$1 ++ v268$1 ++ v267$1 ++ v266$1), FADD32(FMUL32(v67$1 ++ v66$1 ++ v65$1 ++ v64$1, v247$1 ++ v246$1 ++ v245$1 ++ v244$1), FADD32(FMUL32(v59$1 ++ v58$1 ++ v57$1 ++ v56$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v63$1 ++ v62$1 ++ v61$1 ++ v60$1, v225$1 ++ v224$1 ++ v223$1 ++ v222$1))))) ++ FADD32(v287$1, FADD32(FMUL32(v286$1, v265$1 ++ v264$1 ++ v263$1 ++ v262$1), FADD32(FMUL32(v67$1 ++ v66$1 ++ v65$1 ++ v64$1, v243$1 ++ v242$1 ++ v241$1 ++ v240$1), FADD32(FMUL32(v59$1 ++ v58$1 ++ v57$1 ++ v56$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v63$1 ++ v62$1 ++ v61$1 ++ v60$1, v221$1 ++ v220$1 ++ v219$1 ++ v218$1))))) ++ FADD32($sum2.0$1[32:0], FADD32(FMUL32(v286$1, v261$1 ++ v260$1 ++ v259$1 ++ v258$1), FADD32(FMUL32(v67$1 ++ v66$1 ++ v65$1 ++ v64$1, v239$1 ++ v238$1 ++ v237$1 ++ v236$1), FADD32(FMUL32(v59$1 ++ v58$1 ++ v57$1 ++ v56$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v63$1 ++ v62$1 ++ v61$1 ++ v60$1, v217$1 ++ v216$1 ++ v215$1 ++ v214$1))))), FADD32(v293$1, FADD32(FMUL32(v290$1, v280$1), FADD32(FMUL32(v90$1 ++ v89$1 ++ v88$1 ++ v87$1, v279$1), FADD32(FMUL32(v82$1 ++ v81$1 ++ v80$1 ++ v79$1, v277$1), FMUL32(v86$1 ++ v85$1 ++ v84$1 ++ v83$1, v278$1))))) ++ FADD32(v292$1, FADD32(FMUL32(v290$1, v269$1 ++ v268$1 ++ v267$1 ++ v266$1), FADD32(FMUL32(v90$1 ++ v89$1 ++ v88$1 ++ v87$1, v247$1 ++ v246$1 ++ v245$1 ++ v244$1), FADD32(FMUL32(v82$1 ++ v81$1 ++ v80$1 ++ v79$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v86$1 ++ v85$1 ++ v84$1 ++ v83$1, v225$1 ++ v224$1 ++ v223$1 ++ v222$1))))) ++ FADD32(v291$1, FADD32(FMUL32(v290$1, v265$1 ++ v264$1 ++ v263$1 ++ v262$1), FADD32(FMUL32(v90$1 ++ v89$1 ++ v88$1 ++ v87$1, v243$1 ++ v242$1 ++ v241$1 ++ v240$1), FADD32(FMUL32(v82$1 ++ v81$1 ++ v80$1 ++ v79$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v86$1 ++ v85$1 ++ v84$1 ++ v83$1, v221$1 ++ v220$1 ++ v219$1 ++ v218$1))))) ++ FADD32($sum3.0$1[32:0], FADD32(FMUL32(v290$1, v261$1 ++ v260$1 ++ v259$1 ++ v258$1), FADD32(FMUL32(v90$1 ++ v89$1 ++ v88$1 ++ v87$1, v239$1 ++ v238$1 ++ v237$1 ++ v236$1), FADD32(FMUL32(v82$1 ++ v81$1 ++ v80$1 ++ v79$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v86$1 ++ v85$1 ++ v84$1 ++ v83$1, v217$1 ++ v216$1 ++ v215$1 ++ v214$1))))), FADD32(v297$1, FADD32(FMUL32(v294$1, v280$1), FADD32(FMUL32(v113$1 ++ v112$1 ++ v111$1 ++ v110$1, v279$1), FADD32(FMUL32(v105$1 ++ v104$1 ++ v103$1 ++ v102$1, v277$1), FMUL32(v109$1 ++ v108$1 ++ v107$1 ++ v106$1, v278$1))))) ++ FADD32(v296$1, FADD32(FMUL32(v294$1, v269$1 ++ v268$1 ++ v267$1 ++ v266$1), FADD32(FMUL32(v113$1 ++ v112$1 ++ v111$1 ++ v110$1, v247$1 ++ v246$1 ++ v245$1 ++ v244$1), FADD32(FMUL32(v105$1 ++ v104$1 ++ v103$1 ++ v102$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v109$1 ++ v108$1 ++ v107$1 ++ v106$1, v225$1 ++ v224$1 ++ v223$1 ++ v222$1))))) ++ FADD32(v295$1, FADD32(FMUL32(v294$1, v265$1 ++ v264$1 ++ v263$1 ++ v262$1), FADD32(FMUL32(v113$1 ++ v112$1 ++ v111$1 ++ v110$1, v243$1 ++ v242$1 ++ v241$1 ++ v240$1), FADD32(FMUL32(v105$1 ++ v104$1 ++ v103$1 ++ v102$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v109$1 ++ v108$1 ++ v107$1 ++ v106$1, v221$1 ++ v220$1 ++ v219$1 ++ v218$1))))) ++ FADD32($sum4.0$1[32:0], FADD32(FMUL32(v294$1, v261$1 ++ v260$1 ++ v259$1 ++ v258$1), FADD32(FMUL32(v113$1 ++ v112$1 ++ v111$1 ++ v110$1, v239$1 ++ v238$1 ++ v237$1 ++ v236$1), FADD32(FMUL32(v105$1 ++ v104$1 ++ v103$1 ++ v102$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v109$1 ++ v108$1 ++ v107$1 ++ v106$1, v217$1 ++ v216$1 ++ v215$1 ++ v214$1))))), FADD32(v301$1, FADD32(FMUL32(v298$1, v280$1), FADD32(FMUL32(v136$1 ++ v135$1 ++ v134$1 ++ v133$1, v279$1), FADD32(FMUL32(v128$1 ++ v127$1 ++ v126$1 ++ v125$1, v277$1), FMUL32(v132$1 ++ v131$1 ++ v130$1 ++ v129$1, v278$1))))) ++ FADD32(v300$1, FADD32(FMUL32(v298$1, v269$1 ++ v268$1 ++ v267$1 ++ v266$1), FADD32(FMUL32(v136$1 ++ v135$1 ++ v134$1 ++ v133$1, v247$1 ++ v246$1 ++ v245$1 ++ v244$1), FADD32(FMUL32(v128$1 ++ v127$1 ++ v126$1 ++ v125$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v132$1 ++ v131$1 ++ v130$1 ++ v129$1, v225$1 ++ v224$1 ++ v223$1 ++ v222$1))))) ++ FADD32(v299$1, FADD32(FMUL32(v298$1, v265$1 ++ v264$1 ++ v263$1 ++ v262$1), FADD32(FMUL32(v136$1 ++ v135$1 ++ v134$1 ++ v133$1, v243$1 ++ v242$1 ++ v241$1 ++ v240$1), FADD32(FMUL32(v128$1 ++ v127$1 ++ v126$1 ++ v125$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v132$1 ++ v131$1 ++ v130$1 ++ v129$1, v221$1 ++ v220$1 ++ v219$1 ++ v218$1))))) ++ FADD32($sum5.0$1[32:0], FADD32(FMUL32(v298$1, v261$1 ++ v260$1 ++ v259$1 ++ v258$1), FADD32(FMUL32(v136$1 ++ v135$1 ++ v134$1 ++ v133$1, v239$1 ++ v238$1 ++ v237$1 ++ v236$1), FADD32(FMUL32(v128$1 ++ v127$1 ++ v126$1 ++ v125$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v132$1 ++ v131$1 ++ v130$1 ++ v129$1, v217$1 ++ v216$1 ++ v215$1 ++ v214$1))))), FADD32(v305$1, FADD32(FMUL32(v302$1, v280$1), FADD32(FMUL32(v159$1 ++ v158$1 ++ v157$1 ++ v156$1, v279$1), FADD32(FMUL32(v151$1 ++ v150$1 ++ v149$1 ++ v148$1, v277$1), FMUL32(v155$1 ++ v154$1 ++ v153$1 ++ v152$1, v278$1))))) ++ FADD32(v304$1, FADD32(FMUL32(v302$1, v269$1 ++ v268$1 ++ v267$1 ++ v266$1), FADD32(FMUL32(v159$1 ++ v158$1 ++ v157$1 ++ v156$1, v247$1 ++ v246$1 ++ v245$1 ++ v244$1), FADD32(FMUL32(v151$1 ++ v150$1 ++ v149$1 ++ v148$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v155$1 ++ v154$1 ++ v153$1 ++ v152$1, v225$1 ++ v224$1 ++ v223$1 ++ v222$1))))) ++ FADD32(v303$1, FADD32(FMUL32(v302$1, v265$1 ++ v264$1 ++ v263$1 ++ v262$1), FADD32(FMUL32(v159$1 ++ v158$1 ++ v157$1 ++ v156$1, v243$1 ++ v242$1 ++ v241$1 ++ v240$1), FADD32(FMUL32(v151$1 ++ v150$1 ++ v149$1 ++ v148$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v155$1 ++ v154$1 ++ v153$1 ++ v152$1, v221$1 ++ v220$1 ++ v219$1 ++ v218$1))))) ++ FADD32($sum6.0$1[32:0], FADD32(FMUL32(v302$1, v261$1 ++ v260$1 ++ v259$1 ++ v258$1), FADD32(FMUL32(v159$1 ++ v158$1 ++ v157$1 ++ v156$1, v239$1 ++ v238$1 ++ v237$1 ++ v236$1), FADD32(FMUL32(v151$1 ++ v150$1 ++ v149$1 ++ v148$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v155$1 ++ v154$1 ++ v153$1 ++ v152$1, v217$1 ++ v216$1 ++ v215$1 ++ v214$1))))), FADD32(v309$1, FADD32(FMUL32(v306$1, v280$1), FADD32(FMUL32(v182$1 ++ v181$1 ++ v180$1 ++ v179$1, v279$1), FADD32(FMUL32(v174$1 ++ v173$1 ++ v172$1 ++ v171$1, v277$1), FMUL32(v178$1 ++ v177$1 ++ v176$1 ++ v175$1, v278$1))))) ++ FADD32(v308$1, FADD32(FMUL32(v306$1, v269$1 ++ v268$1 ++ v267$1 ++ v266$1), FADD32(FMUL32(v182$1 ++ v181$1 ++ v180$1 ++ v179$1, v247$1 ++ v246$1 ++ v245$1 ++ v244$1), FADD32(FMUL32(v174$1 ++ v173$1 ++ v172$1 ++ v171$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v178$1 ++ v177$1 ++ v176$1 ++ v175$1, v225$1 ++ v224$1 ++ v223$1 ++ v222$1))))) ++ FADD32(v307$1, FADD32(FMUL32(v306$1, v265$1 ++ v264$1 ++ v263$1 ++ v262$1), FADD32(FMUL32(v182$1 ++ v181$1 ++ v180$1 ++ v179$1, v243$1 ++ v242$1 ++ v241$1 ++ v240$1), FADD32(FMUL32(v174$1 ++ v173$1 ++ v172$1 ++ v171$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v178$1 ++ v177$1 ++ v176$1 ++ v175$1, v221$1 ++ v220$1 ++ v219$1 ++ v218$1))))) ++ FADD32($sum7.0$1[32:0], FADD32(FMUL32(v306$1, v261$1 ++ v260$1 ++ v259$1 ++ v258$1), FADD32(FMUL32(v182$1 ++ v181$1 ++ v180$1 ++ v179$1, v239$1 ++ v238$1 ++ v237$1 ++ v236$1), FADD32(FMUL32(v174$1 ++ v173$1 ++ v172$1 ++ v171$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v178$1 ++ v177$1 ++ v176$1 ++ v175$1, v217$1 ++ v216$1 ++ v215$1 ++ v214$1))))), BV32_ADD($i.0, 4bv32);
    $sum0.0$2, $sum1.0$2, $sum2.0$2, $sum3.0$2, $sum4.0$2, $sum5.0$2, $sum6.0$2, $sum7.0$2 := FADD32(v281$2, FADD32(FMUL32(v274$2, v280$2), FADD32(FMUL32(v21$2 ++ v20$2 ++ v19$2 ++ v18$2, v279$2), FADD32(FMUL32(v13$2 ++ v12$2 ++ v11$2 ++ v10$2, v277$2), FMUL32(v17$2 ++ v16$2 ++ v15$2 ++ v14$2, v278$2))))) ++ FADD32(v276$2, FADD32(FMUL32(v274$2, v269$2 ++ v268$2 ++ v267$2 ++ v266$2), FADD32(FMUL32(v21$2 ++ v20$2 ++ v19$2 ++ v18$2, v247$2 ++ v246$2 ++ v245$2 ++ v244$2), FADD32(FMUL32(v13$2 ++ v12$2 ++ v11$2 ++ v10$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v17$2 ++ v16$2 ++ v15$2 ++ v14$2, v225$2 ++ v224$2 ++ v223$2 ++ v222$2))))) ++ FADD32(v275$2, FADD32(FMUL32(v274$2, v265$2 ++ v264$2 ++ v263$2 ++ v262$2), FADD32(FMUL32(v21$2 ++ v20$2 ++ v19$2 ++ v18$2, v243$2 ++ v242$2 ++ v241$2 ++ v240$2), FADD32(FMUL32(v13$2 ++ v12$2 ++ v11$2 ++ v10$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v17$2 ++ v16$2 ++ v15$2 ++ v14$2, v221$2 ++ v220$2 ++ v219$2 ++ v218$2))))) ++ FADD32($sum0.0$2[32:0], FADD32(FMUL32(v274$2, v261$2 ++ v260$2 ++ v259$2 ++ v258$2), FADD32(FMUL32(v21$2 ++ v20$2 ++ v19$2 ++ v18$2, v239$2 ++ v238$2 ++ v237$2 ++ v236$2), FADD32(FMUL32(v13$2 ++ v12$2 ++ v11$2 ++ v10$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v17$2 ++ v16$2 ++ v15$2 ++ v14$2, v217$2 ++ v216$2 ++ v215$2 ++ v214$2))))), FADD32(v285$2, FADD32(FMUL32(v282$2, v280$2), FADD32(FMUL32(v44$2 ++ v43$2 ++ v42$2 ++ v41$2, v279$2), FADD32(FMUL32(v36$2 ++ v35$2 ++ v34$2 ++ v33$2, v277$2), FMUL32(v40$2 ++ v39$2 ++ v38$2 ++ v37$2, v278$2))))) ++ FADD32(v284$2, FADD32(FMUL32(v282$2, v269$2 ++ v268$2 ++ v267$2 ++ v266$2), FADD32(FMUL32(v44$2 ++ v43$2 ++ v42$2 ++ v41$2, v247$2 ++ v246$2 ++ v245$2 ++ v244$2), FADD32(FMUL32(v36$2 ++ v35$2 ++ v34$2 ++ v33$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v40$2 ++ v39$2 ++ v38$2 ++ v37$2, v225$2 ++ v224$2 ++ v223$2 ++ v222$2))))) ++ FADD32(v283$2, FADD32(FMUL32(v282$2, v265$2 ++ v264$2 ++ v263$2 ++ v262$2), FADD32(FMUL32(v44$2 ++ v43$2 ++ v42$2 ++ v41$2, v243$2 ++ v242$2 ++ v241$2 ++ v240$2), FADD32(FMUL32(v36$2 ++ v35$2 ++ v34$2 ++ v33$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v40$2 ++ v39$2 ++ v38$2 ++ v37$2, v221$2 ++ v220$2 ++ v219$2 ++ v218$2))))) ++ FADD32($sum1.0$2[32:0], FADD32(FMUL32(v282$2, v261$2 ++ v260$2 ++ v259$2 ++ v258$2), FADD32(FMUL32(v44$2 ++ v43$2 ++ v42$2 ++ v41$2, v239$2 ++ v238$2 ++ v237$2 ++ v236$2), FADD32(FMUL32(v36$2 ++ v35$2 ++ v34$2 ++ v33$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v40$2 ++ v39$2 ++ v38$2 ++ v37$2, v217$2 ++ v216$2 ++ v215$2 ++ v214$2))))), FADD32(v289$2, FADD32(FMUL32(v286$2, v280$2), FADD32(FMUL32(v67$2 ++ v66$2 ++ v65$2 ++ v64$2, v279$2), FADD32(FMUL32(v59$2 ++ v58$2 ++ v57$2 ++ v56$2, v277$2), FMUL32(v63$2 ++ v62$2 ++ v61$2 ++ v60$2, v278$2))))) ++ FADD32(v288$2, FADD32(FMUL32(v286$2, v269$2 ++ v268$2 ++ v267$2 ++ v266$2), FADD32(FMUL32(v67$2 ++ v66$2 ++ v65$2 ++ v64$2, v247$2 ++ v246$2 ++ v245$2 ++ v244$2), FADD32(FMUL32(v59$2 ++ v58$2 ++ v57$2 ++ v56$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v63$2 ++ v62$2 ++ v61$2 ++ v60$2, v225$2 ++ v224$2 ++ v223$2 ++ v222$2))))) ++ FADD32(v287$2, FADD32(FMUL32(v286$2, v265$2 ++ v264$2 ++ v263$2 ++ v262$2), FADD32(FMUL32(v67$2 ++ v66$2 ++ v65$2 ++ v64$2, v243$2 ++ v242$2 ++ v241$2 ++ v240$2), FADD32(FMUL32(v59$2 ++ v58$2 ++ v57$2 ++ v56$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v63$2 ++ v62$2 ++ v61$2 ++ v60$2, v221$2 ++ v220$2 ++ v219$2 ++ v218$2))))) ++ FADD32($sum2.0$2[32:0], FADD32(FMUL32(v286$2, v261$2 ++ v260$2 ++ v259$2 ++ v258$2), FADD32(FMUL32(v67$2 ++ v66$2 ++ v65$2 ++ v64$2, v239$2 ++ v238$2 ++ v237$2 ++ v236$2), FADD32(FMUL32(v59$2 ++ v58$2 ++ v57$2 ++ v56$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v63$2 ++ v62$2 ++ v61$2 ++ v60$2, v217$2 ++ v216$2 ++ v215$2 ++ v214$2))))), FADD32(v293$2, FADD32(FMUL32(v290$2, v280$2), FADD32(FMUL32(v90$2 ++ v89$2 ++ v88$2 ++ v87$2, v279$2), FADD32(FMUL32(v82$2 ++ v81$2 ++ v80$2 ++ v79$2, v277$2), FMUL32(v86$2 ++ v85$2 ++ v84$2 ++ v83$2, v278$2))))) ++ FADD32(v292$2, FADD32(FMUL32(v290$2, v269$2 ++ v268$2 ++ v267$2 ++ v266$2), FADD32(FMUL32(v90$2 ++ v89$2 ++ v88$2 ++ v87$2, v247$2 ++ v246$2 ++ v245$2 ++ v244$2), FADD32(FMUL32(v82$2 ++ v81$2 ++ v80$2 ++ v79$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v86$2 ++ v85$2 ++ v84$2 ++ v83$2, v225$2 ++ v224$2 ++ v223$2 ++ v222$2))))) ++ FADD32(v291$2, FADD32(FMUL32(v290$2, v265$2 ++ v264$2 ++ v263$2 ++ v262$2), FADD32(FMUL32(v90$2 ++ v89$2 ++ v88$2 ++ v87$2, v243$2 ++ v242$2 ++ v241$2 ++ v240$2), FADD32(FMUL32(v82$2 ++ v81$2 ++ v80$2 ++ v79$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v86$2 ++ v85$2 ++ v84$2 ++ v83$2, v221$2 ++ v220$2 ++ v219$2 ++ v218$2))))) ++ FADD32($sum3.0$2[32:0], FADD32(FMUL32(v290$2, v261$2 ++ v260$2 ++ v259$2 ++ v258$2), FADD32(FMUL32(v90$2 ++ v89$2 ++ v88$2 ++ v87$2, v239$2 ++ v238$2 ++ v237$2 ++ v236$2), FADD32(FMUL32(v82$2 ++ v81$2 ++ v80$2 ++ v79$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v86$2 ++ v85$2 ++ v84$2 ++ v83$2, v217$2 ++ v216$2 ++ v215$2 ++ v214$2))))), FADD32(v297$2, FADD32(FMUL32(v294$2, v280$2), FADD32(FMUL32(v113$2 ++ v112$2 ++ v111$2 ++ v110$2, v279$2), FADD32(FMUL32(v105$2 ++ v104$2 ++ v103$2 ++ v102$2, v277$2), FMUL32(v109$2 ++ v108$2 ++ v107$2 ++ v106$2, v278$2))))) ++ FADD32(v296$2, FADD32(FMUL32(v294$2, v269$2 ++ v268$2 ++ v267$2 ++ v266$2), FADD32(FMUL32(v113$2 ++ v112$2 ++ v111$2 ++ v110$2, v247$2 ++ v246$2 ++ v245$2 ++ v244$2), FADD32(FMUL32(v105$2 ++ v104$2 ++ v103$2 ++ v102$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v109$2 ++ v108$2 ++ v107$2 ++ v106$2, v225$2 ++ v224$2 ++ v223$2 ++ v222$2))))) ++ FADD32(v295$2, FADD32(FMUL32(v294$2, v265$2 ++ v264$2 ++ v263$2 ++ v262$2), FADD32(FMUL32(v113$2 ++ v112$2 ++ v111$2 ++ v110$2, v243$2 ++ v242$2 ++ v241$2 ++ v240$2), FADD32(FMUL32(v105$2 ++ v104$2 ++ v103$2 ++ v102$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v109$2 ++ v108$2 ++ v107$2 ++ v106$2, v221$2 ++ v220$2 ++ v219$2 ++ v218$2))))) ++ FADD32($sum4.0$2[32:0], FADD32(FMUL32(v294$2, v261$2 ++ v260$2 ++ v259$2 ++ v258$2), FADD32(FMUL32(v113$2 ++ v112$2 ++ v111$2 ++ v110$2, v239$2 ++ v238$2 ++ v237$2 ++ v236$2), FADD32(FMUL32(v105$2 ++ v104$2 ++ v103$2 ++ v102$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v109$2 ++ v108$2 ++ v107$2 ++ v106$2, v217$2 ++ v216$2 ++ v215$2 ++ v214$2))))), FADD32(v301$2, FADD32(FMUL32(v298$2, v280$2), FADD32(FMUL32(v136$2 ++ v135$2 ++ v134$2 ++ v133$2, v279$2), FADD32(FMUL32(v128$2 ++ v127$2 ++ v126$2 ++ v125$2, v277$2), FMUL32(v132$2 ++ v131$2 ++ v130$2 ++ v129$2, v278$2))))) ++ FADD32(v300$2, FADD32(FMUL32(v298$2, v269$2 ++ v268$2 ++ v267$2 ++ v266$2), FADD32(FMUL32(v136$2 ++ v135$2 ++ v134$2 ++ v133$2, v247$2 ++ v246$2 ++ v245$2 ++ v244$2), FADD32(FMUL32(v128$2 ++ v127$2 ++ v126$2 ++ v125$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v132$2 ++ v131$2 ++ v130$2 ++ v129$2, v225$2 ++ v224$2 ++ v223$2 ++ v222$2))))) ++ FADD32(v299$2, FADD32(FMUL32(v298$2, v265$2 ++ v264$2 ++ v263$2 ++ v262$2), FADD32(FMUL32(v136$2 ++ v135$2 ++ v134$2 ++ v133$2, v243$2 ++ v242$2 ++ v241$2 ++ v240$2), FADD32(FMUL32(v128$2 ++ v127$2 ++ v126$2 ++ v125$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v132$2 ++ v131$2 ++ v130$2 ++ v129$2, v221$2 ++ v220$2 ++ v219$2 ++ v218$2))))) ++ FADD32($sum5.0$2[32:0], FADD32(FMUL32(v298$2, v261$2 ++ v260$2 ++ v259$2 ++ v258$2), FADD32(FMUL32(v136$2 ++ v135$2 ++ v134$2 ++ v133$2, v239$2 ++ v238$2 ++ v237$2 ++ v236$2), FADD32(FMUL32(v128$2 ++ v127$2 ++ v126$2 ++ v125$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v132$2 ++ v131$2 ++ v130$2 ++ v129$2, v217$2 ++ v216$2 ++ v215$2 ++ v214$2))))), FADD32(v305$2, FADD32(FMUL32(v302$2, v280$2), FADD32(FMUL32(v159$2 ++ v158$2 ++ v157$2 ++ v156$2, v279$2), FADD32(FMUL32(v151$2 ++ v150$2 ++ v149$2 ++ v148$2, v277$2), FMUL32(v155$2 ++ v154$2 ++ v153$2 ++ v152$2, v278$2))))) ++ FADD32(v304$2, FADD32(FMUL32(v302$2, v269$2 ++ v268$2 ++ v267$2 ++ v266$2), FADD32(FMUL32(v159$2 ++ v158$2 ++ v157$2 ++ v156$2, v247$2 ++ v246$2 ++ v245$2 ++ v244$2), FADD32(FMUL32(v151$2 ++ v150$2 ++ v149$2 ++ v148$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v155$2 ++ v154$2 ++ v153$2 ++ v152$2, v225$2 ++ v224$2 ++ v223$2 ++ v222$2))))) ++ FADD32(v303$2, FADD32(FMUL32(v302$2, v265$2 ++ v264$2 ++ v263$2 ++ v262$2), FADD32(FMUL32(v159$2 ++ v158$2 ++ v157$2 ++ v156$2, v243$2 ++ v242$2 ++ v241$2 ++ v240$2), FADD32(FMUL32(v151$2 ++ v150$2 ++ v149$2 ++ v148$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v155$2 ++ v154$2 ++ v153$2 ++ v152$2, v221$2 ++ v220$2 ++ v219$2 ++ v218$2))))) ++ FADD32($sum6.0$2[32:0], FADD32(FMUL32(v302$2, v261$2 ++ v260$2 ++ v259$2 ++ v258$2), FADD32(FMUL32(v159$2 ++ v158$2 ++ v157$2 ++ v156$2, v239$2 ++ v238$2 ++ v237$2 ++ v236$2), FADD32(FMUL32(v151$2 ++ v150$2 ++ v149$2 ++ v148$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v155$2 ++ v154$2 ++ v153$2 ++ v152$2, v217$2 ++ v216$2 ++ v215$2 ++ v214$2))))), FADD32(v309$2, FADD32(FMUL32(v306$2, v280$2), FADD32(FMUL32(v182$2 ++ v181$2 ++ v180$2 ++ v179$2, v279$2), FADD32(FMUL32(v174$2 ++ v173$2 ++ v172$2 ++ v171$2, v277$2), FMUL32(v178$2 ++ v177$2 ++ v176$2 ++ v175$2, v278$2))))) ++ FADD32(v308$2, FADD32(FMUL32(v306$2, v269$2 ++ v268$2 ++ v267$2 ++ v266$2), FADD32(FMUL32(v182$2 ++ v181$2 ++ v180$2 ++ v179$2, v247$2 ++ v246$2 ++ v245$2 ++ v244$2), FADD32(FMUL32(v174$2 ++ v173$2 ++ v172$2 ++ v171$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v178$2 ++ v177$2 ++ v176$2 ++ v175$2, v225$2 ++ v224$2 ++ v223$2 ++ v222$2))))) ++ FADD32(v307$2, FADD32(FMUL32(v306$2, v265$2 ++ v264$2 ++ v263$2 ++ v262$2), FADD32(FMUL32(v182$2 ++ v181$2 ++ v180$2 ++ v179$2, v243$2 ++ v242$2 ++ v241$2 ++ v240$2), FADD32(FMUL32(v174$2 ++ v173$2 ++ v172$2 ++ v171$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v178$2 ++ v177$2 ++ v176$2 ++ v175$2, v221$2 ++ v220$2 ++ v219$2 ++ v218$2))))) ++ FADD32($sum7.0$2[32:0], FADD32(FMUL32(v306$2, v261$2 ++ v260$2 ++ v259$2 ++ v258$2), FADD32(FMUL32(v182$2 ++ v181$2 ++ v180$2 ++ v179$2, v239$2 ++ v238$2 ++ v237$2 ++ v236$2), FADD32(FMUL32(v174$2 ++ v173$2 ++ v172$2 ++ v171$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v178$2 ++ v177$2 ++ v176$2 ++ v175$2, v217$2 ++ v216$2 ++ v215$2 ++ v214$2)))));
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $truebb47:
    assume {:partition} v257 && v257;
    $47 := 32767bv32;
    goto $134;

  $truebb46:
    assume {:partition} v256 && v256;
    $46 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit28;

  $truebb43:
    assume {:partition} v235 && v235;
    $43 := 32767bv32;
    goto $123;

  $truebb42:
    assume {:partition} v234 && v234;
    $42 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit32;

  $truebb39:
    assume {:partition} v213 && v213;
    $39 := 32767bv32;
    goto $112;

  $truebb38:
    assume {:partition} v212 && v212;
    $38 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit36;

  $truebb35:
    assume {:partition} v191 && v191;
    $35 := 32767bv32;
    goto $101;

  $truebb34:
    assume {:partition} v190 && v190;
    $34 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit40;

  $truebb29:
    assume {:partition} v168 && v168;
    $29 := 32767bv32;
    goto $84;

  $truebb28:
    assume {:partition} v167 && v167;
    $28 := 0bv32;
    goto $85;

  $truebb25:
    assume {:partition} v145 && v145;
    $25 := 32767bv32;
    goto $73;

  $truebb24:
    assume {:partition} v144 && v144;
    $24 := 0bv32;
    goto $74;

  $truebb21:
    assume {:partition} v122 && v122;
    $21 := 32767bv32;
    goto $62;

  $truebb20:
    assume {:partition} v121 && v121;
    $20 := 0bv32;
    goto $63;

  $truebb17:
    assume {:partition} v99 && v99;
    $17 := 32767bv32;
    goto $51;

  $truebb16:
    assume {:partition} v98 && v98;
    $16 := 0bv32;
    goto $52;

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
