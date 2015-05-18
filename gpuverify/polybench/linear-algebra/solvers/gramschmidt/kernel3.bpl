type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



var {:source_name "A"} {:global} $$A: [bv32]bv64;

axiom {:array_info "$$A"} {:global} {:elem_width 64} {:source_name "A"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$A: bool;

axiom {:array_info "$$Q"} {:global} {:elem_width 64} {:source_name "Q"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Q: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Q: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Q: bool;

axiom {:array_info "$$R"} {:global} {:elem_width 64} {:source_name "R"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$R: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$R: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$R: bool;

axiom {:array_info "$$private_A"} {:elem_width 64} {:source_name "private_A"} {:source_elem_width 64} {:source_dimensions "2,1"} true;

axiom {:array_info "$$private_Q"} {:elem_width 64} {:source_name "private_Q"} {:source_elem_width 64} {:source_dimensions "2,1"} true;

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

function FADD64(bv64, bv64) : bv64;

function FMUL64(bv64, bv64) : bv64;

function FSUB64(bv64, bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel3"} {:kernel} $kernel3($nj: bv32, $ni: bv32, $h0: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $nj == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $ni == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$A && !_WRITE_HAS_OCCURRED_$$A && !_ATOMIC_HAS_OCCURRED_$$A;
  requires !_READ_HAS_OCCURRED_$$Q && !_WRITE_HAS_OCCURRED_$$Q && !_ATOMIC_HAS_OCCURRED_$$Q;
  requires !_READ_HAS_OCCURRED_$$R && !_WRITE_HAS_OCCURRED_$$R && !_ATOMIC_HAS_OCCURRED_$$R;
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
  modifies _READ_HAS_OCCURRED_$$A, $$A, _TRACKING, _WRITE_HAS_OCCURRED_$$A, _WRITE_READ_BENIGN_FLAG_$$A, _WRITE_READ_BENIGN_FLAG_$$A, _TRACKING;



implementation {:source_name "kernel3"} {:kernel} $kernel3($nj: bv32, $ni: bv32, $h0: bv32)
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
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var $g3.0$1: bv32;
  var $g3.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3: bool;
  var v4: bool;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bool;
  var v10$2: bool;
  var v11$1: bool;
  var v11$2: bool;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bool;
  var v13$2: bool;
  var v14$1: bool;
  var v14$2: bool;
  var v15$1: bool;
  var v15$2: bool;
  var v16$1: bv64;
  var v16$2: bv64;
  var v17$1: bool;
  var v17$2: bool;
  var v18$1: bv64;
  var v18$2: bv64;
  var v19$1: bool;
  var v19$2: bool;
  var v20$1: bool;
  var v20$2: bool;
  var v21$1: bool;
  var v21$2: bool;
  var v22$1: bool;
  var v22$2: bool;
  var v23$1: bv64;
  var v23$2: bv64;
  var v24$1: bool;
  var v24$2: bool;
  var v25$1: bv64;
  var v25$2: bv64;
  var v26$1: bool;
  var v26$2: bool;
  var v27$1: bool;
  var v27$2: bool;
  var v28$1: bool;
  var v28$2: bool;
  var v29$1: bool;
  var v29$2: bool;
  var v30$1: bv64;
  var v30$2: bv64;
  var v31$1: bv64;
  var v31$2: bv64;
  var v32$1: bv64;
  var v32$2: bv64;
  var v33$1: bool;
  var v33$2: bool;
  var v34$1: bv64;
  var v34$2: bv64;
  var v35$1: bv64;
  var v35$2: bv64;
  var v36$1: bv64;
  var v36$2: bv64;
  var v37$1: bool;
  var v37$2: bool;
  var v38$1: bool;
  var v38$2: bool;
  var v39$1: bool;
  var v39$2: bool;
  var v40$1: bool;
  var v40$2: bool;
  var v41$1: bv64;
  var v41$2: bv64;
  var v42$1: bool;
  var v42$2: bool;
  var v43$1: bv64;
  var v43$2: bv64;
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
  var p39$1: bool;
  var p39$2: bool;
  var p40$1: bool;
  var p40$2: bool;
  var p41$1: bool;
  var p41$2: bool;
  var p42$1: bool;
  var p42$2: bool;
  var p43$1: bool;
  var p43$2: bool;
  var p44$1: bool;
  var p44$2: bool;
  var p45$1: bool;
  var p45$2: bool;
  var p46$1: bool;
  var p46$2: bool;
  var p47$1: bool;
  var p47$2: bool;
  var p48$1: bool;
  var p48$2: bool;
  var p49$1: bool;
  var p49$2: bool;
  var p50$1: bool;
  var p50$2: bool;
  var p51$1: bool;
  var p51$2: bool;
  var p52$1: bool;
  var p52$2: bool;
  var p53$1: bool;
  var p53$2: bool;
  var p54$1: bool;
  var p54$2: bool;
  var _HAVOC_bv64$1: bv64;
  var _HAVOC_bv64$2: bv64;


  $0:
    v0$1 := group_id_x$1;
    v0$2 := group_id_x$2;
    v1$1 := local_id_x$1;
    v1$2 := local_id_x$2;
    v2$1 := local_id_y$1;
    v2$2 := local_id_y$2;
    v3 := BV32_SGE(BV32_MUL(5bv32, $nj), BV32_ADD($h0, 5bv32));
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
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v3 && !v3;
    goto $54;

  $54:
    return;

  $truebb:
    assume {:partition} v3 && v3;
    v4 := BV32_SGE($h0, 5bv32);
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v4 && !v4;
    goto $54;

  $truebb0:
    assume {:partition} v4 && v4;
    v5$1 := BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$1)), $h0), 64bv32), 0bv32);
    v5$2 := BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$2)), $h0), 64bv32), 0bv32);
    p0$1 := (if v5$1 then v5$1 else p0$1);
    p0$2 := (if v5$2 then v5$2 else p0$2);
    p1$1 := (if !v5$1 then !v5$1 else p1$1);
    p1$2 := (if !v5$2 then !v5$2 else p1$2);
    $0$1 := (if p0$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$1)), $h0), 64bv32)), 16384bv32), 1bv32), 16384bv32)) else $0$1);
    $0$2 := (if p0$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$2)), $h0), 64bv32)), 16384bv32), 1bv32), 16384bv32)) else $0$2);
    $0$1 := (if p1$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$1)), $h0), 64bv32), 16384bv32) else $0$1);
    $0$2 := (if p1$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$2)), $h0), 64bv32), 16384bv32) else $0$2);
    v6$1 := BV32_SLT(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$1), $h0), 96bv32), 0bv32);
    v6$2 := BV32_SLT(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$2), $h0), 96bv32), 0bv32);
    p2$1 := (if v6$1 then v6$1 else p2$1);
    p2$2 := (if v6$2 then v6$2 else p2$2);
    p3$1 := (if !v6$1 then !v6$1 else p3$1);
    p3$2 := (if !v6$2 then !v6$2 else p3$2);
    $1$1 := (if p2$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$1), $h0), 96bv32)), 24576bv32), 1bv32), 24576bv32)) else $1$1);
    $1$2 := (if p2$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$2), $h0), 96bv32)), 24576bv32), 1bv32), 24576bv32)) else $1$2);
    $1$1 := (if p3$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$1), $h0), 96bv32), 24576bv32) else $1$1);
    $1$2 := (if p3$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$2), $h0), 96bv32), 24576bv32) else $1$2);
    v7$1 := BV32_SGT(BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $0$1)), 8192bv32), BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $1$1)), 8192bv32));
    v7$2 := BV32_SGT(BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $0$2)), 8192bv32), BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $1$2)), 8192bv32));
    p4$1 := (if v7$1 then v7$1 else p4$1);
    p4$2 := (if v7$2 then v7$2 else p4$2);
    p7$1 := (if !v7$1 then !v7$1 else p7$1);
    p7$2 := (if !v7$2 then !v7$2 else p7$2);
    v8$1 := (if p4$1 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$1)), $h0), 64bv32), 0bv32) else v8$1);
    v8$2 := (if p4$2 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$2)), $h0), 64bv32), 0bv32) else v8$2);
    p5$1 := (if p4$1 && v8$1 then v8$1 else p5$1);
    p5$2 := (if p4$2 && v8$2 then v8$2 else p5$2);
    p6$1 := (if p4$1 && !v8$1 then !v8$1 else p6$1);
    p6$2 := (if p4$2 && !v8$2 then !v8$2 else p6$2);
    $2$1 := (if p5$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$1)), $h0), 64bv32)), 16384bv32), 1bv32), 16384bv32)) else $2$1);
    $2$2 := (if p5$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$2)), $h0), 64bv32)), 16384bv32), 1bv32), 16384bv32)) else $2$2);
    $2$1 := (if p6$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$1)), $h0), 64bv32), 16384bv32) else $2$1);
    $2$2 := (if p6$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$2)), $h0), 64bv32), 16384bv32) else $2$2);
    $3$1 := (if p4$1 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $2$1)), 8192bv32) else $3$1);
    $3$2 := (if p4$2 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $2$2)), 8192bv32) else $3$2);
    v9$1 := (if p7$1 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$1), $h0), 96bv32), 0bv32) else v9$1);
    v9$2 := (if p7$2 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$2), $h0), 96bv32), 0bv32) else v9$2);
    p8$1 := (if p7$1 && v9$1 then v9$1 else p8$1);
    p8$2 := (if p7$2 && v9$2 then v9$2 else p8$2);
    p9$1 := (if p7$1 && !v9$1 then !v9$1 else p9$1);
    p9$2 := (if p7$2 && !v9$2 then !v9$2 else p9$2);
    $4$1 := (if p8$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$1), $h0), 96bv32)), 24576bv32), 1bv32), 24576bv32)) else $4$1);
    $4$2 := (if p8$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$2), $h0), 96bv32)), 24576bv32), 1bv32), 24576bv32)) else $4$2);
    $4$1 := (if p9$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$1), $h0), 96bv32), 24576bv32) else $4$1);
    $4$2 := (if p9$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$2), $h0), 96bv32), 24576bv32) else $4$2);
    $3$1 := (if p7$1 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $4$1)), 8192bv32) else $3$1);
    $3$2 := (if p7$2 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $4$2)), 8192bv32) else $3$2);
    $g1.0$1 := $3$1;
    $g1.0$2 := $3$2;
    p10$1 := true;
    p10$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $18;

  $18:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "nowrite"} _b56 ==> !_WRITE_HAS_OCCURRED_$$A;
    assert {:tag "noread"} _b55 ==> !_READ_HAS_OCCURRED_$$A;
    assert {:tag "predicatedEquality"} _b54 ==> p10$1 && p10$2 ==> v43$1 == v43$2;
    assert {:tag "predicatedEquality"} _b53 ==> p10$1 && p10$2 ==> v42$1 == v42$2;
    assert {:tag "predicatedEquality"} _b52 ==> p10$1 && p10$2 ==> v41$1 == v41$2;
    assert {:tag "predicatedEquality"} _b51 ==> p10$1 && p10$2 ==> v40$1 == v40$2;
    assert {:tag "predicatedEquality"} _b50 ==> p10$1 && p10$2 ==> v39$1 == v39$2;
    assert {:tag "predicatedEquality"} _b49 ==> p10$1 && p10$2 ==> v38$1 == v38$2;
    assert {:tag "predicatedEquality"} _b48 ==> p10$1 && p10$2 ==> v37$1 == v37$2;
    assert {:tag "predicatedEquality"} _b47 ==> p10$1 && p10$2 ==> v36$1 == v36$2;
    assert {:tag "predicatedEquality"} _b46 ==> p10$1 && p10$2 ==> v35$1 == v35$2;
    assert {:tag "predicatedEquality"} _b45 ==> p10$1 && p10$2 ==> v34$1 == v34$2;
    assert {:tag "predicatedEquality"} _b44 ==> p10$1 && p10$2 ==> v33$1 == v33$2;
    assert {:tag "predicatedEquality"} _b43 ==> p10$1 && p10$2 ==> v32$1 == v32$2;
    assert {:tag "predicatedEquality"} _b42 ==> p10$1 && p10$2 ==> v31$1 == v31$2;
    assert {:tag "predicatedEquality"} _b41 ==> p10$1 && p10$2 ==> v30$1 == v30$2;
    assert {:tag "predicatedEquality"} _b40 ==> p10$1 && p10$2 ==> v29$1 == v29$2;
    assert {:tag "predicatedEquality"} _b39 ==> p10$1 && p10$2 ==> v28$1 == v28$2;
    assert {:tag "predicatedEquality"} _b38 ==> p10$1 && p10$2 ==> v27$1 == v27$2;
    assert {:tag "predicatedEquality"} _b37 ==> p10$1 && p10$2 ==> v26$1 == v26$2;
    assert {:tag "predicatedEquality"} _b36 ==> p10$1 && p10$2 ==> v25$1 == v25$2;
    assert {:tag "predicatedEquality"} _b35 ==> p10$1 && p10$2 ==> v24$1 == v24$2;
    assert {:tag "predicatedEquality"} _b34 ==> p10$1 && p10$2 ==> v23$1 == v23$2;
    assert {:tag "predicatedEquality"} _b33 ==> p10$1 && p10$2 ==> v22$1 == v22$2;
    assert {:tag "predicatedEquality"} _b32 ==> p10$1 && p10$2 ==> v21$1 == v21$2;
    assert {:tag "predicatedEquality"} _b31 ==> p10$1 && p10$2 ==> v20$1 == v20$2;
    assert {:tag "predicatedEquality"} _b30 ==> p10$1 && p10$2 ==> v19$1 == v19$2;
    assert {:tag "predicatedEquality"} _b29 ==> p10$1 && p10$2 ==> v18$1 == v18$2;
    assert {:tag "predicatedEquality"} _b28 ==> p10$1 && p10$2 ==> v17$1 == v17$2;
    assert {:tag "predicatedEquality"} _b27 ==> p10$1 && p10$2 ==> v16$1 == v16$2;
    assert {:tag "predicatedEquality"} _b26 ==> p10$1 && p10$2 ==> v15$1 == v15$2;
    assert {:tag "predicatedEquality"} _b25 ==> p10$1 && p10$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b24 ==> p10$1 && p10$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b23 ==> p10$1 && p10$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b22 ==> p10$1 && p10$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b21 ==> p10$1 && p10$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b20 ==> p10$1 && p10$2 ==> $g3.0$1 == $g3.0$2;
    assert {:tag "predicatedEquality"} _b19 ==> p10$1 && p10$2 ==> $g1.0$1 == $g1.0$2;
    assert {:tag "loopPredicateEquality"} _b18 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p10$1 == p10$2;
    assert {:tag "loopPredicateEquality"} _b17 ==> p10$1 == p10$2;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p10$1 ==> _b7 ==> p10$1 ==> BV32_SGE(BV32_MUL(5bv32, $nj), BV32_ADD($h0, 5bv32)) && BV32_SGE($h0, 5bv32);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p10$2 ==> _b7 ==> p10$2 ==> BV32_SGE(BV32_MUL(5bv32, $nj), BV32_ADD($h0, 5bv32)) && BV32_SGE($h0, 5bv32);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b6 ==> BV32_SGE(BV32_MUL(5bv32, $nj), BV32_ADD($h0, 5bv32)) && BV32_SGE($h0, 5bv32) && BV32_SLT($g1.0$1, BV32_SDIV(BV32_MUL(2bv32, $h0), 5bv32)) ==> p10$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b6 ==> BV32_SGE(BV32_MUL(5bv32, $nj), BV32_ADD($h0, 5bv32)) && BV32_SGE($h0, 5bv32) && BV32_SLT($g1.0$2, BV32_SDIV(BV32_MUL(2bv32, $h0), 5bv32)) ==> p10$2;
    assert {:tag "loopBound"} {:thread 1} p10$1 ==> _b5 ==> BV32_UGE($g1.0$1, $3$1);
    assert {:tag "loopBound"} {:thread 2} p10$2 ==> _b5 ==> BV32_UGE($g1.0$2, $3$2);
    assert {:tag "loopBound"} {:thread 1} p10$1 ==> _b4 ==> BV32_ULE($g1.0$1, $3$1);
    assert {:tag "loopBound"} {:thread 2} p10$2 ==> _b4 ==> BV32_ULE($g1.0$2, $3$2);
    assert {:tag "loopBound"} {:thread 1} p10$1 ==> _b3 ==> BV32_SGE($g1.0$1, $3$1);
    assert {:tag "loopBound"} {:thread 2} p10$2 ==> _b3 ==> BV32_SGE($g1.0$2, $3$2);
    assert {:tag "loopBound"} {:thread 1} p10$1 ==> _b2 ==> BV32_SLE($g1.0$1, $3$1);
    assert {:tag "loopBound"} {:thread 2} p10$2 ==> _b2 ==> BV32_SLE($g1.0$2, $3$2);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p10$1 ==> _b1 ==> BV32_SUB($g1.0$1, $3$1) == BV32_SUB($g1.0$2, $3$2);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p10$2 ==> _b1 ==> BV32_SUB($g1.0$2, $3$2) == BV32_SUB($g1.0$1, $3$1);
    assert {:tag "guardNonNeg"} {:thread 1} p10$1 ==> _b0 ==> BV32_SLE(0bv32, $g1.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p10$2 ==> _b0 ==> BV32_SLE(0bv32, $g1.0$2);
    assert {:block_sourceloc} {:sourceloc_num 20} p10$1 ==> true;
    v10$1 := (if p10$1 then BV32_SLT($g1.0$1, BV32_SDIV(BV32_MUL(2bv32, $h0), 5bv32)) else v10$1);
    v10$2 := (if p10$2 then BV32_SLT($g1.0$2, BV32_SDIV(BV32_MUL(2bv32, $h0), 5bv32)) else v10$2);
    p11$1 := false;
    p11$2 := false;
    p12$1 := false;
    p12$2 := false;
    p54$1 := false;
    p54$2 := false;
    p11$1 := (if p10$1 && v10$1 then v10$1 else p11$1);
    p11$2 := (if p10$2 && v10$2 then v10$2 else p11$2);
    p10$1 := (if p10$1 && !v10$1 then v10$1 else p10$1);
    p10$2 := (if p10$2 && !v10$2 then v10$2 else p10$2);
    $g3.0$1 := (if p11$1 then BV32_MUL(32bv32, group_id_y$1) else $g3.0$1);
    $g3.0$2 := (if p11$2 then BV32_MUL(32bv32, group_id_y$2) else $g3.0$2);
    p12$1 := (if p11$1 then true else p12$1);
    p12$2 := (if p11$2 then true else p12$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto __partitioned_block_$20_0;

  __partitioned_block_$20_0:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "nowrite"} _b94 ==> !_WRITE_HAS_OCCURRED_$$A;
    assert {:tag "noread"} _b93 ==> !_READ_HAS_OCCURRED_$$A;
    assert {:tag "predicatedEquality"} _b92 ==> p12$1 && p12$2 ==> v43$1 == v43$2;
    assert {:tag "predicatedEquality"} _b91 ==> p12$1 && p12$2 ==> v42$1 == v42$2;
    assert {:tag "predicatedEquality"} _b90 ==> p12$1 && p12$2 ==> v41$1 == v41$2;
    assert {:tag "predicatedEquality"} _b89 ==> p12$1 && p12$2 ==> v40$1 == v40$2;
    assert {:tag "predicatedEquality"} _b88 ==> p12$1 && p12$2 ==> v39$1 == v39$2;
    assert {:tag "predicatedEquality"} _b87 ==> p12$1 && p12$2 ==> v38$1 == v38$2;
    assert {:tag "predicatedEquality"} _b86 ==> p12$1 && p12$2 ==> v37$1 == v37$2;
    assert {:tag "predicatedEquality"} _b85 ==> p12$1 && p12$2 ==> v36$1 == v36$2;
    assert {:tag "predicatedEquality"} _b84 ==> p12$1 && p12$2 ==> v35$1 == v35$2;
    assert {:tag "predicatedEquality"} _b83 ==> p12$1 && p12$2 ==> v34$1 == v34$2;
    assert {:tag "predicatedEquality"} _b82 ==> p12$1 && p12$2 ==> v33$1 == v33$2;
    assert {:tag "predicatedEquality"} _b81 ==> p12$1 && p12$2 ==> v32$1 == v32$2;
    assert {:tag "predicatedEquality"} _b80 ==> p12$1 && p12$2 ==> v31$1 == v31$2;
    assert {:tag "predicatedEquality"} _b79 ==> p12$1 && p12$2 ==> v30$1 == v30$2;
    assert {:tag "predicatedEquality"} _b78 ==> p12$1 && p12$2 ==> v29$1 == v29$2;
    assert {:tag "predicatedEquality"} _b77 ==> p12$1 && p12$2 ==> v28$1 == v28$2;
    assert {:tag "predicatedEquality"} _b76 ==> p12$1 && p12$2 ==> v27$1 == v27$2;
    assert {:tag "predicatedEquality"} _b75 ==> p12$1 && p12$2 ==> v26$1 == v26$2;
    assert {:tag "predicatedEquality"} _b74 ==> p12$1 && p12$2 ==> v25$1 == v25$2;
    assert {:tag "predicatedEquality"} _b73 ==> p12$1 && p12$2 ==> v24$1 == v24$2;
    assert {:tag "predicatedEquality"} _b72 ==> p12$1 && p12$2 ==> v23$1 == v23$2;
    assert {:tag "predicatedEquality"} _b71 ==> p12$1 && p12$2 ==> v22$1 == v22$2;
    assert {:tag "predicatedEquality"} _b70 ==> p12$1 && p12$2 ==> v21$1 == v21$2;
    assert {:tag "predicatedEquality"} _b69 ==> p12$1 && p12$2 ==> v20$1 == v20$2;
    assert {:tag "predicatedEquality"} _b68 ==> p12$1 && p12$2 ==> v19$1 == v19$2;
    assert {:tag "predicatedEquality"} _b67 ==> p12$1 && p12$2 ==> v18$1 == v18$2;
    assert {:tag "predicatedEquality"} _b66 ==> p12$1 && p12$2 ==> v17$1 == v17$2;
    assert {:tag "predicatedEquality"} _b65 ==> p12$1 && p12$2 ==> v16$1 == v16$2;
    assert {:tag "predicatedEquality"} _b64 ==> p12$1 && p12$2 ==> v15$1 == v15$2;
    assert {:tag "predicatedEquality"} _b63 ==> p12$1 && p12$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b62 ==> p12$1 && p12$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b61 ==> p12$1 && p12$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b60 ==> p12$1 && p12$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b59 ==> p12$1 && p12$2 ==> $g3.0$1 == $g3.0$2;
    assert {:tag "loopPredicateEquality"} _b58 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p12$1 == p12$2;
    assert {:tag "loopPredicateEquality"} _b57 ==> p12$1 == p12$2;
    assert p12$1 ==> p10$1;
    assert p12$2 ==> p10$2;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p12$1 ==> _b16 ==> p12$1 ==> BV32_SGE(BV32_MUL(5bv32, $nj), BV32_ADD($h0, 5bv32)) && BV32_SGE($h0, 5bv32) && BV32_SLT($g1.0$1, BV32_SDIV(BV32_MUL(2bv32, $h0), 5bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p12$2 ==> _b16 ==> p12$2 ==> BV32_SGE(BV32_MUL(5bv32, $nj), BV32_ADD($h0, 5bv32)) && BV32_SGE($h0, 5bv32) && BV32_SLT($g1.0$2, BV32_SDIV(BV32_MUL(2bv32, $h0), 5bv32));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b15 ==> BV32_SGE(BV32_MUL(5bv32, $nj), BV32_ADD($h0, 5bv32)) && BV32_SGE($h0, 5bv32) && BV32_SLT($g1.0$1, BV32_SDIV(BV32_MUL(2bv32, $h0), 5bv32)) && BV32_SLT($g3.0$1, $ni) ==> p12$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b15 ==> BV32_SGE(BV32_MUL(5bv32, $nj), BV32_ADD($h0, 5bv32)) && BV32_SGE($h0, 5bv32) && BV32_SLT($g1.0$2, BV32_SDIV(BV32_MUL(2bv32, $h0), 5bv32)) && BV32_SLT($g3.0$2, $ni) ==> p12$2;
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b14 ==> BV32_UGE($g3.0$1, BV32_MUL(32bv32, group_id_y$1));
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b14 ==> BV32_UGE($g3.0$2, BV32_MUL(32bv32, group_id_y$2));
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b13 ==> BV32_ULE($g3.0$1, BV32_MUL(32bv32, group_id_y$1));
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b13 ==> BV32_ULE($g3.0$2, BV32_MUL(32bv32, group_id_y$2));
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b12 ==> BV32_SGE($g3.0$1, BV32_MUL(32bv32, group_id_y$1));
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b12 ==> BV32_SGE($g3.0$2, BV32_MUL(32bv32, group_id_y$2));
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b11 ==> BV32_SLE($g3.0$1, BV32_MUL(32bv32, group_id_y$1));
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b11 ==> BV32_SLE($g3.0$2, BV32_MUL(32bv32, group_id_y$2));
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p12$1 ==> _b10 ==> BV32_SUB($g3.0$1, BV32_MUL(32bv32, group_id_y$1)) == BV32_SUB($g3.0$2, BV32_MUL(32bv32, group_id_y$2));
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p12$2 ==> _b10 ==> BV32_SUB($g3.0$2, BV32_MUL(32bv32, group_id_y$2)) == BV32_SUB($g3.0$1, BV32_MUL(32bv32, group_id_y$1));
    assert {:tag "guardNonNeg"} {:thread 1} p12$1 ==> _b9 ==> BV32_SLE(0bv32, $g3.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p12$2 ==> _b9 ==> BV32_SLE(0bv32, $g3.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p12$1 ==> _b8 ==> BV32_AND(BV32_SUB(8192bv32, 1bv32), $g3.0$1) == BV32_AND(BV32_SUB(8192bv32, 1bv32), BV32_MUL(32bv32, group_id_y$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p12$2 ==> _b8 ==> BV32_AND(BV32_SUB(8192bv32, 1bv32), $g3.0$2) == BV32_AND(BV32_SUB(8192bv32, 1bv32), BV32_MUL(32bv32, group_id_y$2));
    assert {:block_sourceloc} {:sourceloc_num 22} p12$1 ==> true;
    v11$1 := (if p12$1 then BV32_SLT($g3.0$1, $ni) else v11$1);
    v11$2 := (if p12$2 then BV32_SLT($g3.0$2, $ni) else v11$2);
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
    p39$1 := false;
    p39$2 := false;
    p40$1 := false;
    p40$2 := false;
    p41$1 := false;
    p41$2 := false;
    p42$1 := false;
    p42$2 := false;
    p43$1 := false;
    p43$2 := false;
    p44$1 := false;
    p44$2 := false;
    p45$1 := false;
    p45$2 := false;
    p46$1 := false;
    p46$2 := false;
    p47$1 := false;
    p47$2 := false;
    p48$1 := false;
    p48$2 := false;
    p49$1 := false;
    p49$2 := false;
    p50$1 := false;
    p50$2 := false;
    p51$1 := false;
    p51$2 := false;
    p52$1 := false;
    p52$2 := false;
    p53$1 := false;
    p53$2 := false;
    p13$1 := (if p12$1 && v11$1 then v11$1 else p13$1);
    p13$2 := (if p12$2 && v11$2 then v11$2 else p13$2);
    p12$1 := (if p12$1 && !v11$1 then v11$1 else p12$1);
    p12$2 := (if p12$2 && !v11$2 then v11$2 else p12$2);
    v12$1 := (if p13$1 then BV32_SGE(BV32_MUL(2bv32, $h0), BV32_ADD(BV32_ADD(BV32_MUL(5bv32, v1$1), BV32_MUL(5bv32, $g1.0$1)), 5bv32)) else v12$1);
    v12$2 := (if p13$2 then BV32_SGE(BV32_MUL(2bv32, $h0), BV32_ADD(BV32_ADD(BV32_MUL(5bv32, v1$2), BV32_MUL(5bv32, $g1.0$2)), 5bv32)) else v12$2);
    p15$1 := (if p13$1 && v12$1 then v12$1 else p15$1);
    p15$2 := (if p13$2 && v12$2 then v12$2 else p15$2);
    v13$1 := (if p15$1 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 1bv32)) else v13$1);
    v13$2 := (if p15$2 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 1bv32)) else v13$2);
    p17$1 := (if p15$1 && v13$1 then v13$1 else p17$1);
    p17$2 := (if p15$2 && v13$2 then v13$2 else p17$2);
    v14$1 := (if p17$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, v1$1)), BV32_MUL(2bv32, $g1.0$1)), 1bv32), $h0) else v14$1);
    v14$2 := (if p17$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, v1$2)), BV32_MUL(2bv32, $g1.0$2)), 1bv32), $h0) else v14$2);
    p19$1 := (if p17$1 && v14$1 then v14$1 else p19$1);
    p19$2 := (if p17$2 && v14$2 then v14$2 else p19$2);
    v15$1 := (if p19$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_MUL(3bv32, v1$1), BV32_MUL(3bv32, $g1.0$1)), 2bv32), $h0) else v15$1);
    v15$2 := (if p19$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_MUL(3bv32, v1$2), BV32_MUL(3bv32, $g1.0$2)), 2bv32), $h0) else v15$2);
    p21$1 := (if p19$1 && v15$1 then v15$1 else p21$1);
    p21$2 := (if p19$2 && v15$2 then v15$2 else p21$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v16$1 := (if p21$1 then _HAVOC_bv64$1 else v16$1);
    v16$2 := (if p21$2 then _HAVOC_bv64$2 else v16$2);
    $$private_Q$0bv32$1 := (if p21$1 then v16$1 else $$private_Q$0bv32$1);
    $$private_Q$0bv32$2 := (if p21$2 then v16$2 else $$private_Q$0bv32$2);
    v17$1 := (if p21$1 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 17bv32)) else v17$1);
    v17$2 := (if p21$2 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 17bv32)) else v17$2);
    p23$1 := (if p21$1 && v17$1 then v17$1 else p23$1);
    p23$2 := (if p21$2 && v17$2 then v17$2 else p23$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v18$1 := (if p23$1 then _HAVOC_bv64$1 else v18$1);
    v18$2 := (if p23$2 then _HAVOC_bv64$2 else v18$2);
    $$private_Q$1bv32$1 := (if p23$1 then v18$1 else $$private_Q$1bv32$1);
    $$private_Q$1bv32$2 := (if p23$2 then v18$2 else $$private_Q$1bv32$2);
    v19$1 := (if p13$1 then BV32_SGE(BV32_MUL(2bv32, $h0), BV32_ADD(BV32_ADD(BV32_MUL(5bv32, v1$1), BV32_MUL(5bv32, $g1.0$1)), 5bv32)) else v19$1);
    v19$2 := (if p13$2 then BV32_SGE(BV32_MUL(2bv32, $h0), BV32_ADD(BV32_ADD(BV32_MUL(5bv32, v1$2), BV32_MUL(5bv32, $g1.0$2)), 5bv32)) else v19$2);
    p25$1 := (if p13$1 && v19$1 then v19$1 else p25$1);
    p25$2 := (if p13$2 && v19$2 then v19$2 else p25$2);
    v20$1 := (if p25$1 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 1bv32)) else v20$1);
    v20$2 := (if p25$2 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 1bv32)) else v20$2);
    p27$1 := (if p25$1 && v20$1 then v20$1 else p27$1);
    p27$2 := (if p25$2 && v20$2 then v20$2 else p27$2);
    v21$1 := (if p27$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, v1$1)), BV32_MUL(2bv32, $g1.0$1)), 1bv32), $h0) else v21$1);
    v21$2 := (if p27$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, v1$2)), BV32_MUL(2bv32, $g1.0$2)), 1bv32), $h0) else v21$2);
    p29$1 := (if p27$1 && v21$1 then v21$1 else p29$1);
    p29$2 := (if p27$2 && v21$2 then v21$2 else p29$2);
    v22$1 := (if p29$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_MUL(3bv32, v1$1), BV32_MUL(3bv32, $g1.0$1)), 2bv32), $h0) else v22$1);
    v22$2 := (if p29$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_MUL(3bv32, v1$2), BV32_MUL(3bv32, $g1.0$2)), 2bv32), $h0) else v22$2);
    p31$1 := (if p29$1 && v22$1 then v22$1 else p31$1);
    p31$2 := (if p29$2 && v22$2 then v22$2 else p31$2);
    call {:sourceloc} {:sourceloc_num 39} _LOG_READ_$$A(p31$1, BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g3.0$1), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 2bv32)), $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g3.0$1), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 39} _CHECK_READ_$$A(p31$2, BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g3.0$2), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 2bv32)), $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g3.0$2), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$A"} true;
    v23$1 := (if p31$1 then $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g3.0$1), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 2bv32))] else v23$1);
    v23$2 := (if p31$2 then $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g3.0$2), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 2bv32))] else v23$2);
    $$private_A$0bv32$1 := (if p31$1 then v23$1 else $$private_A$0bv32$1);
    $$private_A$0bv32$2 := (if p31$2 then v23$2 else $$private_A$0bv32$2);
    v24$1 := (if p31$1 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 17bv32)) else v24$1);
    v24$2 := (if p31$2 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 17bv32)) else v24$2);
    p33$1 := (if p31$1 && v24$1 then v24$1 else p33$1);
    p33$2 := (if p31$2 && v24$2 then v24$2 else p33$2);
    call {:sourceloc} {:sourceloc_num 42} _LOG_READ_$$A(p33$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 2bv32)), $$A[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 42} _CHECK_READ_$$A(p33$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 2bv32)), $$A[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$A"} true;
    v25$1 := (if p33$1 then $$A[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 2bv32))] else v25$1);
    v25$2 := (if p33$2 then $$A[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 2bv32))] else v25$2);
    $$private_A$1bv32$1 := (if p33$1 then v25$1 else $$private_A$1bv32$1);
    $$private_A$1bv32$2 := (if p33$2 then v25$2 else $$private_A$1bv32$2);
    v26$1 := (if p13$1 then BV32_SGE(BV32_MUL(2bv32, $h0), BV32_ADD(BV32_ADD(BV32_MUL(5bv32, v1$1), BV32_MUL(5bv32, $g1.0$1)), 5bv32)) else v26$1);
    v26$2 := (if p13$2 then BV32_SGE(BV32_MUL(2bv32, $h0), BV32_ADD(BV32_ADD(BV32_MUL(5bv32, v1$2), BV32_MUL(5bv32, $g1.0$2)), 5bv32)) else v26$2);
    p35$1 := (if p13$1 && v26$1 then v26$1 else p35$1);
    p35$2 := (if p13$2 && v26$2 then v26$2 else p35$2);
    v27$1 := (if p35$1 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 1bv32)) else v27$1);
    v27$2 := (if p35$2 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 1bv32)) else v27$2);
    p37$1 := (if p35$1 && v27$1 then v27$1 else p37$1);
    p37$2 := (if p35$2 && v27$2 then v27$2 else p37$2);
    v28$1 := (if p37$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, v1$1)), BV32_MUL(2bv32, $g1.0$1)), 1bv32), $h0) else v28$1);
    v28$2 := (if p37$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, v1$2)), BV32_MUL(2bv32, $g1.0$2)), 1bv32), $h0) else v28$2);
    p39$1 := (if p37$1 && v28$1 then v28$1 else p39$1);
    p39$2 := (if p37$2 && v28$2 then v28$2 else p39$2);
    v29$1 := (if p39$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_MUL(3bv32, v1$1), BV32_MUL(3bv32, $g1.0$1)), 2bv32), $h0) else v29$1);
    v29$2 := (if p39$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_MUL(3bv32, v1$2), BV32_MUL(3bv32, $g1.0$2)), 2bv32), $h0) else v29$2);
    p41$1 := (if p39$1 && v29$1 then v29$1 else p41$1);
    p41$2 := (if p39$2 && v29$2 then v29$2 else p41$2);
    v30$1 := (if p41$1 then $$private_A$0bv32$1 else v30$1);
    v30$2 := (if p41$2 then $$private_A$0bv32$2 else v30$2);
    v31$1 := (if p41$1 then $$private_Q$0bv32$1 else v31$1);
    v31$2 := (if p41$2 then $$private_Q$0bv32$2 else v31$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v32$1 := (if p41$1 then _HAVOC_bv64$1 else v32$1);
    v32$2 := (if p41$2 then _HAVOC_bv64$2 else v32$2);
    $$private_A$0bv32$1 := (if p41$1 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v31$1), v32$1), v30$1) else $$private_A$0bv32$1);
    $$private_A$0bv32$2 := (if p41$2 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v31$2), v32$2), v30$2) else $$private_A$0bv32$2);
    v33$1 := (if p41$1 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 17bv32)) else v33$1);
    v33$2 := (if p41$2 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 17bv32)) else v33$2);
    p43$1 := (if p41$1 && v33$1 then v33$1 else p43$1);
    p43$2 := (if p41$2 && v33$2 then v33$2 else p43$2);
    v34$1 := (if p43$1 then $$private_A$1bv32$1 else v34$1);
    v34$2 := (if p43$2 then $$private_A$1bv32$2 else v34$2);
    v35$1 := (if p43$1 then $$private_Q$1bv32$1 else v35$1);
    v35$2 := (if p43$2 then $$private_Q$1bv32$2 else v35$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v36$1 := (if p43$1 then _HAVOC_bv64$1 else v36$1);
    v36$2 := (if p43$2 then _HAVOC_bv64$2 else v36$2);
    $$private_A$1bv32$1 := (if p43$1 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v35$1), v36$1), v34$1) else $$private_A$1bv32$1);
    $$private_A$1bv32$2 := (if p43$2 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v35$2), v36$2), v34$2) else $$private_A$1bv32$2);
    goto __partitioned_block_$20_1;

  __partitioned_block_$20_1:
    call {:sourceloc_num 61} $bugle_barrier_duplicated_0(1bv1, 1bv1, p13$1, p13$2);
    v37$1 := (if p13$1 then BV32_SGE(BV32_MUL(2bv32, $h0), BV32_ADD(BV32_ADD(BV32_MUL(5bv32, v1$1), BV32_MUL(5bv32, $g1.0$1)), 5bv32)) else v37$1);
    v37$2 := (if p13$2 then BV32_SGE(BV32_MUL(2bv32, $h0), BV32_ADD(BV32_ADD(BV32_MUL(5bv32, v1$2), BV32_MUL(5bv32, $g1.0$2)), 5bv32)) else v37$2);
    p45$1 := (if p13$1 && v37$1 then v37$1 else p45$1);
    p45$2 := (if p13$2 && v37$2 then v37$2 else p45$2);
    v38$1 := (if p45$1 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 1bv32)) else v38$1);
    v38$2 := (if p45$2 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 1bv32)) else v38$2);
    p47$1 := (if p45$1 && v38$1 then v38$1 else p47$1);
    p47$2 := (if p45$2 && v38$2 then v38$2 else p47$2);
    v39$1 := (if p47$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, v1$1)), BV32_MUL(2bv32, $g1.0$1)), 1bv32), $h0) else v39$1);
    v39$2 := (if p47$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, v1$2)), BV32_MUL(2bv32, $g1.0$2)), 1bv32), $h0) else v39$2);
    p49$1 := (if p47$1 && v39$1 then v39$1 else p49$1);
    p49$2 := (if p47$2 && v39$2 then v39$2 else p49$2);
    v40$1 := (if p49$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_MUL(3bv32, v1$1), BV32_MUL(3bv32, $g1.0$1)), 2bv32), $h0) else v40$1);
    v40$2 := (if p49$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_MUL(3bv32, v1$2), BV32_MUL(3bv32, $g1.0$2)), 2bv32), $h0) else v40$2);
    p51$1 := (if p49$1 && v40$1 then v40$1 else p51$1);
    p51$2 := (if p49$2 && v40$2 then v40$2 else p51$2);
    v41$1 := (if p51$1 then $$private_A$0bv32$1 else v41$1);
    v41$2 := (if p51$2 then $$private_A$0bv32$2 else v41$2);
    call {:sourceloc} {:sourceloc_num 67} _LOG_WRITE_$$A(p51$1, BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g3.0$1), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 2bv32)), v41$1, $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g3.0$1), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 2bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$A(p51$2, BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g3.0$2), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 2bv32)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 67} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 67} _CHECK_WRITE_$$A(p51$2, BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g3.0$2), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 2bv32)), v41$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$A"} true;
    $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g3.0$1), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 2bv32))] := (if p51$1 then v41$1 else $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g3.0$1), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 2bv32))]);
    $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g3.0$2), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 2bv32))] := (if p51$2 then v41$2 else $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g3.0$2), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 2bv32))]);
    v42$1 := (if p51$1 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 17bv32)) else v42$1);
    v42$2 := (if p51$2 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 17bv32)) else v42$2);
    p53$1 := (if p51$1 && v42$1 then v42$1 else p53$1);
    p53$2 := (if p51$2 && v42$2 then v42$2 else p53$2);
    v43$1 := (if p53$1 then $$private_A$1bv32$1 else v43$1);
    v43$2 := (if p53$2 then $$private_A$1bv32$2 else v43$2);
    call {:sourceloc} {:sourceloc_num 70} _LOG_WRITE_$$A(p53$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 2bv32)), v43$1, $$A[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 2bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$A(p53$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 2bv32)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 70} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 70} _CHECK_WRITE_$$A(p53$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 2bv32)), v43$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$A"} true;
    $$A[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 2bv32))] := (if p53$1 then v43$1 else $$A[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 2bv32))]);
    $$A[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 2bv32))] := (if p53$2 then v43$2 else $$A[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 2bv32))]);
    goto __partitioned_block_$20_2;

  __partitioned_block_$20_2:
    call {:sourceloc_num 73} $bugle_barrier_duplicated_1(1bv1, 1bv1, p13$1, p13$2);
    $g3.0$1 := (if p13$1 then BV32_ADD($g3.0$1, 8192bv32) else $g3.0$1);
    $g3.0$2 := (if p13$2 then BV32_ADD($g3.0$2, 8192bv32) else $g3.0$2);
    p12$1 := (if p13$1 then true else p12$1);
    p12$2 := (if p13$2 then true else p12$2);
    goto $20.backedge, $20.tail;

  $20.tail:
    assume !p12$1 && !p12$2;
    $g1.0$1 := (if p11$1 then BV32_ADD($g1.0$1, 8192bv32) else $g1.0$1);
    $g1.0$2 := (if p11$2 then BV32_ADD($g1.0$2, 8192bv32) else $g1.0$2);
    p10$1 := (if p11$1 then true else p10$1);
    p10$2 := (if p11$2 then true else p10$2);
    goto $18.backedge, $18.tail;

  $18.tail:
    assume !p10$1 && !p10$2;
    goto $54;

  $18.backedge:
    assume {:backedge} p10$1 || p10$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $18;

  $20.backedge:
    assume {:backedge} p12$1 || p12$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto __partitioned_block_$20_0;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$A, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$A, _TRACKING;



var $$private_A$0bv32$1: bv64;

var $$private_A$0bv32$2: bv64;

var $$private_A$1bv32$1: bv64;

var $$private_A$1bv32$2: bv64;

var $$private_Q$0bv32$1: bv64;

var $$private_Q$0bv32$2: bv64;

var $$private_Q$1bv32$1: bv64;

var $$private_Q$1bv32$2: bv64;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

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

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b8: bool;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

const {:existential true} _b11: bool;

const {:existential true} _b12: bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const _WATCHED_VALUE_$$A: bv64;

procedure {:inline 1} _LOG_READ_$$A(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$A;



implementation {:inline 1} _LOG_READ_$$A(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$A := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A == _value then true else _READ_HAS_OCCURRED_$$A);
    return;
}



procedure _CHECK_READ_$$A(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "A"} {:array "$$A"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$A);
  requires {:source_name "A"} {:array "$$A"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$A: bool;

procedure {:inline 1} _LOG_WRITE_$$A(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$A, _WRITE_READ_BENIGN_FLAG_$$A;



implementation {:inline 1} _LOG_WRITE_$$A(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$A := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A == _value then true else _WRITE_HAS_OCCURRED_$$A);
    _WRITE_READ_BENIGN_FLAG_$$A := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$A);
    return;
}



procedure _CHECK_WRITE_$$A(_P: bool, _offset: bv32, _value: bv64);
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



const _WATCHED_VALUE_$$Q: bv64;

procedure {:inline 1} _LOG_READ_$$Q(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$Q;



implementation {:inline 1} _LOG_READ_$$Q(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$Q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Q == _value then true else _READ_HAS_OCCURRED_$$Q);
    return;
}



procedure _CHECK_READ_$$Q(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "Q"} {:array "$$Q"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$Q && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$Q);
  requires {:source_name "Q"} {:array "$$Q"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$Q && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$Q: bool;

procedure {:inline 1} _LOG_WRITE_$$Q(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$Q, _WRITE_READ_BENIGN_FLAG_$$Q;



implementation {:inline 1} _LOG_WRITE_$$Q(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$Q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Q == _value then true else _WRITE_HAS_OCCURRED_$$Q);
    _WRITE_READ_BENIGN_FLAG_$$Q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Q == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$Q);
    return;
}



procedure _CHECK_WRITE_$$Q(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "Q"} {:array "$$Q"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$Q && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Q != _value);
  requires {:source_name "Q"} {:array "$$Q"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$Q && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Q != _value);
  requires {:source_name "Q"} {:array "$$Q"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$Q && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$Q(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$Q;



implementation {:inline 1} _LOG_ATOMIC_$$Q(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$Q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$Q);
    return;
}



procedure _CHECK_ATOMIC_$$Q(_P: bool, _offset: bv32);
  requires {:source_name "Q"} {:array "$$Q"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$Q && _WATCHED_OFFSET == _offset);
  requires {:source_name "Q"} {:array "$$Q"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$Q && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Q(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$Q;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Q(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$Q := (if _P && _WRITE_HAS_OCCURRED_$$Q && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$Q);
    return;
}



const _WATCHED_VALUE_$$R: bv64;

procedure {:inline 1} _LOG_READ_$$R(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$R;



implementation {:inline 1} _LOG_READ_$$R(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$R := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$R == _value then true else _READ_HAS_OCCURRED_$$R);
    return;
}



procedure _CHECK_READ_$$R(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "R"} {:array "$$R"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$R && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$R);
  requires {:source_name "R"} {:array "$$R"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$R && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$R: bool;

procedure {:inline 1} _LOG_WRITE_$$R(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$R, _WRITE_READ_BENIGN_FLAG_$$R;



implementation {:inline 1} _LOG_WRITE_$$R(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$R := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$R == _value then true else _WRITE_HAS_OCCURRED_$$R);
    _WRITE_READ_BENIGN_FLAG_$$R := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$R == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$R);
    return;
}



procedure _CHECK_WRITE_$$R(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "R"} {:array "$$R"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$R && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$R != _value);
  requires {:source_name "R"} {:array "$$R"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$R && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$R != _value);
  requires {:source_name "R"} {:array "$$R"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$R && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$R(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$R;



implementation {:inline 1} _LOG_ATOMIC_$$R(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$R := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$R);
    return;
}



procedure _CHECK_ATOMIC_$$R(_P: bool, _offset: bv32);
  requires {:source_name "R"} {:array "$$R"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$R && _WATCHED_OFFSET == _offset);
  requires {:source_name "R"} {:array "$$R"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$R && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$R(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$R;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$R(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$R := (if _P && _WRITE_HAS_OCCURRED_$$R && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$R);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon4_Then, anon4_Else;

  anon4_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$A;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$A;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$A;
    goto anon1;

  anon1:
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon3;

  anon3:
    havoc _TRACKING;
    return;

  anon5_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$A;
    goto anon3;

  anon4_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon4_Then, anon4_Else;

  anon4_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$A;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$A;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$A;
    goto anon1;

  anon1:
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon3;

  anon3:
    havoc _TRACKING;
    return;

  anon5_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$A;
    goto anon3;

  anon4_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



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

const {:existential true} _b90: bool;

const {:existential true} _b91: bool;

const {:existential true} _b92: bool;

const {:existential true} _b93: bool;

const {:existential true} _b94: bool;
