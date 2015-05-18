type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



var {:source_name "A"} {:global} $$A: [bv32]bv64;

axiom {:array_info "$$A"} {:global} {:elem_width 64} {:source_name "A"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$A: bool;

axiom {:array_info "$$private_A_0"} {:elem_width 64} {:source_name "private_A_0"} {:source_elem_width 64} {:source_dimensions "1,2"} true;

axiom {:array_info "$$private_A_1"} {:elem_width 64} {:source_name "private_A_1"} {:source_elem_width 64} {:source_dimensions "1,2"} true;

var {:source_name "shared_A_2"} {:group_shared} $$kernel0.shared_A_2: [bv1][bv32]bv64;

axiom {:array_info "$$kernel0.shared_A_2"} {:group_shared} {:elem_width 64} {:source_name "shared_A_2"} {:source_elem_width 64} {:source_dimensions "32,32"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _READ_HAS_OCCURRED_$$kernel0.shared_A_2: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_A_2: bool;

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

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel0"} {:kernel} $kernel0($n: bv32, $h0: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $n == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$A && !_WRITE_HAS_OCCURRED_$$A && !_ATOMIC_HAS_OCCURRED_$$A;
  requires !_READ_HAS_OCCURRED_$$kernel0.shared_A_2 && !_WRITE_HAS_OCCURRED_$$kernel0.shared_A_2 && !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_A_2;
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
  modifies $$kernel0.shared_A_2, _READ_HAS_OCCURRED_$$A, _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_A_2, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_A_2, $$A, _TRACKING, _READ_HAS_OCCURRED_$$kernel0.shared_A_2, _TRACKING, _WRITE_HAS_OCCURRED_$$A, _WRITE_READ_BENIGN_FLAG_$$A, _WRITE_READ_BENIGN_FLAG_$$A, _TRACKING;



implementation {:source_name "kernel0"} {:kernel} $kernel0($n: bv32, $h0: bv32)
{
  var $0$1: bv32;
  var $0$2: bv32;
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $2$1: bv32;
  var $2$2: bv32;
  var $c1.0$1: bv32;
  var $c1.0$2: bv32;
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
  var $8$1: bv32;
  var $8$2: bv32;
  var $9$1: bv32;
  var $9$2: bv32;
  var $10$1: bv32;
  var $10$2: bv32;
  var $11$1: bv32;
  var $11$2: bv32;
  var $12$1: bv32;
  var $12$2: bv32;
  var $g3.0$1: bv32;
  var $g3.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
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
  var v29$1: bool;
  var v29$2: bool;
  var v30$1: bv64;
  var v30$2: bv64;
  var v31$1: bool;
  var v31$2: bool;
  var v32$1: bv64;
  var v32$2: bv64;
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
  var v39$1: bv64;
  var v39$2: bv64;
  var v40$1: bool;
  var v40$2: bool;
  var v41$1: bv64;
  var v41$2: bv64;
  var v42$1: bool;
  var v42$2: bool;
  var v43$1: bool;
  var v43$2: bool;
  var v44$1: bool;
  var v44$2: bool;
  var v45$1: bool;
  var v45$2: bool;
  var v46$1: bool;
  var v46$2: bool;
  var v47$1: bool;
  var v47$2: bool;
  var v48$1: bv64;
  var v48$2: bv64;
  var v49$1: bv64;
  var v49$2: bv64;
  var v50$1: bv64;
  var v50$2: bv64;
  var v51$1: bool;
  var v51$2: bool;
  var v52$1: bv64;
  var v52$2: bv64;
  var v53$1: bv64;
  var v53$2: bv64;
  var v54$1: bv64;
  var v54$2: bv64;
  var v55$1: bool;
  var v55$2: bool;
  var v56$1: bool;
  var v56$2: bool;
  var v57$1: bool;
  var v57$2: bool;
  var v58$1: bool;
  var v58$2: bool;
  var v59$1: bool;
  var v59$2: bool;
  var v60$1: bool;
  var v60$2: bool;
  var v61$1: bv64;
  var v61$2: bv64;
  var v62$1: bool;
  var v62$2: bool;
  var v63$1: bv64;
  var v63$2: bv64;
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
  var p79$1: bool;
  var p79$2: bool;
  var p80$1: bool;
  var p80$2: bool;
  var p81$1: bool;
  var p81$2: bool;
  var p82$1: bool;
  var p82$2: bool;
  var p83$1: bool;
  var p83$2: bool;
  var p84$1: bool;
  var p84$2: bool;
  var p85$1: bool;
  var p85$2: bool;
  var p86$1: bool;
  var p86$2: bool;
  var p87$1: bool;
  var p87$2: bool;
  var p88$1: bool;
  var p88$2: bool;
  var p89$1: bool;
  var p89$2: bool;
  var p90$1: bool;
  var p90$2: bool;
  var p91$1: bool;
  var p91$2: bool;
  var p92$1: bool;
  var p92$2: bool;
  var p93$1: bool;
  var p93$2: bool;
  var p94$1: bool;
  var p94$2: bool;


  $0:
    v0$1 := group_id_x$1;
    v0$2 := group_id_x$2;
    v1$1 := group_id_y$1;
    v1$2 := group_id_y$2;
    v2$1 := local_id_x$1;
    v2$2 := local_id_x$2;
    v3$1 := local_id_y$1;
    v3$2 := local_id_y$2;
    v4$1 := BV32_SLT(BV32_SUB(BV32_ADD(BV32_MUL(4294967232bv32, v0$1), $h0), 62bv32), 0bv32);
    v4$2 := BV32_SLT(BV32_SUB(BV32_ADD(BV32_MUL(4294967232bv32, v0$2), $h0), 62bv32), 0bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p0$1 := (if v4$1 then v4$1 else p0$1);
    p0$2 := (if v4$2 then v4$2 else p0$2);
    p1$1 := (if !v4$1 then !v4$1 else p1$1);
    p1$2 := (if !v4$2 then !v4$2 else p1$2);
    $0$1 := (if p0$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_MUL(4294967232bv32, v0$1), $h0), 62bv32)), 16384bv32), 1bv32), 16384bv32)) else $0$1);
    $0$2 := (if p0$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_MUL(4294967232bv32, v0$2), $h0), 62bv32)), 16384bv32), 1bv32), 16384bv32)) else $0$2);
    $0$1 := (if p1$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_MUL(4294967232bv32, v0$1), $h0), 62bv32), 16384bv32) else $0$1);
    $0$2 := (if p1$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_MUL(4294967232bv32, v0$2), $h0), 62bv32), 16384bv32) else $0$2);
    $g1.0$1 := BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $0$1)), 8192bv32);
    $g1.0$2 := BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $0$2)), 8192bv32);
    p2$1 := true;
    p2$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $4;

  $4:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b105 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2 ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 32bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b104 ==> _READ_HAS_OCCURRED_$$kernel0.shared_A_2 ==> _WATCHED_OFFSET == BV32_ADD(BV32_MUL(local_id_x$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, local_id_x$1), 31bv32)) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(local_id_x$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, local_id_x$1), 31bv32));
    assert {:tag "nowrite"} _b103 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_A_2;
    assert {:tag "noread"} _b102 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_A_2;
    assert {:tag "nowrite"} _b101 ==> !_WRITE_HAS_OCCURRED_$$A;
    assert {:tag "noread"} _b100 ==> !_READ_HAS_OCCURRED_$$A;
    assert {:tag "predicatedEquality"} _b99 ==> p2$1 && p2$2 ==> v63$1 == v63$2;
    assert {:tag "predicatedEquality"} _b98 ==> p2$1 && p2$2 ==> v62$1 == v62$2;
    assert {:tag "predicatedEquality"} _b97 ==> p2$1 && p2$2 ==> v61$1 == v61$2;
    assert {:tag "predicatedEquality"} _b96 ==> p2$1 && p2$2 ==> v60$1 == v60$2;
    assert {:tag "predicatedEquality"} _b95 ==> p2$1 && p2$2 ==> v59$1 == v59$2;
    assert {:tag "predicatedEquality"} _b94 ==> p2$1 && p2$2 ==> v58$1 == v58$2;
    assert {:tag "predicatedEquality"} _b93 ==> p2$1 && p2$2 ==> v57$1 == v57$2;
    assert {:tag "predicatedEquality"} _b92 ==> p2$1 && p2$2 ==> v56$1 == v56$2;
    assert {:tag "predicatedEquality"} _b91 ==> p2$1 && p2$2 ==> v55$1 == v55$2;
    assert {:tag "predicatedEquality"} _b90 ==> p2$1 && p2$2 ==> v54$1 == v54$2;
    assert {:tag "predicatedEquality"} _b89 ==> p2$1 && p2$2 ==> v53$1 == v53$2;
    assert {:tag "predicatedEquality"} _b88 ==> p2$1 && p2$2 ==> v52$1 == v52$2;
    assert {:tag "predicatedEquality"} _b87 ==> p2$1 && p2$2 ==> v51$1 == v51$2;
    assert {:tag "predicatedEquality"} _b86 ==> p2$1 && p2$2 ==> v50$1 == v50$2;
    assert {:tag "predicatedEquality"} _b85 ==> p2$1 && p2$2 ==> v49$1 == v49$2;
    assert {:tag "predicatedEquality"} _b84 ==> p2$1 && p2$2 ==> v48$1 == v48$2;
    assert {:tag "predicatedEquality"} _b83 ==> p2$1 && p2$2 ==> v47$1 == v47$2;
    assert {:tag "predicatedEquality"} _b82 ==> p2$1 && p2$2 ==> v46$1 == v46$2;
    assert {:tag "predicatedEquality"} _b81 ==> p2$1 && p2$2 ==> v45$1 == v45$2;
    assert {:tag "predicatedEquality"} _b80 ==> p2$1 && p2$2 ==> v44$1 == v44$2;
    assert {:tag "predicatedEquality"} _b79 ==> p2$1 && p2$2 ==> v43$1 == v43$2;
    assert {:tag "predicatedEquality"} _b78 ==> p2$1 && p2$2 ==> v42$1 == v42$2;
    assert {:tag "predicatedEquality"} _b77 ==> p2$1 && p2$2 ==> v41$1 == v41$2;
    assert {:tag "predicatedEquality"} _b76 ==> p2$1 && p2$2 ==> v40$1 == v40$2;
    assert {:tag "predicatedEquality"} _b75 ==> p2$1 && p2$2 ==> v39$1 == v39$2;
    assert {:tag "predicatedEquality"} _b74 ==> p2$1 && p2$2 ==> v38$1 == v38$2;
    assert {:tag "predicatedEquality"} _b73 ==> p2$1 && p2$2 ==> v37$1 == v37$2;
    assert {:tag "predicatedEquality"} _b72 ==> p2$1 && p2$2 ==> v36$1 == v36$2;
    assert {:tag "predicatedEquality"} _b71 ==> p2$1 && p2$2 ==> v35$1 == v35$2;
    assert {:tag "predicatedEquality"} _b70 ==> p2$1 && p2$2 ==> v34$1 == v34$2;
    assert {:tag "predicatedEquality"} _b69 ==> p2$1 && p2$2 ==> v33$1 == v33$2;
    assert {:tag "predicatedEquality"} _b68 ==> p2$1 && p2$2 ==> v32$1 == v32$2;
    assert {:tag "predicatedEquality"} _b67 ==> p2$1 && p2$2 ==> v31$1 == v31$2;
    assert {:tag "predicatedEquality"} _b66 ==> p2$1 && p2$2 ==> v30$1 == v30$2;
    assert {:tag "predicatedEquality"} _b65 ==> p2$1 && p2$2 ==> v29$1 == v29$2;
    assert {:tag "predicatedEquality"} _b64 ==> p2$1 && p2$2 ==> v28$1 == v28$2;
    assert {:tag "predicatedEquality"} _b63 ==> p2$1 && p2$2 ==> v27$1 == v27$2;
    assert {:tag "predicatedEquality"} _b62 ==> p2$1 && p2$2 ==> v26$1 == v26$2;
    assert {:tag "predicatedEquality"} _b61 ==> p2$1 && p2$2 ==> v25$1 == v25$2;
    assert {:tag "predicatedEquality"} _b60 ==> p2$1 && p2$2 ==> v24$1 == v24$2;
    assert {:tag "predicatedEquality"} _b59 ==> p2$1 && p2$2 ==> v23$1 == v23$2;
    assert {:tag "predicatedEquality"} _b58 ==> p2$1 && p2$2 ==> v22$1 == v22$2;
    assert {:tag "predicatedEquality"} _b57 ==> p2$1 && p2$2 ==> v21$1 == v21$2;
    assert {:tag "predicatedEquality"} _b56 ==> p2$1 && p2$2 ==> v20$1 == v20$2;
    assert {:tag "predicatedEquality"} _b55 ==> p2$1 && p2$2 ==> v19$1 == v19$2;
    assert {:tag "predicatedEquality"} _b54 ==> p2$1 && p2$2 ==> v18$1 == v18$2;
    assert {:tag "predicatedEquality"} _b53 ==> p2$1 && p2$2 ==> v17$1 == v17$2;
    assert {:tag "predicatedEquality"} _b52 ==> p2$1 && p2$2 ==> v16$1 == v16$2;
    assert {:tag "predicatedEquality"} _b51 ==> p2$1 && p2$2 ==> v15$1 == v15$2;
    assert {:tag "predicatedEquality"} _b50 ==> p2$1 && p2$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b49 ==> p2$1 && p2$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b48 ==> p2$1 && p2$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b47 ==> p2$1 && p2$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b46 ==> p2$1 && p2$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b45 ==> p2$1 && p2$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b44 ==> p2$1 && p2$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b43 ==> p2$1 && p2$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b42 ==> p2$1 && p2$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b41 ==> p2$1 && p2$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b40 ==> p2$1 && p2$2 ==> $g3.0$1 == $g3.0$2;
    assert {:tag "predicatedEquality"} _b39 ==> p2$1 && p2$2 ==> $12$1 == $12$2;
    assert {:tag "predicatedEquality"} _b38 ==> p2$1 && p2$2 ==> $11$1 == $11$2;
    assert {:tag "predicatedEquality"} _b37 ==> p2$1 && p2$2 ==> $10$1 == $10$2;
    assert {:tag "predicatedEquality"} _b36 ==> p2$1 && p2$2 ==> $9$1 == $9$2;
    assert {:tag "predicatedEquality"} _b35 ==> p2$1 && p2$2 ==> $8$1 == $8$2;
    assert {:tag "predicatedEquality"} _b34 ==> p2$1 && p2$2 ==> $7$1 == $7$2;
    assert {:tag "predicatedEquality"} _b33 ==> p2$1 && p2$2 ==> $6$1 == $6$2;
    assert {:tag "predicatedEquality"} _b32 ==> p2$1 && p2$2 ==> $5$1 == $5$2;
    assert {:tag "predicatedEquality"} _b31 ==> p2$1 && p2$2 ==> $4$1 == $4$2;
    assert {:tag "predicatedEquality"} _b30 ==> p2$1 && p2$2 ==> $3$1 == $3$2;
    assert {:tag "predicatedEquality"} _b29 ==> p2$1 && p2$2 ==> $c1.0$1 == $c1.0$2;
    assert {:tag "predicatedEquality"} _b28 ==> p2$1 && p2$2 ==> $2$1 == $2$2;
    assert {:tag "predicatedEquality"} _b27 ==> p2$1 && p2$2 ==> $1$1 == $1$2;
    assert {:tag "predicatedEquality"} _b26 ==> p2$1 && p2$2 ==> $g1.0$1 == $g1.0$2;
    assert {:tag "loopPredicateEquality"} _b25 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p2$1 == p2$2;
    assert {:tag "loopPredicateEquality"} _b24 ==> p2$1 == p2$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_A_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_A_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b4 ==> BV32_SLT(BV32_SUB($n, 1bv32), $h0) ==> p2$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b4 ==> BV32_SLT(BV32_SUB($n, 1bv32), $h0) ==> p2$2;
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b3 ==> BV32_UGE($g1.0$1, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $0$1)), 8192bv32));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b3 ==> BV32_UGE($g1.0$2, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $0$2)), 8192bv32));
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b2 ==> BV32_ULE($g1.0$1, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $0$1)), 8192bv32));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b2 ==> BV32_ULE($g1.0$2, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $0$2)), 8192bv32));
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b1 ==> BV32_SGE($g1.0$1, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $0$1)), 8192bv32));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b1 ==> BV32_SGE($g1.0$2, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $0$2)), 8192bv32));
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b0 ==> BV32_SLE($g1.0$1, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $0$1)), 8192bv32));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b0 ==> BV32_SLE($g1.0$2, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $0$2)), 8192bv32));
    assert {:block_sourceloc} {:sourceloc_num 5} p2$1 ==> true;
    v5$1 := (if p2$1 then BV32_SLT(BV32_SUB($n, 1bv32), $h0) else v5$1);
    v5$2 := (if p2$2 then BV32_SLT(BV32_SUB($n, 1bv32), $h0) else v5$2);
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
    p94$1 := false;
    p94$2 := false;
    p4$1 := (if p2$1 && v5$1 then v5$1 else p4$1);
    p4$2 := (if p2$2 && v5$2 then v5$2 else p4$2);
    p3$1 := (if p2$1 && !v5$1 then !v5$1 else p3$1);
    p3$2 := (if p2$2 && !v5$2 then !v5$2 else p3$2);
    $1$1 := (if p3$1 then $h0 else $1$1);
    $1$2 := (if p3$2 then $h0 else $1$2);
    $1$1 := (if p4$1 then BV32_SUB($n, 1bv32) else $1$1);
    $1$2 := (if p4$2 then BV32_SUB($n, 1bv32) else $1$2);
    v6$1 := (if p2$1 then BV32_SLE($g1.0$1, $1$1) else v6$1);
    v6$2 := (if p2$2 then BV32_SLE($g1.0$2, $1$2) else v6$2);
    p5$1 := (if p2$1 && v6$1 then v6$1 else p5$1);
    p5$2 := (if p2$2 && v6$2 then v6$2 else p5$2);
    p2$1 := (if p2$1 && !v6$1 then v6$1 else p2$1);
    p2$2 := (if p2$2 && !v6$2 then v6$2 else p2$2);
    v7$1 := (if p5$1 then BV32_SGE(BV32_ADD(BV32_ADD($n, $g1.0$1), 60bv32), BV32_ADD(BV32_SREM(BV32_SUB(BV32_SUB($n, BV32_MUL(32bv32, v1$1)), 1bv32), 8192bv32), $h0)) else v7$1);
    v7$2 := (if p5$2 then BV32_SGE(BV32_ADD(BV32_ADD($n, $g1.0$2), 60bv32), BV32_ADD(BV32_SREM(BV32_SUB(BV32_SUB($n, BV32_MUL(32bv32, v1$2)), 1bv32), 8192bv32), $h0)) else v7$2);
    p7$1 := (if p5$1 && v7$1 then v7$1 else p7$1);
    p7$2 := (if p5$2 && v7$2 then v7$2 else p7$2);
    v8$1 := (if p7$1 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, $n), 28bv32), BV32_ADD(BV32_SREM(BV32_SUB(BV32_SUB($n, BV32_MUL(32bv32, v1$1)), 1bv32), 8192bv32), $h0)) else v8$1);
    v8$2 := (if p7$2 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, $n), 28bv32), BV32_ADD(BV32_SREM(BV32_SUB(BV32_SUB($n, BV32_MUL(32bv32, v1$2)), 1bv32), 8192bv32), $h0)) else v8$2);
    p9$1 := (if p7$1 && v8$1 then v8$1 else p9$1);
    p9$2 := (if p7$2 && v8$2 then v8$2 else p9$2);
    v9$1 := (if p9$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v2$1, $g1.0$1), 1bv32)) else v9$1);
    v9$2 := (if p9$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v2$2, $g1.0$2), 1bv32)) else v9$2);
    p11$1 := (if p9$1 && v9$1 then v9$1 else p11$1);
    p11$2 := (if p9$2 && v9$2 then v9$2 else p11$2);
    v10$1 := (if p11$1 then BV32_SGT(BV32_ADD(BV32_ADD(BV32_SUB(BV32_SREM(BV32_ADD(BV32_SUB(BV32_ADD(v3$1, $h0), $g1.0$1), 17bv32), 16bv32), $h0), $g1.0$1), 31bv32), v3$1) else v10$1);
    v10$2 := (if p11$2 then BV32_SGT(BV32_ADD(BV32_ADD(BV32_SUB(BV32_SREM(BV32_ADD(BV32_SUB(BV32_ADD(v3$2, $h0), $g1.0$2), 17bv32), 16bv32), $h0), $g1.0$2), 31bv32), v3$2) else v10$2);
    p13$1 := (if p11$1 && v10$1 then v10$1 else p13$1);
    p13$2 := (if p11$2 && v10$2 then v10$2 else p13$2);
    p12$1 := (if p11$1 && !v10$1 then !v10$1 else p12$1);
    p12$2 := (if p11$2 && !v10$2 then !v10$2 else p12$2);
    $2$1 := (if p12$1 then v3$1 else $2$1);
    $2$2 := (if p12$2 then v3$2 else $2$2);
    $2$1 := (if p13$1 then BV32_ADD(BV32_ADD(BV32_SUB(BV32_SREM(BV32_ADD(BV32_SUB(BV32_ADD(v3$1, $h0), $g1.0$1), 17bv32), 16bv32), $h0), $g1.0$1), 31bv32) else $2$1);
    $2$2 := (if p13$2 then BV32_ADD(BV32_ADD(BV32_SUB(BV32_SREM(BV32_ADD(BV32_SUB(BV32_ADD(v3$2, $h0), $g1.0$2), 17bv32), 16bv32), $h0), $g1.0$2), 31bv32) else $2$2);
    $c1.0$1 := (if p11$1 then $2$1 else $c1.0$1);
    $c1.0$2 := (if p11$2 then $2$2 else $c1.0$2);
    p14$1 := (if p11$1 then true else p14$1);
    p14$2 := (if p11$2 then true else p14$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $15;

  $15:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "accessBreak"} _b107 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2 ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 32bv32);
    assert {:tag "accessBreak"} _b106 ==> _READ_HAS_OCCURRED_$$A ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, $n);
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_A_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_A_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p14$1 ==> p2$1;
    assert p14$2 ==> p2$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b23 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2 ==> BV32_SLE($g1.0$1, $1$1) && BV32_SGE(BV32_ADD(BV32_ADD($n, $g1.0$1), 60bv32), BV32_ADD(BV32_SREM(BV32_SUB(BV32_SUB($n, BV32_MUL(32bv32, group_id_y$1)), 1bv32), 8192bv32), $h0)) && BV32_SGE(BV32_ADD(BV32_MUL(2bv32, $n), 28bv32), BV32_ADD(BV32_SREM(BV32_SUB(BV32_SUB($n, BV32_MUL(32bv32, group_id_y$1)), 1bv32), 8192bv32), $h0)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p14$1 ==> _b22 ==> p14$1 ==> BV32_SLE($g1.0$1, $1$1) && BV32_SGE(BV32_ADD(BV32_ADD($n, $g1.0$1), 60bv32), BV32_ADD(BV32_SREM(BV32_SUB(BV32_SUB($n, BV32_MUL(32bv32, group_id_y$1)), 1bv32), 8192bv32), $h0)) && BV32_SGE(BV32_ADD(BV32_MUL(2bv32, $n), 28bv32), BV32_ADD(BV32_SREM(BV32_SUB(BV32_SUB($n, BV32_MUL(32bv32, group_id_y$1)), 1bv32), 8192bv32), $h0)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p14$2 ==> _b22 ==> p14$2 ==> BV32_SLE($g1.0$2, $1$2) && BV32_SGE(BV32_ADD(BV32_ADD($n, $g1.0$2), 60bv32), BV32_ADD(BV32_SREM(BV32_SUB(BV32_SUB($n, BV32_MUL(32bv32, group_id_y$2)), 1bv32), 8192bv32), $h0)) && BV32_SGE(BV32_ADD(BV32_MUL(2bv32, $n), 28bv32), BV32_ADD(BV32_SREM(BV32_SUB(BV32_SUB($n, BV32_MUL(32bv32, group_id_y$2)), 1bv32), 8192bv32), $h0)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$2, $g1.0$2), 1bv32));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b21 ==> BV32_SLE($g1.0$1, $1$1) && BV32_SGE(BV32_ADD(BV32_ADD($n, $g1.0$1), 60bv32), BV32_ADD(BV32_SREM(BV32_SUB(BV32_SUB($n, BV32_MUL(32bv32, group_id_y$1)), 1bv32), 8192bv32), $h0)) && BV32_SGE(BV32_ADD(BV32_MUL(2bv32, $n), 28bv32), BV32_ADD(BV32_SREM(BV32_SUB(BV32_SUB($n, BV32_MUL(32bv32, group_id_y$1)), 1bv32), 8192bv32), $h0)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32)) && BV32_SLT(31bv32, BV32_ADD(BV32_ADD(BV32_SUB($n, $h0), $g1.0$1), 30bv32)) ==> p14$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b21 ==> BV32_SLE($g1.0$2, $1$2) && BV32_SGE(BV32_ADD(BV32_ADD($n, $g1.0$2), 60bv32), BV32_ADD(BV32_SREM(BV32_SUB(BV32_SUB($n, BV32_MUL(32bv32, group_id_y$2)), 1bv32), 8192bv32), $h0)) && BV32_SGE(BV32_ADD(BV32_MUL(2bv32, $n), 28bv32), BV32_ADD(BV32_SREM(BV32_SUB(BV32_SUB($n, BV32_MUL(32bv32, group_id_y$2)), 1bv32), 8192bv32), $h0)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$2, $g1.0$2), 1bv32)) && BV32_SLT(31bv32, BV32_ADD(BV32_ADD(BV32_SUB($n, $h0), $g1.0$2), 30bv32)) ==> p14$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b20 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v2$1, $g1.0$1), 1bv32)) ==> !_READ_HAS_OCCURRED_$$A;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b19 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v2$1, $g1.0$1), 1bv32)) ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_A_2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b18 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v2$1, $g1.0$1), 1bv32)) ==> !p14$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b18 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v2$2, $g1.0$2), 1bv32)) ==> !p14$2;
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b17 ==> BV32_UGE($c1.0$1, $2$1);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b17 ==> BV32_UGE($c1.0$2, $2$2);
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b16 ==> BV32_ULE($c1.0$1, $2$1);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b16 ==> BV32_ULE($c1.0$2, $2$2);
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b15 ==> BV32_SGE($c1.0$1, $2$1);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b15 ==> BV32_SGE($c1.0$2, $2$2);
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b14 ==> BV32_SLE($c1.0$1, $2$1);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b14 ==> BV32_SLE($c1.0$2, $2$2);
    assert {:block_sourceloc} {:sourceloc_num 16} p14$1 ==> true;
    v11$1 := (if p14$1 then BV32_SLT(31bv32, BV32_ADD(BV32_ADD(BV32_SUB($n, $h0), $g1.0$1), 30bv32)) else v11$1);
    v11$2 := (if p14$2 then BV32_SLT(31bv32, BV32_ADD(BV32_ADD(BV32_SUB($n, $h0), $g1.0$2), 30bv32)) else v11$2);
    p15$1 := false;
    p15$2 := false;
    p16$1 := false;
    p16$2 := false;
    p17$1 := false;
    p17$2 := false;
    p16$1 := (if p14$1 && v11$1 then v11$1 else p16$1);
    p16$2 := (if p14$2 && v11$2 then v11$2 else p16$2);
    p15$1 := (if p14$1 && !v11$1 then !v11$1 else p15$1);
    p15$2 := (if p14$2 && !v11$2 then !v11$2 else p15$2);
    $3$1 := (if p15$1 then BV32_ADD(BV32_ADD(BV32_SUB($n, $h0), $g1.0$1), 30bv32) else $3$1);
    $3$2 := (if p15$2 then BV32_ADD(BV32_ADD(BV32_SUB($n, $h0), $g1.0$2), 30bv32) else $3$2);
    $3$1 := (if p16$1 then 31bv32 else $3$1);
    $3$2 := (if p16$2 then 31bv32 else $3$2);
    v12$1 := (if p14$1 then BV32_SLE($c1.0$1, $3$1) else v12$1);
    v12$2 := (if p14$2 then BV32_SLE($c1.0$2, $3$2) else v12$2);
    p17$1 := (if p14$1 && v12$1 then v12$1 else p17$1);
    p17$2 := (if p14$2 && v12$2 then v12$2 else p17$2);
    p14$1 := (if p14$1 && !v12$1 then v12$1 else p14$1);
    p14$2 := (if p14$2 && !v12$2 then v12$2 else p14$2);
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$A(p17$1, BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_SUB(BV32_ADD(BV32_SUB($h0, $g1.0$1), $c1.0$1), 31bv32)), $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_SUB(BV32_ADD(BV32_SUB($h0, $g1.0$1), $c1.0$1), 31bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$A(p17$2, BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_SUB(BV32_ADD(BV32_SUB($h0, $g1.0$2), $c1.0$2), 31bv32)), $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_SUB(BV32_ADD(BV32_SUB($h0, $g1.0$2), $c1.0$2), 31bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$A"} true;
    v13$1 := (if p17$1 then $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_SUB(BV32_ADD(BV32_SUB($h0, $g1.0$1), $c1.0$1), 31bv32))] else v13$1);
    v13$2 := (if p17$2 then $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_SUB(BV32_ADD(BV32_SUB($h0, $g1.0$2), $c1.0$2), 31bv32))] else v13$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$kernel0.shared_A_2(p17$1, BV32_ADD(BV32_MUL(v2$1, 32bv32), $c1.0$1), v13$1, $$kernel0.shared_A_2[1bv1][BV32_ADD(BV32_MUL(v2$1, 32bv32), $c1.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_A_2(p17$2, BV32_ADD(BV32_MUL(v2$2, 32bv32), $c1.0$2));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$kernel0.shared_A_2(p17$2, BV32_ADD(BV32_MUL(v2$2, 32bv32), $c1.0$2), v13$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel0.shared_A_2"} true;
    $$kernel0.shared_A_2[1bv1][BV32_ADD(BV32_MUL(v2$1, 32bv32), $c1.0$1)] := (if p17$1 then v13$1 else $$kernel0.shared_A_2[1bv1][BV32_ADD(BV32_MUL(v2$1, 32bv32), $c1.0$1)]);
    $$kernel0.shared_A_2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 32bv32), $c1.0$2)] := (if p17$2 then v13$2 else $$kernel0.shared_A_2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 32bv32), $c1.0$2)]);
    $c1.0$1 := (if p17$1 then BV32_ADD($c1.0$1, 16bv32) else $c1.0$1);
    $c1.0$2 := (if p17$2 then BV32_ADD($c1.0$2, 16bv32) else $c1.0$2);
    p14$1 := (if p17$1 then true else p14$1);
    p14$2 := (if p17$2 then true else p14$2);
    goto $15.backedge, $15.tail;

  $15.tail:
    assume !p14$1 && !p14$2;
    v14$1 := (if p5$1 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$1)), $h0), 30bv32), 0bv32) else v14$1);
    v14$2 := (if p5$2 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$2)), $h0), 30bv32), 0bv32) else v14$2);
    p19$1 := (if p5$1 && v14$1 then v14$1 else p19$1);
    p19$2 := (if p5$2 && v14$2 then v14$2 else p19$2);
    p18$1 := (if p5$1 && !v14$1 then !v14$1 else p18$1);
    p18$2 := (if p5$2 && !v14$2 then !v14$2 else p18$2);
    $4$1 := (if p18$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$1)), $h0), 30bv32), 8192bv32) else $4$1);
    $4$2 := (if p18$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$2)), $h0), 30bv32), 8192bv32) else $4$2);
    $4$1 := (if p19$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$1)), $h0), 30bv32)), 8192bv32), 1bv32), 8192bv32)) else $4$1);
    $4$2 := (if p19$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$2)), $h0), 30bv32)), 8192bv32), 1bv32), 8192bv32)) else $4$2);
    v15$1 := (if p5$1 then BV32_SGT(BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v1$1), BV32_MUL(8192bv32, $4$1)), 8192bv32), BV32_MUL(32bv32, v1$1)) else v15$1);
    v15$2 := (if p5$2 then BV32_SGT(BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v1$2), BV32_MUL(8192bv32, $4$2)), 8192bv32), BV32_MUL(32bv32, v1$2)) else v15$2);
    p21$1 := (if p5$1 && v15$1 then v15$1 else p21$1);
    p21$2 := (if p5$2 && v15$2 then v15$2 else p21$2);
    p20$1 := (if p5$1 && !v15$1 then !v15$1 else p20$1);
    p20$2 := (if p5$2 && !v15$2 then !v15$2 else p20$2);
    $6$1 := (if p20$1 then BV32_MUL(32bv32, v1$1) else $6$1);
    $6$2 := (if p20$2 then BV32_MUL(32bv32, v1$2) else $6$2);
    v16$1 := (if p21$1 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$1)), $h0), 30bv32), 0bv32) else v16$1);
    v16$2 := (if p21$2 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$2)), $h0), 30bv32), 0bv32) else v16$2);
    p23$1 := (if p21$1 && v16$1 then v16$1 else p23$1);
    p23$2 := (if p21$2 && v16$2 then v16$2 else p23$2);
    p22$1 := (if p21$1 && !v16$1 then !v16$1 else p22$1);
    p22$2 := (if p21$2 && !v16$2 then !v16$2 else p22$2);
    $5$1 := (if p22$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$1)), $h0), 30bv32), 8192bv32) else $5$1);
    $5$2 := (if p22$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$2)), $h0), 30bv32), 8192bv32) else $5$2);
    $5$1 := (if p23$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$1)), $h0), 30bv32)), 8192bv32), 1bv32), 8192bv32)) else $5$1);
    $5$2 := (if p23$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$2)), $h0), 30bv32)), 8192bv32), 1bv32), 8192bv32)) else $5$2);
    $6$1 := (if p21$1 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v1$1), BV32_MUL(8192bv32, $5$1)), 8192bv32) else $6$1);
    $6$2 := (if p21$2 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v1$2), BV32_MUL(8192bv32, $5$2)), 8192bv32) else $6$2);
    v17$1 := (if p5$1 then BV32_SLT(BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v1$1), $h0), $g1.0$1), 62bv32), 0bv32) else v17$1);
    v17$2 := (if p5$2 then BV32_SLT(BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v1$2), $h0), $g1.0$2), 62bv32), 0bv32) else v17$2);
    p25$1 := (if p5$1 && v17$1 then v17$1 else p25$1);
    p25$2 := (if p5$2 && v17$2 then v17$2 else p25$2);
    p24$1 := (if p5$1 && !v17$1 then !v17$1 else p24$1);
    p24$2 := (if p5$2 && !v17$2 then !v17$2 else p24$2);
    $7$1 := (if p24$1 then BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v1$1), $h0), $g1.0$1), 62bv32), 8192bv32) else $7$1);
    $7$2 := (if p24$2 then BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v1$2), $h0), $g1.0$2), 62bv32), 8192bv32) else $7$2);
    $7$1 := (if p25$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v1$1), $h0), $g1.0$1), 62bv32)), 8192bv32), 1bv32), 8192bv32)) else $7$1);
    $7$2 := (if p25$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v1$2), $h0), $g1.0$2), 62bv32)), 8192bv32), 1bv32), 8192bv32)) else $7$2);
    v18$1 := (if p5$1 then BV32_SGT($6$1, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v1$1), BV32_MUL(8192bv32, $7$1)), 8192bv32)) else v18$1);
    v18$2 := (if p5$2 then BV32_SGT($6$2, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v1$2), BV32_MUL(8192bv32, $7$2)), 8192bv32)) else v18$2);
    p26$1 := (if p5$1 && v18$1 then v18$1 else p26$1);
    p26$2 := (if p5$2 && v18$2 then v18$2 else p26$2);
    p33$1 := (if p5$1 && !v18$1 then !v18$1 else p33$1);
    p33$2 := (if p5$2 && !v18$2 then !v18$2 else p33$2);
    v19$1 := (if p26$1 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$1)), $h0), 30bv32), 0bv32) else v19$1);
    v19$2 := (if p26$2 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$2)), $h0), 30bv32), 0bv32) else v19$2);
    p28$1 := (if p26$1 && v19$1 then v19$1 else p28$1);
    p28$2 := (if p26$2 && v19$2 then v19$2 else p28$2);
    p27$1 := (if p26$1 && !v19$1 then !v19$1 else p27$1);
    p27$2 := (if p26$2 && !v19$2 then !v19$2 else p27$2);
    $8$1 := (if p27$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$1)), $h0), 30bv32), 8192bv32) else $8$1);
    $8$2 := (if p27$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$2)), $h0), 30bv32), 8192bv32) else $8$2);
    $8$1 := (if p28$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$1)), $h0), 30bv32)), 8192bv32), 1bv32), 8192bv32)) else $8$1);
    $8$2 := (if p28$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$2)), $h0), 30bv32)), 8192bv32), 1bv32), 8192bv32)) else $8$2);
    v20$1 := (if p26$1 then BV32_SGT(BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v1$1), BV32_MUL(8192bv32, $8$1)), 8192bv32), BV32_MUL(32bv32, v1$1)) else v20$1);
    v20$2 := (if p26$2 then BV32_SGT(BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v1$2), BV32_MUL(8192bv32, $8$2)), 8192bv32), BV32_MUL(32bv32, v1$2)) else v20$2);
    p30$1 := (if p26$1 && v20$1 then v20$1 else p30$1);
    p30$2 := (if p26$2 && v20$2 then v20$2 else p30$2);
    p29$1 := (if p26$1 && !v20$1 then !v20$1 else p29$1);
    p29$2 := (if p26$2 && !v20$2 then !v20$2 else p29$2);
    $10$1 := (if p29$1 then BV32_MUL(32bv32, v1$1) else $10$1);
    $10$2 := (if p29$2 then BV32_MUL(32bv32, v1$2) else $10$2);
    v21$1 := (if p30$1 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$1)), $h0), 30bv32), 0bv32) else v21$1);
    v21$2 := (if p30$2 then BV32_SLT(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$2)), $h0), 30bv32), 0bv32) else v21$2);
    p32$1 := (if p30$1 && v21$1 then v21$1 else p32$1);
    p32$2 := (if p30$2 && v21$2 then v21$2 else p32$2);
    p31$1 := (if p30$1 && !v21$1 then !v21$1 else p31$1);
    p31$2 := (if p30$2 && !v21$2 then !v21$2 else p31$2);
    $9$1 := (if p31$1 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$1)), $h0), 30bv32), 8192bv32) else $9$1);
    $9$2 := (if p31$2 then BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$2)), $h0), 30bv32), 8192bv32) else $9$2);
    $9$1 := (if p32$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$1)), $h0), 30bv32)), 8192bv32), 1bv32), 8192bv32)) else $9$1);
    $9$2 := (if p32$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_ADD(BV32_SUB(BV32_SUB(0bv32, $n), BV32_MUL(32bv32, v1$2)), $h0), 30bv32)), 8192bv32), 1bv32), 8192bv32)) else $9$2);
    $10$1 := (if p30$1 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v1$1), BV32_MUL(8192bv32, $9$1)), 8192bv32) else $10$1);
    $10$2 := (if p30$2 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v1$2), BV32_MUL(8192bv32, $9$2)), 8192bv32) else $10$2);
    $11$1 := (if p26$1 then $10$1 else $11$1);
    $11$2 := (if p26$2 then $10$2 else $11$2);
    v22$1 := (if p33$1 then BV32_SLT(BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v1$1), $h0), $g1.0$1), 62bv32), 0bv32) else v22$1);
    v22$2 := (if p33$2 then BV32_SLT(BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v1$2), $h0), $g1.0$2), 62bv32), 0bv32) else v22$2);
    p35$1 := (if p33$1 && v22$1 then v22$1 else p35$1);
    p35$2 := (if p33$2 && v22$2 then v22$2 else p35$2);
    p34$1 := (if p33$1 && !v22$1 then !v22$1 else p34$1);
    p34$2 := (if p33$2 && !v22$2 then !v22$2 else p34$2);
    $12$1 := (if p34$1 then BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v1$1), $h0), $g1.0$1), 62bv32), 8192bv32) else $12$1);
    $12$2 := (if p34$2 then BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v1$2), $h0), $g1.0$2), 62bv32), 8192bv32) else $12$2);
    $12$1 := (if p35$1 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v1$1), $h0), $g1.0$1), 62bv32)), 8192bv32), 1bv32), 8192bv32)) else $12$1);
    $12$2 := (if p35$2 then BV32_SUB(0bv32, BV32_SDIV(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, BV32_SUB(BV32_SUB(BV32_ADD(BV32_MUL(4294967264bv32, v1$2), $h0), $g1.0$2), 62bv32)), 8192bv32), 1bv32), 8192bv32)) else $12$2);
    $11$1 := (if p33$1 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v1$1), BV32_MUL(8192bv32, $12$1)), 8192bv32) else $11$1);
    $11$2 := (if p33$2 then BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v1$2), BV32_MUL(8192bv32, $12$2)), 8192bv32) else $11$2);
    $g3.0$1 := (if p5$1 then $11$1 else $g3.0$1);
    $g3.0$2 := (if p5$2 then $11$2 else $g3.0$2);
    p36$1 := (if p5$1 then true else p36$1);
    p36$2 := (if p5$2 then true else p36$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto __partitioned_block_$51_0;

  __partitioned_block_$51_0:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b155 ==> _READ_HAS_OCCURRED_$$kernel0.shared_A_2 ==> _WATCHED_OFFSET == BV32_ADD(BV32_MUL(local_id_x$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, local_id_x$1), 31bv32)) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(local_id_x$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, local_id_x$1), 31bv32));
    assert {:tag "noread"} _b154 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_A_2;
    assert {:tag "nowrite"} _b153 ==> !_WRITE_HAS_OCCURRED_$$A;
    assert {:tag "noread"} _b152 ==> !_READ_HAS_OCCURRED_$$A;
    assert {:tag "predicatedEquality"} _b151 ==> p36$1 && p36$2 ==> v63$1 == v63$2;
    assert {:tag "predicatedEquality"} _b150 ==> p36$1 && p36$2 ==> v62$1 == v62$2;
    assert {:tag "predicatedEquality"} _b149 ==> p36$1 && p36$2 ==> v61$1 == v61$2;
    assert {:tag "predicatedEquality"} _b148 ==> p36$1 && p36$2 ==> v60$1 == v60$2;
    assert {:tag "predicatedEquality"} _b147 ==> p36$1 && p36$2 ==> v59$1 == v59$2;
    assert {:tag "predicatedEquality"} _b146 ==> p36$1 && p36$2 ==> v58$1 == v58$2;
    assert {:tag "predicatedEquality"} _b145 ==> p36$1 && p36$2 ==> v57$1 == v57$2;
    assert {:tag "predicatedEquality"} _b144 ==> p36$1 && p36$2 ==> v56$1 == v56$2;
    assert {:tag "predicatedEquality"} _b143 ==> p36$1 && p36$2 ==> v55$1 == v55$2;
    assert {:tag "predicatedEquality"} _b142 ==> p36$1 && p36$2 ==> v54$1 == v54$2;
    assert {:tag "predicatedEquality"} _b141 ==> p36$1 && p36$2 ==> v53$1 == v53$2;
    assert {:tag "predicatedEquality"} _b140 ==> p36$1 && p36$2 ==> v52$1 == v52$2;
    assert {:tag "predicatedEquality"} _b139 ==> p36$1 && p36$2 ==> v51$1 == v51$2;
    assert {:tag "predicatedEquality"} _b138 ==> p36$1 && p36$2 ==> v50$1 == v50$2;
    assert {:tag "predicatedEquality"} _b137 ==> p36$1 && p36$2 ==> v49$1 == v49$2;
    assert {:tag "predicatedEquality"} _b136 ==> p36$1 && p36$2 ==> v48$1 == v48$2;
    assert {:tag "predicatedEquality"} _b135 ==> p36$1 && p36$2 ==> v47$1 == v47$2;
    assert {:tag "predicatedEquality"} _b134 ==> p36$1 && p36$2 ==> v46$1 == v46$2;
    assert {:tag "predicatedEquality"} _b133 ==> p36$1 && p36$2 ==> v45$1 == v45$2;
    assert {:tag "predicatedEquality"} _b132 ==> p36$1 && p36$2 ==> v44$1 == v44$2;
    assert {:tag "predicatedEquality"} _b131 ==> p36$1 && p36$2 ==> v43$1 == v43$2;
    assert {:tag "predicatedEquality"} _b130 ==> p36$1 && p36$2 ==> v42$1 == v42$2;
    assert {:tag "predicatedEquality"} _b129 ==> p36$1 && p36$2 ==> v41$1 == v41$2;
    assert {:tag "predicatedEquality"} _b128 ==> p36$1 && p36$2 ==> v40$1 == v40$2;
    assert {:tag "predicatedEquality"} _b127 ==> p36$1 && p36$2 ==> v39$1 == v39$2;
    assert {:tag "predicatedEquality"} _b126 ==> p36$1 && p36$2 ==> v38$1 == v38$2;
    assert {:tag "predicatedEquality"} _b125 ==> p36$1 && p36$2 ==> v37$1 == v37$2;
    assert {:tag "predicatedEquality"} _b124 ==> p36$1 && p36$2 ==> v36$1 == v36$2;
    assert {:tag "predicatedEquality"} _b123 ==> p36$1 && p36$2 ==> v35$1 == v35$2;
    assert {:tag "predicatedEquality"} _b122 ==> p36$1 && p36$2 ==> v34$1 == v34$2;
    assert {:tag "predicatedEquality"} _b121 ==> p36$1 && p36$2 ==> v33$1 == v33$2;
    assert {:tag "predicatedEquality"} _b120 ==> p36$1 && p36$2 ==> v32$1 == v32$2;
    assert {:tag "predicatedEquality"} _b119 ==> p36$1 && p36$2 ==> v31$1 == v31$2;
    assert {:tag "predicatedEquality"} _b118 ==> p36$1 && p36$2 ==> v30$1 == v30$2;
    assert {:tag "predicatedEquality"} _b117 ==> p36$1 && p36$2 ==> v29$1 == v29$2;
    assert {:tag "predicatedEquality"} _b116 ==> p36$1 && p36$2 ==> v28$1 == v28$2;
    assert {:tag "predicatedEquality"} _b115 ==> p36$1 && p36$2 ==> v27$1 == v27$2;
    assert {:tag "predicatedEquality"} _b114 ==> p36$1 && p36$2 ==> v26$1 == v26$2;
    assert {:tag "predicatedEquality"} _b113 ==> p36$1 && p36$2 ==> v25$1 == v25$2;
    assert {:tag "predicatedEquality"} _b112 ==> p36$1 && p36$2 ==> v24$1 == v24$2;
    assert {:tag "predicatedEquality"} _b111 ==> p36$1 && p36$2 ==> v23$1 == v23$2;
    assert {:tag "predicatedEquality"} _b110 ==> p36$1 && p36$2 ==> $g3.0$1 == $g3.0$2;
    assert {:tag "loopPredicateEquality"} _b109 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p36$1 == p36$2;
    assert {:tag "loopPredicateEquality"} _b108 ==> p36$1 == p36$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_A_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_A_2 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p36$1 ==> p2$1;
    assert p36$2 ==> p2$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b13 ==> _READ_HAS_OCCURRED_$$kernel0.shared_A_2 ==> BV32_SLE($g1.0$1, $1$1);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p36$1 ==> _b12 ==> p36$1 ==> BV32_SLE($g1.0$1, $1$1);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p36$2 ==> _b12 ==> p36$2 ==> BV32_SLE($g1.0$2, $1$2);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b11 ==> BV32_SLE($g1.0$1, $1$1) && BV32_SLT($g3.0$1, $n) ==> p36$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b11 ==> BV32_SLE($g1.0$2, $1$2) && BV32_SLT($g3.0$2, $n) ==> p36$2;
    assert {:tag "loopBound"} {:thread 1} p36$1 ==> _b10 ==> BV32_UGE($g3.0$1, $11$1);
    assert {:tag "loopBound"} {:thread 2} p36$2 ==> _b10 ==> BV32_UGE($g3.0$2, $11$2);
    assert {:tag "loopBound"} {:thread 1} p36$1 ==> _b9 ==> BV32_ULE($g3.0$1, $11$1);
    assert {:tag "loopBound"} {:thread 2} p36$2 ==> _b9 ==> BV32_ULE($g3.0$2, $11$2);
    assert {:tag "loopBound"} {:thread 1} p36$1 ==> _b8 ==> BV32_SGE($g3.0$1, $11$1);
    assert {:tag "loopBound"} {:thread 2} p36$2 ==> _b8 ==> BV32_SGE($g3.0$2, $11$2);
    assert {:tag "loopBound"} {:thread 1} p36$1 ==> _b7 ==> BV32_SLE($g3.0$1, $11$1);
    assert {:tag "loopBound"} {:thread 2} p36$2 ==> _b7 ==> BV32_SLE($g3.0$2, $11$2);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p36$1 ==> _b6 ==> BV32_SUB($g3.0$1, $11$1) == BV32_SUB($g3.0$2, $11$2);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p36$2 ==> _b6 ==> BV32_SUB($g3.0$2, $11$2) == BV32_SUB($g3.0$1, $11$1);
    assert {:tag "guardNonNeg"} {:thread 1} p36$1 ==> _b5 ==> BV32_SLE(0bv32, $g3.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p36$2 ==> _b5 ==> BV32_SLE(0bv32, $g3.0$2);
    assert {:block_sourceloc} {:sourceloc_num 54} p36$1 ==> true;
    v23$1 := (if p36$1 then BV32_SLT($g3.0$1, $n) else v23$1);
    v23$2 := (if p36$2 then BV32_SLT($g3.0$2, $n) else v23$2);
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
    p78$1 := false;
    p78$2 := false;
    p79$1 := false;
    p79$2 := false;
    p80$1 := false;
    p80$2 := false;
    p81$1 := false;
    p81$2 := false;
    p82$1 := false;
    p82$2 := false;
    p83$1 := false;
    p83$2 := false;
    p84$1 := false;
    p84$2 := false;
    p85$1 := false;
    p85$2 := false;
    p86$1 := false;
    p86$2 := false;
    p87$1 := false;
    p87$2 := false;
    p88$1 := false;
    p88$2 := false;
    p89$1 := false;
    p89$2 := false;
    p90$1 := false;
    p90$2 := false;
    p91$1 := false;
    p91$2 := false;
    p92$1 := false;
    p92$2 := false;
    p93$1 := false;
    p93$2 := false;
    p37$1 := (if p36$1 && v23$1 then v23$1 else p37$1);
    p37$2 := (if p36$2 && v23$2 then v23$2 else p37$2);
    p36$1 := (if p36$1 && !v23$1 then v23$1 else p36$1);
    p36$2 := (if p36$2 && !v23$2 then v23$2 else p36$2);
    v24$1 := (if p37$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 1bv32)) else v24$1);
    v24$2 := (if p37$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 1bv32)) else v24$2);
    p39$1 := (if p37$1 && v24$1 then v24$1 else p39$1);
    p39$2 := (if p37$2 && v24$2 then v24$2 else p39$2);
    v25$1 := (if p39$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2$1, v3$1), $g1.0$1), $g3.0$1), 15bv32), $h0) else v25$1);
    v25$2 := (if p39$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2$2, v3$2), $g1.0$2), $g3.0$2), 15bv32), $h0) else v25$2);
    p41$1 := (if p39$1 && v25$1 then v25$1 else p41$1);
    p41$2 := (if p39$2 && v25$2 then v25$2 else p41$2);
    v26$1 := (if p41$1 then BV32_SGE($h0, BV32_ADD(v2$1, $g1.0$1)) else v26$1);
    v26$2 := (if p41$2 then BV32_SGE($h0, BV32_ADD(v2$2, $g1.0$2)) else v26$2);
    p43$1 := (if p41$1 && v26$1 then v26$1 else p43$1);
    p43$2 := (if p41$2 && v26$2 then v26$2 else p43$2);
    v27$1 := (if p43$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v2$1, $g1.0$1), 1bv32)) else v27$1);
    v27$2 := (if p43$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v2$2, $g1.0$2), 1bv32)) else v27$2);
    p45$1 := (if p43$1 && v27$1 then v27$1 else p45$1);
    p45$2 := (if p43$2 && v27$2 then v27$2 else p45$2);
    v28$1 := (if p45$1 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, v2$1), BV32_MUL(2bv32, $g1.0$1)), BV32_ADD($h0, 1bv32)) else v28$1);
    v28$2 := (if p45$2 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, v2$2), BV32_MUL(2bv32, $g1.0$2)), BV32_ADD($h0, 1bv32)) else v28$2);
    p47$1 := (if p45$1 && v28$1 then v28$1 else p47$1);
    p47$2 := (if p45$2 && v28$2 then v28$2 else p47$2);
    v29$1 := (if p47$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(v2$1, v3$1), $g1.0$1), $g3.0$1), BV32_ADD($h0, 1bv32)) else v29$1);
    v29$2 := (if p47$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(v2$2, v3$2), $g1.0$2), $g3.0$2), BV32_ADD($h0, 1bv32)) else v29$2);
    p49$1 := (if p47$1 && v29$1 then v29$1 else p49$1);
    p49$2 := (if p47$2 && v29$2 then v29$2 else p49$2);
    call {:sourceloc} {:sourceloc_num 62} _LOG_READ_$$A(p49$1, BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h0), $g1.0$1), $n), BV32_ADD(v3$1, $g3.0$1)), $$A[BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h0), $g1.0$1), $n), BV32_ADD(v3$1, $g3.0$1))]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 62} _CHECK_READ_$$A(p49$2, BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h0), $g1.0$2), $n), BV32_ADD(v3$2, $g3.0$2)), $$A[BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h0), $g1.0$2), $n), BV32_ADD(v3$2, $g3.0$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$A"} true;
    v30$1 := (if p49$1 then $$A[BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h0), $g1.0$1), $n), BV32_ADD(v3$1, $g3.0$1))] else v30$1);
    v30$2 := (if p49$2 then $$A[BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h0), $g1.0$2), $n), BV32_ADD(v3$2, $g3.0$2))] else v30$2);
    $$private_A_1$0bv32$1 := (if p49$1 then v30$1 else $$private_A_1$0bv32$1);
    $$private_A_1$0bv32$2 := (if p49$2 then v30$2 else $$private_A_1$0bv32$2);
    v31$1 := (if p47$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 17bv32)) else v31$1);
    v31$2 := (if p47$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 17bv32)) else v31$2);
    p51$1 := (if p47$1 && v31$1 then v31$1 else p51$1);
    p51$2 := (if p47$2 && v31$2 then v31$2 else p51$2);
    call {:sourceloc} {:sourceloc_num 66} _LOG_READ_$$A(p51$1, BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h0), $g1.0$1), $n), BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 16bv32)), $$A[BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h0), $g1.0$1), $n), BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 16bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 66} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 66} _CHECK_READ_$$A(p51$2, BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h0), $g1.0$2), $n), BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 16bv32)), $$A[BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h0), $g1.0$2), $n), BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 16bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$A"} true;
    v32$1 := (if p51$1 then $$A[BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$1), $h0), $g1.0$1), $n), BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 16bv32))] else v32$1);
    v32$2 := (if p51$2 then $$A[BV32_ADD(BV32_MUL(BV32_SUB(BV32_ADD(BV32_SUB(0bv32, v2$2), $h0), $g1.0$2), $n), BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 16bv32))] else v32$2);
    $$private_A_1$1bv32$1 := (if p51$1 then v32$1 else $$private_A_1$1bv32$1);
    $$private_A_1$1bv32$2 := (if p51$2 then v32$2 else $$private_A_1$1bv32$2);
    v33$1 := (if p37$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 1bv32)) else v33$1);
    v33$2 := (if p37$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 1bv32)) else v33$2);
    p53$1 := (if p37$1 && v33$1 then v33$1 else p53$1);
    p53$2 := (if p37$2 && v33$2 then v33$2 else p53$2);
    v34$1 := (if p53$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2$1, v3$1), $g1.0$1), $g3.0$1), 15bv32), $h0) else v34$1);
    v34$2 := (if p53$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2$2, v3$2), $g1.0$2), $g3.0$2), 15bv32), $h0) else v34$2);
    p55$1 := (if p53$1 && v34$1 then v34$1 else p55$1);
    p55$2 := (if p53$2 && v34$2 then v34$2 else p55$2);
    v35$1 := (if p55$1 then BV32_SGE($h0, BV32_ADD(v2$1, $g1.0$1)) else v35$1);
    v35$2 := (if p55$2 then BV32_SGE($h0, BV32_ADD(v2$2, $g1.0$2)) else v35$2);
    p57$1 := (if p55$1 && v35$1 then v35$1 else p57$1);
    p57$2 := (if p55$2 && v35$2 then v35$2 else p57$2);
    v36$1 := (if p57$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v2$1, $g1.0$1), 1bv32)) else v36$1);
    v36$2 := (if p57$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v2$2, $g1.0$2), 1bv32)) else v36$2);
    p59$1 := (if p57$1 && v36$1 then v36$1 else p59$1);
    p59$2 := (if p57$2 && v36$2 then v36$2 else p59$2);
    v37$1 := (if p59$1 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, v2$1), BV32_MUL(2bv32, $g1.0$1)), BV32_ADD($h0, 1bv32)) else v37$1);
    v37$2 := (if p59$2 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, v2$2), BV32_MUL(2bv32, $g1.0$2)), BV32_ADD($h0, 1bv32)) else v37$2);
    p61$1 := (if p59$1 && v37$1 then v37$1 else p61$1);
    p61$2 := (if p59$2 && v37$2 then v37$2 else p61$2);
    v38$1 := (if p61$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(v2$1, v3$1), $g1.0$1), $g3.0$1), BV32_ADD($h0, 1bv32)) else v38$1);
    v38$2 := (if p61$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(v2$2, v3$2), $g1.0$2), $g3.0$2), BV32_ADD($h0, 1bv32)) else v38$2);
    p63$1 := (if p61$1 && v38$1 then v38$1 else p63$1);
    p63$2 := (if p61$2 && v38$2 then v38$2 else p63$2);
    call {:sourceloc} {:sourceloc_num 76} _LOG_READ_$$A(p63$1, BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_ADD(v3$1, $g3.0$1)), $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_ADD(v3$1, $g3.0$1))]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 76} _CHECK_READ_$$A(p63$2, BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_ADD(v3$2, $g3.0$2)), $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_ADD(v3$2, $g3.0$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$A"} true;
    v39$1 := (if p63$1 then $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_ADD(v3$1, $g3.0$1))] else v39$1);
    v39$2 := (if p63$2 then $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_ADD(v3$2, $g3.0$2))] else v39$2);
    $$private_A_0$0bv32$1 := (if p63$1 then v39$1 else $$private_A_0$0bv32$1);
    $$private_A_0$0bv32$2 := (if p63$2 then v39$2 else $$private_A_0$0bv32$2);
    v40$1 := (if p61$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 17bv32)) else v40$1);
    v40$2 := (if p61$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 17bv32)) else v40$2);
    p65$1 := (if p61$1 && v40$1 then v40$1 else p65$1);
    p65$2 := (if p61$2 && v40$2 then v40$2 else p65$2);
    call {:sourceloc} {:sourceloc_num 80} _LOG_READ_$$A(p65$1, BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 16bv32)), $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 16bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 80} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 80} _CHECK_READ_$$A(p65$2, BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 16bv32)), $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 16bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$A"} true;
    v41$1 := (if p65$1 then $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 16bv32))] else v41$1);
    v41$2 := (if p65$2 then $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 16bv32))] else v41$2);
    $$private_A_0$1bv32$1 := (if p65$1 then v41$1 else $$private_A_0$1bv32$1);
    $$private_A_0$1bv32$2 := (if p65$2 then v41$2 else $$private_A_0$1bv32$2);
    goto __partitioned_block_$51_1;

  __partitioned_block_$51_1:
    call {:sourceloc_num 84} $bugle_barrier_duplicated_0(1bv1, 1bv1, p37$1, p37$2);
    v42$1 := (if p37$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 1bv32)) else v42$1);
    v42$2 := (if p37$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 1bv32)) else v42$2);
    p67$1 := (if p37$1 && v42$1 then v42$1 else p67$1);
    p67$2 := (if p37$2 && v42$2 then v42$2 else p67$2);
    v43$1 := (if p67$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2$1, v3$1), $g1.0$1), $g3.0$1), 15bv32), $h0) else v43$1);
    v43$2 := (if p67$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2$2, v3$2), $g1.0$2), $g3.0$2), 15bv32), $h0) else v43$2);
    p69$1 := (if p67$1 && v43$1 then v43$1 else p69$1);
    p69$2 := (if p67$2 && v43$2 then v43$2 else p69$2);
    v44$1 := (if p69$1 then BV32_SGE($h0, BV32_ADD(v2$1, $g1.0$1)) else v44$1);
    v44$2 := (if p69$2 then BV32_SGE($h0, BV32_ADD(v2$2, $g1.0$2)) else v44$2);
    p71$1 := (if p69$1 && v44$1 then v44$1 else p71$1);
    p71$2 := (if p69$2 && v44$2 then v44$2 else p71$2);
    v45$1 := (if p71$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v2$1, $g1.0$1), 1bv32)) else v45$1);
    v45$2 := (if p71$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v2$2, $g1.0$2), 1bv32)) else v45$2);
    p73$1 := (if p71$1 && v45$1 then v45$1 else p73$1);
    p73$2 := (if p71$2 && v45$2 then v45$2 else p73$2);
    v46$1 := (if p73$1 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, v2$1), BV32_MUL(2bv32, $g1.0$1)), BV32_ADD($h0, 1bv32)) else v46$1);
    v46$2 := (if p73$2 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, v2$2), BV32_MUL(2bv32, $g1.0$2)), BV32_ADD($h0, 1bv32)) else v46$2);
    p75$1 := (if p73$1 && v46$1 then v46$1 else p75$1);
    p75$2 := (if p73$2 && v46$2 then v46$2 else p75$2);
    v47$1 := (if p75$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(v2$1, v3$1), $g1.0$1), $g3.0$1), BV32_ADD($h0, 1bv32)) else v47$1);
    v47$2 := (if p75$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(v2$2, v3$2), $g1.0$2), $g3.0$2), BV32_ADD($h0, 1bv32)) else v47$2);
    p77$1 := (if p75$1 && v47$1 then v47$1 else p77$1);
    p77$2 := (if p75$2 && v47$2 then v47$2 else p77$2);
    v48$1 := (if p77$1 then $$private_A_0$0bv32$1 else v48$1);
    v48$2 := (if p77$2 then $$private_A_0$0bv32$2 else v48$2);
    call {:sourceloc} {:sourceloc_num 92} _LOG_READ_$$kernel0.shared_A_2(p77$1, BV32_ADD(BV32_MUL(v2$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$1), 31bv32)), $$kernel0.shared_A_2[1bv1][BV32_ADD(BV32_MUL(v2$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$1), 31bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 92} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 92} _CHECK_READ_$$kernel0.shared_A_2(p77$2, BV32_ADD(BV32_MUL(v2$2, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$2), 31bv32)), $$kernel0.shared_A_2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$2), 31bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel0.shared_A_2"} true;
    v49$1 := (if p77$1 then $$kernel0.shared_A_2[1bv1][BV32_ADD(BV32_MUL(v2$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$1), 31bv32))] else v49$1);
    v49$2 := (if p77$2 then $$kernel0.shared_A_2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$2), 31bv32))] else v49$2);
    v50$1 := (if p77$1 then $$private_A_1$0bv32$1 else v50$1);
    v50$2 := (if p77$2 then $$private_A_1$0bv32$2 else v50$2);
    $$private_A_0$0bv32$1 := (if p77$1 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v49$1), v50$1), v48$1) else $$private_A_0$0bv32$1);
    $$private_A_0$0bv32$2 := (if p77$2 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v49$2), v50$2), v48$2) else $$private_A_0$0bv32$2);
    v51$1 := (if p75$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 17bv32)) else v51$1);
    v51$2 := (if p75$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 17bv32)) else v51$2);
    p79$1 := (if p75$1 && v51$1 then v51$1 else p79$1);
    p79$2 := (if p75$2 && v51$2 then v51$2 else p79$2);
    v52$1 := (if p79$1 then $$private_A_0$1bv32$1 else v52$1);
    v52$2 := (if p79$2 then $$private_A_0$1bv32$2 else v52$2);
    call {:sourceloc} {:sourceloc_num 98} _LOG_READ_$$kernel0.shared_A_2(p79$1, BV32_ADD(BV32_MUL(v2$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$1), 31bv32)), $$kernel0.shared_A_2[1bv1][BV32_ADD(BV32_MUL(v2$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$1), 31bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 98} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 98} _CHECK_READ_$$kernel0.shared_A_2(p79$2, BV32_ADD(BV32_MUL(v2$2, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$2), 31bv32)), $$kernel0.shared_A_2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$2), 31bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel0.shared_A_2"} true;
    v53$1 := (if p79$1 then $$kernel0.shared_A_2[1bv1][BV32_ADD(BV32_MUL(v2$1, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$1), 31bv32))] else v53$1);
    v53$2 := (if p79$2 then $$kernel0.shared_A_2[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v2$2, 32bv32), BV32_ADD(BV32_SUB(0bv32, v2$2), 31bv32))] else v53$2);
    v54$1 := (if p79$1 then $$private_A_1$1bv32$1 else v54$1);
    v54$2 := (if p79$2 then $$private_A_1$1bv32$2 else v54$2);
    $$private_A_0$1bv32$1 := (if p79$1 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v53$1), v54$1), v52$1) else $$private_A_0$1bv32$1);
    $$private_A_0$1bv32$2 := (if p79$2 then FADD64(FMUL64(FSUB64(9223372036854775808bv64, v53$2), v54$2), v52$2) else $$private_A_0$1bv32$2);
    goto __partitioned_block_$51_2;

  __partitioned_block_$51_2:
    call {:sourceloc_num 103} $bugle_barrier_duplicated_1(1bv1, 1bv1, p37$1, p37$2);
    v55$1 := (if p37$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 1bv32)) else v55$1);
    v55$2 := (if p37$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 1bv32)) else v55$2);
    p81$1 := (if p37$1 && v55$1 then v55$1 else p81$1);
    p81$2 := (if p37$2 && v55$2 then v55$2 else p81$2);
    v56$1 := (if p81$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2$1, v3$1), $g1.0$1), $g3.0$1), 15bv32), $h0) else v56$1);
    v56$2 := (if p81$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2$2, v3$2), $g1.0$2), $g3.0$2), 15bv32), $h0) else v56$2);
    p83$1 := (if p81$1 && v56$1 then v56$1 else p83$1);
    p83$2 := (if p81$2 && v56$2 then v56$2 else p83$2);
    v57$1 := (if p83$1 then BV32_SGE($h0, BV32_ADD(v2$1, $g1.0$1)) else v57$1);
    v57$2 := (if p83$2 then BV32_SGE($h0, BV32_ADD(v2$2, $g1.0$2)) else v57$2);
    p85$1 := (if p83$1 && v57$1 then v57$1 else p85$1);
    p85$2 := (if p83$2 && v57$2 then v57$2 else p85$2);
    v58$1 := (if p85$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v2$1, $g1.0$1), 1bv32)) else v58$1);
    v58$2 := (if p85$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v2$2, $g1.0$2), 1bv32)) else v58$2);
    p87$1 := (if p85$1 && v58$1 then v58$1 else p87$1);
    p87$2 := (if p85$2 && v58$2 then v58$2 else p87$2);
    v59$1 := (if p87$1 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, v2$1), BV32_MUL(2bv32, $g1.0$1)), BV32_ADD($h0, 1bv32)) else v59$1);
    v59$2 := (if p87$2 then BV32_SGE(BV32_ADD(BV32_MUL(2bv32, v2$2), BV32_MUL(2bv32, $g1.0$2)), BV32_ADD($h0, 1bv32)) else v59$2);
    p89$1 := (if p87$1 && v59$1 then v59$1 else p89$1);
    p89$2 := (if p87$2 && v59$2 then v59$2 else p89$2);
    v60$1 := (if p89$1 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(v2$1, v3$1), $g1.0$1), $g3.0$1), BV32_ADD($h0, 1bv32)) else v60$1);
    v60$2 := (if p89$2 then BV32_SGE(BV32_ADD(BV32_ADD(BV32_ADD(v2$2, v3$2), $g1.0$2), $g3.0$2), BV32_ADD($h0, 1bv32)) else v60$2);
    p91$1 := (if p89$1 && v60$1 then v60$1 else p91$1);
    p91$2 := (if p89$2 && v60$2 then v60$2 else p91$2);
    v61$1 := (if p91$1 then $$private_A_0$0bv32$1 else v61$1);
    v61$2 := (if p91$2 then $$private_A_0$0bv32$2 else v61$2);
    call {:sourceloc} {:sourceloc_num 111} _LOG_WRITE_$$A(p91$1, BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_ADD(v3$1, $g3.0$1)), v61$1, $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_ADD(v3$1, $g3.0$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$A(p91$2, BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_ADD(v3$2, $g3.0$2)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 111} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 111} _CHECK_WRITE_$$A(p91$2, BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_ADD(v3$2, $g3.0$2)), v61$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$A"} true;
    $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_ADD(v3$1, $g3.0$1))] := (if p91$1 then v61$1 else $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_ADD(v3$1, $g3.0$1))]);
    $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_ADD(v3$2, $g3.0$2))] := (if p91$2 then v61$2 else $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_ADD(v3$2, $g3.0$2))]);
    v62$1 := (if p89$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 17bv32)) else v62$1);
    v62$2 := (if p89$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 17bv32)) else v62$2);
    p93$1 := (if p89$1 && v62$1 then v62$1 else p93$1);
    p93$2 := (if p89$2 && v62$2 then v62$2 else p93$2);
    v63$1 := (if p93$1 then $$private_A_0$1bv32$1 else v63$1);
    v63$2 := (if p93$2 then $$private_A_0$1bv32$2 else v63$2);
    call {:sourceloc} {:sourceloc_num 115} _LOG_WRITE_$$A(p93$1, BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 16bv32)), v63$1, $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 16bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$A(p93$2, BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 16bv32)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 115} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 115} _CHECK_WRITE_$$A(p93$2, BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 16bv32)), v63$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$A"} true;
    $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 16bv32))] := (if p93$1 then v63$1 else $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$1, $g1.0$1), $n), BV32_ADD(BV32_ADD(v3$1, $g3.0$1), 16bv32))]);
    $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 16bv32))] := (if p93$2 then v63$2 else $$A[BV32_ADD(BV32_MUL(BV32_ADD(v2$2, $g1.0$2), $n), BV32_ADD(BV32_ADD(v3$2, $g3.0$2), 16bv32))]);
    goto __partitioned_block_$51_3;

  __partitioned_block_$51_3:
    call {:sourceloc_num 118} $bugle_barrier_duplicated_2(1bv1, 1bv1, p37$1, p37$2);
    $g3.0$1 := (if p37$1 then BV32_ADD($g3.0$1, 8192bv32) else $g3.0$1);
    $g3.0$2 := (if p37$2 then BV32_ADD($g3.0$2, 8192bv32) else $g3.0$2);
    p36$1 := (if p37$1 then true else p36$1);
    p36$2 := (if p37$2 then true else p36$2);
    goto $51.backedge, $51.tail;

  $51.tail:
    assume !p36$1 && !p36$2;
    $g1.0$1 := (if p5$1 then BV32_ADD($g1.0$1, 8192bv32) else $g1.0$1);
    $g1.0$2 := (if p5$2 then BV32_ADD($g1.0$2, 8192bv32) else $g1.0$2);
    p2$1 := (if p5$1 then true else p2$1);
    p2$2 := (if p5$2 then true else p2$2);
    goto $4.backedge, $4.tail;

  $4.tail:
    assume !p2$1 && !p2$2;
    return;

  $4.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $4;

  $51.backedge:
    assume {:backedge} p36$1 || p36$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto __partitioned_block_$51_0;

  $15.backedge:
    assume {:backedge} p14$1 || p14$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $15;
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
  modifies $$kernel0.shared_A_2, $$A, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel0.shared_A_2, $$A, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel0.shared_A_2, $$A, _TRACKING;



var $$private_A_0$1bv32$1: bv64;

var $$private_A_0$1bv32$2: bv64;

var $$private_A_0$0bv32$1: bv64;

var $$private_A_0$0bv32$2: bv64;

var $$private_A_1$1bv32$1: bv64;

var $$private_A_1$1bv32$2: bv64;

var $$private_A_1$0bv32$1: bv64;

var $$private_A_1$0bv32$2: bv64;

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



const _WATCHED_VALUE_$$kernel0.shared_A_2: bv64;

procedure {:inline 1} _LOG_READ_$$kernel0.shared_A_2(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel0.shared_A_2;



implementation {:inline 1} _LOG_READ_$$kernel0.shared_A_2(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel0.shared_A_2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_A_2 == _value then true else _READ_HAS_OCCURRED_$$kernel0.shared_A_2);
    return;
}



procedure _CHECK_READ_$$kernel0.shared_A_2(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_A_2"} {:array "$$kernel0.shared_A_2"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_A_2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A_2"} {:array "$$kernel0.shared_A_2"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel0.shared_A_2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_A_2: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel0.shared_A_2(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_A_2;



implementation {:inline 1} _LOG_WRITE_$$kernel0.shared_A_2(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_A_2 == _value then true else _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2);
    _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_A_2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_A_2 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_A_2);
    return;
}



procedure _CHECK_WRITE_$$kernel0.shared_A_2(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_A_2"} {:array "$$kernel0.shared_A_2"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_A_2 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A_2"} {:array "$$kernel0.shared_A_2"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel0.shared_A_2 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_A_2 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A_2"} {:array "$$kernel0.shared_A_2"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel0.shared_A_2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel0.shared_A_2(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel0.shared_A_2;



implementation {:inline 1} _LOG_ATOMIC_$$kernel0.shared_A_2(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel0.shared_A_2 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel0.shared_A_2);
    return;
}



procedure _CHECK_ATOMIC_$$kernel0.shared_A_2(_P: bool, _offset: bv32);
  requires {:source_name "shared_A_2"} {:array "$$kernel0.shared_A_2"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A_2"} {:array "$$kernel0.shared_A_2"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel0.shared_A_2 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_A_2(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_A_2;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_A_2(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_A_2 := (if _P && _WRITE_HAS_OCCURRED_$$kernel0.shared_A_2 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_A_2);
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_A_2;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_A_2;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_A_2;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$A;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$A;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$A;
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
    havoc $$A;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel0.shared_A_2;
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_A_2;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_A_2;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_A_2;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$A;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$A;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$A;
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
    havoc $$A;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel0.shared_A_2;
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_A_2;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_A_2;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_A_2;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$A;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$A;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$A;
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
    havoc $$A;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel0.shared_A_2;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



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

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

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
