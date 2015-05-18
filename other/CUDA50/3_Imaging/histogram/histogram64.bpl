type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "d_PartialHistograms"} {:global} $$d_PartialHistograms: [bv32]bv32;

axiom {:array_info "$$d_PartialHistograms"} {:global} {:elem_width 32} {:source_name "d_PartialHistograms"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_PartialHistograms: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_PartialHistograms: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_PartialHistograms: bool;

axiom {:array_info "$$d_Data"} {:global} {:elem_width 32} {:source_name "d_Data"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Data: bool;

axiom {:array_info "$$data"} {:elem_width 32} {:source_name "data"} {:source_elem_width 128} {:source_dimensions "1"} true;

var {:source_name "s_Hist"} {:group_shared} $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist: [bv1][bv32]bv8;

axiom {:array_info "$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} {:group_shared} {:elem_width 8} {:source_name "s_Hist"} {:source_elem_width 8} {:source_dimensions "4096"} true;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV8_ADD(bv8, bv8) : bv8;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV32_OR(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 24"} BV8_ZEXT32(bv8) : bv32;

procedure {:source_name "histogram64Kernel"} {:kernel} $_Z17histogram64KernelPjP5uint4j($dataCount: bv32);
  requires !_READ_HAS_OCCURRED_$$d_PartialHistograms && !_WRITE_HAS_OCCURRED_$$d_PartialHistograms && !_ATOMIC_HAS_OCCURRED_$$d_PartialHistograms;
  requires !_READ_HAS_OCCURRED_$$d_Data && !_WRITE_HAS_OCCURRED_$$d_Data && !_ATOMIC_HAS_OCCURRED_$$d_Data;
  requires !_READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist && !_WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist && !_ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist;
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
  modifies $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist, $$d_PartialHistograms, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist, _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist, _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist, _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist, _TRACKING, _WRITE_HAS_OCCURRED_$$d_PartialHistograms, _WRITE_READ_BENIGN_FLAG_$$d_PartialHistograms, _WRITE_READ_BENIGN_FLAG_$$d_PartialHistograms;



implementation {:source_name "histogram64Kernel"} {:kernel} $_Z17histogram64KernelPjP5uint4j($dataCount: bv32)
{
  var $i.0: bv32;
  var $pos.0$1: bv32;
  var $pos.0$2: bv32;
  var $sum.0$1: bv32;
  var $sum.0$2: bv32;
  var $pos1.0$1: bv32;
  var $pos1.0$2: bv32;
  var $i2.0$1: bv32;
  var $i2.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1: bool;
  var v3$1: bv32;
  var v3$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv8;
  var v8$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
  var v16$1: bv8;
  var v16$2: bv8;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv8;
  var v18$2: bv8;
  var v19$1: bv8;
  var v19$2: bv8;
  var v20$1: bv8;
  var v20$2: bv8;
  var v21$1: bv8;
  var v21$2: bv8;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv8;
  var v23$2: bv8;
  var v24$1: bv8;
  var v24$2: bv8;
  var v25$1: bv8;
  var v25$2: bv8;
  var v26$1: bv8;
  var v26$2: bv8;
  var v27$1: bool;
  var v27$2: bool;
  var v28$1: bv32;
  var v28$2: bv32;
  var v29$1: bool;
  var v29$2: bool;
  var v30$1: bv8;
  var v30$2: bv8;
  var v31$1: bv8;
  var v31$2: bv8;
  var v32$1: bv8;
  var v32$2: bv8;
  var v33$1: bv8;
  var v33$2: bv8;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_OR(BV32_OR(BV32_SHL(BV32_AND(local_id_x$1, 4294967232bv32), 0bv32), BV32_SHL(BV32_AND(local_id_x$1, 15bv32), 2bv32)), BV32_LSHR(BV32_AND(local_id_x$1, 48bv32), 4bv32));
    v0$2 := BV32_OR(BV32_OR(BV32_SHL(BV32_AND(local_id_x$2, 4294967232bv32), 0bv32), BV32_SHL(BV32_AND(local_id_x$2, 15bv32), 2bv32)), BV32_LSHR(BV32_AND(local_id_x$2, 48bv32), 4bv32));
    $i.0 := 0bv32;
    p0$1 := false;
    p0$2 := false;
    p4$1 := false;
    p4$2 := false;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v1 := BV32_ULT($i.0, 16bv32);
    goto $truebb, __partitioned_block_$falsebb_0;

  __partitioned_block_$falsebb_0:
    assume {:partition} !v1 && !v1;
    goto __partitioned_block_$falsebb_1;

  __partitioned_block_$falsebb_1:
    call {:sourceloc_num 9} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $pos.0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    $pos.0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 10} p0$1 ==> true;
    v2$1 := (if p0$1 then BV32_ULT($pos.0$1, $dataCount) else v2$1);
    v2$2 := (if p0$2 then BV32_ULT($pos.0$2, $dataCount) else v2$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p6$1 := false;
    p6$2 := false;
    p1$1 := (if p0$1 && v2$1 then v2$1 else p1$1);
    p1$2 := (if p0$2 && v2$2 then v2$2 else p1$2);
    p0$1 := (if p0$1 && !v2$1 then v2$1 else p0$1);
    p0$2 := (if p0$2 && !v2$2 then v2$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p1$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p1$2 then _HAVOC_bv32$2 else v3$2);
    $$data$0bv32$1 := (if p1$1 then v3$1 else $$data$0bv32$1);
    $$data$0bv32$2 := (if p1$2 then v3$2 else $$data$0bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v4$1 := (if p1$1 then _HAVOC_bv32$1 else v4$1);
    v4$2 := (if p1$2 then _HAVOC_bv32$2 else v4$2);
    $$data$1bv32$1 := (if p1$1 then v4$1 else $$data$1bv32$1);
    $$data$1bv32$2 := (if p1$2 then v4$2 else $$data$1bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v5$1 := (if p1$1 then _HAVOC_bv32$1 else v5$1);
    v5$2 := (if p1$2 then _HAVOC_bv32$2 else v5$2);
    $$data$2bv32$1 := (if p1$1 then v5$1 else $$data$2bv32$1);
    $$data$2bv32$2 := (if p1$2 then v5$2 else $$data$2bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v6$1 := (if p1$1 then _HAVOC_bv32$1 else v6$1);
    v6$2 := (if p1$2 then _HAVOC_bv32$2 else v6$2);
    $$data$3bv32$1 := (if p1$1 then v6$1 else $$data$3bv32$1);
    $$data$3bv32$2 := (if p1$2 then v6$2 else $$data$3bv32$2);
    v7$1 := (if p1$1 then $$data$0bv32$1 else v7$1);
    v7$2 := (if p1$2 then $$data$0bv32$2 else v7$2);
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 2bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 2bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 2bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 2bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v8$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 2bv32), 63bv32), 64bv32))] else v8$1);
    v8$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 2bv32), 63bv32), 64bv32))] else v8$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 2bv32), 63bv32), 64bv32)), BV8_ADD(v8$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 2bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 2bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 2bv32), 63bv32), 64bv32)), BV8_ADD(v8$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 2bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v8$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 2bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 2bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v8$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 2bv32), 63bv32), 64bv32))]);
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 10bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 10bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 10bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 10bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v9$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 10bv32), 63bv32), 64bv32))] else v9$1);
    v9$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 10bv32), 63bv32), 64bv32))] else v9$2);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 10bv32), 63bv32), 64bv32)), BV8_ADD(v9$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 10bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 10bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 10bv32), 63bv32), 64bv32)), BV8_ADD(v9$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 10bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v9$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 10bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 10bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v9$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 10bv32), 63bv32), 64bv32))]);
    call {:sourceloc} {:sourceloc_num 25} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 18bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 18bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 25} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 18bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 18bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v10$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 18bv32), 63bv32), 64bv32))] else v10$1);
    v10$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 18bv32), 63bv32), 64bv32))] else v10$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 18bv32), 63bv32), 64bv32)), BV8_ADD(v10$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 18bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 18bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 18bv32), 63bv32), 64bv32)), BV8_ADD(v10$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 18bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v10$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 18bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 18bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v10$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 18bv32), 63bv32), 64bv32))]);
    call {:sourceloc} {:sourceloc_num 27} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 26bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 26bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 27} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 26bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 26bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v11$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 26bv32), 63bv32), 64bv32))] else v11$1);
    v11$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 26bv32), 63bv32), 64bv32))] else v11$2);
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 26bv32), 63bv32), 64bv32)), BV8_ADD(v11$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 26bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 26bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 26bv32), 63bv32), 64bv32)), BV8_ADD(v11$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 26bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v11$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v7$1, 26bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 26bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v11$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v7$2, 26bv32), 63bv32), 64bv32))]);
    v12$1 := (if p1$1 then $$data$1bv32$1 else v12$1);
    v12$2 := (if p1$2 then $$data$1bv32$2 else v12$2);
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 2bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 2bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 2bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 2bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v13$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 2bv32), 63bv32), 64bv32))] else v13$1);
    v13$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 2bv32), 63bv32), 64bv32))] else v13$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 2bv32), 63bv32), 64bv32)), BV8_ADD(v13$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 2bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 2bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 2bv32), 63bv32), 64bv32)), BV8_ADD(v13$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 2bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v13$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 2bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 2bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v13$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 2bv32), 63bv32), 64bv32))]);
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 10bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 10bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 10bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 10bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v14$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 10bv32), 63bv32), 64bv32))] else v14$1);
    v14$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 10bv32), 63bv32), 64bv32))] else v14$2);
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 10bv32), 63bv32), 64bv32)), BV8_ADD(v14$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 10bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 10bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 10bv32), 63bv32), 64bv32)), BV8_ADD(v14$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 10bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v14$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 10bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 10bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v14$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 10bv32), 63bv32), 64bv32))]);
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 18bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 18bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 18bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 18bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v15$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 18bv32), 63bv32), 64bv32))] else v15$1);
    v15$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 18bv32), 63bv32), 64bv32))] else v15$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 18bv32), 63bv32), 64bv32)), BV8_ADD(v15$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 18bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 18bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 18bv32), 63bv32), 64bv32)), BV8_ADD(v15$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 18bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v15$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 18bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 18bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v15$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 18bv32), 63bv32), 64bv32))]);
    call {:sourceloc} {:sourceloc_num 36} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 26bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 26bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 36} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 26bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 26bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v16$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 26bv32), 63bv32), 64bv32))] else v16$1);
    v16$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 26bv32), 63bv32), 64bv32))] else v16$2);
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 26bv32), 63bv32), 64bv32)), BV8_ADD(v16$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 26bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 26bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 26bv32), 63bv32), 64bv32)), BV8_ADD(v16$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 26bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v16$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v12$1, 26bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 26bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v16$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v12$2, 26bv32), 63bv32), 64bv32))]);
    v17$1 := (if p1$1 then $$data$2bv32$1 else v17$1);
    v17$2 := (if p1$2 then $$data$2bv32$2 else v17$2);
    call {:sourceloc} {:sourceloc_num 39} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 2bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 2bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 39} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 2bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 2bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v18$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 2bv32), 63bv32), 64bv32))] else v18$1);
    v18$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 2bv32), 63bv32), 64bv32))] else v18$2);
    call {:sourceloc} {:sourceloc_num 40} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 2bv32), 63bv32), 64bv32)), BV8_ADD(v18$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 2bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 2bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 40} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 2bv32), 63bv32), 64bv32)), BV8_ADD(v18$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 2bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v18$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 2bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 2bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v18$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 2bv32), 63bv32), 64bv32))]);
    call {:sourceloc} {:sourceloc_num 41} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 10bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 10bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 41} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 10bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 10bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v19$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 10bv32), 63bv32), 64bv32))] else v19$1);
    v19$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 10bv32), 63bv32), 64bv32))] else v19$2);
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 10bv32), 63bv32), 64bv32)), BV8_ADD(v19$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 10bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 10bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 10bv32), 63bv32), 64bv32)), BV8_ADD(v19$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 10bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v19$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 10bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 10bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v19$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 10bv32), 63bv32), 64bv32))]);
    call {:sourceloc} {:sourceloc_num 43} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 18bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 18bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 43} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 18bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 18bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v20$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 18bv32), 63bv32), 64bv32))] else v20$1);
    v20$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 18bv32), 63bv32), 64bv32))] else v20$2);
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 18bv32), 63bv32), 64bv32)), BV8_ADD(v20$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 18bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 18bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 18bv32), 63bv32), 64bv32)), BV8_ADD(v20$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 18bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v20$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 18bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 18bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v20$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 18bv32), 63bv32), 64bv32))]);
    call {:sourceloc} {:sourceloc_num 45} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 26bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 26bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 45} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 26bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 26bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v21$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 26bv32), 63bv32), 64bv32))] else v21$1);
    v21$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 26bv32), 63bv32), 64bv32))] else v21$2);
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 26bv32), 63bv32), 64bv32)), BV8_ADD(v21$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 26bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 26bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 26bv32), 63bv32), 64bv32)), BV8_ADD(v21$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 26bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v21$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v17$1, 26bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 26bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v21$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v17$2, 26bv32), 63bv32), 64bv32))]);
    v22$1 := (if p1$1 then $$data$3bv32$1 else v22$1);
    v22$2 := (if p1$2 then $$data$3bv32$2 else v22$2);
    call {:sourceloc} {:sourceloc_num 48} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 2bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 2bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 48} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 2bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 2bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v23$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 2bv32), 63bv32), 64bv32))] else v23$1);
    v23$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 2bv32), 63bv32), 64bv32))] else v23$2);
    call {:sourceloc} {:sourceloc_num 49} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 2bv32), 63bv32), 64bv32)), BV8_ADD(v23$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 2bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 2bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 49} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 2bv32), 63bv32), 64bv32)), BV8_ADD(v23$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 2bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v23$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 2bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 2bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v23$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 2bv32), 63bv32), 64bv32))]);
    call {:sourceloc} {:sourceloc_num 50} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 10bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 10bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 50} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 10bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 10bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v24$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 10bv32), 63bv32), 64bv32))] else v24$1);
    v24$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 10bv32), 63bv32), 64bv32))] else v24$2);
    call {:sourceloc} {:sourceloc_num 51} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 10bv32), 63bv32), 64bv32)), BV8_ADD(v24$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 10bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 10bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 51} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 10bv32), 63bv32), 64bv32)), BV8_ADD(v24$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 10bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v24$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 10bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 10bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v24$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 10bv32), 63bv32), 64bv32))]);
    call {:sourceloc} {:sourceloc_num 52} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 18bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 18bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 52} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 18bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 18bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v25$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 18bv32), 63bv32), 64bv32))] else v25$1);
    v25$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 18bv32), 63bv32), 64bv32))] else v25$2);
    call {:sourceloc} {:sourceloc_num 53} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 18bv32), 63bv32), 64bv32)), BV8_ADD(v25$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 18bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 18bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 53} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 18bv32), 63bv32), 64bv32)), BV8_ADD(v25$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 18bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v25$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 18bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 18bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v25$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 18bv32), 63bv32), 64bv32))]);
    call {:sourceloc} {:sourceloc_num 54} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 26bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 26bv32), 63bv32), 64bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 54} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 26bv32), 63bv32), 64bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 26bv32), 63bv32), 64bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v26$1 := (if p1$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 26bv32), 63bv32), 64bv32))] else v26$1);
    v26$2 := (if p1$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 26bv32), 63bv32), 64bv32))] else v26$2);
    call {:sourceloc} {:sourceloc_num 55} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$1, BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 26bv32), 63bv32), 64bv32)), BV8_ADD(v26$1, 1bv8), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 26bv32), 63bv32), 64bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 26bv32), 63bv32), 64bv32)));
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 55} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p1$2, BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 26bv32), 63bv32), 64bv32)), BV8_ADD(v26$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 26bv32), 63bv32), 64bv32))] := (if p1$1 then BV8_ADD(v26$1, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v0$1, BV32_MUL(BV32_AND(BV32_LSHR(v22$1, 26bv32), 63bv32), 64bv32))]);
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 26bv32), 63bv32), 64bv32))] := (if p1$2 then BV8_ADD(v26$2, 1bv8) else $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, BV32_MUL(BV32_AND(BV32_LSHR(v22$2, 26bv32), 63bv32), 64bv32))]);
    $pos.0$1 := (if p1$1 then BV32_ADD($pos.0$1, BV32_MUL(group_size_x, num_groups_x)) else $pos.0$1);
    $pos.0$2 := (if p1$2 then BV32_ADD($pos.0$2, BV32_MUL(group_size_x, num_groups_x)) else $pos.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $5.backedge, __partitioned_block_$5.tail_0;

  __partitioned_block_$5.tail_0:
    assume !p0$1 && !p0$2;
    goto __partitioned_block_$5.tail_1;

  __partitioned_block_$5.tail_1:
    call {:sourceloc_num 58} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    v27$1 := BV32_ULT(local_id_x$1, 64bv32);
    v27$2 := BV32_ULT(local_id_x$2, 64bv32);
    p3$1 := (if v27$1 then v27$1 else p3$1);
    p3$2 := (if v27$2 then v27$2 else p3$2);
    v28$1 := (if p3$1 then BV32_MUL(local_id_x$1, 64bv32) else v28$1);
    v28$2 := (if p3$2 then BV32_MUL(local_id_x$2, 64bv32) else v28$2);
    $sum.0$1, $pos1.0$1, $i2.0$1 := (if p3$1 then 0bv32 else $sum.0$1), (if p3$1 then BV32_MUL(4bv32, BV32_AND(local_id_x$1, 15bv32)) else $pos1.0$1), (if p3$1 then 0bv32 else $i2.0$1);
    $sum.0$2, $pos1.0$2, $i2.0$2 := (if p3$2 then 0bv32 else $sum.0$2), (if p3$2 then BV32_MUL(4bv32, BV32_AND(local_id_x$2, 15bv32)) else $pos1.0$2), (if p3$2 then 0bv32 else $i2.0$2);
    p4$1 := (if p3$1 then true else p4$1);
    p4$2 := (if p3$2 then true else p4$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $10;

  $10:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 60} p4$1 ==> true;
    v29$1 := (if p4$1 then BV32_ULT($i2.0$1, 16bv32) else v29$1);
    v29$2 := (if p4$2 then BV32_ULT($i2.0$2, 16bv32) else v29$2);
    p5$1 := false;
    p5$2 := false;
    p5$1 := (if p4$1 && v29$1 then v29$1 else p5$1);
    p5$2 := (if p4$2 && v29$2 then v29$2 else p5$2);
    p4$1 := (if p4$1 && !v29$1 then v29$1 else p4$1);
    p4$2 := (if p4$2 && !v29$2 then v29$2 else p4$2);
    call {:sourceloc} {:sourceloc_num 62} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p5$1, BV32_ADD(v28$1, $pos1.0$1), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v28$1, $pos1.0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 62} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p5$2, BV32_ADD(v28$2, $pos1.0$2), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v28$2, $pos1.0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v30$1 := (if p5$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v28$1, $pos1.0$1)] else v30$1);
    v30$2 := (if p5$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v28$2, $pos1.0$2)] else v30$2);
    call {:sourceloc} {:sourceloc_num 63} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p5$1, BV32_ADD(v28$1, BV32_ADD($pos1.0$1, 1bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v28$1, BV32_ADD($pos1.0$1, 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 63} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p5$2, BV32_ADD(v28$2, BV32_ADD($pos1.0$2, 1bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v28$2, BV32_ADD($pos1.0$2, 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v31$1 := (if p5$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v28$1, BV32_ADD($pos1.0$1, 1bv32))] else v31$1);
    v31$2 := (if p5$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v28$2, BV32_ADD($pos1.0$2, 1bv32))] else v31$2);
    call {:sourceloc} {:sourceloc_num 64} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p5$1, BV32_ADD(v28$1, BV32_ADD($pos1.0$1, 2bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v28$1, BV32_ADD($pos1.0$1, 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 64} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p5$2, BV32_ADD(v28$2, BV32_ADD($pos1.0$2, 2bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v28$2, BV32_ADD($pos1.0$2, 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v32$1 := (if p5$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v28$1, BV32_ADD($pos1.0$1, 2bv32))] else v32$1);
    v32$2 := (if p5$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v28$2, BV32_ADD($pos1.0$2, 2bv32))] else v32$2);
    call {:sourceloc} {:sourceloc_num 65} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p5$1, BV32_ADD(v28$1, BV32_ADD($pos1.0$1, 3bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v28$1, BV32_ADD($pos1.0$1, 3bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 65} _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(p5$2, BV32_ADD(v28$2, BV32_ADD($pos1.0$2, 3bv32)), $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v28$2, BV32_ADD($pos1.0$2, 3bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    v33$1 := (if p5$1 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(v28$1, BV32_ADD($pos1.0$1, 3bv32))] else v33$1);
    v33$2 := (if p5$2 then $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v28$2, BV32_ADD($pos1.0$2, 3bv32))] else v33$2);
    $sum.0$1, $pos1.0$1, $i2.0$1 := (if p5$1 then BV32_ADD($sum.0$1, BV32_ADD(BV32_ADD(BV32_ADD(BV8_ZEXT32(v30$1), BV8_ZEXT32(v31$1)), BV8_ZEXT32(v32$1)), BV8_ZEXT32(v33$1))) else $sum.0$1), (if p5$1 then BV32_AND(BV32_ADD($pos1.0$1, 4bv32), 63bv32) else $pos1.0$1), (if p5$1 then BV32_ADD($i2.0$1, 1bv32) else $i2.0$1);
    $sum.0$2, $pos1.0$2, $i2.0$2 := (if p5$2 then BV32_ADD($sum.0$2, BV32_ADD(BV32_ADD(BV32_ADD(BV8_ZEXT32(v30$2), BV8_ZEXT32(v31$2)), BV8_ZEXT32(v32$2)), BV8_ZEXT32(v33$2))) else $sum.0$2), (if p5$2 then BV32_AND(BV32_ADD($pos1.0$2, 4bv32), 63bv32) else $pos1.0$2), (if p5$2 then BV32_ADD($i2.0$2, 1bv32) else $i2.0$2);
    p4$1 := (if p5$1 then true else p4$1);
    p4$2 := (if p5$2 then true else p4$2);
    goto $10.backedge, $10.tail;

  $10.tail:
    assume !p4$1 && !p4$2;
    call {:sourceloc} {:sourceloc_num 68} _LOG_WRITE_$$d_PartialHistograms(p3$1, BV32_ADD(BV32_MUL(group_id_x$1, 64bv32), local_id_x$1), $sum.0$1, $$d_PartialHistograms[BV32_ADD(BV32_MUL(group_id_x$1, 64bv32), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_PartialHistograms(p3$2, BV32_ADD(BV32_MUL(group_id_x$2, 64bv32), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 68} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 68} _CHECK_WRITE_$$d_PartialHistograms(p3$2, BV32_ADD(BV32_MUL(group_id_x$2, 64bv32), local_id_x$2), $sum.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_PartialHistograms"} true;
    $$d_PartialHistograms[BV32_ADD(BV32_MUL(group_id_x$1, 64bv32), local_id_x$1)] := (if p3$1 then $sum.0$1 else $$d_PartialHistograms[BV32_ADD(BV32_MUL(group_id_x$1, 64bv32), local_id_x$1)]);
    $$d_PartialHistograms[BV32_ADD(BV32_MUL(group_id_x$2, 64bv32), local_id_x$2)] := (if p3$2 then $sum.0$2 else $$d_PartialHistograms[BV32_ADD(BV32_MUL(group_id_x$2, 64bv32), local_id_x$2)]);
    return;

  $10.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $10;

  $5.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $5;

  $truebb:
    assume {:partition} v1 && v1;
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(true, BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL($i.0, 64bv32)), 4bv32), 0bv8, $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL($i.0, 64bv32)), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(true, BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL($i.0, 64bv32)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(true, BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL($i.0, 64bv32)), 4bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL($i.0, 64bv32)), 4bv32)] := 0bv8;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL($i.0, 64bv32)), 4bv32)] := 0bv8;
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL($i.0, 64bv32)), 4bv32), 1bv32), 0bv8, $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL($i.0, 64bv32)), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL($i.0, 64bv32)), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL($i.0, 64bv32)), 4bv32), 1bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL($i.0, 64bv32)), 4bv32), 1bv32)] := 0bv8;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL($i.0, 64bv32)), 4bv32), 1bv32)] := 0bv8;
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL($i.0, 64bv32)), 4bv32), 2bv32), 0bv8, $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL($i.0, 64bv32)), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL($i.0, 64bv32)), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL($i.0, 64bv32)), 4bv32), 2bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL($i.0, 64bv32)), 4bv32), 2bv32)] := 0bv8;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL($i.0, 64bv32)), 4bv32), 2bv32)] := 0bv8;
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL($i.0, 64bv32)), 4bv32), 3bv32), 0bv8, $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL($i.0, 64bv32)), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL($i.0, 64bv32)), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(true, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL($i.0, 64bv32)), 4bv32), 3bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} true;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL($i.0, 64bv32)), 4bv32), 3bv32)] := 0bv8;
    $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL($i.0, 64bv32)), 4bv32), 3bv32)] := 0bv8;
    $i.0 := BV32_ADD($i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4370bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist, $$d_PartialHistograms, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist, $$d_PartialHistograms, _TRACKING;



var $$data$0bv32$1: bv32;

var $$data$0bv32$2: bv32;

var $$data$1bv32$1: bv32;

var $$data$1bv32$2: bv32;

var $$data$2bv32$1: bv32;

var $$data$2bv32$2: bv32;

var $$data$3bv32$1: bv32;

var $$data$3bv32$2: bv32;

const _WATCHED_VALUE_$$d_PartialHistograms: bv32;

procedure {:inline 1} _LOG_READ_$$d_PartialHistograms(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_PartialHistograms;



implementation {:inline 1} _LOG_READ_$$d_PartialHistograms(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_PartialHistograms := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_PartialHistograms == _value then true else _READ_HAS_OCCURRED_$$d_PartialHistograms);
    return;
}



procedure _CHECK_READ_$$d_PartialHistograms(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_PartialHistograms"} {:array "$$d_PartialHistograms"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_PartialHistograms && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_PartialHistograms);
  requires {:source_name "d_PartialHistograms"} {:array "$$d_PartialHistograms"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_PartialHistograms && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_PartialHistograms: bool;

procedure {:inline 1} _LOG_WRITE_$$d_PartialHistograms(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_PartialHistograms, _WRITE_READ_BENIGN_FLAG_$$d_PartialHistograms;



implementation {:inline 1} _LOG_WRITE_$$d_PartialHistograms(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_PartialHistograms := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_PartialHistograms == _value then true else _WRITE_HAS_OCCURRED_$$d_PartialHistograms);
    _WRITE_READ_BENIGN_FLAG_$$d_PartialHistograms := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_PartialHistograms == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_PartialHistograms);
    return;
}



procedure _CHECK_WRITE_$$d_PartialHistograms(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_PartialHistograms"} {:array "$$d_PartialHistograms"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_PartialHistograms && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_PartialHistograms != _value);
  requires {:source_name "d_PartialHistograms"} {:array "$$d_PartialHistograms"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_PartialHistograms && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_PartialHistograms != _value);
  requires {:source_name "d_PartialHistograms"} {:array "$$d_PartialHistograms"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_PartialHistograms && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_PartialHistograms(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_PartialHistograms;



implementation {:inline 1} _LOG_ATOMIC_$$d_PartialHistograms(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_PartialHistograms := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_PartialHistograms);
    return;
}



procedure _CHECK_ATOMIC_$$d_PartialHistograms(_P: bool, _offset: bv32);
  requires {:source_name "d_PartialHistograms"} {:array "$$d_PartialHistograms"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_PartialHistograms && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_PartialHistograms"} {:array "$$d_PartialHistograms"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_PartialHistograms && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_PartialHistograms(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_PartialHistograms;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_PartialHistograms(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_PartialHistograms := (if _P && _WRITE_HAS_OCCURRED_$$d_PartialHistograms && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_PartialHistograms);
    return;
}



const _WATCHED_VALUE_$$d_Data: bv32;

procedure {:inline 1} _LOG_READ_$$d_Data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Data;



implementation {:inline 1} _LOG_READ_$$d_Data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data == _value then true else _READ_HAS_OCCURRED_$$d_Data);
    return;
}



procedure _CHECK_READ_$$d_Data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Data);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Data: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Data, _WRITE_READ_BENIGN_FLAG_$$d_Data;



implementation {:inline 1} _LOG_WRITE_$$d_Data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data == _value then true else _WRITE_HAS_OCCURRED_$$d_Data);
    _WRITE_READ_BENIGN_FLAG_$$d_Data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Data);
    return;
}



procedure _CHECK_WRITE_$$d_Data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data != _value);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data != _value);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Data;



implementation {:inline 1} _LOG_ATOMIC_$$d_Data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Data);
    return;
}



procedure _CHECK_ATOMIC_$$d_Data(_P: bool, _offset: bv32);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Data := (if _P && _WRITE_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Data);
    return;
}



const _WATCHED_VALUE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist: bv8;

procedure {:inline 1} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist;



implementation {:inline 1} _LOG_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist == _value then true else _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist);
    return;
}



procedure _CHECK_READ_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "s_Hist"} {:array "$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Hist"} {:array "$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist, _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist;



implementation {:inline 1} _LOG_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist);
    return;
}



procedure _CHECK_WRITE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "s_Hist"} {:array "$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Hist"} {:array "$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Hist"} {:array "$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(_P: bool, _offset: bv32);
  requires {:source_name "s_Hist"} {:array "$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Hist"} {:array "$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_PartialHistograms;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_PartialHistograms;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_PartialHistograms;
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
    havoc $$d_PartialHistograms;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ17histogram64KernelPjP5uint4jE6s_Hist;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_PartialHistograms;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_PartialHistograms;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_PartialHistograms;
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
    havoc $$d_PartialHistograms;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ17histogram64KernelPjP5uint4jE6s_Hist;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
