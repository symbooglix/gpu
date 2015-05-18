type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP64(x: [bv32]bv64, y: bv32) returns (z$1: bv64, A$1: [bv32]bv64, z$2: bv64, A$2: [bv32]bv64);



var {:source_name "tmp"} {:global} $$tmp: [bv32]bv64;

axiom {:array_info "$$tmp"} {:global} {:elem_width 64} {:source_name "tmp"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$tmp: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$tmp: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$tmp: bool;

axiom {:array_info "$$B"} {:global} {:elem_width 64} {:source_name "B"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$B: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$B: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$B: bool;

axiom {:array_info "$$A"} {:global} {:elem_width 64} {:source_name "A"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$A: bool;

var {:race_checking} {:global} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$A: bool;

axiom {:array_info "$$private_tmp"} {:elem_width 64} {:source_name "private_tmp"} {:source_elem_width 64} {:source_dimensions "1,2"} true;

var {:source_name "shared_B"} {:group_shared} $$kernel0.shared_B: [bv1][bv32]bv64;

axiom {:array_info "$$kernel0.shared_B"} {:group_shared} {:elem_width 64} {:source_name "shared_B"} {:source_elem_width 64} {:source_dimensions "32,32"} true;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _READ_HAS_OCCURRED_$$kernel0.shared_B: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _WRITE_HAS_OCCURRED_$$kernel0.shared_B: bool;

var {:race_checking} {:group_shared} {:elem_width 64} {:source_elem_width 64} {:source_dimensions "*,32"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_B: bool;

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

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "kernel0"} {:kernel} $kernel0($alpha: bv64, $nl: bv32, $nj: bv32, $nk: bv32, $ni: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $nl == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $nk == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $nj == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 3} {:thread 1} (if $ni == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$tmp && !_WRITE_HAS_OCCURRED_$$tmp && !_ATOMIC_HAS_OCCURRED_$$tmp;
  requires !_READ_HAS_OCCURRED_$$B && !_WRITE_HAS_OCCURRED_$$B && !_ATOMIC_HAS_OCCURRED_$$B;
  requires !_READ_HAS_OCCURRED_$$A && !_WRITE_HAS_OCCURRED_$$A && !_ATOMIC_HAS_OCCURRED_$$A;
  requires !_READ_HAS_OCCURRED_$$kernel0.shared_B && !_WRITE_HAS_OCCURRED_$$kernel0.shared_B && !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_B;
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
  modifies $$kernel0.shared_B, _READ_HAS_OCCURRED_$$tmp, _WRITE_HAS_OCCURRED_$$kernel0.shared_B, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_B, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_B, $$tmp, _TRACKING, _READ_HAS_OCCURRED_$$kernel0.shared_B, _TRACKING, _WRITE_HAS_OCCURRED_$$tmp, _WRITE_READ_BENIGN_FLAG_$$tmp, _WRITE_READ_BENIGN_FLAG_$$tmp, _TRACKING;



implementation {:source_name "kernel0"} {:kernel} $kernel0($alpha: bv64, $nl: bv32, $nj: bv32, $nk: bv32, $ni: bv32)
{
  var $g1.0$1: bv32;
  var $g1.0$2: bv32;
  var $g3.0$1: bv32;
  var $g3.0$2: bv32;
  var $g9.0$1: bv32;
  var $g9.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $c1.0$1: bv32;
  var $c1.0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $c3.0$1: bv32;
  var $c3.0$2: bv32;
  var $2$1: bv32;
  var $2$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
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
  var v15$1: bool;
  var v15$2: bool;
  var v16$1: bv64;
  var v16$2: bv64;
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
  var v25$1: bv64;
  var v25$2: bv64;
  var v26$1: bv64;
  var v26$2: bv64;
  var v27$1: bv64;
  var v27$2: bv64;
  var v28$1: bool;
  var v28$2: bool;
  var v29$1: bv64;
  var v29$2: bv64;
  var v30$1: bv64;
  var v30$2: bv64;
  var v31$1: bv64;
  var v31$2: bv64;
  var v32$1: bool;
  var v32$2: bool;
  var v33$1: bool;
  var v33$2: bool;
  var v34$1: bv64;
  var v34$2: bv64;
  var v35$1: bool;
  var v35$2: bool;
  var v36$1: bv64;
  var v36$2: bv64;
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
  var _HAVOC_bv64$1: bv64;
  var _HAVOC_bv64$2: bv64;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1$1 := local_id_y$1;
    v1$2 := local_id_y$2;
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
    assert {:tag "accessBreak"} _b100 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 32bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b99 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> BV32_AND(BV32_SUB(16bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(16bv32, 1bv32), BV32_ADD(local_id_y$1, BV32_MUL(local_id_x$1, 32bv32)));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b98 ==> _READ_HAS_OCCURRED_$$kernel0.shared_B ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 32bv32), local_id_y$1)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 32bv32), BV32_ADD(local_id_y$1, 16bv32)));
    assert {:tag "nowrite"} _b97 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_B;
    assert {:tag "noread"} _b96 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_B;
    assert {:tag "nowrite"} _b95 ==> !_WRITE_HAS_OCCURRED_$$tmp;
    assert {:tag "noread"} _b94 ==> !_READ_HAS_OCCURRED_$$tmp;
    assert {:tag "predicatedEquality"} _b93 ==> p0$1 && p0$2 ==> v36$1 == v36$2;
    assert {:tag "predicatedEquality"} _b92 ==> p0$1 && p0$2 ==> v35$1 == v35$2;
    assert {:tag "predicatedEquality"} _b91 ==> p0$1 && p0$2 ==> v34$1 == v34$2;
    assert {:tag "predicatedEquality"} _b90 ==> p0$1 && p0$2 ==> v33$1 == v33$2;
    assert {:tag "predicatedEquality"} _b89 ==> p0$1 && p0$2 ==> v32$1 == v32$2;
    assert {:tag "predicatedEquality"} _b88 ==> p0$1 && p0$2 ==> v31$1 == v31$2;
    assert {:tag "predicatedEquality"} _b87 ==> p0$1 && p0$2 ==> v30$1 == v30$2;
    assert {:tag "predicatedEquality"} _b86 ==> p0$1 && p0$2 ==> v29$1 == v29$2;
    assert {:tag "predicatedEquality"} _b85 ==> p0$1 && p0$2 ==> v28$1 == v28$2;
    assert {:tag "predicatedEquality"} _b84 ==> p0$1 && p0$2 ==> v27$1 == v27$2;
    assert {:tag "predicatedEquality"} _b83 ==> p0$1 && p0$2 ==> v26$1 == v26$2;
    assert {:tag "predicatedEquality"} _b82 ==> p0$1 && p0$2 ==> v25$1 == v25$2;
    assert {:tag "predicatedEquality"} _b81 ==> p0$1 && p0$2 ==> v24$1 == v24$2;
    assert {:tag "predicatedEquality"} _b80 ==> p0$1 && p0$2 ==> v23$1 == v23$2;
    assert {:tag "predicatedEquality"} _b79 ==> p0$1 && p0$2 ==> v22$1 == v22$2;
    assert {:tag "predicatedEquality"} _b78 ==> p0$1 && p0$2 ==> v21$1 == v21$2;
    assert {:tag "predicatedEquality"} _b77 ==> p0$1 && p0$2 ==> v20$1 == v20$2;
    assert {:tag "predicatedEquality"} _b76 ==> p0$1 && p0$2 ==> v19$1 == v19$2;
    assert {:tag "predicatedEquality"} _b75 ==> p0$1 && p0$2 ==> v18$1 == v18$2;
    assert {:tag "predicatedEquality"} _b74 ==> p0$1 && p0$2 ==> v17$1 == v17$2;
    assert {:tag "predicatedEquality"} _b73 ==> p0$1 && p0$2 ==> v16$1 == v16$2;
    assert {:tag "predicatedEquality"} _b72 ==> p0$1 && p0$2 ==> v15$1 == v15$2;
    assert {:tag "predicatedEquality"} _b71 ==> p0$1 && p0$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b70 ==> p0$1 && p0$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b69 ==> p0$1 && p0$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b68 ==> p0$1 && p0$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b67 ==> p0$1 && p0$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b66 ==> p0$1 && p0$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b65 ==> p0$1 && p0$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b64 ==> p0$1 && p0$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b63 ==> p0$1 && p0$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b62 ==> p0$1 && p0$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b61 ==> p0$1 && p0$2 ==> v4$1 == v4$2;
    assert {:tag "predicatedEquality"} _b60 ==> p0$1 && p0$2 ==> v3$1 == v3$2;
    assert {:tag "predicatedEquality"} _b59 ==> p0$1 && p0$2 ==> v2$1 == v2$2;
    assert {:tag "predicatedEquality"} _b58 ==> p0$1 && p0$2 ==> $2$1 == $2$2;
    assert {:tag "predicatedEquality"} _b57 ==> p0$1 && p0$2 ==> $c3.0$1 == $c3.0$2;
    assert {:tag "predicatedEquality"} _b56 ==> p0$1 && p0$2 ==> $1$1 == $1$2;
    assert {:tag "predicatedEquality"} _b55 ==> p0$1 && p0$2 ==> $c1.0$1 == $c1.0$2;
    assert {:tag "predicatedEquality"} _b54 ==> p0$1 && p0$2 ==> $0$1 == $0$2;
    assert {:tag "predicatedEquality"} _b53 ==> p0$1 && p0$2 ==> $g9.0$1 == $g9.0$2;
    assert {:tag "predicatedEquality"} _b52 ==> p0$1 && p0$2 ==> $g3.0$1 == $g3.0$2;
    assert {:tag "predicatedEquality"} _b51 ==> p0$1 && p0$2 ==> $g1.0$1 == $g1.0$2;
    assert {:tag "loopPredicateEquality"} _b50 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p0$1 == p0$2;
    assert {:tag "loopPredicateEquality"} _b49 ==> p0$1 == p0$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b7 ==> BV32_SLT($g1.0$1, $ni) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b7 ==> BV32_SLT($g1.0$2, $ni) ==> p0$2;
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
    assert {:block_sourceloc} {:sourceloc_num 5} p0$1 ==> true;
    v2$1 := (if p0$1 then BV32_SLT($g1.0$1, $ni) else v2$1);
    v2$2 := (if p0$2 then BV32_SLT($g1.0$2, $ni) else v2$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p48$1 := false;
    p48$2 := false;
    p1$1 := (if p0$1 && v2$1 then v2$1 else p1$1);
    p1$2 := (if p0$2 && v2$2 then v2$2 else p1$2);
    p0$1 := (if p0$1 && !v2$1 then v2$1 else p0$1);
    p0$2 := (if p0$2 && !v2$2 then v2$2 else p0$2);
    $g3.0$1 := (if p1$1 then BV32_MUL(32bv32, group_id_y$1) else $g3.0$1);
    $g3.0$2 := (if p1$2 then BV32_MUL(32bv32, group_id_y$2) else $g3.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessBreak"} _b150 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 32bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b149 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> BV32_AND(BV32_SUB(16bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(16bv32, 1bv32), BV32_ADD(local_id_y$1, BV32_MUL(local_id_x$1, 32bv32)));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b148 ==> _READ_HAS_OCCURRED_$$kernel0.shared_B ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 32bv32), local_id_y$1)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 32bv32), BV32_ADD(local_id_y$1, 16bv32)));
    assert {:tag "nowrite"} _b147 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_B;
    assert {:tag "noread"} _b146 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_B;
    assert {:tag "nowrite"} _b145 ==> !_WRITE_HAS_OCCURRED_$$tmp;
    assert {:tag "noread"} _b144 ==> !_READ_HAS_OCCURRED_$$tmp;
    assert {:tag "predicatedEquality"} _b143 ==> p2$1 && p2$2 ==> v36$1 == v36$2;
    assert {:tag "predicatedEquality"} _b142 ==> p2$1 && p2$2 ==> v35$1 == v35$2;
    assert {:tag "predicatedEquality"} _b141 ==> p2$1 && p2$2 ==> v34$1 == v34$2;
    assert {:tag "predicatedEquality"} _b140 ==> p2$1 && p2$2 ==> v33$1 == v33$2;
    assert {:tag "predicatedEquality"} _b139 ==> p2$1 && p2$2 ==> v32$1 == v32$2;
    assert {:tag "predicatedEquality"} _b138 ==> p2$1 && p2$2 ==> v31$1 == v31$2;
    assert {:tag "predicatedEquality"} _b137 ==> p2$1 && p2$2 ==> v30$1 == v30$2;
    assert {:tag "predicatedEquality"} _b136 ==> p2$1 && p2$2 ==> v29$1 == v29$2;
    assert {:tag "predicatedEquality"} _b135 ==> p2$1 && p2$2 ==> v28$1 == v28$2;
    assert {:tag "predicatedEquality"} _b134 ==> p2$1 && p2$2 ==> v27$1 == v27$2;
    assert {:tag "predicatedEquality"} _b133 ==> p2$1 && p2$2 ==> v26$1 == v26$2;
    assert {:tag "predicatedEquality"} _b132 ==> p2$1 && p2$2 ==> v25$1 == v25$2;
    assert {:tag "predicatedEquality"} _b131 ==> p2$1 && p2$2 ==> v24$1 == v24$2;
    assert {:tag "predicatedEquality"} _b130 ==> p2$1 && p2$2 ==> v23$1 == v23$2;
    assert {:tag "predicatedEquality"} _b129 ==> p2$1 && p2$2 ==> v22$1 == v22$2;
    assert {:tag "predicatedEquality"} _b128 ==> p2$1 && p2$2 ==> v21$1 == v21$2;
    assert {:tag "predicatedEquality"} _b127 ==> p2$1 && p2$2 ==> v20$1 == v20$2;
    assert {:tag "predicatedEquality"} _b126 ==> p2$1 && p2$2 ==> v19$1 == v19$2;
    assert {:tag "predicatedEquality"} _b125 ==> p2$1 && p2$2 ==> v18$1 == v18$2;
    assert {:tag "predicatedEquality"} _b124 ==> p2$1 && p2$2 ==> v17$1 == v17$2;
    assert {:tag "predicatedEquality"} _b123 ==> p2$1 && p2$2 ==> v16$1 == v16$2;
    assert {:tag "predicatedEquality"} _b122 ==> p2$1 && p2$2 ==> v15$1 == v15$2;
    assert {:tag "predicatedEquality"} _b121 ==> p2$1 && p2$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b120 ==> p2$1 && p2$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b119 ==> p2$1 && p2$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b118 ==> p2$1 && p2$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b117 ==> p2$1 && p2$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b116 ==> p2$1 && p2$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b115 ==> p2$1 && p2$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b114 ==> p2$1 && p2$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b113 ==> p2$1 && p2$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b112 ==> p2$1 && p2$2 ==> v5$1 == v5$2;
    assert {:tag "predicatedEquality"} _b111 ==> p2$1 && p2$2 ==> v4$1 == v4$2;
    assert {:tag "predicatedEquality"} _b110 ==> p2$1 && p2$2 ==> v3$1 == v3$2;
    assert {:tag "predicatedEquality"} _b109 ==> p2$1 && p2$2 ==> $2$1 == $2$2;
    assert {:tag "predicatedEquality"} _b108 ==> p2$1 && p2$2 ==> $c3.0$1 == $c3.0$2;
    assert {:tag "predicatedEquality"} _b107 ==> p2$1 && p2$2 ==> $1$1 == $1$2;
    assert {:tag "predicatedEquality"} _b106 ==> p2$1 && p2$2 ==> $c1.0$1 == $c1.0$2;
    assert {:tag "predicatedEquality"} _b105 ==> p2$1 && p2$2 ==> $0$1 == $0$2;
    assert {:tag "predicatedEquality"} _b104 ==> p2$1 && p2$2 ==> $g9.0$1 == $g9.0$2;
    assert {:tag "predicatedEquality"} _b103 ==> p2$1 && p2$2 ==> $g3.0$1 == $g3.0$2;
    assert {:tag "loopPredicateEquality"} _b102 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p2$1 == p2$2;
    assert {:tag "loopPredicateEquality"} _b101 ==> p2$1 == p2$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p2$1 ==> p0$1;
    assert p2$2 ==> p0$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b18 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> BV32_SLT($g1.0$1, $ni);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b17 ==> _READ_HAS_OCCURRED_$$kernel0.shared_B ==> BV32_SLT($g1.0$1, $ni);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p2$1 ==> _b16 ==> p2$1 ==> BV32_SLT($g1.0$1, $ni);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p2$2 ==> _b16 ==> p2$2 ==> BV32_SLT($g1.0$2, $ni);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b15 ==> BV32_SLT($g1.0$1, $ni) && BV32_SLT($g3.0$1, $nj) ==> p2$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b15 ==> BV32_SLT($g1.0$2, $ni) && BV32_SLT($g3.0$2, $nj) ==> p2$2;
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b14 ==> BV32_UGE($g3.0$1, BV32_MUL(32bv32, group_id_y$1));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b14 ==> BV32_UGE($g3.0$2, BV32_MUL(32bv32, group_id_y$2));
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b13 ==> BV32_ULE($g3.0$1, BV32_MUL(32bv32, group_id_y$1));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b13 ==> BV32_ULE($g3.0$2, BV32_MUL(32bv32, group_id_y$2));
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b12 ==> BV32_SGE($g3.0$1, BV32_MUL(32bv32, group_id_y$1));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b12 ==> BV32_SGE($g3.0$2, BV32_MUL(32bv32, group_id_y$2));
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b11 ==> BV32_SLE($g3.0$1, BV32_MUL(32bv32, group_id_y$1));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b11 ==> BV32_SLE($g3.0$2, BV32_MUL(32bv32, group_id_y$2));
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p2$1 ==> _b10 ==> BV32_SUB($g3.0$1, BV32_MUL(32bv32, group_id_y$1)) == BV32_SUB($g3.0$2, BV32_MUL(32bv32, group_id_y$2));
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p2$2 ==> _b10 ==> BV32_SUB($g3.0$2, BV32_MUL(32bv32, group_id_y$2)) == BV32_SUB($g3.0$1, BV32_MUL(32bv32, group_id_y$1));
    assert {:tag "guardNonNeg"} {:thread 1} p2$1 ==> _b9 ==> BV32_SLE(0bv32, $g3.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p2$2 ==> _b9 ==> BV32_SLE(0bv32, $g3.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p2$1 ==> _b8 ==> BV32_AND(BV32_SUB(8192bv32, 1bv32), $g3.0$1) == BV32_AND(BV32_SUB(8192bv32, 1bv32), BV32_MUL(32bv32, group_id_y$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p2$2 ==> _b8 ==> BV32_AND(BV32_SUB(8192bv32, 1bv32), $g3.0$2) == BV32_AND(BV32_SUB(8192bv32, 1bv32), BV32_MUL(32bv32, group_id_y$2));
    assert {:block_sourceloc} {:sourceloc_num 7} p2$1 ==> true;
    v3$1 := (if p2$1 then BV32_SLT($g3.0$1, $nj) else v3$1);
    v3$2 := (if p2$2 then BV32_SLT($g3.0$2, $nj) else v3$2);
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
    p3$1 := (if p2$1 && v3$1 then v3$1 else p3$1);
    p3$2 := (if p2$2 && v3$2 then v3$2 else p3$2);
    p2$1 := (if p2$1 && !v3$1 then v3$1 else p2$1);
    p2$2 := (if p2$2 && !v3$2 then v3$2 else p2$2);
    v4$1 := (if p3$1 then BV32_SGE($nk, 1bv32) else v4$1);
    v4$2 := (if p3$2 then BV32_SGE($nk, 1bv32) else v4$2);
    p5$1 := (if p3$1 && v4$1 then v4$1 else p5$1);
    p5$2 := (if p3$2 && v4$2 then v4$2 else p5$2);
    v5$1 := (if p5$1 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 1bv32)) else v5$1);
    v5$2 := (if p5$2 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 1bv32)) else v5$2);
    p7$1 := (if p5$1 && v5$1 then v5$1 else p7$1);
    p7$2 := (if p5$2 && v5$2 then v5$2 else p7$2);
    v6$1 := (if p7$1 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v6$1);
    v6$2 := (if p7$2 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v6$2);
    p9$1 := (if p7$1 && v6$1 then v6$1 else p9$1);
    p9$2 := (if p7$2 && v6$2 then v6$2 else p9$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$tmp(p9$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $nj), BV32_ADD(v1$1, $g3.0$1)), $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $nj), BV32_ADD(v1$1, $g3.0$1))]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$tmp(p9$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $nj), BV32_ADD(v1$2, $g3.0$2)), $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $nj), BV32_ADD(v1$2, $g3.0$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$tmp"} true;
    v7$1 := (if p9$1 then $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $nj), BV32_ADD(v1$1, $g3.0$1))] else v7$1);
    v7$2 := (if p9$2 then $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $nj), BV32_ADD(v1$2, $g3.0$2))] else v7$2);
    $$private_tmp$0bv32$1 := (if p9$1 then v7$1 else $$private_tmp$0bv32$1);
    $$private_tmp$0bv32$2 := (if p9$2 then v7$2 else $$private_tmp$0bv32$2);
    v8$1 := (if p9$1 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 17bv32)) else v8$1);
    v8$2 := (if p9$2 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 17bv32)) else v8$2);
    p11$1 := (if p9$1 && v8$1 then v8$1 else p11$1);
    p11$2 := (if p9$2 && v8$2 then v8$2 else p11$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$tmp(p11$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $nj), BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 16bv32)), $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $nj), BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 16bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$tmp(p11$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $nj), BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 16bv32)), $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $nj), BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 16bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$tmp"} true;
    v9$1 := (if p11$1 then $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $nj), BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 16bv32))] else v9$1);
    v9$2 := (if p11$2 then $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $nj), BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 16bv32))] else v9$2);
    $$private_tmp$1bv32$1 := (if p11$1 then v9$1 else $$private_tmp$1bv32$1);
    $$private_tmp$1bv32$2 := (if p11$2 then v9$2 else $$private_tmp$1bv32$2);
    $g9.0$1 := (if p3$1 then 0bv32 else $g9.0$1);
    $g9.0$2 := (if p3$2 then 0bv32 else $g9.0$2);
    p12$1 := (if p3$1 then true else p12$1);
    p12$2 := (if p3$2 then true else p12$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $12;

  $12:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "accessBreak"} _b185 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 32bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b184 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> BV32_AND(BV32_SUB(16bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(16bv32, 1bv32), BV32_ADD(local_id_y$1, BV32_MUL(local_id_x$1, 32bv32)));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b183 ==> _READ_HAS_OCCURRED_$$kernel0.shared_B ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 32bv32), local_id_y$1)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 32bv32), BV32_ADD(local_id_y$1, 16bv32)));
    assert {:tag "nowrite"} _b182 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_B;
    assert {:tag "noread"} _b181 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_B;
    assert {:tag "predicatedEquality"} _b180 ==> p12$1 && p12$2 ==> v31$1 == v31$2;
    assert {:tag "predicatedEquality"} _b179 ==> p12$1 && p12$2 ==> v30$1 == v30$2;
    assert {:tag "predicatedEquality"} _b178 ==> p12$1 && p12$2 ==> v29$1 == v29$2;
    assert {:tag "predicatedEquality"} _b177 ==> p12$1 && p12$2 ==> v28$1 == v28$2;
    assert {:tag "predicatedEquality"} _b176 ==> p12$1 && p12$2 ==> v27$1 == v27$2;
    assert {:tag "predicatedEquality"} _b175 ==> p12$1 && p12$2 ==> v26$1 == v26$2;
    assert {:tag "predicatedEquality"} _b174 ==> p12$1 && p12$2 ==> v25$1 == v25$2;
    assert {:tag "predicatedEquality"} _b173 ==> p12$1 && p12$2 ==> v24$1 == v24$2;
    assert {:tag "predicatedEquality"} _b172 ==> p12$1 && p12$2 ==> v23$1 == v23$2;
    assert {:tag "predicatedEquality"} _b171 ==> p12$1 && p12$2 ==> v22$1 == v22$2;
    assert {:tag "predicatedEquality"} _b170 ==> p12$1 && p12$2 ==> v21$1 == v21$2;
    assert {:tag "predicatedEquality"} _b169 ==> p12$1 && p12$2 ==> v20$1 == v20$2;
    assert {:tag "predicatedEquality"} _b168 ==> p12$1 && p12$2 ==> v19$1 == v19$2;
    assert {:tag "predicatedEquality"} _b167 ==> p12$1 && p12$2 ==> v18$1 == v18$2;
    assert {:tag "predicatedEquality"} _b166 ==> p12$1 && p12$2 ==> v17$1 == v17$2;
    assert {:tag "predicatedEquality"} _b165 ==> p12$1 && p12$2 ==> v16$1 == v16$2;
    assert {:tag "predicatedEquality"} _b164 ==> p12$1 && p12$2 ==> v15$1 == v15$2;
    assert {:tag "predicatedEquality"} _b163 ==> p12$1 && p12$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b162 ==> p12$1 && p12$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b161 ==> p12$1 && p12$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b160 ==> p12$1 && p12$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b159 ==> p12$1 && p12$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b158 ==> p12$1 && p12$2 ==> $2$1 == $2$2;
    assert {:tag "predicatedEquality"} _b157 ==> p12$1 && p12$2 ==> $c3.0$1 == $c3.0$2;
    assert {:tag "predicatedEquality"} _b156 ==> p12$1 && p12$2 ==> $1$1 == $1$2;
    assert {:tag "predicatedEquality"} _b155 ==> p12$1 && p12$2 ==> $c1.0$1 == $c1.0$2;
    assert {:tag "predicatedEquality"} _b154 ==> p12$1 && p12$2 ==> $0$1 == $0$2;
    assert {:tag "predicatedEquality"} _b153 ==> p12$1 && p12$2 ==> $g9.0$1 == $g9.0$2;
    assert {:tag "loopPredicateEquality"} _b152 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p12$1 == p12$2;
    assert {:tag "loopPredicateEquality"} _b151 ==> p12$1 == p12$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p12$1 ==> p2$1;
    assert p12$2 ==> p2$2;
    assert p2$1 ==> p0$1;
    assert p2$2 ==> p0$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b27 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> BV32_SLT($g1.0$1, $ni) && BV32_SLT($g3.0$1, $nj);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b26 ==> _READ_HAS_OCCURRED_$$kernel0.shared_B ==> BV32_SLT($g1.0$1, $ni) && BV32_SLT($g3.0$1, $nj);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p12$1 ==> _b25 ==> p12$1 ==> BV32_SLT($g1.0$1, $ni) && BV32_SLT($g3.0$1, $nj);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p12$2 ==> _b25 ==> p12$2 ==> BV32_SLT($g1.0$2, $ni) && BV32_SLT($g3.0$2, $nj);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b24 ==> BV32_SLT($g1.0$1, $ni) && BV32_SLT($g3.0$1, $nj) && BV32_SGE($nk, 1bv32) ==> p12$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b24 ==> BV32_SLT($g1.0$2, $ni) && BV32_SLT($g3.0$2, $nj) && BV32_SGE($nk, 1bv32) ==> p12$2;
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b23 ==> BV32_UGE($g9.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b23 ==> BV32_UGE($g9.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b22 ==> BV32_ULE($g9.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b22 ==> BV32_ULE($g9.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b21 ==> BV32_SGE($g9.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b21 ==> BV32_SGE($g9.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p12$1 ==> _b20 ==> BV32_SLE($g9.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p12$2 ==> _b20 ==> BV32_SLE($g9.0$2, 0bv32);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p12$1 ==> _b19 ==> BV32_AND(BV32_SUB(32bv32, 1bv32), $g9.0$1) == BV32_AND(BV32_SUB(32bv32, 1bv32), 0bv32);
    assert {:tag "loopCounterIsStrided"} {:thread 2} p12$2 ==> _b19 ==> BV32_AND(BV32_SUB(32bv32, 1bv32), $g9.0$2) == BV32_AND(BV32_SUB(32bv32, 1bv32), 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 20} p12$1 ==> true;
    v10$1 := (if p12$1 then BV32_SGE($nk, 1bv32) else v10$1);
    v10$2 := (if p12$2 then BV32_SGE($nk, 1bv32) else v10$2);
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
    p14$1 := (if p12$1 && v10$1 then v10$1 else p14$1);
    p14$2 := (if p12$2 && v10$2 then v10$2 else p14$2);
    p13$1 := (if p12$1 && !v10$1 then !v10$1 else p13$1);
    p13$2 := (if p12$2 && !v10$2 then !v10$2 else p13$2);
    $0$1 := (if p13$1 then 0bv32 else $0$1);
    $0$2 := (if p13$2 then 0bv32 else $0$2);
    $0$1 := (if p14$1 then BV32_SUB($nk, 1bv32) else $0$1);
    $0$2 := (if p14$2 then BV32_SUB($nk, 1bv32) else $0$2);
    v11$1 := (if p12$1 then BV32_SLE($g9.0$1, $0$1) else v11$1);
    v11$2 := (if p12$2 then BV32_SLE($g9.0$2, $0$2) else v11$2);
    p15$1 := (if p12$1 && v11$1 then v11$1 else p15$1);
    p15$2 := (if p12$2 && v11$2 then v11$2 else p15$2);
    p12$1 := (if p12$1 && !v11$1 then v11$1 else p12$1);
    p12$2 := (if p12$2 && !v11$2 then v11$2 else p12$2);
    v12$1 := (if p15$1 then BV32_SGE($nk, BV32_ADD($g9.0$1, 1bv32)) else v12$1);
    v12$2 := (if p15$2 then BV32_SGE($nk, BV32_ADD($g9.0$2, 1bv32)) else v12$2);
    p17$1 := (if p15$1 && v12$1 then v12$1 else p17$1);
    p17$2 := (if p15$2 && v12$2 then v12$2 else p17$2);
    v13$1 := (if p17$1 then BV32_SGE($nk, BV32_ADD(BV32_ADD(v0$1, $g9.0$1), 1bv32)) else v13$1);
    v13$2 := (if p17$2 then BV32_SGE($nk, BV32_ADD(BV32_ADD(v0$2, $g9.0$2), 1bv32)) else v13$2);
    p19$1 := (if p17$1 && v13$1 then v13$1 else p19$1);
    p19$2 := (if p17$2 && v13$2 then v13$2 else p19$2);
    $c1.0$1 := (if p19$1 then v1$1 else $c1.0$1);
    $c1.0$2 := (if p19$2 then v1$2 else $c1.0$2);
    p20$1 := (if p19$1 then true else p20$1);
    p20$2 := (if p19$2 then true else p20$2);
    assume {:captureState "loop_entry_state_4_0"} true;
    goto $19;

  $19:
    assume {:captureState "loop_head_state_4"} true;
    assert {:tag "accessBreak"} _b187 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 32bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b186 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> BV32_AND(BV32_SUB(16bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(16bv32, 1bv32), BV32_ADD(local_id_y$1, BV32_MUL(local_id_x$1, 32bv32)));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p20$1 ==> p12$1;
    assert p20$2 ==> p12$2;
    assert p12$1 ==> p2$1;
    assert p12$2 ==> p2$2;
    assert p2$1 ==> p0$1;
    assert p2$2 ==> p0$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b48 ==> _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> BV32_SLT($g1.0$1, $ni) && BV32_SLT($g3.0$1, $nj) && BV32_SLE($g9.0$1, $0$1) && BV32_SGE($nk, BV32_ADD($g9.0$1, 1bv32)) && BV32_SGE($nk, BV32_ADD(BV32_ADD(local_id_x$1, $g9.0$1), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p20$1 ==> _b47 ==> p20$1 ==> BV32_SLT($g1.0$1, $ni) && BV32_SLT($g3.0$1, $nj) && BV32_SLE($g9.0$1, $0$1) && BV32_SGE($nk, BV32_ADD($g9.0$1, 1bv32)) && BV32_SGE($nk, BV32_ADD(BV32_ADD(local_id_x$1, $g9.0$1), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p20$2 ==> _b47 ==> p20$2 ==> BV32_SLT($g1.0$2, $ni) && BV32_SLT($g3.0$2, $nj) && BV32_SLE($g9.0$2, $0$2) && BV32_SGE($nk, BV32_ADD($g9.0$2, 1bv32)) && BV32_SGE($nk, BV32_ADD(BV32_ADD(local_id_x$2, $g9.0$2), 1bv32));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b46 ==> BV32_SLT($g1.0$1, $ni) && BV32_SLT($g3.0$1, $nj) && BV32_SLE($g9.0$1, $0$1) && BV32_SGE($nk, BV32_ADD($g9.0$1, 1bv32)) && BV32_SGE($nk, BV32_ADD(BV32_ADD(local_id_x$1, $g9.0$1), 1bv32)) && BV32_SLT(31bv32, BV32_SUB(BV32_SUB($nj, $g3.0$1), 1bv32)) ==> p20$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b46 ==> BV32_SLT($g1.0$2, $ni) && BV32_SLT($g3.0$2, $nj) && BV32_SLE($g9.0$2, $0$2) && BV32_SGE($nk, BV32_ADD($g9.0$2, 1bv32)) && BV32_SGE($nk, BV32_ADD(BV32_ADD(local_id_x$2, $g9.0$2), 1bv32)) && BV32_SLT(31bv32, BV32_SUB(BV32_SUB($nj, $g3.0$2), 1bv32)) ==> p20$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b45 ==> !BV32_SGE($nk, BV32_ADD(BV32_ADD(v0$1, $g9.0$1), 1bv32)) ==> !_READ_HAS_OCCURRED_$$B;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b44 ==> !BV32_SGE($nk, BV32_ADD(BV32_ADD(v0$1, $g9.0$1), 1bv32)) ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_B;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b43 ==> !BV32_SGE($nk, BV32_ADD(BV32_ADD(v0$1, $g9.0$1), 1bv32)) ==> !p20$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b43 ==> !BV32_SGE($nk, BV32_ADD(BV32_ADD(v0$2, $g9.0$2), 1bv32)) ==> !p20$2;
    assert {:tag "loopBound"} {:thread 1} p20$1 ==> _b42 ==> BV32_UGE($c1.0$1, v1$1);
    assert {:tag "loopBound"} {:thread 2} p20$2 ==> _b42 ==> BV32_UGE($c1.0$2, v1$2);
    assert {:tag "loopBound"} {:thread 1} p20$1 ==> _b41 ==> BV32_ULE($c1.0$1, v1$1);
    assert {:tag "loopBound"} {:thread 2} p20$2 ==> _b41 ==> BV32_ULE($c1.0$2, v1$2);
    assert {:tag "loopBound"} {:thread 1} p20$1 ==> _b40 ==> BV32_SGE($c1.0$1, v1$1);
    assert {:tag "loopBound"} {:thread 2} p20$2 ==> _b40 ==> BV32_SGE($c1.0$2, v1$2);
    assert {:tag "loopBound"} {:thread 1} p20$1 ==> _b39 ==> BV32_SLE($c1.0$1, v1$1);
    assert {:tag "loopBound"} {:thread 2} p20$2 ==> _b39 ==> BV32_SLE($c1.0$2, v1$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p20$1 ==> _b38 ==> BV32_AND(BV32_SUB(16bv32, 1bv32), $c1.0$1) == BV32_AND(BV32_SUB(16bv32, 1bv32), local_id_y$1);
    assert {:tag "loopCounterIsStrided"} {:thread 2} p20$2 ==> _b38 ==> BV32_AND(BV32_SUB(16bv32, 1bv32), $c1.0$2) == BV32_AND(BV32_SUB(16bv32, 1bv32), local_id_y$2);
    assert {:block_sourceloc} {:sourceloc_num 27} p20$1 ==> true;
    v14$1 := (if p20$1 then BV32_SLT(31bv32, BV32_SUB(BV32_SUB($nj, $g3.0$1), 1bv32)) else v14$1);
    v14$2 := (if p20$2 then BV32_SLT(31bv32, BV32_SUB(BV32_SUB($nj, $g3.0$2), 1bv32)) else v14$2);
    p21$1 := false;
    p21$2 := false;
    p22$1 := false;
    p22$2 := false;
    p23$1 := false;
    p23$2 := false;
    p22$1 := (if p20$1 && v14$1 then v14$1 else p22$1);
    p22$2 := (if p20$2 && v14$2 then v14$2 else p22$2);
    p21$1 := (if p20$1 && !v14$1 then !v14$1 else p21$1);
    p21$2 := (if p20$2 && !v14$2 then !v14$2 else p21$2);
    $1$1 := (if p21$1 then BV32_SUB(BV32_SUB($nj, $g3.0$1), 1bv32) else $1$1);
    $1$2 := (if p21$2 then BV32_SUB(BV32_SUB($nj, $g3.0$2), 1bv32) else $1$2);
    $1$1 := (if p22$1 then 31bv32 else $1$1);
    $1$2 := (if p22$2 then 31bv32 else $1$2);
    v15$1 := (if p20$1 then BV32_SLE($c1.0$1, $1$1) else v15$1);
    v15$2 := (if p20$2 then BV32_SLE($c1.0$2, $1$2) else v15$2);
    p23$1 := (if p20$1 && v15$1 then v15$1 else p23$1);
    p23$2 := (if p20$2 && v15$2 then v15$2 else p23$2);
    p20$1 := (if p20$1 && !v15$1 then v15$1 else p20$1);
    p20$2 := (if p20$2 && !v15$2 then v15$2 else p20$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v16$1 := (if p23$1 then _HAVOC_bv64$1 else v16$1);
    v16$2 := (if p23$2 then _HAVOC_bv64$2 else v16$2);
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$kernel0.shared_B(p23$1, BV32_ADD(BV32_MUL(v0$1, 32bv32), $c1.0$1), v16$1, $$kernel0.shared_B[1bv1][BV32_ADD(BV32_MUL(v0$1, 32bv32), $c1.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_B(p23$2, BV32_ADD(BV32_MUL(v0$2, 32bv32), $c1.0$2));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$kernel0.shared_B(p23$2, BV32_ADD(BV32_MUL(v0$2, 32bv32), $c1.0$2), v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$kernel0.shared_B"} true;
    $$kernel0.shared_B[1bv1][BV32_ADD(BV32_MUL(v0$1, 32bv32), $c1.0$1)] := (if p23$1 then v16$1 else $$kernel0.shared_B[1bv1][BV32_ADD(BV32_MUL(v0$1, 32bv32), $c1.0$1)]);
    $$kernel0.shared_B[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 32bv32), $c1.0$2)] := (if p23$2 then v16$2 else $$kernel0.shared_B[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 32bv32), $c1.0$2)]);
    $c1.0$1 := (if p23$1 then BV32_ADD($c1.0$1, 16bv32) else $c1.0$1);
    $c1.0$2 := (if p23$2 then BV32_ADD($c1.0$2, 16bv32) else $c1.0$2);
    p20$1 := (if p23$1 then true else p20$1);
    p20$2 := (if p23$2 then true else p20$2);
    goto $19.backedge, __partitioned_block_$19.tail_0;

  __partitioned_block_$19.tail_0:
    assume !p20$1 && !p20$2;
    goto __partitioned_block_$19.tail_1;

  __partitioned_block_$19.tail_1:
    call {:sourceloc_num 38} $bugle_barrier_duplicated_1(1bv1, 1bv1, p15$1, p15$2);
    v17$1 := (if p15$1 then $g9.0$1 == 0bv32 else v17$1);
    v17$2 := (if p15$2 then $g9.0$2 == 0bv32 else v17$2);
    p25$1 := (if p15$1 && v17$1 then v17$1 else p25$1);
    p25$2 := (if p15$2 && v17$2 then v17$2 else p25$2);
    v18$1 := (if p25$1 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v18$1);
    v18$2 := (if p25$2 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v18$2);
    p27$1 := (if p25$1 && v18$1 then v18$1 else p27$1);
    p27$2 := (if p25$2 && v18$2 then v18$2 else p27$2);
    v19$1 := (if p27$1 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 1bv32)) else v19$1);
    v19$2 := (if p27$2 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 1bv32)) else v19$2);
    p29$1 := (if p27$1 && v19$1 then v19$1 else p29$1);
    p29$2 := (if p27$2 && v19$2 then v19$2 else p29$2);
    $$private_tmp$0bv32$1 := (if p29$1 then 0bv64 else $$private_tmp$0bv32$1);
    $$private_tmp$0bv32$2 := (if p29$2 then 0bv64 else $$private_tmp$0bv32$2);
    v20$1 := (if p29$1 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 17bv32)) else v20$1);
    v20$2 := (if p29$2 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 17bv32)) else v20$2);
    p31$1 := (if p29$1 && v20$1 then v20$1 else p31$1);
    p31$2 := (if p29$2 && v20$2 then v20$2 else p31$2);
    $$private_tmp$1bv32$1 := (if p31$1 then 0bv64 else $$private_tmp$1bv32$1);
    $$private_tmp$1bv32$2 := (if p31$2 then 0bv64 else $$private_tmp$1bv32$2);
    v21$1 := (if p15$1 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v21$1);
    v21$2 := (if p15$2 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v21$2);
    p33$1 := (if p15$1 && v21$1 then v21$1 else p33$1);
    p33$2 := (if p15$2 && v21$2 then v21$2 else p33$2);
    v22$1 := (if p33$1 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 1bv32)) else v22$1);
    v22$2 := (if p33$2 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 1bv32)) else v22$2);
    p35$1 := (if p33$1 && v22$1 then v22$1 else p35$1);
    p35$2 := (if p33$2 && v22$2 then v22$2 else p35$2);
    $c3.0$1 := (if p35$1 then 0bv32 else $c3.0$1);
    $c3.0$2 := (if p35$2 then 0bv32 else $c3.0$2);
    p36$1 := (if p35$1 then true else p36$1);
    p36$2 := (if p35$2 then true else p36$2);
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $36;

  $36:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b188 ==> _READ_HAS_OCCURRED_$$kernel0.shared_B ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 32bv32), local_id_y$1)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 32bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 32bv32), BV32_ADD(local_id_y$1, 16bv32)));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$kernel0.shared_B ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p36$1 ==> p12$1;
    assert p36$2 ==> p12$2;
    assert p12$1 ==> p2$1;
    assert p12$2 ==> p2$2;
    assert p2$1 ==> p0$1;
    assert p2$2 ==> p0$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b37 ==> _READ_HAS_OCCURRED_$$kernel0.shared_B ==> BV32_SLT($g1.0$1, $ni) && BV32_SLT($g3.0$1, $nj) && BV32_SLE($g9.0$1, $0$1) && BV32_SGE($ni, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32)) && BV32_SGE($nj, BV32_ADD(BV32_ADD(local_id_y$1, $g3.0$1), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p36$1 ==> _b36 ==> p36$1 ==> BV32_SLT($g1.0$1, $ni) && BV32_SLT($g3.0$1, $nj) && BV32_SLE($g9.0$1, $0$1) && BV32_SGE($ni, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32)) && BV32_SGE($nj, BV32_ADD(BV32_ADD(local_id_y$1, $g3.0$1), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p36$2 ==> _b36 ==> p36$2 ==> BV32_SLT($g1.0$2, $ni) && BV32_SLT($g3.0$2, $nj) && BV32_SLE($g9.0$2, $0$2) && BV32_SGE($ni, BV32_ADD(BV32_ADD(local_id_x$2, $g1.0$2), 1bv32)) && BV32_SGE($nj, BV32_ADD(BV32_ADD(local_id_y$2, $g3.0$2), 1bv32));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b35 ==> BV32_SLT($g1.0$1, $ni) && BV32_SLT($g3.0$1, $nj) && BV32_SLE($g9.0$1, $0$1) && BV32_SGE($ni, BV32_ADD(BV32_ADD(local_id_x$1, $g1.0$1), 1bv32)) && BV32_SGE($nj, BV32_ADD(BV32_ADD(local_id_y$1, $g3.0$1), 1bv32)) && BV32_SLT(31bv32, BV32_SUB(BV32_SUB($nk, $g9.0$1), 1bv32)) ==> p36$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b35 ==> BV32_SLT($g1.0$2, $ni) && BV32_SLT($g3.0$2, $nj) && BV32_SLE($g9.0$2, $0$2) && BV32_SGE($ni, BV32_ADD(BV32_ADD(local_id_x$2, $g1.0$2), 1bv32)) && BV32_SGE($nj, BV32_ADD(BV32_ADD(local_id_y$2, $g3.0$2), 1bv32)) && BV32_SLT(31bv32, BV32_SUB(BV32_SUB($nk, $g9.0$2), 1bv32)) ==> p36$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b34 ==> !BV32_SGE($ni, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) || !BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 1bv32)) ==> !_READ_HAS_OCCURRED_$$kernel0.shared_B;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b33 ==> !BV32_SGE($ni, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) || !BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 1bv32)) ==> !_READ_HAS_OCCURRED_$$A;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b32 ==> !BV32_SGE($ni, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) || !BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 1bv32)) ==> !p36$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b32 ==> !BV32_SGE($ni, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) || !BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 1bv32)) ==> !p36$2;
    assert {:tag "loopBound"} {:thread 1} p36$1 ==> _b31 ==> BV32_UGE($c3.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p36$2 ==> _b31 ==> BV32_UGE($c3.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p36$1 ==> _b30 ==> BV32_ULE($c3.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p36$2 ==> _b30 ==> BV32_ULE($c3.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p36$1 ==> _b29 ==> BV32_SGE($c3.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p36$2 ==> _b29 ==> BV32_SGE($c3.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p36$1 ==> _b28 ==> BV32_SLE($c3.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p36$2 ==> _b28 ==> BV32_SLE($c3.0$2, 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 49} p36$1 ==> true;
    v23$1 := (if p36$1 then BV32_SLT(31bv32, BV32_SUB(BV32_SUB($nk, $g9.0$1), 1bv32)) else v23$1);
    v23$2 := (if p36$2 then BV32_SLT(31bv32, BV32_SUB(BV32_SUB($nk, $g9.0$2), 1bv32)) else v23$2);
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
    p38$1 := (if p36$1 && v23$1 then v23$1 else p38$1);
    p38$2 := (if p36$2 && v23$2 then v23$2 else p38$2);
    p37$1 := (if p36$1 && !v23$1 then !v23$1 else p37$1);
    p37$2 := (if p36$2 && !v23$2 then !v23$2 else p37$2);
    $2$1 := (if p37$1 then BV32_SUB(BV32_SUB($nk, $g9.0$1), 1bv32) else $2$1);
    $2$2 := (if p37$2 then BV32_SUB(BV32_SUB($nk, $g9.0$2), 1bv32) else $2$2);
    $2$1 := (if p38$1 then 31bv32 else $2$1);
    $2$2 := (if p38$2 then 31bv32 else $2$2);
    v24$1 := (if p36$1 then BV32_SLE($c3.0$1, $2$1) else v24$1);
    v24$2 := (if p36$2 then BV32_SLE($c3.0$2, $2$2) else v24$2);
    p39$1 := (if p36$1 && v24$1 then v24$1 else p39$1);
    p39$2 := (if p36$2 && v24$2 then v24$2 else p39$2);
    p36$1 := (if p36$1 && !v24$1 then v24$1 else p36$1);
    p36$2 := (if p36$2 && !v24$2 then v24$2 else p36$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v25$1 := (if p39$1 then _HAVOC_bv64$1 else v25$1);
    v25$2 := (if p39$2 then _HAVOC_bv64$2 else v25$2);
    call {:sourceloc} {:sourceloc_num 55} _LOG_READ_$$kernel0.shared_B(p39$1, BV32_ADD(BV32_MUL($c3.0$1, 32bv32), v1$1), $$kernel0.shared_B[1bv1][BV32_ADD(BV32_MUL($c3.0$1, 32bv32), v1$1)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 55} _CHECK_READ_$$kernel0.shared_B(p39$2, BV32_ADD(BV32_MUL($c3.0$2, 32bv32), v1$2), $$kernel0.shared_B[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($c3.0$2, 32bv32), v1$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel0.shared_B"} true;
    v26$1 := (if p39$1 then $$kernel0.shared_B[1bv1][BV32_ADD(BV32_MUL($c3.0$1, 32bv32), v1$1)] else v26$1);
    v26$2 := (if p39$2 then $$kernel0.shared_B[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($c3.0$2, 32bv32), v1$2)] else v26$2);
    v27$1 := (if p39$1 then $$private_tmp$0bv32$1 else v27$1);
    v27$2 := (if p39$2 then $$private_tmp$0bv32$2 else v27$2);
    $$private_tmp$0bv32$1 := (if p39$1 then FADD64(v27$1, FMUL64(FMUL64($alpha, v25$1), v26$1)) else $$private_tmp$0bv32$1);
    $$private_tmp$0bv32$2 := (if p39$2 then FADD64(v27$2, FMUL64(FMUL64($alpha, v25$2), v26$2)) else $$private_tmp$0bv32$2);
    v28$1 := (if p39$1 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 17bv32)) else v28$1);
    v28$2 := (if p39$2 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 17bv32)) else v28$2);
    p41$1 := (if p39$1 && v28$1 then v28$1 else p41$1);
    p41$2 := (if p39$2 && v28$2 then v28$2 else p41$2);
    havoc _HAVOC_bv64$1, _HAVOC_bv64$2;
    v29$1 := (if p41$1 then _HAVOC_bv64$1 else v29$1);
    v29$2 := (if p41$2 then _HAVOC_bv64$2 else v29$2);
    call {:sourceloc} {:sourceloc_num 60} _LOG_READ_$$kernel0.shared_B(p41$1, BV32_ADD(BV32_MUL($c3.0$1, 32bv32), BV32_ADD(v1$1, 16bv32)), $$kernel0.shared_B[1bv1][BV32_ADD(BV32_MUL($c3.0$1, 32bv32), BV32_ADD(v1$1, 16bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 60} _CHECK_READ_$$kernel0.shared_B(p41$2, BV32_ADD(BV32_MUL($c3.0$2, 32bv32), BV32_ADD(v1$2, 16bv32)), $$kernel0.shared_B[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($c3.0$2, 32bv32), BV32_ADD(v1$2, 16bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$kernel0.shared_B"} true;
    v30$1 := (if p41$1 then $$kernel0.shared_B[1bv1][BV32_ADD(BV32_MUL($c3.0$1, 32bv32), BV32_ADD(v1$1, 16bv32))] else v30$1);
    v30$2 := (if p41$2 then $$kernel0.shared_B[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($c3.0$2, 32bv32), BV32_ADD(v1$2, 16bv32))] else v30$2);
    v31$1 := (if p41$1 then $$private_tmp$1bv32$1 else v31$1);
    v31$2 := (if p41$2 then $$private_tmp$1bv32$2 else v31$2);
    $$private_tmp$1bv32$1 := (if p41$1 then FADD64(v31$1, FMUL64(FMUL64($alpha, v29$1), v30$1)) else $$private_tmp$1bv32$1);
    $$private_tmp$1bv32$2 := (if p41$2 then FADD64(v31$2, FMUL64(FMUL64($alpha, v29$2), v30$2)) else $$private_tmp$1bv32$2);
    $c3.0$1 := (if p39$1 then BV32_ADD($c3.0$1, 1bv32) else $c3.0$1);
    $c3.0$2 := (if p39$2 then BV32_ADD($c3.0$2, 1bv32) else $c3.0$2);
    p36$1 := (if p39$1 then true else p36$1);
    p36$2 := (if p39$2 then true else p36$2);
    goto $36.backedge, __partitioned_block_$36.tail_0;

  __partitioned_block_$36.tail_0:
    assume !p36$1 && !p36$2;
    goto __partitioned_block_$36.tail_1;

  __partitioned_block_$36.tail_1:
    call {:sourceloc_num 67} $bugle_barrier_duplicated_2(1bv1, 1bv1, p15$1, p15$2);
    $g9.0$1 := (if p15$1 then BV32_ADD($g9.0$1, 32bv32) else $g9.0$1);
    $g9.0$2 := (if p15$2 then BV32_ADD($g9.0$2, 32bv32) else $g9.0$2);
    p12$1 := (if p15$1 then true else p12$1);
    p12$2 := (if p15$2 then true else p12$2);
    goto $12.backedge, __partitioned_block_$12.tail_0;

  __partitioned_block_$12.tail_0:
    assume !p12$1 && !p12$2;
    v32$1 := (if p3$1 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 1bv32)) else v32$1);
    v32$2 := (if p3$2 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 1bv32)) else v32$2);
    p43$1 := (if p3$1 && v32$1 then v32$1 else p43$1);
    p43$2 := (if p3$2 && v32$2 then v32$2 else p43$2);
    v33$1 := (if p43$1 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v0$1, $g1.0$1), 1bv32)) else v33$1);
    v33$2 := (if p43$2 then BV32_SGE($ni, BV32_ADD(BV32_ADD(v0$2, $g1.0$2), 1bv32)) else v33$2);
    p45$1 := (if p43$1 && v33$1 then v33$1 else p45$1);
    p45$2 := (if p43$2 && v33$2 then v33$2 else p45$2);
    v34$1 := (if p45$1 then $$private_tmp$0bv32$1 else v34$1);
    v34$2 := (if p45$2 then $$private_tmp$0bv32$2 else v34$2);
    call {:sourceloc} {:sourceloc_num 73} _LOG_WRITE_$$tmp(p45$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $nj), BV32_ADD(v1$1, $g3.0$1)), v34$1, $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $nj), BV32_ADD(v1$1, $g3.0$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$tmp(p45$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $nj), BV32_ADD(v1$2, $g3.0$2)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 73} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 73} _CHECK_WRITE_$$tmp(p45$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $nj), BV32_ADD(v1$2, $g3.0$2)), v34$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$tmp"} true;
    $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $nj), BV32_ADD(v1$1, $g3.0$1))] := (if p45$1 then v34$1 else $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $nj), BV32_ADD(v1$1, $g3.0$1))]);
    $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $nj), BV32_ADD(v1$2, $g3.0$2))] := (if p45$2 then v34$2 else $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $nj), BV32_ADD(v1$2, $g3.0$2))]);
    v35$1 := (if p45$1 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 17bv32)) else v35$1);
    v35$2 := (if p45$2 then BV32_SGE($nj, BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 17bv32)) else v35$2);
    p47$1 := (if p45$1 && v35$1 then v35$1 else p47$1);
    p47$2 := (if p45$2 && v35$2 then v35$2 else p47$2);
    v36$1 := (if p47$1 then $$private_tmp$1bv32$1 else v36$1);
    v36$2 := (if p47$2 then $$private_tmp$1bv32$2 else v36$2);
    call {:sourceloc} {:sourceloc_num 76} _LOG_WRITE_$$tmp(p47$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $nj), BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 16bv32)), v36$1, $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $nj), BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 16bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$tmp(p47$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $nj), BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 16bv32)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 76} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 76} _CHECK_WRITE_$$tmp(p47$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $nj), BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 16bv32)), v36$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$tmp"} true;
    $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $nj), BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 16bv32))] := (if p47$1 then v36$1 else $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, $g1.0$1), $nj), BV32_ADD(BV32_ADD(v1$1, $g3.0$1), 16bv32))]);
    $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $nj), BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 16bv32))] := (if p47$2 then v36$2 else $$tmp[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, $g1.0$2), $nj), BV32_ADD(BV32_ADD(v1$2, $g3.0$2), 16bv32))]);
    goto __partitioned_block_$12.tail_1;

  __partitioned_block_$12.tail_1:
    call {:sourceloc_num 79} $bugle_barrier_duplicated_0(1bv1, 1bv1, p3$1, p3$2);
    $g3.0$1 := (if p3$1 then BV32_ADD($g3.0$1, 8192bv32) else $g3.0$1);
    $g3.0$2 := (if p3$2 then BV32_ADD($g3.0$2, 8192bv32) else $g3.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, $3.tail;

  $3.tail:
    assume !p2$1 && !p2$2;
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

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $3;

  $12.backedge:
    assume {:backedge} p12$1 || p12$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $12;

  $36.backedge:
    assume {:backedge} p36$1 || p36$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $36;

  $19.backedge:
    assume {:backedge} p20$1 || p20$2;
    assume {:captureState "loop_back_edge_state_4_0"} true;
    goto $19;
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
  modifies $$kernel0.shared_B, $$tmp, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel0.shared_B, $$tmp, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  modifies $$kernel0.shared_B, $$tmp, _TRACKING;



var $$private_tmp$0bv32$1: bv64;

var $$private_tmp$0bv32$2: bv64;

var $$private_tmp$1bv32$1: bv64;

var $$private_tmp$1bv32$2: bv64;

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

const {:existential true} _b42: bool;

const {:existential true} _b43: bool;

const {:existential true} _b44: bool;

const {:existential true} _b45: bool;

const {:existential true} _b46: bool;

const {:existential true} _b47: bool;

const {:existential true} _b48: bool;

const _WATCHED_VALUE_$$tmp: bv64;

procedure {:inline 1} _LOG_READ_$$tmp(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$tmp;



implementation {:inline 1} _LOG_READ_$$tmp(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$tmp := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tmp == _value then true else _READ_HAS_OCCURRED_$$tmp);
    return;
}



procedure _CHECK_READ_$$tmp(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "tmp"} {:array "$$tmp"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$tmp && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$tmp);
  requires {:source_name "tmp"} {:array "$$tmp"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$tmp && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$tmp: bool;

procedure {:inline 1} _LOG_WRITE_$$tmp(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$tmp, _WRITE_READ_BENIGN_FLAG_$$tmp;



implementation {:inline 1} _LOG_WRITE_$$tmp(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$tmp := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tmp == _value then true else _WRITE_HAS_OCCURRED_$$tmp);
    _WRITE_READ_BENIGN_FLAG_$$tmp := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tmp == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$tmp);
    return;
}



procedure _CHECK_WRITE_$$tmp(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "tmp"} {:array "$$tmp"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$tmp && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tmp != _value);
  requires {:source_name "tmp"} {:array "$$tmp"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$tmp && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$tmp != _value);
  requires {:source_name "tmp"} {:array "$$tmp"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$tmp && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$tmp(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$tmp;



implementation {:inline 1} _LOG_ATOMIC_$$tmp(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$tmp := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$tmp);
    return;
}



procedure _CHECK_ATOMIC_$$tmp(_P: bool, _offset: bv32);
  requires {:source_name "tmp"} {:array "$$tmp"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$tmp && _WATCHED_OFFSET == _offset);
  requires {:source_name "tmp"} {:array "$$tmp"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$tmp && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$tmp(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$tmp;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$tmp(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$tmp := (if _P && _WRITE_HAS_OCCURRED_$$tmp && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$tmp);
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



const _WATCHED_VALUE_$$kernel0.shared_B: bv64;

procedure {:inline 1} _LOG_READ_$$kernel0.shared_B(_P: bool, _offset: bv32, _value: bv64);
  modifies _READ_HAS_OCCURRED_$$kernel0.shared_B;



implementation {:inline 1} _LOG_READ_$$kernel0.shared_B(_P: bool, _offset: bv32, _value: bv64)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$kernel0.shared_B := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_B == _value then true else _READ_HAS_OCCURRED_$$kernel0.shared_B);
    return;
}



procedure _CHECK_READ_$$kernel0.shared_B(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_B"} {:array "$$kernel0.shared_B"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_B && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_B && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_B"} {:array "$$kernel0.shared_B"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel0.shared_B && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_B: bool;

procedure {:inline 1} _LOG_WRITE_$$kernel0.shared_B(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64);
  modifies _WRITE_HAS_OCCURRED_$$kernel0.shared_B, _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_B;



implementation {:inline 1} _LOG_WRITE_$$kernel0.shared_B(_P: bool, _offset: bv32, _value: bv64, _value_old: bv64)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$kernel0.shared_B := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_B == _value then true else _WRITE_HAS_OCCURRED_$$kernel0.shared_B);
    _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_B := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_B == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_B);
    return;
}



procedure _CHECK_WRITE_$$kernel0.shared_B(_P: bool, _offset: bv32, _value: bv64);
  requires {:source_name "shared_B"} {:array "$$kernel0.shared_B"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_B && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_B != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_B"} {:array "$$kernel0.shared_B"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$kernel0.shared_B && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$kernel0.shared_B != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_B"} {:array "$$kernel0.shared_B"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$kernel0.shared_B && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$kernel0.shared_B(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$kernel0.shared_B;



implementation {:inline 1} _LOG_ATOMIC_$$kernel0.shared_B(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$kernel0.shared_B := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$kernel0.shared_B);
    return;
}



procedure _CHECK_ATOMIC_$$kernel0.shared_B(_P: bool, _offset: bv32);
  requires {:source_name "shared_B"} {:array "$$kernel0.shared_B"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$kernel0.shared_B && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shared_B"} {:array "$$kernel0.shared_B"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$kernel0.shared_B && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_B(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_B;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$kernel0.shared_B(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_B := (if _P && _WRITE_HAS_OCCURRED_$$kernel0.shared_B && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$kernel0.shared_B);
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_B;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_B;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_B;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$tmp;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$tmp;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$tmp;
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
    havoc $$tmp;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel0.shared_B;
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_B;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_B;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_B;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$tmp;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$tmp;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$tmp;
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
    havoc $$tmp;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel0.shared_B;
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$kernel0.shared_B;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$kernel0.shared_B;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$kernel0.shared_B;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$tmp;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$tmp;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$tmp;
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
    havoc $$tmp;
    goto anon6;

  anon8_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$kernel0.shared_B;
    goto anon3;

  anon7_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

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

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b100: bool;

const {:existential true} _b101: bool;

const {:existential true} _b102: bool;

const {:existential true} _b103: bool;

const {:existential true} _b104: bool;

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

const {:existential true} _b156: bool;

const {:existential true} _b157: bool;

const {:existential true} _b158: bool;

const {:existential true} _b159: bool;

const {:existential true} _b160: bool;

const {:existential true} _b161: bool;

const {:existential true} _b162: bool;

const {:existential true} _b163: bool;

const {:existential true} _b164: bool;

const {:existential true} _b165: bool;

const {:existential true} _b166: bool;

const {:existential true} _b167: bool;

const {:existential true} _b168: bool;

const {:existential true} _b169: bool;

const {:existential true} _b170: bool;

const {:existential true} _b171: bool;

const {:existential true} _b172: bool;

const {:existential true} _b173: bool;

const {:existential true} _b174: bool;

const {:existential true} _b175: bool;

const {:existential true} _b176: bool;

const {:existential true} _b177: bool;

const {:existential true} _b178: bool;

const {:existential true} _b179: bool;

const {:existential true} _b180: bool;

const {:existential true} _b181: bool;

const {:existential true} _b182: bool;

const {:existential true} _b183: bool;

const {:existential true} _b184: bool;

const {:existential true} _b185: bool;

const {:existential true} _b186: bool;

const {:existential true} _b187: bool;

const {:existential true} _b188: bool;