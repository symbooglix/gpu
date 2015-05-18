type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(y: bv32, _P$1: bool, x$1: [bv32]bv32, _P$2: bool, x$2: [bv32]bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$input"} {:global} {:elem_width 32} {:source_name "input"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input: bool;

var {:source_name "minmax"} {:global} $$minmax: [bv32]bv32;

axiom {:array_info "$$minmax"} {:global} {:elem_width 32} {:source_name "minmax"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$minmax: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$minmax: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$minmax: bool;

var {:source_name "Avg"} {:group_shared} $$histo_prescan_kernel.Avg: [bv1][bv32]bv32;

axiom {:array_info "$$histo_prescan_kernel.Avg"} {:group_shared} {:elem_width 32} {:source_name "Avg"} {:source_elem_width 32} {:source_dimensions "512"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$histo_prescan_kernel.Avg: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.Avg: bool;

var {:source_name "StdDev"} {:group_shared} $$histo_prescan_kernel.StdDev: [bv1][bv32]bv32;

axiom {:array_info "$$histo_prescan_kernel.StdDev"} {:group_shared} {:elem_width 32} {:source_name "StdDev"} {:source_elem_width 32} {:source_dimensions "512"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$histo_prescan_kernel.StdDev: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.StdDev: bool;

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

function FDIV32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FP32_TO_UI32(bv32) : bv32;

function FSQRT32(bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

procedure {:source_name "histo_prescan_kernel"} {:kernel} $histo_prescan_kernel($size: bv32);
  requires !_READ_HAS_OCCURRED_$$input && !_WRITE_HAS_OCCURRED_$$input && !_ATOMIC_HAS_OCCURRED_$$input;
  requires !_READ_HAS_OCCURRED_$$minmax && !_WRITE_HAS_OCCURRED_$$minmax && !_ATOMIC_HAS_OCCURRED_$$minmax;
  requires !_READ_HAS_OCCURRED_$$histo_prescan_kernel.Avg && !_WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg && !_ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.Avg;
  requires !_READ_HAS_OCCURRED_$$histo_prescan_kernel.StdDev && !_WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev && !_ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.StdDev;
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
  modifies $$histo_prescan_kernel.Avg, $$histo_prescan_kernel.StdDev, _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg, _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg, _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg, _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev, _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev, _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev, _READ_HAS_OCCURRED_$$histo_prescan_kernel.Avg, _READ_HAS_OCCURRED_$$histo_prescan_kernel.StdDev, _ATOMIC_HAS_OCCURRED_$$minmax, $$minmax, _TRACKING;



implementation {:source_name "histo_prescan_kernel"} {:kernel} $histo_prescan_kernel($size: bv32)
{
  var $addr.0$1: bv32;
  var $addr.0$2: bv32;
  var $avg.0$1: bv32;
  var $avg.0$2: bv32;
  var $count.0$1: bv32;
  var $count.0$2: bv32;
  var $addr2.0$1: bv32;
  var $addr2.0$2: bv32;
  var $stddev.0$1: bv32;
  var $stddev.0$2: bv32;
  var $stride1.0: bv32;
  var v1: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v3: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v44$1: bv32;
  var v44$2: bv32;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11: bool;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bool;
  var v17$2: bool;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bool;
  var v22$2: bool;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27$1: bool;
  var v27$2: bool;
  var v28$1: bv32;
  var v28$2: bv32;
  var v29$1: bv32;
  var v29$2: bv32;
  var v30$1: bv32;
  var v30$2: bv32;
  var v31$1: bv32;
  var v31$2: bv32;
  var v32$1: bool;
  var v32$2: bool;
  var v33$1: bv32;
  var v33$2: bv32;
  var v34$1: bv32;
  var v34$2: bv32;
  var v35$1: bv32;
  var v35$2: bv32;
  var v36$1: bv32;
  var v36$2: bv32;
  var v37$1: bool;
  var v37$2: bool;
  var v38$1: bv32;
  var v38$2: bv32;
  var v39$1: bv32;
  var v39$2: bv32;
  var v40$1: bv32;
  var v40$2: bv32;
  var v41$1: bv32;
  var v41$2: bv32;
  var v42$1: bv32;
  var v42$2: bv32;
  var v43$1: bv32;
  var v43$2: bv32;
  var v45$1: bv32;
  var v45$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1 := group_size_x;
    v2$1 := group_id_x$1;
    v2$2 := group_id_x$2;
    v3 := BV32_UDIV($size, num_groups_x);
    v4$1 := BV32_ADD(BV32_MUL(v2$1, v3), BV32_SDIV(v3, 8bv32));
    v4$2 := BV32_ADD(BV32_MUL(v2$2, v3), BV32_SDIV(v3, 8bv32));
    $addr.0$1, $avg.0$1, $count.0$1 := BV32_ADD(BV32_MUL(v2$1, v3), v0$1), 0bv32, 0bv32;
    $addr.0$2, $avg.0$2, $count.0$2 := BV32_ADD(BV32_MUL(v2$2, v3), v0$2), 0bv32, 0bv32;
    p0$1 := false;
    p0$2 := false;
    p3$1 := false;
    p3$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.StdDev ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$histo_prescan_kernel.StdDev ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.Avg ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$histo_prescan_kernel.Avg ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 1} p0$1 ==> true;
    v5$1 := (if p0$1 then BV32_SLT($addr.0$1, v4$1) else v5$1);
    v5$2 := (if p0$2 then BV32_SLT($addr.0$2, v4$2) else v5$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p1$1 := (if p0$1 && v5$1 then v5$1 else p1$1);
    p1$2 := (if p0$2 && v5$2 then v5$2 else p1$2);
    p0$1 := (if p0$1 && !v5$1 then v5$1 else p0$1);
    p0$2 := (if p0$2 && !v5$2 then v5$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v6$1 := (if p1$1 then _HAVOC_bv32$1 else v6$1);
    v6$2 := (if p1$2 then _HAVOC_bv32$2 else v6$2);
    $addr.0$1, $avg.0$1, $count.0$1 := (if p1$1 then BV32_ADD($addr.0$1, v1) else $addr.0$1), (if p1$1 then FADD32($avg.0$1, UI32_TO_FP32(v6$1)) else $avg.0$1), (if p1$1 then BV32_ADD($count.0$1, 1bv32) else $count.0$1);
    $addr.0$2, $avg.0$2, $count.0$2 := (if p1$2 then BV32_ADD($addr.0$2, v1) else $addr.0$2), (if p1$2 then FADD32($avg.0$2, UI32_TO_FP32(v6$2)) else $avg.0$2), (if p1$2 then BV32_ADD($count.0$2, 1bv32) else $count.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    v7$1 := FDIV32($avg.0$1, UI32_TO_FP32($count.0$1));
    v7$2 := FDIV32($avg.0$2, UI32_TO_FP32($count.0$2));
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$histo_prescan_kernel.Avg(true, v0$1, v7$1, $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$histo_prescan_kernel.Avg(true, v0$2, v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(true, true);
    $$histo_prescan_kernel.Avg[1bv1][v0$1] := v7$1;
    $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := v7$2;
    $addr2.0$1, $stddev.0$1 := BV32_ADD(BV32_MUL(v2$1, v3), v0$1), 0bv32;
    $addr2.0$2, $stddev.0$2 := BV32_ADD(BV32_MUL(v2$2, v3), v0$2), 0bv32;
    p3$1 := true;
    p3$2 := true;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $4;

  $4:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.StdDev ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$histo_prescan_kernel.StdDev ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.Avg ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$histo_prescan_kernel.Avg ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 6} p3$1 ==> true;
    v8$1 := (if p3$1 then BV32_SLT($addr2.0$1, v4$1) else v8$1);
    v8$2 := (if p3$2 then BV32_SLT($addr2.0$2, v4$2) else v8$2);
    p4$1 := false;
    p4$2 := false;
    p4$1 := (if p3$1 && v8$1 then v8$1 else p4$1);
    p4$2 := (if p3$2 && v8$2 then v8$2 else p4$2);
    p3$1 := (if p3$1 && !v8$1 then v8$1 else p3$1);
    p3$2 := (if p3$2 && !v8$2 then v8$2 else p3$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v9$1 := (if p4$1 then _HAVOC_bv32$1 else v9$1);
    v9$2 := (if p4$2 then _HAVOC_bv32$2 else v9$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v10$1 := (if p4$1 then _HAVOC_bv32$1 else v10$1);
    v10$2 := (if p4$2 then _HAVOC_bv32$2 else v10$2);
    $addr2.0$1, $stddev.0$1 := (if p4$1 then BV32_ADD($addr2.0$1, v1) else $addr2.0$1), (if p4$1 then FADD32($stddev.0$1, FMUL32(FSUB32(UI32_TO_FP32(v9$1), v7$1), FSUB32(UI32_TO_FP32(v10$1), v7$1))) else $stddev.0$1);
    $addr2.0$2, $stddev.0$2 := (if p4$2 then BV32_ADD($addr2.0$2, v1) else $addr2.0$2), (if p4$2 then FADD32($stddev.0$2, FMUL32(FSUB32(UI32_TO_FP32(v9$2), v7$2), FSUB32(UI32_TO_FP32(v10$2), v7$2))) else $stddev.0$2);
    p3$1 := (if p4$1 then true else p3$1);
    p3$2 := (if p4$2 then true else p3$2);
    goto $4.backedge, $4.tail;

  $4.tail:
    assume !p3$1 && !p3$2;
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$histo_prescan_kernel.StdDev(true, v0$1, FSQRT32(FDIV32($stddev.0$1, UI32_TO_FP32($count.0$1))), $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$histo_prescan_kernel.StdDev(true, v0$2, FSQRT32(FDIV32($stddev.0$2, UI32_TO_FP32($count.0$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(true, true);
    $$histo_prescan_kernel.StdDev[1bv1][v0$1] := FSQRT32(FDIV32($stddev.0$1, UI32_TO_FP32($count.0$1)));
    $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := FSQRT32(FDIV32($stddev.0$2, UI32_TO_FP32($count.0$2)));
    $stride1.0 := 256bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.StdDev ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$histo_prescan_kernel.StdDev ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.Avg ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$histo_prescan_kernel.Avg ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 12} true;
    v11 := BV32_SGE($stride1.0, 32bv32);
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
    p13$1 := false;
    p13$2 := false;
    p14$1 := false;
    p14$2 := false;
    p15$1 := false;
    p15$2 := false;
    p16$1 := false;
    p16$2 := false;
    goto __partitioned_block_$truebb1_0, $falsebb1;

  $falsebb1:
    assume {:partition} !v11 && !v11;
    v17$1 := BV32_SLT(v0$1, 16bv32);
    v17$2 := BV32_SLT(v0$2, 16bv32);
    p7$1 := (if v17$1 then v17$1 else p7$1);
    p7$2 := (if v17$2 then v17$2 else p7$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p7$1, p7$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_READ_$$histo_prescan_kernel.Avg(p7$1, BV32_ADD(v0$1, 16bv32), $$histo_prescan_kernel.Avg[1bv1][BV32_ADD(v0$1, 16bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 26} _CHECK_READ_$$histo_prescan_kernel.Avg(p7$2, BV32_ADD(v0$2, 16bv32), $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 16bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p7$1, p7$2);
    v18$1 := (if p7$1 then $$histo_prescan_kernel.Avg[1bv1][BV32_ADD(v0$1, 16bv32)] else v18$1);
    v18$2 := (if p7$2 then $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 16bv32)] else v18$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p7$1, p7$2);
    call {:sourceloc} {:sourceloc_num 27} _LOG_READ_$$histo_prescan_kernel.Avg(p7$1, v0$1, $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 27} _CHECK_READ_$$histo_prescan_kernel.Avg(p7$2, v0$2, $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p7$1, p7$2);
    v19$1 := (if p7$1 then $$histo_prescan_kernel.Avg[1bv1][v0$1] else v19$1);
    v19$2 := (if p7$2 then $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] else v19$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(p7$1, p7$2);
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$histo_prescan_kernel.Avg(p7$1, v0$1, FADD32(v19$1, v18$1), $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg(p7$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$histo_prescan_kernel.Avg(p7$2, v0$2, FADD32(v19$2, v18$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(p7$1, p7$2);
    $$histo_prescan_kernel.Avg[1bv1][v0$1] := (if p7$1 then FADD32(v19$1, v18$1) else $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := (if p7$2 then FADD32(v19$2, v18$2) else $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p7$1, p7$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_READ_$$histo_prescan_kernel.StdDev(p7$1, BV32_ADD(v0$1, 16bv32), $$histo_prescan_kernel.StdDev[1bv1][BV32_ADD(v0$1, 16bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 29} _CHECK_READ_$$histo_prescan_kernel.StdDev(p7$2, BV32_ADD(v0$2, 16bv32), $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 16bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p7$1, p7$2);
    v20$1 := (if p7$1 then $$histo_prescan_kernel.StdDev[1bv1][BV32_ADD(v0$1, 16bv32)] else v20$1);
    v20$2 := (if p7$2 then $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 16bv32)] else v20$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p7$1, p7$2);
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$histo_prescan_kernel.StdDev(p7$1, v0$1, $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$histo_prescan_kernel.StdDev(p7$2, v0$2, $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p7$1, p7$2);
    v21$1 := (if p7$1 then $$histo_prescan_kernel.StdDev[1bv1][v0$1] else v21$1);
    v21$2 := (if p7$2 then $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] else v21$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(p7$1, p7$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$histo_prescan_kernel.StdDev(p7$1, v0$1, FADD32(v21$1, v20$1), $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev(p7$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$histo_prescan_kernel.StdDev(p7$2, v0$2, FADD32(v21$2, v20$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(p7$1, p7$2);
    $$histo_prescan_kernel.StdDev[1bv1][v0$1] := (if p7$1 then FADD32(v21$1, v20$1) else $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := (if p7$2 then FADD32(v21$2, v20$2) else $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    v22$1 := BV32_SLT(v0$1, 8bv32);
    v22$2 := BV32_SLT(v0$2, 8bv32);
    p9$1 := (if v22$1 then v22$1 else p9$1);
    p9$2 := (if v22$2 then v22$2 else p9$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p9$1, p9$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$histo_prescan_kernel.Avg(p9$1, BV32_ADD(v0$1, 8bv32), $$histo_prescan_kernel.Avg[1bv1][BV32_ADD(v0$1, 8bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$histo_prescan_kernel.Avg(p9$2, BV32_ADD(v0$2, 8bv32), $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 8bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p9$1, p9$2);
    v23$1 := (if p9$1 then $$histo_prescan_kernel.Avg[1bv1][BV32_ADD(v0$1, 8bv32)] else v23$1);
    v23$2 := (if p9$2 then $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 8bv32)] else v23$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p9$1, p9$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_READ_$$histo_prescan_kernel.Avg(p9$1, v0$1, $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 35} _CHECK_READ_$$histo_prescan_kernel.Avg(p9$2, v0$2, $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p9$1, p9$2);
    v24$1 := (if p9$1 then $$histo_prescan_kernel.Avg[1bv1][v0$1] else v24$1);
    v24$2 := (if p9$2 then $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] else v24$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(p9$1, p9$2);
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$histo_prescan_kernel.Avg(p9$1, v0$1, FADD32(v24$1, v23$1), $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg(p9$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$histo_prescan_kernel.Avg(p9$2, v0$2, FADD32(v24$2, v23$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(p9$1, p9$2);
    $$histo_prescan_kernel.Avg[1bv1][v0$1] := (if p9$1 then FADD32(v24$1, v23$1) else $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := (if p9$2 then FADD32(v24$2, v23$2) else $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p9$1, p9$2);
    call {:sourceloc} {:sourceloc_num 37} _LOG_READ_$$histo_prescan_kernel.StdDev(p9$1, BV32_ADD(v0$1, 8bv32), $$histo_prescan_kernel.StdDev[1bv1][BV32_ADD(v0$1, 8bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 37} _CHECK_READ_$$histo_prescan_kernel.StdDev(p9$2, BV32_ADD(v0$2, 8bv32), $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 8bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p9$1, p9$2);
    v25$1 := (if p9$1 then $$histo_prescan_kernel.StdDev[1bv1][BV32_ADD(v0$1, 8bv32)] else v25$1);
    v25$2 := (if p9$2 then $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 8bv32)] else v25$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p9$1, p9$2);
    call {:sourceloc} {:sourceloc_num 38} _LOG_READ_$$histo_prescan_kernel.StdDev(p9$1, v0$1, $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 38} _CHECK_READ_$$histo_prescan_kernel.StdDev(p9$2, v0$2, $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p9$1, p9$2);
    v26$1 := (if p9$1 then $$histo_prescan_kernel.StdDev[1bv1][v0$1] else v26$1);
    v26$2 := (if p9$2 then $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] else v26$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(p9$1, p9$2);
    call {:sourceloc} {:sourceloc_num 39} _LOG_WRITE_$$histo_prescan_kernel.StdDev(p9$1, v0$1, FADD32(v26$1, v25$1), $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev(p9$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 39} _CHECK_WRITE_$$histo_prescan_kernel.StdDev(p9$2, v0$2, FADD32(v26$2, v25$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(p9$1, p9$2);
    $$histo_prescan_kernel.StdDev[1bv1][v0$1] := (if p9$1 then FADD32(v26$1, v25$1) else $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := (if p9$2 then FADD32(v26$2, v25$2) else $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    v27$1 := BV32_SLT(v0$1, 4bv32);
    v27$2 := BV32_SLT(v0$2, 4bv32);
    p11$1 := (if v27$1 then v27$1 else p11$1);
    p11$2 := (if v27$2 then v27$2 else p11$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p11$1, p11$2);
    call {:sourceloc} {:sourceloc_num 42} _LOG_READ_$$histo_prescan_kernel.Avg(p11$1, BV32_ADD(v0$1, 4bv32), $$histo_prescan_kernel.Avg[1bv1][BV32_ADD(v0$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 42} _CHECK_READ_$$histo_prescan_kernel.Avg(p11$2, BV32_ADD(v0$2, 4bv32), $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p11$1, p11$2);
    v28$1 := (if p11$1 then $$histo_prescan_kernel.Avg[1bv1][BV32_ADD(v0$1, 4bv32)] else v28$1);
    v28$2 := (if p11$2 then $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 4bv32)] else v28$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p11$1, p11$2);
    call {:sourceloc} {:sourceloc_num 43} _LOG_READ_$$histo_prescan_kernel.Avg(p11$1, v0$1, $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 43} _CHECK_READ_$$histo_prescan_kernel.Avg(p11$2, v0$2, $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p11$1, p11$2);
    v29$1 := (if p11$1 then $$histo_prescan_kernel.Avg[1bv1][v0$1] else v29$1);
    v29$2 := (if p11$2 then $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] else v29$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(p11$1, p11$2);
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$histo_prescan_kernel.Avg(p11$1, v0$1, FADD32(v29$1, v28$1), $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg(p11$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$histo_prescan_kernel.Avg(p11$2, v0$2, FADD32(v29$2, v28$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(p11$1, p11$2);
    $$histo_prescan_kernel.Avg[1bv1][v0$1] := (if p11$1 then FADD32(v29$1, v28$1) else $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := (if p11$2 then FADD32(v29$2, v28$2) else $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p11$1, p11$2);
    call {:sourceloc} {:sourceloc_num 45} _LOG_READ_$$histo_prescan_kernel.StdDev(p11$1, BV32_ADD(v0$1, 4bv32), $$histo_prescan_kernel.StdDev[1bv1][BV32_ADD(v0$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 45} _CHECK_READ_$$histo_prescan_kernel.StdDev(p11$2, BV32_ADD(v0$2, 4bv32), $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p11$1, p11$2);
    v30$1 := (if p11$1 then $$histo_prescan_kernel.StdDev[1bv1][BV32_ADD(v0$1, 4bv32)] else v30$1);
    v30$2 := (if p11$2 then $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 4bv32)] else v30$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p11$1, p11$2);
    call {:sourceloc} {:sourceloc_num 46} _LOG_READ_$$histo_prescan_kernel.StdDev(p11$1, v0$1, $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 46} _CHECK_READ_$$histo_prescan_kernel.StdDev(p11$2, v0$2, $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p11$1, p11$2);
    v31$1 := (if p11$1 then $$histo_prescan_kernel.StdDev[1bv1][v0$1] else v31$1);
    v31$2 := (if p11$2 then $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] else v31$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(p11$1, p11$2);
    call {:sourceloc} {:sourceloc_num 47} _LOG_WRITE_$$histo_prescan_kernel.StdDev(p11$1, v0$1, FADD32(v31$1, v30$1), $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev(p11$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 47} _CHECK_WRITE_$$histo_prescan_kernel.StdDev(p11$2, v0$2, FADD32(v31$2, v30$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(p11$1, p11$2);
    $$histo_prescan_kernel.StdDev[1bv1][v0$1] := (if p11$1 then FADD32(v31$1, v30$1) else $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := (if p11$2 then FADD32(v31$2, v30$2) else $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    v32$1 := BV32_SLT(v0$1, 2bv32);
    v32$2 := BV32_SLT(v0$2, 2bv32);
    p13$1 := (if v32$1 then v32$1 else p13$1);
    p13$2 := (if v32$2 then v32$2 else p13$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p13$1, p13$2);
    call {:sourceloc} {:sourceloc_num 50} _LOG_READ_$$histo_prescan_kernel.Avg(p13$1, BV32_ADD(v0$1, 2bv32), $$histo_prescan_kernel.Avg[1bv1][BV32_ADD(v0$1, 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 50} _CHECK_READ_$$histo_prescan_kernel.Avg(p13$2, BV32_ADD(v0$2, 2bv32), $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p13$1, p13$2);
    v33$1 := (if p13$1 then $$histo_prescan_kernel.Avg[1bv1][BV32_ADD(v0$1, 2bv32)] else v33$1);
    v33$2 := (if p13$2 then $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 2bv32)] else v33$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p13$1, p13$2);
    call {:sourceloc} {:sourceloc_num 51} _LOG_READ_$$histo_prescan_kernel.Avg(p13$1, v0$1, $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 51} _CHECK_READ_$$histo_prescan_kernel.Avg(p13$2, v0$2, $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p13$1, p13$2);
    v34$1 := (if p13$1 then $$histo_prescan_kernel.Avg[1bv1][v0$1] else v34$1);
    v34$2 := (if p13$2 then $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] else v34$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(p13$1, p13$2);
    call {:sourceloc} {:sourceloc_num 52} _LOG_WRITE_$$histo_prescan_kernel.Avg(p13$1, v0$1, FADD32(v34$1, v33$1), $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg(p13$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 52} _CHECK_WRITE_$$histo_prescan_kernel.Avg(p13$2, v0$2, FADD32(v34$2, v33$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(p13$1, p13$2);
    $$histo_prescan_kernel.Avg[1bv1][v0$1] := (if p13$1 then FADD32(v34$1, v33$1) else $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := (if p13$2 then FADD32(v34$2, v33$2) else $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p13$1, p13$2);
    call {:sourceloc} {:sourceloc_num 53} _LOG_READ_$$histo_prescan_kernel.StdDev(p13$1, BV32_ADD(v0$1, 2bv32), $$histo_prescan_kernel.StdDev[1bv1][BV32_ADD(v0$1, 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 53} _CHECK_READ_$$histo_prescan_kernel.StdDev(p13$2, BV32_ADD(v0$2, 2bv32), $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p13$1, p13$2);
    v35$1 := (if p13$1 then $$histo_prescan_kernel.StdDev[1bv1][BV32_ADD(v0$1, 2bv32)] else v35$1);
    v35$2 := (if p13$2 then $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, 2bv32)] else v35$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p13$1, p13$2);
    call {:sourceloc} {:sourceloc_num 54} _LOG_READ_$$histo_prescan_kernel.StdDev(p13$1, v0$1, $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 54} _CHECK_READ_$$histo_prescan_kernel.StdDev(p13$2, v0$2, $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p13$1, p13$2);
    v36$1 := (if p13$1 then $$histo_prescan_kernel.StdDev[1bv1][v0$1] else v36$1);
    v36$2 := (if p13$2 then $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] else v36$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(p13$1, p13$2);
    call {:sourceloc} {:sourceloc_num 55} _LOG_WRITE_$$histo_prescan_kernel.StdDev(p13$1, v0$1, FADD32(v36$1, v35$1), $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev(p13$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 55} _CHECK_WRITE_$$histo_prescan_kernel.StdDev(p13$2, v0$2, FADD32(v36$2, v35$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(p13$1, p13$2);
    $$histo_prescan_kernel.StdDev[1bv1][v0$1] := (if p13$1 then FADD32(v36$1, v35$1) else $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := (if p13$2 then FADD32(v36$2, v35$2) else $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    v37$1 := v0$1 == 0bv32;
    v37$2 := v0$2 == 0bv32;
    p15$1 := (if v37$1 then v37$1 else p15$1);
    p15$2 := (if v37$2 then v37$2 else p15$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p15$1, p15$2);
    call {:sourceloc} {:sourceloc_num 58} _LOG_READ_$$histo_prescan_kernel.Avg(p15$1, 0bv32, $$histo_prescan_kernel.Avg[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 58} _CHECK_READ_$$histo_prescan_kernel.Avg(p15$2, 0bv32, $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p15$1, p15$2);
    v38$1 := (if p15$1 then $$histo_prescan_kernel.Avg[1bv1][0bv32] else v38$1);
    v38$2 := (if p15$2 then $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v38$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p15$1, p15$2);
    call {:sourceloc} {:sourceloc_num 59} _LOG_READ_$$histo_prescan_kernel.Avg(p15$1, 1bv32, $$histo_prescan_kernel.Avg[1bv1][1bv32]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 59} _CHECK_READ_$$histo_prescan_kernel.Avg(p15$2, 1bv32, $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p15$1, p15$2);
    v39$1 := (if p15$1 then $$histo_prescan_kernel.Avg[1bv1][1bv32] else v39$1);
    v39$2 := (if p15$2 then $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32] else v39$2);
    v40$1 := (if p15$1 then FDIV32(FADD32(v38$1, v39$1), 1140850688bv32) else v40$1);
    v40$2 := (if p15$2 then FDIV32(FADD32(v38$2, v39$2), 1140850688bv32) else v40$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p15$1, p15$2);
    call {:sourceloc} {:sourceloc_num 60} _LOG_READ_$$histo_prescan_kernel.StdDev(p15$1, 0bv32, $$histo_prescan_kernel.StdDev[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 60} _CHECK_READ_$$histo_prescan_kernel.StdDev(p15$2, 0bv32, $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p15$1, p15$2);
    v41$1 := (if p15$1 then $$histo_prescan_kernel.StdDev[1bv1][0bv32] else v41$1);
    v41$2 := (if p15$2 then $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v41$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p15$1, p15$2);
    call {:sourceloc} {:sourceloc_num 61} _LOG_READ_$$histo_prescan_kernel.StdDev(p15$1, 1bv32, $$histo_prescan_kernel.StdDev[1bv1][1bv32]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 61} _CHECK_READ_$$histo_prescan_kernel.StdDev(p15$2, 1bv32, $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p15$1, p15$2);
    v42$1 := (if p15$1 then $$histo_prescan_kernel.StdDev[1bv1][1bv32] else v42$1);
    v42$2 := (if p15$2 then $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][1bv32] else v42$2);
    v43$1 := (if p15$1 then FDIV32(FADD32(v41$1, v42$1), 1140850688bv32) else v43$1);
    v43$2 := (if p15$2 then FDIV32(FADD32(v41$2, v42$2), 1140850688bv32) else v43$2);
    call _PRE_WARP_SYNC_$$minmax_ATOMIC(p15$1, p15$2);
    call {:sourceloc} {:sourceloc_num 62} {:atomic} {:atomic_function "__bugle_atomic_min_global_uint"} {:arg1 BV32_UDIV(FP32_TO_UI32(FADD32(FMUL32(3240099840bv32, v43$1), v40$1)), 24576bv32)} {:parts 1} {:part 1} _LOG_ATOMIC_$$minmax(p15$1, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 62} {:atomic} {:atomic_function "__bugle_atomic_min_global_uint"} {:arg1 BV32_UDIV(FP32_TO_UI32(FADD32(FMUL32(3240099840bv32, v43$2), v40$2)), 24576bv32)} {:parts 1} {:part 1} _CHECK_ATOMIC_$$minmax(p15$2, 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$minmax"} true;
    call _POST_WARP_SYNC_$$minmax_ATOMIC(p15$1, p15$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v44$1 := (if p15$1 then _HAVOC_bv32$1 else v44$1);
    v44$2 := (if p15$2 then _HAVOC_bv32$2 else v44$2);
    call _PRE_WARP_SYNC_$$minmax_ATOMIC(p15$1, p15$2);
    call {:sourceloc} {:sourceloc_num 63} {:atomic} {:atomic_function "__bugle_atomic_max_global_uint"} {:arg1 BV32_UDIV(FP32_TO_UI32(FADD32(FMUL32(1092616192bv32, v43$1), v40$1)), 24576bv32)} {:parts 1} {:part 1} _LOG_ATOMIC_$$minmax(p15$1, 1bv32);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 63} {:atomic} {:atomic_function "__bugle_atomic_max_global_uint"} {:arg1 BV32_UDIV(FP32_TO_UI32(FADD32(FMUL32(1092616192bv32, v43$2), v40$2)), 24576bv32)} {:parts 1} {:part 1} _CHECK_ATOMIC_$$minmax(p15$2, 1bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$minmax"} true;
    call _POST_WARP_SYNC_$$minmax_ATOMIC(p15$1, p15$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v45$1 := (if p15$1 then _HAVOC_bv32$1 else v45$1);
    v45$2 := (if p15$2 then _HAVOC_bv32$2 else v45$2);
    return;

  __partitioned_block_$truebb1_0:
    assume {:partition} v11 && v11;
    goto __partitioned_block_$truebb1_1;

  __partitioned_block_$truebb1_1:
    call {:sourceloc_num 14} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    v12$1 := BV32_SLT(v0$1, $stride1.0);
    v12$2 := BV32_SLT(v0$2, $stride1.0);
    p6$1 := (if v12$1 then v12$1 else p6$1);
    p6$2 := (if v12$2 then v12$2 else p6$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p6$1, p6$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$histo_prescan_kernel.Avg(p6$1, BV32_ADD(v0$1, $stride1.0), $$histo_prescan_kernel.Avg[1bv1][BV32_ADD(v0$1, $stride1.0)]);
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$histo_prescan_kernel.Avg(p6$2, BV32_ADD(v0$2, $stride1.0), $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, $stride1.0)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p6$1, p6$2);
    v13$1 := (if p6$1 then $$histo_prescan_kernel.Avg[1bv1][BV32_ADD(v0$1, $stride1.0)] else v13$1);
    v13$2 := (if p6$2 then $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, $stride1.0)] else v13$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p6$1, p6$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$histo_prescan_kernel.Avg(p6$1, v0$1, $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$histo_prescan_kernel.Avg(p6$2, v0$2, $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(p6$1, p6$2);
    v14$1 := (if p6$1 then $$histo_prescan_kernel.Avg[1bv1][v0$1] else v14$1);
    v14$2 := (if p6$2 then $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] else v14$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(p6$1, p6$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$histo_prescan_kernel.Avg(p6$1, v0$1, FADD32(v14$1, v13$1), $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg(p6$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$histo_prescan_kernel.Avg(p6$2, v0$2, FADD32(v14$2, v13$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histo_prescan_kernel.Avg"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(p6$1, p6$2);
    $$histo_prescan_kernel.Avg[1bv1][v0$1] := (if p6$1 then FADD32(v14$1, v13$1) else $$histo_prescan_kernel.Avg[1bv1][v0$1]);
    $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := (if p6$2 then FADD32(v14$2, v13$2) else $$histo_prescan_kernel.Avg[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p6$1, p6$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$histo_prescan_kernel.StdDev(p6$1, BV32_ADD(v0$1, $stride1.0), $$histo_prescan_kernel.StdDev[1bv1][BV32_ADD(v0$1, $stride1.0)]);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$histo_prescan_kernel.StdDev(p6$2, BV32_ADD(v0$2, $stride1.0), $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, $stride1.0)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p6$1, p6$2);
    v15$1 := (if p6$1 then $$histo_prescan_kernel.StdDev[1bv1][BV32_ADD(v0$1, $stride1.0)] else v15$1);
    v15$2 := (if p6$2 then $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, $stride1.0)] else v15$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p6$1, p6$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_READ_$$histo_prescan_kernel.StdDev(p6$1, v0$1, $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 20} _CHECK_READ_$$histo_prescan_kernel.StdDev(p6$2, v0$2, $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(p6$1, p6$2);
    v16$1 := (if p6$1 then $$histo_prescan_kernel.StdDev[1bv1][v0$1] else v16$1);
    v16$2 := (if p6$2 then $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] else v16$2);
    call _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(p6$1, p6$2);
    call {:sourceloc} {:sourceloc_num 21} _LOG_WRITE_$$histo_prescan_kernel.StdDev(p6$1, v0$1, FADD32(v16$1, v15$1), $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev(p6$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 21} _CHECK_WRITE_$$histo_prescan_kernel.StdDev(p6$2, v0$2, FADD32(v16$2, v15$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histo_prescan_kernel.StdDev"} true;
    call _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(p6$1, p6$2);
    $$histo_prescan_kernel.StdDev[1bv1][v0$1] := (if p6$1 then FADD32(v16$1, v15$1) else $$histo_prescan_kernel.StdDev[1bv1][v0$1]);
    $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2] := (if p6$2 then FADD32(v16$2, v15$2) else $$histo_prescan_kernel.StdDev[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v0$2]);
    $stride1.0 := BV32_ASHR($stride1.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $7;

  $4.backedge:
    assume {:backedge} p3$1 || p3$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $4;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

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
  requires $1 == 0bv1;
  modifies $$histo_prescan_kernel.Avg, $$histo_prescan_kernel.StdDev, $$minmax, _TRACKING;



procedure {:inline 1} _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$minmax_ATOMIC(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$minmax_ATOMIC(_P$1: bool, _P$2: bool);



const _WATCHED_VALUE_$$input: bv32;

procedure {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _READ_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_READ_$$input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$input);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$input: bool;

procedure {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$input, _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _WRITE_HAS_OCCURRED_$$input);
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



procedure _CHECK_WRITE_$$input(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_ATOMIC_$$input(_P: bool, _offset: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



const _WATCHED_VALUE_$$minmax: bv32;

procedure {:inline 1} _LOG_READ_$$minmax(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$minmax;



implementation {:inline 1} _LOG_READ_$$minmax(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$minmax := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$minmax == _value then true else _READ_HAS_OCCURRED_$$minmax);
    return;
}



procedure _CHECK_READ_$$minmax(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "minmax"} {:array "$$minmax"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$minmax && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$minmax);
  requires {:source_name "minmax"} {:array "$$minmax"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$minmax && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$minmax: bool;

procedure {:inline 1} _LOG_WRITE_$$minmax(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$minmax, _WRITE_READ_BENIGN_FLAG_$$minmax;



implementation {:inline 1} _LOG_WRITE_$$minmax(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$minmax := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$minmax == _value then true else _WRITE_HAS_OCCURRED_$$minmax);
    _WRITE_READ_BENIGN_FLAG_$$minmax := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$minmax == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$minmax);
    return;
}



procedure _CHECK_WRITE_$$minmax(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "minmax"} {:array "$$minmax"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$minmax && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$minmax != _value);
  requires {:source_name "minmax"} {:array "$$minmax"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$minmax && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$minmax != _value);
  requires {:source_name "minmax"} {:array "$$minmax"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$minmax && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$minmax(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$minmax;



implementation {:inline 1} _LOG_ATOMIC_$$minmax(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$minmax := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$minmax);
    return;
}



procedure _CHECK_ATOMIC_$$minmax(_P: bool, _offset: bv32);
  requires {:source_name "minmax"} {:array "$$minmax"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$minmax && _WATCHED_OFFSET == _offset);
  requires {:source_name "minmax"} {:array "$$minmax"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$minmax && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$minmax(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$minmax;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$minmax(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$minmax := (if _P && _WRITE_HAS_OCCURRED_$$minmax && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$minmax);
    return;
}



const _WATCHED_VALUE_$$histo_prescan_kernel.Avg: bv32;

procedure {:inline 1} _LOG_READ_$$histo_prescan_kernel.Avg(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$histo_prescan_kernel.Avg;



implementation {:inline 1} _LOG_READ_$$histo_prescan_kernel.Avg(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$histo_prescan_kernel.Avg := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_prescan_kernel.Avg == _value then true else _READ_HAS_OCCURRED_$$histo_prescan_kernel.Avg);
    return;
}



procedure _CHECK_READ_$$histo_prescan_kernel.Avg(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Avg"} {:array "$$histo_prescan_kernel.Avg"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "Avg"} {:array "$$histo_prescan_kernel.Avg"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.Avg && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg: bool;

procedure {:inline 1} _LOG_WRITE_$$histo_prescan_kernel.Avg(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg, _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg;



implementation {:inline 1} _LOG_WRITE_$$histo_prescan_kernel.Avg(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_prescan_kernel.Avg == _value then true else _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg);
    _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_prescan_kernel.Avg == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg);
    return;
}



procedure _CHECK_WRITE_$$histo_prescan_kernel.Avg(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Avg"} {:array "$$histo_prescan_kernel.Avg"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_prescan_kernel.Avg != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "Avg"} {:array "$$histo_prescan_kernel.Avg"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$histo_prescan_kernel.Avg && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_prescan_kernel.Avg != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "Avg"} {:array "$$histo_prescan_kernel.Avg"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.Avg && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$histo_prescan_kernel.Avg(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.Avg;



implementation {:inline 1} _LOG_ATOMIC_$$histo_prescan_kernel.Avg(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.Avg := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.Avg);
    return;
}



procedure _CHECK_ATOMIC_$$histo_prescan_kernel.Avg(_P: bool, _offset: bv32);
  requires {:source_name "Avg"} {:array "$$histo_prescan_kernel.Avg"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "Avg"} {:array "$$histo_prescan_kernel.Avg"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$histo_prescan_kernel.Avg && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg := (if _P && _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.Avg);
    return;
}



const _WATCHED_VALUE_$$histo_prescan_kernel.StdDev: bv32;

procedure {:inline 1} _LOG_READ_$$histo_prescan_kernel.StdDev(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$histo_prescan_kernel.StdDev;



implementation {:inline 1} _LOG_READ_$$histo_prescan_kernel.StdDev(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$histo_prescan_kernel.StdDev := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_prescan_kernel.StdDev == _value then true else _READ_HAS_OCCURRED_$$histo_prescan_kernel.StdDev);
    return;
}



procedure _CHECK_READ_$$histo_prescan_kernel.StdDev(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "StdDev"} {:array "$$histo_prescan_kernel.StdDev"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "StdDev"} {:array "$$histo_prescan_kernel.StdDev"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.StdDev && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev: bool;

procedure {:inline 1} _LOG_WRITE_$$histo_prescan_kernel.StdDev(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev, _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev;



implementation {:inline 1} _LOG_WRITE_$$histo_prescan_kernel.StdDev(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_prescan_kernel.StdDev == _value then true else _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev);
    _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_prescan_kernel.StdDev == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev);
    return;
}



procedure _CHECK_WRITE_$$histo_prescan_kernel.StdDev(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "StdDev"} {:array "$$histo_prescan_kernel.StdDev"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_prescan_kernel.StdDev != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "StdDev"} {:array "$$histo_prescan_kernel.StdDev"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$histo_prescan_kernel.StdDev && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histo_prescan_kernel.StdDev != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "StdDev"} {:array "$$histo_prescan_kernel.StdDev"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.StdDev && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$histo_prescan_kernel.StdDev(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.StdDev;



implementation {:inline 1} _LOG_ATOMIC_$$histo_prescan_kernel.StdDev(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.StdDev := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.StdDev);
    return;
}



procedure _CHECK_ATOMIC_$$histo_prescan_kernel.StdDev(_P: bool, _offset: bv32);
  requires {:source_name "StdDev"} {:array "$$histo_prescan_kernel.StdDev"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "StdDev"} {:array "$$histo_prescan_kernel.StdDev"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$histo_prescan_kernel.StdDev && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev := (if _P && _WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$histo_prescan_kernel.StdDev);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$histo_prescan_kernel.Avg;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.Avg;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$histo_prescan_kernel.StdDev;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.StdDev;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$minmax;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$minmax;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$minmax;
    goto anon6;

  anon6:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$minmax;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$histo_prescan_kernel.Avg;
    goto anon4;

  anon4:
    havoc $$histo_prescan_kernel.StdDev;
    goto anon5;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

implementation {:inline 1} _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$histo_prescan_kernel.Avg;
    assume !_WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg;
    assume !_ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.Avg;
    goto anon0;

  anon0:
    havoc $$histo_prescan_kernel.Avg;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg;
    goto anon0;

  anon0:
    havoc $$histo_prescan_kernel.Avg;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$histo_prescan_kernel.StdDev;
    assume !_WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev;
    assume !_ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.StdDev;
    goto anon0;

  anon0:
    havoc $$histo_prescan_kernel.StdDev;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev;
    goto anon0;

  anon0:
    havoc $$histo_prescan_kernel.StdDev;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$histo_prescan_kernel.Avg;
    assume !_ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.Avg;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$histo_prescan_kernel.Avg_READ(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$histo_prescan_kernel.Avg;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$histo_prescan_kernel.StdDev;
    assume !_ATOMIC_HAS_OCCURRED_$$histo_prescan_kernel.StdDev;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$histo_prescan_kernel.StdDev_READ(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$histo_prescan_kernel.StdDev;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$minmax_ATOMIC(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$minmax;
    assume !_WRITE_HAS_OCCURRED_$$minmax;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$minmax_ATOMIC(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_ATOMIC_HAS_OCCURRED_$$minmax;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}


