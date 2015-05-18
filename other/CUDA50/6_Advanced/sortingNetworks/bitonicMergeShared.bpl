type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_DstKey"} {:global} $$d_DstKey: [bv32]bv32;

axiom {:array_info "$$d_DstKey"} {:global} {:elem_width 32} {:source_name "d_DstKey"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_DstKey: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_DstKey: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_DstKey: bool;

var {:source_name "d_DstVal"} {:global} $$d_DstVal: [bv32]bv32;

axiom {:array_info "$$d_DstVal"} {:global} {:elem_width 32} {:source_name "d_DstVal"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_DstVal: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_DstVal: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_DstVal: bool;

axiom {:array_info "$$d_SrcKey"} {:global} {:elem_width 32} {:source_name "d_SrcKey"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_SrcKey: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_SrcKey: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_SrcKey: bool;

axiom {:array_info "$$d_SrcVal"} {:global} {:elem_width 32} {:source_name "d_SrcVal"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_SrcVal: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_SrcVal: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_SrcVal: bool;

var {:source_name "s_key"} {:group_shared} $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} {:group_shared} {:elem_width 32} {:source_name "s_key"} {:source_elem_width 32} {:source_dimensions "1024"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key: bool;

var {:source_name "s_val"} {:group_shared} $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} {:group_shared} {:elem_width 32} {:source_name "s_val"} {:source_elem_width 32} {:source_dimensions "1024"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val: bool;

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

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvxor"} BV32_XOR(bv32, bv32) : bv32;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

procedure {:source_name "bitonicMergeShared"} {:kernel} $_Z18bitonicMergeSharedPjS_S_S_jjj($arrayLength: bv32, $size: bv32, $dir: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $arrayLength == 2048bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $size == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$d_DstKey && !_WRITE_HAS_OCCURRED_$$d_DstKey && !_ATOMIC_HAS_OCCURRED_$$d_DstKey;
  requires !_READ_HAS_OCCURRED_$$d_DstVal && !_WRITE_HAS_OCCURRED_$$d_DstVal && !_ATOMIC_HAS_OCCURRED_$$d_DstVal;
  requires !_READ_HAS_OCCURRED_$$d_SrcKey && !_WRITE_HAS_OCCURRED_$$d_SrcKey && !_ATOMIC_HAS_OCCURRED_$$d_SrcKey;
  requires !_READ_HAS_OCCURRED_$$d_SrcVal && !_WRITE_HAS_OCCURRED_$$d_SrcVal && !_ATOMIC_HAS_OCCURRED_$$d_SrcVal;
  requires !_READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key && !_WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key && !_ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key;
  requires !_READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val && !_WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val && !_ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val;
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
  modifies $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val, _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key, _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key, _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key, _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val, _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val, _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val, $$d_DstKey, $$d_DstVal, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key, _WRITE_HAS_OCCURRED_$$d_DstKey, _WRITE_READ_BENIGN_FLAG_$$d_DstKey, _WRITE_READ_BENIGN_FLAG_$$d_DstKey, _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val, _WRITE_HAS_OCCURRED_$$d_DstVal, _WRITE_READ_BENIGN_FLAG_$$d_DstVal, _WRITE_READ_BENIGN_FLAG_$$d_DstVal, _TRACKING;



implementation {:source_name "bitonicMergeShared"} {:kernel} $_Z18bitonicMergeSharedPjS_S_S_jjj($arrayLength: bv32, $size: bv32, $dir: bv32)
{
  var $stride.0: bv32;
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
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
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
  var v14$1: bool;
  var v14$2: bool;
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
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, 1024bv32), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, 1024bv32), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_id_x$1, 1024bv32), local_id_x$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_x$2, 1024bv32), local_id_x$2);
    v2$1 := BV32_ADD(BV32_MUL(group_id_x$1, 1024bv32), local_id_x$1);
    v2$2 := BV32_ADD(BV32_MUL(group_id_x$2, 1024bv32), local_id_x$2);
    v3$1 := BV32_ADD(BV32_MUL(group_id_x$1, 1024bv32), local_id_x$1);
    v3$2 := BV32_ADD(BV32_MUL(group_id_x$2, 1024bv32), local_id_x$2);
    havoc v4$1, v4$2;
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(true, local_id_x$1, v4$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(true, local_id_x$2, v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} true;
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][local_id_x$1] := v4$1;
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := v4$2;
    havoc v5$1, v5$2;
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(true, local_id_x$1, v5$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(true, local_id_x$2, v5$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} true;
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][local_id_x$1] := v5$1;
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := v5$2;
    havoc v6$1, v6$2;
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(true, BV32_ADD(local_id_x$1, 512bv32), v6$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][BV32_ADD(local_id_x$1, 512bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(true, BV32_ADD(local_id_x$2, 512bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(true, BV32_ADD(local_id_x$2, 512bv32), v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} true;
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][BV32_ADD(local_id_x$1, 512bv32)] := v6$1;
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 512bv32)] := v6$2;
    havoc v7$1, v7$2;
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(true, BV32_ADD(local_id_x$1, 512bv32), v7$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][BV32_ADD(local_id_x$1, 512bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(true, BV32_ADD(local_id_x$2, 512bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(true, BV32_ADD(local_id_x$2, 512bv32), v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} true;
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][BV32_ADD(local_id_x$1, 512bv32)] := v7$1;
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 512bv32)] := v7$2;
    $stride.0 := 512bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 11} true;
    v8 := BV32_UGT($stride.0, 0bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    goto __partitioned_block_$truebb_0, __partitioned_block_$falsebb_0;

  __partitioned_block_$falsebb_0:
    assume {:partition} !v8 && !v8;
    goto __partitioned_block_$falsebb_1;

  __partitioned_block_$falsebb_1:
    call {:sourceloc_num 28} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    call {:sourceloc} {:sourceloc_num 29} _LOG_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(true, local_id_x$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 29} _CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(true, local_id_x$2, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} true;
    v19$1 := $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][local_id_x$1];
    v19$2 := $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2];
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$d_DstKey(true, v2$1, v19$1, $$d_DstKey[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstKey(true, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$d_DstKey(true, v2$2, v19$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_DstKey"} true;
    $$d_DstKey[v2$1] := v19$1;
    $$d_DstKey[v2$2] := v19$2;
    call {:sourceloc} {:sourceloc_num 31} _LOG_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(true, local_id_x$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 31} _CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(true, local_id_x$2, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} true;
    v20$1 := $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][local_id_x$1];
    v20$2 := $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2];
    call {:sourceloc} {:sourceloc_num 32} _LOG_WRITE_$$d_DstVal(true, v3$1, v20$1, $$d_DstVal[v3$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstVal(true, v3$2);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 32} _CHECK_WRITE_$$d_DstVal(true, v3$2, v20$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_DstVal"} true;
    $$d_DstVal[v3$1] := v20$1;
    $$d_DstVal[v3$2] := v20$2;
    call {:sourceloc} {:sourceloc_num 33} _LOG_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(true, BV32_ADD(local_id_x$1, 512bv32), $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][BV32_ADD(local_id_x$1, 512bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 33} _CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(true, BV32_ADD(local_id_x$2, 512bv32), $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 512bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} true;
    v21$1 := $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][BV32_ADD(local_id_x$1, 512bv32)];
    v21$2 := $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 512bv32)];
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$d_DstKey(true, BV32_ADD(v2$1, 512bv32), v21$1, $$d_DstKey[BV32_ADD(v2$1, 512bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstKey(true, BV32_ADD(v2$2, 512bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$d_DstKey(true, BV32_ADD(v2$2, 512bv32), v21$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_DstKey"} true;
    $$d_DstKey[BV32_ADD(v2$1, 512bv32)] := v21$1;
    $$d_DstKey[BV32_ADD(v2$2, 512bv32)] := v21$2;
    call {:sourceloc} {:sourceloc_num 35} _LOG_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(true, BV32_ADD(local_id_x$1, 512bv32), $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][BV32_ADD(local_id_x$1, 512bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 35} _CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(true, BV32_ADD(local_id_x$2, 512bv32), $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 512bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} true;
    v22$1 := $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][BV32_ADD(local_id_x$1, 512bv32)];
    v22$2 := $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, 512bv32)];
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$d_DstVal(true, BV32_ADD(v3$1, 512bv32), v22$1, $$d_DstVal[BV32_ADD(v3$1, 512bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstVal(true, BV32_ADD(v3$2, 512bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$d_DstVal(true, BV32_ADD(v3$2, 512bv32), v22$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_DstVal"} true;
    $$d_DstVal[BV32_ADD(v3$1, 512bv32)] := v22$1;
    $$d_DstVal[BV32_ADD(v3$2, 512bv32)] := v22$2;
    return;

  __partitioned_block_$truebb_0:
    assume {:partition} v8 && v8;
    goto __partitioned_block_$truebb_1;

  __partitioned_block_$truebb_1:
    call {:sourceloc_num 13} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    v9$1 := BV32_SUB(BV32_MUL(2bv32, local_id_x$1), BV32_AND(local_id_x$1, BV32_SUB($stride.0, 1bv32)));
    v9$2 := BV32_SUB(BV32_MUL(2bv32, local_id_x$2), BV32_AND(local_id_x$2, BV32_SUB($stride.0, 1bv32)));
    v10$1 := BV32_ADD(v9$1, $stride.0);
    v10$2 := BV32_ADD(v9$2, $stride.0);
    v11$1 := BV32_ADD(v9$1, $stride.0);
    v11$2 := BV32_ADD(v9$2, $stride.0);
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(true, v9$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][v9$1]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(true, v9$2, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} true;
    v12$1 := $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][v9$1];
    v12$2 := $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2];
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(true, v10$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][v10$1]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(true, v10$2, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v10$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} true;
    v13$1 := $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][v10$1];
    v13$2 := $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v10$2];
    v14$1 := BV1_ZEXT32((if BV32_UGT(v12$1, v13$1) then 1bv1 else 0bv1)) == BV32_XOR($dir, BV1_ZEXT32((if BV32_AND(BV32_AND(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), BV32_SUB(BV32_UDIV($arrayLength, 2bv32), 1bv32)), BV32_UDIV($size, 2bv32)) != 0bv32 then 1bv1 else 0bv1)));
    v14$2 := BV1_ZEXT32((if BV32_UGT(v12$2, v13$2) then 1bv1 else 0bv1)) == BV32_XOR($dir, BV1_ZEXT32((if BV32_AND(BV32_AND(BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2), BV32_SUB(BV32_UDIV($arrayLength, 2bv32), 1bv32)), BV32_UDIV($size, 2bv32)) != 0bv32 then 1bv1 else 0bv1)));
    p1$1 := (if v14$1 then v14$1 else p1$1);
    p1$2 := (if v14$2 then v14$2 else p1$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(p1$1, v9$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][v9$1]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(p1$2, v9$2, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} true;
    v15$1 := (if p1$1 then $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][v9$1] else v15$1);
    v15$2 := (if p1$2 then $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2] else v15$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(p1$1, v10$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][v10$1]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 18} _CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(p1$2, v10$2, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v10$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} true;
    v16$1 := (if p1$1 then $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][v10$1] else v16$1);
    v16$2 := (if p1$2 then $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v10$2] else v16$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(p1$1, v9$1, v16$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][v9$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(p1$2, v9$2);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(p1$2, v9$2, v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} true;
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][v9$1] := (if p1$1 then v16$1 else $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][v9$1]);
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2] := (if p1$2 then v16$2 else $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2]);
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(p1$1, v10$1, v15$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][v10$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(p1$2, v10$2);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(p1$2, v10$2, v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} true;
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][v10$1] := (if p1$1 then v15$1 else $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[1bv1][v10$1]);
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v10$2] := (if p1$2 then v15$2 else $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v10$2]);
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(p1$1, v9$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][v9$1]);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(p1$2, v9$2, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} true;
    v17$1 := (if p1$1 then $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][v9$1] else v17$1);
    v17$2 := (if p1$2 then $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2] else v17$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(p1$1, v11$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][v11$1]);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(p1$2, v11$2, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v11$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} true;
    v18$1 := (if p1$1 then $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][v11$1] else v18$1);
    v18$2 := (if p1$2 then $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v11$2] else v18$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(p1$1, v9$1, v18$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][v9$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(p1$2, v9$2);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(p1$2, v9$2, v18$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} true;
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][v9$1] := (if p1$1 then v18$1 else $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][v9$1]);
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2] := (if p1$2 then v18$2 else $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v9$2]);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(p1$1, v11$1, v17$1, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][v11$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(p1$2, v11$2);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(p1$2, v11$2, v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} true;
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][v11$1] := (if p1$1 then v17$1 else $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[1bv1][v11$1]);
    $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v11$2] := (if p1$2 then v17$2 else $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v11$2]);
    $stride.0 := BV32_LSHR($stride.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 1024bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val, $$d_DstKey, $$d_DstVal, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key, $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val, $$d_DstKey, $$d_DstVal, _TRACKING;



const _WATCHED_VALUE_$$d_DstKey: bv32;

procedure {:inline 1} _LOG_READ_$$d_DstKey(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_DstKey;



implementation {:inline 1} _LOG_READ_$$d_DstKey(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_DstKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstKey == _value then true else _READ_HAS_OCCURRED_$$d_DstKey);
    return;
}



procedure _CHECK_READ_$$d_DstKey(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_DstKey"} {:array "$$d_DstKey"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_DstKey);
  requires {:source_name "d_DstKey"} {:array "$$d_DstKey"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_DstKey: bool;

procedure {:inline 1} _LOG_WRITE_$$d_DstKey(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_DstKey, _WRITE_READ_BENIGN_FLAG_$$d_DstKey;



implementation {:inline 1} _LOG_WRITE_$$d_DstKey(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_DstKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstKey == _value then true else _WRITE_HAS_OCCURRED_$$d_DstKey);
    _WRITE_READ_BENIGN_FLAG_$$d_DstKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstKey == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_DstKey);
    return;
}



procedure _CHECK_WRITE_$$d_DstKey(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_DstKey"} {:array "$$d_DstKey"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstKey != _value);
  requires {:source_name "d_DstKey"} {:array "$$d_DstKey"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstKey != _value);
  requires {:source_name "d_DstKey"} {:array "$$d_DstKey"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_DstKey(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_DstKey;



implementation {:inline 1} _LOG_ATOMIC_$$d_DstKey(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_DstKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_DstKey);
    return;
}



procedure _CHECK_ATOMIC_$$d_DstKey(_P: bool, _offset: bv32);
  requires {:source_name "d_DstKey"} {:array "$$d_DstKey"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_DstKey"} {:array "$$d_DstKey"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstKey(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_DstKey;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstKey(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_DstKey := (if _P && _WRITE_HAS_OCCURRED_$$d_DstKey && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_DstKey);
    return;
}



const _WATCHED_VALUE_$$d_DstVal: bv32;

procedure {:inline 1} _LOG_READ_$$d_DstVal(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_DstVal;



implementation {:inline 1} _LOG_READ_$$d_DstVal(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_DstVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstVal == _value then true else _READ_HAS_OCCURRED_$$d_DstVal);
    return;
}



procedure _CHECK_READ_$$d_DstVal(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_DstVal"} {:array "$$d_DstVal"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_DstVal);
  requires {:source_name "d_DstVal"} {:array "$$d_DstVal"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_DstVal: bool;

procedure {:inline 1} _LOG_WRITE_$$d_DstVal(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_DstVal, _WRITE_READ_BENIGN_FLAG_$$d_DstVal;



implementation {:inline 1} _LOG_WRITE_$$d_DstVal(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_DstVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstVal == _value then true else _WRITE_HAS_OCCURRED_$$d_DstVal);
    _WRITE_READ_BENIGN_FLAG_$$d_DstVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstVal == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_DstVal);
    return;
}



procedure _CHECK_WRITE_$$d_DstVal(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_DstVal"} {:array "$$d_DstVal"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstVal != _value);
  requires {:source_name "d_DstVal"} {:array "$$d_DstVal"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_DstVal != _value);
  requires {:source_name "d_DstVal"} {:array "$$d_DstVal"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_DstVal(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_DstVal;



implementation {:inline 1} _LOG_ATOMIC_$$d_DstVal(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_DstVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_DstVal);
    return;
}



procedure _CHECK_ATOMIC_$$d_DstVal(_P: bool, _offset: bv32);
  requires {:source_name "d_DstVal"} {:array "$$d_DstVal"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_DstVal"} {:array "$$d_DstVal"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstVal(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_DstVal;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_DstVal(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_DstVal := (if _P && _WRITE_HAS_OCCURRED_$$d_DstVal && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_DstVal);
    return;
}



const _WATCHED_VALUE_$$d_SrcKey: bv32;

procedure {:inline 1} _LOG_READ_$$d_SrcKey(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_SrcKey;



implementation {:inline 1} _LOG_READ_$$d_SrcKey(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_SrcKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcKey == _value then true else _READ_HAS_OCCURRED_$$d_SrcKey);
    return;
}



procedure _CHECK_READ_$$d_SrcKey(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_SrcKey"} {:array "$$d_SrcKey"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_SrcKey);
  requires {:source_name "d_SrcKey"} {:array "$$d_SrcKey"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_SrcKey: bool;

procedure {:inline 1} _LOG_WRITE_$$d_SrcKey(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_SrcKey, _WRITE_READ_BENIGN_FLAG_$$d_SrcKey;



implementation {:inline 1} _LOG_WRITE_$$d_SrcKey(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_SrcKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcKey == _value then true else _WRITE_HAS_OCCURRED_$$d_SrcKey);
    _WRITE_READ_BENIGN_FLAG_$$d_SrcKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcKey == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_SrcKey);
    return;
}



procedure _CHECK_WRITE_$$d_SrcKey(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_SrcKey"} {:array "$$d_SrcKey"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcKey != _value);
  requires {:source_name "d_SrcKey"} {:array "$$d_SrcKey"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcKey != _value);
  requires {:source_name "d_SrcKey"} {:array "$$d_SrcKey"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_SrcKey(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_SrcKey;



implementation {:inline 1} _LOG_ATOMIC_$$d_SrcKey(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_SrcKey := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_SrcKey);
    return;
}



procedure _CHECK_ATOMIC_$$d_SrcKey(_P: bool, _offset: bv32);
  requires {:source_name "d_SrcKey"} {:array "$$d_SrcKey"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_SrcKey"} {:array "$$d_SrcKey"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_SrcKey(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_SrcKey;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_SrcKey(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_SrcKey := (if _P && _WRITE_HAS_OCCURRED_$$d_SrcKey && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_SrcKey);
    return;
}



const _WATCHED_VALUE_$$d_SrcVal: bv32;

procedure {:inline 1} _LOG_READ_$$d_SrcVal(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_SrcVal;



implementation {:inline 1} _LOG_READ_$$d_SrcVal(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_SrcVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcVal == _value then true else _READ_HAS_OCCURRED_$$d_SrcVal);
    return;
}



procedure _CHECK_READ_$$d_SrcVal(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_SrcVal"} {:array "$$d_SrcVal"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_SrcVal);
  requires {:source_name "d_SrcVal"} {:array "$$d_SrcVal"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_SrcVal: bool;

procedure {:inline 1} _LOG_WRITE_$$d_SrcVal(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_SrcVal, _WRITE_READ_BENIGN_FLAG_$$d_SrcVal;



implementation {:inline 1} _LOG_WRITE_$$d_SrcVal(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_SrcVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcVal == _value then true else _WRITE_HAS_OCCURRED_$$d_SrcVal);
    _WRITE_READ_BENIGN_FLAG_$$d_SrcVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcVal == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_SrcVal);
    return;
}



procedure _CHECK_WRITE_$$d_SrcVal(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_SrcVal"} {:array "$$d_SrcVal"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcVal != _value);
  requires {:source_name "d_SrcVal"} {:array "$$d_SrcVal"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_SrcVal != _value);
  requires {:source_name "d_SrcVal"} {:array "$$d_SrcVal"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_SrcVal(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_SrcVal;



implementation {:inline 1} _LOG_ATOMIC_$$d_SrcVal(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_SrcVal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_SrcVal);
    return;
}



procedure _CHECK_ATOMIC_$$d_SrcVal(_P: bool, _offset: bv32);
  requires {:source_name "d_SrcVal"} {:array "$$d_SrcVal"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_SrcVal"} {:array "$$d_SrcVal"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_SrcVal(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_SrcVal;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_SrcVal(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_SrcVal := (if _P && _WRITE_HAS_OCCURRED_$$d_SrcVal && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_SrcVal);
    return;
}



const _WATCHED_VALUE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key;



implementation {:inline 1} _LOG_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key == _value then true else _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key);
    return;
}



procedure _CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_key"} {:array "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_key"} {:array "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key, _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key;



implementation {:inline 1} _LOG_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key);
    return;
}



procedure _CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_key"} {:array "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_key"} {:array "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_key"} {:array "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(_P: bool, _offset: bv32);
  requires {:source_name "s_key"} {:array "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_key"} {:array "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key);
    return;
}



const _WATCHED_VALUE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val;



implementation {:inline 1} _LOG_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val == _value then true else _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val);
    return;
}



procedure _CHECK_READ_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_val"} {:array "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_val"} {:array "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val, _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val;



implementation {:inline 1} _LOG_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val);
    return;
}



procedure _CHECK_WRITE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_val"} {:array "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_val"} {:array "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_val"} {:array "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(_P: bool, _offset: bv32);
  requires {:source_name "s_val"} {:array "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_val"} {:array "$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_DstKey;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_DstKey;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_DstKey;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_DstVal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_DstVal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_DstVal;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_DstKey;
    goto anon9;

  anon9:
    havoc $$d_DstVal;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key;
    goto anon4;

  anon4:
    havoc $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val;
    goto anon2;

  anon2:
    goto anon12_Then, anon12_Else;

  anon12_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_DstKey;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_DstKey;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_DstKey;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_DstVal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_DstVal;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_DstVal;
    goto anon7;

  anon7:
    goto anon13_Then, anon13_Else;

  anon13_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon10;

  anon10:
    havoc _TRACKING;
    return;

  anon13_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$d_DstKey;
    goto anon9;

  anon9:
    havoc $$d_DstVal;
    goto anon10;

  anon12_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_key;
    goto anon4;

  anon4:
    havoc $$_ZZ18bitonicMergeSharedPjS_S_S_jjjE5s_val;
    goto anon5;

  anon11_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
