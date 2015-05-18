type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP16(x: [bv32]bv16, y: bv32) returns (z$1: bv16, A$1: [bv32]bv16, z$2: bv16, A$2: [bv32]bv16);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "blk_sad"} {:global} $$blk_sad: [bv32]bv16;

axiom {:array_info "$$blk_sad"} {:global} {:elem_width 16} {:source_name "blk_sad"} {:source_elem_width 16} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 16} {:source_elem_width 16} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$blk_sad: bool;

var {:race_checking} {:global} {:elem_width 16} {:source_elem_width 16} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$blk_sad: bool;

var {:race_checking} {:global} {:elem_width 16} {:source_elem_width 16} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$blk_sad: bool;

axiom {:array_info "$$frame"} {:global} {:elem_width 16} {:source_name "frame"} {:source_elem_width 16} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 16} {:source_elem_width 16} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$frame: bool;

var {:race_checking} {:global} {:elem_width 16} {:source_elem_width 16} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$frame: bool;

var {:race_checking} {:global} {:elem_width 16} {:source_elem_width 16} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$frame: bool;

axiom {:array_info "$$img_ref"} {:global} {:elem_width 8} {:source_name "img_ref"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$img_ref: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$img_ref: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$img_ref: bool;

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

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvurem"} BV32_UREM(bv32, bv32) : bv32;

function {:bvbuiltin "zero_extend 16"} BV16_ZEXT32(bv16) : bv32;

procedure {:source_name "mb_sad_calc"} {:kernel} $mb_sad_calc($mb_width: bv32, $mb_height: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $mb_width == 11bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $mb_height == 9bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$blk_sad && !_WRITE_HAS_OCCURRED_$$blk_sad && !_ATOMIC_HAS_OCCURRED_$$blk_sad;
  requires !_READ_HAS_OCCURRED_$$frame && !_WRITE_HAS_OCCURRED_$$frame && !_ATOMIC_HAS_OCCURRED_$$frame;
  requires !_READ_HAS_OCCURRED_$$img_ref && !_WRITE_HAS_OCCURRED_$$img_ref && !_ATOMIC_HAS_OCCURRED_$$img_ref;
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
  modifies _WRITE_HAS_OCCURRED_$$blk_sad, _WRITE_READ_BENIGN_FLAG_$$blk_sad, _WRITE_READ_BENIGN_FLAG_$$blk_sad;



implementation {:source_name "mb_sad_calc"} {:kernel} $mb_sad_calc($mb_width: bv32, $mb_height: bv32)
{
  var $search_pos_end.0$1: bv32;
  var $search_pos_end.0$2: bv32;
  var $search_pos.0$1: bv32;
  var $search_pos.0$2: bv32;
  var $sad4x4.0$1: bv16;
  var $sad4x4.0$2: bv16;
  var $y.0$1: bv32;
  var $y.0$2: bv32;
  var $sad4x4.1$1: bv16;
  var $sad4x4.1$2: bv16;
  var $x.0$1: bv32;
  var $x.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $1$1: bv32;
  var $1$2: bv32;
  var $2$1: bv32;
  var $2$2: bv32;
  var $3$1: bv32;
  var $3$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bool;
  var v10$2: bool;
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
  var v16$1: bool;
  var v16$2: bool;
  var v17$1: bool;
  var v17$2: bool;
  var v18$1: bool;
  var v18$2: bool;
  var v19$1: bool;
  var v19$2: bool;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bool;
  var v22$2: bool;
  var v23$1: bool;
  var v23$2: bool;
  var v24$1: bool;
  var v24$2: bool;
  var v25$1: bool;
  var v25$2: bool;
  var v26$1: bv8;
  var v26$2: bv8;
  var v27$1: bv8;
  var v27$2: bv8;
  var v28$1: bv8;
  var v28$2: bv8;
  var v29$1: bv8;
  var v29$2: bv8;
  var v30$1: bv8;
  var v30$2: bv8;
  var v31$1: bv8;
  var v31$2: bv8;
  var v32$1: bv8;
  var v32$2: bv8;
  var v33$1: bv8;
  var v33$2: bv8;
  var v34$1: bv8;
  var v34$2: bv8;
  var v35$1: bv8;
  var v35$2: bv8;
  var v36$1: bv8;
  var v36$2: bv8;
  var v37$1: bv8;
  var v37$2: bv8;
  var v38$1: bv8;
  var v38$2: bv8;
  var v39$1: bv8;
  var v39$2: bv8;
  var v40$1: bv8;
  var v40$2: bv8;
  var v41$1: bv8;
  var v41$2: bv8;
  var v42$1: bv16;
  var v42$2: bv16;
  var v43$1: bv32;
  var v43$2: bv32;
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
  var _HAVOC_bv8$1: bv8;
  var _HAVOC_bv8$2: bv8;
  var _HAVOC_bv16$1: bv16;
  var _HAVOC_bv16$2: bv16;


  $0:
    v0$1 := BV32_UREM(BV32_UDIV(local_id_x$1, 61bv32), 1bv32);
    v0$2 := BV32_UREM(BV32_UDIV(local_id_x$2, 61bv32), 1bv32);
    v1$1 := BV32_UDIV(BV32_UDIV(local_id_x$1, 61bv32), 1bv32);
    v1$2 := BV32_UDIV(BV32_UDIV(local_id_x$2, 61bv32), 1bv32);
    v2$1 := group_id_x$1;
    v2$2 := group_id_x$2;
    v3$1 := group_id_y$1;
    v3$2 := group_id_y$2;
    v4 := BV32_MUL($mb_width, 16bv32);
    v5$1 := BV32_ASHR(BV32_ADD(v0$1, v2$1), 2bv32);
    v5$2 := BV32_ASHR(BV32_ADD(v0$2, v2$2), 2bv32);
    v6$1 := BV32_ASHR(BV32_ADD(v1$1, v3$1), 2bv32);
    v6$2 := BV32_ASHR(BV32_ADD(v1$2, v3$2), 2bv32);
    v7$1 := BV32_AND(BV32_ADD(v0$1, v2$1), 3bv32);
    v7$2 := BV32_AND(BV32_ADD(v0$2, v2$2), 3bv32);
    v8$1 := BV32_AND(BV32_ADD(v1$1, v3$1), 3bv32);
    v8$2 := BV32_AND(BV32_ADD(v1$2, v3$2), 3bv32);
    v9$1 := BV32_SLT(v5$1, $mb_width);
    v9$2 := BV32_SLT(v5$2, $mb_width);
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
    p18$1 := false;
    p18$2 := false;
    p19$1 := false;
    p19$2 := false;
    p0$1 := (if v9$1 then v9$1 else p0$1);
    p0$2 := (if v9$2 then v9$2 else p0$2);
    v10$1 := (if p0$1 then BV32_SLT(v6$1, $mb_height) else v10$1);
    v10$2 := (if p0$2 then BV32_SLT(v6$2, $mb_height) else v10$2);
    p1$1 := (if p0$1 && v10$1 then v10$1 else p1$1);
    p1$2 := (if p0$2 && v10$2 then v10$2 else p1$2);
    v11$1 := (if p1$1 then BV32_SHL(BV32_ADD(BV32_SHL(v5$1, 2bv32), v7$1), 2bv32) else v11$1);
    v11$2 := (if p1$2 then BV32_SHL(BV32_ADD(BV32_SHL(v5$2, 2bv32), v7$2), 2bv32) else v11$2);
    v12$1 := (if p1$1 then BV32_SHL(BV32_ADD(BV32_SHL(v6$1, 2bv32), v8$1), 2bv32) else v12$1);
    v12$2 := (if p1$2 then BV32_SHL(BV32_ADD(BV32_SHL(v6$2, 2bv32), v8$2), 2bv32) else v12$2);
    v13$1 := (if p1$1 then BV32_MUL(BV32_UREM(local_id_x$1, 61bv32), 18bv32) else v13$1);
    v13$2 := (if p1$2 then BV32_MUL(BV32_UREM(local_id_x$2, 61bv32), 18bv32) else v13$2);
    v14$1 := (if p1$1 then BV32_ADD(v13$1, 18bv32) else v14$1);
    v14$2 := (if p1$2 then BV32_ADD(v13$2, 18bv32) else v14$2);
    v15$1 := (if p1$1 then BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_MUL($mb_width, $mb_height), 1096bv32), 25bv32), BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v6$1, $mb_width), v5$1), 1096bv32), 16bv32)), BV32_MUL(BV32_ADD(BV32_MUL(4bv32, v8$1), v7$1), 1096bv32)) else v15$1);
    v15$2 := (if p1$2 then BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_MUL($mb_width, $mb_height), 1096bv32), 25bv32), BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(v6$2, $mb_width), v5$2), 1096bv32), 16bv32)), BV32_MUL(BV32_ADD(BV32_MUL(4bv32, v8$2), v7$2), 1096bv32)) else v15$2);
    v16$1 := (if p1$1 then BV32_SGT(v14$1, 1089bv32) else v16$1);
    v16$2 := (if p1$2 then BV32_SGT(v14$2, 1089bv32) else v16$2);
    p2$1 := (if p1$1 && v16$1 then v16$1 else p2$1);
    p2$2 := (if p1$2 && v16$2 then v16$2 else p2$2);
    p3$1 := (if p1$1 && !v16$1 then !v16$1 else p3$1);
    p3$2 := (if p1$2 && !v16$2 then !v16$2 else p3$2);
    $search_pos_end.0$1 := (if p2$1 then 1089bv32 else $search_pos_end.0$1);
    $search_pos_end.0$2 := (if p2$2 then 1089bv32 else $search_pos_end.0$2);
    $search_pos_end.0$1 := (if p3$1 then v14$1 else $search_pos_end.0$1);
    $search_pos_end.0$2 := (if p3$2 then v14$2 else $search_pos_end.0$2);
    $search_pos.0$1 := (if p1$1 then v13$1 else $search_pos.0$1);
    $search_pos.0$2 := (if p1$2 then v13$2 else $search_pos.0$2);
    p4$1 := (if p1$1 then true else p4$1);
    p4$2 := (if p1$2 then true else p4$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p4$1 ==> _b10 ==> p4$1 ==> BV32_SLT(BV32_ASHR(BV32_ADD(BV32_UREM(BV32_UDIV(local_id_x$1, 61bv32), 1bv32), group_id_x$1), 2bv32), $mb_width) && BV32_SLT(BV32_ASHR(BV32_ADD(BV32_UDIV(BV32_UDIV(local_id_x$1, 61bv32), 1bv32), group_id_y$1), 2bv32), $mb_height);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p4$2 ==> _b10 ==> p4$2 ==> BV32_SLT(BV32_ASHR(BV32_ADD(BV32_UREM(BV32_UDIV(local_id_x$2, 61bv32), 1bv32), group_id_x$2), 2bv32), $mb_width) && BV32_SLT(BV32_ASHR(BV32_ADD(BV32_UDIV(BV32_UDIV(local_id_x$2, 61bv32), 1bv32), group_id_y$2), 2bv32), $mb_height);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b9 ==> BV32_SLT(BV32_ASHR(BV32_ADD(BV32_UREM(BV32_UDIV(local_id_x$1, 61bv32), 1bv32), group_id_x$1), 2bv32), $mb_width) && BV32_SLT(BV32_ASHR(BV32_ADD(BV32_UDIV(BV32_UDIV(local_id_x$1, 61bv32), 1bv32), group_id_y$1), 2bv32), $mb_height) && BV32_SLT($search_pos.0$1, $search_pos_end.0$1) ==> p4$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b9 ==> BV32_SLT(BV32_ASHR(BV32_ADD(BV32_UREM(BV32_UDIV(local_id_x$2, 61bv32), 1bv32), group_id_x$2), 2bv32), $mb_width) && BV32_SLT(BV32_ASHR(BV32_ADD(BV32_UDIV(BV32_UDIV(local_id_x$2, 61bv32), 1bv32), group_id_y$2), 2bv32), $mb_height) && BV32_SLT($search_pos.0$2, $search_pos_end.0$2) ==> p4$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b8 ==> !BV32_SLT(v5$1, $mb_width) || !BV32_SLT(v6$1, $mb_height) ==> !_READ_HAS_OCCURRED_$$frame;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b7 ==> !BV32_SLT(v5$1, $mb_width) || !BV32_SLT(v6$1, $mb_height) ==> !_READ_HAS_OCCURRED_$$img_ref;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b6 ==> !BV32_SLT(v5$1, $mb_width) || !BV32_SLT(v6$1, $mb_height) ==> !_WRITE_HAS_OCCURRED_$$blk_sad;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b5 ==> !BV32_SLT(v5$1, $mb_width) || !BV32_SLT(v6$1, $mb_height) ==> !p4$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b5 ==> !BV32_SLT(v5$2, $mb_width) || !BV32_SLT(v6$2, $mb_height) ==> !p4$2;
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b4 ==> BV32_UGE($search_pos.0$1, v13$1);
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b4 ==> BV32_UGE($search_pos.0$2, v13$2);
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b3 ==> BV32_ULE($search_pos.0$1, v13$1);
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b3 ==> BV32_ULE($search_pos.0$2, v13$2);
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b2 ==> BV32_SGE($search_pos.0$1, v13$1);
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b2 ==> BV32_SGE($search_pos.0$2, v13$2);
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b1 ==> BV32_SLE($search_pos.0$1, v13$1);
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b1 ==> BV32_SLE($search_pos.0$2, v13$2);
    assert {:tag "guardNonNeg"} {:thread 1} p4$1 ==> _b0 ==> BV32_SLE(0bv32, $search_pos.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p4$2 ==> _b0 ==> BV32_SLE(0bv32, $search_pos.0$2);
    assert {:block_sourceloc} {:sourceloc_num 7} p4$1 ==> true;
    v17$1 := (if p4$1 then BV32_SLT($search_pos.0$1, $search_pos_end.0$1) else v17$1);
    v17$2 := (if p4$2 then BV32_SLT($search_pos.0$2, $search_pos_end.0$2) else v17$2);
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p5$1 := (if p4$1 && v17$1 then v17$1 else p5$1);
    p5$2 := (if p4$2 && v17$2 then v17$2 else p5$2);
    p4$1 := (if p4$1 && !v17$1 then v17$1 else p4$1);
    p4$2 := (if p4$2 && !v17$2 then v17$2 else p4$2);
    $sad4x4.0$1, $y.0$1 := (if p5$1 then 0bv16 else $sad4x4.0$1), (if p5$1 then 0bv32 else $y.0$1);
    $sad4x4.0$2, $y.0$2 := (if p5$2 then 0bv16 else $sad4x4.0$2), (if p5$2 then 0bv32 else $y.0$2);
    p6$1 := (if p5$1 then true else p6$1);
    p6$2 := (if p5$2 then true else p6$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_1"} true;
    assume {:invGenSkippedLoop} true;
    assert p6$1 ==> p4$1;
    assert p6$2 ==> p4$2;
    assert {:block_sourceloc} {:sourceloc_num 9} p6$1 ==> true;
    v18$1 := (if p6$1 then BV32_SLT($y.0$1, 4bv32) else v18$1);
    v18$2 := (if p6$2 then BV32_SLT($y.0$2, 4bv32) else v18$2);
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    p7$1 := (if p6$1 && v18$1 then v18$1 else p7$1);
    p7$2 := (if p6$2 && v18$2 then v18$2 else p7$2);
    p6$1 := (if p6$1 && !v18$1 then v18$1 else p6$1);
    p6$2 := (if p6$2 && !v18$2 then v18$2 else p6$2);
    $sad4x4.1$1, $x.0$1 := (if p7$1 then $sad4x4.0$1 else $sad4x4.1$1), (if p7$1 then 0bv32 else $x.0$1);
    $sad4x4.1$2, $x.0$2 := (if p7$2 then $sad4x4.0$2 else $sad4x4.1$2), (if p7$2 then 0bv32 else $x.0$2);
    p8$1 := (if p7$1 then true else p8$1);
    p8$2 := (if p7$2 then true else p8$2);
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_2"} true;
    assume {:invGenSkippedLoop} true;
    assert p8$1 ==> p6$1;
    assert p8$2 ==> p6$2;
    assert p6$1 ==> p4$1;
    assert p6$2 ==> p4$2;
    assert {:block_sourceloc} {:sourceloc_num 11} p8$1 ==> true;
    v19$1 := (if p8$1 then BV32_SLT($x.0$1, 4bv32) else v19$1);
    v19$2 := (if p8$2 then BV32_SLT($x.0$2, 4bv32) else v19$2);
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
    p9$1 := (if p8$1 && v19$1 then v19$1 else p9$1);
    p9$2 := (if p8$2 && v19$2 then v19$2 else p9$2);
    p8$1 := (if p8$1 && !v19$1 then v19$1 else p8$1);
    p8$2 := (if p8$2 && !v19$2 then v19$2 else p8$2);
    v20$1 := (if p9$1 then BV32_ADD(BV32_ADD(BV32_SUB(v11$1, 16bv32), BV32_SREM($search_pos.0$1, 33bv32)), $x.0$1) else v20$1);
    v20$2 := (if p9$2 then BV32_ADD(BV32_ADD(BV32_SUB(v11$2, 16bv32), BV32_SREM($search_pos.0$2, 33bv32)), $x.0$2) else v20$2);
    v21$1 := (if p9$1 then BV32_ADD(BV32_ADD(BV32_SUB(v12$1, 16bv32), BV32_SDIV($search_pos.0$1, 33bv32)), $y.0$1) else v21$1);
    v21$2 := (if p9$2 then BV32_ADD(BV32_ADD(BV32_SUB(v12$2, 16bv32), BV32_SDIV($search_pos.0$2, 33bv32)), $y.0$2) else v21$2);
    v22$1 := (if p9$1 then BV32_SLT(v20$1, 0bv32) else v22$1);
    v22$2 := (if p9$2 then BV32_SLT(v20$2, 0bv32) else v22$2);
    p10$1 := (if p9$1 && v22$1 then v22$1 else p10$1);
    p10$2 := (if p9$2 && v22$2 then v22$2 else p10$2);
    p11$1 := (if p9$1 && !v22$1 then !v22$1 else p11$1);
    p11$2 := (if p9$2 && !v22$2 then !v22$2 else p11$2);
    $0$1 := (if p10$1 then 0bv32 else $0$1);
    $0$2 := (if p10$2 then 0bv32 else $0$2);
    v23$1 := (if p11$1 then BV32_SGE(v20$1, 32768bv32) else v23$1);
    v23$2 := (if p11$2 then BV32_SGE(v20$2, 32768bv32) else v23$2);
    p13$1 := (if p11$1 && v23$1 then v23$1 else p13$1);
    p13$2 := (if p11$2 && v23$2 then v23$2 else p13$2);
    p12$1 := (if p11$1 && !v23$1 then !v23$1 else p12$1);
    p12$2 := (if p11$2 && !v23$2 then !v23$2 else p12$2);
    $1$1 := (if p12$1 then v20$1 else $1$1);
    $1$2 := (if p12$2 then v20$2 else $1$2);
    $1$1 := (if p13$1 then 32767bv32 else $1$1);
    $1$2 := (if p13$2 then 32767bv32 else $1$2);
    $0$1 := (if p11$1 then $1$1 else $0$1);
    $0$2 := (if p11$2 then $1$2 else $0$2);
    v24$1 := (if p9$1 then BV32_SLT(v21$1, 0bv32) else v24$1);
    v24$2 := (if p9$2 then BV32_SLT(v21$2, 0bv32) else v24$2);
    p14$1 := (if p9$1 && v24$1 then v24$1 else p14$1);
    p14$2 := (if p9$2 && v24$2 then v24$2 else p14$2);
    p15$1 := (if p9$1 && !v24$1 then !v24$1 else p15$1);
    p15$2 := (if p9$2 && !v24$2 then !v24$2 else p15$2);
    $2$1 := (if p14$1 then 0bv32 else $2$1);
    $2$2 := (if p14$2 then 0bv32 else $2$2);
    v25$1 := (if p15$1 then BV32_SGE(v21$1, 32768bv32) else v25$1);
    v25$2 := (if p15$2 then BV32_SGE(v21$2, 32768bv32) else v25$2);
    p17$1 := (if p15$1 && v25$1 then v25$1 else p17$1);
    p17$2 := (if p15$2 && v25$2 then v25$2 else p17$2);
    p16$1 := (if p15$1 && !v25$1 then !v25$1 else p16$1);
    p16$2 := (if p15$2 && !v25$2 then !v25$2 else p16$2);
    $3$1 := (if p16$1 then v21$1 else $3$1);
    $3$2 := (if p16$2 then v21$2 else $3$2);
    $3$1 := (if p17$1 then 32767bv32 else $3$1);
    $3$2 := (if p17$2 then 32767bv32 else $3$2);
    $2$1 := (if p15$1 then $3$1 else $2$1);
    $2$2 := (if p15$2 then $3$2 else $2$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v26$1 := (if p9$1 then _HAVOC_bv8$1 else v26$1);
    v26$2 := (if p9$2 then _HAVOC_bv8$2 else v26$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v27$1 := (if p9$1 then _HAVOC_bv8$1 else v27$1);
    v27$2 := (if p9$2 then _HAVOC_bv8$2 else v27$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v28$1 := (if p9$1 then _HAVOC_bv8$1 else v28$1);
    v28$2 := (if p9$2 then _HAVOC_bv8$2 else v28$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v29$1 := (if p9$1 then _HAVOC_bv8$1 else v29$1);
    v29$2 := (if p9$2 then _HAVOC_bv8$2 else v29$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v30$1 := (if p9$1 then _HAVOC_bv8$1 else v30$1);
    v30$2 := (if p9$2 then _HAVOC_bv8$2 else v30$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v31$1 := (if p9$1 then _HAVOC_bv8$1 else v31$1);
    v31$2 := (if p9$2 then _HAVOC_bv8$2 else v31$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v32$1 := (if p9$1 then _HAVOC_bv8$1 else v32$1);
    v32$2 := (if p9$2 then _HAVOC_bv8$2 else v32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v33$1 := (if p9$1 then _HAVOC_bv8$1 else v33$1);
    v33$2 := (if p9$2 then _HAVOC_bv8$2 else v33$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v34$1 := (if p9$1 then _HAVOC_bv8$1 else v34$1);
    v34$2 := (if p9$2 then _HAVOC_bv8$2 else v34$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v35$1 := (if p9$1 then _HAVOC_bv8$1 else v35$1);
    v35$2 := (if p9$2 then _HAVOC_bv8$2 else v35$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v36$1 := (if p9$1 then _HAVOC_bv8$1 else v36$1);
    v36$2 := (if p9$2 then _HAVOC_bv8$2 else v36$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v37$1 := (if p9$1 then _HAVOC_bv8$1 else v37$1);
    v37$2 := (if p9$2 then _HAVOC_bv8$2 else v37$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v38$1 := (if p9$1 then _HAVOC_bv8$1 else v38$1);
    v38$2 := (if p9$2 then _HAVOC_bv8$2 else v38$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v39$1 := (if p9$1 then _HAVOC_bv8$1 else v39$1);
    v39$2 := (if p9$2 then _HAVOC_bv8$2 else v39$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v40$1 := (if p9$1 then _HAVOC_bv8$1 else v40$1);
    v40$2 := (if p9$2 then _HAVOC_bv8$2 else v40$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v41$1 := (if p9$1 then _HAVOC_bv8$1 else v41$1);
    v41$2 := (if p9$2 then _HAVOC_bv8$2 else v41$2);
    havoc _HAVOC_bv16$1, _HAVOC_bv16$2;
    v42$1 := (if p9$1 then _HAVOC_bv16$1 else v42$1);
    v42$2 := (if p9$2 then _HAVOC_bv16$2 else v42$2);
    v43$1 := (if p9$1 then BV32_SUB(BV16_ZEXT32(v27$1 ++ v26$1), BV16_ZEXT32(v42$1)) else v43$1);
    v43$2 := (if p9$2 then BV32_SUB(BV16_ZEXT32(v27$2 ++ v26$2), BV16_ZEXT32(v42$2)) else v43$2);
    $sad4x4.1$1, $x.0$1 := (if p9$1 then BV32_ADD(BV16_ZEXT32($sad4x4.1$1), (if BV32_SGT(v43$1, 0bv32) then v43$1 else BV32_SUB(0bv32, v43$1)))[16:0] else $sad4x4.1$1), (if p9$1 then BV32_ADD($x.0$1, 1bv32) else $x.0$1);
    $sad4x4.1$2, $x.0$2 := (if p9$2 then BV32_ADD(BV16_ZEXT32($sad4x4.1$2), (if BV32_SGT(v43$2, 0bv32) then v43$2 else BV32_SUB(0bv32, v43$2)))[16:0] else $sad4x4.1$2), (if p9$2 then BV32_ADD($x.0$2, 1bv32) else $x.0$2);
    p8$1 := (if p9$1 then true else p8$1);
    p8$2 := (if p9$2 then true else p8$2);
    goto $9.backedge, $9.tail;

  $9.tail:
    assume !p8$1 && !p8$2;
    $sad4x4.0$1, $y.0$1 := (if p7$1 then $sad4x4.1$1 else $sad4x4.0$1), (if p7$1 then BV32_ADD($y.0$1, 1bv32) else $y.0$1);
    $sad4x4.0$2, $y.0$2 := (if p7$2 then $sad4x4.1$2 else $sad4x4.0$2), (if p7$2 then BV32_ADD($y.0$2, 1bv32) else $y.0$2);
    p6$1 := (if p7$1 then true else p6$1);
    p6$2 := (if p7$2 then true else p6$2);
    goto $7.backedge, $7.tail;

  $7.tail:
    assume !p6$1 && !p6$2;
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$blk_sad(p5$1, BV32_ADD(v15$1, $search_pos.0$1), $sad4x4.0$1, $$blk_sad[BV32_ADD(v15$1, $search_pos.0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p5$2, BV32_ADD(v15$2, $search_pos.0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$blk_sad(p5$2, BV32_ADD(v15$2, $search_pos.0$2), $sad4x4.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(v15$1, $search_pos.0$1)] := (if p5$1 then $sad4x4.0$1 else $$blk_sad[BV32_ADD(v15$1, $search_pos.0$1)]);
    $$blk_sad[BV32_ADD(v15$2, $search_pos.0$2)] := (if p5$2 then $sad4x4.0$2 else $$blk_sad[BV32_ADD(v15$2, $search_pos.0$2)]);
    $search_pos.0$1 := (if p5$1 then BV32_ADD($search_pos.0$1, 1bv32) else $search_pos.0$1);
    $search_pos.0$2 := (if p5$2 then BV32_ADD($search_pos.0$2, 1bv32) else $search_pos.0$2);
    p4$1 := (if p5$1 then true else p4$1);
    p4$2 := (if p5$2 then true else p4$2);
    goto $5.backedge, $5.tail;

  $5.tail:
    assume !p4$1 && !p4$2;
    return;

  $5.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $5;

  $7.backedge:
    assume {:backedge} p6$1 || p6$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $7;

  $9.backedge:
    assume {:backedge} p8$1 || p8$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $9;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 61bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 44bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 36bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

const _WATCHED_VALUE_$$blk_sad: bv16;

procedure {:inline 1} _LOG_READ_$$blk_sad(_P: bool, _offset: bv32, _value: bv16);
  modifies _READ_HAS_OCCURRED_$$blk_sad;



implementation {:inline 1} _LOG_READ_$$blk_sad(_P: bool, _offset: bv32, _value: bv16)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$blk_sad := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blk_sad == _value then true else _READ_HAS_OCCURRED_$$blk_sad);
    return;
}



procedure _CHECK_READ_$$blk_sad(_P: bool, _offset: bv32, _value: bv16);
  requires {:source_name "blk_sad"} {:array "$$blk_sad"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$blk_sad && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$blk_sad);
  requires {:source_name "blk_sad"} {:array "$$blk_sad"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$blk_sad && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$blk_sad: bool;

procedure {:inline 1} _LOG_WRITE_$$blk_sad(_P: bool, _offset: bv32, _value: bv16, _value_old: bv16);
  modifies _WRITE_HAS_OCCURRED_$$blk_sad, _WRITE_READ_BENIGN_FLAG_$$blk_sad;



implementation {:inline 1} _LOG_WRITE_$$blk_sad(_P: bool, _offset: bv32, _value: bv16, _value_old: bv16)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$blk_sad := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blk_sad == _value then true else _WRITE_HAS_OCCURRED_$$blk_sad);
    _WRITE_READ_BENIGN_FLAG_$$blk_sad := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blk_sad == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$blk_sad);
    return;
}



procedure _CHECK_WRITE_$$blk_sad(_P: bool, _offset: bv32, _value: bv16);
  requires {:source_name "blk_sad"} {:array "$$blk_sad"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$blk_sad && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blk_sad != _value);
  requires {:source_name "blk_sad"} {:array "$$blk_sad"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$blk_sad && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blk_sad != _value);
  requires {:source_name "blk_sad"} {:array "$$blk_sad"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$blk_sad && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$blk_sad(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$blk_sad;



implementation {:inline 1} _LOG_ATOMIC_$$blk_sad(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$blk_sad := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$blk_sad);
    return;
}



procedure _CHECK_ATOMIC_$$blk_sad(_P: bool, _offset: bv32);
  requires {:source_name "blk_sad"} {:array "$$blk_sad"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$blk_sad && _WATCHED_OFFSET == _offset);
  requires {:source_name "blk_sad"} {:array "$$blk_sad"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$blk_sad && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$blk_sad;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$blk_sad := (if _P && _WRITE_HAS_OCCURRED_$$blk_sad && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$blk_sad);
    return;
}



const _WATCHED_VALUE_$$frame: bv16;

procedure {:inline 1} _LOG_READ_$$frame(_P: bool, _offset: bv32, _value: bv16);
  modifies _READ_HAS_OCCURRED_$$frame;



implementation {:inline 1} _LOG_READ_$$frame(_P: bool, _offset: bv32, _value: bv16)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$frame := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$frame == _value then true else _READ_HAS_OCCURRED_$$frame);
    return;
}



procedure _CHECK_READ_$$frame(_P: bool, _offset: bv32, _value: bv16);
  requires {:source_name "frame"} {:array "$$frame"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$frame && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$frame);
  requires {:source_name "frame"} {:array "$$frame"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$frame && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$frame: bool;

procedure {:inline 1} _LOG_WRITE_$$frame(_P: bool, _offset: bv32, _value: bv16, _value_old: bv16);
  modifies _WRITE_HAS_OCCURRED_$$frame, _WRITE_READ_BENIGN_FLAG_$$frame;



implementation {:inline 1} _LOG_WRITE_$$frame(_P: bool, _offset: bv32, _value: bv16, _value_old: bv16)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$frame := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$frame == _value then true else _WRITE_HAS_OCCURRED_$$frame);
    _WRITE_READ_BENIGN_FLAG_$$frame := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$frame == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$frame);
    return;
}



procedure _CHECK_WRITE_$$frame(_P: bool, _offset: bv32, _value: bv16);
  requires {:source_name "frame"} {:array "$$frame"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$frame && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$frame != _value);
  requires {:source_name "frame"} {:array "$$frame"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$frame && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$frame != _value);
  requires {:source_name "frame"} {:array "$$frame"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$frame && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$frame(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$frame;



implementation {:inline 1} _LOG_ATOMIC_$$frame(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$frame := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$frame);
    return;
}



procedure _CHECK_ATOMIC_$$frame(_P: bool, _offset: bv32);
  requires {:source_name "frame"} {:array "$$frame"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$frame && _WATCHED_OFFSET == _offset);
  requires {:source_name "frame"} {:array "$$frame"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$frame && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$frame(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$frame;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$frame(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$frame := (if _P && _WRITE_HAS_OCCURRED_$$frame && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$frame);
    return;
}



const _WATCHED_VALUE_$$img_ref: bv8;

procedure {:inline 1} _LOG_READ_$$img_ref(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$img_ref;



implementation {:inline 1} _LOG_READ_$$img_ref(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$img_ref := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img_ref == _value then true else _READ_HAS_OCCURRED_$$img_ref);
    return;
}



procedure _CHECK_READ_$$img_ref(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "img_ref"} {:array "$$img_ref"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$img_ref && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$img_ref);
  requires {:source_name "img_ref"} {:array "$$img_ref"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$img_ref && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$img_ref: bool;

procedure {:inline 1} _LOG_WRITE_$$img_ref(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$img_ref, _WRITE_READ_BENIGN_FLAG_$$img_ref;



implementation {:inline 1} _LOG_WRITE_$$img_ref(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$img_ref := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img_ref == _value then true else _WRITE_HAS_OCCURRED_$$img_ref);
    _WRITE_READ_BENIGN_FLAG_$$img_ref := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img_ref == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$img_ref);
    return;
}



procedure _CHECK_WRITE_$$img_ref(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "img_ref"} {:array "$$img_ref"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$img_ref && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img_ref != _value);
  requires {:source_name "img_ref"} {:array "$$img_ref"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$img_ref && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img_ref != _value);
  requires {:source_name "img_ref"} {:array "$$img_ref"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$img_ref && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$img_ref(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$img_ref;



implementation {:inline 1} _LOG_ATOMIC_$$img_ref(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$img_ref := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$img_ref);
    return;
}



procedure _CHECK_ATOMIC_$$img_ref(_P: bool, _offset: bv32);
  requires {:source_name "img_ref"} {:array "$$img_ref"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$img_ref && _WATCHED_OFFSET == _offset);
  requires {:source_name "img_ref"} {:array "$$img_ref"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$img_ref && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$img_ref(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$img_ref;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$img_ref(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$img_ref := (if _P && _WRITE_HAS_OCCURRED_$$img_ref && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$img_ref);
    return;
}



var _TRACKING: bool;
