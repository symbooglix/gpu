type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



axiom {:array_info "$$inputImage"} {:global} {:elem_width 8} {:source_name "inputImage"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$inputImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$inputImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$inputImage: bool;

var {:source_name "outputImage"} {:global} $$outputImage: [bv32]bv8;

axiom {:array_info "$$outputImage"} {:global} {:elem_width 8} {:source_name "outputImage"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$outputImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$outputImage: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$outputImage: bool;

var {:source_name "lds"} {:group_shared} $$lds: [bv1][bv32]bv8;

axiom {:array_info "$$lds"} {:group_shared} {:elem_width 8} {:source_name "lds"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$lds: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$lds: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$lds: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "zero_extend 24"} BV8_ZEXT32(bv8) : bv32;

procedure {:source_name "box_filter_horizontal_local"} {:kernel} $box_filter_horizontal_local($filterWidth: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $filterWidth == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$inputImage && !_WRITE_HAS_OCCURRED_$$inputImage && !_ATOMIC_HAS_OCCURRED_$$inputImage;
  requires !_READ_HAS_OCCURRED_$$outputImage && !_WRITE_HAS_OCCURRED_$$outputImage && !_ATOMIC_HAS_OCCURRED_$$outputImage;
  requires !_READ_HAS_OCCURRED_$$lds && !_WRITE_HAS_OCCURRED_$$lds && !_ATOMIC_HAS_OCCURRED_$$lds;
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
  modifies $$lds, _WRITE_HAS_OCCURRED_$$lds, _WRITE_READ_BENIGN_FLAG_$$lds, _WRITE_READ_BENIGN_FLAG_$$lds, $$outputImage, _TRACKING, _READ_HAS_OCCURRED_$$lds, _WRITE_HAS_OCCURRED_$$outputImage, _WRITE_READ_BENIGN_FLAG_$$outputImage, _WRITE_READ_BENIGN_FLAG_$$outputImage;



implementation {:source_name "box_filter_horizontal_local"} {:kernel} $box_filter_horizontal_local($filterWidth: bv32)
{
  var $sum.0$1: bv128;
  var $sum.0$2: bv128;
  var $X.0$1: bv32;
  var $X.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1: bv32;
  var v2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v8$1: bv8;
  var v8$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
  var v16$1: bv8;
  var v16$2: bv8;
  var v17$1: bv8;
  var v17$2: bv8;
  var v18$1: bool;
  var v18$2: bool;
  var v19$1: bool;
  var v19$2: bool;
  var v20$1: bool;
  var v20$2: bool;
  var v21$1: bv8;
  var v21$2: bv8;
  var v22$1: bv8;
  var v22$2: bv8;
  var v23$1: bv8;
  var v23$2: bv8;
  var v24$1: bv8;
  var v24$2: bv8;
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
  var _HAVOC_bv8$1: bv8;
  var _HAVOC_bv8$2: bv8;


  __partitioned_block_$0_0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1 := BV32_MUL(group_size_x, num_groups_x);
    v2 := BV32_SDIV(BV32_SUB($filterWidth, 1bv32), 2bv32);
    v3$1 := local_id_x$1;
    v3$2 := local_id_x$2;
    v4$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), BV32_MUL(BV32_MUL(v1, group_id_y$1), group_size_y));
    v4$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), BV32_MUL(BV32_MUL(v1, group_id_y$2), group_size_y));
    v5$1 := BV32_SLT(v3$1, v2);
    v5$2 := BV32_SLT(v3$2, v2);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
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
    p0$1 := (if v5$1 then v5$1 else p0$1);
    p0$2 := (if v5$2 then v5$2 else p0$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v6$1 := (if p0$1 then _HAVOC_bv8$1 else v6$1);
    v6$2 := (if p0$2 then _HAVOC_bv8$2 else v6$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v7$1 := (if p0$1 then _HAVOC_bv8$1 else v7$1);
    v7$2 := (if p0$2 then _HAVOC_bv8$2 else v7$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v8$1 := (if p0$1 then _HAVOC_bv8$1 else v8$1);
    v8$2 := (if p0$2 then _HAVOC_bv8$2 else v8$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v9$1 := (if p0$1 then _HAVOC_bv8$1 else v9$1);
    v9$2 := (if p0$2 then _HAVOC_bv8$2 else v9$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$lds(p0$1, BV32_MUL(v3$1, 4bv32), v6$1, $$lds[1bv1][BV32_MUL(v3$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lds(p0$2, BV32_MUL(v3$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$lds(p0$2, BV32_MUL(v3$2, 4bv32), v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lds"} true;
    $$lds[1bv1][BV32_MUL(v3$1, 4bv32)] := (if p0$1 then v6$1 else $$lds[1bv1][BV32_MUL(v3$1, 4bv32)]);
    $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v3$2, 4bv32)] := (if p0$2 then v6$2 else $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(v3$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$lds(p0$1, BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32), v7$1, $$lds[1bv1][BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lds(p0$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$lds(p0$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32), v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lds"} true;
    $$lds[1bv1][BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32)] := (if p0$1 then v7$1 else $$lds[1bv1][BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32)]);
    $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32)] := (if p0$2 then v7$2 else $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$lds(p0$1, BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32), v8$1, $$lds[1bv1][BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lds(p0$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$lds(p0$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32), v8$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lds"} true;
    $$lds[1bv1][BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32)] := (if p0$1 then v8$1 else $$lds[1bv1][BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32)]);
    $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32)] := (if p0$2 then v8$2 else $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$lds(p0$1, BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32), v9$1, $$lds[1bv1][BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lds(p0$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$lds(p0$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32), v9$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lds"} true;
    $$lds[1bv1][BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32)] := (if p0$1 then v9$1 else $$lds[1bv1][BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32)]);
    $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32)] := (if p0$2 then v9$2 else $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32)]);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v10$1 := (if p0$1 then _HAVOC_bv8$1 else v10$1);
    v10$2 := (if p0$2 then _HAVOC_bv8$2 else v10$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v11$1 := (if p0$1 then _HAVOC_bv8$1 else v11$1);
    v11$2 := (if p0$2 then _HAVOC_bv8$2 else v11$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v12$1 := (if p0$1 then _HAVOC_bv8$1 else v12$1);
    v12$2 := (if p0$2 then _HAVOC_bv8$2 else v12$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v13$1 := (if p0$1 then _HAVOC_bv8$1 else v13$1);
    v13$2 := (if p0$2 then _HAVOC_bv8$2 else v13$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$lds(p0$1, BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32), v10$1, $$lds[1bv1][BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lds(p0$2, BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$lds(p0$2, BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32), v10$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lds"} true;
    $$lds[1bv1][BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32)] := (if p0$1 then v10$1 else $$lds[1bv1][BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32)]);
    $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32)] := (if p0$2 then v10$2 else $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32)]);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$lds(p0$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32), 1bv32), v11$1, $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lds(p0$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$lds(p0$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32), 1bv32), v11$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lds"} true;
    $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32), 1bv32)] := (if p0$1 then v11$1 else $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32), 1bv32)]);
    $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32), 1bv32)] := (if p0$2 then v11$2 else $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$lds(p0$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32), 2bv32), v12$1, $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lds(p0$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$lds(p0$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32), 2bv32), v12$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lds"} true;
    $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32), 2bv32)] := (if p0$1 then v12$1 else $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32), 2bv32)]);
    $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32), 2bv32)] := (if p0$2 then v12$2 else $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$lds(p0$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32), 3bv32), v13$1, $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lds(p0$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$lds(p0$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32), 3bv32), v13$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lds"} true;
    $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32), 3bv32)] := (if p0$1 then v13$1 else $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$1), 4bv32), 3bv32)]);
    $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32), 3bv32)] := (if p0$2 then v13$2 else $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(256bv32, v2), v3$2), 4bv32), 3bv32)]);
    havoc v14$1, v14$2;
    havoc v15$1, v15$2;
    havoc v16$1, v16$2;
    havoc v17$1, v17$2;
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$lds(true, BV32_MUL(BV32_ADD(v3$1, v2), 4bv32), v14$1, $$lds[1bv1][BV32_MUL(BV32_ADD(v3$1, v2), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lds(true, BV32_MUL(BV32_ADD(v3$2, v2), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$lds(true, BV32_MUL(BV32_ADD(v3$2, v2), 4bv32), v14$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lds"} true;
    $$lds[1bv1][BV32_MUL(BV32_ADD(v3$1, v2), 4bv32)] := v14$1;
    $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(v3$2, v2), 4bv32)] := v14$2;
    call {:sourceloc} {:sourceloc_num 25} _LOG_WRITE_$$lds(true, BV32_ADD(BV32_MUL(BV32_ADD(v3$1, v2), 4bv32), 1bv32), v15$1, $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v3$1, v2), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lds(true, BV32_ADD(BV32_MUL(BV32_ADD(v3$2, v2), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 25} _CHECK_WRITE_$$lds(true, BV32_ADD(BV32_MUL(BV32_ADD(v3$2, v2), 4bv32), 1bv32), v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lds"} true;
    $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v3$1, v2), 4bv32), 1bv32)] := v15$1;
    $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v3$2, v2), 4bv32), 1bv32)] := v15$2;
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$lds(true, BV32_ADD(BV32_MUL(BV32_ADD(v3$1, v2), 4bv32), 2bv32), v16$1, $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v3$1, v2), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lds(true, BV32_ADD(BV32_MUL(BV32_ADD(v3$2, v2), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$lds(true, BV32_ADD(BV32_MUL(BV32_ADD(v3$2, v2), 4bv32), 2bv32), v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lds"} true;
    $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v3$1, v2), 4bv32), 2bv32)] := v16$1;
    $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v3$2, v2), 4bv32), 2bv32)] := v16$2;
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$lds(true, BV32_ADD(BV32_MUL(BV32_ADD(v3$1, v2), 4bv32), 3bv32), v17$1, $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v3$1, v2), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$lds(true, BV32_ADD(BV32_MUL(BV32_ADD(v3$2, v2), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$lds(true, BV32_ADD(BV32_MUL(BV32_ADD(v3$2, v2), 4bv32), 3bv32), v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$lds"} true;
    $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(v3$1, v2), 4bv32), 3bv32)] := v17$1;
    $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(v3$2, v2), 4bv32), 3bv32)] := v17$2;
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 28} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    v18$1 := BV32_SLT(v0$1, v2);
    v18$2 := BV32_SLT(v0$2, v2);
    p5$1 := (if v18$1 then v18$1 else p5$1);
    p5$2 := (if v18$2 then v18$2 else p5$2);
    p3$1 := (if !v18$1 then !v18$1 else p3$1);
    p3$2 := (if !v18$2 then !v18$2 else p3$2);
    p5$1 := (if p2$1 then true else p5$1);
    p5$2 := (if p2$2 then true else p5$2);
    v19$1 := (if p3$1 then BV32_SGE(v0$1, BV32_SUB(v1, v2)) else v19$1);
    v19$2 := (if p3$2 then BV32_SGE(v0$2, BV32_SUB(v1, v2)) else v19$2);
    p5$1 := (if p3$1 && v19$1 then v19$1 else p5$1);
    p5$2 := (if p3$2 && v19$2 then v19$2 else p5$2);
    p6$1 := (if p3$1 && !v19$1 then !v19$1 else p6$1);
    p6$2 := (if p3$2 && !v19$2 then !v19$2 else p6$2);
    p5$1 := (if p4$1 then true else p5$1);
    p5$2 := (if p4$2 then true else p5$2);
    $sum.0$1, $X.0$1 := (if p6$1 then 0bv128 else $sum.0$1), (if p6$1 then BV32_SUB(0bv32, v2) else $X.0$1);
    $sum.0$2, $X.0$2 := (if p6$2 then 0bv128 else $sum.0$2), (if p6$2 then BV32_SUB(0bv32, v2) else $X.0$2);
    p7$1 := (if p6$1 then true else p7$1);
    p7$2 := (if p6$2 then true else p7$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $6;

  $6:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$lds ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$lds ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$lds ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 32} p7$1 ==> true;
    v20$1 := (if p7$1 then BV32_SLE($X.0$1, v2) else v20$1);
    v20$2 := (if p7$2 then BV32_SLE($X.0$2, v2) else v20$2);
    p8$1 := false;
    p8$2 := false;
    p8$1 := (if p7$1 && v20$1 then v20$1 else p8$1);
    p8$2 := (if p7$2 && v20$2 then v20$2 else p8$2);
    p7$1 := (if p7$1 && !v20$1 then v20$1 else p7$1);
    p7$2 := (if p7$2 && !v20$2 then v20$2 else p7$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$lds(p8$1, BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $X.0$1), v2), 4bv32), $$lds[1bv1][BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $X.0$1), v2), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$lds(p8$2, BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $X.0$2), v2), 4bv32), $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $X.0$2), v2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$lds"} true;
    v21$1 := (if p8$1 then $$lds[1bv1][BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $X.0$1), v2), 4bv32)] else v21$1);
    v21$2 := (if p8$2 then $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $X.0$2), v2), 4bv32)] else v21$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_READ_$$lds(p8$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $X.0$1), v2), 4bv32), 1bv32), $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $X.0$1), v2), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 35} _CHECK_READ_$$lds(p8$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $X.0$2), v2), 4bv32), 1bv32), $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $X.0$2), v2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$lds"} true;
    v22$1 := (if p8$1 then $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $X.0$1), v2), 4bv32), 1bv32)] else v22$1);
    v22$2 := (if p8$2 then $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $X.0$2), v2), 4bv32), 1bv32)] else v22$2);
    call {:sourceloc} {:sourceloc_num 36} _LOG_READ_$$lds(p8$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $X.0$1), v2), 4bv32), 2bv32), $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $X.0$1), v2), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 36} _CHECK_READ_$$lds(p8$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $X.0$2), v2), 4bv32), 2bv32), $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $X.0$2), v2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$lds"} true;
    v23$1 := (if p8$1 then $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $X.0$1), v2), 4bv32), 2bv32)] else v23$1);
    v23$2 := (if p8$2 then $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $X.0$2), v2), 4bv32), 2bv32)] else v23$2);
    call {:sourceloc} {:sourceloc_num 37} _LOG_READ_$$lds(p8$1, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $X.0$1), v2), 4bv32), 3bv32), $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $X.0$1), v2), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 37} _CHECK_READ_$$lds(p8$2, BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $X.0$2), v2), 4bv32), 3bv32), $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $X.0$2), v2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$lds"} true;
    v24$1 := (if p8$1 then $$lds[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$1, $X.0$1), v2), 4bv32), 3bv32)] else v24$1);
    v24$2 := (if p8$2 then $$lds[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_ADD(v3$2, $X.0$2), v2), 4bv32), 3bv32)] else v24$2);
    $sum.0$1, $X.0$1 := (if p8$1 then BV32_ADD($sum.0$1[128:96], BV8_ZEXT32(v24$1)) ++ BV32_ADD($sum.0$1[96:64], BV8_ZEXT32(v23$1)) ++ BV32_ADD($sum.0$1[64:32], BV8_ZEXT32(v22$1)) ++ BV32_ADD($sum.0$1[32:0], BV8_ZEXT32(v21$1)) else $sum.0$1), (if p8$1 then BV32_ADD($X.0$1, 1bv32) else $X.0$1);
    $sum.0$2, $X.0$2 := (if p8$2 then BV32_ADD($sum.0$2[128:96], BV8_ZEXT32(v24$2)) ++ BV32_ADD($sum.0$2[96:64], BV8_ZEXT32(v23$2)) ++ BV32_ADD($sum.0$2[64:32], BV8_ZEXT32(v22$2)) ++ BV32_ADD($sum.0$2[32:0], BV8_ZEXT32(v21$2)) else $sum.0$2), (if p8$2 then BV32_ADD($X.0$2, 1bv32) else $X.0$2);
    p7$1 := (if p8$1 then true else p7$1);
    p7$2 := (if p8$2 then true else p7$2);
    goto $6.backedge, $6.tail;

  $6.tail:
    assume !p7$1 && !p7$2;
    call {:sourceloc} {:sourceloc_num 40} _LOG_WRITE_$$outputImage(p6$1, BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32), BV32_SDIV($sum.0$1[32:0], $filterWidth)[8:0], $$outputImage[BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p6$2, BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 40} _CHECK_WRITE_$$outputImage(p6$2, BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32), BV32_SDIV($sum.0$2[32:0], $filterWidth)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32)] := (if p6$1 then BV32_SDIV($sum.0$1[32:0], $filterWidth)[8:0] else $$outputImage[BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32)]);
    $$outputImage[BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32)] := (if p6$2 then BV32_SDIV($sum.0$2[32:0], $filterWidth)[8:0] else $$outputImage[BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32)]);
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$outputImage(p6$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32), 1bv32), BV32_SDIV($sum.0$1[64:32], $filterWidth)[8:0], $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p6$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$outputImage(p6$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32), 1bv32), BV32_SDIV($sum.0$2[64:32], $filterWidth)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32), 1bv32)] := (if p6$1 then BV32_SDIV($sum.0$1[64:32], $filterWidth)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32), 1bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32), 1bv32)] := (if p6$2 then BV32_SDIV($sum.0$2[64:32], $filterWidth)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$outputImage(p6$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32), 2bv32), BV32_SDIV($sum.0$1[96:64], $filterWidth)[8:0], $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p6$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$outputImage(p6$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32), 2bv32), BV32_SDIV($sum.0$2[96:64], $filterWidth)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32), 2bv32)] := (if p6$1 then BV32_SDIV($sum.0$1[96:64], $filterWidth)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32), 2bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32), 2bv32)] := (if p6$2 then BV32_SDIV($sum.0$2[96:64], $filterWidth)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 43} _LOG_WRITE_$$outputImage(p6$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32), 3bv32), BV32_SDIV($sum.0$1[128:96], $filterWidth)[8:0], $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p6$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 43} _CHECK_WRITE_$$outputImage(p6$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32), 3bv32), BV32_SDIV($sum.0$2[128:96], $filterWidth)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32), 3bv32)] := (if p6$1 then BV32_SDIV($sum.0$1[128:96], $filterWidth)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1)), 4bv32), 3bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32), 3bv32)] := (if p6$2 then BV32_SDIV($sum.0$2[128:96], $filterWidth)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1)), 4bv32), 3bv32)]);
    return;

  $6.backedge:
    assume {:backedge} p7$1 || p7$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $6;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1024bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$lds, $$outputImage, _TRACKING;



const _WATCHED_VALUE_$$inputImage: bv8;

procedure {:inline 1} _LOG_READ_$$inputImage(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$inputImage;



implementation {:inline 1} _LOG_READ_$$inputImage(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$inputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inputImage == _value then true else _READ_HAS_OCCURRED_$$inputImage);
    return;
}



procedure _CHECK_READ_$$inputImage(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$inputImage);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$inputImage: bool;

procedure {:inline 1} _LOG_WRITE_$$inputImage(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$inputImage, _WRITE_READ_BENIGN_FLAG_$$inputImage;



implementation {:inline 1} _LOG_WRITE_$$inputImage(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$inputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inputImage == _value then true else _WRITE_HAS_OCCURRED_$$inputImage);
    _WRITE_READ_BENIGN_FLAG_$$inputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inputImage == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$inputImage);
    return;
}



procedure _CHECK_WRITE_$$inputImage(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inputImage != _value);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inputImage != _value);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$inputImage(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$inputImage;



implementation {:inline 1} _LOG_ATOMIC_$$inputImage(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$inputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$inputImage);
    return;
}



procedure _CHECK_ATOMIC_$$inputImage(_P: bool, _offset: bv32);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$inputImage(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$inputImage;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$inputImage(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$inputImage := (if _P && _WRITE_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$inputImage);
    return;
}



const _WATCHED_VALUE_$$outputImage: bv8;

procedure {:inline 1} _LOG_READ_$$outputImage(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$outputImage;



implementation {:inline 1} _LOG_READ_$$outputImage(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$outputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputImage == _value then true else _READ_HAS_OCCURRED_$$outputImage);
    return;
}



procedure _CHECK_READ_$$outputImage(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "outputImage"} {:array "$$outputImage"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$outputImage);
  requires {:source_name "outputImage"} {:array "$$outputImage"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$outputImage: bool;

procedure {:inline 1} _LOG_WRITE_$$outputImage(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$outputImage, _WRITE_READ_BENIGN_FLAG_$$outputImage;



implementation {:inline 1} _LOG_WRITE_$$outputImage(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$outputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputImage == _value then true else _WRITE_HAS_OCCURRED_$$outputImage);
    _WRITE_READ_BENIGN_FLAG_$$outputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputImage == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$outputImage);
    return;
}



procedure _CHECK_WRITE_$$outputImage(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "outputImage"} {:array "$$outputImage"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputImage != _value);
  requires {:source_name "outputImage"} {:array "$$outputImage"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputImage != _value);
  requires {:source_name "outputImage"} {:array "$$outputImage"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$outputImage(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$outputImage;



implementation {:inline 1} _LOG_ATOMIC_$$outputImage(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$outputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$outputImage);
    return;
}



procedure _CHECK_ATOMIC_$$outputImage(_P: bool, _offset: bv32);
  requires {:source_name "outputImage"} {:array "$$outputImage"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset);
  requires {:source_name "outputImage"} {:array "$$outputImage"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$outputImage;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$outputImage := (if _P && _WRITE_HAS_OCCURRED_$$outputImage && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$outputImage);
    return;
}



const _WATCHED_VALUE_$$lds: bv8;

procedure {:inline 1} _LOG_READ_$$lds(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$lds;



implementation {:inline 1} _LOG_READ_$$lds(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$lds := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$lds == _value then true else _READ_HAS_OCCURRED_$$lds);
    return;
}



procedure _CHECK_READ_$$lds(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "lds"} {:array "$$lds"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$lds && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$lds && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lds"} {:array "$$lds"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$lds && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$lds: bool;

procedure {:inline 1} _LOG_WRITE_$$lds(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$lds, _WRITE_READ_BENIGN_FLAG_$$lds;



implementation {:inline 1} _LOG_WRITE_$$lds(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$lds := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$lds == _value then true else _WRITE_HAS_OCCURRED_$$lds);
    _WRITE_READ_BENIGN_FLAG_$$lds := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$lds == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$lds);
    return;
}



procedure _CHECK_WRITE_$$lds(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "lds"} {:array "$$lds"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$lds && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$lds != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lds"} {:array "$$lds"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$lds && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$lds != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lds"} {:array "$$lds"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$lds && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$lds(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$lds;



implementation {:inline 1} _LOG_ATOMIC_$$lds(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$lds := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$lds);
    return;
}



procedure _CHECK_ATOMIC_$$lds(_P: bool, _offset: bv32);
  requires {:source_name "lds"} {:array "$$lds"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$lds && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "lds"} {:array "$$lds"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$lds && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$lds(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$lds;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$lds(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$lds := (if _P && _WRITE_HAS_OCCURRED_$$lds && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$lds);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$lds;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$lds;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$lds;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$outputImage;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$outputImage;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$outputImage;
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
    havoc $$outputImage;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$lds;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
