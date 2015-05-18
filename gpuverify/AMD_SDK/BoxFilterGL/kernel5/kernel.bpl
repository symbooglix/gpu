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

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "zero_extend 24"} BV8_ZEXT32(bv8) : bv32;

procedure {:source_name "box_filter_horizontal"} {:kernel} $box_filter_horizontal($filterWidth: bv32);
  requires !_READ_HAS_OCCURRED_$$inputImage && !_WRITE_HAS_OCCURRED_$$inputImage && !_ATOMIC_HAS_OCCURRED_$$inputImage;
  requires !_READ_HAS_OCCURRED_$$outputImage && !_WRITE_HAS_OCCURRED_$$outputImage && !_ATOMIC_HAS_OCCURRED_$$outputImage;
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
  modifies _WRITE_HAS_OCCURRED_$$outputImage, _WRITE_READ_BENIGN_FLAG_$$outputImage, _WRITE_READ_BENIGN_FLAG_$$outputImage;



implementation {:source_name "box_filter_horizontal"} {:kernel} $box_filter_horizontal($filterWidth: bv32)
{
  var $sum.0$1: bv128;
  var $sum.0$2: bv128;
  var $X.0$1: bv32;
  var $X.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bool;
  var v6$2: bool;
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
  var v18$1: bv8;
  var v18$2: bv8;
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
  var _HAVOC_bv8$1: bv8;
  var _HAVOC_bv8$2: bv8;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1 := BV32_MUL(group_size_x, num_groups_x);
    v2$1 := BV32_ADD(v0$1, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1), v1));
    v2$2 := BV32_ADD(v0$2, BV32_MUL(BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2), v1));
    v3 := BV32_SDIV(BV32_SUB($filterWidth, 1bv32), 2bv32);
    v4$1 := BV32_SLT(v0$1, v3);
    v4$2 := BV32_SLT(v0$2, v3);
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
    p3$1 := (if v4$1 then v4$1 else p3$1);
    p3$2 := (if v4$2 then v4$2 else p3$2);
    p1$1 := (if !v4$1 then !v4$1 else p1$1);
    p1$2 := (if !v4$2 then !v4$2 else p1$2);
    p3$1 := (if p0$1 then true else p3$1);
    p3$2 := (if p0$2 then true else p3$2);
    v5$1 := (if p1$1 then BV32_SGE(v0$1, BV32_SUB(v1, v3)) else v5$1);
    v5$2 := (if p1$2 then BV32_SGE(v0$2, BV32_SUB(v1, v3)) else v5$2);
    p3$1 := (if p1$1 && v5$1 then v5$1 else p3$1);
    p3$2 := (if p1$2 && v5$2 then v5$2 else p3$2);
    p4$1 := (if p1$1 && !v5$1 then !v5$1 else p4$1);
    p4$2 := (if p1$2 && !v5$2 then !v5$2 else p4$2);
    p3$1 := (if p2$1 then true else p3$1);
    p3$2 := (if p2$2 then true else p3$2);
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$outputImage(p3$1, BV32_MUL(v2$1, 4bv32), 0bv8, $$outputImage[BV32_MUL(v2$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p3$2, BV32_MUL(v2$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$outputImage(p3$2, BV32_MUL(v2$2, 4bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_MUL(v2$1, 4bv32)] := (if p3$1 then 0bv8 else $$outputImage[BV32_MUL(v2$1, 4bv32)]);
    $$outputImage[BV32_MUL(v2$2, 4bv32)] := (if p3$2 then 0bv8 else $$outputImage[BV32_MUL(v2$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$outputImage(p3$1, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), 0bv8, $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p3$2, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$outputImage(p3$2, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)] := (if p3$1 then 0bv8 else $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)] := (if p3$2 then 0bv8 else $$outputImage[BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$outputImage(p3$1, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), 0bv8, $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p3$2, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$outputImage(p3$2, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)] := (if p3$1 then 0bv8 else $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)] := (if p3$2 then 0bv8 else $$outputImage[BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$outputImage(p3$1, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), 0bv8, $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p3$2, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$outputImage(p3$2, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)] := (if p3$1 then 0bv8 else $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)] := (if p3$2 then 0bv8 else $$outputImage[BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)]);
    $sum.0$1, $X.0$1 := (if p4$1 then 0bv128 else $sum.0$1), (if p4$1 then BV32_SUB(0bv32, v3) else $X.0$1);
    $sum.0$2, $X.0$2 := (if p4$2 then 0bv128 else $sum.0$2), (if p4$2 then BV32_SUB(0bv32, v3) else $X.0$2);
    p5$1 := (if p4$1 then true else p5$1);
    p5$2 := (if p4$2 then true else p5$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $4;

  $4:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 8} p5$1 ==> true;
    v6$1 := (if p5$1 then BV32_SLT($X.0$1, v3) else v6$1);
    v6$2 := (if p5$2 then BV32_SLT($X.0$2, v3) else v6$2);
    p6$1 := false;
    p6$2 := false;
    p6$1 := (if p5$1 && v6$1 then v6$1 else p6$1);
    p6$2 := (if p5$2 && v6$2 then v6$2 else p6$2);
    p5$1 := (if p5$1 && !v6$1 then v6$1 else p5$1);
    p5$2 := (if p5$2 && !v6$2 then v6$2 else p5$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v7$1 := (if p6$1 then _HAVOC_bv8$1 else v7$1);
    v7$2 := (if p6$2 then _HAVOC_bv8$2 else v7$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v8$1 := (if p6$1 then _HAVOC_bv8$1 else v8$1);
    v8$2 := (if p6$2 then _HAVOC_bv8$2 else v8$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v9$1 := (if p6$1 then _HAVOC_bv8$1 else v9$1);
    v9$2 := (if p6$2 then _HAVOC_bv8$2 else v9$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v10$1 := (if p6$1 then _HAVOC_bv8$1 else v10$1);
    v10$2 := (if p6$2 then _HAVOC_bv8$2 else v10$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v11$1 := (if p6$1 then _HAVOC_bv8$1 else v11$1);
    v11$2 := (if p6$2 then _HAVOC_bv8$2 else v11$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v12$1 := (if p6$1 then _HAVOC_bv8$1 else v12$1);
    v12$2 := (if p6$2 then _HAVOC_bv8$2 else v12$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v13$1 := (if p6$1 then _HAVOC_bv8$1 else v13$1);
    v13$2 := (if p6$2 then _HAVOC_bv8$2 else v13$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v14$1 := (if p6$1 then _HAVOC_bv8$1 else v14$1);
    v14$2 := (if p6$2 then _HAVOC_bv8$2 else v14$2);
    $sum.0$1, $X.0$1 := (if p6$1 then BV32_ADD(BV32_ADD($sum.0$1[128:96], BV8_ZEXT32(v10$1)), BV8_ZEXT32(v14$1)) ++ BV32_ADD(BV32_ADD($sum.0$1[96:64], BV8_ZEXT32(v9$1)), BV8_ZEXT32(v13$1)) ++ BV32_ADD(BV32_ADD($sum.0$1[64:32], BV8_ZEXT32(v8$1)), BV8_ZEXT32(v12$1)) ++ BV32_ADD(BV32_ADD($sum.0$1[32:0], BV8_ZEXT32(v7$1)), BV8_ZEXT32(v11$1)) else $sum.0$1), (if p6$1 then BV32_ADD($X.0$1, 2bv32) else $X.0$1);
    $sum.0$2, $X.0$2 := (if p6$2 then BV32_ADD(BV32_ADD($sum.0$2[128:96], BV8_ZEXT32(v10$2)), BV8_ZEXT32(v14$2)) ++ BV32_ADD(BV32_ADD($sum.0$2[96:64], BV8_ZEXT32(v9$2)), BV8_ZEXT32(v13$2)) ++ BV32_ADD(BV32_ADD($sum.0$2[64:32], BV8_ZEXT32(v8$2)), BV8_ZEXT32(v12$2)) ++ BV32_ADD(BV32_ADD($sum.0$2[32:0], BV8_ZEXT32(v7$2)), BV8_ZEXT32(v11$2)) else $sum.0$2), (if p6$2 then BV32_ADD($X.0$2, 2bv32) else $X.0$2);
    p5$1 := (if p6$1 then true else p5$1);
    p5$2 := (if p6$2 then true else p5$2);
    goto $4.backedge, $4.tail;

  $4.tail:
    assume !p5$1 && !p5$2;
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v15$1 := (if p4$1 then _HAVOC_bv8$1 else v15$1);
    v15$2 := (if p4$2 then _HAVOC_bv8$2 else v15$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v16$1 := (if p4$1 then _HAVOC_bv8$1 else v16$1);
    v16$2 := (if p4$2 then _HAVOC_bv8$2 else v16$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v17$1 := (if p4$1 then _HAVOC_bv8$1 else v17$1);
    v17$2 := (if p4$2 then _HAVOC_bv8$2 else v17$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v18$1 := (if p4$1 then _HAVOC_bv8$1 else v18$1);
    v18$2 := (if p4$2 then _HAVOC_bv8$2 else v18$2);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$outputImage(p4$1, BV32_MUL(v2$1, 4bv32), BV32_SDIV(BV32_ADD($sum.0$1[32:0], BV8_ZEXT32(v15$1)), $filterWidth)[8:0], $$outputImage[BV32_MUL(v2$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p4$2, BV32_MUL(v2$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$outputImage(p4$2, BV32_MUL(v2$2, 4bv32), BV32_SDIV(BV32_ADD($sum.0$2[32:0], BV8_ZEXT32(v15$2)), $filterWidth)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_MUL(v2$1, 4bv32)] := (if p4$1 then BV32_SDIV(BV32_ADD($sum.0$1[32:0], BV8_ZEXT32(v15$1)), $filterWidth)[8:0] else $$outputImage[BV32_MUL(v2$1, 4bv32)]);
    $$outputImage[BV32_MUL(v2$2, 4bv32)] := (if p4$2 then BV32_SDIV(BV32_ADD($sum.0$2[32:0], BV8_ZEXT32(v15$2)), $filterWidth)[8:0] else $$outputImage[BV32_MUL(v2$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 25} _LOG_WRITE_$$outputImage(p4$1, BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32), BV32_SDIV(BV32_ADD($sum.0$1[64:32], BV8_ZEXT32(v16$1)), $filterWidth)[8:0], $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p4$2, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 25} _CHECK_WRITE_$$outputImage(p4$2, BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32), BV32_SDIV(BV32_ADD($sum.0$2[64:32], BV8_ZEXT32(v16$2)), $filterWidth)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)] := (if p4$1 then BV32_SDIV(BV32_ADD($sum.0$1[64:32], BV8_ZEXT32(v16$1)), $filterWidth)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 1bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)] := (if p4$2 then BV32_SDIV(BV32_ADD($sum.0$2[64:32], BV8_ZEXT32(v16$2)), $filterWidth)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(v2$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$outputImage(p4$1, BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32), BV32_SDIV(BV32_ADD($sum.0$1[96:64], BV8_ZEXT32(v17$1)), $filterWidth)[8:0], $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p4$2, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$outputImage(p4$2, BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32), BV32_SDIV(BV32_ADD($sum.0$2[96:64], BV8_ZEXT32(v17$2)), $filterWidth)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)] := (if p4$1 then BV32_SDIV(BV32_ADD($sum.0$1[96:64], BV8_ZEXT32(v17$1)), $filterWidth)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 2bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)] := (if p4$2 then BV32_SDIV(BV32_ADD($sum.0$2[96:64], BV8_ZEXT32(v17$2)), $filterWidth)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(v2$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$outputImage(p4$1, BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32), BV32_SDIV(BV32_ADD($sum.0$1[128:96], BV8_ZEXT32(v18$1)), $filterWidth)[8:0], $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p4$2, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$outputImage(p4$2, BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32), BV32_SDIV(BV32_ADD($sum.0$2[128:96], BV8_ZEXT32(v18$2)), $filterWidth)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)] := (if p4$1 then BV32_SDIV(BV32_ADD($sum.0$1[128:96], BV8_ZEXT32(v18$1)), $filterWidth)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(v2$1, 4bv32), 3bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)] := (if p4$2 then BV32_SDIV(BV32_ADD($sum.0$2[128:96], BV8_ZEXT32(v18$2)), $filterWidth)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(v2$2, 4bv32), 3bv32)]);
    return;

  $4.backedge:
    assume {:backedge} p5$1 || p5$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $4;
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



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
