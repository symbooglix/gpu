type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$P"} {:global} {:elem_width 32} {:source_name "P"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$P: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$P: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$P: bool;

axiom {:array_info "$$T"} {:global} {:elem_width 32} {:source_name "T"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$T: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$T: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$T: bool;

axiom {:array_info "$$Y"} {:global} {:elem_width 32} {:source_name "Y"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$Y: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$Y: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$Y: bool;

var {:source_name "C"} {:global} $$C: [bv32]bv32;

axiom {:array_info "$$C"} {:global} {:elem_width 32} {:source_name "C"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$C: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$C: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$C: bool;

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

function FDIV32(bv32, bv32) : bv32;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

procedure {:source_name "gr_base"} {:kernel} $gr_base($TCONV: bv32, $PCONV: bv32);
  requires !_READ_HAS_OCCURRED_$$P && !_WRITE_HAS_OCCURRED_$$P && !_ATOMIC_HAS_OCCURRED_$$P;
  requires !_READ_HAS_OCCURRED_$$T && !_WRITE_HAS_OCCURRED_$$T && !_ATOMIC_HAS_OCCURRED_$$T;
  requires !_READ_HAS_OCCURRED_$$Y && !_WRITE_HAS_OCCURRED_$$Y && !_ATOMIC_HAS_OCCURRED_$$Y;
  requires !_READ_HAS_OCCURRED_$$C && !_WRITE_HAS_OCCURRED_$$C && !_ATOMIC_HAS_OCCURRED_$$C;
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
  modifies _WRITE_HAS_OCCURRED_$$C, _WRITE_READ_BENIGN_FLAG_$$C, _WRITE_READ_BENIGN_FLAG_$$C, _READ_HAS_OCCURRED_$$C;



implementation {:source_name "gr_base"} {:kernel} $gr_base($TCONV: bv32, $PCONV: bv32)
{
  var $k.0: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
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
  var v13$1: bv32;
  var v13$2: bv32;
  var v29$1: bv32;
  var v29$2: bv32;
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
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27$1: bv32;
  var v27$2: bv32;
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
  var v36$1: bv32;
  var v36$2: bv32;
  var v37$1: bv32;
  var v37$2: bv32;
  var v38$1: bv32;
  var v38$2: bv32;
  var v39$1: bv32;
  var v39$2: bv32;
  var v40$1: bv32;
  var v40$2: bv32;
  var v41$1: bv32;
  var v41$2: bv32;
  var v42$1: bv32;
  var v42$2: bv32;
  var v43$1: bv32;
  var v43$2: bv32;
  var v44$1: bv32;
  var v44$2: bv32;
  var v45$1: bv32;
  var v45$2: bv32;
  var v46: bool;
  var v47$1: bv32;
  var v47$2: bv32;


  $0:
    havoc v0$1, v0$2;
    havoc v1$1, v1$2;
    havoc v2$1, v2$2;
    v3$1 := FMUL32(v2$1, 1056831951bv32);
    v3$2 := FMUL32(v2$2, 1056831951bv32);
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$C(true, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1), v3$1, $$C[BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$C(true, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2), v3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)] := v3$1;
    $$C[BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)] := v3$2;
    havoc v4$1, v4$2;
    v5$1 := FMUL32(v4$1, 1065220559bv32);
    v5$2 := FMUL32(v4$2, 1065220559bv32);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$C(true, BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v5$1, $$C[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$C(true, BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v5$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v5$1;
    $$C[BV32_ADD(13824bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v5$2;
    havoc v6$1, v6$2;
    v7$1 := FMUL32(v6$1, 1031799099bv32);
    v7$2 := FMUL32(v6$2, 1031799099bv32);
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$C(true, BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v7$1, $$C[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$C(true, BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v7$1;
    $$C[BV32_ADD(27648bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v7$2;
    havoc v8$1, v8$2;
    v9$1 := FMUL32(v8$1, 1023410490bv32);
    v9$2 := FMUL32(v8$2, 1023410490bv32);
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$C(true, BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v9$1, $$C[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$C(true, BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v9$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v9$1;
    $$C[BV32_ADD(41472bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v9$2;
    havoc v10$1, v10$2;
    v11$1 := FMUL32(v10$1, 1030805046bv32);
    v11$2 := FMUL32(v10$2, 1030805046bv32);
    call {:sourceloc} {:sourceloc_num 12} _LOG_WRITE_$$C(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v11$1, $$C[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 12} _CHECK_WRITE_$$C(true, BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v11$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v11$1;
    $$C[BV32_ADD(55296bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v11$2;
    havoc v12$1, v12$2;
    v13$1 := FMUL32(v12$1, 1029921950bv32);
    v13$2 := FMUL32(v12$2, 1029921950bv32);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$C(true, BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v13$1, $$C[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$C(true, BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v13$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v13$1;
    $$C[BV32_ADD(69120bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v13$2;
    havoc v14$1, v14$2;
    v15$1 := FMUL32(v14$1, 1022898438bv32);
    v15$2 := FMUL32(v14$2, 1022898438bv32);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$C(true, BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v15$1, $$C[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$C(true, BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v15$1;
    $$C[BV32_ADD(82944bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v15$2;
    havoc v16$1, v16$2;
    v17$1 := FMUL32(v16$1, 1022416438bv32);
    v17$2 := FMUL32(v16$2, 1022416438bv32);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$C(true, BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v17$1, $$C[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$C(true, BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v17$1;
    $$C[BV32_ADD(96768bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v17$2;
    havoc v18$1, v18$2;
    v19$1 := FMUL32(v18$1, 1032337159bv32);
    v19$2 := FMUL32(v18$2, 1032337159bv32);
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$C(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v19$1, $$C[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$C(true, BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v19$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v19$1;
    $$C[BV32_ADD(110592bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v19$2;
    havoc v20$1, v20$2;
    v21$1 := FMUL32(v20$1, 1031753785bv32);
    v21$2 := FMUL32(v20$2, 1031753785bv32);
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$C(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v21$1, $$C[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$C(true, BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v21$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v21$1;
    $$C[BV32_ADD(124416bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v21$2;
    havoc v22$1, v22$2;
    v23$1 := FMUL32(v22$1, 1024604938bv32);
    v23$2 := FMUL32(v22$2, 1024604938bv32);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$C(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v23$1, $$C[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$C(true, BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v23$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v23$1;
    $$C[BV32_ADD(138240bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v23$2;
    havoc v24$1, v24$2;
    v25$1 := FMUL32(v24$1, 1018831813bv32);
    v25$2 := FMUL32(v24$2, 1018831813bv32);
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$C(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v25$1, $$C[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$C(true, BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v25$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v25$1;
    $$C[BV32_ADD(152064bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v25$2;
    havoc v26$1, v26$2;
    v27$1 := FMUL32(v26$1, 1023961522bv32);
    v27$2 := FMUL32(v26$2, 1023961522bv32);
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$C(true, BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v27$1, $$C[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$C(true, BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v27$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v27$1;
    $$C[BV32_ADD(165888bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v27$2;
    havoc v28$1, v28$2;
    v29$1 := FMUL32(v28$1, 1025330846bv32);
    v29$2 := FMUL32(v28$2, 1025330846bv32);
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$C(true, BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v29$1, $$C[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$C(true, BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v29$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v29$1;
    $$C[BV32_ADD(179712bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v29$2;
    havoc v30$1, v30$2;
    v31$1 := FMUL32(v30$1, 1024590033bv32);
    v31$2 := FMUL32(v30$2, 1024590033bv32);
    call {:sourceloc} {:sourceloc_num 32} _LOG_WRITE_$$C(true, BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v31$1, $$C[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 32} _CHECK_WRITE_$$C(true, BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v31$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v31$1;
    $$C[BV32_ADD(193536bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v31$2;
    havoc v32$1, v32$2;
    v33$1 := FMUL32(v32$1, 1023948551bv32);
    v33$2 := FMUL32(v32$2, 1023948551bv32);
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$C(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v33$1, $$C[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$C(true, BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v33$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v33$1;
    $$C[BV32_ADD(207360bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v33$2;
    havoc v34$1, v34$2;
    v35$1 := FMUL32(v34$1, 1019717903bv32);
    v35$2 := FMUL32(v34$2, 1019717903bv32);
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$C(true, BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v35$1, $$C[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$C(true, BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v35$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v35$1;
    $$C[BV32_ADD(221184bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v35$2;
    havoc v36$1, v36$2;
    v37$1 := FMUL32(v36$1, 1019404155bv32);
    v37$2 := FMUL32(v36$2, 1019404155bv32);
    call {:sourceloc} {:sourceloc_num 38} _LOG_WRITE_$$C(true, BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v37$1, $$C[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 38} _CHECK_WRITE_$$C(true, BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v37$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v37$1;
    $$C[BV32_ADD(235008bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v37$2;
    havoc v38$1, v38$2;
    v39$1 := FMUL32(v38$1, 1018819731bv32);
    v39$2 := FMUL32(v38$2, 1018819731bv32);
    call {:sourceloc} {:sourceloc_num 40} _LOG_WRITE_$$C(true, BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v39$1, $$C[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 40} _CHECK_WRITE_$$C(true, BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v39$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v39$1;
    $$C[BV32_ADD(248832bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v39$2;
    havoc v40$1, v40$2;
    v41$1 := FMUL32(v40$1, 1019704004bv32);
    v41$2 := FMUL32(v40$2, 1019704004bv32);
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$C(true, BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v41$1, $$C[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$C(true, BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v41$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v41$1;
    $$C[BV32_ADD(262656bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v41$2;
    havoc v42$1, v42$2;
    v43$1 := FMUL32(v42$1, 1019390914bv32);
    v43$2 := FMUL32(v42$2, 1019390914bv32);
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$C(true, BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v43$1, $$C[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$C(true, BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v43$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v43$1;
    $$C[BV32_ADD(276480bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v43$2;
    havoc v44$1, v44$2;
    v45$1 := FMUL32(v44$1, 1024603963bv32);
    v45$2 := FMUL32(v44$2, 1024603963bv32);
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$C(true, BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), v45$1, $$C[BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$C(true, BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), v45$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := v45$1;
    $$C[BV32_ADD(290304bv32, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := v45$2;
    $k.0 := 1bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 47} true;
    v46 := BV32_ULE($k.0, 22bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v46 && !v46;
    return;

  $truebb:
    assume {:partition} v46 && v46;
    call {:sourceloc} {:sourceloc_num 49} _LOG_READ_$$C(true, BV32_ADD(BV32_MUL(BV32_SUB($k.0, 1bv32), 13824bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), $$C[BV32_ADD(BV32_MUL(BV32_SUB($k.0, 1bv32), 13824bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 49} _CHECK_READ_$$C(true, BV32_ADD(BV32_MUL(BV32_SUB($k.0, 1bv32), 13824bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), $$C[BV32_ADD(BV32_MUL(BV32_SUB($k.0, 1bv32), 13824bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$C"} true;
    v47$1 := $$C[BV32_ADD(BV32_MUL(BV32_SUB($k.0, 1bv32), 13824bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))];
    v47$2 := $$C[BV32_ADD(BV32_MUL(BV32_SUB($k.0, 1bv32), 13824bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))];
    call {:sourceloc} {:sourceloc_num 50} _LOG_WRITE_$$C(true, BV32_ADD(BV32_MUL(BV32_SUB($k.0, 1bv32), 13824bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), FMUL32((if FLT32(v47$1, 8388608bv32) then 8388608bv32 else v47$1), FMUL32(FMUL32(v1$1, $PCONV), FDIV32(1065353216bv32, FMUL32(FMUL32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(0bv32, v3$1), v5$1), v7$1), v9$1), v11$1), v13$1), v15$1), v17$1), v19$1), v21$1), v23$1), v25$1), v27$1), v29$1), v31$1), v33$1), v35$1), v37$1), v39$1), v41$1), v43$1), v45$1), FMUL32(v0$1, $TCONV)), 1285461554bv32)))), $$C[BV32_ADD(BV32_MUL(BV32_SUB($k.0, 1bv32), 13824bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(true, BV32_ADD(BV32_MUL(BV32_SUB($k.0, 1bv32), 13824bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 50} _CHECK_WRITE_$$C(true, BV32_ADD(BV32_MUL(BV32_SUB($k.0, 1bv32), 13824bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)), FMUL32((if FLT32(v47$2, 8388608bv32) then 8388608bv32 else v47$2), FMUL32(FMUL32(v1$2, $PCONV), FDIV32(1065353216bv32, FMUL32(FMUL32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(0bv32, v3$2), v5$2), v7$2), v9$2), v11$2), v13$2), v15$2), v17$2), v19$2), v21$2), v23$2), v25$2), v27$2), v29$2), v31$2), v33$2), v35$2), v37$2), v39$2), v41$2), v43$2), v45$2), FMUL32(v0$2, $TCONV)), 1285461554bv32)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$C"} true;
    $$C[BV32_ADD(BV32_MUL(BV32_SUB($k.0, 1bv32), 13824bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1))] := FMUL32((if FLT32(v47$1, 8388608bv32) then 8388608bv32 else v47$1), FMUL32(FMUL32(v1$1, $PCONV), FDIV32(1065353216bv32, FMUL32(FMUL32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(0bv32, v3$1), v5$1), v7$1), v9$1), v11$1), v13$1), v15$1), v17$1), v19$1), v21$1), v23$1), v25$1), v27$1), v29$1), v31$1), v33$1), v35$1), v37$1), v39$1), v41$1), v43$1), v45$1), FMUL32(v0$1, $TCONV)), 1285461554bv32))));
    $$C[BV32_ADD(BV32_MUL(BV32_SUB($k.0, 1bv32), 13824bv32), BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2))] := FMUL32((if FLT32(v47$2, 8388608bv32) then 8388608bv32 else v47$2), FMUL32(FMUL32(v1$2, $PCONV), FDIV32(1065353216bv32, FMUL32(FMUL32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(FADD32(0bv32, v3$2), v5$2), v7$2), v9$2), v11$2), v13$2), v15$2), v17$2), v19$2), v21$2), v23$2), v25$2), v27$2), v29$2), v31$2), v33$2), v35$2), v37$2), v39$2), v41$2), v43$2), v45$2), FMUL32(v0$2, $TCONV)), 1285461554bv32))));
    $k.0 := BV32_ADD($k.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 108bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$P: bv32;

procedure {:inline 1} _LOG_READ_$$P(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$P;



implementation {:inline 1} _LOG_READ_$$P(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$P := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$P == _value then true else _READ_HAS_OCCURRED_$$P);
    return;
}



procedure _CHECK_READ_$$P(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "P"} {:array "$$P"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$P && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$P);
  requires {:source_name "P"} {:array "$$P"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$P && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$P: bool;

procedure {:inline 1} _LOG_WRITE_$$P(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$P, _WRITE_READ_BENIGN_FLAG_$$P;



implementation {:inline 1} _LOG_WRITE_$$P(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$P := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$P == _value then true else _WRITE_HAS_OCCURRED_$$P);
    _WRITE_READ_BENIGN_FLAG_$$P := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$P == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$P);
    return;
}



procedure _CHECK_WRITE_$$P(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "P"} {:array "$$P"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$P && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$P != _value);
  requires {:source_name "P"} {:array "$$P"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$P && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$P != _value);
  requires {:source_name "P"} {:array "$$P"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$P && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$P(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$P;



implementation {:inline 1} _LOG_ATOMIC_$$P(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$P := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$P);
    return;
}



procedure _CHECK_ATOMIC_$$P(_P: bool, _offset: bv32);
  requires {:source_name "P"} {:array "$$P"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$P && _WATCHED_OFFSET == _offset);
  requires {:source_name "P"} {:array "$$P"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$P && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$P(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$P;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$P(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$P := (if _P && _WRITE_HAS_OCCURRED_$$P && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$P);
    return;
}



const _WATCHED_VALUE_$$T: bv32;

procedure {:inline 1} _LOG_READ_$$T(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$T;



implementation {:inline 1} _LOG_READ_$$T(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$T := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T == _value then true else _READ_HAS_OCCURRED_$$T);
    return;
}



procedure _CHECK_READ_$$T(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "T"} {:array "$$T"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$T);
  requires {:source_name "T"} {:array "$$T"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$T: bool;

procedure {:inline 1} _LOG_WRITE_$$T(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$T, _WRITE_READ_BENIGN_FLAG_$$T;



implementation {:inline 1} _LOG_WRITE_$$T(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$T := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T == _value then true else _WRITE_HAS_OCCURRED_$$T);
    _WRITE_READ_BENIGN_FLAG_$$T := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$T);
    return;
}



procedure _CHECK_WRITE_$$T(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "T"} {:array "$$T"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T != _value);
  requires {:source_name "T"} {:array "$$T"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$T != _value);
  requires {:source_name "T"} {:array "$$T"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$T(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$T;



implementation {:inline 1} _LOG_ATOMIC_$$T(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$T := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$T);
    return;
}



procedure _CHECK_ATOMIC_$$T(_P: bool, _offset: bv32);
  requires {:source_name "T"} {:array "$$T"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset);
  requires {:source_name "T"} {:array "$$T"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$T(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$T;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$T(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$T := (if _P && _WRITE_HAS_OCCURRED_$$T && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$T);
    return;
}



const _WATCHED_VALUE_$$Y: bv32;

procedure {:inline 1} _LOG_READ_$$Y(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$Y;



implementation {:inline 1} _LOG_READ_$$Y(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$Y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Y == _value then true else _READ_HAS_OCCURRED_$$Y);
    return;
}



procedure _CHECK_READ_$$Y(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Y"} {:array "$$Y"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$Y && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$Y);
  requires {:source_name "Y"} {:array "$$Y"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$Y && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$Y: bool;

procedure {:inline 1} _LOG_WRITE_$$Y(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$Y, _WRITE_READ_BENIGN_FLAG_$$Y;



implementation {:inline 1} _LOG_WRITE_$$Y(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$Y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Y == _value then true else _WRITE_HAS_OCCURRED_$$Y);
    _WRITE_READ_BENIGN_FLAG_$$Y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Y == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$Y);
    return;
}



procedure _CHECK_WRITE_$$Y(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "Y"} {:array "$$Y"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$Y && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Y != _value);
  requires {:source_name "Y"} {:array "$$Y"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$Y && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$Y != _value);
  requires {:source_name "Y"} {:array "$$Y"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$Y && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$Y(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$Y;



implementation {:inline 1} _LOG_ATOMIC_$$Y(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$Y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$Y);
    return;
}



procedure _CHECK_ATOMIC_$$Y(_P: bool, _offset: bv32);
  requires {:source_name "Y"} {:array "$$Y"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$Y && _WATCHED_OFFSET == _offset);
  requires {:source_name "Y"} {:array "$$Y"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$Y && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Y(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$Y;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$Y(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$Y := (if _P && _WRITE_HAS_OCCURRED_$$Y && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$Y);
    return;
}



const _WATCHED_VALUE_$$C: bv32;

procedure {:inline 1} _LOG_READ_$$C(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$C;



implementation {:inline 1} _LOG_READ_$$C(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C == _value then true else _READ_HAS_OCCURRED_$$C);
    return;
}



procedure _CHECK_READ_$$C(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "C"} {:array "$$C"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$C);
  requires {:source_name "C"} {:array "$$C"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$C: bool;

procedure {:inline 1} _LOG_WRITE_$$C(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$C, _WRITE_READ_BENIGN_FLAG_$$C;



implementation {:inline 1} _LOG_WRITE_$$C(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C == _value then true else _WRITE_HAS_OCCURRED_$$C);
    _WRITE_READ_BENIGN_FLAG_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$C);
    return;
}



procedure _CHECK_WRITE_$$C(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "C"} {:array "$$C"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C != _value);
  requires {:source_name "C"} {:array "$$C"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$C != _value);
  requires {:source_name "C"} {:array "$$C"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$C(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$C;



implementation {:inline 1} _LOG_ATOMIC_$$C(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$C := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$C);
    return;
}



procedure _CHECK_ATOMIC_$$C(_P: bool, _offset: bv32);
  requires {:source_name "C"} {:array "$$C"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);
  requires {:source_name "C"} {:array "$$C"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$C;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$C(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$C := (if _P && _WRITE_HAS_OCCURRED_$$C && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$C);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
