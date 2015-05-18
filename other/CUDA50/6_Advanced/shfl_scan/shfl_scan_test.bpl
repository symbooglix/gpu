type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "data"} {:global} $$data: [bv32]bv32;

axiom {:array_info "$$data"} {:global} {:elem_width 32} {:source_name "data"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data: bool;

const $arrayId$$data: arrayId;

axiom $arrayId$$data == 1bv3;

var {:source_name "partial_sums"} {:global} $$partial_sums: [bv32]bv32;

axiom {:array_info "$$partial_sums"} {:global} {:elem_width 32} {:source_name "partial_sums"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$partial_sums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$partial_sums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$partial_sums: bool;

const $arrayId$$partial_sums: arrayId;

axiom $arrayId$$partial_sums == 2bv3;

var {:source_name "sums"} {:group_shared} $$sums: [bv1][bv32]bv32;

axiom {:array_info "$$sums"} {:group_shared} {:elem_width 32} {:source_name "sums"} {:source_elem_width 32} {:source_dimensions "0"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sums: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sums: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sums: bool;

const $arrayId$$sums: arrayId;

axiom $arrayId$$sums == 3bv3;

type ptr = bv32;

type arrayId = bv3;

function {:inline true} MKPTR(base: arrayId, offset: bv32) : ptr
{
  base ++ offset[29:0]
}

function {:inline true} base#MKPTR(p: ptr) : arrayId
{
  p[32:29]
}

function {:inline true} offset#MKPTR(p: ptr) : bv32
{
  0bv3 ++ p[29:0]
}

const $arrayId$$null$: arrayId;

axiom $arrayId$$null$ == 0bv3;

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

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvurem"} BV32_UREM(bv32, bv32) : bv32;

procedure {:source_name "shfl_scan_test"} {:kernel} $_Z14shfl_scan_testPiiS_($width: bv32);
  requires !_READ_HAS_OCCURRED_$$data && !_WRITE_HAS_OCCURRED_$$data && !_ATOMIC_HAS_OCCURRED_$$data;
  requires !_READ_HAS_OCCURRED_$$partial_sums && !_WRITE_HAS_OCCURRED_$$partial_sums && !_ATOMIC_HAS_OCCURRED_$$partial_sums;
  requires !_READ_HAS_OCCURRED_$$sums && !_WRITE_HAS_OCCURRED_$$sums && !_ATOMIC_HAS_OCCURRED_$$sums;
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
  modifies $$sums, _READ_HAS_OCCURRED_$$data, _WRITE_HAS_OCCURRED_$$sums, _WRITE_READ_BENIGN_FLAG_$$sums, _WRITE_READ_BENIGN_FLAG_$$sums, $$data, $$partial_sums, _TRACKING, _READ_HAS_OCCURRED_$$sums, _TRACKING, _WRITE_HAS_OCCURRED_$$data, _WRITE_READ_BENIGN_FLAG_$$data, _WRITE_READ_BENIGN_FLAG_$$data, _WRITE_HAS_OCCURRED_$$partial_sums, _WRITE_READ_BENIGN_FLAG_$$partial_sums, _WRITE_READ_BENIGN_FLAG_$$partial_sums;



implementation {:source_name "shfl_scan_test"} {:kernel} $_Z14shfl_scan_testPiiS_($width: bv32)
{
  var $value.0$1: bv32;
  var $value.0$2: bv32;
  var $i.0: bv32;
  var $value.1$1: bv32;
  var $value.1$2: bv32;
  var $warp_sum.0$1: bv32;
  var $warp_sum.0$2: bv32;
  var $i1.0$1: bv32;
  var $i1.0$2: bv32;
  var $warp_sum.1$1: bv32;
  var $warp_sum.1$2: bv32;
  var $blockSum.0$1: bv32;
  var $blockSum.0$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4: bool;
  var v1$1: bv32;
  var v1$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v6$1: bool;
  var v6$2: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bool;
  var v10$2: bool;
  var v12$1: bool;
  var v12$2: bool;
  var v11$1: bv32;
  var v11$2: bv32;
  var v13$1: bool;
  var v13$2: bool;
  var v14$1: bv32;
  var v14$2: bv32;
  var v16: bool;
  var v17$1: bool;
  var v17$2: bool;
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


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_SREM(v0$1, 32bv32);
    v1$2 := BV32_SREM(v0$2, 32bv32);
    v2$1 := BV32_UDIV(local_id_x$1, 32bv32);
    v2$2 := BV32_UDIV(local_id_x$2, 32bv32);
    call {:sourceloc} {:sourceloc_num 1} _LOG_READ_$$data(true, v0$1, $$data[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 1} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 1} _CHECK_READ_$$data(true, v0$2, $$data[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data"} true;
    v3$1 := $$data[v0$1];
    v3$2 := $$data[v0$2];
    $value.0$1, $i.0 := v3$1, 1bv32;
    $value.0$2 := v3$2;
    p5$1 := false;
    p5$2 := false;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 2} true;
    v4 := BV32_SLE($i.0, $width);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
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
    goto $truebb, __partitioned_block_$falsebb_0;

  __partitioned_block_$falsebb_0:
    assume {:partition} !v4 && !v4;
    v7$1 := BV32_UREM(local_id_x$1, 32bv32) == 31bv32;
    v7$2 := BV32_UREM(local_id_x$2, 32bv32) == 31bv32;
    p2$1 := (if v7$1 then v7$1 else p2$1);
    p2$2 := (if v7$2 then v7$2 else p2$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$sums(p2$1, v2$1, $value.0$1, $$sums[1bv1][v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sums(p2$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$sums(p2$2, v2$2, $value.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sums"} true;
    $$sums[1bv1][v2$1] := (if p2$1 then $value.0$1 else $$sums[1bv1][v2$1]);
    $$sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2] := (if p2$2 then $value.0$2 else $$sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v2$2]);
    goto __partitioned_block_$falsebb_1;

  __partitioned_block_$falsebb_1:
    call {:sourceloc_num 12} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    v8$1 := v2$1 == 0bv32;
    v8$2 := v2$2 == 0bv32;
    p4$1 := (if v8$1 then v8$1 else p4$1);
    p4$2 := (if v8$2 then v8$2 else p4$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$sums(p4$1, v1$1, $$sums[1bv1][v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$sums(p4$2, v1$2, $$sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sums"} true;
    v9$1 := (if p4$1 then $$sums[1bv1][v1$1] else v9$1);
    v9$2 := (if p4$2 then $$sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] else v9$2);
    $warp_sum.0$1, $i1.0$1 := (if p4$1 then v9$1 else $warp_sum.0$1), (if p4$1 then 1bv32 else $i1.0$1);
    $warp_sum.0$2, $i1.0$2 := (if p4$2 then v9$2 else $warp_sum.0$2), (if p4$2 then 1bv32 else $i1.0$2);
    p5$1 := (if p4$1 then true else p5$1);
    p5$2 := (if p4$2 then true else p5$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $10;

  $10:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sums ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 15} p5$1 ==> true;
    v10$1 := (if p5$1 then BV32_SLE($i1.0$1, $width) else v10$1);
    v10$2 := (if p5$2 then BV32_SLE($i1.0$2, $width) else v10$2);
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    p6$1 := (if p5$1 && v10$1 then v10$1 else p6$1);
    p6$2 := (if p5$2 && v10$2 then v10$2 else p6$2);
    p5$1 := (if p5$1 && !v10$1 then v10$1 else p5$1);
    p5$2 := (if p5$2 && !v10$2 then v10$2 else p5$2);
    call {:sourceloc_num 17} v11$1, v11$2 := $_Z9__shfl_upiii($width, p6$1, $warp_sum.0$1, $i1.0$1, p6$2, $warp_sum.0$2, $i1.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z9__shfl_upiii"} true;
    v12$1 := (if p6$1 then BV32_SGE(v1$1, $i1.0$1) else v12$1);
    v12$2 := (if p6$2 then BV32_SGE(v1$2, $i1.0$2) else v12$2);
    p8$1 := (if p6$1 && v12$1 then v12$1 else p8$1);
    p8$2 := (if p6$2 && v12$2 then v12$2 else p8$2);
    p7$1 := (if p6$1 && !v12$1 then !v12$1 else p7$1);
    p7$2 := (if p6$2 && !v12$2 then !v12$2 else p7$2);
    $warp_sum.1$1 := (if p7$1 then $warp_sum.0$1 else $warp_sum.1$1);
    $warp_sum.1$2 := (if p7$2 then $warp_sum.0$2 else $warp_sum.1$2);
    $warp_sum.1$1 := (if p8$1 then BV32_ADD($warp_sum.0$1, v11$1) else $warp_sum.1$1);
    $warp_sum.1$2 := (if p8$2 then BV32_ADD($warp_sum.0$2, v11$2) else $warp_sum.1$2);
    $warp_sum.0$1, $i1.0$1 := (if p6$1 then $warp_sum.1$1 else $warp_sum.0$1), (if p6$1 then BV32_MUL($i1.0$1, 2bv32) else $i1.0$1);
    $warp_sum.0$2, $i1.0$2 := (if p6$2 then $warp_sum.1$2 else $warp_sum.0$2), (if p6$2 then BV32_MUL($i1.0$2, 2bv32) else $i1.0$2);
    p5$1 := (if p6$1 then true else p5$1);
    p5$2 := (if p6$2 then true else p5$2);
    goto $10.backedge, __partitioned_block_$10.tail_0;

  __partitioned_block_$10.tail_0:
    assume !p5$1 && !p5$2;
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$sums(p4$1, v1$1, $warp_sum.0$1, $$sums[1bv1][v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sums(p4$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$sums(p4$2, v1$2, $warp_sum.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sums"} true;
    $$sums[1bv1][v1$1] := (if p4$1 then $warp_sum.0$1 else $$sums[1bv1][v1$1]);
    $$sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2] := (if p4$2 then $warp_sum.0$2 else $$sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v1$2]);
    goto __partitioned_block_$10.tail_1;

  __partitioned_block_$10.tail_1:
    call {:sourceloc_num 24} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    v13$1 := BV32_SGT(v2$1, 0bv32);
    v13$2 := BV32_SGT(v2$2, 0bv32);
    p10$1 := (if v13$1 then v13$1 else p10$1);
    p10$2 := (if v13$2 then v13$2 else p10$2);
    p11$1 := (if !v13$1 then !v13$1 else p11$1);
    p11$2 := (if !v13$2 then !v13$2 else p11$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_READ_$$sums(p10$1, BV32_SUB(v2$1, 1bv32), $$sums[1bv1][BV32_SUB(v2$1, 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 26} _CHECK_READ_$$sums(p10$2, BV32_SUB(v2$2, 1bv32), $$sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v2$2, 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sums"} true;
    v14$1 := (if p10$1 then $$sums[1bv1][BV32_SUB(v2$1, 1bv32)] else v14$1);
    v14$2 := (if p10$2 then $$sums[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v2$2, 1bv32)] else v14$2);
    $blockSum.0$1 := (if p10$1 then v14$1 else $blockSum.0$1);
    $blockSum.0$2 := (if p10$2 then v14$2 else $blockSum.0$2);
    $blockSum.0$1 := (if p11$1 then 0bv32 else $blockSum.0$1);
    $blockSum.0$2 := (if p11$2 then 0bv32 else $blockSum.0$2);
    v15$1 := BV32_ADD($value.0$1, $blockSum.0$1);
    v15$2 := BV32_ADD($value.0$2, $blockSum.0$2);
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$data(true, v0$1, v15$1, $$data[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$data(true, v0$2, v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data"} true;
    $$data[v0$1] := v15$1;
    $$data[v0$2] := v15$2;
    v16 := MKPTR($arrayId$$partial_sums, 0bv32) != MKPTR($arrayId$$null$, 0bv32);
    goto $truebb6, $falsebb6;

  $falsebb6:
    assume {:partition} !v16 && !v16;
    return;

  $truebb6:
    assume {:partition} v16 && v16;
    v17$1 := local_id_x$1 == BV32_SUB(group_size_x, 1bv32);
    v17$2 := local_id_x$2 == BV32_SUB(group_size_x, 1bv32);
    p12$1 := (if v17$1 then v17$1 else p12$1);
    p12$2 := (if v17$2 then v17$2 else p12$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$partial_sums(p12$1, group_id_x$1, v15$1, $$partial_sums[group_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$partial_sums(p12$2, group_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$partial_sums(p12$2, group_id_x$2, v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$partial_sums"} true;
    $$partial_sums[group_id_x$1] := (if p12$1 then v15$1 else $$partial_sums[group_id_x$1]);
    $$partial_sums[group_id_x$2] := (if p12$2 then v15$2 else $$partial_sums[group_id_x$2]);
    goto $falsebb6;

  $10.backedge:
    assume {:backedge} p5$1 || p5$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $10;

  $truebb:
    assume {:partition} v4 && v4;
    call {:sourceloc_num 4} v5$1, v5$2 := $_Z9__shfl_upiii($width, true, $value.0$1, $i.0, true, $value.0$2, $i.0);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z9__shfl_upiii"} true;
    v6$1 := BV32_SGE(v1$1, $i.0);
    v6$2 := BV32_SGE(v1$2, $i.0);
    p1$1 := (if v6$1 then v6$1 else p1$1);
    p1$2 := (if v6$2 then v6$2 else p1$2);
    p0$1 := (if !v6$1 then !v6$1 else p0$1);
    p0$2 := (if !v6$2 then !v6$2 else p0$2);
    $value.1$1 := (if p0$1 then $value.0$1 else $value.1$1);
    $value.1$2 := (if p0$2 then $value.0$2 else $value.1$2);
    $value.1$1 := (if p1$1 then BV32_ADD($value.0$1, v5$1) else $value.1$1);
    $value.1$2 := (if p1$2 then BV32_ADD($value.0$2, v5$2) else $value.1$2);
    $value.0$1, $i.0 := $value.1$1, BV32_MUL($i.0, 2bv32);
    $value.0$2 := $value.1$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $1;
}



procedure {:source_name "_Z9__shfl_upiii"} $_Z9__shfl_upiii($2: bv32, _P$1: bool, $0$1: bv32, $1$1: bv32, _P$2: bool, $0$2: bv32, $1$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$sums, $$data, $$partial_sums, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$sums, $$data, $$partial_sums, _TRACKING;



const _WATCHED_VALUE_$$data: bv32;

procedure {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data;



implementation {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _READ_HAS_OCCURRED_$$data);
    return;
}



procedure _CHECK_READ_$$data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data);
  requires {:source_name "data"} {:array "$$data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data: bool;

procedure {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data, _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _WRITE_HAS_OCCURRED_$$data);
    _WRITE_READ_BENIGN_FLAG_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data);
    return;
}



procedure _CHECK_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data != _value);
  requires {:source_name "data"} {:array "$$data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data != _value);
  requires {:source_name "data"} {:array "$$data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data;



implementation {:inline 1} _LOG_ATOMIC_$$data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data);
    return;
}



procedure _CHECK_ATOMIC_$$data(_P: bool, _offset: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);
  requires {:source_name "data"} {:array "$$data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data := (if _P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data);
    return;
}



const _WATCHED_VALUE_$$partial_sums: bv32;

procedure {:inline 1} _LOG_READ_$$partial_sums(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$partial_sums;



implementation {:inline 1} _LOG_READ_$$partial_sums(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums == _value then true else _READ_HAS_OCCURRED_$$partial_sums);
    return;
}



procedure _CHECK_READ_$$partial_sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$partial_sums);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$partial_sums: bool;

procedure {:inline 1} _LOG_WRITE_$$partial_sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$partial_sums, _WRITE_READ_BENIGN_FLAG_$$partial_sums;



implementation {:inline 1} _LOG_WRITE_$$partial_sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums == _value then true else _WRITE_HAS_OCCURRED_$$partial_sums);
    _WRITE_READ_BENIGN_FLAG_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$partial_sums);
    return;
}



procedure _CHECK_WRITE_$$partial_sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums != _value);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums != _value);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$partial_sums(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$partial_sums;



implementation {:inline 1} _LOG_ATOMIC_$$partial_sums(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$partial_sums);
    return;
}



procedure _CHECK_ATOMIC_$$partial_sums(_P: bool, _offset: bv32);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$partial_sums(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$partial_sums;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$partial_sums(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$partial_sums := (if _P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$partial_sums);
    return;
}



const _WATCHED_VALUE_$$sums: bv32;

procedure {:inline 1} _LOG_READ_$$sums(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$sums;



implementation {:inline 1} _LOG_READ_$$sums(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sums := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sums == _value then true else _READ_HAS_OCCURRED_$$sums);
    return;
}



procedure _CHECK_READ_$$sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sums"} {:array "$$sums"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sums && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sums && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sums"} {:array "$$sums"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sums && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$sums: bool;

procedure {:inline 1} _LOG_WRITE_$$sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$sums, _WRITE_READ_BENIGN_FLAG_$$sums;



implementation {:inline 1} _LOG_WRITE_$$sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sums := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sums == _value then true else _WRITE_HAS_OCCURRED_$$sums);
    _WRITE_READ_BENIGN_FLAG_$$sums := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sums == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sums);
    return;
}



procedure _CHECK_WRITE_$$sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sums"} {:array "$$sums"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sums != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sums"} {:array "$$sums"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sums != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sums"} {:array "$$sums"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sums && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$sums(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sums;



implementation {:inline 1} _LOG_ATOMIC_$$sums(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sums := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sums);
    return;
}



procedure _CHECK_ATOMIC_$$sums(_P: bool, _offset: bv32);
  requires {:source_name "sums"} {:array "$$sums"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sums && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sums"} {:array "$$sums"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sums && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sums(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sums;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sums(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sums := (if _P && _WRITE_HAS_OCCURRED_$$sums && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sums);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sums;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sums;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sums;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$partial_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$partial_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$partial_sums;
    goto anon5;

  anon5:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$data;
    goto anon7;

  anon7:
    havoc $$partial_sums;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$sums;
    goto anon3;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sums;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sums;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sums;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$partial_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$partial_sums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$partial_sums;
    goto anon5;

  anon5:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$data;
    goto anon7;

  anon7:
    havoc $$partial_sums;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$sums;
    goto anon3;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
