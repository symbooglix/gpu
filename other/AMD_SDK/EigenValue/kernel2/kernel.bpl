type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "newEigenIntervals"} {:global} $$newEigenIntervals: [bv32]bv32;

axiom {:array_info "$$newEigenIntervals"} {:global} {:elem_width 32} {:source_name "newEigenIntervals"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$newEigenIntervals: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$newEigenIntervals: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$newEigenIntervals: bool;

var {:source_name "eigenIntervals"} {:global} $$eigenIntervals: [bv32]bv32;

axiom {:array_info "$$eigenIntervals"} {:global} {:elem_width 32} {:source_name "eigenIntervals"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$eigenIntervals: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$eigenIntervals: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$eigenIntervals: bool;

var {:source_name "numEigenIntervals"} {:global} $$numEigenIntervals: [bv32]bv32;

axiom {:array_info "$$numEigenIntervals"} {:global} {:elem_width 32} {:source_name "numEigenIntervals"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$numEigenIntervals: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$numEigenIntervals: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$numEigenIntervals: bool;

var {:source_name "diagonal"} {:global} $$diagonal: [bv32]bv32;

axiom {:array_info "$$diagonal"} {:global} {:elem_width 32} {:source_name "diagonal"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$diagonal: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$diagonal: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$diagonal: bool;

var {:source_name "offDiagonal"} {:global} $$offDiagonal: [bv32]bv32;

axiom {:array_info "$$offDiagonal"} {:global} {:elem_width 32} {:source_name "offDiagonal"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$offDiagonal: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$offDiagonal: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$offDiagonal: bool;

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

function FEQ32(bv32, bv32) : bool;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "recalculateEigenIntervals"} {:kernel} $recalculateEigenIntervals($width: bv32, $tolerance: bv32);
  requires !_READ_HAS_OCCURRED_$$newEigenIntervals && !_WRITE_HAS_OCCURRED_$$newEigenIntervals && !_ATOMIC_HAS_OCCURRED_$$newEigenIntervals;
  requires !_READ_HAS_OCCURRED_$$eigenIntervals && !_WRITE_HAS_OCCURRED_$$eigenIntervals && !_ATOMIC_HAS_OCCURRED_$$eigenIntervals;
  requires !_READ_HAS_OCCURRED_$$numEigenIntervals && !_WRITE_HAS_OCCURRED_$$numEigenIntervals && !_ATOMIC_HAS_OCCURRED_$$numEigenIntervals;
  requires !_READ_HAS_OCCURRED_$$diagonal && !_WRITE_HAS_OCCURRED_$$diagonal && !_ATOMIC_HAS_OCCURRED_$$diagonal;
  requires !_READ_HAS_OCCURRED_$$offDiagonal && !_WRITE_HAS_OCCURRED_$$offDiagonal && !_ATOMIC_HAS_OCCURRED_$$offDiagonal;
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
  modifies _WRITE_HAS_OCCURRED_$$newEigenIntervals, _WRITE_READ_BENIGN_FLAG_$$newEigenIntervals, _WRITE_READ_BENIGN_FLAG_$$newEigenIntervals, _READ_HAS_OCCURRED_$$newEigenIntervals;



implementation {:source_name "recalculateEigenIntervals"} {:kernel} $recalculateEigenIntervals($width: bv32, $tolerance: bv32)
{
  var $currentIndex.0$1: bv32;
  var $currentIndex.0$2: bv32;
  var $index.0$1: bv32;
  var $index.0$2: bv32;
  var $count.i.0$1: bv32;
  var $count.i.0$2: bv32;
  var $prev_diff.i.0$1: bv32;
  var $prev_diff.i.0$2: bv32;
  var $i.i.0$1: bv32;
  var $i.i.0$2: bv32;
  var $i.i3.0$1: bv32;
  var $i.i3.0$2: bv32;
  var $prev_diff.i2.0$1: bv32;
  var $prev_diff.i2.0$2: bv32;
  var $count.i1.0$1: bv32;
  var $count.i1.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v14$1: bv32;
  var v14$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v9$1: bool;
  var v9$2: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bv32;
  var v12$2: bv32;
  var v13$1: bv32;
  var v13$2: bv32;
  var v15$1: bool;
  var v15$2: bool;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v23$1: bool;
  var v23$2: bool;
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
  var v29$1: bv32;
  var v29$2: bv32;
  var v30$1: bool;
  var v30$2: bool;
  var v31$1: bv32;
  var v31$2: bv32;
  var v32$1: bv32;
  var v32$2: bv32;
  var v33$1: bool;
  var v33$2: bool;
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


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_MUL(2bv32, v0$1);
    v1$2 := BV32_MUL(2bv32, v0$2);
    v2$1 := BV32_ADD(v1$1, 1bv32);
    v2$2 := BV32_ADD(v1$2, 1bv32);
    $currentIndex.0$1, $index.0$1 := v0$1, 0bv32;
    $currentIndex.0$2, $index.0$2 := v0$2, 0bv32;
    p0$1 := false;
    p0$2 := false;
    p4$1 := false;
    p4$2 := false;
    p6$1 := false;
    p6$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_2"} true;
    assert {:block_sourceloc} {:sourceloc_num 1} p0$1 ==> true;
    v3$1 := (if p0$1 then $$numEigenIntervals[$index.0$1] else v3$1);
    v3$2 := (if p0$2 then $$numEigenIntervals[$index.0$2] else v3$2);
    v4$1 := (if p0$1 then BV32_UGE($currentIndex.0$1, v3$1) else v4$1);
    v4$2 := (if p0$2 then BV32_UGE($currentIndex.0$2, v3$2) else v4$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p12$1 := false;
    p12$2 := false;
    p1$1 := (if p0$1 && v4$1 then v4$1 else p1$1);
    p1$2 := (if p0$2 && v4$2 then v4$2 else p1$2);
    p0$1 := (if p0$1 && !v4$1 then v4$1 else p0$1);
    p0$2 := (if p0$2 && !v4$2 then v4$2 else p0$2);
    v5$1 := (if p1$1 then $$numEigenIntervals[$index.0$1] else v5$1);
    v5$2 := (if p1$2 then $$numEigenIntervals[$index.0$2] else v5$2);
    $currentIndex.0$1, $index.0$1 := (if p1$1 then BV32_SUB($currentIndex.0$1, v5$1) else $currentIndex.0$1), (if p1$1 then BV32_ADD($index.0$1, 1bv32) else $index.0$1);
    $currentIndex.0$2, $index.0$2 := (if p1$2 then BV32_SUB($currentIndex.0$2, v5$2) else $currentIndex.0$2), (if p1$2 then BV32_ADD($index.0$2, 1bv32) else $index.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, $1.tail;

  $1.tail:
    assume !p0$1 && !p0$2;
    v6$1 := BV32_MUL(2bv32, $index.0$1);
    v6$2 := BV32_MUL(2bv32, $index.0$2);
    v7$1 := BV32_ADD(v6$1, 1bv32);
    v7$2 := BV32_ADD(v6$2, 1bv32);
    v8$1 := $$numEigenIntervals[$index.0$1];
    v8$2 := $$numEigenIntervals[$index.0$2];
    v9$1 := v8$1 == 1bv32;
    v9$2 := v8$2 == 1bv32;
    p3$1 := (if v9$1 then v9$1 else p3$1);
    p3$2 := (if v9$2 then v9$2 else p3$2);
    p12$1 := (if !v9$1 then !v9$1 else p12$1);
    p12$2 := (if !v9$2 then !v9$2 else p12$2);
    v10$1 := (if p3$1 then $$eigenIntervals[v7$1] else v10$1);
    v10$2 := (if p3$2 then $$eigenIntervals[v7$2] else v10$2);
    v11$1 := (if p3$1 then $$eigenIntervals[v6$1] else v11$1);
    v11$2 := (if p3$2 then $$eigenIntervals[v6$2] else v11$2);
    v12$1 := (if p3$1 then FDIV32(FADD32(v10$1, v11$1), 1073741824bv32) else v12$1);
    v12$2 := (if p3$2 then FDIV32(FADD32(v10$2, v11$2), 1073741824bv32) else v12$2);
    v13$1 := (if p3$1 then $$diagonal[0bv32] else v13$1);
    v13$2 := (if p3$2 then $$diagonal[0bv32] else v13$2);
    v14$1 := (if p3$1 then FSUB32(v13$1, v12$1) else v14$1);
    v14$2 := (if p3$2 then FSUB32(v13$2, v12$2) else v14$2);
    $count.i.0$1, $prev_diff.i.0$1, $i.i.0$1 := (if p3$1 then (if FLT32(v14$1, 0bv32) then 1bv32 else 0bv32) else $count.i.0$1), (if p3$1 then v14$1 else $prev_diff.i.0$1), (if p3$1 then 1bv32 else $i.i.0$1);
    $count.i.0$2, $prev_diff.i.0$2, $i.i.0$2 := (if p3$2 then (if FLT32(v14$2, 0bv32) then 1bv32 else 0bv32) else $count.i.0$2), (if p3$2 then v14$2 else $prev_diff.i.0$2), (if p3$2 then 1bv32 else $i.i.0$2);
    p4$1 := (if p3$1 then true else p4$1);
    p4$2 := (if p3$2 then true else p4$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_1"} true;
    assert {:block_sourceloc} {:sourceloc_num 11} p4$1 ==> true;
    v15$1 := (if p4$1 then BV32_ULT($i.i.0$1, $width) else v15$1);
    v15$2 := (if p4$2 then BV32_ULT($i.i.0$2, $width) else v15$2);
    p5$1 := false;
    p5$2 := false;
    p5$1 := (if p4$1 && v15$1 then v15$1 else p5$1);
    p5$2 := (if p4$2 && v15$2 then v15$2 else p5$2);
    p4$1 := (if p4$1 && !v15$1 then v15$1 else p4$1);
    p4$2 := (if p4$2 && !v15$2 then v15$2 else p4$2);
    v16$1 := (if p5$1 then $$diagonal[$i.i.0$1] else v16$1);
    v16$2 := (if p5$2 then $$diagonal[$i.i.0$2] else v16$2);
    v17$1 := (if p5$1 then $$offDiagonal[BV32_SUB($i.i.0$1, 1bv32)] else v17$1);
    v17$2 := (if p5$2 then $$offDiagonal[BV32_SUB($i.i.0$2, 1bv32)] else v17$2);
    v18$1 := (if p5$1 then $$offDiagonal[BV32_SUB($i.i.0$1, 1bv32)] else v18$1);
    v18$2 := (if p5$2 then $$offDiagonal[BV32_SUB($i.i.0$2, 1bv32)] else v18$2);
    v19$1 := (if p5$1 then FSUB32(FSUB32(v16$1, v12$1), FDIV32(FMUL32(v17$1, v18$1), $prev_diff.i.0$1)) else v19$1);
    v19$2 := (if p5$2 then FSUB32(FSUB32(v16$2, v12$2), FDIV32(FMUL32(v17$2, v18$2), $prev_diff.i.0$2)) else v19$2);
    $count.i.0$1, $prev_diff.i.0$1, $i.i.0$1 := (if p5$1 then BV32_ADD($count.i.0$1, (if FLT32(v19$1, 0bv32) then 1bv32 else 0bv32)) else $count.i.0$1), (if p5$1 then v19$1 else $prev_diff.i.0$1), (if p5$1 then BV32_ADD($i.i.0$1, 1bv32) else $i.i.0$1);
    $count.i.0$2, $prev_diff.i.0$2, $i.i.0$2 := (if p5$2 then BV32_ADD($count.i.0$2, (if FLT32(v19$2, 0bv32) then 1bv32 else 0bv32)) else $count.i.0$2), (if p5$2 then v19$2 else $prev_diff.i.0$2), (if p5$2 then BV32_ADD($i.i.0$2, 1bv32) else $i.i.0$2);
    p4$1 := (if p5$1 then true else p4$1);
    p4$2 := (if p5$2 then true else p4$2);
    goto $5.backedge, $5.tail;

  $5.tail:
    assume !p4$1 && !p4$2;
    v20$1 := (if p3$1 then $$eigenIntervals[v6$1] else v20$1);
    v20$2 := (if p3$2 then $$eigenIntervals[v6$2] else v20$2);
    v21$1 := (if p3$1 then $$diagonal[0bv32] else v21$1);
    v21$2 := (if p3$2 then $$diagonal[0bv32] else v21$2);
    v22$1 := (if p3$1 then FSUB32(v21$1, v20$1) else v22$1);
    v22$2 := (if p3$2 then FSUB32(v21$2, v20$2) else v22$2);
    $i.i3.0$1, $prev_diff.i2.0$1, $count.i1.0$1 := (if p3$1 then 1bv32 else $i.i3.0$1), (if p3$1 then v22$1 else $prev_diff.i2.0$1), (if p3$1 then (if FLT32(v22$1, 0bv32) then 1bv32 else 0bv32) else $count.i1.0$1);
    $i.i3.0$2, $prev_diff.i2.0$2, $count.i1.0$2 := (if p3$2 then 1bv32 else $i.i3.0$2), (if p3$2 then v22$2 else $prev_diff.i2.0$2), (if p3$2 then (if FLT32(v22$2, 0bv32) then 1bv32 else 0bv32) else $count.i1.0$2);
    p6$1 := (if p3$1 then true else p6$1);
    p6$2 := (if p3$2 then true else p6$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_0"} true;
    assert {:block_sourceloc} {:sourceloc_num 19} p6$1 ==> true;
    v23$1 := (if p6$1 then BV32_ULT($i.i3.0$1, $width) else v23$1);
    v23$2 := (if p6$2 then BV32_ULT($i.i3.0$2, $width) else v23$2);
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
    p7$1 := (if p6$1 && v23$1 then v23$1 else p7$1);
    p7$2 := (if p6$2 && v23$2 then v23$2 else p7$2);
    p6$1 := (if p6$1 && !v23$1 then v23$1 else p6$1);
    p6$2 := (if p6$2 && !v23$2 then v23$2 else p6$2);
    v24$1 := (if p7$1 then $$diagonal[$i.i3.0$1] else v24$1);
    v24$2 := (if p7$2 then $$diagonal[$i.i3.0$2] else v24$2);
    v25$1 := (if p7$1 then $$offDiagonal[BV32_SUB($i.i3.0$1, 1bv32)] else v25$1);
    v25$2 := (if p7$2 then $$offDiagonal[BV32_SUB($i.i3.0$2, 1bv32)] else v25$2);
    v26$1 := (if p7$1 then $$offDiagonal[BV32_SUB($i.i3.0$1, 1bv32)] else v26$1);
    v26$2 := (if p7$2 then $$offDiagonal[BV32_SUB($i.i3.0$2, 1bv32)] else v26$2);
    v27$1 := (if p7$1 then FSUB32(FSUB32(v24$1, v20$1), FDIV32(FMUL32(v25$1, v26$1), $prev_diff.i2.0$1)) else v27$1);
    v27$2 := (if p7$2 then FSUB32(FSUB32(v24$2, v20$2), FDIV32(FMUL32(v25$2, v26$2), $prev_diff.i2.0$2)) else v27$2);
    $i.i3.0$1, $prev_diff.i2.0$1, $count.i1.0$1 := (if p7$1 then BV32_ADD($i.i3.0$1, 1bv32) else $i.i3.0$1), (if p7$1 then v27$1 else $prev_diff.i2.0$1), (if p7$1 then BV32_ADD($count.i1.0$1, (if FLT32(v27$1, 0bv32) then 1bv32 else 0bv32)) else $count.i1.0$1);
    $i.i3.0$2, $prev_diff.i2.0$2, $count.i1.0$2 := (if p7$2 then BV32_ADD($i.i3.0$2, 1bv32) else $i.i3.0$2), (if p7$2 then v27$2 else $prev_diff.i2.0$2), (if p7$2 then BV32_ADD($count.i1.0$2, (if FLT32(v27$2, 0bv32) then 1bv32 else 0bv32)) else $count.i1.0$2);
    p6$1 := (if p7$1 then true else p6$1);
    p6$2 := (if p7$2 then true else p6$2);
    goto $7.backedge, $7.tail;

  $7.tail:
    assume !p6$1 && !p6$2;
    v28$1 := (if p3$1 then $$eigenIntervals[v7$1] else v28$1);
    v28$2 := (if p3$2 then $$eigenIntervals[v7$2] else v28$2);
    v29$1 := (if p3$1 then $$eigenIntervals[v6$1] else v29$1);
    v29$2 := (if p3$2 then $$eigenIntervals[v6$2] else v29$2);
    v30$1 := (if p3$1 then FLT32(FSUB32(v28$1, v29$1), $tolerance) else v30$1);
    v30$2 := (if p3$2 then FLT32(FSUB32(v28$2, v29$2), $tolerance) else v30$2);
    p8$1 := (if p3$1 && v30$1 then v30$1 else p8$1);
    p8$2 := (if p3$2 && v30$2 then v30$2 else p8$2);
    p9$1 := (if p3$1 && !v30$1 then !v30$1 else p9$1);
    p9$2 := (if p3$2 && !v30$2 then !v30$2 else p9$2);
    v31$1 := (if p8$1 then $$eigenIntervals[v6$1] else v31$1);
    v31$2 := (if p8$2 then $$eigenIntervals[v6$2] else v31$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$newEigenIntervals(p8$1, v1$1, v31$1, $$newEigenIntervals[v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newEigenIntervals(p8$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$newEigenIntervals(p8$2, v1$2, v31$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newEigenIntervals"} true;
    $$newEigenIntervals[v1$1] := (if p8$1 then v31$1 else $$newEigenIntervals[v1$1]);
    $$newEigenIntervals[v1$2] := (if p8$2 then v31$2 else $$newEigenIntervals[v1$2]);
    v32$1 := (if p8$1 then $$eigenIntervals[v7$1] else v32$1);
    v32$2 := (if p8$2 then $$eigenIntervals[v7$2] else v32$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$newEigenIntervals(p8$1, v2$1, v32$1, $$newEigenIntervals[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newEigenIntervals(p8$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$newEigenIntervals(p8$2, v2$2, v32$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newEigenIntervals"} true;
    $$newEigenIntervals[v2$1] := (if p8$1 then v32$1 else $$newEigenIntervals[v2$1]);
    $$newEigenIntervals[v2$2] := (if p8$2 then v32$2 else $$newEigenIntervals[v2$2]);
    v33$1 := (if p9$1 then FEQ32(FSUB32(UI32_TO_FP32($count.i.0$1), UI32_TO_FP32($count.i1.0$1)), 0bv32) else v33$1);
    v33$2 := (if p9$2 then FEQ32(FSUB32(UI32_TO_FP32($count.i.0$2), UI32_TO_FP32($count.i1.0$2)), 0bv32) else v33$2);
    p10$1 := (if p9$1 && v33$1 then v33$1 else p10$1);
    p10$2 := (if p9$2 && v33$2 then v33$2 else p10$2);
    p11$1 := (if p9$1 && !v33$1 then !v33$1 else p11$1);
    p11$2 := (if p9$2 && !v33$2 then !v33$2 else p11$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$newEigenIntervals(p10$1, v1$1, v12$1, $$newEigenIntervals[v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newEigenIntervals(p10$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$newEigenIntervals(p10$2, v1$2, v12$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newEigenIntervals"} true;
    $$newEigenIntervals[v1$1] := (if p10$1 then v12$1 else $$newEigenIntervals[v1$1]);
    $$newEigenIntervals[v1$2] := (if p10$2 then v12$2 else $$newEigenIntervals[v1$2]);
    v34$1 := (if p10$1 then $$eigenIntervals[v7$1] else v34$1);
    v34$2 := (if p10$2 then $$eigenIntervals[v7$2] else v34$2);
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$newEigenIntervals(p10$1, v2$1, v34$1, $$newEigenIntervals[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newEigenIntervals(p10$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$newEigenIntervals(p10$2, v2$2, v34$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newEigenIntervals"} true;
    $$newEigenIntervals[v2$1] := (if p10$1 then v34$1 else $$newEigenIntervals[v2$1]);
    $$newEigenIntervals[v2$2] := (if p10$2 then v34$2 else $$newEigenIntervals[v2$2]);
    v35$1 := (if p11$1 then $$eigenIntervals[v6$1] else v35$1);
    v35$2 := (if p11$2 then $$eigenIntervals[v6$2] else v35$2);
    call {:sourceloc} {:sourceloc_num 39} _LOG_WRITE_$$newEigenIntervals(p11$1, v1$1, v35$1, $$newEigenIntervals[v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newEigenIntervals(p11$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 39} _CHECK_WRITE_$$newEigenIntervals(p11$2, v1$2, v35$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newEigenIntervals"} true;
    $$newEigenIntervals[v1$1] := (if p11$1 then v35$1 else $$newEigenIntervals[v1$1]);
    $$newEigenIntervals[v1$2] := (if p11$2 then v35$2 else $$newEigenIntervals[v1$2]);
    call {:sourceloc} {:sourceloc_num 40} _LOG_WRITE_$$newEigenIntervals(p11$1, v2$1, v12$1, $$newEigenIntervals[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newEigenIntervals(p11$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 40} _CHECK_WRITE_$$newEigenIntervals(p11$2, v2$2, v12$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newEigenIntervals"} true;
    $$newEigenIntervals[v2$1] := (if p11$1 then v12$1 else $$newEigenIntervals[v2$1]);
    $$newEigenIntervals[v2$2] := (if p11$2 then v12$2 else $$newEigenIntervals[v2$2]);
    v36$1 := (if p12$1 then $$eigenIntervals[v7$1] else v36$1);
    v36$2 := (if p12$2 then $$eigenIntervals[v7$2] else v36$2);
    v37$1 := (if p12$1 then $$eigenIntervals[v6$1] else v37$1);
    v37$2 := (if p12$2 then $$eigenIntervals[v6$2] else v37$2);
    v38$1 := (if p12$1 then $$numEigenIntervals[$index.0$1] else v38$1);
    v38$2 := (if p12$2 then $$numEigenIntervals[$index.0$2] else v38$2);
    v39$1 := (if p12$1 then FDIV32(FSUB32(v36$1, v37$1), UI32_TO_FP32(v38$1)) else v39$1);
    v39$2 := (if p12$2 then FDIV32(FSUB32(v36$2, v37$2), UI32_TO_FP32(v38$2)) else v39$2);
    v40$1 := (if p12$1 then $$eigenIntervals[v6$1] else v40$1);
    v40$2 := (if p12$2 then $$eigenIntervals[v6$2] else v40$2);
    call {:sourceloc} {:sourceloc_num 47} _LOG_WRITE_$$newEigenIntervals(p12$1, v1$1, FADD32(FMUL32(v39$1, UI32_TO_FP32($currentIndex.0$1)), v40$1), $$newEigenIntervals[v1$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newEigenIntervals(p12$2, v1$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 47} _CHECK_WRITE_$$newEigenIntervals(p12$2, v1$2, FADD32(FMUL32(v39$2, UI32_TO_FP32($currentIndex.0$2)), v40$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newEigenIntervals"} true;
    $$newEigenIntervals[v1$1] := (if p12$1 then FADD32(FMUL32(v39$1, UI32_TO_FP32($currentIndex.0$1)), v40$1) else $$newEigenIntervals[v1$1]);
    $$newEigenIntervals[v1$2] := (if p12$2 then FADD32(FMUL32(v39$2, UI32_TO_FP32($currentIndex.0$2)), v40$2) else $$newEigenIntervals[v1$2]);
    call {:sourceloc} {:sourceloc_num 48} _LOG_READ_$$newEigenIntervals(p12$1, v1$1, $$newEigenIntervals[v1$1]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 48} _CHECK_READ_$$newEigenIntervals(p12$2, v1$2, $$newEigenIntervals[v1$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$newEigenIntervals"} true;
    v41$1 := (if p12$1 then $$newEigenIntervals[v1$1] else v41$1);
    v41$2 := (if p12$2 then $$newEigenIntervals[v1$2] else v41$2);
    call {:sourceloc} {:sourceloc_num 49} _LOG_WRITE_$$newEigenIntervals(p12$1, v2$1, FADD32(v41$1, v39$1), $$newEigenIntervals[v2$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newEigenIntervals(p12$2, v2$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 49} _CHECK_WRITE_$$newEigenIntervals(p12$2, v2$2, FADD32(v41$2, v39$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newEigenIntervals"} true;
    $$newEigenIntervals[v2$1] := (if p12$1 then FADD32(v41$1, v39$1) else $$newEigenIntervals[v2$1]);
    $$newEigenIntervals[v2$2] := (if p12$2 then FADD32(v41$2, v39$2) else $$newEigenIntervals[v2$2]);
    return;

  $7.backedge:
    assume {:backedge} p6$1 || p6$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $7;

  $5.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $5;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$newEigenIntervals: bv32;

procedure {:inline 1} _LOG_READ_$$newEigenIntervals(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$newEigenIntervals;



implementation {:inline 1} _LOG_READ_$$newEigenIntervals(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$newEigenIntervals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newEigenIntervals == _value then true else _READ_HAS_OCCURRED_$$newEigenIntervals);
    return;
}



procedure _CHECK_READ_$$newEigenIntervals(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "newEigenIntervals"} {:array "$$newEigenIntervals"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$newEigenIntervals && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$newEigenIntervals);
  requires {:source_name "newEigenIntervals"} {:array "$$newEigenIntervals"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$newEigenIntervals && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$newEigenIntervals: bool;

procedure {:inline 1} _LOG_WRITE_$$newEigenIntervals(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$newEigenIntervals, _WRITE_READ_BENIGN_FLAG_$$newEigenIntervals;



implementation {:inline 1} _LOG_WRITE_$$newEigenIntervals(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$newEigenIntervals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newEigenIntervals == _value then true else _WRITE_HAS_OCCURRED_$$newEigenIntervals);
    _WRITE_READ_BENIGN_FLAG_$$newEigenIntervals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newEigenIntervals == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$newEigenIntervals);
    return;
}



procedure _CHECK_WRITE_$$newEigenIntervals(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "newEigenIntervals"} {:array "$$newEigenIntervals"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$newEigenIntervals && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newEigenIntervals != _value);
  requires {:source_name "newEigenIntervals"} {:array "$$newEigenIntervals"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$newEigenIntervals && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newEigenIntervals != _value);
  requires {:source_name "newEigenIntervals"} {:array "$$newEigenIntervals"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$newEigenIntervals && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$newEigenIntervals(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$newEigenIntervals;



implementation {:inline 1} _LOG_ATOMIC_$$newEigenIntervals(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$newEigenIntervals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$newEigenIntervals);
    return;
}



procedure _CHECK_ATOMIC_$$newEigenIntervals(_P: bool, _offset: bv32);
  requires {:source_name "newEigenIntervals"} {:array "$$newEigenIntervals"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$newEigenIntervals && _WATCHED_OFFSET == _offset);
  requires {:source_name "newEigenIntervals"} {:array "$$newEigenIntervals"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$newEigenIntervals && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$newEigenIntervals(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$newEigenIntervals;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$newEigenIntervals(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$newEigenIntervals := (if _P && _WRITE_HAS_OCCURRED_$$newEigenIntervals && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$newEigenIntervals);
    return;
}



const _WATCHED_VALUE_$$eigenIntervals: bv32;

procedure {:inline 1} _LOG_READ_$$eigenIntervals(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$eigenIntervals;



implementation {:inline 1} _LOG_READ_$$eigenIntervals(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$eigenIntervals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$eigenIntervals == _value then true else _READ_HAS_OCCURRED_$$eigenIntervals);
    return;
}



procedure _CHECK_READ_$$eigenIntervals(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "eigenIntervals"} {:array "$$eigenIntervals"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$eigenIntervals && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$eigenIntervals);
  requires {:source_name "eigenIntervals"} {:array "$$eigenIntervals"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$eigenIntervals && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$eigenIntervals: bool;

procedure {:inline 1} _LOG_WRITE_$$eigenIntervals(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$eigenIntervals, _WRITE_READ_BENIGN_FLAG_$$eigenIntervals;



implementation {:inline 1} _LOG_WRITE_$$eigenIntervals(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$eigenIntervals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$eigenIntervals == _value then true else _WRITE_HAS_OCCURRED_$$eigenIntervals);
    _WRITE_READ_BENIGN_FLAG_$$eigenIntervals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$eigenIntervals == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$eigenIntervals);
    return;
}



procedure _CHECK_WRITE_$$eigenIntervals(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "eigenIntervals"} {:array "$$eigenIntervals"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$eigenIntervals && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$eigenIntervals != _value);
  requires {:source_name "eigenIntervals"} {:array "$$eigenIntervals"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$eigenIntervals && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$eigenIntervals != _value);
  requires {:source_name "eigenIntervals"} {:array "$$eigenIntervals"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$eigenIntervals && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$eigenIntervals(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$eigenIntervals;



implementation {:inline 1} _LOG_ATOMIC_$$eigenIntervals(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$eigenIntervals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$eigenIntervals);
    return;
}



procedure _CHECK_ATOMIC_$$eigenIntervals(_P: bool, _offset: bv32);
  requires {:source_name "eigenIntervals"} {:array "$$eigenIntervals"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$eigenIntervals && _WATCHED_OFFSET == _offset);
  requires {:source_name "eigenIntervals"} {:array "$$eigenIntervals"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$eigenIntervals && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$eigenIntervals(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$eigenIntervals;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$eigenIntervals(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$eigenIntervals := (if _P && _WRITE_HAS_OCCURRED_$$eigenIntervals && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$eigenIntervals);
    return;
}



const _WATCHED_VALUE_$$numEigenIntervals: bv32;

procedure {:inline 1} _LOG_READ_$$numEigenIntervals(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$numEigenIntervals;



implementation {:inline 1} _LOG_READ_$$numEigenIntervals(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$numEigenIntervals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$numEigenIntervals == _value then true else _READ_HAS_OCCURRED_$$numEigenIntervals);
    return;
}



procedure _CHECK_READ_$$numEigenIntervals(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "numEigenIntervals"} {:array "$$numEigenIntervals"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$numEigenIntervals && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$numEigenIntervals);
  requires {:source_name "numEigenIntervals"} {:array "$$numEigenIntervals"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$numEigenIntervals && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$numEigenIntervals: bool;

procedure {:inline 1} _LOG_WRITE_$$numEigenIntervals(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$numEigenIntervals, _WRITE_READ_BENIGN_FLAG_$$numEigenIntervals;



implementation {:inline 1} _LOG_WRITE_$$numEigenIntervals(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$numEigenIntervals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$numEigenIntervals == _value then true else _WRITE_HAS_OCCURRED_$$numEigenIntervals);
    _WRITE_READ_BENIGN_FLAG_$$numEigenIntervals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$numEigenIntervals == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$numEigenIntervals);
    return;
}



procedure _CHECK_WRITE_$$numEigenIntervals(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "numEigenIntervals"} {:array "$$numEigenIntervals"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$numEigenIntervals && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$numEigenIntervals != _value);
  requires {:source_name "numEigenIntervals"} {:array "$$numEigenIntervals"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$numEigenIntervals && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$numEigenIntervals != _value);
  requires {:source_name "numEigenIntervals"} {:array "$$numEigenIntervals"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$numEigenIntervals && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$numEigenIntervals(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$numEigenIntervals;



implementation {:inline 1} _LOG_ATOMIC_$$numEigenIntervals(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$numEigenIntervals := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$numEigenIntervals);
    return;
}



procedure _CHECK_ATOMIC_$$numEigenIntervals(_P: bool, _offset: bv32);
  requires {:source_name "numEigenIntervals"} {:array "$$numEigenIntervals"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$numEigenIntervals && _WATCHED_OFFSET == _offset);
  requires {:source_name "numEigenIntervals"} {:array "$$numEigenIntervals"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$numEigenIntervals && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$numEigenIntervals(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$numEigenIntervals;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$numEigenIntervals(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$numEigenIntervals := (if _P && _WRITE_HAS_OCCURRED_$$numEigenIntervals && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$numEigenIntervals);
    return;
}



const _WATCHED_VALUE_$$diagonal: bv32;

procedure {:inline 1} _LOG_READ_$$diagonal(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$diagonal;



implementation {:inline 1} _LOG_READ_$$diagonal(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$diagonal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$diagonal == _value then true else _READ_HAS_OCCURRED_$$diagonal);
    return;
}



procedure _CHECK_READ_$$diagonal(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "diagonal"} {:array "$$diagonal"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$diagonal && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$diagonal);
  requires {:source_name "diagonal"} {:array "$$diagonal"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$diagonal && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$diagonal: bool;

procedure {:inline 1} _LOG_WRITE_$$diagonal(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$diagonal, _WRITE_READ_BENIGN_FLAG_$$diagonal;



implementation {:inline 1} _LOG_WRITE_$$diagonal(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$diagonal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$diagonal == _value then true else _WRITE_HAS_OCCURRED_$$diagonal);
    _WRITE_READ_BENIGN_FLAG_$$diagonal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$diagonal == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$diagonal);
    return;
}



procedure _CHECK_WRITE_$$diagonal(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "diagonal"} {:array "$$diagonal"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$diagonal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$diagonal != _value);
  requires {:source_name "diagonal"} {:array "$$diagonal"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$diagonal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$diagonal != _value);
  requires {:source_name "diagonal"} {:array "$$diagonal"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$diagonal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$diagonal(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$diagonal;



implementation {:inline 1} _LOG_ATOMIC_$$diagonal(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$diagonal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$diagonal);
    return;
}



procedure _CHECK_ATOMIC_$$diagonal(_P: bool, _offset: bv32);
  requires {:source_name "diagonal"} {:array "$$diagonal"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$diagonal && _WATCHED_OFFSET == _offset);
  requires {:source_name "diagonal"} {:array "$$diagonal"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$diagonal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$diagonal(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$diagonal;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$diagonal(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$diagonal := (if _P && _WRITE_HAS_OCCURRED_$$diagonal && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$diagonal);
    return;
}



const _WATCHED_VALUE_$$offDiagonal: bv32;

procedure {:inline 1} _LOG_READ_$$offDiagonal(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$offDiagonal;



implementation {:inline 1} _LOG_READ_$$offDiagonal(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$offDiagonal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$offDiagonal == _value then true else _READ_HAS_OCCURRED_$$offDiagonal);
    return;
}



procedure _CHECK_READ_$$offDiagonal(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "offDiagonal"} {:array "$$offDiagonal"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$offDiagonal && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$offDiagonal);
  requires {:source_name "offDiagonal"} {:array "$$offDiagonal"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$offDiagonal && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$offDiagonal: bool;

procedure {:inline 1} _LOG_WRITE_$$offDiagonal(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$offDiagonal, _WRITE_READ_BENIGN_FLAG_$$offDiagonal;



implementation {:inline 1} _LOG_WRITE_$$offDiagonal(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$offDiagonal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$offDiagonal == _value then true else _WRITE_HAS_OCCURRED_$$offDiagonal);
    _WRITE_READ_BENIGN_FLAG_$$offDiagonal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$offDiagonal == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$offDiagonal);
    return;
}



procedure _CHECK_WRITE_$$offDiagonal(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "offDiagonal"} {:array "$$offDiagonal"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$offDiagonal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$offDiagonal != _value);
  requires {:source_name "offDiagonal"} {:array "$$offDiagonal"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$offDiagonal && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$offDiagonal != _value);
  requires {:source_name "offDiagonal"} {:array "$$offDiagonal"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$offDiagonal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$offDiagonal(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$offDiagonal;



implementation {:inline 1} _LOG_ATOMIC_$$offDiagonal(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$offDiagonal := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$offDiagonal);
    return;
}



procedure _CHECK_ATOMIC_$$offDiagonal(_P: bool, _offset: bv32);
  requires {:source_name "offDiagonal"} {:array "$$offDiagonal"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$offDiagonal && _WATCHED_OFFSET == _offset);
  requires {:source_name "offDiagonal"} {:array "$$offDiagonal"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$offDiagonal && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$offDiagonal(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$offDiagonal;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$offDiagonal(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$offDiagonal := (if _P && _WRITE_HAS_OCCURRED_$$offDiagonal && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$offDiagonal);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
