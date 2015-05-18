type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "arrayX"} {:global} $$arrayX: [bv32]bv32;

axiom {:array_info "$$arrayX"} {:global} {:elem_width 32} {:source_name "arrayX"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$arrayX: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$arrayX: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$arrayX: bool;

var {:source_name "arrayY"} {:global} $$arrayY: [bv32]bv32;

axiom {:array_info "$$arrayY"} {:global} {:elem_width 32} {:source_name "arrayY"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$arrayY: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$arrayY: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$arrayY: bool;

axiom {:array_info "$$xj"} {:global} {:elem_width 32} {:source_name "xj"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$xj: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$xj: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$xj: bool;

axiom {:array_info "$$yj"} {:global} {:elem_width 32} {:source_name "yj"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$yj: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$yj: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$yj: bool;

axiom {:array_info "$$CDF"} {:global} {:elem_width 32} {:source_name "CDF"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$CDF: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$CDF: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$CDF: bool;

var {:source_name "ind"} {:global} $$ind: [bv32]bv32;

axiom {:array_info "$$ind"} {:global} {:elem_width 32} {:source_name "ind"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$ind: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$ind: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$ind: bool;

axiom {:array_info "$$objxy"} {:global} {:elem_width 32} {:source_name "objxy"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$objxy: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$objxy: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$objxy: bool;

var {:source_name "likelihood"} {:global} $$likelihood: [bv32]bv32;

axiom {:array_info "$$likelihood"} {:global} {:elem_width 32} {:source_name "likelihood"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$likelihood: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$likelihood: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$likelihood: bool;

axiom {:array_info "$$I"} {:global} {:elem_width 8} {:source_name "I"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$I: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$I: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$I: bool;

axiom {:array_info "$$u"} {:global} {:elem_width 32} {:source_name "u"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$u: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$u: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$u: bool;

var {:source_name "weights"} {:global} $$weights: [bv32]bv32;

axiom {:array_info "$$weights"} {:global} {:elem_width 32} {:source_name "weights"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$weights: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$weights: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$weights: bool;

var {:source_name "seed"} {:global} $$seed: [bv32]bv32;

axiom {:array_info "$$seed"} {:global} {:elem_width 32} {:source_name "seed"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$seed: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$seed: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$seed: bool;

var {:source_name "partial_sums"} {:global} $$partial_sums: [bv32]bv32;

axiom {:array_info "$$partial_sums"} {:global} {:elem_width 32} {:source_name "partial_sums"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$partial_sums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$partial_sums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$partial_sums: bool;

var {:source_name "buffer"} {:group_shared} $$buffer: [bv1][bv32]bv32;

axiom {:array_info "$$buffer"} {:group_shared} {:elem_width 32} {:source_name "buffer"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$buffer: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$buffer: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$buffer: bool;

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

function FABS32(bv32) : bv32;

function FADD32(bv32, bv32) : bv32;

function FADD64(bv64, bv64) : bv64;

function FCOS32(bv32) : bv32;

function FDIV32(bv32, bv32) : bv32;

function FDIV64(bv64, bv64) : bv64;

function FEXP32(bv32) : bv32;

function FLOG32(bv32) : bv32;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FMUL64(bv64, bv64) : bv64;

function FP32_CONV64(bv32) : bv64;

function FP32_TO_SI32(bv32) : bv32;

function FP64_CONV32(bv64) : bv32;

function FPOW32(bv32, bv32) : bv32;

function FSQRT32(bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function FSUB64(bv64, bv64) : bv64;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 24"} BV8_ZEXT32(bv8) : bv32;

procedure {:source_name "likelihood_kernel"} {:kernel} $likelihood_kernel($Nparticles: bv32, $countOnes: bv32, $max_size: bv32, $k: bv32, $IszY: bv32, $Nfr: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $Nparticles == 400000bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $countOnes == 69bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$arrayX && !_WRITE_HAS_OCCURRED_$$arrayX && !_ATOMIC_HAS_OCCURRED_$$arrayX;
  requires !_READ_HAS_OCCURRED_$$arrayY && !_WRITE_HAS_OCCURRED_$$arrayY && !_ATOMIC_HAS_OCCURRED_$$arrayY;
  requires !_READ_HAS_OCCURRED_$$xj && !_WRITE_HAS_OCCURRED_$$xj && !_ATOMIC_HAS_OCCURRED_$$xj;
  requires !_READ_HAS_OCCURRED_$$yj && !_WRITE_HAS_OCCURRED_$$yj && !_ATOMIC_HAS_OCCURRED_$$yj;
  requires !_READ_HAS_OCCURRED_$$CDF && !_WRITE_HAS_OCCURRED_$$CDF && !_ATOMIC_HAS_OCCURRED_$$CDF;
  requires !_READ_HAS_OCCURRED_$$ind && !_WRITE_HAS_OCCURRED_$$ind && !_ATOMIC_HAS_OCCURRED_$$ind;
  requires !_READ_HAS_OCCURRED_$$objxy && !_WRITE_HAS_OCCURRED_$$objxy && !_ATOMIC_HAS_OCCURRED_$$objxy;
  requires !_READ_HAS_OCCURRED_$$likelihood && !_WRITE_HAS_OCCURRED_$$likelihood && !_ATOMIC_HAS_OCCURRED_$$likelihood;
  requires !_READ_HAS_OCCURRED_$$I && !_WRITE_HAS_OCCURRED_$$I && !_ATOMIC_HAS_OCCURRED_$$I;
  requires !_READ_HAS_OCCURRED_$$u && !_WRITE_HAS_OCCURRED_$$u && !_ATOMIC_HAS_OCCURRED_$$u;
  requires !_READ_HAS_OCCURRED_$$weights && !_WRITE_HAS_OCCURRED_$$weights && !_ATOMIC_HAS_OCCURRED_$$weights;
  requires !_READ_HAS_OCCURRED_$$seed && !_WRITE_HAS_OCCURRED_$$seed && !_ATOMIC_HAS_OCCURRED_$$seed;
  requires !_READ_HAS_OCCURRED_$$partial_sums && !_WRITE_HAS_OCCURRED_$$partial_sums && !_ATOMIC_HAS_OCCURRED_$$partial_sums;
  requires !_READ_HAS_OCCURRED_$$buffer && !_WRITE_HAS_OCCURRED_$$buffer && !_ATOMIC_HAS_OCCURRED_$$buffer;
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
  modifies $$buffer, _WRITE_HAS_OCCURRED_$$arrayX, _WRITE_READ_BENIGN_FLAG_$$arrayX, _WRITE_READ_BENIGN_FLAG_$$arrayX, _WRITE_HAS_OCCURRED_$$arrayY, _WRITE_READ_BENIGN_FLAG_$$arrayY, _WRITE_READ_BENIGN_FLAG_$$arrayY, _WRITE_HAS_OCCURRED_$$weights, _WRITE_READ_BENIGN_FLAG_$$weights, _WRITE_READ_BENIGN_FLAG_$$weights, _READ_HAS_OCCURRED_$$arrayX, _READ_HAS_OCCURRED_$$seed, _WRITE_HAS_OCCURRED_$$seed, _WRITE_READ_BENIGN_FLAG_$$seed, _WRITE_READ_BENIGN_FLAG_$$seed, _READ_HAS_OCCURRED_$$arrayY, $$arrayX, $$arrayY, $$ind, $$likelihood, $$weights, $$seed, $$partial_sums, _TRACKING, _WRITE_HAS_OCCURRED_$$ind, _WRITE_READ_BENIGN_FLAG_$$ind, _WRITE_READ_BENIGN_FLAG_$$ind, _READ_HAS_OCCURRED_$$ind, _WRITE_HAS_OCCURRED_$$likelihood, _WRITE_READ_BENIGN_FLAG_$$likelihood, _WRITE_READ_BENIGN_FLAG_$$likelihood, _READ_HAS_OCCURRED_$$likelihood, _READ_HAS_OCCURRED_$$weights, _WRITE_HAS_OCCURRED_$$buffer, _WRITE_READ_BENIGN_FLAG_$$buffer, _WRITE_READ_BENIGN_FLAG_$$buffer, _TRACKING, _TRACKING, _READ_HAS_OCCURRED_$$buffer, _WRITE_HAS_OCCURRED_$$partial_sums, _WRITE_READ_BENIGN_FLAG_$$partial_sums, _WRITE_READ_BENIGN_FLAG_$$partial_sums, _TRACKING;



implementation {:source_name "likelihood_kernel"} {:kernel} $likelihood_kernel($Nparticles: bv32, $countOnes: bv32, $max_size: bv32, $k: bv32, $IszY: bv32, $Nfr: bv32)
{
  var $y.0$1: bv32;
  var $y.0$2: bv32;
  var $.01$1: bv32;
  var $.01$2: bv32;
  var $.0$1: bv32;
  var $.0$2: bv32;
  var $likelihoodSum.i.0$1: bv32;
  var $likelihoodSum.i.0$2: bv32;
  var $x.i.0$1: bv32;
  var $x.i.0$2: bv32;
  var $s.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bool;
  var v3$2: bool;
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
  var v16$1: bool;
  var v16$2: bool;
  var v17$1: bool;
  var v17$2: bool;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bool;
  var v20$2: bool;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bool;
  var v24$2: bool;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27$1: bv32;
  var v27$2: bv32;
  var v28$1: bool;
  var v28$2: bool;
  var v29$1: bool;
  var v29$2: bool;
  var v30$1: bv32;
  var v30$2: bv32;
  var v31$1: bv8;
  var v31$2: bv8;
  var v32$1: bv32;
  var v32$2: bv32;
  var v33$1: bv8;
  var v33$2: bv8;
  var v34$1: bv32;
  var v34$2: bv32;
  var v35$1: bv32;
  var v35$2: bv32;
  var v36$1: bv32;
  var v36$2: bv32;
  var v37$1: bool;
  var v37$2: bool;
  var v38$1: bv32;
  var v38$2: bv32;
  var v39: bool;
  var v40$1: bool;
  var v40$2: bool;
  var v41$1: bv32;
  var v41$2: bv32;
  var v42$1: bv32;
  var v42$2: bv32;
  var v43$1: bool;
  var v43$2: bool;
  var v44$1: bv32;
  var v44$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;
  var _HAVOC_bv8$1: bv8;
  var _HAVOC_bv8$2: bv8;


  __partitioned_block_$0_0:
    v0$1 := group_id_x$1;
    v0$2 := group_id_x$2;
    v1$1 := local_id_x$1;
    v1$2 := local_id_x$2;
    v2$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v2$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v3$1 := BV32_SLT(v2$1, $Nparticles);
    v3$2 := BV32_SLT(v2$2, $Nparticles);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p11$1 := false;
    p11$2 := false;
    p13$1 := false;
    p13$2 := false;
    p14$1 := false;
    p14$2 := false;
    p15$1 := false;
    p15$2 := false;
    p0$1 := (if v3$1 then v3$1 else p0$1);
    p0$2 := (if v3$2 then v3$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v4$1 := (if p0$1 then _HAVOC_bv32$1 else v4$1);
    v4$2 := (if p0$2 then _HAVOC_bv32$2 else v4$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$arrayX(p0$1, v2$1, v4$1, $$arrayX[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$arrayX(p0$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$arrayX(p0$2, v2$2, v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$arrayX"} true;
    $$arrayX[v2$1] := (if p0$1 then v4$1 else $$arrayX[v2$1]);
    $$arrayX[v2$2] := (if p0$2 then v4$2 else $$arrayX[v2$2]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v5$1 := (if p0$1 then _HAVOC_bv32$1 else v5$1);
    v5$2 := (if p0$2 then _HAVOC_bv32$2 else v5$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$arrayY(p0$1, v2$1, v5$1, $$arrayY[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$arrayY(p0$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$arrayY(p0$2, v2$2, v5$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$arrayY"} true;
    $$arrayY[v2$1] := (if p0$1 then v5$1 else $$arrayY[v2$1]);
    $$arrayY[v2$2] := (if p0$2 then v5$2 else $$arrayY[v2$2]);
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$weights(p0$1, v2$1, FDIV32(1065353216bv32, SI32_TO_FP32($Nparticles)), $$weights[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$weights(p0$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$weights(p0$2, v2$2, FDIV32(1065353216bv32, SI32_TO_FP32($Nparticles)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$weights"} true;
    $$weights[v2$1] := (if p0$1 then FDIV32(1065353216bv32, SI32_TO_FP32($Nparticles)) else $$weights[v2$1]);
    $$weights[v2$2] := (if p0$2 then FDIV32(1065353216bv32, SI32_TO_FP32($Nparticles)) else $$weights[v2$2]);
    call {:sourceloc} {:sourceloc_num 9} _LOG_READ_$$arrayX(p0$1, v2$1, $$arrayX[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 9} _CHECK_READ_$$arrayX(p0$2, v2$2, $$arrayX[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$arrayX"} true;
    v6$1 := (if p0$1 then $$arrayX[v2$1] else v6$1);
    v6$2 := (if p0$2 then $$arrayX[v2$2] else v6$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$seed(p0$1, v2$1, $$seed[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$seed(p0$2, v2$2, $$seed[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$seed"} true;
    v7$1 := (if p0$1 then $$seed[v2$1] else v7$1);
    v7$2 := (if p0$2 then $$seed[v2$2] else v7$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$seed(p0$1, v2$1, BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v7$1), 12345bv32), 2147483647bv32), $$seed[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$seed(p0$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$seed(p0$2, v2$2, BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v7$2), 12345bv32), 2147483647bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$seed"} true;
    $$seed[v2$1] := (if p0$1 then BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v7$1), 12345bv32), 2147483647bv32) else $$seed[v2$1]);
    $$seed[v2$2] := (if p0$2 then BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v7$2), 12345bv32), 2147483647bv32) else $$seed[v2$2]);
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$seed(p0$1, v2$1, $$seed[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$seed(p0$2, v2$2, $$seed[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$seed"} true;
    v8$1 := (if p0$1 then $$seed[v2$1] else v8$1);
    v8$2 := (if p0$2 then $$seed[v2$2] else v8$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$seed(p0$1, v2$1, $$seed[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$seed(p0$2, v2$2, $$seed[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$seed"} true;
    v9$1 := (if p0$1 then $$seed[v2$1] else v9$1);
    v9$2 := (if p0$2 then $$seed[v2$2] else v9$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$seed(p0$1, v2$1, BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v9$1), 12345bv32), 2147483647bv32), $$seed[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$seed(p0$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$seed(p0$2, v2$2, BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v9$2), 12345bv32), 2147483647bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$seed"} true;
    $$seed[v2$1] := (if p0$1 then BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v9$1), 12345bv32), 2147483647bv32) else $$seed[v2$1]);
    $$seed[v2$2] := (if p0$2 then BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v9$2), 12345bv32), 2147483647bv32) else $$seed[v2$2]);
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$seed(p0$1, v2$1, $$seed[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$seed(p0$2, v2$2, $$seed[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$seed"} true;
    v10$1 := (if p0$1 then $$seed[v2$1] else v10$1);
    v10$2 := (if p0$2 then $$seed[v2$2] else v10$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$arrayX(p0$1, v2$1, FP64_CONV32(FADD64(FADD64(FP32_CONV64(v6$1), 4607182418800017408bv64), FMUL64(4617315517961601024bv64, FP32_CONV64(FMUL32(FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FABS32(FDIV32(SI32_TO_FP32(v8$1), SI32_TO_FP32(2147483647bv32)))), 1060205080bv32))), FCOS32(FMUL32(FMUL32(1073741824bv32, 1078530011bv32), FABS32(FDIV32(SI32_TO_FP32(v10$1), SI32_TO_FP32(2147483647bv32)))))))))), $$arrayX[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$arrayX(p0$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$arrayX(p0$2, v2$2, FP64_CONV32(FADD64(FADD64(FP32_CONV64(v6$2), 4607182418800017408bv64), FMUL64(4617315517961601024bv64, FP32_CONV64(FMUL32(FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FABS32(FDIV32(SI32_TO_FP32(v8$2), SI32_TO_FP32(2147483647bv32)))), 1060205080bv32))), FCOS32(FMUL32(FMUL32(1073741824bv32, 1078530011bv32), FABS32(FDIV32(SI32_TO_FP32(v10$2), SI32_TO_FP32(2147483647bv32)))))))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$arrayX"} true;
    $$arrayX[v2$1] := (if p0$1 then FP64_CONV32(FADD64(FADD64(FP32_CONV64(v6$1), 4607182418800017408bv64), FMUL64(4617315517961601024bv64, FP32_CONV64(FMUL32(FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FABS32(FDIV32(SI32_TO_FP32(v8$1), SI32_TO_FP32(2147483647bv32)))), 1060205080bv32))), FCOS32(FMUL32(FMUL32(1073741824bv32, 1078530011bv32), FABS32(FDIV32(SI32_TO_FP32(v10$1), SI32_TO_FP32(2147483647bv32)))))))))) else $$arrayX[v2$1]);
    $$arrayX[v2$2] := (if p0$2 then FP64_CONV32(FADD64(FADD64(FP32_CONV64(v6$2), 4607182418800017408bv64), FMUL64(4617315517961601024bv64, FP32_CONV64(FMUL32(FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FABS32(FDIV32(SI32_TO_FP32(v8$2), SI32_TO_FP32(2147483647bv32)))), 1060205080bv32))), FCOS32(FMUL32(FMUL32(1073741824bv32, 1078530011bv32), FABS32(FDIV32(SI32_TO_FP32(v10$2), SI32_TO_FP32(2147483647bv32)))))))))) else $$arrayX[v2$2]);
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$arrayY(p0$1, v2$1, $$arrayY[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$arrayY(p0$2, v2$2, $$arrayY[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$arrayY"} true;
    v11$1 := (if p0$1 then $$arrayY[v2$1] else v11$1);
    v11$2 := (if p0$2 then $$arrayY[v2$2] else v11$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_READ_$$seed(p0$1, v2$1, $$seed[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 18} _CHECK_READ_$$seed(p0$2, v2$2, $$seed[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$seed"} true;
    v12$1 := (if p0$1 then $$seed[v2$1] else v12$1);
    v12$2 := (if p0$2 then $$seed[v2$2] else v12$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$seed(p0$1, v2$1, BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v12$1), 12345bv32), 2147483647bv32), $$seed[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$seed(p0$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$seed(p0$2, v2$2, BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v12$2), 12345bv32), 2147483647bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$seed"} true;
    $$seed[v2$1] := (if p0$1 then BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v12$1), 12345bv32), 2147483647bv32) else $$seed[v2$1]);
    $$seed[v2$2] := (if p0$2 then BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v12$2), 12345bv32), 2147483647bv32) else $$seed[v2$2]);
    call {:sourceloc} {:sourceloc_num 20} _LOG_READ_$$seed(p0$1, v2$1, $$seed[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 20} _CHECK_READ_$$seed(p0$2, v2$2, $$seed[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$seed"} true;
    v13$1 := (if p0$1 then $$seed[v2$1] else v13$1);
    v13$2 := (if p0$2 then $$seed[v2$2] else v13$2);
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$seed(p0$1, v2$1, $$seed[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$seed(p0$2, v2$2, $$seed[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$seed"} true;
    v14$1 := (if p0$1 then $$seed[v2$1] else v14$1);
    v14$2 := (if p0$2 then $$seed[v2$2] else v14$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$seed(p0$1, v2$1, BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v14$1), 12345bv32), 2147483647bv32), $$seed[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$seed(p0$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$seed(p0$2, v2$2, BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v14$2), 12345bv32), 2147483647bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$seed"} true;
    $$seed[v2$1] := (if p0$1 then BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v14$1), 12345bv32), 2147483647bv32) else $$seed[v2$1]);
    $$seed[v2$2] := (if p0$2 then BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v14$2), 12345bv32), 2147483647bv32) else $$seed[v2$2]);
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$seed(p0$1, v2$1, $$seed[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$seed(p0$2, v2$2, $$seed[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$seed"} true;
    v15$1 := (if p0$1 then $$seed[v2$1] else v15$1);
    v15$2 := (if p0$2 then $$seed[v2$2] else v15$2);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$arrayY(p0$1, v2$1, FP64_CONV32(FADD64(FSUB64(FP32_CONV64(v11$1), 4611686018427387904bv64), FMUL64(4611686018427387904bv64, FP32_CONV64(FMUL32(FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FABS32(FDIV32(SI32_TO_FP32(v13$1), SI32_TO_FP32(2147483647bv32)))), 1060205080bv32))), FCOS32(FMUL32(FMUL32(1073741824bv32, 1078530011bv32), FABS32(FDIV32(SI32_TO_FP32(v15$1), SI32_TO_FP32(2147483647bv32)))))))))), $$arrayY[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$arrayY(p0$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$arrayY(p0$2, v2$2, FP64_CONV32(FADD64(FSUB64(FP32_CONV64(v11$2), 4611686018427387904bv64), FMUL64(4611686018427387904bv64, FP32_CONV64(FMUL32(FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FABS32(FDIV32(SI32_TO_FP32(v13$2), SI32_TO_FP32(2147483647bv32)))), 1060205080bv32))), FCOS32(FMUL32(FMUL32(1073741824bv32, 1078530011bv32), FABS32(FDIV32(SI32_TO_FP32(v15$2), SI32_TO_FP32(2147483647bv32)))))))))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$arrayY"} true;
    $$arrayY[v2$1] := (if p0$1 then FP64_CONV32(FADD64(FSUB64(FP32_CONV64(v11$1), 4611686018427387904bv64), FMUL64(4611686018427387904bv64, FP32_CONV64(FMUL32(FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FABS32(FDIV32(SI32_TO_FP32(v13$1), SI32_TO_FP32(2147483647bv32)))), 1060205080bv32))), FCOS32(FMUL32(FMUL32(1073741824bv32, 1078530011bv32), FABS32(FDIV32(SI32_TO_FP32(v15$1), SI32_TO_FP32(2147483647bv32)))))))))) else $$arrayY[v2$1]);
    $$arrayY[v2$2] := (if p0$2 then FP64_CONV32(FADD64(FSUB64(FP32_CONV64(v11$2), 4611686018427387904bv64), FMUL64(4611686018427387904bv64, FP32_CONV64(FMUL32(FSQRT32(FMUL32(3221225472bv32, FMUL32(FLOG32(FABS32(FDIV32(SI32_TO_FP32(v13$2), SI32_TO_FP32(2147483647bv32)))), 1060205080bv32))), FCOS32(FMUL32(FMUL32(1073741824bv32, 1078530011bv32), FABS32(FDIV32(SI32_TO_FP32(v15$2), SI32_TO_FP32(2147483647bv32)))))))))) else $$arrayY[v2$2]);
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 26} $bugle_barrier_duplicated_0(0bv1, 1bv1);
    v16$1 := BV32_SLT(v2$1, $Nparticles);
    v16$2 := BV32_SLT(v2$2, $Nparticles);
    p2$1 := (if v16$1 then v16$1 else p2$1);
    p2$2 := (if v16$2 then v16$2 else p2$2);
    $y.0$1 := (if p2$1 then 0bv32 else $y.0$1);
    $y.0$2 := (if p2$2 then 0bv32 else $y.0$2);
    p3$1 := (if p2$1 then true else p3$1);
    p3$2 := (if p2$2 then true else p3$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $4;

  $4:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "accessBreak"} _b36 ==> _READ_HAS_OCCURRED_$$ind ==> local_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, $countOnes), BV32_MUL(group_id_x$1, group_size_x));
    assert {:tag "accessBreak"} _b35 ==> _READ_HAS_OCCURRED_$$ind ==> group_id_x$1 == BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, $countOnes), group_size_x), BV32_DIV(local_id_x$1, group_size_x));
    assert {:tag "accessUpperBoundBlock"} _b34 ==> _WRITE_HAS_OCCURRED_$$ind ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, BV32_ADD(group_id_x$1, 1bv32)), local_id_x$1), $countOnes));
    assert {:tag "accessLowerBoundBlock"} _b33 ==> _WRITE_HAS_OCCURRED_$$ind ==> BV32_SLE(BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), $countOnes), _WATCHED_OFFSET);
    assert {:tag "accessUpperBoundBlock"} _b32 ==> _WRITE_HAS_OCCURRED_$$ind ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, BV32_ADD(group_id_x$1, 1bv32)), local_id_x$1), $countOnes));
    assert {:tag "accessLowerBoundBlock"} _b31 ==> _WRITE_HAS_OCCURRED_$$ind ==> BV32_SLE(BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), $countOnes), _WATCHED_OFFSET);
    assert {:tag "accessUpperBoundBlock"} _b30 ==> _READ_HAS_OCCURRED_$$ind ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, BV32_ADD(group_id_x$1, 1bv32)), local_id_x$1), $countOnes));
    assert {:tag "accessLowerBoundBlock"} _b29 ==> _READ_HAS_OCCURRED_$$ind ==> BV32_SLE(BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), $countOnes), _WATCHED_OFFSET);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b28 ==> _READ_HAS_OCCURRED_$$arrayY ==> _WATCHED_OFFSET == BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b27 ==> _READ_HAS_OCCURRED_$$arrayX ==> _WATCHED_OFFSET == BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$buffer ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$buffer ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$buffer ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p3$1 ==> _b16 ==> p3$1 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), $Nparticles);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p3$2 ==> _b16 ==> p3$2 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), $Nparticles);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b15 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), $Nparticles) && BV32_SLT($y.0$1, $countOnes) ==> p3$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b15 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), $Nparticles) && BV32_SLT($y.0$2, $countOnes) ==> p3$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b14 ==> !BV32_SLT(v2$1, $Nparticles) ==> !_READ_HAS_OCCURRED_$$arrayX;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b13 ==> !BV32_SLT(v2$1, $Nparticles) ==> !_READ_HAS_OCCURRED_$$arrayY;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b12 ==> !BV32_SLT(v2$1, $Nparticles) ==> !_READ_HAS_OCCURRED_$$ind;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b11 ==> !BV32_SLT(v2$1, $Nparticles) ==> !_READ_HAS_OCCURRED_$$objxy;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b10 ==> !BV32_SLT(v2$1, $Nparticles) ==> !_WRITE_HAS_OCCURRED_$$ind;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b9 ==> !BV32_SLT(v2$1, $Nparticles) ==> !p3$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b9 ==> !BV32_SLT(v2$2, $Nparticles) ==> !p3$2;
    assert {:tag "loopBound"} {:thread 1} p3$1 ==> _b8 ==> BV32_UGE($y.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p3$2 ==> _b8 ==> BV32_UGE($y.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p3$1 ==> _b7 ==> BV32_ULE($y.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p3$2 ==> _b7 ==> BV32_ULE($y.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p3$1 ==> _b6 ==> BV32_SGE($y.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p3$2 ==> _b6 ==> BV32_SGE($y.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p3$1 ==> _b5 ==> BV32_SLE($y.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p3$2 ==> _b5 ==> BV32_SLE($y.0$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p3$1 ==> _b4 ==> BV32_SLE(0bv32, $y.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p3$2 ==> _b4 ==> BV32_SLE(0bv32, $y.0$2);
    assert {:block_sourceloc} {:sourceloc_num 28} p3$1 ==> true;
    v17$1 := (if p3$1 then BV32_SLT($y.0$1, $countOnes) else v17$1);
    v17$2 := (if p3$2 then BV32_SLT($y.0$2, $countOnes) else v17$2);
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
    p4$1 := (if p3$1 && v17$1 then v17$1 else p4$1);
    p4$2 := (if p3$2 && v17$2 then v17$2 else p4$2);
    p3$1 := (if p3$1 && !v17$1 then v17$1 else p3$1);
    p3$2 := (if p3$2 && !v17$2 then v17$2 else p3$2);
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$arrayX(p4$1, v2$1, $$arrayX[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$arrayX(p4$2, v2$2, $$arrayX[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$arrayX"} true;
    v18$1 := (if p4$1 then $$arrayX[v2$1] else v18$1);
    v18$2 := (if p4$2 then $$arrayX[v2$2] else v18$2);
    v19$1 := (if p4$1 then FP32_TO_SI32(v18$1) else v19$1);
    v19$2 := (if p4$2 then FP32_TO_SI32(v18$2) else v19$2);
    v20$1 := (if p4$1 then FLT32(FSUB32(v18$1, SI32_TO_FP32(v19$1)), 1056964608bv32) else v20$1);
    v20$2 := (if p4$2 then FLT32(FSUB32(v18$2, SI32_TO_FP32(v19$2)), 1056964608bv32) else v20$2);
    p6$1 := (if p4$1 && v20$1 then v20$1 else p6$1);
    p6$2 := (if p4$2 && v20$2 then v20$2 else p6$2);
    p5$1 := (if p4$1 && !v20$1 then !v20$1 else p5$1);
    p5$2 := (if p4$2 && !v20$2 then !v20$2 else p5$2);
    $.01$1 := (if p5$1 then SI32_TO_FP32(v19$1) else $.01$1);
    $.01$2 := (if p5$2 then SI32_TO_FP32(v19$2) else $.01$2);
    $.01$1 := (if p6$1 then SI32_TO_FP32(v19$1) else $.01$1);
    $.01$2 := (if p6$2 then SI32_TO_FP32(v19$2) else $.01$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v21$1 := (if p4$1 then _HAVOC_bv32$1 else v21$1);
    v21$2 := (if p4$2 then _HAVOC_bv32$2 else v21$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_READ_$$arrayY(p4$1, v2$1, $$arrayY[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 35} _CHECK_READ_$$arrayY(p4$2, v2$2, $$arrayY[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$arrayY"} true;
    v22$1 := (if p4$1 then $$arrayY[v2$1] else v22$1);
    v22$2 := (if p4$2 then $$arrayY[v2$2] else v22$2);
    v23$1 := (if p4$1 then FP32_TO_SI32(v22$1) else v23$1);
    v23$2 := (if p4$2 then FP32_TO_SI32(v22$2) else v23$2);
    v24$1 := (if p4$1 then FLT32(FSUB32(v22$1, SI32_TO_FP32(v23$1)), 1056964608bv32) else v24$1);
    v24$2 := (if p4$2 then FLT32(FSUB32(v22$2, SI32_TO_FP32(v23$2)), 1056964608bv32) else v24$2);
    p8$1 := (if p4$1 && v24$1 then v24$1 else p8$1);
    p8$2 := (if p4$2 && v24$2 then v24$2 else p8$2);
    p7$1 := (if p4$1 && !v24$1 then !v24$1 else p7$1);
    p7$2 := (if p4$2 && !v24$2 then !v24$2 else p7$2);
    $.0$1 := (if p7$1 then SI32_TO_FP32(v23$1) else $.0$1);
    $.0$2 := (if p7$2 then SI32_TO_FP32(v23$2) else $.0$2);
    $.0$1 := (if p8$1 then SI32_TO_FP32(v23$1) else $.0$1);
    $.0$2 := (if p8$2 then SI32_TO_FP32(v23$2) else $.0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v25$1 := (if p4$1 then _HAVOC_bv32$1 else v25$1);
    v25$2 := (if p4$2 then _HAVOC_bv32$2 else v25$2);
    v26$1 := (if p4$1 then BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(FP32_TO_SI32(FADD32($.01$1, SI32_TO_FP32(v21$1))), $IszY), $Nfr), BV32_MUL(FP32_TO_SI32(FADD32($.0$1, SI32_TO_FP32(v25$1))), $Nfr)), $k) else v26$1);
    v26$2 := (if p4$2 then BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(FP32_TO_SI32(FADD32($.01$2, SI32_TO_FP32(v21$2))), $IszY), $Nfr), BV32_MUL(FP32_TO_SI32(FADD32($.0$2, SI32_TO_FP32(v25$2))), $Nfr)), $k) else v26$2);
    call {:sourceloc} {:sourceloc_num 40} _LOG_WRITE_$$ind(p4$1, BV32_ADD(BV32_MUL(v2$1, $countOnes), $y.0$1), (if BV32_SGT(v26$1, 0bv32) then v26$1 else BV32_SUB(0bv32, v26$1)), $$ind[BV32_ADD(BV32_MUL(v2$1, $countOnes), $y.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$ind(p4$2, BV32_ADD(BV32_MUL(v2$2, $countOnes), $y.0$2));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 40} _CHECK_WRITE_$$ind(p4$2, BV32_ADD(BV32_MUL(v2$2, $countOnes), $y.0$2), (if BV32_SGT(v26$2, 0bv32) then v26$2 else BV32_SUB(0bv32, v26$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$ind"} true;
    $$ind[BV32_ADD(BV32_MUL(v2$1, $countOnes), $y.0$1)] := (if p4$1 then (if BV32_SGT(v26$1, 0bv32) then v26$1 else BV32_SUB(0bv32, v26$1)) else $$ind[BV32_ADD(BV32_MUL(v2$1, $countOnes), $y.0$1)]);
    $$ind[BV32_ADD(BV32_MUL(v2$2, $countOnes), $y.0$2)] := (if p4$2 then (if BV32_SGT(v26$2, 0bv32) then v26$2 else BV32_SUB(0bv32, v26$2)) else $$ind[BV32_ADD(BV32_MUL(v2$2, $countOnes), $y.0$2)]);
    call {:sourceloc} {:sourceloc_num 41} _LOG_READ_$$ind(p4$1, BV32_ADD(BV32_MUL(v2$1, $countOnes), $y.0$1), $$ind[BV32_ADD(BV32_MUL(v2$1, $countOnes), $y.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 41} _CHECK_READ_$$ind(p4$2, BV32_ADD(BV32_MUL(v2$2, $countOnes), $y.0$2), $$ind[BV32_ADD(BV32_MUL(v2$2, $countOnes), $y.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$ind"} true;
    v27$1 := (if p4$1 then $$ind[BV32_ADD(BV32_MUL(v2$1, $countOnes), $y.0$1)] else v27$1);
    v27$2 := (if p4$2 then $$ind[BV32_ADD(BV32_MUL(v2$2, $countOnes), $y.0$2)] else v27$2);
    v28$1 := (if p4$1 then BV32_SGE(v27$1, $max_size) else v28$1);
    v28$2 := (if p4$2 then BV32_SGE(v27$2, $max_size) else v28$2);
    p10$1 := (if p4$1 && v28$1 then v28$1 else p10$1);
    p10$2 := (if p4$2 && v28$2 then v28$2 else p10$2);
    call {:sourceloc} {:sourceloc_num 43} _LOG_WRITE_$$ind(p10$1, BV32_ADD(BV32_MUL(v2$1, $countOnes), $y.0$1), 0bv32, $$ind[BV32_ADD(BV32_MUL(v2$1, $countOnes), $y.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$ind(p10$2, BV32_ADD(BV32_MUL(v2$2, $countOnes), $y.0$2));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 43} _CHECK_WRITE_$$ind(p10$2, BV32_ADD(BV32_MUL(v2$2, $countOnes), $y.0$2), 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$ind"} true;
    $$ind[BV32_ADD(BV32_MUL(v2$1, $countOnes), $y.0$1)] := (if p10$1 then 0bv32 else $$ind[BV32_ADD(BV32_MUL(v2$1, $countOnes), $y.0$1)]);
    $$ind[BV32_ADD(BV32_MUL(v2$2, $countOnes), $y.0$2)] := (if p10$2 then 0bv32 else $$ind[BV32_ADD(BV32_MUL(v2$2, $countOnes), $y.0$2)]);
    $y.0$1 := (if p4$1 then BV32_ADD($y.0$1, 1bv32) else $y.0$1);
    $y.0$2 := (if p4$2 then BV32_ADD($y.0$2, 1bv32) else $y.0$2);
    p3$1 := (if p4$1 then true else p3$1);
    p3$2 := (if p4$2 then true else p3$2);
    goto $4.backedge, $4.tail;

  $4.tail:
    assume !p3$1 && !p3$2;
    $likelihoodSum.i.0$1, $x.i.0$1 := (if p2$1 then 0bv32 else $likelihoodSum.i.0$1), (if p2$1 then 0bv32 else $x.i.0$1);
    $likelihoodSum.i.0$2, $x.i.0$2 := (if p2$2 then 0bv32 else $likelihoodSum.i.0$2), (if p2$2 then 0bv32 else $x.i.0$2);
    p11$1 := (if p2$1 then true else p11$1);
    p11$2 := (if p2$2 then true else p11$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $14;

  $14:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessUpperBoundBlock"} _b40 ==> _READ_HAS_OCCURRED_$$ind ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, BV32_ADD(group_id_x$1, 1bv32)), local_id_x$1), $countOnes));
    assert {:tag "accessLowerBoundBlock"} _b39 ==> _READ_HAS_OCCURRED_$$ind ==> BV32_SLE(BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), $countOnes), _WATCHED_OFFSET);
    assert {:tag "accessUpperBoundBlock"} _b38 ==> _READ_HAS_OCCURRED_$$ind ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, BV32_ADD(group_id_x$1, 1bv32)), local_id_x$1), $countOnes));
    assert {:tag "accessLowerBoundBlock"} _b37 ==> _READ_HAS_OCCURRED_$$ind ==> BV32_SLE(BV32_MUL(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), $countOnes), _WATCHED_OFFSET);
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$buffer ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$buffer ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$buffer ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p11$1 ==> _b26 ==> p11$1 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), $Nparticles);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p11$2 ==> _b26 ==> p11$2 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), $Nparticles);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b25 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), $Nparticles) && BV32_SLT($x.i.0$1, $countOnes) ==> p11$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b25 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), $Nparticles) && BV32_SLT($x.i.0$2, $countOnes) ==> p11$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b24 ==> !BV32_SLT(v2$1, $Nparticles) ==> !_READ_HAS_OCCURRED_$$I;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b23 ==> !BV32_SLT(v2$1, $Nparticles) ==> !_READ_HAS_OCCURRED_$$ind;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b22 ==> !BV32_SLT(v2$1, $Nparticles) ==> !p11$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b22 ==> !BV32_SLT(v2$2, $Nparticles) ==> !p11$2;
    assert {:tag "loopBound"} {:thread 1} p11$1 ==> _b21 ==> BV32_UGE($x.i.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p11$2 ==> _b21 ==> BV32_UGE($x.i.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p11$1 ==> _b20 ==> BV32_ULE($x.i.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p11$2 ==> _b20 ==> BV32_ULE($x.i.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p11$1 ==> _b19 ==> BV32_SGE($x.i.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p11$2 ==> _b19 ==> BV32_SGE($x.i.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p11$1 ==> _b18 ==> BV32_SLE($x.i.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p11$2 ==> _b18 ==> BV32_SLE($x.i.0$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p11$1 ==> _b17 ==> BV32_SLE(0bv32, $x.i.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p11$2 ==> _b17 ==> BV32_SLE(0bv32, $x.i.0$2);
    assert {:block_sourceloc} {:sourceloc_num 47} p11$1 ==> true;
    v29$1 := (if p11$1 then BV32_SLT($x.i.0$1, $countOnes) else v29$1);
    v29$2 := (if p11$2 then BV32_SLT($x.i.0$2, $countOnes) else v29$2);
    p12$1 := false;
    p12$2 := false;
    p12$1 := (if p11$1 && v29$1 then v29$1 else p12$1);
    p12$2 := (if p11$2 && v29$2 then v29$2 else p12$2);
    p11$1 := (if p11$1 && !v29$1 then v29$1 else p11$1);
    p11$2 := (if p11$2 && !v29$2 then v29$2 else p11$2);
    call {:sourceloc} {:sourceloc_num 49} _LOG_READ_$$ind(p12$1, BV32_ADD(BV32_MUL(v2$1, $countOnes), $x.i.0$1), $$ind[BV32_ADD(BV32_MUL(v2$1, $countOnes), $x.i.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 49} _CHECK_READ_$$ind(p12$2, BV32_ADD(BV32_MUL(v2$2, $countOnes), $x.i.0$2), $$ind[BV32_ADD(BV32_MUL(v2$2, $countOnes), $x.i.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$ind"} true;
    v30$1 := (if p12$1 then $$ind[BV32_ADD(BV32_MUL(v2$1, $countOnes), $x.i.0$1)] else v30$1);
    v30$2 := (if p12$2 then $$ind[BV32_ADD(BV32_MUL(v2$2, $countOnes), $x.i.0$2)] else v30$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v31$1 := (if p12$1 then _HAVOC_bv8$1 else v31$1);
    v31$2 := (if p12$2 then _HAVOC_bv8$2 else v31$2);
    call {:sourceloc} {:sourceloc_num 51} _LOG_READ_$$ind(p12$1, BV32_ADD(BV32_MUL(v2$1, $countOnes), $x.i.0$1), $$ind[BV32_ADD(BV32_MUL(v2$1, $countOnes), $x.i.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 51} _CHECK_READ_$$ind(p12$2, BV32_ADD(BV32_MUL(v2$2, $countOnes), $x.i.0$2), $$ind[BV32_ADD(BV32_MUL(v2$2, $countOnes), $x.i.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$ind"} true;
    v32$1 := (if p12$1 then $$ind[BV32_ADD(BV32_MUL(v2$1, $countOnes), $x.i.0$1)] else v32$1);
    v32$2 := (if p12$2 then $$ind[BV32_ADD(BV32_MUL(v2$2, $countOnes), $x.i.0$2)] else v32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v33$1 := (if p12$1 then _HAVOC_bv8$1 else v33$1);
    v33$2 := (if p12$2 then _HAVOC_bv8$2 else v33$2);
    $likelihoodSum.i.0$1, $x.i.0$1 := (if p12$1 then FP64_CONV32(FADD64(FP32_CONV64($likelihoodSum.i.0$1), FDIV64(FP32_CONV64(FSUB32(FPOW32(SI32_TO_FP32(BV32_SUB(BV8_ZEXT32(v31$1), 100bv32)), 1073741824bv32), FPOW32(SI32_TO_FP32(BV32_SUB(BV8_ZEXT32(v33$1), 228bv32)), 1073741824bv32))), 4632233691727265792bv64))) else $likelihoodSum.i.0$1), (if p12$1 then BV32_ADD($x.i.0$1, 1bv32) else $x.i.0$1);
    $likelihoodSum.i.0$2, $x.i.0$2 := (if p12$2 then FP64_CONV32(FADD64(FP32_CONV64($likelihoodSum.i.0$2), FDIV64(FP32_CONV64(FSUB32(FPOW32(SI32_TO_FP32(BV32_SUB(BV8_ZEXT32(v31$2), 100bv32)), 1073741824bv32), FPOW32(SI32_TO_FP32(BV32_SUB(BV8_ZEXT32(v33$2), 228bv32)), 1073741824bv32))), 4632233691727265792bv64))) else $likelihoodSum.i.0$2), (if p12$2 then BV32_ADD($x.i.0$2, 1bv32) else $x.i.0$2);
    p11$1 := (if p12$1 then true else p11$1);
    p11$2 := (if p12$2 then true else p11$2);
    goto $14.backedge, __partitioned_block_$14.tail_0;

  __partitioned_block_$14.tail_0:
    assume !p11$1 && !p11$2;
    call {:sourceloc} {:sourceloc_num 54} _LOG_WRITE_$$likelihood(p2$1, v2$1, $likelihoodSum.i.0$1, $$likelihood[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$likelihood(p2$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 54} _CHECK_WRITE_$$likelihood(p2$2, v2$2, $likelihoodSum.i.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$likelihood"} true;
    $$likelihood[v2$1] := (if p2$1 then $likelihoodSum.i.0$1 else $$likelihood[v2$1]);
    $$likelihood[v2$2] := (if p2$2 then $likelihoodSum.i.0$2 else $$likelihood[v2$2]);
    call {:sourceloc} {:sourceloc_num 55} _LOG_READ_$$likelihood(p2$1, v2$1, $$likelihood[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 55} _CHECK_READ_$$likelihood(p2$2, v2$2, $$likelihood[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$likelihood"} true;
    v34$1 := (if p2$1 then $$likelihood[v2$1] else v34$1);
    v34$2 := (if p2$2 then $$likelihood[v2$2] else v34$2);
    call {:sourceloc} {:sourceloc_num 56} _LOG_WRITE_$$likelihood(p2$1, v2$1, FSUB32(FDIV32(v34$1, SI32_TO_FP32($countOnes)), 1133903872bv32), $$likelihood[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$likelihood(p2$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 56} _CHECK_WRITE_$$likelihood(p2$2, v2$2, FSUB32(FDIV32(v34$2, SI32_TO_FP32($countOnes)), 1133903872bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$likelihood"} true;
    $$likelihood[v2$1] := (if p2$1 then FSUB32(FDIV32(v34$1, SI32_TO_FP32($countOnes)), 1133903872bv32) else $$likelihood[v2$1]);
    $$likelihood[v2$2] := (if p2$2 then FSUB32(FDIV32(v34$2, SI32_TO_FP32($countOnes)), 1133903872bv32) else $$likelihood[v2$2]);
    call {:sourceloc} {:sourceloc_num 57} _LOG_READ_$$weights(p2$1, v2$1, $$weights[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 57} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 57} _CHECK_READ_$$weights(p2$2, v2$2, $$weights[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$weights"} true;
    v35$1 := (if p2$1 then $$weights[v2$1] else v35$1);
    v35$2 := (if p2$2 then $$weights[v2$2] else v35$2);
    call {:sourceloc} {:sourceloc_num 58} _LOG_READ_$$likelihood(p2$1, v2$1, $$likelihood[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 58} _CHECK_READ_$$likelihood(p2$2, v2$2, $$likelihood[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$likelihood"} true;
    v36$1 := (if p2$1 then $$likelihood[v2$1] else v36$1);
    v36$2 := (if p2$2 then $$likelihood[v2$2] else v36$2);
    call {:sourceloc} {:sourceloc_num 59} _LOG_WRITE_$$weights(p2$1, v2$1, FMUL32(v35$1, FEXP32(FMUL32(v36$1, 1069066811bv32))), $$weights[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$weights(p2$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 59} _CHECK_WRITE_$$weights(p2$2, v2$2, FMUL32(v35$2, FEXP32(FMUL32(v36$2, 1069066811bv32))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$weights"} true;
    $$weights[v2$1] := (if p2$1 then FMUL32(v35$1, FEXP32(FMUL32(v36$1, 1069066811bv32))) else $$weights[v2$1]);
    $$weights[v2$2] := (if p2$2 then FMUL32(v35$2, FEXP32(FMUL32(v36$2, 1069066811bv32))) else $$weights[v2$2]);
    call {:sourceloc} {:sourceloc_num 61} _LOG_WRITE_$$buffer(true, v1$1, 0bv32, $$buffer[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$buffer(true, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 61} _CHECK_WRITE_$$buffer(true, v1$2, 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$buffer"} true;
    $$buffer[1bv1][v1$1] := 0bv32;
    $$buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := 0bv32;
    goto __partitioned_block_$14.tail_1;

  __partitioned_block_$14.tail_1:
    call {:sourceloc_num 62} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    v37$1 := BV32_SLT(v2$1, $Nparticles);
    v37$2 := BV32_SLT(v2$2, $Nparticles);
    p14$1 := (if v37$1 then v37$1 else p14$1);
    p14$2 := (if v37$2 then v37$2 else p14$2);
    call {:sourceloc} {:sourceloc_num 64} _LOG_READ_$$weights(p14$1, v2$1, $$weights[v2$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 64} _CHECK_READ_$$weights(p14$2, v2$2, $$weights[v2$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$weights"} true;
    v38$1 := (if p14$1 then $$weights[v2$1] else v38$1);
    v38$2 := (if p14$2 then $$weights[v2$2] else v38$2);
    call {:sourceloc} {:sourceloc_num 65} _LOG_WRITE_$$buffer(p14$1, v1$1, v38$1, $$buffer[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$buffer(p14$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 65} _CHECK_WRITE_$$buffer(p14$2, v1$2, v38$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$buffer"} true;
    $$buffer[1bv1][v1$1] := (if p14$1 then v38$1 else $$buffer[1bv1][v1$1]);
    $$buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := (if p14$2 then v38$2 else $$buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    goto __partitioned_block_$14.tail_2;

  __partitioned_block_$14.tail_2:
    call {:sourceloc_num 67} $bugle_barrier_duplicated_2(1bv1, 0bv1);
    $s.0 := BV32_UDIV(group_size_x, 2bv32);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $19;

  $19:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b46 ==> _WRITE_HAS_OCCURRED_$$buffer ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b45 ==> _READ_HAS_OCCURRED_$$buffer ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b44 ==> !_WRITE_HAS_OCCURRED_$$buffer;
    assert {:tag "noread"} _b43 ==> !_READ_HAS_OCCURRED_$$buffer;
    assert {:tag "pow2NotZero"} _b42 ==> $s.0 != 0bv32;
    assert {:tag "pow2"} _b41 ==> $s.0 == 0bv32 || BV32_AND($s.0, BV32_SUB($s.0, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$buffer ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$buffer ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$buffer ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_UGE($s.0, BV32_UDIV(group_size_x, 2bv32));
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_UGE($s.0, BV32_UDIV(group_size_x, 2bv32));
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_ULE($s.0, BV32_UDIV(group_size_x, 2bv32));
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_ULE($s.0, BV32_UDIV(group_size_x, 2bv32));
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SGE($s.0, BV32_UDIV(group_size_x, 2bv32));
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SGE($s.0, BV32_UDIV(group_size_x, 2bv32));
    assert {:tag "loopBound"} {:thread 1} _b0 ==> BV32_SLE($s.0, BV32_UDIV(group_size_x, 2bv32));
    assert {:tag "loopBound"} {:thread 2} _b0 ==> BV32_SLE($s.0, BV32_UDIV(group_size_x, 2bv32));
    assert {:block_sourceloc} {:sourceloc_num 68} true;
    v39 := BV32_UGT($s.0, 0bv32);
    p16$1 := false;
    p16$2 := false;
    p17$1 := false;
    p17$2 := false;
    p18$1 := false;
    p18$2 := false;
    p19$1 := false;
    p19$2 := false;
    goto __partitioned_block_$truebb7_0, $falsebb7;

  $falsebb7:
    assume {:partition} !v39 && !v39;
    v43$1 := v1$1 == 0bv32;
    v43$2 := v1$2 == 0bv32;
    p18$1 := (if v43$1 then v43$1 else p18$1);
    p18$2 := (if v43$2 then v43$2 else p18$2);
    call {:sourceloc} {:sourceloc_num 79} _LOG_READ_$$buffer(p18$1, 0bv32, $$buffer[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 79} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 79} _CHECK_READ_$$buffer(p18$2, 0bv32, $$buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$buffer"} true;
    v44$1 := (if p18$1 then $$buffer[1bv1][0bv32] else v44$1);
    v44$2 := (if p18$2 then $$buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v44$2);
    call {:sourceloc} {:sourceloc_num 80} _LOG_WRITE_$$partial_sums(p18$1, v0$1, v44$1, $$partial_sums[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$partial_sums(p18$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 80} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 80} _CHECK_WRITE_$$partial_sums(p18$2, v0$2, v44$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$partial_sums"} true;
    $$partial_sums[v0$1] := (if p18$1 then v44$1 else $$partial_sums[v0$1]);
    $$partial_sums[v0$2] := (if p18$2 then v44$2 else $$partial_sums[v0$2]);
    return;

  __partitioned_block_$truebb7_0:
    assume {:partition} v39 && v39;
    v40$1 := BV32_ULT(v1$1, $s.0);
    v40$2 := BV32_ULT(v1$2, $s.0);
    p17$1 := (if v40$1 then v40$1 else p17$1);
    p17$2 := (if v40$2 then v40$2 else p17$2);
    call {:sourceloc} {:sourceloc_num 71} _LOG_READ_$$buffer(p17$1, BV32_ADD(v1$1, $s.0), $$buffer[1bv1][BV32_ADD(v1$1, $s.0)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 71} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 71} _CHECK_READ_$$buffer(p17$2, BV32_ADD(v1$2, $s.0), $$buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, $s.0)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$buffer"} true;
    v41$1 := (if p17$1 then $$buffer[1bv1][BV32_ADD(v1$1, $s.0)] else v41$1);
    v41$2 := (if p17$2 then $$buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, $s.0)] else v41$2);
    call {:sourceloc} {:sourceloc_num 72} _LOG_READ_$$buffer(p17$1, v1$1, $$buffer[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 72} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 72} _CHECK_READ_$$buffer(p17$2, v1$2, $$buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$buffer"} true;
    v42$1 := (if p17$1 then $$buffer[1bv1][v1$1] else v42$1);
    v42$2 := (if p17$2 then $$buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v42$2);
    call {:sourceloc} {:sourceloc_num 73} _LOG_WRITE_$$buffer(p17$1, v1$1, FADD32(v42$1, v41$1), $$buffer[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$buffer(p17$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 73} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 73} _CHECK_WRITE_$$buffer(p17$2, v1$2, FADD32(v42$2, v41$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$buffer"} true;
    $$buffer[1bv1][v1$1] := (if p17$1 then FADD32(v42$1, v41$1) else $$buffer[1bv1][v1$1]);
    $$buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := (if p17$2 then FADD32(v42$2, v41$2) else $$buffer[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    goto __partitioned_block_$truebb7_1;

  __partitioned_block_$truebb7_1:
    call {:sourceloc_num 75} $bugle_barrier_duplicated_3(1bv1, 0bv1);
    $s.0 := BV32_LSHR($s.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $19;

  $14.backedge:
    assume {:backedge} p11$1 || p11$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $14;

  $4.backedge:
    assume {:backedge} p3$1 || p3$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $4;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 782bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 0bv1;
  requires $1 == 1bv1;
  modifies $$buffer, $$arrayX, $$arrayY, $$ind, $$likelihood, $$weights, $$seed, $$partial_sums, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$buffer, $$arrayX, $$arrayY, $$ind, $$likelihood, $$weights, $$seed, $$partial_sums, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$buffer, $$arrayX, $$arrayY, $$ind, $$likelihood, $$weights, $$seed, $$partial_sums, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_3($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$buffer, $$arrayX, $$arrayY, $$ind, $$likelihood, $$weights, $$seed, $$partial_sums, _TRACKING;



function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

const {:existential true} _b4: bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

const {:existential true} _b11: bool;

const {:existential true} _b12: bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const {:existential true} _b17: bool;

const {:existential true} _b18: bool;

const {:existential true} _b19: bool;

const {:existential true} _b20: bool;

const {:existential true} _b21: bool;

const {:existential true} _b22: bool;

const {:existential true} _b23: bool;

const {:existential true} _b24: bool;

const {:existential true} _b25: bool;

const {:existential true} _b26: bool;

const _WATCHED_VALUE_$$arrayX: bv32;

procedure {:inline 1} _LOG_READ_$$arrayX(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$arrayX;



implementation {:inline 1} _LOG_READ_$$arrayX(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$arrayX := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$arrayX == _value then true else _READ_HAS_OCCURRED_$$arrayX);
    return;
}



procedure _CHECK_READ_$$arrayX(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "arrayX"} {:array "$$arrayX"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$arrayX && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$arrayX);
  requires {:source_name "arrayX"} {:array "$$arrayX"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$arrayX && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$arrayX: bool;

procedure {:inline 1} _LOG_WRITE_$$arrayX(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$arrayX, _WRITE_READ_BENIGN_FLAG_$$arrayX;



implementation {:inline 1} _LOG_WRITE_$$arrayX(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$arrayX := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$arrayX == _value then true else _WRITE_HAS_OCCURRED_$$arrayX);
    _WRITE_READ_BENIGN_FLAG_$$arrayX := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$arrayX == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$arrayX);
    return;
}



procedure _CHECK_WRITE_$$arrayX(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "arrayX"} {:array "$$arrayX"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$arrayX && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$arrayX != _value);
  requires {:source_name "arrayX"} {:array "$$arrayX"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$arrayX && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$arrayX != _value);
  requires {:source_name "arrayX"} {:array "$$arrayX"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$arrayX && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$arrayX(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$arrayX;



implementation {:inline 1} _LOG_ATOMIC_$$arrayX(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$arrayX := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$arrayX);
    return;
}



procedure _CHECK_ATOMIC_$$arrayX(_P: bool, _offset: bv32);
  requires {:source_name "arrayX"} {:array "$$arrayX"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$arrayX && _WATCHED_OFFSET == _offset);
  requires {:source_name "arrayX"} {:array "$$arrayX"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$arrayX && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$arrayX(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$arrayX;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$arrayX(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$arrayX := (if _P && _WRITE_HAS_OCCURRED_$$arrayX && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$arrayX);
    return;
}



const _WATCHED_VALUE_$$arrayY: bv32;

procedure {:inline 1} _LOG_READ_$$arrayY(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$arrayY;



implementation {:inline 1} _LOG_READ_$$arrayY(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$arrayY := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$arrayY == _value then true else _READ_HAS_OCCURRED_$$arrayY);
    return;
}



procedure _CHECK_READ_$$arrayY(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "arrayY"} {:array "$$arrayY"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$arrayY && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$arrayY);
  requires {:source_name "arrayY"} {:array "$$arrayY"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$arrayY && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$arrayY: bool;

procedure {:inline 1} _LOG_WRITE_$$arrayY(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$arrayY, _WRITE_READ_BENIGN_FLAG_$$arrayY;



implementation {:inline 1} _LOG_WRITE_$$arrayY(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$arrayY := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$arrayY == _value then true else _WRITE_HAS_OCCURRED_$$arrayY);
    _WRITE_READ_BENIGN_FLAG_$$arrayY := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$arrayY == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$arrayY);
    return;
}



procedure _CHECK_WRITE_$$arrayY(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "arrayY"} {:array "$$arrayY"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$arrayY && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$arrayY != _value);
  requires {:source_name "arrayY"} {:array "$$arrayY"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$arrayY && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$arrayY != _value);
  requires {:source_name "arrayY"} {:array "$$arrayY"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$arrayY && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$arrayY(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$arrayY;



implementation {:inline 1} _LOG_ATOMIC_$$arrayY(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$arrayY := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$arrayY);
    return;
}



procedure _CHECK_ATOMIC_$$arrayY(_P: bool, _offset: bv32);
  requires {:source_name "arrayY"} {:array "$$arrayY"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$arrayY && _WATCHED_OFFSET == _offset);
  requires {:source_name "arrayY"} {:array "$$arrayY"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$arrayY && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$arrayY(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$arrayY;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$arrayY(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$arrayY := (if _P && _WRITE_HAS_OCCURRED_$$arrayY && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$arrayY);
    return;
}



const _WATCHED_VALUE_$$xj: bv32;

procedure {:inline 1} _LOG_READ_$$xj(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$xj;



implementation {:inline 1} _LOG_READ_$$xj(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$xj := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$xj == _value then true else _READ_HAS_OCCURRED_$$xj);
    return;
}



procedure _CHECK_READ_$$xj(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "xj"} {:array "$$xj"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$xj && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$xj);
  requires {:source_name "xj"} {:array "$$xj"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$xj && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$xj: bool;

procedure {:inline 1} _LOG_WRITE_$$xj(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$xj, _WRITE_READ_BENIGN_FLAG_$$xj;



implementation {:inline 1} _LOG_WRITE_$$xj(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$xj := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$xj == _value then true else _WRITE_HAS_OCCURRED_$$xj);
    _WRITE_READ_BENIGN_FLAG_$$xj := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$xj == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$xj);
    return;
}



procedure _CHECK_WRITE_$$xj(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "xj"} {:array "$$xj"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$xj && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$xj != _value);
  requires {:source_name "xj"} {:array "$$xj"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$xj && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$xj != _value);
  requires {:source_name "xj"} {:array "$$xj"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$xj && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$xj(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$xj;



implementation {:inline 1} _LOG_ATOMIC_$$xj(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$xj := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$xj);
    return;
}



procedure _CHECK_ATOMIC_$$xj(_P: bool, _offset: bv32);
  requires {:source_name "xj"} {:array "$$xj"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$xj && _WATCHED_OFFSET == _offset);
  requires {:source_name "xj"} {:array "$$xj"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$xj && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$xj(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$xj;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$xj(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$xj := (if _P && _WRITE_HAS_OCCURRED_$$xj && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$xj);
    return;
}



const _WATCHED_VALUE_$$yj: bv32;

procedure {:inline 1} _LOG_READ_$$yj(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$yj;



implementation {:inline 1} _LOG_READ_$$yj(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$yj := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$yj == _value then true else _READ_HAS_OCCURRED_$$yj);
    return;
}



procedure _CHECK_READ_$$yj(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "yj"} {:array "$$yj"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$yj && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$yj);
  requires {:source_name "yj"} {:array "$$yj"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$yj && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$yj: bool;

procedure {:inline 1} _LOG_WRITE_$$yj(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$yj, _WRITE_READ_BENIGN_FLAG_$$yj;



implementation {:inline 1} _LOG_WRITE_$$yj(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$yj := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$yj == _value then true else _WRITE_HAS_OCCURRED_$$yj);
    _WRITE_READ_BENIGN_FLAG_$$yj := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$yj == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$yj);
    return;
}



procedure _CHECK_WRITE_$$yj(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "yj"} {:array "$$yj"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$yj && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$yj != _value);
  requires {:source_name "yj"} {:array "$$yj"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$yj && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$yj != _value);
  requires {:source_name "yj"} {:array "$$yj"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$yj && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$yj(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$yj;



implementation {:inline 1} _LOG_ATOMIC_$$yj(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$yj := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$yj);
    return;
}



procedure _CHECK_ATOMIC_$$yj(_P: bool, _offset: bv32);
  requires {:source_name "yj"} {:array "$$yj"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$yj && _WATCHED_OFFSET == _offset);
  requires {:source_name "yj"} {:array "$$yj"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$yj && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$yj(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$yj;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$yj(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$yj := (if _P && _WRITE_HAS_OCCURRED_$$yj && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$yj);
    return;
}



const _WATCHED_VALUE_$$CDF: bv32;

procedure {:inline 1} _LOG_READ_$$CDF(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$CDF;



implementation {:inline 1} _LOG_READ_$$CDF(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$CDF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$CDF == _value then true else _READ_HAS_OCCURRED_$$CDF);
    return;
}



procedure _CHECK_READ_$$CDF(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "CDF"} {:array "$$CDF"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$CDF);
  requires {:source_name "CDF"} {:array "$$CDF"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$CDF: bool;

procedure {:inline 1} _LOG_WRITE_$$CDF(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$CDF, _WRITE_READ_BENIGN_FLAG_$$CDF;



implementation {:inline 1} _LOG_WRITE_$$CDF(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$CDF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$CDF == _value then true else _WRITE_HAS_OCCURRED_$$CDF);
    _WRITE_READ_BENIGN_FLAG_$$CDF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$CDF == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$CDF);
    return;
}



procedure _CHECK_WRITE_$$CDF(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "CDF"} {:array "$$CDF"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$CDF != _value);
  requires {:source_name "CDF"} {:array "$$CDF"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$CDF != _value);
  requires {:source_name "CDF"} {:array "$$CDF"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$CDF(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$CDF;



implementation {:inline 1} _LOG_ATOMIC_$$CDF(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$CDF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$CDF);
    return;
}



procedure _CHECK_ATOMIC_$$CDF(_P: bool, _offset: bv32);
  requires {:source_name "CDF"} {:array "$$CDF"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset);
  requires {:source_name "CDF"} {:array "$$CDF"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$CDF(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$CDF;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$CDF(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$CDF := (if _P && _WRITE_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$CDF);
    return;
}



const _WATCHED_VALUE_$$ind: bv32;

procedure {:inline 1} _LOG_READ_$$ind(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$ind;



implementation {:inline 1} _LOG_READ_$$ind(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$ind := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ind == _value then true else _READ_HAS_OCCURRED_$$ind);
    return;
}



procedure _CHECK_READ_$$ind(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "ind"} {:array "$$ind"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$ind && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$ind);
  requires {:source_name "ind"} {:array "$$ind"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$ind && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$ind: bool;

procedure {:inline 1} _LOG_WRITE_$$ind(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$ind, _WRITE_READ_BENIGN_FLAG_$$ind;



implementation {:inline 1} _LOG_WRITE_$$ind(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$ind := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ind == _value then true else _WRITE_HAS_OCCURRED_$$ind);
    _WRITE_READ_BENIGN_FLAG_$$ind := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ind == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$ind);
    return;
}



procedure _CHECK_WRITE_$$ind(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "ind"} {:array "$$ind"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$ind && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ind != _value);
  requires {:source_name "ind"} {:array "$$ind"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$ind && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$ind != _value);
  requires {:source_name "ind"} {:array "$$ind"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$ind && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$ind(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$ind;



implementation {:inline 1} _LOG_ATOMIC_$$ind(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$ind := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$ind);
    return;
}



procedure _CHECK_ATOMIC_$$ind(_P: bool, _offset: bv32);
  requires {:source_name "ind"} {:array "$$ind"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$ind && _WATCHED_OFFSET == _offset);
  requires {:source_name "ind"} {:array "$$ind"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$ind && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$ind(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$ind;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$ind(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$ind := (if _P && _WRITE_HAS_OCCURRED_$$ind && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$ind);
    return;
}



const _WATCHED_VALUE_$$objxy: bv32;

procedure {:inline 1} _LOG_READ_$$objxy(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$objxy;



implementation {:inline 1} _LOG_READ_$$objxy(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$objxy := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$objxy == _value then true else _READ_HAS_OCCURRED_$$objxy);
    return;
}



procedure _CHECK_READ_$$objxy(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "objxy"} {:array "$$objxy"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$objxy && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$objxy);
  requires {:source_name "objxy"} {:array "$$objxy"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$objxy && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$objxy: bool;

procedure {:inline 1} _LOG_WRITE_$$objxy(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$objxy, _WRITE_READ_BENIGN_FLAG_$$objxy;



implementation {:inline 1} _LOG_WRITE_$$objxy(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$objxy := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$objxy == _value then true else _WRITE_HAS_OCCURRED_$$objxy);
    _WRITE_READ_BENIGN_FLAG_$$objxy := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$objxy == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$objxy);
    return;
}



procedure _CHECK_WRITE_$$objxy(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "objxy"} {:array "$$objxy"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$objxy && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$objxy != _value);
  requires {:source_name "objxy"} {:array "$$objxy"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$objxy && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$objxy != _value);
  requires {:source_name "objxy"} {:array "$$objxy"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$objxy && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$objxy(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$objxy;



implementation {:inline 1} _LOG_ATOMIC_$$objxy(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$objxy := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$objxy);
    return;
}



procedure _CHECK_ATOMIC_$$objxy(_P: bool, _offset: bv32);
  requires {:source_name "objxy"} {:array "$$objxy"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$objxy && _WATCHED_OFFSET == _offset);
  requires {:source_name "objxy"} {:array "$$objxy"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$objxy && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$objxy(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$objxy;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$objxy(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$objxy := (if _P && _WRITE_HAS_OCCURRED_$$objxy && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$objxy);
    return;
}



const _WATCHED_VALUE_$$likelihood: bv32;

procedure {:inline 1} _LOG_READ_$$likelihood(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$likelihood;



implementation {:inline 1} _LOG_READ_$$likelihood(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$likelihood := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$likelihood == _value then true else _READ_HAS_OCCURRED_$$likelihood);
    return;
}



procedure _CHECK_READ_$$likelihood(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "likelihood"} {:array "$$likelihood"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$likelihood && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$likelihood);
  requires {:source_name "likelihood"} {:array "$$likelihood"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$likelihood && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$likelihood: bool;

procedure {:inline 1} _LOG_WRITE_$$likelihood(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$likelihood, _WRITE_READ_BENIGN_FLAG_$$likelihood;



implementation {:inline 1} _LOG_WRITE_$$likelihood(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$likelihood := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$likelihood == _value then true else _WRITE_HAS_OCCURRED_$$likelihood);
    _WRITE_READ_BENIGN_FLAG_$$likelihood := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$likelihood == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$likelihood);
    return;
}



procedure _CHECK_WRITE_$$likelihood(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "likelihood"} {:array "$$likelihood"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$likelihood && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$likelihood != _value);
  requires {:source_name "likelihood"} {:array "$$likelihood"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$likelihood && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$likelihood != _value);
  requires {:source_name "likelihood"} {:array "$$likelihood"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$likelihood && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$likelihood(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$likelihood;



implementation {:inline 1} _LOG_ATOMIC_$$likelihood(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$likelihood := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$likelihood);
    return;
}



procedure _CHECK_ATOMIC_$$likelihood(_P: bool, _offset: bv32);
  requires {:source_name "likelihood"} {:array "$$likelihood"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$likelihood && _WATCHED_OFFSET == _offset);
  requires {:source_name "likelihood"} {:array "$$likelihood"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$likelihood && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$likelihood(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$likelihood;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$likelihood(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$likelihood := (if _P && _WRITE_HAS_OCCURRED_$$likelihood && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$likelihood);
    return;
}



const _WATCHED_VALUE_$$I: bv8;

procedure {:inline 1} _LOG_READ_$$I(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$I;



implementation {:inline 1} _LOG_READ_$$I(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$I := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$I == _value then true else _READ_HAS_OCCURRED_$$I);
    return;
}



procedure _CHECK_READ_$$I(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "I"} {:array "$$I"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$I && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$I);
  requires {:source_name "I"} {:array "$$I"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$I && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$I: bool;

procedure {:inline 1} _LOG_WRITE_$$I(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$I, _WRITE_READ_BENIGN_FLAG_$$I;



implementation {:inline 1} _LOG_WRITE_$$I(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$I := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$I == _value then true else _WRITE_HAS_OCCURRED_$$I);
    _WRITE_READ_BENIGN_FLAG_$$I := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$I == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$I);
    return;
}



procedure _CHECK_WRITE_$$I(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "I"} {:array "$$I"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$I && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$I != _value);
  requires {:source_name "I"} {:array "$$I"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$I && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$I != _value);
  requires {:source_name "I"} {:array "$$I"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$I && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$I(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$I;



implementation {:inline 1} _LOG_ATOMIC_$$I(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$I := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$I);
    return;
}



procedure _CHECK_ATOMIC_$$I(_P: bool, _offset: bv32);
  requires {:source_name "I"} {:array "$$I"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$I && _WATCHED_OFFSET == _offset);
  requires {:source_name "I"} {:array "$$I"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$I && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$I(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$I;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$I(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$I := (if _P && _WRITE_HAS_OCCURRED_$$I && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$I);
    return;
}



const _WATCHED_VALUE_$$u: bv32;

procedure {:inline 1} _LOG_READ_$$u(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$u;



implementation {:inline 1} _LOG_READ_$$u(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$u := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u == _value then true else _READ_HAS_OCCURRED_$$u);
    return;
}



procedure _CHECK_READ_$$u(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "u"} {:array "$$u"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$u);
  requires {:source_name "u"} {:array "$$u"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$u: bool;

procedure {:inline 1} _LOG_WRITE_$$u(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$u, _WRITE_READ_BENIGN_FLAG_$$u;



implementation {:inline 1} _LOG_WRITE_$$u(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$u := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u == _value then true else _WRITE_HAS_OCCURRED_$$u);
    _WRITE_READ_BENIGN_FLAG_$$u := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$u);
    return;
}



procedure _CHECK_WRITE_$$u(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "u"} {:array "$$u"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u != _value);
  requires {:source_name "u"} {:array "$$u"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u != _value);
  requires {:source_name "u"} {:array "$$u"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$u(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$u;



implementation {:inline 1} _LOG_ATOMIC_$$u(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$u := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$u);
    return;
}



procedure _CHECK_ATOMIC_$$u(_P: bool, _offset: bv32);
  requires {:source_name "u"} {:array "$$u"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset);
  requires {:source_name "u"} {:array "$$u"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$u(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$u;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$u(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$u := (if _P && _WRITE_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$u);
    return;
}



const _WATCHED_VALUE_$$weights: bv32;

procedure {:inline 1} _LOG_READ_$$weights(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$weights;



implementation {:inline 1} _LOG_READ_$$weights(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$weights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights == _value then true else _READ_HAS_OCCURRED_$$weights);
    return;
}



procedure _CHECK_READ_$$weights(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$weights);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$weights: bool;

procedure {:inline 1} _LOG_WRITE_$$weights(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$weights, _WRITE_READ_BENIGN_FLAG_$$weights;



implementation {:inline 1} _LOG_WRITE_$$weights(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$weights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights == _value then true else _WRITE_HAS_OCCURRED_$$weights);
    _WRITE_READ_BENIGN_FLAG_$$weights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$weights);
    return;
}



procedure _CHECK_WRITE_$$weights(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights != _value);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights != _value);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$weights(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$weights;



implementation {:inline 1} _LOG_ATOMIC_$$weights(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$weights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$weights);
    return;
}



procedure _CHECK_ATOMIC_$$weights(_P: bool, _offset: bv32);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$weights(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$weights;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$weights(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$weights := (if _P && _WRITE_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$weights);
    return;
}



const _WATCHED_VALUE_$$seed: bv32;

procedure {:inline 1} _LOG_READ_$$seed(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$seed;



implementation {:inline 1} _LOG_READ_$$seed(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$seed := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seed == _value then true else _READ_HAS_OCCURRED_$$seed);
    return;
}



procedure _CHECK_READ_$$seed(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "seed"} {:array "$$seed"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$seed);
  requires {:source_name "seed"} {:array "$$seed"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$seed: bool;

procedure {:inline 1} _LOG_WRITE_$$seed(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$seed, _WRITE_READ_BENIGN_FLAG_$$seed;



implementation {:inline 1} _LOG_WRITE_$$seed(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$seed := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seed == _value then true else _WRITE_HAS_OCCURRED_$$seed);
    _WRITE_READ_BENIGN_FLAG_$$seed := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seed == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$seed);
    return;
}



procedure _CHECK_WRITE_$$seed(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "seed"} {:array "$$seed"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seed != _value);
  requires {:source_name "seed"} {:array "$$seed"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seed != _value);
  requires {:source_name "seed"} {:array "$$seed"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$seed(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$seed;



implementation {:inline 1} _LOG_ATOMIC_$$seed(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$seed := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$seed);
    return;
}



procedure _CHECK_ATOMIC_$$seed(_P: bool, _offset: bv32);
  requires {:source_name "seed"} {:array "$$seed"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset);
  requires {:source_name "seed"} {:array "$$seed"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$seed(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$seed;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$seed(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$seed := (if _P && _WRITE_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$seed);
    return;
}



const _WATCHED_VALUE_$$partial_sums: bv32;

procedure {:inline 1} _LOG_READ_$$partial_sums(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$partial_sums;



implementation {:inline 1} _LOG_READ_$$partial_sums(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums == _value then true else _READ_HAS_OCCURRED_$$partial_sums);
    return;
}



procedure _CHECK_READ_$$partial_sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$partial_sums);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$partial_sums: bool;

procedure {:inline 1} _LOG_WRITE_$$partial_sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$partial_sums, _WRITE_READ_BENIGN_FLAG_$$partial_sums;



implementation {:inline 1} _LOG_WRITE_$$partial_sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums == _value then true else _WRITE_HAS_OCCURRED_$$partial_sums);
    _WRITE_READ_BENIGN_FLAG_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$partial_sums);
    return;
}



procedure _CHECK_WRITE_$$partial_sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums != _value);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums != _value);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$partial_sums(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$partial_sums;



implementation {:inline 1} _LOG_ATOMIC_$$partial_sums(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$partial_sums);
    return;
}



procedure _CHECK_ATOMIC_$$partial_sums(_P: bool, _offset: bv32);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$partial_sums(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$partial_sums;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$partial_sums(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$partial_sums := (if _P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$partial_sums);
    return;
}



const _WATCHED_VALUE_$$buffer: bv32;

procedure {:inline 1} _LOG_READ_$$buffer(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$buffer;



implementation {:inline 1} _LOG_READ_$$buffer(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$buffer := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$buffer == _value then true else _READ_HAS_OCCURRED_$$buffer);
    return;
}



procedure _CHECK_READ_$$buffer(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "buffer"} {:array "$$buffer"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$buffer && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$buffer && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "buffer"} {:array "$$buffer"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$buffer && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$buffer: bool;

procedure {:inline 1} _LOG_WRITE_$$buffer(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$buffer, _WRITE_READ_BENIGN_FLAG_$$buffer;



implementation {:inline 1} _LOG_WRITE_$$buffer(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$buffer := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$buffer == _value then true else _WRITE_HAS_OCCURRED_$$buffer);
    _WRITE_READ_BENIGN_FLAG_$$buffer := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$buffer == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$buffer);
    return;
}



procedure _CHECK_WRITE_$$buffer(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "buffer"} {:array "$$buffer"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$buffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$buffer != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "buffer"} {:array "$$buffer"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$buffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$buffer != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "buffer"} {:array "$$buffer"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$buffer && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$buffer(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$buffer;



implementation {:inline 1} _LOG_ATOMIC_$$buffer(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$buffer := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$buffer);
    return;
}



procedure _CHECK_ATOMIC_$$buffer(_P: bool, _offset: bv32);
  requires {:source_name "buffer"} {:array "$$buffer"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$buffer && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "buffer"} {:array "$$buffer"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$buffer && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$buffer(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$buffer;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$buffer(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$buffer := (if _P && _WRITE_HAS_OCCURRED_$$buffer && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$buffer);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$buffer;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$buffer;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$buffer;
    goto anon1;

  anon1:
    goto anon20_Then, anon20_Else;

  anon20_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$arrayX;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$arrayX;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$arrayX;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$arrayY;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$arrayY;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$arrayY;
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$ind;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$ind;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$ind;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$likelihood;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$likelihood;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$likelihood;
    goto anon7;

  anon7:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$weights;
    goto anon8;

  anon8:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$seed;
    goto anon9;

  anon9:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$partial_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$partial_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$partial_sums;
    goto anon10;

  anon10:
    goto anon21_Then, anon21_Else;

  anon21_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon18;

  anon18:
    havoc _TRACKING;
    return;

  anon21_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$arrayX;
    goto anon12;

  anon12:
    havoc $$arrayY;
    goto anon13;

  anon13:
    havoc $$ind;
    goto anon14;

  anon14:
    havoc $$likelihood;
    goto anon15;

  anon15:
    havoc $$weights;
    goto anon16;

  anon16:
    havoc $$seed;
    goto anon17;

  anon17:
    havoc $$partial_sums;
    goto anon18;

  anon20_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$buffer;
    goto anon3;

  anon19_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$buffer;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$buffer;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$buffer;
    goto anon1;

  anon1:
    goto anon20_Then, anon20_Else;

  anon20_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$arrayX;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$arrayX;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$arrayX;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$arrayY;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$arrayY;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$arrayY;
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$ind;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$ind;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$ind;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$likelihood;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$likelihood;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$likelihood;
    goto anon7;

  anon7:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$weights;
    goto anon8;

  anon8:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$seed;
    goto anon9;

  anon9:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$partial_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$partial_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$partial_sums;
    goto anon10;

  anon10:
    goto anon21_Then, anon21_Else;

  anon21_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon18;

  anon18:
    havoc _TRACKING;
    return;

  anon21_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$arrayX;
    goto anon12;

  anon12:
    havoc $$arrayY;
    goto anon13;

  anon13:
    havoc $$ind;
    goto anon14;

  anon14:
    havoc $$likelihood;
    goto anon15;

  anon15:
    havoc $$weights;
    goto anon16;

  anon16:
    havoc $$seed;
    goto anon17;

  anon17:
    havoc $$partial_sums;
    goto anon18;

  anon20_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$buffer;
    goto anon3;

  anon19_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$buffer;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$buffer;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$buffer;
    goto anon1;

  anon1:
    goto anon20_Then, anon20_Else;

  anon20_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$arrayX;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$arrayX;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$arrayX;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$arrayY;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$arrayY;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$arrayY;
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$ind;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$ind;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$ind;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$likelihood;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$likelihood;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$likelihood;
    goto anon7;

  anon7:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$weights;
    goto anon8;

  anon8:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$seed;
    goto anon9;

  anon9:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$partial_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$partial_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$partial_sums;
    goto anon10;

  anon10:
    goto anon21_Then, anon21_Else;

  anon21_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon18;

  anon18:
    havoc _TRACKING;
    return;

  anon21_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$arrayX;
    goto anon12;

  anon12:
    havoc $$arrayY;
    goto anon13;

  anon13:
    havoc $$ind;
    goto anon14;

  anon14:
    havoc $$likelihood;
    goto anon15;

  anon15:
    havoc $$weights;
    goto anon16;

  anon16:
    havoc $$seed;
    goto anon17;

  anon17:
    havoc $$partial_sums;
    goto anon18;

  anon20_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$buffer;
    goto anon3;

  anon19_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_3($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon19_Then, anon19_Else;

  anon19_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$buffer;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$buffer;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$buffer;
    goto anon1;

  anon1:
    goto anon20_Then, anon20_Else;

  anon20_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$arrayX;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$arrayX;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$arrayX;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$arrayY;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$arrayY;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$arrayY;
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$ind;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$ind;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$ind;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$likelihood;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$likelihood;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$likelihood;
    goto anon7;

  anon7:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$weights;
    goto anon8;

  anon8:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$seed;
    goto anon9;

  anon9:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$partial_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$partial_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$partial_sums;
    goto anon10;

  anon10:
    goto anon21_Then, anon21_Else;

  anon21_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon18;

  anon18:
    havoc _TRACKING;
    return;

  anon21_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$arrayX;
    goto anon12;

  anon12:
    havoc $$arrayY;
    goto anon13;

  anon13:
    havoc $$ind;
    goto anon14;

  anon14:
    havoc $$likelihood;
    goto anon15;

  anon15:
    havoc $$weights;
    goto anon16;

  anon16:
    havoc $$seed;
    goto anon17;

  anon17:
    havoc $$partial_sums;
    goto anon18;

  anon20_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$buffer;
    goto anon3;

  anon19_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



const {:existential true} _b27: bool;

const {:existential true} _b28: bool;

const {:existential true} _b29: bool;

const {:existential true} _b30: bool;

const {:existential true} _b31: bool;

const {:existential true} _b32: bool;

const {:existential true} _b33: bool;

const {:existential true} _b34: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b35: bool;

const {:existential true} _b36: bool;

const {:existential true} _b37: bool;

const {:existential true} _b38: bool;

const {:existential true} _b39: bool;

const {:existential true} _b40: bool;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b41: bool;

const {:existential true} _b42: bool;

const {:existential true} _b43: bool;

const {:existential true} _b44: bool;

const {:existential true} _b45: bool;

const {:existential true} _b46: bool;
