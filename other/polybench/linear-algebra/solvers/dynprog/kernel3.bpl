type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$c"} {:global} {:elem_width 32} {:source_name "c"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$c: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$c: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$c: bool;

var {:source_name "sum_c"} {:global} $$sum_c: [bv32]bv32;

axiom {:array_info "$$sum_c"} {:global} {:elem_width 32} {:source_name "sum_c"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sum_c: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sum_c: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sum_c: bool;

axiom {:array_info "$$private_c_0"} {:elem_width 32} {:source_name "private_c_0"} {:source_elem_width 32} {:source_dimensions "1,2"} true;

axiom {:array_info "$$private_sum_c_0"} {:elem_width 32} {:source_name "private_sum_c_0"} {:source_elem_width 32} {:source_dimensions "1,2,2"} true;

axiom {:array_info "$$private_sum_c_1"} {:elem_width 32} {:source_name "private_sum_c_1"} {:source_elem_width 32} {:source_dimensions "1,2,2"} true;

var {:source_name "shared_c_1"} {:group_shared} $$kernel3.shared_c_1: [bv1][bv32]bv32;

axiom {:array_info "$$kernel3.shared_c_1"} {:group_shared} {:elem_width 32} {:source_name "shared_c_1"} {:source_elem_width 32} {:source_dimensions "32,32"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,32"} _READ_HAS_OCCURRED_$$kernel3.shared_c_1: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,32"} _WRITE_HAS_OCCURRED_$$kernel3.shared_c_1: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,32"} _ATOMIC_HAS_OCCURRED_$$kernel3.shared_c_1: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel3"} {:kernel} $kernel3($length: bv32, $tsteps: bv32, $h0: bv32, $h3: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $tsteps == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $length == 64bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$c && !_WRITE_HAS_OCCURRED_$$c && !_ATOMIC_HAS_OCCURRED_$$c;
  requires !_READ_HAS_OCCURRED_$$sum_c && !_WRITE_HAS_OCCURRED_$$sum_c && !_ATOMIC_HAS_OCCURRED_$$sum_c;
  requires !_READ_HAS_OCCURRED_$$kernel3.shared_c_1 && !_WRITE_HAS_OCCURRED_$$kernel3.shared_c_1 && !_ATOMIC_HAS_OCCURRED_$$kernel3.shared_c_1;
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
  modifies $$kernel3.shared_c_1, _READ_HAS_OCCURRED_$$sum_c, _WRITE_HAS_OCCURRED_$$kernel3.shared_c_1, _WRITE_READ_BENIGN_FLAG_$$kernel3.shared_c_1, _WRITE_READ_BENIGN_FLAG_$$kernel3.shared_c_1, $$sum_c, _TRACKING, _READ_HAS_OCCURRED_$$kernel3.shared_c_1, _TRACKING, _WRITE_HAS_OCCURRED_$$sum_c, _WRITE_READ_BENIGN_FLAG_$$sum_c, _WRITE_READ_BENIGN_FLAG_$$sum_c, _TRACKING;



implementation {:source_name "kernel3"} {:kernel} $kernel3($length: bv32, $tsteps: bv32, $h0: bv32, $h3: bv32)
{
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
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
  var $g3.0$1: bv32;
  var $g3.0$2: bv32;
  var $5$1: bv32;
  var $5$2: bv32;
  var $c1.0$1: bv32;
  var $c1.0$2: bv32;
  var $6$1: bv32;
  var $6$2: bv32;
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
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bool;
  var v16$2: bool;
  var v17$1: bool;
  var v17$2: bool;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bool;
  var v19$2: bool;
  var v20$1: bool;
  var v20$2: bool;
  var v21$1: bool;
  var v21$2: bool;
  var v22$1: bool;
  var v22$2: bool;
  var v23$1: bv32;
  var v23$2: bv32;
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
  var v29$1: bool;
  var v29$2: bool;
  var v30$1: bv32;
  var v30$2: bv32;
  var v31$1: bool;
  var v31$2: bool;
  var v32$1: bv32;
  var v32$2: bv32;
  var v33$1: bool;
  var v33$2: bool;
  var v34$1: bool;
  var v34$2: bool;
  var v35$1: bool;
  var v35$2: bool;
  var v36$1: bool;
  var v36$2: bool;
  var v37$1: bool;
  var v37$2: bool;
  var v38$1: bool;
  var v38$2: bool;
  var v39$1: bv32;
  var v39$2: bv32;
  var v40$1: bv32;
  var v40$2: bv32;
  var v41$1: bv32;
  var v41$2: bv32;
  var v42$1: bool;
  var v42$2: bool;
  var v43$1: bv32;
  var v43$2: bv32;
  var v44$1: bv32;
  var v44$2: bv32;
  var v45$1: bv32;
  var v45$2: bv32;
  var v46$1: bool;
  var v46$2: bool;
  var v47$1: bool;
  var v47$2: bool;
  var v48$1: bool;
  var v48$2: bool;
  var v49$1: bool;
  var v49$2: bool;
  var v50$1: bool;
  var v50$2: bool;
  var v51$1: bv32;
  var v51$2: bv32;
  var v52$1: bool;
  var v52$2: bool;
  var v53$1: bool;
  var v53$2: bool;
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
  var p74$1: bool;
  var p74$2: bool;
  var p75$1: bool;
  var p75$2: bool;
  var p76$1: bool;
  var p76$2: bool;
  var p77$1: bool;
  var p77$2: bool;
  var p78$1: bool;
  var p78$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


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
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel3.shared_c_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel3.shared_c_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel3.shared_c_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 3} p0$1 ==> true;
    v3$1 := (if p0$1 then BV32_SLT($g1.0$1, BV32_SUB(BV32_SDIV(BV32_ADD($h3, 1bv32), 2bv32), 1bv32)) else v3$1);
    v3$2 := (if p0$2 then BV32_SLT($g1.0$2, BV32_SUB(BV32_SDIV(BV32_ADD($h3, 1bv32), 2bv32), 1bv32)) else v3$2);
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
    p78$1 := false;
    p78$2 := false;
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
    v5$1 := (if p1$1 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $length), BV32_MUL(32bv32, v0$1)), $h3), 31bv32), 0bv32) else v5$1);
    v5$2 := (if p1$2 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $length), BV32_MUL(32bv32, v0$2)), $h3), 31bv32), 0bv32) else v5$2);
    p5$1 := (if p1$1 && v5$1 then v5$1 else p5$1);
    p5$2 := (if p1$2 && v5$2 then v5$2 else p5$2);
    p4$1 := (if p1$1 && !v5$1 then !v5$1 else p4$1);
    p4$2 := (if p1$2 && !v5$2 then !v5$2 else p4$2);
    $1$1 := (if p4$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $length), BV32_MUL(32bv32, v0$1)), $h3), 31bv32), 8192bv32) else $1$1);
    $1$2 := (if p4$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $length), BV32_MUL(32bv32, v0$2)), $h3), 31bv32), 8192bv32) else $1$2);
    $1$1 := (if p5$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $length), BV32_MUL(32bv32, v0$1)), $h3), 31bv32)), 8192bv32), 1bv32), 8192bv32)) else $1$1);
    $1$2 := (if p5$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $length), BV32_MUL(32bv32, v0$2)), $h3), 31bv32)), 8192bv32), 1bv32), 8192bv32)) else $1$2);
    v6$1 := (if p1$1 then BV32_SGT(BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $0$1)), 8192bv32), BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $1$1)), 8192bv32)) else v6$1);
    v6$2 := (if p1$2 then BV32_SGT(BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $0$2)), 8192bv32), BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $1$2)), 8192bv32)) else v6$2);
    p6$1 := (if p1$1 && v6$1 then v6$1 else p6$1);
    p6$2 := (if p1$2 && v6$2 then v6$2 else p6$2);
    p9$1 := (if p1$1 && !v6$1 then !v6$1 else p9$1);
    p9$2 := (if p1$2 && !v6$2 then !v6$2 else p9$2);
    v7$1 := (if p6$1 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v0$1), $g1.0$1), 1bv32), 0bv32) else v7$1);
    v7$2 := (if p6$2 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v0$2), $g1.0$2), 1bv32), 0bv32) else v7$2);
    p8$1 := (if p6$1 && v7$1 then v7$1 else p8$1);
    p8$2 := (if p6$2 && v7$2 then v7$2 else p8$2);
    p7$1 := (if p6$1 && !v7$1 then !v7$1 else p7$1);
    p7$2 := (if p6$2 && !v7$2 then !v7$2 else p7$2);
    $2$1 := (if p7$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v0$1), $g1.0$1), 1bv32), 8192bv32) else $2$1);
    $2$2 := (if p7$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v0$2), $g1.0$2), 1bv32), 8192bv32) else $2$2);
    $2$1 := (if p8$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v0$1), $g1.0$1), 1bv32)), 8192bv32), 1bv32), 8192bv32)) else $2$1);
    $2$2 := (if p8$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v0$2), $g1.0$2), 1bv32)), 8192bv32), 1bv32), 8192bv32)) else $2$2);
    $3$1 := (if p6$1 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $2$1)), 8192bv32) else $3$1);
    $3$2 := (if p6$2 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $2$2)), 8192bv32) else $3$2);
    v8$1 := (if p9$1 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $length), BV32_MUL(32bv32, v0$1)), $h3), 31bv32), 0bv32) else v8$1);
    v8$2 := (if p9$2 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $length), BV32_MUL(32bv32, v0$2)), $h3), 31bv32), 0bv32) else v8$2);
    p11$1 := (if p9$1 && v8$1 then v8$1 else p11$1);
    p11$2 := (if p9$2 && v8$2 then v8$2 else p11$2);
    p10$1 := (if p9$1 && !v8$1 then !v8$1 else p10$1);
    p10$2 := (if p9$2 && !v8$2 then !v8$2 else p10$2);
    $4$1 := (if p10$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $length), BV32_MUL(32bv32, v0$1)), $h3), 31bv32), 8192bv32) else $4$1);
    $4$2 := (if p10$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $length), BV32_MUL(32bv32, v0$2)), $h3), 31bv32), 8192bv32) else $4$2);
    $4$1 := (if p11$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $length), BV32_MUL(32bv32, v0$1)), $h3), 31bv32)), 8192bv32), 1bv32), 8192bv32)) else $4$1);
    $4$2 := (if p11$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $length), BV32_MUL(32bv32, v0$2)), $h3), 31bv32)), 8192bv32), 1bv32), 8192bv32)) else $4$2);
    $3$1 := (if p9$1 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $4$1)), 8192bv32) else $3$1);
    $3$2 := (if p9$2 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $4$2)), 8192bv32) else $3$2);
    $g3.0$1 := (if p1$1 then $3$1 else $g3.0$1);
    $g3.0$2 := (if p1$2 then $3$2 else $g3.0$2);
    p12$1 := (if p1$1 then true else p12$1);
    p12$2 := (if p1$2 then true else p12$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $18;

  $18:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel3.shared_c_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel3.shared_c_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel3.shared_c_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p12$1 ==> p0$1;
    assert p12$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 20} p12$1 ==> true;
    v9$1 := (if p12$1 then BV32_SLT($g3.0$1, BV32_SDIV(BV32_ADD($h3, 1bv32), 2bv32)) else v9$1);
    v9$2 := (if p12$2 then BV32_SLT($g3.0$2, BV32_SDIV(BV32_ADD($h3, 1bv32), 2bv32)) else v9$2);
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
    p69$1 := false;
    p69$2 := false;
    p70$1 := false;
    p70$2 := false;
    p71$1 := false;
    p71$2 := false;
    p72$1 := false;
    p72$2 := false;
    p73$1 := false;
    p73$2 := false;
    p74$1 := false;
    p74$2 := false;
    p75$1 := false;
    p75$2 := false;
    p76$1 := false;
    p76$2 := false;
    p77$1 := false;
    p77$2 := false;
    p13$1 := (if p12$1 && v9$1 then v9$1 else p13$1);
    p13$2 := (if p12$2 && v9$2 then v9$2 else p13$2);
    p12$1 := (if p12$1 && !v9$1 then v9$1 else p12$1);
    p12$2 := (if p12$2 && !v9$2 then v9$2 else p12$2);
    v10$1 := (if p13$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$1), BV32_MUL(2bv32, $g1.0$1)), 3bv32)) else v10$1);
    v10$2 := (if p13$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$2), BV32_MUL(2bv32, $g1.0$2)), 3bv32)) else v10$2);
    p15$1 := (if p13$1 && v10$1 then v10$1 else p15$1);
    p15$2 := (if p13$2 && v10$2 then v10$2 else p15$2);
    v11$1 := (if p15$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($length, v2$1), $g3.0$1), 15bv32), $h3) else v11$1);
    v11$2 := (if p15$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($length, v2$2), $g3.0$2), 15bv32), $h3) else v11$2);
    p17$1 := (if p15$1 && v11$1 then v11$1 else p17$1);
    p17$2 := (if p15$2 && v11$2 then v11$2 else p17$2);
    v12$1 := (if p17$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$1), BV32_MUL(2bv32, $g3.0$1)), 1bv32)) else v12$1);
    v12$2 := (if p17$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$2), BV32_MUL(2bv32, $g3.0$2)), 1bv32)) else v12$2);
    p19$1 := (if p17$1 && v12$1 then v12$1 else p19$1);
    p19$2 := (if p17$2 && v12$2 then v12$2 else p19$2);
    v13$1 := (if p19$1 then BV32_SGE(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 15bv32), BV32_ADD(v1$1, $g1.0$1)) else v13$1);
    v13$2 := (if p19$2 then BV32_SGE(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 15bv32), BV32_ADD(v1$2, $g1.0$2)) else v13$2);
    p21$1 := (if p19$1 && v13$1 then v13$1 else p21$1);
    p21$2 := (if p19$2 && v13$2 then v13$2 else p21$2);
    v14$1 := (if p21$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$1), BV32_MUL(2bv32, $g3.0$1)), 33bv32)) else v14$1);
    v14$2 := (if p21$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$2), BV32_MUL(2bv32, $g3.0$2)), 33bv32)) else v14$2);
    p23$1 := (if p21$1 && v14$1 then v14$1 else p23$1);
    p23$2 := (if p21$2 && v14$2 then v14$2 else p23$2);
    call {:sourceloc} {:sourceloc_num 27} _LOG_READ_$$sum_c(p23$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_SUB(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h3), $g3.0$1), 16bv32)), $length), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 15bv32)), $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_SUB(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h3), $g3.0$1), 16bv32)), $length), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 15bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 27} _CHECK_READ_$$sum_c(p23$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_SUB(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h3), $g3.0$2), 16bv32)), $length), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 15bv32)), $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_SUB(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h3), $g3.0$2), 16bv32)), $length), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 15bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sum_c"} true;
    v15$1 := (if p23$1 then $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_SUB(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h3), $g3.0$1), 16bv32)), $length), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 15bv32))] else v15$1);
    v15$2 := (if p23$2 then $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_SUB(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h3), $g3.0$2), 16bv32)), $length), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 15bv32))] else v15$2);
    $$private_sum_c_1$1bv32$1 := (if p23$1 then v15$1 else $$private_sum_c_1$1bv32$1);
    $$private_sum_c_1$1bv32$2 := (if p23$2 then v15$2 else $$private_sum_c_1$1bv32$2);
    v16$1 := (if p21$1 then BV32_SGE(BV32_ADD(BV32_ADD($length, v2$1), $g3.0$1), BV32_ADD($h3, 1bv32)) else v16$1);
    v16$2 := (if p21$2 then BV32_SGE(BV32_ADD(BV32_ADD($length, v2$2), $g3.0$2), BV32_ADD($h3, 1bv32)) else v16$2);
    p25$1 := (if p21$1 && v16$1 then v16$1 else p25$1);
    p25$2 := (if p21$2 && v16$2 then v16$2 else p25$2);
    v17$1 := (if p25$1 then BV32_SGE(BV32_ADD(v2$1, $g3.0$1), BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 1bv32)) else v17$1);
    v17$2 := (if p25$2 then BV32_SGE(BV32_ADD(v2$2, $g3.0$2), BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 1bv32)) else v17$2);
    p27$1 := (if p25$1 && v17$1 then v17$1 else p27$1);
    p27$2 := (if p25$2 && v17$2 then v17$2 else p27$2);
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$sum_c(p27$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h3), $g3.0$1)), $length), BV32_SUB(BV32_ADD(v2$1, $g3.0$1), 1bv32)), $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h3), $g3.0$1)), $length), BV32_SUB(BV32_ADD(v2$1, $g3.0$1), 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$sum_c(p27$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h3), $g3.0$2)), $length), BV32_SUB(BV32_ADD(v2$2, $g3.0$2), 1bv32)), $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h3), $g3.0$2)), $length), BV32_SUB(BV32_ADD(v2$2, $g3.0$2), 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sum_c"} true;
    v18$1 := (if p27$1 then $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h3), $g3.0$1)), $length), BV32_SUB(BV32_ADD(v2$1, $g3.0$1), 1bv32))] else v18$1);
    v18$2 := (if p27$2 then $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h3), $g3.0$2)), $length), BV32_SUB(BV32_ADD(v2$2, $g3.0$2), 1bv32))] else v18$2);
    $$private_sum_c_1$2bv32$1 := (if p27$1 then v18$1 else $$private_sum_c_1$2bv32$1);
    $$private_sum_c_1$2bv32$2 := (if p27$2 then v18$2 else $$private_sum_c_1$2bv32$2);
    v19$1 := (if p13$1 then BV32_SGE($length, BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 1bv32)) else v19$1);
    v19$2 := (if p13$2 then BV32_SGE($length, BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 1bv32)) else v19$2);
    p29$1 := (if p13$1 && v19$1 then v19$1 else p29$1);
    p29$2 := (if p13$2 && v19$2 then v19$2 else p29$2);
    v20$1 := (if p29$1 then BV32_SGT(BV32_ADD(BV32_ADD(BV32_SUB(BV32_SREM(BV32_ADD(BV32_SUB(BV32_ADD(v2$1, $h3), $g3.0$1), 17bv32), 16bv32), $h3), $g3.0$1), 31bv32), v2$1) else v20$1);
    v20$2 := (if p29$2 then BV32_SGT(BV32_ADD(BV32_ADD(BV32_SUB(BV32_SREM(BV32_ADD(BV32_SUB(BV32_ADD(v2$2, $h3), $g3.0$2), 17bv32), 16bv32), $h3), $g3.0$2), 31bv32), v2$2) else v20$2);
    p31$1 := (if p29$1 && v20$1 then v20$1 else p31$1);
    p31$2 := (if p29$2 && v20$2 then v20$2 else p31$2);
    p30$1 := (if p29$1 && !v20$1 then !v20$1 else p30$1);
    p30$2 := (if p29$2 && !v20$2 then !v20$2 else p30$2);
    $5$1 := (if p30$1 then v2$1 else $5$1);
    $5$2 := (if p30$2 then v2$2 else $5$2);
    $5$1 := (if p31$1 then BV32_ADD(BV32_ADD(BV32_SUB(BV32_SREM(BV32_ADD(BV32_SUB(BV32_ADD(v2$1, $h3), $g3.0$1), 17bv32), 16bv32), $h3), $g3.0$1), 31bv32) else $5$1);
    $5$2 := (if p31$2 then BV32_ADD(BV32_ADD(BV32_SUB(BV32_SREM(BV32_ADD(BV32_SUB(BV32_ADD(v2$2, $h3), $g3.0$2), 17bv32), 16bv32), $h3), $g3.0$2), 31bv32) else $5$2);
    $c1.0$1 := (if p29$1 then $5$1 else $c1.0$1);
    $c1.0$2 := (if p29$2 then $5$2 else $c1.0$2);
    p32$1 := (if p29$1 then true else p32$1);
    p32$2 := (if p29$2 then true else p32$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $34;

  $34:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel3.shared_c_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel3.shared_c_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel3.shared_c_1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p32$1 ==> p12$1;
    assert p32$2 ==> p12$2;
    assert p12$1 ==> p0$1;
    assert p12$2 ==> p0$2;
    assert {:block_sourceloc} {:sourceloc_num 40} p32$1 ==> true;
    v21$1 := (if p32$1 then BV32_SLT(BV32_ADD(BV32_ADD(BV32_SUB($length, $h3), $g3.0$1), 30bv32), 31bv32) else v21$1);
    v21$2 := (if p32$2 then BV32_SLT(BV32_ADD(BV32_ADD(BV32_SUB($length, $h3), $g3.0$2), 30bv32), 31bv32) else v21$2);
    p33$1 := false;
    p33$2 := false;
    p34$1 := false;
    p34$2 := false;
    p35$1 := false;
    p35$2 := false;
    p34$1 := (if p32$1 && v21$1 then v21$1 else p34$1);
    p34$2 := (if p32$2 && v21$2 then v21$2 else p34$2);
    p33$1 := (if p32$1 && !v21$1 then !v21$1 else p33$1);
    p33$2 := (if p32$2 && !v21$2 then !v21$2 else p33$2);
    $6$1 := (if p33$1 then 31bv32 else $6$1);
    $6$2 := (if p33$2 then 31bv32 else $6$2);
    $6$1 := (if p34$1 then BV32_ADD(BV32_ADD(BV32_SUB($length, $h3), $g3.0$1), 30bv32) else $6$1);
    $6$2 := (if p34$2 then BV32_ADD(BV32_ADD(BV32_SUB($length, $h3), $g3.0$2), 30bv32) else $6$2);
    v22$1 := (if p32$1 then BV32_SLE($c1.0$1, $6$1) else v22$1);
    v22$2 := (if p32$2 then BV32_SLE($c1.0$2, $6$2) else v22$2);
    p35$1 := (if p32$1 && v22$1 then v22$1 else p35$1);
    p35$2 := (if p32$2 && v22$2 then v22$2 else p35$2);
    p32$1 := (if p32$1 && !v22$1 then v22$1 else p32$1);
    p32$2 := (if p32$2 && !v22$2 then v22$2 else p32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v23$1 := (if p35$1 then _HAVOC_bv32$1 else v23$1);
    v23$2 := (if p35$2 then _HAVOC_bv32$2 else v23$2);
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$kernel3.shared_c_1(p35$1, BV32_ADD(BV32_MUL(v1$1, 32bv32), $c1.0$1), v23$1, $$kernel3.shared_c_1[1bv1][BV32_ADD(BV32_MUL(v1$1, 32bv32), $c1.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel3.shared_c_1(p35$2, BV32_ADD(BV32_MUL(v1$2, 32bv32), $c1.0$2));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$kernel3.shared_c_1(p35$2, BV32_ADD(BV32_MUL(v1$2, 32bv32), $c1.0$2), v23$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel3.shared_c_1"} true;
    $$kernel3.shared_c_1[1bv1][BV32_ADD(BV32_MUL(v1$1, 32bv32), $c1.0$1)] := (if p35$1 then v23$1 else $$kernel3.shared_c_1[1bv1][BV32_ADD(BV32_MUL(v1$1, 32bv32), $c1.0$1)]);
    $$kernel3.shared_c_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, 32bv32), $c1.0$2)] := (if p35$2 then v23$2 else $$kernel3.shared_c_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, 32bv32), $c1.0$2)]);
    $c1.0$1 := (if p35$1 then BV32_ADD($c1.0$1, 16bv32) else $c1.0$1);
    $c1.0$2 := (if p35$2 then BV32_ADD($c1.0$2, 16bv32) else $c1.0$2);
    p32$1 := (if p35$1 then true else p32$1);
    p32$2 := (if p35$2 then true else p32$2);
    goto $34.backedge, __partitioned_block_$34.tail_0;

  __partitioned_block_$34.tail_0:
    assume !p32$1 && !p32$2;
    v24$1 := (if p13$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$1), BV32_MUL(2bv32, $g1.0$1)), 3bv32)) else v24$1);
    v24$2 := (if p13$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$2), BV32_MUL(2bv32, $g1.0$2)), 3bv32)) else v24$2);
    p37$1 := (if p13$1 && v24$1 then v24$1 else p37$1);
    p37$2 := (if p13$2 && v24$2 then v24$2 else p37$2);
    v25$1 := (if p37$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($length, v2$1), $g3.0$1), 15bv32), $h3) else v25$1);
    v25$2 := (if p37$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($length, v2$2), $g3.0$2), 15bv32), $h3) else v25$2);
    p39$1 := (if p37$1 && v25$1 then v25$1 else p39$1);
    p39$2 := (if p37$2 && v25$2 then v25$2 else p39$2);
    v26$1 := (if p39$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$1), BV32_MUL(2bv32, $g3.0$1)), 1bv32)) else v26$1);
    v26$2 := (if p39$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$2), BV32_MUL(2bv32, $g3.0$2)), 1bv32)) else v26$2);
    p41$1 := (if p39$1 && v26$1 then v26$1 else p41$1);
    p41$2 := (if p39$2 && v26$2 then v26$2 else p41$2);
    v27$1 := (if p41$1 then BV32_SGE(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 15bv32), BV32_ADD(v1$1, $g1.0$1)) else v27$1);
    v27$2 := (if p41$2 then BV32_SGE(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 15bv32), BV32_ADD(v1$2, $g1.0$2)) else v27$2);
    p43$1 := (if p41$1 && v27$1 then v27$1 else p43$1);
    p43$2 := (if p41$2 && v27$2 then v27$2 else p43$2);
    v28$1 := (if p43$1 then BV32_SGE(BV32_ADD(BV32_ADD($length, v2$1), $g3.0$1), BV32_ADD($h3, 1bv32)) else v28$1);
    v28$2 := (if p43$2 then BV32_SGE(BV32_ADD(BV32_ADD($length, v2$2), $g3.0$2), BV32_ADD($h3, 1bv32)) else v28$2);
    p45$1 := (if p43$1 && v28$1 then v28$1 else p45$1);
    p45$2 := (if p43$2 && v28$2 then v28$2 else p45$2);
    v29$1 := (if p45$1 then BV32_SGE(BV32_ADD(v2$1, $g3.0$1), BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 1bv32)) else v29$1);
    v29$2 := (if p45$2 then BV32_SGE(BV32_ADD(v2$2, $g3.0$2), BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 1bv32)) else v29$2);
    p47$1 := (if p45$1 && v29$1 then v29$1 else p47$1);
    p47$2 := (if p45$2 && v29$2 then v29$2 else p47$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v30$1 := (if p47$1 then _HAVOC_bv32$1 else v30$1);
    v30$2 := (if p47$2 then _HAVOC_bv32$2 else v30$2);
    $$private_c_0$0bv32$1 := (if p47$1 then v30$1 else $$private_c_0$0bv32$1);
    $$private_c_0$0bv32$2 := (if p47$2 then v30$2 else $$private_c_0$0bv32$2);
    v31$1 := (if p43$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$1), BV32_MUL(2bv32, $g3.0$1)), 33bv32)) else v31$1);
    v31$2 := (if p43$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$2), BV32_MUL(2bv32, $g3.0$2)), 33bv32)) else v31$2);
    p49$1 := (if p43$1 && v31$1 then v31$1 else p49$1);
    p49$2 := (if p43$2 && v31$2 then v31$2 else p49$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v32$1 := (if p49$1 then _HAVOC_bv32$1 else v32$1);
    v32$2 := (if p49$2 then _HAVOC_bv32$2 else v32$2);
    $$private_c_0$1bv32$1 := (if p49$1 then v32$1 else $$private_c_0$1bv32$1);
    $$private_c_0$1bv32$2 := (if p49$2 then v32$2 else $$private_c_0$1bv32$2);
    goto __partitioned_block_$34.tail_1;

  __partitioned_block_$34.tail_1:
    call {:sourceloc_num 64} $bugle_barrier_duplicated_0(1bv1, 1bv1, p13$1, p13$2);
    v33$1 := (if p13$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$1), BV32_MUL(2bv32, $g1.0$1)), 3bv32)) else v33$1);
    v33$2 := (if p13$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$2), BV32_MUL(2bv32, $g1.0$2)), 3bv32)) else v33$2);
    p51$1 := (if p13$1 && v33$1 then v33$1 else p51$1);
    p51$2 := (if p13$2 && v33$2 then v33$2 else p51$2);
    v34$1 := (if p51$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($length, v2$1), $g3.0$1), 15bv32), $h3) else v34$1);
    v34$2 := (if p51$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($length, v2$2), $g3.0$2), 15bv32), $h3) else v34$2);
    p53$1 := (if p51$1 && v34$1 then v34$1 else p53$1);
    p53$2 := (if p51$2 && v34$2 then v34$2 else p53$2);
    v35$1 := (if p53$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$1), BV32_MUL(2bv32, $g3.0$1)), 1bv32)) else v35$1);
    v35$2 := (if p53$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$2), BV32_MUL(2bv32, $g3.0$2)), 1bv32)) else v35$2);
    p55$1 := (if p53$1 && v35$1 then v35$1 else p55$1);
    p55$2 := (if p53$2 && v35$2 then v35$2 else p55$2);
    v36$1 := (if p55$1 then BV32_SGE(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 15bv32), BV32_ADD(v1$1, $g1.0$1)) else v36$1);
    v36$2 := (if p55$2 then BV32_SGE(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 15bv32), BV32_ADD(v1$2, $g1.0$2)) else v36$2);
    p57$1 := (if p55$1 && v36$1 then v36$1 else p57$1);
    p57$2 := (if p55$2 && v36$2 then v36$2 else p57$2);
    v37$1 := (if p57$1 then BV32_SGE(BV32_ADD(BV32_ADD($length, v2$1), $g3.0$1), BV32_ADD($h3, 1bv32)) else v37$1);
    v37$2 := (if p57$2 then BV32_SGE(BV32_ADD(BV32_ADD($length, v2$2), $g3.0$2), BV32_ADD($h3, 1bv32)) else v37$2);
    p59$1 := (if p57$1 && v37$1 then v37$1 else p59$1);
    p59$2 := (if p57$2 && v37$2 then v37$2 else p59$2);
    v38$1 := (if p59$1 then BV32_SGE(BV32_ADD(v2$1, $g3.0$1), BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 1bv32)) else v38$1);
    v38$2 := (if p59$2 then BV32_SGE(BV32_ADD(v2$2, $g3.0$2), BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 1bv32)) else v38$2);
    p61$1 := (if p59$1 && v38$1 then v38$1 else p61$1);
    p61$2 := (if p59$2 && v38$2 then v38$2 else p61$2);
    v39$1 := (if p61$1 then $$private_sum_c_1$2bv32$1 else v39$1);
    v39$2 := (if p61$2 then $$private_sum_c_1$2bv32$2 else v39$2);
    v40$1 := (if p61$1 then $$private_c_0$0bv32$1 else v40$1);
    v40$2 := (if p61$2 then $$private_c_0$0bv32$2 else v40$2);
    call {:sourceloc} {:sourceloc_num 73} _LOG_READ_$$kernel3.shared_c_1(p61$1, BV32_ADD(BV32_MUL(v2$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$1), 31bv32)), $$kernel3.shared_c_1[1bv1][BV32_ADD(BV32_MUL(v2$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$1), 31bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 73} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 73} _CHECK_READ_$$kernel3.shared_c_1(p61$2, BV32_ADD(BV32_MUL(v2$2, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$2), 31bv32)), $$kernel3.shared_c_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$2), 31bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel3.shared_c_1"} true;
    v41$1 := (if p61$1 then $$kernel3.shared_c_1[1bv1][BV32_ADD(BV32_MUL(v2$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$1), 31bv32))] else v41$1);
    v41$2 := (if p61$2 then $$kernel3.shared_c_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$2), 31bv32))] else v41$2);
    $$private_sum_c_0$2bv32$1 := (if p61$1 then BV32_ADD(BV32_ADD(v39$1, v40$1), v41$1) else $$private_sum_c_0$2bv32$1);
    $$private_sum_c_0$2bv32$2 := (if p61$2 then BV32_ADD(BV32_ADD(v39$2, v40$2), v41$2) else $$private_sum_c_0$2bv32$2);
    v42$1 := (if p57$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$1), BV32_MUL(2bv32, $g3.0$1)), 33bv32)) else v42$1);
    v42$2 := (if p57$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$2), BV32_MUL(2bv32, $g3.0$2)), 33bv32)) else v42$2);
    p63$1 := (if p57$1 && v42$1 then v42$1 else p63$1);
    p63$2 := (if p57$2 && v42$2 then v42$2 else p63$2);
    v43$1 := (if p63$1 then $$private_sum_c_1$1bv32$1 else v43$1);
    v43$2 := (if p63$2 then $$private_sum_c_1$1bv32$2 else v43$2);
    v44$1 := (if p63$1 then $$private_c_0$1bv32$1 else v44$1);
    v44$2 := (if p63$2 then $$private_c_0$1bv32$2 else v44$2);
    call {:sourceloc} {:sourceloc_num 79} _LOG_READ_$$kernel3.shared_c_1(p63$1, BV32_ADD(BV32_MUL(BV32_ADD(v2$1, 16bv32), 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$1), 15bv32)), $$kernel3.shared_c_1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v2$1, 16bv32), 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$1), 15bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 79} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 79} _CHECK_READ_$$kernel3.shared_c_1(p63$2, BV32_ADD(BV32_MUL(BV32_ADD(v2$2, 16bv32), 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$2), 15bv32)), $$kernel3.shared_c_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v2$2, 16bv32), 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$2), 15bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel3.shared_c_1"} true;
    v45$1 := (if p63$1 then $$kernel3.shared_c_1[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v2$1, 16bv32), 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$1), 15bv32))] else v45$1);
    v45$2 := (if p63$2 then $$kernel3.shared_c_1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v2$2, 16bv32), 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$2), 15bv32))] else v45$2);
    $$private_sum_c_0$1bv32$1 := (if p63$1 then BV32_ADD(BV32_ADD(v43$1, v44$1), v45$1) else $$private_sum_c_0$1bv32$1);
    $$private_sum_c_0$1bv32$2 := (if p63$2 then BV32_ADD(BV32_ADD(v43$2, v44$2), v45$2) else $$private_sum_c_0$1bv32$2);
    goto __partitioned_block_$34.tail_2;

  __partitioned_block_$34.tail_2:
    call {:sourceloc_num 83} $bugle_barrier_duplicated_1(1bv1, 1bv1, p13$1, p13$2);
    v46$1 := (if p13$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$1), BV32_MUL(2bv32, $g1.0$1)), 3bv32)) else v46$1);
    v46$2 := (if p13$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v1$2), BV32_MUL(2bv32, $g1.0$2)), 3bv32)) else v46$2);
    p65$1 := (if p13$1 && v46$1 then v46$1 else p65$1);
    p65$2 := (if p13$2 && v46$2 then v46$2 else p65$2);
    v47$1 := (if p65$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($length, v2$1), $g3.0$1), 15bv32), $h3) else v47$1);
    v47$2 := (if p65$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD($length, v2$2), $g3.0$2), 15bv32), $h3) else v47$2);
    p67$1 := (if p65$1 && v47$1 then v47$1 else p67$1);
    p67$2 := (if p65$2 && v47$2 then v47$2 else p67$2);
    v48$1 := (if p67$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$1), BV32_MUL(2bv32, $g3.0$1)), 1bv32)) else v48$1);
    v48$2 := (if p67$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$2), BV32_MUL(2bv32, $g3.0$2)), 1bv32)) else v48$2);
    p69$1 := (if p67$1 && v48$1 then v48$1 else p69$1);
    p69$2 := (if p67$2 && v48$2 then v48$2 else p69$2);
    v49$1 := (if p69$1 then BV32_SGE(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 15bv32), BV32_ADD(v1$1, $g1.0$1)) else v49$1);
    v49$2 := (if p69$2 then BV32_SGE(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 15bv32), BV32_ADD(v1$2, $g1.0$2)) else v49$2);
    p71$1 := (if p69$1 && v49$1 then v49$1 else p71$1);
    p71$2 := (if p69$2 && v49$2 then v49$2 else p71$2);
    v50$1 := (if p71$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$1), BV32_MUL(2bv32, $g3.0$1)), 33bv32)) else v50$1);
    v50$2 := (if p71$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v2$2), BV32_MUL(2bv32, $g3.0$2)), 33bv32)) else v50$2);
    p73$1 := (if p71$1 && v50$1 then v50$1 else p73$1);
    p73$2 := (if p71$2 && v50$2 then v50$2 else p73$2);
    v51$1 := (if p73$1 then $$private_sum_c_0$1bv32$1 else v51$1);
    v51$2 := (if p73$2 then $$private_sum_c_0$1bv32$2 else v51$2);
    call {:sourceloc} {:sourceloc_num 90} _LOG_WRITE_$$sum_c(p73$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_SUB(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h3), $g3.0$1), 16bv32)), $length), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32)), v51$1, $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_SUB(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h3), $g3.0$1), 16bv32)), $length), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sum_c(p73$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_SUB(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h3), $g3.0$2), 16bv32)), $length), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 90} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 90} _CHECK_WRITE_$$sum_c(p73$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_SUB(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h3), $g3.0$2), 16bv32)), $length), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32)), v51$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sum_c"} true;
    $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_SUB(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h3), $g3.0$1), 16bv32)), $length), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32))] := (if p73$1 then v51$1 else $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_SUB(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h3), $g3.0$1), 16bv32)), $length), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32))]);
    $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_SUB(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h3), $g3.0$2), 16bv32)), $length), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32))] := (if p73$2 then v51$2 else $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_SUB(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h3), $g3.0$2), 16bv32)), $length), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32))]);
    v52$1 := (if p71$1 then BV32_SGE(BV32_ADD(BV32_ADD($length, v2$1), $g3.0$1), BV32_ADD($h3, 1bv32)) else v52$1);
    v52$2 := (if p71$2 then BV32_SGE(BV32_ADD(BV32_ADD($length, v2$2), $g3.0$2), BV32_ADD($h3, 1bv32)) else v52$2);
    p75$1 := (if p71$1 && v52$1 then v52$1 else p75$1);
    p75$2 := (if p71$2 && v52$2 then v52$2 else p75$2);
    v53$1 := (if p75$1 then BV32_SGE(BV32_ADD(v2$1, $g3.0$1), BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 1bv32)) else v53$1);
    v53$2 := (if p75$2 then BV32_SGE(BV32_ADD(v2$2, $g3.0$2), BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 1bv32)) else v53$2);
    p77$1 := (if p75$1 && v53$1 then v53$1 else p77$1);
    p77$2 := (if p75$2 && v53$2 then v53$2 else p77$2);
    v54$1 := (if p77$1 then $$private_sum_c_0$2bv32$1 else v54$1);
    v54$2 := (if p77$2 then $$private_sum_c_0$2bv32$2 else v54$2);
    call {:sourceloc} {:sourceloc_num 95} _LOG_WRITE_$$sum_c(p77$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h3), $g3.0$1)), $length), BV32_ADD(v2$1, $g3.0$1)), v54$1, $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h3), $g3.0$1)), $length), BV32_ADD(v2$1, $g3.0$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sum_c(p77$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h3), $g3.0$2)), $length), BV32_ADD(v2$2, $g3.0$2)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 95} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 95} _CHECK_WRITE_$$sum_c(p77$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h3), $g3.0$2)), $length), BV32_ADD(v2$2, $g3.0$2)), v54$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sum_c"} true;
    $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h3), $g3.0$1)), $length), BV32_ADD(v2$1, $g3.0$1))] := (if p77$1 then v54$1 else $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h3), $g3.0$1)), $length), BV32_ADD(v2$1, $g3.0$1))]);
    $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h3), $g3.0$2)), $length), BV32_ADD(v2$2, $g3.0$2))] := (if p77$2 then v54$2 else $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h3), $g3.0$2)), $length), BV32_ADD(v2$2, $g3.0$2))]);
    goto __partitioned_block_$34.tail_3;

  __partitioned_block_$34.tail_3:
    call {:sourceloc_num 98} $bugle_barrier_duplicated_2(1bv1, 1bv1, p13$1, p13$2);
    $g3.0$1 := (if p13$1 then BV32_ADD($g3.0$1, 8192bv32) else $g3.0$1);
    $g3.0$2 := (if p13$2 then BV32_ADD($g3.0$2, 8192bv32) else $g3.0$2);
    p12$1 := (if p13$1 then true else p12$1);
    p12$2 := (if p13$2 then true else p12$2);
    goto $18.backedge, $18.tail;

  $18.tail:
    assume !p12$1 && !p12$2;
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

  $18.backedge:
    assume {:backedge} p12$1 || p12$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $18;

  $34.backedge:
    assume {:backedge} p32$1 || p32$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $34;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 2bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel3.shared_c_1, $$sum_c, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel3.shared_c_1, $$sum_c, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel3.shared_c_1, $$sum_c, _TRACKING;



var $$private_c_0$1bv32$1: bv32;

var $$private_c_0$1bv32$2: bv32;

var $$private_c_0$0bv32$1: bv32;

var $$private_c_0$0bv32$2: bv32;

var $$private_sum_c_0$2bv32$1: bv32;

var $$private_sum_c_0$2bv32$2: bv32;

var $$private_sum_c_0$1bv32$1: bv32;

var $$private_sum_c_0$1bv32$2: bv32;

var $$private_sum_c_1$1bv32$1: bv32;

var $$private_sum_c_1$1bv32$2: bv32;

var $$private_sum_c_1$2bv32$1: bv32;

var $$private_sum_c_1$2bv32$2: bv32;

const _WATCHED_VALUE_$$c: bv32;

procedure {:inline 1} _LOG_READ_$$c(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$c;



implementation {:inline 1} _LOG_READ_$$c(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$c := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$c == _value then true else _READ_HAS_OCCURRED_$$c);
    return;
}



procedure _CHECK_READ_$$c(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "c"} {:array "$$c"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$c && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$c);
  requires {:source_name "c"} {:array "$$c"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$c && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$c: bool;

procedure {:inline 1} _LOG_WRITE_$$c(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$c, _WRITE_READ_BENIGN_FLAG_$$c;



implementation {:inline 1} _LOG_WRITE_$$c(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$c := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$c == _value then true else _WRITE_HAS_OCCURRED_$$c);
    _WRITE_READ_BENIGN_FLAG_$$c := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$c == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$c);
    return;
}



procedure _CHECK_WRITE_$$c(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "c"} {:array "$$c"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$c && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$c != _value);
  requires {:source_name "c"} {:array "$$c"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$c && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$c != _value);
  requires {:source_name "c"} {:array "$$c"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$c && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$c(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$c;



implementation {:inline 1} _LOG_ATOMIC_$$c(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$c := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$c);
    return;
}



procedure _CHECK_ATOMIC_$$c(_P: bool, _offset: bv32);
  requires {:source_name "c"} {:array "$$c"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$c && _WATCHED_OFFSET == _offset);
  requires {:source_name "c"} {:array "$$c"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$c && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$c(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$c;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$c(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$c := (if _P && _WRITE_HAS_OCCURRED_$$c && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$c);
    return;
}



const _WATCHED_VALUE_$$sum_c: bv32;

procedure {:inline 1} _LOG_READ_$$sum_c(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$sum_c;



implementation {:inline 1} _LOG_READ_$$sum_c(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sum_c := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum_c == _value then true else _READ_HAS_OCCURRED_$$sum_c);
    return;
}



procedure _CHECK_READ_$$sum_c(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sum_c"} {:array "$$sum_c"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sum_c && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sum_c);
  requires {:source_name "sum_c"} {:array "$$sum_c"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sum_c && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$sum_c: bool;

procedure {:inline 1} _LOG_WRITE_$$sum_c(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$sum_c, _WRITE_READ_BENIGN_FLAG_$$sum_c;



implementation {:inline 1} _LOG_WRITE_$$sum_c(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sum_c := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum_c == _value then true else _WRITE_HAS_OCCURRED_$$sum_c);
    _WRITE_READ_BENIGN_FLAG_$$sum_c := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum_c == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sum_c);
    return;
}



procedure _CHECK_WRITE_$$sum_c(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sum_c"} {:array "$$sum_c"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sum_c && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum_c != _value);
  requires {:source_name "sum_c"} {:array "$$sum_c"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sum_c && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sum_c != _value);
  requires {:source_name "sum_c"} {:array "$$sum_c"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sum_c && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$sum_c(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sum_c;



implementation {:inline 1} _LOG_ATOMIC_$$sum_c(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sum_c := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sum_c);
    return;
}



procedure _CHECK_ATOMIC_$$sum_c(_P: bool, _offset: bv32);
  requires {:source_name "sum_c"} {:array "$$sum_c"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sum_c && _WATCHED_OFFSET == _offset);
  requires {:source_name "sum_c"} {:array "$$sum_c"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sum_c && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sum_c(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sum_c;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sum_c(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sum_c := (if _P && _WRITE_HAS_OCCURRED_$$sum_c && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sum_c);
    return;
}



const _WATCHED_VALUE_$$kernel3.shared_c_1: bv32;

procedure {:inline 1} _LOG_READ_$$kernel3.shared_c_1(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$kernel3.shared_c_1;



implementation {:inline 1} _LOG_READ_$$kernel3.shared_c_1(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel3.shared_c_1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel3.shared_c_1 == _value then true else _READ_HAS_OCCURRED_$$kernel3.shared_c_1);
    return;
}



procedure _CHECK_READ_$$kernel3.shared_c_1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "shared_c_1"} {:array "$$kernel3.shared_c_1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel3.shared_c_1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel3.shared_c_1 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_c_1"} {:array "$$kernel3.shared_c_1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel3.shared_c_1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel3.shared_c_1: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel3.shared_c_1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$kernel3.shared_c_1, _WRITE_READ_BENIGN_FLAG_$$kernel3.shared_c_1;



implementation {:inline 1} _LOG_WRITE_$$kernel3.shared_c_1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel3.shared_c_1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel3.shared_c_1 == _value then true else _WRITE_HAS_OCCURRED_$$kernel3.shared_c_1);
    _WRITE_READ_BENIGN_FLAG_$$kernel3.shared_c_1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel3.shared_c_1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel3.shared_c_1);
    return;
}



procedure _CHECK_WRITE_$$kernel3.shared_c_1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "shared_c_1"} {:array "$$kernel3.shared_c_1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel3.shared_c_1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel3.shared_c_1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_c_1"} {:array "$$kernel3.shared_c_1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel3.shared_c_1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel3.shared_c_1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_c_1"} {:array "$$kernel3.shared_c_1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel3.shared_c_1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel3.shared_c_1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel3.shared_c_1;



implementation {:inline 1} _LOG_ATOMIC_$$kernel3.shared_c_1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel3.shared_c_1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel3.shared_c_1);
    return;
}



procedure _CHECK_ATOMIC_$$kernel3.shared_c_1(_P: bool, _offset: bv32);
  requires {:source_name "shared_c_1"} {:array "$$kernel3.shared_c_1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel3.shared_c_1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_c_1"} {:array "$$kernel3.shared_c_1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel3.shared_c_1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel3.shared_c_1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel3.shared_c_1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel3.shared_c_1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel3.shared_c_1 := (if _P && _WRITE_HAS_OCCURRED_$$kernel3.shared_c_1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel3.shared_c_1);
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel3.shared_c_1;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel3.shared_c_1;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel3.shared_c_1;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sum_c;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sum_c;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sum_c;
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
    havoc $$sum_c;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel3.shared_c_1;
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel3.shared_c_1;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel3.shared_c_1;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel3.shared_c_1;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sum_c;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sum_c;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sum_c;
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
    havoc $$sum_c;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel3.shared_c_1;
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel3.shared_c_1;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel3.shared_c_1;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel3.shared_c_1;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sum_c;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sum_c;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sum_c;
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
    havoc $$sum_c;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel3.shared_c_1;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}


