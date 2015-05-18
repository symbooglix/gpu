type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "data"} {:global} $$data: [bv32]bv32;

axiom {:array_info "$$data"} {:global} {:elem_width 32} {:source_name "data"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data: bool;

var {:source_name "sh_data"} {:group_shared} $$_ZZ19bitonic_sort_kernelPfjjE7sh_data: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} {:group_shared} {:elem_width 32} {:source_name "sh_data"} {:source_elem_width 32} {:source_dimensions "512"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data: bool;

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

function FEQ32(bv32, bv32) : bool;

function FLT32(bv32, bv32) : bool;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV32_OR(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvxor"} BV32_XOR(bv32, bv32) : bv32;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

procedure {:source_name "bitonic_sort_kernel"} {:kernel} $_Z19bitonic_sort_kernelPfjj($ulevel: bv32, $ulevelmask: bv32);
  requires !_READ_HAS_OCCURRED_$$data && !_WRITE_HAS_OCCURRED_$$data && !_ATOMIC_HAS_OCCURRED_$$data;
  requires !_READ_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data && !_WRITE_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data && !_ATOMIC_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data;
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
  modifies $$_ZZ19bitonic_sort_kernelPfjjE7sh_data, _READ_HAS_OCCURRED_$$data, _WRITE_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data, _WRITE_READ_BENIGN_FLAG_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data, _WRITE_READ_BENIGN_FLAG_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data, _READ_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data, _WRITE_HAS_OCCURRED_$$data, _WRITE_READ_BENIGN_FLAG_$$data, _WRITE_READ_BENIGN_FLAG_$$data, $$data, _TRACKING, _TRACKING;



implementation {:source_name "bitonic_sort_kernel"} {:kernel} $_Z19bitonic_sort_kernelPfjj($ulevel: bv32, $ulevelmask: bv32)
{
  var $j.0: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bool;
  var v0$1: bv32;
  var v0$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    call {:sourceloc} {:sourceloc_num 1} _LOG_READ_$$data(true, v0$1, $$data[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 1} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 1} _CHECK_READ_$$data(true, v0$2, $$data[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$data"} true;
    v1$1 := $$data[v0$1];
    v1$2 := $$data[v0$2];
    call {:sourceloc} {:sourceloc_num 2} _LOG_WRITE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(true, local_id_x$1, v1$1, $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 2} _CHECK_WRITE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(true, local_id_x$2, v1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} true;
    $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[1bv1][local_id_x$1] := v1$1;
    $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := v1$2;
    $j.0 := BV32_LSHR($ulevel, 1bv32);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 3} true;
    v2 := BV32_UGT($j.0, 0bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    goto __partitioned_block_$truebb_0, $falsebb;

  $falsebb:
    assume {:partition} !v2 && !v2;
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(true, local_id_x$1, $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(true, local_id_x$2, $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} true;
    v8$1 := $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[1bv1][local_id_x$1];
    v8$2 := $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2];
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$data(true, v0$1, v8$1, $$data[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$data(true, v0$2, v8$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$data"} true;
    $$data[v0$1] := v8$1;
    $$data[v0$2] := v8$2;
    return;

  __partitioned_block_$truebb_0:
    assume {:partition} v2 && v2;
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(true, BV32_AND(local_id_x$1, BV32_XOR($j.0, 4294967295bv32)), $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[1bv1][BV32_AND(local_id_x$1, BV32_XOR($j.0, 4294967295bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(true, BV32_AND(local_id_x$2, BV32_XOR($j.0, 4294967295bv32)), $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(local_id_x$2, BV32_XOR($j.0, 4294967295bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} true;
    v3$1 := $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[1bv1][BV32_AND(local_id_x$1, BV32_XOR($j.0, 4294967295bv32))];
    v3$2 := $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_AND(local_id_x$2, BV32_XOR($j.0, 4294967295bv32))];
    call {:sourceloc} {:sourceloc_num 6} _LOG_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(true, BV32_OR(local_id_x$1, $j.0), $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[1bv1][BV32_OR(local_id_x$1, $j.0)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 6} _CHECK_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(true, BV32_OR(local_id_x$2, $j.0), $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_OR(local_id_x$2, $j.0)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} true;
    v4$1 := $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[1bv1][BV32_OR(local_id_x$1, $j.0)];
    v4$2 := $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_OR(local_id_x$2, $j.0)];
    v5$1 := BV1_ZEXT32((if FEQ32(v3$1, v4$1) || FLT32(v3$1, v4$1) then 1bv1 else 0bv1)) == BV1_ZEXT32((if BV32_AND($ulevelmask, v0$1) != 0bv32 then 1bv1 else 0bv1));
    v5$2 := BV1_ZEXT32((if FEQ32(v3$2, v4$2) || FLT32(v3$2, v4$2) then 1bv1 else 0bv1)) == BV1_ZEXT32((if BV32_AND($ulevelmask, v0$2) != 0bv32 then 1bv1 else 0bv1));
    p1$1 := (if v5$1 then v5$1 else p1$1);
    p1$2 := (if v5$2 then v5$2 else p1$2);
    p0$1 := (if !v5$1 then !v5$1 else p0$1);
    p0$2 := (if !v5$2 then !v5$2 else p0$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(p0$1, local_id_x$1, $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(p0$2, local_id_x$2, $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} true;
    v7$1 := (if p0$1 then $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[1bv1][local_id_x$1] else v7$1);
    v7$2 := (if p0$2 then $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v7$2);
    $0$1 := (if p0$1 then v7$1 else $0$1);
    $0$2 := (if p0$2 then v7$2 else $0$2);
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(p1$1, BV32_XOR(local_id_x$1, $j.0), $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[1bv1][BV32_XOR(local_id_x$1, $j.0)]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(p1$2, BV32_XOR(local_id_x$2, $j.0), $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_XOR(local_id_x$2, $j.0)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} true;
    v6$1 := (if p1$1 then $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[1bv1][BV32_XOR(local_id_x$1, $j.0)] else v6$1);
    v6$2 := (if p1$2 then $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_XOR(local_id_x$2, $j.0)] else v6$2);
    $0$1 := (if p1$1 then v6$1 else $0$1);
    $0$2 := (if p1$2 then v6$2 else $0$2);
    goto __partitioned_block_$truebb_1;

  __partitioned_block_$truebb_1:
    call {:sourceloc_num 12} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(true, local_id_x$1, $0$1, $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(true, local_id_x$2, $0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} true;
    $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[1bv1][local_id_x$1] := $0$1;
    $$_ZZ19bitonic_sort_kernelPfjjE7sh_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := $0$2;
    goto __partitioned_block_$truebb_2;

  __partitioned_block_$truebb_2:
    call {:sourceloc_num 14} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    $j.0 := BV32_LSHR($j.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$_ZZ19bitonic_sort_kernelPfjjE7sh_data, $$data, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ19bitonic_sort_kernelPfjjE7sh_data, $$data, _TRACKING;



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



const _WATCHED_VALUE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data;



implementation {:inline 1} _LOG_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data == _value then true else _READ_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data);
    return;
}



procedure _CHECK_READ_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sh_data"} {:array "$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sh_data"} {:array "$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data, _WRITE_READ_BENIGN_FLAG_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data;



implementation {:inline 1} _LOG_WRITE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data);
    return;
}



procedure _CHECK_WRITE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sh_data"} {:array "$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sh_data"} {:array "$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sh_data"} {:array "$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(_P: bool, _offset: bv32);
  requires {:source_name "sh_data"} {:array "$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sh_data"} {:array "$$_ZZ19bitonic_sort_kernelPfjjE7sh_data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data;
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
    havoc $$data;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ19bitonic_sort_kernelPfjjE7sh_data;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ19bitonic_sort_kernelPfjjE7sh_data;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$data;
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
    havoc $$data;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ19bitonic_sort_kernelPfjjE7sh_data;
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
