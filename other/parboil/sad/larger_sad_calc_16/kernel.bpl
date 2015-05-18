type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP16(x: [bv32]bv16, y: bv32) returns (z$1: bv16, A$1: [bv32]bv16, z$2: bv16, A$2: [bv32]bv16);



var {:source_name "blk_sad"} {:global} $$blk_sad: [bv32]bv16;

axiom {:array_info "$$blk_sad"} {:global} {:elem_width 16} {:source_name "blk_sad"} {:source_elem_width 16} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 16} {:source_elem_width 16} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$blk_sad: bool;

var {:race_checking} {:global} {:elem_width 16} {:source_elem_width 16} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$blk_sad: bool;

var {:race_checking} {:global} {:elem_width 16} {:source_elem_width 16} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$blk_sad: bool;

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

function {:bvbuiltin "bvadd"} BV16_ADD(bv16, bv16) : bv16;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvashr"} BV32_ASHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "larger_sad_calc_16"} {:kernel} $larger_sad_calc_16($mb_width: bv32, $mb_height: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $mb_width == 11bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $mb_height == 9bv32 then 1bv1 else 0bv1) != 0bv1;
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



implementation {:source_name "larger_sad_calc_16"} {:kernel} $larger_sad_calc_16($mb_width: bv32, $mb_height: bv32)
{
  var $search_pos.0$1: bv32;
  var $search_pos.0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v0: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bv16;
  var v6$2: bv16;
  var v7$1: bv16;
  var v7$2: bv16;
  var v8$1: bv16;
  var v8$2: bv16;
  var v9$1: bv16;
  var v9$2: bv16;
  var v10$1: bv16;
  var v10$2: bv16;
  var v11$1: bv16;
  var v11$2: bv16;
  var v12$1: bv16;
  var v12$2: bv16;
  var v13$1: bv16;
  var v13$2: bv16;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var p2$1: bool;
  var p2$2: bool;


  $0:
    v0 := BV32_MUL(BV32_MUL(BV32_ASHR(BV32_SHL($mb_height, 8bv32), 8bv32), BV32_ASHR(BV32_SHL($mb_width, 8bv32), 8bv32)), 1096bv32);
    v1$1 := BV32_MUL(BV32_ADD(BV32_MUL(BV32_ASHR(BV32_SHL($mb_width, 8bv32), 8bv32), BV32_ASHR(BV32_SHL(group_id_y$1, 8bv32), 8bv32)), group_id_x$1), 1096bv32);
    v1$2 := BV32_MUL(BV32_ADD(BV32_MUL(BV32_ASHR(BV32_SHL($mb_width, 8bv32), 8bv32), BV32_ASHR(BV32_SHL(group_id_y$2, 8bv32), 8bv32)), group_id_x$2), 1096bv32);
    v2$1 := BV32_SHL(BV32_ADD(v0, v1$1), 2bv32);
    v2$2 := BV32_SHL(BV32_ADD(v0, v1$2), 2bv32);
    v3$1 := BV32_SHL(BV32_ADD(v0, v1$1), 1bv32);
    v3$2 := BV32_SHL(BV32_ADD(v0, v1$2), 1bv32);
    v4$1 := BV32_MUL(v1$1, 2bv32);
    v4$2 := BV32_MUL(v1$2, 2bv32);
    $search_pos.0$1 := local_id_x$1;
    $search_pos.0$2 := local_id_x$2;
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 3} p0$1 ==> true;
    v5$1 := (if p0$1 then BV32_SLT($search_pos.0$1, 545bv32) else v5$1);
    v5$2 := (if p0$2 then BV32_SLT($search_pos.0$2, 545bv32) else v5$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p1$1 := (if p0$1 && v5$1 then v5$1 else p1$1);
    p1$2 := (if p0$2 && v5$2 then v5$2 else p1$2);
    p0$1 := (if p0$1 && !v5$1 then v5$1 else p0$1);
    p0$2 := (if p0$2 && !v5$2 then v5$2 else p0$2);
    call {:sourceloc} {:sourceloc_num 5} _LOG_READ_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(v2$1, v0), BV32_MUL($search_pos.0$1, 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_MUL($search_pos.0$1, 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 5} _CHECK_READ_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v2$2, v0), BV32_MUL($search_pos.0$2, 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_MUL($search_pos.0$2, 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v6$1 := (if p1$1 then $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_MUL($search_pos.0$1, 2bv32))] else v6$1);
    v6$2 := (if p1$2 then $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_MUL($search_pos.0$2, 2bv32))] else v6$2);
    call {:sourceloc} {:sourceloc_num 6} _LOG_READ_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(v2$1, v0), BV32_ADD(BV32_MUL($search_pos.0$1, 2bv32), 1bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_ADD(BV32_MUL($search_pos.0$1, 2bv32), 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 6} _CHECK_READ_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v2$2, v0), BV32_ADD(BV32_MUL($search_pos.0$2, 2bv32), 1bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_ADD(BV32_MUL($search_pos.0$2, 2bv32), 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v7$1 := (if p1$1 then $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_ADD(BV32_MUL($search_pos.0$1, 2bv32), 1bv32))] else v7$1);
    v7$2 := (if p1$2 then $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_ADD(BV32_MUL($search_pos.0$2, 2bv32), 1bv32))] else v7$2);
    call {:sourceloc} {:sourceloc_num 7} _LOG_READ_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(v2$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 7} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 7} _CHECK_READ_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v2$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v8$1 := (if p1$1 then $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32))] else v8$1);
    v8$2 := (if p1$2 then $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32))] else v8$2);
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(v2$1, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 1bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v2$2, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 1bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v9$1 := (if p1$1 then $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32), 1bv32))] else v9$1);
    v9$2 := (if p1$2 then $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32), 1bv32))] else v9$2);
    call {:sourceloc} {:sourceloc_num 9} _LOG_READ_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(v2$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 9} _CHECK_READ_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v2$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v10$1 := (if p1$1 then $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 2bv32))] else v10$1);
    v10$2 := (if p1$2 then $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 2bv32))] else v10$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(v2$1, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 2bv32), 1bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 2bv32), 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v2$2, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 2bv32), 1bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 2bv32), 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v11$1 := (if p1$1 then $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 1096bv32), 2bv32), 1bv32))] else v11$1);
    v11$2 := (if p1$2 then $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 1096bv32), 2bv32), 1bv32))] else v11$2);
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(v2$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 1644bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 1644bv32), 2bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v2$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 1644bv32), 2bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 1644bv32), 2bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v12$1 := (if p1$1 then $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 1644bv32), 2bv32))] else v12$1);
    v12$2 := (if p1$2 then $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 1644bv32), 2bv32))] else v12$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(v2$1, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 1644bv32), 2bv32), 1bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 1644bv32), 2bv32), 1bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v2$2, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 1644bv32), 2bv32), 1bv32)), $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 1644bv32), 2bv32), 1bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$blk_sad"} true;
    v13$1 := (if p1$1 then $$blk_sad[BV32_ADD(BV32_ADD(v2$1, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$1, 1644bv32), 2bv32), 1bv32))] else v13$1);
    v13$2 := (if p1$2 then $$blk_sad[BV32_ADD(BV32_ADD(v2$2, v0), BV32_ADD(BV32_MUL(BV32_ADD($search_pos.0$2, 1644bv32), 2bv32), 1bv32))] else v13$2);
    call {:sourceloc} {:sourceloc_num 13} _LOG_WRITE_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL($search_pos.0$1, 2bv32)), BV16_ADD(v6$1, v10$1), $$blk_sad[BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL($search_pos.0$1, 2bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL($search_pos.0$2, 2bv32)));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 13} _CHECK_WRITE_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL($search_pos.0$2, 2bv32)), BV16_ADD(v6$2, v10$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL($search_pos.0$1, 2bv32))] := (if p1$1 then BV16_ADD(v6$1, v10$1) else $$blk_sad[BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL($search_pos.0$1, 2bv32))]);
    $$blk_sad[BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL($search_pos.0$2, 2bv32))] := (if p1$2 then BV16_ADD(v6$2, v10$2) else $$blk_sad[BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL($search_pos.0$2, 2bv32))]);
    call {:sourceloc} {:sourceloc_num 14} _LOG_WRITE_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL($search_pos.0$1, 2bv32)), 1bv32), BV16_ADD(v7$1, v11$1), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL($search_pos.0$1, 2bv32)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL($search_pos.0$2, 2bv32)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 14} _CHECK_WRITE_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL($search_pos.0$2, 2bv32)), 1bv32), BV16_ADD(v7$2, v11$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL($search_pos.0$1, 2bv32)), 1bv32)] := (if p1$1 then BV16_ADD(v7$1, v11$1) else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL($search_pos.0$1, 2bv32)), 1bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL($search_pos.0$2, 2bv32)), 1bv32)] := (if p1$2 then BV16_ADD(v7$2, v11$2) else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL($search_pos.0$2, 2bv32)), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32)), BV16_ADD(v8$1, v12$1), $$blk_sad[BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32)));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32)), BV16_ADD(v8$2, v12$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32))] := (if p1$1 then BV16_ADD(v8$1, v12$1) else $$blk_sad[BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32))]);
    $$blk_sad[BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32))] := (if p1$2 then BV16_ADD(v8$2, v12$2) else $$blk_sad[BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32))]);
    call {:sourceloc} {:sourceloc_num 16} _LOG_WRITE_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32)), 1bv32), BV16_ADD(v9$1, v13$1), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 16} _CHECK_WRITE_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32)), 1bv32), BV16_ADD(v9$2, v13$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32)), 1bv32)] := (if p1$1 then BV16_ADD(v9$1, v13$1) else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v3$1, v0), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32)), 1bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32)), 1bv32)] := (if p1$2 then BV16_ADD(v9$2, v13$2) else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v3$2, v0), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32)), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL($search_pos.0$1, 2bv32)), BV16_ADD(v6$1, v8$1), $$blk_sad[BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL($search_pos.0$1, 2bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL($search_pos.0$2, 2bv32)));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL($search_pos.0$2, 2bv32)), BV16_ADD(v6$2, v8$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL($search_pos.0$1, 2bv32))] := (if p1$1 then BV16_ADD(v6$1, v8$1) else $$blk_sad[BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL($search_pos.0$1, 2bv32))]);
    $$blk_sad[BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL($search_pos.0$2, 2bv32))] := (if p1$2 then BV16_ADD(v6$2, v8$2) else $$blk_sad[BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL($search_pos.0$2, 2bv32))]);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL($search_pos.0$1, 2bv32)), 1bv32), BV16_ADD(v7$1, v9$1), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL($search_pos.0$1, 2bv32)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL($search_pos.0$2, 2bv32)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL($search_pos.0$2, 2bv32)), 1bv32), BV16_ADD(v7$2, v9$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL($search_pos.0$1, 2bv32)), 1bv32)] := (if p1$1 then BV16_ADD(v7$1, v9$1) else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL($search_pos.0$1, 2bv32)), 1bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL($search_pos.0$2, 2bv32)), 1bv32)] := (if p1$2 then BV16_ADD(v7$2, v9$2) else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL($search_pos.0$2, 2bv32)), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32)), BV16_ADD(v10$1, v12$1), $$blk_sad[BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32)));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32)), BV16_ADD(v10$2, v12$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32))] := (if p1$1 then BV16_ADD(v10$1, v12$1) else $$blk_sad[BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32))]);
    $$blk_sad[BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32))] := (if p1$2 then BV16_ADD(v10$2, v12$2) else $$blk_sad[BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32))]);
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32)), 1bv32), BV16_ADD(v11$1, v13$1), $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32)), 1bv32), BV16_ADD(v11$2, v13$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32)), 1bv32)] := (if p1$1 then BV16_ADD(v11$1, v13$1) else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$1), BV32_MUL(BV32_ADD($search_pos.0$1, 548bv32), 2bv32)), 1bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32)), 1bv32)] := (if p1$2 then BV16_ADD(v11$2, v13$2) else $$blk_sad[BV32_ADD(BV32_ADD(BV32_ADD(v0, v4$2), BV32_MUL(BV32_ADD($search_pos.0$2, 548bv32), 2bv32)), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 21} _LOG_WRITE_$$blk_sad(p1$1, BV32_ADD(v1$1, BV32_MUL($search_pos.0$1, 2bv32)), BV16_ADD(BV16_ADD(v6$1, v8$1), BV16_ADD(v10$1, v12$1)), $$blk_sad[BV32_ADD(v1$1, BV32_MUL($search_pos.0$1, 2bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p1$2, BV32_ADD(v1$2, BV32_MUL($search_pos.0$2, 2bv32)));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 21} _CHECK_WRITE_$$blk_sad(p1$2, BV32_ADD(v1$2, BV32_MUL($search_pos.0$2, 2bv32)), BV16_ADD(BV16_ADD(v6$2, v8$2), BV16_ADD(v10$2, v12$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(v1$1, BV32_MUL($search_pos.0$1, 2bv32))] := (if p1$1 then BV16_ADD(BV16_ADD(v6$1, v8$1), BV16_ADD(v10$1, v12$1)) else $$blk_sad[BV32_ADD(v1$1, BV32_MUL($search_pos.0$1, 2bv32))]);
    $$blk_sad[BV32_ADD(v1$2, BV32_MUL($search_pos.0$2, 2bv32))] := (if p1$2 then BV16_ADD(BV16_ADD(v6$2, v8$2), BV16_ADD(v10$2, v12$2)) else $$blk_sad[BV32_ADD(v1$2, BV32_MUL($search_pos.0$2, 2bv32))]);
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$blk_sad(p1$1, BV32_ADD(BV32_ADD(v1$1, BV32_MUL($search_pos.0$1, 2bv32)), 1bv32), BV16_ADD(BV16_ADD(v7$1, v9$1), BV16_ADD(v11$1, v13$1)), $$blk_sad[BV32_ADD(BV32_ADD(v1$1, BV32_MUL($search_pos.0$1, 2bv32)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v1$2, BV32_MUL($search_pos.0$2, 2bv32)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$blk_sad(p1$2, BV32_ADD(BV32_ADD(v1$2, BV32_MUL($search_pos.0$2, 2bv32)), 1bv32), BV16_ADD(BV16_ADD(v7$2, v9$2), BV16_ADD(v11$2, v13$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$blk_sad"} true;
    $$blk_sad[BV32_ADD(BV32_ADD(v1$1, BV32_MUL($search_pos.0$1, 2bv32)), 1bv32)] := (if p1$1 then BV16_ADD(BV16_ADD(v7$1, v9$1), BV16_ADD(v11$1, v13$1)) else $$blk_sad[BV32_ADD(BV32_ADD(v1$1, BV32_MUL($search_pos.0$1, 2bv32)), 1bv32)]);
    $$blk_sad[BV32_ADD(BV32_ADD(v1$2, BV32_MUL($search_pos.0$2, 2bv32)), 1bv32)] := (if p1$2 then BV16_ADD(BV16_ADD(v7$2, v9$2), BV16_ADD(v11$2, v13$2)) else $$blk_sad[BV32_ADD(BV32_ADD(v1$2, BV32_MUL($search_pos.0$2, 2bv32)), 1bv32)]);
    $search_pos.0$1 := (if p1$1 then BV32_ADD($search_pos.0$1, 32bv32) else $search_pos.0$1);
    $search_pos.0$2 := (if p1$2 then BV32_ADD($search_pos.0$2, 32bv32) else $search_pos.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    return;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 11bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 9bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

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



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
