type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "blk_sad"} {:global} $$blk_sad: [bv32]bv8;

axiom {:array_info "$$blk_sad"} {:global} {:elem_width 8} {:source_name "blk_sad"} {:source_elem_width 16} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 16} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$blk_sad: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 16} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$blk_sad: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 16} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$blk_sad: bool;

const $arrayId$$blk_sad: arrayId;

axiom $arrayId$$blk_sad == 1bv2;

type ptr = bv32;

type arrayId = bv2;

function {:inline true} MKPTR(base: arrayId, offset: bv32) : ptr
{
  base ++ offset[30:0]
}

function {:inline true} base#MKPTR(p: ptr) : arrayId
{
  p[32:30]
}

function {:inline true} offset#MKPTR(p: ptr) : bv32
{
  0bv2 ++ p[30:0]
}

const $arrayId$$null$: arrayId;

axiom $arrayId$$null$ == 0bv2;

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

function {:bvbuiltin "bvadd"} BV16_ADD(bv16, bv16) : bv16;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "larger_sad_calc_8"} {:kernel} $larger_sad_calc_8($mb_width: bv32, $mb_height: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $mb_width == num_groups_x then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $mb_height == num_groups_y then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$blk_sad && !_WRITE_HAS_OCCURRED_$$blk_sad && !_ATOMIC_HAS_OCCURRED_$$blk_sad;
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
  modifies _READ_HAS_OCCURRED_$$blk_sad, _WRITE_HAS_OCCURRED_$$blk_sad, _WRITE_READ_BENIGN_FLAG_$$blk_sad, _WRITE_READ_BENIGN_FLAG_$$blk_sad;



implementation {:source_name "larger_sad_calc_8"} {:kernel} $larger_sad_calc_8($mb_width: bv32, $mb_height: bv32)
{
  var $bo_5.0$1: ptr;
  var $bo_5.0$2: ptr;
  var $bo_4.0$1: ptr;
  var $bo_4.0$2: ptr;
  var $search_pos.0$1: bv32;
  var $search_pos.0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v8$1: bv16;
  var v8$2: bv16;
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v3$1: bv32;
  var v3$2: bv32;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv16;
  var v14$2: bv16;
  var v18$1: bv8;
  var v18$2: bv8;
  var v19$1: bv8;
  var v19$2: bv8;
  var v20$1: bv16;
  var v20$2: bv16;
  var v21$1: bv8;
  var v21$2: bv8;
  var v22$1: bv8;
  var v22$2: bv8;
  var v23$1: bv16;
  var v23$2: bv16;
  var v0$1: bv32;
  var v0$2: bv32;
  var v2: bv32;
  var v5$1: bool;
  var v5$2: bool;
  var v15$1: bv8;
  var v15$2: bv8;
  var v16$1: bv8;
  var v16$2: bv8;
  var v17$1: bv16;
  var v17$2: bv16;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv16;
  var v11$2: bv16;
  var v29$1: bv16;
  var v29$2: bv16;
  var v31$1: bv16;
  var v31$2: bv16;
  var v30$1: bv16;
  var v30$2: bv16;
  var v32$1: bv16;
  var v32$2: bv16;
  var v33$1: bv16;
  var v33$2: bv16;
  var v34$1: bv16;
  var v34$2: bv16;
  var v35$1: bv16;
  var v35$2: bv16;
  var v36$1: bv16;
  var v36$2: bv16;
  var v37$1: bv16;
  var v37$2: bv16;
  var v24$1: bv8;
  var v24$2: bv8;
  var v25$1: bv8;
  var v25$2: bv8;
  var v26$1: bv16;
  var v26$2: bv16;
  var v27$1: bv8;
  var v27$2: bv8;
  var v28$1: bv8;
  var v28$2: bv8;
  var v4$1: bool;
  var v4$2: bool;
  var v41$1: ptr;
  var v41$2: ptr;
  var v40$1: ptr;
  var v40$2: ptr;
  var v38$1: bv16;
  var v38$2: bv16;
  var v39$1: bv16;
  var v39$2: bv16;
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
  var p21$1: bool;
  var p21$2: bool;
  var p22$1: bool;
  var p22$2: bool;
  var p23$1: bool;
  var p23$2: bool;
  var p24$1: bool;
  var p24$2: bool;
  var p25$1: bool;
  var p25$2: bool;
  var p26$1: bool;
  var p26$2: bool;
  var p27$1: bool;
  var p27$2: bool;
  var p28$1: bool;
  var p28$2: bool;
  var _HAVOC_ptr$1: ptr;
  var _HAVOC_ptr$2: ptr;


  $0:
    v0$1 := BV32_AND(local_id_y$1, 1bv32);
    v0$2 := BV32_AND(local_id_y$2, 1bv32);
    v1$1 := BV32_LSHR(local_id_y$1, 1bv32);
    v1$2 := BV32_LSHR(local_id_y$2, 1bv32);
    v2 := BV32_MUL(BV32_ASHR(BV32_SHL($mb_height, 8bv32), 8bv32), BV32_ASHR(BV32_SHL($mb_width, 8bv32), 8bv32));
    v3$1 := BV32_MUL(BV32_ADD(BV32_MUL(BV32_ASHR(BV32_SHL($mb_width, 8bv32), 8bv32), BV32_ASHR(BV32_SHL(group_id_y$1, 8bv32), 8bv32)), group_id_x$1), 1096bv32);
    v3$2 := BV32_MUL(BV32_ADD(BV32_MUL(BV32_ASHR(BV32_SHL($mb_width, 8bv32), 8bv32), BV32_ASHR(BV32_SHL(group_id_y$2, 8bv32), 8bv32)), group_id_x$2), 1096bv32);
    v4$1 := BV32_SLT(v1$1, 100bv32);
    v4$2 := BV32_SLT(v1$2, 100bv32);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p0$1 := (if v4$1 then v4$1 else p0$1);
    p0$2 := (if v4$2 then v4$2 else p0$2);
    p1$1 := (if !v4$1 then !v4$1 else p1$1);
    p1$2 := (if !v4$2 then !v4$2 else p1$2);
    $bo_5.0$1, $bo_4.0$1 := (if p0$1 then MKPTR($arrayId$$blk_sad, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 3bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), v0$1)), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32))) else $bo_5.0$1), (if p0$1 then MKPTR($arrayId$$blk_sad, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 2bv32), v2), BV32_ADD(BV32_MUL(v1$1, 2bv32), v0$1)), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 4bv32), 2bv32))) else $bo_4.0$1);
    $bo_5.0$2, $bo_4.0$2 := (if p0$2 then MKPTR($arrayId$$blk_sad, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 3bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), v0$2)), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32))) else $bo_5.0$2), (if p0$2 then MKPTR($arrayId$$blk_sad, BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 2bv32), v2), BV32_ADD(BV32_MUL(v1$2, 2bv32), v0$2)), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 4bv32), 2bv32))) else $bo_4.0$2);
    havoc _HAVOC_ptr$1, _HAVOC_ptr$2;
    v40$1 := (if p1$1 then _HAVOC_ptr$1 else v40$1);
    v40$2 := (if p1$2 then _HAVOC_ptr$2 else v40$2);
    havoc _HAVOC_ptr$1, _HAVOC_ptr$2;
    v41$1 := (if p1$1 then _HAVOC_ptr$1 else v41$1);
    v41$2 := (if p1$2 then _HAVOC_ptr$2 else v41$2);
    $bo_5.0$1, $bo_4.0$1 := (if p1$1 then v40$1 else $bo_5.0$1), (if p1$1 then v41$1 else $bo_4.0$1);
    $bo_5.0$2, $bo_4.0$2 := (if p1$2 then v40$2 else $bo_5.0$2), (if p1$2 then v41$2 else $bo_4.0$2);
    $search_pos.0$1 := local_id_x$1;
    $search_pos.0$2 := local_id_x$2;
    p2$1 := true;
    p2$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 5} p2$1 ==> true;
    v5$1 := (if p2$1 then BV32_SLT($search_pos.0$1, 545bv32) else v5$1);
    v5$2 := (if p2$2 then BV32_SLT($search_pos.0$2, 545bv32) else v5$2);
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
    p21$1 := false;
    p21$2 := false;
    p22$1 := false;
    p22$2 := false;
    p23$1 := false;
    p23$2 := false;
    p24$1 := false;
    p24$2 := false;
    p25$1 := false;
    p25$2 := false;
    p26$1 := false;
    p26$2 := false;
    p27$1 := false;
    p27$2 := false;
    p28$1 := false;
    p28$2 := false;
    p3$1 := (if p2$1 && v5$1 then v5$1 else p3$1);
    p3$2 := (if p2$2 && v5$2 then v5$2 else p3$2);
    p2$1 := (if p2$1 && !v5$1 then v5$1 else p2$1);
    p2$2 := (if p2$2 && !v5$2 then v5$2 else p2$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL($search_pos.0$1, 2bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL($search_pos.0$1, 2bv32), 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 7} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL($search_pos.0$2, 2bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL($search_pos.0$2, 2bv32), 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v6$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL($search_pos.0$1, 2bv32), 2bv32))] else v6$1);
    v6$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL($search_pos.0$2, 2bv32), 2bv32))] else v6$2);
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL($search_pos.0$1, 2bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL($search_pos.0$1, 2bv32), 2bv32)), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL($search_pos.0$2, 2bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL($search_pos.0$2, 2bv32), 2bv32)), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v7$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL($search_pos.0$1, 2bv32), 2bv32)), 1bv32)] else v7$1);
    v7$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL($search_pos.0$2, 2bv32), 2bv32)), 1bv32)] else v7$2);
    v8$1 := (if p3$1 then v7$1 ++ v6$1 else v8$1);
    v8$2 := (if p3$2 then v7$2 ++ v6$2 else v8$2);
    call {:sourceloc} {:sourceloc_num 9} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL($search_pos.0$1, 2bv32), 1bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL($search_pos.0$1, 2bv32), 1bv32), 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 9} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL($search_pos.0$2, 2bv32), 1bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL($search_pos.0$2, 2bv32), 1bv32), 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v9$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL($search_pos.0$1, 2bv32), 1bv32), 2bv32))] else v9$1);
    v9$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL($search_pos.0$2, 2bv32), 1bv32), 2bv32))] else v9$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL($search_pos.0$1, 2bv32), 1bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL($search_pos.0$1, 2bv32), 1bv32), 2bv32)), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL($search_pos.0$2, 2bv32), 1bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL($search_pos.0$2, 2bv32), 1bv32), 2bv32)), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v10$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL($search_pos.0$1, 2bv32), 1bv32), 2bv32)), 1bv32)] else v10$1);
    v10$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL($search_pos.0$2, 2bv32), 1bv32), 2bv32)), 1bv32)] else v10$2);
    v11$1 := (if p3$1 then v10$1 ++ v9$1 else v11$1);
    v11$2 := (if p3$2 then v10$2 ++ v9$2 else v11$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v12$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 2bv32))] else v12$1);
    v12$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 2bv32))] else v12$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 2bv32)), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 2bv32)), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v13$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 2bv32)), 1bv32)] else v13$1);
    v13$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 2bv32)), 1bv32)] else v13$2);
    v14$1 := (if p3$1 then v13$1 ++ v12$1 else v14$1);
    v14$2 := (if p3$2 then v13$2 ++ v12$2 else v14$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 1bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 1bv32), 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 1bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 1bv32), 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v15$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 1bv32), 2bv32))] else v15$1);
    v15$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 1bv32), 2bv32))] else v15$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 1bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 1bv32), 2bv32)), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 1bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 1bv32), 2bv32)), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v16$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 1bv32), 2bv32)), 1bv32)] else v16$1);
    v16$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 1bv32), 2bv32)), 1bv32)] else v16$2);
    v17$1 := (if p3$1 then v16$1 ++ v15$1 else v17$1);
    v17$2 := (if p3$2 then v16$2 ++ v15$2 else v17$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 2192bv32), 2bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 2192bv32), 2bv32), 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 2192bv32), 2bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 2192bv32), 2bv32), 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v18$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 2192bv32), 2bv32), 2bv32))] else v18$1);
    v18$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 2192bv32), 2bv32), 2bv32))] else v18$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 2192bv32), 2bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 2192bv32), 2bv32), 2bv32)), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 2192bv32), 2bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 2192bv32), 2bv32), 2bv32)), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v19$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 2192bv32), 2bv32), 2bv32)), 1bv32)] else v19$1);
    v19$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 2192bv32), 2bv32), 2bv32)), 1bv32)] else v19$2);
    v20$1 := (if p3$1 then v19$1 ++ v18$1 else v20$1);
    v20$2 := (if p3$2 then v19$2 ++ v18$2 else v20$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 2192bv32), 2bv32), 1bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 2192bv32), 2bv32), 1bv32), 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 2192bv32), 2bv32), 1bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 2192bv32), 2bv32), 1bv32), 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v21$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 2192bv32), 2bv32), 1bv32), 2bv32))] else v21$1);
    v21$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 2192bv32), 2bv32), 1bv32), 2bv32))] else v21$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 2192bv32), 2bv32), 1bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 2192bv32), 2bv32), 1bv32), 2bv32)), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 18} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 2192bv32), 2bv32), 1bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 2192bv32), 2bv32), 1bv32), 2bv32)), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v22$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 2192bv32), 2bv32), 1bv32), 2bv32)), 1bv32)] else v22$1);
    v22$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 2192bv32), 2bv32), 1bv32), 2bv32)), 1bv32)] else v22$2);
    v23$1 := (if p3$1 then v22$1 ++ v21$1 else v23$1);
    v23$2 := (if p3$2 then v22$2 ++ v21$2 else v23$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 2740bv32), 2bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 2740bv32), 2bv32), 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 2740bv32), 2bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 2740bv32), 2bv32), 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v24$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 2740bv32), 2bv32), 2bv32))] else v24$1);
    v24$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 2740bv32), 2bv32), 2bv32))] else v24$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 2740bv32), 2bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 2740bv32), 2bv32), 2bv32)), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 20} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 2740bv32), 2bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 2740bv32), 2bv32), 2bv32)), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v25$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$1, 2740bv32), 2bv32), 2bv32)), 1bv32)] else v25$1);
    v25$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_MUL(BV32_ADD($search_pos.0$2, 2740bv32), 2bv32), 2bv32)), 1bv32)] else v25$2);
    v26$1 := (if p3$1 then v25$1 ++ v24$1 else v26$1);
    v26$2 := (if p3$2 then v25$2 ++ v24$2 else v26$2);
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 2740bv32), 2bv32), 1bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 2740bv32), 2bv32), 1bv32), 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 2740bv32), 2bv32), 1bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 2740bv32), 2bv32), 1bv32), 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v27$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 2740bv32), 2bv32), 1bv32), 2bv32))] else v27$1);
    v27$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 2740bv32), 2bv32), 1bv32), 2bv32))] else v27$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 2740bv32), 2bv32), 1bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 2740bv32), 2bv32), 1bv32), 2bv32)), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 2740bv32), 2bv32), 1bv32), 2bv32)), 1bv32), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 2740bv32), 2bv32), 1bv32), 2bv32)), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v28$1 := (if p3$1 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$1, 8bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 2740bv32), 2bv32), 1bv32), 2bv32)), 1bv32)] else v28$1);
    v28$2 := (if p3$2 then $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_MUL(25bv32, BV32_ASHR(BV32_SHL(v2, 8bv32), 8bv32)), BV32_ADD(BV32_MUL(v1$2, 8bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 16bv32), 2bv32)), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 2740bv32), 2bv32), 1bv32), 2bv32)), 1bv32)] else v28$2);
    v29$1 := (if p3$1 then v28$1 ++ v27$1 else v29$1);
    v29$2 := (if p3$2 then v28$2 ++ v27$2 else v29$2);
    v30$1 := (if p3$1 then BV16_ADD(v8$1, v20$1) else v30$1);
    v30$2 := (if p3$2 then BV16_ADD(v8$2, v20$2) else v30$2);
    v31$1 := (if p3$1 then BV16_ADD(v11$1, v23$1) else v31$1);
    v31$2 := (if p3$2 then BV16_ADD(v11$2, v23$2) else v31$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32)), v30$1[8:0], $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32)));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32)), v30$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32))] := (if p3$1 then v30$1[8:0] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32))]);
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32))] := (if p3$2 then v30$2[8:0] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32))]);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32)), 1bv32), v30$1[16:8], $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32)), 1bv32), v30$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32)), 1bv32)] := (if p3$1 then v30$1[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32)), 1bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32)), 1bv32)] := (if p3$2 then v30$2[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32)), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 25} _LOG_WRITE_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32)), 2bv32), v31$1[8:0], $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32)), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32)), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 25} _CHECK_WRITE_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32)), 2bv32), v31$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32)), 2bv32)] := (if p3$1 then v31$1[8:0] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32)), 2bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32)), 2bv32)] := (if p3$2 then v31$2[8:0] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32)), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32)), 3bv32), v31$1[16:8], $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32)), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32)), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32)), 3bv32), v31$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32)), 3bv32)] := (if p3$1 then v31$1[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL($search_pos.0$1, 4bv32)), 3bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32)), 3bv32)] := (if p3$2 then v31$2[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL($search_pos.0$2, 4bv32)), 3bv32)]);
    v32$1 := (if p3$1 then BV16_ADD(v14$1, v26$1) else v32$1);
    v32$2 := (if p3$2 then BV16_ADD(v14$2, v26$2) else v32$2);
    v33$1 := (if p3$1 then BV16_ADD(v17$1, v29$1) else v33$1);
    v33$2 := (if p3$2 then BV16_ADD(v17$2, v29$2) else v33$2);
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32)), v32$1[8:0], $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32)));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32)), v32$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32))] := (if p3$1 then v32$1[8:0] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32))]);
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32))] := (if p3$2 then v32$2[8:0] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32))]);
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32)), 1bv32), v32$1[16:8], $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32)), 1bv32), v32$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32)), 1bv32)] := (if p3$1 then v32$1[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32)), 1bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32)), 1bv32)] := (if p3$2 then v32$2[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32)), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32)), 2bv32), v33$1[8:0], $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32)), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32)), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32)), 2bv32), v33$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32)), 2bv32)] := (if p3$1 then v33$1[8:0] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32)), 2bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32)), 2bv32)] := (if p3$2 then v33$2[8:0] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32)), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$blk_sad(p3$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32)), 3bv32), v33$1[16:8], $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32)), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32)), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$blk_sad(p3$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32)), 3bv32), v33$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32)), 3bv32)] := (if p3$1 then v33$1[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$1, 4bv32), BV32_MUL(v0$1, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$1, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 4bv32)), 3bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32)), 3bv32)] := (if p3$2 then v33$2[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(BV32_ADD(BV32_ADD(BV32_SHL(v2, 4bv32), v2), BV32_ADD(BV32_MUL(v1$2, 4bv32), BV32_MUL(v0$2, 2bv32))), 1096bv32), 2bv32), BV32_MUL(BV32_MUL(v3$2, 8bv32), 2bv32)), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 4bv32)), 3bv32)]);
    v34$1 := (if p3$1 then BV16_ADD(v8$1, v14$1) else v34$1);
    v34$2 := (if p3$2 then BV16_ADD(v8$2, v14$2) else v34$2);
    v35$1 := (if p3$1 then BV16_ADD(v11$1, v17$1) else v35$1);
    v35$2 := (if p3$2 then BV16_ADD(v11$2, v17$2) else v35$2);
    p5$1 := (if p3$1 && base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad else p5$1);
    p5$2 := (if p3$2 && base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad else p5$2);
    p4$1 := (if p3$1 && base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad else p4$1);
    p4$2 := (if p3$2 && base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad else p4$2);
    assert {:bad_pointer_access} {:sourceloc_num 32} {:thread 1} p4$1 ==> false;
    assert {:bad_pointer_access} {:sourceloc_num 32} {:thread 2} p4$2 ==> false;
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$blk_sad(p5$1, BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32)), v34$1[8:0], $$blk_sad[BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p5$2, BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32)));
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$blk_sad(p5$2, BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32)), v34$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32))] := (if p5$1 then v34$1[8:0] else $$blk_sad[BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32))]);
    $$blk_sad[BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32))] := (if p5$2 then v34$2[8:0] else $$blk_sad[BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32))]);
    p7$1 := (if p3$1 && base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad else p7$1);
    p7$2 := (if p3$2 && base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad else p7$2);
    p6$1 := (if p3$1 && base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad else p6$1);
    p6$2 := (if p3$2 && base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad else p6$2);
    assert {:bad_pointer_access} {:sourceloc_num 34} {:thread 1} p6$1 ==> false;
    assert {:bad_pointer_access} {:sourceloc_num 34} {:thread 2} p6$2 ==> false;
    call {:sourceloc} {:sourceloc_num 33} _LOG_WRITE_$$blk_sad(p7$1, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 1bv32), v34$1[16:8], $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p7$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 33} _CHECK_WRITE_$$blk_sad(p7$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 1bv32), v34$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 1bv32)] := (if p7$1 then v34$1[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 1bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 1bv32)] := (if p7$2 then v34$2[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 1bv32)]);
    p9$1 := (if p3$1 && base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad else p9$1);
    p9$2 := (if p3$2 && base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad else p9$2);
    p8$1 := (if p3$1 && base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad else p8$1);
    p8$2 := (if p3$2 && base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad else p8$2);
    assert {:bad_pointer_access} {:sourceloc_num 36} {:thread 1} p8$1 ==> false;
    assert {:bad_pointer_access} {:sourceloc_num 36} {:thread 2} p8$2 ==> false;
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$blk_sad(p9$1, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 2bv32), v35$1[8:0], $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p9$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$blk_sad(p9$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 2bv32), v35$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 2bv32)] := (if p9$1 then v35$1[8:0] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 2bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 2bv32)] := (if p9$2 then v35$2[8:0] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 2bv32)]);
    p11$1 := (if p3$1 && base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad else p11$1);
    p11$2 := (if p3$2 && base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad else p11$2);
    p10$1 := (if p3$1 && base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad else p10$1);
    p10$2 := (if p3$2 && base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad else p10$2);
    assert {:bad_pointer_access} {:sourceloc_num 38} {:thread 1} p10$1 ==> false;
    assert {:bad_pointer_access} {:sourceloc_num 38} {:thread 2} p10$2 ==> false;
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$blk_sad(p11$1, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 3bv32), v35$1[16:8], $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p11$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$blk_sad(p11$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 3bv32), v35$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 3bv32)] := (if p11$1 then v35$1[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 3bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 3bv32)] := (if p11$2 then v35$2[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 3bv32)]);
    v36$1 := (if p3$1 then BV16_ADD(v20$1, v26$1) else v36$1);
    v36$2 := (if p3$2 then BV16_ADD(v20$2, v26$2) else v36$2);
    v37$1 := (if p3$1 then BV16_ADD(v23$1, v29$1) else v37$1);
    v37$2 := (if p3$2 then BV16_ADD(v23$2, v29$2) else v37$2);
    p13$1 := (if p3$1 && base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad else p13$1);
    p13$2 := (if p3$2 && base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad else p13$2);
    p12$1 := (if p3$1 && base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad else p12$1);
    p12$2 := (if p3$2 && base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad else p12$2);
    assert {:bad_pointer_access} {:sourceloc_num 40} {:thread 1} p12$1 ==> false;
    assert {:bad_pointer_access} {:sourceloc_num 40} {:thread 2} p12$2 ==> false;
    call {:sourceloc} {:sourceloc_num 39} _LOG_WRITE_$$blk_sad(p13$1, BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32)), v36$1[8:0], $$blk_sad[BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p13$2, BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32)));
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 39} _CHECK_WRITE_$$blk_sad(p13$2, BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32)), v36$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32))] := (if p13$1 then v36$1[8:0] else $$blk_sad[BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32))]);
    $$blk_sad[BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32))] := (if p13$2 then v36$2[8:0] else $$blk_sad[BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32))]);
    p15$1 := (if p3$1 && base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad else p15$1);
    p15$2 := (if p3$2 && base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad else p15$2);
    p14$1 := (if p3$1 && base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad else p14$1);
    p14$2 := (if p3$2 && base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad else p14$2);
    assert {:bad_pointer_access} {:sourceloc_num 42} {:thread 1} p14$1 ==> false;
    assert {:bad_pointer_access} {:sourceloc_num 42} {:thread 2} p14$2 ==> false;
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$blk_sad(p15$1, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32)), 1bv32), v36$1[16:8], $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p15$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$blk_sad(p15$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32)), 1bv32), v36$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32)), 1bv32)] := (if p15$1 then v36$1[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32)), 1bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32)), 1bv32)] := (if p15$2 then v36$2[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32)), 1bv32)]);
    p17$1 := (if p3$1 && base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad else p17$1);
    p17$2 := (if p3$2 && base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad else p17$2);
    p16$1 := (if p3$1 && base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad else p16$1);
    p16$2 := (if p3$2 && base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad else p16$2);
    assert {:bad_pointer_access} {:sourceloc_num 44} {:thread 1} p16$1 ==> false;
    assert {:bad_pointer_access} {:sourceloc_num 44} {:thread 2} p16$2 ==> false;
    call {:sourceloc} {:sourceloc_num 43} _LOG_WRITE_$$blk_sad(p17$1, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32)), 2bv32), v37$1[8:0], $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32)), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p17$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32)), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 43} _CHECK_WRITE_$$blk_sad(p17$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32)), 2bv32), v37$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32)), 2bv32)] := (if p17$1 then v37$1[8:0] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32)), 2bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32)), 2bv32)] := (if p17$2 then v37$2[8:0] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32)), 2bv32)]);
    p19$1 := (if p3$1 && base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) == $arrayId$$blk_sad else p19$1);
    p19$2 := (if p3$2 && base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) == $arrayId$$blk_sad else p19$2);
    p18$1 := (if p3$1 && base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$1) != $arrayId$$blk_sad else p18$1);
    p18$2 := (if p3$2 && base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad then base#MKPTR($bo_5.0$2) != $arrayId$$blk_sad else p18$2);
    assert {:bad_pointer_access} {:sourceloc_num 46} {:thread 1} p18$1 ==> false;
    assert {:bad_pointer_access} {:sourceloc_num 46} {:thread 2} p18$2 ==> false;
    call {:sourceloc} {:sourceloc_num 45} _LOG_WRITE_$$blk_sad(p19$1, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32)), 3bv32), v37$1[16:8], $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32)), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p19$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32)), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 45} _CHECK_WRITE_$$blk_sad(p19$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32)), 3bv32), v37$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32)), 3bv32)] := (if p19$1 then v37$1[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$1), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 4bv32)), 3bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32)), 3bv32)] := (if p19$2 then v37$2[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_5.0$2), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 4bv32)), 3bv32)]);
    v38$1 := (if p3$1 then BV16_ADD(BV16_ADD(v8$1, v14$1), BV16_ADD(v20$1, v26$1)) else v38$1);
    v38$2 := (if p3$2 then BV16_ADD(BV16_ADD(v8$2, v14$2), BV16_ADD(v20$2, v26$2)) else v38$2);
    v39$1 := (if p3$1 then BV16_ADD(BV16_ADD(v11$1, v17$1), BV16_ADD(v23$1, v29$1)) else v39$1);
    v39$2 := (if p3$2 then BV16_ADD(BV16_ADD(v11$2, v17$2), BV16_ADD(v23$2, v29$2)) else v39$2);
    p21$1 := (if p3$1 && base#MKPTR($bo_4.0$1) == $arrayId$$blk_sad then base#MKPTR($bo_4.0$1) == $arrayId$$blk_sad else p21$1);
    p21$2 := (if p3$2 && base#MKPTR($bo_4.0$2) == $arrayId$$blk_sad then base#MKPTR($bo_4.0$2) == $arrayId$$blk_sad else p21$2);
    p20$1 := (if p3$1 && base#MKPTR($bo_4.0$1) != $arrayId$$blk_sad then base#MKPTR($bo_4.0$1) != $arrayId$$blk_sad else p20$1);
    p20$2 := (if p3$2 && base#MKPTR($bo_4.0$2) != $arrayId$$blk_sad then base#MKPTR($bo_4.0$2) != $arrayId$$blk_sad else p20$2);
    assert {:bad_pointer_access} {:sourceloc_num 48} {:thread 1} p20$1 ==> false;
    assert {:bad_pointer_access} {:sourceloc_num 48} {:thread 2} p20$2 ==> false;
    call {:sourceloc} {:sourceloc_num 47} _LOG_WRITE_$$blk_sad(p21$1, BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32)), v38$1[8:0], $$blk_sad[BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p21$2, BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32)));
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 47} _CHECK_WRITE_$$blk_sad(p21$2, BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32)), v38$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32))] := (if p21$1 then v38$1[8:0] else $$blk_sad[BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32))]);
    $$blk_sad[BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32))] := (if p21$2 then v38$2[8:0] else $$blk_sad[BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32))]);
    p23$1 := (if p3$1 && base#MKPTR($bo_4.0$1) == $arrayId$$blk_sad then base#MKPTR($bo_4.0$1) == $arrayId$$blk_sad else p23$1);
    p23$2 := (if p3$2 && base#MKPTR($bo_4.0$2) == $arrayId$$blk_sad then base#MKPTR($bo_4.0$2) == $arrayId$$blk_sad else p23$2);
    p22$1 := (if p3$1 && base#MKPTR($bo_4.0$1) != $arrayId$$blk_sad then base#MKPTR($bo_4.0$1) != $arrayId$$blk_sad else p22$1);
    p22$2 := (if p3$2 && base#MKPTR($bo_4.0$2) != $arrayId$$blk_sad then base#MKPTR($bo_4.0$2) != $arrayId$$blk_sad else p22$2);
    assert {:bad_pointer_access} {:sourceloc_num 50} {:thread 1} p22$1 ==> false;
    assert {:bad_pointer_access} {:sourceloc_num 50} {:thread 2} p22$2 ==> false;
    call {:sourceloc} {:sourceloc_num 49} _LOG_WRITE_$$blk_sad(p23$1, BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 1bv32), v38$1[16:8], $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p23$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 49} _CHECK_WRITE_$$blk_sad(p23$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 1bv32), v38$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 1bv32)] := (if p23$1 then v38$1[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 1bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 1bv32)] := (if p23$2 then v38$2[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 1bv32)]);
    p25$1 := (if p3$1 && base#MKPTR($bo_4.0$1) == $arrayId$$blk_sad then base#MKPTR($bo_4.0$1) == $arrayId$$blk_sad else p25$1);
    p25$2 := (if p3$2 && base#MKPTR($bo_4.0$2) == $arrayId$$blk_sad then base#MKPTR($bo_4.0$2) == $arrayId$$blk_sad else p25$2);
    p24$1 := (if p3$1 && base#MKPTR($bo_4.0$1) != $arrayId$$blk_sad then base#MKPTR($bo_4.0$1) != $arrayId$$blk_sad else p24$1);
    p24$2 := (if p3$2 && base#MKPTR($bo_4.0$2) != $arrayId$$blk_sad then base#MKPTR($bo_4.0$2) != $arrayId$$blk_sad else p24$2);
    assert {:bad_pointer_access} {:sourceloc_num 52} {:thread 1} p24$1 ==> false;
    assert {:bad_pointer_access} {:sourceloc_num 52} {:thread 2} p24$2 ==> false;
    call {:sourceloc} {:sourceloc_num 51} _LOG_WRITE_$$blk_sad(p25$1, BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 2bv32), v39$1[8:0], $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p25$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 51} _CHECK_WRITE_$$blk_sad(p25$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 2bv32), v39$2[8:0]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 2bv32)] := (if p25$1 then v39$1[8:0] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 2bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 2bv32)] := (if p25$2 then v39$2[8:0] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 2bv32)]);
    p27$1 := (if p3$1 && base#MKPTR($bo_4.0$1) == $arrayId$$blk_sad then base#MKPTR($bo_4.0$1) == $arrayId$$blk_sad else p27$1);
    p27$2 := (if p3$2 && base#MKPTR($bo_4.0$2) == $arrayId$$blk_sad then base#MKPTR($bo_4.0$2) == $arrayId$$blk_sad else p27$2);
    p26$1 := (if p3$1 && base#MKPTR($bo_4.0$1) != $arrayId$$blk_sad then base#MKPTR($bo_4.0$1) != $arrayId$$blk_sad else p26$1);
    p26$2 := (if p3$2 && base#MKPTR($bo_4.0$2) != $arrayId$$blk_sad then base#MKPTR($bo_4.0$2) != $arrayId$$blk_sad else p26$2);
    assert {:bad_pointer_access} {:sourceloc_num 54} {:thread 1} p26$1 ==> false;
    assert {:bad_pointer_access} {:sourceloc_num 54} {:thread 2} p26$2 ==> false;
    call {:sourceloc} {:sourceloc_num 53} _LOG_WRITE_$$blk_sad(p27$1, BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 3bv32), v39$1[16:8], $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p27$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 53} _CHECK_WRITE_$$blk_sad(p27$2, BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 3bv32), v39$2[16:8]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 3bv32)] := (if p27$1 then v39$1[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$1), BV32_MUL($search_pos.0$1, 4bv32)), 3bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 3bv32)] := (if p27$2 then v39$2[16:8] else $$blk_sad[BV32_ADD(BV32_ADD(offset#MKPTR($bo_4.0$2), BV32_MUL($search_pos.0$2, 4bv32)), 3bv32)]);
    $search_pos.0$1 := (if p3$1 then BV32_ADD($search_pos.0$1, 32bv32) else $search_pos.0$1);
    $search_pos.0$2 := (if p3$2 then BV32_ADD($search_pos.0$2, 32bv32) else $search_pos.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, $3.tail;

  $3.tail:
    assume !p2$1 && !p2$2;
    return;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $3;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 11bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 9bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$blk_sad: bv8;

procedure {:inline 1} _LOG_READ_$$blk_sad(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$blk_sad;



implementation {:inline 1} _LOG_READ_$$blk_sad(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$blk_sad := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blk_sad == _value then true else _READ_HAS_OCCURRED_$$blk_sad);
    return;
}



procedure _CHECK_READ_$$blk_sad(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "blk_sad"} {:array "$$blk_sad"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$blk_sad && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$blk_sad);
  requires {:source_name "blk_sad"} {:array "$$blk_sad"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$blk_sad && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$blk_sad: bool;

procedure {:inline 1} _LOG_WRITE_$$blk_sad(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$blk_sad, _WRITE_READ_BENIGN_FLAG_$$blk_sad;



implementation {:inline 1} _LOG_WRITE_$$blk_sad(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$blk_sad := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blk_sad == _value then true else _WRITE_HAS_OCCURRED_$$blk_sad);
    _WRITE_READ_BENIGN_FLAG_$$blk_sad := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$blk_sad == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$blk_sad);
    return;
}



procedure _CHECK_WRITE_$$blk_sad(_P: bool, _offset: bv32, _value: bv8);
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



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
