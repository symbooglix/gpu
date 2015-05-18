type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "c_strel"} {:constant} $$c_strel$1: [bv32]bv32;

var {:source_name "c_strel"} {:constant} $$c_strel$2: [bv32]bv32;

axiom {:array_info "$$c_strel"} {:constant} {:elem_width 32} {:source_name "c_strel"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:source_name "img"} {:global} $$img: [bv32]bv32;

axiom {:array_info "$$img"} {:global} {:elem_width 32} {:source_name "img"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$img: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$img: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$img: bool;

var {:source_name "dilated"} {:global} $$dilated: [bv32]bv32;

axiom {:array_info "$$dilated"} {:global} {:elem_width 32} {:source_name "dilated"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$dilated: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$dilated: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$dilated: bool;

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

function FLT32(bv32, bv32) : bool;

function FUNO32(bv32, bv32) : bool;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "dilate_kernel"} {:kernel} $dilate_kernel($img_m: bv32, $img_n: bv32, $strel_m: bv32, $strel_n: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $img_m == 219bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $img_n == 640bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $strel_m == 25bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 3} {:thread 1} (if $strel_n == 25bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$img && !_WRITE_HAS_OCCURRED_$$img && !_ATOMIC_HAS_OCCURRED_$$img;
  requires !_READ_HAS_OCCURRED_$$dilated && !_WRITE_HAS_OCCURRED_$$dilated && !_ATOMIC_HAS_OCCURRED_$$dilated;
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
  modifies _WRITE_HAS_OCCURRED_$$dilated, _WRITE_READ_BENIGN_FLAG_$$dilated, _WRITE_READ_BENIGN_FLAG_$$dilated;



implementation {:source_name "dilate_kernel"} {:kernel} $dilate_kernel($img_m: bv32, $img_n: bv32, $strel_m: bv32, $strel_n: bv32)
{
  var $max.0$1: bv32;
  var $max.0$2: bv32;
  var $el_i.0: bv32;
  var $max.4$1: bv32;
  var $max.4$2: bv32;
  var $max.1$1: bv32;
  var $max.1$2: bv32;
  var $el_j.0$1: bv32;
  var $el_j.0$2: bv32;
  var $max.3$1: bv32;
  var $max.3$2: bv32;
  var $max.2$1: bv32;
  var $max.2$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v3: bool;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5$1: bool;
  var v5$2: bool;
  var v6$1: bool;
  var v6$2: bool;
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bool;
  var v9$2: bool;
  var v10$1: bool;
  var v10$2: bool;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bool;
  var v12$2: bool;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bool;
  var v14$2: bool;
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
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_SREM(v0$1, $img_m);
    v1$2 := BV32_SREM(v0$2, $img_m);
    v2$1 := BV32_SDIV(v0$1, $img_m);
    v2$2 := BV32_SDIV(v0$2, $img_m);
    $max.0$1, $el_i.0 := 0bv32, 0bv32;
    $max.0$2 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 5} true;
    v3 := BV32_SLT($el_i.0, $strel_m);
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
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v3 && !v3;
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$dilated(true, BV32_ADD(BV32_MUL(v1$1, $img_n), v2$1), $max.0$1, $$dilated[BV32_ADD(BV32_MUL(v1$1, $img_n), v2$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dilated(true, BV32_ADD(BV32_MUL(v1$2, $img_n), v2$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$dilated(true, BV32_ADD(BV32_MUL(v1$2, $img_n), v2$2), $max.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dilated"} true;
    $$dilated[BV32_ADD(BV32_MUL(v1$1, $img_n), v2$1)] := $max.0$1;
    $$dilated[BV32_ADD(BV32_MUL(v1$2, $img_n), v2$2)] := $max.0$2;
    return;

  $truebb:
    assume {:partition} v3 && v3;
    v4$1 := BV32_ADD(BV32_SUB(v1$1, BV32_SDIV($strel_m, 2bv32)), $el_i.0);
    v4$2 := BV32_ADD(BV32_SUB(v1$2, BV32_SDIV($strel_m, 2bv32)), $el_i.0);
    v5$1 := BV32_SGE(v4$1, 0bv32);
    v5$2 := BV32_SGE(v4$2, 0bv32);
    p1$1 := (if v5$1 then v5$1 else p1$1);
    p1$2 := (if v5$2 then v5$2 else p1$2);
    p0$1 := (if !v5$1 then !v5$1 else p0$1);
    p0$2 := (if !v5$2 then !v5$2 else p0$2);
    $max.4$1 := (if p0$1 then $max.0$1 else $max.4$1);
    $max.4$2 := (if p0$2 then $max.0$2 else $max.4$2);
    v6$1 := (if p1$1 then BV32_SLT(v4$1, $img_m) else v6$1);
    v6$2 := (if p1$2 then BV32_SLT(v4$2, $img_m) else v6$2);
    p3$1 := (if p1$1 && v6$1 then v6$1 else p3$1);
    p3$2 := (if p1$2 && v6$2 then v6$2 else p3$2);
    p2$1 := (if p1$1 && !v6$1 then !v6$1 else p2$1);
    p2$2 := (if p1$2 && !v6$2 then !v6$2 else p2$2);
    $max.4$1 := (if p2$1 then $max.0$1 else $max.4$1);
    $max.4$2 := (if p2$2 then $max.0$2 else $max.4$2);
    $max.1$1, $el_j.0$1 := (if p3$1 then $max.0$1 else $max.1$1), (if p3$1 then 0bv32 else $el_j.0$1);
    $max.1$2, $el_j.0$2 := (if p3$2 then $max.0$2 else $max.1$2), (if p3$2 then 0bv32 else $el_j.0$2);
    p4$1 := (if p3$1 then true else p4$1);
    p4$2 := (if p3$2 then true else p4$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_1"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 9} p4$1 ==> true;
    v7$1 := (if p4$1 then BV32_SLT($el_j.0$1, $strel_n) else v7$1);
    v7$2 := (if p4$2 then BV32_SLT($el_j.0$2, $strel_n) else v7$2);
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
    p5$1 := (if p4$1 && v7$1 then v7$1 else p5$1);
    p5$2 := (if p4$2 && v7$2 then v7$2 else p5$2);
    p4$1 := (if p4$1 && !v7$1 then v7$1 else p4$1);
    p4$2 := (if p4$2 && !v7$2 then v7$2 else p4$2);
    v8$1 := (if p5$1 then BV32_ADD(BV32_SUB(v2$1, BV32_SDIV($strel_n, 2bv32)), $el_j.0$1) else v8$1);
    v8$2 := (if p5$2 then BV32_ADD(BV32_SUB(v2$2, BV32_SDIV($strel_n, 2bv32)), $el_j.0$2) else v8$2);
    v9$1 := (if p5$1 then BV32_SGE(v8$1, 0bv32) else v9$1);
    v9$2 := (if p5$2 then BV32_SGE(v8$2, 0bv32) else v9$2);
    p7$1 := (if p5$1 && v9$1 then v9$1 else p7$1);
    p7$2 := (if p5$2 && v9$2 then v9$2 else p7$2);
    p6$1 := (if p5$1 && !v9$1 then !v9$1 else p6$1);
    p6$2 := (if p5$2 && !v9$2 then !v9$2 else p6$2);
    $max.3$1 := (if p6$1 then $max.1$1 else $max.3$1);
    $max.3$2 := (if p6$2 then $max.1$2 else $max.3$2);
    v10$1 := (if p7$1 then BV32_SLT(v8$1, $img_n) else v10$1);
    v10$2 := (if p7$2 then BV32_SLT(v8$2, $img_n) else v10$2);
    p9$1 := (if p7$1 && v10$1 then v10$1 else p9$1);
    p9$2 := (if p7$2 && v10$2 then v10$2 else p9$2);
    p8$1 := (if p7$1 && !v10$1 then !v10$1 else p8$1);
    p8$2 := (if p7$2 && !v10$2 then !v10$2 else p8$2);
    $max.3$1 := (if p8$1 then $max.1$1 else $max.3$1);
    $max.3$2 := (if p8$2 then $max.1$2 else $max.3$2);
    v11$1 := (if p9$1 then $$c_strel$1[BV32_ADD(BV32_MUL($el_i.0, $strel_n), $el_j.0$1)] else v11$1);
    v11$2 := (if p9$2 then $$c_strel$2[BV32_ADD(BV32_MUL($el_i.0, $strel_n), $el_j.0$2)] else v11$2);
    v12$1 := (if p9$1 then FLT32(0bv32, v11$1) || FLT32(v11$1, 0bv32) || FUNO32(v11$1, 0bv32) else v12$1);
    v12$2 := (if p9$2 then FLT32(0bv32, v11$2) || FLT32(v11$2, 0bv32) || FUNO32(v11$2, 0bv32) else v12$2);
    p11$1 := (if p9$1 && v12$1 then v12$1 else p11$1);
    p11$2 := (if p9$2 && v12$2 then v12$2 else p11$2);
    p10$1 := (if p9$1 && !v12$1 then !v12$1 else p10$1);
    p10$2 := (if p9$2 && !v12$2 then !v12$2 else p10$2);
    $max.3$1 := (if p10$1 then $max.1$1 else $max.3$1);
    $max.3$2 := (if p10$2 then $max.1$2 else $max.3$2);
    v13$1 := (if p11$1 then $$img[BV32_ADD(BV32_MUL(v8$1, $img_m), v4$1)] else v13$1);
    v13$2 := (if p11$2 then $$img[BV32_ADD(BV32_MUL(v8$2, $img_m), v4$2)] else v13$2);
    v14$1 := (if p11$1 then FLT32($max.1$1, v13$1) else v14$1);
    v14$2 := (if p11$2 then FLT32($max.1$2, v13$2) else v14$2);
    p13$1 := (if p11$1 && v14$1 then v14$1 else p13$1);
    p13$2 := (if p11$2 && v14$2 then v14$2 else p13$2);
    p12$1 := (if p11$1 && !v14$1 then !v14$1 else p12$1);
    p12$2 := (if p11$2 && !v14$2 then !v14$2 else p12$2);
    $max.2$1 := (if p12$1 then $max.1$1 else $max.2$1);
    $max.2$2 := (if p12$2 then $max.1$2 else $max.2$2);
    $max.2$1 := (if p13$1 then v13$1 else $max.2$1);
    $max.2$2 := (if p13$2 then v13$2 else $max.2$2);
    $max.3$1 := (if p11$1 then $max.2$1 else $max.3$1);
    $max.3$2 := (if p11$2 then $max.2$2 else $max.3$2);
    $max.1$1, $el_j.0$1 := (if p5$1 then $max.3$1 else $max.1$1), (if p5$1 then BV32_ADD($el_j.0$1, 1bv32) else $el_j.0$1);
    $max.1$2, $el_j.0$2 := (if p5$2 then $max.3$2 else $max.1$2), (if p5$2 then BV32_ADD($el_j.0$2, 1bv32) else $el_j.0$2);
    p4$1 := (if p5$1 then true else p4$1);
    p4$2 := (if p5$2 then true else p4$2);
    goto $5.backedge, $5.tail;

  $5.tail:
    assume !p4$1 && !p4$2;
    $max.4$1 := (if p3$1 then $max.1$1 else $max.4$1);
    $max.4$2 := (if p3$2 then $max.1$2 else $max.4$2);
    $max.0$1, $el_i.0 := $max.4$1, BV32_ADD($el_i.0, 1bv32);
    $max.0$2 := $max.4$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $5.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $5;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 176bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 797bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$img: bv32;

procedure {:inline 1} _LOG_READ_$$img(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$img;



implementation {:inline 1} _LOG_READ_$$img(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then true else _READ_HAS_OCCURRED_$$img);
    return;
}



procedure _CHECK_READ_$$img(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$img);
  requires {:source_name "img"} {:array "$$img"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$img: bool;

procedure {:inline 1} _LOG_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$img, _WRITE_READ_BENIGN_FLAG_$$img;



implementation {:inline 1} _LOG_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then true else _WRITE_HAS_OCCURRED_$$img);
    _WRITE_READ_BENIGN_FLAG_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$img);
    return;
}



procedure _CHECK_WRITE_$$img(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img != _value);
  requires {:source_name "img"} {:array "$$img"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$img != _value);
  requires {:source_name "img"} {:array "$$img"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$img(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$img;



implementation {:inline 1} _LOG_ATOMIC_$$img(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$img := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$img);
    return;
}



procedure _CHECK_ATOMIC_$$img(_P: bool, _offset: bv32);
  requires {:source_name "img"} {:array "$$img"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);
  requires {:source_name "img"} {:array "$$img"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$img(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$img;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$img(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$img := (if _P && _WRITE_HAS_OCCURRED_$$img && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$img);
    return;
}



const _WATCHED_VALUE_$$dilated: bv32;

procedure {:inline 1} _LOG_READ_$$dilated(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$dilated;



implementation {:inline 1} _LOG_READ_$$dilated(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$dilated := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dilated == _value then true else _READ_HAS_OCCURRED_$$dilated);
    return;
}



procedure _CHECK_READ_$$dilated(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dilated"} {:array "$$dilated"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$dilated && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$dilated);
  requires {:source_name "dilated"} {:array "$$dilated"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$dilated && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$dilated: bool;

procedure {:inline 1} _LOG_WRITE_$$dilated(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$dilated, _WRITE_READ_BENIGN_FLAG_$$dilated;



implementation {:inline 1} _LOG_WRITE_$$dilated(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$dilated := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dilated == _value then true else _WRITE_HAS_OCCURRED_$$dilated);
    _WRITE_READ_BENIGN_FLAG_$$dilated := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dilated == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$dilated);
    return;
}



procedure _CHECK_WRITE_$$dilated(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dilated"} {:array "$$dilated"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$dilated && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dilated != _value);
  requires {:source_name "dilated"} {:array "$$dilated"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$dilated && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dilated != _value);
  requires {:source_name "dilated"} {:array "$$dilated"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$dilated && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$dilated(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$dilated;



implementation {:inline 1} _LOG_ATOMIC_$$dilated(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$dilated := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$dilated);
    return;
}



procedure _CHECK_ATOMIC_$$dilated(_P: bool, _offset: bv32);
  requires {:source_name "dilated"} {:array "$$dilated"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$dilated && _WATCHED_OFFSET == _offset);
  requires {:source_name "dilated"} {:array "$$dilated"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$dilated && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dilated(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$dilated;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dilated(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$dilated := (if _P && _WRITE_HAS_OCCURRED_$$dilated && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$dilated);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
