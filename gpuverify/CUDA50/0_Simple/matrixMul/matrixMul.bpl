type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "C"} {:global} $$C: [bv32]bv32;

axiom {:array_info "$$C"} {:global} {:elem_width 32} {:source_name "C"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$C: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$C: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$C: bool;

axiom {:array_info "$$A"} {:global} {:elem_width 32} {:source_name "A"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$A: bool;

axiom {:array_info "$$B"} {:global} {:elem_width 32} {:source_name "B"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$B: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$B: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$B: bool;

var {:source_name "As"} {:group_shared} $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As"} {:group_shared} {:elem_width 32} {:source_name "As"} {:source_elem_width 32} {:source_dimensions "32,32"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,32"} _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,32"} _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,32"} _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As: bool;

var {:source_name "Bs"} {:group_shared} $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs"} {:group_shared} {:elem_width 32} {:source_name "Bs"} {:source_elem_width 32} {:source_dimensions "32,32"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,32"} _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,32"} _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,32"} _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs: bool;

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

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "matrixMulCUDA<32>"} {:kernel} $_Z13matrixMulCUDAILi32EEvPfS0_S0_ii($wA: bv32, $wB: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $wA == 320bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $wB == 640bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$C && !_WRITE_HAS_OCCURRED_$$C && !_ATOMIC_HAS_OCCURRED_$$C;
  requires !_READ_HAS_OCCURRED_$$A && !_WRITE_HAS_OCCURRED_$$A && !_ATOMIC_HAS_OCCURRED_$$A;
  requires !_READ_HAS_OCCURRED_$$B && !_WRITE_HAS_OCCURRED_$$B && !_ATOMIC_HAS_OCCURRED_$$B;
  requires !_READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As && !_WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As && !_ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;
  requires !_READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs && !_WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs && !_ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;
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
  modifies $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As, $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs, _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As, _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As, _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As, _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs, _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs, _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs, $$C, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As, _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs, _TRACKING, _WRITE_HAS_OCCURRED_$$C, _WRITE_READ_BENIGN_FLAG_$$C, _WRITE_READ_BENIGN_FLAG_$$C;



implementation {:source_name "matrixMulCUDA<32>"} {:kernel} $_Z13matrixMulCUDAILi32EEvPfS0_S0_ii($wA: bv32, $wB: bv32)
{
  var $Csub.0$1: bv32;
  var $Csub.0$2: bv32;
  var $a.0$1: bv32;
  var $a.0$2: bv32;
  var $b.0$1: bv32;
  var $b.0$2: bv32;
  var $Csub.1$1: bv32;
  var $Csub.1$2: bv32;
  var $k.0$1: bv32;
  var $k.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_MUL(BV32_MUL($wA, 32bv32), group_id_y$1);
    v0$2 := BV32_MUL(BV32_MUL($wA, 32bv32), group_id_y$2);
    $Csub.0$1, $a.0$1, $b.0$1 := 0bv32, v0$1, BV32_MUL(32bv32, group_id_x$1);
    $Csub.0$2, $a.0$2, $b.0$2 := 0bv32, v0$2, BV32_MUL(32bv32, group_id_x$2);
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto __partitioned_block_$1_0;

  __partitioned_block_$1_0:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b37 ==> _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs ==> _WATCHED_OFFSET == BV32_ADD(BV32_MUL(local_id_y$1, 32bv32), local_id_x$1);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b36 ==> _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 32bv32), local_id_x$1));
    assert {:tag "nowrite"} _b35 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;
    assert {:tag "noread"} _b34 ==> !_READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;
    assert {:tag "accessBreak"} _b33 ==> _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As ==> local_id_y$1 == BV32_DIV(_WATCHED_OFFSET, 32bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b32 ==> _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As ==> _WATCHED_OFFSET == BV32_ADD(BV32_MUL(local_id_y$1, 32bv32), local_id_x$1);
    assert {:tag "nowrite"} _b31 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;
    assert {:tag "noread"} _b30 ==> !_READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;
    assert {:tag "predicatedEquality"} _b29 ==> p0$1 && p0$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b28 ==> p0$1 && p0$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b27 ==> p0$1 && p0$2 ==> v4$1 == v4$2;
    assert {:tag "predicatedEquality"} _b26 ==> p0$1 && p0$2 ==> v3$1 == v3$2;
    assert {:tag "predicatedEquality"} _b25 ==> p0$1 && p0$2 ==> v2$1 == v2$2;
    assert {:tag "predicatedEquality"} _b24 ==> p0$1 && p0$2 ==> v1$1 == v1$2;
    assert {:tag "predicatedEquality"} _b23 ==> p0$1 && p0$2 ==> $k.0$1 == $k.0$2;
    assert {:tag "predicatedEquality"} _b22 ==> p0$1 && p0$2 ==> $Csub.1$1 == $Csub.1$2;
    assert {:tag "predicatedEquality"} _b21 ==> p0$1 && p0$2 ==> $b.0$1 == $b.0$2;
    assert {:tag "predicatedEquality"} _b20 ==> p0$1 && p0$2 ==> $a.0$1 == $a.0$2;
    assert {:tag "predicatedEquality"} _b19 ==> p0$1 && p0$2 ==> $Csub.0$1 == $Csub.0$2;
    assert {:tag "loopPredicateEquality"} _b18 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p0$1 == p0$2;
    assert {:tag "loopPredicateEquality"} _b17 ==> p0$1 == p0$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b7 ==> BV32_SLE($a.0$1, BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL($wA, 32bv32), group_id_y$1), $wA), 1bv32)) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b7 ==> BV32_SLE($a.0$2, BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL($wA, 32bv32), group_id_y$2), $wA), 1bv32)) ==> p0$2;
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b6 ==> BV32_UGE($a.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b6 ==> BV32_UGE($a.0$2, v0$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b5 ==> BV32_ULE($a.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b5 ==> BV32_ULE($a.0$2, v0$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b4 ==> BV32_SGE($a.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b4 ==> BV32_SGE($a.0$2, v0$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b3 ==> BV32_SLE($a.0$1, v0$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b3 ==> BV32_SLE($a.0$2, v0$2);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p0$1 ==> _b2 ==> BV32_SUB($a.0$1, v0$1) == BV32_SUB($a.0$2, v0$2);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p0$2 ==> _b2 ==> BV32_SUB($a.0$2, v0$2) == BV32_SUB($a.0$1, v0$1);
    assert {:tag "guardNonNeg"} {:thread 1} p0$1 ==> _b1 ==> BV32_SLE(0bv32, $a.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p0$2 ==> _b1 ==> BV32_SLE(0bv32, $a.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b0 ==> BV32_AND(BV32_SUB(32bv32, 1bv32), $a.0$1) == BV32_AND(BV32_SUB(32bv32, 1bv32), BV32_MUL(BV32_MUL($wA, 32bv32), group_id_y$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b0 ==> BV32_AND(BV32_SUB(32bv32, 1bv32), $a.0$2) == BV32_AND(BV32_SUB(32bv32, 1bv32), BV32_MUL(BV32_MUL($wA, 32bv32), group_id_y$2));
    assert {:block_sourceloc} {:sourceloc_num 3} p0$1 ==> true;
    v1$1 := (if p0$1 then BV32_SLE($a.0$1, BV32_SUB(BV32_ADD(v0$1, $wA), 1bv32)) else v1$1);
    v1$2 := (if p0$2 then BV32_SLE($a.0$2, BV32_SUB(BV32_ADD(v0$2, $wA), 1bv32)) else v1$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p4$1 := false;
    p4$2 := false;
    p1$1 := (if p0$1 && v1$1 then v1$1 else p1$1);
    p1$2 := (if p0$2 && v1$2 then v1$2 else p1$2);
    p0$1 := (if p0$1 && !v1$1 then v1$1 else p0$1);
    p0$2 := (if p0$2 && !v1$2 then v1$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p1$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p1$2 then _HAVOC_bv32$2 else v2$2);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(p1$1, BV32_ADD(BV32_MUL(local_id_y$1, 32bv32), local_id_x$1), v2$1, $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 32bv32), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(p1$2, BV32_ADD(BV32_MUL(local_id_y$2, 32bv32), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(p1$2, BV32_ADD(BV32_MUL(local_id_y$2, 32bv32), local_id_x$2), v2$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As"} true;
    $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 32bv32), local_id_x$1)] := (if p1$1 then v2$1 else $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 32bv32), local_id_x$1)]);
    $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 32bv32), local_id_x$2)] := (if p1$2 then v2$2 else $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 32bv32), local_id_x$2)]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p1$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p1$2 then _HAVOC_bv32$2 else v3$2);
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(p1$1, BV32_ADD(BV32_MUL(local_id_y$1, 32bv32), local_id_x$1), v3$1, $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 32bv32), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(p1$2, BV32_ADD(BV32_MUL(local_id_y$2, 32bv32), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(p1$2, BV32_ADD(BV32_MUL(local_id_y$2, 32bv32), local_id_x$2), v3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs"} true;
    $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 32bv32), local_id_x$1)] := (if p1$1 then v3$1 else $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 32bv32), local_id_x$1)]);
    $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 32bv32), local_id_x$2)] := (if p1$2 then v3$2 else $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 32bv32), local_id_x$2)]);
    goto __partitioned_block_$1_1;

  __partitioned_block_$1_1:
    call {:sourceloc_num 9} $bugle_barrier_duplicated_0(1bv1, 1bv1, p1$1, p1$2);
    $Csub.1$1, $k.0$1 := (if p1$1 then $Csub.0$1 else $Csub.1$1), (if p1$1 then 0bv32 else $k.0$1);
    $Csub.1$2, $k.0$2 := (if p1$2 then $Csub.0$2 else $Csub.1$2), (if p1$2 then 0bv32 else $k.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b39 ==> _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 32bv32), local_id_x$1));
    assert {:tag "accessBreak"} _b38 ==> _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As ==> local_id_y$1 == BV32_DIV(_WATCHED_OFFSET, 32bv32);
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p2$1 ==> p0$1;
    assert p2$2 ==> p0$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b16 ==> _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs ==> BV32_SLE($a.0$1, BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL($wA, 32bv32), group_id_y$1), $wA), 1bv32));
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b15 ==> _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As ==> BV32_SLE($a.0$1, BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL($wA, 32bv32), group_id_y$1), $wA), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p2$1 ==> _b14 ==> p2$1 ==> BV32_SLE($a.0$1, BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL($wA, 32bv32), group_id_y$1), $wA), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p2$2 ==> _b14 ==> p2$2 ==> BV32_SLE($a.0$2, BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL($wA, 32bv32), group_id_y$2), $wA), 1bv32));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b13 ==> BV32_SLE($a.0$1, BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL($wA, 32bv32), group_id_y$1), $wA), 1bv32)) && BV32_SLT($k.0$1, 32bv32) ==> p2$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b13 ==> BV32_SLE($a.0$2, BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL($wA, 32bv32), group_id_y$2), $wA), 1bv32)) && BV32_SLT($k.0$2, 32bv32) ==> p2$2;
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b12 ==> BV32_UGE($k.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b12 ==> BV32_UGE($k.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b11 ==> BV32_ULE($k.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b11 ==> BV32_ULE($k.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b10 ==> BV32_SGE($k.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b10 ==> BV32_SGE($k.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b9 ==> BV32_SLE($k.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b9 ==> BV32_SLE($k.0$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p2$1 ==> _b8 ==> BV32_SLE(0bv32, $k.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p2$2 ==> _b8 ==> BV32_SLE(0bv32, $k.0$2);
    assert {:block_sourceloc} {:sourceloc_num 10} p2$1 ==> true;
    v4$1 := (if p2$1 then BV32_SLT($k.0$1, 32bv32) else v4$1);
    v4$2 := (if p2$2 then BV32_SLT($k.0$2, 32bv32) else v4$2);
    p3$1 := false;
    p3$2 := false;
    p3$1 := (if p2$1 && v4$1 then v4$1 else p3$1);
    p3$2 := (if p2$2 && v4$2 then v4$2 else p3$2);
    p2$1 := (if p2$1 && !v4$1 then v4$1 else p2$1);
    p2$2 := (if p2$2 && !v4$2 then v4$2 else p2$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(p3$1, BV32_ADD(BV32_MUL(local_id_y$1, 32bv32), $k.0$1), $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 32bv32), $k.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(p3$2, BV32_ADD(BV32_MUL(local_id_y$2, 32bv32), $k.0$2), $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 32bv32), $k.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As"} true;
    v5$1 := (if p3$1 then $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 32bv32), $k.0$1)] else v5$1);
    v5$2 := (if p3$2 then $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 32bv32), $k.0$2)] else v5$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(p3$1, BV32_ADD(BV32_MUL($k.0$1, 32bv32), local_id_x$1), $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs[1bv1][BV32_ADD(BV32_MUL($k.0$1, 32bv32), local_id_x$1)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(p3$2, BV32_ADD(BV32_MUL($k.0$2, 32bv32), local_id_x$2), $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0$2, 32bv32), local_id_x$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs"} true;
    v6$1 := (if p3$1 then $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs[1bv1][BV32_ADD(BV32_MUL($k.0$1, 32bv32), local_id_x$1)] else v6$1);
    v6$2 := (if p3$2 then $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0$2, 32bv32), local_id_x$2)] else v6$2);
    $Csub.1$1, $k.0$1 := (if p3$1 then FADD32($Csub.1$1, FMUL32(v5$1, v6$1)) else $Csub.1$1), (if p3$1 then BV32_ADD($k.0$1, 1bv32) else $k.0$1);
    $Csub.1$2, $k.0$2 := (if p3$2 then FADD32($Csub.1$2, FMUL32(v5$2, v6$2)) else $Csub.1$2), (if p3$2 then BV32_ADD($k.0$2, 1bv32) else $k.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, __partitioned_block_$3.tail_0;

  __partitioned_block_$3.tail_0:
    assume !p2$1 && !p2$2;
    goto __partitioned_block_$3.tail_1;

  __partitioned_block_$3.tail_1:
    call {:sourceloc_num 16} $bugle_barrier_duplicated_1(1bv1, 1bv1, p1$1, p1$2);
    $Csub.0$1, $a.0$1, $b.0$1 := (if p1$1 then $Csub.1$1 else $Csub.0$1), (if p1$1 then BV32_ADD($a.0$1, 32bv32) else $a.0$1), (if p1$1 then BV32_ADD($b.0$1, BV32_MUL(32bv32, $wB)) else $b.0$1);
    $Csub.0$2, $a.0$2, $b.0$2 := (if p1$2 then $Csub.1$2 else $Csub.0$2), (if p1$2 then BV32_ADD($a.0$2, 32bv32) else $a.0$2), (if p1$2 then BV32_ADD($b.0$2, BV32_MUL(32bv32, $wB)) else $b.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$C(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL($wB, 32bv32), group_id_y$1), BV32_MUL(32bv32, group_id_x$1)), BV32_MUL($wB, local_id_y$1)), local_id_x$1), $Csub.0$1, $$C[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL($wB, 32bv32), group_id_y$1), BV32_MUL(32bv32, group_id_x$1)), BV32_MUL($wB, local_id_y$1)), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL($wB, 32bv32), group_id_y$2), BV32_MUL(32bv32, group_id_x$2)), BV32_MUL($wB, local_id_y$2)), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$C(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL($wB, 32bv32), group_id_y$2), BV32_MUL(32bv32, group_id_x$2)), BV32_MUL($wB, local_id_y$2)), local_id_x$2), $Csub.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL($wB, 32bv32), group_id_y$1), BV32_MUL(32bv32, group_id_x$1)), BV32_MUL($wB, local_id_y$1)), local_id_x$1)] := $Csub.0$1;
    $$C[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL($wB, 32bv32), group_id_y$2), BV32_MUL(32bv32, group_id_x$2)), BV32_MUL($wB, local_id_y$2)), local_id_x$2)] := $Csub.0$2;
    return;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto __partitioned_block_$1_0;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $3;
}



axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 20bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 10bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As, $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs, $$C, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As, $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs, $$C, _TRACKING;



function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

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

const {:existential true} _b16: bool;

const _WATCHED_VALUE_$$C: bv32;

procedure {:inline 1} _LOG_READ_$$C(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$C;



implementation {:inline 1} _LOG_READ_$$C(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C == _value then true else _READ_HAS_OCCURRED_$$C);
    return;
}



procedure _CHECK_READ_$$C(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "C"} {:array "$$C"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$C);
  requires {:source_name "C"} {:array "$$C"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$C: bool;

procedure {:inline 1} _LOG_WRITE_$$C(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$C, _WRITE_READ_BENIGN_FLAG_$$C;



implementation {:inline 1} _LOG_WRITE_$$C(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C == _value then true else _WRITE_HAS_OCCURRED_$$C);
    _WRITE_READ_BENIGN_FLAG_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$C);
    return;
}



procedure _CHECK_WRITE_$$C(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "C"} {:array "$$C"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C != _value);
  requires {:source_name "C"} {:array "$$C"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C != _value);
  requires {:source_name "C"} {:array "$$C"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$C(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$C;



implementation {:inline 1} _LOG_ATOMIC_$$C(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$C);
    return;
}



procedure _CHECK_ATOMIC_$$C(_P: bool, _offset: bv32);
  requires {:source_name "C"} {:array "$$C"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);
  requires {:source_name "C"} {:array "$$C"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$C;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$C := (if _P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$C);
    return;
}



const _WATCHED_VALUE_$$A: bv32;

procedure {:inline 1} _LOG_READ_$$A(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$A;



implementation {:inline 1} _LOG_READ_$$A(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$A := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A == _value then true else _READ_HAS_OCCURRED_$$A);
    return;
}



procedure _CHECK_READ_$$A(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "A"} {:array "$$A"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$A);
  requires {:source_name "A"} {:array "$$A"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$A && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$A: bool;

procedure {:inline 1} _LOG_WRITE_$$A(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$A, _WRITE_READ_BENIGN_FLAG_$$A;



implementation {:inline 1} _LOG_WRITE_$$A(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$A := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A == _value then true else _WRITE_HAS_OCCURRED_$$A);
    _WRITE_READ_BENIGN_FLAG_$$A := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$A == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$A);
    return;
}



procedure _CHECK_WRITE_$$A(_P: bool, _offset: bv32, _value: bv32);
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



const _WATCHED_VALUE_$$B: bv32;

procedure {:inline 1} _LOG_READ_$$B(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$B;



implementation {:inline 1} _LOG_READ_$$B(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$B := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$B == _value then true else _READ_HAS_OCCURRED_$$B);
    return;
}



procedure _CHECK_READ_$$B(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "B"} {:array "$$B"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$B);
  requires {:source_name "B"} {:array "$$B"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$B: bool;

procedure {:inline 1} _LOG_WRITE_$$B(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$B, _WRITE_READ_BENIGN_FLAG_$$B;



implementation {:inline 1} _LOG_WRITE_$$B(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$B := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$B == _value then true else _WRITE_HAS_OCCURRED_$$B);
    _WRITE_READ_BENIGN_FLAG_$$B := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$B == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$B);
    return;
}



procedure _CHECK_WRITE_$$B(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "B"} {:array "$$B"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$B != _value);
  requires {:source_name "B"} {:array "$$B"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$B != _value);
  requires {:source_name "B"} {:array "$$B"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$B(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$B;



implementation {:inline 1} _LOG_ATOMIC_$$B(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$B := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$B);
    return;
}



procedure _CHECK_ATOMIC_$$B(_P: bool, _offset: bv32);
  requires {:source_name "B"} {:array "$$B"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset);
  requires {:source_name "B"} {:array "$$B"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$B(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$B;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$B(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$B := (if _P && _WRITE_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$B);
    return;
}



const _WATCHED_VALUE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;



implementation {:inline 1} _LOG_READ_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As == _value then true else _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As);
    return;
}



procedure _CHECK_READ_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "As"} {:array "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "As"} {:array "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As, _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;



implementation {:inline 1} _LOG_WRITE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As);
    return;
}



procedure _CHECK_WRITE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "As"} {:array "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "As"} {:array "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "As"} {:array "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(_P: bool, _offset: bv32);
  requires {:source_name "As"} {:array "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "As"} {:array "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As);
    return;
}



const _WATCHED_VALUE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;



implementation {:inline 1} _LOG_READ_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs == _value then true else _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs);
    return;
}



procedure _CHECK_READ_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Bs"} {:array "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "Bs"} {:array "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs, _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;



implementation {:inline 1} _LOG_WRITE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs);
    return;
}



procedure _CHECK_WRITE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Bs"} {:array "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "Bs"} {:array "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "Bs"} {:array "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(_P: bool, _offset: bv32);
  requires {:source_name "Bs"} {:array "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "Bs"} {:array "$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$C;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$C;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$C;
    goto anon6;

  anon6:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$C;
    goto anon8;

  anon10_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;
    goto anon4;

  anon4:
    havoc $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;
    goto anon5;

  anon9_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$C;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$C;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$C;
    goto anon6;

  anon6:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$C;
    goto anon8;

  anon10_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2As;
    goto anon4;

  anon4:
    havoc $$_ZZ13matrixMulCUDAILi32EEvPfS0_S0_iiE2Bs;
    goto anon5;

  anon9_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

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

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b33: bool;

const {:existential true} _b34: bool;

const {:existential true} _b35: bool;

const {:existential true} _b36: bool;

const {:existential true} _b37: bool;

const {:existential true} _b38: bool;

const {:existential true} _b39: bool;
