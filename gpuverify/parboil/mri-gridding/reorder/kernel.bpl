type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$idxValue_g"} {:global} {:elem_width 32} {:source_name "idxValue_g"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$idxValue_g: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$idxValue_g: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$idxValue_g: bool;

axiom {:array_info "$$samples_g"} {:global} {:elem_width 32} {:source_name "samples_g"} {:source_elem_width 192} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 192} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$samples_g: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 192} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$samples_g: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 192} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$samples_g: bool;

var {:source_name "sortedSample_g"} {:global} $$sortedSample_g: [bv32]bv32;

axiom {:array_info "$$sortedSample_g"} {:global} {:elem_width 32} {:source_name "sortedSample_g"} {:source_elem_width 192} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 192} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sortedSample_g: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 192} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sortedSample_g: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 192} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sortedSample_g: bool;

axiom {:array_info "$$pt"} {:elem_width 32} {:source_name "pt"} {:source_elem_width 192} {:source_dimensions "1"} true;

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

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "reorder_kernel"} {:kernel} $reorder_kernel($n: bv32);
  requires !_READ_HAS_OCCURRED_$$idxValue_g && !_WRITE_HAS_OCCURRED_$$idxValue_g && !_ATOMIC_HAS_OCCURRED_$$idxValue_g;
  requires !_READ_HAS_OCCURRED_$$samples_g && !_WRITE_HAS_OCCURRED_$$samples_g && !_ATOMIC_HAS_OCCURRED_$$samples_g;
  requires !_READ_HAS_OCCURRED_$$sortedSample_g && !_WRITE_HAS_OCCURRED_$$sortedSample_g && !_ATOMIC_HAS_OCCURRED_$$sortedSample_g;
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
  modifies _WRITE_HAS_OCCURRED_$$sortedSample_g, _WRITE_READ_BENIGN_FLAG_$$sortedSample_g, _WRITE_READ_BENIGN_FLAG_$$sortedSample_g;



implementation {:source_name "reorder_kernel"} {:kernel} $reorder_kernel($n: bv32)
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
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ULT(v0$1, $n);
    v1$2 := BV32_ULT(v0$2, $n);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p0$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p0$2 then _HAVOC_bv32$2 else v2$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p0$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p0$2 then _HAVOC_bv32$2 else v3$2);
    $$pt$0bv32$1 := (if p0$1 then v3$1 else $$pt$0bv32$1);
    $$pt$0bv32$2 := (if p0$2 then v3$2 else $$pt$0bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v4$1 := (if p0$1 then _HAVOC_bv32$1 else v4$1);
    v4$2 := (if p0$2 then _HAVOC_bv32$2 else v4$2);
    $$pt$1bv32$1 := (if p0$1 then v4$1 else $$pt$1bv32$1);
    $$pt$1bv32$2 := (if p0$2 then v4$2 else $$pt$1bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v5$1 := (if p0$1 then _HAVOC_bv32$1 else v5$1);
    v5$2 := (if p0$2 then _HAVOC_bv32$2 else v5$2);
    $$pt$2bv32$1 := (if p0$1 then v5$1 else $$pt$2bv32$1);
    $$pt$2bv32$2 := (if p0$2 then v5$2 else $$pt$2bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v6$1 := (if p0$1 then _HAVOC_bv32$1 else v6$1);
    v6$2 := (if p0$2 then _HAVOC_bv32$2 else v6$2);
    $$pt$3bv32$1 := (if p0$1 then v6$1 else $$pt$3bv32$1);
    $$pt$3bv32$2 := (if p0$2 then v6$2 else $$pt$3bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v7$1 := (if p0$1 then _HAVOC_bv32$1 else v7$1);
    v7$2 := (if p0$2 then _HAVOC_bv32$2 else v7$2);
    $$pt$4bv32$1 := (if p0$1 then v7$1 else $$pt$4bv32$1);
    $$pt$4bv32$2 := (if p0$2 then v7$2 else $$pt$4bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v8$1 := (if p0$1 then _HAVOC_bv32$1 else v8$1);
    v8$2 := (if p0$2 then _HAVOC_bv32$2 else v8$2);
    $$pt$5bv32$1 := (if p0$1 then v8$1 else $$pt$5bv32$1);
    $$pt$5bv32$2 := (if p0$2 then v8$2 else $$pt$5bv32$2);
    v9$1 := (if p0$1 then $$pt$0bv32$1 else v9$1);
    v9$2 := (if p0$2 then $$pt$0bv32$2 else v9$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$sortedSample_g(p0$1, BV32_MUL(v0$1, 6bv32), v9$1, $$sortedSample_g[BV32_MUL(v0$1, 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sortedSample_g(p0$2, BV32_MUL(v0$2, 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$sortedSample_g(p0$2, BV32_MUL(v0$2, 6bv32), v9$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sortedSample_g"} true;
    $$sortedSample_g[BV32_MUL(v0$1, 6bv32)] := (if p0$1 then v9$1 else $$sortedSample_g[BV32_MUL(v0$1, 6bv32)]);
    $$sortedSample_g[BV32_MUL(v0$2, 6bv32)] := (if p0$2 then v9$2 else $$sortedSample_g[BV32_MUL(v0$2, 6bv32)]);
    v10$1 := (if p0$1 then $$pt$1bv32$1 else v10$1);
    v10$2 := (if p0$2 then $$pt$1bv32$2 else v10$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$sortedSample_g(p0$1, BV32_ADD(BV32_MUL(v0$1, 6bv32), 1bv32), v10$1, $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sortedSample_g(p0$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$sortedSample_g(p0$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 1bv32), v10$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sortedSample_g"} true;
    $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 1bv32)] := (if p0$1 then v10$1 else $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 1bv32)]);
    $$sortedSample_g[BV32_ADD(BV32_MUL(v0$2, 6bv32), 1bv32)] := (if p0$2 then v10$2 else $$sortedSample_g[BV32_ADD(BV32_MUL(v0$2, 6bv32), 1bv32)]);
    v11$1 := (if p0$1 then $$pt$2bv32$1 else v11$1);
    v11$2 := (if p0$2 then $$pt$2bv32$2 else v11$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$sortedSample_g(p0$1, BV32_ADD(BV32_MUL(v0$1, 6bv32), 2bv32), v11$1, $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sortedSample_g(p0$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$sortedSample_g(p0$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 2bv32), v11$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sortedSample_g"} true;
    $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 2bv32)] := (if p0$1 then v11$1 else $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 2bv32)]);
    $$sortedSample_g[BV32_ADD(BV32_MUL(v0$2, 6bv32), 2bv32)] := (if p0$2 then v11$2 else $$sortedSample_g[BV32_ADD(BV32_MUL(v0$2, 6bv32), 2bv32)]);
    v12$1 := (if p0$1 then $$pt$3bv32$1 else v12$1);
    v12$2 := (if p0$2 then $$pt$3bv32$2 else v12$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$sortedSample_g(p0$1, BV32_ADD(BV32_MUL(v0$1, 6bv32), 3bv32), v12$1, $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sortedSample_g(p0$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$sortedSample_g(p0$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 3bv32), v12$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sortedSample_g"} true;
    $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 3bv32)] := (if p0$1 then v12$1 else $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 3bv32)]);
    $$sortedSample_g[BV32_ADD(BV32_MUL(v0$2, 6bv32), 3bv32)] := (if p0$2 then v12$2 else $$sortedSample_g[BV32_ADD(BV32_MUL(v0$2, 6bv32), 3bv32)]);
    v13$1 := (if p0$1 then $$pt$4bv32$1 else v13$1);
    v13$2 := (if p0$2 then $$pt$4bv32$2 else v13$2);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$sortedSample_g(p0$1, BV32_ADD(BV32_MUL(v0$1, 6bv32), 4bv32), v13$1, $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sortedSample_g(p0$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$sortedSample_g(p0$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 4bv32), v13$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sortedSample_g"} true;
    $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 4bv32)] := (if p0$1 then v13$1 else $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 4bv32)]);
    $$sortedSample_g[BV32_ADD(BV32_MUL(v0$2, 6bv32), 4bv32)] := (if p0$2 then v13$2 else $$sortedSample_g[BV32_ADD(BV32_MUL(v0$2, 6bv32), 4bv32)]);
    v14$1 := (if p0$1 then $$pt$5bv32$1 else v14$1);
    v14$2 := (if p0$2 then $$pt$5bv32$2 else v14$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$sortedSample_g(p0$1, BV32_ADD(BV32_MUL(v0$1, 6bv32), 5bv32), v14$1, $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sortedSample_g(p0$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$sortedSample_g(p0$2, BV32_ADD(BV32_MUL(v0$2, 6bv32), 5bv32), v14$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sortedSample_g"} true;
    $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 5bv32)] := (if p0$1 then v14$1 else $$sortedSample_g[BV32_ADD(BV32_MUL(v0$1, 6bv32), 5bv32)]);
    $$sortedSample_g[BV32_ADD(BV32_MUL(v0$2, 6bv32), 5bv32)] := (if p0$2 then v14$2 else $$sortedSample_g[BV32_ADD(BV32_MUL(v0$2, 6bv32), 5bv32)]);
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 1024bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2594bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$pt$0bv32$1: bv32;

var $$pt$0bv32$2: bv32;

var $$pt$1bv32$1: bv32;

var $$pt$1bv32$2: bv32;

var $$pt$2bv32$1: bv32;

var $$pt$2bv32$2: bv32;

var $$pt$3bv32$1: bv32;

var $$pt$3bv32$2: bv32;

var $$pt$4bv32$1: bv32;

var $$pt$4bv32$2: bv32;

var $$pt$5bv32$1: bv32;

var $$pt$5bv32$2: bv32;

const _WATCHED_VALUE_$$idxValue_g: bv32;

procedure {:inline 1} _LOG_READ_$$idxValue_g(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$idxValue_g;



implementation {:inline 1} _LOG_READ_$$idxValue_g(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$idxValue_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idxValue_g == _value then true else _READ_HAS_OCCURRED_$$idxValue_g);
    return;
}



procedure _CHECK_READ_$$idxValue_g(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "idxValue_g"} {:array "$$idxValue_g"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$idxValue_g && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$idxValue_g);
  requires {:source_name "idxValue_g"} {:array "$$idxValue_g"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$idxValue_g && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$idxValue_g: bool;

procedure {:inline 1} _LOG_WRITE_$$idxValue_g(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$idxValue_g, _WRITE_READ_BENIGN_FLAG_$$idxValue_g;



implementation {:inline 1} _LOG_WRITE_$$idxValue_g(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$idxValue_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idxValue_g == _value then true else _WRITE_HAS_OCCURRED_$$idxValue_g);
    _WRITE_READ_BENIGN_FLAG_$$idxValue_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idxValue_g == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$idxValue_g);
    return;
}



procedure _CHECK_WRITE_$$idxValue_g(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "idxValue_g"} {:array "$$idxValue_g"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$idxValue_g && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idxValue_g != _value);
  requires {:source_name "idxValue_g"} {:array "$$idxValue_g"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$idxValue_g && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$idxValue_g != _value);
  requires {:source_name "idxValue_g"} {:array "$$idxValue_g"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$idxValue_g && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$idxValue_g(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$idxValue_g;



implementation {:inline 1} _LOG_ATOMIC_$$idxValue_g(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$idxValue_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$idxValue_g);
    return;
}



procedure _CHECK_ATOMIC_$$idxValue_g(_P: bool, _offset: bv32);
  requires {:source_name "idxValue_g"} {:array "$$idxValue_g"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$idxValue_g && _WATCHED_OFFSET == _offset);
  requires {:source_name "idxValue_g"} {:array "$$idxValue_g"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$idxValue_g && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$idxValue_g(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$idxValue_g;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$idxValue_g(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$idxValue_g := (if _P && _WRITE_HAS_OCCURRED_$$idxValue_g && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$idxValue_g);
    return;
}



const _WATCHED_VALUE_$$samples_g: bv32;

procedure {:inline 1} _LOG_READ_$$samples_g(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$samples_g;



implementation {:inline 1} _LOG_READ_$$samples_g(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$samples_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$samples_g == _value then true else _READ_HAS_OCCURRED_$$samples_g);
    return;
}



procedure _CHECK_READ_$$samples_g(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "samples_g"} {:array "$$samples_g"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$samples_g && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$samples_g);
  requires {:source_name "samples_g"} {:array "$$samples_g"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$samples_g && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$samples_g: bool;

procedure {:inline 1} _LOG_WRITE_$$samples_g(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$samples_g, _WRITE_READ_BENIGN_FLAG_$$samples_g;



implementation {:inline 1} _LOG_WRITE_$$samples_g(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$samples_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$samples_g == _value then true else _WRITE_HAS_OCCURRED_$$samples_g);
    _WRITE_READ_BENIGN_FLAG_$$samples_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$samples_g == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$samples_g);
    return;
}



procedure _CHECK_WRITE_$$samples_g(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "samples_g"} {:array "$$samples_g"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$samples_g && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$samples_g != _value);
  requires {:source_name "samples_g"} {:array "$$samples_g"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$samples_g && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$samples_g != _value);
  requires {:source_name "samples_g"} {:array "$$samples_g"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$samples_g && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$samples_g(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$samples_g;



implementation {:inline 1} _LOG_ATOMIC_$$samples_g(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$samples_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$samples_g);
    return;
}



procedure _CHECK_ATOMIC_$$samples_g(_P: bool, _offset: bv32);
  requires {:source_name "samples_g"} {:array "$$samples_g"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$samples_g && _WATCHED_OFFSET == _offset);
  requires {:source_name "samples_g"} {:array "$$samples_g"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$samples_g && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$samples_g(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$samples_g;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$samples_g(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$samples_g := (if _P && _WRITE_HAS_OCCURRED_$$samples_g && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$samples_g);
    return;
}



const _WATCHED_VALUE_$$sortedSample_g: bv32;

procedure {:inline 1} _LOG_READ_$$sortedSample_g(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$sortedSample_g;



implementation {:inline 1} _LOG_READ_$$sortedSample_g(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sortedSample_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sortedSample_g == _value then true else _READ_HAS_OCCURRED_$$sortedSample_g);
    return;
}



procedure _CHECK_READ_$$sortedSample_g(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sortedSample_g"} {:array "$$sortedSample_g"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sortedSample_g && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sortedSample_g);
  requires {:source_name "sortedSample_g"} {:array "$$sortedSample_g"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sortedSample_g && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$sortedSample_g: bool;

procedure {:inline 1} _LOG_WRITE_$$sortedSample_g(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$sortedSample_g, _WRITE_READ_BENIGN_FLAG_$$sortedSample_g;



implementation {:inline 1} _LOG_WRITE_$$sortedSample_g(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sortedSample_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sortedSample_g == _value then true else _WRITE_HAS_OCCURRED_$$sortedSample_g);
    _WRITE_READ_BENIGN_FLAG_$$sortedSample_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sortedSample_g == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sortedSample_g);
    return;
}



procedure _CHECK_WRITE_$$sortedSample_g(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sortedSample_g"} {:array "$$sortedSample_g"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sortedSample_g && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sortedSample_g != _value);
  requires {:source_name "sortedSample_g"} {:array "$$sortedSample_g"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sortedSample_g && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sortedSample_g != _value);
  requires {:source_name "sortedSample_g"} {:array "$$sortedSample_g"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sortedSample_g && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$sortedSample_g(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sortedSample_g;



implementation {:inline 1} _LOG_ATOMIC_$$sortedSample_g(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sortedSample_g := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sortedSample_g);
    return;
}



procedure _CHECK_ATOMIC_$$sortedSample_g(_P: bool, _offset: bv32);
  requires {:source_name "sortedSample_g"} {:array "$$sortedSample_g"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sortedSample_g && _WATCHED_OFFSET == _offset);
  requires {:source_name "sortedSample_g"} {:array "$$sortedSample_g"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sortedSample_g && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sortedSample_g(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sortedSample_g;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sortedSample_g(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sortedSample_g := (if _P && _WRITE_HAS_OCCURRED_$$sortedSample_g && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sortedSample_g);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
