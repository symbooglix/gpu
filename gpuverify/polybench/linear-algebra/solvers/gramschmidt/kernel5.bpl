type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



axiom {:array_info "$$A"} {:global} {:elem_width 64} {:source_name "A"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$A: bool;

var {:source_name "Q"} {:global} $$Q: [bv32]bv64;

axiom {:array_info "$$Q"} {:global} {:elem_width 64} {:source_name "Q"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Q: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Q: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Q: bool;

axiom {:array_info "$$R"} {:global} {:elem_width 64} {:source_name "R"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$R: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$R: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$R: bool;

var {:source_name "shared_R"} {:group_shared} $$kernel5.shared_R: [bv1][bv32]bv64;

axiom {:array_info "$$kernel5.shared_R"} {:group_shared} {:elem_width 64} {:source_name "shared_R"} {:source_elem_width 64} {:source_dimensions "1,1"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _READ_HAS_OCCURRED_$$kernel5.shared_R: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _WRITE_HAS_OCCURRED_$$kernel5.shared_R: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _ATOMIC_HAS_OCCURRED_$$kernel5.shared_R: bool;

var {:source_name "shared_A"} {:group_shared} $$kernel5.shared_A: [bv1][bv32]bv64;

axiom {:array_info "$$kernel5.shared_A"} {:group_shared} {:elem_width 64} {:source_name "shared_A"} {:source_elem_width 64} {:source_dimensions "32,1"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _READ_HAS_OCCURRED_$$kernel5.shared_A: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _WRITE_HAS_OCCURRED_$$kernel5.shared_A: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _ATOMIC_HAS_OCCURRED_$$kernel5.shared_A: bool;

var {:source_name "shared_Q"} {:group_shared} $$kernel5.shared_Q: [bv1][bv32]bv64;

axiom {:array_info "$$kernel5.shared_Q"} {:group_shared} {:elem_width 64} {:source_name "shared_Q"} {:source_elem_width 64} {:source_dimensions "32,1"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _READ_HAS_OCCURRED_$$kernel5.shared_Q: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _WRITE_HAS_OCCURRED_$$kernel5.shared_Q: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,1"} _ATOMIC_HAS_OCCURRED_$$kernel5.shared_Q: bool;

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

function FDIV64(bv64, bv64) : bv64;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel5"} {:kernel} $kernel5($nj: bv32, $ni: bv32, $h0: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $nj == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $ni == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$A && !_WRITE_HAS_OCCURRED_$$A && !_ATOMIC_HAS_OCCURRED_$$A;
  requires !_READ_HAS_OCCURRED_$$Q && !_WRITE_HAS_OCCURRED_$$Q && !_ATOMIC_HAS_OCCURRED_$$Q;
  requires !_READ_HAS_OCCURRED_$$R && !_WRITE_HAS_OCCURRED_$$R && !_ATOMIC_HAS_OCCURRED_$$R;
  requires !_READ_HAS_OCCURRED_$$kernel5.shared_R && !_WRITE_HAS_OCCURRED_$$kernel5.shared_R && !_ATOMIC_HAS_OCCURRED_$$kernel5.shared_R;
  requires !_READ_HAS_OCCURRED_$$kernel5.shared_A && !_WRITE_HAS_OCCURRED_$$kernel5.shared_A && !_ATOMIC_HAS_OCCURRED_$$kernel5.shared_A;
  requires !_READ_HAS_OCCURRED_$$kernel5.shared_Q && !_WRITE_HAS_OCCURRED_$$kernel5.shared_Q && !_ATOMIC_HAS_OCCURRED_$$kernel5.shared_Q;
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
  modifies $$kernel5.shared_R, $$kernel5.shared_A, $$kernel5.shared_Q, _WRITE_HAS_OCCURRED_$$kernel5.shared_R, _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_R, _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_R, _WRITE_HAS_OCCURRED_$$kernel5.shared_A, _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_A, _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_A, $$Q, _TRACKING, _READ_HAS_OCCURRED_$$kernel5.shared_A, _READ_HAS_OCCURRED_$$kernel5.shared_R, _WRITE_HAS_OCCURRED_$$kernel5.shared_Q, _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_Q, _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_Q, _TRACKING, _READ_HAS_OCCURRED_$$kernel5.shared_Q, _WRITE_HAS_OCCURRED_$$Q, _WRITE_READ_BENIGN_FLAG_$$Q, _WRITE_READ_BENIGN_FLAG_$$Q, _TRACKING;



implementation {:source_name "kernel5"} {:kernel} $kernel5($nj: bv32, $ni: bv32, $h0: bv32)
{
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var $c0.0$1: bv32;
  var $c0.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $c01.0$1: bv32;
  var $c01.0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bv64;
  var v2$2: bv64;
  var v3$1: bool;
  var v3$2: bool;
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
  var v9$1: bv64;
  var v9$2: bv64;
  var v10$1: bv64;
  var v10$2: bv64;
  var v11$1: bool;
  var v11$2: bool;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bool;
  var v13$2: bool;
  var v14$1: bv64;
  var v14$2: bv64;
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
  var _HAVOC_bv64$1: bv64;
  var _HAVOC_bv64$2: bv64;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1$1 := v0$1 == 0bv32;
    v1$2 := v0$2 == 0bv32;
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v2$1 := (if p0$1 then _HAVOC_bv64$1 else v2$1);
    v2$2 := (if p0$2 then _HAVOC_bv64$2 else v2$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$kernel5.shared_R(p0$1, 0bv32, v2$1, $$kernel5.shared_R[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel5.shared_R(p0$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$kernel5.shared_R(p0$2, 0bv32, v2$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel5.shared_R"} true;
    $$kernel5.shared_R[1bv1][0bv32] := (if p0$1 then v2$1 else $$kernel5.shared_R[1bv1][0bv32]);
    $$kernel5.shared_R[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := (if p0$2 then v2$2 else $$kernel5.shared_R[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    $g1.0$1 := BV32_MUL(32bv32, group_id_x$1);
    $g1.0$2 := BV32_MUL(32bv32, group_id_x$2);
    p2$1 := true;
    p2$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b55 ==> _WRITE_HAS_OCCURRED_$$kernel5.shared_Q ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b54 ==> !_WRITE_HAS_OCCURRED_$$kernel5.shared_Q;
    assert {:tag "noread"} _b53 ==> !_READ_HAS_OCCURRED_$$kernel5.shared_Q;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b52 ==> _READ_HAS_OCCURRED_$$kernel5.shared_A ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b51 ==> !_WRITE_HAS_OCCURRED_$$kernel5.shared_A;
    assert {:tag "noread"} _b50 ==> !_READ_HAS_OCCURRED_$$kernel5.shared_A;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b49 ==> _READ_HAS_OCCURRED_$$kernel5.shared_R ==> _WATCHED_OFFSET == 0bv32;
    assert {:tag "noread"} _b48 ==> !_READ_HAS_OCCURRED_$$kernel5.shared_R;
    assert {:tag "nowrite"} _b47 ==> !_WRITE_HAS_OCCURRED_$$Q;
    assert {:tag "predicatedEquality"} _b46 ==> p2$1 && p2$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b45 ==> p2$1 && p2$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b44 ==> p2$1 && p2$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b43 ==> p2$1 && p2$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b42 ==> p2$1 && p2$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b41 ==> p2$1 && p2$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b40 ==> p2$1 && p2$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b39 ==> p2$1 && p2$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b38 ==> p2$1 && p2$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b37 ==> p2$1 && p2$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b36 ==> p2$1 && p2$2 ==> v4$1 == v4$2;
    assert {:tag "predicatedEquality"} _b35 ==> p2$1 && p2$2 ==> v3$1 == v3$2;
    assert {:tag "predicatedEquality"} _b34 ==> p2$1 && p2$2 ==> $1$1 == $1$2;
    assert {:tag "predicatedEquality"} _b33 ==> p2$1 && p2$2 ==> $c01.0$1 == $c01.0$2;
    assert {:tag "predicatedEquality"} _b32 ==> p2$1 && p2$2 ==> $0$1 == $0$2;
    assert {:tag "predicatedEquality"} _b31 ==> p2$1 && p2$2 ==> $c0.0$1 == $c0.0$2;
    assert {:tag "predicatedEquality"} _b30 ==> p2$1 && p2$2 ==> $g1.0$1 == $g1.0$2;
    assert {:tag "loopPredicateEquality"} _b29 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p2$1 == p2$2;
    assert {:tag "loopPredicateEquality"} _b28 ==> p2$1 == p2$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel5.shared_Q ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel5.shared_Q ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel5.shared_Q ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel5.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel5.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel5.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel5.shared_R ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel5.shared_R ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel5.shared_R ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b7 ==> BV32_SLT($g1.0$1, $ni) ==> p2$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b7 ==> BV32_SLT($g1.0$2, $ni) ==> p2$2;
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b6 ==> BV32_UGE($g1.0$1, BV32_MUL(32bv32, group_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b6 ==> BV32_UGE($g1.0$2, BV32_MUL(32bv32, group_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b5 ==> BV32_ULE($g1.0$1, BV32_MUL(32bv32, group_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b5 ==> BV32_ULE($g1.0$2, BV32_MUL(32bv32, group_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b4 ==> BV32_SGE($g1.0$1, BV32_MUL(32bv32, group_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b4 ==> BV32_SGE($g1.0$2, BV32_MUL(32bv32, group_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b3 ==> BV32_SLE($g1.0$1, BV32_MUL(32bv32, group_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b3 ==> BV32_SLE($g1.0$2, BV32_MUL(32bv32, group_id_x$2));
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p2$1 ==> _b2 ==> BV32_SUB($g1.0$1, BV32_MUL(32bv32, group_id_x$1)) == BV32_SUB($g1.0$2, BV32_MUL(32bv32, group_id_x$2));
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p2$2 ==> _b2 ==> BV32_SUB($g1.0$2, BV32_MUL(32bv32, group_id_x$2)) == BV32_SUB($g1.0$1, BV32_MUL(32bv32, group_id_x$1));
    assert {:tag "guardNonNeg"} {:thread 1} p2$1 ==> _b1 ==> BV32_SLE(0bv32, $g1.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p2$2 ==> _b1 ==> BV32_SLE(0bv32, $g1.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p2$1 ==> _b0 ==> BV32_AND(BV32_SUB(1048576bv32, 1bv32), $g1.0$1) == BV32_AND(BV32_SUB(1048576bv32, 1bv32), BV32_MUL(32bv32, group_id_x$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p2$2 ==> _b0 ==> BV32_AND(BV32_SUB(1048576bv32, 1bv32), $g1.0$2) == BV32_AND(BV32_SUB(1048576bv32, 1bv32), BV32_MUL(32bv32, group_id_x$2));
    assert {:block_sourceloc} {:sourceloc_num 7} p2$1 ==> true;
    v3$1 := (if p2$1 then BV32_SLT($g1.0$1, $ni) else v3$1);
    v3$2 := (if p2$2 then BV32_SLT($g1.0$2, $ni) else v3$2);
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
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
    p3$1 := (if p2$1 && v3$1 then v3$1 else p3$1);
    p3$2 := (if p2$2 && v3$2 then v3$2 else p3$2);
    p2$1 := (if p2$1 && !v3$1 then v3$1 else p2$1);
    p2$2 := (if p2$2 && !v3$2 then v3$2 else p2$2);
    v4$1 := (if p3$1 then v0$1 == 0bv32 else v4$1);
    v4$2 := (if p3$2 then v0$2 == 0bv32 else v4$2);
    p5$1 := (if p3$1 && v4$1 then v4$1 else p5$1);
    p5$2 := (if p3$2 && v4$2 then v4$2 else p5$2);
    $c0.0$1 := (if p5$1 then 0bv32 else $c0.0$1);
    $c0.0$2 := (if p5$2 then 0bv32 else $c0.0$2);
    p6$1 := (if p5$1 then true else p6$1);
    p6$2 := (if p5$2 then true else p6$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $6;

  $6:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel5.shared_Q ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel5.shared_Q ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel5.shared_Q ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel5.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel5.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel5.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel5.shared_R ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel5.shared_R ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel5.shared_R ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p6$1 ==> p2$1;
    assert p6$2 ==> p2$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b27 ==> _WRITE_HAS_OCCURRED_$$kernel5.shared_A ==> BV32_SLT($g1.0$1, $ni) && local_id_x$1 == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p6$1 ==> _b26 ==> p6$1 ==> BV32_SLT($g1.0$1, $ni) && local_id_x$1 == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p6$2 ==> _b26 ==> p6$2 ==> BV32_SLT($g1.0$2, $ni) && local_id_x$2 == 0bv32;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b25 ==> BV32_SLT($g1.0$1, $ni) && local_id_x$1 == 0bv32 && BV32_SLT(BV32_SUB(BV32_SUB($ni, $g1.0$1), 1bv32), 31bv32) ==> p6$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b25 ==> BV32_SLT($g1.0$2, $ni) && local_id_x$2 == 0bv32 && BV32_SLT(BV32_SUB(BV32_SUB($ni, $g1.0$2), 1bv32), 31bv32) ==> p6$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b24 ==> v0$1 != 0bv32 ==> !_READ_HAS_OCCURRED_$$A;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b23 ==> v0$1 != 0bv32 ==> !_WRITE_HAS_OCCURRED_$$kernel5.shared_A;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b22 ==> v0$1 != 0bv32 ==> !p6$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b22 ==> v0$2 != 0bv32 ==> !p6$2;
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b21 ==> BV32_UGE($c0.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b21 ==> BV32_UGE($c0.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b20 ==> BV32_ULE($c0.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b20 ==> BV32_ULE($c0.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b19 ==> BV32_SGE($c0.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b19 ==> BV32_SGE($c0.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b18 ==> BV32_SLE($c0.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b18 ==> BV32_SLE($c0.0$2, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 10} p6$1 ==> true;
    v5$1 := (if p6$1 then BV32_SLT(BV32_SUB(BV32_SUB($ni, $g1.0$1), 1bv32), 31bv32) else v5$1);
    v5$2 := (if p6$2 then BV32_SLT(BV32_SUB(BV32_SUB($ni, $g1.0$2), 1bv32), 31bv32) else v5$2);
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    p9$1 := false;
    p9$2 := false;
    p8$1 := (if p6$1 && v5$1 then v5$1 else p8$1);
    p8$2 := (if p6$2 && v5$2 then v5$2 else p8$2);
    p7$1 := (if p6$1 && !v5$1 then !v5$1 else p7$1);
    p7$2 := (if p6$2 && !v5$2 then !v5$2 else p7$2);
    $0$1 := (if p7$1 then 31bv32 else $0$1);
    $0$2 := (if p7$2 then 31bv32 else $0$2);
    $0$1 := (if p8$1 then BV32_SUB(BV32_SUB($ni, $g1.0$1), 1bv32) else $0$1);
    $0$2 := (if p8$2 then BV32_SUB(BV32_SUB($ni, $g1.0$2), 1bv32) else $0$2);
    v6$1 := (if p6$1 then BV32_SLE($c0.0$1, $0$1) else v6$1);
    v6$2 := (if p6$2 then BV32_SLE($c0.0$2, $0$2) else v6$2);
    p9$1 := (if p6$1 && v6$1 then v6$1 else p9$1);
    p9$2 := (if p6$2 && v6$2 then v6$2 else p9$2);
    p6$1 := (if p6$1 && !v6$1 then v6$1 else p6$1);
    p6$2 := (if p6$2 && !v6$2 then v6$2 else p6$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v7$1 := (if p9$1 then _HAVOC_bv64$1 else v7$1);
    v7$2 := (if p9$2 then _HAVOC_bv64$2 else v7$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$kernel5.shared_A(p9$1, $c0.0$1, v7$1, $$kernel5.shared_A[1bv1][$c0.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel5.shared_A(p9$2, $c0.0$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$kernel5.shared_A(p9$2, $c0.0$2, v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel5.shared_A"} true;
    $$kernel5.shared_A[1bv1][$c0.0$1] := (if p9$1 then v7$1 else $$kernel5.shared_A[1bv1][$c0.0$1]);
    $$kernel5.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c0.0$2] := (if p9$2 then v7$2 else $$kernel5.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c0.0$2]);
    $c0.0$1 := (if p9$1 then BV32_ADD($c0.0$1, 1bv32) else $c0.0$1);
    $c0.0$2 := (if p9$2 then BV32_ADD($c0.0$2, 1bv32) else $c0.0$2);
    p6$1 := (if p9$1 then true else p6$1);
    p6$2 := (if p9$2 then true else p6$2);
    goto $6.backedge, __partitioned_block_$6.tail_0;

  __partitioned_block_$6.tail_0:
    assume !p6$1 && !p6$2;
    goto __partitioned_block_$6.tail_1;

  __partitioned_block_$6.tail_1:
    call {:sourceloc_num 20} $bugle_barrier_duplicated_0(1bv1, 1bv1, p3$1, p3$2);
    v8$1 := (if p3$1 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v8$1);
    v8$2 := (if p3$2 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v8$2);
    p11$1 := (if p3$1 && v8$1 then v8$1 else p11$1);
    p11$2 := (if p3$2 && v8$2 then v8$2 else p11$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$kernel5.shared_A(p11$1, v0$1, $$kernel5.shared_A[1bv1][v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$kernel5.shared_A(p11$2, v0$2, $$kernel5.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel5.shared_A"} true;
    v9$1 := (if p11$1 then $$kernel5.shared_A[1bv1][v0$1] else v9$1);
    v9$2 := (if p11$2 then $$kernel5.shared_A[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] else v9$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$kernel5.shared_R(p11$1, 0bv32, $$kernel5.shared_R[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$kernel5.shared_R(p11$2, 0bv32, $$kernel5.shared_R[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel5.shared_R"} true;
    v10$1 := (if p11$1 then $$kernel5.shared_R[1bv1][0bv32] else v10$1);
    v10$2 := (if p11$2 then $$kernel5.shared_R[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v10$2);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$kernel5.shared_Q(p11$1, v0$1, FDIV64(v9$1, v10$1), $$kernel5.shared_Q[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel5.shared_Q(p11$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$kernel5.shared_Q(p11$2, v0$2, FDIV64(v9$2, v10$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel5.shared_Q"} true;
    $$kernel5.shared_Q[1bv1][v0$1] := (if p11$1 then FDIV64(v9$1, v10$1) else $$kernel5.shared_Q[1bv1][v0$1]);
    $$kernel5.shared_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := (if p11$2 then FDIV64(v9$2, v10$2) else $$kernel5.shared_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    goto __partitioned_block_$6.tail_2;

  __partitioned_block_$6.tail_2:
    call {:sourceloc_num 26} $bugle_barrier_duplicated_1(1bv1, 1bv1, p3$1, p3$2);
    v11$1 := (if p3$1 then v0$1 == 0bv32 else v11$1);
    v11$2 := (if p3$2 then v0$2 == 0bv32 else v11$2);
    p13$1 := (if p3$1 && v11$1 then v11$1 else p13$1);
    p13$2 := (if p3$2 && v11$2 then v11$2 else p13$2);
    $c01.0$1 := (if p13$1 then 0bv32 else $c01.0$1);
    $c01.0$2 := (if p13$2 then 0bv32 else $c01.0$2);
    p14$1 := (if p13$1 then true else p14$1);
    p14$2 := (if p13$2 then true else p14$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $17;

  $17:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel5.shared_Q ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel5.shared_Q ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel5.shared_Q ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel5.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel5.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel5.shared_A ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel5.shared_R ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel5.shared_R ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel5.shared_R ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p14$1 ==> p2$1;
    assert p14$2 ==> p2$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b17 ==> _READ_HAS_OCCURRED_$$kernel5.shared_Q ==> BV32_SLT($g1.0$1, $ni) && local_id_x$1 == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p14$1 ==> _b16 ==> p14$1 ==> BV32_SLT($g1.0$1, $ni) && local_id_x$1 == 0bv32;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p14$2 ==> _b16 ==> p14$2 ==> BV32_SLT($g1.0$2, $ni) && local_id_x$2 == 0bv32;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b15 ==> BV32_SLT($g1.0$1, $ni) && local_id_x$1 == 0bv32 && BV32_SLT(BV32_SUB(BV32_SUB($ni, $g1.0$1), 1bv32), 31bv32) ==> p14$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b15 ==> BV32_SLT($g1.0$2, $ni) && local_id_x$2 == 0bv32 && BV32_SLT(BV32_SUB(BV32_SUB($ni, $g1.0$2), 1bv32), 31bv32) ==> p14$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b14 ==> v0$1 != 0bv32 ==> !_READ_HAS_OCCURRED_$$kernel5.shared_Q;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b13 ==> v0$1 != 0bv32 ==> !_WRITE_HAS_OCCURRED_$$Q;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b12 ==> v0$1 != 0bv32 ==> !p14$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b12 ==> v0$2 != 0bv32 ==> !p14$2;
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b11 ==> BV32_UGE($c01.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b11 ==> BV32_UGE($c01.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b10 ==> BV32_ULE($c01.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b10 ==> BV32_ULE($c01.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b9 ==> BV32_SGE($c01.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b9 ==> BV32_SGE($c01.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p14$1 ==> _b8 ==> BV32_SLE($c01.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p14$2 ==> _b8 ==> BV32_SLE($c01.0$2, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 28} p14$1 ==> true;
    v12$1 := (if p14$1 then BV32_SLT(BV32_SUB(BV32_SUB($ni, $g1.0$1), 1bv32), 31bv32) else v12$1);
    v12$2 := (if p14$2 then BV32_SLT(BV32_SUB(BV32_SUB($ni, $g1.0$2), 1bv32), 31bv32) else v12$2);
    p15$1 := false;
    p15$2 := false;
    p16$1 := false;
    p16$2 := false;
    p17$1 := false;
    p17$2 := false;
    p16$1 := (if p14$1 && v12$1 then v12$1 else p16$1);
    p16$2 := (if p14$2 && v12$2 then v12$2 else p16$2);
    p15$1 := (if p14$1 && !v12$1 then !v12$1 else p15$1);
    p15$2 := (if p14$2 && !v12$2 then !v12$2 else p15$2);
    $1$1 := (if p15$1 then 31bv32 else $1$1);
    $1$2 := (if p15$2 then 31bv32 else $1$2);
    $1$1 := (if p16$1 then BV32_SUB(BV32_SUB($ni, $g1.0$1), 1bv32) else $1$1);
    $1$2 := (if p16$2 then BV32_SUB(BV32_SUB($ni, $g1.0$2), 1bv32) else $1$2);
    v13$1 := (if p14$1 then BV32_SLE($c01.0$1, $1$1) else v13$1);
    v13$2 := (if p14$2 then BV32_SLE($c01.0$2, $1$2) else v13$2);
    p17$1 := (if p14$1 && v13$1 then v13$1 else p17$1);
    p17$2 := (if p14$2 && v13$2 then v13$2 else p17$2);
    p14$1 := (if p14$1 && !v13$1 then v13$1 else p14$1);
    p14$2 := (if p14$2 && !v13$2 then v13$2 else p14$2);
    call {:sourceloc} {:sourceloc_num 33} _LOG_READ_$$kernel5.shared_Q(p17$1, $c01.0$1, $$kernel5.shared_Q[1bv1][$c01.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 33} _CHECK_READ_$$kernel5.shared_Q(p17$2, $c01.0$2, $$kernel5.shared_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c01.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel5.shared_Q"} true;
    v14$1 := (if p17$1 then $$kernel5.shared_Q[1bv1][$c01.0$1] else v14$1);
    v14$2 := (if p17$2 then $$kernel5.shared_Q[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][$c01.0$2] else v14$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$Q(p17$1, BV32_ADD(BV32_MUL(BV32_ADD($g1.0$1, $c01.0$1), $nj), BV32_SDIV(BV32_SUB($h0, 3bv32), 5bv32)), v14$1, $$Q[BV32_ADD(BV32_MUL(BV32_ADD($g1.0$1, $c01.0$1), $nj), BV32_SDIV(BV32_SUB($h0, 3bv32), 5bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$Q(p17$2, BV32_ADD(BV32_MUL(BV32_ADD($g1.0$2, $c01.0$2), $nj), BV32_SDIV(BV32_SUB($h0, 3bv32), 5bv32)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$Q(p17$2, BV32_ADD(BV32_MUL(BV32_ADD($g1.0$2, $c01.0$2), $nj), BV32_SDIV(BV32_SUB($h0, 3bv32), 5bv32)), v14$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$Q"} true;
    $$Q[BV32_ADD(BV32_MUL(BV32_ADD($g1.0$1, $c01.0$1), $nj), BV32_SDIV(BV32_SUB($h0, 3bv32), 5bv32))] := (if p17$1 then v14$1 else $$Q[BV32_ADD(BV32_MUL(BV32_ADD($g1.0$1, $c01.0$1), $nj), BV32_SDIV(BV32_SUB($h0, 3bv32), 5bv32))]);
    $$Q[BV32_ADD(BV32_MUL(BV32_ADD($g1.0$2, $c01.0$2), $nj), BV32_SDIV(BV32_SUB($h0, 3bv32), 5bv32))] := (if p17$2 then v14$2 else $$Q[BV32_ADD(BV32_MUL(BV32_ADD($g1.0$2, $c01.0$2), $nj), BV32_SDIV(BV32_SUB($h0, 3bv32), 5bv32))]);
    $c01.0$1 := (if p17$1 then BV32_ADD($c01.0$1, 1bv32) else $c01.0$1);
    $c01.0$2 := (if p17$2 then BV32_ADD($c01.0$2, 1bv32) else $c01.0$2);
    p14$1 := (if p17$1 then true else p14$1);
    p14$2 := (if p17$2 then true else p14$2);
    goto $17.backedge, __partitioned_block_$17.tail_0;

  __partitioned_block_$17.tail_0:
    assume !p14$1 && !p14$2;
    goto __partitioned_block_$17.tail_1;

  __partitioned_block_$17.tail_1:
    call {:sourceloc_num 38} $bugle_barrier_duplicated_2(1bv1, 1bv1, p3$1, p3$2);
    $g1.0$1 := (if p3$1 then BV32_ADD($g1.0$1, 1048576bv32) else $g1.0$1);
    $g1.0$2 := (if p3$2 then BV32_ADD($g1.0$2, 1048576bv32) else $g1.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, $3.tail;

  $3.tail:
    assume !p2$1 && !p2$2;
    return;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $3;

  $17.backedge:
    assume {:backedge} p14$1 || p14$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $17;

  $6.backedge:
    assume {:backedge} p6$1 || p6$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $6;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$kernel5.shared_R, $$kernel5.shared_A, $$kernel5.shared_Q, $$Q, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel5.shared_R, $$kernel5.shared_A, $$kernel5.shared_Q, $$Q, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel5.shared_R, $$kernel5.shared_A, $$kernel5.shared_Q, $$Q, _TRACKING;



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



const _WATCHED_VALUE_$$kernel5.shared_R: bv64;

procedure {:inline 1} _LOG_READ_$$kernel5.shared_R(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel5.shared_R;



implementation {:inline 1} _LOG_READ_$$kernel5.shared_R(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel5.shared_R := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_R == _value then true else _READ_HAS_OCCURRED_$$kernel5.shared_R);
    return;
}



procedure _CHECK_READ_$$kernel5.shared_R(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_R"} {:array "$$kernel5.shared_R"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel5.shared_R && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_R && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_R"} {:array "$$kernel5.shared_R"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel5.shared_R && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_R: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel5.shared_R(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel5.shared_R, _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_R;



implementation {:inline 1} _LOG_WRITE_$$kernel5.shared_R(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel5.shared_R := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_R == _value then true else _WRITE_HAS_OCCURRED_$$kernel5.shared_R);
    _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_R := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_R == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_R);
    return;
}



procedure _CHECK_WRITE_$$kernel5.shared_R(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_R"} {:array "$$kernel5.shared_R"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel5.shared_R && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_R != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_R"} {:array "$$kernel5.shared_R"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel5.shared_R && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_R != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_R"} {:array "$$kernel5.shared_R"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel5.shared_R && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel5.shared_R(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel5.shared_R;



implementation {:inline 1} _LOG_ATOMIC_$$kernel5.shared_R(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel5.shared_R := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel5.shared_R);
    return;
}



procedure _CHECK_ATOMIC_$$kernel5.shared_R(_P: bool, _offset: bv32);
  requires {:source_name "shared_R"} {:array "$$kernel5.shared_R"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel5.shared_R && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_R"} {:array "$$kernel5.shared_R"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel5.shared_R && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel5.shared_R(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_R;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel5.shared_R(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_R := (if _P && _WRITE_HAS_OCCURRED_$$kernel5.shared_R && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_R);
    return;
}



const _WATCHED_VALUE_$$kernel5.shared_A: bv64;

procedure {:inline 1} _LOG_READ_$$kernel5.shared_A(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel5.shared_A;



implementation {:inline 1} _LOG_READ_$$kernel5.shared_A(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel5.shared_A := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_A == _value then true else _READ_HAS_OCCURRED_$$kernel5.shared_A);
    return;
}



procedure _CHECK_READ_$$kernel5.shared_A(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_A"} {:array "$$kernel5.shared_A"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel5.shared_A && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_A && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A"} {:array "$$kernel5.shared_A"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel5.shared_A && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_A: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel5.shared_A(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel5.shared_A, _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_A;



implementation {:inline 1} _LOG_WRITE_$$kernel5.shared_A(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel5.shared_A := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_A == _value then true else _WRITE_HAS_OCCURRED_$$kernel5.shared_A);
    _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_A := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_A == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_A);
    return;
}



procedure _CHECK_WRITE_$$kernel5.shared_A(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_A"} {:array "$$kernel5.shared_A"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel5.shared_A && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_A != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A"} {:array "$$kernel5.shared_A"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel5.shared_A && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_A != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A"} {:array "$$kernel5.shared_A"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel5.shared_A && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel5.shared_A(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel5.shared_A;



implementation {:inline 1} _LOG_ATOMIC_$$kernel5.shared_A(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel5.shared_A := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel5.shared_A);
    return;
}



procedure _CHECK_ATOMIC_$$kernel5.shared_A(_P: bool, _offset: bv32);
  requires {:source_name "shared_A"} {:array "$$kernel5.shared_A"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel5.shared_A && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_A"} {:array "$$kernel5.shared_A"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel5.shared_A && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel5.shared_A(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_A;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel5.shared_A(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_A := (if _P && _WRITE_HAS_OCCURRED_$$kernel5.shared_A && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_A);
    return;
}



const _WATCHED_VALUE_$$kernel5.shared_Q: bv64;

procedure {:inline 1} _LOG_READ_$$kernel5.shared_Q(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel5.shared_Q;



implementation {:inline 1} _LOG_READ_$$kernel5.shared_Q(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel5.shared_Q := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_Q == _value then true else _READ_HAS_OCCURRED_$$kernel5.shared_Q);
    return;
}



procedure _CHECK_READ_$$kernel5.shared_Q(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_Q"} {:array "$$kernel5.shared_Q"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel5.shared_Q && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_Q && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_Q"} {:array "$$kernel5.shared_Q"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel5.shared_Q && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_Q: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel5.shared_Q(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel5.shared_Q, _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_Q;



implementation {:inline 1} _LOG_WRITE_$$kernel5.shared_Q(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel5.shared_Q := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_Q == _value then true else _WRITE_HAS_OCCURRED_$$kernel5.shared_Q);
    _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_Q := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_Q == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_Q);
    return;
}



procedure _CHECK_WRITE_$$kernel5.shared_Q(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_Q"} {:array "$$kernel5.shared_Q"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel5.shared_Q && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_Q != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_Q"} {:array "$$kernel5.shared_Q"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel5.shared_Q && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel5.shared_Q != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_Q"} {:array "$$kernel5.shared_Q"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel5.shared_Q && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel5.shared_Q(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel5.shared_Q;



implementation {:inline 1} _LOG_ATOMIC_$$kernel5.shared_Q(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel5.shared_Q := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel5.shared_Q);
    return;
}



procedure _CHECK_ATOMIC_$$kernel5.shared_Q(_P: bool, _offset: bv32);
  requires {:source_name "shared_Q"} {:array "$$kernel5.shared_Q"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel5.shared_Q && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_Q"} {:array "$$kernel5.shared_Q"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel5.shared_Q && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel5.shared_Q(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_Q;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel5.shared_Q(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_Q := (if _P && _WRITE_HAS_OCCURRED_$$kernel5.shared_Q && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel5.shared_Q);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel5.shared_R;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel5.shared_R;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel5.shared_R;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel5.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel5.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel5.shared_A;
    goto anon2;

  anon2:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel5.shared_Q;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel5.shared_Q;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel5.shared_Q;
    goto anon3;

  anon3:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon7;

  anon7:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$Q;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$Q;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$Q;
    goto anon8;

  anon8:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$Q;
    goto anon10;

  anon12_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel5.shared_R;
    goto anon5;

  anon5:
    havoc $$kernel5.shared_A;
    goto anon6;

  anon6:
    havoc $$kernel5.shared_Q;
    goto anon7;

  anon11_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel5.shared_R;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel5.shared_R;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel5.shared_R;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel5.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel5.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel5.shared_A;
    goto anon2;

  anon2:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel5.shared_Q;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel5.shared_Q;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel5.shared_Q;
    goto anon3;

  anon3:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon7;

  anon7:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$Q;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$Q;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$Q;
    goto anon8;

  anon8:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$Q;
    goto anon10;

  anon12_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel5.shared_R;
    goto anon5;

  anon5:
    havoc $$kernel5.shared_A;
    goto anon6;

  anon6:
    havoc $$kernel5.shared_Q;
    goto anon7;

  anon11_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel5.shared_R;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel5.shared_R;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel5.shared_R;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel5.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel5.shared_A;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel5.shared_A;
    goto anon2;

  anon2:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel5.shared_Q;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel5.shared_Q;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel5.shared_Q;
    goto anon3;

  anon3:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon7;

  anon7:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$Q;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$Q;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$Q;
    goto anon8;

  anon8:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$Q;
    goto anon10;

  anon12_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel5.shared_R;
    goto anon5;

  anon5:
    havoc $$kernel5.shared_A;
    goto anon6;

  anon6:
    havoc $$kernel5.shared_Q;
    goto anon7;

  anon11_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

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
