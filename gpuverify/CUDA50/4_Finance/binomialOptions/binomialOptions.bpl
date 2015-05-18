type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_OptionData"} {:global} $$d_OptionData: [bv32]bv32;

axiom {:array_info "$$d_OptionData"} {:global} {:elem_width 32} {:source_name "d_OptionData"} {:source_elem_width 160} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 160} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_OptionData: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 160} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_OptionData: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 160} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_OptionData: bool;

var {:source_name "d_CallValue"} {:global} $$d_CallValue: [bv32]bv32;

axiom {:array_info "$$d_CallValue"} {:global} {:elem_width 32} {:source_name "d_CallValue"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_CallValue: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_CallValue: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_CallValue: bool;

var {:source_name "d_CallBuffer"} {:global} $$d_CallBuffer: [bv32]bv32;

axiom {:array_info "$$d_CallBuffer"} {:global} {:elem_width 32} {:source_name "d_CallBuffer"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_CallBuffer: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_CallBuffer: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_CallBuffer: bool;

var {:source_name "callA"} {:group_shared} $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA"} {:group_shared} {:elem_width 32} {:source_name "callA"} {:source_elem_width 32} {:source_dimensions "257"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA: bool;

var {:source_name "callB"} {:group_shared} $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB"} {:group_shared} {:elem_width 32} {:source_name "callB"} {:source_elem_width 32} {:source_dimensions "257"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB: bool;

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

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "binomialOptionsKernel"} {:kernel} $_Z21binomialOptionsKernelP13__TOptionDataPfS1_();
  requires !_READ_HAS_OCCURRED_$$d_OptionData && !_WRITE_HAS_OCCURRED_$$d_OptionData && !_ATOMIC_HAS_OCCURRED_$$d_OptionData;
  requires !_READ_HAS_OCCURRED_$$d_CallValue && !_WRITE_HAS_OCCURRED_$$d_CallValue && !_ATOMIC_HAS_OCCURRED_$$d_CallValue;
  requires !_READ_HAS_OCCURRED_$$d_CallBuffer && !_WRITE_HAS_OCCURRED_$$d_CallBuffer && !_ATOMIC_HAS_OCCURRED_$$d_CallBuffer;
  requires !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA && !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA && !_ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
  requires !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB && !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB && !_ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
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
  modifies $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA, $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB, _WRITE_HAS_OCCURRED_$$d_CallBuffer, _WRITE_READ_BENIGN_FLAG_$$d_CallBuffer, _WRITE_READ_BENIGN_FLAG_$$d_CallBuffer, _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA, _WRITE_HAS_OCCURRED_$$d_CallValue, _WRITE_READ_BENIGN_FLAG_$$d_CallValue, _WRITE_READ_BENIGN_FLAG_$$d_CallValue, $$d_CallValue, $$d_CallBuffer, _TRACKING, _READ_HAS_OCCURRED_$$d_CallBuffer, _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA, _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA, _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA, _TRACKING, _TRACKING, _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB, _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB, _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;



implementation {:source_name "binomialOptionsKernel"} {:kernel} $_Z21binomialOptionsKernelP13__TOptionDataPfS1_()
{
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $i1.0: bv32;
  var $c_base.0: bv32;
  var $1: bv32;
  var $k.0: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bool;
  var v9$2: bool;
  var v10: bool;
  var v11: bool;
  var v12: bool;
  var v13: bv32;
  var v14$1: bool;
  var v14$2: bool;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16: bool;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bool;
  var v21$2: bool;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bool;
  var v23$2: bool;
  var v24$1: bv32;
  var v24$2: bv32;
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


  $0:
    v0$1 := BV32_MUL(group_id_x$1, 2064bv32);
    v0$2 := BV32_MUL(group_id_x$2, 2064bv32);
    v1$1 := $$d_OptionData[BV32_MUL(group_id_x$1, 5bv32)];
    v1$2 := $$d_OptionData[BV32_MUL(group_id_x$2, 5bv32)];
    v2$1 := $$d_OptionData[BV32_ADD(BV32_MUL(group_id_x$1, 5bv32), 1bv32)];
    v2$2 := $$d_OptionData[BV32_ADD(BV32_MUL(group_id_x$2, 5bv32), 1bv32)];
    v3$1 := $$d_OptionData[BV32_ADD(BV32_MUL(group_id_x$1, 5bv32), 2bv32)];
    v3$2 := $$d_OptionData[BV32_ADD(BV32_MUL(group_id_x$2, 5bv32), 2bv32)];
    v4$1 := $$d_OptionData[BV32_ADD(BV32_MUL(group_id_x$1, 5bv32), 3bv32)];
    v4$2 := $$d_OptionData[BV32_ADD(BV32_MUL(group_id_x$2, 5bv32), 3bv32)];
    v5$1 := $$d_OptionData[BV32_ADD(BV32_MUL(group_id_x$1, 5bv32), 4bv32)];
    v5$2 := $$d_OptionData[BV32_ADD(BV32_MUL(group_id_x$2, 5bv32), 4bv32)];
    $i.0$1 := local_id_x$1;
    $i.0$2 := local_id_x$2;
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "accessBreak"} _b26 ==> _WRITE_HAS_OCCURRED_$$d_CallBuffer ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 2064bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b25 ==> _WRITE_HAS_OCCURRED_$$d_CallBuffer ==> BV32_AND(BV32_SUB(256bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(256bv32, 1bv32), BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, 2064bv32)));
    assert {:tag "accessUpperBoundBlock"} _b24 ==> _WRITE_HAS_OCCURRED_$$d_CallBuffer ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), 2064bv32));
    assert {:tag "accessLowerBoundBlock"} _b23 ==> _WRITE_HAS_OCCURRED_$$d_CallBuffer ==> BV32_SLE(BV32_MUL(group_id_x$1, 2064bv32), _WATCHED_OFFSET);
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b6 ==> BV32_SLE($i.0$1, 2048bv32) ==> p0$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b6 ==> BV32_SLE($i.0$2, 2048bv32) ==> p0$2;
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b5 ==> BV32_UGE($i.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b5 ==> BV32_UGE($i.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b4 ==> BV32_ULE($i.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b4 ==> BV32_ULE($i.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b3 ==> BV32_SGE($i.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b3 ==> BV32_SGE($i.0$2, local_id_x$2);
    assert {:tag "loopBound"} {:thread 1} p0$1 ==> _b2 ==> BV32_SLE($i.0$1, local_id_x$1);
    assert {:tag "loopBound"} {:thread 2} p0$2 ==> _b2 ==> BV32_SLE($i.0$2, local_id_x$2);
    assert {:tag "guardNonNeg"} {:thread 1} p0$1 ==> _b1 ==> BV32_SLE(0bv32, $i.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p0$2 ==> _b1 ==> BV32_SLE(0bv32, $i.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p0$1 ==> _b0 ==> BV32_AND(BV32_SUB(256bv32, 1bv32), $i.0$1) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$1);
    assert {:tag "loopCounterIsStrided"} {:thread 2} p0$2 ==> _b0 ==> BV32_AND(BV32_SUB(256bv32, 1bv32), $i.0$2) == BV32_AND(BV32_SUB(256bv32, 1bv32), local_id_x$2);
    assert {:block_sourceloc} {:sourceloc_num 6} p0$1 ==> true;
    v6$1 := (if p0$1 then BV32_SLE($i.0$1, 2048bv32) else v6$1);
    v6$2 := (if p0$2 then BV32_SLE($i.0$2, 2048bv32) else v6$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p1$1 := (if p0$1 && v6$1 then v6$1 else p1$1);
    p1$2 := (if p0$2 && v6$2 then v6$2 else p1$2);
    p0$1 := (if p0$1 && !v6$1 then v6$1 else p0$1);
    p0$2 := (if p0$2 && !v6$2 then v6$2 else p0$2);
    call {:sourceloc_num 8} v7$1, v7$2 := $expf(p1$1, FMUL32(v3$1, FSUB32(FMUL32(1073741824bv32, SI32_TO_FP32($i.0$1)), 1157627904bv32)), p1$2, FMUL32(v3$2, FSUB32(FMUL32(1073741824bv32, SI32_TO_FP32($i.0$2)), 1157627904bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "$expf"} true;
    v8$1 := (if p1$1 then FSUB32(FMUL32(v1$1, v7$1), v2$1) else v8$1);
    v8$2 := (if p1$2 then FSUB32(FMUL32(v1$2, v7$2), v2$2) else v8$2);
    v9$1 := (if p1$1 then FLT32(0bv32, v8$1) else v9$1);
    v9$2 := (if p1$2 then FLT32(0bv32, v8$2) else v9$2);
    p3$1 := (if p1$1 && v9$1 then v9$1 else p3$1);
    p3$2 := (if p1$2 && v9$2 then v9$2 else p3$2);
    p2$1 := (if p1$1 && !v9$1 then !v9$1 else p2$1);
    p2$2 := (if p1$2 && !v9$2 then !v9$2 else p2$2);
    $0$1 := (if p2$1 then 0bv32 else $0$1);
    $0$2 := (if p2$2 then 0bv32 else $0$2);
    $0$1 := (if p3$1 then v8$1 else $0$1);
    $0$2 := (if p3$2 then v8$2 else $0$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$d_CallBuffer(p1$1, BV32_ADD(v0$1, $i.0$1), $0$1, $$d_CallBuffer[BV32_ADD(v0$1, $i.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_CallBuffer(p1$2, BV32_ADD(v0$2, $i.0$2));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$d_CallBuffer(p1$2, BV32_ADD(v0$2, $i.0$2), $0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_CallBuffer"} true;
    $$d_CallBuffer[BV32_ADD(v0$1, $i.0$1)] := (if p1$1 then $0$1 else $$d_CallBuffer[BV32_ADD(v0$1, $i.0$1)]);
    $$d_CallBuffer[BV32_ADD(v0$2, $i.0$2)] := (if p1$2 then $0$2 else $$d_CallBuffer[BV32_ADD(v0$2, $i.0$2)]);
    $i.0$1 := (if p1$1 then BV32_ADD($i.0$1, 256bv32) else $i.0$1);
    $i.0$2 := (if p1$2 then BV32_ADD($i.0$2, 256bv32) else $i.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    $i1.0 := 2048bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b44 ==> _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b43 ==> _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> _WATCHED_OFFSET == BV32_ADD(local_id_x$1, 1bv32) || _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b42 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    assert {:tag "noread"} _b41 ==> !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b40 ==> _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b39 ==> _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b38 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    assert {:tag "noread"} _b37 ==> !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    assert {:tag "accessBreak"} _b36 ==> _WRITE_HAS_OCCURRED_$$d_CallBuffer ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 2064bv32);
    assert {:tag "accessBreak"} _b35 ==> _READ_HAS_OCCURRED_$$d_CallBuffer ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 2064bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b34 ==> _WRITE_HAS_OCCURRED_$$d_CallBuffer ==> BV32_AND(BV32_SUB(224bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(224bv32, 1bv32), BV32_ADD(BV32_ADD(0bv32, local_id_x$1), BV32_MUL(group_id_x$1, 2064bv32)));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b33 ==> _READ_HAS_OCCURRED_$$d_CallBuffer ==> BV32_AND(BV32_SUB(224bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(224bv32, 1bv32), BV32_ADD(BV32_ADD(0bv32, local_id_x$1), BV32_MUL(group_id_x$1, 2064bv32)));
    assert {:tag "accessUpperBoundBlock"} _b32 ==> _WRITE_HAS_OCCURRED_$$d_CallBuffer ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), 2064bv32));
    assert {:tag "accessLowerBoundBlock"} _b31 ==> _WRITE_HAS_OCCURRED_$$d_CallBuffer ==> BV32_SLE(BV32_MUL(group_id_x$1, 2064bv32), _WATCHED_OFFSET);
    assert {:tag "accessUpperBoundBlock"} _b30 ==> _READ_HAS_OCCURRED_$$d_CallBuffer ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), 2064bv32));
    assert {:tag "accessLowerBoundBlock"} _b29 ==> _READ_HAS_OCCURRED_$$d_CallBuffer ==> BV32_SLE(BV32_MUL(group_id_x$1, 2064bv32), _WATCHED_OFFSET);
    assert {:tag "nowrite"} _b28 ==> !_WRITE_HAS_OCCURRED_$$d_CallBuffer;
    assert {:tag "noread"} _b27 ==> !_READ_HAS_OCCURRED_$$d_CallBuffer;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b11 ==> BV32_UGE($i1.0, 2048bv32);
    assert {:tag "loopBound"} {:thread 2} _b11 ==> BV32_UGE($i1.0, 2048bv32);
    assert {:tag "loopBound"} {:thread 1} _b10 ==> BV32_ULE($i1.0, 2048bv32);
    assert {:tag "loopBound"} {:thread 2} _b10 ==> BV32_ULE($i1.0, 2048bv32);
    assert {:tag "loopBound"} {:thread 1} _b9 ==> BV32_SGE($i1.0, 2048bv32);
    assert {:tag "loopBound"} {:thread 2} _b9 ==> BV32_SGE($i1.0, 2048bv32);
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_SLE($i1.0, 2048bv32);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_SLE($i1.0, 2048bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b7 ==> BV32_SLE(0bv32, $i1.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b7 ==> BV32_SLE(0bv32, $i1.0);
    assert {:block_sourceloc} {:sourceloc_num 15} true;
    v10 := BV32_SGT($i1.0, 0bv32);
    p9$1 := false;
    p9$2 := false;
    p10$1 := false;
    p10$2 := false;
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v10 && !v10;
    v23$1 := local_id_x$1 == 0bv32;
    v23$2 := local_id_x$2 == 0bv32;
    p9$1 := (if v23$1 then v23$1 else p9$1);
    p9$2 := (if v23$2 then v23$2 else p9$2);
    call {:sourceloc} {:sourceloc_num 48} _LOG_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(p9$1, 0bv32, $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 48} _CHECK_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(p9$2, 0bv32, $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA"} true;
    v24$1 := (if p9$1 then $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[1bv1][0bv32] else v24$1);
    v24$2 := (if p9$2 then $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v24$2);
    call {:sourceloc} {:sourceloc_num 49} _LOG_WRITE_$$d_CallValue(p9$1, group_id_x$1, v24$1, $$d_CallValue[group_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_CallValue(p9$2, group_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 49} _CHECK_WRITE_$$d_CallValue(p9$2, group_id_x$2, v24$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_CallValue"} true;
    $$d_CallValue[group_id_x$1] := (if p9$1 then v24$1 else $$d_CallValue[group_id_x$1]);
    $$d_CallValue[group_id_x$2] := (if p9$2 then v24$2 else $$d_CallValue[group_id_x$2]);
    return;

  $truebb1:
    assume {:partition} v10 && v10;
    $c_base.0 := 0bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b62 ==> _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b61 ==> _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> _WATCHED_OFFSET == BV32_ADD(local_id_x$1, 1bv32) || _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b60 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    assert {:tag "noread"} _b59 ==> !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b58 ==> _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> _WATCHED_OFFSET == local_id_x$1 || _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b57 ==> _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b56 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    assert {:tag "noread"} _b55 ==> !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    assert {:tag "accessBreak"} _b54 ==> _WRITE_HAS_OCCURRED_$$d_CallBuffer ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 2064bv32);
    assert {:tag "accessBreak"} _b53 ==> _READ_HAS_OCCURRED_$$d_CallBuffer ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, 2064bv32);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b52 ==> _WRITE_HAS_OCCURRED_$$d_CallBuffer ==> BV32_AND(BV32_SUB(224bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(224bv32, 1bv32), BV32_ADD(BV32_ADD(0bv32, local_id_x$1), BV32_MUL(group_id_x$1, 2064bv32)));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b51 ==> _READ_HAS_OCCURRED_$$d_CallBuffer ==> BV32_AND(BV32_SUB(224bv32, 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(224bv32, 1bv32), BV32_ADD(BV32_ADD(0bv32, local_id_x$1), BV32_MUL(group_id_x$1, 2064bv32)));
    assert {:tag "accessUpperBoundBlock"} _b50 ==> _WRITE_HAS_OCCURRED_$$d_CallBuffer ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), 2064bv32));
    assert {:tag "accessLowerBoundBlock"} _b49 ==> _WRITE_HAS_OCCURRED_$$d_CallBuffer ==> BV32_SLE(BV32_MUL(group_id_x$1, 2064bv32), _WATCHED_OFFSET);
    assert {:tag "accessUpperBoundBlock"} _b48 ==> _READ_HAS_OCCURRED_$$d_CallBuffer ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), 2064bv32));
    assert {:tag "accessLowerBoundBlock"} _b47 ==> _READ_HAS_OCCURRED_$$d_CallBuffer ==> BV32_SLE(BV32_MUL(group_id_x$1, 2064bv32), _WATCHED_OFFSET);
    assert {:tag "nowrite"} _b46 ==> !_WRITE_HAS_OCCURRED_$$d_CallBuffer;
    assert {:tag "noread"} _b45 ==> !_READ_HAS_OCCURRED_$$d_CallBuffer;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b17 ==> BV32_UGE($c_base.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b17 ==> BV32_UGE($c_base.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b16 ==> BV32_ULE($c_base.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b16 ==> BV32_ULE($c_base.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b15 ==> BV32_SGE($c_base.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b15 ==> BV32_SGE($c_base.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b14 ==> BV32_SLE($c_base.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b14 ==> BV32_SLE($c_base.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b13 ==> BV32_SLE(0bv32, $c_base.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b13 ==> BV32_SLE(0bv32, $c_base.0);
    assert {:tag "loopCounterIsStrided"} {:thread 1} _b12 ==> BV32_AND(BV32_SUB(224bv32, 1bv32), $c_base.0) == BV32_AND(BV32_SUB(224bv32, 1bv32), 0bv32);
    assert {:tag "loopCounterIsStrided"} {:thread 2} _b12 ==> BV32_AND(BV32_SUB(224bv32, 1bv32), $c_base.0) == BV32_AND(BV32_SUB(224bv32, 1bv32), 0bv32);
    assert {:block_sourceloc} {:sourceloc_num 17} true;
    v11 := BV32_SLT($c_base.0, $i1.0);
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    goto $truebb2, $falsebb2;

  $falsebb2:
    assume {:partition} !v11 && !v11;
    $i1.0 := BV32_SUB($i1.0, 32bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $7;

  $truebb2:
    assume {:partition} v11 && v11;
    v12 := BV32_SLT(255bv32, BV32_SUB($i1.0, $c_base.0));
    goto $truebb3, $falsebb3;

  $falsebb3:
    assume {:partition} !v12 && !v12;
    $1 := BV32_SUB($i1.0, $c_base.0);
    goto __partitioned_block_$13_0;

  __partitioned_block_$13_0:
    v13 := BV32_SUB($1, 32bv32);
    goto __partitioned_block_$13_1;

  __partitioned_block_$13_1:
    call {:sourceloc_num 22} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    v14$1 := BV32_SLE(local_id_x$1, $1);
    v14$2 := BV32_SLE(local_id_x$2, $1);
    p6$1 := (if v14$1 then v14$1 else p6$1);
    p6$2 := (if v14$2 then v14$2 else p6$2);
    call {:sourceloc} {:sourceloc_num 24} _LOG_READ_$$d_CallBuffer(p6$1, BV32_ADD(v0$1, BV32_ADD($c_base.0, local_id_x$1)), $$d_CallBuffer[BV32_ADD(v0$1, BV32_ADD($c_base.0, local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 24} _CHECK_READ_$$d_CallBuffer(p6$2, BV32_ADD(v0$2, BV32_ADD($c_base.0, local_id_x$2)), $$d_CallBuffer[BV32_ADD(v0$2, BV32_ADD($c_base.0, local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_CallBuffer"} true;
    v15$1 := (if p6$1 then $$d_CallBuffer[BV32_ADD(v0$1, BV32_ADD($c_base.0, local_id_x$1))] else v15$1);
    v15$2 := (if p6$2 then $$d_CallBuffer[BV32_ADD(v0$2, BV32_ADD($c_base.0, local_id_x$2))] else v15$2);
    call {:sourceloc} {:sourceloc_num 25} _LOG_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(p6$1, local_id_x$1, v15$1, $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(p6$2, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 25} _CHECK_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(p6$2, local_id_x$2, v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA"} true;
    $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[1bv1][local_id_x$1] := (if p6$1 then v15$1 else $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[1bv1][local_id_x$1]);
    $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := (if p6$2 then v15$2 else $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    $k.0 := BV32_SUB($1, 1bv32);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $16;

  $16:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b68 ==> _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b67 ==> _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> _WATCHED_OFFSET == BV32_ADD(local_id_x$1, 1bv32) || _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b66 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    assert {:tag "noread"} _b65 ==> !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b64 ==> _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> _WATCHED_OFFSET == local_id_x$1;
    assert {:tag "nowrite"} _b63 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b22 ==> BV32_UGE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b22 ==> BV32_UGE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b21 ==> BV32_ULE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b21 ==> BV32_ULE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b20 ==> BV32_SGE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b20 ==> BV32_SGE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "loopBound"} {:thread 1} _b19 ==> BV32_SLE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "loopBound"} {:thread 2} _b19 ==> BV32_SLE($k.0, BV32_SUB($1, 1bv32));
    assert {:tag "guardNonNeg"} {:thread 1} _b18 ==> BV32_SLE(0bv32, $k.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b18 ==> BV32_SLE(0bv32, $k.0);
    assert {:block_sourceloc} {:sourceloc_num 27} true;
    v16 := BV32_SGE($k.0, v13);
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    goto __partitioned_block_$truebb5_0, __partitioned_block_$falsebb5_0;

  __partitioned_block_$falsebb5_0:
    assume {:partition} !v16 && !v16;
    goto __partitioned_block_$falsebb5_1;

  __partitioned_block_$falsebb5_1:
    call {:sourceloc_num 38} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    v21$1 := BV32_SLE(local_id_x$1, v13);
    v21$2 := BV32_SLE(local_id_x$2, v13);
    p8$1 := (if v21$1 then v21$1 else p8$1);
    p8$2 := (if v21$2 then v21$2 else p8$2);
    call {:sourceloc} {:sourceloc_num 40} _LOG_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(p8$1, local_id_x$1, $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 40} _CHECK_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(p8$2, local_id_x$2, $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA"} true;
    v22$1 := (if p8$1 then $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[1bv1][local_id_x$1] else v22$1);
    v22$2 := (if p8$2 then $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v22$2);
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$d_CallBuffer(p8$1, BV32_ADD(v0$1, BV32_ADD($c_base.0, local_id_x$1)), v22$1, $$d_CallBuffer[BV32_ADD(v0$1, BV32_ADD($c_base.0, local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_CallBuffer(p8$2, BV32_ADD(v0$2, BV32_ADD($c_base.0, local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$d_CallBuffer(p8$2, BV32_ADD(v0$2, BV32_ADD($c_base.0, local_id_x$2)), v22$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_CallBuffer"} true;
    $$d_CallBuffer[BV32_ADD(v0$1, BV32_ADD($c_base.0, local_id_x$1))] := (if p8$1 then v22$1 else $$d_CallBuffer[BV32_ADD(v0$1, BV32_ADD($c_base.0, local_id_x$1))]);
    $$d_CallBuffer[BV32_ADD(v0$2, BV32_ADD($c_base.0, local_id_x$2))] := (if p8$2 then v22$2 else $$d_CallBuffer[BV32_ADD(v0$2, BV32_ADD($c_base.0, local_id_x$2))]);
    $c_base.0 := BV32_ADD($c_base.0, 224bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $9;

  __partitioned_block_$truebb5_0:
    assume {:partition} v16 && v16;
    goto __partitioned_block_$truebb5_1;

  __partitioned_block_$truebb5_1:
    call {:sourceloc_num 29} $bugle_barrier_duplicated_2(1bv1, 1bv1);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 30} true;
    v17$1 := $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[1bv1][BV32_ADD(local_id_x$1, 1bv32)];
    v17$2 := $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 1bv32)];
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 31} true;
    v18$1 := $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[1bv1][local_id_x$1];
    v18$2 := $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2];
    call {:sourceloc} {:sourceloc_num 32} _LOG_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(true, local_id_x$1, FADD32(FMUL32(v4$1, v17$1), FMUL32(v5$1, v18$1)), $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 32} _CHECK_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(true, local_id_x$2, FADD32(FMUL32(v4$2, v17$2), FMUL32(v5$2, v18$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB"} true;
    $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB[1bv1][local_id_x$1] := FADD32(FMUL32(v4$1, v17$1), FMUL32(v5$1, v18$1));
    $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := FADD32(FMUL32(v4$2, v17$2), FMUL32(v5$2, v18$2));
    goto __partitioned_block_$truebb5_2;

  __partitioned_block_$truebb5_2:
    call {:sourceloc_num 33} $bugle_barrier_duplicated_3(1bv1, 1bv1);
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(true, BV32_ADD(local_id_x$1, 1bv32), $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB[1bv1][BV32_ADD(local_id_x$1, 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(true, BV32_ADD(local_id_x$2, 1bv32), $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB"} true;
    v19$1 := $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB[1bv1][BV32_ADD(local_id_x$1, 1bv32)];
    v19$2 := $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 1bv32)];
    call {:sourceloc} {:sourceloc_num 35} _LOG_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(true, local_id_x$1, $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 35} _CHECK_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(true, local_id_x$2, $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB"} true;
    v20$1 := $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB[1bv1][local_id_x$1];
    v20$2 := $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2];
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(true, local_id_x$1, FADD32(FMUL32(v4$1, v19$1), FMUL32(v5$1, v20$1)), $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(true, local_id_x$2, FADD32(FMUL32(v4$2, v19$2), FMUL32(v5$2, v20$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA"} true;
    $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[1bv1][local_id_x$1] := FADD32(FMUL32(v4$1, v19$1), FMUL32(v5$1, v20$1));
    $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := FADD32(FMUL32(v4$2, v19$2), FMUL32(v5$2, v20$2));
    $k.0 := BV32_ADD($k.0, 4294967294bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $16;

  $truebb3:
    assume {:partition} v12 && v12;
    $1 := 255bv32;
    goto __partitioned_block_$13_0;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $1;
}



procedure {:source_name "expf"} $expf(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA, $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB, $$d_CallValue, $$d_CallBuffer, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA, $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB, $$d_CallValue, $$d_CallBuffer, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA, $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB, $$d_CallValue, $$d_CallBuffer, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_3($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA, $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB, $$d_CallValue, $$d_CallBuffer, _TRACKING;



function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

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

const _WATCHED_VALUE_$$d_OptionData: bv32;

procedure {:inline 1} _LOG_READ_$$d_OptionData(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_OptionData;



implementation {:inline 1} _LOG_READ_$$d_OptionData(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_OptionData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionData == _value then true else _READ_HAS_OCCURRED_$$d_OptionData);
    return;
}



procedure _CHECK_READ_$$d_OptionData(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_OptionData"} {:array "$$d_OptionData"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_OptionData);
  requires {:source_name "d_OptionData"} {:array "$$d_OptionData"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_OptionData: bool;

procedure {:inline 1} _LOG_WRITE_$$d_OptionData(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_OptionData, _WRITE_READ_BENIGN_FLAG_$$d_OptionData;



implementation {:inline 1} _LOG_WRITE_$$d_OptionData(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_OptionData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionData == _value then true else _WRITE_HAS_OCCURRED_$$d_OptionData);
    _WRITE_READ_BENIGN_FLAG_$$d_OptionData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionData == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_OptionData);
    return;
}



procedure _CHECK_WRITE_$$d_OptionData(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_OptionData"} {:array "$$d_OptionData"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionData != _value);
  requires {:source_name "d_OptionData"} {:array "$$d_OptionData"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_OptionData != _value);
  requires {:source_name "d_OptionData"} {:array "$$d_OptionData"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_OptionData(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_OptionData;



implementation {:inline 1} _LOG_ATOMIC_$$d_OptionData(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_OptionData := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_OptionData);
    return;
}



procedure _CHECK_ATOMIC_$$d_OptionData(_P: bool, _offset: bv32);
  requires {:source_name "d_OptionData"} {:array "$$d_OptionData"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_OptionData"} {:array "$$d_OptionData"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_OptionData(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_OptionData;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_OptionData(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_OptionData := (if _P && _WRITE_HAS_OCCURRED_$$d_OptionData && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_OptionData);
    return;
}



const _WATCHED_VALUE_$$d_CallValue: bv32;

procedure {:inline 1} _LOG_READ_$$d_CallValue(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_CallValue;



implementation {:inline 1} _LOG_READ_$$d_CallValue(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_CallValue := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallValue == _value then true else _READ_HAS_OCCURRED_$$d_CallValue);
    return;
}



procedure _CHECK_READ_$$d_CallValue(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_CallValue"} {:array "$$d_CallValue"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_CallValue);
  requires {:source_name "d_CallValue"} {:array "$$d_CallValue"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_CallValue: bool;

procedure {:inline 1} _LOG_WRITE_$$d_CallValue(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_CallValue, _WRITE_READ_BENIGN_FLAG_$$d_CallValue;



implementation {:inline 1} _LOG_WRITE_$$d_CallValue(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_CallValue := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallValue == _value then true else _WRITE_HAS_OCCURRED_$$d_CallValue);
    _WRITE_READ_BENIGN_FLAG_$$d_CallValue := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallValue == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_CallValue);
    return;
}



procedure _CHECK_WRITE_$$d_CallValue(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_CallValue"} {:array "$$d_CallValue"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallValue != _value);
  requires {:source_name "d_CallValue"} {:array "$$d_CallValue"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallValue != _value);
  requires {:source_name "d_CallValue"} {:array "$$d_CallValue"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_CallValue(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_CallValue;



implementation {:inline 1} _LOG_ATOMIC_$$d_CallValue(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_CallValue := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_CallValue);
    return;
}



procedure _CHECK_ATOMIC_$$d_CallValue(_P: bool, _offset: bv32);
  requires {:source_name "d_CallValue"} {:array "$$d_CallValue"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_CallValue"} {:array "$$d_CallValue"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_CallValue(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_CallValue;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_CallValue(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_CallValue := (if _P && _WRITE_HAS_OCCURRED_$$d_CallValue && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_CallValue);
    return;
}



const _WATCHED_VALUE_$$d_CallBuffer: bv32;

procedure {:inline 1} _LOG_READ_$$d_CallBuffer(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_CallBuffer;



implementation {:inline 1} _LOG_READ_$$d_CallBuffer(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_CallBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallBuffer == _value then true else _READ_HAS_OCCURRED_$$d_CallBuffer);
    return;
}



procedure _CHECK_READ_$$d_CallBuffer(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_CallBuffer"} {:array "$$d_CallBuffer"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_CallBuffer && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_CallBuffer);
  requires {:source_name "d_CallBuffer"} {:array "$$d_CallBuffer"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_CallBuffer && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_CallBuffer: bool;

procedure {:inline 1} _LOG_WRITE_$$d_CallBuffer(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_CallBuffer, _WRITE_READ_BENIGN_FLAG_$$d_CallBuffer;



implementation {:inline 1} _LOG_WRITE_$$d_CallBuffer(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_CallBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallBuffer == _value then true else _WRITE_HAS_OCCURRED_$$d_CallBuffer);
    _WRITE_READ_BENIGN_FLAG_$$d_CallBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallBuffer == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_CallBuffer);
    return;
}



procedure _CHECK_WRITE_$$d_CallBuffer(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_CallBuffer"} {:array "$$d_CallBuffer"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_CallBuffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallBuffer != _value);
  requires {:source_name "d_CallBuffer"} {:array "$$d_CallBuffer"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_CallBuffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_CallBuffer != _value);
  requires {:source_name "d_CallBuffer"} {:array "$$d_CallBuffer"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_CallBuffer && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_CallBuffer(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_CallBuffer;



implementation {:inline 1} _LOG_ATOMIC_$$d_CallBuffer(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_CallBuffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_CallBuffer);
    return;
}



procedure _CHECK_ATOMIC_$$d_CallBuffer(_P: bool, _offset: bv32);
  requires {:source_name "d_CallBuffer"} {:array "$$d_CallBuffer"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_CallBuffer && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_CallBuffer"} {:array "$$d_CallBuffer"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_CallBuffer && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_CallBuffer(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_CallBuffer;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_CallBuffer(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_CallBuffer := (if _P && _WRITE_HAS_OCCURRED_$$d_CallBuffer && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_CallBuffer);
    return;
}



const _WATCHED_VALUE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;



implementation {:inline 1} _LOG_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA == _value then true else _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA);
    return;
}



procedure _CHECK_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "callA"} {:array "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "callA"} {:array "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA, _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;



implementation {:inline 1} _LOG_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA);
    return;
}



procedure _CHECK_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "callA"} {:array "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "callA"} {:array "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "callA"} {:array "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(_P: bool, _offset: bv32);
  requires {:source_name "callA"} {:array "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "callA"} {:array "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA);
    return;
}



const _WATCHED_VALUE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;



implementation {:inline 1} _LOG_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB == _value then true else _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB);
    return;
}



procedure _CHECK_READ_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "callB"} {:array "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "callB"} {:array "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB, _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;



implementation {:inline 1} _LOG_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB);
    return;
}



procedure _CHECK_WRITE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "callB"} {:array "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "callB"} {:array "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "callB"} {:array "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(_P: bool, _offset: bv32);
  requires {:source_name "callB"} {:array "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "callB"} {:array "$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_CallValue;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_CallValue;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_CallValue;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_CallBuffer;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_CallBuffer;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_CallBuffer;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_CallValue;
    goto anon9;

  anon9:
    havoc $$d_CallBuffer;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    goto anon4;

  anon4:
    havoc $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_CallValue;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_CallValue;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_CallValue;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_CallBuffer;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_CallBuffer;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_CallBuffer;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_CallValue;
    goto anon9;

  anon9:
    havoc $$d_CallBuffer;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    goto anon4;

  anon4:
    havoc $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_CallValue;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_CallValue;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_CallValue;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_CallBuffer;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_CallBuffer;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_CallBuffer;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_CallValue;
    goto anon9;

  anon9:
    havoc $$d_CallBuffer;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    goto anon4;

  anon4:
    havoc $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_3($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_CallValue;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_CallValue;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_CallValue;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_CallBuffer;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_CallBuffer;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_CallBuffer;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_CallValue;
    goto anon9;

  anon9:
    havoc $$d_CallBuffer;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callA;
    goto anon4;

  anon4:
    havoc $$_ZZ21binomialOptionsKernelP13__TOptionDataPfS1_E5callB;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



const {:existential true} _b23: bool;

const {:existential true} _b24: bool;

const {:existential true} _b25: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

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
