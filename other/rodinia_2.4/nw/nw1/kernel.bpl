type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$reference_d"} {:global} {:elem_width 32} {:source_name "reference_d"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$reference_d: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$reference_d: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$reference_d: bool;

var {:source_name "input_itemsets_d"} {:global} $$input_itemsets_d: [bv32]bv32;

axiom {:array_info "$$input_itemsets_d"} {:global} {:elem_width 32} {:source_name "input_itemsets_d"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input_itemsets_d: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input_itemsets_d: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input_itemsets_d: bool;

axiom {:array_info "$$output_itemsets_d"} {:global} {:elem_width 32} {:source_name "output_itemsets_d"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output_itemsets_d: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output_itemsets_d: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output_itemsets_d: bool;

var {:source_name "input_itemsets_l"} {:group_shared} $$input_itemsets_l: [bv1][bv32]bv32;

axiom {:array_info "$$input_itemsets_l"} {:group_shared} {:elem_width 32} {:source_name "input_itemsets_l"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input_itemsets_l: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input_itemsets_l: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input_itemsets_l: bool;

var {:source_name "reference_l"} {:group_shared} $$reference_l: [bv1][bv32]bv32;

axiom {:array_info "$$reference_l"} {:group_shared} {:elem_width 32} {:source_name "reference_l"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$reference_l: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$reference_l: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$reference_l: bool;

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

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "nw_kernel1"} {:kernel} $nw_kernel1($cols: bv32, $penalty: bv32, $blk: bv32, $block_width: bv32, $worksize: bv32, $offset_r: bv32, $offset_c: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $cols == 2049bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $penalty == 10bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $blk == 1bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 3} {:thread 1} (if $block_width == 128bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 4} {:thread 1} (if $worksize == 2048bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 5} {:thread 1} (if $offset_r == 0bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 6} {:thread 1} (if $offset_c == 0bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$reference_d && !_WRITE_HAS_OCCURRED_$$reference_d && !_ATOMIC_HAS_OCCURRED_$$reference_d;
  requires !_READ_HAS_OCCURRED_$$input_itemsets_d && !_WRITE_HAS_OCCURRED_$$input_itemsets_d && !_ATOMIC_HAS_OCCURRED_$$input_itemsets_d;
  requires !_READ_HAS_OCCURRED_$$output_itemsets_d && !_WRITE_HAS_OCCURRED_$$output_itemsets_d && !_ATOMIC_HAS_OCCURRED_$$output_itemsets_d;
  requires !_READ_HAS_OCCURRED_$$input_itemsets_l && !_WRITE_HAS_OCCURRED_$$input_itemsets_l && !_ATOMIC_HAS_OCCURRED_$$input_itemsets_l;
  requires !_READ_HAS_OCCURRED_$$reference_l && !_WRITE_HAS_OCCURRED_$$reference_l && !_ATOMIC_HAS_OCCURRED_$$reference_l;
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
  modifies $$input_itemsets_l, $$reference_l, _READ_HAS_OCCURRED_$$input_itemsets_d, _WRITE_HAS_OCCURRED_$$input_itemsets_l, _WRITE_READ_BENIGN_FLAG_$$input_itemsets_l, _WRITE_READ_BENIGN_FLAG_$$input_itemsets_l, $$input_itemsets_d, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _TRACKING, _READ_HAS_OCCURRED_$$input_itemsets_l, _WRITE_HAS_OCCURRED_$$input_itemsets_d, _WRITE_READ_BENIGN_FLAG_$$input_itemsets_d, _WRITE_READ_BENIGN_FLAG_$$input_itemsets_d, _READ_HAS_OCCURRED_$$reference_l, _TRACKING, _TRACKING, _WRITE_HAS_OCCURRED_$$reference_l, _WRITE_READ_BENIGN_FLAG_$$reference_l, _WRITE_READ_BENIGN_FLAG_$$reference_l;



implementation {:source_name "nw_kernel1"} {:kernel} $nw_kernel1($cols: bv32, $penalty: bv32, $blk: bv32, $block_width: bv32, $worksize: bv32, $offset_r: bv32, $offset_c: bv32)
{
  var $ty.0: bv32;
  var $m.0: bv32;
  var $k.i.0$1: bv32;
  var $k.i.0$2: bv32;
  var $.01$1: bv32;
  var $.01$2: bv32;
  var $m1.0: bv32;
  var $k.i5.0$1: bv32;
  var $k.i5.0$2: bv32;
  var $.0$1: bv32;
  var $.0$2: bv32;
  var $ty4.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bv32;
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
  var v8: bool;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12: bool;
  var v13$1: bool;
  var v13$2: bool;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bool;
  var v23$2: bool;
  var v24$1: bool;
  var v24$2: bool;
  var v25: bool;
  var v26$1: bool;
  var v26$2: bool;
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
  var v36$1: bool;
  var v36$2: bool;
  var v37$1: bool;
  var v37$2: bool;
  var v38: bool;
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


  __partitioned_block_$0_0:
    v0$1 := group_id_x$1;
    v0$2 := group_id_x$2;
    v1$1 := local_id_x$1;
    v1$2 := local_id_x$2;
    v2 := BV32_ADD(BV32_MUL($offset_r, $cols), $offset_c);
    v3$1 := BV32_SUB(BV32_SUB($blk, 1bv32), v0$1);
    v3$2 := BV32_SUB(BV32_SUB($blk, 1bv32), v0$2);
    v4$1 := BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$1)), BV32_MUL(16bv32, v0$1)), v1$1), BV32_ADD($cols, 1bv32));
    v4$2 := BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$2)), BV32_MUL(16bv32, v0$2)), v1$2), BV32_ADD($cols, 1bv32));
    v5$1 := BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$1)), BV32_MUL(16bv32, v0$1)), v1$1), 1bv32);
    v5$2 := BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$2)), BV32_MUL(16bv32, v0$2)), v1$2), 1bv32);
    v6$1 := v1$1 == 0bv32;
    v6$2 := v1$2 == 0bv32;
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v6$1 then v6$1 else p0$1);
    p0$2 := (if v6$2 then v6$2 else p0$2);
    call {:sourceloc} {:sourceloc_num 9} _LOG_READ_$$input_itemsets_d(p0$1, BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$1)), BV32_MUL(16bv32, v0$1)), v1$1), $$input_itemsets_d[BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$1)), BV32_MUL(16bv32, v0$1)), v1$1)]);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 9} _CHECK_READ_$$input_itemsets_d(p0$2, BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$2)), BV32_MUL(16bv32, v0$2)), v1$2), $$input_itemsets_d[BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$2)), BV32_MUL(16bv32, v0$2)), v1$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$input_itemsets_d"} true;
    v7$1 := (if p0$1 then $$input_itemsets_d[BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$1)), BV32_MUL(16bv32, v0$1)), v1$1)] else v7$1);
    v7$2 := (if p0$2 then $$input_itemsets_d[BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$2)), BV32_MUL(16bv32, v0$2)), v1$2)] else v7$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$input_itemsets_l(p0$1, BV32_MUL(v1$1, 17bv32), v7$1, $$input_itemsets_l[1bv1][BV32_MUL(v1$1, 17bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_itemsets_l(p0$2, BV32_MUL(v1$2, 17bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$input_itemsets_l(p0$2, BV32_MUL(v1$2, 17bv32), v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$input_itemsets_l"} true;
    $$input_itemsets_l[1bv1][BV32_MUL(v1$1, 17bv32)] := (if p0$1 then v7$1 else $$input_itemsets_l[1bv1][BV32_MUL(v1$1, 17bv32)]);
    $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v1$2, 17bv32)] := (if p0$2 then v7$2 else $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v1$2, 17bv32)]);
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 12} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    $ty.0 := 0bv32;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$reference_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$reference_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$reference_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$input_itemsets_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$input_itemsets_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$input_itemsets_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 13} true;
    v8 := BV32_SLT($ty.0, 16bv32);
    goto $truebb0, __partitioned_block_$falsebb0_0;

  __partitioned_block_$falsebb0_0:
    assume {:partition} !v8 && !v8;
    goto __partitioned_block_$falsebb0_1;

  __partitioned_block_$falsebb0_1:
    call {:sourceloc_num 19} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    call {:sourceloc} {:sourceloc_num 20} _LOG_READ_$$input_itemsets_d(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$1)), BV32_MUL(16bv32, v0$1)), $cols), BV32_MUL($cols, v1$1)), $$input_itemsets_d[BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$1)), BV32_MUL(16bv32, v0$1)), $cols), BV32_MUL($cols, v1$1))]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 20} _CHECK_READ_$$input_itemsets_d(true, BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$2)), BV32_MUL(16bv32, v0$2)), $cols), BV32_MUL($cols, v1$2)), $$input_itemsets_d[BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$2)), BV32_MUL(16bv32, v0$2)), $cols), BV32_MUL($cols, v1$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$input_itemsets_d"} true;
    v10$1 := $$input_itemsets_d[BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$1)), BV32_MUL(16bv32, v0$1)), $cols), BV32_MUL($cols, v1$1))];
    v10$2 := $$input_itemsets_d[BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(v2, BV32_MUL(BV32_MUL($cols, 16bv32), v3$2)), BV32_MUL(16bv32, v0$2)), $cols), BV32_MUL($cols, v1$2))];
    call {:sourceloc} {:sourceloc_num 21} _LOG_WRITE_$$input_itemsets_l(true, BV32_MUL(BV32_ADD(v1$1, 1bv32), 17bv32), v10$1, $$input_itemsets_l[1bv1][BV32_MUL(BV32_ADD(v1$1, 1bv32), 17bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_itemsets_l(true, BV32_MUL(BV32_ADD(v1$2, 1bv32), 17bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 21} _CHECK_WRITE_$$input_itemsets_l(true, BV32_MUL(BV32_ADD(v1$2, 1bv32), 17bv32), v10$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$input_itemsets_l"} true;
    $$input_itemsets_l[1bv1][BV32_MUL(BV32_ADD(v1$1, 1bv32), 17bv32)] := v10$1;
    $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(v1$2, 1bv32), 17bv32)] := v10$2;
    goto __partitioned_block_$falsebb0_2;

  __partitioned_block_$falsebb0_2:
    call {:sourceloc_num 22} $bugle_barrier_duplicated_2(1bv1, 0bv1);
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$input_itemsets_d(true, v5$1, $$input_itemsets_d[v5$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$input_itemsets_d(true, v5$2, $$input_itemsets_d[v5$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$input_itemsets_d"} true;
    v11$1 := $$input_itemsets_d[v5$1];
    v11$2 := $$input_itemsets_d[v5$2];
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$input_itemsets_l(true, BV32_ADD(v1$1, 1bv32), v11$1, $$input_itemsets_l[1bv1][BV32_ADD(v1$1, 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_itemsets_l(true, BV32_ADD(v1$2, 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$input_itemsets_l(true, BV32_ADD(v1$2, 1bv32), v11$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$input_itemsets_l"} true;
    $$input_itemsets_l[1bv1][BV32_ADD(v1$1, 1bv32)] := v11$1;
    $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, 1bv32)] := v11$2;
    goto __partitioned_block_$falsebb0_3;

  __partitioned_block_$falsebb0_3:
    call {:sourceloc_num 25} $bugle_barrier_duplicated_3(1bv1, 0bv1);
    $m.0 := 0bv32;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$reference_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$reference_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$reference_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$input_itemsets_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$input_itemsets_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$input_itemsets_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 26} true;
    v12 := BV32_SLT($m.0, 16bv32);
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    goto __partitioned_block_$truebb1_0, __partitioned_block_$falsebb1_0;

  __partitioned_block_$falsebb1_0:
    assume {:partition} !v12 && !v12;
    goto __partitioned_block_$falsebb1_1;

  __partitioned_block_$falsebb1_1:
    call {:sourceloc_num 44} $bugle_barrier_duplicated_4(1bv1, 0bv1);
    $m1.0 := 14bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $18;

  $18:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$reference_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$reference_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$reference_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$input_itemsets_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$input_itemsets_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$input_itemsets_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 45} true;
    v25 := BV32_SGE($m1.0, 0bv32);
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
    goto __partitioned_block_$truebb5_0, $falsebb5;

  $falsebb5:
    assume {:partition} !v25 && !v25;
    $ty4.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $29;

  $29:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$reference_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$reference_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$reference_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$input_itemsets_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$input_itemsets_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$input_itemsets_l ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 63} true;
    v38 := BV32_SLT($ty4.0, 16bv32);
    goto $truebb9, $falsebb9;

  $falsebb9:
    assume {:partition} !v38 && !v38;
    return;

  $truebb9:
    assume {:partition} v38 && v38;
    call {:sourceloc} {:sourceloc_num 65} _LOG_READ_$$input_itemsets_l(true, BV32_ADD(BV32_ADD(v1$1, 1bv32), BV32_MUL(BV32_ADD($ty4.0, 1bv32), 17bv32)), $$input_itemsets_l[1bv1][BV32_ADD(BV32_ADD(v1$1, 1bv32), BV32_MUL(BV32_ADD($ty4.0, 1bv32), 17bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 65} _CHECK_READ_$$input_itemsets_l(true, BV32_ADD(BV32_ADD(v1$2, 1bv32), BV32_MUL(BV32_ADD($ty4.0, 1bv32), 17bv32)), $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v1$2, 1bv32), BV32_MUL(BV32_ADD($ty4.0, 1bv32), 17bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$input_itemsets_l"} true;
    v39$1 := $$input_itemsets_l[1bv1][BV32_ADD(BV32_ADD(v1$1, 1bv32), BV32_MUL(BV32_ADD($ty4.0, 1bv32), 17bv32))];
    v39$2 := $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v1$2, 1bv32), BV32_MUL(BV32_ADD($ty4.0, 1bv32), 17bv32))];
    call {:sourceloc} {:sourceloc_num 66} _LOG_WRITE_$$input_itemsets_d(true, BV32_ADD(v4$1, BV32_MUL($cols, $ty4.0)), v39$1, $$input_itemsets_d[BV32_ADD(v4$1, BV32_MUL($cols, $ty4.0))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_itemsets_d(true, BV32_ADD(v4$2, BV32_MUL($cols, $ty4.0)));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 66} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 66} _CHECK_WRITE_$$input_itemsets_d(true, BV32_ADD(v4$2, BV32_MUL($cols, $ty4.0)), v39$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$input_itemsets_d"} true;
    $$input_itemsets_d[BV32_ADD(v4$1, BV32_MUL($cols, $ty4.0))] := v39$1;
    $$input_itemsets_d[BV32_ADD(v4$2, BV32_MUL($cols, $ty4.0))] := v39$2;
    $ty4.0 := BV32_ADD($ty4.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $29;

  __partitioned_block_$truebb5_0:
    assume {:partition} v25 && v25;
    v26$1 := BV32_SLE(v1$1, $m1.0);
    v26$2 := BV32_SLE(v1$2, $m1.0);
    p9$1 := (if v26$1 then v26$1 else p9$1);
    p9$2 := (if v26$2 then v26$2 else p9$2);
    v27$1 := (if p9$1 then BV32_SUB(BV32_ADD(v1$1, 16bv32), $m1.0) else v27$1);
    v27$2 := (if p9$2 then BV32_SUB(BV32_ADD(v1$2, 16bv32), $m1.0) else v27$2);
    v28$1 := (if p9$1 then BV32_SUB(16bv32, v1$1) else v28$1);
    v28$2 := (if p9$2 then BV32_SUB(16bv32, v1$2) else v28$2);
    call {:sourceloc} {:sourceloc_num 48} _LOG_READ_$$input_itemsets_l(p9$1, BV32_ADD(BV32_SUB(v27$1, 1bv32), BV32_MUL(BV32_SUB(v28$1, 1bv32), 17bv32)), $$input_itemsets_l[1bv1][BV32_ADD(BV32_SUB(v27$1, 1bv32), BV32_MUL(BV32_SUB(v28$1, 1bv32), 17bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 48} _CHECK_READ_$$input_itemsets_l(p9$2, BV32_ADD(BV32_SUB(v27$2, 1bv32), BV32_MUL(BV32_SUB(v28$2, 1bv32), 17bv32)), $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_SUB(v27$2, 1bv32), BV32_MUL(BV32_SUB(v28$2, 1bv32), 17bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$input_itemsets_l"} true;
    v29$1 := (if p9$1 then $$input_itemsets_l[1bv1][BV32_ADD(BV32_SUB(v27$1, 1bv32), BV32_MUL(BV32_SUB(v28$1, 1bv32), 17bv32))] else v29$1);
    v29$2 := (if p9$2 then $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_SUB(v27$2, 1bv32), BV32_MUL(BV32_SUB(v28$2, 1bv32), 17bv32))] else v29$2);
    call {:sourceloc} {:sourceloc_num 49} _LOG_READ_$$reference_l(p9$1, BV32_ADD(BV32_SUB(v27$1, 1bv32), BV32_MUL(BV32_SUB(v28$1, 1bv32), 16bv32)), $$reference_l[1bv1][BV32_ADD(BV32_SUB(v27$1, 1bv32), BV32_MUL(BV32_SUB(v28$1, 1bv32), 16bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 49} _CHECK_READ_$$reference_l(p9$2, BV32_ADD(BV32_SUB(v27$2, 1bv32), BV32_MUL(BV32_SUB(v28$2, 1bv32), 16bv32)), $$reference_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_SUB(v27$2, 1bv32), BV32_MUL(BV32_SUB(v28$2, 1bv32), 16bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$reference_l"} true;
    v30$1 := (if p9$1 then $$reference_l[1bv1][BV32_ADD(BV32_SUB(v27$1, 1bv32), BV32_MUL(BV32_SUB(v28$1, 1bv32), 16bv32))] else v30$1);
    v30$2 := (if p9$2 then $$reference_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_SUB(v27$2, 1bv32), BV32_MUL(BV32_SUB(v28$2, 1bv32), 16bv32))] else v30$2);
    v31$1 := (if p9$1 then BV32_ADD(v29$1, v30$1) else v31$1);
    v31$2 := (if p9$2 then BV32_ADD(v29$2, v30$2) else v31$2);
    call {:sourceloc} {:sourceloc_num 50} _LOG_READ_$$input_itemsets_l(p9$1, BV32_ADD(BV32_SUB(v27$1, 1bv32), BV32_MUL(v28$1, 17bv32)), $$input_itemsets_l[1bv1][BV32_ADD(BV32_SUB(v27$1, 1bv32), BV32_MUL(v28$1, 17bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 50} _CHECK_READ_$$input_itemsets_l(p9$2, BV32_ADD(BV32_SUB(v27$2, 1bv32), BV32_MUL(v28$2, 17bv32)), $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_SUB(v27$2, 1bv32), BV32_MUL(v28$2, 17bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$input_itemsets_l"} true;
    v32$1 := (if p9$1 then $$input_itemsets_l[1bv1][BV32_ADD(BV32_SUB(v27$1, 1bv32), BV32_MUL(v28$1, 17bv32))] else v32$1);
    v32$2 := (if p9$2 then $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_SUB(v27$2, 1bv32), BV32_MUL(v28$2, 17bv32))] else v32$2);
    v33$1 := (if p9$1 then BV32_SUB(v32$1, $penalty) else v33$1);
    v33$2 := (if p9$2 then BV32_SUB(v32$2, $penalty) else v33$2);
    call {:sourceloc} {:sourceloc_num 51} _LOG_READ_$$input_itemsets_l(p9$1, BV32_ADD(v27$1, BV32_MUL(BV32_SUB(v28$1, 1bv32), 17bv32)), $$input_itemsets_l[1bv1][BV32_ADD(v27$1, BV32_MUL(BV32_SUB(v28$1, 1bv32), 17bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 51} _CHECK_READ_$$input_itemsets_l(p9$2, BV32_ADD(v27$2, BV32_MUL(BV32_SUB(v28$2, 1bv32), 17bv32)), $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v27$2, BV32_MUL(BV32_SUB(v28$2, 1bv32), 17bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$input_itemsets_l"} true;
    v34$1 := (if p9$1 then $$input_itemsets_l[1bv1][BV32_ADD(v27$1, BV32_MUL(BV32_SUB(v28$1, 1bv32), 17bv32))] else v34$1);
    v34$2 := (if p9$2 then $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v27$2, BV32_MUL(BV32_SUB(v28$2, 1bv32), 17bv32))] else v34$2);
    v35$1 := (if p9$1 then BV32_SUB(v34$1, $penalty) else v35$1);
    v35$2 := (if p9$2 then BV32_SUB(v34$2, $penalty) else v35$2);
    v36$1 := (if p9$1 then BV32_SLE(v31$1, v33$1) else v36$1);
    v36$2 := (if p9$2 then BV32_SLE(v31$2, v33$2) else v36$2);
    p11$1 := (if p9$1 && v36$1 then v36$1 else p11$1);
    p11$2 := (if p9$2 && v36$2 then v36$2 else p11$2);
    p10$1 := (if p9$1 && !v36$1 then !v36$1 else p10$1);
    p10$2 := (if p9$2 && !v36$2 then !v36$2 else p10$2);
    $k.i5.0$1 := (if p10$1 then v31$1 else $k.i5.0$1);
    $k.i5.0$2 := (if p10$2 then v31$2 else $k.i5.0$2);
    $k.i5.0$1 := (if p11$1 then v33$1 else $k.i5.0$1);
    $k.i5.0$2 := (if p11$2 then v33$2 else $k.i5.0$2);
    v37$1 := (if p9$1 then BV32_SLE($k.i5.0$1, v35$1) else v37$1);
    v37$2 := (if p9$2 then BV32_SLE($k.i5.0$2, v35$2) else v37$2);
    p13$1 := (if p9$1 && v37$1 then v37$1 else p13$1);
    p13$2 := (if p9$2 && v37$2 then v37$2 else p13$2);
    p12$1 := (if p9$1 && !v37$1 then !v37$1 else p12$1);
    p12$2 := (if p9$2 && !v37$2 then !v37$2 else p12$2);
    $.0$1 := (if p12$1 then $k.i5.0$1 else $.0$1);
    $.0$2 := (if p12$2 then $k.i5.0$2 else $.0$2);
    $.0$1 := (if p13$1 then v35$1 else $.0$1);
    $.0$2 := (if p13$2 then v35$2 else $.0$2);
    call {:sourceloc} {:sourceloc_num 58} _LOG_WRITE_$$input_itemsets_l(p9$1, BV32_ADD(v27$1, BV32_MUL(v28$1, 17bv32)), $.0$1, $$input_itemsets_l[1bv1][BV32_ADD(v27$1, BV32_MUL(v28$1, 17bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_itemsets_l(p9$2, BV32_ADD(v27$2, BV32_MUL(v28$2, 17bv32)));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 58} _CHECK_WRITE_$$input_itemsets_l(p9$2, BV32_ADD(v27$2, BV32_MUL(v28$2, 17bv32)), $.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$input_itemsets_l"} true;
    $$input_itemsets_l[1bv1][BV32_ADD(v27$1, BV32_MUL(v28$1, 17bv32))] := (if p9$1 then $.0$1 else $$input_itemsets_l[1bv1][BV32_ADD(v27$1, BV32_MUL(v28$1, 17bv32))]);
    $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v27$2, BV32_MUL(v28$2, 17bv32))] := (if p9$2 then $.0$2 else $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v27$2, BV32_MUL(v28$2, 17bv32))]);
    goto __partitioned_block_$truebb5_1;

  __partitioned_block_$truebb5_1:
    call {:sourceloc_num 60} $bugle_barrier_duplicated_5(1bv1, 0bv1);
    $m1.0 := BV32_ADD($m1.0, 4294967295bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $18;

  __partitioned_block_$truebb1_0:
    assume {:partition} v12 && v12;
    v13$1 := BV32_SLE(v1$1, $m.0);
    v13$2 := BV32_SLE(v1$2, $m.0);
    p3$1 := (if v13$1 then v13$1 else p3$1);
    p3$2 := (if v13$2 then v13$2 else p3$2);
    v14$1 := (if p3$1 then BV32_ADD(v1$1, 1bv32) else v14$1);
    v14$2 := (if p3$2 then BV32_ADD(v1$2, 1bv32) else v14$2);
    v15$1 := (if p3$1 then BV32_ADD(BV32_SUB($m.0, v1$1), 1bv32) else v15$1);
    v15$2 := (if p3$2 then BV32_ADD(BV32_SUB($m.0, v1$2), 1bv32) else v15$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_READ_$$input_itemsets_l(p3$1, BV32_ADD(BV32_SUB(v14$1, 1bv32), BV32_MUL(BV32_SUB(v15$1, 1bv32), 17bv32)), $$input_itemsets_l[1bv1][BV32_ADD(BV32_SUB(v14$1, 1bv32), BV32_MUL(BV32_SUB(v15$1, 1bv32), 17bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 29} _CHECK_READ_$$input_itemsets_l(p3$2, BV32_ADD(BV32_SUB(v14$2, 1bv32), BV32_MUL(BV32_SUB(v15$2, 1bv32), 17bv32)), $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_SUB(v14$2, 1bv32), BV32_MUL(BV32_SUB(v15$2, 1bv32), 17bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$input_itemsets_l"} true;
    v16$1 := (if p3$1 then $$input_itemsets_l[1bv1][BV32_ADD(BV32_SUB(v14$1, 1bv32), BV32_MUL(BV32_SUB(v15$1, 1bv32), 17bv32))] else v16$1);
    v16$2 := (if p3$2 then $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_SUB(v14$2, 1bv32), BV32_MUL(BV32_SUB(v15$2, 1bv32), 17bv32))] else v16$2);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 30} true;
    v17$1 := (if p3$1 then $$reference_l[1bv1][BV32_ADD(BV32_SUB(v14$1, 1bv32), BV32_MUL(BV32_SUB(v15$1, 1bv32), 16bv32))] else v17$1);
    v17$2 := (if p3$2 then $$reference_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_SUB(v14$2, 1bv32), BV32_MUL(BV32_SUB(v15$2, 1bv32), 16bv32))] else v17$2);
    v18$1 := (if p3$1 then BV32_ADD(v16$1, v17$1) else v18$1);
    v18$2 := (if p3$2 then BV32_ADD(v16$2, v17$2) else v18$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_READ_$$input_itemsets_l(p3$1, BV32_ADD(BV32_SUB(v14$1, 1bv32), BV32_MUL(v15$1, 17bv32)), $$input_itemsets_l[1bv1][BV32_ADD(BV32_SUB(v14$1, 1bv32), BV32_MUL(v15$1, 17bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 31} _CHECK_READ_$$input_itemsets_l(p3$2, BV32_ADD(BV32_SUB(v14$2, 1bv32), BV32_MUL(v15$2, 17bv32)), $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_SUB(v14$2, 1bv32), BV32_MUL(v15$2, 17bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$input_itemsets_l"} true;
    v19$1 := (if p3$1 then $$input_itemsets_l[1bv1][BV32_ADD(BV32_SUB(v14$1, 1bv32), BV32_MUL(v15$1, 17bv32))] else v19$1);
    v19$2 := (if p3$2 then $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_SUB(v14$2, 1bv32), BV32_MUL(v15$2, 17bv32))] else v19$2);
    v20$1 := (if p3$1 then BV32_SUB(v19$1, $penalty) else v20$1);
    v20$2 := (if p3$2 then BV32_SUB(v19$2, $penalty) else v20$2);
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$input_itemsets_l(p3$1, BV32_ADD(v14$1, BV32_MUL(BV32_SUB(v15$1, 1bv32), 17bv32)), $$input_itemsets_l[1bv1][BV32_ADD(v14$1, BV32_MUL(BV32_SUB(v15$1, 1bv32), 17bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$input_itemsets_l(p3$2, BV32_ADD(v14$2, BV32_MUL(BV32_SUB(v15$2, 1bv32), 17bv32)), $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v14$2, BV32_MUL(BV32_SUB(v15$2, 1bv32), 17bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$input_itemsets_l"} true;
    v21$1 := (if p3$1 then $$input_itemsets_l[1bv1][BV32_ADD(v14$1, BV32_MUL(BV32_SUB(v15$1, 1bv32), 17bv32))] else v21$1);
    v21$2 := (if p3$2 then $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v14$2, BV32_MUL(BV32_SUB(v15$2, 1bv32), 17bv32))] else v21$2);
    v22$1 := (if p3$1 then BV32_SUB(v21$1, $penalty) else v22$1);
    v22$2 := (if p3$2 then BV32_SUB(v21$2, $penalty) else v22$2);
    v23$1 := (if p3$1 then BV32_SLE(v18$1, v20$1) else v23$1);
    v23$2 := (if p3$2 then BV32_SLE(v18$2, v20$2) else v23$2);
    p5$1 := (if p3$1 && v23$1 then v23$1 else p5$1);
    p5$2 := (if p3$2 && v23$2 then v23$2 else p5$2);
    p4$1 := (if p3$1 && !v23$1 then !v23$1 else p4$1);
    p4$2 := (if p3$2 && !v23$2 then !v23$2 else p4$2);
    $k.i.0$1 := (if p4$1 then v18$1 else $k.i.0$1);
    $k.i.0$2 := (if p4$2 then v18$2 else $k.i.0$2);
    $k.i.0$1 := (if p5$1 then v20$1 else $k.i.0$1);
    $k.i.0$2 := (if p5$2 then v20$2 else $k.i.0$2);
    v24$1 := (if p3$1 then BV32_SLE($k.i.0$1, v22$1) else v24$1);
    v24$2 := (if p3$2 then BV32_SLE($k.i.0$2, v22$2) else v24$2);
    p7$1 := (if p3$1 && v24$1 then v24$1 else p7$1);
    p7$2 := (if p3$2 && v24$2 then v24$2 else p7$2);
    p6$1 := (if p3$1 && !v24$1 then !v24$1 else p6$1);
    p6$2 := (if p3$2 && !v24$2 then !v24$2 else p6$2);
    $.01$1 := (if p6$1 then $k.i.0$1 else $.01$1);
    $.01$2 := (if p6$2 then $k.i.0$2 else $.01$2);
    $.01$1 := (if p7$1 then v22$1 else $.01$1);
    $.01$2 := (if p7$2 then v22$2 else $.01$2);
    call {:sourceloc} {:sourceloc_num 39} _LOG_WRITE_$$input_itemsets_l(p3$1, BV32_ADD(v14$1, BV32_MUL(v15$1, 17bv32)), $.01$1, $$input_itemsets_l[1bv1][BV32_ADD(v14$1, BV32_MUL(v15$1, 17bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_itemsets_l(p3$2, BV32_ADD(v14$2, BV32_MUL(v15$2, 17bv32)));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 39} _CHECK_WRITE_$$input_itemsets_l(p3$2, BV32_ADD(v14$2, BV32_MUL(v15$2, 17bv32)), $.01$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$input_itemsets_l"} true;
    $$input_itemsets_l[1bv1][BV32_ADD(v14$1, BV32_MUL(v15$1, 17bv32))] := (if p3$1 then $.01$1 else $$input_itemsets_l[1bv1][BV32_ADD(v14$1, BV32_MUL(v15$1, 17bv32))]);
    $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v14$2, BV32_MUL(v15$2, 17bv32))] := (if p3$2 then $.01$2 else $$input_itemsets_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v14$2, BV32_MUL(v15$2, 17bv32))]);
    goto __partitioned_block_$truebb1_1;

  __partitioned_block_$truebb1_1:
    call {:sourceloc_num 41} $bugle_barrier_duplicated_6(1bv1, 0bv1);
    $m.0 := BV32_ADD($m.0, 1bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $7;

  $truebb0:
    assume {:partition} v8 && v8;
    havoc v9$1, v9$2;
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$reference_l(true, BV32_ADD(v1$1, BV32_MUL($ty.0, 16bv32)), v9$1, $$reference_l[1bv1][BV32_ADD(v1$1, BV32_MUL($ty.0, 16bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$reference_l(true, BV32_ADD(v1$2, BV32_MUL($ty.0, 16bv32)));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$reference_l(true, BV32_ADD(v1$2, BV32_MUL($ty.0, 16bv32)), v9$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$reference_l"} true;
    $$reference_l[1bv1][BV32_ADD(v1$1, BV32_MUL($ty.0, 16bv32))] := v9$1;
    $$reference_l[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v1$2, BV32_MUL($ty.0, 16bv32))] := v9$2;
    $ty.0 := BV32_ADD($ty.0, 1bv32);
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $3;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$input_itemsets_l, $$reference_l, $$input_itemsets_d, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$input_itemsets_l, $$reference_l, $$input_itemsets_d, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$input_itemsets_l, $$reference_l, $$input_itemsets_d, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_3($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$input_itemsets_l, $$reference_l, $$input_itemsets_d, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_4($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$input_itemsets_l, $$reference_l, $$input_itemsets_d, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_5($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$input_itemsets_l, $$reference_l, $$input_itemsets_d, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_6($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$input_itemsets_l, $$reference_l, $$input_itemsets_d, _TRACKING;



const _WATCHED_VALUE_$$reference_d: bv32;

procedure {:inline 1} _LOG_READ_$$reference_d(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$reference_d;



implementation {:inline 1} _LOG_READ_$$reference_d(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$reference_d := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reference_d == _value then true else _READ_HAS_OCCURRED_$$reference_d);
    return;
}



procedure _CHECK_READ_$$reference_d(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "reference_d"} {:array "$$reference_d"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$reference_d && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$reference_d);
  requires {:source_name "reference_d"} {:array "$$reference_d"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$reference_d && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$reference_d: bool;

procedure {:inline 1} _LOG_WRITE_$$reference_d(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$reference_d, _WRITE_READ_BENIGN_FLAG_$$reference_d;



implementation {:inline 1} _LOG_WRITE_$$reference_d(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$reference_d := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reference_d == _value then true else _WRITE_HAS_OCCURRED_$$reference_d);
    _WRITE_READ_BENIGN_FLAG_$$reference_d := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reference_d == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$reference_d);
    return;
}



procedure _CHECK_WRITE_$$reference_d(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "reference_d"} {:array "$$reference_d"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$reference_d && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reference_d != _value);
  requires {:source_name "reference_d"} {:array "$$reference_d"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$reference_d && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reference_d != _value);
  requires {:source_name "reference_d"} {:array "$$reference_d"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$reference_d && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$reference_d(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$reference_d;



implementation {:inline 1} _LOG_ATOMIC_$$reference_d(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$reference_d := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$reference_d);
    return;
}



procedure _CHECK_ATOMIC_$$reference_d(_P: bool, _offset: bv32);
  requires {:source_name "reference_d"} {:array "$$reference_d"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$reference_d && _WATCHED_OFFSET == _offset);
  requires {:source_name "reference_d"} {:array "$$reference_d"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$reference_d && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$reference_d(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$reference_d;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$reference_d(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$reference_d := (if _P && _WRITE_HAS_OCCURRED_$$reference_d && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$reference_d);
    return;
}



const _WATCHED_VALUE_$$input_itemsets_d: bv32;

procedure {:inline 1} _LOG_READ_$$input_itemsets_d(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$input_itemsets_d;



implementation {:inline 1} _LOG_READ_$$input_itemsets_d(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$input_itemsets_d := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_itemsets_d == _value then true else _READ_HAS_OCCURRED_$$input_itemsets_d);
    return;
}



procedure _CHECK_READ_$$input_itemsets_d(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input_itemsets_d"} {:array "$$input_itemsets_d"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$input_itemsets_d && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$input_itemsets_d);
  requires {:source_name "input_itemsets_d"} {:array "$$input_itemsets_d"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$input_itemsets_d && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$input_itemsets_d: bool;

procedure {:inline 1} _LOG_WRITE_$$input_itemsets_d(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$input_itemsets_d, _WRITE_READ_BENIGN_FLAG_$$input_itemsets_d;



implementation {:inline 1} _LOG_WRITE_$$input_itemsets_d(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$input_itemsets_d := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_itemsets_d == _value then true else _WRITE_HAS_OCCURRED_$$input_itemsets_d);
    _WRITE_READ_BENIGN_FLAG_$$input_itemsets_d := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_itemsets_d == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$input_itemsets_d);
    return;
}



procedure _CHECK_WRITE_$$input_itemsets_d(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input_itemsets_d"} {:array "$$input_itemsets_d"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$input_itemsets_d && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_itemsets_d != _value);
  requires {:source_name "input_itemsets_d"} {:array "$$input_itemsets_d"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$input_itemsets_d && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_itemsets_d != _value);
  requires {:source_name "input_itemsets_d"} {:array "$$input_itemsets_d"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$input_itemsets_d && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$input_itemsets_d(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$input_itemsets_d;



implementation {:inline 1} _LOG_ATOMIC_$$input_itemsets_d(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$input_itemsets_d := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$input_itemsets_d);
    return;
}



procedure _CHECK_ATOMIC_$$input_itemsets_d(_P: bool, _offset: bv32);
  requires {:source_name "input_itemsets_d"} {:array "$$input_itemsets_d"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$input_itemsets_d && _WATCHED_OFFSET == _offset);
  requires {:source_name "input_itemsets_d"} {:array "$$input_itemsets_d"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$input_itemsets_d && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_itemsets_d(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$input_itemsets_d;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_itemsets_d(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$input_itemsets_d := (if _P && _WRITE_HAS_OCCURRED_$$input_itemsets_d && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$input_itemsets_d);
    return;
}



const _WATCHED_VALUE_$$output_itemsets_d: bv32;

procedure {:inline 1} _LOG_READ_$$output_itemsets_d(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$output_itemsets_d;



implementation {:inline 1} _LOG_READ_$$output_itemsets_d(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$output_itemsets_d := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output_itemsets_d == _value then true else _READ_HAS_OCCURRED_$$output_itemsets_d);
    return;
}



procedure _CHECK_READ_$$output_itemsets_d(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "output_itemsets_d"} {:array "$$output_itemsets_d"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$output_itemsets_d && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$output_itemsets_d);
  requires {:source_name "output_itemsets_d"} {:array "$$output_itemsets_d"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$output_itemsets_d && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$output_itemsets_d: bool;

procedure {:inline 1} _LOG_WRITE_$$output_itemsets_d(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$output_itemsets_d, _WRITE_READ_BENIGN_FLAG_$$output_itemsets_d;



implementation {:inline 1} _LOG_WRITE_$$output_itemsets_d(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$output_itemsets_d := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output_itemsets_d == _value then true else _WRITE_HAS_OCCURRED_$$output_itemsets_d);
    _WRITE_READ_BENIGN_FLAG_$$output_itemsets_d := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output_itemsets_d == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$output_itemsets_d);
    return;
}



procedure _CHECK_WRITE_$$output_itemsets_d(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "output_itemsets_d"} {:array "$$output_itemsets_d"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$output_itemsets_d && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output_itemsets_d != _value);
  requires {:source_name "output_itemsets_d"} {:array "$$output_itemsets_d"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$output_itemsets_d && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output_itemsets_d != _value);
  requires {:source_name "output_itemsets_d"} {:array "$$output_itemsets_d"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$output_itemsets_d && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$output_itemsets_d(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$output_itemsets_d;



implementation {:inline 1} _LOG_ATOMIC_$$output_itemsets_d(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$output_itemsets_d := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$output_itemsets_d);
    return;
}



procedure _CHECK_ATOMIC_$$output_itemsets_d(_P: bool, _offset: bv32);
  requires {:source_name "output_itemsets_d"} {:array "$$output_itemsets_d"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$output_itemsets_d && _WATCHED_OFFSET == _offset);
  requires {:source_name "output_itemsets_d"} {:array "$$output_itemsets_d"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$output_itemsets_d && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output_itemsets_d(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$output_itemsets_d;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output_itemsets_d(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$output_itemsets_d := (if _P && _WRITE_HAS_OCCURRED_$$output_itemsets_d && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$output_itemsets_d);
    return;
}



const _WATCHED_VALUE_$$input_itemsets_l: bv32;

procedure {:inline 1} _LOG_READ_$$input_itemsets_l(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$input_itemsets_l;



implementation {:inline 1} _LOG_READ_$$input_itemsets_l(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$input_itemsets_l := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_itemsets_l == _value then true else _READ_HAS_OCCURRED_$$input_itemsets_l);
    return;
}



procedure _CHECK_READ_$$input_itemsets_l(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input_itemsets_l"} {:array "$$input_itemsets_l"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$input_itemsets_l && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$input_itemsets_l && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "input_itemsets_l"} {:array "$$input_itemsets_l"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$input_itemsets_l && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$input_itemsets_l: bool;

procedure {:inline 1} _LOG_WRITE_$$input_itemsets_l(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$input_itemsets_l, _WRITE_READ_BENIGN_FLAG_$$input_itemsets_l;



implementation {:inline 1} _LOG_WRITE_$$input_itemsets_l(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$input_itemsets_l := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_itemsets_l == _value then true else _WRITE_HAS_OCCURRED_$$input_itemsets_l);
    _WRITE_READ_BENIGN_FLAG_$$input_itemsets_l := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_itemsets_l == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$input_itemsets_l);
    return;
}



procedure _CHECK_WRITE_$$input_itemsets_l(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "input_itemsets_l"} {:array "$$input_itemsets_l"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$input_itemsets_l && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_itemsets_l != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "input_itemsets_l"} {:array "$$input_itemsets_l"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$input_itemsets_l && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input_itemsets_l != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "input_itemsets_l"} {:array "$$input_itemsets_l"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$input_itemsets_l && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$input_itemsets_l(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$input_itemsets_l;



implementation {:inline 1} _LOG_ATOMIC_$$input_itemsets_l(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$input_itemsets_l := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$input_itemsets_l);
    return;
}



procedure _CHECK_ATOMIC_$$input_itemsets_l(_P: bool, _offset: bv32);
  requires {:source_name "input_itemsets_l"} {:array "$$input_itemsets_l"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$input_itemsets_l && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "input_itemsets_l"} {:array "$$input_itemsets_l"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$input_itemsets_l && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_itemsets_l(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$input_itemsets_l;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input_itemsets_l(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$input_itemsets_l := (if _P && _WRITE_HAS_OCCURRED_$$input_itemsets_l && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$input_itemsets_l);
    return;
}



const _WATCHED_VALUE_$$reference_l: bv32;

procedure {:inline 1} _LOG_READ_$$reference_l(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$reference_l;



implementation {:inline 1} _LOG_READ_$$reference_l(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$reference_l := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reference_l == _value then true else _READ_HAS_OCCURRED_$$reference_l);
    return;
}



procedure _CHECK_READ_$$reference_l(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "reference_l"} {:array "$$reference_l"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$reference_l && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$reference_l && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "reference_l"} {:array "$$reference_l"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$reference_l && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$reference_l: bool;

procedure {:inline 1} _LOG_WRITE_$$reference_l(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$reference_l, _WRITE_READ_BENIGN_FLAG_$$reference_l;



implementation {:inline 1} _LOG_WRITE_$$reference_l(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$reference_l := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reference_l == _value then true else _WRITE_HAS_OCCURRED_$$reference_l);
    _WRITE_READ_BENIGN_FLAG_$$reference_l := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reference_l == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$reference_l);
    return;
}



procedure _CHECK_WRITE_$$reference_l(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "reference_l"} {:array "$$reference_l"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$reference_l && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reference_l != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "reference_l"} {:array "$$reference_l"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$reference_l && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$reference_l != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "reference_l"} {:array "$$reference_l"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$reference_l && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$reference_l(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$reference_l;



implementation {:inline 1} _LOG_ATOMIC_$$reference_l(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$reference_l := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$reference_l);
    return;
}



procedure _CHECK_ATOMIC_$$reference_l(_P: bool, _offset: bv32);
  requires {:source_name "reference_l"} {:array "$$reference_l"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$reference_l && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "reference_l"} {:array "$$reference_l"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$reference_l && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$reference_l(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$reference_l;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$reference_l(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$reference_l := (if _P && _WRITE_HAS_OCCURRED_$$reference_l && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$reference_l);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_itemsets_l;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_itemsets_l;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_itemsets_l;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$reference_l;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$reference_l;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$reference_l;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_itemsets_d;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_itemsets_d;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_itemsets_d;
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
    havoc $$input_itemsets_d;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$input_itemsets_l;
    goto anon4;

  anon4:
    havoc $$reference_l;
    goto anon5;

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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_itemsets_l;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_itemsets_l;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_itemsets_l;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$reference_l;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$reference_l;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$reference_l;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_itemsets_d;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_itemsets_d;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_itemsets_d;
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
    havoc $$input_itemsets_d;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$input_itemsets_l;
    goto anon4;

  anon4:
    havoc $$reference_l;
    goto anon5;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_itemsets_l;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_itemsets_l;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_itemsets_l;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$reference_l;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$reference_l;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$reference_l;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_itemsets_d;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_itemsets_d;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_itemsets_d;
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
    havoc $$input_itemsets_d;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$input_itemsets_l;
    goto anon4;

  anon4:
    havoc $$reference_l;
    goto anon5;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_3($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_itemsets_l;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_itemsets_l;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_itemsets_l;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$reference_l;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$reference_l;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$reference_l;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_itemsets_d;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_itemsets_d;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_itemsets_d;
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
    havoc $$input_itemsets_d;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$input_itemsets_l;
    goto anon4;

  anon4:
    havoc $$reference_l;
    goto anon5;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_4($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_itemsets_l;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_itemsets_l;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_itemsets_l;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$reference_l;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$reference_l;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$reference_l;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_itemsets_d;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_itemsets_d;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_itemsets_d;
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
    havoc $$input_itemsets_d;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$input_itemsets_l;
    goto anon4;

  anon4:
    havoc $$reference_l;
    goto anon5;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_5($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_itemsets_l;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_itemsets_l;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_itemsets_l;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$reference_l;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$reference_l;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$reference_l;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_itemsets_d;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_itemsets_d;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_itemsets_d;
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
    havoc $$input_itemsets_d;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$input_itemsets_l;
    goto anon4;

  anon4:
    havoc $$reference_l;
    goto anon5;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_6($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_itemsets_l;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_itemsets_l;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_itemsets_l;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$reference_l;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$reference_l;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$reference_l;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$input_itemsets_d;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$input_itemsets_d;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$input_itemsets_d;
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
    havoc $$input_itemsets_d;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$input_itemsets_l;
    goto anon4;

  anon4:
    havoc $$reference_l;
    goto anon5;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
