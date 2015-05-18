type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_Buf"} {:global} $$d_Buf: [bv32]bv32;

axiom {:array_info "$$d_Buf"} {:global} {:elem_width 32} {:source_name "d_Buf"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Buf: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Buf: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Buf: bool;

axiom {:array_info "$$d_Dst"} {:global} {:elem_width 32} {:source_name "d_Dst"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Dst: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Dst: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Dst: bool;

axiom {:array_info "$$d_Src"} {:global} {:elem_width 32} {:source_name "d_Src"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Src: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Src: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Src: bool;

var {:source_name "s_Data"} {:group_shared} $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data"} {:group_shared} {:elem_width 32} {:source_name "s_Data"} {:source_elem_width 32} {:source_dimensions "512"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data: bool;

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

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "scanExclusiveShared2"} {:kernel} $_Z20scanExclusiveShared2PjS_S_jj($N: bv32, $arrayLength: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $N == 6656bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if BV32_AND($arrayLength, BV32_SUB($arrayLength, 1bv32)) == 0bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$d_Buf && !_WRITE_HAS_OCCURRED_$$d_Buf && !_ATOMIC_HAS_OCCURRED_$$d_Buf;
  requires !_READ_HAS_OCCURRED_$$d_Dst && !_WRITE_HAS_OCCURRED_$$d_Dst && !_ATOMIC_HAS_OCCURRED_$$d_Dst;
  requires !_READ_HAS_OCCURRED_$$d_Src && !_WRITE_HAS_OCCURRED_$$d_Src && !_ATOMIC_HAS_OCCURRED_$$d_Src;
  requires !_READ_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data && !_WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data && !_ATOMIC_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data;
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
  modifies $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data, _WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data, _WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data, _WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data, _READ_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data, _WRITE_HAS_OCCURRED_$$d_Buf, _WRITE_READ_BENIGN_FLAG_$$d_Buf, _WRITE_READ_BENIGN_FLAG_$$d_Buf, $$d_Buf, _TRACKING, _TRACKING;



implementation {:source_name "scanExclusiveShared2"} {:kernel} $_Z20scanExclusiveShared2PjS_S_jj($N: bv32, $arrayLength: bv32)
{
  var $idata.0$1: bv32;
  var $idata.0$2: bv32;
  var $offset.i.i.0: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v0$1: bv32;
  var v0$2: bv32;
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
  var v10$1: bool;
  var v10$2: bool;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;
  var p3$1: bool;
  var p3$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_ULT(v0$1, $N);
    v1$2 := BV32_ULT(v0$2, $N);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    p1$1 := (if !v1$1 then !v1$1 else p1$1);
    p1$2 := (if !v1$2 then !v1$2 else p1$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p0$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p0$2 then _HAVOC_bv32$2 else v2$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p0$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p0$2 then _HAVOC_bv32$2 else v3$2);
    $idata.0$1 := (if p0$1 then BV32_ADD(v2$1, v3$1) else $idata.0$1);
    $idata.0$2 := (if p0$2 then BV32_ADD(v2$2, v3$2) else $idata.0$2);
    $idata.0$1 := (if p1$1 then 0bv32 else $idata.0$1);
    $idata.0$2 := (if p1$2 then 0bv32 else $idata.0$2);
    v4$1 := BV32_SUB(BV32_MUL(2bv32, local_id_x$1), BV32_AND(local_id_x$1, BV32_SUB($arrayLength, 1bv32)));
    v4$2 := BV32_SUB(BV32_MUL(2bv32, local_id_x$2), BV32_AND(local_id_x$2, BV32_SUB($arrayLength, 1bv32)));
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(true, v4$1, 0bv32, $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[1bv1][v4$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(true, v4$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(true, v4$2, 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data"} true;
    $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[1bv1][v4$1] := 0bv32;
    $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v4$2] := 0bv32;
    v5$1 := BV32_ADD(v4$1, $arrayLength);
    v5$2 := BV32_ADD(v4$2, $arrayLength);
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(true, v5$1, $idata.0$1, $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[1bv1][v5$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(true, v5$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(true, v5$2, $idata.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data"} true;
    $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[1bv1][v5$1] := $idata.0$1;
    $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2] := $idata.0$2;
    $offset.i.i.0 := 1bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b7 ==> _WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data ==> _WATCHED_OFFSET == BV32_ADD(BV32_SUB(BV32_MUL(2bv32, local_id_x$1), BV32_AND(local_id_x$1, BV32_SUB($arrayLength, 1bv32))), $arrayLength);
    assert {:tag "nowrite"} _b6 ==> !_WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data;
    assert {:tag "pow2NotZero"} _b5 ==> $offset.i.i.0 != 0bv32;
    assert {:tag "pow2"} _b4 ==> $offset.i.i.0 == 0bv32 || BV32_AND($offset.i.i.0, BV32_SUB($offset.i.i.0, 1bv32)) == 0bv32;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_UGE($offset.i.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_UGE($offset.i.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_ULE($offset.i.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_ULE($offset.i.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SGE($offset.i.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SGE($offset.i.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 1} _b0 ==> BV32_SLE($offset.i.i.0, 1bv32);
    assert {:tag "loopBound"} {:thread 2} _b0 ==> BV32_SLE($offset.i.i.0, 1bv32);
    assert {:block_sourceloc} {:sourceloc_num 9} true;
    v6 := BV32_ULT($offset.i.i.0, $arrayLength);
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    goto __partitioned_block_$truebb0_0, $falsebb0;

  $falsebb0:
    assume {:partition} !v6 && !v6;
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(true, v5$1, $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[1bv1][v5$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(true, v5$2, $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data"} true;
    v9$1 := $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[1bv1][v5$1];
    v9$2 := $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2];
    v10$1 := BV32_ULT(v0$1, $N);
    v10$2 := BV32_ULT(v0$2, $N);
    p2$1 := (if v10$1 then v10$1 else p2$1);
    p2$2 := (if v10$2 then v10$2 else p2$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$d_Buf(p2$1, v0$1, BV32_SUB(v9$1, $idata.0$1), $$d_Buf[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Buf(p2$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$d_Buf(p2$2, v0$2, BV32_SUB(v9$2, $idata.0$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Buf"} true;
    $$d_Buf[v0$1] := (if p2$1 then BV32_SUB(v9$1, $idata.0$1) else $$d_Buf[v0$1]);
    $$d_Buf[v0$2] := (if p2$2 then BV32_SUB(v9$2, $idata.0$2) else $$d_Buf[v0$2]);
    return;

  __partitioned_block_$truebb0_0:
    assume {:partition} v6 && v6;
    goto __partitioned_block_$truebb0_1;

  __partitioned_block_$truebb0_1:
    call {:sourceloc_num 11} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 12} true;
    v7$1 := $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[1bv1][v5$1];
    v7$2 := $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2];
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 13} true;
    v8$1 := $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[1bv1][BV32_SUB(v5$1, $offset.i.i.0)];
    v8$2 := $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_SUB(v5$2, $offset.i.i.0)];
    goto __partitioned_block_$truebb0_2;

  __partitioned_block_$truebb0_2:
    call {:sourceloc_num 14} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(true, v5$1, BV32_ADD(v7$1, v8$1), $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[1bv1][v5$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(true, v5$2);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(true, v5$2, BV32_ADD(v7$2, v8$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data"} true;
    $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[1bv1][v5$1] := BV32_ADD(v7$1, v8$1);
    $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2] := BV32_ADD(v7$2, v8$2);
    $offset.i.i.0 := BV32_SHL($offset.i.i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $3;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 26bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data, $$d_Buf, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data, $$d_Buf, _TRACKING;



function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

const _WATCHED_VALUE_$$d_Buf: bv32;

procedure {:inline 1} _LOG_READ_$$d_Buf(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Buf;



implementation {:inline 1} _LOG_READ_$$d_Buf(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Buf := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Buf == _value then true else _READ_HAS_OCCURRED_$$d_Buf);
    return;
}



procedure _CHECK_READ_$$d_Buf(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Buf"} {:array "$$d_Buf"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Buf && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Buf);
  requires {:source_name "d_Buf"} {:array "$$d_Buf"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Buf && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Buf: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Buf(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Buf, _WRITE_READ_BENIGN_FLAG_$$d_Buf;



implementation {:inline 1} _LOG_WRITE_$$d_Buf(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Buf := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Buf == _value then true else _WRITE_HAS_OCCURRED_$$d_Buf);
    _WRITE_READ_BENIGN_FLAG_$$d_Buf := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Buf == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Buf);
    return;
}



procedure _CHECK_WRITE_$$d_Buf(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Buf"} {:array "$$d_Buf"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Buf && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Buf != _value);
  requires {:source_name "d_Buf"} {:array "$$d_Buf"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Buf && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Buf != _value);
  requires {:source_name "d_Buf"} {:array "$$d_Buf"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Buf && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Buf(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Buf;



implementation {:inline 1} _LOG_ATOMIC_$$d_Buf(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Buf := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Buf);
    return;
}



procedure _CHECK_ATOMIC_$$d_Buf(_P: bool, _offset: bv32);
  requires {:source_name "d_Buf"} {:array "$$d_Buf"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Buf && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Buf"} {:array "$$d_Buf"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Buf && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Buf(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Buf;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Buf(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Buf := (if _P && _WRITE_HAS_OCCURRED_$$d_Buf && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Buf);
    return;
}



const _WATCHED_VALUE_$$d_Dst: bv32;

procedure {:inline 1} _LOG_READ_$$d_Dst(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Dst;



implementation {:inline 1} _LOG_READ_$$d_Dst(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Dst == _value then true else _READ_HAS_OCCURRED_$$d_Dst);
    return;
}



procedure _CHECK_READ_$$d_Dst(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Dst"} {:array "$$d_Dst"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Dst);
  requires {:source_name "d_Dst"} {:array "$$d_Dst"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Dst: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Dst(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Dst, _WRITE_READ_BENIGN_FLAG_$$d_Dst;



implementation {:inline 1} _LOG_WRITE_$$d_Dst(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Dst == _value then true else _WRITE_HAS_OCCURRED_$$d_Dst);
    _WRITE_READ_BENIGN_FLAG_$$d_Dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Dst == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Dst);
    return;
}



procedure _CHECK_WRITE_$$d_Dst(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Dst"} {:array "$$d_Dst"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Dst != _value);
  requires {:source_name "d_Dst"} {:array "$$d_Dst"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Dst != _value);
  requires {:source_name "d_Dst"} {:array "$$d_Dst"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Dst(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Dst;



implementation {:inline 1} _LOG_ATOMIC_$$d_Dst(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Dst);
    return;
}



procedure _CHECK_ATOMIC_$$d_Dst(_P: bool, _offset: bv32);
  requires {:source_name "d_Dst"} {:array "$$d_Dst"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Dst"} {:array "$$d_Dst"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Dst(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Dst;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Dst(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Dst := (if _P && _WRITE_HAS_OCCURRED_$$d_Dst && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Dst);
    return;
}



const _WATCHED_VALUE_$$d_Src: bv32;

procedure {:inline 1} _LOG_READ_$$d_Src(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Src;



implementation {:inline 1} _LOG_READ_$$d_Src(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Src := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Src == _value then true else _READ_HAS_OCCURRED_$$d_Src);
    return;
}



procedure _CHECK_READ_$$d_Src(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Src"} {:array "$$d_Src"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Src);
  requires {:source_name "d_Src"} {:array "$$d_Src"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Src: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Src(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Src, _WRITE_READ_BENIGN_FLAG_$$d_Src;



implementation {:inline 1} _LOG_WRITE_$$d_Src(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Src := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Src == _value then true else _WRITE_HAS_OCCURRED_$$d_Src);
    _WRITE_READ_BENIGN_FLAG_$$d_Src := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Src == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Src);
    return;
}



procedure _CHECK_WRITE_$$d_Src(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Src"} {:array "$$d_Src"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Src != _value);
  requires {:source_name "d_Src"} {:array "$$d_Src"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Src != _value);
  requires {:source_name "d_Src"} {:array "$$d_Src"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Src(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Src;



implementation {:inline 1} _LOG_ATOMIC_$$d_Src(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Src := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Src);
    return;
}



procedure _CHECK_ATOMIC_$$d_Src(_P: bool, _offset: bv32);
  requires {:source_name "d_Src"} {:array "$$d_Src"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Src"} {:array "$$d_Src"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Src(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Src;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Src(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Src := (if _P && _WRITE_HAS_OCCURRED_$$d_Src && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Src);
    return;
}



const _WATCHED_VALUE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data;



implementation {:inline 1} _LOG_READ_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data == _value then true else _READ_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data);
    return;
}



procedure _CHECK_READ_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_Data"} {:array "$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Data"} {:array "$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data, _WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data;



implementation {:inline 1} _LOG_WRITE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data);
    return;
}



procedure _CHECK_WRITE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_Data"} {:array "$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Data"} {:array "$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Data"} {:array "$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(_P: bool, _offset: bv32);
  requires {:source_name "s_Data"} {:array "$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_Data"} {:array "$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_Buf;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_Buf;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_Buf;
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
    havoc $$d_Buf;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_Buf;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_Buf;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_Buf;
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
    havoc $$d_Buf;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

const {:existential true} _b4: bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;
