type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "g_odata"} {:global} $$g_odata: [bv32]bv32;

axiom {:array_info "$$g_odata"} {:global} {:elem_width 32} {:source_name "g_odata"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$g_odata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$g_odata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$g_odata: bool;

axiom {:array_info "$$g_idata"} {:global} {:elem_width 32} {:source_name "g_idata"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$g_idata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$g_idata: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$g_idata: bool;

var {:source_name "temp"} {:group_shared} $$_ZZ14scanBestKernelPfS_iE4temp: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ14scanBestKernelPfS_iE4temp"} {:group_shared} {:elem_width 32} {:source_name "temp"} {:source_elem_width 32} {:source_dimensions "64"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp: bool;

const _WATCHED_OFFSET: bv32;

const {:group_size_x} group_size_x: bv32;

const {:group_size_y} group_size_y: bv32;

const {:group_size_z} group_size_z: bv32;

const {:local_id_x} local_id_x$1: bv32;

const {:local_id_x} local_id_x$2: bv32;

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function FADD32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "scanBestKernel"} {:kernel} $_Z14scanBestKernelPfS_i($n: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $n == BV32_MUL(group_size_x, 2bv32) then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if BV32_AND($n, BV32_SUB($n, 1bv32)) == 0bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$g_odata && !_WRITE_HAS_OCCURRED_$$g_odata && !_ATOMIC_HAS_OCCURRED_$$g_odata;
  requires !_READ_HAS_OCCURRED_$$g_idata && !_WRITE_HAS_OCCURRED_$$g_idata && !_ATOMIC_HAS_OCCURRED_$$g_idata;
  requires !_READ_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp && !_WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp && !_ATOMIC_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;
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
  modifies $$_ZZ14scanBestKernelPfS_iE4temp, _WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp, _WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp, _WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp, $$g_odata, _TRACKING, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp, _WRITE_HAS_OCCURRED_$$g_odata, _WRITE_READ_BENIGN_FLAG_$$g_odata, _WRITE_READ_BENIGN_FLAG_$$g_odata, _TRACKING, _TRACKING;



implementation {:source_name "scanBestKernel"} {:kernel} $_Z14scanBestKernelPfS_i($n: bv32)
{
  var $offset.0: bv32;
  var $d.0: bv32;
  var $offset.1: bv32;
  var $d1.0: bv32;
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
  var v24$1: bv32;
  var v24$2: bv32;
  var v5: bool;
  var v6: bv32;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bool;
  var v13$2: bool;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15: bool;
  var v16: bv32;
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
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
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


  __partitioned_block_$0_0:
    v0$1 := BV32_ADD(local_id_x$1, BV32_ASHR($n, 1bv32));
    v0$2 := BV32_ADD(local_id_x$2, BV32_ASHR($n, 1bv32));
    v1$1 := BV32_ASHR(local_id_x$1, 4bv32);
    v1$2 := BV32_ASHR(local_id_x$2, 4bv32);
    v2$1 := BV32_ASHR(v0$1, 4bv32);
    v2$2 := BV32_ASHR(v0$2, 4bv32);
    havoc v3$1, v3$2;
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(true, BV32_ADD(local_id_x$1, v1$1), v3$1, $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][BV32_ADD(local_id_x$1, v1$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp(true, BV32_ADD(local_id_x$2, v1$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(true, BV32_ADD(local_id_x$2, v1$2), v3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp"} true;
    $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][BV32_ADD(local_id_x$1, v1$1)] := v3$1;
    $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, v1$2)] := v3$2;
    havoc v4$1, v4$2;
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(true, BV32_ADD(v0$1, v2$1), v4$1, $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][BV32_ADD(v0$1, v2$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp(true, BV32_ADD(v0$2, v2$2));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(true, BV32_ADD(v0$2, v2$2), v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp"} true;
    $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][BV32_ADD(v0$1, v2$1)] := v4$1;
    $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, v2$2)] := v4$2;
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 7} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $offset.0, $d.0 := 1bv32, BV32_ASHR($n, 1bv32);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 8} true;
    v5 := BV32_SGT($d.0, 0bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    goto __partitioned_block_$truebb_0, $falsebb;

  $falsebb:
    assume {:partition} !v5 && !v5;
    v13$1 := local_id_x$1 == 0bv32;
    v13$2 := local_id_x$2 == 0bv32;
    p2$1 := (if v13$1 then v13$1 else p2$1);
    p2$2 := (if v13$2 then v13$2 else p2$2);
    v14$1 := (if p2$1 then BV32_SUB($n, 1bv32) else v14$1);
    v14$2 := (if p2$2 then BV32_SUB($n, 1bv32) else v14$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(p2$1, BV32_ADD(v14$1, BV32_ASHR(v14$1, 4bv32)), 0bv32, $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][BV32_ADD(v14$1, BV32_ASHR(v14$1, 4bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp(p2$2, BV32_ADD(v14$2, BV32_ASHR(v14$2, 4bv32)));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(p2$2, BV32_ADD(v14$2, BV32_ASHR(v14$2, 4bv32)), 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp"} true;
    $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][BV32_ADD(v14$1, BV32_ASHR(v14$1, 4bv32))] := (if p2$1 then 0bv32 else $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][BV32_ADD(v14$1, BV32_ASHR(v14$1, 4bv32))]);
    $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v14$2, BV32_ASHR(v14$2, 4bv32))] := (if p2$2 then 0bv32 else $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v14$2, BV32_ASHR(v14$2, 4bv32))]);
    $offset.1, $d1.0 := $offset.0, 1bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 21} true;
    v15 := BV32_SLT($d1.0, $n);
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    goto __partitioned_block_$truebb2_0, __partitioned_block_$falsebb2_0;

  __partitioned_block_$falsebb2_0:
    assume {:partition} !v15 && !v15;
    goto __partitioned_block_$falsebb2_1;

  __partitioned_block_$falsebb2_1:
    call {:sourceloc_num 33} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$_ZZ14scanBestKernelPfS_iE4temp(true, BV32_ADD(local_id_x$1, v1$1), $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][BV32_ADD(local_id_x$1, v1$1)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp(true, BV32_ADD(local_id_x$2, v1$2), $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, v1$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp"} true;
    v25$1 := $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][BV32_ADD(local_id_x$1, v1$1)];
    v25$2 := $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, v1$2)];
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$g_odata(true, local_id_x$1, v25$1, $$g_odata[local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_odata(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$g_odata(true, local_id_x$2, v25$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_odata"} true;
    $$g_odata[local_id_x$1] := v25$1;
    $$g_odata[local_id_x$2] := v25$2;
    call {:sourceloc} {:sourceloc_num 36} _LOG_READ_$$_ZZ14scanBestKernelPfS_iE4temp(true, BV32_ADD(v0$1, v2$1), $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][BV32_ADD(v0$1, v2$1)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 36} _CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp(true, BV32_ADD(v0$2, v2$2), $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, v2$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp"} true;
    v26$1 := $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][BV32_ADD(v0$1, v2$1)];
    v26$2 := $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v0$2, v2$2)];
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$g_odata(true, v0$1, v26$1, $$g_odata[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_odata(true, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$g_odata(true, v0$2, v26$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_odata"} true;
    $$g_odata[v0$1] := v26$1;
    $$g_odata[v0$2] := v26$2;
    return;

  __partitioned_block_$truebb2_0:
    assume {:partition} v15 && v15;
    v16 := BV32_SDIV($offset.1, 2bv32);
    goto __partitioned_block_$truebb2_1;

  __partitioned_block_$truebb2_1:
    call {:sourceloc_num 23} $bugle_barrier_duplicated_2(1bv1, 1bv1);
    v17$1 := BV32_SLT(local_id_x$1, $d1.0);
    v17$2 := BV32_SLT(local_id_x$2, $d1.0);
    p5$1 := (if v17$1 then v17$1 else p5$1);
    p5$2 := (if v17$2 then v17$2 else p5$2);
    v18$1 := (if p5$1 then BV32_SUB(BV32_MUL(v16, BV32_ADD(BV32_MUL(2bv32, local_id_x$1), 1bv32)), 1bv32) else v18$1);
    v18$2 := (if p5$2 then BV32_SUB(BV32_MUL(v16, BV32_ADD(BV32_MUL(2bv32, local_id_x$2), 1bv32)), 1bv32) else v18$2);
    v19$1 := (if p5$1 then BV32_SUB(BV32_MUL(v16, BV32_ADD(BV32_MUL(2bv32, local_id_x$1), 2bv32)), 1bv32) else v19$1);
    v19$2 := (if p5$2 then BV32_SUB(BV32_MUL(v16, BV32_ADD(BV32_MUL(2bv32, local_id_x$2), 2bv32)), 1bv32) else v19$2);
    v20$1 := (if p5$1 then BV32_ADD(v18$1, BV32_ASHR(v18$1, 4bv32)) else v20$1);
    v20$2 := (if p5$2 then BV32_ADD(v18$2, BV32_ASHR(v18$2, 4bv32)) else v20$2);
    v21$1 := (if p5$1 then BV32_ADD(v19$1, BV32_ASHR(v19$1, 4bv32)) else v21$1);
    v21$2 := (if p5$2 then BV32_ADD(v19$2, BV32_ASHR(v19$2, 4bv32)) else v21$2);
    call {:sourceloc} {:sourceloc_num 25} _LOG_READ_$$_ZZ14scanBestKernelPfS_iE4temp(p5$1, v20$1, $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v20$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 25} _CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp(p5$2, v20$2, $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v20$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp"} true;
    v22$1 := (if p5$1 then $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v20$1] else v22$1);
    v22$2 := (if p5$2 then $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v20$2] else v22$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_READ_$$_ZZ14scanBestKernelPfS_iE4temp(p5$1, v21$1, $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v21$1]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 26} _CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp(p5$2, v21$2, $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v21$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp"} true;
    v23$1 := (if p5$1 then $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v21$1] else v23$1);
    v23$2 := (if p5$2 then $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v21$2] else v23$2);
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(p5$1, v20$1, v23$1, $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v20$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp(p5$2, v20$2);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(p5$2, v20$2, v23$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp"} true;
    $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v20$1] := (if p5$1 then v23$1 else $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v20$1]);
    $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v20$2] := (if p5$2 then v23$2 else $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v20$2]);
    call {:sourceloc} {:sourceloc_num 28} _LOG_READ_$$_ZZ14scanBestKernelPfS_iE4temp(p5$1, v21$1, $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v21$1]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 28} _CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp(p5$2, v21$2, $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v21$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp"} true;
    v24$1 := (if p5$1 then $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v21$1] else v24$1);
    v24$2 := (if p5$2 then $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v21$2] else v24$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(p5$1, v21$1, FADD32(v24$1, v22$1), $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v21$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp(p5$2, v21$2);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(p5$2, v21$2, FADD32(v24$2, v22$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp"} true;
    $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v21$1] := (if p5$1 then FADD32(v24$1, v22$1) else $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v21$1]);
    $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v21$2] := (if p5$2 then FADD32(v24$2, v22$2) else $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v21$2]);
    $offset.1, $d1.0 := v16, BV32_MUL($d1.0, 2bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $9;

  __partitioned_block_$truebb_0:
    assume {:partition} v5 && v5;
    goto __partitioned_block_$truebb_1;

  __partitioned_block_$truebb_1:
    call {:sourceloc_num 10} $bugle_barrier_duplicated_3(1bv1, 1bv1);
    v6 := BV32_MUL($offset.0, 2bv32);
    v7$1 := BV32_SLT(local_id_x$1, $d.0);
    v7$2 := BV32_SLT(local_id_x$2, $d.0);
    p1$1 := (if v7$1 then v7$1 else p1$1);
    p1$2 := (if v7$2 then v7$2 else p1$2);
    v8$1 := (if p1$1 then BV32_SUB(BV32_MUL(BV32_SDIV(v6, 2bv32), BV32_ADD(BV32_MUL(2bv32, local_id_x$1), 1bv32)), 1bv32) else v8$1);
    v8$2 := (if p1$2 then BV32_SUB(BV32_MUL(BV32_SDIV(v6, 2bv32), BV32_ADD(BV32_MUL(2bv32, local_id_x$2), 1bv32)), 1bv32) else v8$2);
    v9$1 := (if p1$1 then BV32_SUB(BV32_MUL(BV32_SDIV(v6, 2bv32), BV32_ADD(BV32_MUL(2bv32, local_id_x$1), 2bv32)), 1bv32) else v9$1);
    v9$2 := (if p1$2 then BV32_SUB(BV32_MUL(BV32_SDIV(v6, 2bv32), BV32_ADD(BV32_MUL(2bv32, local_id_x$2), 2bv32)), 1bv32) else v9$2);
    v10$1 := (if p1$1 then BV32_ADD(v9$1, BV32_ASHR(v9$1, 4bv32)) else v10$1);
    v10$2 := (if p1$2 then BV32_ADD(v9$2, BV32_ASHR(v9$2, 4bv32)) else v10$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$_ZZ14scanBestKernelPfS_iE4temp(p1$1, BV32_ADD(v8$1, BV32_ASHR(v8$1, 4bv32)), $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][BV32_ADD(v8$1, BV32_ASHR(v8$1, 4bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp(p1$2, BV32_ADD(v8$2, BV32_ASHR(v8$2, 4bv32)), $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v8$2, BV32_ASHR(v8$2, 4bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp"} true;
    v11$1 := (if p1$1 then $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][BV32_ADD(v8$1, BV32_ASHR(v8$1, 4bv32))] else v11$1);
    v11$2 := (if p1$2 then $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v8$2, BV32_ASHR(v8$2, 4bv32))] else v11$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$_ZZ14scanBestKernelPfS_iE4temp(p1$1, v10$1, $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v10$1]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp(p1$2, v10$2, $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v10$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp"} true;
    v12$1 := (if p1$1 then $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v10$1] else v12$1);
    v12$2 := (if p1$2 then $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v10$2] else v12$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(p1$1, v10$1, FADD32(v12$1, v11$1), $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v10$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp(p1$2, v10$2);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(p1$2, v10$2, FADD32(v12$2, v11$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp"} true;
    $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v10$1] := (if p1$1 then FADD32(v12$1, v11$1) else $$_ZZ14scanBestKernelPfS_iE4temp[1bv1][v10$1]);
    $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v10$2] := (if p1$2 then FADD32(v12$2, v11$2) else $$_ZZ14scanBestKernelPfS_iE4temp[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v10$2]);
    $offset.0, $d.0 := v6, BV32_ASHR($d.0, 1bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $1;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_x} group_id_x$1: bv32;

const {:group_id_x} group_id_x$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ14scanBestKernelPfS_iE4temp, $$g_odata, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ14scanBestKernelPfS_iE4temp, $$g_odata, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ14scanBestKernelPfS_iE4temp, $$g_odata, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_3($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ14scanBestKernelPfS_iE4temp, $$g_odata, _TRACKING;



const _WATCHED_VALUE_$$g_odata: bv32;

procedure {:inline 1} _LOG_READ_$$g_odata(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$g_odata;



implementation {:inline 1} _LOG_READ_$$g_odata(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$g_odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_odata == _value then true else _READ_HAS_OCCURRED_$$g_odata);
    return;
}



procedure _CHECK_READ_$$g_odata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_odata"} {:array "$$g_odata"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$g_odata);
  requires {:source_name "g_odata"} {:array "$$g_odata"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$g_odata: bool;

procedure {:inline 1} _LOG_WRITE_$$g_odata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$g_odata, _WRITE_READ_BENIGN_FLAG_$$g_odata;



implementation {:inline 1} _LOG_WRITE_$$g_odata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$g_odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_odata == _value then true else _WRITE_HAS_OCCURRED_$$g_odata);
    _WRITE_READ_BENIGN_FLAG_$$g_odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_odata == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$g_odata);
    return;
}



procedure _CHECK_WRITE_$$g_odata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_odata"} {:array "$$g_odata"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_odata != _value);
  requires {:source_name "g_odata"} {:array "$$g_odata"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_odata != _value);
  requires {:source_name "g_odata"} {:array "$$g_odata"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$g_odata(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$g_odata;



implementation {:inline 1} _LOG_ATOMIC_$$g_odata(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$g_odata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$g_odata);
    return;
}



procedure _CHECK_ATOMIC_$$g_odata(_P: bool, _offset: bv32);
  requires {:source_name "g_odata"} {:array "$$g_odata"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset);
  requires {:source_name "g_odata"} {:array "$$g_odata"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_odata(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$g_odata;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_odata(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$g_odata := (if _P && _WRITE_HAS_OCCURRED_$$g_odata && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$g_odata);
    return;
}



const _WATCHED_VALUE_$$g_idata: bv32;

procedure {:inline 1} _LOG_READ_$$g_idata(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$g_idata;



implementation {:inline 1} _LOG_READ_$$g_idata(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$g_idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_idata == _value then true else _READ_HAS_OCCURRED_$$g_idata);
    return;
}



procedure _CHECK_READ_$$g_idata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_idata"} {:array "$$g_idata"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$g_idata && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$g_idata);
  requires {:source_name "g_idata"} {:array "$$g_idata"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$g_idata && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$g_idata: bool;

procedure {:inline 1} _LOG_WRITE_$$g_idata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$g_idata, _WRITE_READ_BENIGN_FLAG_$$g_idata;



implementation {:inline 1} _LOG_WRITE_$$g_idata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$g_idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_idata == _value then true else _WRITE_HAS_OCCURRED_$$g_idata);
    _WRITE_READ_BENIGN_FLAG_$$g_idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_idata == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$g_idata);
    return;
}



procedure _CHECK_WRITE_$$g_idata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_idata"} {:array "$$g_idata"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$g_idata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_idata != _value);
  requires {:source_name "g_idata"} {:array "$$g_idata"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$g_idata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_idata != _value);
  requires {:source_name "g_idata"} {:array "$$g_idata"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$g_idata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$g_idata(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$g_idata;



implementation {:inline 1} _LOG_ATOMIC_$$g_idata(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$g_idata := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$g_idata);
    return;
}



procedure _CHECK_ATOMIC_$$g_idata(_P: bool, _offset: bv32);
  requires {:source_name "g_idata"} {:array "$$g_idata"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$g_idata && _WATCHED_OFFSET == _offset);
  requires {:source_name "g_idata"} {:array "$$g_idata"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$g_idata && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_idata(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$g_idata;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_idata(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$g_idata := (if _P && _WRITE_HAS_OCCURRED_$$g_idata && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$g_idata);
    return;
}



const _WATCHED_VALUE_$$_ZZ14scanBestKernelPfS_iE4temp: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ14scanBestKernelPfS_iE4temp(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;



implementation {:inline 1} _LOG_READ_$$_ZZ14scanBestKernelPfS_iE4temp(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ14scanBestKernelPfS_iE4temp == _value then true else _READ_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp);
    return;
}



procedure _CHECK_READ_$$_ZZ14scanBestKernelPfS_iE4temp(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "temp"} {:array "$$_ZZ14scanBestKernelPfS_iE4temp"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "temp"} {:array "$$_ZZ14scanBestKernelPfS_iE4temp"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp, _WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp;



implementation {:inline 1} _LOG_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ14scanBestKernelPfS_iE4temp == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ14scanBestKernelPfS_iE4temp == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp);
    return;
}



procedure _CHECK_WRITE_$$_ZZ14scanBestKernelPfS_iE4temp(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "temp"} {:array "$$_ZZ14scanBestKernelPfS_iE4temp"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ14scanBestKernelPfS_iE4temp != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "temp"} {:array "$$_ZZ14scanBestKernelPfS_iE4temp"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ14scanBestKernelPfS_iE4temp != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "temp"} {:array "$$_ZZ14scanBestKernelPfS_iE4temp"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ14scanBestKernelPfS_iE4temp(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ14scanBestKernelPfS_iE4temp(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ14scanBestKernelPfS_iE4temp(_P: bool, _offset: bv32);
  requires {:source_name "temp"} {:array "$$_ZZ14scanBestKernelPfS_iE4temp"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "temp"} {:array "$$_ZZ14scanBestKernelPfS_iE4temp"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ14scanBestKernelPfS_iE4temp);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$g_odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$g_odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$g_odata;
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
    havoc $$g_odata;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ14scanBestKernelPfS_iE4temp;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$g_odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$g_odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$g_odata;
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
    havoc $$g_odata;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ14scanBestKernelPfS_iE4temp;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$g_odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$g_odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$g_odata;
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
    havoc $$g_odata;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ14scanBestKernelPfS_iE4temp;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_3($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ14scanBestKernelPfS_iE4temp;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$g_odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$g_odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$g_odata;
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
    havoc $$g_odata;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ14scanBestKernelPfS_iE4temp;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
