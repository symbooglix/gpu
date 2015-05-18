type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "d_output"} {:global} $$d_output: [bv32]bv32;

axiom {:array_info "$$d_output"} {:global} {:elem_width 32} {:source_name "d_output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_output: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_output: bool;

var {:source_name "d_temp"} {:global} $$d_temp: [bv32]bv32;

axiom {:array_info "$$d_temp"} {:global} {:elem_width 32} {:source_name "d_temp"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_temp: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_temp: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_temp: bool;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i9"} {:elem_width 32} {:source_name "a.i9"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i10"} {:elem_width 32} {:source_name "b.i10"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i8"} {:elem_width 32} {:source_name "a.i8"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i7"} {:elem_width 32} {:source_name "a.i7"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i6"} {:elem_width 32} {:source_name "a.i6"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$8"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$9"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i5"} {:elem_width 32} {:source_name "a.i5"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i"} {:elem_width 32} {:source_name "b.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$10"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$11"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i4"} {:elem_width 32} {:source_name "a.i4"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$12"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$13"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i3"} {:elem_width 32} {:source_name "a.i3"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$14"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$15"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i2"} {:elem_width 32} {:source_name "a.i2"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$16"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$17"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i.i"} {:elem_width 32} {:source_name "a.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i.i"} {:elem_width 32} {:source_name "b.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$R.i"} {:elem_width 32} {:source_name "R.i"} {:source_elem_width 192} {:source_dimensions "1"} true;

axiom {:array_info "$$C.i"} {:elem_width 32} {:source_name "C.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$L.i"} {:elem_width 32} {:source_name "L.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$18"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$19"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$20"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$21"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$22"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$23"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$24"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$25"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$26"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i1"} {:elem_width 32} {:source_name "a.i1"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$27"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$28"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i"} {:elem_width 32} {:source_name "a.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$29"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$rgba.i"} {:elem_width 32} {:source_name "rgba.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$M"} {:elem_width 32} {:source_name "M"} {:source_elem_width 384} {:source_dimensions "1"} true;

axiom {:array_info "$$R"} {:elem_width 32} {:source_name "R"} {:source_elem_width 192} {:source_dimensions "1"} true;

axiom {:array_info "$$30"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$31"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$32"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$33"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$34"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$35"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$36"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$37"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$38"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$39"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$40"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$41"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$42"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$43"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$44"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$45"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$s"} {:elem_width 8} {:source_name "s"} {:source_elem_width 256} {:source_dimensions "1"} true;

axiom {:array_info "$$46"} {:elem_width 32} {:source_name ""} {:source_elem_width 192} {:source_dimensions "1"} true;

axiom {:array_info "$$47"} {:elem_width 8} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$48"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

var {:source_name "MView"} {:constant} $$MView$1: [bv32]bv32;

var {:source_name "MView"} {:constant} $$MView$2: [bv32]bv32;

axiom {:array_info "$$MView"} {:constant} {:elem_width 32} {:source_name "MView"} {:source_elem_width 384} {:source_dimensions "1"} true;

var {:source_name "cnode"} {:constant} $$cnode$1: [bv32]bv8;

var {:source_name "cnode"} {:constant} $$cnode$2: [bv32]bv8;

axiom {:array_info "$$cnode"} {:constant} {:elem_width 8} {:source_name "cnode"} {:source_elem_width 320} {:source_dimensions "4"} true;

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

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function FADD32(bv32, bv32) : bv32;

function FDIV32(bv32, bv32) : bv32;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FP32_CONV64(bv32) : bv64;

function FP32_TO_UI32(bv32) : bv32;

function FP64_CONV32(bv64) : bv32;

function FSQRT64(bv64) : bv64;

function FSUB32(bv32, bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV32_OR(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

procedure {:source_name "rayCast"} {:kernel} $_Z7rayCastPjS_jjff($imageW: bv32, $imageH: bv32, $pas: bv32, $df: bv32);
  requires !_READ_HAS_OCCURRED_$$d_output && !_WRITE_HAS_OCCURRED_$$d_output && !_ATOMIC_HAS_OCCURRED_$$d_output;
  requires !_READ_HAS_OCCURRED_$$d_temp && !_WRITE_HAS_OCCURRED_$$d_temp && !_ATOMIC_HAS_OCCURRED_$$d_temp;
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
  modifies _WRITE_HAS_OCCURRED_$$d_output, _WRITE_READ_BENIGN_FLAG_$$d_output, _WRITE_READ_BENIGN_FLAG_$$d_output;



implementation {:source_name "rayCast"} {:kernel} $_Z7rayCastPjS_jjff($imageW: bv32, $imageH: bv32, $pas: bv32, $df: bv32)
{
  var $res.i.2$1: bv32;
  var $res.i.2$2: bv32;
  var $res.i.1$1: bv32;
  var $res.i.1$2: bv32;
  var $res.i.0$1: bv32;
  var $res.i.0$2: bv32;
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
  var v50$1: bv32;
  var v50$2: bv32;
  var v51$1: bv32;
  var v51$2: bv32;
  var v52$1: bv32;
  var v52$2: bv32;
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
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v38$1: bv32;
  var v38$2: bv32;
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
  var v80$1: bv32;
  var v80$2: bv32;
  var v81$1: bv32;
  var v81$2: bv32;
  var v82$1: bv32;
  var v82$2: bv32;
  var v47$1: bv32;
  var v47$2: bv32;
  var v48$1: bv32;
  var v48$2: bv32;
  var v49$1: bv32;
  var v49$2: bv32;
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
  var v146$1: bv32;
  var v146$2: bv32;
  var v147$1: bv32;
  var v147$2: bv32;
  var v148$1: bv32;
  var v148$2: bv32;
  var v149$1: bv32;
  var v149$2: bv32;
  var v152$1: bv32;
  var v152$2: bv32;
  var v153$1: bv32;
  var v153$2: bv32;
  var v154$1: bv32;
  var v154$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
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
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
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
  var v185$1: bv96;
  var v185$2: bv96;
  var v186$1: bv32;
  var v186$2: bv32;
  var v187$1: bv32;
  var v187$2: bv32;
  var v188$1: bv32;
  var v188$2: bv32;
  var v189$1: bv8;
  var v189$2: bv8;
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
  var v318$1: bool;
  var v318$2: bool;
  var v319$1: bool;
  var v319$2: bool;
  var v320$1: bv32;
  var v320$2: bv32;
  var v321$1: bool;
  var v321$2: bool;
  var v322$1: bv32;
  var v322$2: bv32;
  var v323$1: bool;
  var v323$2: bool;
  var v324$1: bool;
  var v324$2: bool;
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
  var v35$1: bv32;
  var v35$2: bv32;
  var v36$1: bv32;
  var v36$2: bv32;
  var v37$1: bv32;
  var v37$2: bv32;
  var v33$1: bv32;
  var v33$2: bv32;
  var v34$1: bv32;
  var v34$2: bv32;
  var v44$1: bv32;
  var v44$2: bv32;
  var v45$1: bv32;
  var v45$2: bv32;
  var v46$1: bv32;
  var v46$2: bv32;
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
  var v78$1: bv32;
  var v78$2: bv32;
  var v79$1: bv32;
  var v79$2: bv32;
  var v150$1: bv32;
  var v150$2: bv32;
  var v151$1: bv32;
  var v151$2: bv32;
  var v190$1: bv8;
  var v190$2: bv8;
  var v191$1: bv8;
  var v191$2: bv8;
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
  var v208$1: bv8;
  var v208$2: bv8;
  var v209$1: bv8;
  var v209$2: bv8;
  var v210$1: bv8;
  var v210$2: bv8;
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
  var v246$1: bv8;
  var v246$2: bv8;
  var v247$1: bv8;
  var v247$2: bv8;
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
  var v255$1: bv8;
  var v255$2: bv8;
  var v256$1: bv8;
  var v256$2: bv8;
  var v257$1: bv8;
  var v257$2: bv8;
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
  var v267$1: bv32;
  var v267$2: bv32;
  var v268$1: bv32;
  var v268$2: bv32;
  var v269$1: bv32;
  var v269$2: bv32;
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
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v13$1: bv32;
  var v13$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
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
  var v20$1: bv32;
  var v20$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
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
  var v344$1: bv32;
  var v344$2: bv32;
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


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_MUL(group_id_y$1, group_size_y);
    v1$2 := BV32_MUL(group_id_y$2, group_size_y);
    v2$1 := BV32_ADD(v0$1, BV32_MUL(v1$1, num_groups_x));
    v2$2 := BV32_ADD(v0$2, BV32_MUL(v1$2, num_groups_x));
    v3$1 := $$d_temp[v2$1];
    v3$2 := $$d_temp[v2$2];
    v4$1 := v3$1 == 0bv32;
    v4$2 := v3$2 == 0bv32;
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
    p0$1 := (if v4$1 then v4$1 else p0$1);
    p0$2 := (if v4$2 then v4$2 else p0$2);
    v5$1 := (if p0$1 then FDIV32(1073741824bv32, UI32_TO_FP32($imageW)) else v5$1);
    v5$2 := (if p0$2 then FDIV32(1073741824bv32, UI32_TO_FP32($imageW)) else v5$2);
    v6$1 := (if p0$1 then $$MView$1[0bv32] else v6$1);
    v6$2 := (if p0$2 then $$MView$2[0bv32] else v6$2);
    $$M$0bv32$1 := (if p0$1 then v6$1 else $$M$0bv32$1);
    $$M$0bv32$2 := (if p0$2 then v6$2 else $$M$0bv32$2);
    v7$1 := (if p0$1 then $$MView$1[1bv32] else v7$1);
    v7$2 := (if p0$2 then $$MView$2[1bv32] else v7$2);
    $$M$1bv32$1 := (if p0$1 then v7$1 else $$M$1bv32$1);
    $$M$1bv32$2 := (if p0$2 then v7$2 else $$M$1bv32$2);
    v8$1 := (if p0$1 then $$MView$1[2bv32] else v8$1);
    v8$2 := (if p0$2 then $$MView$2[2bv32] else v8$2);
    $$M$2bv32$1 := (if p0$1 then v8$1 else $$M$2bv32$1);
    $$M$2bv32$2 := (if p0$2 then v8$2 else $$M$2bv32$2);
    v9$1 := (if p0$1 then $$MView$1[3bv32] else v9$1);
    v9$2 := (if p0$2 then $$MView$2[3bv32] else v9$2);
    $$M$3bv32$1 := (if p0$1 then v9$1 else $$M$3bv32$1);
    $$M$3bv32$2 := (if p0$2 then v9$2 else $$M$3bv32$2);
    v10$1 := (if p0$1 then $$MView$1[4bv32] else v10$1);
    v10$2 := (if p0$2 then $$MView$2[4bv32] else v10$2);
    $$M$4bv32$1 := (if p0$1 then v10$1 else $$M$4bv32$1);
    $$M$4bv32$2 := (if p0$2 then v10$2 else $$M$4bv32$2);
    v11$1 := (if p0$1 then $$MView$1[5bv32] else v11$1);
    v11$2 := (if p0$2 then $$MView$2[5bv32] else v11$2);
    $$M$5bv32$1 := (if p0$1 then v11$1 else $$M$5bv32$1);
    $$M$5bv32$2 := (if p0$2 then v11$2 else $$M$5bv32$2);
    v12$1 := (if p0$1 then $$MView$1[6bv32] else v12$1);
    v12$2 := (if p0$2 then $$MView$2[6bv32] else v12$2);
    $$M$6bv32$1 := (if p0$1 then v12$1 else $$M$6bv32$1);
    $$M$6bv32$2 := (if p0$2 then v12$2 else $$M$6bv32$2);
    v13$1 := (if p0$1 then $$MView$1[7bv32] else v13$1);
    v13$2 := (if p0$2 then $$MView$2[7bv32] else v13$2);
    $$M$7bv32$1 := (if p0$1 then v13$1 else $$M$7bv32$1);
    $$M$7bv32$2 := (if p0$2 then v13$2 else $$M$7bv32$2);
    v14$1 := (if p0$1 then $$MView$1[8bv32] else v14$1);
    v14$2 := (if p0$2 then $$MView$2[8bv32] else v14$2);
    $$M$8bv32$1 := (if p0$1 then v14$1 else $$M$8bv32$1);
    $$M$8bv32$2 := (if p0$2 then v14$2 else $$M$8bv32$2);
    v15$1 := (if p0$1 then $$MView$1[9bv32] else v15$1);
    v15$2 := (if p0$2 then $$MView$2[9bv32] else v15$2);
    $$M$9bv32$1 := (if p0$1 then v15$1 else $$M$9bv32$1);
    $$M$9bv32$2 := (if p0$2 then v15$2 else $$M$9bv32$2);
    v16$1 := (if p0$1 then $$MView$1[10bv32] else v16$1);
    v16$2 := (if p0$2 then $$MView$2[10bv32] else v16$2);
    $$M$10bv32$1 := (if p0$1 then v16$1 else $$M$10bv32$1);
    $$M$10bv32$2 := (if p0$2 then v16$2 else $$M$10bv32$2);
    v17$1 := (if p0$1 then $$MView$1[11bv32] else v17$1);
    v17$2 := (if p0$2 then $$MView$2[11bv32] else v17$2);
    $$M$11bv32$1 := (if p0$1 then v17$1 else $$M$11bv32$1);
    $$M$11bv32$2 := (if p0$2 then v17$2 else $$M$11bv32$2);
    v18$1 := (if p0$1 then $$M$3bv32$1 else v18$1);
    v18$2 := (if p0$2 then $$M$3bv32$2 else v18$2);
    v19$1 := (if p0$1 then $$M$7bv32$1 else v19$1);
    v19$2 := (if p0$2 then $$M$7bv32$2 else v19$2);
    v20$1 := (if p0$1 then $$M$11bv32$1 else v20$1);
    v20$2 := (if p0$2 then $$M$11bv32$2 else v20$2);
    $$29$0bv32$1 := (if p0$1 then v18$1 else $$29$0bv32$1);
    $$29$0bv32$2 := (if p0$2 then v18$2 else $$29$0bv32$2);
    $$29$1bv32$1 := (if p0$1 then v19$1 else $$29$1bv32$1);
    $$29$1bv32$2 := (if p0$2 then v19$2 else $$29$1bv32$2);
    $$29$2bv32$1 := (if p0$1 then v20$1 else $$29$2bv32$1);
    $$29$2bv32$2 := (if p0$2 then v20$2 else $$29$2bv32$2);
    v21$1 := (if p0$1 then $$29$0bv32$1 else v21$1);
    v21$2 := (if p0$2 then $$29$0bv32$2 else v21$2);
    v22$1 := (if p0$1 then $$29$1bv32$1 else v22$1);
    v22$2 := (if p0$2 then $$29$1bv32$2 else v22$2);
    v23$1 := (if p0$1 then $$29$2bv32$1 else v23$1);
    v23$2 := (if p0$2 then $$29$2bv32$2 else v23$2);
    $$30$0bv32$1 := (if p0$1 then v21$1 else $$30$0bv32$1);
    $$30$0bv32$2 := (if p0$2 then v21$2 else $$30$0bv32$2);
    $$30$1bv32$1 := (if p0$1 then v22$1 else $$30$1bv32$1);
    $$30$1bv32$2 := (if p0$2 then v22$2 else $$30$1bv32$2);
    $$30$2bv32$1 := (if p0$1 then v23$1 else $$30$2bv32$1);
    $$30$2bv32$2 := (if p0$2 then v23$2 else $$30$2bv32$2);
    v24$1 := (if p0$1 then $$30$0bv32$1 else v24$1);
    v24$2 := (if p0$2 then $$30$0bv32$2 else v24$2);
    $$R$0bv32$1 := (if p0$1 then v24$1 else $$R$0bv32$1);
    $$R$0bv32$2 := (if p0$2 then v24$2 else $$R$0bv32$2);
    v25$1 := (if p0$1 then $$30$1bv32$1 else v25$1);
    v25$2 := (if p0$2 then $$30$1bv32$2 else v25$2);
    $$R$1bv32$1 := (if p0$1 then v25$1 else $$R$1bv32$1);
    $$R$1bv32$2 := (if p0$2 then v25$2 else $$R$1bv32$2);
    v26$1 := (if p0$1 then $$30$2bv32$1 else v26$1);
    v26$2 := (if p0$2 then $$30$2bv32$2 else v26$2);
    $$R$2bv32$1 := (if p0$1 then v26$1 else $$R$2bv32$1);
    $$R$2bv32$2 := (if p0$2 then v26$2 else $$R$2bv32$2);
    v27$1 := (if p0$1 then $$M$0bv32$1 else v27$1);
    v27$2 := (if p0$2 then $$M$0bv32$2 else v27$2);
    $$35$0bv32$1 := (if p0$1 then v27$1 else $$35$0bv32$1);
    $$35$0bv32$2 := (if p0$2 then v27$2 else $$35$0bv32$2);
    v28$1 := (if p0$1 then $$M$1bv32$1 else v28$1);
    v28$2 := (if p0$2 then $$M$1bv32$2 else v28$2);
    $$35$1bv32$1 := (if p0$1 then v28$1 else $$35$1bv32$1);
    $$35$1bv32$2 := (if p0$2 then v28$2 else $$35$1bv32$2);
    v29$1 := (if p0$1 then $$M$2bv32$1 else v29$1);
    v29$2 := (if p0$2 then $$M$2bv32$2 else v29$2);
    $$35$2bv32$1 := (if p0$1 then v29$1 else $$35$2bv32$1);
    $$35$2bv32$2 := (if p0$2 then v29$2 else $$35$2bv32$2);
    v30$1 := (if p0$1 then $$M$3bv32$1 else v30$1);
    v30$2 := (if p0$2 then $$M$3bv32$2 else v30$2);
    $$35$3bv32$1 := (if p0$1 then v30$1 else $$35$3bv32$1);
    $$35$3bv32$2 := (if p0$2 then v30$2 else $$35$3bv32$2);
    v31$1 := (if p0$1 then $$35$0bv32$1 else v31$1);
    v31$2 := (if p0$2 then $$35$0bv32$2 else v31$2);
    v32$1 := (if p0$1 then $$35$1bv32$1 else v32$1);
    v32$2 := (if p0$2 then $$35$1bv32$2 else v32$2);
    v33$1 := (if p0$1 then $$35$2bv32$1 else v33$1);
    v33$2 := (if p0$2 then $$35$2bv32$2 else v33$2);
    v34$1 := (if p0$1 then $$35$3bv32$1 else v34$1);
    v34$2 := (if p0$2 then $$35$3bv32$2 else v34$2);
    $$a.i$0bv32$1 := (if p0$1 then v31$1 else $$a.i$0bv32$1);
    $$a.i$0bv32$2 := (if p0$2 then v31$2 else $$a.i$0bv32$2);
    $$a.i$1bv32$1 := (if p0$1 then v32$1 else $$a.i$1bv32$1);
    $$a.i$1bv32$2 := (if p0$2 then v32$2 else $$a.i$1bv32$2);
    $$a.i$2bv32$1 := (if p0$1 then v33$1 else $$a.i$2bv32$1);
    $$a.i$2bv32$2 := (if p0$2 then v33$2 else $$a.i$2bv32$2);
    $$a.i$3bv32$1 := (if p0$1 then v34$1 else $$a.i$3bv32$1);
    $$a.i$3bv32$2 := (if p0$2 then v34$2 else $$a.i$3bv32$2);
    v35$1 := (if p0$1 then $$a.i$0bv32$1 else v35$1);
    v35$2 := (if p0$2 then $$a.i$0bv32$2 else v35$2);
    v36$1 := (if p0$1 then $$a.i$1bv32$1 else v36$1);
    v36$2 := (if p0$2 then $$a.i$1bv32$2 else v36$2);
    v37$1 := (if p0$1 then $$a.i$2bv32$1 else v37$1);
    v37$2 := (if p0$2 then $$a.i$2bv32$2 else v37$2);
    $$27$0bv32$1 := (if p0$1 then v35$1 else $$27$0bv32$1);
    $$27$0bv32$2 := (if p0$2 then v35$2 else $$27$0bv32$2);
    $$27$1bv32$1 := (if p0$1 then v36$1 else $$27$1bv32$1);
    $$27$1bv32$2 := (if p0$2 then v36$2 else $$27$1bv32$2);
    $$27$2bv32$1 := (if p0$1 then v37$1 else $$27$2bv32$1);
    $$27$2bv32$2 := (if p0$2 then v37$2 else $$27$2bv32$2);
    v38$1 := (if p0$1 then $$27$0bv32$1 else v38$1);
    v38$2 := (if p0$2 then $$27$0bv32$2 else v38$2);
    v39$1 := (if p0$1 then $$27$1bv32$1 else v39$1);
    v39$2 := (if p0$2 then $$27$1bv32$2 else v39$2);
    v40$1 := (if p0$1 then $$27$2bv32$1 else v40$1);
    v40$2 := (if p0$2 then $$27$2bv32$2 else v40$2);
    $$28$0bv32$1 := (if p0$1 then v38$1 else $$28$0bv32$1);
    $$28$0bv32$2 := (if p0$2 then v38$2 else $$28$0bv32$2);
    $$28$1bv32$1 := (if p0$1 then v39$1 else $$28$1bv32$1);
    $$28$1bv32$2 := (if p0$2 then v39$2 else $$28$1bv32$2);
    $$28$2bv32$1 := (if p0$1 then v40$1 else $$28$2bv32$1);
    $$28$2bv32$2 := (if p0$2 then v40$2 else $$28$2bv32$2);
    v41$1 := (if p0$1 then $$28$0bv32$1 else v41$1);
    v41$2 := (if p0$2 then $$28$0bv32$2 else v41$2);
    v42$1 := (if p0$1 then $$28$1bv32$1 else v42$1);
    v42$2 := (if p0$2 then $$28$1bv32$2 else v42$2);
    v43$1 := (if p0$1 then $$28$2bv32$1 else v43$1);
    v43$2 := (if p0$2 then $$28$2bv32$2 else v43$2);
    $$34$0bv32$1 := (if p0$1 then v41$1 else $$34$0bv32$1);
    $$34$0bv32$2 := (if p0$2 then v41$2 else $$34$0bv32$2);
    $$34$1bv32$1 := (if p0$1 then v42$1 else $$34$1bv32$1);
    $$34$1bv32$2 := (if p0$2 then v42$2 else $$34$1bv32$2);
    $$34$2bv32$1 := (if p0$1 then v43$1 else $$34$2bv32$1);
    $$34$2bv32$2 := (if p0$2 then v43$2 else $$34$2bv32$2);
    v44$1 := (if p0$1 then $$34$0bv32$1 else v44$1);
    v44$2 := (if p0$2 then $$34$0bv32$2 else v44$2);
    v45$1 := (if p0$1 then $$34$1bv32$1 else v45$1);
    v45$2 := (if p0$2 then $$34$1bv32$2 else v45$2);
    v46$1 := (if p0$1 then $$34$2bv32$1 else v46$1);
    v46$2 := (if p0$2 then $$34$2bv32$2 else v46$2);
    $$a.i1$0bv32$1 := (if p0$1 then v44$1 else $$a.i1$0bv32$1);
    $$a.i1$0bv32$2 := (if p0$2 then v44$2 else $$a.i1$0bv32$2);
    $$a.i1$1bv32$1 := (if p0$1 then v45$1 else $$a.i1$1bv32$1);
    $$a.i1$1bv32$2 := (if p0$2 then v45$2 else $$a.i1$1bv32$2);
    $$a.i1$2bv32$1 := (if p0$1 then v46$1 else $$a.i1$2bv32$1);
    $$a.i1$2bv32$2 := (if p0$2 then v46$2 else $$a.i1$2bv32$2);
    v47$1 := (if p0$1 then $$a.i1$0bv32$1 else v47$1);
    v47$2 := (if p0$2 then $$a.i1$0bv32$2 else v47$2);
    v48$1 := (if p0$1 then $$a.i1$1bv32$1 else v48$1);
    v48$2 := (if p0$2 then $$a.i1$1bv32$2 else v48$2);
    v49$1 := (if p0$1 then $$a.i1$2bv32$1 else v49$1);
    v49$2 := (if p0$2 then $$a.i1$2bv32$2 else v49$2);
    $$25$0bv32$1 := (if p0$1 then FMUL32(v47$1, $df) else $$25$0bv32$1);
    $$25$0bv32$2 := (if p0$2 then FMUL32(v47$2, $df) else $$25$0bv32$2);
    $$25$1bv32$1 := (if p0$1 then FMUL32(v48$1, $df) else $$25$1bv32$1);
    $$25$1bv32$2 := (if p0$2 then FMUL32(v48$2, $df) else $$25$1bv32$2);
    $$25$2bv32$1 := (if p0$1 then FMUL32(v49$1, $df) else $$25$2bv32$1);
    $$25$2bv32$2 := (if p0$2 then FMUL32(v49$2, $df) else $$25$2bv32$2);
    v50$1 := (if p0$1 then $$25$0bv32$1 else v50$1);
    v50$2 := (if p0$2 then $$25$0bv32$2 else v50$2);
    v51$1 := (if p0$1 then $$25$1bv32$1 else v51$1);
    v51$2 := (if p0$2 then $$25$1bv32$2 else v51$2);
    v52$1 := (if p0$1 then $$25$2bv32$1 else v52$1);
    v52$2 := (if p0$2 then $$25$2bv32$2 else v52$2);
    $$26$0bv32$1 := (if p0$1 then v50$1 else $$26$0bv32$1);
    $$26$0bv32$2 := (if p0$2 then v50$2 else $$26$0bv32$2);
    $$26$1bv32$1 := (if p0$1 then v51$1 else $$26$1bv32$1);
    $$26$1bv32$2 := (if p0$2 then v51$2 else $$26$1bv32$2);
    $$26$2bv32$1 := (if p0$1 then v52$1 else $$26$2bv32$1);
    $$26$2bv32$2 := (if p0$2 then v52$2 else $$26$2bv32$2);
    v53$1 := (if p0$1 then $$26$0bv32$1 else v53$1);
    v53$2 := (if p0$2 then $$26$0bv32$2 else v53$2);
    v54$1 := (if p0$1 then $$26$1bv32$1 else v54$1);
    v54$2 := (if p0$2 then $$26$1bv32$2 else v54$2);
    v55$1 := (if p0$1 then $$26$2bv32$1 else v55$1);
    v55$2 := (if p0$2 then $$26$2bv32$2 else v55$2);
    $$33$0bv32$1 := (if p0$1 then v53$1 else $$33$0bv32$1);
    $$33$0bv32$2 := (if p0$2 then v53$2 else $$33$0bv32$2);
    $$33$1bv32$1 := (if p0$1 then v54$1 else $$33$1bv32$1);
    $$33$1bv32$2 := (if p0$2 then v54$2 else $$33$1bv32$2);
    $$33$2bv32$1 := (if p0$1 then v55$1 else $$33$2bv32$1);
    $$33$2bv32$2 := (if p0$2 then v55$2 else $$33$2bv32$2);
    v56$1 := (if p0$1 then $$M$8bv32$1 else v56$1);
    v56$2 := (if p0$2 then $$M$8bv32$2 else v56$2);
    $$39$0bv32$1 := (if p0$1 then v56$1 else $$39$0bv32$1);
    $$39$0bv32$2 := (if p0$2 then v56$2 else $$39$0bv32$2);
    v57$1 := (if p0$1 then $$M$9bv32$1 else v57$1);
    v57$2 := (if p0$2 then $$M$9bv32$2 else v57$2);
    $$39$1bv32$1 := (if p0$1 then v57$1 else $$39$1bv32$1);
    $$39$1bv32$2 := (if p0$2 then v57$2 else $$39$1bv32$2);
    v58$1 := (if p0$1 then $$M$10bv32$1 else v58$1);
    v58$2 := (if p0$2 then $$M$10bv32$2 else v58$2);
    $$39$2bv32$1 := (if p0$1 then v58$1 else $$39$2bv32$1);
    $$39$2bv32$2 := (if p0$2 then v58$2 else $$39$2bv32$2);
    v59$1 := (if p0$1 then $$M$11bv32$1 else v59$1);
    v59$2 := (if p0$2 then $$M$11bv32$2 else v59$2);
    $$39$3bv32$1 := (if p0$1 then v59$1 else $$39$3bv32$1);
    $$39$3bv32$2 := (if p0$2 then v59$2 else $$39$3bv32$2);
    v60$1 := (if p0$1 then $$39$0bv32$1 else v60$1);
    v60$2 := (if p0$2 then $$39$0bv32$2 else v60$2);
    v61$1 := (if p0$1 then $$39$1bv32$1 else v61$1);
    v61$2 := (if p0$2 then $$39$1bv32$2 else v61$2);
    v62$1 := (if p0$1 then $$39$2bv32$1 else v62$1);
    v62$2 := (if p0$2 then $$39$2bv32$2 else v62$2);
    v63$1 := (if p0$1 then $$39$3bv32$1 else v63$1);
    v63$2 := (if p0$2 then $$39$3bv32$2 else v63$2);
    $$a.i2$0bv32$1 := (if p0$1 then v60$1 else $$a.i2$0bv32$1);
    $$a.i2$0bv32$2 := (if p0$2 then v60$2 else $$a.i2$0bv32$2);
    $$a.i2$1bv32$1 := (if p0$1 then v61$1 else $$a.i2$1bv32$1);
    $$a.i2$1bv32$2 := (if p0$2 then v61$2 else $$a.i2$1bv32$2);
    $$a.i2$2bv32$1 := (if p0$1 then v62$1 else $$a.i2$2bv32$1);
    $$a.i2$2bv32$2 := (if p0$2 then v62$2 else $$a.i2$2bv32$2);
    $$a.i2$3bv32$1 := (if p0$1 then v63$1 else $$a.i2$3bv32$1);
    $$a.i2$3bv32$2 := (if p0$2 then v63$2 else $$a.i2$3bv32$2);
    v64$1 := (if p0$1 then $$a.i2$0bv32$1 else v64$1);
    v64$2 := (if p0$2 then $$a.i2$0bv32$2 else v64$2);
    v65$1 := (if p0$1 then $$a.i2$1bv32$1 else v65$1);
    v65$2 := (if p0$2 then $$a.i2$1bv32$2 else v65$2);
    v66$1 := (if p0$1 then $$a.i2$2bv32$1 else v66$1);
    v66$2 := (if p0$2 then $$a.i2$2bv32$2 else v66$2);
    $$14$0bv32$1 := (if p0$1 then v64$1 else $$14$0bv32$1);
    $$14$0bv32$2 := (if p0$2 then v64$2 else $$14$0bv32$2);
    $$14$1bv32$1 := (if p0$1 then v65$1 else $$14$1bv32$1);
    $$14$1bv32$2 := (if p0$2 then v65$2 else $$14$1bv32$2);
    $$14$2bv32$1 := (if p0$1 then v66$1 else $$14$2bv32$1);
    $$14$2bv32$2 := (if p0$2 then v66$2 else $$14$2bv32$2);
    v67$1 := (if p0$1 then $$14$0bv32$1 else v67$1);
    v67$2 := (if p0$2 then $$14$0bv32$2 else v67$2);
    v68$1 := (if p0$1 then $$14$1bv32$1 else v68$1);
    v68$2 := (if p0$2 then $$14$1bv32$2 else v68$2);
    v69$1 := (if p0$1 then $$14$2bv32$1 else v69$1);
    v69$2 := (if p0$2 then $$14$2bv32$2 else v69$2);
    $$15$0bv32$1 := (if p0$1 then v67$1 else $$15$0bv32$1);
    $$15$0bv32$2 := (if p0$2 then v67$2 else $$15$0bv32$2);
    $$15$1bv32$1 := (if p0$1 then v68$1 else $$15$1bv32$1);
    $$15$1bv32$2 := (if p0$2 then v68$2 else $$15$1bv32$2);
    $$15$2bv32$1 := (if p0$1 then v69$1 else $$15$2bv32$1);
    $$15$2bv32$2 := (if p0$2 then v69$2 else $$15$2bv32$2);
    v70$1 := (if p0$1 then $$15$0bv32$1 else v70$1);
    v70$2 := (if p0$2 then $$15$0bv32$2 else v70$2);
    v71$1 := (if p0$1 then $$15$1bv32$1 else v71$1);
    v71$2 := (if p0$2 then $$15$1bv32$2 else v71$2);
    v72$1 := (if p0$1 then $$15$2bv32$1 else v72$1);
    v72$2 := (if p0$2 then $$15$2bv32$2 else v72$2);
    $$38$0bv32$1 := (if p0$1 then v70$1 else $$38$0bv32$1);
    $$38$0bv32$2 := (if p0$2 then v70$2 else $$38$0bv32$2);
    $$38$1bv32$1 := (if p0$1 then v71$1 else $$38$1bv32$1);
    $$38$1bv32$2 := (if p0$2 then v71$2 else $$38$1bv32$2);
    $$38$2bv32$1 := (if p0$1 then v72$1 else $$38$2bv32$1);
    $$38$2bv32$2 := (if p0$2 then v72$2 else $$38$2bv32$2);
    v73$1 := (if p0$1 then FSUB32(UI32_TO_FP32(v0$1), FMUL32(UI32_TO_FP32($imageW), 1056964608bv32)) else v73$1);
    v73$2 := (if p0$2 then FSUB32(UI32_TO_FP32(v0$2), FMUL32(UI32_TO_FP32($imageW), 1056964608bv32)) else v73$2);
    v74$1 := (if p0$1 then $$38$0bv32$1 else v74$1);
    v74$2 := (if p0$2 then $$38$0bv32$2 else v74$2);
    v75$1 := (if p0$1 then $$38$1bv32$1 else v75$1);
    v75$2 := (if p0$2 then $$38$1bv32$2 else v75$2);
    v76$1 := (if p0$1 then $$38$2bv32$1 else v76$1);
    v76$2 := (if p0$2 then $$38$2bv32$2 else v76$2);
    $$a.i3$0bv32$1 := (if p0$1 then v74$1 else $$a.i3$0bv32$1);
    $$a.i3$0bv32$2 := (if p0$2 then v74$2 else $$a.i3$0bv32$2);
    $$a.i3$1bv32$1 := (if p0$1 then v75$1 else $$a.i3$1bv32$1);
    $$a.i3$1bv32$2 := (if p0$2 then v75$2 else $$a.i3$1bv32$2);
    $$a.i3$2bv32$1 := (if p0$1 then v76$1 else $$a.i3$2bv32$1);
    $$a.i3$2bv32$2 := (if p0$2 then v76$2 else $$a.i3$2bv32$2);
    v77$1 := (if p0$1 then $$a.i3$0bv32$1 else v77$1);
    v77$2 := (if p0$2 then $$a.i3$0bv32$2 else v77$2);
    v78$1 := (if p0$1 then $$a.i3$1bv32$1 else v78$1);
    v78$2 := (if p0$2 then $$a.i3$1bv32$2 else v78$2);
    v79$1 := (if p0$1 then $$a.i3$2bv32$1 else v79$1);
    v79$2 := (if p0$2 then $$a.i3$2bv32$2 else v79$2);
    $$12$0bv32$1 := (if p0$1 then FMUL32(v77$1, v73$1) else $$12$0bv32$1);
    $$12$0bv32$2 := (if p0$2 then FMUL32(v77$2, v73$2) else $$12$0bv32$2);
    $$12$1bv32$1 := (if p0$1 then FMUL32(v78$1, v73$1) else $$12$1bv32$1);
    $$12$1bv32$2 := (if p0$2 then FMUL32(v78$2, v73$2) else $$12$1bv32$2);
    $$12$2bv32$1 := (if p0$1 then FMUL32(v79$1, v73$1) else $$12$2bv32$1);
    $$12$2bv32$2 := (if p0$2 then FMUL32(v79$2, v73$2) else $$12$2bv32$2);
    v80$1 := (if p0$1 then $$12$0bv32$1 else v80$1);
    v80$2 := (if p0$2 then $$12$0bv32$2 else v80$2);
    v81$1 := (if p0$1 then $$12$1bv32$1 else v81$1);
    v81$2 := (if p0$2 then $$12$1bv32$2 else v81$2);
    v82$1 := (if p0$1 then $$12$2bv32$1 else v82$1);
    v82$2 := (if p0$2 then $$12$2bv32$2 else v82$2);
    $$13$0bv32$1 := (if p0$1 then v80$1 else $$13$0bv32$1);
    $$13$0bv32$2 := (if p0$2 then v80$2 else $$13$0bv32$2);
    $$13$1bv32$1 := (if p0$1 then v81$1 else $$13$1bv32$1);
    $$13$1bv32$2 := (if p0$2 then v81$2 else $$13$1bv32$2);
    $$13$2bv32$1 := (if p0$1 then v82$1 else $$13$2bv32$1);
    $$13$2bv32$2 := (if p0$2 then v82$2 else $$13$2bv32$2);
    v83$1 := (if p0$1 then $$13$0bv32$1 else v83$1);
    v83$2 := (if p0$2 then $$13$0bv32$2 else v83$2);
    v84$1 := (if p0$1 then $$13$1bv32$1 else v84$1);
    v84$2 := (if p0$2 then $$13$1bv32$2 else v84$2);
    v85$1 := (if p0$1 then $$13$2bv32$1 else v85$1);
    v85$2 := (if p0$2 then $$13$2bv32$2 else v85$2);
    $$37$0bv32$1 := (if p0$1 then v83$1 else $$37$0bv32$1);
    $$37$0bv32$2 := (if p0$2 then v83$2 else $$37$0bv32$2);
    $$37$1bv32$1 := (if p0$1 then v84$1 else $$37$1bv32$1);
    $$37$1bv32$2 := (if p0$2 then v84$2 else $$37$1bv32$2);
    $$37$2bv32$1 := (if p0$1 then v85$1 else $$37$2bv32$1);
    $$37$2bv32$2 := (if p0$2 then v85$2 else $$37$2bv32$2);
    v86$1 := (if p0$1 then $$37$0bv32$1 else v86$1);
    v86$2 := (if p0$2 then $$37$0bv32$2 else v86$2);
    v87$1 := (if p0$1 then $$37$1bv32$1 else v87$1);
    v87$2 := (if p0$2 then $$37$1bv32$2 else v87$2);
    v88$1 := (if p0$1 then $$37$2bv32$1 else v88$1);
    v88$2 := (if p0$2 then $$37$2bv32$2 else v88$2);
    $$a.i4$0bv32$1 := (if p0$1 then v86$1 else $$a.i4$0bv32$1);
    $$a.i4$0bv32$2 := (if p0$2 then v86$2 else $$a.i4$0bv32$2);
    $$a.i4$1bv32$1 := (if p0$1 then v87$1 else $$a.i4$1bv32$1);
    $$a.i4$1bv32$2 := (if p0$2 then v87$2 else $$a.i4$1bv32$2);
    $$a.i4$2bv32$1 := (if p0$1 then v88$1 else $$a.i4$2bv32$1);
    $$a.i4$2bv32$2 := (if p0$2 then v88$2 else $$a.i4$2bv32$2);
    v89$1 := (if p0$1 then $$a.i4$0bv32$1 else v89$1);
    v89$2 := (if p0$2 then $$a.i4$0bv32$2 else v89$2);
    v90$1 := (if p0$1 then $$a.i4$1bv32$1 else v90$1);
    v90$2 := (if p0$2 then $$a.i4$1bv32$2 else v90$2);
    v91$1 := (if p0$1 then $$a.i4$2bv32$1 else v91$1);
    v91$2 := (if p0$2 then $$a.i4$2bv32$2 else v91$2);
    $$10$0bv32$1 := (if p0$1 then FMUL32(v89$1, v5$1) else $$10$0bv32$1);
    $$10$0bv32$2 := (if p0$2 then FMUL32(v89$2, v5$2) else $$10$0bv32$2);
    $$10$1bv32$1 := (if p0$1 then FMUL32(v90$1, v5$1) else $$10$1bv32$1);
    $$10$1bv32$2 := (if p0$2 then FMUL32(v90$2, v5$2) else $$10$1bv32$2);
    $$10$2bv32$1 := (if p0$1 then FMUL32(v91$1, v5$1) else $$10$2bv32$1);
    $$10$2bv32$2 := (if p0$2 then FMUL32(v91$2, v5$2) else $$10$2bv32$2);
    v92$1 := (if p0$1 then $$10$0bv32$1 else v92$1);
    v92$2 := (if p0$2 then $$10$0bv32$2 else v92$2);
    v93$1 := (if p0$1 then $$10$1bv32$1 else v93$1);
    v93$2 := (if p0$2 then $$10$1bv32$2 else v93$2);
    v94$1 := (if p0$1 then $$10$2bv32$1 else v94$1);
    v94$2 := (if p0$2 then $$10$2bv32$2 else v94$2);
    $$11$0bv32$1 := (if p0$1 then v92$1 else $$11$0bv32$1);
    $$11$0bv32$2 := (if p0$2 then v92$2 else $$11$0bv32$2);
    $$11$1bv32$1 := (if p0$1 then v93$1 else $$11$1bv32$1);
    $$11$1bv32$2 := (if p0$2 then v93$2 else $$11$1bv32$2);
    $$11$2bv32$1 := (if p0$1 then v94$1 else $$11$2bv32$1);
    $$11$2bv32$2 := (if p0$2 then v94$2 else $$11$2bv32$2);
    v95$1 := (if p0$1 then $$11$0bv32$1 else v95$1);
    v95$2 := (if p0$2 then $$11$0bv32$2 else v95$2);
    v96$1 := (if p0$1 then $$11$1bv32$1 else v96$1);
    v96$2 := (if p0$2 then $$11$1bv32$2 else v96$2);
    v97$1 := (if p0$1 then $$11$2bv32$1 else v97$1);
    v97$2 := (if p0$2 then $$11$2bv32$2 else v97$2);
    $$36$0bv32$1 := (if p0$1 then v95$1 else $$36$0bv32$1);
    $$36$0bv32$2 := (if p0$2 then v95$2 else $$36$0bv32$2);
    $$36$1bv32$1 := (if p0$1 then v96$1 else $$36$1bv32$1);
    $$36$1bv32$2 := (if p0$2 then v96$2 else $$36$1bv32$2);
    $$36$2bv32$1 := (if p0$1 then v97$1 else $$36$2bv32$1);
    $$36$2bv32$2 := (if p0$2 then v97$2 else $$36$2bv32$2);
    v98$1 := (if p0$1 then $$33$0bv32$1 else v98$1);
    v98$2 := (if p0$2 then $$33$0bv32$2 else v98$2);
    v99$1 := (if p0$1 then $$33$1bv32$1 else v99$1);
    v99$2 := (if p0$2 then $$33$1bv32$2 else v99$2);
    v100$1 := (if p0$1 then $$33$2bv32$1 else v100$1);
    v100$2 := (if p0$2 then $$33$2bv32$2 else v100$2);
    v101$1 := (if p0$1 then $$36$0bv32$1 else v101$1);
    v101$2 := (if p0$2 then $$36$0bv32$2 else v101$2);
    v102$1 := (if p0$1 then $$36$1bv32$1 else v102$1);
    v102$2 := (if p0$2 then $$36$1bv32$2 else v102$2);
    v103$1 := (if p0$1 then $$36$2bv32$1 else v103$1);
    v103$2 := (if p0$2 then $$36$2bv32$2 else v103$2);
    $$a.i9$0bv32$1 := (if p0$1 then v98$1 else $$a.i9$0bv32$1);
    $$a.i9$0bv32$2 := (if p0$2 then v98$2 else $$a.i9$0bv32$2);
    $$a.i9$1bv32$1 := (if p0$1 then v99$1 else $$a.i9$1bv32$1);
    $$a.i9$1bv32$2 := (if p0$2 then v99$2 else $$a.i9$1bv32$2);
    $$a.i9$2bv32$1 := (if p0$1 then v100$1 else $$a.i9$2bv32$1);
    $$a.i9$2bv32$2 := (if p0$2 then v100$2 else $$a.i9$2bv32$2);
    $$b.i10$0bv32$1 := (if p0$1 then v101$1 else $$b.i10$0bv32$1);
    $$b.i10$0bv32$2 := (if p0$2 then v101$2 else $$b.i10$0bv32$2);
    $$b.i10$1bv32$1 := (if p0$1 then v102$1 else $$b.i10$1bv32$1);
    $$b.i10$1bv32$2 := (if p0$2 then v102$2 else $$b.i10$1bv32$2);
    $$b.i10$2bv32$1 := (if p0$1 then v103$1 else $$b.i10$2bv32$1);
    $$b.i10$2bv32$2 := (if p0$2 then v103$2 else $$b.i10$2bv32$2);
    v104$1 := (if p0$1 then $$a.i9$0bv32$1 else v104$1);
    v104$2 := (if p0$2 then $$a.i9$0bv32$2 else v104$2);
    v105$1 := (if p0$1 then $$b.i10$0bv32$1 else v105$1);
    v105$2 := (if p0$2 then $$b.i10$0bv32$2 else v105$2);
    v106$1 := (if p0$1 then $$a.i9$1bv32$1 else v106$1);
    v106$2 := (if p0$2 then $$a.i9$1bv32$2 else v106$2);
    v107$1 := (if p0$1 then $$b.i10$1bv32$1 else v107$1);
    v107$2 := (if p0$2 then $$b.i10$1bv32$2 else v107$2);
    v108$1 := (if p0$1 then $$a.i9$2bv32$1 else v108$1);
    v108$2 := (if p0$2 then $$a.i9$2bv32$2 else v108$2);
    v109$1 := (if p0$1 then $$b.i10$2bv32$1 else v109$1);
    v109$2 := (if p0$2 then $$b.i10$2bv32$2 else v109$2);
    $$0$0bv32$1 := (if p0$1 then FADD32(v104$1, v105$1) else $$0$0bv32$1);
    $$0$0bv32$2 := (if p0$2 then FADD32(v104$2, v105$2) else $$0$0bv32$2);
    $$0$1bv32$1 := (if p0$1 then FADD32(v106$1, v107$1) else $$0$1bv32$1);
    $$0$1bv32$2 := (if p0$2 then FADD32(v106$2, v107$2) else $$0$1bv32$2);
    $$0$2bv32$1 := (if p0$1 then FADD32(v108$1, v109$1) else $$0$2bv32$1);
    $$0$2bv32$2 := (if p0$2 then FADD32(v108$2, v109$2) else $$0$2bv32$2);
    v110$1 := (if p0$1 then $$0$0bv32$1 else v110$1);
    v110$2 := (if p0$2 then $$0$0bv32$2 else v110$2);
    v111$1 := (if p0$1 then $$0$1bv32$1 else v111$1);
    v111$2 := (if p0$2 then $$0$1bv32$2 else v111$2);
    v112$1 := (if p0$1 then $$0$2bv32$1 else v112$1);
    v112$2 := (if p0$2 then $$0$2bv32$2 else v112$2);
    $$1$0bv32$1 := (if p0$1 then v110$1 else $$1$0bv32$1);
    $$1$0bv32$2 := (if p0$2 then v110$2 else $$1$0bv32$2);
    $$1$1bv32$1 := (if p0$1 then v111$1 else $$1$1bv32$1);
    $$1$1bv32$2 := (if p0$2 then v111$2 else $$1$1bv32$2);
    $$1$2bv32$1 := (if p0$1 then v112$1 else $$1$2bv32$1);
    $$1$2bv32$2 := (if p0$2 then v112$2 else $$1$2bv32$2);
    v113$1 := (if p0$1 then $$1$0bv32$1 else v113$1);
    v113$2 := (if p0$2 then $$1$0bv32$2 else v113$2);
    v114$1 := (if p0$1 then $$1$1bv32$1 else v114$1);
    v114$2 := (if p0$2 then $$1$1bv32$2 else v114$2);
    v115$1 := (if p0$1 then $$1$2bv32$1 else v115$1);
    v115$2 := (if p0$2 then $$1$2bv32$2 else v115$2);
    $$32$0bv32$1 := (if p0$1 then v113$1 else $$32$0bv32$1);
    $$32$0bv32$2 := (if p0$2 then v113$2 else $$32$0bv32$2);
    $$32$1bv32$1 := (if p0$1 then v114$1 else $$32$1bv32$1);
    $$32$1bv32$2 := (if p0$2 then v114$2 else $$32$1bv32$2);
    $$32$2bv32$1 := (if p0$1 then v115$1 else $$32$2bv32$1);
    $$32$2bv32$2 := (if p0$2 then v115$2 else $$32$2bv32$2);
    v116$1 := (if p0$1 then $$M$4bv32$1 else v116$1);
    v116$2 := (if p0$2 then $$M$4bv32$2 else v116$2);
    $$43$0bv32$1 := (if p0$1 then v116$1 else $$43$0bv32$1);
    $$43$0bv32$2 := (if p0$2 then v116$2 else $$43$0bv32$2);
    v117$1 := (if p0$1 then $$M$5bv32$1 else v117$1);
    v117$2 := (if p0$2 then $$M$5bv32$2 else v117$2);
    $$43$1bv32$1 := (if p0$1 then v117$1 else $$43$1bv32$1);
    $$43$1bv32$2 := (if p0$2 then v117$2 else $$43$1bv32$2);
    v118$1 := (if p0$1 then $$M$6bv32$1 else v118$1);
    v118$2 := (if p0$2 then $$M$6bv32$2 else v118$2);
    $$43$2bv32$1 := (if p0$1 then v118$1 else $$43$2bv32$1);
    $$43$2bv32$2 := (if p0$2 then v118$2 else $$43$2bv32$2);
    v119$1 := (if p0$1 then $$M$7bv32$1 else v119$1);
    v119$2 := (if p0$2 then $$M$7bv32$2 else v119$2);
    $$43$3bv32$1 := (if p0$1 then v119$1 else $$43$3bv32$1);
    $$43$3bv32$2 := (if p0$2 then v119$2 else $$43$3bv32$2);
    v120$1 := (if p0$1 then $$43$0bv32$1 else v120$1);
    v120$2 := (if p0$2 then $$43$0bv32$2 else v120$2);
    v121$1 := (if p0$1 then $$43$1bv32$1 else v121$1);
    v121$2 := (if p0$2 then $$43$1bv32$2 else v121$2);
    v122$1 := (if p0$1 then $$43$2bv32$1 else v122$1);
    v122$2 := (if p0$2 then $$43$2bv32$2 else v122$2);
    v123$1 := (if p0$1 then $$43$3bv32$1 else v123$1);
    v123$2 := (if p0$2 then $$43$3bv32$2 else v123$2);
    $$a.i8$0bv32$1 := (if p0$1 then v120$1 else $$a.i8$0bv32$1);
    $$a.i8$0bv32$2 := (if p0$2 then v120$2 else $$a.i8$0bv32$2);
    $$a.i8$1bv32$1 := (if p0$1 then v121$1 else $$a.i8$1bv32$1);
    $$a.i8$1bv32$2 := (if p0$2 then v121$2 else $$a.i8$1bv32$2);
    $$a.i8$2bv32$1 := (if p0$1 then v122$1 else $$a.i8$2bv32$1);
    $$a.i8$2bv32$2 := (if p0$2 then v122$2 else $$a.i8$2bv32$2);
    $$a.i8$3bv32$1 := (if p0$1 then v123$1 else $$a.i8$3bv32$1);
    $$a.i8$3bv32$2 := (if p0$2 then v123$2 else $$a.i8$3bv32$2);
    v124$1 := (if p0$1 then $$a.i8$0bv32$1 else v124$1);
    v124$2 := (if p0$2 then $$a.i8$0bv32$2 else v124$2);
    v125$1 := (if p0$1 then $$a.i8$1bv32$1 else v125$1);
    v125$2 := (if p0$2 then $$a.i8$1bv32$2 else v125$2);
    v126$1 := (if p0$1 then $$a.i8$2bv32$1 else v126$1);
    v126$2 := (if p0$2 then $$a.i8$2bv32$2 else v126$2);
    $$2$0bv32$1 := (if p0$1 then v124$1 else $$2$0bv32$1);
    $$2$0bv32$2 := (if p0$2 then v124$2 else $$2$0bv32$2);
    $$2$1bv32$1 := (if p0$1 then v125$1 else $$2$1bv32$1);
    $$2$1bv32$2 := (if p0$2 then v125$2 else $$2$1bv32$2);
    $$2$2bv32$1 := (if p0$1 then v126$1 else $$2$2bv32$1);
    $$2$2bv32$2 := (if p0$2 then v126$2 else $$2$2bv32$2);
    v127$1 := (if p0$1 then $$2$0bv32$1 else v127$1);
    v127$2 := (if p0$2 then $$2$0bv32$2 else v127$2);
    v128$1 := (if p0$1 then $$2$1bv32$1 else v128$1);
    v128$2 := (if p0$2 then $$2$1bv32$2 else v128$2);
    v129$1 := (if p0$1 then $$2$2bv32$1 else v129$1);
    v129$2 := (if p0$2 then $$2$2bv32$2 else v129$2);
    $$3$0bv32$1 := (if p0$1 then v127$1 else $$3$0bv32$1);
    $$3$0bv32$2 := (if p0$2 then v127$2 else $$3$0bv32$2);
    $$3$1bv32$1 := (if p0$1 then v128$1 else $$3$1bv32$1);
    $$3$1bv32$2 := (if p0$2 then v128$2 else $$3$1bv32$2);
    $$3$2bv32$1 := (if p0$1 then v129$1 else $$3$2bv32$1);
    $$3$2bv32$2 := (if p0$2 then v129$2 else $$3$2bv32$2);
    v130$1 := (if p0$1 then $$3$0bv32$1 else v130$1);
    v130$2 := (if p0$2 then $$3$0bv32$2 else v130$2);
    v131$1 := (if p0$1 then $$3$1bv32$1 else v131$1);
    v131$2 := (if p0$2 then $$3$1bv32$2 else v131$2);
    v132$1 := (if p0$1 then $$3$2bv32$1 else v132$1);
    v132$2 := (if p0$2 then $$3$2bv32$2 else v132$2);
    $$42$0bv32$1 := (if p0$1 then v130$1 else $$42$0bv32$1);
    $$42$0bv32$2 := (if p0$2 then v130$2 else $$42$0bv32$2);
    $$42$1bv32$1 := (if p0$1 then v131$1 else $$42$1bv32$1);
    $$42$1bv32$2 := (if p0$2 then v131$2 else $$42$1bv32$2);
    $$42$2bv32$1 := (if p0$1 then v132$1 else $$42$2bv32$1);
    $$42$2bv32$2 := (if p0$2 then v132$2 else $$42$2bv32$2);
    v133$1 := (if p0$1 then FSUB32(UI32_TO_FP32(v1$1), FMUL32(UI32_TO_FP32($imageH), 1056964608bv32)) else v133$1);
    v133$2 := (if p0$2 then FSUB32(UI32_TO_FP32(v1$2), FMUL32(UI32_TO_FP32($imageH), 1056964608bv32)) else v133$2);
    v134$1 := (if p0$1 then $$42$0bv32$1 else v134$1);
    v134$2 := (if p0$2 then $$42$0bv32$2 else v134$2);
    v135$1 := (if p0$1 then $$42$1bv32$1 else v135$1);
    v135$2 := (if p0$2 then $$42$1bv32$2 else v135$2);
    v136$1 := (if p0$1 then $$42$2bv32$1 else v136$1);
    v136$2 := (if p0$2 then $$42$2bv32$2 else v136$2);
    $$a.i7$0bv32$1 := (if p0$1 then v134$1 else $$a.i7$0bv32$1);
    $$a.i7$0bv32$2 := (if p0$2 then v134$2 else $$a.i7$0bv32$2);
    $$a.i7$1bv32$1 := (if p0$1 then v135$1 else $$a.i7$1bv32$1);
    $$a.i7$1bv32$2 := (if p0$2 then v135$2 else $$a.i7$1bv32$2);
    $$a.i7$2bv32$1 := (if p0$1 then v136$1 else $$a.i7$2bv32$1);
    $$a.i7$2bv32$2 := (if p0$2 then v136$2 else $$a.i7$2bv32$2);
    v137$1 := (if p0$1 then $$a.i7$0bv32$1 else v137$1);
    v137$2 := (if p0$2 then $$a.i7$0bv32$2 else v137$2);
    v138$1 := (if p0$1 then $$a.i7$1bv32$1 else v138$1);
    v138$2 := (if p0$2 then $$a.i7$1bv32$2 else v138$2);
    v139$1 := (if p0$1 then $$a.i7$2bv32$1 else v139$1);
    v139$2 := (if p0$2 then $$a.i7$2bv32$2 else v139$2);
    $$4$0bv32$1 := (if p0$1 then FMUL32(v137$1, v133$1) else $$4$0bv32$1);
    $$4$0bv32$2 := (if p0$2 then FMUL32(v137$2, v133$2) else $$4$0bv32$2);
    $$4$1bv32$1 := (if p0$1 then FMUL32(v138$1, v133$1) else $$4$1bv32$1);
    $$4$1bv32$2 := (if p0$2 then FMUL32(v138$2, v133$2) else $$4$1bv32$2);
    $$4$2bv32$1 := (if p0$1 then FMUL32(v139$1, v133$1) else $$4$2bv32$1);
    $$4$2bv32$2 := (if p0$2 then FMUL32(v139$2, v133$2) else $$4$2bv32$2);
    v140$1 := (if p0$1 then $$4$0bv32$1 else v140$1);
    v140$2 := (if p0$2 then $$4$0bv32$2 else v140$2);
    v141$1 := (if p0$1 then $$4$1bv32$1 else v141$1);
    v141$2 := (if p0$2 then $$4$1bv32$2 else v141$2);
    v142$1 := (if p0$1 then $$4$2bv32$1 else v142$1);
    v142$2 := (if p0$2 then $$4$2bv32$2 else v142$2);
    $$5$0bv32$1 := (if p0$1 then v140$1 else $$5$0bv32$1);
    $$5$0bv32$2 := (if p0$2 then v140$2 else $$5$0bv32$2);
    $$5$1bv32$1 := (if p0$1 then v141$1 else $$5$1bv32$1);
    $$5$1bv32$2 := (if p0$2 then v141$2 else $$5$1bv32$2);
    $$5$2bv32$1 := (if p0$1 then v142$1 else $$5$2bv32$1);
    $$5$2bv32$2 := (if p0$2 then v142$2 else $$5$2bv32$2);
    v143$1 := (if p0$1 then $$5$0bv32$1 else v143$1);
    v143$2 := (if p0$2 then $$5$0bv32$2 else v143$2);
    v144$1 := (if p0$1 then $$5$1bv32$1 else v144$1);
    v144$2 := (if p0$2 then $$5$1bv32$2 else v144$2);
    v145$1 := (if p0$1 then $$5$2bv32$1 else v145$1);
    v145$2 := (if p0$2 then $$5$2bv32$2 else v145$2);
    $$41$0bv32$1 := (if p0$1 then v143$1 else $$41$0bv32$1);
    $$41$0bv32$2 := (if p0$2 then v143$2 else $$41$0bv32$2);
    $$41$1bv32$1 := (if p0$1 then v144$1 else $$41$1bv32$1);
    $$41$1bv32$2 := (if p0$2 then v144$2 else $$41$1bv32$2);
    $$41$2bv32$1 := (if p0$1 then v145$1 else $$41$2bv32$1);
    $$41$2bv32$2 := (if p0$2 then v145$2 else $$41$2bv32$2);
    v146$1 := (if p0$1 then $$41$0bv32$1 else v146$1);
    v146$2 := (if p0$2 then $$41$0bv32$2 else v146$2);
    v147$1 := (if p0$1 then $$41$1bv32$1 else v147$1);
    v147$2 := (if p0$2 then $$41$1bv32$2 else v147$2);
    v148$1 := (if p0$1 then $$41$2bv32$1 else v148$1);
    v148$2 := (if p0$2 then $$41$2bv32$2 else v148$2);
    $$a.i6$0bv32$1 := (if p0$1 then v146$1 else $$a.i6$0bv32$1);
    $$a.i6$0bv32$2 := (if p0$2 then v146$2 else $$a.i6$0bv32$2);
    $$a.i6$1bv32$1 := (if p0$1 then v147$1 else $$a.i6$1bv32$1);
    $$a.i6$1bv32$2 := (if p0$2 then v147$2 else $$a.i6$1bv32$2);
    $$a.i6$2bv32$1 := (if p0$1 then v148$1 else $$a.i6$2bv32$1);
    $$a.i6$2bv32$2 := (if p0$2 then v148$2 else $$a.i6$2bv32$2);
    v149$1 := (if p0$1 then $$a.i6$0bv32$1 else v149$1);
    v149$2 := (if p0$2 then $$a.i6$0bv32$2 else v149$2);
    v150$1 := (if p0$1 then $$a.i6$1bv32$1 else v150$1);
    v150$2 := (if p0$2 then $$a.i6$1bv32$2 else v150$2);
    v151$1 := (if p0$1 then $$a.i6$2bv32$1 else v151$1);
    v151$2 := (if p0$2 then $$a.i6$2bv32$2 else v151$2);
    $$6$0bv32$1 := (if p0$1 then FMUL32(v149$1, v5$1) else $$6$0bv32$1);
    $$6$0bv32$2 := (if p0$2 then FMUL32(v149$2, v5$2) else $$6$0bv32$2);
    $$6$1bv32$1 := (if p0$1 then FMUL32(v150$1, v5$1) else $$6$1bv32$1);
    $$6$1bv32$2 := (if p0$2 then FMUL32(v150$2, v5$2) else $$6$1bv32$2);
    $$6$2bv32$1 := (if p0$1 then FMUL32(v151$1, v5$1) else $$6$2bv32$1);
    $$6$2bv32$2 := (if p0$2 then FMUL32(v151$2, v5$2) else $$6$2bv32$2);
    v152$1 := (if p0$1 then $$6$0bv32$1 else v152$1);
    v152$2 := (if p0$2 then $$6$0bv32$2 else v152$2);
    v153$1 := (if p0$1 then $$6$1bv32$1 else v153$1);
    v153$2 := (if p0$2 then $$6$1bv32$2 else v153$2);
    v154$1 := (if p0$1 then $$6$2bv32$1 else v154$1);
    v154$2 := (if p0$2 then $$6$2bv32$2 else v154$2);
    $$7$0bv32$1 := (if p0$1 then v152$1 else $$7$0bv32$1);
    $$7$0bv32$2 := (if p0$2 then v152$2 else $$7$0bv32$2);
    $$7$1bv32$1 := (if p0$1 then v153$1 else $$7$1bv32$1);
    $$7$1bv32$2 := (if p0$2 then v153$2 else $$7$1bv32$2);
    $$7$2bv32$1 := (if p0$1 then v154$1 else $$7$2bv32$1);
    $$7$2bv32$2 := (if p0$2 then v154$2 else $$7$2bv32$2);
    v155$1 := (if p0$1 then $$7$0bv32$1 else v155$1);
    v155$2 := (if p0$2 then $$7$0bv32$2 else v155$2);
    v156$1 := (if p0$1 then $$7$1bv32$1 else v156$1);
    v156$2 := (if p0$2 then $$7$1bv32$2 else v156$2);
    v157$1 := (if p0$1 then $$7$2bv32$1 else v157$1);
    v157$2 := (if p0$2 then $$7$2bv32$2 else v157$2);
    $$40$0bv32$1 := (if p0$1 then v155$1 else $$40$0bv32$1);
    $$40$0bv32$2 := (if p0$2 then v155$2 else $$40$0bv32$2);
    $$40$1bv32$1 := (if p0$1 then v156$1 else $$40$1bv32$1);
    $$40$1bv32$2 := (if p0$2 then v156$2 else $$40$1bv32$2);
    $$40$2bv32$1 := (if p0$1 then v157$1 else $$40$2bv32$1);
    $$40$2bv32$2 := (if p0$2 then v157$2 else $$40$2bv32$2);
    v158$1 := (if p0$1 then $$32$0bv32$1 else v158$1);
    v158$2 := (if p0$2 then $$32$0bv32$2 else v158$2);
    v159$1 := (if p0$1 then $$32$1bv32$1 else v159$1);
    v159$2 := (if p0$2 then $$32$1bv32$2 else v159$2);
    v160$1 := (if p0$1 then $$32$2bv32$1 else v160$1);
    v160$2 := (if p0$2 then $$32$2bv32$2 else v160$2);
    v161$1 := (if p0$1 then $$40$0bv32$1 else v161$1);
    v161$2 := (if p0$2 then $$40$0bv32$2 else v161$2);
    v162$1 := (if p0$1 then $$40$1bv32$1 else v162$1);
    v162$2 := (if p0$2 then $$40$1bv32$2 else v162$2);
    v163$1 := (if p0$1 then $$40$2bv32$1 else v163$1);
    v163$2 := (if p0$2 then $$40$2bv32$2 else v163$2);
    $$a.i5$0bv32$1 := (if p0$1 then v158$1 else $$a.i5$0bv32$1);
    $$a.i5$0bv32$2 := (if p0$2 then v158$2 else $$a.i5$0bv32$2);
    $$a.i5$1bv32$1 := (if p0$1 then v159$1 else $$a.i5$1bv32$1);
    $$a.i5$1bv32$2 := (if p0$2 then v159$2 else $$a.i5$1bv32$2);
    $$a.i5$2bv32$1 := (if p0$1 then v160$1 else $$a.i5$2bv32$1);
    $$a.i5$2bv32$2 := (if p0$2 then v160$2 else $$a.i5$2bv32$2);
    $$b.i$0bv32$1 := (if p0$1 then v161$1 else $$b.i$0bv32$1);
    $$b.i$0bv32$2 := (if p0$2 then v161$2 else $$b.i$0bv32$2);
    $$b.i$1bv32$1 := (if p0$1 then v162$1 else $$b.i$1bv32$1);
    $$b.i$1bv32$2 := (if p0$2 then v162$2 else $$b.i$1bv32$2);
    $$b.i$2bv32$1 := (if p0$1 then v163$1 else $$b.i$2bv32$1);
    $$b.i$2bv32$2 := (if p0$2 then v163$2 else $$b.i$2bv32$2);
    v164$1 := (if p0$1 then $$a.i5$0bv32$1 else v164$1);
    v164$2 := (if p0$2 then $$a.i5$0bv32$2 else v164$2);
    v165$1 := (if p0$1 then $$b.i$0bv32$1 else v165$1);
    v165$2 := (if p0$2 then $$b.i$0bv32$2 else v165$2);
    v166$1 := (if p0$1 then $$a.i5$1bv32$1 else v166$1);
    v166$2 := (if p0$2 then $$a.i5$1bv32$2 else v166$2);
    v167$1 := (if p0$1 then $$b.i$1bv32$1 else v167$1);
    v167$2 := (if p0$2 then $$b.i$1bv32$2 else v167$2);
    v168$1 := (if p0$1 then $$a.i5$2bv32$1 else v168$1);
    v168$2 := (if p0$2 then $$a.i5$2bv32$2 else v168$2);
    v169$1 := (if p0$1 then $$b.i$2bv32$1 else v169$1);
    v169$2 := (if p0$2 then $$b.i$2bv32$2 else v169$2);
    $$8$0bv32$1 := (if p0$1 then FADD32(v164$1, v165$1) else $$8$0bv32$1);
    $$8$0bv32$2 := (if p0$2 then FADD32(v164$2, v165$2) else $$8$0bv32$2);
    $$8$1bv32$1 := (if p0$1 then FADD32(v166$1, v167$1) else $$8$1bv32$1);
    $$8$1bv32$2 := (if p0$2 then FADD32(v166$2, v167$2) else $$8$1bv32$2);
    $$8$2bv32$1 := (if p0$1 then FADD32(v168$1, v169$1) else $$8$2bv32$1);
    $$8$2bv32$2 := (if p0$2 then FADD32(v168$2, v169$2) else $$8$2bv32$2);
    v170$1 := (if p0$1 then $$8$0bv32$1 else v170$1);
    v170$2 := (if p0$2 then $$8$0bv32$2 else v170$2);
    v171$1 := (if p0$1 then $$8$1bv32$1 else v171$1);
    v171$2 := (if p0$2 then $$8$1bv32$2 else v171$2);
    v172$1 := (if p0$1 then $$8$2bv32$1 else v172$1);
    v172$2 := (if p0$2 then $$8$2bv32$2 else v172$2);
    $$9$0bv32$1 := (if p0$1 then v170$1 else $$9$0bv32$1);
    $$9$0bv32$2 := (if p0$2 then v170$2 else $$9$0bv32$2);
    $$9$1bv32$1 := (if p0$1 then v171$1 else $$9$1bv32$1);
    $$9$1bv32$2 := (if p0$2 then v171$2 else $$9$1bv32$2);
    $$9$2bv32$1 := (if p0$1 then v172$1 else $$9$2bv32$1);
    $$9$2bv32$2 := (if p0$2 then v172$2 else $$9$2bv32$2);
    v173$1 := (if p0$1 then $$9$0bv32$1 else v173$1);
    v173$2 := (if p0$2 then $$9$0bv32$2 else v173$2);
    v174$1 := (if p0$1 then $$9$1bv32$1 else v174$1);
    v174$2 := (if p0$2 then $$9$1bv32$2 else v174$2);
    v175$1 := (if p0$1 then $$9$2bv32$1 else v175$1);
    v175$2 := (if p0$2 then $$9$2bv32$2 else v175$2);
    $$31$0bv32$1 := (if p0$1 then v173$1 else $$31$0bv32$1);
    $$31$0bv32$2 := (if p0$2 then v173$2 else $$31$0bv32$2);
    $$31$1bv32$1 := (if p0$1 then v174$1 else $$31$1bv32$1);
    $$31$1bv32$2 := (if p0$2 then v174$2 else $$31$1bv32$2);
    $$31$2bv32$1 := (if p0$1 then v175$1 else $$31$2bv32$1);
    $$31$2bv32$2 := (if p0$2 then v175$2 else $$31$2bv32$2);
    v176$1 := (if p0$1 then $$31$0bv32$1 else v176$1);
    v176$2 := (if p0$2 then $$31$0bv32$2 else v176$2);
    $$R$3bv32$1 := (if p0$1 then v176$1 else $$R$3bv32$1);
    $$R$3bv32$2 := (if p0$2 then v176$2 else $$R$3bv32$2);
    v177$1 := (if p0$1 then $$31$1bv32$1 else v177$1);
    v177$2 := (if p0$2 then $$31$1bv32$2 else v177$2);
    $$R$4bv32$1 := (if p0$1 then v177$1 else $$R$4bv32$1);
    $$R$4bv32$2 := (if p0$2 then v177$2 else $$R$4bv32$2);
    v178$1 := (if p0$1 then $$31$2bv32$1 else v178$1);
    v178$2 := (if p0$2 then $$31$2bv32$2 else v178$2);
    $$R$5bv32$1 := (if p0$1 then v178$1 else $$R$5bv32$1);
    $$R$5bv32$2 := (if p0$2 then v178$2 else $$R$5bv32$2);
    v179$1 := (if p0$1 then $$R$3bv32$1 else v179$1);
    v179$2 := (if p0$2 then $$R$3bv32$2 else v179$2);
    $$45$0bv32$1 := (if p0$1 then v179$1 else $$45$0bv32$1);
    $$45$0bv32$2 := (if p0$2 then v179$2 else $$45$0bv32$2);
    v180$1 := (if p0$1 then $$R$4bv32$1 else v180$1);
    v180$2 := (if p0$2 then $$R$4bv32$2 else v180$2);
    $$45$1bv32$1 := (if p0$1 then v180$1 else $$45$1bv32$1);
    $$45$1bv32$2 := (if p0$2 then v180$2 else $$45$1bv32$2);
    v181$1 := (if p0$1 then $$R$5bv32$1 else v181$1);
    v181$2 := (if p0$2 then $$R$5bv32$2 else v181$2);
    $$45$2bv32$1 := (if p0$1 then v181$1 else $$45$2bv32$1);
    $$45$2bv32$2 := (if p0$2 then v181$2 else $$45$2bv32$2);
    v182$1 := (if p0$1 then $$45$0bv32$1 else v182$1);
    v182$2 := (if p0$2 then $$45$0bv32$2 else v182$2);
    v183$1 := (if p0$1 then $$45$1bv32$1 else v183$1);
    v183$2 := (if p0$2 then $$45$1bv32$2 else v183$2);
    v184$1 := (if p0$1 then $$45$2bv32$1 else v184$1);
    v184$2 := (if p0$2 then $$45$2bv32$2 else v184$2);
    call {:sourceloc_num 348} v185$1, v185$2 := $_Z9normalize6float3(p0$1, v182$1, v183$1, v184$1, p0$2, v182$2, v183$2, v184$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z9normalize6float3"} true;
    $$44$0bv32$1 := (if p0$1 then v185$1[32:0] else $$44$0bv32$1);
    $$44$0bv32$2 := (if p0$2 then v185$2[32:0] else $$44$0bv32$2);
    $$44$1bv32$1 := (if p0$1 then v185$1[64:32] else $$44$1bv32$1);
    $$44$1bv32$2 := (if p0$2 then v185$2[64:32] else $$44$1bv32$2);
    $$44$2bv32$1 := (if p0$1 then v185$1[96:64] else $$44$2bv32$1);
    $$44$2bv32$2 := (if p0$2 then v185$2[96:64] else $$44$2bv32$2);
    v186$1 := (if p0$1 then $$44$0bv32$1 else v186$1);
    v186$2 := (if p0$2 then $$44$0bv32$2 else v186$2);
    $$R$3bv32$1 := (if p0$1 then v186$1 else $$R$3bv32$1);
    $$R$3bv32$2 := (if p0$2 then v186$2 else $$R$3bv32$2);
    v187$1 := (if p0$1 then $$44$1bv32$1 else v187$1);
    v187$2 := (if p0$2 then $$44$1bv32$2 else v187$2);
    $$R$4bv32$1 := (if p0$1 then v187$1 else $$R$4bv32$1);
    $$R$4bv32$2 := (if p0$2 then v187$2 else $$R$4bv32$2);
    v188$1 := (if p0$1 then $$44$2bv32$1 else v188$1);
    v188$2 := (if p0$2 then $$44$2bv32$2 else v188$2);
    $$R$5bv32$1 := (if p0$1 then v188$1 else $$R$5bv32$1);
    $$R$5bv32$2 := (if p0$2 then v188$2 else $$R$5bv32$2);
    v189$1 := (if p0$1 then $$cnode$1[40bv32] else v189$1);
    v189$2 := (if p0$2 then $$cnode$2[40bv32] else v189$2);
    $$s$0bv32$1 := (if p0$1 then v189$1 else $$s$0bv32$1);
    $$s$0bv32$2 := (if p0$2 then v189$2 else $$s$0bv32$2);
    v190$1 := (if p0$1 then $$cnode$1[41bv32] else v190$1);
    v190$2 := (if p0$2 then $$cnode$2[41bv32] else v190$2);
    $$s$1bv32$1 := (if p0$1 then v190$1 else $$s$1bv32$1);
    $$s$1bv32$2 := (if p0$2 then v190$2 else $$s$1bv32$2);
    v191$1 := (if p0$1 then $$cnode$1[42bv32] else v191$1);
    v191$2 := (if p0$2 then $$cnode$2[42bv32] else v191$2);
    $$s$2bv32$1 := (if p0$1 then v191$1 else $$s$2bv32$1);
    $$s$2bv32$2 := (if p0$2 then v191$2 else $$s$2bv32$2);
    v192$1 := (if p0$1 then $$cnode$1[43bv32] else v192$1);
    v192$2 := (if p0$2 then $$cnode$2[43bv32] else v192$2);
    $$s$3bv32$1 := (if p0$1 then v192$1 else $$s$3bv32$1);
    $$s$3bv32$2 := (if p0$2 then v192$2 else $$s$3bv32$2);
    v193$1 := (if p0$1 then $$cnode$1[44bv32] else v193$1);
    v193$2 := (if p0$2 then $$cnode$2[44bv32] else v193$2);
    $$s$4bv32$1 := (if p0$1 then v193$1 else $$s$4bv32$1);
    $$s$4bv32$2 := (if p0$2 then v193$2 else $$s$4bv32$2);
    v194$1 := (if p0$1 then $$cnode$1[45bv32] else v194$1);
    v194$2 := (if p0$2 then $$cnode$2[45bv32] else v194$2);
    $$s$5bv32$1 := (if p0$1 then v194$1 else $$s$5bv32$1);
    $$s$5bv32$2 := (if p0$2 then v194$2 else $$s$5bv32$2);
    v195$1 := (if p0$1 then $$cnode$1[46bv32] else v195$1);
    v195$2 := (if p0$2 then $$cnode$2[46bv32] else v195$2);
    $$s$6bv32$1 := (if p0$1 then v195$1 else $$s$6bv32$1);
    $$s$6bv32$2 := (if p0$2 then v195$2 else $$s$6bv32$2);
    v196$1 := (if p0$1 then $$cnode$1[47bv32] else v196$1);
    v196$2 := (if p0$2 then $$cnode$2[47bv32] else v196$2);
    $$s$7bv32$1 := (if p0$1 then v196$1 else $$s$7bv32$1);
    $$s$7bv32$2 := (if p0$2 then v196$2 else $$s$7bv32$2);
    v197$1 := (if p0$1 then $$cnode$1[48bv32] else v197$1);
    v197$2 := (if p0$2 then $$cnode$2[48bv32] else v197$2);
    $$s$8bv32$1 := (if p0$1 then v197$1 else $$s$8bv32$1);
    $$s$8bv32$2 := (if p0$2 then v197$2 else $$s$8bv32$2);
    v198$1 := (if p0$1 then $$cnode$1[49bv32] else v198$1);
    v198$2 := (if p0$2 then $$cnode$2[49bv32] else v198$2);
    $$s$9bv32$1 := (if p0$1 then v198$1 else $$s$9bv32$1);
    $$s$9bv32$2 := (if p0$2 then v198$2 else $$s$9bv32$2);
    v199$1 := (if p0$1 then $$cnode$1[50bv32] else v199$1);
    v199$2 := (if p0$2 then $$cnode$2[50bv32] else v199$2);
    $$s$10bv32$1 := (if p0$1 then v199$1 else $$s$10bv32$1);
    $$s$10bv32$2 := (if p0$2 then v199$2 else $$s$10bv32$2);
    v200$1 := (if p0$1 then $$cnode$1[51bv32] else v200$1);
    v200$2 := (if p0$2 then $$cnode$2[51bv32] else v200$2);
    $$s$11bv32$1 := (if p0$1 then v200$1 else $$s$11bv32$1);
    $$s$11bv32$2 := (if p0$2 then v200$2 else $$s$11bv32$2);
    v201$1 := (if p0$1 then $$cnode$1[52bv32] else v201$1);
    v201$2 := (if p0$2 then $$cnode$2[52bv32] else v201$2);
    $$s$12bv32$1 := (if p0$1 then v201$1 else $$s$12bv32$1);
    $$s$12bv32$2 := (if p0$2 then v201$2 else $$s$12bv32$2);
    v202$1 := (if p0$1 then $$cnode$1[53bv32] else v202$1);
    v202$2 := (if p0$2 then $$cnode$2[53bv32] else v202$2);
    $$s$13bv32$1 := (if p0$1 then v202$1 else $$s$13bv32$1);
    $$s$13bv32$2 := (if p0$2 then v202$2 else $$s$13bv32$2);
    v203$1 := (if p0$1 then $$cnode$1[54bv32] else v203$1);
    v203$2 := (if p0$2 then $$cnode$2[54bv32] else v203$2);
    $$s$14bv32$1 := (if p0$1 then v203$1 else $$s$14bv32$1);
    $$s$14bv32$2 := (if p0$2 then v203$2 else $$s$14bv32$2);
    v204$1 := (if p0$1 then $$cnode$1[55bv32] else v204$1);
    v204$2 := (if p0$2 then $$cnode$2[55bv32] else v204$2);
    $$s$15bv32$1 := (if p0$1 then v204$1 else $$s$15bv32$1);
    $$s$15bv32$2 := (if p0$2 then v204$2 else $$s$15bv32$2);
    v205$1 := (if p0$1 then $$cnode$1[56bv32] else v205$1);
    v205$2 := (if p0$2 then $$cnode$2[56bv32] else v205$2);
    $$s$16bv32$1 := (if p0$1 then v205$1 else $$s$16bv32$1);
    $$s$16bv32$2 := (if p0$2 then v205$2 else $$s$16bv32$2);
    v206$1 := (if p0$1 then $$cnode$1[57bv32] else v206$1);
    v206$2 := (if p0$2 then $$cnode$2[57bv32] else v206$2);
    $$s$17bv32$1 := (if p0$1 then v206$1 else $$s$17bv32$1);
    $$s$17bv32$2 := (if p0$2 then v206$2 else $$s$17bv32$2);
    v207$1 := (if p0$1 then $$cnode$1[58bv32] else v207$1);
    v207$2 := (if p0$2 then $$cnode$2[58bv32] else v207$2);
    $$s$18bv32$1 := (if p0$1 then v207$1 else $$s$18bv32$1);
    $$s$18bv32$2 := (if p0$2 then v207$2 else $$s$18bv32$2);
    v208$1 := (if p0$1 then $$cnode$1[59bv32] else v208$1);
    v208$2 := (if p0$2 then $$cnode$2[59bv32] else v208$2);
    $$s$19bv32$1 := (if p0$1 then v208$1 else $$s$19bv32$1);
    $$s$19bv32$2 := (if p0$2 then v208$2 else $$s$19bv32$2);
    v209$1 := (if p0$1 then $$cnode$1[60bv32] else v209$1);
    v209$2 := (if p0$2 then $$cnode$2[60bv32] else v209$2);
    $$s$20bv32$1 := (if p0$1 then v209$1 else $$s$20bv32$1);
    $$s$20bv32$2 := (if p0$2 then v209$2 else $$s$20bv32$2);
    v210$1 := (if p0$1 then $$cnode$1[61bv32] else v210$1);
    v210$2 := (if p0$2 then $$cnode$2[61bv32] else v210$2);
    $$s$21bv32$1 := (if p0$1 then v210$1 else $$s$21bv32$1);
    $$s$21bv32$2 := (if p0$2 then v210$2 else $$s$21bv32$2);
    v211$1 := (if p0$1 then $$cnode$1[62bv32] else v211$1);
    v211$2 := (if p0$2 then $$cnode$2[62bv32] else v211$2);
    $$s$22bv32$1 := (if p0$1 then v211$1 else $$s$22bv32$1);
    $$s$22bv32$2 := (if p0$2 then v211$2 else $$s$22bv32$2);
    v212$1 := (if p0$1 then $$cnode$1[63bv32] else v212$1);
    v212$2 := (if p0$2 then $$cnode$2[63bv32] else v212$2);
    $$s$23bv32$1 := (if p0$1 then v212$1 else $$s$23bv32$1);
    $$s$23bv32$2 := (if p0$2 then v212$2 else $$s$23bv32$2);
    v213$1 := (if p0$1 then $$cnode$1[64bv32] else v213$1);
    v213$2 := (if p0$2 then $$cnode$2[64bv32] else v213$2);
    $$s$24bv32$1 := (if p0$1 then v213$1 else $$s$24bv32$1);
    $$s$24bv32$2 := (if p0$2 then v213$2 else $$s$24bv32$2);
    v214$1 := (if p0$1 then $$cnode$1[65bv32] else v214$1);
    v214$2 := (if p0$2 then $$cnode$2[65bv32] else v214$2);
    $$s$25bv32$1 := (if p0$1 then v214$1 else $$s$25bv32$1);
    $$s$25bv32$2 := (if p0$2 then v214$2 else $$s$25bv32$2);
    v215$1 := (if p0$1 then $$cnode$1[66bv32] else v215$1);
    v215$2 := (if p0$2 then $$cnode$2[66bv32] else v215$2);
    $$s$26bv32$1 := (if p0$1 then v215$1 else $$s$26bv32$1);
    $$s$26bv32$2 := (if p0$2 then v215$2 else $$s$26bv32$2);
    v216$1 := (if p0$1 then $$cnode$1[67bv32] else v216$1);
    v216$2 := (if p0$2 then $$cnode$2[67bv32] else v216$2);
    $$s$27bv32$1 := (if p0$1 then v216$1 else $$s$27bv32$1);
    $$s$27bv32$2 := (if p0$2 then v216$2 else $$s$27bv32$2);
    v217$1 := (if p0$1 then $$cnode$1[68bv32] else v217$1);
    v217$2 := (if p0$2 then $$cnode$2[68bv32] else v217$2);
    $$s$28bv32$1 := (if p0$1 then v217$1 else $$s$28bv32$1);
    $$s$28bv32$2 := (if p0$2 then v217$2 else $$s$28bv32$2);
    v218$1 := (if p0$1 then $$cnode$1[69bv32] else v218$1);
    v218$2 := (if p0$2 then $$cnode$2[69bv32] else v218$2);
    $$s$29bv32$1 := (if p0$1 then v218$1 else $$s$29bv32$1);
    $$s$29bv32$2 := (if p0$2 then v218$2 else $$s$29bv32$2);
    v219$1 := (if p0$1 then $$cnode$1[70bv32] else v219$1);
    v219$2 := (if p0$2 then $$cnode$2[70bv32] else v219$2);
    $$s$30bv32$1 := (if p0$1 then v219$1 else $$s$30bv32$1);
    $$s$30bv32$2 := (if p0$2 then v219$2 else $$s$30bv32$2);
    v220$1 := (if p0$1 then $$cnode$1[71bv32] else v220$1);
    v220$2 := (if p0$2 then $$cnode$2[71bv32] else v220$2);
    $$s$31bv32$1 := (if p0$1 then v220$1 else $$s$31bv32$1);
    $$s$31bv32$2 := (if p0$2 then v220$2 else $$s$31bv32$2);
    v221$1 := (if p0$1 then $$s$0bv32$1 else v221$1);
    v221$2 := (if p0$2 then $$s$0bv32$2 else v221$2);
    v222$1 := (if p0$1 then $$s$1bv32$1 else v222$1);
    v222$2 := (if p0$2 then $$s$1bv32$2 else v222$2);
    v223$1 := (if p0$1 then $$s$2bv32$1 else v223$1);
    v223$2 := (if p0$2 then $$s$2bv32$2 else v223$2);
    v224$1 := (if p0$1 then $$s$3bv32$1 else v224$1);
    v224$2 := (if p0$2 then $$s$3bv32$2 else v224$2);
    v225$1 := (if p0$1 then FADD32(v224$1 ++ v223$1 ++ v222$1 ++ v221$1, $pas) else v225$1);
    v225$2 := (if p0$2 then FADD32(v224$2 ++ v223$2 ++ v222$2 ++ v221$2, $pas) else v225$2);
    $$s$0bv32$1 := (if p0$1 then v225$1[8:0] else $$s$0bv32$1);
    $$s$0bv32$2 := (if p0$2 then v225$2[8:0] else $$s$0bv32$2);
    $$s$1bv32$1 := (if p0$1 then v225$1[16:8] else $$s$1bv32$1);
    $$s$1bv32$2 := (if p0$2 then v225$2[16:8] else $$s$1bv32$2);
    $$s$2bv32$1 := (if p0$1 then v225$1[24:16] else $$s$2bv32$1);
    $$s$2bv32$2 := (if p0$2 then v225$2[24:16] else $$s$2bv32$2);
    $$s$3bv32$1 := (if p0$1 then v225$1[32:24] else $$s$3bv32$1);
    $$s$3bv32$2 := (if p0$2 then v225$2[32:24] else $$s$3bv32$2);
    v226$1 := (if p0$1 then $$R$0bv32$1 else v226$1);
    v226$2 := (if p0$2 then $$R$0bv32$2 else v226$2);
    $$46$0bv32$1 := (if p0$1 then v226$1 else $$46$0bv32$1);
    $$46$0bv32$2 := (if p0$2 then v226$2 else $$46$0bv32$2);
    v227$1 := (if p0$1 then $$R$1bv32$1 else v227$1);
    v227$2 := (if p0$2 then $$R$1bv32$2 else v227$2);
    $$46$1bv32$1 := (if p0$1 then v227$1 else $$46$1bv32$1);
    $$46$1bv32$2 := (if p0$2 then v227$2 else $$46$1bv32$2);
    v228$1 := (if p0$1 then $$R$2bv32$1 else v228$1);
    v228$2 := (if p0$2 then $$R$2bv32$2 else v228$2);
    $$46$2bv32$1 := (if p0$1 then v228$1 else $$46$2bv32$1);
    $$46$2bv32$2 := (if p0$2 then v228$2 else $$46$2bv32$2);
    v229$1 := (if p0$1 then $$R$3bv32$1 else v229$1);
    v229$2 := (if p0$2 then $$R$3bv32$2 else v229$2);
    $$46$3bv32$1 := (if p0$1 then v229$1 else $$46$3bv32$1);
    $$46$3bv32$2 := (if p0$2 then v229$2 else $$46$3bv32$2);
    v230$1 := (if p0$1 then $$R$4bv32$1 else v230$1);
    v230$2 := (if p0$2 then $$R$4bv32$2 else v230$2);
    $$46$4bv32$1 := (if p0$1 then v230$1 else $$46$4bv32$1);
    $$46$4bv32$2 := (if p0$2 then v230$2 else $$46$4bv32$2);
    v231$1 := (if p0$1 then $$R$5bv32$1 else v231$1);
    v231$2 := (if p0$2 then $$R$5bv32$2 else v231$2);
    $$46$5bv32$1 := (if p0$1 then v231$1 else $$46$5bv32$1);
    $$46$5bv32$2 := (if p0$2 then v231$2 else $$46$5bv32$2);
    v232$1 := (if p0$1 then $$s$0bv32$1 else v232$1);
    v232$2 := (if p0$2 then $$s$0bv32$2 else v232$2);
    $$47$0bv32$1 := (if p0$1 then v232$1 else $$47$0bv32$1);
    $$47$0bv32$2 := (if p0$2 then v232$2 else $$47$0bv32$2);
    v233$1 := (if p0$1 then $$s$1bv32$1 else v233$1);
    v233$2 := (if p0$2 then $$s$1bv32$2 else v233$2);
    $$47$1bv32$1 := (if p0$1 then v233$1 else $$47$1bv32$1);
    $$47$1bv32$2 := (if p0$2 then v233$2 else $$47$1bv32$2);
    v234$1 := (if p0$1 then $$s$2bv32$1 else v234$1);
    v234$2 := (if p0$2 then $$s$2bv32$2 else v234$2);
    $$47$2bv32$1 := (if p0$1 then v234$1 else $$47$2bv32$1);
    $$47$2bv32$2 := (if p0$2 then v234$2 else $$47$2bv32$2);
    v235$1 := (if p0$1 then $$s$3bv32$1 else v235$1);
    v235$2 := (if p0$2 then $$s$3bv32$2 else v235$2);
    $$47$3bv32$1 := (if p0$1 then v235$1 else $$47$3bv32$1);
    $$47$3bv32$2 := (if p0$2 then v235$2 else $$47$3bv32$2);
    v236$1 := (if p0$1 then $$s$4bv32$1 else v236$1);
    v236$2 := (if p0$2 then $$s$4bv32$2 else v236$2);
    $$47$4bv32$1 := (if p0$1 then v236$1 else $$47$4bv32$1);
    $$47$4bv32$2 := (if p0$2 then v236$2 else $$47$4bv32$2);
    v237$1 := (if p0$1 then $$s$5bv32$1 else v237$1);
    v237$2 := (if p0$2 then $$s$5bv32$2 else v237$2);
    $$47$5bv32$1 := (if p0$1 then v237$1 else $$47$5bv32$1);
    $$47$5bv32$2 := (if p0$2 then v237$2 else $$47$5bv32$2);
    v238$1 := (if p0$1 then $$s$6bv32$1 else v238$1);
    v238$2 := (if p0$2 then $$s$6bv32$2 else v238$2);
    $$47$6bv32$1 := (if p0$1 then v238$1 else $$47$6bv32$1);
    $$47$6bv32$2 := (if p0$2 then v238$2 else $$47$6bv32$2);
    v239$1 := (if p0$1 then $$s$7bv32$1 else v239$1);
    v239$2 := (if p0$2 then $$s$7bv32$2 else v239$2);
    $$47$7bv32$1 := (if p0$1 then v239$1 else $$47$7bv32$1);
    $$47$7bv32$2 := (if p0$2 then v239$2 else $$47$7bv32$2);
    v240$1 := (if p0$1 then $$s$8bv32$1 else v240$1);
    v240$2 := (if p0$2 then $$s$8bv32$2 else v240$2);
    $$47$8bv32$1 := (if p0$1 then v240$1 else $$47$8bv32$1);
    $$47$8bv32$2 := (if p0$2 then v240$2 else $$47$8bv32$2);
    v241$1 := (if p0$1 then $$s$9bv32$1 else v241$1);
    v241$2 := (if p0$2 then $$s$9bv32$2 else v241$2);
    $$47$9bv32$1 := (if p0$1 then v241$1 else $$47$9bv32$1);
    $$47$9bv32$2 := (if p0$2 then v241$2 else $$47$9bv32$2);
    v242$1 := (if p0$1 then $$s$10bv32$1 else v242$1);
    v242$2 := (if p0$2 then $$s$10bv32$2 else v242$2);
    $$47$10bv32$1 := (if p0$1 then v242$1 else $$47$10bv32$1);
    $$47$10bv32$2 := (if p0$2 then v242$2 else $$47$10bv32$2);
    v243$1 := (if p0$1 then $$s$11bv32$1 else v243$1);
    v243$2 := (if p0$2 then $$s$11bv32$2 else v243$2);
    $$47$11bv32$1 := (if p0$1 then v243$1 else $$47$11bv32$1);
    $$47$11bv32$2 := (if p0$2 then v243$2 else $$47$11bv32$2);
    v244$1 := (if p0$1 then $$s$12bv32$1 else v244$1);
    v244$2 := (if p0$2 then $$s$12bv32$2 else v244$2);
    v245$1 := (if p0$1 then $$s$13bv32$1 else v245$1);
    v245$2 := (if p0$2 then $$s$13bv32$2 else v245$2);
    v246$1 := (if p0$1 then $$s$14bv32$1 else v246$1);
    v246$2 := (if p0$2 then $$s$14bv32$2 else v246$2);
    v247$1 := (if p0$1 then $$s$15bv32$1 else v247$1);
    v247$2 := (if p0$2 then $$s$15bv32$2 else v247$2);
    v248$1 := (if p0$1 then FDIV32(v247$1 ++ v246$1 ++ v245$1 ++ v244$1, UI32_TO_FP32(BV32_UDIV($imageW, num_groups_x))) else v248$1);
    v248$2 := (if p0$2 then FDIV32(v247$2 ++ v246$2 ++ v245$2 ++ v244$2, UI32_TO_FP32(BV32_UDIV($imageW, num_groups_x))) else v248$2);
    v249$1 := (if p0$1 then $$46$0bv32$1 else v249$1);
    v249$2 := (if p0$2 then $$46$0bv32$2 else v249$2);
    v250$1 := (if p0$1 then $$46$1bv32$1 else v250$1);
    v250$2 := (if p0$2 then $$46$1bv32$2 else v250$2);
    v251$1 := (if p0$1 then $$46$2bv32$1 else v251$1);
    v251$2 := (if p0$2 then $$46$2bv32$2 else v251$2);
    v252$1 := (if p0$1 then $$46$3bv32$1 else v252$1);
    v252$2 := (if p0$2 then $$46$3bv32$2 else v252$2);
    v253$1 := (if p0$1 then $$46$4bv32$1 else v253$1);
    v253$2 := (if p0$2 then $$46$4bv32$2 else v253$2);
    v254$1 := (if p0$1 then $$46$5bv32$1 else v254$1);
    v254$2 := (if p0$2 then $$46$5bv32$2 else v254$2);
    v255$1 := (if p0$1 then $$47$0bv32$1 else v255$1);
    v255$2 := (if p0$2 then $$47$0bv32$2 else v255$2);
    v256$1 := (if p0$1 then $$47$1bv32$1 else v256$1);
    v256$2 := (if p0$2 then $$47$1bv32$2 else v256$2);
    v257$1 := (if p0$1 then $$47$2bv32$1 else v257$1);
    v257$2 := (if p0$2 then $$47$2bv32$2 else v257$2);
    v258$1 := (if p0$1 then $$47$3bv32$1 else v258$1);
    v258$2 := (if p0$2 then $$47$3bv32$2 else v258$2);
    v259$1 := (if p0$1 then $$47$4bv32$1 else v259$1);
    v259$2 := (if p0$2 then $$47$4bv32$2 else v259$2);
    v260$1 := (if p0$1 then $$47$5bv32$1 else v260$1);
    v260$2 := (if p0$2 then $$47$5bv32$2 else v260$2);
    v261$1 := (if p0$1 then $$47$6bv32$1 else v261$1);
    v261$2 := (if p0$2 then $$47$6bv32$2 else v261$2);
    v262$1 := (if p0$1 then $$47$7bv32$1 else v262$1);
    v262$2 := (if p0$2 then $$47$7bv32$2 else v262$2);
    v263$1 := (if p0$1 then $$47$8bv32$1 else v263$1);
    v263$2 := (if p0$2 then $$47$8bv32$2 else v263$2);
    v264$1 := (if p0$1 then $$47$9bv32$1 else v264$1);
    v264$2 := (if p0$2 then $$47$9bv32$2 else v264$2);
    v265$1 := (if p0$1 then $$47$10bv32$1 else v265$1);
    v265$2 := (if p0$2 then $$47$10bv32$2 else v265$2);
    v266$1 := (if p0$1 then $$47$11bv32$1 else v266$1);
    v266$2 := (if p0$2 then $$47$11bv32$2 else v266$2);
    $$R.i$0bv32$1 := (if p0$1 then v249$1 else $$R.i$0bv32$1);
    $$R.i$0bv32$2 := (if p0$2 then v249$2 else $$R.i$0bv32$2);
    $$R.i$1bv32$1 := (if p0$1 then v250$1 else $$R.i$1bv32$1);
    $$R.i$1bv32$2 := (if p0$2 then v250$2 else $$R.i$1bv32$2);
    $$R.i$2bv32$1 := (if p0$1 then v251$1 else $$R.i$2bv32$1);
    $$R.i$2bv32$2 := (if p0$2 then v251$2 else $$R.i$2bv32$2);
    $$R.i$3bv32$1 := (if p0$1 then v252$1 else $$R.i$3bv32$1);
    $$R.i$3bv32$2 := (if p0$2 then v252$2 else $$R.i$3bv32$2);
    $$R.i$4bv32$1 := (if p0$1 then v253$1 else $$R.i$4bv32$1);
    $$R.i$4bv32$2 := (if p0$2 then v253$2 else $$R.i$4bv32$2);
    $$R.i$5bv32$1 := (if p0$1 then v254$1 else $$R.i$5bv32$1);
    $$R.i$5bv32$2 := (if p0$2 then v254$2 else $$R.i$5bv32$2);
    $$C.i$0bv32$1 := (if p0$1 then v258$1 ++ v257$1 ++ v256$1 ++ v255$1 else $$C.i$0bv32$1);
    $$C.i$0bv32$2 := (if p0$2 then v258$2 ++ v257$2 ++ v256$2 ++ v255$2 else $$C.i$0bv32$2);
    $$C.i$1bv32$1 := (if p0$1 then v262$1 ++ v261$1 ++ v260$1 ++ v259$1 else $$C.i$1bv32$1);
    $$C.i$1bv32$2 := (if p0$2 then v262$2 ++ v261$2 ++ v260$2 ++ v259$2 else $$C.i$1bv32$2);
    $$C.i$2bv32$1 := (if p0$1 then v266$1 ++ v265$1 ++ v264$1 ++ v263$1 else $$C.i$2bv32$1);
    $$C.i$2bv32$2 := (if p0$2 then v266$2 ++ v265$2 ++ v264$2 ++ v263$2 else $$C.i$2bv32$2);
    v267$1 := (if p0$1 then $$C.i$0bv32$1 else v267$1);
    v267$2 := (if p0$2 then $$C.i$0bv32$2 else v267$2);
    $$18$0bv32$1 := (if p0$1 then v267$1 else $$18$0bv32$1);
    $$18$0bv32$2 := (if p0$2 then v267$2 else $$18$0bv32$2);
    v268$1 := (if p0$1 then $$C.i$1bv32$1 else v268$1);
    v268$2 := (if p0$2 then $$C.i$1bv32$2 else v268$2);
    $$18$1bv32$1 := (if p0$1 then v268$1 else $$18$1bv32$1);
    $$18$1bv32$2 := (if p0$2 then v268$2 else $$18$1bv32$2);
    v269$1 := (if p0$1 then $$C.i$2bv32$1 else v269$1);
    v269$2 := (if p0$2 then $$C.i$2bv32$2 else v269$2);
    $$18$2bv32$1 := (if p0$1 then v269$1 else $$18$2bv32$1);
    $$18$2bv32$2 := (if p0$2 then v269$2 else $$18$2bv32$2);
    v270$1 := (if p0$1 then $$R.i$0bv32$1 else v270$1);
    v270$2 := (if p0$2 then $$R.i$0bv32$2 else v270$2);
    $$19$0bv32$1 := (if p0$1 then v270$1 else $$19$0bv32$1);
    $$19$0bv32$2 := (if p0$2 then v270$2 else $$19$0bv32$2);
    v271$1 := (if p0$1 then $$R.i$1bv32$1 else v271$1);
    v271$2 := (if p0$2 then $$R.i$1bv32$2 else v271$2);
    $$19$1bv32$1 := (if p0$1 then v271$1 else $$19$1bv32$1);
    $$19$1bv32$2 := (if p0$2 then v271$2 else $$19$1bv32$2);
    v272$1 := (if p0$1 then $$R.i$2bv32$1 else v272$1);
    v272$2 := (if p0$2 then $$R.i$2bv32$2 else v272$2);
    $$19$2bv32$1 := (if p0$1 then v272$1 else $$19$2bv32$1);
    $$19$2bv32$2 := (if p0$2 then v272$2 else $$19$2bv32$2);
    v273$1 := (if p0$1 then $$18$0bv32$1 else v273$1);
    v273$2 := (if p0$2 then $$18$0bv32$2 else v273$2);
    v274$1 := (if p0$1 then $$18$1bv32$1 else v274$1);
    v274$2 := (if p0$2 then $$18$1bv32$2 else v274$2);
    v275$1 := (if p0$1 then $$18$2bv32$1 else v275$1);
    v275$2 := (if p0$2 then $$18$2bv32$2 else v275$2);
    v276$1 := (if p0$1 then $$19$0bv32$1 else v276$1);
    v276$2 := (if p0$2 then $$19$0bv32$2 else v276$2);
    v277$1 := (if p0$1 then $$19$1bv32$1 else v277$1);
    v277$2 := (if p0$2 then $$19$1bv32$2 else v277$2);
    v278$1 := (if p0$1 then $$19$2bv32$1 else v278$1);
    v278$2 := (if p0$2 then $$19$2bv32$2 else v278$2);
    $$a.i.i$0bv32$1 := (if p0$1 then v273$1 else $$a.i.i$0bv32$1);
    $$a.i.i$0bv32$2 := (if p0$2 then v273$2 else $$a.i.i$0bv32$2);
    $$a.i.i$1bv32$1 := (if p0$1 then v274$1 else $$a.i.i$1bv32$1);
    $$a.i.i$1bv32$2 := (if p0$2 then v274$2 else $$a.i.i$1bv32$2);
    $$a.i.i$2bv32$1 := (if p0$1 then v275$1 else $$a.i.i$2bv32$1);
    $$a.i.i$2bv32$2 := (if p0$2 then v275$2 else $$a.i.i$2bv32$2);
    $$b.i.i$0bv32$1 := (if p0$1 then v276$1 else $$b.i.i$0bv32$1);
    $$b.i.i$0bv32$2 := (if p0$2 then v276$2 else $$b.i.i$0bv32$2);
    $$b.i.i$1bv32$1 := (if p0$1 then v277$1 else $$b.i.i$1bv32$1);
    $$b.i.i$1bv32$2 := (if p0$2 then v277$2 else $$b.i.i$1bv32$2);
    $$b.i.i$2bv32$1 := (if p0$1 then v278$1 else $$b.i.i$2bv32$1);
    $$b.i.i$2bv32$2 := (if p0$2 then v278$2 else $$b.i.i$2bv32$2);
    v279$1 := (if p0$1 then $$a.i.i$0bv32$1 else v279$1);
    v279$2 := (if p0$2 then $$a.i.i$0bv32$2 else v279$2);
    v280$1 := (if p0$1 then $$b.i.i$0bv32$1 else v280$1);
    v280$2 := (if p0$2 then $$b.i.i$0bv32$2 else v280$2);
    v281$1 := (if p0$1 then $$a.i.i$1bv32$1 else v281$1);
    v281$2 := (if p0$2 then $$a.i.i$1bv32$2 else v281$2);
    v282$1 := (if p0$1 then $$b.i.i$1bv32$1 else v282$1);
    v282$2 := (if p0$2 then $$b.i.i$1bv32$2 else v282$2);
    v283$1 := (if p0$1 then $$a.i.i$2bv32$1 else v283$1);
    v283$2 := (if p0$2 then $$a.i.i$2bv32$2 else v283$2);
    v284$1 := (if p0$1 then $$b.i.i$2bv32$1 else v284$1);
    v284$2 := (if p0$2 then $$b.i.i$2bv32$2 else v284$2);
    $$16$0bv32$1 := (if p0$1 then FSUB32(v279$1, v280$1) else $$16$0bv32$1);
    $$16$0bv32$2 := (if p0$2 then FSUB32(v279$2, v280$2) else $$16$0bv32$2);
    $$16$1bv32$1 := (if p0$1 then FSUB32(v281$1, v282$1) else $$16$1bv32$1);
    $$16$1bv32$2 := (if p0$2 then FSUB32(v281$2, v282$2) else $$16$1bv32$2);
    $$16$2bv32$1 := (if p0$1 then FSUB32(v283$1, v284$1) else $$16$2bv32$1);
    $$16$2bv32$2 := (if p0$2 then FSUB32(v283$2, v284$2) else $$16$2bv32$2);
    v285$1 := (if p0$1 then $$16$0bv32$1 else v285$1);
    v285$2 := (if p0$2 then $$16$0bv32$2 else v285$2);
    v286$1 := (if p0$1 then $$16$1bv32$1 else v286$1);
    v286$2 := (if p0$2 then $$16$1bv32$2 else v286$2);
    v287$1 := (if p0$1 then $$16$2bv32$1 else v287$1);
    v287$2 := (if p0$2 then $$16$2bv32$2 else v287$2);
    $$17$0bv32$1 := (if p0$1 then v285$1 else $$17$0bv32$1);
    $$17$0bv32$2 := (if p0$2 then v285$2 else $$17$0bv32$2);
    $$17$1bv32$1 := (if p0$1 then v286$1 else $$17$1bv32$1);
    $$17$1bv32$2 := (if p0$2 then v286$2 else $$17$1bv32$2);
    $$17$2bv32$1 := (if p0$1 then v287$1 else $$17$2bv32$1);
    $$17$2bv32$2 := (if p0$2 then v287$2 else $$17$2bv32$2);
    v288$1 := (if p0$1 then $$17$0bv32$1 else v288$1);
    v288$2 := (if p0$2 then $$17$0bv32$2 else v288$2);
    v289$1 := (if p0$1 then $$17$1bv32$1 else v289$1);
    v289$2 := (if p0$2 then $$17$1bv32$2 else v289$2);
    v290$1 := (if p0$1 then $$17$2bv32$1 else v290$1);
    v290$2 := (if p0$2 then $$17$2bv32$2 else v290$2);
    $$L.i$0bv32$1 := (if p0$1 then v288$1 else $$L.i$0bv32$1);
    $$L.i$0bv32$2 := (if p0$2 then v288$2 else $$L.i$0bv32$2);
    $$L.i$1bv32$1 := (if p0$1 then v289$1 else $$L.i$1bv32$1);
    $$L.i$1bv32$2 := (if p0$2 then v289$2 else $$L.i$1bv32$2);
    $$L.i$2bv32$1 := (if p0$1 then v290$1 else $$L.i$2bv32$1);
    $$L.i$2bv32$2 := (if p0$2 then v290$2 else $$L.i$2bv32$2);
    v291$1 := (if p0$1 then $$L.i$0bv32$1 else v291$1);
    v291$2 := (if p0$2 then $$L.i$0bv32$2 else v291$2);
    $$20$0bv32$1 := (if p0$1 then v291$1 else $$20$0bv32$1);
    $$20$0bv32$2 := (if p0$2 then v291$2 else $$20$0bv32$2);
    v292$1 := (if p0$1 then $$L.i$1bv32$1 else v292$1);
    v292$2 := (if p0$2 then $$L.i$1bv32$2 else v292$2);
    $$20$1bv32$1 := (if p0$1 then v292$1 else $$20$1bv32$1);
    $$20$1bv32$2 := (if p0$2 then v292$2 else $$20$1bv32$2);
    v293$1 := (if p0$1 then $$L.i$2bv32$1 else v293$1);
    v293$2 := (if p0$2 then $$L.i$2bv32$2 else v293$2);
    $$20$2bv32$1 := (if p0$1 then v293$1 else $$20$2bv32$1);
    $$20$2bv32$2 := (if p0$2 then v293$2 else $$20$2bv32$2);
    v294$1 := (if p0$1 then $$R.i$3bv32$1 else v294$1);
    v294$2 := (if p0$2 then $$R.i$3bv32$2 else v294$2);
    $$21$0bv32$1 := (if p0$1 then v294$1 else $$21$0bv32$1);
    $$21$0bv32$2 := (if p0$2 then v294$2 else $$21$0bv32$2);
    v295$1 := (if p0$1 then $$R.i$4bv32$1 else v295$1);
    v295$2 := (if p0$2 then $$R.i$4bv32$2 else v295$2);
    $$21$1bv32$1 := (if p0$1 then v295$1 else $$21$1bv32$1);
    $$21$1bv32$2 := (if p0$2 then v295$2 else $$21$1bv32$2);
    v296$1 := (if p0$1 then $$R.i$5bv32$1 else v296$1);
    v296$2 := (if p0$2 then $$R.i$5bv32$2 else v296$2);
    $$21$2bv32$1 := (if p0$1 then v296$1 else $$21$2bv32$1);
    $$21$2bv32$2 := (if p0$2 then v296$2 else $$21$2bv32$2);
    v297$1 := (if p0$1 then $$20$0bv32$1 else v297$1);
    v297$2 := (if p0$2 then $$20$0bv32$2 else v297$2);
    v298$1 := (if p0$1 then $$20$1bv32$1 else v298$1);
    v298$2 := (if p0$2 then $$20$1bv32$2 else v298$2);
    v299$1 := (if p0$1 then $$20$2bv32$1 else v299$1);
    v299$2 := (if p0$2 then $$20$2bv32$2 else v299$2);
    v300$1 := (if p0$1 then $$21$0bv32$1 else v300$1);
    v300$2 := (if p0$2 then $$21$0bv32$2 else v300$2);
    v301$1 := (if p0$1 then $$21$1bv32$1 else v301$1);
    v301$2 := (if p0$2 then $$21$1bv32$2 else v301$2);
    v302$1 := (if p0$1 then $$21$2bv32$1 else v302$1);
    v302$2 := (if p0$2 then $$21$2bv32$2 else v302$2);
    call {:sourceloc_num 560} v303$1, v303$2 := $_Z3dot6float3S_(p0$1, v297$1, v298$1, v299$1, v300$1, v301$1, v302$1, p0$2, v297$2, v298$2, v299$2, v300$2, v301$2, v302$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z3dot6float3S_"} true;
    v304$1 := (if p0$1 then $$L.i$0bv32$1 else v304$1);
    v304$2 := (if p0$2 then $$L.i$0bv32$2 else v304$2);
    $$22$0bv32$1 := (if p0$1 then v304$1 else $$22$0bv32$1);
    $$22$0bv32$2 := (if p0$2 then v304$2 else $$22$0bv32$2);
    v305$1 := (if p0$1 then $$L.i$1bv32$1 else v305$1);
    v305$2 := (if p0$2 then $$L.i$1bv32$2 else v305$2);
    $$22$1bv32$1 := (if p0$1 then v305$1 else $$22$1bv32$1);
    $$22$1bv32$2 := (if p0$2 then v305$2 else $$22$1bv32$2);
    v306$1 := (if p0$1 then $$L.i$2bv32$1 else v306$1);
    v306$2 := (if p0$2 then $$L.i$2bv32$2 else v306$2);
    $$22$2bv32$1 := (if p0$1 then v306$1 else $$22$2bv32$1);
    $$22$2bv32$2 := (if p0$2 then v306$2 else $$22$2bv32$2);
    v307$1 := (if p0$1 then $$L.i$0bv32$1 else v307$1);
    v307$2 := (if p0$2 then $$L.i$0bv32$2 else v307$2);
    $$23$0bv32$1 := (if p0$1 then v307$1 else $$23$0bv32$1);
    $$23$0bv32$2 := (if p0$2 then v307$2 else $$23$0bv32$2);
    v308$1 := (if p0$1 then $$L.i$1bv32$1 else v308$1);
    v308$2 := (if p0$2 then $$L.i$1bv32$2 else v308$2);
    $$23$1bv32$1 := (if p0$1 then v308$1 else $$23$1bv32$1);
    $$23$1bv32$2 := (if p0$2 then v308$2 else $$23$1bv32$2);
    v309$1 := (if p0$1 then $$L.i$2bv32$1 else v309$1);
    v309$2 := (if p0$2 then $$L.i$2bv32$2 else v309$2);
    $$23$2bv32$1 := (if p0$1 then v309$1 else $$23$2bv32$1);
    $$23$2bv32$2 := (if p0$2 then v309$2 else $$23$2bv32$2);
    v310$1 := (if p0$1 then $$22$0bv32$1 else v310$1);
    v310$2 := (if p0$2 then $$22$0bv32$2 else v310$2);
    v311$1 := (if p0$1 then $$22$1bv32$1 else v311$1);
    v311$2 := (if p0$2 then $$22$1bv32$2 else v311$2);
    v312$1 := (if p0$1 then $$22$2bv32$1 else v312$1);
    v312$2 := (if p0$2 then $$22$2bv32$2 else v312$2);
    v313$1 := (if p0$1 then $$23$0bv32$1 else v313$1);
    v313$2 := (if p0$2 then $$23$0bv32$2 else v313$2);
    v314$1 := (if p0$1 then $$23$1bv32$1 else v314$1);
    v314$2 := (if p0$2 then $$23$1bv32$2 else v314$2);
    v315$1 := (if p0$1 then $$23$2bv32$1 else v315$1);
    v315$2 := (if p0$2 then $$23$2bv32$2 else v315$2);
    call {:sourceloc_num 579} v316$1, v316$2 := $_Z3dot6float3S_(p0$1, v310$1, v311$1, v312$1, v313$1, v314$1, v315$1, p0$2, v310$2, v311$2, v312$2, v313$2, v314$2, v315$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z3dot6float3S_"} true;
    v317$1 := (if p0$1 then FMUL32(v248$1, v248$1) else v317$1);
    v317$2 := (if p0$2 then FMUL32(v248$2, v248$2) else v317$2);
    v318$1 := (if p0$1 then FLT32(v303$1, 0bv32) else v318$1);
    v318$2 := (if p0$2 then FLT32(v303$2, 0bv32) else v318$2);
    p1$1 := (if p0$1 && v318$1 then v318$1 else p1$1);
    p1$2 := (if p0$2 && v318$2 then v318$2 else p1$2);
    p5$1 := (if p0$1 && !v318$1 then !v318$1 else p5$1);
    p5$2 := (if p0$2 && !v318$2 then !v318$2 else p5$2);
    v319$1 := (if p1$1 then FLT32(v317$1, v316$1) else v319$1);
    v319$2 := (if p1$2 then FLT32(v317$2, v316$2) else v319$2);
    p2$1 := (if p1$1 && v319$1 then v319$1 else p2$1);
    p2$2 := (if p1$2 && v319$2 then v319$2 else p2$2);
    p5$1 := (if p1$1 && !v319$1 then !v319$1 else p5$1);
    p5$2 := (if p1$2 && !v319$2 then !v319$2 else p5$2);
    $res.i.2$1 := (if p2$1 then 0bv32 else $res.i.2$1);
    $res.i.2$2 := (if p2$2 then 0bv32 else $res.i.2$2);
    p5$1 := (if p3$1 then true else p5$1);
    p5$2 := (if p3$2 then true else p5$2);
    p5$1 := (if p4$1 then true else p5$1);
    p5$2 := (if p4$2 then true else p5$2);
    v320$1 := (if p5$1 then FSUB32(v316$1, FMUL32(v303$1, v303$1)) else v320$1);
    v320$2 := (if p5$2 then FSUB32(v316$2, FMUL32(v303$2, v303$2)) else v320$2);
    v321$1 := (if p5$1 then FLT32(v317$1, v320$1) else v321$1);
    v321$2 := (if p5$2 then FLT32(v317$2, v320$2) else v321$2);
    p6$1 := (if p5$1 && v321$1 then v321$1 else p6$1);
    p6$2 := (if p5$2 && v321$2 then v321$2 else p6$2);
    p7$1 := (if p5$1 && !v321$1 then !v321$1 else p7$1);
    p7$2 := (if p5$2 && !v321$2 then !v321$2 else p7$2);
    $res.i.1$1 := (if p6$1 then 0bv32 else $res.i.1$1);
    $res.i.1$2 := (if p6$2 then 0bv32 else $res.i.1$2);
    v322$1 := (if p7$1 then FP64_CONV32(FSQRT64(FP32_CONV64(FSUB32(v317$1, v320$1)))) else v322$1);
    v322$2 := (if p7$2 then FP64_CONV32(FSQRT64(FP32_CONV64(FSUB32(v317$2, v320$2)))) else v322$2);
    v323$1 := (if p7$1 then FLT32(v317$1, v316$1) else v323$1);
    v323$2 := (if p7$2 then FLT32(v317$2, v316$2) else v323$2);
    p8$1 := (if p7$1 && v323$1 then v323$1 else p8$1);
    p8$2 := (if p7$2 && v323$2 then v323$2 else p8$2);
    p9$1 := (if p7$1 && !v323$1 then !v323$1 else p9$1);
    p9$2 := (if p7$2 && !v323$2 then !v323$2 else p9$2);
    $res.i.0$1 := (if p8$1 then FSUB32(v303$1, v322$1) else $res.i.0$1);
    $res.i.0$2 := (if p8$2 then FSUB32(v303$2, v322$2) else $res.i.0$2);
    $res.i.0$1 := (if p9$1 then FADD32(v303$1, v322$1) else $res.i.0$1);
    $res.i.0$2 := (if p9$2 then FADD32(v303$2, v322$2) else $res.i.0$2);
    $res.i.1$1 := (if p7$1 then $res.i.0$1 else $res.i.1$1);
    $res.i.1$2 := (if p7$2 then $res.i.0$2 else $res.i.1$2);
    $res.i.2$1 := (if p5$1 then $res.i.1$1 else $res.i.2$1);
    $res.i.2$2 := (if p5$2 then $res.i.1$2 else $res.i.2$2);
    v324$1 := (if p0$1 then FLT32(0bv32, $res.i.2$1) else v324$1);
    v324$2 := (if p0$2 then FLT32(0bv32, $res.i.2$2) else v324$2);
    p10$1 := (if p0$1 && v324$1 then v324$1 else p10$1);
    p10$2 := (if p0$2 && v324$2 then v324$2 else p10$2);
    $$24$0bv32$1 := (if p10$1 then 0bv32 else $$24$0bv32$1);
    $$24$0bv32$2 := (if p10$2 then 0bv32 else $$24$0bv32$2);
    $$24$1bv32$1 := (if p10$1 then 1065353216bv32 else $$24$1bv32$1);
    $$24$1bv32$2 := (if p10$2 then 1065353216bv32 else $$24$1bv32$2);
    $$24$2bv32$1 := (if p10$1 then 0bv32 else $$24$2bv32$1);
    $$24$2bv32$2 := (if p10$2 then 0bv32 else $$24$2bv32$2);
    $$24$3bv32$1 := (if p10$1 then 1065353216bv32 else $$24$3bv32$1);
    $$24$3bv32$2 := (if p10$2 then 1065353216bv32 else $$24$3bv32$2);
    v325$1 := (if p10$1 then $$24$0bv32$1 else v325$1);
    v325$2 := (if p10$2 then $$24$0bv32$2 else v325$2);
    v326$1 := (if p10$1 then $$24$1bv32$1 else v326$1);
    v326$2 := (if p10$2 then $$24$1bv32$2 else v326$2);
    v327$1 := (if p10$1 then $$24$2bv32$1 else v327$1);
    v327$2 := (if p10$2 then $$24$2bv32$2 else v327$2);
    v328$1 := (if p10$1 then $$24$3bv32$1 else v328$1);
    v328$2 := (if p10$2 then $$24$3bv32$2 else v328$2);
    $$48$0bv32$1 := (if p10$1 then v325$1 else $$48$0bv32$1);
    $$48$0bv32$2 := (if p10$2 then v325$2 else $$48$0bv32$2);
    $$48$1bv32$1 := (if p10$1 then v326$1 else $$48$1bv32$1);
    $$48$1bv32$2 := (if p10$2 then v326$2 else $$48$1bv32$2);
    $$48$2bv32$1 := (if p10$1 then v327$1 else $$48$2bv32$1);
    $$48$2bv32$2 := (if p10$2 then v327$2 else $$48$2bv32$2);
    $$48$3bv32$1 := (if p10$1 then v328$1 else $$48$3bv32$1);
    $$48$3bv32$2 := (if p10$2 then v328$2 else $$48$3bv32$2);
    v329$1 := (if p10$1 then $$48$0bv32$1 else v329$1);
    v329$2 := (if p10$2 then $$48$0bv32$2 else v329$2);
    v330$1 := (if p10$1 then $$48$1bv32$1 else v330$1);
    v330$2 := (if p10$2 then $$48$1bv32$2 else v330$2);
    v331$1 := (if p10$1 then $$48$2bv32$1 else v331$1);
    v331$2 := (if p10$2 then $$48$2bv32$2 else v331$2);
    v332$1 := (if p10$1 then $$48$3bv32$1 else v332$1);
    v332$2 := (if p10$2 then $$48$3bv32$2 else v332$2);
    $$rgba.i$0bv32$1 := (if p10$1 then v329$1 else $$rgba.i$0bv32$1);
    $$rgba.i$0bv32$2 := (if p10$2 then v329$2 else $$rgba.i$0bv32$2);
    $$rgba.i$1bv32$1 := (if p10$1 then v330$1 else $$rgba.i$1bv32$1);
    $$rgba.i$1bv32$2 := (if p10$2 then v330$2 else $$rgba.i$1bv32$2);
    $$rgba.i$2bv32$1 := (if p10$1 then v331$1 else $$rgba.i$2bv32$1);
    $$rgba.i$2bv32$2 := (if p10$2 then v331$2 else $$rgba.i$2bv32$2);
    $$rgba.i$3bv32$1 := (if p10$1 then v332$1 else $$rgba.i$3bv32$1);
    $$rgba.i$3bv32$2 := (if p10$2 then v332$2 else $$rgba.i$3bv32$2);
    v333$1 := (if p10$1 then $$rgba.i$0bv32$1 else v333$1);
    v333$2 := (if p10$2 then $$rgba.i$0bv32$2 else v333$2);
    call {:sourceloc_num 612} v334$1, v334$2 := $__saturatef(p10$1, v333$1, p10$2, v333$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i$0bv32$1 := (if p10$1 then v334$1 else $$rgba.i$0bv32$1);
    $$rgba.i$0bv32$2 := (if p10$2 then v334$2 else $$rgba.i$0bv32$2);
    v335$1 := (if p10$1 then $$rgba.i$1bv32$1 else v335$1);
    v335$2 := (if p10$2 then $$rgba.i$1bv32$2 else v335$2);
    call {:sourceloc_num 615} v336$1, v336$2 := $__saturatef(p10$1, v335$1, p10$2, v335$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i$1bv32$1 := (if p10$1 then v336$1 else $$rgba.i$1bv32$1);
    $$rgba.i$1bv32$2 := (if p10$2 then v336$2 else $$rgba.i$1bv32$2);
    v337$1 := (if p10$1 then $$rgba.i$2bv32$1 else v337$1);
    v337$2 := (if p10$2 then $$rgba.i$2bv32$2 else v337$2);
    call {:sourceloc_num 618} v338$1, v338$2 := $__saturatef(p10$1, v337$1, p10$2, v337$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i$2bv32$1 := (if p10$1 then v338$1 else $$rgba.i$2bv32$1);
    $$rgba.i$2bv32$2 := (if p10$2 then v338$2 else $$rgba.i$2bv32$2);
    v339$1 := (if p10$1 then $$rgba.i$3bv32$1 else v339$1);
    v339$2 := (if p10$2 then $$rgba.i$3bv32$2 else v339$2);
    call {:sourceloc_num 621} v340$1, v340$2 := $__saturatef(p10$1, v339$1, p10$2, v339$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__saturatef"} true;
    $$rgba.i$3bv32$1 := (if p10$1 then v340$1 else $$rgba.i$3bv32$1);
    $$rgba.i$3bv32$2 := (if p10$2 then v340$2 else $$rgba.i$3bv32$2);
    v341$1 := (if p10$1 then $$rgba.i$3bv32$1 else v341$1);
    v341$2 := (if p10$2 then $$rgba.i$3bv32$2 else v341$2);
    v342$1 := (if p10$1 then $$rgba.i$2bv32$1 else v342$1);
    v342$2 := (if p10$2 then $$rgba.i$2bv32$2 else v342$2);
    v343$1 := (if p10$1 then $$rgba.i$1bv32$1 else v343$1);
    v343$2 := (if p10$2 then $$rgba.i$1bv32$2 else v343$2);
    v344$1 := (if p10$1 then $$rgba.i$0bv32$1 else v344$1);
    v344$2 := (if p10$2 then $$rgba.i$0bv32$2 else v344$2);
    call {:sourceloc} {:sourceloc_num 627} _LOG_WRITE_$$d_output(p10$1, v2$1, BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v341$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v342$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v343$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v344$1, 1132396544bv32))), $$d_output[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_output(p10$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 627} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 627} _CHECK_WRITE_$$d_output(p10$2, v2$2, BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v341$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v342$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v343$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v344$2, 1132396544bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_output"} true;
    $$d_output[v2$1] := (if p10$1 then BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v341$1, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v342$1, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v343$1, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v344$1, 1132396544bv32))) else $$d_output[v2$1]);
    $$d_output[v2$2] := (if p10$2 then BV32_OR(BV32_OR(BV32_OR(BV32_SHL(FP32_TO_UI32(FMUL32(v341$2, 1132396544bv32)), 24bv32), BV32_SHL(FP32_TO_UI32(FMUL32(v342$2, 1132396544bv32)), 16bv32)), BV32_SHL(FP32_TO_UI32(FMUL32(v343$2, 1132396544bv32)), 8bv32)), FP32_TO_UI32(FMUL32(v344$2, 1132396544bv32))) else $$d_output[v2$2]);
    return;
}



procedure {:source_name "_Z9normalize6float3"} $_Z9normalize6float3(_P$1: bool, $0$1: bv32, $1$1: bv32, $2$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32, $2$2: bv32) returns ($ret$1: bv96, $ret$2: bv96);



procedure {:source_name "__saturatef"} $__saturatef(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "_Z3dot6float3S_"} $_Z3dot6float3S_(_P$1: bool, $0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, $5$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32, $5$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$0$0bv32$1: bv32;

var $$0$0bv32$2: bv32;

var $$0$1bv32$1: bv32;

var $$0$1bv32$2: bv32;

var $$0$2bv32$1: bv32;

var $$0$2bv32$2: bv32;

var $$1$0bv32$1: bv32;

var $$1$0bv32$2: bv32;

var $$1$1bv32$1: bv32;

var $$1$1bv32$2: bv32;

var $$1$2bv32$1: bv32;

var $$1$2bv32$2: bv32;

var $$a.i9$0bv32$1: bv32;

var $$a.i9$0bv32$2: bv32;

var $$a.i9$1bv32$1: bv32;

var $$a.i9$1bv32$2: bv32;

var $$a.i9$2bv32$1: bv32;

var $$a.i9$2bv32$2: bv32;

var $$b.i10$0bv32$1: bv32;

var $$b.i10$0bv32$2: bv32;

var $$b.i10$1bv32$1: bv32;

var $$b.i10$1bv32$2: bv32;

var $$b.i10$2bv32$1: bv32;

var $$b.i10$2bv32$2: bv32;

var $$2$0bv32$1: bv32;

var $$2$0bv32$2: bv32;

var $$2$1bv32$1: bv32;

var $$2$1bv32$2: bv32;

var $$2$2bv32$1: bv32;

var $$2$2bv32$2: bv32;

var $$3$0bv32$1: bv32;

var $$3$0bv32$2: bv32;

var $$3$1bv32$1: bv32;

var $$3$1bv32$2: bv32;

var $$3$2bv32$1: bv32;

var $$3$2bv32$2: bv32;

var $$a.i8$0bv32$1: bv32;

var $$a.i8$0bv32$2: bv32;

var $$a.i8$1bv32$1: bv32;

var $$a.i8$1bv32$2: bv32;

var $$a.i8$2bv32$1: bv32;

var $$a.i8$2bv32$2: bv32;

var $$a.i8$3bv32$1: bv32;

var $$a.i8$3bv32$2: bv32;

var $$4$0bv32$1: bv32;

var $$4$0bv32$2: bv32;

var $$4$1bv32$1: bv32;

var $$4$1bv32$2: bv32;

var $$4$2bv32$1: bv32;

var $$4$2bv32$2: bv32;

var $$5$0bv32$1: bv32;

var $$5$0bv32$2: bv32;

var $$5$1bv32$1: bv32;

var $$5$1bv32$2: bv32;

var $$5$2bv32$1: bv32;

var $$5$2bv32$2: bv32;

var $$a.i7$0bv32$1: bv32;

var $$a.i7$0bv32$2: bv32;

var $$a.i7$1bv32$1: bv32;

var $$a.i7$1bv32$2: bv32;

var $$a.i7$2bv32$1: bv32;

var $$a.i7$2bv32$2: bv32;

var $$6$0bv32$1: bv32;

var $$6$0bv32$2: bv32;

var $$6$1bv32$1: bv32;

var $$6$1bv32$2: bv32;

var $$6$2bv32$1: bv32;

var $$6$2bv32$2: bv32;

var $$7$0bv32$1: bv32;

var $$7$0bv32$2: bv32;

var $$7$1bv32$1: bv32;

var $$7$1bv32$2: bv32;

var $$7$2bv32$1: bv32;

var $$7$2bv32$2: bv32;

var $$a.i6$0bv32$1: bv32;

var $$a.i6$0bv32$2: bv32;

var $$a.i6$1bv32$1: bv32;

var $$a.i6$1bv32$2: bv32;

var $$a.i6$2bv32$1: bv32;

var $$a.i6$2bv32$2: bv32;

var $$8$0bv32$1: bv32;

var $$8$0bv32$2: bv32;

var $$8$1bv32$1: bv32;

var $$8$1bv32$2: bv32;

var $$8$2bv32$1: bv32;

var $$8$2bv32$2: bv32;

var $$9$0bv32$1: bv32;

var $$9$0bv32$2: bv32;

var $$9$1bv32$1: bv32;

var $$9$1bv32$2: bv32;

var $$9$2bv32$1: bv32;

var $$9$2bv32$2: bv32;

var $$a.i5$0bv32$1: bv32;

var $$a.i5$0bv32$2: bv32;

var $$a.i5$1bv32$1: bv32;

var $$a.i5$1bv32$2: bv32;

var $$a.i5$2bv32$1: bv32;

var $$a.i5$2bv32$2: bv32;

var $$b.i$0bv32$1: bv32;

var $$b.i$0bv32$2: bv32;

var $$b.i$1bv32$1: bv32;

var $$b.i$1bv32$2: bv32;

var $$b.i$2bv32$1: bv32;

var $$b.i$2bv32$2: bv32;

var $$10$0bv32$1: bv32;

var $$10$0bv32$2: bv32;

var $$10$1bv32$1: bv32;

var $$10$1bv32$2: bv32;

var $$10$2bv32$1: bv32;

var $$10$2bv32$2: bv32;

var $$11$0bv32$1: bv32;

var $$11$0bv32$2: bv32;

var $$11$1bv32$1: bv32;

var $$11$1bv32$2: bv32;

var $$11$2bv32$1: bv32;

var $$11$2bv32$2: bv32;

var $$a.i4$0bv32$1: bv32;

var $$a.i4$0bv32$2: bv32;

var $$a.i4$1bv32$1: bv32;

var $$a.i4$1bv32$2: bv32;

var $$a.i4$2bv32$1: bv32;

var $$a.i4$2bv32$2: bv32;

var $$12$0bv32$1: bv32;

var $$12$0bv32$2: bv32;

var $$12$1bv32$1: bv32;

var $$12$1bv32$2: bv32;

var $$12$2bv32$1: bv32;

var $$12$2bv32$2: bv32;

var $$13$0bv32$1: bv32;

var $$13$0bv32$2: bv32;

var $$13$1bv32$1: bv32;

var $$13$1bv32$2: bv32;

var $$13$2bv32$1: bv32;

var $$13$2bv32$2: bv32;

var $$a.i3$0bv32$1: bv32;

var $$a.i3$0bv32$2: bv32;

var $$a.i3$1bv32$1: bv32;

var $$a.i3$1bv32$2: bv32;

var $$a.i3$2bv32$1: bv32;

var $$a.i3$2bv32$2: bv32;

var $$14$0bv32$1: bv32;

var $$14$0bv32$2: bv32;

var $$14$1bv32$1: bv32;

var $$14$1bv32$2: bv32;

var $$14$2bv32$1: bv32;

var $$14$2bv32$2: bv32;

var $$15$0bv32$1: bv32;

var $$15$0bv32$2: bv32;

var $$15$1bv32$1: bv32;

var $$15$1bv32$2: bv32;

var $$15$2bv32$1: bv32;

var $$15$2bv32$2: bv32;

var $$a.i2$0bv32$1: bv32;

var $$a.i2$0bv32$2: bv32;

var $$a.i2$1bv32$1: bv32;

var $$a.i2$1bv32$2: bv32;

var $$a.i2$2bv32$1: bv32;

var $$a.i2$2bv32$2: bv32;

var $$a.i2$3bv32$1: bv32;

var $$a.i2$3bv32$2: bv32;

var $$16$0bv32$1: bv32;

var $$16$0bv32$2: bv32;

var $$16$1bv32$1: bv32;

var $$16$1bv32$2: bv32;

var $$16$2bv32$1: bv32;

var $$16$2bv32$2: bv32;

var $$17$0bv32$1: bv32;

var $$17$0bv32$2: bv32;

var $$17$1bv32$1: bv32;

var $$17$1bv32$2: bv32;

var $$17$2bv32$1: bv32;

var $$17$2bv32$2: bv32;

var $$a.i.i$0bv32$1: bv32;

var $$a.i.i$0bv32$2: bv32;

var $$a.i.i$1bv32$1: bv32;

var $$a.i.i$1bv32$2: bv32;

var $$a.i.i$2bv32$1: bv32;

var $$a.i.i$2bv32$2: bv32;

var $$b.i.i$0bv32$1: bv32;

var $$b.i.i$0bv32$2: bv32;

var $$b.i.i$1bv32$1: bv32;

var $$b.i.i$1bv32$2: bv32;

var $$b.i.i$2bv32$1: bv32;

var $$b.i.i$2bv32$2: bv32;

var $$R.i$0bv32$1: bv32;

var $$R.i$0bv32$2: bv32;

var $$R.i$1bv32$1: bv32;

var $$R.i$1bv32$2: bv32;

var $$R.i$2bv32$1: bv32;

var $$R.i$2bv32$2: bv32;

var $$R.i$3bv32$1: bv32;

var $$R.i$3bv32$2: bv32;

var $$R.i$4bv32$1: bv32;

var $$R.i$4bv32$2: bv32;

var $$R.i$5bv32$1: bv32;

var $$R.i$5bv32$2: bv32;

var $$C.i$0bv32$1: bv32;

var $$C.i$0bv32$2: bv32;

var $$C.i$1bv32$1: bv32;

var $$C.i$1bv32$2: bv32;

var $$C.i$2bv32$1: bv32;

var $$C.i$2bv32$2: bv32;

var $$L.i$0bv32$1: bv32;

var $$L.i$0bv32$2: bv32;

var $$L.i$1bv32$1: bv32;

var $$L.i$1bv32$2: bv32;

var $$L.i$2bv32$1: bv32;

var $$L.i$2bv32$2: bv32;

var $$18$0bv32$1: bv32;

var $$18$0bv32$2: bv32;

var $$18$1bv32$1: bv32;

var $$18$1bv32$2: bv32;

var $$18$2bv32$1: bv32;

var $$18$2bv32$2: bv32;

var $$19$0bv32$1: bv32;

var $$19$0bv32$2: bv32;

var $$19$1bv32$1: bv32;

var $$19$1bv32$2: bv32;

var $$19$2bv32$1: bv32;

var $$19$2bv32$2: bv32;

var $$20$0bv32$1: bv32;

var $$20$0bv32$2: bv32;

var $$20$1bv32$1: bv32;

var $$20$1bv32$2: bv32;

var $$20$2bv32$1: bv32;

var $$20$2bv32$2: bv32;

var $$21$0bv32$1: bv32;

var $$21$0bv32$2: bv32;

var $$21$1bv32$1: bv32;

var $$21$1bv32$2: bv32;

var $$21$2bv32$1: bv32;

var $$21$2bv32$2: bv32;

var $$22$0bv32$1: bv32;

var $$22$0bv32$2: bv32;

var $$22$1bv32$1: bv32;

var $$22$1bv32$2: bv32;

var $$22$2bv32$1: bv32;

var $$22$2bv32$2: bv32;

var $$23$0bv32$1: bv32;

var $$23$0bv32$2: bv32;

var $$23$1bv32$1: bv32;

var $$23$1bv32$2: bv32;

var $$23$2bv32$1: bv32;

var $$23$2bv32$2: bv32;

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

var $$26$0bv32$1: bv32;

var $$26$0bv32$2: bv32;

var $$26$1bv32$1: bv32;

var $$26$1bv32$2: bv32;

var $$26$2bv32$1: bv32;

var $$26$2bv32$2: bv32;

var $$a.i1$0bv32$1: bv32;

var $$a.i1$0bv32$2: bv32;

var $$a.i1$1bv32$1: bv32;

var $$a.i1$1bv32$2: bv32;

var $$a.i1$2bv32$1: bv32;

var $$a.i1$2bv32$2: bv32;

var $$27$0bv32$1: bv32;

var $$27$0bv32$2: bv32;

var $$27$1bv32$1: bv32;

var $$27$1bv32$2: bv32;

var $$27$2bv32$1: bv32;

var $$27$2bv32$2: bv32;

var $$28$0bv32$1: bv32;

var $$28$0bv32$2: bv32;

var $$28$1bv32$1: bv32;

var $$28$1bv32$2: bv32;

var $$28$2bv32$1: bv32;

var $$28$2bv32$2: bv32;

var $$a.i$0bv32$1: bv32;

var $$a.i$0bv32$2: bv32;

var $$a.i$1bv32$1: bv32;

var $$a.i$1bv32$2: bv32;

var $$a.i$2bv32$1: bv32;

var $$a.i$2bv32$2: bv32;

var $$a.i$3bv32$1: bv32;

var $$a.i$3bv32$2: bv32;

var $$29$0bv32$1: bv32;

var $$29$0bv32$2: bv32;

var $$29$1bv32$1: bv32;

var $$29$1bv32$2: bv32;

var $$29$2bv32$1: bv32;

var $$29$2bv32$2: bv32;

var $$rgba.i$0bv32$1: bv32;

var $$rgba.i$0bv32$2: bv32;

var $$rgba.i$1bv32$1: bv32;

var $$rgba.i$1bv32$2: bv32;

var $$rgba.i$2bv32$1: bv32;

var $$rgba.i$2bv32$2: bv32;

var $$rgba.i$3bv32$1: bv32;

var $$rgba.i$3bv32$2: bv32;

var $$M$0bv32$1: bv32;

var $$M$0bv32$2: bv32;

var $$M$1bv32$1: bv32;

var $$M$1bv32$2: bv32;

var $$M$2bv32$1: bv32;

var $$M$2bv32$2: bv32;

var $$M$3bv32$1: bv32;

var $$M$3bv32$2: bv32;

var $$M$4bv32$1: bv32;

var $$M$4bv32$2: bv32;

var $$M$5bv32$1: bv32;

var $$M$5bv32$2: bv32;

var $$M$6bv32$1: bv32;

var $$M$6bv32$2: bv32;

var $$M$7bv32$1: bv32;

var $$M$7bv32$2: bv32;

var $$M$8bv32$1: bv32;

var $$M$8bv32$2: bv32;

var $$M$9bv32$1: bv32;

var $$M$9bv32$2: bv32;

var $$M$10bv32$1: bv32;

var $$M$10bv32$2: bv32;

var $$M$11bv32$1: bv32;

var $$M$11bv32$2: bv32;

var $$R$0bv32$1: bv32;

var $$R$0bv32$2: bv32;

var $$R$1bv32$1: bv32;

var $$R$1bv32$2: bv32;

var $$R$2bv32$1: bv32;

var $$R$2bv32$2: bv32;

var $$R$3bv32$1: bv32;

var $$R$3bv32$2: bv32;

var $$R$4bv32$1: bv32;

var $$R$4bv32$2: bv32;

var $$R$5bv32$1: bv32;

var $$R$5bv32$2: bv32;

var $$30$0bv32$1: bv32;

var $$30$0bv32$2: bv32;

var $$30$1bv32$1: bv32;

var $$30$1bv32$2: bv32;

var $$30$2bv32$1: bv32;

var $$30$2bv32$2: bv32;

var $$31$0bv32$1: bv32;

var $$31$0bv32$2: bv32;

var $$31$1bv32$1: bv32;

var $$31$1bv32$2: bv32;

var $$31$2bv32$1: bv32;

var $$31$2bv32$2: bv32;

var $$32$0bv32$1: bv32;

var $$32$0bv32$2: bv32;

var $$32$1bv32$1: bv32;

var $$32$1bv32$2: bv32;

var $$32$2bv32$1: bv32;

var $$32$2bv32$2: bv32;

var $$33$0bv32$1: bv32;

var $$33$0bv32$2: bv32;

var $$33$1bv32$1: bv32;

var $$33$1bv32$2: bv32;

var $$33$2bv32$1: bv32;

var $$33$2bv32$2: bv32;

var $$34$0bv32$1: bv32;

var $$34$0bv32$2: bv32;

var $$34$1bv32$1: bv32;

var $$34$1bv32$2: bv32;

var $$34$2bv32$1: bv32;

var $$34$2bv32$2: bv32;

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

var $$37$0bv32$1: bv32;

var $$37$0bv32$2: bv32;

var $$37$1bv32$1: bv32;

var $$37$1bv32$2: bv32;

var $$37$2bv32$1: bv32;

var $$37$2bv32$2: bv32;

var $$38$0bv32$1: bv32;

var $$38$0bv32$2: bv32;

var $$38$1bv32$1: bv32;

var $$38$1bv32$2: bv32;

var $$38$2bv32$1: bv32;

var $$38$2bv32$2: bv32;

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

var $$41$0bv32$1: bv32;

var $$41$0bv32$2: bv32;

var $$41$1bv32$1: bv32;

var $$41$1bv32$2: bv32;

var $$41$2bv32$1: bv32;

var $$41$2bv32$2: bv32;

var $$42$0bv32$1: bv32;

var $$42$0bv32$2: bv32;

var $$42$1bv32$1: bv32;

var $$42$1bv32$2: bv32;

var $$42$2bv32$1: bv32;

var $$42$2bv32$2: bv32;

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

var $$45$0bv32$1: bv32;

var $$45$0bv32$2: bv32;

var $$45$1bv32$1: bv32;

var $$45$1bv32$2: bv32;

var $$45$2bv32$1: bv32;

var $$45$2bv32$2: bv32;

var $$s$0bv32$1: bv8;

var $$s$0bv32$2: bv8;

var $$s$1bv32$1: bv8;

var $$s$1bv32$2: bv8;

var $$s$2bv32$1: bv8;

var $$s$2bv32$2: bv8;

var $$s$3bv32$1: bv8;

var $$s$3bv32$2: bv8;

var $$s$4bv32$1: bv8;

var $$s$4bv32$2: bv8;

var $$s$5bv32$1: bv8;

var $$s$5bv32$2: bv8;

var $$s$6bv32$1: bv8;

var $$s$6bv32$2: bv8;

var $$s$7bv32$1: bv8;

var $$s$7bv32$2: bv8;

var $$s$8bv32$1: bv8;

var $$s$8bv32$2: bv8;

var $$s$9bv32$1: bv8;

var $$s$9bv32$2: bv8;

var $$s$10bv32$1: bv8;

var $$s$10bv32$2: bv8;

var $$s$11bv32$1: bv8;

var $$s$11bv32$2: bv8;

var $$s$12bv32$1: bv8;

var $$s$12bv32$2: bv8;

var $$s$13bv32$1: bv8;

var $$s$13bv32$2: bv8;

var $$s$14bv32$1: bv8;

var $$s$14bv32$2: bv8;

var $$s$15bv32$1: bv8;

var $$s$15bv32$2: bv8;

var $$s$16bv32$1: bv8;

var $$s$16bv32$2: bv8;

var $$s$17bv32$1: bv8;

var $$s$17bv32$2: bv8;

var $$s$18bv32$1: bv8;

var $$s$18bv32$2: bv8;

var $$s$19bv32$1: bv8;

var $$s$19bv32$2: bv8;

var $$s$20bv32$1: bv8;

var $$s$20bv32$2: bv8;

var $$s$21bv32$1: bv8;

var $$s$21bv32$2: bv8;

var $$s$22bv32$1: bv8;

var $$s$22bv32$2: bv8;

var $$s$23bv32$1: bv8;

var $$s$23bv32$2: bv8;

var $$s$24bv32$1: bv8;

var $$s$24bv32$2: bv8;

var $$s$25bv32$1: bv8;

var $$s$25bv32$2: bv8;

var $$s$26bv32$1: bv8;

var $$s$26bv32$2: bv8;

var $$s$27bv32$1: bv8;

var $$s$27bv32$2: bv8;

var $$s$28bv32$1: bv8;

var $$s$28bv32$2: bv8;

var $$s$29bv32$1: bv8;

var $$s$29bv32$2: bv8;

var $$s$30bv32$1: bv8;

var $$s$30bv32$2: bv8;

var $$s$31bv32$1: bv8;

var $$s$31bv32$2: bv8;

var $$46$0bv32$1: bv32;

var $$46$0bv32$2: bv32;

var $$46$1bv32$1: bv32;

var $$46$1bv32$2: bv32;

var $$46$2bv32$1: bv32;

var $$46$2bv32$2: bv32;

var $$46$3bv32$1: bv32;

var $$46$3bv32$2: bv32;

var $$46$4bv32$1: bv32;

var $$46$4bv32$2: bv32;

var $$46$5bv32$1: bv32;

var $$46$5bv32$2: bv32;

var $$47$0bv32$1: bv8;

var $$47$0bv32$2: bv8;

var $$47$1bv32$1: bv8;

var $$47$1bv32$2: bv8;

var $$47$2bv32$1: bv8;

var $$47$2bv32$2: bv8;

var $$47$3bv32$1: bv8;

var $$47$3bv32$2: bv8;

var $$47$4bv32$1: bv8;

var $$47$4bv32$2: bv8;

var $$47$5bv32$1: bv8;

var $$47$5bv32$2: bv8;

var $$47$6bv32$1: bv8;

var $$47$6bv32$2: bv8;

var $$47$7bv32$1: bv8;

var $$47$7bv32$2: bv8;

var $$47$8bv32$1: bv8;

var $$47$8bv32$2: bv8;

var $$47$9bv32$1: bv8;

var $$47$9bv32$2: bv8;

var $$47$10bv32$1: bv8;

var $$47$10bv32$2: bv8;

var $$47$11bv32$1: bv8;

var $$47$11bv32$2: bv8;

var $$48$0bv32$1: bv32;

var $$48$0bv32$2: bv32;

var $$48$1bv32$1: bv32;

var $$48$1bv32$2: bv32;

var $$48$2bv32$1: bv32;

var $$48$2bv32$2: bv32;

var $$48$3bv32$1: bv32;

var $$48$3bv32$2: bv32;

const _WATCHED_VALUE_$$d_output: bv32;

procedure {:inline 1} _LOG_READ_$$d_output(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_output;



implementation {:inline 1} _LOG_READ_$$d_output(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output == _value then true else _READ_HAS_OCCURRED_$$d_output);
    return;
}



procedure _CHECK_READ_$$d_output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_output);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_output: bool;

procedure {:inline 1} _LOG_WRITE_$$d_output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_output, _WRITE_READ_BENIGN_FLAG_$$d_output;



implementation {:inline 1} _LOG_WRITE_$$d_output(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output == _value then true else _WRITE_HAS_OCCURRED_$$d_output);
    _WRITE_READ_BENIGN_FLAG_$$d_output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_output);
    return;
}



procedure _CHECK_WRITE_$$d_output(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output != _value);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_output != _value);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_output(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_output;



implementation {:inline 1} _LOG_ATOMIC_$$d_output(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_output);
    return;
}



procedure _CHECK_ATOMIC_$$d_output(_P: bool, _offset: bv32);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_output"} {:array "$$d_output"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_output(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_output;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_output(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_output := (if _P && _WRITE_HAS_OCCURRED_$$d_output && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_output);
    return;
}



const _WATCHED_VALUE_$$d_temp: bv32;

procedure {:inline 1} _LOG_READ_$$d_temp(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_temp;



implementation {:inline 1} _LOG_READ_$$d_temp(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_temp := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_temp == _value then true else _READ_HAS_OCCURRED_$$d_temp);
    return;
}



procedure _CHECK_READ_$$d_temp(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_temp"} {:array "$$d_temp"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_temp && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_temp);
  requires {:source_name "d_temp"} {:array "$$d_temp"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_temp && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_temp: bool;

procedure {:inline 1} _LOG_WRITE_$$d_temp(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_temp, _WRITE_READ_BENIGN_FLAG_$$d_temp;



implementation {:inline 1} _LOG_WRITE_$$d_temp(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_temp := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_temp == _value then true else _WRITE_HAS_OCCURRED_$$d_temp);
    _WRITE_READ_BENIGN_FLAG_$$d_temp := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_temp == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_temp);
    return;
}



procedure _CHECK_WRITE_$$d_temp(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_temp"} {:array "$$d_temp"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_temp && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_temp != _value);
  requires {:source_name "d_temp"} {:array "$$d_temp"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_temp && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_temp != _value);
  requires {:source_name "d_temp"} {:array "$$d_temp"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_temp && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_temp(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_temp;



implementation {:inline 1} _LOG_ATOMIC_$$d_temp(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_temp := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_temp);
    return;
}



procedure _CHECK_ATOMIC_$$d_temp(_P: bool, _offset: bv32);
  requires {:source_name "d_temp"} {:array "$$d_temp"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_temp && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_temp"} {:array "$$d_temp"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_temp && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_temp(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_temp;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_temp(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_temp := (if _P && _WRITE_HAS_OCCURRED_$$d_temp && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_temp);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
