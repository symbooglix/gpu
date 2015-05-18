type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_v"} {:global} $$d_v: [bv32]bv32;

axiom {:array_info "$$d_v"} {:global} {:elem_width 32} {:source_name "d_v"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_v: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_v: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_v: bool;

var {:source_name "d_Lb"} {:global} $$d_Lb: [bv32]bv32;

axiom {:array_info "$$d_Lb"} {:global} {:elem_width 32} {:source_name "d_Lb"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Lb: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Lb: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Lb: bool;

var {:source_name "B.i"} $$B.i$1: [bv32]bv32;

var {:source_name "B.i"} $$B.i$2: [bv32]bv32;

axiom {:array_info "$$B.i"} {:elem_width 32} {:source_name "B.i"} {:source_elem_width 32} {:source_dimensions "40"} true;

var {:source_name "S.i"} $$S.i$1: [bv32]bv32;

var {:source_name "S.i"} $$S.i$2: [bv32]bv32;

axiom {:array_info "$$S.i"} {:elem_width 32} {:source_name "S.i"} {:source_elem_width 32} {:source_dimensions "40"} true;

var {:source_name "B_b.i"} $$B_b.i$1: [bv32]bv32;

var {:source_name "B_b.i"} $$B_b.i$2: [bv32]bv32;

axiom {:array_info "$$B_b.i"} {:elem_width 32} {:source_name "B_b.i"} {:source_elem_width 32} {:source_dimensions "40"} true;

var {:source_name "S_b.i"} $$S_b.i$1: [bv32]bv32;

var {:source_name "S_b.i"} $$S_b.i$2: [bv32]bv32;

axiom {:array_info "$$S_b.i"} {:elem_width 32} {:source_name "S_b.i"} {:source_elem_width 32} {:source_dimensions "40"} true;

var {:source_name "L"} $$L$1: [bv32]bv32;

var {:source_name "L"} $$L$2: [bv32]bv32;

axiom {:array_info "$$L"} {:elem_width 32} {:source_name "L"} {:source_elem_width 32} {:source_dimensions "80"} true;

var {:source_name "L2"} $$L2$1: [bv32]bv32;

var {:source_name "L2"} $$L2$2: [bv32]bv32;

axiom {:array_info "$$L2"} {:elem_width 32} {:source_name "L2"} {:source_elem_width 32} {:source_dimensions "3280"} true;

var {:source_name "z"} $$z$1: [bv32]bv32;

var {:source_name "z"} $$z$2: [bv32]bv32;

axiom {:array_info "$$z"} {:elem_width 32} {:source_name "z"} {:source_elem_width 32} {:source_dimensions "80"} true;

var {:source_name "N"} {:constant} $$N$1: [bv32]bv32;

var {:source_name "N"} {:constant} $$N$2: [bv32]bv32;

axiom {:array_info "$$N"} {:constant} {:elem_width 32} {:source_name "N"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:source_name "Nmat"} {:constant} $$Nmat$1: [bv32]bv32;

var {:source_name "Nmat"} {:constant} $$Nmat$2: [bv32]bv32;

axiom {:array_info "$$Nmat"} {:constant} {:elem_width 32} {:source_name "Nmat"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:source_name "delta"} {:constant} $$delta$1: [bv32]bv32;

var {:source_name "delta"} {:constant} $$delta$2: [bv32]bv32;

axiom {:array_info "$$delta"} {:constant} {:elem_width 32} {:source_name "delta"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:source_name "lambda"} {:constant} $$lambda$1: [bv32]bv32;

var {:source_name "lambda"} {:constant} $$lambda$2: [bv32]bv32;

axiom {:array_info "$$lambda"} {:constant} {:elem_width 32} {:source_name "lambda"} {:source_elem_width 32} {:source_dimensions "80"} true;

var {:source_name "Nopt"} {:constant} $$Nopt$1: [bv32]bv32;

var {:source_name "Nopt"} {:constant} $$Nopt$2: [bv32]bv32;

axiom {:array_info "$$Nopt"} {:constant} {:elem_width 32} {:source_name "Nopt"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:source_name "maturities"} {:constant} $$maturities$1: [bv32]bv32;

var {:source_name "maturities"} {:constant} $$maturities$2: [bv32]bv32;

axiom {:array_info "$$maturities"} {:constant} {:elem_width 32} {:source_name "maturities"} {:source_elem_width 32} {:source_dimensions "15"} true;

var {:source_name "swaprates"} {:constant} $$swaprates$1: [bv32]bv32;

var {:source_name "swaprates"} {:constant} $$swaprates$2: [bv32]bv32;

axiom {:array_info "$$swaprates"} {:constant} {:elem_width 32} {:source_name "swaprates"} {:source_elem_width 32} {:source_dimensions "15"} true;

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

function FDIV64(bv64, bv64) : bv64;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FMUL64(bv64, bv64) : bv64;

function FP32_CONV64(bv32) : bv64;

function FP64_CONV32(bv64) : bv32;

function FSQRT64(bv64) : bv64;

function FSUB32(bv32, bv32) : bv32;

function FSUB64(bv64, bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "Pathcalc_Portfolio_KernelGPU"} {:kernel} $_Z28Pathcalc_Portfolio_KernelGPUPfS_();
  requires !_READ_HAS_OCCURRED_$$d_v && !_WRITE_HAS_OCCURRED_$$d_v && !_ATOMIC_HAS_OCCURRED_$$d_v;
  requires !_READ_HAS_OCCURRED_$$d_Lb && !_WRITE_HAS_OCCURRED_$$d_Lb && !_ATOMIC_HAS_OCCURRED_$$d_Lb;
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
  modifies _WRITE_HAS_OCCURRED_$$d_v, _WRITE_READ_BENIGN_FLAG_$$d_v, _WRITE_READ_BENIGN_FLAG_$$d_v, _WRITE_HAS_OCCURRED_$$d_Lb, _WRITE_READ_BENIGN_FLAG_$$d_Lb, _WRITE_READ_BENIGN_FLAG_$$d_Lb;



implementation {:source_name "Pathcalc_Portfolio_KernelGPU"} {:kernel} $_Z28Pathcalc_Portfolio_KernelGPUPfS_()
{
  var $path.0$1: bv32;
  var $path.0$2: bv32;
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $i.i.0$1: bv32;
  var $i.i.0$2: bv32;
  var $n.i.0$1: bv32;
  var $n.i.0$2: bv32;
  var $i.i.1$1: bv32;
  var $i.i.1$2: bv32;
  var $v.i.0$1: bv32;
  var $v.i.0$2: bv32;
  var $s.i.0$1: bv32;
  var $s.i.0$2: bv32;
  var $b.i.0$1: bv32;
  var $b.i.0$2: bv32;
  var $m.i.0$1: bv32;
  var $m.i.0$2: bv32;
  var $m.i.1$1: bv32;
  var $m.i.1$2: bv32;
  var $n.i1.0$1: bv32;
  var $n.i1.0$2: bv32;
  var $v.i2.0$1: bv32;
  var $v.i2.0$2: bv32;
  var $v.i2.1$1: bv32;
  var $v.i2.1$2: bv32;
  var $m.i.2$1: bv32;
  var $m.i.2$2: bv32;
  var $b.i.1$1: bv32;
  var $b.i.1$2: bv32;
  var $n.i1.1$1: bv32;
  var $n.i1.1$2: bv32;
  var $n.i1.2$1: bv32;
  var $n.i1.2$2: bv32;
  var $n.i1.3$1: bv32;
  var $n.i1.3$2: bv32;
  var $n.i4.0$1: bv32;
  var $n.i4.0$2: bv32;
  var $v1.i.0$1: bv32;
  var $v1.i.0$2: bv32;
  var $i.i3.0$1: bv32;
  var $i.i3.0$2: bv32;
  var v0$1: bool;
  var v0$2: bool;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bool;
  var v11$2: bool;
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
  var v26$1: bool;
  var v26$2: bool;
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
  var v35$1: bool;
  var v35$2: bool;
  var v36$1: bv32;
  var v36$2: bv32;
  var v37$1: bool;
  var v37$2: bool;
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
  var v44$1: bool;
  var v44$2: bool;
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
  var v62$1: bool;
  var v62$2: bool;
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
  var v73$1: bool;
  var v73$2: bool;
  var v74$1: bv32;
  var v74$2: bv32;
  var v75$1: bv32;
  var v75$2: bv32;
  var v76$1: bv32;
  var v76$2: bv32;
  var v77$1: bv32;
  var v77$2: bv32;
  var v78$1: bool;
  var v78$2: bool;
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
  var v84$1: bool;
  var v84$2: bool;
  var v85$1: bv32;
  var v85$2: bv32;
  var v86$1: bv32;
  var v86$2: bv32;
  var v87$1: bool;
  var v87$2: bool;
  var v88$1: bv32;
  var v88$2: bv32;
  var v89$1: bool;
  var v89$2: bool;
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


  $0:
    $path.0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    $path.0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b8 ==> _WRITE_HAS_OCCURRED_$$d_Lb ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b7 ==> _WRITE_HAS_OCCURRED_$$d_v ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b6 ==> BV32_SLT($path.0$1, 4096bv32) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b6 ==> BV32_SLT($path.0$2, 4096bv32) ==> p0$2;
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b5 ==> BV32_UGE($path.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b5 ==> BV32_UGE($path.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b4 ==> BV32_ULE($path.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b4 ==> BV32_ULE($path.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b3 ==> BV32_SGE($path.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b3 ==> BV32_SGE($path.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b2 ==> BV32_SLE($path.0$1, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b2 ==> BV32_SLE($path.0$2, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:tag "guardNonNeg"} {:thread 1} p0$1 ==> _b1 ==> BV32_SLE(0bv32, $path.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p0$2 ==> _b1 ==> BV32_SLE(0bv32, $path.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b0 ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), $path.0$1) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b0 ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), $path.0$2) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assert {:block_sourceloc} {:sourceloc_num 1} p0$1 ==> true;
    v0$1 := (if p0$1 then BV32_SLT($path.0$1, 4096bv32) else v0$1);
    v0$2 := (if p0$2 then BV32_SLT($path.0$2, 4096bv32) else v0$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p4$1 := false;
    p4$2 := false;
    p6$1 := false;
    p6$2 := false;
    p10$1 := false;
    p10$2 := false;
    p12$1 := false;
    p12$2 := false;
    p14$1 := false;
    p14$2 := false;
    p18$1 := false;
    p18$2 := false;
    p22$1 := false;
    p22$2 := false;
    p24$1 := false;
    p24$2 := false;
    p26$1 := false;
    p26$2 := false;
    p28$1 := false;
    p28$2 := false;
    p32$1 := false;
    p32$2 := false;
    p1$1 := (if p0$1 && v0$1 then v0$1 else p1$1);
    p1$2 := (if p0$2 && v0$2 then v0$2 else p1$2);
    p0$1 := (if p0$1 && !v0$1 then v0$1 else p0$1);
    p0$2 := (if p0$2 && !v0$2 then v0$2 else p0$2);
    $i.0$1 := (if p1$1 then 0bv32 else $i.0$1);
    $i.0$2 := (if p1$2 then 0bv32 else $i.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_13_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_13"} true;
    assume {:invGenSkippedLoop} true;
    assert p2$1 ==> p0$1;
    assert p2$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 3} p2$1 ==> true;
    v1$1 := (if p2$1 then $$N$1[0bv32] else v1$1);
    v1$2 := (if p2$2 then $$N$2[0bv32] else v1$2);
    v2$1 := (if p2$1 then BV32_SLT($i.0$1, v1$1) else v2$1);
    v2$2 := (if p2$2 then BV32_SLT($i.0$2, v1$2) else v2$2);
    p3$1 := false;
    p3$2 := false;
    p3$1 := (if p2$1 && v2$1 then v2$1 else p3$1);
    p3$2 := (if p2$2 && v2$2 then v2$2 else p3$2);
    p2$1 := (if p2$1 && !v2$1 then v2$1 else p2$1);
    p2$2 := (if p2$2 && !v2$2 then v2$2 else p2$2);
    $$z$1[$i.0$1] := (if p3$1 then 1050253722bv32 else $$z$1[$i.0$1]);
    $$z$2[$i.0$2] := (if p3$2 then 1050253722bv32 else $$z$2[$i.0$2]);
    $$L$1[$i.0$1] := (if p3$1 then 1028443341bv32 else $$L$1[$i.0$1]);
    $$L$2[$i.0$2] := (if p3$2 then 1028443341bv32 else $$L$2[$i.0$2]);
    $i.0$1 := (if p3$1 then BV32_ADD($i.0$1, 1bv32) else $i.0$1);
    $i.0$2 := (if p3$2 then BV32_ADD($i.0$2, 1bv32) else $i.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, $3.tail;

  $3.tail:
    assume !p2$1 && !p2$2;
    $i.i.0$1 := (if p1$1 then 0bv32 else $i.i.0$1);
    $i.i.0$2 := (if p1$2 then 0bv32 else $i.i.0$2);
    p4$1 := (if p1$1 then true else p4$1);
    p4$2 := (if p1$2 then true else p4$2);
    assume {:captureState "loop_entry_state_12_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_12"} true;
    assume {:invGenSkippedLoop} true;
    assert p4$1 ==> p0$1;
    assert p4$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 10} p4$1 ==> true;
    v3$1 := (if p4$1 then $$N$1[0bv32] else v3$1);
    v3$2 := (if p4$2 then $$N$2[0bv32] else v3$2);
    v4$1 := (if p4$1 then BV32_SLT($i.i.0$1, v3$1) else v4$1);
    v4$2 := (if p4$2 then BV32_SLT($i.i.0$2, v3$2) else v4$2);
    p5$1 := false;
    p5$2 := false;
    p5$1 := (if p4$1 && v4$1 then v4$1 else p5$1);
    p5$2 := (if p4$2 && v4$2 then v4$2 else p5$2);
    p4$1 := (if p4$1 && !v4$1 then v4$1 else p4$1);
    p4$2 := (if p4$2 && !v4$2 then v4$2 else p4$2);
    v5$1 := (if p5$1 then $$L$1[$i.i.0$1] else v5$1);
    v5$2 := (if p5$2 then $$L$2[$i.i.0$2] else v5$2);
    $$L2$1[$i.i.0$1] := (if p5$1 then v5$1 else $$L2$1[$i.i.0$1]);
    $$L2$2[$i.i.0$2] := (if p5$2 then v5$2 else $$L2$2[$i.i.0$2]);
    $i.i.0$1 := (if p5$1 then BV32_ADD($i.i.0$1, 1bv32) else $i.i.0$1);
    $i.i.0$2 := (if p5$2 then BV32_ADD($i.i.0$2, 1bv32) else $i.i.0$2);
    p4$1 := (if p5$1 then true else p4$1);
    p4$2 := (if p5$2 then true else p4$2);
    goto $7.backedge, $7.tail;

  $7.tail:
    assume !p4$1 && !p4$2;
    $n.i.0$1 := (if p1$1 then 0bv32 else $n.i.0$1);
    $n.i.0$2 := (if p1$2 then 0bv32 else $n.i.0$2);
    p6$1 := (if p1$1 then true else p6$1);
    p6$2 := (if p1$2 then true else p6$2);
    assume {:captureState "loop_entry_state_10_0"} true;
    goto $10;

  $10:
    assume {:captureState "loop_head_state_10"} true;
    assume {:invGenSkippedLoop} true;
    assert p6$1 ==> p0$1;
    assert p6$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 16} p6$1 ==> true;
    v6$1 := (if p6$1 then $$Nmat$1[0bv32] else v6$1);
    v6$2 := (if p6$2 then $$Nmat$2[0bv32] else v6$2);
    v7$1 := (if p6$1 then BV32_SLT($n.i.0$1, v6$1) else v7$1);
    v7$2 := (if p6$2 then BV32_SLT($n.i.0$2, v6$2) else v7$2);
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    p7$1 := (if p6$1 && v7$1 then v7$1 else p7$1);
    p7$2 := (if p6$2 && v7$2 then v7$2 else p7$2);
    p6$1 := (if p6$1 && !v7$1 then v7$1 else p6$1);
    p6$2 := (if p6$2 && !v7$2 then v7$2 else p6$2);
    v8$1 := (if p7$1 then $$delta$1[0bv32] else v8$1);
    v8$2 := (if p7$2 then $$delta$2[0bv32] else v8$2);
    v9$1 := (if p7$1 then $$z$1[$n.i.0$1] else v9$1);
    v9$2 := (if p7$2 then $$z$2[$n.i.0$2] else v9$2);
    $i.i.1$1, $v.i.0$1 := (if p7$1 then BV32_ADD($n.i.0$1, 1bv32) else $i.i.1$1), (if p7$1 then 0bv32 else $v.i.0$1);
    $i.i.1$2, $v.i.0$2 := (if p7$2 then BV32_ADD($n.i.0$2, 1bv32) else $i.i.1$2), (if p7$2 then 0bv32 else $v.i.0$2);
    p8$1 := (if p7$1 then true else p8$1);
    p8$2 := (if p7$2 then true else p8$2);
    assume {:captureState "loop_entry_state_11_0"} true;
    goto $12;

  $12:
    assume {:captureState "loop_head_state_11"} true;
    assume {:invGenSkippedLoop} true;
    assert p8$1 ==> p6$1;
    assert p8$2 ==> p6$2;
    assert p6$1 ==> p0$1;
    assert p6$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 21} p8$1 ==> true;
    v10$1 := (if p8$1 then $$N$1[0bv32] else v10$1);
    v10$2 := (if p8$2 then $$N$2[0bv32] else v10$2);
    v11$1 := (if p8$1 then BV32_SLT($i.i.1$1, v10$1) else v11$1);
    v11$2 := (if p8$2 then BV32_SLT($i.i.1$2, v10$2) else v11$2);
    p9$1 := false;
    p9$2 := false;
    p9$1 := (if p8$1 && v11$1 then v11$1 else p9$1);
    p9$2 := (if p8$2 && v11$2 then v11$2 else p9$2);
    p8$1 := (if p8$1 && !v11$1 then v11$1 else p8$1);
    p8$2 := (if p8$2 && !v11$2 then v11$2 else p8$2);
    v12$1 := (if p9$1 then $$lambda$1[BV32_SUB(BV32_SUB($i.i.1$1, $n.i.0$1), 1bv32)] else v12$1);
    v12$2 := (if p9$2 then $$lambda$2[BV32_SUB(BV32_SUB($i.i.1$2, $n.i.0$2), 1bv32)] else v12$2);
    v13$1 := (if p9$1 then $$delta$1[0bv32] else v13$1);
    v13$2 := (if p9$2 then $$delta$2[0bv32] else v13$2);
    v14$1 := (if p9$1 then FMUL32(v13$1, v12$1) else v14$1);
    v14$2 := (if p9$2 then FMUL32(v13$2, v12$2) else v14$2);
    v15$1 := (if p9$1 then $$L$1[$i.i.1$1] else v15$1);
    v15$2 := (if p9$2 then $$L$2[$i.i.1$2] else v15$2);
    v16$1 := (if p9$1 then $$delta$1[0bv32] else v16$1);
    v16$2 := (if p9$2 then $$delta$2[0bv32] else v16$2);
    v17$1 := (if p9$1 then $$L$1[$i.i.1$1] else v17$1);
    v17$2 := (if p9$2 then $$L$2[$i.i.1$2] else v17$2);
    call {:sourceloc_num 29} v18$1, v18$2 := $__fdividef(p9$1, FMUL32(v14$1, v15$1), FP64_CONV32(FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v16$1, v17$1)))), p9$2, FMUL32(v14$2, v15$2), FP64_CONV32(FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v16$2, v17$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "$__fdividef"} true;
    v19$1 := (if p9$1 then FADD32($v.i.0$1, v18$1) else v19$1);
    v19$2 := (if p9$2 then FADD32($v.i.0$2, v18$2) else v19$2);
    call {:sourceloc_num 30} v20$1, v20$2 := $__expf(p9$1, FP64_CONV32(FADD64(FP32_CONV64(FMUL32(v14$1, v19$1)), FMUL64(FP32_CONV64(v12$1), FSUB64(FP32_CONV64(FP64_CONV32(FMUL64(FSQRT64(FP32_CONV64(v8$1)), FP32_CONV64(v9$1)))), FMUL64(4602678819172646912bv64, FP32_CONV64(v14$1)))))), p9$2, FP64_CONV32(FADD64(FP32_CONV64(FMUL32(v14$2, v19$2)), FMUL64(FP32_CONV64(v12$2), FSUB64(FP32_CONV64(FP64_CONV32(FMUL64(FSQRT64(FP32_CONV64(v8$2)), FP32_CONV64(v9$2)))), FMUL64(4602678819172646912bv64, FP32_CONV64(v14$2)))))));
    assume {:captureState "call_return_state_0"} {:procedureName "$__expf"} true;
    v21$1 := (if p9$1 then $$L$1[$i.i.1$1] else v21$1);
    v21$2 := (if p9$2 then $$L$2[$i.i.1$2] else v21$2);
    $$L$1[$i.i.1$1] := (if p9$1 then FMUL32(v21$1, v20$1) else $$L$1[$i.i.1$1]);
    $$L$2[$i.i.1$2] := (if p9$2 then FMUL32(v21$2, v20$2) else $$L$2[$i.i.1$2]);
    v22$1 := (if p9$1 then $$L$1[$i.i.1$1] else v22$1);
    v22$2 := (if p9$2 then $$L$2[$i.i.1$2] else v22$2);
    v23$1 := (if p9$1 then $$N$1[0bv32] else v23$1);
    v23$2 := (if p9$2 then $$N$2[0bv32] else v23$2);
    $$L2$1[BV32_ADD($i.i.1$1, BV32_MUL(BV32_ADD($n.i.0$1, 1bv32), v23$1))] := (if p9$1 then v22$1 else $$L2$1[BV32_ADD($i.i.1$1, BV32_MUL(BV32_ADD($n.i.0$1, 1bv32), v23$1))]);
    $$L2$2[BV32_ADD($i.i.1$2, BV32_MUL(BV32_ADD($n.i.0$2, 1bv32), v23$2))] := (if p9$2 then v22$2 else $$L2$2[BV32_ADD($i.i.1$2, BV32_MUL(BV32_ADD($n.i.0$2, 1bv32), v23$2))]);
    $i.i.1$1, $v.i.0$1 := (if p9$1 then BV32_ADD($i.i.1$1, 1bv32) else $i.i.1$1), (if p9$1 then v19$1 else $v.i.0$1);
    $i.i.1$2, $v.i.0$2 := (if p9$2 then BV32_ADD($i.i.1$2, 1bv32) else $i.i.1$2), (if p9$2 then v19$2 else $v.i.0$2);
    p8$1 := (if p9$1 then true else p8$1);
    p8$2 := (if p9$2 then true else p8$2);
    goto $12.backedge, $12.tail;

  $12.tail:
    assume !p8$1 && !p8$2;
    $n.i.0$1 := (if p7$1 then BV32_ADD($n.i.0$1, 1bv32) else $n.i.0$1);
    $n.i.0$2 := (if p7$2 then BV32_ADD($n.i.0$2, 1bv32) else $n.i.0$2);
    p6$1 := (if p7$1 then true else p6$1);
    p6$2 := (if p7$2 then true else p6$2);
    goto $10.backedge, $10.tail;

  $10.tail:
    assume !p6$1 && !p6$2;
    $s.i.0$1, $b.i.0$1, $m.i.0$1 := (if p1$1 then 0bv32 else $s.i.0$1), (if p1$1 then 1065353216bv32 else $b.i.0$1), (if p1$1 then 0bv32 else $m.i.0$1);
    $s.i.0$2, $b.i.0$2, $m.i.0$2 := (if p1$2 then 0bv32 else $s.i.0$2), (if p1$2 then 1065353216bv32 else $b.i.0$2), (if p1$2 then 0bv32 else $m.i.0$2);
    p10$1 := (if p1$1 then true else p10$1);
    p10$2 := (if p1$2 then true else p10$2);
    assume {:captureState "loop_entry_state_9_0"} true;
    goto $15;

  $15:
    assume {:captureState "loop_head_state_9"} true;
    assume {:invGenSkippedLoop} true;
    assert p10$1 ==> p0$1;
    assert p10$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 38} p10$1 ==> true;
    v24$1 := (if p10$1 then $$N$1[0bv32] else v24$1);
    v24$2 := (if p10$2 then $$N$2[0bv32] else v24$2);
    v25$1 := (if p10$1 then $$Nmat$1[0bv32] else v25$1);
    v25$2 := (if p10$2 then $$Nmat$2[0bv32] else v25$2);
    v26$1 := (if p10$1 then BV32_SLT($m.i.0$1, BV32_SUB(v24$1, v25$1)) else v26$1);
    v26$2 := (if p10$2 then BV32_SLT($m.i.0$2, BV32_SUB(v24$2, v25$2)) else v26$2);
    p11$1 := false;
    p11$2 := false;
    p11$1 := (if p10$1 && v26$1 then v26$1 else p11$1);
    p11$2 := (if p10$2 && v26$2 then v26$2 else p11$2);
    p10$1 := (if p10$1 && !v26$1 then v26$1 else p10$1);
    p10$2 := (if p10$2 && !v26$2 then v26$2 else p10$2);
    v27$1 := (if p11$1 then $$Nmat$1[0bv32] else v27$1);
    v27$2 := (if p11$2 then $$Nmat$2[0bv32] else v27$2);
    v28$1 := (if p11$1 then $$delta$1[0bv32] else v28$1);
    v28$2 := (if p11$2 then $$delta$2[0bv32] else v28$2);
    v29$1 := (if p11$1 then $$L$1[BV32_ADD($m.i.0$1, v27$1)] else v29$1);
    v29$2 := (if p11$2 then $$L$2[BV32_ADD($m.i.0$2, v27$2)] else v29$2);
    call {:sourceloc_num 45} v30$1, v30$2 := $__fdividef(p11$1, $b.i.0$1, FP64_CONV32(FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v28$1, v29$1)))), p11$2, $b.i.0$2, FP64_CONV32(FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v28$2, v29$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "$__fdividef"} true;
    v31$1 := (if p11$1 then $$delta$1[0bv32] else v31$1);
    v31$2 := (if p11$2 then $$delta$2[0bv32] else v31$2);
    v32$1 := (if p11$1 then FADD32($s.i.0$1, FMUL32(v31$1, v30$1)) else v32$1);
    v32$2 := (if p11$2 then FADD32($s.i.0$2, FMUL32(v31$2, v30$2)) else v32$2);
    $$B.i$1[$m.i.0$1] := (if p11$1 then v30$1 else $$B.i$1[$m.i.0$1]);
    $$B.i$2[$m.i.0$2] := (if p11$2 then v30$2 else $$B.i$2[$m.i.0$2]);
    $$S.i$1[$m.i.0$1] := (if p11$1 then v32$1 else $$S.i$1[$m.i.0$1]);
    $$S.i$2[$m.i.0$2] := (if p11$2 then v32$2 else $$S.i$2[$m.i.0$2]);
    $s.i.0$1, $b.i.0$1, $m.i.0$1 := (if p11$1 then v32$1 else $s.i.0$1), (if p11$1 then v30$1 else $b.i.0$1), (if p11$1 then BV32_ADD($m.i.0$1, 1bv32) else $m.i.0$1);
    $s.i.0$2, $b.i.0$2, $m.i.0$2 := (if p11$2 then v32$2 else $s.i.0$2), (if p11$2 then v30$2 else $b.i.0$2), (if p11$2 then BV32_ADD($m.i.0$2, 1bv32) else $m.i.0$2);
    p10$1 := (if p11$1 then true else p10$1);
    p10$2 := (if p11$2 then true else p10$2);
    goto $15.backedge, $15.tail;

  $15.tail:
    assume !p10$1 && !p10$2;
    $m.i.1$1 := (if p1$1 then 0bv32 else $m.i.1$1);
    $m.i.1$2 := (if p1$2 then 0bv32 else $m.i.1$2);
    p12$1 := (if p1$1 then true else p12$1);
    p12$2 := (if p1$2 then true else p12$2);
    assume {:captureState "loop_entry_state_8_0"} true;
    goto $18;

  $18:
    assume {:captureState "loop_head_state_8"} true;
    assume {:invGenSkippedLoop} true;
    assert p12$1 ==> p0$1;
    assert p12$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 50} p12$1 ==> true;
    v33$1 := (if p12$1 then $$N$1[0bv32] else v33$1);
    v33$2 := (if p12$2 then $$N$2[0bv32] else v33$2);
    v34$1 := (if p12$1 then $$Nmat$1[0bv32] else v34$1);
    v34$2 := (if p12$2 then $$Nmat$2[0bv32] else v34$2);
    v35$1 := (if p12$1 then BV32_SLT($m.i.1$1, BV32_SUB(v33$1, v34$1)) else v35$1);
    v35$2 := (if p12$2 then BV32_SLT($m.i.1$2, BV32_SUB(v33$2, v34$2)) else v35$2);
    p13$1 := false;
    p13$2 := false;
    p13$1 := (if p12$1 && v35$1 then v35$1 else p13$1);
    p13$2 := (if p12$2 && v35$2 then v35$2 else p13$2);
    p12$1 := (if p12$1 && !v35$1 then v35$1 else p12$1);
    p12$2 := (if p12$2 && !v35$2 then v35$2 else p12$2);
    $$B_b.i$1[$m.i.1$1] := (if p13$1 then 0bv32 else $$B_b.i$1[$m.i.1$1]);
    $$B_b.i$2[$m.i.1$2] := (if p13$2 then 0bv32 else $$B_b.i$2[$m.i.1$2]);
    $$S_b.i$1[$m.i.1$1] := (if p13$1 then 0bv32 else $$S_b.i$1[$m.i.1$1]);
    $$S_b.i$2[$m.i.1$2] := (if p13$2 then 0bv32 else $$S_b.i$2[$m.i.1$2]);
    $m.i.1$1 := (if p13$1 then BV32_ADD($m.i.1$1, 1bv32) else $m.i.1$1);
    $m.i.1$2 := (if p13$2 then BV32_ADD($m.i.1$2, 1bv32) else $m.i.1$2);
    p12$1 := (if p13$1 then true else p12$1);
    p12$2 := (if p13$2 then true else p12$2);
    goto $18.backedge, $18.tail;

  $18.tail:
    assume !p12$1 && !p12$2;
    $n.i1.0$1, $v.i2.0$1 := (if p1$1 then 0bv32 else $n.i1.0$1), (if p1$1 then 0bv32 else $v.i2.0$1);
    $n.i1.0$2, $v.i2.0$2 := (if p1$2 then 0bv32 else $n.i1.0$2), (if p1$2 then 0bv32 else $v.i2.0$2);
    p14$1 := (if p1$1 then true else p14$1);
    p14$2 := (if p1$2 then true else p14$2);
    assume {:captureState "loop_entry_state_7_0"} true;
    goto $21;

  $21:
    assume {:captureState "loop_head_state_7"} true;
    assume {:invGenSkippedLoop} true;
    assert p14$1 ==> p0$1;
    assert p14$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 57} p14$1 ==> true;
    v36$1 := (if p14$1 then $$Nopt$1[0bv32] else v36$1);
    v36$2 := (if p14$2 then $$Nopt$2[0bv32] else v36$2);
    v37$1 := (if p14$1 then BV32_SLT($n.i1.0$1, v36$1) else v37$1);
    v37$2 := (if p14$2 then BV32_SLT($n.i1.0$2, v36$2) else v37$2);
    p15$1 := false;
    p15$2 := false;
    p16$1 := false;
    p16$2 := false;
    p17$1 := false;
    p17$2 := false;
    p15$1 := (if p14$1 && v37$1 then v37$1 else p15$1);
    p15$2 := (if p14$2 && v37$2 then v37$2 else p15$2);
    p14$1 := (if p14$1 && !v37$1 then v37$1 else p14$1);
    p14$2 := (if p14$2 && !v37$2 then v37$2 else p14$2);
    v38$1 := (if p15$1 then $$maturities$1[$n.i1.0$1] else v38$1);
    v38$2 := (if p15$2 then $$maturities$2[$n.i1.0$2] else v38$2);
    v39$1 := (if p15$1 then BV32_SUB(v38$1, 1bv32) else v39$1);
    v39$2 := (if p15$2 then BV32_SUB(v38$2, 1bv32) else v39$2);
    v40$1 := (if p15$1 then $$B.i$1[v39$1] else v40$1);
    v40$2 := (if p15$2 then $$B.i$2[v39$2] else v40$2);
    v41$1 := (if p15$1 then $$swaprates$1[$n.i1.0$1] else v41$1);
    v41$2 := (if p15$2 then $$swaprates$2[$n.i1.0$2] else v41$2);
    v42$1 := (if p15$1 then $$S.i$1[v39$1] else v42$1);
    v42$2 := (if p15$2 then $$S.i$2[v39$2] else v42$2);
    v43$1 := (if p15$1 then FP64_CONV32(FSUB64(FP32_CONV64(FADD32(v40$1, FMUL32(v41$1, v42$1))), 4607182418800017408bv64)) else v43$1);
    v43$2 := (if p15$2 then FP64_CONV32(FSUB64(FP32_CONV64(FADD32(v40$2, FMUL32(v41$2, v42$2))), 4607182418800017408bv64)) else v43$2);
    v44$1 := (if p15$1 then FLT32(v43$1, 0bv32) else v44$1);
    v44$2 := (if p15$2 then FLT32(v43$2, 0bv32) else v44$2);
    p17$1 := (if p15$1 && v44$1 then v44$1 else p17$1);
    p17$2 := (if p15$2 && v44$2 then v44$2 else p17$2);
    p16$1 := (if p15$1 && !v44$1 then !v44$1 else p16$1);
    p16$2 := (if p15$2 && !v44$2 then !v44$2 else p16$2);
    $v.i2.1$1 := (if p16$1 then $v.i2.0$1 else $v.i2.1$1);
    $v.i2.1$2 := (if p16$2 then $v.i2.0$2 else $v.i2.1$2);
    v45$1 := (if p17$1 then $$swaprates$1[$n.i1.0$1] else v45$1);
    v45$2 := (if p17$2 then $$swaprates$2[$n.i1.0$2] else v45$2);
    v46$1 := (if p17$1 then $$S_b.i$1[v39$1] else v46$1);
    v46$2 := (if p17$2 then $$S_b.i$2[v39$2] else v46$2);
    $$S_b.i$1[v39$1] := (if p17$1 then FADD32(v46$1, FMUL32(3267887104bv32, v45$1)) else $$S_b.i$1[v39$1]);
    $$S_b.i$2[v39$2] := (if p17$2 then FADD32(v46$2, FMUL32(3267887104bv32, v45$2)) else $$S_b.i$2[v39$2]);
    v47$1 := (if p17$1 then $$B_b.i$1[v39$1] else v47$1);
    v47$2 := (if p17$2 then $$B_b.i$2[v39$2] else v47$2);
    $$B_b.i$1[v39$1] := (if p17$1 then FADD32(v47$1, 3267887104bv32) else $$B_b.i$1[v39$1]);
    $$B_b.i$2[v39$2] := (if p17$2 then FADD32(v47$2, 3267887104bv32) else $$B_b.i$2[v39$2]);
    $v.i2.1$1 := (if p17$1 then FADD32($v.i2.0$1, FMUL32(3267887104bv32, v43$1)) else $v.i2.1$1);
    $v.i2.1$2 := (if p17$2 then FADD32($v.i2.0$2, FMUL32(3267887104bv32, v43$2)) else $v.i2.1$2);
    $n.i1.0$1, $v.i2.0$1 := (if p15$1 then BV32_ADD($n.i1.0$1, 1bv32) else $n.i1.0$1), (if p15$1 then $v.i2.1$1 else $v.i2.0$1);
    $n.i1.0$2, $v.i2.0$2 := (if p15$2 then BV32_ADD($n.i1.0$2, 1bv32) else $n.i1.0$2), (if p15$2 then $v.i2.1$2 else $v.i2.0$2);
    p14$1 := (if p15$1 then true else p14$1);
    p14$2 := (if p15$2 then true else p14$2);
    goto $21.backedge, $21.tail;

  $21.tail:
    assume !p14$1 && !p14$2;
    v48$1 := (if p1$1 then $$N$1[0bv32] else v48$1);
    v48$2 := (if p1$2 then $$N$2[0bv32] else v48$2);
    v49$1 := (if p1$1 then $$Nmat$1[0bv32] else v49$1);
    v49$2 := (if p1$2 then $$Nmat$2[0bv32] else v49$2);
    $m.i.2$1 := (if p1$1 then BV32_SUB(BV32_SUB(v48$1, v49$1), 1bv32) else $m.i.2$1);
    $m.i.2$2 := (if p1$2 then BV32_SUB(BV32_SUB(v48$2, v49$2), 1bv32) else $m.i.2$2);
    p18$1 := (if p1$1 then true else p18$1);
    p18$2 := (if p1$2 then true else p18$2);
    assume {:captureState "loop_entry_state_6_0"} true;
    goto $26;

  $26:
    assume {:captureState "loop_head_state_6"} true;
    assume {:invGenSkippedLoop} true;
    assert p18$1 ==> p0$1;
    assert p18$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 74} p18$1 ==> true;
    v50$1 := (if p18$1 then BV32_SGE($m.i.2$1, 0bv32) else v50$1);
    v50$2 := (if p18$2 then BV32_SGE($m.i.2$2, 0bv32) else v50$2);
    p19$1 := false;
    p19$2 := false;
    p20$1 := false;
    p20$2 := false;
    p21$1 := false;
    p21$2 := false;
    p19$1 := (if p18$1 && v50$1 then v50$1 else p19$1);
    p19$2 := (if p18$2 && v50$2 then v50$2 else p19$2);
    p18$1 := (if p18$1 && !v50$1 then v50$1 else p18$1);
    p18$2 := (if p18$2 && !v50$2 then v50$2 else p18$2);
    v51$1 := (if p19$1 then $$Nmat$1[0bv32] else v51$1);
    v51$2 := (if p19$2 then $$Nmat$2[0bv32] else v51$2);
    v52$1 := (if p19$1 then BV32_ADD($m.i.2$1, v51$1) else v52$1);
    v52$2 := (if p19$2 then BV32_ADD($m.i.2$2, v51$2) else v52$2);
    v53$1 := (if p19$1 then $$delta$1[0bv32] else v53$1);
    v53$2 := (if p19$2 then $$delta$2[0bv32] else v53$2);
    v54$1 := (if p19$1 then $$S_b.i$1[$m.i.2$1] else v54$1);
    v54$2 := (if p19$2 then $$S_b.i$2[$m.i.2$2] else v54$2);
    v55$1 := (if p19$1 then $$B_b.i$1[$m.i.2$1] else v55$1);
    v55$2 := (if p19$2 then $$B_b.i$2[$m.i.2$2] else v55$2);
    $$B_b.i$1[$m.i.2$1] := (if p19$1 then FADD32(v55$1, FMUL32(v53$1, v54$1)) else $$B_b.i$1[$m.i.2$1]);
    $$B_b.i$2[$m.i.2$2] := (if p19$2 then FADD32(v55$2, FMUL32(v53$2, v54$2)) else $$B_b.i$2[$m.i.2$2]);
    v56$1 := (if p19$1 then $$B_b.i$1[$m.i.2$1] else v56$1);
    v56$2 := (if p19$2 then $$B_b.i$2[$m.i.2$2] else v56$2);
    v57$1 := (if p19$1 then $$B.i$1[$m.i.2$1] else v57$1);
    v57$2 := (if p19$2 then $$B.i$2[$m.i.2$2] else v57$2);
    v58$1 := (if p19$1 then $$delta$1[0bv32] else v58$1);
    v58$2 := (if p19$2 then $$delta$2[0bv32] else v58$2);
    v59$1 := (if p19$1 then $$delta$1[0bv32] else v59$1);
    v59$2 := (if p19$2 then $$delta$2[0bv32] else v59$2);
    v60$1 := (if p19$1 then $$L$1[v52$1] else v60$1);
    v60$2 := (if p19$2 then $$L$2[v52$2] else v60$2);
    call {:sourceloc_num 86} v61$1, v61$2 := $__fdividef(p19$1, v58$1, FP64_CONV32(FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v59$1, v60$1)))), p19$2, v58$2, FP64_CONV32(FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v59$2, v60$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "$__fdividef"} true;
    $$L$1[v52$1] := (if p19$1 then FMUL32(FMUL32(FSUB32(2147483648bv32, v56$1), v57$1), v61$1) else $$L$1[v52$1]);
    $$L$2[v52$2] := (if p19$2 then FMUL32(FMUL32(FSUB32(2147483648bv32, v56$2), v57$2), v61$2) else $$L$2[v52$2]);
    v62$1 := (if p19$1 then BV32_SGT($m.i.2$1, 0bv32) else v62$1);
    v62$2 := (if p19$2 then BV32_SGT($m.i.2$2, 0bv32) else v62$2);
    p21$1 := (if p19$1 && v62$1 then v62$1 else p21$1);
    p21$2 := (if p19$2 && v62$2 then v62$2 else p21$2);
    v63$1 := (if p21$1 then $$S_b.i$1[$m.i.2$1] else v63$1);
    v63$2 := (if p21$2 then $$S_b.i$2[$m.i.2$2] else v63$2);
    v64$1 := (if p21$1 then BV32_SUB($m.i.2$1, 1bv32) else v64$1);
    v64$2 := (if p21$2 then BV32_SUB($m.i.2$2, 1bv32) else v64$2);
    v65$1 := (if p21$1 then $$S_b.i$1[v64$1] else v65$1);
    v65$2 := (if p21$2 then $$S_b.i$2[v64$2] else v65$2);
    $$S_b.i$1[v64$1] := (if p21$1 then FADD32(v65$1, v63$1) else $$S_b.i$1[v64$1]);
    $$S_b.i$2[v64$2] := (if p21$2 then FADD32(v65$2, v63$2) else $$S_b.i$2[v64$2]);
    v66$1 := (if p21$1 then $$B_b.i$1[$m.i.2$1] else v66$1);
    v66$2 := (if p21$2 then $$B_b.i$2[$m.i.2$2] else v66$2);
    v67$1 := (if p21$1 then $$delta$1[0bv32] else v67$1);
    v67$2 := (if p21$2 then $$delta$2[0bv32] else v67$2);
    v68$1 := (if p21$1 then $$L$1[v52$1] else v68$1);
    v68$2 := (if p21$2 then $$L$2[v52$2] else v68$2);
    call {:sourceloc_num 95} v69$1, v69$2 := $__fdividef(p21$1, v66$1, FP64_CONV32(FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v67$1, v68$1)))), p21$2, v66$2, FP64_CONV32(FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v67$2, v68$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "$__fdividef"} true;
    v70$1 := (if p21$1 then BV32_SUB($m.i.2$1, 1bv32) else v70$1);
    v70$2 := (if p21$2 then BV32_SUB($m.i.2$2, 1bv32) else v70$2);
    v71$1 := (if p21$1 then $$B_b.i$1[v70$1] else v71$1);
    v71$2 := (if p21$2 then $$B_b.i$2[v70$2] else v71$2);
    $$B_b.i$1[v70$1] := (if p21$1 then FADD32(v71$1, v69$1) else $$B_b.i$1[v70$1]);
    $$B_b.i$2[v70$2] := (if p21$2 then FADD32(v71$2, v69$2) else $$B_b.i$2[v70$2]);
    $m.i.2$1 := (if p19$1 then BV32_ADD($m.i.2$1, 4294967295bv32) else $m.i.2$1);
    $m.i.2$2 := (if p19$2 then BV32_ADD($m.i.2$2, 4294967295bv32) else $m.i.2$2);
    p18$1 := (if p19$1 then true else p18$1);
    p18$2 := (if p19$2 then true else p18$2);
    goto $26.backedge, $26.tail;

  $26.tail:
    assume !p18$1 && !p18$2;
    $b.i.1$1, $n.i1.1$1 := (if p1$1 then 1065353216bv32 else $b.i.1$1), (if p1$1 then 0bv32 else $n.i1.1$1);
    $b.i.1$2, $n.i1.1$2 := (if p1$2 then 1065353216bv32 else $b.i.1$2), (if p1$2 then 0bv32 else $n.i1.1$2);
    p22$1 := (if p1$1 then true else p22$1);
    p22$2 := (if p1$2 then true else p22$2);
    assume {:captureState "loop_entry_state_5_0"} true;
    goto $31;

  $31:
    assume {:captureState "loop_head_state_5"} true;
    assume {:invGenSkippedLoop} true;
    assert p22$1 ==> p0$1;
    assert p22$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 100} p22$1 ==> true;
    v72$1 := (if p22$1 then $$Nmat$1[0bv32] else v72$1);
    v72$2 := (if p22$2 then $$Nmat$2[0bv32] else v72$2);
    v73$1 := (if p22$1 then BV32_SLT($n.i1.1$1, v72$1) else v73$1);
    v73$2 := (if p22$2 then BV32_SLT($n.i1.1$2, v72$2) else v73$2);
    p23$1 := false;
    p23$2 := false;
    p23$1 := (if p22$1 && v73$1 then v73$1 else p23$1);
    p23$2 := (if p22$2 && v73$2 then v73$2 else p23$2);
    p22$1 := (if p22$1 && !v73$1 then v73$1 else p22$1);
    p22$2 := (if p22$2 && !v73$2 then v73$2 else p22$2);
    v74$1 := (if p23$1 then $$delta$1[0bv32] else v74$1);
    v74$2 := (if p23$2 then $$delta$2[0bv32] else v74$2);
    v75$1 := (if p23$1 then $$L$1[$n.i1.1$1] else v75$1);
    v75$2 := (if p23$2 then $$L$2[$n.i1.1$2] else v75$2);
    $b.i.1$1, $n.i1.1$1 := (if p23$1 then FP64_CONV32(FDIV64(FP32_CONV64($b.i.1$1), FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v74$1, v75$1))))) else $b.i.1$1), (if p23$1 then BV32_ADD($n.i1.1$1, 1bv32) else $n.i1.1$1);
    $b.i.1$2, $n.i1.1$2 := (if p23$2 then FP64_CONV32(FDIV64(FP32_CONV64($b.i.1$2), FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v74$2, v75$2))))) else $b.i.1$2), (if p23$2 then BV32_ADD($n.i1.1$2, 1bv32) else $n.i1.1$2);
    p22$1 := (if p23$1 then true else p22$1);
    p22$2 := (if p23$2 then true else p22$2);
    goto $31.backedge, $31.tail;

  $31.tail:
    assume !p22$1 && !p22$2;
    v76$1 := (if p1$1 then FMUL32($b.i.1$1, $v.i2.0$1) else v76$1);
    v76$2 := (if p1$2 then FMUL32($b.i.1$2, $v.i2.0$2) else v76$2);
    $n.i1.2$1 := (if p1$1 then 0bv32 else $n.i1.2$1);
    $n.i1.2$2 := (if p1$2 then 0bv32 else $n.i1.2$2);
    p24$1 := (if p1$1 then true else p24$1);
    p24$2 := (if p1$2 then true else p24$2);
    assume {:captureState "loop_entry_state_4_0"} true;
    goto $34;

  $34:
    assume {:captureState "loop_head_state_4"} true;
    assume {:invGenSkippedLoop} true;
    assert p24$1 ==> p0$1;
    assert p24$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 106} p24$1 ==> true;
    v77$1 := (if p24$1 then $$Nmat$1[0bv32] else v77$1);
    v77$2 := (if p24$2 then $$Nmat$2[0bv32] else v77$2);
    v78$1 := (if p24$1 then BV32_SLT($n.i1.2$1, v77$1) else v78$1);
    v78$2 := (if p24$2 then BV32_SLT($n.i1.2$2, v77$2) else v78$2);
    p25$1 := false;
    p25$2 := false;
    p25$1 := (if p24$1 && v78$1 then v78$1 else p25$1);
    p25$2 := (if p24$2 && v78$2 then v78$2 else p25$2);
    p24$1 := (if p24$1 && !v78$1 then v78$1 else p24$1);
    p24$2 := (if p24$2 && !v78$2 then v78$2 else p24$2);
    v79$1 := (if p25$1 then $$delta$1[0bv32] else v79$1);
    v79$2 := (if p25$2 then $$delta$2[0bv32] else v79$2);
    v80$1 := (if p25$1 then $$delta$1[0bv32] else v80$1);
    v80$2 := (if p25$2 then $$delta$2[0bv32] else v80$2);
    v81$1 := (if p25$1 then $$L$1[$n.i1.2$1] else v81$1);
    v81$2 := (if p25$2 then $$L$2[$n.i1.2$2] else v81$2);
    $$L$1[$n.i1.2$1] := (if p25$1 then FP64_CONV32(FDIV64(FP32_CONV64(FMUL32(FSUB32(2147483648bv32, v76$1), v79$1)), FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v80$1, v81$1))))) else $$L$1[$n.i1.2$1]);
    $$L$2[$n.i1.2$2] := (if p25$2 then FP64_CONV32(FDIV64(FP32_CONV64(FMUL32(FSUB32(2147483648bv32, v76$2), v79$2)), FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v80$2, v81$2))))) else $$L$2[$n.i1.2$2]);
    $n.i1.2$1 := (if p25$1 then BV32_ADD($n.i1.2$1, 1bv32) else $n.i1.2$1);
    $n.i1.2$2 := (if p25$2 then BV32_ADD($n.i1.2$2, 1bv32) else $n.i1.2$2);
    p24$1 := (if p25$1 then true else p24$1);
    p24$2 := (if p25$2 then true else p24$2);
    goto $34.backedge, $34.tail;

  $34.tail:
    assume !p24$1 && !p24$2;
    v82$1 := (if p1$1 then $$Nmat$1[0bv32] else v82$1);
    v82$2 := (if p1$2 then $$Nmat$2[0bv32] else v82$2);
    $n.i1.3$1 := (if p1$1 then v82$1 else $n.i1.3$1);
    $n.i1.3$2 := (if p1$2 then v82$2 else $n.i1.3$2);
    p26$1 := (if p1$1 then true else p26$1);
    p26$2 := (if p1$2 then true else p26$2);
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $37;

  $37:
    assume {:captureState "loop_head_state_3"} true;
    assume {:invGenSkippedLoop} true;
    assert p26$1 ==> p0$1;
    assert p26$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 115} p26$1 ==> true;
    v83$1 := (if p26$1 then $$N$1[0bv32] else v83$1);
    v83$2 := (if p26$2 then $$N$2[0bv32] else v83$2);
    v84$1 := (if p26$1 then BV32_SLT($n.i1.3$1, v83$1) else v84$1);
    v84$2 := (if p26$2 then BV32_SLT($n.i1.3$2, v83$2) else v84$2);
    p27$1 := false;
    p27$2 := false;
    p27$1 := (if p26$1 && v84$1 then v84$1 else p27$1);
    p27$2 := (if p26$2 && v84$2 then v84$2 else p27$2);
    p26$1 := (if p26$1 && !v84$1 then v84$1 else p26$1);
    p26$2 := (if p26$2 && !v84$2 then v84$2 else p26$2);
    v85$1 := (if p27$1 then $$L$1[$n.i1.3$1] else v85$1);
    v85$2 := (if p27$2 then $$L$2[$n.i1.3$2] else v85$2);
    $$L$1[$n.i1.3$1] := (if p27$1 then FMUL32($b.i.1$1, v85$1) else $$L$1[$n.i1.3$1]);
    $$L$2[$n.i1.3$2] := (if p27$2 then FMUL32($b.i.1$2, v85$2) else $$L$2[$n.i1.3$2]);
    $n.i1.3$1 := (if p27$1 then BV32_ADD($n.i1.3$1, 1bv32) else $n.i1.3$1);
    $n.i1.3$2 := (if p27$2 then BV32_ADD($n.i1.3$2, 1bv32) else $n.i1.3$2);
    p26$1 := (if p27$1 then true else p26$1);
    p26$2 := (if p27$2 then true else p26$2);
    goto $37.backedge, $37.tail;

  $37.tail:
    assume !p26$1 && !p26$2;
    call {:sourceloc} {:sourceloc_num 121} _LOG_WRITE_$$d_v(p1$1, $path.0$1, v76$1, $$d_v[$path.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_v(p1$2, $path.0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 121} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 121} _CHECK_WRITE_$$d_v(p1$2, $path.0$2, v76$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_v"} true;
    $$d_v[$path.0$1] := (if p1$1 then v76$1 else $$d_v[$path.0$1]);
    $$d_v[$path.0$2] := (if p1$2 then v76$2 else $$d_v[$path.0$2]);
    v86$1 := (if p1$1 then $$Nmat$1[0bv32] else v86$1);
    v86$2 := (if p1$2 then $$Nmat$2[0bv32] else v86$2);
    $n.i4.0$1 := (if p1$1 then BV32_SUB(v86$1, 1bv32) else $n.i4.0$1);
    $n.i4.0$2 := (if p1$2 then BV32_SUB(v86$2, 1bv32) else $n.i4.0$2);
    p28$1 := (if p1$1 then true else p28$1);
    p28$2 := (if p1$2 then true else p28$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $39;

  $39:
    assume {:captureState "loop_head_state_1"} true;
    assume {:invGenSkippedLoop} true;
    assert p28$1 ==> p0$1;
    assert p28$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 123} p28$1 ==> true;
    v87$1 := (if p28$1 then BV32_SGE($n.i4.0$1, 0bv32) else v87$1);
    v87$2 := (if p28$2 then BV32_SGE($n.i4.0$2, 0bv32) else v87$2);
    p29$1 := false;
    p29$2 := false;
    p30$1 := false;
    p30$2 := false;
    p29$1 := (if p28$1 && v87$1 then v87$1 else p29$1);
    p29$2 := (if p28$2 && v87$2 then v87$2 else p29$2);
    p28$1 := (if p28$1 && !v87$1 then v87$1 else p28$1);
    p28$2 := (if p28$2 && !v87$2 then v87$2 else p28$2);
    v88$1 := (if p29$1 then $$N$1[0bv32] else v88$1);
    v88$2 := (if p29$2 then $$N$2[0bv32] else v88$2);
    $v1.i.0$1, $i.i3.0$1 := (if p29$1 then 0bv32 else $v1.i.0$1), (if p29$1 then BV32_SUB(v88$1, 1bv32) else $i.i3.0$1);
    $v1.i.0$2, $i.i3.0$2 := (if p29$2 then 0bv32 else $v1.i.0$2), (if p29$2 then BV32_SUB(v88$2, 1bv32) else $i.i3.0$2);
    p30$1 := (if p29$1 then true else p30$1);
    p30$2 := (if p29$2 then true else p30$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $41;

  $41:
    assume {:captureState "loop_head_state_2"} true;
    assume {:invGenSkippedLoop} true;
    assert p30$1 ==> p28$1;
    assert p30$2 ==> p28$2;
    assert p28$1 ==> p0$1;
    assert p28$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 126} p30$1 ==> true;
    v89$1 := (if p30$1 then BV32_SGT($i.i3.0$1, $n.i4.0$1) else v89$1);
    v89$2 := (if p30$2 then BV32_SGT($i.i3.0$2, $n.i4.0$2) else v89$2);
    p31$1 := false;
    p31$2 := false;
    p31$1 := (if p30$1 && v89$1 then v89$1 else p31$1);
    p31$2 := (if p30$2 && v89$2 then v89$2 else p31$2);
    p30$1 := (if p30$1 && !v89$1 then v89$1 else p30$1);
    p30$2 := (if p30$2 && !v89$2 then v89$2 else p30$2);
    v90$1 := (if p31$1 then $$lambda$1[BV32_SUB(BV32_SUB($i.i3.0$1, $n.i4.0$1), 1bv32)] else v90$1);
    v90$2 := (if p31$2 then $$lambda$2[BV32_SUB(BV32_SUB($i.i3.0$2, $n.i4.0$2), 1bv32)] else v90$2);
    v91$1 := (if p31$1 then $$N$1[0bv32] else v91$1);
    v91$2 := (if p31$2 then $$N$2[0bv32] else v91$2);
    v92$1 := (if p31$1 then $$L2$1[BV32_ADD($i.i3.0$1, BV32_MUL(BV32_ADD($n.i4.0$1, 1bv32), v91$1))] else v92$1);
    v92$2 := (if p31$2 then $$L2$2[BV32_ADD($i.i3.0$2, BV32_MUL(BV32_ADD($n.i4.0$2, 1bv32), v91$2))] else v92$2);
    v93$1 := (if p31$1 then $$L$1[$i.i3.0$1] else v93$1);
    v93$2 := (if p31$2 then $$L$2[$i.i3.0$2] else v93$2);
    v94$1 := (if p31$1 then FADD32($v1.i.0$1, FMUL32(FMUL32(v90$1, v92$1), v93$1)) else v94$1);
    v94$2 := (if p31$2 then FADD32($v1.i.0$2, FMUL32(FMUL32(v90$2, v92$2), v93$2)) else v94$2);
    v95$1 := (if p31$1 then $$delta$1[0bv32] else v95$1);
    v95$2 := (if p31$2 then $$delta$2[0bv32] else v95$2);
    v96$1 := (if p31$1 then $$delta$1[0bv32] else v96$1);
    v96$2 := (if p31$2 then $$delta$2[0bv32] else v96$2);
    v97$1 := (if p31$1 then $$N$1[0bv32] else v97$1);
    v97$2 := (if p31$2 then $$N$2[0bv32] else v97$2);
    v98$1 := (if p31$1 then $$L2$1[BV32_ADD($i.i3.0$1, BV32_MUL($n.i4.0$1, v97$1))] else v98$1);
    v98$2 := (if p31$2 then $$L2$2[BV32_ADD($i.i3.0$2, BV32_MUL($n.i4.0$2, v97$2))] else v98$2);
    call {:sourceloc_num 136} v99$1, v99$2 := $__fdividef(p31$1, v95$1, FP64_CONV32(FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v96$1, v98$1)))), p31$2, v95$2, FP64_CONV32(FADD64(4607182418800017408bv64, FP32_CONV64(FMUL32(v96$2, v98$2)))));
    assume {:captureState "call_return_state_0"} {:procedureName "$__fdividef"} true;
    v100$1 := (if p31$1 then $$L$1[$i.i3.0$1] else v100$1);
    v100$2 := (if p31$2 then $$L$2[$i.i3.0$2] else v100$2);
    v101$1 := (if p31$1 then $$N$1[0bv32] else v101$1);
    v101$2 := (if p31$2 then $$N$2[0bv32] else v101$2);
    v102$1 := (if p31$1 then $$L2$1[BV32_ADD($i.i3.0$1, BV32_MUL(BV32_ADD($n.i4.0$1, 1bv32), v101$1))] else v102$1);
    v102$2 := (if p31$2 then $$L2$2[BV32_ADD($i.i3.0$2, BV32_MUL(BV32_ADD($n.i4.0$2, 1bv32), v101$2))] else v102$2);
    v103$1 := (if p31$1 then $$N$1[0bv32] else v103$1);
    v103$2 := (if p31$2 then $$N$2[0bv32] else v103$2);
    v104$1 := (if p31$1 then $$L2$1[BV32_ADD($i.i3.0$1, BV32_MUL($n.i4.0$1, v103$1))] else v104$1);
    v104$2 := (if p31$2 then $$L2$2[BV32_ADD($i.i3.0$2, BV32_MUL($n.i4.0$2, v103$2))] else v104$2);
    call {:sourceloc_num 142} v105$1, v105$2 := $__fdividef(p31$1, v102$1, v104$1, p31$2, v102$2, v104$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$__fdividef"} true;
    v106$1 := (if p31$1 then $$lambda$1[BV32_SUB(BV32_SUB($i.i3.0$1, $n.i4.0$1), 1bv32)] else v106$1);
    v106$2 := (if p31$2 then $$lambda$2[BV32_SUB(BV32_SUB($i.i3.0$2, $n.i4.0$2), 1bv32)] else v106$2);
    $$L$1[$i.i3.0$1] := (if p31$1 then FADD32(FMUL32(v100$1, v105$1), FMUL32(FMUL32(FMUL32(v94$1, v106$1), v99$1), v99$1)) else $$L$1[$i.i3.0$1]);
    $$L$2[$i.i3.0$2] := (if p31$2 then FADD32(FMUL32(v100$2, v105$2), FMUL32(FMUL32(FMUL32(v94$2, v106$2), v99$2), v99$2)) else $$L$2[$i.i3.0$2]);
    $v1.i.0$1, $i.i3.0$1 := (if p31$1 then v94$1 else $v1.i.0$1), (if p31$1 then BV32_ADD($i.i3.0$1, 4294967295bv32) else $i.i3.0$1);
    $v1.i.0$2, $i.i3.0$2 := (if p31$2 then v94$2 else $v1.i.0$2), (if p31$2 then BV32_ADD($i.i3.0$2, 4294967295bv32) else $i.i3.0$2);
    p30$1 := (if p31$1 then true else p30$1);
    p30$2 := (if p31$2 then true else p30$2);
    goto $41.backedge, $41.tail;

  $41.tail:
    assume !p30$1 && !p30$2;
    $n.i4.0$1 := (if p29$1 then BV32_ADD($n.i4.0$1, 4294967295bv32) else $n.i4.0$1);
    $n.i4.0$2 := (if p29$2 then BV32_ADD($n.i4.0$2, 4294967295bv32) else $n.i4.0$2);
    p28$1 := (if p29$1 then true else p28$1);
    p28$2 := (if p29$2 then true else p28$2);
    goto $39.backedge, $39.tail;

  $39.tail:
    assume !p28$1 && !p28$2;
    v107$1 := (if p1$1 then $$L$1[79bv32] else v107$1);
    v107$2 := (if p1$2 then $$L$2[79bv32] else v107$2);
    call {:sourceloc} {:sourceloc_num 148} _LOG_WRITE_$$d_Lb(p1$1, $path.0$1, v107$1, $$d_Lb[$path.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Lb(p1$2, $path.0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 148} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 148} _CHECK_WRITE_$$d_Lb(p1$2, $path.0$2, v107$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Lb"} true;
    $$d_Lb[$path.0$1] := (if p1$1 then v107$1 else $$d_Lb[$path.0$1]);
    $$d_Lb[$path.0$2] := (if p1$2 then v107$2 else $$d_Lb[$path.0$2]);
    $path.0$1 := (if p1$1 then BV32_ADD($path.0$1, BV32_MUL(group_size_x, num_groups_x)) else $path.0$1);
    $path.0$2 := (if p1$2 then BV32_ADD($path.0$2, BV32_MUL(group_size_x, num_groups_x)) else $path.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    return;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $39.backedge:
    assume {:backedge} p28$1 || p28$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $39;

  $41.backedge:
    assume {:backedge} p30$1 || p30$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $41;

  $37.backedge:
    assume {:backedge} p26$1 || p26$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $37;

  $34.backedge:
    assume {:backedge} p24$1 || p24$2;
    assume {:captureState "loop_back_edge_state_4_0"} true;
    goto $34;

  $31.backedge:
    assume {:backedge} p22$1 || p22$2;
    assume {:captureState "loop_back_edge_state_5_0"} true;
    goto $31;

  $26.backedge:
    assume {:backedge} p18$1 || p18$2;
    assume {:captureState "loop_back_edge_state_6_0"} true;
    goto $26;

  $21.backedge:
    assume {:backedge} p14$1 || p14$2;
    assume {:captureState "loop_back_edge_state_7_0"} true;
    goto $21;

  $18.backedge:
    assume {:backedge} p12$1 || p12$2;
    assume {:captureState "loop_back_edge_state_8_0"} true;
    goto $18;

  $15.backedge:
    assume {:backedge} p10$1 || p10$2;
    assume {:captureState "loop_back_edge_state_9_0"} true;
    goto $15;

  $10.backedge:
    assume {:backedge} p6$1 || p6$2;
    assume {:captureState "loop_back_edge_state_10_0"} true;
    goto $10;

  $12.backedge:
    assume {:backedge} p8$1 || p8$2;
    assume {:captureState "loop_back_edge_state_11_0"} true;
    goto $12;

  $7.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_12_0"} true;
    goto $7;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_13_0"} true;
    goto $3;
}



procedure {:source_name "__fdividef"} $__fdividef(_P$1: bool, $0$1: bv32, $1$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "__expf"} $__expf(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const _WATCHED_VALUE_$$d_v: bv32;

procedure {:inline 1} _LOG_READ_$$d_v(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_v;



implementation {:inline 1} _LOG_READ_$$d_v(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_v == _value then true else _READ_HAS_OCCURRED_$$d_v);
    return;
}



procedure _CHECK_READ_$$d_v(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_v"} {:array "$$d_v"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_v && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_v);
  requires {:source_name "d_v"} {:array "$$d_v"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_v && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_v: bool;

procedure {:inline 1} _LOG_WRITE_$$d_v(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_v, _WRITE_READ_BENIGN_FLAG_$$d_v;



implementation {:inline 1} _LOG_WRITE_$$d_v(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_v == _value then true else _WRITE_HAS_OCCURRED_$$d_v);
    _WRITE_READ_BENIGN_FLAG_$$d_v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_v == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_v);
    return;
}



procedure _CHECK_WRITE_$$d_v(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_v"} {:array "$$d_v"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_v && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_v != _value);
  requires {:source_name "d_v"} {:array "$$d_v"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_v && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_v != _value);
  requires {:source_name "d_v"} {:array "$$d_v"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_v && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_v(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_v;



implementation {:inline 1} _LOG_ATOMIC_$$d_v(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_v);
    return;
}



procedure _CHECK_ATOMIC_$$d_v(_P: bool, _offset: bv32);
  requires {:source_name "d_v"} {:array "$$d_v"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_v && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_v"} {:array "$$d_v"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_v && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_v(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_v;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_v(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_v := (if _P && _WRITE_HAS_OCCURRED_$$d_v && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_v);
    return;
}



const _WATCHED_VALUE_$$d_Lb: bv32;

procedure {:inline 1} _LOG_READ_$$d_Lb(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Lb;



implementation {:inline 1} _LOG_READ_$$d_Lb(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Lb := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Lb == _value then true else _READ_HAS_OCCURRED_$$d_Lb);
    return;
}



procedure _CHECK_READ_$$d_Lb(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Lb"} {:array "$$d_Lb"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Lb && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Lb);
  requires {:source_name "d_Lb"} {:array "$$d_Lb"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Lb && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Lb: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Lb(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Lb, _WRITE_READ_BENIGN_FLAG_$$d_Lb;



implementation {:inline 1} _LOG_WRITE_$$d_Lb(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Lb := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Lb == _value then true else _WRITE_HAS_OCCURRED_$$d_Lb);
    _WRITE_READ_BENIGN_FLAG_$$d_Lb := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Lb == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Lb);
    return;
}



procedure _CHECK_WRITE_$$d_Lb(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Lb"} {:array "$$d_Lb"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Lb && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Lb != _value);
  requires {:source_name "d_Lb"} {:array "$$d_Lb"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Lb && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Lb != _value);
  requires {:source_name "d_Lb"} {:array "$$d_Lb"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Lb && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Lb(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Lb;



implementation {:inline 1} _LOG_ATOMIC_$$d_Lb(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Lb := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Lb);
    return;
}



procedure _CHECK_ATOMIC_$$d_Lb(_P: bool, _offset: bv32);
  requires {:source_name "d_Lb"} {:array "$$d_Lb"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Lb && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Lb"} {:array "$$d_Lb"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Lb && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Lb(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Lb;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Lb(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Lb := (if _P && _WRITE_HAS_OCCURRED_$$d_Lb && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Lb);
    return;
}



var _TRACKING: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;
