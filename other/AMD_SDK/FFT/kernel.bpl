type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "greal"} {:global} $$greal: [bv32]bv32;

axiom {:array_info "$$greal"} {:global} {:elem_width 32} {:source_name "greal"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$greal: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$greal: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$greal: bool;

var {:source_name "gimag"} {:global} $$gimag: [bv32]bv32;

axiom {:array_info "$$gimag"} {:global} {:elem_width 32} {:source_name "gimag"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$gimag: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$gimag: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$gimag: bool;

var {:source_name "lds"} {:group_shared} $$kfft.lds: [bv1][bv32]bv32;

axiom {:array_info "$$kfft.lds"} {:group_shared} {:elem_width 32} {:source_name "lds"} {:source_elem_width 32} {:source_dimensions "2176"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$kfft.lds: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$kfft.lds: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$kfft.lds: bool;

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

function FMUL32(bv32, bv32) : bv32;

function FSIN32(bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "sign_extend 31"} BV1_SEXT32(bv1) : bv32;

procedure {:source_name "kfft"} {:kernel} $kfft();
  requires !_READ_HAS_OCCURRED_$$greal && !_WRITE_HAS_OCCURRED_$$greal && !_ATOMIC_HAS_OCCURRED_$$greal;
  requires !_READ_HAS_OCCURRED_$$gimag && !_WRITE_HAS_OCCURRED_$$gimag && !_ATOMIC_HAS_OCCURRED_$$gimag;
  requires !_READ_HAS_OCCURRED_$$kfft.lds && !_WRITE_HAS_OCCURRED_$$kfft.lds && !_ATOMIC_HAS_OCCURRED_$$kfft.lds;
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
  modifies $$kfft.lds, _READ_HAS_OCCURRED_$$greal, _READ_HAS_OCCURRED_$$gimag, _WRITE_HAS_OCCURRED_$$kfft.lds, _WRITE_READ_BENIGN_FLAG_$$kfft.lds, _WRITE_READ_BENIGN_FLAG_$$kfft.lds, $$greal, $$gimag, _TRACKING, _READ_HAS_OCCURRED_$$kfft.lds, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _WRITE_HAS_OCCURRED_$$greal, _WRITE_READ_BENIGN_FLAG_$$greal, _WRITE_READ_BENIGN_FLAG_$$greal, _WRITE_HAS_OCCURRED_$$gimag, _WRITE_READ_BENIGN_FLAG_$$gimag, _WRITE_READ_BENIGN_FLAG_$$gimag;



implementation {:source_name "kfft"} {:kernel} $kfft()
{
  var $.0$1: bv32;
  var $.0$2: bv32;
  var $.02$1: bv32;
  var $.02$2: bv32;
  var $.01$1: bv32;
  var $.01$2: bv32;
  var $.03$1: bv32;
  var $.03$2: bv32;
  var $.05$1: bv32;
  var $.05$2: bv32;
  var $.04$1: bv32;
  var $.04$2: bv32;
  var $.08$1: bv32;
  var $.08$2: bv32;
  var $.06$1: bv32;
  var $.06$2: bv32;
  var $.07$1: bv32;
  var $.07$2: bv32;
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
  var v33$1: bv32;
  var v33$2: bv32;
  var v34$1: bv32;
  var v34$2: bv32;
  var v35$1: bv32;
  var v35$2: bv32;
  var v36$1: bv32;
  var v36$2: bv32;
  var v84$1: bv32;
  var v84$2: bv32;
  var v52$1: bv32;
  var v52$2: bv32;
  var v37$1: bv32;
  var v37$2: bv32;
  var v38$1: bv32;
  var v38$2: bv32;
  var v39$1: bv32;
  var v39$2: bv32;
  var v40$1: bv32;
  var v40$2: bv32;
  var v85$1: bv32;
  var v85$2: bv32;
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
  var v18$1: bv32;
  var v18$2: bv32;
  var v41$1: bv32;
  var v41$2: bv32;
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
  var v19$1: bv32;
  var v19$2: bv32;
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
  var v95$1: bv32;
  var v95$2: bv32;
  var v94$1: bv32;
  var v94$2: bv32;
  var v96$1: bv32;
  var v96$2: bv32;
  var v98$1: bv32;
  var v98$2: bv32;
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
  var v110$1: bv32;
  var v110$2: bv32;
  var v109$1: bv32;
  var v109$2: bv32;
  var v111$1: bv32;
  var v111$2: bv32;
  var v112$1: bv32;
  var v112$2: bv32;
  var v153$1: bv32;
  var v153$2: bv32;
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
  var v126$1: bv32;
  var v126$2: bv32;
  var v125$1: bv32;
  var v125$2: bv32;
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
  var v187$1: bv32;
  var v187$2: bv32;
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
  var v232$1: bool;
  var v232$2: bool;
  var v233$1: bv32;
  var v233$2: bv32;
  var v234$1: bv32;
  var v234$2: bv32;
  var v235$1: bv32;
  var v235$2: bv32;
  var v237$1: bool;
  var v237$2: bool;
  var v236$1: bv32;
  var v236$2: bv32;
  var v238$1: bv32;
  var v238$2: bv32;
  var v239$1: bv32;
  var v239$2: bv32;
  var v240$1: bv32;
  var v240$2: bv32;
  var v242$1: bool;
  var v242$2: bool;
  var v241$1: bv32;
  var v241$2: bv32;
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
  var v301$1: bv32;
  var v301$2: bv32;
  var v302$1: bv32;
  var v302$2: bv32;
  var v303$1: bv32;
  var v303$2: bv32;
  var v304$1: bv32;
  var v304$2: bv32;
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
  var v299$1: bv32;
  var v299$2: bv32;
  var v300$1: bv32;
  var v300$2: bv32;
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
  var v337$1: bool;
  var v337$2: bool;
  var v338$1: bv32;
  var v338$2: bv32;
  var v339$1: bv32;
  var v339$2: bv32;
  var v340$1: bv32;
  var v340$2: bv32;
  var v342$1: bool;
  var v342$2: bool;
  var v341$1: bv32;
  var v341$2: bv32;
  var v343$1: bv32;
  var v343$2: bv32;
  var v344$1: bv32;
  var v344$2: bv32;
  var v345$1: bv32;
  var v345$2: bv32;
  var v347$1: bool;
  var v347$2: bool;
  var v346$1: bv32;
  var v346$2: bv32;
  var v348$1: bv32;
  var v348$2: bv32;
  var v349$1: bv32;
  var v349$2: bv32;
  var v350$1: bv32;
  var v350$2: bv32;
  var v352$1: bv32;
  var v352$2: bv32;
  var v351$1: bv32;
  var v351$2: bv32;
  var v401$1: bv32;
  var v401$2: bv32;
  var v402$1: bv32;
  var v402$2: bv32;
  var v403$1: bv32;
  var v403$2: bv32;
  var v404$1: bv32;
  var v404$2: bv32;
  var v353$1: bv32;
  var v353$2: bv32;
  var v354$1: bv32;
  var v354$2: bv32;
  var v355$1: bv32;
  var v355$2: bv32;
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
  var v365$1: bv32;
  var v365$2: bv32;
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
  var v372$1: bv32;
  var v372$2: bv32;
  var v373$1: bv32;
  var v373$2: bv32;
  var v374$1: bv32;
  var v374$2: bv32;
  var v375$1: bv32;
  var v375$2: bv32;
  var v376$1: bv32;
  var v376$2: bv32;
  var v377$1: bv32;
  var v377$2: bv32;
  var v378$1: bv32;
  var v378$2: bv32;
  var v379$1: bv32;
  var v379$2: bv32;
  var v380$1: bv32;
  var v380$2: bv32;
  var v381$1: bv32;
  var v381$2: bv32;
  var v382$1: bv32;
  var v382$2: bv32;
  var v383$1: bv32;
  var v383$2: bv32;
  var v400$1: bv32;
  var v400$2: bv32;
  var v384$1: bv32;
  var v384$2: bv32;
  var v385$1: bv32;
  var v385$2: bv32;
  var v386$1: bv32;
  var v386$2: bv32;
  var v387$1: bv32;
  var v387$2: bv32;
  var v388$1: bv32;
  var v388$2: bv32;
  var v389$1: bv32;
  var v389$2: bv32;
  var v390$1: bv32;
  var v390$2: bv32;
  var v391$1: bv32;
  var v391$2: bv32;
  var v392$1: bv32;
  var v392$2: bv32;
  var v393$1: bv32;
  var v393$2: bv32;
  var v394$1: bv32;
  var v394$2: bv32;
  var v395$1: bv32;
  var v395$2: bv32;
  var v396$1: bv32;
  var v396$2: bv32;
  var v397$1: bv32;
  var v397$2: bv32;
  var v398$1: bv32;
  var v398$2: bv32;
  var v399$1: bv32;
  var v399$2: bv32;
  var v405$1: bv32;
  var v405$2: bv32;
  var v406$1: bv32;
  var v406$2: bv32;
  var v407$1: bv32;
  var v407$2: bv32;
  var v408$1: bv32;
  var v408$2: bv32;
  var v409$1: bv32;
  var v409$2: bv32;
  var v410$1: bv32;
  var v410$2: bv32;
  var v411$1: bv32;
  var v411$2: bv32;
  var v412$1: bv32;
  var v412$2: bv32;
  var v413$1: bv32;
  var v413$2: bv32;
  var v414$1: bv32;
  var v414$2: bv32;
  var v415$1: bv32;
  var v415$2: bv32;
  var v416$1: bv32;
  var v416$2: bv32;
  var v417$1: bv32;
  var v417$2: bv32;
  var v418$1: bv32;
  var v418$2: bv32;
  var v419$1: bv32;
  var v419$2: bv32;
  var v420$1: bv32;
  var v420$2: bv32;
  var v421$1: bv32;
  var v421$2: bv32;
  var v422$1: bv32;
  var v422$2: bv32;
  var v423$1: bv32;
  var v423$2: bv32;
  var v424$1: bv32;
  var v424$2: bv32;
  var v425$1: bv32;
  var v425$2: bv32;
  var v426$1: bv32;
  var v426$2: bv32;
  var v427$1: bv32;
  var v427$2: bv32;
  var v428$1: bv32;
  var v428$2: bv32;
  var v429$1: bv32;
  var v429$2: bv32;
  var v430$1: bv32;
  var v430$2: bv32;
  var v431$1: bv32;
  var v431$2: bv32;
  var v432$1: bv32;
  var v432$2: bv32;
  var v433$1: bv32;
  var v433$2: bv32;
  var v434$1: bv32;
  var v434$2: bv32;
  var v435$1: bv32;
  var v435$2: bv32;
  var v436$1: bv32;
  var v436$2: bv32;
  var v437$1: bv32;
  var v437$2: bv32;
  var v438$1: bv32;
  var v438$2: bv32;
  var v439$1: bv32;
  var v439$2: bv32;
  var v440$1: bv32;
  var v440$2: bv32;
  var v441$1: bool;
  var v441$2: bool;
  var v442$1: bv32;
  var v442$2: bv32;
  var v443$1: bv32;
  var v443$2: bv32;
  var v444$1: bv32;
  var v444$2: bv32;
  var v446$1: bool;
  var v446$2: bool;
  var v445$1: bv32;
  var v445$2: bv32;
  var v447$1: bv32;
  var v447$2: bv32;
  var v448$1: bv32;
  var v448$2: bv32;
  var v449$1: bv32;
  var v449$2: bv32;
  var v451$1: bool;
  var v451$2: bool;
  var v450$1: bv32;
  var v450$2: bv32;
  var v452$1: bv32;
  var v452$2: bv32;
  var v453$1: bv32;
  var v453$2: bv32;
  var v454$1: bv32;
  var v454$2: bv32;
  var v457$1: bv32;
  var v457$2: bv32;
  var v455$1: bv32;
  var v455$2: bv32;
  var v456$1: bv32;
  var v456$2: bv32;
  var v505$1: bv32;
  var v505$2: bv32;
  var v506$1: bv32;
  var v506$2: bv32;
  var v507$1: bv32;
  var v507$2: bv32;
  var v508$1: bv32;
  var v508$2: bv32;
  var v458$1: bv32;
  var v458$2: bv32;
  var v459$1: bv32;
  var v459$2: bv32;
  var v460$1: bv32;
  var v460$2: bv32;
  var v461$1: bv32;
  var v461$2: bv32;
  var v462$1: bv32;
  var v462$2: bv32;
  var v463$1: bv32;
  var v463$2: bv32;
  var v464$1: bv32;
  var v464$2: bv32;
  var v465$1: bv32;
  var v465$2: bv32;
  var v466$1: bv32;
  var v466$2: bv32;
  var v467$1: bv32;
  var v467$2: bv32;
  var v468$1: bv32;
  var v468$2: bv32;
  var v469$1: bv32;
  var v469$2: bv32;
  var v470$1: bv32;
  var v470$2: bv32;
  var v471$1: bv32;
  var v471$2: bv32;
  var v472$1: bv32;
  var v472$2: bv32;
  var v473$1: bv32;
  var v473$2: bv32;
  var v474$1: bv32;
  var v474$2: bv32;
  var v475$1: bv32;
  var v475$2: bv32;
  var v476$1: bv32;
  var v476$2: bv32;
  var v477$1: bv32;
  var v477$2: bv32;
  var v478$1: bv32;
  var v478$2: bv32;
  var v479$1: bv32;
  var v479$2: bv32;
  var v480$1: bv32;
  var v480$2: bv32;
  var v481$1: bv32;
  var v481$2: bv32;
  var v482$1: bv32;
  var v482$2: bv32;
  var v483$1: bv32;
  var v483$2: bv32;
  var v484$1: bv32;
  var v484$2: bv32;
  var v485$1: bv32;
  var v485$2: bv32;
  var v486$1: bv32;
  var v486$2: bv32;
  var v487$1: bv32;
  var v487$2: bv32;
  var v503$1: bv32;
  var v503$2: bv32;
  var v504$1: bv32;
  var v504$2: bv32;
  var v488$1: bv32;
  var v488$2: bv32;
  var v489$1: bv32;
  var v489$2: bv32;
  var v490$1: bv32;
  var v490$2: bv32;
  var v491$1: bv32;
  var v491$2: bv32;
  var v492$1: bv32;
  var v492$2: bv32;
  var v493$1: bv32;
  var v493$2: bv32;
  var v494$1: bv32;
  var v494$2: bv32;
  var v495$1: bv32;
  var v495$2: bv32;
  var v496$1: bv32;
  var v496$2: bv32;
  var v497$1: bv32;
  var v497$2: bv32;
  var v498$1: bv32;
  var v498$2: bv32;
  var v499$1: bv32;
  var v499$2: bv32;
  var v500$1: bv32;
  var v500$2: bv32;
  var v501$1: bv32;
  var v501$2: bv32;
  var v502$1: bv32;
  var v502$2: bv32;
  var v509$1: bv32;
  var v509$2: bv32;
  var v510$1: bv32;
  var v510$2: bv32;
  var v511$1: bv32;
  var v511$2: bv32;
  var v512$1: bv32;
  var v512$2: bv32;
  var v513$1: bv32;
  var v513$2: bv32;
  var v514$1: bv32;
  var v514$2: bv32;
  var v515$1: bv32;
  var v515$2: bv32;
  var v516$1: bv32;
  var v516$2: bv32;
  var v517$1: bv32;
  var v517$2: bv32;
  var v518$1: bv32;
  var v518$2: bv32;
  var v519$1: bv32;
  var v519$2: bv32;
  var v520$1: bv32;
  var v520$2: bv32;
  var v521$1: bv32;
  var v521$2: bv32;
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


  __partitioned_block_$0_0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_AND(v0$1, 63bv32);
    v1$2 := BV32_AND(v0$2, 63bv32);
    v2$1 := BV32_MUL(BV32_LSHR(v0$1, 6bv32), 1024bv32);
    v2$2 := BV32_MUL(BV32_LSHR(v0$2, 6bv32), 1024bv32);
    v3$1 := BV32_SHL(v1$1, 2bv32);
    v3$2 := BV32_SHL(v1$2, 2bv32);
    call {:sourceloc} {:sourceloc_num 1} _LOG_READ_$$greal(true, BV32_ADD(v2$1, v3$1), $$greal[BV32_ADD(v2$1, v3$1)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 1} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 1} _CHECK_READ_$$greal(true, BV32_ADD(v2$2, v3$2), $$greal[BV32_ADD(v2$2, v3$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v4$1 := $$greal[BV32_ADD(v2$1, v3$1)];
    v4$2 := $$greal[BV32_ADD(v2$2, v3$2)];
    call {:sourceloc} {:sourceloc_num 2} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 1bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 2} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 1bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v5$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 1bv32)];
    v5$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 1bv32)];
    call {:sourceloc} {:sourceloc_num 3} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 2bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 3} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 2bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v6$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 2bv32)];
    v6$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 2bv32)];
    call {:sourceloc} {:sourceloc_num 4} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 3bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 4} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 3bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v7$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 3bv32)];
    v7$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 3bv32)];
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 256bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 256bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 256bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 256bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v8$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 256bv32)];
    v8$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 256bv32)];
    call {:sourceloc} {:sourceloc_num 6} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 257bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 257bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 6} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 257bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 257bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v9$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 257bv32)];
    v9$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 257bv32)];
    call {:sourceloc} {:sourceloc_num 7} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 258bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 258bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 7} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 258bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 258bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v10$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 258bv32)];
    v10$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 258bv32)];
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 259bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 259bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 259bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 259bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v11$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 259bv32)];
    v11$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 259bv32)];
    call {:sourceloc} {:sourceloc_num 9} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 512bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 512bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 9} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 512bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 512bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v12$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 512bv32)];
    v12$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 512bv32)];
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 513bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 513bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 513bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 513bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v13$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 513bv32)];
    v13$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 513bv32)];
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 514bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 514bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 514bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 514bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v14$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 514bv32)];
    v14$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 514bv32)];
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 515bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 515bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 515bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 515bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v15$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 515bv32)];
    v15$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 515bv32)];
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 768bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 768bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 768bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 768bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v16$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 768bv32)];
    v16$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 768bv32)];
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 769bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 769bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 769bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 769bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v17$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 769bv32)];
    v17$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 769bv32)];
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 770bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 770bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 770bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 770bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v18$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 770bv32)];
    v18$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 770bv32)];
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v3$1), 771bv32), $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 771bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v3$2), 771bv32), $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 771bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$greal"} true;
    v19$1 := $$greal[BV32_ADD(BV32_ADD(v2$1, v3$1), 771bv32)];
    v19$2 := $$greal[BV32_ADD(BV32_ADD(v2$2, v3$2), 771bv32)];
    v20$1 := BV32_SHL(v1$1, 2bv32);
    v20$2 := BV32_SHL(v1$2, 2bv32);
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$gimag(true, BV32_ADD(v2$1, v20$1), $$gimag[BV32_ADD(v2$1, v20$1)]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$gimag(true, BV32_ADD(v2$2, v20$2), $$gimag[BV32_ADD(v2$2, v20$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v21$1 := $$gimag[BV32_ADD(v2$1, v20$1)];
    v21$2 := $$gimag[BV32_ADD(v2$2, v20$2)];
    call {:sourceloc} {:sourceloc_num 18} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 1bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 18} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 1bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v22$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 1bv32)];
    v22$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 1bv32)];
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 2bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 2bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v23$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 2bv32)];
    v23$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 2bv32)];
    call {:sourceloc} {:sourceloc_num 20} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 3bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 20} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 3bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v24$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 3bv32)];
    v24$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 3bv32)];
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 256bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 256bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 256bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 256bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v25$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 256bv32)];
    v25$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 256bv32)];
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 257bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 257bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 257bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 257bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v26$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 257bv32)];
    v26$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 257bv32)];
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 258bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 258bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 258bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 258bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v27$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 258bv32)];
    v27$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 258bv32)];
    call {:sourceloc} {:sourceloc_num 24} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 259bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 259bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 24} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 259bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 259bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v28$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 259bv32)];
    v28$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 259bv32)];
    call {:sourceloc} {:sourceloc_num 25} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 512bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 512bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 25} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 512bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 512bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v29$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 512bv32)];
    v29$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 512bv32)];
    call {:sourceloc} {:sourceloc_num 26} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 513bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 513bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 26} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 513bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 513bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v30$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 513bv32)];
    v30$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 513bv32)];
    call {:sourceloc} {:sourceloc_num 27} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 514bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 514bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 27} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 514bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 514bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v31$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 514bv32)];
    v31$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 514bv32)];
    call {:sourceloc} {:sourceloc_num 28} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 515bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 515bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 28} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 515bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 515bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v32$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 515bv32)];
    v32$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 515bv32)];
    call {:sourceloc} {:sourceloc_num 29} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 768bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 768bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 29} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 768bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 768bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v33$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 768bv32)];
    v33$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 768bv32)];
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 769bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 769bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 769bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 769bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v34$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 769bv32)];
    v34$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 769bv32)];
    call {:sourceloc} {:sourceloc_num 31} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 770bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 770bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 31} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 770bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 770bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v35$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 770bv32)];
    v35$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 770bv32)];
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v20$1), 771bv32), $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 771bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v20$2), 771bv32), $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 771bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gimag"} true;
    v36$1 := $$gimag[BV32_ADD(BV32_ADD(v2$1, v20$1), 771bv32)];
    v36$2 := $$gimag[BV32_ADD(BV32_ADD(v2$2, v20$2), 771bv32)];
    v37$1 := FADD32(v4$1, v12$1);
    v37$2 := FADD32(v4$2, v12$2);
    v38$1 := FADD32(v5$1, v13$1);
    v38$2 := FADD32(v5$2, v13$2);
    v39$1 := FADD32(v6$1, v14$1);
    v39$2 := FADD32(v6$2, v14$2);
    v40$1 := FADD32(v7$1, v15$1);
    v40$2 := FADD32(v7$2, v15$2);
    v41$1 := FADD32(v8$1, v16$1);
    v41$2 := FADD32(v8$2, v16$2);
    v42$1 := FADD32(v9$1, v17$1);
    v42$2 := FADD32(v9$2, v17$2);
    v43$1 := FADD32(v10$1, v18$1);
    v43$2 := FADD32(v10$2, v18$2);
    v44$1 := FADD32(v11$1, v19$1);
    v44$2 := FADD32(v11$2, v19$2);
    v45$1 := FSUB32(v4$1, v12$1);
    v45$2 := FSUB32(v4$2, v12$2);
    v46$1 := FSUB32(v5$1, v13$1);
    v46$2 := FSUB32(v5$2, v13$2);
    v47$1 := FSUB32(v6$1, v14$1);
    v47$2 := FSUB32(v6$2, v14$2);
    v48$1 := FSUB32(v7$1, v15$1);
    v48$2 := FSUB32(v7$2, v15$2);
    v49$1 := FSUB32(v37$1, v41$1);
    v49$2 := FSUB32(v37$2, v41$2);
    v50$1 := FSUB32(v38$1, v42$1);
    v50$2 := FSUB32(v38$2, v42$2);
    v51$1 := FSUB32(v39$1, v43$1);
    v51$2 := FSUB32(v39$2, v43$2);
    v52$1 := FSUB32(v40$1, v44$1);
    v52$2 := FSUB32(v40$2, v44$2);
    v53$1 := FSUB32(v8$1, v16$1);
    v53$2 := FSUB32(v8$2, v16$2);
    v54$1 := FSUB32(v9$1, v17$1);
    v54$2 := FSUB32(v9$2, v17$2);
    v55$1 := FSUB32(v10$1, v18$1);
    v55$2 := FSUB32(v10$2, v18$2);
    v56$1 := FSUB32(v11$1, v19$1);
    v56$2 := FSUB32(v11$2, v19$2);
    v57$1 := FADD32(v21$1, v29$1);
    v57$2 := FADD32(v21$2, v29$2);
    v58$1 := FADD32(v22$1, v30$1);
    v58$2 := FADD32(v22$2, v30$2);
    v59$1 := FADD32(v23$1, v31$1);
    v59$2 := FADD32(v23$2, v31$2);
    v60$1 := FADD32(v24$1, v32$1);
    v60$2 := FADD32(v24$2, v32$2);
    v61$1 := FADD32(v25$1, v33$1);
    v61$2 := FADD32(v25$2, v33$2);
    v62$1 := FADD32(v26$1, v34$1);
    v62$2 := FADD32(v26$2, v34$2);
    v63$1 := FADD32(v27$1, v35$1);
    v63$2 := FADD32(v27$2, v35$2);
    v64$1 := FADD32(v28$1, v36$1);
    v64$2 := FADD32(v28$2, v36$2);
    v65$1 := FSUB32(v21$1, v29$1);
    v65$2 := FSUB32(v21$2, v29$2);
    v66$1 := FSUB32(v22$1, v30$1);
    v66$2 := FSUB32(v22$2, v30$2);
    v67$1 := FSUB32(v23$1, v31$1);
    v67$2 := FSUB32(v23$2, v31$2);
    v68$1 := FSUB32(v24$1, v32$1);
    v68$2 := FSUB32(v24$2, v32$2);
    v69$1 := FSUB32(v57$1, v61$1);
    v69$2 := FSUB32(v57$2, v61$2);
    v70$1 := FSUB32(v58$1, v62$1);
    v70$2 := FSUB32(v58$2, v62$2);
    v71$1 := FSUB32(v59$1, v63$1);
    v71$2 := FSUB32(v59$2, v63$2);
    v72$1 := FSUB32(v60$1, v64$1);
    v72$2 := FSUB32(v60$2, v64$2);
    v73$1 := FSUB32(v25$1, v33$1);
    v73$2 := FSUB32(v25$2, v33$2);
    v74$1 := FSUB32(v26$1, v34$1);
    v74$2 := FSUB32(v26$2, v34$2);
    v75$1 := FSUB32(v27$1, v35$1);
    v75$2 := FSUB32(v27$2, v35$2);
    v76$1 := FSUB32(v28$1, v36$1);
    v76$2 := FSUB32(v28$2, v36$2);
    v77$1 := FADD32(v45$1, v73$1);
    v77$2 := FADD32(v45$2, v73$2);
    v78$1 := FADD32(v46$1, v74$1);
    v78$2 := FADD32(v46$2, v74$2);
    v79$1 := FADD32(v47$1, v75$1);
    v79$2 := FADD32(v47$2, v75$2);
    v80$1 := FADD32(v48$1, v76$1);
    v80$2 := FADD32(v48$2, v76$2);
    v81$1 := FSUB32(v65$1, v53$1);
    v81$2 := FSUB32(v65$2, v53$2);
    v82$1 := FSUB32(v66$1, v54$1);
    v82$2 := FSUB32(v66$2, v54$2);
    v83$1 := FSUB32(v67$1, v55$1);
    v83$2 := FSUB32(v67$2, v55$2);
    v84$1 := FSUB32(v68$1, v56$1);
    v84$2 := FSUB32(v68$2, v56$2);
    v85$1 := FSUB32(v45$1, v73$1);
    v85$2 := FSUB32(v45$2, v73$2);
    v86$1 := FSUB32(v46$1, v74$1);
    v86$2 := FSUB32(v46$2, v74$2);
    v87$1 := FSUB32(v47$1, v75$1);
    v87$2 := FSUB32(v47$2, v75$2);
    v88$1 := FSUB32(v48$1, v76$1);
    v88$2 := FSUB32(v48$2, v76$2);
    v89$1 := FADD32(v53$1, v65$1);
    v89$2 := FADD32(v53$2, v65$2);
    v90$1 := FADD32(v54$1, v66$1);
    v90$2 := FADD32(v54$2, v66$2);
    v91$1 := FADD32(v55$1, v67$1);
    v91$2 := FADD32(v55$2, v67$2);
    v92$1 := FADD32(v56$1, v68$1);
    v92$2 := FADD32(v56$2, v68$2);
    v93$1 := BV32_SHL(v1$1, 2bv32);
    v93$2 := BV32_SHL(v1$2, 2bv32);
    v94$1 := BV32_ADD(v93$1, 1bv32);
    v94$2 := BV32_ADD(v93$2, 1bv32);
    v95$1 := BV32_ADD(v93$1, 2bv32);
    v95$2 := BV32_ADD(v93$2, 2bv32);
    v96$1 := BV32_ADD(v93$1, 3bv32);
    v96$2 := BV32_ADD(v93$2, 3bv32);
    v97$1 := FMUL32(SI32_TO_FP32(BV32_SUB(v93$1, BV32_AND(BV1_SEXT32((if BV32_SGT(v93$1, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v97$2 := FMUL32(SI32_TO_FP32(BV32_SUB(v93$2, BV32_AND(BV1_SEXT32((if BV32_SGT(v93$2, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v98$1 := FMUL32(SI32_TO_FP32(BV32_SUB(v94$1, BV32_AND(BV1_SEXT32((if BV32_SGT(v94$1, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v98$2 := FMUL32(SI32_TO_FP32(BV32_SUB(v94$2, BV32_AND(BV1_SEXT32((if BV32_SGT(v94$2, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v99$1 := FMUL32(SI32_TO_FP32(BV32_SUB(v95$1, BV32_AND(BV1_SEXT32((if BV32_SGT(v95$1, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v99$2 := FMUL32(SI32_TO_FP32(BV32_SUB(v95$2, BV32_AND(BV1_SEXT32((if BV32_SGT(v95$2, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v100$1 := FMUL32(SI32_TO_FP32(BV32_SUB(v96$1, BV32_AND(BV1_SEXT32((if BV32_SGT(v96$1, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v100$2 := FMUL32(SI32_TO_FP32(BV32_SUB(v96$2, BV32_AND(BV1_SEXT32((if BV32_SGT(v96$2, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v101$1 := FCOS32(v97$1);
    v101$2 := FCOS32(v97$2);
    v102$1 := FCOS32(v98$1);
    v102$2 := FCOS32(v98$2);
    v103$1 := FCOS32(v99$1);
    v103$2 := FCOS32(v99$2);
    v104$1 := FCOS32(v100$1);
    v104$2 := FCOS32(v100$2);
    v105$1 := FSIN32(v97$1);
    v105$2 := FSIN32(v97$2);
    v106$1 := FSIN32(v98$1);
    v106$2 := FSIN32(v98$2);
    v107$1 := FSIN32(v99$1);
    v107$2 := FSIN32(v99$2);
    v108$1 := FSIN32(v100$1);
    v108$2 := FSIN32(v100$2);
    v109$1 := BV32_MUL(v93$1, 2bv32);
    v109$2 := BV32_MUL(v93$2, 2bv32);
    v110$1 := BV32_MUL(v94$1, 2bv32);
    v110$2 := BV32_MUL(v94$2, 2bv32);
    v111$1 := BV32_MUL(v95$1, 2bv32);
    v111$2 := BV32_MUL(v95$2, 2bv32);
    v112$1 := BV32_MUL(v96$1, 2bv32);
    v112$2 := BV32_MUL(v96$2, 2bv32);
    v113$1 := FMUL32(SI32_TO_FP32(BV32_SUB(v109$1, BV32_AND(BV1_SEXT32((if BV32_SGT(v109$1, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v113$2 := FMUL32(SI32_TO_FP32(BV32_SUB(v109$2, BV32_AND(BV1_SEXT32((if BV32_SGT(v109$2, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v114$1 := FMUL32(SI32_TO_FP32(BV32_SUB(v110$1, BV32_AND(BV1_SEXT32((if BV32_SGT(v110$1, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v114$2 := FMUL32(SI32_TO_FP32(BV32_SUB(v110$2, BV32_AND(BV1_SEXT32((if BV32_SGT(v110$2, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v115$1 := FMUL32(SI32_TO_FP32(BV32_SUB(v111$1, BV32_AND(BV1_SEXT32((if BV32_SGT(v111$1, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v115$2 := FMUL32(SI32_TO_FP32(BV32_SUB(v111$2, BV32_AND(BV1_SEXT32((if BV32_SGT(v111$2, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v116$1 := FMUL32(SI32_TO_FP32(BV32_SUB(v112$1, BV32_AND(BV1_SEXT32((if BV32_SGT(v112$1, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v116$2 := FMUL32(SI32_TO_FP32(BV32_SUB(v112$2, BV32_AND(BV1_SEXT32((if BV32_SGT(v112$2, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v117$1 := FCOS32(v113$1);
    v117$2 := FCOS32(v113$2);
    v118$1 := FCOS32(v114$1);
    v118$2 := FCOS32(v114$2);
    v119$1 := FCOS32(v115$1);
    v119$2 := FCOS32(v115$2);
    v120$1 := FCOS32(v116$1);
    v120$2 := FCOS32(v116$2);
    v121$1 := FSIN32(v113$1);
    v121$2 := FSIN32(v113$2);
    v122$1 := FSIN32(v114$1);
    v122$2 := FSIN32(v114$2);
    v123$1 := FSIN32(v115$1);
    v123$2 := FSIN32(v115$2);
    v124$1 := FSIN32(v116$1);
    v124$2 := FSIN32(v116$2);
    v125$1 := BV32_MUL(v93$1, 3bv32);
    v125$2 := BV32_MUL(v93$2, 3bv32);
    v126$1 := BV32_MUL(v94$1, 3bv32);
    v126$2 := BV32_MUL(v94$2, 3bv32);
    v127$1 := BV32_MUL(v95$1, 3bv32);
    v127$2 := BV32_MUL(v95$2, 3bv32);
    v128$1 := BV32_MUL(v96$1, 3bv32);
    v128$2 := BV32_MUL(v96$2, 3bv32);
    v129$1 := FMUL32(SI32_TO_FP32(BV32_SUB(v125$1, BV32_AND(BV1_SEXT32((if BV32_SGT(v125$1, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v129$2 := FMUL32(SI32_TO_FP32(BV32_SUB(v125$2, BV32_AND(BV1_SEXT32((if BV32_SGT(v125$2, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v130$1 := FMUL32(SI32_TO_FP32(BV32_SUB(v126$1, BV32_AND(BV1_SEXT32((if BV32_SGT(v126$1, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v130$2 := FMUL32(SI32_TO_FP32(BV32_SUB(v126$2, BV32_AND(BV1_SEXT32((if BV32_SGT(v126$2, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v131$1 := FMUL32(SI32_TO_FP32(BV32_SUB(v127$1, BV32_AND(BV1_SEXT32((if BV32_SGT(v127$1, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v131$2 := FMUL32(SI32_TO_FP32(BV32_SUB(v127$2, BV32_AND(BV1_SEXT32((if BV32_SGT(v127$2, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v132$1 := FMUL32(SI32_TO_FP32(BV32_SUB(v128$1, BV32_AND(BV1_SEXT32((if BV32_SGT(v128$1, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v132$2 := FMUL32(SI32_TO_FP32(BV32_SUB(v128$2, BV32_AND(BV1_SEXT32((if BV32_SGT(v128$2, 512bv32) then 1bv1 else 0bv1)), 1024bv32))), 3150516187bv32);
    v133$1 := FCOS32(v129$1);
    v133$2 := FCOS32(v129$2);
    v134$1 := FCOS32(v130$1);
    v134$2 := FCOS32(v130$2);
    v135$1 := FCOS32(v131$1);
    v135$2 := FCOS32(v131$2);
    v136$1 := FCOS32(v132$1);
    v136$2 := FCOS32(v132$2);
    v137$1 := FSIN32(v129$1);
    v137$2 := FSIN32(v129$2);
    v138$1 := FSIN32(v130$1);
    v138$2 := FSIN32(v130$2);
    v139$1 := FSIN32(v131$1);
    v139$2 := FSIN32(v131$2);
    v140$1 := FSIN32(v132$1);
    v140$2 := FSIN32(v132$2);
    v141$1 := BV32_ADD(BV32_SHL(v1$1, 2bv32), BV32_LSHR(v1$1, 3bv32));
    v141$2 := BV32_ADD(BV32_SHL(v1$2, 2bv32), BV32_LSHR(v1$2, 3bv32));
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$kfft.lds(true, v141$1, FADD32(v37$1, v41$1), $$kfft.lds[1bv1][v141$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, v141$2);
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$kfft.lds(true, v141$2, FADD32(v37$2, v41$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][v141$1] := FADD32(v37$1, v41$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v141$2] := FADD32(v37$2, v41$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1bv32), FADD32(v38$1, v42$1), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1bv32), FADD32(v38$2, v42$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1bv32)] := FADD32(v38$1, v42$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1bv32)] := FADD32(v38$2, v42$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 2bv32), FADD32(v39$1, v43$1), $$kfft.lds[1bv1][BV32_ADD(v141$1, 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 2bv32), FADD32(v39$2, v43$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 2bv32)] := FADD32(v39$1, v43$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 2bv32)] := FADD32(v39$2, v43$2);
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 3bv32), FADD32(v40$1, v44$1), $$kfft.lds[1bv1][BV32_ADD(v141$1, 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 3bv32), FADD32(v40$2, v44$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 3bv32)] := FADD32(v40$1, v44$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 3bv32)] := FADD32(v40$2, v44$2);
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 264bv32), FADD32(FMUL32(v101$1, v77$1), FSUB32(2147483648bv32, FMUL32(v105$1, v81$1))), $$kfft.lds[1bv1][BV32_ADD(v141$1, 264bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 264bv32));
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 264bv32), FADD32(FMUL32(v101$2, v77$2), FSUB32(2147483648bv32, FMUL32(v105$2, v81$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 264bv32)] := FADD32(FMUL32(v101$1, v77$1), FSUB32(2147483648bv32, FMUL32(v105$1, v81$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 264bv32)] := FADD32(FMUL32(v101$2, v77$2), FSUB32(2147483648bv32, FMUL32(v105$2, v81$2)));
    call {:sourceloc} {:sourceloc_num 38} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 265bv32), FADD32(FMUL32(v102$1, v78$1), FSUB32(2147483648bv32, FMUL32(v106$1, v82$1))), $$kfft.lds[1bv1][BV32_ADD(v141$1, 265bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 265bv32));
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 38} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 265bv32), FADD32(FMUL32(v102$2, v78$2), FSUB32(2147483648bv32, FMUL32(v106$2, v82$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 265bv32)] := FADD32(FMUL32(v102$1, v78$1), FSUB32(2147483648bv32, FMUL32(v106$1, v82$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 265bv32)] := FADD32(FMUL32(v102$2, v78$2), FSUB32(2147483648bv32, FMUL32(v106$2, v82$2)));
    call {:sourceloc} {:sourceloc_num 39} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 266bv32), FADD32(FMUL32(v103$1, v79$1), FSUB32(2147483648bv32, FMUL32(v107$1, v83$1))), $$kfft.lds[1bv1][BV32_ADD(v141$1, 266bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 266bv32));
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 39} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 266bv32), FADD32(FMUL32(v103$2, v79$2), FSUB32(2147483648bv32, FMUL32(v107$2, v83$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 266bv32)] := FADD32(FMUL32(v103$1, v79$1), FSUB32(2147483648bv32, FMUL32(v107$1, v83$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 266bv32)] := FADD32(FMUL32(v103$2, v79$2), FSUB32(2147483648bv32, FMUL32(v107$2, v83$2)));
    call {:sourceloc} {:sourceloc_num 40} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 267bv32), FADD32(FMUL32(v104$1, v80$1), FSUB32(2147483648bv32, FMUL32(v108$1, v84$1))), $$kfft.lds[1bv1][BV32_ADD(v141$1, 267bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 267bv32));
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 40} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 267bv32), FADD32(FMUL32(v104$2, v80$2), FSUB32(2147483648bv32, FMUL32(v108$2, v84$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 267bv32)] := FADD32(FMUL32(v104$1, v80$1), FSUB32(2147483648bv32, FMUL32(v108$1, v84$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 267bv32)] := FADD32(FMUL32(v104$2, v80$2), FSUB32(2147483648bv32, FMUL32(v108$2, v84$2)));
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 528bv32), FADD32(FMUL32(v117$1, v49$1), FSUB32(2147483648bv32, FMUL32(v121$1, v69$1))), $$kfft.lds[1bv1][BV32_ADD(v141$1, 528bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 528bv32));
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 528bv32), FADD32(FMUL32(v117$2, v49$2), FSUB32(2147483648bv32, FMUL32(v121$2, v69$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 528bv32)] := FADD32(FMUL32(v117$1, v49$1), FSUB32(2147483648bv32, FMUL32(v121$1, v69$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 528bv32)] := FADD32(FMUL32(v117$2, v49$2), FSUB32(2147483648bv32, FMUL32(v121$2, v69$2)));
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 529bv32), FADD32(FMUL32(v118$1, v50$1), FSUB32(2147483648bv32, FMUL32(v122$1, v70$1))), $$kfft.lds[1bv1][BV32_ADD(v141$1, 529bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 529bv32));
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 529bv32), FADD32(FMUL32(v118$2, v50$2), FSUB32(2147483648bv32, FMUL32(v122$2, v70$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 529bv32)] := FADD32(FMUL32(v118$1, v50$1), FSUB32(2147483648bv32, FMUL32(v122$1, v70$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 529bv32)] := FADD32(FMUL32(v118$2, v50$2), FSUB32(2147483648bv32, FMUL32(v122$2, v70$2)));
    call {:sourceloc} {:sourceloc_num 43} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 530bv32), FADD32(FMUL32(v119$1, v51$1), FSUB32(2147483648bv32, FMUL32(v123$1, v71$1))), $$kfft.lds[1bv1][BV32_ADD(v141$1, 530bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 530bv32));
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 43} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 530bv32), FADD32(FMUL32(v119$2, v51$2), FSUB32(2147483648bv32, FMUL32(v123$2, v71$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 530bv32)] := FADD32(FMUL32(v119$1, v51$1), FSUB32(2147483648bv32, FMUL32(v123$1, v71$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 530bv32)] := FADD32(FMUL32(v119$2, v51$2), FSUB32(2147483648bv32, FMUL32(v123$2, v71$2)));
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 531bv32), FADD32(FMUL32(v120$1, v52$1), FSUB32(2147483648bv32, FMUL32(v124$1, v72$1))), $$kfft.lds[1bv1][BV32_ADD(v141$1, 531bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 531bv32));
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 531bv32), FADD32(FMUL32(v120$2, v52$2), FSUB32(2147483648bv32, FMUL32(v124$2, v72$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 531bv32)] := FADD32(FMUL32(v120$1, v52$1), FSUB32(2147483648bv32, FMUL32(v124$1, v72$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 531bv32)] := FADD32(FMUL32(v120$2, v52$2), FSUB32(2147483648bv32, FMUL32(v124$2, v72$2)));
    call {:sourceloc} {:sourceloc_num 45} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 792bv32), FADD32(FMUL32(v133$1, v85$1), FSUB32(2147483648bv32, FMUL32(v137$1, v89$1))), $$kfft.lds[1bv1][BV32_ADD(v141$1, 792bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 792bv32));
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 45} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 792bv32), FADD32(FMUL32(v133$2, v85$2), FSUB32(2147483648bv32, FMUL32(v137$2, v89$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 792bv32)] := FADD32(FMUL32(v133$1, v85$1), FSUB32(2147483648bv32, FMUL32(v137$1, v89$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 792bv32)] := FADD32(FMUL32(v133$2, v85$2), FSUB32(2147483648bv32, FMUL32(v137$2, v89$2)));
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 793bv32), FADD32(FMUL32(v134$1, v86$1), FSUB32(2147483648bv32, FMUL32(v138$1, v90$1))), $$kfft.lds[1bv1][BV32_ADD(v141$1, 793bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 793bv32));
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 793bv32), FADD32(FMUL32(v134$2, v86$2), FSUB32(2147483648bv32, FMUL32(v138$2, v90$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 793bv32)] := FADD32(FMUL32(v134$1, v86$1), FSUB32(2147483648bv32, FMUL32(v138$1, v90$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 793bv32)] := FADD32(FMUL32(v134$2, v86$2), FSUB32(2147483648bv32, FMUL32(v138$2, v90$2)));
    call {:sourceloc} {:sourceloc_num 47} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 794bv32), FADD32(FMUL32(v135$1, v87$1), FSUB32(2147483648bv32, FMUL32(v139$1, v91$1))), $$kfft.lds[1bv1][BV32_ADD(v141$1, 794bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 794bv32));
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 47} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 794bv32), FADD32(FMUL32(v135$2, v87$2), FSUB32(2147483648bv32, FMUL32(v139$2, v91$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 794bv32)] := FADD32(FMUL32(v135$1, v87$1), FSUB32(2147483648bv32, FMUL32(v139$1, v91$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 794bv32)] := FADD32(FMUL32(v135$2, v87$2), FSUB32(2147483648bv32, FMUL32(v139$2, v91$2)));
    call {:sourceloc} {:sourceloc_num 48} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 795bv32), FADD32(FMUL32(v136$1, v88$1), FSUB32(2147483648bv32, FMUL32(v140$1, v92$1))), $$kfft.lds[1bv1][BV32_ADD(v141$1, 795bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 795bv32));
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 48} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 795bv32), FADD32(FMUL32(v136$2, v88$2), FSUB32(2147483648bv32, FMUL32(v140$2, v92$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 795bv32)] := FADD32(FMUL32(v136$1, v88$1), FSUB32(2147483648bv32, FMUL32(v140$1, v92$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 795bv32)] := FADD32(FMUL32(v136$2, v88$2), FSUB32(2147483648bv32, FMUL32(v140$2, v92$2)));
    call {:sourceloc} {:sourceloc_num 49} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1056bv32), FADD32(v57$1, v61$1), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1056bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1056bv32));
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 49} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1056bv32), FADD32(v57$2, v61$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1056bv32)] := FADD32(v57$1, v61$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1056bv32)] := FADD32(v57$2, v61$2);
    call {:sourceloc} {:sourceloc_num 50} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1057bv32), FADD32(v58$1, v62$1), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1057bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1057bv32));
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 50} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1057bv32), FADD32(v58$2, v62$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1057bv32)] := FADD32(v58$1, v62$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1057bv32)] := FADD32(v58$2, v62$2);
    call {:sourceloc} {:sourceloc_num 51} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1058bv32), FADD32(v59$1, v63$1), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1058bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1058bv32));
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 51} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1058bv32), FADD32(v59$2, v63$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1058bv32)] := FADD32(v59$1, v63$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1058bv32)] := FADD32(v59$2, v63$2);
    call {:sourceloc} {:sourceloc_num 52} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1059bv32), FADD32(v60$1, v64$1), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1059bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1059bv32));
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_51"} {:sourceloc} {:sourceloc_num 52} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1059bv32), FADD32(v60$2, v64$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1059bv32)] := FADD32(v60$1, v64$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1059bv32)] := FADD32(v60$2, v64$2);
    call {:sourceloc} {:sourceloc_num 53} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1320bv32), FADD32(FMUL32(v101$1, v81$1), FMUL32(v105$1, v77$1)), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1320bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1320bv32));
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_52"} {:sourceloc} {:sourceloc_num 53} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1320bv32), FADD32(FMUL32(v101$2, v81$2), FMUL32(v105$2, v77$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1320bv32)] := FADD32(FMUL32(v101$1, v81$1), FMUL32(v105$1, v77$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1320bv32)] := FADD32(FMUL32(v101$2, v81$2), FMUL32(v105$2, v77$2));
    call {:sourceloc} {:sourceloc_num 54} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1321bv32), FADD32(FMUL32(v102$1, v82$1), FMUL32(v106$1, v78$1)), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1321bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1321bv32));
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_53"} {:sourceloc} {:sourceloc_num 54} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1321bv32), FADD32(FMUL32(v102$2, v82$2), FMUL32(v106$2, v78$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1321bv32)] := FADD32(FMUL32(v102$1, v82$1), FMUL32(v106$1, v78$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1321bv32)] := FADD32(FMUL32(v102$2, v82$2), FMUL32(v106$2, v78$2));
    call {:sourceloc} {:sourceloc_num 55} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1322bv32), FADD32(FMUL32(v103$1, v83$1), FMUL32(v107$1, v79$1)), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1322bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1322bv32));
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_54"} {:sourceloc} {:sourceloc_num 55} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1322bv32), FADD32(FMUL32(v103$2, v83$2), FMUL32(v107$2, v79$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1322bv32)] := FADD32(FMUL32(v103$1, v83$1), FMUL32(v107$1, v79$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1322bv32)] := FADD32(FMUL32(v103$2, v83$2), FMUL32(v107$2, v79$2));
    call {:sourceloc} {:sourceloc_num 56} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1323bv32), FADD32(FMUL32(v104$1, v84$1), FMUL32(v108$1, v80$1)), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1323bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1323bv32));
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_55"} {:sourceloc} {:sourceloc_num 56} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1323bv32), FADD32(FMUL32(v104$2, v84$2), FMUL32(v108$2, v80$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1323bv32)] := FADD32(FMUL32(v104$1, v84$1), FMUL32(v108$1, v80$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1323bv32)] := FADD32(FMUL32(v104$2, v84$2), FMUL32(v108$2, v80$2));
    call {:sourceloc} {:sourceloc_num 57} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1584bv32), FADD32(FMUL32(v117$1, v69$1), FMUL32(v121$1, v49$1)), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1584bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1584bv32));
    assume {:do_not_predicate} {:check_id "check_state_56"} {:captureState "check_state_56"} {:sourceloc} {:sourceloc_num 57} true;
    call {:check_id "check_state_56"} {:sourceloc} {:sourceloc_num 57} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1584bv32), FADD32(FMUL32(v117$2, v69$2), FMUL32(v121$2, v49$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1584bv32)] := FADD32(FMUL32(v117$1, v69$1), FMUL32(v121$1, v49$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1584bv32)] := FADD32(FMUL32(v117$2, v69$2), FMUL32(v121$2, v49$2));
    call {:sourceloc} {:sourceloc_num 58} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1585bv32), FADD32(FMUL32(v118$1, v70$1), FMUL32(v122$1, v50$1)), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1585bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1585bv32));
    assume {:do_not_predicate} {:check_id "check_state_57"} {:captureState "check_state_57"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_57"} {:sourceloc} {:sourceloc_num 58} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1585bv32), FADD32(FMUL32(v118$2, v70$2), FMUL32(v122$2, v50$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1585bv32)] := FADD32(FMUL32(v118$1, v70$1), FMUL32(v122$1, v50$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1585bv32)] := FADD32(FMUL32(v118$2, v70$2), FMUL32(v122$2, v50$2));
    call {:sourceloc} {:sourceloc_num 59} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1586bv32), FADD32(FMUL32(v119$1, v71$1), FMUL32(v123$1, v51$1)), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1586bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1586bv32));
    assume {:do_not_predicate} {:check_id "check_state_58"} {:captureState "check_state_58"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_58"} {:sourceloc} {:sourceloc_num 59} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1586bv32), FADD32(FMUL32(v119$2, v71$2), FMUL32(v123$2, v51$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1586bv32)] := FADD32(FMUL32(v119$1, v71$1), FMUL32(v123$1, v51$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1586bv32)] := FADD32(FMUL32(v119$2, v71$2), FMUL32(v123$2, v51$2));
    call {:sourceloc} {:sourceloc_num 60} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1587bv32), FADD32(FMUL32(v120$1, v72$1), FMUL32(v124$1, v52$1)), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1587bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1587bv32));
    assume {:do_not_predicate} {:check_id "check_state_59"} {:captureState "check_state_59"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_59"} {:sourceloc} {:sourceloc_num 60} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1587bv32), FADD32(FMUL32(v120$2, v72$2), FMUL32(v124$2, v52$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1587bv32)] := FADD32(FMUL32(v120$1, v72$1), FMUL32(v124$1, v52$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1587bv32)] := FADD32(FMUL32(v120$2, v72$2), FMUL32(v124$2, v52$2));
    call {:sourceloc} {:sourceloc_num 61} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1848bv32), FADD32(FMUL32(v133$1, v89$1), FMUL32(v137$1, v85$1)), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1848bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1848bv32));
    assume {:do_not_predicate} {:check_id "check_state_60"} {:captureState "check_state_60"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_60"} {:sourceloc} {:sourceloc_num 61} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1848bv32), FADD32(FMUL32(v133$2, v89$2), FMUL32(v137$2, v85$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1848bv32)] := FADD32(FMUL32(v133$1, v89$1), FMUL32(v137$1, v85$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1848bv32)] := FADD32(FMUL32(v133$2, v89$2), FMUL32(v137$2, v85$2));
    call {:sourceloc} {:sourceloc_num 62} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1849bv32), FADD32(FMUL32(v134$1, v90$1), FMUL32(v138$1, v86$1)), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1849bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1849bv32));
    assume {:do_not_predicate} {:check_id "check_state_61"} {:captureState "check_state_61"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_61"} {:sourceloc} {:sourceloc_num 62} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1849bv32), FADD32(FMUL32(v134$2, v90$2), FMUL32(v138$2, v86$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1849bv32)] := FADD32(FMUL32(v134$1, v90$1), FMUL32(v138$1, v86$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1849bv32)] := FADD32(FMUL32(v134$2, v90$2), FMUL32(v138$2, v86$2));
    call {:sourceloc} {:sourceloc_num 63} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1850bv32), FADD32(FMUL32(v135$1, v91$1), FMUL32(v139$1, v87$1)), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1850bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1850bv32));
    assume {:do_not_predicate} {:check_id "check_state_62"} {:captureState "check_state_62"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_62"} {:sourceloc} {:sourceloc_num 63} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1850bv32), FADD32(FMUL32(v135$2, v91$2), FMUL32(v139$2, v87$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1850bv32)] := FADD32(FMUL32(v135$1, v91$1), FMUL32(v139$1, v87$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1850bv32)] := FADD32(FMUL32(v135$2, v91$2), FMUL32(v139$2, v87$2));
    call {:sourceloc} {:sourceloc_num 64} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v141$1, 1851bv32), FADD32(FMUL32(v136$1, v92$1), FMUL32(v140$1, v88$1)), $$kfft.lds[1bv1][BV32_ADD(v141$1, 1851bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v141$2, 1851bv32));
    assume {:do_not_predicate} {:check_id "check_state_63"} {:captureState "check_state_63"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_63"} {:sourceloc} {:sourceloc_num 64} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v141$2, 1851bv32), FADD32(FMUL32(v136$2, v92$2), FMUL32(v140$2, v88$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v141$1, 1851bv32)] := FADD32(FMUL32(v136$1, v92$1), FMUL32(v140$1, v88$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v141$2, 1851bv32)] := FADD32(FMUL32(v136$2, v92$2), FMUL32(v140$2, v88$2));
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 65} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    v142$1 := BV32_ADD(v1$1, BV32_LSHR(v1$1, 5bv32));
    v142$2 := BV32_ADD(v1$2, BV32_LSHR(v1$2, 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_64"} {:captureState "check_state_64"} {:sourceloc} {:sourceloc_num 66} true;
    v143$1 := $$kfft.lds[1bv1][v142$1];
    v143$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v142$2];
    assume {:do_not_predicate} {:check_id "check_state_65"} {:captureState "check_state_65"} {:sourceloc} {:sourceloc_num 67} true;
    v144$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 66bv32)];
    v144$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 66bv32)];
    assume {:do_not_predicate} {:check_id "check_state_66"} {:captureState "check_state_66"} {:sourceloc} {:sourceloc_num 68} true;
    v145$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 132bv32)];
    v145$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 132bv32)];
    assume {:do_not_predicate} {:check_id "check_state_67"} {:captureState "check_state_67"} {:sourceloc} {:sourceloc_num 69} true;
    v146$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 198bv32)];
    v146$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 198bv32)];
    assume {:do_not_predicate} {:check_id "check_state_68"} {:captureState "check_state_68"} {:sourceloc} {:sourceloc_num 70} true;
    v147$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 264bv32)];
    v147$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 264bv32)];
    assume {:do_not_predicate} {:check_id "check_state_69"} {:captureState "check_state_69"} {:sourceloc} {:sourceloc_num 71} true;
    v148$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 330bv32)];
    v148$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 330bv32)];
    assume {:do_not_predicate} {:check_id "check_state_70"} {:captureState "check_state_70"} {:sourceloc} {:sourceloc_num 72} true;
    v149$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 396bv32)];
    v149$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 396bv32)];
    assume {:do_not_predicate} {:check_id "check_state_71"} {:captureState "check_state_71"} {:sourceloc} {:sourceloc_num 73} true;
    v150$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 462bv32)];
    v150$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 462bv32)];
    assume {:do_not_predicate} {:check_id "check_state_72"} {:captureState "check_state_72"} {:sourceloc} {:sourceloc_num 74} true;
    v151$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 528bv32)];
    v151$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 528bv32)];
    assume {:do_not_predicate} {:check_id "check_state_73"} {:captureState "check_state_73"} {:sourceloc} {:sourceloc_num 75} true;
    v152$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 594bv32)];
    v152$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 594bv32)];
    assume {:do_not_predicate} {:check_id "check_state_74"} {:captureState "check_state_74"} {:sourceloc} {:sourceloc_num 76} true;
    v153$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 660bv32)];
    v153$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 660bv32)];
    assume {:do_not_predicate} {:check_id "check_state_75"} {:captureState "check_state_75"} {:sourceloc} {:sourceloc_num 77} true;
    v154$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 726bv32)];
    v154$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 726bv32)];
    assume {:do_not_predicate} {:check_id "check_state_76"} {:captureState "check_state_76"} {:sourceloc} {:sourceloc_num 78} true;
    v155$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 792bv32)];
    v155$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 792bv32)];
    assume {:do_not_predicate} {:check_id "check_state_77"} {:captureState "check_state_77"} {:sourceloc} {:sourceloc_num 79} true;
    v156$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 858bv32)];
    v156$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 858bv32)];
    assume {:do_not_predicate} {:check_id "check_state_78"} {:captureState "check_state_78"} {:sourceloc} {:sourceloc_num 80} true;
    v157$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 924bv32)];
    v157$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 924bv32)];
    assume {:do_not_predicate} {:check_id "check_state_79"} {:captureState "check_state_79"} {:sourceloc} {:sourceloc_num 81} true;
    v158$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 990bv32)];
    v158$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 990bv32)];
    assume {:do_not_predicate} {:check_id "check_state_80"} {:captureState "check_state_80"} {:sourceloc} {:sourceloc_num 82} true;
    v159$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1056bv32)];
    v159$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1056bv32)];
    assume {:do_not_predicate} {:check_id "check_state_81"} {:captureState "check_state_81"} {:sourceloc} {:sourceloc_num 83} true;
    v160$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1122bv32)];
    v160$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1122bv32)];
    assume {:do_not_predicate} {:check_id "check_state_82"} {:captureState "check_state_82"} {:sourceloc} {:sourceloc_num 84} true;
    v161$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1188bv32)];
    v161$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1188bv32)];
    assume {:do_not_predicate} {:check_id "check_state_83"} {:captureState "check_state_83"} {:sourceloc} {:sourceloc_num 85} true;
    v162$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1254bv32)];
    v162$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1254bv32)];
    assume {:do_not_predicate} {:check_id "check_state_84"} {:captureState "check_state_84"} {:sourceloc} {:sourceloc_num 86} true;
    v163$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1320bv32)];
    v163$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1320bv32)];
    assume {:do_not_predicate} {:check_id "check_state_85"} {:captureState "check_state_85"} {:sourceloc} {:sourceloc_num 87} true;
    v164$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1386bv32)];
    v164$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1386bv32)];
    assume {:do_not_predicate} {:check_id "check_state_86"} {:captureState "check_state_86"} {:sourceloc} {:sourceloc_num 88} true;
    v165$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1452bv32)];
    v165$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1452bv32)];
    assume {:do_not_predicate} {:check_id "check_state_87"} {:captureState "check_state_87"} {:sourceloc} {:sourceloc_num 89} true;
    v166$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1518bv32)];
    v166$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1518bv32)];
    assume {:do_not_predicate} {:check_id "check_state_88"} {:captureState "check_state_88"} {:sourceloc} {:sourceloc_num 90} true;
    v167$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1584bv32)];
    v167$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1584bv32)];
    assume {:do_not_predicate} {:check_id "check_state_89"} {:captureState "check_state_89"} {:sourceloc} {:sourceloc_num 91} true;
    v168$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1650bv32)];
    v168$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1650bv32)];
    assume {:do_not_predicate} {:check_id "check_state_90"} {:captureState "check_state_90"} {:sourceloc} {:sourceloc_num 92} true;
    v169$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1716bv32)];
    v169$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1716bv32)];
    assume {:do_not_predicate} {:check_id "check_state_91"} {:captureState "check_state_91"} {:sourceloc} {:sourceloc_num 93} true;
    v170$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1782bv32)];
    v170$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1782bv32)];
    assume {:do_not_predicate} {:check_id "check_state_92"} {:captureState "check_state_92"} {:sourceloc} {:sourceloc_num 94} true;
    v171$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1848bv32)];
    v171$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1848bv32)];
    assume {:do_not_predicate} {:check_id "check_state_93"} {:captureState "check_state_93"} {:sourceloc} {:sourceloc_num 95} true;
    v172$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1914bv32)];
    v172$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1914bv32)];
    assume {:do_not_predicate} {:check_id "check_state_94"} {:captureState "check_state_94"} {:sourceloc} {:sourceloc_num 96} true;
    v173$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 1980bv32)];
    v173$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 1980bv32)];
    assume {:do_not_predicate} {:check_id "check_state_95"} {:captureState "check_state_95"} {:sourceloc} {:sourceloc_num 97} true;
    v174$1 := $$kfft.lds[1bv1][BV32_ADD(v142$1, 2046bv32)];
    v174$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v142$2, 2046bv32)];
    v175$1 := FADD32(v143$1, v145$1);
    v175$2 := FADD32(v143$2, v145$2);
    v176$1 := FADD32(v147$1, v149$1);
    v176$2 := FADD32(v147$2, v149$2);
    v177$1 := FADD32(v151$1, v153$1);
    v177$2 := FADD32(v151$2, v153$2);
    v178$1 := FADD32(v155$1, v157$1);
    v178$2 := FADD32(v155$2, v157$2);
    v179$1 := FADD32(v144$1, v146$1);
    v179$2 := FADD32(v144$2, v146$2);
    v180$1 := FADD32(v148$1, v150$1);
    v180$2 := FADD32(v148$2, v150$2);
    v181$1 := FADD32(v152$1, v154$1);
    v181$2 := FADD32(v152$2, v154$2);
    v182$1 := FADD32(v156$1, v158$1);
    v182$2 := FADD32(v156$2, v158$2);
    v183$1 := FSUB32(v143$1, v145$1);
    v183$2 := FSUB32(v143$2, v145$2);
    v184$1 := FSUB32(v147$1, v149$1);
    v184$2 := FSUB32(v147$2, v149$2);
    v185$1 := FSUB32(v151$1, v153$1);
    v185$2 := FSUB32(v151$2, v153$2);
    v186$1 := FSUB32(v155$1, v157$1);
    v186$2 := FSUB32(v155$2, v157$2);
    v187$1 := FSUB32(v175$1, v179$1);
    v187$2 := FSUB32(v175$2, v179$2);
    v188$1 := FSUB32(v176$1, v180$1);
    v188$2 := FSUB32(v176$2, v180$2);
    v189$1 := FSUB32(v177$1, v181$1);
    v189$2 := FSUB32(v177$2, v181$2);
    v190$1 := FSUB32(v178$1, v182$1);
    v190$2 := FSUB32(v178$2, v182$2);
    v191$1 := FSUB32(v144$1, v146$1);
    v191$2 := FSUB32(v144$2, v146$2);
    v192$1 := FSUB32(v148$1, v150$1);
    v192$2 := FSUB32(v148$2, v150$2);
    v193$1 := FSUB32(v152$1, v154$1);
    v193$2 := FSUB32(v152$2, v154$2);
    v194$1 := FSUB32(v156$1, v158$1);
    v194$2 := FSUB32(v156$2, v158$2);
    v195$1 := FADD32(v159$1, v161$1);
    v195$2 := FADD32(v159$2, v161$2);
    v196$1 := FADD32(v163$1, v165$1);
    v196$2 := FADD32(v163$2, v165$2);
    v197$1 := FADD32(v167$1, v169$1);
    v197$2 := FADD32(v167$2, v169$2);
    v198$1 := FADD32(v171$1, v173$1);
    v198$2 := FADD32(v171$2, v173$2);
    v199$1 := FADD32(v160$1, v162$1);
    v199$2 := FADD32(v160$2, v162$2);
    v200$1 := FADD32(v164$1, v166$1);
    v200$2 := FADD32(v164$2, v166$2);
    v201$1 := FADD32(v168$1, v170$1);
    v201$2 := FADD32(v168$2, v170$2);
    v202$1 := FADD32(v172$1, v174$1);
    v202$2 := FADD32(v172$2, v174$2);
    v203$1 := FSUB32(v159$1, v161$1);
    v203$2 := FSUB32(v159$2, v161$2);
    v204$1 := FSUB32(v163$1, v165$1);
    v204$2 := FSUB32(v163$2, v165$2);
    v205$1 := FSUB32(v167$1, v169$1);
    v205$2 := FSUB32(v167$2, v169$2);
    v206$1 := FSUB32(v171$1, v173$1);
    v206$2 := FSUB32(v171$2, v173$2);
    v207$1 := FSUB32(v195$1, v199$1);
    v207$2 := FSUB32(v195$2, v199$2);
    v208$1 := FSUB32(v196$1, v200$1);
    v208$2 := FSUB32(v196$2, v200$2);
    v209$1 := FSUB32(v197$1, v201$1);
    v209$2 := FSUB32(v197$2, v201$2);
    v210$1 := FSUB32(v198$1, v202$1);
    v210$2 := FSUB32(v198$2, v202$2);
    v211$1 := FSUB32(v160$1, v162$1);
    v211$2 := FSUB32(v160$2, v162$2);
    v212$1 := FSUB32(v164$1, v166$1);
    v212$2 := FSUB32(v164$2, v166$2);
    v213$1 := FSUB32(v168$1, v170$1);
    v213$2 := FSUB32(v168$2, v170$2);
    v214$1 := FSUB32(v172$1, v174$1);
    v214$2 := FSUB32(v172$2, v174$2);
    v215$1 := FADD32(v183$1, v211$1);
    v215$2 := FADD32(v183$2, v211$2);
    v216$1 := FADD32(v184$1, v212$1);
    v216$2 := FADD32(v184$2, v212$2);
    v217$1 := FADD32(v185$1, v213$1);
    v217$2 := FADD32(v185$2, v213$2);
    v218$1 := FADD32(v186$1, v214$1);
    v218$2 := FADD32(v186$2, v214$2);
    v219$1 := FSUB32(v203$1, v191$1);
    v219$2 := FSUB32(v203$2, v191$2);
    v220$1 := FSUB32(v204$1, v192$1);
    v220$2 := FSUB32(v204$2, v192$2);
    v221$1 := FSUB32(v205$1, v193$1);
    v221$2 := FSUB32(v205$2, v193$2);
    v222$1 := FSUB32(v206$1, v194$1);
    v222$2 := FSUB32(v206$2, v194$2);
    v223$1 := FSUB32(v183$1, v211$1);
    v223$2 := FSUB32(v183$2, v211$2);
    v224$1 := FSUB32(v184$1, v212$1);
    v224$2 := FSUB32(v184$2, v212$2);
    v225$1 := FSUB32(v185$1, v213$1);
    v225$2 := FSUB32(v185$2, v213$2);
    v226$1 := FSUB32(v186$1, v214$1);
    v226$2 := FSUB32(v186$2, v214$2);
    v227$1 := FADD32(v191$1, v203$1);
    v227$2 := FADD32(v191$2, v203$2);
    v228$1 := FADD32(v192$1, v204$1);
    v228$2 := FADD32(v192$2, v204$2);
    v229$1 := FADD32(v193$1, v205$1);
    v229$2 := FADD32(v193$2, v205$2);
    v230$1 := FADD32(v194$1, v206$1);
    v230$2 := FADD32(v194$2, v206$2);
    v231$1 := BV32_SHL(v1$1, 2bv32);
    v231$2 := BV32_SHL(v1$2, 2bv32);
    v232$1 := BV32_SGT(v231$1, 512bv32);
    v232$2 := BV32_SGT(v231$2, 512bv32);
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
    p0$1 := (if v232$1 then v232$1 else p0$1);
    p0$2 := (if v232$2 then v232$2 else p0$2);
    p1$1 := (if !v232$1 then !v232$1 else p1$1);
    p1$2 := (if !v232$2 then !v232$2 else p1$2);
    $.0$1 := (if p0$1 then BV32_SUB(v231$1, 1024bv32) else $.0$1);
    $.0$2 := (if p0$2 then BV32_SUB(v231$2, 1024bv32) else $.0$2);
    $.0$1 := (if p1$1 then v231$1 else $.0$1);
    $.0$2 := (if p1$2 then v231$2 else $.0$2);
    v233$1 := FMUL32(SI32_TO_FP32($.0$1), 3150516187bv32);
    v233$2 := FMUL32(SI32_TO_FP32($.0$2), 3150516187bv32);
    v234$1 := FCOS32(v233$1);
    v234$2 := FCOS32(v233$2);
    v235$1 := FSIN32(v233$1);
    v235$2 := FSIN32(v233$2);
    v236$1 := BV32_MUL(v231$1, 2bv32);
    v236$2 := BV32_MUL(v231$2, 2bv32);
    v237$1 := BV32_SGT(v236$1, 512bv32);
    v237$2 := BV32_SGT(v236$2, 512bv32);
    p2$1 := (if v237$1 then v237$1 else p2$1);
    p2$2 := (if v237$2 then v237$2 else p2$2);
    p3$1 := (if !v237$1 then !v237$1 else p3$1);
    p3$2 := (if !v237$2 then !v237$2 else p3$2);
    $.02$1 := (if p2$1 then BV32_SUB(v236$1, 1024bv32) else $.02$1);
    $.02$2 := (if p2$2 then BV32_SUB(v236$2, 1024bv32) else $.02$2);
    $.02$1 := (if p3$1 then v236$1 else $.02$1);
    $.02$2 := (if p3$2 then v236$2 else $.02$2);
    v238$1 := FMUL32(SI32_TO_FP32($.02$1), 3150516187bv32);
    v238$2 := FMUL32(SI32_TO_FP32($.02$2), 3150516187bv32);
    v239$1 := FCOS32(v238$1);
    v239$2 := FCOS32(v238$2);
    v240$1 := FSIN32(v238$1);
    v240$2 := FSIN32(v238$2);
    v241$1 := BV32_MUL(v231$1, 3bv32);
    v241$2 := BV32_MUL(v231$2, 3bv32);
    v242$1 := BV32_SGT(v241$1, 512bv32);
    v242$2 := BV32_SGT(v241$2, 512bv32);
    p4$1 := (if v242$1 then v242$1 else p4$1);
    p4$2 := (if v242$2 then v242$2 else p4$2);
    p5$1 := (if !v242$1 then !v242$1 else p5$1);
    p5$2 := (if !v242$2 then !v242$2 else p5$2);
    $.01$1 := (if p4$1 then BV32_SUB(v241$1, 1024bv32) else $.01$1);
    $.01$2 := (if p4$2 then BV32_SUB(v241$2, 1024bv32) else $.01$2);
    $.01$1 := (if p5$1 then v241$1 else $.01$1);
    $.01$2 := (if p5$2 then v241$2 else $.01$2);
    v243$1 := FMUL32(SI32_TO_FP32($.01$1), 3150516187bv32);
    v243$2 := FMUL32(SI32_TO_FP32($.01$2), 3150516187bv32);
    v244$1 := FCOS32(v243$1);
    v244$2 := FCOS32(v243$2);
    v245$1 := FSIN32(v243$1);
    v245$2 := FSIN32(v243$2);
    goto __partitioned_block_$0_2;

  __partitioned_block_$0_2:
    call {:sourceloc_num 104} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    v246$1 := BV32_ADD(BV32_SHL(v1$1, 2bv32), BV32_LSHR(v1$1, 3bv32));
    v246$2 := BV32_ADD(BV32_SHL(v1$2, 2bv32), BV32_LSHR(v1$2, 3bv32));
    call {:sourceloc} {:sourceloc_num 105} _LOG_WRITE_$$kfft.lds(true, v246$1, FADD32(v175$1, v179$1), $$kfft.lds[1bv1][v246$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, v246$2);
    assume {:do_not_predicate} {:check_id "check_state_96"} {:captureState "check_state_96"} {:sourceloc} {:sourceloc_num 105} true;
    call {:check_id "check_state_96"} {:sourceloc} {:sourceloc_num 105} _CHECK_WRITE_$$kfft.lds(true, v246$2, FADD32(v175$2, v179$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][v246$1] := FADD32(v175$1, v179$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v246$2] := FADD32(v175$2, v179$2);
    call {:sourceloc} {:sourceloc_num 106} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1bv32), FADD32(FMUL32(v234$1, v215$1), FSUB32(2147483648bv32, FMUL32(v235$1, v219$1))), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_97"} {:captureState "check_state_97"} {:sourceloc} {:sourceloc_num 106} true;
    call {:check_id "check_state_97"} {:sourceloc} {:sourceloc_num 106} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1bv32), FADD32(FMUL32(v234$2, v215$2), FSUB32(2147483648bv32, FMUL32(v235$2, v219$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1bv32)] := FADD32(FMUL32(v234$1, v215$1), FSUB32(2147483648bv32, FMUL32(v235$1, v219$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1bv32)] := FADD32(FMUL32(v234$2, v215$2), FSUB32(2147483648bv32, FMUL32(v235$2, v219$2)));
    call {:sourceloc} {:sourceloc_num 107} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 2bv32), FADD32(FMUL32(v239$1, v187$1), FSUB32(2147483648bv32, FMUL32(v240$1, v207$1))), $$kfft.lds[1bv1][BV32_ADD(v246$1, 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_98"} {:captureState "check_state_98"} {:sourceloc} {:sourceloc_num 107} true;
    call {:check_id "check_state_98"} {:sourceloc} {:sourceloc_num 107} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 2bv32), FADD32(FMUL32(v239$2, v187$2), FSUB32(2147483648bv32, FMUL32(v240$2, v207$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 2bv32)] := FADD32(FMUL32(v239$1, v187$1), FSUB32(2147483648bv32, FMUL32(v240$1, v207$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 2bv32)] := FADD32(FMUL32(v239$2, v187$2), FSUB32(2147483648bv32, FMUL32(v240$2, v207$2)));
    call {:sourceloc} {:sourceloc_num 108} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 3bv32), FADD32(FMUL32(v244$1, v223$1), FSUB32(2147483648bv32, FMUL32(v245$1, v227$1))), $$kfft.lds[1bv1][BV32_ADD(v246$1, 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_99"} {:captureState "check_state_99"} {:sourceloc} {:sourceloc_num 108} true;
    call {:check_id "check_state_99"} {:sourceloc} {:sourceloc_num 108} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 3bv32), FADD32(FMUL32(v244$2, v223$2), FSUB32(2147483648bv32, FMUL32(v245$2, v227$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 3bv32)] := FADD32(FMUL32(v244$1, v223$1), FSUB32(2147483648bv32, FMUL32(v245$1, v227$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 3bv32)] := FADD32(FMUL32(v244$2, v223$2), FSUB32(2147483648bv32, FMUL32(v245$2, v227$2)));
    call {:sourceloc} {:sourceloc_num 109} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 264bv32), FADD32(v176$1, v180$1), $$kfft.lds[1bv1][BV32_ADD(v246$1, 264bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 264bv32));
    assume {:do_not_predicate} {:check_id "check_state_100"} {:captureState "check_state_100"} {:sourceloc} {:sourceloc_num 109} true;
    call {:check_id "check_state_100"} {:sourceloc} {:sourceloc_num 109} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 264bv32), FADD32(v176$2, v180$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 264bv32)] := FADD32(v176$1, v180$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 264bv32)] := FADD32(v176$2, v180$2);
    call {:sourceloc} {:sourceloc_num 110} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 265bv32), FADD32(FMUL32(v234$1, v216$1), FSUB32(2147483648bv32, FMUL32(v235$1, v220$1))), $$kfft.lds[1bv1][BV32_ADD(v246$1, 265bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 265bv32));
    assume {:do_not_predicate} {:check_id "check_state_101"} {:captureState "check_state_101"} {:sourceloc} {:sourceloc_num 110} true;
    call {:check_id "check_state_101"} {:sourceloc} {:sourceloc_num 110} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 265bv32), FADD32(FMUL32(v234$2, v216$2), FSUB32(2147483648bv32, FMUL32(v235$2, v220$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 265bv32)] := FADD32(FMUL32(v234$1, v216$1), FSUB32(2147483648bv32, FMUL32(v235$1, v220$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 265bv32)] := FADD32(FMUL32(v234$2, v216$2), FSUB32(2147483648bv32, FMUL32(v235$2, v220$2)));
    call {:sourceloc} {:sourceloc_num 111} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 266bv32), FADD32(FMUL32(v239$1, v188$1), FSUB32(2147483648bv32, FMUL32(v240$1, v208$1))), $$kfft.lds[1bv1][BV32_ADD(v246$1, 266bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 266bv32));
    assume {:do_not_predicate} {:check_id "check_state_102"} {:captureState "check_state_102"} {:sourceloc} {:sourceloc_num 111} true;
    call {:check_id "check_state_102"} {:sourceloc} {:sourceloc_num 111} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 266bv32), FADD32(FMUL32(v239$2, v188$2), FSUB32(2147483648bv32, FMUL32(v240$2, v208$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 266bv32)] := FADD32(FMUL32(v239$1, v188$1), FSUB32(2147483648bv32, FMUL32(v240$1, v208$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 266bv32)] := FADD32(FMUL32(v239$2, v188$2), FSUB32(2147483648bv32, FMUL32(v240$2, v208$2)));
    call {:sourceloc} {:sourceloc_num 112} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 267bv32), FADD32(FMUL32(v244$1, v224$1), FSUB32(2147483648bv32, FMUL32(v245$1, v228$1))), $$kfft.lds[1bv1][BV32_ADD(v246$1, 267bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 267bv32));
    assume {:do_not_predicate} {:check_id "check_state_103"} {:captureState "check_state_103"} {:sourceloc} {:sourceloc_num 112} true;
    call {:check_id "check_state_103"} {:sourceloc} {:sourceloc_num 112} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 267bv32), FADD32(FMUL32(v244$2, v224$2), FSUB32(2147483648bv32, FMUL32(v245$2, v228$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 267bv32)] := FADD32(FMUL32(v244$1, v224$1), FSUB32(2147483648bv32, FMUL32(v245$1, v228$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 267bv32)] := FADD32(FMUL32(v244$2, v224$2), FSUB32(2147483648bv32, FMUL32(v245$2, v228$2)));
    call {:sourceloc} {:sourceloc_num 113} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 528bv32), FADD32(v177$1, v181$1), $$kfft.lds[1bv1][BV32_ADD(v246$1, 528bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 528bv32));
    assume {:do_not_predicate} {:check_id "check_state_104"} {:captureState "check_state_104"} {:sourceloc} {:sourceloc_num 113} true;
    call {:check_id "check_state_104"} {:sourceloc} {:sourceloc_num 113} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 528bv32), FADD32(v177$2, v181$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 528bv32)] := FADD32(v177$1, v181$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 528bv32)] := FADD32(v177$2, v181$2);
    call {:sourceloc} {:sourceloc_num 114} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 529bv32), FADD32(FMUL32(v234$1, v217$1), FSUB32(2147483648bv32, FMUL32(v235$1, v221$1))), $$kfft.lds[1bv1][BV32_ADD(v246$1, 529bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 529bv32));
    assume {:do_not_predicate} {:check_id "check_state_105"} {:captureState "check_state_105"} {:sourceloc} {:sourceloc_num 114} true;
    call {:check_id "check_state_105"} {:sourceloc} {:sourceloc_num 114} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 529bv32), FADD32(FMUL32(v234$2, v217$2), FSUB32(2147483648bv32, FMUL32(v235$2, v221$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 529bv32)] := FADD32(FMUL32(v234$1, v217$1), FSUB32(2147483648bv32, FMUL32(v235$1, v221$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 529bv32)] := FADD32(FMUL32(v234$2, v217$2), FSUB32(2147483648bv32, FMUL32(v235$2, v221$2)));
    call {:sourceloc} {:sourceloc_num 115} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 530bv32), FADD32(FMUL32(v239$1, v189$1), FSUB32(2147483648bv32, FMUL32(v240$1, v209$1))), $$kfft.lds[1bv1][BV32_ADD(v246$1, 530bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 530bv32));
    assume {:do_not_predicate} {:check_id "check_state_106"} {:captureState "check_state_106"} {:sourceloc} {:sourceloc_num 115} true;
    call {:check_id "check_state_106"} {:sourceloc} {:sourceloc_num 115} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 530bv32), FADD32(FMUL32(v239$2, v189$2), FSUB32(2147483648bv32, FMUL32(v240$2, v209$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 530bv32)] := FADD32(FMUL32(v239$1, v189$1), FSUB32(2147483648bv32, FMUL32(v240$1, v209$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 530bv32)] := FADD32(FMUL32(v239$2, v189$2), FSUB32(2147483648bv32, FMUL32(v240$2, v209$2)));
    call {:sourceloc} {:sourceloc_num 116} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 531bv32), FADD32(FMUL32(v244$1, v225$1), FSUB32(2147483648bv32, FMUL32(v245$1, v229$1))), $$kfft.lds[1bv1][BV32_ADD(v246$1, 531bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 531bv32));
    assume {:do_not_predicate} {:check_id "check_state_107"} {:captureState "check_state_107"} {:sourceloc} {:sourceloc_num 116} true;
    call {:check_id "check_state_107"} {:sourceloc} {:sourceloc_num 116} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 531bv32), FADD32(FMUL32(v244$2, v225$2), FSUB32(2147483648bv32, FMUL32(v245$2, v229$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 531bv32)] := FADD32(FMUL32(v244$1, v225$1), FSUB32(2147483648bv32, FMUL32(v245$1, v229$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 531bv32)] := FADD32(FMUL32(v244$2, v225$2), FSUB32(2147483648bv32, FMUL32(v245$2, v229$2)));
    call {:sourceloc} {:sourceloc_num 117} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 792bv32), FADD32(v178$1, v182$1), $$kfft.lds[1bv1][BV32_ADD(v246$1, 792bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 792bv32));
    assume {:do_not_predicate} {:check_id "check_state_108"} {:captureState "check_state_108"} {:sourceloc} {:sourceloc_num 117} true;
    call {:check_id "check_state_108"} {:sourceloc} {:sourceloc_num 117} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 792bv32), FADD32(v178$2, v182$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 792bv32)] := FADD32(v178$1, v182$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 792bv32)] := FADD32(v178$2, v182$2);
    call {:sourceloc} {:sourceloc_num 118} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 793bv32), FADD32(FMUL32(v234$1, v218$1), FSUB32(2147483648bv32, FMUL32(v235$1, v222$1))), $$kfft.lds[1bv1][BV32_ADD(v246$1, 793bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 793bv32));
    assume {:do_not_predicate} {:check_id "check_state_109"} {:captureState "check_state_109"} {:sourceloc} {:sourceloc_num 118} true;
    call {:check_id "check_state_109"} {:sourceloc} {:sourceloc_num 118} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 793bv32), FADD32(FMUL32(v234$2, v218$2), FSUB32(2147483648bv32, FMUL32(v235$2, v222$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 793bv32)] := FADD32(FMUL32(v234$1, v218$1), FSUB32(2147483648bv32, FMUL32(v235$1, v222$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 793bv32)] := FADD32(FMUL32(v234$2, v218$2), FSUB32(2147483648bv32, FMUL32(v235$2, v222$2)));
    call {:sourceloc} {:sourceloc_num 119} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 794bv32), FADD32(FMUL32(v239$1, v190$1), FSUB32(2147483648bv32, FMUL32(v240$1, v210$1))), $$kfft.lds[1bv1][BV32_ADD(v246$1, 794bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 794bv32));
    assume {:do_not_predicate} {:check_id "check_state_110"} {:captureState "check_state_110"} {:sourceloc} {:sourceloc_num 119} true;
    call {:check_id "check_state_110"} {:sourceloc} {:sourceloc_num 119} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 794bv32), FADD32(FMUL32(v239$2, v190$2), FSUB32(2147483648bv32, FMUL32(v240$2, v210$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 794bv32)] := FADD32(FMUL32(v239$1, v190$1), FSUB32(2147483648bv32, FMUL32(v240$1, v210$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 794bv32)] := FADD32(FMUL32(v239$2, v190$2), FSUB32(2147483648bv32, FMUL32(v240$2, v210$2)));
    call {:sourceloc} {:sourceloc_num 120} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 795bv32), FADD32(FMUL32(v244$1, v226$1), FSUB32(2147483648bv32, FMUL32(v245$1, v230$1))), $$kfft.lds[1bv1][BV32_ADD(v246$1, 795bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 795bv32));
    assume {:do_not_predicate} {:check_id "check_state_111"} {:captureState "check_state_111"} {:sourceloc} {:sourceloc_num 120} true;
    call {:check_id "check_state_111"} {:sourceloc} {:sourceloc_num 120} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 795bv32), FADD32(FMUL32(v244$2, v226$2), FSUB32(2147483648bv32, FMUL32(v245$2, v230$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 795bv32)] := FADD32(FMUL32(v244$1, v226$1), FSUB32(2147483648bv32, FMUL32(v245$1, v230$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 795bv32)] := FADD32(FMUL32(v244$2, v226$2), FSUB32(2147483648bv32, FMUL32(v245$2, v230$2)));
    call {:sourceloc} {:sourceloc_num 121} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1056bv32), FADD32(v195$1, v199$1), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1056bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1056bv32));
    assume {:do_not_predicate} {:check_id "check_state_112"} {:captureState "check_state_112"} {:sourceloc} {:sourceloc_num 121} true;
    call {:check_id "check_state_112"} {:sourceloc} {:sourceloc_num 121} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1056bv32), FADD32(v195$2, v199$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1056bv32)] := FADD32(v195$1, v199$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1056bv32)] := FADD32(v195$2, v199$2);
    call {:sourceloc} {:sourceloc_num 122} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1057bv32), FADD32(FMUL32(v234$1, v219$1), FMUL32(v235$1, v215$1)), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1057bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1057bv32));
    assume {:do_not_predicate} {:check_id "check_state_113"} {:captureState "check_state_113"} {:sourceloc} {:sourceloc_num 122} true;
    call {:check_id "check_state_113"} {:sourceloc} {:sourceloc_num 122} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1057bv32), FADD32(FMUL32(v234$2, v219$2), FMUL32(v235$2, v215$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1057bv32)] := FADD32(FMUL32(v234$1, v219$1), FMUL32(v235$1, v215$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1057bv32)] := FADD32(FMUL32(v234$2, v219$2), FMUL32(v235$2, v215$2));
    call {:sourceloc} {:sourceloc_num 123} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1058bv32), FADD32(FMUL32(v239$1, v207$1), FMUL32(v240$1, v187$1)), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1058bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1058bv32));
    assume {:do_not_predicate} {:check_id "check_state_114"} {:captureState "check_state_114"} {:sourceloc} {:sourceloc_num 123} true;
    call {:check_id "check_state_114"} {:sourceloc} {:sourceloc_num 123} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1058bv32), FADD32(FMUL32(v239$2, v207$2), FMUL32(v240$2, v187$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1058bv32)] := FADD32(FMUL32(v239$1, v207$1), FMUL32(v240$1, v187$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1058bv32)] := FADD32(FMUL32(v239$2, v207$2), FMUL32(v240$2, v187$2));
    call {:sourceloc} {:sourceloc_num 124} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1059bv32), FADD32(FMUL32(v244$1, v227$1), FMUL32(v245$1, v223$1)), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1059bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1059bv32));
    assume {:do_not_predicate} {:check_id "check_state_115"} {:captureState "check_state_115"} {:sourceloc} {:sourceloc_num 124} true;
    call {:check_id "check_state_115"} {:sourceloc} {:sourceloc_num 124} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1059bv32), FADD32(FMUL32(v244$2, v227$2), FMUL32(v245$2, v223$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1059bv32)] := FADD32(FMUL32(v244$1, v227$1), FMUL32(v245$1, v223$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1059bv32)] := FADD32(FMUL32(v244$2, v227$2), FMUL32(v245$2, v223$2));
    call {:sourceloc} {:sourceloc_num 125} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1320bv32), FADD32(v196$1, v200$1), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1320bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1320bv32));
    assume {:do_not_predicate} {:check_id "check_state_116"} {:captureState "check_state_116"} {:sourceloc} {:sourceloc_num 125} true;
    call {:check_id "check_state_116"} {:sourceloc} {:sourceloc_num 125} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1320bv32), FADD32(v196$2, v200$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1320bv32)] := FADD32(v196$1, v200$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1320bv32)] := FADD32(v196$2, v200$2);
    call {:sourceloc} {:sourceloc_num 126} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1321bv32), FADD32(FMUL32(v234$1, v220$1), FMUL32(v235$1, v216$1)), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1321bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1321bv32));
    assume {:do_not_predicate} {:check_id "check_state_117"} {:captureState "check_state_117"} {:sourceloc} {:sourceloc_num 126} true;
    call {:check_id "check_state_117"} {:sourceloc} {:sourceloc_num 126} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1321bv32), FADD32(FMUL32(v234$2, v220$2), FMUL32(v235$2, v216$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1321bv32)] := FADD32(FMUL32(v234$1, v220$1), FMUL32(v235$1, v216$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1321bv32)] := FADD32(FMUL32(v234$2, v220$2), FMUL32(v235$2, v216$2));
    call {:sourceloc} {:sourceloc_num 127} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1322bv32), FADD32(FMUL32(v239$1, v208$1), FMUL32(v240$1, v188$1)), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1322bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1322bv32));
    assume {:do_not_predicate} {:check_id "check_state_118"} {:captureState "check_state_118"} {:sourceloc} {:sourceloc_num 127} true;
    call {:check_id "check_state_118"} {:sourceloc} {:sourceloc_num 127} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1322bv32), FADD32(FMUL32(v239$2, v208$2), FMUL32(v240$2, v188$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1322bv32)] := FADD32(FMUL32(v239$1, v208$1), FMUL32(v240$1, v188$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1322bv32)] := FADD32(FMUL32(v239$2, v208$2), FMUL32(v240$2, v188$2));
    call {:sourceloc} {:sourceloc_num 128} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1323bv32), FADD32(FMUL32(v244$1, v228$1), FMUL32(v245$1, v224$1)), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1323bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1323bv32));
    assume {:do_not_predicate} {:check_id "check_state_119"} {:captureState "check_state_119"} {:sourceloc} {:sourceloc_num 128} true;
    call {:check_id "check_state_119"} {:sourceloc} {:sourceloc_num 128} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1323bv32), FADD32(FMUL32(v244$2, v228$2), FMUL32(v245$2, v224$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1323bv32)] := FADD32(FMUL32(v244$1, v228$1), FMUL32(v245$1, v224$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1323bv32)] := FADD32(FMUL32(v244$2, v228$2), FMUL32(v245$2, v224$2));
    call {:sourceloc} {:sourceloc_num 129} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1584bv32), FADD32(v197$1, v201$1), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1584bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1584bv32));
    assume {:do_not_predicate} {:check_id "check_state_120"} {:captureState "check_state_120"} {:sourceloc} {:sourceloc_num 129} true;
    call {:check_id "check_state_120"} {:sourceloc} {:sourceloc_num 129} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1584bv32), FADD32(v197$2, v201$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1584bv32)] := FADD32(v197$1, v201$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1584bv32)] := FADD32(v197$2, v201$2);
    call {:sourceloc} {:sourceloc_num 130} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1585bv32), FADD32(FMUL32(v234$1, v221$1), FMUL32(v235$1, v217$1)), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1585bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1585bv32));
    assume {:do_not_predicate} {:check_id "check_state_121"} {:captureState "check_state_121"} {:sourceloc} {:sourceloc_num 130} true;
    call {:check_id "check_state_121"} {:sourceloc} {:sourceloc_num 130} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1585bv32), FADD32(FMUL32(v234$2, v221$2), FMUL32(v235$2, v217$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1585bv32)] := FADD32(FMUL32(v234$1, v221$1), FMUL32(v235$1, v217$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1585bv32)] := FADD32(FMUL32(v234$2, v221$2), FMUL32(v235$2, v217$2));
    call {:sourceloc} {:sourceloc_num 131} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1586bv32), FADD32(FMUL32(v239$1, v209$1), FMUL32(v240$1, v189$1)), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1586bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1586bv32));
    assume {:do_not_predicate} {:check_id "check_state_122"} {:captureState "check_state_122"} {:sourceloc} {:sourceloc_num 131} true;
    call {:check_id "check_state_122"} {:sourceloc} {:sourceloc_num 131} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1586bv32), FADD32(FMUL32(v239$2, v209$2), FMUL32(v240$2, v189$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1586bv32)] := FADD32(FMUL32(v239$1, v209$1), FMUL32(v240$1, v189$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1586bv32)] := FADD32(FMUL32(v239$2, v209$2), FMUL32(v240$2, v189$2));
    call {:sourceloc} {:sourceloc_num 132} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1587bv32), FADD32(FMUL32(v244$1, v229$1), FMUL32(v245$1, v225$1)), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1587bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1587bv32));
    assume {:do_not_predicate} {:check_id "check_state_123"} {:captureState "check_state_123"} {:sourceloc} {:sourceloc_num 132} true;
    call {:check_id "check_state_123"} {:sourceloc} {:sourceloc_num 132} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1587bv32), FADD32(FMUL32(v244$2, v229$2), FMUL32(v245$2, v225$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1587bv32)] := FADD32(FMUL32(v244$1, v229$1), FMUL32(v245$1, v225$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1587bv32)] := FADD32(FMUL32(v244$2, v229$2), FMUL32(v245$2, v225$2));
    call {:sourceloc} {:sourceloc_num 133} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1848bv32), FADD32(v198$1, v202$1), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1848bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1848bv32));
    assume {:do_not_predicate} {:check_id "check_state_124"} {:captureState "check_state_124"} {:sourceloc} {:sourceloc_num 133} true;
    call {:check_id "check_state_124"} {:sourceloc} {:sourceloc_num 133} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1848bv32), FADD32(v198$2, v202$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1848bv32)] := FADD32(v198$1, v202$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1848bv32)] := FADD32(v198$2, v202$2);
    call {:sourceloc} {:sourceloc_num 134} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1849bv32), FADD32(FMUL32(v234$1, v222$1), FMUL32(v235$1, v218$1)), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1849bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1849bv32));
    assume {:do_not_predicate} {:check_id "check_state_125"} {:captureState "check_state_125"} {:sourceloc} {:sourceloc_num 134} true;
    call {:check_id "check_state_125"} {:sourceloc} {:sourceloc_num 134} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1849bv32), FADD32(FMUL32(v234$2, v222$2), FMUL32(v235$2, v218$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1849bv32)] := FADD32(FMUL32(v234$1, v222$1), FMUL32(v235$1, v218$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1849bv32)] := FADD32(FMUL32(v234$2, v222$2), FMUL32(v235$2, v218$2));
    call {:sourceloc} {:sourceloc_num 135} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1850bv32), FADD32(FMUL32(v239$1, v210$1), FMUL32(v240$1, v190$1)), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1850bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1850bv32));
    assume {:do_not_predicate} {:check_id "check_state_126"} {:captureState "check_state_126"} {:sourceloc} {:sourceloc_num 135} true;
    call {:check_id "check_state_126"} {:sourceloc} {:sourceloc_num 135} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1850bv32), FADD32(FMUL32(v239$2, v210$2), FMUL32(v240$2, v190$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1850bv32)] := FADD32(FMUL32(v239$1, v210$1), FMUL32(v240$1, v190$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1850bv32)] := FADD32(FMUL32(v239$2, v210$2), FMUL32(v240$2, v190$2));
    call {:sourceloc} {:sourceloc_num 136} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v246$1, 1851bv32), FADD32(FMUL32(v244$1, v230$1), FMUL32(v245$1, v226$1)), $$kfft.lds[1bv1][BV32_ADD(v246$1, 1851bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v246$2, 1851bv32));
    assume {:do_not_predicate} {:check_id "check_state_127"} {:captureState "check_state_127"} {:sourceloc} {:sourceloc_num 136} true;
    call {:check_id "check_state_127"} {:sourceloc} {:sourceloc_num 136} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v246$2, 1851bv32), FADD32(FMUL32(v244$2, v230$2), FMUL32(v245$2, v226$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v246$1, 1851bv32)] := FADD32(FMUL32(v244$1, v230$1), FMUL32(v245$1, v226$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v246$2, 1851bv32)] := FADD32(FMUL32(v244$2, v230$2), FMUL32(v245$2, v226$2));
    goto __partitioned_block_$0_3;

  __partitioned_block_$0_3:
    call {:sourceloc_num 137} $bugle_barrier_duplicated_2(1bv1, 0bv1);
    v247$1 := BV32_ADD(v1$1, BV32_LSHR(v1$1, 5bv32));
    v247$2 := BV32_ADD(v1$2, BV32_LSHR(v1$2, 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_128"} {:captureState "check_state_128"} {:sourceloc} {:sourceloc_num 138} true;
    v248$1 := $$kfft.lds[1bv1][v247$1];
    v248$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v247$2];
    assume {:do_not_predicate} {:check_id "check_state_129"} {:captureState "check_state_129"} {:sourceloc} {:sourceloc_num 139} true;
    v249$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 66bv32)];
    v249$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 66bv32)];
    assume {:do_not_predicate} {:check_id "check_state_130"} {:captureState "check_state_130"} {:sourceloc} {:sourceloc_num 140} true;
    v250$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 132bv32)];
    v250$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 132bv32)];
    assume {:do_not_predicate} {:check_id "check_state_131"} {:captureState "check_state_131"} {:sourceloc} {:sourceloc_num 141} true;
    v251$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 198bv32)];
    v251$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 198bv32)];
    assume {:do_not_predicate} {:check_id "check_state_132"} {:captureState "check_state_132"} {:sourceloc} {:sourceloc_num 142} true;
    v252$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 264bv32)];
    v252$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 264bv32)];
    assume {:do_not_predicate} {:check_id "check_state_133"} {:captureState "check_state_133"} {:sourceloc} {:sourceloc_num 143} true;
    v253$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 330bv32)];
    v253$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 330bv32)];
    assume {:do_not_predicate} {:check_id "check_state_134"} {:captureState "check_state_134"} {:sourceloc} {:sourceloc_num 144} true;
    v254$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 396bv32)];
    v254$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 396bv32)];
    assume {:do_not_predicate} {:check_id "check_state_135"} {:captureState "check_state_135"} {:sourceloc} {:sourceloc_num 145} true;
    v255$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 462bv32)];
    v255$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 462bv32)];
    assume {:do_not_predicate} {:check_id "check_state_136"} {:captureState "check_state_136"} {:sourceloc} {:sourceloc_num 146} true;
    v256$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 528bv32)];
    v256$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 528bv32)];
    assume {:do_not_predicate} {:check_id "check_state_137"} {:captureState "check_state_137"} {:sourceloc} {:sourceloc_num 147} true;
    v257$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 594bv32)];
    v257$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 594bv32)];
    assume {:do_not_predicate} {:check_id "check_state_138"} {:captureState "check_state_138"} {:sourceloc} {:sourceloc_num 148} true;
    v258$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 660bv32)];
    v258$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 660bv32)];
    assume {:do_not_predicate} {:check_id "check_state_139"} {:captureState "check_state_139"} {:sourceloc} {:sourceloc_num 149} true;
    v259$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 726bv32)];
    v259$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 726bv32)];
    assume {:do_not_predicate} {:check_id "check_state_140"} {:captureState "check_state_140"} {:sourceloc} {:sourceloc_num 150} true;
    v260$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 792bv32)];
    v260$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 792bv32)];
    assume {:do_not_predicate} {:check_id "check_state_141"} {:captureState "check_state_141"} {:sourceloc} {:sourceloc_num 151} true;
    v261$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 858bv32)];
    v261$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 858bv32)];
    assume {:do_not_predicate} {:check_id "check_state_142"} {:captureState "check_state_142"} {:sourceloc} {:sourceloc_num 152} true;
    v262$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 924bv32)];
    v262$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 924bv32)];
    assume {:do_not_predicate} {:check_id "check_state_143"} {:captureState "check_state_143"} {:sourceloc} {:sourceloc_num 153} true;
    v263$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 990bv32)];
    v263$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 990bv32)];
    assume {:do_not_predicate} {:check_id "check_state_144"} {:captureState "check_state_144"} {:sourceloc} {:sourceloc_num 154} true;
    v264$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1056bv32)];
    v264$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1056bv32)];
    assume {:do_not_predicate} {:check_id "check_state_145"} {:captureState "check_state_145"} {:sourceloc} {:sourceloc_num 155} true;
    v265$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1122bv32)];
    v265$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1122bv32)];
    assume {:do_not_predicate} {:check_id "check_state_146"} {:captureState "check_state_146"} {:sourceloc} {:sourceloc_num 156} true;
    v266$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1188bv32)];
    v266$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1188bv32)];
    assume {:do_not_predicate} {:check_id "check_state_147"} {:captureState "check_state_147"} {:sourceloc} {:sourceloc_num 157} true;
    v267$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1254bv32)];
    v267$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1254bv32)];
    assume {:do_not_predicate} {:check_id "check_state_148"} {:captureState "check_state_148"} {:sourceloc} {:sourceloc_num 158} true;
    v268$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1320bv32)];
    v268$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1320bv32)];
    assume {:do_not_predicate} {:check_id "check_state_149"} {:captureState "check_state_149"} {:sourceloc} {:sourceloc_num 159} true;
    v269$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1386bv32)];
    v269$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1386bv32)];
    assume {:do_not_predicate} {:check_id "check_state_150"} {:captureState "check_state_150"} {:sourceloc} {:sourceloc_num 160} true;
    v270$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1452bv32)];
    v270$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1452bv32)];
    assume {:do_not_predicate} {:check_id "check_state_151"} {:captureState "check_state_151"} {:sourceloc} {:sourceloc_num 161} true;
    v271$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1518bv32)];
    v271$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1518bv32)];
    assume {:do_not_predicate} {:check_id "check_state_152"} {:captureState "check_state_152"} {:sourceloc} {:sourceloc_num 162} true;
    v272$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1584bv32)];
    v272$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1584bv32)];
    assume {:do_not_predicate} {:check_id "check_state_153"} {:captureState "check_state_153"} {:sourceloc} {:sourceloc_num 163} true;
    v273$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1650bv32)];
    v273$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1650bv32)];
    assume {:do_not_predicate} {:check_id "check_state_154"} {:captureState "check_state_154"} {:sourceloc} {:sourceloc_num 164} true;
    v274$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1716bv32)];
    v274$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1716bv32)];
    assume {:do_not_predicate} {:check_id "check_state_155"} {:captureState "check_state_155"} {:sourceloc} {:sourceloc_num 165} true;
    v275$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1782bv32)];
    v275$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1782bv32)];
    assume {:do_not_predicate} {:check_id "check_state_156"} {:captureState "check_state_156"} {:sourceloc} {:sourceloc_num 166} true;
    v276$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1848bv32)];
    v276$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1848bv32)];
    assume {:do_not_predicate} {:check_id "check_state_157"} {:captureState "check_state_157"} {:sourceloc} {:sourceloc_num 167} true;
    v277$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1914bv32)];
    v277$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1914bv32)];
    assume {:do_not_predicate} {:check_id "check_state_158"} {:captureState "check_state_158"} {:sourceloc} {:sourceloc_num 168} true;
    v278$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 1980bv32)];
    v278$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 1980bv32)];
    assume {:do_not_predicate} {:check_id "check_state_159"} {:captureState "check_state_159"} {:sourceloc} {:sourceloc_num 169} true;
    v279$1 := $$kfft.lds[1bv1][BV32_ADD(v247$1, 2046bv32)];
    v279$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v247$2, 2046bv32)];
    v280$1 := FADD32(v248$1, v250$1);
    v280$2 := FADD32(v248$2, v250$2);
    v281$1 := FADD32(v252$1, v254$1);
    v281$2 := FADD32(v252$2, v254$2);
    v282$1 := FADD32(v256$1, v258$1);
    v282$2 := FADD32(v256$2, v258$2);
    v283$1 := FADD32(v260$1, v262$1);
    v283$2 := FADD32(v260$2, v262$2);
    v284$1 := FADD32(v249$1, v251$1);
    v284$2 := FADD32(v249$2, v251$2);
    v285$1 := FADD32(v253$1, v255$1);
    v285$2 := FADD32(v253$2, v255$2);
    v286$1 := FADD32(v257$1, v259$1);
    v286$2 := FADD32(v257$2, v259$2);
    v287$1 := FADD32(v261$1, v263$1);
    v287$2 := FADD32(v261$2, v263$2);
    v288$1 := FSUB32(v248$1, v250$1);
    v288$2 := FSUB32(v248$2, v250$2);
    v289$1 := FSUB32(v252$1, v254$1);
    v289$2 := FSUB32(v252$2, v254$2);
    v290$1 := FSUB32(v256$1, v258$1);
    v290$2 := FSUB32(v256$2, v258$2);
    v291$1 := FSUB32(v260$1, v262$1);
    v291$2 := FSUB32(v260$2, v262$2);
    v292$1 := FSUB32(v280$1, v284$1);
    v292$2 := FSUB32(v280$2, v284$2);
    v293$1 := FSUB32(v281$1, v285$1);
    v293$2 := FSUB32(v281$2, v285$2);
    v294$1 := FSUB32(v282$1, v286$1);
    v294$2 := FSUB32(v282$2, v286$2);
    v295$1 := FSUB32(v283$1, v287$1);
    v295$2 := FSUB32(v283$2, v287$2);
    v296$1 := FSUB32(v249$1, v251$1);
    v296$2 := FSUB32(v249$2, v251$2);
    v297$1 := FSUB32(v253$1, v255$1);
    v297$2 := FSUB32(v253$2, v255$2);
    v298$1 := FSUB32(v257$1, v259$1);
    v298$2 := FSUB32(v257$2, v259$2);
    v299$1 := FSUB32(v261$1, v263$1);
    v299$2 := FSUB32(v261$2, v263$2);
    v300$1 := FADD32(v264$1, v266$1);
    v300$2 := FADD32(v264$2, v266$2);
    v301$1 := FADD32(v268$1, v270$1);
    v301$2 := FADD32(v268$2, v270$2);
    v302$1 := FADD32(v272$1, v274$1);
    v302$2 := FADD32(v272$2, v274$2);
    v303$1 := FADD32(v276$1, v278$1);
    v303$2 := FADD32(v276$2, v278$2);
    v304$1 := FADD32(v265$1, v267$1);
    v304$2 := FADD32(v265$2, v267$2);
    v305$1 := FADD32(v269$1, v271$1);
    v305$2 := FADD32(v269$2, v271$2);
    v306$1 := FADD32(v273$1, v275$1);
    v306$2 := FADD32(v273$2, v275$2);
    v307$1 := FADD32(v277$1, v279$1);
    v307$2 := FADD32(v277$2, v279$2);
    v308$1 := FSUB32(v264$1, v266$1);
    v308$2 := FSUB32(v264$2, v266$2);
    v309$1 := FSUB32(v268$1, v270$1);
    v309$2 := FSUB32(v268$2, v270$2);
    v310$1 := FSUB32(v272$1, v274$1);
    v310$2 := FSUB32(v272$2, v274$2);
    v311$1 := FSUB32(v276$1, v278$1);
    v311$2 := FSUB32(v276$2, v278$2);
    v312$1 := FSUB32(v300$1, v304$1);
    v312$2 := FSUB32(v300$2, v304$2);
    v313$1 := FSUB32(v301$1, v305$1);
    v313$2 := FSUB32(v301$2, v305$2);
    v314$1 := FSUB32(v302$1, v306$1);
    v314$2 := FSUB32(v302$2, v306$2);
    v315$1 := FSUB32(v303$1, v307$1);
    v315$2 := FSUB32(v303$2, v307$2);
    v316$1 := FSUB32(v265$1, v267$1);
    v316$2 := FSUB32(v265$2, v267$2);
    v317$1 := FSUB32(v269$1, v271$1);
    v317$2 := FSUB32(v269$2, v271$2);
    v318$1 := FSUB32(v273$1, v275$1);
    v318$2 := FSUB32(v273$2, v275$2);
    v319$1 := FSUB32(v277$1, v279$1);
    v319$2 := FSUB32(v277$2, v279$2);
    v320$1 := FADD32(v288$1, v316$1);
    v320$2 := FADD32(v288$2, v316$2);
    v321$1 := FADD32(v289$1, v317$1);
    v321$2 := FADD32(v289$2, v317$2);
    v322$1 := FADD32(v290$1, v318$1);
    v322$2 := FADD32(v290$2, v318$2);
    v323$1 := FADD32(v291$1, v319$1);
    v323$2 := FADD32(v291$2, v319$2);
    v324$1 := FSUB32(v308$1, v296$1);
    v324$2 := FSUB32(v308$2, v296$2);
    v325$1 := FSUB32(v309$1, v297$1);
    v325$2 := FSUB32(v309$2, v297$2);
    v326$1 := FSUB32(v310$1, v298$1);
    v326$2 := FSUB32(v310$2, v298$2);
    v327$1 := FSUB32(v311$1, v299$1);
    v327$2 := FSUB32(v311$2, v299$2);
    v328$1 := FSUB32(v288$1, v316$1);
    v328$2 := FSUB32(v288$2, v316$2);
    v329$1 := FSUB32(v289$1, v317$1);
    v329$2 := FSUB32(v289$2, v317$2);
    v330$1 := FSUB32(v290$1, v318$1);
    v330$2 := FSUB32(v290$2, v318$2);
    v331$1 := FSUB32(v291$1, v319$1);
    v331$2 := FSUB32(v291$2, v319$2);
    v332$1 := FADD32(v296$1, v308$1);
    v332$2 := FADD32(v296$2, v308$2);
    v333$1 := FADD32(v297$1, v309$1);
    v333$2 := FADD32(v297$2, v309$2);
    v334$1 := FADD32(v298$1, v310$1);
    v334$2 := FADD32(v298$2, v310$2);
    v335$1 := FADD32(v299$1, v311$1);
    v335$2 := FADD32(v299$2, v311$2);
    v336$1 := BV32_SHL(BV32_LSHR(v1$1, 2bv32), 4bv32);
    v336$2 := BV32_SHL(BV32_LSHR(v1$2, 2bv32), 4bv32);
    v337$1 := BV32_SGT(v336$1, 512bv32);
    v337$2 := BV32_SGT(v336$2, 512bv32);
    p6$1 := (if v337$1 then v337$1 else p6$1);
    p6$2 := (if v337$2 then v337$2 else p6$2);
    p7$1 := (if !v337$1 then !v337$1 else p7$1);
    p7$2 := (if !v337$2 then !v337$2 else p7$2);
    $.03$1 := (if p6$1 then BV32_SUB(v336$1, 1024bv32) else $.03$1);
    $.03$2 := (if p6$2 then BV32_SUB(v336$2, 1024bv32) else $.03$2);
    $.03$1 := (if p7$1 then v336$1 else $.03$1);
    $.03$2 := (if p7$2 then v336$2 else $.03$2);
    v338$1 := FMUL32(SI32_TO_FP32($.03$1), 3150516187bv32);
    v338$2 := FMUL32(SI32_TO_FP32($.03$2), 3150516187bv32);
    v339$1 := FCOS32(v338$1);
    v339$2 := FCOS32(v338$2);
    v340$1 := FSIN32(v338$1);
    v340$2 := FSIN32(v338$2);
    v341$1 := BV32_MUL(v336$1, 2bv32);
    v341$2 := BV32_MUL(v336$2, 2bv32);
    v342$1 := BV32_SGT(v341$1, 512bv32);
    v342$2 := BV32_SGT(v341$2, 512bv32);
    p8$1 := (if v342$1 then v342$1 else p8$1);
    p8$2 := (if v342$2 then v342$2 else p8$2);
    p9$1 := (if !v342$1 then !v342$1 else p9$1);
    p9$2 := (if !v342$2 then !v342$2 else p9$2);
    $.05$1 := (if p8$1 then BV32_SUB(v341$1, 1024bv32) else $.05$1);
    $.05$2 := (if p8$2 then BV32_SUB(v341$2, 1024bv32) else $.05$2);
    $.05$1 := (if p9$1 then v341$1 else $.05$1);
    $.05$2 := (if p9$2 then v341$2 else $.05$2);
    v343$1 := FMUL32(SI32_TO_FP32($.05$1), 3150516187bv32);
    v343$2 := FMUL32(SI32_TO_FP32($.05$2), 3150516187bv32);
    v344$1 := FCOS32(v343$1);
    v344$2 := FCOS32(v343$2);
    v345$1 := FSIN32(v343$1);
    v345$2 := FSIN32(v343$2);
    v346$1 := BV32_MUL(v336$1, 3bv32);
    v346$2 := BV32_MUL(v336$2, 3bv32);
    v347$1 := BV32_SGT(v346$1, 512bv32);
    v347$2 := BV32_SGT(v346$2, 512bv32);
    p10$1 := (if v347$1 then v347$1 else p10$1);
    p10$2 := (if v347$2 then v347$2 else p10$2);
    p11$1 := (if !v347$1 then !v347$1 else p11$1);
    p11$2 := (if !v347$2 then !v347$2 else p11$2);
    $.04$1 := (if p10$1 then BV32_SUB(v346$1, 1024bv32) else $.04$1);
    $.04$2 := (if p10$2 then BV32_SUB(v346$2, 1024bv32) else $.04$2);
    $.04$1 := (if p11$1 then v346$1 else $.04$1);
    $.04$2 := (if p11$2 then v346$2 else $.04$2);
    v348$1 := FMUL32(SI32_TO_FP32($.04$1), 3150516187bv32);
    v348$2 := FMUL32(SI32_TO_FP32($.04$2), 3150516187bv32);
    v349$1 := FCOS32(v348$1);
    v349$2 := FCOS32(v348$2);
    v350$1 := FSIN32(v348$1);
    v350$2 := FSIN32(v348$2);
    goto __partitioned_block_$0_4;

  __partitioned_block_$0_4:
    call {:sourceloc_num 176} $bugle_barrier_duplicated_3(1bv1, 0bv1);
    call {:sourceloc} {:sourceloc_num 177} _LOG_WRITE_$$kfft.lds(true, v1$1, FADD32(v280$1, v284$1), $$kfft.lds[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_160"} {:captureState "check_state_160"} {:sourceloc} {:sourceloc_num 177} true;
    call {:check_id "check_state_160"} {:sourceloc} {:sourceloc_num 177} _CHECK_WRITE_$$kfft.lds(true, v1$2, FADD32(v280$2, v284$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][v1$1] := FADD32(v280$1, v284$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := FADD32(v280$2, v284$2);
    call {:sourceloc} {:sourceloc_num 178} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 66bv32), FADD32(v281$1, v285$1), $$kfft.lds[1bv1][BV32_ADD(v1$1, 66bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 66bv32));
    assume {:do_not_predicate} {:check_id "check_state_161"} {:captureState "check_state_161"} {:sourceloc} {:sourceloc_num 178} true;
    call {:check_id "check_state_161"} {:sourceloc} {:sourceloc_num 178} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 66bv32), FADD32(v281$2, v285$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 66bv32)] := FADD32(v281$1, v285$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 66bv32)] := FADD32(v281$2, v285$2);
    call {:sourceloc} {:sourceloc_num 179} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 132bv32), FADD32(v282$1, v286$1), $$kfft.lds[1bv1][BV32_ADD(v1$1, 132bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 132bv32));
    assume {:do_not_predicate} {:check_id "check_state_162"} {:captureState "check_state_162"} {:sourceloc} {:sourceloc_num 179} true;
    call {:check_id "check_state_162"} {:sourceloc} {:sourceloc_num 179} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 132bv32), FADD32(v282$2, v286$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 132bv32)] := FADD32(v282$1, v286$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 132bv32)] := FADD32(v282$2, v286$2);
    call {:sourceloc} {:sourceloc_num 180} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 198bv32), FADD32(v283$1, v287$1), $$kfft.lds[1bv1][BV32_ADD(v1$1, 198bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 198bv32));
    assume {:do_not_predicate} {:check_id "check_state_163"} {:captureState "check_state_163"} {:sourceloc} {:sourceloc_num 180} true;
    call {:check_id "check_state_163"} {:sourceloc} {:sourceloc_num 180} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 198bv32), FADD32(v283$2, v287$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 198bv32)] := FADD32(v283$1, v287$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 198bv32)] := FADD32(v283$2, v287$2);
    call {:sourceloc} {:sourceloc_num 181} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 264bv32), FADD32(FMUL32(v339$1, v320$1), FSUB32(2147483648bv32, FMUL32(v340$1, v324$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 264bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 264bv32));
    assume {:do_not_predicate} {:check_id "check_state_164"} {:captureState "check_state_164"} {:sourceloc} {:sourceloc_num 181} true;
    call {:check_id "check_state_164"} {:sourceloc} {:sourceloc_num 181} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 264bv32), FADD32(FMUL32(v339$2, v320$2), FSUB32(2147483648bv32, FMUL32(v340$2, v324$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 264bv32)] := FADD32(FMUL32(v339$1, v320$1), FSUB32(2147483648bv32, FMUL32(v340$1, v324$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 264bv32)] := FADD32(FMUL32(v339$2, v320$2), FSUB32(2147483648bv32, FMUL32(v340$2, v324$2)));
    call {:sourceloc} {:sourceloc_num 182} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 330bv32), FADD32(FMUL32(v339$1, v321$1), FSUB32(2147483648bv32, FMUL32(v340$1, v325$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 330bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 330bv32));
    assume {:do_not_predicate} {:check_id "check_state_165"} {:captureState "check_state_165"} {:sourceloc} {:sourceloc_num 182} true;
    call {:check_id "check_state_165"} {:sourceloc} {:sourceloc_num 182} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 330bv32), FADD32(FMUL32(v339$2, v321$2), FSUB32(2147483648bv32, FMUL32(v340$2, v325$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 330bv32)] := FADD32(FMUL32(v339$1, v321$1), FSUB32(2147483648bv32, FMUL32(v340$1, v325$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 330bv32)] := FADD32(FMUL32(v339$2, v321$2), FSUB32(2147483648bv32, FMUL32(v340$2, v325$2)));
    call {:sourceloc} {:sourceloc_num 183} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 396bv32), FADD32(FMUL32(v339$1, v322$1), FSUB32(2147483648bv32, FMUL32(v340$1, v326$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 396bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 396bv32));
    assume {:do_not_predicate} {:check_id "check_state_166"} {:captureState "check_state_166"} {:sourceloc} {:sourceloc_num 183} true;
    call {:check_id "check_state_166"} {:sourceloc} {:sourceloc_num 183} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 396bv32), FADD32(FMUL32(v339$2, v322$2), FSUB32(2147483648bv32, FMUL32(v340$2, v326$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 396bv32)] := FADD32(FMUL32(v339$1, v322$1), FSUB32(2147483648bv32, FMUL32(v340$1, v326$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 396bv32)] := FADD32(FMUL32(v339$2, v322$2), FSUB32(2147483648bv32, FMUL32(v340$2, v326$2)));
    call {:sourceloc} {:sourceloc_num 184} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 462bv32), FADD32(FMUL32(v339$1, v323$1), FSUB32(2147483648bv32, FMUL32(v340$1, v327$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 462bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 462bv32));
    assume {:do_not_predicate} {:check_id "check_state_167"} {:captureState "check_state_167"} {:sourceloc} {:sourceloc_num 184} true;
    call {:check_id "check_state_167"} {:sourceloc} {:sourceloc_num 184} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 462bv32), FADD32(FMUL32(v339$2, v323$2), FSUB32(2147483648bv32, FMUL32(v340$2, v327$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 462bv32)] := FADD32(FMUL32(v339$1, v323$1), FSUB32(2147483648bv32, FMUL32(v340$1, v327$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 462bv32)] := FADD32(FMUL32(v339$2, v323$2), FSUB32(2147483648bv32, FMUL32(v340$2, v327$2)));
    call {:sourceloc} {:sourceloc_num 185} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 528bv32), FADD32(FMUL32(v344$1, v292$1), FSUB32(2147483648bv32, FMUL32(v345$1, v312$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 528bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 528bv32));
    assume {:do_not_predicate} {:check_id "check_state_168"} {:captureState "check_state_168"} {:sourceloc} {:sourceloc_num 185} true;
    call {:check_id "check_state_168"} {:sourceloc} {:sourceloc_num 185} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 528bv32), FADD32(FMUL32(v344$2, v292$2), FSUB32(2147483648bv32, FMUL32(v345$2, v312$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 528bv32)] := FADD32(FMUL32(v344$1, v292$1), FSUB32(2147483648bv32, FMUL32(v345$1, v312$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 528bv32)] := FADD32(FMUL32(v344$2, v292$2), FSUB32(2147483648bv32, FMUL32(v345$2, v312$2)));
    call {:sourceloc} {:sourceloc_num 186} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 594bv32), FADD32(FMUL32(v344$1, v293$1), FSUB32(2147483648bv32, FMUL32(v345$1, v313$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 594bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 594bv32));
    assume {:do_not_predicate} {:check_id "check_state_169"} {:captureState "check_state_169"} {:sourceloc} {:sourceloc_num 186} true;
    call {:check_id "check_state_169"} {:sourceloc} {:sourceloc_num 186} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 594bv32), FADD32(FMUL32(v344$2, v293$2), FSUB32(2147483648bv32, FMUL32(v345$2, v313$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 594bv32)] := FADD32(FMUL32(v344$1, v293$1), FSUB32(2147483648bv32, FMUL32(v345$1, v313$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 594bv32)] := FADD32(FMUL32(v344$2, v293$2), FSUB32(2147483648bv32, FMUL32(v345$2, v313$2)));
    call {:sourceloc} {:sourceloc_num 187} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 660bv32), FADD32(FMUL32(v344$1, v294$1), FSUB32(2147483648bv32, FMUL32(v345$1, v314$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 660bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 660bv32));
    assume {:do_not_predicate} {:check_id "check_state_170"} {:captureState "check_state_170"} {:sourceloc} {:sourceloc_num 187} true;
    call {:check_id "check_state_170"} {:sourceloc} {:sourceloc_num 187} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 660bv32), FADD32(FMUL32(v344$2, v294$2), FSUB32(2147483648bv32, FMUL32(v345$2, v314$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 660bv32)] := FADD32(FMUL32(v344$1, v294$1), FSUB32(2147483648bv32, FMUL32(v345$1, v314$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 660bv32)] := FADD32(FMUL32(v344$2, v294$2), FSUB32(2147483648bv32, FMUL32(v345$2, v314$2)));
    call {:sourceloc} {:sourceloc_num 188} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 726bv32), FADD32(FMUL32(v344$1, v295$1), FSUB32(2147483648bv32, FMUL32(v345$1, v315$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 726bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 726bv32));
    assume {:do_not_predicate} {:check_id "check_state_171"} {:captureState "check_state_171"} {:sourceloc} {:sourceloc_num 188} true;
    call {:check_id "check_state_171"} {:sourceloc} {:sourceloc_num 188} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 726bv32), FADD32(FMUL32(v344$2, v295$2), FSUB32(2147483648bv32, FMUL32(v345$2, v315$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 726bv32)] := FADD32(FMUL32(v344$1, v295$1), FSUB32(2147483648bv32, FMUL32(v345$1, v315$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 726bv32)] := FADD32(FMUL32(v344$2, v295$2), FSUB32(2147483648bv32, FMUL32(v345$2, v315$2)));
    call {:sourceloc} {:sourceloc_num 189} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 792bv32), FADD32(FMUL32(v349$1, v328$1), FSUB32(2147483648bv32, FMUL32(v350$1, v332$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 792bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 792bv32));
    assume {:do_not_predicate} {:check_id "check_state_172"} {:captureState "check_state_172"} {:sourceloc} {:sourceloc_num 189} true;
    call {:check_id "check_state_172"} {:sourceloc} {:sourceloc_num 189} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 792bv32), FADD32(FMUL32(v349$2, v328$2), FSUB32(2147483648bv32, FMUL32(v350$2, v332$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 792bv32)] := FADD32(FMUL32(v349$1, v328$1), FSUB32(2147483648bv32, FMUL32(v350$1, v332$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 792bv32)] := FADD32(FMUL32(v349$2, v328$2), FSUB32(2147483648bv32, FMUL32(v350$2, v332$2)));
    call {:sourceloc} {:sourceloc_num 190} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 858bv32), FADD32(FMUL32(v349$1, v329$1), FSUB32(2147483648bv32, FMUL32(v350$1, v333$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 858bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 858bv32));
    assume {:do_not_predicate} {:check_id "check_state_173"} {:captureState "check_state_173"} {:sourceloc} {:sourceloc_num 190} true;
    call {:check_id "check_state_173"} {:sourceloc} {:sourceloc_num 190} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 858bv32), FADD32(FMUL32(v349$2, v329$2), FSUB32(2147483648bv32, FMUL32(v350$2, v333$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 858bv32)] := FADD32(FMUL32(v349$1, v329$1), FSUB32(2147483648bv32, FMUL32(v350$1, v333$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 858bv32)] := FADD32(FMUL32(v349$2, v329$2), FSUB32(2147483648bv32, FMUL32(v350$2, v333$2)));
    call {:sourceloc} {:sourceloc_num 191} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 924bv32), FADD32(FMUL32(v349$1, v330$1), FSUB32(2147483648bv32, FMUL32(v350$1, v334$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 924bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 924bv32));
    assume {:do_not_predicate} {:check_id "check_state_174"} {:captureState "check_state_174"} {:sourceloc} {:sourceloc_num 191} true;
    call {:check_id "check_state_174"} {:sourceloc} {:sourceloc_num 191} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 924bv32), FADD32(FMUL32(v349$2, v330$2), FSUB32(2147483648bv32, FMUL32(v350$2, v334$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 924bv32)] := FADD32(FMUL32(v349$1, v330$1), FSUB32(2147483648bv32, FMUL32(v350$1, v334$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 924bv32)] := FADD32(FMUL32(v349$2, v330$2), FSUB32(2147483648bv32, FMUL32(v350$2, v334$2)));
    call {:sourceloc} {:sourceloc_num 192} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 990bv32), FADD32(FMUL32(v349$1, v331$1), FSUB32(2147483648bv32, FMUL32(v350$1, v335$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 990bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 990bv32));
    assume {:do_not_predicate} {:check_id "check_state_175"} {:captureState "check_state_175"} {:sourceloc} {:sourceloc_num 192} true;
    call {:check_id "check_state_175"} {:sourceloc} {:sourceloc_num 192} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 990bv32), FADD32(FMUL32(v349$2, v331$2), FSUB32(2147483648bv32, FMUL32(v350$2, v335$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 990bv32)] := FADD32(FMUL32(v349$1, v331$1), FSUB32(2147483648bv32, FMUL32(v350$1, v335$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 990bv32)] := FADD32(FMUL32(v349$2, v331$2), FSUB32(2147483648bv32, FMUL32(v350$2, v335$2)));
    call {:sourceloc} {:sourceloc_num 193} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1056bv32), FADD32(v300$1, v304$1), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1056bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1056bv32));
    assume {:do_not_predicate} {:check_id "check_state_176"} {:captureState "check_state_176"} {:sourceloc} {:sourceloc_num 193} true;
    call {:check_id "check_state_176"} {:sourceloc} {:sourceloc_num 193} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1056bv32), FADD32(v300$2, v304$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1056bv32)] := FADD32(v300$1, v304$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1056bv32)] := FADD32(v300$2, v304$2);
    call {:sourceloc} {:sourceloc_num 194} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1122bv32), FADD32(v301$1, v305$1), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1122bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1122bv32));
    assume {:do_not_predicate} {:check_id "check_state_177"} {:captureState "check_state_177"} {:sourceloc} {:sourceloc_num 194} true;
    call {:check_id "check_state_177"} {:sourceloc} {:sourceloc_num 194} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1122bv32), FADD32(v301$2, v305$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1122bv32)] := FADD32(v301$1, v305$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1122bv32)] := FADD32(v301$2, v305$2);
    call {:sourceloc} {:sourceloc_num 195} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1188bv32), FADD32(v302$1, v306$1), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1188bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1188bv32));
    assume {:do_not_predicate} {:check_id "check_state_178"} {:captureState "check_state_178"} {:sourceloc} {:sourceloc_num 195} true;
    call {:check_id "check_state_178"} {:sourceloc} {:sourceloc_num 195} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1188bv32), FADD32(v302$2, v306$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1188bv32)] := FADD32(v302$1, v306$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1188bv32)] := FADD32(v302$2, v306$2);
    call {:sourceloc} {:sourceloc_num 196} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1254bv32), FADD32(v303$1, v307$1), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1254bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1254bv32));
    assume {:do_not_predicate} {:check_id "check_state_179"} {:captureState "check_state_179"} {:sourceloc} {:sourceloc_num 196} true;
    call {:check_id "check_state_179"} {:sourceloc} {:sourceloc_num 196} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1254bv32), FADD32(v303$2, v307$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1254bv32)] := FADD32(v303$1, v307$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1254bv32)] := FADD32(v303$2, v307$2);
    call {:sourceloc} {:sourceloc_num 197} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1320bv32), FADD32(FMUL32(v339$1, v324$1), FMUL32(v340$1, v320$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1320bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1320bv32));
    assume {:do_not_predicate} {:check_id "check_state_180"} {:captureState "check_state_180"} {:sourceloc} {:sourceloc_num 197} true;
    call {:check_id "check_state_180"} {:sourceloc} {:sourceloc_num 197} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1320bv32), FADD32(FMUL32(v339$2, v324$2), FMUL32(v340$2, v320$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1320bv32)] := FADD32(FMUL32(v339$1, v324$1), FMUL32(v340$1, v320$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1320bv32)] := FADD32(FMUL32(v339$2, v324$2), FMUL32(v340$2, v320$2));
    call {:sourceloc} {:sourceloc_num 198} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1386bv32), FADD32(FMUL32(v339$1, v325$1), FMUL32(v340$1, v321$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1386bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1386bv32));
    assume {:do_not_predicate} {:check_id "check_state_181"} {:captureState "check_state_181"} {:sourceloc} {:sourceloc_num 198} true;
    call {:check_id "check_state_181"} {:sourceloc} {:sourceloc_num 198} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1386bv32), FADD32(FMUL32(v339$2, v325$2), FMUL32(v340$2, v321$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1386bv32)] := FADD32(FMUL32(v339$1, v325$1), FMUL32(v340$1, v321$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1386bv32)] := FADD32(FMUL32(v339$2, v325$2), FMUL32(v340$2, v321$2));
    call {:sourceloc} {:sourceloc_num 199} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1452bv32), FADD32(FMUL32(v339$1, v326$1), FMUL32(v340$1, v322$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1452bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1452bv32));
    assume {:do_not_predicate} {:check_id "check_state_182"} {:captureState "check_state_182"} {:sourceloc} {:sourceloc_num 199} true;
    call {:check_id "check_state_182"} {:sourceloc} {:sourceloc_num 199} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1452bv32), FADD32(FMUL32(v339$2, v326$2), FMUL32(v340$2, v322$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1452bv32)] := FADD32(FMUL32(v339$1, v326$1), FMUL32(v340$1, v322$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1452bv32)] := FADD32(FMUL32(v339$2, v326$2), FMUL32(v340$2, v322$2));
    call {:sourceloc} {:sourceloc_num 200} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1518bv32), FADD32(FMUL32(v339$1, v327$1), FMUL32(v340$1, v323$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1518bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1518bv32));
    assume {:do_not_predicate} {:check_id "check_state_183"} {:captureState "check_state_183"} {:sourceloc} {:sourceloc_num 200} true;
    call {:check_id "check_state_183"} {:sourceloc} {:sourceloc_num 200} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1518bv32), FADD32(FMUL32(v339$2, v327$2), FMUL32(v340$2, v323$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1518bv32)] := FADD32(FMUL32(v339$1, v327$1), FMUL32(v340$1, v323$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1518bv32)] := FADD32(FMUL32(v339$2, v327$2), FMUL32(v340$2, v323$2));
    call {:sourceloc} {:sourceloc_num 201} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1584bv32), FADD32(FMUL32(v344$1, v312$1), FMUL32(v345$1, v292$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1584bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1584bv32));
    assume {:do_not_predicate} {:check_id "check_state_184"} {:captureState "check_state_184"} {:sourceloc} {:sourceloc_num 201} true;
    call {:check_id "check_state_184"} {:sourceloc} {:sourceloc_num 201} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1584bv32), FADD32(FMUL32(v344$2, v312$2), FMUL32(v345$2, v292$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1584bv32)] := FADD32(FMUL32(v344$1, v312$1), FMUL32(v345$1, v292$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1584bv32)] := FADD32(FMUL32(v344$2, v312$2), FMUL32(v345$2, v292$2));
    call {:sourceloc} {:sourceloc_num 202} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1650bv32), FADD32(FMUL32(v344$1, v313$1), FMUL32(v345$1, v293$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1650bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1650bv32));
    assume {:do_not_predicate} {:check_id "check_state_185"} {:captureState "check_state_185"} {:sourceloc} {:sourceloc_num 202} true;
    call {:check_id "check_state_185"} {:sourceloc} {:sourceloc_num 202} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1650bv32), FADD32(FMUL32(v344$2, v313$2), FMUL32(v345$2, v293$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1650bv32)] := FADD32(FMUL32(v344$1, v313$1), FMUL32(v345$1, v293$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1650bv32)] := FADD32(FMUL32(v344$2, v313$2), FMUL32(v345$2, v293$2));
    call {:sourceloc} {:sourceloc_num 203} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1716bv32), FADD32(FMUL32(v344$1, v314$1), FMUL32(v345$1, v294$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1716bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1716bv32));
    assume {:do_not_predicate} {:check_id "check_state_186"} {:captureState "check_state_186"} {:sourceloc} {:sourceloc_num 203} true;
    call {:check_id "check_state_186"} {:sourceloc} {:sourceloc_num 203} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1716bv32), FADD32(FMUL32(v344$2, v314$2), FMUL32(v345$2, v294$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1716bv32)] := FADD32(FMUL32(v344$1, v314$1), FMUL32(v345$1, v294$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1716bv32)] := FADD32(FMUL32(v344$2, v314$2), FMUL32(v345$2, v294$2));
    call {:sourceloc} {:sourceloc_num 204} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1782bv32), FADD32(FMUL32(v344$1, v315$1), FMUL32(v345$1, v295$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1782bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1782bv32));
    assume {:do_not_predicate} {:check_id "check_state_187"} {:captureState "check_state_187"} {:sourceloc} {:sourceloc_num 204} true;
    call {:check_id "check_state_187"} {:sourceloc} {:sourceloc_num 204} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1782bv32), FADD32(FMUL32(v344$2, v315$2), FMUL32(v345$2, v295$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1782bv32)] := FADD32(FMUL32(v344$1, v315$1), FMUL32(v345$1, v295$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1782bv32)] := FADD32(FMUL32(v344$2, v315$2), FMUL32(v345$2, v295$2));
    call {:sourceloc} {:sourceloc_num 205} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1848bv32), FADD32(FMUL32(v349$1, v332$1), FMUL32(v350$1, v328$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1848bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1848bv32));
    assume {:do_not_predicate} {:check_id "check_state_188"} {:captureState "check_state_188"} {:sourceloc} {:sourceloc_num 205} true;
    call {:check_id "check_state_188"} {:sourceloc} {:sourceloc_num 205} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1848bv32), FADD32(FMUL32(v349$2, v332$2), FMUL32(v350$2, v328$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1848bv32)] := FADD32(FMUL32(v349$1, v332$1), FMUL32(v350$1, v328$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1848bv32)] := FADD32(FMUL32(v349$2, v332$2), FMUL32(v350$2, v328$2));
    call {:sourceloc} {:sourceloc_num 206} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1914bv32), FADD32(FMUL32(v349$1, v333$1), FMUL32(v350$1, v329$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1914bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1914bv32));
    assume {:do_not_predicate} {:check_id "check_state_189"} {:captureState "check_state_189"} {:sourceloc} {:sourceloc_num 206} true;
    call {:check_id "check_state_189"} {:sourceloc} {:sourceloc_num 206} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1914bv32), FADD32(FMUL32(v349$2, v333$2), FMUL32(v350$2, v329$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1914bv32)] := FADD32(FMUL32(v349$1, v333$1), FMUL32(v350$1, v329$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1914bv32)] := FADD32(FMUL32(v349$2, v333$2), FMUL32(v350$2, v329$2));
    call {:sourceloc} {:sourceloc_num 207} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1980bv32), FADD32(FMUL32(v349$1, v334$1), FMUL32(v350$1, v330$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1980bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1980bv32));
    assume {:do_not_predicate} {:check_id "check_state_190"} {:captureState "check_state_190"} {:sourceloc} {:sourceloc_num 207} true;
    call {:check_id "check_state_190"} {:sourceloc} {:sourceloc_num 207} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1980bv32), FADD32(FMUL32(v349$2, v334$2), FMUL32(v350$2, v330$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1980bv32)] := FADD32(FMUL32(v349$1, v334$1), FMUL32(v350$1, v330$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1980bv32)] := FADD32(FMUL32(v349$2, v334$2), FMUL32(v350$2, v330$2));
    call {:sourceloc} {:sourceloc_num 208} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 2046bv32), FADD32(FMUL32(v349$1, v335$1), FMUL32(v350$1, v331$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 2046bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 2046bv32));
    assume {:do_not_predicate} {:check_id "check_state_191"} {:captureState "check_state_191"} {:sourceloc} {:sourceloc_num 208} true;
    call {:check_id "check_state_191"} {:sourceloc} {:sourceloc_num 208} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 2046bv32), FADD32(FMUL32(v349$2, v335$2), FMUL32(v350$2, v331$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 2046bv32)] := FADD32(FMUL32(v349$1, v335$1), FMUL32(v350$1, v331$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 2046bv32)] := FADD32(FMUL32(v349$2, v335$2), FMUL32(v350$2, v331$2));
    goto __partitioned_block_$0_5;

  __partitioned_block_$0_5:
    call {:sourceloc_num 209} $bugle_barrier_duplicated_4(1bv1, 0bv1);
    v351$1 := BV32_ADD(BV32_ADD(BV32_AND(v1$1, 3bv32), BV32_MUL(BV32_AND(BV32_LSHR(v1$1, 2bv32), 3bv32), 264bv32)), BV32_SHL(BV32_LSHR(v1$1, 4bv32), 2bv32));
    v351$2 := BV32_ADD(BV32_ADD(BV32_AND(v1$2, 3bv32), BV32_MUL(BV32_AND(BV32_LSHR(v1$2, 2bv32), 3bv32), 264bv32)), BV32_SHL(BV32_LSHR(v1$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_192"} {:captureState "check_state_192"} {:sourceloc} {:sourceloc_num 210} true;
    v352$1 := $$kfft.lds[1bv1][v351$1];
    v352$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v351$2];
    assume {:do_not_predicate} {:check_id "check_state_193"} {:captureState "check_state_193"} {:sourceloc} {:sourceloc_num 211} true;
    v353$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 66bv32)];
    v353$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 66bv32)];
    assume {:do_not_predicate} {:check_id "check_state_194"} {:captureState "check_state_194"} {:sourceloc} {:sourceloc_num 212} true;
    v354$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 132bv32)];
    v354$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 132bv32)];
    assume {:do_not_predicate} {:check_id "check_state_195"} {:captureState "check_state_195"} {:sourceloc} {:sourceloc_num 213} true;
    v355$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 198bv32)];
    v355$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 198bv32)];
    assume {:do_not_predicate} {:check_id "check_state_196"} {:captureState "check_state_196"} {:sourceloc} {:sourceloc_num 214} true;
    v356$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 16bv32)];
    v356$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 16bv32)];
    assume {:do_not_predicate} {:check_id "check_state_197"} {:captureState "check_state_197"} {:sourceloc} {:sourceloc_num 215} true;
    v357$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 82bv32)];
    v357$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 82bv32)];
    assume {:do_not_predicate} {:check_id "check_state_198"} {:captureState "check_state_198"} {:sourceloc} {:sourceloc_num 216} true;
    v358$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 148bv32)];
    v358$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 148bv32)];
    assume {:do_not_predicate} {:check_id "check_state_199"} {:captureState "check_state_199"} {:sourceloc} {:sourceloc_num 217} true;
    v359$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 214bv32)];
    v359$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 214bv32)];
    assume {:do_not_predicate} {:check_id "check_state_200"} {:captureState "check_state_200"} {:sourceloc} {:sourceloc_num 218} true;
    v360$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 32bv32)];
    v360$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 32bv32)];
    assume {:do_not_predicate} {:check_id "check_state_201"} {:captureState "check_state_201"} {:sourceloc} {:sourceloc_num 219} true;
    v361$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 98bv32)];
    v361$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 98bv32)];
    assume {:do_not_predicate} {:check_id "check_state_202"} {:captureState "check_state_202"} {:sourceloc} {:sourceloc_num 220} true;
    v362$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 164bv32)];
    v362$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 164bv32)];
    assume {:do_not_predicate} {:check_id "check_state_203"} {:captureState "check_state_203"} {:sourceloc} {:sourceloc_num 221} true;
    v363$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 230bv32)];
    v363$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 230bv32)];
    assume {:do_not_predicate} {:check_id "check_state_204"} {:captureState "check_state_204"} {:sourceloc} {:sourceloc_num 222} true;
    v364$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 48bv32)];
    v364$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 48bv32)];
    assume {:do_not_predicate} {:check_id "check_state_205"} {:captureState "check_state_205"} {:sourceloc} {:sourceloc_num 223} true;
    v365$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 114bv32)];
    v365$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 114bv32)];
    assume {:do_not_predicate} {:check_id "check_state_206"} {:captureState "check_state_206"} {:sourceloc} {:sourceloc_num 224} true;
    v366$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 180bv32)];
    v366$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 180bv32)];
    assume {:do_not_predicate} {:check_id "check_state_207"} {:captureState "check_state_207"} {:sourceloc} {:sourceloc_num 225} true;
    v367$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 246bv32)];
    v367$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 246bv32)];
    assume {:do_not_predicate} {:check_id "check_state_208"} {:captureState "check_state_208"} {:sourceloc} {:sourceloc_num 226} true;
    v368$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1056bv32)];
    v368$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1056bv32)];
    assume {:do_not_predicate} {:check_id "check_state_209"} {:captureState "check_state_209"} {:sourceloc} {:sourceloc_num 227} true;
    v369$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1122bv32)];
    v369$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1122bv32)];
    assume {:do_not_predicate} {:check_id "check_state_210"} {:captureState "check_state_210"} {:sourceloc} {:sourceloc_num 228} true;
    v370$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1188bv32)];
    v370$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1188bv32)];
    assume {:do_not_predicate} {:check_id "check_state_211"} {:captureState "check_state_211"} {:sourceloc} {:sourceloc_num 229} true;
    v371$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1254bv32)];
    v371$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1254bv32)];
    assume {:do_not_predicate} {:check_id "check_state_212"} {:captureState "check_state_212"} {:sourceloc} {:sourceloc_num 230} true;
    v372$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1072bv32)];
    v372$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1072bv32)];
    assume {:do_not_predicate} {:check_id "check_state_213"} {:captureState "check_state_213"} {:sourceloc} {:sourceloc_num 231} true;
    v373$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1138bv32)];
    v373$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1138bv32)];
    assume {:do_not_predicate} {:check_id "check_state_214"} {:captureState "check_state_214"} {:sourceloc} {:sourceloc_num 232} true;
    v374$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1204bv32)];
    v374$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1204bv32)];
    assume {:do_not_predicate} {:check_id "check_state_215"} {:captureState "check_state_215"} {:sourceloc} {:sourceloc_num 233} true;
    v375$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1270bv32)];
    v375$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1270bv32)];
    assume {:do_not_predicate} {:check_id "check_state_216"} {:captureState "check_state_216"} {:sourceloc} {:sourceloc_num 234} true;
    v376$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1088bv32)];
    v376$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1088bv32)];
    assume {:do_not_predicate} {:check_id "check_state_217"} {:captureState "check_state_217"} {:sourceloc} {:sourceloc_num 235} true;
    v377$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1154bv32)];
    v377$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1154bv32)];
    assume {:do_not_predicate} {:check_id "check_state_218"} {:captureState "check_state_218"} {:sourceloc} {:sourceloc_num 236} true;
    v378$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1220bv32)];
    v378$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1220bv32)];
    assume {:do_not_predicate} {:check_id "check_state_219"} {:captureState "check_state_219"} {:sourceloc} {:sourceloc_num 237} true;
    v379$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1286bv32)];
    v379$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1286bv32)];
    assume {:do_not_predicate} {:check_id "check_state_220"} {:captureState "check_state_220"} {:sourceloc} {:sourceloc_num 238} true;
    v380$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1104bv32)];
    v380$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1104bv32)];
    assume {:do_not_predicate} {:check_id "check_state_221"} {:captureState "check_state_221"} {:sourceloc} {:sourceloc_num 239} true;
    v381$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1170bv32)];
    v381$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1170bv32)];
    assume {:do_not_predicate} {:check_id "check_state_222"} {:captureState "check_state_222"} {:sourceloc} {:sourceloc_num 240} true;
    v382$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1236bv32)];
    v382$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1236bv32)];
    assume {:do_not_predicate} {:check_id "check_state_223"} {:captureState "check_state_223"} {:sourceloc} {:sourceloc_num 241} true;
    v383$1 := $$kfft.lds[1bv1][BV32_ADD(v351$1, 1302bv32)];
    v383$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v351$2, 1302bv32)];
    v384$1 := FADD32(v352$1, v360$1);
    v384$2 := FADD32(v352$2, v360$2);
    v385$1 := FADD32(v353$1, v361$1);
    v385$2 := FADD32(v353$2, v361$2);
    v386$1 := FADD32(v354$1, v362$1);
    v386$2 := FADD32(v354$2, v362$2);
    v387$1 := FADD32(v355$1, v363$1);
    v387$2 := FADD32(v355$2, v363$2);
    v388$1 := FADD32(v356$1, v364$1);
    v388$2 := FADD32(v356$2, v364$2);
    v389$1 := FADD32(v357$1, v365$1);
    v389$2 := FADD32(v357$2, v365$2);
    v390$1 := FADD32(v358$1, v366$1);
    v390$2 := FADD32(v358$2, v366$2);
    v391$1 := FADD32(v359$1, v367$1);
    v391$2 := FADD32(v359$2, v367$2);
    v392$1 := FSUB32(v352$1, v360$1);
    v392$2 := FSUB32(v352$2, v360$2);
    v393$1 := FSUB32(v353$1, v361$1);
    v393$2 := FSUB32(v353$2, v361$2);
    v394$1 := FSUB32(v354$1, v362$1);
    v394$2 := FSUB32(v354$2, v362$2);
    v395$1 := FSUB32(v355$1, v363$1);
    v395$2 := FSUB32(v355$2, v363$2);
    v396$1 := FSUB32(v384$1, v388$1);
    v396$2 := FSUB32(v384$2, v388$2);
    v397$1 := FSUB32(v385$1, v389$1);
    v397$2 := FSUB32(v385$2, v389$2);
    v398$1 := FSUB32(v386$1, v390$1);
    v398$2 := FSUB32(v386$2, v390$2);
    v399$1 := FSUB32(v387$1, v391$1);
    v399$2 := FSUB32(v387$2, v391$2);
    v400$1 := FSUB32(v356$1, v364$1);
    v400$2 := FSUB32(v356$2, v364$2);
    v401$1 := FSUB32(v357$1, v365$1);
    v401$2 := FSUB32(v357$2, v365$2);
    v402$1 := FSUB32(v358$1, v366$1);
    v402$2 := FSUB32(v358$2, v366$2);
    v403$1 := FSUB32(v359$1, v367$1);
    v403$2 := FSUB32(v359$2, v367$2);
    v404$1 := FADD32(v368$1, v376$1);
    v404$2 := FADD32(v368$2, v376$2);
    v405$1 := FADD32(v369$1, v377$1);
    v405$2 := FADD32(v369$2, v377$2);
    v406$1 := FADD32(v370$1, v378$1);
    v406$2 := FADD32(v370$2, v378$2);
    v407$1 := FADD32(v371$1, v379$1);
    v407$2 := FADD32(v371$2, v379$2);
    v408$1 := FADD32(v372$1, v380$1);
    v408$2 := FADD32(v372$2, v380$2);
    v409$1 := FADD32(v373$1, v381$1);
    v409$2 := FADD32(v373$2, v381$2);
    v410$1 := FADD32(v374$1, v382$1);
    v410$2 := FADD32(v374$2, v382$2);
    v411$1 := FADD32(v375$1, v383$1);
    v411$2 := FADD32(v375$2, v383$2);
    v412$1 := FSUB32(v368$1, v376$1);
    v412$2 := FSUB32(v368$2, v376$2);
    v413$1 := FSUB32(v369$1, v377$1);
    v413$2 := FSUB32(v369$2, v377$2);
    v414$1 := FSUB32(v370$1, v378$1);
    v414$2 := FSUB32(v370$2, v378$2);
    v415$1 := FSUB32(v371$1, v379$1);
    v415$2 := FSUB32(v371$2, v379$2);
    v416$1 := FSUB32(v404$1, v408$1);
    v416$2 := FSUB32(v404$2, v408$2);
    v417$1 := FSUB32(v405$1, v409$1);
    v417$2 := FSUB32(v405$2, v409$2);
    v418$1 := FSUB32(v406$1, v410$1);
    v418$2 := FSUB32(v406$2, v410$2);
    v419$1 := FSUB32(v407$1, v411$1);
    v419$2 := FSUB32(v407$2, v411$2);
    v420$1 := FSUB32(v372$1, v380$1);
    v420$2 := FSUB32(v372$2, v380$2);
    v421$1 := FSUB32(v373$1, v381$1);
    v421$2 := FSUB32(v373$2, v381$2);
    v422$1 := FSUB32(v374$1, v382$1);
    v422$2 := FSUB32(v374$2, v382$2);
    v423$1 := FSUB32(v375$1, v383$1);
    v423$2 := FSUB32(v375$2, v383$2);
    v424$1 := FADD32(v392$1, v420$1);
    v424$2 := FADD32(v392$2, v420$2);
    v425$1 := FADD32(v393$1, v421$1);
    v425$2 := FADD32(v393$2, v421$2);
    v426$1 := FADD32(v394$1, v422$1);
    v426$2 := FADD32(v394$2, v422$2);
    v427$1 := FADD32(v395$1, v423$1);
    v427$2 := FADD32(v395$2, v423$2);
    v428$1 := FSUB32(v412$1, v400$1);
    v428$2 := FSUB32(v412$2, v400$2);
    v429$1 := FSUB32(v413$1, v401$1);
    v429$2 := FSUB32(v413$2, v401$2);
    v430$1 := FSUB32(v414$1, v402$1);
    v430$2 := FSUB32(v414$2, v402$2);
    v431$1 := FSUB32(v415$1, v403$1);
    v431$2 := FSUB32(v415$2, v403$2);
    v432$1 := FSUB32(v392$1, v420$1);
    v432$2 := FSUB32(v392$2, v420$2);
    v433$1 := FSUB32(v393$1, v421$1);
    v433$2 := FSUB32(v393$2, v421$2);
    v434$1 := FSUB32(v394$1, v422$1);
    v434$2 := FSUB32(v394$2, v422$2);
    v435$1 := FSUB32(v395$1, v423$1);
    v435$2 := FSUB32(v395$2, v423$2);
    v436$1 := FADD32(v400$1, v412$1);
    v436$2 := FADD32(v400$2, v412$2);
    v437$1 := FADD32(v401$1, v413$1);
    v437$2 := FADD32(v401$2, v413$2);
    v438$1 := FADD32(v402$1, v414$1);
    v438$2 := FADD32(v402$2, v414$2);
    v439$1 := FADD32(v403$1, v415$1);
    v439$2 := FADD32(v403$2, v415$2);
    v440$1 := BV32_SHL(BV32_LSHR(v1$1, 4bv32), 6bv32);
    v440$2 := BV32_SHL(BV32_LSHR(v1$2, 4bv32), 6bv32);
    v441$1 := BV32_SGT(v440$1, 512bv32);
    v441$2 := BV32_SGT(v440$2, 512bv32);
    p12$1 := (if v441$1 then v441$1 else p12$1);
    p12$2 := (if v441$2 then v441$2 else p12$2);
    p13$1 := (if !v441$1 then !v441$1 else p13$1);
    p13$2 := (if !v441$2 then !v441$2 else p13$2);
    $.08$1 := (if p12$1 then BV32_SUB(v440$1, 1024bv32) else $.08$1);
    $.08$2 := (if p12$2 then BV32_SUB(v440$2, 1024bv32) else $.08$2);
    $.08$1 := (if p13$1 then v440$1 else $.08$1);
    $.08$2 := (if p13$2 then v440$2 else $.08$2);
    v442$1 := FMUL32(SI32_TO_FP32($.08$1), 3150516187bv32);
    v442$2 := FMUL32(SI32_TO_FP32($.08$2), 3150516187bv32);
    v443$1 := FCOS32(v442$1);
    v443$2 := FCOS32(v442$2);
    v444$1 := FSIN32(v442$1);
    v444$2 := FSIN32(v442$2);
    v445$1 := BV32_MUL(v440$1, 2bv32);
    v445$2 := BV32_MUL(v440$2, 2bv32);
    v446$1 := BV32_SGT(v445$1, 512bv32);
    v446$2 := BV32_SGT(v445$2, 512bv32);
    p14$1 := (if v446$1 then v446$1 else p14$1);
    p14$2 := (if v446$2 then v446$2 else p14$2);
    p15$1 := (if !v446$1 then !v446$1 else p15$1);
    p15$2 := (if !v446$2 then !v446$2 else p15$2);
    $.06$1 := (if p14$1 then BV32_SUB(v445$1, 1024bv32) else $.06$1);
    $.06$2 := (if p14$2 then BV32_SUB(v445$2, 1024bv32) else $.06$2);
    $.06$1 := (if p15$1 then v445$1 else $.06$1);
    $.06$2 := (if p15$2 then v445$2 else $.06$2);
    v447$1 := FMUL32(SI32_TO_FP32($.06$1), 3150516187bv32);
    v447$2 := FMUL32(SI32_TO_FP32($.06$2), 3150516187bv32);
    v448$1 := FCOS32(v447$1);
    v448$2 := FCOS32(v447$2);
    v449$1 := FSIN32(v447$1);
    v449$2 := FSIN32(v447$2);
    v450$1 := BV32_MUL(v440$1, 3bv32);
    v450$2 := BV32_MUL(v440$2, 3bv32);
    v451$1 := BV32_SGT(v450$1, 512bv32);
    v451$2 := BV32_SGT(v450$2, 512bv32);
    p16$1 := (if v451$1 then v451$1 else p16$1);
    p16$2 := (if v451$2 then v451$2 else p16$2);
    p17$1 := (if !v451$1 then !v451$1 else p17$1);
    p17$2 := (if !v451$2 then !v451$2 else p17$2);
    $.07$1 := (if p16$1 then BV32_SUB(v450$1, 1024bv32) else $.07$1);
    $.07$2 := (if p16$2 then BV32_SUB(v450$2, 1024bv32) else $.07$2);
    $.07$1 := (if p17$1 then v450$1 else $.07$1);
    $.07$2 := (if p17$2 then v450$2 else $.07$2);
    v452$1 := FMUL32(SI32_TO_FP32($.07$1), 3150516187bv32);
    v452$2 := FMUL32(SI32_TO_FP32($.07$2), 3150516187bv32);
    v453$1 := FCOS32(v452$1);
    v453$2 := FCOS32(v452$2);
    v454$1 := FSIN32(v452$1);
    v454$2 := FSIN32(v452$2);
    goto __partitioned_block_$0_6;

  __partitioned_block_$0_6:
    call {:sourceloc_num 248} $bugle_barrier_duplicated_5(1bv1, 0bv1);
    call {:sourceloc} {:sourceloc_num 249} _LOG_WRITE_$$kfft.lds(true, v1$1, FADD32(v384$1, v388$1), $$kfft.lds[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_224"} {:captureState "check_state_224"} {:sourceloc} {:sourceloc_num 249} true;
    call {:check_id "check_state_224"} {:sourceloc} {:sourceloc_num 249} _CHECK_WRITE_$$kfft.lds(true, v1$2, FADD32(v384$2, v388$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][v1$1] := FADD32(v384$1, v388$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := FADD32(v384$2, v388$2);
    call {:sourceloc} {:sourceloc_num 250} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 68bv32), FADD32(v385$1, v389$1), $$kfft.lds[1bv1][BV32_ADD(v1$1, 68bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 68bv32));
    assume {:do_not_predicate} {:check_id "check_state_225"} {:captureState "check_state_225"} {:sourceloc} {:sourceloc_num 250} true;
    call {:check_id "check_state_225"} {:sourceloc} {:sourceloc_num 250} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 68bv32), FADD32(v385$2, v389$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 68bv32)] := FADD32(v385$1, v389$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 68bv32)] := FADD32(v385$2, v389$2);
    call {:sourceloc} {:sourceloc_num 251} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 136bv32), FADD32(v386$1, v390$1), $$kfft.lds[1bv1][BV32_ADD(v1$1, 136bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 136bv32));
    assume {:do_not_predicate} {:check_id "check_state_226"} {:captureState "check_state_226"} {:sourceloc} {:sourceloc_num 251} true;
    call {:check_id "check_state_226"} {:sourceloc} {:sourceloc_num 251} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 136bv32), FADD32(v386$2, v390$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 136bv32)] := FADD32(v386$1, v390$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 136bv32)] := FADD32(v386$2, v390$2);
    call {:sourceloc} {:sourceloc_num 252} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 204bv32), FADD32(v387$1, v391$1), $$kfft.lds[1bv1][BV32_ADD(v1$1, 204bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 204bv32));
    assume {:do_not_predicate} {:check_id "check_state_227"} {:captureState "check_state_227"} {:sourceloc} {:sourceloc_num 252} true;
    call {:check_id "check_state_227"} {:sourceloc} {:sourceloc_num 252} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 204bv32), FADD32(v387$2, v391$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 204bv32)] := FADD32(v387$1, v391$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 204bv32)] := FADD32(v387$2, v391$2);
    call {:sourceloc} {:sourceloc_num 253} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 272bv32), FADD32(FMUL32(v443$1, v424$1), FSUB32(2147483648bv32, FMUL32(v444$1, v428$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 272bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 272bv32));
    assume {:do_not_predicate} {:check_id "check_state_228"} {:captureState "check_state_228"} {:sourceloc} {:sourceloc_num 253} true;
    call {:check_id "check_state_228"} {:sourceloc} {:sourceloc_num 253} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 272bv32), FADD32(FMUL32(v443$2, v424$2), FSUB32(2147483648bv32, FMUL32(v444$2, v428$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 272bv32)] := FADD32(FMUL32(v443$1, v424$1), FSUB32(2147483648bv32, FMUL32(v444$1, v428$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 272bv32)] := FADD32(FMUL32(v443$2, v424$2), FSUB32(2147483648bv32, FMUL32(v444$2, v428$2)));
    call {:sourceloc} {:sourceloc_num 254} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 340bv32), FADD32(FMUL32(v443$1, v425$1), FSUB32(2147483648bv32, FMUL32(v444$1, v429$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 340bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 340bv32));
    assume {:do_not_predicate} {:check_id "check_state_229"} {:captureState "check_state_229"} {:sourceloc} {:sourceloc_num 254} true;
    call {:check_id "check_state_229"} {:sourceloc} {:sourceloc_num 254} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 340bv32), FADD32(FMUL32(v443$2, v425$2), FSUB32(2147483648bv32, FMUL32(v444$2, v429$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 340bv32)] := FADD32(FMUL32(v443$1, v425$1), FSUB32(2147483648bv32, FMUL32(v444$1, v429$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 340bv32)] := FADD32(FMUL32(v443$2, v425$2), FSUB32(2147483648bv32, FMUL32(v444$2, v429$2)));
    call {:sourceloc} {:sourceloc_num 255} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 408bv32), FADD32(FMUL32(v443$1, v426$1), FSUB32(2147483648bv32, FMUL32(v444$1, v430$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 408bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 408bv32));
    assume {:do_not_predicate} {:check_id "check_state_230"} {:captureState "check_state_230"} {:sourceloc} {:sourceloc_num 255} true;
    call {:check_id "check_state_230"} {:sourceloc} {:sourceloc_num 255} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 408bv32), FADD32(FMUL32(v443$2, v426$2), FSUB32(2147483648bv32, FMUL32(v444$2, v430$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 408bv32)] := FADD32(FMUL32(v443$1, v426$1), FSUB32(2147483648bv32, FMUL32(v444$1, v430$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 408bv32)] := FADD32(FMUL32(v443$2, v426$2), FSUB32(2147483648bv32, FMUL32(v444$2, v430$2)));
    call {:sourceloc} {:sourceloc_num 256} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 476bv32), FADD32(FMUL32(v443$1, v427$1), FSUB32(2147483648bv32, FMUL32(v444$1, v431$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 476bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 476bv32));
    assume {:do_not_predicate} {:check_id "check_state_231"} {:captureState "check_state_231"} {:sourceloc} {:sourceloc_num 256} true;
    call {:check_id "check_state_231"} {:sourceloc} {:sourceloc_num 256} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 476bv32), FADD32(FMUL32(v443$2, v427$2), FSUB32(2147483648bv32, FMUL32(v444$2, v431$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 476bv32)] := FADD32(FMUL32(v443$1, v427$1), FSUB32(2147483648bv32, FMUL32(v444$1, v431$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 476bv32)] := FADD32(FMUL32(v443$2, v427$2), FSUB32(2147483648bv32, FMUL32(v444$2, v431$2)));
    call {:sourceloc} {:sourceloc_num 257} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 544bv32), FADD32(FMUL32(v448$1, v396$1), FSUB32(2147483648bv32, FMUL32(v449$1, v416$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 544bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 544bv32));
    assume {:do_not_predicate} {:check_id "check_state_232"} {:captureState "check_state_232"} {:sourceloc} {:sourceloc_num 257} true;
    call {:check_id "check_state_232"} {:sourceloc} {:sourceloc_num 257} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 544bv32), FADD32(FMUL32(v448$2, v396$2), FSUB32(2147483648bv32, FMUL32(v449$2, v416$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 544bv32)] := FADD32(FMUL32(v448$1, v396$1), FSUB32(2147483648bv32, FMUL32(v449$1, v416$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 544bv32)] := FADD32(FMUL32(v448$2, v396$2), FSUB32(2147483648bv32, FMUL32(v449$2, v416$2)));
    call {:sourceloc} {:sourceloc_num 258} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 612bv32), FADD32(FMUL32(v448$1, v397$1), FSUB32(2147483648bv32, FMUL32(v449$1, v417$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 612bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 612bv32));
    assume {:do_not_predicate} {:check_id "check_state_233"} {:captureState "check_state_233"} {:sourceloc} {:sourceloc_num 258} true;
    call {:check_id "check_state_233"} {:sourceloc} {:sourceloc_num 258} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 612bv32), FADD32(FMUL32(v448$2, v397$2), FSUB32(2147483648bv32, FMUL32(v449$2, v417$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 612bv32)] := FADD32(FMUL32(v448$1, v397$1), FSUB32(2147483648bv32, FMUL32(v449$1, v417$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 612bv32)] := FADD32(FMUL32(v448$2, v397$2), FSUB32(2147483648bv32, FMUL32(v449$2, v417$2)));
    call {:sourceloc} {:sourceloc_num 259} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 680bv32), FADD32(FMUL32(v448$1, v398$1), FSUB32(2147483648bv32, FMUL32(v449$1, v418$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 680bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 680bv32));
    assume {:do_not_predicate} {:check_id "check_state_234"} {:captureState "check_state_234"} {:sourceloc} {:sourceloc_num 259} true;
    call {:check_id "check_state_234"} {:sourceloc} {:sourceloc_num 259} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 680bv32), FADD32(FMUL32(v448$2, v398$2), FSUB32(2147483648bv32, FMUL32(v449$2, v418$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 680bv32)] := FADD32(FMUL32(v448$1, v398$1), FSUB32(2147483648bv32, FMUL32(v449$1, v418$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 680bv32)] := FADD32(FMUL32(v448$2, v398$2), FSUB32(2147483648bv32, FMUL32(v449$2, v418$2)));
    call {:sourceloc} {:sourceloc_num 260} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 748bv32), FADD32(FMUL32(v448$1, v399$1), FSUB32(2147483648bv32, FMUL32(v449$1, v419$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 748bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 748bv32));
    assume {:do_not_predicate} {:check_id "check_state_235"} {:captureState "check_state_235"} {:sourceloc} {:sourceloc_num 260} true;
    call {:check_id "check_state_235"} {:sourceloc} {:sourceloc_num 260} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 748bv32), FADD32(FMUL32(v448$2, v399$2), FSUB32(2147483648bv32, FMUL32(v449$2, v419$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 748bv32)] := FADD32(FMUL32(v448$1, v399$1), FSUB32(2147483648bv32, FMUL32(v449$1, v419$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 748bv32)] := FADD32(FMUL32(v448$2, v399$2), FSUB32(2147483648bv32, FMUL32(v449$2, v419$2)));
    call {:sourceloc} {:sourceloc_num 261} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 816bv32), FADD32(FMUL32(v453$1, v432$1), FSUB32(2147483648bv32, FMUL32(v454$1, v436$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 816bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 816bv32));
    assume {:do_not_predicate} {:check_id "check_state_236"} {:captureState "check_state_236"} {:sourceloc} {:sourceloc_num 261} true;
    call {:check_id "check_state_236"} {:sourceloc} {:sourceloc_num 261} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 816bv32), FADD32(FMUL32(v453$2, v432$2), FSUB32(2147483648bv32, FMUL32(v454$2, v436$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 816bv32)] := FADD32(FMUL32(v453$1, v432$1), FSUB32(2147483648bv32, FMUL32(v454$1, v436$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 816bv32)] := FADD32(FMUL32(v453$2, v432$2), FSUB32(2147483648bv32, FMUL32(v454$2, v436$2)));
    call {:sourceloc} {:sourceloc_num 262} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 884bv32), FADD32(FMUL32(v453$1, v433$1), FSUB32(2147483648bv32, FMUL32(v454$1, v437$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 884bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 884bv32));
    assume {:do_not_predicate} {:check_id "check_state_237"} {:captureState "check_state_237"} {:sourceloc} {:sourceloc_num 262} true;
    call {:check_id "check_state_237"} {:sourceloc} {:sourceloc_num 262} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 884bv32), FADD32(FMUL32(v453$2, v433$2), FSUB32(2147483648bv32, FMUL32(v454$2, v437$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 884bv32)] := FADD32(FMUL32(v453$1, v433$1), FSUB32(2147483648bv32, FMUL32(v454$1, v437$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 884bv32)] := FADD32(FMUL32(v453$2, v433$2), FSUB32(2147483648bv32, FMUL32(v454$2, v437$2)));
    call {:sourceloc} {:sourceloc_num 263} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 952bv32), FADD32(FMUL32(v453$1, v434$1), FSUB32(2147483648bv32, FMUL32(v454$1, v438$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 952bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 952bv32));
    assume {:do_not_predicate} {:check_id "check_state_238"} {:captureState "check_state_238"} {:sourceloc} {:sourceloc_num 263} true;
    call {:check_id "check_state_238"} {:sourceloc} {:sourceloc_num 263} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 952bv32), FADD32(FMUL32(v453$2, v434$2), FSUB32(2147483648bv32, FMUL32(v454$2, v438$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 952bv32)] := FADD32(FMUL32(v453$1, v434$1), FSUB32(2147483648bv32, FMUL32(v454$1, v438$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 952bv32)] := FADD32(FMUL32(v453$2, v434$2), FSUB32(2147483648bv32, FMUL32(v454$2, v438$2)));
    call {:sourceloc} {:sourceloc_num 264} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1020bv32), FADD32(FMUL32(v453$1, v435$1), FSUB32(2147483648bv32, FMUL32(v454$1, v439$1))), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1020bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1020bv32));
    assume {:do_not_predicate} {:check_id "check_state_239"} {:captureState "check_state_239"} {:sourceloc} {:sourceloc_num 264} true;
    call {:check_id "check_state_239"} {:sourceloc} {:sourceloc_num 264} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1020bv32), FADD32(FMUL32(v453$2, v435$2), FSUB32(2147483648bv32, FMUL32(v454$2, v439$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1020bv32)] := FADD32(FMUL32(v453$1, v435$1), FSUB32(2147483648bv32, FMUL32(v454$1, v439$1)));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1020bv32)] := FADD32(FMUL32(v453$2, v435$2), FSUB32(2147483648bv32, FMUL32(v454$2, v439$2)));
    call {:sourceloc} {:sourceloc_num 265} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1088bv32), FADD32(v404$1, v408$1), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1088bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1088bv32));
    assume {:do_not_predicate} {:check_id "check_state_240"} {:captureState "check_state_240"} {:sourceloc} {:sourceloc_num 265} true;
    call {:check_id "check_state_240"} {:sourceloc} {:sourceloc_num 265} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1088bv32), FADD32(v404$2, v408$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1088bv32)] := FADD32(v404$1, v408$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1088bv32)] := FADD32(v404$2, v408$2);
    call {:sourceloc} {:sourceloc_num 266} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1156bv32), FADD32(v405$1, v409$1), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1156bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1156bv32));
    assume {:do_not_predicate} {:check_id "check_state_241"} {:captureState "check_state_241"} {:sourceloc} {:sourceloc_num 266} true;
    call {:check_id "check_state_241"} {:sourceloc} {:sourceloc_num 266} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1156bv32), FADD32(v405$2, v409$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1156bv32)] := FADD32(v405$1, v409$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1156bv32)] := FADD32(v405$2, v409$2);
    call {:sourceloc} {:sourceloc_num 267} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1224bv32), FADD32(v406$1, v410$1), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1224bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1224bv32));
    assume {:do_not_predicate} {:check_id "check_state_242"} {:captureState "check_state_242"} {:sourceloc} {:sourceloc_num 267} true;
    call {:check_id "check_state_242"} {:sourceloc} {:sourceloc_num 267} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1224bv32), FADD32(v406$2, v410$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1224bv32)] := FADD32(v406$1, v410$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1224bv32)] := FADD32(v406$2, v410$2);
    call {:sourceloc} {:sourceloc_num 268} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1292bv32), FADD32(v407$1, v411$1), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1292bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1292bv32));
    assume {:do_not_predicate} {:check_id "check_state_243"} {:captureState "check_state_243"} {:sourceloc} {:sourceloc_num 268} true;
    call {:check_id "check_state_243"} {:sourceloc} {:sourceloc_num 268} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1292bv32), FADD32(v407$2, v411$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1292bv32)] := FADD32(v407$1, v411$1);
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1292bv32)] := FADD32(v407$2, v411$2);
    call {:sourceloc} {:sourceloc_num 269} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1360bv32), FADD32(FMUL32(v443$1, v428$1), FMUL32(v444$1, v424$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1360bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1360bv32));
    assume {:do_not_predicate} {:check_id "check_state_244"} {:captureState "check_state_244"} {:sourceloc} {:sourceloc_num 269} true;
    call {:check_id "check_state_244"} {:sourceloc} {:sourceloc_num 269} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1360bv32), FADD32(FMUL32(v443$2, v428$2), FMUL32(v444$2, v424$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1360bv32)] := FADD32(FMUL32(v443$1, v428$1), FMUL32(v444$1, v424$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1360bv32)] := FADD32(FMUL32(v443$2, v428$2), FMUL32(v444$2, v424$2));
    call {:sourceloc} {:sourceloc_num 270} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1428bv32), FADD32(FMUL32(v443$1, v429$1), FMUL32(v444$1, v425$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1428bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1428bv32));
    assume {:do_not_predicate} {:check_id "check_state_245"} {:captureState "check_state_245"} {:sourceloc} {:sourceloc_num 270} true;
    call {:check_id "check_state_245"} {:sourceloc} {:sourceloc_num 270} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1428bv32), FADD32(FMUL32(v443$2, v429$2), FMUL32(v444$2, v425$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1428bv32)] := FADD32(FMUL32(v443$1, v429$1), FMUL32(v444$1, v425$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1428bv32)] := FADD32(FMUL32(v443$2, v429$2), FMUL32(v444$2, v425$2));
    call {:sourceloc} {:sourceloc_num 271} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1496bv32), FADD32(FMUL32(v443$1, v430$1), FMUL32(v444$1, v426$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1496bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1496bv32));
    assume {:do_not_predicate} {:check_id "check_state_246"} {:captureState "check_state_246"} {:sourceloc} {:sourceloc_num 271} true;
    call {:check_id "check_state_246"} {:sourceloc} {:sourceloc_num 271} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1496bv32), FADD32(FMUL32(v443$2, v430$2), FMUL32(v444$2, v426$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1496bv32)] := FADD32(FMUL32(v443$1, v430$1), FMUL32(v444$1, v426$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1496bv32)] := FADD32(FMUL32(v443$2, v430$2), FMUL32(v444$2, v426$2));
    call {:sourceloc} {:sourceloc_num 272} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1564bv32), FADD32(FMUL32(v443$1, v431$1), FMUL32(v444$1, v427$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1564bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1564bv32));
    assume {:do_not_predicate} {:check_id "check_state_247"} {:captureState "check_state_247"} {:sourceloc} {:sourceloc_num 272} true;
    call {:check_id "check_state_247"} {:sourceloc} {:sourceloc_num 272} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1564bv32), FADD32(FMUL32(v443$2, v431$2), FMUL32(v444$2, v427$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1564bv32)] := FADD32(FMUL32(v443$1, v431$1), FMUL32(v444$1, v427$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1564bv32)] := FADD32(FMUL32(v443$2, v431$2), FMUL32(v444$2, v427$2));
    call {:sourceloc} {:sourceloc_num 273} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1632bv32), FADD32(FMUL32(v448$1, v416$1), FMUL32(v449$1, v396$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1632bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1632bv32));
    assume {:do_not_predicate} {:check_id "check_state_248"} {:captureState "check_state_248"} {:sourceloc} {:sourceloc_num 273} true;
    call {:check_id "check_state_248"} {:sourceloc} {:sourceloc_num 273} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1632bv32), FADD32(FMUL32(v448$2, v416$2), FMUL32(v449$2, v396$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1632bv32)] := FADD32(FMUL32(v448$1, v416$1), FMUL32(v449$1, v396$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1632bv32)] := FADD32(FMUL32(v448$2, v416$2), FMUL32(v449$2, v396$2));
    call {:sourceloc} {:sourceloc_num 274} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1700bv32), FADD32(FMUL32(v448$1, v417$1), FMUL32(v449$1, v397$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1700bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1700bv32));
    assume {:do_not_predicate} {:check_id "check_state_249"} {:captureState "check_state_249"} {:sourceloc} {:sourceloc_num 274} true;
    call {:check_id "check_state_249"} {:sourceloc} {:sourceloc_num 274} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1700bv32), FADD32(FMUL32(v448$2, v417$2), FMUL32(v449$2, v397$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1700bv32)] := FADD32(FMUL32(v448$1, v417$1), FMUL32(v449$1, v397$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1700bv32)] := FADD32(FMUL32(v448$2, v417$2), FMUL32(v449$2, v397$2));
    call {:sourceloc} {:sourceloc_num 275} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1768bv32), FADD32(FMUL32(v448$1, v418$1), FMUL32(v449$1, v398$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1768bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1768bv32));
    assume {:do_not_predicate} {:check_id "check_state_250"} {:captureState "check_state_250"} {:sourceloc} {:sourceloc_num 275} true;
    call {:check_id "check_state_250"} {:sourceloc} {:sourceloc_num 275} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1768bv32), FADD32(FMUL32(v448$2, v418$2), FMUL32(v449$2, v398$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1768bv32)] := FADD32(FMUL32(v448$1, v418$1), FMUL32(v449$1, v398$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1768bv32)] := FADD32(FMUL32(v448$2, v418$2), FMUL32(v449$2, v398$2));
    call {:sourceloc} {:sourceloc_num 276} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1836bv32), FADD32(FMUL32(v448$1, v419$1), FMUL32(v449$1, v399$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1836bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1836bv32));
    assume {:do_not_predicate} {:check_id "check_state_251"} {:captureState "check_state_251"} {:sourceloc} {:sourceloc_num 276} true;
    call {:check_id "check_state_251"} {:sourceloc} {:sourceloc_num 276} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1836bv32), FADD32(FMUL32(v448$2, v419$2), FMUL32(v449$2, v399$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1836bv32)] := FADD32(FMUL32(v448$1, v419$1), FMUL32(v449$1, v399$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1836bv32)] := FADD32(FMUL32(v448$2, v419$2), FMUL32(v449$2, v399$2));
    call {:sourceloc} {:sourceloc_num 277} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1904bv32), FADD32(FMUL32(v453$1, v436$1), FMUL32(v454$1, v432$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1904bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1904bv32));
    assume {:do_not_predicate} {:check_id "check_state_252"} {:captureState "check_state_252"} {:sourceloc} {:sourceloc_num 277} true;
    call {:check_id "check_state_252"} {:sourceloc} {:sourceloc_num 277} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1904bv32), FADD32(FMUL32(v453$2, v436$2), FMUL32(v454$2, v432$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1904bv32)] := FADD32(FMUL32(v453$1, v436$1), FMUL32(v454$1, v432$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1904bv32)] := FADD32(FMUL32(v453$2, v436$2), FMUL32(v454$2, v432$2));
    call {:sourceloc} {:sourceloc_num 278} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 1972bv32), FADD32(FMUL32(v453$1, v437$1), FMUL32(v454$1, v433$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 1972bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 1972bv32));
    assume {:do_not_predicate} {:check_id "check_state_253"} {:captureState "check_state_253"} {:sourceloc} {:sourceloc_num 278} true;
    call {:check_id "check_state_253"} {:sourceloc} {:sourceloc_num 278} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 1972bv32), FADD32(FMUL32(v453$2, v437$2), FMUL32(v454$2, v433$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 1972bv32)] := FADD32(FMUL32(v453$1, v437$1), FMUL32(v454$1, v433$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1972bv32)] := FADD32(FMUL32(v453$2, v437$2), FMUL32(v454$2, v433$2));
    call {:sourceloc} {:sourceloc_num 279} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 2040bv32), FADD32(FMUL32(v453$1, v438$1), FMUL32(v454$1, v434$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 2040bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 2040bv32));
    assume {:do_not_predicate} {:check_id "check_state_254"} {:captureState "check_state_254"} {:sourceloc} {:sourceloc_num 279} true;
    call {:check_id "check_state_254"} {:sourceloc} {:sourceloc_num 279} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 2040bv32), FADD32(FMUL32(v453$2, v438$2), FMUL32(v454$2, v434$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 2040bv32)] := FADD32(FMUL32(v453$1, v438$1), FMUL32(v454$1, v434$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 2040bv32)] := FADD32(FMUL32(v453$2, v438$2), FMUL32(v454$2, v434$2));
    call {:sourceloc} {:sourceloc_num 280} _LOG_WRITE_$$kfft.lds(true, BV32_ADD(v1$1, 2108bv32), FADD32(FMUL32(v453$1, v439$1), FMUL32(v454$1, v435$1)), $$kfft.lds[1bv1][BV32_ADD(v1$1, 2108bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(true, BV32_ADD(v1$2, 2108bv32));
    assume {:do_not_predicate} {:check_id "check_state_255"} {:captureState "check_state_255"} {:sourceloc} {:sourceloc_num 280} true;
    call {:check_id "check_state_255"} {:sourceloc} {:sourceloc_num 280} _CHECK_WRITE_$$kfft.lds(true, BV32_ADD(v1$2, 2108bv32), FADD32(FMUL32(v453$2, v439$2), FMUL32(v454$2, v435$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kfft.lds"} true;
    $$kfft.lds[1bv1][BV32_ADD(v1$1, 2108bv32)] := FADD32(FMUL32(v453$1, v439$1), FMUL32(v454$1, v435$1));
    $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 2108bv32)] := FADD32(FMUL32(v453$2, v439$2), FMUL32(v454$2, v435$2));
    goto __partitioned_block_$0_7;

  __partitioned_block_$0_7:
    call {:sourceloc_num 281} $bugle_barrier_duplicated_6(1bv1, 0bv1);
    v455$1 := BV32_ADD(BV32_AND(v1$1, 15bv32), BV32_MUL(BV32_LSHR(v1$1, 4bv32), 272bv32));
    v455$2 := BV32_ADD(BV32_AND(v1$2, 15bv32), BV32_MUL(BV32_LSHR(v1$2, 4bv32), 272bv32));
    call {:sourceloc} {:sourceloc_num 282} _LOG_READ_$$kfft.lds(true, v455$1, $$kfft.lds[1bv1][v455$1]);
    assume {:do_not_predicate} {:check_id "check_state_256"} {:captureState "check_state_256"} {:sourceloc} {:sourceloc_num 282} true;
    call {:check_id "check_state_256"} {:sourceloc} {:sourceloc_num 282} _CHECK_READ_$$kfft.lds(true, v455$2, $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v455$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v456$1 := $$kfft.lds[1bv1][v455$1];
    v456$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v455$2];
    call {:sourceloc} {:sourceloc_num 283} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 68bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 68bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_257"} {:captureState "check_state_257"} {:sourceloc} {:sourceloc_num 283} true;
    call {:check_id "check_state_257"} {:sourceloc} {:sourceloc_num 283} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 68bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 68bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v457$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 68bv32)];
    v457$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 68bv32)];
    call {:sourceloc} {:sourceloc_num 284} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 136bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 136bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_258"} {:captureState "check_state_258"} {:sourceloc} {:sourceloc_num 284} true;
    call {:check_id "check_state_258"} {:sourceloc} {:sourceloc_num 284} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 136bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 136bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v458$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 136bv32)];
    v458$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 136bv32)];
    call {:sourceloc} {:sourceloc_num 285} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 204bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 204bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_259"} {:captureState "check_state_259"} {:sourceloc} {:sourceloc_num 285} true;
    call {:check_id "check_state_259"} {:sourceloc} {:sourceloc_num 285} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 204bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 204bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v459$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 204bv32)];
    v459$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 204bv32)];
    call {:sourceloc} {:sourceloc_num 286} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 16bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 16bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_260"} {:captureState "check_state_260"} {:sourceloc} {:sourceloc_num 286} true;
    call {:check_id "check_state_260"} {:sourceloc} {:sourceloc_num 286} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 16bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 16bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v460$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 16bv32)];
    v460$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 16bv32)];
    call {:sourceloc} {:sourceloc_num 287} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 84bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 84bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_261"} {:captureState "check_state_261"} {:sourceloc} {:sourceloc_num 287} true;
    call {:check_id "check_state_261"} {:sourceloc} {:sourceloc_num 287} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 84bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 84bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v461$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 84bv32)];
    v461$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 84bv32)];
    call {:sourceloc} {:sourceloc_num 288} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 152bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 152bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_262"} {:captureState "check_state_262"} {:sourceloc} {:sourceloc_num 288} true;
    call {:check_id "check_state_262"} {:sourceloc} {:sourceloc_num 288} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 152bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 152bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v462$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 152bv32)];
    v462$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 152bv32)];
    call {:sourceloc} {:sourceloc_num 289} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 220bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 220bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_263"} {:captureState "check_state_263"} {:sourceloc} {:sourceloc_num 289} true;
    call {:check_id "check_state_263"} {:sourceloc} {:sourceloc_num 289} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 220bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 220bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v463$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 220bv32)];
    v463$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 220bv32)];
    call {:sourceloc} {:sourceloc_num 290} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 32bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 32bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_264"} {:captureState "check_state_264"} {:sourceloc} {:sourceloc_num 290} true;
    call {:check_id "check_state_264"} {:sourceloc} {:sourceloc_num 290} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 32bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 32bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v464$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 32bv32)];
    v464$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 32bv32)];
    call {:sourceloc} {:sourceloc_num 291} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 100bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 100bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_265"} {:captureState "check_state_265"} {:sourceloc} {:sourceloc_num 291} true;
    call {:check_id "check_state_265"} {:sourceloc} {:sourceloc_num 291} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 100bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 100bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v465$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 100bv32)];
    v465$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 100bv32)];
    call {:sourceloc} {:sourceloc_num 292} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 168bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 168bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_266"} {:captureState "check_state_266"} {:sourceloc} {:sourceloc_num 292} true;
    call {:check_id "check_state_266"} {:sourceloc} {:sourceloc_num 292} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 168bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 168bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v466$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 168bv32)];
    v466$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 168bv32)];
    call {:sourceloc} {:sourceloc_num 293} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 236bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 236bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_267"} {:captureState "check_state_267"} {:sourceloc} {:sourceloc_num 293} true;
    call {:check_id "check_state_267"} {:sourceloc} {:sourceloc_num 293} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 236bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 236bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v467$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 236bv32)];
    v467$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 236bv32)];
    call {:sourceloc} {:sourceloc_num 294} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 48bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 48bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_268"} {:captureState "check_state_268"} {:sourceloc} {:sourceloc_num 294} true;
    call {:check_id "check_state_268"} {:sourceloc} {:sourceloc_num 294} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 48bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 48bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v468$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 48bv32)];
    v468$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 48bv32)];
    call {:sourceloc} {:sourceloc_num 295} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 116bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 116bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_269"} {:captureState "check_state_269"} {:sourceloc} {:sourceloc_num 295} true;
    call {:check_id "check_state_269"} {:sourceloc} {:sourceloc_num 295} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 116bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 116bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v469$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 116bv32)];
    v469$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 116bv32)];
    call {:sourceloc} {:sourceloc_num 296} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 184bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 184bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_270"} {:captureState "check_state_270"} {:sourceloc} {:sourceloc_num 296} true;
    call {:check_id "check_state_270"} {:sourceloc} {:sourceloc_num 296} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 184bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 184bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v470$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 184bv32)];
    v470$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 184bv32)];
    call {:sourceloc} {:sourceloc_num 297} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 252bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 252bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_271"} {:captureState "check_state_271"} {:sourceloc} {:sourceloc_num 297} true;
    call {:check_id "check_state_271"} {:sourceloc} {:sourceloc_num 297} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 252bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 252bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v471$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 252bv32)];
    v471$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 252bv32)];
    call {:sourceloc} {:sourceloc_num 298} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1088bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1088bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_272"} {:captureState "check_state_272"} {:sourceloc} {:sourceloc_num 298} true;
    call {:check_id "check_state_272"} {:sourceloc} {:sourceloc_num 298} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1088bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1088bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v472$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1088bv32)];
    v472$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1088bv32)];
    call {:sourceloc} {:sourceloc_num 299} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1156bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1156bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_273"} {:captureState "check_state_273"} {:sourceloc} {:sourceloc_num 299} true;
    call {:check_id "check_state_273"} {:sourceloc} {:sourceloc_num 299} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1156bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1156bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v473$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1156bv32)];
    v473$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1156bv32)];
    call {:sourceloc} {:sourceloc_num 300} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1224bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1224bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_274"} {:captureState "check_state_274"} {:sourceloc} {:sourceloc_num 300} true;
    call {:check_id "check_state_274"} {:sourceloc} {:sourceloc_num 300} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1224bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1224bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v474$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1224bv32)];
    v474$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1224bv32)];
    call {:sourceloc} {:sourceloc_num 301} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1292bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1292bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_275"} {:captureState "check_state_275"} {:sourceloc} {:sourceloc_num 301} true;
    call {:check_id "check_state_275"} {:sourceloc} {:sourceloc_num 301} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1292bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1292bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v475$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1292bv32)];
    v475$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1292bv32)];
    call {:sourceloc} {:sourceloc_num 302} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1104bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1104bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_276"} {:captureState "check_state_276"} {:sourceloc} {:sourceloc_num 302} true;
    call {:check_id "check_state_276"} {:sourceloc} {:sourceloc_num 302} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1104bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1104bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v476$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1104bv32)];
    v476$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1104bv32)];
    call {:sourceloc} {:sourceloc_num 303} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1172bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1172bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_277"} {:captureState "check_state_277"} {:sourceloc} {:sourceloc_num 303} true;
    call {:check_id "check_state_277"} {:sourceloc} {:sourceloc_num 303} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1172bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1172bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v477$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1172bv32)];
    v477$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1172bv32)];
    call {:sourceloc} {:sourceloc_num 304} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1240bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1240bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_278"} {:captureState "check_state_278"} {:sourceloc} {:sourceloc_num 304} true;
    call {:check_id "check_state_278"} {:sourceloc} {:sourceloc_num 304} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1240bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1240bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v478$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1240bv32)];
    v478$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1240bv32)];
    call {:sourceloc} {:sourceloc_num 305} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1308bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1308bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_279"} {:captureState "check_state_279"} {:sourceloc} {:sourceloc_num 305} true;
    call {:check_id "check_state_279"} {:sourceloc} {:sourceloc_num 305} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1308bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1308bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v479$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1308bv32)];
    v479$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1308bv32)];
    call {:sourceloc} {:sourceloc_num 306} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1120bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1120bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_280"} {:captureState "check_state_280"} {:sourceloc} {:sourceloc_num 306} true;
    call {:check_id "check_state_280"} {:sourceloc} {:sourceloc_num 306} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1120bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1120bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v480$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1120bv32)];
    v480$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1120bv32)];
    call {:sourceloc} {:sourceloc_num 307} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1188bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1188bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_281"} {:captureState "check_state_281"} {:sourceloc} {:sourceloc_num 307} true;
    call {:check_id "check_state_281"} {:sourceloc} {:sourceloc_num 307} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1188bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1188bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v481$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1188bv32)];
    v481$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1188bv32)];
    call {:sourceloc} {:sourceloc_num 308} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1256bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1256bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_282"} {:captureState "check_state_282"} {:sourceloc} {:sourceloc_num 308} true;
    call {:check_id "check_state_282"} {:sourceloc} {:sourceloc_num 308} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1256bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1256bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v482$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1256bv32)];
    v482$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1256bv32)];
    call {:sourceloc} {:sourceloc_num 309} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1324bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1324bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_283"} {:captureState "check_state_283"} {:sourceloc} {:sourceloc_num 309} true;
    call {:check_id "check_state_283"} {:sourceloc} {:sourceloc_num 309} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1324bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1324bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v483$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1324bv32)];
    v483$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1324bv32)];
    call {:sourceloc} {:sourceloc_num 310} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1136bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1136bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_284"} {:captureState "check_state_284"} {:sourceloc} {:sourceloc_num 310} true;
    call {:check_id "check_state_284"} {:sourceloc} {:sourceloc_num 310} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1136bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1136bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v484$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1136bv32)];
    v484$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1136bv32)];
    call {:sourceloc} {:sourceloc_num 311} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1204bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1204bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_285"} {:captureState "check_state_285"} {:sourceloc} {:sourceloc_num 311} true;
    call {:check_id "check_state_285"} {:sourceloc} {:sourceloc_num 311} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1204bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1204bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v485$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1204bv32)];
    v485$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1204bv32)];
    call {:sourceloc} {:sourceloc_num 312} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1272bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1272bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_286"} {:captureState "check_state_286"} {:sourceloc} {:sourceloc_num 312} true;
    call {:check_id "check_state_286"} {:sourceloc} {:sourceloc_num 312} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1272bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1272bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v486$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1272bv32)];
    v486$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1272bv32)];
    call {:sourceloc} {:sourceloc_num 313} _LOG_READ_$$kfft.lds(true, BV32_ADD(v455$1, 1340bv32), $$kfft.lds[1bv1][BV32_ADD(v455$1, 1340bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_287"} {:captureState "check_state_287"} {:sourceloc} {:sourceloc_num 313} true;
    call {:check_id "check_state_287"} {:sourceloc} {:sourceloc_num 313} _CHECK_READ_$$kfft.lds(true, BV32_ADD(v455$2, 1340bv32), $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1340bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kfft.lds"} true;
    v487$1 := $$kfft.lds[1bv1][BV32_ADD(v455$1, 1340bv32)];
    v487$2 := $$kfft.lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v455$2, 1340bv32)];
    v488$1 := FADD32(v456$1, v464$1);
    v488$2 := FADD32(v456$2, v464$2);
    v489$1 := FADD32(v457$1, v465$1);
    v489$2 := FADD32(v457$2, v465$2);
    v490$1 := FADD32(v458$1, v466$1);
    v490$2 := FADD32(v458$2, v466$2);
    v491$1 := FADD32(v459$1, v467$1);
    v491$2 := FADD32(v459$2, v467$2);
    v492$1 := FADD32(v460$1, v468$1);
    v492$2 := FADD32(v460$2, v468$2);
    v493$1 := FADD32(v461$1, v469$1);
    v493$2 := FADD32(v461$2, v469$2);
    v494$1 := FADD32(v462$1, v470$1);
    v494$2 := FADD32(v462$2, v470$2);
    v495$1 := FADD32(v463$1, v471$1);
    v495$2 := FADD32(v463$2, v471$2);
    v496$1 := FSUB32(v456$1, v464$1);
    v496$2 := FSUB32(v456$2, v464$2);
    v497$1 := FSUB32(v457$1, v465$1);
    v497$2 := FSUB32(v457$2, v465$2);
    v498$1 := FSUB32(v458$1, v466$1);
    v498$2 := FSUB32(v458$2, v466$2);
    v499$1 := FSUB32(v459$1, v467$1);
    v499$2 := FSUB32(v459$2, v467$2);
    v500$1 := FSUB32(v460$1, v468$1);
    v500$2 := FSUB32(v460$2, v468$2);
    v501$1 := FSUB32(v461$1, v469$1);
    v501$2 := FSUB32(v461$2, v469$2);
    v502$1 := FSUB32(v462$1, v470$1);
    v502$2 := FSUB32(v462$2, v470$2);
    v503$1 := FSUB32(v463$1, v471$1);
    v503$2 := FSUB32(v463$2, v471$2);
    v504$1 := FADD32(v472$1, v480$1);
    v504$2 := FADD32(v472$2, v480$2);
    v505$1 := FADD32(v473$1, v481$1);
    v505$2 := FADD32(v473$2, v481$2);
    v506$1 := FADD32(v474$1, v482$1);
    v506$2 := FADD32(v474$2, v482$2);
    v507$1 := FADD32(v475$1, v483$1);
    v507$2 := FADD32(v475$2, v483$2);
    v508$1 := FADD32(v476$1, v484$1);
    v508$2 := FADD32(v476$2, v484$2);
    v509$1 := FADD32(v477$1, v485$1);
    v509$2 := FADD32(v477$2, v485$2);
    v510$1 := FADD32(v478$1, v486$1);
    v510$2 := FADD32(v478$2, v486$2);
    v511$1 := FADD32(v479$1, v487$1);
    v511$2 := FADD32(v479$2, v487$2);
    v512$1 := FSUB32(v472$1, v480$1);
    v512$2 := FSUB32(v472$2, v480$2);
    v513$1 := FSUB32(v473$1, v481$1);
    v513$2 := FSUB32(v473$2, v481$2);
    v514$1 := FSUB32(v474$1, v482$1);
    v514$2 := FSUB32(v474$2, v482$2);
    v515$1 := FSUB32(v475$1, v483$1);
    v515$2 := FSUB32(v475$2, v483$2);
    v516$1 := FSUB32(v476$1, v484$1);
    v516$2 := FSUB32(v476$2, v484$2);
    v517$1 := FSUB32(v477$1, v485$1);
    v517$2 := FSUB32(v477$2, v485$2);
    v518$1 := FSUB32(v478$1, v486$1);
    v518$2 := FSUB32(v478$2, v486$2);
    v519$1 := FSUB32(v479$1, v487$1);
    v519$2 := FSUB32(v479$2, v487$2);
    v520$1 := BV32_SHL(v1$1, 2bv32);
    v520$2 := BV32_SHL(v1$2, 2bv32);
    call {:sourceloc} {:sourceloc_num 314} _LOG_WRITE_$$greal(true, BV32_ADD(v2$1, v520$1), FADD32(v488$1, v492$1), $$greal[BV32_ADD(v2$1, v520$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(v2$2, v520$2));
    assume {:do_not_predicate} {:check_id "check_state_288"} {:captureState "check_state_288"} {:sourceloc} {:sourceloc_num 314} true;
    call {:check_id "check_state_288"} {:sourceloc} {:sourceloc_num 314} _CHECK_WRITE_$$greal(true, BV32_ADD(v2$2, v520$2), FADD32(v488$2, v492$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(v2$1, v520$1)] := FADD32(v488$1, v492$1);
    $$greal[BV32_ADD(v2$2, v520$2)] := FADD32(v488$2, v492$2);
    call {:sourceloc} {:sourceloc_num 315} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 1bv32), FADD32(v489$1, v493$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_289"} {:captureState "check_state_289"} {:sourceloc} {:sourceloc_num 315} true;
    call {:check_id "check_state_289"} {:sourceloc} {:sourceloc_num 315} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 1bv32), FADD32(v489$2, v493$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 1bv32)] := FADD32(v489$1, v493$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 1bv32)] := FADD32(v489$2, v493$2);
    call {:sourceloc} {:sourceloc_num 316} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 2bv32), FADD32(v490$1, v494$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_290"} {:captureState "check_state_290"} {:sourceloc} {:sourceloc_num 316} true;
    call {:check_id "check_state_290"} {:sourceloc} {:sourceloc_num 316} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 2bv32), FADD32(v490$2, v494$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 2bv32)] := FADD32(v490$1, v494$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 2bv32)] := FADD32(v490$2, v494$2);
    call {:sourceloc} {:sourceloc_num 317} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 3bv32), FADD32(v491$1, v495$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_291"} {:captureState "check_state_291"} {:sourceloc} {:sourceloc_num 317} true;
    call {:check_id "check_state_291"} {:sourceloc} {:sourceloc_num 317} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 3bv32), FADD32(v491$2, v495$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 3bv32)] := FADD32(v491$1, v495$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 3bv32)] := FADD32(v491$2, v495$2);
    call {:sourceloc} {:sourceloc_num 318} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 256bv32), FADD32(v496$1, v516$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 256bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 256bv32));
    assume {:do_not_predicate} {:check_id "check_state_292"} {:captureState "check_state_292"} {:sourceloc} {:sourceloc_num 318} true;
    call {:check_id "check_state_292"} {:sourceloc} {:sourceloc_num 318} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 256bv32), FADD32(v496$2, v516$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 256bv32)] := FADD32(v496$1, v516$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 256bv32)] := FADD32(v496$2, v516$2);
    call {:sourceloc} {:sourceloc_num 319} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 257bv32), FADD32(v497$1, v517$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 257bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 257bv32));
    assume {:do_not_predicate} {:check_id "check_state_293"} {:captureState "check_state_293"} {:sourceloc} {:sourceloc_num 319} true;
    call {:check_id "check_state_293"} {:sourceloc} {:sourceloc_num 319} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 257bv32), FADD32(v497$2, v517$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 257bv32)] := FADD32(v497$1, v517$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 257bv32)] := FADD32(v497$2, v517$2);
    call {:sourceloc} {:sourceloc_num 320} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 258bv32), FADD32(v498$1, v518$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 258bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 258bv32));
    assume {:do_not_predicate} {:check_id "check_state_294"} {:captureState "check_state_294"} {:sourceloc} {:sourceloc_num 320} true;
    call {:check_id "check_state_294"} {:sourceloc} {:sourceloc_num 320} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 258bv32), FADD32(v498$2, v518$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 258bv32)] := FADD32(v498$1, v518$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 258bv32)] := FADD32(v498$2, v518$2);
    call {:sourceloc} {:sourceloc_num 321} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 259bv32), FADD32(v499$1, v519$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 259bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 259bv32));
    assume {:do_not_predicate} {:check_id "check_state_295"} {:captureState "check_state_295"} {:sourceloc} {:sourceloc_num 321} true;
    call {:check_id "check_state_295"} {:sourceloc} {:sourceloc_num 321} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 259bv32), FADD32(v499$2, v519$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 259bv32)] := FADD32(v499$1, v519$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 259bv32)] := FADD32(v499$2, v519$2);
    call {:sourceloc} {:sourceloc_num 322} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 512bv32), FSUB32(v488$1, v492$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 512bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 512bv32));
    assume {:do_not_predicate} {:check_id "check_state_296"} {:captureState "check_state_296"} {:sourceloc} {:sourceloc_num 322} true;
    call {:check_id "check_state_296"} {:sourceloc} {:sourceloc_num 322} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 512bv32), FSUB32(v488$2, v492$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 512bv32)] := FSUB32(v488$1, v492$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 512bv32)] := FSUB32(v488$2, v492$2);
    call {:sourceloc} {:sourceloc_num 323} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 513bv32), FSUB32(v489$1, v493$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 513bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 513bv32));
    assume {:do_not_predicate} {:check_id "check_state_297"} {:captureState "check_state_297"} {:sourceloc} {:sourceloc_num 323} true;
    call {:check_id "check_state_297"} {:sourceloc} {:sourceloc_num 323} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 513bv32), FSUB32(v489$2, v493$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 513bv32)] := FSUB32(v489$1, v493$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 513bv32)] := FSUB32(v489$2, v493$2);
    call {:sourceloc} {:sourceloc_num 324} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 514bv32), FSUB32(v490$1, v494$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 514bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 514bv32));
    assume {:do_not_predicate} {:check_id "check_state_298"} {:captureState "check_state_298"} {:sourceloc} {:sourceloc_num 324} true;
    call {:check_id "check_state_298"} {:sourceloc} {:sourceloc_num 324} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 514bv32), FSUB32(v490$2, v494$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 514bv32)] := FSUB32(v490$1, v494$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 514bv32)] := FSUB32(v490$2, v494$2);
    call {:sourceloc} {:sourceloc_num 325} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 515bv32), FSUB32(v491$1, v495$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 515bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 515bv32));
    assume {:do_not_predicate} {:check_id "check_state_299"} {:captureState "check_state_299"} {:sourceloc} {:sourceloc_num 325} true;
    call {:check_id "check_state_299"} {:sourceloc} {:sourceloc_num 325} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 515bv32), FSUB32(v491$2, v495$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 515bv32)] := FSUB32(v491$1, v495$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 515bv32)] := FSUB32(v491$2, v495$2);
    call {:sourceloc} {:sourceloc_num 326} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 768bv32), FSUB32(v496$1, v516$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 768bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 768bv32));
    assume {:do_not_predicate} {:check_id "check_state_300"} {:captureState "check_state_300"} {:sourceloc} {:sourceloc_num 326} true;
    call {:check_id "check_state_300"} {:sourceloc} {:sourceloc_num 326} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 768bv32), FSUB32(v496$2, v516$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 768bv32)] := FSUB32(v496$1, v516$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 768bv32)] := FSUB32(v496$2, v516$2);
    call {:sourceloc} {:sourceloc_num 327} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 769bv32), FSUB32(v497$1, v517$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 769bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 769bv32));
    assume {:do_not_predicate} {:check_id "check_state_301"} {:captureState "check_state_301"} {:sourceloc} {:sourceloc_num 327} true;
    call {:check_id "check_state_301"} {:sourceloc} {:sourceloc_num 327} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 769bv32), FSUB32(v497$2, v517$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 769bv32)] := FSUB32(v497$1, v517$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 769bv32)] := FSUB32(v497$2, v517$2);
    call {:sourceloc} {:sourceloc_num 328} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 770bv32), FSUB32(v498$1, v518$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 770bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 770bv32));
    assume {:do_not_predicate} {:check_id "check_state_302"} {:captureState "check_state_302"} {:sourceloc} {:sourceloc_num 328} true;
    call {:check_id "check_state_302"} {:sourceloc} {:sourceloc_num 328} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 770bv32), FSUB32(v498$2, v518$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 770bv32)] := FSUB32(v498$1, v518$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 770bv32)] := FSUB32(v498$2, v518$2);
    call {:sourceloc} {:sourceloc_num 329} _LOG_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$1, v520$1), 771bv32), FSUB32(v499$1, v519$1), $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 771bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 771bv32));
    assume {:do_not_predicate} {:check_id "check_state_303"} {:captureState "check_state_303"} {:sourceloc} {:sourceloc_num 329} true;
    call {:check_id "check_state_303"} {:sourceloc} {:sourceloc_num 329} _CHECK_WRITE_$$greal(true, BV32_ADD(BV32_ADD(v2$2, v520$2), 771bv32), FSUB32(v499$2, v519$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$greal"} true;
    $$greal[BV32_ADD(BV32_ADD(v2$1, v520$1), 771bv32)] := FSUB32(v499$1, v519$1);
    $$greal[BV32_ADD(BV32_ADD(v2$2, v520$2), 771bv32)] := FSUB32(v499$2, v519$2);
    v521$1 := BV32_SHL(v1$1, 2bv32);
    v521$2 := BV32_SHL(v1$2, 2bv32);
    call {:sourceloc} {:sourceloc_num 330} _LOG_WRITE_$$gimag(true, BV32_ADD(v2$1, v521$1), FADD32(v504$1, v508$1), $$gimag[BV32_ADD(v2$1, v521$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(v2$2, v521$2));
    assume {:do_not_predicate} {:check_id "check_state_304"} {:captureState "check_state_304"} {:sourceloc} {:sourceloc_num 330} true;
    call {:check_id "check_state_304"} {:sourceloc} {:sourceloc_num 330} _CHECK_WRITE_$$gimag(true, BV32_ADD(v2$2, v521$2), FADD32(v504$2, v508$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(v2$1, v521$1)] := FADD32(v504$1, v508$1);
    $$gimag[BV32_ADD(v2$2, v521$2)] := FADD32(v504$2, v508$2);
    call {:sourceloc} {:sourceloc_num 331} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 1bv32), FADD32(v505$1, v509$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_305"} {:captureState "check_state_305"} {:sourceloc} {:sourceloc_num 331} true;
    call {:check_id "check_state_305"} {:sourceloc} {:sourceloc_num 331} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 1bv32), FADD32(v505$2, v509$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 1bv32)] := FADD32(v505$1, v509$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 1bv32)] := FADD32(v505$2, v509$2);
    call {:sourceloc} {:sourceloc_num 332} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 2bv32), FADD32(v506$1, v510$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_306"} {:captureState "check_state_306"} {:sourceloc} {:sourceloc_num 332} true;
    call {:check_id "check_state_306"} {:sourceloc} {:sourceloc_num 332} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 2bv32), FADD32(v506$2, v510$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 2bv32)] := FADD32(v506$1, v510$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 2bv32)] := FADD32(v506$2, v510$2);
    call {:sourceloc} {:sourceloc_num 333} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 3bv32), FADD32(v507$1, v511$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_307"} {:captureState "check_state_307"} {:sourceloc} {:sourceloc_num 333} true;
    call {:check_id "check_state_307"} {:sourceloc} {:sourceloc_num 333} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 3bv32), FADD32(v507$2, v511$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 3bv32)] := FADD32(v507$1, v511$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 3bv32)] := FADD32(v507$2, v511$2);
    call {:sourceloc} {:sourceloc_num 334} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 256bv32), FSUB32(v512$1, v500$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 256bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 256bv32));
    assume {:do_not_predicate} {:check_id "check_state_308"} {:captureState "check_state_308"} {:sourceloc} {:sourceloc_num 334} true;
    call {:check_id "check_state_308"} {:sourceloc} {:sourceloc_num 334} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 256bv32), FSUB32(v512$2, v500$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 256bv32)] := FSUB32(v512$1, v500$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 256bv32)] := FSUB32(v512$2, v500$2);
    call {:sourceloc} {:sourceloc_num 335} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 257bv32), FSUB32(v513$1, v501$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 257bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 257bv32));
    assume {:do_not_predicate} {:check_id "check_state_309"} {:captureState "check_state_309"} {:sourceloc} {:sourceloc_num 335} true;
    call {:check_id "check_state_309"} {:sourceloc} {:sourceloc_num 335} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 257bv32), FSUB32(v513$2, v501$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 257bv32)] := FSUB32(v513$1, v501$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 257bv32)] := FSUB32(v513$2, v501$2);
    call {:sourceloc} {:sourceloc_num 336} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 258bv32), FSUB32(v514$1, v502$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 258bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 258bv32));
    assume {:do_not_predicate} {:check_id "check_state_310"} {:captureState "check_state_310"} {:sourceloc} {:sourceloc_num 336} true;
    call {:check_id "check_state_310"} {:sourceloc} {:sourceloc_num 336} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 258bv32), FSUB32(v514$2, v502$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 258bv32)] := FSUB32(v514$1, v502$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 258bv32)] := FSUB32(v514$2, v502$2);
    call {:sourceloc} {:sourceloc_num 337} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 259bv32), FSUB32(v515$1, v503$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 259bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 259bv32));
    assume {:do_not_predicate} {:check_id "check_state_311"} {:captureState "check_state_311"} {:sourceloc} {:sourceloc_num 337} true;
    call {:check_id "check_state_311"} {:sourceloc} {:sourceloc_num 337} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 259bv32), FSUB32(v515$2, v503$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 259bv32)] := FSUB32(v515$1, v503$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 259bv32)] := FSUB32(v515$2, v503$2);
    call {:sourceloc} {:sourceloc_num 338} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 512bv32), FSUB32(v504$1, v508$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 512bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 512bv32));
    assume {:do_not_predicate} {:check_id "check_state_312"} {:captureState "check_state_312"} {:sourceloc} {:sourceloc_num 338} true;
    call {:check_id "check_state_312"} {:sourceloc} {:sourceloc_num 338} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 512bv32), FSUB32(v504$2, v508$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 512bv32)] := FSUB32(v504$1, v508$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 512bv32)] := FSUB32(v504$2, v508$2);
    call {:sourceloc} {:sourceloc_num 339} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 513bv32), FSUB32(v505$1, v509$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 513bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 513bv32));
    assume {:do_not_predicate} {:check_id "check_state_313"} {:captureState "check_state_313"} {:sourceloc} {:sourceloc_num 339} true;
    call {:check_id "check_state_313"} {:sourceloc} {:sourceloc_num 339} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 513bv32), FSUB32(v505$2, v509$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 513bv32)] := FSUB32(v505$1, v509$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 513bv32)] := FSUB32(v505$2, v509$2);
    call {:sourceloc} {:sourceloc_num 340} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 514bv32), FSUB32(v506$1, v510$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 514bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 514bv32));
    assume {:do_not_predicate} {:check_id "check_state_314"} {:captureState "check_state_314"} {:sourceloc} {:sourceloc_num 340} true;
    call {:check_id "check_state_314"} {:sourceloc} {:sourceloc_num 340} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 514bv32), FSUB32(v506$2, v510$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 514bv32)] := FSUB32(v506$1, v510$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 514bv32)] := FSUB32(v506$2, v510$2);
    call {:sourceloc} {:sourceloc_num 341} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 515bv32), FSUB32(v507$1, v511$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 515bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 515bv32));
    assume {:do_not_predicate} {:check_id "check_state_315"} {:captureState "check_state_315"} {:sourceloc} {:sourceloc_num 341} true;
    call {:check_id "check_state_315"} {:sourceloc} {:sourceloc_num 341} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 515bv32), FSUB32(v507$2, v511$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 515bv32)] := FSUB32(v507$1, v511$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 515bv32)] := FSUB32(v507$2, v511$2);
    call {:sourceloc} {:sourceloc_num 342} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 768bv32), FADD32(v500$1, v512$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 768bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 768bv32));
    assume {:do_not_predicate} {:check_id "check_state_316"} {:captureState "check_state_316"} {:sourceloc} {:sourceloc_num 342} true;
    call {:check_id "check_state_316"} {:sourceloc} {:sourceloc_num 342} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 768bv32), FADD32(v500$2, v512$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 768bv32)] := FADD32(v500$1, v512$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 768bv32)] := FADD32(v500$2, v512$2);
    call {:sourceloc} {:sourceloc_num 343} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 769bv32), FADD32(v501$1, v513$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 769bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 769bv32));
    assume {:do_not_predicate} {:check_id "check_state_317"} {:captureState "check_state_317"} {:sourceloc} {:sourceloc_num 343} true;
    call {:check_id "check_state_317"} {:sourceloc} {:sourceloc_num 343} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 769bv32), FADD32(v501$2, v513$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 769bv32)] := FADD32(v501$1, v513$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 769bv32)] := FADD32(v501$2, v513$2);
    call {:sourceloc} {:sourceloc_num 344} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 770bv32), FADD32(v502$1, v514$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 770bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 770bv32));
    assume {:do_not_predicate} {:check_id "check_state_318"} {:captureState "check_state_318"} {:sourceloc} {:sourceloc_num 344} true;
    call {:check_id "check_state_318"} {:sourceloc} {:sourceloc_num 344} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 770bv32), FADD32(v502$2, v514$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 770bv32)] := FADD32(v502$1, v514$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 770bv32)] := FADD32(v502$2, v514$2);
    call {:sourceloc} {:sourceloc_num 345} _LOG_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$1, v521$1), 771bv32), FADD32(v503$1, v515$1), $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 771bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 771bv32));
    assume {:do_not_predicate} {:check_id "check_state_319"} {:captureState "check_state_319"} {:sourceloc} {:sourceloc_num 345} true;
    call {:check_id "check_state_319"} {:sourceloc} {:sourceloc_num 345} _CHECK_WRITE_$$gimag(true, BV32_ADD(BV32_ADD(v2$2, v521$2), 771bv32), FADD32(v503$2, v515$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gimag"} true;
    $$gimag[BV32_ADD(BV32_ADD(v2$1, v521$1), 771bv32)] := FADD32(v503$1, v515$1);
    $$gimag[BV32_ADD(BV32_ADD(v2$2, v521$2), 771bv32)] := FADD32(v503$2, v515$2);
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$kfft.lds, $$greal, $$gimag, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$kfft.lds, $$greal, $$gimag, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$kfft.lds, $$greal, $$gimag, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_3($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$kfft.lds, $$greal, $$gimag, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_4($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$kfft.lds, $$greal, $$gimag, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_5($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$kfft.lds, $$greal, $$gimag, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_6($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$kfft.lds, $$greal, $$gimag, _TRACKING;



const _WATCHED_VALUE_$$greal: bv32;

procedure {:inline 1} _LOG_READ_$$greal(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$greal;



implementation {:inline 1} _LOG_READ_$$greal(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$greal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$greal == _value then true else _READ_HAS_OCCURRED_$$greal);
    return;
}



procedure _CHECK_READ_$$greal(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "greal"} {:array "$$greal"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$greal && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$greal);
  requires {:source_name "greal"} {:array "$$greal"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$greal && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$greal: bool;

procedure {:inline 1} _LOG_WRITE_$$greal(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$greal, _WRITE_READ_BENIGN_FLAG_$$greal;



implementation {:inline 1} _LOG_WRITE_$$greal(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$greal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$greal == _value then true else _WRITE_HAS_OCCURRED_$$greal);
    _WRITE_READ_BENIGN_FLAG_$$greal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$greal == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$greal);
    return;
}



procedure _CHECK_WRITE_$$greal(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "greal"} {:array "$$greal"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$greal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$greal != _value);
  requires {:source_name "greal"} {:array "$$greal"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$greal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$greal != _value);
  requires {:source_name "greal"} {:array "$$greal"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$greal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$greal(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$greal;



implementation {:inline 1} _LOG_ATOMIC_$$greal(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$greal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$greal);
    return;
}



procedure _CHECK_ATOMIC_$$greal(_P: bool, _offset: bv32);
  requires {:source_name "greal"} {:array "$$greal"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$greal && _WATCHED_OFFSET == _offset);
  requires {:source_name "greal"} {:array "$$greal"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$greal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$greal;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$greal(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$greal := (if _P && _WRITE_HAS_OCCURRED_$$greal && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$greal);
    return;
}



const _WATCHED_VALUE_$$gimag: bv32;

procedure {:inline 1} _LOG_READ_$$gimag(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$gimag;



implementation {:inline 1} _LOG_READ_$$gimag(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$gimag := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gimag == _value then true else _READ_HAS_OCCURRED_$$gimag);
    return;
}



procedure _CHECK_READ_$$gimag(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "gimag"} {:array "$$gimag"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$gimag && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$gimag);
  requires {:source_name "gimag"} {:array "$$gimag"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$gimag && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$gimag: bool;

procedure {:inline 1} _LOG_WRITE_$$gimag(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$gimag, _WRITE_READ_BENIGN_FLAG_$$gimag;



implementation {:inline 1} _LOG_WRITE_$$gimag(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$gimag := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gimag == _value then true else _WRITE_HAS_OCCURRED_$$gimag);
    _WRITE_READ_BENIGN_FLAG_$$gimag := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gimag == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$gimag);
    return;
}



procedure _CHECK_WRITE_$$gimag(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "gimag"} {:array "$$gimag"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$gimag && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gimag != _value);
  requires {:source_name "gimag"} {:array "$$gimag"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$gimag && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gimag != _value);
  requires {:source_name "gimag"} {:array "$$gimag"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$gimag && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$gimag(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$gimag;



implementation {:inline 1} _LOG_ATOMIC_$$gimag(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$gimag := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$gimag);
    return;
}



procedure _CHECK_ATOMIC_$$gimag(_P: bool, _offset: bv32);
  requires {:source_name "gimag"} {:array "$$gimag"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$gimag && _WATCHED_OFFSET == _offset);
  requires {:source_name "gimag"} {:array "$$gimag"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$gimag && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$gimag;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gimag(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$gimag := (if _P && _WRITE_HAS_OCCURRED_$$gimag && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$gimag);
    return;
}



const _WATCHED_VALUE_$$kfft.lds: bv32;

procedure {:inline 1} _LOG_READ_$$kfft.lds(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$kfft.lds;



implementation {:inline 1} _LOG_READ_$$kfft.lds(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kfft.lds := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kfft.lds == _value then true else _READ_HAS_OCCURRED_$$kfft.lds);
    return;
}



procedure _CHECK_READ_$$kfft.lds(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "lds"} {:array "$$kfft.lds"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kfft.lds && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kfft.lds && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lds"} {:array "$$kfft.lds"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kfft.lds && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kfft.lds: bool;

procedure {:inline 1} _LOG_WRITE_$$kfft.lds(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$kfft.lds, _WRITE_READ_BENIGN_FLAG_$$kfft.lds;



implementation {:inline 1} _LOG_WRITE_$$kfft.lds(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kfft.lds := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kfft.lds == _value then true else _WRITE_HAS_OCCURRED_$$kfft.lds);
    _WRITE_READ_BENIGN_FLAG_$$kfft.lds := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kfft.lds == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kfft.lds);
    return;
}



procedure _CHECK_WRITE_$$kfft.lds(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "lds"} {:array "$$kfft.lds"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kfft.lds && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kfft.lds != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lds"} {:array "$$kfft.lds"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kfft.lds && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kfft.lds != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lds"} {:array "$$kfft.lds"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kfft.lds && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kfft.lds(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kfft.lds;



implementation {:inline 1} _LOG_ATOMIC_$$kfft.lds(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kfft.lds := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kfft.lds);
    return;
}



procedure _CHECK_ATOMIC_$$kfft.lds(_P: bool, _offset: bv32);
  requires {:source_name "lds"} {:array "$$kfft.lds"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kfft.lds && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lds"} {:array "$$kfft.lds"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kfft.lds && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kfft.lds;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kfft.lds(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kfft.lds := (if _P && _WRITE_HAS_OCCURRED_$$kfft.lds && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kfft.lds);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kfft.lds;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kfft.lds;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kfft.lds;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$greal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$greal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$greal;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$gimag;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$gimag;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$gimag;
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
    havoc $$greal;
    goto anon7;

  anon7:
    havoc $$gimag;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$kfft.lds;
    goto anon3;

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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kfft.lds;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kfft.lds;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kfft.lds;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$greal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$greal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$greal;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$gimag;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$gimag;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$gimag;
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
    havoc $$greal;
    goto anon7;

  anon7:
    havoc $$gimag;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$kfft.lds;
    goto anon3;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kfft.lds;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kfft.lds;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kfft.lds;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$greal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$greal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$greal;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$gimag;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$gimag;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$gimag;
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
    havoc $$greal;
    goto anon7;

  anon7:
    havoc $$gimag;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$kfft.lds;
    goto anon3;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_3($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kfft.lds;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kfft.lds;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kfft.lds;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$greal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$greal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$greal;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$gimag;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$gimag;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$gimag;
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
    havoc $$greal;
    goto anon7;

  anon7:
    havoc $$gimag;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$kfft.lds;
    goto anon3;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_4($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kfft.lds;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kfft.lds;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kfft.lds;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$greal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$greal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$greal;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$gimag;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$gimag;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$gimag;
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
    havoc $$greal;
    goto anon7;

  anon7:
    havoc $$gimag;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$kfft.lds;
    goto anon3;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_5($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kfft.lds;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kfft.lds;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kfft.lds;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$greal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$greal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$greal;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$gimag;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$gimag;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$gimag;
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
    havoc $$greal;
    goto anon7;

  anon7:
    havoc $$gimag;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$kfft.lds;
    goto anon3;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_6($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kfft.lds;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kfft.lds;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kfft.lds;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$greal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$greal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$greal;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$gimag;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$gimag;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$gimag;
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
    havoc $$greal;
    goto anon7;

  anon7:
    havoc $$gimag;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$kfft.lds;
    goto anon3;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
