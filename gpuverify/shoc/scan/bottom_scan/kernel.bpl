type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$in"} {:global} {:elem_width 32} {:source_name "in"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$in: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$in: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$in: bool;

axiom {:array_info "$$isums"} {:global} {:elem_width 32} {:source_name "isums"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$isums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$isums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$isums: bool;

var {:source_name "out"} {:global} $$out: [bv32]bv32;

axiom {:array_info "$$out"} {:global} {:elem_width 32} {:source_name "out"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$out: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$out: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$out: bool;

var {:source_name "lmem"} {:group_shared} $$lmem: [bv1][bv32]bv32;

axiom {:array_info "$$lmem"} {:group_shared} {:elem_width 32} {:source_name "lmem"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$lmem: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$lmem: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$lmem: bool;

var {:source_name "s_seed"} {:group_shared} $$bottom_scan.s_seed: [bv1][bv32]bv32;

axiom {:array_info "$$bottom_scan.s_seed"} {:group_shared} {:elem_width 32} {:source_name "s_seed"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$bottom_scan.s_seed: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$bottom_scan.s_seed: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$bottom_scan.s_seed: bool;

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

function FADD32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "bottom_scan"} {:kernel} $bottom_scan($n: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $n == 262144bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$in && !_WRITE_HAS_OCCURRED_$$in && !_ATOMIC_HAS_OCCURRED_$$in;
  requires !_READ_HAS_OCCURRED_$$isums && !_WRITE_HAS_OCCURRED_$$isums && !_ATOMIC_HAS_OCCURRED_$$isums;
  requires !_READ_HAS_OCCURRED_$$out && !_WRITE_HAS_OCCURRED_$$out && !_ATOMIC_HAS_OCCURRED_$$out;
  requires !_READ_HAS_OCCURRED_$$lmem && !_WRITE_HAS_OCCURRED_$$lmem && !_ATOMIC_HAS_OCCURRED_$$lmem;
  requires !_READ_HAS_OCCURRED_$$bottom_scan.s_seed && !_WRITE_HAS_OCCURRED_$$bottom_scan.s_seed && !_ATOMIC_HAS_OCCURRED_$$bottom_scan.s_seed;
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
  modifies $$lmem, $$bottom_scan.s_seed, _WRITE_HAS_OCCURRED_$$lmem, _WRITE_READ_BENIGN_FLAG_$$lmem, _WRITE_READ_BENIGN_FLAG_$$lmem, $$out, _TRACKING, _READ_HAS_OCCURRED_$$lmem, _TRACKING, _TRACKING, _WRITE_HAS_OCCURRED_$$out, _WRITE_READ_BENIGN_FLAG_$$out, _WRITE_READ_BENIGN_FLAG_$$out, _WRITE_HAS_OCCURRED_$$bottom_scan.s_seed, _WRITE_READ_BENIGN_FLAG_$$bottom_scan.s_seed, _WRITE_READ_BENIGN_FLAG_$$bottom_scan.s_seed, _TRACKING, _READ_HAS_OCCURRED_$$bottom_scan.s_seed;



implementation {:source_name "bottom_scan"} {:kernel} $bottom_scan($n: bv32)
{
  var $0$1: bv32;
  var $0$2: bv32;
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $window.0$1: bv32;
  var $window.0$2: bv32;
  var $seed.0$1: bv32;
  var $seed.0$2: bv32;
  var $val_4.0$1: bv128;
  var $val_4.0$2: bv128;
  var $val_4.1$1: bv128;
  var $val_4.1$2: bv128;
  var $i.i.0$1: bv32;
  var $i.i.0$2: bv32;
  var v1: bv32;
  var v0: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bool;
  var v3$2: bool;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv128;
  var v5$2: bv128;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bool;
  var v19$2: bool;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27$1: bool;
  var v27$2: bool;
  var v28$1: bool;
  var v28$2: bool;
  var v29$1: bv32;
  var v29$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0 := BV32_SDIV($n, 4bv32);
    v1 := BV32_UDIV(v0, num_groups_x);
    v2$1 := BV32_MUL(group_id_x$1, v1);
    v2$2 := BV32_MUL(group_id_x$2, v1);
    v3$1 := group_id_x$1 == BV32_SUB(num_groups_x, 1bv32);
    v3$2 := group_id_x$2 == BV32_SUB(num_groups_x, 1bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p0$1 := (if v3$1 then v3$1 else p0$1);
    p0$2 := (if v3$2 then v3$2 else p0$2);
    p1$1 := (if !v3$1 then !v3$1 else p1$1);
    p1$2 := (if !v3$2 then !v3$2 else p1$2);
    $0$1 := (if p0$1 then v0 else $0$1);
    $0$2 := (if p0$2 then v0 else $0$2);
    $0$1 := (if p1$1 then BV32_ADD(v2$1, v1) else $0$1);
    $0$2 := (if p1$2 then BV32_ADD(v2$2, v1) else $0$2);
    havoc v4$1, v4$2;
    havoc v5$1, v5$2;
    $i.0$1, $window.0$1, $seed.0$1, $val_4.0$1 := BV32_ADD(v2$1, local_id_x$1), v2$1, v4$1, v5$1;
    $i.0$2, $window.0$2, $seed.0$2, $val_4.0$2 := BV32_ADD(v2$2, local_id_x$2), v2$2, v4$2, v5$2;
    p2$1 := true;
    p2$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto __partitioned_block_$4_0;

  __partitioned_block_$4_0:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b67 ==> _WRITE_HAS_OCCURRED_$$bottom_scan.s_seed ==> _WATCHED_OFFSET == 0bv32;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b66 ==> _READ_HAS_OCCURRED_$$bottom_scan.s_seed ==> _WATCHED_OFFSET == 0bv32;
    assert {:tag "nowrite"} _b65 ==> !_WRITE_HAS_OCCURRED_$$bottom_scan.s_seed;
    assert {:tag "noread"} _b64 ==> !_READ_HAS_OCCURRED_$$bottom_scan.s_seed;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b63 ==> _WRITE_HAS_OCCURRED_$$lmem ==> _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == BV32_ADD(local_id_x$1, group_size_x) || _WATCHED_OFFSET == BV32_ADD(local_id_x$1, group_size_x);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b62 ==> _READ_HAS_OCCURRED_$$lmem ==> _WATCHED_OFFSET == BV32_SUB(BV32_ADD(local_id_x$1, group_size_x), 1bv32) || _WATCHED_OFFSET == BV32_ADD(local_id_x$1, group_size_x);
    assert {:tag "nowrite"} _b61 ==> !_WRITE_HAS_OCCURRED_$$lmem;
    assert {:tag "noread"} _b60 ==> !_READ_HAS_OCCURRED_$$lmem;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b59 ==> _WRITE_HAS_OCCURRED_$$out ==> BV32_AND(BV32_SUB(BV32_MUL(group_size_x, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, 4bv32), 1bv32), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, BV32_UDIV(BV32_SDIV($n, 4bv32), num_groups_x)), local_id_x$1), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(group_size_x, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, BV32_UDIV(BV32_SDIV($n, 4bv32), num_groups_x)), local_id_x$1), 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(group_size_x, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, BV32_UDIV(BV32_SDIV($n, 4bv32), num_groups_x)), local_id_x$1), 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(group_size_x, 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(group_size_x, 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, BV32_UDIV(BV32_SDIV($n, 4bv32), num_groups_x)), local_id_x$1), 4bv32), 3bv32));
    assert {:tag "nowrite"} _b58 ==> !_WRITE_HAS_OCCURRED_$$out;
    assert {:tag "predicatedEquality"} _b57 ==> p2$1 && p2$2 ==> v29$1 == v29$2;
    assert {:tag "predicatedEquality"} _b56 ==> p2$1 && p2$2 ==> v28$1 == v28$2;
    assert {:tag "predicatedEquality"} _b55 ==> p2$1 && p2$2 ==> v27$1 == v27$2;
    assert {:tag "predicatedEquality"} _b54 ==> p2$1 && p2$2 ==> v26$1 == v26$2;
    assert {:tag "predicatedEquality"} _b53 ==> p2$1 && p2$2 ==> v23$1 == v23$2;
    assert {:tag "predicatedEquality"} _b52 ==> p2$1 && p2$2 ==> v22$1 == v22$2;
    assert {:tag "predicatedEquality"} _b51 ==> p2$1 && p2$2 ==> v21$1 == v21$2;
    assert {:tag "predicatedEquality"} _b50 ==> p2$1 && p2$2 ==> v20$1 == v20$2;
    assert {:tag "predicatedEquality"} _b49 ==> p2$1 && p2$2 ==> v19$1 == v19$2;
    assert {:tag "predicatedEquality"} _b48 ==> p2$1 && p2$2 ==> v18$1 == v18$2;
    assert {:tag "predicatedEquality"} _b47 ==> p2$1 && p2$2 ==> v17$1 == v17$2;
    assert {:tag "predicatedEquality"} _b46 ==> p2$1 && p2$2 ==> v16$1 == v16$2;
    assert {:tag "predicatedEquality"} _b45 ==> p2$1 && p2$2 ==> v14$1 == v14$2;
    assert {:tag "predicatedEquality"} _b44 ==> p2$1 && p2$2 ==> v15$1 == v15$2;
    assert {:tag "predicatedEquality"} _b43 ==> p2$1 && p2$2 ==> v13$1 == v13$2;
    assert {:tag "predicatedEquality"} _b42 ==> p2$1 && p2$2 ==> v12$1 == v12$2;
    assert {:tag "predicatedEquality"} _b41 ==> p2$1 && p2$2 ==> v11$1 == v11$2;
    assert {:tag "predicatedEquality"} _b40 ==> p2$1 && p2$2 ==> v10$1 == v10$2;
    assert {:tag "predicatedEquality"} _b39 ==> p2$1 && p2$2 ==> v9$1 == v9$2;
    assert {:tag "predicatedEquality"} _b38 ==> p2$1 && p2$2 ==> v8$1 == v8$2;
    assert {:tag "predicatedEquality"} _b37 ==> p2$1 && p2$2 ==> v7$1 == v7$2;
    assert {:tag "predicatedEquality"} _b36 ==> p2$1 && p2$2 ==> v6$1 == v6$2;
    assert {:tag "predicatedEquality"} _b35 ==> p2$1 && p2$2 ==> v25$1 == v25$2;
    assert {:tag "predicatedEquality"} _b34 ==> p2$1 && p2$2 ==> v24$1 == v24$2;
    assert {:tag "predicatedEquality"} _b33 ==> p2$1 && p2$2 ==> $i.i.0$1 == $i.i.0$2;
    assert {:tag "predicatedEquality"} _b32 ==> p2$1 && p2$2 ==> $val_4.1$1 == $val_4.1$2;
    assert {:tag "predicatedEquality"} _b31 ==> p2$1 && p2$2 ==> $val_4.0$1 == $val_4.0$2;
    assert {:tag "predicatedEquality"} _b30 ==> p2$1 && p2$2 ==> $seed.0$1 == $seed.0$2;
    assert {:tag "predicatedEquality"} _b29 ==> p2$1 && p2$2 ==> $window.0$1 == $window.0$2;
    assert {:tag "predicatedEquality"} _b28 ==> p2$1 && p2$2 ==> $i.0$1 == $i.0$2;
    assert {:tag "loopPredicateEquality"} _b27 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p2$1 == p2$2;
    assert {:tag "loopPredicateEquality"} _b26 ==> p2$1 == p2$2;
    assert {:tag "pow2NotZero"} _b25 ==> $i.i.0$2 != 0bv32;
    assert {:tag "pow2"} _b24 ==> $i.i.0$2 == 0bv32 || BV32_AND($i.i.0$2, BV32_SUB($i.i.0$2, 1bv32)) == 0bv32;
    assert {:tag "pow2NotZero"} _b23 ==> $i.i.0$1 != 0bv32;
    assert {:tag "pow2"} _b22 ==> $i.i.0$1 == 0bv32 || BV32_AND($i.i.0$1, BV32_SUB($i.i.0$1, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$bottom_scan.s_seed ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$bottom_scan.s_seed ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$bottom_scan.s_seed ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$lmem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$lmem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$lmem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b12 ==> BV32_SLT($window.0$1, $0$1) ==> p2$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b12 ==> BV32_SLT($window.0$2, $0$2) ==> p2$2;
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b11 ==> BV32_UGE($i.0$1, BV32_ADD(v2$1, local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b11 ==> BV32_UGE($i.0$2, BV32_ADD(v2$2, local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b10 ==> BV32_ULE($i.0$1, BV32_ADD(v2$1, local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b10 ==> BV32_ULE($i.0$2, BV32_ADD(v2$2, local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b9 ==> BV32_SGE($i.0$1, BV32_ADD(v2$1, local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b9 ==> BV32_SGE($i.0$2, BV32_ADD(v2$2, local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b8 ==> BV32_SLE($i.0$1, BV32_ADD(v2$1, local_id_x$1));
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b8 ==> BV32_SLE($i.0$2, BV32_ADD(v2$2, local_id_x$2));
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b7 ==> BV32_UGE($window.0$1, v2$1);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b7 ==> BV32_UGE($window.0$2, v2$2);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b6 ==> BV32_ULE($window.0$1, v2$1);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b6 ==> BV32_ULE($window.0$2, v2$2);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b5 ==> BV32_SGE($window.0$1, v2$1);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b5 ==> BV32_SGE($window.0$2, v2$2);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b4 ==> BV32_SLE($window.0$1, v2$1);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b4 ==> BV32_SLE($window.0$2, v2$2);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p2$1 ==> _b3 ==> BV32_SUB($window.0$1, v2$1) == BV32_SUB($window.0$2, v2$2);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p2$2 ==> _b3 ==> BV32_SUB($window.0$2, v2$2) == BV32_SUB($window.0$1, v2$1);
    assert {:tag "guardNonNeg"} {:thread 1} p2$1 ==> _b2 ==> BV32_SLE(0bv32, $window.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p2$2 ==> _b2 ==> BV32_SLE(0bv32, $window.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p2$1 ==> _b1 ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), $window.0$1) == BV32_AND(BV32_SUB(group_size_x, 1bv32), BV32_MUL(group_id_x$1, BV32_UDIV(BV32_SDIV($n, 4bv32), num_groups_x)));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p2$2 ==> _b1 ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), $window.0$2) == BV32_AND(BV32_SUB(group_size_x, 1bv32), BV32_MUL(group_id_x$2, BV32_UDIV(BV32_SDIV($n, 4bv32), num_groups_x)));
    assert {:tag "loopCounterIsStrided"} {:thread 1} p2$1 ==> _b0 ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), $i.0$1) == BV32_AND(BV32_SUB(group_size_x, 1bv32), BV32_ADD(BV32_MUL(group_id_x$1, BV32_UDIV(BV32_SDIV($n, 4bv32), num_groups_x)), local_id_x$1));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p2$2 ==> _b0 ==> BV32_AND(BV32_SUB(group_size_x, 1bv32), $i.0$2) == BV32_AND(BV32_SUB(group_size_x, 1bv32), BV32_ADD(BV32_MUL(group_id_x$2, BV32_UDIV(BV32_SDIV($n, 4bv32), num_groups_x)), local_id_x$2));
    assert {:block_sourceloc} {:sourceloc_num 6} p2$1 ==> true;
    v6$1 := (if p2$1 then BV32_SLT($window.0$1, $0$1) else v6$1);
    v6$2 := (if p2$2 then BV32_SLT($window.0$2, $0$2) else v6$2);
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p12$1 := false;
    p12$2 := false;
    p3$1 := (if p2$1 && v6$1 then v6$1 else p3$1);
    p3$2 := (if p2$2 && v6$2 then v6$2 else p3$2);
    p2$1 := (if p2$1 && !v6$1 then v6$1 else p2$1);
    p2$2 := (if p2$2 && !v6$2 then v6$2 else p2$2);
    v7$1 := (if p3$1 then BV32_SLT($i.0$1, $0$1) else v7$1);
    v7$2 := (if p3$2 then BV32_SLT($i.0$2, $0$2) else v7$2);
    p5$1 := (if p3$1 && v7$1 then v7$1 else p5$1);
    p5$2 := (if p3$2 && v7$2 then v7$2 else p5$2);
    p4$1 := (if p3$1 && !v7$1 then !v7$1 else p4$1);
    p4$2 := (if p3$2 && !v7$2 then !v7$2 else p4$2);
    $val_4.1$1 := (if p4$1 then 0bv128 else $val_4.1$1);
    $val_4.1$2 := (if p4$2 then 0bv128 else $val_4.1$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v8$1 := (if p5$1 then _HAVOC_bv32$1 else v8$1);
    v8$2 := (if p5$2 then _HAVOC_bv32$2 else v8$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v9$1 := (if p5$1 then _HAVOC_bv32$1 else v9$1);
    v9$2 := (if p5$2 then _HAVOC_bv32$2 else v9$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v10$1 := (if p5$1 then _HAVOC_bv32$1 else v10$1);
    v10$2 := (if p5$2 then _HAVOC_bv32$2 else v10$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v11$1 := (if p5$1 then _HAVOC_bv32$1 else v11$1);
    v11$2 := (if p5$2 then _HAVOC_bv32$2 else v11$2);
    $val_4.1$1 := (if p5$1 then v11$1 ++ v10$1 ++ v9$1 ++ v8$1 else $val_4.1$1);
    $val_4.1$2 := (if p5$2 then v11$2 ++ v10$2 ++ v9$2 ++ v8$2 else $val_4.1$2);
    v12$1 := (if p3$1 then FADD32($val_4.1$1[64:32], $val_4.1$1[32:0]) else v12$1);
    v12$2 := (if p3$2 then FADD32($val_4.1$2[64:32], $val_4.1$2[32:0]) else v12$2);
    v13$1 := (if p3$1 then $val_4.1$1[96:64] else v13$1);
    v13$2 := (if p3$2 then $val_4.1$2[96:64] else v13$2);
    v14$1 := (if p3$1 then FADD32(v13$1, v12$1) else v14$1);
    v14$2 := (if p3$2 then FADD32(v13$2, v12$2) else v14$2);
    v15$1 := (if p3$1 then $val_4.1$1[128:96] else v15$1);
    v15$2 := (if p3$2 then $val_4.1$2[128:96] else v15$2);
    v16$1 := (if p3$1 then FADD32(v15$1, v14$1) else v16$1);
    v16$2 := (if p3$2 then FADD32(v15$2, v14$2) else v16$2);
    v17$1 := (if p3$1 then local_id_x$1 else v17$1);
    v17$2 := (if p3$2 then local_id_x$2 else v17$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$lmem(p3$1, v17$1, 0bv32, $$lmem[1bv1][v17$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lmem(p3$2, v17$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$lmem(p3$2, v17$2, 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lmem"} true;
    $$lmem[1bv1][v17$1] := (if p3$1 then 0bv32 else $$lmem[1bv1][v17$1]);
    $$lmem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v17$2] := (if p3$2 then 0bv32 else $$lmem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v17$2]);
    v18$1 := (if p3$1 then BV32_ADD(v17$1, group_size_x) else v18$1);
    v18$2 := (if p3$2 then BV32_ADD(v17$2, group_size_x) else v18$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$lmem(p3$1, v18$1, v16$1, $$lmem[1bv1][v18$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lmem(p3$2, v18$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$lmem(p3$2, v18$2, v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lmem"} true;
    $$lmem[1bv1][v18$1] := (if p3$1 then v16$1 else $$lmem[1bv1][v18$1]);
    $$lmem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2] := (if p3$2 then v16$2 else $$lmem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2]);
    goto __partitioned_block_$4_1;

  __partitioned_block_$4_1:
    call {:sourceloc_num 17} $bugle_barrier_duplicated_0(1bv1, 0bv1, p3$1, p3$2);
    $i.i.0$1 := (if p3$1 then 1bv32 else $i.i.0$1);
    $i.i.0$2 := (if p3$2 then 1bv32 else $i.i.0$2);
    p6$1 := (if p3$1 then true else p6$1);
    p6$2 := (if p3$2 then true else p6$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto __partitioned_block_$9_0;

  __partitioned_block_$9_0:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b81 ==> _WRITE_HAS_OCCURRED_$$lmem ==> _WATCHED_OFFSET == BV32_ADD(local_id_x$1, group_size_x);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b80 ==> _READ_HAS_OCCURRED_$$lmem ==> _WATCHED_OFFSET == BV32_ADD(local_id_x$1, group_size_x);
    assert {:tag "nowrite"} _b79 ==> !_WRITE_HAS_OCCURRED_$$lmem;
    assert {:tag "noread"} _b78 ==> !_READ_HAS_OCCURRED_$$lmem;
    assert {:tag "predicatedEquality"} _b77 ==> p6$1 && p6$2 ==> v21$1 == v21$2;
    assert {:tag "predicatedEquality"} _b76 ==> p6$1 && p6$2 ==> v20$1 == v20$2;
    assert {:tag "predicatedEquality"} _b75 ==> p6$1 && p6$2 ==> v19$1 == v19$2;
    assert {:tag "predicatedEquality"} _b74 ==> p6$1 && p6$2 ==> $i.i.0$1 == $i.i.0$2;
    assert {:tag "loopPredicateEquality"} _b73 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> p6$1 == p6$2;
    assert {:tag "loopPredicateEquality"} _b72 ==> p6$1 == p6$2;
    assert {:tag "pow2NotZero"} _b71 ==> $i.i.0$2 != 0bv32;
    assert {:tag "pow2"} _b70 ==> $i.i.0$2 == 0bv32 || BV32_AND($i.i.0$2, BV32_SUB($i.i.0$2, 1bv32)) == 0bv32;
    assert {:tag "pow2NotZero"} _b69 ==> $i.i.0$1 != 0bv32;
    assert {:tag "pow2"} _b68 ==> $i.i.0$1 == 0bv32 || BV32_AND($i.i.0$1, BV32_SUB($i.i.0$1, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$bottom_scan.s_seed ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$bottom_scan.s_seed ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$bottom_scan.s_seed ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$lmem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$lmem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$lmem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p6$1 ==> p2$1;
    assert p6$2 ==> p2$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b21 ==> _WRITE_HAS_OCCURRED_$$lmem ==> BV32_SLT($window.0$1, $0$1);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b20 ==> _READ_HAS_OCCURRED_$$lmem ==> BV32_SLT($window.0$1, $0$1);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p6$1 ==> _b19 ==> p6$1 ==> BV32_SLT($window.0$1, $0$1);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p6$2 ==> _b19 ==> p6$2 ==> BV32_SLT($window.0$2, $0$2);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b18 ==> BV32_SLT($window.0$1, $0$1) && BV32_ULT($i.i.0$1, group_size_x) ==> p6$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b18 ==> BV32_SLT($window.0$2, $0$2) && BV32_ULT($i.i.0$2, group_size_x) ==> p6$2;
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b17 ==> BV32_UGE($i.i.0$1, 1bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b17 ==> BV32_UGE($i.i.0$2, 1bv32);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b16 ==> BV32_ULE($i.i.0$1, 1bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b16 ==> BV32_ULE($i.i.0$2, 1bv32);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b15 ==> BV32_SGE($i.i.0$1, 1bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b15 ==> BV32_SGE($i.i.0$2, 1bv32);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b14 ==> BV32_SLE($i.i.0$1, 1bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b14 ==> BV32_SLE($i.i.0$2, 1bv32);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 1} p6$1 ==> _b13 ==> BV32_SUB($i.i.0$1, 1bv32) == BV32_SUB($i.i.0$2, 1bv32);
    assert {:tag "guardMinusInitialIsUniform"} {:thread 2} p6$2 ==> _b13 ==> BV32_SUB($i.i.0$2, 1bv32) == BV32_SUB($i.i.0$1, 1bv32);
    assert {:block_sourceloc} {:sourceloc_num 18} p6$1 ==> true;
    v19$1 := (if p6$1 then BV32_ULT($i.i.0$1, group_size_x) else v19$1);
    v19$2 := (if p6$2 then BV32_ULT($i.i.0$2, group_size_x) else v19$2);
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
    p7$1 := (if p6$1 && v19$1 then v19$1 else p7$1);
    p7$2 := (if p6$2 && v19$2 then v19$2 else p7$2);
    p6$1 := (if p6$1 && !v19$1 then v19$1 else p6$1);
    p6$2 := (if p6$2 && !v19$2 then v19$2 else p6$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_READ_$$lmem(p7$1, BV32_SUB(v18$1, $i.i.0$1), $$lmem[1bv1][BV32_SUB(v18$1, $i.i.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 20} _CHECK_READ_$$lmem(p7$2, BV32_SUB(v18$2, $i.i.0$2), $$lmem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v18$2, $i.i.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$lmem"} true;
    v20$1 := (if p7$1 then $$lmem[1bv1][BV32_SUB(v18$1, $i.i.0$1)] else v20$1);
    v20$2 := (if p7$2 then $$lmem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v18$2, $i.i.0$2)] else v20$2);
    goto __partitioned_block_$9_1;

  __partitioned_block_$9_1:
    call {:sourceloc_num 21} $bugle_barrier_duplicated_2(1bv1, 0bv1, p7$1, p7$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$lmem(p7$1, v18$1, $$lmem[1bv1][v18$1]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$lmem(p7$2, v18$2, $$lmem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$lmem"} true;
    v21$1 := (if p7$1 then $$lmem[1bv1][v18$1] else v21$1);
    v21$2 := (if p7$2 then $$lmem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2] else v21$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$lmem(p7$1, v18$1, FADD32(v21$1, v20$1), $$lmem[1bv1][v18$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lmem(p7$2, v18$2);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$lmem(p7$2, v18$2, FADD32(v21$2, v20$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lmem"} true;
    $$lmem[1bv1][v18$1] := (if p7$1 then FADD32(v21$1, v20$1) else $$lmem[1bv1][v18$1]);
    $$lmem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2] := (if p7$2 then FADD32(v21$2, v20$2) else $$lmem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2]);
    goto __partitioned_block_$9_2;

  __partitioned_block_$9_2:
    call {:sourceloc_num 24} $bugle_barrier_duplicated_3(1bv1, 0bv1, p7$1, p7$2);
    $i.i.0$1 := (if p7$1 then BV32_MUL($i.i.0$1, 2bv32) else $i.i.0$1);
    $i.i.0$2 := (if p7$2 then BV32_MUL($i.i.0$2, 2bv32) else $i.i.0$2);
    p6$1 := (if p7$1 then true else p6$1);
    p6$2 := (if p7$2 then true else p6$2);
    goto $9.backedge, __partitioned_block_$9.tail_0;

  __partitioned_block_$9.tail_0:
    assume !p6$1 && !p6$2;
    call {:sourceloc} {:sourceloc_num 26} _LOG_READ_$$lmem(p3$1, BV32_SUB(v18$1, 1bv32), $$lmem[1bv1][BV32_SUB(v18$1, 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 26} _CHECK_READ_$$lmem(p3$2, BV32_SUB(v18$2, 1bv32), $$lmem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v18$2, 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$lmem"} true;
    v22$1 := (if p3$1 then $$lmem[1bv1][BV32_SUB(v18$1, 1bv32)] else v22$1);
    v22$2 := (if p3$2 then $$lmem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v18$2, 1bv32)] else v22$2);
    v23$1 := (if p3$1 then FADD32($val_4.1$1[32:0], FADD32(v22$1, $seed.0$1)) else v23$1);
    v23$2 := (if p3$2 then FADD32($val_4.1$2[32:0], FADD32(v22$2, $seed.0$2)) else v23$2);
    v24$1 := (if p3$1 then FADD32(v12$1, FADD32(v22$1, $seed.0$1)) else v24$1);
    v24$2 := (if p3$2 then FADD32(v12$2, FADD32(v22$2, $seed.0$2)) else v24$2);
    v25$1 := (if p3$1 then FADD32(v14$1, FADD32(v22$1, $seed.0$1)) else v25$1);
    v25$2 := (if p3$2 then FADD32(v14$2, FADD32(v22$2, $seed.0$2)) else v25$2);
    v26$1 := (if p3$1 then FADD32(v16$1, FADD32(v22$1, $seed.0$1)) else v26$1);
    v26$2 := (if p3$2 then FADD32(v16$2, FADD32(v22$2, $seed.0$2)) else v26$2);
    v27$1 := (if p3$1 then BV32_SLT($i.0$1, $0$1) else v27$1);
    v27$2 := (if p3$2 then BV32_SLT($i.0$2, $0$2) else v27$2);
    p9$1 := (if p3$1 && v27$1 then v27$1 else p9$1);
    p9$2 := (if p3$2 && v27$2 then v27$2 else p9$2);
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$out(p9$1, BV32_MUL($i.0$1, 4bv32), v23$1, $$out[BV32_MUL($i.0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(p9$2, BV32_MUL($i.0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$out(p9$2, BV32_MUL($i.0$2, 4bv32), v23$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_MUL($i.0$1, 4bv32)] := (if p9$1 then v23$1 else $$out[BV32_MUL($i.0$1, 4bv32)]);
    $$out[BV32_MUL($i.0$2, 4bv32)] := (if p9$2 then v23$2 else $$out[BV32_MUL($i.0$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$out(p9$1, BV32_ADD(BV32_MUL($i.0$1, 4bv32), 1bv32), v24$1, $$out[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(p9$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$out(p9$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 1bv32), v24$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 1bv32)] := (if p9$1 then v24$1 else $$out[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 1bv32)]);
    $$out[BV32_ADD(BV32_MUL($i.0$2, 4bv32), 1bv32)] := (if p9$2 then v24$2 else $$out[BV32_ADD(BV32_MUL($i.0$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$out(p9$1, BV32_ADD(BV32_MUL($i.0$1, 4bv32), 2bv32), v25$1, $$out[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(p9$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$out(p9$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 2bv32), v25$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 2bv32)] := (if p9$1 then v25$1 else $$out[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 2bv32)]);
    $$out[BV32_ADD(BV32_MUL($i.0$2, 4bv32), 2bv32)] := (if p9$2 then v25$2 else $$out[BV32_ADD(BV32_MUL($i.0$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$out(p9$1, BV32_ADD(BV32_MUL($i.0$1, 4bv32), 3bv32), v26$1, $$out[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(p9$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$out(p9$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 3bv32), v26$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$out"} true;
    $$out[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 3bv32)] := (if p9$1 then v26$1 else $$out[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 3bv32)]);
    $$out[BV32_ADD(BV32_MUL($i.0$2, 4bv32), 3bv32)] := (if p9$2 then v26$2 else $$out[BV32_ADD(BV32_MUL($i.0$2, 4bv32), 3bv32)]);
    v28$1 := (if p3$1 then local_id_x$1 == BV32_SUB(group_size_x, 1bv32) else v28$1);
    v28$2 := (if p3$2 then local_id_x$2 == BV32_SUB(group_size_x, 1bv32) else v28$2);
    p11$1 := (if p3$1 && v28$1 then v28$1 else p11$1);
    p11$2 := (if p3$2 && v28$2 then v28$2 else p11$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$bottom_scan.s_seed(p11$1, 0bv32, v26$1, $$bottom_scan.s_seed[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$bottom_scan.s_seed(p11$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$bottom_scan.s_seed(p11$2, 0bv32, v26$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$bottom_scan.s_seed"} true;
    $$bottom_scan.s_seed[1bv1][0bv32] := (if p11$1 then v26$1 else $$bottom_scan.s_seed[1bv1][0bv32]);
    $$bottom_scan.s_seed[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := (if p11$2 then v26$2 else $$bottom_scan.s_seed[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    goto __partitioned_block_$9.tail_1;

  __partitioned_block_$9.tail_1:
    call {:sourceloc_num 36} $bugle_barrier_duplicated_1(1bv1, 0bv1, p3$1, p3$2);
    call {:sourceloc} {:sourceloc_num 37} _LOG_READ_$$bottom_scan.s_seed(p3$1, 0bv32, $$bottom_scan.s_seed[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 37} _CHECK_READ_$$bottom_scan.s_seed(p3$2, 0bv32, $$bottom_scan.s_seed[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$bottom_scan.s_seed"} true;
    v29$1 := (if p3$1 then $$bottom_scan.s_seed[1bv1][0bv32] else v29$1);
    v29$2 := (if p3$2 then $$bottom_scan.s_seed[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v29$2);
    $i.0$1, $window.0$1, $seed.0$1, $val_4.0$1 := (if p3$1 then BV32_ADD($i.0$1, group_size_x) else $i.0$1), (if p3$1 then BV32_ADD($window.0$1, group_size_x) else $window.0$1), (if p3$1 then v29$1 else $seed.0$1), (if p3$1 then v26$1 ++ v25$1 ++ v24$1 ++ v23$1 else $val_4.0$1);
    $i.0$2, $window.0$2, $seed.0$2, $val_4.0$2 := (if p3$2 then BV32_ADD($i.0$2, group_size_x) else $i.0$2), (if p3$2 then BV32_ADD($window.0$2, group_size_x) else $window.0$2), (if p3$2 then v29$2 else $seed.0$2), (if p3$2 then v26$2 ++ v25$2 ++ v24$2 ++ v23$2 else $val_4.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $4.backedge, $4.tail;

  $4.tail:
    assume !p2$1 && !p2$2;
    return;

  $4.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto __partitioned_block_$4_0;

  $9.backedge:
    assume {:backedge} p6$1 || p6$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto __partitioned_block_$9_0;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

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
  requires _P$1 ==> $1 == 0bv1;
  requires _P$2 ==> $1 == 0bv1;
  modifies $$lmem, $$bottom_scan.s_seed, $$out, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 0bv1;
  requires _P$2 ==> $1 == 0bv1;
  modifies $$lmem, $$bottom_scan.s_seed, $$out, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 0bv1;
  requires _P$2 ==> $1 == 0bv1;
  modifies $$lmem, $$bottom_scan.s_seed, $$out, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_3($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 0bv1;
  requires _P$2 ==> $1 == 0bv1;
  modifies $$lmem, $$bottom_scan.s_seed, $$out, _TRACKING;



function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

const {:existential true} _b3: bool;

const {:existential true} _b4: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b5: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b6: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

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

const _WATCHED_VALUE_$$in: bv32;

procedure {:inline 1} _LOG_READ_$$in(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$in;



implementation {:inline 1} _LOG_READ_$$in(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in == _value then true else _READ_HAS_OCCURRED_$$in);
    return;
}



procedure _CHECK_READ_$$in(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "in"} {:array "$$in"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$in);
  requires {:source_name "in"} {:array "$$in"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$in: bool;

procedure {:inline 1} _LOG_WRITE_$$in(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$in, _WRITE_READ_BENIGN_FLAG_$$in;



implementation {:inline 1} _LOG_WRITE_$$in(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in == _value then true else _WRITE_HAS_OCCURRED_$$in);
    _WRITE_READ_BENIGN_FLAG_$$in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$in);
    return;
}



procedure _CHECK_WRITE_$$in(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "in"} {:array "$$in"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in != _value);
  requires {:source_name "in"} {:array "$$in"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$in != _value);
  requires {:source_name "in"} {:array "$$in"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$in(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$in;



implementation {:inline 1} _LOG_ATOMIC_$$in(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$in := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$in);
    return;
}



procedure _CHECK_ATOMIC_$$in(_P: bool, _offset: bv32);
  requires {:source_name "in"} {:array "$$in"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset);
  requires {:source_name "in"} {:array "$$in"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$in(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$in;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$in(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$in := (if _P && _WRITE_HAS_OCCURRED_$$in && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$in);
    return;
}



const _WATCHED_VALUE_$$isums: bv32;

procedure {:inline 1} _LOG_READ_$$isums(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$isums;



implementation {:inline 1} _LOG_READ_$$isums(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$isums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$isums == _value then true else _READ_HAS_OCCURRED_$$isums);
    return;
}



procedure _CHECK_READ_$$isums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "isums"} {:array "$$isums"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$isums && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$isums);
  requires {:source_name "isums"} {:array "$$isums"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$isums && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$isums: bool;

procedure {:inline 1} _LOG_WRITE_$$isums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$isums, _WRITE_READ_BENIGN_FLAG_$$isums;



implementation {:inline 1} _LOG_WRITE_$$isums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$isums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$isums == _value then true else _WRITE_HAS_OCCURRED_$$isums);
    _WRITE_READ_BENIGN_FLAG_$$isums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$isums == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$isums);
    return;
}



procedure _CHECK_WRITE_$$isums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "isums"} {:array "$$isums"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$isums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$isums != _value);
  requires {:source_name "isums"} {:array "$$isums"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$isums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$isums != _value);
  requires {:source_name "isums"} {:array "$$isums"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$isums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$isums(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$isums;



implementation {:inline 1} _LOG_ATOMIC_$$isums(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$isums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$isums);
    return;
}



procedure _CHECK_ATOMIC_$$isums(_P: bool, _offset: bv32);
  requires {:source_name "isums"} {:array "$$isums"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$isums && _WATCHED_OFFSET == _offset);
  requires {:source_name "isums"} {:array "$$isums"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$isums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$isums(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$isums;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$isums(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$isums := (if _P && _WRITE_HAS_OCCURRED_$$isums && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$isums);
    return;
}



const _WATCHED_VALUE_$$out: bv32;

procedure {:inline 1} _LOG_READ_$$out(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$out;



implementation {:inline 1} _LOG_READ_$$out(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then true else _READ_HAS_OCCURRED_$$out);
    return;
}



procedure _CHECK_READ_$$out(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$out);
  requires {:source_name "out"} {:array "$$out"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$out: bool;

procedure {:inline 1} _LOG_WRITE_$$out(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$out, _WRITE_READ_BENIGN_FLAG_$$out;



implementation {:inline 1} _LOG_WRITE_$$out(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then true else _WRITE_HAS_OCCURRED_$$out);
    _WRITE_READ_BENIGN_FLAG_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$out);
    return;
}



procedure _CHECK_WRITE_$$out(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out != _value);
  requires {:source_name "out"} {:array "$$out"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$out != _value);
  requires {:source_name "out"} {:array "$$out"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$out(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$out;



implementation {:inline 1} _LOG_ATOMIC_$$out(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$out := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$out);
    return;
}



procedure _CHECK_ATOMIC_$$out(_P: bool, _offset: bv32);
  requires {:source_name "out"} {:array "$$out"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);
  requires {:source_name "out"} {:array "$$out"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$out;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$out(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$out := (if _P && _WRITE_HAS_OCCURRED_$$out && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$out);
    return;
}



const _WATCHED_VALUE_$$lmem: bv32;

procedure {:inline 1} _LOG_READ_$$lmem(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$lmem;



implementation {:inline 1} _LOG_READ_$$lmem(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$lmem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$lmem == _value then true else _READ_HAS_OCCURRED_$$lmem);
    return;
}



procedure _CHECK_READ_$$lmem(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "lmem"} {:array "$$lmem"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$lmem && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$lmem && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lmem"} {:array "$$lmem"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$lmem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$lmem: bool;

procedure {:inline 1} _LOG_WRITE_$$lmem(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$lmem, _WRITE_READ_BENIGN_FLAG_$$lmem;



implementation {:inline 1} _LOG_WRITE_$$lmem(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$lmem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$lmem == _value then true else _WRITE_HAS_OCCURRED_$$lmem);
    _WRITE_READ_BENIGN_FLAG_$$lmem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$lmem == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$lmem);
    return;
}



procedure _CHECK_WRITE_$$lmem(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "lmem"} {:array "$$lmem"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$lmem && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$lmem != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lmem"} {:array "$$lmem"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$lmem && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$lmem != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lmem"} {:array "$$lmem"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$lmem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$lmem(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$lmem;



implementation {:inline 1} _LOG_ATOMIC_$$lmem(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$lmem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$lmem);
    return;
}



procedure _CHECK_ATOMIC_$$lmem(_P: bool, _offset: bv32);
  requires {:source_name "lmem"} {:array "$$lmem"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$lmem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lmem"} {:array "$$lmem"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$lmem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$lmem(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$lmem;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$lmem(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$lmem := (if _P && _WRITE_HAS_OCCURRED_$$lmem && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$lmem);
    return;
}



const _WATCHED_VALUE_$$bottom_scan.s_seed: bv32;

procedure {:inline 1} _LOG_READ_$$bottom_scan.s_seed(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$bottom_scan.s_seed;



implementation {:inline 1} _LOG_READ_$$bottom_scan.s_seed(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$bottom_scan.s_seed := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$bottom_scan.s_seed == _value then true else _READ_HAS_OCCURRED_$$bottom_scan.s_seed);
    return;
}



procedure _CHECK_READ_$$bottom_scan.s_seed(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_seed"} {:array "$$bottom_scan.s_seed"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$bottom_scan.s_seed && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$bottom_scan.s_seed && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_seed"} {:array "$$bottom_scan.s_seed"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$bottom_scan.s_seed && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$bottom_scan.s_seed: bool;

procedure {:inline 1} _LOG_WRITE_$$bottom_scan.s_seed(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$bottom_scan.s_seed, _WRITE_READ_BENIGN_FLAG_$$bottom_scan.s_seed;



implementation {:inline 1} _LOG_WRITE_$$bottom_scan.s_seed(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$bottom_scan.s_seed := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$bottom_scan.s_seed == _value then true else _WRITE_HAS_OCCURRED_$$bottom_scan.s_seed);
    _WRITE_READ_BENIGN_FLAG_$$bottom_scan.s_seed := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$bottom_scan.s_seed == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$bottom_scan.s_seed);
    return;
}



procedure _CHECK_WRITE_$$bottom_scan.s_seed(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_seed"} {:array "$$bottom_scan.s_seed"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$bottom_scan.s_seed && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$bottom_scan.s_seed != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_seed"} {:array "$$bottom_scan.s_seed"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$bottom_scan.s_seed && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$bottom_scan.s_seed != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_seed"} {:array "$$bottom_scan.s_seed"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$bottom_scan.s_seed && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$bottom_scan.s_seed(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$bottom_scan.s_seed;



implementation {:inline 1} _LOG_ATOMIC_$$bottom_scan.s_seed(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$bottom_scan.s_seed := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$bottom_scan.s_seed);
    return;
}



procedure _CHECK_ATOMIC_$$bottom_scan.s_seed(_P: bool, _offset: bv32);
  requires {:source_name "s_seed"} {:array "$$bottom_scan.s_seed"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$bottom_scan.s_seed && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_seed"} {:array "$$bottom_scan.s_seed"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$bottom_scan.s_seed && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$bottom_scan.s_seed(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$bottom_scan.s_seed;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$bottom_scan.s_seed(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$bottom_scan.s_seed := (if _P && _WRITE_HAS_OCCURRED_$$bottom_scan.s_seed && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$bottom_scan.s_seed);
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$lmem;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$lmem;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$lmem;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$bottom_scan.s_seed;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$bottom_scan.s_seed;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$bottom_scan.s_seed;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$out;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$out;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$out;
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
    havoc $$out;
    goto anon8;

  anon10_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$lmem;
    goto anon4;

  anon4:
    havoc $$bottom_scan.s_seed;
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
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$lmem;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$lmem;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$lmem;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$bottom_scan.s_seed;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$bottom_scan.s_seed;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$bottom_scan.s_seed;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$out;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$out;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$out;
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
    havoc $$out;
    goto anon8;

  anon10_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$lmem;
    goto anon4;

  anon4:
    havoc $$bottom_scan.s_seed;
    goto anon5;

  anon9_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$lmem;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$lmem;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$lmem;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$bottom_scan.s_seed;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$bottom_scan.s_seed;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$bottom_scan.s_seed;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$out;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$out;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$out;
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
    havoc $$out;
    goto anon8;

  anon10_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$lmem;
    goto anon4;

  anon4:
    havoc $$bottom_scan.s_seed;
    goto anon5;

  anon9_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_3($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$lmem;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$lmem;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$lmem;
    goto anon1;

  anon1:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$bottom_scan.s_seed;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$bottom_scan.s_seed;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$bottom_scan.s_seed;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$out;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$out;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$out;
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
    havoc $$out;
    goto anon8;

  anon10_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$lmem;
    goto anon4;

  anon4:
    havoc $$bottom_scan.s_seed;
    goto anon5;

  anon9_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

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
