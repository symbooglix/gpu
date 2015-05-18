type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "c"} {:global} $$c: [bv32]bv32;

axiom {:array_info "$$c"} {:global} {:elem_width 32} {:source_name "c"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$c: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$c: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$c: bool;

axiom {:array_info "$$sum_c"} {:global} {:elem_width 32} {:source_name "sum_c"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sum_c: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sum_c: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sum_c: bool;

axiom {:array_info "$$W"} {:global} {:elem_width 32} {:source_name "W"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$W: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$W: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$W: bool;

axiom {:array_info "$$private_c"} {:elem_width 32} {:source_name "private_c"} {:source_elem_width 32} {:source_dimensions "1,1"} true;

axiom {:array_info "$$private_sum_c"} {:elem_width 32} {:source_name "private_sum_c"} {:source_elem_width 32} {:source_dimensions "1,1,1"} true;

axiom {:array_info "$$private_W"} {:elem_width 32} {:source_name "private_W"} {:source_elem_width 32} {:source_dimensions "1,1"} true;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel2"} {:kernel} $kernel2($length: bv32, $tsteps: bv32, $h0: bv32, $h3: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $tsteps == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $length == 64bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$c && !_WRITE_HAS_OCCURRED_$$c && !_ATOMIC_HAS_OCCURRED_$$c;
  requires !_READ_HAS_OCCURRED_$$sum_c && !_WRITE_HAS_OCCURRED_$$sum_c && !_ATOMIC_HAS_OCCURRED_$$sum_c;
  requires !_READ_HAS_OCCURRED_$$W && !_WRITE_HAS_OCCURRED_$$W && !_ATOMIC_HAS_OCCURRED_$$W;
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
  modifies $$c, _TRACKING, _WRITE_HAS_OCCURRED_$$c, _WRITE_READ_BENIGN_FLAG_$$c, _WRITE_READ_BENIGN_FLAG_$$c, _TRACKING;



implementation {:source_name "kernel2"} {:kernel} $kernel2($length: bv32, $tsteps: bv32, $h0: bv32, $h3: bv32)
{
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bv32;
  var v10$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    $g1.0$1 := BV32_MUL(32bv32, group_id_x$1);
    $g1.0$2 := BV32_MUL(32bv32, group_id_x$2);
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto __partitioned_block_$1_0;

  __partitioned_block_$1_0:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b22 ==> _WRITE_HAS_OCCURRED_$$c ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, $length);
    assert {:tag "nowrite"} _b21 ==> !_WRITE_HAS_OCCURRED_$$c;
    assert {:tag "predicatedEquality"} _b20 ==> p0$1 && p0$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b19 ==> p0$1 && p0$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b18 ==> p0$1 && p0$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b17 ==> p0$1 && p0$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b16 ==> p0$1 && p0$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b15 ==> p0$1 && p0$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b14 ==> p0$1 && p0$2 ==> v4$1 == v4$2;
    assert {:tag "predicatedEquality"} _b13 ==> p0$1 && p0$2 ==> v3$1 == v3$2;
    assert {:tag "predicatedEquality"} _b12 ==> p0$1 && p0$2 ==> v2$1 == v2$2;
    assert {:tag "predicatedEquality"} _b11 ==> p0$1 && p0$2 ==> v1$1 == v1$2;
    assert {:tag "predicatedEquality"} _b10 ==> p0$1 && p0$2 ==> $g1.0$1 == $g1.0$2;
    assert {:tag "loopPredicateEquality"} _b9 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p0$1 == p0$2;
    assert {:tag "loopPredicateEquality"} _b8 ==> p0$1 == p0$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b7 ==> BV32_SLT($g1.0$1, BV32_SDIV($h3, 2bv32)) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b7 ==> BV32_SLT($g1.0$2, BV32_SDIV($h3, 2bv32)) ==> p0$2;
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
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b0 ==> BV32_AND(BV32_SUB(1048576bv32, 1bv32), $g1.0$1) == BV32_AND(BV32_SUB(1048576bv32, 1bv32), BV32_MUL(32bv32, group_id_x$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b0 ==> BV32_AND(BV32_SUB(1048576bv32, 1bv32), $g1.0$2) == BV32_AND(BV32_SUB(1048576bv32, 1bv32), BV32_MUL(32bv32, group_id_x$2));
    assert {:block_sourceloc} {:sourceloc_num 3} p0$1 ==> true;
    v1$1 := (if p0$1 then BV32_SLT($g1.0$1, BV32_SDIV($h3, 2bv32)) else v1$1);
    v1$2 := (if p0$2 then BV32_SLT($g1.0$2, BV32_SDIV($h3, 2bv32)) else v1$2);
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
    p1$1 := (if p0$1 && v1$1 then v1$1 else p1$1);
    p1$2 := (if p0$2 && v1$2 then v1$2 else p1$2);
    p0$1 := (if p0$1 && !v1$1 then v1$1 else p0$1);
    p0$2 := (if p0$2 && !v1$2 then v1$2 else p0$2);
    v2$1 := (if p1$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v0$1), BV32_MUL(2bv32, $g1.0$1)), 2bv32)) else v2$1);
    v2$2 := (if p1$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v0$2), BV32_MUL(2bv32, $g1.0$2)), 2bv32)) else v2$2);
    p3$1 := (if p1$1 && v2$1 then v2$1 else p3$1);
    p3$2 := (if p1$2 && v2$2 then v2$2 else p3$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p3$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p3$2 then _HAVOC_bv32$2 else v3$2);
    $$private_W$0bv32$1 := (if p3$1 then v3$1 else $$private_W$0bv32$1);
    $$private_W$0bv32$2 := (if p3$2 then v3$2 else $$private_W$0bv32$2);
    v4$1 := (if p1$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v0$1), BV32_MUL(2bv32, $g1.0$1)), 2bv32)) else v4$1);
    v4$2 := (if p1$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v0$2), BV32_MUL(2bv32, $g1.0$2)), 2bv32)) else v4$2);
    p5$1 := (if p1$1 && v4$1 then v4$1 else p5$1);
    p5$2 := (if p1$2 && v4$2 then v4$2 else p5$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v5$1 := (if p5$1 then _HAVOC_bv32$1 else v5$1);
    v5$2 := (if p5$2 then _HAVOC_bv32$2 else v5$2);
    $$private_sum_c$0bv32$1 := (if p5$1 then v5$1 else $$private_sum_c$0bv32$1);
    $$private_sum_c$0bv32$2 := (if p5$2 then v5$2 else $$private_sum_c$0bv32$2);
    v6$1 := (if p1$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v0$1), BV32_MUL(2bv32, $g1.0$1)), 2bv32)) else v6$1);
    v6$2 := (if p1$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v0$2), BV32_MUL(2bv32, $g1.0$2)), 2bv32)) else v6$2);
    p7$1 := (if p1$1 && v6$1 then v6$1 else p7$1);
    p7$2 := (if p1$2 && v6$2 then v6$2 else p7$2);
    v7$1 := (if p7$1 then $$private_sum_c$0bv32$1 else v7$1);
    v7$2 := (if p7$2 then $$private_sum_c$0bv32$2 else v7$2);
    v8$1 := (if p7$1 then $$private_W$0bv32$1 else v8$1);
    v8$2 := (if p7$2 then $$private_W$0bv32$2 else v8$2);
    $$private_c$0bv32$1 := (if p7$1 then BV32_ADD(v7$1, v8$1) else $$private_c$0bv32$1);
    $$private_c$0bv32$2 := (if p7$2 then BV32_ADD(v7$2, v8$2) else $$private_c$0bv32$2);
    goto __partitioned_block_$1_1;

  __partitioned_block_$1_1:
    call {:sourceloc_num 18} $bugle_barrier_duplicated_0(1bv1, 1bv1, p1$1, p1$2);
    v9$1 := (if p1$1 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v0$1), BV32_MUL(2bv32, $g1.0$1)), 2bv32)) else v9$1);
    v9$2 := (if p1$2 then BV32_SGE($h3, BV32_ADD(BV32_ADD(BV32_MUL(2bv32, v0$2), BV32_MUL(2bv32, $g1.0$2)), 2bv32)) else v9$2);
    p9$1 := (if p1$1 && v9$1 then v9$1 else p9$1);
    p9$2 := (if p1$2 && v9$2 then v9$2 else p9$2);
    v10$1 := (if p9$1 then $$private_c$0bv32$1 else v10$1);
    v10$2 := (if p9$2 then $$private_c$0bv32$2 else v10$2);
    call {:sourceloc} {:sourceloc_num 21} _LOG_WRITE_$$c(p9$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $length), BV32_SDIV($h3, 2bv32)), v10$1, $$c[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $length), BV32_SDIV($h3, 2bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$c(p9$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $length), BV32_SDIV($h3, 2bv32)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 21} _CHECK_WRITE_$$c(p9$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $length), BV32_SDIV($h3, 2bv32)), v10$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$c"} true;
    $$c[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $length), BV32_SDIV($h3, 2bv32))] := (if p9$1 then v10$1 else $$c[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $length), BV32_SDIV($h3, 2bv32))]);
    $$c[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $length), BV32_SDIV($h3, 2bv32))] := (if p9$2 then v10$2 else $$c[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $length), BV32_SDIV($h3, 2bv32))]);
    goto __partitioned_block_$1_2;

  __partitioned_block_$1_2:
    call {:sourceloc_num 23} $bugle_barrier_duplicated_1(1bv1, 1bv1, p1$1, p1$2);
    $g1.0$1 := (if p1$1 then BV32_ADD($g1.0$1, 1048576bv32) else $g1.0$1);
    $g1.0$2 := (if p1$2 then BV32_ADD($g1.0$2, 1048576bv32) else $g1.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    return;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto __partitioned_block_$1_0;
}



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

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$c, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$c, _TRACKING;



var $$private_c$0bv32$1: bv32;

var $$private_c$0bv32$2: bv32;

var $$private_sum_c$0bv32$1: bv32;

var $$private_sum_c$0bv32$2: bv32;

var $$private_W$0bv32$1: bv32;

var $$private_W$0bv32$2: bv32;

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



const _WATCHED_VALUE_$$W: bv32;

procedure {:inline 1} _LOG_READ_$$W(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$W;



implementation {:inline 1} _LOG_READ_$$W(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$W := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$W == _value then true else _READ_HAS_OCCURRED_$$W);
    return;
}



procedure _CHECK_READ_$$W(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "W"} {:array "$$W"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$W && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$W);
  requires {:source_name "W"} {:array "$$W"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$W && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$W: bool;

procedure {:inline 1} _LOG_WRITE_$$W(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$W, _WRITE_READ_BENIGN_FLAG_$$W;



implementation {:inline 1} _LOG_WRITE_$$W(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$W := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$W == _value then true else _WRITE_HAS_OCCURRED_$$W);
    _WRITE_READ_BENIGN_FLAG_$$W := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$W == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$W);
    return;
}



procedure _CHECK_WRITE_$$W(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "W"} {:array "$$W"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$W && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$W != _value);
  requires {:source_name "W"} {:array "$$W"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$W && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$W != _value);
  requires {:source_name "W"} {:array "$$W"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$W && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$W(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$W;



implementation {:inline 1} _LOG_ATOMIC_$$W(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$W := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$W);
    return;
}



procedure _CHECK_ATOMIC_$$W(_P: bool, _offset: bv32);
  requires {:source_name "W"} {:array "$$W"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$W && _WATCHED_OFFSET == _offset);
  requires {:source_name "W"} {:array "$$W"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$W && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$W(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$W;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$W(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$W := (if _P && _WRITE_HAS_OCCURRED_$$W && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$W);
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
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$c;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$c;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$c;
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
    havoc $$c;
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
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$c;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$c;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$c;
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
    havoc $$c;
    goto anon3;

  anon4_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

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

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b22: bool;
