type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "odata"} {:global} $$odata: [bv32]bv32;

axiom {:array_info "$$odata"} {:global} {:elem_width 32} {:source_name "odata"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$odata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$odata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$odata: bool;

axiom {:array_info "$$idata"} {:global} {:elem_width 32} {:source_name "idata"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$idata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$idata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$idata: bool;

var {:source_name "tile"} {:group_shared} $$_ZZ18transposeCoalescedPfS_iiiE4tile: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ18transposeCoalescedPfS_iiiE4tile"} {:group_shared} {:elem_width 32} {:source_name "tile"} {:source_elem_width 32} {:source_dimensions "16,16"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _READ_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _ATOMIC_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "transposeCoalesced"} {:kernel} $_Z18transposeCoalescedPfS_iii($width: bv32, $height: bv32, $nreps: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $height == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $nreps == 1bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$odata && !_WRITE_HAS_OCCURRED_$$odata && !_ATOMIC_HAS_OCCURRED_$$odata;
  requires !_READ_HAS_OCCURRED_$$idata && !_WRITE_HAS_OCCURRED_$$idata && !_ATOMIC_HAS_OCCURRED_$$idata;
  requires !_READ_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile && !_WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile && !_ATOMIC_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile;
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
  modifies $$_ZZ18transposeCoalescedPfS_iiiE4tile, $$odata, _TRACKING, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile, _WRITE_HAS_OCCURRED_$$odata, _WRITE_READ_BENIGN_FLAG_$$odata, _WRITE_READ_BENIGN_FLAG_$$odata, _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile, _WRITE_READ_BENIGN_FLAG_$$_ZZ18transposeCoalescedPfS_iiiE4tile, _WRITE_READ_BENIGN_FLAG_$$_ZZ18transposeCoalescedPfS_iiiE4tile;



implementation {:source_name "transposeCoalesced"} {:kernel} $_Z18transposeCoalescedPfS_iii($width: bv32, $height: bv32, $nreps: bv32)
{
  var $r.0: bv32;
  var $i.0: bv32;
  var $i1.0: bv32;
  var v0: bool;
  var v1: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3: bool;
  var v4$1: bv32;
  var v4$2: bv32;


  $0:
    $r.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b24 ==> _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile ==> local_id_y$1 == BV32_DIV(_WATCHED_OFFSET, 16bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b23 ==> _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile ==> BV32_AND(BV32_SUB(BV32_MUL(16bv32, 16bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(16bv32, 16bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, local_id_y$1), 16bv32), local_id_x$1));
    assert {:tag "nowrite"} _b22 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile;
    assert {:tag "accessBreak"} _b21 ==> _WRITE_HAS_OCCURRED_$$odata ==> local_id_y$1 == BV32_SUB(BV32_SUB(BV32_DIV(_WATCHED_OFFSET, $height), BV32_DIV(BV32_MUL(group_id_y$1, 16bv32), $height)), BV32_MUL(group_id_x$1, 16bv32));
    assert {:tag "accessBreak"} _b20 ==> _WRITE_HAS_OCCURRED_$$odata ==> group_id_x$1 == BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, $height), 16bv32), BV32_DIV(group_id_y$1, $height)), BV32_DIV(local_id_y$1, 16bv32));
    assert {:tag "accessBreak"} _b19 ==> _WRITE_HAS_OCCURRED_$$odata ==> group_id_y$1 == BV32_SUB(BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 16bv32), BV32_MUL(group_id_x$1, $height)), BV32_DIV(BV32_MUL(local_id_y$1, $height), 16bv32));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b18 ==> _WRITE_HAS_OCCURRED_$$odata ==> BV32_AND(BV32_SUB(BV32_MUL(16bv32, $height), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(16bv32, $height), 1bv32), BV32_ADD(BV32_MUL(0bv32, $height), BV32_ADD(BV32_ADD(BV32_MUL(group_id_y$1, 16bv32), local_id_x$1), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, 16bv32), local_id_y$1), $height))));
    assert {:tag "nowrite"} _b17 ==> !_WRITE_HAS_OCCURRED_$$odata;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($r.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($r.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($r.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($r.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($r.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($r.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($r.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($r.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $r.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $r.0);
    assert {:block_sourceloc} {:sourceloc_num 4} true;
    v0 := BV32_SLT($r.0, $nreps);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v0 && !v0;
    return;

  $truebb:
    assume {:partition} v0 && v0;
    $i.0 := 0bv32;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "accessBreak"} _b26 ==> _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile ==> local_id_y$1 == BV32_DIV(_WATCHED_OFFSET, 16bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b25 ==> _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile ==> BV32_AND(BV32_SUB(BV32_MUL(16bv32, 16bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(16bv32, 16bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, local_id_y$1), 16bv32), local_id_x$1));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b10 ==> BV32_UGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b10 ==> BV32_UGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b9 ==> BV32_ULE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b9 ==> BV32_ULE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_SGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_SGE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b7 ==> BV32_SLE($i.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b7 ==> BV32_SLE($i.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b6 ==> BV32_SLE(0bv32, $i.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b6 ==> BV32_SLE(0bv32, $i.0);
    assert {:tag "loopCounterIsStrided"} {:thread 1} _b5 ==> BV32_AND(BV32_SUB(16bv32, 1bv32), $i.0) == BV32_AND(BV32_SUB(16bv32, 1bv32), 0bv32);
    assert {:tag "loopCounterIsStrided"} {:thread 2} _b5 ==> BV32_AND(BV32_SUB(16bv32, 1bv32), $i.0) == BV32_AND(BV32_SUB(16bv32, 1bv32), 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 6} true;
    v1 := BV32_SLT($i.0, 16bv32);
    goto $truebb0, __partitioned_block_$falsebb0_0;

  __partitioned_block_$falsebb0_0:
    assume {:partition} !v1 && !v1;
    goto __partitioned_block_$falsebb0_1;

  __partitioned_block_$falsebb0_1:
    call {:sourceloc_num 12} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $i1.0 := 0bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessBreak"} _b30 ==> _WRITE_HAS_OCCURRED_$$odata ==> local_id_y$1 == BV32_SUB(BV32_SUB(BV32_DIV(_WATCHED_OFFSET, $height), BV32_DIV(BV32_MUL(group_id_y$1, 16bv32), $height)), BV32_MUL(group_id_x$1, 16bv32));
    assert {:tag "accessBreak"} _b29 ==> _WRITE_HAS_OCCURRED_$$odata ==> group_id_x$1 == BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, $height), 16bv32), BV32_DIV(group_id_y$1, $height)), BV32_DIV(local_id_y$1, 16bv32));
    assert {:tag "accessBreak"} _b28 ==> _WRITE_HAS_OCCURRED_$$odata ==> group_id_y$1 == BV32_SUB(BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 16bv32), BV32_MUL(group_id_x$1, $height)), BV32_DIV(BV32_MUL(local_id_y$1, $height), 16bv32));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b27 ==> _WRITE_HAS_OCCURRED_$$odata ==> BV32_AND(BV32_SUB(BV32_MUL(16bv32, $height), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(16bv32, $height), 1bv32), BV32_ADD(BV32_MUL(0bv32, $height), BV32_ADD(BV32_ADD(BV32_MUL(group_id_y$1, 16bv32), local_id_x$1), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, 16bv32), local_id_y$1), $height))));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b16 ==> BV32_UGE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b16 ==> BV32_UGE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b15 ==> BV32_ULE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b15 ==> BV32_ULE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b14 ==> BV32_SGE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b14 ==> BV32_SGE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b13 ==> BV32_SLE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b13 ==> BV32_SLE($i1.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b12 ==> BV32_SLE(0bv32, $i1.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b12 ==> BV32_SLE(0bv32, $i1.0);
    assert {:tag "loopCounterIsStrided"} {:thread 1} _b11 ==> BV32_AND(BV32_SUB(16bv32, 1bv32), $i1.0) == BV32_AND(BV32_SUB(16bv32, 1bv32), 0bv32);
    assert {:tag "loopCounterIsStrided"} {:thread 2} _b11 ==> BV32_AND(BV32_SUB(16bv32, 1bv32), $i1.0) == BV32_AND(BV32_SUB(16bv32, 1bv32), 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 13} true;
    v3 := BV32_SLT($i1.0, 16bv32);
    goto $truebb1, __partitioned_block_$falsebb1_0;

  __partitioned_block_$falsebb1_0:
    assume {:partition} !v3 && !v3;
    goto __partitioned_block_$falsebb1_1;

  __partitioned_block_$falsebb1_1:
    call {:sourceloc_num 19} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    $r.0 := BV32_ADD($r.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $truebb1:
    assume {:partition} v3 && v3;
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 15} true;
    v4$1 := $$_ZZ18transposeCoalescedPfS_iiiE4tile[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 16bv32), BV32_ADD(local_id_y$1, $i1.0))];
    v4$2 := $$_ZZ18transposeCoalescedPfS_iiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 16bv32), BV32_ADD(local_id_y$2, $i1.0))];
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$odata(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_y$1, 16bv32), local_id_x$1), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, 16bv32), local_id_y$1), $height)), BV32_MUL($i1.0, $height)), v4$1, $$odata[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_y$1, 16bv32), local_id_x$1), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, 16bv32), local_id_y$1), $height)), BV32_MUL($i1.0, $height))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$odata(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_y$2, 16bv32), local_id_x$2), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$2, 16bv32), local_id_y$2), $height)), BV32_MUL($i1.0, $height)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$odata(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_y$2, 16bv32), local_id_x$2), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$2, 16bv32), local_id_y$2), $height)), BV32_MUL($i1.0, $height)), v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$odata"} true;
    $$odata[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_y$1, 16bv32), local_id_x$1), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, 16bv32), local_id_y$1), $height)), BV32_MUL($i1.0, $height))] := v4$1;
    $$odata[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(group_id_y$2, 16bv32), local_id_x$2), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$2, 16bv32), local_id_y$2), $height)), BV32_MUL($i1.0, $height))] := v4$2;
    $i1.0 := BV32_ADD($i1.0, 16bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $7;

  $truebb0:
    assume {:partition} v1 && v1;
    havoc v2$1, v2$2;
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$_ZZ18transposeCoalescedPfS_iiiE4tile(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $i.0), 16bv32), local_id_x$1), v2$1, $$_ZZ18transposeCoalescedPfS_iiiE4tile[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $i.0), 16bv32), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18transposeCoalescedPfS_iiiE4tile(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $i.0), 16bv32), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$_ZZ18transposeCoalescedPfS_iiiE4tile(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $i.0), 16bv32), local_id_x$2), v2$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18transposeCoalescedPfS_iiiE4tile"} true;
    $$_ZZ18transposeCoalescedPfS_iiiE4tile[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$1, $i.0), 16bv32), local_id_x$1)] := v2$1;
    $$_ZZ18transposeCoalescedPfS_iiiE4tile[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(local_id_y$2, $i.0), 16bv32), local_id_x$2)] := v2$2;
    $i.0 := BV32_ADD($i.0, 16bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $3;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 64bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ18transposeCoalescedPfS_iiiE4tile, $$odata, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ18transposeCoalescedPfS_iiiE4tile, $$odata, _TRACKING;



function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

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

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const _WATCHED_VALUE_$$odata: bv32;

procedure {:inline 1} _LOG_READ_$$odata(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$odata;



implementation {:inline 1} _LOG_READ_$$odata(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata == _value then true else _READ_HAS_OCCURRED_$$odata);
    return;
}



procedure _CHECK_READ_$$odata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$odata);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$odata: bool;

procedure {:inline 1} _LOG_WRITE_$$odata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$odata, _WRITE_READ_BENIGN_FLAG_$$odata;



implementation {:inline 1} _LOG_WRITE_$$odata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata == _value then true else _WRITE_HAS_OCCURRED_$$odata);
    _WRITE_READ_BENIGN_FLAG_$$odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$odata);
    return;
}



procedure _CHECK_WRITE_$$odata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata != _value);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$odata != _value);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$odata(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$odata;



implementation {:inline 1} _LOG_ATOMIC_$$odata(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$odata);
    return;
}



procedure _CHECK_ATOMIC_$$odata(_P: bool, _offset: bv32);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset);
  requires {:source_name "odata"} {:array "$$odata"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$odata(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$odata;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$odata(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$odata := (if _P && _WRITE_HAS_OCCURRED_$$odata && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$odata);
    return;
}



const _WATCHED_VALUE_$$idata: bv32;

procedure {:inline 1} _LOG_READ_$$idata(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$idata;



implementation {:inline 1} _LOG_READ_$$idata(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idata == _value then true else _READ_HAS_OCCURRED_$$idata);
    return;
}



procedure _CHECK_READ_$$idata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "idata"} {:array "$$idata"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$idata);
  requires {:source_name "idata"} {:array "$$idata"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$idata: bool;

procedure {:inline 1} _LOG_WRITE_$$idata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$idata, _WRITE_READ_BENIGN_FLAG_$$idata;



implementation {:inline 1} _LOG_WRITE_$$idata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idata == _value then true else _WRITE_HAS_OCCURRED_$$idata);
    _WRITE_READ_BENIGN_FLAG_$$idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idata == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$idata);
    return;
}



procedure _CHECK_WRITE_$$idata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "idata"} {:array "$$idata"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idata != _value);
  requires {:source_name "idata"} {:array "$$idata"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idata != _value);
  requires {:source_name "idata"} {:array "$$idata"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$idata(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$idata;



implementation {:inline 1} _LOG_ATOMIC_$$idata(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$idata);
    return;
}



procedure _CHECK_ATOMIC_$$idata(_P: bool, _offset: bv32);
  requires {:source_name "idata"} {:array "$$idata"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset);
  requires {:source_name "idata"} {:array "$$idata"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$idata(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$idata;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$idata(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$idata := (if _P && _WRITE_HAS_OCCURRED_$$idata && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$idata);
    return;
}



const _WATCHED_VALUE_$$_ZZ18transposeCoalescedPfS_iiiE4tile: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ18transposeCoalescedPfS_iiiE4tile(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile;



implementation {:inline 1} _LOG_READ_$$_ZZ18transposeCoalescedPfS_iiiE4tile(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18transposeCoalescedPfS_iiiE4tile == _value then true else _READ_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile);
    return;
}



procedure _CHECK_READ_$$_ZZ18transposeCoalescedPfS_iiiE4tile(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "tile"} {:array "$$_ZZ18transposeCoalescedPfS_iiiE4tile"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ18transposeCoalescedPfS_iiiE4tile && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tile"} {:array "$$_ZZ18transposeCoalescedPfS_iiiE4tile"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ18transposeCoalescedPfS_iiiE4tile: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ18transposeCoalescedPfS_iiiE4tile(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile, _WRITE_READ_BENIGN_FLAG_$$_ZZ18transposeCoalescedPfS_iiiE4tile;



implementation {:inline 1} _LOG_WRITE_$$_ZZ18transposeCoalescedPfS_iiiE4tile(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18transposeCoalescedPfS_iiiE4tile == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ18transposeCoalescedPfS_iiiE4tile := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18transposeCoalescedPfS_iiiE4tile == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ18transposeCoalescedPfS_iiiE4tile);
    return;
}



procedure _CHECK_WRITE_$$_ZZ18transposeCoalescedPfS_iiiE4tile(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "tile"} {:array "$$_ZZ18transposeCoalescedPfS_iiiE4tile"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18transposeCoalescedPfS_iiiE4tile != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tile"} {:array "$$_ZZ18transposeCoalescedPfS_iiiE4tile"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18transposeCoalescedPfS_iiiE4tile != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tile"} {:array "$$_ZZ18transposeCoalescedPfS_iiiE4tile"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ18transposeCoalescedPfS_iiiE4tile(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ18transposeCoalescedPfS_iiiE4tile(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ18transposeCoalescedPfS_iiiE4tile(_P: bool, _offset: bv32);
  requires {:source_name "tile"} {:array "$$_ZZ18transposeCoalescedPfS_iiiE4tile"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "tile"} {:array "$$_ZZ18transposeCoalescedPfS_iiiE4tile"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18transposeCoalescedPfS_iiiE4tile(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ18transposeCoalescedPfS_iiiE4tile;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18transposeCoalescedPfS_iiiE4tile(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ18transposeCoalescedPfS_iiiE4tile := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ18transposeCoalescedPfS_iiiE4tile);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$odata;
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
    havoc $$odata;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ18transposeCoalescedPfS_iiiE4tile;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ18transposeCoalescedPfS_iiiE4tile;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$odata;
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
    havoc $$odata;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ18transposeCoalescedPfS_iiiE4tile;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b17: bool;

const {:existential true} _b18: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

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
