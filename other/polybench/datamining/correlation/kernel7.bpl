type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



var {:source_name "symmat"} {:global} $$symmat: [bv32]bv64;

axiom {:array_info "$$symmat"} {:global} {:elem_width 64} {:source_name "symmat"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$symmat: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$symmat: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$symmat: bool;

axiom {:array_info "$$data"} {:global} {:elem_width 64} {:source_name "data"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data: bool;

axiom {:array_info "$$private_symmat_0"} {:elem_width 64} {:source_name "private_symmat_0"} {:source_elem_width 64} {:source_dimensions "1,2"} true;

var {:source_name "shared_symmat_1"} {:group_shared} $$kernel7.shared_symmat_1: [bv1][bv32]bv64;

axiom {:array_info "$$kernel7.shared_symmat_1"} {:group_shared} {:elem_width 64} {:source_name "shared_symmat_1"} {:source_elem_width 64} {:source_dimensions "32,32"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _READ_HAS_OCCURRED_$$kernel7.shared_symmat_1: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel7"} {:kernel} $kernel7($m: bv32, $n: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $m == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $n == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$symmat && !_WRITE_HAS_OCCURRED_$$symmat && !_ATOMIC_HAS_OCCURRED_$$symmat;
  requires !_READ_HAS_OCCURRED_$$data && !_WRITE_HAS_OCCURRED_$$data && !_ATOMIC_HAS_OCCURRED_$$data;
  requires !_READ_HAS_OCCURRED_$$kernel7.shared_symmat_1 && !_WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1 && !_ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1;
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
  modifies $$kernel7.shared_symmat_1, _READ_HAS_OCCURRED_$$symmat, _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1, _WRITE_READ_BENIGN_FLAG_$$kernel7.shared_symmat_1, _WRITE_READ_BENIGN_FLAG_$$kernel7.shared_symmat_1, $$symmat, _TRACKING, _WRITE_HAS_OCCURRED_$$symmat, _WRITE_READ_BENIGN_FLAG_$$symmat, _WRITE_READ_BENIGN_FLAG_$$symmat, _READ_HAS_OCCURRED_$$kernel7.shared_symmat_1, _TRACKING;



implementation {:source_name "kernel7"} {:kernel} $kernel7($m: bv32, $n: bv32)
{
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $g3.0$1: bv32;
  var $g3.0$2: bv32;
  var $g9.0$1: bv32;
  var $g9.0$2: bv32;
  var $c3.0$1: bv32;
  var $c3.0$2: bv32;
  var $c31.0$1: bv32;
  var $c31.0$2: bv32;
  var $c1.0$1: bv32;
  var $c1.0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bool;
  var v3$2: bool;
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
  var v10$1: bv64;
  var v10$2: bv64;
  var v11$1: bool;
  var v11$2: bool;
  var v12$1: bv64;
  var v12$2: bv64;
  var v13$1: bool;
  var v13$2: bool;
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
  var v20$1: bv64;
  var v20$2: bv64;
  var v21$1: bv64;
  var v21$2: bv64;
  var v22$1: bv64;
  var v22$2: bv64;
  var v23$1: bool;
  var v23$2: bool;
  var v24$1: bv64;
  var v24$2: bv64;
  var v25$1: bv64;
  var v25$2: bv64;
  var v26$1: bv64;
  var v26$2: bv64;
  var v27$1: bool;
  var v27$2: bool;
  var v28$1: bool;
  var v28$2: bool;
  var v29$1: bool;
  var v29$2: bool;
  var v30$1: bool;
  var v30$2: bool;
  var v31$1: bool;
  var v31$2: bool;
  var v32$1: bool;
  var v32$2: bool;
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
  var v38$1: bv64;
  var v38$2: bv64;
  var v39$1: bv64;
  var v39$2: bv64;
  var v40$1: bv64;
  var v40$2: bv64;
  var v41$1: bool;
  var v41$2: bool;
  var v42$1: bv64;
  var v42$2: bv64;
  var v43$1: bool;
  var v43$2: bool;
  var v44$1: bv64;
  var v44$2: bv64;
  var v45$1: bool;
  var v45$2: bool;
  var v46$1: bool;
  var v46$2: bool;
  var v47$1: bool;
  var v47$2: bool;
  var v48$1: bool;
  var v48$2: bool;
  var v49$1: bool;
  var v49$2: bool;
  var v50$1: bv64;
  var v50$2: bv64;
  var v51$1: bool;
  var v51$2: bool;
  var v52$1: bv64;
  var v52$2: bv64;
  var v53$1: bool;
  var v53$2: bool;
  var v54$1: bool;
  var v54$2: bool;
  var v55$1: bool;
  var v55$2: bool;
  var v56$1: bool;
  var v56$2: bool;
  var v57$1: bv64;
  var v57$2: bv64;
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
  var p68$1: bool;
  var p68$2: bool;
  var p69$1: bool;
  var p69$2: bool;
  var p70$1: bool;
  var p70$2: bool;
  var p71$1: bool;
  var p71$2: bool;
  var p72$1: bool;
  var p72$2: bool;
  var p73$1: bool;
  var p73$2: bool;
  var _HAVOC_bv64$1: bv64;
  var _HAVOC_bv64$2: bv64;


  $0:
    v0$1 := group_id_y$1;
    v0$2 := group_id_y$2;
    v1$1 := local_id_x$1;
    v1$2 := local_id_x$2;
    v2$1 := local_id_y$1;
    v2$2 := local_id_y$2;
    $g1.0$1 := BV32_MUL(32bv32, group_id_x$1);
    $g1.0$2 := BV32_MUL(32bv32, group_id_x$2);
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 3} p0$1 ==> true;
    v3$1 := (if p0$1 then BV32_SLT($g1.0$1, BV32_SUB($m, 1bv32)) else v3$1);
    v3$2 := (if p0$2 then BV32_SLT($g1.0$2, BV32_SUB($m, 1bv32)) else v3$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p73$1 := false;
    p73$2 := false;
    p1$1 := (if p0$1 && v3$1 then v3$1 else p1$1);
    p1$2 := (if p0$2 && v3$2 then v3$2 else p1$2);
    p0$1 := (if p0$1 && !v3$1 then v3$1 else p0$1);
    p0$2 := (if p0$2 && !v3$2 then v3$2 else p0$2);
    v4$1 := (if p1$1 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v0$1), $g1.0$1), 1bv32), 0bv32) else v4$1);
    v4$2 := (if p1$2 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v0$2), $g1.0$2), 1bv32), 0bv32) else v4$2);
    p3$1 := (if p1$1 && v4$1 then v4$1 else p3$1);
    p3$2 := (if p1$2 && v4$2 then v4$2 else p3$2);
    p2$1 := (if p1$1 && !v4$1 then !v4$1 else p2$1);
    p2$2 := (if p1$2 && !v4$2 then !v4$2 else p2$2);
    $0$1 := (if p2$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v0$1), $g1.0$1), 1bv32), 8192bv32) else $0$1);
    $0$2 := (if p2$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v0$2), $g1.0$2), 1bv32), 8192bv32) else $0$2);
    $0$1 := (if p3$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v0$1), $g1.0$1), 1bv32)), 8192bv32), 1bv32), 8192bv32)) else $0$1);
    $0$2 := (if p3$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v0$2), $g1.0$2), 1bv32)), 8192bv32), 1bv32), 8192bv32)) else $0$2);
    $g3.0$1 := (if p1$1 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $0$1)), 8192bv32) else $g3.0$1);
    $g3.0$2 := (if p1$2 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $0$2)), 8192bv32) else $g3.0$2);
    p4$1 := (if p1$1 then true else p4$1);
    p4$2 := (if p1$2 then true else p4$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $6;

  $6:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p4$1 ==> p0$1;
    assert p4$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 8} p4$1 ==> true;
    v5$1 := (if p4$1 then BV32_SLT($g3.0$1, $m) else v5$1);
    v5$2 := (if p4$2 then BV32_SLT($g3.0$2, $m) else v5$2);
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
    p69$1 := false;
    p69$2 := false;
    p5$1 := (if p4$1 && v5$1 then v5$1 else p5$1);
    p5$2 := (if p4$2 && v5$2 then v5$2 else p5$2);
    p4$1 := (if p4$1 && !v5$1 then v5$1 else p4$1);
    p4$2 := (if p4$2 && !v5$2 then v5$2 else p4$2);
    v6$1 := (if p5$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 1bv32)) else v6$1);
    v6$2 := (if p5$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 1bv32)) else v6$2);
    p7$1 := (if p5$1 && v6$1 then v6$1 else p7$1);
    p7$2 := (if p5$2 && v6$2 then v6$2 else p7$2);
    v7$1 := (if p7$1 then BV32_SGE(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 15bv32), BV32_ADD(v1$1, $g1.0$1)) else v7$1);
    v7$2 := (if p7$2 then BV32_SGE(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 15bv32), BV32_ADD(v1$2, $g1.0$2)) else v7$2);
    p9$1 := (if p7$1 && v7$1 then v7$1 else p9$1);
    p9$2 := (if p7$2 && v7$2 then v7$2 else p9$2);
    v8$1 := (if p9$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 2bv32)) else v8$1);
    v8$2 := (if p9$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 2bv32)) else v8$2);
    p11$1 := (if p9$1 && v8$1 then v8$1 else p11$1);
    p11$2 := (if p9$2 && v8$2 then v8$2 else p11$2);
    v9$1 := (if p11$1 then BV32_SGE(BV32_ADD(v2$1, $g3.0$1), BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 1bv32)) else v9$1);
    v9$2 := (if p11$2 then BV32_SGE(BV32_ADD(v2$2, $g3.0$2), BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 1bv32)) else v9$2);
    p13$1 := (if p11$1 && v9$1 then v9$1 else p13$1);
    p13$2 := (if p11$2 && v9$2 then v9$2 else p13$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$symmat(p13$1, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $m), BV32_ADD(v2$1, $g3.0$1)), $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $m), BV32_ADD(v2$1, $g3.0$1))]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$symmat(p13$2, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $m), BV32_ADD(v2$2, $g3.0$2)), $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $m), BV32_ADD(v2$2, $g3.0$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$symmat"} true;
    v10$1 := (if p13$1 then $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $m), BV32_ADD(v2$1, $g3.0$1))] else v10$1);
    v10$2 := (if p13$2 then $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $m), BV32_ADD(v2$2, $g3.0$2))] else v10$2);
    $$private_symmat_0$0bv32$1 := (if p13$1 then v10$1 else $$private_symmat_0$0bv32$1);
    $$private_symmat_0$0bv32$2 := (if p13$2 then v10$2 else $$private_symmat_0$0bv32$2);
    v11$1 := (if p11$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 17bv32)) else v11$1);
    v11$2 := (if p11$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 17bv32)) else v11$2);
    p15$1 := (if p11$1 && v11$1 then v11$1 else p15$1);
    p15$2 := (if p11$2 && v11$2 then v11$2 else p15$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_READ_$$symmat(p15$1, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $m), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32)), $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $m), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 18} _CHECK_READ_$$symmat(p15$2, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $m), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32)), $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $m), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$symmat"} true;
    v12$1 := (if p15$1 then $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $m), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32))] else v12$1);
    v12$2 := (if p15$2 then $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $m), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32))] else v12$2);
    $$private_symmat_0$1bv32$1 := (if p15$1 then v12$1 else $$private_symmat_0$1bv32$1);
    $$private_symmat_0$1bv32$2 := (if p15$2 then v12$2 else $$private_symmat_0$1bv32$2);
    $g9.0$1 := (if p5$1 then 0bv32 else $g9.0$1);
    $g9.0$2 := (if p5$2 then 0bv32 else $g9.0$2);
    p16$1 := (if p5$1 then true else p16$1);
    p16$2 := (if p5$2 then true else p16$2);
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $16;

  $16:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p16$1 ==> p4$1;
    assert p16$2 ==> p4$2;
    assert p4$1 ==> p0$1;
    assert p4$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 22} p16$1 ==> true;
    v13$1 := (if p16$1 then BV32_SLE($g9.0$1, $n) else v13$1);
    v13$2 := (if p16$2 then BV32_SLE($g9.0$2, $n) else v13$2);
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
    p58$1 := false;
    p58$2 := false;
    p59$1 := false;
    p59$2 := false;
    p60$1 := false;
    p60$2 := false;
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
    p67$1 := false;
    p67$2 := false;
    p68$1 := false;
    p68$2 := false;
    p17$1 := (if p16$1 && v13$1 then v13$1 else p17$1);
    p17$2 := (if p16$2 && v13$2 then v13$2 else p17$2);
    p16$1 := (if p16$1 && !v13$1 then v13$1 else p16$1);
    p16$2 := (if p16$2 && !v13$2 then v13$2 else p16$2);
    v14$1 := (if p17$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 1bv32)) else v14$1);
    v14$2 := (if p17$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 1bv32)) else v14$2);
    p18$1 := (if p17$1 && v14$1 then v14$1 else p18$1);
    p18$2 := (if p17$2 && v14$2 then v14$2 else p18$2);
    p32$1 := (if p17$1 && !v14$1 then !v14$1 else p32$1);
    p32$2 := (if p17$2 && !v14$2 then !v14$2 else p32$2);
    v15$1 := (if p18$1 then BV32_SGE(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 15bv32), BV32_ADD(v1$1, $g1.0$1)) else v15$1);
    v15$2 := (if p18$2 then BV32_SGE(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 15bv32), BV32_ADD(v1$2, $g1.0$2)) else v15$2);
    p19$1 := (if p18$1 && v15$1 then v15$1 else p19$1);
    p19$2 := (if p18$2 && v15$2 then v15$2 else p19$2);
    p32$1 := (if p18$1 && !v15$1 then !v15$1 else p32$1);
    p32$2 := (if p18$2 && !v15$2 then !v15$2 else p32$2);
    v16$1 := (if p19$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 2bv32)) else v16$1);
    v16$2 := (if p19$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 2bv32)) else v16$2);
    p20$1 := (if p19$1 && v16$1 then v16$1 else p20$1);
    p20$2 := (if p19$2 && v16$2 then v16$2 else p20$2);
    p32$1 := (if p19$1 && !v16$1 then !v16$1 else p32$1);
    p32$2 := (if p19$2 && !v16$2 then !v16$2 else p32$2);
    v17$1 := (if p20$1 then BV32_SGE($n, BV32_ADD($g9.0$1, 32bv32)) else v17$1);
    v17$2 := (if p20$2 then BV32_SGE($n, BV32_ADD($g9.0$2, 32bv32)) else v17$2);
    p21$1 := (if p20$1 && v17$1 then v17$1 else p21$1);
    p21$2 := (if p20$2 && v17$2 then v17$2 else p21$2);
    p32$1 := (if p20$1 && !v17$1 then !v17$1 else p32$1);
    p32$2 := (if p20$2 && !v17$2 then !v17$2 else p32$2);
    $c3.0$1 := (if p21$1 then 0bv32 else $c3.0$1);
    $c3.0$2 := (if p21$2 then 0bv32 else $c3.0$2);
    p22$1 := (if p21$1 then true else p22$1);
    p22$2 := (if p21$2 then true else p22$2);
    assume {:captureState "loop_entry_state_5_0"} true;
    goto $22;

  $22:
    assume {:captureState "loop_head_state_5"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p22$1 ==> p16$1;
    assert p22$2 ==> p16$2;
    assert p16$1 ==> p4$1;
    assert p16$2 ==> p4$2;
    assert p4$1 ==> p0$1;
    assert p4$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 28} p22$1 ==> true;
    v18$1 := (if p22$1 then BV32_SLE($c3.0$1, 31bv32) else v18$1);
    v18$2 := (if p22$2 then BV32_SLE($c3.0$2, 31bv32) else v18$2);
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
    p23$1 := (if p22$1 && v18$1 then v18$1 else p23$1);
    p23$2 := (if p22$2 && v18$2 then v18$2 else p23$2);
    p22$1 := (if p22$1 && !v18$1 then v18$1 else p22$1);
    p22$2 := (if p22$2 && !v18$2 then v18$2 else p22$2);
    v19$1 := (if p23$1 then BV32_SGE(BV32_ADD(v2$1, $g3.0$1), BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 1bv32)) else v19$1);
    v19$2 := (if p23$2 then BV32_SGE(BV32_ADD(v2$2, $g3.0$2), BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 1bv32)) else v19$2);
    p25$1 := (if p23$1 && v19$1 then v19$1 else p25$1);
    p25$2 := (if p23$2 && v19$2 then v19$2 else p25$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v20$1 := (if p25$1 then _HAVOC_bv64$1 else v20$1);
    v20$2 := (if p25$2 then _HAVOC_bv64$2 else v20$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v21$1 := (if p25$1 then _HAVOC_bv64$1 else v21$1);
    v21$2 := (if p25$2 then _HAVOC_bv64$2 else v21$2);
    v22$1 := (if p25$1 then $$private_symmat_0$0bv32$1 else v22$1);
    v22$2 := (if p25$2 then $$private_symmat_0$0bv32$2 else v22$2);
    $$private_symmat_0$0bv32$1 := (if p25$1 then FADD64(v22$1, FMUL64(v20$1, v21$1)) else $$private_symmat_0$0bv32$1);
    $$private_symmat_0$0bv32$2 := (if p25$2 then FADD64(v22$2, FMUL64(v20$2, v21$2)) else $$private_symmat_0$0bv32$2);
    v23$1 := (if p23$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 17bv32)) else v23$1);
    v23$2 := (if p23$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 17bv32)) else v23$2);
    p27$1 := (if p23$1 && v23$1 then v23$1 else p27$1);
    p27$2 := (if p23$2 && v23$2 then v23$2 else p27$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v24$1 := (if p27$1 then _HAVOC_bv64$1 else v24$1);
    v24$2 := (if p27$2 then _HAVOC_bv64$2 else v24$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v25$1 := (if p27$1 then _HAVOC_bv64$1 else v25$1);
    v25$2 := (if p27$2 then _HAVOC_bv64$2 else v25$2);
    v26$1 := (if p27$1 then $$private_symmat_0$1bv32$1 else v26$1);
    v26$2 := (if p27$2 then $$private_symmat_0$1bv32$2 else v26$2);
    $$private_symmat_0$1bv32$1 := (if p27$1 then FADD64(v26$1, FMUL64(v24$1, v25$1)) else $$private_symmat_0$1bv32$1);
    $$private_symmat_0$1bv32$2 := (if p27$2 then FADD64(v26$2, FMUL64(v24$2, v25$2)) else $$private_symmat_0$1bv32$2);
    $c3.0$1 := (if p23$1 then BV32_ADD($c3.0$1, 1bv32) else $c3.0$1);
    $c3.0$2 := (if p23$2 then BV32_ADD($c3.0$2, 1bv32) else $c3.0$2);
    p22$1 := (if p23$1 then true else p22$1);
    p22$2 := (if p23$2 then true else p22$2);
    goto $22.backedge, $22.tail;

  $22.tail:
    assume !p22$1 && !p22$2;
    p32$1 := (if p28$1 then true else p32$1);
    p32$2 := (if p28$2 then true else p32$2);
    p32$1 := (if p29$1 then true else p32$1);
    p32$2 := (if p29$2 then true else p32$2);
    p32$1 := (if p30$1 then true else p32$1);
    p32$2 := (if p30$2 then true else p32$2);
    p32$1 := (if p31$1 then true else p32$1);
    p32$2 := (if p31$2 then true else p32$2);
    v27$1 := (if p32$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 1bv32)) else v27$1);
    v27$2 := (if p32$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 1bv32)) else v27$2);
    p34$1 := (if p32$1 && v27$1 then v27$1 else p34$1);
    p34$2 := (if p32$2 && v27$2 then v27$2 else p34$2);
    v28$1 := (if p34$1 then BV32_SGE(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 15bv32), BV32_ADD(v1$1, $g1.0$1)) else v28$1);
    v28$2 := (if p34$2 then BV32_SGE(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 15bv32), BV32_ADD(v1$2, $g1.0$2)) else v28$2);
    p36$1 := (if p34$1 && v28$1 then v28$1 else p36$1);
    p36$2 := (if p34$2 && v28$2 then v28$2 else p36$2);
    v29$1 := (if p36$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 2bv32)) else v29$1);
    v29$2 := (if p36$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 2bv32)) else v29$2);
    p38$1 := (if p36$1 && v29$1 then v29$1 else p38$1);
    p38$2 := (if p36$2 && v29$2 then v29$2 else p38$2);
    v30$1 := (if p38$1 then BV32_SGE(BV32_ADD($g9.0$1, 31bv32), $n) else v30$1);
    v30$2 := (if p38$2 then BV32_SGE(BV32_ADD($g9.0$2, 31bv32), $n) else v30$2);
    p40$1 := (if p38$1 && v30$1 then v30$1 else p40$1);
    p40$2 := (if p38$2 && v30$2 then v30$2 else p40$2);
    $c31.0$1 := (if p40$1 then 0bv32 else $c31.0$1);
    $c31.0$2 := (if p40$2 then 0bv32 else $c31.0$2);
    p41$1 := (if p40$1 then true else p41$1);
    p41$2 := (if p40$2 then true else p41$2);
    assume {:captureState "loop_entry_state_4_0"} true;
    goto $35;

  $35:
    assume {:captureState "loop_head_state_4"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p41$1 ==> p16$1;
    assert p41$2 ==> p16$2;
    assert p16$1 ==> p4$1;
    assert p16$2 ==> p4$2;
    assert p4$1 ==> p0$1;
    assert p4$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 49} p41$1 ==> true;
    v31$1 := (if p41$1 then BV32_SLE($c31.0$1, BV32_SUB($n, $g9.0$1)) else v31$1);
    v31$2 := (if p41$2 then BV32_SLE($c31.0$2, BV32_SUB($n, $g9.0$2)) else v31$2);
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
    p42$1 := (if p41$1 && v31$1 then v31$1 else p42$1);
    p42$2 := (if p41$2 && v31$2 then v31$2 else p42$2);
    p41$1 := (if p41$1 && !v31$1 then v31$1 else p41$1);
    p41$2 := (if p41$2 && !v31$2 then v31$2 else p41$2);
    v32$1 := (if p42$1 then BV32_SGE($n, BV32_ADD(BV32_ADD($g9.0$1, $c31.0$1), 1bv32)) else v32$1);
    v32$2 := (if p42$2 then BV32_SGE($n, BV32_ADD(BV32_ADD($g9.0$2, $c31.0$2), 1bv32)) else v32$2);
    p43$1 := (if p42$1 && v32$1 then v32$1 else p43$1);
    p43$2 := (if p42$2 && v32$2 then v32$2 else p43$2);
    p48$1 := (if p42$1 && !v32$1 then !v32$1 else p48$1);
    p48$2 := (if p42$2 && !v32$2 then !v32$2 else p48$2);
    v33$1 := (if p43$1 then BV32_SGE(BV32_ADD(v2$1, $g3.0$1), BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 1bv32)) else v33$1);
    v33$2 := (if p43$2 then BV32_SGE(BV32_ADD(v2$2, $g3.0$2), BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 1bv32)) else v33$2);
    p45$1 := (if p43$1 && v33$1 then v33$1 else p45$1);
    p45$2 := (if p43$2 && v33$2 then v33$2 else p45$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v34$1 := (if p45$1 then _HAVOC_bv64$1 else v34$1);
    v34$2 := (if p45$2 then _HAVOC_bv64$2 else v34$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v35$1 := (if p45$1 then _HAVOC_bv64$1 else v35$1);
    v35$2 := (if p45$2 then _HAVOC_bv64$2 else v35$2);
    v36$1 := (if p45$1 then $$private_symmat_0$0bv32$1 else v36$1);
    v36$2 := (if p45$2 then $$private_symmat_0$0bv32$2 else v36$2);
    $$private_symmat_0$0bv32$1 := (if p45$1 then FADD64(v36$1, FMUL64(v34$1, v35$1)) else $$private_symmat_0$0bv32$1);
    $$private_symmat_0$0bv32$2 := (if p45$2 then FADD64(v36$2, FMUL64(v34$2, v35$2)) else $$private_symmat_0$0bv32$2);
    v37$1 := (if p43$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 17bv32)) else v37$1);
    v37$2 := (if p43$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 17bv32)) else v37$2);
    p47$1 := (if p43$1 && v37$1 then v37$1 else p47$1);
    p47$2 := (if p43$2 && v37$2 then v37$2 else p47$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v38$1 := (if p47$1 then _HAVOC_bv64$1 else v38$1);
    v38$2 := (if p47$2 then _HAVOC_bv64$2 else v38$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v39$1 := (if p47$1 then _HAVOC_bv64$1 else v39$1);
    v39$2 := (if p47$2 then _HAVOC_bv64$2 else v39$2);
    v40$1 := (if p47$1 then $$private_symmat_0$1bv32$1 else v40$1);
    v40$2 := (if p47$2 then $$private_symmat_0$1bv32$2 else v40$2);
    $$private_symmat_0$1bv32$1 := (if p47$1 then FADD64(v40$1, FMUL64(v38$1, v39$1)) else $$private_symmat_0$1bv32$1);
    $$private_symmat_0$1bv32$2 := (if p47$2 then FADD64(v40$2, FMUL64(v38$2, v39$2)) else $$private_symmat_0$1bv32$2);
    v41$1 := (if p48$1 then BV32_SGE(BV32_ADD(v2$1, $g3.0$1), BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 1bv32)) else v41$1);
    v41$2 := (if p48$2 then BV32_SGE(BV32_ADD(v2$2, $g3.0$2), BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 1bv32)) else v41$2);
    p50$1 := (if p48$1 && v41$1 then v41$1 else p50$1);
    p50$2 := (if p48$2 && v41$2 then v41$2 else p50$2);
    v42$1 := (if p50$1 then $$private_symmat_0$0bv32$1 else v42$1);
    v42$2 := (if p50$2 then $$private_symmat_0$0bv32$2 else v42$2);
    call {:sourceloc} {:sourceloc_num 67} _LOG_WRITE_$$kernel7.shared_symmat_1(p50$1, BV32_ADD(BV32_MUL(v2$1, 32bv32), v1$1), v42$1, $$kernel7.shared_symmat_1[1bv1][BV32_ADD(BV32_MUL(v2$1, 32bv32), v1$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel7.shared_symmat_1(p50$2, BV32_ADD(BV32_MUL(v2$2, 32bv32), v1$2));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 67} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 67} _CHECK_WRITE_$$kernel7.shared_symmat_1(p50$2, BV32_ADD(BV32_MUL(v2$2, 32bv32), v1$2), v42$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel7.shared_symmat_1"} true;
    $$kernel7.shared_symmat_1[1bv1][BV32_ADD(BV32_MUL(v2$1, 32bv32), v1$1)] := (if p50$1 then v42$1 else $$kernel7.shared_symmat_1[1bv1][BV32_ADD(BV32_MUL(v2$1, 32bv32), v1$1)]);
    $$kernel7.shared_symmat_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 32bv32), v1$2)] := (if p50$2 then v42$2 else $$kernel7.shared_symmat_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 32bv32), v1$2)]);
    v43$1 := (if p48$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 17bv32)) else v43$1);
    v43$2 := (if p48$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 17bv32)) else v43$2);
    p52$1 := (if p48$1 && v43$1 then v43$1 else p52$1);
    p52$2 := (if p48$2 && v43$2 then v43$2 else p52$2);
    v44$1 := (if p52$1 then $$private_symmat_0$1bv32$1 else v44$1);
    v44$2 := (if p52$2 then $$private_symmat_0$1bv32$2 else v44$2);
    call {:sourceloc} {:sourceloc_num 71} _LOG_WRITE_$$kernel7.shared_symmat_1(p52$1, BV32_ADD(BV32_MUL(BV32_ADD(v2$1, 16bv32), 32bv32), v1$1), v44$1, $$kernel7.shared_symmat_1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v2$1, 16bv32), 32bv32), v1$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel7.shared_symmat_1(p52$2, BV32_ADD(BV32_MUL(BV32_ADD(v2$2, 16bv32), 32bv32), v1$2));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 71} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 71} _CHECK_WRITE_$$kernel7.shared_symmat_1(p52$2, BV32_ADD(BV32_MUL(BV32_ADD(v2$2, 16bv32), 32bv32), v1$2), v44$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel7.shared_symmat_1"} true;
    $$kernel7.shared_symmat_1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v2$1, 16bv32), 32bv32), v1$1)] := (if p52$1 then v44$1 else $$kernel7.shared_symmat_1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v2$1, 16bv32), 32bv32), v1$1)]);
    $$kernel7.shared_symmat_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v2$2, 16bv32), 32bv32), v1$2)] := (if p52$2 then v44$2 else $$kernel7.shared_symmat_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v2$2, 16bv32), 32bv32), v1$2)]);
    $c31.0$1 := (if p42$1 then BV32_ADD($c31.0$1, 1bv32) else $c31.0$1);
    $c31.0$2 := (if p42$2 then BV32_ADD($c31.0$2, 1bv32) else $c31.0$2);
    p41$1 := (if p42$1 then true else p41$1);
    p41$2 := (if p42$2 then true else p41$2);
    goto $35.backedge, __partitioned_block_$35.tail_0;

  __partitioned_block_$35.tail_0:
    assume !p41$1 && !p41$2;
    goto __partitioned_block_$35.tail_1;

  __partitioned_block_$35.tail_1:
    call {:sourceloc_num 76} $bugle_barrier_duplicated_1(1bv1, 1bv1, p17$1, p17$2);
    $g9.0$1 := (if p17$1 then BV32_ADD($g9.0$1, 32bv32) else $g9.0$1);
    $g9.0$2 := (if p17$2 then BV32_ADD($g9.0$2, 32bv32) else $g9.0$2);
    p16$1 := (if p17$1 then true else p16$1);
    p16$2 := (if p17$2 then true else p16$2);
    goto $16.backedge, $16.tail;

  $16.tail:
    assume !p16$1 && !p16$2;
    v45$1 := (if p5$1 then BV32_SGE($n, 1bv32) else v45$1);
    v45$2 := (if p5$2 then BV32_SGE($n, 1bv32) else v45$2);
    p54$1 := (if p5$1 && v45$1 then v45$1 else p54$1);
    p54$2 := (if p5$2 && v45$2 then v45$2 else p54$2);
    v46$1 := (if p54$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 1bv32)) else v46$1);
    v46$2 := (if p54$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 1bv32)) else v46$2);
    p56$1 := (if p54$1 && v46$1 then v46$1 else p56$1);
    p56$2 := (if p54$2 && v46$2 then v46$2 else p56$2);
    v47$1 := (if p56$1 then BV32_SGE(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 15bv32), BV32_ADD(v1$1, $g1.0$1)) else v47$1);
    v47$2 := (if p56$2 then BV32_SGE(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 15bv32), BV32_ADD(v1$2, $g1.0$2)) else v47$2);
    p58$1 := (if p56$1 && v47$1 then v47$1 else p58$1);
    p58$2 := (if p56$2 && v47$2 then v47$2 else p58$2);
    v48$1 := (if p58$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 2bv32)) else v48$1);
    v48$2 := (if p58$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 2bv32)) else v48$2);
    p60$1 := (if p58$1 && v48$1 then v48$1 else p60$1);
    p60$2 := (if p58$2 && v48$2 then v48$2 else p60$2);
    v49$1 := (if p60$1 then BV32_SGE(BV32_ADD(v2$1, $g3.0$1), BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 1bv32)) else v49$1);
    v49$2 := (if p60$2 then BV32_SGE(BV32_ADD(v2$2, $g3.0$2), BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 1bv32)) else v49$2);
    p62$1 := (if p60$1 && v49$1 then v49$1 else p62$1);
    p62$2 := (if p60$2 && v49$2 then v49$2 else p62$2);
    v50$1 := (if p62$1 then $$private_symmat_0$0bv32$1 else v50$1);
    v50$2 := (if p62$2 then $$private_symmat_0$0bv32$2 else v50$2);
    call {:sourceloc} {:sourceloc_num 85} _LOG_WRITE_$$symmat(p62$1, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $m), BV32_ADD(v2$1, $g3.0$1)), v50$1, $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $m), BV32_ADD(v2$1, $g3.0$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$symmat(p62$2, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $m), BV32_ADD(v2$2, $g3.0$2)));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 85} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 85} _CHECK_WRITE_$$symmat(p62$2, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $m), BV32_ADD(v2$2, $g3.0$2)), v50$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$symmat"} true;
    $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $m), BV32_ADD(v2$1, $g3.0$1))] := (if p62$1 then v50$1 else $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $m), BV32_ADD(v2$1, $g3.0$1))]);
    $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $m), BV32_ADD(v2$2, $g3.0$2))] := (if p62$2 then v50$2 else $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $m), BV32_ADD(v2$2, $g3.0$2))]);
    v51$1 := (if p60$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 17bv32)) else v51$1);
    v51$2 := (if p60$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 17bv32)) else v51$2);
    p64$1 := (if p60$1 && v51$1 then v51$1 else p64$1);
    p64$2 := (if p60$2 && v51$2 then v51$2 else p64$2);
    v52$1 := (if p64$1 then $$private_symmat_0$1bv32$1 else v52$1);
    v52$2 := (if p64$2 then $$private_symmat_0$1bv32$2 else v52$2);
    call {:sourceloc} {:sourceloc_num 89} _LOG_WRITE_$$symmat(p64$1, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $m), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32)), v52$1, $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $m), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$symmat(p64$2, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $m), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32)));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 89} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 89} _CHECK_WRITE_$$symmat(p64$2, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $m), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32)), v52$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$symmat"} true;
    $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $m), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32))] := (if p64$1 then v52$1 else $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $m), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32))]);
    $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $m), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32))] := (if p64$2 then v52$2 else $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $m), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32))]);
    v53$1 := (if p5$1 then BV32_SGE(BV32_ADD(v1$1, $g3.0$1), BV32_ADD($g1.0$1, 1bv32)) else v53$1);
    v53$2 := (if p5$2 then BV32_SGE(BV32_ADD(v1$2, $g3.0$2), BV32_ADD($g1.0$2, 1bv32)) else v53$2);
    p66$1 := (if p5$1 && v53$1 then v53$1 else p66$1);
    p66$2 := (if p5$2 && v53$2 then v53$2 else p66$2);
    v54$1 := (if p66$1 then BV32_SGE($m, BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 1bv32)) else v54$1);
    v54$2 := (if p66$2 then BV32_SGE($m, BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 1bv32)) else v54$2);
    p68$1 := (if p66$1 && v54$1 then v54$1 else p68$1);
    p68$2 := (if p66$2 && v54$2 then v54$2 else p68$2);
    $c1.0$1 := (if p68$1 then v2$1 else $c1.0$1);
    $c1.0$2 := (if p68$2 then v2$2 else $c1.0$2);
    p69$1 := (if p68$1 then true else p69$1);
    p69$2 := (if p68$2 then true else p69$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $66;

  $66:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel7.shared_symmat_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p69$1 ==> p4$1;
    assert p69$2 ==> p4$2;
    assert p4$1 ==> p0$1;
    assert p4$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 95} p69$1 ==> true;
    v55$1 := (if p69$1 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(v1$1, $g1.0$1), $g3.0$1), 1bv32), 31bv32) else v55$1);
    v55$2 := (if p69$2 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(v1$2, $g1.0$2), $g3.0$2), 1bv32), 31bv32) else v55$2);
    p70$1 := false;
    p70$2 := false;
    p71$1 := false;
    p71$2 := false;
    p72$1 := false;
    p72$2 := false;
    p71$1 := (if p69$1 && v55$1 then v55$1 else p71$1);
    p71$2 := (if p69$2 && v55$2 then v55$2 else p71$2);
    p70$1 := (if p69$1 && !v55$1 then !v55$1 else p70$1);
    p70$2 := (if p69$2 && !v55$2 then !v55$2 else p70$2);
    $1$1 := (if p70$1 then 31bv32 else $1$1);
    $1$2 := (if p70$2 then 31bv32 else $1$2);
    $1$1 := (if p71$1 then BV32_SUB(BV32_ADD(BV32_SUB(v1$1, $g1.0$1), $g3.0$1), 1bv32) else $1$1);
    $1$2 := (if p71$2 then BV32_SUB(BV32_ADD(BV32_SUB(v1$2, $g1.0$2), $g3.0$2), 1bv32) else $1$2);
    v56$1 := (if p69$1 then BV32_SLE($c1.0$1, $1$1) else v56$1);
    v56$2 := (if p69$2 then BV32_SLE($c1.0$2, $1$2) else v56$2);
    p72$1 := (if p69$1 && v56$1 then v56$1 else p72$1);
    p72$2 := (if p69$2 && v56$2 then v56$2 else p72$2);
    p69$1 := (if p69$1 && !v56$1 then v56$1 else p69$1);
    p69$2 := (if p69$2 && !v56$2 then v56$2 else p69$2);
    call {:sourceloc} {:sourceloc_num 100} _LOG_READ_$$kernel7.shared_symmat_1(p72$1, BV32_ADD(BV32_MUL(v1$1, 32bv32), $c1.0$1), $$kernel7.shared_symmat_1[1bv1][BV32_ADD(BV32_MUL(v1$1, 32bv32), $c1.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 100} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 100} _CHECK_READ_$$kernel7.shared_symmat_1(p72$2, BV32_ADD(BV32_MUL(v1$2, 32bv32), $c1.0$2), $$kernel7.shared_symmat_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, 32bv32), $c1.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel7.shared_symmat_1"} true;
    v57$1 := (if p72$1 then $$kernel7.shared_symmat_1[1bv1][BV32_ADD(BV32_MUL(v1$1, 32bv32), $c1.0$1)] else v57$1);
    v57$2 := (if p72$2 then $$kernel7.shared_symmat_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, 32bv32), $c1.0$2)] else v57$2);
    call {:sourceloc} {:sourceloc_num 101} _LOG_WRITE_$$symmat(p72$1, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g3.0$1), $m), BV32_ADD($g1.0$1, $c1.0$1)), v57$1, $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g3.0$1), $m), BV32_ADD($g1.0$1, $c1.0$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$symmat(p72$2, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g3.0$2), $m), BV32_ADD($g1.0$2, $c1.0$2)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 101} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 101} _CHECK_WRITE_$$symmat(p72$2, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g3.0$2), $m), BV32_ADD($g1.0$2, $c1.0$2)), v57$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$symmat"} true;
    $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g3.0$1), $m), BV32_ADD($g1.0$1, $c1.0$1))] := (if p72$1 then v57$1 else $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g3.0$1), $m), BV32_ADD($g1.0$1, $c1.0$1))]);
    $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g3.0$2), $m), BV32_ADD($g1.0$2, $c1.0$2))] := (if p72$2 then v57$2 else $$symmat[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g3.0$2), $m), BV32_ADD($g1.0$2, $c1.0$2))]);
    $c1.0$1 := (if p72$1 then BV32_ADD($c1.0$1, 16bv32) else $c1.0$1);
    $c1.0$2 := (if p72$2 then BV32_ADD($c1.0$2, 16bv32) else $c1.0$2);
    p69$1 := (if p72$1 then true else p69$1);
    p69$2 := (if p72$2 then true else p69$2);
    goto $66.backedge, __partitioned_block_$66.tail_0;

  __partitioned_block_$66.tail_0:
    assume !p69$1 && !p69$2;
    goto __partitioned_block_$66.tail_1;

  __partitioned_block_$66.tail_1:
    call {:sourceloc_num 105} $bugle_barrier_duplicated_0(1bv1, 1bv1, p5$1, p5$2);
    $g3.0$1 := (if p5$1 then BV32_ADD($g3.0$1, 8192bv32) else $g3.0$1);
    $g3.0$2 := (if p5$2 then BV32_ADD($g3.0$2, 8192bv32) else $g3.0$2);
    p4$1 := (if p5$1 then true else p4$1);
    p4$2 := (if p5$2 then true else p4$2);
    goto $6.backedge, $6.tail;

  $6.tail:
    assume !p4$1 && !p4$2;
    $g1.0$1 := (if p1$1 then BV32_ADD($g1.0$1, 8192bv32) else $g1.0$1);
    $g1.0$2 := (if p1$2 then BV32_ADD($g1.0$2, 8192bv32) else $g1.0$2);
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

  $6.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $6;

  $66.backedge:
    assume {:backedge} p69$1 || p69$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $66;

  $16.backedge:
    assume {:backedge} p16$1 || p16$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $16;

  $35.backedge:
    assume {:backedge} p41$1 || p41$2;
    assume {:captureState "loop_back_edge_state_4_0"} true;
    goto $35;

  $22.backedge:
    assume {:backedge} p22$1 || p22$2;
    assume {:captureState "loop_back_edge_state_5_0"} true;
    goto $22;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 32bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel7.shared_symmat_1, $$symmat, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel7.shared_symmat_1, $$symmat, _TRACKING;



var $$private_symmat_0$1bv32$1: bv64;

var $$private_symmat_0$1bv32$2: bv64;

var $$private_symmat_0$0bv32$1: bv64;

var $$private_symmat_0$0bv32$2: bv64;

const _WATCHED_VALUE_$$symmat: bv64;

procedure {:inline 1} _LOG_READ_$$symmat(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$symmat;



implementation {:inline 1} _LOG_READ_$$symmat(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$symmat := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$symmat == _value then true else _READ_HAS_OCCURRED_$$symmat);
    return;
}



procedure _CHECK_READ_$$symmat(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "symmat"} {:array "$$symmat"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$symmat);
  requires {:source_name "symmat"} {:array "$$symmat"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$symmat: bool;

procedure {:inline 1} _LOG_WRITE_$$symmat(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$symmat, _WRITE_READ_BENIGN_FLAG_$$symmat;



implementation {:inline 1} _LOG_WRITE_$$symmat(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$symmat := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$symmat == _value then true else _WRITE_HAS_OCCURRED_$$symmat);
    _WRITE_READ_BENIGN_FLAG_$$symmat := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$symmat == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$symmat);
    return;
}



procedure _CHECK_WRITE_$$symmat(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "symmat"} {:array "$$symmat"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$symmat != _value);
  requires {:source_name "symmat"} {:array "$$symmat"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$symmat != _value);
  requires {:source_name "symmat"} {:array "$$symmat"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$symmat(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$symmat;



implementation {:inline 1} _LOG_ATOMIC_$$symmat(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$symmat := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$symmat);
    return;
}



procedure _CHECK_ATOMIC_$$symmat(_P: bool, _offset: bv32);
  requires {:source_name "symmat"} {:array "$$symmat"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset);
  requires {:source_name "symmat"} {:array "$$symmat"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$symmat(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$symmat;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$symmat(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$symmat := (if _P && _WRITE_HAS_OCCURRED_$$symmat && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$symmat);
    return;
}



const _WATCHED_VALUE_$$data: bv64;

procedure {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$data;



implementation {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _READ_HAS_OCCURRED_$$data);
    return;
}



procedure _CHECK_READ_$$data(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data);
  requires {:source_name "data"} {:array "$$data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data: bool;

procedure {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$data, _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _WRITE_HAS_OCCURRED_$$data);
    _WRITE_READ_BENIGN_FLAG_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data);
    return;
}



procedure _CHECK_WRITE_$$data(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data != _value);
  requires {:source_name "data"} {:array "$$data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data != _value);
  requires {:source_name "data"} {:array "$$data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data;



implementation {:inline 1} _LOG_ATOMIC_$$data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data);
    return;
}



procedure _CHECK_ATOMIC_$$data(_P: bool, _offset: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);
  requires {:source_name "data"} {:array "$$data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data := (if _P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data);
    return;
}



const _WATCHED_VALUE_$$kernel7.shared_symmat_1: bv64;

procedure {:inline 1} _LOG_READ_$$kernel7.shared_symmat_1(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel7.shared_symmat_1;



implementation {:inline 1} _LOG_READ_$$kernel7.shared_symmat_1(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel7.shared_symmat_1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel7.shared_symmat_1 == _value then true else _READ_HAS_OCCURRED_$$kernel7.shared_symmat_1);
    return;
}



procedure _CHECK_READ_$$kernel7.shared_symmat_1(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_symmat_1"} {:array "$$kernel7.shared_symmat_1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel7.shared_symmat_1 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_symmat_1"} {:array "$$kernel7.shared_symmat_1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel7.shared_symmat_1: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel7.shared_symmat_1(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1, _WRITE_READ_BENIGN_FLAG_$$kernel7.shared_symmat_1;



implementation {:inline 1} _LOG_WRITE_$$kernel7.shared_symmat_1(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel7.shared_symmat_1 == _value then true else _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1);
    _WRITE_READ_BENIGN_FLAG_$$kernel7.shared_symmat_1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel7.shared_symmat_1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel7.shared_symmat_1);
    return;
}



procedure _CHECK_WRITE_$$kernel7.shared_symmat_1(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_symmat_1"} {:array "$$kernel7.shared_symmat_1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel7.shared_symmat_1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_symmat_1"} {:array "$$kernel7.shared_symmat_1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel7.shared_symmat_1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel7.shared_symmat_1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_symmat_1"} {:array "$$kernel7.shared_symmat_1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel7.shared_symmat_1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1;



implementation {:inline 1} _LOG_ATOMIC_$$kernel7.shared_symmat_1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1);
    return;
}



procedure _CHECK_ATOMIC_$$kernel7.shared_symmat_1(_P: bool, _offset: bv32);
  requires {:source_name "shared_symmat_1"} {:array "$$kernel7.shared_symmat_1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_symmat_1"} {:array "$$kernel7.shared_symmat_1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel7.shared_symmat_1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel7.shared_symmat_1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel7.shared_symmat_1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel7.shared_symmat_1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel7.shared_symmat_1 := (if _P && _WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel7.shared_symmat_1);
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel7.shared_symmat_1;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$symmat;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$symmat;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$symmat;
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
    havoc $$symmat;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel7.shared_symmat_1;
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel7.shared_symmat_1;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel7.shared_symmat_1;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel7.shared_symmat_1;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$symmat;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$symmat;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$symmat;
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
    havoc $$symmat;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel7.shared_symmat_1;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
