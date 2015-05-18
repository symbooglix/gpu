type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_Dst"} {:global} $$d_Dst: [bv32]bv32;

axiom {:array_info "$$d_Dst"} {:global} {:elem_width 32} {:source_name "d_Dst"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Dst: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Dst: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Dst: bool;

axiom {:array_info "$$d_Src"} {:global} {:elem_width 32} {:source_name "d_Src"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Src: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Src: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Src: bool;

var {:source_name "s_Data"} {:group_shared} $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data"} {:group_shared} {:elem_width 32} {:source_name "s_Data"} {:source_elem_width 32} {:source_dimensions "16,81"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,81"} _READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,81"} _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,81"} _ATOMIC_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data: bool;

var {:source_name "c_Kernel"} {:constant} $$c_Kernel$1: [bv32]bv32;

var {:source_name "c_Kernel"} {:constant} $$c_Kernel$2: [bv32]bv32;

axiom {:array_info "$$c_Kernel"} {:constant} {:elem_width 32} {:source_name "c_Kernel"} {:source_elem_width 32} {:source_dimensions "17"} true;

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

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "convolutionColumnsKernel"} {:kernel} $_Z24convolutionColumnsKernelPfS_iii($imageW: bv32, $imageH: bv32, $pitch: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $pitch == 3072bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$d_Dst && !_WRITE_HAS_OCCURRED_$$d_Dst && !_ATOMIC_HAS_OCCURRED_$$d_Dst;
  requires !_READ_HAS_OCCURRED_$$d_Src && !_WRITE_HAS_OCCURRED_$$d_Src && !_ATOMIC_HAS_OCCURRED_$$d_Src;
  requires !_READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data && !_WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data && !_ATOMIC_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data;
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
  modifies $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data, $$d_Dst, _TRACKING, _WRITE_HAS_OCCURRED_$$d_Dst, _WRITE_READ_BENIGN_FLAG_$$d_Dst, _WRITE_READ_BENIGN_FLAG_$$d_Dst, _READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data, _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data, _WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data, _WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data;



implementation {:source_name "convolutionColumnsKernel"} {:kernel} $_Z24convolutionColumnsKernelPfS_iii($imageW: bv32, $imageH: bv32, $pitch: bv32)
{
  var $i.0: bv32;
  var $i1.0: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $i2.0: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $i3.0: bv32;
  var $sum.0$1: bv32;
  var $sum.0$2: bv32;
  var $j.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9: bool;
  var v10$1: bool;
  var v10$2: bool;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12: bool;
  var v13: bool;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, 16bv32), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, 16bv32), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(BV32_SUB(BV32_MUL(group_id_y$1, 8bv32), 1bv32), 8bv32), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(BV32_SUB(BV32_MUL(group_id_y$2, 8bv32), 1bv32), 8bv32), local_id_y$2);
    v2$1 := BV32_ADD(BV32_MUL(v1$1, $pitch), v0$1);
    v2$2 := BV32_ADD(BV32_MUL(v1$2, $pitch), v0$2);
    v3$1 := BV32_ADD(BV32_MUL(v1$1, $pitch), v0$1);
    v3$2 := BV32_ADD(BV32_MUL(v1$2, $pitch), v0$2);
    $i.0 := 1bv32;
    assume {:captureState "loop_entry_state_4_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_4"} true;
    assert {:tag "accessBreak"} _b26 ==> _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 81bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b25 ==> _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 8bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 8bv32), 1bv32), BV32_ADD(BV32_ADD(BV32_MUL(0bv32, 8bv32), local_id_y$1), BV32_MUL(local_id_x$1, 81bv32)));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($i.0, 1bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $i.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $i.0);
    assert {:block_sourceloc} {:sourceloc_num 2} true;
    v4 := BV32_SLT($i.0, 9bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v4 && !v4;
    $i1.0 := 0bv32;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "accessBreak"} _b28 ==> _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 81bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b27 ==> _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 8bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 8bv32), 1bv32), BV32_ADD(BV32_ADD(BV32_MUL(0bv32, 8bv32), local_id_y$1), BV32_MUL(local_id_x$1, 81bv32)));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b9 ==> BV32_UGE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b9 ==> BV32_UGE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_ULE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_ULE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b7 ==> BV32_SGE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b7 ==> BV32_SGE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b6 ==> BV32_SLE($i1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b6 ==> BV32_SLE($i1.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b5 ==> BV32_SLE(0bv32, $i1.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b5 ==> BV32_SLE(0bv32, $i1.0);
    assert {:block_sourceloc} {:sourceloc_num 8} true;
    v6 := BV32_SLT($i1.0, 1bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v6 && !v6;
    $i2.0 := 9bv32;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $12;

  $12:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "accessBreak"} _b30 ==> _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 81bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b29 ==> _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 8bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 8bv32), 1bv32), BV32_ADD(BV32_ADD(BV32_MUL(0bv32, 8bv32), local_id_y$1), BV32_MUL(local_id_x$1, 81bv32)));
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b14 ==> BV32_UGE($i2.0, 9bv32);
    assert {:tag "loopBound"} {:thread 2} _b14 ==> BV32_UGE($i2.0, 9bv32);
    assert {:tag "loopBound"} {:thread 1} _b13 ==> BV32_ULE($i2.0, 9bv32);
    assert {:tag "loopBound"} {:thread 2} _b13 ==> BV32_ULE($i2.0, 9bv32);
    assert {:tag "loopBound"} {:thread 1} _b12 ==> BV32_SGE($i2.0, 9bv32);
    assert {:tag "loopBound"} {:thread 2} _b12 ==> BV32_SGE($i2.0, 9bv32);
    assert {:tag "loopBound"} {:thread 1} _b11 ==> BV32_SLE($i2.0, 9bv32);
    assert {:tag "loopBound"} {:thread 2} _b11 ==> BV32_SLE($i2.0, 9bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b10 ==> BV32_SLE(0bv32, $i2.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b10 ==> BV32_SLE(0bv32, $i2.0);
    assert {:block_sourceloc} {:sourceloc_num 17} true;
    v9 := BV32_SLT($i2.0, 10bv32);
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    goto $truebb2, __partitioned_block_$falsebb2_0;

  __partitioned_block_$falsebb2_0:
    assume {:partition} !v9 && !v9;
    goto __partitioned_block_$falsebb2_1;

  __partitioned_block_$falsebb2_1:
    call {:sourceloc_num 26} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $i3.0 := 1bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $19;

  $19:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b31 ==> _READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 81bv32);
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b19 ==> BV32_UGE($i3.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b19 ==> BV32_UGE($i3.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b18 ==> BV32_ULE($i3.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b18 ==> BV32_ULE($i3.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b17 ==> BV32_SGE($i3.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b17 ==> BV32_SGE($i3.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b16 ==> BV32_SLE($i3.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b16 ==> BV32_SLE($i3.0, 1bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b15 ==> BV32_SLE(0bv32, $i3.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b15 ==> BV32_SLE(0bv32, $i3.0);
    assert {:block_sourceloc} {:sourceloc_num 27} true;
    v12 := BV32_SLT($i3.0, 9bv32);
    goto $truebb4, $falsebb4;

  $falsebb4:
    assume {:partition} !v12 && !v12;
    return;

  $truebb4:
    assume {:partition} v12 && v12;
    $sum.0$1, $j.0 := 0bv32, 4294967288bv32;
    $sum.0$2 := 0bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $21;

  $21:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessBreak"} _b32 ==> _READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> local_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 81bv32);
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b24 ==> BV32_UGE($j.0, 4294967288bv32);
    assert {:tag "loopBound"} {:thread 2} _b24 ==> BV32_UGE($j.0, 4294967288bv32);
    assert {:tag "loopBound"} {:thread 1} _b23 ==> BV32_ULE($j.0, 4294967288bv32);
    assert {:tag "loopBound"} {:thread 2} _b23 ==> BV32_ULE($j.0, 4294967288bv32);
    assert {:tag "loopBound"} {:thread 1} _b22 ==> BV32_SGE($j.0, 4294967288bv32);
    assert {:tag "loopBound"} {:thread 2} _b22 ==> BV32_SGE($j.0, 4294967288bv32);
    assert {:tag "loopBound"} {:thread 1} _b21 ==> BV32_SLE($j.0, 4294967288bv32);
    assert {:tag "loopBound"} {:thread 2} _b21 ==> BV32_SLE($j.0, 4294967288bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b20 ==> BV32_SLE(0bv32, $j.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b20 ==> BV32_SLE(0bv32, $j.0);
    assert {:block_sourceloc} {:sourceloc_num 29} true;
    v13 := BV32_SLE($j.0, 8bv32);
    goto $truebb5, $falsebb5;

  $falsebb5:
    assume {:partition} !v13 && !v13;
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$d_Dst(true, BV32_ADD(v3$1, BV32_MUL(BV32_MUL($i3.0, 8bv32), $pitch)), $sum.0$1, $$d_Dst[BV32_ADD(v3$1, BV32_MUL(BV32_MUL($i3.0, 8bv32), $pitch))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Dst(true, BV32_ADD(v3$2, BV32_MUL(BV32_MUL($i3.0, 8bv32), $pitch)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$d_Dst(true, BV32_ADD(v3$2, BV32_MUL(BV32_MUL($i3.0, 8bv32), $pitch)), $sum.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Dst"} true;
    $$d_Dst[BV32_ADD(v3$1, BV32_MUL(BV32_MUL($i3.0, 8bv32), $pitch))] := $sum.0$1;
    $$d_Dst[BV32_ADD(v3$2, BV32_MUL(BV32_MUL($i3.0, 8bv32), $pitch))] := $sum.0$2;
    $i3.0 := BV32_ADD($i3.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $19;

  $truebb5:
    assume {:partition} v13 && v13;
    v14$1 := $$c_Kernel$1[BV32_SUB(8bv32, $j.0)];
    v14$2 := $$c_Kernel$2[BV32_SUB(8bv32, $j.0)];
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(true, BV32_ADD(BV32_MUL(local_id_x$1, 81bv32), BV32_ADD(BV32_ADD(local_id_y$1, BV32_MUL($i3.0, 8bv32)), $j.0)), $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 81bv32), BV32_ADD(BV32_ADD(local_id_y$1, BV32_MUL($i3.0, 8bv32)), $j.0))]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(true, BV32_ADD(BV32_MUL(local_id_x$2, 81bv32), BV32_ADD(BV32_ADD(local_id_y$2, BV32_MUL($i3.0, 8bv32)), $j.0)), $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 81bv32), BV32_ADD(BV32_ADD(local_id_y$2, BV32_MUL($i3.0, 8bv32)), $j.0))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data"} true;
    v15$1 := $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 81bv32), BV32_ADD(BV32_ADD(local_id_y$1, BV32_MUL($i3.0, 8bv32)), $j.0))];
    v15$2 := $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 81bv32), BV32_ADD(BV32_ADD(local_id_y$2, BV32_MUL($i3.0, 8bv32)), $j.0))];
    $sum.0$1, $j.0 := FADD32($sum.0$1, FMUL32(v14$1, v15$1)), BV32_ADD($j.0, 1bv32);
    $sum.0$2 := FADD32($sum.0$2, FMUL32(v14$2, v15$2));
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $21;

  $truebb2:
    assume {:partition} v9 && v9;
    v10$1 := BV32_SGT(BV32_SUB($imageH, v1$1), BV32_MUL($i2.0, 8bv32));
    v10$2 := BV32_SGT(BV32_SUB($imageH, v1$2), BV32_MUL($i2.0, 8bv32));
    p3$1 := (if v10$1 then v10$1 else p3$1);
    p3$2 := (if v10$2 then v10$2 else p3$2);
    p2$1 := (if !v10$1 then !v10$1 else p2$1);
    p2$2 := (if !v10$2 then !v10$2 else p2$2);
    $1$1 := (if p2$1 then 0bv32 else $1$1);
    $1$2 := (if p2$2 then 0bv32 else $1$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v11$1 := (if p3$1 then _HAVOC_bv32$1 else v11$1);
    v11$2 := (if p3$2 then _HAVOC_bv32$2 else v11$2);
    $1$1 := (if p3$1 then v11$1 else $1$1);
    $1$2 := (if p3$2 then v11$2 else $1$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(true, BV32_ADD(BV32_MUL(local_id_x$1, 81bv32), BV32_ADD(local_id_y$1, BV32_MUL($i2.0, 8bv32))), $1$1, $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 81bv32), BV32_ADD(local_id_y$1, BV32_MUL($i2.0, 8bv32)))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(true, BV32_ADD(BV32_MUL(local_id_x$2, 81bv32), BV32_ADD(local_id_y$2, BV32_MUL($i2.0, 8bv32))));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(true, BV32_ADD(BV32_MUL(local_id_x$2, 81bv32), BV32_ADD(local_id_y$2, BV32_MUL($i2.0, 8bv32))), $1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data"} true;
    $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 81bv32), BV32_ADD(local_id_y$1, BV32_MUL($i2.0, 8bv32)))] := $1$1;
    $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 81bv32), BV32_ADD(local_id_y$2, BV32_MUL($i2.0, 8bv32)))] := $1$2;
    $i2.0 := BV32_ADD($i2.0, 1bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $12;

  $truebb0:
    assume {:partition} v6 && v6;
    v7$1 := BV32_SGE(v1$1, BV32_MUL(BV32_SUB(0bv32, $i1.0), 8bv32));
    v7$2 := BV32_SGE(v1$2, BV32_MUL(BV32_SUB(0bv32, $i1.0), 8bv32));
    p1$1 := (if v7$1 then v7$1 else p1$1);
    p1$2 := (if v7$2 then v7$2 else p1$2);
    p0$1 := (if !v7$1 then !v7$1 else p0$1);
    p0$2 := (if !v7$2 then !v7$2 else p0$2);
    $0$1 := (if p0$1 then 0bv32 else $0$1);
    $0$2 := (if p0$2 then 0bv32 else $0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v8$1 := (if p1$1 then _HAVOC_bv32$1 else v8$1);
    v8$2 := (if p1$2 then _HAVOC_bv32$2 else v8$2);
    $0$1 := (if p1$1 then v8$1 else $0$1);
    $0$2 := (if p1$2 then v8$2 else $0$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(true, BV32_ADD(BV32_MUL(local_id_x$1, 81bv32), BV32_ADD(local_id_y$1, BV32_MUL($i1.0, 8bv32))), $0$1, $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 81bv32), BV32_ADD(local_id_y$1, BV32_MUL($i1.0, 8bv32)))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(true, BV32_ADD(BV32_MUL(local_id_x$2, 81bv32), BV32_ADD(local_id_y$2, BV32_MUL($i1.0, 8bv32))));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(true, BV32_ADD(BV32_MUL(local_id_x$2, 81bv32), BV32_ADD(local_id_y$2, BV32_MUL($i1.0, 8bv32))), $0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data"} true;
    $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 81bv32), BV32_ADD(local_id_y$1, BV32_MUL($i1.0, 8bv32)))] := $0$1;
    $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 81bv32), BV32_ADD(local_id_y$2, BV32_MUL($i1.0, 8bv32)))] := $0$2;
    $i1.0 := BV32_ADD($i1.0, 1bv32);
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $5;

  $truebb:
    assume {:partition} v4 && v4;
    havoc v5$1, v5$2;
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(true, BV32_ADD(BV32_MUL(local_id_x$1, 81bv32), BV32_ADD(local_id_y$1, BV32_MUL($i.0, 8bv32))), v5$1, $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 81bv32), BV32_ADD(local_id_y$1, BV32_MUL($i.0, 8bv32)))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(true, BV32_ADD(BV32_MUL(local_id_x$2, 81bv32), BV32_ADD(local_id_y$2, BV32_MUL($i.0, 8bv32))));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(true, BV32_ADD(BV32_MUL(local_id_x$2, 81bv32), BV32_ADD(local_id_y$2, BV32_MUL($i.0, 8bv32))), v5$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data"} true;
    $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data[1bv1][BV32_ADD(BV32_MUL(local_id_x$1, 81bv32), BV32_ADD(local_id_y$1, BV32_MUL($i.0, 8bv32)))] := v5$1;
    $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_x$2, 81bv32), BV32_ADD(local_id_y$2, BV32_MUL($i.0, 8bv32)))] := v5$2;
    $i.0 := BV32_ADD($i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_4_0"} true;
    goto $1;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 192bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 48bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data, $$d_Dst, _TRACKING;



const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

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

const _WATCHED_VALUE_$$d_Dst: bv32;

procedure {:inline 1} _LOG_READ_$$d_Dst(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Dst;



implementation {:inline 1} _LOG_READ_$$d_Dst(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Dst == _value then true else _READ_HAS_OCCURRED_$$d_Dst);
    return;
}



procedure _CHECK_READ_$$d_Dst(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Dst"} {:array "$$d_Dst"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Dst);
  requires {:source_name "d_Dst"} {:array "$$d_Dst"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Dst: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Dst(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Dst, _WRITE_READ_BENIGN_FLAG_$$d_Dst;



implementation {:inline 1} _LOG_WRITE_$$d_Dst(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Dst == _value then true else _WRITE_HAS_OCCURRED_$$d_Dst);
    _WRITE_READ_BENIGN_FLAG_$$d_Dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Dst == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Dst);
    return;
}



procedure _CHECK_WRITE_$$d_Dst(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Dst"} {:array "$$d_Dst"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Dst != _value);
  requires {:source_name "d_Dst"} {:array "$$d_Dst"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Dst != _value);
  requires {:source_name "d_Dst"} {:array "$$d_Dst"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Dst(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Dst;



implementation {:inline 1} _LOG_ATOMIC_$$d_Dst(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Dst);
    return;
}



procedure _CHECK_ATOMIC_$$d_Dst(_P: bool, _offset: bv32);
  requires {:source_name "d_Dst"} {:array "$$d_Dst"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Dst"} {:array "$$d_Dst"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Dst(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Dst;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Dst(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Dst := (if _P && _WRITE_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Dst);
    return;
}



const _WATCHED_VALUE_$$d_Src: bv32;

procedure {:inline 1} _LOG_READ_$$d_Src(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Src;



implementation {:inline 1} _LOG_READ_$$d_Src(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Src := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Src == _value then true else _READ_HAS_OCCURRED_$$d_Src);
    return;
}



procedure _CHECK_READ_$$d_Src(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Src"} {:array "$$d_Src"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Src);
  requires {:source_name "d_Src"} {:array "$$d_Src"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Src: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Src(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Src, _WRITE_READ_BENIGN_FLAG_$$d_Src;



implementation {:inline 1} _LOG_WRITE_$$d_Src(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Src := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Src == _value then true else _WRITE_HAS_OCCURRED_$$d_Src);
    _WRITE_READ_BENIGN_FLAG_$$d_Src := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Src == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Src);
    return;
}



procedure _CHECK_WRITE_$$d_Src(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Src"} {:array "$$d_Src"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Src != _value);
  requires {:source_name "d_Src"} {:array "$$d_Src"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Src != _value);
  requires {:source_name "d_Src"} {:array "$$d_Src"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Src(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Src;



implementation {:inline 1} _LOG_ATOMIC_$$d_Src(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Src := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Src);
    return;
}



procedure _CHECK_ATOMIC_$$d_Src(_P: bool, _offset: bv32);
  requires {:source_name "d_Src"} {:array "$$d_Src"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Src"} {:array "$$d_Src"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Src(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Src;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Src(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Src := (if _P && _WRITE_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Src);
    return;
}



const _WATCHED_VALUE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data;



implementation {:inline 1} _LOG_READ_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data == _value then true else _READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data);
    return;
}



procedure _CHECK_READ_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_Data"} {:array "$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Data"} {:array "$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data, _WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data;



implementation {:inline 1} _LOG_WRITE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data);
    return;
}



procedure _CHECK_WRITE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_Data"} {:array "$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Data"} {:array "$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Data"} {:array "$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(_P: bool, _offset: bv32);
  requires {:source_name "s_Data"} {:array "$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Data"} {:array "$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_Dst;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_Dst;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_Dst;
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
    havoc $$d_Dst;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ24convolutionColumnsKernelPfS_iiiE6s_Data;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b25: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b26: bool;

const {:existential true} _b27: bool;

const {:existential true} _b28: bool;

const {:existential true} _b29: bool;

const {:existential true} _b30: bool;

const {:existential true} _b31: bool;

const {:existential true} _b32: bool;
