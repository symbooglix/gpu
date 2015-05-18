type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$d_u1"} {:global} {:elem_width 32} {:source_name "d_u1"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_u1: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_u1: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_u1: bool;

var {:source_name "d_u2"} {:global} $$d_u2: [bv32]bv32;

axiom {:array_info "$$d_u2"} {:global} {:elem_width 32} {:source_name "d_u2"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_u2: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_u2: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_u2: bool;

var {:source_name "u1"} {:group_shared} $$_ZZ13GPU_laplace3diiiiPfS_E2u1: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} {:group_shared} {:elem_width 32} {:source_name "u1"} {:source_elem_width 32} {:source_dimensions "612"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1: bool;

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

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

procedure {:source_name "GPU_laplace3d"} {:kernel} $_Z13GPU_laplace3diiiiPfS_($NX: bv32, $NY: bv32, $NZ: bv32, $pitch: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $NX == 100bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $NY == 100bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $NZ == 100bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 3} {:thread 1} (if $pitch == 128bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$d_u1 && !_WRITE_HAS_OCCURRED_$$d_u1 && !_ATOMIC_HAS_OCCURRED_$$d_u1;
  requires !_READ_HAS_OCCURRED_$$d_u2 && !_WRITE_HAS_OCCURRED_$$d_u2 && !_ATOMIC_HAS_OCCURRED_$$d_u2;
  requires !_READ_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 && !_WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 && !_ATOMIC_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1;
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
  modifies $$_ZZ13GPU_laplace3diiiiPfS_E2u1, _WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1, _WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1, _WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1, _READ_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1, $$d_u2, _TRACKING, _WRITE_HAS_OCCURRED_$$d_u2, _WRITE_READ_BENIGN_FLAG_$$d_u2, _WRITE_READ_BENIGN_FLAG_$$d_u2, _TRACKING;



implementation {:source_name "GPU_laplace3d"} {:kernel} $_Z13GPU_laplace3diiiiPfS_($NX: bv32, $NY: bv32, $NZ: bv32, $pitch: bv32)
{
  var $indg_h.0$1: bv32;
  var $indg_h.0$2: bv32;
  var $ind_h.0$1: bv32;
  var $ind_h.0$2: bv32;
  var $halo.0$1: bv32;
  var $halo.0$2: bv32;
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $j.0$1: bv32;
  var $j.0$2: bv32;
  var $0$1: bv1;
  var $0$2: bv1;
  var $1$1: bv1;
  var $1$2: bv1;
  var $indg.0$1: bv32;
  var $indg.0$2: bv32;
  var $indg_h.1$1: bv32;
  var $indg_h.1$2: bv32;
  var $indg0.0$1: bv32;
  var $indg0.0$2: bv32;
  var $k.0: bv32;
  var $indg.1$1: bv32;
  var $indg.1$2: bv32;
  var $indg0.1$1: bv32;
  var $indg0.1$2: bv32;
  var $indg_h.2$1: bv32;
  var $indg_h.2$2: bv32;
  var $u2.0$1: bv32;
  var $u2.0$2: bv32;
  var v0: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bool;
  var v3$2: bool;
  var v4$1: bool;
  var v4$2: bool;
  var v50$1: bv32;
  var v50$2: bv32;
  var v49$1: bv32;
  var v49$2: bv32;
  var v38$1: bool;
  var v38$2: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bool;
  var v9$2: bool;
  var v11$1: bv32;
  var v11$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bool;
  var v15$2: bool;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bool;
  var v17$2: bool;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bool;
  var v19$2: bool;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22: bool;
  var v23$1: bool;
  var v23$2: bool;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27$1: bool;
  var v27$2: bool;
  var v28$1: bv32;
  var v28$2: bv32;
  var v29$1: bool;
  var v29$2: bool;
  var v30$1: bv32;
  var v30$2: bv32;
  var v31$1: bv32;
  var v31$2: bv32;
  var v32$1: bv32;
  var v32$2: bv32;
  var v33$1: bool;
  var v33$2: bool;
  var v34$1: bv32;
  var v34$2: bv32;
  var v35$1: bool;
  var v35$2: bool;
  var v36$1: bool;
  var v36$2: bool;
  var v37$1: bool;
  var v37$2: bool;
  var v39$1: bool;
  var v39$2: bool;
  var v40$1: bool;
  var v40$2: bool;
  var v41$1: bool;
  var v41$2: bool;
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
  var p34$1: bool;
  var p34$2: bool;
  var p35$1: bool;
  var p35$2: bool;
  var p36$1: bool;
  var p36$2: bool;
  var p37$1: bool;
  var p37$2: bool;
  var p38$1: bool;
  var p38$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0 := BV32_SUB($NZ, 1bv32);
    v1$1 := BV32_ADD(local_id_x$1, BV32_MUL(local_id_y$1, 32bv32));
    v1$2 := BV32_ADD(local_id_x$2, BV32_MUL(local_id_y$2, 32bv32));
    v2$1 := BV1_ZEXT32((if BV32_SLT(v1$1, 76bv32) then 1bv1 else 0bv1));
    v2$2 := BV1_ZEXT32((if BV32_SLT(v1$2, 76bv32) then 1bv1 else 0bv1));
    v3$1 := v2$1 != 0bv32;
    v3$2 := v2$2 != 0bv32;
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
    p0$1 := (if v3$1 then v3$1 else p0$1);
    p0$2 := (if v3$2 then v3$2 else p0$2);
    p9$1 := (if !v3$1 then !v3$1 else p9$1);
    p9$2 := (if !v3$2 then !v3$2 else p9$2);
    v4$1 := (if p0$1 then BV32_ULT(local_id_y$1, 2bv32) else v4$1);
    v4$2 := (if p0$2 then BV32_ULT(local_id_y$2, 2bv32) else v4$2);
    p1$1 := (if p0$1 && v4$1 then v4$1 else p1$1);
    p1$2 := (if p0$2 && v4$2 then v4$2 else p1$2);
    p2$1 := (if p0$1 && !v4$1 then !v4$1 else p2$1);
    p2$2 := (if p0$2 && !v4$2 then !v4$2 else p2$2);
    $i.0$1, $j.0$1 := (if p1$1 then local_id_x$1 else $i.0$1), (if p1$1 then BV32_SUB(BV32_MUL(local_id_y$1, 5bv32), 1bv32) else $j.0$1);
    $i.0$2, $j.0$2 := (if p1$2 then local_id_x$2 else $i.0$2), (if p1$2 then BV32_SUB(BV32_MUL(local_id_y$2, 5bv32), 1bv32) else $j.0$2);
    $i.0$1, $j.0$1 := (if p2$1 then BV32_SUB(BV32_MUL(BV32_SREM(v1$1, 2bv32), 33bv32), 1bv32) else $i.0$1), (if p2$1 then BV32_SUB(BV32_SUB(BV32_SDIV(v1$1, 2bv32), 32bv32), 1bv32) else $j.0$1);
    $i.0$2, $j.0$2 := (if p2$2 then BV32_SUB(BV32_MUL(BV32_SREM(v1$2, 2bv32), 33bv32), 1bv32) else $i.0$2), (if p2$2 then BV32_SUB(BV32_SUB(BV32_SDIV(v1$2, 2bv32), 32bv32), 1bv32) else $j.0$2);
    v5$1 := (if p0$1 then BV32_ADD($i.0$1, BV32_MUL(group_id_x$1, 32bv32)) else v5$1);
    v5$2 := (if p0$2 then BV32_ADD($i.0$2, BV32_MUL(group_id_x$2, 32bv32)) else v5$2);
    v6$1 := (if p0$1 then BV32_ADD($j.0$1, BV32_MUL(group_id_y$1, 4bv32)) else v6$1);
    v6$2 := (if p0$2 then BV32_ADD($j.0$2, BV32_MUL(group_id_y$2, 4bv32)) else v6$2);
    v7$1 := (if p0$1 then BV32_SGE(v5$1, 0bv32) else v7$1);
    v7$2 := (if p0$2 then BV32_SGE(v5$2, 0bv32) else v7$2);
    p3$1 := (if p0$1 && v7$1 then v7$1 else p3$1);
    p3$2 := (if p0$2 && v7$2 then v7$2 else p3$2);
    p8$1 := (if p0$1 && !v7$1 then !v7$1 else p8$1);
    p8$2 := (if p0$2 && !v7$2 then !v7$2 else p8$2);
    v8$1 := (if p3$1 then BV32_SLT(v5$1, $NX) else v8$1);
    v8$2 := (if p3$2 then BV32_SLT(v5$2, $NX) else v8$2);
    p4$1 := (if p3$1 && v8$1 then v8$1 else p4$1);
    p4$2 := (if p3$2 && v8$2 then v8$2 else p4$2);
    p7$1 := (if p3$1 && !v8$1 then !v8$1 else p7$1);
    p7$2 := (if p3$2 && !v8$2 then !v8$2 else p7$2);
    v9$1 := (if p4$1 then BV32_SGE(v6$1, 0bv32) else v9$1);
    v9$2 := (if p4$2 then BV32_SGE(v6$2, 0bv32) else v9$2);
    p5$1 := (if p4$1 && v9$1 then v9$1 else p5$1);
    p5$2 := (if p4$2 && v9$2 then v9$2 else p5$2);
    p6$1 := (if p4$1 && !v9$1 then !v9$1 else p6$1);
    p6$2 := (if p4$2 && !v9$2 then !v9$2 else p6$2);
    $0$1 := (if p5$1 then (if BV32_SLT(v6$1, $NY) then 1bv1 else 0bv1) else $0$1);
    $0$2 := (if p5$2 then (if BV32_SLT(v6$2, $NY) then 1bv1 else 0bv1) else $0$2);
    $0$1 := (if p6$1 then 0bv1 else $0$1);
    $0$2 := (if p6$2 then 0bv1 else $0$2);
    $0$1 := (if p7$1 then 0bv1 else $0$1);
    $0$2 := (if p7$2 then 0bv1 else $0$2);
    $0$1 := (if p8$1 then 0bv1 else $0$1);
    $0$2 := (if p8$2 then 0bv1 else $0$2);
    $indg_h.0$1, $ind_h.0$1, $halo.0$1 := (if p0$1 then BV32_ADD(v5$1, BV32_MUL(v6$1, $pitch)) else $indg_h.0$1), (if p0$1 then BV32_ADD(BV32_ADD(BV32_ADD($i.0$1, 1bv32), BV32_MUL(BV32_ADD($j.0$1, 1bv32), 34bv32)), 204bv32) else $ind_h.0$1), (if p0$1 then BV1_ZEXT32($0$1) else $halo.0$1);
    $indg_h.0$2, $ind_h.0$2, $halo.0$2 := (if p0$2 then BV32_ADD(v5$2, BV32_MUL(v6$2, $pitch)) else $indg_h.0$2), (if p0$2 then BV32_ADD(BV32_ADD(BV32_ADD($i.0$2, 1bv32), BV32_MUL(BV32_ADD($j.0$2, 1bv32), 34bv32)), 204bv32) else $ind_h.0$2), (if p0$2 then BV1_ZEXT32($0$2) else $halo.0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v49$1 := (if p9$1 then _HAVOC_bv32$1 else v49$1);
    v49$2 := (if p9$2 then _HAVOC_bv32$2 else v49$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v50$1 := (if p9$1 then _HAVOC_bv32$1 else v50$1);
    v50$2 := (if p9$2 then _HAVOC_bv32$2 else v50$2);
    $indg_h.0$1, $ind_h.0$1, $halo.0$1 := (if p9$1 then v49$1 else $indg_h.0$1), (if p9$1 then v50$1 else $ind_h.0$1), (if p9$1 then v2$1 else $halo.0$1);
    $indg_h.0$2, $ind_h.0$2, $halo.0$2 := (if p9$2 then v49$2 else $indg_h.0$2), (if p9$2 then v50$2 else $ind_h.0$2), (if p9$2 then v2$2 else $halo.0$2);
    v10$1 := BV32_ADD(BV32_ADD(local_id_x$1, 1bv32), BV32_MUL(BV32_ADD(local_id_y$1, 1bv32), 34bv32));
    v10$2 := BV32_ADD(BV32_ADD(local_id_x$2, 1bv32), BV32_MUL(BV32_ADD(local_id_y$2, 1bv32), 34bv32));
    v11$1 := BV32_ADD(v10$1, 204bv32);
    v11$2 := BV32_ADD(v10$2, 204bv32);
    v12$1 := BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, 32bv32));
    v12$2 := BV32_ADD(local_id_x$2, BV32_MUL(group_id_x$2, 32bv32));
    v13$1 := BV32_ADD(local_id_y$1, BV32_MUL(group_id_y$1, 4bv32));
    v13$2 := BV32_ADD(local_id_y$2, BV32_MUL(group_id_y$2, 4bv32));
    v14$1 := BV32_ADD(v12$1, BV32_MUL(v13$1, $pitch));
    v14$2 := BV32_ADD(v12$2, BV32_MUL(v13$2, $pitch));
    v15$1 := BV32_SLT(v12$1, $NX);
    v15$2 := BV32_SLT(v12$2, $NX);
    p10$1 := (if v15$1 then v15$1 else p10$1);
    p10$2 := (if v15$2 then v15$2 else p10$2);
    p11$1 := (if !v15$1 then !v15$1 else p11$1);
    p11$2 := (if !v15$2 then !v15$2 else p11$2);
    $1$1 := (if p10$1 then (if BV32_SLT(v13$1, $NY) then 1bv1 else 0bv1) else $1$1);
    $1$2 := (if p10$2 then (if BV32_SLT(v13$2, $NY) then 1bv1 else 0bv1) else $1$2);
    $1$1 := (if p11$1 then 0bv1 else $1$1);
    $1$2 := (if p11$2 then 0bv1 else $1$2);
    v16$1 := BV1_ZEXT32($1$1);
    v16$2 := BV1_ZEXT32($1$2);
    v17$1 := v16$1 != 0bv32;
    v17$2 := v16$2 != 0bv32;
    p12$1 := (if v17$1 then v17$1 else p12$1);
    p12$2 := (if v17$2 then v17$2 else p12$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v18$1 := (if p12$1 then _HAVOC_bv32$1 else v18$1);
    v18$2 := (if p12$2 then _HAVOC_bv32$2 else v18$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p12$1, BV32_ADD(v10$1, 408bv32), v18$1, $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD(v10$1, 408bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p12$2, BV32_ADD(v10$2, 408bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p12$2, BV32_ADD(v10$2, 408bv32), v18$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} true;
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD(v10$1, 408bv32)] := (if p12$1 then v18$1 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD(v10$1, 408bv32)]);
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v10$2, 408bv32)] := (if p12$2 then v18$2 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v10$2, 408bv32)]);
    v19$1 := $halo.0$1 != 0bv32;
    v19$2 := $halo.0$2 != 0bv32;
    p14$1 := (if v19$1 then v19$1 else p14$1);
    p14$2 := (if v19$2 then v19$2 else p14$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v20$1 := (if p14$1 then _HAVOC_bv32$1 else v20$1);
    v20$2 := (if p14$2 then _HAVOC_bv32$2 else v20$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p14$1, BV32_ADD($ind_h.0$1, 204bv32), v20$1, $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD($ind_h.0$1, 204bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p14$2, BV32_ADD($ind_h.0$2, 204bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p14$2, BV32_ADD($ind_h.0$2, 204bv32), v20$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} true;
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD($ind_h.0$1, 204bv32)] := (if p14$1 then v20$1 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD($ind_h.0$1, 204bv32)]);
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($ind_h.0$2, 204bv32)] := (if p14$2 then v20$2 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($ind_h.0$2, 204bv32)]);
    havoc v21$1, v21$2;
    $indg.0$1, $indg_h.1$1, $indg0.0$1, $k.0 := v14$1, $indg_h.0$1, v21$1, 0bv32;
    $indg.0$2, $indg_h.1$2, $indg0.0$2 := v14$2, $indg_h.0$2, v21$2;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $16;

  $16:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b9 ==> _WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 ==> _WATCHED_OFFSET == BV32_SUB(BV32_ADD(BV32_ADD(BV32_ADD(local_id_x$1, 1bv32), BV32_MUL(BV32_ADD(local_id_y$1, 1bv32), 34bv32)), 204bv32), 204bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_ADD(BV32_ADD(local_id_x$1, 1bv32), BV32_MUL(BV32_ADD(local_id_y$1, 1bv32), 34bv32)), 204bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_ADD(BV32_ADD(local_id_x$1, 1bv32), BV32_MUL(BV32_ADD(local_id_y$1, 1bv32), 34bv32)), 408bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b8 ==> _READ_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 ==> _WATCHED_OFFSET == BV32_ADD(BV32_ADD(BV32_ADD(local_id_x$1, 1bv32), BV32_MUL(BV32_ADD(local_id_y$1, 1bv32), 34bv32)), 204bv32) || _WATCHED_OFFSET == BV32_ADD(BV32_ADD(BV32_ADD(local_id_x$1, 1bv32), BV32_MUL(BV32_ADD(local_id_y$1, 1bv32), 34bv32)), 408bv32);
    assert {:tag "nowrite"} _b7 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1;
    assert {:tag "noread"} _b6 ==> !_READ_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1;
    assert {:tag "nowrite"} _b5 ==> !_WRITE_HAS_OCCURRED_$$d_u2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($k.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($k.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($k.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($k.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($k.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($k.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($k.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($k.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $k.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $k.0);
    assert {:block_sourceloc} {:sourceloc_num 24} true;
    v22 := BV32_SLT($k.0, $NZ);
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
    p33$1 := false;
    p33$2 := false;
    p34$1 := false;
    p34$2 := false;
    p35$1 := false;
    p35$2 := false;
    p36$1 := false;
    p36$2 := false;
    p37$1 := false;
    p37$2 := false;
    p38$1 := false;
    p38$2 := false;
    goto __partitioned_block_$truebb7_0, $falsebb7;

  $falsebb7:
    assume {:partition} !v22 && !v22;
    return;

  __partitioned_block_$truebb7_0:
    assume {:partition} v22 && v22;
    v23$1 := v16$1 != 0bv32;
    v23$2 := v16$2 != 0bv32;
    p17$1 := (if v23$1 then v23$1 else p17$1);
    p17$2 := (if v23$2 then v23$2 else p17$2);
    p16$1 := (if !v23$1 then !v23$1 else p16$1);
    p16$2 := (if !v23$2 then !v23$2 else p16$2);
    $indg.1$1, $indg0.1$1 := (if p16$1 then $indg.0$1 else $indg.1$1), (if p16$1 then $indg0.0$1 else $indg0.1$1);
    $indg.1$2, $indg0.1$2 := (if p16$2 then $indg.0$2 else $indg.1$2), (if p16$2 then $indg0.0$2 else $indg0.1$2);
    v24$1 := (if p17$1 then BV32_ADD($indg.0$1, BV32_MUL($NY, $pitch)) else v24$1);
    v24$2 := (if p17$2 then BV32_ADD($indg.0$2, BV32_MUL($NY, $pitch)) else v24$2);
    call {:sourceloc} {:sourceloc_num 27} _LOG_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p17$1, v11$1, $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][v11$1]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 27} _CHECK_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p17$2, v11$2, $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v11$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} true;
    v25$1 := (if p17$1 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][v11$1] else v25$1);
    v25$2 := (if p17$2 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v11$2] else v25$2);
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p17$1, BV32_SUB(v11$1, 204bv32), v25$1, $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_SUB(v11$1, 204bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p17$2, BV32_SUB(v11$2, 204bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p17$2, BV32_SUB(v11$2, 204bv32), v25$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} true;
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_SUB(v11$1, 204bv32)] := (if p17$1 then v25$1 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_SUB(v11$1, 204bv32)]);
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v11$2, 204bv32)] := (if p17$2 then v25$2 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v11$2, 204bv32)]);
    call {:sourceloc} {:sourceloc_num 29} _LOG_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p17$1, BV32_ADD(v10$1, 408bv32), $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD(v10$1, 408bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 29} _CHECK_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p17$2, BV32_ADD(v10$2, 408bv32), $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v10$2, 408bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} true;
    v26$1 := (if p17$1 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD(v10$1, 408bv32)] else v26$1);
    v26$2 := (if p17$2 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v10$2, 408bv32)] else v26$2);
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p17$1, v11$1, v26$1, $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][v11$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p17$2, v11$2);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p17$2, v11$2, v26$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} true;
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][v11$1] := (if p17$1 then v26$1 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][v11$1]);
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v11$2] := (if p17$2 then v26$2 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v11$2]);
    v27$1 := (if p17$1 then BV32_SLT($k.0, v0) else v27$1);
    v27$2 := (if p17$2 then BV32_SLT($k.0, v0) else v27$2);
    p19$1 := (if p17$1 && v27$1 then v27$1 else p19$1);
    p19$2 := (if p17$2 && v27$2 then v27$2 else p19$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v28$1 := (if p19$1 then _HAVOC_bv32$1 else v28$1);
    v28$2 := (if p19$2 then _HAVOC_bv32$2 else v28$2);
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p19$1, BV32_ADD(v10$1, 408bv32), v28$1, $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD(v10$1, 408bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p19$2, BV32_ADD(v10$2, 408bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p19$2, BV32_ADD(v10$2, 408bv32), v28$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} true;
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD(v10$1, 408bv32)] := (if p19$1 then v28$1 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD(v10$1, 408bv32)]);
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v10$2, 408bv32)] := (if p19$2 then v28$2 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v10$2, 408bv32)]);
    $indg.1$1, $indg0.1$1 := (if p17$1 then v24$1 else $indg.1$1), (if p17$1 then $indg.0$1 else $indg0.1$1);
    $indg.1$2, $indg0.1$2 := (if p17$2 then v24$2 else $indg.1$2), (if p17$2 then $indg.0$2 else $indg0.1$2);
    v29$1 := $halo.0$1 != 0bv32;
    v29$2 := $halo.0$2 != 0bv32;
    p21$1 := (if v29$1 then v29$1 else p21$1);
    p21$2 := (if v29$2 then v29$2 else p21$2);
    p20$1 := (if !v29$1 then !v29$1 else p20$1);
    p20$2 := (if !v29$2 then !v29$2 else p20$2);
    $indg_h.2$1 := (if p20$1 then $indg_h.1$1 else $indg_h.2$1);
    $indg_h.2$2 := (if p20$2 then $indg_h.1$2 else $indg_h.2$2);
    v30$1 := (if p21$1 then BV32_ADD($indg_h.1$1, BV32_MUL($NY, $pitch)) else v30$1);
    v30$2 := (if p21$2 then BV32_ADD($indg_h.1$2, BV32_MUL($NY, $pitch)) else v30$2);
    call {:sourceloc} {:sourceloc_num 37} _LOG_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p21$1, $ind_h.0$1, $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][$ind_h.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 37} _CHECK_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p21$2, $ind_h.0$2, $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$ind_h.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} true;
    v31$1 := (if p21$1 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][$ind_h.0$1] else v31$1);
    v31$2 := (if p21$2 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$ind_h.0$2] else v31$2);
    call {:sourceloc} {:sourceloc_num 38} _LOG_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p21$1, BV32_SUB($ind_h.0$1, 204bv32), v31$1, $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_SUB($ind_h.0$1, 204bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p21$2, BV32_SUB($ind_h.0$2, 204bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 38} _CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p21$2, BV32_SUB($ind_h.0$2, 204bv32), v31$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} true;
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_SUB($ind_h.0$1, 204bv32)] := (if p21$1 then v31$1 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_SUB($ind_h.0$1, 204bv32)]);
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB($ind_h.0$2, 204bv32)] := (if p21$2 then v31$2 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB($ind_h.0$2, 204bv32)]);
    call {:sourceloc} {:sourceloc_num 39} _LOG_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p21$1, BV32_ADD($ind_h.0$1, 204bv32), $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD($ind_h.0$1, 204bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 39} _CHECK_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p21$2, BV32_ADD($ind_h.0$2, 204bv32), $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($ind_h.0$2, 204bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} true;
    v32$1 := (if p21$1 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD($ind_h.0$1, 204bv32)] else v32$1);
    v32$2 := (if p21$2 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($ind_h.0$2, 204bv32)] else v32$2);
    call {:sourceloc} {:sourceloc_num 40} _LOG_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p21$1, $ind_h.0$1, v32$1, $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][$ind_h.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p21$2, $ind_h.0$2);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 40} _CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p21$2, $ind_h.0$2, v32$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} true;
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][$ind_h.0$1] := (if p21$1 then v32$1 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][$ind_h.0$1]);
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$ind_h.0$2] := (if p21$2 then v32$2 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$ind_h.0$2]);
    v33$1 := (if p21$1 then BV32_SLT($k.0, v0) else v33$1);
    v33$2 := (if p21$2 then BV32_SLT($k.0, v0) else v33$2);
    p23$1 := (if p21$1 && v33$1 then v33$1 else p23$1);
    p23$2 := (if p21$2 && v33$2 then v33$2 else p23$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v34$1 := (if p23$1 then _HAVOC_bv32$1 else v34$1);
    v34$2 := (if p23$2 then _HAVOC_bv32$2 else v34$2);
    call {:sourceloc} {:sourceloc_num 43} _LOG_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p23$1, BV32_ADD($ind_h.0$1, 204bv32), v34$1, $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD($ind_h.0$1, 204bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p23$2, BV32_ADD($ind_h.0$2, 204bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 43} _CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(p23$2, BV32_ADD($ind_h.0$2, 204bv32), v34$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} true;
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD($ind_h.0$1, 204bv32)] := (if p23$1 then v34$1 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD($ind_h.0$1, 204bv32)]);
    $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($ind_h.0$2, 204bv32)] := (if p23$2 then v34$2 else $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD($ind_h.0$2, 204bv32)]);
    $indg_h.2$1 := (if p21$1 then v30$1 else $indg_h.2$1);
    $indg_h.2$2 := (if p21$2 then v30$2 else $indg_h.2$2);
    goto __partitioned_block_$truebb7_1;

  __partitioned_block_$truebb7_1:
    call {:sourceloc_num 46} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    v35$1 := v16$1 != 0bv32;
    v35$2 := v16$2 != 0bv32;
    p25$1 := (if v35$1 then v35$1 else p25$1);
    p25$2 := (if v35$2 then v35$2 else p25$2);
    v36$1 := (if p25$1 then v12$1 == 0bv32 else v36$1);
    v36$2 := (if p25$2 then v12$2 == 0bv32 else v36$2);
    p38$1 := (if p25$1 && v36$1 then v36$1 else p38$1);
    p38$2 := (if p25$2 && v36$2 then v36$2 else p38$2);
    p27$1 := (if p25$1 && !v36$1 then !v36$1 else p27$1);
    p27$2 := (if p25$2 && !v36$2 then !v36$2 else p27$2);
    p38$1 := (if p26$1 then true else p38$1);
    p38$2 := (if p26$2 then true else p38$2);
    v37$1 := (if p27$1 then v12$1 == BV32_SUB($NX, 1bv32) else v37$1);
    v37$2 := (if p27$2 then v12$2 == BV32_SUB($NX, 1bv32) else v37$2);
    p38$1 := (if p27$1 && v37$1 then v37$1 else p38$1);
    p38$2 := (if p27$2 && v37$2 then v37$2 else p38$2);
    p29$1 := (if p27$1 && !v37$1 then !v37$1 else p29$1);
    p29$2 := (if p27$2 && !v37$2 then !v37$2 else p29$2);
    p38$1 := (if p28$1 then true else p38$1);
    p38$2 := (if p28$2 then true else p38$2);
    v38$1 := (if p29$1 then v13$1 == 0bv32 else v38$1);
    v38$2 := (if p29$2 then v13$2 == 0bv32 else v38$2);
    p38$1 := (if p29$1 && v38$1 then v38$1 else p38$1);
    p38$2 := (if p29$2 && v38$2 then v38$2 else p38$2);
    p31$1 := (if p29$1 && !v38$1 then !v38$1 else p31$1);
    p31$2 := (if p29$2 && !v38$2 then !v38$2 else p31$2);
    p38$1 := (if p30$1 then true else p38$1);
    p38$2 := (if p30$2 then true else p38$2);
    v39$1 := (if p31$1 then v13$1 == BV32_SUB($NY, 1bv32) else v39$1);
    v39$2 := (if p31$2 then v13$2 == BV32_SUB($NY, 1bv32) else v39$2);
    p38$1 := (if p31$1 && v39$1 then v39$1 else p38$1);
    p38$2 := (if p31$2 && v39$2 then v39$2 else p38$2);
    p33$1 := (if p31$1 && !v39$1 then !v39$1 else p33$1);
    p33$2 := (if p31$2 && !v39$2 then !v39$2 else p33$2);
    p38$1 := (if p32$1 then true else p38$1);
    p38$2 := (if p32$2 then true else p38$2);
    v40$1 := (if p33$1 then $k.0 == 0bv32 else v40$1);
    v40$2 := (if p33$2 then $k.0 == 0bv32 else v40$2);
    p38$1 := (if p33$1 && v40$1 then v40$1 else p38$1);
    p38$2 := (if p33$2 && v40$2 then v40$2 else p38$2);
    p35$1 := (if p33$1 && !v40$1 then !v40$1 else p35$1);
    p35$2 := (if p33$2 && !v40$2 then !v40$2 else p35$2);
    p38$1 := (if p34$1 then true else p38$1);
    p38$2 := (if p34$2 then true else p38$2);
    v41$1 := (if p35$1 then $k.0 == v0 else v41$1);
    v41$2 := (if p35$2 then $k.0 == v0 else v41$2);
    p38$1 := (if p35$1 && v41$1 then v41$1 else p38$1);
    p38$2 := (if p35$2 && v41$2 then v41$2 else p38$2);
    p36$1 := (if p35$1 && !v41$1 then !v41$1 else p36$1);
    p36$2 := (if p35$2 && !v41$2 then !v41$2 else p36$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 56} true;
    v43$1 := (if p36$1 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_SUB(v11$1, 1bv32)] else v43$1);
    v43$2 := (if p36$2 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v11$2, 1bv32)] else v43$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 57} true;
    v44$1 := (if p36$1 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD(v10$1, 205bv32)] else v44$1);
    v44$2 := (if p36$2 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v10$2, 205bv32)] else v44$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 58} true;
    v45$1 := (if p36$1 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_SUB(v11$1, 34bv32)] else v45$1);
    v45$2 := (if p36$2 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v11$2, 34bv32)] else v45$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 59} true;
    v46$1 := (if p36$1 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD(v10$1, 238bv32)] else v46$1);
    v46$2 := (if p36$2 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v10$2, 238bv32)] else v46$2);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 60} true;
    v47$1 := (if p36$1 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_SUB(v11$1, 204bv32)] else v47$1);
    v47$2 := (if p36$2 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v11$2, 204bv32)] else v47$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 61} true;
    v48$1 := (if p36$1 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][BV32_ADD(v10$1, 408bv32)] else v48$1);
    v48$2 := (if p36$2 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v10$2, 408bv32)] else v48$2);
    $u2.0$1 := (if p36$1 then FMUL32(FADD32(FADD32(FADD32(FADD32(FADD32(v43$1, v44$1), v45$1), v46$1), v47$1), v48$1), 1042983595bv32) else $u2.0$1);
    $u2.0$2 := (if p36$2 then FMUL32(FADD32(FADD32(FADD32(FADD32(FADD32(v43$2, v44$2), v45$2), v46$2), v47$2), v48$2), 1042983595bv32) else $u2.0$2);
    p38$1 := (if p37$1 then true else p38$1);
    p38$2 := (if p37$2 then true else p38$2);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 54} true;
    v42$1 := (if p38$1 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[1bv1][v11$1] else v42$1);
    v42$2 := (if p38$2 then $$_ZZ13GPU_laplace3diiiiPfS_E2u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v11$2] else v42$2);
    $u2.0$1 := (if p38$1 then v42$1 else $u2.0$1);
    $u2.0$2 := (if p38$2 then v42$2 else $u2.0$2);
    call {:sourceloc} {:sourceloc_num 63} _LOG_WRITE_$$d_u2(p25$1, $indg0.1$1, $u2.0$1, $$d_u2[$indg0.1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_u2(p25$2, $indg0.1$2);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 63} _CHECK_WRITE_$$d_u2(p25$2, $indg0.1$2, $u2.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_u2"} true;
    $$d_u2[$indg0.1$1] := (if p25$1 then $u2.0$1 else $$d_u2[$indg0.1$1]);
    $$d_u2[$indg0.1$2] := (if p25$2 then $u2.0$2 else $$d_u2[$indg0.1$2]);
    goto __partitioned_block_$truebb7_2;

  __partitioned_block_$truebb7_2:
    call {:sourceloc_num 65} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    $indg.0$1, $indg_h.1$1, $indg0.0$1, $k.0 := $indg.1$1, $indg_h.2$1, $indg0.1$1, BV32_ADD($k.0, 1bv32);
    $indg.0$2, $indg_h.1$2, $indg0.0$2 := $indg.1$2, $indg_h.2$2, $indg0.1$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $16;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 25bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13GPU_laplace3diiiiPfS_E2u1, $$d_u2, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13GPU_laplace3diiiiPfS_E2u1, $$d_u2, _TRACKING;



function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

const _WATCHED_VALUE_$$d_u1: bv32;

procedure {:inline 1} _LOG_READ_$$d_u1(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_u1;



implementation {:inline 1} _LOG_READ_$$d_u1(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_u1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_u1 == _value then true else _READ_HAS_OCCURRED_$$d_u1);
    return;
}



procedure _CHECK_READ_$$d_u1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_u1"} {:array "$$d_u1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_u1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_u1);
  requires {:source_name "d_u1"} {:array "$$d_u1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_u1 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_u1: bool;

procedure {:inline 1} _LOG_WRITE_$$d_u1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_u1, _WRITE_READ_BENIGN_FLAG_$$d_u1;



implementation {:inline 1} _LOG_WRITE_$$d_u1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_u1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_u1 == _value then true else _WRITE_HAS_OCCURRED_$$d_u1);
    _WRITE_READ_BENIGN_FLAG_$$d_u1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_u1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_u1);
    return;
}



procedure _CHECK_WRITE_$$d_u1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_u1"} {:array "$$d_u1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_u1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_u1 != _value);
  requires {:source_name "d_u1"} {:array "$$d_u1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_u1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_u1 != _value);
  requires {:source_name "d_u1"} {:array "$$d_u1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_u1 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_u1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_u1;



implementation {:inline 1} _LOG_ATOMIC_$$d_u1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_u1 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_u1);
    return;
}



procedure _CHECK_ATOMIC_$$d_u1(_P: bool, _offset: bv32);
  requires {:source_name "d_u1"} {:array "$$d_u1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_u1 && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_u1"} {:array "$$d_u1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_u1 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_u1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_u1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_u1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_u1 := (if _P && _WRITE_HAS_OCCURRED_$$d_u1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_u1);
    return;
}



const _WATCHED_VALUE_$$d_u2: bv32;

procedure {:inline 1} _LOG_READ_$$d_u2(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_u2;



implementation {:inline 1} _LOG_READ_$$d_u2(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_u2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_u2 == _value then true else _READ_HAS_OCCURRED_$$d_u2);
    return;
}



procedure _CHECK_READ_$$d_u2(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_u2"} {:array "$$d_u2"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_u2 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_u2);
  requires {:source_name "d_u2"} {:array "$$d_u2"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_u2 && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_u2: bool;

procedure {:inline 1} _LOG_WRITE_$$d_u2(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_u2, _WRITE_READ_BENIGN_FLAG_$$d_u2;



implementation {:inline 1} _LOG_WRITE_$$d_u2(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_u2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_u2 == _value then true else _WRITE_HAS_OCCURRED_$$d_u2);
    _WRITE_READ_BENIGN_FLAG_$$d_u2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_u2 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_u2);
    return;
}



procedure _CHECK_WRITE_$$d_u2(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_u2"} {:array "$$d_u2"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_u2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_u2 != _value);
  requires {:source_name "d_u2"} {:array "$$d_u2"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_u2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_u2 != _value);
  requires {:source_name "d_u2"} {:array "$$d_u2"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_u2 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_u2(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_u2;



implementation {:inline 1} _LOG_ATOMIC_$$d_u2(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_u2 := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_u2);
    return;
}



procedure _CHECK_ATOMIC_$$d_u2(_P: bool, _offset: bv32);
  requires {:source_name "d_u2"} {:array "$$d_u2"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_u2 && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_u2"} {:array "$$d_u2"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_u2 && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_u2(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_u2;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_u2(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_u2 := (if _P && _WRITE_HAS_OCCURRED_$$d_u2 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_u2);
    return;
}



const _WATCHED_VALUE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1;



implementation {:inline 1} _LOG_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 == _value then true else _READ_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1);
    return;
}



procedure _CHECK_READ_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "u1"} {:array "$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "u1"} {:array "$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1, _WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1;



implementation {:inline 1} _LOG_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1);
    return;
}



procedure _CHECK_WRITE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "u1"} {:array "$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "u1"} {:array "$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "u1"} {:array "$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(_P: bool, _offset: bv32);
  requires {:source_name "u1"} {:array "$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "u1"} {:array "$$_ZZ13GPU_laplace3diiiiPfS_E2u1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ13GPU_laplace3diiiiPfS_E2u1);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_u2;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_u2;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_u2;
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
    havoc $$d_u2;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13GPU_laplace3diiiiPfS_E2u1;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13GPU_laplace3diiiiPfS_E2u1;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_u2;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_u2;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_u2;
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
    havoc $$d_u2;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13GPU_laplace3diiiiPfS_E2u1;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

const {:existential true} _b9: bool;
