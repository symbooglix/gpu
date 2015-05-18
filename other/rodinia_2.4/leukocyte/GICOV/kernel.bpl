type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "grad_x"} {:global} $$grad_x: [bv32]bv32;

axiom {:array_info "$$grad_x"} {:global} {:elem_width 32} {:source_name "grad_x"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$grad_x: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$grad_x: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$grad_x: bool;

var {:source_name "grad_y"} {:global} $$grad_y: [bv32]bv32;

axiom {:array_info "$$grad_y"} {:global} {:elem_width 32} {:source_name "grad_y"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$grad_y: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$grad_y: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$grad_y: bool;

var {:source_name "c_sin_angle"} {:constant} $$c_sin_angle$1: [bv32]bv32;

var {:source_name "c_sin_angle"} {:constant} $$c_sin_angle$2: [bv32]bv32;

axiom {:array_info "$$c_sin_angle"} {:constant} {:elem_width 32} {:source_name "c_sin_angle"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:source_name "c_cos_angle"} {:constant} $$c_cos_angle$1: [bv32]bv32;

var {:source_name "c_cos_angle"} {:constant} $$c_cos_angle$2: [bv32]bv32;

axiom {:array_info "$$c_cos_angle"} {:constant} {:elem_width 32} {:source_name "c_cos_angle"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:source_name "c_tX"} {:constant} $$c_tX$1: [bv32]bv32;

var {:source_name "c_tX"} {:constant} $$c_tX$2: [bv32]bv32;

axiom {:array_info "$$c_tX"} {:constant} {:elem_width 32} {:source_name "c_tX"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:source_name "c_tY"} {:constant} $$c_tY$1: [bv32]bv32;

var {:source_name "c_tY"} {:constant} $$c_tY$2: [bv32]bv32;

axiom {:array_info "$$c_tY"} {:constant} {:elem_width 32} {:source_name "c_tY"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:source_name "gicov"} {:global} $$gicov: [bv32]bv32;

axiom {:array_info "$$gicov"} {:global} {:elem_width 32} {:source_name "gicov"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$gicov: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$gicov: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$gicov: bool;

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

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

procedure {:source_name "GICOV_kernel"} {:kernel} $GICOV_kernel($grad_m: bv32, $width: bv32, $height: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $grad_m == 219bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $width == 175bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $height == 596bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$grad_x && !_WRITE_HAS_OCCURRED_$$grad_x && !_ATOMIC_HAS_OCCURRED_$$grad_x;
  requires !_READ_HAS_OCCURRED_$$grad_y && !_WRITE_HAS_OCCURRED_$$grad_y && !_ATOMIC_HAS_OCCURRED_$$grad_y;
  requires !_READ_HAS_OCCURRED_$$gicov && !_WRITE_HAS_OCCURRED_$$gicov && !_ATOMIC_HAS_OCCURRED_$$gicov;
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
  modifies _WRITE_HAS_OCCURRED_$$gicov, _WRITE_READ_BENIGN_FLAG_$$gicov, _WRITE_READ_BENIGN_FLAG_$$gicov;



implementation {:source_name "GICOV_kernel"} {:kernel} $GICOV_kernel($grad_m: bv32, $width: bv32, $height: bv32)
{
  var $k.0$1: bv32;
  var $k.0$2: bv32;
  var $max_GICOV.0$1: bv32;
  var $max_GICOV.0$2: bv32;
  var $n.0$1: bv32;
  var $n.0$2: bv32;
  var $sum.0$1: bv32;
  var $sum.0$2: bv32;
  var $M2.0$1: bv32;
  var $M2.0$2: bv32;
  var $mean.0$1: bv32;
  var $mean.0$2: bv32;
  var $max_GICOV.1$1: bv32;
  var $max_GICOV.1$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bool;
  var v5$2: bool;
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
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bool;
  var v18$2: bool;
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


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_SGE(v0$1, BV32_MUL($width, $height));
    v1$2 := BV32_SGE(v0$2, BV32_MUL($width, $height));
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p1$1 := (if !v1$1 then !v1$1 else p1$1);
    p1$2 := (if !v1$2 then !v1$2 else p1$2);
    v2$1 := (if p1$1 then BV32_ADD(BV32_SDIV(v0$1, $width), 22bv32) else v2$1);
    v2$2 := (if p1$2 then BV32_ADD(BV32_SDIV(v0$2, $width), 22bv32) else v2$2);
    v3$1 := (if p1$1 then BV32_ADD(BV32_SREM(v0$1, $width), 22bv32) else v3$1);
    v3$2 := (if p1$2 then BV32_ADD(BV32_SREM(v0$2, $width), 22bv32) else v3$2);
    $k.0$1, $max_GICOV.0$1 := (if p1$1 then 0bv32 else $k.0$1), (if p1$1 then 0bv32 else $max_GICOV.0$1);
    $k.0$2, $max_GICOV.0$2 := (if p1$2 then 0bv32 else $k.0$2), (if p1$2 then 0bv32 else $max_GICOV.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 6} p2$1 ==> true;
    v4$1 := (if p2$1 then BV32_SLT($k.0$1, 7bv32) else v4$1);
    v4$2 := (if p2$2 then BV32_SLT($k.0$2, 7bv32) else v4$2);
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p3$1 := (if p2$1 && v4$1 then v4$1 else p3$1);
    p3$2 := (if p2$2 && v4$2 then v4$2 else p3$2);
    p2$1 := (if p2$1 && !v4$1 then v4$1 else p2$1);
    p2$2 := (if p2$2 && !v4$2 then v4$2 else p2$2);
    $n.0$1, $sum.0$1, $M2.0$1, $mean.0$1 := (if p3$1 then 0bv32 else $n.0$1), (if p3$1 then 0bv32 else $sum.0$1), (if p3$1 then 0bv32 else $M2.0$1), (if p3$1 then 0bv32 else $mean.0$1);
    $n.0$2, $sum.0$2, $M2.0$2, $mean.0$2 := (if p3$2 then 0bv32 else $n.0$2), (if p3$2 then 0bv32 else $sum.0$2), (if p3$2 then 0bv32 else $M2.0$2), (if p3$2 then 0bv32 else $mean.0$2);
    p4$1 := (if p3$1 then true else p4$1);
    p4$2 := (if p3$2 then true else p4$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_1"} true;
    assert p4$1 ==> p2$1;
    assert p4$2 ==> p2$2;
    assert {:block_sourceloc} {:sourceloc_num 8} p4$1 ==> true;
    v5$1 := (if p4$1 then BV32_SLT($n.0$1, 150bv32) else v5$1);
    v5$2 := (if p4$2 then BV32_SLT($n.0$2, 150bv32) else v5$2);
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    p5$1 := (if p4$1 && v5$1 then v5$1 else p5$1);
    p5$2 := (if p4$2 && v5$2 then v5$2 else p5$2);
    p4$1 := (if p4$1 && !v5$1 then v5$1 else p4$1);
    p4$2 := (if p4$2 && !v5$2 then v5$2 else p4$2);
    v6$1 := (if p5$1 then $$c_tY$1[BV32_ADD(BV32_MUL($k.0$1, 150bv32), $n.0$1)] else v6$1);
    v6$2 := (if p5$2 then $$c_tY$2[BV32_ADD(BV32_MUL($k.0$2, 150bv32), $n.0$2)] else v6$2);
    v7$1 := (if p5$1 then $$c_tX$1[BV32_ADD(BV32_MUL($k.0$1, 150bv32), $n.0$1)] else v7$1);
    v7$2 := (if p5$2 then $$c_tX$2[BV32_ADD(BV32_MUL($k.0$2, 150bv32), $n.0$2)] else v7$2);
    v8$1 := (if p5$1 then BV32_ADD(BV32_MUL(BV32_ADD(v2$1, v7$1), $grad_m), BV32_ADD(v3$1, v6$1)) else v8$1);
    v8$2 := (if p5$2 then BV32_ADD(BV32_MUL(BV32_ADD(v2$2, v7$2), $grad_m), BV32_ADD(v3$2, v6$2)) else v8$2);
    v9$1 := (if p5$1 then $$grad_x[v8$1] else v9$1);
    v9$2 := (if p5$2 then $$grad_x[v8$2] else v9$2);
    v10$1 := (if p5$1 then $$c_cos_angle$1[$n.0$1] else v10$1);
    v10$2 := (if p5$2 then $$c_cos_angle$2[$n.0$2] else v10$2);
    v11$1 := (if p5$1 then $$grad_y[v8$1] else v11$1);
    v11$2 := (if p5$2 then $$grad_y[v8$2] else v11$2);
    v12$1 := (if p5$1 then $$c_sin_angle$1[$n.0$1] else v12$1);
    v12$2 := (if p5$2 then $$c_sin_angle$2[$n.0$2] else v12$2);
    v13$1 := (if p5$1 then FADD32(FMUL32(v9$1, v10$1), FMUL32(v11$1, v12$1)) else v13$1);
    v13$2 := (if p5$2 then FADD32(FMUL32(v9$2, v10$2), FMUL32(v11$2, v12$2)) else v13$2);
    v14$1 := (if p5$1 then FSUB32(v13$1, $mean.0$1) else v14$1);
    v14$2 := (if p5$2 then FSUB32(v13$2, $mean.0$2) else v14$2);
    v15$1 := (if p5$1 then FADD32($mean.0$1, FDIV32(v14$1, SI32_TO_FP32(BV32_ADD($n.0$1, 1bv32)))) else v15$1);
    v15$2 := (if p5$2 then FADD32($mean.0$2, FDIV32(v14$2, SI32_TO_FP32(BV32_ADD($n.0$2, 1bv32)))) else v15$2);
    $n.0$1, $sum.0$1, $M2.0$1, $mean.0$1 := (if p5$1 then BV32_ADD($n.0$1, 1bv32) else $n.0$1), (if p5$1 then FADD32($sum.0$1, v13$1) else $sum.0$1), (if p5$1 then FADD32(FMUL32(v14$1, FSUB32(v13$1, v15$1)), $M2.0$1) else $M2.0$1), (if p5$1 then v15$1 else $mean.0$1);
    $n.0$2, $sum.0$2, $M2.0$2, $mean.0$2 := (if p5$2 then BV32_ADD($n.0$2, 1bv32) else $n.0$2), (if p5$2 then FADD32($sum.0$2, v13$2) else $sum.0$2), (if p5$2 then FADD32(FMUL32(v14$2, FSUB32(v13$2, v15$2)), $M2.0$2) else $M2.0$2), (if p5$2 then v15$2 else $mean.0$2);
    p4$1 := (if p5$1 then true else p4$1);
    p4$2 := (if p5$2 then true else p4$2);
    goto $5.backedge, $5.tail;

  $5.tail:
    assume !p4$1 && !p4$2;
    v16$1 := (if p3$1 then FDIV32($sum.0$1, 1125515264bv32) else v16$1);
    v16$2 := (if p3$2 then FDIV32($sum.0$2, 1125515264bv32) else v16$2);
    v17$1 := (if p3$1 then FDIV32($M2.0$1, 1125449728bv32) else v17$1);
    v17$2 := (if p3$2 then FDIV32($M2.0$2, 1125449728bv32) else v17$2);
    v18$1 := (if p3$1 then FLT32($max_GICOV.0$1, FDIV32(FMUL32(v16$1, v16$1), v17$1)) else v18$1);
    v18$2 := (if p3$2 then FLT32($max_GICOV.0$2, FDIV32(FMUL32(v16$2, v16$2), v17$2)) else v18$2);
    p7$1 := (if p3$1 && v18$1 then v18$1 else p7$1);
    p7$2 := (if p3$2 && v18$2 then v18$2 else p7$2);
    p6$1 := (if p3$1 && !v18$1 then !v18$1 else p6$1);
    p6$2 := (if p3$2 && !v18$2 then !v18$2 else p6$2);
    $max_GICOV.1$1 := (if p6$1 then $max_GICOV.0$1 else $max_GICOV.1$1);
    $max_GICOV.1$2 := (if p6$2 then $max_GICOV.0$2 else $max_GICOV.1$2);
    $max_GICOV.1$1 := (if p7$1 then FDIV32(FMUL32(v16$1, v16$1), v17$1) else $max_GICOV.1$1);
    $max_GICOV.1$2 := (if p7$2 then FDIV32(FMUL32(v16$2, v16$2), v17$2) else $max_GICOV.1$2);
    $k.0$1, $max_GICOV.0$1 := (if p3$1 then BV32_ADD($k.0$1, 1bv32) else $k.0$1), (if p3$1 then $max_GICOV.1$1 else $max_GICOV.0$1);
    $k.0$2, $max_GICOV.0$2 := (if p3$2 then BV32_ADD($k.0$2, 1bv32) else $k.0$2), (if p3$2 then $max_GICOV.1$2 else $max_GICOV.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, $3.tail;

  $3.tail:
    assume !p2$1 && !p2$2;
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$gicov(p1$1, BV32_ADD(BV32_MUL(v2$1, $grad_m), v3$1), $max_GICOV.0$1, $$gicov[BV32_ADD(BV32_MUL(v2$1, $grad_m), v3$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gicov(p1$2, BV32_ADD(BV32_MUL(v2$2, $grad_m), v3$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$gicov(p1$2, BV32_ADD(BV32_MUL(v2$2, $grad_m), v3$2), $max_GICOV.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gicov"} true;
    $$gicov[BV32_ADD(BV32_MUL(v2$1, $grad_m), v3$1)] := (if p1$1 then $max_GICOV.0$1 else $$gicov[BV32_ADD(BV32_MUL(v2$1, $grad_m), v3$1)]);
    $$gicov[BV32_ADD(BV32_MUL(v2$2, $grad_m), v3$2)] := (if p1$2 then $max_GICOV.0$2 else $$gicov[BV32_ADD(BV32_MUL(v2$2, $grad_m), v3$2)]);
    return;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $3;

  $5.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $5;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 408bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$grad_x: bv32;

procedure {:inline 1} _LOG_READ_$$grad_x(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$grad_x;



implementation {:inline 1} _LOG_READ_$$grad_x(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$grad_x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$grad_x == _value then true else _READ_HAS_OCCURRED_$$grad_x);
    return;
}



procedure _CHECK_READ_$$grad_x(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "grad_x"} {:array "$$grad_x"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$grad_x && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$grad_x);
  requires {:source_name "grad_x"} {:array "$$grad_x"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$grad_x && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$grad_x: bool;

procedure {:inline 1} _LOG_WRITE_$$grad_x(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$grad_x, _WRITE_READ_BENIGN_FLAG_$$grad_x;



implementation {:inline 1} _LOG_WRITE_$$grad_x(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$grad_x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$grad_x == _value then true else _WRITE_HAS_OCCURRED_$$grad_x);
    _WRITE_READ_BENIGN_FLAG_$$grad_x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$grad_x == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$grad_x);
    return;
}



procedure _CHECK_WRITE_$$grad_x(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "grad_x"} {:array "$$grad_x"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$grad_x && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$grad_x != _value);
  requires {:source_name "grad_x"} {:array "$$grad_x"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$grad_x && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$grad_x != _value);
  requires {:source_name "grad_x"} {:array "$$grad_x"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$grad_x && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$grad_x(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$grad_x;



implementation {:inline 1} _LOG_ATOMIC_$$grad_x(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$grad_x := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$grad_x);
    return;
}



procedure _CHECK_ATOMIC_$$grad_x(_P: bool, _offset: bv32);
  requires {:source_name "grad_x"} {:array "$$grad_x"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$grad_x && _WATCHED_OFFSET == _offset);
  requires {:source_name "grad_x"} {:array "$$grad_x"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$grad_x && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$grad_x(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$grad_x;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$grad_x(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$grad_x := (if _P && _WRITE_HAS_OCCURRED_$$grad_x && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$grad_x);
    return;
}



const _WATCHED_VALUE_$$grad_y: bv32;

procedure {:inline 1} _LOG_READ_$$grad_y(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$grad_y;



implementation {:inline 1} _LOG_READ_$$grad_y(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$grad_y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$grad_y == _value then true else _READ_HAS_OCCURRED_$$grad_y);
    return;
}



procedure _CHECK_READ_$$grad_y(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "grad_y"} {:array "$$grad_y"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$grad_y && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$grad_y);
  requires {:source_name "grad_y"} {:array "$$grad_y"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$grad_y && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$grad_y: bool;

procedure {:inline 1} _LOG_WRITE_$$grad_y(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$grad_y, _WRITE_READ_BENIGN_FLAG_$$grad_y;



implementation {:inline 1} _LOG_WRITE_$$grad_y(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$grad_y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$grad_y == _value then true else _WRITE_HAS_OCCURRED_$$grad_y);
    _WRITE_READ_BENIGN_FLAG_$$grad_y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$grad_y == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$grad_y);
    return;
}



procedure _CHECK_WRITE_$$grad_y(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "grad_y"} {:array "$$grad_y"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$grad_y && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$grad_y != _value);
  requires {:source_name "grad_y"} {:array "$$grad_y"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$grad_y && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$grad_y != _value);
  requires {:source_name "grad_y"} {:array "$$grad_y"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$grad_y && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$grad_y(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$grad_y;



implementation {:inline 1} _LOG_ATOMIC_$$grad_y(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$grad_y := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$grad_y);
    return;
}



procedure _CHECK_ATOMIC_$$grad_y(_P: bool, _offset: bv32);
  requires {:source_name "grad_y"} {:array "$$grad_y"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$grad_y && _WATCHED_OFFSET == _offset);
  requires {:source_name "grad_y"} {:array "$$grad_y"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$grad_y && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$grad_y(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$grad_y;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$grad_y(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$grad_y := (if _P && _WRITE_HAS_OCCURRED_$$grad_y && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$grad_y);
    return;
}



const _WATCHED_VALUE_$$gicov: bv32;

procedure {:inline 1} _LOG_READ_$$gicov(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$gicov;



implementation {:inline 1} _LOG_READ_$$gicov(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$gicov := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gicov == _value then true else _READ_HAS_OCCURRED_$$gicov);
    return;
}



procedure _CHECK_READ_$$gicov(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "gicov"} {:array "$$gicov"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$gicov && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$gicov);
  requires {:source_name "gicov"} {:array "$$gicov"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$gicov && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$gicov: bool;

procedure {:inline 1} _LOG_WRITE_$$gicov(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$gicov, _WRITE_READ_BENIGN_FLAG_$$gicov;



implementation {:inline 1} _LOG_WRITE_$$gicov(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$gicov := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gicov == _value then true else _WRITE_HAS_OCCURRED_$$gicov);
    _WRITE_READ_BENIGN_FLAG_$$gicov := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gicov == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$gicov);
    return;
}



procedure _CHECK_WRITE_$$gicov(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "gicov"} {:array "$$gicov"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$gicov && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gicov != _value);
  requires {:source_name "gicov"} {:array "$$gicov"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$gicov && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gicov != _value);
  requires {:source_name "gicov"} {:array "$$gicov"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$gicov && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$gicov(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$gicov;



implementation {:inline 1} _LOG_ATOMIC_$$gicov(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$gicov := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$gicov);
    return;
}



procedure _CHECK_ATOMIC_$$gicov(_P: bool, _offset: bv32);
  requires {:source_name "gicov"} {:array "$$gicov"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$gicov && _WATCHED_OFFSET == _offset);
  requires {:source_name "gicov"} {:array "$$gicov"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$gicov && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gicov(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$gicov;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gicov(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$gicov := (if _P && _WRITE_HAS_OCCURRED_$$gicov && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$gicov);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;
