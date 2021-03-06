type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "sum_c"} {:global} $$sum_c: [bv32]bv32;

axiom {:array_info "$$sum_c"} {:global} {:elem_width 32} {:source_name "sum_c"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sum_c: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sum_c: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sum_c: bool;

axiom {:array_info "$$private_sum_c"} {:elem_width 32} {:source_name "private_sum_c"} {:source_elem_width 32} {:source_dimensions "1,2,1"} true;

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

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel0"} {:kernel} $kernel0($length: bv32, $tsteps: bv32, $h0: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $tsteps == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $length == 64bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$sum_c && !_WRITE_HAS_OCCURRED_$$sum_c && !_ATOMIC_HAS_OCCURRED_$$sum_c;
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
  modifies $$sum_c, _TRACKING, _WRITE_HAS_OCCURRED_$$sum_c, _WRITE_READ_BENIGN_FLAG_$$sum_c, _WRITE_READ_BENIGN_FLAG_$$sum_c, _TRACKING;



implementation {:source_name "kernel0"} {:kernel} $kernel0($length: bv32, $tsteps: bv32, $h0: bv32)
{
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $g3.0$1: bv32;
  var $g3.0$2: bv32;
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
  var v17$1: bv32;
  var v17$2: bv32;
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
    assert {:tag "nowrite"} _b36 ==> !_WRITE_HAS_OCCURRED_$$sum_c;
    assert {:tag "predicatedEquality"} _b35 ==> p0$1 && p0$2 ==> v17$1 == v17$2;
    assert {:tag "predicatedEquality"} _b34 ==> p0$1 && p0$2 ==> v16$1 == v16$2;
    assert {:tag "predicatedEquality"} _b33 ==> p0$1 && p0$2 ==> v15$1 == v15$2;
    assert {:tag "predicatedEquality"} _b32 ==> p0$1 && p0$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b31 ==> p0$1 && p0$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b30 ==> p0$1 && p0$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b29 ==> p0$1 && p0$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b28 ==> p0$1 && p0$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b27 ==> p0$1 && p0$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b26 ==> p0$1 && p0$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b25 ==> p0$1 && p0$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b24 ==> p0$1 && p0$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b23 ==> p0$1 && p0$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b22 ==> p0$1 && p0$2 ==> v4$1 == v4$2;
    assert {:tag "predicatedEquality"} _b21 ==> p0$1 && p0$2 ==> v3$1 == v3$2;
    assert {:tag "predicatedEquality"} _b20 ==> p0$1 && p0$2 ==> $g3.0$1 == $g3.0$2;
    assert {:tag "predicatedEquality"} _b19 ==> p0$1 && p0$2 ==> $0$1 == $0$2;
    assert {:tag "predicatedEquality"} _b18 ==> p0$1 && p0$2 ==> $g1.0$1 == $g1.0$2;
    assert {:tag "loopPredicateEquality"} _b17 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p0$1 == p0$2;
    assert {:tag "loopPredicateEquality"} _b16 ==> p0$1 == p0$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b7 ==> BV32_SLT($g1.0$1, BV32_SUB($length, 1bv32)) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b7 ==> BV32_SLT($g1.0$2, BV32_SUB($length, 1bv32)) ==> p0$2;
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b6 ==> BV32_UGE($g1.0$1, BV32_MUL(32bv32, group_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b6 ==> BV32_UGE($g1.0$2, BV32_MUL(32bv32, group_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b5 ==> BV32_ULE($g1.0$1, BV32_MUL(32bv32, group_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b5 ==> BV32_ULE($g1.0$2, BV32_MUL(32bv32, group_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b4 ==> BV32_SGE($g1.0$1, BV32_MUL(32bv32, group_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b4 ==> BV32_SGE($g1.0$2, BV32_MUL(32bv32, group_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b3 ==> BV32_SLE($g1.0$1, BV32_MUL(32bv32, group_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b3 ==> BV32_SLE($g1.0$2, BV32_MUL(32bv32, group_id_x$2));
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p0$1 ==> _b2 ==> BV32_SUB($g1.0$1, BV32_MUL(32bv32, group_id_x$1)) == BV32_SUB($g1.0$2, BV32_MUL(32bv32, group_id_x$2));
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p0$2 ==> _b2 ==> BV32_SUB($g1.0$2, BV32_MUL(32bv32, group_id_x$2)) == BV32_SUB($g1.0$1, BV32_MUL(32bv32, group_id_x$1));
    assert {:tag "guardNonNeg"} {:thread 1} p0$1 ==> _b1 ==> BV32_SLE(0bv32, $g1.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p0$2 ==> _b1 ==> BV32_SLE(0bv32, $g1.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b0 ==> BV32_AND(BV32_SUB(8192bv32, 1bv32), $g1.0$1) == BV32_AND(BV32_SUB(8192bv32, 1bv32), BV32_MUL(32bv32, group_id_x$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b0 ==> BV32_AND(BV32_SUB(8192bv32, 1bv32), $g1.0$2) == BV32_AND(BV32_SUB(8192bv32, 1bv32), BV32_MUL(32bv32, group_id_x$2));
    assert {:block_sourceloc} {:sourceloc_num 3} p0$1 ==> true;
    v3$1 := (if p0$1 then BV32_SLT($g1.0$1, BV32_SUB($length, 1bv32)) else v3$1);
    v3$2 := (if p0$2 then BV32_SLT($g1.0$2, BV32_SUB($length, 1bv32)) else v3$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p26$1 := false;
    p26$2 := false;
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
    goto __partitioned_block_$6_0;

  __partitioned_block_$6_0:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "nowrite"} _b53 ==> !_WRITE_HAS_OCCURRED_$$sum_c;
    assert {:tag "predicatedEquality"} _b52 ==> p4$1 && p4$2 ==> v17$1 == v17$2;
    assert {:tag "predicatedEquality"} _b51 ==> p4$1 && p4$2 ==> v16$1 == v16$2;
    assert {:tag "predicatedEquality"} _b50 ==> p4$1 && p4$2 ==> v15$1 == v15$2;
    assert {:tag "predicatedEquality"} _b49 ==> p4$1 && p4$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b48 ==> p4$1 && p4$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b47 ==> p4$1 && p4$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b46 ==> p4$1 && p4$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b45 ==> p4$1 && p4$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b44 ==> p4$1 && p4$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b43 ==> p4$1 && p4$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b42 ==> p4$1 && p4$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b41 ==> p4$1 && p4$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b40 ==> p4$1 && p4$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b39 ==> p4$1 && p4$2 ==> $g3.0$1 == $g3.0$2;
    assert {:tag "loopPredicateEquality"} _b38 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p4$1 == p4$2;
    assert {:tag "loopPredicateEquality"} _b37 ==> p4$1 == p4$2;
    assert p4$1 ==> p0$1;
    assert p4$2 ==> p0$2;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p4$1 ==> _b15 ==> p4$1 ==> BV32_SLT($g1.0$1, BV32_SUB($length, 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p4$2 ==> _b15 ==> p4$2 ==> BV32_SLT($g1.0$2, BV32_SUB($length, 1bv32));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b14 ==> BV32_SLT($g1.0$1, BV32_SUB($length, 1bv32)) && BV32_SLT($g3.0$1, $length) ==> p4$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b14 ==> BV32_SLT($g1.0$2, BV32_SUB($length, 1bv32)) && BV32_SLT($g3.0$2, $length) ==> p4$2;
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b13 ==> BV32_UGE($g3.0$1, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $0$1)), 8192bv32));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b13 ==> BV32_UGE($g3.0$2, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $0$2)), 8192bv32));
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b12 ==> BV32_ULE($g3.0$1, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $0$1)), 8192bv32));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b12 ==> BV32_ULE($g3.0$2, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $0$2)), 8192bv32));
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b11 ==> BV32_SGE($g3.0$1, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $0$1)), 8192bv32));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b11 ==> BV32_SGE($g3.0$2, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $0$2)), 8192bv32));
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b10 ==> BV32_SLE($g3.0$1, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $0$1)), 8192bv32));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b10 ==> BV32_SLE($g3.0$2, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $0$2)), 8192bv32));
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p4$1 ==> _b9 ==> BV32_SUB($g3.0$1, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $0$1)), 8192bv32)) == BV32_SUB($g3.0$2, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $0$2)), 8192bv32));
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p4$2 ==> _b9 ==> BV32_SUB($g3.0$2, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$2), BV32_MUL(8192bv32, $0$2)), 8192bv32)) == BV32_SUB($g3.0$1, BV32_ADD(BV32_ADD(BV32_MUL(32bv32, v0$1), BV32_MUL(8192bv32, $0$1)), 8192bv32));
    assert {:tag "guardNonNeg"} {:thread 1} p4$1 ==> _b8 ==> BV32_SLE(0bv32, $g3.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p4$2 ==> _b8 ==> BV32_SLE(0bv32, $g3.0$2);
    assert {:block_sourceloc} {:sourceloc_num 8} p4$1 ==> true;
    v5$1 := (if p4$1 then BV32_SLT($g3.0$1, $length) else v5$1);
    v5$2 := (if p4$2 then BV32_SLT($g3.0$2, $length) else v5$2);
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
    p5$1 := (if p4$1 && v5$1 then v5$1 else p5$1);
    p5$2 := (if p4$2 && v5$2 then v5$2 else p5$2);
    p4$1 := (if p4$1 && !v5$1 then v5$1 else p4$1);
    p4$2 := (if p4$2 && !v5$2 then v5$2 else p4$2);
    v6$1 := (if p5$1 then BV32_SGE($length, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 1bv32)) else v6$1);
    v6$2 := (if p5$2 then BV32_SGE($length, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 1bv32)) else v6$2);
    p7$1 := (if p5$1 && v6$1 then v6$1 else p7$1);
    p7$2 := (if p5$2 && v6$2 then v6$2 else p7$2);
    v7$1 := (if p7$1 then BV32_SGE(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 15bv32), BV32_ADD(v1$1, $g1.0$1)) else v7$1);
    v7$2 := (if p7$2 then BV32_SGE(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 15bv32), BV32_ADD(v1$2, $g1.0$2)) else v7$2);
    p9$1 := (if p7$1 && v7$1 then v7$1 else p9$1);
    p9$2 := (if p7$2 && v7$2 then v7$2 else p9$2);
    v8$1 := (if p9$1 then BV32_SGE($length, BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 2bv32)) else v8$1);
    v8$2 := (if p9$2 then BV32_SGE($length, BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 2bv32)) else v8$2);
    p11$1 := (if p9$1 && v8$1 then v8$1 else p11$1);
    p11$2 := (if p9$2 && v8$2 then v8$2 else p11$2);
    v9$1 := (if p11$1 then BV32_SGE(BV32_ADD(v2$1, $g3.0$1), BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 1bv32)) else v9$1);
    v9$2 := (if p11$2 then BV32_SGE(BV32_ADD(v2$2, $g3.0$2), BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 1bv32)) else v9$2);
    p13$1 := (if p11$1 && v9$1 then v9$1 else p13$1);
    p13$2 := (if p11$2 && v9$2 then v9$2 else p13$2);
    $$private_sum_c$0bv32$1 := (if p13$1 then 0bv32 else $$private_sum_c$0bv32$1);
    $$private_sum_c$0bv32$2 := (if p13$2 then 0bv32 else $$private_sum_c$0bv32$2);
    v10$1 := (if p11$1 then BV32_SGE($length, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 17bv32)) else v10$1);
    v10$2 := (if p11$2 then BV32_SGE($length, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 17bv32)) else v10$2);
    p15$1 := (if p11$1 && v10$1 then v10$1 else p15$1);
    p15$2 := (if p11$2 && v10$2 then v10$2 else p15$2);
    $$private_sum_c$1bv32$1 := (if p15$1 then 0bv32 else $$private_sum_c$1bv32$1);
    $$private_sum_c$1bv32$2 := (if p15$2 then 0bv32 else $$private_sum_c$1bv32$2);
    goto __partitioned_block_$6_1;

  __partitioned_block_$6_1:
    call {:sourceloc_num 20} $bugle_barrier_duplicated_0(1bv1, 1bv1, p5$1, p5$2);
    v11$1 := (if p5$1 then BV32_SGE($length, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 1bv32)) else v11$1);
    v11$2 := (if p5$2 then BV32_SGE($length, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 1bv32)) else v11$2);
    p17$1 := (if p5$1 && v11$1 then v11$1 else p17$1);
    p17$2 := (if p5$2 && v11$2 then v11$2 else p17$2);
    v12$1 := (if p17$1 then BV32_SGE(BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 15bv32), BV32_ADD(v1$1, $g1.0$1)) else v12$1);
    v12$2 := (if p17$2 then BV32_SGE(BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 15bv32), BV32_ADD(v1$2, $g1.0$2)) else v12$2);
    p19$1 := (if p17$1 && v12$1 then v12$1 else p19$1);
    p19$2 := (if p17$2 && v12$2 then v12$2 else p19$2);
    v13$1 := (if p19$1 then BV32_SGE($length, BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 2bv32)) else v13$1);
    v13$2 := (if p19$2 then BV32_SGE($length, BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 2bv32)) else v13$2);
    p21$1 := (if p19$1 && v13$1 then v13$1 else p21$1);
    p21$2 := (if p19$2 && v13$2 then v13$2 else p21$2);
    v14$1 := (if p21$1 then BV32_SGE(BV32_ADD(v2$1, $g3.0$1), BV32_ADD(BV32_ADD(v1$1, $g1.0$1), 1bv32)) else v14$1);
    v14$2 := (if p21$2 then BV32_SGE(BV32_ADD(v2$2, $g3.0$2), BV32_ADD(BV32_ADD(v1$2, $g1.0$2), 1bv32)) else v14$2);
    p23$1 := (if p21$1 && v14$1 then v14$1 else p23$1);
    p23$2 := (if p21$2 && v14$2 then v14$2 else p23$2);
    v15$1 := (if p23$1 then $$private_sum_c$0bv32$1 else v15$1);
    v15$2 := (if p23$2 then $$private_sum_c$0bv32$2 else v15$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$sum_c(p23$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_ADD(v2$1, $g3.0$1)), $length), BV32_ADD(v1$1, $g1.0$1)), v15$1, $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_ADD(v2$1, $g3.0$1)), $length), BV32_ADD(v1$1, $g1.0$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sum_c(p23$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_ADD(v2$2, $g3.0$2)), $length), BV32_ADD(v1$2, $g1.0$2)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$sum_c(p23$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_ADD(v2$2, $g3.0$2)), $length), BV32_ADD(v1$2, $g1.0$2)), v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sum_c"} true;
    $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_ADD(v2$1, $g3.0$1)), $length), BV32_ADD(v1$1, $g1.0$1))] := (if p23$1 then v15$1 else $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_ADD(v2$1, $g3.0$1)), $length), BV32_ADD(v1$1, $g1.0$1))]);
    $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_ADD(v2$2, $g3.0$2)), $length), BV32_ADD(v1$2, $g1.0$2))] := (if p23$2 then v15$2 else $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_ADD(v2$2, $g3.0$2)), $length), BV32_ADD(v1$2, $g1.0$2))]);
    v16$1 := (if p21$1 then BV32_SGE($length, BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 17bv32)) else v16$1);
    v16$2 := (if p21$2 then BV32_SGE($length, BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 17bv32)) else v16$2);
    p25$1 := (if p21$1 && v16$1 then v16$1 else p25$1);
    p25$2 := (if p21$2 && v16$2 then v16$2 else p25$2);
    v17$1 := (if p25$1 then $$private_sum_c$1bv32$1 else v17$1);
    v17$2 := (if p25$2 then $$private_sum_c$1bv32$2 else v17$2);
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$sum_c(p25$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32)), $length), BV32_ADD(v1$1, $g1.0$1)), v17$1, $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32)), $length), BV32_ADD(v1$1, $g1.0$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sum_c(p25$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32)), $length), BV32_ADD(v1$2, $g1.0$2)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$sum_c(p25$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32)), $length), BV32_ADD(v1$2, $g1.0$2)), v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sum_c"} true;
    $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32)), $length), BV32_ADD(v1$1, $g1.0$1))] := (if p25$1 then v17$1 else $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$1, $g1.0$1), $length), BV32_ADD(BV32_ADD(v2$1, $g3.0$1), 16bv32)), $length), BV32_ADD(v1$1, $g1.0$1))]);
    $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32)), $length), BV32_ADD(v1$2, $g1.0$2))] := (if p25$2 then v17$2 else $$sum_c[BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(v1$2, $g1.0$2), $length), BV32_ADD(BV32_ADD(v2$2, $g3.0$2), 16bv32)), $length), BV32_ADD(v1$2, $g1.0$2))]);
    goto __partitioned_block_$6_2;

  __partitioned_block_$6_2:
    call {:sourceloc_num 33} $bugle_barrier_duplicated_1(1bv1, 1bv1, p5$1, p5$2);
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
    goto __partitioned_block_$6_0;
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
  modifies $$sum_c, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$sum_c, _TRACKING;



var $$private_sum_c$1bv32$1: bv32;

var $$private_sum_c$1bv32$2: bv32;

var $$private_sum_c$0bv32$1: bv32;

var $$private_sum_c$0bv32$2: bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

const {:existential true} _b3: bool;

const {:existential true} _b4: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b5: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

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



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon4_Then, anon4_Else;

  anon4_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sum_c;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sum_c;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sum_c;
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
    havoc $$sum_c;
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
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sum_c;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sum_c;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sum_c;
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
    havoc $$sum_c;
    goto anon3;

  anon4_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

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
