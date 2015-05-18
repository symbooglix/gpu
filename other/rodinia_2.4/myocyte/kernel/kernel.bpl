type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_initvalu"} {:global} $$d_initvalu: [bv32]bv32;

axiom {:array_info "$$d_initvalu"} {:global} {:elem_width 32} {:source_name "d_initvalu"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_initvalu: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_initvalu: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_initvalu: bool;

var {:source_name "d_finavalu"} {:global} $$d_finavalu: [bv32]bv32;

axiom {:array_info "$$d_finavalu"} {:global} {:elem_width 32} {:source_name "d_finavalu"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_finavalu: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_finavalu: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_finavalu: bool;

var {:source_name "d_params"} {:global} $$d_params: [bv32]bv32;

axiom {:array_info "$$d_params"} {:global} {:elem_width 32} {:source_name "d_params"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_params: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_params: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_params: bool;

var {:source_name "d_com"} {:global} $$d_com: [bv32]bv32;

axiom {:array_info "$$d_com"} {:global} {:elem_width 32} {:source_name "d_com"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_com: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_com: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_com: bool;

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

function FADD64(bv64, bv64) : bv64;

function FDIV32(bv32, bv32) : bv32;

function FDIV64(bv64, bv64) : bv64;

function FEQ32(bv32, bv32) : bool;

function FEXP32(bv32) : bv32;

function FEXP64(bv64) : bv64;

function FLOG32(bv32) : bv32;

function FLT32(bv32, bv32) : bool;

function FLT64(bv64, bv64) : bool;

function FMUL32(bv32, bv32) : bv32;

function FMUL64(bv64, bv64) : bv64;

function FP32_CONV64(bv32) : bv64;

function FP64_CONV32(bv64) : bv32;

function FPOW32(bv32, bv32) : bv32;

function FPOW64(bv64, bv64) : bv64;

function FSQRT64(bv64) : bv64;

function FSUB32(bv32, bv32) : bv32;

function FSUB64(bv64, bv64) : bv64;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

procedure {:source_name "kernel_gpu_opencl"} {:kernel} $kernel_gpu_opencl($timeinst: bv32);
  requires !_READ_HAS_OCCURRED_$$d_initvalu && !_WRITE_HAS_OCCURRED_$$d_initvalu && !_ATOMIC_HAS_OCCURRED_$$d_initvalu;
  requires !_READ_HAS_OCCURRED_$$d_finavalu && !_WRITE_HAS_OCCURRED_$$d_finavalu && !_ATOMIC_HAS_OCCURRED_$$d_finavalu;
  requires !_READ_HAS_OCCURRED_$$d_params && !_WRITE_HAS_OCCURRED_$$d_params && !_ATOMIC_HAS_OCCURRED_$$d_params;
  requires !_READ_HAS_OCCURRED_$$d_com && !_WRITE_HAS_OCCURRED_$$d_com && !_ATOMIC_HAS_OCCURRED_$$d_com;
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
  modifies _WRITE_HAS_OCCURRED_$$d_finavalu, _WRITE_READ_BENIGN_FLAG_$$d_finavalu, _WRITE_READ_BENIGN_FLAG_$$d_finavalu, _READ_HAS_OCCURRED_$$d_finavalu, _WRITE_HAS_OCCURRED_$$d_com, _WRITE_READ_BENIGN_FLAG_$$d_com, _WRITE_READ_BENIGN_FLAG_$$d_com;



implementation {:source_name "kernel_gpu_opencl"} {:kernel} $kernel_gpu_opencl($timeinst: bv32)
{
  var $ah.i.0$1: bv32;
  var $ah.i.0$2: bv32;
  var $bh.i.0$1: bv32;
  var $bh.i.0$2: bv32;
  var $aj.i.0$1: bv32;
  var $aj.i.0$2: bv32;
  var $bj.i.0$1: bv32;
  var $bj.i.0$2: bv32;
  var $I_app.i.1$1: bv32;
  var $I_app.i.1$2: bv32;
  var $I_app.i.0$1: bv32;
  var $I_app.i.0$2: bv32;
  var $V_clamp.i.0$1: bv32;
  var $V_clamp.i.0$2: bv32;
  var $Kd02.i.0$1: bv32;
  var $Kd02.i.0$2: bv32;
  var $Kd24.i.0$1: bv32;
  var $Kd24.i.0$2: bv32;
  var $Kd02.i52.0$1: bv32;
  var $Kd02.i52.0$2: bv32;
  var $Kd24.i53.0$1: bv32;
  var $Kd24.i53.0$2: bv32;
  var $Kd02.i173.0$1: bv32;
  var $Kd02.i173.0$2: bv32;
  var $Kd24.i174.0$1: bv32;
  var $Kd24.i174.0$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v103$1: bv32;
  var v103$2: bv32;
  var v104$1: bv32;
  var v104$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
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
  var v58$1: bool;
  var v58$2: bool;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bool;
  var v3$2: bool;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
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
  var v98$1: bv32;
  var v98$2: bv32;
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
  var v99$1: bv32;
  var v99$2: bv32;
  var v100$1: bv32;
  var v100$2: bv32;
  var v101$1: bv32;
  var v101$2: bv32;
  var v102$1: bv32;
  var v102$2: bv32;
  var v272$1: bv32;
  var v272$2: bv32;
  var v105$1: bv32;
  var v105$2: bv32;
  var v106$1: bool;
  var v106$2: bool;
  var v107$1: bool;
  var v107$2: bool;
  var v108$1: bool;
  var v108$2: bool;
  var v109$1: bool;
  var v109$2: bool;
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
  var v133$1: bool;
  var v133$2: bool;
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
  var v184$1: bv32;
  var v184$2: bv32;
  var v185$1: bv32;
  var v185$2: bv32;
  var v186$1: bv32;
  var v186$2: bv32;
  var v187$1: bool;
  var v187$2: bool;
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
  var v241$1: bool;
  var v241$2: bool;
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
  var v264$1: bv32;
  var v264$2: bv32;
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
  var v270$1: bv32;
  var v270$2: bv32;
  var v271$1: bv32;
  var v271$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := group_id_x$1;
    v0$2 := group_id_x$2;
    v1$1 := local_id_x$1;
    v1$2 := local_id_x$2;
    v2$1 := v0$1 == 0bv32;
    v2$2 := v0$2 == 0bv32;
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
    p0$1 := (if v2$1 then v2$1 else p0$1);
    p0$2 := (if v2$2 then v2$2 else p0$2);
    p13$1 := (if !v2$1 then !v2$1 else p13$1);
    p13$2 := (if !v2$2 then !v2$2 else p13$2);
    v3$1 := (if p0$1 then v1$1 == 0bv32 else v3$1);
    v3$2 := (if p0$2 then v1$2 == 0bv32 else v3$2);
    p1$1 := (if p0$1 && v3$1 then v3$1 else p1$1);
    p1$2 := (if p0$2 && v3$2 then v3$2 else p1$2);
    v4$1 := (if p1$1 then SI32_TO_FP32($timeinst) else v4$1);
    v4$2 := (if p1$2 then SI32_TO_FP32($timeinst) else v4$2);
    v5$1 := (if p1$1 then $$d_params[15bv32] else v5$1);
    v5$2 := (if p1$2 then $$d_params[15bv32] else v5$2);
    v6$1 := (if p1$1 then $$d_initvalu[0bv32] else v6$1);
    v6$2 := (if p1$2 then $$d_initvalu[0bv32] else v6$2);
    v7$1 := (if p1$1 then $$d_initvalu[1bv32] else v7$1);
    v7$2 := (if p1$2 then $$d_initvalu[1bv32] else v7$2);
    v8$1 := (if p1$1 then $$d_initvalu[2bv32] else v8$1);
    v8$2 := (if p1$2 then $$d_initvalu[2bv32] else v8$2);
    v9$1 := (if p1$1 then $$d_initvalu[3bv32] else v9$1);
    v9$2 := (if p1$2 then $$d_initvalu[3bv32] else v9$2);
    v10$1 := (if p1$1 then $$d_initvalu[4bv32] else v10$1);
    v10$2 := (if p1$2 then $$d_initvalu[4bv32] else v10$2);
    v11$1 := (if p1$1 then $$d_initvalu[5bv32] else v11$1);
    v11$2 := (if p1$2 then $$d_initvalu[5bv32] else v11$2);
    v12$1 := (if p1$1 then $$d_initvalu[6bv32] else v12$1);
    v12$2 := (if p1$2 then $$d_initvalu[6bv32] else v12$2);
    v13$1 := (if p1$1 then $$d_initvalu[7bv32] else v13$1);
    v13$2 := (if p1$2 then $$d_initvalu[7bv32] else v13$2);
    v14$1 := (if p1$1 then $$d_initvalu[8bv32] else v14$1);
    v14$2 := (if p1$2 then $$d_initvalu[8bv32] else v14$2);
    v15$1 := (if p1$1 then $$d_initvalu[9bv32] else v15$1);
    v15$2 := (if p1$2 then $$d_initvalu[9bv32] else v15$2);
    v16$1 := (if p1$1 then $$d_initvalu[10bv32] else v16$1);
    v16$2 := (if p1$2 then $$d_initvalu[10bv32] else v16$2);
    v17$1 := (if p1$1 then $$d_initvalu[11bv32] else v17$1);
    v17$2 := (if p1$2 then $$d_initvalu[11bv32] else v17$2);
    v18$1 := (if p1$1 then $$d_initvalu[12bv32] else v18$1);
    v18$2 := (if p1$2 then $$d_initvalu[12bv32] else v18$2);
    v19$1 := (if p1$1 then $$d_initvalu[13bv32] else v19$1);
    v19$2 := (if p1$2 then $$d_initvalu[13bv32] else v19$2);
    v20$1 := (if p1$1 then $$d_initvalu[14bv32] else v20$1);
    v20$2 := (if p1$2 then $$d_initvalu[14bv32] else v20$2);
    v21$1 := (if p1$1 then $$d_initvalu[15bv32] else v21$1);
    v21$2 := (if p1$2 then $$d_initvalu[15bv32] else v21$2);
    v22$1 := (if p1$1 then $$d_initvalu[16bv32] else v22$1);
    v22$2 := (if p1$2 then $$d_initvalu[16bv32] else v22$2);
    v23$1 := (if p1$1 then $$d_initvalu[17bv32] else v23$1);
    v23$2 := (if p1$2 then $$d_initvalu[17bv32] else v23$2);
    v24$1 := (if p1$1 then $$d_initvalu[18bv32] else v24$1);
    v24$2 := (if p1$2 then $$d_initvalu[18bv32] else v24$2);
    v25$1 := (if p1$1 then $$d_initvalu[19bv32] else v25$1);
    v25$2 := (if p1$2 then $$d_initvalu[19bv32] else v25$2);
    v26$1 := (if p1$1 then $$d_initvalu[20bv32] else v26$1);
    v26$2 := (if p1$2 then $$d_initvalu[20bv32] else v26$2);
    v27$1 := (if p1$1 then $$d_initvalu[22bv32] else v27$1);
    v27$2 := (if p1$2 then $$d_initvalu[22bv32] else v27$2);
    v28$1 := (if p1$1 then $$d_initvalu[23bv32] else v28$1);
    v28$2 := (if p1$2 then $$d_initvalu[23bv32] else v28$2);
    v29$1 := (if p1$1 then $$d_initvalu[24bv32] else v29$1);
    v29$2 := (if p1$2 then $$d_initvalu[24bv32] else v29$2);
    v30$1 := (if p1$1 then $$d_initvalu[25bv32] else v30$1);
    v30$2 := (if p1$2 then $$d_initvalu[25bv32] else v30$2);
    v31$1 := (if p1$1 then $$d_initvalu[26bv32] else v31$1);
    v31$2 := (if p1$2 then $$d_initvalu[26bv32] else v31$2);
    v32$1 := (if p1$1 then $$d_initvalu[27bv32] else v32$1);
    v32$2 := (if p1$2 then $$d_initvalu[27bv32] else v32$2);
    v33$1 := (if p1$1 then $$d_initvalu[28bv32] else v33$1);
    v33$2 := (if p1$2 then $$d_initvalu[28bv32] else v33$2);
    v34$1 := (if p1$1 then $$d_initvalu[29bv32] else v34$1);
    v34$2 := (if p1$2 then $$d_initvalu[29bv32] else v34$2);
    v35$1 := (if p1$1 then $$d_initvalu[30bv32] else v35$1);
    v35$2 := (if p1$2 then $$d_initvalu[30bv32] else v35$2);
    v36$1 := (if p1$1 then $$d_initvalu[31bv32] else v36$1);
    v36$2 := (if p1$2 then $$d_initvalu[31bv32] else v36$2);
    v37$1 := (if p1$1 then $$d_initvalu[32bv32] else v37$1);
    v37$2 := (if p1$2 then $$d_initvalu[32bv32] else v37$2);
    v38$1 := (if p1$1 then $$d_initvalu[33bv32] else v38$1);
    v38$2 := (if p1$2 then $$d_initvalu[33bv32] else v38$2);
    v39$1 := (if p1$1 then $$d_initvalu[34bv32] else v39$1);
    v39$2 := (if p1$2 then $$d_initvalu[34bv32] else v39$2);
    v40$1 := (if p1$1 then $$d_initvalu[35bv32] else v40$1);
    v40$2 := (if p1$2 then $$d_initvalu[35bv32] else v40$2);
    v41$1 := (if p1$1 then $$d_initvalu[36bv32] else v41$1);
    v41$2 := (if p1$2 then $$d_initvalu[36bv32] else v41$2);
    v42$1 := (if p1$1 then $$d_initvalu[37bv32] else v42$1);
    v42$2 := (if p1$2 then $$d_initvalu[37bv32] else v42$2);
    v43$1 := (if p1$1 then $$d_initvalu[38bv32] else v43$1);
    v43$2 := (if p1$2 then $$d_initvalu[38bv32] else v43$2);
    v44$1 := (if p1$1 then $$d_initvalu[39bv32] else v44$1);
    v44$2 := (if p1$2 then $$d_initvalu[39bv32] else v44$2);
    v45$1 := (if p1$1 then FDIV32(FDIV32(1203532416bv32, 1174530048bv32), 1134231552bv32) else v45$1);
    v45$2 := (if p1$2 then FDIV32(FDIV32(1203532416bv32, 1174530048bv32), 1134231552bv32) else v45$2);
    v46$1 := (if p1$1 then FDIV32(FSUB32(1134231552bv32, 1134231552bv32), 1092616192bv32) else v46$1);
    v46$2 := (if p1$2 then FDIV32(FSUB32(1134231552bv32, 1134231552bv32), 1092616192bv32) else v46$2);
    v47$1 := (if p1$1 then FP64_CONV32(FMUL64(FP32_CONV64(FMUL32(FMUL32(1078530041bv32, FPOW32(1092878336bv32, 1073741824bv32)), 1120403456bv32)), 4382569440205035030bv64)) else v47$1);
    v47$2 := (if p1$2 then FP64_CONV32(FMUL64(FP32_CONV64(FMUL32(FMUL32(1078530041bv32, FPOW32(1092878336bv32, 1073741824bv32)), 1120403456bv32)), 4382569440205035030bv64)) else v47$2);
    v48$1 := (if p1$1 then FP64_CONV32(FMUL64(4604029899060858061bv64, FP32_CONV64(v47$1))) else v48$1);
    v48$2 := (if p1$2 then FP64_CONV32(FMUL64(4604029899060858061bv64, FP32_CONV64(v47$2))) else v48$2);
    v49$1 := (if p1$1 then FP64_CONV32(FMUL64(4585204852618449388bv64, FP32_CONV64(v47$1))) else v49$1);
    v49$2 := (if p1$2 then FP64_CONV32(FMUL64(4585204852618449388bv64, FP32_CONV64(v47$2))) else v49$2);
    v50$1 := (if p1$1 then FP64_CONV32(FMUL64(4581421828931458171bv64, FP32_CONV64(v47$1))) else v50$1);
    v50$2 := (if p1$2 then FP64_CONV32(FMUL64(4581421828931458171bv64, FP32_CONV64(v47$2))) else v50$2);
    v51$1 := (if p1$1 then FP64_CONV32(FMUL64(4558110620799436181bv64, FP32_CONV64(v47$1))) else v51$1);
    v51$2 := (if p1$2 then FP64_CONV32(FMUL64(4558110620799436181bv64, FP32_CONV64(v47$2))) else v51$2);
    v52$1 := (if p1$1 then FSUB32(1065353216bv32, 1038174126bv32) else v52$1);
    v52$2 := (if p1$2 then FSUB32(1065353216bv32, 1038174126bv32) else v52$2);
    v53$1 := (if p1$1 then FSUB32(1065353216bv32, 1063675494bv32) else v53$1);
    v53$2 := (if p1$2 then FSUB32(1065353216bv32, 1063675494bv32) else v53$2);
    v54$1 := (if p1$1 then FMUL32(FDIV32(1065353216bv32, v45$1), FMUL32(FLOG32(FDIV32(1124859904bv32, v36$1)), 1060205080bv32)) else v54$1);
    v54$2 := (if p1$2 then FMUL32(FDIV32(1065353216bv32, v45$2), FMUL32(FLOG32(FDIV32(1124859904bv32, v36$2)), 1060205080bv32)) else v54$2);
    v55$1 := (if p1$1 then FMUL32(FDIV32(1065353216bv32, v45$1), FMUL32(FLOG32(FDIV32(1124859904bv32, v37$1)), 1060205080bv32)) else v55$1);
    v55$2 := (if p1$2 then FMUL32(FDIV32(1065353216bv32, v45$2), FMUL32(FLOG32(FDIV32(1124859904bv32, v37$2)), 1060205080bv32)) else v55$2);
    v56$1 := (if p1$1 then FMUL32(FDIV32(1065353216bv32, v45$1), FMUL32(FLOG32(FDIV32(1085066445bv32, v39$1)), 1060205080bv32)) else v56$1);
    v56$2 := (if p1$2 then FMUL32(FDIV32(1065353216bv32, v45$2), FMUL32(FLOG32(FDIV32(1085066445bv32, v39$2)), 1060205080bv32)) else v56$2);
    v57$1 := (if p1$1 then FMUL32(FDIV32(1065353216bv32, v45$1), FMUL32(FLOG32(FDIV32(1097859072bv32, 1125515264bv32)), 1060205080bv32)) else v57$1);
    v57$2 := (if p1$2 then FMUL32(FDIV32(1065353216bv32, v45$2), FMUL32(FLOG32(FDIV32(1097859072bv32, 1125515264bv32)), 1060205080bv32)) else v57$2);
    v58$1 := (if p1$1 then FEQ32(v43$1, 3256877056bv32) || FLT32(3256877056bv32, v43$1) else v58$1);
    v58$2 := (if p1$2 then FEQ32(v43$2, 3256877056bv32) || FLT32(3256877056bv32, v43$2) else v58$2);
    p2$1 := (if p1$1 && v58$1 then v58$1 else p2$1);
    p2$2 := (if p1$2 && v58$2 then v58$2 else p2$2);
    p3$1 := (if p1$1 && !v58$1 then !v58$1 else p3$1);
    p3$2 := (if p1$2 && !v58$2 then !v58$2 else p3$2);
    $ah.i.0$1, $bh.i.0$1, $aj.i.0$1, $bj.i.0$1 := (if p2$1 then 0bv32 else $ah.i.0$1), (if p2$1 then FP64_CONV32(FDIV64(4607182418800017408bv64, FMUL64(4593851763903000740bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FSUB64(9223372036854775808bv64, FADD64(FP32_CONV64(v43$1), 4622190664558229586bv64)), 4622438362537734963bv64), 4609176140021203710bv64)))))) else $bh.i.0$1), (if p2$1 then 0bv32 else $aj.i.0$1), (if p2$1 then FP64_CONV32(FDIV64(FMUL64(4599075939470750515bv64, FEXP64(FMUL64(FMUL64(13731760143838901628bv64, FP32_CONV64(v43$1)), 4609176140021203710bv64))), FADD64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13815242216921733530bv64, FP32_CONV64(FADD32(v43$1, 1107296256bv32))), 4609176140021203710bv64))))) else $bj.i.0$1);
    $ah.i.0$2, $bh.i.0$2, $aj.i.0$2, $bj.i.0$2 := (if p2$2 then 0bv32 else $ah.i.0$2), (if p2$2 then FP64_CONV32(FDIV64(4607182418800017408bv64, FMUL64(4593851763903000740bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FSUB64(9223372036854775808bv64, FADD64(FP32_CONV64(v43$2), 4622190664558229586bv64)), 4622438362537734963bv64), 4609176140021203710bv64)))))) else $bh.i.0$2), (if p2$2 then 0bv32 else $aj.i.0$2), (if p2$2 then FP64_CONV32(FDIV64(FMUL64(4599075939470750515bv64, FEXP64(FMUL64(FMUL64(13731760143838901628bv64, FP32_CONV64(v43$2)), 4609176140021203710bv64))), FADD64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13815242216921733530bv64, FP32_CONV64(FADD32(v43$2, 1107296256bv32))), 4609176140021203710bv64))))) else $bj.i.0$2);
    $ah.i.0$1, $bh.i.0$1, $aj.i.0$1, $bj.i.0$1 := (if p3$1 then FP64_CONV32(FMUL64(4594031907888095560bv64, FEXP64(FMUL64(FDIV64(FP32_CONV64(FADD32(1117782016bv32, v43$1)), 13842714174648693555bv64), 4609176140021203710bv64)))) else $ah.i.0$1), (if p3$1 then FP64_CONV32(FADD64(FMUL64(4615198826136736891bv64, FEXP64(FMUL64(FMUL64(4590356970592161235bv64, FP32_CONV64(v43$1)), 4609176140021203710bv64))), FMUL64(4689069371912355840bv64, FEXP64(FMUL64(FMUL64(4599976659396224614bv64, FP32_CONV64(v43$1)), 4609176140021203710bv64))))) else $bh.i.0$1), (if p3$1 then FP64_CONV32(FDIV64(FMUL64(FADD64(FMUL64(13906845444337565696bv64, FEXP64(FMUL64(FMUL64(4597973458281970218bv64, FP32_CONV64(v43$1)), 4609176140021203710bv64))), FSUB64(9223372036854775808bv64, FMUL64(4540251543875054831bv64, FEXP64(FMUL64(FMUL64(13809860955798981071bv64, FP32_CONV64(v43$1)), 4609176140021203710bv64))))), FADD64(FP32_CONV64(v43$1), 4630513879619563684bv64)), FADD64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(4599274097854354817bv64, FADD64(FP32_CONV64(v43$1), 4635275732538066207bv64)), 4609176140021203710bv64))))) else $aj.i.0$1), (if p3$1 then FP64_CONV32(FDIV64(FMUL64(4593397801060561794bv64, FEXP64(FMUL64(FMUL64(13800590025750061263bv64, FP32_CONV64(v43$1)), 4609176140021203710bv64))), FADD64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13817504825374524467bv64, FADD64(FP32_CONV64(v43$1), 4630846020092082258bv64)), 4609176140021203710bv64))))) else $bj.i.0$1);
    $ah.i.0$2, $bh.i.0$2, $aj.i.0$2, $bj.i.0$2 := (if p3$2 then FP64_CONV32(FMUL64(4594031907888095560bv64, FEXP64(FMUL64(FDIV64(FP32_CONV64(FADD32(1117782016bv32, v43$2)), 13842714174648693555bv64), 4609176140021203710bv64)))) else $ah.i.0$2), (if p3$2 then FP64_CONV32(FADD64(FMUL64(4615198826136736891bv64, FEXP64(FMUL64(FMUL64(4590356970592161235bv64, FP32_CONV64(v43$2)), 4609176140021203710bv64))), FMUL64(4689069371912355840bv64, FEXP64(FMUL64(FMUL64(4599976659396224614bv64, FP32_CONV64(v43$2)), 4609176140021203710bv64))))) else $bh.i.0$2), (if p3$2 then FP64_CONV32(FDIV64(FMUL64(FADD64(FMUL64(13906845444337565696bv64, FEXP64(FMUL64(FMUL64(4597973458281970218bv64, FP32_CONV64(v43$2)), 4609176140021203710bv64))), FSUB64(9223372036854775808bv64, FMUL64(4540251543875054831bv64, FEXP64(FMUL64(FMUL64(13809860955798981071bv64, FP32_CONV64(v43$2)), 4609176140021203710bv64))))), FADD64(FP32_CONV64(v43$2), 4630513879619563684bv64)), FADD64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(4599274097854354817bv64, FADD64(FP32_CONV64(v43$2), 4635275732538066207bv64)), 4609176140021203710bv64))))) else $aj.i.0$2), (if p3$2 then FP64_CONV32(FDIV64(FMUL64(4593397801060561794bv64, FEXP64(FMUL64(FMUL64(13800590025750061263bv64, FP32_CONV64(v43$2)), 4609176140021203710bv64))), FADD64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13817504825374524467bv64, FADD64(FP32_CONV64(v43$2), 4630846020092082258bv64)), 4609176140021203710bv64))))) else $bj.i.0$2);
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$d_finavalu(p1$1, 0bv32, FADD32(FMUL32(FP64_CONV32(FDIV64(FMUL64(4599436227440940155bv64, FADD64(FP32_CONV64(v43$1), 4631829775135686001bv64)), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13815242216921733530bv64, FADD64(FP32_CONV64(v43$1), 4631829775135686001bv64)), 4609176140021203710bv64))))), FSUB32(1065353216bv32, v6$1)), FSUB32(2147483648bv32, FMUL32(FP64_CONV32(FMUL64(4590429028186199163bv64, FP32_CONV64(FEXP32(FMUL32(FDIV32(FSUB32(2147483648bv32, v43$1), 1093664768bv32), 1069066811bv32))))), v6$1))), $$d_finavalu[0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$d_finavalu(p1$2, 0bv32, FADD32(FMUL32(FP64_CONV32(FDIV64(FMUL64(4599436227440940155bv64, FADD64(FP32_CONV64(v43$2), 4631829775135686001bv64)), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13815242216921733530bv64, FADD64(FP32_CONV64(v43$2), 4631829775135686001bv64)), 4609176140021203710bv64))))), FSUB32(1065353216bv32, v6$2)), FSUB32(2147483648bv32, FMUL32(FP64_CONV32(FMUL64(4590429028186199163bv64, FP32_CONV64(FEXP32(FMUL32(FDIV32(FSUB32(2147483648bv32, v43$2), 1093664768bv32), 1069066811bv32))))), v6$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[0bv32] := (if p1$1 then FADD32(FMUL32(FP64_CONV32(FDIV64(FMUL64(4599436227440940155bv64, FADD64(FP32_CONV64(v43$1), 4631829775135686001bv64)), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13815242216921733530bv64, FADD64(FP32_CONV64(v43$1), 4631829775135686001bv64)), 4609176140021203710bv64))))), FSUB32(1065353216bv32, v6$1)), FSUB32(2147483648bv32, FMUL32(FP64_CONV32(FMUL64(4590429028186199163bv64, FP32_CONV64(FEXP32(FMUL32(FDIV32(FSUB32(2147483648bv32, v43$1), 1093664768bv32), 1069066811bv32))))), v6$1))) else $$d_finavalu[0bv32]);
    $$d_finavalu[0bv32] := (if p1$2 then FADD32(FMUL32(FP64_CONV32(FDIV64(FMUL64(4599436227440940155bv64, FADD64(FP32_CONV64(v43$2), 4631829775135686001bv64)), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13815242216921733530bv64, FADD64(FP32_CONV64(v43$2), 4631829775135686001bv64)), 4609176140021203710bv64))))), FSUB32(1065353216bv32, v6$2)), FSUB32(2147483648bv32, FMUL32(FP64_CONV32(FMUL64(4590429028186199163bv64, FP32_CONV64(FEXP32(FMUL32(FDIV32(FSUB32(2147483648bv32, v43$2), 1093664768bv32), 1069066811bv32))))), v6$2))) else $$d_finavalu[0bv32]);
    call {:sourceloc} {:sourceloc_num 47} _LOG_WRITE_$$d_finavalu(p1$1, 1bv32, FADD32(FMUL32($ah.i.0$1, FSUB32(1065353216bv32, v7$1)), FSUB32(2147483648bv32, FMUL32($bh.i.0$1, v7$1))), $$d_finavalu[1bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 1bv32);
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 47} _CHECK_WRITE_$$d_finavalu(p1$2, 1bv32, FADD32(FMUL32($ah.i.0$2, FSUB32(1065353216bv32, v7$2)), FSUB32(2147483648bv32, FMUL32($bh.i.0$2, v7$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[1bv32] := (if p1$1 then FADD32(FMUL32($ah.i.0$1, FSUB32(1065353216bv32, v7$1)), FSUB32(2147483648bv32, FMUL32($bh.i.0$1, v7$1))) else $$d_finavalu[1bv32]);
    $$d_finavalu[1bv32] := (if p1$2 then FADD32(FMUL32($ah.i.0$2, FSUB32(1065353216bv32, v7$2)), FSUB32(2147483648bv32, FMUL32($bh.i.0$2, v7$2))) else $$d_finavalu[1bv32]);
    call {:sourceloc} {:sourceloc_num 48} _LOG_WRITE_$$d_finavalu(p1$1, 2bv32, FADD32(FMUL32($aj.i.0$1, FSUB32(1065353216bv32, v8$1)), FSUB32(2147483648bv32, FMUL32($bj.i.0$1, v8$1))), $$d_finavalu[2bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 2bv32);
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 48} _CHECK_WRITE_$$d_finavalu(p1$2, 2bv32, FADD32(FMUL32($aj.i.0$2, FSUB32(1065353216bv32, v8$2)), FSUB32(2147483648bv32, FMUL32($bj.i.0$2, v8$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[2bv32] := (if p1$1 then FADD32(FMUL32($aj.i.0$1, FSUB32(1065353216bv32, v8$1)), FSUB32(2147483648bv32, FMUL32($bj.i.0$1, v8$1))) else $$d_finavalu[2bv32]);
    $$d_finavalu[2bv32] := (if p1$2 then FADD32(FMUL32($aj.i.0$2, FSUB32(1065353216bv32, v8$2)), FSUB32(2147483648bv32, FMUL32($bj.i.0$2, v8$2))) else $$d_finavalu[2bv32]);
    v59$1 := (if p1$1 then FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(FMUL64(FMUL64(4585421025400563171bv64, FP32_CONV64(FP64_CONV32(FDIV64(FSUB64(FEXP64(FMUL64(FDIV64(FP32_CONV64(1124859904bv32), 4634436233420026675bv64), 4609176140021203710bv64)), 4607182418800017408bv64), 4619567317775286272bv64)))), FP32_CONV64(FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v43$1), v45$1), 1069066811bv32)))), FADD64(FMUL64(4593635591120886956bv64, FEXP64(FMUL64(FMUL64(FMUL64(13815242216921733530bv64, FP32_CONV64(v43$1)), FP32_CONV64(v45$1)), 4609176140021203710bv64))), 4607182418800017408bv64)))) else v59$1);
    v59$2 := (if p1$2 then FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(FMUL64(FMUL64(4585421025400563171bv64, FP32_CONV64(FP64_CONV32(FDIV64(FSUB64(FEXP64(FMUL64(FDIV64(FP32_CONV64(1124859904bv32), 4634436233420026675bv64), 4609176140021203710bv64)), 4607182418800017408bv64), 4619567317775286272bv64)))), FP32_CONV64(FEXP32(FMUL32(FMUL32(FSUB32(2147483648bv32, v43$2), v45$2), 1069066811bv32)))), FADD64(FMUL64(4593635591120886956bv64, FEXP64(FMUL64(FMUL64(FMUL64(13815242216921733530bv64, FP32_CONV64(v43$2)), FP32_CONV64(v45$2)), 4609176140021203710bv64))), 4607182418800017408bv64)))) else v59$2);
    v60$1 := (if p1$1 then FDIV32(FDIV32(FMUL32(FMUL32(FMUL32(1038174126bv32, 1072963277bv32), v59$1), 1085066445bv32), FADD32(1065353216bv32, FPOW32(FDIV32(1093664768bv32, v36$1), 1082130432bv32))), FADD32(1085066445bv32, 1069547520bv32)) else v60$1);
    v60$2 := (if p1$2 then FDIV32(FDIV32(FMUL32(FMUL32(FMUL32(1038174126bv32, 1072963277bv32), v59$2), 1085066445bv32), FADD32(1065353216bv32, FPOW32(FDIV32(1093664768bv32, v36$2), 1082130432bv32))), FADD32(1085066445bv32, 1069547520bv32)) else v60$2);
    v61$1 := (if p1$1 then FDIV32(FDIV32(FMUL32(FMUL32(FMUL32(v52$1, 1072963277bv32), v59$1), 1085066445bv32), FADD32(1065353216bv32, FPOW32(FDIV32(1093664768bv32, v37$1), 1082130432bv32))), FADD32(1085066445bv32, 1069547520bv32)) else v61$1);
    v61$2 := (if p1$2 then FDIV32(FDIV32(FMUL32(FMUL32(FMUL32(v52$2, 1072963277bv32), v59$2), 1085066445bv32), FADD32(1065353216bv32, FPOW32(FDIV32(1093664768bv32, v37$2), 1082130432bv32))), FADD32(1085066445bv32, 1069547520bv32)) else v61$2);
    call {:sourceloc} {:sourceloc_num 49} _LOG_WRITE_$$d_finavalu(p1$1, 11bv32, FDIV32(FSUB32(FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FP32_CONV64(FSUB32(2147483648bv32, FADD32(v43$1, 1112014848bv32))), 4620130267728707584bv64), 4609176140021203710bv64))))), v17$1), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(FDIV64(FMUL64(4564006949604371747bv64, FP32_CONV64(FADD32(v43$1, 1088421888bv32))), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13816899541584605872bv64, FP32_CONV64(FADD32(v43$1, 1088421888bv32))), 4609176140021203710bv64)))), FDIV64(FMUL64(4558765480214052869bv64, FP32_CONV64(FADD32(v43$1, 1092616192bv32))), FSUB64(FEXP64(FMUL64(FMUL64(4594392195858285199bv64, FP32_CONV64(FADD32(v43$1, 1092616192bv32))), 4609176140021203710bv64)), 4607182418800017408bv64)))))), $$d_finavalu[11bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 11bv32);
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_51"} {:sourceloc} {:sourceloc_num 49} _CHECK_WRITE_$$d_finavalu(p1$2, 11bv32, FDIV32(FSUB32(FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FP32_CONV64(FSUB32(2147483648bv32, FADD32(v43$2, 1112014848bv32))), 4620130267728707584bv64), 4609176140021203710bv64))))), v17$2), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(FDIV64(FMUL64(4564006949604371747bv64, FP32_CONV64(FADD32(v43$2, 1088421888bv32))), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13816899541584605872bv64, FP32_CONV64(FADD32(v43$2, 1088421888bv32))), 4609176140021203710bv64)))), FDIV64(FMUL64(4558765480214052869bv64, FP32_CONV64(FADD32(v43$2, 1092616192bv32))), FSUB64(FEXP64(FMUL64(FMUL64(4594392195858285199bv64, FP32_CONV64(FADD32(v43$2, 1092616192bv32))), 4609176140021203710bv64)), 4607182418800017408bv64)))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[11bv32] := (if p1$1 then FDIV32(FSUB32(FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FP32_CONV64(FSUB32(2147483648bv32, FADD32(v43$1, 1112014848bv32))), 4620130267728707584bv64), 4609176140021203710bv64))))), v17$1), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(FDIV64(FMUL64(4564006949604371747bv64, FP32_CONV64(FADD32(v43$1, 1088421888bv32))), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13816899541584605872bv64, FP32_CONV64(FADD32(v43$1, 1088421888bv32))), 4609176140021203710bv64)))), FDIV64(FMUL64(4558765480214052869bv64, FP32_CONV64(FADD32(v43$1, 1092616192bv32))), FSUB64(FEXP64(FMUL64(FMUL64(4594392195858285199bv64, FP32_CONV64(FADD32(v43$1, 1092616192bv32))), 4609176140021203710bv64)), 4607182418800017408bv64)))))) else $$d_finavalu[11bv32]);
    $$d_finavalu[11bv32] := (if p1$2 then FDIV32(FSUB32(FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FP32_CONV64(FSUB32(2147483648bv32, FADD32(v43$2, 1112014848bv32))), 4620130267728707584bv64), 4609176140021203710bv64))))), v17$2), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(FDIV64(FMUL64(4564006949604371747bv64, FP32_CONV64(FADD32(v43$2, 1088421888bv32))), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13816899541584605872bv64, FP32_CONV64(FADD32(v43$2, 1088421888bv32))), 4609176140021203710bv64)))), FDIV64(FMUL64(4558765480214052869bv64, FP32_CONV64(FADD32(v43$2, 1092616192bv32))), FSUB64(FEXP64(FMUL64(FMUL64(4594392195858285199bv64, FP32_CONV64(FADD32(v43$2, 1092616192bv32))), 4609176140021203710bv64)), 4607182418800017408bv64)))))) else $$d_finavalu[11bv32]);
    call {:sourceloc_num 50} v62$1, v62$2 := $__log10_float(p1$1, v40$1, p1$2, v40$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    call {:sourceloc_num 51} v63$1, v63$2 := $__log10_float(p1$1, v41$1, p1$2, v41$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__log10_float"} true;
    v64$1 := (if p1$1 then FMUL32(FDIV32(1065353216bv32, v45$1), FMUL32(FLOG32(FDIV32(FADD32(FMUL32(1016473804bv32, 1124859904bv32), 1085066445bv32), FADD32(FMUL32(1016473804bv32, v38$1), v39$1))), 1060205080bv32)) else v64$1);
    v64$2 := (if p1$2 then FMUL32(FDIV32(1065353216bv32, v45$2), FMUL32(FLOG32(FDIV32(FADD32(FMUL32(1016473804bv32, 1124859904bv32), 1085066445bv32), FADD32(FMUL32(1016473804bv32, v38$2), v39$2))), 1060205080bv32)) else v64$2);
    call {:sourceloc} {:sourceloc_num 52} _LOG_WRITE_$$d_finavalu(p1$1, 12bv32, FDIV32(FSUB32(FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FSUB64(9223372036854775808bv64, FSUB64(FP32_CONV64(v43$1), 4609434218613702656bv64)), 4625393849793196851bv64), 4609176140021203710bv64))))), v18$1), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(FDIV64(FMUL64(4544933707985058835bv64, FP32_CONV64(FADD32(v43$1, 1106247680bv32))), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13817872319104117899bv64, FP32_CONV64(FADD32(v43$1, 1106247680bv32))), 4609176140021203710bv64)))), FDIV64(FMUL64(4548965070964142367bv64, FP32_CONV64(FADD32(v43$1, 1106247680bv32))), FSUB64(FEXP64(FMUL64(FMUL64(4589614777373570577bv64, FP32_CONV64(FADD32(v43$1, 1106247680bv32))), 4609176140021203710bv64)), 4607182418800017408bv64)))))), $$d_finavalu[12bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 12bv32);
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_52"} {:sourceloc} {:sourceloc_num 52} _CHECK_WRITE_$$d_finavalu(p1$2, 12bv32, FDIV32(FSUB32(FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FSUB64(9223372036854775808bv64, FSUB64(FP32_CONV64(v43$2), 4609434218613702656bv64)), 4625393849793196851bv64), 4609176140021203710bv64))))), v18$2), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(FDIV64(FMUL64(4544933707985058835bv64, FP32_CONV64(FADD32(v43$2, 1106247680bv32))), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13817872319104117899bv64, FP32_CONV64(FADD32(v43$2, 1106247680bv32))), 4609176140021203710bv64)))), FDIV64(FMUL64(4548965070964142367bv64, FP32_CONV64(FADD32(v43$2, 1106247680bv32))), FSUB64(FEXP64(FMUL64(FMUL64(4589614777373570577bv64, FP32_CONV64(FADD32(v43$2, 1106247680bv32))), 4609176140021203710bv64)), 4607182418800017408bv64)))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[12bv32] := (if p1$1 then FDIV32(FSUB32(FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FSUB64(9223372036854775808bv64, FSUB64(FP32_CONV64(v43$1), 4609434218613702656bv64)), 4625393849793196851bv64), 4609176140021203710bv64))))), v18$1), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(FDIV64(FMUL64(4544933707985058835bv64, FP32_CONV64(FADD32(v43$1, 1106247680bv32))), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13817872319104117899bv64, FP32_CONV64(FADD32(v43$1, 1106247680bv32))), 4609176140021203710bv64)))), FDIV64(FMUL64(4548965070964142367bv64, FP32_CONV64(FADD32(v43$1, 1106247680bv32))), FSUB64(FEXP64(FMUL64(FMUL64(4589614777373570577bv64, FP32_CONV64(FADD32(v43$1, 1106247680bv32))), 4609176140021203710bv64)), 4607182418800017408bv64)))))) else $$d_finavalu[12bv32]);
    $$d_finavalu[12bv32] := (if p1$2 then FDIV32(FSUB32(FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FSUB64(9223372036854775808bv64, FSUB64(FP32_CONV64(v43$2), 4609434218613702656bv64)), 4625393849793196851bv64), 4609176140021203710bv64))))), v18$2), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(FDIV64(FMUL64(4544933707985058835bv64, FP32_CONV64(FADD32(v43$2, 1106247680bv32))), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13817872319104117899bv64, FP32_CONV64(FADD32(v43$2, 1106247680bv32))), 4609176140021203710bv64)))), FDIV64(FMUL64(4548965070964142367bv64, FP32_CONV64(FADD32(v43$2, 1106247680bv32))), FSUB64(FEXP64(FMUL64(FMUL64(4589614777373570577bv64, FP32_CONV64(FADD32(v43$2, 1106247680bv32))), 4609176140021203710bv64)), 4607182418800017408bv64)))))) else $$d_finavalu[12bv32]);
    v65$1 := (if p1$1 then FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FSUB64(4620116756929825473bv64, FDIV64(FP32_CONV64(v43$1), 4618418899870306796bv64)), 4609176140021203710bv64))))) else v65$1);
    v65$2 := (if p1$2 then FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FSUB64(4620116756929825473bv64, FDIV64(FP32_CONV64(v43$2), 4618418899870306796bv64)), 4609176140021203710bv64))))) else v65$2);
    v66$1 := (if p1$1 then FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FSUB64(9223372036854775808bv64, FADD64(FP32_CONV64(v43$1), 4613937818241073152bv64)), 4624633867356078080bv64), 4609176140021203710bv64))))) else v66$1);
    v66$2 := (if p1$2 then FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FSUB64(9223372036854775808bv64, FADD64(FP32_CONV64(v43$2), 4613937818241073152bv64)), 4624633867356078080bv64), 4609176140021203710bv64))))) else v66$2);
    v67$1 := (if p1$1 then FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$1), 4629911523169402880bv64), 4621819117588971520bv64), 4609176140021203710bv64))))) else v67$1);
    v67$2 := (if p1$2 then FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$2), 4629911523169402880bv64), 4621819117588971520bv64), 4609176140021203710bv64))))) else v67$2);
    call {:sourceloc} {:sourceloc_num 53} _LOG_WRITE_$$d_finavalu(p1$1, 7bv32, FDIV32(FSUB32(v66$1, v13$1), FP64_CONV32(FADD64(FDIV64(4621256167635550208bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$1), 4613937818241073152bv64), 4624633867356078080bv64), 4609176140021203710bv64)))), 4602678819172646912bv64))), $$d_finavalu[7bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 7bv32);
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_53"} {:sourceloc} {:sourceloc_num 53} _CHECK_WRITE_$$d_finavalu(p1$2, 7bv32, FDIV32(FSUB32(v66$2, v13$2), FP64_CONV32(FADD64(FDIV64(4621256167635550208bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$2), 4613937818241073152bv64), 4624633867356078080bv64), 4609176140021203710bv64)))), 4602678819172646912bv64))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[7bv32] := (if p1$1 then FDIV32(FSUB32(v66$1, v13$1), FP64_CONV32(FADD64(FDIV64(4621256167635550208bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$1), 4613937818241073152bv64), 4624633867356078080bv64), 4609176140021203710bv64)))), 4602678819172646912bv64))) else $$d_finavalu[7bv32]);
    $$d_finavalu[7bv32] := (if p1$2 then FDIV32(FSUB32(v66$2, v13$2), FP64_CONV32(FADD64(FDIV64(4621256167635550208bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$2), 4613937818241073152bv64), 4624633867356078080bv64), 4609176140021203710bv64)))), 4602678819172646912bv64))) else $$d_finavalu[7bv32]);
    call {:sourceloc} {:sourceloc_num 54} _LOG_WRITE_$$d_finavalu(p1$1, 8bv32, FDIV32(FSUB32(v67$1, v14$1), FP64_CONV32(FADD64(FDIV64(4658815484840378368bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$1), 4633641066610819072bv64), 4621819117588971520bv64), 4609176140021203710bv64)))), 4629137466983448576bv64))), $$d_finavalu[8bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 8bv32);
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_54"} {:sourceloc} {:sourceloc_num 54} _CHECK_WRITE_$$d_finavalu(p1$2, 8bv32, FDIV32(FSUB32(v67$2, v14$2), FP64_CONV32(FADD64(FDIV64(4658815484840378368bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$2), 4633641066610819072bv64), 4621819117588971520bv64), 4609176140021203710bv64)))), 4629137466983448576bv64))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[8bv32] := (if p1$1 then FDIV32(FSUB32(v67$1, v14$1), FP64_CONV32(FADD64(FDIV64(4658815484840378368bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$1), 4633641066610819072bv64), 4621819117588971520bv64), 4609176140021203710bv64)))), 4629137466983448576bv64))) else $$d_finavalu[8bv32]);
    $$d_finavalu[8bv32] := (if p1$2 then FDIV32(FSUB32(v67$2, v14$2), FP64_CONV32(FADD64(FDIV64(4658815484840378368bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$2), 4633641066610819072bv64), 4621819117588971520bv64), 4609176140021203710bv64)))), 4629137466983448576bv64))) else $$d_finavalu[8bv32]);
    call {:sourceloc} {:sourceloc_num 55} _LOG_WRITE_$$d_finavalu(p1$1, 39bv32, FDIV32(FSUB32(FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$1), 4629911523169402880bv64), 4621819117588971520bv64), 4609176140021203710bv64))))), v44$1), FP64_CONV32(FADD64(FDIV64(4658375680189267968bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$1), 4633641066610819072bv64), 4621819117588971520bv64), 4609176140021203710bv64)))), 4641944578423783424bv64))), $$d_finavalu[39bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 39bv32);
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_55"} {:sourceloc} {:sourceloc_num 55} _CHECK_WRITE_$$d_finavalu(p1$2, 39bv32, FDIV32(FSUB32(FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$2), 4629911523169402880bv64), 4621819117588971520bv64), 4609176140021203710bv64))))), v44$2), FP64_CONV32(FADD64(FDIV64(4658375680189267968bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$2), 4633641066610819072bv64), 4621819117588971520bv64), 4609176140021203710bv64)))), 4641944578423783424bv64))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[39bv32] := (if p1$1 then FDIV32(FSUB32(FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$1), 4629911523169402880bv64), 4621819117588971520bv64), 4609176140021203710bv64))))), v44$1), FP64_CONV32(FADD64(FDIV64(4658375680189267968bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$1), 4633641066610819072bv64), 4621819117588971520bv64), 4609176140021203710bv64)))), 4641944578423783424bv64))) else $$d_finavalu[39bv32]);
    $$d_finavalu[39bv32] := (if p1$2 then FDIV32(FSUB32(FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$2), 4629911523169402880bv64), 4621819117588971520bv64), 4609176140021203710bv64))))), v44$2), FP64_CONV32(FADD64(FDIV64(4658375680189267968bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$2), 4633641066610819072bv64), 4621819117588971520bv64), 4609176140021203710bv64)))), 4641944578423783424bv64))) else $$d_finavalu[39bv32]);
    call {:sourceloc} {:sourceloc_num 56} _LOG_WRITE_$$d_finavalu(p1$1, 9bv32, FDIV32(FSUB32(v66$1, v15$1), FP64_CONV32(FADD64(FMUL64(4615063718147915776bv64, FP32_CONV64(FEXP32(FMUL32(FDIV32(FDIV32(FMUL32(FSUB32(2147483648bv32, v43$1), v43$1), 1106247680bv32), 1106247680bv32), 1069066811bv32)))), 4609434218613702656bv64))), $$d_finavalu[9bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 9bv32);
    assume {:do_not_predicate} {:check_id "check_state_56"} {:captureState "check_state_56"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_56"} {:sourceloc} {:sourceloc_num 56} _CHECK_WRITE_$$d_finavalu(p1$2, 9bv32, FDIV32(FSUB32(v66$2, v15$2), FP64_CONV32(FADD64(FMUL64(4615063718147915776bv64, FP32_CONV64(FEXP32(FMUL32(FDIV32(FDIV32(FMUL32(FSUB32(2147483648bv32, v43$2), v43$2), 1106247680bv32), 1106247680bv32), 1069066811bv32)))), 4609434218613702656bv64))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[9bv32] := (if p1$1 then FDIV32(FSUB32(v66$1, v15$1), FP64_CONV32(FADD64(FMUL64(4615063718147915776bv64, FP32_CONV64(FEXP32(FMUL32(FDIV32(FDIV32(FMUL32(FSUB32(2147483648bv32, v43$1), v43$1), 1106247680bv32), 1106247680bv32), 1069066811bv32)))), 4609434218613702656bv64))) else $$d_finavalu[9bv32]);
    $$d_finavalu[9bv32] := (if p1$2 then FDIV32(FSUB32(v66$2, v15$2), FP64_CONV32(FADD64(FMUL64(4615063718147915776bv64, FP32_CONV64(FEXP32(FMUL32(FDIV32(FDIV32(FMUL32(FSUB32(2147483648bv32, v43$2), v43$2), 1106247680bv32), 1106247680bv32), 1069066811bv32)))), 4609434218613702656bv64))) else $$d_finavalu[9bv32]);
    call {:sourceloc} {:sourceloc_num 57} _LOG_WRITE_$$d_finavalu(p1$1, 10bv32, FDIV32(FSUB32(v67$1, v16$1), FP64_CONV32(FADD64(FDIV64(4626322717216342016bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$1), 4629911523169402880bv64), 4621819117588971520bv64), 4609176140021203710bv64)))), 4626322717216342016bv64))), $$d_finavalu[10bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 10bv32);
    assume {:do_not_predicate} {:check_id "check_state_57"} {:captureState "check_state_57"} {:sourceloc} {:sourceloc_num 57} true;
    call {:check_id "check_state_57"} {:sourceloc} {:sourceloc_num 57} _CHECK_WRITE_$$d_finavalu(p1$2, 10bv32, FDIV32(FSUB32(v67$2, v16$2), FP64_CONV32(FADD64(FDIV64(4626322717216342016bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$2), 4629911523169402880bv64), 4621819117588971520bv64), 4609176140021203710bv64)))), 4626322717216342016bv64))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[10bv32] := (if p1$1 then FDIV32(FSUB32(v67$1, v16$1), FP64_CONV32(FADD64(FDIV64(4626322717216342016bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$1), 4629911523169402880bv64), 4621819117588971520bv64), 4609176140021203710bv64)))), 4626322717216342016bv64))) else $$d_finavalu[10bv32]);
    $$d_finavalu[10bv32] := (if p1$2 then FDIV32(FSUB32(v67$2, v16$2), FP64_CONV32(FADD64(FDIV64(4626322717216342016bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$2), 4629911523169402880bv64), 4621819117588971520bv64), 4609176140021203710bv64)))), 4626322717216342016bv64))) else $$d_finavalu[10bv32]);
    v68$1 := (if p1$1 then FP64_CONV32(FDIV64(4607272490792564818bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(4597760888379558330bv64, FSUB64(FP32_CONV64(FSUB32(v43$1, v56$1)), 4633530587682460140bv64)), 4609176140021203710bv64))))) else v68$1);
    v68$2 := (if p1$2 then FP64_CONV32(FDIV64(4607272490792564818bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(4597760888379558330bv64, FSUB64(FP32_CONV64(FSUB32(v43$2, v56$2)), 4633530587682460140bv64)), 4609176140021203710bv64))))) else v68$2);
    v69$1 := (if p1$1 then FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FSUB64(9223372036854775808bv64, FADD64(FP32_CONV64(v43$1), 4624352392379367424bv64)), 4618441417868443648bv64), 4609176140021203710bv64))))) else v69$1);
    v69$2 := (if p1$2 then FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FSUB64(9223372036854775808bv64, FADD64(FP32_CONV64(v43$2), 4624352392379367424bv64)), 4618441417868443648bv64), 4609176140021203710bv64))))) else v69$2);
    call {:sourceloc} {:sourceloc_num 58} _LOG_WRITE_$$d_finavalu(p1$1, 3bv32, FDIV32(FSUB32(v69$1, v9$1), FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(v69$1), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FSUB64(9223372036854775808bv64, FADD64(FP32_CONV64(v43$1), 4624352392379367424bv64)), 4618441417868443648bv64), 4609176140021203710bv64)))), FMUL64(4585204852618449388bv64, FADD64(FP32_CONV64(v43$1), 4624352392379367424bv64))))), $$d_finavalu[3bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 3bv32);
    assume {:do_not_predicate} {:check_id "check_state_58"} {:captureState "check_state_58"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_58"} {:sourceloc} {:sourceloc_num 58} _CHECK_WRITE_$$d_finavalu(p1$2, 3bv32, FDIV32(FSUB32(v69$2, v9$2), FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(v69$2), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FSUB64(9223372036854775808bv64, FADD64(FP32_CONV64(v43$2), 4624352392379367424bv64)), 4618441417868443648bv64), 4609176140021203710bv64)))), FMUL64(4585204852618449388bv64, FADD64(FP32_CONV64(v43$2), 4624352392379367424bv64))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[3bv32] := (if p1$1 then FDIV32(FSUB32(v69$1, v9$1), FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(v69$1), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FSUB64(9223372036854775808bv64, FADD64(FP32_CONV64(v43$1), 4624352392379367424bv64)), 4618441417868443648bv64), 4609176140021203710bv64)))), FMUL64(4585204852618449388bv64, FADD64(FP32_CONV64(v43$1), 4624352392379367424bv64))))) else $$d_finavalu[3bv32]);
    $$d_finavalu[3bv32] := (if p1$2 then FDIV32(FSUB32(v69$2, v9$2), FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(v69$2), FSUB64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FSUB64(9223372036854775808bv64, FADD64(FP32_CONV64(v43$2), 4624352392379367424bv64)), 4618441417868443648bv64), 4609176140021203710bv64)))), FMUL64(4585204852618449388bv64, FADD64(FP32_CONV64(v43$2), 4624352392379367424bv64))))) else $$d_finavalu[3bv32]);
    call {:sourceloc} {:sourceloc_num 59} _LOG_WRITE_$$d_finavalu(p1$1, 4bv32, FDIV32(FSUB32(FP64_CONV32(FADD64(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$1), 4630131073651237192bv64), 4615288898129284301bv64), 4609176140021203710bv64)))), FDIV64(4603579539098121011bv64, FP32_CONV64(FADD32(1065353216bv32, FEXP32(FMUL32(FDIV32(FSUB32(1112014848bv32, v43$1), 1101004800bv32), 1069066811bv32))))))), v10$1), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(FMUL64(4581335359818612657bv64, FEXP64(FMUL64(FSUB64(9223372036854775808bv64, FPOW64(FMUL64(4585017502873950775bv64, FADD64(FP32_CONV64(v43$1), 4624352392379367424bv64)), 4611686018427387904bv64)), 4609176140021203710bv64))), 4581421828931458171bv64)))), $$d_finavalu[4bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 4bv32);
    assume {:do_not_predicate} {:check_id "check_state_59"} {:captureState "check_state_59"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_59"} {:sourceloc} {:sourceloc_num 59} _CHECK_WRITE_$$d_finavalu(p1$2, 4bv32, FDIV32(FSUB32(FP64_CONV32(FADD64(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$2), 4630131073651237192bv64), 4615288898129284301bv64), 4609176140021203710bv64)))), FDIV64(4603579539098121011bv64, FP32_CONV64(FADD32(1065353216bv32, FEXP32(FMUL32(FDIV32(FSUB32(1112014848bv32, v43$2), 1101004800bv32), 1069066811bv32))))))), v10$2), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(FMUL64(4581335359818612657bv64, FEXP64(FMUL64(FSUB64(9223372036854775808bv64, FPOW64(FMUL64(4585017502873950775bv64, FADD64(FP32_CONV64(v43$2), 4624352392379367424bv64)), 4611686018427387904bv64)), 4609176140021203710bv64))), 4581421828931458171bv64)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[4bv32] := (if p1$1 then FDIV32(FSUB32(FP64_CONV32(FADD64(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$1), 4630131073651237192bv64), 4615288898129284301bv64), 4609176140021203710bv64)))), FDIV64(4603579539098121011bv64, FP32_CONV64(FADD32(1065353216bv32, FEXP32(FMUL32(FDIV32(FSUB32(1112014848bv32, v43$1), 1101004800bv32), 1069066811bv32))))))), v10$1), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(FMUL64(4581335359818612657bv64, FEXP64(FMUL64(FSUB64(9223372036854775808bv64, FPOW64(FMUL64(4585017502873950775bv64, FADD64(FP32_CONV64(v43$1), 4624352392379367424bv64)), 4611686018427387904bv64)), 4609176140021203710bv64))), 4581421828931458171bv64)))) else $$d_finavalu[4bv32]);
    $$d_finavalu[4bv32] := (if p1$2 then FDIV32(FSUB32(FP64_CONV32(FADD64(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(FP32_CONV64(v43$2), 4630131073651237192bv64), 4615288898129284301bv64), 4609176140021203710bv64)))), FDIV64(4603579539098121011bv64, FP32_CONV64(FADD32(1065353216bv32, FEXP32(FMUL32(FDIV32(FSUB32(1112014848bv32, v43$2), 1101004800bv32), 1069066811bv32))))))), v10$2), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(FMUL64(4581335359818612657bv64, FEXP64(FMUL64(FSUB64(9223372036854775808bv64, FPOW64(FMUL64(4585017502873950775bv64, FADD64(FP32_CONV64(v43$2), 4624352392379367424bv64)), 4611686018427387904bv64)), 4609176140021203710bv64))), 4581421828931458171bv64)))) else $$d_finavalu[4bv32]);
    call {:sourceloc} {:sourceloc_num 60} _LOG_WRITE_$$d_finavalu(p1$1, 5bv32, FP64_CONV32(FADD64(FMUL64(FMUL64(4610334938539176755bv64, FP32_CONV64(v40$1)), FP32_CONV64(FSUB32(1065353216bv32, v11$1))), FSUB64(9223372036854775808bv64, FMUL64(4578013504733464180bv64, FP32_CONV64(v11$1))))), $$d_finavalu[5bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 5bv32);
    assume {:do_not_predicate} {:check_id "check_state_60"} {:captureState "check_state_60"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_60"} {:sourceloc} {:sourceloc_num 60} _CHECK_WRITE_$$d_finavalu(p1$2, 5bv32, FP64_CONV32(FADD64(FMUL64(FMUL64(4610334938539176755bv64, FP32_CONV64(v40$2)), FP32_CONV64(FSUB32(1065353216bv32, v11$2))), FSUB64(9223372036854775808bv64, FMUL64(4578013504733464180bv64, FP32_CONV64(v11$2))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[5bv32] := (if p1$1 then FP64_CONV32(FADD64(FMUL64(FMUL64(4610334938539176755bv64, FP32_CONV64(v40$1)), FP32_CONV64(FSUB32(1065353216bv32, v11$1))), FSUB64(9223372036854775808bv64, FMUL64(4578013504733464180bv64, FP32_CONV64(v11$1))))) else $$d_finavalu[5bv32]);
    $$d_finavalu[5bv32] := (if p1$2 then FP64_CONV32(FADD64(FMUL64(FMUL64(4610334938539176755bv64, FP32_CONV64(v40$2)), FP32_CONV64(FSUB32(1065353216bv32, v11$2))), FSUB64(9223372036854775808bv64, FMUL64(4578013504733464180bv64, FP32_CONV64(v11$2))))) else $$d_finavalu[5bv32]);
    call {:sourceloc} {:sourceloc_num 61} _LOG_WRITE_$$d_finavalu(p1$1, 6bv32, FP64_CONV32(FADD64(FMUL64(FMUL64(4610334938539176755bv64, FP32_CONV64(v41$1)), FP32_CONV64(FSUB32(1065353216bv32, v12$1))), FSUB64(9223372036854775808bv64, FMUL64(4578013504733464180bv64, FP32_CONV64(v12$1))))), $$d_finavalu[6bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 6bv32);
    assume {:do_not_predicate} {:check_id "check_state_61"} {:captureState "check_state_61"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_61"} {:sourceloc} {:sourceloc_num 61} _CHECK_WRITE_$$d_finavalu(p1$2, 6bv32, FP64_CONV32(FADD64(FMUL64(FMUL64(4610334938539176755bv64, FP32_CONV64(v41$2)), FP32_CONV64(FSUB32(1065353216bv32, v12$2))), FSUB64(9223372036854775808bv64, FMUL64(4578013504733464180bv64, FP32_CONV64(v12$2))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[6bv32] := (if p1$1 then FP64_CONV32(FADD64(FMUL64(FMUL64(4610334938539176755bv64, FP32_CONV64(v41$1)), FP32_CONV64(FSUB32(1065353216bv32, v12$1))), FSUB64(9223372036854775808bv64, FMUL64(4578013504733464180bv64, FP32_CONV64(v12$1))))) else $$d_finavalu[6bv32]);
    $$d_finavalu[6bv32] := (if p1$2 then FP64_CONV32(FADD64(FMUL64(FMUL64(4610334938539176755bv64, FP32_CONV64(v41$2)), FP32_CONV64(FSUB32(1065353216bv32, v12$2))), FSUB64(9223372036854775808bv64, FMUL64(4578013504733464180bv64, FP32_CONV64(v12$2))))) else $$d_finavalu[6bv32]);
    v70$1 := (if p1$1 then FP64_CONV32(FMUL64(FP32_CONV64(FMUL32(FMUL32(FMUL32(FMUL32(FMUL32(1063675494bv32, FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(FMUL32(FMUL32(973967049bv32, 1082130432bv32), FMUL32(FMUL32(v43$1, 1203532416bv32), v45$1))), FADD64(FMUL64(FMUL64(4599814529809639277bv64, FP32_CONV64(v40$1)), FP32_CONV64(FEXP32(FMUL32(FMUL32(FMUL32(1073741824bv32, v43$1), v45$1), 1069066811bv32)))), FSUB64(9223372036854775808bv64, FMUL64(4599814529809639277bv64, FP32_CONV64(1072064102bv32))))), FP32_CONV64(FSUB32(FEXP32(FMUL32(FMUL32(FMUL32(1073741824bv32, v43$1), v45$1), 1069066811bv32)), 1065353216bv32))))), v9$1), v10$1), FSUB32(1065353216bv32, v11$1)), FPOW32(1072064102bv32, v46$1))), 4601778099247172813bv64)) else v70$1);
    v70$2 := (if p1$2 then FP64_CONV32(FMUL64(FP32_CONV64(FMUL32(FMUL32(FMUL32(FMUL32(FMUL32(1063675494bv32, FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(FMUL32(FMUL32(973967049bv32, 1082130432bv32), FMUL32(FMUL32(v43$2, 1203532416bv32), v45$2))), FADD64(FMUL64(FMUL64(4599814529809639277bv64, FP32_CONV64(v40$2)), FP32_CONV64(FEXP32(FMUL32(FMUL32(FMUL32(1073741824bv32, v43$2), v45$2), 1069066811bv32)))), FSUB64(9223372036854775808bv64, FMUL64(4599814529809639277bv64, FP32_CONV64(1072064102bv32))))), FP32_CONV64(FSUB32(FEXP32(FMUL32(FMUL32(FMUL32(1073741824bv32, v43$2), v45$2), 1069066811bv32)), 1065353216bv32))))), v9$2), v10$2), FSUB32(1065353216bv32, v11$2)), FPOW32(1072064102bv32, v46$2))), 4601778099247172813bv64)) else v70$2);
    v71$1 := (if p1$1 then FP64_CONV32(FMUL64(FP32_CONV64(FMUL32(FMUL32(FMUL32(FMUL32(FMUL32(v53$1, FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(FMUL32(FMUL32(973967049bv32, 1082130432bv32), FMUL32(FMUL32(v43$1, 1203532416bv32), v45$1))), FADD64(FMUL64(FMUL64(4599814529809639277bv64, FP32_CONV64(v41$1)), FP32_CONV64(FEXP32(FMUL32(FMUL32(FMUL32(1073741824bv32, v43$1), v45$1), 1069066811bv32)))), FSUB64(9223372036854775808bv64, FMUL64(4599814529809639277bv64, FP32_CONV64(1072064102bv32))))), FP32_CONV64(FSUB32(FEXP32(FMUL32(FMUL32(FMUL32(1073741824bv32, v43$1), v45$1), 1069066811bv32)), 1065353216bv32))))), v9$1), v10$1), FSUB32(1065353216bv32, v12$1)), FPOW32(1072064102bv32, v46$1))), 4601778099247172813bv64)) else v71$1);
    v71$2 := (if p1$2 then FP64_CONV32(FMUL64(FP32_CONV64(FMUL32(FMUL32(FMUL32(FMUL32(FMUL32(v53$2, FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(FMUL32(FMUL32(973967049bv32, 1082130432bv32), FMUL32(FMUL32(v43$2, 1203532416bv32), v45$2))), FADD64(FMUL64(FMUL64(4599814529809639277bv64, FP32_CONV64(v41$2)), FP32_CONV64(FEXP32(FMUL32(FMUL32(FMUL32(1073741824bv32, v43$2), v45$2), 1069066811bv32)))), FSUB64(9223372036854775808bv64, FMUL64(4599814529809639277bv64, FP32_CONV64(1072064102bv32))))), FP32_CONV64(FSUB32(FEXP32(FMUL32(FMUL32(FMUL32(1073741824bv32, v43$2), v45$2), 1069066811bv32)), 1065353216bv32))))), v9$2), v10$2), FSUB32(1065353216bv32, v12$2)), FPOW32(1072064102bv32, v46$2))), 4601778099247172813bv64)) else v71$2);
    call {:sourceloc} {:sourceloc_num 62} _LOG_WRITE_$$d_finavalu(p1$1, 42bv32, FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FSUB32(2147483648bv32, FADD32(v70$1, v71$1)), 790091698bv32), FMUL32(FMUL32(v48$1, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)), $$d_finavalu[42bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 42bv32);
    assume {:do_not_predicate} {:check_id "check_state_62"} {:captureState "check_state_62"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_62"} {:sourceloc} {:sourceloc_num 62} _CHECK_WRITE_$$d_finavalu(p1$2, 42bv32, FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FSUB32(2147483648bv32, FADD32(v70$2, v71$2)), 790091698bv32), FMUL32(FMUL32(v48$2, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[42bv32] := (if p1$1 then FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FSUB32(2147483648bv32, FADD32(v70$1, v71$1)), 790091698bv32), FMUL32(FMUL32(v48$1, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)) else $$d_finavalu[42bv32]);
    $$d_finavalu[42bv32] := (if p1$2 then FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FSUB32(2147483648bv32, FADD32(v70$2, v71$2)), 790091698bv32), FMUL32(FMUL32(v48$2, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)) else $$d_finavalu[42bv32]);
    v72$1 := (if p1$1 then FDIV32(FMUL32(FMUL32(FMUL32(FMUL32(1038174126bv32, 1091567616bv32), FPOW32(1070134723bv32, v46$1)), FDIV32(1065353216bv32, FADD32(1065353216bv32, FPOW32(FDIV32(965097405bv32, v40$1), 1077936128bv32)))), FSUB32(FMUL32(FMUL32(FEXP32(FMUL32(FMUL32(FMUL32(1051931443bv32, v43$1), v45$1), 1069066811bv32)), FPOW32(v36$1, 1077936128bv32)), 1072064102bv32), FMUL32(FMUL32(FEXP32(FMUL32(FMUL32(FMUL32(FSUB32(1051931443bv32, 1065353216bv32), v43$1), v45$1), 1069066811bv32)), FPOW32(1124859904bv32, 1077936128bv32)), v40$1))), FMUL32(FADD32(FMUL32(FPOW32(1124859904bv32, 1077936128bv32), v40$1), FADD32(FMUL32(FPOW32(v36$1, 1077936128bv32), 1072064102bv32), FADD32(FMUL32(1067869798bv32, FPOW32(v36$1, 1077936128bv32)), FADD32(FMUL32(FMUL32(FPOW32(1095017431bv32, 1077936128bv32), 1072064102bv32), FADD32(1065353216bv32, FDIV32(v40$1, 996886069bv32))), FADD32(FMUL32(FMUL32(996886069bv32, FPOW32(1124859904bv32, 1077936128bv32)), FADD32(1065353216bv32, FPOW32(FDIV32(v36$1, 1095017431bv32), 1077936128bv32))), FMUL32(FPOW32(1118765056bv32, 1077936128bv32), v40$1)))))), FADD32(FMUL32(1049247089bv32, FEXP32(FMUL32(FMUL32(FMUL32(FSUB32(1051931443bv32, 1065353216bv32), v43$1), v45$1), 1069066811bv32))), 1065353216bv32))) else v72$1);
    v72$2 := (if p1$2 then FDIV32(FMUL32(FMUL32(FMUL32(FMUL32(1038174126bv32, 1091567616bv32), FPOW32(1070134723bv32, v46$2)), FDIV32(1065353216bv32, FADD32(1065353216bv32, FPOW32(FDIV32(965097405bv32, v40$2), 1077936128bv32)))), FSUB32(FMUL32(FMUL32(FEXP32(FMUL32(FMUL32(FMUL32(1051931443bv32, v43$2), v45$2), 1069066811bv32)), FPOW32(v36$2, 1077936128bv32)), 1072064102bv32), FMUL32(FMUL32(FEXP32(FMUL32(FMUL32(FMUL32(FSUB32(1051931443bv32, 1065353216bv32), v43$2), v45$2), 1069066811bv32)), FPOW32(1124859904bv32, 1077936128bv32)), v40$2))), FMUL32(FADD32(FMUL32(FPOW32(1124859904bv32, 1077936128bv32), v40$2), FADD32(FMUL32(FPOW32(v36$2, 1077936128bv32), 1072064102bv32), FADD32(FMUL32(1067869798bv32, FPOW32(v36$2, 1077936128bv32)), FADD32(FMUL32(FMUL32(FPOW32(1095017431bv32, 1077936128bv32), 1072064102bv32), FADD32(1065353216bv32, FDIV32(v40$2, 996886069bv32))), FADD32(FMUL32(FMUL32(996886069bv32, FPOW32(1124859904bv32, 1077936128bv32)), FADD32(1065353216bv32, FPOW32(FDIV32(v36$2, 1095017431bv32), 1077936128bv32))), FMUL32(FPOW32(1118765056bv32, 1077936128bv32), v40$2)))))), FADD32(FMUL32(1049247089bv32, FEXP32(FMUL32(FMUL32(FMUL32(FSUB32(1051931443bv32, 1065353216bv32), v43$2), v45$2), 1069066811bv32))), 1065353216bv32))) else v72$2);
    v73$1 := (if p1$1 then FDIV32(FMUL32(FMUL32(FMUL32(FMUL32(v52$1, 1091567616bv32), FPOW32(1070134723bv32, v46$1)), FDIV32(1065353216bv32, FADD32(1065353216bv32, FPOW32(FDIV32(965097405bv32, v41$1), 1077936128bv32)))), FSUB32(FMUL32(FMUL32(FEXP32(FMUL32(FMUL32(FMUL32(1051931443bv32, v43$1), v45$1), 1069066811bv32)), FPOW32(v37$1, 1077936128bv32)), 1072064102bv32), FMUL32(FMUL32(FEXP32(FMUL32(FMUL32(FMUL32(FSUB32(1051931443bv32, 1065353216bv32), v43$1), v45$1), 1069066811bv32)), FPOW32(1124859904bv32, 1077936128bv32)), v41$1))), FMUL32(FADD32(FMUL32(FPOW32(1124859904bv32, 1077936128bv32), v41$1), FADD32(FMUL32(FPOW32(v37$1, 1077936128bv32), 1072064102bv32), FADD32(FMUL32(1067869798bv32, FPOW32(v37$1, 1077936128bv32)), FADD32(FMUL32(FMUL32(FPOW32(1095017431bv32, 1077936128bv32), 1072064102bv32), FADD32(1065353216bv32, FDIV32(v41$1, 996886069bv32))), FADD32(FMUL32(FMUL32(996886069bv32, FPOW32(1124859904bv32, 1077936128bv32)), FADD32(1065353216bv32, FPOW32(FDIV32(v37$1, 1095017431bv32), 1077936128bv32))), FMUL32(FPOW32(1118765056bv32, 1077936128bv32), v41$1)))))), FADD32(FMUL32(1049247089bv32, FEXP32(FMUL32(FMUL32(FMUL32(FSUB32(1051931443bv32, 1065353216bv32), v43$1), v45$1), 1069066811bv32))), 1065353216bv32))) else v73$1);
    v73$2 := (if p1$2 then FDIV32(FMUL32(FMUL32(FMUL32(FMUL32(v52$2, 1091567616bv32), FPOW32(1070134723bv32, v46$2)), FDIV32(1065353216bv32, FADD32(1065353216bv32, FPOW32(FDIV32(965097405bv32, v41$2), 1077936128bv32)))), FSUB32(FMUL32(FMUL32(FEXP32(FMUL32(FMUL32(FMUL32(1051931443bv32, v43$2), v45$2), 1069066811bv32)), FPOW32(v37$2, 1077936128bv32)), 1072064102bv32), FMUL32(FMUL32(FEXP32(FMUL32(FMUL32(FMUL32(FSUB32(1051931443bv32, 1065353216bv32), v43$2), v45$2), 1069066811bv32)), FPOW32(1124859904bv32, 1077936128bv32)), v41$2))), FMUL32(FADD32(FMUL32(FPOW32(1124859904bv32, 1077936128bv32), v41$2), FADD32(FMUL32(FPOW32(v37$2, 1077936128bv32), 1072064102bv32), FADD32(FMUL32(1067869798bv32, FPOW32(v37$2, 1077936128bv32)), FADD32(FMUL32(FMUL32(FPOW32(1095017431bv32, 1077936128bv32), 1072064102bv32), FADD32(1065353216bv32, FDIV32(v41$2, 996886069bv32))), FADD32(FMUL32(FMUL32(996886069bv32, FPOW32(1124859904bv32, 1077936128bv32)), FADD32(1065353216bv32, FPOW32(FDIV32(v37$2, 1095017431bv32), 1077936128bv32))), FMUL32(FPOW32(1118765056bv32, 1077936128bv32), v41$2)))))), FADD32(FMUL32(1049247089bv32, FEXP32(FMUL32(FMUL32(FMUL32(FSUB32(1051931443bv32, 1065353216bv32), v43$2), v45$2), 1069066811bv32))), 1065353216bv32))) else v73$2);
    call {:sourceloc} {:sourceloc_num 63} _LOG_WRITE_$$d_finavalu(p1$1, 44bv32, FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FMUL32(1073741824bv32, FADD32(v72$1, v73$1)), 790091698bv32), FMUL32(FMUL32(v48$1, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)), $$d_finavalu[44bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 44bv32);
    assume {:do_not_predicate} {:check_id "check_state_63"} {:captureState "check_state_63"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_63"} {:sourceloc} {:sourceloc_num 63} _CHECK_WRITE_$$d_finavalu(p1$2, 44bv32, FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FMUL32(1073741824bv32, FADD32(v72$2, v73$2)), 790091698bv32), FMUL32(FMUL32(v48$2, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[44bv32] := (if p1$1 then FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FMUL32(1073741824bv32, FADD32(v72$1, v73$1)), 790091698bv32), FMUL32(FMUL32(v48$1, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)) else $$d_finavalu[44bv32]);
    $$d_finavalu[44bv32] := (if p1$2 then FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FMUL32(1073741824bv32, FADD32(v72$2, v73$2)), 790091698bv32), FMUL32(FMUL32(v48$2, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)) else $$d_finavalu[44bv32]);
    v74$1 := (if p1$1 then FDIV32(FMUL32(FMUL32(FMUL32(1038174126bv32, FPOW32(1075209830bv32, v46$1)), 1032443029bv32), FPOW32(v40$1, 1070386381bv32)), FADD32(FPOW32(973279855bv32, 1070386381bv32), FPOW32(v40$1, 1070386381bv32))) else v74$1);
    v74$2 := (if p1$2 then FDIV32(FMUL32(FMUL32(FMUL32(1038174126bv32, FPOW32(1075209830bv32, v46$2)), 1032443029bv32), FPOW32(v40$2, 1070386381bv32)), FADD32(FPOW32(973279855bv32, 1070386381bv32), FPOW32(v40$2, 1070386381bv32))) else v74$2);
    v75$1 := (if p1$1 then FDIV32(FMUL32(FMUL32(FMUL32(v52$1, FPOW32(1075209830bv32, v46$1)), 1032443029bv32), FPOW32(v41$1, 1070386381bv32)), FADD32(FPOW32(973279855bv32, 1070386381bv32), FPOW32(v41$1, 1070386381bv32))) else v75$1);
    v75$2 := (if p1$2 then FDIV32(FMUL32(FMUL32(FMUL32(v52$2, FPOW32(1075209830bv32, v46$2)), 1032443029bv32), FPOW32(v41$2, 1070386381bv32)), FADD32(FPOW32(973279855bv32, 1070386381bv32), FPOW32(v41$2, 1070386381bv32))) else v75$2);
    call {:sourceloc} {:sourceloc_num 64} _LOG_WRITE_$$d_finavalu(p1$1, 43bv32, FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FSUB32(2147483648bv32, FADD32(v74$1, v75$1)), 790091698bv32), FMUL32(FMUL32(v48$1, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)), $$d_finavalu[43bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 43bv32);
    assume {:do_not_predicate} {:check_id "check_state_64"} {:captureState "check_state_64"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_64"} {:sourceloc} {:sourceloc_num 64} _CHECK_WRITE_$$d_finavalu(p1$2, 43bv32, FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FSUB32(2147483648bv32, FADD32(v74$2, v75$2)), 790091698bv32), FMUL32(FMUL32(v48$2, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[43bv32] := (if p1$1 then FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FSUB32(2147483648bv32, FADD32(v74$1, v75$1)), 790091698bv32), FMUL32(FMUL32(v48$1, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)) else $$d_finavalu[43bv32]);
    $$d_finavalu[43bv32] := (if p1$2 then FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FSUB32(2147483648bv32, FADD32(v74$2, v75$2)), 790091698bv32), FMUL32(FMUL32(v48$2, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)) else $$d_finavalu[43bv32]);
    v76$1 := (if p1$1 then FMUL32(FMUL32(1038174126bv32, 964935914bv32), FSUB32(v43$1, FMUL32(FDIV32(FDIV32(1065353216bv32, v45$1), 1073741824bv32), FMUL32(FLOG32(FDIV32(1072064102bv32, v40$1)), 1060205080bv32)))) else v76$1);
    v76$2 := (if p1$2 then FMUL32(FMUL32(1038174126bv32, 964935914bv32), FSUB32(v43$2, FMUL32(FDIV32(FDIV32(1065353216bv32, v45$2), 1073741824bv32), FMUL32(FLOG32(FDIV32(1072064102bv32, v40$2)), 1060205080bv32)))) else v76$2);
    v77$1 := (if p1$1 then FMUL32(FMUL32(v52$1, 964935914bv32), FSUB32(v43$1, FMUL32(FDIV32(FDIV32(1065353216bv32, v45$1), 1073741824bv32), FMUL32(FLOG32(FDIV32(1072064102bv32, v41$1)), 1060205080bv32)))) else v77$1);
    v77$2 := (if p1$2 then FMUL32(FMUL32(v52$2, 964935914bv32), FSUB32(v43$2, FMUL32(FDIV32(FDIV32(1065353216bv32, v45$2), 1073741824bv32), FMUL32(FLOG32(FDIV32(1072064102bv32, v41$2)), 1060205080bv32)))) else v77$2);
    call {:sourceloc} {:sourceloc_num 65} _LOG_WRITE_$$d_finavalu(p1$1, 45bv32, FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FSUB32(2147483648bv32, FADD32(v76$1, v77$1)), 790091698bv32), FMUL32(FMUL32(v48$1, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)), $$d_finavalu[45bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 45bv32);
    assume {:do_not_predicate} {:check_id "check_state_65"} {:captureState "check_state_65"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_65"} {:sourceloc} {:sourceloc_num 65} _CHECK_WRITE_$$d_finavalu(p1$2, 45bv32, FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FSUB32(2147483648bv32, FADD32(v76$2, v77$2)), 790091698bv32), FMUL32(FMUL32(v48$2, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[45bv32] := (if p1$1 then FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FSUB32(2147483648bv32, FADD32(v76$1, v77$1)), 790091698bv32), FMUL32(FMUL32(v48$1, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)) else $$d_finavalu[45bv32]);
    $$d_finavalu[45bv32] := (if p1$2 then FP64_CONV32(FMUL64(FP32_CONV64(FDIV32(FMUL32(FSUB32(2147483648bv32, FADD32(v76$2, v77$2)), 790091698bv32), FMUL32(FMUL32(v48$2, 1073741824bv32), 1203532416bv32))), 4652007308841189376bv64)) else $$d_finavalu[45bv32]);
    v78$1 := (if p1$1 then FSUB32(1097859072bv32, FDIV32(FSUB32(1097859072bv32, 1065353216bv32), FADD32(1065353216bv32, FPOW32(FDIV32(1055286886bv32, v35$1), 1075838976bv32)))) else v78$1);
    v78$2 := (if p1$2 then FSUB32(1097859072bv32, FDIV32(FSUB32(1097859072bv32, 1065353216bv32), FADD32(1065353216bv32, FPOW32(FDIV32(1055286886bv32, v35$2), 1075838976bv32)))) else v78$2);
    v79$1 := (if p1$1 then FDIV32(1092616192bv32, v78$1) else v79$1);
    v79$2 := (if p1$2 then FDIV32(1092616192bv32, v78$2) else v79$2);
    v80$1 := (if p1$1 then FMUL32(1056964608bv32, v78$1) else v80$1);
    v80$2 := (if p1$2 then FMUL32(1056964608bv32, v78$2) else v80$2);
    v81$1 := (if p1$1 then FSUB32(FSUB32(FSUB32(1065353216bv32, v19$1), v20$1), v21$1) else v81$1);
    v81$2 := (if p1$2 then FSUB32(FSUB32(FSUB32(1065353216bv32, v19$2), v20$2), v21$2) else v81$2);
    call {:sourceloc} {:sourceloc_num 66} _LOG_WRITE_$$d_finavalu(p1$1, 13bv32, FSUB32(FADD32(FMUL32(1000593162bv32, v81$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v80$1, v40$1), v19$1))), FADD32(FMUL32(FMUL32(v79$1, FPOW32(v40$1, 1073741824bv32)), v19$1), FSUB32(2147483648bv32, FMUL32(1031127695bv32, v20$1)))), $$d_finavalu[13bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 13bv32);
    assume {:do_not_predicate} {:check_id "check_state_66"} {:captureState "check_state_66"} {:sourceloc} {:sourceloc_num 66} true;
    call {:check_id "check_state_66"} {:sourceloc} {:sourceloc_num 66} _CHECK_WRITE_$$d_finavalu(p1$2, 13bv32, FSUB32(FADD32(FMUL32(1000593162bv32, v81$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v80$2, v40$2), v19$2))), FADD32(FMUL32(FMUL32(v79$2, FPOW32(v40$2, 1073741824bv32)), v19$2), FSUB32(2147483648bv32, FMUL32(1031127695bv32, v20$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[13bv32] := (if p1$1 then FSUB32(FADD32(FMUL32(1000593162bv32, v81$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v80$1, v40$1), v19$1))), FADD32(FMUL32(FMUL32(v79$1, FPOW32(v40$1, 1073741824bv32)), v19$1), FSUB32(2147483648bv32, FMUL32(1031127695bv32, v20$1)))) else $$d_finavalu[13bv32]);
    $$d_finavalu[13bv32] := (if p1$2 then FSUB32(FADD32(FMUL32(1000593162bv32, v81$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v80$2, v40$2), v19$2))), FADD32(FMUL32(FMUL32(v79$2, FPOW32(v40$2, 1073741824bv32)), v19$2), FSUB32(2147483648bv32, FMUL32(1031127695bv32, v20$2)))) else $$d_finavalu[13bv32]);
    call {:sourceloc} {:sourceloc_num 67} _LOG_WRITE_$$d_finavalu(p1$1, 14bv32, FSUB32(FADD32(FMUL32(FMUL32(v79$1, FPOW32(v40$1, 1073741824bv32)), v19$1), FSUB32(2147483648bv32, FMUL32(1031127695bv32, v20$1))), FADD32(FMUL32(FMUL32(v80$1, v40$1), v20$1), FSUB32(2147483648bv32, FMUL32(1000593162bv32, v21$1)))), $$d_finavalu[14bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 14bv32);
    assume {:do_not_predicate} {:check_id "check_state_67"} {:captureState "check_state_67"} {:sourceloc} {:sourceloc_num 67} true;
    call {:check_id "check_state_67"} {:sourceloc} {:sourceloc_num 67} _CHECK_WRITE_$$d_finavalu(p1$2, 14bv32, FSUB32(FADD32(FMUL32(FMUL32(v79$2, FPOW32(v40$2, 1073741824bv32)), v19$2), FSUB32(2147483648bv32, FMUL32(1031127695bv32, v20$2))), FADD32(FMUL32(FMUL32(v80$2, v40$2), v20$2), FSUB32(2147483648bv32, FMUL32(1000593162bv32, v21$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[14bv32] := (if p1$1 then FSUB32(FADD32(FMUL32(FMUL32(v79$1, FPOW32(v40$1, 1073741824bv32)), v19$1), FSUB32(2147483648bv32, FMUL32(1031127695bv32, v20$1))), FADD32(FMUL32(FMUL32(v80$1, v40$1), v20$1), FSUB32(2147483648bv32, FMUL32(1000593162bv32, v21$1)))) else $$d_finavalu[14bv32]);
    $$d_finavalu[14bv32] := (if p1$2 then FSUB32(FADD32(FMUL32(FMUL32(v79$2, FPOW32(v40$2, 1073741824bv32)), v19$2), FSUB32(2147483648bv32, FMUL32(1031127695bv32, v20$2))), FADD32(FMUL32(FMUL32(v80$2, v40$2), v20$2), FSUB32(2147483648bv32, FMUL32(1000593162bv32, v21$2)))) else $$d_finavalu[14bv32]);
    call {:sourceloc} {:sourceloc_num 68} _LOG_WRITE_$$d_finavalu(p1$1, 15bv32, FSUB32(FADD32(FMUL32(FMUL32(v80$1, v40$1), v20$1), FSUB32(2147483648bv32, FMUL32(1000593162bv32, v21$1))), FADD32(FMUL32(1031127695bv32, v21$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v79$1, FPOW32(v40$1, 1073741824bv32)), v81$1)))), $$d_finavalu[15bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 15bv32);
    assume {:do_not_predicate} {:check_id "check_state_68"} {:captureState "check_state_68"} {:sourceloc} {:sourceloc_num 68} true;
    call {:check_id "check_state_68"} {:sourceloc} {:sourceloc_num 68} _CHECK_WRITE_$$d_finavalu(p1$2, 15bv32, FSUB32(FADD32(FMUL32(FMUL32(v80$2, v40$2), v20$2), FSUB32(2147483648bv32, FMUL32(1000593162bv32, v21$2))), FADD32(FMUL32(1031127695bv32, v21$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v79$2, FPOW32(v40$2, 1073741824bv32)), v81$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[15bv32] := (if p1$1 then FSUB32(FADD32(FMUL32(FMUL32(v80$1, v40$1), v20$1), FSUB32(2147483648bv32, FMUL32(1000593162bv32, v21$1))), FADD32(FMUL32(1031127695bv32, v21$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v79$1, FPOW32(v40$1, 1073741824bv32)), v81$1)))) else $$d_finavalu[15bv32]);
    $$d_finavalu[15bv32] := (if p1$2 then FSUB32(FADD32(FMUL32(FMUL32(v80$2, v40$2), v20$2), FSUB32(2147483648bv32, FMUL32(1000593162bv32, v21$2))), FADD32(FMUL32(1031127695bv32, v21$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v79$2, FPOW32(v40$2, 1073741824bv32)), v81$2)))) else $$d_finavalu[15bv32]);
    v82$1 := (if p1$1 then FMUL32(FMUL32(1103626240bv32, v20$1), FSUB32(v35$1, v40$1)) else v82$1);
    v82$2 := (if p1$2 then FMUL32(FMUL32(1103626240bv32, v20$2), FSUB32(v35$2, v40$2)) else v82$2);
    v83$1 := (if p1$1 then FDIV32(FMUL32(FMUL32(FPOW32(1076258406bv32, v46$1), 966128197bv32), FSUB32(FPOW32(FDIV32(v42$1, 964753808bv32), 1071955050bv32), FPOW32(FDIV32(v35$1, 1071225242bv32), 1071955050bv32))), FADD32(FADD32(1065353216bv32, FPOW32(FDIV32(v42$1, 964753808bv32), 1071955050bv32)), FPOW32(FDIV32(v35$1, 1071225242bv32), 1071955050bv32))) else v83$1);
    v83$2 := (if p1$2 then FDIV32(FMUL32(FMUL32(FPOW32(1076258406bv32, v46$2), 966128197bv32), FSUB32(FPOW32(FDIV32(v42$2, 964753808bv32), 1071955050bv32), FPOW32(FDIV32(v35$2, 1071225242bv32), 1071955050bv32))), FADD32(FADD32(1065353216bv32, FPOW32(FDIV32(v42$2, 964753808bv32), 1071955050bv32)), FPOW32(FDIV32(v35$2, 1071225242bv32), 1071955050bv32))) else v83$2);
    v84$1 := (if p1$1 then FP64_CONV32(FMUL64(4527927829867574700bv64, FP32_CONV64(FSUB32(v35$1, v40$1)))) else v84$1);
    v84$2 := (if p1$2 then FP64_CONV32(FMUL64(4527927829867574700bv64, FP32_CONV64(FSUB32(v35$2, v40$2)))) else v84$2);
    call {:sourceloc} {:sourceloc_num 69} _LOG_WRITE_$$d_finavalu(p1$1, 16bv32, FADD32(FMUL32(FMUL32(953267991bv32, v36$1), FSUB32(1089598390bv32, v22$1)), FSUB32(2147483648bv32, FMUL32(981668463bv32, v22$1))), $$d_finavalu[16bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 16bv32);
    assume {:do_not_predicate} {:check_id "check_state_69"} {:captureState "check_state_69"} {:sourceloc} {:sourceloc_num 69} true;
    call {:check_id "check_state_69"} {:sourceloc} {:sourceloc_num 69} _CHECK_WRITE_$$d_finavalu(p1$2, 16bv32, FADD32(FMUL32(FMUL32(953267991bv32, v36$2), FSUB32(1089598390bv32, v22$2)), FSUB32(2147483648bv32, FMUL32(981668463bv32, v22$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[16bv32] := (if p1$1 then FADD32(FMUL32(FMUL32(953267991bv32, v36$1), FSUB32(1089598390bv32, v22$1)), FSUB32(2147483648bv32, FMUL32(981668463bv32, v22$1))) else $$d_finavalu[16bv32]);
    $$d_finavalu[16bv32] := (if p1$2 then FADD32(FMUL32(FMUL32(953267991bv32, v36$2), FSUB32(1089598390bv32, v22$2)), FSUB32(2147483648bv32, FMUL32(981668463bv32, v22$2))) else $$d_finavalu[16bv32]);
    call {:sourceloc} {:sourceloc_num 70} _LOG_WRITE_$$d_finavalu(p1$1, 17bv32, FADD32(FMUL32(FMUL32(953267991bv32, v37$1), FSUB32(1070805811bv32, v23$1)), FSUB32(2147483648bv32, FMUL32(981668463bv32, v23$1))), $$d_finavalu[17bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 17bv32);
    assume {:do_not_predicate} {:check_id "check_state_70"} {:captureState "check_state_70"} {:sourceloc} {:sourceloc_num 70} true;
    call {:check_id "check_state_70"} {:sourceloc} {:sourceloc_num 70} _CHECK_WRITE_$$d_finavalu(p1$2, 17bv32, FADD32(FMUL32(FMUL32(953267991bv32, v37$2), FSUB32(1070805811bv32, v23$2)), FSUB32(2147483648bv32, FMUL32(981668463bv32, v23$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[17bv32] := (if p1$1 then FADD32(FMUL32(FMUL32(953267991bv32, v37$1), FSUB32(1070805811bv32, v23$1)), FSUB32(2147483648bv32, FMUL32(981668463bv32, v23$1))) else $$d_finavalu[17bv32]);
    $$d_finavalu[17bv32] := (if p1$2 then FADD32(FMUL32(FMUL32(953267991bv32, v37$2), FSUB32(1070805811bv32, v23$2)), FSUB32(2147483648bv32, FMUL32(981668463bv32, v23$2))) else $$d_finavalu[17bv32]);
    call {:sourceloc} {:sourceloc_num 71} _LOG_WRITE_$$d_finavalu(p1$1, 18bv32, FADD32(FMUL32(FMUL32(1107479757bv32, v42$1), FSUB32(1032805417bv32, v24$1)), FSUB32(2147483648bv32, FMUL32(1017155630bv32, v24$1))), $$d_finavalu[18bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 18bv32);
    assume {:do_not_predicate} {:check_id "check_state_71"} {:captureState "check_state_71"} {:sourceloc} {:sourceloc_num 71} true;
    call {:check_id "check_state_71"} {:sourceloc} {:sourceloc_num 71} _CHECK_WRITE_$$d_finavalu(p1$2, 18bv32, FADD32(FMUL32(FMUL32(1107479757bv32, v42$2), FSUB32(1032805417bv32, v24$2)), FSUB32(2147483648bv32, FMUL32(1017155630bv32, v24$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[18bv32] := (if p1$1 then FADD32(FMUL32(FMUL32(1107479757bv32, v42$1), FSUB32(1032805417bv32, v24$1)), FSUB32(2147483648bv32, FMUL32(1017155630bv32, v24$1))) else $$d_finavalu[18bv32]);
    $$d_finavalu[18bv32] := (if p1$2 then FADD32(FMUL32(FMUL32(1107479757bv32, v42$2), FSUB32(1032805417bv32, v24$2)), FSUB32(2147483648bv32, FMUL32(1017155630bv32, v24$2))) else $$d_finavalu[18bv32]);
    call {:sourceloc} {:sourceloc_num 72} _LOG_WRITE_$$d_finavalu(p1$1, 19bv32, FADD32(FMUL32(FMUL32(1075293716bv32, v42$1), FSUB32(FSUB32(1041194025bv32, v25$1), v26$1)), FSUB32(2147483648bv32, FMUL32(939931581bv32, v25$1))), $$d_finavalu[19bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 19bv32);
    assume {:do_not_predicate} {:check_id "check_state_72"} {:captureState "check_state_72"} {:sourceloc} {:sourceloc_num 72} true;
    call {:check_id "check_state_72"} {:sourceloc} {:sourceloc_num 72} _CHECK_WRITE_$$d_finavalu(p1$2, 19bv32, FADD32(FMUL32(FMUL32(1075293716bv32, v42$2), FSUB32(FSUB32(1041194025bv32, v25$2), v26$2)), FSUB32(2147483648bv32, FMUL32(939931581bv32, v25$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[19bv32] := (if p1$1 then FADD32(FMUL32(FMUL32(1075293716bv32, v42$1), FSUB32(FSUB32(1041194025bv32, v25$1), v26$1)), FSUB32(2147483648bv32, FMUL32(939931581bv32, v25$1))) else $$d_finavalu[19bv32]);
    $$d_finavalu[19bv32] := (if p1$2 then FADD32(FMUL32(FMUL32(1075293716bv32, v42$2), FSUB32(FSUB32(1041194025bv32, v25$2), v26$2)), FSUB32(2147483648bv32, FMUL32(939931581bv32, v25$2))) else $$d_finavalu[19bv32]);
    call {:sourceloc} {:sourceloc_num 73} _LOG_WRITE_$$d_finavalu(p1$1, 20bv32, FADD32(FMUL32(FMUL32(994352038bv32, 1065353216bv32), FSUB32(FSUB32(1041194025bv32, v25$1), v26$1)), FSUB32(2147483648bv32, FMUL32(995769377bv32, v26$1))), $$d_finavalu[20bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 20bv32);
    assume {:do_not_predicate} {:check_id "check_state_73"} {:captureState "check_state_73"} {:sourceloc} {:sourceloc_num 73} true;
    call {:check_id "check_state_73"} {:sourceloc} {:sourceloc_num 73} _CHECK_WRITE_$$d_finavalu(p1$2, 20bv32, FADD32(FMUL32(FMUL32(994352038bv32, 1065353216bv32), FSUB32(FSUB32(1041194025bv32, v25$2), v26$2)), FSUB32(2147483648bv32, FMUL32(995769377bv32, v26$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[20bv32] := (if p1$1 then FADD32(FMUL32(FMUL32(994352038bv32, 1065353216bv32), FSUB32(FSUB32(1041194025bv32, v25$1), v26$1)), FSUB32(2147483648bv32, FMUL32(995769377bv32, v26$1))) else $$d_finavalu[20bv32]);
    $$d_finavalu[20bv32] := (if p1$2 then FADD32(FMUL32(FMUL32(994352038bv32, 1065353216bv32), FSUB32(FSUB32(1041194025bv32, v25$2), v26$2)), FSUB32(2147483648bv32, FMUL32(995769377bv32, v26$2))) else $$d_finavalu[20bv32]);
    call {:sourceloc} {:sourceloc_num 74} _LOG_WRITE_$$d_finavalu(p1$1, 21bv32, 0bv32, $$d_finavalu[21bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 21bv32);
    assume {:do_not_predicate} {:check_id "check_state_74"} {:captureState "check_state_74"} {:sourceloc} {:sourceloc_num 74} true;
    call {:check_id "check_state_74"} {:sourceloc} {:sourceloc_num 74} _CHECK_WRITE_$$d_finavalu(p1$2, 21bv32, 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[21bv32] := (if p1$1 then 0bv32 else $$d_finavalu[21bv32]);
    $$d_finavalu[21bv32] := (if p1$2 then 0bv32 else $$d_finavalu[21bv32]);
    call {:sourceloc} {:sourceloc_num 75} _LOG_WRITE_$$d_finavalu(p1$1, 22bv32, FADD32(FMUL32(FMUL32(1096600781bv32, v42$1), FSUB32(FSUB32(1041194025bv32, v27$1), v28$1)), FSUB32(2147483648bv32, FMUL32(972106792bv32, v27$1))), $$d_finavalu[22bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 22bv32);
    assume {:do_not_predicate} {:check_id "check_state_75"} {:captureState "check_state_75"} {:sourceloc} {:sourceloc_num 75} true;
    call {:check_id "check_state_75"} {:sourceloc} {:sourceloc_num 75} _CHECK_WRITE_$$d_finavalu(p1$2, 22bv32, FADD32(FMUL32(FMUL32(1096600781bv32, v42$2), FSUB32(FSUB32(1041194025bv32, v27$2), v28$2)), FSUB32(2147483648bv32, FMUL32(972106792bv32, v27$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[22bv32] := (if p1$1 then FADD32(FMUL32(FMUL32(1096600781bv32, v42$1), FSUB32(FSUB32(1041194025bv32, v27$1), v28$1)), FSUB32(2147483648bv32, FMUL32(972106792bv32, v27$1))) else $$d_finavalu[22bv32]);
    $$d_finavalu[22bv32] := (if p1$2 then FADD32(FMUL32(FMUL32(1096600781bv32, v42$2), FSUB32(FSUB32(1041194025bv32, v27$2), v28$2)), FSUB32(2147483648bv32, FMUL32(972106792bv32, v27$2))) else $$d_finavalu[22bv32]);
    call {:sourceloc} {:sourceloc_num 76} _LOG_WRITE_$$d_finavalu(p1$1, 23bv32, FADD32(FMUL32(FMUL32(1015061833bv32, 1065353216bv32), FSUB32(FSUB32(1041194025bv32, v27$1), v28$1)), FSUB32(2147483648bv32, FMUL32(946803529bv32, v28$1))), $$d_finavalu[23bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 23bv32);
    assume {:do_not_predicate} {:check_id "check_state_76"} {:captureState "check_state_76"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_76"} {:sourceloc} {:sourceloc_num 76} _CHECK_WRITE_$$d_finavalu(p1$2, 23bv32, FADD32(FMUL32(FMUL32(1015061833bv32, 1065353216bv32), FSUB32(FSUB32(1041194025bv32, v27$2), v28$2)), FSUB32(2147483648bv32, FMUL32(946803529bv32, v28$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[23bv32] := (if p1$1 then FADD32(FMUL32(FMUL32(1015061833bv32, 1065353216bv32), FSUB32(FSUB32(1041194025bv32, v27$1), v28$1)), FSUB32(2147483648bv32, FMUL32(946803529bv32, v28$1))) else $$d_finavalu[23bv32]);
    $$d_finavalu[23bv32] := (if p1$2 then FADD32(FMUL32(FMUL32(1015061833bv32, 1065353216bv32), FSUB32(FSUB32(1041194025bv32, v27$2), v28$2)), FSUB32(2147483648bv32, FMUL32(946803529bv32, v28$2))) else $$d_finavalu[23bv32]);
    call {:sourceloc} {:sourceloc_num 77} _LOG_WRITE_$$d_finavalu(p1$1, 24bv32, FADD32(FMUL32(FMUL32(1120403456bv32, v42$1), FSUB32(1015813453bv32, v29$1)), FSUB32(2147483648bv32, FMUL32(1031127695bv32, v29$1))), $$d_finavalu[24bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 24bv32);
    assume {:do_not_predicate} {:check_id "check_state_77"} {:captureState "check_state_77"} {:sourceloc} {:sourceloc_num 77} true;
    call {:check_id "check_state_77"} {:sourceloc} {:sourceloc_num 77} _CHECK_WRITE_$$d_finavalu(p1$2, 24bv32, FADD32(FMUL32(FMUL32(1120403456bv32, v42$2), FSUB32(1015813453bv32, v29$2)), FSUB32(2147483648bv32, FMUL32(1031127695bv32, v29$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[24bv32] := (if p1$1 then FADD32(FMUL32(FMUL32(1120403456bv32, v42$1), FSUB32(1015813453bv32, v29$1)), FSUB32(2147483648bv32, FMUL32(1031127695bv32, v29$1))) else $$d_finavalu[24bv32]);
    $$d_finavalu[24bv32] := (if p1$2 then FADD32(FMUL32(FMUL32(1120403456bv32, v42$2), FSUB32(1015813453bv32, v29$2)), FSUB32(2147483648bv32, FMUL32(1031127695bv32, v29$2))) else $$d_finavalu[24bv32]);
    call {:sourceloc} {:sourceloc_num 78} _LOG_READ_$$d_finavalu(p1$1, 18bv32, $$d_finavalu[18bv32]);
    assume {:do_not_predicate} {:check_id "check_state_78"} {:captureState "check_state_78"} {:sourceloc} {:sourceloc_num 78} true;
    call {:check_id "check_state_78"} {:sourceloc} {:sourceloc_num 78} _CHECK_READ_$$d_finavalu(p1$2, 18bv32, $$d_finavalu[18bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_finavalu"} true;
    v85$1 := (if p1$1 then $$d_finavalu[18bv32] else v85$1);
    v85$2 := (if p1$2 then $$d_finavalu[18bv32] else v85$2);
    call {:sourceloc} {:sourceloc_num 79} _LOG_READ_$$d_finavalu(p1$1, 19bv32, $$d_finavalu[19bv32]);
    assume {:do_not_predicate} {:check_id "check_state_79"} {:captureState "check_state_79"} {:sourceloc} {:sourceloc_num 79} true;
    call {:check_id "check_state_79"} {:sourceloc} {:sourceloc_num 79} _CHECK_READ_$$d_finavalu(p1$2, 19bv32, $$d_finavalu[19bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_finavalu"} true;
    v86$1 := (if p1$1 then $$d_finavalu[19bv32] else v86$1);
    v86$2 := (if p1$2 then $$d_finavalu[19bv32] else v86$2);
    call {:sourceloc} {:sourceloc_num 80} _LOG_READ_$$d_finavalu(p1$1, 20bv32, $$d_finavalu[20bv32]);
    assume {:do_not_predicate} {:check_id "check_state_80"} {:captureState "check_state_80"} {:sourceloc} {:sourceloc_num 80} true;
    call {:check_id "check_state_80"} {:sourceloc} {:sourceloc_num 80} _CHECK_READ_$$d_finavalu(p1$2, 20bv32, $$d_finavalu[20bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_finavalu"} true;
    v87$1 := (if p1$1 then $$d_finavalu[20bv32] else v87$1);
    v87$2 := (if p1$2 then $$d_finavalu[20bv32] else v87$2);
    call {:sourceloc} {:sourceloc_num 81} _LOG_READ_$$d_finavalu(p1$1, 21bv32, $$d_finavalu[21bv32]);
    assume {:do_not_predicate} {:check_id "check_state_81"} {:captureState "check_state_81"} {:sourceloc} {:sourceloc_num 81} true;
    call {:check_id "check_state_81"} {:sourceloc} {:sourceloc_num 81} _CHECK_READ_$$d_finavalu(p1$2, 21bv32, $$d_finavalu[21bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_finavalu"} true;
    v88$1 := (if p1$1 then $$d_finavalu[21bv32] else v88$1);
    v88$2 := (if p1$2 then $$d_finavalu[21bv32] else v88$2);
    call {:sourceloc} {:sourceloc_num 82} _LOG_READ_$$d_finavalu(p1$1, 22bv32, $$d_finavalu[22bv32]);
    assume {:do_not_predicate} {:check_id "check_state_82"} {:captureState "check_state_82"} {:sourceloc} {:sourceloc_num 82} true;
    call {:check_id "check_state_82"} {:sourceloc} {:sourceloc_num 82} _CHECK_READ_$$d_finavalu(p1$2, 22bv32, $$d_finavalu[22bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_finavalu"} true;
    v89$1 := (if p1$1 then $$d_finavalu[22bv32] else v89$1);
    v89$2 := (if p1$2 then $$d_finavalu[22bv32] else v89$2);
    call {:sourceloc} {:sourceloc_num 83} _LOG_READ_$$d_finavalu(p1$1, 23bv32, $$d_finavalu[23bv32]);
    assume {:do_not_predicate} {:check_id "check_state_83"} {:captureState "check_state_83"} {:sourceloc} {:sourceloc_num 83} true;
    call {:check_id "check_state_83"} {:sourceloc} {:sourceloc_num 83} _CHECK_READ_$$d_finavalu(p1$2, 23bv32, $$d_finavalu[23bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_finavalu"} true;
    v90$1 := (if p1$1 then $$d_finavalu[23bv32] else v90$1);
    v90$2 := (if p1$2 then $$d_finavalu[23bv32] else v90$2);
    call {:sourceloc} {:sourceloc_num 84} _LOG_READ_$$d_finavalu(p1$1, 24bv32, $$d_finavalu[24bv32]);
    assume {:do_not_predicate} {:check_id "check_state_84"} {:captureState "check_state_84"} {:sourceloc} {:sourceloc_num 84} true;
    call {:check_id "check_state_84"} {:sourceloc} {:sourceloc_num 84} _CHECK_READ_$$d_finavalu(p1$2, 24bv32, $$d_finavalu[24bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_finavalu"} true;
    v91$1 := (if p1$1 then $$d_finavalu[24bv32] else v91$1);
    v91$2 := (if p1$2 then $$d_finavalu[24bv32] else v91$2);
    call {:sourceloc} {:sourceloc_num 85} _LOG_WRITE_$$d_finavalu(p1$1, 25bv32, FADD32(FMUL32(FMUL32(1120403456bv32, v40$1), FSUB32(FP64_CONV32(FMUL64(FDIV64(FMUL64(4571976519504966577bv64, FP32_CONV64(v48$1)), FP32_CONV64(v51$1)), 4591870180066957722bv64)), v30$1)), FSUB32(2147483648bv32, FMUL32(1067869798bv32, v30$1))), $$d_finavalu[25bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 25bv32);
    assume {:do_not_predicate} {:check_id "check_state_85"} {:captureState "check_state_85"} {:sourceloc} {:sourceloc_num 85} true;
    call {:check_id "check_state_85"} {:sourceloc} {:sourceloc_num 85} _CHECK_WRITE_$$d_finavalu(p1$2, 25bv32, FADD32(FMUL32(FMUL32(1120403456bv32, v40$2), FSUB32(FP64_CONV32(FMUL64(FDIV64(FMUL64(4571976519504966577bv64, FP32_CONV64(v48$2)), FP32_CONV64(v51$2)), 4591870180066957722bv64)), v30$2)), FSUB32(2147483648bv32, FMUL32(1067869798bv32, v30$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[25bv32] := (if p1$1 then FADD32(FMUL32(FMUL32(1120403456bv32, v40$1), FSUB32(FP64_CONV32(FMUL64(FDIV64(FMUL64(4571976519504966577bv64, FP32_CONV64(v48$1)), FP32_CONV64(v51$1)), 4591870180066957722bv64)), v30$1)), FSUB32(2147483648bv32, FMUL32(1067869798bv32, v30$1))) else $$d_finavalu[25bv32]);
    $$d_finavalu[25bv32] := (if p1$2 then FADD32(FMUL32(FMUL32(1120403456bv32, v40$2), FSUB32(FP64_CONV32(FMUL64(FDIV64(FMUL64(4571976519504966577bv64, FP32_CONV64(v48$2)), FP32_CONV64(v51$2)), 4591870180066957722bv64)), v30$2)), FSUB32(2147483648bv32, FMUL32(1067869798bv32, v30$2))) else $$d_finavalu[25bv32]);
    call {:sourceloc} {:sourceloc_num 86} _LOG_WRITE_$$d_finavalu(p1$1, 26bv32, FADD32(FMUL32(FMUL32(1120403456bv32, v41$1), FSUB32(FP64_CONV32(FDIV64(FMUL64(4585547846766069924bv64, FP32_CONV64(v48$1)), FP32_CONV64(v50$1))), v31$1)), FSUB32(2147483648bv32, FMUL32(1067869798bv32, v31$1))), $$d_finavalu[26bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 26bv32);
    assume {:do_not_predicate} {:check_id "check_state_86"} {:captureState "check_state_86"} {:sourceloc} {:sourceloc_num 86} true;
    call {:check_id "check_state_86"} {:sourceloc} {:sourceloc_num 86} _CHECK_WRITE_$$d_finavalu(p1$2, 26bv32, FADD32(FMUL32(FMUL32(1120403456bv32, v41$2), FSUB32(FP64_CONV32(FDIV64(FMUL64(4585547846766069924bv64, FP32_CONV64(v48$2)), FP32_CONV64(v50$2))), v31$2)), FSUB32(2147483648bv32, FMUL32(1067869798bv32, v31$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[26bv32] := (if p1$1 then FADD32(FMUL32(FMUL32(1120403456bv32, v41$1), FSUB32(FP64_CONV32(FDIV64(FMUL64(4585547846766069924bv64, FP32_CONV64(v48$1)), FP32_CONV64(v50$1))), v31$1)), FSUB32(2147483648bv32, FMUL32(1067869798bv32, v31$1))) else $$d_finavalu[26bv32]);
    $$d_finavalu[26bv32] := (if p1$2 then FADD32(FMUL32(FMUL32(1120403456bv32, v41$2), FSUB32(FP64_CONV32(FDIV64(FMUL64(4585547846766069924bv64, FP32_CONV64(v48$2)), FP32_CONV64(v50$2))), v31$2)), FSUB32(2147483648bv32, FMUL32(1067869798bv32, v31$2))) else $$d_finavalu[26bv32]);
    call {:sourceloc} {:sourceloc_num 87} _LOG_WRITE_$$d_finavalu(p1$1, 27bv32, FADD32(FMUL32(FMUL32(1120403456bv32, v40$1), FSUB32(FP64_CONV32(FMUL64(FDIV64(FMUL64(4565252104829347142bv64, FP32_CONV64(v48$1)), FP32_CONV64(v51$1)), 4591870180066957722bv64)), v32$1)), FSUB32(2147483648bv32, FMUL32(1022739087bv32, v32$1))), $$d_finavalu[27bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 27bv32);
    assume {:do_not_predicate} {:check_id "check_state_87"} {:captureState "check_state_87"} {:sourceloc} {:sourceloc_num 87} true;
    call {:check_id "check_state_87"} {:sourceloc} {:sourceloc_num 87} _CHECK_WRITE_$$d_finavalu(p1$2, 27bv32, FADD32(FMUL32(FMUL32(1120403456bv32, v40$2), FSUB32(FP64_CONV32(FMUL64(FDIV64(FMUL64(4565252104829347142bv64, FP32_CONV64(v48$2)), FP32_CONV64(v51$2)), 4591870180066957722bv64)), v32$2)), FSUB32(2147483648bv32, FMUL32(1022739087bv32, v32$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[27bv32] := (if p1$1 then FADD32(FMUL32(FMUL32(1120403456bv32, v40$1), FSUB32(FP64_CONV32(FMUL64(FDIV64(FMUL64(4565252104829347142bv64, FP32_CONV64(v48$1)), FP32_CONV64(v51$1)), 4591870180066957722bv64)), v32$1)), FSUB32(2147483648bv32, FMUL32(1022739087bv32, v32$1))) else $$d_finavalu[27bv32]);
    $$d_finavalu[27bv32] := (if p1$2 then FADD32(FMUL32(FMUL32(1120403456bv32, v40$2), FSUB32(FP64_CONV32(FMUL64(FDIV64(FMUL64(4565252104829347142bv64, FP32_CONV64(v48$2)), FP32_CONV64(v51$2)), 4591870180066957722bv64)), v32$2)), FSUB32(2147483648bv32, FMUL32(1022739087bv32, v32$2))) else $$d_finavalu[27bv32]);
    call {:sourceloc} {:sourceloc_num 88} _LOG_WRITE_$$d_finavalu(p1$1, 28bv32, FADD32(FMUL32(FMUL32(1120403456bv32, v41$1), FSUB32(FP64_CONV32(FDIV64(FMUL64(4578849372824304144bv64, FP32_CONV64(v48$1)), FP32_CONV64(v50$1))), v33$1)), FSUB32(2147483648bv32, FMUL32(1022739087bv32, v33$1))), $$d_finavalu[28bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 28bv32);
    assume {:do_not_predicate} {:check_id "check_state_88"} {:captureState "check_state_88"} {:sourceloc} {:sourceloc_num 88} true;
    call {:check_id "check_state_88"} {:sourceloc} {:sourceloc_num 88} _CHECK_WRITE_$$d_finavalu(p1$2, 28bv32, FADD32(FMUL32(FMUL32(1120403456bv32, v41$2), FSUB32(FP64_CONV32(FDIV64(FMUL64(4578849372824304144bv64, FP32_CONV64(v48$2)), FP32_CONV64(v50$2))), v33$2)), FSUB32(2147483648bv32, FMUL32(1022739087bv32, v33$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[28bv32] := (if p1$1 then FADD32(FMUL32(FMUL32(1120403456bv32, v41$1), FSUB32(FP64_CONV32(FDIV64(FMUL64(4578849372824304144bv64, FP32_CONV64(v48$1)), FP32_CONV64(v50$1))), v33$1)), FSUB32(2147483648bv32, FMUL32(1022739087bv32, v33$1))) else $$d_finavalu[28bv32]);
    $$d_finavalu[28bv32] := (if p1$2 then FADD32(FMUL32(FMUL32(1120403456bv32, v41$2), FSUB32(FP64_CONV32(FDIV64(FMUL64(4578849372824304144bv64, FP32_CONV64(v48$2)), FP32_CONV64(v50$2))), v33$2)), FSUB32(2147483648bv32, FMUL32(1022739087bv32, v33$2))) else $$d_finavalu[28bv32]);
    call {:sourceloc} {:sourceloc_num 89} _LOG_READ_$$d_finavalu(p1$1, 25bv32, $$d_finavalu[25bv32]);
    assume {:do_not_predicate} {:check_id "check_state_89"} {:captureState "check_state_89"} {:sourceloc} {:sourceloc_num 89} true;
    call {:check_id "check_state_89"} {:sourceloc} {:sourceloc_num 89} _CHECK_READ_$$d_finavalu(p1$2, 25bv32, $$d_finavalu[25bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_finavalu"} true;
    v92$1 := (if p1$1 then $$d_finavalu[25bv32] else v92$1);
    v92$2 := (if p1$2 then $$d_finavalu[25bv32] else v92$2);
    call {:sourceloc} {:sourceloc_num 90} _LOG_READ_$$d_finavalu(p1$1, 27bv32, $$d_finavalu[27bv32]);
    assume {:do_not_predicate} {:check_id "check_state_90"} {:captureState "check_state_90"} {:sourceloc} {:sourceloc_num 90} true;
    call {:check_id "check_state_90"} {:sourceloc} {:sourceloc_num 90} _CHECK_READ_$$d_finavalu(p1$2, 27bv32, $$d_finavalu[27bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_finavalu"} true;
    v93$1 := (if p1$1 then $$d_finavalu[27bv32] else v93$1);
    v93$2 := (if p1$2 then $$d_finavalu[27bv32] else v93$2);
    call {:sourceloc} {:sourceloc_num 91} _LOG_READ_$$d_finavalu(p1$1, 26bv32, $$d_finavalu[26bv32]);
    assume {:do_not_predicate} {:check_id "check_state_91"} {:captureState "check_state_91"} {:sourceloc} {:sourceloc_num 91} true;
    call {:check_id "check_state_91"} {:sourceloc} {:sourceloc_num 91} _CHECK_READ_$$d_finavalu(p1$2, 26bv32, $$d_finavalu[26bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_finavalu"} true;
    v94$1 := (if p1$1 then $$d_finavalu[26bv32] else v94$1);
    v94$2 := (if p1$2 then $$d_finavalu[26bv32] else v94$2);
    call {:sourceloc} {:sourceloc_num 92} _LOG_READ_$$d_finavalu(p1$1, 28bv32, $$d_finavalu[28bv32]);
    assume {:do_not_predicate} {:check_id "check_state_92"} {:captureState "check_state_92"} {:sourceloc} {:sourceloc_num 92} true;
    call {:check_id "check_state_92"} {:sourceloc} {:sourceloc_num 92} _CHECK_READ_$$d_finavalu(p1$2, 28bv32, $$d_finavalu[28bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_finavalu"} true;
    v95$1 := (if p1$1 then $$d_finavalu[28bv32] else v95$1);
    v95$2 := (if p1$2 then $$d_finavalu[28bv32] else v95$2);
    call {:sourceloc} {:sourceloc_num 93} _LOG_WRITE_$$d_finavalu(p1$1, 29bv32, FADD32(FMUL32(FMUL32(1120403456bv32, v35$1), FSUB32(1076677837bv32, v34$1)), FSUB32(2147483648bv32, FMUL32(1115815936bv32, v34$1))), $$d_finavalu[29bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 29bv32);
    assume {:do_not_predicate} {:check_id "check_state_93"} {:captureState "check_state_93"} {:sourceloc} {:sourceloc_num 93} true;
    call {:check_id "check_state_93"} {:sourceloc} {:sourceloc_num 93} _CHECK_WRITE_$$d_finavalu(p1$2, 29bv32, FADD32(FMUL32(FMUL32(1120403456bv32, v35$2), FSUB32(1076677837bv32, v34$2)), FSUB32(2147483648bv32, FMUL32(1115815936bv32, v34$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[29bv32] := (if p1$1 then FADD32(FMUL32(FMUL32(1120403456bv32, v35$1), FSUB32(1076677837bv32, v34$1)), FSUB32(2147483648bv32, FMUL32(1115815936bv32, v34$1))) else $$d_finavalu[29bv32]);
    $$d_finavalu[29bv32] := (if p1$2 then FADD32(FMUL32(FMUL32(1120403456bv32, v35$2), FSUB32(1076677837bv32, v34$2)), FSUB32(2147483648bv32, FMUL32(1115815936bv32, v34$2))) else $$d_finavalu[29bv32]);
    v96$1 := (if p1$1 then FDIV32(1065353216bv32, v49$1) else v96$1);
    v96$2 := (if p1$2 then FDIV32(1065353216bv32, v49$2) else v96$2);
    call {:sourceloc} {:sourceloc_num 94} _LOG_READ_$$d_finavalu(p1$1, 29bv32, $$d_finavalu[29bv32]);
    assume {:do_not_predicate} {:check_id "check_state_94"} {:captureState "check_state_94"} {:sourceloc} {:sourceloc_num 94} true;
    call {:check_id "check_state_94"} {:sourceloc} {:sourceloc_num 94} _CHECK_READ_$$d_finavalu(p1$2, 29bv32, $$d_finavalu[29bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_finavalu"} true;
    v97$1 := (if p1$1 then $$d_finavalu[29bv32] else v97$1);
    v97$2 := (if p1$2 then $$d_finavalu[29bv32] else v97$2);
    call {:sourceloc} {:sourceloc_num 95} _LOG_WRITE_$$d_finavalu(p1$1, 30bv32, FSUB32(FADD32(FMUL32(FMUL32(v83$1, v48$1), v96$1), FSUB32(2147483648bv32, FADD32(FMUL32(FMUL32(v84$1, v48$1), v96$1), v82$1))), v97$1), $$d_finavalu[30bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 30bv32);
    assume {:do_not_predicate} {:check_id "check_state_95"} {:captureState "check_state_95"} {:sourceloc} {:sourceloc_num 95} true;
    call {:check_id "check_state_95"} {:sourceloc} {:sourceloc_num 95} _CHECK_WRITE_$$d_finavalu(p1$2, 30bv32, FSUB32(FADD32(FMUL32(FMUL32(v83$2, v48$2), v96$2), FSUB32(2147483648bv32, FADD32(FMUL32(FMUL32(v84$2, v48$2), v96$2), v82$2))), v97$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[30bv32] := (if p1$1 then FSUB32(FADD32(FMUL32(FMUL32(v83$1, v48$1), v96$1), FSUB32(2147483648bv32, FADD32(FMUL32(FMUL32(v84$1, v48$1), v96$1), v82$1))), v97$1) else $$d_finavalu[30bv32]);
    $$d_finavalu[30bv32] := (if p1$2 then FSUB32(FADD32(FMUL32(FMUL32(v83$2, v48$2), v96$2), FSUB32(2147483648bv32, FADD32(FMUL32(FMUL32(v84$2, v48$2), v96$2), v82$2))), v97$2) else $$d_finavalu[30bv32]);
    v98$1 := (if p1$1 then FADD32(FADD32(FADD32(FADD32(FMUL32(FMUL32(FMUL32(FMUL32(FMUL32(1038174126bv32, 1098907648bv32), FPOW32(v6$1, 1077936128bv32)), v7$1), v8$1), FSUB32(v43$1, v54$1)), FMUL32(FMUL32(1038174126bv32, 966506154bv32), FSUB32(v43$1, v54$1))), FMUL32(1077936128bv32, v72$1)), FMUL32(1077936128bv32, v60$1)), FP64_CONV32(FMUL64(FP32_CONV64(FMUL32(FMUL32(FMUL32(FMUL32(FMUL32(1063675494bv32, FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(FMUL32(847305049bv32, FMUL32(FMUL32(v43$1, 1203532416bv32), v45$1))), FADD64(FMUL64(FMUL64(4604930618986332160bv64, FP32_CONV64(v36$1)), FP32_CONV64(FEXP32(FMUL32(FMUL32(v43$1, v45$1), 1069066811bv32)))), FSUB64(9223372036854775808bv64, FMUL64(4604930618986332160bv64, FP32_CONV64(1124859904bv32))))), FP32_CONV64(FSUB32(FEXP32(FMUL32(FMUL32(v43$1, v45$1), 1069066811bv32)), 1065353216bv32))))), v9$1), v10$1), FSUB32(1065353216bv32, v11$1)), FPOW32(1072064102bv32, v46$1))), 4601778099247172813bv64))) else v98$1);
    v98$2 := (if p1$2 then FADD32(FADD32(FADD32(FADD32(FMUL32(FMUL32(FMUL32(FMUL32(FMUL32(1038174126bv32, 1098907648bv32), FPOW32(v6$2, 1077936128bv32)), v7$2), v8$2), FSUB32(v43$2, v54$2)), FMUL32(FMUL32(1038174126bv32, 966506154bv32), FSUB32(v43$2, v54$2))), FMUL32(1077936128bv32, v72$2)), FMUL32(1077936128bv32, v60$2)), FP64_CONV32(FMUL64(FP32_CONV64(FMUL32(FMUL32(FMUL32(FMUL32(FMUL32(1063675494bv32, FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(FMUL32(847305049bv32, FMUL32(FMUL32(v43$2, 1203532416bv32), v45$2))), FADD64(FMUL64(FMUL64(4604930618986332160bv64, FP32_CONV64(v36$2)), FP32_CONV64(FEXP32(FMUL32(FMUL32(v43$2, v45$2), 1069066811bv32)))), FSUB64(9223372036854775808bv64, FMUL64(4604930618986332160bv64, FP32_CONV64(1124859904bv32))))), FP32_CONV64(FSUB32(FEXP32(FMUL32(FMUL32(v43$2, v45$2), 1069066811bv32)), 1065353216bv32))))), v9$2), v10$2), FSUB32(1065353216bv32, v11$2)), FPOW32(1072064102bv32, v46$2))), 4601778099247172813bv64))) else v98$2);
    v99$1 := (if p1$1 then FADD32(FADD32(FADD32(FADD32(FMUL32(FMUL32(FMUL32(FMUL32(FMUL32(v52$1, 1098907648bv32), FPOW32(v6$1, 1077936128bv32)), v7$1), v8$1), FSUB32(v43$1, v55$1)), FMUL32(FMUL32(v52$1, 966506154bv32), FSUB32(v43$1, v55$1))), FMUL32(1077936128bv32, v73$1)), FMUL32(1077936128bv32, v61$1)), FP64_CONV32(FMUL64(FP32_CONV64(FMUL32(FMUL32(FMUL32(FMUL32(FMUL32(v53$1, FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(FMUL32(847305049bv32, FMUL32(FMUL32(v43$1, 1203532416bv32), v45$1))), FADD64(FMUL64(FMUL64(4604930618986332160bv64, FP32_CONV64(v37$1)), FP32_CONV64(FEXP32(FMUL32(FMUL32(v43$1, v45$1), 1069066811bv32)))), FSUB64(9223372036854775808bv64, FMUL64(4604930618986332160bv64, FP32_CONV64(1124859904bv32))))), FP32_CONV64(FSUB32(FEXP32(FMUL32(FMUL32(v43$1, v45$1), 1069066811bv32)), 1065353216bv32))))), v9$1), v10$1), FSUB32(1065353216bv32, v12$1)), FPOW32(1072064102bv32, v46$1))), 4601778099247172813bv64))) else v99$1);
    v99$2 := (if p1$2 then FADD32(FADD32(FADD32(FADD32(FMUL32(FMUL32(FMUL32(FMUL32(FMUL32(v52$2, 1098907648bv32), FPOW32(v6$2, 1077936128bv32)), v7$2), v8$2), FSUB32(v43$2, v55$2)), FMUL32(FMUL32(v52$2, 966506154bv32), FSUB32(v43$2, v55$2))), FMUL32(1077936128bv32, v73$2)), FMUL32(1077936128bv32, v61$2)), FP64_CONV32(FMUL64(FP32_CONV64(FMUL32(FMUL32(FMUL32(FMUL32(FMUL32(v53$2, FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(FMUL32(847305049bv32, FMUL32(FMUL32(v43$2, 1203532416bv32), v45$2))), FADD64(FMUL64(FMUL64(4604930618986332160bv64, FP32_CONV64(v37$2)), FP32_CONV64(FEXP32(FMUL32(FMUL32(v43$2, v45$2), 1069066811bv32)))), FSUB64(9223372036854775808bv64, FMUL64(4604930618986332160bv64, FP32_CONV64(1124859904bv32))))), FP32_CONV64(FSUB32(FEXP32(FMUL32(FMUL32(v43$2, v45$2), 1069066811bv32)), 1065353216bv32))))), v9$2), v10$2), FSUB32(1065353216bv32, v12$2)), FPOW32(1072064102bv32, v46$2))), 4601778099247172813bv64))) else v99$2);
    call {:sourceloc} {:sourceloc_num 96} _LOG_READ_$$d_finavalu(p1$1, 16bv32, $$d_finavalu[16bv32]);
    assume {:do_not_predicate} {:check_id "check_state_96"} {:captureState "check_state_96"} {:sourceloc} {:sourceloc_num 96} true;
    call {:check_id "check_state_96"} {:sourceloc} {:sourceloc_num 96} _CHECK_READ_$$d_finavalu(p1$2, 16bv32, $$d_finavalu[16bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_finavalu"} true;
    v100$1 := (if p1$1 then $$d_finavalu[16bv32] else v100$1);
    v100$2 := (if p1$2 then $$d_finavalu[16bv32] else v100$2);
    call {:sourceloc} {:sourceloc_num 97} _LOG_WRITE_$$d_finavalu(p1$1, 31bv32, FSUB32(FADD32(FDIV32(FMUL32(FSUB32(2147483648bv32, v98$1), 790091698bv32), FMUL32(v51$1, 1203532416bv32)), FMUL32(FDIV32(681898599bv32, v51$1), FSUB32(v37$1, v36$1))), v100$1), $$d_finavalu[31bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 31bv32);
    assume {:do_not_predicate} {:check_id "check_state_97"} {:captureState "check_state_97"} {:sourceloc} {:sourceloc_num 97} true;
    call {:check_id "check_state_97"} {:sourceloc} {:sourceloc_num 97} _CHECK_WRITE_$$d_finavalu(p1$2, 31bv32, FSUB32(FADD32(FDIV32(FMUL32(FSUB32(2147483648bv32, v98$2), 790091698bv32), FMUL32(v51$2, 1203532416bv32)), FMUL32(FDIV32(681898599bv32, v51$2), FSUB32(v37$2, v36$2))), v100$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[31bv32] := (if p1$1 then FSUB32(FADD32(FDIV32(FMUL32(FSUB32(2147483648bv32, v98$1), 790091698bv32), FMUL32(v51$1, 1203532416bv32)), FMUL32(FDIV32(681898599bv32, v51$1), FSUB32(v37$1, v36$1))), v100$1) else $$d_finavalu[31bv32]);
    $$d_finavalu[31bv32] := (if p1$2 then FSUB32(FADD32(FDIV32(FMUL32(FSUB32(2147483648bv32, v98$2), 790091698bv32), FMUL32(v51$2, 1203532416bv32)), FMUL32(FDIV32(681898599bv32, v51$2), FSUB32(v37$2, v36$2))), v100$2) else $$d_finavalu[31bv32]);
    v101$1 := (if p1$1 then FDIV32(1065353216bv32, v50$1) else v101$1);
    v101$2 := (if p1$2 then FDIV32(1065353216bv32, v50$2) else v101$2);
    call {:sourceloc} {:sourceloc_num 98} _LOG_READ_$$d_finavalu(p1$1, 17bv32, $$d_finavalu[17bv32]);
    assume {:do_not_predicate} {:check_id "check_state_98"} {:captureState "check_state_98"} {:sourceloc} {:sourceloc_num 98} true;
    call {:check_id "check_state_98"} {:sourceloc} {:sourceloc_num 98} _CHECK_READ_$$d_finavalu(p1$2, 17bv32, $$d_finavalu[17bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_finavalu"} true;
    v102$1 := (if p1$1 then $$d_finavalu[17bv32] else v102$1);
    v102$2 := (if p1$2 then $$d_finavalu[17bv32] else v102$2);
    call {:sourceloc} {:sourceloc_num 99} _LOG_WRITE_$$d_finavalu(p1$1, 32bv32, FSUB32(FADD32(FADD32(FDIV32(FMUL32(FMUL32(FSUB32(2147483648bv32, v99$1), 790091698bv32), v101$1), 1203532416bv32), FMUL32(FMUL32(681898599bv32, v101$1), FSUB32(v36$1, v37$1))), FMUL32(FMUL32(736533963bv32, v101$1), FSUB32(v38$1, v37$1))), v102$1), $$d_finavalu[32bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 32bv32);
    assume {:do_not_predicate} {:check_id "check_state_99"} {:captureState "check_state_99"} {:sourceloc} {:sourceloc_num 99} true;
    call {:check_id "check_state_99"} {:sourceloc} {:sourceloc_num 99} _CHECK_WRITE_$$d_finavalu(p1$2, 32bv32, FSUB32(FADD32(FADD32(FDIV32(FMUL32(FMUL32(FSUB32(2147483648bv32, v99$2), 790091698bv32), v101$2), 1203532416bv32), FMUL32(FMUL32(681898599bv32, v101$2), FSUB32(v36$2, v37$2))), FMUL32(FMUL32(736533963bv32, v101$2), FSUB32(v38$2, v37$2))), v102$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[32bv32] := (if p1$1 then FSUB32(FADD32(FADD32(FDIV32(FMUL32(FMUL32(FSUB32(2147483648bv32, v99$1), 790091698bv32), v101$1), 1203532416bv32), FMUL32(FMUL32(681898599bv32, v101$1), FSUB32(v36$1, v37$1))), FMUL32(FMUL32(736533963bv32, v101$1), FSUB32(v38$1, v37$1))), v102$1) else $$d_finavalu[32bv32]);
    $$d_finavalu[32bv32] := (if p1$2 then FSUB32(FADD32(FADD32(FDIV32(FMUL32(FMUL32(FSUB32(2147483648bv32, v99$2), 790091698bv32), v101$2), 1203532416bv32), FMUL32(FMUL32(681898599bv32, v101$2), FSUB32(v36$2, v37$2))), FMUL32(FMUL32(736533963bv32, v101$2), FSUB32(v38$2, v37$2))), v102$2) else $$d_finavalu[32bv32]);
    call {:sourceloc} {:sourceloc_num 100} _LOG_WRITE_$$d_finavalu(p1$1, 33bv32, FMUL32(FDIV32(736533963bv32, v48$1), FSUB32(v37$1, v38$1)), $$d_finavalu[33bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 33bv32);
    assume {:do_not_predicate} {:check_id "check_state_100"} {:captureState "check_state_100"} {:sourceloc} {:sourceloc_num 100} true;
    call {:check_id "check_state_100"} {:sourceloc} {:sourceloc_num 100} _CHECK_WRITE_$$d_finavalu(p1$2, 33bv32, FMUL32(FDIV32(736533963bv32, v48$2), FSUB32(v37$2, v38$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[33bv32] := (if p1$1 then FMUL32(FDIV32(736533963bv32, v48$1), FSUB32(v37$1, v38$1)) else $$d_finavalu[33bv32]);
    $$d_finavalu[33bv32] := (if p1$2 then FMUL32(FDIV32(736533963bv32, v48$2), FSUB32(v37$2, v38$2)) else $$d_finavalu[33bv32]);
    call {:sourceloc} {:sourceloc_num 101} _LOG_WRITE_$$d_finavalu(p1$1, 34bv32, 0bv32, $$d_finavalu[34bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 34bv32);
    assume {:do_not_predicate} {:check_id "check_state_101"} {:captureState "check_state_101"} {:sourceloc} {:sourceloc_num 101} true;
    call {:check_id "check_state_101"} {:sourceloc} {:sourceloc_num 101} _CHECK_WRITE_$$d_finavalu(p1$2, 34bv32, 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[34bv32] := (if p1$1 then 0bv32 else $$d_finavalu[34bv32]);
    $$d_finavalu[34bv32] := (if p1$2 then 0bv32 else $$d_finavalu[34bv32]);
    v103$1 := (if p1$1 then FSUB32(FADD32(FADD32(v70$1, v76$1), v74$1), FMUL32(1073741824bv32, v72$1)) else v103$1);
    v103$2 := (if p1$2 then FSUB32(FADD32(FADD32(v70$2, v76$2), v74$2), FMUL32(1073741824bv32, v72$2)) else v103$2);
    v104$1 := (if p1$1 then FSUB32(FADD32(FADD32(v71$1, v77$1), v75$1), FMUL32(1073741824bv32, v73$1)) else v104$1);
    v104$2 := (if p1$2 then FSUB32(FADD32(FADD32(v71$2, v77$2), v75$2), FMUL32(1073741824bv32, v73$2)) else v104$2);
    call {:sourceloc} {:sourceloc_num 102} _LOG_WRITE_$$d_finavalu(p1$1, 35bv32, FADD32(FADD32(FSUB32(FADD32(FDIV32(FMUL32(FSUB32(2147483648bv32, v103$1), 790091698bv32), FMUL32(FMUL32(v51$1, 1073741824bv32), 1203532416bv32)), FMUL32(FDIV32(728234205bv32, v51$1), FSUB32(v41$1, v40$1))), FADD32(v92$1, v93$1)), FDIV32(FMUL32(v82$1, v49$1), v51$1)), FDIV32(FMUL32(v84$1, v48$1), v51$1)), $$d_finavalu[35bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 35bv32);
    assume {:do_not_predicate} {:check_id "check_state_102"} {:captureState "check_state_102"} {:sourceloc} {:sourceloc_num 102} true;
    call {:check_id "check_state_102"} {:sourceloc} {:sourceloc_num 102} _CHECK_WRITE_$$d_finavalu(p1$2, 35bv32, FADD32(FADD32(FSUB32(FADD32(FDIV32(FMUL32(FSUB32(2147483648bv32, v103$2), 790091698bv32), FMUL32(FMUL32(v51$2, 1073741824bv32), 1203532416bv32)), FMUL32(FDIV32(728234205bv32, v51$2), FSUB32(v41$2, v40$2))), FADD32(v92$2, v93$2)), FDIV32(FMUL32(v82$2, v49$2), v51$2)), FDIV32(FMUL32(v84$2, v48$2), v51$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[35bv32] := (if p1$1 then FADD32(FADD32(FSUB32(FADD32(FDIV32(FMUL32(FSUB32(2147483648bv32, v103$1), 790091698bv32), FMUL32(FMUL32(v51$1, 1073741824bv32), 1203532416bv32)), FMUL32(FDIV32(728234205bv32, v51$1), FSUB32(v41$1, v40$1))), FADD32(v92$1, v93$1)), FDIV32(FMUL32(v82$1, v49$1), v51$1)), FDIV32(FMUL32(v84$1, v48$1), v51$1)) else $$d_finavalu[35bv32]);
    $$d_finavalu[35bv32] := (if p1$2 then FADD32(FADD32(FSUB32(FADD32(FDIV32(FMUL32(FSUB32(2147483648bv32, v103$2), 790091698bv32), FMUL32(FMUL32(v51$2, 1073741824bv32), 1203532416bv32)), FMUL32(FDIV32(728234205bv32, v51$2), FSUB32(v41$2, v40$2))), FADD32(v92$2, v93$2)), FDIV32(FMUL32(v82$2, v49$2), v51$2)), FDIV32(FMUL32(v84$2, v48$2), v51$2)) else $$d_finavalu[35bv32]);
    call {:sourceloc} {:sourceloc_num 103} _LOG_WRITE_$$d_finavalu(p1$1, 36bv32, FSUB32(FADD32(FADD32(FDIV32(FMUL32(FSUB32(2147483648bv32, v104$1), 790091698bv32), FMUL32(FMUL32(v50$1, 1073741824bv32), 1203532416bv32)), FMUL32(FDIV32(728234205bv32, v50$1), FSUB32(v40$1, v41$1))), FMUL32(FDIV32(746785054bv32, v50$1), FSUB32(v42$1, v41$1))), FADD32(v94$1, v95$1)), $$d_finavalu[36bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 36bv32);
    assume {:do_not_predicate} {:check_id "check_state_103"} {:captureState "check_state_103"} {:sourceloc} {:sourceloc_num 103} true;
    call {:check_id "check_state_103"} {:sourceloc} {:sourceloc_num 103} _CHECK_WRITE_$$d_finavalu(p1$2, 36bv32, FSUB32(FADD32(FADD32(FDIV32(FMUL32(FSUB32(2147483648bv32, v104$2), 790091698bv32), FMUL32(FMUL32(v50$2, 1073741824bv32), 1203532416bv32)), FMUL32(FDIV32(728234205bv32, v50$2), FSUB32(v40$2, v41$2))), FMUL32(FDIV32(746785054bv32, v50$2), FSUB32(v42$2, v41$2))), FADD32(v94$2, v95$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[36bv32] := (if p1$1 then FSUB32(FADD32(FADD32(FDIV32(FMUL32(FSUB32(2147483648bv32, v104$1), 790091698bv32), FMUL32(FMUL32(v50$1, 1073741824bv32), 1203532416bv32)), FMUL32(FDIV32(728234205bv32, v50$1), FSUB32(v40$1, v41$1))), FMUL32(FDIV32(746785054bv32, v50$1), FSUB32(v42$1, v41$1))), FADD32(v94$1, v95$1)) else $$d_finavalu[36bv32]);
    $$d_finavalu[36bv32] := (if p1$2 then FSUB32(FADD32(FADD32(FDIV32(FMUL32(FSUB32(2147483648bv32, v104$2), 790091698bv32), FMUL32(FMUL32(v50$2, 1073741824bv32), 1203532416bv32)), FMUL32(FDIV32(728234205bv32, v50$2), FSUB32(v40$2, v41$2))), FMUL32(FDIV32(746785054bv32, v50$2), FSUB32(v42$2, v41$2))), FADD32(v94$2, v95$2)) else $$d_finavalu[36bv32]);
    call {:sourceloc} {:sourceloc_num 104} _LOG_WRITE_$$d_finavalu(p1$1, 37bv32, FADD32(FSUB32(FSUB32(2147483648bv32, v83$1), FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v85$1, v86$1), v87$1), v88$1), v89$1), v90$1), v91$1)), FMUL32(FDIV32(746785054bv32, v48$1), FSUB32(v41$1, v42$1))), $$d_finavalu[37bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 37bv32);
    assume {:do_not_predicate} {:check_id "check_state_104"} {:captureState "check_state_104"} {:sourceloc} {:sourceloc_num 104} true;
    call {:check_id "check_state_104"} {:sourceloc} {:sourceloc_num 104} _CHECK_WRITE_$$d_finavalu(p1$2, 37bv32, FADD32(FSUB32(FSUB32(2147483648bv32, v83$2), FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v85$2, v86$2), v87$2), v88$2), v89$2), v90$2), v91$2)), FMUL32(FDIV32(746785054bv32, v48$2), FSUB32(v41$2, v42$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[37bv32] := (if p1$1 then FADD32(FSUB32(FSUB32(2147483648bv32, v83$1), FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v85$1, v86$1), v87$1), v88$1), v89$1), v90$1), v91$1)), FMUL32(FDIV32(746785054bv32, v48$1), FSUB32(v41$1, v42$1))) else $$d_finavalu[37bv32]);
    $$d_finavalu[37bv32] := (if p1$2 then FADD32(FSUB32(FSUB32(2147483648bv32, v83$2), FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v85$2, v86$2), v87$2), v88$2), v89$2), v90$2), v91$2)), FMUL32(FDIV32(746785054bv32, v48$2), FSUB32(v41$2, v42$2))) else $$d_finavalu[37bv32]);
    p4$1 := (if p1$1 && false then false else p4$1);
    p4$2 := (if p1$2 && false then false else p4$2);
    p5$1 := (if p1$1 && true then true else p5$1);
    p5$2 := (if p1$2 && true then true else p5$2);
    p8$1 := (if p1$1 && false then false else p8$1);
    p8$2 := (if p1$2 && false then false else p8$2);
    p11$1 := (if p1$1 && false then false else p11$1);
    p11$2 := (if p1$2 && false then false else p11$2);
    $I_app.i.1$1 := (if p4$1 then 0bv32 else $I_app.i.1$1);
    $I_app.i.1$2 := (if p4$2 then 0bv32 else $I_app.i.1$2);
    call {:sourceloc_num 107} v105$1, v105$2 := $fmodf(p5$1, v4$1, v5$1, p5$2, v4$2, v5$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$fmodf"} true;
    v106$1 := (if p5$1 then FEQ32(v105$1, 1084227584bv32) || FLT32(v105$1, 1084227584bv32) else v106$1);
    v106$2 := (if p5$2 then FEQ32(v105$2, 1084227584bv32) || FLT32(v105$2, 1084227584bv32) else v106$2);
    p6$1 := (if p5$1 && v106$1 then v106$1 else p6$1);
    p6$2 := (if p5$2 && v106$2 then v106$2 else p6$2);
    p7$1 := (if p5$1 && !v106$1 then !v106$1 else p7$1);
    p7$2 := (if p5$2 && !v106$2 then !v106$2 else p7$2);
    $I_app.i.0$1 := (if p6$1 then 1092091904bv32 else $I_app.i.0$1);
    $I_app.i.0$2 := (if p6$2 then 1092091904bv32 else $I_app.i.0$2);
    $I_app.i.0$1 := (if p7$1 then 0bv32 else $I_app.i.0$1);
    $I_app.i.0$2 := (if p7$2 then 0bv32 else $I_app.i.0$2);
    $I_app.i.1$1 := (if p5$1 then $I_app.i.0$1 else $I_app.i.1$1);
    $I_app.i.1$2 := (if p5$2 then $I_app.i.0$2 else $I_app.i.1$2);
    v107$1 := (if p8$1 then BV32_AND(BV1_ZEXT32((if FLT64(4602678819172646912bv64, FP32_CONV64(v4$1)) then 1bv1 else 0bv1)), BV1_ZEXT32((if FLT64(FP32_CONV64(v4$1), 4641258483168051200bv64) then 1bv1 else 0bv1))) != 0bv32 else v107$1);
    v107$2 := (if p8$2 then BV32_AND(BV1_ZEXT32((if FLT64(4602678819172646912bv64, FP32_CONV64(v4$2)) then 1bv1 else 0bv1)), BV1_ZEXT32((if FLT64(FP32_CONV64(v4$2), 4641258483168051200bv64) then 1bv1 else 0bv1))) != 0bv32 else v107$2);
    p9$1 := (if p8$1 && v107$1 then v107$1 else p9$1);
    p9$2 := (if p8$2 && v107$2 then v107$2 else p9$2);
    p10$1 := (if p8$1 && !v107$1 then !v107$1 else p10$1);
    p10$2 := (if p8$2 && !v107$2 then !v107$2 else p10$2);
    $V_clamp.i.0$1 := (if p9$1 then 0bv32 else $V_clamp.i.0$1);
    $V_clamp.i.0$2 := (if p9$2 then 0bv32 else $V_clamp.i.0$2);
    $V_clamp.i.0$1 := (if p10$1 then 3260809216bv32 else $V_clamp.i.0$1);
    $V_clamp.i.0$2 := (if p10$2 then 3260809216bv32 else $V_clamp.i.0$2);
    $I_app.i.1$1 := (if p8$1 then FDIV32(FSUB32($V_clamp.i.0$1, v43$1), 1025758986bv32) else $I_app.i.1$1);
    $I_app.i.1$2 := (if p8$2 then FDIV32(FSUB32($V_clamp.i.0$2, v43$2), 1025758986bv32) else $I_app.i.1$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v272$1 := (if p11$1 then _HAVOC_bv32$1 else v272$1);
    v272$2 := (if p11$2 then _HAVOC_bv32$2 else v272$2);
    $I_app.i.1$1 := (if p11$1 then v272$1 else $I_app.i.1$1);
    $I_app.i.1$2 := (if p11$2 then v272$2 else $I_app.i.1$2);
    call {:sourceloc} {:sourceloc_num 116} _LOG_WRITE_$$d_finavalu(p1$1, 38bv32, FSUB32(2147483648bv32, FSUB32(FADD32(FADD32(FADD32(FADD32(v98$1, v99$1), FADD32(FADD32(FMUL32(FDIV32(FMUL32(1038174126bv32, 1038123794bv32), FADD32(1065353216bv32, FDIV32(1036831949bv32, v40$1))), FSUB32(v43$1, v57$1)), FMUL32(FDIV32(FMUL32(v52$1, 1038123794bv32), FADD32(1065353216bv32, FDIV32(1036831949bv32, v41$1))), FSUB32(v43$1, v57$1))), FMUL32(1007908028bv32, FSUB32(v43$1, v57$1)))), FADD32(v103$1, v104$1)), FADD32(FADD32(FSUB32(FADD32(FADD32(FADD32(FADD32(FP64_CONV32(FMUL64(FMUL64(FP32_CONV64(FMUL32(1031127695bv32, v13$1)), FADD64(FMUL64(4602678819172646912bv64, FP32_CONV64(v44$1)), FP32_CONV64(v14$1))), FP32_CONV64(FSUB32(v43$1, v56$1)))), FMUL32(FMUL32(FMUL32(1017370378bv32, v15$1), v16$1), FSUB32(v43$1, v56$1))), FMUL32(FMUL32(FMUL32(FP64_CONV32(FMUL64(4584304132692975288bv64, FSQRT64(FDIV64(FP32_CONV64(1085066445bv32), 4617765877924338074bv64)))), v17$1), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FP32_CONV64(FADD32(v43$1, 1107558400bv32)), 4626998257160447590bv64), 4609176140021203710bv64)))))), FSUB32(v43$1, v56$1))), FADD32(FMUL32(FMUL32(FMUL32(1038174126bv32, FP64_CONV32(FMUL64(4589708452245819884bv64, FADD64(4588375386756118217bv64, FDIV64(4596013491724138578bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(13843164534611430605bv64, FP32_CONV64(FP64_CONV32(FADD64(FP32_CONV64(FSUB32(2147483648bv32, v62$1)), 4613937818241073152bv64)))), 4603579539098121011bv64), 4609176140021203710bv64)))))))), FPOW32(v17$1, 1073741824bv32)), FSUB32(v43$1, v64$1)), FMUL32(FMUL32(FMUL32(v52$1, FP64_CONV32(FMUL64(4589708452245819884bv64, FADD64(4588375386756118217bv64, FDIV64(4596013491724138578bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(13843164534611430605bv64, FP32_CONV64(FP64_CONV32(FADD64(FP32_CONV64(FSUB32(2147483648bv32, v63$1)), 4613937818241073152bv64)))), 4603579539098121011bv64), 4609176140021203710bv64)))))))), FPOW32(v18$1, 1073741824bv32)), FSUB32(v43$1, v64$1)))), FP64_CONV32(FMUL64(FMUL64(FMUL64(4606281698874543309bv64, FSQRT64(FDIV64(FP32_CONV64(1085066445bv32), 4617765877924338074bv64))), FP32_CONV64(FDIV32(v68$1, FADD32(v68$1, FP64_CONV32(FDIV64(FADD64(FMUL64(4602521013041703850bv64, FEXP64(FMUL64(FMUL64(4590452086616291300bv64, FSUB64(FADD64(FP32_CONV64(v43$1), 4617851446317258113bv64), FP32_CONV64(v56$1))), 4609176140021203710bv64))), FEXP64(FMUL64(FMUL64(4589059933899478532bv64, FSUB64(FP32_CONV64(FSUB32(v43$1, v56$1)), 4648438821863009812bv64)), 4609176140021203710bv64))), FADD64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13826179658976765516bv64, FADD64(FP32_CONV64(FSUB32(v43$1, v56$1)), 4617037420684610896bv64)), 4609176140021203710bv64))))))))), FP32_CONV64(FSUB32(v43$1, v56$1))))), FMUL32(1073741824bv32, FADD32(v60$1, v61$1))), FP64_CONV32(FMUL64(FP32_CONV64(FMUL32(FMUL32(FMUL32(FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(FMUL32(881915012bv32, FMUL32(FMUL32(v43$1, 1203532416bv32), v45$1))), FADD64(FMUL64(FMUL64(4604930618986332160bv64, FP32_CONV64(v39$1)), FP32_CONV64(FEXP32(FMUL32(FMUL32(v43$1, v45$1), 1069066811bv32)))), FSUB64(9223372036854775808bv64, FMUL64(4604930618986332160bv64, FP32_CONV64(1085066445bv32))))), FP32_CONV64(FSUB32(FEXP32(FMUL32(FMUL32(v43$1, v45$1), 1069066811bv32)), 1065353216bv32)))), v9$1), v10$1), FADD32(FMUL32(1063675494bv32, FSUB32(1065353216bv32, v11$1)), FMUL32(v53$1, FSUB32(1065353216bv32, v12$1)))), FPOW32(1072064102bv32, v46$1))), 4601778099247172813bv64))), FADD32(FMUL32(FMUL32(FMUL32(1038174126bv32, 981668463bv32), v65$1), FSUB32(v43$1, v56$1)), FMUL32(FMUL32(FMUL32(v52$1, 981668463bv32), v65$1), FSUB32(v43$1, v56$1))))), $I_app.i.1$1)), $$d_finavalu[38bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 38bv32);
    assume {:do_not_predicate} {:check_id "check_state_105"} {:captureState "check_state_105"} {:sourceloc} {:sourceloc_num 116} true;
    call {:check_id "check_state_105"} {:sourceloc} {:sourceloc_num 116} _CHECK_WRITE_$$d_finavalu(p1$2, 38bv32, FSUB32(2147483648bv32, FSUB32(FADD32(FADD32(FADD32(FADD32(v98$2, v99$2), FADD32(FADD32(FMUL32(FDIV32(FMUL32(1038174126bv32, 1038123794bv32), FADD32(1065353216bv32, FDIV32(1036831949bv32, v40$2))), FSUB32(v43$2, v57$2)), FMUL32(FDIV32(FMUL32(v52$2, 1038123794bv32), FADD32(1065353216bv32, FDIV32(1036831949bv32, v41$2))), FSUB32(v43$2, v57$2))), FMUL32(1007908028bv32, FSUB32(v43$2, v57$2)))), FADD32(v103$2, v104$2)), FADD32(FADD32(FSUB32(FADD32(FADD32(FADD32(FADD32(FP64_CONV32(FMUL64(FMUL64(FP32_CONV64(FMUL32(1031127695bv32, v13$2)), FADD64(FMUL64(4602678819172646912bv64, FP32_CONV64(v44$2)), FP32_CONV64(v14$2))), FP32_CONV64(FSUB32(v43$2, v56$2)))), FMUL32(FMUL32(FMUL32(1017370378bv32, v15$2), v16$2), FSUB32(v43$2, v56$2))), FMUL32(FMUL32(FMUL32(FP64_CONV32(FMUL64(4584304132692975288bv64, FSQRT64(FDIV64(FP32_CONV64(1085066445bv32), 4617765877924338074bv64)))), v17$2), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FP32_CONV64(FADD32(v43$2, 1107558400bv32)), 4626998257160447590bv64), 4609176140021203710bv64)))))), FSUB32(v43$2, v56$2))), FADD32(FMUL32(FMUL32(FMUL32(1038174126bv32, FP64_CONV32(FMUL64(4589708452245819884bv64, FADD64(4588375386756118217bv64, FDIV64(4596013491724138578bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(13843164534611430605bv64, FP32_CONV64(FP64_CONV32(FADD64(FP32_CONV64(FSUB32(2147483648bv32, v62$2)), 4613937818241073152bv64)))), 4603579539098121011bv64), 4609176140021203710bv64)))))))), FPOW32(v17$2, 1073741824bv32)), FSUB32(v43$2, v64$2)), FMUL32(FMUL32(FMUL32(v52$2, FP64_CONV32(FMUL64(4589708452245819884bv64, FADD64(4588375386756118217bv64, FDIV64(4596013491724138578bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(13843164534611430605bv64, FP32_CONV64(FP64_CONV32(FADD64(FP32_CONV64(FSUB32(2147483648bv32, v63$2)), 4613937818241073152bv64)))), 4603579539098121011bv64), 4609176140021203710bv64)))))))), FPOW32(v18$2, 1073741824bv32)), FSUB32(v43$2, v64$2)))), FP64_CONV32(FMUL64(FMUL64(FMUL64(4606281698874543309bv64, FSQRT64(FDIV64(FP32_CONV64(1085066445bv32), 4617765877924338074bv64))), FP32_CONV64(FDIV32(v68$2, FADD32(v68$2, FP64_CONV32(FDIV64(FADD64(FMUL64(4602521013041703850bv64, FEXP64(FMUL64(FMUL64(4590452086616291300bv64, FSUB64(FADD64(FP32_CONV64(v43$2), 4617851446317258113bv64), FP32_CONV64(v56$2))), 4609176140021203710bv64))), FEXP64(FMUL64(FMUL64(4589059933899478532bv64, FSUB64(FP32_CONV64(FSUB32(v43$2, v56$2)), 4648438821863009812bv64)), 4609176140021203710bv64))), FADD64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13826179658976765516bv64, FADD64(FP32_CONV64(FSUB32(v43$2, v56$2)), 4617037420684610896bv64)), 4609176140021203710bv64))))))))), FP32_CONV64(FSUB32(v43$2, v56$2))))), FMUL32(1073741824bv32, FADD32(v60$2, v61$2))), FP64_CONV32(FMUL64(FP32_CONV64(FMUL32(FMUL32(FMUL32(FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(FMUL32(881915012bv32, FMUL32(FMUL32(v43$2, 1203532416bv32), v45$2))), FADD64(FMUL64(FMUL64(4604930618986332160bv64, FP32_CONV64(v39$2)), FP32_CONV64(FEXP32(FMUL32(FMUL32(v43$2, v45$2), 1069066811bv32)))), FSUB64(9223372036854775808bv64, FMUL64(4604930618986332160bv64, FP32_CONV64(1085066445bv32))))), FP32_CONV64(FSUB32(FEXP32(FMUL32(FMUL32(v43$2, v45$2), 1069066811bv32)), 1065353216bv32)))), v9$2), v10$2), FADD32(FMUL32(1063675494bv32, FSUB32(1065353216bv32, v11$2)), FMUL32(v53$2, FSUB32(1065353216bv32, v12$2)))), FPOW32(1072064102bv32, v46$2))), 4601778099247172813bv64))), FADD32(FMUL32(FMUL32(FMUL32(1038174126bv32, 981668463bv32), v65$2), FSUB32(v43$2, v56$2)), FMUL32(FMUL32(FMUL32(v52$2, 981668463bv32), v65$2), FSUB32(v43$2, v56$2))))), $I_app.i.1$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[38bv32] := (if p1$1 then FSUB32(2147483648bv32, FSUB32(FADD32(FADD32(FADD32(FADD32(v98$1, v99$1), FADD32(FADD32(FMUL32(FDIV32(FMUL32(1038174126bv32, 1038123794bv32), FADD32(1065353216bv32, FDIV32(1036831949bv32, v40$1))), FSUB32(v43$1, v57$1)), FMUL32(FDIV32(FMUL32(v52$1, 1038123794bv32), FADD32(1065353216bv32, FDIV32(1036831949bv32, v41$1))), FSUB32(v43$1, v57$1))), FMUL32(1007908028bv32, FSUB32(v43$1, v57$1)))), FADD32(v103$1, v104$1)), FADD32(FADD32(FSUB32(FADD32(FADD32(FADD32(FADD32(FP64_CONV32(FMUL64(FMUL64(FP32_CONV64(FMUL32(1031127695bv32, v13$1)), FADD64(FMUL64(4602678819172646912bv64, FP32_CONV64(v44$1)), FP32_CONV64(v14$1))), FP32_CONV64(FSUB32(v43$1, v56$1)))), FMUL32(FMUL32(FMUL32(1017370378bv32, v15$1), v16$1), FSUB32(v43$1, v56$1))), FMUL32(FMUL32(FMUL32(FP64_CONV32(FMUL64(4584304132692975288bv64, FSQRT64(FDIV64(FP32_CONV64(1085066445bv32), 4617765877924338074bv64)))), v17$1), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FP32_CONV64(FADD32(v43$1, 1107558400bv32)), 4626998257160447590bv64), 4609176140021203710bv64)))))), FSUB32(v43$1, v56$1))), FADD32(FMUL32(FMUL32(FMUL32(1038174126bv32, FP64_CONV32(FMUL64(4589708452245819884bv64, FADD64(4588375386756118217bv64, FDIV64(4596013491724138578bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(13843164534611430605bv64, FP32_CONV64(FP64_CONV32(FADD64(FP32_CONV64(FSUB32(2147483648bv32, v62$1)), 4613937818241073152bv64)))), 4603579539098121011bv64), 4609176140021203710bv64)))))))), FPOW32(v17$1, 1073741824bv32)), FSUB32(v43$1, v64$1)), FMUL32(FMUL32(FMUL32(v52$1, FP64_CONV32(FMUL64(4589708452245819884bv64, FADD64(4588375386756118217bv64, FDIV64(4596013491724138578bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(13843164534611430605bv64, FP32_CONV64(FP64_CONV32(FADD64(FP32_CONV64(FSUB32(2147483648bv32, v63$1)), 4613937818241073152bv64)))), 4603579539098121011bv64), 4609176140021203710bv64)))))))), FPOW32(v18$1, 1073741824bv32)), FSUB32(v43$1, v64$1)))), FP64_CONV32(FMUL64(FMUL64(FMUL64(4606281698874543309bv64, FSQRT64(FDIV64(FP32_CONV64(1085066445bv32), 4617765877924338074bv64))), FP32_CONV64(FDIV32(v68$1, FADD32(v68$1, FP64_CONV32(FDIV64(FADD64(FMUL64(4602521013041703850bv64, FEXP64(FMUL64(FMUL64(4590452086616291300bv64, FSUB64(FADD64(FP32_CONV64(v43$1), 4617851446317258113bv64), FP32_CONV64(v56$1))), 4609176140021203710bv64))), FEXP64(FMUL64(FMUL64(4589059933899478532bv64, FSUB64(FP32_CONV64(FSUB32(v43$1, v56$1)), 4648438821863009812bv64)), 4609176140021203710bv64))), FADD64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13826179658976765516bv64, FADD64(FP32_CONV64(FSUB32(v43$1, v56$1)), 4617037420684610896bv64)), 4609176140021203710bv64))))))))), FP32_CONV64(FSUB32(v43$1, v56$1))))), FMUL32(1073741824bv32, FADD32(v60$1, v61$1))), FP64_CONV32(FMUL64(FP32_CONV64(FMUL32(FMUL32(FMUL32(FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(FMUL32(881915012bv32, FMUL32(FMUL32(v43$1, 1203532416bv32), v45$1))), FADD64(FMUL64(FMUL64(4604930618986332160bv64, FP32_CONV64(v39$1)), FP32_CONV64(FEXP32(FMUL32(FMUL32(v43$1, v45$1), 1069066811bv32)))), FSUB64(9223372036854775808bv64, FMUL64(4604930618986332160bv64, FP32_CONV64(1085066445bv32))))), FP32_CONV64(FSUB32(FEXP32(FMUL32(FMUL32(v43$1, v45$1), 1069066811bv32)), 1065353216bv32)))), v9$1), v10$1), FADD32(FMUL32(1063675494bv32, FSUB32(1065353216bv32, v11$1)), FMUL32(v53$1, FSUB32(1065353216bv32, v12$1)))), FPOW32(1072064102bv32, v46$1))), 4601778099247172813bv64))), FADD32(FMUL32(FMUL32(FMUL32(1038174126bv32, 981668463bv32), v65$1), FSUB32(v43$1, v56$1)), FMUL32(FMUL32(FMUL32(v52$1, 981668463bv32), v65$1), FSUB32(v43$1, v56$1))))), $I_app.i.1$1)) else $$d_finavalu[38bv32]);
    $$d_finavalu[38bv32] := (if p1$2 then FSUB32(2147483648bv32, FSUB32(FADD32(FADD32(FADD32(FADD32(v98$2, v99$2), FADD32(FADD32(FMUL32(FDIV32(FMUL32(1038174126bv32, 1038123794bv32), FADD32(1065353216bv32, FDIV32(1036831949bv32, v40$2))), FSUB32(v43$2, v57$2)), FMUL32(FDIV32(FMUL32(v52$2, 1038123794bv32), FADD32(1065353216bv32, FDIV32(1036831949bv32, v41$2))), FSUB32(v43$2, v57$2))), FMUL32(1007908028bv32, FSUB32(v43$2, v57$2)))), FADD32(v103$2, v104$2)), FADD32(FADD32(FSUB32(FADD32(FADD32(FADD32(FADD32(FP64_CONV32(FMUL64(FMUL64(FP32_CONV64(FMUL32(1031127695bv32, v13$2)), FADD64(FMUL64(4602678819172646912bv64, FP32_CONV64(v44$2)), FP32_CONV64(v14$2))), FP32_CONV64(FSUB32(v43$2, v56$2)))), FMUL32(FMUL32(FMUL32(1017370378bv32, v15$2), v16$2), FSUB32(v43$2, v56$2))), FMUL32(FMUL32(FMUL32(FP64_CONV32(FMUL64(4584304132692975288bv64, FSQRT64(FDIV64(FP32_CONV64(1085066445bv32), 4617765877924338074bv64)))), v17$2), FP64_CONV32(FDIV64(4607182418800017408bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FP32_CONV64(FADD32(v43$2, 1107558400bv32)), 4626998257160447590bv64), 4609176140021203710bv64)))))), FSUB32(v43$2, v56$2))), FADD32(FMUL32(FMUL32(FMUL32(1038174126bv32, FP64_CONV32(FMUL64(4589708452245819884bv64, FADD64(4588375386756118217bv64, FDIV64(4596013491724138578bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(13843164534611430605bv64, FP32_CONV64(FP64_CONV32(FADD64(FP32_CONV64(FSUB32(2147483648bv32, v62$2)), 4613937818241073152bv64)))), 4603579539098121011bv64), 4609176140021203710bv64)))))))), FPOW32(v17$2, 1073741824bv32)), FSUB32(v43$2, v64$2)), FMUL32(FMUL32(FMUL32(v52$2, FP64_CONV32(FMUL64(4589708452245819884bv64, FADD64(4588375386756118217bv64, FDIV64(4596013491724138578bv64, FADD64(4607182418800017408bv64, FEXP64(FMUL64(FDIV64(FADD64(13843164534611430605bv64, FP32_CONV64(FP64_CONV32(FADD64(FP32_CONV64(FSUB32(2147483648bv32, v63$2)), 4613937818241073152bv64)))), 4603579539098121011bv64), 4609176140021203710bv64)))))))), FPOW32(v18$2, 1073741824bv32)), FSUB32(v43$2, v64$2)))), FP64_CONV32(FMUL64(FMUL64(FMUL64(4606281698874543309bv64, FSQRT64(FDIV64(FP32_CONV64(1085066445bv32), 4617765877924338074bv64))), FP32_CONV64(FDIV32(v68$2, FADD32(v68$2, FP64_CONV32(FDIV64(FADD64(FMUL64(4602521013041703850bv64, FEXP64(FMUL64(FMUL64(4590452086616291300bv64, FSUB64(FADD64(FP32_CONV64(v43$2), 4617851446317258113bv64), FP32_CONV64(v56$2))), 4609176140021203710bv64))), FEXP64(FMUL64(FMUL64(4589059933899478532bv64, FSUB64(FP32_CONV64(FSUB32(v43$2, v56$2)), 4648438821863009812bv64)), 4609176140021203710bv64))), FADD64(4607182418800017408bv64, FEXP64(FMUL64(FMUL64(13826179658976765516bv64, FADD64(FP32_CONV64(FSUB32(v43$2, v56$2)), 4617037420684610896bv64)), 4609176140021203710bv64))))))))), FP32_CONV64(FSUB32(v43$2, v56$2))))), FMUL32(1073741824bv32, FADD32(v60$2, v61$2))), FP64_CONV32(FMUL64(FP32_CONV64(FMUL32(FMUL32(FMUL32(FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(FMUL32(881915012bv32, FMUL32(FMUL32(v43$2, 1203532416bv32), v45$2))), FADD64(FMUL64(FMUL64(4604930618986332160bv64, FP32_CONV64(v39$2)), FP32_CONV64(FEXP32(FMUL32(FMUL32(v43$2, v45$2), 1069066811bv32)))), FSUB64(9223372036854775808bv64, FMUL64(4604930618986332160bv64, FP32_CONV64(1085066445bv32))))), FP32_CONV64(FSUB32(FEXP32(FMUL32(FMUL32(v43$2, v45$2), 1069066811bv32)), 1065353216bv32)))), v9$2), v10$2), FADD32(FMUL32(1063675494bv32, FSUB32(1065353216bv32, v11$2)), FMUL32(v53$2, FSUB32(1065353216bv32, v12$2)))), FPOW32(1072064102bv32, v46$2))), 4601778099247172813bv64))), FADD32(FMUL32(FMUL32(FMUL32(1038174126bv32, 981668463bv32), v65$2), FSUB32(v43$2, v56$2)), FMUL32(FMUL32(FMUL32(v52$2, 981668463bv32), v65$2), FSUB32(v43$2, v56$2))))), $I_app.i.1$2)) else $$d_finavalu[38bv32]);
    call {:sourceloc} {:sourceloc_num 117} _LOG_WRITE_$$d_finavalu(p1$1, 40bv32, 0bv32, $$d_finavalu[40bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 40bv32);
    assume {:do_not_predicate} {:check_id "check_state_106"} {:captureState "check_state_106"} {:sourceloc} {:sourceloc_num 117} true;
    call {:check_id "check_state_106"} {:sourceloc} {:sourceloc_num 117} _CHECK_WRITE_$$d_finavalu(p1$2, 40bv32, 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[40bv32] := (if p1$1 then 0bv32 else $$d_finavalu[40bv32]);
    $$d_finavalu[40bv32] := (if p1$2 then 0bv32 else $$d_finavalu[40bv32]);
    call {:sourceloc} {:sourceloc_num 118} _LOG_WRITE_$$d_finavalu(p1$1, 41bv32, 0bv32, $$d_finavalu[41bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p1$2, 41bv32);
    assume {:do_not_predicate} {:check_id "check_state_107"} {:captureState "check_state_107"} {:sourceloc} {:sourceloc_num 118} true;
    call {:check_id "check_state_107"} {:sourceloc} {:sourceloc_num 118} _CHECK_WRITE_$$d_finavalu(p1$2, 41bv32, 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[41bv32] := (if p1$1 then 0bv32 else $$d_finavalu[41bv32]);
    $$d_finavalu[41bv32] := (if p1$2 then 0bv32 else $$d_finavalu[41bv32]);
    v108$1 := (if p13$1 then v0$1 == 1bv32 else v108$1);
    v108$2 := (if p13$2 then v0$2 == 1bv32 else v108$2);
    p14$1 := (if p13$1 && v108$1 then v108$1 else p14$1);
    p14$2 := (if p13$2 && v108$2 then v108$2 else p14$2);
    v109$1 := (if p14$1 then v1$1 == 0bv32 else v109$1);
    v109$2 := (if p14$2 then v1$2 == 0bv32 else v109$2);
    p15$1 := (if p14$1 && v109$1 then v109$1 else p15$1);
    p15$2 := (if p14$2 && v109$2 then v109$2 else p15$2);
    v110$1 := (if p15$1 then $$d_initvalu[35bv32] else v110$1);
    v110$2 := (if p15$2 then $$d_initvalu[35bv32] else v110$2);
    v111$1 := (if p15$1 then FP64_CONV32(FMUL64(FP32_CONV64(v110$1), 4652007308841189376bv64)) else v111$1);
    v111$2 := (if p15$2 then FP64_CONV32(FMUL64(FP32_CONV64(v110$2), 4652007308841189376bv64)) else v111$2);
    v112$1 := (if p15$1 then $$d_params[1bv32] else v112$1);
    v112$2 := (if p15$2 then $$d_params[1bv32] else v112$2);
    v113$1 := (if p15$1 then $$d_params[2bv32] else v113$1);
    v113$2 := (if p15$2 then $$d_params[2bv32] else v113$2);
    v114$1 := (if p15$1 then $$d_params[3bv32] else v114$1);
    v114$2 := (if p15$2 then $$d_params[3bv32] else v114$2);
    v115$1 := (if p15$1 then $$d_params[4bv32] else v115$1);
    v115$2 := (if p15$2 then $$d_params[4bv32] else v115$2);
    v116$1 := (if p15$1 then $$d_params[16bv32] else v116$1);
    v116$2 := (if p15$2 then $$d_params[16bv32] else v116$2);
    v117$1 := (if p15$1 then $$d_params[17bv32] else v117$1);
    v117$2 := (if p15$2 then $$d_params[17bv32] else v117$2);
    v118$1 := (if p15$1 then $$d_initvalu[46bv32] else v118$1);
    v118$2 := (if p15$2 then $$d_initvalu[46bv32] else v118$2);
    v119$1 := (if p15$1 then $$d_initvalu[47bv32] else v119$1);
    v119$2 := (if p15$2 then $$d_initvalu[47bv32] else v119$2);
    v120$1 := (if p15$1 then $$d_initvalu[48bv32] else v120$1);
    v120$2 := (if p15$2 then $$d_initvalu[48bv32] else v120$2);
    v121$1 := (if p15$1 then $$d_initvalu[49bv32] else v121$1);
    v121$2 := (if p15$2 then $$d_initvalu[49bv32] else v121$2);
    v122$1 := (if p15$1 then $$d_initvalu[50bv32] else v122$1);
    v122$2 := (if p15$2 then $$d_initvalu[50bv32] else v122$2);
    v123$1 := (if p15$1 then $$d_initvalu[51bv32] else v123$1);
    v123$2 := (if p15$2 then $$d_initvalu[51bv32] else v123$2);
    v124$1 := (if p15$1 then $$d_initvalu[52bv32] else v124$1);
    v124$2 := (if p15$2 then $$d_initvalu[52bv32] else v124$2);
    v125$1 := (if p15$1 then $$d_initvalu[53bv32] else v125$1);
    v125$2 := (if p15$2 then $$d_initvalu[53bv32] else v125$2);
    v126$1 := (if p15$1 then $$d_initvalu[54bv32] else v126$1);
    v126$2 := (if p15$2 then $$d_initvalu[54bv32] else v126$2);
    v127$1 := (if p15$1 then $$d_initvalu[55bv32] else v127$1);
    v127$2 := (if p15$2 then $$d_initvalu[55bv32] else v127$2);
    v128$1 := (if p15$1 then $$d_initvalu[56bv32] else v128$1);
    v128$2 := (if p15$2 then $$d_initvalu[56bv32] else v128$2);
    v129$1 := (if p15$1 then $$d_initvalu[57bv32] else v129$1);
    v129$2 := (if p15$2 then $$d_initvalu[57bv32] else v129$2);
    v130$1 := (if p15$1 then $$d_initvalu[58bv32] else v130$1);
    v130$2 := (if p15$2 then $$d_initvalu[58bv32] else v130$2);
    v131$1 := (if p15$1 then $$d_initvalu[59bv32] else v131$1);
    v131$2 := (if p15$2 then $$d_initvalu[59bv32] else v131$2);
    v132$1 := (if p15$1 then $$d_initvalu[60bv32] else v132$1);
    v132$2 := (if p15$2 then $$d_initvalu[60bv32] else v132$2);
    v133$1 := (if p15$1 then FEQ32(v117$1, 1065353216bv32) || FLT32(v117$1, 1065353216bv32) else v133$1);
    v133$2 := (if p15$2 then FEQ32(v117$2, 1065353216bv32) || FLT32(v117$2, 1065353216bv32) else v133$2);
    p16$1 := (if p15$1 && v133$1 then v133$1 else p16$1);
    p16$2 := (if p15$2 && v133$2 then v133$2 else p16$2);
    p17$1 := (if p15$1 && !v133$1 then !v133$1 else p17$1);
    p17$2 := (if p15$2 && !v133$2 then !v133$2 else p17$2);
    $Kd02.i.0$1, $Kd24.i.0$1 := (if p16$1 then FP64_CONV32(FMUL64(FMUL64(4567911030049346683bv64, FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$1), 4606641986844732948bv64)), FDIV64(FP32_CONV64(v117$1), 4578071150808694522bv64))), FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$1), 4620749512677471027bv64)), FDIV64(FP32_CONV64(v117$1), 4581998289683761594bv64)))) else $Kd02.i.0$1), (if p16$1 then FP64_CONV32(FMUL64(FMUL64(4593779706308962812bv64, FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$1), 4603939827068310651bv64)), FDIV64(FP32_CONV64(v117$1), 4564099183324740295bv64))), FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$1), 4623507967449235456bv64)), FDIV64(FP32_CONV64(v117$1), 4594680426234436911bv64)))) else $Kd24.i.0$1);
    $Kd02.i.0$2, $Kd24.i.0$2 := (if p16$2 then FP64_CONV32(FMUL64(FMUL64(4567911030049346683bv64, FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$2), 4606641986844732948bv64)), FDIV64(FP32_CONV64(v117$2), 4578071150808694522bv64))), FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$2), 4620749512677471027bv64)), FDIV64(FP32_CONV64(v117$2), 4581998289683761594bv64)))) else $Kd02.i.0$2), (if p16$2 then FP64_CONV32(FMUL64(FMUL64(4593779706308962812bv64, FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$2), 4603939827068310651bv64)), FDIV64(FP32_CONV64(v117$2), 4564099183324740295bv64))), FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$2), 4623507967449235456bv64)), FDIV64(FP32_CONV64(v117$2), 4594680426234436911bv64)))) else $Kd24.i.0$2);
    $Kd02.i.0$1, $Kd24.i.0$1 := (if p17$1 then FP64_CONV32(FMUL64(FMUL64(4567911030049346683bv64, FADD64(FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$1), 4606641986844732948bv64)), 4635564478951675221bv64), FDIV64(FP32_CONV64(FSUB32(v117$1, 1065353216bv32)), 4588807732320345784bv64))), FADD64(FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$1), 4620749512677471027bv64)), 4631593975871105211bv64), FDIV64(FP32_CONV64(FSUB32(v117$1, 1065353216bv32)), 4589564337057744028bv64)))) else $Kd02.i.0$1), (if p17$1 then FP64_CONV32(FMUL64(FMUL64(4593779706308962812bv64, FADD64(FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$1), 4603939827068310651bv64)), 4649494139406272805bv64), FDIV64(FP32_CONV64(FSUB32(v117$1, 1065353216bv32)), 4572414629676717179bv64))), FADD64(FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$1), 4623507967449235456bv64)), 4619044841347927930bv64), FDIV64(FP32_CONV64(FSUB32(v117$1, 1065353216bv32)), 4594572339843380019bv64)))) else $Kd24.i.0$1);
    $Kd02.i.0$2, $Kd24.i.0$2 := (if p17$2 then FP64_CONV32(FMUL64(FMUL64(4567911030049346683bv64, FADD64(FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$2), 4606641986844732948bv64)), 4635564478951675221bv64), FDIV64(FP32_CONV64(FSUB32(v117$2, 1065353216bv32)), 4588807732320345784bv64))), FADD64(FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$2), 4620749512677471027bv64)), 4631593975871105211bv64), FDIV64(FP32_CONV64(FSUB32(v117$2, 1065353216bv32)), 4589564337057744028bv64)))) else $Kd02.i.0$2), (if p17$2 then FP64_CONV32(FMUL64(FMUL64(4593779706308962812bv64, FADD64(FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$2), 4603939827068310651bv64)), 4649494139406272805bv64), FDIV64(FP32_CONV64(FSUB32(v117$2, 1065353216bv32)), 4572414629676717179bv64))), FADD64(FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v116$2), 4623507967449235456bv64)), 4619044841347927930bv64), FDIV64(FP32_CONV64(FSUB32(v117$2, 1065353216bv32)), 4594572339843380019bv64)))) else $Kd24.i.0$2);
    v134$1 := (if p15$1 then FDIV32(1092616192bv32, $Kd02.i.0$1) else v134$1);
    v134$2 := (if p15$2 then FDIV32(1092616192bv32, $Kd02.i.0$2) else v134$2);
    v135$1 := (if p15$1 then FDIV32(1140457472bv32, $Kd24.i.0$1) else v135$1);
    v135$2 := (if p15$2 then FDIV32(1140457472bv32, $Kd24.i.0$2) else v135$2);
    v136$1 := (if p15$1 then FP64_CONV32(FDIV64(FP32_CONV64(985104436bv32), 4596373779694328218bv64)) else v136$1);
    v136$2 := (if p15$2 then FP64_CONV32(FDIV64(FP32_CONV64(985104436bv32), 4596373779694328218bv64)) else v136$2);
    v137$1 := (if p15$1 then FDIV32(985104436bv32, 1120403456bv32) else v137$1);
    v137$2 := (if p15$2 then FDIV32(985104436bv32, 1120403456bv32) else v137$2);
    v138$1 := (if p15$1 then FP64_CONV32(FDIV64(FP32_CONV64(1074580685bv32), 4584988679836335604bv64)) else v138$1);
    v138$2 := (if p15$2 then FP64_CONV32(FDIV64(FP32_CONV64(1074580685bv32), 4584988679836335604bv64)) else v138$2);
    v139$1 := (if p15$1 then FMUL32(1159512064bv32, 984245443bv32) else v139$1);
    v139$2 := (if p15$2 then FMUL32(1159512064bv32, 984245443bv32) else v139$2);
    v140$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v134$1, FPOW32(v111$1, 1073741824bv32)), v118$1), FSUB32(2147483648bv32, FMUL32(1092616192bv32, v119$1))) else v140$1);
    v140$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v134$2, FPOW32(v111$2, 1073741824bv32)), v118$2), FSUB32(2147483648bv32, FMUL32(1092616192bv32, v119$2))) else v140$2);
    v141$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v135$1, FPOW32(v111$1, 1073741824bv32)), v119$1), FSUB32(2147483648bv32, FMUL32(1140457472bv32, v120$1))) else v141$1);
    v141$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v135$2, FPOW32(v111$2, 1073741824bv32)), v119$2), FSUB32(2147483648bv32, FMUL32(1140457472bv32, v120$2))) else v141$2);
    v142$1 := (if p15$1 then FSUB32(FSUB32(FSUB32(v112$1, v121$1), v122$1), v123$1) else v142$1);
    v142$2 := (if p15$2 then FSUB32(FSUB32(FSUB32(v112$2, v121$2), v122$2), v123$2) else v142$2);
    v143$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v134$1, FPOW32(v111$1, 1073741824bv32)), v121$1), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1120403456bv32), v122$1))) else v143$1);
    v143$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v134$2, FPOW32(v111$2, 1073741824bv32)), v121$2), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1120403456bv32), v122$2))) else v143$2);
    v144$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v135$1, FPOW32(v111$1, 1073741824bv32)), v122$1), FSUB32(2147483648bv32, FMUL32(1140457472bv32, v123$1))) else v144$1);
    v144$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v135$2, FPOW32(v111$2, 1073741824bv32)), v122$2), FSUB32(2147483648bv32, FMUL32(1140457472bv32, v123$2))) else v144$2);
    v145$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v136$1, v118$1), v142$1), FSUB32(2147483648bv32, FMUL32(985104436bv32, v121$1))) else v145$1);
    v145$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v136$2, v118$2), v142$2), FSUB32(2147483648bv32, FMUL32(985104436bv32, v121$2))) else v145$2);
    v146$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v136$1, v119$1), v142$1), FSUB32(2147483648bv32, FMUL32(v137$1, v122$1))) else v146$1);
    v146$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v136$2, v119$2), v142$2), FSUB32(2147483648bv32, FMUL32(v137$2, v122$2))) else v146$2);
    v147$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v136$1, v120$1), v142$1), FSUB32(2147483648bv32, FMUL32(v137$1, v123$1))) else v147$1);
    v147$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v136$2, v120$2), v142$2), FSUB32(2147483648bv32, FMUL32(v137$2, v123$2))) else v147$2);
    v148$1 := (if p15$1 then FADD32(FMUL32(FMUL32(FP64_CONV32(FDIV64(FP32_CONV64(1065353216bv32), 4602678819172646912bv64)), FPOW32(v111$1, 1073741824bv32)), FSUB32(FSUB32(FSUB32(FSUB32(v114$1, v129$1), v130$1), v131$1), v132$1)), FSUB32(2147483648bv32, FMUL32(1065353216bv32, v129$1))) else v148$1);
    v148$2 := (if p15$2 then FADD32(FMUL32(FMUL32(FP64_CONV32(FDIV64(FP32_CONV64(1065353216bv32), 4602678819172646912bv64)), FPOW32(v111$2, 1073741824bv32)), FSUB32(FSUB32(FSUB32(FSUB32(v114$2, v129$2), v130$2), v131$2), v132$2)), FSUB32(2147483648bv32, FMUL32(1065353216bv32, v129$2))) else v148$2);
    v149$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v134$1, FPOW32(v111$1, 1073741824bv32)), v130$1), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1126498304bv32), v131$1))) else v149$1);
    v149$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v134$2, FPOW32(v111$2, 1073741824bv32)), v130$2), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1126498304bv32), v131$2))) else v149$2);
    v150$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v135$1, FPOW32(v111$1, 1073741824bv32)), v131$1), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1159512064bv32), v132$1))) else v150$1);
    v150$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v135$2, FPOW32(v111$2, 1073741824bv32)), v131$2), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1159512064bv32), v132$2))) else v150$2);
    v151$1 := (if p15$1 then FADD32(FMUL32(FMUL32(1110966272bv32, v118$1), v129$1), FSUB32(2147483648bv32, FMUL32(FMUL32(1126498304bv32, v139$1), v130$1))) else v151$1);
    v151$2 := (if p15$2 then FADD32(FMUL32(FMUL32(1110966272bv32, v118$2), v129$2), FSUB32(2147483648bv32, FMUL32(FMUL32(1126498304bv32, v139$2), v130$2))) else v151$2);
    v152$1 := (if p15$1 then FADD32(FMUL32(FMUL32(1110966272bv32, v119$1), v129$1), FSUB32(2147483648bv32, FMUL32(v139$1, v131$1))) else v152$1);
    v152$2 := (if p15$2 then FADD32(FMUL32(FMUL32(1110966272bv32, v119$2), v129$2), FSUB32(2147483648bv32, FMUL32(v139$2, v131$2))) else v152$2);
    v153$1 := (if p15$1 then FADD32(FMUL32(FMUL32(1110966272bv32, v120$1), v129$1), FSUB32(2147483648bv32, FMUL32(984245443bv32, v132$1))) else v153$1);
    v153$2 := (if p15$2 then FADD32(FMUL32(FMUL32(1110966272bv32, v120$2), v129$2), FSUB32(2147483648bv32, FMUL32(984245443bv32, v132$2))) else v153$2);
    v154$1 := (if p15$1 then FSUB32(FSUB32(FSUB32(FSUB32(FSUB32(1065353216bv32, v124$1), v125$1), v126$1), v127$1), v128$1) else v154$1);
    v154$2 := (if p15$2 then FSUB32(FSUB32(FSUB32(FSUB32(FSUB32(1065353216bv32, v124$2), v125$2), v126$2), v127$2), v128$2) else v154$2);
    v155$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v138$1, v119$1), v154$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v138$1, 1084227584bv32), v124$1))) else v155$1);
    v155$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v138$2, v119$2), v154$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v138$2, 1084227584bv32), v124$2))) else v155$2);
    v156$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v135$1, FPOW32(v111$1, 1073741824bv32)), v124$1), FSUB32(2147483648bv32, FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(1140457472bv32), 4584988679836335604bv64), 4617315517961601024bv64)), v125$1))) else v156$1);
    v156$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v135$2, FPOW32(v111$2, 1073741824bv32)), v124$2), FSUB32(2147483648bv32, FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(1140457472bv32), 4584988679836335604bv64), 4617315517961601024bv64)), v125$2))) else v156$2);
    v157$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v138$1, v120$1), v154$1), FSUB32(2147483648bv32, FMUL32(1074580685bv32, v125$1))) else v157$1);
    v157$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v138$2, v120$2), v154$2), FSUB32(2147483648bv32, FMUL32(1074580685bv32, v125$2))) else v157$2);
    v158$1 := (if p15$1 then FADD32(FADD32(FADD32(v125$1, v126$1), v127$1), v128$1) else v158$1);
    v158$2 := (if p15$2 then FADD32(FADD32(FADD32(v125$2, v126$2), v127$2), v128$2) else v158$2);
    v159$1 := (if p15$1 then FADD32(FMUL32(FP64_CONV32(FADD64(FMUL64(4579800533065604792bv64, FP32_CONV64(FPOW32(v158$1, 1077936128bv32))), FADD64(FMUL64(4588087156379966505bv64, FP32_CONV64(v158$1)), FMUL64(4575181641287773612bv64, FP32_CONV64(FPOW32(v158$1, 1073741824bv32)))))), v125$1), FSUB32(2147483648bv32, FDIV32(FMUL32(FMUL32(1071393014bv32, v115$1), v126$1), FADD32(FMUL32(v113$1, v126$1), 1094189056bv32)))) else v159$1);
    v159$2 := (if p15$2 then FADD32(FMUL32(FP64_CONV32(FADD64(FMUL64(4579800533065604792bv64, FP32_CONV64(FPOW32(v158$2, 1077936128bv32))), FADD64(FMUL64(4588087156379966505bv64, FP32_CONV64(v158$2)), FMUL64(4575181641287773612bv64, FP32_CONV64(FPOW32(v158$2, 1073741824bv32)))))), v125$2), FSUB32(2147483648bv32, FDIV32(FMUL32(FMUL32(1071393014bv32, v115$2), v126$2), FADD32(FMUL32(v113$2, v126$2), 1094189056bv32)))) else v159$2);
    v160$1 := (if p15$1 then FADD32(FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(1140457472bv32), 4540068552173843632bv64), 4617315517961601024bv64)), v126$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v135$1, FPOW32(v111$1, 1073741824bv32)), v127$1))) else v160$1);
    v160$2 := (if p15$2 then FADD32(FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(1140457472bv32), 4540068552173843632bv64), 4617315517961601024bv64)), v126$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v135$2, FPOW32(v111$2, 1073741824bv32)), v127$2))) else v160$2);
    v161$1 := (if p15$1 then FADD32(FMUL32(FDIV32(1074580685bv32, 1148846080bv32), v126$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v138$1, v120$1), v128$1))) else v161$1);
    v161$2 := (if p15$2 then FADD32(FMUL32(FDIV32(1074580685bv32, 1148846080bv32), v126$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v138$2, v120$2), v128$2))) else v161$2);
    v162$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v138$1, 1084227584bv32), v127$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v138$1, v119$1), v128$1))) else v162$1);
    v162$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v138$2, 1084227584bv32), v127$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v138$2, v119$2), v128$2))) else v162$2);
    v163$1 := (if p15$1 then FDIV32(FMUL32(FMUL32(1071393014bv32, v115$1), v127$1), FADD32(FMUL32(v113$1, v127$1), 1094189056bv32)) else v163$1);
    v163$2 := (if p15$2 then FDIV32(FMUL32(FMUL32(1071393014bv32, v115$2), v127$2), FADD32(FMUL32(v113$2, v127$2), 1094189056bv32)) else v163$2);
    call {:sourceloc} {:sourceloc_num 148} _LOG_WRITE_$$d_finavalu(p15$1, 46bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(2147483648bv32, v140$1), v145$1), v151$1)))), $$d_finavalu[46bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 46bv32);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 148} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 148} _CHECK_WRITE_$$d_finavalu(p15$2, 46bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(2147483648bv32, v140$2), v145$2), v151$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[46bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(2147483648bv32, v140$1), v145$1), v151$1)))) else $$d_finavalu[46bv32]);
    $$d_finavalu[46bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(2147483648bv32, v140$2), v145$2), v151$2)))) else $$d_finavalu[46bv32]);
    call {:sourceloc} {:sourceloc_num 149} _LOG_WRITE_$$d_finavalu(p15$1, 47bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(FSUB32(v140$1, v141$1), v146$1), v152$1), FMUL32(v113$1, FADD32(FSUB32(2147483648bv32, v155$1), v162$1)))))), $$d_finavalu[47bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 47bv32);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 149} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 149} _CHECK_WRITE_$$d_finavalu(p15$2, 47bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(FSUB32(v140$2, v141$2), v146$2), v152$2), FMUL32(v113$2, FADD32(FSUB32(2147483648bv32, v155$2), v162$2)))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[47bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(FSUB32(v140$1, v141$1), v146$1), v152$1), FMUL32(v113$1, FADD32(FSUB32(2147483648bv32, v155$1), v162$1)))))) else $$d_finavalu[47bv32]);
    $$d_finavalu[47bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(FSUB32(v140$2, v141$2), v146$2), v152$2), FMUL32(v113$2, FADD32(FSUB32(2147483648bv32, v155$2), v162$2)))))) else $$d_finavalu[47bv32]);
    call {:sourceloc} {:sourceloc_num 150} _LOG_WRITE_$$d_finavalu(p15$1, 48bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(v141$1, v147$1), v153$1), FMUL32(v113$1, FADD32(FSUB32(2147483648bv32, v157$1), v161$1)))))), $$d_finavalu[48bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 48bv32);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 150} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 150} _CHECK_WRITE_$$d_finavalu(p15$2, 48bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(v141$2, v147$2), v153$2), FMUL32(v113$2, FADD32(FSUB32(2147483648bv32, v157$2), v161$2)))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[48bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(v141$1, v147$1), v153$1), FMUL32(v113$1, FADD32(FSUB32(2147483648bv32, v157$1), v161$1)))))) else $$d_finavalu[48bv32]);
    $$d_finavalu[48bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(v141$2, v147$2), v153$2), FMUL32(v113$2, FADD32(FSUB32(2147483648bv32, v157$2), v161$2)))))) else $$d_finavalu[48bv32]);
    call {:sourceloc} {:sourceloc_num 151} _LOG_WRITE_$$d_finavalu(p15$1, 49bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v145$1, v143$1)))), $$d_finavalu[49bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 49bv32);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 151} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 151} _CHECK_WRITE_$$d_finavalu(p15$2, 49bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v145$2, v143$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[49bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v145$1, v143$1)))) else $$d_finavalu[49bv32]);
    $$d_finavalu[49bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v145$2, v143$2)))) else $$d_finavalu[49bv32]);
    call {:sourceloc} {:sourceloc_num 152} _LOG_WRITE_$$d_finavalu(p15$1, 50bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v143$1, v146$1), v144$1)))), $$d_finavalu[50bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 50bv32);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 152} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 152} _CHECK_WRITE_$$d_finavalu(p15$2, 50bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v143$2, v146$2), v144$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[50bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v143$1, v146$1), v144$1)))) else $$d_finavalu[50bv32]);
    $$d_finavalu[50bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v143$2, v146$2), v144$2)))) else $$d_finavalu[50bv32]);
    call {:sourceloc} {:sourceloc_num 153} _LOG_WRITE_$$d_finavalu(p15$1, 51bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v144$1, v147$1)))), $$d_finavalu[51bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 51bv32);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 153} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 153} _CHECK_WRITE_$$d_finavalu(p15$2, 51bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v144$2, v147$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[51bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v144$1, v147$1)))) else $$d_finavalu[51bv32]);
    $$d_finavalu[51bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v144$2, v147$2)))) else $$d_finavalu[51bv32]);
    call {:sourceloc} {:sourceloc_num 154} _LOG_WRITE_$$d_finavalu(p15$1, 52bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(v155$1, v156$1), v163$1)))), $$d_finavalu[52bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 52bv32);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 154} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 154} _CHECK_WRITE_$$d_finavalu(p15$2, 52bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(v155$2, v156$2), v163$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[52bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(v155$1, v156$1), v163$1)))) else $$d_finavalu[52bv32]);
    $$d_finavalu[52bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(v155$2, v156$2), v163$2)))) else $$d_finavalu[52bv32]);
    call {:sourceloc} {:sourceloc_num 155} _LOG_WRITE_$$d_finavalu(p15$1, 53bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v157$1, v156$1), v159$1)))), $$d_finavalu[53bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 53bv32);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 155} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 155} _CHECK_WRITE_$$d_finavalu(p15$2, 53bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v157$2, v156$2), v159$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[53bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v157$1, v156$1), v159$1)))) else $$d_finavalu[53bv32]);
    $$d_finavalu[53bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v157$2, v156$2), v159$2)))) else $$d_finavalu[53bv32]);
    call {:sourceloc} {:sourceloc_num 156} _LOG_WRITE_$$d_finavalu(p15$1, 54bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v159$1, v161$1), v160$1)))), $$d_finavalu[54bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 54bv32);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 156} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 156} _CHECK_WRITE_$$d_finavalu(p15$2, 54bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v159$2, v161$2), v160$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[54bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v159$1, v161$1), v160$1)))) else $$d_finavalu[54bv32]);
    $$d_finavalu[54bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v159$2, v161$2), v160$2)))) else $$d_finavalu[54bv32]);
    call {:sourceloc} {:sourceloc_num 157} _LOG_WRITE_$$d_finavalu(p15$1, 55bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v160$1, v162$1), v163$1)))), $$d_finavalu[55bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 55bv32);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 157} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 157} _CHECK_WRITE_$$d_finavalu(p15$2, 55bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v160$2, v162$2), v163$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[55bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v160$1, v162$1), v163$1)))) else $$d_finavalu[55bv32]);
    $$d_finavalu[55bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v160$2, v162$2), v163$2)))) else $$d_finavalu[55bv32]);
    call {:sourceloc} {:sourceloc_num 158} _LOG_WRITE_$$d_finavalu(p15$1, 56bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v161$1, v162$1), FDIV32(FMUL32(FMUL32(1071393014bv32, v115$1), v128$1), FADD32(FMUL32(v113$1, v128$1), 1094189056bv32)))))), $$d_finavalu[56bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 56bv32);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 158} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 158} _CHECK_WRITE_$$d_finavalu(p15$2, 56bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v161$2, v162$2), FDIV32(FMUL32(FMUL32(1071393014bv32, v115$2), v128$2), FADD32(FMUL32(v113$2, v128$2), 1094189056bv32)))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[56bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v161$1, v162$1), FDIV32(FMUL32(FMUL32(1071393014bv32, v115$1), v128$1), FADD32(FMUL32(v113$1, v128$1), 1094189056bv32)))))) else $$d_finavalu[56bv32]);
    $$d_finavalu[56bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v161$2, v162$2), FDIV32(FMUL32(FMUL32(1071393014bv32, v115$2), v128$2), FADD32(FMUL32(v113$2, v128$2), 1094189056bv32)))))) else $$d_finavalu[56bv32]);
    call {:sourceloc} {:sourceloc_num 159} _LOG_WRITE_$$d_finavalu(p15$1, 57bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(v148$1, v151$1), v152$1), v153$1)))), $$d_finavalu[57bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 57bv32);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 159} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 159} _CHECK_WRITE_$$d_finavalu(p15$2, 57bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(v148$2, v151$2), v152$2), v153$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[57bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(v148$1, v151$1), v152$1), v153$1)))) else $$d_finavalu[57bv32]);
    $$d_finavalu[57bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(v148$2, v151$2), v152$2), v153$2)))) else $$d_finavalu[57bv32]);
    call {:sourceloc} {:sourceloc_num 160} _LOG_WRITE_$$d_finavalu(p15$1, 58bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v151$1, v149$1)))), $$d_finavalu[58bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 58bv32);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 160} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 160} _CHECK_WRITE_$$d_finavalu(p15$2, 58bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v151$2, v149$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[58bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v151$1, v149$1)))) else $$d_finavalu[58bv32]);
    $$d_finavalu[58bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v151$2, v149$2)))) else $$d_finavalu[58bv32]);
    call {:sourceloc} {:sourceloc_num 161} _LOG_WRITE_$$d_finavalu(p15$1, 59bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v152$1, v149$1), v150$1)))), $$d_finavalu[59bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 59bv32);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 161} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 161} _CHECK_WRITE_$$d_finavalu(p15$2, 59bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v152$2, v149$2), v150$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[59bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v152$1, v149$1), v150$1)))) else $$d_finavalu[59bv32]);
    $$d_finavalu[59bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v152$2, v149$2), v150$2)))) else $$d_finavalu[59bv32]);
    call {:sourceloc} {:sourceloc_num 162} _LOG_WRITE_$$d_finavalu(p15$1, 60bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v153$1, v150$1)))), $$d_finavalu[60bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 60bv32);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 162} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 162} _CHECK_WRITE_$$d_finavalu(p15$2, 60bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v153$2, v150$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[60bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v153$1, v150$1)))) else $$d_finavalu[60bv32]);
    $$d_finavalu[60bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v153$2, v150$2)))) else $$d_finavalu[60bv32]);
    call {:sourceloc} {:sourceloc_num 163} _LOG_WRITE_$$d_com(p15$1, 0bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FMUL32(FMUL32(1073741824bv32, v113$1), FSUB32(v160$1, v156$1)), FSUB32(2147483648bv32, FMUL32(1073741824bv32, FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v140$1, v141$1), v143$1), v144$1), v148$1), v149$1), v150$1))))))), $$d_com[0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_com(p15$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 163} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 163} _CHECK_WRITE_$$d_com(p15$2, 0bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FMUL32(FMUL32(1073741824bv32, v113$2), FSUB32(v160$2, v156$2)), FSUB32(2147483648bv32, FMUL32(1073741824bv32, FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v140$2, v141$2), v143$2), v144$2), v148$2), v149$2), v150$2))))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_com"} true;
    $$d_com[0bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FMUL32(FMUL32(1073741824bv32, v113$1), FSUB32(v160$1, v156$1)), FSUB32(2147483648bv32, FMUL32(1073741824bv32, FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v140$1, v141$1), v143$1), v144$1), v148$1), v149$1), v150$1))))))) else $$d_com[0bv32]);
    $$d_com[0bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FMUL32(FMUL32(1073741824bv32, v113$2), FSUB32(v160$2, v156$2)), FSUB32(2147483648bv32, FMUL32(1073741824bv32, FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v140$2, v141$2), v143$2), v144$2), v148$2), v149$2), v150$2))))))) else $$d_com[0bv32]);
    v164$1 := (if p15$1 then $$d_initvalu[36bv32] else v164$1);
    v164$2 := (if p15$2 then $$d_initvalu[36bv32] else v164$2);
    v165$1 := (if p15$1 then FP64_CONV32(FMUL64(FP32_CONV64(v164$1), 4652007308841189376bv64)) else v165$1);
    v165$2 := (if p15$2 then FP64_CONV32(FMUL64(FP32_CONV64(v164$2), 4652007308841189376bv64)) else v165$2);
    v166$1 := (if p15$1 then $$d_params[6bv32] else v166$1);
    v166$2 := (if p15$2 then $$d_params[6bv32] else v166$2);
    v167$1 := (if p15$1 then $$d_params[7bv32] else v167$1);
    v167$2 := (if p15$2 then $$d_params[7bv32] else v167$2);
    v168$1 := (if p15$1 then $$d_params[8bv32] else v168$1);
    v168$2 := (if p15$2 then $$d_params[8bv32] else v168$2);
    v169$1 := (if p15$1 then $$d_params[9bv32] else v169$1);
    v169$2 := (if p15$2 then $$d_params[9bv32] else v169$2);
    v170$1 := (if p15$1 then $$d_params[16bv32] else v170$1);
    v170$2 := (if p15$2 then $$d_params[16bv32] else v170$2);
    v171$1 := (if p15$1 then $$d_params[17bv32] else v171$1);
    v171$2 := (if p15$2 then $$d_params[17bv32] else v171$2);
    v172$1 := (if p15$1 then $$d_initvalu[61bv32] else v172$1);
    v172$2 := (if p15$2 then $$d_initvalu[61bv32] else v172$2);
    v173$1 := (if p15$1 then $$d_initvalu[62bv32] else v173$1);
    v173$2 := (if p15$2 then $$d_initvalu[62bv32] else v173$2);
    v174$1 := (if p15$1 then $$d_initvalu[63bv32] else v174$1);
    v174$2 := (if p15$2 then $$d_initvalu[63bv32] else v174$2);
    v175$1 := (if p15$1 then $$d_initvalu[64bv32] else v175$1);
    v175$2 := (if p15$2 then $$d_initvalu[64bv32] else v175$2);
    v176$1 := (if p15$1 then $$d_initvalu[65bv32] else v176$1);
    v176$2 := (if p15$2 then $$d_initvalu[65bv32] else v176$2);
    v177$1 := (if p15$1 then $$d_initvalu[66bv32] else v177$1);
    v177$2 := (if p15$2 then $$d_initvalu[66bv32] else v177$2);
    v178$1 := (if p15$1 then $$d_initvalu[67bv32] else v178$1);
    v178$2 := (if p15$2 then $$d_initvalu[67bv32] else v178$2);
    v179$1 := (if p15$1 then $$d_initvalu[68bv32] else v179$1);
    v179$2 := (if p15$2 then $$d_initvalu[68bv32] else v179$2);
    v180$1 := (if p15$1 then $$d_initvalu[69bv32] else v180$1);
    v180$2 := (if p15$2 then $$d_initvalu[69bv32] else v180$2);
    v181$1 := (if p15$1 then $$d_initvalu[70bv32] else v181$1);
    v181$2 := (if p15$2 then $$d_initvalu[70bv32] else v181$2);
    v182$1 := (if p15$1 then $$d_initvalu[71bv32] else v182$1);
    v182$2 := (if p15$2 then $$d_initvalu[71bv32] else v182$2);
    v183$1 := (if p15$1 then $$d_initvalu[72bv32] else v183$1);
    v183$2 := (if p15$2 then $$d_initvalu[72bv32] else v183$2);
    v184$1 := (if p15$1 then $$d_initvalu[73bv32] else v184$1);
    v184$2 := (if p15$2 then $$d_initvalu[73bv32] else v184$2);
    v185$1 := (if p15$1 then $$d_initvalu[74bv32] else v185$1);
    v185$2 := (if p15$2 then $$d_initvalu[74bv32] else v185$2);
    v186$1 := (if p15$1 then $$d_initvalu[75bv32] else v186$1);
    v186$2 := (if p15$2 then $$d_initvalu[75bv32] else v186$2);
    v187$1 := (if p15$1 then FEQ32(v171$1, 1065353216bv32) || FLT32(v171$1, 1065353216bv32) else v187$1);
    v187$2 := (if p15$2 then FEQ32(v171$2, 1065353216bv32) || FLT32(v171$2, 1065353216bv32) else v187$2);
    p18$1 := (if p15$1 && v187$1 then v187$1 else p18$1);
    p18$2 := (if p15$2 && v187$2 then v187$2 else p18$2);
    p19$1 := (if p15$1 && !v187$1 then !v187$1 else p19$1);
    p19$2 := (if p15$2 && !v187$2 then !v187$2 else p19$2);
    $Kd02.i52.0$1, $Kd24.i53.0$1 := (if p18$1 then FP64_CONV32(FMUL64(FMUL64(4567911030049346683bv64, FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$1), 4606641986844732948bv64)), FDIV64(FP32_CONV64(v171$1), 4578071150808694522bv64))), FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$1), 4620749512677471027bv64)), FDIV64(FP32_CONV64(v171$1), 4581998289683761594bv64)))) else $Kd02.i52.0$1), (if p18$1 then FP64_CONV32(FMUL64(FMUL64(4593779706308962812bv64, FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$1), 4603939827068310651bv64)), FDIV64(FP32_CONV64(v171$1), 4564099183324740295bv64))), FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$1), 4623507967449235456bv64)), FDIV64(FP32_CONV64(v171$1), 4594680426234436911bv64)))) else $Kd24.i53.0$1);
    $Kd02.i52.0$2, $Kd24.i53.0$2 := (if p18$2 then FP64_CONV32(FMUL64(FMUL64(4567911030049346683bv64, FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$2), 4606641986844732948bv64)), FDIV64(FP32_CONV64(v171$2), 4578071150808694522bv64))), FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$2), 4620749512677471027bv64)), FDIV64(FP32_CONV64(v171$2), 4581998289683761594bv64)))) else $Kd02.i52.0$2), (if p18$2 then FP64_CONV32(FMUL64(FMUL64(4593779706308962812bv64, FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$2), 4603939827068310651bv64)), FDIV64(FP32_CONV64(v171$2), 4564099183324740295bv64))), FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$2), 4623507967449235456bv64)), FDIV64(FP32_CONV64(v171$2), 4594680426234436911bv64)))) else $Kd24.i53.0$2);
    $Kd02.i52.0$1, $Kd24.i53.0$1 := (if p19$1 then FP64_CONV32(FMUL64(FMUL64(4567911030049346683bv64, FADD64(FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$1), 4606641986844732948bv64)), 4635564478951675221bv64), FDIV64(FP32_CONV64(FSUB32(v171$1, 1065353216bv32)), 4588807732320345784bv64))), FADD64(FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$1), 4620749512677471027bv64)), 4631593975871105211bv64), FDIV64(FP32_CONV64(FSUB32(v171$1, 1065353216bv32)), 4589564337057744028bv64)))) else $Kd02.i52.0$1), (if p19$1 then FP64_CONV32(FMUL64(FMUL64(4593779706308962812bv64, FADD64(FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$1), 4603939827068310651bv64)), 4649494139406272805bv64), FDIV64(FP32_CONV64(FSUB32(v171$1, 1065353216bv32)), 4572414629676717179bv64))), FADD64(FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$1), 4623507967449235456bv64)), 4619044841347927930bv64), FDIV64(FP32_CONV64(FSUB32(v171$1, 1065353216bv32)), 4594572339843380019bv64)))) else $Kd24.i53.0$1);
    $Kd02.i52.0$2, $Kd24.i53.0$2 := (if p19$2 then FP64_CONV32(FMUL64(FMUL64(4567911030049346683bv64, FADD64(FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$2), 4606641986844732948bv64)), 4635564478951675221bv64), FDIV64(FP32_CONV64(FSUB32(v171$2, 1065353216bv32)), 4588807732320345784bv64))), FADD64(FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$2), 4620749512677471027bv64)), 4631593975871105211bv64), FDIV64(FP32_CONV64(FSUB32(v171$2, 1065353216bv32)), 4589564337057744028bv64)))) else $Kd02.i52.0$2), (if p19$2 then FP64_CONV32(FMUL64(FMUL64(4593779706308962812bv64, FADD64(FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$2), 4603939827068310651bv64)), 4649494139406272805bv64), FDIV64(FP32_CONV64(FSUB32(v171$2, 1065353216bv32)), 4572414629676717179bv64))), FADD64(FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v170$2), 4623507967449235456bv64)), 4619044841347927930bv64), FDIV64(FP32_CONV64(FSUB32(v171$2, 1065353216bv32)), 4594572339843380019bv64)))) else $Kd24.i53.0$2);
    v188$1 := (if p15$1 then FDIV32(1092616192bv32, $Kd02.i52.0$1) else v188$1);
    v188$2 := (if p15$2 then FDIV32(1092616192bv32, $Kd02.i52.0$2) else v188$2);
    v189$1 := (if p15$1 then FDIV32(1140457472bv32, $Kd24.i53.0$1) else v189$1);
    v189$2 := (if p15$2 then FDIV32(1140457472bv32, $Kd24.i53.0$2) else v189$2);
    v190$1 := (if p15$1 then FP64_CONV32(FDIV64(FP32_CONV64(985104436bv32), 4596373779694328218bv64)) else v190$1);
    v190$2 := (if p15$2 then FP64_CONV32(FDIV64(FP32_CONV64(985104436bv32), 4596373779694328218bv64)) else v190$2);
    v191$1 := (if p15$1 then FDIV32(985104436bv32, 1120403456bv32) else v191$1);
    v191$2 := (if p15$2 then FDIV32(985104436bv32, 1120403456bv32) else v191$2);
    v192$1 := (if p15$1 then FP64_CONV32(FDIV64(FP32_CONV64(1074580685bv32), 4584988679836335604bv64)) else v192$1);
    v192$2 := (if p15$2 then FP64_CONV32(FDIV64(FP32_CONV64(1074580685bv32), 4584988679836335604bv64)) else v192$2);
    v193$1 := (if p15$1 then FMUL32(1159512064bv32, 984245443bv32) else v193$1);
    v193$2 := (if p15$2 then FMUL32(1159512064bv32, 984245443bv32) else v193$2);
    v194$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v188$1, FPOW32(v165$1, 1073741824bv32)), v172$1), FSUB32(2147483648bv32, FMUL32(1092616192bv32, v173$1))) else v194$1);
    v194$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v188$2, FPOW32(v165$2, 1073741824bv32)), v172$2), FSUB32(2147483648bv32, FMUL32(1092616192bv32, v173$2))) else v194$2);
    v195$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v189$1, FPOW32(v165$1, 1073741824bv32)), v173$1), FSUB32(2147483648bv32, FMUL32(1140457472bv32, v174$1))) else v195$1);
    v195$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v189$2, FPOW32(v165$2, 1073741824bv32)), v173$2), FSUB32(2147483648bv32, FMUL32(1140457472bv32, v174$2))) else v195$2);
    v196$1 := (if p15$1 then FSUB32(FSUB32(FSUB32(v166$1, v175$1), v176$1), v177$1) else v196$1);
    v196$2 := (if p15$2 then FSUB32(FSUB32(FSUB32(v166$2, v175$2), v176$2), v177$2) else v196$2);
    v197$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v188$1, FPOW32(v165$1, 1073741824bv32)), v175$1), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1120403456bv32), v176$1))) else v197$1);
    v197$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v188$2, FPOW32(v165$2, 1073741824bv32)), v175$2), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1120403456bv32), v176$2))) else v197$2);
    v198$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v189$1, FPOW32(v165$1, 1073741824bv32)), v176$1), FSUB32(2147483648bv32, FMUL32(1140457472bv32, v177$1))) else v198$1);
    v198$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v189$2, FPOW32(v165$2, 1073741824bv32)), v176$2), FSUB32(2147483648bv32, FMUL32(1140457472bv32, v177$2))) else v198$2);
    v199$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v190$1, v172$1), v196$1), FSUB32(2147483648bv32, FMUL32(985104436bv32, v175$1))) else v199$1);
    v199$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v190$2, v172$2), v196$2), FSUB32(2147483648bv32, FMUL32(985104436bv32, v175$2))) else v199$2);
    v200$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v190$1, v173$1), v196$1), FSUB32(2147483648bv32, FMUL32(v191$1, v176$1))) else v200$1);
    v200$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v190$2, v173$2), v196$2), FSUB32(2147483648bv32, FMUL32(v191$2, v176$2))) else v200$2);
    v201$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v190$1, v174$1), v196$1), FSUB32(2147483648bv32, FMUL32(v191$1, v177$1))) else v201$1);
    v201$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v190$2, v174$2), v196$2), FSUB32(2147483648bv32, FMUL32(v191$2, v177$2))) else v201$2);
    v202$1 := (if p15$1 then FADD32(FMUL32(FMUL32(FP64_CONV32(FDIV64(FP32_CONV64(1065353216bv32), 4602678819172646912bv64)), FPOW32(v165$1, 1073741824bv32)), FSUB32(FSUB32(FSUB32(FSUB32(v168$1, v183$1), v184$1), v185$1), v186$1)), FSUB32(2147483648bv32, FMUL32(1065353216bv32, v183$1))) else v202$1);
    v202$2 := (if p15$2 then FADD32(FMUL32(FMUL32(FP64_CONV32(FDIV64(FP32_CONV64(1065353216bv32), 4602678819172646912bv64)), FPOW32(v165$2, 1073741824bv32)), FSUB32(FSUB32(FSUB32(FSUB32(v168$2, v183$2), v184$2), v185$2), v186$2)), FSUB32(2147483648bv32, FMUL32(1065353216bv32, v183$2))) else v202$2);
    v203$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v188$1, FPOW32(v165$1, 1073741824bv32)), v184$1), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1126498304bv32), v185$1))) else v203$1);
    v203$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v188$2, FPOW32(v165$2, 1073741824bv32)), v184$2), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1126498304bv32), v185$2))) else v203$2);
    v204$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v189$1, FPOW32(v165$1, 1073741824bv32)), v185$1), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1159512064bv32), v186$1))) else v204$1);
    v204$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v189$2, FPOW32(v165$2, 1073741824bv32)), v185$2), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1159512064bv32), v186$2))) else v204$2);
    v205$1 := (if p15$1 then FADD32(FMUL32(FMUL32(1110966272bv32, v172$1), v183$1), FSUB32(2147483648bv32, FMUL32(FMUL32(1126498304bv32, v193$1), v184$1))) else v205$1);
    v205$2 := (if p15$2 then FADD32(FMUL32(FMUL32(1110966272bv32, v172$2), v183$2), FSUB32(2147483648bv32, FMUL32(FMUL32(1126498304bv32, v193$2), v184$2))) else v205$2);
    v206$1 := (if p15$1 then FADD32(FMUL32(FMUL32(1110966272bv32, v173$1), v183$1), FSUB32(2147483648bv32, FMUL32(v193$1, v185$1))) else v206$1);
    v206$2 := (if p15$2 then FADD32(FMUL32(FMUL32(1110966272bv32, v173$2), v183$2), FSUB32(2147483648bv32, FMUL32(v193$2, v185$2))) else v206$2);
    v207$1 := (if p15$1 then FADD32(FMUL32(FMUL32(1110966272bv32, v174$1), v183$1), FSUB32(2147483648bv32, FMUL32(984245443bv32, v186$1))) else v207$1);
    v207$2 := (if p15$2 then FADD32(FMUL32(FMUL32(1110966272bv32, v174$2), v183$2), FSUB32(2147483648bv32, FMUL32(984245443bv32, v186$2))) else v207$2);
    v208$1 := (if p15$1 then FSUB32(FSUB32(FSUB32(FSUB32(FSUB32(1065353216bv32, v178$1), v179$1), v180$1), v181$1), v182$1) else v208$1);
    v208$2 := (if p15$2 then FSUB32(FSUB32(FSUB32(FSUB32(FSUB32(1065353216bv32, v178$2), v179$2), v180$2), v181$2), v182$2) else v208$2);
    v209$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v192$1, v173$1), v208$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v192$1, 1084227584bv32), v178$1))) else v209$1);
    v209$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v192$2, v173$2), v208$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v192$2, 1084227584bv32), v178$2))) else v209$2);
    v210$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v189$1, FPOW32(v165$1, 1073741824bv32)), v178$1), FSUB32(2147483648bv32, FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(1140457472bv32), 4584988679836335604bv64), 4617315517961601024bv64)), v179$1))) else v210$1);
    v210$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v189$2, FPOW32(v165$2, 1073741824bv32)), v178$2), FSUB32(2147483648bv32, FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(1140457472bv32), 4584988679836335604bv64), 4617315517961601024bv64)), v179$2))) else v210$2);
    v211$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v192$1, v174$1), v208$1), FSUB32(2147483648bv32, FMUL32(1074580685bv32, v179$1))) else v211$1);
    v211$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v192$2, v174$2), v208$2), FSUB32(2147483648bv32, FMUL32(1074580685bv32, v179$2))) else v211$2);
    v212$1 := (if p15$1 then FADD32(FADD32(FADD32(v179$1, v180$1), v181$1), v182$1) else v212$1);
    v212$2 := (if p15$2 then FADD32(FADD32(FADD32(v179$2, v180$2), v181$2), v182$2) else v212$2);
    v213$1 := (if p15$1 then FADD32(FMUL32(FP64_CONV32(FADD64(FMUL64(4579800533065604792bv64, FP32_CONV64(FPOW32(v212$1, 1077936128bv32))), FADD64(FMUL64(4588087156379966505bv64, FP32_CONV64(v212$1)), FMUL64(4575181641287773612bv64, FP32_CONV64(FPOW32(v212$1, 1073741824bv32)))))), v179$1), FSUB32(2147483648bv32, FDIV32(FMUL32(FMUL32(1071393014bv32, v169$1), v180$1), FADD32(FMUL32(v167$1, v180$1), 1094189056bv32)))) else v213$1);
    v213$2 := (if p15$2 then FADD32(FMUL32(FP64_CONV32(FADD64(FMUL64(4579800533065604792bv64, FP32_CONV64(FPOW32(v212$2, 1077936128bv32))), FADD64(FMUL64(4588087156379966505bv64, FP32_CONV64(v212$2)), FMUL64(4575181641287773612bv64, FP32_CONV64(FPOW32(v212$2, 1073741824bv32)))))), v179$2), FSUB32(2147483648bv32, FDIV32(FMUL32(FMUL32(1071393014bv32, v169$2), v180$2), FADD32(FMUL32(v167$2, v180$2), 1094189056bv32)))) else v213$2);
    v214$1 := (if p15$1 then FADD32(FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(1140457472bv32), 4540068552173843632bv64), 4617315517961601024bv64)), v180$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v189$1, FPOW32(v165$1, 1073741824bv32)), v181$1))) else v214$1);
    v214$2 := (if p15$2 then FADD32(FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(1140457472bv32), 4540068552173843632bv64), 4617315517961601024bv64)), v180$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v189$2, FPOW32(v165$2, 1073741824bv32)), v181$2))) else v214$2);
    v215$1 := (if p15$1 then FADD32(FMUL32(FDIV32(1074580685bv32, 1148846080bv32), v180$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v192$1, v174$1), v182$1))) else v215$1);
    v215$2 := (if p15$2 then FADD32(FMUL32(FDIV32(1074580685bv32, 1148846080bv32), v180$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v192$2, v174$2), v182$2))) else v215$2);
    v216$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v192$1, 1084227584bv32), v181$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v192$1, v173$1), v182$1))) else v216$1);
    v216$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v192$2, 1084227584bv32), v181$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v192$2, v173$2), v182$2))) else v216$2);
    v217$1 := (if p15$1 then FDIV32(FMUL32(FMUL32(1071393014bv32, v169$1), v181$1), FADD32(FMUL32(v167$1, v181$1), 1094189056bv32)) else v217$1);
    v217$2 := (if p15$2 then FDIV32(FMUL32(FMUL32(1071393014bv32, v169$2), v181$2), FADD32(FMUL32(v167$2, v181$2), 1094189056bv32)) else v217$2);
    call {:sourceloc} {:sourceloc_num 189} _LOG_WRITE_$$d_finavalu(p15$1, 61bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(2147483648bv32, v194$1), v199$1), v205$1)))), $$d_finavalu[61bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 61bv32);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 189} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 189} _CHECK_WRITE_$$d_finavalu(p15$2, 61bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(2147483648bv32, v194$2), v199$2), v205$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[61bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(2147483648bv32, v194$1), v199$1), v205$1)))) else $$d_finavalu[61bv32]);
    $$d_finavalu[61bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(2147483648bv32, v194$2), v199$2), v205$2)))) else $$d_finavalu[61bv32]);
    call {:sourceloc} {:sourceloc_num 190} _LOG_WRITE_$$d_finavalu(p15$1, 62bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(FSUB32(v194$1, v195$1), v200$1), v206$1), FMUL32(v167$1, FADD32(FSUB32(2147483648bv32, v209$1), v216$1)))))), $$d_finavalu[62bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 62bv32);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 190} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 190} _CHECK_WRITE_$$d_finavalu(p15$2, 62bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(FSUB32(v194$2, v195$2), v200$2), v206$2), FMUL32(v167$2, FADD32(FSUB32(2147483648bv32, v209$2), v216$2)))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[62bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(FSUB32(v194$1, v195$1), v200$1), v206$1), FMUL32(v167$1, FADD32(FSUB32(2147483648bv32, v209$1), v216$1)))))) else $$d_finavalu[62bv32]);
    $$d_finavalu[62bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(FSUB32(v194$2, v195$2), v200$2), v206$2), FMUL32(v167$2, FADD32(FSUB32(2147483648bv32, v209$2), v216$2)))))) else $$d_finavalu[62bv32]);
    call {:sourceloc} {:sourceloc_num 191} _LOG_WRITE_$$d_finavalu(p15$1, 63bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(v195$1, v201$1), v207$1), FMUL32(v167$1, FADD32(FSUB32(2147483648bv32, v211$1), v215$1)))))), $$d_finavalu[63bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 63bv32);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 191} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 191} _CHECK_WRITE_$$d_finavalu(p15$2, 63bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(v195$2, v201$2), v207$2), FMUL32(v167$2, FADD32(FSUB32(2147483648bv32, v211$2), v215$2)))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[63bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(v195$1, v201$1), v207$1), FMUL32(v167$1, FADD32(FSUB32(2147483648bv32, v211$1), v215$1)))))) else $$d_finavalu[63bv32]);
    $$d_finavalu[63bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(v195$2, v201$2), v207$2), FMUL32(v167$2, FADD32(FSUB32(2147483648bv32, v211$2), v215$2)))))) else $$d_finavalu[63bv32]);
    call {:sourceloc} {:sourceloc_num 192} _LOG_WRITE_$$d_finavalu(p15$1, 64bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v199$1, v197$1)))), $$d_finavalu[64bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 64bv32);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 192} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 192} _CHECK_WRITE_$$d_finavalu(p15$2, 64bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v199$2, v197$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[64bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v199$1, v197$1)))) else $$d_finavalu[64bv32]);
    $$d_finavalu[64bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v199$2, v197$2)))) else $$d_finavalu[64bv32]);
    call {:sourceloc} {:sourceloc_num 193} _LOG_WRITE_$$d_finavalu(p15$1, 65bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v197$1, v200$1), v198$1)))), $$d_finavalu[65bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 65bv32);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 193} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 193} _CHECK_WRITE_$$d_finavalu(p15$2, 65bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v197$2, v200$2), v198$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[65bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v197$1, v200$1), v198$1)))) else $$d_finavalu[65bv32]);
    $$d_finavalu[65bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v197$2, v200$2), v198$2)))) else $$d_finavalu[65bv32]);
    call {:sourceloc} {:sourceloc_num 194} _LOG_WRITE_$$d_finavalu(p15$1, 66bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v198$1, v201$1)))), $$d_finavalu[66bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 66bv32);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 194} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 194} _CHECK_WRITE_$$d_finavalu(p15$2, 66bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v198$2, v201$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[66bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v198$1, v201$1)))) else $$d_finavalu[66bv32]);
    $$d_finavalu[66bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v198$2, v201$2)))) else $$d_finavalu[66bv32]);
    call {:sourceloc} {:sourceloc_num 195} _LOG_WRITE_$$d_finavalu(p15$1, 67bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(v209$1, v210$1), v217$1)))), $$d_finavalu[67bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 67bv32);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 195} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 195} _CHECK_WRITE_$$d_finavalu(p15$2, 67bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(v209$2, v210$2), v217$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[67bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(v209$1, v210$1), v217$1)))) else $$d_finavalu[67bv32]);
    $$d_finavalu[67bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(v209$2, v210$2), v217$2)))) else $$d_finavalu[67bv32]);
    call {:sourceloc} {:sourceloc_num 196} _LOG_WRITE_$$d_finavalu(p15$1, 68bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v211$1, v210$1), v213$1)))), $$d_finavalu[68bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 68bv32);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 196} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 196} _CHECK_WRITE_$$d_finavalu(p15$2, 68bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v211$2, v210$2), v213$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[68bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v211$1, v210$1), v213$1)))) else $$d_finavalu[68bv32]);
    $$d_finavalu[68bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v211$2, v210$2), v213$2)))) else $$d_finavalu[68bv32]);
    call {:sourceloc} {:sourceloc_num 197} _LOG_WRITE_$$d_finavalu(p15$1, 69bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v213$1, v215$1), v214$1)))), $$d_finavalu[69bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 69bv32);
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 197} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 197} _CHECK_WRITE_$$d_finavalu(p15$2, 69bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v213$2, v215$2), v214$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[69bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v213$1, v215$1), v214$1)))) else $$d_finavalu[69bv32]);
    $$d_finavalu[69bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v213$2, v215$2), v214$2)))) else $$d_finavalu[69bv32]);
    call {:sourceloc} {:sourceloc_num 198} _LOG_WRITE_$$d_finavalu(p15$1, 70bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v214$1, v216$1), v217$1)))), $$d_finavalu[70bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 70bv32);
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 198} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 198} _CHECK_WRITE_$$d_finavalu(p15$2, 70bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v214$2, v216$2), v217$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[70bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v214$1, v216$1), v217$1)))) else $$d_finavalu[70bv32]);
    $$d_finavalu[70bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v214$2, v216$2), v217$2)))) else $$d_finavalu[70bv32]);
    call {:sourceloc} {:sourceloc_num 199} _LOG_WRITE_$$d_finavalu(p15$1, 71bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v215$1, v216$1), FDIV32(FMUL32(FMUL32(1071393014bv32, v169$1), v182$1), FADD32(FMUL32(v167$1, v182$1), 1094189056bv32)))))), $$d_finavalu[71bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 71bv32);
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 199} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 199} _CHECK_WRITE_$$d_finavalu(p15$2, 71bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v215$2, v216$2), FDIV32(FMUL32(FMUL32(1071393014bv32, v169$2), v182$2), FADD32(FMUL32(v167$2, v182$2), 1094189056bv32)))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[71bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v215$1, v216$1), FDIV32(FMUL32(FMUL32(1071393014bv32, v169$1), v182$1), FADD32(FMUL32(v167$1, v182$1), 1094189056bv32)))))) else $$d_finavalu[71bv32]);
    $$d_finavalu[71bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v215$2, v216$2), FDIV32(FMUL32(FMUL32(1071393014bv32, v169$2), v182$2), FADD32(FMUL32(v167$2, v182$2), 1094189056bv32)))))) else $$d_finavalu[71bv32]);
    call {:sourceloc} {:sourceloc_num 200} _LOG_WRITE_$$d_finavalu(p15$1, 72bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(v202$1, v205$1), v206$1), v207$1)))), $$d_finavalu[72bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 72bv32);
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 200} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 200} _CHECK_WRITE_$$d_finavalu(p15$2, 72bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(v202$2, v205$2), v206$2), v207$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[72bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(v202$1, v205$1), v206$1), v207$1)))) else $$d_finavalu[72bv32]);
    $$d_finavalu[72bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(v202$2, v205$2), v206$2), v207$2)))) else $$d_finavalu[72bv32]);
    call {:sourceloc} {:sourceloc_num 201} _LOG_WRITE_$$d_finavalu(p15$1, 73bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v205$1, v203$1)))), $$d_finavalu[73bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 73bv32);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 201} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 201} _CHECK_WRITE_$$d_finavalu(p15$2, 73bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v205$2, v203$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[73bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v205$1, v203$1)))) else $$d_finavalu[73bv32]);
    $$d_finavalu[73bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v205$2, v203$2)))) else $$d_finavalu[73bv32]);
    call {:sourceloc} {:sourceloc_num 202} _LOG_WRITE_$$d_finavalu(p15$1, 74bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v206$1, v203$1), v204$1)))), $$d_finavalu[74bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 74bv32);
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 202} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 202} _CHECK_WRITE_$$d_finavalu(p15$2, 74bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v206$2, v203$2), v204$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[74bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v206$1, v203$1), v204$1)))) else $$d_finavalu[74bv32]);
    $$d_finavalu[74bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v206$2, v203$2), v204$2)))) else $$d_finavalu[74bv32]);
    call {:sourceloc} {:sourceloc_num 203} _LOG_WRITE_$$d_finavalu(p15$1, 75bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v207$1, v204$1)))), $$d_finavalu[75bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 75bv32);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 203} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 203} _CHECK_WRITE_$$d_finavalu(p15$2, 75bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v207$2, v204$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[75bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v207$1, v204$1)))) else $$d_finavalu[75bv32]);
    $$d_finavalu[75bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v207$2, v204$2)))) else $$d_finavalu[75bv32]);
    call {:sourceloc} {:sourceloc_num 204} _LOG_WRITE_$$d_com(p15$1, 1bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FMUL32(FMUL32(1073741824bv32, v167$1), FSUB32(v214$1, v210$1)), FSUB32(2147483648bv32, FMUL32(1073741824bv32, FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v194$1, v195$1), v197$1), v198$1), v202$1), v203$1), v204$1))))))), $$d_com[1bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_com(p15$2, 1bv32);
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 204} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 204} _CHECK_WRITE_$$d_com(p15$2, 1bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FMUL32(FMUL32(1073741824bv32, v167$2), FSUB32(v214$2, v210$2)), FSUB32(2147483648bv32, FMUL32(1073741824bv32, FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v194$2, v195$2), v197$2), v198$2), v202$2), v203$2), v204$2))))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_com"} true;
    $$d_com[1bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FMUL32(FMUL32(1073741824bv32, v167$1), FSUB32(v214$1, v210$1)), FSUB32(2147483648bv32, FMUL32(1073741824bv32, FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v194$1, v195$1), v197$1), v198$1), v202$1), v203$1), v204$1))))))) else $$d_com[1bv32]);
    $$d_com[1bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FMUL32(FMUL32(1073741824bv32, v167$2), FSUB32(v214$2, v210$2)), FSUB32(2147483648bv32, FMUL32(1073741824bv32, FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v194$2, v195$2), v197$2), v198$2), v202$2), v203$2), v204$2))))))) else $$d_com[1bv32]);
    v218$1 := (if p15$1 then $$d_initvalu[37bv32] else v218$1);
    v218$2 := (if p15$2 then $$d_initvalu[37bv32] else v218$2);
    v219$1 := (if p15$1 then FP64_CONV32(FMUL64(FP32_CONV64(v218$1), 4652007308841189376bv64)) else v219$1);
    v219$2 := (if p15$2 then FP64_CONV32(FMUL64(FP32_CONV64(v218$2), 4652007308841189376bv64)) else v219$2);
    v220$1 := (if p15$1 then $$d_params[11bv32] else v220$1);
    v220$2 := (if p15$2 then $$d_params[11bv32] else v220$2);
    v221$1 := (if p15$1 then $$d_params[12bv32] else v221$1);
    v221$2 := (if p15$2 then $$d_params[12bv32] else v221$2);
    v222$1 := (if p15$1 then $$d_params[13bv32] else v222$1);
    v222$2 := (if p15$2 then $$d_params[13bv32] else v222$2);
    v223$1 := (if p15$1 then $$d_params[14bv32] else v223$1);
    v223$2 := (if p15$2 then $$d_params[14bv32] else v223$2);
    v224$1 := (if p15$1 then $$d_params[16bv32] else v224$1);
    v224$2 := (if p15$2 then $$d_params[16bv32] else v224$2);
    v225$1 := (if p15$1 then $$d_params[17bv32] else v225$1);
    v225$2 := (if p15$2 then $$d_params[17bv32] else v225$2);
    v226$1 := (if p15$1 then $$d_initvalu[76bv32] else v226$1);
    v226$2 := (if p15$2 then $$d_initvalu[76bv32] else v226$2);
    v227$1 := (if p15$1 then $$d_initvalu[77bv32] else v227$1);
    v227$2 := (if p15$2 then $$d_initvalu[77bv32] else v227$2);
    v228$1 := (if p15$1 then $$d_initvalu[78bv32] else v228$1);
    v228$2 := (if p15$2 then $$d_initvalu[78bv32] else v228$2);
    v229$1 := (if p15$1 then $$d_initvalu[79bv32] else v229$1);
    v229$2 := (if p15$2 then $$d_initvalu[79bv32] else v229$2);
    v230$1 := (if p15$1 then $$d_initvalu[80bv32] else v230$1);
    v230$2 := (if p15$2 then $$d_initvalu[80bv32] else v230$2);
    v231$1 := (if p15$1 then $$d_initvalu[81bv32] else v231$1);
    v231$2 := (if p15$2 then $$d_initvalu[81bv32] else v231$2);
    v232$1 := (if p15$1 then $$d_initvalu[82bv32] else v232$1);
    v232$2 := (if p15$2 then $$d_initvalu[82bv32] else v232$2);
    v233$1 := (if p15$1 then $$d_initvalu[83bv32] else v233$1);
    v233$2 := (if p15$2 then $$d_initvalu[83bv32] else v233$2);
    v234$1 := (if p15$1 then $$d_initvalu[84bv32] else v234$1);
    v234$2 := (if p15$2 then $$d_initvalu[84bv32] else v234$2);
    v235$1 := (if p15$1 then $$d_initvalu[85bv32] else v235$1);
    v235$2 := (if p15$2 then $$d_initvalu[85bv32] else v235$2);
    v236$1 := (if p15$1 then $$d_initvalu[86bv32] else v236$1);
    v236$2 := (if p15$2 then $$d_initvalu[86bv32] else v236$2);
    v237$1 := (if p15$1 then $$d_initvalu[87bv32] else v237$1);
    v237$2 := (if p15$2 then $$d_initvalu[87bv32] else v237$2);
    v238$1 := (if p15$1 then $$d_initvalu[88bv32] else v238$1);
    v238$2 := (if p15$2 then $$d_initvalu[88bv32] else v238$2);
    v239$1 := (if p15$1 then $$d_initvalu[89bv32] else v239$1);
    v239$2 := (if p15$2 then $$d_initvalu[89bv32] else v239$2);
    v240$1 := (if p15$1 then $$d_initvalu[90bv32] else v240$1);
    v240$2 := (if p15$2 then $$d_initvalu[90bv32] else v240$2);
    v241$1 := (if p15$1 then FEQ32(v225$1, 1065353216bv32) || FLT32(v225$1, 1065353216bv32) else v241$1);
    v241$2 := (if p15$2 then FEQ32(v225$2, 1065353216bv32) || FLT32(v225$2, 1065353216bv32) else v241$2);
    p20$1 := (if p15$1 && v241$1 then v241$1 else p20$1);
    p20$2 := (if p15$2 && v241$2 then v241$2 else p20$2);
    p21$1 := (if p15$1 && !v241$1 then !v241$1 else p21$1);
    p21$2 := (if p15$2 && !v241$2 then !v241$2 else p21$2);
    $Kd02.i173.0$1, $Kd24.i174.0$1 := (if p20$1 then FP64_CONV32(FMUL64(FMUL64(4567911030049346683bv64, FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$1), 4606641986844732948bv64)), FDIV64(FP32_CONV64(v225$1), 4578071150808694522bv64))), FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$1), 4620749512677471027bv64)), FDIV64(FP32_CONV64(v225$1), 4581998289683761594bv64)))) else $Kd02.i173.0$1), (if p20$1 then FP64_CONV32(FMUL64(FMUL64(4593779706308962812bv64, FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$1), 4603939827068310651bv64)), FDIV64(FP32_CONV64(v225$1), 4564099183324740295bv64))), FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$1), 4623507967449235456bv64)), FDIV64(FP32_CONV64(v225$1), 4594680426234436911bv64)))) else $Kd24.i174.0$1);
    $Kd02.i173.0$2, $Kd24.i174.0$2 := (if p20$2 then FP64_CONV32(FMUL64(FMUL64(4567911030049346683bv64, FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$2), 4606641986844732948bv64)), FDIV64(FP32_CONV64(v225$2), 4578071150808694522bv64))), FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$2), 4620749512677471027bv64)), FDIV64(FP32_CONV64(v225$2), 4581998289683761594bv64)))) else $Kd02.i173.0$2), (if p20$2 then FP64_CONV32(FMUL64(FMUL64(4593779706308962812bv64, FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$2), 4603939827068310651bv64)), FDIV64(FP32_CONV64(v225$2), 4564099183324740295bv64))), FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$2), 4623507967449235456bv64)), FDIV64(FP32_CONV64(v225$2), 4594680426234436911bv64)))) else $Kd24.i174.0$2);
    $Kd02.i173.0$1, $Kd24.i174.0$1 := (if p21$1 then FP64_CONV32(FMUL64(FMUL64(4567911030049346683bv64, FADD64(FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$1), 4606641986844732948bv64)), 4635564478951675221bv64), FDIV64(FP32_CONV64(FSUB32(v225$1, 1065353216bv32)), 4588807732320345784bv64))), FADD64(FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$1), 4620749512677471027bv64)), 4631593975871105211bv64), FDIV64(FP32_CONV64(FSUB32(v225$1, 1065353216bv32)), 4589564337057744028bv64)))) else $Kd02.i173.0$1), (if p21$1 then FP64_CONV32(FMUL64(FMUL64(4593779706308962812bv64, FADD64(FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$1), 4603939827068310651bv64)), 4649494139406272805bv64), FDIV64(FP32_CONV64(FSUB32(v225$1, 1065353216bv32)), 4572414629676717179bv64))), FADD64(FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$1), 4623507967449235456bv64)), 4619044841347927930bv64), FDIV64(FP32_CONV64(FSUB32(v225$1, 1065353216bv32)), 4594572339843380019bv64)))) else $Kd24.i174.0$1);
    $Kd02.i173.0$2, $Kd24.i174.0$2 := (if p21$2 then FP64_CONV32(FMUL64(FMUL64(4567911030049346683bv64, FADD64(FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$2), 4606641986844732948bv64)), 4635564478951675221bv64), FDIV64(FP32_CONV64(FSUB32(v225$2, 1065353216bv32)), 4588807732320345784bv64))), FADD64(FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$2), 4620749512677471027bv64)), 4631593975871105211bv64), FDIV64(FP32_CONV64(FSUB32(v225$2, 1065353216bv32)), 4589564337057744028bv64)))) else $Kd02.i173.0$2), (if p21$2 then FP64_CONV32(FMUL64(FMUL64(4593779706308962812bv64, FADD64(FADD64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$2), 4603939827068310651bv64)), 4649494139406272805bv64), FDIV64(FP32_CONV64(FSUB32(v225$2, 1065353216bv32)), 4572414629676717179bv64))), FADD64(FSUB64(FADD64(4607182418800017408bv64, FDIV64(FP32_CONV64(v224$2), 4623507967449235456bv64)), 4619044841347927930bv64), FDIV64(FP32_CONV64(FSUB32(v225$2, 1065353216bv32)), 4594572339843380019bv64)))) else $Kd24.i174.0$2);
    v242$1 := (if p15$1 then FDIV32(1092616192bv32, $Kd02.i173.0$1) else v242$1);
    v242$2 := (if p15$2 then FDIV32(1092616192bv32, $Kd02.i173.0$2) else v242$2);
    v243$1 := (if p15$1 then FDIV32(1140457472bv32, $Kd24.i174.0$1) else v243$1);
    v243$2 := (if p15$2 then FDIV32(1140457472bv32, $Kd24.i174.0$2) else v243$2);
    v244$1 := (if p15$1 then FP64_CONV32(FDIV64(FP32_CONV64(985104436bv32), 4596373779694328218bv64)) else v244$1);
    v244$2 := (if p15$2 then FP64_CONV32(FDIV64(FP32_CONV64(985104436bv32), 4596373779694328218bv64)) else v244$2);
    v245$1 := (if p15$1 then FDIV32(985104436bv32, 1120403456bv32) else v245$1);
    v245$2 := (if p15$2 then FDIV32(985104436bv32, 1120403456bv32) else v245$2);
    v246$1 := (if p15$1 then FP64_CONV32(FDIV64(FP32_CONV64(1074580685bv32), 4584988679836335604bv64)) else v246$1);
    v246$2 := (if p15$2 then FP64_CONV32(FDIV64(FP32_CONV64(1074580685bv32), 4584988679836335604bv64)) else v246$2);
    v247$1 := (if p15$1 then FMUL32(1159512064bv32, 984245443bv32) else v247$1);
    v247$2 := (if p15$2 then FMUL32(1159512064bv32, 984245443bv32) else v247$2);
    v248$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v242$1, FPOW32(v219$1, 1073741824bv32)), v226$1), FSUB32(2147483648bv32, FMUL32(1092616192bv32, v227$1))) else v248$1);
    v248$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v242$2, FPOW32(v219$2, 1073741824bv32)), v226$2), FSUB32(2147483648bv32, FMUL32(1092616192bv32, v227$2))) else v248$2);
    v249$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v243$1, FPOW32(v219$1, 1073741824bv32)), v227$1), FSUB32(2147483648bv32, FMUL32(1140457472bv32, v228$1))) else v249$1);
    v249$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v243$2, FPOW32(v219$2, 1073741824bv32)), v227$2), FSUB32(2147483648bv32, FMUL32(1140457472bv32, v228$2))) else v249$2);
    v250$1 := (if p15$1 then FSUB32(FSUB32(FSUB32(v220$1, v229$1), v230$1), v231$1) else v250$1);
    v250$2 := (if p15$2 then FSUB32(FSUB32(FSUB32(v220$2, v229$2), v230$2), v231$2) else v250$2);
    v251$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v242$1, FPOW32(v219$1, 1073741824bv32)), v229$1), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1120403456bv32), v230$1))) else v251$1);
    v251$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v242$2, FPOW32(v219$2, 1073741824bv32)), v229$2), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1120403456bv32), v230$2))) else v251$2);
    v252$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v243$1, FPOW32(v219$1, 1073741824bv32)), v230$1), FSUB32(2147483648bv32, FMUL32(1140457472bv32, v231$1))) else v252$1);
    v252$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v243$2, FPOW32(v219$2, 1073741824bv32)), v230$2), FSUB32(2147483648bv32, FMUL32(1140457472bv32, v231$2))) else v252$2);
    v253$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v244$1, v226$1), v250$1), FSUB32(2147483648bv32, FMUL32(985104436bv32, v229$1))) else v253$1);
    v253$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v244$2, v226$2), v250$2), FSUB32(2147483648bv32, FMUL32(985104436bv32, v229$2))) else v253$2);
    v254$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v244$1, v227$1), v250$1), FSUB32(2147483648bv32, FMUL32(v245$1, v230$1))) else v254$1);
    v254$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v244$2, v227$2), v250$2), FSUB32(2147483648bv32, FMUL32(v245$2, v230$2))) else v254$2);
    v255$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v244$1, v228$1), v250$1), FSUB32(2147483648bv32, FMUL32(v245$1, v231$1))) else v255$1);
    v255$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v244$2, v228$2), v250$2), FSUB32(2147483648bv32, FMUL32(v245$2, v231$2))) else v255$2);
    v256$1 := (if p15$1 then FADD32(FMUL32(FMUL32(FP64_CONV32(FDIV64(FP32_CONV64(1065353216bv32), 4602678819172646912bv64)), FPOW32(v219$1, 1073741824bv32)), FSUB32(FSUB32(FSUB32(FSUB32(v222$1, v237$1), v238$1), v239$1), v240$1)), FSUB32(2147483648bv32, FMUL32(1065353216bv32, v237$1))) else v256$1);
    v256$2 := (if p15$2 then FADD32(FMUL32(FMUL32(FP64_CONV32(FDIV64(FP32_CONV64(1065353216bv32), 4602678819172646912bv64)), FPOW32(v219$2, 1073741824bv32)), FSUB32(FSUB32(FSUB32(FSUB32(v222$2, v237$2), v238$2), v239$2), v240$2)), FSUB32(2147483648bv32, FMUL32(1065353216bv32, v237$2))) else v256$2);
    v257$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v242$1, FPOW32(v219$1, 1073741824bv32)), v238$1), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1126498304bv32), v239$1))) else v257$1);
    v257$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v242$2, FPOW32(v219$2, 1073741824bv32)), v238$2), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1126498304bv32), v239$2))) else v257$2);
    v258$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v243$1, FPOW32(v219$1, 1073741824bv32)), v239$1), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1159512064bv32), v240$1))) else v258$1);
    v258$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v243$2, FPOW32(v219$2, 1073741824bv32)), v239$2), FSUB32(2147483648bv32, FMUL32(FDIV32(1092616192bv32, 1159512064bv32), v240$2))) else v258$2);
    v259$1 := (if p15$1 then FADD32(FMUL32(FMUL32(1110966272bv32, v226$1), v237$1), FSUB32(2147483648bv32, FMUL32(FMUL32(1126498304bv32, v247$1), v238$1))) else v259$1);
    v259$2 := (if p15$2 then FADD32(FMUL32(FMUL32(1110966272bv32, v226$2), v237$2), FSUB32(2147483648bv32, FMUL32(FMUL32(1126498304bv32, v247$2), v238$2))) else v259$2);
    v260$1 := (if p15$1 then FADD32(FMUL32(FMUL32(1110966272bv32, v227$1), v237$1), FSUB32(2147483648bv32, FMUL32(v247$1, v239$1))) else v260$1);
    v260$2 := (if p15$2 then FADD32(FMUL32(FMUL32(1110966272bv32, v227$2), v237$2), FSUB32(2147483648bv32, FMUL32(v247$2, v239$2))) else v260$2);
    v261$1 := (if p15$1 then FADD32(FMUL32(FMUL32(1110966272bv32, v228$1), v237$1), FSUB32(2147483648bv32, FMUL32(984245443bv32, v240$1))) else v261$1);
    v261$2 := (if p15$2 then FADD32(FMUL32(FMUL32(1110966272bv32, v228$2), v237$2), FSUB32(2147483648bv32, FMUL32(984245443bv32, v240$2))) else v261$2);
    v262$1 := (if p15$1 then FSUB32(FSUB32(FSUB32(FSUB32(FSUB32(1065353216bv32, v232$1), v233$1), v234$1), v235$1), v236$1) else v262$1);
    v262$2 := (if p15$2 then FSUB32(FSUB32(FSUB32(FSUB32(FSUB32(1065353216bv32, v232$2), v233$2), v234$2), v235$2), v236$2) else v262$2);
    v263$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v246$1, v227$1), v262$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v246$1, 1084227584bv32), v232$1))) else v263$1);
    v263$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v246$2, v227$2), v262$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v246$2, 1084227584bv32), v232$2))) else v263$2);
    v264$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v243$1, FPOW32(v219$1, 1073741824bv32)), v232$1), FSUB32(2147483648bv32, FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(1140457472bv32), 4584988679836335604bv64), 4617315517961601024bv64)), v233$1))) else v264$1);
    v264$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v243$2, FPOW32(v219$2, 1073741824bv32)), v232$2), FSUB32(2147483648bv32, FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(1140457472bv32), 4584988679836335604bv64), 4617315517961601024bv64)), v233$2))) else v264$2);
    v265$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v246$1, v228$1), v262$1), FSUB32(2147483648bv32, FMUL32(1074580685bv32, v233$1))) else v265$1);
    v265$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v246$2, v228$2), v262$2), FSUB32(2147483648bv32, FMUL32(1074580685bv32, v233$2))) else v265$2);
    v266$1 := (if p15$1 then FADD32(FADD32(FADD32(v233$1, v234$1), v235$1), v236$1) else v266$1);
    v266$2 := (if p15$2 then FADD32(FADD32(FADD32(v233$2, v234$2), v235$2), v236$2) else v266$2);
    v267$1 := (if p15$1 then FADD32(FMUL32(FP64_CONV32(FADD64(FMUL64(4579800533065604792bv64, FP32_CONV64(FPOW32(v266$1, 1077936128bv32))), FADD64(FMUL64(4588087156379966505bv64, FP32_CONV64(v266$1)), FMUL64(4575181641287773612bv64, FP32_CONV64(FPOW32(v266$1, 1073741824bv32)))))), v233$1), FSUB32(2147483648bv32, FDIV32(FMUL32(FMUL32(1071393014bv32, v223$1), v234$1), FADD32(FMUL32(v221$1, v234$1), 1094189056bv32)))) else v267$1);
    v267$2 := (if p15$2 then FADD32(FMUL32(FP64_CONV32(FADD64(FMUL64(4579800533065604792bv64, FP32_CONV64(FPOW32(v266$2, 1077936128bv32))), FADD64(FMUL64(4588087156379966505bv64, FP32_CONV64(v266$2)), FMUL64(4575181641287773612bv64, FP32_CONV64(FPOW32(v266$2, 1073741824bv32)))))), v233$2), FSUB32(2147483648bv32, FDIV32(FMUL32(FMUL32(1071393014bv32, v223$2), v234$2), FADD32(FMUL32(v221$2, v234$2), 1094189056bv32)))) else v267$2);
    v268$1 := (if p15$1 then FADD32(FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(1140457472bv32), 4540068552173843632bv64), 4617315517961601024bv64)), v234$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v243$1, FPOW32(v219$1, 1073741824bv32)), v235$1))) else v268$1);
    v268$2 := (if p15$2 then FADD32(FMUL32(FP64_CONV32(FDIV64(FMUL64(FP32_CONV64(1140457472bv32), 4540068552173843632bv64), 4617315517961601024bv64)), v234$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v243$2, FPOW32(v219$2, 1073741824bv32)), v235$2))) else v268$2);
    v269$1 := (if p15$1 then FADD32(FMUL32(FDIV32(1074580685bv32, 1148846080bv32), v234$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v246$1, v228$1), v236$1))) else v269$1);
    v269$2 := (if p15$2 then FADD32(FMUL32(FDIV32(1074580685bv32, 1148846080bv32), v234$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v246$2, v228$2), v236$2))) else v269$2);
    v270$1 := (if p15$1 then FADD32(FMUL32(FMUL32(v246$1, 1084227584bv32), v235$1), FSUB32(2147483648bv32, FMUL32(FMUL32(v246$1, v227$1), v236$1))) else v270$1);
    v270$2 := (if p15$2 then FADD32(FMUL32(FMUL32(v246$2, 1084227584bv32), v235$2), FSUB32(2147483648bv32, FMUL32(FMUL32(v246$2, v227$2), v236$2))) else v270$2);
    v271$1 := (if p15$1 then FDIV32(FMUL32(FMUL32(1071393014bv32, v223$1), v235$1), FADD32(FMUL32(v221$1, v235$1), 1094189056bv32)) else v271$1);
    v271$2 := (if p15$2 then FDIV32(FMUL32(FMUL32(1071393014bv32, v223$2), v235$2), FADD32(FMUL32(v221$2, v235$2), 1094189056bv32)) else v271$2);
    call {:sourceloc} {:sourceloc_num 230} _LOG_WRITE_$$d_finavalu(p15$1, 76bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(2147483648bv32, v248$1), v253$1), v259$1)))), $$d_finavalu[76bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 76bv32);
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 230} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 230} _CHECK_WRITE_$$d_finavalu(p15$2, 76bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(2147483648bv32, v248$2), v253$2), v259$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[76bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(2147483648bv32, v248$1), v253$1), v259$1)))) else $$d_finavalu[76bv32]);
    $$d_finavalu[76bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(2147483648bv32, v248$2), v253$2), v259$2)))) else $$d_finavalu[76bv32]);
    call {:sourceloc} {:sourceloc_num 231} _LOG_WRITE_$$d_finavalu(p15$1, 77bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(FSUB32(v248$1, v249$1), v254$1), v260$1), FMUL32(v221$1, FADD32(FSUB32(2147483648bv32, v263$1), v270$1)))))), $$d_finavalu[77bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 77bv32);
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 231} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 231} _CHECK_WRITE_$$d_finavalu(p15$2, 77bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(FSUB32(v248$2, v249$2), v254$2), v260$2), FMUL32(v221$2, FADD32(FSUB32(2147483648bv32, v263$2), v270$2)))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[77bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(FSUB32(v248$1, v249$1), v254$1), v260$1), FMUL32(v221$1, FADD32(FSUB32(2147483648bv32, v263$1), v270$1)))))) else $$d_finavalu[77bv32]);
    $$d_finavalu[77bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(FSUB32(v248$2, v249$2), v254$2), v260$2), FMUL32(v221$2, FADD32(FSUB32(2147483648bv32, v263$2), v270$2)))))) else $$d_finavalu[77bv32]);
    call {:sourceloc} {:sourceloc_num 232} _LOG_WRITE_$$d_finavalu(p15$1, 78bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(v249$1, v255$1), v261$1), FMUL32(v221$1, FADD32(FSUB32(2147483648bv32, v265$1), v269$1)))))), $$d_finavalu[78bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 78bv32);
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 232} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 232} _CHECK_WRITE_$$d_finavalu(p15$2, 78bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(v249$2, v255$2), v261$2), FMUL32(v221$2, FADD32(FSUB32(2147483648bv32, v265$2), v269$2)))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[78bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(v249$1, v255$1), v261$1), FMUL32(v221$1, FADD32(FSUB32(2147483648bv32, v265$1), v269$1)))))) else $$d_finavalu[78bv32]);
    $$d_finavalu[78bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(FSUB32(v249$2, v255$2), v261$2), FMUL32(v221$2, FADD32(FSUB32(2147483648bv32, v265$2), v269$2)))))) else $$d_finavalu[78bv32]);
    call {:sourceloc} {:sourceloc_num 233} _LOG_WRITE_$$d_finavalu(p15$1, 79bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v253$1, v251$1)))), $$d_finavalu[79bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 79bv32);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 233} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 233} _CHECK_WRITE_$$d_finavalu(p15$2, 79bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v253$2, v251$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[79bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v253$1, v251$1)))) else $$d_finavalu[79bv32]);
    $$d_finavalu[79bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v253$2, v251$2)))) else $$d_finavalu[79bv32]);
    call {:sourceloc} {:sourceloc_num 234} _LOG_WRITE_$$d_finavalu(p15$1, 80bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v251$1, v254$1), v252$1)))), $$d_finavalu[80bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 80bv32);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 234} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 234} _CHECK_WRITE_$$d_finavalu(p15$2, 80bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v251$2, v254$2), v252$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[80bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v251$1, v254$1), v252$1)))) else $$d_finavalu[80bv32]);
    $$d_finavalu[80bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v251$2, v254$2), v252$2)))) else $$d_finavalu[80bv32]);
    call {:sourceloc} {:sourceloc_num 235} _LOG_WRITE_$$d_finavalu(p15$1, 81bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v252$1, v255$1)))), $$d_finavalu[81bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 81bv32);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 235} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 235} _CHECK_WRITE_$$d_finavalu(p15$2, 81bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v252$2, v255$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[81bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v252$1, v255$1)))) else $$d_finavalu[81bv32]);
    $$d_finavalu[81bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v252$2, v255$2)))) else $$d_finavalu[81bv32]);
    call {:sourceloc} {:sourceloc_num 236} _LOG_WRITE_$$d_finavalu(p15$1, 82bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(v263$1, v264$1), v271$1)))), $$d_finavalu[82bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 82bv32);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 236} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 236} _CHECK_WRITE_$$d_finavalu(p15$2, 82bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(v263$2, v264$2), v271$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[82bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(v263$1, v264$1), v271$1)))) else $$d_finavalu[82bv32]);
    $$d_finavalu[82bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FSUB32(v263$2, v264$2), v271$2)))) else $$d_finavalu[82bv32]);
    call {:sourceloc} {:sourceloc_num 237} _LOG_WRITE_$$d_finavalu(p15$1, 83bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v265$1, v264$1), v267$1)))), $$d_finavalu[83bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 83bv32);
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 237} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 237} _CHECK_WRITE_$$d_finavalu(p15$2, 83bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v265$2, v264$2), v267$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[83bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v265$1, v264$1), v267$1)))) else $$d_finavalu[83bv32]);
    $$d_finavalu[83bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v265$2, v264$2), v267$2)))) else $$d_finavalu[83bv32]);
    call {:sourceloc} {:sourceloc_num 238} _LOG_WRITE_$$d_finavalu(p15$1, 84bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v267$1, v269$1), v268$1)))), $$d_finavalu[84bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 84bv32);
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 238} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 238} _CHECK_WRITE_$$d_finavalu(p15$2, 84bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v267$2, v269$2), v268$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[84bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v267$1, v269$1), v268$1)))) else $$d_finavalu[84bv32]);
    $$d_finavalu[84bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v267$2, v269$2), v268$2)))) else $$d_finavalu[84bv32]);
    call {:sourceloc} {:sourceloc_num 239} _LOG_WRITE_$$d_finavalu(p15$1, 85bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v268$1, v270$1), v271$1)))), $$d_finavalu[85bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 85bv32);
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 239} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 239} _CHECK_WRITE_$$d_finavalu(p15$2, 85bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v268$2, v270$2), v271$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[85bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v268$1, v270$1), v271$1)))) else $$d_finavalu[85bv32]);
    $$d_finavalu[85bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(v268$2, v270$2), v271$2)))) else $$d_finavalu[85bv32]);
    call {:sourceloc} {:sourceloc_num 240} _LOG_WRITE_$$d_finavalu(p15$1, 86bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v269$1, v270$1), FDIV32(FMUL32(FMUL32(1071393014bv32, v223$1), v236$1), FADD32(FMUL32(v221$1, v236$1), 1094189056bv32)))))), $$d_finavalu[86bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 86bv32);
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 240} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 240} _CHECK_WRITE_$$d_finavalu(p15$2, 86bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v269$2, v270$2), FDIV32(FMUL32(FMUL32(1071393014bv32, v223$2), v236$2), FADD32(FMUL32(v221$2, v236$2), 1094189056bv32)))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[86bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v269$1, v270$1), FDIV32(FMUL32(FMUL32(1071393014bv32, v223$1), v236$1), FADD32(FMUL32(v221$1, v236$1), 1094189056bv32)))))) else $$d_finavalu[86bv32]);
    $$d_finavalu[86bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v269$2, v270$2), FDIV32(FMUL32(FMUL32(1071393014bv32, v223$2), v236$2), FADD32(FMUL32(v221$2, v236$2), 1094189056bv32)))))) else $$d_finavalu[86bv32]);
    call {:sourceloc} {:sourceloc_num 241} _LOG_WRITE_$$d_finavalu(p15$1, 87bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(v256$1, v259$1), v260$1), v261$1)))), $$d_finavalu[87bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 87bv32);
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 241} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 241} _CHECK_WRITE_$$d_finavalu(p15$2, 87bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(v256$2, v259$2), v260$2), v261$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[87bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(v256$1, v259$1), v260$1), v261$1)))) else $$d_finavalu[87bv32]);
    $$d_finavalu[87bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FSUB32(FSUB32(v256$2, v259$2), v260$2), v261$2)))) else $$d_finavalu[87bv32]);
    call {:sourceloc} {:sourceloc_num 242} _LOG_WRITE_$$d_finavalu(p15$1, 88bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v259$1, v257$1)))), $$d_finavalu[88bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 88bv32);
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 242} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 242} _CHECK_WRITE_$$d_finavalu(p15$2, 88bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v259$2, v257$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[88bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v259$1, v257$1)))) else $$d_finavalu[88bv32]);
    $$d_finavalu[88bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(v259$2, v257$2)))) else $$d_finavalu[88bv32]);
    call {:sourceloc} {:sourceloc_num 243} _LOG_WRITE_$$d_finavalu(p15$1, 89bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v260$1, v257$1), v258$1)))), $$d_finavalu[89bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 89bv32);
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 243} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 243} _CHECK_WRITE_$$d_finavalu(p15$2, 89bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v260$2, v257$2), v258$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[89bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v260$1, v257$1), v258$1)))) else $$d_finavalu[89bv32]);
    $$d_finavalu[89bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FSUB32(FADD32(v260$2, v257$2), v258$2)))) else $$d_finavalu[89bv32]);
    call {:sourceloc} {:sourceloc_num 244} _LOG_WRITE_$$d_finavalu(p15$1, 90bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v261$1, v258$1)))), $$d_finavalu[90bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(p15$2, 90bv32);
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 244} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 244} _CHECK_WRITE_$$d_finavalu(p15$2, 90bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v261$2, v258$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_finavalu"} true;
    $$d_finavalu[90bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v261$1, v258$1)))) else $$d_finavalu[90bv32]);
    $$d_finavalu[90bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(v261$2, v258$2)))) else $$d_finavalu[90bv32]);
    call {:sourceloc} {:sourceloc_num 245} _LOG_WRITE_$$d_com(p15$1, 2bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FMUL32(FMUL32(1073741824bv32, v221$1), FSUB32(v268$1, v264$1)), FSUB32(2147483648bv32, FMUL32(1073741824bv32, FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v248$1, v249$1), v251$1), v252$1), v256$1), v257$1), v258$1))))))), $$d_com[2bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_com(p15$2, 2bv32);
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 245} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 245} _CHECK_WRITE_$$d_com(p15$2, 2bv32, FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FMUL32(FMUL32(1073741824bv32, v221$2), FSUB32(v268$2, v264$2)), FSUB32(2147483648bv32, FMUL32(1073741824bv32, FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v248$2, v249$2), v251$2), v252$2), v256$2), v257$2), v258$2))))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_com"} true;
    $$d_com[2bv32] := (if p15$1 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FMUL32(FMUL32(1073741824bv32, v221$1), FSUB32(v268$1, v264$1)), FSUB32(2147483648bv32, FMUL32(1073741824bv32, FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v248$1, v249$1), v251$1), v252$1), v256$1), v257$1), v258$1))))))) else $$d_com[2bv32]);
    $$d_com[2bv32] := (if p15$2 then FP64_CONV32(FMUL64(4562254508917369340bv64, FP32_CONV64(FADD32(FMUL32(FMUL32(1073741824bv32, v221$2), FSUB32(v268$2, v264$2)), FSUB32(2147483648bv32, FMUL32(1073741824bv32, FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(v248$2, v249$2), v251$2), v252$2), v256$2), v257$2), v258$2))))))) else $$d_com[2bv32]);
    return;
}



procedure {:source_name "__log10_float"} $__log10_float(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "fmodf"} $fmodf(_P$1: bool, $0$1: bv32, $1$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$d_initvalu: bv32;

procedure {:inline 1} _LOG_READ_$$d_initvalu(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_initvalu;



implementation {:inline 1} _LOG_READ_$$d_initvalu(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_initvalu := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_initvalu == _value then true else _READ_HAS_OCCURRED_$$d_initvalu);
    return;
}



procedure _CHECK_READ_$$d_initvalu(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_initvalu"} {:array "$$d_initvalu"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_initvalu && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_initvalu);
  requires {:source_name "d_initvalu"} {:array "$$d_initvalu"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_initvalu && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_initvalu: bool;

procedure {:inline 1} _LOG_WRITE_$$d_initvalu(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_initvalu, _WRITE_READ_BENIGN_FLAG_$$d_initvalu;



implementation {:inline 1} _LOG_WRITE_$$d_initvalu(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_initvalu := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_initvalu == _value then true else _WRITE_HAS_OCCURRED_$$d_initvalu);
    _WRITE_READ_BENIGN_FLAG_$$d_initvalu := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_initvalu == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_initvalu);
    return;
}



procedure _CHECK_WRITE_$$d_initvalu(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_initvalu"} {:array "$$d_initvalu"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_initvalu && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_initvalu != _value);
  requires {:source_name "d_initvalu"} {:array "$$d_initvalu"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_initvalu && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_initvalu != _value);
  requires {:source_name "d_initvalu"} {:array "$$d_initvalu"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_initvalu && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_initvalu(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_initvalu;



implementation {:inline 1} _LOG_ATOMIC_$$d_initvalu(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_initvalu := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_initvalu);
    return;
}



procedure _CHECK_ATOMIC_$$d_initvalu(_P: bool, _offset: bv32);
  requires {:source_name "d_initvalu"} {:array "$$d_initvalu"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_initvalu && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_initvalu"} {:array "$$d_initvalu"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_initvalu && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_initvalu(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_initvalu;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_initvalu(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_initvalu := (if _P && _WRITE_HAS_OCCURRED_$$d_initvalu && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_initvalu);
    return;
}



const _WATCHED_VALUE_$$d_finavalu: bv32;

procedure {:inline 1} _LOG_READ_$$d_finavalu(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_finavalu;



implementation {:inline 1} _LOG_READ_$$d_finavalu(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_finavalu := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_finavalu == _value then true else _READ_HAS_OCCURRED_$$d_finavalu);
    return;
}



procedure _CHECK_READ_$$d_finavalu(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_finavalu"} {:array "$$d_finavalu"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_finavalu && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_finavalu);
  requires {:source_name "d_finavalu"} {:array "$$d_finavalu"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_finavalu && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_finavalu: bool;

procedure {:inline 1} _LOG_WRITE_$$d_finavalu(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_finavalu, _WRITE_READ_BENIGN_FLAG_$$d_finavalu;



implementation {:inline 1} _LOG_WRITE_$$d_finavalu(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_finavalu := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_finavalu == _value then true else _WRITE_HAS_OCCURRED_$$d_finavalu);
    _WRITE_READ_BENIGN_FLAG_$$d_finavalu := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_finavalu == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_finavalu);
    return;
}



procedure _CHECK_WRITE_$$d_finavalu(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_finavalu"} {:array "$$d_finavalu"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_finavalu && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_finavalu != _value);
  requires {:source_name "d_finavalu"} {:array "$$d_finavalu"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_finavalu && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_finavalu != _value);
  requires {:source_name "d_finavalu"} {:array "$$d_finavalu"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_finavalu && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_finavalu(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_finavalu;



implementation {:inline 1} _LOG_ATOMIC_$$d_finavalu(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_finavalu := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_finavalu);
    return;
}



procedure _CHECK_ATOMIC_$$d_finavalu(_P: bool, _offset: bv32);
  requires {:source_name "d_finavalu"} {:array "$$d_finavalu"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_finavalu && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_finavalu"} {:array "$$d_finavalu"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_finavalu && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_finavalu;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_finavalu(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_finavalu := (if _P && _WRITE_HAS_OCCURRED_$$d_finavalu && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_finavalu);
    return;
}



const _WATCHED_VALUE_$$d_params: bv32;

procedure {:inline 1} _LOG_READ_$$d_params(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_params;



implementation {:inline 1} _LOG_READ_$$d_params(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_params := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_params == _value then true else _READ_HAS_OCCURRED_$$d_params);
    return;
}



procedure _CHECK_READ_$$d_params(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_params"} {:array "$$d_params"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_params && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_params);
  requires {:source_name "d_params"} {:array "$$d_params"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_params && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_params: bool;

procedure {:inline 1} _LOG_WRITE_$$d_params(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_params, _WRITE_READ_BENIGN_FLAG_$$d_params;



implementation {:inline 1} _LOG_WRITE_$$d_params(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_params := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_params == _value then true else _WRITE_HAS_OCCURRED_$$d_params);
    _WRITE_READ_BENIGN_FLAG_$$d_params := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_params == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_params);
    return;
}



procedure _CHECK_WRITE_$$d_params(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_params"} {:array "$$d_params"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_params && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_params != _value);
  requires {:source_name "d_params"} {:array "$$d_params"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_params && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_params != _value);
  requires {:source_name "d_params"} {:array "$$d_params"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_params && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_params(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_params;



implementation {:inline 1} _LOG_ATOMIC_$$d_params(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_params := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_params);
    return;
}



procedure _CHECK_ATOMIC_$$d_params(_P: bool, _offset: bv32);
  requires {:source_name "d_params"} {:array "$$d_params"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_params && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_params"} {:array "$$d_params"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_params && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_params(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_params;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_params(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_params := (if _P && _WRITE_HAS_OCCURRED_$$d_params && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_params);
    return;
}



const _WATCHED_VALUE_$$d_com: bv32;

procedure {:inline 1} _LOG_READ_$$d_com(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_com;



implementation {:inline 1} _LOG_READ_$$d_com(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_com := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_com == _value then true else _READ_HAS_OCCURRED_$$d_com);
    return;
}



procedure _CHECK_READ_$$d_com(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_com"} {:array "$$d_com"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_com && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_com);
  requires {:source_name "d_com"} {:array "$$d_com"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_com && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_com: bool;

procedure {:inline 1} _LOG_WRITE_$$d_com(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_com, _WRITE_READ_BENIGN_FLAG_$$d_com;



implementation {:inline 1} _LOG_WRITE_$$d_com(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_com := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_com == _value then true else _WRITE_HAS_OCCURRED_$$d_com);
    _WRITE_READ_BENIGN_FLAG_$$d_com := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_com == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_com);
    return;
}



procedure _CHECK_WRITE_$$d_com(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_com"} {:array "$$d_com"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_com && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_com != _value);
  requires {:source_name "d_com"} {:array "$$d_com"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_com && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_com != _value);
  requires {:source_name "d_com"} {:array "$$d_com"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_com && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_com(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_com;



implementation {:inline 1} _LOG_ATOMIC_$$d_com(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_com := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_com);
    return;
}



procedure _CHECK_ATOMIC_$$d_com(_P: bool, _offset: bv32);
  requires {:source_name "d_com"} {:array "$$d_com"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_com && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_com"} {:array "$$d_com"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_com && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_com(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_com;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_com(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_com := (if _P && _WRITE_HAS_OCCURRED_$$d_com && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_com);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
