type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



axiom {:array_info "$$global_subhisto"} {:global} {:elem_width 32} {:source_name "global_subhisto"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$global_subhisto: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$global_subhisto: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$global_subhisto: bool;

var {:source_name "global_histo"} {:global} $$global_histo: [bv32]bv8;

axiom {:array_info "$$global_histo"} {:global} {:elem_width 8} {:source_name "global_histo"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$global_histo: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$global_histo: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$global_histo: bool;

var {:source_name "global_overflow"} {:global} $$global_overflow: [bv32]bv32;

axiom {:array_info "$$global_overflow"} {:global} {:elem_width 32} {:source_name "global_overflow"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$global_overflow: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$global_overflow: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$global_overflow: bool;

var {:source_name "final_histo"} {:global} $$final_histo: [bv32]bv8;

axiom {:array_info "$$final_histo"} {:global} {:elem_width 8} {:source_name "final_histo"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$final_histo: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$final_histo: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$final_histo: bool;

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

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV16_ULT(bv16, bv16) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "histo_final_kernel"} {:kernel} $histo_final_kernel($sm_range_min: bv32, $sm_range_max: bv32, $histo_height: bv32, $histo_width: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $sm_range_min == 1bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $sm_range_max == 2bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $histo_height == 4096bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 3} {:thread 1} (if $histo_width == 256bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$global_subhisto && !_WRITE_HAS_OCCURRED_$$global_subhisto && !_ATOMIC_HAS_OCCURRED_$$global_subhisto;
  requires !_READ_HAS_OCCURRED_$$global_histo && !_WRITE_HAS_OCCURRED_$$global_histo && !_ATOMIC_HAS_OCCURRED_$$global_histo;
  requires !_READ_HAS_OCCURRED_$$global_overflow && !_WRITE_HAS_OCCURRED_$$global_overflow && !_ATOMIC_HAS_OCCURRED_$$global_overflow;
  requires !_READ_HAS_OCCURRED_$$final_histo && !_WRITE_HAS_OCCURRED_$$final_histo && !_ATOMIC_HAS_OCCURRED_$$final_histo;
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
  modifies _READ_HAS_OCCURRED_$$global_histo, _WRITE_HAS_OCCURRED_$$global_histo, _WRITE_READ_BENIGN_FLAG_$$global_histo, _WRITE_READ_BENIGN_FLAG_$$global_histo, _WRITE_HAS_OCCURRED_$$final_histo, _WRITE_READ_BENIGN_FLAG_$$final_histo, _WRITE_READ_BENIGN_FLAG_$$final_histo, _READ_HAS_OCCURRED_$$global_overflow, _WRITE_HAS_OCCURRED_$$global_overflow, _WRITE_READ_BENIGN_FLAG_$$global_overflow, _WRITE_READ_BENIGN_FLAG_$$global_overflow;



implementation {:source_name "histo_final_kernel"} {:kernel} $histo_final_kernel($sm_range_min: bv32, $sm_range_max: bv32, $histo_height: bv32, $histo_width: bv32)
{
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $i1.0$1: bv32;
  var $i1.0$2: bv32;
  var $i4.0$1: bv32;
  var $i4.0$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v1: bv32;
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v8$1: bv8;
  var v8$2: bv8;
  var v3: bv32;
  var v0: bv32;
  var v14$1: bv16;
  var v14$2: bv16;
  var v5$1: bool;
  var v5$2: bool;
  var v15$1: bv16;
  var v15$2: bv16;
  var v16$1: bv16;
  var v16$2: bv16;
  var v18$1: bool;
  var v18$2: bool;
  var v24$1: bv32;
  var v24$2: bv32;
  var v36$1: bv16;
  var v36$2: bv16;
  var v37$1: bv16;
  var v37$2: bv16;
  var v38$1: bv16;
  var v38$2: bv16;
  var v23$1: bv32;
  var v23$2: bv32;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v17$1: bv16;
  var v17$2: bv16;
  var v26$1: bv32;
  var v26$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v27$1: bool;
  var v27$2: bool;
  var v25$1: bv32;
  var v25$2: bv32;
  var v28$1: bv8;
  var v28$2: bv8;
  var v29$1: bv8;
  var v29$2: bv8;
  var v30$1: bv8;
  var v30$2: bv8;
  var v31$1: bv8;
  var v31$2: bv8;
  var v32$1: bv8;
  var v32$2: bv8;
  var v33$1: bv8;
  var v33$2: bv8;
  var v34$1: bv8;
  var v34$2: bv8;
  var v35$1: bv8;
  var v35$2: bv8;
  var v39$1: bv16;
  var v39$2: bv16;
  var v4: bv32;
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
    v0 := group_size_x;
    v1 := num_groups_x;
    v2$1 := BV32_ADD(local_id_x$1, BV32_MUL(group_id_x$1, v0));
    v2$2 := BV32_ADD(local_id_x$2, BV32_MUL(group_id_x$2, v0));
    v3 := BV32_MUL($sm_range_min, 24576bv32);
    v4 := BV32_MUL(BV32_ADD(BV32_SUB($sm_range_max, $sm_range_min), 1bv32), 24576bv32);
    $i.0$1 := v2$1;
    $i.0$2 := v2$2;
    p0$1 := false;
    p0$2 := false;
    p3$1 := false;
    p3$2 := false;
    p5$1 := false;
    p5$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_2"} true;
    assert {:block_sourceloc} {:sourceloc_num 5} p0$1 ==> true;
    v5$1 := (if p0$1 then BV32_ULT($i.0$1, BV32_UDIV(v3, 4bv32)) else v5$1);
    v5$2 := (if p0$2 then BV32_ULT($i.0$2, BV32_UDIV(v3, 4bv32)) else v5$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p1$1 := (if p0$1 && v5$1 then v5$1 else p1$1);
    p1$2 := (if p0$2 && v5$2 then v5$2 else p1$2);
    p0$1 := (if p0$1 && !v5$1 then v5$1 else p0$1);
    p0$2 := (if p0$2 && !v5$2 then v5$2 else p0$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_READ_$$global_histo(p1$1, BV32_MUL($i.0$1, 8bv32), $$global_histo[BV32_MUL($i.0$1, 8bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 7} _CHECK_READ_$$global_histo(p1$2, BV32_MUL($i.0$2, 8bv32), $$global_histo[BV32_MUL($i.0$2, 8bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v6$1 := (if p1$1 then $$global_histo[BV32_MUL($i.0$1, 8bv32)] else v6$1);
    v6$2 := (if p1$2 then $$global_histo[BV32_MUL($i.0$2, 8bv32)] else v6$2);
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$global_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 8bv32), 1bv32), $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 1bv32), $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v7$1 := (if p1$1 then $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 1bv32)] else v7$1);
    v7$2 := (if p1$2 then $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 1bv32)] else v7$2);
    call {:sourceloc} {:sourceloc_num 9} _LOG_READ_$$global_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 8bv32), 2bv32), $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 9} _CHECK_READ_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 2bv32), $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v8$1 := (if p1$1 then $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 2bv32)] else v8$1);
    v8$2 := (if p1$2 then $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 2bv32)] else v8$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$global_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 8bv32), 3bv32), $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 3bv32), $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v9$1 := (if p1$1 then $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 3bv32)] else v9$1);
    v9$2 := (if p1$2 then $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 3bv32)] else v9$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$global_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 8bv32), 4bv32), $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 4bv32), $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v10$1 := (if p1$1 then $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 4bv32)] else v10$1);
    v10$2 := (if p1$2 then $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 4bv32)] else v10$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$global_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 8bv32), 5bv32), $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 5bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 5bv32), $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 5bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v11$1 := (if p1$1 then $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 5bv32)] else v11$1);
    v11$2 := (if p1$2 then $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 5bv32)] else v11$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$global_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 8bv32), 6bv32), $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 6bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 6bv32), $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 6bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v12$1 := (if p1$1 then $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 6bv32)] else v12$1);
    v12$2 := (if p1$2 then $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 6bv32)] else v12$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$global_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 8bv32), 7bv32), $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 7bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 7bv32), $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 7bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v13$1 := (if p1$1 then $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 7bv32)] else v13$1);
    v13$2 := (if p1$2 then $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 7bv32)] else v13$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$global_histo(p1$1, BV32_MUL($i.0$1, 8bv32), 0bv8, $$global_histo[BV32_MUL($i.0$1, 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p1$2, BV32_MUL($i.0$2, 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$global_histo(p1$2, BV32_MUL($i.0$2, 8bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_MUL($i.0$1, 8bv32)] := (if p1$1 then 0bv8 else $$global_histo[BV32_MUL($i.0$1, 8bv32)]);
    $$global_histo[BV32_MUL($i.0$2, 8bv32)] := (if p1$2 then 0bv8 else $$global_histo[BV32_MUL($i.0$2, 8bv32)]);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$global_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 8bv32), 1bv32), 0bv8, $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 1bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 1bv32)] := (if p1$1 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 1bv32)]);
    $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 1bv32)] := (if p1$2 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$global_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 8bv32), 2bv32), 0bv8, $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 2bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 2bv32)] := (if p1$1 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 2bv32)]);
    $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 2bv32)] := (if p1$2 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$global_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 8bv32), 3bv32), 0bv8, $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 3bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 3bv32)] := (if p1$1 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 3bv32)]);
    $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 3bv32)] := (if p1$2 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 3bv32)]);
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$global_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 8bv32), 4bv32), 0bv8, $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 4bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 4bv32)] := (if p1$1 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 4bv32)]);
    $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 4bv32)] := (if p1$2 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 4bv32)]);
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$global_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 8bv32), 5bv32), 0bv8, $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 5bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 5bv32)] := (if p1$1 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 5bv32)]);
    $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 5bv32)] := (if p1$2 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 5bv32)]);
    call {:sourceloc} {:sourceloc_num 21} _LOG_WRITE_$$global_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 8bv32), 6bv32), 0bv8, $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 21} _CHECK_WRITE_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 6bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 6bv32)] := (if p1$1 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 6bv32)]);
    $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 6bv32)] := (if p1$2 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 6bv32)]);
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$global_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 8bv32), 7bv32), 0bv8, $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$global_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 8bv32), 7bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 7bv32)] := (if p1$1 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i.0$1, 8bv32), 7bv32)]);
    $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 7bv32)] := (if p1$2 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i.0$2, 8bv32), 7bv32)]);
    v14$1 := (if p1$1 then v7$1 ++ v6$1 else v14$1);
    v14$2 := (if p1$2 then v7$2 ++ v6$2 else v14$2);
    v15$1 := (if p1$1 then v9$1 ++ v8$1 else v15$1);
    v15$2 := (if p1$2 then v9$2 ++ v8$2 else v15$2);
    v16$1 := (if p1$1 then v11$1 ++ v10$1 else v16$1);
    v16$2 := (if p1$2 then v11$2 ++ v10$2 else v16$2);
    v17$1 := (if p1$1 then v13$1 ++ v12$1 else v17$1);
    v17$2 := (if p1$2 then v13$2 ++ v12$2 else v17$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$final_histo(p1$1, BV32_MUL($i.0$1, 4bv32), (if BV16_ULT(v14$1, 255bv16) then v14$1 else 255bv16)[8:0], $$final_histo[BV32_MUL($i.0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$final_histo(p1$2, BV32_MUL($i.0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$final_histo(p1$2, BV32_MUL($i.0$2, 4bv32), (if BV16_ULT(v14$2, 255bv16) then v14$2 else 255bv16)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$final_histo"} true;
    $$final_histo[BV32_MUL($i.0$1, 4bv32)] := (if p1$1 then (if BV16_ULT(v14$1, 255bv16) then v14$1 else 255bv16)[8:0] else $$final_histo[BV32_MUL($i.0$1, 4bv32)]);
    $$final_histo[BV32_MUL($i.0$2, 4bv32)] := (if p1$2 then (if BV16_ULT(v14$2, 255bv16) then v14$2 else 255bv16)[8:0] else $$final_histo[BV32_MUL($i.0$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$final_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 4bv32), 1bv32), (if BV16_ULT(v15$1, 255bv16) then v15$1 else 255bv16)[8:0], $$final_histo[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$final_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$final_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 1bv32), (if BV16_ULT(v15$2, 255bv16) then v15$2 else 255bv16)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$final_histo"} true;
    $$final_histo[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 1bv32)] := (if p1$1 then (if BV16_ULT(v15$1, 255bv16) then v15$1 else 255bv16)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 1bv32)]);
    $$final_histo[BV32_ADD(BV32_MUL($i.0$2, 4bv32), 1bv32)] := (if p1$2 then (if BV16_ULT(v15$2, 255bv16) then v15$2 else 255bv16)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i.0$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 25} _LOG_WRITE_$$final_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 4bv32), 2bv32), (if BV16_ULT(v16$1, 255bv16) then v16$1 else 255bv16)[8:0], $$final_histo[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$final_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 25} _CHECK_WRITE_$$final_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 2bv32), (if BV16_ULT(v16$2, 255bv16) then v16$2 else 255bv16)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$final_histo"} true;
    $$final_histo[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 2bv32)] := (if p1$1 then (if BV16_ULT(v16$1, 255bv16) then v16$1 else 255bv16)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 2bv32)]);
    $$final_histo[BV32_ADD(BV32_MUL($i.0$2, 4bv32), 2bv32)] := (if p1$2 then (if BV16_ULT(v16$2, 255bv16) then v16$2 else 255bv16)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i.0$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$final_histo(p1$1, BV32_ADD(BV32_MUL($i.0$1, 4bv32), 3bv32), (if BV16_ULT(v17$1, 255bv16) then v17$1 else 255bv16)[8:0], $$final_histo[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$final_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_51"} {:captureState "check_state_51"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_51"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$final_histo(p1$2, BV32_ADD(BV32_MUL($i.0$2, 4bv32), 3bv32), (if BV16_ULT(v17$2, 255bv16) then v17$2 else 255bv16)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$final_histo"} true;
    $$final_histo[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 3bv32)] := (if p1$1 then (if BV16_ULT(v17$1, 255bv16) then v17$1 else 255bv16)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i.0$1, 4bv32), 3bv32)]);
    $$final_histo[BV32_ADD(BV32_MUL($i.0$2, 4bv32), 3bv32)] := (if p1$2 then (if BV16_ULT(v17$2, 255bv16) then v17$2 else 255bv16)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i.0$2, 4bv32), 3bv32)]);
    $i.0$1 := (if p1$1 then BV32_ADD($i.0$1, BV32_MUL(v1, v0)) else $i.0$1);
    $i.0$2 := (if p1$2 then BV32_ADD($i.0$2, BV32_MUL(v1, v0)) else $i.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    $i1.0$1 := BV32_ADD(BV32_UDIV(v3, 4bv32), v2$1);
    $i1.0$2 := BV32_ADD(BV32_UDIV(v3, 4bv32), v2$2);
    p3$1 := true;
    p3$2 := true;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_1"} true;
    assert {:block_sourceloc} {:sourceloc_num 29} p3$1 ==> true;
    v18$1 := (if p3$1 then BV32_ULT($i1.0$1, BV32_UDIV(BV32_ADD(v3, v4), 4bv32)) else v18$1);
    v18$2 := (if p3$2 then BV32_ULT($i1.0$2, BV32_UDIV(BV32_ADD(v3, v4), 4bv32)) else v18$2);
    p4$1 := false;
    p4$2 := false;
    p4$1 := (if p3$1 && v18$1 then v18$1 else p4$1);
    p4$2 := (if p3$2 && v18$2 then v18$2 else p4$2);
    p3$1 := (if p3$1 && !v18$1 then v18$1 else p3$1);
    p3$2 := (if p3$2 && !v18$2 then v18$2 else p3$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_READ_$$global_overflow(p4$1, BV32_MUL($i1.0$1, 4bv32), $$global_overflow[BV32_MUL($i1.0$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 31} _CHECK_READ_$$global_overflow(p4$2, BV32_MUL($i1.0$2, 4bv32), $$global_overflow[BV32_MUL($i1.0$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_overflow"} true;
    v19$1 := (if p4$1 then $$global_overflow[BV32_MUL($i1.0$1, 4bv32)] else v19$1);
    v19$2 := (if p4$2 then $$global_overflow[BV32_MUL($i1.0$2, 4bv32)] else v19$2);
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$global_overflow(p4$1, BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 1bv32), $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$global_overflow(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 1bv32), $$global_overflow[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_overflow"} true;
    v20$1 := (if p4$1 then $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 1bv32)] else v20$1);
    v20$2 := (if p4$2 then $$global_overflow[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 1bv32)] else v20$2);
    call {:sourceloc} {:sourceloc_num 33} _LOG_READ_$$global_overflow(p4$1, BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 2bv32), $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 33} _CHECK_READ_$$global_overflow(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 2bv32), $$global_overflow[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_overflow"} true;
    v21$1 := (if p4$1 then $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 2bv32)] else v21$1);
    v21$2 := (if p4$2 then $$global_overflow[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 2bv32)] else v21$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$global_overflow(p4$1, BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 3bv32), $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$global_overflow(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 3bv32), $$global_overflow[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_overflow"} true;
    v22$1 := (if p4$1 then $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 3bv32)] else v22$1);
    v22$2 := (if p4$2 then $$global_overflow[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 3bv32)] else v22$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$global_overflow(p4$1, BV32_MUL($i1.0$1, 4bv32), 0bv32, $$global_overflow[BV32_MUL($i1.0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_overflow(p4$2, BV32_MUL($i1.0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$global_overflow(p4$2, BV32_MUL($i1.0$2, 4bv32), 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_overflow"} true;
    $$global_overflow[BV32_MUL($i1.0$1, 4bv32)] := (if p4$1 then 0bv32 else $$global_overflow[BV32_MUL($i1.0$1, 4bv32)]);
    $$global_overflow[BV32_MUL($i1.0$2, 4bv32)] := (if p4$2 then 0bv32 else $$global_overflow[BV32_MUL($i1.0$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$global_overflow(p4$1, BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 1bv32), 0bv32, $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_overflow(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$global_overflow(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 1bv32), 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_overflow"} true;
    $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 1bv32)] := (if p4$1 then 0bv32 else $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 1bv32)]);
    $$global_overflow[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 1bv32)] := (if p4$2 then 0bv32 else $$global_overflow[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$global_overflow(p4$1, BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 2bv32), 0bv32, $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_overflow(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$global_overflow(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 2bv32), 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_overflow"} true;
    $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 2bv32)] := (if p4$1 then 0bv32 else $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 2bv32)]);
    $$global_overflow[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 2bv32)] := (if p4$2 then 0bv32 else $$global_overflow[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 38} _LOG_WRITE_$$global_overflow(p4$1, BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 3bv32), 0bv32, $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_overflow(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 38} _CHECK_WRITE_$$global_overflow(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 3bv32), 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_overflow"} true;
    $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 3bv32)] := (if p4$1 then 0bv32 else $$global_overflow[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 3bv32)]);
    $$global_overflow[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 3bv32)] := (if p4$2 then 0bv32 else $$global_overflow[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 3bv32)]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v23$1 := (if p4$1 then _HAVOC_bv32$1 else v23$1);
    v23$2 := (if p4$2 then _HAVOC_bv32$2 else v23$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v24$1 := (if p4$1 then _HAVOC_bv32$1 else v24$1);
    v24$2 := (if p4$2 then _HAVOC_bv32$2 else v24$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v25$1 := (if p4$1 then _HAVOC_bv32$1 else v25$1);
    v25$2 := (if p4$2 then _HAVOC_bv32$2 else v25$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v26$1 := (if p4$1 then _HAVOC_bv32$1 else v26$1);
    v26$2 := (if p4$2 then _HAVOC_bv32$2 else v26$2);
    call {:sourceloc} {:sourceloc_num 43} _LOG_WRITE_$$final_histo(p4$1, BV32_MUL($i1.0$1, 4bv32), (if BV32_ULT(v23$1, 255bv32) then v23$1 else 255bv32)[8:0], $$final_histo[BV32_MUL($i1.0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$final_histo(p4$2, BV32_MUL($i1.0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 43} _CHECK_WRITE_$$final_histo(p4$2, BV32_MUL($i1.0$2, 4bv32), (if BV32_ULT(v23$2, 255bv32) then v23$2 else 255bv32)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$final_histo"} true;
    $$final_histo[BV32_MUL($i1.0$1, 4bv32)] := (if p4$1 then (if BV32_ULT(v23$1, 255bv32) then v23$1 else 255bv32)[8:0] else $$final_histo[BV32_MUL($i1.0$1, 4bv32)]);
    $$final_histo[BV32_MUL($i1.0$2, 4bv32)] := (if p4$2 then (if BV32_ULT(v23$2, 255bv32) then v23$2 else 255bv32)[8:0] else $$final_histo[BV32_MUL($i1.0$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$final_histo(p4$1, BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 1bv32), (if BV32_ULT(v24$1, 255bv32) then v24$1 else 255bv32)[8:0], $$final_histo[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$final_histo(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$final_histo(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 1bv32), (if BV32_ULT(v24$2, 255bv32) then v24$2 else 255bv32)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$final_histo"} true;
    $$final_histo[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 1bv32)] := (if p4$1 then (if BV32_ULT(v24$1, 255bv32) then v24$1 else 255bv32)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 1bv32)]);
    $$final_histo[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 1bv32)] := (if p4$2 then (if BV32_ULT(v24$2, 255bv32) then v24$2 else 255bv32)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 45} _LOG_WRITE_$$final_histo(p4$1, BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 2bv32), (if BV32_ULT(v25$1, 255bv32) then v25$1 else 255bv32)[8:0], $$final_histo[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$final_histo(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 45} _CHECK_WRITE_$$final_histo(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 2bv32), (if BV32_ULT(v25$2, 255bv32) then v25$2 else 255bv32)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$final_histo"} true;
    $$final_histo[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 2bv32)] := (if p4$1 then (if BV32_ULT(v25$1, 255bv32) then v25$1 else 255bv32)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 2bv32)]);
    $$final_histo[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 2bv32)] := (if p4$2 then (if BV32_ULT(v25$2, 255bv32) then v25$2 else 255bv32)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$final_histo(p4$1, BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 3bv32), (if BV32_ULT(v26$1, 255bv32) then v26$1 else 255bv32)[8:0], $$final_histo[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$final_histo(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$final_histo(p4$2, BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 3bv32), (if BV32_ULT(v26$2, 255bv32) then v26$2 else 255bv32)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$final_histo"} true;
    $$final_histo[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 3bv32)] := (if p4$1 then (if BV32_ULT(v26$1, 255bv32) then v26$1 else 255bv32)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i1.0$1, 4bv32), 3bv32)]);
    $$final_histo[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 3bv32)] := (if p4$2 then (if BV32_ULT(v26$2, 255bv32) then v26$2 else 255bv32)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i1.0$2, 4bv32), 3bv32)]);
    $i1.0$1 := (if p4$1 then BV32_ADD($i1.0$1, BV32_MUL(v1, v0)) else $i1.0$1);
    $i1.0$2 := (if p4$2 then BV32_ADD($i1.0$2, BV32_MUL(v1, v0)) else $i1.0$2);
    p3$1 := (if p4$1 then true else p3$1);
    p3$2 := (if p4$2 then true else p3$2);
    goto $5.backedge, $5.tail;

  $5.tail:
    assume !p3$1 && !p3$2;
    $i4.0$1 := BV32_ADD(BV32_UDIV(BV32_ADD(v3, v4), 4bv32), v2$1);
    $i4.0$2 := BV32_ADD(BV32_UDIV(BV32_ADD(v3, v4), 4bv32), v2$2);
    p5$1 := true;
    p5$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 49} p5$1 ==> true;
    v27$1 := (if p5$1 then BV32_ULT($i4.0$1, BV32_UDIV(BV32_MUL($histo_height, $histo_width), 4bv32)) else v27$1);
    v27$2 := (if p5$2 then BV32_ULT($i4.0$2, BV32_UDIV(BV32_MUL($histo_height, $histo_width), 4bv32)) else v27$2);
    p6$1 := false;
    p6$2 := false;
    p6$1 := (if p5$1 && v27$1 then v27$1 else p6$1);
    p6$2 := (if p5$2 && v27$2 then v27$2 else p6$2);
    p5$1 := (if p5$1 && !v27$1 then v27$1 else p5$1);
    p5$2 := (if p5$2 && !v27$2 then v27$2 else p5$2);
    call {:sourceloc} {:sourceloc_num 51} _LOG_READ_$$global_histo(p6$1, BV32_MUL($i4.0$1, 8bv32), $$global_histo[BV32_MUL($i4.0$1, 8bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 51} _CHECK_READ_$$global_histo(p6$2, BV32_MUL($i4.0$2, 8bv32), $$global_histo[BV32_MUL($i4.0$2, 8bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v28$1 := (if p6$1 then $$global_histo[BV32_MUL($i4.0$1, 8bv32)] else v28$1);
    v28$2 := (if p6$2 then $$global_histo[BV32_MUL($i4.0$2, 8bv32)] else v28$2);
    call {:sourceloc} {:sourceloc_num 52} _LOG_READ_$$global_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 1bv32), $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 52} _CHECK_READ_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 1bv32), $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v29$1 := (if p6$1 then $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 1bv32)] else v29$1);
    v29$2 := (if p6$2 then $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 1bv32)] else v29$2);
    call {:sourceloc} {:sourceloc_num 53} _LOG_READ_$$global_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 2bv32), $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 53} _CHECK_READ_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 2bv32), $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v30$1 := (if p6$1 then $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 2bv32)] else v30$1);
    v30$2 := (if p6$2 then $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 2bv32)] else v30$2);
    call {:sourceloc} {:sourceloc_num 54} _LOG_READ_$$global_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 3bv32), $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 54} _CHECK_READ_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 3bv32), $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v31$1 := (if p6$1 then $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 3bv32)] else v31$1);
    v31$2 := (if p6$2 then $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 3bv32)] else v31$2);
    call {:sourceloc} {:sourceloc_num 55} _LOG_READ_$$global_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 4bv32), $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 55} _CHECK_READ_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 4bv32), $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v32$1 := (if p6$1 then $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 4bv32)] else v32$1);
    v32$2 := (if p6$2 then $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 4bv32)] else v32$2);
    call {:sourceloc} {:sourceloc_num 56} _LOG_READ_$$global_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 5bv32), $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 5bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 56} _CHECK_READ_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 5bv32), $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 5bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v33$1 := (if p6$1 then $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 5bv32)] else v33$1);
    v33$2 := (if p6$2 then $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 5bv32)] else v33$2);
    call {:sourceloc} {:sourceloc_num 57} _LOG_READ_$$global_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 6bv32), $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 6bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 57} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 57} _CHECK_READ_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 6bv32), $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 6bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v34$1 := (if p6$1 then $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 6bv32)] else v34$1);
    v34$2 := (if p6$2 then $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 6bv32)] else v34$2);
    call {:sourceloc} {:sourceloc_num 58} _LOG_READ_$$global_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 7bv32), $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 7bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 58} _CHECK_READ_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 7bv32), $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 7bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$global_histo"} true;
    v35$1 := (if p6$1 then $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 7bv32)] else v35$1);
    v35$2 := (if p6$2 then $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 7bv32)] else v35$2);
    call {:sourceloc} {:sourceloc_num 59} _LOG_WRITE_$$global_histo(p6$1, BV32_MUL($i4.0$1, 8bv32), 0bv8, $$global_histo[BV32_MUL($i4.0$1, 8bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p6$2, BV32_MUL($i4.0$2, 8bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 59} _CHECK_WRITE_$$global_histo(p6$2, BV32_MUL($i4.0$2, 8bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_MUL($i4.0$1, 8bv32)] := (if p6$1 then 0bv8 else $$global_histo[BV32_MUL($i4.0$1, 8bv32)]);
    $$global_histo[BV32_MUL($i4.0$2, 8bv32)] := (if p6$2 then 0bv8 else $$global_histo[BV32_MUL($i4.0$2, 8bv32)]);
    call {:sourceloc} {:sourceloc_num 60} _LOG_WRITE_$$global_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 1bv32), 0bv8, $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 60} _CHECK_WRITE_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 1bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 1bv32)] := (if p6$1 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 1bv32)]);
    $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 1bv32)] := (if p6$2 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 61} _LOG_WRITE_$$global_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 2bv32), 0bv8, $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 61} _CHECK_WRITE_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 2bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 2bv32)] := (if p6$1 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 2bv32)]);
    $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 2bv32)] := (if p6$2 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 62} _LOG_WRITE_$$global_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 3bv32), 0bv8, $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 62} _CHECK_WRITE_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 3bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 3bv32)] := (if p6$1 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 3bv32)]);
    $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 3bv32)] := (if p6$2 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 3bv32)]);
    call {:sourceloc} {:sourceloc_num 63} _LOG_WRITE_$$global_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 4bv32), 0bv8, $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 63} _CHECK_WRITE_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 4bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 4bv32)] := (if p6$1 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 4bv32)]);
    $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 4bv32)] := (if p6$2 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 4bv32)]);
    call {:sourceloc} {:sourceloc_num 64} _LOG_WRITE_$$global_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 5bv32), 0bv8, $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 64} _CHECK_WRITE_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 5bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 5bv32)] := (if p6$1 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 5bv32)]);
    $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 5bv32)] := (if p6$2 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 5bv32)]);
    call {:sourceloc} {:sourceloc_num 65} _LOG_WRITE_$$global_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 6bv32), 0bv8, $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 65} _CHECK_WRITE_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 6bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 6bv32)] := (if p6$1 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 6bv32)]);
    $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 6bv32)] := (if p6$2 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 6bv32)]);
    call {:sourceloc} {:sourceloc_num 66} _LOG_WRITE_$$global_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 7bv32), 0bv8, $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 66} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 66} _CHECK_WRITE_$$global_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 7bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$global_histo"} true;
    $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 7bv32)] := (if p6$1 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i4.0$1, 8bv32), 7bv32)]);
    $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 7bv32)] := (if p6$2 then 0bv8 else $$global_histo[BV32_ADD(BV32_MUL($i4.0$2, 8bv32), 7bv32)]);
    v36$1 := (if p6$1 then v29$1 ++ v28$1 else v36$1);
    v36$2 := (if p6$2 then v29$2 ++ v28$2 else v36$2);
    v37$1 := (if p6$1 then v31$1 ++ v30$1 else v37$1);
    v37$2 := (if p6$2 then v31$2 ++ v30$2 else v37$2);
    v38$1 := (if p6$1 then v33$1 ++ v32$1 else v38$1);
    v38$2 := (if p6$2 then v33$2 ++ v32$2 else v38$2);
    v39$1 := (if p6$1 then v35$1 ++ v34$1 else v39$1);
    v39$2 := (if p6$2 then v35$2 ++ v34$2 else v39$2);
    call {:sourceloc} {:sourceloc_num 67} _LOG_WRITE_$$final_histo(p6$1, BV32_MUL($i4.0$1, 4bv32), (if BV16_ULT(v36$1, 255bv16) then v36$1 else 255bv16)[8:0], $$final_histo[BV32_MUL($i4.0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$final_histo(p6$2, BV32_MUL($i4.0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 67} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 67} _CHECK_WRITE_$$final_histo(p6$2, BV32_MUL($i4.0$2, 4bv32), (if BV16_ULT(v36$2, 255bv16) then v36$2 else 255bv16)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$final_histo"} true;
    $$final_histo[BV32_MUL($i4.0$1, 4bv32)] := (if p6$1 then (if BV16_ULT(v36$1, 255bv16) then v36$1 else 255bv16)[8:0] else $$final_histo[BV32_MUL($i4.0$1, 4bv32)]);
    $$final_histo[BV32_MUL($i4.0$2, 4bv32)] := (if p6$2 then (if BV16_ULT(v36$2, 255bv16) then v36$2 else 255bv16)[8:0] else $$final_histo[BV32_MUL($i4.0$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 68} _LOG_WRITE_$$final_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 4bv32), 1bv32), (if BV16_ULT(v37$1, 255bv16) then v37$1 else 255bv16)[8:0], $$final_histo[BV32_ADD(BV32_MUL($i4.0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$final_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 68} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 68} _CHECK_WRITE_$$final_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 4bv32), 1bv32), (if BV16_ULT(v37$2, 255bv16) then v37$2 else 255bv16)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$final_histo"} true;
    $$final_histo[BV32_ADD(BV32_MUL($i4.0$1, 4bv32), 1bv32)] := (if p6$1 then (if BV16_ULT(v37$1, 255bv16) then v37$1 else 255bv16)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i4.0$1, 4bv32), 1bv32)]);
    $$final_histo[BV32_ADD(BV32_MUL($i4.0$2, 4bv32), 1bv32)] := (if p6$2 then (if BV16_ULT(v37$2, 255bv16) then v37$2 else 255bv16)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i4.0$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 69} _LOG_WRITE_$$final_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 4bv32), 2bv32), (if BV16_ULT(v38$1, 255bv16) then v38$1 else 255bv16)[8:0], $$final_histo[BV32_ADD(BV32_MUL($i4.0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$final_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 69} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 69} _CHECK_WRITE_$$final_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 4bv32), 2bv32), (if BV16_ULT(v38$2, 255bv16) then v38$2 else 255bv16)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$final_histo"} true;
    $$final_histo[BV32_ADD(BV32_MUL($i4.0$1, 4bv32), 2bv32)] := (if p6$1 then (if BV16_ULT(v38$1, 255bv16) then v38$1 else 255bv16)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i4.0$1, 4bv32), 2bv32)]);
    $$final_histo[BV32_ADD(BV32_MUL($i4.0$2, 4bv32), 2bv32)] := (if p6$2 then (if BV16_ULT(v38$2, 255bv16) then v38$2 else 255bv16)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i4.0$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 70} _LOG_WRITE_$$final_histo(p6$1, BV32_ADD(BV32_MUL($i4.0$1, 4bv32), 3bv32), (if BV16_ULT(v39$1, 255bv16) then v39$1 else 255bv16)[8:0], $$final_histo[BV32_ADD(BV32_MUL($i4.0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$final_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 70} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 70} _CHECK_WRITE_$$final_histo(p6$2, BV32_ADD(BV32_MUL($i4.0$2, 4bv32), 3bv32), (if BV16_ULT(v39$2, 255bv16) then v39$2 else 255bv16)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$final_histo"} true;
    $$final_histo[BV32_ADD(BV32_MUL($i4.0$1, 4bv32), 3bv32)] := (if p6$1 then (if BV16_ULT(v39$1, 255bv16) then v39$1 else 255bv16)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i4.0$1, 4bv32), 3bv32)]);
    $$final_histo[BV32_ADD(BV32_MUL($i4.0$2, 4bv32), 3bv32)] := (if p6$2 then (if BV16_ULT(v39$2, 255bv16) then v39$2 else 255bv16)[8:0] else $$final_histo[BV32_ADD(BV32_MUL($i4.0$2, 4bv32), 3bv32)]);
    $i4.0$1 := (if p6$1 then BV32_ADD($i4.0$1, BV32_MUL(v1, v0)) else $i4.0$1);
    $i4.0$2 := (if p6$2 then BV32_ADD($i4.0$2, BV32_MUL(v1, v0)) else $i4.0$2);
    p5$1 := (if p6$1 then true else p5$1);
    p5$2 := (if p6$2 then true else p5$2);
    goto $9.backedge, $9.tail;

  $9.tail:
    assume !p5$1 && !p5$2;
    return;

  $9.backedge:
    assume {:backedge} p5$1 || p5$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $9;

  $5.backedge:
    assume {:backedge} p3$1 || p3$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $5;

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

axiom (if num_groups_x == 42bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$global_subhisto: bv32;

procedure {:inline 1} _LOG_READ_$$global_subhisto(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$global_subhisto;



implementation {:inline 1} _LOG_READ_$$global_subhisto(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$global_subhisto := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_subhisto == _value then true else _READ_HAS_OCCURRED_$$global_subhisto);
    return;
}



procedure _CHECK_READ_$$global_subhisto(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "global_subhisto"} {:array "$$global_subhisto"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$global_subhisto);
  requires {:source_name "global_subhisto"} {:array "$$global_subhisto"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$global_subhisto: bool;

procedure {:inline 1} _LOG_WRITE_$$global_subhisto(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$global_subhisto, _WRITE_READ_BENIGN_FLAG_$$global_subhisto;



implementation {:inline 1} _LOG_WRITE_$$global_subhisto(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$global_subhisto := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_subhisto == _value then true else _WRITE_HAS_OCCURRED_$$global_subhisto);
    _WRITE_READ_BENIGN_FLAG_$$global_subhisto := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_subhisto == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$global_subhisto);
    return;
}



procedure _CHECK_WRITE_$$global_subhisto(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "global_subhisto"} {:array "$$global_subhisto"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_subhisto != _value);
  requires {:source_name "global_subhisto"} {:array "$$global_subhisto"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_subhisto != _value);
  requires {:source_name "global_subhisto"} {:array "$$global_subhisto"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$global_subhisto(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$global_subhisto;



implementation {:inline 1} _LOG_ATOMIC_$$global_subhisto(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$global_subhisto := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$global_subhisto);
    return;
}



procedure _CHECK_ATOMIC_$$global_subhisto(_P: bool, _offset: bv32);
  requires {:source_name "global_subhisto"} {:array "$$global_subhisto"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset);
  requires {:source_name "global_subhisto"} {:array "$$global_subhisto"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_subhisto(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$global_subhisto;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_subhisto(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$global_subhisto := (if _P && _WRITE_HAS_OCCURRED_$$global_subhisto && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$global_subhisto);
    return;
}



const _WATCHED_VALUE_$$global_histo: bv8;

procedure {:inline 1} _LOG_READ_$$global_histo(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$global_histo;



implementation {:inline 1} _LOG_READ_$$global_histo(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$global_histo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_histo == _value then true else _READ_HAS_OCCURRED_$$global_histo);
    return;
}



procedure _CHECK_READ_$$global_histo(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "global_histo"} {:array "$$global_histo"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$global_histo);
  requires {:source_name "global_histo"} {:array "$$global_histo"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$global_histo: bool;

procedure {:inline 1} _LOG_WRITE_$$global_histo(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$global_histo, _WRITE_READ_BENIGN_FLAG_$$global_histo;



implementation {:inline 1} _LOG_WRITE_$$global_histo(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$global_histo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_histo == _value then true else _WRITE_HAS_OCCURRED_$$global_histo);
    _WRITE_READ_BENIGN_FLAG_$$global_histo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_histo == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$global_histo);
    return;
}



procedure _CHECK_WRITE_$$global_histo(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "global_histo"} {:array "$$global_histo"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_histo != _value);
  requires {:source_name "global_histo"} {:array "$$global_histo"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_histo != _value);
  requires {:source_name "global_histo"} {:array "$$global_histo"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$global_histo(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$global_histo;



implementation {:inline 1} _LOG_ATOMIC_$$global_histo(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$global_histo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$global_histo);
    return;
}



procedure _CHECK_ATOMIC_$$global_histo(_P: bool, _offset: bv32);
  requires {:source_name "global_histo"} {:array "$$global_histo"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset);
  requires {:source_name "global_histo"} {:array "$$global_histo"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$global_histo;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_histo(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$global_histo := (if _P && _WRITE_HAS_OCCURRED_$$global_histo && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$global_histo);
    return;
}



const _WATCHED_VALUE_$$global_overflow: bv32;

procedure {:inline 1} _LOG_READ_$$global_overflow(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$global_overflow;



implementation {:inline 1} _LOG_READ_$$global_overflow(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$global_overflow := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_overflow == _value then true else _READ_HAS_OCCURRED_$$global_overflow);
    return;
}



procedure _CHECK_READ_$$global_overflow(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "global_overflow"} {:array "$$global_overflow"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$global_overflow);
  requires {:source_name "global_overflow"} {:array "$$global_overflow"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$global_overflow: bool;

procedure {:inline 1} _LOG_WRITE_$$global_overflow(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$global_overflow, _WRITE_READ_BENIGN_FLAG_$$global_overflow;



implementation {:inline 1} _LOG_WRITE_$$global_overflow(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$global_overflow := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_overflow == _value then true else _WRITE_HAS_OCCURRED_$$global_overflow);
    _WRITE_READ_BENIGN_FLAG_$$global_overflow := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_overflow == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$global_overflow);
    return;
}



procedure _CHECK_WRITE_$$global_overflow(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "global_overflow"} {:array "$$global_overflow"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_overflow != _value);
  requires {:source_name "global_overflow"} {:array "$$global_overflow"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$global_overflow != _value);
  requires {:source_name "global_overflow"} {:array "$$global_overflow"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$global_overflow(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$global_overflow;



implementation {:inline 1} _LOG_ATOMIC_$$global_overflow(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$global_overflow := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$global_overflow);
    return;
}



procedure _CHECK_ATOMIC_$$global_overflow(_P: bool, _offset: bv32);
  requires {:source_name "global_overflow"} {:array "$$global_overflow"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset);
  requires {:source_name "global_overflow"} {:array "$$global_overflow"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_overflow(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$global_overflow;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$global_overflow(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$global_overflow := (if _P && _WRITE_HAS_OCCURRED_$$global_overflow && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$global_overflow);
    return;
}



const _WATCHED_VALUE_$$final_histo: bv8;

procedure {:inline 1} _LOG_READ_$$final_histo(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$final_histo;



implementation {:inline 1} _LOG_READ_$$final_histo(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$final_histo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$final_histo == _value then true else _READ_HAS_OCCURRED_$$final_histo);
    return;
}



procedure _CHECK_READ_$$final_histo(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "final_histo"} {:array "$$final_histo"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$final_histo && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$final_histo);
  requires {:source_name "final_histo"} {:array "$$final_histo"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$final_histo && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$final_histo: bool;

procedure {:inline 1} _LOG_WRITE_$$final_histo(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$final_histo, _WRITE_READ_BENIGN_FLAG_$$final_histo;



implementation {:inline 1} _LOG_WRITE_$$final_histo(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$final_histo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$final_histo == _value then true else _WRITE_HAS_OCCURRED_$$final_histo);
    _WRITE_READ_BENIGN_FLAG_$$final_histo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$final_histo == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$final_histo);
    return;
}



procedure _CHECK_WRITE_$$final_histo(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "final_histo"} {:array "$$final_histo"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$final_histo && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$final_histo != _value);
  requires {:source_name "final_histo"} {:array "$$final_histo"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$final_histo && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$final_histo != _value);
  requires {:source_name "final_histo"} {:array "$$final_histo"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$final_histo && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$final_histo(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$final_histo;



implementation {:inline 1} _LOG_ATOMIC_$$final_histo(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$final_histo := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$final_histo);
    return;
}



procedure _CHECK_ATOMIC_$$final_histo(_P: bool, _offset: bv32);
  requires {:source_name "final_histo"} {:array "$$final_histo"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$final_histo && _WATCHED_OFFSET == _offset);
  requires {:source_name "final_histo"} {:array "$$final_histo"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$final_histo && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$final_histo(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$final_histo;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$final_histo(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$final_histo := (if _P && _WRITE_HAS_OCCURRED_$$final_histo && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$final_histo);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
