type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$A"} {:global} {:elem_width 32} {:source_name "A"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$A: bool;

axiom {:array_info "$$B"} {:global} {:elem_width 32} {:source_name "B"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$B: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$B: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$B: bool;

var {:source_name "C"} {:global} $$C: [bv32]bv32;

axiom {:array_info "$$C"} {:global} {:elem_width 32} {:source_name "C"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$C: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$C: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$C: bool;

var {:source_name "a"} $$a$1: [bv32]bv32;

var {:source_name "a"} $$a$2: [bv32]bv32;

axiom {:array_info "$$a"} {:elem_width 32} {:source_name "a"} {:source_elem_width 32} {:source_dimensions "4"} true;

var {:source_name "c"} $$c$1: [bv32]bv32;

var {:source_name "c"} $$c$2: [bv32]bv32;

axiom {:array_info "$$c"} {:elem_width 32} {:source_name "c"} {:source_elem_width 32} {:source_dimensions "16"} true;

var {:source_name "as"} $$as$1: [bv32]bv32;

var {:source_name "as"} $$as$2: [bv32]bv32;

axiom {:array_info "$$as"} {:elem_width 32} {:source_name "as"} {:source_elem_width 32} {:source_dimensions "4"} true;

var {:source_name "bs"} {:group_shared} $$sgemmNT.bs: [bv1][bv32]bv32;

axiom {:array_info "$$sgemmNT.bs"} {:group_shared} {:elem_width 32} {:source_name "bs"} {:source_elem_width 32} {:source_dimensions "4,16"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _READ_HAS_OCCURRED_$$sgemmNT.bs: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _WRITE_HAS_OCCURRED_$$sgemmNT.bs: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _ATOMIC_HAS_OCCURRED_$$sgemmNT.bs: bool;

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

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "sgemmNT"} {:kernel} $sgemmNT($lda: bv32, $ldb: bv32, $ldc: bv32, $k: bv32, $alpha: bv32, $beta: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $ldc == 256bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$A && !_WRITE_HAS_OCCURRED_$$A && !_ATOMIC_HAS_OCCURRED_$$A;
  requires !_READ_HAS_OCCURRED_$$B && !_WRITE_HAS_OCCURRED_$$B && !_ATOMIC_HAS_OCCURRED_$$B;
  requires !_READ_HAS_OCCURRED_$$C && !_WRITE_HAS_OCCURRED_$$C && !_ATOMIC_HAS_OCCURRED_$$C;
  requires !_READ_HAS_OCCURRED_$$sgemmNT.bs && !_WRITE_HAS_OCCURRED_$$sgemmNT.bs && !_ATOMIC_HAS_OCCURRED_$$sgemmNT.bs;
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
  modifies $$sgemmNT.bs, _WRITE_HAS_OCCURRED_$$sgemmNT.bs, _WRITE_READ_BENIGN_FLAG_$$sgemmNT.bs, _WRITE_READ_BENIGN_FLAG_$$sgemmNT.bs, $$C, _TRACKING, _READ_HAS_OCCURRED_$$sgemmNT.bs, _TRACKING, _TRACKING, _READ_HAS_OCCURRED_$$C, _WRITE_HAS_OCCURRED_$$C, _WRITE_READ_BENIGN_FLAG_$$C, _WRITE_READ_BENIGN_FLAG_$$C;



implementation {:source_name "sgemmNT"} {:kernel} $sgemmNT($lda: bv32, $ldb: bv32, $ldc: bv32, $k: bv32, $alpha: bv32, $beta: bv32)
{
  var $i.0: bv32;
  var $i.1: bv32;
  var $counter.0: bv32;
  var $b.0$1: bv32;
  var $b.0$2: bv32;
  var $.01$1: bv32;
  var $.01$2: bv32;
  var $.0$1: bv32;
  var $.0$2: bv32;
  var $i.2: bv32;
  var $.02$1: bv32;
  var $.02$2: bv32;
  var $i1.0: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v11: bool;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v10: bool;
  var v16$1: bv32;
  var v16$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
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
  var v30$1: bv32;
  var v30$2: bv32;
  var v31$1: bv32;
  var v31$2: bv32;
  var v32$1: bv32;
  var v32$2: bv32;
  var v33$1: bv32;
  var v33$2: bv32;
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
  var v210: bv32;
  var v211: bool;
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
  var v384$1: bv32;
  var v384$2: bv32;
  var v385$1: bv32;
  var v385$2: bv32;
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
  var v351$1: bv32;
  var v351$2: bv32;
  var v352$1: bv32;
  var v352$2: bv32;
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
  var v400$1: bv32;
  var v400$2: bv32;
  var v401$1: bv32;
  var v401$2: bv32;
  var v402$1: bv32;
  var v402$2: bv32;
  var v403$1: bv32;
  var v403$2: bv32;
  var v404: bool;
  var v405$1: bv32;
  var v405$2: bv32;
  var v406$1: bv32;
  var v406$2: bv32;
  var v7: bool;
  var v6$1: bv32;
  var v6$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
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
  var v98$1: bv32;
  var v98$2: bv32;
  var v99$1: bv32;
  var v99$2: bv32;
  var v100$1: bv32;
  var v100$2: bv32;
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
  var v3$1: bv32;
  var v3$2: bv32;
  var v27$1: bv32;
  var v27$2: bv32;
  var v28$1: bv32;
  var v28$2: bv32;
  var v29$1: bv32;
  var v29$2: bv32;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1$1 := local_id_y$1;
    v1$2 := local_id_y$2;
    v2$1 := BV32_MUL(group_id_x$1, 64bv32);
    v2$2 := BV32_MUL(group_id_x$2, 64bv32);
    v3$1 := BV32_MUL(group_id_y$1, 16bv32);
    v3$2 := BV32_MUL(group_id_y$2, 16bv32);
    v4$1 := BV32_ADD(v0$1, BV32_MUL(v1$1, 16bv32));
    v4$2 := BV32_ADD(v0$2, BV32_MUL(v1$2, 16bv32));
    v5$1 := BV32_ADD(v2$1, v4$1);
    v5$2 := BV32_ADD(v2$2, v4$2);
    v6$1 := BV32_ADD(BV32_ADD(v3$1, v0$1), BV32_MUL(v1$1, $ldb));
    v6$2 := BV32_ADD(BV32_ADD(v3$2, v0$2), BV32_MUL(v1$2, $ldb));
    $i.0 := 0bv32;
    assume {:captureState "loop_entry_state_4_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_4"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 2} true;
    v7 := BV32_SLT($i.0, 4bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v7 && !v7;
    havoc v9$1, v9$2;
    $i.1 := 0bv32;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_3"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 9} true;
    v10 := BV32_SLT($i.1, 16bv32);
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v10 && !v10;
    $counter.0, $b.0$1, $.01$1, $.0$1 := BV32_MUL(4bv32, $ldb), v9$1, BV32_ADD(v6$1, BV32_MUL(4bv32, $ldb)), BV32_ADD(v5$1, BV32_MUL(4bv32, $lda));
    $b.0$2, $.01$2, $.0$2 := v9$2, BV32_ADD(v6$2, BV32_MUL(4bv32, $ldb)), BV32_ADD(v5$2, BV32_MUL(4bv32, $lda));
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b11 ==> _WRITE_HAS_OCCURRED_$$sgemmNT.bs ==> _WATCHED_OFFSET == BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1);
    assert {:tag "nowrite"} _b10 ==> !_WRITE_HAS_OCCURRED_$$sgemmNT.bs;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($counter.0, BV32_MUL(4bv32, $ldb));
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($counter.0, BV32_MUL(4bv32, $ldb));
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($counter.0, BV32_MUL(4bv32, $ldb));
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($counter.0, BV32_MUL(4bv32, $ldb));
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($counter.0, BV32_MUL(4bv32, $ldb));
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($counter.0, BV32_MUL(4bv32, $ldb));
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($counter.0, BV32_MUL(4bv32, $ldb));
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($counter.0, BV32_MUL(4bv32, $ldb));
    assert {:tag "loopCounterIsStrided"} {:thread 1} _b0 ==> BV32_AND(BV32_SUB(BV32_MUL(4bv32, $ldb), 1bv32), $counter.0) == BV32_AND(BV32_SUB(BV32_MUL(4bv32, $ldb), 1bv32), BV32_MUL(4bv32, $ldb));
    assert {:tag "loopCounterIsStrided"} {:thread 2} _b0 ==> BV32_AND(BV32_SUB(BV32_MUL(4bv32, $ldb), 1bv32), $counter.0) == BV32_AND(BV32_SUB(BV32_MUL(4bv32, $ldb), 1bv32), BV32_MUL(4bv32, $ldb));
    assert {:block_sourceloc} {:sourceloc_num 14} true;
    $i.2 := 0bv32;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $10;

  $10:
    assume {:captureState "loop_head_state_2"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 15} true;
    v11 := BV32_SLT($i.2, 4bv32);
    goto $truebb1, __partitioned_block_$falsebb1_0;

  __partitioned_block_$falsebb1_0:
    assume {:partition} !v11 && !v11;
    call {:sourceloc} {:sourceloc_num 21} _LOG_WRITE_$$sgemmNT.bs(true, BV32_ADD(BV32_MUL(v1$1, 16bv32), v0$1), $b.0$1, $$sgemmNT.bs[1bv1][BV32_ADD(BV32_MUL(v1$1, 16bv32), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sgemmNT.bs(true, BV32_ADD(BV32_MUL(v1$2, 16bv32), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 21} _CHECK_WRITE_$$sgemmNT.bs(true, BV32_ADD(BV32_MUL(v1$2, 16bv32), v0$2), $b.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sgemmNT.bs"} true;
    $$sgemmNT.bs[1bv1][BV32_ADD(BV32_MUL(v1$1, 16bv32), v0$1)] := $b.0$1;
    $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, 16bv32), v0$2)] := $b.0$2;
    goto __partitioned_block_$falsebb1_1;

  __partitioned_block_$falsebb1_1:
    call {:sourceloc_num 22} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    havoc v13$1, v13$2;
    $$a$1[0bv32] := v13$1;
    $$a$2[0bv32] := v13$2;
    havoc v14$1, v14$2;
    $$a$1[1bv32] := v14$1;
    $$a$2[1bv32] := v14$2;
    havoc v15$1, v15$2;
    $$a$1[2bv32] := v15$1;
    $$a$2[2bv32] := v15$2;
    havoc v16$1, v16$2;
    $$a$1[3bv32] := v16$1;
    $$a$2[3bv32] := v16$2;
    havoc v17$1, v17$2;
    v18$1 := $$as$1[0bv32];
    v18$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 34} true;
    v19$1 := $$sgemmNT.bs[1bv1][0bv32];
    v19$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    v20$1 := $$c$1[0bv32];
    v20$2 := $$c$2[0bv32];
    $$c$1[0bv32] := FADD32(v20$1, FMUL32(v18$1, v19$1));
    $$c$2[0bv32] := FADD32(v20$2, FMUL32(v18$2, v19$2));
    v21$1 := $$as$1[0bv32];
    v21$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 38} true;
    v22$1 := $$sgemmNT.bs[1bv1][1bv32];
    v22$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32];
    v23$1 := $$c$1[1bv32];
    v23$2 := $$c$2[1bv32];
    $$c$1[1bv32] := FADD32(v23$1, FMUL32(v21$1, v22$1));
    $$c$2[1bv32] := FADD32(v23$2, FMUL32(v21$2, v22$2));
    v24$1 := $$as$1[0bv32];
    v24$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 42} true;
    v25$1 := $$sgemmNT.bs[1bv1][2bv32];
    v25$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32];
    v26$1 := $$c$1[2bv32];
    v26$2 := $$c$2[2bv32];
    $$c$1[2bv32] := FADD32(v26$1, FMUL32(v24$1, v25$1));
    $$c$2[2bv32] := FADD32(v26$2, FMUL32(v24$2, v25$2));
    v27$1 := $$as$1[0bv32];
    v27$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 46} true;
    v28$1 := $$sgemmNT.bs[1bv1][3bv32];
    v28$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32];
    v29$1 := $$c$1[3bv32];
    v29$2 := $$c$2[3bv32];
    $$c$1[3bv32] := FADD32(v29$1, FMUL32(v27$1, v28$1));
    $$c$2[3bv32] := FADD32(v29$2, FMUL32(v27$2, v28$2));
    v30$1 := $$as$1[0bv32];
    v30$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 50} true;
    v31$1 := $$sgemmNT.bs[1bv1][4bv32];
    v31$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][4bv32];
    v32$1 := $$c$1[4bv32];
    v32$2 := $$c$2[4bv32];
    $$c$1[4bv32] := FADD32(v32$1, FMUL32(v30$1, v31$1));
    $$c$2[4bv32] := FADD32(v32$2, FMUL32(v30$2, v31$2));
    v33$1 := $$as$1[0bv32];
    v33$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 54} true;
    v34$1 := $$sgemmNT.bs[1bv1][5bv32];
    v34$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][5bv32];
    v35$1 := $$c$1[5bv32];
    v35$2 := $$c$2[5bv32];
    $$c$1[5bv32] := FADD32(v35$1, FMUL32(v33$1, v34$1));
    $$c$2[5bv32] := FADD32(v35$2, FMUL32(v33$2, v34$2));
    v36$1 := $$as$1[0bv32];
    v36$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 58} true;
    v37$1 := $$sgemmNT.bs[1bv1][6bv32];
    v37$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][6bv32];
    v38$1 := $$c$1[6bv32];
    v38$2 := $$c$2[6bv32];
    $$c$1[6bv32] := FADD32(v38$1, FMUL32(v36$1, v37$1));
    $$c$2[6bv32] := FADD32(v38$2, FMUL32(v36$2, v37$2));
    v39$1 := $$as$1[0bv32];
    v39$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 62} true;
    v40$1 := $$sgemmNT.bs[1bv1][7bv32];
    v40$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][7bv32];
    v41$1 := $$c$1[7bv32];
    v41$2 := $$c$2[7bv32];
    $$c$1[7bv32] := FADD32(v41$1, FMUL32(v39$1, v40$1));
    $$c$2[7bv32] := FADD32(v41$2, FMUL32(v39$2, v40$2));
    v42$1 := $$as$1[0bv32];
    v42$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 66} true;
    v43$1 := $$sgemmNT.bs[1bv1][8bv32];
    v43$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][8bv32];
    v44$1 := $$c$1[8bv32];
    v44$2 := $$c$2[8bv32];
    $$c$1[8bv32] := FADD32(v44$1, FMUL32(v42$1, v43$1));
    $$c$2[8bv32] := FADD32(v44$2, FMUL32(v42$2, v43$2));
    v45$1 := $$as$1[0bv32];
    v45$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 70} true;
    v46$1 := $$sgemmNT.bs[1bv1][9bv32];
    v46$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][9bv32];
    v47$1 := $$c$1[9bv32];
    v47$2 := $$c$2[9bv32];
    $$c$1[9bv32] := FADD32(v47$1, FMUL32(v45$1, v46$1));
    $$c$2[9bv32] := FADD32(v47$2, FMUL32(v45$2, v46$2));
    v48$1 := $$as$1[0bv32];
    v48$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 74} true;
    v49$1 := $$sgemmNT.bs[1bv1][10bv32];
    v49$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][10bv32];
    v50$1 := $$c$1[10bv32];
    v50$2 := $$c$2[10bv32];
    $$c$1[10bv32] := FADD32(v50$1, FMUL32(v48$1, v49$1));
    $$c$2[10bv32] := FADD32(v50$2, FMUL32(v48$2, v49$2));
    v51$1 := $$as$1[0bv32];
    v51$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 78} true;
    v52$1 := $$sgemmNT.bs[1bv1][11bv32];
    v52$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][11bv32];
    v53$1 := $$c$1[11bv32];
    v53$2 := $$c$2[11bv32];
    $$c$1[11bv32] := FADD32(v53$1, FMUL32(v51$1, v52$1));
    $$c$2[11bv32] := FADD32(v53$2, FMUL32(v51$2, v52$2));
    v54$1 := $$as$1[0bv32];
    v54$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 82} true;
    v55$1 := $$sgemmNT.bs[1bv1][12bv32];
    v55$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][12bv32];
    v56$1 := $$c$1[12bv32];
    v56$2 := $$c$2[12bv32];
    $$c$1[12bv32] := FADD32(v56$1, FMUL32(v54$1, v55$1));
    $$c$2[12bv32] := FADD32(v56$2, FMUL32(v54$2, v55$2));
    v57$1 := $$as$1[0bv32];
    v57$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 86} true;
    v58$1 := $$sgemmNT.bs[1bv1][13bv32];
    v58$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][13bv32];
    v59$1 := $$c$1[13bv32];
    v59$2 := $$c$2[13bv32];
    $$c$1[13bv32] := FADD32(v59$1, FMUL32(v57$1, v58$1));
    $$c$2[13bv32] := FADD32(v59$2, FMUL32(v57$2, v58$2));
    v60$1 := $$as$1[0bv32];
    v60$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 90} true;
    v61$1 := $$sgemmNT.bs[1bv1][14bv32];
    v61$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][14bv32];
    v62$1 := $$c$1[14bv32];
    v62$2 := $$c$2[14bv32];
    $$c$1[14bv32] := FADD32(v62$1, FMUL32(v60$1, v61$1));
    $$c$2[14bv32] := FADD32(v62$2, FMUL32(v60$2, v61$2));
    v63$1 := $$as$1[0bv32];
    v63$2 := $$as$2[0bv32];
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 94} true;
    v64$1 := $$sgemmNT.bs[1bv1][15bv32];
    v64$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][15bv32];
    v65$1 := $$c$1[15bv32];
    v65$2 := $$c$2[15bv32];
    $$c$1[15bv32] := FADD32(v65$1, FMUL32(v63$1, v64$1));
    $$c$2[15bv32] := FADD32(v65$2, FMUL32(v63$2, v64$2));
    v66$1 := $$as$1[1bv32];
    v66$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 100} true;
    v67$1 := $$sgemmNT.bs[1bv1][16bv32];
    v67$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][16bv32];
    v68$1 := $$c$1[0bv32];
    v68$2 := $$c$2[0bv32];
    $$c$1[0bv32] := FADD32(v68$1, FMUL32(v66$1, v67$1));
    $$c$2[0bv32] := FADD32(v68$2, FMUL32(v66$2, v67$2));
    v69$1 := $$as$1[1bv32];
    v69$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 104} true;
    v70$1 := $$sgemmNT.bs[1bv1][17bv32];
    v70$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][17bv32];
    v71$1 := $$c$1[1bv32];
    v71$2 := $$c$2[1bv32];
    $$c$1[1bv32] := FADD32(v71$1, FMUL32(v69$1, v70$1));
    $$c$2[1bv32] := FADD32(v71$2, FMUL32(v69$2, v70$2));
    v72$1 := $$as$1[1bv32];
    v72$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 108} true;
    v73$1 := $$sgemmNT.bs[1bv1][18bv32];
    v73$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][18bv32];
    v74$1 := $$c$1[2bv32];
    v74$2 := $$c$2[2bv32];
    $$c$1[2bv32] := FADD32(v74$1, FMUL32(v72$1, v73$1));
    $$c$2[2bv32] := FADD32(v74$2, FMUL32(v72$2, v73$2));
    v75$1 := $$as$1[1bv32];
    v75$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 112} true;
    v76$1 := $$sgemmNT.bs[1bv1][19bv32];
    v76$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][19bv32];
    v77$1 := $$c$1[3bv32];
    v77$2 := $$c$2[3bv32];
    $$c$1[3bv32] := FADD32(v77$1, FMUL32(v75$1, v76$1));
    $$c$2[3bv32] := FADD32(v77$2, FMUL32(v75$2, v76$2));
    v78$1 := $$as$1[1bv32];
    v78$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 116} true;
    v79$1 := $$sgemmNT.bs[1bv1][20bv32];
    v79$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][20bv32];
    v80$1 := $$c$1[4bv32];
    v80$2 := $$c$2[4bv32];
    $$c$1[4bv32] := FADD32(v80$1, FMUL32(v78$1, v79$1));
    $$c$2[4bv32] := FADD32(v80$2, FMUL32(v78$2, v79$2));
    v81$1 := $$as$1[1bv32];
    v81$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 120} true;
    v82$1 := $$sgemmNT.bs[1bv1][21bv32];
    v82$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][21bv32];
    v83$1 := $$c$1[5bv32];
    v83$2 := $$c$2[5bv32];
    $$c$1[5bv32] := FADD32(v83$1, FMUL32(v81$1, v82$1));
    $$c$2[5bv32] := FADD32(v83$2, FMUL32(v81$2, v82$2));
    v84$1 := $$as$1[1bv32];
    v84$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 124} true;
    v85$1 := $$sgemmNT.bs[1bv1][22bv32];
    v85$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][22bv32];
    v86$1 := $$c$1[6bv32];
    v86$2 := $$c$2[6bv32];
    $$c$1[6bv32] := FADD32(v86$1, FMUL32(v84$1, v85$1));
    $$c$2[6bv32] := FADD32(v86$2, FMUL32(v84$2, v85$2));
    v87$1 := $$as$1[1bv32];
    v87$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 128} true;
    v88$1 := $$sgemmNT.bs[1bv1][23bv32];
    v88$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][23bv32];
    v89$1 := $$c$1[7bv32];
    v89$2 := $$c$2[7bv32];
    $$c$1[7bv32] := FADD32(v89$1, FMUL32(v87$1, v88$1));
    $$c$2[7bv32] := FADD32(v89$2, FMUL32(v87$2, v88$2));
    v90$1 := $$as$1[1bv32];
    v90$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 132} true;
    v91$1 := $$sgemmNT.bs[1bv1][24bv32];
    v91$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][24bv32];
    v92$1 := $$c$1[8bv32];
    v92$2 := $$c$2[8bv32];
    $$c$1[8bv32] := FADD32(v92$1, FMUL32(v90$1, v91$1));
    $$c$2[8bv32] := FADD32(v92$2, FMUL32(v90$2, v91$2));
    v93$1 := $$as$1[1bv32];
    v93$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 136} true;
    v94$1 := $$sgemmNT.bs[1bv1][25bv32];
    v94$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][25bv32];
    v95$1 := $$c$1[9bv32];
    v95$2 := $$c$2[9bv32];
    $$c$1[9bv32] := FADD32(v95$1, FMUL32(v93$1, v94$1));
    $$c$2[9bv32] := FADD32(v95$2, FMUL32(v93$2, v94$2));
    v96$1 := $$as$1[1bv32];
    v96$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 140} true;
    v97$1 := $$sgemmNT.bs[1bv1][26bv32];
    v97$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][26bv32];
    v98$1 := $$c$1[10bv32];
    v98$2 := $$c$2[10bv32];
    $$c$1[10bv32] := FADD32(v98$1, FMUL32(v96$1, v97$1));
    $$c$2[10bv32] := FADD32(v98$2, FMUL32(v96$2, v97$2));
    v99$1 := $$as$1[1bv32];
    v99$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 144} true;
    v100$1 := $$sgemmNT.bs[1bv1][27bv32];
    v100$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][27bv32];
    v101$1 := $$c$1[11bv32];
    v101$2 := $$c$2[11bv32];
    $$c$1[11bv32] := FADD32(v101$1, FMUL32(v99$1, v100$1));
    $$c$2[11bv32] := FADD32(v101$2, FMUL32(v99$2, v100$2));
    v102$1 := $$as$1[1bv32];
    v102$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 148} true;
    v103$1 := $$sgemmNT.bs[1bv1][28bv32];
    v103$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][28bv32];
    v104$1 := $$c$1[12bv32];
    v104$2 := $$c$2[12bv32];
    $$c$1[12bv32] := FADD32(v104$1, FMUL32(v102$1, v103$1));
    $$c$2[12bv32] := FADD32(v104$2, FMUL32(v102$2, v103$2));
    v105$1 := $$as$1[1bv32];
    v105$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 152} true;
    v106$1 := $$sgemmNT.bs[1bv1][29bv32];
    v106$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][29bv32];
    v107$1 := $$c$1[13bv32];
    v107$2 := $$c$2[13bv32];
    $$c$1[13bv32] := FADD32(v107$1, FMUL32(v105$1, v106$1));
    $$c$2[13bv32] := FADD32(v107$2, FMUL32(v105$2, v106$2));
    v108$1 := $$as$1[1bv32];
    v108$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 156} true;
    v109$1 := $$sgemmNT.bs[1bv1][30bv32];
    v109$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][30bv32];
    v110$1 := $$c$1[14bv32];
    v110$2 := $$c$2[14bv32];
    $$c$1[14bv32] := FADD32(v110$1, FMUL32(v108$1, v109$1));
    $$c$2[14bv32] := FADD32(v110$2, FMUL32(v108$2, v109$2));
    v111$1 := $$as$1[1bv32];
    v111$2 := $$as$2[1bv32];
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 160} true;
    v112$1 := $$sgemmNT.bs[1bv1][31bv32];
    v112$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][31bv32];
    v113$1 := $$c$1[15bv32];
    v113$2 := $$c$2[15bv32];
    $$c$1[15bv32] := FADD32(v113$1, FMUL32(v111$1, v112$1));
    $$c$2[15bv32] := FADD32(v113$2, FMUL32(v111$2, v112$2));
    v114$1 := $$as$1[2bv32];
    v114$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 166} true;
    v115$1 := $$sgemmNT.bs[1bv1][32bv32];
    v115$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][32bv32];
    v116$1 := $$c$1[0bv32];
    v116$2 := $$c$2[0bv32];
    $$c$1[0bv32] := FADD32(v116$1, FMUL32(v114$1, v115$1));
    $$c$2[0bv32] := FADD32(v116$2, FMUL32(v114$2, v115$2));
    v117$1 := $$as$1[2bv32];
    v117$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 170} true;
    v118$1 := $$sgemmNT.bs[1bv1][33bv32];
    v118$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][33bv32];
    v119$1 := $$c$1[1bv32];
    v119$2 := $$c$2[1bv32];
    $$c$1[1bv32] := FADD32(v119$1, FMUL32(v117$1, v118$1));
    $$c$2[1bv32] := FADD32(v119$2, FMUL32(v117$2, v118$2));
    v120$1 := $$as$1[2bv32];
    v120$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 174} true;
    v121$1 := $$sgemmNT.bs[1bv1][34bv32];
    v121$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][34bv32];
    v122$1 := $$c$1[2bv32];
    v122$2 := $$c$2[2bv32];
    $$c$1[2bv32] := FADD32(v122$1, FMUL32(v120$1, v121$1));
    $$c$2[2bv32] := FADD32(v122$2, FMUL32(v120$2, v121$2));
    v123$1 := $$as$1[2bv32];
    v123$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 178} true;
    v124$1 := $$sgemmNT.bs[1bv1][35bv32];
    v124$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][35bv32];
    v125$1 := $$c$1[3bv32];
    v125$2 := $$c$2[3bv32];
    $$c$1[3bv32] := FADD32(v125$1, FMUL32(v123$1, v124$1));
    $$c$2[3bv32] := FADD32(v125$2, FMUL32(v123$2, v124$2));
    v126$1 := $$as$1[2bv32];
    v126$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 182} true;
    v127$1 := $$sgemmNT.bs[1bv1][36bv32];
    v127$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][36bv32];
    v128$1 := $$c$1[4bv32];
    v128$2 := $$c$2[4bv32];
    $$c$1[4bv32] := FADD32(v128$1, FMUL32(v126$1, v127$1));
    $$c$2[4bv32] := FADD32(v128$2, FMUL32(v126$2, v127$2));
    v129$1 := $$as$1[2bv32];
    v129$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 186} true;
    v130$1 := $$sgemmNT.bs[1bv1][37bv32];
    v130$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][37bv32];
    v131$1 := $$c$1[5bv32];
    v131$2 := $$c$2[5bv32];
    $$c$1[5bv32] := FADD32(v131$1, FMUL32(v129$1, v130$1));
    $$c$2[5bv32] := FADD32(v131$2, FMUL32(v129$2, v130$2));
    v132$1 := $$as$1[2bv32];
    v132$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 190} true;
    v133$1 := $$sgemmNT.bs[1bv1][38bv32];
    v133$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][38bv32];
    v134$1 := $$c$1[6bv32];
    v134$2 := $$c$2[6bv32];
    $$c$1[6bv32] := FADD32(v134$1, FMUL32(v132$1, v133$1));
    $$c$2[6bv32] := FADD32(v134$2, FMUL32(v132$2, v133$2));
    v135$1 := $$as$1[2bv32];
    v135$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 194} true;
    v136$1 := $$sgemmNT.bs[1bv1][39bv32];
    v136$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][39bv32];
    v137$1 := $$c$1[7bv32];
    v137$2 := $$c$2[7bv32];
    $$c$1[7bv32] := FADD32(v137$1, FMUL32(v135$1, v136$1));
    $$c$2[7bv32] := FADD32(v137$2, FMUL32(v135$2, v136$2));
    v138$1 := $$as$1[2bv32];
    v138$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 198} true;
    v139$1 := $$sgemmNT.bs[1bv1][40bv32];
    v139$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][40bv32];
    v140$1 := $$c$1[8bv32];
    v140$2 := $$c$2[8bv32];
    $$c$1[8bv32] := FADD32(v140$1, FMUL32(v138$1, v139$1));
    $$c$2[8bv32] := FADD32(v140$2, FMUL32(v138$2, v139$2));
    v141$1 := $$as$1[2bv32];
    v141$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 202} true;
    v142$1 := $$sgemmNT.bs[1bv1][41bv32];
    v142$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][41bv32];
    v143$1 := $$c$1[9bv32];
    v143$2 := $$c$2[9bv32];
    $$c$1[9bv32] := FADD32(v143$1, FMUL32(v141$1, v142$1));
    $$c$2[9bv32] := FADD32(v143$2, FMUL32(v141$2, v142$2));
    v144$1 := $$as$1[2bv32];
    v144$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 206} true;
    v145$1 := $$sgemmNT.bs[1bv1][42bv32];
    v145$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][42bv32];
    v146$1 := $$c$1[10bv32];
    v146$2 := $$c$2[10bv32];
    $$c$1[10bv32] := FADD32(v146$1, FMUL32(v144$1, v145$1));
    $$c$2[10bv32] := FADD32(v146$2, FMUL32(v144$2, v145$2));
    v147$1 := $$as$1[2bv32];
    v147$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 210} true;
    v148$1 := $$sgemmNT.bs[1bv1][43bv32];
    v148$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][43bv32];
    v149$1 := $$c$1[11bv32];
    v149$2 := $$c$2[11bv32];
    $$c$1[11bv32] := FADD32(v149$1, FMUL32(v147$1, v148$1));
    $$c$2[11bv32] := FADD32(v149$2, FMUL32(v147$2, v148$2));
    v150$1 := $$as$1[2bv32];
    v150$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 214} true;
    v151$1 := $$sgemmNT.bs[1bv1][44bv32];
    v151$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][44bv32];
    v152$1 := $$c$1[12bv32];
    v152$2 := $$c$2[12bv32];
    $$c$1[12bv32] := FADD32(v152$1, FMUL32(v150$1, v151$1));
    $$c$2[12bv32] := FADD32(v152$2, FMUL32(v150$2, v151$2));
    v153$1 := $$as$1[2bv32];
    v153$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 218} true;
    v154$1 := $$sgemmNT.bs[1bv1][45bv32];
    v154$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][45bv32];
    v155$1 := $$c$1[13bv32];
    v155$2 := $$c$2[13bv32];
    $$c$1[13bv32] := FADD32(v155$1, FMUL32(v153$1, v154$1));
    $$c$2[13bv32] := FADD32(v155$2, FMUL32(v153$2, v154$2));
    v156$1 := $$as$1[2bv32];
    v156$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 222} true;
    v157$1 := $$sgemmNT.bs[1bv1][46bv32];
    v157$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][46bv32];
    v158$1 := $$c$1[14bv32];
    v158$2 := $$c$2[14bv32];
    $$c$1[14bv32] := FADD32(v158$1, FMUL32(v156$1, v157$1));
    $$c$2[14bv32] := FADD32(v158$2, FMUL32(v156$2, v157$2));
    v159$1 := $$as$1[2bv32];
    v159$2 := $$as$2[2bv32];
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 226} true;
    v160$1 := $$sgemmNT.bs[1bv1][47bv32];
    v160$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][47bv32];
    v161$1 := $$c$1[15bv32];
    v161$2 := $$c$2[15bv32];
    $$c$1[15bv32] := FADD32(v161$1, FMUL32(v159$1, v160$1));
    $$c$2[15bv32] := FADD32(v161$2, FMUL32(v159$2, v160$2));
    v162$1 := $$as$1[3bv32];
    v162$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 232} true;
    v163$1 := $$sgemmNT.bs[1bv1][48bv32];
    v163$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][48bv32];
    v164$1 := $$c$1[0bv32];
    v164$2 := $$c$2[0bv32];
    $$c$1[0bv32] := FADD32(v164$1, FMUL32(v162$1, v163$1));
    $$c$2[0bv32] := FADD32(v164$2, FMUL32(v162$2, v163$2));
    v165$1 := $$as$1[3bv32];
    v165$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 236} true;
    v166$1 := $$sgemmNT.bs[1bv1][49bv32];
    v166$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][49bv32];
    v167$1 := $$c$1[1bv32];
    v167$2 := $$c$2[1bv32];
    $$c$1[1bv32] := FADD32(v167$1, FMUL32(v165$1, v166$1));
    $$c$2[1bv32] := FADD32(v167$2, FMUL32(v165$2, v166$2));
    v168$1 := $$as$1[3bv32];
    v168$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 240} true;
    v169$1 := $$sgemmNT.bs[1bv1][50bv32];
    v169$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][50bv32];
    v170$1 := $$c$1[2bv32];
    v170$2 := $$c$2[2bv32];
    $$c$1[2bv32] := FADD32(v170$1, FMUL32(v168$1, v169$1));
    $$c$2[2bv32] := FADD32(v170$2, FMUL32(v168$2, v169$2));
    v171$1 := $$as$1[3bv32];
    v171$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 244} true;
    v172$1 := $$sgemmNT.bs[1bv1][51bv32];
    v172$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][51bv32];
    v173$1 := $$c$1[3bv32];
    v173$2 := $$c$2[3bv32];
    $$c$1[3bv32] := FADD32(v173$1, FMUL32(v171$1, v172$1));
    $$c$2[3bv32] := FADD32(v173$2, FMUL32(v171$2, v172$2));
    v174$1 := $$as$1[3bv32];
    v174$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 248} true;
    v175$1 := $$sgemmNT.bs[1bv1][52bv32];
    v175$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][52bv32];
    v176$1 := $$c$1[4bv32];
    v176$2 := $$c$2[4bv32];
    $$c$1[4bv32] := FADD32(v176$1, FMUL32(v174$1, v175$1));
    $$c$2[4bv32] := FADD32(v176$2, FMUL32(v174$2, v175$2));
    v177$1 := $$as$1[3bv32];
    v177$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 252} true;
    v178$1 := $$sgemmNT.bs[1bv1][53bv32];
    v178$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][53bv32];
    v179$1 := $$c$1[5bv32];
    v179$2 := $$c$2[5bv32];
    $$c$1[5bv32] := FADD32(v179$1, FMUL32(v177$1, v178$1));
    $$c$2[5bv32] := FADD32(v179$2, FMUL32(v177$2, v178$2));
    v180$1 := $$as$1[3bv32];
    v180$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 256} true;
    v181$1 := $$sgemmNT.bs[1bv1][54bv32];
    v181$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][54bv32];
    v182$1 := $$c$1[6bv32];
    v182$2 := $$c$2[6bv32];
    $$c$1[6bv32] := FADD32(v182$1, FMUL32(v180$1, v181$1));
    $$c$2[6bv32] := FADD32(v182$2, FMUL32(v180$2, v181$2));
    v183$1 := $$as$1[3bv32];
    v183$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_56"} {:captureState "check_state_56"} {:sourceloc} {:sourceloc_num 260} true;
    v184$1 := $$sgemmNT.bs[1bv1][55bv32];
    v184$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][55bv32];
    v185$1 := $$c$1[7bv32];
    v185$2 := $$c$2[7bv32];
    $$c$1[7bv32] := FADD32(v185$1, FMUL32(v183$1, v184$1));
    $$c$2[7bv32] := FADD32(v185$2, FMUL32(v183$2, v184$2));
    v186$1 := $$as$1[3bv32];
    v186$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_57"} {:captureState "check_state_57"} {:sourceloc} {:sourceloc_num 264} true;
    v187$1 := $$sgemmNT.bs[1bv1][56bv32];
    v187$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][56bv32];
    v188$1 := $$c$1[8bv32];
    v188$2 := $$c$2[8bv32];
    $$c$1[8bv32] := FADD32(v188$1, FMUL32(v186$1, v187$1));
    $$c$2[8bv32] := FADD32(v188$2, FMUL32(v186$2, v187$2));
    v189$1 := $$as$1[3bv32];
    v189$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_58"} {:captureState "check_state_58"} {:sourceloc} {:sourceloc_num 268} true;
    v190$1 := $$sgemmNT.bs[1bv1][57bv32];
    v190$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][57bv32];
    v191$1 := $$c$1[9bv32];
    v191$2 := $$c$2[9bv32];
    $$c$1[9bv32] := FADD32(v191$1, FMUL32(v189$1, v190$1));
    $$c$2[9bv32] := FADD32(v191$2, FMUL32(v189$2, v190$2));
    v192$1 := $$as$1[3bv32];
    v192$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_59"} {:captureState "check_state_59"} {:sourceloc} {:sourceloc_num 272} true;
    v193$1 := $$sgemmNT.bs[1bv1][58bv32];
    v193$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][58bv32];
    v194$1 := $$c$1[10bv32];
    v194$2 := $$c$2[10bv32];
    $$c$1[10bv32] := FADD32(v194$1, FMUL32(v192$1, v193$1));
    $$c$2[10bv32] := FADD32(v194$2, FMUL32(v192$2, v193$2));
    v195$1 := $$as$1[3bv32];
    v195$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_60"} {:captureState "check_state_60"} {:sourceloc} {:sourceloc_num 276} true;
    v196$1 := $$sgemmNT.bs[1bv1][59bv32];
    v196$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][59bv32];
    v197$1 := $$c$1[11bv32];
    v197$2 := $$c$2[11bv32];
    $$c$1[11bv32] := FADD32(v197$1, FMUL32(v195$1, v196$1));
    $$c$2[11bv32] := FADD32(v197$2, FMUL32(v195$2, v196$2));
    v198$1 := $$as$1[3bv32];
    v198$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_61"} {:captureState "check_state_61"} {:sourceloc} {:sourceloc_num 280} true;
    v199$1 := $$sgemmNT.bs[1bv1][60bv32];
    v199$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][60bv32];
    v200$1 := $$c$1[12bv32];
    v200$2 := $$c$2[12bv32];
    $$c$1[12bv32] := FADD32(v200$1, FMUL32(v198$1, v199$1));
    $$c$2[12bv32] := FADD32(v200$2, FMUL32(v198$2, v199$2));
    v201$1 := $$as$1[3bv32];
    v201$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_62"} {:captureState "check_state_62"} {:sourceloc} {:sourceloc_num 284} true;
    v202$1 := $$sgemmNT.bs[1bv1][61bv32];
    v202$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][61bv32];
    v203$1 := $$c$1[13bv32];
    v203$2 := $$c$2[13bv32];
    $$c$1[13bv32] := FADD32(v203$1, FMUL32(v201$1, v202$1));
    $$c$2[13bv32] := FADD32(v203$2, FMUL32(v201$2, v202$2));
    v204$1 := $$as$1[3bv32];
    v204$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_63"} {:captureState "check_state_63"} {:sourceloc} {:sourceloc_num 288} true;
    v205$1 := $$sgemmNT.bs[1bv1][62bv32];
    v205$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][62bv32];
    v206$1 := $$c$1[14bv32];
    v206$2 := $$c$2[14bv32];
    $$c$1[14bv32] := FADD32(v206$1, FMUL32(v204$1, v205$1));
    $$c$2[14bv32] := FADD32(v206$2, FMUL32(v204$2, v205$2));
    v207$1 := $$as$1[3bv32];
    v207$2 := $$as$2[3bv32];
    assume {:do_not_predicate} {:check_id "check_state_64"} {:captureState "check_state_64"} {:sourceloc} {:sourceloc_num 292} true;
    v208$1 := $$sgemmNT.bs[1bv1][63bv32];
    v208$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][63bv32];
    v209$1 := $$c$1[15bv32];
    v209$2 := $$c$2[15bv32];
    $$c$1[15bv32] := FADD32(v209$1, FMUL32(v207$1, v208$1));
    $$c$2[15bv32] := FADD32(v209$2, FMUL32(v207$2, v208$2));
    v210 := BV32_ADD($counter.0, BV32_MUL(4bv32, $ldb));
    goto __partitioned_block_$falsebb1_2;

  __partitioned_block_$falsebb1_2:
    call {:sourceloc_num 296} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    v211 := BV32_SLT(v210, BV32_MUL($k, $ldb));
    goto $truebb2, __partitioned_block_$falsebb2_0;

  __partitioned_block_$falsebb2_0:
    assume {:partition} !v211 && !v211;
    call {:sourceloc} {:sourceloc_num 299} _LOG_WRITE_$$sgemmNT.bs(true, BV32_ADD(BV32_MUL(v1$1, 16bv32), v0$1), v17$1, $$sgemmNT.bs[1bv1][BV32_ADD(BV32_MUL(v1$1, 16bv32), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sgemmNT.bs(true, BV32_ADD(BV32_MUL(v1$2, 16bv32), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_65"} {:captureState "check_state_65"} {:sourceloc} {:sourceloc_num 299} true;
    call {:check_id "check_state_65"} {:sourceloc} {:sourceloc_num 299} _CHECK_WRITE_$$sgemmNT.bs(true, BV32_ADD(BV32_MUL(v1$2, 16bv32), v0$2), v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sgemmNT.bs"} true;
    $$sgemmNT.bs[1bv1][BV32_ADD(BV32_MUL(v1$1, 16bv32), v0$1)] := v17$1;
    $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, 16bv32), v0$2)] := v17$2;
    goto __partitioned_block_$falsebb2_1;

  __partitioned_block_$falsebb2_1:
    call {:sourceloc_num 300} $bugle_barrier_duplicated_2(1bv1, 0bv1);
    v212$1 := $$a$1[0bv32];
    v212$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 303} _LOG_READ_$$sgemmNT.bs(true, 0bv32, $$sgemmNT.bs[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_66"} {:captureState "check_state_66"} {:sourceloc} {:sourceloc_num 303} true;
    call {:check_id "check_state_66"} {:sourceloc} {:sourceloc_num 303} _CHECK_READ_$$sgemmNT.bs(true, 0bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v213$1 := $$sgemmNT.bs[1bv1][0bv32];
    v213$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    v214$1 := $$c$1[0bv32];
    v214$2 := $$c$2[0bv32];
    $$c$1[0bv32] := FADD32(v214$1, FMUL32(v212$1, v213$1));
    $$c$2[0bv32] := FADD32(v214$2, FMUL32(v212$2, v213$2));
    v215$1 := $$a$1[0bv32];
    v215$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 307} _LOG_READ_$$sgemmNT.bs(true, 1bv32, $$sgemmNT.bs[1bv1][1bv32]);
    assume {:do_not_predicate} {:check_id "check_state_67"} {:captureState "check_state_67"} {:sourceloc} {:sourceloc_num 307} true;
    call {:check_id "check_state_67"} {:sourceloc} {:sourceloc_num 307} _CHECK_READ_$$sgemmNT.bs(true, 1bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v216$1 := $$sgemmNT.bs[1bv1][1bv32];
    v216$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32];
    v217$1 := $$c$1[1bv32];
    v217$2 := $$c$2[1bv32];
    $$c$1[1bv32] := FADD32(v217$1, FMUL32(v215$1, v216$1));
    $$c$2[1bv32] := FADD32(v217$2, FMUL32(v215$2, v216$2));
    v218$1 := $$a$1[0bv32];
    v218$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 311} _LOG_READ_$$sgemmNT.bs(true, 2bv32, $$sgemmNT.bs[1bv1][2bv32]);
    assume {:do_not_predicate} {:check_id "check_state_68"} {:captureState "check_state_68"} {:sourceloc} {:sourceloc_num 311} true;
    call {:check_id "check_state_68"} {:sourceloc} {:sourceloc_num 311} _CHECK_READ_$$sgemmNT.bs(true, 2bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v219$1 := $$sgemmNT.bs[1bv1][2bv32];
    v219$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][2bv32];
    v220$1 := $$c$1[2bv32];
    v220$2 := $$c$2[2bv32];
    $$c$1[2bv32] := FADD32(v220$1, FMUL32(v218$1, v219$1));
    $$c$2[2bv32] := FADD32(v220$2, FMUL32(v218$2, v219$2));
    v221$1 := $$a$1[0bv32];
    v221$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 315} _LOG_READ_$$sgemmNT.bs(true, 3bv32, $$sgemmNT.bs[1bv1][3bv32]);
    assume {:do_not_predicate} {:check_id "check_state_69"} {:captureState "check_state_69"} {:sourceloc} {:sourceloc_num 315} true;
    call {:check_id "check_state_69"} {:sourceloc} {:sourceloc_num 315} _CHECK_READ_$$sgemmNT.bs(true, 3bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v222$1 := $$sgemmNT.bs[1bv1][3bv32];
    v222$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][3bv32];
    v223$1 := $$c$1[3bv32];
    v223$2 := $$c$2[3bv32];
    $$c$1[3bv32] := FADD32(v223$1, FMUL32(v221$1, v222$1));
    $$c$2[3bv32] := FADD32(v223$2, FMUL32(v221$2, v222$2));
    v224$1 := $$a$1[0bv32];
    v224$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 319} _LOG_READ_$$sgemmNT.bs(true, 4bv32, $$sgemmNT.bs[1bv1][4bv32]);
    assume {:do_not_predicate} {:check_id "check_state_70"} {:captureState "check_state_70"} {:sourceloc} {:sourceloc_num 319} true;
    call {:check_id "check_state_70"} {:sourceloc} {:sourceloc_num 319} _CHECK_READ_$$sgemmNT.bs(true, 4bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][4bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v225$1 := $$sgemmNT.bs[1bv1][4bv32];
    v225$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][4bv32];
    v226$1 := $$c$1[4bv32];
    v226$2 := $$c$2[4bv32];
    $$c$1[4bv32] := FADD32(v226$1, FMUL32(v224$1, v225$1));
    $$c$2[4bv32] := FADD32(v226$2, FMUL32(v224$2, v225$2));
    v227$1 := $$a$1[0bv32];
    v227$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 323} _LOG_READ_$$sgemmNT.bs(true, 5bv32, $$sgemmNT.bs[1bv1][5bv32]);
    assume {:do_not_predicate} {:check_id "check_state_71"} {:captureState "check_state_71"} {:sourceloc} {:sourceloc_num 323} true;
    call {:check_id "check_state_71"} {:sourceloc} {:sourceloc_num 323} _CHECK_READ_$$sgemmNT.bs(true, 5bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][5bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v228$1 := $$sgemmNT.bs[1bv1][5bv32];
    v228$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][5bv32];
    v229$1 := $$c$1[5bv32];
    v229$2 := $$c$2[5bv32];
    $$c$1[5bv32] := FADD32(v229$1, FMUL32(v227$1, v228$1));
    $$c$2[5bv32] := FADD32(v229$2, FMUL32(v227$2, v228$2));
    v230$1 := $$a$1[0bv32];
    v230$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 327} _LOG_READ_$$sgemmNT.bs(true, 6bv32, $$sgemmNT.bs[1bv1][6bv32]);
    assume {:do_not_predicate} {:check_id "check_state_72"} {:captureState "check_state_72"} {:sourceloc} {:sourceloc_num 327} true;
    call {:check_id "check_state_72"} {:sourceloc} {:sourceloc_num 327} _CHECK_READ_$$sgemmNT.bs(true, 6bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][6bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v231$1 := $$sgemmNT.bs[1bv1][6bv32];
    v231$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][6bv32];
    v232$1 := $$c$1[6bv32];
    v232$2 := $$c$2[6bv32];
    $$c$1[6bv32] := FADD32(v232$1, FMUL32(v230$1, v231$1));
    $$c$2[6bv32] := FADD32(v232$2, FMUL32(v230$2, v231$2));
    v233$1 := $$a$1[0bv32];
    v233$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 331} _LOG_READ_$$sgemmNT.bs(true, 7bv32, $$sgemmNT.bs[1bv1][7bv32]);
    assume {:do_not_predicate} {:check_id "check_state_73"} {:captureState "check_state_73"} {:sourceloc} {:sourceloc_num 331} true;
    call {:check_id "check_state_73"} {:sourceloc} {:sourceloc_num 331} _CHECK_READ_$$sgemmNT.bs(true, 7bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][7bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v234$1 := $$sgemmNT.bs[1bv1][7bv32];
    v234$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][7bv32];
    v235$1 := $$c$1[7bv32];
    v235$2 := $$c$2[7bv32];
    $$c$1[7bv32] := FADD32(v235$1, FMUL32(v233$1, v234$1));
    $$c$2[7bv32] := FADD32(v235$2, FMUL32(v233$2, v234$2));
    v236$1 := $$a$1[0bv32];
    v236$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 335} _LOG_READ_$$sgemmNT.bs(true, 8bv32, $$sgemmNT.bs[1bv1][8bv32]);
    assume {:do_not_predicate} {:check_id "check_state_74"} {:captureState "check_state_74"} {:sourceloc} {:sourceloc_num 335} true;
    call {:check_id "check_state_74"} {:sourceloc} {:sourceloc_num 335} _CHECK_READ_$$sgemmNT.bs(true, 8bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][8bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v237$1 := $$sgemmNT.bs[1bv1][8bv32];
    v237$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][8bv32];
    v238$1 := $$c$1[8bv32];
    v238$2 := $$c$2[8bv32];
    $$c$1[8bv32] := FADD32(v238$1, FMUL32(v236$1, v237$1));
    $$c$2[8bv32] := FADD32(v238$2, FMUL32(v236$2, v237$2));
    v239$1 := $$a$1[0bv32];
    v239$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 339} _LOG_READ_$$sgemmNT.bs(true, 9bv32, $$sgemmNT.bs[1bv1][9bv32]);
    assume {:do_not_predicate} {:check_id "check_state_75"} {:captureState "check_state_75"} {:sourceloc} {:sourceloc_num 339} true;
    call {:check_id "check_state_75"} {:sourceloc} {:sourceloc_num 339} _CHECK_READ_$$sgemmNT.bs(true, 9bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][9bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v240$1 := $$sgemmNT.bs[1bv1][9bv32];
    v240$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][9bv32];
    v241$1 := $$c$1[9bv32];
    v241$2 := $$c$2[9bv32];
    $$c$1[9bv32] := FADD32(v241$1, FMUL32(v239$1, v240$1));
    $$c$2[9bv32] := FADD32(v241$2, FMUL32(v239$2, v240$2));
    v242$1 := $$a$1[0bv32];
    v242$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 343} _LOG_READ_$$sgemmNT.bs(true, 10bv32, $$sgemmNT.bs[1bv1][10bv32]);
    assume {:do_not_predicate} {:check_id "check_state_76"} {:captureState "check_state_76"} {:sourceloc} {:sourceloc_num 343} true;
    call {:check_id "check_state_76"} {:sourceloc} {:sourceloc_num 343} _CHECK_READ_$$sgemmNT.bs(true, 10bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][10bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v243$1 := $$sgemmNT.bs[1bv1][10bv32];
    v243$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][10bv32];
    v244$1 := $$c$1[10bv32];
    v244$2 := $$c$2[10bv32];
    $$c$1[10bv32] := FADD32(v244$1, FMUL32(v242$1, v243$1));
    $$c$2[10bv32] := FADD32(v244$2, FMUL32(v242$2, v243$2));
    v245$1 := $$a$1[0bv32];
    v245$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 347} _LOG_READ_$$sgemmNT.bs(true, 11bv32, $$sgemmNT.bs[1bv1][11bv32]);
    assume {:do_not_predicate} {:check_id "check_state_77"} {:captureState "check_state_77"} {:sourceloc} {:sourceloc_num 347} true;
    call {:check_id "check_state_77"} {:sourceloc} {:sourceloc_num 347} _CHECK_READ_$$sgemmNT.bs(true, 11bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][11bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v246$1 := $$sgemmNT.bs[1bv1][11bv32];
    v246$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][11bv32];
    v247$1 := $$c$1[11bv32];
    v247$2 := $$c$2[11bv32];
    $$c$1[11bv32] := FADD32(v247$1, FMUL32(v245$1, v246$1));
    $$c$2[11bv32] := FADD32(v247$2, FMUL32(v245$2, v246$2));
    v248$1 := $$a$1[0bv32];
    v248$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 351} _LOG_READ_$$sgemmNT.bs(true, 12bv32, $$sgemmNT.bs[1bv1][12bv32]);
    assume {:do_not_predicate} {:check_id "check_state_78"} {:captureState "check_state_78"} {:sourceloc} {:sourceloc_num 351} true;
    call {:check_id "check_state_78"} {:sourceloc} {:sourceloc_num 351} _CHECK_READ_$$sgemmNT.bs(true, 12bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][12bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v249$1 := $$sgemmNT.bs[1bv1][12bv32];
    v249$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][12bv32];
    v250$1 := $$c$1[12bv32];
    v250$2 := $$c$2[12bv32];
    $$c$1[12bv32] := FADD32(v250$1, FMUL32(v248$1, v249$1));
    $$c$2[12bv32] := FADD32(v250$2, FMUL32(v248$2, v249$2));
    v251$1 := $$a$1[0bv32];
    v251$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 355} _LOG_READ_$$sgemmNT.bs(true, 13bv32, $$sgemmNT.bs[1bv1][13bv32]);
    assume {:do_not_predicate} {:check_id "check_state_79"} {:captureState "check_state_79"} {:sourceloc} {:sourceloc_num 355} true;
    call {:check_id "check_state_79"} {:sourceloc} {:sourceloc_num 355} _CHECK_READ_$$sgemmNT.bs(true, 13bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][13bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v252$1 := $$sgemmNT.bs[1bv1][13bv32];
    v252$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][13bv32];
    v253$1 := $$c$1[13bv32];
    v253$2 := $$c$2[13bv32];
    $$c$1[13bv32] := FADD32(v253$1, FMUL32(v251$1, v252$1));
    $$c$2[13bv32] := FADD32(v253$2, FMUL32(v251$2, v252$2));
    v254$1 := $$a$1[0bv32];
    v254$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 359} _LOG_READ_$$sgemmNT.bs(true, 14bv32, $$sgemmNT.bs[1bv1][14bv32]);
    assume {:do_not_predicate} {:check_id "check_state_80"} {:captureState "check_state_80"} {:sourceloc} {:sourceloc_num 359} true;
    call {:check_id "check_state_80"} {:sourceloc} {:sourceloc_num 359} _CHECK_READ_$$sgemmNT.bs(true, 14bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][14bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v255$1 := $$sgemmNT.bs[1bv1][14bv32];
    v255$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][14bv32];
    v256$1 := $$c$1[14bv32];
    v256$2 := $$c$2[14bv32];
    $$c$1[14bv32] := FADD32(v256$1, FMUL32(v254$1, v255$1));
    $$c$2[14bv32] := FADD32(v256$2, FMUL32(v254$2, v255$2));
    v257$1 := $$a$1[0bv32];
    v257$2 := $$a$2[0bv32];
    call {:sourceloc} {:sourceloc_num 363} _LOG_READ_$$sgemmNT.bs(true, 15bv32, $$sgemmNT.bs[1bv1][15bv32]);
    assume {:do_not_predicate} {:check_id "check_state_81"} {:captureState "check_state_81"} {:sourceloc} {:sourceloc_num 363} true;
    call {:check_id "check_state_81"} {:sourceloc} {:sourceloc_num 363} _CHECK_READ_$$sgemmNT.bs(true, 15bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][15bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v258$1 := $$sgemmNT.bs[1bv1][15bv32];
    v258$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][15bv32];
    v259$1 := $$c$1[15bv32];
    v259$2 := $$c$2[15bv32];
    $$c$1[15bv32] := FADD32(v259$1, FMUL32(v257$1, v258$1));
    $$c$2[15bv32] := FADD32(v259$2, FMUL32(v257$2, v258$2));
    v260$1 := $$a$1[1bv32];
    v260$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 369} _LOG_READ_$$sgemmNT.bs(true, 16bv32, $$sgemmNT.bs[1bv1][16bv32]);
    assume {:do_not_predicate} {:check_id "check_state_82"} {:captureState "check_state_82"} {:sourceloc} {:sourceloc_num 369} true;
    call {:check_id "check_state_82"} {:sourceloc} {:sourceloc_num 369} _CHECK_READ_$$sgemmNT.bs(true, 16bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][16bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v261$1 := $$sgemmNT.bs[1bv1][16bv32];
    v261$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][16bv32];
    v262$1 := $$c$1[0bv32];
    v262$2 := $$c$2[0bv32];
    $$c$1[0bv32] := FADD32(v262$1, FMUL32(v260$1, v261$1));
    $$c$2[0bv32] := FADD32(v262$2, FMUL32(v260$2, v261$2));
    v263$1 := $$a$1[1bv32];
    v263$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 373} _LOG_READ_$$sgemmNT.bs(true, 17bv32, $$sgemmNT.bs[1bv1][17bv32]);
    assume {:do_not_predicate} {:check_id "check_state_83"} {:captureState "check_state_83"} {:sourceloc} {:sourceloc_num 373} true;
    call {:check_id "check_state_83"} {:sourceloc} {:sourceloc_num 373} _CHECK_READ_$$sgemmNT.bs(true, 17bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][17bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v264$1 := $$sgemmNT.bs[1bv1][17bv32];
    v264$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][17bv32];
    v265$1 := $$c$1[1bv32];
    v265$2 := $$c$2[1bv32];
    $$c$1[1bv32] := FADD32(v265$1, FMUL32(v263$1, v264$1));
    $$c$2[1bv32] := FADD32(v265$2, FMUL32(v263$2, v264$2));
    v266$1 := $$a$1[1bv32];
    v266$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 377} _LOG_READ_$$sgemmNT.bs(true, 18bv32, $$sgemmNT.bs[1bv1][18bv32]);
    assume {:do_not_predicate} {:check_id "check_state_84"} {:captureState "check_state_84"} {:sourceloc} {:sourceloc_num 377} true;
    call {:check_id "check_state_84"} {:sourceloc} {:sourceloc_num 377} _CHECK_READ_$$sgemmNT.bs(true, 18bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][18bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v267$1 := $$sgemmNT.bs[1bv1][18bv32];
    v267$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][18bv32];
    v268$1 := $$c$1[2bv32];
    v268$2 := $$c$2[2bv32];
    $$c$1[2bv32] := FADD32(v268$1, FMUL32(v266$1, v267$1));
    $$c$2[2bv32] := FADD32(v268$2, FMUL32(v266$2, v267$2));
    v269$1 := $$a$1[1bv32];
    v269$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 381} _LOG_READ_$$sgemmNT.bs(true, 19bv32, $$sgemmNT.bs[1bv1][19bv32]);
    assume {:do_not_predicate} {:check_id "check_state_85"} {:captureState "check_state_85"} {:sourceloc} {:sourceloc_num 381} true;
    call {:check_id "check_state_85"} {:sourceloc} {:sourceloc_num 381} _CHECK_READ_$$sgemmNT.bs(true, 19bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][19bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v270$1 := $$sgemmNT.bs[1bv1][19bv32];
    v270$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][19bv32];
    v271$1 := $$c$1[3bv32];
    v271$2 := $$c$2[3bv32];
    $$c$1[3bv32] := FADD32(v271$1, FMUL32(v269$1, v270$1));
    $$c$2[3bv32] := FADD32(v271$2, FMUL32(v269$2, v270$2));
    v272$1 := $$a$1[1bv32];
    v272$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 385} _LOG_READ_$$sgemmNT.bs(true, 20bv32, $$sgemmNT.bs[1bv1][20bv32]);
    assume {:do_not_predicate} {:check_id "check_state_86"} {:captureState "check_state_86"} {:sourceloc} {:sourceloc_num 385} true;
    call {:check_id "check_state_86"} {:sourceloc} {:sourceloc_num 385} _CHECK_READ_$$sgemmNT.bs(true, 20bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][20bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v273$1 := $$sgemmNT.bs[1bv1][20bv32];
    v273$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][20bv32];
    v274$1 := $$c$1[4bv32];
    v274$2 := $$c$2[4bv32];
    $$c$1[4bv32] := FADD32(v274$1, FMUL32(v272$1, v273$1));
    $$c$2[4bv32] := FADD32(v274$2, FMUL32(v272$2, v273$2));
    v275$1 := $$a$1[1bv32];
    v275$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 389} _LOG_READ_$$sgemmNT.bs(true, 21bv32, $$sgemmNT.bs[1bv1][21bv32]);
    assume {:do_not_predicate} {:check_id "check_state_87"} {:captureState "check_state_87"} {:sourceloc} {:sourceloc_num 389} true;
    call {:check_id "check_state_87"} {:sourceloc} {:sourceloc_num 389} _CHECK_READ_$$sgemmNT.bs(true, 21bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][21bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v276$1 := $$sgemmNT.bs[1bv1][21bv32];
    v276$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][21bv32];
    v277$1 := $$c$1[5bv32];
    v277$2 := $$c$2[5bv32];
    $$c$1[5bv32] := FADD32(v277$1, FMUL32(v275$1, v276$1));
    $$c$2[5bv32] := FADD32(v277$2, FMUL32(v275$2, v276$2));
    v278$1 := $$a$1[1bv32];
    v278$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 393} _LOG_READ_$$sgemmNT.bs(true, 22bv32, $$sgemmNT.bs[1bv1][22bv32]);
    assume {:do_not_predicate} {:check_id "check_state_88"} {:captureState "check_state_88"} {:sourceloc} {:sourceloc_num 393} true;
    call {:check_id "check_state_88"} {:sourceloc} {:sourceloc_num 393} _CHECK_READ_$$sgemmNT.bs(true, 22bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][22bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v279$1 := $$sgemmNT.bs[1bv1][22bv32];
    v279$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][22bv32];
    v280$1 := $$c$1[6bv32];
    v280$2 := $$c$2[6bv32];
    $$c$1[6bv32] := FADD32(v280$1, FMUL32(v278$1, v279$1));
    $$c$2[6bv32] := FADD32(v280$2, FMUL32(v278$2, v279$2));
    v281$1 := $$a$1[1bv32];
    v281$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 397} _LOG_READ_$$sgemmNT.bs(true, 23bv32, $$sgemmNT.bs[1bv1][23bv32]);
    assume {:do_not_predicate} {:check_id "check_state_89"} {:captureState "check_state_89"} {:sourceloc} {:sourceloc_num 397} true;
    call {:check_id "check_state_89"} {:sourceloc} {:sourceloc_num 397} _CHECK_READ_$$sgemmNT.bs(true, 23bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][23bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v282$1 := $$sgemmNT.bs[1bv1][23bv32];
    v282$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][23bv32];
    v283$1 := $$c$1[7bv32];
    v283$2 := $$c$2[7bv32];
    $$c$1[7bv32] := FADD32(v283$1, FMUL32(v281$1, v282$1));
    $$c$2[7bv32] := FADD32(v283$2, FMUL32(v281$2, v282$2));
    v284$1 := $$a$1[1bv32];
    v284$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 401} _LOG_READ_$$sgemmNT.bs(true, 24bv32, $$sgemmNT.bs[1bv1][24bv32]);
    assume {:do_not_predicate} {:check_id "check_state_90"} {:captureState "check_state_90"} {:sourceloc} {:sourceloc_num 401} true;
    call {:check_id "check_state_90"} {:sourceloc} {:sourceloc_num 401} _CHECK_READ_$$sgemmNT.bs(true, 24bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][24bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v285$1 := $$sgemmNT.bs[1bv1][24bv32];
    v285$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][24bv32];
    v286$1 := $$c$1[8bv32];
    v286$2 := $$c$2[8bv32];
    $$c$1[8bv32] := FADD32(v286$1, FMUL32(v284$1, v285$1));
    $$c$2[8bv32] := FADD32(v286$2, FMUL32(v284$2, v285$2));
    v287$1 := $$a$1[1bv32];
    v287$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 405} _LOG_READ_$$sgemmNT.bs(true, 25bv32, $$sgemmNT.bs[1bv1][25bv32]);
    assume {:do_not_predicate} {:check_id "check_state_91"} {:captureState "check_state_91"} {:sourceloc} {:sourceloc_num 405} true;
    call {:check_id "check_state_91"} {:sourceloc} {:sourceloc_num 405} _CHECK_READ_$$sgemmNT.bs(true, 25bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][25bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v288$1 := $$sgemmNT.bs[1bv1][25bv32];
    v288$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][25bv32];
    v289$1 := $$c$1[9bv32];
    v289$2 := $$c$2[9bv32];
    $$c$1[9bv32] := FADD32(v289$1, FMUL32(v287$1, v288$1));
    $$c$2[9bv32] := FADD32(v289$2, FMUL32(v287$2, v288$2));
    v290$1 := $$a$1[1bv32];
    v290$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 409} _LOG_READ_$$sgemmNT.bs(true, 26bv32, $$sgemmNT.bs[1bv1][26bv32]);
    assume {:do_not_predicate} {:check_id "check_state_92"} {:captureState "check_state_92"} {:sourceloc} {:sourceloc_num 409} true;
    call {:check_id "check_state_92"} {:sourceloc} {:sourceloc_num 409} _CHECK_READ_$$sgemmNT.bs(true, 26bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][26bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v291$1 := $$sgemmNT.bs[1bv1][26bv32];
    v291$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][26bv32];
    v292$1 := $$c$1[10bv32];
    v292$2 := $$c$2[10bv32];
    $$c$1[10bv32] := FADD32(v292$1, FMUL32(v290$1, v291$1));
    $$c$2[10bv32] := FADD32(v292$2, FMUL32(v290$2, v291$2));
    v293$1 := $$a$1[1bv32];
    v293$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 413} _LOG_READ_$$sgemmNT.bs(true, 27bv32, $$sgemmNT.bs[1bv1][27bv32]);
    assume {:do_not_predicate} {:check_id "check_state_93"} {:captureState "check_state_93"} {:sourceloc} {:sourceloc_num 413} true;
    call {:check_id "check_state_93"} {:sourceloc} {:sourceloc_num 413} _CHECK_READ_$$sgemmNT.bs(true, 27bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][27bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v294$1 := $$sgemmNT.bs[1bv1][27bv32];
    v294$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][27bv32];
    v295$1 := $$c$1[11bv32];
    v295$2 := $$c$2[11bv32];
    $$c$1[11bv32] := FADD32(v295$1, FMUL32(v293$1, v294$1));
    $$c$2[11bv32] := FADD32(v295$2, FMUL32(v293$2, v294$2));
    v296$1 := $$a$1[1bv32];
    v296$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 417} _LOG_READ_$$sgemmNT.bs(true, 28bv32, $$sgemmNT.bs[1bv1][28bv32]);
    assume {:do_not_predicate} {:check_id "check_state_94"} {:captureState "check_state_94"} {:sourceloc} {:sourceloc_num 417} true;
    call {:check_id "check_state_94"} {:sourceloc} {:sourceloc_num 417} _CHECK_READ_$$sgemmNT.bs(true, 28bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][28bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v297$1 := $$sgemmNT.bs[1bv1][28bv32];
    v297$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][28bv32];
    v298$1 := $$c$1[12bv32];
    v298$2 := $$c$2[12bv32];
    $$c$1[12bv32] := FADD32(v298$1, FMUL32(v296$1, v297$1));
    $$c$2[12bv32] := FADD32(v298$2, FMUL32(v296$2, v297$2));
    v299$1 := $$a$1[1bv32];
    v299$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 421} _LOG_READ_$$sgemmNT.bs(true, 29bv32, $$sgemmNT.bs[1bv1][29bv32]);
    assume {:do_not_predicate} {:check_id "check_state_95"} {:captureState "check_state_95"} {:sourceloc} {:sourceloc_num 421} true;
    call {:check_id "check_state_95"} {:sourceloc} {:sourceloc_num 421} _CHECK_READ_$$sgemmNT.bs(true, 29bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][29bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v300$1 := $$sgemmNT.bs[1bv1][29bv32];
    v300$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][29bv32];
    v301$1 := $$c$1[13bv32];
    v301$2 := $$c$2[13bv32];
    $$c$1[13bv32] := FADD32(v301$1, FMUL32(v299$1, v300$1));
    $$c$2[13bv32] := FADD32(v301$2, FMUL32(v299$2, v300$2));
    v302$1 := $$a$1[1bv32];
    v302$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 425} _LOG_READ_$$sgemmNT.bs(true, 30bv32, $$sgemmNT.bs[1bv1][30bv32]);
    assume {:do_not_predicate} {:check_id "check_state_96"} {:captureState "check_state_96"} {:sourceloc} {:sourceloc_num 425} true;
    call {:check_id "check_state_96"} {:sourceloc} {:sourceloc_num 425} _CHECK_READ_$$sgemmNT.bs(true, 30bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][30bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v303$1 := $$sgemmNT.bs[1bv1][30bv32];
    v303$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][30bv32];
    v304$1 := $$c$1[14bv32];
    v304$2 := $$c$2[14bv32];
    $$c$1[14bv32] := FADD32(v304$1, FMUL32(v302$1, v303$1));
    $$c$2[14bv32] := FADD32(v304$2, FMUL32(v302$2, v303$2));
    v305$1 := $$a$1[1bv32];
    v305$2 := $$a$2[1bv32];
    call {:sourceloc} {:sourceloc_num 429} _LOG_READ_$$sgemmNT.bs(true, 31bv32, $$sgemmNT.bs[1bv1][31bv32]);
    assume {:do_not_predicate} {:check_id "check_state_97"} {:captureState "check_state_97"} {:sourceloc} {:sourceloc_num 429} true;
    call {:check_id "check_state_97"} {:sourceloc} {:sourceloc_num 429} _CHECK_READ_$$sgemmNT.bs(true, 31bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][31bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v306$1 := $$sgemmNT.bs[1bv1][31bv32];
    v306$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][31bv32];
    v307$1 := $$c$1[15bv32];
    v307$2 := $$c$2[15bv32];
    $$c$1[15bv32] := FADD32(v307$1, FMUL32(v305$1, v306$1));
    $$c$2[15bv32] := FADD32(v307$2, FMUL32(v305$2, v306$2));
    v308$1 := $$a$1[2bv32];
    v308$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 435} _LOG_READ_$$sgemmNT.bs(true, 32bv32, $$sgemmNT.bs[1bv1][32bv32]);
    assume {:do_not_predicate} {:check_id "check_state_98"} {:captureState "check_state_98"} {:sourceloc} {:sourceloc_num 435} true;
    call {:check_id "check_state_98"} {:sourceloc} {:sourceloc_num 435} _CHECK_READ_$$sgemmNT.bs(true, 32bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][32bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v309$1 := $$sgemmNT.bs[1bv1][32bv32];
    v309$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][32bv32];
    v310$1 := $$c$1[0bv32];
    v310$2 := $$c$2[0bv32];
    $$c$1[0bv32] := FADD32(v310$1, FMUL32(v308$1, v309$1));
    $$c$2[0bv32] := FADD32(v310$2, FMUL32(v308$2, v309$2));
    v311$1 := $$a$1[2bv32];
    v311$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 439} _LOG_READ_$$sgemmNT.bs(true, 33bv32, $$sgemmNT.bs[1bv1][33bv32]);
    assume {:do_not_predicate} {:check_id "check_state_99"} {:captureState "check_state_99"} {:sourceloc} {:sourceloc_num 439} true;
    call {:check_id "check_state_99"} {:sourceloc} {:sourceloc_num 439} _CHECK_READ_$$sgemmNT.bs(true, 33bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][33bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v312$1 := $$sgemmNT.bs[1bv1][33bv32];
    v312$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][33bv32];
    v313$1 := $$c$1[1bv32];
    v313$2 := $$c$2[1bv32];
    $$c$1[1bv32] := FADD32(v313$1, FMUL32(v311$1, v312$1));
    $$c$2[1bv32] := FADD32(v313$2, FMUL32(v311$2, v312$2));
    v314$1 := $$a$1[2bv32];
    v314$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 443} _LOG_READ_$$sgemmNT.bs(true, 34bv32, $$sgemmNT.bs[1bv1][34bv32]);
    assume {:do_not_predicate} {:check_id "check_state_100"} {:captureState "check_state_100"} {:sourceloc} {:sourceloc_num 443} true;
    call {:check_id "check_state_100"} {:sourceloc} {:sourceloc_num 443} _CHECK_READ_$$sgemmNT.bs(true, 34bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][34bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v315$1 := $$sgemmNT.bs[1bv1][34bv32];
    v315$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][34bv32];
    v316$1 := $$c$1[2bv32];
    v316$2 := $$c$2[2bv32];
    $$c$1[2bv32] := FADD32(v316$1, FMUL32(v314$1, v315$1));
    $$c$2[2bv32] := FADD32(v316$2, FMUL32(v314$2, v315$2));
    v317$1 := $$a$1[2bv32];
    v317$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 447} _LOG_READ_$$sgemmNT.bs(true, 35bv32, $$sgemmNT.bs[1bv1][35bv32]);
    assume {:do_not_predicate} {:check_id "check_state_101"} {:captureState "check_state_101"} {:sourceloc} {:sourceloc_num 447} true;
    call {:check_id "check_state_101"} {:sourceloc} {:sourceloc_num 447} _CHECK_READ_$$sgemmNT.bs(true, 35bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][35bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v318$1 := $$sgemmNT.bs[1bv1][35bv32];
    v318$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][35bv32];
    v319$1 := $$c$1[3bv32];
    v319$2 := $$c$2[3bv32];
    $$c$1[3bv32] := FADD32(v319$1, FMUL32(v317$1, v318$1));
    $$c$2[3bv32] := FADD32(v319$2, FMUL32(v317$2, v318$2));
    v320$1 := $$a$1[2bv32];
    v320$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 451} _LOG_READ_$$sgemmNT.bs(true, 36bv32, $$sgemmNT.bs[1bv1][36bv32]);
    assume {:do_not_predicate} {:check_id "check_state_102"} {:captureState "check_state_102"} {:sourceloc} {:sourceloc_num 451} true;
    call {:check_id "check_state_102"} {:sourceloc} {:sourceloc_num 451} _CHECK_READ_$$sgemmNT.bs(true, 36bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][36bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v321$1 := $$sgemmNT.bs[1bv1][36bv32];
    v321$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][36bv32];
    v322$1 := $$c$1[4bv32];
    v322$2 := $$c$2[4bv32];
    $$c$1[4bv32] := FADD32(v322$1, FMUL32(v320$1, v321$1));
    $$c$2[4bv32] := FADD32(v322$2, FMUL32(v320$2, v321$2));
    v323$1 := $$a$1[2bv32];
    v323$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 455} _LOG_READ_$$sgemmNT.bs(true, 37bv32, $$sgemmNT.bs[1bv1][37bv32]);
    assume {:do_not_predicate} {:check_id "check_state_103"} {:captureState "check_state_103"} {:sourceloc} {:sourceloc_num 455} true;
    call {:check_id "check_state_103"} {:sourceloc} {:sourceloc_num 455} _CHECK_READ_$$sgemmNT.bs(true, 37bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][37bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v324$1 := $$sgemmNT.bs[1bv1][37bv32];
    v324$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][37bv32];
    v325$1 := $$c$1[5bv32];
    v325$2 := $$c$2[5bv32];
    $$c$1[5bv32] := FADD32(v325$1, FMUL32(v323$1, v324$1));
    $$c$2[5bv32] := FADD32(v325$2, FMUL32(v323$2, v324$2));
    v326$1 := $$a$1[2bv32];
    v326$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 459} _LOG_READ_$$sgemmNT.bs(true, 38bv32, $$sgemmNT.bs[1bv1][38bv32]);
    assume {:do_not_predicate} {:check_id "check_state_104"} {:captureState "check_state_104"} {:sourceloc} {:sourceloc_num 459} true;
    call {:check_id "check_state_104"} {:sourceloc} {:sourceloc_num 459} _CHECK_READ_$$sgemmNT.bs(true, 38bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][38bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v327$1 := $$sgemmNT.bs[1bv1][38bv32];
    v327$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][38bv32];
    v328$1 := $$c$1[6bv32];
    v328$2 := $$c$2[6bv32];
    $$c$1[6bv32] := FADD32(v328$1, FMUL32(v326$1, v327$1));
    $$c$2[6bv32] := FADD32(v328$2, FMUL32(v326$2, v327$2));
    v329$1 := $$a$1[2bv32];
    v329$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 463} _LOG_READ_$$sgemmNT.bs(true, 39bv32, $$sgemmNT.bs[1bv1][39bv32]);
    assume {:do_not_predicate} {:check_id "check_state_105"} {:captureState "check_state_105"} {:sourceloc} {:sourceloc_num 463} true;
    call {:check_id "check_state_105"} {:sourceloc} {:sourceloc_num 463} _CHECK_READ_$$sgemmNT.bs(true, 39bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][39bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v330$1 := $$sgemmNT.bs[1bv1][39bv32];
    v330$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][39bv32];
    v331$1 := $$c$1[7bv32];
    v331$2 := $$c$2[7bv32];
    $$c$1[7bv32] := FADD32(v331$1, FMUL32(v329$1, v330$1));
    $$c$2[7bv32] := FADD32(v331$2, FMUL32(v329$2, v330$2));
    v332$1 := $$a$1[2bv32];
    v332$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 467} _LOG_READ_$$sgemmNT.bs(true, 40bv32, $$sgemmNT.bs[1bv1][40bv32]);
    assume {:do_not_predicate} {:check_id "check_state_106"} {:captureState "check_state_106"} {:sourceloc} {:sourceloc_num 467} true;
    call {:check_id "check_state_106"} {:sourceloc} {:sourceloc_num 467} _CHECK_READ_$$sgemmNT.bs(true, 40bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][40bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v333$1 := $$sgemmNT.bs[1bv1][40bv32];
    v333$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][40bv32];
    v334$1 := $$c$1[8bv32];
    v334$2 := $$c$2[8bv32];
    $$c$1[8bv32] := FADD32(v334$1, FMUL32(v332$1, v333$1));
    $$c$2[8bv32] := FADD32(v334$2, FMUL32(v332$2, v333$2));
    v335$1 := $$a$1[2bv32];
    v335$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 471} _LOG_READ_$$sgemmNT.bs(true, 41bv32, $$sgemmNT.bs[1bv1][41bv32]);
    assume {:do_not_predicate} {:check_id "check_state_107"} {:captureState "check_state_107"} {:sourceloc} {:sourceloc_num 471} true;
    call {:check_id "check_state_107"} {:sourceloc} {:sourceloc_num 471} _CHECK_READ_$$sgemmNT.bs(true, 41bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][41bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v336$1 := $$sgemmNT.bs[1bv1][41bv32];
    v336$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][41bv32];
    v337$1 := $$c$1[9bv32];
    v337$2 := $$c$2[9bv32];
    $$c$1[9bv32] := FADD32(v337$1, FMUL32(v335$1, v336$1));
    $$c$2[9bv32] := FADD32(v337$2, FMUL32(v335$2, v336$2));
    v338$1 := $$a$1[2bv32];
    v338$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 475} _LOG_READ_$$sgemmNT.bs(true, 42bv32, $$sgemmNT.bs[1bv1][42bv32]);
    assume {:do_not_predicate} {:check_id "check_state_108"} {:captureState "check_state_108"} {:sourceloc} {:sourceloc_num 475} true;
    call {:check_id "check_state_108"} {:sourceloc} {:sourceloc_num 475} _CHECK_READ_$$sgemmNT.bs(true, 42bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][42bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v339$1 := $$sgemmNT.bs[1bv1][42bv32];
    v339$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][42bv32];
    v340$1 := $$c$1[10bv32];
    v340$2 := $$c$2[10bv32];
    $$c$1[10bv32] := FADD32(v340$1, FMUL32(v338$1, v339$1));
    $$c$2[10bv32] := FADD32(v340$2, FMUL32(v338$2, v339$2));
    v341$1 := $$a$1[2bv32];
    v341$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 479} _LOG_READ_$$sgemmNT.bs(true, 43bv32, $$sgemmNT.bs[1bv1][43bv32]);
    assume {:do_not_predicate} {:check_id "check_state_109"} {:captureState "check_state_109"} {:sourceloc} {:sourceloc_num 479} true;
    call {:check_id "check_state_109"} {:sourceloc} {:sourceloc_num 479} _CHECK_READ_$$sgemmNT.bs(true, 43bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][43bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v342$1 := $$sgemmNT.bs[1bv1][43bv32];
    v342$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][43bv32];
    v343$1 := $$c$1[11bv32];
    v343$2 := $$c$2[11bv32];
    $$c$1[11bv32] := FADD32(v343$1, FMUL32(v341$1, v342$1));
    $$c$2[11bv32] := FADD32(v343$2, FMUL32(v341$2, v342$2));
    v344$1 := $$a$1[2bv32];
    v344$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 483} _LOG_READ_$$sgemmNT.bs(true, 44bv32, $$sgemmNT.bs[1bv1][44bv32]);
    assume {:do_not_predicate} {:check_id "check_state_110"} {:captureState "check_state_110"} {:sourceloc} {:sourceloc_num 483} true;
    call {:check_id "check_state_110"} {:sourceloc} {:sourceloc_num 483} _CHECK_READ_$$sgemmNT.bs(true, 44bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][44bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v345$1 := $$sgemmNT.bs[1bv1][44bv32];
    v345$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][44bv32];
    v346$1 := $$c$1[12bv32];
    v346$2 := $$c$2[12bv32];
    $$c$1[12bv32] := FADD32(v346$1, FMUL32(v344$1, v345$1));
    $$c$2[12bv32] := FADD32(v346$2, FMUL32(v344$2, v345$2));
    v347$1 := $$a$1[2bv32];
    v347$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 487} _LOG_READ_$$sgemmNT.bs(true, 45bv32, $$sgemmNT.bs[1bv1][45bv32]);
    assume {:do_not_predicate} {:check_id "check_state_111"} {:captureState "check_state_111"} {:sourceloc} {:sourceloc_num 487} true;
    call {:check_id "check_state_111"} {:sourceloc} {:sourceloc_num 487} _CHECK_READ_$$sgemmNT.bs(true, 45bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][45bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v348$1 := $$sgemmNT.bs[1bv1][45bv32];
    v348$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][45bv32];
    v349$1 := $$c$1[13bv32];
    v349$2 := $$c$2[13bv32];
    $$c$1[13bv32] := FADD32(v349$1, FMUL32(v347$1, v348$1));
    $$c$2[13bv32] := FADD32(v349$2, FMUL32(v347$2, v348$2));
    v350$1 := $$a$1[2bv32];
    v350$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 491} _LOG_READ_$$sgemmNT.bs(true, 46bv32, $$sgemmNT.bs[1bv1][46bv32]);
    assume {:do_not_predicate} {:check_id "check_state_112"} {:captureState "check_state_112"} {:sourceloc} {:sourceloc_num 491} true;
    call {:check_id "check_state_112"} {:sourceloc} {:sourceloc_num 491} _CHECK_READ_$$sgemmNT.bs(true, 46bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][46bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v351$1 := $$sgemmNT.bs[1bv1][46bv32];
    v351$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][46bv32];
    v352$1 := $$c$1[14bv32];
    v352$2 := $$c$2[14bv32];
    $$c$1[14bv32] := FADD32(v352$1, FMUL32(v350$1, v351$1));
    $$c$2[14bv32] := FADD32(v352$2, FMUL32(v350$2, v351$2));
    v353$1 := $$a$1[2bv32];
    v353$2 := $$a$2[2bv32];
    call {:sourceloc} {:sourceloc_num 495} _LOG_READ_$$sgemmNT.bs(true, 47bv32, $$sgemmNT.bs[1bv1][47bv32]);
    assume {:do_not_predicate} {:check_id "check_state_113"} {:captureState "check_state_113"} {:sourceloc} {:sourceloc_num 495} true;
    call {:check_id "check_state_113"} {:sourceloc} {:sourceloc_num 495} _CHECK_READ_$$sgemmNT.bs(true, 47bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][47bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v354$1 := $$sgemmNT.bs[1bv1][47bv32];
    v354$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][47bv32];
    v355$1 := $$c$1[15bv32];
    v355$2 := $$c$2[15bv32];
    $$c$1[15bv32] := FADD32(v355$1, FMUL32(v353$1, v354$1));
    $$c$2[15bv32] := FADD32(v355$2, FMUL32(v353$2, v354$2));
    v356$1 := $$a$1[3bv32];
    v356$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 501} _LOG_READ_$$sgemmNT.bs(true, 48bv32, $$sgemmNT.bs[1bv1][48bv32]);
    assume {:do_not_predicate} {:check_id "check_state_114"} {:captureState "check_state_114"} {:sourceloc} {:sourceloc_num 501} true;
    call {:check_id "check_state_114"} {:sourceloc} {:sourceloc_num 501} _CHECK_READ_$$sgemmNT.bs(true, 48bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][48bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v357$1 := $$sgemmNT.bs[1bv1][48bv32];
    v357$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][48bv32];
    v358$1 := $$c$1[0bv32];
    v358$2 := $$c$2[0bv32];
    $$c$1[0bv32] := FADD32(v358$1, FMUL32(v356$1, v357$1));
    $$c$2[0bv32] := FADD32(v358$2, FMUL32(v356$2, v357$2));
    v359$1 := $$a$1[3bv32];
    v359$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 505} _LOG_READ_$$sgemmNT.bs(true, 49bv32, $$sgemmNT.bs[1bv1][49bv32]);
    assume {:do_not_predicate} {:check_id "check_state_115"} {:captureState "check_state_115"} {:sourceloc} {:sourceloc_num 505} true;
    call {:check_id "check_state_115"} {:sourceloc} {:sourceloc_num 505} _CHECK_READ_$$sgemmNT.bs(true, 49bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][49bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v360$1 := $$sgemmNT.bs[1bv1][49bv32];
    v360$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][49bv32];
    v361$1 := $$c$1[1bv32];
    v361$2 := $$c$2[1bv32];
    $$c$1[1bv32] := FADD32(v361$1, FMUL32(v359$1, v360$1));
    $$c$2[1bv32] := FADD32(v361$2, FMUL32(v359$2, v360$2));
    v362$1 := $$a$1[3bv32];
    v362$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 509} _LOG_READ_$$sgemmNT.bs(true, 50bv32, $$sgemmNT.bs[1bv1][50bv32]);
    assume {:do_not_predicate} {:check_id "check_state_116"} {:captureState "check_state_116"} {:sourceloc} {:sourceloc_num 509} true;
    call {:check_id "check_state_116"} {:sourceloc} {:sourceloc_num 509} _CHECK_READ_$$sgemmNT.bs(true, 50bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][50bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v363$1 := $$sgemmNT.bs[1bv1][50bv32];
    v363$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][50bv32];
    v364$1 := $$c$1[2bv32];
    v364$2 := $$c$2[2bv32];
    $$c$1[2bv32] := FADD32(v364$1, FMUL32(v362$1, v363$1));
    $$c$2[2bv32] := FADD32(v364$2, FMUL32(v362$2, v363$2));
    v365$1 := $$a$1[3bv32];
    v365$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 513} _LOG_READ_$$sgemmNT.bs(true, 51bv32, $$sgemmNT.bs[1bv1][51bv32]);
    assume {:do_not_predicate} {:check_id "check_state_117"} {:captureState "check_state_117"} {:sourceloc} {:sourceloc_num 513} true;
    call {:check_id "check_state_117"} {:sourceloc} {:sourceloc_num 513} _CHECK_READ_$$sgemmNT.bs(true, 51bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][51bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v366$1 := $$sgemmNT.bs[1bv1][51bv32];
    v366$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][51bv32];
    v367$1 := $$c$1[3bv32];
    v367$2 := $$c$2[3bv32];
    $$c$1[3bv32] := FADD32(v367$1, FMUL32(v365$1, v366$1));
    $$c$2[3bv32] := FADD32(v367$2, FMUL32(v365$2, v366$2));
    v368$1 := $$a$1[3bv32];
    v368$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 517} _LOG_READ_$$sgemmNT.bs(true, 52bv32, $$sgemmNT.bs[1bv1][52bv32]);
    assume {:do_not_predicate} {:check_id "check_state_118"} {:captureState "check_state_118"} {:sourceloc} {:sourceloc_num 517} true;
    call {:check_id "check_state_118"} {:sourceloc} {:sourceloc_num 517} _CHECK_READ_$$sgemmNT.bs(true, 52bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][52bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v369$1 := $$sgemmNT.bs[1bv1][52bv32];
    v369$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][52bv32];
    v370$1 := $$c$1[4bv32];
    v370$2 := $$c$2[4bv32];
    $$c$1[4bv32] := FADD32(v370$1, FMUL32(v368$1, v369$1));
    $$c$2[4bv32] := FADD32(v370$2, FMUL32(v368$2, v369$2));
    v371$1 := $$a$1[3bv32];
    v371$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 521} _LOG_READ_$$sgemmNT.bs(true, 53bv32, $$sgemmNT.bs[1bv1][53bv32]);
    assume {:do_not_predicate} {:check_id "check_state_119"} {:captureState "check_state_119"} {:sourceloc} {:sourceloc_num 521} true;
    call {:check_id "check_state_119"} {:sourceloc} {:sourceloc_num 521} _CHECK_READ_$$sgemmNT.bs(true, 53bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][53bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v372$1 := $$sgemmNT.bs[1bv1][53bv32];
    v372$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][53bv32];
    v373$1 := $$c$1[5bv32];
    v373$2 := $$c$2[5bv32];
    $$c$1[5bv32] := FADD32(v373$1, FMUL32(v371$1, v372$1));
    $$c$2[5bv32] := FADD32(v373$2, FMUL32(v371$2, v372$2));
    v374$1 := $$a$1[3bv32];
    v374$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 525} _LOG_READ_$$sgemmNT.bs(true, 54bv32, $$sgemmNT.bs[1bv1][54bv32]);
    assume {:do_not_predicate} {:check_id "check_state_120"} {:captureState "check_state_120"} {:sourceloc} {:sourceloc_num 525} true;
    call {:check_id "check_state_120"} {:sourceloc} {:sourceloc_num 525} _CHECK_READ_$$sgemmNT.bs(true, 54bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][54bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v375$1 := $$sgemmNT.bs[1bv1][54bv32];
    v375$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][54bv32];
    v376$1 := $$c$1[6bv32];
    v376$2 := $$c$2[6bv32];
    $$c$1[6bv32] := FADD32(v376$1, FMUL32(v374$1, v375$1));
    $$c$2[6bv32] := FADD32(v376$2, FMUL32(v374$2, v375$2));
    v377$1 := $$a$1[3bv32];
    v377$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 529} _LOG_READ_$$sgemmNT.bs(true, 55bv32, $$sgemmNT.bs[1bv1][55bv32]);
    assume {:do_not_predicate} {:check_id "check_state_121"} {:captureState "check_state_121"} {:sourceloc} {:sourceloc_num 529} true;
    call {:check_id "check_state_121"} {:sourceloc} {:sourceloc_num 529} _CHECK_READ_$$sgemmNT.bs(true, 55bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][55bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v378$1 := $$sgemmNT.bs[1bv1][55bv32];
    v378$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][55bv32];
    v379$1 := $$c$1[7bv32];
    v379$2 := $$c$2[7bv32];
    $$c$1[7bv32] := FADD32(v379$1, FMUL32(v377$1, v378$1));
    $$c$2[7bv32] := FADD32(v379$2, FMUL32(v377$2, v378$2));
    v380$1 := $$a$1[3bv32];
    v380$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 533} _LOG_READ_$$sgemmNT.bs(true, 56bv32, $$sgemmNT.bs[1bv1][56bv32]);
    assume {:do_not_predicate} {:check_id "check_state_122"} {:captureState "check_state_122"} {:sourceloc} {:sourceloc_num 533} true;
    call {:check_id "check_state_122"} {:sourceloc} {:sourceloc_num 533} _CHECK_READ_$$sgemmNT.bs(true, 56bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][56bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v381$1 := $$sgemmNT.bs[1bv1][56bv32];
    v381$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][56bv32];
    v382$1 := $$c$1[8bv32];
    v382$2 := $$c$2[8bv32];
    $$c$1[8bv32] := FADD32(v382$1, FMUL32(v380$1, v381$1));
    $$c$2[8bv32] := FADD32(v382$2, FMUL32(v380$2, v381$2));
    v383$1 := $$a$1[3bv32];
    v383$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 537} _LOG_READ_$$sgemmNT.bs(true, 57bv32, $$sgemmNT.bs[1bv1][57bv32]);
    assume {:do_not_predicate} {:check_id "check_state_123"} {:captureState "check_state_123"} {:sourceloc} {:sourceloc_num 537} true;
    call {:check_id "check_state_123"} {:sourceloc} {:sourceloc_num 537} _CHECK_READ_$$sgemmNT.bs(true, 57bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][57bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v384$1 := $$sgemmNT.bs[1bv1][57bv32];
    v384$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][57bv32];
    v385$1 := $$c$1[9bv32];
    v385$2 := $$c$2[9bv32];
    $$c$1[9bv32] := FADD32(v385$1, FMUL32(v383$1, v384$1));
    $$c$2[9bv32] := FADD32(v385$2, FMUL32(v383$2, v384$2));
    v386$1 := $$a$1[3bv32];
    v386$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 541} _LOG_READ_$$sgemmNT.bs(true, 58bv32, $$sgemmNT.bs[1bv1][58bv32]);
    assume {:do_not_predicate} {:check_id "check_state_124"} {:captureState "check_state_124"} {:sourceloc} {:sourceloc_num 541} true;
    call {:check_id "check_state_124"} {:sourceloc} {:sourceloc_num 541} _CHECK_READ_$$sgemmNT.bs(true, 58bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][58bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v387$1 := $$sgemmNT.bs[1bv1][58bv32];
    v387$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][58bv32];
    v388$1 := $$c$1[10bv32];
    v388$2 := $$c$2[10bv32];
    $$c$1[10bv32] := FADD32(v388$1, FMUL32(v386$1, v387$1));
    $$c$2[10bv32] := FADD32(v388$2, FMUL32(v386$2, v387$2));
    v389$1 := $$a$1[3bv32];
    v389$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 545} _LOG_READ_$$sgemmNT.bs(true, 59bv32, $$sgemmNT.bs[1bv1][59bv32]);
    assume {:do_not_predicate} {:check_id "check_state_125"} {:captureState "check_state_125"} {:sourceloc} {:sourceloc_num 545} true;
    call {:check_id "check_state_125"} {:sourceloc} {:sourceloc_num 545} _CHECK_READ_$$sgemmNT.bs(true, 59bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][59bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v390$1 := $$sgemmNT.bs[1bv1][59bv32];
    v390$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][59bv32];
    v391$1 := $$c$1[11bv32];
    v391$2 := $$c$2[11bv32];
    $$c$1[11bv32] := FADD32(v391$1, FMUL32(v389$1, v390$1));
    $$c$2[11bv32] := FADD32(v391$2, FMUL32(v389$2, v390$2));
    v392$1 := $$a$1[3bv32];
    v392$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 549} _LOG_READ_$$sgemmNT.bs(true, 60bv32, $$sgemmNT.bs[1bv1][60bv32]);
    assume {:do_not_predicate} {:check_id "check_state_126"} {:captureState "check_state_126"} {:sourceloc} {:sourceloc_num 549} true;
    call {:check_id "check_state_126"} {:sourceloc} {:sourceloc_num 549} _CHECK_READ_$$sgemmNT.bs(true, 60bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][60bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v393$1 := $$sgemmNT.bs[1bv1][60bv32];
    v393$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][60bv32];
    v394$1 := $$c$1[12bv32];
    v394$2 := $$c$2[12bv32];
    $$c$1[12bv32] := FADD32(v394$1, FMUL32(v392$1, v393$1));
    $$c$2[12bv32] := FADD32(v394$2, FMUL32(v392$2, v393$2));
    v395$1 := $$a$1[3bv32];
    v395$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 553} _LOG_READ_$$sgemmNT.bs(true, 61bv32, $$sgemmNT.bs[1bv1][61bv32]);
    assume {:do_not_predicate} {:check_id "check_state_127"} {:captureState "check_state_127"} {:sourceloc} {:sourceloc_num 553} true;
    call {:check_id "check_state_127"} {:sourceloc} {:sourceloc_num 553} _CHECK_READ_$$sgemmNT.bs(true, 61bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][61bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v396$1 := $$sgemmNT.bs[1bv1][61bv32];
    v396$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][61bv32];
    v397$1 := $$c$1[13bv32];
    v397$2 := $$c$2[13bv32];
    $$c$1[13bv32] := FADD32(v397$1, FMUL32(v395$1, v396$1));
    $$c$2[13bv32] := FADD32(v397$2, FMUL32(v395$2, v396$2));
    v398$1 := $$a$1[3bv32];
    v398$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 557} _LOG_READ_$$sgemmNT.bs(true, 62bv32, $$sgemmNT.bs[1bv1][62bv32]);
    assume {:do_not_predicate} {:check_id "check_state_128"} {:captureState "check_state_128"} {:sourceloc} {:sourceloc_num 557} true;
    call {:check_id "check_state_128"} {:sourceloc} {:sourceloc_num 557} _CHECK_READ_$$sgemmNT.bs(true, 62bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][62bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v399$1 := $$sgemmNT.bs[1bv1][62bv32];
    v399$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][62bv32];
    v400$1 := $$c$1[14bv32];
    v400$2 := $$c$2[14bv32];
    $$c$1[14bv32] := FADD32(v400$1, FMUL32(v398$1, v399$1));
    $$c$2[14bv32] := FADD32(v400$2, FMUL32(v398$2, v399$2));
    v401$1 := $$a$1[3bv32];
    v401$2 := $$a$2[3bv32];
    call {:sourceloc} {:sourceloc_num 561} _LOG_READ_$$sgemmNT.bs(true, 63bv32, $$sgemmNT.bs[1bv1][63bv32]);
    assume {:do_not_predicate} {:check_id "check_state_129"} {:captureState "check_state_129"} {:sourceloc} {:sourceloc_num 561} true;
    call {:check_id "check_state_129"} {:sourceloc} {:sourceloc_num 561} _CHECK_READ_$$sgemmNT.bs(true, 63bv32, $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][63bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sgemmNT.bs"} true;
    v402$1 := $$sgemmNT.bs[1bv1][63bv32];
    v402$2 := $$sgemmNT.bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][63bv32];
    v403$1 := $$c$1[15bv32];
    v403$2 := $$c$2[15bv32];
    $$c$1[15bv32] := FADD32(v403$1, FMUL32(v401$1, v402$1));
    $$c$2[15bv32] := FADD32(v403$2, FMUL32(v401$2, v402$2));
    $.02$1, $i1.0 := BV32_ADD(BV32_ADD(v2$1, v4$1), BV32_MUL(v3$1, $ldc)), 0bv32;
    $.02$2 := BV32_ADD(BV32_ADD(v2$2, v4$2), BV32_MUL(v3$2, $ldc));
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $32;

  $32:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sgemmNT.bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b9 ==> BV32_UGE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b9 ==> BV32_UGE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_ULE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_ULE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b7 ==> BV32_SGE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b7 ==> BV32_SGE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b6 ==> BV32_SLE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b6 ==> BV32_SLE($i1.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b5 ==> BV32_SLE(0bv32, $i1.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b5 ==> BV32_SLE(0bv32, $i1.0);
    assert {:block_sourceloc} {:sourceloc_num 565} true;
    v404 := BV32_SLT($i1.0, 16bv32);
    goto $truebb3, $falsebb3;

  $falsebb3:
    assume {:partition} !v404 && !v404;
    return;

  $truebb3:
    assume {:partition} v404 && v404;
    v405$1 := $$c$1[$i1.0];
    v405$2 := $$c$2[$i1.0];
    call {:sourceloc} {:sourceloc_num 568} _LOG_READ_$$C(true, $.02$1, $$C[$.02$1]);
    assume {:do_not_predicate} {:check_id "check_state_130"} {:captureState "check_state_130"} {:sourceloc} {:sourceloc_num 568} true;
    call {:check_id "check_state_130"} {:sourceloc} {:sourceloc_num 568} _CHECK_READ_$$C(true, $.02$2, $$C[$.02$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$C"} true;
    v406$1 := $$C[$.02$1];
    v406$2 := $$C[$.02$2];
    call {:sourceloc} {:sourceloc_num 569} _LOG_WRITE_$$C(true, $.02$1, FADD32(FMUL32($alpha, v405$1), FMUL32($beta, v406$1)), $$C[$.02$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, $.02$2);
    assume {:do_not_predicate} {:check_id "check_state_131"} {:captureState "check_state_131"} {:sourceloc} {:sourceloc_num 569} true;
    call {:check_id "check_state_131"} {:sourceloc} {:sourceloc_num 569} _CHECK_WRITE_$$C(true, $.02$2, FADD32(FMUL32($alpha, v405$2), FMUL32($beta, v406$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[$.02$1] := FADD32(FMUL32($alpha, v405$1), FMUL32($beta, v406$1));
    $$C[$.02$2] := FADD32(FMUL32($alpha, v405$2), FMUL32($beta, v406$2));
    $.02$1, $i1.0 := BV32_ADD($.02$1, $ldc), BV32_ADD($i1.0, 1bv32);
    $.02$2 := BV32_ADD($.02$2, $ldc);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $32;

  $truebb2:
    assume {:partition} v211 && v211;
    $counter.0, $b.0$1, $.01$1, $.0$1 := v210, v17$1, BV32_ADD($.01$1, BV32_MUL(4bv32, $ldb)), BV32_ADD($.0$1, BV32_MUL(4bv32, $lda));
    $b.0$2, $.01$2, $.0$2 := v17$2, BV32_ADD($.01$2, BV32_MUL(4bv32, $ldb)), BV32_ADD($.0$2, BV32_MUL(4bv32, $lda));
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $9;

  $truebb1:
    assume {:partition} v11 && v11;
    v12$1 := $$a$1[$i.2];
    v12$2 := $$a$2[$i.2];
    $$as$1[$i.2] := v12$1;
    $$as$2[$i.2] := v12$2;
    $i.2 := BV32_ADD($i.2, 1bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $10;

  $truebb0:
    assume {:partition} v10 && v10;
    $$c$1[$i.1] := 0bv32;
    $$c$2[$i.1] := 0bv32;
    $i.1 := BV32_ADD($i.1, 1bv32);
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $5;

  $truebb:
    assume {:partition} v7 && v7;
    havoc v8$1, v8$2;
    $$a$1[$i.0] := v8$1;
    $$a$2[$i.0] := v8$2;
    $i.0 := BV32_ADD($i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_4_0"} true;
    goto $1;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$sgemmNT.bs, $$C, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$sgemmNT.bs, $$C, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$sgemmNT.bs, $$C, _TRACKING;



function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

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

const {:existential true} _b9: bool;

const _WATCHED_VALUE_$$A: bv32;

procedure {:inline 1} _LOG_READ_$$A(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$A;



implementation {:inline 1} _LOG_READ_$$A(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$A := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A == _value then true else _READ_HAS_OCCURRED_$$A);
    return;
}



procedure _CHECK_READ_$$A(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "A"} {:array "$$A"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$A);
  requires {:source_name "A"} {:array "$$A"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$A: bool;

procedure {:inline 1} _LOG_WRITE_$$A(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$A, _WRITE_READ_BENIGN_FLAG_$$A;



implementation {:inline 1} _LOG_WRITE_$$A(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$A := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A == _value then true else _WRITE_HAS_OCCURRED_$$A);
    _WRITE_READ_BENIGN_FLAG_$$A := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$A);
    return;
}



procedure _CHECK_WRITE_$$A(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "A"} {:array "$$A"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A != _value);
  requires {:source_name "A"} {:array "$$A"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A != _value);
  requires {:source_name "A"} {:array "$$A"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$A(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$A;



implementation {:inline 1} _LOG_ATOMIC_$$A(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$A := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$A);
    return;
}



procedure _CHECK_ATOMIC_$$A(_P: bool, _offset: bv32);
  requires {:source_name "A"} {:array "$$A"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset);
  requires {:source_name "A"} {:array "$$A"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$A(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$A;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$A(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$A := (if _P && _WRITE_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$A);
    return;
}



const _WATCHED_VALUE_$$B: bv32;

procedure {:inline 1} _LOG_READ_$$B(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$B;



implementation {:inline 1} _LOG_READ_$$B(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$B := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$B == _value then true else _READ_HAS_OCCURRED_$$B);
    return;
}



procedure _CHECK_READ_$$B(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "B"} {:array "$$B"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$B);
  requires {:source_name "B"} {:array "$$B"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$B: bool;

procedure {:inline 1} _LOG_WRITE_$$B(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$B, _WRITE_READ_BENIGN_FLAG_$$B;



implementation {:inline 1} _LOG_WRITE_$$B(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$B := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$B == _value then true else _WRITE_HAS_OCCURRED_$$B);
    _WRITE_READ_BENIGN_FLAG_$$B := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$B == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$B);
    return;
}



procedure _CHECK_WRITE_$$B(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "B"} {:array "$$B"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$B != _value);
  requires {:source_name "B"} {:array "$$B"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$B != _value);
  requires {:source_name "B"} {:array "$$B"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$B(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$B;



implementation {:inline 1} _LOG_ATOMIC_$$B(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$B := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$B);
    return;
}



procedure _CHECK_ATOMIC_$$B(_P: bool, _offset: bv32);
  requires {:source_name "B"} {:array "$$B"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset);
  requires {:source_name "B"} {:array "$$B"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$B(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$B;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$B(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$B := (if _P && _WRITE_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$B);
    return;
}



const _WATCHED_VALUE_$$C: bv32;

procedure {:inline 1} _LOG_READ_$$C(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$C;



implementation {:inline 1} _LOG_READ_$$C(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C == _value then true else _READ_HAS_OCCURRED_$$C);
    return;
}



procedure _CHECK_READ_$$C(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "C"} {:array "$$C"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$C);
  requires {:source_name "C"} {:array "$$C"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$C: bool;

procedure {:inline 1} _LOG_WRITE_$$C(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$C, _WRITE_READ_BENIGN_FLAG_$$C;



implementation {:inline 1} _LOG_WRITE_$$C(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C == _value then true else _WRITE_HAS_OCCURRED_$$C);
    _WRITE_READ_BENIGN_FLAG_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$C);
    return;
}



procedure _CHECK_WRITE_$$C(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "C"} {:array "$$C"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C != _value);
  requires {:source_name "C"} {:array "$$C"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C != _value);
  requires {:source_name "C"} {:array "$$C"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$C(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$C;



implementation {:inline 1} _LOG_ATOMIC_$$C(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$C);
    return;
}



procedure _CHECK_ATOMIC_$$C(_P: bool, _offset: bv32);
  requires {:source_name "C"} {:array "$$C"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);
  requires {:source_name "C"} {:array "$$C"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$C;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$C := (if _P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$C);
    return;
}



const _WATCHED_VALUE_$$sgemmNT.bs: bv32;

procedure {:inline 1} _LOG_READ_$$sgemmNT.bs(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$sgemmNT.bs;



implementation {:inline 1} _LOG_READ_$$sgemmNT.bs(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sgemmNT.bs := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sgemmNT.bs == _value then true else _READ_HAS_OCCURRED_$$sgemmNT.bs);
    return;
}



procedure _CHECK_READ_$$sgemmNT.bs(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "bs"} {:array "$$sgemmNT.bs"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sgemmNT.bs && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sgemmNT.bs && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "bs"} {:array "$$sgemmNT.bs"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sgemmNT.bs && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$sgemmNT.bs: bool;

procedure {:inline 1} _LOG_WRITE_$$sgemmNT.bs(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$sgemmNT.bs, _WRITE_READ_BENIGN_FLAG_$$sgemmNT.bs;



implementation {:inline 1} _LOG_WRITE_$$sgemmNT.bs(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sgemmNT.bs := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sgemmNT.bs == _value then true else _WRITE_HAS_OCCURRED_$$sgemmNT.bs);
    _WRITE_READ_BENIGN_FLAG_$$sgemmNT.bs := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sgemmNT.bs == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sgemmNT.bs);
    return;
}



procedure _CHECK_WRITE_$$sgemmNT.bs(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "bs"} {:array "$$sgemmNT.bs"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sgemmNT.bs && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sgemmNT.bs != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "bs"} {:array "$$sgemmNT.bs"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sgemmNT.bs && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sgemmNT.bs != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "bs"} {:array "$$sgemmNT.bs"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sgemmNT.bs && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$sgemmNT.bs(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sgemmNT.bs;



implementation {:inline 1} _LOG_ATOMIC_$$sgemmNT.bs(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sgemmNT.bs := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sgemmNT.bs);
    return;
}



procedure _CHECK_ATOMIC_$$sgemmNT.bs(_P: bool, _offset: bv32);
  requires {:source_name "bs"} {:array "$$sgemmNT.bs"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sgemmNT.bs && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "bs"} {:array "$$sgemmNT.bs"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sgemmNT.bs && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sgemmNT.bs(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sgemmNT.bs;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sgemmNT.bs(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sgemmNT.bs := (if _P && _WRITE_HAS_OCCURRED_$$sgemmNT.bs && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sgemmNT.bs);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sgemmNT.bs;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sgemmNT.bs;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sgemmNT.bs;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$C;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$C;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$C;
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
    havoc $$C;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$sgemmNT.bs;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sgemmNT.bs;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sgemmNT.bs;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sgemmNT.bs;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$C;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$C;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$C;
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
    havoc $$C;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$sgemmNT.bs;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sgemmNT.bs;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sgemmNT.bs;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sgemmNT.bs;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$C;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$C;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$C;
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
    havoc $$C;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$sgemmNT.bs;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b10: bool;

const {:existential true} _b11: bool;
