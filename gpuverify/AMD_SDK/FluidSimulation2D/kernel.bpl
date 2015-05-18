type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



axiom {:array_info "$$if0"} {:global} {:elem_width 64} {:source_name "if0"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$if0: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$if0: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$if0: bool;

var {:source_name "of0"} {:global} $$of0: [bv32]bv64;

axiom {:array_info "$$of0"} {:global} {:elem_width 64} {:source_name "of0"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$of0: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$of0: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$of0: bool;

axiom {:array_info "$$if1234"} {:global} {:elem_width 64} {:source_name "if1234"} {:source_elem_width 256} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$if1234: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$if1234: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$if1234: bool;

var {:source_name "of1234"} {:global} $$of1234: [bv32]bv64;

axiom {:array_info "$$of1234"} {:global} {:elem_width 64} {:source_name "of1234"} {:source_elem_width 256} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$of1234: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$of1234: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$of1234: bool;

axiom {:array_info "$$if5678"} {:global} {:elem_width 64} {:source_name "if5678"} {:source_elem_width 256} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$if5678: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$if5678: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$if5678: bool;

var {:source_name "of5678"} {:global} $$of5678: [bv32]bv64;

axiom {:array_info "$$of5678"} {:global} {:elem_width 64} {:source_name "of5678"} {:source_elem_width 256} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$of5678: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$of5678: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 256} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$of5678: bool;

var {:source_name "type"} {:global} $$type: [bv32]bv8;

axiom {:array_info "$$type"} {:global} {:elem_width 8} {:source_name "type"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$type: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$type: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$type: bool;

var {:source_name "weight"} {:constant} $$weight$1: [bv32]bv64;

var {:source_name "weight"} {:constant} $$weight$2: [bv32]bv64;

axiom {:array_info "$$weight"} {:constant} {:elem_width 64} {:source_name "weight"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:source_name "velocityBuffer"} {:global} $$velocityBuffer: [bv32]bv64;

axiom {:array_info "$$velocityBuffer"} {:global} {:elem_width 64} {:source_name "velocityBuffer"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$velocityBuffer: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$velocityBuffer: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$velocityBuffer: bool;

const _WATCHED_OFFSET: bv32;

const {:group_id_x} group_id_x: bv32;

const {:group_id_y} group_id_y: bv32;

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

function FADD64(bv64, bv64) : bv64;

function FDIV64(bv64, bv64) : bv64;

function FMUL64(bv64, bv64) : bv64;

function FP64_TO_SI32(bv64) : bv32;

function FSUB64(bv64, bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

procedure {:source_name "lbm"} {:kernel} $lbm($dirX: bv512, $dirY: bv512, $omega: bv64);
  requires !_READ_HAS_OCCURRED_$$if0 && !_WRITE_HAS_OCCURRED_$$if0 && !_ATOMIC_HAS_OCCURRED_$$if0;
  requires !_READ_HAS_OCCURRED_$$of0 && !_WRITE_HAS_OCCURRED_$$of0 && !_ATOMIC_HAS_OCCURRED_$$of0;
  requires !_READ_HAS_OCCURRED_$$if1234 && !_WRITE_HAS_OCCURRED_$$if1234 && !_ATOMIC_HAS_OCCURRED_$$if1234;
  requires !_READ_HAS_OCCURRED_$$of1234 && !_WRITE_HAS_OCCURRED_$$of1234 && !_ATOMIC_HAS_OCCURRED_$$of1234;
  requires !_READ_HAS_OCCURRED_$$if5678 && !_WRITE_HAS_OCCURRED_$$if5678 && !_ATOMIC_HAS_OCCURRED_$$if5678;
  requires !_READ_HAS_OCCURRED_$$of5678 && !_WRITE_HAS_OCCURRED_$$of5678 && !_ATOMIC_HAS_OCCURRED_$$of5678;
  requires !_READ_HAS_OCCURRED_$$type && !_WRITE_HAS_OCCURRED_$$type && !_ATOMIC_HAS_OCCURRED_$$type;
  requires !_READ_HAS_OCCURRED_$$velocityBuffer && !_WRITE_HAS_OCCURRED_$$velocityBuffer && !_ATOMIC_HAS_OCCURRED_$$velocityBuffer;
  requires BV32_SGT(group_size_x, 0bv32);
  requires BV32_SGT(num_groups_x, 0bv32);
  requires BV32_SGE(group_id_x, 0bv32);
  requires BV32_SLT(group_id_x, num_groups_x);
  requires BV32_SGE(local_id_x$1, 0bv32);
  requires BV32_SGE(local_id_x$2, 0bv32);
  requires BV32_SLT(local_id_x$1, group_size_x);
  requires BV32_SLT(local_id_x$2, group_size_x);
  requires BV32_SGT(group_size_y, 0bv32);
  requires BV32_SGT(num_groups_y, 0bv32);
  requires BV32_SGE(group_id_y, 0bv32);
  requires BV32_SLT(group_id_y, num_groups_y);
  requires BV32_SGE(local_id_y$1, 0bv32);
  requires BV32_SGE(local_id_y$2, 0bv32);
  requires BV32_SLT(local_id_y$1, group_size_y);
  requires BV32_SLT(local_id_y$2, group_size_y);
  requires BV32_SGT(group_size_z, 0bv32);
  requires BV32_SGT(num_groups_z, 0bv32);
  requires BV32_SGE(group_id_z, 0bv32);
  requires BV32_SLT(group_id_z, num_groups_z);
  requires BV32_SGE(local_id_z$1, 0bv32);
  requires BV32_SGE(local_id_z$2, 0bv32);
  requires BV32_SLT(local_id_z$1, group_size_z);
  requires BV32_SLT(local_id_z$2, group_size_z);
  requires true ==> local_id_x$1 != local_id_x$2 || local_id_y$1 != local_id_y$2 || local_id_z$1 != local_id_z$2;
  requires true;
  modifies _WRITE_HAS_OCCURRED_$$velocityBuffer, _WRITE_READ_BENIGN_FLAG_$$velocityBuffer, _WRITE_READ_BENIGN_FLAG_$$velocityBuffer, _WRITE_HAS_OCCURRED_$$of0, _WRITE_READ_BENIGN_FLAG_$$of0, _WRITE_READ_BENIGN_FLAG_$$of0, _READ_HAS_OCCURRED_$$of1234, _WRITE_HAS_OCCURRED_$$of1234, _WRITE_READ_BENIGN_FLAG_$$of1234, _WRITE_READ_BENIGN_FLAG_$$of1234, $$of0, $$of1234, $$of5678, $$velocityBuffer, _TRACKING, _TRACKING, _TRACKING, _READ_HAS_OCCURRED_$$of5678, _WRITE_HAS_OCCURRED_$$of5678, _WRITE_READ_BENIGN_FLAG_$$of5678, _WRITE_READ_BENIGN_FLAG_$$of5678, _TRACKING, _TRACKING, _TRACKING;



implementation {:source_name "lbm"} {:kernel} $lbm($dirX: bv512, $dirY: bv512, $omega: bv64)
{
  var $f0.0$1: bv64;
  var $f0.0$2: bv64;
  var $f1234.0$1: bv256;
  var $f1234.0$2: bv256;
  var $f5678.0$1: bv256;
  var $f5678.0$2: bv256;
  var $u.0$1: bv128;
  var $u.0$2: bv128;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv64;
  var v4$2: bv64;
  var v5$1: bv64;
  var v5$2: bv64;
  var v6$1: bv64;
  var v6$2: bv64;
  var v7$1: bv64;
  var v7$2: bv64;
  var v8$1: bv64;
  var v8$2: bv64;
  var v9$1: bv64;
  var v9$2: bv64;
  var v10$1: bv64;
  var v10$2: bv64;
  var v11$1: bv64;
  var v11$2: bv64;
  var v12$1: bv64;
  var v12$2: bv64;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv64;
  var v14$2: bv64;
  var v15$1: bv64;
  var v15$2: bv64;
  var v16$1: bv64;
  var v16$2: bv64;
  var v17$1: bv64;
  var v17$2: bv64;
  var v18$1: bv64;
  var v18$2: bv64;
  var v19$1: bv64;
  var v19$2: bv64;
  var v20$1: bv64;
  var v20$2: bv64;
  var v21$1: bv64;
  var v21$2: bv64;
  var v22$1: bv64;
  var v22$2: bv64;
  var v23$1: bv64;
  var v23$2: bv64;
  var v24$1: bv64;
  var v24$2: bv64;
  var v25$1: bv64;
  var v25$2: bv64;
  var v26$1: bv64;
  var v26$2: bv64;
  var v27$1: bv64;
  var v27$2: bv64;
  var v28$1: bv64;
  var v28$2: bv64;
  var v29$1: bv64;
  var v29$2: bv64;
  var v30$1: bv64;
  var v30$2: bv64;
  var v31$1: bv64;
  var v31$2: bv64;
  var v32$1: bv64;
  var v32$2: bv64;
  var v33$1: bv64;
  var v33$2: bv64;
  var v34$1: bv64;
  var v34$2: bv64;
  var v35$1: bv64;
  var v35$2: bv64;
  var v36$1: bv64;
  var v36$2: bv64;
  var v37$1: bv64;
  var v37$2: bv64;
  var v38$1: bv64;
  var v38$2: bv64;
  var v39$1: bv64;
  var v39$2: bv64;
  var v40$1: bv64;
  var v40$2: bv64;
  var v41$1: bv64;
  var v41$2: bv64;
  var v42$1: bv64;
  var v42$2: bv64;
  var v43$1: bv64;
  var v43$2: bv64;
  var v44$1: bv64;
  var v44$2: bv64;
  var v45$1: bv64;
  var v45$2: bv64;
  var v46$1: bv64;
  var v46$2: bv64;
  var v47$1: bv64;
  var v47$2: bv64;
  var v48$1: bv64;
  var v48$2: bv64;
  var v49$1: bv64;
  var v49$2: bv64;
  var v50$1: bv64;
  var v50$2: bv64;
  var v51$1: bv64;
  var v51$2: bv64;
  var v52$1: bv64;
  var v52$2: bv64;
  var v61$1: bv32;
  var v61$2: bv32;
  var v53$1: bv32;
  var v53$2: bv32;
  var v54$1: bv32;
  var v54$2: bv32;
  var v55$1: bv32;
  var v55$2: bv32;
  var v58$1: bv32;
  var v58$2: bv32;
  var v56$1: bv32;
  var v56$2: bv32;
  var v57$1: bv32;
  var v57$2: bv32;
  var v59$1: bv32;
  var v59$2: bv32;
  var v60$1: bv32;
  var v60$2: bv32;
  var v62$1: bv32;
  var v62$2: bv32;
  var v63$1: bv32;
  var v63$2: bv32;
  var v64$1: bv32;
  var v64$2: bv32;
  var v65$1: bool;
  var v65$2: bool;
  var v66$1: bv64;
  var v66$2: bv64;
  var v67$1: bv64;
  var v67$2: bv64;
  var v68$1: bv64;
  var v68$2: bv64;
  var v69$1: bv64;
  var v69$2: bv64;
  var v70$1: bool;
  var v70$2: bool;
  var v71$1: bv64;
  var v71$2: bv64;
  var v72$1: bv64;
  var v72$2: bv64;
  var v73$1: bv64;
  var v73$2: bv64;
  var v74$1: bv64;
  var v74$2: bv64;
  var v75$1: bool;
  var v75$2: bool;
  var v76$1: bv64;
  var v76$2: bv64;
  var v77$1: bv64;
  var v77$2: bv64;
  var v78$1: bv64;
  var v78$2: bv64;
  var v79$1: bv64;
  var v79$2: bv64;
  var v97$1: bool;
  var v97$2: bool;
  var v80$1: bool;
  var v80$2: bool;
  var v81$1: bv64;
  var v81$2: bv64;
  var v82$1: bv64;
  var v82$2: bv64;
  var v83$1: bv64;
  var v83$2: bv64;
  var v84$1: bv64;
  var v84$2: bv64;
  var v85$1: bool;
  var v85$2: bool;
  var v86$1: bool;
  var v86$2: bool;
  var v87$1: bv64;
  var v87$2: bv64;
  var v88$1: bv64;
  var v88$2: bv64;
  var v89$1: bv64;
  var v89$2: bv64;
  var v90$1: bv64;
  var v90$2: bv64;
  var v91$1: bool;
  var v91$2: bool;
  var v92$1: bool;
  var v92$2: bool;
  var v93$1: bv64;
  var v93$2: bv64;
  var v94$1: bv64;
  var v94$2: bv64;
  var v95$1: bv64;
  var v95$2: bv64;
  var v96$1: bv64;
  var v96$2: bv64;
  var v98$1: bool;
  var v98$2: bool;
  var v99$1: bv64;
  var v99$2: bv64;
  var v100$1: bv64;
  var v100$2: bv64;
  var v101$1: bv64;
  var v101$2: bv64;
  var v102$1: bv64;
  var v102$2: bv64;
  var v103$1: bool;
  var v103$2: bool;
  var v104$1: bool;
  var v104$2: bool;
  var v105$1: bv64;
  var v105$2: bv64;
  var v106$1: bv64;
  var v106$2: bv64;
  var v107$1: bv64;
  var v107$2: bv64;
  var v108$1: bv64;
  var v108$2: bv64;
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


  __partitioned_block_$0_0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y), local_id_y$2);
    v2 := BV32_MUL(group_size_x, num_groups_x);
    v3$1 := BV32_ADD(v0$1, BV32_MUL(v2, v1$1));
    v3$2 := BV32_ADD(v0$2, BV32_MUL(v2, v1$2));
    havoc v4$1, v4$2;
    havoc v5$1, v5$2;
    havoc v6$1, v6$2;
    havoc v7$1, v7$2;
    havoc v8$1, v8$2;
    havoc v9$1, v9$2;
    havoc v10$1, v10$2;
    havoc v11$1, v11$2;
    havoc v12$1, v12$2;
    v13$1 := $$type[v3$1];
    v13$2 := $$type[v3$2];
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
    p0$1 := (if v13$1[1:0] == 1bv1 then v13$1[1:0] == 1bv1 else p0$1);
    p0$2 := (if v13$2[1:0] == 1bv1 then v13$2[1:0] == 1bv1 else p0$2);
    p1$1 := (if !(v13$1[1:0] == 1bv1) then !(v13$1[1:0] == 1bv1) else p1$1);
    p1$2 := (if !(v13$2[1:0] == 1bv1) then !(v13$2[1:0] == 1bv1) else p1$2);
    $f0.0$1, $f1234.0$1, $f5678.0$1, $u.0$1 := (if p0$1 then v4$1 else $f0.0$1), (if p0$1 then v6$1 ++ v5$1 ++ v8$1 ++ v7$1 else $f1234.0$1), (if p0$1 then v10$1 ++ v9$1 ++ v12$1 ++ v11$1 else $f5678.0$1), (if p0$1 then 0bv128 else $u.0$1);
    $f0.0$2, $f1234.0$2, $f5678.0$2, $u.0$2 := (if p0$2 then v4$2 else $f0.0$2), (if p0$2 then v6$2 ++ v5$2 ++ v8$2 ++ v7$2 else $f1234.0$2), (if p0$2 then v10$2 ++ v9$2 ++ v12$2 ++ v11$2 else $f5678.0$2), (if p0$2 then 0bv128 else $u.0$2);
    v14$1 := (if p1$1 then FADD64(FADD64(FADD64(FADD64(v5$1, v9$1), FADD64(v7$1, v11$1)), FADD64(FADD64(v6$1, v10$1), FADD64(v8$1, v12$1))), v4$1) else v14$1);
    v14$2 := (if p1$2 then FADD64(FADD64(FADD64(FADD64(v5$2, v9$2), FADD64(v7$2, v11$2)), FADD64(FADD64(v6$2, v10$2), FADD64(v8$2, v12$2))), v4$2) else v14$2);
    v15$1 := (if p1$1 then $dirX[64:0] else v15$1);
    v15$2 := (if p1$2 then $dirX[64:0] else v15$2);
    v16$1 := (if p1$1 then $dirX[128:64] else v16$1);
    v16$2 := (if p1$2 then $dirX[128:64] else v16$2);
    v17$1 := (if p1$1 then $dirX[192:128] else v17$1);
    v17$2 := (if p1$2 then $dirX[192:128] else v17$2);
    v18$1 := (if p1$1 then $dirX[256:192] else v18$1);
    v18$2 := (if p1$2 then $dirX[256:192] else v18$2);
    v19$1 := (if p1$1 then $dirX[320:256] else v19$1);
    v19$2 := (if p1$2 then $dirX[320:256] else v19$2);
    v20$1 := (if p1$1 then $dirX[384:320] else v20$1);
    v20$2 := (if p1$2 then $dirX[384:320] else v20$2);
    v21$1 := (if p1$1 then $dirX[448:384] else v21$1);
    v21$2 := (if p1$2 then $dirX[448:384] else v21$2);
    v22$1 := (if p1$1 then $dirX[512:448] else v22$1);
    v22$2 := (if p1$2 then $dirX[512:448] else v22$2);
    v23$1 := (if p1$1 then FDIV64(FADD64(FADD64(FMUL64(v8$1, v18$1), FADD64(FMUL64(v7$1, v17$1), FADD64(FMUL64(v5$1, v15$1), FMUL64(v6$1, v16$1)))), FADD64(FMUL64(v12$1, v22$1), FADD64(FMUL64(v11$1, v21$1), FADD64(FMUL64(v9$1, v19$1), FMUL64(v10$1, v20$1))))), v14$1) else v23$1);
    v23$2 := (if p1$2 then FDIV64(FADD64(FADD64(FMUL64(v8$2, v18$2), FADD64(FMUL64(v7$2, v17$2), FADD64(FMUL64(v5$2, v15$2), FMUL64(v6$2, v16$2)))), FADD64(FMUL64(v12$2, v22$2), FADD64(FMUL64(v11$2, v21$2), FADD64(FMUL64(v9$2, v19$2), FMUL64(v10$2, v20$2))))), v14$2) else v23$2);
    v24$1 := (if p1$1 then $dirY[64:0] else v24$1);
    v24$2 := (if p1$2 then $dirY[64:0] else v24$2);
    v25$1 := (if p1$1 then $dirY[128:64] else v25$1);
    v25$2 := (if p1$2 then $dirY[128:64] else v25$2);
    v26$1 := (if p1$1 then $dirY[192:128] else v26$1);
    v26$2 := (if p1$2 then $dirY[192:128] else v26$2);
    v27$1 := (if p1$1 then $dirY[256:192] else v27$1);
    v27$2 := (if p1$2 then $dirY[256:192] else v27$2);
    v28$1 := (if p1$1 then $dirY[320:256] else v28$1);
    v28$2 := (if p1$2 then $dirY[320:256] else v28$2);
    v29$1 := (if p1$1 then $dirY[384:320] else v29$1);
    v29$2 := (if p1$2 then $dirY[384:320] else v29$2);
    v30$1 := (if p1$1 then $dirY[448:384] else v30$1);
    v30$2 := (if p1$2 then $dirY[448:384] else v30$2);
    v31$1 := (if p1$1 then $dirY[512:448] else v31$1);
    v31$2 := (if p1$2 then $dirY[512:448] else v31$2);
    v32$1 := (if p1$1 then FDIV64(FADD64(FADD64(FMUL64(v8$1, v27$1), FADD64(FMUL64(v7$1, v26$1), FADD64(FMUL64(v5$1, v24$1), FMUL64(v6$1, v25$1)))), FADD64(FMUL64(v12$1, v31$1), FADD64(FMUL64(v11$1, v30$1), FADD64(FMUL64(v9$1, v28$1), FMUL64(v10$1, v29$1))))), v14$1) else v32$1);
    v32$2 := (if p1$2 then FDIV64(FADD64(FADD64(FMUL64(v8$2, v27$2), FADD64(FMUL64(v7$2, v26$2), FADD64(FMUL64(v5$2, v24$2), FMUL64(v6$2, v25$2)))), FADD64(FMUL64(v12$2, v31$2), FADD64(FMUL64(v11$2, v30$2), FADD64(FMUL64(v9$2, v28$2), FMUL64(v10$2, v29$2))))), v14$2) else v32$2);
    v33$1 := (if p1$1 then $$weight$1[0bv32] else v33$1);
    v33$2 := (if p1$2 then $$weight$2[0bv32] else v33$2);
    v34$1 := (if p1$1 then FADD64(FMUL64(0bv64, v23$1), FMUL64(0bv64, v32$1)) else v34$1);
    v34$2 := (if p1$2 then FADD64(FMUL64(0bv64, v23$2), FMUL64(0bv64, v32$2)) else v34$2);
    v35$1 := (if p1$1 then $$weight$1[1bv32] else v35$1);
    v35$2 := (if p1$2 then $$weight$2[1bv32] else v35$2);
    v36$1 := (if p1$1 then FADD64(FMUL64($dirX[64:0], v23$1), FMUL64($dirY[64:0], v32$1)) else v36$1);
    v36$2 := (if p1$2 then FADD64(FMUL64($dirX[64:0], v23$2), FMUL64($dirY[64:0], v32$2)) else v36$2);
    v37$1 := (if p1$1 then $$weight$1[2bv32] else v37$1);
    v37$2 := (if p1$2 then $$weight$2[2bv32] else v37$2);
    v38$1 := (if p1$1 then FADD64(FMUL64($dirX[128:64], v23$1), FMUL64($dirY[128:64], v32$1)) else v38$1);
    v38$2 := (if p1$2 then FADD64(FMUL64($dirX[128:64], v23$2), FMUL64($dirY[128:64], v32$2)) else v38$2);
    v39$1 := (if p1$1 then $$weight$1[3bv32] else v39$1);
    v39$2 := (if p1$2 then $$weight$2[3bv32] else v39$2);
    v40$1 := (if p1$1 then FADD64(FMUL64($dirX[192:128], v23$1), FMUL64($dirY[192:128], v32$1)) else v40$1);
    v40$2 := (if p1$2 then FADD64(FMUL64($dirX[192:128], v23$2), FMUL64($dirY[192:128], v32$2)) else v40$2);
    v41$1 := (if p1$1 then $$weight$1[4bv32] else v41$1);
    v41$2 := (if p1$2 then $$weight$2[4bv32] else v41$2);
    v42$1 := (if p1$1 then FADD64(FMUL64($dirX[256:192], v23$1), FMUL64($dirY[256:192], v32$1)) else v42$1);
    v42$2 := (if p1$2 then FADD64(FMUL64($dirX[256:192], v23$2), FMUL64($dirY[256:192], v32$2)) else v42$2);
    v43$1 := (if p1$1 then $$weight$1[5bv32] else v43$1);
    v43$2 := (if p1$2 then $$weight$2[5bv32] else v43$2);
    v44$1 := (if p1$1 then FADD64(FMUL64($dirX[320:256], v23$1), FMUL64($dirY[320:256], v32$1)) else v44$1);
    v44$2 := (if p1$2 then FADD64(FMUL64($dirX[320:256], v23$2), FMUL64($dirY[320:256], v32$2)) else v44$2);
    v45$1 := (if p1$1 then $$weight$1[6bv32] else v45$1);
    v45$2 := (if p1$2 then $$weight$2[6bv32] else v45$2);
    v46$1 := (if p1$1 then FADD64(FMUL64($dirX[384:320], v23$1), FMUL64($dirY[384:320], v32$1)) else v46$1);
    v46$2 := (if p1$2 then FADD64(FMUL64($dirX[384:320], v23$2), FMUL64($dirY[384:320], v32$2)) else v46$2);
    v47$1 := (if p1$1 then $$weight$1[7bv32] else v47$1);
    v47$2 := (if p1$2 then $$weight$2[7bv32] else v47$2);
    v48$1 := (if p1$1 then FADD64(FMUL64($dirX[448:384], v23$1), FMUL64($dirY[448:384], v32$1)) else v48$1);
    v48$2 := (if p1$2 then FADD64(FMUL64($dirX[448:384], v23$2), FMUL64($dirY[448:384], v32$2)) else v48$2);
    v49$1 := (if p1$1 then $$weight$1[8bv32] else v49$1);
    v49$2 := (if p1$2 then $$weight$2[8bv32] else v49$2);
    v50$1 := (if p1$1 then FADD64(FMUL64($dirX[512:448], v23$1), FMUL64($dirY[512:448], v32$1)) else v50$1);
    v50$2 := (if p1$2 then FADD64(FMUL64($dirX[512:448], v23$2), FMUL64($dirY[512:448], v32$2)) else v50$2);
    v51$1 := (if p1$1 then FSUB64(4607182418800017408bv64, $omega) else v51$1);
    v51$2 := (if p1$2 then FSUB64(4607182418800017408bv64, $omega) else v51$2);
    v52$1 := (if p1$1 then FSUB64(4607182418800017408bv64, $omega) else v52$1);
    v52$2 := (if p1$2 then FSUB64(4607182418800017408bv64, $omega) else v52$2);
    $f0.0$1, $f1234.0$1, $f5678.0$1, $u.0$1 := (if p1$1 then FADD64(FMUL64(FSUB64(4607182418800017408bv64, $omega), v4$1), FMUL64($omega, FMUL64(FMUL64(v14$1, v33$1), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$1, v23$1), FMUL64(v32$1, v32$1))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v34$1), v34$1), FADD64(FMUL64(4613937818241073152bv64, v34$1), 4607182418800017408bv64)))))) else $f0.0$1), (if p1$1 then FADD64(FMUL64(v51$1, v8$1), FMUL64($omega, FMUL64(FMUL64(v14$1, v41$1), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$1, v23$1), FMUL64(v32$1, v32$1))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v42$1), v42$1), FADD64(FMUL64(4613937818241073152bv64, v42$1), 4607182418800017408bv64)))))) ++ FADD64(FMUL64(v51$1, v7$1), FMUL64($omega, FMUL64(FMUL64(v14$1, v39$1), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$1, v23$1), FMUL64(v32$1, v32$1))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v40$1), v40$1), FADD64(FMUL64(4613937818241073152bv64, v40$1), 4607182418800017408bv64)))))) ++ FADD64(FMUL64(v51$1, v6$1), FMUL64($omega, FMUL64(FMUL64(v14$1, v37$1), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$1, v23$1), FMUL64(v32$1, v32$1))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v38$1), v38$1), FADD64(FMUL64(4613937818241073152bv64, v38$1), 4607182418800017408bv64)))))) ++ FADD64(FMUL64(v51$1, v5$1), FMUL64($omega, FMUL64(FMUL64(v14$1, v35$1), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$1, v23$1), FMUL64(v32$1, v32$1))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v36$1), v36$1), FADD64(FMUL64(4613937818241073152bv64, v36$1), 4607182418800017408bv64)))))) else $f1234.0$1), (if p1$1 then FADD64(FMUL64(v52$1, v12$1), FMUL64($omega, FMUL64(FMUL64(v14$1, v49$1), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$1, v23$1), FMUL64(v32$1, v32$1))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v50$1), v50$1), FADD64(FMUL64(4613937818241073152bv64, v50$1), 4607182418800017408bv64)))))) ++ FADD64(FMUL64(v52$1, v11$1), FMUL64($omega, FMUL64(FMUL64(v14$1, v47$1), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$1, v23$1), FMUL64(v32$1, v32$1))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v48$1), v48$1), FADD64(FMUL64(4613937818241073152bv64, v48$1), 4607182418800017408bv64)))))) ++ FADD64(FMUL64(v52$1, v10$1), FMUL64($omega, FMUL64(FMUL64(v14$1, v45$1), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$1, v23$1), FMUL64(v32$1, v32$1))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v46$1), v46$1), FADD64(FMUL64(4613937818241073152bv64, v46$1), 4607182418800017408bv64)))))) ++ FADD64(FMUL64(v52$1, v9$1), FMUL64($omega, FMUL64(FMUL64(v14$1, v43$1), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$1, v23$1), FMUL64(v32$1, v32$1))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v44$1), v44$1), FADD64(FMUL64(4613937818241073152bv64, v44$1), 4607182418800017408bv64)))))) else $f5678.0$1), (if p1$1 then v32$1 ++ v23$1 else $u.0$1);
    $f0.0$2, $f1234.0$2, $f5678.0$2, $u.0$2 := (if p1$2 then FADD64(FMUL64(FSUB64(4607182418800017408bv64, $omega), v4$2), FMUL64($omega, FMUL64(FMUL64(v14$2, v33$2), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$2, v23$2), FMUL64(v32$2, v32$2))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v34$2), v34$2), FADD64(FMUL64(4613937818241073152bv64, v34$2), 4607182418800017408bv64)))))) else $f0.0$2), (if p1$2 then FADD64(FMUL64(v51$2, v8$2), FMUL64($omega, FMUL64(FMUL64(v14$2, v41$2), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$2, v23$2), FMUL64(v32$2, v32$2))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v42$2), v42$2), FADD64(FMUL64(4613937818241073152bv64, v42$2), 4607182418800017408bv64)))))) ++ FADD64(FMUL64(v51$2, v7$2), FMUL64($omega, FMUL64(FMUL64(v14$2, v39$2), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$2, v23$2), FMUL64(v32$2, v32$2))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v40$2), v40$2), FADD64(FMUL64(4613937818241073152bv64, v40$2), 4607182418800017408bv64)))))) ++ FADD64(FMUL64(v51$2, v6$2), FMUL64($omega, FMUL64(FMUL64(v14$2, v37$2), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$2, v23$2), FMUL64(v32$2, v32$2))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v38$2), v38$2), FADD64(FMUL64(4613937818241073152bv64, v38$2), 4607182418800017408bv64)))))) ++ FADD64(FMUL64(v51$2, v5$2), FMUL64($omega, FMUL64(FMUL64(v14$2, v35$2), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$2, v23$2), FMUL64(v32$2, v32$2))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v36$2), v36$2), FADD64(FMUL64(4613937818241073152bv64, v36$2), 4607182418800017408bv64)))))) else $f1234.0$2), (if p1$2 then FADD64(FMUL64(v52$2, v12$2), FMUL64($omega, FMUL64(FMUL64(v14$2, v49$2), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$2, v23$2), FMUL64(v32$2, v32$2))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v50$2), v50$2), FADD64(FMUL64(4613937818241073152bv64, v50$2), 4607182418800017408bv64)))))) ++ FADD64(FMUL64(v52$2, v11$2), FMUL64($omega, FMUL64(FMUL64(v14$2, v47$2), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$2, v23$2), FMUL64(v32$2, v32$2))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v48$2), v48$2), FADD64(FMUL64(4613937818241073152bv64, v48$2), 4607182418800017408bv64)))))) ++ FADD64(FMUL64(v52$2, v10$2), FMUL64($omega, FMUL64(FMUL64(v14$2, v45$2), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$2, v23$2), FMUL64(v32$2, v32$2))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v46$2), v46$2), FADD64(FMUL64(4613937818241073152bv64, v46$2), 4607182418800017408bv64)))))) ++ FADD64(FMUL64(v52$2, v9$2), FMUL64($omega, FMUL64(FMUL64(v14$2, v43$2), FADD64(FMUL64(13832806255468478464bv64, FADD64(FMUL64(v23$2, v23$2), FMUL64(v32$2, v32$2))), FADD64(FMUL64(FMUL64(4616752568008179712bv64, v44$2), v44$2), FADD64(FMUL64(4613937818241073152bv64, v44$2), 4607182418800017408bv64)))))) else $f5678.0$2), (if p1$2 then v32$2 ++ v23$2 else $u.0$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$velocityBuffer(true, BV32_MUL(v3$1, 2bv32), $u.0$1[64:0], $$velocityBuffer[BV32_MUL(v3$1, 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$velocityBuffer(true, BV32_MUL(v3$2, 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$velocityBuffer(true, BV32_MUL(v3$2, 2bv32), $u.0$2[64:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$velocityBuffer"} true;
    $$velocityBuffer[BV32_MUL(v3$1, 2bv32)] := $u.0$1[64:0];
    $$velocityBuffer[BV32_MUL(v3$2, 2bv32)] := $u.0$2[64:0];
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$velocityBuffer(true, BV32_ADD(BV32_MUL(v3$1, 2bv32), 1bv32), $u.0$1[128:64], $$velocityBuffer[BV32_ADD(BV32_MUL(v3$1, 2bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$velocityBuffer(true, BV32_ADD(BV32_MUL(v3$2, 2bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$velocityBuffer(true, BV32_ADD(BV32_MUL(v3$2, 2bv32), 1bv32), $u.0$2[128:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$velocityBuffer"} true;
    $$velocityBuffer[BV32_ADD(BV32_MUL(v3$1, 2bv32), 1bv32)] := $u.0$1[128:64];
    $$velocityBuffer[BV32_ADD(BV32_MUL(v3$2, 2bv32), 1bv32)] := $u.0$2[128:64];
    v53$1 := BV32_ADD(BV32_ADD(v0$1, FP64_TO_SI32($dirX[64:0])), BV32_MUL(v2, BV32_ADD(v1$1, FP64_TO_SI32($dirY[64:0]))));
    v53$2 := BV32_ADD(BV32_ADD(v0$2, FP64_TO_SI32($dirX[64:0])), BV32_MUL(v2, BV32_ADD(v1$2, FP64_TO_SI32($dirY[64:0]))));
    v54$1 := BV32_ADD(BV32_ADD(v0$1, FP64_TO_SI32($dirX[128:64])), BV32_MUL(v2, BV32_ADD(v1$1, FP64_TO_SI32($dirY[128:64]))));
    v54$2 := BV32_ADD(BV32_ADD(v0$2, FP64_TO_SI32($dirX[128:64])), BV32_MUL(v2, BV32_ADD(v1$2, FP64_TO_SI32($dirY[128:64]))));
    v55$1 := BV32_ADD(BV32_ADD(v0$1, FP64_TO_SI32($dirX[192:128])), BV32_MUL(v2, BV32_ADD(v1$1, FP64_TO_SI32($dirY[192:128]))));
    v55$2 := BV32_ADD(BV32_ADD(v0$2, FP64_TO_SI32($dirX[192:128])), BV32_MUL(v2, BV32_ADD(v1$2, FP64_TO_SI32($dirY[192:128]))));
    v56$1 := BV32_ADD(BV32_ADD(v0$1, FP64_TO_SI32($dirX[256:192])), BV32_MUL(v2, BV32_ADD(v1$1, FP64_TO_SI32($dirY[256:192]))));
    v56$2 := BV32_ADD(BV32_ADD(v0$2, FP64_TO_SI32($dirX[256:192])), BV32_MUL(v2, BV32_ADD(v1$2, FP64_TO_SI32($dirY[256:192]))));
    v57$1 := BV32_ADD(BV32_ADD(v0$1, FP64_TO_SI32($dirX[320:256])), BV32_MUL(v2, BV32_ADD(v1$1, FP64_TO_SI32($dirY[320:256]))));
    v57$2 := BV32_ADD(BV32_ADD(v0$2, FP64_TO_SI32($dirX[320:256])), BV32_MUL(v2, BV32_ADD(v1$2, FP64_TO_SI32($dirY[320:256]))));
    v58$1 := BV32_ADD(BV32_ADD(v0$1, FP64_TO_SI32($dirX[384:320])), BV32_MUL(v2, BV32_ADD(v1$1, FP64_TO_SI32($dirY[384:320]))));
    v58$2 := BV32_ADD(BV32_ADD(v0$2, FP64_TO_SI32($dirX[384:320])), BV32_MUL(v2, BV32_ADD(v1$2, FP64_TO_SI32($dirY[384:320]))));
    v59$1 := BV32_ADD(BV32_ADD(v0$1, FP64_TO_SI32($dirX[448:384])), BV32_MUL(v2, BV32_ADD(v1$1, FP64_TO_SI32($dirY[448:384]))));
    v59$2 := BV32_ADD(BV32_ADD(v0$2, FP64_TO_SI32($dirX[448:384])), BV32_MUL(v2, BV32_ADD(v1$2, FP64_TO_SI32($dirY[448:384]))));
    v60$1 := BV32_ADD(BV32_ADD(v0$1, FP64_TO_SI32($dirX[512:448])), BV32_MUL(v2, BV32_ADD(v1$1, FP64_TO_SI32($dirY[512:448]))));
    v60$2 := BV32_ADD(BV32_ADD(v0$2, FP64_TO_SI32($dirX[512:448])), BV32_MUL(v2, BV32_ADD(v1$2, FP64_TO_SI32($dirY[512:448]))));
    call {:sourceloc} {:sourceloc_num 25} _LOG_WRITE_$$of0(true, v3$1, $f0.0$1, $$of0[v3$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of0(true, v3$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 25} _CHECK_WRITE_$$of0(true, v3$2, $f0.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of0"} true;
    $$of0[v3$1] := $f0.0$1;
    $$of0[v3$2] := $f0.0$2;
    v61$1 := BV1_ZEXT32((if BV32_ULT(v0$1, BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32)) then 1bv1 else 0bv1));
    v61$2 := BV1_ZEXT32((if BV32_ULT(v0$2, BV32_SUB(BV32_MUL(group_size_x, num_groups_x), 1bv32)) then 1bv1 else 0bv1));
    v62$1 := BV1_ZEXT32((if BV32_UGT(v1$1, 0bv32) then 1bv1 else 0bv1));
    v62$2 := BV1_ZEXT32((if BV32_UGT(v1$2, 0bv32) then 1bv1 else 0bv1));
    v63$1 := BV1_ZEXT32((if BV32_UGT(v0$1, 0bv32) then 1bv1 else 0bv1));
    v63$2 := BV1_ZEXT32((if BV32_UGT(v0$2, 0bv32) then 1bv1 else 0bv1));
    v64$1 := BV1_ZEXT32((if BV32_ULT(v1$1, BV32_SUB(BV32_MUL(group_size_y, num_groups_y), 1bv32)) then 1bv1 else 0bv1));
    v64$2 := BV1_ZEXT32((if BV32_ULT(v1$2, BV32_SUB(BV32_MUL(group_size_y, num_groups_y), 1bv32)) then 1bv1 else 0bv1));
    v65$1 := v61$1 != 0bv32;
    v65$2 := v61$2 != 0bv32;
    p2$1 := (if v65$1 then v65$1 else p2$1);
    p2$2 := (if v65$2 then v65$2 else p2$2);
    call {:sourceloc} {:sourceloc_num 27} _LOG_READ_$$of1234(p2$1, BV32_MUL(v53$1, 4bv32), $$of1234[BV32_MUL(v53$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_59"} {:captureState "check_state_59"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_59"} {:sourceloc} {:sourceloc_num 27} _CHECK_READ_$$of1234(p2$2, BV32_MUL(v53$2, 4bv32), $$of1234[BV32_MUL(v53$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v66$1 := (if p2$1 then $$of1234[BV32_MUL(v53$1, 4bv32)] else v66$1);
    v66$2 := (if p2$2 then $$of1234[BV32_MUL(v53$2, 4bv32)] else v66$2);
    call {:sourceloc} {:sourceloc_num 28} _LOG_READ_$$of1234(p2$1, BV32_ADD(BV32_MUL(v53$1, 4bv32), 1bv32), $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_60"} {:captureState "check_state_60"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_60"} {:sourceloc} {:sourceloc_num 28} _CHECK_READ_$$of1234(p2$2, BV32_ADD(BV32_MUL(v53$2, 4bv32), 1bv32), $$of1234[BV32_ADD(BV32_MUL(v53$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v67$1 := (if p2$1 then $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 1bv32)] else v67$1);
    v67$2 := (if p2$2 then $$of1234[BV32_ADD(BV32_MUL(v53$2, 4bv32), 1bv32)] else v67$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_READ_$$of1234(p2$1, BV32_ADD(BV32_MUL(v53$1, 4bv32), 2bv32), $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_61"} {:captureState "check_state_61"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_61"} {:sourceloc} {:sourceloc_num 29} _CHECK_READ_$$of1234(p2$2, BV32_ADD(BV32_MUL(v53$2, 4bv32), 2bv32), $$of1234[BV32_ADD(BV32_MUL(v53$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v68$1 := (if p2$1 then $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 2bv32)] else v68$1);
    v68$2 := (if p2$2 then $$of1234[BV32_ADD(BV32_MUL(v53$2, 4bv32), 2bv32)] else v68$2);
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$of1234(p2$1, BV32_ADD(BV32_MUL(v53$1, 4bv32), 3bv32), $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_62"} {:captureState "check_state_62"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_62"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$of1234(p2$2, BV32_ADD(BV32_MUL(v53$2, 4bv32), 3bv32), $$of1234[BV32_ADD(BV32_MUL(v53$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v69$1 := (if p2$1 then $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 3bv32)] else v69$1);
    v69$2 := (if p2$2 then $$of1234[BV32_ADD(BV32_MUL(v53$2, 4bv32), 3bv32)] else v69$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$of1234(p2$1, BV32_MUL(v53$1, 4bv32), $f1234.0$1[64:0], $$of1234[BV32_MUL(v53$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p2$2, BV32_MUL(v53$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_63"} {:captureState "check_state_63"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_63"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$of1234(p2$2, BV32_MUL(v53$2, 4bv32), $f1234.0$2[64:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_MUL(v53$1, 4bv32)] := (if p2$1 then $f1234.0$1[64:0] else $$of1234[BV32_MUL(v53$1, 4bv32)]);
    $$of1234[BV32_MUL(v53$2, 4bv32)] := (if p2$2 then $f1234.0$2[64:0] else $$of1234[BV32_MUL(v53$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 32} _LOG_WRITE_$$of1234(p2$1, BV32_ADD(BV32_MUL(v53$1, 4bv32), 1bv32), v67$1, $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p2$2, BV32_ADD(BV32_MUL(v53$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_64"} {:captureState "check_state_64"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_64"} {:sourceloc} {:sourceloc_num 32} _CHECK_WRITE_$$of1234(p2$2, BV32_ADD(BV32_MUL(v53$2, 4bv32), 1bv32), v67$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 1bv32)] := (if p2$1 then v67$1 else $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 1bv32)]);
    $$of1234[BV32_ADD(BV32_MUL(v53$2, 4bv32), 1bv32)] := (if p2$2 then v67$2 else $$of1234[BV32_ADD(BV32_MUL(v53$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$of1234(p2$1, BV32_ADD(BV32_MUL(v53$1, 4bv32), 2bv32), v68$1, $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p2$2, BV32_ADD(BV32_MUL(v53$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_65"} {:captureState "check_state_65"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_65"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$of1234(p2$2, BV32_ADD(BV32_MUL(v53$2, 4bv32), 2bv32), v68$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 2bv32)] := (if p2$1 then v68$1 else $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 2bv32)]);
    $$of1234[BV32_ADD(BV32_MUL(v53$2, 4bv32), 2bv32)] := (if p2$2 then v68$2 else $$of1234[BV32_ADD(BV32_MUL(v53$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$of1234(p2$1, BV32_ADD(BV32_MUL(v53$1, 4bv32), 3bv32), v69$1, $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p2$2, BV32_ADD(BV32_MUL(v53$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_66"} {:captureState "check_state_66"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_66"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$of1234(p2$2, BV32_ADD(BV32_MUL(v53$2, 4bv32), 3bv32), v69$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 3bv32)] := (if p2$1 then v69$1 else $$of1234[BV32_ADD(BV32_MUL(v53$1, 4bv32), 3bv32)]);
    $$of1234[BV32_ADD(BV32_MUL(v53$2, 4bv32), 3bv32)] := (if p2$2 then v69$2 else $$of1234[BV32_ADD(BV32_MUL(v53$2, 4bv32), 3bv32)]);
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 36} $bugle_barrier_duplicated_0(0bv1, 1bv1);
    v70$1 := v64$1 != 0bv32;
    v70$2 := v64$2 != 0bv32;
    p4$1 := (if v70$1 then v70$1 else p4$1);
    p4$2 := (if v70$2 then v70$2 else p4$2);
    call {:sourceloc} {:sourceloc_num 38} _LOG_READ_$$of1234(p4$1, BV32_MUL(v54$1, 4bv32), $$of1234[BV32_MUL(v54$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_51"} {:sourceloc} {:sourceloc_num 38} _CHECK_READ_$$of1234(p4$2, BV32_MUL(v54$2, 4bv32), $$of1234[BV32_MUL(v54$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v71$1 := (if p4$1 then $$of1234[BV32_MUL(v54$1, 4bv32)] else v71$1);
    v71$2 := (if p4$2 then $$of1234[BV32_MUL(v54$2, 4bv32)] else v71$2);
    call {:sourceloc} {:sourceloc_num 39} _LOG_READ_$$of1234(p4$1, BV32_ADD(BV32_MUL(v54$1, 4bv32), 1bv32), $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_52"} {:captureState "check_state_52"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_52"} {:sourceloc} {:sourceloc_num 39} _CHECK_READ_$$of1234(p4$2, BV32_ADD(BV32_MUL(v54$2, 4bv32), 1bv32), $$of1234[BV32_ADD(BV32_MUL(v54$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v72$1 := (if p4$1 then $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 1bv32)] else v72$1);
    v72$2 := (if p4$2 then $$of1234[BV32_ADD(BV32_MUL(v54$2, 4bv32), 1bv32)] else v72$2);
    call {:sourceloc} {:sourceloc_num 40} _LOG_READ_$$of1234(p4$1, BV32_ADD(BV32_MUL(v54$1, 4bv32), 2bv32), $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_53"} {:captureState "check_state_53"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_53"} {:sourceloc} {:sourceloc_num 40} _CHECK_READ_$$of1234(p4$2, BV32_ADD(BV32_MUL(v54$2, 4bv32), 2bv32), $$of1234[BV32_ADD(BV32_MUL(v54$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v73$1 := (if p4$1 then $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 2bv32)] else v73$1);
    v73$2 := (if p4$2 then $$of1234[BV32_ADD(BV32_MUL(v54$2, 4bv32), 2bv32)] else v73$2);
    call {:sourceloc} {:sourceloc_num 41} _LOG_READ_$$of1234(p4$1, BV32_ADD(BV32_MUL(v54$1, 4bv32), 3bv32), $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_54"} {:captureState "check_state_54"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_54"} {:sourceloc} {:sourceloc_num 41} _CHECK_READ_$$of1234(p4$2, BV32_ADD(BV32_MUL(v54$2, 4bv32), 3bv32), $$of1234[BV32_ADD(BV32_MUL(v54$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v74$1 := (if p4$1 then $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 3bv32)] else v74$1);
    v74$2 := (if p4$2 then $$of1234[BV32_ADD(BV32_MUL(v54$2, 4bv32), 3bv32)] else v74$2);
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$of1234(p4$1, BV32_MUL(v54$1, 4bv32), v71$1, $$of1234[BV32_MUL(v54$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p4$2, BV32_MUL(v54$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_55"} {:captureState "check_state_55"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_55"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$of1234(p4$2, BV32_MUL(v54$2, 4bv32), v71$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_MUL(v54$1, 4bv32)] := (if p4$1 then v71$1 else $$of1234[BV32_MUL(v54$1, 4bv32)]);
    $$of1234[BV32_MUL(v54$2, 4bv32)] := (if p4$2 then v71$2 else $$of1234[BV32_MUL(v54$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 43} _LOG_WRITE_$$of1234(p4$1, BV32_ADD(BV32_MUL(v54$1, 4bv32), 1bv32), $f1234.0$1[128:64], $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p4$2, BV32_ADD(BV32_MUL(v54$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_56"} {:captureState "check_state_56"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_56"} {:sourceloc} {:sourceloc_num 43} _CHECK_WRITE_$$of1234(p4$2, BV32_ADD(BV32_MUL(v54$2, 4bv32), 1bv32), $f1234.0$2[128:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 1bv32)] := (if p4$1 then $f1234.0$1[128:64] else $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 1bv32)]);
    $$of1234[BV32_ADD(BV32_MUL(v54$2, 4bv32), 1bv32)] := (if p4$2 then $f1234.0$2[128:64] else $$of1234[BV32_ADD(BV32_MUL(v54$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$of1234(p4$1, BV32_ADD(BV32_MUL(v54$1, 4bv32), 2bv32), v73$1, $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p4$2, BV32_ADD(BV32_MUL(v54$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_57"} {:captureState "check_state_57"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_57"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$of1234(p4$2, BV32_ADD(BV32_MUL(v54$2, 4bv32), 2bv32), v73$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 2bv32)] := (if p4$1 then v73$1 else $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 2bv32)]);
    $$of1234[BV32_ADD(BV32_MUL(v54$2, 4bv32), 2bv32)] := (if p4$2 then v73$2 else $$of1234[BV32_ADD(BV32_MUL(v54$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 45} _LOG_WRITE_$$of1234(p4$1, BV32_ADD(BV32_MUL(v54$1, 4bv32), 3bv32), v74$1, $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p4$2, BV32_ADD(BV32_MUL(v54$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_58"} {:captureState "check_state_58"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_58"} {:sourceloc} {:sourceloc_num 45} _CHECK_WRITE_$$of1234(p4$2, BV32_ADD(BV32_MUL(v54$2, 4bv32), 3bv32), v74$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 3bv32)] := (if p4$1 then v74$1 else $$of1234[BV32_ADD(BV32_MUL(v54$1, 4bv32), 3bv32)]);
    $$of1234[BV32_ADD(BV32_MUL(v54$2, 4bv32), 3bv32)] := (if p4$2 then v74$2 else $$of1234[BV32_ADD(BV32_MUL(v54$2, 4bv32), 3bv32)]);
    goto __partitioned_block_$0_2;

  __partitioned_block_$0_2:
    call {:sourceloc_num 47} $bugle_barrier_duplicated_1(0bv1, 1bv1);
    v75$1 := v63$1 != 0bv32;
    v75$2 := v63$2 != 0bv32;
    p6$1 := (if v75$1 then v75$1 else p6$1);
    p6$2 := (if v75$2 then v75$2 else p6$2);
    call {:sourceloc} {:sourceloc_num 49} _LOG_READ_$$of1234(p6$1, BV32_MUL(v55$1, 4bv32), $$of1234[BV32_MUL(v55$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 49} _CHECK_READ_$$of1234(p6$2, BV32_MUL(v55$2, 4bv32), $$of1234[BV32_MUL(v55$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v76$1 := (if p6$1 then $$of1234[BV32_MUL(v55$1, 4bv32)] else v76$1);
    v76$2 := (if p6$2 then $$of1234[BV32_MUL(v55$2, 4bv32)] else v76$2);
    call {:sourceloc} {:sourceloc_num 50} _LOG_READ_$$of1234(p6$1, BV32_ADD(BV32_MUL(v55$1, 4bv32), 1bv32), $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 50} _CHECK_READ_$$of1234(p6$2, BV32_ADD(BV32_MUL(v55$2, 4bv32), 1bv32), $$of1234[BV32_ADD(BV32_MUL(v55$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v77$1 := (if p6$1 then $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 1bv32)] else v77$1);
    v77$2 := (if p6$2 then $$of1234[BV32_ADD(BV32_MUL(v55$2, 4bv32), 1bv32)] else v77$2);
    call {:sourceloc} {:sourceloc_num 51} _LOG_READ_$$of1234(p6$1, BV32_ADD(BV32_MUL(v55$1, 4bv32), 2bv32), $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 51} _CHECK_READ_$$of1234(p6$2, BV32_ADD(BV32_MUL(v55$2, 4bv32), 2bv32), $$of1234[BV32_ADD(BV32_MUL(v55$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v78$1 := (if p6$1 then $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 2bv32)] else v78$1);
    v78$2 := (if p6$2 then $$of1234[BV32_ADD(BV32_MUL(v55$2, 4bv32), 2bv32)] else v78$2);
    call {:sourceloc} {:sourceloc_num 52} _LOG_READ_$$of1234(p6$1, BV32_ADD(BV32_MUL(v55$1, 4bv32), 3bv32), $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 52} _CHECK_READ_$$of1234(p6$2, BV32_ADD(BV32_MUL(v55$2, 4bv32), 3bv32), $$of1234[BV32_ADD(BV32_MUL(v55$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v79$1 := (if p6$1 then $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 3bv32)] else v79$1);
    v79$2 := (if p6$2 then $$of1234[BV32_ADD(BV32_MUL(v55$2, 4bv32), 3bv32)] else v79$2);
    call {:sourceloc} {:sourceloc_num 53} _LOG_WRITE_$$of1234(p6$1, BV32_MUL(v55$1, 4bv32), v76$1, $$of1234[BV32_MUL(v55$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p6$2, BV32_MUL(v55$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 53} _CHECK_WRITE_$$of1234(p6$2, BV32_MUL(v55$2, 4bv32), v76$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_MUL(v55$1, 4bv32)] := (if p6$1 then v76$1 else $$of1234[BV32_MUL(v55$1, 4bv32)]);
    $$of1234[BV32_MUL(v55$2, 4bv32)] := (if p6$2 then v76$2 else $$of1234[BV32_MUL(v55$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 54} _LOG_WRITE_$$of1234(p6$1, BV32_ADD(BV32_MUL(v55$1, 4bv32), 1bv32), v77$1, $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p6$2, BV32_ADD(BV32_MUL(v55$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 54} _CHECK_WRITE_$$of1234(p6$2, BV32_ADD(BV32_MUL(v55$2, 4bv32), 1bv32), v77$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 1bv32)] := (if p6$1 then v77$1 else $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 1bv32)]);
    $$of1234[BV32_ADD(BV32_MUL(v55$2, 4bv32), 1bv32)] := (if p6$2 then v77$2 else $$of1234[BV32_ADD(BV32_MUL(v55$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 55} _LOG_WRITE_$$of1234(p6$1, BV32_ADD(BV32_MUL(v55$1, 4bv32), 2bv32), $f1234.0$1[192:128], $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p6$2, BV32_ADD(BV32_MUL(v55$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 55} _CHECK_WRITE_$$of1234(p6$2, BV32_ADD(BV32_MUL(v55$2, 4bv32), 2bv32), $f1234.0$2[192:128]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 2bv32)] := (if p6$1 then $f1234.0$1[192:128] else $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 2bv32)]);
    $$of1234[BV32_ADD(BV32_MUL(v55$2, 4bv32), 2bv32)] := (if p6$2 then $f1234.0$2[192:128] else $$of1234[BV32_ADD(BV32_MUL(v55$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 56} _LOG_WRITE_$$of1234(p6$1, BV32_ADD(BV32_MUL(v55$1, 4bv32), 3bv32), v79$1, $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p6$2, BV32_ADD(BV32_MUL(v55$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 56} _CHECK_WRITE_$$of1234(p6$2, BV32_ADD(BV32_MUL(v55$2, 4bv32), 3bv32), v79$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 3bv32)] := (if p6$1 then v79$1 else $$of1234[BV32_ADD(BV32_MUL(v55$1, 4bv32), 3bv32)]);
    $$of1234[BV32_ADD(BV32_MUL(v55$2, 4bv32), 3bv32)] := (if p6$2 then v79$2 else $$of1234[BV32_ADD(BV32_MUL(v55$2, 4bv32), 3bv32)]);
    goto __partitioned_block_$0_3;

  __partitioned_block_$0_3:
    call {:sourceloc_num 58} $bugle_barrier_duplicated_2(0bv1, 1bv1);
    v80$1 := v62$1 != 0bv32;
    v80$2 := v62$2 != 0bv32;
    p8$1 := (if v80$1 then v80$1 else p8$1);
    p8$2 := (if v80$2 then v80$2 else p8$2);
    call {:sourceloc} {:sourceloc_num 60} _LOG_READ_$$of1234(p8$1, BV32_MUL(v56$1, 4bv32), $$of1234[BV32_MUL(v56$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 60} _CHECK_READ_$$of1234(p8$2, BV32_MUL(v56$2, 4bv32), $$of1234[BV32_MUL(v56$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v81$1 := (if p8$1 then $$of1234[BV32_MUL(v56$1, 4bv32)] else v81$1);
    v81$2 := (if p8$2 then $$of1234[BV32_MUL(v56$2, 4bv32)] else v81$2);
    call {:sourceloc} {:sourceloc_num 61} _LOG_READ_$$of1234(p8$1, BV32_ADD(BV32_MUL(v56$1, 4bv32), 1bv32), $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 61} _CHECK_READ_$$of1234(p8$2, BV32_ADD(BV32_MUL(v56$2, 4bv32), 1bv32), $$of1234[BV32_ADD(BV32_MUL(v56$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v82$1 := (if p8$1 then $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 1bv32)] else v82$1);
    v82$2 := (if p8$2 then $$of1234[BV32_ADD(BV32_MUL(v56$2, 4bv32), 1bv32)] else v82$2);
    call {:sourceloc} {:sourceloc_num 62} _LOG_READ_$$of1234(p8$1, BV32_ADD(BV32_MUL(v56$1, 4bv32), 2bv32), $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 62} _CHECK_READ_$$of1234(p8$2, BV32_ADD(BV32_MUL(v56$2, 4bv32), 2bv32), $$of1234[BV32_ADD(BV32_MUL(v56$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v83$1 := (if p8$1 then $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 2bv32)] else v83$1);
    v83$2 := (if p8$2 then $$of1234[BV32_ADD(BV32_MUL(v56$2, 4bv32), 2bv32)] else v83$2);
    call {:sourceloc} {:sourceloc_num 63} _LOG_READ_$$of1234(p8$1, BV32_ADD(BV32_MUL(v56$1, 4bv32), 3bv32), $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 63} _CHECK_READ_$$of1234(p8$2, BV32_ADD(BV32_MUL(v56$2, 4bv32), 3bv32), $$of1234[BV32_ADD(BV32_MUL(v56$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of1234"} true;
    v84$1 := (if p8$1 then $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 3bv32)] else v84$1);
    v84$2 := (if p8$2 then $$of1234[BV32_ADD(BV32_MUL(v56$2, 4bv32), 3bv32)] else v84$2);
    call {:sourceloc} {:sourceloc_num 64} _LOG_WRITE_$$of1234(p8$1, BV32_MUL(v56$1, 4bv32), v81$1, $$of1234[BV32_MUL(v56$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p8$2, BV32_MUL(v56$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 64} _CHECK_WRITE_$$of1234(p8$2, BV32_MUL(v56$2, 4bv32), v81$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_MUL(v56$1, 4bv32)] := (if p8$1 then v81$1 else $$of1234[BV32_MUL(v56$1, 4bv32)]);
    $$of1234[BV32_MUL(v56$2, 4bv32)] := (if p8$2 then v81$2 else $$of1234[BV32_MUL(v56$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 65} _LOG_WRITE_$$of1234(p8$1, BV32_ADD(BV32_MUL(v56$1, 4bv32), 1bv32), v82$1, $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p8$2, BV32_ADD(BV32_MUL(v56$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 65} _CHECK_WRITE_$$of1234(p8$2, BV32_ADD(BV32_MUL(v56$2, 4bv32), 1bv32), v82$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 1bv32)] := (if p8$1 then v82$1 else $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 1bv32)]);
    $$of1234[BV32_ADD(BV32_MUL(v56$2, 4bv32), 1bv32)] := (if p8$2 then v82$2 else $$of1234[BV32_ADD(BV32_MUL(v56$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 66} _LOG_WRITE_$$of1234(p8$1, BV32_ADD(BV32_MUL(v56$1, 4bv32), 2bv32), v83$1, $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p8$2, BV32_ADD(BV32_MUL(v56$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 66} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 66} _CHECK_WRITE_$$of1234(p8$2, BV32_ADD(BV32_MUL(v56$2, 4bv32), 2bv32), v83$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 2bv32)] := (if p8$1 then v83$1 else $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 2bv32)]);
    $$of1234[BV32_ADD(BV32_MUL(v56$2, 4bv32), 2bv32)] := (if p8$2 then v83$2 else $$of1234[BV32_ADD(BV32_MUL(v56$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 67} _LOG_WRITE_$$of1234(p8$1, BV32_ADD(BV32_MUL(v56$1, 4bv32), 3bv32), $f1234.0$1[256:192], $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(p8$2, BV32_ADD(BV32_MUL(v56$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 67} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 67} _CHECK_WRITE_$$of1234(p8$2, BV32_ADD(BV32_MUL(v56$2, 4bv32), 3bv32), $f1234.0$2[256:192]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of1234"} true;
    $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 3bv32)] := (if p8$1 then $f1234.0$1[256:192] else $$of1234[BV32_ADD(BV32_MUL(v56$1, 4bv32), 3bv32)]);
    $$of1234[BV32_ADD(BV32_MUL(v56$2, 4bv32), 3bv32)] := (if p8$2 then $f1234.0$2[256:192] else $$of1234[BV32_ADD(BV32_MUL(v56$2, 4bv32), 3bv32)]);
    v85$1 := v61$1 != 0bv32;
    v85$2 := v61$2 != 0bv32;
    p10$1 := (if v85$1 then v85$1 else p10$1);
    p10$2 := (if v85$2 then v85$2 else p10$2);
    v86$1 := (if p10$1 then v64$1 != 0bv32 else v86$1);
    v86$2 := (if p10$2 then v64$2 != 0bv32 else v86$2);
    p11$1 := (if p10$1 && v86$1 then v86$1 else p11$1);
    p11$2 := (if p10$2 && v86$2 then v86$2 else p11$2);
    call {:sourceloc} {:sourceloc_num 71} _LOG_READ_$$of5678(p11$1, BV32_MUL(v57$1, 4bv32), $$of5678[BV32_MUL(v57$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 71} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 71} _CHECK_READ_$$of5678(p11$2, BV32_MUL(v57$2, 4bv32), $$of5678[BV32_MUL(v57$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v87$1 := (if p11$1 then $$of5678[BV32_MUL(v57$1, 4bv32)] else v87$1);
    v87$2 := (if p11$2 then $$of5678[BV32_MUL(v57$2, 4bv32)] else v87$2);
    call {:sourceloc} {:sourceloc_num 72} _LOG_READ_$$of5678(p11$1, BV32_ADD(BV32_MUL(v57$1, 4bv32), 1bv32), $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 72} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 72} _CHECK_READ_$$of5678(p11$2, BV32_ADD(BV32_MUL(v57$2, 4bv32), 1bv32), $$of5678[BV32_ADD(BV32_MUL(v57$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v88$1 := (if p11$1 then $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 1bv32)] else v88$1);
    v88$2 := (if p11$2 then $$of5678[BV32_ADD(BV32_MUL(v57$2, 4bv32), 1bv32)] else v88$2);
    call {:sourceloc} {:sourceloc_num 73} _LOG_READ_$$of5678(p11$1, BV32_ADD(BV32_MUL(v57$1, 4bv32), 2bv32), $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 73} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 73} _CHECK_READ_$$of5678(p11$2, BV32_ADD(BV32_MUL(v57$2, 4bv32), 2bv32), $$of5678[BV32_ADD(BV32_MUL(v57$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v89$1 := (if p11$1 then $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 2bv32)] else v89$1);
    v89$2 := (if p11$2 then $$of5678[BV32_ADD(BV32_MUL(v57$2, 4bv32), 2bv32)] else v89$2);
    call {:sourceloc} {:sourceloc_num 74} _LOG_READ_$$of5678(p11$1, BV32_ADD(BV32_MUL(v57$1, 4bv32), 3bv32), $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 74} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 74} _CHECK_READ_$$of5678(p11$2, BV32_ADD(BV32_MUL(v57$2, 4bv32), 3bv32), $$of5678[BV32_ADD(BV32_MUL(v57$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v90$1 := (if p11$1 then $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 3bv32)] else v90$1);
    v90$2 := (if p11$2 then $$of5678[BV32_ADD(BV32_MUL(v57$2, 4bv32), 3bv32)] else v90$2);
    call {:sourceloc} {:sourceloc_num 75} _LOG_WRITE_$$of5678(p11$1, BV32_MUL(v57$1, 4bv32), $f5678.0$1[64:0], $$of5678[BV32_MUL(v57$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p11$2, BV32_MUL(v57$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 75} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 75} _CHECK_WRITE_$$of5678(p11$2, BV32_MUL(v57$2, 4bv32), $f5678.0$2[64:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_MUL(v57$1, 4bv32)] := (if p11$1 then $f5678.0$1[64:0] else $$of5678[BV32_MUL(v57$1, 4bv32)]);
    $$of5678[BV32_MUL(v57$2, 4bv32)] := (if p11$2 then $f5678.0$2[64:0] else $$of5678[BV32_MUL(v57$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 76} _LOG_WRITE_$$of5678(p11$1, BV32_ADD(BV32_MUL(v57$1, 4bv32), 1bv32), v88$1, $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p11$2, BV32_ADD(BV32_MUL(v57$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 76} _CHECK_WRITE_$$of5678(p11$2, BV32_ADD(BV32_MUL(v57$2, 4bv32), 1bv32), v88$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 1bv32)] := (if p11$1 then v88$1 else $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 1bv32)]);
    $$of5678[BV32_ADD(BV32_MUL(v57$2, 4bv32), 1bv32)] := (if p11$2 then v88$2 else $$of5678[BV32_ADD(BV32_MUL(v57$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 77} _LOG_WRITE_$$of5678(p11$1, BV32_ADD(BV32_MUL(v57$1, 4bv32), 2bv32), v89$1, $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p11$2, BV32_ADD(BV32_MUL(v57$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 77} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 77} _CHECK_WRITE_$$of5678(p11$2, BV32_ADD(BV32_MUL(v57$2, 4bv32), 2bv32), v89$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 2bv32)] := (if p11$1 then v89$1 else $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 2bv32)]);
    $$of5678[BV32_ADD(BV32_MUL(v57$2, 4bv32), 2bv32)] := (if p11$2 then v89$2 else $$of5678[BV32_ADD(BV32_MUL(v57$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 78} _LOG_WRITE_$$of5678(p11$1, BV32_ADD(BV32_MUL(v57$1, 4bv32), 3bv32), v90$1, $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p11$2, BV32_ADD(BV32_MUL(v57$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 78} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 78} _CHECK_WRITE_$$of5678(p11$2, BV32_ADD(BV32_MUL(v57$2, 4bv32), 3bv32), v90$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 3bv32)] := (if p11$1 then v90$1 else $$of5678[BV32_ADD(BV32_MUL(v57$1, 4bv32), 3bv32)]);
    $$of5678[BV32_ADD(BV32_MUL(v57$2, 4bv32), 3bv32)] := (if p11$2 then v90$2 else $$of5678[BV32_ADD(BV32_MUL(v57$2, 4bv32), 3bv32)]);
    goto __partitioned_block_$0_4;

  __partitioned_block_$0_4:
    call {:sourceloc_num 80} $bugle_barrier_duplicated_3(0bv1, 1bv1);
    v91$1 := v64$1 != 0bv32;
    v91$2 := v64$2 != 0bv32;
    p14$1 := (if v91$1 then v91$1 else p14$1);
    p14$2 := (if v91$2 then v91$2 else p14$2);
    v92$1 := (if p14$1 then v63$1 != 0bv32 else v92$1);
    v92$2 := (if p14$2 then v63$2 != 0bv32 else v92$2);
    p15$1 := (if p14$1 && v92$1 then v92$1 else p15$1);
    p15$2 := (if p14$2 && v92$2 then v92$2 else p15$2);
    call {:sourceloc} {:sourceloc_num 83} _LOG_READ_$$of5678(p15$1, BV32_MUL(v58$1, 4bv32), $$of5678[BV32_MUL(v58$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 83} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 83} _CHECK_READ_$$of5678(p15$2, BV32_MUL(v58$2, 4bv32), $$of5678[BV32_MUL(v58$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v93$1 := (if p15$1 then $$of5678[BV32_MUL(v58$1, 4bv32)] else v93$1);
    v93$2 := (if p15$2 then $$of5678[BV32_MUL(v58$2, 4bv32)] else v93$2);
    call {:sourceloc} {:sourceloc_num 84} _LOG_READ_$$of5678(p15$1, BV32_ADD(BV32_MUL(v58$1, 4bv32), 1bv32), $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 84} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 84} _CHECK_READ_$$of5678(p15$2, BV32_ADD(BV32_MUL(v58$2, 4bv32), 1bv32), $$of5678[BV32_ADD(BV32_MUL(v58$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v94$1 := (if p15$1 then $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 1bv32)] else v94$1);
    v94$2 := (if p15$2 then $$of5678[BV32_ADD(BV32_MUL(v58$2, 4bv32), 1bv32)] else v94$2);
    call {:sourceloc} {:sourceloc_num 85} _LOG_READ_$$of5678(p15$1, BV32_ADD(BV32_MUL(v58$1, 4bv32), 2bv32), $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 85} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 85} _CHECK_READ_$$of5678(p15$2, BV32_ADD(BV32_MUL(v58$2, 4bv32), 2bv32), $$of5678[BV32_ADD(BV32_MUL(v58$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v95$1 := (if p15$1 then $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 2bv32)] else v95$1);
    v95$2 := (if p15$2 then $$of5678[BV32_ADD(BV32_MUL(v58$2, 4bv32), 2bv32)] else v95$2);
    call {:sourceloc} {:sourceloc_num 86} _LOG_READ_$$of5678(p15$1, BV32_ADD(BV32_MUL(v58$1, 4bv32), 3bv32), $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 86} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 86} _CHECK_READ_$$of5678(p15$2, BV32_ADD(BV32_MUL(v58$2, 4bv32), 3bv32), $$of5678[BV32_ADD(BV32_MUL(v58$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v96$1 := (if p15$1 then $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 3bv32)] else v96$1);
    v96$2 := (if p15$2 then $$of5678[BV32_ADD(BV32_MUL(v58$2, 4bv32), 3bv32)] else v96$2);
    call {:sourceloc} {:sourceloc_num 87} _LOG_WRITE_$$of5678(p15$1, BV32_MUL(v58$1, 4bv32), v93$1, $$of5678[BV32_MUL(v58$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p15$2, BV32_MUL(v58$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 87} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 87} _CHECK_WRITE_$$of5678(p15$2, BV32_MUL(v58$2, 4bv32), v93$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_MUL(v58$1, 4bv32)] := (if p15$1 then v93$1 else $$of5678[BV32_MUL(v58$1, 4bv32)]);
    $$of5678[BV32_MUL(v58$2, 4bv32)] := (if p15$2 then v93$2 else $$of5678[BV32_MUL(v58$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 88} _LOG_WRITE_$$of5678(p15$1, BV32_ADD(BV32_MUL(v58$1, 4bv32), 1bv32), $f5678.0$1[128:64], $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p15$2, BV32_ADD(BV32_MUL(v58$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 88} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 88} _CHECK_WRITE_$$of5678(p15$2, BV32_ADD(BV32_MUL(v58$2, 4bv32), 1bv32), $f5678.0$2[128:64]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 1bv32)] := (if p15$1 then $f5678.0$1[128:64] else $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 1bv32)]);
    $$of5678[BV32_ADD(BV32_MUL(v58$2, 4bv32), 1bv32)] := (if p15$2 then $f5678.0$2[128:64] else $$of5678[BV32_ADD(BV32_MUL(v58$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 89} _LOG_WRITE_$$of5678(p15$1, BV32_ADD(BV32_MUL(v58$1, 4bv32), 2bv32), v95$1, $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p15$2, BV32_ADD(BV32_MUL(v58$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 89} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 89} _CHECK_WRITE_$$of5678(p15$2, BV32_ADD(BV32_MUL(v58$2, 4bv32), 2bv32), v95$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 2bv32)] := (if p15$1 then v95$1 else $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 2bv32)]);
    $$of5678[BV32_ADD(BV32_MUL(v58$2, 4bv32), 2bv32)] := (if p15$2 then v95$2 else $$of5678[BV32_ADD(BV32_MUL(v58$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 90} _LOG_WRITE_$$of5678(p15$1, BV32_ADD(BV32_MUL(v58$1, 4bv32), 3bv32), v96$1, $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p15$2, BV32_ADD(BV32_MUL(v58$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 90} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 90} _CHECK_WRITE_$$of5678(p15$2, BV32_ADD(BV32_MUL(v58$2, 4bv32), 3bv32), v96$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 3bv32)] := (if p15$1 then v96$1 else $$of5678[BV32_ADD(BV32_MUL(v58$1, 4bv32), 3bv32)]);
    $$of5678[BV32_ADD(BV32_MUL(v58$2, 4bv32), 3bv32)] := (if p15$2 then v96$2 else $$of5678[BV32_ADD(BV32_MUL(v58$2, 4bv32), 3bv32)]);
    goto __partitioned_block_$0_5;

  __partitioned_block_$0_5:
    call {:sourceloc_num 92} $bugle_barrier_duplicated_4(0bv1, 1bv1);
    v97$1 := v63$1 != 0bv32;
    v97$2 := v63$2 != 0bv32;
    p18$1 := (if v97$1 then v97$1 else p18$1);
    p18$2 := (if v97$2 then v97$2 else p18$2);
    v98$1 := (if p18$1 then v62$1 != 0bv32 else v98$1);
    v98$2 := (if p18$2 then v62$2 != 0bv32 else v98$2);
    p19$1 := (if p18$1 && v98$1 then v98$1 else p19$1);
    p19$2 := (if p18$2 && v98$2 then v98$2 else p19$2);
    call {:sourceloc} {:sourceloc_num 95} _LOG_READ_$$of5678(p19$1, BV32_MUL(v59$1, 4bv32), $$of5678[BV32_MUL(v59$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 95} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 95} _CHECK_READ_$$of5678(p19$2, BV32_MUL(v59$2, 4bv32), $$of5678[BV32_MUL(v59$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v99$1 := (if p19$1 then $$of5678[BV32_MUL(v59$1, 4bv32)] else v99$1);
    v99$2 := (if p19$2 then $$of5678[BV32_MUL(v59$2, 4bv32)] else v99$2);
    call {:sourceloc} {:sourceloc_num 96} _LOG_READ_$$of5678(p19$1, BV32_ADD(BV32_MUL(v59$1, 4bv32), 1bv32), $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 96} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 96} _CHECK_READ_$$of5678(p19$2, BV32_ADD(BV32_MUL(v59$2, 4bv32), 1bv32), $$of5678[BV32_ADD(BV32_MUL(v59$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v100$1 := (if p19$1 then $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 1bv32)] else v100$1);
    v100$2 := (if p19$2 then $$of5678[BV32_ADD(BV32_MUL(v59$2, 4bv32), 1bv32)] else v100$2);
    call {:sourceloc} {:sourceloc_num 97} _LOG_READ_$$of5678(p19$1, BV32_ADD(BV32_MUL(v59$1, 4bv32), 2bv32), $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 97} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 97} _CHECK_READ_$$of5678(p19$2, BV32_ADD(BV32_MUL(v59$2, 4bv32), 2bv32), $$of5678[BV32_ADD(BV32_MUL(v59$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v101$1 := (if p19$1 then $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 2bv32)] else v101$1);
    v101$2 := (if p19$2 then $$of5678[BV32_ADD(BV32_MUL(v59$2, 4bv32), 2bv32)] else v101$2);
    call {:sourceloc} {:sourceloc_num 98} _LOG_READ_$$of5678(p19$1, BV32_ADD(BV32_MUL(v59$1, 4bv32), 3bv32), $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 98} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 98} _CHECK_READ_$$of5678(p19$2, BV32_ADD(BV32_MUL(v59$2, 4bv32), 3bv32), $$of5678[BV32_ADD(BV32_MUL(v59$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v102$1 := (if p19$1 then $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 3bv32)] else v102$1);
    v102$2 := (if p19$2 then $$of5678[BV32_ADD(BV32_MUL(v59$2, 4bv32), 3bv32)] else v102$2);
    call {:sourceloc} {:sourceloc_num 99} _LOG_WRITE_$$of5678(p19$1, BV32_MUL(v59$1, 4bv32), v99$1, $$of5678[BV32_MUL(v59$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p19$2, BV32_MUL(v59$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 99} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 99} _CHECK_WRITE_$$of5678(p19$2, BV32_MUL(v59$2, 4bv32), v99$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_MUL(v59$1, 4bv32)] := (if p19$1 then v99$1 else $$of5678[BV32_MUL(v59$1, 4bv32)]);
    $$of5678[BV32_MUL(v59$2, 4bv32)] := (if p19$2 then v99$2 else $$of5678[BV32_MUL(v59$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 100} _LOG_WRITE_$$of5678(p19$1, BV32_ADD(BV32_MUL(v59$1, 4bv32), 1bv32), v100$1, $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p19$2, BV32_ADD(BV32_MUL(v59$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 100} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 100} _CHECK_WRITE_$$of5678(p19$2, BV32_ADD(BV32_MUL(v59$2, 4bv32), 1bv32), v100$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 1bv32)] := (if p19$1 then v100$1 else $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 1bv32)]);
    $$of5678[BV32_ADD(BV32_MUL(v59$2, 4bv32), 1bv32)] := (if p19$2 then v100$2 else $$of5678[BV32_ADD(BV32_MUL(v59$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 101} _LOG_WRITE_$$of5678(p19$1, BV32_ADD(BV32_MUL(v59$1, 4bv32), 2bv32), $f5678.0$1[192:128], $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p19$2, BV32_ADD(BV32_MUL(v59$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 101} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 101} _CHECK_WRITE_$$of5678(p19$2, BV32_ADD(BV32_MUL(v59$2, 4bv32), 2bv32), $f5678.0$2[192:128]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 2bv32)] := (if p19$1 then $f5678.0$1[192:128] else $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 2bv32)]);
    $$of5678[BV32_ADD(BV32_MUL(v59$2, 4bv32), 2bv32)] := (if p19$2 then $f5678.0$2[192:128] else $$of5678[BV32_ADD(BV32_MUL(v59$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 102} _LOG_WRITE_$$of5678(p19$1, BV32_ADD(BV32_MUL(v59$1, 4bv32), 3bv32), v102$1, $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p19$2, BV32_ADD(BV32_MUL(v59$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 102} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 102} _CHECK_WRITE_$$of5678(p19$2, BV32_ADD(BV32_MUL(v59$2, 4bv32), 3bv32), v102$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 3bv32)] := (if p19$1 then v102$1 else $$of5678[BV32_ADD(BV32_MUL(v59$1, 4bv32), 3bv32)]);
    $$of5678[BV32_ADD(BV32_MUL(v59$2, 4bv32), 3bv32)] := (if p19$2 then v102$2 else $$of5678[BV32_ADD(BV32_MUL(v59$2, 4bv32), 3bv32)]);
    goto __partitioned_block_$0_6;

  __partitioned_block_$0_6:
    call {:sourceloc_num 104} $bugle_barrier_duplicated_5(0bv1, 1bv1);
    v103$1 := v62$1 != 0bv32;
    v103$2 := v62$2 != 0bv32;
    p22$1 := (if v103$1 then v103$1 else p22$1);
    p22$2 := (if v103$2 then v103$2 else p22$2);
    v104$1 := (if p22$1 then v61$1 != 0bv32 else v104$1);
    v104$2 := (if p22$2 then v61$2 != 0bv32 else v104$2);
    p23$1 := (if p22$1 && v104$1 then v104$1 else p23$1);
    p23$2 := (if p22$2 && v104$2 then v104$2 else p23$2);
    call {:sourceloc} {:sourceloc_num 107} _LOG_READ_$$of5678(p23$1, BV32_MUL(v60$1, 4bv32), $$of5678[BV32_MUL(v60$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 107} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 107} _CHECK_READ_$$of5678(p23$2, BV32_MUL(v60$2, 4bv32), $$of5678[BV32_MUL(v60$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v105$1 := (if p23$1 then $$of5678[BV32_MUL(v60$1, 4bv32)] else v105$1);
    v105$2 := (if p23$2 then $$of5678[BV32_MUL(v60$2, 4bv32)] else v105$2);
    call {:sourceloc} {:sourceloc_num 108} _LOG_READ_$$of5678(p23$1, BV32_ADD(BV32_MUL(v60$1, 4bv32), 1bv32), $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 108} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 108} _CHECK_READ_$$of5678(p23$2, BV32_ADD(BV32_MUL(v60$2, 4bv32), 1bv32), $$of5678[BV32_ADD(BV32_MUL(v60$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v106$1 := (if p23$1 then $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 1bv32)] else v106$1);
    v106$2 := (if p23$2 then $$of5678[BV32_ADD(BV32_MUL(v60$2, 4bv32), 1bv32)] else v106$2);
    call {:sourceloc} {:sourceloc_num 109} _LOG_READ_$$of5678(p23$1, BV32_ADD(BV32_MUL(v60$1, 4bv32), 2bv32), $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 109} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 109} _CHECK_READ_$$of5678(p23$2, BV32_ADD(BV32_MUL(v60$2, 4bv32), 2bv32), $$of5678[BV32_ADD(BV32_MUL(v60$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v107$1 := (if p23$1 then $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 2bv32)] else v107$1);
    v107$2 := (if p23$2 then $$of5678[BV32_ADD(BV32_MUL(v60$2, 4bv32), 2bv32)] else v107$2);
    call {:sourceloc} {:sourceloc_num 110} _LOG_READ_$$of5678(p23$1, BV32_ADD(BV32_MUL(v60$1, 4bv32), 3bv32), $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 110} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 110} _CHECK_READ_$$of5678(p23$2, BV32_ADD(BV32_MUL(v60$2, 4bv32), 3bv32), $$of5678[BV32_ADD(BV32_MUL(v60$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$of5678"} true;
    v108$1 := (if p23$1 then $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 3bv32)] else v108$1);
    v108$2 := (if p23$2 then $$of5678[BV32_ADD(BV32_MUL(v60$2, 4bv32), 3bv32)] else v108$2);
    call {:sourceloc} {:sourceloc_num 111} _LOG_WRITE_$$of5678(p23$1, BV32_MUL(v60$1, 4bv32), v105$1, $$of5678[BV32_MUL(v60$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p23$2, BV32_MUL(v60$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 111} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 111} _CHECK_WRITE_$$of5678(p23$2, BV32_MUL(v60$2, 4bv32), v105$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_MUL(v60$1, 4bv32)] := (if p23$1 then v105$1 else $$of5678[BV32_MUL(v60$1, 4bv32)]);
    $$of5678[BV32_MUL(v60$2, 4bv32)] := (if p23$2 then v105$2 else $$of5678[BV32_MUL(v60$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 112} _LOG_WRITE_$$of5678(p23$1, BV32_ADD(BV32_MUL(v60$1, 4bv32), 1bv32), v106$1, $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p23$2, BV32_ADD(BV32_MUL(v60$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 112} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 112} _CHECK_WRITE_$$of5678(p23$2, BV32_ADD(BV32_MUL(v60$2, 4bv32), 1bv32), v106$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 1bv32)] := (if p23$1 then v106$1 else $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 1bv32)]);
    $$of5678[BV32_ADD(BV32_MUL(v60$2, 4bv32), 1bv32)] := (if p23$2 then v106$2 else $$of5678[BV32_ADD(BV32_MUL(v60$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 113} _LOG_WRITE_$$of5678(p23$1, BV32_ADD(BV32_MUL(v60$1, 4bv32), 2bv32), v107$1, $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p23$2, BV32_ADD(BV32_MUL(v60$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 113} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 113} _CHECK_WRITE_$$of5678(p23$2, BV32_ADD(BV32_MUL(v60$2, 4bv32), 2bv32), v107$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 2bv32)] := (if p23$1 then v107$1 else $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 2bv32)]);
    $$of5678[BV32_ADD(BV32_MUL(v60$2, 4bv32), 2bv32)] := (if p23$2 then v107$2 else $$of5678[BV32_ADD(BV32_MUL(v60$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 114} _LOG_WRITE_$$of5678(p23$1, BV32_ADD(BV32_MUL(v60$1, 4bv32), 3bv32), $f5678.0$1[256:192], $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(p23$2, BV32_ADD(BV32_MUL(v60$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 114} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 114} _CHECK_WRITE_$$of5678(p23$2, BV32_ADD(BV32_MUL(v60$2, 4bv32), 3bv32), $f5678.0$2[256:192]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$of5678"} true;
    $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 3bv32)] := (if p23$1 then $f5678.0$1[256:192] else $$of5678[BV32_ADD(BV32_MUL(v60$1, 4bv32), 3bv32)]);
    $$of5678[BV32_ADD(BV32_MUL(v60$2, 4bv32), 3bv32)] := (if p23$2 then $f5678.0$2[256:192] else $$of5678[BV32_ADD(BV32_MUL(v60$2, 4bv32), 3bv32)]);
    return;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 256bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 0bv1;
  requires $1 == 1bv1;
  modifies $$of0, $$of1234, $$of5678, $$velocityBuffer, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 0bv1;
  requires $1 == 1bv1;
  modifies $$of0, $$of1234, $$of5678, $$velocityBuffer, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 0bv1;
  requires $1 == 1bv1;
  modifies $$of0, $$of1234, $$of5678, $$velocityBuffer, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_3($0: bv1, $1: bv1);
  requires $0 == 0bv1;
  requires $1 == 1bv1;
  modifies $$of0, $$of1234, $$of5678, $$velocityBuffer, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_4($0: bv1, $1: bv1);
  requires $0 == 0bv1;
  requires $1 == 1bv1;
  modifies $$of0, $$of1234, $$of5678, $$velocityBuffer, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_5($0: bv1, $1: bv1);
  requires $0 == 0bv1;
  requires $1 == 1bv1;
  modifies $$of0, $$of1234, $$of5678, $$velocityBuffer, _TRACKING;



const _WATCHED_VALUE_$$if0: bv64;

procedure {:inline 1} _LOG_READ_$$if0(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$if0;



implementation {:inline 1} _LOG_READ_$$if0(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$if0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if0 == _value then true else _READ_HAS_OCCURRED_$$if0);
    return;
}



procedure _CHECK_READ_$$if0(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "if0"} {:array "$$if0"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$if0 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$if0);
  requires {:source_name "if0"} {:array "$$if0"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$if0 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$if0: bool;

procedure {:inline 1} _LOG_WRITE_$$if0(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$if0, _WRITE_READ_BENIGN_FLAG_$$if0;



implementation {:inline 1} _LOG_WRITE_$$if0(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$if0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if0 == _value then true else _WRITE_HAS_OCCURRED_$$if0);
    _WRITE_READ_BENIGN_FLAG_$$if0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if0 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$if0);
    return;
}



procedure _CHECK_WRITE_$$if0(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "if0"} {:array "$$if0"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$if0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if0 != _value);
  requires {:source_name "if0"} {:array "$$if0"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$if0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if0 != _value);
  requires {:source_name "if0"} {:array "$$if0"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$if0 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$if0(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$if0;



implementation {:inline 1} _LOG_ATOMIC_$$if0(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$if0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$if0);
    return;
}



procedure _CHECK_ATOMIC_$$if0(_P: bool, _offset: bv32);
  requires {:source_name "if0"} {:array "$$if0"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$if0 && _WATCHED_OFFSET == _offset);
  requires {:source_name "if0"} {:array "$$if0"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$if0 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$if0(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$if0;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$if0(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$if0 := (if _P && _WRITE_HAS_OCCURRED_$$if0 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$if0);
    return;
}



const _WATCHED_VALUE_$$of0: bv64;

procedure {:inline 1} _LOG_READ_$$of0(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$of0;



implementation {:inline 1} _LOG_READ_$$of0(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$of0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of0 == _value then true else _READ_HAS_OCCURRED_$$of0);
    return;
}



procedure _CHECK_READ_$$of0(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "of0"} {:array "$$of0"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$of0 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$of0);
  requires {:source_name "of0"} {:array "$$of0"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$of0 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$of0: bool;

procedure {:inline 1} _LOG_WRITE_$$of0(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$of0, _WRITE_READ_BENIGN_FLAG_$$of0;



implementation {:inline 1} _LOG_WRITE_$$of0(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$of0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of0 == _value then true else _WRITE_HAS_OCCURRED_$$of0);
    _WRITE_READ_BENIGN_FLAG_$$of0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of0 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$of0);
    return;
}



procedure _CHECK_WRITE_$$of0(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "of0"} {:array "$$of0"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$of0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of0 != _value);
  requires {:source_name "of0"} {:array "$$of0"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$of0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of0 != _value);
  requires {:source_name "of0"} {:array "$$of0"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$of0 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$of0(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$of0;



implementation {:inline 1} _LOG_ATOMIC_$$of0(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$of0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$of0);
    return;
}



procedure _CHECK_ATOMIC_$$of0(_P: bool, _offset: bv32);
  requires {:source_name "of0"} {:array "$$of0"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$of0 && _WATCHED_OFFSET == _offset);
  requires {:source_name "of0"} {:array "$$of0"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$of0 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$of0(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$of0;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$of0(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$of0 := (if _P && _WRITE_HAS_OCCURRED_$$of0 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$of0);
    return;
}



const _WATCHED_VALUE_$$if1234: bv64;

procedure {:inline 1} _LOG_READ_$$if1234(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$if1234;



implementation {:inline 1} _LOG_READ_$$if1234(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$if1234 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if1234 == _value then true else _READ_HAS_OCCURRED_$$if1234);
    return;
}



procedure _CHECK_READ_$$if1234(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "if1234"} {:array "$$if1234"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$if1234 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$if1234);
  requires {:source_name "if1234"} {:array "$$if1234"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$if1234 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$if1234: bool;

procedure {:inline 1} _LOG_WRITE_$$if1234(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$if1234, _WRITE_READ_BENIGN_FLAG_$$if1234;



implementation {:inline 1} _LOG_WRITE_$$if1234(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$if1234 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if1234 == _value then true else _WRITE_HAS_OCCURRED_$$if1234);
    _WRITE_READ_BENIGN_FLAG_$$if1234 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if1234 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$if1234);
    return;
}



procedure _CHECK_WRITE_$$if1234(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "if1234"} {:array "$$if1234"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$if1234 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if1234 != _value);
  requires {:source_name "if1234"} {:array "$$if1234"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$if1234 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if1234 != _value);
  requires {:source_name "if1234"} {:array "$$if1234"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$if1234 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$if1234(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$if1234;



implementation {:inline 1} _LOG_ATOMIC_$$if1234(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$if1234 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$if1234);
    return;
}



procedure _CHECK_ATOMIC_$$if1234(_P: bool, _offset: bv32);
  requires {:source_name "if1234"} {:array "$$if1234"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$if1234 && _WATCHED_OFFSET == _offset);
  requires {:source_name "if1234"} {:array "$$if1234"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$if1234 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$if1234(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$if1234;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$if1234(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$if1234 := (if _P && _WRITE_HAS_OCCURRED_$$if1234 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$if1234);
    return;
}



const _WATCHED_VALUE_$$of1234: bv64;

procedure {:inline 1} _LOG_READ_$$of1234(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$of1234;



implementation {:inline 1} _LOG_READ_$$of1234(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$of1234 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of1234 == _value then true else _READ_HAS_OCCURRED_$$of1234);
    return;
}



procedure _CHECK_READ_$$of1234(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "of1234"} {:array "$$of1234"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$of1234 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$of1234);
  requires {:source_name "of1234"} {:array "$$of1234"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$of1234 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$of1234: bool;

procedure {:inline 1} _LOG_WRITE_$$of1234(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$of1234, _WRITE_READ_BENIGN_FLAG_$$of1234;



implementation {:inline 1} _LOG_WRITE_$$of1234(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$of1234 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of1234 == _value then true else _WRITE_HAS_OCCURRED_$$of1234);
    _WRITE_READ_BENIGN_FLAG_$$of1234 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of1234 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$of1234);
    return;
}



procedure _CHECK_WRITE_$$of1234(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "of1234"} {:array "$$of1234"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$of1234 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of1234 != _value);
  requires {:source_name "of1234"} {:array "$$of1234"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$of1234 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of1234 != _value);
  requires {:source_name "of1234"} {:array "$$of1234"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$of1234 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$of1234(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$of1234;



implementation {:inline 1} _LOG_ATOMIC_$$of1234(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$of1234 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$of1234);
    return;
}



procedure _CHECK_ATOMIC_$$of1234(_P: bool, _offset: bv32);
  requires {:source_name "of1234"} {:array "$$of1234"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$of1234 && _WATCHED_OFFSET == _offset);
  requires {:source_name "of1234"} {:array "$$of1234"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$of1234 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$of1234;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$of1234(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$of1234 := (if _P && _WRITE_HAS_OCCURRED_$$of1234 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$of1234);
    return;
}



const _WATCHED_VALUE_$$if5678: bv64;

procedure {:inline 1} _LOG_READ_$$if5678(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$if5678;



implementation {:inline 1} _LOG_READ_$$if5678(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$if5678 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if5678 == _value then true else _READ_HAS_OCCURRED_$$if5678);
    return;
}



procedure _CHECK_READ_$$if5678(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "if5678"} {:array "$$if5678"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$if5678 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$if5678);
  requires {:source_name "if5678"} {:array "$$if5678"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$if5678 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$if5678: bool;

procedure {:inline 1} _LOG_WRITE_$$if5678(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$if5678, _WRITE_READ_BENIGN_FLAG_$$if5678;



implementation {:inline 1} _LOG_WRITE_$$if5678(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$if5678 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if5678 == _value then true else _WRITE_HAS_OCCURRED_$$if5678);
    _WRITE_READ_BENIGN_FLAG_$$if5678 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if5678 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$if5678);
    return;
}



procedure _CHECK_WRITE_$$if5678(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "if5678"} {:array "$$if5678"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$if5678 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if5678 != _value);
  requires {:source_name "if5678"} {:array "$$if5678"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$if5678 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$if5678 != _value);
  requires {:source_name "if5678"} {:array "$$if5678"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$if5678 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$if5678(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$if5678;



implementation {:inline 1} _LOG_ATOMIC_$$if5678(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$if5678 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$if5678);
    return;
}



procedure _CHECK_ATOMIC_$$if5678(_P: bool, _offset: bv32);
  requires {:source_name "if5678"} {:array "$$if5678"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$if5678 && _WATCHED_OFFSET == _offset);
  requires {:source_name "if5678"} {:array "$$if5678"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$if5678 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$if5678(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$if5678;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$if5678(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$if5678 := (if _P && _WRITE_HAS_OCCURRED_$$if5678 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$if5678);
    return;
}



const _WATCHED_VALUE_$$of5678: bv64;

procedure {:inline 1} _LOG_READ_$$of5678(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$of5678;



implementation {:inline 1} _LOG_READ_$$of5678(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$of5678 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of5678 == _value then true else _READ_HAS_OCCURRED_$$of5678);
    return;
}



procedure _CHECK_READ_$$of5678(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "of5678"} {:array "$$of5678"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$of5678 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$of5678);
  requires {:source_name "of5678"} {:array "$$of5678"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$of5678 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$of5678: bool;

procedure {:inline 1} _LOG_WRITE_$$of5678(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$of5678, _WRITE_READ_BENIGN_FLAG_$$of5678;



implementation {:inline 1} _LOG_WRITE_$$of5678(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$of5678 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of5678 == _value then true else _WRITE_HAS_OCCURRED_$$of5678);
    _WRITE_READ_BENIGN_FLAG_$$of5678 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of5678 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$of5678);
    return;
}



procedure _CHECK_WRITE_$$of5678(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "of5678"} {:array "$$of5678"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$of5678 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of5678 != _value);
  requires {:source_name "of5678"} {:array "$$of5678"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$of5678 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$of5678 != _value);
  requires {:source_name "of5678"} {:array "$$of5678"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$of5678 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$of5678(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$of5678;



implementation {:inline 1} _LOG_ATOMIC_$$of5678(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$of5678 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$of5678);
    return;
}



procedure _CHECK_ATOMIC_$$of5678(_P: bool, _offset: bv32);
  requires {:source_name "of5678"} {:array "$$of5678"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$of5678 && _WATCHED_OFFSET == _offset);
  requires {:source_name "of5678"} {:array "$$of5678"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$of5678 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$of5678;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$of5678(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$of5678 := (if _P && _WRITE_HAS_OCCURRED_$$of5678 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$of5678);
    return;
}



const _WATCHED_VALUE_$$type: bv8;

procedure {:inline 1} _LOG_READ_$$type(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$type;



implementation {:inline 1} _LOG_READ_$$type(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$type := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$type == _value then true else _READ_HAS_OCCURRED_$$type);
    return;
}



procedure _CHECK_READ_$$type(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "type"} {:array "$$type"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$type && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$type);
  requires {:source_name "type"} {:array "$$type"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$type && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$type: bool;

procedure {:inline 1} _LOG_WRITE_$$type(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$type, _WRITE_READ_BENIGN_FLAG_$$type;



implementation {:inline 1} _LOG_WRITE_$$type(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$type := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$type == _value then true else _WRITE_HAS_OCCURRED_$$type);
    _WRITE_READ_BENIGN_FLAG_$$type := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$type == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$type);
    return;
}



procedure _CHECK_WRITE_$$type(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "type"} {:array "$$type"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$type && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$type != _value);
  requires {:source_name "type"} {:array "$$type"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$type && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$type != _value);
  requires {:source_name "type"} {:array "$$type"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$type && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$type(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$type;



implementation {:inline 1} _LOG_ATOMIC_$$type(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$type := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$type);
    return;
}



procedure _CHECK_ATOMIC_$$type(_P: bool, _offset: bv32);
  requires {:source_name "type"} {:array "$$type"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$type && _WATCHED_OFFSET == _offset);
  requires {:source_name "type"} {:array "$$type"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$type && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$type(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$type;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$type(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$type := (if _P && _WRITE_HAS_OCCURRED_$$type && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$type);
    return;
}



const _WATCHED_VALUE_$$velocityBuffer: bv64;

procedure {:inline 1} _LOG_READ_$$velocityBuffer(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$velocityBuffer;



implementation {:inline 1} _LOG_READ_$$velocityBuffer(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$velocityBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$velocityBuffer == _value then true else _READ_HAS_OCCURRED_$$velocityBuffer);
    return;
}



procedure _CHECK_READ_$$velocityBuffer(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "velocityBuffer"} {:array "$$velocityBuffer"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$velocityBuffer && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$velocityBuffer);
  requires {:source_name "velocityBuffer"} {:array "$$velocityBuffer"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$velocityBuffer && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$velocityBuffer: bool;

procedure {:inline 1} _LOG_WRITE_$$velocityBuffer(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$velocityBuffer, _WRITE_READ_BENIGN_FLAG_$$velocityBuffer;



implementation {:inline 1} _LOG_WRITE_$$velocityBuffer(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$velocityBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$velocityBuffer == _value then true else _WRITE_HAS_OCCURRED_$$velocityBuffer);
    _WRITE_READ_BENIGN_FLAG_$$velocityBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$velocityBuffer == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$velocityBuffer);
    return;
}



procedure _CHECK_WRITE_$$velocityBuffer(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "velocityBuffer"} {:array "$$velocityBuffer"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$velocityBuffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$velocityBuffer != _value);
  requires {:source_name "velocityBuffer"} {:array "$$velocityBuffer"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$velocityBuffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$velocityBuffer != _value);
  requires {:source_name "velocityBuffer"} {:array "$$velocityBuffer"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$velocityBuffer && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$velocityBuffer(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$velocityBuffer;



implementation {:inline 1} _LOG_ATOMIC_$$velocityBuffer(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$velocityBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$velocityBuffer);
    return;
}



procedure _CHECK_ATOMIC_$$velocityBuffer(_P: bool, _offset: bv32);
  requires {:source_name "velocityBuffer"} {:array "$$velocityBuffer"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$velocityBuffer && _WATCHED_OFFSET == _offset);
  requires {:source_name "velocityBuffer"} {:array "$$velocityBuffer"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$velocityBuffer && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$velocityBuffer(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$velocityBuffer;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$velocityBuffer(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$velocityBuffer := (if _P && _WRITE_HAS_OCCURRED_$$velocityBuffer && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$velocityBuffer);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of0;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of0;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of0;
    goto anon1;

  anon1:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of1234;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of1234;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of1234;
    goto anon2;

  anon2:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of5678;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of5678;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of5678;
    goto anon3;

  anon3:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$velocityBuffer;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$velocityBuffer;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$velocityBuffer;
    goto anon4;

  anon4:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !($1 != 0bv1 || $1 != 0bv1);
    goto anon9;

  anon9:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} $1 != 0bv1 || $1 != 0bv1;
    havoc $$of0;
    goto anon6;

  anon6:
    havoc $$of1234;
    goto anon7;

  anon7:
    havoc $$of5678;
    goto anon8;

  anon8:
    havoc $$velocityBuffer;
    goto anon9;

  anon10_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of0;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of0;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of0;
    goto anon1;

  anon1:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of1234;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of1234;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of1234;
    goto anon2;

  anon2:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of5678;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of5678;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of5678;
    goto anon3;

  anon3:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$velocityBuffer;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$velocityBuffer;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$velocityBuffer;
    goto anon4;

  anon4:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !($1 != 0bv1 || $1 != 0bv1);
    goto anon9;

  anon9:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} $1 != 0bv1 || $1 != 0bv1;
    havoc $$of0;
    goto anon6;

  anon6:
    havoc $$of1234;
    goto anon7;

  anon7:
    havoc $$of5678;
    goto anon8;

  anon8:
    havoc $$velocityBuffer;
    goto anon9;

  anon10_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of0;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of0;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of0;
    goto anon1;

  anon1:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of1234;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of1234;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of1234;
    goto anon2;

  anon2:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of5678;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of5678;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of5678;
    goto anon3;

  anon3:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$velocityBuffer;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$velocityBuffer;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$velocityBuffer;
    goto anon4;

  anon4:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !($1 != 0bv1 || $1 != 0bv1);
    goto anon9;

  anon9:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} $1 != 0bv1 || $1 != 0bv1;
    havoc $$of0;
    goto anon6;

  anon6:
    havoc $$of1234;
    goto anon7;

  anon7:
    havoc $$of5678;
    goto anon8;

  anon8:
    havoc $$velocityBuffer;
    goto anon9;

  anon10_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_3($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of0;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of0;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of0;
    goto anon1;

  anon1:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of1234;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of1234;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of1234;
    goto anon2;

  anon2:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of5678;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of5678;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of5678;
    goto anon3;

  anon3:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$velocityBuffer;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$velocityBuffer;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$velocityBuffer;
    goto anon4;

  anon4:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !($1 != 0bv1 || $1 != 0bv1);
    goto anon9;

  anon9:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} $1 != 0bv1 || $1 != 0bv1;
    havoc $$of0;
    goto anon6;

  anon6:
    havoc $$of1234;
    goto anon7;

  anon7:
    havoc $$of5678;
    goto anon8;

  anon8:
    havoc $$velocityBuffer;
    goto anon9;

  anon10_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_4($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of0;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of0;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of0;
    goto anon1;

  anon1:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of1234;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of1234;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of1234;
    goto anon2;

  anon2:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of5678;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of5678;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of5678;
    goto anon3;

  anon3:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$velocityBuffer;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$velocityBuffer;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$velocityBuffer;
    goto anon4;

  anon4:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !($1 != 0bv1 || $1 != 0bv1);
    goto anon9;

  anon9:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} $1 != 0bv1 || $1 != 0bv1;
    havoc $$of0;
    goto anon6;

  anon6:
    havoc $$of1234;
    goto anon7;

  anon7:
    havoc $$of5678;
    goto anon8;

  anon8:
    havoc $$velocityBuffer;
    goto anon9;

  anon10_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_5($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of0;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of0;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of0;
    goto anon1;

  anon1:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of1234;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of1234;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of1234;
    goto anon2;

  anon2:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$of5678;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$of5678;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$of5678;
    goto anon3;

  anon3:
    assume true ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$velocityBuffer;
    assume true ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$velocityBuffer;
    assume true ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$velocityBuffer;
    goto anon4;

  anon4:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !($1 != 0bv1 || $1 != 0bv1);
    goto anon9;

  anon9:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} $1 != 0bv1 || $1 != 0bv1;
    havoc $$of0;
    goto anon6;

  anon6:
    havoc $$of1234;
    goto anon7;

  anon7:
    havoc $$of5678;
    goto anon8;

  anon8:
    havoc $$velocityBuffer;
    goto anon9;

  anon10_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
