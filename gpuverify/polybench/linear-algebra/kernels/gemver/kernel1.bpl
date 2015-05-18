type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



axiom {:array_info "$$y"} {:global} {:elem_width 64} {:source_name "y"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$y: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$y: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$y: bool;

var {:source_name "x"} {:global} $$x: [bv32]bv64;

axiom {:array_info "$$x"} {:global} {:elem_width 64} {:source_name "x"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$x: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$x: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$x: bool;

axiom {:array_info "$$A"} {:global} {:elem_width 64} {:source_name "A"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$A: bool;

axiom {:array_info "$$z"} {:global} {:elem_width 64} {:source_name "z"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$z: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$z: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$z: bool;

axiom {:array_info "$$private_x"} {:elem_width 64} {:source_name "private_x"} {:source_elem_width 64} {:source_dimensions "1"} true;

var {:source_name "shared_y"} {:group_shared} $$kernel1.shared_y: [bv1][bv32]bv64;

axiom {:array_info "$$kernel1.shared_y"} {:group_shared} {:elem_width 64} {:source_name "shared_y"} {:source_elem_width 64} {:source_dimensions "32"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$kernel1.shared_y: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$kernel1.shared_y: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$kernel1.shared_y: bool;

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

procedure {:source_name "kernel1"} {:kernel} $kernel1($beta: bv64, $n: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $n == 4096bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$y && !_WRITE_HAS_OCCURRED_$$y && !_ATOMIC_HAS_OCCURRED_$$y;
  requires !_READ_HAS_OCCURRED_$$x && !_WRITE_HAS_OCCURRED_$$x && !_ATOMIC_HAS_OCCURRED_$$x;
  requires !_READ_HAS_OCCURRED_$$A && !_WRITE_HAS_OCCURRED_$$A && !_ATOMIC_HAS_OCCURRED_$$A;
  requires !_READ_HAS_OCCURRED_$$z && !_WRITE_HAS_OCCURRED_$$z && !_ATOMIC_HAS_OCCURRED_$$z;
  requires !_READ_HAS_OCCURRED_$$kernel1.shared_y && !_WRITE_HAS_OCCURRED_$$kernel1.shared_y && !_ATOMIC_HAS_OCCURRED_$$kernel1.shared_y;
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
  modifies $$kernel1.shared_y, _READ_HAS_OCCURRED_$$x, _WRITE_HAS_OCCURRED_$$kernel1.shared_y, _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_y, _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_y, $$x, _TRACKING, _READ_HAS_OCCURRED_$$kernel1.shared_y, _TRACKING, _WRITE_HAS_OCCURRED_$$x, _WRITE_READ_BENIGN_FLAG_$$x, _WRITE_READ_BENIGN_FLAG_$$x, _TRACKING;



implementation {:source_name "kernel1"} {:kernel} $kernel1($beta: bv64, $n: bv32)
{
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var $g5.0$1: bv32;
  var $g5.0$2: bv32;
  var $c2.0$1: bv32;
  var $c2.0$2: bv32;
  var $c21.0$1: bv32;
  var $c21.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bv64;
  var v3$2: bv64;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bv64;
  var v7$2: bv64;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bool;
  var v10$2: bool;
  var v11$1: bv64;
  var v11$2: bv64;
  var v12$1: bv64;
  var v12$2: bv64;
  var v13$1: bv64;
  var v13$2: bv64;
  var v14$1: bool;
  var v14$2: bool;
  var v15$1: bv64;
  var v15$2: bv64;
  var v16$1: bv64;
  var v16$2: bv64;
  var v17$1: bv64;
  var v17$2: bv64;
  var v18$1: bv64;
  var v18$2: bv64;
  var v19$1: bv64;
  var v19$2: bv64;
  var v20$1: bool;
  var v20$2: bool;
  var v21$1: bv64;
  var v21$2: bv64;
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
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b74 ==> _WRITE_HAS_OCCURRED_$$kernel1.shared_y ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b73 ==> !_WRITE_HAS_OCCURRED_$$kernel1.shared_y;
    assert {:tag "noread"} _b72 ==> !_READ_HAS_OCCURRED_$$kernel1.shared_y;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b71 ==> _WRITE_HAS_OCCURRED_$$x ==> BV32_AND(BV32_SUB(1048576bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(1048576bv32, 1bv32), BV32_ADD(BV32_MUL(32bv32, group_id_x$1), local_id_x$1));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b70 ==> _READ_HAS_OCCURRED_$$x ==> BV32_AND(BV32_SUB(1048576bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(1048576bv32, 1bv32), BV32_ADD(BV32_MUL(32bv32, group_id_x$1), local_id_x$1));
    assert {:tag "nowrite"} _b69 ==> !_WRITE_HAS_OCCURRED_$$x;
    assert {:tag "noread"} _b68 ==> !_READ_HAS_OCCURRED_$$x;
    assert {:tag "predicatedEquality"} _b67 ==> p0$1 && p0$2 ==> v21$1 == v21$2;
    assert {:tag "predicatedEquality"} _b66 ==> p0$1 && p0$2 ==> v20$1 == v20$2;
    assert {:tag "predicatedEquality"} _b65 ==> p0$1 && p0$2 ==> v19$1 == v19$2;
    assert {:tag "predicatedEquality"} _b64 ==> p0$1 && p0$2 ==> v18$1 == v18$2;
    assert {:tag "predicatedEquality"} _b63 ==> p0$1 && p0$2 ==> v17$1 == v17$2;
    assert {:tag "predicatedEquality"} _b62 ==> p0$1 && p0$2 ==> v16$1 == v16$2;
    assert {:tag "predicatedEquality"} _b61 ==> p0$1 && p0$2 ==> v15$1 == v15$2;
    assert {:tag "predicatedEquality"} _b60 ==> p0$1 && p0$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b59 ==> p0$1 && p0$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b58 ==> p0$1 && p0$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b57 ==> p0$1 && p0$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b56 ==> p0$1 && p0$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b55 ==> p0$1 && p0$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b54 ==> p0$1 && p0$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b53 ==> p0$1 && p0$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b52 ==> p0$1 && p0$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b51 ==> p0$1 && p0$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b50 ==> p0$1 && p0$2 ==> v4$1 == v4$2;
    assert {:tag "predicatedEquality"} _b49 ==> p0$1 && p0$2 ==> v3$1 == v3$2;
    assert {:tag "predicatedEquality"} _b48 ==> p0$1 && p0$2 ==> v2$1 == v2$2;
    assert {:tag "predicatedEquality"} _b47 ==> p0$1 && p0$2 ==> v1$1 == v1$2;
    assert {:tag "predicatedEquality"} _b46 ==> p0$1 && p0$2 ==> $c21.0$1 == $c21.0$2;
    assert {:tag "predicatedEquality"} _b45 ==> p0$1 && p0$2 ==> $c2.0$1 == $c2.0$2;
    assert {:tag "predicatedEquality"} _b44 ==> p0$1 && p0$2 ==> $g5.0$1 == $g5.0$2;
    assert {:tag "predicatedEquality"} _b43 ==> p0$1 && p0$2 ==> $g1.0$1 == $g1.0$2;
    assert {:tag "loopPredicateEquality"} _b42 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p0$1 == p0$2;
    assert {:tag "loopPredicateEquality"} _b41 ==> p0$1 == p0$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel1.shared_y ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel1.shared_y ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel1.shared_y ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
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
    assert {:block_sourceloc} {:sourceloc_num 2} p0$1 ==> true;
    v1$1 := (if p0$1 then BV32_SLT($g1.0$1, $n) else v1$1);
    v1$2 := (if p0$2 then BV32_SLT($g1.0$2, $n) else v1$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p20$1 := false;
    p20$2 := false;
    p1$1 := (if p0$1 && v1$1 then v1$1 else p1$1);
    p1$2 := (if p0$2 && v1$2 then v1$2 else p1$2);
    p0$1 := (if p0$1 && !v1$1 then v1$1 else p0$1);
    p0$2 := (if p0$2 && !v1$2 then v1$2 else p0$2);
    v2$1 := (if p1$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v2$1);
    v2$2 := (if p1$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v2$2);
    p3$1 := (if p1$1 && v2$1 then v2$1 else p3$1);
    p3$2 := (if p1$2 && v2$2 then v2$2 else p3$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$x(p3$1, BV32_ADD(v0$1, $g1.0$1), $$x[BV32_ADD(v0$1, $g1.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$x(p3$2, BV32_ADD(v0$2, $g1.0$2), $$x[BV32_ADD(v0$2, $g1.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$x"} true;
    v3$1 := (if p3$1 then $$x[BV32_ADD(v0$1, $g1.0$1)] else v3$1);
    v3$2 := (if p3$2 then $$x[BV32_ADD(v0$2, $g1.0$2)] else v3$2);
    $$private_x$0bv32$1 := (if p3$1 then v3$1 else $$private_x$0bv32$1);
    $$private_x$0bv32$2 := (if p3$2 then v3$2 else $$private_x$0bv32$2);
    $g5.0$1 := (if p1$1 then 0bv32 else $g5.0$1);
    $g5.0$2 := (if p1$2 then 0bv32 else $g5.0$2);
    p4$1 := (if p1$1 then true else p4$1);
    p4$2 := (if p1$2 then true else p4$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto __partitioned_block_$5_0;

  __partitioned_block_$5_0:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b98 ==> _WRITE_HAS_OCCURRED_$$kernel1.shared_y ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b97 ==> !_WRITE_HAS_OCCURRED_$$kernel1.shared_y;
    assert {:tag "noread"} _b96 ==> !_READ_HAS_OCCURRED_$$kernel1.shared_y;
    assert {:tag "predicatedEquality"} _b95 ==> p4$1 && p4$2 ==> v19$1 == v19$2;
    assert {:tag "predicatedEquality"} _b94 ==> p4$1 && p4$2 ==> v18$1 == v18$2;
    assert {:tag "predicatedEquality"} _b93 ==> p4$1 && p4$2 ==> v17$1 == v17$2;
    assert {:tag "predicatedEquality"} _b92 ==> p4$1 && p4$2 ==> v16$1 == v16$2;
    assert {:tag "predicatedEquality"} _b91 ==> p4$1 && p4$2 ==> v15$1 == v15$2;
    assert {:tag "predicatedEquality"} _b90 ==> p4$1 && p4$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b89 ==> p4$1 && p4$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b88 ==> p4$1 && p4$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b87 ==> p4$1 && p4$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b86 ==> p4$1 && p4$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b85 ==> p4$1 && p4$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b84 ==> p4$1 && p4$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b83 ==> p4$1 && p4$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b82 ==> p4$1 && p4$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b81 ==> p4$1 && p4$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b80 ==> p4$1 && p4$2 ==> v4$1 == v4$2;
    assert {:tag "predicatedEquality"} _b79 ==> p4$1 && p4$2 ==> $c21.0$1 == $c21.0$2;
    assert {:tag "predicatedEquality"} _b78 ==> p4$1 && p4$2 ==> $c2.0$1 == $c2.0$2;
    assert {:tag "predicatedEquality"} _b77 ==> p4$1 && p4$2 ==> $g5.0$1 == $g5.0$2;
    assert {:tag "loopPredicateEquality"} _b76 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p4$1 == p4$2;
    assert {:tag "loopPredicateEquality"} _b75 ==> p4$1 == p4$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel1.shared_y ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel1.shared_y ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel1.shared_y ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p4$1 ==> p0$1;
    assert p4$2 ==> p0$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b18 ==> _WRITE_HAS_OCCURRED_$$kernel1.shared_y ==> BV32_SLT($g1.0$1, $n);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b17 ==> _READ_HAS_OCCURRED_$$kernel1.shared_y ==> BV32_SLT($g1.0$1, $n);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p4$1 ==> _b16 ==> p4$1 ==> BV32_SLT($g1.0$1, $n);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p4$2 ==> _b16 ==> p4$2 ==> BV32_SLT($g1.0$2, $n);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b15 ==> BV32_SLT($g1.0$1, $n) && BV32_SLE($g5.0$1, $n) ==> p4$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b15 ==> BV32_SLT($g1.0$2, $n) && BV32_SLE($g5.0$2, $n) ==> p4$2;
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b14 ==> BV32_UGE($g5.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b14 ==> BV32_UGE($g5.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b13 ==> BV32_ULE($g5.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b13 ==> BV32_ULE($g5.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b12 ==> BV32_SGE($g5.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b12 ==> BV32_SGE($g5.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b11 ==> BV32_SLE($g5.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b11 ==> BV32_SLE($g5.0$2, 0bv32);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p4$1 ==> _b10 ==> BV32_SUB($g5.0$1, 0bv32) == BV32_SUB($g5.0$2, 0bv32);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p4$2 ==> _b10 ==> BV32_SUB($g5.0$2, 0bv32) == BV32_SUB($g5.0$1, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p4$1 ==> _b9 ==> BV32_SLE(0bv32, $g5.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p4$2 ==> _b9 ==> BV32_SLE(0bv32, $g5.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p4$1 ==> _b8 ==> BV32_AND(BV32_SUB(32bv32, 1bv32), $g5.0$1) == BV32_AND(BV32_SUB(32bv32, 1bv32), 0bv32);
    assert {:tag "loopCounterIsStrided"} {:thread 2} p4$2 ==> _b8 ==> BV32_AND(BV32_SUB(32bv32, 1bv32), $g5.0$2) == BV32_AND(BV32_SUB(32bv32, 1bv32), 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 8} p4$1 ==> true;
    v4$1 := (if p4$1 then BV32_SLE($g5.0$1, $n) else v4$1);
    v4$2 := (if p4$2 then BV32_SLE($g5.0$2, $n) else v4$2);
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
    p15$1 := false;
    p15$2 := false;
    p16$1 := false;
    p16$2 := false;
    p18$1 := false;
    p18$2 := false;
    p19$1 := false;
    p19$2 := false;
    p5$1 := (if p4$1 && v4$1 then v4$1 else p5$1);
    p5$2 := (if p4$2 && v4$2 then v4$2 else p5$2);
    p4$1 := (if p4$1 && !v4$1 then v4$1 else p4$1);
    p4$2 := (if p4$2 && !v4$2 then v4$2 else p4$2);
    v5$1 := (if p5$1 then BV32_SGE($n, BV32_ADD($g5.0$1, 1bv32)) else v5$1);
    v5$2 := (if p5$2 then BV32_SGE($n, BV32_ADD($g5.0$2, 1bv32)) else v5$2);
    p7$1 := (if p5$1 && v5$1 then v5$1 else p7$1);
    p7$2 := (if p5$2 && v5$2 then v5$2 else p7$2);
    v6$1 := (if p7$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g5.0$1), 1bv32)) else v6$1);
    v6$2 := (if p7$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$2, $g5.0$2), 1bv32)) else v6$2);
    p9$1 := (if p7$1 && v6$1 then v6$1 else p9$1);
    p9$2 := (if p7$2 && v6$2 then v6$2 else p9$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v7$1 := (if p9$1 then _HAVOC_bv64$1 else v7$1);
    v7$2 := (if p9$2 then _HAVOC_bv64$2 else v7$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$kernel1.shared_y(p9$1, v0$1, v7$1, $$kernel1.shared_y[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel1.shared_y(p9$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$kernel1.shared_y(p9$2, v0$2, v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel1.shared_y"} true;
    $$kernel1.shared_y[1bv1][v0$1] := (if p9$1 then v7$1 else $$kernel1.shared_y[1bv1][v0$1]);
    $$kernel1.shared_y[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := (if p9$2 then v7$2 else $$kernel1.shared_y[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    goto __partitioned_block_$5_1;

  __partitioned_block_$5_1:
    call {:sourceloc_num 16} $bugle_barrier_duplicated_1(1bv1, 1bv1, p5$1, p5$2);
    v8$1 := (if p5$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v8$1);
    v8$2 := (if p5$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v8$2);
    p11$1 := (if p5$1 && v8$1 then v8$1 else p11$1);
    p11$2 := (if p5$2 && v8$2 then v8$2 else p11$2);
    v9$1 := (if p11$1 then BV32_SGE($n, BV32_ADD($g5.0$1, 32bv32)) else v9$1);
    v9$2 := (if p11$2 then BV32_SGE($n, BV32_ADD($g5.0$2, 32bv32)) else v9$2);
    p12$1 := (if p11$1 && v9$1 then v9$1 else p12$1);
    p12$2 := (if p11$2 && v9$2 then v9$2 else p12$2);
    p15$1 := (if p11$1 && !v9$1 then !v9$1 else p15$1);
    p15$2 := (if p11$2 && !v9$2 then !v9$2 else p15$2);
    $c2.0$1 := (if p12$1 then 0bv32 else $c2.0$1);
    $c2.0$2 := (if p12$2 then 0bv32 else $c2.0$2);
    p13$1 := (if p12$1 then true else p13$1);
    p13$2 := (if p12$2 then true else p13$2);
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $13;

  $13:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel1.shared_y ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel1.shared_y ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel1.shared_y ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p13$1 ==> p4$1;
    assert p13$2 ==> p4$2;
    assert p4$1 ==> p0$1;
    assert p4$2 ==> p0$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b40 ==> _READ_HAS_OCCURRED_$$kernel1.shared_y ==> BV32_SLT($g1.0$1, $n) && BV32_SLE($g5.0$1, $n) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32)) && BV32_SGE($n, BV32_ADD($g5.0$1, 32bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p13$1 ==> _b39 ==> p13$1 ==> BV32_SLT($g1.0$1, $n) && BV32_SLE($g5.0$1, $n) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32)) && BV32_SGE($n, BV32_ADD($g5.0$1, 32bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p13$2 ==> _b39 ==> p13$2 ==> BV32_SLT($g1.0$2, $n) && BV32_SLE($g5.0$2, $n) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$2, $g1.0$2), 1bv32)) && BV32_SGE($n, BV32_ADD($g5.0$2, 32bv32));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b38 ==> BV32_SLT($g1.0$1, $n) && BV32_SLE($g5.0$1, $n) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32)) && BV32_SGE($n, BV32_ADD($g5.0$1, 32bv32)) && BV32_SLE($c2.0$1, 31bv32) ==> p13$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b38 ==> BV32_SLT($g1.0$2, $n) && BV32_SLE($g5.0$2, $n) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$2, $g1.0$2), 1bv32)) && BV32_SGE($n, BV32_ADD($g5.0$2, 32bv32)) && BV32_SLE($c2.0$2, 31bv32) ==> p13$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b37 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !_READ_HAS_OCCURRED_$$kernel1.shared_y;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b36 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !_READ_HAS_OCCURRED_$$A;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b35 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !p13$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b35 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) ==> !p13$2;
    assert {:tag "loopBound"} {:thread 1} p13$1 ==> _b34 ==> BV32_UGE($c2.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p13$2 ==> _b34 ==> BV32_UGE($c2.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p13$1 ==> _b33 ==> BV32_ULE($c2.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p13$2 ==> _b33 ==> BV32_ULE($c2.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p13$1 ==> _b32 ==> BV32_SGE($c2.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p13$2 ==> _b32 ==> BV32_SGE($c2.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p13$1 ==> _b31 ==> BV32_SLE($c2.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p13$2 ==> _b31 ==> BV32_SLE($c2.0$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p13$1 ==> _b30 ==> BV32_SLE(0bv32, $c2.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p13$2 ==> _b30 ==> BV32_SLE(0bv32, $c2.0$2);
    assert {:block_sourceloc} {:sourceloc_num 19} p13$1 ==> true;
    v10$1 := (if p13$1 then BV32_SLE($c2.0$1, 31bv32) else v10$1);
    v10$2 := (if p13$2 then BV32_SLE($c2.0$2, 31bv32) else v10$2);
    p14$1 := false;
    p14$2 := false;
    p14$1 := (if p13$1 && v10$1 then v10$1 else p14$1);
    p14$2 := (if p13$2 && v10$2 then v10$2 else p14$2);
    p13$1 := (if p13$1 && !v10$1 then v10$1 else p13$1);
    p13$2 := (if p13$2 && !v10$2 then v10$2 else p13$2);
    v11$1 := (if p14$1 then $$private_x$0bv32$1 else v11$1);
    v11$2 := (if p14$2 then $$private_x$0bv32$2 else v11$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v12$1 := (if p14$1 then _HAVOC_bv64$1 else v12$1);
    v12$2 := (if p14$2 then _HAVOC_bv64$2 else v12$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$kernel1.shared_y(p14$1, $c2.0$1, $$kernel1.shared_y[1bv1][$c2.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$kernel1.shared_y(p14$2, $c2.0$2, $$kernel1.shared_y[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c2.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel1.shared_y"} true;
    v13$1 := (if p14$1 then $$kernel1.shared_y[1bv1][$c2.0$1] else v13$1);
    v13$2 := (if p14$2 then $$kernel1.shared_y[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c2.0$2] else v13$2);
    $$private_x$0bv32$1 := (if p14$1 then FADD64(FMUL64(FMUL64($beta, v12$1), v13$1), v11$1) else $$private_x$0bv32$1);
    $$private_x$0bv32$2 := (if p14$2 then FADD64(FMUL64(FMUL64($beta, v12$2), v13$2), v11$2) else $$private_x$0bv32$2);
    $c2.0$1 := (if p14$1 then BV32_ADD($c2.0$1, 1bv32) else $c2.0$1);
    $c2.0$2 := (if p14$2 then BV32_ADD($c2.0$2, 1bv32) else $c2.0$2);
    p13$1 := (if p14$1 then true else p13$1);
    p13$2 := (if p14$2 then true else p13$2);
    goto $13.backedge, $13.tail;

  $13.tail:
    assume !p13$1 && !p13$2;
    $c21.0$1 := (if p15$1 then 0bv32 else $c21.0$1);
    $c21.0$2 := (if p15$2 then 0bv32 else $c21.0$2);
    p16$1 := (if p15$1 then true else p16$1);
    p16$2 := (if p15$2 then true else p16$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $18;

  $18:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel1.shared_y ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel1.shared_y ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel1.shared_y ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p16$1 ==> p4$1;
    assert p16$2 ==> p4$2;
    assert p4$1 ==> p0$1;
    assert p4$2 ==> p0$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b29 ==> _READ_HAS_OCCURRED_$$kernel1.shared_y ==> BV32_SLT($g1.0$1, $n) && BV32_SLE($g5.0$1, $n) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p16$1 ==> _b28 ==> p16$1 ==> BV32_SLT($g1.0$1, $n) && BV32_SLE($g5.0$1, $n) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p16$2 ==> _b28 ==> p16$2 ==> BV32_SLT($g1.0$2, $n) && BV32_SLE($g5.0$2, $n) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$2, $g1.0$2), 1bv32));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b27 ==> BV32_SLT($g1.0$1, $n) && BV32_SLE($g5.0$1, $n) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32)) && BV32_SLT($c21.0$1, BV32_SUB($n, $g5.0$1)) ==> p16$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b27 ==> BV32_SLT($g1.0$2, $n) && BV32_SLE($g5.0$2, $n) && BV32_SGE($n, BV32_ADD(BV32_ADD(local_id_x$2, $g1.0$2), 1bv32)) && BV32_SLT($c21.0$2, BV32_SUB($n, $g5.0$2)) ==> p16$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b26 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !_READ_HAS_OCCURRED_$$kernel1.shared_y;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b25 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !_READ_HAS_OCCURRED_$$A;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b24 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) ==> !p16$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b24 ==> !BV32_SGE($n, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) ==> !p16$2;
    assert {:tag "loopBound"} {:thread 1} p16$1 ==> _b23 ==> BV32_UGE($c21.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p16$2 ==> _b23 ==> BV32_UGE($c21.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p16$1 ==> _b22 ==> BV32_ULE($c21.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p16$2 ==> _b22 ==> BV32_ULE($c21.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p16$1 ==> _b21 ==> BV32_SGE($c21.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p16$2 ==> _b21 ==> BV32_SGE($c21.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p16$1 ==> _b20 ==> BV32_SLE($c21.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p16$2 ==> _b20 ==> BV32_SLE($c21.0$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p16$1 ==> _b19 ==> BV32_SLE(0bv32, $c21.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p16$2 ==> _b19 ==> BV32_SLE(0bv32, $c21.0$2);
    assert {:block_sourceloc} {:sourceloc_num 28} p16$1 ==> true;
    v14$1 := (if p16$1 then BV32_SLT($c21.0$1, BV32_SUB($n, $g5.0$1)) else v14$1);
    v14$2 := (if p16$2 then BV32_SLT($c21.0$2, BV32_SUB($n, $g5.0$2)) else v14$2);
    p17$1 := false;
    p17$2 := false;
    p17$1 := (if p16$1 && v14$1 then v14$1 else p17$1);
    p17$2 := (if p16$2 && v14$2 then v14$2 else p17$2);
    p16$1 := (if p16$1 && !v14$1 then v14$1 else p16$1);
    p16$2 := (if p16$2 && !v14$2 then v14$2 else p16$2);
    v15$1 := (if p17$1 then $$private_x$0bv32$1 else v15$1);
    v15$2 := (if p17$2 then $$private_x$0bv32$2 else v15$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v16$1 := (if p17$1 then _HAVOC_bv64$1 else v16$1);
    v16$2 := (if p17$2 then _HAVOC_bv64$2 else v16$2);
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$kernel1.shared_y(p17$1, $c21.0$1, $$kernel1.shared_y[1bv1][$c21.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$kernel1.shared_y(p17$2, $c21.0$2, $$kernel1.shared_y[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c21.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel1.shared_y"} true;
    v17$1 := (if p17$1 then $$kernel1.shared_y[1bv1][$c21.0$1] else v17$1);
    v17$2 := (if p17$2 then $$kernel1.shared_y[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c21.0$2] else v17$2);
    $$private_x$0bv32$1 := (if p17$1 then FADD64(FMUL64(FMUL64($beta, v16$1), v17$1), v15$1) else $$private_x$0bv32$1);
    $$private_x$0bv32$2 := (if p17$2 then FADD64(FMUL64(FMUL64($beta, v16$2), v17$2), v15$2) else $$private_x$0bv32$2);
    $c21.0$1 := (if p17$1 then BV32_ADD($c21.0$1, 1bv32) else $c21.0$1);
    $c21.0$2 := (if p17$2 then BV32_ADD($c21.0$2, 1bv32) else $c21.0$2);
    p16$1 := (if p17$1 then true else p16$1);
    p16$2 := (if p17$2 then true else p16$2);
    goto $18.backedge, __partitioned_block_$18.tail_0;

  __partitioned_block_$18.tail_0:
    assume !p16$1 && !p16$2;
    v18$1 := (if p15$1 then $$private_x$0bv32$1 else v18$1);
    v18$2 := (if p15$2 then $$private_x$0bv32$2 else v18$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v19$1 := (if p15$1 then _HAVOC_bv64$1 else v19$1);
    v19$2 := (if p15$2 then _HAVOC_bv64$2 else v19$2);
    $$private_x$0bv32$1 := (if p15$1 then FADD64(v18$1, v19$1) else $$private_x$0bv32$1);
    $$private_x$0bv32$2 := (if p15$2 then FADD64(v18$2, v19$2) else $$private_x$0bv32$2);
    goto __partitioned_block_$18.tail_1;

  __partitioned_block_$18.tail_1:
    call {:sourceloc_num 41} $bugle_barrier_duplicated_2(1bv1, 1bv1, p5$1, p5$2);
    $g5.0$1 := (if p5$1 then BV32_ADD($g5.0$1, 32bv32) else $g5.0$1);
    $g5.0$2 := (if p5$2 then BV32_ADD($g5.0$2, 32bv32) else $g5.0$2);
    p4$1 := (if p5$1 then true else p4$1);
    p4$2 := (if p5$2 then true else p4$2);
    goto $5.backedge, __partitioned_block_$5.tail_0;

  __partitioned_block_$5.tail_0:
    assume !p4$1 && !p4$2;
    v20$1 := (if p1$1 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v20$1);
    v20$2 := (if p1$2 then BV32_SGE($n, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v20$2);
    p19$1 := (if p1$1 && v20$1 then v20$1 else p19$1);
    p19$2 := (if p1$2 && v20$2 then v20$2 else p19$2);
    v21$1 := (if p19$1 then $$private_x$0bv32$1 else v21$1);
    v21$2 := (if p19$2 then $$private_x$0bv32$2 else v21$2);
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$x(p19$1, BV32_ADD(v0$1, $g1.0$1), v21$1, $$x[BV32_ADD(v0$1, $g1.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$x(p19$2, BV32_ADD(v0$2, $g1.0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$x(p19$2, BV32_ADD(v0$2, $g1.0$2), v21$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$x"} true;
    $$x[BV32_ADD(v0$1, $g1.0$1)] := (if p19$1 then v21$1 else $$x[BV32_ADD(v0$1, $g1.0$1)]);
    $$x[BV32_ADD(v0$2, $g1.0$2)] := (if p19$2 then v21$2 else $$x[BV32_ADD(v0$2, $g1.0$2)]);
    goto __partitioned_block_$5.tail_1;

  __partitioned_block_$5.tail_1:
    call {:sourceloc_num 48} $bugle_barrier_duplicated_0(1bv1, 1bv1, p1$1, p1$2);
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

  $5.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto __partitioned_block_$5_0;

  $18.backedge:
    assume {:backedge} p16$1 || p16$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $18;

  $13.backedge:
    assume {:backedge} p13$1 || p13$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $13;
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
  modifies $$kernel1.shared_y, $$x, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel1.shared_y, $$x, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel1.shared_y, $$x, _TRACKING;



var $$private_x$0bv32$1: bv64;

var $$private_x$0bv32$2: bv64;

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

const _WATCHED_VALUE_$$y: bv64;

procedure {:inline 1} _LOG_READ_$$y(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$y;



implementation {:inline 1} _LOG_READ_$$y(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$y == _value then true else _READ_HAS_OCCURRED_$$y);
    return;
}



procedure _CHECK_READ_$$y(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "y"} {:array "$$y"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$y);
  requires {:source_name "y"} {:array "$$y"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$y: bool;

procedure {:inline 1} _LOG_WRITE_$$y(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$y, _WRITE_READ_BENIGN_FLAG_$$y;



implementation {:inline 1} _LOG_WRITE_$$y(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$y == _value then true else _WRITE_HAS_OCCURRED_$$y);
    _WRITE_READ_BENIGN_FLAG_$$y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$y == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$y);
    return;
}



procedure _CHECK_WRITE_$$y(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "y"} {:array "$$y"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$y != _value);
  requires {:source_name "y"} {:array "$$y"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$y != _value);
  requires {:source_name "y"} {:array "$$y"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$y(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$y;



implementation {:inline 1} _LOG_ATOMIC_$$y(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$y);
    return;
}



procedure _CHECK_ATOMIC_$$y(_P: bool, _offset: bv32);
  requires {:source_name "y"} {:array "$$y"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset);
  requires {:source_name "y"} {:array "$$y"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$y(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$y;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$y(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$y := (if _P && _WRITE_HAS_OCCURRED_$$y && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$y);
    return;
}



const _WATCHED_VALUE_$$x: bv64;

procedure {:inline 1} _LOG_READ_$$x(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$x;



implementation {:inline 1} _LOG_READ_$$x(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$x == _value then true else _READ_HAS_OCCURRED_$$x);
    return;
}



procedure _CHECK_READ_$$x(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "x"} {:array "$$x"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$x);
  requires {:source_name "x"} {:array "$$x"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$x: bool;

procedure {:inline 1} _LOG_WRITE_$$x(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$x, _WRITE_READ_BENIGN_FLAG_$$x;



implementation {:inline 1} _LOG_WRITE_$$x(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$x == _value then true else _WRITE_HAS_OCCURRED_$$x);
    _WRITE_READ_BENIGN_FLAG_$$x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$x == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$x);
    return;
}



procedure _CHECK_WRITE_$$x(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "x"} {:array "$$x"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$x != _value);
  requires {:source_name "x"} {:array "$$x"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$x != _value);
  requires {:source_name "x"} {:array "$$x"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$x(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$x;



implementation {:inline 1} _LOG_ATOMIC_$$x(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$x);
    return;
}



procedure _CHECK_ATOMIC_$$x(_P: bool, _offset: bv32);
  requires {:source_name "x"} {:array "$$x"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset);
  requires {:source_name "x"} {:array "$$x"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$x(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$x;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$x(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$x := (if _P && _WRITE_HAS_OCCURRED_$$x && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$x);
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



const _WATCHED_VALUE_$$z: bv64;

procedure {:inline 1} _LOG_READ_$$z(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$z;



implementation {:inline 1} _LOG_READ_$$z(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$z := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$z == _value then true else _READ_HAS_OCCURRED_$$z);
    return;
}



procedure _CHECK_READ_$$z(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "z"} {:array "$$z"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$z);
  requires {:source_name "z"} {:array "$$z"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$z: bool;

procedure {:inline 1} _LOG_WRITE_$$z(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$z, _WRITE_READ_BENIGN_FLAG_$$z;



implementation {:inline 1} _LOG_WRITE_$$z(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$z := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$z == _value then true else _WRITE_HAS_OCCURRED_$$z);
    _WRITE_READ_BENIGN_FLAG_$$z := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$z == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$z);
    return;
}



procedure _CHECK_WRITE_$$z(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "z"} {:array "$$z"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$z != _value);
  requires {:source_name "z"} {:array "$$z"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$z != _value);
  requires {:source_name "z"} {:array "$$z"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$z(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$z;



implementation {:inline 1} _LOG_ATOMIC_$$z(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$z := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$z);
    return;
}



procedure _CHECK_ATOMIC_$$z(_P: bool, _offset: bv32);
  requires {:source_name "z"} {:array "$$z"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset);
  requires {:source_name "z"} {:array "$$z"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$z(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$z;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$z(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$z := (if _P && _WRITE_HAS_OCCURRED_$$z && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$z);
    return;
}



const _WATCHED_VALUE_$$kernel1.shared_y: bv64;

procedure {:inline 1} _LOG_READ_$$kernel1.shared_y(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel1.shared_y;



implementation {:inline 1} _LOG_READ_$$kernel1.shared_y(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel1.shared_y := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel1.shared_y == _value then true else _READ_HAS_OCCURRED_$$kernel1.shared_y);
    return;
}



procedure _CHECK_READ_$$kernel1.shared_y(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_y"} {:array "$$kernel1.shared_y"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel1.shared_y && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_y && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y"} {:array "$$kernel1.shared_y"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel1.shared_y && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_y: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel1.shared_y(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel1.shared_y, _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_y;



implementation {:inline 1} _LOG_WRITE_$$kernel1.shared_y(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel1.shared_y := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel1.shared_y == _value then true else _WRITE_HAS_OCCURRED_$$kernel1.shared_y);
    _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_y := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel1.shared_y == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_y);
    return;
}



procedure _CHECK_WRITE_$$kernel1.shared_y(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_y"} {:array "$$kernel1.shared_y"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel1.shared_y && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel1.shared_y != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y"} {:array "$$kernel1.shared_y"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel1.shared_y && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel1.shared_y != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y"} {:array "$$kernel1.shared_y"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel1.shared_y && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel1.shared_y(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel1.shared_y;



implementation {:inline 1} _LOG_ATOMIC_$$kernel1.shared_y(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel1.shared_y := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel1.shared_y);
    return;
}



procedure _CHECK_ATOMIC_$$kernel1.shared_y(_P: bool, _offset: bv32);
  requires {:source_name "shared_y"} {:array "$$kernel1.shared_y"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel1.shared_y && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_y"} {:array "$$kernel1.shared_y"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel1.shared_y && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel1.shared_y(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_y;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel1.shared_y(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_y := (if _P && _WRITE_HAS_OCCURRED_$$kernel1.shared_y && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel1.shared_y);
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel1.shared_y;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel1.shared_y;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel1.shared_y;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$x;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$x;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$x;
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
    havoc $$x;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel1.shared_y;
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel1.shared_y;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel1.shared_y;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel1.shared_y;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$x;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$x;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$x;
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
    havoc $$x;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel1.shared_y;
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel1.shared_y;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel1.shared_y;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel1.shared_y;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$x;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$x;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$x;
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
    havoc $$x;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel1.shared_y;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

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
