type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$partial_result"} {:global} {:elem_width 32} {:source_name "partial_result"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$partial_result: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$partial_result: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$partial_result: bool;

var {:source_name "histogram_amp"} {:global} $$histogram_amp: [bv32]bv32;

axiom {:array_info "$$histogram_amp"} {:global} {:elem_width 32} {:source_name "histogram_amp"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$histogram_amp: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$histogram_amp: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$histogram_amp: bool;

var {:source_name "s_data"} {:group_shared} $$_ZZ18histo_merge_kernelPjS_E6s_data: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ18histo_merge_kernelPjS_E6s_data"} {:group_shared} {:elem_width 32} {:source_name "s_data"} {:source_elem_width 32} {:source_dimensions "256"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data: bool;

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

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "histo_merge_kernel"} {:kernel} $_Z18histo_merge_kernelPjS_();
  requires !_READ_HAS_OCCURRED_$$partial_result && !_WRITE_HAS_OCCURRED_$$partial_result && !_ATOMIC_HAS_OCCURRED_$$partial_result;
  requires !_READ_HAS_OCCURRED_$$histogram_amp && !_WRITE_HAS_OCCURRED_$$histogram_amp && !_ATOMIC_HAS_OCCURRED_$$histogram_amp;
  requires !_READ_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data && !_WRITE_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data && !_ATOMIC_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data;
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
  modifies $$_ZZ18histo_merge_kernelPjS_E6s_data, _WRITE_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data, _WRITE_READ_BENIGN_FLAG_$$_ZZ18histo_merge_kernelPjS_E6s_data, _WRITE_READ_BENIGN_FLAG_$$_ZZ18histo_merge_kernelPjS_E6s_data, _READ_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data, _WRITE_HAS_OCCURRED_$$histogram_amp, _WRITE_READ_BENIGN_FLAG_$$histogram_amp, _WRITE_READ_BENIGN_FLAG_$$histogram_amp;



implementation {:source_name "histo_merge_kernel"} {:kernel} $_Z18histo_merge_kernelPjS_()
{
  var $sum.0$1: bv32;
  var $sum.0$2: bv32;
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $stride.0: bv32;
  var v0$1: bool;
  var v0$2: bool;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bool;
  var v3$1: bool;
  var v3$2: bool;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bv32;
  var v7$2: bv32;
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
    $sum.0$1, $i.0$1 := 0bv32, local_id_x$1;
    $sum.0$2, $i.0$2 := 0bv32, local_id_x$2;
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 1} p0$1 ==> true;
    v0$1 := (if p0$1 then BV32_ULT($i.0$1, 65536bv32) else v0$1);
    v0$2 := (if p0$2 then BV32_ULT($i.0$2, 65536bv32) else v0$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p1$1 := (if p0$1 && v0$1 then v0$1 else p1$1);
    p1$2 := (if p0$2 && v0$2 then v0$2 else p1$2);
    p0$1 := (if p0$1 && !v0$1 then v0$1 else p0$1);
    p0$2 := (if p0$2 && !v0$2 then v0$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v1$1 := (if p1$1 then _HAVOC_bv32$1 else v1$1);
    v1$2 := (if p1$2 then _HAVOC_bv32$2 else v1$2);
    $sum.0$1, $i.0$1 := (if p1$1 then BV32_ADD($sum.0$1, v1$1) else $sum.0$1), (if p1$1 then BV32_ADD($i.0$1, 256bv32) else $i.0$1);
    $sum.0$2, $i.0$2 := (if p1$2 then BV32_ADD($sum.0$2, v1$2) else $sum.0$2), (if p1$2 then BV32_ADD($i.0$2, 256bv32) else $i.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$_ZZ18histo_merge_kernelPjS_E6s_data(true, local_id_x$1, $sum.0$1, $$_ZZ18histo_merge_kernelPjS_E6s_data[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18histo_merge_kernelPjS_E6s_data(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$_ZZ18histo_merge_kernelPjS_E6s_data(true, local_id_x$2, $sum.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18histo_merge_kernelPjS_E6s_data"} true;
    $$_ZZ18histo_merge_kernelPjS_E6s_data[1bv1][local_id_x$1] := $sum.0$1;
    $$_ZZ18histo_merge_kernelPjS_E6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := $sum.0$2;
    $stride.0 := 128bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 7} true;
    v2 := BV32_SGT($stride.0, 0bv32);
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v2 && !v2;
    v6$1 := local_id_x$1 == 0bv32;
    v6$2 := local_id_x$2 == 0bv32;
    p5$1 := (if v6$1 then v6$1 else p5$1);
    p5$2 := (if v6$2 then v6$2 else p5$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$_ZZ18histo_merge_kernelPjS_E6s_data(p5$1, 0bv32, $$_ZZ18histo_merge_kernelPjS_E6s_data[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$_ZZ18histo_merge_kernelPjS_E6s_data(p5$2, 0bv32, $$_ZZ18histo_merge_kernelPjS_E6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18histo_merge_kernelPjS_E6s_data"} true;
    v7$1 := (if p5$1 then $$_ZZ18histo_merge_kernelPjS_E6s_data[1bv1][0bv32] else v7$1);
    v7$2 := (if p5$2 then $$_ZZ18histo_merge_kernelPjS_E6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v7$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$histogram_amp(p5$1, group_id_x$1, v7$1, $$histogram_amp[group_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histogram_amp(p5$2, group_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$histogram_amp(p5$2, group_id_x$2, v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histogram_amp"} true;
    $$histogram_amp[group_id_x$1] := (if p5$1 then v7$1 else $$histogram_amp[group_id_x$1]);
    $$histogram_amp[group_id_x$2] := (if p5$2 then v7$2 else $$histogram_amp[group_id_x$2]);
    return;

  $truebb0:
    assume {:partition} v2 && v2;
    v3$1 := BV32_ULT(local_id_x$1, $stride.0);
    v3$2 := BV32_ULT(local_id_x$2, $stride.0);
    p4$1 := (if v3$1 then v3$1 else p4$1);
    p4$2 := (if v3$2 then v3$2 else p4$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$_ZZ18histo_merge_kernelPjS_E6s_data(p4$1, BV32_ADD(local_id_x$1, $stride.0), $$_ZZ18histo_merge_kernelPjS_E6s_data[1bv1][BV32_ADD(local_id_x$1, $stride.0)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$_ZZ18histo_merge_kernelPjS_E6s_data(p4$2, BV32_ADD(local_id_x$2, $stride.0), $$_ZZ18histo_merge_kernelPjS_E6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, $stride.0)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18histo_merge_kernelPjS_E6s_data"} true;
    v4$1 := (if p4$1 then $$_ZZ18histo_merge_kernelPjS_E6s_data[1bv1][BV32_ADD(local_id_x$1, $stride.0)] else v4$1);
    v4$2 := (if p4$2 then $$_ZZ18histo_merge_kernelPjS_E6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, $stride.0)] else v4$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$_ZZ18histo_merge_kernelPjS_E6s_data(p4$1, local_id_x$1, $$_ZZ18histo_merge_kernelPjS_E6s_data[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$_ZZ18histo_merge_kernelPjS_E6s_data(p4$2, local_id_x$2, $$_ZZ18histo_merge_kernelPjS_E6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18histo_merge_kernelPjS_E6s_data"} true;
    v5$1 := (if p4$1 then $$_ZZ18histo_merge_kernelPjS_E6s_data[1bv1][local_id_x$1] else v5$1);
    v5$2 := (if p4$2 then $$_ZZ18histo_merge_kernelPjS_E6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v5$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$_ZZ18histo_merge_kernelPjS_E6s_data(p4$1, local_id_x$1, BV32_ADD(v5$1, v4$1), $$_ZZ18histo_merge_kernelPjS_E6s_data[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18histo_merge_kernelPjS_E6s_data(p4$2, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$_ZZ18histo_merge_kernelPjS_E6s_data(p4$2, local_id_x$2, BV32_ADD(v5$2, v4$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18histo_merge_kernelPjS_E6s_data"} true;
    $$_ZZ18histo_merge_kernelPjS_E6s_data[1bv1][local_id_x$1] := (if p4$1 then BV32_ADD(v5$1, v4$1) else $$_ZZ18histo_merge_kernelPjS_E6s_data[1bv1][local_id_x$1]);
    $$_ZZ18histo_merge_kernelPjS_E6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := (if p4$2 then BV32_ADD(v5$2, v4$2) else $$_ZZ18histo_merge_kernelPjS_E6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    $stride.0 := BV32_ASHR($stride.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $5;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $1;
}



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

const _WATCHED_VALUE_$$partial_result: bv32;

procedure {:inline 1} _LOG_READ_$$partial_result(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$partial_result;



implementation {:inline 1} _LOG_READ_$$partial_result(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$partial_result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_result == _value then true else _READ_HAS_OCCURRED_$$partial_result);
    return;
}



procedure _CHECK_READ_$$partial_result(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "partial_result"} {:array "$$partial_result"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$partial_result && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$partial_result);
  requires {:source_name "partial_result"} {:array "$$partial_result"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$partial_result && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$partial_result: bool;

procedure {:inline 1} _LOG_WRITE_$$partial_result(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$partial_result, _WRITE_READ_BENIGN_FLAG_$$partial_result;



implementation {:inline 1} _LOG_WRITE_$$partial_result(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$partial_result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_result == _value then true else _WRITE_HAS_OCCURRED_$$partial_result);
    _WRITE_READ_BENIGN_FLAG_$$partial_result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_result == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$partial_result);
    return;
}



procedure _CHECK_WRITE_$$partial_result(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "partial_result"} {:array "$$partial_result"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$partial_result && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_result != _value);
  requires {:source_name "partial_result"} {:array "$$partial_result"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$partial_result && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_result != _value);
  requires {:source_name "partial_result"} {:array "$$partial_result"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$partial_result && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$partial_result(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$partial_result;



implementation {:inline 1} _LOG_ATOMIC_$$partial_result(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$partial_result := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$partial_result);
    return;
}



procedure _CHECK_ATOMIC_$$partial_result(_P: bool, _offset: bv32);
  requires {:source_name "partial_result"} {:array "$$partial_result"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$partial_result && _WATCHED_OFFSET == _offset);
  requires {:source_name "partial_result"} {:array "$$partial_result"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$partial_result && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$partial_result(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$partial_result;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$partial_result(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$partial_result := (if _P && _WRITE_HAS_OCCURRED_$$partial_result && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$partial_result);
    return;
}



const _WATCHED_VALUE_$$histogram_amp: bv32;

procedure {:inline 1} _LOG_READ_$$histogram_amp(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$histogram_amp;



implementation {:inline 1} _LOG_READ_$$histogram_amp(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$histogram_amp := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histogram_amp == _value then true else _READ_HAS_OCCURRED_$$histogram_amp);
    return;
}



procedure _CHECK_READ_$$histogram_amp(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "histogram_amp"} {:array "$$histogram_amp"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$histogram_amp && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$histogram_amp);
  requires {:source_name "histogram_amp"} {:array "$$histogram_amp"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$histogram_amp && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$histogram_amp: bool;

procedure {:inline 1} _LOG_WRITE_$$histogram_amp(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$histogram_amp, _WRITE_READ_BENIGN_FLAG_$$histogram_amp;



implementation {:inline 1} _LOG_WRITE_$$histogram_amp(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$histogram_amp := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histogram_amp == _value then true else _WRITE_HAS_OCCURRED_$$histogram_amp);
    _WRITE_READ_BENIGN_FLAG_$$histogram_amp := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histogram_amp == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$histogram_amp);
    return;
}



procedure _CHECK_WRITE_$$histogram_amp(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "histogram_amp"} {:array "$$histogram_amp"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$histogram_amp && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histogram_amp != _value);
  requires {:source_name "histogram_amp"} {:array "$$histogram_amp"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$histogram_amp && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histogram_amp != _value);
  requires {:source_name "histogram_amp"} {:array "$$histogram_amp"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$histogram_amp && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$histogram_amp(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$histogram_amp;



implementation {:inline 1} _LOG_ATOMIC_$$histogram_amp(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$histogram_amp := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$histogram_amp);
    return;
}



procedure _CHECK_ATOMIC_$$histogram_amp(_P: bool, _offset: bv32);
  requires {:source_name "histogram_amp"} {:array "$$histogram_amp"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$histogram_amp && _WATCHED_OFFSET == _offset);
  requires {:source_name "histogram_amp"} {:array "$$histogram_amp"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$histogram_amp && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$histogram_amp(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$histogram_amp;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$histogram_amp(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$histogram_amp := (if _P && _WRITE_HAS_OCCURRED_$$histogram_amp && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$histogram_amp);
    return;
}



const _WATCHED_VALUE_$$_ZZ18histo_merge_kernelPjS_E6s_data: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ18histo_merge_kernelPjS_E6s_data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data;



implementation {:inline 1} _LOG_READ_$$_ZZ18histo_merge_kernelPjS_E6s_data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18histo_merge_kernelPjS_E6s_data == _value then true else _READ_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data);
    return;
}



procedure _CHECK_READ_$$_ZZ18histo_merge_kernelPjS_E6s_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_data"} {:array "$$_ZZ18histo_merge_kernelPjS_E6s_data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ18histo_merge_kernelPjS_E6s_data && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$_ZZ18histo_merge_kernelPjS_E6s_data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ18histo_merge_kernelPjS_E6s_data: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ18histo_merge_kernelPjS_E6s_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data, _WRITE_READ_BENIGN_FLAG_$$_ZZ18histo_merge_kernelPjS_E6s_data;



implementation {:inline 1} _LOG_WRITE_$$_ZZ18histo_merge_kernelPjS_E6s_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18histo_merge_kernelPjS_E6s_data == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ18histo_merge_kernelPjS_E6s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18histo_merge_kernelPjS_E6s_data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ18histo_merge_kernelPjS_E6s_data);
    return;
}



procedure _CHECK_WRITE_$$_ZZ18histo_merge_kernelPjS_E6s_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_data"} {:array "$$_ZZ18histo_merge_kernelPjS_E6s_data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18histo_merge_kernelPjS_E6s_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$_ZZ18histo_merge_kernelPjS_E6s_data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18histo_merge_kernelPjS_E6s_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$_ZZ18histo_merge_kernelPjS_E6s_data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ18histo_merge_kernelPjS_E6s_data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ18histo_merge_kernelPjS_E6s_data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ18histo_merge_kernelPjS_E6s_data(_P: bool, _offset: bv32);
  requires {:source_name "s_data"} {:array "$$_ZZ18histo_merge_kernelPjS_E6s_data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$_ZZ18histo_merge_kernelPjS_E6s_data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18histo_merge_kernelPjS_E6s_data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ18histo_merge_kernelPjS_E6s_data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18histo_merge_kernelPjS_E6s_data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ18histo_merge_kernelPjS_E6s_data := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ18histo_merge_kernelPjS_E6s_data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ18histo_merge_kernelPjS_E6s_data);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
