type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x$1: [bv32]bv32, y$1: bv32, x$2: [bv32]bv32, y$2: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$Image"} {:global} {:elem_width 32} {:source_name "Image"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Image: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Image: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Image: bool;

var {:source_name "Histogram"} {:global} $$Histogram: [bv32]bv32;

axiom {:array_info "$$Histogram"} {:global} {:elem_width 32} {:source_name "Histogram"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Histogram: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Histogram: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Histogram: bool;

var {:source_name "subhists"} {:group_shared} $$histogramKernel.subhists: [bv1][bv32]bv32;

axiom {:array_info "$$histogramKernel.subhists"} {:group_shared} {:elem_width 32} {:source_name "subhists"} {:source_elem_width 32} {:source_dimensions "4096"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$histogramKernel.subhists: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$histogramKernel.subhists: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$histogramKernel.subhists: bool;

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

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "bvurem"} BV32_UREM(bv32, bv32) : bv32;

procedure {:source_name "histogramKernel"} {:kernel} $histogramKernel($n4VectorsPerThread: bv32);
  requires !_READ_HAS_OCCURRED_$$Image && !_WRITE_HAS_OCCURRED_$$Image && !_ATOMIC_HAS_OCCURRED_$$Image;
  requires !_READ_HAS_OCCURRED_$$Histogram && !_WRITE_HAS_OCCURRED_$$Histogram && !_ATOMIC_HAS_OCCURRED_$$Histogram;
  requires !_READ_HAS_OCCURRED_$$histogramKernel.subhists && !_WRITE_HAS_OCCURRED_$$histogramKernel.subhists && !_ATOMIC_HAS_OCCURRED_$$histogramKernel.subhists;
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
  modifies $$histogramKernel.subhists, _USED_$$histogramKernel.subhists, _WRITE_HAS_OCCURRED_$$histogramKernel.subhists, _WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists, _WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists, $$Histogram, _TRACKING, _TRACKING, _READ_HAS_OCCURRED_$$histogramKernel.subhists, _WRITE_HAS_OCCURRED_$$Histogram, _WRITE_READ_BENIGN_FLAG_$$Histogram, _WRITE_READ_BENIGN_FLAG_$$Histogram, _ATOMIC_HAS_OCCURRED_$$histogramKernel.subhists;



implementation {:source_name "histogramKernel"} {:kernel} $histogramKernel($n4VectorsPerThread: bv32)
{
  var $0: bv32;
  var $1: bv32;
  var $2: bv32;
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $idx.0$1: bv32;
  var $idx.0$2: bv32;
  var $i.1: bv32;
  var $idx.1$1: bv32;
  var $idx.1$2: bv32;
  var $i.2$1: bv32;
  var $i.2$2: bv32;
  var $bin.0$1: bv32;
  var $bin.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bool;
  var v3: bool;
  var v4: bv32;
  var v5: bool;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v8: bool;
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
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
  var v36$1: bv32;
  var v36$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27$1: bv32;
  var v27$2: bv32;
  var v28$1: bv32;
  var v28$2: bv32;
  var v29$1: bv32;
  var v29$2: bv32;
  var v30$1: bv32;
  var v30$2: bv32;
  var v31$1: bv32;
  var v31$2: bv32;
  var v32$1: bv32;
  var v32$2: bv32;
  var v33$1: bv32;
  var v33$2: bv32;
  var v34$1: bv32;
  var v34$2: bv32;
  var v35$1: bv32;
  var v35$2: bv32;
  var v37$1: bool;
  var v37$2: bool;
  var v38$1: bool;
  var v38$2: bool;
  var v39$1: bv32;
  var v39$2: bv32;
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
    v1$1 := BV32_UREM(v0$1, 16bv32);
    v1$2 := BV32_UREM(v0$2, 16bv32);
    v2 := BV32_ULT(1bv32, BV32_UDIV(group_size_x, 4096bv32));
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p3$1 := false;
    p3$2 := false;
    p5$1 := false;
    p5$2 := false;
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v2 && !v2;
    $0 := BV32_UDIV(group_size_x, 4096bv32);
    goto $3;

  $3:
    v3 := BV32_UGT(1bv32, BV32_UDIV($0, 4096bv32));
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v3 && !v3;
    $1 := BV32_UDIV($0, 4096bv32);
    goto $6;

  $6:
    v4 := BV32_UDIV(4096bv32, $1);
    v5 := BV32_ULT(group_size_x, v4);
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v5 && !v5;
    $2 := v4;
    goto $9;

  $9:
    v6$1 := BV32_ULT(v0$1, $2);
    v6$2 := BV32_ULT(v0$2, $2);
    p0$1 := (if v6$1 then v6$1 else p0$1);
    p0$2 := (if v6$2 then v6$2 else p0$2);
    $i.0$1, $idx.0$1 := (if p0$1 then 0bv32 else $i.0$1), (if p0$1 then v0$1 else $idx.0$1);
    $i.0$2, $idx.0$2 := (if p0$2 then 0bv32 else $i.0$2), (if p0$2 then v0$2 else $idx.0$2);
    p1$1 := (if p0$1 then true else p1$1);
    p1$2 := (if p0$2 then true else p1$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $11;

  $11:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$histogramKernel.subhists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$histogramKernel.subhists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$histogramKernel.subhists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 11} p1$1 ==> true;
    v7$1 := (if p1$1 then BV32_ULT($i.0$1, BV32_UDIV(BV32_UDIV(4096bv32, $2), 4bv32)) else v7$1);
    v7$2 := (if p1$2 then BV32_ULT($i.0$2, BV32_UDIV(BV32_UDIV(4096bv32, $2), 4bv32)) else v7$2);
    p2$1 := false;
    p2$2 := false;
    p2$1 := (if p1$1 && v7$1 then v7$1 else p2$1);
    p2$2 := (if p1$2 && v7$2 then v7$2 else p2$2);
    p1$1 := (if p1$1 && !v7$1 then v7$1 else p1$1);
    p1$2 := (if p1$2 && !v7$2 then v7$2 else p1$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$histogramKernel.subhists(p2$1, BV32_MUL($idx.0$1, 4bv32), 0bv32, $$histogramKernel.subhists[1bv1][BV32_MUL($idx.0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists(p2$2, BV32_MUL($idx.0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$histogramKernel.subhists(p2$2, BV32_MUL($idx.0$2, 4bv32), 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histogramKernel.subhists"} true;
    $$histogramKernel.subhists[1bv1][BV32_MUL($idx.0$1, 4bv32)] := (if p2$1 then 0bv32 else $$histogramKernel.subhists[1bv1][BV32_MUL($idx.0$1, 4bv32)]);
    $$histogramKernel.subhists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($idx.0$2, 4bv32)] := (if p2$2 then 0bv32 else $$histogramKernel.subhists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL($idx.0$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$histogramKernel.subhists(p2$1, BV32_ADD(BV32_MUL($idx.0$1, 4bv32), 1bv32), 0bv32, $$histogramKernel.subhists[1bv1][BV32_ADD(BV32_MUL($idx.0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists(p2$2, BV32_ADD(BV32_MUL($idx.0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$histogramKernel.subhists(p2$2, BV32_ADD(BV32_MUL($idx.0$2, 4bv32), 1bv32), 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histogramKernel.subhists"} true;
    $$histogramKernel.subhists[1bv1][BV32_ADD(BV32_MUL($idx.0$1, 4bv32), 1bv32)] := (if p2$1 then 0bv32 else $$histogramKernel.subhists[1bv1][BV32_ADD(BV32_MUL($idx.0$1, 4bv32), 1bv32)]);
    $$histogramKernel.subhists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($idx.0$2, 4bv32), 1bv32)] := (if p2$2 then 0bv32 else $$histogramKernel.subhists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($idx.0$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$histogramKernel.subhists(p2$1, BV32_ADD(BV32_MUL($idx.0$1, 4bv32), 2bv32), 0bv32, $$histogramKernel.subhists[1bv1][BV32_ADD(BV32_MUL($idx.0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists(p2$2, BV32_ADD(BV32_MUL($idx.0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$histogramKernel.subhists(p2$2, BV32_ADD(BV32_MUL($idx.0$2, 4bv32), 2bv32), 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histogramKernel.subhists"} true;
    $$histogramKernel.subhists[1bv1][BV32_ADD(BV32_MUL($idx.0$1, 4bv32), 2bv32)] := (if p2$1 then 0bv32 else $$histogramKernel.subhists[1bv1][BV32_ADD(BV32_MUL($idx.0$1, 4bv32), 2bv32)]);
    $$histogramKernel.subhists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($idx.0$2, 4bv32), 2bv32)] := (if p2$2 then 0bv32 else $$histogramKernel.subhists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($idx.0$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$histogramKernel.subhists(p2$1, BV32_ADD(BV32_MUL($idx.0$1, 4bv32), 3bv32), 0bv32, $$histogramKernel.subhists[1bv1][BV32_ADD(BV32_MUL($idx.0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists(p2$2, BV32_ADD(BV32_MUL($idx.0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$histogramKernel.subhists(p2$2, BV32_ADD(BV32_MUL($idx.0$2, 4bv32), 3bv32), 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$histogramKernel.subhists"} true;
    $$histogramKernel.subhists[1bv1][BV32_ADD(BV32_MUL($idx.0$1, 4bv32), 3bv32)] := (if p2$1 then 0bv32 else $$histogramKernel.subhists[1bv1][BV32_ADD(BV32_MUL($idx.0$1, 4bv32), 3bv32)]);
    $$histogramKernel.subhists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($idx.0$2, 4bv32), 3bv32)] := (if p2$2 then 0bv32 else $$histogramKernel.subhists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($idx.0$2, 4bv32), 3bv32)]);
    $i.0$1, $idx.0$1 := (if p2$1 then BV32_ADD($i.0$1, 1bv32) else $i.0$1), (if p2$1 then BV32_ADD($idx.0$1, $2) else $idx.0$1);
    $i.0$2, $idx.0$2 := (if p2$2 then BV32_ADD($i.0$2, 1bv32) else $i.0$2), (if p2$2 then BV32_ADD($idx.0$2, $2) else $idx.0$2);
    p1$1 := (if p2$1 then true else p1$1);
    p1$2 := (if p2$2 then true else p1$2);
    goto $11.backedge, __partitioned_block_$11.tail_0;

  __partitioned_block_$11.tail_0:
    assume !p1$1 && !p1$2;
    goto __partitioned_block_$11.tail_1;

  __partitioned_block_$11.tail_1:
    call {:sourceloc_num 20} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    $i.1, $idx.1$1 := 0bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    $idx.1$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $16;

  $16:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$histogramKernel.subhists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$histogramKernel.subhists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$histogramKernel.subhists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 21} true;
    v8 := BV32_ULT($i.1, $n4VectorsPerThread);
    p4$1 := false;
    p4$2 := false;
    p7$1 := false;
    p7$2 := false;
    goto $truebb4, __partitioned_block_$falsebb4_0;

  __partitioned_block_$falsebb4_0:
    assume {:partition} !v8 && !v8;
    goto __partitioned_block_$falsebb4_1;

  __partitioned_block_$falsebb4_1:
    call {:sourceloc_num 45} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    v37$1 := BV32_ULT(v0$1, 256bv32);
    v37$2 := BV32_ULT(v0$2, 256bv32);
    p4$1 := (if v37$1 then v37$1 else p4$1);
    p4$2 := (if v37$2 then v37$2 else p4$2);
    $i.2$1, $bin.0$1 := (if p4$1 then 0bv32 else $i.2$1), (if p4$1 then 0bv32 else $bin.0$1);
    $i.2$2, $bin.0$2 := (if p4$2 then 0bv32 else $i.2$2), (if p4$2 then 0bv32 else $bin.0$2);
    p5$1 := (if p4$1 then true else p5$1);
    p5$2 := (if p4$2 then true else p5$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $21;

  $21:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$histogramKernel.subhists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$histogramKernel.subhists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$histogramKernel.subhists ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 47} p5$1 ==> true;
    v38$1 := (if p5$1 then BV32_ULT($i.2$1, 16bv32) else v38$1);
    v38$2 := (if p5$2 then BV32_ULT($i.2$2, 16bv32) else v38$2);
    p6$1 := false;
    p6$2 := false;
    p6$1 := (if p5$1 && v38$1 then v38$1 else p6$1);
    p6$2 := (if p5$2 && v38$2 then v38$2 else p6$2);
    p5$1 := (if p5$1 && !v38$1 then v38$1 else p5$1);
    p5$2 := (if p5$2 && !v38$2 then v38$2 else p5$2);
    call {:sourceloc} {:sourceloc_num 49} _LOG_READ_$$histogramKernel.subhists(p6$1, BV32_ADD(BV32_MUL(v0$1, 16bv32), $i.2$1), $$histogramKernel.subhists[1bv1][BV32_ADD(BV32_MUL(v0$1, 16bv32), $i.2$1)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 49} _CHECK_READ_$$histogramKernel.subhists(p6$2, BV32_ADD(BV32_MUL(v0$2, 16bv32), $i.2$2), $$histogramKernel.subhists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 16bv32), $i.2$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$histogramKernel.subhists"} true;
    v39$1 := (if p6$1 then $$histogramKernel.subhists[1bv1][BV32_ADD(BV32_MUL(v0$1, 16bv32), $i.2$1)] else v39$1);
    v39$2 := (if p6$2 then $$histogramKernel.subhists[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 16bv32), $i.2$2)] else v39$2);
    $i.2$1, $bin.0$1 := (if p6$1 then BV32_ADD($i.2$1, 1bv32) else $i.2$1), (if p6$1 then BV32_ADD($bin.0$1, v39$1) else $bin.0$1);
    $i.2$2, $bin.0$2 := (if p6$2 then BV32_ADD($i.2$2, 1bv32) else $i.2$2), (if p6$2 then BV32_ADD($bin.0$2, v39$2) else $bin.0$2);
    p5$1 := (if p6$1 then true else p5$1);
    p5$2 := (if p6$2 then true else p5$2);
    goto $21.backedge, $21.tail;

  $21.tail:
    assume !p5$1 && !p5$2;
    call {:sourceloc} {:sourceloc_num 52} _LOG_WRITE_$$Histogram(p4$1, BV32_ADD(BV32_MUL(group_id_x$1, 256bv32), v0$1), $bin.0$1, $$Histogram[BV32_ADD(BV32_MUL(group_id_x$1, 256bv32), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$Histogram(p4$2, BV32_ADD(BV32_MUL(group_id_x$2, 256bv32), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 52} _CHECK_WRITE_$$Histogram(p4$2, BV32_ADD(BV32_MUL(group_id_x$2, 256bv32), v0$2), $bin.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$Histogram"} true;
    $$Histogram[BV32_ADD(BV32_MUL(group_id_x$1, 256bv32), v0$1)] := (if p4$1 then $bin.0$1 else $$Histogram[BV32_ADD(BV32_MUL(group_id_x$1, 256bv32), v0$1)]);
    $$Histogram[BV32_ADD(BV32_MUL(group_id_x$2, 256bv32), v0$2)] := (if p4$2 then $bin.0$2 else $$Histogram[BV32_ADD(BV32_MUL(group_id_x$2, 256bv32), v0$2)]);
    return;

  $21.backedge:
    assume {:backedge} p5$1 || p5$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $21;

  $truebb4:
    assume {:partition} v8 && v8;
    havoc v9$1, v9$2;
    havoc v10$1, v10$2;
    havoc v11$1, v11$2;
    havoc v12$1, v12$2;
    call {:sourceloc} {:sourceloc_num 27} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v9$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 27} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v9$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v13$1, v13$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v9$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v13$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v9$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v13$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v9$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v13$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v9$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v13$2] := true;
    call {:sourceloc} {:sourceloc_num 28} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v10$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 28} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v10$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v14$1, v14$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v10$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v14$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v10$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v14$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v10$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v14$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v10$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v14$2] := true;
    call {:sourceloc} {:sourceloc_num 29} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v11$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 29} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v11$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v15$1, v15$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v11$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v15$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v11$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v15$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v11$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v15$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v11$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v15$2] := true;
    call {:sourceloc} {:sourceloc_num 30} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v12$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 30} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v12$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v16$1, v16$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v12$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v16$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v12$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v16$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v12$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v16$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v12$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v16$2] := true;
    v17$1 := BV32_LSHR(v9$1, 8bv32);
    v17$2 := BV32_LSHR(v9$2, 8bv32);
    v18$1 := BV32_LSHR(v10$1, 8bv32);
    v18$2 := BV32_LSHR(v10$2, 8bv32);
    v19$1 := BV32_LSHR(v11$1, 8bv32);
    v19$2 := BV32_LSHR(v11$2, 8bv32);
    v20$1 := BV32_LSHR(v12$1, 8bv32);
    v20$2 := BV32_LSHR(v12$2, 8bv32);
    call {:sourceloc} {:sourceloc_num 31} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v17$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 31} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v17$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v21$1, v21$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v17$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v21$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v17$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v21$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v17$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v21$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v17$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v21$2] := true;
    call {:sourceloc} {:sourceloc_num 32} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v18$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 32} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v18$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v22$1, v22$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v18$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v22$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v18$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v22$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v18$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v22$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v18$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v22$2] := true;
    call {:sourceloc} {:sourceloc_num 33} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v19$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 33} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v19$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v23$1, v23$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v19$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v23$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v19$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v23$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v19$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v23$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v19$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v23$2] := true;
    call {:sourceloc} {:sourceloc_num 34} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v20$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 34} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v20$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v24$1, v24$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v20$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v24$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v20$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v24$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v20$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v24$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v20$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v24$2] := true;
    v25$1 := BV32_LSHR(v17$1, 8bv32);
    v25$2 := BV32_LSHR(v17$2, 8bv32);
    v26$1 := BV32_LSHR(v18$1, 8bv32);
    v26$2 := BV32_LSHR(v18$2, 8bv32);
    v27$1 := BV32_LSHR(v19$1, 8bv32);
    v27$2 := BV32_LSHR(v19$2, 8bv32);
    v28$1 := BV32_LSHR(v20$1, 8bv32);
    v28$2 := BV32_LSHR(v20$2, 8bv32);
    call {:sourceloc} {:sourceloc_num 35} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v25$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 35} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v25$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v29$1, v29$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v25$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v29$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v25$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v29$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v25$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v29$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v25$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v29$2] := true;
    call {:sourceloc} {:sourceloc_num 36} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v26$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 36} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v26$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v30$1, v30$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v26$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v30$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v26$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v30$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v26$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v30$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v26$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v30$2] := true;
    call {:sourceloc} {:sourceloc_num 37} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v27$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 37} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v27$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v31$1, v31$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v27$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v31$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v27$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v31$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v27$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v31$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v27$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v31$2] := true;
    call {:sourceloc} {:sourceloc_num 38} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v28$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 38} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v28$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v32$1, v32$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v28$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v32$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v28$1, 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v32$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v28$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v32$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(v28$2, 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v32$2] := true;
    call {:sourceloc} {:sourceloc_num 39} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v25$1, 8bv32), 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 39} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v25$2, 8bv32), 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v33$1, v33$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v25$1, 8bv32), 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v33$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v25$1, 8bv32), 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v33$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v25$2, 8bv32), 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v33$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v25$2, 8bv32), 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v33$2] := true;
    call {:sourceloc} {:sourceloc_num 40} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v26$1, 8bv32), 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 40} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v26$2, 8bv32), 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v34$1, v34$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v26$1, 8bv32), 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v34$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v26$1, 8bv32), 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v34$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v26$2, 8bv32), 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v34$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v26$2, 8bv32), 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v34$2] := true;
    call {:sourceloc} {:sourceloc_num 41} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v27$1, 8bv32), 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 41} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v27$2, 8bv32), 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v35$1, v35$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v27$1, 8bv32), 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v35$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v27$1, 8bv32), 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v35$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v27$2, 8bv32), 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v35$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v27$2, 8bv32), 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v35$2] := true;
    call {:sourceloc} {:sourceloc_num 42} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _LOG_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v28$1, 8bv32), 255bv32), 16bv32), v1$1), 4bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 42} {:atomic} {:atomic_function "__bugle_atomic_inc_local_uint"} {:parts 1} {:part 1} _CHECK_ATOMIC_$$histogramKernel.subhists(true, BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v28$2, 8bv32), 255bv32), 16bv32), v1$2), 4bv32), 4bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_ATOMIC_$$histogramKernel.subhists"} true;
    havoc v36$1, v36$2;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v28$1, 8bv32), 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v36$1];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v28$1, 8bv32), 255bv32), 16bv32), v1$1), 4bv32), 4bv32)][v36$1] := true;
    assume !_USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v28$2, 8bv32), 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v36$2];
    _USED_$$histogramKernel.subhists[BV32_SDIV(BV32_MUL(BV32_ADD(BV32_MUL(BV32_AND(BV32_LSHR(v28$2, 8bv32), 255bv32), 16bv32), v1$2), 4bv32), 4bv32)][v36$2] := true;
    $i.1, $idx.1$1 := BV32_ADD($i.1, 1bv32), BV32_ADD($idx.1$1, BV32_MUL(group_size_x, num_groups_x));
    $idx.1$2 := BV32_ADD($idx.1$2, BV32_MUL(group_size_x, num_groups_x));
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $16;

  $11.backedge:
    assume {:backedge} p1$1 || p1$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $11;

  $truebb1:
    assume {:partition} v5 && v5;
    $2 := group_size_x;
    goto $9;

  $truebb0:
    assume {:partition} v3 && v3;
    $1 := 1bv32;
    goto $6;

  $truebb:
    assume {:partition} v2 && v2;
    $0 := 1bv32;
    goto $3;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$histogramKernel.subhists, $$Histogram, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$histogramKernel.subhists, $$Histogram, _TRACKING;



var {:atomic_usedmap} _USED_$$histogramKernel.subhists: [bv32][bv32]bool;

const _WATCHED_VALUE_$$Image: bv32;

procedure {:inline 1} _LOG_READ_$$Image(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$Image;



implementation {:inline 1} _LOG_READ_$$Image(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$Image := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Image == _value then true else _READ_HAS_OCCURRED_$$Image);
    return;
}



procedure _CHECK_READ_$$Image(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Image"} {:array "$$Image"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$Image && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$Image);
  requires {:source_name "Image"} {:array "$$Image"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$Image && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$Image: bool;

procedure {:inline 1} _LOG_WRITE_$$Image(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$Image, _WRITE_READ_BENIGN_FLAG_$$Image;



implementation {:inline 1} _LOG_WRITE_$$Image(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$Image := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Image == _value then true else _WRITE_HAS_OCCURRED_$$Image);
    _WRITE_READ_BENIGN_FLAG_$$Image := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Image == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$Image);
    return;
}



procedure _CHECK_WRITE_$$Image(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Image"} {:array "$$Image"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$Image && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Image != _value);
  requires {:source_name "Image"} {:array "$$Image"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$Image && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Image != _value);
  requires {:source_name "Image"} {:array "$$Image"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$Image && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$Image(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$Image;



implementation {:inline 1} _LOG_ATOMIC_$$Image(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$Image := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$Image);
    return;
}



procedure _CHECK_ATOMIC_$$Image(_P: bool, _offset: bv32);
  requires {:source_name "Image"} {:array "$$Image"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$Image && _WATCHED_OFFSET == _offset);
  requires {:source_name "Image"} {:array "$$Image"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$Image && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Image(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$Image;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Image(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$Image := (if _P && _WRITE_HAS_OCCURRED_$$Image && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$Image);
    return;
}



const _WATCHED_VALUE_$$Histogram: bv32;

procedure {:inline 1} _LOG_READ_$$Histogram(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$Histogram;



implementation {:inline 1} _LOG_READ_$$Histogram(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$Histogram := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Histogram == _value then true else _READ_HAS_OCCURRED_$$Histogram);
    return;
}



procedure _CHECK_READ_$$Histogram(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Histogram"} {:array "$$Histogram"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$Histogram);
  requires {:source_name "Histogram"} {:array "$$Histogram"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$Histogram: bool;

procedure {:inline 1} _LOG_WRITE_$$Histogram(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$Histogram, _WRITE_READ_BENIGN_FLAG_$$Histogram;



implementation {:inline 1} _LOG_WRITE_$$Histogram(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$Histogram := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Histogram == _value then true else _WRITE_HAS_OCCURRED_$$Histogram);
    _WRITE_READ_BENIGN_FLAG_$$Histogram := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Histogram == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$Histogram);
    return;
}



procedure _CHECK_WRITE_$$Histogram(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Histogram"} {:array "$$Histogram"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Histogram != _value);
  requires {:source_name "Histogram"} {:array "$$Histogram"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Histogram != _value);
  requires {:source_name "Histogram"} {:array "$$Histogram"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$Histogram(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$Histogram;



implementation {:inline 1} _LOG_ATOMIC_$$Histogram(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$Histogram := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$Histogram);
    return;
}



procedure _CHECK_ATOMIC_$$Histogram(_P: bool, _offset: bv32);
  requires {:source_name "Histogram"} {:array "$$Histogram"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset);
  requires {:source_name "Histogram"} {:array "$$Histogram"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Histogram(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$Histogram;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Histogram(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$Histogram := (if _P && _WRITE_HAS_OCCURRED_$$Histogram && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$Histogram);
    return;
}



const _WATCHED_VALUE_$$histogramKernel.subhists: bv32;

procedure {:inline 1} _LOG_READ_$$histogramKernel.subhists(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$histogramKernel.subhists;



implementation {:inline 1} _LOG_READ_$$histogramKernel.subhists(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$histogramKernel.subhists := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histogramKernel.subhists == _value then true else _READ_HAS_OCCURRED_$$histogramKernel.subhists);
    return;
}



procedure _CHECK_READ_$$histogramKernel.subhists(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "subhists"} {:array "$$histogramKernel.subhists"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$histogramKernel.subhists && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "subhists"} {:array "$$histogramKernel.subhists"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$histogramKernel.subhists && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists: bool;

procedure {:inline 1} _LOG_WRITE_$$histogramKernel.subhists(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$histogramKernel.subhists, _WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists;



implementation {:inline 1} _LOG_WRITE_$$histogramKernel.subhists(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$histogramKernel.subhists := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histogramKernel.subhists == _value then true else _WRITE_HAS_OCCURRED_$$histogramKernel.subhists);
    _WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histogramKernel.subhists == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists);
    return;
}



procedure _CHECK_WRITE_$$histogramKernel.subhists(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "subhists"} {:array "$$histogramKernel.subhists"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$histogramKernel.subhists && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histogramKernel.subhists != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "subhists"} {:array "$$histogramKernel.subhists"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$histogramKernel.subhists && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$histogramKernel.subhists != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "subhists"} {:array "$$histogramKernel.subhists"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$histogramKernel.subhists && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$histogramKernel.subhists(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$histogramKernel.subhists;



implementation {:inline 1} _LOG_ATOMIC_$$histogramKernel.subhists(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$histogramKernel.subhists := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$histogramKernel.subhists);
    return;
}



procedure _CHECK_ATOMIC_$$histogramKernel.subhists(_P: bool, _offset: bv32);
  requires {:source_name "subhists"} {:array "$$histogramKernel.subhists"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$histogramKernel.subhists && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "subhists"} {:array "$$histogramKernel.subhists"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$histogramKernel.subhists && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists := (if _P && _WRITE_HAS_OCCURRED_$$histogramKernel.subhists && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$histogramKernel.subhists);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$histogramKernel.subhists;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$histogramKernel.subhists;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$histogramKernel.subhists;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$Histogram;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$Histogram;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$Histogram;
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
    havoc $$Histogram;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$histogramKernel.subhists;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$histogramKernel.subhists;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$histogramKernel.subhists;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$histogramKernel.subhists;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$Histogram;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$Histogram;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$Histogram;
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
    havoc $$Histogram;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$histogramKernel.subhists;
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
