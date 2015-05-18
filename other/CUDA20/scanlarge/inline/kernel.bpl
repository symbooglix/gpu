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

var {:source_name "g_blockSums"} {:global} $$g_blockSums: [bv32]bv32;

axiom {:array_info "$$g_blockSums"} {:global} {:elem_width 32} {:source_name "g_blockSums"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$g_blockSums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$g_blockSums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$g_blockSums: bool;

var {:source_name "s_data"} {:group_shared} $$_ZZ1kPfPKfS_iiiiiE6s_data: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ1kPfPKfS_iiiiiE6s_data"} {:group_shared} {:elem_width 32} {:source_name "s_data"} {:source_elem_width 32} {:source_dimensions "64"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

procedure {:source_name "k"} {:kernel} $_Z1kPfPKfS_iiiii($n: bv32, $blockIndex: bv32, $baseIndex: bv32, $storeSum: bv32, $isNP2: bv32);
  requires !_READ_HAS_OCCURRED_$$g_odata && !_WRITE_HAS_OCCURRED_$$g_odata && !_ATOMIC_HAS_OCCURRED_$$g_odata;
  requires !_READ_HAS_OCCURRED_$$g_idata && !_WRITE_HAS_OCCURRED_$$g_idata && !_ATOMIC_HAS_OCCURRED_$$g_idata;
  requires !_READ_HAS_OCCURRED_$$g_blockSums && !_WRITE_HAS_OCCURRED_$$g_blockSums && !_ATOMIC_HAS_OCCURRED_$$g_blockSums;
  requires !_READ_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data && !_WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data && !_ATOMIC_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data;
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
  modifies $$_ZZ1kPfPKfS_iiiiiE6s_data, _WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data, _WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data, _WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data, _READ_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data, _WRITE_HAS_OCCURRED_$$g_blockSums, _WRITE_READ_BENIGN_FLAG_$$g_blockSums, _WRITE_READ_BENIGN_FLAG_$$g_blockSums, $$g_odata, $$g_blockSums, _TRACKING, _WRITE_HAS_OCCURRED_$$g_odata, _WRITE_READ_BENIGN_FLAG_$$g_odata, _WRITE_READ_BENIGN_FLAG_$$g_odata, _TRACKING, _TRACKING;



implementation {:source_name "k"} {:kernel} $_Z1kPfPKfS_iiiii($n: bv32, $blockIndex: bv32, $baseIndex: bv32, $storeSum: bv32, $isNP2: bv32)
{
  var $0$1: bv32;
  var $0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $stride.0: bv32;
  var $d.0: bv32;
  var $2$1: bv32;
  var $2$2: bv32;
  var $stride.1: bv32;
  var $d1.0: bv32;
  var v0: bool;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7: bool;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11: bool;
  var v12: bv32;
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
  var v19: bool;
  var v20$1: bool;
  var v20$2: bool;
  var v21$1: bv32;
  var v21$2: bv32;
  var v23$1: bool;
  var v23$2: bool;
  var v22$1: bv32;
  var v22$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25: bool;
  var v26: bv32;
  var v27$1: bool;
  var v27$2: bool;
  var v29$1: bv32;
  var v29$2: bv32;
  var v28$1: bv32;
  var v28$2: bv32;
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
  var v36: bool;
  var v37$1: bool;
  var v37$2: bool;
  var v38$1: bv32;
  var v38$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0 := $baseIndex == 0bv32;
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v0 && !v0;
    $0$1 := $baseIndex;
    $0$2 := $baseIndex;
    goto $3;

  $3:
    v1$1 := BV32_ADD($0$1, local_id_x$1);
    v1$2 := BV32_ADD($0$2, local_id_x$2);
    v2$1 := BV32_ADD(v1$1, group_size_x);
    v2$2 := BV32_ADD(v1$2, group_size_x);
    v3$1 := BV32_ADD(local_id_x$1, group_size_x);
    v3$2 := BV32_ADD(local_id_x$2, group_size_x);
    v4$1 := BV32_ASHR(local_id_x$1, 4bv32);
    v4$2 := BV32_ASHR(local_id_x$2, 4bv32);
    v5$1 := BV32_ASHR(v3$1, 4bv32);
    v5$2 := BV32_ASHR(v3$2, 4bv32);
    havoc v6$1, v6$2;
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(true, BV32_ADD(local_id_x$1, v4$1), v6$1, $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][BV32_ADD(local_id_x$1, v4$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data(true, BV32_ADD(local_id_x$2, v4$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(true, BV32_ADD(local_id_x$2, v4$2), v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][BV32_ADD(local_id_x$1, v4$1)] := v6$1;
    $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, v4$2)] := v6$2;
    v7 := $isNP2 != 0bv32;
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v7 && !v7;
    havoc v10$1, v10$2;
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(true, BV32_ADD(v3$1, v5$1), v10$1, $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][BV32_ADD(v3$1, v5$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data(true, BV32_ADD(v3$2, v5$2));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(true, BV32_ADD(v3$2, v5$2), v10$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][BV32_ADD(v3$1, v5$1)] := v10$1;
    $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v3$2, v5$2)] := v10$2;
    goto $9;

  $9:
    $stride.0, $d.0 := 1bv32, group_size_x;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $10;

  $10:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 16} true;
    v11 := BV32_SGT($d.0, 0bv32);
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
    goto __partitioned_block_$truebb2_0, $falsebb2;

  $falsebb2:
    assume {:partition} !v11 && !v11;
    v19 := $blockIndex == 0bv32;
    goto $truebb4, $falsebb4;

  $falsebb4:
    assume {:partition} !v19 && !v19;
    $2$1 := $blockIndex;
    $2$2 := $blockIndex;
    goto $18;

  $18:
    v20$1 := local_id_x$1 == 0bv32;
    v20$2 := local_id_x$2 == 0bv32;
    p4$1 := (if v20$1 then v20$1 else p4$1);
    p4$2 := (if v20$2 then v20$2 else p4$2);
    v21$1 := (if p4$1 then BV32_SUB(BV32_SHL(group_size_x, 1bv32), 1bv32) else v21$1);
    v21$2 := (if p4$2 then BV32_SUB(BV32_SHL(group_size_x, 1bv32), 1bv32) else v21$2);
    v22$1 := (if p4$1 then BV32_ADD(v21$1, BV32_ASHR(v21$1, 4bv32)) else v22$1);
    v22$2 := (if p4$2 then BV32_ADD(v21$2, BV32_ASHR(v21$2, 4bv32)) else v22$2);
    v23$1 := (if p4$1 then $storeSum != 0bv32 else v23$1);
    v23$2 := (if p4$2 then $storeSum != 0bv32 else v23$2);
    p5$1 := (if p4$1 && v23$1 then v23$1 else p5$1);
    p5$2 := (if p4$2 && v23$2 then v23$2 else p5$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(p5$1, v22$1, $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v22$1]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 31} _CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(p5$2, v22$2, $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v22$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    v24$1 := (if p5$1 then $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v22$1] else v24$1);
    v24$2 := (if p5$2 then $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v22$2] else v24$2);
    call {:sourceloc} {:sourceloc_num 32} _LOG_WRITE_$$g_blockSums(p5$1, $2$1, v24$1, $$g_blockSums[$2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_blockSums(p5$2, $2$2);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 32} _CHECK_WRITE_$$g_blockSums(p5$2, $2$2, v24$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_blockSums"} true;
    $$g_blockSums[$2$1] := (if p5$1 then v24$1 else $$g_blockSums[$2$1]);
    $$g_blockSums[$2$2] := (if p5$2 then v24$2 else $$g_blockSums[$2$2]);
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(p4$1, v22$1, 0bv32, $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v22$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data(p4$2, v22$2);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(p4$2, v22$2, 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v22$1] := (if p4$1 then 0bv32 else $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v22$1]);
    $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v22$2] := (if p4$2 then 0bv32 else $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v22$2]);
    $stride.1, $d1.0 := $stride.0, 1bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $23;

  $23:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 36} true;
    v25 := BV32_ULE($d1.0, group_size_x);
    p8$1 := false;
    p8$2 := false;
    p9$1 := false;
    p9$2 := false;
    p10$1 := false;
    p10$2 := false;
    p11$1 := false;
    p11$2 := false;
    goto __partitioned_block_$truebb7_0, __partitioned_block_$falsebb7_0;

  __partitioned_block_$falsebb7_0:
    assume {:partition} !v25 && !v25;
    goto __partitioned_block_$falsebb7_1;

  __partitioned_block_$falsebb7_1:
    call {:sourceloc_num 48} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    call {:sourceloc} {:sourceloc_num 49} _LOG_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(true, BV32_ADD(local_id_x$1, v4$1), $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][BV32_ADD(local_id_x$1, v4$1)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 49} _CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(true, BV32_ADD(local_id_x$2, v4$2), $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, v4$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    v35$1 := $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][BV32_ADD(local_id_x$1, v4$1)];
    v35$2 := $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, v4$2)];
    call {:sourceloc} {:sourceloc_num 50} _LOG_WRITE_$$g_odata(true, v1$1, v35$1, $$g_odata[v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_odata(true, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 50} _CHECK_WRITE_$$g_odata(true, v1$2, v35$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_odata"} true;
    $$g_odata[v1$1] := v35$1;
    $$g_odata[v1$2] := v35$2;
    v36 := $isNP2 != 0bv32;
    goto $truebb9, $falsebb9;

  $falsebb9:
    assume {:partition} !v36 && !v36;
    call {:sourceloc} {:sourceloc_num 57} _LOG_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(true, BV32_ADD(v3$1, v5$1), $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][BV32_ADD(v3$1, v5$1)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 57} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 57} _CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(true, BV32_ADD(v3$2, v5$2), $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v3$2, v5$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    v39$1 := $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][BV32_ADD(v3$1, v5$1)];
    v39$2 := $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v3$2, v5$2)];
    call {:sourceloc} {:sourceloc_num 58} _LOG_WRITE_$$g_odata(true, v2$1, v39$1, $$g_odata[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_odata(true, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 58} _CHECK_WRITE_$$g_odata(true, v2$2, v39$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_odata"} true;
    $$g_odata[v2$1] := v39$1;
    $$g_odata[v2$2] := v39$2;
    goto $33;

  $33:
    return;

  $truebb9:
    assume {:partition} v36 && v36;
    v37$1 := BV32_SLT(v3$1, $n);
    v37$2 := BV32_SLT(v3$2, $n);
    p10$1 := (if v37$1 then v37$1 else p10$1);
    p10$2 := (if v37$2 then v37$2 else p10$2);
    call {:sourceloc} {:sourceloc_num 53} _LOG_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(p10$1, BV32_ADD(v3$1, v5$1), $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][BV32_ADD(v3$1, v5$1)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 53} _CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(p10$2, BV32_ADD(v3$2, v5$2), $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v3$2, v5$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    v38$1 := (if p10$1 then $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][BV32_ADD(v3$1, v5$1)] else v38$1);
    v38$2 := (if p10$2 then $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v3$2, v5$2)] else v38$2);
    call {:sourceloc} {:sourceloc_num 54} _LOG_WRITE_$$g_odata(p10$1, v2$1, v38$1, $$g_odata[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_odata(p10$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 54} _CHECK_WRITE_$$g_odata(p10$2, v2$2, v38$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$g_odata"} true;
    $$g_odata[v2$1] := (if p10$1 then v38$1 else $$g_odata[v2$1]);
    $$g_odata[v2$2] := (if p10$2 then v38$2 else $$g_odata[v2$2]);
    goto $33;

  __partitioned_block_$truebb7_0:
    assume {:partition} v25 && v25;
    v26 := BV32_LSHR($stride.1, 1bv32);
    goto __partitioned_block_$truebb7_1;

  __partitioned_block_$truebb7_1:
    call {:sourceloc_num 38} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    v27$1 := BV32_SLT(local_id_x$1, $d1.0);
    v27$2 := BV32_SLT(local_id_x$2, $d1.0);
    p9$1 := (if v27$1 then v27$1 else p9$1);
    p9$2 := (if v27$2 then v27$2 else p9$2);
    v28$1 := (if p9$1 then BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL(2bv32, v26), local_id_x$1), v26), 1bv32) else v28$1);
    v28$2 := (if p9$2 then BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL(2bv32, v26), local_id_x$2), v26), 1bv32) else v28$2);
    v29$1 := (if p9$1 then BV32_ADD(v28$1, v26) else v29$1);
    v29$2 := (if p9$2 then BV32_ADD(v28$2, v26) else v29$2);
    v30$1 := (if p9$1 then BV32_ADD(v28$1, BV32_ASHR(v28$1, 4bv32)) else v30$1);
    v30$2 := (if p9$2 then BV32_ADD(v28$2, BV32_ASHR(v28$2, 4bv32)) else v30$2);
    v31$1 := (if p9$1 then BV32_ADD(v29$1, BV32_ASHR(v29$1, 4bv32)) else v31$1);
    v31$2 := (if p9$2 then BV32_ADD(v29$2, BV32_ASHR(v29$2, 4bv32)) else v31$2);
    call {:sourceloc} {:sourceloc_num 40} _LOG_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(p9$1, v30$1, $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v30$1]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 40} _CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(p9$2, v30$2, $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v30$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    v32$1 := (if p9$1 then $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v30$1] else v32$1);
    v32$2 := (if p9$2 then $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v30$2] else v32$2);
    call {:sourceloc} {:sourceloc_num 41} _LOG_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(p9$1, v31$1, $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v31$1]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 41} _CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(p9$2, v31$2, $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v31$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    v33$1 := (if p9$1 then $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v31$1] else v33$1);
    v33$2 := (if p9$2 then $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v31$2] else v33$2);
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(p9$1, v30$1, v33$1, $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v30$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data(p9$2, v30$2);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(p9$2, v30$2, v33$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v30$1] := (if p9$1 then v33$1 else $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v30$1]);
    $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v30$2] := (if p9$2 then v33$2 else $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v30$2]);
    call {:sourceloc} {:sourceloc_num 43} _LOG_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(p9$1, v31$1, $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v31$1]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 43} _CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(p9$2, v31$2, $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v31$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    v34$1 := (if p9$1 then $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v31$1] else v34$1);
    v34$2 := (if p9$2 then $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v31$2] else v34$2);
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(p9$1, v31$1, FADD32(v34$1, v32$1), $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v31$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data(p9$2, v31$2);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(p9$2, v31$2, FADD32(v34$2, v32$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v31$1] := (if p9$1 then FADD32(v34$1, v32$1) else $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v31$1]);
    $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v31$2] := (if p9$2 then FADD32(v34$2, v32$2) else $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v31$2]);
    $stride.1, $d1.0 := v26, BV32_MUL($d1.0, 2bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $23;

  $truebb4:
    assume {:partition} v19 && v19;
    $2$1 := group_id_x$1;
    $2$2 := group_id_x$2;
    goto $18;

  __partitioned_block_$truebb2_0:
    assume {:partition} v11 && v11;
    goto __partitioned_block_$truebb2_1;

  __partitioned_block_$truebb2_1:
    call {:sourceloc_num 18} $bugle_barrier_duplicated_2(1bv1, 1bv1);
    v12 := BV32_MUL($stride.0, 2bv32);
    v13$1 := BV32_SLT(local_id_x$1, $d.0);
    v13$2 := BV32_SLT(local_id_x$2, $d.0);
    p3$1 := (if v13$1 then v13$1 else p3$1);
    p3$2 := (if v13$2 then v13$2 else p3$2);
    v14$1 := (if p3$1 then BV32_SUB(BV32_ADD(BV32_MUL(v12, local_id_x$1), BV32_UDIV(v12, 2bv32)), 1bv32) else v14$1);
    v14$2 := (if p3$2 then BV32_SUB(BV32_ADD(BV32_MUL(v12, local_id_x$2), BV32_UDIV(v12, 2bv32)), 1bv32) else v14$2);
    v15$1 := (if p3$1 then BV32_ADD(v14$1, BV32_UDIV(v12, 2bv32)) else v15$1);
    v15$2 := (if p3$2 then BV32_ADD(v14$2, BV32_UDIV(v12, 2bv32)) else v15$2);
    v16$1 := (if p3$1 then BV32_ADD(v15$1, BV32_ASHR(v15$1, 4bv32)) else v16$1);
    v16$2 := (if p3$2 then BV32_ADD(v15$2, BV32_ASHR(v15$2, 4bv32)) else v16$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(p3$1, BV32_ADD(v14$1, BV32_ASHR(v14$1, 4bv32)), $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][BV32_ADD(v14$1, BV32_ASHR(v14$1, 4bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 20} _CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(p3$2, BV32_ADD(v14$2, BV32_ASHR(v14$2, 4bv32)), $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v14$2, BV32_ASHR(v14$2, 4bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    v17$1 := (if p3$1 then $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][BV32_ADD(v14$1, BV32_ASHR(v14$1, 4bv32))] else v17$1);
    v17$2 := (if p3$2 then $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v14$2, BV32_ASHR(v14$2, 4bv32))] else v17$2);
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(p3$1, v16$1, $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v16$1]);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(p3$2, v16$2, $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v16$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    v18$1 := (if p3$1 then $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v16$1] else v18$1);
    v18$2 := (if p3$2 then $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v16$2] else v18$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(p3$1, v16$1, FADD32(v18$1, v17$1), $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v16$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data(p3$2, v16$2);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(p3$2, v16$2, FADD32(v18$2, v17$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v16$1] := (if p3$1 then FADD32(v18$1, v17$1) else $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][v16$1]);
    $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v16$2] := (if p3$2 then FADD32(v18$2, v17$2) else $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v16$2]);
    $stride.0, $d.0 := v12, BV32_ASHR($d.0, 1bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $10;

  $truebb0:
    assume {:partition} v7 && v7;
    v8$1 := BV32_SLT(v3$1, $n);
    v8$2 := BV32_SLT(v3$2, $n);
    p0$1 := (if v8$1 then v8$1 else p0$1);
    p0$2 := (if v8$2 then v8$2 else p0$2);
    p1$1 := (if !v8$1 then !v8$1 else p1$1);
    p1$2 := (if !v8$2 then !v8$2 else p1$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v9$1 := (if p0$1 then _HAVOC_bv32$1 else v9$1);
    v9$2 := (if p0$2 then _HAVOC_bv32$2 else v9$2);
    $1$1 := (if p0$1 then v9$1 else $1$1);
    $1$2 := (if p0$2 then v9$2 else $1$2);
    $1$1 := (if p1$1 then 0bv32 else $1$1);
    $1$2 := (if p1$2 then 0bv32 else $1$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(true, BV32_ADD(v3$1, v5$1), $1$1, $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][BV32_ADD(v3$1, v5$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data(true, BV32_ADD(v3$2, v5$2));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(true, BV32_ADD(v3$2, v5$2), $1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data"} true;
    $$_ZZ1kPfPKfS_iiiiiE6s_data[1bv1][BV32_ADD(v3$1, v5$1)] := $1$1;
    $$_ZZ1kPfPKfS_iiiiiE6s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v3$2, v5$2)] := $1$2;
    goto $9;

  $truebb:
    assume {:partition} v0 && v0;
    $0$1 := BV32_MUL(group_id_x$1, BV32_SHL(group_size_x, 1bv32));
    $0$2 := BV32_MUL(group_id_x$2, BV32_SHL(group_size_x, 1bv32));
    goto $3;
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

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ1kPfPKfS_iiiiiE6s_data, $$g_odata, $$g_blockSums, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ1kPfPKfS_iiiiiE6s_data, $$g_odata, $$g_blockSums, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ1kPfPKfS_iiiiiE6s_data, $$g_odata, $$g_blockSums, _TRACKING;



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



const _WATCHED_VALUE_$$g_blockSums: bv32;

procedure {:inline 1} _LOG_READ_$$g_blockSums(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$g_blockSums;



implementation {:inline 1} _LOG_READ_$$g_blockSums(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$g_blockSums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_blockSums == _value then true else _READ_HAS_OCCURRED_$$g_blockSums);
    return;
}



procedure _CHECK_READ_$$g_blockSums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_blockSums"} {:array "$$g_blockSums"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$g_blockSums && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$g_blockSums);
  requires {:source_name "g_blockSums"} {:array "$$g_blockSums"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$g_blockSums && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$g_blockSums: bool;

procedure {:inline 1} _LOG_WRITE_$$g_blockSums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$g_blockSums, _WRITE_READ_BENIGN_FLAG_$$g_blockSums;



implementation {:inline 1} _LOG_WRITE_$$g_blockSums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$g_blockSums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_blockSums == _value then true else _WRITE_HAS_OCCURRED_$$g_blockSums);
    _WRITE_READ_BENIGN_FLAG_$$g_blockSums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_blockSums == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$g_blockSums);
    return;
}



procedure _CHECK_WRITE_$$g_blockSums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "g_blockSums"} {:array "$$g_blockSums"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$g_blockSums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_blockSums != _value);
  requires {:source_name "g_blockSums"} {:array "$$g_blockSums"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$g_blockSums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$g_blockSums != _value);
  requires {:source_name "g_blockSums"} {:array "$$g_blockSums"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$g_blockSums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$g_blockSums(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$g_blockSums;



implementation {:inline 1} _LOG_ATOMIC_$$g_blockSums(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$g_blockSums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$g_blockSums);
    return;
}



procedure _CHECK_ATOMIC_$$g_blockSums(_P: bool, _offset: bv32);
  requires {:source_name "g_blockSums"} {:array "$$g_blockSums"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$g_blockSums && _WATCHED_OFFSET == _offset);
  requires {:source_name "g_blockSums"} {:array "$$g_blockSums"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$g_blockSums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_blockSums(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$g_blockSums;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$g_blockSums(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$g_blockSums := (if _P && _WRITE_HAS_OCCURRED_$$g_blockSums && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$g_blockSums);
    return;
}



const _WATCHED_VALUE_$$_ZZ1kPfPKfS_iiiiiE6s_data: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data;



implementation {:inline 1} _LOG_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ1kPfPKfS_iiiiiE6s_data == _value then true else _READ_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data);
    return;
}



procedure _CHECK_READ_$$_ZZ1kPfPKfS_iiiiiE6s_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_data"} {:array "$$_ZZ1kPfPKfS_iiiiiE6s_data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$_ZZ1kPfPKfS_iiiiiE6s_data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data, _WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data;



implementation {:inline 1} _LOG_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ1kPfPKfS_iiiiiE6s_data == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ1kPfPKfS_iiiiiE6s_data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data);
    return;
}



procedure _CHECK_WRITE_$$_ZZ1kPfPKfS_iiiiiE6s_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_data"} {:array "$$_ZZ1kPfPKfS_iiiiiE6s_data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ1kPfPKfS_iiiiiE6s_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$_ZZ1kPfPKfS_iiiiiE6s_data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ1kPfPKfS_iiiiiE6s_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$_ZZ1kPfPKfS_iiiiiE6s_data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ1kPfPKfS_iiiiiE6s_data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ1kPfPKfS_iiiiiE6s_data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ1kPfPKfS_iiiiiE6s_data(_P: bool, _offset: bv32);
  requires {:source_name "s_data"} {:array "$$_ZZ1kPfPKfS_iiiiiE6s_data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$_ZZ1kPfPKfS_iiiiiE6s_data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ1kPfPKfS_iiiiiE6s_data);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$g_odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$g_odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$g_odata;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$g_blockSums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$g_blockSums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$g_blockSums;
    goto anon5;

  anon5:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$g_odata;
    goto anon7;

  anon7:
    havoc $$g_blockSums;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ1kPfPKfS_iiiiiE6s_data;
    goto anon3;

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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$g_odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$g_odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$g_odata;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$g_blockSums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$g_blockSums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$g_blockSums;
    goto anon5;

  anon5:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$g_odata;
    goto anon7;

  anon7:
    havoc $$g_blockSums;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ1kPfPKfS_iiiiiE6s_data;
    goto anon3;

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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ1kPfPKfS_iiiiiE6s_data;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$g_odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$g_odata;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$g_odata;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$g_blockSums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$g_blockSums;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$g_blockSums;
    goto anon5;

  anon5:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$g_odata;
    goto anon7;

  anon7:
    havoc $$g_blockSums;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ1kPfPKfS_iiiiiE6s_data;
    goto anon3;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
