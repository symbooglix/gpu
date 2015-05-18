type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



axiom {:array_info "$$A"} {:global} {:elem_width 64} {:source_name "A"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$A: bool;

axiom {:array_info "$$Q"} {:global} {:elem_width 64} {:source_name "Q"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Q: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Q: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Q: bool;

var {:source_name "R"} {:global} $$R: [bv32]bv64;

axiom {:array_info "$$R"} {:global} {:elem_width 64} {:source_name "R"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$R: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$R: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$R: bool;

axiom {:array_info "$$private_R"} {:elem_width 64} {:source_name "private_R"} {:source_elem_width 64} {:source_dimensions "1,1"} true;

var {:source_name "shared_A"} {:group_shared} $$kernel6.shared_A: [bv1][bv32]bv64;

axiom {:array_info "$$kernel6.shared_A"} {:group_shared} {:elem_width 64} {:source_name "shared_A"} {:source_elem_width 64} {:source_dimensions "32,32"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _READ_HAS_OCCURRED_$$kernel6.shared_A: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _WRITE_HAS_OCCURRED_$$kernel6.shared_A: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _ATOMIC_HAS_OCCURRED_$$kernel6.shared_A: bool;

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

function FADD64(bv64, bv64) : bv64;

function FMUL64(bv64, bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel6"} {:kernel} $kernel6($nj: bv32, $ni: bv32, $h0: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $nj == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $ni == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$A && !_WRITE_HAS_OCCURRED_$$A && !_ATOMIC_HAS_OCCURRED_$$A;
  requires !_READ_HAS_OCCURRED_$$Q && !_WRITE_HAS_OCCURRED_$$Q && !_ATOMIC_HAS_OCCURRED_$$Q;
  requires !_READ_HAS_OCCURRED_$$R && !_WRITE_HAS_OCCURRED_$$R && !_ATOMIC_HAS_OCCURRED_$$R;
  requires !_READ_HAS_OCCURRED_$$kernel6.shared_A && !_WRITE_HAS_OCCURRED_$$kernel6.shared_A && !_ATOMIC_HAS_OCCURRED_$$kernel6.shared_A;
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
  modifies $$kernel6.shared_A, _READ_HAS_OCCURRED_$$R, _WRITE_HAS_OCCURRED_$$kernel6.shared_A, _WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A, _WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A, $$R, _TRACKING, _READ_HAS_OCCURRED_$$kernel6.shared_A, _TRACKING, _WRITE_HAS_OCCURRED_$$R, _WRITE_READ_BENIGN_FLAG_$$R, _WRITE_READ_BENIGN_FLAG_$$R, _TRACKING;



implementation {:source_name "kernel6"} {:kernel} $kernel6($nj: bv32, $ni: bv32, $h0: bv32)
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
  var $g5.0$1: bv32;
  var $g5.0$2: bv32;
  var $c0.0$1: bv32;
  var $c0.0$2: bv32;
  var $5$1: bv32;
  var $5$2: bv32;
  var $c2.0$1: bv32;
  var $c2.0$2: bv32;
  var $6$1: bv32;
  var $6$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bool;
  var v3: bool;
  var v4$1: bool;
  var v4$2: bool;
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
  var v13$1: bv64;
  var v13$2: bv64;
  var v14$1: bool;
  var v14$2: bool;
  var v15$1: bool;
  var v15$2: bool;
  var v16$1: bool;
  var v16$2: bool;
  var v17$1: bool;
  var v17$2: bool;
  var v18$1: bool;
  var v18$2: bool;
  var v19$1: bool;
  var v19$2: bool;
  var v20$1: bool;
  var v20$2: bool;
  var v21$1: bool;
  var v21$2: bool;
  var v22$1: bool;
  var v22$2: bool;
  var v23$1: bool;
  var v23$2: bool;
  var v24$1: bool;
  var v24$2: bool;
  var v25$1: bool;
  var v25$2: bool;
  var v26$1: bool;
  var v26$2: bool;
  var v27$1: bool;
  var v27$2: bool;
  var v28$1: bool;
  var v28$2: bool;
  var v29$1: bv64;
  var v29$2: bv64;
  var v30$1: bool;
  var v30$2: bool;
  var v31$1: bool;
  var v31$2: bool;
  var v32$1: bool;
  var v32$2: bool;
  var v33$1: bool;
  var v33$2: bool;
  var v34$1: bool;
  var v34$2: bool;
  var v35$1: bv64;
  var v35$2: bv64;
  var v36$1: bv64;
  var v36$2: bv64;
  var v37$1: bv64;
  var v37$2: bv64;
  var v38$1: bool;
  var v38$2: bool;
  var v39$1: bool;
  var v39$2: bool;
  var v40$1: bool;
  var v40$2: bool;
  var v41$1: bv64;
  var v41$2: bv64;
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
  var p55$1: bool;
  var p55$2: bool;
  var p56$1: bool;
  var p56$2: bool;
  var p57$1: bool;
  var p57$2: bool;
  var p58$1: bool;
  var p58$2: bool;
  var p59$1: bool;
  var p59$2: bool;
  var p60$1: bool;
  var p60$2: bool;
  var p61$1: bool;
  var p61$2: bool;
  var p62$1: bool;
  var p62$2: bool;
  var p63$1: bool;
  var p63$2: bool;
  var p64$1: bool;
  var p64$2: bool;
  var p65$1: bool;
  var p65$2: bool;
  var p66$1: bool;
  var p66$2: bool;
  var p67$1: bool;
  var p67$2: bool;
  var _HAVOC_bv64$1: bv64;
  var _HAVOC_bv64$2: bv64;


  $0:
    v0$1 := group_id_x$1;
    v0$2 := group_id_x$2;
    v1$1 := local_id_x$1;
    v1$2 := local_id_x$2;
    v2 := BV32_SGE(BV32_MUL(5bv32, $nj), BV32_ADD($h0, 6bv32));
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
    assume {:partition} !v2 && !v2;
    goto $65;

  $65:
    return;

  $truebb:
    assume {:partition} v2 && v2;
    v3 := BV32_SGE($h0, 4bv32);
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v3 && !v3;
    goto $65;

  $truebb0:
    assume {:partition} v3 && v3;
    v4$1 := BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$1)), $h0), 63bv32), 0bv32);
    v4$2 := BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$2)), $h0), 63bv32), 0bv32);
    p0$1 := (if v4$1 then v4$1 else p0$1);
    p0$2 := (if v4$2 then v4$2 else p0$2);
    p1$1 := (if !v4$1 then !v4$1 else p1$1);
    p1$2 := (if !v4$2 then !v4$2 else p1$2);
    $0$1 := (if p0$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$1)), $h0), 63bv32)), 2097152bv32), 1bv32), 2097152bv32)) else $0$1);
    $0$2 := (if p0$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$2)), $h0), 63bv32)), 2097152bv32), 1bv32), 2097152bv32)) else $0$2);
    $0$1 := (if p1$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$1)), $h0), 63bv32), 2097152bv32) else $0$1);
    $0$2 := (if p1$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$2)), $h0), 63bv32), 2097152bv32) else $0$2);
    v5$1 := BV32_SLT(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$1), $h0), 95bv32), 0bv32);
    v5$2 := BV32_SLT(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$2), $h0), 95bv32), 0bv32);
    p2$1 := (if v5$1 then v5$1 else p2$1);
    p2$2 := (if v5$2 then v5$2 else p2$2);
    p3$1 := (if !v5$1 then !v5$1 else p3$1);
    p3$2 := (if !v5$2 then !v5$2 else p3$2);
    $1$1 := (if p2$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$1), $h0), 95bv32)), 3145728bv32), 1bv32), 3145728bv32)) else $1$1);
    $1$2 := (if p2$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$2), $h0), 95bv32)), 3145728bv32), 1bv32), 3145728bv32)) else $1$2);
    $1$1 := (if p3$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$1), $h0), 95bv32), 3145728bv32) else $1$1);
    $1$2 := (if p3$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$2), $h0), 95bv32), 3145728bv32) else $1$2);
    v6$1 := BV32_SGT(BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(1048576bv32, $0$1)), 1048576bv32), BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(1048576bv32, $1$1)), 1048576bv32));
    v6$2 := BV32_SGT(BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(1048576bv32, $0$2)), 1048576bv32), BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(1048576bv32, $1$2)), 1048576bv32));
    p4$1 := (if v6$1 then v6$1 else p4$1);
    p4$2 := (if v6$2 then v6$2 else p4$2);
    p7$1 := (if !v6$1 then !v6$1 else p7$1);
    p7$2 := (if !v6$2 then !v6$2 else p7$2);
    v7$1 := (if p4$1 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$1)), $h0), 63bv32), 0bv32) else v7$1);
    v7$2 := (if p4$2 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$2)), $h0), 63bv32), 0bv32) else v7$2);
    p5$1 := (if p4$1 && v7$1 then v7$1 else p5$1);
    p5$2 := (if p4$2 && v7$2 then v7$2 else p5$2);
    p6$1 := (if p4$1 && !v7$1 then !v7$1 else p6$1);
    p6$2 := (if p4$2 && !v7$2 then !v7$2 else p6$2);
    $2$1 := (if p5$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$1)), $h0), 63bv32)), 2097152bv32), 1bv32), 2097152bv32)) else $2$1);
    $2$2 := (if p5$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$2)), $h0), 63bv32)), 2097152bv32), 1bv32), 2097152bv32)) else $2$2);
    $2$1 := (if p6$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$1)), $h0), 63bv32), 2097152bv32) else $2$1);
    $2$2 := (if p6$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $nj), BV32_MUL(64bv32, v0$2)), $h0), 63bv32), 2097152bv32) else $2$2);
    $3$1 := (if p4$1 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(1048576bv32, $2$1)), 1048576bv32) else $3$1);
    $3$2 := (if p4$2 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(1048576bv32, $2$2)), 1048576bv32) else $3$2);
    v8$1 := (if p7$1 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$1), $h0), 95bv32), 0bv32) else v8$1);
    v8$2 := (if p7$2 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$2), $h0), 95bv32), 0bv32) else v8$2);
    p8$1 := (if p7$1 && v8$1 then v8$1 else p8$1);
    p8$2 := (if p7$2 && v8$2 then v8$2 else p8$2);
    p9$1 := (if p7$1 && !v8$1 then !v8$1 else p9$1);
    p9$2 := (if p7$2 && !v8$2 then !v8$2 else p9$2);
    $4$1 := (if p8$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$1), $h0), 95bv32)), 3145728bv32), 1bv32), 3145728bv32)) else $4$1);
    $4$2 := (if p8$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$2), $h0), 95bv32)), 3145728bv32), 1bv32), 3145728bv32)) else $4$2);
    $4$1 := (if p9$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$1), $h0), 95bv32), 3145728bv32) else $4$1);
    $4$2 := (if p9$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_MUL(4294967200bv32, v0$2), $h0), 95bv32), 3145728bv32) else $4$2);
    $3$1 := (if p7$1 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(1048576bv32, $4$1)), 1048576bv32) else $3$1);
    $3$2 := (if p7$2 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(1048576bv32, $4$2)), 1048576bv32) else $3$2);
    $g1.0$1 := $3$1;
    $g1.0$2 := $3$2;
    p10$1 := true;
    p10$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $18;

  $18:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 20} p10$1 ==> true;
    v9$1 := (if p10$1 then BV32_SLT($g1.0$1, BV32_SDIV(BV32_ADD(BV32_MUL(2bv32, $h0), 2bv32), 5bv32)) else v9$1);
    v9$2 := (if p10$2 then BV32_SLT($g1.0$2, BV32_SDIV(BV32_ADD(BV32_MUL(2bv32, $h0), 2bv32), 5bv32)) else v9$2);
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
    p67$1 := false;
    p67$2 := false;
    p11$1 := (if p10$1 && v9$1 then v9$1 else p11$1);
    p11$2 := (if p10$2 && v9$2 then v9$2 else p11$2);
    p10$1 := (if p10$1 && !v9$1 then v9$1 else p10$1);
    p10$2 := (if p10$2 && !v9$2 then v9$2 else p10$2);
    v10$1 := (if p11$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_MUL(3bv32, v1$1), BV32_MUL(3bv32, $g1.0$1)), 1bv32), $h0) else v10$1);
    v10$2 := (if p11$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_MUL(3bv32, v1$2), BV32_MUL(3bv32, $g1.0$2)), 1bv32), $h0) else v10$2);
    p13$1 := (if p11$1 && v10$1 then v10$1 else p13$1);
    p13$2 := (if p11$2 && v10$2 then v10$2 else p13$2);
    v11$1 := (if p13$1 then BV32_SGE(BV32_MUL(2bv32, $h0), BV32_ADD(BV32_ADD(BV32_MUL(5bv32, v1$1), BV32_MUL(5bv32, $g1.0$1)), 3bv32)) else v11$1);
    v11$2 := (if p13$2 then BV32_SGE(BV32_MUL(2bv32, $h0), BV32_ADD(BV32_ADD(BV32_MUL(5bv32, v1$2), BV32_MUL(5bv32, $g1.0$2)), 3bv32)) else v11$2);
    p15$1 := (if p13$1 && v11$1 then v11$1 else p15$1);
    p15$2 := (if p13$2 && v11$2 then v11$2 else p15$2);
    v12$1 := (if p15$1 then BV32_SGE(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, v1$1)), BV32_MUL(2bv32, $g1.0$1)), $h0) else v12$1);
    v12$2 := (if p15$2 then BV32_SGE(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, v1$2)), BV32_MUL(2bv32, $g1.0$2)), $h0) else v12$2);
    p17$1 := (if p15$1 && v12$1 then v12$1 else p17$1);
    p17$2 := (if p15$2 && v12$2 then v12$2 else p17$2);
    call {:sourceloc} {:sourceloc_num 25} _LOG_READ_$$R(p17$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(BV32_MUL(3bv32, v1$1), $h0), BV32_MUL(3bv32, $g1.0$1)), 1bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 1bv32)), $$R[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(BV32_MUL(3bv32, v1$1), $h0), BV32_MUL(3bv32, $g1.0$1)), 1bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 25} _CHECK_READ_$$R(p17$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(BV32_MUL(3bv32, v1$2), $h0), BV32_MUL(3bv32, $g1.0$2)), 1bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 1bv32)), $$R[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(BV32_MUL(3bv32, v1$2), $h0), BV32_MUL(3bv32, $g1.0$2)), 1bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$R"} true;
    v13$1 := (if p17$1 then $$R[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(BV32_MUL(3bv32, v1$1), $h0), BV32_MUL(3bv32, $g1.0$1)), 1bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 1bv32))] else v13$1);
    v13$2 := (if p17$2 then $$R[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(BV32_MUL(3bv32, v1$2), $h0), BV32_MUL(3bv32, $g1.0$2)), 1bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 1bv32))] else v13$2);
    $$private_R$0bv32$1 := (if p17$1 then v13$1 else $$private_R$0bv32$1);
    $$private_R$0bv32$2 := (if p17$2 then v13$2 else $$private_R$0bv32$2);
    $g5.0$1 := (if p11$1 then 0bv32 else $g5.0$1);
    $g5.0$2 := (if p11$2 then 0bv32 else $g5.0$2);
    p18$1 := (if p11$1 then true else p18$1);
    p18$2 := (if p11$2 then true else p18$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $24;

  $24:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p18$1 ==> p10$1;
    assert p18$2 ==> p10$2;
    assert {:block_sourceloc} {:sourceloc_num 28} p18$1 ==> true;
    v14$1 := (if p18$1 then BV32_SLT($g5.0$1, $ni) else v14$1);
    v14$2 := (if p18$2 then BV32_SLT($g5.0$2, $ni) else v14$2);
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
    p51$1 := false;
    p51$2 := false;
    p52$1 := false;
    p52$2 := false;
    p53$1 := false;
    p53$2 := false;
    p54$1 := false;
    p54$2 := false;
    p55$1 := false;
    p55$2 := false;
    p56$1 := false;
    p56$2 := false;
    p57$1 := false;
    p57$2 := false;
    p61$1 := false;
    p61$2 := false;
    p62$1 := false;
    p62$2 := false;
    p63$1 := false;
    p63$2 := false;
    p64$1 := false;
    p64$2 := false;
    p65$1 := false;
    p65$2 := false;
    p66$1 := false;
    p66$2 := false;
    p19$1 := (if p18$1 && v14$1 then v14$1 else p19$1);
    p19$2 := (if p18$2 && v14$2 then v14$2 else p19$2);
    p18$1 := (if p18$1 && !v14$1 then v14$1 else p18$1);
    p18$2 := (if p18$2 && !v14$2 then v14$2 else p18$2);
    v15$1 := (if p19$1 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, v1$1), $h0), BV32_ADD(BV32_MUL(2bv32, $g1.0$1), 63bv32)) else v15$1);
    v15$2 := (if p19$2 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, v1$2), $h0), BV32_ADD(BV32_MUL(2bv32, $g1.0$2), 63bv32)) else v15$2);
    p20$1 := (if p19$1 && v15$1 then v15$1 else p20$1);
    p20$2 := (if p19$2 && v15$2 then v15$2 else p20$2);
    p26$1 := (if p19$1 && !v15$1 then !v15$1 else p26$1);
    p26$2 := (if p19$2 && !v15$2 then !v15$2 else p26$2);
    v16$1 := (if p20$1 then BV32_SGE(BV32_MUL(3bv32, $g1.0$1), $h0) else v16$1);
    v16$2 := (if p20$2 then BV32_SGE(BV32_MUL(3bv32, $g1.0$2), $h0) else v16$2);
    p21$1 := (if p20$1 && v16$1 then v16$1 else p21$1);
    p21$2 := (if p20$2 && v16$2 then v16$2 else p21$2);
    p26$1 := (if p20$1 && !v16$1 then !v16$1 else p26$1);
    p26$2 := (if p20$2 && !v16$2 then !v16$2 else p26$2);
    v17$1 := (if p21$1 then BV32_SGE(BV32_MUL(3bv32, $nj), BV32_ADD($h0, 3bv32)) else v17$1);
    v17$2 := (if p21$2 then BV32_SGE(BV32_MUL(3bv32, $nj), BV32_ADD($h0, 3bv32)) else v17$2);
    p46$1 := (if p21$1 && v17$1 then v17$1 else p46$1);
    p46$2 := (if p21$2 && v17$2 then v17$2 else p46$2);
    p26$1 := (if p21$1 && !v17$1 then !v17$1 else p26$1);
    p26$2 := (if p21$2 && !v17$2 then !v17$2 else p26$2);
    p46$1 := (if p22$1 then true else p46$1);
    p46$2 := (if p22$2 then true else p46$2);
    p26$1 := (if p23$1 then true else p26$1);
    p26$2 := (if p23$2 then true else p26$2);
    p26$1 := (if p24$1 then true else p26$1);
    p26$2 := (if p24$2 then true else p26$2);
    p26$1 := (if p25$1 then true else p26$1);
    p26$2 := (if p25$2 then true else p26$2);
    v18$1 := (if p26$1 then BV32_SGE(BV32_ADD($h0, 2bv32), BV32_MUL(3bv32, $nj)) else v18$1);
    v18$2 := (if p26$2 then BV32_SGE(BV32_ADD($h0, 2bv32), BV32_MUL(3bv32, $nj)) else v18$2);
    p27$1 := (if p26$1 && v18$1 then v18$1 else p27$1);
    p27$2 := (if p26$2 && v18$2 then v18$2 else p27$2);
    p35$1 := (if p26$1 && !v18$1 then !v18$1 else p35$1);
    p35$2 := (if p26$2 && !v18$2 then !v18$2 else p35$2);
    v19$1 := (if p27$1 then BV32_SGE(BV32_MUL(5bv32, BV32_SDIV(BV32_ADD($nj, $h0), 2bv32)), BV32_ADD(BV32_MUL(3bv32, $h0), 3bv32)) else v19$1);
    v19$2 := (if p27$2 then BV32_SGE(BV32_MUL(5bv32, BV32_SDIV(BV32_ADD($nj, $h0), 2bv32)), BV32_ADD(BV32_MUL(3bv32, $h0), 3bv32)) else v19$2);
    p28$1 := (if p27$1 && v19$1 then v19$1 else p28$1);
    p28$2 := (if p27$2 && v19$2 then v19$2 else p28$2);
    p35$1 := (if p27$1 && !v19$1 then !v19$1 else p35$1);
    p35$2 := (if p27$2 && !v19$2 then !v19$2 else p35$2);
    v20$1 := (if p28$1 then BV32_SGE(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, $g1.0$1)), 62bv32), BV32_ADD(BV32_MUL(2bv32, v1$1), $h0)) else v20$1);
    v20$2 := (if p28$2 then BV32_SGE(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, $g1.0$2)), 62bv32), BV32_ADD(BV32_MUL(2bv32, v1$2), $h0)) else v20$2);
    p29$1 := (if p28$1 && v20$1 then v20$1 else p29$1);
    p29$2 := (if p28$2 && v20$2 then v20$2 else p29$2);
    p35$1 := (if p28$1 && !v20$1 then !v20$1 else p35$1);
    p35$2 := (if p28$2 && !v20$2 then !v20$2 else p35$2);
    v21$1 := (if p29$1 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, v1$1), $h0), BV32_ADD(BV32_MUL(2bv32, $g1.0$1), 63bv32)) else v21$1);
    v21$2 := (if p29$2 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, v1$2), $h0), BV32_ADD(BV32_MUL(2bv32, $g1.0$2), 63bv32)) else v21$2);
    p46$1 := (if p29$1 && v21$1 then v21$1 else p46$1);
    p46$2 := (if p29$2 && v21$2 then v21$2 else p46$2);
    p35$1 := (if p29$1 && !v21$1 then !v21$1 else p35$1);
    p35$2 := (if p29$2 && !v21$2 then !v21$2 else p35$2);
    p46$1 := (if p30$1 then true else p46$1);
    p46$2 := (if p30$2 then true else p46$2);
    p35$1 := (if p31$1 then true else p35$1);
    p35$2 := (if p31$2 then true else p35$2);
    p35$1 := (if p32$1 then true else p35$1);
    p35$2 := (if p32$2 then true else p35$2);
    p35$1 := (if p33$1 then true else p35$1);
    p35$2 := (if p33$2 then true else p35$2);
    p35$1 := (if p34$1 then true else p35$1);
    p35$2 := (if p34$2 then true else p35$2);
    v22$1 := (if p35$1 then BV32_SGE($h0, BV32_ADD(BV32_MUL(3bv32, $g1.0$1), 1bv32)) else v22$1);
    v22$2 := (if p35$2 then BV32_SGE($h0, BV32_ADD(BV32_MUL(3bv32, $g1.0$2), 1bv32)) else v22$2);
    p37$1 := (if p35$1 && v22$1 then v22$1 else p37$1);
    p37$2 := (if p35$2 && v22$2 then v22$2 else p37$2);
    v23$1 := (if p37$1 then BV32_SGE(BV32_MUL(3bv32, $nj), BV32_ADD($h0, 3bv32)) else v23$1);
    v23$2 := (if p37$2 then BV32_SGE(BV32_MUL(3bv32, $nj), BV32_ADD($h0, 3bv32)) else v23$2);
    p39$1 := (if p37$1 && v23$1 then v23$1 else p39$1);
    p39$2 := (if p37$2 && v23$2 then v23$2 else p39$2);
    v24$1 := (if p39$1 then BV32_SGE(BV32_MUL(5bv32, BV32_SDIV(BV32_ADD(BV32_MUL(2bv32, $h0), 1bv32), 3bv32)), BV32_ADD(BV32_MUL(3bv32, $h0), 3bv32)) else v24$1);
    v24$2 := (if p39$2 then BV32_SGE(BV32_MUL(5bv32, BV32_SDIV(BV32_ADD(BV32_MUL(2bv32, $h0), 1bv32), 3bv32)), BV32_ADD(BV32_MUL(3bv32, $h0), 3bv32)) else v24$2);
    p41$1 := (if p39$1 && v24$1 then v24$1 else p41$1);
    p41$2 := (if p39$2 && v24$2 then v24$2 else p41$2);
    v25$1 := (if p41$1 then BV32_SGE(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, $g1.0$1)), 62bv32), BV32_ADD(BV32_MUL(2bv32, v1$1), $h0)) else v25$1);
    v25$2 := (if p41$2 then BV32_SGE(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, $g1.0$2)), 62bv32), BV32_ADD(BV32_MUL(2bv32, v1$2), $h0)) else v25$2);
    p43$1 := (if p41$1 && v25$1 then v25$1 else p43$1);
    p43$2 := (if p41$2 && v25$2 then v25$2 else p43$2);
    v26$1 := (if p43$1 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, v1$1), $h0), BV32_ADD(BV32_MUL(2bv32, $g1.0$1), 63bv32)) else v26$1);
    v26$2 := (if p43$2 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, v1$2), $h0), BV32_ADD(BV32_MUL(2bv32, $g1.0$2), 63bv32)) else v26$2);
    p46$1 := (if p43$1 && v26$1 then v26$1 else p46$1);
    p46$2 := (if p43$2 && v26$2 then v26$2 else p46$2);
    p46$1 := (if p45$1 then true else p46$1);
    p46$2 := (if p45$2 then true else p46$2);
    $c0.0$1 := (if p46$1 then 0bv32 else $c0.0$1);
    $c0.0$2 := (if p46$2 then 0bv32 else $c0.0$2);
    p47$1 := (if p46$1 then true else p47$1);
    p47$2 := (if p46$2 then true else p47$2);
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $38;

  $38:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p47$1 ==> p18$1;
    assert p47$2 ==> p18$2;
    assert p18$1 ==> p10$1;
    assert p18$2 ==> p10$2;
    assert {:block_sourceloc} {:sourceloc_num 42} p47$1 ==> true;
    v27$1 := (if p47$1 then BV32_SLT(31bv32, BV32_SUB(BV32_SUB($ni, $g5.0$1), 1bv32)) else v27$1);
    v27$2 := (if p47$2 then BV32_SLT(31bv32, BV32_SUB(BV32_SUB($ni, $g5.0$2), 1bv32)) else v27$2);
    p48$1 := false;
    p48$2 := false;
    p49$1 := false;
    p49$2 := false;
    p50$1 := false;
    p50$2 := false;
    p49$1 := (if p47$1 && v27$1 then v27$1 else p49$1);
    p49$2 := (if p47$2 && v27$2 then v27$2 else p49$2);
    p48$1 := (if p47$1 && !v27$1 then !v27$1 else p48$1);
    p48$2 := (if p47$2 && !v27$2 then !v27$2 else p48$2);
    $5$1 := (if p48$1 then BV32_SUB(BV32_SUB($ni, $g5.0$1), 1bv32) else $5$1);
    $5$2 := (if p48$2 then BV32_SUB(BV32_SUB($ni, $g5.0$2), 1bv32) else $5$2);
    $5$1 := (if p49$1 then 31bv32 else $5$1);
    $5$2 := (if p49$2 then 31bv32 else $5$2);
    v28$1 := (if p47$1 then BV32_SLE($c0.0$1, $5$1) else v28$1);
    v28$2 := (if p47$2 then BV32_SLE($c0.0$2, $5$2) else v28$2);
    p50$1 := (if p47$1 && v28$1 then v28$1 else p50$1);
    p50$2 := (if p47$2 && v28$2 then v28$2 else p50$2);
    p47$1 := (if p47$1 && !v28$1 then v28$1 else p47$1);
    p47$2 := (if p47$2 && !v28$2 then v28$2 else p47$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v29$1 := (if p50$1 then _HAVOC_bv64$1 else v29$1);
    v29$2 := (if p50$2 then _HAVOC_bv64$2 else v29$2);
    call {:sourceloc} {:sourceloc_num 48} _LOG_WRITE_$$kernel6.shared_A(p50$1, BV32_ADD(BV32_MUL($c0.0$1, 32bv32), v1$1), v29$1, $$kernel6.shared_A[1bv1][BV32_ADD(BV32_MUL($c0.0$1, 32bv32), v1$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A(p50$2, BV32_ADD(BV32_MUL($c0.0$2, 32bv32), v1$2));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 48} _CHECK_WRITE_$$kernel6.shared_A(p50$2, BV32_ADD(BV32_MUL($c0.0$2, 32bv32), v1$2), v29$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel6.shared_A"} true;
    $$kernel6.shared_A[1bv1][BV32_ADD(BV32_MUL($c0.0$1, 32bv32), v1$1)] := (if p50$1 then v29$1 else $$kernel6.shared_A[1bv1][BV32_ADD(BV32_MUL($c0.0$1, 32bv32), v1$1)]);
    $$kernel6.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($c0.0$2, 32bv32), v1$2)] := (if p50$2 then v29$2 else $$kernel6.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($c0.0$2, 32bv32), v1$2)]);
    $c0.0$1 := (if p50$1 then BV32_ADD($c0.0$1, 1bv32) else $c0.0$1);
    $c0.0$2 := (if p50$2 then BV32_ADD($c0.0$2, 1bv32) else $c0.0$2);
    p47$1 := (if p50$1 then true else p47$1);
    p47$2 := (if p50$2 then true else p47$2);
    goto $38.backedge, __partitioned_block_$38.tail_0;

  __partitioned_block_$38.tail_0:
    assume !p47$1 && !p47$2;
    goto __partitioned_block_$38.tail_1;

  __partitioned_block_$38.tail_1:
    call {:sourceloc_num 52} $bugle_barrier_duplicated_1(1bv1, 1bv1, p19$1, p19$2);
    v30$1 := (if p19$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_MUL(3bv32, v1$1), BV32_MUL(3bv32, $g1.0$1)), 1bv32), $h0) else v30$1);
    v30$2 := (if p19$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_MUL(3bv32, v1$2), BV32_MUL(3bv32, $g1.0$2)), 1bv32), $h0) else v30$2);
    p52$1 := (if p19$1 && v30$1 then v30$1 else p52$1);
    p52$2 := (if p19$2 && v30$2 then v30$2 else p52$2);
    v31$1 := (if p52$1 then BV32_SGE(BV32_MUL(2bv32, $h0), BV32_ADD(BV32_ADD(BV32_MUL(5bv32, v1$1), BV32_MUL(5bv32, $g1.0$1)), 3bv32)) else v31$1);
    v31$2 := (if p52$2 then BV32_SGE(BV32_MUL(2bv32, $h0), BV32_ADD(BV32_ADD(BV32_MUL(5bv32, v1$2), BV32_MUL(5bv32, $g1.0$2)), 3bv32)) else v31$2);
    p54$1 := (if p52$1 && v31$1 then v31$1 else p54$1);
    p54$2 := (if p52$2 && v31$2 then v31$2 else p54$2);
    v32$1 := (if p54$1 then BV32_SGE(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, v1$1)), BV32_MUL(2bv32, $g1.0$1)), $h0) else v32$1);
    v32$2 := (if p54$2 then BV32_SGE(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, v1$2)), BV32_MUL(2bv32, $g1.0$2)), $h0) else v32$2);
    p56$1 := (if p54$1 && v32$1 then v32$1 else p56$1);
    p56$2 := (if p54$2 && v32$2 then v32$2 else p56$2);
    $c2.0$1 := (if p56$1 then 0bv32 else $c2.0$1);
    $c2.0$2 := (if p56$2 then 0bv32 else $c2.0$2);
    p57$1 := (if p56$1 then true else p57$1);
    p57$2 := (if p56$2 then true else p57$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $49;

  $49:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p57$1 ==> p18$1;
    assert p57$2 ==> p18$2;
    assert p18$1 ==> p10$1;
    assert p18$2 ==> p10$2;
    assert {:block_sourceloc} {:sourceloc_num 56} p57$1 ==> true;
    v33$1 := (if p57$1 then BV32_SLT(BV32_SUB(BV32_SUB($ni, $g5.0$1), 1bv32), 31bv32) else v33$1);
    v33$2 := (if p57$2 then BV32_SLT(BV32_SUB(BV32_SUB($ni, $g5.0$2), 1bv32), 31bv32) else v33$2);
    p58$1 := false;
    p58$2 := false;
    p59$1 := false;
    p59$2 := false;
    p60$1 := false;
    p60$2 := false;
    p59$1 := (if p57$1 && v33$1 then v33$1 else p59$1);
    p59$2 := (if p57$2 && v33$2 then v33$2 else p59$2);
    p58$1 := (if p57$1 && !v33$1 then !v33$1 else p58$1);
    p58$2 := (if p57$2 && !v33$2 then !v33$2 else p58$2);
    $6$1 := (if p58$1 then 31bv32 else $6$1);
    $6$2 := (if p58$2 then 31bv32 else $6$2);
    $6$1 := (if p59$1 then BV32_SUB(BV32_SUB($ni, $g5.0$1), 1bv32) else $6$1);
    $6$2 := (if p59$2 then BV32_SUB(BV32_SUB($ni, $g5.0$2), 1bv32) else $6$2);
    v34$1 := (if p57$1 then BV32_SLE($c2.0$1, $6$1) else v34$1);
    v34$2 := (if p57$2 then BV32_SLE($c2.0$2, $6$2) else v34$2);
    p60$1 := (if p57$1 && v34$1 then v34$1 else p60$1);
    p60$2 := (if p57$2 && v34$2 then v34$2 else p60$2);
    p57$1 := (if p57$1 && !v34$1 then v34$1 else p57$1);
    p57$2 := (if p57$2 && !v34$2 then v34$2 else p57$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v35$1 := (if p60$1 then _HAVOC_bv64$1 else v35$1);
    v35$2 := (if p60$2 then _HAVOC_bv64$2 else v35$2);
    call {:sourceloc} {:sourceloc_num 62} _LOG_READ_$$kernel6.shared_A(p60$1, BV32_ADD(BV32_MUL($c2.0$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, v1$1), 31bv32)), $$kernel6.shared_A[1bv1][BV32_ADD(BV32_MUL($c2.0$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, v1$1), 31bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 62} _CHECK_READ_$$kernel6.shared_A(p60$2, BV32_ADD(BV32_MUL($c2.0$2, 32bv32), BV32_ADD(BV32_SUB(0bv32, v1$2), 31bv32)), $$kernel6.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($c2.0$2, 32bv32), BV32_ADD(BV32_SUB(0bv32, v1$2), 31bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel6.shared_A"} true;
    v36$1 := (if p60$1 then $$kernel6.shared_A[1bv1][BV32_ADD(BV32_MUL($c2.0$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, v1$1), 31bv32))] else v36$1);
    v36$2 := (if p60$2 then $$kernel6.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($c2.0$2, 32bv32), BV32_ADD(BV32_SUB(0bv32, v1$2), 31bv32))] else v36$2);
    v37$1 := (if p60$1 then $$private_R$0bv32$1 else v37$1);
    v37$2 := (if p60$2 then $$private_R$0bv32$2 else v37$2);
    $$private_R$0bv32$1 := (if p60$1 then FADD64(v37$1, FMUL64(v35$1, v36$1)) else $$private_R$0bv32$1);
    $$private_R$0bv32$2 := (if p60$2 then FADD64(v37$2, FMUL64(v35$2, v36$2)) else $$private_R$0bv32$2);
    $c2.0$1 := (if p60$1 then BV32_ADD($c2.0$1, 1bv32) else $c2.0$1);
    $c2.0$2 := (if p60$2 then BV32_ADD($c2.0$2, 1bv32) else $c2.0$2);
    p57$1 := (if p60$1 then true else p57$1);
    p57$2 := (if p60$2 then true else p57$2);
    goto $49.backedge, __partitioned_block_$49.tail_0;

  __partitioned_block_$49.tail_0:
    assume !p57$1 && !p57$2;
    goto __partitioned_block_$49.tail_1;

  __partitioned_block_$49.tail_1:
    call {:sourceloc_num 68} $bugle_barrier_duplicated_2(1bv1, 1bv1, p19$1, p19$2);
    $g5.0$1 := (if p19$1 then BV32_ADD($g5.0$1, 32bv32) else $g5.0$1);
    $g5.0$2 := (if p19$2 then BV32_ADD($g5.0$2, 32bv32) else $g5.0$2);
    p18$1 := (if p19$1 then true else p18$1);
    p18$2 := (if p19$2 then true else p18$2);
    goto $24.backedge, __partitioned_block_$24.tail_0;

  __partitioned_block_$24.tail_0:
    assume !p18$1 && !p18$2;
    v38$1 := (if p11$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_MUL(3bv32, v1$1), BV32_MUL(3bv32, $g1.0$1)), 1bv32), $h0) else v38$1);
    v38$2 := (if p11$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_MUL(3bv32, v1$2), BV32_MUL(3bv32, $g1.0$2)), 1bv32), $h0) else v38$2);
    p62$1 := (if p11$1 && v38$1 then v38$1 else p62$1);
    p62$2 := (if p11$2 && v38$2 then v38$2 else p62$2);
    v39$1 := (if p62$1 then BV32_SGE(BV32_MUL(2bv32, $h0), BV32_ADD(BV32_ADD(BV32_MUL(5bv32, v1$1), BV32_MUL(5bv32, $g1.0$1)), 3bv32)) else v39$1);
    v39$2 := (if p62$2 then BV32_SGE(BV32_MUL(2bv32, $h0), BV32_ADD(BV32_ADD(BV32_MUL(5bv32, v1$2), BV32_MUL(5bv32, $g1.0$2)), 3bv32)) else v39$2);
    p64$1 := (if p62$1 && v39$1 then v39$1 else p64$1);
    p64$2 := (if p62$2 && v39$2 then v39$2 else p64$2);
    v40$1 := (if p64$1 then BV32_SGE(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, v1$1)), BV32_MUL(2bv32, $g1.0$1)), $h0) else v40$1);
    v40$2 := (if p64$2 then BV32_SGE(BV32_ADD(BV32_ADD($nj, BV32_MUL(2bv32, v1$2)), BV32_MUL(2bv32, $g1.0$2)), $h0) else v40$2);
    p66$1 := (if p64$1 && v40$1 then v40$1 else p66$1);
    p66$2 := (if p64$2 && v40$2 then v40$2 else p66$2);
    v41$1 := (if p66$1 then $$private_R$0bv32$1 else v41$1);
    v41$2 := (if p66$2 then $$private_R$0bv32$2 else v41$2);
    call {:sourceloc} {:sourceloc_num 75} _LOG_WRITE_$$R(p66$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(BV32_MUL(3bv32, v1$1), $h0), BV32_MUL(3bv32, $g1.0$1)), 1bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 1bv32)), v41$1, $$R[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(BV32_MUL(3bv32, v1$1), $h0), BV32_MUL(3bv32, $g1.0$1)), 1bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 1bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$R(p66$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(BV32_MUL(3bv32, v1$2), $h0), BV32_MUL(3bv32, $g1.0$2)), 1bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 1bv32)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 75} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 75} _CHECK_WRITE_$$R(p66$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(BV32_MUL(3bv32, v1$2), $h0), BV32_MUL(3bv32, $g1.0$2)), 1bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 1bv32)), v41$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$R"} true;
    $$R[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(BV32_MUL(3bv32, v1$1), $h0), BV32_MUL(3bv32, $g1.0$1)), 1bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 1bv32))] := (if p66$1 then v41$1 else $$R[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(BV32_MUL(3bv32, v1$1), $h0), BV32_MUL(3bv32, $g1.0$1)), 1bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$1), $h0), BV32_MUL(2bv32, $g1.0$1)), 1bv32))]);
    $$R[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(BV32_MUL(3bv32, v1$2), $h0), BV32_MUL(3bv32, $g1.0$2)), 1bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 1bv32))] := (if p66$2 then v41$2 else $$R[BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SUB(BV32_MUL(3bv32, v1$2), $h0), BV32_MUL(3bv32, $g1.0$2)), 1bv32), $nj), BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967294bv32, v1$2), $h0), BV32_MUL(2bv32, $g1.0$2)), 1bv32))]);
    goto __partitioned_block_$24.tail_1;

  __partitioned_block_$24.tail_1:
    call {:sourceloc_num 77} $bugle_barrier_duplicated_0(1bv1, 1bv1, p11$1, p11$2);
    $g1.0$1 := (if p11$1 then BV32_ADD($g1.0$1, 1048576bv32) else $g1.0$1);
    $g1.0$2 := (if p11$2 then BV32_ADD($g1.0$2, 1048576bv32) else $g1.0$2);
    p10$1 := (if p11$1 then true else p10$1);
    p10$2 := (if p11$2 then true else p10$2);
    goto $18.backedge, $18.tail;

  $18.tail:
    assume !p10$1 && !p10$2;
    goto $65;

  $18.backedge:
    assume {:backedge} p10$1 || p10$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $18;

  $24.backedge:
    assume {:backedge} p18$1 || p18$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $24;

  $49.backedge:
    assume {:backedge} p57$1 || p57$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $49;

  $38.backedge:
    assume {:backedge} p47$1 || p47$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $38;
}



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

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel6.shared_A, $$R, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel6.shared_A, $$R, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel6.shared_A, $$R, _TRACKING;



var $$private_R$0bv32$1: bv64;

var $$private_R$0bv32$2: bv64;

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



const _WATCHED_VALUE_$$kernel6.shared_A: bv64;

procedure {:inline 1} _LOG_READ_$$kernel6.shared_A(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel6.shared_A;



implementation {:inline 1} _LOG_READ_$$kernel6.shared_A(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel6.shared_A := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel6.shared_A == _value then true else _READ_HAS_OCCURRED_$$kernel6.shared_A);
    return;
}



procedure _CHECK_READ_$$kernel6.shared_A(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_A"} {:array "$$kernel6.shared_A"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel6.shared_A && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A"} {:array "$$kernel6.shared_A"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel6.shared_A && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel6.shared_A(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel6.shared_A, _WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A;



implementation {:inline 1} _LOG_WRITE_$$kernel6.shared_A(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel6.shared_A := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel6.shared_A == _value then true else _WRITE_HAS_OCCURRED_$$kernel6.shared_A);
    _WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel6.shared_A == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A);
    return;
}



procedure _CHECK_WRITE_$$kernel6.shared_A(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_A"} {:array "$$kernel6.shared_A"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel6.shared_A && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel6.shared_A != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A"} {:array "$$kernel6.shared_A"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel6.shared_A && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel6.shared_A != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A"} {:array "$$kernel6.shared_A"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel6.shared_A && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel6.shared_A(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel6.shared_A;



implementation {:inline 1} _LOG_ATOMIC_$$kernel6.shared_A(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel6.shared_A := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel6.shared_A);
    return;
}



procedure _CHECK_ATOMIC_$$kernel6.shared_A(_P: bool, _offset: bv32);
  requires {:source_name "shared_A"} {:array "$$kernel6.shared_A"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel6.shared_A && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A"} {:array "$$kernel6.shared_A"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel6.shared_A && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A := (if _P && _WRITE_HAS_OCCURRED_$$kernel6.shared_A && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel6.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel6.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel6.shared_A;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$R;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$R;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$R;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$R;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel6.shared_A;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel6.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel6.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel6.shared_A;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$R;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$R;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$R;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$R;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel6.shared_A;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel6.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel6.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel6.shared_A;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$R;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$R;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$R;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$R;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel6.shared_A;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}


