type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



var {:source_name "q"} {:global} $$q: [bv32]bv64;

axiom {:array_info "$$q"} {:global} {:elem_width 64} {:source_name "q"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$q: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$q: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$q: bool;

axiom {:array_info "$$p"} {:global} {:elem_width 64} {:source_name "p"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$p: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$p: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$p: bool;

axiom {:array_info "$$A"} {:global} {:elem_width 64} {:source_name "A"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$A: bool;

axiom {:array_info "$$private_q"} {:elem_width 64} {:source_name "private_q"} {:source_elem_width 64} {:source_dimensions "1"} true;

var {:source_name "shared_p"} {:group_shared} $$kernel0.shared_p: [bv1][bv32]bv64;

axiom {:array_info "$$kernel0.shared_p"} {:group_shared} {:elem_width 64} {:source_name "shared_p"} {:source_elem_width 64} {:source_dimensions "32"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$kernel0.shared_p: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$kernel0.shared_p: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_p: bool;

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

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel0"} {:kernel} $kernel0($ny: bv32, $nx: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $ny == 4096bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $nx == 4096bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$q && !_WRITE_HAS_OCCURRED_$$q && !_ATOMIC_HAS_OCCURRED_$$q;
  requires !_READ_HAS_OCCURRED_$$p && !_WRITE_HAS_OCCURRED_$$p && !_ATOMIC_HAS_OCCURRED_$$p;
  requires !_READ_HAS_OCCURRED_$$A && !_WRITE_HAS_OCCURRED_$$A && !_ATOMIC_HAS_OCCURRED_$$A;
  requires !_READ_HAS_OCCURRED_$$kernel0.shared_p && !_WRITE_HAS_OCCURRED_$$kernel0.shared_p && !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_p;
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
  modifies $$kernel0.shared_p, _READ_HAS_OCCURRED_$$q, _WRITE_HAS_OCCURRED_$$kernel0.shared_p, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_p, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_p, $$q, _TRACKING, _READ_HAS_OCCURRED_$$kernel0.shared_p, _TRACKING, _WRITE_HAS_OCCURRED_$$q, _WRITE_READ_BENIGN_FLAG_$$q, _WRITE_READ_BENIGN_FLAG_$$q, _TRACKING;



implementation {:source_name "kernel0"} {:kernel} $kernel0($ny: bv32, $nx: bv32)
{
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var $g5.0$1: bv32;
  var $g5.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
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
  var v4$1: bv64;
  var v4$2: bv64;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bv64;
  var v9$2: bv64;
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
  var v15$1: bv64;
  var v15$2: bv64;
  var v16$1: bv64;
  var v16$2: bv64;
  var v17$1: bv64;
  var v17$2: bv64;
  var v18$1: bool;
  var v18$2: bool;
  var v19$1: bv64;
  var v19$2: bv64;
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
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b59 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_p ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b58 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_p;
    assert {:tag "noread"} _b57 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_p;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b56 ==> _WRITE_HAS_OCCURRED_$$q ==> BV32_AND(BV32_SUB(1048576bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(1048576bv32, 1bv32), BV32_ADD(BV32_MUL(32bv32, group_id_x$1), local_id_x$1));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b55 ==> _READ_HAS_OCCURRED_$$q ==> BV32_AND(BV32_SUB(1048576bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(1048576bv32, 1bv32), BV32_ADD(BV32_MUL(32bv32, group_id_x$1), local_id_x$1));
    assert {:tag "nowrite"} _b54 ==> !_WRITE_HAS_OCCURRED_$$q;
    assert {:tag "noread"} _b53 ==> !_READ_HAS_OCCURRED_$$q;
    assert {:tag "predicatedEquality"} _b52 ==> p0$1 && p0$2 ==> v19$1 == v19$2;
    assert {:tag "predicatedEquality"} _b51 ==> p0$1 && p0$2 ==> v18$1 == v18$2;
    assert {:tag "predicatedEquality"} _b50 ==> p0$1 && p0$2 ==> v17$1 == v17$2;
    assert {:tag "predicatedEquality"} _b49 ==> p0$1 && p0$2 ==> v16$1 == v16$2;
    assert {:tag "predicatedEquality"} _b48 ==> p0$1 && p0$2 ==> v15$1 == v15$2;
    assert {:tag "predicatedEquality"} _b47 ==> p0$1 && p0$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b46 ==> p0$1 && p0$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b45 ==> p0$1 && p0$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b44 ==> p0$1 && p0$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b43 ==> p0$1 && p0$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b42 ==> p0$1 && p0$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b41 ==> p0$1 && p0$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b40 ==> p0$1 && p0$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b39 ==> p0$1 && p0$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b38 ==> p0$1 && p0$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b37 ==> p0$1 && p0$2 ==> v4$1 == v4$2;
    assert {:tag "predicatedEquality"} _b36 ==> p0$1 && p0$2 ==> v3$1 == v3$2;
    assert {:tag "predicatedEquality"} _b35 ==> p0$1 && p0$2 ==> v2$1 == v2$2;
    assert {:tag "predicatedEquality"} _b34 ==> p0$1 && p0$2 ==> v1$1 == v1$2;
    assert {:tag "predicatedEquality"} _b33 ==> p0$1 && p0$2 ==> $1$1 == $1$2;
    assert {:tag "predicatedEquality"} _b32 ==> p0$1 && p0$2 ==> $c2.0$1 == $c2.0$2;
    assert {:tag "predicatedEquality"} _b31 ==> p0$1 && p0$2 ==> $0$1 == $0$2;
    assert {:tag "predicatedEquality"} _b30 ==> p0$1 && p0$2 ==> $g5.0$1 == $g5.0$2;
    assert {:tag "predicatedEquality"} _b29 ==> p0$1 && p0$2 ==> $g1.0$1 == $g1.0$2;
    assert {:tag "loopPredicateEquality"} _b28 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p0$1 == p0$2;
    assert {:tag "loopPredicateEquality"} _b27 ==> p0$1 == p0$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_p ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_p ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_p ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b7 ==> BV32_SLT($g1.0$1, $nx) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b7 ==> BV32_SLT($g1.0$2, $nx) ==> p0$2;
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
    v1$1 := (if p0$1 then BV32_SLT($g1.0$1, $nx) else v1$1);
    v1$2 := (if p0$2 then BV32_SLT($g1.0$2, $nx) else v1$2);
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
    p26$1 := false;
    p26$2 := false;
    p1$1 := (if p0$1 && v1$1 then v1$1 else p1$1);
    p1$2 := (if p0$2 && v1$2 then v1$2 else p1$2);
    p0$1 := (if p0$1 && !v1$1 then v1$1 else p0$1);
    p0$2 := (if p0$2 && !v1$2 then v1$2 else p0$2);
    v2$1 := (if p1$1 then BV32_SGE($ny, 1bv32) else v2$1);
    v2$2 := (if p1$2 then BV32_SGE($ny, 1bv32) else v2$2);
    p3$1 := (if p1$1 && v2$1 then v2$1 else p3$1);
    p3$2 := (if p1$2 && v2$2 then v2$2 else p3$2);
    v3$1 := (if p3$1 then BV32_SGE($nx, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v3$1);
    v3$2 := (if p3$2 then BV32_SGE($nx, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v3$2);
    p5$1 := (if p3$1 && v3$1 then v3$1 else p5$1);
    p5$2 := (if p3$2 && v3$2 then v3$2 else p5$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_READ_$$q(p5$1, BV32_ADD(v0$1, $g1.0$1), $$q[BV32_ADD(v0$1, $g1.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 7} _CHECK_READ_$$q(p5$2, BV32_ADD(v0$2, $g1.0$2), $$q[BV32_ADD(v0$2, $g1.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$q"} true;
    v4$1 := (if p5$1 then $$q[BV32_ADD(v0$1, $g1.0$1)] else v4$1);
    v4$2 := (if p5$2 then $$q[BV32_ADD(v0$2, $g1.0$2)] else v4$2);
    $$private_q$0bv32$1 := (if p5$1 then v4$1 else $$private_q$0bv32$1);
    $$private_q$0bv32$2 := (if p5$2 then v4$2 else $$private_q$0bv32$2);
    $g5.0$1 := (if p1$1 then 0bv32 else $g5.0$1);
    $g5.0$2 := (if p1$2 then 0bv32 else $g5.0$2);
    p6$1 := (if p1$1 then true else p6$1);
    p6$2 := (if p1$2 then true else p6$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto __partitioned_block_$7_0;

  __partitioned_block_$7_0:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b81 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_p ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b80 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_p;
    assert {:tag "noread"} _b79 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_p;
    assert {:tag "predicatedEquality"} _b78 ==> p6$1 && p6$2 ==> v17$1 == v17$2;
    assert {:tag "predicatedEquality"} _b77 ==> p6$1 && p6$2 ==> v16$1 == v16$2;
    assert {:tag "predicatedEquality"} _b76 ==> p6$1 && p6$2 ==> v15$1 == v15$2;
    assert {:tag "predicatedEquality"} _b75 ==> p6$1 && p6$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b74 ==> p6$1 && p6$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b73 ==> p6$1 && p6$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b72 ==> p6$1 && p6$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b71 ==> p6$1 && p6$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b70 ==> p6$1 && p6$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b69 ==> p6$1 && p6$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b68 ==> p6$1 && p6$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b67 ==> p6$1 && p6$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b66 ==> p6$1 && p6$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b65 ==> p6$1 && p6$2 ==> $1$1 == $1$2;
    assert {:tag "predicatedEquality"} _b64 ==> p6$1 && p6$2 ==> $c2.0$1 == $c2.0$2;
    assert {:tag "predicatedEquality"} _b63 ==> p6$1 && p6$2 ==> $0$1 == $0$2;
    assert {:tag "predicatedEquality"} _b62 ==> p6$1 && p6$2 ==> $g5.0$1 == $g5.0$2;
    assert {:tag "loopPredicateEquality"} _b61 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p6$1 == p6$2;
    assert {:tag "loopPredicateEquality"} _b60 ==> p6$1 == p6$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_p ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_p ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_p ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p6$1 ==> p0$1;
    assert p6$2 ==> p0$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b16 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_p ==> BV32_SLT($g1.0$1, $nx);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b15 ==> _READ_HAS_OCCURRED_$$kernel0.shared_p ==> BV32_SLT($g1.0$1, $nx);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p6$1 ==> _b14 ==> p6$1 ==> BV32_SLT($g1.0$1, $nx);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p6$2 ==> _b14 ==> p6$2 ==> BV32_SLT($g1.0$2, $nx);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b13 ==> BV32_SLT($g1.0$1, $nx) && BV32_SGE($ny, 1bv32) ==> p6$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b13 ==> BV32_SLT($g1.0$2, $nx) && BV32_SGE($ny, 1bv32) ==> p6$2;
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b12 ==> BV32_UGE($g5.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b12 ==> BV32_UGE($g5.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b11 ==> BV32_ULE($g5.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b11 ==> BV32_ULE($g5.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b10 ==> BV32_SGE($g5.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b10 ==> BV32_SGE($g5.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b9 ==> BV32_SLE($g5.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b9 ==> BV32_SLE($g5.0$2, 0bv32);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p6$1 ==> _b8 ==> BV32_AND(BV32_SUB(32bv32, 1bv32), $g5.0$1) == BV32_AND(BV32_SUB(32bv32, 1bv32), 0bv32);
    assert {:tag "loopCounterIsStrided"} {:thread 2} p6$2 ==> _b8 ==> BV32_AND(BV32_SUB(32bv32, 1bv32), $g5.0$2) == BV32_AND(BV32_SUB(32bv32, 1bv32), 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 11} p6$1 ==> true;
    v5$1 := (if p6$1 then BV32_SGE($ny, 1bv32) else v5$1);
    v5$2 := (if p6$2 then BV32_SGE($ny, 1bv32) else v5$2);
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
    p24$1 := false;
    p24$2 := false;
    p25$1 := false;
    p25$2 := false;
    p8$1 := (if p6$1 && v5$1 then v5$1 else p8$1);
    p8$2 := (if p6$2 && v5$2 then v5$2 else p8$2);
    p7$1 := (if p6$1 && !v5$1 then !v5$1 else p7$1);
    p7$2 := (if p6$2 && !v5$2 then !v5$2 else p7$2);
    $0$1 := (if p7$1 then 0bv32 else $0$1);
    $0$2 := (if p7$2 then 0bv32 else $0$2);
    $0$1 := (if p8$1 then BV32_SUB($ny, 1bv32) else $0$1);
    $0$2 := (if p8$2 then BV32_SUB($ny, 1bv32) else $0$2);
    v6$1 := (if p6$1 then BV32_SLE($g5.0$1, $0$1) else v6$1);
    v6$2 := (if p6$2 then BV32_SLE($g5.0$2, $0$2) else v6$2);
    p9$1 := (if p6$1 && v6$1 then v6$1 else p9$1);
    p9$2 := (if p6$2 && v6$2 then v6$2 else p9$2);
    p6$1 := (if p6$1 && !v6$1 then v6$1 else p6$1);
    p6$2 := (if p6$2 && !v6$2 then v6$2 else p6$2);
    v7$1 := (if p9$1 then BV32_SGE($ny, BV32_ADD($g5.0$1, 1bv32)) else v7$1);
    v7$2 := (if p9$2 then BV32_SGE($ny, BV32_ADD($g5.0$2, 1bv32)) else v7$2);
    p11$1 := (if p9$1 && v7$1 then v7$1 else p11$1);
    p11$2 := (if p9$2 && v7$2 then v7$2 else p11$2);
    v8$1 := (if p11$1 then BV32_SGE($ny, BV32_ADD(BV32_ADD(v0$1, $g5.0$1), 1bv32)) else v8$1);
    v8$2 := (if p11$2 then BV32_SGE($ny, BV32_ADD(BV32_ADD(v0$2, $g5.0$2), 1bv32)) else v8$2);
    p13$1 := (if p11$1 && v8$1 then v8$1 else p13$1);
    p13$2 := (if p11$2 && v8$2 then v8$2 else p13$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v9$1 := (if p13$1 then _HAVOC_bv64$1 else v9$1);
    v9$2 := (if p13$2 then _HAVOC_bv64$2 else v9$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$kernel0.shared_p(p13$1, v0$1, v9$1, $$kernel0.shared_p[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_p(p13$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$kernel0.shared_p(p13$2, v0$2, v9$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel0.shared_p"} true;
    $$kernel0.shared_p[1bv1][v0$1] := (if p13$1 then v9$1 else $$kernel0.shared_p[1bv1][v0$1]);
    $$kernel0.shared_p[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := (if p13$2 then v9$2 else $$kernel0.shared_p[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    goto __partitioned_block_$7_1;

  __partitioned_block_$7_1:
    call {:sourceloc_num 22} $bugle_barrier_duplicated_1(1bv1, 1bv1, p9$1, p9$2);
    v10$1 := (if p9$1 then $g5.0$1 == 0bv32 else v10$1);
    v10$2 := (if p9$2 then $g5.0$2 == 0bv32 else v10$2);
    p15$1 := (if p9$1 && v10$1 then v10$1 else p15$1);
    p15$2 := (if p9$2 && v10$2 then v10$2 else p15$2);
    v11$1 := (if p15$1 then BV32_SGE($nx, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v11$1);
    v11$2 := (if p15$2 then BV32_SGE($nx, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v11$2);
    p17$1 := (if p15$1 && v11$1 then v11$1 else p17$1);
    p17$2 := (if p15$2 && v11$2 then v11$2 else p17$2);
    $$private_q$0bv32$1 := (if p17$1 then 0bv64 else $$private_q$0bv32$1);
    $$private_q$0bv32$2 := (if p17$2 then 0bv64 else $$private_q$0bv32$2);
    v12$1 := (if p9$1 then BV32_SGE($nx, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v12$1);
    v12$2 := (if p9$2 then BV32_SGE($nx, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v12$2);
    p19$1 := (if p9$1 && v12$1 then v12$1 else p19$1);
    p19$2 := (if p9$2 && v12$2 then v12$2 else p19$2);
    $c2.0$1 := (if p19$1 then 0bv32 else $c2.0$1);
    $c2.0$2 := (if p19$2 then 0bv32 else $c2.0$2);
    p20$1 := (if p19$1 then true else p20$1);
    p20$2 := (if p19$2 then true else p20$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $20;

  $20:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_p ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_p ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_p ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p20$1 ==> p6$1;
    assert p20$2 ==> p6$2;
    assert p6$1 ==> p0$1;
    assert p6$2 ==> p0$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b26 ==> _READ_HAS_OCCURRED_$$kernel0.shared_p ==> BV32_SLT($g1.0$1, $nx) && BV32_SLE($g5.0$1, $0$1) && BV32_SGE($nx, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p20$1 ==> _b25 ==> p20$1 ==> BV32_SLT($g1.0$1, $nx) && BV32_SLE($g5.0$1, $0$1) && BV32_SGE($nx, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p20$2 ==> _b25 ==> p20$2 ==> BV32_SLT($g1.0$2, $nx) && BV32_SLE($g5.0$2, $0$2) && BV32_SGE($nx, BV32_ADD(BV32_ADD(local_id_x$2, $g1.0$2), 1bv32));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b24 ==> BV32_SLT($g1.0$1, $nx) && BV32_SLE($g5.0$1, $0$1) && BV32_SGE($nx, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32)) && BV32_SLT(31bv32, BV32_SUB(BV32_SUB($ny, $g5.0$1), 1bv32)) ==> p20$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b24 ==> BV32_SLT($g1.0$2, $nx) && BV32_SLE($g5.0$2, $0$2) && BV32_SGE($nx, BV32_ADD(BV32_ADD(local_id_x$2, $g1.0$2), 1bv32)) && BV32_SLT(31bv32, BV32_SUB(BV32_SUB($ny, $g5.0$2), 1bv32)) ==> p20$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b23 ==> !BV32_SGE($nx, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !_READ_HAS_OCCURRED_$$kernel0.shared_p;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b22 ==> !BV32_SGE($nx, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !_READ_HAS_OCCURRED_$$A;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b21 ==> !BV32_SGE($nx, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !p20$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b21 ==> !BV32_SGE($nx, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) ==> !p20$2;
    assert {:tag "loopBound"} {:thread 1} p20$1 ==> _b20 ==> BV32_UGE($c2.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p20$2 ==> _b20 ==> BV32_UGE($c2.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p20$1 ==> _b19 ==> BV32_ULE($c2.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p20$2 ==> _b19 ==> BV32_ULE($c2.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p20$1 ==> _b18 ==> BV32_SGE($c2.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p20$2 ==> _b18 ==> BV32_SGE($c2.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p20$1 ==> _b17 ==> BV32_SLE($c2.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p20$2 ==> _b17 ==> BV32_SLE($c2.0$2, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 28} p20$1 ==> true;
    v13$1 := (if p20$1 then BV32_SLT(31bv32, BV32_SUB(BV32_SUB($ny, $g5.0$1), 1bv32)) else v13$1);
    v13$2 := (if p20$2 then BV32_SLT(31bv32, BV32_SUB(BV32_SUB($ny, $g5.0$2), 1bv32)) else v13$2);
    p21$1 := false;
    p21$2 := false;
    p22$1 := false;
    p22$2 := false;
    p23$1 := false;
    p23$2 := false;
    p22$1 := (if p20$1 && v13$1 then v13$1 else p22$1);
    p22$2 := (if p20$2 && v13$2 then v13$2 else p22$2);
    p21$1 := (if p20$1 && !v13$1 then !v13$1 else p21$1);
    p21$2 := (if p20$2 && !v13$2 then !v13$2 else p21$2);
    $1$1 := (if p21$1 then BV32_SUB(BV32_SUB($ny, $g5.0$1), 1bv32) else $1$1);
    $1$2 := (if p21$2 then BV32_SUB(BV32_SUB($ny, $g5.0$2), 1bv32) else $1$2);
    $1$1 := (if p22$1 then 31bv32 else $1$1);
    $1$2 := (if p22$2 then 31bv32 else $1$2);
    v14$1 := (if p20$1 then BV32_SLE($c2.0$1, $1$1) else v14$1);
    v14$2 := (if p20$2 then BV32_SLE($c2.0$2, $1$2) else v14$2);
    p23$1 := (if p20$1 && v14$1 then v14$1 else p23$1);
    p23$2 := (if p20$2 && v14$2 then v14$2 else p23$2);
    p20$1 := (if p20$1 && !v14$1 then v14$1 else p20$1);
    p20$2 := (if p20$2 && !v14$2 then v14$2 else p20$2);
    v15$1 := (if p23$1 then $$private_q$0bv32$1 else v15$1);
    v15$2 := (if p23$2 then $$private_q$0bv32$2 else v15$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v16$1 := (if p23$1 then _HAVOC_bv64$1 else v16$1);
    v16$2 := (if p23$2 then _HAVOC_bv64$2 else v16$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_READ_$$kernel0.shared_p(p23$1, $c2.0$1, $$kernel0.shared_p[1bv1][$c2.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 35} _CHECK_READ_$$kernel0.shared_p(p23$2, $c2.0$2, $$kernel0.shared_p[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c2.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel0.shared_p"} true;
    v17$1 := (if p23$1 then $$kernel0.shared_p[1bv1][$c2.0$1] else v17$1);
    v17$2 := (if p23$2 then $$kernel0.shared_p[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c2.0$2] else v17$2);
    $$private_q$0bv32$1 := (if p23$1 then FADD64(FMUL64(v16$1, v17$1), v15$1) else $$private_q$0bv32$1);
    $$private_q$0bv32$2 := (if p23$2 then FADD64(FMUL64(v16$2, v17$2), v15$2) else $$private_q$0bv32$2);
    $c2.0$1 := (if p23$1 then BV32_ADD($c2.0$1, 1bv32) else $c2.0$1);
    $c2.0$2 := (if p23$2 then BV32_ADD($c2.0$2, 1bv32) else $c2.0$2);
    p20$1 := (if p23$1 then true else p20$1);
    p20$2 := (if p23$2 then true else p20$2);
    goto $20.backedge, __partitioned_block_$20.tail_0;

  __partitioned_block_$20.tail_0:
    assume !p20$1 && !p20$2;
    goto __partitioned_block_$20.tail_1;

  __partitioned_block_$20.tail_1:
    call {:sourceloc_num 40} $bugle_barrier_duplicated_2(1bv1, 1bv1, p9$1, p9$2);
    $g5.0$1 := (if p9$1 then BV32_ADD($g5.0$1, 32bv32) else $g5.0$1);
    $g5.0$2 := (if p9$2 then BV32_ADD($g5.0$2, 32bv32) else $g5.0$2);
    p6$1 := (if p9$1 then true else p6$1);
    p6$2 := (if p9$2 then true else p6$2);
    goto $7.backedge, __partitioned_block_$7.tail_0;

  __partitioned_block_$7.tail_0:
    assume !p6$1 && !p6$2;
    v18$1 := (if p1$1 then BV32_SGE($nx, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v18$1);
    v18$2 := (if p1$2 then BV32_SGE($nx, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v18$2);
    p25$1 := (if p1$1 && v18$1 then v18$1 else p25$1);
    p25$2 := (if p1$2 && v18$2 then v18$2 else p25$2);
    v19$1 := (if p25$1 then $$private_q$0bv32$1 else v19$1);
    v19$2 := (if p25$2 then $$private_q$0bv32$2 else v19$2);
    call {:sourceloc} {:sourceloc_num 45} _LOG_WRITE_$$q(p25$1, BV32_ADD(v0$1, $g1.0$1), v19$1, $$q[BV32_ADD(v0$1, $g1.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$q(p25$2, BV32_ADD(v0$2, $g1.0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 45} _CHECK_WRITE_$$q(p25$2, BV32_ADD(v0$2, $g1.0$2), v19$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$q"} true;
    $$q[BV32_ADD(v0$1, $g1.0$1)] := (if p25$1 then v19$1 else $$q[BV32_ADD(v0$1, $g1.0$1)]);
    $$q[BV32_ADD(v0$2, $g1.0$2)] := (if p25$2 then v19$2 else $$q[BV32_ADD(v0$2, $g1.0$2)]);
    goto __partitioned_block_$7.tail_1;

  __partitioned_block_$7.tail_1:
    call {:sourceloc_num 47} $bugle_barrier_duplicated_0(1bv1, 1bv1, p1$1, p1$2);
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

  $7.backedge:
    assume {:backedge} p6$1 || p6$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto __partitioned_block_$7_0;

  $20.backedge:
    assume {:backedge} p20$1 || p20$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $20;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$kernel0.shared_p, $$q, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel0.shared_p, $$q, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel0.shared_p, $$q, _TRACKING;



var $$private_q$0bv32$1: bv64;

var $$private_q$0bv32$2: bv64;

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

const _WATCHED_VALUE_$$q: bv64;

procedure {:inline 1} _LOG_READ_$$q(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$q;



implementation {:inline 1} _LOG_READ_$$q(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$q == _value then true else _READ_HAS_OCCURRED_$$q);
    return;
}



procedure _CHECK_READ_$$q(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "q"} {:array "$$q"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$q);
  requires {:source_name "q"} {:array "$$q"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$q: bool;

procedure {:inline 1} _LOG_WRITE_$$q(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$q, _WRITE_READ_BENIGN_FLAG_$$q;



implementation {:inline 1} _LOG_WRITE_$$q(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$q == _value then true else _WRITE_HAS_OCCURRED_$$q);
    _WRITE_READ_BENIGN_FLAG_$$q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$q == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$q);
    return;
}



procedure _CHECK_WRITE_$$q(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "q"} {:array "$$q"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$q != _value);
  requires {:source_name "q"} {:array "$$q"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$q != _value);
  requires {:source_name "q"} {:array "$$q"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$q(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$q;



implementation {:inline 1} _LOG_ATOMIC_$$q(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$q := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$q);
    return;
}



procedure _CHECK_ATOMIC_$$q(_P: bool, _offset: bv32);
  requires {:source_name "q"} {:array "$$q"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset);
  requires {:source_name "q"} {:array "$$q"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$q(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$q;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$q(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$q := (if _P && _WRITE_HAS_OCCURRED_$$q && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$q);
    return;
}



const _WATCHED_VALUE_$$p: bv64;

procedure {:inline 1} _LOG_READ_$$p(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$p;



implementation {:inline 1} _LOG_READ_$$p(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$p := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$p == _value then true else _READ_HAS_OCCURRED_$$p);
    return;
}



procedure _CHECK_READ_$$p(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "p"} {:array "$$p"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$p);
  requires {:source_name "p"} {:array "$$p"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$p: bool;

procedure {:inline 1} _LOG_WRITE_$$p(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$p, _WRITE_READ_BENIGN_FLAG_$$p;



implementation {:inline 1} _LOG_WRITE_$$p(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$p := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$p == _value then true else _WRITE_HAS_OCCURRED_$$p);
    _WRITE_READ_BENIGN_FLAG_$$p := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$p == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$p);
    return;
}



procedure _CHECK_WRITE_$$p(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "p"} {:array "$$p"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$p != _value);
  requires {:source_name "p"} {:array "$$p"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$p != _value);
  requires {:source_name "p"} {:array "$$p"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$p(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$p;



implementation {:inline 1} _LOG_ATOMIC_$$p(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$p := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$p);
    return;
}



procedure _CHECK_ATOMIC_$$p(_P: bool, _offset: bv32);
  requires {:source_name "p"} {:array "$$p"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset);
  requires {:source_name "p"} {:array "$$p"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$p(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$p;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$p(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$p := (if _P && _WRITE_HAS_OCCURRED_$$p && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$p);
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



const _WATCHED_VALUE_$$kernel0.shared_p: bv64;

procedure {:inline 1} _LOG_READ_$$kernel0.shared_p(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel0.shared_p;



implementation {:inline 1} _LOG_READ_$$kernel0.shared_p(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel0.shared_p := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_p == _value then true else _READ_HAS_OCCURRED_$$kernel0.shared_p);
    return;
}



procedure _CHECK_READ_$$kernel0.shared_p(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_p"} {:array "$$kernel0.shared_p"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_p && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_p && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_p"} {:array "$$kernel0.shared_p"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel0.shared_p && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_p: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel0.shared_p(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel0.shared_p, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_p;



implementation {:inline 1} _LOG_WRITE_$$kernel0.shared_p(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel0.shared_p := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_p == _value then true else _WRITE_HAS_OCCURRED_$$kernel0.shared_p);
    _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_p := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_p == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_p);
    return;
}



procedure _CHECK_WRITE_$$kernel0.shared_p(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_p"} {:array "$$kernel0.shared_p"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_p && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_p != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_p"} {:array "$$kernel0.shared_p"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel0.shared_p && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_p != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_p"} {:array "$$kernel0.shared_p"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel0.shared_p && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel0.shared_p(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel0.shared_p;



implementation {:inline 1} _LOG_ATOMIC_$$kernel0.shared_p(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel0.shared_p := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel0.shared_p);
    return;
}



procedure _CHECK_ATOMIC_$$kernel0.shared_p(_P: bool, _offset: bv32);
  requires {:source_name "shared_p"} {:array "$$kernel0.shared_p"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_p && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_p"} {:array "$$kernel0.shared_p"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel0.shared_p && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_p(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_p;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_p(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_p := (if _P && _WRITE_HAS_OCCURRED_$$kernel0.shared_p && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_p);
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_p;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_p;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_p;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$q;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$q;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$q;
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
    havoc $$q;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel0.shared_p;
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_p;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_p;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_p;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$q;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$q;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$q;
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
    havoc $$q;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel0.shared_p;
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_p;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_p;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_p;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$q;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$q;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$q;
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
    havoc $$q;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel0.shared_p;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

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
