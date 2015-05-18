type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "m"} {:global} $$m: [bv32]bv32;

axiom {:array_info "$$m"} {:global} {:elem_width 32} {:source_name "m"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$m: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$m: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$m: bool;

var {:source_name "shadow"} {:group_shared} $$shadow: [bv1][bv32]bv32;

axiom {:array_info "$$shadow"} {:group_shared} {:elem_width 32} {:source_name "shadow"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$shadow: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$shadow: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$shadow: bool;

const _WATCHED_OFFSET: bv32;

const {:group_size_x} group_size_x: bv32;

const {:group_size_y} group_size_y: bv32;

const {:group_size_z} group_size_z: bv32;

const {:local_id_x} local_id_x$1: bv32;

const {:local_id_x} local_id_x$2: bv32;

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function FDIV32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "lud_diagonal"} {:kernel} $lud_diagonal($matrix_dim: bv32, $offset: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $matrix_dim == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $offset == 0bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$m && !_WRITE_HAS_OCCURRED_$$m && !_ATOMIC_HAS_OCCURRED_$$m;
  requires !_READ_HAS_OCCURRED_$$shadow && !_WRITE_HAS_OCCURRED_$$shadow && !_ATOMIC_HAS_OCCURRED_$$shadow;
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
  modifies $$shadow, $$m, _TRACKING, _READ_HAS_OCCURRED_$$shadow, _WRITE_HAS_OCCURRED_$$m, _WRITE_READ_BENIGN_FLAG_$$m, _WRITE_READ_BENIGN_FLAG_$$m, _WRITE_HAS_OCCURRED_$$shadow, _WRITE_READ_BENIGN_FLAG_$$shadow, _WRITE_READ_BENIGN_FLAG_$$shadow, _TRACKING, _TRACKING, _READ_HAS_OCCURRED_$$m;



implementation {:source_name "lud_diagonal"} {:kernel} $lud_diagonal($matrix_dim: bv32, $offset: bv32)
{
  var $i.0: bv32;
  var $array_offset.0: bv32;
  var $i.1: bv32;
  var $j.0$1: bv32;
  var $j.0$2: bv32;
  var $j.1$1: bv32;
  var $j.1$2: bv32;
  var $i.2: bv32;
  var $array_offset.1: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3: bool;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
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
  var v13$1: bool;
  var v13$2: bool;
  var v14$1: bool;
  var v14$2: bool;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19: bool;
  var v20$1: bv32;
  var v20$2: bv32;
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


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    $i.0, $array_offset.0 := 0bv32, BV32_ADD(BV32_MUL($offset, $matrix_dim), $offset);
    assume {:captureState "loop_entry_state_4_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_4"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b39 ==> _WRITE_HAS_OCCURRED_$$shadow ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 16bv32), local_id_x$1));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($i.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $i.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $i.0);
    assert {:block_sourceloc} {:sourceloc_num 3} true;
    v1 := BV32_SLT($i.0, 16bv32);
    goto $truebb, __partitioned_block_$falsebb_0;

  __partitioned_block_$falsebb_0:
    assume {:partition} !v1 && !v1;
    goto __partitioned_block_$falsebb_1;

  __partitioned_block_$falsebb_1:
    call {:sourceloc_num 9} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    $i.1 := 0bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b43 ==> _WRITE_HAS_OCCURRED_$$shadow ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, 1bv32), 16bv32), local_id_x$1));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b42 ==> _READ_HAS_OCCURRED_$$shadow ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 16bv32), local_id_x$1)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, 1bv32), 16bv32), local_id_x$1));
    assert {:tag "nowrite"} _b41 ==> !_WRITE_HAS_OCCURRED_$$shadow;
    assert {:tag "noread"} _b40 ==> !_READ_HAS_OCCURRED_$$shadow;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b9 ==> BV32_UGE($i.1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b9 ==> BV32_UGE($i.1, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_ULE($i.1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_ULE($i.1, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b7 ==> BV32_SGE($i.1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b7 ==> BV32_SGE($i.1, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b6 ==> BV32_SLE($i.1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b6 ==> BV32_SLE($i.1, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b5 ==> BV32_SLE(0bv32, $i.1);
    assert {:tag "guardNonNeg"} {:thread 2} _b5 ==> BV32_SLE(0bv32, $i.1);
    assert {:block_sourceloc} {:sourceloc_num 10} true;
    v3 := BV32_SLT($i.1, 15bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v3 && !v3;
    $i.2, $array_offset.1 := 1bv32, BV32_ADD(BV32_MUL(BV32_ADD($offset, 1bv32), $matrix_dim), $offset);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $21;

  $21:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b44 ==> _READ_HAS_OCCURRED_$$shadow ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 16bv32), local_id_x$1));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b14 ==> BV32_UGE($i.2, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b14 ==> BV32_UGE($i.2, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b13 ==> BV32_ULE($i.2, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b13 ==> BV32_ULE($i.2, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b12 ==> BV32_SGE($i.2, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b12 ==> BV32_SGE($i.2, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b11 ==> BV32_SLE($i.2, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b11 ==> BV32_SLE($i.2, 1bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b10 ==> BV32_SLE(0bv32, $i.2);
    assert {:tag "guardNonNeg"} {:thread 2} _b10 ==> BV32_SLE(0bv32, $i.2);
    assert {:block_sourceloc} {:sourceloc_num 39} true;
    v19 := BV32_SLT($i.2, 16bv32);
    goto $truebb5, $falsebb5;

  $falsebb5:
    assume {:partition} !v19 && !v19;
    return;

  $truebb5:
    assume {:partition} v19 && v19;
    call {:sourceloc} {:sourceloc_num 41} _LOG_READ_$$shadow(true, BV32_ADD(BV32_MUL($i.2, 16bv32), v0$1), $$shadow[1bv1][BV32_ADD(BV32_MUL($i.2, 16bv32), v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 41} _CHECK_READ_$$shadow(true, BV32_ADD(BV32_MUL($i.2, 16bv32), v0$2), $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($i.2, 16bv32), v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shadow"} true;
    v20$1 := $$shadow[1bv1][BV32_ADD(BV32_MUL($i.2, 16bv32), v0$1)];
    v20$2 := $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($i.2, 16bv32), v0$2)];
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$m(true, BV32_ADD($array_offset.1, v0$1), v20$1, $$m[BV32_ADD($array_offset.1, v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$m(true, BV32_ADD($array_offset.1, v0$2));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$m(true, BV32_ADD($array_offset.1, v0$2), v20$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$m"} true;
    $$m[BV32_ADD($array_offset.1, v0$1)] := v20$1;
    $$m[BV32_ADD($array_offset.1, v0$2)] := v20$2;
    $i.2, $array_offset.1 := BV32_ADD($i.2, 1bv32), BV32_ADD($array_offset.1, $matrix_dim);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $21;

  $truebb0:
    assume {:partition} v3 && v3;
    v4$1 := BV32_SGT(v0$1, $i.1);
    v4$2 := BV32_SGT(v0$2, $i.1);
    p1$1 := (if v4$1 then v4$1 else p1$1);
    p1$2 := (if v4$2 then v4$2 else p1$2);
    $j.0$1 := (if p1$1 then 0bv32 else $j.0$1);
    $j.0$2 := (if p1$2 then 0bv32 else $j.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $8;

  $8:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "accessBreak"} _b45 ==> _WRITE_HAS_OCCURRED_$$shadow ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 16bv32);
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b38 ==> _WRITE_HAS_OCCURRED_$$shadow ==> BV32_SLT($i.1, 15bv32) && BV32_SGT(local_id_x$1, $i.1);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b37 ==> _READ_HAS_OCCURRED_$$shadow ==> BV32_SLT($i.1, 15bv32) && BV32_SGT(local_id_x$1, $i.1);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p2$1 ==> _b36 ==> p2$1 ==> BV32_SLT($i.1, 15bv32) && BV32_SGT(local_id_x$1, $i.1);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p2$2 ==> _b36 ==> p2$2 ==> BV32_SLT($i.1, 15bv32) && BV32_SGT(local_id_x$2, $i.1);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b35 ==> BV32_SLT($i.1, 15bv32) && BV32_SGT(local_id_x$1, $i.1) && BV32_SLT($j.0$1, $i.1) ==> p2$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b35 ==> BV32_SLT($i.1, 15bv32) && BV32_SGT(local_id_x$2, $i.1) && BV32_SLT($j.0$2, $i.1) ==> p2$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b34 ==> !BV32_SGT(v0$1, $i.1) ==> !_READ_HAS_OCCURRED_$$shadow;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b33 ==> !BV32_SGT(v0$1, $i.1) ==> !_WRITE_HAS_OCCURRED_$$shadow;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b32 ==> !BV32_SGT(v0$1, $i.1) ==> !p2$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b32 ==> !BV32_SGT(v0$2, $i.1) ==> !p2$2;
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b31 ==> BV32_UGE($j.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b31 ==> BV32_UGE($j.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b30 ==> BV32_ULE($j.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b30 ==> BV32_ULE($j.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b29 ==> BV32_SGE($j.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b29 ==> BV32_SGE($j.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b28 ==> BV32_SLE($j.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b28 ==> BV32_SLE($j.0$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p2$1 ==> _b27 ==> BV32_SLE(0bv32, $j.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p2$2 ==> _b27 ==> BV32_SLE(0bv32, $j.0$2);
    assert {:block_sourceloc} {:sourceloc_num 13} p2$1 ==> true;
    v5$1 := (if p2$1 then BV32_SLT($j.0$1, $i.1) else v5$1);
    v5$2 := (if p2$2 then BV32_SLT($j.0$2, $i.1) else v5$2);
    p3$1 := false;
    p3$2 := false;
    p3$1 := (if p2$1 && v5$1 then v5$1 else p3$1);
    p3$2 := (if p2$2 && v5$2 then v5$2 else p3$2);
    p2$1 := (if p2$1 && !v5$1 then v5$1 else p2$1);
    p2$2 := (if p2$2 && !v5$2 then v5$2 else p2$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$shadow(p3$1, BV32_ADD(BV32_MUL(v0$1, 16bv32), $j.0$1), $$shadow[1bv1][BV32_ADD(BV32_MUL(v0$1, 16bv32), $j.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$shadow(p3$2, BV32_ADD(BV32_MUL(v0$2, 16bv32), $j.0$2), $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 16bv32), $j.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shadow"} true;
    v6$1 := (if p3$1 then $$shadow[1bv1][BV32_ADD(BV32_MUL(v0$1, 16bv32), $j.0$1)] else v6$1);
    v6$2 := (if p3$2 then $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 16bv32), $j.0$2)] else v6$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$shadow(p3$1, BV32_ADD(BV32_MUL($j.0$1, 16bv32), $i.1), $$shadow[1bv1][BV32_ADD(BV32_MUL($j.0$1, 16bv32), $i.1)]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$shadow(p3$2, BV32_ADD(BV32_MUL($j.0$2, 16bv32), $i.1), $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 16bv32), $i.1)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shadow"} true;
    v7$1 := (if p3$1 then $$shadow[1bv1][BV32_ADD(BV32_MUL($j.0$1, 16bv32), $i.1)] else v7$1);
    v7$2 := (if p3$2 then $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.0$2, 16bv32), $i.1)] else v7$2);
    v8$1 := (if p3$1 then BV32_ADD(BV32_MUL(v0$1, 16bv32), $i.1) else v8$1);
    v8$2 := (if p3$2 then BV32_ADD(BV32_MUL(v0$2, 16bv32), $i.1) else v8$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$shadow(p3$1, v8$1, $$shadow[1bv1][v8$1]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$shadow(p3$2, v8$2, $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v8$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shadow"} true;
    v9$1 := (if p3$1 then $$shadow[1bv1][v8$1] else v9$1);
    v9$2 := (if p3$2 then $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v8$2] else v9$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$shadow(p3$1, v8$1, FSUB32(v9$1, FMUL32(v6$1, v7$1)), $$shadow[1bv1][v8$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$shadow(p3$2, v8$2);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$shadow(p3$2, v8$2, FSUB32(v9$2, FMUL32(v6$2, v7$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$shadow"} true;
    $$shadow[1bv1][v8$1] := (if p3$1 then FSUB32(v9$1, FMUL32(v6$1, v7$1)) else $$shadow[1bv1][v8$1]);
    $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v8$2] := (if p3$2 then FSUB32(v9$2, FMUL32(v6$2, v7$2)) else $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v8$2]);
    $j.0$1 := (if p3$1 then BV32_ADD($j.0$1, 1bv32) else $j.0$1);
    $j.0$2 := (if p3$2 then BV32_ADD($j.0$2, 1bv32) else $j.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $8.backedge, __partitioned_block_$8.tail_0;

  __partitioned_block_$8.tail_0:
    assume !p2$1 && !p2$2;
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$shadow(p1$1, BV32_ADD(BV32_MUL($i.1, 16bv32), $i.1), $$shadow[1bv1][BV32_ADD(BV32_MUL($i.1, 16bv32), $i.1)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$shadow(p1$2, BV32_ADD(BV32_MUL($i.1, 16bv32), $i.1), $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($i.1, 16bv32), $i.1)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shadow"} true;
    v10$1 := (if p1$1 then $$shadow[1bv1][BV32_ADD(BV32_MUL($i.1, 16bv32), $i.1)] else v10$1);
    v10$2 := (if p1$2 then $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($i.1, 16bv32), $i.1)] else v10$2);
    v11$1 := (if p1$1 then BV32_ADD(BV32_MUL(v0$1, 16bv32), $i.1) else v11$1);
    v11$2 := (if p1$2 then BV32_ADD(BV32_MUL(v0$2, 16bv32), $i.1) else v11$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$shadow(p1$1, v11$1, $$shadow[1bv1][v11$1]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$shadow(p1$2, v11$2, $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v11$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shadow"} true;
    v12$1 := (if p1$1 then $$shadow[1bv1][v11$1] else v12$1);
    v12$2 := (if p1$2 then $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v11$2] else v12$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$shadow(p1$1, v11$1, FDIV32(v12$1, v10$1), $$shadow[1bv1][v11$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$shadow(p1$2, v11$2);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$shadow(p1$2, v11$2, FDIV32(v12$2, v10$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$shadow"} true;
    $$shadow[1bv1][v11$1] := (if p1$1 then FDIV32(v12$1, v10$1) else $$shadow[1bv1][v11$1]);
    $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v11$2] := (if p1$2 then FDIV32(v12$2, v10$2) else $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v11$2]);
    goto __partitioned_block_$8.tail_1;

  __partitioned_block_$8.tail_1:
    call {:sourceloc_num 25} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    v13$1 := BV32_SGT(v0$1, $i.1);
    v13$2 := BV32_SGT(v0$2, $i.1);
    p5$1 := (if v13$1 then v13$1 else p5$1);
    p5$2 := (if v13$2 then v13$2 else p5$2);
    $j.1$1 := (if p5$1 then 0bv32 else $j.1$1);
    $j.1$2 := (if p5$2 then 0bv32 else $j.1$2);
    p6$1 := (if p5$1 then true else p6$1);
    p6$2 := (if p5$2 then true else p6$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $14;

  $14:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b47 ==> _WRITE_HAS_OCCURRED_$$shadow ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, 1bv32), 16bv32), local_id_x$1));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b46 ==> _READ_HAS_OCCURRED_$$shadow ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 16bv32), local_id_x$1)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 16bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, 1bv32), 16bv32), local_id_x$1));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$shadow ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b26 ==> _WRITE_HAS_OCCURRED_$$shadow ==> BV32_SLT($i.1, 15bv32) && BV32_SGT(local_id_x$1, $i.1);
    assert {:do_not_predicate} {:tag "accessOnlyIfEnabledInEnclosingScopes"} {:thread 1} _b25 ==> _READ_HAS_OCCURRED_$$shadow ==> BV32_SLT($i.1, 15bv32) && BV32_SGT(local_id_x$1, $i.1);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p6$1 ==> _b24 ==> p6$1 ==> BV32_SLT($i.1, 15bv32) && BV32_SGT(local_id_x$1, $i.1);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p6$2 ==> _b24 ==> p6$2 ==> BV32_SLT($i.1, 15bv32) && BV32_SGT(local_id_x$2, $i.1);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b23 ==> BV32_SLT($i.1, 15bv32) && BV32_SGT(local_id_x$1, $i.1) && BV32_SLT($j.1$1, BV32_ADD($i.1, 1bv32)) ==> p6$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b23 ==> BV32_SLT($i.1, 15bv32) && BV32_SGT(local_id_x$2, $i.1) && BV32_SLT($j.1$2, BV32_ADD($i.1, 1bv32)) ==> p6$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b22 ==> !BV32_SGT(v0$1, $i.1) ==> !_READ_HAS_OCCURRED_$$shadow;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b21 ==> !BV32_SGT(v0$1, $i.1) ==> !_WRITE_HAS_OCCURRED_$$shadow;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b20 ==> !BV32_SGT(v0$1, $i.1) ==> !p6$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b20 ==> !BV32_SGT(v0$2, $i.1) ==> !p6$2;
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b19 ==> BV32_UGE($j.1$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b19 ==> BV32_UGE($j.1$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b18 ==> BV32_ULE($j.1$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b18 ==> BV32_ULE($j.1$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b17 ==> BV32_SGE($j.1$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b17 ==> BV32_SGE($j.1$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p6$1 ==> _b16 ==> BV32_SLE($j.1$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p6$2 ==> _b16 ==> BV32_SLE($j.1$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p6$1 ==> _b15 ==> BV32_SLE(0bv32, $j.1$1);
    assert {:tag "guardNonNeg"} {:thread 2} p6$2 ==> _b15 ==> BV32_SLE(0bv32, $j.1$2);
    assert {:block_sourceloc} {:sourceloc_num 27} p6$1 ==> true;
    v14$1 := (if p6$1 then BV32_SLT($j.1$1, BV32_ADD($i.1, 1bv32)) else v14$1);
    v14$2 := (if p6$2 then BV32_SLT($j.1$2, BV32_ADD($i.1, 1bv32)) else v14$2);
    p7$1 := false;
    p7$2 := false;
    p7$1 := (if p6$1 && v14$1 then v14$1 else p7$1);
    p7$2 := (if p6$2 && v14$2 then v14$2 else p7$2);
    p6$1 := (if p6$1 && !v14$1 then v14$1 else p6$1);
    p6$2 := (if p6$2 && !v14$2 then v14$2 else p6$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_READ_$$shadow(p7$1, BV32_ADD(BV32_MUL(BV32_ADD($i.1, 1bv32), 16bv32), $j.1$1), $$shadow[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($i.1, 1bv32), 16bv32), $j.1$1)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 29} _CHECK_READ_$$shadow(p7$2, BV32_ADD(BV32_MUL(BV32_ADD($i.1, 1bv32), 16bv32), $j.1$2), $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($i.1, 1bv32), 16bv32), $j.1$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shadow"} true;
    v15$1 := (if p7$1 then $$shadow[1bv1][BV32_ADD(BV32_MUL(BV32_ADD($i.1, 1bv32), 16bv32), $j.1$1)] else v15$1);
    v15$2 := (if p7$2 then $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD($i.1, 1bv32), 16bv32), $j.1$2)] else v15$2);
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$shadow(p7$1, BV32_ADD(BV32_MUL($j.1$1, 16bv32), v0$1), $$shadow[1bv1][BV32_ADD(BV32_MUL($j.1$1, 16bv32), v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$shadow(p7$2, BV32_ADD(BV32_MUL($j.1$2, 16bv32), v0$2), $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.1$2, 16bv32), v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shadow"} true;
    v16$1 := (if p7$1 then $$shadow[1bv1][BV32_ADD(BV32_MUL($j.1$1, 16bv32), v0$1)] else v16$1);
    v16$2 := (if p7$2 then $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($j.1$2, 16bv32), v0$2)] else v16$2);
    v17$1 := (if p7$1 then BV32_ADD(BV32_MUL(BV32_ADD($i.1, 1bv32), 16bv32), v0$1) else v17$1);
    v17$2 := (if p7$2 then BV32_ADD(BV32_MUL(BV32_ADD($i.1, 1bv32), 16bv32), v0$2) else v17$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_READ_$$shadow(p7$1, v17$1, $$shadow[1bv1][v17$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 31} _CHECK_READ_$$shadow(p7$2, v17$2, $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v17$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$shadow"} true;
    v18$1 := (if p7$1 then $$shadow[1bv1][v17$1] else v18$1);
    v18$2 := (if p7$2 then $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v17$2] else v18$2);
    call {:sourceloc} {:sourceloc_num 32} _LOG_WRITE_$$shadow(p7$1, v17$1, FSUB32(v18$1, FMUL32(v15$1, v16$1)), $$shadow[1bv1][v17$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$shadow(p7$2, v17$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 32} _CHECK_WRITE_$$shadow(p7$2, v17$2, FSUB32(v18$2, FMUL32(v15$2, v16$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$shadow"} true;
    $$shadow[1bv1][v17$1] := (if p7$1 then FSUB32(v18$1, FMUL32(v15$1, v16$1)) else $$shadow[1bv1][v17$1]);
    $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v17$2] := (if p7$2 then FSUB32(v18$2, FMUL32(v15$2, v16$2)) else $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v17$2]);
    $j.1$1 := (if p7$1 then BV32_ADD($j.1$1, 1bv32) else $j.1$1);
    $j.1$2 := (if p7$2 then BV32_ADD($j.1$2, 1bv32) else $j.1$2);
    p6$1 := (if p7$1 then true else p6$1);
    p6$2 := (if p7$2 then true else p6$2);
    goto $14.backedge, __partitioned_block_$14.tail_0;

  __partitioned_block_$14.tail_0:
    assume !p6$1 && !p6$2;
    goto __partitioned_block_$14.tail_1;

  __partitioned_block_$14.tail_1:
    call {:sourceloc_num 36} $bugle_barrier_duplicated_2(1bv1, 0bv1);
    $i.1 := BV32_ADD($i.1, 1bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $5;

  $14.backedge:
    assume {:backedge} p6$1 || p6$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $14;

  $8.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $8;

  $truebb:
    assume {:partition} v1 && v1;
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$m(true, BV32_ADD($array_offset.0, v0$1), $$m[BV32_ADD($array_offset.0, v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$m(true, BV32_ADD($array_offset.0, v0$2), $$m[BV32_ADD($array_offset.0, v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$m"} true;
    v2$1 := $$m[BV32_ADD($array_offset.0, v0$1)];
    v2$2 := $$m[BV32_ADD($array_offset.0, v0$2)];
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$shadow(true, BV32_ADD(BV32_MUL($i.0, 16bv32), v0$1), v2$1, $$shadow[1bv1][BV32_ADD(BV32_MUL($i.0, 16bv32), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$shadow(true, BV32_ADD(BV32_MUL($i.0, 16bv32), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$shadow(true, BV32_ADD(BV32_MUL($i.0, 16bv32), v0$2), v2$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$shadow"} true;
    $$shadow[1bv1][BV32_ADD(BV32_MUL($i.0, 16bv32), v0$1)] := v2$1;
    $$shadow[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($i.0, 16bv32), v0$2)] := v2$2;
    $i.0, $array_offset.0 := BV32_ADD($i.0, 1bv32), BV32_ADD($array_offset.0, $matrix_dim);
    assume {:captureState "loop_back_edge_state_4_0"} true;
    goto $1;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$shadow, $$m, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$shadow, $$m, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$shadow, $$m, _TRACKING;



function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

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

const _WATCHED_VALUE_$$m: bv32;

procedure {:inline 1} _LOG_READ_$$m(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$m;



implementation {:inline 1} _LOG_READ_$$m(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$m := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m == _value then true else _READ_HAS_OCCURRED_$$m);
    return;
}



procedure _CHECK_READ_$$m(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "m"} {:array "$$m"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$m);
  requires {:source_name "m"} {:array "$$m"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$m: bool;

procedure {:inline 1} _LOG_WRITE_$$m(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$m, _WRITE_READ_BENIGN_FLAG_$$m;



implementation {:inline 1} _LOG_WRITE_$$m(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$m := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m == _value then true else _WRITE_HAS_OCCURRED_$$m);
    _WRITE_READ_BENIGN_FLAG_$$m := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$m);
    return;
}



procedure _CHECK_WRITE_$$m(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "m"} {:array "$$m"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m != _value);
  requires {:source_name "m"} {:array "$$m"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m != _value);
  requires {:source_name "m"} {:array "$$m"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$m(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$m;



implementation {:inline 1} _LOG_ATOMIC_$$m(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$m := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$m);
    return;
}



procedure _CHECK_ATOMIC_$$m(_P: bool, _offset: bv32);
  requires {:source_name "m"} {:array "$$m"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset);
  requires {:source_name "m"} {:array "$$m"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$m(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$m;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$m(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$m := (if _P && _WRITE_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$m);
    return;
}



const _WATCHED_VALUE_$$shadow: bv32;

procedure {:inline 1} _LOG_READ_$$shadow(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$shadow;



implementation {:inline 1} _LOG_READ_$$shadow(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$shadow := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shadow == _value then true else _READ_HAS_OCCURRED_$$shadow);
    return;
}



procedure _CHECK_READ_$$shadow(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "shadow"} {:array "$$shadow"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$shadow && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$shadow && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shadow"} {:array "$$shadow"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$shadow && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$shadow: bool;

procedure {:inline 1} _LOG_WRITE_$$shadow(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$shadow, _WRITE_READ_BENIGN_FLAG_$$shadow;



implementation {:inline 1} _LOG_WRITE_$$shadow(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$shadow := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shadow == _value then true else _WRITE_HAS_OCCURRED_$$shadow);
    _WRITE_READ_BENIGN_FLAG_$$shadow := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shadow == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$shadow);
    return;
}



procedure _CHECK_WRITE_$$shadow(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "shadow"} {:array "$$shadow"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$shadow && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shadow != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shadow"} {:array "$$shadow"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$shadow && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$shadow != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shadow"} {:array "$$shadow"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$shadow && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$shadow(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$shadow;



implementation {:inline 1} _LOG_ATOMIC_$$shadow(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$shadow := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$shadow);
    return;
}



procedure _CHECK_ATOMIC_$$shadow(_P: bool, _offset: bv32);
  requires {:source_name "shadow"} {:array "$$shadow"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$shadow && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "shadow"} {:array "$$shadow"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$shadow && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$shadow(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$shadow;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$shadow(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$shadow := (if _P && _WRITE_HAS_OCCURRED_$$shadow && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$shadow);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$shadow;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$shadow;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$shadow;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$m;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$m;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$m;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$m;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$shadow;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$shadow;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$shadow;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$shadow;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$m;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$m;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$m;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$m;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$shadow;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$shadow;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$shadow;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$shadow;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$m;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$m;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$m;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$m;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$shadow;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b39: bool;

const {:existential true} _b40: bool;

const {:existential true} _b41: bool;

const {:existential true} _b42: bool;

const {:existential true} _b43: bool;

const {:existential true} _b44: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b45: bool;

const {:existential true} _b46: bool;

const {:existential true} _b47: bool;
