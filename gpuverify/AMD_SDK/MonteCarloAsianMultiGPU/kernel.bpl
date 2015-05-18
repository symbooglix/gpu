type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$randArray"} {:global} {:elem_width 32} {:source_name "randArray"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$randArray: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$randArray: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$randArray: bool;

var {:source_name "priceSamples"} {:global} $$priceSamples: [bv32]bv32;

axiom {:array_info "$$priceSamples"} {:global} {:elem_width 32} {:source_name "priceSamples"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$priceSamples: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$priceSamples: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$priceSamples: bool;

var {:source_name "pathDeriv"} {:global} $$pathDeriv: [bv32]bv32;

axiom {:array_info "$$pathDeriv"} {:global} {:elem_width 32} {:source_name "pathDeriv"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$pathDeriv: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$pathDeriv: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$pathDeriv: bool;

var {:source_name "temp.i"} $$temp.i$1: [bv32]bv32;

var {:source_name "temp.i"} $$temp.i$2: [bv32]bv32;

axiom {:array_info "$$temp.i"} {:elem_width 32} {:source_name "temp.i"} {:source_elem_width 128} {:source_dimensions "8"} true;

axiom {:array_info "$$attrib"} {:elem_width 32} {:source_name "attrib"} {:source_elem_width 896} {:source_dimensions "1"} true;

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

function FCOS32(bv32) : bv32;

function FDIV32(bv32, bv32) : bv32;

function FEXP32(bv32) : bv32;

function FLOG32(bv32) : bv32;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FSIN32(bv32) : bv32;

function FSQRT32(bv32) : bv32;

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

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "bvxor"} BV32_XOR(bv32, bv32) : bv32;

procedure {:source_name "calPriceVega"} {:kernel} $calPriceVega($attrib.coerce0: bv128, $attrib.coerce1: bv128, $attrib.coerce2: bv128, $attrib.coerce3: bv128, $attrib.coerce4: bv128, $attrib.coerce5: bv128, $attrib.coerce6: bv128, $noOfSum: bv32, $width: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 256bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$randArray && !_WRITE_HAS_OCCURRED_$$randArray && !_ATOMIC_HAS_OCCURRED_$$randArray;
  requires !_READ_HAS_OCCURRED_$$priceSamples && !_WRITE_HAS_OCCURRED_$$priceSamples && !_ATOMIC_HAS_OCCURRED_$$priceSamples;
  requires !_READ_HAS_OCCURRED_$$pathDeriv && !_WRITE_HAS_OCCURRED_$$pathDeriv && !_ATOMIC_HAS_OCCURRED_$$pathDeriv;
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
  modifies _WRITE_HAS_OCCURRED_$$priceSamples, _WRITE_READ_BENIGN_FLAG_$$priceSamples, _WRITE_READ_BENIGN_FLAG_$$priceSamples, _WRITE_HAS_OCCURRED_$$pathDeriv, _WRITE_READ_BENIGN_FLAG_$$pathDeriv, _WRITE_READ_BENIGN_FLAG_$$pathDeriv;



implementation {:source_name "calPriceVega"} {:kernel} $calPriceVega($attrib.coerce0: bv128, $attrib.coerce1: bv128, $attrib.coerce2: bv128, $attrib.coerce3: bv128, $attrib.coerce4: bv128, $attrib.coerce5: bv128, $attrib.coerce6: bv128, $noOfSum: bv32, $width: bv32)
{
  var $nextRand.0$1: bv128;
  var $nextRand.0$2: bv128;
  var $trajPrice1.0$1: bv128;
  var $trajPrice1.0$2: bv128;
  var $trajPrice2.0$1: bv128;
  var $trajPrice2.0$2: bv128;
  var $sumPrice1.0$1: bv128;
  var $sumPrice1.0$2: bv128;
  var $sumPrice2.0$1: bv128;
  var $sumPrice2.0$2: bv128;
  var $sumDeriv1.0$1: bv128;
  var $sumDeriv1.0$2: bv128;
  var $sumDeriv2.0$1: bv128;
  var $sumDeriv2.0$2: bv128;
  var $i.0: bv32;
  var $r1.i.0$1: bv128;
  var $r1.i.0$2: bv128;
  var $r2.i.0$1: bv128;
  var $r2.i.0$2: bv128;
  var $a.i.0$1: bv128;
  var $a.i.0$2: bv128;
  var $b.i.0$1: bv128;
  var $b.i.0$2: bv128;
  var $i.i.0: bv32;
  var $r1.i.1$1: bv128;
  var $r1.i.1$2: bv128;
  var $r2.i.1$1: bv128;
  var $r2.i.1$2: bv128;
  var $a.i.1$1: bv128;
  var $a.i.1$2: bv128;
  var $b.i.1$1: bv128;
  var $b.i.1$2: bv128;
  var $temp3.i.0$1: bv128;
  var $temp3.i.0$2: bv128;
  var $temp1.i1.0$1: bv128;
  var $temp1.i1.0$2: bv128;
  var $temp3.i.1$1: bv128;
  var $temp3.i.1$2: bv128;
  var $temp1.i1.1$1: bv128;
  var $temp1.i1.1$2: bv128;
  var $temp3.i.2$1: bv128;
  var $temp3.i.2$2: bv128;
  var $temp1.i1.2$1: bv128;
  var $temp1.i1.2$2: bv128;
  var $temp3.i.3$1: bv128;
  var $temp3.i.3$2: bv128;
  var $temp1.i1.3$1: bv128;
  var $temp1.i1.3$2: bv128;
  var $temp4.i.0$1: bv128;
  var $temp4.i.0$2: bv128;
  var $temp2.i2.0$1: bv128;
  var $temp2.i2.0$2: bv128;
  var $temp4.i.1$1: bv128;
  var $temp4.i.1$2: bv128;
  var $temp2.i2.1$1: bv128;
  var $temp2.i2.1$2: bv128;
  var $temp4.i.2$1: bv128;
  var $temp4.i.2$2: bv128;
  var $temp2.i2.2$1: bv128;
  var $temp2.i2.2$2: bv128;
  var $temp4.i.3$1: bv128;
  var $temp4.i.3$2: bv128;
  var $temp2.i2.3$1: bv128;
  var $temp2.i2.3$2: bv128;
  var v17$1: bv32;
  var v17$2: bv32;
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
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv128;
  var v20$2: bv128;
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
  var v35: bool;
  var v37$1: bv32;
  var v37$2: bv32;
  var v36$1: bv32;
  var v36$2: bv32;
  var v38$1: bv32;
  var v38$2: bv32;
  var v39$1: bv32;
  var v39$2: bv32;
  var v41$1: bv32;
  var v41$2: bv32;
  var v40$1: bv32;
  var v40$2: bv32;
  var v42$1: bv32;
  var v42$2: bv32;
  var v43$1: bv32;
  var v43$2: bv32;
  var v44$1: bv128;
  var v44$2: bv128;
  var v46$1: bv32;
  var v46$2: bv32;
  var v45$1: bv32;
  var v45$2: bv32;
  var v47$1: bv32;
  var v47$2: bv32;
  var v48$1: bv32;
  var v48$2: bv32;
  var v49$1: bv128;
  var v49$2: bv128;
  var v50$1: bv128;
  var v50$2: bv128;
  var v51: bool;
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
  var v108: bv32;
  var v109$1: bv32;
  var v109$2: bv32;
  var v110$1: bv32;
  var v110$2: bv32;
  var v111$1: bv32;
  var v111$2: bv32;
  var v112$1: bv32;
  var v112$2: bv32;
  var v113: bv32;
  var v114: bv32;
  var v115: bv32;
  var v116: bv32;
  var v117$1: bv32;
  var v117$2: bv32;
  var v118$1: bv32;
  var v118$2: bv32;
  var v119$1: bv32;
  var v119$2: bv32;
  var v120$1: bv32;
  var v120$2: bv32;
  var v122$1: bv32;
  var v122$2: bv32;
  var v123$1: bv32;
  var v123$2: bv32;
  var v121$1: bv32;
  var v121$2: bv32;
  var v124$1: bv32;
  var v124$2: bv32;
  var v125$1: bool;
  var v125$2: bool;
  var v126$1: bool;
  var v126$2: bool;
  var v127$1: bool;
  var v127$2: bool;
  var v128$1: bool;
  var v128$2: bool;
  var v129$1: bool;
  var v129$2: bool;
  var v130$1: bool;
  var v130$2: bool;
  var v131$1: bool;
  var v131$2: bool;
  var v132$1: bool;
  var v132$2: bool;
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


  $0:
    $$attrib$0bv32$1 := $attrib.coerce0[32:0];
    $$attrib$0bv32$2 := $attrib.coerce0[32:0];
    $$attrib$1bv32$1 := $attrib.coerce0[64:32];
    $$attrib$1bv32$2 := $attrib.coerce0[64:32];
    $$attrib$2bv32$1 := $attrib.coerce0[96:64];
    $$attrib$2bv32$2 := $attrib.coerce0[96:64];
    $$attrib$3bv32$1 := $attrib.coerce0[128:96];
    $$attrib$3bv32$2 := $attrib.coerce0[128:96];
    $$attrib$4bv32$1 := $attrib.coerce1[32:0];
    $$attrib$4bv32$2 := $attrib.coerce1[32:0];
    $$attrib$5bv32$1 := $attrib.coerce1[64:32];
    $$attrib$5bv32$2 := $attrib.coerce1[64:32];
    $$attrib$6bv32$1 := $attrib.coerce1[96:64];
    $$attrib$6bv32$2 := $attrib.coerce1[96:64];
    $$attrib$7bv32$1 := $attrib.coerce1[128:96];
    $$attrib$7bv32$2 := $attrib.coerce1[128:96];
    $$attrib$8bv32$1 := $attrib.coerce2[32:0];
    $$attrib$8bv32$2 := $attrib.coerce2[32:0];
    $$attrib$9bv32$1 := $attrib.coerce2[64:32];
    $$attrib$9bv32$2 := $attrib.coerce2[64:32];
    $$attrib$10bv32$1 := $attrib.coerce2[96:64];
    $$attrib$10bv32$2 := $attrib.coerce2[96:64];
    $$attrib$11bv32$1 := $attrib.coerce2[128:96];
    $$attrib$11bv32$2 := $attrib.coerce2[128:96];
    $$attrib$12bv32$1 := $attrib.coerce3[32:0];
    $$attrib$12bv32$2 := $attrib.coerce3[32:0];
    $$attrib$13bv32$1 := $attrib.coerce3[64:32];
    $$attrib$13bv32$2 := $attrib.coerce3[64:32];
    $$attrib$14bv32$1 := $attrib.coerce3[96:64];
    $$attrib$14bv32$2 := $attrib.coerce3[96:64];
    $$attrib$15bv32$1 := $attrib.coerce3[128:96];
    $$attrib$15bv32$2 := $attrib.coerce3[128:96];
    $$attrib$16bv32$1 := $attrib.coerce4[32:0];
    $$attrib$16bv32$2 := $attrib.coerce4[32:0];
    $$attrib$17bv32$1 := $attrib.coerce4[64:32];
    $$attrib$17bv32$2 := $attrib.coerce4[64:32];
    $$attrib$18bv32$1 := $attrib.coerce4[96:64];
    $$attrib$18bv32$2 := $attrib.coerce4[96:64];
    $$attrib$19bv32$1 := $attrib.coerce4[128:96];
    $$attrib$19bv32$2 := $attrib.coerce4[128:96];
    $$attrib$20bv32$1 := $attrib.coerce5[32:0];
    $$attrib$20bv32$2 := $attrib.coerce5[32:0];
    $$attrib$21bv32$1 := $attrib.coerce5[64:32];
    $$attrib$21bv32$2 := $attrib.coerce5[64:32];
    $$attrib$22bv32$1 := $attrib.coerce5[96:64];
    $$attrib$22bv32$2 := $attrib.coerce5[96:64];
    $$attrib$23bv32$1 := $attrib.coerce5[128:96];
    $$attrib$23bv32$2 := $attrib.coerce5[128:96];
    $$attrib$24bv32$1 := $attrib.coerce6[32:0];
    $$attrib$24bv32$2 := $attrib.coerce6[32:0];
    $$attrib$25bv32$1 := $attrib.coerce6[64:32];
    $$attrib$25bv32$2 := $attrib.coerce6[64:32];
    $$attrib$26bv32$1 := $attrib.coerce6[96:64];
    $$attrib$26bv32$2 := $attrib.coerce6[96:64];
    $$attrib$27bv32$1 := $attrib.coerce6[128:96];
    $$attrib$27bv32$2 := $attrib.coerce6[128:96];
    v0$1 := $$attrib$0bv32$1;
    v0$2 := $$attrib$0bv32$2;
    v1$1 := $$attrib$1bv32$1;
    v1$2 := $$attrib$1bv32$2;
    v2$1 := $$attrib$2bv32$1;
    v2$2 := $$attrib$2bv32$2;
    v3$1 := $$attrib$3bv32$1;
    v3$2 := $$attrib$3bv32$2;
    v4$1 := $$attrib$4bv32$1;
    v4$2 := $$attrib$4bv32$2;
    v5$1 := $$attrib$5bv32$1;
    v5$2 := $$attrib$5bv32$2;
    v6$1 := $$attrib$6bv32$1;
    v6$2 := $$attrib$6bv32$2;
    v7$1 := $$attrib$7bv32$1;
    v7$2 := $$attrib$7bv32$2;
    v8$1 := $$attrib$8bv32$1;
    v8$2 := $$attrib$8bv32$2;
    v9$1 := $$attrib$9bv32$1;
    v9$2 := $$attrib$9bv32$2;
    v10$1 := $$attrib$10bv32$1;
    v10$2 := $$attrib$10bv32$2;
    v11$1 := $$attrib$11bv32$1;
    v11$2 := $$attrib$11bv32$2;
    v12$1 := $$attrib$12bv32$1;
    v12$2 := $$attrib$12bv32$2;
    v13$1 := $$attrib$13bv32$1;
    v13$2 := $$attrib$13bv32$2;
    v14$1 := $$attrib$14bv32$1;
    v14$2 := $$attrib$14bv32$2;
    v15$1 := $$attrib$15bv32$1;
    v15$2 := $$attrib$15bv32$2;
    v16$1 := $$attrib$16bv32$1;
    v16$2 := $$attrib$16bv32$2;
    v17$1 := $$attrib$17bv32$1;
    v17$2 := $$attrib$17bv32$2;
    v18$1 := $$attrib$18bv32$1;
    v18$2 := $$attrib$18bv32$2;
    v19$1 := $$attrib$19bv32$1;
    v19$2 := $$attrib$19bv32$2;
    v20$1 := v19$1 ++ v18$1 ++ v17$1 ++ v16$1;
    v20$2 := v19$2 ++ v18$2 ++ v17$2 ++ v16$2;
    v21$1 := $$attrib$20bv32$1;
    v21$2 := $$attrib$20bv32$2;
    v22$1 := $$attrib$21bv32$1;
    v22$2 := $$attrib$21bv32$2;
    v23$1 := $$attrib$22bv32$1;
    v23$2 := $$attrib$22bv32$2;
    v24$1 := $$attrib$23bv32$1;
    v24$2 := $$attrib$23bv32$2;
    v25$1 := $$attrib$24bv32$1;
    v25$2 := $$attrib$24bv32$2;
    v26$1 := $$attrib$25bv32$1;
    v26$2 := $$attrib$25bv32$2;
    v27$1 := $$attrib$26bv32$1;
    v27$2 := $$attrib$26bv32$2;
    v28$1 := $$attrib$27bv32$1;
    v28$2 := $$attrib$27bv32$2;
    v29$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v29$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v30$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v30$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    havoc v31$1, v31$2;
    havoc v32$1, v32$2;
    havoc v33$1, v33$2;
    havoc v34$1, v34$2;
    $nextRand.0$1, $trajPrice1.0$1, $trajPrice2.0$1, $sumPrice1.0$1, $sumPrice2.0$1, $sumDeriv1.0$1, $sumDeriv2.0$1, $i.0 := v34$1 ++ v33$1 ++ v32$1 ++ v31$1, v20$1, v20$1, v20$1, v20$1, 0bv128, 0bv128, 1bv32;
    $nextRand.0$2, $trajPrice1.0$2, $trajPrice2.0$2, $sumPrice1.0$2, $sumPrice2.0$2, $sumDeriv1.0$2, $sumDeriv2.0$2 := v34$2 ++ v33$2 ++ v32$2 ++ v31$2, v20$2, v20$2, v20$2, v20$2, 0bv128, 0bv128;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 62} true;
    v35 := BV32_SLT($i.0, $noOfSum);
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
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v35 && !v35;
    v113 := SI32_TO_FP32($noOfSum);
    v114 := SI32_TO_FP32($noOfSum);
    v115 := SI32_TO_FP32($noOfSum);
    v116 := SI32_TO_FP32($noOfSum);
    v117$1 := FSUB32(FDIV32($sumPrice1.0$1[32:0], v113), v0$1);
    v117$2 := FSUB32(FDIV32($sumPrice1.0$2[32:0], v113), v0$2);
    v118$1 := FSUB32(FDIV32($sumPrice1.0$1[64:32], v113), v1$1);
    v118$2 := FSUB32(FDIV32($sumPrice1.0$2[64:32], v113), v1$2);
    v119$1 := FSUB32(FDIV32($sumPrice1.0$1[96:64], v113), v2$1);
    v119$2 := FSUB32(FDIV32($sumPrice1.0$2[96:64], v113), v2$2);
    v120$1 := FSUB32(FDIV32($sumPrice1.0$1[128:96], v113), v3$1);
    v120$2 := FSUB32(FDIV32($sumPrice1.0$2[128:96], v113), v3$2);
    v121$1 := FSUB32(FDIV32($sumPrice2.0$1[32:0], v114), v0$1);
    v121$2 := FSUB32(FDIV32($sumPrice2.0$2[32:0], v114), v0$2);
    v122$1 := FSUB32(FDIV32($sumPrice2.0$1[64:32], v114), v1$1);
    v122$2 := FSUB32(FDIV32($sumPrice2.0$2[64:32], v114), v1$2);
    v123$1 := FSUB32(FDIV32($sumPrice2.0$1[96:64], v114), v2$1);
    v123$2 := FSUB32(FDIV32($sumPrice2.0$2[96:64], v114), v2$2);
    v124$1 := FSUB32(FDIV32($sumPrice2.0$1[128:96], v114), v3$1);
    v124$2 := FSUB32(FDIV32($sumPrice2.0$2[128:96], v114), v3$2);
    v125$1 := FLT32(0bv32, v117$1);
    v125$2 := FLT32(0bv32, v117$2);
    p0$1 := (if v125$1 then v125$1 else p0$1);
    p0$2 := (if v125$2 then v125$2 else p0$2);
    p1$1 := (if !v125$1 then !v125$1 else p1$1);
    p1$2 := (if !v125$2 then !v125$2 else p1$2);
    $temp3.i.0$1, $temp1.i1.0$1 := (if p0$1 then 0bv96 ++ v117$1 else $temp3.i.0$1), (if p0$1 then 1065353216bv128 else $temp1.i1.0$1);
    $temp3.i.0$2, $temp1.i1.0$2 := (if p0$2 then 0bv96 ++ v117$2 else $temp3.i.0$2), (if p0$2 then 1065353216bv128 else $temp1.i1.0$2);
    $temp3.i.0$1, $temp1.i1.0$1 := (if p1$1 then 0bv128 else $temp3.i.0$1), (if p1$1 then 0bv128 else $temp1.i1.0$1);
    $temp3.i.0$2, $temp1.i1.0$2 := (if p1$2 then 0bv128 else $temp3.i.0$2), (if p1$2 then 0bv128 else $temp1.i1.0$2);
    v126$1 := FLT32(0bv32, v118$1);
    v126$2 := FLT32(0bv32, v118$2);
    p2$1 := (if v126$1 then v126$1 else p2$1);
    p2$2 := (if v126$2 then v126$2 else p2$2);
    p3$1 := (if !v126$1 then !v126$1 else p3$1);
    p3$2 := (if !v126$2 then !v126$2 else p3$2);
    $temp3.i.1$1, $temp1.i1.1$1 := (if p2$1 then $temp3.i.0$1[128:96] ++ $temp3.i.0$1[96:64] ++ v118$1 ++ $temp3.i.0$1[32:0] else $temp3.i.1$1), (if p2$1 then $temp1.i1.0$1[128:96] ++ $temp1.i1.0$1[96:64] ++ 1065353216bv32 ++ $temp1.i1.0$1[32:0] else $temp1.i1.1$1);
    $temp3.i.1$2, $temp1.i1.1$2 := (if p2$2 then $temp3.i.0$2[128:96] ++ $temp3.i.0$2[96:64] ++ v118$2 ++ $temp3.i.0$2[32:0] else $temp3.i.1$2), (if p2$2 then $temp1.i1.0$2[128:96] ++ $temp1.i1.0$2[96:64] ++ 1065353216bv32 ++ $temp1.i1.0$2[32:0] else $temp1.i1.1$2);
    $temp3.i.1$1, $temp1.i1.1$1 := (if p3$1 then $temp3.i.0$1 else $temp3.i.1$1), (if p3$1 then $temp1.i1.0$1 else $temp1.i1.1$1);
    $temp3.i.1$2, $temp1.i1.1$2 := (if p3$2 then $temp3.i.0$2 else $temp3.i.1$2), (if p3$2 then $temp1.i1.0$2 else $temp1.i1.1$2);
    v127$1 := FLT32(0bv32, v119$1);
    v127$2 := FLT32(0bv32, v119$2);
    p4$1 := (if v127$1 then v127$1 else p4$1);
    p4$2 := (if v127$2 then v127$2 else p4$2);
    p5$1 := (if !v127$1 then !v127$1 else p5$1);
    p5$2 := (if !v127$2 then !v127$2 else p5$2);
    $temp3.i.2$1, $temp1.i1.2$1 := (if p4$1 then $temp3.i.1$1[128:96] ++ v119$1 ++ $temp3.i.1$1[64:32] ++ $temp3.i.1$1[32:0] else $temp3.i.2$1), (if p4$1 then $temp1.i1.1$1[128:96] ++ 1065353216bv32 ++ $temp1.i1.1$1[64:32] ++ $temp1.i1.1$1[32:0] else $temp1.i1.2$1);
    $temp3.i.2$2, $temp1.i1.2$2 := (if p4$2 then $temp3.i.1$2[128:96] ++ v119$2 ++ $temp3.i.1$2[64:32] ++ $temp3.i.1$2[32:0] else $temp3.i.2$2), (if p4$2 then $temp1.i1.1$2[128:96] ++ 1065353216bv32 ++ $temp1.i1.1$2[64:32] ++ $temp1.i1.1$2[32:0] else $temp1.i1.2$2);
    $temp3.i.2$1, $temp1.i1.2$1 := (if p5$1 then $temp3.i.1$1 else $temp3.i.2$1), (if p5$1 then $temp1.i1.1$1 else $temp1.i1.2$1);
    $temp3.i.2$2, $temp1.i1.2$2 := (if p5$2 then $temp3.i.1$2 else $temp3.i.2$2), (if p5$2 then $temp1.i1.1$2 else $temp1.i1.2$2);
    v128$1 := FLT32(0bv32, v120$1);
    v128$2 := FLT32(0bv32, v120$2);
    p6$1 := (if v128$1 then v128$1 else p6$1);
    p6$2 := (if v128$2 then v128$2 else p6$2);
    p7$1 := (if !v128$1 then !v128$1 else p7$1);
    p7$2 := (if !v128$2 then !v128$2 else p7$2);
    $temp3.i.3$1, $temp1.i1.3$1 := (if p6$1 then v120$1 ++ $temp3.i.2$1[96:64] ++ $temp3.i.2$1[64:32] ++ $temp3.i.2$1[32:0] else $temp3.i.3$1), (if p6$1 then 1065353216bv32 ++ $temp1.i1.2$1[96:64] ++ $temp1.i1.2$1[64:32] ++ $temp1.i1.2$1[32:0] else $temp1.i1.3$1);
    $temp3.i.3$2, $temp1.i1.3$2 := (if p6$2 then v120$2 ++ $temp3.i.2$2[96:64] ++ $temp3.i.2$2[64:32] ++ $temp3.i.2$2[32:0] else $temp3.i.3$2), (if p6$2 then 1065353216bv32 ++ $temp1.i1.2$2[96:64] ++ $temp1.i1.2$2[64:32] ++ $temp1.i1.2$2[32:0] else $temp1.i1.3$2);
    $temp3.i.3$1, $temp1.i1.3$1 := (if p7$1 then $temp3.i.2$1 else $temp3.i.3$1), (if p7$1 then $temp1.i1.2$1 else $temp1.i1.3$1);
    $temp3.i.3$2, $temp1.i1.3$2 := (if p7$2 then $temp3.i.2$2 else $temp3.i.3$2), (if p7$2 then $temp1.i1.2$2 else $temp1.i1.3$2);
    v129$1 := FLT32(0bv32, v121$1);
    v129$2 := FLT32(0bv32, v121$2);
    p8$1 := (if v129$1 then v129$1 else p8$1);
    p8$2 := (if v129$2 then v129$2 else p8$2);
    p9$1 := (if !v129$1 then !v129$1 else p9$1);
    p9$2 := (if !v129$2 then !v129$2 else p9$2);
    $temp4.i.0$1, $temp2.i2.0$1 := (if p8$1 then 0bv96 ++ v121$1 else $temp4.i.0$1), (if p8$1 then 1065353216bv128 else $temp2.i2.0$1);
    $temp4.i.0$2, $temp2.i2.0$2 := (if p8$2 then 0bv96 ++ v121$2 else $temp4.i.0$2), (if p8$2 then 1065353216bv128 else $temp2.i2.0$2);
    $temp4.i.0$1, $temp2.i2.0$1 := (if p9$1 then 0bv128 else $temp4.i.0$1), (if p9$1 then 0bv128 else $temp2.i2.0$1);
    $temp4.i.0$2, $temp2.i2.0$2 := (if p9$2 then 0bv128 else $temp4.i.0$2), (if p9$2 then 0bv128 else $temp2.i2.0$2);
    v130$1 := FLT32(0bv32, v122$1);
    v130$2 := FLT32(0bv32, v122$2);
    p10$1 := (if v130$1 then v130$1 else p10$1);
    p10$2 := (if v130$2 then v130$2 else p10$2);
    p11$1 := (if !v130$1 then !v130$1 else p11$1);
    p11$2 := (if !v130$2 then !v130$2 else p11$2);
    $temp4.i.1$1, $temp2.i2.1$1 := (if p10$1 then $temp4.i.0$1[128:96] ++ $temp4.i.0$1[96:64] ++ v122$1 ++ $temp4.i.0$1[32:0] else $temp4.i.1$1), (if p10$1 then $temp2.i2.0$1[128:96] ++ $temp2.i2.0$1[96:64] ++ 1065353216bv32 ++ $temp2.i2.0$1[32:0] else $temp2.i2.1$1);
    $temp4.i.1$2, $temp2.i2.1$2 := (if p10$2 then $temp4.i.0$2[128:96] ++ $temp4.i.0$2[96:64] ++ v122$2 ++ $temp4.i.0$2[32:0] else $temp4.i.1$2), (if p10$2 then $temp2.i2.0$2[128:96] ++ $temp2.i2.0$2[96:64] ++ 1065353216bv32 ++ $temp2.i2.0$2[32:0] else $temp2.i2.1$2);
    $temp4.i.1$1, $temp2.i2.1$1 := (if p11$1 then $temp4.i.0$1 else $temp4.i.1$1), (if p11$1 then $temp2.i2.0$1 else $temp2.i2.1$1);
    $temp4.i.1$2, $temp2.i2.1$2 := (if p11$2 then $temp4.i.0$2 else $temp4.i.1$2), (if p11$2 then $temp2.i2.0$2 else $temp2.i2.1$2);
    v131$1 := FLT32(0bv32, v123$1);
    v131$2 := FLT32(0bv32, v123$2);
    p12$1 := (if v131$1 then v131$1 else p12$1);
    p12$2 := (if v131$2 then v131$2 else p12$2);
    p13$1 := (if !v131$1 then !v131$1 else p13$1);
    p13$2 := (if !v131$2 then !v131$2 else p13$2);
    $temp4.i.2$1, $temp2.i2.2$1 := (if p12$1 then $temp4.i.1$1[128:96] ++ v123$1 ++ $temp4.i.1$1[64:32] ++ $temp4.i.1$1[32:0] else $temp4.i.2$1), (if p12$1 then $temp2.i2.1$1[128:96] ++ 1065353216bv32 ++ $temp2.i2.1$1[64:32] ++ $temp2.i2.1$1[32:0] else $temp2.i2.2$1);
    $temp4.i.2$2, $temp2.i2.2$2 := (if p12$2 then $temp4.i.1$2[128:96] ++ v123$2 ++ $temp4.i.1$2[64:32] ++ $temp4.i.1$2[32:0] else $temp4.i.2$2), (if p12$2 then $temp2.i2.1$2[128:96] ++ 1065353216bv32 ++ $temp2.i2.1$2[64:32] ++ $temp2.i2.1$2[32:0] else $temp2.i2.2$2);
    $temp4.i.2$1, $temp2.i2.2$1 := (if p13$1 then $temp4.i.1$1 else $temp4.i.2$1), (if p13$1 then $temp2.i2.1$1 else $temp2.i2.2$1);
    $temp4.i.2$2, $temp2.i2.2$2 := (if p13$2 then $temp4.i.1$2 else $temp4.i.2$2), (if p13$2 then $temp2.i2.1$2 else $temp2.i2.2$2);
    v132$1 := FLT32(0bv32, v124$1);
    v132$2 := FLT32(0bv32, v124$2);
    p14$1 := (if v132$1 then v132$1 else p14$1);
    p14$2 := (if v132$2 then v132$2 else p14$2);
    p15$1 := (if !v132$1 then !v132$1 else p15$1);
    p15$2 := (if !v132$2 then !v132$2 else p15$2);
    $temp4.i.3$1, $temp2.i2.3$1 := (if p14$1 then v124$1 ++ $temp4.i.2$1[96:64] ++ $temp4.i.2$1[64:32] ++ $temp4.i.2$1[32:0] else $temp4.i.3$1), (if p14$1 then 1065353216bv32 ++ $temp2.i2.2$1[96:64] ++ $temp2.i2.2$1[64:32] ++ $temp2.i2.2$1[32:0] else $temp2.i2.3$1);
    $temp4.i.3$2, $temp2.i2.3$2 := (if p14$2 then v124$2 ++ $temp4.i.2$2[96:64] ++ $temp4.i.2$2[64:32] ++ $temp4.i.2$2[32:0] else $temp4.i.3$2), (if p14$2 then 1065353216bv32 ++ $temp2.i2.2$2[96:64] ++ $temp2.i2.2$2[64:32] ++ $temp2.i2.2$2[32:0] else $temp2.i2.3$2);
    $temp4.i.3$1, $temp2.i2.3$1 := (if p15$1 then $temp4.i.2$1 else $temp4.i.3$1), (if p15$1 then $temp2.i2.2$1 else $temp2.i2.3$1);
    $temp4.i.3$2, $temp2.i2.3$2 := (if p15$2 then $temp4.i.2$2 else $temp4.i.3$2), (if p15$2 then $temp2.i2.2$2 else $temp2.i2.3$2);
    call {:sourceloc} {:sourceloc_num 147} _LOG_WRITE_$$priceSamples(true, BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), $temp3.i.3$1[32:0], $$priceSamples[BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$priceSamples(true, BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 147} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 147} _CHECK_WRITE_$$priceSamples(true, BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), $temp3.i.3$2[32:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$priceSamples"} true;
    $$priceSamples[BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32)] := $temp3.i.3$1[32:0];
    $$priceSamples[BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32)] := $temp3.i.3$2[32:0];
    call {:sourceloc} {:sourceloc_num 148} _LOG_WRITE_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 1bv32), $temp3.i.3$1[64:32], $$priceSamples[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 148} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 148} _CHECK_WRITE_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 1bv32), $temp3.i.3$2[64:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$priceSamples"} true;
    $$priceSamples[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 1bv32)] := $temp3.i.3$1[64:32];
    $$priceSamples[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 1bv32)] := $temp3.i.3$2[64:32];
    call {:sourceloc} {:sourceloc_num 149} _LOG_WRITE_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 2bv32), $temp3.i.3$1[96:64], $$priceSamples[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 149} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 149} _CHECK_WRITE_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 2bv32), $temp3.i.3$2[96:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$priceSamples"} true;
    $$priceSamples[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 2bv32)] := $temp3.i.3$1[96:64];
    $$priceSamples[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 2bv32)] := $temp3.i.3$2[96:64];
    call {:sourceloc} {:sourceloc_num 150} _LOG_WRITE_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 3bv32), $temp3.i.3$1[128:96], $$priceSamples[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 150} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 150} _CHECK_WRITE_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 3bv32), $temp3.i.3$2[128:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$priceSamples"} true;
    $$priceSamples[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 3bv32)] := $temp3.i.3$1[128:96];
    $$priceSamples[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 3bv32)] := $temp3.i.3$2[128:96];
    call {:sourceloc} {:sourceloc_num 151} _LOG_WRITE_$$priceSamples(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), $temp4.i.3$1[32:0], $$priceSamples[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$priceSamples(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 151} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 151} _CHECK_WRITE_$$priceSamples(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), $temp4.i.3$2[32:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$priceSamples"} true;
    $$priceSamples[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32)] := $temp4.i.3$1[32:0];
    $$priceSamples[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32)] := $temp4.i.3$2[32:0];
    call {:sourceloc} {:sourceloc_num 152} _LOG_WRITE_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 1bv32), $temp4.i.3$1[64:32], $$priceSamples[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 152} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 152} _CHECK_WRITE_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 1bv32), $temp4.i.3$2[64:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$priceSamples"} true;
    $$priceSamples[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 1bv32)] := $temp4.i.3$1[64:32];
    $$priceSamples[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 1bv32)] := $temp4.i.3$2[64:32];
    call {:sourceloc} {:sourceloc_num 153} _LOG_WRITE_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 2bv32), $temp4.i.3$1[96:64], $$priceSamples[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 153} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 153} _CHECK_WRITE_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 2bv32), $temp4.i.3$2[96:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$priceSamples"} true;
    $$priceSamples[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 2bv32)] := $temp4.i.3$1[96:64];
    $$priceSamples[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 2bv32)] := $temp4.i.3$2[96:64];
    call {:sourceloc} {:sourceloc_num 154} _LOG_WRITE_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 3bv32), $temp4.i.3$1[128:96], $$priceSamples[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 154} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 154} _CHECK_WRITE_$$priceSamples(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 3bv32), $temp4.i.3$2[128:96]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$priceSamples"} true;
    $$priceSamples[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 3bv32)] := $temp4.i.3$1[128:96];
    $$priceSamples[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 3bv32)] := $temp4.i.3$2[128:96];
    call {:sourceloc} {:sourceloc_num 155} _LOG_WRITE_$$pathDeriv(true, BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), FMUL32(FDIV32($sumDeriv1.0$1[32:0], v115), $temp1.i1.3$1[32:0]), $$pathDeriv[BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathDeriv(true, BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 155} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 155} _CHECK_WRITE_$$pathDeriv(true, BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), FMUL32(FDIV32($sumDeriv1.0$2[32:0], v115), $temp1.i1.3$2[32:0]));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pathDeriv"} true;
    $$pathDeriv[BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32)] := FMUL32(FDIV32($sumDeriv1.0$1[32:0], v115), $temp1.i1.3$1[32:0]);
    $$pathDeriv[BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32)] := FMUL32(FDIV32($sumDeriv1.0$2[32:0], v115), $temp1.i1.3$2[32:0]);
    call {:sourceloc} {:sourceloc_num 156} _LOG_WRITE_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 1bv32), FMUL32(FDIV32($sumDeriv1.0$1[64:32], v115), $temp1.i1.3$1[64:32]), $$pathDeriv[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 156} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 156} _CHECK_WRITE_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 1bv32), FMUL32(FDIV32($sumDeriv1.0$2[64:32], v115), $temp1.i1.3$2[64:32]));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pathDeriv"} true;
    $$pathDeriv[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 1bv32)] := FMUL32(FDIV32($sumDeriv1.0$1[64:32], v115), $temp1.i1.3$1[64:32]);
    $$pathDeriv[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 1bv32)] := FMUL32(FDIV32($sumDeriv1.0$2[64:32], v115), $temp1.i1.3$2[64:32]);
    call {:sourceloc} {:sourceloc_num 157} _LOG_WRITE_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 2bv32), FMUL32(FDIV32($sumDeriv1.0$1[96:64], v115), $temp1.i1.3$1[96:64]), $$pathDeriv[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 157} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 157} _CHECK_WRITE_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 2bv32), FMUL32(FDIV32($sumDeriv1.0$2[96:64], v115), $temp1.i1.3$2[96:64]));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pathDeriv"} true;
    $$pathDeriv[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 2bv32)] := FMUL32(FDIV32($sumDeriv1.0$1[96:64], v115), $temp1.i1.3$1[96:64]);
    $$pathDeriv[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 2bv32)] := FMUL32(FDIV32($sumDeriv1.0$2[96:64], v115), $temp1.i1.3$2[96:64]);
    call {:sourceloc} {:sourceloc_num 158} _LOG_WRITE_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 3bv32), FMUL32(FDIV32($sumDeriv1.0$1[128:96], v115), $temp1.i1.3$1[128:96]), $$pathDeriv[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 158} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 158} _CHECK_WRITE_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 3bv32), FMUL32(FDIV32($sumDeriv1.0$2[128:96], v115), $temp1.i1.3$2[128:96]));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pathDeriv"} true;
    $$pathDeriv[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 4bv32), 3bv32)] := FMUL32(FDIV32($sumDeriv1.0$1[128:96], v115), $temp1.i1.3$1[128:96]);
    $$pathDeriv[BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 4bv32), 3bv32)] := FMUL32(FDIV32($sumDeriv1.0$2[128:96], v115), $temp1.i1.3$2[128:96]);
    call {:sourceloc} {:sourceloc_num 159} _LOG_WRITE_$$pathDeriv(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), FMUL32(FDIV32($sumDeriv2.0$1[32:0], v116), $temp2.i2.3$1[32:0]), $$pathDeriv[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathDeriv(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 159} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 159} _CHECK_WRITE_$$pathDeriv(true, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), FMUL32(FDIV32($sumDeriv2.0$2[32:0], v116), $temp2.i2.3$2[32:0]));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pathDeriv"} true;
    $$pathDeriv[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32)] := FMUL32(FDIV32($sumDeriv2.0$1[32:0], v116), $temp2.i2.3$1[32:0]);
    $$pathDeriv[BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32)] := FMUL32(FDIV32($sumDeriv2.0$2[32:0], v116), $temp2.i2.3$2[32:0]);
    call {:sourceloc} {:sourceloc_num 160} _LOG_WRITE_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 1bv32), FMUL32(FDIV32($sumDeriv2.0$1[64:32], v116), $temp2.i2.3$1[64:32]), $$pathDeriv[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 160} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 160} _CHECK_WRITE_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 1bv32), FMUL32(FDIV32($sumDeriv2.0$2[64:32], v116), $temp2.i2.3$2[64:32]));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pathDeriv"} true;
    $$pathDeriv[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 1bv32)] := FMUL32(FDIV32($sumDeriv2.0$1[64:32], v116), $temp2.i2.3$1[64:32]);
    $$pathDeriv[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 1bv32)] := FMUL32(FDIV32($sumDeriv2.0$2[64:32], v116), $temp2.i2.3$2[64:32]);
    call {:sourceloc} {:sourceloc_num 161} _LOG_WRITE_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 2bv32), FMUL32(FDIV32($sumDeriv2.0$1[96:64], v116), $temp2.i2.3$1[96:64]), $$pathDeriv[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 161} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 161} _CHECK_WRITE_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 2bv32), FMUL32(FDIV32($sumDeriv2.0$2[96:64], v116), $temp2.i2.3$2[96:64]));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pathDeriv"} true;
    $$pathDeriv[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 2bv32)] := FMUL32(FDIV32($sumDeriv2.0$1[96:64], v116), $temp2.i2.3$1[96:64]);
    $$pathDeriv[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 2bv32)] := FMUL32(FDIV32($sumDeriv2.0$2[96:64], v116), $temp2.i2.3$2[96:64]);
    call {:sourceloc} {:sourceloc_num 162} _LOG_WRITE_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 3bv32), FMUL32(FDIV32($sumDeriv2.0$1[128:96], v116), $temp2.i2.3$1[128:96]), $$pathDeriv[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 162} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 162} _CHECK_WRITE_$$pathDeriv(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 3bv32), FMUL32(FDIV32($sumDeriv2.0$2[128:96], v116), $temp2.i2.3$2[128:96]));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$pathDeriv"} true;
    $$pathDeriv[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$1, $width), v29$1), 2bv32), 1bv32), 4bv32), 3bv32)] := FMUL32(FDIV32($sumDeriv2.0$1[128:96], v116), $temp2.i2.3$1[128:96]);
    $$pathDeriv[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v30$2, $width), v29$2), 2bv32), 1bv32), 4bv32), 3bv32)] := FMUL32(FDIV32($sumDeriv2.0$2[128:96], v116), $temp2.i2.3$2[128:96]);
    return;

  $truebb:
    assume {:partition} v35 && v35;
    v36$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR($nextRand.0$1[32:0], BV32_LSHR($nextRand.0$1[32:0], 30bv32))), 1bv32);
    v36$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR($nextRand.0$2[32:0], BV32_LSHR($nextRand.0$2[32:0], 30bv32))), 1bv32);
    v37$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR($nextRand.0$1[64:32], BV32_LSHR($nextRand.0$1[64:32], 30bv32))), 1bv32);
    v37$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR($nextRand.0$2[64:32], BV32_LSHR($nextRand.0$2[64:32], 30bv32))), 1bv32);
    v38$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR($nextRand.0$1[96:64], BV32_LSHR($nextRand.0$1[96:64], 30bv32))), 1bv32);
    v38$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR($nextRand.0$2[96:64], BV32_LSHR($nextRand.0$2[96:64], 30bv32))), 1bv32);
    v39$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR($nextRand.0$1[128:96], BV32_LSHR($nextRand.0$1[128:96], 30bv32))), 1bv32);
    v39$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR($nextRand.0$2[128:96], BV32_LSHR($nextRand.0$2[128:96], 30bv32))), 1bv32);
    v40$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v36$1, BV32_LSHR(v36$1, 30bv32))), 2bv32);
    v40$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v36$2, BV32_LSHR(v36$2, 30bv32))), 2bv32);
    v41$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v37$1, BV32_LSHR(v37$1, 30bv32))), 2bv32);
    v41$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v37$2, BV32_LSHR(v37$2, 30bv32))), 2bv32);
    v42$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v38$1, BV32_LSHR(v38$1, 30bv32))), 2bv32);
    v42$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v38$2, BV32_LSHR(v38$2, 30bv32))), 2bv32);
    v43$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v39$1, BV32_LSHR(v39$1, 30bv32))), 2bv32);
    v43$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v39$2, BV32_LSHR(v39$2, 30bv32))), 2bv32);
    v44$1 := v43$1 ++ v42$1 ++ v41$1 ++ v40$1;
    v44$2 := v43$2 ++ v42$2 ++ v41$2 ++ v40$2;
    v45$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v40$1, BV32_LSHR(v40$1, 30bv32))), 3bv32);
    v45$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v40$2, BV32_LSHR(v40$2, 30bv32))), 3bv32);
    v46$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v41$1, BV32_LSHR(v41$1, 30bv32))), 3bv32);
    v46$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v41$2, BV32_LSHR(v41$2, 30bv32))), 3bv32);
    v47$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v42$1, BV32_LSHR(v42$1, 30bv32))), 3bv32);
    v47$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v42$2, BV32_LSHR(v42$2, 30bv32))), 3bv32);
    v48$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v43$1, BV32_LSHR(v43$1, 30bv32))), 3bv32);
    v48$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v43$2, BV32_LSHR(v43$2, 30bv32))), 3bv32);
    v49$1 := v48$1 ++ v47$1 ++ v46$1 ++ v45$1;
    v49$2 := v48$2 ++ v47$2 ++ v46$2 ++ v45$2;
    v50$1 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v48$1, BV32_LSHR(v48$1, 30bv32))), 4bv32) ++ BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v47$1, BV32_LSHR(v47$1, 30bv32))), 4bv32) ++ BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v46$1, BV32_LSHR(v46$1, 30bv32))), 4bv32) ++ BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v45$1, BV32_LSHR(v45$1, 30bv32))), 4bv32);
    v50$2 := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v48$2, BV32_LSHR(v48$2, 30bv32))), 4bv32) ++ BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v47$2, BV32_LSHR(v47$2, 30bv32))), 4bv32) ++ BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v46$2, BV32_LSHR(v46$2, 30bv32))), 4bv32) ++ BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v45$2, BV32_LSHR(v45$2, 30bv32))), 4bv32);
    $r1.i.0$1, $r2.i.0$1, $a.i.0$1, $b.i.0$1, $i.i.0 := 0bv128, 0bv128, 0bv128, 0bv128, 0bv32;
    $r1.i.0$2, $r2.i.0$2, $a.i.0$2, $b.i.0$2 := 0bv128, 0bv128, 0bv128, 0bv128;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_1"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 64} true;
    v51 := BV32_ULT($i.i.0, 4bv32);
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v51 && !v51;
    v80$1 := $$temp.i$1[0bv32];
    v80$2 := $$temp.i$2[0bv32];
    v81$1 := $$temp.i$1[1bv32];
    v81$2 := $$temp.i$2[1bv32];
    v82$1 := $$temp.i$1[2bv32];
    v82$2 := $$temp.i$2[2bv32];
    v83$1 := $$temp.i$1[3bv32];
    v83$2 := $$temp.i$2[3bv32];
    v84$1 := $$temp.i$1[4bv32];
    v84$2 := $$temp.i$2[4bv32];
    v85$1 := $$temp.i$1[5bv32];
    v85$2 := $$temp.i$2[5bv32];
    v86$1 := $$temp.i$1[6bv32];
    v86$2 := $$temp.i$2[6bv32];
    v87$1 := $$temp.i$1[7bv32];
    v87$2 := $$temp.i$2[7bv32];
    v88$1 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(UI32_TO_FP32(v80$1), 1333788672bv32)), 1060205080bv32)));
    v88$2 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(UI32_TO_FP32(v80$2), 1333788672bv32)), 1060205080bv32)));
    v89$1 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(UI32_TO_FP32(v81$1), 1333788672bv32)), 1060205080bv32)));
    v89$2 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(UI32_TO_FP32(v81$2), 1333788672bv32)), 1060205080bv32)));
    v90$1 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(UI32_TO_FP32(v82$1), 1333788672bv32)), 1060205080bv32)));
    v90$2 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(UI32_TO_FP32(v82$2), 1333788672bv32)), 1060205080bv32)));
    v91$1 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(UI32_TO_FP32(v83$1), 1333788672bv32)), 1060205080bv32)));
    v91$2 := FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FDIV32(UI32_TO_FP32(v83$2), 1333788672bv32)), 1060205080bv32)));
    v92$1 := FMUL32(1086918619bv32, FDIV32(UI32_TO_FP32(v84$1), 1333788672bv32));
    v92$2 := FMUL32(1086918619bv32, FDIV32(UI32_TO_FP32(v84$2), 1333788672bv32));
    v93$1 := FMUL32(1086918619bv32, FDIV32(UI32_TO_FP32(v85$1), 1333788672bv32));
    v93$2 := FMUL32(1086918619bv32, FDIV32(UI32_TO_FP32(v85$2), 1333788672bv32));
    v94$1 := FMUL32(1086918619bv32, FDIV32(UI32_TO_FP32(v86$1), 1333788672bv32));
    v94$2 := FMUL32(1086918619bv32, FDIV32(UI32_TO_FP32(v86$2), 1333788672bv32));
    v95$1 := FMUL32(1086918619bv32, FDIV32(UI32_TO_FP32(v87$1), 1333788672bv32));
    v95$2 := FMUL32(1086918619bv32, FDIV32(UI32_TO_FP32(v87$2), 1333788672bv32));
    v96$1 := $$temp.i$1[8bv32];
    v96$2 := $$temp.i$2[8bv32];
    v97$1 := $$temp.i$1[9bv32];
    v97$2 := $$temp.i$2[9bv32];
    v98$1 := $$temp.i$1[10bv32];
    v98$2 := $$temp.i$2[10bv32];
    v99$1 := $$temp.i$1[11bv32];
    v99$2 := $$temp.i$2[11bv32];
    v100$1 := FMUL32($trajPrice1.0$1[32:0], FEXP32(FMUL32(FADD32(FMUL32(v8$1, FMUL32(v88$1, FCOS32(v92$1))), v4$1), 1069066811bv32)));
    v100$2 := FMUL32($trajPrice1.0$2[32:0], FEXP32(FMUL32(FADD32(FMUL32(v8$2, FMUL32(v88$2, FCOS32(v92$2))), v4$2), 1069066811bv32)));
    v101$1 := FMUL32($trajPrice1.0$1[64:32], FEXP32(FMUL32(FADD32(FMUL32(v9$1, FMUL32(v89$1, FCOS32(v93$1))), v5$1), 1069066811bv32)));
    v101$2 := FMUL32($trajPrice1.0$2[64:32], FEXP32(FMUL32(FADD32(FMUL32(v9$2, FMUL32(v89$2, FCOS32(v93$2))), v5$2), 1069066811bv32)));
    v102$1 := FMUL32($trajPrice1.0$1[96:64], FEXP32(FMUL32(FADD32(FMUL32(v10$1, FMUL32(v90$1, FCOS32(v94$1))), v6$1), 1069066811bv32)));
    v102$2 := FMUL32($trajPrice1.0$2[96:64], FEXP32(FMUL32(FADD32(FMUL32(v10$2, FMUL32(v90$2, FCOS32(v94$2))), v6$2), 1069066811bv32)));
    v103$1 := FMUL32($trajPrice1.0$1[128:96], FEXP32(FMUL32(FADD32(FMUL32(v11$1, FMUL32(v91$1, FCOS32(v95$1))), v7$1), 1069066811bv32)));
    v103$2 := FMUL32($trajPrice1.0$2[128:96], FEXP32(FMUL32(FADD32(FMUL32(v11$2, FMUL32(v91$2, FCOS32(v95$2))), v7$2), 1069066811bv32)));
    v104$1 := FMUL32($trajPrice2.0$1[32:0], FEXP32(FMUL32(FADD32(FMUL32(v8$1, FMUL32(v88$1, FSIN32(v92$1))), v4$1), 1069066811bv32)));
    v104$2 := FMUL32($trajPrice2.0$2[32:0], FEXP32(FMUL32(FADD32(FMUL32(v8$2, FMUL32(v88$2, FSIN32(v92$2))), v4$2), 1069066811bv32)));
    v105$1 := FMUL32($trajPrice2.0$1[64:32], FEXP32(FMUL32(FADD32(FMUL32(v9$1, FMUL32(v89$1, FSIN32(v93$1))), v5$1), 1069066811bv32)));
    v105$2 := FMUL32($trajPrice2.0$2[64:32], FEXP32(FMUL32(FADD32(FMUL32(v9$2, FMUL32(v89$2, FSIN32(v93$2))), v5$2), 1069066811bv32)));
    v106$1 := FMUL32($trajPrice2.0$1[96:64], FEXP32(FMUL32(FADD32(FMUL32(v10$1, FMUL32(v90$1, FSIN32(v94$1))), v6$1), 1069066811bv32)));
    v106$2 := FMUL32($trajPrice2.0$2[96:64], FEXP32(FMUL32(FADD32(FMUL32(v10$2, FMUL32(v90$2, FSIN32(v94$2))), v6$2), 1069066811bv32)));
    v107$1 := FMUL32($trajPrice2.0$1[128:96], FEXP32(FMUL32(FADD32(FMUL32(v11$1, FMUL32(v91$1, FSIN32(v95$1))), v7$1), 1069066811bv32)));
    v107$2 := FMUL32($trajPrice2.0$2[128:96], FEXP32(FMUL32(FADD32(FMUL32(v11$2, FMUL32(v91$2, FSIN32(v95$2))), v7$2), 1069066811bv32)));
    v108 := SI32_TO_FP32($i.0);
    v109$1 := FMUL32(FMUL32(v12$1, v25$1), v108);
    v109$2 := FMUL32(FMUL32(v12$2, v25$2), v108);
    v110$1 := FMUL32(FMUL32(v13$1, v26$1), v108);
    v110$2 := FMUL32(FMUL32(v13$2, v26$2), v108);
    v111$1 := FMUL32(FMUL32(v14$1, v27$1), v108);
    v111$2 := FMUL32(FMUL32(v14$2, v27$2), v108);
    v112$1 := FMUL32(FMUL32(v15$1, v28$1), v108);
    v112$2 := FMUL32(FMUL32(v15$2, v28$2), v108);
    $nextRand.0$1, $trajPrice1.0$1, $trajPrice2.0$1, $sumPrice1.0$1, $sumPrice2.0$1, $sumDeriv1.0$1, $sumDeriv2.0$1, $i.0 := v99$1 ++ v98$1 ++ v97$1 ++ v96$1, v103$1 ++ v102$1 ++ v101$1 ++ v100$1, v107$1 ++ v106$1 ++ v105$1 ++ v104$1, FADD32($sumPrice1.0$1[128:96], v103$1) ++ FADD32($sumPrice1.0$1[96:64], v102$1) ++ FADD32($sumPrice1.0$1[64:32], v101$1) ++ FADD32($sumPrice1.0$1[32:0], v100$1), FADD32($sumPrice2.0$1[128:96], v107$1) ++ FADD32($sumPrice2.0$1[96:64], v106$1) ++ FADD32($sumPrice2.0$1[64:32], v105$1) ++ FADD32($sumPrice2.0$1[32:0], v104$1), FADD32(FMUL32(v103$1, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v103$1, v19$1)), 1060205080bv32), FSUB32(2147483648bv32, v112$1)), v24$1)), $sumDeriv1.0$1[128:96]) ++ FADD32(FMUL32(v102$1, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v102$1, v18$1)), 1060205080bv32), FSUB32(2147483648bv32, v111$1)), v23$1)), $sumDeriv1.0$1[96:64]) ++ FADD32(FMUL32(v101$1, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v101$1, v17$1)), 1060205080bv32), FSUB32(2147483648bv32, v110$1)), v22$1)), $sumDeriv1.0$1[64:32]) ++ FADD32(FMUL32(v100$1, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v100$1, v16$1)), 1060205080bv32), FSUB32(2147483648bv32, v109$1)), v21$1)), $sumDeriv1.0$1[32:0]), FADD32(FMUL32(v107$1, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v107$1, v19$1)), 1060205080bv32), FSUB32(2147483648bv32, v112$1)), v24$1)), $sumDeriv2.0$1[128:96]) ++ FADD32(FMUL32(v106$1, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v106$1, v18$1)), 1060205080bv32), FSUB32(2147483648bv32, v111$1)), v23$1)), $sumDeriv2.0$1[96:64]) ++ FADD32(FMUL32(v105$1, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v105$1, v17$1)), 1060205080bv32), FSUB32(2147483648bv32, v110$1)), v22$1)), $sumDeriv2.0$1[64:32]) ++ FADD32(FMUL32(v104$1, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v104$1, v16$1)), 1060205080bv32), FSUB32(2147483648bv32, v109$1)), v21$1)), $sumDeriv2.0$1[32:0]), BV32_ADD($i.0, 1bv32);
    $nextRand.0$2, $trajPrice1.0$2, $trajPrice2.0$2, $sumPrice1.0$2, $sumPrice2.0$2, $sumDeriv1.0$2, $sumDeriv2.0$2 := v99$2 ++ v98$2 ++ v97$2 ++ v96$2, v103$2 ++ v102$2 ++ v101$2 ++ v100$2, v107$2 ++ v106$2 ++ v105$2 ++ v104$2, FADD32($sumPrice1.0$2[128:96], v103$2) ++ FADD32($sumPrice1.0$2[96:64], v102$2) ++ FADD32($sumPrice1.0$2[64:32], v101$2) ++ FADD32($sumPrice1.0$2[32:0], v100$2), FADD32($sumPrice2.0$2[128:96], v107$2) ++ FADD32($sumPrice2.0$2[96:64], v106$2) ++ FADD32($sumPrice2.0$2[64:32], v105$2) ++ FADD32($sumPrice2.0$2[32:0], v104$2), FADD32(FMUL32(v103$2, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v103$2, v19$2)), 1060205080bv32), FSUB32(2147483648bv32, v112$2)), v24$2)), $sumDeriv1.0$2[128:96]) ++ FADD32(FMUL32(v102$2, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v102$2, v18$2)), 1060205080bv32), FSUB32(2147483648bv32, v111$2)), v23$2)), $sumDeriv1.0$2[96:64]) ++ FADD32(FMUL32(v101$2, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v101$2, v17$2)), 1060205080bv32), FSUB32(2147483648bv32, v110$2)), v22$2)), $sumDeriv1.0$2[64:32]) ++ FADD32(FMUL32(v100$2, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v100$2, v16$2)), 1060205080bv32), FSUB32(2147483648bv32, v109$2)), v21$2)), $sumDeriv1.0$2[32:0]), FADD32(FMUL32(v107$2, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v107$2, v19$2)), 1060205080bv32), FSUB32(2147483648bv32, v112$2)), v24$2)), $sumDeriv2.0$2[128:96]) ++ FADD32(FMUL32(v106$2, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v106$2, v18$2)), 1060205080bv32), FSUB32(2147483648bv32, v111$2)), v23$2)), $sumDeriv2.0$2[96:64]) ++ FADD32(FMUL32(v105$2, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v105$2, v17$2)), 1060205080bv32), FSUB32(2147483648bv32, v110$2)), v22$2)), $sumDeriv2.0$2[64:32]) ++ FADD32(FMUL32(v104$2, FDIV32(FADD32(FMUL32(FLOG32(FDIV32(v104$2, v16$2)), 1060205080bv32), FSUB32(2147483648bv32, v109$2)), v21$2)), $sumDeriv2.0$2[32:0]);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $truebb0:
    assume {:partition} v51 && v51;
    goto $casebb, $casebb0, $casebb1, $casebb2, $defaultbb;

  $defaultbb:
    assume {:partition} $i.i.0 != 0bv32 && $i.i.0 != 1bv32 && $i.i.0 != 2bv32 && $i.i.0 != 3bv32 && $i.i.0 != 0bv32 && $i.i.0 != 1bv32 && $i.i.0 != 2bv32 && $i.i.0 != 3bv32;
    $r1.i.1$1, $r2.i.1$1, $a.i.1$1, $b.i.1$1 := $r1.i.0$1, $r2.i.0$1, $a.i.0$1, $b.i.0$1;
    $r1.i.1$2, $r2.i.1$2, $a.i.1$2, $b.i.1$2 := $r1.i.0$2, $r2.i.0$2, $a.i.0$2, $b.i.0$2;
    goto $10;

  $10:
    v64$1 := $$temp.i$1[BV32_MUL($i.i.0, 4bv32)];
    v64$2 := $$temp.i$2[BV32_MUL($i.i.0, 4bv32)];
    v65$1 := $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)];
    v65$2 := $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)];
    v66$1 := $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)];
    v66$2 := $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)];
    v67$1 := $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)];
    v67$2 := $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)];
    $$temp.i$1[BV32_MUL($i.i.0, 4bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.i.1$1[32:0], BV32_SHL($a.i.1$1[32:0], 24bv32)), BV32_AND(BV32_LSHR($b.i.1$1[32:0], 13bv32), 4261361663bv32)), BV32_OR(BV32_LSHR($r1.i.1$1[32:0], 24bv32), BV32_SHL($r1.i.1$1[64:32], 8bv32))), BV32_SHL($r2.i.1$1[32:0], 15bv32));
    $$temp.i$2[BV32_MUL($i.i.0, 4bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.i.1$2[32:0], BV32_SHL($a.i.1$2[32:0], 24bv32)), BV32_AND(BV32_LSHR($b.i.1$2[32:0], 13bv32), 4261361663bv32)), BV32_OR(BV32_LSHR($r1.i.1$2[32:0], 24bv32), BV32_SHL($r1.i.1$2[64:32], 8bv32))), BV32_SHL($r2.i.1$2[32:0], 15bv32));
    $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)] := v65$1;
    $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)] := v65$2;
    $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)] := v66$1;
    $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)] := v66$2;
    $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)] := v67$1;
    $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)] := v67$2;
    v68$1 := $$temp.i$1[BV32_MUL($i.i.0, 4bv32)];
    v68$2 := $$temp.i$2[BV32_MUL($i.i.0, 4bv32)];
    v69$1 := $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)];
    v69$2 := $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)];
    v70$1 := $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)];
    v70$2 := $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)];
    v71$1 := $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)];
    v71$2 := $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)];
    $$temp.i$1[BV32_MUL($i.i.0, 4bv32)] := v68$1;
    $$temp.i$2[BV32_MUL($i.i.0, 4bv32)] := v68$2;
    $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.i.1$1[64:32], BV32_OR(BV32_SHL($a.i.1$1[64:32], 24bv32), BV32_LSHR($a.i.1$1[32:0], 8bv32))), BV32_AND(BV32_LSHR($b.i.1$1[64:32], 13bv32), 4018093949bv32)), BV32_OR(BV32_LSHR($r1.i.1$1[64:32], 24bv32), BV32_SHL($r1.i.1$1[96:64], 8bv32))), BV32_SHL($r2.i.1$1[64:32], 15bv32));
    $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.i.1$2[64:32], BV32_OR(BV32_SHL($a.i.1$2[64:32], 24bv32), BV32_LSHR($a.i.1$2[32:0], 8bv32))), BV32_AND(BV32_LSHR($b.i.1$2[64:32], 13bv32), 4018093949bv32)), BV32_OR(BV32_LSHR($r1.i.1$2[64:32], 24bv32), BV32_SHL($r1.i.1$2[96:64], 8bv32))), BV32_SHL($r2.i.1$2[64:32], 15bv32));
    $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)] := v70$1;
    $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)] := v70$2;
    $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)] := v71$1;
    $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)] := v71$2;
    v72$1 := $$temp.i$1[BV32_MUL($i.i.0, 4bv32)];
    v72$2 := $$temp.i$2[BV32_MUL($i.i.0, 4bv32)];
    v73$1 := $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)];
    v73$2 := $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)];
    v74$1 := $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)];
    v74$2 := $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)];
    v75$1 := $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)];
    v75$2 := $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)];
    $$temp.i$1[BV32_MUL($i.i.0, 4bv32)] := v72$1;
    $$temp.i$2[BV32_MUL($i.i.0, 4bv32)] := v72$2;
    $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)] := v73$1;
    $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)] := v73$2;
    $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.i.1$1[96:64], BV32_OR(BV32_SHL($a.i.1$1[96:64], 24bv32), BV32_LSHR($a.i.1$1[64:32], 8bv32))), BV32_AND(BV32_LSHR($b.i.1$1[96:64], 13bv32), 4286020477bv32)), BV32_OR(BV32_LSHR($r1.i.1$1[96:64], 24bv32), BV32_SHL($r1.i.1$1[128:96], 8bv32))), BV32_SHL($r2.i.1$1[96:64], 15bv32));
    $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.i.1$2[96:64], BV32_OR(BV32_SHL($a.i.1$2[96:64], 24bv32), BV32_LSHR($a.i.1$2[64:32], 8bv32))), BV32_AND(BV32_LSHR($b.i.1$2[96:64], 13bv32), 4286020477bv32)), BV32_OR(BV32_LSHR($r1.i.1$2[96:64], 24bv32), BV32_SHL($r1.i.1$2[128:96], 8bv32))), BV32_SHL($r2.i.1$2[96:64], 15bv32));
    $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)] := v75$1;
    $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)] := v75$2;
    v76$1 := $$temp.i$1[BV32_MUL($i.i.0, 4bv32)];
    v76$2 := $$temp.i$2[BV32_MUL($i.i.0, 4bv32)];
    v77$1 := $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)];
    v77$2 := $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)];
    v78$1 := $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)];
    v78$2 := $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)];
    v79$1 := $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)];
    v79$2 := $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)];
    $$temp.i$1[BV32_MUL($i.i.0, 4bv32)] := v76$1;
    $$temp.i$2[BV32_MUL($i.i.0, 4bv32)] := v76$2;
    $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)] := v77$1;
    $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 1bv32)] := v77$2;
    $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)] := v78$1;
    $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 2bv32)] := v78$2;
    $$temp.i$1[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.i.1$1[128:96], BV32_OR(BV32_SHL($a.i.1$1[128:96], 24bv32), BV32_LSHR($a.i.1$1[96:64], 8bv32))), BV32_AND(BV32_LSHR($b.i.1$1[128:96], 13bv32), 2146958127bv32)), BV32_LSHR($r1.i.1$1[128:96], 24bv32)), BV32_SHL($r2.i.1$1[128:96], 15bv32));
    $$temp.i$2[BV32_ADD(BV32_MUL($i.i.0, 4bv32), 3bv32)] := BV32_XOR(BV32_XOR(BV32_XOR(BV32_XOR($a.i.1$2[128:96], BV32_OR(BV32_SHL($a.i.1$2[128:96], 24bv32), BV32_LSHR($a.i.1$2[96:64], 8bv32))), BV32_AND(BV32_LSHR($b.i.1$2[128:96], 13bv32), 2146958127bv32)), BV32_LSHR($r1.i.1$2[128:96], 24bv32)), BV32_SHL($r2.i.1$2[128:96], 15bv32));
    $r1.i.0$1, $r2.i.0$1, $a.i.0$1, $b.i.0$1, $i.i.0 := $r1.i.1$1, $r2.i.1$1, $a.i.1$1, $b.i.1$1, BV32_ADD($i.i.0, 1bv32);
    $r1.i.0$2, $r2.i.0$2, $a.i.0$2, $b.i.0$2 := $r1.i.1$2, $r2.i.1$2, $a.i.1$2, $b.i.1$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $3;

  $casebb2:
    assume {:partition} $i.i.0 == 3bv32 && $i.i.0 == 3bv32;
    v60$1 := $$temp.i$1[8bv32];
    v60$2 := $$temp.i$2[8bv32];
    v61$1 := $$temp.i$1[9bv32];
    v61$2 := $$temp.i$2[9bv32];
    v62$1 := $$temp.i$1[10bv32];
    v62$2 := $$temp.i$2[10bv32];
    v63$1 := $$temp.i$1[11bv32];
    v63$2 := $$temp.i$2[11bv32];
    $r1.i.1$1, $r2.i.1$1, $a.i.1$1, $b.i.1$1 := $r2.i.0$1, v63$1 ++ v62$1 ++ v61$1 ++ v60$1, v49$1, $nextRand.0$1;
    $r1.i.1$2, $r2.i.1$2, $a.i.1$2, $b.i.1$2 := $r2.i.0$2, v63$2 ++ v62$2 ++ v61$2 ++ v60$2, v49$2, $nextRand.0$2;
    goto $10;

  $casebb1:
    assume {:partition} $i.i.0 == 2bv32 && $i.i.0 == 2bv32;
    v56$1 := $$temp.i$1[4bv32];
    v56$2 := $$temp.i$2[4bv32];
    v57$1 := $$temp.i$1[5bv32];
    v57$2 := $$temp.i$2[5bv32];
    v58$1 := $$temp.i$1[6bv32];
    v58$2 := $$temp.i$2[6bv32];
    v59$1 := $$temp.i$1[7bv32];
    v59$2 := $$temp.i$2[7bv32];
    $r1.i.1$1, $r2.i.1$1, $a.i.1$1, $b.i.1$1 := $r2.i.0$1, v59$1 ++ v58$1 ++ v57$1 ++ v56$1, v44$1, v50$1;
    $r1.i.1$2, $r2.i.1$2, $a.i.1$2, $b.i.1$2 := $r2.i.0$2, v59$2 ++ v58$2 ++ v57$2 ++ v56$2, v44$2, v50$2;
    goto $10;

  $casebb0:
    assume {:partition} $i.i.0 == 1bv32 && $i.i.0 == 1bv32;
    v52$1 := $$temp.i$1[0bv32];
    v52$2 := $$temp.i$2[0bv32];
    v53$1 := $$temp.i$1[1bv32];
    v53$2 := $$temp.i$2[1bv32];
    v54$1 := $$temp.i$1[2bv32];
    v54$2 := $$temp.i$2[2bv32];
    v55$1 := $$temp.i$1[3bv32];
    v55$2 := $$temp.i$2[3bv32];
    $r1.i.1$1, $r2.i.1$1, $a.i.1$1, $b.i.1$1 := $r2.i.0$1, v55$1 ++ v54$1 ++ v53$1 ++ v52$1, v39$1 ++ v38$1 ++ v37$1 ++ v36$1, v49$1;
    $r1.i.1$2, $r2.i.1$2, $a.i.1$2, $b.i.1$2 := $r2.i.0$2, v55$2 ++ v54$2 ++ v53$2 ++ v52$2, v39$2 ++ v38$2 ++ v37$2 ++ v36$2, v49$2;
    goto $10;

  $casebb:
    assume {:partition} $i.i.0 == 0bv32 && $i.i.0 == 0bv32;
    $r1.i.1$1, $r2.i.1$1, $a.i.1$1, $b.i.1$1 := v49$1, v50$1, $nextRand.0$1, v44$1;
    $r1.i.1$2, $r2.i.1$2, $a.i.1$2, $b.i.1$2 := v49$2, v50$2, $nextRand.0$2, v44$2;
    goto $10;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 512bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$attrib$0bv32$1: bv32;

var $$attrib$0bv32$2: bv32;

var $$attrib$1bv32$1: bv32;

var $$attrib$1bv32$2: bv32;

var $$attrib$2bv32$1: bv32;

var $$attrib$2bv32$2: bv32;

var $$attrib$3bv32$1: bv32;

var $$attrib$3bv32$2: bv32;

var $$attrib$4bv32$1: bv32;

var $$attrib$4bv32$2: bv32;

var $$attrib$5bv32$1: bv32;

var $$attrib$5bv32$2: bv32;

var $$attrib$6bv32$1: bv32;

var $$attrib$6bv32$2: bv32;

var $$attrib$7bv32$1: bv32;

var $$attrib$7bv32$2: bv32;

var $$attrib$8bv32$1: bv32;

var $$attrib$8bv32$2: bv32;

var $$attrib$9bv32$1: bv32;

var $$attrib$9bv32$2: bv32;

var $$attrib$10bv32$1: bv32;

var $$attrib$10bv32$2: bv32;

var $$attrib$11bv32$1: bv32;

var $$attrib$11bv32$2: bv32;

var $$attrib$12bv32$1: bv32;

var $$attrib$12bv32$2: bv32;

var $$attrib$13bv32$1: bv32;

var $$attrib$13bv32$2: bv32;

var $$attrib$14bv32$1: bv32;

var $$attrib$14bv32$2: bv32;

var $$attrib$15bv32$1: bv32;

var $$attrib$15bv32$2: bv32;

var $$attrib$16bv32$1: bv32;

var $$attrib$16bv32$2: bv32;

var $$attrib$17bv32$1: bv32;

var $$attrib$17bv32$2: bv32;

var $$attrib$18bv32$1: bv32;

var $$attrib$18bv32$2: bv32;

var $$attrib$19bv32$1: bv32;

var $$attrib$19bv32$2: bv32;

var $$attrib$20bv32$1: bv32;

var $$attrib$20bv32$2: bv32;

var $$attrib$21bv32$1: bv32;

var $$attrib$21bv32$2: bv32;

var $$attrib$22bv32$1: bv32;

var $$attrib$22bv32$2: bv32;

var $$attrib$23bv32$1: bv32;

var $$attrib$23bv32$2: bv32;

var $$attrib$24bv32$1: bv32;

var $$attrib$24bv32$2: bv32;

var $$attrib$25bv32$1: bv32;

var $$attrib$25bv32$2: bv32;

var $$attrib$26bv32$1: bv32;

var $$attrib$26bv32$2: bv32;

var $$attrib$27bv32$1: bv32;

var $$attrib$27bv32$2: bv32;

const _WATCHED_VALUE_$$randArray: bv32;

procedure {:inline 1} _LOG_READ_$$randArray(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$randArray;



implementation {:inline 1} _LOG_READ_$$randArray(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$randArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$randArray == _value then true else _READ_HAS_OCCURRED_$$randArray);
    return;
}



procedure _CHECK_READ_$$randArray(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "randArray"} {:array "$$randArray"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$randArray && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$randArray);
  requires {:source_name "randArray"} {:array "$$randArray"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$randArray && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$randArray: bool;

procedure {:inline 1} _LOG_WRITE_$$randArray(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$randArray, _WRITE_READ_BENIGN_FLAG_$$randArray;



implementation {:inline 1} _LOG_WRITE_$$randArray(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$randArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$randArray == _value then true else _WRITE_HAS_OCCURRED_$$randArray);
    _WRITE_READ_BENIGN_FLAG_$$randArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$randArray == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$randArray);
    return;
}



procedure _CHECK_WRITE_$$randArray(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "randArray"} {:array "$$randArray"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$randArray && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$randArray != _value);
  requires {:source_name "randArray"} {:array "$$randArray"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$randArray && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$randArray != _value);
  requires {:source_name "randArray"} {:array "$$randArray"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$randArray && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$randArray(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$randArray;



implementation {:inline 1} _LOG_ATOMIC_$$randArray(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$randArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$randArray);
    return;
}



procedure _CHECK_ATOMIC_$$randArray(_P: bool, _offset: bv32);
  requires {:source_name "randArray"} {:array "$$randArray"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$randArray && _WATCHED_OFFSET == _offset);
  requires {:source_name "randArray"} {:array "$$randArray"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$randArray && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$randArray(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$randArray;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$randArray(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$randArray := (if _P && _WRITE_HAS_OCCURRED_$$randArray && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$randArray);
    return;
}



const _WATCHED_VALUE_$$priceSamples: bv32;

procedure {:inline 1} _LOG_READ_$$priceSamples(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$priceSamples;



implementation {:inline 1} _LOG_READ_$$priceSamples(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$priceSamples := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$priceSamples == _value then true else _READ_HAS_OCCURRED_$$priceSamples);
    return;
}



procedure _CHECK_READ_$$priceSamples(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "priceSamples"} {:array "$$priceSamples"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$priceSamples && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$priceSamples);
  requires {:source_name "priceSamples"} {:array "$$priceSamples"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$priceSamples && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$priceSamples: bool;

procedure {:inline 1} _LOG_WRITE_$$priceSamples(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$priceSamples, _WRITE_READ_BENIGN_FLAG_$$priceSamples;



implementation {:inline 1} _LOG_WRITE_$$priceSamples(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$priceSamples := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$priceSamples == _value then true else _WRITE_HAS_OCCURRED_$$priceSamples);
    _WRITE_READ_BENIGN_FLAG_$$priceSamples := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$priceSamples == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$priceSamples);
    return;
}



procedure _CHECK_WRITE_$$priceSamples(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "priceSamples"} {:array "$$priceSamples"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$priceSamples && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$priceSamples != _value);
  requires {:source_name "priceSamples"} {:array "$$priceSamples"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$priceSamples && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$priceSamples != _value);
  requires {:source_name "priceSamples"} {:array "$$priceSamples"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$priceSamples && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$priceSamples(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$priceSamples;



implementation {:inline 1} _LOG_ATOMIC_$$priceSamples(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$priceSamples := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$priceSamples);
    return;
}



procedure _CHECK_ATOMIC_$$priceSamples(_P: bool, _offset: bv32);
  requires {:source_name "priceSamples"} {:array "$$priceSamples"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$priceSamples && _WATCHED_OFFSET == _offset);
  requires {:source_name "priceSamples"} {:array "$$priceSamples"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$priceSamples && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$priceSamples(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$priceSamples;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$priceSamples(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$priceSamples := (if _P && _WRITE_HAS_OCCURRED_$$priceSamples && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$priceSamples);
    return;
}



const _WATCHED_VALUE_$$pathDeriv: bv32;

procedure {:inline 1} _LOG_READ_$$pathDeriv(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$pathDeriv;



implementation {:inline 1} _LOG_READ_$$pathDeriv(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$pathDeriv := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathDeriv == _value then true else _READ_HAS_OCCURRED_$$pathDeriv);
    return;
}



procedure _CHECK_READ_$$pathDeriv(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pathDeriv"} {:array "$$pathDeriv"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$pathDeriv && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$pathDeriv);
  requires {:source_name "pathDeriv"} {:array "$$pathDeriv"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$pathDeriv && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$pathDeriv: bool;

procedure {:inline 1} _LOG_WRITE_$$pathDeriv(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$pathDeriv, _WRITE_READ_BENIGN_FLAG_$$pathDeriv;



implementation {:inline 1} _LOG_WRITE_$$pathDeriv(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$pathDeriv := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathDeriv == _value then true else _WRITE_HAS_OCCURRED_$$pathDeriv);
    _WRITE_READ_BENIGN_FLAG_$$pathDeriv := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathDeriv == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$pathDeriv);
    return;
}



procedure _CHECK_WRITE_$$pathDeriv(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pathDeriv"} {:array "$$pathDeriv"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$pathDeriv && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathDeriv != _value);
  requires {:source_name "pathDeriv"} {:array "$$pathDeriv"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$pathDeriv && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pathDeriv != _value);
  requires {:source_name "pathDeriv"} {:array "$$pathDeriv"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$pathDeriv && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$pathDeriv(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$pathDeriv;



implementation {:inline 1} _LOG_ATOMIC_$$pathDeriv(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$pathDeriv := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$pathDeriv);
    return;
}



procedure _CHECK_ATOMIC_$$pathDeriv(_P: bool, _offset: bv32);
  requires {:source_name "pathDeriv"} {:array "$$pathDeriv"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$pathDeriv && _WATCHED_OFFSET == _offset);
  requires {:source_name "pathDeriv"} {:array "$$pathDeriv"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$pathDeriv && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathDeriv(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$pathDeriv;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pathDeriv(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$pathDeriv := (if _P && _WRITE_HAS_OCCURRED_$$pathDeriv && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$pathDeriv);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
