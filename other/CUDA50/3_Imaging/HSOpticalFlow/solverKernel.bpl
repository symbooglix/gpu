type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$du0"} {:global} {:elem_width 32} {:source_name "du0"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$du0: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$du0: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$du0: bool;

axiom {:array_info "$$dv0"} {:global} {:elem_width 32} {:source_name "dv0"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$dv0: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$dv0: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$dv0: bool;

axiom {:array_info "$$Ix"} {:global} {:elem_width 32} {:source_name "Ix"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Ix: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Ix: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Ix: bool;

axiom {:array_info "$$Iy"} {:global} {:elem_width 32} {:source_name "Iy"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Iy: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Iy: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Iy: bool;

axiom {:array_info "$$Iz"} {:global} {:elem_width 32} {:source_name "Iz"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Iz: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Iz: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Iz: bool;

var {:source_name "du1"} {:global} $$du1: [bv32]bv32;

axiom {:array_info "$$du1"} {:global} {:elem_width 32} {:source_name "du1"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$du1: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$du1: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$du1: bool;

var {:source_name "dv1"} {:global} $$dv1: [bv32]bv32;

axiom {:array_info "$$dv1"} {:global} {:elem_width 32} {:source_name "dv1"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$dv1: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$dv1: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$dv1: bool;

var {:source_name "du"} {:group_shared} $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} {:group_shared} {:elem_width 32} {:source_name "du"} {:source_elem_width 32} {:source_dimensions "272"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du: bool;

var {:source_name "dv"} {:group_shared} $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} {:group_shared} {:elem_width 32} {:source_name "dv"} {:source_elem_width 32} {:source_dimensions "272"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv: bool;

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

function FDIV32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "JacobiIteration<32, 6>"} {:kernel} $_Z15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_($w: bv32, $h: bv32, $s: bv32, $alpha: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $w == 320bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $h == 240bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $s == 320bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$du0 && !_WRITE_HAS_OCCURRED_$$du0 && !_ATOMIC_HAS_OCCURRED_$$du0;
  requires !_READ_HAS_OCCURRED_$$dv0 && !_WRITE_HAS_OCCURRED_$$dv0 && !_ATOMIC_HAS_OCCURRED_$$dv0;
  requires !_READ_HAS_OCCURRED_$$Ix && !_WRITE_HAS_OCCURRED_$$Ix && !_ATOMIC_HAS_OCCURRED_$$Ix;
  requires !_READ_HAS_OCCURRED_$$Iy && !_WRITE_HAS_OCCURRED_$$Iy && !_ATOMIC_HAS_OCCURRED_$$Iy;
  requires !_READ_HAS_OCCURRED_$$Iz && !_WRITE_HAS_OCCURRED_$$Iz && !_ATOMIC_HAS_OCCURRED_$$Iz;
  requires !_READ_HAS_OCCURRED_$$du1 && !_WRITE_HAS_OCCURRED_$$du1 && !_ATOMIC_HAS_OCCURRED_$$du1;
  requires !_READ_HAS_OCCURRED_$$dv1 && !_WRITE_HAS_OCCURRED_$$dv1 && !_ATOMIC_HAS_OCCURRED_$$dv1;
  requires !_READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du && !_WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du && !_ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du;
  requires !_READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv && !_WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv && !_ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv;
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
  modifies $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv, _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du, _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du, _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du, _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv, _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv, _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv, $$du1, $$dv1, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du, _READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv, _WRITE_HAS_OCCURRED_$$du1, _WRITE_READ_BENIGN_FLAG_$$du1, _WRITE_READ_BENIGN_FLAG_$$du1, _WRITE_HAS_OCCURRED_$$dv1, _WRITE_READ_BENIGN_FLAG_$$dv1, _WRITE_READ_BENIGN_FLAG_$$dv1;



implementation {:source_name "JacobiIteration<32, 6>"} {:kernel} $_Z15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_($w: bv32, $h: bv32, $s: bv32, $alpha: bv32)
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
  var $6$1: bv32;
  var $6$2: bv32;
  var $7$1: bv32;
  var $7$2: bv32;
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
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bv32;
  var v9$2: bv32;
  var v11$1: bool;
  var v11$2: bool;
  var v10$1: bv32;
  var v10$2: bv32;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bool;
  var v17$2: bool;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bool;
  var v22$2: bool;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bool;
  var v25$2: bool;
  var v26$1: bool;
  var v26$2: bool;
  var v27$1: bv32;
  var v27$2: bv32;
  var v28$1: bv32;
  var v28$2: bv32;
  var v30$1: bool;
  var v30$2: bool;
  var v29$1: bv32;
  var v29$2: bv32;
  var v31$1: bv32;
  var v31$2: bv32;
  var v32$1: bv32;
  var v32$2: bv32;
  var v33$1: bool;
  var v33$2: bool;
  var v34$1: bv32;
  var v34$2: bv32;
  var v35$1: bv32;
  var v35$2: bv32;
  var v36$1: bv32;
  var v36$2: bv32;
  var v37$1: bv32;
  var v37$2: bv32;
  var v38$1: bool;
  var v38$2: bool;
  var v39$1: bool;
  var v39$2: bool;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  __partitioned_block_$0_0:
    v0$1 := BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, group_size_x));
    v0$2 := BV32_ADD(local_id_x$2, BV32_MUL(group_id_x$2, group_size_x));
    v1$1 := BV32_ADD(local_id_y$1, BV32_MUL(group_id_y$1, group_size_y));
    v1$2 := BV32_ADD(local_id_y$2, BV32_MUL(group_id_y$2, group_size_y));
    v2$1 := BV32_SLT(v0$1, BV32_SUB($w, 1bv32));
    v2$2 := BV32_SLT(v0$2, BV32_SUB($w, 1bv32));
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
    p0$1 := (if v2$1 then v2$1 else p0$1);
    p0$2 := (if v2$2 then v2$2 else p0$2);
    p1$1 := (if !v2$1 then !v2$1 else p1$1);
    p1$2 := (if !v2$2 then !v2$2 else p1$2);
    $0$1 := (if p0$1 then v0$1 else $0$1);
    $0$2 := (if p0$2 then v0$2 else $0$2);
    $0$1 := (if p1$1 then BV32_SUB($w, 1bv32) else $0$1);
    $0$2 := (if p1$2 then BV32_SUB($w, 1bv32) else $0$2);
    v3$1 := BV32_SLT(v1$1, BV32_SUB($h, 1bv32));
    v3$2 := BV32_SLT(v1$2, BV32_SUB($h, 1bv32));
    p2$1 := (if v3$1 then v3$1 else p2$1);
    p2$2 := (if v3$2 then v3$2 else p2$2);
    p3$1 := (if !v3$1 then !v3$1 else p3$1);
    p3$2 := (if !v3$2 then !v3$2 else p3$2);
    $1$1 := (if p2$1 then v1$1 else $1$1);
    $1$2 := (if p2$2 then v1$2 else $1$2);
    $1$1 := (if p3$1 then BV32_SUB($h, 1bv32) else $1$1);
    $1$2 := (if p3$2 then BV32_SUB($h, 1bv32) else $1$2);
    v4$1 := BV32_ADD($0$1, BV32_MUL($1$1, $s));
    v4$2 := BV32_ADD($0$2, BV32_MUL($1$2, $s));
    v5$1 := BV32_ADD(BV32_ADD(local_id_x$1, 1bv32), BV32_MUL(BV32_ADD(local_id_y$1, 1bv32), 34bv32));
    v5$2 := BV32_ADD(BV32_ADD(local_id_x$2, 1bv32), BV32_MUL(BV32_ADD(local_id_y$2, 1bv32), 34bv32));
    havoc v6$1, v6$2;
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(true, v5$1, v6$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v5$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(true, v5$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(true, v5$2, v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} true;
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v5$1] := v6$1;
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2] := v6$2;
    havoc v7$1, v7$2;
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(true, v5$1, v7$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v5$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(true, v5$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(true, v5$2, v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} true;
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v5$1] := v7$1;
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2] := v7$2;
    v8$1 := local_id_y$1 == 0bv32;
    v8$2 := local_id_y$2 == 0bv32;
    p4$1 := (if v8$1 then v8$1 else p4$1);
    p4$2 := (if v8$2 then v8$2 else p4$2);
    p11$1 := (if !v8$1 then !v8$1 else p11$1);
    p11$2 := (if !v8$2 then !v8$2 else p11$2);
    v9$1 := (if p4$1 then BV32_MUL(group_id_x$1, group_size_x) else v9$1);
    v9$2 := (if p4$2 then BV32_MUL(group_id_x$2, group_size_x) else v9$2);
    v10$1 := (if p4$1 then BV32_MUL(group_id_y$1, group_size_y) else v10$1);
    v10$2 := (if p4$2 then BV32_MUL(group_id_y$2, group_size_y) else v10$2);
    v11$1 := (if p4$1 then BV32_ULT(BV32_ADD(v9$1, local_id_x$1), BV32_SUB($w, 1bv32)) else v11$1);
    v11$2 := (if p4$2 then BV32_ULT(BV32_ADD(v9$2, local_id_x$2), BV32_SUB($w, 1bv32)) else v11$2);
    p5$1 := (if p4$1 && v11$1 then v11$1 else p5$1);
    p5$2 := (if p4$2 && v11$2 then v11$2 else p5$2);
    p6$1 := (if p4$1 && !v11$1 then !v11$1 else p6$1);
    p6$2 := (if p4$2 && !v11$2 then !v11$2 else p6$2);
    $2$1 := (if p5$1 then BV32_ADD(v9$1, local_id_x$1) else $2$1);
    $2$2 := (if p5$2 then BV32_ADD(v9$2, local_id_x$2) else $2$2);
    $2$1 := (if p6$1 then BV32_SUB($w, 1bv32) else $2$1);
    $2$2 := (if p6$2 then BV32_SUB($w, 1bv32) else $2$2);
    v12$1 := (if p4$1 then BV32_SLT(BV32_SUB(v10$1, 1bv32), 0bv32) else v12$1);
    v12$2 := (if p4$2 then BV32_SLT(BV32_SUB(v10$2, 1bv32), 0bv32) else v12$2);
    p7$1 := (if p4$1 && v12$1 then v12$1 else p7$1);
    p7$2 := (if p4$2 && v12$2 then v12$2 else p7$2);
    p8$1 := (if p4$1 && !v12$1 then !v12$1 else p8$1);
    p8$2 := (if p4$2 && !v12$2 then !v12$2 else p8$2);
    $3$1 := (if p7$1 then 0bv32 else $3$1);
    $3$2 := (if p7$2 then 0bv32 else $3$2);
    $3$1 := (if p8$1 then BV32_SUB(v10$1, 1bv32) else $3$1);
    $3$2 := (if p8$2 then BV32_SUB(v10$2, 1bv32) else $3$2);
    v13$1 := (if p4$1 then BV32_ADD(BV32_MUL($3$1, $s), $2$1) else v13$1);
    v13$2 := (if p4$2 then BV32_ADD(BV32_MUL($3$2, $s), $2$2) else v13$2);
    v14$1 := (if p4$1 then BV32_ADD(local_id_x$1, 1bv32) else v14$1);
    v14$2 := (if p4$2 then BV32_ADD(local_id_x$2, 1bv32) else v14$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v15$1 := (if p4$1 then _HAVOC_bv32$1 else v15$1);
    v15$2 := (if p4$2 then _HAVOC_bv32$2 else v15$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p4$1, v14$1, v15$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v14$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p4$2, v14$2);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p4$2, v14$2, v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} true;
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v14$1] := (if p4$1 then v15$1 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v14$1]);
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v14$2] := (if p4$2 then v15$2 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v14$2]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v16$1 := (if p4$1 then _HAVOC_bv32$1 else v16$1);
    v16$2 := (if p4$2 then _HAVOC_bv32$2 else v16$2);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p4$1, v14$1, v16$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v14$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p4$2, v14$2);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p4$2, v14$2, v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} true;
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v14$1] := (if p4$1 then v16$1 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v14$1]);
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v14$2] := (if p4$2 then v16$2 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v14$2]);
    v17$1 := (if p4$1 then BV32_SLT(BV32_ADD(v10$1, 6bv32), BV32_SUB($h, 1bv32)) else v17$1);
    v17$2 := (if p4$2 then BV32_SLT(BV32_ADD(v10$2, 6bv32), BV32_SUB($h, 1bv32)) else v17$2);
    p9$1 := (if p4$1 && v17$1 then v17$1 else p9$1);
    p9$2 := (if p4$2 && v17$2 then v17$2 else p9$2);
    p10$1 := (if p4$1 && !v17$1 then !v17$1 else p10$1);
    p10$2 := (if p4$2 && !v17$2 then !v17$2 else p10$2);
    $4$1 := (if p9$1 then BV32_ADD(v10$1, 6bv32) else $4$1);
    $4$2 := (if p9$2 then BV32_ADD(v10$2, 6bv32) else $4$2);
    $4$1 := (if p10$1 then BV32_SUB($h, 1bv32) else $4$1);
    $4$2 := (if p10$2 then BV32_SUB($h, 1bv32) else $4$2);
    v18$1 := (if p4$1 then BV32_ADD(local_id_x$1, 239bv32) else v18$1);
    v18$2 := (if p4$2 then BV32_ADD(local_id_x$2, 239bv32) else v18$2);
    v19$1 := (if p4$1 then BV32_ADD(BV32_MUL($4$1, $s), $2$1) else v19$1);
    v19$2 := (if p4$2 then BV32_ADD(BV32_MUL($4$2, $s), $2$2) else v19$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v20$1 := (if p4$1 then _HAVOC_bv32$1 else v20$1);
    v20$2 := (if p4$2 then _HAVOC_bv32$2 else v20$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p4$1, v18$1, v20$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v18$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p4$2, v18$2);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p4$2, v18$2, v20$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} true;
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v18$1] := (if p4$1 then v20$1 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v18$1]);
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2] := (if p4$2 then v20$2 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v21$1 := (if p4$1 then _HAVOC_bv32$1 else v21$1);
    v21$2 := (if p4$2 then _HAVOC_bv32$2 else v21$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p4$1, v18$1, v21$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v18$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p4$2, v18$2);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p4$2, v18$2, v21$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} true;
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v18$1] := (if p4$1 then v21$1 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v18$1]);
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2] := (if p4$2 then v21$2 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2]);
    v22$1 := (if p11$1 then local_id_y$1 == 1bv32 else v22$1);
    v22$2 := (if p11$2 then local_id_y$2 == 1bv32 else v22$2);
    p12$1 := (if p11$1 && v22$1 then v22$1 else p12$1);
    p12$2 := (if p11$2 && v22$2 then v22$2 else p12$2);
    v23$1 := (if p12$1 then BV32_MUL(group_id_x$1, group_size_x) else v23$1);
    v23$2 := (if p12$2 then BV32_MUL(group_id_x$2, group_size_x) else v23$2);
    v24$1 := (if p12$1 then BV32_MUL(group_id_y$1, group_size_y) else v24$1);
    v24$2 := (if p12$2 then BV32_MUL(group_id_y$2, group_size_y) else v24$2);
    v25$1 := (if p12$1 then BV32_ULT(BV32_ADD(v24$1, local_id_x$1), BV32_SUB($h, 1bv32)) else v25$1);
    v25$2 := (if p12$2 then BV32_ULT(BV32_ADD(v24$2, local_id_x$2), BV32_SUB($h, 1bv32)) else v25$2);
    p13$1 := (if p12$1 && v25$1 then v25$1 else p13$1);
    p13$2 := (if p12$2 && v25$2 then v25$2 else p13$2);
    p14$1 := (if p12$1 && !v25$1 then !v25$1 else p14$1);
    p14$2 := (if p12$2 && !v25$2 then !v25$2 else p14$2);
    $5$1 := (if p13$1 then BV32_ADD(v24$1, local_id_x$1) else $5$1);
    $5$2 := (if p13$2 then BV32_ADD(v24$2, local_id_x$2) else $5$2);
    $5$1 := (if p14$1 then BV32_SUB($h, 1bv32) else $5$1);
    $5$2 := (if p14$2 then BV32_SUB($h, 1bv32) else $5$2);
    v26$1 := (if p12$1 then BV32_SLT(BV32_SUB(v23$1, 1bv32), 0bv32) else v26$1);
    v26$2 := (if p12$2 then BV32_SLT(BV32_SUB(v23$2, 1bv32), 0bv32) else v26$2);
    p15$1 := (if p12$1 && v26$1 then v26$1 else p15$1);
    p15$2 := (if p12$2 && v26$2 then v26$2 else p15$2);
    p16$1 := (if p12$1 && !v26$1 then !v26$1 else p16$1);
    p16$2 := (if p12$2 && !v26$2 then !v26$2 else p16$2);
    $6$1 := (if p15$1 then 0bv32 else $6$1);
    $6$2 := (if p15$2 then 0bv32 else $6$2);
    $6$1 := (if p16$1 then BV32_SUB(v23$1, 1bv32) else $6$1);
    $6$2 := (if p16$2 then BV32_SUB(v23$2, 1bv32) else $6$2);
    v27$1 := (if p12$1 then BV32_MUL(local_id_x$1, 34bv32) else v27$1);
    v27$2 := (if p12$2 then BV32_MUL(local_id_x$2, 34bv32) else v27$2);
    v28$1 := (if p12$1 then BV32_ADD(34bv32, v27$1) else v28$1);
    v28$2 := (if p12$2 then BV32_ADD(34bv32, v27$2) else v28$2);
    v29$1 := (if p12$1 then BV32_ADD($6$1, BV32_MUL($5$1, $s)) else v29$1);
    v29$2 := (if p12$2 then BV32_ADD($6$2, BV32_MUL($5$2, $s)) else v29$2);
    v30$1 := (if p12$1 then BV32_ULT(local_id_x$1, 6bv32) else v30$1);
    v30$2 := (if p12$2 then BV32_ULT(local_id_x$2, 6bv32) else v30$2);
    p17$1 := (if p12$1 && v30$1 then v30$1 else p17$1);
    p17$2 := (if p12$2 && v30$2 then v30$2 else p17$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v31$1 := (if p17$1 then _HAVOC_bv32$1 else v31$1);
    v31$2 := (if p17$2 then _HAVOC_bv32$2 else v31$2);
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p17$1, v28$1, v31$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v28$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p17$2, v28$2);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p17$2, v28$2, v31$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} true;
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v28$1] := (if p17$1 then v31$1 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v28$1]);
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v28$2] := (if p17$2 then v31$2 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v28$2]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v32$1 := (if p17$1 then _HAVOC_bv32$1 else v32$1);
    v32$2 := (if p17$2 then _HAVOC_bv32$2 else v32$2);
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p17$1, v28$1, v32$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v28$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p17$2, v28$2);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p17$2, v28$2, v32$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} true;
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v28$1] := (if p17$1 then v32$1 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v28$1]);
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v28$2] := (if p17$2 then v32$2 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v28$2]);
    v33$1 := (if p17$1 then BV32_SLT(BV32_ADD(v23$1, 32bv32), BV32_SUB($w, 1bv32)) else v33$1);
    v33$2 := (if p17$2 then BV32_SLT(BV32_ADD(v23$2, 32bv32), BV32_SUB($w, 1bv32)) else v33$2);
    p18$1 := (if p17$1 && v33$1 then v33$1 else p18$1);
    p18$2 := (if p17$2 && v33$2 then v33$2 else p18$2);
    p19$1 := (if p17$1 && !v33$1 then !v33$1 else p19$1);
    p19$2 := (if p17$2 && !v33$2 then !v33$2 else p19$2);
    $7$1 := (if p18$1 then BV32_ADD(v23$1, 32bv32) else $7$1);
    $7$2 := (if p18$2 then BV32_ADD(v23$2, 32bv32) else $7$2);
    $7$1 := (if p19$1 then BV32_SUB($w, 1bv32) else $7$1);
    $7$2 := (if p19$2 then BV32_SUB($w, 1bv32) else $7$2);
    v34$1 := (if p17$1 then BV32_ADD(BV32_MUL($5$1, $s), $7$1) else v34$1);
    v34$2 := (if p17$2 then BV32_ADD(BV32_MUL($5$2, $s), $7$2) else v34$2);
    v35$1 := (if p17$1 then BV32_ADD(v27$1, 67bv32) else v35$1);
    v35$2 := (if p17$2 then BV32_ADD(v27$2, 67bv32) else v35$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v36$1 := (if p17$1 then _HAVOC_bv32$1 else v36$1);
    v36$2 := (if p17$2 then _HAVOC_bv32$2 else v36$2);
    call {:sourceloc} {:sourceloc_num 49} _LOG_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p17$1, v35$1, v36$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v35$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p17$2, v35$2);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 49} _CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p17$2, v35$2, v36$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} true;
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v35$1] := (if p17$1 then v36$1 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v35$1]);
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v35$2] := (if p17$2 then v36$2 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v35$2]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v37$1 := (if p17$1 then _HAVOC_bv32$1 else v37$1);
    v37$2 := (if p17$2 then _HAVOC_bv32$2 else v37$2);
    call {:sourceloc} {:sourceloc_num 51} _LOG_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p17$1, v35$1, v37$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v35$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p17$2, v35$2);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 51} _CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p17$2, v35$2, v37$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} true;
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v35$1] := (if p17$1 then v37$1 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v35$1]);
    $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v35$2] := (if p17$2 then v37$2 else $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v35$2]);
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 54} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    v38$1 := BV32_SGE(v0$1, $w);
    v38$2 := BV32_SGE(v0$2, $w);
    p25$1 := (if v38$1 then v38$1 else p25$1);
    p25$2 := (if v38$2 then v38$2 else p25$2);
    p23$1 := (if !v38$1 then !v38$1 else p23$1);
    p23$2 := (if !v38$2 then !v38$2 else p23$2);
    p25$1 := (if p22$1 then true else p25$1);
    p25$2 := (if p22$2 then true else p25$2);
    v39$1 := (if p23$1 then BV32_SGE(v1$1, $h) else v39$1);
    v39$2 := (if p23$2 then BV32_SGE(v1$2, $h) else v39$2);
    p25$1 := (if p23$1 && v39$1 then v39$1 else p25$1);
    p25$2 := (if p23$2 && v39$2 then v39$2 else p25$2);
    p26$1 := (if p23$1 && !v39$1 then !v39$1 else p26$1);
    p26$2 := (if p23$2 && !v39$2 then !v39$2 else p26$2);
    p25$1 := (if p24$1 then true else p25$1);
    p25$2 := (if p24$2 then true else p25$2);
    v40$1 := (if p26$1 then BV32_SUB(v5$1, 1bv32) else v40$1);
    v40$2 := (if p26$2 then BV32_SUB(v5$2, 1bv32) else v40$2);
    v41$1 := (if p26$1 then BV32_ADD(v5$1, 1bv32) else v41$1);
    v41$2 := (if p26$2 then BV32_ADD(v5$2, 1bv32) else v41$2);
    v42$1 := (if p26$1 then BV32_ADD(v5$1, 34bv32) else v42$1);
    v42$2 := (if p26$2 then BV32_ADD(v5$2, 34bv32) else v42$2);
    v43$1 := (if p26$1 then BV32_SUB(BV32_SUB(v5$1, 32bv32), 2bv32) else v43$1);
    v43$2 := (if p26$2 then BV32_SUB(BV32_SUB(v5$2, 32bv32), 2bv32) else v43$2);
    call {:sourceloc} {:sourceloc_num 58} _LOG_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p26$1, v40$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v40$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 58} _CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p26$2, v40$2, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v40$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} true;
    v44$1 := (if p26$1 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v40$1] else v44$1);
    v44$2 := (if p26$2 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v40$2] else v44$2);
    call {:sourceloc} {:sourceloc_num 59} _LOG_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p26$1, v41$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v41$1]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 59} _CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p26$2, v41$2, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v41$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} true;
    v45$1 := (if p26$1 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v41$1] else v45$1);
    v45$2 := (if p26$2 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v41$2] else v45$2);
    call {:sourceloc} {:sourceloc_num 60} _LOG_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p26$1, v42$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v42$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 60} _CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p26$2, v42$2, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v42$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} true;
    v46$1 := (if p26$1 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v42$1] else v46$1);
    v46$2 := (if p26$2 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v42$2] else v46$2);
    call {:sourceloc} {:sourceloc_num 61} _LOG_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p26$1, v43$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v43$1]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 61} _CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(p26$2, v43$2, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v43$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} true;
    v47$1 := (if p26$1 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[1bv1][v43$1] else v47$1);
    v47$2 := (if p26$2 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v43$2] else v47$2);
    v48$1 := (if p26$1 then FMUL32(FADD32(FADD32(FADD32(v44$1, v45$1), v46$1), v47$1), 1048576000bv32) else v48$1);
    v48$2 := (if p26$2 then FMUL32(FADD32(FADD32(FADD32(v44$2, v45$2), v46$2), v47$2), 1048576000bv32) else v48$2);
    call {:sourceloc} {:sourceloc_num 62} _LOG_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p26$1, v40$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v40$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 62} _CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p26$2, v40$2, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v40$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} true;
    v49$1 := (if p26$1 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v40$1] else v49$1);
    v49$2 := (if p26$2 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v40$2] else v49$2);
    call {:sourceloc} {:sourceloc_num 63} _LOG_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p26$1, v41$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v41$1]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 63} _CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p26$2, v41$2, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v41$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} true;
    v50$1 := (if p26$1 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v41$1] else v50$1);
    v50$2 := (if p26$2 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v41$2] else v50$2);
    call {:sourceloc} {:sourceloc_num 64} _LOG_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p26$1, v42$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v42$1]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 64} _CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p26$2, v42$2, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v42$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} true;
    v51$1 := (if p26$1 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v42$1] else v51$1);
    v51$2 := (if p26$2 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v42$2] else v51$2);
    call {:sourceloc} {:sourceloc_num 65} _LOG_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p26$1, v43$1, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v43$1]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 65} _CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(p26$2, v43$2, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v43$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} true;
    v52$1 := (if p26$1 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[1bv1][v43$1] else v52$1);
    v52$2 := (if p26$2 then $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v43$2] else v52$2);
    v53$1 := (if p26$1 then FMUL32(FADD32(FADD32(FADD32(v49$1, v50$1), v51$1), v52$1), 1048576000bv32) else v53$1);
    v53$2 := (if p26$2 then FMUL32(FADD32(FADD32(FADD32(v49$2, v50$2), v51$2), v52$2), 1048576000bv32) else v53$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v54$1 := (if p26$1 then _HAVOC_bv32$1 else v54$1);
    v54$2 := (if p26$2 then _HAVOC_bv32$2 else v54$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v55$1 := (if p26$1 then _HAVOC_bv32$1 else v55$1);
    v55$2 := (if p26$2 then _HAVOC_bv32$2 else v55$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v56$1 := (if p26$1 then _HAVOC_bv32$1 else v56$1);
    v56$2 := (if p26$2 then _HAVOC_bv32$2 else v56$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v57$1 := (if p26$1 then _HAVOC_bv32$1 else v57$1);
    v57$2 := (if p26$2 then _HAVOC_bv32$2 else v57$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v58$1 := (if p26$1 then _HAVOC_bv32$1 else v58$1);
    v58$2 := (if p26$2 then _HAVOC_bv32$2 else v58$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v59$1 := (if p26$1 then _HAVOC_bv32$1 else v59$1);
    v59$2 := (if p26$2 then _HAVOC_bv32$2 else v59$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v60$1 := (if p26$1 then _HAVOC_bv32$1 else v60$1);
    v60$2 := (if p26$2 then _HAVOC_bv32$2 else v60$2);
    v61$1 := (if p26$1 then FDIV32(FADD32(FADD32(FMUL32(v54$1, v48$1), FMUL32(v55$1, v53$1)), v56$1), FADD32(FADD32(FMUL32(v57$1, v58$1), FMUL32(v59$1, v60$1)), $alpha)) else v61$1);
    v61$2 := (if p26$2 then FDIV32(FADD32(FADD32(FMUL32(v54$2, v48$2), FMUL32(v55$2, v53$2)), v56$2), FADD32(FADD32(FMUL32(v57$2, v58$2), FMUL32(v59$2, v60$2)), $alpha)) else v61$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v62$1 := (if p26$1 then _HAVOC_bv32$1 else v62$1);
    v62$2 := (if p26$2 then _HAVOC_bv32$2 else v62$2);
    call {:sourceloc} {:sourceloc_num 74} _LOG_WRITE_$$du1(p26$1, v4$1, FSUB32(v48$1, FMUL32(v62$1, v61$1)), $$du1[v4$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$du1(p26$2, v4$2);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 74} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 74} _CHECK_WRITE_$$du1(p26$2, v4$2, FSUB32(v48$2, FMUL32(v62$2, v61$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$du1"} true;
    $$du1[v4$1] := (if p26$1 then FSUB32(v48$1, FMUL32(v62$1, v61$1)) else $$du1[v4$1]);
    $$du1[v4$2] := (if p26$2 then FSUB32(v48$2, FMUL32(v62$2, v61$2)) else $$du1[v4$2]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v63$1 := (if p26$1 then _HAVOC_bv32$1 else v63$1);
    v63$2 := (if p26$2 then _HAVOC_bv32$2 else v63$2);
    call {:sourceloc} {:sourceloc_num 76} _LOG_WRITE_$$dv1(p26$1, v4$1, FSUB32(v53$1, FMUL32(v63$1, v61$1)), $$dv1[v4$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dv1(p26$2, v4$2);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 76} _CHECK_WRITE_$$dv1(p26$2, v4$2, FSUB32(v53$2, FMUL32(v63$2, v61$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dv1"} true;
    $$dv1[v4$1] := (if p26$1 then FSUB32(v53$1, FMUL32(v63$1, v61$1)) else $$dv1[v4$1]);
    $$dv1[v4$2] := (if p26$2 then FSUB32(v53$2, FMUL32(v63$2, v61$2)) else $$dv1[v4$2]);
    return;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 6bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 10bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 40bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du, $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv, $$du1, $$dv1, _TRACKING;



const _WATCHED_VALUE_$$du0: bv32;

procedure {:inline 1} _LOG_READ_$$du0(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$du0;



implementation {:inline 1} _LOG_READ_$$du0(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$du0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$du0 == _value then true else _READ_HAS_OCCURRED_$$du0);
    return;
}



procedure _CHECK_READ_$$du0(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "du0"} {:array "$$du0"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$du0 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$du0);
  requires {:source_name "du0"} {:array "$$du0"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$du0 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$du0: bool;

procedure {:inline 1} _LOG_WRITE_$$du0(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$du0, _WRITE_READ_BENIGN_FLAG_$$du0;



implementation {:inline 1} _LOG_WRITE_$$du0(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$du0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$du0 == _value then true else _WRITE_HAS_OCCURRED_$$du0);
    _WRITE_READ_BENIGN_FLAG_$$du0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$du0 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$du0);
    return;
}



procedure _CHECK_WRITE_$$du0(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "du0"} {:array "$$du0"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$du0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$du0 != _value);
  requires {:source_name "du0"} {:array "$$du0"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$du0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$du0 != _value);
  requires {:source_name "du0"} {:array "$$du0"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$du0 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$du0(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$du0;



implementation {:inline 1} _LOG_ATOMIC_$$du0(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$du0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$du0);
    return;
}



procedure _CHECK_ATOMIC_$$du0(_P: bool, _offset: bv32);
  requires {:source_name "du0"} {:array "$$du0"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$du0 && _WATCHED_OFFSET == _offset);
  requires {:source_name "du0"} {:array "$$du0"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$du0 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$du0(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$du0;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$du0(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$du0 := (if _P && _WRITE_HAS_OCCURRED_$$du0 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$du0);
    return;
}



const _WATCHED_VALUE_$$dv0: bv32;

procedure {:inline 1} _LOG_READ_$$dv0(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$dv0;



implementation {:inline 1} _LOG_READ_$$dv0(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$dv0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dv0 == _value then true else _READ_HAS_OCCURRED_$$dv0);
    return;
}



procedure _CHECK_READ_$$dv0(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dv0"} {:array "$$dv0"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$dv0 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$dv0);
  requires {:source_name "dv0"} {:array "$$dv0"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$dv0 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$dv0: bool;

procedure {:inline 1} _LOG_WRITE_$$dv0(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$dv0, _WRITE_READ_BENIGN_FLAG_$$dv0;



implementation {:inline 1} _LOG_WRITE_$$dv0(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$dv0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dv0 == _value then true else _WRITE_HAS_OCCURRED_$$dv0);
    _WRITE_READ_BENIGN_FLAG_$$dv0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dv0 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$dv0);
    return;
}



procedure _CHECK_WRITE_$$dv0(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dv0"} {:array "$$dv0"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$dv0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dv0 != _value);
  requires {:source_name "dv0"} {:array "$$dv0"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$dv0 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dv0 != _value);
  requires {:source_name "dv0"} {:array "$$dv0"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$dv0 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$dv0(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$dv0;



implementation {:inline 1} _LOG_ATOMIC_$$dv0(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$dv0 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$dv0);
    return;
}



procedure _CHECK_ATOMIC_$$dv0(_P: bool, _offset: bv32);
  requires {:source_name "dv0"} {:array "$$dv0"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$dv0 && _WATCHED_OFFSET == _offset);
  requires {:source_name "dv0"} {:array "$$dv0"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$dv0 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dv0(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$dv0;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dv0(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$dv0 := (if _P && _WRITE_HAS_OCCURRED_$$dv0 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$dv0);
    return;
}



const _WATCHED_VALUE_$$Ix: bv32;

procedure {:inline 1} _LOG_READ_$$Ix(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$Ix;



implementation {:inline 1} _LOG_READ_$$Ix(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$Ix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Ix == _value then true else _READ_HAS_OCCURRED_$$Ix);
    return;
}



procedure _CHECK_READ_$$Ix(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Ix"} {:array "$$Ix"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$Ix && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$Ix);
  requires {:source_name "Ix"} {:array "$$Ix"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$Ix && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$Ix: bool;

procedure {:inline 1} _LOG_WRITE_$$Ix(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$Ix, _WRITE_READ_BENIGN_FLAG_$$Ix;



implementation {:inline 1} _LOG_WRITE_$$Ix(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$Ix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Ix == _value then true else _WRITE_HAS_OCCURRED_$$Ix);
    _WRITE_READ_BENIGN_FLAG_$$Ix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Ix == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$Ix);
    return;
}



procedure _CHECK_WRITE_$$Ix(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Ix"} {:array "$$Ix"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$Ix && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Ix != _value);
  requires {:source_name "Ix"} {:array "$$Ix"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$Ix && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Ix != _value);
  requires {:source_name "Ix"} {:array "$$Ix"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$Ix && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$Ix(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$Ix;



implementation {:inline 1} _LOG_ATOMIC_$$Ix(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$Ix := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$Ix);
    return;
}



procedure _CHECK_ATOMIC_$$Ix(_P: bool, _offset: bv32);
  requires {:source_name "Ix"} {:array "$$Ix"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$Ix && _WATCHED_OFFSET == _offset);
  requires {:source_name "Ix"} {:array "$$Ix"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$Ix && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Ix(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$Ix;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Ix(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$Ix := (if _P && _WRITE_HAS_OCCURRED_$$Ix && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$Ix);
    return;
}



const _WATCHED_VALUE_$$Iy: bv32;

procedure {:inline 1} _LOG_READ_$$Iy(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$Iy;



implementation {:inline 1} _LOG_READ_$$Iy(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$Iy := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Iy == _value then true else _READ_HAS_OCCURRED_$$Iy);
    return;
}



procedure _CHECK_READ_$$Iy(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Iy"} {:array "$$Iy"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$Iy && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$Iy);
  requires {:source_name "Iy"} {:array "$$Iy"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$Iy && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$Iy: bool;

procedure {:inline 1} _LOG_WRITE_$$Iy(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$Iy, _WRITE_READ_BENIGN_FLAG_$$Iy;



implementation {:inline 1} _LOG_WRITE_$$Iy(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$Iy := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Iy == _value then true else _WRITE_HAS_OCCURRED_$$Iy);
    _WRITE_READ_BENIGN_FLAG_$$Iy := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Iy == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$Iy);
    return;
}



procedure _CHECK_WRITE_$$Iy(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Iy"} {:array "$$Iy"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$Iy && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Iy != _value);
  requires {:source_name "Iy"} {:array "$$Iy"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$Iy && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Iy != _value);
  requires {:source_name "Iy"} {:array "$$Iy"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$Iy && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$Iy(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$Iy;



implementation {:inline 1} _LOG_ATOMIC_$$Iy(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$Iy := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$Iy);
    return;
}



procedure _CHECK_ATOMIC_$$Iy(_P: bool, _offset: bv32);
  requires {:source_name "Iy"} {:array "$$Iy"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$Iy && _WATCHED_OFFSET == _offset);
  requires {:source_name "Iy"} {:array "$$Iy"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$Iy && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Iy(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$Iy;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Iy(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$Iy := (if _P && _WRITE_HAS_OCCURRED_$$Iy && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$Iy);
    return;
}



const _WATCHED_VALUE_$$Iz: bv32;

procedure {:inline 1} _LOG_READ_$$Iz(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$Iz;



implementation {:inline 1} _LOG_READ_$$Iz(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$Iz := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Iz == _value then true else _READ_HAS_OCCURRED_$$Iz);
    return;
}



procedure _CHECK_READ_$$Iz(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Iz"} {:array "$$Iz"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$Iz && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$Iz);
  requires {:source_name "Iz"} {:array "$$Iz"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$Iz && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$Iz: bool;

procedure {:inline 1} _LOG_WRITE_$$Iz(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$Iz, _WRITE_READ_BENIGN_FLAG_$$Iz;



implementation {:inline 1} _LOG_WRITE_$$Iz(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$Iz := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Iz == _value then true else _WRITE_HAS_OCCURRED_$$Iz);
    _WRITE_READ_BENIGN_FLAG_$$Iz := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Iz == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$Iz);
    return;
}



procedure _CHECK_WRITE_$$Iz(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Iz"} {:array "$$Iz"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$Iz && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Iz != _value);
  requires {:source_name "Iz"} {:array "$$Iz"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$Iz && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Iz != _value);
  requires {:source_name "Iz"} {:array "$$Iz"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$Iz && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$Iz(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$Iz;



implementation {:inline 1} _LOG_ATOMIC_$$Iz(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$Iz := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$Iz);
    return;
}



procedure _CHECK_ATOMIC_$$Iz(_P: bool, _offset: bv32);
  requires {:source_name "Iz"} {:array "$$Iz"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$Iz && _WATCHED_OFFSET == _offset);
  requires {:source_name "Iz"} {:array "$$Iz"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$Iz && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Iz(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$Iz;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Iz(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$Iz := (if _P && _WRITE_HAS_OCCURRED_$$Iz && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$Iz);
    return;
}



const _WATCHED_VALUE_$$du1: bv32;

procedure {:inline 1} _LOG_READ_$$du1(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$du1;



implementation {:inline 1} _LOG_READ_$$du1(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$du1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$du1 == _value then true else _READ_HAS_OCCURRED_$$du1);
    return;
}



procedure _CHECK_READ_$$du1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "du1"} {:array "$$du1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$du1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$du1);
  requires {:source_name "du1"} {:array "$$du1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$du1 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$du1: bool;

procedure {:inline 1} _LOG_WRITE_$$du1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$du1, _WRITE_READ_BENIGN_FLAG_$$du1;



implementation {:inline 1} _LOG_WRITE_$$du1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$du1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$du1 == _value then true else _WRITE_HAS_OCCURRED_$$du1);
    _WRITE_READ_BENIGN_FLAG_$$du1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$du1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$du1);
    return;
}



procedure _CHECK_WRITE_$$du1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "du1"} {:array "$$du1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$du1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$du1 != _value);
  requires {:source_name "du1"} {:array "$$du1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$du1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$du1 != _value);
  requires {:source_name "du1"} {:array "$$du1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$du1 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$du1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$du1;



implementation {:inline 1} _LOG_ATOMIC_$$du1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$du1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$du1);
    return;
}



procedure _CHECK_ATOMIC_$$du1(_P: bool, _offset: bv32);
  requires {:source_name "du1"} {:array "$$du1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$du1 && _WATCHED_OFFSET == _offset);
  requires {:source_name "du1"} {:array "$$du1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$du1 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$du1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$du1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$du1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$du1 := (if _P && _WRITE_HAS_OCCURRED_$$du1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$du1);
    return;
}



const _WATCHED_VALUE_$$dv1: bv32;

procedure {:inline 1} _LOG_READ_$$dv1(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$dv1;



implementation {:inline 1} _LOG_READ_$$dv1(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$dv1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dv1 == _value then true else _READ_HAS_OCCURRED_$$dv1);
    return;
}



procedure _CHECK_READ_$$dv1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dv1"} {:array "$$dv1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$dv1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$dv1);
  requires {:source_name "dv1"} {:array "$$dv1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$dv1 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$dv1: bool;

procedure {:inline 1} _LOG_WRITE_$$dv1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$dv1, _WRITE_READ_BENIGN_FLAG_$$dv1;



implementation {:inline 1} _LOG_WRITE_$$dv1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$dv1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dv1 == _value then true else _WRITE_HAS_OCCURRED_$$dv1);
    _WRITE_READ_BENIGN_FLAG_$$dv1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dv1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$dv1);
    return;
}



procedure _CHECK_WRITE_$$dv1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dv1"} {:array "$$dv1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$dv1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dv1 != _value);
  requires {:source_name "dv1"} {:array "$$dv1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$dv1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dv1 != _value);
  requires {:source_name "dv1"} {:array "$$dv1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$dv1 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$dv1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$dv1;



implementation {:inline 1} _LOG_ATOMIC_$$dv1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$dv1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$dv1);
    return;
}



procedure _CHECK_ATOMIC_$$dv1(_P: bool, _offset: bv32);
  requires {:source_name "dv1"} {:array "$$dv1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$dv1 && _WATCHED_OFFSET == _offset);
  requires {:source_name "dv1"} {:array "$$dv1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$dv1 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dv1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$dv1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dv1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$dv1 := (if _P && _WRITE_HAS_OCCURRED_$$dv1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$dv1);
    return;
}



const _WATCHED_VALUE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du;



implementation {:inline 1} _LOG_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du == _value then true else _READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du);
    return;
}



procedure _CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "du"} {:array "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "du"} {:array "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du, _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du;



implementation {:inline 1} _LOG_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du);
    return;
}



procedure _CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "du"} {:array "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "du"} {:array "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "du"} {:array "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(_P: bool, _offset: bv32);
  requires {:source_name "du"} {:array "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "du"} {:array "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du);
    return;
}



const _WATCHED_VALUE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv;



implementation {:inline 1} _LOG_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv == _value then true else _READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv);
    return;
}



procedure _CHECK_READ_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dv"} {:array "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "dv"} {:array "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv, _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv;



implementation {:inline 1} _LOG_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv);
    return;
}



procedure _CHECK_WRITE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dv"} {:array "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "dv"} {:array "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "dv"} {:array "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(_P: bool, _offset: bv32);
  requires {:source_name "dv"} {:array "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "dv"} {:array "$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$du1;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$du1;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$du1;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$dv1;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$dv1;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$dv1;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$du1;
    goto anon9;

  anon9:
    havoc $$dv1;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2du;
    goto anon4;

  anon4:
    havoc $$_ZZ15JacobiIterationILi32ELi6EEvPKfS1_S1_S1_S1_iiifPfS2_E2dv;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
