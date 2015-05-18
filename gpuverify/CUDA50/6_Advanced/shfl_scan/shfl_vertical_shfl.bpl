type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "img"} {:global} $$img: [bv32]bv32;

axiom {:array_info "$$img"} {:global} {:elem_width 32} {:source_name "img"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$img: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$img: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$img: bool;

var {:source_name "sums"} {:group_shared} $$_ZZ18shfl_vertical_shflPjiiE4sums: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ18shfl_vertical_shflPjiiE4sums"} {:group_shared} {:elem_width 32} {:source_name "sums"} {:source_elem_width 32} {:source_dimensions "32,9"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,9"} _READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,9"} _WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,9"} _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums: bool;

const _WATCHED_OFFSET: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

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

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvurem"} BV32_UREM(bv32, bv32) : bv32;

procedure {:source_name "shfl_vertical_shfl"} {:kernel} $_Z18shfl_vertical_shflPjii($width: bv32, $height: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 1920bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$img && !_WRITE_HAS_OCCURRED_$$img && !_ATOMIC_HAS_OCCURRED_$$img;
  requires !_READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums && !_WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums && !_ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
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
  modifies $$_ZZ18shfl_vertical_shflPjiiE4sums, _WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums, _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums, _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums, $$img, _TRACKING, _READ_HAS_OCCURRED_$$img, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums, _TRACKING, _TRACKING, _WRITE_HAS_OCCURRED_$$img, _WRITE_READ_BENIGN_FLAG_$$img, _WRITE_READ_BENIGN_FLAG_$$img;



implementation {:source_name "shfl_vertical_shfl"} {:kernel} $_Z18shfl_vertical_shflPjii($width: bv32, $height: bv32)
{
  var $stepSum.0$1: bv32;
  var $stepSum.0$2: bv32;
  var $step.0: bv32;
  var $partial_sum.0$1: bv32;
  var $partial_sum.0$2: bv32;
  var $i.0: bv32;
  var $partial_sum.1$1: bv32;
  var $partial_sum.1$2: bv32;
  var $sum.0$1: bv32;
  var $sum.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7: bool;
  var v9$1: bool;
  var v9$2: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v10$1: bool;
  var v10$2: bool;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;


  __partitioned_block_$0_0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    call {:sourceloc} {:sourceloc_num 2} _LOG_WRITE_$$_ZZ18shfl_vertical_shflPjiiE4sums(true, BV32_ADD(BV32_MUL(local_id_x$1, 9bv32), local_id_y$1), 0bv32, $$_ZZ18shfl_vertical_shflPjiiE4sums[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 9bv32), local_id_y$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums(true, BV32_ADD(BV32_MUL(local_id_x$2, 9bv32), local_id_y$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 2} _CHECK_WRITE_$$_ZZ18shfl_vertical_shflPjiiE4sums(true, BV32_ADD(BV32_MUL(local_id_x$2, 9bv32), local_id_y$2), 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18shfl_vertical_shflPjiiE4sums"} true;
    $$_ZZ18shfl_vertical_shflPjiiE4sums[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 9bv32), local_id_y$1)] := 0bv32;
    $$_ZZ18shfl_vertical_shflPjiiE4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 9bv32), local_id_y$2)] := 0bv32;
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 3} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $stepSum.0$1, $step.0 := 0bv32, 0bv32;
    $stepSum.0$2 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b22 ==> _WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums ==> _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_UDIV(local_id_x$1, 8bv32), BV32_MUL(local_id_y$1, 4bv32)), 9bv32), BV32_UREM(local_id_x$1, 8bv32)) || _WATCHED_OFFSET == BV32_ADD(BV32_MUL(local_id_x$1, 9bv32), local_id_y$1);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b21 ==> _READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums ==> _WATCHED_OFFSET == BV32_ADD(BV32_MUL(BV32_ADD(BV32_UDIV(local_id_x$1, 8bv32), BV32_MUL(local_id_y$1, 4bv32)), 9bv32), BV32_UREM(local_id_x$1, 8bv32));
    assert {:tag "nowrite"} _b20 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
    assert {:tag "noread"} _b19 ==> !_READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
    assert {:tag "accessBreak"} _b18 ==> _WRITE_HAS_OCCURRED_$$img ==> group_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, group_size_x), BV32_DIV(BV32_MUL(local_id_y$1, $width), group_size_x));
    assert {:tag "accessBreak"} _b17 ==> _WRITE_HAS_OCCURRED_$$img ==> local_id_y$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, $width), BV32_DIV(BV32_MUL(group_id_x$1, group_size_x), $width));
    assert {:tag "accessBreak"} _b16 ==> _READ_HAS_OCCURRED_$$img ==> group_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, group_size_x), BV32_DIV(BV32_MUL(local_id_y$1, $width), group_size_x));
    assert {:tag "accessBreak"} _b15 ==> _READ_HAS_OCCURRED_$$img ==> local_id_y$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, $width), BV32_DIV(BV32_MUL(group_id_x$1, group_size_x), $width));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b14 ==> _WRITE_HAS_OCCURRED_$$img ==> BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 8bv32), $width), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 8bv32), $width), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(0bv32, 8bv32), local_id_y$1), $width), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b13 ==> _READ_HAS_OCCURRED_$$img ==> BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 8bv32), $width), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, 8bv32), $width), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(0bv32, 8bv32), local_id_y$1), $width), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)));
    assert {:tag "accessUpperBoundBlock"} _b12 ==> _WRITE_HAS_OCCURRED_$$img ==> BV32_SLT(_WATCHED_OFFSET, BV32_ADD(BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), group_size_x), local_id_x$1));
    assert {:tag "accessLowerBoundBlock"} _b11 ==> _WRITE_HAS_OCCURRED_$$img ==> BV32_SLE(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), _WATCHED_OFFSET);
    assert {:tag "accessUpperBoundBlock"} _b10 ==> _READ_HAS_OCCURRED_$$img ==> BV32_SLT(_WATCHED_OFFSET, BV32_ADD(BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), group_size_x), local_id_x$1));
    assert {:tag "accessLowerBoundBlock"} _b9 ==> _READ_HAS_OCCURRED_$$img ==> BV32_SLE(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), _WATCHED_OFFSET);
    assert {:tag "nowrite"} _b8 ==> !_WRITE_HAS_OCCURRED_$$img;
    assert {:tag "noread"} _b7 ==> !_READ_HAS_OCCURRED_$$img;
    assert {:tag "pow2NotZero"} _b6 ==> $i.0 != 0bv32;
    assert {:tag "pow2"} _b5 ==> $i.0 == 0bv32 || BV32_AND($i.0, BV32_SUB($i.0, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($step.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($step.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($step.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($step.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($step.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($step.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($step.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($step.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $step.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $step.0);
    assert {:block_sourceloc} {:sourceloc_num 4} true;
    v1 := BV32_SLT($step.0, 135bv32);
    goto __partitioned_block_$truebb_0, $falsebb;

  $falsebb:
    assume {:partition} !v1 && !v1;
    return;

  __partitioned_block_$truebb_0:
    assume {:partition} v1 && v1;
    v2$1 := BV32_MUL(BV32_ADD(local_id_y$1, BV32_MUL($step.0, 8bv32)), $width);
    v2$2 := BV32_MUL(BV32_ADD(local_id_y$2, BV32_MUL($step.0, 8bv32)), $width);
    call {:sourceloc} {:sourceloc_num 6} _LOG_READ_$$img(true, BV32_ADD(v2$1, v0$1), $$img[BV32_ADD(v2$1, v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 6} _CHECK_READ_$$img(true, BV32_ADD(v2$2, v0$2), $$img[BV32_ADD(v2$2, v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$img"} true;
    v3$1 := $$img[BV32_ADD(v2$1, v0$1)];
    v3$2 := $$img[BV32_ADD(v2$2, v0$2)];
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$_ZZ18shfl_vertical_shflPjiiE4sums(true, BV32_ADD(BV32_MUL(local_id_x$1, 9bv32), local_id_y$1), v3$1, $$_ZZ18shfl_vertical_shflPjiiE4sums[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 9bv32), local_id_y$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums(true, BV32_ADD(BV32_MUL(local_id_x$2, 9bv32), local_id_y$2));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$_ZZ18shfl_vertical_shflPjiiE4sums(true, BV32_ADD(BV32_MUL(local_id_x$2, 9bv32), local_id_y$2), v3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18shfl_vertical_shflPjiiE4sums"} true;
    $$_ZZ18shfl_vertical_shflPjiiE4sums[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 9bv32), local_id_y$1)] := v3$1;
    $$_ZZ18shfl_vertical_shflPjiiE4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 9bv32), local_id_y$2)] := v3$2;
    goto __partitioned_block_$truebb_1;

  __partitioned_block_$truebb_1:
    call {:sourceloc_num 8} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    v4$1 := BV32_UREM(local_id_x$1, 8bv32);
    v4$2 := BV32_UREM(local_id_x$2, 8bv32);
    v5$1 := BV32_ADD(BV32_UDIV(local_id_x$1, 8bv32), BV32_MUL(local_id_y$1, 4bv32));
    v5$2 := BV32_ADD(BV32_UDIV(local_id_x$2, 8bv32), BV32_MUL(local_id_y$2, 4bv32));
    call {:sourceloc} {:sourceloc_num 9} _LOG_READ_$$_ZZ18shfl_vertical_shflPjiiE4sums(true, BV32_ADD(BV32_MUL(v5$1, 9bv32), v4$1), $$_ZZ18shfl_vertical_shflPjiiE4sums[1bv1][BV32_ADD(BV32_MUL(v5$1, 9bv32), v4$1)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 9} _CHECK_READ_$$_ZZ18shfl_vertical_shflPjiiE4sums(true, BV32_ADD(BV32_MUL(v5$2, 9bv32), v4$2), $$_ZZ18shfl_vertical_shflPjiiE4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v5$2, 9bv32), v4$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18shfl_vertical_shflPjiiE4sums"} true;
    v6$1 := $$_ZZ18shfl_vertical_shflPjiiE4sums[1bv1][BV32_ADD(BV32_MUL(v5$1, 9bv32), v4$1)];
    v6$2 := $$_ZZ18shfl_vertical_shflPjiiE4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v5$2, 9bv32), v4$2)];
    $partial_sum.0$1, $i.0 := v6$1, 1bv32;
    $partial_sum.0$2 := v6$2;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_1"} true;
    assume {:invGenSkippedLoop} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 10} true;
    v7 := BV32_SLE($i.0, 8bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    goto $truebb0, __partitioned_block_$falsebb0_0;

  __partitioned_block_$falsebb0_0:
    assume {:partition} !v7 && !v7;
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$_ZZ18shfl_vertical_shflPjiiE4sums(true, BV32_ADD(BV32_MUL(v5$1, 9bv32), v4$1), $partial_sum.0$1, $$_ZZ18shfl_vertical_shflPjiiE4sums[1bv1][BV32_ADD(BV32_MUL(v5$1, 9bv32), v4$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums(true, BV32_ADD(BV32_MUL(v5$2, 9bv32), v4$2));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$_ZZ18shfl_vertical_shflPjiiE4sums(true, BV32_ADD(BV32_MUL(v5$2, 9bv32), v4$2), $partial_sum.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18shfl_vertical_shflPjiiE4sums"} true;
    $$_ZZ18shfl_vertical_shflPjiiE4sums[1bv1][BV32_ADD(BV32_MUL(v5$1, 9bv32), v4$1)] := $partial_sum.0$1;
    $$_ZZ18shfl_vertical_shflPjiiE4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v5$2, 9bv32), v4$2)] := $partial_sum.0$2;
    goto __partitioned_block_$falsebb0_1;

  __partitioned_block_$falsebb0_1:
    call {:sourceloc_num 18} $bugle_barrier_duplicated_2(1bv1, 1bv1);
    v10$1 := BV32_UGT(local_id_y$1, 0bv32);
    v10$2 := BV32_UGT(local_id_y$2, 0bv32);
    p3$1 := (if v10$1 then v10$1 else p3$1);
    p3$2 := (if v10$2 then v10$2 else p3$2);
    p2$1 := (if !v10$1 then !v10$1 else p2$1);
    p2$2 := (if !v10$2 then !v10$2 else p2$2);
    $sum.0$1 := (if p2$1 then v3$1 else $sum.0$1);
    $sum.0$2 := (if p2$2 then v3$2 else $sum.0$2);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 20} true;
    v11$1 := (if p3$1 then $$_ZZ18shfl_vertical_shflPjiiE4sums[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 9bv32), BV32_SUB(local_id_y$1, 1bv32))] else v11$1);
    v11$2 := (if p3$2 then $$_ZZ18shfl_vertical_shflPjiiE4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 9bv32), BV32_SUB(local_id_y$2, 1bv32))] else v11$2);
    $sum.0$1 := (if p3$1 then BV32_ADD(v3$1, v11$1) else $sum.0$1);
    $sum.0$2 := (if p3$2 then BV32_ADD(v3$2, v11$2) else $sum.0$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 22} true;
    v12$1 := $$_ZZ18shfl_vertical_shflPjiiE4sums[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 9bv32), BV32_SUB(group_size_y, 1bv32))];
    v12$2 := $$_ZZ18shfl_vertical_shflPjiiE4sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 9bv32), BV32_SUB(group_size_y, 1bv32))];
    goto __partitioned_block_$falsebb0_2;

  __partitioned_block_$falsebb0_2:
    call {:sourceloc_num 23} $bugle_barrier_duplicated_3(1bv1, 1bv1);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$img(true, BV32_ADD(v2$1, v0$1), BV32_ADD($sum.0$1, $stepSum.0$1), $$img[BV32_ADD(v2$1, v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$img(true, BV32_ADD(v2$2, v0$2));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$img(true, BV32_ADD(v2$2, v0$2), BV32_ADD($sum.0$2, $stepSum.0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$img"} true;
    $$img[BV32_ADD(v2$1, v0$1)] := BV32_ADD($sum.0$1, $stepSum.0$1);
    $$img[BV32_ADD(v2$2, v0$2)] := BV32_ADD($sum.0$2, $stepSum.0$2);
    $stepSum.0$1, $step.0 := BV32_ADD($stepSum.0$1, v12$1), BV32_ADD($step.0, 1bv32);
    $stepSum.0$2 := BV32_ADD($stepSum.0$2, v12$2);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $truebb0:
    assume {:partition} v7 && v7;
    call {:sourceloc_num 12} v8$1, v8$2 := $_Z9__shfl_upiii($i.0, 32bv32, $partial_sum.0$1, $partial_sum.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z9__shfl_upiii"} true;
    v9$1 := BV32_UGE(BV32_SREM(v0$1, 8bv32), $i.0);
    v9$2 := BV32_UGE(BV32_SREM(v0$2, 8bv32), $i.0);
    p1$1 := (if v9$1 then v9$1 else p1$1);
    p1$2 := (if v9$2 then v9$2 else p1$2);
    p0$1 := (if !v9$1 then !v9$1 else p0$1);
    p0$2 := (if !v9$2 then !v9$2 else p0$2);
    $partial_sum.1$1 := (if p0$1 then $partial_sum.0$1 else $partial_sum.1$1);
    $partial_sum.1$2 := (if p0$2 then $partial_sum.0$2 else $partial_sum.1$2);
    $partial_sum.1$1 := (if p1$1 then BV32_ADD($partial_sum.0$1, v8$1) else $partial_sum.1$1);
    $partial_sum.1$2 := (if p1$2 then BV32_ADD($partial_sum.0$2, v8$2) else $partial_sum.1$2);
    $partial_sum.0$1, $i.0 := $partial_sum.1$1, BV32_MUL($i.0, 2bv32);
    $partial_sum.0$2 := $partial_sum.1$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $3;
}



procedure {:source_name "_Z9__shfl_upiii"} $_Z9__shfl_upiii($1: bv32, $2: bv32, $0$1: bv32, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);
  requires $2 == 32bv32;



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 60bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ18shfl_vertical_shflPjiiE4sums, $$img, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ18shfl_vertical_shflPjiiE4sums, $$img, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ18shfl_vertical_shflPjiiE4sums, $$img, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_3($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ18shfl_vertical_shflPjiiE4sums, $$img, _TRACKING;



const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

const {:existential true} _b4: bool;

const _WATCHED_VALUE_$$img: bv32;

procedure {:inline 1} _LOG_READ_$$img(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$img;



implementation {:inline 1} _LOG_READ_$$img(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then true else _READ_HAS_OCCURRED_$$img);
    return;
}



procedure _CHECK_READ_$$img(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$img);
  requires {:source_name "img"} {:array "$$img"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$img: bool;

procedure {:inline 1} _LOG_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$img, _WRITE_READ_BENIGN_FLAG_$$img;



implementation {:inline 1} _LOG_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then true else _WRITE_HAS_OCCURRED_$$img);
    _WRITE_READ_BENIGN_FLAG_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$img);
    return;
}



procedure _CHECK_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img != _value);
  requires {:source_name "img"} {:array "$$img"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img != _value);
  requires {:source_name "img"} {:array "$$img"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$img(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$img;



implementation {:inline 1} _LOG_ATOMIC_$$img(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$img);
    return;
}



procedure _CHECK_ATOMIC_$$img(_P: bool, _offset: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);
  requires {:source_name "img"} {:array "$$img"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$img(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$img;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$img(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$img := (if _P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$img);
    return;
}



const _WATCHED_VALUE_$$_ZZ18shfl_vertical_shflPjiiE4sums: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ18shfl_vertical_shflPjiiE4sums(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;



implementation {:inline 1} _LOG_READ_$$_ZZ18shfl_vertical_shflPjiiE4sums(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18shfl_vertical_shflPjiiE4sums == _value then true else _READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums);
    return;
}



procedure _CHECK_READ_$$_ZZ18shfl_vertical_shflPjiiE4sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sums"} {:array "$$_ZZ18shfl_vertical_shflPjiiE4sums"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sums"} {:array "$$_ZZ18shfl_vertical_shflPjiiE4sums"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ18shfl_vertical_shflPjiiE4sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums, _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums;



implementation {:inline 1} _LOG_WRITE_$$_ZZ18shfl_vertical_shflPjiiE4sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18shfl_vertical_shflPjiiE4sums == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18shfl_vertical_shflPjiiE4sums == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums);
    return;
}



procedure _CHECK_WRITE_$$_ZZ18shfl_vertical_shflPjiiE4sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sums"} {:array "$$_ZZ18shfl_vertical_shflPjiiE4sums"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18shfl_vertical_shflPjiiE4sums != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sums"} {:array "$$_ZZ18shfl_vertical_shflPjiiE4sums"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18shfl_vertical_shflPjiiE4sums != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sums"} {:array "$$_ZZ18shfl_vertical_shflPjiiE4sums"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ18shfl_vertical_shflPjiiE4sums(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ18shfl_vertical_shflPjiiE4sums(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ18shfl_vertical_shflPjiiE4sums(_P: bool, _offset: bv32);
  requires {:source_name "sums"} {:array "$$_ZZ18shfl_vertical_shflPjiiE4sums"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sums"} {:array "$$_ZZ18shfl_vertical_shflPjiiE4sums"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ18shfl_vertical_shflPjiiE4sums);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$img;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$img;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$img;
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
    havoc $$img;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ18shfl_vertical_shflPjiiE4sums;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$img;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$img;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$img;
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
    havoc $$img;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ18shfl_vertical_shflPjiiE4sums;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$img;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$img;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$img;
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
    havoc $$img;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ18shfl_vertical_shflPjiiE4sums;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_3($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ18shfl_vertical_shflPjiiE4sums;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$img;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$img;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$img;
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
    havoc $$img;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ18shfl_vertical_shflPjiiE4sums;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

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

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const {:existential true} _b17: bool;

const {:existential true} _b18: bool;

const {:existential true} _b19: bool;

const {:existential true} _b20: bool;

const {:existential true} _b21: bool;

const {:existential true} _b22: bool;
