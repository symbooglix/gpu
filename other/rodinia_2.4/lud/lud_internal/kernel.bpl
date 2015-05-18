type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "m"} {:global} $$m: [bv32]bv32;

axiom {:array_info "$$m"} {:global} {:elem_width 32} {:source_name "m"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$m: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$m: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$m: bool;

var {:source_name "peri_row"} {:group_shared} $$peri_row: [bv1][bv32]bv32;

axiom {:array_info "$$peri_row"} {:group_shared} {:elem_width 32} {:source_name "peri_row"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$peri_row: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$peri_row: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$peri_row: bool;

var {:source_name "peri_col"} {:group_shared} $$peri_col: [bv1][bv32]bv32;

axiom {:array_info "$$peri_col"} {:group_shared} {:elem_width 32} {:source_name "peri_col"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$peri_col: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$peri_col: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$peri_col: bool;

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

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "lud_internal"} {:kernel} $lud_internal($matrix_dim: bv32, $offset: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $matrix_dim == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $offset == 0bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$m && !_WRITE_HAS_OCCURRED_$$m && !_ATOMIC_HAS_OCCURRED_$$m;
  requires !_READ_HAS_OCCURRED_$$peri_row && !_WRITE_HAS_OCCURRED_$$peri_row && !_ATOMIC_HAS_OCCURRED_$$peri_row;
  requires !_READ_HAS_OCCURRED_$$peri_col && !_WRITE_HAS_OCCURRED_$$peri_col && !_ATOMIC_HAS_OCCURRED_$$peri_col;
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
  modifies $$peri_row, $$peri_col, _READ_HAS_OCCURRED_$$m, _WRITE_HAS_OCCURRED_$$peri_row, _WRITE_READ_BENIGN_FLAG_$$peri_row, _WRITE_READ_BENIGN_FLAG_$$peri_row, _WRITE_HAS_OCCURRED_$$peri_col, _WRITE_READ_BENIGN_FLAG_$$peri_col, _WRITE_READ_BENIGN_FLAG_$$peri_col, $$m, _TRACKING, _WRITE_HAS_OCCURRED_$$m, _WRITE_READ_BENIGN_FLAG_$$m, _WRITE_READ_BENIGN_FLAG_$$m, _READ_HAS_OCCURRED_$$peri_col, _READ_HAS_OCCURRED_$$peri_row;



implementation {:source_name "lud_internal"} {:kernel} $lud_internal($matrix_dim: bv32, $offset: bv32)
{
  var $i.0: bv32;
  var $sum.0$1: bv32;
  var $sum.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6: bool;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;


  __partitioned_block_$0_0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1$1 := local_id_y$1;
    v1$2 := local_id_y$2;
    v2$1 := BV32_ADD($offset, BV32_MUL(BV32_ADD(group_id_y$1, 1bv32), 16bv32));
    v2$2 := BV32_ADD($offset, BV32_MUL(BV32_ADD(group_id_y$2, 1bv32), 16bv32));
    v3$1 := BV32_ADD($offset, BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), 16bv32));
    v3$2 := BV32_ADD($offset, BV32_MUL(BV32_ADD(group_id_x$2, 1bv32), 16bv32));
    call {:sourceloc} {:sourceloc_num 3} _LOG_READ_$$m(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD($offset, v1$1), $matrix_dim), v3$1), v0$1), $$m[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD($offset, v1$1), $matrix_dim), v3$1), v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 3} _CHECK_READ_$$m(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD($offset, v1$2), $matrix_dim), v3$2), v0$2), $$m[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD($offset, v1$2), $matrix_dim), v3$2), v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$m"} true;
    v4$1 := $$m[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD($offset, v1$1), $matrix_dim), v3$1), v0$1)];
    v4$2 := $$m[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD($offset, v1$2), $matrix_dim), v3$2), v0$2)];
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$peri_row(true, BV32_ADD(BV32_MUL(v1$1, 16bv32), v0$1), v4$1, $$peri_row[1bv1][BV32_ADD(BV32_MUL(v1$1, 16bv32), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$peri_row(true, BV32_ADD(BV32_MUL(v1$2, 16bv32), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$peri_row(true, BV32_ADD(BV32_MUL(v1$2, 16bv32), v0$2), v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$peri_row"} true;
    $$peri_row[1bv1][BV32_ADD(BV32_MUL(v1$1, 16bv32), v0$1)] := v4$1;
    $$peri_row[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, 16bv32), v0$2)] := v4$2;
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$m(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(v2$1, v1$1), $matrix_dim), $offset), v0$1), $$m[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(v2$1, v1$1), $matrix_dim), $offset), v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$m(true, BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(v2$2, v1$2), $matrix_dim), $offset), v0$2), $$m[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(v2$2, v1$2), $matrix_dim), $offset), v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$m"} true;
    v5$1 := $$m[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(v2$1, v1$1), $matrix_dim), $offset), v0$1)];
    v5$2 := $$m[BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(v2$2, v1$2), $matrix_dim), $offset), v0$2)];
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$peri_col(true, BV32_ADD(BV32_MUL(v1$1, 16bv32), v0$1), v5$1, $$peri_col[1bv1][BV32_ADD(BV32_MUL(v1$1, 16bv32), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$peri_col(true, BV32_ADD(BV32_MUL(v1$2, 16bv32), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$peri_col(true, BV32_ADD(BV32_MUL(v1$2, 16bv32), v0$2), v5$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$peri_col"} true;
    $$peri_col[1bv1][BV32_ADD(BV32_MUL(v1$1, 16bv32), v0$1)] := v5$1;
    $$peri_col[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, 16bv32), v0$2)] := v5$2;
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 7} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    $i.0, $sum.0$1 := 0bv32, 0bv32;
    $sum.0$2 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$peri_col ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$peri_col ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$peri_col ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$peri_row ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$peri_row ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$peri_row ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 8} true;
    v6 := BV32_SLT($i.0, 16bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v6 && !v6;
    v9$1 := BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(v2$1, v1$1), $matrix_dim), v3$1), v0$1);
    v9$2 := BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(v2$2, v1$2), $matrix_dim), v3$2), v0$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$m(true, v9$1, $$m[v9$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$m(true, v9$2, $$m[v9$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$m"} true;
    v10$1 := $$m[v9$1];
    v10$2 := $$m[v9$2];
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$m(true, v9$1, FSUB32(v10$1, $sum.0$1), $$m[v9$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$m(true, v9$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$m(true, v9$2, FSUB32(v10$2, $sum.0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$m"} true;
    $$m[v9$1] := FSUB32(v10$1, $sum.0$1);
    $$m[v9$2] := FSUB32(v10$2, $sum.0$2);
    return;

  $truebb:
    assume {:partition} v6 && v6;
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$peri_col(true, BV32_ADD(BV32_MUL(v1$1, 16bv32), $i.0), $$peri_col[1bv1][BV32_ADD(BV32_MUL(v1$1, 16bv32), $i.0)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$peri_col(true, BV32_ADD(BV32_MUL(v1$2, 16bv32), $i.0), $$peri_col[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, 16bv32), $i.0)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$peri_col"} true;
    v7$1 := $$peri_col[1bv1][BV32_ADD(BV32_MUL(v1$1, 16bv32), $i.0)];
    v7$2 := $$peri_col[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v1$2, 16bv32), $i.0)];
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$peri_row(true, BV32_ADD(BV32_MUL($i.0, 16bv32), v0$1), $$peri_row[1bv1][BV32_ADD(BV32_MUL($i.0, 16bv32), v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$peri_row(true, BV32_ADD(BV32_MUL($i.0, 16bv32), v0$2), $$peri_row[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($i.0, 16bv32), v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$peri_row"} true;
    v8$1 := $$peri_row[1bv1][BV32_ADD(BV32_MUL($i.0, 16bv32), v0$1)];
    v8$2 := $$peri_row[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($i.0, 16bv32), v0$2)];
    $i.0, $sum.0$1 := BV32_ADD($i.0, 1bv32), FADD32($sum.0$1, FMUL32(v7$1, v8$1));
    $sum.0$2 := FADD32($sum.0$2, FMUL32(v7$2, v8$2));
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 63bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 63bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$peri_row, $$peri_col, $$m, _TRACKING;



const _WATCHED_VALUE_$$m: bv32;

procedure {:inline 1} _LOG_READ_$$m(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$m;



implementation {:inline 1} _LOG_READ_$$m(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$m := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m == _value then true else _READ_HAS_OCCURRED_$$m);
    return;
}



procedure _CHECK_READ_$$m(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "m"} {:array "$$m"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$m);
  requires {:source_name "m"} {:array "$$m"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$m: bool;

procedure {:inline 1} _LOG_WRITE_$$m(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$m, _WRITE_READ_BENIGN_FLAG_$$m;



implementation {:inline 1} _LOG_WRITE_$$m(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$m := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m == _value then true else _WRITE_HAS_OCCURRED_$$m);
    _WRITE_READ_BENIGN_FLAG_$$m := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$m);
    return;
}



procedure _CHECK_WRITE_$$m(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "m"} {:array "$$m"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m != _value);
  requires {:source_name "m"} {:array "$$m"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$m != _value);
  requires {:source_name "m"} {:array "$$m"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$m(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$m;



implementation {:inline 1} _LOG_ATOMIC_$$m(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$m := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$m);
    return;
}



procedure _CHECK_ATOMIC_$$m(_P: bool, _offset: bv32);
  requires {:source_name "m"} {:array "$$m"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset);
  requires {:source_name "m"} {:array "$$m"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$m(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$m;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$m(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$m := (if _P && _WRITE_HAS_OCCURRED_$$m && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$m);
    return;
}



const _WATCHED_VALUE_$$peri_row: bv32;

procedure {:inline 1} _LOG_READ_$$peri_row(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$peri_row;



implementation {:inline 1} _LOG_READ_$$peri_row(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$peri_row := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$peri_row == _value then true else _READ_HAS_OCCURRED_$$peri_row);
    return;
}



procedure _CHECK_READ_$$peri_row(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "peri_row"} {:array "$$peri_row"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$peri_row && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$peri_row && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "peri_row"} {:array "$$peri_row"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$peri_row && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$peri_row: bool;

procedure {:inline 1} _LOG_WRITE_$$peri_row(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$peri_row, _WRITE_READ_BENIGN_FLAG_$$peri_row;



implementation {:inline 1} _LOG_WRITE_$$peri_row(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$peri_row := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$peri_row == _value then true else _WRITE_HAS_OCCURRED_$$peri_row);
    _WRITE_READ_BENIGN_FLAG_$$peri_row := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$peri_row == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$peri_row);
    return;
}



procedure _CHECK_WRITE_$$peri_row(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "peri_row"} {:array "$$peri_row"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$peri_row && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$peri_row != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "peri_row"} {:array "$$peri_row"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$peri_row && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$peri_row != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "peri_row"} {:array "$$peri_row"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$peri_row && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$peri_row(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$peri_row;



implementation {:inline 1} _LOG_ATOMIC_$$peri_row(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$peri_row := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$peri_row);
    return;
}



procedure _CHECK_ATOMIC_$$peri_row(_P: bool, _offset: bv32);
  requires {:source_name "peri_row"} {:array "$$peri_row"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$peri_row && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "peri_row"} {:array "$$peri_row"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$peri_row && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$peri_row(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$peri_row;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$peri_row(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$peri_row := (if _P && _WRITE_HAS_OCCURRED_$$peri_row && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$peri_row);
    return;
}



const _WATCHED_VALUE_$$peri_col: bv32;

procedure {:inline 1} _LOG_READ_$$peri_col(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$peri_col;



implementation {:inline 1} _LOG_READ_$$peri_col(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$peri_col := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$peri_col == _value then true else _READ_HAS_OCCURRED_$$peri_col);
    return;
}



procedure _CHECK_READ_$$peri_col(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "peri_col"} {:array "$$peri_col"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$peri_col && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$peri_col && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "peri_col"} {:array "$$peri_col"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$peri_col && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$peri_col: bool;

procedure {:inline 1} _LOG_WRITE_$$peri_col(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$peri_col, _WRITE_READ_BENIGN_FLAG_$$peri_col;



implementation {:inline 1} _LOG_WRITE_$$peri_col(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$peri_col := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$peri_col == _value then true else _WRITE_HAS_OCCURRED_$$peri_col);
    _WRITE_READ_BENIGN_FLAG_$$peri_col := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$peri_col == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$peri_col);
    return;
}



procedure _CHECK_WRITE_$$peri_col(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "peri_col"} {:array "$$peri_col"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$peri_col && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$peri_col != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "peri_col"} {:array "$$peri_col"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$peri_col && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$peri_col != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "peri_col"} {:array "$$peri_col"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$peri_col && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$peri_col(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$peri_col;



implementation {:inline 1} _LOG_ATOMIC_$$peri_col(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$peri_col := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$peri_col);
    return;
}



procedure _CHECK_ATOMIC_$$peri_col(_P: bool, _offset: bv32);
  requires {:source_name "peri_col"} {:array "$$peri_col"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$peri_col && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "peri_col"} {:array "$$peri_col"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$peri_col && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$peri_col(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$peri_col;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$peri_col(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$peri_col := (if _P && _WRITE_HAS_OCCURRED_$$peri_col && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$peri_col);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$peri_row;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$peri_row;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$peri_row;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$peri_col;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$peri_col;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$peri_col;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$m;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$m;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$m;
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
    havoc $$m;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$peri_row;
    goto anon4;

  anon4:
    havoc $$peri_col;
    goto anon5;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
