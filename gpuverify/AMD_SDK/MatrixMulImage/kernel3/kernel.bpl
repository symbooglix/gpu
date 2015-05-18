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

procedure {:source_name "mmmKernel3"} {:kernel} $mmmKernel3($widthA: bv32, $widthB: bv32);
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



implementation {:source_name "mmmKernel3"} {:kernel} $mmmKernel3($widthA: bv32, $widthB: bv32)
{
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
  var $48: bv32;
  var $49: bv32;
  var $50$1: bv32;
  var $50$2: bv32;
  var $51$1: bv32;
  var $51$2: bv32;
  var $52: bv32;
  var $53: bv32;
  var $54$1: bv32;
  var $54$2: bv32;
  var $55$1: bv32;
  var $55$2: bv32;
  var $56: bv32;
  var $57: bv32;
  var $58$1: bv32;
  var $58$2: bv32;
  var $59$1: bv32;
  var $59$2: bv32;
  var $60: bv32;
  var $61: bv32;
  var $62$1: bv32;
  var $62$2: bv32;
  var $63$1: bv32;
  var $63$2: bv32;
  var $64$1: bv32;
  var $64$2: bv32;
  var $65$1: bv32;
  var $65$2: bv32;
  var $66: bv32;
  var $67: bv32;
  var $68$1: bv32;
  var $68$2: bv32;
  var $69$1: bv32;
  var $69$2: bv32;
  var $70: bv32;
  var $71: bv32;
  var $72$1: bv32;
  var $72$2: bv32;
  var $73$1: bv32;
  var $73$2: bv32;
  var $74: bv32;
  var $75: bv32;
  var $76$1: bv32;
  var $76$2: bv32;
  var $77$1: bv32;
  var $77$2: bv32;
  var $78: bv32;
  var $79: bv32;
  var $80: bv32;
  var $81: bv32;
  var $82$1: bv32;
  var $82$2: bv32;
  var $83$1: bv32;
  var $83$2: bv32;
  var $84: bv32;
  var $85: bv32;
  var $86$1: bv32;
  var $86$2: bv32;
  var $87$1: bv32;
  var $87$2: bv32;
  var $88: bv32;
  var $89: bv32;
  var $90$1: bv32;
  var $90$2: bv32;
  var $91$1: bv32;
  var $91$2: bv32;
  var $92: bv32;
  var $93: bv32;
  var $94$1: bv32;
  var $94$2: bv32;
  var $95$1: bv32;
  var $95$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
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
  var v11: bv32;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bool;
  var v13$2: bool;
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
  var v26$1: bv8;
  var v26$2: bv8;
  var v27$1: bv8;
  var v27$2: bv8;
  var v28$1: bv8;
  var v28$2: bv8;
  var v29$1: bv8;
  var v29$2: bv8;
  var v249$1: bv32;
  var v249$2: bv32;
  var v30$1: bv32;
  var v30$2: bv32;
  var v31: bv32;
  var v32$1: bool;
  var v32$2: bool;
  var v33$1: bool;
  var v33$2: bool;
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
  var v253$1: bv32;
  var v253$2: bv32;
  var v50$1: bv32;
  var v50$2: bv32;
  var v51: bv32;
  var v52$1: bool;
  var v52$2: bool;
  var v53$1: bool;
  var v53$2: bool;
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
  var v66$1: bv8;
  var v66$2: bv8;
  var v67$1: bv8;
  var v67$2: bv8;
  var v68$1: bv8;
  var v68$2: bv8;
  var v69$1: bv8;
  var v69$2: bv8;
  var v257$1: bv32;
  var v257$2: bv32;
  var v70$1: bv32;
  var v70$2: bv32;
  var v71: bv32;
  var v72$1: bool;
  var v72$2: bool;
  var v73$1: bool;
  var v73$2: bool;
  var v74$1: bv8;
  var v74$2: bv8;
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
  var v261$1: bv32;
  var v261$2: bv32;
  var v90$1: bv32;
  var v90$2: bv32;
  var v91: bv32;
  var v92$1: bool;
  var v92$2: bool;
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
  var v98$1: bv8;
  var v98$2: bv8;
  var v99$1: bv8;
  var v99$2: bv8;
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
  var v265$1: bv32;
  var v265$2: bv32;
  var v110$1: bv32;
  var v110$2: bv32;
  var v111: bv32;
  var v112$1: bool;
  var v112$2: bool;
  var v113$1: bool;
  var v113$2: bool;
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
  var v269$1: bv32;
  var v269$2: bv32;
  var v130$1: bv32;
  var v130$2: bv32;
  var v131: bv32;
  var v132$1: bool;
  var v132$2: bool;
  var v133$1: bool;
  var v133$2: bool;
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
  var v273$1: bv32;
  var v273$2: bv32;
  var v150$1: bv32;
  var v150$2: bv32;
  var v151: bv32;
  var v152$1: bool;
  var v152$2: bool;
  var v153$1: bool;
  var v153$2: bool;
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
  var v277$1: bv32;
  var v277$2: bv32;
  var v170$1: bv32;
  var v170$2: bv32;
  var v171$1: bool;
  var v171$2: bool;
  var v172$1: bool;
  var v172$2: bool;
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
  var v187$1: bv8;
  var v187$2: bv8;
  var v188$1: bv8;
  var v188$2: bv8;
  var v189$1: bv32;
  var v189$2: bv32;
  var v190$1: bool;
  var v190$2: bool;
  var v191$1: bool;
  var v191$2: bool;
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
  var v208$1: bv32;
  var v208$2: bv32;
  var v209$1: bool;
  var v209$2: bool;
  var v210$1: bool;
  var v210$2: bool;
  var v211$1: bv8;
  var v211$2: bv8;
  var v212$1: bv8;
  var v212$2: bv8;
  var v213$1: bv8;
  var v213$2: bv8;
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
  var v227$1: bv32;
  var v227$2: bv32;
  var v228$1: bool;
  var v228$2: bool;
  var v229$1: bool;
  var v229$2: bool;
  var v230$1: bv8;
  var v230$2: bv8;
  var v231$1: bv8;
  var v231$2: bv8;
  var v232$1: bv8;
  var v232$2: bv8;
  var v233$1: bv8;
  var v233$2: bv8;
  var v234$1: bv8;
  var v234$2: bv8;
  var v235$1: bv8;
  var v235$2: bv8;
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
  var v246$1: bv32;
  var v246$2: bv32;
  var v247$1: bv32;
  var v247$2: bv32;
  var v248$1: bv32;
  var v248$2: bv32;
  var v250$1: bv32;
  var v250$2: bv32;
  var v251$1: bv32;
  var v251$2: bv32;
  var v252$1: bv32;
  var v252$2: bv32;
  var v254$1: bv32;
  var v254$2: bv32;
  var v255$1: bv32;
  var v255$2: bv32;
  var v256$1: bv32;
  var v256$2: bv32;
  var v258$1: bv32;
  var v258$2: bv32;
  var v259$1: bv32;
  var v259$2: bv32;
  var v260$1: bv32;
  var v260$2: bv32;
  var v262$1: bv32;
  var v262$2: bv32;
  var v263$1: bv32;
  var v263$2: bv32;
  var v264$1: bv32;
  var v264$2: bv32;
  var v266$1: bv32;
  var v266$2: bv32;
  var v267$1: bv32;
  var v267$2: bv32;
  var v268$1: bv32;
  var v268$2: bv32;
  var v270$1: bv32;
  var v270$2: bv32;
  var v271$1: bv32;
  var v271$2: bv32;
  var v272$1: bv32;
  var v272$2: bv32;
  var v274$1: bv32;
  var v274$2: bv32;
  var v275$1: bv32;
  var v275$2: bv32;
  var v276$1: bv32;
  var v276$2: bv32;
  var v278: bool;
  var v279: bv32;
  var v281: bv32;
  var v280: bv32;
  var v282: bv32;
  var v283$1: bv32;
  var v283$2: bv32;
  var v284: bool;
  var v285: bool;
  var v286$1: bool;
  var v286$2: bool;
  var v287$1: bool;
  var v287$2: bool;
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
  var v296$1: bv8;
  var v296$2: bv8;
  var v297$1: bv8;
  var v297$2: bv8;
  var v298$1: bv8;
  var v298$2: bv8;
  var v299$1: bv8;
  var v299$2: bv8;
  var v300$1: bv8;
  var v300$2: bv8;
  var v301$1: bv8;
  var v301$2: bv8;
  var v302$1: bv8;
  var v302$2: bv8;
  var v303$1: bv8;
  var v303$2: bv8;
  var v538$1: bv32;
  var v538$2: bv32;
  var v304$1: bv32;
  var v304$2: bv32;
  var v305: bool;
  var v306: bool;
  var v307$1: bool;
  var v307$2: bool;
  var v308$1: bool;
  var v308$2: bool;
  var v309$1: bv8;
  var v309$2: bv8;
  var v310$1: bv8;
  var v310$2: bv8;
  var v311$1: bv8;
  var v311$2: bv8;
  var v312$1: bv8;
  var v312$2: bv8;
  var v313$1: bv8;
  var v313$2: bv8;
  var v314$1: bv8;
  var v314$2: bv8;
  var v315$1: bv8;
  var v315$2: bv8;
  var v316$1: bv8;
  var v316$2: bv8;
  var v317$1: bv8;
  var v317$2: bv8;
  var v318$1: bv8;
  var v318$2: bv8;
  var v319$1: bv8;
  var v319$2: bv8;
  var v320$1: bv8;
  var v320$2: bv8;
  var v321$1: bv8;
  var v321$2: bv8;
  var v322$1: bv8;
  var v322$2: bv8;
  var v323$1: bv8;
  var v323$2: bv8;
  var v324$1: bv8;
  var v324$2: bv8;
  var v542$1: bv32;
  var v542$2: bv32;
  var v325$1: bv32;
  var v325$2: bv32;
  var v326: bool;
  var v327: bool;
  var v328$1: bool;
  var v328$2: bool;
  var v329$1: bool;
  var v329$2: bool;
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
  var v546$1: bv32;
  var v546$2: bv32;
  var v346$1: bv32;
  var v346$2: bv32;
  var v347: bool;
  var v348: bool;
  var v349$1: bool;
  var v349$2: bool;
  var v350$1: bool;
  var v350$2: bool;
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
  var v550$1: bv32;
  var v550$2: bv32;
  var v367$1: bv32;
  var v367$2: bv32;
  var v368$1: bool;
  var v368$2: bool;
  var v369$1: bool;
  var v369$2: bool;
  var v370: bool;
  var v371: bool;
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
  var v378$1: bv8;
  var v378$2: bv8;
  var v379$1: bv8;
  var v379$2: bv8;
  var v380$1: bv8;
  var v380$2: bv8;
  var v381$1: bv8;
  var v381$2: bv8;
  var v382$1: bv8;
  var v382$2: bv8;
  var v383$1: bv8;
  var v383$2: bv8;
  var v384$1: bv8;
  var v384$2: bv8;
  var v385$1: bv8;
  var v385$2: bv8;
  var v386$1: bv8;
  var v386$2: bv8;
  var v387$1: bv8;
  var v387$2: bv8;
  var v388$1: bv32;
  var v388$2: bv32;
  var v389$1: bool;
  var v389$2: bool;
  var v390$1: bool;
  var v390$2: bool;
  var v391: bool;
  var v392: bool;
  var v393$1: bv8;
  var v393$2: bv8;
  var v394$1: bv8;
  var v394$2: bv8;
  var v395$1: bv8;
  var v395$2: bv8;
  var v396$1: bv8;
  var v396$2: bv8;
  var v397$1: bv8;
  var v397$2: bv8;
  var v398$1: bv8;
  var v398$2: bv8;
  var v399$1: bv8;
  var v399$2: bv8;
  var v400$1: bv8;
  var v400$2: bv8;
  var v401$1: bv8;
  var v401$2: bv8;
  var v402$1: bv8;
  var v402$2: bv8;
  var v403$1: bv8;
  var v403$2: bv8;
  var v404$1: bv8;
  var v404$2: bv8;
  var v405$1: bv8;
  var v405$2: bv8;
  var v406$1: bv8;
  var v406$2: bv8;
  var v407$1: bv8;
  var v407$2: bv8;
  var v408$1: bv8;
  var v408$2: bv8;
  var v409$1: bv32;
  var v409$2: bv32;
  var v410$1: bool;
  var v410$2: bool;
  var v411$1: bool;
  var v411$2: bool;
  var v412: bool;
  var v413: bool;
  var v414$1: bv8;
  var v414$2: bv8;
  var v415$1: bv8;
  var v415$2: bv8;
  var v416$1: bv8;
  var v416$2: bv8;
  var v417$1: bv8;
  var v417$2: bv8;
  var v418$1: bv8;
  var v418$2: bv8;
  var v419$1: bv8;
  var v419$2: bv8;
  var v420$1: bv8;
  var v420$2: bv8;
  var v421$1: bv8;
  var v421$2: bv8;
  var v422$1: bv8;
  var v422$2: bv8;
  var v423$1: bv8;
  var v423$2: bv8;
  var v424$1: bv8;
  var v424$2: bv8;
  var v425$1: bv8;
  var v425$2: bv8;
  var v426$1: bv8;
  var v426$2: bv8;
  var v427$1: bv8;
  var v427$2: bv8;
  var v428$1: bv8;
  var v428$2: bv8;
  var v429$1: bv8;
  var v429$2: bv8;
  var v430$1: bv32;
  var v430$2: bv32;
  var v431$1: bool;
  var v431$2: bool;
  var v432$1: bool;
  var v432$2: bool;
  var v433: bool;
  var v434: bool;
  var v435$1: bv8;
  var v435$2: bv8;
  var v436$1: bv8;
  var v436$2: bv8;
  var v437$1: bv8;
  var v437$2: bv8;
  var v438$1: bv8;
  var v438$2: bv8;
  var v439$1: bv8;
  var v439$2: bv8;
  var v440$1: bv8;
  var v440$2: bv8;
  var v441$1: bv8;
  var v441$2: bv8;
  var v442$1: bv8;
  var v442$2: bv8;
  var v443$1: bv8;
  var v443$2: bv8;
  var v444$1: bv8;
  var v444$2: bv8;
  var v445$1: bv8;
  var v445$2: bv8;
  var v446$1: bv8;
  var v446$2: bv8;
  var v447$1: bv8;
  var v447$2: bv8;
  var v448$1: bv8;
  var v448$2: bv8;
  var v449$1: bv8;
  var v449$2: bv8;
  var v450$1: bv8;
  var v450$2: bv8;
  var v451$1: bv32;
  var v451$2: bv32;
  var v452: bool;
  var v453: bool;
  var v454$1: bool;
  var v454$2: bool;
  var v455$1: bool;
  var v455$2: bool;
  var v456$1: bv8;
  var v456$2: bv8;
  var v457$1: bv8;
  var v457$2: bv8;
  var v458$1: bv8;
  var v458$2: bv8;
  var v459$1: bv8;
  var v459$2: bv8;
  var v460$1: bv8;
  var v460$2: bv8;
  var v461$1: bv8;
  var v461$2: bv8;
  var v462$1: bv8;
  var v462$2: bv8;
  var v463$1: bv8;
  var v463$2: bv8;
  var v464$1: bv8;
  var v464$2: bv8;
  var v465$1: bv8;
  var v465$2: bv8;
  var v466$1: bv8;
  var v466$2: bv8;
  var v467$1: bv8;
  var v467$2: bv8;
  var v468$1: bv8;
  var v468$2: bv8;
  var v469$1: bv8;
  var v469$2: bv8;
  var v470$1: bv8;
  var v470$2: bv8;
  var v471$1: bv8;
  var v471$2: bv8;
  var v554$1: bv32;
  var v554$2: bv32;
  var v472$1: bv32;
  var v472$2: bv32;
  var v473: bool;
  var v474: bool;
  var v475$1: bool;
  var v475$2: bool;
  var v476$1: bool;
  var v476$2: bool;
  var v477$1: bv8;
  var v477$2: bv8;
  var v478$1: bv8;
  var v478$2: bv8;
  var v479$1: bv8;
  var v479$2: bv8;
  var v480$1: bv8;
  var v480$2: bv8;
  var v481$1: bv8;
  var v481$2: bv8;
  var v482$1: bv8;
  var v482$2: bv8;
  var v483$1: bv8;
  var v483$2: bv8;
  var v484$1: bv8;
  var v484$2: bv8;
  var v485$1: bv8;
  var v485$2: bv8;
  var v486$1: bv8;
  var v486$2: bv8;
  var v487$1: bv8;
  var v487$2: bv8;
  var v488$1: bv8;
  var v488$2: bv8;
  var v489$1: bv8;
  var v489$2: bv8;
  var v490$1: bv8;
  var v490$2: bv8;
  var v491$1: bv8;
  var v491$2: bv8;
  var v492$1: bv8;
  var v492$2: bv8;
  var v558$1: bv32;
  var v558$2: bv32;
  var v493$1: bv32;
  var v493$2: bv32;
  var v494: bool;
  var v495: bool;
  var v496$1: bool;
  var v496$2: bool;
  var v497$1: bool;
  var v497$2: bool;
  var v498$1: bv8;
  var v498$2: bv8;
  var v499$1: bv8;
  var v499$2: bv8;
  var v500$1: bv8;
  var v500$2: bv8;
  var v501$1: bv8;
  var v501$2: bv8;
  var v502$1: bv8;
  var v502$2: bv8;
  var v503$1: bv8;
  var v503$2: bv8;
  var v504$1: bv8;
  var v504$2: bv8;
  var v505$1: bv8;
  var v505$2: bv8;
  var v506$1: bv8;
  var v506$2: bv8;
  var v507$1: bv8;
  var v507$2: bv8;
  var v508$1: bv8;
  var v508$2: bv8;
  var v509$1: bv8;
  var v509$2: bv8;
  var v510$1: bv8;
  var v510$2: bv8;
  var v511$1: bv8;
  var v511$2: bv8;
  var v512$1: bv8;
  var v512$2: bv8;
  var v513$1: bv8;
  var v513$2: bv8;
  var v562$1: bv32;
  var v562$2: bv32;
  var v514$1: bv32;
  var v514$2: bv32;
  var v515: bool;
  var v516: bool;
  var v517$1: bool;
  var v517$2: bool;
  var v518$1: bool;
  var v518$2: bool;
  var v519$1: bv8;
  var v519$2: bv8;
  var v520$1: bv8;
  var v520$2: bv8;
  var v521$1: bv8;
  var v521$2: bv8;
  var v522$1: bv8;
  var v522$2: bv8;
  var v523$1: bv8;
  var v523$2: bv8;
  var v524$1: bv8;
  var v524$2: bv8;
  var v525$1: bv8;
  var v525$2: bv8;
  var v526$1: bv8;
  var v526$2: bv8;
  var v527$1: bv8;
  var v527$2: bv8;
  var v528$1: bv8;
  var v528$2: bv8;
  var v529$1: bv8;
  var v529$2: bv8;
  var v530$1: bv8;
  var v530$2: bv8;
  var v531$1: bv8;
  var v531$2: bv8;
  var v532$1: bv8;
  var v532$2: bv8;
  var v533$1: bv8;
  var v533$2: bv8;
  var v534$1: bv8;
  var v534$2: bv8;
  var v566$1: bv32;
  var v566$2: bv32;
  var v535$1: bv32;
  var v535$2: bv32;
  var v536$1: bv32;
  var v536$2: bv32;
  var v537$1: bv32;
  var v537$2: bv32;
  var v539$1: bv32;
  var v539$2: bv32;
  var v540$1: bv32;
  var v540$2: bv32;
  var v541$1: bv32;
  var v541$2: bv32;
  var v543$1: bv32;
  var v543$2: bv32;
  var v544$1: bv32;
  var v544$2: bv32;
  var v545$1: bv32;
  var v545$2: bv32;
  var v547$1: bv32;
  var v547$2: bv32;
  var v548$1: bv32;
  var v548$2: bv32;
  var v549$1: bv32;
  var v549$2: bv32;
  var v551$1: bv32;
  var v551$2: bv32;
  var v552$1: bv32;
  var v552$2: bv32;
  var v553$1: bv32;
  var v553$2: bv32;
  var v555$1: bv32;
  var v555$2: bv32;
  var v556$1: bv32;
  var v556$2: bv32;
  var v557$1: bv32;
  var v557$2: bv32;
  var v559$1: bv32;
  var v559$2: bv32;
  var v560$1: bv32;
  var v560$2: bv32;
  var v561$1: bv32;
  var v561$2: bv32;
  var v563$1: bv32;
  var v563$2: bv32;
  var v564$1: bv32;
  var v564$2: bv32;
  var v565$1: bv32;
  var v565$2: bv32;
  var v567$1: bv32;
  var v567$2: bv32;
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
  var p48$1: bool;
  var p48$2: bool;
  var p49$1: bool;
  var p49$2: bool;
  var p50$1: bool;
  var p50$2: bool;
  var p51$1: bool;
  var p51$2: bool;
  var p52$1: bool;
  var p52$2: bool;
  var p53$1: bool;
  var p53$2: bool;
  var p54$1: bool;
  var p54$2: bool;
  var p55$1: bool;
  var p55$2: bool;
  var p56$1: bool;
  var p56$2: bool;
  var p57$1: bool;
  var p57$2: bool;
  var p58$1: bool;
  var p58$2: bool;
  var p59$1: bool;
  var p59$2: bool;
  var p60$1: bool;
  var p60$2: bool;
  var p61$1: bool;
  var p61$2: bool;
  var p62$1: bool;
  var p62$2: bool;
  var p63$1: bool;
  var p63$2: bool;
  var p64$1: bool;
  var p64$2: bool;
  var p65$1: bool;
  var p65$2: bool;
  var p66$1: bool;
  var p66$2: bool;
  var p67$1: bool;
  var p67$2: bool;
  var p68$1: bool;
  var p68$2: bool;
  var p69$1: bool;
  var p69$2: bool;
  var p70$1: bool;
  var p70$2: bool;
  var p71$1: bool;
  var p71$2: bool;
  var p72$1: bool;
  var p72$2: bool;
  var p73$1: bool;
  var p73$2: bool;
  var p74$1: bool;
  var p74$2: bool;
  var p75$1: bool;
  var p75$2: bool;
  var p76$1: bool;
  var p76$2: bool;
  var p77$1: bool;
  var p77$2: bool;
  var p78$1: bool;
  var p78$2: bool;
  var p79$1: bool;
  var p79$2: bool;
  var p80$1: bool;
  var p80$2: bool;
  var p81$1: bool;
  var p81$2: bool;
  var p82$1: bool;
  var p82$2: bool;
  var p83$1: bool;
  var p83$2: bool;
  var p84$1: bool;
  var p84$2: bool;
  var p85$1: bool;
  var p85$2: bool;
  var p86$1: bool;
  var p86$2: bool;
  var p87$1: bool;
  var p87$2: bool;
  var p88$1: bool;
  var p88$2: bool;
  var p89$1: bool;
  var p89$2: bool;
  var p90$1: bool;
  var p90$2: bool;
  var p91$1: bool;
  var p91$2: bool;
  var p92$1: bool;
  var p92$2: bool;
  var p93$1: bool;
  var p93$2: bool;
  var p94$1: bool;
  var p94$2: bool;
  var p95$1: bool;
  var p95$2: bool;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    v2$1 := BV32_SHL(v1$1, 3bv32);
    v2$2 := BV32_SHL(v1$2, 3bv32);
    v3$1 := BV32_ADD(v2$1, 1bv32);
    v3$2 := BV32_ADD(v2$2, 1bv32);
    v4$1 := BV32_ADD(v2$1, 2bv32);
    v4$2 := BV32_ADD(v2$2, 2bv32);
    v5$1 := BV32_ADD(v2$1, 3bv32);
    v5$2 := BV32_ADD(v2$2, 3bv32);
    v6$1 := BV32_ADD(v2$1, 4bv32);
    v6$2 := BV32_ADD(v2$2, 4bv32);
    v7$1 := BV32_ADD(v2$1, 5bv32);
    v7$2 := BV32_ADD(v2$2, 5bv32);
    v8$1 := BV32_ADD(v2$1, 6bv32);
    v8$2 := BV32_ADD(v2$2, 6bv32);
    v9$1 := BV32_ADD(v2$1, 7bv32);
    v9$2 := BV32_ADD(v2$2, 7bv32);
    v10$1 := $$imageSampler$1[0bv32];
    v10$2 := $$imageSampler$2[0bv32];
    v11 := 0bv32;
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
    assume {:partition} true && true;
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} true && true;
    $1 := v11;
    goto $5;

  $5:
    $0 := $1;
    goto $6;

  $6:
    v12$1 := BV32_SLT(v2$1, 0bv32);
    v12$2 := BV32_SLT(v2$2, 0bv32);
    p0$1 := (if v12$1 then v12$1 else p0$1);
    p0$2 := (if v12$2 then v12$2 else p0$2);
    p1$1 := (if !v12$1 then !v12$1 else p1$1);
    p1$2 := (if !v12$2 then !v12$2 else p1$2);
    $2$1 := (if p0$1 then 0bv32 else $2$1);
    $2$2 := (if p0$2 then 0bv32 else $2$2);
    v13$1 := (if p1$1 then BV32_SGE(v2$1, 32768bv32) else v13$1);
    v13$2 := (if p1$2 then BV32_SGE(v2$2, 32768bv32) else v13$2);
    p2$1 := (if p1$1 && v13$1 then v13$1 else p2$1);
    p2$2 := (if p1$2 && v13$2 then v13$2 else p2$2);
    p3$1 := (if p1$1 && !v13$1 then !v13$1 else p3$1);
    p3$2 := (if p1$2 && !v13$2 then !v13$2 else p3$2);
    $3$1 := (if p2$1 then 32767bv32 else $3$1);
    $3$2 := (if p2$2 then 32767bv32 else $3$2);
    $3$1 := (if p3$1 then v2$1 else $3$1);
    $3$2 := (if p3$2 then v2$2 else $3$2);
    $2$1 := (if p1$1 then $3$1 else $2$1);
    $2$2 := (if p1$2 then $3$2 else $2$2);
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
    havoc v26$1, v26$2;
    havoc v27$1, v27$2;
    havoc v28$1, v28$2;
    havoc v29$1, v29$2;
    v30$1 := $$imageSampler$1[0bv32];
    v30$2 := $$imageSampler$2[0bv32];
    v31 := 0bv32;
    goto $truebb3, $falsebb3;

  $falsebb3:
    assume {:partition} true && true;
    goto $truebb4, $falsebb4;

  $falsebb4:
    assume {:partition} true && true;
    $5 := v31;
    goto $16;

  $16:
    $4 := $5;
    goto $17;

  $17:
    v32$1 := BV32_SLT(v3$1, 0bv32);
    v32$2 := BV32_SLT(v3$2, 0bv32);
    p4$1 := (if v32$1 then v32$1 else p4$1);
    p4$2 := (if v32$2 then v32$2 else p4$2);
    p5$1 := (if !v32$1 then !v32$1 else p5$1);
    p5$2 := (if !v32$2 then !v32$2 else p5$2);
    $6$1 := (if p4$1 then 0bv32 else $6$1);
    $6$2 := (if p4$2 then 0bv32 else $6$2);
    v33$1 := (if p5$1 then BV32_SGE(v3$1, 32768bv32) else v33$1);
    v33$2 := (if p5$2 then BV32_SGE(v3$2, 32768bv32) else v33$2);
    p6$1 := (if p5$1 && v33$1 then v33$1 else p6$1);
    p6$2 := (if p5$2 && v33$2 then v33$2 else p6$2);
    p7$1 := (if p5$1 && !v33$1 then !v33$1 else p7$1);
    p7$2 := (if p5$2 && !v33$2 then !v33$2 else p7$2);
    $7$1 := (if p6$1 then 32767bv32 else $7$1);
    $7$2 := (if p6$2 then 32767bv32 else $7$2);
    $7$1 := (if p7$1 then v3$1 else $7$1);
    $7$2 := (if p7$2 then v3$2 else $7$2);
    $6$1 := (if p5$1 then $7$1 else $6$1);
    $6$2 := (if p5$2 then $7$2 else $6$2);
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
    havoc v49$1, v49$2;
    v50$1 := $$imageSampler$1[0bv32];
    v50$2 := $$imageSampler$2[0bv32];
    v51 := 0bv32;
    goto $truebb7, $falsebb7;

  $falsebb7:
    assume {:partition} true && true;
    goto $truebb8, $falsebb8;

  $falsebb8:
    assume {:partition} true && true;
    $9 := v51;
    goto $27;

  $27:
    $8 := $9;
    goto $28;

  $28:
    v52$1 := BV32_SLT(v4$1, 0bv32);
    v52$2 := BV32_SLT(v4$2, 0bv32);
    p8$1 := (if v52$1 then v52$1 else p8$1);
    p8$2 := (if v52$2 then v52$2 else p8$2);
    p9$1 := (if !v52$1 then !v52$1 else p9$1);
    p9$2 := (if !v52$2 then !v52$2 else p9$2);
    $10$1 := (if p8$1 then 0bv32 else $10$1);
    $10$2 := (if p8$2 then 0bv32 else $10$2);
    v53$1 := (if p9$1 then BV32_SGE(v4$1, 32768bv32) else v53$1);
    v53$2 := (if p9$2 then BV32_SGE(v4$2, 32768bv32) else v53$2);
    p10$1 := (if p9$1 && v53$1 then v53$1 else p10$1);
    p10$2 := (if p9$2 && v53$2 then v53$2 else p10$2);
    p11$1 := (if p9$1 && !v53$1 then !v53$1 else p11$1);
    p11$2 := (if p9$2 && !v53$2 then !v53$2 else p11$2);
    $11$1 := (if p10$1 then 32767bv32 else $11$1);
    $11$2 := (if p10$2 then 32767bv32 else $11$2);
    $11$1 := (if p11$1 then v4$1 else $11$1);
    $11$2 := (if p11$2 then v4$2 else $11$2);
    $10$1 := (if p9$1 then $11$1 else $10$1);
    $10$2 := (if p9$2 then $11$2 else $10$2);
    havoc v54$1, v54$2;
    havoc v55$1, v55$2;
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
    v70$1 := $$imageSampler$1[0bv32];
    v70$2 := $$imageSampler$2[0bv32];
    v71 := 0bv32;
    goto $truebb11, $falsebb11;

  $falsebb11:
    assume {:partition} true && true;
    goto $truebb12, $falsebb12;

  $falsebb12:
    assume {:partition} true && true;
    $13 := v71;
    goto $38;

  $38:
    $12 := $13;
    goto $39;

  $39:
    v72$1 := BV32_SLT(v5$1, 0bv32);
    v72$2 := BV32_SLT(v5$2, 0bv32);
    p12$1 := (if v72$1 then v72$1 else p12$1);
    p12$2 := (if v72$2 then v72$2 else p12$2);
    p13$1 := (if !v72$1 then !v72$1 else p13$1);
    p13$2 := (if !v72$2 then !v72$2 else p13$2);
    $14$1 := (if p12$1 then 0bv32 else $14$1);
    $14$2 := (if p12$2 then 0bv32 else $14$2);
    v73$1 := (if p13$1 then BV32_SGE(v5$1, 32768bv32) else v73$1);
    v73$2 := (if p13$2 then BV32_SGE(v5$2, 32768bv32) else v73$2);
    p14$1 := (if p13$1 && v73$1 then v73$1 else p14$1);
    p14$2 := (if p13$2 && v73$2 then v73$2 else p14$2);
    p15$1 := (if p13$1 && !v73$1 then !v73$1 else p15$1);
    p15$2 := (if p13$2 && !v73$2 then !v73$2 else p15$2);
    $15$1 := (if p14$1 then 32767bv32 else $15$1);
    $15$2 := (if p14$2 then 32767bv32 else $15$2);
    $15$1 := (if p15$1 then v5$1 else $15$1);
    $15$2 := (if p15$2 then v5$2 else $15$2);
    $14$1 := (if p13$1 then $15$1 else $14$1);
    $14$2 := (if p13$2 then $15$2 else $14$2);
    havoc v74$1, v74$2;
    havoc v75$1, v75$2;
    havoc v76$1, v76$2;
    havoc v77$1, v77$2;
    havoc v78$1, v78$2;
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
    v90$1 := $$imageSampler$1[0bv32];
    v90$2 := $$imageSampler$2[0bv32];
    v91 := 0bv32;
    goto $truebb15, $falsebb15;

  $falsebb15:
    assume {:partition} true && true;
    goto $truebb16, $falsebb16;

  $falsebb16:
    assume {:partition} true && true;
    $17 := v91;
    goto $49;

  $49:
    $16 := $17;
    goto $50;

  $50:
    v92$1 := BV32_SLT(v6$1, 0bv32);
    v92$2 := BV32_SLT(v6$2, 0bv32);
    p16$1 := (if v92$1 then v92$1 else p16$1);
    p16$2 := (if v92$2 then v92$2 else p16$2);
    p17$1 := (if !v92$1 then !v92$1 else p17$1);
    p17$2 := (if !v92$2 then !v92$2 else p17$2);
    $18$1 := (if p16$1 then 0bv32 else $18$1);
    $18$2 := (if p16$2 then 0bv32 else $18$2);
    v93$1 := (if p17$1 then BV32_SGE(v6$1, 32768bv32) else v93$1);
    v93$2 := (if p17$2 then BV32_SGE(v6$2, 32768bv32) else v93$2);
    p18$1 := (if p17$1 && v93$1 then v93$1 else p18$1);
    p18$2 := (if p17$2 && v93$2 then v93$2 else p18$2);
    p19$1 := (if p17$1 && !v93$1 then !v93$1 else p19$1);
    p19$2 := (if p17$2 && !v93$2 then !v93$2 else p19$2);
    $19$1 := (if p18$1 then 32767bv32 else $19$1);
    $19$2 := (if p18$2 then 32767bv32 else $19$2);
    $19$1 := (if p19$1 then v6$1 else $19$1);
    $19$2 := (if p19$2 then v6$2 else $19$2);
    $18$1 := (if p17$1 then $19$1 else $18$1);
    $18$2 := (if p17$2 then $19$2 else $18$2);
    havoc v94$1, v94$2;
    havoc v95$1, v95$2;
    havoc v96$1, v96$2;
    havoc v97$1, v97$2;
    havoc v98$1, v98$2;
    havoc v99$1, v99$2;
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
    v110$1 := $$imageSampler$1[0bv32];
    v110$2 := $$imageSampler$2[0bv32];
    v111 := 0bv32;
    goto $truebb19, $falsebb19;

  $falsebb19:
    assume {:partition} true && true;
    goto $truebb20, $falsebb20;

  $falsebb20:
    assume {:partition} true && true;
    $21 := v111;
    goto $60;

  $60:
    $20 := $21;
    goto $61;

  $61:
    v112$1 := BV32_SLT(v7$1, 0bv32);
    v112$2 := BV32_SLT(v7$2, 0bv32);
    p20$1 := (if v112$1 then v112$1 else p20$1);
    p20$2 := (if v112$2 then v112$2 else p20$2);
    p21$1 := (if !v112$1 then !v112$1 else p21$1);
    p21$2 := (if !v112$2 then !v112$2 else p21$2);
    $22$1 := (if p20$1 then 0bv32 else $22$1);
    $22$2 := (if p20$2 then 0bv32 else $22$2);
    v113$1 := (if p21$1 then BV32_SGE(v7$1, 32768bv32) else v113$1);
    v113$2 := (if p21$2 then BV32_SGE(v7$2, 32768bv32) else v113$2);
    p22$1 := (if p21$1 && v113$1 then v113$1 else p22$1);
    p22$2 := (if p21$2 && v113$2 then v113$2 else p22$2);
    p23$1 := (if p21$1 && !v113$1 then !v113$1 else p23$1);
    p23$2 := (if p21$2 && !v113$2 then !v113$2 else p23$2);
    $23$1 := (if p22$1 then 32767bv32 else $23$1);
    $23$2 := (if p22$2 then 32767bv32 else $23$2);
    $23$1 := (if p23$1 then v7$1 else $23$1);
    $23$2 := (if p23$2 then v7$2 else $23$2);
    $22$1 := (if p21$1 then $23$1 else $22$1);
    $22$2 := (if p21$2 then $23$2 else $22$2);
    havoc v114$1, v114$2;
    havoc v115$1, v115$2;
    havoc v116$1, v116$2;
    havoc v117$1, v117$2;
    havoc v118$1, v118$2;
    havoc v119$1, v119$2;
    havoc v120$1, v120$2;
    havoc v121$1, v121$2;
    havoc v122$1, v122$2;
    havoc v123$1, v123$2;
    havoc v124$1, v124$2;
    havoc v125$1, v125$2;
    havoc v126$1, v126$2;
    havoc v127$1, v127$2;
    havoc v128$1, v128$2;
    havoc v129$1, v129$2;
    v130$1 := $$imageSampler$1[0bv32];
    v130$2 := $$imageSampler$2[0bv32];
    v131 := 0bv32;
    goto $truebb23, $falsebb23;

  $falsebb23:
    assume {:partition} true && true;
    goto $truebb24, $falsebb24;

  $falsebb24:
    assume {:partition} true && true;
    $25 := v131;
    goto $71;

  $71:
    $24 := $25;
    goto $72;

  $72:
    v132$1 := BV32_SLT(v8$1, 0bv32);
    v132$2 := BV32_SLT(v8$2, 0bv32);
    p24$1 := (if v132$1 then v132$1 else p24$1);
    p24$2 := (if v132$2 then v132$2 else p24$2);
    p25$1 := (if !v132$1 then !v132$1 else p25$1);
    p25$2 := (if !v132$2 then !v132$2 else p25$2);
    $26$1 := (if p24$1 then 0bv32 else $26$1);
    $26$2 := (if p24$2 then 0bv32 else $26$2);
    v133$1 := (if p25$1 then BV32_SGE(v8$1, 32768bv32) else v133$1);
    v133$2 := (if p25$2 then BV32_SGE(v8$2, 32768bv32) else v133$2);
    p26$1 := (if p25$1 && v133$1 then v133$1 else p26$1);
    p26$2 := (if p25$2 && v133$2 then v133$2 else p26$2);
    p27$1 := (if p25$1 && !v133$1 then !v133$1 else p27$1);
    p27$2 := (if p25$2 && !v133$2 then !v133$2 else p27$2);
    $27$1 := (if p26$1 then 32767bv32 else $27$1);
    $27$2 := (if p26$2 then 32767bv32 else $27$2);
    $27$1 := (if p27$1 then v8$1 else $27$1);
    $27$2 := (if p27$2 then v8$2 else $27$2);
    $26$1 := (if p25$1 then $27$1 else $26$1);
    $26$2 := (if p25$2 then $27$2 else $26$2);
    havoc v134$1, v134$2;
    havoc v135$1, v135$2;
    havoc v136$1, v136$2;
    havoc v137$1, v137$2;
    havoc v138$1, v138$2;
    havoc v139$1, v139$2;
    havoc v140$1, v140$2;
    havoc v141$1, v141$2;
    havoc v142$1, v142$2;
    havoc v143$1, v143$2;
    havoc v144$1, v144$2;
    havoc v145$1, v145$2;
    havoc v146$1, v146$2;
    havoc v147$1, v147$2;
    havoc v148$1, v148$2;
    havoc v149$1, v149$2;
    v150$1 := $$imageSampler$1[0bv32];
    v150$2 := $$imageSampler$2[0bv32];
    v151 := 0bv32;
    goto $truebb27, $falsebb27;

  $falsebb27:
    assume {:partition} true && true;
    goto $truebb28, $falsebb28;

  $falsebb28:
    assume {:partition} true && true;
    $29 := v151;
    goto $82;

  $82:
    $28 := $29;
    goto $83;

  $83:
    v152$1 := BV32_SLT(v9$1, 0bv32);
    v152$2 := BV32_SLT(v9$2, 0bv32);
    p28$1 := (if v152$1 then v152$1 else p28$1);
    p28$2 := (if v152$2 then v152$2 else p28$2);
    p29$1 := (if !v152$1 then !v152$1 else p29$1);
    p29$2 := (if !v152$2 then !v152$2 else p29$2);
    $30$1 := (if p28$1 then 0bv32 else $30$1);
    $30$2 := (if p28$2 then 0bv32 else $30$2);
    v153$1 := (if p29$1 then BV32_SGE(v9$1, 32768bv32) else v153$1);
    v153$2 := (if p29$2 then BV32_SGE(v9$2, 32768bv32) else v153$2);
    p30$1 := (if p29$1 && v153$1 then v153$1 else p30$1);
    p30$2 := (if p29$2 && v153$2 then v153$2 else p30$2);
    p31$1 := (if p29$1 && !v153$1 then !v153$1 else p31$1);
    p31$2 := (if p29$2 && !v153$2 then !v153$2 else p31$2);
    $31$1 := (if p30$1 then 32767bv32 else $31$1);
    $31$2 := (if p30$2 then 32767bv32 else $31$2);
    $31$1 := (if p31$1 then v9$1 else $31$1);
    $31$2 := (if p31$2 then v9$2 else $31$2);
    $30$1 := (if p29$1 then $31$1 else $30$1);
    $30$2 := (if p29$2 then $31$2 else $30$2);
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
    havoc v164$1, v164$2;
    havoc v165$1, v165$2;
    havoc v166$1, v166$2;
    havoc v167$1, v167$2;
    havoc v168$1, v168$2;
    havoc v169$1, v169$2;
    v170$1 := $$imageSampler$1[0bv32];
    v170$2 := $$imageSampler$2[0bv32];
    v171$1 := BV32_SLT(v0$1, 0bv32);
    v171$2 := BV32_SLT(v0$2, 0bv32);
    p32$1 := (if v171$1 then v171$1 else p32$1);
    p32$2 := (if v171$2 then v171$2 else p32$2);
    p33$1 := (if !v171$1 then !v171$1 else p33$1);
    p33$2 := (if !v171$2 then !v171$2 else p33$2);
    $32$1 := (if p32$1 then 0bv32 else $32$1);
    $32$2 := (if p32$2 then 0bv32 else $32$2);
    v172$1 := (if p33$1 then BV32_SGE(v0$1, 32768bv32) else v172$1);
    v172$2 := (if p33$2 then BV32_SGE(v0$2, 32768bv32) else v172$2);
    p34$1 := (if p33$1 && v172$1 then v172$1 else p34$1);
    p34$2 := (if p33$2 && v172$2 then v172$2 else p34$2);
    p35$1 := (if p33$1 && !v172$1 then !v172$1 else p35$1);
    p35$2 := (if p33$2 && !v172$2 then !v172$2 else p35$2);
    $33$1 := (if p34$1 then 32767bv32 else $33$1);
    $33$2 := (if p34$2 then 32767bv32 else $33$2);
    $33$1 := (if p35$1 then v0$1 else $33$1);
    $33$2 := (if p35$2 then v0$2 else $33$2);
    $32$1 := (if p33$1 then $33$1 else $32$1);
    $32$2 := (if p33$2 then $33$2 else $32$2);
    goto $truebb33, $falsebb33;

  $falsebb33:
    assume {:partition} true && true;
    goto $truebb34, $falsebb34;

  $falsebb34:
    assume {:partition} true && true;
    $35 := 0bv32;
    goto $99;

  $99:
    $34 := $35;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit105;

  $_Z11read_imagefPU3AS1vjDv2_i.exit105:
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
    havoc v187$1, v187$2;
    havoc v188$1, v188$2;
    v189$1 := $$imageSampler$1[0bv32];
    v189$2 := $$imageSampler$2[0bv32];
    v190$1 := BV32_SLT(v0$1, 0bv32);
    v190$2 := BV32_SLT(v0$2, 0bv32);
    p36$1 := (if v190$1 then v190$1 else p36$1);
    p36$2 := (if v190$2 then v190$2 else p36$2);
    p37$1 := (if !v190$1 then !v190$1 else p37$1);
    p37$2 := (if !v190$2 then !v190$2 else p37$2);
    $36$1 := (if p36$1 then 0bv32 else $36$1);
    $36$2 := (if p36$2 then 0bv32 else $36$2);
    v191$1 := (if p37$1 then BV32_SGE(v0$1, 32768bv32) else v191$1);
    v191$2 := (if p37$2 then BV32_SGE(v0$2, 32768bv32) else v191$2);
    p38$1 := (if p37$1 && v191$1 then v191$1 else p38$1);
    p38$2 := (if p37$2 && v191$2 then v191$2 else p38$2);
    p39$1 := (if p37$1 && !v191$1 then !v191$1 else p39$1);
    p39$2 := (if p37$2 && !v191$2 then !v191$2 else p39$2);
    $37$1 := (if p38$1 then 32767bv32 else $37$1);
    $37$2 := (if p38$2 then 32767bv32 else $37$2);
    $37$1 := (if p39$1 then v0$1 else $37$1);
    $37$2 := (if p39$2 then v0$2 else $37$2);
    $36$1 := (if p37$1 then $37$1 else $36$1);
    $36$2 := (if p37$2 then $37$2 else $36$2);
    goto $truebb37, $falsebb37;

  $falsebb37:
    assume {:partition} true && true;
    goto $truebb38, $falsebb38;

  $falsebb38:
    assume {:partition} true && true;
    $39 := 1bv32;
    goto $110;

  $110:
    $38 := $39;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit101;

  $_Z11read_imagefPU3AS1vjDv2_i.exit101:
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
    v209$1 := BV32_SLT(v0$1, 0bv32);
    v209$2 := BV32_SLT(v0$2, 0bv32);
    p40$1 := (if v209$1 then v209$1 else p40$1);
    p40$2 := (if v209$2 then v209$2 else p40$2);
    p41$1 := (if !v209$1 then !v209$1 else p41$1);
    p41$2 := (if !v209$2 then !v209$2 else p41$2);
    $40$1 := (if p40$1 then 0bv32 else $40$1);
    $40$2 := (if p40$2 then 0bv32 else $40$2);
    v210$1 := (if p41$1 then BV32_SGE(v0$1, 32768bv32) else v210$1);
    v210$2 := (if p41$2 then BV32_SGE(v0$2, 32768bv32) else v210$2);
    p42$1 := (if p41$1 && v210$1 then v210$1 else p42$1);
    p42$2 := (if p41$2 && v210$2 then v210$2 else p42$2);
    p43$1 := (if p41$1 && !v210$1 then !v210$1 else p43$1);
    p43$2 := (if p41$2 && !v210$2 then !v210$2 else p43$2);
    $41$1 := (if p42$1 then 32767bv32 else $41$1);
    $41$2 := (if p42$2 then 32767bv32 else $41$2);
    $41$1 := (if p43$1 then v0$1 else $41$1);
    $41$2 := (if p43$2 then v0$2 else $41$2);
    $40$1 := (if p41$1 then $41$1 else $40$1);
    $40$2 := (if p41$2 then $41$2 else $40$2);
    goto $truebb41, $falsebb41;

  $falsebb41:
    assume {:partition} true && true;
    goto $truebb42, $falsebb42;

  $falsebb42:
    assume {:partition} true && true;
    $43 := 2bv32;
    goto $121;

  $121:
    $42 := $43;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit97;

  $_Z11read_imagefPU3AS1vjDv2_i.exit97:
    havoc v211$1, v211$2;
    havoc v212$1, v212$2;
    havoc v213$1, v213$2;
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
    v227$1 := $$imageSampler$1[0bv32];
    v227$2 := $$imageSampler$2[0bv32];
    v228$1 := BV32_SLT(v0$1, 0bv32);
    v228$2 := BV32_SLT(v0$2, 0bv32);
    p44$1 := (if v228$1 then v228$1 else p44$1);
    p44$2 := (if v228$2 then v228$2 else p44$2);
    p45$1 := (if !v228$1 then !v228$1 else p45$1);
    p45$2 := (if !v228$2 then !v228$2 else p45$2);
    $44$1 := (if p44$1 then 0bv32 else $44$1);
    $44$2 := (if p44$2 then 0bv32 else $44$2);
    v229$1 := (if p45$1 then BV32_SGE(v0$1, 32768bv32) else v229$1);
    v229$2 := (if p45$2 then BV32_SGE(v0$2, 32768bv32) else v229$2);
    p46$1 := (if p45$1 && v229$1 then v229$1 else p46$1);
    p46$2 := (if p45$2 && v229$2 then v229$2 else p46$2);
    p47$1 := (if p45$1 && !v229$1 then !v229$1 else p47$1);
    p47$2 := (if p45$2 && !v229$2 then !v229$2 else p47$2);
    $45$1 := (if p46$1 then 32767bv32 else $45$1);
    $45$2 := (if p46$2 then 32767bv32 else $45$2);
    $45$1 := (if p47$1 then v0$1 else $45$1);
    $45$2 := (if p47$2 then v0$2 else $45$2);
    $44$1 := (if p45$1 then $45$1 else $44$1);
    $44$2 := (if p45$2 then $45$2 else $44$2);
    goto $truebb45, $falsebb45;

  $falsebb45:
    assume {:partition} true && true;
    goto $truebb46, $falsebb46;

  $falsebb46:
    assume {:partition} true && true;
    $47 := 3bv32;
    goto $132;

  $132:
    $46 := $47;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit93;

  $_Z11read_imagefPU3AS1vjDv2_i.exit93:
    havoc v230$1, v230$2;
    havoc v231$1, v231$2;
    havoc v232$1, v232$2;
    havoc v233$1, v233$2;
    havoc v234$1, v234$2;
    havoc v235$1, v235$2;
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
    v246$1 := v17$1 ++ v16$1 ++ v15$1 ++ v14$1;
    v246$2 := v17$2 ++ v16$2 ++ v15$2 ++ v14$2;
    v247$1 := v21$1 ++ v20$1 ++ v19$1 ++ v18$1;
    v247$2 := v21$2 ++ v20$2 ++ v19$2 ++ v18$2;
    v248$1 := v25$1 ++ v24$1 ++ v23$1 ++ v22$1;
    v248$2 := v25$2 ++ v24$2 ++ v23$2 ++ v22$2;
    v249$1 := v29$1 ++ v28$1 ++ v27$1 ++ v26$1;
    v249$2 := v29$2 ++ v28$2 ++ v27$2 ++ v26$2;
    v250$1 := v37$1 ++ v36$1 ++ v35$1 ++ v34$1;
    v250$2 := v37$2 ++ v36$2 ++ v35$2 ++ v34$2;
    v251$1 := v41$1 ++ v40$1 ++ v39$1 ++ v38$1;
    v251$2 := v41$2 ++ v40$2 ++ v39$2 ++ v38$2;
    v252$1 := v45$1 ++ v44$1 ++ v43$1 ++ v42$1;
    v252$2 := v45$2 ++ v44$2 ++ v43$2 ++ v42$2;
    v253$1 := v49$1 ++ v48$1 ++ v47$1 ++ v46$1;
    v253$2 := v49$2 ++ v48$2 ++ v47$2 ++ v46$2;
    v254$1 := v57$1 ++ v56$1 ++ v55$1 ++ v54$1;
    v254$2 := v57$2 ++ v56$2 ++ v55$2 ++ v54$2;
    v255$1 := v61$1 ++ v60$1 ++ v59$1 ++ v58$1;
    v255$2 := v61$2 ++ v60$2 ++ v59$2 ++ v58$2;
    v256$1 := v65$1 ++ v64$1 ++ v63$1 ++ v62$1;
    v256$2 := v65$2 ++ v64$2 ++ v63$2 ++ v62$2;
    v257$1 := v69$1 ++ v68$1 ++ v67$1 ++ v66$1;
    v257$2 := v69$2 ++ v68$2 ++ v67$2 ++ v66$2;
    v258$1 := v77$1 ++ v76$1 ++ v75$1 ++ v74$1;
    v258$2 := v77$2 ++ v76$2 ++ v75$2 ++ v74$2;
    v259$1 := v81$1 ++ v80$1 ++ v79$1 ++ v78$1;
    v259$2 := v81$2 ++ v80$2 ++ v79$2 ++ v78$2;
    v260$1 := v85$1 ++ v84$1 ++ v83$1 ++ v82$1;
    v260$2 := v85$2 ++ v84$2 ++ v83$2 ++ v82$2;
    v261$1 := v89$1 ++ v88$1 ++ v87$1 ++ v86$1;
    v261$2 := v89$2 ++ v88$2 ++ v87$2 ++ v86$2;
    v262$1 := v97$1 ++ v96$1 ++ v95$1 ++ v94$1;
    v262$2 := v97$2 ++ v96$2 ++ v95$2 ++ v94$2;
    v263$1 := v101$1 ++ v100$1 ++ v99$1 ++ v98$1;
    v263$2 := v101$2 ++ v100$2 ++ v99$2 ++ v98$2;
    v264$1 := v105$1 ++ v104$1 ++ v103$1 ++ v102$1;
    v264$2 := v105$2 ++ v104$2 ++ v103$2 ++ v102$2;
    v265$1 := v109$1 ++ v108$1 ++ v107$1 ++ v106$1;
    v265$2 := v109$2 ++ v108$2 ++ v107$2 ++ v106$2;
    v266$1 := v117$1 ++ v116$1 ++ v115$1 ++ v114$1;
    v266$2 := v117$2 ++ v116$2 ++ v115$2 ++ v114$2;
    v267$1 := v121$1 ++ v120$1 ++ v119$1 ++ v118$1;
    v267$2 := v121$2 ++ v120$2 ++ v119$2 ++ v118$2;
    v268$1 := v125$1 ++ v124$1 ++ v123$1 ++ v122$1;
    v268$2 := v125$2 ++ v124$2 ++ v123$2 ++ v122$2;
    v269$1 := v129$1 ++ v128$1 ++ v127$1 ++ v126$1;
    v269$2 := v129$2 ++ v128$2 ++ v127$2 ++ v126$2;
    v270$1 := v137$1 ++ v136$1 ++ v135$1 ++ v134$1;
    v270$2 := v137$2 ++ v136$2 ++ v135$2 ++ v134$2;
    v271$1 := v141$1 ++ v140$1 ++ v139$1 ++ v138$1;
    v271$2 := v141$2 ++ v140$2 ++ v139$2 ++ v138$2;
    v272$1 := v145$1 ++ v144$1 ++ v143$1 ++ v142$1;
    v272$2 := v145$2 ++ v144$2 ++ v143$2 ++ v142$2;
    v273$1 := v149$1 ++ v148$1 ++ v147$1 ++ v146$1;
    v273$2 := v149$2 ++ v148$2 ++ v147$2 ++ v146$2;
    v274$1 := v157$1 ++ v156$1 ++ v155$1 ++ v154$1;
    v274$2 := v157$2 ++ v156$2 ++ v155$2 ++ v154$2;
    v275$1 := v161$1 ++ v160$1 ++ v159$1 ++ v158$1;
    v275$2 := v161$2 ++ v160$2 ++ v159$2 ++ v158$2;
    v276$1 := v165$1 ++ v164$1 ++ v163$1 ++ v162$1;
    v276$2 := v165$2 ++ v164$2 ++ v163$2 ++ v162$2;
    v277$1 := v169$1 ++ v168$1 ++ v167$1 ++ v166$1;
    v277$2 := v169$2 ++ v168$2 ++ v167$2 ++ v166$2;
    $sum0.0$1, $sum1.0$1, $sum2.0$1, $sum3.0$1, $sum4.0$1, $sum5.0$1, $sum6.0$1, $sum7.0$1, $i.0 := FADD32(FMUL32(v249$1, v245$1 ++ v244$1 ++ v243$1 ++ v242$1), FADD32(FMUL32(v248$1, v226$1 ++ v225$1 ++ v224$1 ++ v223$1), FADD32(FMUL32(v247$1, v207$1 ++ v206$1 ++ v205$1 ++ v204$1), FMUL32(v246$1, v188$1 ++ v187$1 ++ v186$1 ++ v185$1)))) ++ FADD32(FMUL32(v249$1, v241$1 ++ v240$1 ++ v239$1 ++ v238$1), FADD32(FMUL32(v248$1, v222$1 ++ v221$1 ++ v220$1 ++ v219$1), FADD32(FMUL32(v247$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v246$1, v184$1 ++ v183$1 ++ v182$1 ++ v181$1)))) ++ FADD32(FMUL32(v249$1, v237$1 ++ v236$1 ++ v235$1 ++ v234$1), FADD32(FMUL32(v248$1, v218$1 ++ v217$1 ++ v216$1 ++ v215$1), FADD32(FMUL32(v247$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v246$1, v180$1 ++ v179$1 ++ v178$1 ++ v177$1)))) ++ FADD32(FMUL32(v249$1, v233$1 ++ v232$1 ++ v231$1 ++ v230$1), FADD32(FMUL32(v248$1, v214$1 ++ v213$1 ++ v212$1 ++ v211$1), FADD32(FMUL32(v247$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v246$1, v176$1 ++ v175$1 ++ v174$1 ++ v173$1)))), FADD32(FMUL32(v253$1, v245$1 ++ v244$1 ++ v243$1 ++ v242$1), FADD32(FMUL32(v252$1, v226$1 ++ v225$1 ++ v224$1 ++ v223$1), FADD32(FMUL32(v251$1, v207$1 ++ v206$1 ++ v205$1 ++ v204$1), FMUL32(v250$1, v188$1 ++ v187$1 ++ v186$1 ++ v185$1)))) ++ FADD32(FMUL32(v253$1, v241$1 ++ v240$1 ++ v239$1 ++ v238$1), FADD32(FMUL32(v252$1, v222$1 ++ v221$1 ++ v220$1 ++ v219$1), FADD32(FMUL32(v251$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v250$1, v184$1 ++ v183$1 ++ v182$1 ++ v181$1)))) ++ FADD32(FMUL32(v253$1, v237$1 ++ v236$1 ++ v235$1 ++ v234$1), FADD32(FMUL32(v252$1, v218$1 ++ v217$1 ++ v216$1 ++ v215$1), FADD32(FMUL32(v251$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v250$1, v180$1 ++ v179$1 ++ v178$1 ++ v177$1)))) ++ FADD32(FMUL32(v253$1, v233$1 ++ v232$1 ++ v231$1 ++ v230$1), FADD32(FMUL32(v252$1, v214$1 ++ v213$1 ++ v212$1 ++ v211$1), FADD32(FMUL32(v251$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v250$1, v176$1 ++ v175$1 ++ v174$1 ++ v173$1)))), FADD32(FMUL32(v257$1, v245$1 ++ v244$1 ++ v243$1 ++ v242$1), FADD32(FMUL32(v256$1, v226$1 ++ v225$1 ++ v224$1 ++ v223$1), FADD32(FMUL32(v255$1, v207$1 ++ v206$1 ++ v205$1 ++ v204$1), FMUL32(v254$1, v188$1 ++ v187$1 ++ v186$1 ++ v185$1)))) ++ FADD32(FMUL32(v257$1, v241$1 ++ v240$1 ++ v239$1 ++ v238$1), FADD32(FMUL32(v256$1, v222$1 ++ v221$1 ++ v220$1 ++ v219$1), FADD32(FMUL32(v255$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v254$1, v184$1 ++ v183$1 ++ v182$1 ++ v181$1)))) ++ FADD32(FMUL32(v257$1, v237$1 ++ v236$1 ++ v235$1 ++ v234$1), FADD32(FMUL32(v256$1, v218$1 ++ v217$1 ++ v216$1 ++ v215$1), FADD32(FMUL32(v255$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v254$1, v180$1 ++ v179$1 ++ v178$1 ++ v177$1)))) ++ FADD32(FMUL32(v257$1, v233$1 ++ v232$1 ++ v231$1 ++ v230$1), FADD32(FMUL32(v256$1, v214$1 ++ v213$1 ++ v212$1 ++ v211$1), FADD32(FMUL32(v255$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v254$1, v176$1 ++ v175$1 ++ v174$1 ++ v173$1)))), FADD32(FMUL32(v261$1, v245$1 ++ v244$1 ++ v243$1 ++ v242$1), FADD32(FMUL32(v260$1, v226$1 ++ v225$1 ++ v224$1 ++ v223$1), FADD32(FMUL32(v259$1, v207$1 ++ v206$1 ++ v205$1 ++ v204$1), FMUL32(v258$1, v188$1 ++ v187$1 ++ v186$1 ++ v185$1)))) ++ FADD32(FMUL32(v261$1, v241$1 ++ v240$1 ++ v239$1 ++ v238$1), FADD32(FMUL32(v260$1, v222$1 ++ v221$1 ++ v220$1 ++ v219$1), FADD32(FMUL32(v259$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v258$1, v184$1 ++ v183$1 ++ v182$1 ++ v181$1)))) ++ FADD32(FMUL32(v261$1, v237$1 ++ v236$1 ++ v235$1 ++ v234$1), FADD32(FMUL32(v260$1, v218$1 ++ v217$1 ++ v216$1 ++ v215$1), FADD32(FMUL32(v259$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v258$1, v180$1 ++ v179$1 ++ v178$1 ++ v177$1)))) ++ FADD32(FMUL32(v261$1, v233$1 ++ v232$1 ++ v231$1 ++ v230$1), FADD32(FMUL32(v260$1, v214$1 ++ v213$1 ++ v212$1 ++ v211$1), FADD32(FMUL32(v259$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v258$1, v176$1 ++ v175$1 ++ v174$1 ++ v173$1)))), FADD32(FMUL32(v265$1, v245$1 ++ v244$1 ++ v243$1 ++ v242$1), FADD32(FMUL32(v264$1, v226$1 ++ v225$1 ++ v224$1 ++ v223$1), FADD32(FMUL32(v263$1, v207$1 ++ v206$1 ++ v205$1 ++ v204$1), FMUL32(v262$1, v188$1 ++ v187$1 ++ v186$1 ++ v185$1)))) ++ FADD32(FMUL32(v265$1, v241$1 ++ v240$1 ++ v239$1 ++ v238$1), FADD32(FMUL32(v264$1, v222$1 ++ v221$1 ++ v220$1 ++ v219$1), FADD32(FMUL32(v263$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v262$1, v184$1 ++ v183$1 ++ v182$1 ++ v181$1)))) ++ FADD32(FMUL32(v265$1, v237$1 ++ v236$1 ++ v235$1 ++ v234$1), FADD32(FMUL32(v264$1, v218$1 ++ v217$1 ++ v216$1 ++ v215$1), FADD32(FMUL32(v263$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v262$1, v180$1 ++ v179$1 ++ v178$1 ++ v177$1)))) ++ FADD32(FMUL32(v265$1, v233$1 ++ v232$1 ++ v231$1 ++ v230$1), FADD32(FMUL32(v264$1, v214$1 ++ v213$1 ++ v212$1 ++ v211$1), FADD32(FMUL32(v263$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v262$1, v176$1 ++ v175$1 ++ v174$1 ++ v173$1)))), FADD32(FMUL32(v269$1, v245$1 ++ v244$1 ++ v243$1 ++ v242$1), FADD32(FMUL32(v268$1, v226$1 ++ v225$1 ++ v224$1 ++ v223$1), FADD32(FMUL32(v267$1, v207$1 ++ v206$1 ++ v205$1 ++ v204$1), FMUL32(v266$1, v188$1 ++ v187$1 ++ v186$1 ++ v185$1)))) ++ FADD32(FMUL32(v269$1, v241$1 ++ v240$1 ++ v239$1 ++ v238$1), FADD32(FMUL32(v268$1, v222$1 ++ v221$1 ++ v220$1 ++ v219$1), FADD32(FMUL32(v267$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v266$1, v184$1 ++ v183$1 ++ v182$1 ++ v181$1)))) ++ FADD32(FMUL32(v269$1, v237$1 ++ v236$1 ++ v235$1 ++ v234$1), FADD32(FMUL32(v268$1, v218$1 ++ v217$1 ++ v216$1 ++ v215$1), FADD32(FMUL32(v267$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v266$1, v180$1 ++ v179$1 ++ v178$1 ++ v177$1)))) ++ FADD32(FMUL32(v269$1, v233$1 ++ v232$1 ++ v231$1 ++ v230$1), FADD32(FMUL32(v268$1, v214$1 ++ v213$1 ++ v212$1 ++ v211$1), FADD32(FMUL32(v267$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v266$1, v176$1 ++ v175$1 ++ v174$1 ++ v173$1)))), FADD32(FMUL32(v273$1, v245$1 ++ v244$1 ++ v243$1 ++ v242$1), FADD32(FMUL32(v272$1, v226$1 ++ v225$1 ++ v224$1 ++ v223$1), FADD32(FMUL32(v271$1, v207$1 ++ v206$1 ++ v205$1 ++ v204$1), FMUL32(v270$1, v188$1 ++ v187$1 ++ v186$1 ++ v185$1)))) ++ FADD32(FMUL32(v273$1, v241$1 ++ v240$1 ++ v239$1 ++ v238$1), FADD32(FMUL32(v272$1, v222$1 ++ v221$1 ++ v220$1 ++ v219$1), FADD32(FMUL32(v271$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v270$1, v184$1 ++ v183$1 ++ v182$1 ++ v181$1)))) ++ FADD32(FMUL32(v273$1, v237$1 ++ v236$1 ++ v235$1 ++ v234$1), FADD32(FMUL32(v272$1, v218$1 ++ v217$1 ++ v216$1 ++ v215$1), FADD32(FMUL32(v271$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v270$1, v180$1 ++ v179$1 ++ v178$1 ++ v177$1)))) ++ FADD32(FMUL32(v273$1, v233$1 ++ v232$1 ++ v231$1 ++ v230$1), FADD32(FMUL32(v272$1, v214$1 ++ v213$1 ++ v212$1 ++ v211$1), FADD32(FMUL32(v271$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v270$1, v176$1 ++ v175$1 ++ v174$1 ++ v173$1)))), FADD32(FMUL32(v277$1, v245$1 ++ v244$1 ++ v243$1 ++ v242$1), FADD32(FMUL32(v276$1, v226$1 ++ v225$1 ++ v224$1 ++ v223$1), FADD32(FMUL32(v275$1, v207$1 ++ v206$1 ++ v205$1 ++ v204$1), FMUL32(v274$1, v188$1 ++ v187$1 ++ v186$1 ++ v185$1)))) ++ FADD32(FMUL32(v277$1, v241$1 ++ v240$1 ++ v239$1 ++ v238$1), FADD32(FMUL32(v276$1, v222$1 ++ v221$1 ++ v220$1 ++ v219$1), FADD32(FMUL32(v275$1, v203$1 ++ v202$1 ++ v201$1 ++ v200$1), FMUL32(v274$1, v184$1 ++ v183$1 ++ v182$1 ++ v181$1)))) ++ FADD32(FMUL32(v277$1, v237$1 ++ v236$1 ++ v235$1 ++ v234$1), FADD32(FMUL32(v276$1, v218$1 ++ v217$1 ++ v216$1 ++ v215$1), FADD32(FMUL32(v275$1, v199$1 ++ v198$1 ++ v197$1 ++ v196$1), FMUL32(v274$1, v180$1 ++ v179$1 ++ v178$1 ++ v177$1)))) ++ FADD32(FMUL32(v277$1, v233$1 ++ v232$1 ++ v231$1 ++ v230$1), FADD32(FMUL32(v276$1, v214$1 ++ v213$1 ++ v212$1 ++ v211$1), FADD32(FMUL32(v275$1, v195$1 ++ v194$1 ++ v193$1 ++ v192$1), FMUL32(v274$1, v176$1 ++ v175$1 ++ v174$1 ++ v173$1)))), 4bv32;
    $sum0.0$2, $sum1.0$2, $sum2.0$2, $sum3.0$2, $sum4.0$2, $sum5.0$2, $sum6.0$2, $sum7.0$2 := FADD32(FMUL32(v249$2, v245$2 ++ v244$2 ++ v243$2 ++ v242$2), FADD32(FMUL32(v248$2, v226$2 ++ v225$2 ++ v224$2 ++ v223$2), FADD32(FMUL32(v247$2, v207$2 ++ v206$2 ++ v205$2 ++ v204$2), FMUL32(v246$2, v188$2 ++ v187$2 ++ v186$2 ++ v185$2)))) ++ FADD32(FMUL32(v249$2, v241$2 ++ v240$2 ++ v239$2 ++ v238$2), FADD32(FMUL32(v248$2, v222$2 ++ v221$2 ++ v220$2 ++ v219$2), FADD32(FMUL32(v247$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v246$2, v184$2 ++ v183$2 ++ v182$2 ++ v181$2)))) ++ FADD32(FMUL32(v249$2, v237$2 ++ v236$2 ++ v235$2 ++ v234$2), FADD32(FMUL32(v248$2, v218$2 ++ v217$2 ++ v216$2 ++ v215$2), FADD32(FMUL32(v247$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v246$2, v180$2 ++ v179$2 ++ v178$2 ++ v177$2)))) ++ FADD32(FMUL32(v249$2, v233$2 ++ v232$2 ++ v231$2 ++ v230$2), FADD32(FMUL32(v248$2, v214$2 ++ v213$2 ++ v212$2 ++ v211$2), FADD32(FMUL32(v247$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v246$2, v176$2 ++ v175$2 ++ v174$2 ++ v173$2)))), FADD32(FMUL32(v253$2, v245$2 ++ v244$2 ++ v243$2 ++ v242$2), FADD32(FMUL32(v252$2, v226$2 ++ v225$2 ++ v224$2 ++ v223$2), FADD32(FMUL32(v251$2, v207$2 ++ v206$2 ++ v205$2 ++ v204$2), FMUL32(v250$2, v188$2 ++ v187$2 ++ v186$2 ++ v185$2)))) ++ FADD32(FMUL32(v253$2, v241$2 ++ v240$2 ++ v239$2 ++ v238$2), FADD32(FMUL32(v252$2, v222$2 ++ v221$2 ++ v220$2 ++ v219$2), FADD32(FMUL32(v251$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v250$2, v184$2 ++ v183$2 ++ v182$2 ++ v181$2)))) ++ FADD32(FMUL32(v253$2, v237$2 ++ v236$2 ++ v235$2 ++ v234$2), FADD32(FMUL32(v252$2, v218$2 ++ v217$2 ++ v216$2 ++ v215$2), FADD32(FMUL32(v251$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v250$2, v180$2 ++ v179$2 ++ v178$2 ++ v177$2)))) ++ FADD32(FMUL32(v253$2, v233$2 ++ v232$2 ++ v231$2 ++ v230$2), FADD32(FMUL32(v252$2, v214$2 ++ v213$2 ++ v212$2 ++ v211$2), FADD32(FMUL32(v251$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v250$2, v176$2 ++ v175$2 ++ v174$2 ++ v173$2)))), FADD32(FMUL32(v257$2, v245$2 ++ v244$2 ++ v243$2 ++ v242$2), FADD32(FMUL32(v256$2, v226$2 ++ v225$2 ++ v224$2 ++ v223$2), FADD32(FMUL32(v255$2, v207$2 ++ v206$2 ++ v205$2 ++ v204$2), FMUL32(v254$2, v188$2 ++ v187$2 ++ v186$2 ++ v185$2)))) ++ FADD32(FMUL32(v257$2, v241$2 ++ v240$2 ++ v239$2 ++ v238$2), FADD32(FMUL32(v256$2, v222$2 ++ v221$2 ++ v220$2 ++ v219$2), FADD32(FMUL32(v255$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v254$2, v184$2 ++ v183$2 ++ v182$2 ++ v181$2)))) ++ FADD32(FMUL32(v257$2, v237$2 ++ v236$2 ++ v235$2 ++ v234$2), FADD32(FMUL32(v256$2, v218$2 ++ v217$2 ++ v216$2 ++ v215$2), FADD32(FMUL32(v255$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v254$2, v180$2 ++ v179$2 ++ v178$2 ++ v177$2)))) ++ FADD32(FMUL32(v257$2, v233$2 ++ v232$2 ++ v231$2 ++ v230$2), FADD32(FMUL32(v256$2, v214$2 ++ v213$2 ++ v212$2 ++ v211$2), FADD32(FMUL32(v255$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v254$2, v176$2 ++ v175$2 ++ v174$2 ++ v173$2)))), FADD32(FMUL32(v261$2, v245$2 ++ v244$2 ++ v243$2 ++ v242$2), FADD32(FMUL32(v260$2, v226$2 ++ v225$2 ++ v224$2 ++ v223$2), FADD32(FMUL32(v259$2, v207$2 ++ v206$2 ++ v205$2 ++ v204$2), FMUL32(v258$2, v188$2 ++ v187$2 ++ v186$2 ++ v185$2)))) ++ FADD32(FMUL32(v261$2, v241$2 ++ v240$2 ++ v239$2 ++ v238$2), FADD32(FMUL32(v260$2, v222$2 ++ v221$2 ++ v220$2 ++ v219$2), FADD32(FMUL32(v259$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v258$2, v184$2 ++ v183$2 ++ v182$2 ++ v181$2)))) ++ FADD32(FMUL32(v261$2, v237$2 ++ v236$2 ++ v235$2 ++ v234$2), FADD32(FMUL32(v260$2, v218$2 ++ v217$2 ++ v216$2 ++ v215$2), FADD32(FMUL32(v259$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v258$2, v180$2 ++ v179$2 ++ v178$2 ++ v177$2)))) ++ FADD32(FMUL32(v261$2, v233$2 ++ v232$2 ++ v231$2 ++ v230$2), FADD32(FMUL32(v260$2, v214$2 ++ v213$2 ++ v212$2 ++ v211$2), FADD32(FMUL32(v259$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v258$2, v176$2 ++ v175$2 ++ v174$2 ++ v173$2)))), FADD32(FMUL32(v265$2, v245$2 ++ v244$2 ++ v243$2 ++ v242$2), FADD32(FMUL32(v264$2, v226$2 ++ v225$2 ++ v224$2 ++ v223$2), FADD32(FMUL32(v263$2, v207$2 ++ v206$2 ++ v205$2 ++ v204$2), FMUL32(v262$2, v188$2 ++ v187$2 ++ v186$2 ++ v185$2)))) ++ FADD32(FMUL32(v265$2, v241$2 ++ v240$2 ++ v239$2 ++ v238$2), FADD32(FMUL32(v264$2, v222$2 ++ v221$2 ++ v220$2 ++ v219$2), FADD32(FMUL32(v263$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v262$2, v184$2 ++ v183$2 ++ v182$2 ++ v181$2)))) ++ FADD32(FMUL32(v265$2, v237$2 ++ v236$2 ++ v235$2 ++ v234$2), FADD32(FMUL32(v264$2, v218$2 ++ v217$2 ++ v216$2 ++ v215$2), FADD32(FMUL32(v263$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v262$2, v180$2 ++ v179$2 ++ v178$2 ++ v177$2)))) ++ FADD32(FMUL32(v265$2, v233$2 ++ v232$2 ++ v231$2 ++ v230$2), FADD32(FMUL32(v264$2, v214$2 ++ v213$2 ++ v212$2 ++ v211$2), FADD32(FMUL32(v263$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v262$2, v176$2 ++ v175$2 ++ v174$2 ++ v173$2)))), FADD32(FMUL32(v269$2, v245$2 ++ v244$2 ++ v243$2 ++ v242$2), FADD32(FMUL32(v268$2, v226$2 ++ v225$2 ++ v224$2 ++ v223$2), FADD32(FMUL32(v267$2, v207$2 ++ v206$2 ++ v205$2 ++ v204$2), FMUL32(v266$2, v188$2 ++ v187$2 ++ v186$2 ++ v185$2)))) ++ FADD32(FMUL32(v269$2, v241$2 ++ v240$2 ++ v239$2 ++ v238$2), FADD32(FMUL32(v268$2, v222$2 ++ v221$2 ++ v220$2 ++ v219$2), FADD32(FMUL32(v267$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v266$2, v184$2 ++ v183$2 ++ v182$2 ++ v181$2)))) ++ FADD32(FMUL32(v269$2, v237$2 ++ v236$2 ++ v235$2 ++ v234$2), FADD32(FMUL32(v268$2, v218$2 ++ v217$2 ++ v216$2 ++ v215$2), FADD32(FMUL32(v267$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v266$2, v180$2 ++ v179$2 ++ v178$2 ++ v177$2)))) ++ FADD32(FMUL32(v269$2, v233$2 ++ v232$2 ++ v231$2 ++ v230$2), FADD32(FMUL32(v268$2, v214$2 ++ v213$2 ++ v212$2 ++ v211$2), FADD32(FMUL32(v267$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v266$2, v176$2 ++ v175$2 ++ v174$2 ++ v173$2)))), FADD32(FMUL32(v273$2, v245$2 ++ v244$2 ++ v243$2 ++ v242$2), FADD32(FMUL32(v272$2, v226$2 ++ v225$2 ++ v224$2 ++ v223$2), FADD32(FMUL32(v271$2, v207$2 ++ v206$2 ++ v205$2 ++ v204$2), FMUL32(v270$2, v188$2 ++ v187$2 ++ v186$2 ++ v185$2)))) ++ FADD32(FMUL32(v273$2, v241$2 ++ v240$2 ++ v239$2 ++ v238$2), FADD32(FMUL32(v272$2, v222$2 ++ v221$2 ++ v220$2 ++ v219$2), FADD32(FMUL32(v271$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v270$2, v184$2 ++ v183$2 ++ v182$2 ++ v181$2)))) ++ FADD32(FMUL32(v273$2, v237$2 ++ v236$2 ++ v235$2 ++ v234$2), FADD32(FMUL32(v272$2, v218$2 ++ v217$2 ++ v216$2 ++ v215$2), FADD32(FMUL32(v271$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v270$2, v180$2 ++ v179$2 ++ v178$2 ++ v177$2)))) ++ FADD32(FMUL32(v273$2, v233$2 ++ v232$2 ++ v231$2 ++ v230$2), FADD32(FMUL32(v272$2, v214$2 ++ v213$2 ++ v212$2 ++ v211$2), FADD32(FMUL32(v271$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v270$2, v176$2 ++ v175$2 ++ v174$2 ++ v173$2)))), FADD32(FMUL32(v277$2, v245$2 ++ v244$2 ++ v243$2 ++ v242$2), FADD32(FMUL32(v276$2, v226$2 ++ v225$2 ++ v224$2 ++ v223$2), FADD32(FMUL32(v275$2, v207$2 ++ v206$2 ++ v205$2 ++ v204$2), FMUL32(v274$2, v188$2 ++ v187$2 ++ v186$2 ++ v185$2)))) ++ FADD32(FMUL32(v277$2, v241$2 ++ v240$2 ++ v239$2 ++ v238$2), FADD32(FMUL32(v276$2, v222$2 ++ v221$2 ++ v220$2 ++ v219$2), FADD32(FMUL32(v275$2, v203$2 ++ v202$2 ++ v201$2 ++ v200$2), FMUL32(v274$2, v184$2 ++ v183$2 ++ v182$2 ++ v181$2)))) ++ FADD32(FMUL32(v277$2, v237$2 ++ v236$2 ++ v235$2 ++ v234$2), FADD32(FMUL32(v276$2, v218$2 ++ v217$2 ++ v216$2 ++ v215$2), FADD32(FMUL32(v275$2, v199$2 ++ v198$2 ++ v197$2 ++ v196$2), FMUL32(v274$2, v180$2 ++ v179$2 ++ v178$2 ++ v177$2)))) ++ FADD32(FMUL32(v277$2, v233$2 ++ v232$2 ++ v231$2 ++ v230$2), FADD32(FMUL32(v276$2, v214$2 ++ v213$2 ++ v212$2 ++ v211$2), FADD32(FMUL32(v275$2, v195$2 ++ v194$2 ++ v193$2 ++ v192$2), FMUL32(v274$2, v176$2 ++ v175$2 ++ v174$2 ++ v173$2))));
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $133;

  $133:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 349} true;
    v278 := BV32_ULT($i.0, $widthA);
    p48$1 := false;
    p48$2 := false;
    p49$1 := false;
    p49$2 := false;
    p50$1 := false;
    p50$2 := false;
    p51$1 := false;
    p51$2 := false;
    p52$1 := false;
    p52$2 := false;
    p53$1 := false;
    p53$2 := false;
    p54$1 := false;
    p54$2 := false;
    p55$1 := false;
    p55$2 := false;
    p56$1 := false;
    p56$2 := false;
    p57$1 := false;
    p57$2 := false;
    p58$1 := false;
    p58$2 := false;
    p59$1 := false;
    p59$2 := false;
    p60$1 := false;
    p60$2 := false;
    p61$1 := false;
    p61$2 := false;
    p62$1 := false;
    p62$2 := false;
    p63$1 := false;
    p63$2 := false;
    p64$1 := false;
    p64$2 := false;
    p65$1 := false;
    p65$2 := false;
    p66$1 := false;
    p66$2 := false;
    p67$1 := false;
    p67$2 := false;
    p68$1 := false;
    p68$2 := false;
    p69$1 := false;
    p69$2 := false;
    p70$1 := false;
    p70$2 := false;
    p71$1 := false;
    p71$2 := false;
    p72$1 := false;
    p72$2 := false;
    p73$1 := false;
    p73$2 := false;
    p74$1 := false;
    p74$2 := false;
    p75$1 := false;
    p75$2 := false;
    p76$1 := false;
    p76$2 := false;
    p77$1 := false;
    p77$2 := false;
    p78$1 := false;
    p78$2 := false;
    p79$1 := false;
    p79$2 := false;
    p80$1 := false;
    p80$2 := false;
    p81$1 := false;
    p81$2 := false;
    p82$1 := false;
    p82$2 := false;
    p83$1 := false;
    p83$2 := false;
    p84$1 := false;
    p84$2 := false;
    p85$1 := false;
    p85$2 := false;
    p86$1 := false;
    p86$2 := false;
    p87$1 := false;
    p87$2 := false;
    p88$1 := false;
    p88$2 := false;
    p89$1 := false;
    p89$2 := false;
    p90$1 := false;
    p90$2 := false;
    p91$1 := false;
    p91$2 := false;
    p92$1 := false;
    p92$2 := false;
    p93$1 := false;
    p93$2 := false;
    p94$1 := false;
    p94$2 := false;
    p95$1 := false;
    p95$2 := false;
    goto $truebb47, $falsebb47;

  $falsebb47:
    assume {:partition} !v278 && !v278;
    v567$1 := BV32_MUL(v1$1, 8bv32);
    v567$2 := BV32_MUL(v1$2, 8bv32);
    call {:sourceloc} {:sourceloc_num 701} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), $sum0.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 701} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 701} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), $sum0.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32)] := $sum0.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32)] := $sum0.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 702} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 1bv32), $sum0.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 702} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 702} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 1bv32), $sum0.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 1bv32)] := $sum0.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 1bv32)] := $sum0.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 703} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 2bv32), $sum0.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 703} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 703} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 2bv32), $sum0.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 2bv32)] := $sum0.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 2bv32)] := $sum0.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 704} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 3bv32), $sum0.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 704} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 704} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 3bv32), $sum0.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 3bv32)] := $sum0.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 3bv32)] := $sum0.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 705} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 4bv32), $sum0.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 705} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 705} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 4bv32), $sum0.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 4bv32)] := $sum0.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 4bv32)] := $sum0.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 706} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 5bv32), $sum0.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 706} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 706} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 5bv32), $sum0.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 5bv32)] := $sum0.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 5bv32)] := $sum0.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 707} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 6bv32), $sum0.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 707} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 707} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 6bv32), $sum0.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 6bv32)] := $sum0.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 6bv32)] := $sum0.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 708} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 7bv32), $sum0.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 708} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 708} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 7bv32), $sum0.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 7bv32)] := $sum0.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 7bv32)] := $sum0.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 709} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 8bv32), $sum0.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 709} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 709} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 8bv32), $sum0.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 8bv32)] := $sum0.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 8bv32)] := $sum0.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 710} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 9bv32), $sum0.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 710} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 710} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 9bv32), $sum0.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 9bv32)] := $sum0.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 9bv32)] := $sum0.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 711} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 10bv32), $sum0.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 711} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 711} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 10bv32), $sum0.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 10bv32)] := $sum0.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 10bv32)] := $sum0.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 712} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 11bv32), $sum0.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 712} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 712} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 11bv32), $sum0.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 11bv32)] := $sum0.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 11bv32)] := $sum0.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 713} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 12bv32), $sum0.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 713} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 713} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 12bv32), $sum0.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 12bv32)] := $sum0.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 12bv32)] := $sum0.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 714} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 13bv32), $sum0.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 714} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 714} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 13bv32), $sum0.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 13bv32)] := $sum0.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 13bv32)] := $sum0.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 715} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 14bv32), $sum0.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 715} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 715} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 14bv32), $sum0.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 14bv32)] := $sum0.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 14bv32)] := $sum0.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 716} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 15bv32), $sum0.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 716} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 716} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 15bv32), $sum0.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$1, 32768bv32), v0$1), 16bv32), 15bv32)] := $sum0.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v567$2, 32768bv32), v0$2), 16bv32), 15bv32)] := $sum0.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 717} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), $sum1.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 717} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 717} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), $sum1.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32)] := $sum1.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32)] := $sum1.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 718} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum1.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 718} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 718} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum1.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum1.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum1.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 719} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum1.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 719} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 719} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum1.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum1.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum1.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 720} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum1.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 720} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 720} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum1.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum1.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum1.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 721} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum1.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 721} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 721} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum1.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum1.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum1.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 722} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum1.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 722} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 722} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum1.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum1.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum1.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 723} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum1.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 723} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 723} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum1.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum1.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum1.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 724} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum1.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 724} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 724} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum1.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum1.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum1.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 725} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum1.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 725} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 725} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum1.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum1.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum1.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 726} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum1.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 726} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 726} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum1.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum1.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum1.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 727} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum1.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 727} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 727} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum1.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum1.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum1.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 728} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum1.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 728} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 728} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum1.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum1.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum1.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 729} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum1.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 729} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 729} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum1.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum1.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum1.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 730} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum1.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 730} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 730} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum1.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum1.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum1.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 731} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum1.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 731} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 731} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum1.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum1.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum1.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 732} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum1.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 732} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 732} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum1.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 1bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum1.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 1bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum1.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 733} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), $sum2.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 733} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 733} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), $sum2.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32)] := $sum2.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32)] := $sum2.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 734} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum2.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 734} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 734} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum2.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum2.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum2.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 735} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum2.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 735} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 735} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum2.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum2.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum2.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 736} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum2.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 736} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 736} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum2.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum2.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum2.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 737} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum2.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 737} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 737} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum2.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum2.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum2.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 738} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum2.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 738} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 738} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum2.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum2.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum2.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 739} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum2.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 739} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 739} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum2.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum2.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum2.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 740} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum2.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 740} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 740} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum2.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum2.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum2.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 741} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum2.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 741} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 741} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum2.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum2.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum2.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 742} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum2.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 742} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 742} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum2.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum2.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum2.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 743} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum2.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 743} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 743} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum2.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum2.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum2.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 744} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum2.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 744} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 744} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum2.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum2.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum2.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 745} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum2.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 745} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 745} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum2.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum2.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum2.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 746} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum2.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 746} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 746} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum2.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum2.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum2.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 747} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum2.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 747} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 747} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum2.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum2.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum2.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 748} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum2.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 748} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 748} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum2.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 2bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum2.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 2bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum2.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 749} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), $sum3.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 749} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 749} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), $sum3.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32)] := $sum3.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32)] := $sum3.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 750} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum3.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 750} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 750} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum3.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum3.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum3.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 751} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum3.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 751} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 751} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum3.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum3.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum3.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 752} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum3.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 752} true;
    call {:check_id "check_state_51"} {:sourceloc} {:sourceloc_num 752} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum3.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum3.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum3.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 753} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum3.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 753} true;
    call {:check_id "check_state_52"} {:sourceloc} {:sourceloc_num 753} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum3.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum3.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum3.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 754} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum3.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 754} true;
    call {:check_id "check_state_53"} {:sourceloc} {:sourceloc_num 754} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum3.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum3.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum3.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 755} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum3.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 755} true;
    call {:check_id "check_state_54"} {:sourceloc} {:sourceloc_num 755} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum3.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum3.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum3.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 756} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum3.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 756} true;
    call {:check_id "check_state_55"} {:sourceloc} {:sourceloc_num 756} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum3.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum3.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum3.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 757} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum3.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_56"} {:captureState "check_state_56"} {:sourceloc} {:sourceloc_num 757} true;
    call {:check_id "check_state_56"} {:sourceloc} {:sourceloc_num 757} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum3.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum3.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum3.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 758} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum3.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_57"} {:captureState "check_state_57"} {:sourceloc} {:sourceloc_num 758} true;
    call {:check_id "check_state_57"} {:sourceloc} {:sourceloc_num 758} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum3.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum3.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum3.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 759} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum3.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_58"} {:captureState "check_state_58"} {:sourceloc} {:sourceloc_num 759} true;
    call {:check_id "check_state_58"} {:sourceloc} {:sourceloc_num 759} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum3.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum3.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum3.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 760} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum3.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_59"} {:captureState "check_state_59"} {:sourceloc} {:sourceloc_num 760} true;
    call {:check_id "check_state_59"} {:sourceloc} {:sourceloc_num 760} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum3.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum3.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum3.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 761} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum3.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_60"} {:captureState "check_state_60"} {:sourceloc} {:sourceloc_num 761} true;
    call {:check_id "check_state_60"} {:sourceloc} {:sourceloc_num 761} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum3.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum3.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum3.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 762} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum3.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_61"} {:captureState "check_state_61"} {:sourceloc} {:sourceloc_num 762} true;
    call {:check_id "check_state_61"} {:sourceloc} {:sourceloc_num 762} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum3.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum3.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum3.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 763} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum3.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_62"} {:captureState "check_state_62"} {:sourceloc} {:sourceloc_num 763} true;
    call {:check_id "check_state_62"} {:sourceloc} {:sourceloc_num 763} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum3.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum3.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum3.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 764} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum3.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_63"} {:captureState "check_state_63"} {:sourceloc} {:sourceloc_num 764} true;
    call {:check_id "check_state_63"} {:sourceloc} {:sourceloc_num 764} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum3.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 3bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum3.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 3bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum3.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 765} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), $sum4.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_64"} {:captureState "check_state_64"} {:sourceloc} {:sourceloc_num 765} true;
    call {:check_id "check_state_64"} {:sourceloc} {:sourceloc_num 765} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), $sum4.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32)] := $sum4.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32)] := $sum4.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 766} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum4.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_65"} {:captureState "check_state_65"} {:sourceloc} {:sourceloc_num 766} true;
    call {:check_id "check_state_65"} {:sourceloc} {:sourceloc_num 766} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum4.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum4.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum4.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 767} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum4.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_66"} {:captureState "check_state_66"} {:sourceloc} {:sourceloc_num 767} true;
    call {:check_id "check_state_66"} {:sourceloc} {:sourceloc_num 767} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum4.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum4.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum4.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 768} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum4.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_67"} {:captureState "check_state_67"} {:sourceloc} {:sourceloc_num 768} true;
    call {:check_id "check_state_67"} {:sourceloc} {:sourceloc_num 768} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum4.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum4.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum4.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 769} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum4.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_68"} {:captureState "check_state_68"} {:sourceloc} {:sourceloc_num 769} true;
    call {:check_id "check_state_68"} {:sourceloc} {:sourceloc_num 769} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum4.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum4.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum4.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 770} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum4.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_69"} {:captureState "check_state_69"} {:sourceloc} {:sourceloc_num 770} true;
    call {:check_id "check_state_69"} {:sourceloc} {:sourceloc_num 770} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum4.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum4.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum4.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 771} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum4.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_70"} {:captureState "check_state_70"} {:sourceloc} {:sourceloc_num 771} true;
    call {:check_id "check_state_70"} {:sourceloc} {:sourceloc_num 771} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum4.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum4.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum4.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 772} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum4.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_71"} {:captureState "check_state_71"} {:sourceloc} {:sourceloc_num 772} true;
    call {:check_id "check_state_71"} {:sourceloc} {:sourceloc_num 772} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum4.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum4.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum4.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 773} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum4.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_72"} {:captureState "check_state_72"} {:sourceloc} {:sourceloc_num 773} true;
    call {:check_id "check_state_72"} {:sourceloc} {:sourceloc_num 773} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum4.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum4.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum4.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 774} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum4.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_73"} {:captureState "check_state_73"} {:sourceloc} {:sourceloc_num 774} true;
    call {:check_id "check_state_73"} {:sourceloc} {:sourceloc_num 774} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum4.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum4.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum4.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 775} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum4.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_74"} {:captureState "check_state_74"} {:sourceloc} {:sourceloc_num 775} true;
    call {:check_id "check_state_74"} {:sourceloc} {:sourceloc_num 775} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum4.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum4.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum4.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 776} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum4.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_75"} {:captureState "check_state_75"} {:sourceloc} {:sourceloc_num 776} true;
    call {:check_id "check_state_75"} {:sourceloc} {:sourceloc_num 776} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum4.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum4.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum4.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 777} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum4.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_76"} {:captureState "check_state_76"} {:sourceloc} {:sourceloc_num 777} true;
    call {:check_id "check_state_76"} {:sourceloc} {:sourceloc_num 777} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum4.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum4.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum4.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 778} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum4.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_77"} {:captureState "check_state_77"} {:sourceloc} {:sourceloc_num 778} true;
    call {:check_id "check_state_77"} {:sourceloc} {:sourceloc_num 778} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum4.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum4.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum4.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 779} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum4.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_78"} {:captureState "check_state_78"} {:sourceloc} {:sourceloc_num 779} true;
    call {:check_id "check_state_78"} {:sourceloc} {:sourceloc_num 779} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum4.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum4.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum4.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 780} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum4.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_79"} {:captureState "check_state_79"} {:sourceloc} {:sourceloc_num 780} true;
    call {:check_id "check_state_79"} {:sourceloc} {:sourceloc_num 780} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum4.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 4bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum4.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 4bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum4.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 781} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), $sum5.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_80"} {:captureState "check_state_80"} {:sourceloc} {:sourceloc_num 781} true;
    call {:check_id "check_state_80"} {:sourceloc} {:sourceloc_num 781} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), $sum5.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32)] := $sum5.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32)] := $sum5.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 782} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum5.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_81"} {:captureState "check_state_81"} {:sourceloc} {:sourceloc_num 782} true;
    call {:check_id "check_state_81"} {:sourceloc} {:sourceloc_num 782} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum5.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum5.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum5.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 783} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum5.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_82"} {:captureState "check_state_82"} {:sourceloc} {:sourceloc_num 783} true;
    call {:check_id "check_state_82"} {:sourceloc} {:sourceloc_num 783} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum5.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum5.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum5.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 784} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum5.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_83"} {:captureState "check_state_83"} {:sourceloc} {:sourceloc_num 784} true;
    call {:check_id "check_state_83"} {:sourceloc} {:sourceloc_num 784} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum5.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum5.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum5.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 785} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum5.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_84"} {:captureState "check_state_84"} {:sourceloc} {:sourceloc_num 785} true;
    call {:check_id "check_state_84"} {:sourceloc} {:sourceloc_num 785} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum5.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum5.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum5.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 786} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum5.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_85"} {:captureState "check_state_85"} {:sourceloc} {:sourceloc_num 786} true;
    call {:check_id "check_state_85"} {:sourceloc} {:sourceloc_num 786} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum5.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum5.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum5.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 787} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum5.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_86"} {:captureState "check_state_86"} {:sourceloc} {:sourceloc_num 787} true;
    call {:check_id "check_state_86"} {:sourceloc} {:sourceloc_num 787} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum5.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum5.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum5.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 788} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum5.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_87"} {:captureState "check_state_87"} {:sourceloc} {:sourceloc_num 788} true;
    call {:check_id "check_state_87"} {:sourceloc} {:sourceloc_num 788} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum5.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum5.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum5.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 789} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum5.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_88"} {:captureState "check_state_88"} {:sourceloc} {:sourceloc_num 789} true;
    call {:check_id "check_state_88"} {:sourceloc} {:sourceloc_num 789} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum5.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum5.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum5.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 790} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum5.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_89"} {:captureState "check_state_89"} {:sourceloc} {:sourceloc_num 790} true;
    call {:check_id "check_state_89"} {:sourceloc} {:sourceloc_num 790} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum5.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum5.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum5.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 791} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum5.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_90"} {:captureState "check_state_90"} {:sourceloc} {:sourceloc_num 791} true;
    call {:check_id "check_state_90"} {:sourceloc} {:sourceloc_num 791} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum5.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum5.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum5.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 792} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum5.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_91"} {:captureState "check_state_91"} {:sourceloc} {:sourceloc_num 792} true;
    call {:check_id "check_state_91"} {:sourceloc} {:sourceloc_num 792} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum5.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum5.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum5.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 793} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum5.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_92"} {:captureState "check_state_92"} {:sourceloc} {:sourceloc_num 793} true;
    call {:check_id "check_state_92"} {:sourceloc} {:sourceloc_num 793} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum5.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum5.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum5.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 794} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum5.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_93"} {:captureState "check_state_93"} {:sourceloc} {:sourceloc_num 794} true;
    call {:check_id "check_state_93"} {:sourceloc} {:sourceloc_num 794} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum5.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum5.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum5.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 795} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum5.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_94"} {:captureState "check_state_94"} {:sourceloc} {:sourceloc_num 795} true;
    call {:check_id "check_state_94"} {:sourceloc} {:sourceloc_num 795} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum5.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum5.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum5.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 796} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum5.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_95"} {:captureState "check_state_95"} {:sourceloc} {:sourceloc_num 796} true;
    call {:check_id "check_state_95"} {:sourceloc} {:sourceloc_num 796} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum5.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 5bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum5.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 5bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum5.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 797} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), $sum6.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_96"} {:captureState "check_state_96"} {:sourceloc} {:sourceloc_num 797} true;
    call {:check_id "check_state_96"} {:sourceloc} {:sourceloc_num 797} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), $sum6.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32)] := $sum6.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32)] := $sum6.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 798} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum6.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_97"} {:captureState "check_state_97"} {:sourceloc} {:sourceloc_num 798} true;
    call {:check_id "check_state_97"} {:sourceloc} {:sourceloc_num 798} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum6.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum6.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum6.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 799} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum6.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_98"} {:captureState "check_state_98"} {:sourceloc} {:sourceloc_num 799} true;
    call {:check_id "check_state_98"} {:sourceloc} {:sourceloc_num 799} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum6.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum6.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum6.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 800} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum6.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_99"} {:captureState "check_state_99"} {:sourceloc} {:sourceloc_num 800} true;
    call {:check_id "check_state_99"} {:sourceloc} {:sourceloc_num 800} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum6.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum6.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum6.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 801} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum6.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_100"} {:captureState "check_state_100"} {:sourceloc} {:sourceloc_num 801} true;
    call {:check_id "check_state_100"} {:sourceloc} {:sourceloc_num 801} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum6.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum6.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum6.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 802} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum6.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_101"} {:captureState "check_state_101"} {:sourceloc} {:sourceloc_num 802} true;
    call {:check_id "check_state_101"} {:sourceloc} {:sourceloc_num 802} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum6.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum6.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum6.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 803} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum6.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_102"} {:captureState "check_state_102"} {:sourceloc} {:sourceloc_num 803} true;
    call {:check_id "check_state_102"} {:sourceloc} {:sourceloc_num 803} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum6.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum6.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum6.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 804} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum6.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_103"} {:captureState "check_state_103"} {:sourceloc} {:sourceloc_num 804} true;
    call {:check_id "check_state_103"} {:sourceloc} {:sourceloc_num 804} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum6.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum6.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum6.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 805} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum6.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_104"} {:captureState "check_state_104"} {:sourceloc} {:sourceloc_num 805} true;
    call {:check_id "check_state_104"} {:sourceloc} {:sourceloc_num 805} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum6.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum6.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum6.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 806} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum6.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_105"} {:captureState "check_state_105"} {:sourceloc} {:sourceloc_num 806} true;
    call {:check_id "check_state_105"} {:sourceloc} {:sourceloc_num 806} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum6.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum6.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum6.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 807} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum6.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_106"} {:captureState "check_state_106"} {:sourceloc} {:sourceloc_num 807} true;
    call {:check_id "check_state_106"} {:sourceloc} {:sourceloc_num 807} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum6.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum6.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum6.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 808} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum6.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_107"} {:captureState "check_state_107"} {:sourceloc} {:sourceloc_num 808} true;
    call {:check_id "check_state_107"} {:sourceloc} {:sourceloc_num 808} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum6.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum6.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum6.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 809} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum6.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_108"} {:captureState "check_state_108"} {:sourceloc} {:sourceloc_num 809} true;
    call {:check_id "check_state_108"} {:sourceloc} {:sourceloc_num 809} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum6.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum6.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum6.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 810} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum6.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_109"} {:captureState "check_state_109"} {:sourceloc} {:sourceloc_num 810} true;
    call {:check_id "check_state_109"} {:sourceloc} {:sourceloc_num 810} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum6.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum6.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum6.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 811} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum6.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_110"} {:captureState "check_state_110"} {:sourceloc} {:sourceloc_num 811} true;
    call {:check_id "check_state_110"} {:sourceloc} {:sourceloc_num 811} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum6.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum6.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum6.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 812} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum6.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_111"} {:captureState "check_state_111"} {:sourceloc} {:sourceloc_num 812} true;
    call {:check_id "check_state_111"} {:sourceloc} {:sourceloc_num 812} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum6.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 6bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum6.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 6bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum6.0$2[128:120];
    call {:sourceloc} {:sourceloc_num 813} _LOG_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), $sum7.0$1[8:0], $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32));
    assume {:do_not_predicate} {:check_id "check_state_112"} {:captureState "check_state_112"} {:sourceloc} {:sourceloc_num 813} true;
    call {:check_id "check_state_112"} {:sourceloc} {:sourceloc_num 813} _CHECK_WRITE_$$matrixC(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), $sum7.0$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32)] := $sum7.0$1[8:0];
    $$matrixC[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32)] := $sum7.0$2[8:0];
    call {:sourceloc} {:sourceloc_num 814} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 1bv32), $sum7.0$1[16:8], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_113"} {:captureState "check_state_113"} {:sourceloc} {:sourceloc_num 814} true;
    call {:check_id "check_state_113"} {:sourceloc} {:sourceloc_num 814} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 1bv32), $sum7.0$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 1bv32)] := $sum7.0$1[16:8];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 1bv32)] := $sum7.0$2[16:8];
    call {:sourceloc} {:sourceloc_num 815} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 2bv32), $sum7.0$1[24:16], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_114"} {:captureState "check_state_114"} {:sourceloc} {:sourceloc_num 815} true;
    call {:check_id "check_state_114"} {:sourceloc} {:sourceloc_num 815} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 2bv32), $sum7.0$2[24:16]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 2bv32)] := $sum7.0$1[24:16];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 2bv32)] := $sum7.0$2[24:16];
    call {:sourceloc} {:sourceloc_num 816} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 3bv32), $sum7.0$1[32:24], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_115"} {:captureState "check_state_115"} {:sourceloc} {:sourceloc_num 816} true;
    call {:check_id "check_state_115"} {:sourceloc} {:sourceloc_num 816} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 3bv32), $sum7.0$2[32:24]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 3bv32)] := $sum7.0$1[32:24];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 3bv32)] := $sum7.0$2[32:24];
    call {:sourceloc} {:sourceloc_num 817} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 4bv32), $sum7.0$1[40:32], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_116"} {:captureState "check_state_116"} {:sourceloc} {:sourceloc_num 817} true;
    call {:check_id "check_state_116"} {:sourceloc} {:sourceloc_num 817} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 4bv32), $sum7.0$2[40:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 4bv32)] := $sum7.0$1[40:32];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 4bv32)] := $sum7.0$2[40:32];
    call {:sourceloc} {:sourceloc_num 818} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 5bv32), $sum7.0$1[48:40], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_117"} {:captureState "check_state_117"} {:sourceloc} {:sourceloc_num 818} true;
    call {:check_id "check_state_117"} {:sourceloc} {:sourceloc_num 818} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 5bv32), $sum7.0$2[48:40]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 5bv32)] := $sum7.0$1[48:40];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 5bv32)] := $sum7.0$2[48:40];
    call {:sourceloc} {:sourceloc_num 819} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 6bv32), $sum7.0$1[56:48], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_118"} {:captureState "check_state_118"} {:sourceloc} {:sourceloc_num 819} true;
    call {:check_id "check_state_118"} {:sourceloc} {:sourceloc_num 819} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 6bv32), $sum7.0$2[56:48]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 6bv32)] := $sum7.0$1[56:48];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 6bv32)] := $sum7.0$2[56:48];
    call {:sourceloc} {:sourceloc_num 820} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 7bv32), $sum7.0$1[64:56], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_119"} {:captureState "check_state_119"} {:sourceloc} {:sourceloc_num 820} true;
    call {:check_id "check_state_119"} {:sourceloc} {:sourceloc_num 820} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 7bv32), $sum7.0$2[64:56]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 7bv32)] := $sum7.0$1[64:56];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 7bv32)] := $sum7.0$2[64:56];
    call {:sourceloc} {:sourceloc_num 821} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 8bv32), $sum7.0$1[72:64], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_120"} {:captureState "check_state_120"} {:sourceloc} {:sourceloc_num 821} true;
    call {:check_id "check_state_120"} {:sourceloc} {:sourceloc_num 821} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 8bv32), $sum7.0$2[72:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 8bv32)] := $sum7.0$1[72:64];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 8bv32)] := $sum7.0$2[72:64];
    call {:sourceloc} {:sourceloc_num 822} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 9bv32), $sum7.0$1[80:72], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 9bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 9bv32));
    assume {:do_not_predicate} {:check_id "check_state_121"} {:captureState "check_state_121"} {:sourceloc} {:sourceloc_num 822} true;
    call {:check_id "check_state_121"} {:sourceloc} {:sourceloc_num 822} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 9bv32), $sum7.0$2[80:72]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 9bv32)] := $sum7.0$1[80:72];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 9bv32)] := $sum7.0$2[80:72];
    call {:sourceloc} {:sourceloc_num 823} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 10bv32), $sum7.0$1[88:80], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 10bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 10bv32));
    assume {:do_not_predicate} {:check_id "check_state_122"} {:captureState "check_state_122"} {:sourceloc} {:sourceloc_num 823} true;
    call {:check_id "check_state_122"} {:sourceloc} {:sourceloc_num 823} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 10bv32), $sum7.0$2[88:80]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 10bv32)] := $sum7.0$1[88:80];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 10bv32)] := $sum7.0$2[88:80];
    call {:sourceloc} {:sourceloc_num 824} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 11bv32), $sum7.0$1[96:88], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 11bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 11bv32));
    assume {:do_not_predicate} {:check_id "check_state_123"} {:captureState "check_state_123"} {:sourceloc} {:sourceloc_num 824} true;
    call {:check_id "check_state_123"} {:sourceloc} {:sourceloc_num 824} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 11bv32), $sum7.0$2[96:88]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 11bv32)] := $sum7.0$1[96:88];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 11bv32)] := $sum7.0$2[96:88];
    call {:sourceloc} {:sourceloc_num 825} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 12bv32), $sum7.0$1[104:96], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 12bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 12bv32));
    assume {:do_not_predicate} {:check_id "check_state_124"} {:captureState "check_state_124"} {:sourceloc} {:sourceloc_num 825} true;
    call {:check_id "check_state_124"} {:sourceloc} {:sourceloc_num 825} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 12bv32), $sum7.0$2[104:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 12bv32)] := $sum7.0$1[104:96];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 12bv32)] := $sum7.0$2[104:96];
    call {:sourceloc} {:sourceloc_num 826} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 13bv32), $sum7.0$1[112:104], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 13bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 13bv32));
    assume {:do_not_predicate} {:check_id "check_state_125"} {:captureState "check_state_125"} {:sourceloc} {:sourceloc_num 826} true;
    call {:check_id "check_state_125"} {:sourceloc} {:sourceloc_num 826} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 13bv32), $sum7.0$2[112:104]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 13bv32)] := $sum7.0$1[112:104];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 13bv32)] := $sum7.0$2[112:104];
    call {:sourceloc} {:sourceloc_num 827} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 14bv32), $sum7.0$1[120:112], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 14bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 14bv32));
    assume {:do_not_predicate} {:check_id "check_state_126"} {:captureState "check_state_126"} {:sourceloc} {:sourceloc_num 827} true;
    call {:check_id "check_state_126"} {:sourceloc} {:sourceloc_num 827} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 14bv32), $sum7.0$2[120:112]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 14bv32)] := $sum7.0$1[120:112];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 14bv32)] := $sum7.0$2[120:112];
    call {:sourceloc} {:sourceloc_num 828} _LOG_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 15bv32), $sum7.0$1[128:120], $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 15bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 15bv32));
    assume {:do_not_predicate} {:check_id "check_state_127"} {:captureState "check_state_127"} {:sourceloc} {:sourceloc_num 828} true;
    call {:check_id "check_state_127"} {:sourceloc} {:sourceloc_num 828} _CHECK_WRITE_$$matrixC(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 15bv32), $sum7.0$2[128:120]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$matrixC"} true;
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$1, 7bv32), 32768bv32), v0$1), 16bv32), 15bv32)] := $sum7.0$1[128:120];
    $$matrixC[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v567$2, 7bv32), 32768bv32), v0$2), 16bv32), 15bv32)] := $sum7.0$2[128:120];
    return;

  $truebb47:
    assume {:partition} v278 && v278;
    v279 := BV32_ASHR($i.0, 2bv32);
    v280 := BV32_ADD($i.0, 1bv32);
    v281 := BV32_ADD($i.0, 2bv32);
    v282 := BV32_ADD($i.0, 3bv32);
    v283$1 := $$imageSampler$1[0bv32];
    v283$2 := $$imageSampler$2[0bv32];
    v284 := BV32_SLT(v279, 0bv32);
    goto $truebb48, $falsebb48;

  $falsebb48:
    assume {:partition} !v284 && !v284;
    v285 := BV32_SGE(v279, 32768bv32);
    goto $truebb49, $falsebb49;

  $falsebb49:
    assume {:partition} !v285 && !v285;
    $49 := v279;
    goto $139;

  $139:
    $48 := $49;
    goto $140;

  $140:
    v286$1 := BV32_SLT(v2$1, 0bv32);
    v286$2 := BV32_SLT(v2$2, 0bv32);
    p48$1 := (if v286$1 then v286$1 else p48$1);
    p48$2 := (if v286$2 then v286$2 else p48$2);
    p49$1 := (if !v286$1 then !v286$1 else p49$1);
    p49$2 := (if !v286$2 then !v286$2 else p49$2);
    $50$1 := (if p48$1 then 0bv32 else $50$1);
    $50$2 := (if p48$2 then 0bv32 else $50$2);
    v287$1 := (if p49$1 then BV32_SGE(v2$1, 32768bv32) else v287$1);
    v287$2 := (if p49$2 then BV32_SGE(v2$2, 32768bv32) else v287$2);
    p51$1 := (if p49$1 && v287$1 then v287$1 else p51$1);
    p51$2 := (if p49$2 && v287$2 then v287$2 else p51$2);
    p50$1 := (if p49$1 && !v287$1 then !v287$1 else p50$1);
    p50$2 := (if p49$2 && !v287$2 then !v287$2 else p50$2);
    $51$1 := (if p50$1 then v2$1 else $51$1);
    $51$2 := (if p50$2 then v2$2 else $51$2);
    $51$1 := (if p51$1 then 32767bv32 else $51$1);
    $51$2 := (if p51$2 then 32767bv32 else $51$2);
    $50$1 := (if p49$1 then $51$1 else $50$1);
    $50$2 := (if p49$2 then $51$2 else $50$2);
    havoc v288$1, v288$2;
    havoc v289$1, v289$2;
    havoc v290$1, v290$2;
    havoc v291$1, v291$2;
    havoc v292$1, v292$2;
    havoc v293$1, v293$2;
    havoc v294$1, v294$2;
    havoc v295$1, v295$2;
    havoc v296$1, v296$2;
    havoc v297$1, v297$2;
    havoc v298$1, v298$2;
    havoc v299$1, v299$2;
    havoc v300$1, v300$2;
    havoc v301$1, v301$2;
    havoc v302$1, v302$2;
    havoc v303$1, v303$2;
    v304$1 := $$imageSampler$1[0bv32];
    v304$2 := $$imageSampler$2[0bv32];
    v305 := BV32_SLT(v279, 0bv32);
    goto $truebb52, $falsebb52;

  $falsebb52:
    assume {:partition} !v305 && !v305;
    v306 := BV32_SGE(v279, 32768bv32);
    goto $truebb53, $falsebb53;

  $falsebb53:
    assume {:partition} !v306 && !v306;
    $53 := v279;
    goto $150;

  $150:
    $52 := $53;
    goto $151;

  $151:
    v307$1 := BV32_SLT(v3$1, 0bv32);
    v307$2 := BV32_SLT(v3$2, 0bv32);
    p52$1 := (if v307$1 then v307$1 else p52$1);
    p52$2 := (if v307$2 then v307$2 else p52$2);
    p53$1 := (if !v307$1 then !v307$1 else p53$1);
    p53$2 := (if !v307$2 then !v307$2 else p53$2);
    $54$1 := (if p52$1 then 0bv32 else $54$1);
    $54$2 := (if p52$2 then 0bv32 else $54$2);
    v308$1 := (if p53$1 then BV32_SGE(v3$1, 32768bv32) else v308$1);
    v308$2 := (if p53$2 then BV32_SGE(v3$2, 32768bv32) else v308$2);
    p55$1 := (if p53$1 && v308$1 then v308$1 else p55$1);
    p55$2 := (if p53$2 && v308$2 then v308$2 else p55$2);
    p54$1 := (if p53$1 && !v308$1 then !v308$1 else p54$1);
    p54$2 := (if p53$2 && !v308$2 then !v308$2 else p54$2);
    $55$1 := (if p54$1 then v3$1 else $55$1);
    $55$2 := (if p54$2 then v3$2 else $55$2);
    $55$1 := (if p55$1 then 32767bv32 else $55$1);
    $55$2 := (if p55$2 then 32767bv32 else $55$2);
    $54$1 := (if p53$1 then $55$1 else $54$1);
    $54$2 := (if p53$2 then $55$2 else $54$2);
    havoc v309$1, v309$2;
    havoc v310$1, v310$2;
    havoc v311$1, v311$2;
    havoc v312$1, v312$2;
    havoc v313$1, v313$2;
    havoc v314$1, v314$2;
    havoc v315$1, v315$2;
    havoc v316$1, v316$2;
    havoc v317$1, v317$2;
    havoc v318$1, v318$2;
    havoc v319$1, v319$2;
    havoc v320$1, v320$2;
    havoc v321$1, v321$2;
    havoc v322$1, v322$2;
    havoc v323$1, v323$2;
    havoc v324$1, v324$2;
    v325$1 := $$imageSampler$1[0bv32];
    v325$2 := $$imageSampler$2[0bv32];
    v326 := BV32_SLT(v279, 0bv32);
    goto $truebb56, $falsebb56;

  $falsebb56:
    assume {:partition} !v326 && !v326;
    v327 := BV32_SGE(v279, 32768bv32);
    goto $truebb57, $falsebb57;

  $falsebb57:
    assume {:partition} !v327 && !v327;
    $57 := v279;
    goto $161;

  $161:
    $56 := $57;
    goto $162;

  $162:
    v328$1 := BV32_SLT(v4$1, 0bv32);
    v328$2 := BV32_SLT(v4$2, 0bv32);
    p56$1 := (if v328$1 then v328$1 else p56$1);
    p56$2 := (if v328$2 then v328$2 else p56$2);
    p57$1 := (if !v328$1 then !v328$1 else p57$1);
    p57$2 := (if !v328$2 then !v328$2 else p57$2);
    $58$1 := (if p56$1 then 0bv32 else $58$1);
    $58$2 := (if p56$2 then 0bv32 else $58$2);
    v329$1 := (if p57$1 then BV32_SGE(v4$1, 32768bv32) else v329$1);
    v329$2 := (if p57$2 then BV32_SGE(v4$2, 32768bv32) else v329$2);
    p59$1 := (if p57$1 && v329$1 then v329$1 else p59$1);
    p59$2 := (if p57$2 && v329$2 then v329$2 else p59$2);
    p58$1 := (if p57$1 && !v329$1 then !v329$1 else p58$1);
    p58$2 := (if p57$2 && !v329$2 then !v329$2 else p58$2);
    $59$1 := (if p58$1 then v4$1 else $59$1);
    $59$2 := (if p58$2 then v4$2 else $59$2);
    $59$1 := (if p59$1 then 32767bv32 else $59$1);
    $59$2 := (if p59$2 then 32767bv32 else $59$2);
    $58$1 := (if p57$1 then $59$1 else $58$1);
    $58$2 := (if p57$2 then $59$2 else $58$2);
    havoc v330$1, v330$2;
    havoc v331$1, v331$2;
    havoc v332$1, v332$2;
    havoc v333$1, v333$2;
    havoc v334$1, v334$2;
    havoc v335$1, v335$2;
    havoc v336$1, v336$2;
    havoc v337$1, v337$2;
    havoc v338$1, v338$2;
    havoc v339$1, v339$2;
    havoc v340$1, v340$2;
    havoc v341$1, v341$2;
    havoc v342$1, v342$2;
    havoc v343$1, v343$2;
    havoc v344$1, v344$2;
    havoc v345$1, v345$2;
    v346$1 := $$imageSampler$1[0bv32];
    v346$2 := $$imageSampler$2[0bv32];
    v347 := BV32_SLT(v279, 0bv32);
    goto $truebb60, $falsebb60;

  $falsebb60:
    assume {:partition} !v347 && !v347;
    v348 := BV32_SGE(v279, 32768bv32);
    goto $truebb61, $falsebb61;

  $falsebb61:
    assume {:partition} !v348 && !v348;
    $61 := v279;
    goto $172;

  $172:
    $60 := $61;
    goto $173;

  $173:
    v349$1 := BV32_SLT(v5$1, 0bv32);
    v349$2 := BV32_SLT(v5$2, 0bv32);
    p60$1 := (if v349$1 then v349$1 else p60$1);
    p60$2 := (if v349$2 then v349$2 else p60$2);
    p61$1 := (if !v349$1 then !v349$1 else p61$1);
    p61$2 := (if !v349$2 then !v349$2 else p61$2);
    $62$1 := (if p60$1 then 0bv32 else $62$1);
    $62$2 := (if p60$2 then 0bv32 else $62$2);
    v350$1 := (if p61$1 then BV32_SGE(v5$1, 32768bv32) else v350$1);
    v350$2 := (if p61$2 then BV32_SGE(v5$2, 32768bv32) else v350$2);
    p63$1 := (if p61$1 && v350$1 then v350$1 else p63$1);
    p63$2 := (if p61$2 && v350$2 then v350$2 else p63$2);
    p62$1 := (if p61$1 && !v350$1 then !v350$1 else p62$1);
    p62$2 := (if p61$2 && !v350$2 then !v350$2 else p62$2);
    $63$1 := (if p62$1 then v5$1 else $63$1);
    $63$2 := (if p62$2 then v5$2 else $63$2);
    $63$1 := (if p63$1 then 32767bv32 else $63$1);
    $63$2 := (if p63$2 then 32767bv32 else $63$2);
    $62$1 := (if p61$1 then $63$1 else $62$1);
    $62$2 := (if p61$2 then $63$2 else $62$2);
    havoc v351$1, v351$2;
    havoc v352$1, v352$2;
    havoc v353$1, v353$2;
    havoc v354$1, v354$2;
    havoc v355$1, v355$2;
    havoc v356$1, v356$2;
    havoc v357$1, v357$2;
    havoc v358$1, v358$2;
    havoc v359$1, v359$2;
    havoc v360$1, v360$2;
    havoc v361$1, v361$2;
    havoc v362$1, v362$2;
    havoc v363$1, v363$2;
    havoc v364$1, v364$2;
    havoc v365$1, v365$2;
    havoc v366$1, v366$2;
    v367$1 := $$imageSampler$1[0bv32];
    v367$2 := $$imageSampler$2[0bv32];
    v368$1 := BV32_SLT(v0$1, 0bv32);
    v368$2 := BV32_SLT(v0$2, 0bv32);
    p64$1 := (if v368$1 then v368$1 else p64$1);
    p64$2 := (if v368$2 then v368$2 else p64$2);
    p65$1 := (if !v368$1 then !v368$1 else p65$1);
    p65$2 := (if !v368$2 then !v368$2 else p65$2);
    $64$1 := (if p64$1 then 0bv32 else $64$1);
    $64$2 := (if p64$2 then 0bv32 else $64$2);
    v369$1 := (if p65$1 then BV32_SGE(v0$1, 32768bv32) else v369$1);
    v369$2 := (if p65$2 then BV32_SGE(v0$2, 32768bv32) else v369$2);
    p67$1 := (if p65$1 && v369$1 then v369$1 else p67$1);
    p67$2 := (if p65$2 && v369$2 then v369$2 else p67$2);
    p66$1 := (if p65$1 && !v369$1 then !v369$1 else p66$1);
    p66$2 := (if p65$2 && !v369$2 then !v369$2 else p66$2);
    $65$1 := (if p66$1 then v0$1 else $65$1);
    $65$2 := (if p66$2 then v0$2 else $65$2);
    $65$1 := (if p67$1 then 32767bv32 else $65$1);
    $65$2 := (if p67$2 then 32767bv32 else $65$2);
    $64$1 := (if p65$1 then $65$1 else $64$1);
    $64$2 := (if p65$2 then $65$2 else $64$2);
    v370 := BV32_SLT($i.0, 0bv32);
    goto $truebb66, $falsebb66;

  $falsebb66:
    assume {:partition} !v370 && !v370;
    v371 := BV32_SGE($i.0, 32768bv32);
    goto $truebb67, $falsebb67;

  $falsebb67:
    assume {:partition} !v371 && !v371;
    $67 := $i.0;
    goto $189;

  $189:
    $66 := $67;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit65;

  $_Z11read_imagefPU3AS1vjDv2_i.exit65:
    havoc v372$1, v372$2;
    havoc v373$1, v373$2;
    havoc v374$1, v374$2;
    havoc v375$1, v375$2;
    havoc v376$1, v376$2;
    havoc v377$1, v377$2;
    havoc v378$1, v378$2;
    havoc v379$1, v379$2;
    havoc v380$1, v380$2;
    havoc v381$1, v381$2;
    havoc v382$1, v382$2;
    havoc v383$1, v383$2;
    havoc v384$1, v384$2;
    havoc v385$1, v385$2;
    havoc v386$1, v386$2;
    havoc v387$1, v387$2;
    v388$1 := $$imageSampler$1[0bv32];
    v388$2 := $$imageSampler$2[0bv32];
    v389$1 := BV32_SLT(v0$1, 0bv32);
    v389$2 := BV32_SLT(v0$2, 0bv32);
    p68$1 := (if v389$1 then v389$1 else p68$1);
    p68$2 := (if v389$2 then v389$2 else p68$2);
    p69$1 := (if !v389$1 then !v389$1 else p69$1);
    p69$2 := (if !v389$2 then !v389$2 else p69$2);
    $68$1 := (if p68$1 then 0bv32 else $68$1);
    $68$2 := (if p68$2 then 0bv32 else $68$2);
    v390$1 := (if p69$1 then BV32_SGE(v0$1, 32768bv32) else v390$1);
    v390$2 := (if p69$2 then BV32_SGE(v0$2, 32768bv32) else v390$2);
    p71$1 := (if p69$1 && v390$1 then v390$1 else p71$1);
    p71$2 := (if p69$2 && v390$2 then v390$2 else p71$2);
    p70$1 := (if p69$1 && !v390$1 then !v390$1 else p70$1);
    p70$2 := (if p69$2 && !v390$2 then !v390$2 else p70$2);
    $69$1 := (if p70$1 then v0$1 else $69$1);
    $69$2 := (if p70$2 then v0$2 else $69$2);
    $69$1 := (if p71$1 then 32767bv32 else $69$1);
    $69$2 := (if p71$2 then 32767bv32 else $69$2);
    $68$1 := (if p69$1 then $69$1 else $68$1);
    $68$2 := (if p69$2 then $69$2 else $68$2);
    v391 := BV32_SLT(v280, 0bv32);
    goto $truebb70, $falsebb70;

  $falsebb70:
    assume {:partition} !v391 && !v391;
    v392 := BV32_SGE(v280, 32768bv32);
    goto $truebb71, $falsebb71;

  $falsebb71:
    assume {:partition} !v392 && !v392;
    $71 := v280;
    goto $200;

  $200:
    $70 := $71;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit61;

  $_Z11read_imagefPU3AS1vjDv2_i.exit61:
    havoc v393$1, v393$2;
    havoc v394$1, v394$2;
    havoc v395$1, v395$2;
    havoc v396$1, v396$2;
    havoc v397$1, v397$2;
    havoc v398$1, v398$2;
    havoc v399$1, v399$2;
    havoc v400$1, v400$2;
    havoc v401$1, v401$2;
    havoc v402$1, v402$2;
    havoc v403$1, v403$2;
    havoc v404$1, v404$2;
    havoc v405$1, v405$2;
    havoc v406$1, v406$2;
    havoc v407$1, v407$2;
    havoc v408$1, v408$2;
    v409$1 := $$imageSampler$1[0bv32];
    v409$2 := $$imageSampler$2[0bv32];
    v410$1 := BV32_SLT(v0$1, 0bv32);
    v410$2 := BV32_SLT(v0$2, 0bv32);
    p72$1 := (if v410$1 then v410$1 else p72$1);
    p72$2 := (if v410$2 then v410$2 else p72$2);
    p73$1 := (if !v410$1 then !v410$1 else p73$1);
    p73$2 := (if !v410$2 then !v410$2 else p73$2);
    $72$1 := (if p72$1 then 0bv32 else $72$1);
    $72$2 := (if p72$2 then 0bv32 else $72$2);
    v411$1 := (if p73$1 then BV32_SGE(v0$1, 32768bv32) else v411$1);
    v411$2 := (if p73$2 then BV32_SGE(v0$2, 32768bv32) else v411$2);
    p75$1 := (if p73$1 && v411$1 then v411$1 else p75$1);
    p75$2 := (if p73$2 && v411$2 then v411$2 else p75$2);
    p74$1 := (if p73$1 && !v411$1 then !v411$1 else p74$1);
    p74$2 := (if p73$2 && !v411$2 then !v411$2 else p74$2);
    $73$1 := (if p74$1 then v0$1 else $73$1);
    $73$2 := (if p74$2 then v0$2 else $73$2);
    $73$1 := (if p75$1 then 32767bv32 else $73$1);
    $73$2 := (if p75$2 then 32767bv32 else $73$2);
    $72$1 := (if p73$1 then $73$1 else $72$1);
    $72$2 := (if p73$2 then $73$2 else $72$2);
    v412 := BV32_SLT(v281, 0bv32);
    goto $truebb74, $falsebb74;

  $falsebb74:
    assume {:partition} !v412 && !v412;
    v413 := BV32_SGE(v281, 32768bv32);
    goto $truebb75, $falsebb75;

  $falsebb75:
    assume {:partition} !v413 && !v413;
    $75 := v281;
    goto $211;

  $211:
    $74 := $75;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit57;

  $_Z11read_imagefPU3AS1vjDv2_i.exit57:
    havoc v414$1, v414$2;
    havoc v415$1, v415$2;
    havoc v416$1, v416$2;
    havoc v417$1, v417$2;
    havoc v418$1, v418$2;
    havoc v419$1, v419$2;
    havoc v420$1, v420$2;
    havoc v421$1, v421$2;
    havoc v422$1, v422$2;
    havoc v423$1, v423$2;
    havoc v424$1, v424$2;
    havoc v425$1, v425$2;
    havoc v426$1, v426$2;
    havoc v427$1, v427$2;
    havoc v428$1, v428$2;
    havoc v429$1, v429$2;
    v430$1 := $$imageSampler$1[0bv32];
    v430$2 := $$imageSampler$2[0bv32];
    v431$1 := BV32_SLT(v0$1, 0bv32);
    v431$2 := BV32_SLT(v0$2, 0bv32);
    p76$1 := (if v431$1 then v431$1 else p76$1);
    p76$2 := (if v431$2 then v431$2 else p76$2);
    p77$1 := (if !v431$1 then !v431$1 else p77$1);
    p77$2 := (if !v431$2 then !v431$2 else p77$2);
    $76$1 := (if p76$1 then 0bv32 else $76$1);
    $76$2 := (if p76$2 then 0bv32 else $76$2);
    v432$1 := (if p77$1 then BV32_SGE(v0$1, 32768bv32) else v432$1);
    v432$2 := (if p77$2 then BV32_SGE(v0$2, 32768bv32) else v432$2);
    p79$1 := (if p77$1 && v432$1 then v432$1 else p79$1);
    p79$2 := (if p77$2 && v432$2 then v432$2 else p79$2);
    p78$1 := (if p77$1 && !v432$1 then !v432$1 else p78$1);
    p78$2 := (if p77$2 && !v432$2 then !v432$2 else p78$2);
    $77$1 := (if p78$1 then v0$1 else $77$1);
    $77$2 := (if p78$2 then v0$2 else $77$2);
    $77$1 := (if p79$1 then 32767bv32 else $77$1);
    $77$2 := (if p79$2 then 32767bv32 else $77$2);
    $76$1 := (if p77$1 then $77$1 else $76$1);
    $76$2 := (if p77$2 then $77$2 else $76$2);
    v433 := BV32_SLT(v282, 0bv32);
    goto $truebb78, $falsebb78;

  $falsebb78:
    assume {:partition} !v433 && !v433;
    v434 := BV32_SGE(v282, 32768bv32);
    goto $truebb79, $falsebb79;

  $falsebb79:
    assume {:partition} !v434 && !v434;
    $79 := v282;
    goto $222;

  $222:
    $78 := $79;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit53;

  $_Z11read_imagefPU3AS1vjDv2_i.exit53:
    havoc v435$1, v435$2;
    havoc v436$1, v436$2;
    havoc v437$1, v437$2;
    havoc v438$1, v438$2;
    havoc v439$1, v439$2;
    havoc v440$1, v440$2;
    havoc v441$1, v441$2;
    havoc v442$1, v442$2;
    havoc v443$1, v443$2;
    havoc v444$1, v444$2;
    havoc v445$1, v445$2;
    havoc v446$1, v446$2;
    havoc v447$1, v447$2;
    havoc v448$1, v448$2;
    havoc v449$1, v449$2;
    havoc v450$1, v450$2;
    v451$1 := $$imageSampler$1[0bv32];
    v451$2 := $$imageSampler$2[0bv32];
    v452 := BV32_SLT(v279, 0bv32);
    goto $truebb80, $falsebb80;

  $falsebb80:
    assume {:partition} !v452 && !v452;
    v453 := BV32_SGE(v279, 32768bv32);
    goto $truebb81, $falsebb81;

  $falsebb81:
    assume {:partition} !v453 && !v453;
    $81 := v279;
    goto $227;

  $227:
    $80 := $81;
    goto $228;

  $228:
    v454$1 := BV32_SLT(v6$1, 0bv32);
    v454$2 := BV32_SLT(v6$2, 0bv32);
    p80$1 := (if v454$1 then v454$1 else p80$1);
    p80$2 := (if v454$2 then v454$2 else p80$2);
    p81$1 := (if !v454$1 then !v454$1 else p81$1);
    p81$2 := (if !v454$2 then !v454$2 else p81$2);
    $82$1 := (if p80$1 then 0bv32 else $82$1);
    $82$2 := (if p80$2 then 0bv32 else $82$2);
    v455$1 := (if p81$1 then BV32_SGE(v6$1, 32768bv32) else v455$1);
    v455$2 := (if p81$2 then BV32_SGE(v6$2, 32768bv32) else v455$2);
    p83$1 := (if p81$1 && v455$1 then v455$1 else p83$1);
    p83$2 := (if p81$2 && v455$2 then v455$2 else p83$2);
    p82$1 := (if p81$1 && !v455$1 then !v455$1 else p82$1);
    p82$2 := (if p81$2 && !v455$2 then !v455$2 else p82$2);
    $83$1 := (if p82$1 then v6$1 else $83$1);
    $83$2 := (if p82$2 then v6$2 else $83$2);
    $83$1 := (if p83$1 then 32767bv32 else $83$1);
    $83$2 := (if p83$2 then 32767bv32 else $83$2);
    $82$1 := (if p81$1 then $83$1 else $82$1);
    $82$2 := (if p81$2 then $83$2 else $82$2);
    havoc v456$1, v456$2;
    havoc v457$1, v457$2;
    havoc v458$1, v458$2;
    havoc v459$1, v459$2;
    havoc v460$1, v460$2;
    havoc v461$1, v461$2;
    havoc v462$1, v462$2;
    havoc v463$1, v463$2;
    havoc v464$1, v464$2;
    havoc v465$1, v465$2;
    havoc v466$1, v466$2;
    havoc v467$1, v467$2;
    havoc v468$1, v468$2;
    havoc v469$1, v469$2;
    havoc v470$1, v470$2;
    havoc v471$1, v471$2;
    v472$1 := $$imageSampler$1[0bv32];
    v472$2 := $$imageSampler$2[0bv32];
    v473 := BV32_SLT(v279, 0bv32);
    goto $truebb84, $falsebb84;

  $falsebb84:
    assume {:partition} !v473 && !v473;
    v474 := BV32_SGE(v279, 32768bv32);
    goto $truebb85, $falsebb85;

  $falsebb85:
    assume {:partition} !v474 && !v474;
    $85 := v279;
    goto $238;

  $238:
    $84 := $85;
    goto $239;

  $239:
    v475$1 := BV32_SLT(v7$1, 0bv32);
    v475$2 := BV32_SLT(v7$2, 0bv32);
    p84$1 := (if v475$1 then v475$1 else p84$1);
    p84$2 := (if v475$2 then v475$2 else p84$2);
    p85$1 := (if !v475$1 then !v475$1 else p85$1);
    p85$2 := (if !v475$2 then !v475$2 else p85$2);
    $86$1 := (if p84$1 then 0bv32 else $86$1);
    $86$2 := (if p84$2 then 0bv32 else $86$2);
    v476$1 := (if p85$1 then BV32_SGE(v7$1, 32768bv32) else v476$1);
    v476$2 := (if p85$2 then BV32_SGE(v7$2, 32768bv32) else v476$2);
    p87$1 := (if p85$1 && v476$1 then v476$1 else p87$1);
    p87$2 := (if p85$2 && v476$2 then v476$2 else p87$2);
    p86$1 := (if p85$1 && !v476$1 then !v476$1 else p86$1);
    p86$2 := (if p85$2 && !v476$2 then !v476$2 else p86$2);
    $87$1 := (if p86$1 then v7$1 else $87$1);
    $87$2 := (if p86$2 then v7$2 else $87$2);
    $87$1 := (if p87$1 then 32767bv32 else $87$1);
    $87$2 := (if p87$2 then 32767bv32 else $87$2);
    $86$1 := (if p85$1 then $87$1 else $86$1);
    $86$2 := (if p85$2 then $87$2 else $86$2);
    havoc v477$1, v477$2;
    havoc v478$1, v478$2;
    havoc v479$1, v479$2;
    havoc v480$1, v480$2;
    havoc v481$1, v481$2;
    havoc v482$1, v482$2;
    havoc v483$1, v483$2;
    havoc v484$1, v484$2;
    havoc v485$1, v485$2;
    havoc v486$1, v486$2;
    havoc v487$1, v487$2;
    havoc v488$1, v488$2;
    havoc v489$1, v489$2;
    havoc v490$1, v490$2;
    havoc v491$1, v491$2;
    havoc v492$1, v492$2;
    v493$1 := $$imageSampler$1[0bv32];
    v493$2 := $$imageSampler$2[0bv32];
    v494 := BV32_SLT(v279, 0bv32);
    goto $truebb88, $falsebb88;

  $falsebb88:
    assume {:partition} !v494 && !v494;
    v495 := BV32_SGE(v279, 32768bv32);
    goto $truebb89, $falsebb89;

  $falsebb89:
    assume {:partition} !v495 && !v495;
    $89 := v279;
    goto $249;

  $249:
    $88 := $89;
    goto $250;

  $250:
    v496$1 := BV32_SLT(v8$1, 0bv32);
    v496$2 := BV32_SLT(v8$2, 0bv32);
    p88$1 := (if v496$1 then v496$1 else p88$1);
    p88$2 := (if v496$2 then v496$2 else p88$2);
    p89$1 := (if !v496$1 then !v496$1 else p89$1);
    p89$2 := (if !v496$2 then !v496$2 else p89$2);
    $90$1 := (if p88$1 then 0bv32 else $90$1);
    $90$2 := (if p88$2 then 0bv32 else $90$2);
    v497$1 := (if p89$1 then BV32_SGE(v8$1, 32768bv32) else v497$1);
    v497$2 := (if p89$2 then BV32_SGE(v8$2, 32768bv32) else v497$2);
    p91$1 := (if p89$1 && v497$1 then v497$1 else p91$1);
    p91$2 := (if p89$2 && v497$2 then v497$2 else p91$2);
    p90$1 := (if p89$1 && !v497$1 then !v497$1 else p90$1);
    p90$2 := (if p89$2 && !v497$2 then !v497$2 else p90$2);
    $91$1 := (if p90$1 then v8$1 else $91$1);
    $91$2 := (if p90$2 then v8$2 else $91$2);
    $91$1 := (if p91$1 then 32767bv32 else $91$1);
    $91$2 := (if p91$2 then 32767bv32 else $91$2);
    $90$1 := (if p89$1 then $91$1 else $90$1);
    $90$2 := (if p89$2 then $91$2 else $90$2);
    havoc v498$1, v498$2;
    havoc v499$1, v499$2;
    havoc v500$1, v500$2;
    havoc v501$1, v501$2;
    havoc v502$1, v502$2;
    havoc v503$1, v503$2;
    havoc v504$1, v504$2;
    havoc v505$1, v505$2;
    havoc v506$1, v506$2;
    havoc v507$1, v507$2;
    havoc v508$1, v508$2;
    havoc v509$1, v509$2;
    havoc v510$1, v510$2;
    havoc v511$1, v511$2;
    havoc v512$1, v512$2;
    havoc v513$1, v513$2;
    v514$1 := $$imageSampler$1[0bv32];
    v514$2 := $$imageSampler$2[0bv32];
    v515 := BV32_SLT(v279, 0bv32);
    goto $truebb92, $falsebb92;

  $falsebb92:
    assume {:partition} !v515 && !v515;
    v516 := BV32_SGE(v279, 32768bv32);
    goto $truebb93, $falsebb93;

  $falsebb93:
    assume {:partition} !v516 && !v516;
    $93 := v279;
    goto $260;

  $260:
    $92 := $93;
    goto $261;

  $261:
    v517$1 := BV32_SLT(v9$1, 0bv32);
    v517$2 := BV32_SLT(v9$2, 0bv32);
    p92$1 := (if v517$1 then v517$1 else p92$1);
    p92$2 := (if v517$2 then v517$2 else p92$2);
    p93$1 := (if !v517$1 then !v517$1 else p93$1);
    p93$2 := (if !v517$2 then !v517$2 else p93$2);
    $94$1 := (if p92$1 then 0bv32 else $94$1);
    $94$2 := (if p92$2 then 0bv32 else $94$2);
    v518$1 := (if p93$1 then BV32_SGE(v9$1, 32768bv32) else v518$1);
    v518$2 := (if p93$2 then BV32_SGE(v9$2, 32768bv32) else v518$2);
    p95$1 := (if p93$1 && v518$1 then v518$1 else p95$1);
    p95$2 := (if p93$2 && v518$2 then v518$2 else p95$2);
    p94$1 := (if p93$1 && !v518$1 then !v518$1 else p94$1);
    p94$2 := (if p93$2 && !v518$2 then !v518$2 else p94$2);
    $95$1 := (if p94$1 then v9$1 else $95$1);
    $95$2 := (if p94$2 then v9$2 else $95$2);
    $95$1 := (if p95$1 then 32767bv32 else $95$1);
    $95$2 := (if p95$2 then 32767bv32 else $95$2);
    $94$1 := (if p93$1 then $95$1 else $94$1);
    $94$2 := (if p93$2 then $95$2 else $94$2);
    havoc v519$1, v519$2;
    havoc v520$1, v520$2;
    havoc v521$1, v521$2;
    havoc v522$1, v522$2;
    havoc v523$1, v523$2;
    havoc v524$1, v524$2;
    havoc v525$1, v525$2;
    havoc v526$1, v526$2;
    havoc v527$1, v527$2;
    havoc v528$1, v528$2;
    havoc v529$1, v529$2;
    havoc v530$1, v530$2;
    havoc v531$1, v531$2;
    havoc v532$1, v532$2;
    havoc v533$1, v533$2;
    havoc v534$1, v534$2;
    v535$1 := v291$1 ++ v290$1 ++ v289$1 ++ v288$1;
    v535$2 := v291$2 ++ v290$2 ++ v289$2 ++ v288$2;
    v536$1 := v295$1 ++ v294$1 ++ v293$1 ++ v292$1;
    v536$2 := v295$2 ++ v294$2 ++ v293$2 ++ v292$2;
    v537$1 := v299$1 ++ v298$1 ++ v297$1 ++ v296$1;
    v537$2 := v299$2 ++ v298$2 ++ v297$2 ++ v296$2;
    v538$1 := v303$1 ++ v302$1 ++ v301$1 ++ v300$1;
    v538$2 := v303$2 ++ v302$2 ++ v301$2 ++ v300$2;
    v539$1 := v312$1 ++ v311$1 ++ v310$1 ++ v309$1;
    v539$2 := v312$2 ++ v311$2 ++ v310$2 ++ v309$2;
    v540$1 := v316$1 ++ v315$1 ++ v314$1 ++ v313$1;
    v540$2 := v316$2 ++ v315$2 ++ v314$2 ++ v313$2;
    v541$1 := v320$1 ++ v319$1 ++ v318$1 ++ v317$1;
    v541$2 := v320$2 ++ v319$2 ++ v318$2 ++ v317$2;
    v542$1 := v324$1 ++ v323$1 ++ v322$1 ++ v321$1;
    v542$2 := v324$2 ++ v323$2 ++ v322$2 ++ v321$2;
    v543$1 := v333$1 ++ v332$1 ++ v331$1 ++ v330$1;
    v543$2 := v333$2 ++ v332$2 ++ v331$2 ++ v330$2;
    v544$1 := v337$1 ++ v336$1 ++ v335$1 ++ v334$1;
    v544$2 := v337$2 ++ v336$2 ++ v335$2 ++ v334$2;
    v545$1 := v341$1 ++ v340$1 ++ v339$1 ++ v338$1;
    v545$2 := v341$2 ++ v340$2 ++ v339$2 ++ v338$2;
    v546$1 := v345$1 ++ v344$1 ++ v343$1 ++ v342$1;
    v546$2 := v345$2 ++ v344$2 ++ v343$2 ++ v342$2;
    v547$1 := v354$1 ++ v353$1 ++ v352$1 ++ v351$1;
    v547$2 := v354$2 ++ v353$2 ++ v352$2 ++ v351$2;
    v548$1 := v358$1 ++ v357$1 ++ v356$1 ++ v355$1;
    v548$2 := v358$2 ++ v357$2 ++ v356$2 ++ v355$2;
    v549$1 := v362$1 ++ v361$1 ++ v360$1 ++ v359$1;
    v549$2 := v362$2 ++ v361$2 ++ v360$2 ++ v359$2;
    v550$1 := v366$1 ++ v365$1 ++ v364$1 ++ v363$1;
    v550$2 := v366$2 ++ v365$2 ++ v364$2 ++ v363$2;
    v551$1 := v459$1 ++ v458$1 ++ v457$1 ++ v456$1;
    v551$2 := v459$2 ++ v458$2 ++ v457$2 ++ v456$2;
    v552$1 := v463$1 ++ v462$1 ++ v461$1 ++ v460$1;
    v552$2 := v463$2 ++ v462$2 ++ v461$2 ++ v460$2;
    v553$1 := v467$1 ++ v466$1 ++ v465$1 ++ v464$1;
    v553$2 := v467$2 ++ v466$2 ++ v465$2 ++ v464$2;
    v554$1 := v471$1 ++ v470$1 ++ v469$1 ++ v468$1;
    v554$2 := v471$2 ++ v470$2 ++ v469$2 ++ v468$2;
    v555$1 := v480$1 ++ v479$1 ++ v478$1 ++ v477$1;
    v555$2 := v480$2 ++ v479$2 ++ v478$2 ++ v477$2;
    v556$1 := v484$1 ++ v483$1 ++ v482$1 ++ v481$1;
    v556$2 := v484$2 ++ v483$2 ++ v482$2 ++ v481$2;
    v557$1 := v488$1 ++ v487$1 ++ v486$1 ++ v485$1;
    v557$2 := v488$2 ++ v487$2 ++ v486$2 ++ v485$2;
    v558$1 := v492$1 ++ v491$1 ++ v490$1 ++ v489$1;
    v558$2 := v492$2 ++ v491$2 ++ v490$2 ++ v489$2;
    v559$1 := v501$1 ++ v500$1 ++ v499$1 ++ v498$1;
    v559$2 := v501$2 ++ v500$2 ++ v499$2 ++ v498$2;
    v560$1 := v505$1 ++ v504$1 ++ v503$1 ++ v502$1;
    v560$2 := v505$2 ++ v504$2 ++ v503$2 ++ v502$2;
    v561$1 := v509$1 ++ v508$1 ++ v507$1 ++ v506$1;
    v561$2 := v509$2 ++ v508$2 ++ v507$2 ++ v506$2;
    v562$1 := v513$1 ++ v512$1 ++ v511$1 ++ v510$1;
    v562$2 := v513$2 ++ v512$2 ++ v511$2 ++ v510$2;
    v563$1 := v522$1 ++ v521$1 ++ v520$1 ++ v519$1;
    v563$2 := v522$2 ++ v521$2 ++ v520$2 ++ v519$2;
    v564$1 := v526$1 ++ v525$1 ++ v524$1 ++ v523$1;
    v564$2 := v526$2 ++ v525$2 ++ v524$2 ++ v523$2;
    v565$1 := v530$1 ++ v529$1 ++ v528$1 ++ v527$1;
    v565$2 := v530$2 ++ v529$2 ++ v528$2 ++ v527$2;
    v566$1 := v534$1 ++ v533$1 ++ v532$1 ++ v531$1;
    v566$2 := v534$2 ++ v533$2 ++ v532$2 ++ v531$2;
    $sum0.0$1, $sum1.0$1, $sum2.0$1, $sum3.0$1, $sum4.0$1, $sum5.0$1, $sum6.0$1, $sum7.0$1, $i.0 := FADD32(FMUL32(v538$1, v450$1 ++ v449$1 ++ v448$1 ++ v447$1), FADD32(FMUL32(v537$1, v429$1 ++ v428$1 ++ v427$1 ++ v426$1), FADD32(FMUL32(v536$1, v408$1 ++ v407$1 ++ v406$1 ++ v405$1), FADD32(FMUL32(v535$1, v387$1 ++ v386$1 ++ v385$1 ++ v384$1), $sum0.0$1[128:96])))) ++ FADD32(FMUL32(v538$1, v446$1 ++ v445$1 ++ v444$1 ++ v443$1), FADD32(FMUL32(v537$1, v425$1 ++ v424$1 ++ v423$1 ++ v422$1), FADD32(FMUL32(v536$1, v404$1 ++ v403$1 ++ v402$1 ++ v401$1), FADD32(FMUL32(v535$1, v383$1 ++ v382$1 ++ v381$1 ++ v380$1), $sum0.0$1[96:64])))) ++ FADD32(FMUL32(v538$1, v442$1 ++ v441$1 ++ v440$1 ++ v439$1), FADD32(FMUL32(v537$1, v421$1 ++ v420$1 ++ v419$1 ++ v418$1), FADD32(FMUL32(v536$1, v400$1 ++ v399$1 ++ v398$1 ++ v397$1), FADD32(FMUL32(v535$1, v379$1 ++ v378$1 ++ v377$1 ++ v376$1), $sum0.0$1[64:32])))) ++ FADD32(FMUL32(v538$1, v438$1 ++ v437$1 ++ v436$1 ++ v435$1), FADD32(FMUL32(v537$1, v417$1 ++ v416$1 ++ v415$1 ++ v414$1), FADD32(FMUL32(v536$1, v396$1 ++ v395$1 ++ v394$1 ++ v393$1), FADD32(FMUL32(v535$1, v375$1 ++ v374$1 ++ v373$1 ++ v372$1), $sum0.0$1[32:0])))), FADD32(FMUL32(v542$1, v450$1 ++ v449$1 ++ v448$1 ++ v447$1), FADD32(FMUL32(v541$1, v429$1 ++ v428$1 ++ v427$1 ++ v426$1), FADD32(FMUL32(v540$1, v408$1 ++ v407$1 ++ v406$1 ++ v405$1), FADD32(FMUL32(v539$1, v387$1 ++ v386$1 ++ v385$1 ++ v384$1), $sum1.0$1[128:96])))) ++ FADD32(FMUL32(v542$1, v446$1 ++ v445$1 ++ v444$1 ++ v443$1), FADD32(FMUL32(v541$1, v425$1 ++ v424$1 ++ v423$1 ++ v422$1), FADD32(FMUL32(v540$1, v404$1 ++ v403$1 ++ v402$1 ++ v401$1), FADD32(FMUL32(v539$1, v383$1 ++ v382$1 ++ v381$1 ++ v380$1), $sum1.0$1[96:64])))) ++ FADD32(FMUL32(v542$1, v442$1 ++ v441$1 ++ v440$1 ++ v439$1), FADD32(FMUL32(v541$1, v421$1 ++ v420$1 ++ v419$1 ++ v418$1), FADD32(FMUL32(v540$1, v400$1 ++ v399$1 ++ v398$1 ++ v397$1), FADD32(FMUL32(v539$1, v379$1 ++ v378$1 ++ v377$1 ++ v376$1), $sum1.0$1[64:32])))) ++ FADD32(FMUL32(v542$1, v438$1 ++ v437$1 ++ v436$1 ++ v435$1), FADD32(FMUL32(v541$1, v417$1 ++ v416$1 ++ v415$1 ++ v414$1), FADD32(FMUL32(v540$1, v396$1 ++ v395$1 ++ v394$1 ++ v393$1), FADD32(FMUL32(v539$1, v375$1 ++ v374$1 ++ v373$1 ++ v372$1), $sum1.0$1[32:0])))), FADD32(FMUL32(v546$1, v450$1 ++ v449$1 ++ v448$1 ++ v447$1), FADD32(FMUL32(v545$1, v429$1 ++ v428$1 ++ v427$1 ++ v426$1), FADD32(FMUL32(v544$1, v408$1 ++ v407$1 ++ v406$1 ++ v405$1), FADD32(FMUL32(v543$1, v387$1 ++ v386$1 ++ v385$1 ++ v384$1), $sum2.0$1[128:96])))) ++ FADD32(FMUL32(v546$1, v446$1 ++ v445$1 ++ v444$1 ++ v443$1), FADD32(FMUL32(v545$1, v425$1 ++ v424$1 ++ v423$1 ++ v422$1), FADD32(FMUL32(v544$1, v404$1 ++ v403$1 ++ v402$1 ++ v401$1), FADD32(FMUL32(v543$1, v383$1 ++ v382$1 ++ v381$1 ++ v380$1), $sum2.0$1[96:64])))) ++ FADD32(FMUL32(v546$1, v442$1 ++ v441$1 ++ v440$1 ++ v439$1), FADD32(FMUL32(v545$1, v421$1 ++ v420$1 ++ v419$1 ++ v418$1), FADD32(FMUL32(v544$1, v400$1 ++ v399$1 ++ v398$1 ++ v397$1), FADD32(FMUL32(v543$1, v379$1 ++ v378$1 ++ v377$1 ++ v376$1), $sum2.0$1[64:32])))) ++ FADD32(FMUL32(v546$1, v438$1 ++ v437$1 ++ v436$1 ++ v435$1), FADD32(FMUL32(v545$1, v417$1 ++ v416$1 ++ v415$1 ++ v414$1), FADD32(FMUL32(v544$1, v396$1 ++ v395$1 ++ v394$1 ++ v393$1), FADD32(FMUL32(v543$1, v375$1 ++ v374$1 ++ v373$1 ++ v372$1), $sum2.0$1[32:0])))), FADD32(FMUL32(v550$1, v450$1 ++ v449$1 ++ v448$1 ++ v447$1), FADD32(FMUL32(v549$1, v429$1 ++ v428$1 ++ v427$1 ++ v426$1), FADD32(FMUL32(v548$1, v408$1 ++ v407$1 ++ v406$1 ++ v405$1), FADD32(FMUL32(v547$1, v387$1 ++ v386$1 ++ v385$1 ++ v384$1), $sum3.0$1[128:96])))) ++ FADD32(FMUL32(v550$1, v446$1 ++ v445$1 ++ v444$1 ++ v443$1), FADD32(FMUL32(v549$1, v425$1 ++ v424$1 ++ v423$1 ++ v422$1), FADD32(FMUL32(v548$1, v404$1 ++ v403$1 ++ v402$1 ++ v401$1), FADD32(FMUL32(v547$1, v383$1 ++ v382$1 ++ v381$1 ++ v380$1), $sum3.0$1[96:64])))) ++ FADD32(FMUL32(v550$1, v442$1 ++ v441$1 ++ v440$1 ++ v439$1), FADD32(FMUL32(v549$1, v421$1 ++ v420$1 ++ v419$1 ++ v418$1), FADD32(FMUL32(v548$1, v400$1 ++ v399$1 ++ v398$1 ++ v397$1), FADD32(FMUL32(v547$1, v379$1 ++ v378$1 ++ v377$1 ++ v376$1), $sum3.0$1[64:32])))) ++ FADD32(FMUL32(v550$1, v438$1 ++ v437$1 ++ v436$1 ++ v435$1), FADD32(FMUL32(v549$1, v417$1 ++ v416$1 ++ v415$1 ++ v414$1), FADD32(FMUL32(v548$1, v396$1 ++ v395$1 ++ v394$1 ++ v393$1), FADD32(FMUL32(v547$1, v375$1 ++ v374$1 ++ v373$1 ++ v372$1), $sum3.0$1[32:0])))), FADD32(FMUL32(v554$1, v450$1 ++ v449$1 ++ v448$1 ++ v447$1), FADD32(FMUL32(v553$1, v429$1 ++ v428$1 ++ v427$1 ++ v426$1), FADD32(FMUL32(v552$1, v408$1 ++ v407$1 ++ v406$1 ++ v405$1), FADD32(FMUL32(v551$1, v387$1 ++ v386$1 ++ v385$1 ++ v384$1), $sum4.0$1[128:96])))) ++ FADD32(FMUL32(v554$1, v446$1 ++ v445$1 ++ v444$1 ++ v443$1), FADD32(FMUL32(v553$1, v425$1 ++ v424$1 ++ v423$1 ++ v422$1), FADD32(FMUL32(v552$1, v404$1 ++ v403$1 ++ v402$1 ++ v401$1), FADD32(FMUL32(v551$1, v383$1 ++ v382$1 ++ v381$1 ++ v380$1), $sum4.0$1[96:64])))) ++ FADD32(FMUL32(v554$1, v442$1 ++ v441$1 ++ v440$1 ++ v439$1), FADD32(FMUL32(v553$1, v421$1 ++ v420$1 ++ v419$1 ++ v418$1), FADD32(FMUL32(v552$1, v400$1 ++ v399$1 ++ v398$1 ++ v397$1), FADD32(FMUL32(v551$1, v379$1 ++ v378$1 ++ v377$1 ++ v376$1), $sum4.0$1[64:32])))) ++ FADD32(FMUL32(v554$1, v438$1 ++ v437$1 ++ v436$1 ++ v435$1), FADD32(FMUL32(v553$1, v417$1 ++ v416$1 ++ v415$1 ++ v414$1), FADD32(FMUL32(v552$1, v396$1 ++ v395$1 ++ v394$1 ++ v393$1), FADD32(FMUL32(v551$1, v375$1 ++ v374$1 ++ v373$1 ++ v372$1), $sum4.0$1[32:0])))), FADD32(FMUL32(v558$1, v450$1 ++ v449$1 ++ v448$1 ++ v447$1), FADD32(FMUL32(v557$1, v429$1 ++ v428$1 ++ v427$1 ++ v426$1), FADD32(FMUL32(v556$1, v408$1 ++ v407$1 ++ v406$1 ++ v405$1), FADD32(FMUL32(v555$1, v387$1 ++ v386$1 ++ v385$1 ++ v384$1), $sum5.0$1[128:96])))) ++ FADD32(FMUL32(v558$1, v446$1 ++ v445$1 ++ v444$1 ++ v443$1), FADD32(FMUL32(v557$1, v425$1 ++ v424$1 ++ v423$1 ++ v422$1), FADD32(FMUL32(v556$1, v404$1 ++ v403$1 ++ v402$1 ++ v401$1), FADD32(FMUL32(v555$1, v383$1 ++ v382$1 ++ v381$1 ++ v380$1), $sum5.0$1[96:64])))) ++ FADD32(FMUL32(v558$1, v442$1 ++ v441$1 ++ v440$1 ++ v439$1), FADD32(FMUL32(v557$1, v421$1 ++ v420$1 ++ v419$1 ++ v418$1), FADD32(FMUL32(v556$1, v400$1 ++ v399$1 ++ v398$1 ++ v397$1), FADD32(FMUL32(v555$1, v379$1 ++ v378$1 ++ v377$1 ++ v376$1), $sum5.0$1[64:32])))) ++ FADD32(FMUL32(v558$1, v438$1 ++ v437$1 ++ v436$1 ++ v435$1), FADD32(FMUL32(v557$1, v417$1 ++ v416$1 ++ v415$1 ++ v414$1), FADD32(FMUL32(v556$1, v396$1 ++ v395$1 ++ v394$1 ++ v393$1), FADD32(FMUL32(v555$1, v375$1 ++ v374$1 ++ v373$1 ++ v372$1), $sum5.0$1[32:0])))), FADD32(FMUL32(v562$1, v450$1 ++ v449$1 ++ v448$1 ++ v447$1), FADD32(FMUL32(v561$1, v429$1 ++ v428$1 ++ v427$1 ++ v426$1), FADD32(FMUL32(v560$1, v408$1 ++ v407$1 ++ v406$1 ++ v405$1), FADD32(FMUL32(v559$1, v387$1 ++ v386$1 ++ v385$1 ++ v384$1), $sum6.0$1[128:96])))) ++ FADD32(FMUL32(v562$1, v446$1 ++ v445$1 ++ v444$1 ++ v443$1), FADD32(FMUL32(v561$1, v425$1 ++ v424$1 ++ v423$1 ++ v422$1), FADD32(FMUL32(v560$1, v404$1 ++ v403$1 ++ v402$1 ++ v401$1), FADD32(FMUL32(v559$1, v383$1 ++ v382$1 ++ v381$1 ++ v380$1), $sum6.0$1[96:64])))) ++ FADD32(FMUL32(v562$1, v442$1 ++ v441$1 ++ v440$1 ++ v439$1), FADD32(FMUL32(v561$1, v421$1 ++ v420$1 ++ v419$1 ++ v418$1), FADD32(FMUL32(v560$1, v400$1 ++ v399$1 ++ v398$1 ++ v397$1), FADD32(FMUL32(v559$1, v379$1 ++ v378$1 ++ v377$1 ++ v376$1), $sum6.0$1[64:32])))) ++ FADD32(FMUL32(v562$1, v438$1 ++ v437$1 ++ v436$1 ++ v435$1), FADD32(FMUL32(v561$1, v417$1 ++ v416$1 ++ v415$1 ++ v414$1), FADD32(FMUL32(v560$1, v396$1 ++ v395$1 ++ v394$1 ++ v393$1), FADD32(FMUL32(v559$1, v375$1 ++ v374$1 ++ v373$1 ++ v372$1), $sum6.0$1[32:0])))), FADD32(FMUL32(v566$1, v450$1 ++ v449$1 ++ v448$1 ++ v447$1), FADD32(FMUL32(v565$1, v429$1 ++ v428$1 ++ v427$1 ++ v426$1), FADD32(FMUL32(v564$1, v408$1 ++ v407$1 ++ v406$1 ++ v405$1), FADD32(FMUL32(v563$1, v387$1 ++ v386$1 ++ v385$1 ++ v384$1), $sum7.0$1[128:96])))) ++ FADD32(FMUL32(v566$1, v446$1 ++ v445$1 ++ v444$1 ++ v443$1), FADD32(FMUL32(v565$1, v425$1 ++ v424$1 ++ v423$1 ++ v422$1), FADD32(FMUL32(v564$1, v404$1 ++ v403$1 ++ v402$1 ++ v401$1), FADD32(FMUL32(v563$1, v383$1 ++ v382$1 ++ v381$1 ++ v380$1), $sum7.0$1[96:64])))) ++ FADD32(FMUL32(v566$1, v442$1 ++ v441$1 ++ v440$1 ++ v439$1), FADD32(FMUL32(v565$1, v421$1 ++ v420$1 ++ v419$1 ++ v418$1), FADD32(FMUL32(v564$1, v400$1 ++ v399$1 ++ v398$1 ++ v397$1), FADD32(FMUL32(v563$1, v379$1 ++ v378$1 ++ v377$1 ++ v376$1), $sum7.0$1[64:32])))) ++ FADD32(FMUL32(v566$1, v438$1 ++ v437$1 ++ v436$1 ++ v435$1), FADD32(FMUL32(v565$1, v417$1 ++ v416$1 ++ v415$1 ++ v414$1), FADD32(FMUL32(v564$1, v396$1 ++ v395$1 ++ v394$1 ++ v393$1), FADD32(FMUL32(v563$1, v375$1 ++ v374$1 ++ v373$1 ++ v372$1), $sum7.0$1[32:0])))), BV32_ADD($i.0, 4bv32);
    $sum0.0$2, $sum1.0$2, $sum2.0$2, $sum3.0$2, $sum4.0$2, $sum5.0$2, $sum6.0$2, $sum7.0$2 := FADD32(FMUL32(v538$2, v450$2 ++ v449$2 ++ v448$2 ++ v447$2), FADD32(FMUL32(v537$2, v429$2 ++ v428$2 ++ v427$2 ++ v426$2), FADD32(FMUL32(v536$2, v408$2 ++ v407$2 ++ v406$2 ++ v405$2), FADD32(FMUL32(v535$2, v387$2 ++ v386$2 ++ v385$2 ++ v384$2), $sum0.0$2[128:96])))) ++ FADD32(FMUL32(v538$2, v446$2 ++ v445$2 ++ v444$2 ++ v443$2), FADD32(FMUL32(v537$2, v425$2 ++ v424$2 ++ v423$2 ++ v422$2), FADD32(FMUL32(v536$2, v404$2 ++ v403$2 ++ v402$2 ++ v401$2), FADD32(FMUL32(v535$2, v383$2 ++ v382$2 ++ v381$2 ++ v380$2), $sum0.0$2[96:64])))) ++ FADD32(FMUL32(v538$2, v442$2 ++ v441$2 ++ v440$2 ++ v439$2), FADD32(FMUL32(v537$2, v421$2 ++ v420$2 ++ v419$2 ++ v418$2), FADD32(FMUL32(v536$2, v400$2 ++ v399$2 ++ v398$2 ++ v397$2), FADD32(FMUL32(v535$2, v379$2 ++ v378$2 ++ v377$2 ++ v376$2), $sum0.0$2[64:32])))) ++ FADD32(FMUL32(v538$2, v438$2 ++ v437$2 ++ v436$2 ++ v435$2), FADD32(FMUL32(v537$2, v417$2 ++ v416$2 ++ v415$2 ++ v414$2), FADD32(FMUL32(v536$2, v396$2 ++ v395$2 ++ v394$2 ++ v393$2), FADD32(FMUL32(v535$2, v375$2 ++ v374$2 ++ v373$2 ++ v372$2), $sum0.0$2[32:0])))), FADD32(FMUL32(v542$2, v450$2 ++ v449$2 ++ v448$2 ++ v447$2), FADD32(FMUL32(v541$2, v429$2 ++ v428$2 ++ v427$2 ++ v426$2), FADD32(FMUL32(v540$2, v408$2 ++ v407$2 ++ v406$2 ++ v405$2), FADD32(FMUL32(v539$2, v387$2 ++ v386$2 ++ v385$2 ++ v384$2), $sum1.0$2[128:96])))) ++ FADD32(FMUL32(v542$2, v446$2 ++ v445$2 ++ v444$2 ++ v443$2), FADD32(FMUL32(v541$2, v425$2 ++ v424$2 ++ v423$2 ++ v422$2), FADD32(FMUL32(v540$2, v404$2 ++ v403$2 ++ v402$2 ++ v401$2), FADD32(FMUL32(v539$2, v383$2 ++ v382$2 ++ v381$2 ++ v380$2), $sum1.0$2[96:64])))) ++ FADD32(FMUL32(v542$2, v442$2 ++ v441$2 ++ v440$2 ++ v439$2), FADD32(FMUL32(v541$2, v421$2 ++ v420$2 ++ v419$2 ++ v418$2), FADD32(FMUL32(v540$2, v400$2 ++ v399$2 ++ v398$2 ++ v397$2), FADD32(FMUL32(v539$2, v379$2 ++ v378$2 ++ v377$2 ++ v376$2), $sum1.0$2[64:32])))) ++ FADD32(FMUL32(v542$2, v438$2 ++ v437$2 ++ v436$2 ++ v435$2), FADD32(FMUL32(v541$2, v417$2 ++ v416$2 ++ v415$2 ++ v414$2), FADD32(FMUL32(v540$2, v396$2 ++ v395$2 ++ v394$2 ++ v393$2), FADD32(FMUL32(v539$2, v375$2 ++ v374$2 ++ v373$2 ++ v372$2), $sum1.0$2[32:0])))), FADD32(FMUL32(v546$2, v450$2 ++ v449$2 ++ v448$2 ++ v447$2), FADD32(FMUL32(v545$2, v429$2 ++ v428$2 ++ v427$2 ++ v426$2), FADD32(FMUL32(v544$2, v408$2 ++ v407$2 ++ v406$2 ++ v405$2), FADD32(FMUL32(v543$2, v387$2 ++ v386$2 ++ v385$2 ++ v384$2), $sum2.0$2[128:96])))) ++ FADD32(FMUL32(v546$2, v446$2 ++ v445$2 ++ v444$2 ++ v443$2), FADD32(FMUL32(v545$2, v425$2 ++ v424$2 ++ v423$2 ++ v422$2), FADD32(FMUL32(v544$2, v404$2 ++ v403$2 ++ v402$2 ++ v401$2), FADD32(FMUL32(v543$2, v383$2 ++ v382$2 ++ v381$2 ++ v380$2), $sum2.0$2[96:64])))) ++ FADD32(FMUL32(v546$2, v442$2 ++ v441$2 ++ v440$2 ++ v439$2), FADD32(FMUL32(v545$2, v421$2 ++ v420$2 ++ v419$2 ++ v418$2), FADD32(FMUL32(v544$2, v400$2 ++ v399$2 ++ v398$2 ++ v397$2), FADD32(FMUL32(v543$2, v379$2 ++ v378$2 ++ v377$2 ++ v376$2), $sum2.0$2[64:32])))) ++ FADD32(FMUL32(v546$2, v438$2 ++ v437$2 ++ v436$2 ++ v435$2), FADD32(FMUL32(v545$2, v417$2 ++ v416$2 ++ v415$2 ++ v414$2), FADD32(FMUL32(v544$2, v396$2 ++ v395$2 ++ v394$2 ++ v393$2), FADD32(FMUL32(v543$2, v375$2 ++ v374$2 ++ v373$2 ++ v372$2), $sum2.0$2[32:0])))), FADD32(FMUL32(v550$2, v450$2 ++ v449$2 ++ v448$2 ++ v447$2), FADD32(FMUL32(v549$2, v429$2 ++ v428$2 ++ v427$2 ++ v426$2), FADD32(FMUL32(v548$2, v408$2 ++ v407$2 ++ v406$2 ++ v405$2), FADD32(FMUL32(v547$2, v387$2 ++ v386$2 ++ v385$2 ++ v384$2), $sum3.0$2[128:96])))) ++ FADD32(FMUL32(v550$2, v446$2 ++ v445$2 ++ v444$2 ++ v443$2), FADD32(FMUL32(v549$2, v425$2 ++ v424$2 ++ v423$2 ++ v422$2), FADD32(FMUL32(v548$2, v404$2 ++ v403$2 ++ v402$2 ++ v401$2), FADD32(FMUL32(v547$2, v383$2 ++ v382$2 ++ v381$2 ++ v380$2), $sum3.0$2[96:64])))) ++ FADD32(FMUL32(v550$2, v442$2 ++ v441$2 ++ v440$2 ++ v439$2), FADD32(FMUL32(v549$2, v421$2 ++ v420$2 ++ v419$2 ++ v418$2), FADD32(FMUL32(v548$2, v400$2 ++ v399$2 ++ v398$2 ++ v397$2), FADD32(FMUL32(v547$2, v379$2 ++ v378$2 ++ v377$2 ++ v376$2), $sum3.0$2[64:32])))) ++ FADD32(FMUL32(v550$2, v438$2 ++ v437$2 ++ v436$2 ++ v435$2), FADD32(FMUL32(v549$2, v417$2 ++ v416$2 ++ v415$2 ++ v414$2), FADD32(FMUL32(v548$2, v396$2 ++ v395$2 ++ v394$2 ++ v393$2), FADD32(FMUL32(v547$2, v375$2 ++ v374$2 ++ v373$2 ++ v372$2), $sum3.0$2[32:0])))), FADD32(FMUL32(v554$2, v450$2 ++ v449$2 ++ v448$2 ++ v447$2), FADD32(FMUL32(v553$2, v429$2 ++ v428$2 ++ v427$2 ++ v426$2), FADD32(FMUL32(v552$2, v408$2 ++ v407$2 ++ v406$2 ++ v405$2), FADD32(FMUL32(v551$2, v387$2 ++ v386$2 ++ v385$2 ++ v384$2), $sum4.0$2[128:96])))) ++ FADD32(FMUL32(v554$2, v446$2 ++ v445$2 ++ v444$2 ++ v443$2), FADD32(FMUL32(v553$2, v425$2 ++ v424$2 ++ v423$2 ++ v422$2), FADD32(FMUL32(v552$2, v404$2 ++ v403$2 ++ v402$2 ++ v401$2), FADD32(FMUL32(v551$2, v383$2 ++ v382$2 ++ v381$2 ++ v380$2), $sum4.0$2[96:64])))) ++ FADD32(FMUL32(v554$2, v442$2 ++ v441$2 ++ v440$2 ++ v439$2), FADD32(FMUL32(v553$2, v421$2 ++ v420$2 ++ v419$2 ++ v418$2), FADD32(FMUL32(v552$2, v400$2 ++ v399$2 ++ v398$2 ++ v397$2), FADD32(FMUL32(v551$2, v379$2 ++ v378$2 ++ v377$2 ++ v376$2), $sum4.0$2[64:32])))) ++ FADD32(FMUL32(v554$2, v438$2 ++ v437$2 ++ v436$2 ++ v435$2), FADD32(FMUL32(v553$2, v417$2 ++ v416$2 ++ v415$2 ++ v414$2), FADD32(FMUL32(v552$2, v396$2 ++ v395$2 ++ v394$2 ++ v393$2), FADD32(FMUL32(v551$2, v375$2 ++ v374$2 ++ v373$2 ++ v372$2), $sum4.0$2[32:0])))), FADD32(FMUL32(v558$2, v450$2 ++ v449$2 ++ v448$2 ++ v447$2), FADD32(FMUL32(v557$2, v429$2 ++ v428$2 ++ v427$2 ++ v426$2), FADD32(FMUL32(v556$2, v408$2 ++ v407$2 ++ v406$2 ++ v405$2), FADD32(FMUL32(v555$2, v387$2 ++ v386$2 ++ v385$2 ++ v384$2), $sum5.0$2[128:96])))) ++ FADD32(FMUL32(v558$2, v446$2 ++ v445$2 ++ v444$2 ++ v443$2), FADD32(FMUL32(v557$2, v425$2 ++ v424$2 ++ v423$2 ++ v422$2), FADD32(FMUL32(v556$2, v404$2 ++ v403$2 ++ v402$2 ++ v401$2), FADD32(FMUL32(v555$2, v383$2 ++ v382$2 ++ v381$2 ++ v380$2), $sum5.0$2[96:64])))) ++ FADD32(FMUL32(v558$2, v442$2 ++ v441$2 ++ v440$2 ++ v439$2), FADD32(FMUL32(v557$2, v421$2 ++ v420$2 ++ v419$2 ++ v418$2), FADD32(FMUL32(v556$2, v400$2 ++ v399$2 ++ v398$2 ++ v397$2), FADD32(FMUL32(v555$2, v379$2 ++ v378$2 ++ v377$2 ++ v376$2), $sum5.0$2[64:32])))) ++ FADD32(FMUL32(v558$2, v438$2 ++ v437$2 ++ v436$2 ++ v435$2), FADD32(FMUL32(v557$2, v417$2 ++ v416$2 ++ v415$2 ++ v414$2), FADD32(FMUL32(v556$2, v396$2 ++ v395$2 ++ v394$2 ++ v393$2), FADD32(FMUL32(v555$2, v375$2 ++ v374$2 ++ v373$2 ++ v372$2), $sum5.0$2[32:0])))), FADD32(FMUL32(v562$2, v450$2 ++ v449$2 ++ v448$2 ++ v447$2), FADD32(FMUL32(v561$2, v429$2 ++ v428$2 ++ v427$2 ++ v426$2), FADD32(FMUL32(v560$2, v408$2 ++ v407$2 ++ v406$2 ++ v405$2), FADD32(FMUL32(v559$2, v387$2 ++ v386$2 ++ v385$2 ++ v384$2), $sum6.0$2[128:96])))) ++ FADD32(FMUL32(v562$2, v446$2 ++ v445$2 ++ v444$2 ++ v443$2), FADD32(FMUL32(v561$2, v425$2 ++ v424$2 ++ v423$2 ++ v422$2), FADD32(FMUL32(v560$2, v404$2 ++ v403$2 ++ v402$2 ++ v401$2), FADD32(FMUL32(v559$2, v383$2 ++ v382$2 ++ v381$2 ++ v380$2), $sum6.0$2[96:64])))) ++ FADD32(FMUL32(v562$2, v442$2 ++ v441$2 ++ v440$2 ++ v439$2), FADD32(FMUL32(v561$2, v421$2 ++ v420$2 ++ v419$2 ++ v418$2), FADD32(FMUL32(v560$2, v400$2 ++ v399$2 ++ v398$2 ++ v397$2), FADD32(FMUL32(v559$2, v379$2 ++ v378$2 ++ v377$2 ++ v376$2), $sum6.0$2[64:32])))) ++ FADD32(FMUL32(v562$2, v438$2 ++ v437$2 ++ v436$2 ++ v435$2), FADD32(FMUL32(v561$2, v417$2 ++ v416$2 ++ v415$2 ++ v414$2), FADD32(FMUL32(v560$2, v396$2 ++ v395$2 ++ v394$2 ++ v393$2), FADD32(FMUL32(v559$2, v375$2 ++ v374$2 ++ v373$2 ++ v372$2), $sum6.0$2[32:0])))), FADD32(FMUL32(v566$2, v450$2 ++ v449$2 ++ v448$2 ++ v447$2), FADD32(FMUL32(v565$2, v429$2 ++ v428$2 ++ v427$2 ++ v426$2), FADD32(FMUL32(v564$2, v408$2 ++ v407$2 ++ v406$2 ++ v405$2), FADD32(FMUL32(v563$2, v387$2 ++ v386$2 ++ v385$2 ++ v384$2), $sum7.0$2[128:96])))) ++ FADD32(FMUL32(v566$2, v446$2 ++ v445$2 ++ v444$2 ++ v443$2), FADD32(FMUL32(v565$2, v425$2 ++ v424$2 ++ v423$2 ++ v422$2), FADD32(FMUL32(v564$2, v404$2 ++ v403$2 ++ v402$2 ++ v401$2), FADD32(FMUL32(v563$2, v383$2 ++ v382$2 ++ v381$2 ++ v380$2), $sum7.0$2[96:64])))) ++ FADD32(FMUL32(v566$2, v442$2 ++ v441$2 ++ v440$2 ++ v439$2), FADD32(FMUL32(v565$2, v421$2 ++ v420$2 ++ v419$2 ++ v418$2), FADD32(FMUL32(v564$2, v400$2 ++ v399$2 ++ v398$2 ++ v397$2), FADD32(FMUL32(v563$2, v379$2 ++ v378$2 ++ v377$2 ++ v376$2), $sum7.0$2[64:32])))) ++ FADD32(FMUL32(v566$2, v438$2 ++ v437$2 ++ v436$2 ++ v435$2), FADD32(FMUL32(v565$2, v417$2 ++ v416$2 ++ v415$2 ++ v414$2), FADD32(FMUL32(v564$2, v396$2 ++ v395$2 ++ v394$2 ++ v393$2), FADD32(FMUL32(v563$2, v375$2 ++ v374$2 ++ v373$2 ++ v372$2), $sum7.0$2[32:0]))));
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $133;

  $truebb93:
    assume {:partition} v516 && v516;
    $93 := 32767bv32;
    goto $260;

  $truebb92:
    assume {:partition} v515 && v515;
    $92 := 0bv32;
    goto $261;

  $truebb89:
    assume {:partition} v495 && v495;
    $89 := 32767bv32;
    goto $249;

  $truebb88:
    assume {:partition} v494 && v494;
    $88 := 0bv32;
    goto $250;

  $truebb85:
    assume {:partition} v474 && v474;
    $85 := 32767bv32;
    goto $238;

  $truebb84:
    assume {:partition} v473 && v473;
    $84 := 0bv32;
    goto $239;

  $truebb81:
    assume {:partition} v453 && v453;
    $81 := 32767bv32;
    goto $227;

  $truebb80:
    assume {:partition} v452 && v452;
    $80 := 0bv32;
    goto $228;

  $truebb79:
    assume {:partition} v434 && v434;
    $79 := 32767bv32;
    goto $222;

  $truebb78:
    assume {:partition} v433 && v433;
    $78 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit53;

  $truebb75:
    assume {:partition} v413 && v413;
    $75 := 32767bv32;
    goto $211;

  $truebb74:
    assume {:partition} v412 && v412;
    $74 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit57;

  $truebb71:
    assume {:partition} v392 && v392;
    $71 := 32767bv32;
    goto $200;

  $truebb70:
    assume {:partition} v391 && v391;
    $70 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit61;

  $truebb67:
    assume {:partition} v371 && v371;
    $67 := 32767bv32;
    goto $189;

  $truebb66:
    assume {:partition} v370 && v370;
    $66 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit65;

  $truebb61:
    assume {:partition} v348 && v348;
    $61 := 32767bv32;
    goto $172;

  $truebb60:
    assume {:partition} v347 && v347;
    $60 := 0bv32;
    goto $173;

  $truebb57:
    assume {:partition} v327 && v327;
    $57 := 32767bv32;
    goto $161;

  $truebb56:
    assume {:partition} v326 && v326;
    $56 := 0bv32;
    goto $162;

  $truebb53:
    assume {:partition} v306 && v306;
    $53 := 32767bv32;
    goto $150;

  $truebb52:
    assume {:partition} v305 && v305;
    $52 := 0bv32;
    goto $151;

  $truebb49:
    assume {:partition} v285 && v285;
    $49 := 32767bv32;
    goto $139;

  $truebb48:
    assume {:partition} v284 && v284;
    $48 := 0bv32;
    goto $140;

  $truebb46:
    assume {:partition} false && false;
    $47 := 32767bv32;
    goto $132;

  $truebb45:
    assume {:partition} false && false;
    $46 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit93;

  $truebb42:
    assume {:partition} false && false;
    $43 := 32767bv32;
    goto $121;

  $truebb41:
    assume {:partition} false && false;
    $42 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit97;

  $truebb38:
    assume {:partition} false && false;
    $39 := 32767bv32;
    goto $110;

  $truebb37:
    assume {:partition} false && false;
    $38 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit101;

  $truebb34:
    assume {:partition} false && false;
    $35 := 32767bv32;
    goto $99;

  $truebb33:
    assume {:partition} false && false;
    $34 := 0bv32;
    goto $_Z11read_imagefPU3AS1vjDv2_i.exit105;

  $truebb28:
    assume {:partition} false && false;
    $29 := 32767bv32;
    goto $82;

  $truebb27:
    assume {:partition} false && false;
    $28 := 0bv32;
    goto $83;

  $truebb24:
    assume {:partition} false && false;
    $25 := 32767bv32;
    goto $71;

  $truebb23:
    assume {:partition} false && false;
    $24 := 0bv32;
    goto $72;

  $truebb20:
    assume {:partition} false && false;
    $21 := 32767bv32;
    goto $60;

  $truebb19:
    assume {:partition} false && false;
    $20 := 0bv32;
    goto $61;

  $truebb16:
    assume {:partition} false && false;
    $17 := 32767bv32;
    goto $49;

  $truebb15:
    assume {:partition} false && false;
    $16 := 0bv32;
    goto $50;

  $truebb12:
    assume {:partition} false && false;
    $13 := 32767bv32;
    goto $38;

  $truebb11:
    assume {:partition} false && false;
    $12 := 0bv32;
    goto $39;

  $truebb8:
    assume {:partition} false && false;
    $9 := 32767bv32;
    goto $27;

  $truebb7:
    assume {:partition} false && false;
    $8 := 0bv32;
    goto $28;

  $truebb4:
    assume {:partition} false && false;
    $5 := 32767bv32;
    goto $16;

  $truebb3:
    assume {:partition} false && false;
    $4 := 0bv32;
    goto $17;

  $truebb0:
    assume {:partition} false && false;
    $1 := 32767bv32;
    goto $5;

  $truebb:
    assume {:partition} false && false;
    $0 := 0bv32;
    goto $6;
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
