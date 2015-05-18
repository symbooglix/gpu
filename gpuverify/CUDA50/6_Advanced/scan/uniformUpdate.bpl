type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "d_Data"} {:global} $$d_Data: [bv32]bv32;

axiom {:array_info "$$d_Data"} {:global} {:elem_width 32} {:source_name "d_Data"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Data: bool;

axiom {:array_info "$$d_Buffer"} {:global} {:elem_width 32} {:source_name "d_Buffer"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$d_Buffer: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$d_Buffer: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$d_Buffer: bool;

axiom {:array_info "$$data4"} {:elem_width 32} {:source_name "data4"} {:source_elem_width 128} {:source_dimensions "1"} true;

var {:source_name "buf"} {:group_shared} $$_ZZ13uniformUpdateP5uint4PjE3buf: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ13uniformUpdateP5uint4PjE3buf"} {:group_shared} {:elem_width 32} {:source_name "buf"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf: bool;

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

procedure {:source_name "uniformUpdate"} {:kernel} $_Z13uniformUpdateP5uint4Pj();
  requires !_READ_HAS_OCCURRED_$$d_Data && !_WRITE_HAS_OCCURRED_$$d_Data && !_ATOMIC_HAS_OCCURRED_$$d_Data;
  requires !_READ_HAS_OCCURRED_$$d_Buffer && !_WRITE_HAS_OCCURRED_$$d_Buffer && !_ATOMIC_HAS_OCCURRED_$$d_Buffer;
  requires !_READ_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf && !_WRITE_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf && !_ATOMIC_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf;
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
  modifies $$_ZZ13uniformUpdateP5uint4PjE3buf, _WRITE_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf, _WRITE_READ_BENIGN_FLAG_$$_ZZ13uniformUpdateP5uint4PjE3buf, _WRITE_READ_BENIGN_FLAG_$$_ZZ13uniformUpdateP5uint4PjE3buf, $$d_Data, _TRACKING, _READ_HAS_OCCURRED_$$d_Data, _READ_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf, _WRITE_HAS_OCCURRED_$$d_Data, _WRITE_READ_BENIGN_FLAG_$$d_Data, _WRITE_READ_BENIGN_FLAG_$$d_Data;



implementation {:source_name "uniformUpdate"} {:kernel} $_Z13uniformUpdateP5uint4Pj()
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
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
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
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
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  __partitioned_block_$0_0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := local_id_x$1 == 0bv32;
    v1$2 := local_id_x$2 == 0bv32;
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p0$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p0$2 then _HAVOC_bv32$2 else v2$2);
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$_ZZ13uniformUpdateP5uint4PjE3buf(p0$1, 0bv32, v2$1, $$_ZZ13uniformUpdateP5uint4PjE3buf[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13uniformUpdateP5uint4PjE3buf(p0$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$_ZZ13uniformUpdateP5uint4PjE3buf(p0$2, 0bv32, v2$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13uniformUpdateP5uint4PjE3buf"} true;
    $$_ZZ13uniformUpdateP5uint4PjE3buf[1bv1][0bv32] := (if p0$1 then v2$1 else $$_ZZ13uniformUpdateP5uint4PjE3buf[1bv1][0bv32]);
    $$_ZZ13uniformUpdateP5uint4PjE3buf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := (if p0$2 then v2$2 else $$_ZZ13uniformUpdateP5uint4PjE3buf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 5} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    call {:sourceloc} {:sourceloc_num 6} _LOG_READ_$$d_Data(true, BV32_MUL(v0$1, 4bv32), $$d_Data[BV32_MUL(v0$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 6} _CHECK_READ_$$d_Data(true, BV32_MUL(v0$2, 4bv32), $$d_Data[BV32_MUL(v0$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_Data"} true;
    v3$1 := $$d_Data[BV32_MUL(v0$1, 4bv32)];
    v3$2 := $$d_Data[BV32_MUL(v0$2, 4bv32)];
    $$data4$0bv32$1 := v3$1;
    $$data4$0bv32$2 := v3$2;
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$d_Data(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32), $$d_Data[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$d_Data(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32), $$d_Data[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_Data"} true;
    v4$1 := $$d_Data[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)];
    v4$2 := $$d_Data[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)];
    $$data4$1bv32$1 := v4$1;
    $$data4$1bv32$2 := v4$2;
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$d_Data(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32), $$d_Data[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$d_Data(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32), $$d_Data[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_Data"} true;
    v5$1 := $$d_Data[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)];
    v5$2 := $$d_Data[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)];
    $$data4$2bv32$1 := v5$1;
    $$data4$2bv32$2 := v5$2;
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$d_Data(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32), $$d_Data[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$d_Data(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32), $$d_Data[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$d_Data"} true;
    v6$1 := $$d_Data[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)];
    v6$2 := $$d_Data[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)];
    $$data4$3bv32$1 := v6$1;
    $$data4$3bv32$2 := v6$2;
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf(true, 0bv32, $$_ZZ13uniformUpdateP5uint4PjE3buf[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf(true, 0bv32, $$_ZZ13uniformUpdateP5uint4PjE3buf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf"} true;
    v7$1 := $$_ZZ13uniformUpdateP5uint4PjE3buf[1bv1][0bv32];
    v7$2 := $$_ZZ13uniformUpdateP5uint4PjE3buf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    v8$1 := $$data4$0bv32$1;
    v8$2 := $$data4$0bv32$2;
    $$data4$0bv32$1 := BV32_ADD(v8$1, v7$1);
    $$data4$0bv32$2 := BV32_ADD(v8$2, v7$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf(true, 0bv32, $$_ZZ13uniformUpdateP5uint4PjE3buf[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf(true, 0bv32, $$_ZZ13uniformUpdateP5uint4PjE3buf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf"} true;
    v9$1 := $$_ZZ13uniformUpdateP5uint4PjE3buf[1bv1][0bv32];
    v9$2 := $$_ZZ13uniformUpdateP5uint4PjE3buf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    v10$1 := $$data4$1bv32$1;
    v10$2 := $$data4$1bv32$2;
    $$data4$1bv32$1 := BV32_ADD(v10$1, v9$1);
    $$data4$1bv32$2 := BV32_ADD(v10$2, v9$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf(true, 0bv32, $$_ZZ13uniformUpdateP5uint4PjE3buf[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 20} _CHECK_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf(true, 0bv32, $$_ZZ13uniformUpdateP5uint4PjE3buf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf"} true;
    v11$1 := $$_ZZ13uniformUpdateP5uint4PjE3buf[1bv1][0bv32];
    v11$2 := $$_ZZ13uniformUpdateP5uint4PjE3buf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    v12$1 := $$data4$2bv32$1;
    v12$2 := $$data4$2bv32$2;
    $$data4$2bv32$1 := BV32_ADD(v12$1, v11$1);
    $$data4$2bv32$2 := BV32_ADD(v12$2, v11$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf(true, 0bv32, $$_ZZ13uniformUpdateP5uint4PjE3buf[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf(true, 0bv32, $$_ZZ13uniformUpdateP5uint4PjE3buf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf"} true;
    v13$1 := $$_ZZ13uniformUpdateP5uint4PjE3buf[1bv1][0bv32];
    v13$2 := $$_ZZ13uniformUpdateP5uint4PjE3buf[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    v14$1 := $$data4$3bv32$1;
    v14$2 := $$data4$3bv32$2;
    $$data4$3bv32$1 := BV32_ADD(v14$1, v13$1);
    $$data4$3bv32$2 := BV32_ADD(v14$2, v13$2);
    v15$1 := $$data4$0bv32$1;
    v15$2 := $$data4$0bv32$2;
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$d_Data(true, BV32_MUL(v0$1, 4bv32), v15$1, $$d_Data[BV32_MUL(v0$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Data(true, BV32_MUL(v0$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$d_Data(true, BV32_MUL(v0$2, 4bv32), v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Data"} true;
    $$d_Data[BV32_MUL(v0$1, 4bv32)] := v15$1;
    $$d_Data[BV32_MUL(v0$2, 4bv32)] := v15$2;
    v16$1 := $$data4$1bv32$1;
    v16$2 := $$data4$1bv32$2;
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$d_Data(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32), v16$1, $$d_Data[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Data(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$d_Data(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32), v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Data"} true;
    $$d_Data[BV32_ADD(BV32_MUL(v0$1, 4bv32), 1bv32)] := v16$1;
    $$d_Data[BV32_ADD(BV32_MUL(v0$2, 4bv32), 1bv32)] := v16$2;
    v17$1 := $$data4$2bv32$1;
    v17$2 := $$data4$2bv32$2;
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$d_Data(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32), v17$1, $$d_Data[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Data(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$d_Data(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32), v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Data"} true;
    $$d_Data[BV32_ADD(BV32_MUL(v0$1, 4bv32), 2bv32)] := v17$1;
    $$d_Data[BV32_ADD(BV32_MUL(v0$2, 4bv32), 2bv32)] := v17$2;
    v18$1 := $$data4$3bv32$1;
    v18$2 := $$data4$3bv32$2;
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$d_Data(true, BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32), v18$1, $$d_Data[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Data(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$d_Data(true, BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32), v18$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$d_Data"} true;
    $$d_Data[BV32_ADD(BV32_MUL(v0$1, 4bv32), 3bv32)] := v18$1;
    $$d_Data[BV32_ADD(BV32_MUL(v0$2, 4bv32), 3bv32)] := v18$2;
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 6624bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$_ZZ13uniformUpdateP5uint4PjE3buf, $$d_Data, _TRACKING;



var $$data4$0bv32$1: bv32;

var $$data4$0bv32$2: bv32;

var $$data4$1bv32$1: bv32;

var $$data4$1bv32$2: bv32;

var $$data4$2bv32$1: bv32;

var $$data4$2bv32$2: bv32;

var $$data4$3bv32$1: bv32;

var $$data4$3bv32$2: bv32;

const _WATCHED_VALUE_$$d_Data: bv32;

procedure {:inline 1} _LOG_READ_$$d_Data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Data;



implementation {:inline 1} _LOG_READ_$$d_Data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data == _value then true else _READ_HAS_OCCURRED_$$d_Data);
    return;
}



procedure _CHECK_READ_$$d_Data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Data);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Data: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Data, _WRITE_READ_BENIGN_FLAG_$$d_Data;



implementation {:inline 1} _LOG_WRITE_$$d_Data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data == _value then true else _WRITE_HAS_OCCURRED_$$d_Data);
    _WRITE_READ_BENIGN_FLAG_$$d_Data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Data);
    return;
}



procedure _CHECK_WRITE_$$d_Data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data != _value);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Data != _value);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Data;



implementation {:inline 1} _LOG_ATOMIC_$$d_Data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Data);
    return;
}



procedure _CHECK_ATOMIC_$$d_Data(_P: bool, _offset: bv32);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Data"} {:array "$$d_Data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Data := (if _P && _WRITE_HAS_OCCURRED_$$d_Data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Data);
    return;
}



const _WATCHED_VALUE_$$d_Buffer: bv32;

procedure {:inline 1} _LOG_READ_$$d_Buffer(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$d_Buffer;



implementation {:inline 1} _LOG_READ_$$d_Buffer(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$d_Buffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Buffer == _value then true else _READ_HAS_OCCURRED_$$d_Buffer);
    return;
}



procedure _CHECK_READ_$$d_Buffer(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Buffer"} {:array "$$d_Buffer"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$d_Buffer && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$d_Buffer);
  requires {:source_name "d_Buffer"} {:array "$$d_Buffer"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Buffer && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$d_Buffer: bool;

procedure {:inline 1} _LOG_WRITE_$$d_Buffer(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$d_Buffer, _WRITE_READ_BENIGN_FLAG_$$d_Buffer;



implementation {:inline 1} _LOG_WRITE_$$d_Buffer(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$d_Buffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Buffer == _value then true else _WRITE_HAS_OCCURRED_$$d_Buffer);
    _WRITE_READ_BENIGN_FLAG_$$d_Buffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Buffer == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$d_Buffer);
    return;
}



procedure _CHECK_WRITE_$$d_Buffer(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "d_Buffer"} {:array "$$d_Buffer"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$d_Buffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Buffer != _value);
  requires {:source_name "d_Buffer"} {:array "$$d_Buffer"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$d_Buffer && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$d_Buffer != _value);
  requires {:source_name "d_Buffer"} {:array "$$d_Buffer"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$d_Buffer && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$d_Buffer(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$d_Buffer;



implementation {:inline 1} _LOG_ATOMIC_$$d_Buffer(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$d_Buffer := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$d_Buffer);
    return;
}



procedure _CHECK_ATOMIC_$$d_Buffer(_P: bool, _offset: bv32);
  requires {:source_name "d_Buffer"} {:array "$$d_Buffer"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$d_Buffer && _WATCHED_OFFSET == _offset);
  requires {:source_name "d_Buffer"} {:array "$$d_Buffer"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$d_Buffer && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Buffer(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$d_Buffer;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$d_Buffer(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$d_Buffer := (if _P && _WRITE_HAS_OCCURRED_$$d_Buffer && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$d_Buffer);
    return;
}



const _WATCHED_VALUE_$$_ZZ13uniformUpdateP5uint4PjE3buf: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf;



implementation {:inline 1} _LOG_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13uniformUpdateP5uint4PjE3buf == _value then true else _READ_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf);
    return;
}



procedure _CHECK_READ_$$_ZZ13uniformUpdateP5uint4PjE3buf(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "buf"} {:array "$$_ZZ13uniformUpdateP5uint4PjE3buf"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ13uniformUpdateP5uint4PjE3buf && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "buf"} {:array "$$_ZZ13uniformUpdateP5uint4PjE3buf"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ13uniformUpdateP5uint4PjE3buf: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ13uniformUpdateP5uint4PjE3buf(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf, _WRITE_READ_BENIGN_FLAG_$$_ZZ13uniformUpdateP5uint4PjE3buf;



implementation {:inline 1} _LOG_WRITE_$$_ZZ13uniformUpdateP5uint4PjE3buf(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13uniformUpdateP5uint4PjE3buf == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13uniformUpdateP5uint4PjE3buf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13uniformUpdateP5uint4PjE3buf == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ13uniformUpdateP5uint4PjE3buf);
    return;
}



procedure _CHECK_WRITE_$$_ZZ13uniformUpdateP5uint4PjE3buf(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "buf"} {:array "$$_ZZ13uniformUpdateP5uint4PjE3buf"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13uniformUpdateP5uint4PjE3buf != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "buf"} {:array "$$_ZZ13uniformUpdateP5uint4PjE3buf"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13uniformUpdateP5uint4PjE3buf != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "buf"} {:array "$$_ZZ13uniformUpdateP5uint4PjE3buf"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ13uniformUpdateP5uint4PjE3buf(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ13uniformUpdateP5uint4PjE3buf(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ13uniformUpdateP5uint4PjE3buf(_P: bool, _offset: bv32);
  requires {:source_name "buf"} {:array "$$_ZZ13uniformUpdateP5uint4PjE3buf"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "buf"} {:array "$$_ZZ13uniformUpdateP5uint4PjE3buf"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13uniformUpdateP5uint4PjE3buf(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ13uniformUpdateP5uint4PjE3buf;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13uniformUpdateP5uint4PjE3buf(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13uniformUpdateP5uint4PjE3buf := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ13uniformUpdateP5uint4PjE3buf);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13uniformUpdateP5uint4PjE3buf;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$d_Data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$d_Data;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$d_Data;
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
    havoc $$d_Data;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13uniformUpdateP5uint4PjE3buf;
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
