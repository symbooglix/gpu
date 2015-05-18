type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "dataBase"} {:global} $$dataBase: [bv32]bv32;

axiom {:array_info "$$dataBase"} {:global} {:elem_width 32} {:source_name "dataBase"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$dataBase: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$dataBase: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$dataBase: bool;

var {:source_name "interBase"} {:global} $$interBase: [bv32]bv32;

axiom {:array_info "$$interBase"} {:global} {:elem_width 32} {:source_name "interBase"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$interBase: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$interBase: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$interBase: bool;

var {:source_name "s_data"} {:group_shared} $$scan_L1_kernel.s_data: [bv1][bv32]bv32;

axiom {:array_info "$$scan_L1_kernel.s_data"} {:group_shared} {:elem_width 32} {:source_name "s_data"} {:source_elem_width 32} {:source_dimensions "1092"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$scan_L1_kernel.s_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$scan_L1_kernel.s_data: bool;

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

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "scan_L1_kernel"} {:kernel} $scan_L1_kernel($n: bv32, $data_offset: bv32, $inter_offset: bv32);
  requires !_READ_HAS_OCCURRED_$$dataBase && !_WRITE_HAS_OCCURRED_$$dataBase && !_ATOMIC_HAS_OCCURRED_$$dataBase;
  requires !_READ_HAS_OCCURRED_$$interBase && !_WRITE_HAS_OCCURRED_$$interBase && !_ATOMIC_HAS_OCCURRED_$$interBase;
  requires !_READ_HAS_OCCURRED_$$scan_L1_kernel.s_data && !_WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data && !_ATOMIC_HAS_OCCURRED_$$scan_L1_kernel.s_data;
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
  modifies $$scan_L1_kernel.s_data, _READ_HAS_OCCURRED_$$dataBase, _WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data, _WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data, _WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data, _READ_HAS_OCCURRED_$$scan_L1_kernel.s_data, _WRITE_HAS_OCCURRED_$$interBase, _WRITE_READ_BENIGN_FLAG_$$interBase, _WRITE_READ_BENIGN_FLAG_$$interBase, $$dataBase, $$interBase, _TRACKING, _WRITE_HAS_OCCURRED_$$dataBase, _WRITE_READ_BENIGN_FLAG_$$dataBase, _WRITE_READ_BENIGN_FLAG_$$dataBase, _TRACKING, _TRACKING;



implementation {:source_name "scan_L1_kernel"} {:kernel} $scan_L1_kernel($n: bv32, $data_offset: bv32, $inter_offset: bv32)
{
  var $0$1: bv32;
  var $0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $stride.0: bv32;
  var $d.0: bv32;
  var $stride.1: bv32;
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
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bool;
  var v8$2: bool;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bool;
  var v10$2: bool;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12: bool;
  var v13$1: bool;
  var v13$2: bool;
  var v15$1: bv32;
  var v15$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
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
  var v21$1: bool;
  var v21$2: bool;
  var v22$1: bv32;
  var v22$2: bv32;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26: bool;
  var v27: bv32;
  var v28$1: bool;
  var v28$2: bool;
  var v30$1: bv32;
  var v30$2: bv32;
  var v29$1: bv32;
  var v29$2: bv32;
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
  var v36$1: bv32;
  var v36$2: bv32;
  var v37$1: bv32;
  var v37$2: bv32;
  var v38$1: bool;
  var v38$2: bool;
  var v39$1: bv32;
  var v39$2: bv32;
  var v40$1: bool;
  var v40$2: bool;
  var v41$1: bv32;
  var v41$2: bv32;
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


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1$1 := BV32_ADD(BV32_MUL(BV32_MUL(group_id_x$1, 2bv32), group_size_x), local_id_x$1);
    v1$2 := BV32_ADD(BV32_MUL(BV32_MUL(group_id_x$2, 2bv32), group_size_x), local_id_x$2);
    v2$1 := BV32_ADD(v1$1, group_size_x);
    v2$2 := BV32_ADD(v1$2, group_size_x);
    v3$1 := BV32_ADD(v0$1, group_size_x);
    v3$2 := BV32_ADD(v0$2, group_size_x);
    v4$1 := BV32_ADD(4bv32, v0$1);
    v4$2 := BV32_ADD(4bv32, v0$2);
    v5$1 := BV32_ADD(v0$1, BV32_LSHR(BV32_LSHR(v0$1, BV32_AND((if BV32_ULT(v4$1, 24bv32) then v4$1 else 24bv32), 31bv32)), 8bv32));
    v5$2 := BV32_ADD(v0$2, BV32_LSHR(BV32_LSHR(v0$2, BV32_AND((if BV32_ULT(v4$2, 24bv32) then v4$2 else 24bv32), 31bv32)), 8bv32));
    v6$1 := BV32_ADD(4bv32, v3$1);
    v6$2 := BV32_ADD(4bv32, v3$2);
    v7$1 := BV32_ADD(v3$1, BV32_LSHR(BV32_LSHR(v3$1, BV32_AND((if BV32_ULT(v6$1, 24bv32) then v6$1 else 24bv32), 31bv32)), 8bv32));
    v7$2 := BV32_ADD(v3$2, BV32_LSHR(BV32_LSHR(v3$2, BV32_AND((if BV32_ULT(v6$2, 24bv32) then v6$2 else 24bv32), 31bv32)), 8bv32));
    v8$1 := BV32_ULT(v1$1, $n);
    v8$2 := BV32_ULT(v1$2, $n);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p0$1 := (if v8$1 then v8$1 else p0$1);
    p0$2 := (if v8$2 then v8$2 else p0$2);
    p1$1 := (if !v8$1 then !v8$1 else p1$1);
    p1$2 := (if !v8$2 then !v8$2 else p1$2);
    call {:sourceloc} {:sourceloc_num 2} _LOG_READ_$$dataBase(p0$1, BV32_ADD($data_offset, v1$1), $$dataBase[BV32_ADD($data_offset, v1$1)]);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 2} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 2} _CHECK_READ_$$dataBase(p0$2, BV32_ADD($data_offset, v1$2), $$dataBase[BV32_ADD($data_offset, v1$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$dataBase"} true;
    v9$1 := (if p0$1 then $$dataBase[BV32_ADD($data_offset, v1$1)] else v9$1);
    v9$2 := (if p0$2 then $$dataBase[BV32_ADD($data_offset, v1$2)] else v9$2);
    $0$1 := (if p0$1 then v9$1 else $0$1);
    $0$2 := (if p0$2 then v9$2 else $0$2);
    $0$1 := (if p1$1 then 0bv32 else $0$1);
    $0$2 := (if p1$2 then 0bv32 else $0$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$scan_L1_kernel.s_data(true, v5$1, $0$1, $$scan_L1_kernel.s_data[1bv1][v5$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data(true, v5$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$scan_L1_kernel.s_data(true, v5$2, $0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$scan_L1_kernel.s_data"} true;
    $$scan_L1_kernel.s_data[1bv1][v5$1] := $0$1;
    $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2] := $0$2;
    v10$1 := BV32_ULT(v2$1, $n);
    v10$2 := BV32_ULT(v2$2, $n);
    p2$1 := (if v10$1 then v10$1 else p2$1);
    p2$2 := (if v10$2 then v10$2 else p2$2);
    p3$1 := (if !v10$1 then !v10$1 else p3$1);
    p3$2 := (if !v10$2 then !v10$2 else p3$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_READ_$$dataBase(p2$1, BV32_ADD($data_offset, v2$1), $$dataBase[BV32_ADD($data_offset, v2$1)]);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 7} _CHECK_READ_$$dataBase(p2$2, BV32_ADD($data_offset, v2$2), $$dataBase[BV32_ADD($data_offset, v2$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$dataBase"} true;
    v11$1 := (if p2$1 then $$dataBase[BV32_ADD($data_offset, v2$1)] else v11$1);
    v11$2 := (if p2$2 then $$dataBase[BV32_ADD($data_offset, v2$2)] else v11$2);
    $1$1 := (if p2$1 then v11$1 else $1$1);
    $1$2 := (if p2$2 then v11$2 else $1$2);
    $1$1 := (if p3$1 then 0bv32 else $1$1);
    $1$2 := (if p3$2 then 0bv32 else $1$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$scan_L1_kernel.s_data(true, v7$1, $1$1, $$scan_L1_kernel.s_data[1bv1][v7$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data(true, v7$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$scan_L1_kernel.s_data(true, v7$2, $1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$scan_L1_kernel.s_data"} true;
    $$scan_L1_kernel.s_data[1bv1][v7$1] := $1$1;
    $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v7$2] := $1$2;
    $stride.0, $d.0 := 1bv32, group_size_x;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$scan_L1_kernel.s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$scan_L1_kernel.s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 11} true;
    v12 := BV32_UGT($d.0, 0bv32);
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    goto __partitioned_block_$truebb1_0, $falsebb1;

  $falsebb1:
    assume {:partition} !v12 && !v12;
    v21$1 := v0$1 == 0bv32;
    v21$2 := v0$2 == 0bv32;
    p6$1 := (if v21$1 then v21$1 else p6$1);
    p6$2 := (if v21$2 then v21$2 else p6$2);
    v22$1 := (if p6$1 then BV32_SUB(BV32_MUL(group_size_x, 2bv32), 1bv32) else v22$1);
    v22$2 := (if p6$2 then BV32_SUB(BV32_MUL(group_size_x, 2bv32), 1bv32) else v22$2);
    v23$1 := (if p6$1 then BV32_ADD(4bv32, v22$1) else v23$1);
    v23$2 := (if p6$2 then BV32_ADD(4bv32, v22$2) else v23$2);
    v24$1 := (if p6$1 then BV32_ADD(v22$1, BV32_LSHR(BV32_LSHR(v22$1, BV32_AND((if BV32_ULT(v23$1, 24bv32) then v23$1 else 24bv32), 31bv32)), 8bv32)) else v24$1);
    v24$2 := (if p6$2 then BV32_ADD(v22$2, BV32_LSHR(BV32_LSHR(v22$2, BV32_AND((if BV32_ULT(v23$2, 24bv32) then v23$2 else 24bv32), 31bv32)), 8bv32)) else v24$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$scan_L1_kernel.s_data(p6$1, v24$1, $$scan_L1_kernel.s_data[1bv1][v24$1]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$scan_L1_kernel.s_data(p6$2, v24$2, $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v24$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_L1_kernel.s_data"} true;
    v25$1 := (if p6$1 then $$scan_L1_kernel.s_data[1bv1][v24$1] else v25$1);
    v25$2 := (if p6$2 then $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v24$2] else v25$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$interBase(p6$1, BV32_ADD($inter_offset, group_id_x$1), v25$1, $$interBase[BV32_ADD($inter_offset, group_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$interBase(p6$2, BV32_ADD($inter_offset, group_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$interBase(p6$2, BV32_ADD($inter_offset, group_id_x$2), v25$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$interBase"} true;
    $$interBase[BV32_ADD($inter_offset, group_id_x$1)] := (if p6$1 then v25$1 else $$interBase[BV32_ADD($inter_offset, group_id_x$1)]);
    $$interBase[BV32_ADD($inter_offset, group_id_x$2)] := (if p6$2 then v25$2 else $$interBase[BV32_ADD($inter_offset, group_id_x$2)]);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$scan_L1_kernel.s_data(p6$1, v24$1, 0bv32, $$scan_L1_kernel.s_data[1bv1][v24$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data(p6$2, v24$2);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$scan_L1_kernel.s_data(p6$2, v24$2, 0bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$scan_L1_kernel.s_data"} true;
    $$scan_L1_kernel.s_data[1bv1][v24$1] := (if p6$1 then 0bv32 else $$scan_L1_kernel.s_data[1bv1][v24$1]);
    $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v24$2] := (if p6$2 then 0bv32 else $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v24$2]);
    $stride.1, $d1.0 := $stride.0, 1bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $15;

  $15:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$scan_L1_kernel.s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$scan_L1_kernel.s_data ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 26} true;
    v26 := BV32_ULE($d1.0, group_size_x);
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
    goto __partitioned_block_$truebb4_0, __partitioned_block_$falsebb4_0;

  __partitioned_block_$falsebb4_0:
    assume {:partition} !v26 && !v26;
    goto __partitioned_block_$falsebb4_1;

  __partitioned_block_$falsebb4_1:
    call {:sourceloc_num 38} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    v38$1 := BV32_ULT(v1$1, $n);
    v38$2 := BV32_ULT(v1$2, $n);
    p10$1 := (if v38$1 then v38$1 else p10$1);
    p10$2 := (if v38$2 then v38$2 else p10$2);
    call {:sourceloc} {:sourceloc_num 40} _LOG_READ_$$scan_L1_kernel.s_data(p10$1, v5$1, $$scan_L1_kernel.s_data[1bv1][v5$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 40} _CHECK_READ_$$scan_L1_kernel.s_data(p10$2, v5$2, $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_L1_kernel.s_data"} true;
    v39$1 := (if p10$1 then $$scan_L1_kernel.s_data[1bv1][v5$1] else v39$1);
    v39$2 := (if p10$2 then $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v5$2] else v39$2);
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$dataBase(p10$1, BV32_ADD($data_offset, v1$1), v39$1, $$dataBase[BV32_ADD($data_offset, v1$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dataBase(p10$2, BV32_ADD($data_offset, v1$2));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$dataBase(p10$2, BV32_ADD($data_offset, v1$2), v39$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dataBase"} true;
    $$dataBase[BV32_ADD($data_offset, v1$1)] := (if p10$1 then v39$1 else $$dataBase[BV32_ADD($data_offset, v1$1)]);
    $$dataBase[BV32_ADD($data_offset, v1$2)] := (if p10$2 then v39$2 else $$dataBase[BV32_ADD($data_offset, v1$2)]);
    v40$1 := BV32_ULT(v2$1, $n);
    v40$2 := BV32_ULT(v2$2, $n);
    p12$1 := (if v40$1 then v40$1 else p12$1);
    p12$2 := (if v40$2 then v40$2 else p12$2);
    call {:sourceloc} {:sourceloc_num 44} _LOG_READ_$$scan_L1_kernel.s_data(p12$1, v7$1, $$scan_L1_kernel.s_data[1bv1][v7$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 44} _CHECK_READ_$$scan_L1_kernel.s_data(p12$2, v7$2, $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v7$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_L1_kernel.s_data"} true;
    v41$1 := (if p12$1 then $$scan_L1_kernel.s_data[1bv1][v7$1] else v41$1);
    v41$2 := (if p12$2 then $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v7$2] else v41$2);
    call {:sourceloc} {:sourceloc_num 45} _LOG_WRITE_$$dataBase(p12$1, BV32_ADD($data_offset, v2$1), v41$1, $$dataBase[BV32_ADD($data_offset, v2$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dataBase(p12$2, BV32_ADD($data_offset, v2$2));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 45} _CHECK_WRITE_$$dataBase(p12$2, BV32_ADD($data_offset, v2$2), v41$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dataBase"} true;
    $$dataBase[BV32_ADD($data_offset, v2$1)] := (if p12$1 then v41$1 else $$dataBase[BV32_ADD($data_offset, v2$1)]);
    $$dataBase[BV32_ADD($data_offset, v2$2)] := (if p12$2 then v41$2 else $$dataBase[BV32_ADD($data_offset, v2$2)]);
    return;

  __partitioned_block_$truebb4_0:
    assume {:partition} v26 && v26;
    v27 := BV32_LSHR($stride.1, 1bv32);
    goto __partitioned_block_$truebb4_1;

  __partitioned_block_$truebb4_1:
    call {:sourceloc_num 28} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    v28$1 := BV32_ULT(v0$1, $d1.0);
    v28$2 := BV32_ULT(v0$2, $d1.0);
    p9$1 := (if v28$1 then v28$1 else p9$1);
    p9$2 := (if v28$2 then v28$2 else p9$2);
    v29$1 := (if p9$1 then BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL(2bv32, v27), v0$1), v27), 1bv32) else v29$1);
    v29$2 := (if p9$2 then BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL(2bv32, v27), v0$2), v27), 1bv32) else v29$2);
    v30$1 := (if p9$1 then BV32_ADD(v29$1, v27) else v30$1);
    v30$2 := (if p9$2 then BV32_ADD(v29$2, v27) else v30$2);
    v31$1 := (if p9$1 then BV32_ADD(4bv32, v29$1) else v31$1);
    v31$2 := (if p9$2 then BV32_ADD(4bv32, v29$2) else v31$2);
    v32$1 := (if p9$1 then BV32_ADD(v29$1, BV32_LSHR(BV32_LSHR(v29$1, BV32_AND((if BV32_ULT(v31$1, 24bv32) then v31$1 else 24bv32), 31bv32)), 8bv32)) else v32$1);
    v32$2 := (if p9$2 then BV32_ADD(v29$2, BV32_LSHR(BV32_LSHR(v29$2, BV32_AND((if BV32_ULT(v31$2, 24bv32) then v31$2 else 24bv32), 31bv32)), 8bv32)) else v32$2);
    v33$1 := (if p9$1 then BV32_ADD(4bv32, v30$1) else v33$1);
    v33$2 := (if p9$2 then BV32_ADD(4bv32, v30$2) else v33$2);
    v34$1 := (if p9$1 then BV32_ADD(v30$1, BV32_LSHR(BV32_LSHR(v30$1, BV32_AND((if BV32_ULT(v33$1, 24bv32) then v33$1 else 24bv32), 31bv32)), 8bv32)) else v34$1);
    v34$2 := (if p9$2 then BV32_ADD(v30$2, BV32_LSHR(BV32_LSHR(v30$2, BV32_AND((if BV32_ULT(v33$2, 24bv32) then v33$2 else 24bv32), 31bv32)), 8bv32)) else v34$2);
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$scan_L1_kernel.s_data(p9$1, v32$1, $$scan_L1_kernel.s_data[1bv1][v32$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$scan_L1_kernel.s_data(p9$2, v32$2, $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v32$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_L1_kernel.s_data"} true;
    v35$1 := (if p9$1 then $$scan_L1_kernel.s_data[1bv1][v32$1] else v35$1);
    v35$2 := (if p9$2 then $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v32$2] else v35$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_READ_$$scan_L1_kernel.s_data(p9$1, v34$1, $$scan_L1_kernel.s_data[1bv1][v34$1]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 31} _CHECK_READ_$$scan_L1_kernel.s_data(p9$2, v34$2, $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v34$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_L1_kernel.s_data"} true;
    v36$1 := (if p9$1 then $$scan_L1_kernel.s_data[1bv1][v34$1] else v36$1);
    v36$2 := (if p9$2 then $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v34$2] else v36$2);
    call {:sourceloc} {:sourceloc_num 32} _LOG_WRITE_$$scan_L1_kernel.s_data(p9$1, v32$1, v36$1, $$scan_L1_kernel.s_data[1bv1][v32$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data(p9$2, v32$2);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 32} _CHECK_WRITE_$$scan_L1_kernel.s_data(p9$2, v32$2, v36$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$scan_L1_kernel.s_data"} true;
    $$scan_L1_kernel.s_data[1bv1][v32$1] := (if p9$1 then v36$1 else $$scan_L1_kernel.s_data[1bv1][v32$1]);
    $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v32$2] := (if p9$2 then v36$2 else $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v32$2]);
    call {:sourceloc} {:sourceloc_num 33} _LOG_READ_$$scan_L1_kernel.s_data(p9$1, v34$1, $$scan_L1_kernel.s_data[1bv1][v34$1]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 33} _CHECK_READ_$$scan_L1_kernel.s_data(p9$2, v34$2, $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v34$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_L1_kernel.s_data"} true;
    v37$1 := (if p9$1 then $$scan_L1_kernel.s_data[1bv1][v34$1] else v37$1);
    v37$2 := (if p9$2 then $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v34$2] else v37$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$scan_L1_kernel.s_data(p9$1, v34$1, BV32_ADD(v37$1, v35$1), $$scan_L1_kernel.s_data[1bv1][v34$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data(p9$2, v34$2);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$scan_L1_kernel.s_data(p9$2, v34$2, BV32_ADD(v37$2, v35$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$scan_L1_kernel.s_data"} true;
    $$scan_L1_kernel.s_data[1bv1][v34$1] := (if p9$1 then BV32_ADD(v37$1, v35$1) else $$scan_L1_kernel.s_data[1bv1][v34$1]);
    $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v34$2] := (if p9$2 then BV32_ADD(v37$2, v35$2) else $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v34$2]);
    $stride.1, $d1.0 := v27, BV32_MUL($d1.0, 2bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $15;

  __partitioned_block_$truebb1_0:
    assume {:partition} v12 && v12;
    goto __partitioned_block_$truebb1_1;

  __partitioned_block_$truebb1_1:
    call {:sourceloc_num 13} $bugle_barrier_duplicated_2(1bv1, 0bv1);
    v13$1 := BV32_ULT(v0$1, $d.0);
    v13$2 := BV32_ULT(v0$2, $d.0);
    p5$1 := (if v13$1 then v13$1 else p5$1);
    p5$2 := (if v13$2 then v13$2 else p5$2);
    v14$1 := (if p5$1 then BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL(2bv32, $stride.0), v0$1), $stride.0), 1bv32) else v14$1);
    v14$2 := (if p5$2 then BV32_SUB(BV32_ADD(BV32_MUL(BV32_MUL(2bv32, $stride.0), v0$2), $stride.0), 1bv32) else v14$2);
    v15$1 := (if p5$1 then BV32_ADD(v14$1, $stride.0) else v15$1);
    v15$2 := (if p5$2 then BV32_ADD(v14$2, $stride.0) else v15$2);
    v16$1 := (if p5$1 then BV32_ADD(4bv32, v14$1) else v16$1);
    v16$2 := (if p5$2 then BV32_ADD(4bv32, v14$2) else v16$2);
    v17$1 := (if p5$1 then BV32_ADD(4bv32, v15$1) else v17$1);
    v17$2 := (if p5$2 then BV32_ADD(4bv32, v15$2) else v17$2);
    v18$1 := (if p5$1 then BV32_ADD(v15$1, BV32_LSHR(BV32_LSHR(v15$1, BV32_AND((if BV32_ULT(v17$1, 24bv32) then v17$1 else 24bv32), 31bv32)), 8bv32)) else v18$1);
    v18$2 := (if p5$2 then BV32_ADD(v15$2, BV32_LSHR(BV32_LSHR(v15$2, BV32_AND((if BV32_ULT(v17$2, 24bv32) then v17$2 else 24bv32), 31bv32)), 8bv32)) else v18$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$scan_L1_kernel.s_data(p5$1, BV32_ADD(v14$1, BV32_LSHR(BV32_LSHR(v14$1, BV32_AND((if BV32_ULT(v16$1, 24bv32) then v16$1 else 24bv32), 31bv32)), 8bv32)), $$scan_L1_kernel.s_data[1bv1][BV32_ADD(v14$1, BV32_LSHR(BV32_LSHR(v14$1, BV32_AND((if BV32_ULT(v16$1, 24bv32) then v16$1 else 24bv32), 31bv32)), 8bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$scan_L1_kernel.s_data(p5$2, BV32_ADD(v14$2, BV32_LSHR(BV32_LSHR(v14$2, BV32_AND((if BV32_ULT(v16$2, 24bv32) then v16$2 else 24bv32), 31bv32)), 8bv32)), $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v14$2, BV32_LSHR(BV32_LSHR(v14$2, BV32_AND((if BV32_ULT(v16$2, 24bv32) then v16$2 else 24bv32), 31bv32)), 8bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_L1_kernel.s_data"} true;
    v19$1 := (if p5$1 then $$scan_L1_kernel.s_data[1bv1][BV32_ADD(v14$1, BV32_LSHR(BV32_LSHR(v14$1, BV32_AND((if BV32_ULT(v16$1, 24bv32) then v16$1 else 24bv32), 31bv32)), 8bv32))] else v19$1);
    v19$2 := (if p5$2 then $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v14$2, BV32_LSHR(BV32_LSHR(v14$2, BV32_AND((if BV32_ULT(v16$2, 24bv32) then v16$2 else 24bv32), 31bv32)), 8bv32))] else v19$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$scan_L1_kernel.s_data(p5$1, v18$1, $$scan_L1_kernel.s_data[1bv1][v18$1]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$scan_L1_kernel.s_data(p5$2, v18$2, $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$scan_L1_kernel.s_data"} true;
    v20$1 := (if p5$1 then $$scan_L1_kernel.s_data[1bv1][v18$1] else v20$1);
    v20$2 := (if p5$2 then $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2] else v20$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$scan_L1_kernel.s_data(p5$1, v18$1, BV32_ADD(v20$1, v19$1), $$scan_L1_kernel.s_data[1bv1][v18$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data(p5$2, v18$2);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$scan_L1_kernel.s_data(p5$2, v18$2, BV32_ADD(v20$2, v19$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$scan_L1_kernel.s_data"} true;
    $$scan_L1_kernel.s_data[1bv1][v18$1] := (if p5$1 then BV32_ADD(v20$1, v19$1) else $$scan_L1_kernel.s_data[1bv1][v18$1]);
    $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2] := (if p5$2 then BV32_ADD(v20$2, v19$2) else $$scan_L1_kernel.s_data[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v18$2]);
    $stride.0, $d.0 := BV32_MUL($stride.0, 2bv32), BV32_LSHR($d.0, 1bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $7;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 16385bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$scan_L1_kernel.s_data, $$dataBase, $$interBase, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$scan_L1_kernel.s_data, $$dataBase, $$interBase, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$scan_L1_kernel.s_data, $$dataBase, $$interBase, _TRACKING;



const _WATCHED_VALUE_$$dataBase: bv32;

procedure {:inline 1} _LOG_READ_$$dataBase(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$dataBase;



implementation {:inline 1} _LOG_READ_$$dataBase(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$dataBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dataBase == _value then true else _READ_HAS_OCCURRED_$$dataBase);
    return;
}



procedure _CHECK_READ_$$dataBase(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dataBase"} {:array "$$dataBase"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$dataBase);
  requires {:source_name "dataBase"} {:array "$$dataBase"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$dataBase: bool;

procedure {:inline 1} _LOG_WRITE_$$dataBase(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$dataBase, _WRITE_READ_BENIGN_FLAG_$$dataBase;



implementation {:inline 1} _LOG_WRITE_$$dataBase(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$dataBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dataBase == _value then true else _WRITE_HAS_OCCURRED_$$dataBase);
    _WRITE_READ_BENIGN_FLAG_$$dataBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dataBase == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$dataBase);
    return;
}



procedure _CHECK_WRITE_$$dataBase(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dataBase"} {:array "$$dataBase"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dataBase != _value);
  requires {:source_name "dataBase"} {:array "$$dataBase"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dataBase != _value);
  requires {:source_name "dataBase"} {:array "$$dataBase"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$dataBase(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$dataBase;



implementation {:inline 1} _LOG_ATOMIC_$$dataBase(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$dataBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$dataBase);
    return;
}



procedure _CHECK_ATOMIC_$$dataBase(_P: bool, _offset: bv32);
  requires {:source_name "dataBase"} {:array "$$dataBase"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset);
  requires {:source_name "dataBase"} {:array "$$dataBase"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dataBase(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$dataBase;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dataBase(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$dataBase := (if _P && _WRITE_HAS_OCCURRED_$$dataBase && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$dataBase);
    return;
}



const _WATCHED_VALUE_$$interBase: bv32;

procedure {:inline 1} _LOG_READ_$$interBase(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$interBase;



implementation {:inline 1} _LOG_READ_$$interBase(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$interBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$interBase == _value then true else _READ_HAS_OCCURRED_$$interBase);
    return;
}



procedure _CHECK_READ_$$interBase(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "interBase"} {:array "$$interBase"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$interBase);
  requires {:source_name "interBase"} {:array "$$interBase"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$interBase: bool;

procedure {:inline 1} _LOG_WRITE_$$interBase(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$interBase, _WRITE_READ_BENIGN_FLAG_$$interBase;



implementation {:inline 1} _LOG_WRITE_$$interBase(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$interBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$interBase == _value then true else _WRITE_HAS_OCCURRED_$$interBase);
    _WRITE_READ_BENIGN_FLAG_$$interBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$interBase == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$interBase);
    return;
}



procedure _CHECK_WRITE_$$interBase(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "interBase"} {:array "$$interBase"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$interBase != _value);
  requires {:source_name "interBase"} {:array "$$interBase"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$interBase != _value);
  requires {:source_name "interBase"} {:array "$$interBase"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$interBase(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$interBase;



implementation {:inline 1} _LOG_ATOMIC_$$interBase(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$interBase := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$interBase);
    return;
}



procedure _CHECK_ATOMIC_$$interBase(_P: bool, _offset: bv32);
  requires {:source_name "interBase"} {:array "$$interBase"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset);
  requires {:source_name "interBase"} {:array "$$interBase"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$interBase(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$interBase;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$interBase(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$interBase := (if _P && _WRITE_HAS_OCCURRED_$$interBase && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$interBase);
    return;
}



const _WATCHED_VALUE_$$scan_L1_kernel.s_data: bv32;

procedure {:inline 1} _LOG_READ_$$scan_L1_kernel.s_data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$scan_L1_kernel.s_data;



implementation {:inline 1} _LOG_READ_$$scan_L1_kernel.s_data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$scan_L1_kernel.s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_L1_kernel.s_data == _value then true else _READ_HAS_OCCURRED_$$scan_L1_kernel.s_data);
    return;
}



procedure _CHECK_READ_$$scan_L1_kernel.s_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_data"} {:array "$$scan_L1_kernel.s_data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$scan_L1_kernel.s_data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$scan_L1_kernel.s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data: bool;

procedure {:inline 1} _LOG_WRITE_$$scan_L1_kernel.s_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data, _WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data;



implementation {:inline 1} _LOG_WRITE_$$scan_L1_kernel.s_data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_L1_kernel.s_data == _value then true else _WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data);
    _WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_L1_kernel.s_data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data);
    return;
}



procedure _CHECK_WRITE_$$scan_L1_kernel.s_data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "s_data"} {:array "$$scan_L1_kernel.s_data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_L1_kernel.s_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$scan_L1_kernel.s_data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$scan_L1_kernel.s_data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$scan_L1_kernel.s_data != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$scan_L1_kernel.s_data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$scan_L1_kernel.s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$scan_L1_kernel.s_data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$scan_L1_kernel.s_data;



implementation {:inline 1} _LOG_ATOMIC_$$scan_L1_kernel.s_data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$scan_L1_kernel.s_data := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$scan_L1_kernel.s_data);
    return;
}



procedure _CHECK_ATOMIC_$$scan_L1_kernel.s_data(_P: bool, _offset: bv32);
  requires {:source_name "s_data"} {:array "$$scan_L1_kernel.s_data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "s_data"} {:array "$$scan_L1_kernel.s_data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$scan_L1_kernel.s_data && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data := (if _P && _WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$scan_L1_kernel.s_data);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$scan_L1_kernel.s_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$scan_L1_kernel.s_data;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$dataBase;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$dataBase;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$dataBase;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$interBase;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$interBase;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$interBase;
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
    havoc $$dataBase;
    goto anon7;

  anon7:
    havoc $$interBase;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$scan_L1_kernel.s_data;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$scan_L1_kernel.s_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$scan_L1_kernel.s_data;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$dataBase;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$dataBase;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$dataBase;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$interBase;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$interBase;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$interBase;
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
    havoc $$dataBase;
    goto anon7;

  anon7:
    havoc $$interBase;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$scan_L1_kernel.s_data;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$scan_L1_kernel.s_data;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$scan_L1_kernel.s_data;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$scan_L1_kernel.s_data;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$dataBase;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$dataBase;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$dataBase;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$interBase;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$interBase;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$interBase;
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
    havoc $$dataBase;
    goto anon7;

  anon7:
    havoc $$interBase;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$scan_L1_kernel.s_data;
    goto anon3;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
