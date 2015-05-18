type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$sample_g"} {:global} {:elem_width 32} {:source_name "sample_g"} {:source_elem_width 192} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 192} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sample_g: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 192} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sample_g: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 192} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sample_g: bool;

var {:source_name "binStartAddr_g"} {:global} $$binStartAddr_g: [bv32]bv32;

axiom {:array_info "$$binStartAddr_g"} {:global} {:elem_width 32} {:source_name "binStartAddr_g"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$binStartAddr_g: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$binStartAddr_g: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$binStartAddr_g: bool;

var {:source_name "gridData_g"} {:global} $$gridData_g: [bv32]bv32;

axiom {:array_info "$$gridData_g"} {:global} {:elem_width 32} {:source_name "gridData_g"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$gridData_g: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$gridData_g: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$gridData_g: bool;

var {:source_name "sampleDensity_g"} {:global} $$sampleDensity_g: [bv32]bv32;

axiom {:array_info "$$sampleDensity_g"} {:global} {:elem_width 32} {:source_name "sampleDensity_g"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sampleDensity_g: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sampleDensity_g: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sampleDensity_g: bool;

var {:source_name "sharedBin"} {:group_shared} $$gridding_GPU.sharedBin: [bv1][bv32]bv32;

axiom {:array_info "$$gridding_GPU.sharedBin"} {:group_shared} {:elem_width 32} {:source_name "sharedBin"} {:source_elem_width 192} {:source_dimensions "64"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 192} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 192} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 192} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$gridding_GPU.sharedBin: bool;

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

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function FADD32(bv32, bv32) : bv32;

function FADD64(bv64, bv64) : bv64;

function FDIV32(bv32, bv32) : bv32;

function FLT32(bv32, bv32) : bool;

function FLT64(bv64, bv64) : bool;

function FMUL32(bv32, bv32) : bv32;

function FMUL64(bv64, bv64) : bv64;

function FP32_CONV64(bv32) : bv64;

function FP64_CONV32(bv64) : bv32;

function FP64_TO_SI32(bv64) : bv32;

function FSQRT64(bv64) : bv64;

function FSUB32(bv32, bv32) : bv32;

function FSUB64(bv64, bv64) : bv64;

function FUNO32(bv32, bv32) : bool;

function SI32_TO_FP32(bv32) : bv32;

function SI32_TO_FP64(bv32) : bv64;

function UI32_TO_FP64(bv32) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "bvurem"} BV32_UREM(bv32, bv32) : bv32;

procedure {:source_name "gridding_GPU"} {:kernel} $gridding_GPU($beta: bv32);
  requires !_READ_HAS_OCCURRED_$$sample_g && !_WRITE_HAS_OCCURRED_$$sample_g && !_ATOMIC_HAS_OCCURRED_$$sample_g;
  requires !_READ_HAS_OCCURRED_$$binStartAddr_g && !_WRITE_HAS_OCCURRED_$$binStartAddr_g && !_ATOMIC_HAS_OCCURRED_$$binStartAddr_g;
  requires !_READ_HAS_OCCURRED_$$gridData_g && !_WRITE_HAS_OCCURRED_$$gridData_g && !_ATOMIC_HAS_OCCURRED_$$gridData_g;
  requires !_READ_HAS_OCCURRED_$$sampleDensity_g && !_WRITE_HAS_OCCURRED_$$sampleDensity_g && !_ATOMIC_HAS_OCCURRED_$$sampleDensity_g;
  requires !_READ_HAS_OCCURRED_$$gridding_GPU.sharedBin && !_WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin && !_ATOMIC_HAS_OCCURRED_$$gridding_GPU.sharedBin;
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
  modifies $$gridding_GPU.sharedBin, $$gridData_g, $$sampleDensity_g, _TRACKING, _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin, _WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin, _WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin, _TRACKING, _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin, _WRITE_HAS_OCCURRED_$$gridData_g, _WRITE_READ_BENIGN_FLAG_$$gridData_g, _WRITE_READ_BENIGN_FLAG_$$gridData_g, _WRITE_HAS_OCCURRED_$$sampleDensity_g, _WRITE_READ_BENIGN_FLAG_$$sampleDensity_g, _WRITE_READ_BENIGN_FLAG_$$sampleDensity_g;



implementation {:source_name "gridding_GPU"} {:kernel} $gridding_GPU($beta: bv32)
{
  var $0$1: bv32;
  var $0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $2$1: bv32;
  var $2$2: bv32;
  var $3$1: bv32;
  var $3$2: bv32;
  var $4$1: bv32;
  var $4$2: bv32;
  var $5$1: bv32;
  var $5$2: bv32;
  var $pt.0$1: bv64;
  var $pt.0$2: bv64;
  var $density.0$1: bv32;
  var $density.0$2: bv32;
  var $z.0$1: bv32;
  var $z.0$2: bv32;
  var $pt.1$1: bv64;
  var $pt.1$2: bv64;
  var $density.1$1: bv32;
  var $density.1$2: bv32;
  var $y.0$1: bv32;
  var $y.0$2: bv32;
  var $pt.2$1: bv64;
  var $pt.2$2: bv64;
  var $density.2$1: bv32;
  var $density.2$2: bv32;
  var $x.0$1: bv32;
  var $x.0$2: bv32;
  var $6$1: bv32;
  var $6$2: bv32;
  var $pt.3$1: bv64;
  var $pt.3$2: bv64;
  var $density.3$1: bv32;
  var $density.3$2: bv32;
  var $j.0$1: bv32;
  var $j.0$2: bv32;
  var $pt.5$1: bv64;
  var $pt.5$2: bv64;
  var $density.5$1: bv32;
  var $density.5$2: bv32;
  var $pt.4$1: bv64;
  var $pt.4$2: bv64;
  var $density.4$1: bv32;
  var $density.4$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
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
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bool;
  var v10$2: bool;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bool;
  var v14$2: bool;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bool;
  var v16$2: bool;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bool;
  var v18$2: bool;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bool;
  var v20$2: bool;
  var v21$1: bool;
  var v21$2: bool;
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
  var v27$1: bool;
  var v27$2: bool;
  var v28$1: bool;
  var v28$2: bool;
  var v29$1: bool;
  var v29$2: bool;
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
  var v36$1: bool;
  var v36$2: bool;
  var v37$1: bv32;
  var v37$2: bv32;
  var v38$1: bv32;
  var v38$2: bv32;
  var v39$1: bv32;
  var v39$2: bv32;
  var v40$1: bool;
  var v40$2: bool;
  var v41$1: bool;
  var v41$2: bool;
  var v42$1: bool;
  var v42$2: bool;
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
  var v50$1: bool;
  var v50$2: bool;
  var v51$1: bv32;
  var v51$2: bv32;
  var v52$1: bv32;
  var v52$2: bv32;
  var v53$1: bv32;
  var v53$2: bv32;
  var v54$1: bv32;
  var v54$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1);
    v0$2 := BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$2, group_size_y), group_size_x), BV32_MUL(local_id_y$2, group_size_x)), local_id_x$2);
    v1$1 := BV32_MUL(group_size_z, BV32_UDIV(group_id_y$1, BV32_UDIV(256bv32, group_size_y)));
    v1$2 := BV32_MUL(group_size_z, BV32_UDIV(group_id_y$2, BV32_UDIV(256bv32, group_size_y)));
    v2$1 := BV32_MUL(group_size_y, BV32_UREM(group_id_y$1, BV32_UDIV(256bv32, group_size_y)));
    v2$2 := BV32_MUL(group_size_y, BV32_UREM(group_id_y$2, BV32_UDIV(256bv32, group_size_y)));
    v3$1 := BV32_MUL(group_id_x$1, group_size_x);
    v3$2 := BV32_MUL(group_id_x$2, group_size_x);
    v4$1 := BV32_ADD(v3$1, local_id_x$1);
    v4$2 := BV32_ADD(v3$2, local_id_x$2);
    v5$1 := BV32_ADD(v2$1, local_id_y$1);
    v5$2 := BV32_ADD(v2$2, local_id_y$2);
    v6$1 := BV32_ADD(v1$1, local_id_z$1);
    v6$2 := BV32_ADD(v1$2, local_id_z$2);
    v7$1 := FP64_TO_SI32(FSUB64(SI32_TO_FP64(v3$1), 4613937818241073152bv64));
    v7$2 := FP64_TO_SI32(FSUB64(SI32_TO_FP64(v3$2), 4613937818241073152bv64));
    v8$1 := BV32_SLT(v7$1, 0bv32);
    v8$2 := BV32_SLT(v7$2, 0bv32);
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
    p0$1 := (if v8$1 then v8$1 else p0$1);
    p0$2 := (if v8$2 then v8$2 else p0$2);
    p1$1 := (if !v8$1 then !v8$1 else p1$1);
    p1$2 := (if !v8$2 then !v8$2 else p1$2);
    $0$1 := (if p0$1 then 0bv32 else $0$1);
    $0$2 := (if p0$2 then 0bv32 else $0$2);
    $0$1 := (if p1$1 then v7$1 else $0$1);
    $0$2 := (if p1$2 then v7$2 else $0$2);
    v9$1 := FP64_TO_SI32(FADD64(UI32_TO_FP64(BV32_ADD(v3$1, group_size_x)), 4612811918334230528bv64));
    v9$2 := FP64_TO_SI32(FADD64(UI32_TO_FP64(BV32_ADD(v3$2, group_size_x)), 4612811918334230528bv64));
    v10$1 := BV32_SGE(v9$1, 256bv32);
    v10$2 := BV32_SGE(v9$2, 256bv32);
    p2$1 := (if v10$1 then v10$1 else p2$1);
    p2$2 := (if v10$2 then v10$2 else p2$2);
    p3$1 := (if !v10$1 then !v10$1 else p3$1);
    p3$2 := (if !v10$2 then !v10$2 else p3$2);
    $1$1 := (if p2$1 then 255bv32 else $1$1);
    $1$2 := (if p2$2 then 255bv32 else $1$2);
    $1$1 := (if p3$1 then v9$1 else $1$1);
    $1$2 := (if p3$2 then v9$2 else $1$2);
    v11$1 := FP64_TO_SI32(FSUB64(SI32_TO_FP64(v2$1), 4613937818241073152bv64));
    v11$2 := FP64_TO_SI32(FSUB64(SI32_TO_FP64(v2$2), 4613937818241073152bv64));
    v12$1 := BV32_SLT(v11$1, 0bv32);
    v12$2 := BV32_SLT(v11$2, 0bv32);
    p4$1 := (if v12$1 then v12$1 else p4$1);
    p4$2 := (if v12$2 then v12$2 else p4$2);
    p5$1 := (if !v12$1 then !v12$1 else p5$1);
    p5$2 := (if !v12$2 then !v12$2 else p5$2);
    $2$1 := (if p4$1 then 0bv32 else $2$1);
    $2$2 := (if p4$2 then 0bv32 else $2$2);
    $2$1 := (if p5$1 then v11$1 else $2$1);
    $2$2 := (if p5$2 then v11$2 else $2$2);
    v13$1 := FP64_TO_SI32(FADD64(UI32_TO_FP64(BV32_ADD(v2$1, group_size_y)), 4612811918334230528bv64));
    v13$2 := FP64_TO_SI32(FADD64(UI32_TO_FP64(BV32_ADD(v2$2, group_size_y)), 4612811918334230528bv64));
    v14$1 := BV32_SGE(v13$1, 256bv32);
    v14$2 := BV32_SGE(v13$2, 256bv32);
    p6$1 := (if v14$1 then v14$1 else p6$1);
    p6$2 := (if v14$2 then v14$2 else p6$2);
    p7$1 := (if !v14$1 then !v14$1 else p7$1);
    p7$2 := (if !v14$2 then !v14$2 else p7$2);
    $3$1 := (if p6$1 then 255bv32 else $3$1);
    $3$2 := (if p6$2 then 255bv32 else $3$2);
    $3$1 := (if p7$1 then v13$1 else $3$1);
    $3$2 := (if p7$2 then v13$2 else $3$2);
    v15$1 := FP64_TO_SI32(FSUB64(SI32_TO_FP64(v1$1), 4613937818241073152bv64));
    v15$2 := FP64_TO_SI32(FSUB64(SI32_TO_FP64(v1$2), 4613937818241073152bv64));
    v16$1 := BV32_SLT(v15$1, 0bv32);
    v16$2 := BV32_SLT(v15$2, 0bv32);
    p8$1 := (if v16$1 then v16$1 else p8$1);
    p8$2 := (if v16$2 then v16$2 else p8$2);
    p9$1 := (if !v16$1 then !v16$1 else p9$1);
    p9$2 := (if !v16$2 then !v16$2 else p9$2);
    $4$1 := (if p8$1 then 0bv32 else $4$1);
    $4$2 := (if p8$2 then 0bv32 else $4$2);
    $4$1 := (if p9$1 then v15$1 else $4$1);
    $4$2 := (if p9$2 then v15$2 else $4$2);
    v17$1 := FP64_TO_SI32(FADD64(UI32_TO_FP64(BV32_ADD(v1$1, group_size_z)), 4612811918334230528bv64));
    v17$2 := FP64_TO_SI32(FADD64(UI32_TO_FP64(BV32_ADD(v1$2, group_size_z)), 4612811918334230528bv64));
    v18$1 := BV32_SGE(v17$1, 256bv32);
    v18$2 := BV32_SGE(v17$2, 256bv32);
    p10$1 := (if v18$1 then v18$1 else p10$1);
    p10$2 := (if v18$2 then v18$2 else p10$2);
    p11$1 := (if !v18$1 then !v18$1 else p11$1);
    p11$2 := (if !v18$2 then !v18$2 else p11$2);
    $5$1 := (if p10$1 then 255bv32 else $5$1);
    $5$2 := (if p10$2 then 255bv32 else $5$2);
    $5$1 := (if p11$1 then v17$1 else $5$1);
    $5$2 := (if p11$2 then v17$2 else $5$2);
    v19$1 := BV32_ADD(BV32_ADD(BV32_MUL(v6$1, 65536bv32), BV32_MUL(v5$1, 256bv32)), v4$1);
    v19$2 := BV32_ADD(BV32_ADD(BV32_MUL(v6$2, 65536bv32), BV32_MUL(v5$2, 256bv32)), v4$2);
    $pt.0$1, $density.0$1, $z.0$1 := 0bv64, 0bv32, $4$1;
    $pt.0$2, $density.0$2, $z.0$2 := 0bv64, 0bv32, $4$2;
    p12$1 := true;
    p12$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $19;

  $19:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b91 ==> _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> _WATCHED_OFFSET == BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 3bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 5bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b90 ==> _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_MUL(0bv32, 6bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 5bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 4bv32));
    assert {:tag "nowrite"} _b89 ==> !_WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin;
    assert {:tag "noread"} _b88 ==> !_READ_HAS_OCCURRED_$$gridding_GPU.sharedBin;
    assert {:tag "predicatedEquality"} _b87 ==> p12$1 && p12$2 ==> v54$1 == v54$2;
    assert {:tag "predicatedEquality"} _b86 ==> p12$1 && p12$2 ==> v53$1 == v53$2;
    assert {:tag "predicatedEquality"} _b85 ==> p12$1 && p12$2 ==> v52$1 == v52$2;
    assert {:tag "predicatedEquality"} _b84 ==> p12$1 && p12$2 ==> v51$1 == v51$2;
    assert {:tag "predicatedEquality"} _b83 ==> p12$1 && p12$2 ==> v50$1 == v50$2;
    assert {:tag "predicatedEquality"} _b82 ==> p12$1 && p12$2 ==> v49$1 == v49$2;
    assert {:tag "predicatedEquality"} _b81 ==> p12$1 && p12$2 ==> v48$1 == v48$2;
    assert {:tag "predicatedEquality"} _b80 ==> p12$1 && p12$2 ==> v47$1 == v47$2;
    assert {:tag "predicatedEquality"} _b79 ==> p12$1 && p12$2 ==> v46$1 == v46$2;
    assert {:tag "predicatedEquality"} _b78 ==> p12$1 && p12$2 ==> v45$1 == v45$2;
    assert {:tag "predicatedEquality"} _b77 ==> p12$1 && p12$2 ==> v44$1 == v44$2;
    assert {:tag "predicatedEquality"} _b76 ==> p12$1 && p12$2 ==> v43$1 == v43$2;
    assert {:tag "predicatedEquality"} _b75 ==> p12$1 && p12$2 ==> v42$1 == v42$2;
    assert {:tag "predicatedEquality"} _b74 ==> p12$1 && p12$2 ==> v41$1 == v41$2;
    assert {:tag "predicatedEquality"} _b73 ==> p12$1 && p12$2 ==> v40$1 == v40$2;
    assert {:tag "predicatedEquality"} _b72 ==> p12$1 && p12$2 ==> v39$1 == v39$2;
    assert {:tag "predicatedEquality"} _b71 ==> p12$1 && p12$2 ==> v38$1 == v38$2;
    assert {:tag "predicatedEquality"} _b70 ==> p12$1 && p12$2 ==> v37$1 == v37$2;
    assert {:tag "predicatedEquality"} _b69 ==> p12$1 && p12$2 ==> v36$1 == v36$2;
    assert {:tag "predicatedEquality"} _b68 ==> p12$1 && p12$2 ==> v35$1 == v35$2;
    assert {:tag "predicatedEquality"} _b67 ==> p12$1 && p12$2 ==> v34$1 == v34$2;
    assert {:tag "predicatedEquality"} _b66 ==> p12$1 && p12$2 ==> v33$1 == v33$2;
    assert {:tag "predicatedEquality"} _b65 ==> p12$1 && p12$2 ==> v32$1 == v32$2;
    assert {:tag "predicatedEquality"} _b64 ==> p12$1 && p12$2 ==> v31$1 == v31$2;
    assert {:tag "predicatedEquality"} _b63 ==> p12$1 && p12$2 ==> v30$1 == v30$2;
    assert {:tag "predicatedEquality"} _b62 ==> p12$1 && p12$2 ==> v29$1 == v29$2;
    assert {:tag "predicatedEquality"} _b61 ==> p12$1 && p12$2 ==> v28$1 == v28$2;
    assert {:tag "predicatedEquality"} _b60 ==> p12$1 && p12$2 ==> v27$1 == v27$2;
    assert {:tag "predicatedEquality"} _b59 ==> p12$1 && p12$2 ==> v26$1 == v26$2;
    assert {:tag "predicatedEquality"} _b58 ==> p12$1 && p12$2 ==> v25$1 == v25$2;
    assert {:tag "predicatedEquality"} _b57 ==> p12$1 && p12$2 ==> v24$1 == v24$2;
    assert {:tag "predicatedEquality"} _b56 ==> p12$1 && p12$2 ==> v23$1 == v23$2;
    assert {:tag "predicatedEquality"} _b55 ==> p12$1 && p12$2 ==> v22$1 == v22$2;
    assert {:tag "predicatedEquality"} _b54 ==> p12$1 && p12$2 ==> v21$1 == v21$2;
    assert {:tag "predicatedEquality"} _b53 ==> p12$1 && p12$2 ==> v20$1 == v20$2;
    assert {:tag "predicatedEquality"} _b52 ==> p12$1 && p12$2 ==> $density.4$1 == $density.4$2;
    assert {:tag "predicatedEquality"} _b51 ==> p12$1 && p12$2 ==> $pt.4$1 == $pt.4$2;
    assert {:tag "predicatedEquality"} _b50 ==> p12$1 && p12$2 ==> $density.5$1 == $density.5$2;
    assert {:tag "predicatedEquality"} _b49 ==> p12$1 && p12$2 ==> $pt.5$1 == $pt.5$2;
    assert {:tag "predicatedEquality"} _b48 ==> p12$1 && p12$2 ==> $j.0$1 == $j.0$2;
    assert {:tag "predicatedEquality"} _b47 ==> p12$1 && p12$2 ==> $density.3$1 == $density.3$2;
    assert {:tag "predicatedEquality"} _b46 ==> p12$1 && p12$2 ==> $pt.3$1 == $pt.3$2;
    assert {:tag "predicatedEquality"} _b45 ==> p12$1 && p12$2 ==> $6$1 == $6$2;
    assert {:tag "predicatedEquality"} _b44 ==> p12$1 && p12$2 ==> $x.0$1 == $x.0$2;
    assert {:tag "predicatedEquality"} _b43 ==> p12$1 && p12$2 ==> $density.2$1 == $density.2$2;
    assert {:tag "predicatedEquality"} _b42 ==> p12$1 && p12$2 ==> $pt.2$1 == $pt.2$2;
    assert {:tag "predicatedEquality"} _b41 ==> p12$1 && p12$2 ==> $y.0$1 == $y.0$2;
    assert {:tag "predicatedEquality"} _b40 ==> p12$1 && p12$2 ==> $density.1$1 == $density.1$2;
    assert {:tag "predicatedEquality"} _b39 ==> p12$1 && p12$2 ==> $pt.1$1 == $pt.1$2;
    assert {:tag "predicatedEquality"} _b38 ==> p12$1 && p12$2 ==> $z.0$1 == $z.0$2;
    assert {:tag "predicatedEquality"} _b37 ==> p12$1 && p12$2 ==> $density.0$1 == $density.0$2;
    assert {:tag "predicatedEquality"} _b36 ==> p12$1 && p12$2 ==> $pt.0$1 == $pt.0$2;
    assert {:tag "loopPredicateEquality"} _b35 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p12$1 == p12$2;
    assert {:tag "loopPredicateEquality"} _b34 ==> p12$1 == p12$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b6 ==> BV32_SLE($z.0$1, $5$1) ==> p12$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b6 ==> BV32_SLE($z.0$2, $5$2) ==> p12$2;
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b5 ==> BV32_UGE($z.0$1, $4$1);
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b5 ==> BV32_UGE($z.0$2, $4$2);
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b4 ==> BV32_ULE($z.0$1, $4$1);
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b4 ==> BV32_ULE($z.0$2, $4$2);
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b3 ==> BV32_SGE($z.0$1, $4$1);
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b3 ==> BV32_SGE($z.0$2, $4$2);
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b2 ==> BV32_SLE($z.0$1, $4$1);
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b2 ==> BV32_SLE($z.0$2, $4$2);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p12$1 ==> _b1 ==> BV32_SUB($z.0$1, $4$1) == BV32_SUB($z.0$2, $4$2);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p12$2 ==> _b1 ==> BV32_SUB($z.0$2, $4$2) == BV32_SUB($z.0$1, $4$1);
    assert {:tag "guardNonNeg"} {:thread 1} p12$1 ==> _b0 ==> BV32_SLE(0bv32, $z.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p12$2 ==> _b0 ==> BV32_SLE(0bv32, $z.0$2);
    assert {:block_sourceloc} {:sourceloc_num 19} p12$1 ==> true;
    v20$1 := (if p12$1 then BV32_SLE($z.0$1, $5$1) else v20$1);
    v20$2 := (if p12$2 then BV32_SLE($z.0$2, $5$2) else v20$2);
    p13$1 := false;
    p13$2 := false;
    p14$1 := false;
    p14$2 := false;
    p33$1 := false;
    p33$2 := false;
    p13$1 := (if p12$1 && v20$1 then v20$1 else p13$1);
    p13$2 := (if p12$2 && v20$2 then v20$2 else p13$2);
    p12$1 := (if p12$1 && !v20$1 then v20$1 else p12$1);
    p12$2 := (if p12$2 && !v20$2 then v20$2 else p12$2);
    $pt.1$1, $density.1$1, $y.0$1 := (if p13$1 then $pt.0$1 else $pt.1$1), (if p13$1 then $density.0$1 else $density.1$1), (if p13$1 then $2$1 else $y.0$1);
    $pt.1$2, $density.1$2, $y.0$2 := (if p13$2 then $pt.0$2 else $pt.1$2), (if p13$2 then $density.0$2 else $density.1$2), (if p13$2 then $2$2 else $y.0$2);
    p14$1 := (if p13$1 then true else p14$1);
    p14$2 := (if p13$2 then true else p14$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $21;

  $21:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b145 ==> _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> _WATCHED_OFFSET == BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 3bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 5bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b144 ==> _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_MUL(0bv32, 6bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 5bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 4bv32));
    assert {:tag "nowrite"} _b143 ==> !_WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin;
    assert {:tag "noread"} _b142 ==> !_READ_HAS_OCCURRED_$$gridding_GPU.sharedBin;
    assert {:tag "predicatedEquality"} _b141 ==> p14$1 && p14$2 ==> v54$1 == v54$2;
    assert {:tag "predicatedEquality"} _b140 ==> p14$1 && p14$2 ==> v53$1 == v53$2;
    assert {:tag "predicatedEquality"} _b139 ==> p14$1 && p14$2 ==> v52$1 == v52$2;
    assert {:tag "predicatedEquality"} _b138 ==> p14$1 && p14$2 ==> v51$1 == v51$2;
    assert {:tag "predicatedEquality"} _b137 ==> p14$1 && p14$2 ==> v50$1 == v50$2;
    assert {:tag "predicatedEquality"} _b136 ==> p14$1 && p14$2 ==> v49$1 == v49$2;
    assert {:tag "predicatedEquality"} _b135 ==> p14$1 && p14$2 ==> v48$1 == v48$2;
    assert {:tag "predicatedEquality"} _b134 ==> p14$1 && p14$2 ==> v47$1 == v47$2;
    assert {:tag "predicatedEquality"} _b133 ==> p14$1 && p14$2 ==> v46$1 == v46$2;
    assert {:tag "predicatedEquality"} _b132 ==> p14$1 && p14$2 ==> v45$1 == v45$2;
    assert {:tag "predicatedEquality"} _b131 ==> p14$1 && p14$2 ==> v44$1 == v44$2;
    assert {:tag "predicatedEquality"} _b130 ==> p14$1 && p14$2 ==> v43$1 == v43$2;
    assert {:tag "predicatedEquality"} _b129 ==> p14$1 && p14$2 ==> v42$1 == v42$2;
    assert {:tag "predicatedEquality"} _b128 ==> p14$1 && p14$2 ==> v41$1 == v41$2;
    assert {:tag "predicatedEquality"} _b127 ==> p14$1 && p14$2 ==> v40$1 == v40$2;
    assert {:tag "predicatedEquality"} _b126 ==> p14$1 && p14$2 ==> v39$1 == v39$2;
    assert {:tag "predicatedEquality"} _b125 ==> p14$1 && p14$2 ==> v38$1 == v38$2;
    assert {:tag "predicatedEquality"} _b124 ==> p14$1 && p14$2 ==> v37$1 == v37$2;
    assert {:tag "predicatedEquality"} _b123 ==> p14$1 && p14$2 ==> v36$1 == v36$2;
    assert {:tag "predicatedEquality"} _b122 ==> p14$1 && p14$2 ==> v35$1 == v35$2;
    assert {:tag "predicatedEquality"} _b121 ==> p14$1 && p14$2 ==> v34$1 == v34$2;
    assert {:tag "predicatedEquality"} _b120 ==> p14$1 && p14$2 ==> v33$1 == v33$2;
    assert {:tag "predicatedEquality"} _b119 ==> p14$1 && p14$2 ==> v32$1 == v32$2;
    assert {:tag "predicatedEquality"} _b118 ==> p14$1 && p14$2 ==> v31$1 == v31$2;
    assert {:tag "predicatedEquality"} _b117 ==> p14$1 && p14$2 ==> v30$1 == v30$2;
    assert {:tag "predicatedEquality"} _b116 ==> p14$1 && p14$2 ==> v29$1 == v29$2;
    assert {:tag "predicatedEquality"} _b115 ==> p14$1 && p14$2 ==> v28$1 == v28$2;
    assert {:tag "predicatedEquality"} _b114 ==> p14$1 && p14$2 ==> v27$1 == v27$2;
    assert {:tag "predicatedEquality"} _b113 ==> p14$1 && p14$2 ==> v26$1 == v26$2;
    assert {:tag "predicatedEquality"} _b112 ==> p14$1 && p14$2 ==> v25$1 == v25$2;
    assert {:tag "predicatedEquality"} _b111 ==> p14$1 && p14$2 ==> v24$1 == v24$2;
    assert {:tag "predicatedEquality"} _b110 ==> p14$1 && p14$2 ==> v23$1 == v23$2;
    assert {:tag "predicatedEquality"} _b109 ==> p14$1 && p14$2 ==> v22$1 == v22$2;
    assert {:tag "predicatedEquality"} _b108 ==> p14$1 && p14$2 ==> v21$1 == v21$2;
    assert {:tag "predicatedEquality"} _b107 ==> p14$1 && p14$2 ==> $density.4$1 == $density.4$2;
    assert {:tag "predicatedEquality"} _b106 ==> p14$1 && p14$2 ==> $pt.4$1 == $pt.4$2;
    assert {:tag "predicatedEquality"} _b105 ==> p14$1 && p14$2 ==> $density.5$1 == $density.5$2;
    assert {:tag "predicatedEquality"} _b104 ==> p14$1 && p14$2 ==> $pt.5$1 == $pt.5$2;
    assert {:tag "predicatedEquality"} _b103 ==> p14$1 && p14$2 ==> $j.0$1 == $j.0$2;
    assert {:tag "predicatedEquality"} _b102 ==> p14$1 && p14$2 ==> $density.3$1 == $density.3$2;
    assert {:tag "predicatedEquality"} _b101 ==> p14$1 && p14$2 ==> $pt.3$1 == $pt.3$2;
    assert {:tag "predicatedEquality"} _b100 ==> p14$1 && p14$2 ==> $6$1 == $6$2;
    assert {:tag "predicatedEquality"} _b99 ==> p14$1 && p14$2 ==> $x.0$1 == $x.0$2;
    assert {:tag "predicatedEquality"} _b98 ==> p14$1 && p14$2 ==> $density.2$1 == $density.2$2;
    assert {:tag "predicatedEquality"} _b97 ==> p14$1 && p14$2 ==> $pt.2$1 == $pt.2$2;
    assert {:tag "predicatedEquality"} _b96 ==> p14$1 && p14$2 ==> $y.0$1 == $y.0$2;
    assert {:tag "predicatedEquality"} _b95 ==> p14$1 && p14$2 ==> $density.1$1 == $density.1$2;
    assert {:tag "predicatedEquality"} _b94 ==> p14$1 && p14$2 ==> $pt.1$1 == $pt.1$2;
    assert {:tag "loopPredicateEquality"} _b93 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p14$1 == p14$2;
    assert {:tag "loopPredicateEquality"} _b92 ==> p14$1 == p14$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p14$1 ==> p12$1;
    assert p14$2 ==> p12$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b16 ==> _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> BV32_SLE($z.0$1, $5$1);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b15 ==> _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> BV32_SLE($z.0$1, $5$1);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p14$1 ==> _b14 ==> p14$1 ==> BV32_SLE($z.0$1, $5$1);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p14$2 ==> _b14 ==> p14$2 ==> BV32_SLE($z.0$2, $5$2);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b13 ==> BV32_SLE($z.0$1, $5$1) && BV32_SLE($y.0$1, $3$1) ==> p14$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b13 ==> BV32_SLE($z.0$2, $5$2) && BV32_SLE($y.0$2, $3$2) ==> p14$2;
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b12 ==> BV32_UGE($y.0$1, $2$1);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b12 ==> BV32_UGE($y.0$2, $2$2);
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b11 ==> BV32_ULE($y.0$1, $2$1);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b11 ==> BV32_ULE($y.0$2, $2$2);
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b10 ==> BV32_SGE($y.0$1, $2$1);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b10 ==> BV32_SGE($y.0$2, $2$2);
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b9 ==> BV32_SLE($y.0$1, $2$1);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b9 ==> BV32_SLE($y.0$2, $2$2);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p14$1 ==> _b8 ==> BV32_SUB($y.0$1, $2$1) == BV32_SUB($y.0$2, $2$2);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p14$2 ==> _b8 ==> BV32_SUB($y.0$2, $2$2) == BV32_SUB($y.0$1, $2$1);
    assert {:tag "guardNonNeg"} {:thread 1} p14$1 ==> _b7 ==> BV32_SLE(0bv32, $y.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p14$2 ==> _b7 ==> BV32_SLE(0bv32, $y.0$2);
    assert {:block_sourceloc} {:sourceloc_num 21} p14$1 ==> true;
    v21$1 := (if p14$1 then BV32_SLE($y.0$1, $3$1) else v21$1);
    v21$2 := (if p14$2 then BV32_SLE($y.0$2, $3$2) else v21$2);
    p15$1 := false;
    p15$2 := false;
    p16$1 := false;
    p16$2 := false;
    p15$1 := (if p14$1 && v21$1 then v21$1 else p15$1);
    p15$2 := (if p14$2 && v21$2 then v21$2 else p15$2);
    p14$1 := (if p14$1 && !v21$1 then v21$1 else p14$1);
    p14$2 := (if p14$2 && !v21$2 then v21$2 else p14$2);
    v22$1 := (if p15$1 then BV32_MUL($z.0$1, 65536bv32) else v22$1);
    v22$2 := (if p15$2 then BV32_MUL($z.0$2, 65536bv32) else v22$2);
    v23$1 := (if p15$1 then BV32_MUL($y.0$1, 256bv32) else v23$1);
    v23$2 := (if p15$2 then BV32_MUL($y.0$2, 256bv32) else v23$2);
    v24$1 := (if p15$1 then $$binStartAddr_g[BV32_ADD(BV32_ADD(v22$1, v23$1), $0$1)] else v24$1);
    v24$2 := (if p15$2 then $$binStartAddr_g[BV32_ADD(BV32_ADD(v22$2, v23$2), $0$2)] else v24$2);
    v25$1 := (if p15$1 then $$binStartAddr_g[BV32_ADD(BV32_ADD(BV32_ADD(v22$1, v23$1), $1$1), 1bv32)] else v25$1);
    v25$2 := (if p15$2 then $$binStartAddr_g[BV32_ADD(BV32_ADD(BV32_ADD(v22$2, v23$2), $1$2), 1bv32)] else v25$2);
    v26$1 := (if p15$1 then BV32_SUB(v25$1, v24$1) else v26$1);
    v26$2 := (if p15$2 then BV32_SUB(v25$2, v24$2) else v26$2);
    $pt.2$1, $density.2$1, $x.0$1 := (if p15$1 then $pt.1$1 else $pt.2$1), (if p15$1 then $density.1$1 else $density.2$1), (if p15$1 then 0bv32 else $x.0$1);
    $pt.2$2, $density.2$2, $x.0$2 := (if p15$2 then $pt.1$2 else $pt.2$2), (if p15$2 then $density.1$2 else $density.2$2), (if p15$2 then 0bv32 else $x.0$2);
    p16$1 := (if p15$1 then true else p16$1);
    p16$2 := (if p15$2 then true else p16$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto __partitioned_block_$23_0;

  __partitioned_block_$23_0:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b190 ==> _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> _WATCHED_OFFSET == BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 1bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 2bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 3bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 4bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(local_id_z$1, group_size_y), group_size_x), BV32_MUL(local_id_y$1, group_size_x)), local_id_x$1), 6bv32), 5bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b189 ==> _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_MUL(0bv32, 6bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 5bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 4bv32));
    assert {:tag "nowrite"} _b188 ==> !_WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin;
    assert {:tag "noread"} _b187 ==> !_READ_HAS_OCCURRED_$$gridding_GPU.sharedBin;
    assert {:tag "predicatedEquality"} _b186 ==> p16$1 && p16$2 ==> v54$1 == v54$2;
    assert {:tag "predicatedEquality"} _b185 ==> p16$1 && p16$2 ==> v53$1 == v53$2;
    assert {:tag "predicatedEquality"} _b184 ==> p16$1 && p16$2 ==> v52$1 == v52$2;
    assert {:tag "predicatedEquality"} _b183 ==> p16$1 && p16$2 ==> v51$1 == v51$2;
    assert {:tag "predicatedEquality"} _b182 ==> p16$1 && p16$2 ==> v50$1 == v50$2;
    assert {:tag "predicatedEquality"} _b181 ==> p16$1 && p16$2 ==> v49$1 == v49$2;
    assert {:tag "predicatedEquality"} _b180 ==> p16$1 && p16$2 ==> v48$1 == v48$2;
    assert {:tag "predicatedEquality"} _b179 ==> p16$1 && p16$2 ==> v47$1 == v47$2;
    assert {:tag "predicatedEquality"} _b178 ==> p16$1 && p16$2 ==> v46$1 == v46$2;
    assert {:tag "predicatedEquality"} _b177 ==> p16$1 && p16$2 ==> v45$1 == v45$2;
    assert {:tag "predicatedEquality"} _b176 ==> p16$1 && p16$2 ==> v44$1 == v44$2;
    assert {:tag "predicatedEquality"} _b175 ==> p16$1 && p16$2 ==> v43$1 == v43$2;
    assert {:tag "predicatedEquality"} _b174 ==> p16$1 && p16$2 ==> v42$1 == v42$2;
    assert {:tag "predicatedEquality"} _b173 ==> p16$1 && p16$2 ==> v41$1 == v41$2;
    assert {:tag "predicatedEquality"} _b172 ==> p16$1 && p16$2 ==> v40$1 == v40$2;
    assert {:tag "predicatedEquality"} _b171 ==> p16$1 && p16$2 ==> v39$1 == v39$2;
    assert {:tag "predicatedEquality"} _b170 ==> p16$1 && p16$2 ==> v38$1 == v38$2;
    assert {:tag "predicatedEquality"} _b169 ==> p16$1 && p16$2 ==> v37$1 == v37$2;
    assert {:tag "predicatedEquality"} _b168 ==> p16$1 && p16$2 ==> v36$1 == v36$2;
    assert {:tag "predicatedEquality"} _b167 ==> p16$1 && p16$2 ==> v35$1 == v35$2;
    assert {:tag "predicatedEquality"} _b166 ==> p16$1 && p16$2 ==> v34$1 == v34$2;
    assert {:tag "predicatedEquality"} _b165 ==> p16$1 && p16$2 ==> v33$1 == v33$2;
    assert {:tag "predicatedEquality"} _b164 ==> p16$1 && p16$2 ==> v32$1 == v32$2;
    assert {:tag "predicatedEquality"} _b163 ==> p16$1 && p16$2 ==> v31$1 == v31$2;
    assert {:tag "predicatedEquality"} _b162 ==> p16$1 && p16$2 ==> v30$1 == v30$2;
    assert {:tag "predicatedEquality"} _b161 ==> p16$1 && p16$2 ==> v29$1 == v29$2;
    assert {:tag "predicatedEquality"} _b160 ==> p16$1 && p16$2 ==> v28$1 == v28$2;
    assert {:tag "predicatedEquality"} _b159 ==> p16$1 && p16$2 ==> v27$1 == v27$2;
    assert {:tag "predicatedEquality"} _b158 ==> p16$1 && p16$2 ==> $density.4$1 == $density.4$2;
    assert {:tag "predicatedEquality"} _b157 ==> p16$1 && p16$2 ==> $pt.4$1 == $pt.4$2;
    assert {:tag "predicatedEquality"} _b156 ==> p16$1 && p16$2 ==> $density.5$1 == $density.5$2;
    assert {:tag "predicatedEquality"} _b155 ==> p16$1 && p16$2 ==> $pt.5$1 == $pt.5$2;
    assert {:tag "predicatedEquality"} _b154 ==> p16$1 && p16$2 ==> $j.0$1 == $j.0$2;
    assert {:tag "predicatedEquality"} _b153 ==> p16$1 && p16$2 ==> $density.3$1 == $density.3$2;
    assert {:tag "predicatedEquality"} _b152 ==> p16$1 && p16$2 ==> $pt.3$1 == $pt.3$2;
    assert {:tag "predicatedEquality"} _b151 ==> p16$1 && p16$2 ==> $6$1 == $6$2;
    assert {:tag "predicatedEquality"} _b150 ==> p16$1 && p16$2 ==> $x.0$1 == $x.0$2;
    assert {:tag "predicatedEquality"} _b149 ==> p16$1 && p16$2 ==> $density.2$1 == $density.2$2;
    assert {:tag "predicatedEquality"} _b148 ==> p16$1 && p16$2 ==> $pt.2$1 == $pt.2$2;
    assert {:tag "loopPredicateEquality"} _b147 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p16$1 == p16$2;
    assert {:tag "loopPredicateEquality"} _b146 ==> p16$1 == p16$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p16$1 ==> p14$1;
    assert p16$2 ==> p14$2;
    assert p14$1 ==> p12$1;
    assert p14$2 ==> p12$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b25 ==> _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> BV32_SLE($z.0$1, $5$1) && BV32_SLE($y.0$1, $3$1);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b24 ==> _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> BV32_SLE($z.0$1, $5$1) && BV32_SLE($y.0$1, $3$1);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p16$1 ==> _b23 ==> p16$1 ==> BV32_SLE($z.0$1, $5$1) && BV32_SLE($y.0$1, $3$1);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p16$2 ==> _b23 ==> p16$2 ==> BV32_SLE($z.0$2, $5$2) && BV32_SLE($y.0$2, $3$2);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b22 ==> BV32_SLE($z.0$1, $5$1) && BV32_SLE($y.0$1, $3$1) && BV32_ULT($x.0$1, BV32_LSHR(BV32_SUB(BV32_ADD(BV32_SUB(v25$1, v24$1), 64bv32), 1bv32), 6bv32)) ==> p16$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b22 ==> BV32_SLE($z.0$2, $5$2) && BV32_SLE($y.0$2, $3$2) && BV32_ULT($x.0$2, BV32_LSHR(BV32_SUB(BV32_ADD(BV32_SUB(v25$2, v24$2), 64bv32), 1bv32), 6bv32)) ==> p16$2;
    assert {:tag "loopBound"} {:thread 1} p16$1 ==> _b21 ==> BV32_UGE($x.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p16$2 ==> _b21 ==> BV32_UGE($x.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p16$1 ==> _b20 ==> BV32_ULE($x.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p16$2 ==> _b20 ==> BV32_ULE($x.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p16$1 ==> _b19 ==> BV32_SGE($x.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p16$2 ==> _b19 ==> BV32_SGE($x.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p16$1 ==> _b18 ==> BV32_SLE($x.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p16$2 ==> _b18 ==> BV32_SLE($x.0$2, 0bv32);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p16$1 ==> _b17 ==> BV32_SUB($x.0$1, 0bv32) == BV32_SUB($x.0$2, 0bv32);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p16$2 ==> _b17 ==> BV32_SUB($x.0$2, 0bv32) == BV32_SUB($x.0$1, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 25} p16$1 ==> true;
    v27$1 := (if p16$1 then BV32_ULT($x.0$1, BV32_LSHR(BV32_SUB(BV32_ADD(v26$1, 64bv32), 1bv32), 6bv32)) else v27$1);
    v27$2 := (if p16$2 then BV32_ULT($x.0$2, BV32_LSHR(BV32_SUB(BV32_ADD(v26$2, 64bv32), 1bv32), 6bv32)) else v27$2);
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
    p17$1 := (if p16$1 && v27$1 then v27$1 else p17$1);
    p17$2 := (if p16$2 && v27$2 then v27$2 else p17$2);
    p16$1 := (if p16$1 && !v27$1 then v27$1 else p16$1);
    p16$2 := (if p16$2 && !v27$2 then v27$2 else p16$2);
    v28$1 := (if p17$1 then BV32_UGT(BV32_SUB(v26$1, BV32_SHL($x.0$1, 6bv32)), 64bv32) else v28$1);
    v28$2 := (if p17$2 then BV32_UGT(BV32_SUB(v26$2, BV32_SHL($x.0$2, 6bv32)), 64bv32) else v28$2);
    p19$1 := (if p17$1 && v28$1 then v28$1 else p19$1);
    p19$2 := (if p17$2 && v28$2 then v28$2 else p19$2);
    p18$1 := (if p17$1 && !v28$1 then !v28$1 else p18$1);
    p18$2 := (if p17$2 && !v28$2 then !v28$2 else p18$2);
    $6$1 := (if p18$1 then BV32_SUB(v26$1, BV32_SHL($x.0$1, 6bv32)) else $6$1);
    $6$2 := (if p18$2 then BV32_SUB(v26$2, BV32_SHL($x.0$2, 6bv32)) else $6$2);
    $6$1 := (if p19$1 then 64bv32 else $6$1);
    $6$2 := (if p19$2 then 64bv32 else $6$2);
    goto __partitioned_block_$23_1;

  __partitioned_block_$23_1:
    call {:sourceloc_num 30} $bugle_barrier_duplicated_0(1bv1, 0bv1, p17$1, p17$2);
    v29$1 := (if p17$1 then BV32_SLT(v0$1, $6$1) else v29$1);
    v29$2 := (if p17$2 then BV32_SLT(v0$2, $6$2) else v29$2);
    p21$1 := (if p17$1 && v29$1 then v29$1 else p21$1);
    p21$2 := (if p17$2 && v29$2 then v29$2 else p21$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v30$1 := (if p21$1 then _HAVOC_bv32$1 else v30$1);
    v30$2 := (if p21$2 then _HAVOC_bv32$2 else v30$2);
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$gridding_GPU.sharedBin(p21$1, BV32_MUL(v0$1, 6bv32), v30$1, $$gridding_GPU.sharedBin[1bv1][BV32_MUL(v0$1, 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin(p21$2, BV32_MUL(v0$2, 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$gridding_GPU.sharedBin(p21$2, BV32_MUL(v0$2, 6bv32), v30$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gridding_GPU.sharedBin"} true;
    $$gridding_GPU.sharedBin[1bv1][BV32_MUL(v0$1, 6bv32)] := (if p21$1 then v30$1 else $$gridding_GPU.sharedBin[1bv1][BV32_MUL(v0$1, 6bv32)]);
    $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v0$2, 6bv32)] := (if p21$2 then v30$2 else $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v0$2, 6bv32)]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v31$1 := (if p21$1 then _HAVOC_bv32$1 else v31$1);
    v31$2 := (if p21$2 then _HAVOC_bv32$2 else v31$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$gridding_GPU.sharedBin(p21$1, BV32_ADD(BV32_MUL(v0$1, 6bv32), 1bv32), v31$1, $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin(p21$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$gridding_GPU.sharedBin(p21$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 1bv32), v31$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gridding_GPU.sharedBin"} true;
    $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 1bv32)] := (if p21$1 then v31$1 else $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 1bv32)]);
    $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 6bv32), 1bv32)] := (if p21$2 then v31$2 else $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 6bv32), 1bv32)]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v32$1 := (if p21$1 then _HAVOC_bv32$1 else v32$1);
    v32$2 := (if p21$2 then _HAVOC_bv32$2 else v32$2);
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$gridding_GPU.sharedBin(p21$1, BV32_ADD(BV32_MUL(v0$1, 6bv32), 2bv32), v32$1, $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin(p21$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$gridding_GPU.sharedBin(p21$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 2bv32), v32$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gridding_GPU.sharedBin"} true;
    $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 2bv32)] := (if p21$1 then v32$1 else $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 2bv32)]);
    $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 6bv32), 2bv32)] := (if p21$2 then v32$2 else $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 6bv32), 2bv32)]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v33$1 := (if p21$1 then _HAVOC_bv32$1 else v33$1);
    v33$2 := (if p21$2 then _HAVOC_bv32$2 else v33$2);
    call {:sourceloc} {:sourceloc_num 39} _LOG_WRITE_$$gridding_GPU.sharedBin(p21$1, BV32_ADD(BV32_MUL(v0$1, 6bv32), 3bv32), v33$1, $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin(p21$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 39} _CHECK_WRITE_$$gridding_GPU.sharedBin(p21$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 3bv32), v33$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gridding_GPU.sharedBin"} true;
    $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 3bv32)] := (if p21$1 then v33$1 else $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 3bv32)]);
    $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 6bv32), 3bv32)] := (if p21$2 then v33$2 else $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 6bv32), 3bv32)]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v34$1 := (if p21$1 then _HAVOC_bv32$1 else v34$1);
    v34$2 := (if p21$2 then _HAVOC_bv32$2 else v34$2);
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$gridding_GPU.sharedBin(p21$1, BV32_ADD(BV32_MUL(v0$1, 6bv32), 4bv32), v34$1, $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin(p21$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$gridding_GPU.sharedBin(p21$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 4bv32), v34$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gridding_GPU.sharedBin"} true;
    $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 4bv32)] := (if p21$1 then v34$1 else $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 4bv32)]);
    $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 6bv32), 4bv32)] := (if p21$2 then v34$2 else $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 6bv32), 4bv32)]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v35$1 := (if p21$1 then _HAVOC_bv32$1 else v35$1);
    v35$2 := (if p21$2 then _HAVOC_bv32$2 else v35$2);
    call {:sourceloc} {:sourceloc_num 43} _LOG_WRITE_$$gridding_GPU.sharedBin(p21$1, BV32_ADD(BV32_MUL(v0$1, 6bv32), 5bv32), v35$1, $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin(p21$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 43} _CHECK_WRITE_$$gridding_GPU.sharedBin(p21$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 5bv32), v35$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gridding_GPU.sharedBin"} true;
    $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 5bv32)] := (if p21$1 then v35$1 else $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL(v0$1, 6bv32), 5bv32)]);
    $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 6bv32), 5bv32)] := (if p21$2 then v35$2 else $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 6bv32), 5bv32)]);
    goto __partitioned_block_$23_2;

  __partitioned_block_$23_2:
    call {:sourceloc_num 45} $bugle_barrier_duplicated_1(1bv1, 0bv1, p17$1, p17$2);
    $pt.3$1, $density.3$1, $j.0$1 := (if p17$1 then $pt.2$1 else $pt.3$1), (if p17$1 then $density.2$1 else $density.3$1), (if p17$1 then 0bv32 else $j.0$1);
    $pt.3$2, $density.3$2, $j.0$2 := (if p17$2 then $pt.2$2 else $pt.3$2), (if p17$2 then $density.2$2 else $density.3$2), (if p17$2 then 0bv32 else $j.0$2);
    p22$1 := (if p17$1 then true else p22$1);
    p22$2 := (if p17$2 then true else p22$2);
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $30;

  $30:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b191 ==> _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_MUL(0bv32, 6bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 5bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 6bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 6bv32), 4bv32));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p22$1 ==> p16$1;
    assert p22$2 ==> p16$2;
    assert p16$1 ==> p14$1;
    assert p16$2 ==> p14$2;
    assert p14$1 ==> p12$1;
    assert p14$2 ==> p12$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b33 ==> _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin ==> BV32_SLE($z.0$1, $5$1) && BV32_SLE($y.0$1, $3$1) && BV32_ULT($x.0$1, BV32_LSHR(BV32_SUB(BV32_ADD(BV32_SUB(v25$1, v24$1), 64bv32), 1bv32), 6bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p22$1 ==> _b32 ==> p22$1 ==> BV32_SLE($z.0$1, $5$1) && BV32_SLE($y.0$1, $3$1) && BV32_ULT($x.0$1, BV32_LSHR(BV32_SUB(BV32_ADD(BV32_SUB(v25$1, v24$1), 64bv32), 1bv32), 6bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p22$2 ==> _b32 ==> p22$2 ==> BV32_SLE($z.0$2, $5$2) && BV32_SLE($y.0$2, $3$2) && BV32_ULT($x.0$2, BV32_LSHR(BV32_SUB(BV32_ADD(BV32_SUB(v25$2, v24$2), 64bv32), 1bv32), 6bv32));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b31 ==> BV32_SLE($z.0$1, $5$1) && BV32_SLE($y.0$1, $3$1) && BV32_ULT($x.0$1, BV32_LSHR(BV32_SUB(BV32_ADD(BV32_SUB(v25$1, v24$1), 64bv32), 1bv32), 6bv32)) && BV32_SLT($j.0$1, $6$1) ==> p22$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b31 ==> BV32_SLE($z.0$2, $5$2) && BV32_SLE($y.0$2, $3$2) && BV32_ULT($x.0$2, BV32_LSHR(BV32_SUB(BV32_ADD(BV32_SUB(v25$2, v24$2), 64bv32), 1bv32), 6bv32)) && BV32_SLT($j.0$2, $6$2) ==> p22$2;
    assert {:tag "loopBound"} {:thread 1} p22$1 ==> _b30 ==> BV32_UGE($j.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p22$2 ==> _b30 ==> BV32_UGE($j.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p22$1 ==> _b29 ==> BV32_ULE($j.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p22$2 ==> _b29 ==> BV32_ULE($j.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p22$1 ==> _b28 ==> BV32_SGE($j.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p22$2 ==> _b28 ==> BV32_SGE($j.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p22$1 ==> _b27 ==> BV32_SLE($j.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p22$2 ==> _b27 ==> BV32_SLE($j.0$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p22$1 ==> _b26 ==> BV32_SLE(0bv32, $j.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p22$2 ==> _b26 ==> BV32_SLE(0bv32, $j.0$2);
    assert {:block_sourceloc} {:sourceloc_num 46} p22$1 ==> true;
    v36$1 := (if p22$1 then BV32_SLT($j.0$1, $6$1) else v36$1);
    v36$2 := (if p22$2 then BV32_SLT($j.0$2, $6$2) else v36$2);
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
    p23$1 := (if p22$1 && v36$1 then v36$1 else p23$1);
    p23$2 := (if p22$2 && v36$2 then v36$2 else p23$2);
    p22$1 := (if p22$1 && !v36$1 then v36$1 else p22$1);
    p22$2 := (if p22$2 && !v36$2 then v36$2 else p22$2);
    call {:sourceloc} {:sourceloc_num 48} _LOG_READ_$$gridding_GPU.sharedBin(p23$1, BV32_MUL($j.0$1, 6bv32), $$gridding_GPU.sharedBin[1bv1][BV32_MUL($j.0$1, 6bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 48} _CHECK_READ_$$gridding_GPU.sharedBin(p23$2, BV32_MUL($j.0$2, 6bv32), $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($j.0$2, 6bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gridding_GPU.sharedBin"} true;
    v37$1 := (if p23$1 then $$gridding_GPU.sharedBin[1bv1][BV32_MUL($j.0$1, 6bv32)] else v37$1);
    v37$2 := (if p23$2 then $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($j.0$2, 6bv32)] else v37$2);
    call {:sourceloc} {:sourceloc_num 49} _LOG_READ_$$gridding_GPU.sharedBin(p23$1, BV32_ADD(BV32_MUL($j.0$1, 6bv32), 1bv32), $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 49} _CHECK_READ_$$gridding_GPU.sharedBin(p23$2, BV32_ADD(BV32_MUL($j.0$2, 6bv32), 1bv32), $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gridding_GPU.sharedBin"} true;
    v38$1 := (if p23$1 then $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 1bv32)] else v38$1);
    v38$2 := (if p23$2 then $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 1bv32)] else v38$2);
    call {:sourceloc} {:sourceloc_num 50} _LOG_READ_$$gridding_GPU.sharedBin(p23$1, BV32_ADD(BV32_MUL($j.0$1, 6bv32), 5bv32), $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 5bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 50} _CHECK_READ_$$gridding_GPU.sharedBin(p23$2, BV32_ADD(BV32_MUL($j.0$2, 6bv32), 5bv32), $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 5bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gridding_GPU.sharedBin"} true;
    v39$1 := (if p23$1 then $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 5bv32)] else v39$1);
    v39$2 := (if p23$2 then $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 5bv32)] else v39$2);
    v40$1 := (if p23$1 then FLT32(0bv32, v37$1) || FLT32(v37$1, 0bv32) || FUNO32(v37$1, 0bv32) else v40$1);
    v40$2 := (if p23$2 then FLT32(0bv32, v37$2) || FLT32(v37$2, 0bv32) || FUNO32(v37$2, 0bv32) else v40$2);
    p28$1 := (if p23$1 && v40$1 then v40$1 else p28$1);
    p28$2 := (if p23$2 && v40$2 then v40$2 else p28$2);
    p25$1 := (if p23$1 && !v40$1 then !v40$1 else p25$1);
    p25$2 := (if p23$2 && !v40$2 then !v40$2 else p25$2);
    p28$1 := (if p24$1 then true else p28$1);
    p28$2 := (if p24$2 then true else p28$2);
    v41$1 := (if p25$1 then FLT32(0bv32, v38$1) || FLT32(v38$1, 0bv32) || FUNO32(v38$1, 0bv32) else v41$1);
    v41$2 := (if p25$2 then FLT32(0bv32, v38$2) || FLT32(v38$2, 0bv32) || FUNO32(v38$2, 0bv32) else v41$2);
    p28$1 := (if p25$1 && v41$1 then v41$1 else p28$1);
    p28$2 := (if p25$2 && v41$2 then v41$2 else p28$2);
    p26$1 := (if p25$1 && !v41$1 then !v41$1 else p26$1);
    p26$2 := (if p25$2 && !v41$2 then !v41$2 else p26$2);
    $pt.5$1, $density.5$1 := (if p26$1 then $pt.3$1 else $pt.5$1), (if p26$1 then $density.3$1 else $density.5$1);
    $pt.5$2, $density.5$2 := (if p26$2 then $pt.3$2 else $pt.5$2), (if p26$2 then $density.3$2 else $density.5$2);
    p28$1 := (if p27$1 then true else p28$1);
    p28$2 := (if p27$2 then true else p28$2);
    v42$1 := (if p28$1 then FLT32(0bv32, v39$1) || FLT32(v39$1, 0bv32) || FUNO32(v39$1, 0bv32) else v42$1);
    v42$2 := (if p28$2 then FLT32(0bv32, v39$2) || FLT32(v39$2, 0bv32) || FUNO32(v39$2, 0bv32) else v42$2);
    p30$1 := (if p28$1 && v42$1 then v42$1 else p30$1);
    p30$2 := (if p28$2 && v42$2 then v42$2 else p30$2);
    p29$1 := (if p28$1 && !v42$1 then !v42$1 else p29$1);
    p29$2 := (if p28$2 && !v42$2 then !v42$2 else p29$2);
    $pt.5$1, $density.5$1 := (if p29$1 then $pt.3$1 else $pt.5$1), (if p29$1 then $density.3$1 else $density.5$1);
    $pt.5$2, $density.5$2 := (if p29$2 then $pt.3$2 else $pt.5$2), (if p29$2 then $density.3$2 else $density.5$2);
    call {:sourceloc} {:sourceloc_num 54} _LOG_READ_$$gridding_GPU.sharedBin(p30$1, BV32_ADD(BV32_MUL($j.0$1, 6bv32), 2bv32), $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 54} _CHECK_READ_$$gridding_GPU.sharedBin(p30$2, BV32_ADD(BV32_MUL($j.0$2, 6bv32), 2bv32), $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gridding_GPU.sharedBin"} true;
    v43$1 := (if p30$1 then $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 2bv32)] else v43$1);
    v43$2 := (if p30$2 then $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 2bv32)] else v43$2);
    call {:sourceloc} {:sourceloc_num 55} _LOG_READ_$$gridding_GPU.sharedBin(p30$1, BV32_ADD(BV32_MUL($j.0$1, 6bv32), 2bv32), $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 55} _CHECK_READ_$$gridding_GPU.sharedBin(p30$2, BV32_ADD(BV32_MUL($j.0$2, 6bv32), 2bv32), $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gridding_GPU.sharedBin"} true;
    v44$1 := (if p30$1 then $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 2bv32)] else v44$1);
    v44$2 := (if p30$2 then $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 2bv32)] else v44$2);
    call {:sourceloc} {:sourceloc_num 56} _LOG_READ_$$gridding_GPU.sharedBin(p30$1, BV32_ADD(BV32_MUL($j.0$1, 6bv32), 3bv32), $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 56} _CHECK_READ_$$gridding_GPU.sharedBin(p30$2, BV32_ADD(BV32_MUL($j.0$2, 6bv32), 3bv32), $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gridding_GPU.sharedBin"} true;
    v45$1 := (if p30$1 then $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 3bv32)] else v45$1);
    v45$2 := (if p30$2 then $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 3bv32)] else v45$2);
    call {:sourceloc} {:sourceloc_num 57} _LOG_READ_$$gridding_GPU.sharedBin(p30$1, BV32_ADD(BV32_MUL($j.0$1, 6bv32), 3bv32), $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 57} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 57} _CHECK_READ_$$gridding_GPU.sharedBin(p30$2, BV32_ADD(BV32_MUL($j.0$2, 6bv32), 3bv32), $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gridding_GPU.sharedBin"} true;
    v46$1 := (if p30$1 then $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 3bv32)] else v46$1);
    v46$2 := (if p30$2 then $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 3bv32)] else v46$2);
    call {:sourceloc} {:sourceloc_num 58} _LOG_READ_$$gridding_GPU.sharedBin(p30$1, BV32_ADD(BV32_MUL($j.0$1, 6bv32), 4bv32), $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 58} _CHECK_READ_$$gridding_GPU.sharedBin(p30$2, BV32_ADD(BV32_MUL($j.0$2, 6bv32), 4bv32), $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gridding_GPU.sharedBin"} true;
    v47$1 := (if p30$1 then $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 4bv32)] else v47$1);
    v47$2 := (if p30$2 then $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 4bv32)] else v47$2);
    call {:sourceloc} {:sourceloc_num 59} _LOG_READ_$$gridding_GPU.sharedBin(p30$1, BV32_ADD(BV32_MUL($j.0$1, 6bv32), 4bv32), $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 59} _CHECK_READ_$$gridding_GPU.sharedBin(p30$2, BV32_ADD(BV32_MUL($j.0$2, 6bv32), 4bv32), $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$gridding_GPU.sharedBin"} true;
    v48$1 := (if p30$1 then $$gridding_GPU.sharedBin[1bv1][BV32_ADD(BV32_MUL($j.0$1, 6bv32), 4bv32)] else v48$1);
    v48$2 := (if p30$2 then $$gridding_GPU.sharedBin[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 6bv32), 4bv32)] else v48$2);
    v49$1 := (if p30$1 then FADD32(FADD32(FMUL32(FSUB32(v43$1, SI32_TO_FP32(v4$1)), FSUB32(v44$1, SI32_TO_FP32(v4$1))), FMUL32(FSUB32(v45$1, SI32_TO_FP32(v5$1)), FSUB32(v46$1, SI32_TO_FP32(v5$1)))), FMUL32(FSUB32(v47$1, SI32_TO_FP32(v6$1)), FSUB32(v48$1, SI32_TO_FP32(v6$1)))) else v49$1);
    v49$2 := (if p30$2 then FADD32(FADD32(FMUL32(FSUB32(v43$2, SI32_TO_FP32(v4$2)), FSUB32(v44$2, SI32_TO_FP32(v4$2))), FMUL32(FSUB32(v45$2, SI32_TO_FP32(v5$2)), FSUB32(v46$2, SI32_TO_FP32(v5$2)))), FMUL32(FSUB32(v47$2, SI32_TO_FP32(v6$2)), FSUB32(v48$2, SI32_TO_FP32(v6$2)))) else v49$2);
    v50$1 := (if p30$1 then FLT64(FP32_CONV64(v49$1), 4618722892845154304bv64) else v50$1);
    v50$2 := (if p30$2 then FLT64(FP32_CONV64(v49$2), 4618722892845154304bv64) else v50$2);
    p32$1 := (if p30$1 && v50$1 then v50$1 else p32$1);
    p32$2 := (if p30$2 && v50$2 then v50$2 else p32$2);
    p31$1 := (if p30$1 && !v50$1 then !v50$1 else p31$1);
    p31$2 := (if p30$2 && !v50$2 then !v50$2 else p31$2);
    $pt.4$1, $density.4$1 := (if p31$1 then $pt.3$1 else $pt.4$1), (if p31$1 then $density.3$1 else $density.4$1);
    $pt.4$2, $density.4$2 := (if p31$2 then $pt.3$2 else $pt.4$2), (if p31$2 then $density.3$2 else $density.4$2);
    v51$1 := (if p32$1 then FP64_CONV32(FMUL64(FP32_CONV64($beta), FSQRT64(FADD64(FMUL64(FSUB64(9223372036854775808bv64, FP32_CONV64(v49$1)), 4594932627813569659bv64), 4607182418800017408bv64)))) else v51$1);
    v51$2 := (if p32$2 then FP64_CONV32(FMUL64(FP32_CONV64($beta), FSQRT64(FADD64(FMUL64(FSUB64(9223372036854775808bv64, FP32_CONV64(v49$2)), 4594932627813569659bv64), 4607182418800017408bv64)))) else v51$2);
    v52$1 := (if p32$1 then FMUL32(v51$1, v51$1) else v52$1);
    v52$2 := (if p32$2 then FMUL32(v51$2, v51$2) else v52$2);
    v53$1 := (if p32$1 then FMUL32(FDIV32(FSUB32(2147483648bv32, FADD32(FMUL32(v52$1, FADD32(FMUL32(v52$1, FADD32(FMUL32(v52$1, FADD32(FMUL32(v52$1, FADD32(FMUL32(v52$1, FADD32(FMUL32(v52$1, FADD32(FMUL32(v52$1, FADD32(FMUL32(v52$1, FADD32(FMUL32(v52$1, FADD32(FMUL32(v52$1, FADD32(FMUL32(v52$1, FADD32(FMUL32(v52$1, FADD32(FMUL32(v52$1, FADD32(FMUL32(v52$1, 432777539bv32), 523487654bv32)), 610081361bv32)), 692319900bv32)), 772037077bv32)), 847880648bv32)), 920370152bv32)), 990168357bv32)), 1055725654bv32)), 1117183506bv32)), 1174523828bv32)), 1225494738bv32)), 1269111979bv32)), 1302990772bv32)), 1319876621bv32)), FADD32(FMUL32(v52$1, FADD32(FMUL32(v52$1, FSUB32(v52$1, 1161840514bv32)), 1247030429bv32)), 3467360269bv32)), v39$1) else v53$1);
    v53$2 := (if p32$2 then FMUL32(FDIV32(FSUB32(2147483648bv32, FADD32(FMUL32(v52$2, FADD32(FMUL32(v52$2, FADD32(FMUL32(v52$2, FADD32(FMUL32(v52$2, FADD32(FMUL32(v52$2, FADD32(FMUL32(v52$2, FADD32(FMUL32(v52$2, FADD32(FMUL32(v52$2, FADD32(FMUL32(v52$2, FADD32(FMUL32(v52$2, FADD32(FMUL32(v52$2, FADD32(FMUL32(v52$2, FADD32(FMUL32(v52$2, FADD32(FMUL32(v52$2, 432777539bv32), 523487654bv32)), 610081361bv32)), 692319900bv32)), 772037077bv32)), 847880648bv32)), 920370152bv32)), 990168357bv32)), 1055725654bv32)), 1117183506bv32)), 1174523828bv32)), 1225494738bv32)), 1269111979bv32)), 1302990772bv32)), 1319876621bv32)), FADD32(FMUL32(v52$2, FADD32(FMUL32(v52$2, FSUB32(v52$2, 1161840514bv32)), 1247030429bv32)), 3467360269bv32)), v39$2) else v53$2);
    v54$1 := (if p32$1 then $pt.3$1[64:32] else v54$1);
    v54$2 := (if p32$2 then $pt.3$2[64:32] else v54$2);
    $pt.4$1, $density.4$1 := (if p32$1 then FADD32(v54$1, FMUL32(v53$1, v38$1)) ++ FADD32($pt.3$1[32:0], FMUL32(v53$1, v37$1)) else $pt.4$1), (if p32$1 then FADD32($density.3$1, 1065353216bv32) else $density.4$1);
    $pt.4$2, $density.4$2 := (if p32$2 then FADD32(v54$2, FMUL32(v53$2, v38$2)) ++ FADD32($pt.3$2[32:0], FMUL32(v53$2, v37$2)) else $pt.4$2), (if p32$2 then FADD32($density.3$2, 1065353216bv32) else $density.4$2);
    $pt.5$1, $density.5$1 := (if p30$1 then $pt.4$1 else $pt.5$1), (if p30$1 then $density.4$1 else $density.5$1);
    $pt.5$2, $density.5$2 := (if p30$2 then $pt.4$2 else $pt.5$2), (if p30$2 then $density.4$2 else $density.5$2);
    $pt.3$1, $density.3$1, $j.0$1 := (if p23$1 then $pt.5$1 else $pt.3$1), (if p23$1 then $density.5$1 else $density.3$1), (if p23$1 then BV32_ADD($j.0$1, 1bv32) else $j.0$1);
    $pt.3$2, $density.3$2, $j.0$2 := (if p23$2 then $pt.5$2 else $pt.3$2), (if p23$2 then $density.5$2 else $density.3$2), (if p23$2 then BV32_ADD($j.0$2, 1bv32) else $j.0$2);
    p22$1 := (if p23$1 then true else p22$1);
    p22$2 := (if p23$2 then true else p22$2);
    goto $30.backedge, $30.tail;

  $30.tail:
    assume !p22$1 && !p22$2;
    $pt.2$1, $density.2$1, $x.0$1 := (if p17$1 then $pt.3$1 else $pt.2$1), (if p17$1 then $density.3$1 else $density.2$1), (if p17$1 then BV32_ADD($x.0$1, 1bv32) else $x.0$1);
    $pt.2$2, $density.2$2, $x.0$2 := (if p17$2 then $pt.3$2 else $pt.2$2), (if p17$2 then $density.3$2 else $density.2$2), (if p17$2 then BV32_ADD($x.0$2, 1bv32) else $x.0$2);
    p16$1 := (if p17$1 then true else p16$1);
    p16$2 := (if p17$2 then true else p16$2);
    goto $23.backedge, $23.tail;

  $23.tail:
    assume !p16$1 && !p16$2;
    $pt.1$1, $density.1$1, $y.0$1 := (if p15$1 then $pt.2$1 else $pt.1$1), (if p15$1 then $density.2$1 else $density.1$1), (if p15$1 then BV32_ADD($y.0$1, 1bv32) else $y.0$1);
    $pt.1$2, $density.1$2, $y.0$2 := (if p15$2 then $pt.2$2 else $pt.1$2), (if p15$2 then $density.2$2 else $density.1$2), (if p15$2 then BV32_ADD($y.0$2, 1bv32) else $y.0$2);
    p14$1 := (if p15$1 then true else p14$1);
    p14$2 := (if p15$2 then true else p14$2);
    goto $21.backedge, $21.tail;

  $21.tail:
    assume !p14$1 && !p14$2;
    $pt.0$1, $density.0$1, $z.0$1 := (if p13$1 then $pt.1$1 else $pt.0$1), (if p13$1 then $density.1$1 else $density.0$1), (if p13$1 then BV32_ADD($z.0$1, 1bv32) else $z.0$1);
    $pt.0$2, $density.0$2, $z.0$2 := (if p13$2 then $pt.1$2 else $pt.0$2), (if p13$2 then $density.1$2 else $density.0$2), (if p13$2 then BV32_ADD($z.0$2, 1bv32) else $z.0$2);
    p12$1 := (if p13$1 then true else p12$1);
    p12$2 := (if p13$2 then true else p12$2);
    goto $19.backedge, $19.tail;

  $19.tail:
    assume !p12$1 && !p12$2;
    call {:sourceloc} {:sourceloc_num 71} _LOG_WRITE_$$gridData_g(true, BV32_MUL(v19$1, 2bv32), $pt.0$1[32:0], $$gridData_g[BV32_MUL(v19$1, 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridData_g(true, BV32_MUL(v19$2, 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 71} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 71} _CHECK_WRITE_$$gridData_g(true, BV32_MUL(v19$2, 2bv32), $pt.0$2[32:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gridData_g"} true;
    $$gridData_g[BV32_MUL(v19$1, 2bv32)] := $pt.0$1[32:0];
    $$gridData_g[BV32_MUL(v19$2, 2bv32)] := $pt.0$2[32:0];
    call {:sourceloc} {:sourceloc_num 72} _LOG_WRITE_$$gridData_g(true, BV32_ADD(BV32_MUL(v19$1, 2bv32), 1bv32), $pt.0$1[64:32], $$gridData_g[BV32_ADD(BV32_MUL(v19$1, 2bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridData_g(true, BV32_ADD(BV32_MUL(v19$2, 2bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 72} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 72} _CHECK_WRITE_$$gridData_g(true, BV32_ADD(BV32_MUL(v19$2, 2bv32), 1bv32), $pt.0$2[64:32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gridData_g"} true;
    $$gridData_g[BV32_ADD(BV32_MUL(v19$1, 2bv32), 1bv32)] := $pt.0$1[64:32];
    $$gridData_g[BV32_ADD(BV32_MUL(v19$2, 2bv32), 1bv32)] := $pt.0$2[64:32];
    call {:sourceloc} {:sourceloc_num 73} _LOG_WRITE_$$sampleDensity_g(true, v19$1, $density.0$1, $$sampleDensity_g[v19$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sampleDensity_g(true, v19$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 73} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 73} _CHECK_WRITE_$$sampleDensity_g(true, v19$2, $density.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sampleDensity_g"} true;
    $$sampleDensity_g[v19$1] := $density.0$1;
    $$sampleDensity_g[v19$2] := $density.0$2;
    return;

  $19.backedge:
    assume {:backedge} p12$1 || p12$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $19;

  $21.backedge:
    assume {:backedge} p14$1 || p14$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $21;

  $23.backedge:
    assume {:backedge} p16$1 || p16$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto __partitioned_block_$23_0;

  $30.backedge:
    assume {:backedge} p22$1 || p22$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $30;
}



axiom (if group_size_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 2bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 8192bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 0bv1;
  requires _P$2 ==> $1 == 0bv1;
  requires {:barrier_divergence} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 == _P$2;
  modifies $$gridding_GPU.sharedBin, $$gridData_g, $$sampleDensity_g, _TRACKING;



procedure {:inline 1} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 0bv1;
  requires _P$2 ==> $1 == 0bv1;
  requires {:barrier_divergence} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 == _P$2;
  modifies $$gridding_GPU.sharedBin, $$gridData_g, $$sampleDensity_g, _TRACKING;



const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

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

const {:existential true} _b27: bool;

const {:existential true} _b28: bool;

const {:existential true} _b29: bool;

const {:existential true} _b30: bool;

const {:existential true} _b31: bool;

const {:existential true} _b32: bool;

const {:existential true} _b33: bool;

const _WATCHED_VALUE_$$sample_g: bv32;

procedure {:inline 1} _LOG_READ_$$sample_g(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$sample_g;



implementation {:inline 1} _LOG_READ_$$sample_g(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sample_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sample_g == _value then true else _READ_HAS_OCCURRED_$$sample_g);
    return;
}



procedure _CHECK_READ_$$sample_g(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sample_g"} {:array "$$sample_g"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sample_g && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sample_g);
  requires {:source_name "sample_g"} {:array "$$sample_g"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sample_g && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$sample_g: bool;

procedure {:inline 1} _LOG_WRITE_$$sample_g(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$sample_g, _WRITE_READ_BENIGN_FLAG_$$sample_g;



implementation {:inline 1} _LOG_WRITE_$$sample_g(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sample_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sample_g == _value then true else _WRITE_HAS_OCCURRED_$$sample_g);
    _WRITE_READ_BENIGN_FLAG_$$sample_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sample_g == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sample_g);
    return;
}



procedure _CHECK_WRITE_$$sample_g(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sample_g"} {:array "$$sample_g"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sample_g && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sample_g != _value);
  requires {:source_name "sample_g"} {:array "$$sample_g"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sample_g && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sample_g != _value);
  requires {:source_name "sample_g"} {:array "$$sample_g"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sample_g && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$sample_g(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sample_g;



implementation {:inline 1} _LOG_ATOMIC_$$sample_g(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sample_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sample_g);
    return;
}



procedure _CHECK_ATOMIC_$$sample_g(_P: bool, _offset: bv32);
  requires {:source_name "sample_g"} {:array "$$sample_g"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sample_g && _WATCHED_OFFSET == _offset);
  requires {:source_name "sample_g"} {:array "$$sample_g"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sample_g && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sample_g(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sample_g;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sample_g(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sample_g := (if _P && _WRITE_HAS_OCCURRED_$$sample_g && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sample_g);
    return;
}



const _WATCHED_VALUE_$$binStartAddr_g: bv32;

procedure {:inline 1} _LOG_READ_$$binStartAddr_g(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$binStartAddr_g;



implementation {:inline 1} _LOG_READ_$$binStartAddr_g(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$binStartAddr_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binStartAddr_g == _value then true else _READ_HAS_OCCURRED_$$binStartAddr_g);
    return;
}



procedure _CHECK_READ_$$binStartAddr_g(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "binStartAddr_g"} {:array "$$binStartAddr_g"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$binStartAddr_g && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$binStartAddr_g);
  requires {:source_name "binStartAddr_g"} {:array "$$binStartAddr_g"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$binStartAddr_g && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$binStartAddr_g: bool;

procedure {:inline 1} _LOG_WRITE_$$binStartAddr_g(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$binStartAddr_g, _WRITE_READ_BENIGN_FLAG_$$binStartAddr_g;



implementation {:inline 1} _LOG_WRITE_$$binStartAddr_g(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$binStartAddr_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binStartAddr_g == _value then true else _WRITE_HAS_OCCURRED_$$binStartAddr_g);
    _WRITE_READ_BENIGN_FLAG_$$binStartAddr_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binStartAddr_g == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$binStartAddr_g);
    return;
}



procedure _CHECK_WRITE_$$binStartAddr_g(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "binStartAddr_g"} {:array "$$binStartAddr_g"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$binStartAddr_g && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binStartAddr_g != _value);
  requires {:source_name "binStartAddr_g"} {:array "$$binStartAddr_g"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$binStartAddr_g && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binStartAddr_g != _value);
  requires {:source_name "binStartAddr_g"} {:array "$$binStartAddr_g"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$binStartAddr_g && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$binStartAddr_g(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$binStartAddr_g;



implementation {:inline 1} _LOG_ATOMIC_$$binStartAddr_g(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$binStartAddr_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$binStartAddr_g);
    return;
}



procedure _CHECK_ATOMIC_$$binStartAddr_g(_P: bool, _offset: bv32);
  requires {:source_name "binStartAddr_g"} {:array "$$binStartAddr_g"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$binStartAddr_g && _WATCHED_OFFSET == _offset);
  requires {:source_name "binStartAddr_g"} {:array "$$binStartAddr_g"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$binStartAddr_g && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$binStartAddr_g(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$binStartAddr_g;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$binStartAddr_g(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$binStartAddr_g := (if _P && _WRITE_HAS_OCCURRED_$$binStartAddr_g && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$binStartAddr_g);
    return;
}



const _WATCHED_VALUE_$$gridData_g: bv32;

procedure {:inline 1} _LOG_READ_$$gridData_g(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$gridData_g;



implementation {:inline 1} _LOG_READ_$$gridData_g(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$gridData_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridData_g == _value then true else _READ_HAS_OCCURRED_$$gridData_g);
    return;
}



procedure _CHECK_READ_$$gridData_g(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "gridData_g"} {:array "$$gridData_g"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$gridData_g && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$gridData_g);
  requires {:source_name "gridData_g"} {:array "$$gridData_g"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$gridData_g && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$gridData_g: bool;

procedure {:inline 1} _LOG_WRITE_$$gridData_g(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$gridData_g, _WRITE_READ_BENIGN_FLAG_$$gridData_g;



implementation {:inline 1} _LOG_WRITE_$$gridData_g(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$gridData_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridData_g == _value then true else _WRITE_HAS_OCCURRED_$$gridData_g);
    _WRITE_READ_BENIGN_FLAG_$$gridData_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridData_g == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$gridData_g);
    return;
}



procedure _CHECK_WRITE_$$gridData_g(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "gridData_g"} {:array "$$gridData_g"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$gridData_g && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridData_g != _value);
  requires {:source_name "gridData_g"} {:array "$$gridData_g"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$gridData_g && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridData_g != _value);
  requires {:source_name "gridData_g"} {:array "$$gridData_g"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$gridData_g && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$gridData_g(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$gridData_g;



implementation {:inline 1} _LOG_ATOMIC_$$gridData_g(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$gridData_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$gridData_g);
    return;
}



procedure _CHECK_ATOMIC_$$gridData_g(_P: bool, _offset: bv32);
  requires {:source_name "gridData_g"} {:array "$$gridData_g"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$gridData_g && _WATCHED_OFFSET == _offset);
  requires {:source_name "gridData_g"} {:array "$$gridData_g"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$gridData_g && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridData_g(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$gridData_g;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridData_g(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$gridData_g := (if _P && _WRITE_HAS_OCCURRED_$$gridData_g && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$gridData_g);
    return;
}



const _WATCHED_VALUE_$$sampleDensity_g: bv32;

procedure {:inline 1} _LOG_READ_$$sampleDensity_g(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$sampleDensity_g;



implementation {:inline 1} _LOG_READ_$$sampleDensity_g(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sampleDensity_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sampleDensity_g == _value then true else _READ_HAS_OCCURRED_$$sampleDensity_g);
    return;
}



procedure _CHECK_READ_$$sampleDensity_g(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sampleDensity_g"} {:array "$$sampleDensity_g"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sampleDensity_g && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sampleDensity_g);
  requires {:source_name "sampleDensity_g"} {:array "$$sampleDensity_g"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sampleDensity_g && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$sampleDensity_g: bool;

procedure {:inline 1} _LOG_WRITE_$$sampleDensity_g(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$sampleDensity_g, _WRITE_READ_BENIGN_FLAG_$$sampleDensity_g;



implementation {:inline 1} _LOG_WRITE_$$sampleDensity_g(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sampleDensity_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sampleDensity_g == _value then true else _WRITE_HAS_OCCURRED_$$sampleDensity_g);
    _WRITE_READ_BENIGN_FLAG_$$sampleDensity_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sampleDensity_g == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sampleDensity_g);
    return;
}



procedure _CHECK_WRITE_$$sampleDensity_g(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sampleDensity_g"} {:array "$$sampleDensity_g"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sampleDensity_g && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sampleDensity_g != _value);
  requires {:source_name "sampleDensity_g"} {:array "$$sampleDensity_g"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sampleDensity_g && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sampleDensity_g != _value);
  requires {:source_name "sampleDensity_g"} {:array "$$sampleDensity_g"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sampleDensity_g && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$sampleDensity_g(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sampleDensity_g;



implementation {:inline 1} _LOG_ATOMIC_$$sampleDensity_g(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sampleDensity_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sampleDensity_g);
    return;
}



procedure _CHECK_ATOMIC_$$sampleDensity_g(_P: bool, _offset: bv32);
  requires {:source_name "sampleDensity_g"} {:array "$$sampleDensity_g"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sampleDensity_g && _WATCHED_OFFSET == _offset);
  requires {:source_name "sampleDensity_g"} {:array "$$sampleDensity_g"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sampleDensity_g && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sampleDensity_g(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sampleDensity_g;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sampleDensity_g(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sampleDensity_g := (if _P && _WRITE_HAS_OCCURRED_$$sampleDensity_g && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sampleDensity_g);
    return;
}



const _WATCHED_VALUE_$$gridding_GPU.sharedBin: bv32;

procedure {:inline 1} _LOG_READ_$$gridding_GPU.sharedBin(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin;



implementation {:inline 1} _LOG_READ_$$gridding_GPU.sharedBin(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridding_GPU.sharedBin == _value then true else _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin);
    return;
}



procedure _CHECK_READ_$$gridding_GPU.sharedBin(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sharedBin"} {:array "$$gridding_GPU.sharedBin"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sharedBin"} {:array "$$gridding_GPU.sharedBin"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$gridding_GPU.sharedBin && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin: bool;

procedure {:inline 1} _LOG_WRITE_$$gridding_GPU.sharedBin(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin, _WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin;



implementation {:inline 1} _LOG_WRITE_$$gridding_GPU.sharedBin(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridding_GPU.sharedBin == _value then true else _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin);
    _WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridding_GPU.sharedBin == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin);
    return;
}



procedure _CHECK_WRITE_$$gridding_GPU.sharedBin(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sharedBin"} {:array "$$gridding_GPU.sharedBin"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridding_GPU.sharedBin != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sharedBin"} {:array "$$gridding_GPU.sharedBin"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridding_GPU.sharedBin != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sharedBin"} {:array "$$gridding_GPU.sharedBin"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$gridding_GPU.sharedBin && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$gridding_GPU.sharedBin(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$gridding_GPU.sharedBin;



implementation {:inline 1} _LOG_ATOMIC_$$gridding_GPU.sharedBin(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$gridding_GPU.sharedBin := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$gridding_GPU.sharedBin);
    return;
}



procedure _CHECK_ATOMIC_$$gridding_GPU.sharedBin(_P: bool, _offset: bv32);
  requires {:source_name "sharedBin"} {:array "$$gridding_GPU.sharedBin"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sharedBin"} {:array "$$gridding_GPU.sharedBin"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$gridding_GPU.sharedBin && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin := (if _P && _WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$gridding_GPU.sharedBin);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$gridding_GPU.sharedBin;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$gridding_GPU.sharedBin;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$gridData_g;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$gridData_g;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$gridData_g;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sampleDensity_g;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sampleDensity_g;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sampleDensity_g;
    goto anon5;

  anon5:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$gridData_g;
    goto anon7;

  anon7:
    havoc $$sampleDensity_g;
    goto anon8;

  anon10_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$gridding_GPU.sharedBin;
    goto anon3;

  anon9_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$gridding_GPU.sharedBin;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$gridding_GPU.sharedBin;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$gridding_GPU.sharedBin;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$gridData_g;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$gridData_g;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$gridData_g;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sampleDensity_g;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sampleDensity_g;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sampleDensity_g;
    goto anon5;

  anon5:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$gridData_g;
    goto anon7;

  anon7:
    havoc $$sampleDensity_g;
    goto anon8;

  anon10_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$gridding_GPU.sharedBin;
    goto anon3;

  anon9_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b34: bool;

const {:existential true} _b35: bool;

const {:existential true} _b36: bool;

const {:existential true} _b37: bool;

const {:existential true} _b38: bool;

const {:existential true} _b39: bool;

const {:existential true} _b40: bool;

const {:existential true} _b41: bool;

const {:existential true} _b42: bool;

const {:existential true} _b43: bool;

const {:existential true} _b44: bool;

const {:existential true} _b45: bool;

const {:existential true} _b46: bool;

const {:existential true} _b47: bool;

const {:existential true} _b48: bool;

const {:existential true} _b49: bool;

const {:existential true} _b50: bool;

const {:existential true} _b51: bool;

const {:existential true} _b52: bool;

const {:existential true} _b53: bool;

const {:existential true} _b54: bool;

const {:existential true} _b55: bool;

const {:existential true} _b56: bool;

const {:existential true} _b57: bool;

const {:existential true} _b58: bool;

const {:existential true} _b59: bool;

const {:existential true} _b60: bool;

const {:existential true} _b61: bool;

const {:existential true} _b62: bool;

const {:existential true} _b63: bool;

const {:existential true} _b64: bool;

const {:existential true} _b65: bool;

const {:existential true} _b66: bool;

const {:existential true} _b67: bool;

const {:existential true} _b68: bool;

const {:existential true} _b69: bool;

const {:existential true} _b70: bool;

const {:existential true} _b71: bool;

const {:existential true} _b72: bool;

const {:existential true} _b73: bool;

const {:existential true} _b74: bool;

const {:existential true} _b75: bool;

const {:existential true} _b76: bool;

const {:existential true} _b77: bool;

const {:existential true} _b78: bool;

const {:existential true} _b79: bool;

const {:existential true} _b80: bool;

const {:existential true} _b81: bool;

const {:existential true} _b82: bool;

const {:existential true} _b83: bool;

const {:existential true} _b84: bool;

const {:existential true} _b85: bool;

const {:existential true} _b86: bool;

const {:existential true} _b87: bool;

const {:existential true} _b88: bool;

const {:existential true} _b89: bool;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b90: bool;

const {:existential true} _b91: bool;

const {:existential true} _b92: bool;

const {:existential true} _b93: bool;

const {:existential true} _b94: bool;

const {:existential true} _b95: bool;

const {:existential true} _b96: bool;

const {:existential true} _b97: bool;

const {:existential true} _b98: bool;

const {:existential true} _b99: bool;

const {:existential true} _b100: bool;

const {:existential true} _b101: bool;

const {:existential true} _b102: bool;

const {:existential true} _b103: bool;

const {:existential true} _b104: bool;

const {:existential true} _b105: bool;

const {:existential true} _b106: bool;

const {:existential true} _b107: bool;

const {:existential true} _b108: bool;

const {:existential true} _b109: bool;

const {:existential true} _b110: bool;

const {:existential true} _b111: bool;

const {:existential true} _b112: bool;

const {:existential true} _b113: bool;

const {:existential true} _b114: bool;

const {:existential true} _b115: bool;

const {:existential true} _b116: bool;

const {:existential true} _b117: bool;

const {:existential true} _b118: bool;

const {:existential true} _b119: bool;

const {:existential true} _b120: bool;

const {:existential true} _b121: bool;

const {:existential true} _b122: bool;

const {:existential true} _b123: bool;

const {:existential true} _b124: bool;

const {:existential true} _b125: bool;

const {:existential true} _b126: bool;

const {:existential true} _b127: bool;

const {:existential true} _b128: bool;

const {:existential true} _b129: bool;

const {:existential true} _b130: bool;

const {:existential true} _b131: bool;

const {:existential true} _b132: bool;

const {:existential true} _b133: bool;

const {:existential true} _b134: bool;

const {:existential true} _b135: bool;

const {:existential true} _b136: bool;

const {:existential true} _b137: bool;

const {:existential true} _b138: bool;

const {:existential true} _b139: bool;

const {:existential true} _b140: bool;

const {:existential true} _b141: bool;

const {:existential true} _b142: bool;

const {:existential true} _b143: bool;

const {:existential true} _b144: bool;

const {:existential true} _b145: bool;

const {:existential true} _b146: bool;

const {:existential true} _b147: bool;

const {:existential true} _b148: bool;

const {:existential true} _b149: bool;

const {:existential true} _b150: bool;

const {:existential true} _b151: bool;

const {:existential true} _b152: bool;

const {:existential true} _b153: bool;

const {:existential true} _b154: bool;

const {:existential true} _b155: bool;

const {:existential true} _b156: bool;

const {:existential true} _b157: bool;

const {:existential true} _b158: bool;

const {:existential true} _b159: bool;

const {:existential true} _b160: bool;

const {:existential true} _b161: bool;

const {:existential true} _b162: bool;

const {:existential true} _b163: bool;

const {:existential true} _b164: bool;

const {:existential true} _b165: bool;

const {:existential true} _b166: bool;

const {:existential true} _b167: bool;

const {:existential true} _b168: bool;

const {:existential true} _b169: bool;

const {:existential true} _b170: bool;

const {:existential true} _b171: bool;

const {:existential true} _b172: bool;

const {:existential true} _b173: bool;

const {:existential true} _b174: bool;

const {:existential true} _b175: bool;

const {:existential true} _b176: bool;

const {:existential true} _b177: bool;

const {:existential true} _b178: bool;

const {:existential true} _b179: bool;

const {:existential true} _b180: bool;

const {:existential true} _b181: bool;

const {:existential true} _b182: bool;

const {:existential true} _b183: bool;

const {:existential true} _b184: bool;

const {:existential true} _b185: bool;

const {:existential true} _b186: bool;

const {:existential true} _b187: bool;

const {:existential true} _b188: bool;

const {:existential true} _b189: bool;

const {:existential true} _b190: bool;

const {:existential true} _b191: bool;
