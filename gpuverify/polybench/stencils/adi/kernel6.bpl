type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



var {:source_name "X"} {:global} $$X: [bv32]bv64;

axiom {:array_info "$$X"} {:global} {:elem_width 64} {:source_name "X"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$X: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$X: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$X: bool;

axiom {:array_info "$$A"} {:global} {:elem_width 64} {:source_name "A"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$A: bool;

axiom {:array_info "$$B"} {:global} {:elem_width 64} {:source_name "B"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$B: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$B: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$B: bool;

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

function FDIV64(bv64, bv64) : bv64;

function FMUL64(bv64, bv64) : bv64;

function FSUB64(bv64, bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel6"} {:kernel} $kernel6($n: bv32, $tsteps: bv32, $h0: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $tsteps == 32bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $n == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$X && !_WRITE_HAS_OCCURRED_$$X && !_ATOMIC_HAS_OCCURRED_$$X;
  requires !_READ_HAS_OCCURRED_$$A && !_WRITE_HAS_OCCURRED_$$A && !_ATOMIC_HAS_OCCURRED_$$A;
  requires !_READ_HAS_OCCURRED_$$B && !_WRITE_HAS_OCCURRED_$$B && !_ATOMIC_HAS_OCCURRED_$$B;
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
  modifies $$kernel6.shared_A, _WRITE_HAS_OCCURRED_$$kernel6.shared_A, _WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A, _WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A, $$X, _TRACKING, _READ_HAS_OCCURRED_$$X, _READ_HAS_OCCURRED_$$kernel6.shared_A, _WRITE_HAS_OCCURRED_$$X, _WRITE_READ_BENIGN_FLAG_$$X, _WRITE_READ_BENIGN_FLAG_$$X, _TRACKING;



implementation {:source_name "kernel6"} {:kernel} $kernel6($n: bv32, $tsteps: bv32, $h0: bv32)
{
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var $g5.0$1: bv32;
  var $g5.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $c0.0$1: bv32;
  var $c0.0$2: bv32;
  var $c2.0$1: bv32;
  var $c2.0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bool;
  var v3$2: bool;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bv64;
  var v6$2: bv64;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bv64;
  var v10$2: bv64;
  var v11$1: bv64;
  var v11$2: bv64;
  var v12$1: bv64;
  var v12$2: bv64;
  var v13$1: bv64;
  var v13$2: bv64;
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
  var _HAVOC_bv64$1: bv64;
  var _HAVOC_bv64$2: bv64;


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
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b68 ==> _WRITE_HAS_OCCURRED_$$kernel6.shared_A ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 32bv32), local_id_x$1));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b67 ==> _READ_HAS_OCCURRED_$$kernel6.shared_A ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, 31bv32), 32bv32), local_id_x$1));
    assert {:tag "nowrite"} _b66 ==> !_WRITE_HAS_OCCURRED_$$kernel6.shared_A;
    assert {:tag "noread"} _b65 ==> !_READ_HAS_OCCURRED_$$kernel6.shared_A;
    assert {:tag "nowrite"} _b64 ==> !_WRITE_HAS_OCCURRED_$$X;
    assert {:tag "noread"} _b63 ==> !_READ_HAS_OCCURRED_$$X;
    assert {:tag "predicatedEquality"} _b62 ==> p0$1 && p0$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b61 ==> p0$1 && p0$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b60 ==> p0$1 && p0$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b59 ==> p0$1 && p0$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b58 ==> p0$1 && p0$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b57 ==> p0$1 && p0$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b56 ==> p0$1 && p0$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b55 ==> p0$1 && p0$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b54 ==> p0$1 && p0$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b53 ==> p0$1 && p0$2 ==> v4$1 == v4$2;
    assert {:tag "predicatedEquality"} _b52 ==> p0$1 && p0$2 ==> v3$1 == v3$2;
    assert {:tag "predicatedEquality"} _b51 ==> p0$1 && p0$2 ==> v2$1 == v2$2;
    assert {:tag "predicatedEquality"} _b50 ==> p0$1 && p0$2 ==> v1$1 == v1$2;
    assert {:tag "predicatedEquality"} _b49 ==> p0$1 && p0$2 ==> $1$1 == $1$2;
    assert {:tag "predicatedEquality"} _b48 ==> p0$1 && p0$2 ==> $c2.0$1 == $c2.0$2;
    assert {:tag "predicatedEquality"} _b47 ==> p0$1 && p0$2 ==> $c0.0$1 == $c0.0$2;
    assert {:tag "predicatedEquality"} _b46 ==> p0$1 && p0$2 ==> $0$1 == $0$2;
    assert {:tag "predicatedEquality"} _b45 ==> p0$1 && p0$2 ==> $g5.0$1 == $g5.0$2;
    assert {:tag "predicatedEquality"} _b44 ==> p0$1 && p0$2 ==> $g1.0$1 == $g1.0$2;
    assert {:tag "loopPredicateEquality"} _b43 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p0$1 == p0$2;
    assert {:tag "loopPredicateEquality"} _b42 ==> p0$1 == p0$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b7 ==> BV32_SLT($g1.0$1, $n) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b7 ==> BV32_SLT($g1.0$2, $n) ==> p0$2;
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
    v1$1 := (if p0$1 then BV32_SLT($g1.0$1, $n) else v1$1);
    v1$2 := (if p0$2 then BV32_SLT($g1.0$2, $n) else v1$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p16$1 := false;
    p16$2 := false;
    p1$1 := (if p0$1 && v1$1 then v1$1 else p1$1);
    p1$2 := (if p0$2 && v1$2 then v1$2 else p1$2);
    p0$1 := (if p0$1 && !v1$1 then v1$1 else p0$1);
    p0$2 := (if p0$2 && !v1$2 then v1$2 else p0$2);
    $g5.0$1 := (if p1$1 then 0bv32 else $g5.0$1);
    $g5.0$2 := (if p1$2 then 0bv32 else $g5.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b93 ==> _WRITE_HAS_OCCURRED_$$kernel6.shared_A ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 32bv32), local_id_x$1));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b92 ==> _READ_HAS_OCCURRED_$$kernel6.shared_A ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, 31bv32), 32bv32), local_id_x$1));
    assert {:tag "nowrite"} _b91 ==> !_WRITE_HAS_OCCURRED_$$kernel6.shared_A;
    assert {:tag "noread"} _b90 ==> !_READ_HAS_OCCURRED_$$kernel6.shared_A;
    assert {:tag "nowrite"} _b89 ==> !_WRITE_HAS_OCCURRED_$$X;
    assert {:tag "noread"} _b88 ==> !_READ_HAS_OCCURRED_$$X;
    assert {:tag "predicatedEquality"} _b87 ==> p2$1 && p2$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b86 ==> p2$1 && p2$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b85 ==> p2$1 && p2$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b84 ==> p2$1 && p2$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b83 ==> p2$1 && p2$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b82 ==> p2$1 && p2$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b81 ==> p2$1 && p2$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b80 ==> p2$1 && p2$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b79 ==> p2$1 && p2$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b78 ==> p2$1 && p2$2 ==> v4$1 == v4$2;
    assert {:tag "predicatedEquality"} _b77 ==> p2$1 && p2$2 ==> v3$1 == v3$2;
    assert {:tag "predicatedEquality"} _b76 ==> p2$1 && p2$2 ==> v2$1 == v2$2;
    assert {:tag "predicatedEquality"} _b75 ==> p2$1 && p2$2 ==> $1$1 == $1$2;
    assert {:tag "predicatedEquality"} _b74 ==> p2$1 && p2$2 ==> $c2.0$1 == $c2.0$2;
    assert {:tag "predicatedEquality"} _b73 ==> p2$1 && p2$2 ==> $c0.0$1 == $c0.0$2;
    assert {:tag "predicatedEquality"} _b72 ==> p2$1 && p2$2 ==> $0$1 == $0$2;
    assert {:tag "predicatedEquality"} _b71 ==> p2$1 && p2$2 ==> $g5.0$1 == $g5.0$2;
    assert {:tag "loopPredicateEquality"} _b70 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p2$1 == p2$2;
    assert {:tag "loopPredicateEquality"} _b69 ==> p2$1 == p2$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p2$1 ==> p0$1;
    assert p2$2 ==> p0$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b18 ==> _WRITE_HAS_OCCURRED_$$kernel6.shared_A ==> BV32_SLT($g1.0$1, $n);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b17 ==> _READ_HAS_OCCURRED_$$kernel6.shared_A ==> BV32_SLT($g1.0$1, $n);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p2$1 ==> _b16 ==> p2$1 ==> BV32_SLT($g1.0$1, $n);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p2$2 ==> _b16 ==> p2$2 ==> BV32_SLT($g1.0$2, $n);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b15 ==> BV32_SLT($g1.0$1, $n) && BV32_SLT($g5.0$1, BV32_SUB($n, 2bv32)) ==> p2$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b15 ==> BV32_SLT($g1.0$2, $n) && BV32_SLT($g5.0$2, BV32_SUB($n, 2bv32)) ==> p2$2;
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b14 ==> BV32_UGE($g5.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b14 ==> BV32_UGE($g5.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b13 ==> BV32_ULE($g5.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b13 ==> BV32_ULE($g5.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b12 ==> BV32_SGE($g5.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b12 ==> BV32_SGE($g5.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b11 ==> BV32_SLE($g5.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b11 ==> BV32_SLE($g5.0$2, 0bv32);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p2$1 ==> _b10 ==> BV32_SUB($g5.0$1, 0bv32) == BV32_SUB($g5.0$2, 0bv32);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p2$2 ==> _b10 ==> BV32_SUB($g5.0$2, 0bv32) == BV32_SUB($g5.0$1, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p2$1 ==> _b9 ==> BV32_SLE(0bv32, $g5.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p2$2 ==> _b9 ==> BV32_SLE(0bv32, $g5.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p2$1 ==> _b8 ==> BV32_AND(BV32_SUB(32bv32, 1bv32), $g5.0$1) == BV32_AND(BV32_SUB(32bv32, 1bv32), 0bv32);
    assert {:tag "loopCounterIsStrided"} {:thread 2} p2$2 ==> _b8 ==> BV32_AND(BV32_SUB(32bv32, 1bv32), $g5.0$2) == BV32_AND(BV32_SUB(32bv32, 1bv32), 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 5} p2$1 ==> true;
    v2$1 := (if p2$1 then BV32_SLT($g5.0$1, BV32_SUB($n, 2bv32)) else v2$1);
    v2$2 := (if p2$2 then BV32_SLT($g5.0$2, BV32_SUB($n, 2bv32)) else v2$2);
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
    p10$1 := false;
    p10$2 := false;
    p11$1 := false;
    p11$2 := false;
    p12$1 := false;
    p12$2 := false;
    p3$1 := (if p2$1 && v2$1 then v2$1 else p3$1);
    p3$2 := (if p2$2 && v2$2 then v2$2 else p3$2);
    p2$1 := (if p2$1 && !v2$1 then v2$1 else p2$1);
    p2$2 := (if p2$2 && !v2$2 then v2$2 else p2$2);
    v3$1 := (if p3$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v3$1);
    v3$2 := (if p3$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v3$2);
    p5$1 := (if p3$1 && v3$1 then v3$1 else p5$1);
    p5$2 := (if p3$2 && v3$2 then v3$2 else p5$2);
    v4$1 := (if p5$1 then BV32_SGT(0bv32, BV32_ADD(BV32_ADD(BV32_SUB(0bv32, $n), $g5.0$1), 34bv32)) else v4$1);
    v4$2 := (if p5$2 then BV32_SGT(0bv32, BV32_ADD(BV32_ADD(BV32_SUB(0bv32, $n), $g5.0$2), 34bv32)) else v4$2);
    p7$1 := (if p5$1 && v4$1 then v4$1 else p7$1);
    p7$2 := (if p5$2 && v4$2 then v4$2 else p7$2);
    p6$1 := (if p5$1 && !v4$1 then !v4$1 else p6$1);
    p6$2 := (if p5$2 && !v4$2 then !v4$2 else p6$2);
    $0$1 := (if p6$1 then BV32_ADD(BV32_ADD(BV32_SUB(0bv32, $n), $g5.0$1), 34bv32) else $0$1);
    $0$2 := (if p6$2 then BV32_ADD(BV32_ADD(BV32_SUB(0bv32, $n), $g5.0$2), 34bv32) else $0$2);
    $0$1 := (if p7$1 then 0bv32 else $0$1);
    $0$2 := (if p7$2 then 0bv32 else $0$2);
    $c0.0$1 := (if p5$1 then $0$1 else $c0.0$1);
    $c0.0$2 := (if p5$2 then $0$2 else $c0.0$2);
    p8$1 := (if p5$1 then true else p8$1);
    p8$2 := (if p5$2 then true else p8$2);
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b94 ==> _WRITE_HAS_OCCURRED_$$kernel6.shared_A ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 32bv32), local_id_x$1));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p8$1 ==> p2$1;
    assert p8$2 ==> p2$2;
    assert p2$1 ==> p0$1;
    assert p2$2 ==> p0$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b41 ==> _WRITE_HAS_OCCURRED_$$kernel6.shared_A ==> BV32_SLT($g1.0$1, $n) && BV32_SLT($g5.0$1, BV32_SUB($n, 2bv32)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p8$1 ==> _b40 ==> p8$1 ==> BV32_SLT($g1.0$1, $n) && BV32_SLT($g5.0$1, BV32_SUB($n, 2bv32)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p8$2 ==> _b40 ==> p8$2 ==> BV32_SLT($g1.0$2, $n) && BV32_SLT($g5.0$2, BV32_SUB($n, 2bv32)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$2, $g1.0$2), 1bv32));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b39 ==> BV32_SLT($g1.0$1, $n) && BV32_SLT($g5.0$1, BV32_SUB($n, 2bv32)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32)) && BV32_SLE($c0.0$1, 31bv32) ==> p8$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b39 ==> BV32_SLT($g1.0$2, $n) && BV32_SLT($g5.0$2, BV32_SUB($n, 2bv32)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$2, $g1.0$2), 1bv32)) && BV32_SLE($c0.0$2, 31bv32) ==> p8$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b38 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !_READ_HAS_OCCURRED_$$A;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b37 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !_WRITE_HAS_OCCURRED_$$kernel6.shared_A;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b36 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !p8$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b36 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) ==> !p8$2;
    assert {:tag "loopBound"} {:thread 1} p8$1 ==> _b35 ==> BV32_UGE($c0.0$1, $0$1);
    assert {:tag "loopBound"} {:thread 2} p8$2 ==> _b35 ==> BV32_UGE($c0.0$2, $0$2);
    assert {:tag "loopBound"} {:thread 1} p8$1 ==> _b34 ==> BV32_ULE($c0.0$1, $0$1);
    assert {:tag "loopBound"} {:thread 2} p8$2 ==> _b34 ==> BV32_ULE($c0.0$2, $0$2);
    assert {:tag "loopBound"} {:thread 1} p8$1 ==> _b33 ==> BV32_SGE($c0.0$1, $0$1);
    assert {:tag "loopBound"} {:thread 2} p8$2 ==> _b33 ==> BV32_SGE($c0.0$2, $0$2);
    assert {:tag "loopBound"} {:thread 1} p8$1 ==> _b32 ==> BV32_SLE($c0.0$1, $0$1);
    assert {:tag "loopBound"} {:thread 2} p8$2 ==> _b32 ==> BV32_SLE($c0.0$2, $0$2);
    assert {:tag "guardNonNeg"} {:thread 1} p8$1 ==> _b31 ==> BV32_SLE(0bv32, $c0.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p8$2 ==> _b31 ==> BV32_SLE(0bv32, $c0.0$2);
    assert {:block_sourceloc} {:sourceloc_num 11} p8$1 ==> true;
    v5$1 := (if p8$1 then BV32_SLE($c0.0$1, 31bv32) else v5$1);
    v5$2 := (if p8$2 then BV32_SLE($c0.0$2, 31bv32) else v5$2);
    p9$1 := false;
    p9$2 := false;
    p9$1 := (if p8$1 && v5$1 then v5$1 else p9$1);
    p9$2 := (if p8$2 && v5$2 then v5$2 else p9$2);
    p8$1 := (if p8$1 && !v5$1 then v5$1 else p8$1);
    p8$2 := (if p8$2 && !v5$2 then v5$2 else p8$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v6$1 := (if p9$1 then _HAVOC_bv64$1 else v6$1);
    v6$2 := (if p9$2 then _HAVOC_bv64$2 else v6$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$kernel6.shared_A(p9$1, BV32_ADD(BV32_MUL($c0.0$1, 32bv32), v0$1), v6$1, $$kernel6.shared_A[1bv1][BV32_ADD(BV32_MUL($c0.0$1, 32bv32), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel6.shared_A(p9$2, BV32_ADD(BV32_MUL($c0.0$2, 32bv32), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$kernel6.shared_A(p9$2, BV32_ADD(BV32_MUL($c0.0$2, 32bv32), v0$2), v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel6.shared_A"} true;
    $$kernel6.shared_A[1bv1][BV32_ADD(BV32_MUL($c0.0$1, 32bv32), v0$1)] := (if p9$1 then v6$1 else $$kernel6.shared_A[1bv1][BV32_ADD(BV32_MUL($c0.0$1, 32bv32), v0$1)]);
    $$kernel6.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($c0.0$2, 32bv32), v0$2)] := (if p9$2 then v6$2 else $$kernel6.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($c0.0$2, 32bv32), v0$2)]);
    $c0.0$1 := (if p9$1 then BV32_ADD($c0.0$1, 1bv32) else $c0.0$1);
    $c0.0$2 := (if p9$2 then BV32_ADD($c0.0$2, 1bv32) else $c0.0$2);
    p8$1 := (if p9$1 then true else p8$1);
    p8$2 := (if p9$2 then true else p8$2);
    goto $9.backedge, __partitioned_block_$9.tail_0;

  __partitioned_block_$9.tail_0:
    assume !p8$1 && !p8$2;
    goto __partitioned_block_$9.tail_1;

  __partitioned_block_$9.tail_1:
    call {:sourceloc_num 18} $bugle_barrier_duplicated_0(1bv1, 1bv1, p3$1, p3$2);
    v7$1 := (if p3$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v7$1);
    v7$2 := (if p3$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v7$2);
    p11$1 := (if p3$1 && v7$1 then v7$1 else p11$1);
    p11$2 := (if p3$2 && v7$2 then v7$2 else p11$2);
    $c2.0$1 := (if p11$1 then 0bv32 else $c2.0$1);
    $c2.0$2 := (if p11$2 then 0bv32 else $c2.0$2);
    p12$1 := (if p11$1 then true else p12$1);
    p12$2 := (if p11$2 then true else p12$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $15;

  $15:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b95 ==> _READ_HAS_OCCURRED_$$kernel6.shared_A ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, 31bv32), 32bv32), local_id_x$1));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel6.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p12$1 ==> p2$1;
    assert p12$2 ==> p2$2;
    assert p2$1 ==> p0$1;
    assert p2$2 ==> p0$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b30 ==> _READ_HAS_OCCURRED_$$kernel6.shared_A ==> BV32_SLT($g1.0$1, $n) && BV32_SLT($g5.0$1, BV32_SUB($n, 2bv32)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p12$1 ==> _b29 ==> p12$1 ==> BV32_SLT($g1.0$1, $n) && BV32_SLT($g5.0$1, BV32_SUB($n, 2bv32)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p12$2 ==> _b29 ==> p12$2 ==> BV32_SLT($g1.0$2, $n) && BV32_SLT($g5.0$2, BV32_SUB($n, 2bv32)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$2, $g1.0$2), 1bv32));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b28 ==> BV32_SLT($g1.0$1, $n) && BV32_SLT($g5.0$1, BV32_SUB($n, 2bv32)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32)) && BV32_SLT(BV32_SUB(BV32_SUB($n, $g5.0$1), 3bv32), 31bv32) ==> p12$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b28 ==> BV32_SLT($g1.0$2, $n) && BV32_SLT($g5.0$2, BV32_SUB($n, 2bv32)) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$2, $g1.0$2), 1bv32)) && BV32_SLT(BV32_SUB(BV32_SUB($n, $g5.0$2), 3bv32), 31bv32) ==> p12$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b27 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !_READ_HAS_OCCURRED_$$B;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b26 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !_READ_HAS_OCCURRED_$$kernel6.shared_A;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b25 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !_READ_HAS_OCCURRED_$$X;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b24 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !_WRITE_HAS_OCCURRED_$$X;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b23 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !p12$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b23 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) ==> !p12$2;
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b22 ==> BV32_UGE($c2.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b22 ==> BV32_UGE($c2.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b21 ==> BV32_ULE($c2.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b21 ==> BV32_ULE($c2.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b20 ==> BV32_SGE($c2.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b20 ==> BV32_SGE($c2.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b19 ==> BV32_SLE($c2.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b19 ==> BV32_SLE($c2.0$2, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 20} p12$1 ==> true;
    v8$1 := (if p12$1 then BV32_SLT(BV32_SUB(BV32_SUB($n, $g5.0$1), 3bv32), 31bv32) else v8$1);
    v8$2 := (if p12$2 then BV32_SLT(BV32_SUB(BV32_SUB($n, $g5.0$2), 3bv32), 31bv32) else v8$2);
    p13$1 := false;
    p13$2 := false;
    p14$1 := false;
    p14$2 := false;
    p15$1 := false;
    p15$2 := false;
    p14$1 := (if p12$1 && v8$1 then v8$1 else p14$1);
    p14$2 := (if p12$2 && v8$2 then v8$2 else p14$2);
    p13$1 := (if p12$1 && !v8$1 then !v8$1 else p13$1);
    p13$2 := (if p12$2 && !v8$2 then !v8$2 else p13$2);
    $1$1 := (if p13$1 then 31bv32 else $1$1);
    $1$2 := (if p13$2 then 31bv32 else $1$2);
    $1$1 := (if p14$1 then BV32_SUB(BV32_SUB($n, $g5.0$1), 3bv32) else $1$1);
    $1$2 := (if p14$2 then BV32_SUB(BV32_SUB($n, $g5.0$2), 3bv32) else $1$2);
    v9$1 := (if p12$1 then BV32_SLE($c2.0$1, $1$1) else v9$1);
    v9$2 := (if p12$2 then BV32_SLE($c2.0$2, $1$2) else v9$2);
    p15$1 := (if p12$1 && v9$1 then v9$1 else p15$1);
    p15$2 := (if p12$2 && v9$2 then v9$2 else p15$2);
    p12$1 := (if p12$1 && !v9$1 then v9$1 else p12$1);
    p12$2 := (if p12$2 && !v9$2 then v9$2 else p12$2);
    call {:sourceloc} {:sourceloc_num 25} _LOG_READ_$$X(p15$1, BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$1), $c2.0$1), 2bv32), $n), BV32_ADD(v0$1, $g1.0$1)), $$X[BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$1), $c2.0$1), 2bv32), $n), BV32_ADD(v0$1, $g1.0$1))]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 25} _CHECK_READ_$$X(p15$2, BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$2), $c2.0$2), 2bv32), $n), BV32_ADD(v0$2, $g1.0$2)), $$X[BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$2), $c2.0$2), 2bv32), $n), BV32_ADD(v0$2, $g1.0$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$X"} true;
    v10$1 := (if p15$1 then $$X[BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$1), $c2.0$1), 2bv32), $n), BV32_ADD(v0$1, $g1.0$1))] else v10$1);
    v10$2 := (if p15$2 then $$X[BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$2), $c2.0$2), 2bv32), $n), BV32_ADD(v0$2, $g1.0$2))] else v10$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_READ_$$X(p15$1, BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$1), $c2.0$1), 3bv32), $n), BV32_ADD(v0$1, $g1.0$1)), $$X[BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$1), $c2.0$1), 3bv32), $n), BV32_ADD(v0$1, $g1.0$1))]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 26} _CHECK_READ_$$X(p15$2, BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$2), $c2.0$2), 3bv32), $n), BV32_ADD(v0$2, $g1.0$2)), $$X[BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$2), $c2.0$2), 3bv32), $n), BV32_ADD(v0$2, $g1.0$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$X"} true;
    v11$1 := (if p15$1 then $$X[BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$1), $c2.0$1), 3bv32), $n), BV32_ADD(v0$1, $g1.0$1))] else v11$1);
    v11$2 := (if p15$2 then $$X[BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$2), $c2.0$2), 3bv32), $n), BV32_ADD(v0$2, $g1.0$2))] else v11$2);
    call {:sourceloc} {:sourceloc_num 27} _LOG_READ_$$kernel6.shared_A(p15$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_SUB(0bv32, $c2.0$1), 31bv32), 32bv32), v0$1), $$kernel6.shared_A[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_SUB(0bv32, $c2.0$1), 31bv32), 32bv32), v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 27} _CHECK_READ_$$kernel6.shared_A(p15$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_SUB(0bv32, $c2.0$2), 31bv32), 32bv32), v0$2), $$kernel6.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_SUB(0bv32, $c2.0$2), 31bv32), 32bv32), v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel6.shared_A"} true;
    v12$1 := (if p15$1 then $$kernel6.shared_A[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_SUB(0bv32, $c2.0$1), 31bv32), 32bv32), v0$1)] else v12$1);
    v12$2 := (if p15$2 then $$kernel6.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_SUB(0bv32, $c2.0$2), 31bv32), 32bv32), v0$2)] else v12$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v13$1 := (if p15$1 then _HAVOC_bv64$1 else v13$1);
    v13$2 := (if p15$2 then _HAVOC_bv64$2 else v13$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$X(p15$1, BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$1), $c2.0$1), 2bv32), $n), BV32_ADD(v0$1, $g1.0$1)), FDIV64(FADD64(FMUL64(FSUB64(9223372036854775808bv64, v11$1), v12$1), v10$1), v13$1), $$X[BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$1), $c2.0$1), 2bv32), $n), BV32_ADD(v0$1, $g1.0$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$X(p15$2, BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$2), $c2.0$2), 2bv32), $n), BV32_ADD(v0$2, $g1.0$2)));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$X(p15$2, BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$2), $c2.0$2), 2bv32), $n), BV32_ADD(v0$2, $g1.0$2)), FDIV64(FADD64(FMUL64(FSUB64(9223372036854775808bv64, v11$2), v12$2), v10$2), v13$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$X"} true;
    $$X[BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$1), $c2.0$1), 2bv32), $n), BV32_ADD(v0$1, $g1.0$1))] := (if p15$1 then FDIV64(FADD64(FMUL64(FSUB64(9223372036854775808bv64, v11$1), v12$1), v10$1), v13$1) else $$X[BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$1), $c2.0$1), 2bv32), $n), BV32_ADD(v0$1, $g1.0$1))]);
    $$X[BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$2), $c2.0$2), 2bv32), $n), BV32_ADD(v0$2, $g1.0$2))] := (if p15$2 then FDIV64(FADD64(FMUL64(FSUB64(9223372036854775808bv64, v11$2), v12$2), v10$2), v13$2) else $$X[BV32_ADD(BV32_MUL(BV32_SUB(BV32_SUB(BV32_SUB($n, $g5.0$2), $c2.0$2), 2bv32), $n), BV32_ADD(v0$2, $g1.0$2))]);
    $c2.0$1 := (if p15$1 then BV32_ADD($c2.0$1, 1bv32) else $c2.0$1);
    $c2.0$2 := (if p15$2 then BV32_ADD($c2.0$2, 1bv32) else $c2.0$2);
    p12$1 := (if p15$1 then true else p12$1);
    p12$2 := (if p15$2 then true else p12$2);
    goto $15.backedge, __partitioned_block_$15.tail_0;

  __partitioned_block_$15.tail_0:
    assume !p12$1 && !p12$2;
    goto __partitioned_block_$15.tail_1;

  __partitioned_block_$15.tail_1:
    call {:sourceloc_num 33} $bugle_barrier_duplicated_1(1bv1, 1bv1, p3$1, p3$2);
    $g5.0$1 := (if p3$1 then BV32_ADD($g5.0$1, 32bv32) else $g5.0$1);
    $g5.0$2 := (if p3$2 then BV32_ADD($g5.0$2, 32bv32) else $g5.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, $3.tail;

  $3.tail:
    assume !p2$1 && !p2$2;
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
    goto $1;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $3;

  $15.backedge:
    assume {:backedge} p12$1 || p12$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $15;

  $9.backedge:
    assume {:backedge} p8$1 || p8$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $9;
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
  modifies $$kernel6.shared_A, $$X, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel6.shared_A, $$X, _TRACKING;



function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b0: bool;

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

const _WATCHED_VALUE_$$X: bv64;

procedure {:inline 1} _LOG_READ_$$X(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$X;



implementation {:inline 1} _LOG_READ_$$X(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$X := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$X == _value then true else _READ_HAS_OCCURRED_$$X);
    return;
}



procedure _CHECK_READ_$$X(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "X"} {:array "$$X"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$X && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$X);
  requires {:source_name "X"} {:array "$$X"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$X && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$X: bool;

procedure {:inline 1} _LOG_WRITE_$$X(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$X, _WRITE_READ_BENIGN_FLAG_$$X;



implementation {:inline 1} _LOG_WRITE_$$X(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$X := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$X == _value then true else _WRITE_HAS_OCCURRED_$$X);
    _WRITE_READ_BENIGN_FLAG_$$X := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$X == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$X);
    return;
}



procedure _CHECK_WRITE_$$X(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "X"} {:array "$$X"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$X && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$X != _value);
  requires {:source_name "X"} {:array "$$X"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$X && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$X != _value);
  requires {:source_name "X"} {:array "$$X"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$X && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$X(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$X;



implementation {:inline 1} _LOG_ATOMIC_$$X(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$X := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$X);
    return;
}



procedure _CHECK_ATOMIC_$$X(_P: bool, _offset: bv32);
  requires {:source_name "X"} {:array "$$X"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$X && _WATCHED_OFFSET == _offset);
  requires {:source_name "X"} {:array "$$X"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$X && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$X(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$X;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$X(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$X := (if _P && _WRITE_HAS_OCCURRED_$$X && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$X);
    return;
}



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



const _WATCHED_VALUE_$$B: bv64;

procedure {:inline 1} _LOG_READ_$$B(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$B;



implementation {:inline 1} _LOG_READ_$$B(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$B := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$B == _value then true else _READ_HAS_OCCURRED_$$B);
    return;
}



procedure _CHECK_READ_$$B(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "B"} {:array "$$B"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$B);
  requires {:source_name "B"} {:array "$$B"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$B && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$B: bool;

procedure {:inline 1} _LOG_WRITE_$$B(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$B, _WRITE_READ_BENIGN_FLAG_$$B;



implementation {:inline 1} _LOG_WRITE_$$B(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$B := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$B == _value then true else _WRITE_HAS_OCCURRED_$$B);
    _WRITE_READ_BENIGN_FLAG_$$B := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$B == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$B);
    return;
}



procedure _CHECK_WRITE_$$B(_P: bool, _offset: bv32, _value: bv64);
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
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$X;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$X;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$X;
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
    havoc $$X;
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
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$X;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$X;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$X;
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
    havoc $$X;
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
