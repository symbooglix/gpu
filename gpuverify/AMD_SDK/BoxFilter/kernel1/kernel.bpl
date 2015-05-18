type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



axiom {:array_info "$$inputImage"} {:global} {:elem_width 32} {:source_name "inputImage"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$inputImage: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$inputImage: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$inputImage: bool;

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

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

procedure {:source_name "box_filter"} {:kernel} $box_filter($N: bv32);
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



implementation {:source_name "box_filter"} {:kernel} $box_filter($N: bv32)
{
  var $sumA.0$1: bv128;
  var $sumA.0$2: bv128;
  var $sumB.0$1: bv128;
  var $sumB.0$2: bv128;
  var $sumD.0$1: bv128;
  var $sumD.0$2: bv128;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bv32;
  var v3: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v9$1: bv32;
  var v9$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v15$1: bool;
  var v15$2: bool;
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
  var v16$1: bool;
  var v16$2: bool;
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
  var v22$1: bool;
  var v22$2: bool;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27$1: bool;
  var v27$2: bool;
  var v28$1: bool;
  var v28$2: bool;
  var v29$1: bv32;
  var v29$2: bv32;
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
  var p14$1: bool;
  var p14$2: bool;
  var p15$1: bool;
  var p15$2: bool;
  var p16$1: bool;
  var p16$2: bool;
  var p17$1: bool;
  var p17$2: bool;
  var p18$1: bool;
  var p18$2: bool;
  var p19$1: bool;
  var p19$2: bool;
  var p20$1: bool;
  var p20$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    v2 := BV32_MUL(group_size_x, num_groups_x);
    v3 := BV32_UDIV(BV32_SUB($N, 1bv32), 2bv32);
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
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
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
    p14$1 := false;
    p14$2 := false;
    p15$1 := false;
    p15$2 := false;
    p16$1 := false;
    p16$2 := false;
    p17$1 := false;
    p17$2 := false;
    p18$1 := false;
    p18$2 := false;
    p19$1 := false;
    p19$2 := false;
    p20$1 := false;
    p20$2 := false;
    p7$1 := (if v4$1 then v4$1 else p7$1);
    p7$2 := (if v4$2 then v4$2 else p7$2);
    p1$1 := (if !v4$1 then !v4$1 else p1$1);
    p1$2 := (if !v4$2 then !v4$2 else p1$2);
    p7$1 := (if p0$1 then true else p7$1);
    p7$2 := (if p0$2 then true else p7$2);
    v5$1 := (if p1$1 then BV32_SLT(v1$1, v3) else v5$1);
    v5$2 := (if p1$2 then BV32_SLT(v1$2, v3) else v5$2);
    p7$1 := (if p1$1 && v5$1 then v5$1 else p7$1);
    p7$2 := (if p1$2 && v5$2 then v5$2 else p7$2);
    p3$1 := (if p1$1 && !v5$1 then !v5$1 else p3$1);
    p3$2 := (if p1$2 && !v5$2 then !v5$2 else p3$2);
    p7$1 := (if p2$1 then true else p7$1);
    p7$2 := (if p2$2 then true else p7$2);
    v6$1 := (if p3$1 then BV32_SGT(v0$1, BV32_SUB(BV32_SUB(v2, v3), 1bv32)) else v6$1);
    v6$2 := (if p3$2 then BV32_SGT(v0$2, BV32_SUB(BV32_SUB(v2, v3), 1bv32)) else v6$2);
    p7$1 := (if p3$1 && v6$1 then v6$1 else p7$1);
    p7$2 := (if p3$2 && v6$2 then v6$2 else p7$2);
    p5$1 := (if p3$1 && !v6$1 then !v6$1 else p5$1);
    p5$2 := (if p3$2 && !v6$2 then !v6$2 else p5$2);
    p7$1 := (if p4$1 then true else p7$1);
    p7$2 := (if p4$2 then true else p7$2);
    v7$1 := (if p5$1 then BV32_SGT(v1$1, BV32_SUB(BV32_SUB(BV32_MUL(group_size_y, num_groups_y), v3), 1bv32)) else v7$1);
    v7$2 := (if p5$2 then BV32_SGT(v1$2, BV32_SUB(BV32_SUB(BV32_MUL(group_size_y, num_groups_y), v3), 1bv32)) else v7$2);
    p7$1 := (if p5$1 && v7$1 then v7$1 else p7$1);
    p7$2 := (if p5$2 && v7$2 then v7$2 else p7$2);
    p8$1 := (if p5$1 && !v7$1 then !v7$1 else p8$1);
    p8$2 := (if p5$2 && !v7$2 then !v7$2 else p8$2);
    p7$1 := (if p6$1 then true else p7$1);
    p7$2 := (if p6$2 then true else p7$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$outputImage(p7$1, BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 0bv8, $$outputImage[BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p7$2, BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$outputImage(p7$2, BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32)] := (if p7$1 then 0bv8 else $$outputImage[BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32)]);
    $$outputImage[BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32)] := (if p7$2 then 0bv8 else $$outputImage[BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32)]);
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$outputImage(p7$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 1bv32), 0bv8, $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p7$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$outputImage(p7$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 1bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 1bv32)] := (if p7$1 then 0bv8 else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 1bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 1bv32)] := (if p7$2 then 0bv8 else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 7} _LOG_WRITE_$$outputImage(p7$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 2bv32), 0bv8, $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p7$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 7} _CHECK_WRITE_$$outputImage(p7$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 2bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 2bv32)] := (if p7$1 then 0bv8 else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 2bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 2bv32)] := (if p7$2 then 0bv8 else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$outputImage(p7$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 3bv32), 0bv8, $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p7$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$outputImage(p7$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 3bv32), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 3bv32)] := (if p7$1 then 0bv8 else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 3bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 3bv32)] := (if p7$2 then 0bv8 else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 3bv32)]);
    v8$1 := (if p8$1 then BV32_MUL($N, $N) else v8$1);
    v8$2 := (if p8$2 then BV32_MUL($N, $N) else v8$2);
    v9$1 := (if p8$1 then BV32_ADD(v0$1, v3) else v9$1);
    v9$2 := (if p8$2 then BV32_ADD(v0$2, v3) else v9$2);
    v10$1 := (if p8$1 then BV32_ADD(v1$1, v3) else v10$1);
    v10$2 := (if p8$2 then BV32_ADD(v1$2, v3) else v10$2);
    v11$1 := (if p8$1 then BV32_SUB(BV32_SUB(v0$1, v3), 1bv32) else v11$1);
    v11$2 := (if p8$2 then BV32_SUB(BV32_SUB(v0$2, v3), 1bv32) else v11$2);
    v12$1 := (if p8$1 then BV32_SUB(BV32_SUB(v1$1, v3), 1bv32) else v12$1);
    v12$2 := (if p8$2 then BV32_SUB(BV32_SUB(v1$2, v3), 1bv32) else v12$2);
    v13$1 := (if p8$1 then BV32_SUB(BV32_SUB(v1$1, v3), 1bv32) else v13$1);
    v13$2 := (if p8$2 then BV32_SUB(BV32_SUB(v1$2, v3), 1bv32) else v13$2);
    v14$1 := (if p8$1 then BV32_SUB(BV32_SUB(v0$1, v3), 1bv32) else v14$1);
    v14$2 := (if p8$2 then BV32_SUB(BV32_SUB(v0$2, v3), 1bv32) else v14$2);
    v15$1 := (if p8$1 then BV32_SGE(v11$1, 0bv32) else v15$1);
    v15$2 := (if p8$2 then BV32_SGE(v11$2, 0bv32) else v15$2);
    p9$1 := (if p8$1 && v15$1 then v15$1 else p9$1);
    p9$2 := (if p8$2 && v15$2 then v15$2 else p9$2);
    p12$1 := (if p8$1 && !v15$1 then !v15$1 else p12$1);
    p12$2 := (if p8$2 && !v15$2 then !v15$2 else p12$2);
    v16$1 := (if p9$1 then BV32_SGE(v12$1, 0bv32) else v16$1);
    v16$2 := (if p9$2 then BV32_SGE(v12$2, 0bv32) else v16$2);
    p10$1 := (if p9$1 && v16$1 then v16$1 else p10$1);
    p10$2 := (if p9$2 && v16$2 then v16$2 else p10$2);
    p11$1 := (if p9$1 && !v16$1 then !v16$1 else p11$1);
    p11$2 := (if p9$2 && !v16$2 then !v16$2 else p11$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v17$1 := (if p10$1 then _HAVOC_bv32$1 else v17$1);
    v17$2 := (if p10$2 then _HAVOC_bv32$2 else v17$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v18$1 := (if p10$1 then _HAVOC_bv32$1 else v18$1);
    v18$2 := (if p10$2 then _HAVOC_bv32$2 else v18$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v19$1 := (if p10$1 then _HAVOC_bv32$1 else v19$1);
    v19$2 := (if p10$2 then _HAVOC_bv32$2 else v19$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v20$1 := (if p10$1 then _HAVOC_bv32$1 else v20$1);
    v20$2 := (if p10$2 then _HAVOC_bv32$2 else v20$2);
    $sumA.0$1 := (if p10$1 then v20$1 ++ v19$1 ++ v18$1 ++ v17$1 else $sumA.0$1);
    $sumA.0$2 := (if p10$2 then v20$2 ++ v19$2 ++ v18$2 ++ v17$2 else $sumA.0$2);
    $sumA.0$1 := (if p11$1 then 0bv128 else $sumA.0$1);
    $sumA.0$2 := (if p11$2 then 0bv128 else $sumA.0$2);
    $sumA.0$1 := (if p12$1 then 0bv128 else $sumA.0$1);
    $sumA.0$2 := (if p12$2 then 0bv128 else $sumA.0$2);
    v21$1 := (if p8$1 then BV32_SGE(v9$1, 0bv32) else v21$1);
    v21$2 := (if p8$2 then BV32_SGE(v9$2, 0bv32) else v21$2);
    p13$1 := (if p8$1 && v21$1 then v21$1 else p13$1);
    p13$2 := (if p8$2 && v21$2 then v21$2 else p13$2);
    p16$1 := (if p8$1 && !v21$1 then !v21$1 else p16$1);
    p16$2 := (if p8$2 && !v21$2 then !v21$2 else p16$2);
    v22$1 := (if p13$1 then BV32_SGE(v13$1, 0bv32) else v22$1);
    v22$2 := (if p13$2 then BV32_SGE(v13$2, 0bv32) else v22$2);
    p14$1 := (if p13$1 && v22$1 then v22$1 else p14$1);
    p14$2 := (if p13$2 && v22$2 then v22$2 else p14$2);
    p15$1 := (if p13$1 && !v22$1 then !v22$1 else p15$1);
    p15$2 := (if p13$2 && !v22$2 then !v22$2 else p15$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v23$1 := (if p14$1 then _HAVOC_bv32$1 else v23$1);
    v23$2 := (if p14$2 then _HAVOC_bv32$2 else v23$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v24$1 := (if p14$1 then _HAVOC_bv32$1 else v24$1);
    v24$2 := (if p14$2 then _HAVOC_bv32$2 else v24$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v25$1 := (if p14$1 then _HAVOC_bv32$1 else v25$1);
    v25$2 := (if p14$2 then _HAVOC_bv32$2 else v25$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v26$1 := (if p14$1 then _HAVOC_bv32$1 else v26$1);
    v26$2 := (if p14$2 then _HAVOC_bv32$2 else v26$2);
    $sumB.0$1 := (if p14$1 then v26$1 ++ v25$1 ++ v24$1 ++ v23$1 else $sumB.0$1);
    $sumB.0$2 := (if p14$2 then v26$2 ++ v25$2 ++ v24$2 ++ v23$2 else $sumB.0$2);
    $sumB.0$1 := (if p15$1 then 0bv128 else $sumB.0$1);
    $sumB.0$2 := (if p15$2 then 0bv128 else $sumB.0$2);
    $sumB.0$1 := (if p16$1 then 0bv128 else $sumB.0$1);
    $sumB.0$2 := (if p16$2 then 0bv128 else $sumB.0$2);
    v27$1 := (if p8$1 then BV32_SGE(v14$1, 0bv32) else v27$1);
    v27$2 := (if p8$2 then BV32_SGE(v14$2, 0bv32) else v27$2);
    p17$1 := (if p8$1 && v27$1 then v27$1 else p17$1);
    p17$2 := (if p8$2 && v27$2 then v27$2 else p17$2);
    p20$1 := (if p8$1 && !v27$1 then !v27$1 else p20$1);
    p20$2 := (if p8$2 && !v27$2 then !v27$2 else p20$2);
    v28$1 := (if p17$1 then BV32_SGE(v10$1, 0bv32) else v28$1);
    v28$2 := (if p17$2 then BV32_SGE(v10$2, 0bv32) else v28$2);
    p18$1 := (if p17$1 && v28$1 then v28$1 else p18$1);
    p18$2 := (if p17$2 && v28$2 then v28$2 else p18$2);
    p19$1 := (if p17$1 && !v28$1 then !v28$1 else p19$1);
    p19$2 := (if p17$2 && !v28$2 then !v28$2 else p19$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v29$1 := (if p18$1 then _HAVOC_bv32$1 else v29$1);
    v29$2 := (if p18$2 then _HAVOC_bv32$2 else v29$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v30$1 := (if p18$1 then _HAVOC_bv32$1 else v30$1);
    v30$2 := (if p18$2 then _HAVOC_bv32$2 else v30$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v31$1 := (if p18$1 then _HAVOC_bv32$1 else v31$1);
    v31$2 := (if p18$2 then _HAVOC_bv32$2 else v31$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v32$1 := (if p18$1 then _HAVOC_bv32$1 else v32$1);
    v32$2 := (if p18$2 then _HAVOC_bv32$2 else v32$2);
    $sumD.0$1 := (if p18$1 then v32$1 ++ v31$1 ++ v30$1 ++ v29$1 else $sumD.0$1);
    $sumD.0$2 := (if p18$2 then v32$2 ++ v31$2 ++ v30$2 ++ v29$2 else $sumD.0$2);
    $sumD.0$1 := (if p19$1 then 0bv128 else $sumD.0$1);
    $sumD.0$2 := (if p19$2 then 0bv128 else $sumD.0$2);
    $sumD.0$1 := (if p20$1 then 0bv128 else $sumD.0$1);
    $sumD.0$2 := (if p20$2 then 0bv128 else $sumD.0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v33$1 := (if p8$1 then _HAVOC_bv32$1 else v33$1);
    v33$2 := (if p8$2 then _HAVOC_bv32$2 else v33$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v34$1 := (if p8$1 then _HAVOC_bv32$1 else v34$1);
    v34$2 := (if p8$2 then _HAVOC_bv32$2 else v34$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v35$1 := (if p8$1 then _HAVOC_bv32$1 else v35$1);
    v35$2 := (if p8$2 then _HAVOC_bv32$2 else v35$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v36$1 := (if p8$1 then _HAVOC_bv32$1 else v36$1);
    v36$2 := (if p8$2 then _HAVOC_bv32$2 else v36$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$outputImage(p8$1, BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$1[32:0], v33$1), $sumB.0$1[32:0]), $sumD.0$1[32:0]), v8$1)[8:0], $$outputImage[BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p8$2, BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$outputImage(p8$2, BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$2[32:0], v33$2), $sumB.0$2[32:0]), $sumD.0$2[32:0]), v8$2)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32)] := (if p8$1 then BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$1[32:0], v33$1), $sumB.0$1[32:0]), $sumD.0$1[32:0]), v8$1)[8:0] else $$outputImage[BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32)]);
    $$outputImage[BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32)] := (if p8$2 then BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$2[32:0], v33$2), $sumB.0$2[32:0]), $sumD.0$2[32:0]), v8$2)[8:0] else $$outputImage[BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32)]);
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$outputImage(p8$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 1bv32), BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$1[64:32], v34$1), $sumB.0$1[64:32]), $sumD.0$1[64:32]), v8$1)[8:0], $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p8$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$outputImage(p8$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 1bv32), BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$2[64:32], v34$2), $sumB.0$2[64:32]), $sumD.0$2[64:32]), v8$2)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 1bv32)] := (if p8$1 then BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$1[64:32], v34$1), $sumB.0$1[64:32]), $sumD.0$1[64:32]), v8$1)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 1bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 1bv32)] := (if p8$2 then BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$2[64:32], v34$2), $sumB.0$2[64:32]), $sumD.0$2[64:32]), v8$2)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$outputImage(p8$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 2bv32), BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$1[96:64], v35$1), $sumB.0$1[96:64]), $sumD.0$1[96:64]), v8$1)[8:0], $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p8$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$outputImage(p8$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 2bv32), BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$2[96:64], v35$2), $sumB.0$2[96:64]), $sumD.0$2[96:64]), v8$2)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 2bv32)] := (if p8$1 then BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$1[96:64], v35$1), $sumB.0$1[96:64]), $sumD.0$1[96:64]), v8$1)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 2bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 2bv32)] := (if p8$2 then BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$2[96:64], v35$2), $sumB.0$2[96:64]), $sumD.0$2[96:64]), v8$2)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 38} _LOG_WRITE_$$outputImage(p8$1, BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 3bv32), BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$1[128:96], v36$1), $sumB.0$1[128:96]), $sumD.0$1[128:96]), v8$1)[8:0], $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputImage(p8$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 38} _CHECK_WRITE_$$outputImage(p8$2, BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 3bv32), BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$2[128:96], v36$2), $sumB.0$2[128:96]), $sumD.0$2[128:96]), v8$2)[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputImage"} true;
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 3bv32)] := (if p8$1 then BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$1[128:96], v36$1), $sumB.0$1[128:96]), $sumD.0$1[128:96]), v8$1)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$1, BV32_MUL(v1$1, v2)), 4bv32), 3bv32)]);
    $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 3bv32)] := (if p8$2 then BV32_SDIV(BV32_SUB(BV32_SUB(BV32_ADD($sumA.0$2[128:96], v36$2), $sumB.0$2[128:96]), $sumD.0$2[128:96]), v8$2)[8:0] else $$outputImage[BV32_ADD(BV32_MUL(BV32_ADD(v0$2, BV32_MUL(v1$2, v2)), 4bv32), 3bv32)]);
    return;
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

const _WATCHED_VALUE_$$inputImage: bv32;

procedure {:inline 1} _LOG_READ_$$inputImage(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$inputImage;



implementation {:inline 1} _LOG_READ_$$inputImage(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$inputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inputImage == _value then true else _READ_HAS_OCCURRED_$$inputImage);
    return;
}



procedure _CHECK_READ_$$inputImage(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$inputImage);
  requires {:source_name "inputImage"} {:array "$$inputImage"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$inputImage && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$inputImage: bool;

procedure {:inline 1} _LOG_WRITE_$$inputImage(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$inputImage, _WRITE_READ_BENIGN_FLAG_$$inputImage;



implementation {:inline 1} _LOG_WRITE_$$inputImage(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$inputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inputImage == _value then true else _WRITE_HAS_OCCURRED_$$inputImage);
    _WRITE_READ_BENIGN_FLAG_$$inputImage := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$inputImage == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$inputImage);
    return;
}



procedure _CHECK_WRITE_$$inputImage(_P: bool, _offset: bv32, _value: bv32);
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
