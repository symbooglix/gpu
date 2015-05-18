type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



axiom {:array_info "$$input"} {:global} {:elem_width 8} {:source_name "input"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input: bool;

var {:source_name "output"} {:global} $$output: [bv32]bv8;

axiom {:array_info "$$output"} {:global} {:elem_width 8} {:source_name "output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output: bool;

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

function FMUL32(bv32, bv32) : bv32;

function FP32_TO_UI8(bv32) : bv8;

function FSUB32(bv32, bv32) : bv32;

function UI8_TO_FP32(bv8) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

procedure {:source_name "RecursiveGaussian_kernel"} {:kernel} $RecursiveGaussian_kernel($width: bv32, $height: bv32, $a0: bv32, $a1: bv32, $a2: bv32, $a3: bv32, $b1: bv32, $b2: bv32, $coefp: bv32, $coefn: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $height == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$input && !_WRITE_HAS_OCCURRED_$$input && !_ATOMIC_HAS_OCCURRED_$$input;
  requires !_READ_HAS_OCCURRED_$$output && !_WRITE_HAS_OCCURRED_$$output && !_ATOMIC_HAS_OCCURRED_$$output;
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
  modifies _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _WRITE_READ_BENIGN_FLAG_$$output, $$output, _TRACKING, _READ_HAS_OCCURRED_$$output;



implementation {:source_name "RecursiveGaussian_kernel"} {:kernel} $RecursiveGaussian_kernel($width: bv32, $height: bv32, $a0: bv32, $a1: bv32, $a2: bv32, $a3: bv32, $b1: bv32, $b2: bv32, $coefp: bv32, $coefn: bv32)
{
  var $xp.0$1: bv128;
  var $xp.0$2: bv128;
  var $yp.0$1: bv128;
  var $yp.0$2: bv128;
  var $yb.0$1: bv128;
  var $yb.0$2: bv128;
  var $y.0$1: bv32;
  var $y.0$2: bv32;
  var $xn.0$1: bv128;
  var $xn.0$2: bv128;
  var $xa.0$1: bv128;
  var $xa.0$2: bv128;
  var $yn.0$1: bv128;
  var $yn.0$2: bv128;
  var $ya.0$1: bv128;
  var $ya.0$2: bv128;
  var $y1.0$1: bv32;
  var $y1.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bool;
  var v2$2: bool;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv8;
  var v4$2: bv8;
  var v5$1: bv8;
  var v5$2: bv8;
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv32;
  var v13$2: bv32;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
  var v16$1: bv8;
  var v16$2: bv8;
  var v17$1: bv8;
  var v17$2: bv8;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv8;
  var v19$2: bv8;
  var v20$1: bv8;
  var v20$2: bv8;
  var v21$1: bv8;
  var v21$2: bv8;
  var v22$1: bv8;
  var v22$2: bv8;
  var v23$1: bv32;
  var v23$2: bv32;
  var v24$1: bv32;
  var v24$2: bv32;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27$1: bv32;
  var v27$2: bv32;
  var v28$1: bool;
  var v28$2: bool;
  var v29$1: bv32;
  var v29$2: bv32;
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
  var v42$1: bv8;
  var v42$2: bv8;
  var v43$1: bv8;
  var v43$2: bv8;
  var v44$1: bv8;
  var v44$2: bv8;
  var v45$1: bv8;
  var v45$2: bv8;
  var v46$1: bv32;
  var v46$2: bv32;
  var v47$1: bv32;
  var v47$2: bv32;
  var v48$1: bv32;
  var v48$2: bv32;
  var v49$1: bv32;
  var v49$2: bv32;
  var v50$1: bv8;
  var v50$2: bv8;
  var v51$1: bv8;
  var v51$2: bv8;
  var v52$1: bv8;
  var v52$2: bv8;
  var v53$1: bv8;
  var v53$2: bv8;
  var v54$1: bv8;
  var v54$2: bv8;
  var v55$1: bv8;
  var v55$2: bv8;
  var v56$1: bv8;
  var v56$2: bv8;
  var v57$1: bv8;
  var v57$2: bv8;
  var v58$1: bv8;
  var v58$2: bv8;
  var v59$1: bv8;
  var v59$2: bv8;
  var v60$1: bv8;
  var v60$2: bv8;
  var v61$1: bv8;
  var v61$2: bv8;
  var v62$1: bv8;
  var v62$2: bv8;
  var v63$1: bv8;
  var v63$2: bv8;
  var v64$1: bv8;
  var v64$2: bv8;
  var v65$1: bv8;
  var v65$2: bv8;
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
  var _HAVOC_bv8$1: bv8;
  var _HAVOC_bv8$2: bv8;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_UGE(v0$1, $width);
    v1$2 := BV32_UGE(v0$2, $width);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p4$1 := false;
    p4$2 := false;
    p1$1 := (if !v1$1 then !v1$1 else p1$1);
    p1$2 := (if !v1$2 then !v1$2 else p1$2);
    $xp.0$1, $yp.0$1, $yb.0$1, $y.0$1 := (if p1$1 then 0bv128 else $xp.0$1), (if p1$1 then 0bv128 else $yp.0$1), (if p1$1 then 0bv128 else $yb.0$1), (if p1$1 then 0bv32 else $y.0$1);
    $xp.0$2, $yp.0$2, $yb.0$2, $y.0$2 := (if p1$2 then 0bv128 else $xp.0$2), (if p1$2 then 0bv128 else $yp.0$2), (if p1$2 then 0bv128 else $yb.0$2), (if p1$2 then 0bv32 else $y.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "accessBreak"} _b22 ==> _WRITE_HAS_OCCURRED_$$output ==> local_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 4bv32), BV32_MUL(group_id_x$1, group_size_x));
    assert {:tag "accessBreak"} _b21 ==> _WRITE_HAS_OCCURRED_$$output ==> group_id_x$1 == BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 4bv32), group_size_x), BV32_DIV(local_id_x$1, group_size_x));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b20 ==> _WRITE_HAS_OCCURRED_$$output ==> BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $width), 4bv32), 1bv32), BV32_MUL(BV32_ADD(BV32_MUL(0bv32, $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(0bv32, $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(0bv32, $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(0bv32, $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 3bv32));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b8 ==> BV32_SLT($y.0$1, $height) ==> p2$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b8 ==> BV32_SLT($y.0$2, $height) ==> p2$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b7 ==> BV32_UGE(v0$1, $width) ==> !_READ_HAS_OCCURRED_$$input;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b6 ==> BV32_UGE(v0$1, $width) ==> !_WRITE_HAS_OCCURRED_$$output;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b5 ==> BV32_UGE(v0$1, $width) ==> !p2$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b5 ==> BV32_UGE(v0$2, $width) ==> !p2$2;
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b4 ==> BV32_UGE($y.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b4 ==> BV32_UGE($y.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b3 ==> BV32_ULE($y.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b3 ==> BV32_ULE($y.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b2 ==> BV32_SGE($y.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b2 ==> BV32_SGE($y.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p2$1 ==> _b1 ==> BV32_SLE($y.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p2$2 ==> _b1 ==> BV32_SLE($y.0$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p2$1 ==> _b0 ==> BV32_SLE(0bv32, $y.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p2$2 ==> _b0 ==> BV32_SLE(0bv32, $y.0$2);
    assert {:block_sourceloc} {:sourceloc_num 5} p2$1 ==> true;
    v2$1 := (if p2$1 then BV32_SLT($y.0$1, $height) else v2$1);
    v2$2 := (if p2$2 then BV32_SLT($y.0$2, $height) else v2$2);
    p3$1 := false;
    p3$2 := false;
    p3$1 := (if p2$1 && v2$1 then v2$1 else p3$1);
    p3$2 := (if p2$2 && v2$2 then v2$2 else p3$2);
    p2$1 := (if p2$1 && !v2$1 then v2$1 else p2$1);
    p2$2 := (if p2$2 && !v2$2 then v2$2 else p2$2);
    v3$1 := (if p3$1 then BV32_ADD(v0$1, BV32_MUL($y.0$1, $width)) else v3$1);
    v3$2 := (if p3$2 then BV32_ADD(v0$2, BV32_MUL($y.0$2, $width)) else v3$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v4$1 := (if p3$1 then _HAVOC_bv8$1 else v4$1);
    v4$2 := (if p3$2 then _HAVOC_bv8$2 else v4$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v5$1 := (if p3$1 then _HAVOC_bv8$1 else v5$1);
    v5$2 := (if p3$2 then _HAVOC_bv8$2 else v5$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v6$1 := (if p3$1 then _HAVOC_bv8$1 else v6$1);
    v6$2 := (if p3$2 then _HAVOC_bv8$2 else v6$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v7$1 := (if p3$1 then _HAVOC_bv8$1 else v7$1);
    v7$2 := (if p3$2 then _HAVOC_bv8$2 else v7$2);
    v8$1 := (if p3$1 then UI8_TO_FP32(v4$1) else v8$1);
    v8$2 := (if p3$2 then UI8_TO_FP32(v4$2) else v8$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v9$1 := (if p3$1 then _HAVOC_bv8$1 else v9$1);
    v9$2 := (if p3$2 then _HAVOC_bv8$2 else v9$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v10$1 := (if p3$1 then _HAVOC_bv8$1 else v10$1);
    v10$2 := (if p3$2 then _HAVOC_bv8$2 else v10$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v11$1 := (if p3$1 then _HAVOC_bv8$1 else v11$1);
    v11$2 := (if p3$2 then _HAVOC_bv8$2 else v11$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v12$1 := (if p3$1 then _HAVOC_bv8$1 else v12$1);
    v12$2 := (if p3$2 then _HAVOC_bv8$2 else v12$2);
    v13$1 := (if p3$1 then UI8_TO_FP32(v10$1) else v13$1);
    v13$2 := (if p3$2 then UI8_TO_FP32(v10$2) else v13$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v14$1 := (if p3$1 then _HAVOC_bv8$1 else v14$1);
    v14$2 := (if p3$2 then _HAVOC_bv8$2 else v14$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v15$1 := (if p3$1 then _HAVOC_bv8$1 else v15$1);
    v15$2 := (if p3$2 then _HAVOC_bv8$2 else v15$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v16$1 := (if p3$1 then _HAVOC_bv8$1 else v16$1);
    v16$2 := (if p3$2 then _HAVOC_bv8$2 else v16$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v17$1 := (if p3$1 then _HAVOC_bv8$1 else v17$1);
    v17$2 := (if p3$2 then _HAVOC_bv8$2 else v17$2);
    v18$1 := (if p3$1 then UI8_TO_FP32(v16$1) else v18$1);
    v18$2 := (if p3$2 then UI8_TO_FP32(v16$2) else v18$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v19$1 := (if p3$1 then _HAVOC_bv8$1 else v19$1);
    v19$2 := (if p3$2 then _HAVOC_bv8$2 else v19$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v20$1 := (if p3$1 then _HAVOC_bv8$1 else v20$1);
    v20$2 := (if p3$2 then _HAVOC_bv8$2 else v20$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v21$1 := (if p3$1 then _HAVOC_bv8$1 else v21$1);
    v21$2 := (if p3$2 then _HAVOC_bv8$2 else v21$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v22$1 := (if p3$1 then _HAVOC_bv8$1 else v22$1);
    v22$2 := (if p3$2 then _HAVOC_bv8$2 else v22$2);
    v23$1 := (if p3$1 then UI8_TO_FP32(v22$1) else v23$1);
    v23$2 := (if p3$2 then UI8_TO_FP32(v22$2) else v23$2);
    v24$1 := (if p3$1 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $yb.0$1[32:0]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yp.0$1[32:0]), FADD32(FMUL32($a0, v8$1), FMUL32($a1, $xp.0$1[32:0])))) else v24$1);
    v24$2 := (if p3$2 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $yb.0$2[32:0]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yp.0$2[32:0]), FADD32(FMUL32($a0, v8$2), FMUL32($a1, $xp.0$2[32:0])))) else v24$2);
    v25$1 := (if p3$1 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $yb.0$1[64:32]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yp.0$1[64:32]), FADD32(FMUL32($a0, v13$1), FMUL32($a1, $xp.0$1[64:32])))) else v25$1);
    v25$2 := (if p3$2 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $yb.0$2[64:32]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yp.0$2[64:32]), FADD32(FMUL32($a0, v13$2), FMUL32($a1, $xp.0$2[64:32])))) else v25$2);
    v26$1 := (if p3$1 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $yb.0$1[96:64]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yp.0$1[96:64]), FADD32(FMUL32($a0, v18$1), FMUL32($a1, $xp.0$1[96:64])))) else v26$1);
    v26$2 := (if p3$2 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $yb.0$2[96:64]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yp.0$2[96:64]), FADD32(FMUL32($a0, v18$2), FMUL32($a1, $xp.0$2[96:64])))) else v26$2);
    v27$1 := (if p3$1 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $yb.0$1[128:96]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yp.0$1[128:96]), FADD32(FMUL32($a0, v23$1), FMUL32($a1, $xp.0$1[128:96])))) else v27$1);
    v27$2 := (if p3$2 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $yb.0$2[128:96]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yp.0$2[128:96]), FADD32(FMUL32($a0, v23$2), FMUL32($a1, $xp.0$2[128:96])))) else v27$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$output(p3$1, BV32_MUL(v3$1, 4bv32), FP32_TO_UI8(v24$1), $$output[BV32_MUL(v3$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p3$2, BV32_MUL(v3$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$output(p3$2, BV32_MUL(v3$2, 4bv32), FP32_TO_UI8(v24$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_MUL(v3$1, 4bv32)] := (if p3$1 then FP32_TO_UI8(v24$1) else $$output[BV32_MUL(v3$1, 4bv32)]);
    $$output[BV32_MUL(v3$2, 4bv32)] := (if p3$2 then FP32_TO_UI8(v24$2) else $$output[BV32_MUL(v3$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$output(p3$1, BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32), FP32_TO_UI8(v25$1), $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p3$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$output(p3$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32), FP32_TO_UI8(v25$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32)] := (if p3$1 then FP32_TO_UI8(v25$1) else $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 1bv32)]);
    $$output[BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32)] := (if p3$2 then FP32_TO_UI8(v25$2) else $$output[BV32_ADD(BV32_MUL(v3$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 25} _LOG_WRITE_$$output(p3$1, BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32), FP32_TO_UI8(v26$1), $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p3$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 25} _CHECK_WRITE_$$output(p3$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32), FP32_TO_UI8(v26$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32)] := (if p3$1 then FP32_TO_UI8(v26$1) else $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 2bv32)]);
    $$output[BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32)] := (if p3$2 then FP32_TO_UI8(v26$2) else $$output[BV32_ADD(BV32_MUL(v3$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$output(p3$1, BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32), FP32_TO_UI8(v27$1), $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p3$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$output(p3$2, BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32), FP32_TO_UI8(v27$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32)] := (if p3$1 then FP32_TO_UI8(v27$1) else $$output[BV32_ADD(BV32_MUL(v3$1, 4bv32), 3bv32)]);
    $$output[BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32)] := (if p3$2 then FP32_TO_UI8(v27$2) else $$output[BV32_ADD(BV32_MUL(v3$2, 4bv32), 3bv32)]);
    $xp.0$1, $yp.0$1, $yb.0$1, $y.0$1 := (if p3$1 then v23$1 ++ v18$1 ++ v13$1 ++ v8$1 else $xp.0$1), (if p3$1 then v27$1 ++ v26$1 ++ v25$1 ++ v24$1 else $yp.0$1), (if p3$1 then $yp.0$1 else $yb.0$1), (if p3$1 then BV32_ADD($y.0$1, 1bv32) else $y.0$1);
    $xp.0$2, $yp.0$2, $yb.0$2, $y.0$2 := (if p3$2 then v23$2 ++ v18$2 ++ v13$2 ++ v8$2 else $xp.0$2), (if p3$2 then v27$2 ++ v26$2 ++ v25$2 ++ v24$2 else $yp.0$2), (if p3$2 then $yp.0$2 else $yb.0$2), (if p3$2 then BV32_ADD($y.0$2, 1bv32) else $y.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, __partitioned_block_$3.tail_0;

  __partitioned_block_$3.tail_0:
    assume !p2$1 && !p2$2;
    goto __partitioned_block_$3.tail_1;

  __partitioned_block_$3.tail_1:
    call {:sourceloc_num 29} $bugle_barrier_duplicated_0(0bv1, 1bv1, p1$1, p1$2);
    $xn.0$1, $xa.0$1, $yn.0$1, $ya.0$1, $y1.0$1 := (if p1$1 then 0bv128 else $xn.0$1), (if p1$1 then 0bv128 else $xa.0$1), (if p1$1 then 0bv128 else $yn.0$1), (if p1$1 then 0bv128 else $ya.0$1), (if p1$1 then BV32_SUB($height, 1bv32) else $y1.0$1);
    $xn.0$2, $xa.0$2, $yn.0$2, $ya.0$2, $y1.0$2 := (if p1$2 then 0bv128 else $xn.0$2), (if p1$2 then 0bv128 else $xa.0$2), (if p1$2 then 0bv128 else $yn.0$2), (if p1$2 then 0bv128 else $ya.0$2), (if p1$2 then BV32_SUB($height, 1bv32) else $y1.0$2);
    p4$1 := (if p1$1 then true else p4$1);
    p4$2 := (if p1$2 then true else p4$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b28 ==> _WRITE_HAS_OCCURRED_$$output ==> local_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 4bv32), BV32_MUL(group_id_x$1, group_size_x));
    assert {:tag "accessBreak"} _b27 ==> _WRITE_HAS_OCCURRED_$$output ==> group_id_x$1 == BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 4bv32), group_size_x), BV32_DIV(local_id_x$1, group_size_x));
    assert {:tag "accessBreak"} _b26 ==> _READ_HAS_OCCURRED_$$output ==> local_id_x$1 == BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 4bv32), BV32_MUL(group_id_x$1, group_size_x));
    assert {:tag "accessBreak"} _b25 ==> _READ_HAS_OCCURRED_$$output ==> group_id_x$1 == BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 4bv32), group_size_x), BV32_DIV(local_id_x$1, group_size_x));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b24 ==> _WRITE_HAS_OCCURRED_$$output ==> BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 3bv32));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b23 ==> _READ_HAS_OCCURRED_$$output ==> BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(4294967295bv32, $width), 4bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_SUB($height, 1bv32), $width), BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)), 4bv32), 3bv32));
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b19 ==> BV32_SGT($y1.0$1, 4294967295bv32) ==> p4$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b19 ==> BV32_SGT($y1.0$2, 4294967295bv32) ==> p4$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b18 ==> BV32_UGE(v0$1, $width) ==> !_READ_HAS_OCCURRED_$$output;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b17 ==> BV32_UGE(v0$1, $width) ==> !_READ_HAS_OCCURRED_$$input;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b16 ==> BV32_UGE(v0$1, $width) ==> !_WRITE_HAS_OCCURRED_$$output;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b15 ==> BV32_UGE(v0$1, $width) ==> !p4$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b15 ==> BV32_UGE(v0$2, $width) ==> !p4$2;
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b14 ==> BV32_UGE($y1.0$1, BV32_SUB($height, 1bv32));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b14 ==> BV32_UGE($y1.0$2, BV32_SUB($height, 1bv32));
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b13 ==> BV32_ULE($y1.0$1, BV32_SUB($height, 1bv32));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b13 ==> BV32_ULE($y1.0$2, BV32_SUB($height, 1bv32));
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b12 ==> BV32_SGE($y1.0$1, BV32_SUB($height, 1bv32));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b12 ==> BV32_SGE($y1.0$2, BV32_SUB($height, 1bv32));
    assert {:tag "loopBound"} {:thread 1} p4$1 ==> _b11 ==> BV32_SLE($y1.0$1, BV32_SUB($height, 1bv32));
    assert {:tag "loopBound"} {:thread 2} p4$2 ==> _b11 ==> BV32_SLE($y1.0$2, BV32_SUB($height, 1bv32));
    assert {:tag "guardNonNeg"} {:thread 1} p4$1 ==> _b10 ==> BV32_SLE(0bv32, $y1.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p4$2 ==> _b10 ==> BV32_SLE(0bv32, $y1.0$2);
    assert {:tag "loopCounterIsStrided"} {:thread 1} p4$1 ==> _b9 ==> BV32_AND(BV32_SUB(4294967295bv32, 1bv32), $y1.0$1) == BV32_AND(BV32_SUB(4294967295bv32, 1bv32), BV32_SUB($height, 1bv32));
    assert {:tag "loopCounterIsStrided"} {:thread 2} p4$2 ==> _b9 ==> BV32_AND(BV32_SUB(4294967295bv32, 1bv32), $y1.0$2) == BV32_AND(BV32_SUB(4294967295bv32, 1bv32), BV32_SUB($height, 1bv32));
    assert {:block_sourceloc} {:sourceloc_num 30} p4$1 ==> true;
    v28$1 := (if p4$1 then BV32_SGT($y1.0$1, 4294967295bv32) else v28$1);
    v28$2 := (if p4$2 then BV32_SGT($y1.0$2, 4294967295bv32) else v28$2);
    p5$1 := false;
    p5$2 := false;
    p5$1 := (if p4$1 && v28$1 then v28$1 else p5$1);
    p5$2 := (if p4$2 && v28$2 then v28$2 else p5$2);
    p4$1 := (if p4$1 && !v28$1 then v28$1 else p4$1);
    p4$2 := (if p4$2 && !v28$2 then v28$2 else p4$2);
    v29$1 := (if p5$1 then BV32_ADD(v0$1, BV32_MUL($y1.0$1, $width)) else v29$1);
    v29$2 := (if p5$2 then BV32_ADD(v0$2, BV32_MUL($y1.0$2, $width)) else v29$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v30$1 := (if p5$1 then _HAVOC_bv8$1 else v30$1);
    v30$2 := (if p5$2 then _HAVOC_bv8$2 else v30$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v31$1 := (if p5$1 then _HAVOC_bv8$1 else v31$1);
    v31$2 := (if p5$2 then _HAVOC_bv8$2 else v31$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v32$1 := (if p5$1 then _HAVOC_bv8$1 else v32$1);
    v32$2 := (if p5$2 then _HAVOC_bv8$2 else v32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v33$1 := (if p5$1 then _HAVOC_bv8$1 else v33$1);
    v33$2 := (if p5$2 then _HAVOC_bv8$2 else v33$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v34$1 := (if p5$1 then _HAVOC_bv8$1 else v34$1);
    v34$2 := (if p5$2 then _HAVOC_bv8$2 else v34$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v35$1 := (if p5$1 then _HAVOC_bv8$1 else v35$1);
    v35$2 := (if p5$2 then _HAVOC_bv8$2 else v35$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v36$1 := (if p5$1 then _HAVOC_bv8$1 else v36$1);
    v36$2 := (if p5$2 then _HAVOC_bv8$2 else v36$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v37$1 := (if p5$1 then _HAVOC_bv8$1 else v37$1);
    v37$2 := (if p5$2 then _HAVOC_bv8$2 else v37$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v38$1 := (if p5$1 then _HAVOC_bv8$1 else v38$1);
    v38$2 := (if p5$2 then _HAVOC_bv8$2 else v38$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v39$1 := (if p5$1 then _HAVOC_bv8$1 else v39$1);
    v39$2 := (if p5$2 then _HAVOC_bv8$2 else v39$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v40$1 := (if p5$1 then _HAVOC_bv8$1 else v40$1);
    v40$2 := (if p5$2 then _HAVOC_bv8$2 else v40$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v41$1 := (if p5$1 then _HAVOC_bv8$1 else v41$1);
    v41$2 := (if p5$2 then _HAVOC_bv8$2 else v41$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v42$1 := (if p5$1 then _HAVOC_bv8$1 else v42$1);
    v42$2 := (if p5$2 then _HAVOC_bv8$2 else v42$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v43$1 := (if p5$1 then _HAVOC_bv8$1 else v43$1);
    v43$2 := (if p5$2 then _HAVOC_bv8$2 else v43$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v44$1 := (if p5$1 then _HAVOC_bv8$1 else v44$1);
    v44$2 := (if p5$2 then _HAVOC_bv8$2 else v44$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v45$1 := (if p5$1 then _HAVOC_bv8$1 else v45$1);
    v45$2 := (if p5$2 then _HAVOC_bv8$2 else v45$2);
    v46$1 := (if p5$1 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $ya.0$1[32:0]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yn.0$1[32:0]), FADD32(FMUL32($a2, $xn.0$1[32:0]), FMUL32($a3, $xa.0$1[32:0])))) else v46$1);
    v46$2 := (if p5$2 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $ya.0$2[32:0]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yn.0$2[32:0]), FADD32(FMUL32($a2, $xn.0$2[32:0]), FMUL32($a3, $xa.0$2[32:0])))) else v46$2);
    v47$1 := (if p5$1 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $ya.0$1[64:32]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yn.0$1[64:32]), FADD32(FMUL32($a2, $xn.0$1[64:32]), FMUL32($a3, $xa.0$1[64:32])))) else v47$1);
    v47$2 := (if p5$2 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $ya.0$2[64:32]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yn.0$2[64:32]), FADD32(FMUL32($a2, $xn.0$2[64:32]), FMUL32($a3, $xa.0$2[64:32])))) else v47$2);
    v48$1 := (if p5$1 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $ya.0$1[96:64]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yn.0$1[96:64]), FADD32(FMUL32($a2, $xn.0$1[96:64]), FMUL32($a3, $xa.0$1[96:64])))) else v48$1);
    v48$2 := (if p5$2 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $ya.0$2[96:64]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yn.0$2[96:64]), FADD32(FMUL32($a2, $xn.0$2[96:64]), FMUL32($a3, $xa.0$2[96:64])))) else v48$2);
    v49$1 := (if p5$1 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $ya.0$1[128:96]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yn.0$1[128:96]), FADD32(FMUL32($a2, $xn.0$1[128:96]), FMUL32($a3, $xa.0$1[128:96])))) else v49$1);
    v49$2 := (if p5$2 then FADD32(FMUL32(FSUB32(2147483648bv32, $b2), $ya.0$2[128:96]), FADD32(FMUL32(FSUB32(2147483648bv32, $b1), $yn.0$2[128:96]), FADD32(FMUL32($a2, $xn.0$2[128:96]), FMUL32($a3, $xa.0$2[128:96])))) else v49$2);
    call {:sourceloc} {:sourceloc_num 48} _LOG_READ_$$output(p5$1, BV32_MUL(v29$1, 4bv32), $$output[BV32_MUL(v29$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 48} _CHECK_READ_$$output(p5$2, BV32_MUL(v29$2, 4bv32), $$output[BV32_MUL(v29$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v50$1 := (if p5$1 then $$output[BV32_MUL(v29$1, 4bv32)] else v50$1);
    v50$2 := (if p5$2 then $$output[BV32_MUL(v29$2, 4bv32)] else v50$2);
    call {:sourceloc} {:sourceloc_num 49} _LOG_READ_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 49} _CHECK_READ_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32), $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v51$1 := (if p5$1 then $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32)] else v51$1);
    v51$2 := (if p5$2 then $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32)] else v51$2);
    call {:sourceloc} {:sourceloc_num 50} _LOG_READ_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 50} _CHECK_READ_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32), $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v52$1 := (if p5$1 then $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32)] else v52$1);
    v52$2 := (if p5$2 then $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32)] else v52$2);
    call {:sourceloc} {:sourceloc_num 51} _LOG_READ_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 51} _CHECK_READ_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32), $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v53$1 := (if p5$1 then $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32)] else v53$1);
    v53$2 := (if p5$2 then $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32)] else v53$2);
    call {:sourceloc} {:sourceloc_num 52} _LOG_READ_$$output(p5$1, BV32_MUL(v29$1, 4bv32), $$output[BV32_MUL(v29$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 52} _CHECK_READ_$$output(p5$2, BV32_MUL(v29$2, 4bv32), $$output[BV32_MUL(v29$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v54$1 := (if p5$1 then $$output[BV32_MUL(v29$1, 4bv32)] else v54$1);
    v54$2 := (if p5$2 then $$output[BV32_MUL(v29$2, 4bv32)] else v54$2);
    call {:sourceloc} {:sourceloc_num 53} _LOG_READ_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 53} _CHECK_READ_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32), $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v55$1 := (if p5$1 then $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32)] else v55$1);
    v55$2 := (if p5$2 then $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32)] else v55$2);
    call {:sourceloc} {:sourceloc_num 54} _LOG_READ_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 54} _CHECK_READ_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32), $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v56$1 := (if p5$1 then $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32)] else v56$1);
    v56$2 := (if p5$2 then $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32)] else v56$2);
    call {:sourceloc} {:sourceloc_num 55} _LOG_READ_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 55} _CHECK_READ_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32), $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v57$1 := (if p5$1 then $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32)] else v57$1);
    v57$2 := (if p5$2 then $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32)] else v57$2);
    call {:sourceloc} {:sourceloc_num 56} _LOG_READ_$$output(p5$1, BV32_MUL(v29$1, 4bv32), $$output[BV32_MUL(v29$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 56} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 56} _CHECK_READ_$$output(p5$2, BV32_MUL(v29$2, 4bv32), $$output[BV32_MUL(v29$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v58$1 := (if p5$1 then $$output[BV32_MUL(v29$1, 4bv32)] else v58$1);
    v58$2 := (if p5$2 then $$output[BV32_MUL(v29$2, 4bv32)] else v58$2);
    call {:sourceloc} {:sourceloc_num 57} _LOG_READ_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 57} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 57} _CHECK_READ_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32), $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v59$1 := (if p5$1 then $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32)] else v59$1);
    v59$2 := (if p5$2 then $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32)] else v59$2);
    call {:sourceloc} {:sourceloc_num 58} _LOG_READ_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 58} _CHECK_READ_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32), $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v60$1 := (if p5$1 then $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32)] else v60$1);
    v60$2 := (if p5$2 then $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32)] else v60$2);
    call {:sourceloc} {:sourceloc_num 59} _LOG_READ_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 59} _CHECK_READ_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32), $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v61$1 := (if p5$1 then $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32)] else v61$1);
    v61$2 := (if p5$2 then $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32)] else v61$2);
    call {:sourceloc} {:sourceloc_num 60} _LOG_READ_$$output(p5$1, BV32_MUL(v29$1, 4bv32), $$output[BV32_MUL(v29$1, 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 60} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 60} _CHECK_READ_$$output(p5$2, BV32_MUL(v29$2, 4bv32), $$output[BV32_MUL(v29$2, 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v62$1 := (if p5$1 then $$output[BV32_MUL(v29$1, 4bv32)] else v62$1);
    v62$2 := (if p5$2 then $$output[BV32_MUL(v29$2, 4bv32)] else v62$2);
    call {:sourceloc} {:sourceloc_num 61} _LOG_READ_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 61} _CHECK_READ_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32), $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v63$1 := (if p5$1 then $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32)] else v63$1);
    v63$2 := (if p5$2 then $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32)] else v63$2);
    call {:sourceloc} {:sourceloc_num 62} _LOG_READ_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 62} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 62} _CHECK_READ_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32), $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v64$1 := (if p5$1 then $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32)] else v64$1);
    v64$2 := (if p5$2 then $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32)] else v64$2);
    call {:sourceloc} {:sourceloc_num 63} _LOG_READ_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 63} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 63} _CHECK_READ_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32), $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$output"} true;
    v65$1 := (if p5$1 then $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32)] else v65$1);
    v65$2 := (if p5$2 then $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32)] else v65$2);
    call {:sourceloc} {:sourceloc_num 64} _LOG_WRITE_$$output(p5$1, BV32_MUL(v29$1, 4bv32), FP32_TO_UI8(FADD32(UI8_TO_FP32(v50$1), v46$1)), $$output[BV32_MUL(v29$1, 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p5$2, BV32_MUL(v29$2, 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 64} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 64} _CHECK_WRITE_$$output(p5$2, BV32_MUL(v29$2, 4bv32), FP32_TO_UI8(FADD32(UI8_TO_FP32(v50$2), v46$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_MUL(v29$1, 4bv32)] := (if p5$1 then FP32_TO_UI8(FADD32(UI8_TO_FP32(v50$1), v46$1)) else $$output[BV32_MUL(v29$1, 4bv32)]);
    $$output[BV32_MUL(v29$2, 4bv32)] := (if p5$2 then FP32_TO_UI8(FADD32(UI8_TO_FP32(v50$2), v46$2)) else $$output[BV32_MUL(v29$2, 4bv32)]);
    call {:sourceloc} {:sourceloc_num 65} _LOG_WRITE_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32), FP32_TO_UI8(FADD32(UI8_TO_FP32(v55$1), v47$1)), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 65} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 65} _CHECK_WRITE_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32), FP32_TO_UI8(FADD32(UI8_TO_FP32(v55$2), v47$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32)] := (if p5$1 then FP32_TO_UI8(FADD32(UI8_TO_FP32(v55$1), v47$1)) else $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 1bv32)]);
    $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32)] := (if p5$2 then FP32_TO_UI8(FADD32(UI8_TO_FP32(v55$2), v47$2)) else $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 1bv32)]);
    call {:sourceloc} {:sourceloc_num 66} _LOG_WRITE_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32), FP32_TO_UI8(FADD32(UI8_TO_FP32(v60$1), v48$1)), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 66} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 66} _CHECK_WRITE_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32), FP32_TO_UI8(FADD32(UI8_TO_FP32(v60$2), v48$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32)] := (if p5$1 then FP32_TO_UI8(FADD32(UI8_TO_FP32(v60$1), v48$1)) else $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 2bv32)]);
    $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32)] := (if p5$2 then FP32_TO_UI8(FADD32(UI8_TO_FP32(v60$2), v48$2)) else $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 2bv32)]);
    call {:sourceloc} {:sourceloc_num 67} _LOG_WRITE_$$output(p5$1, BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32), FP32_TO_UI8(FADD32(UI8_TO_FP32(v65$1), v49$1)), $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 67} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 67} _CHECK_WRITE_$$output(p5$2, BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32), FP32_TO_UI8(FADD32(UI8_TO_FP32(v65$2), v49$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32)] := (if p5$1 then FP32_TO_UI8(FADD32(UI8_TO_FP32(v65$1), v49$1)) else $$output[BV32_ADD(BV32_MUL(v29$1, 4bv32), 3bv32)]);
    $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32)] := (if p5$2 then FP32_TO_UI8(FADD32(UI8_TO_FP32(v65$2), v49$2)) else $$output[BV32_ADD(BV32_MUL(v29$2, 4bv32), 3bv32)]);
    $xn.0$1, $xa.0$1, $yn.0$1, $ya.0$1, $y1.0$1 := (if p5$1 then UI8_TO_FP32(v45$1) ++ UI8_TO_FP32(v40$1) ++ UI8_TO_FP32(v35$1) ++ UI8_TO_FP32(v30$1) else $xn.0$1), (if p5$1 then $xn.0$1 else $xa.0$1), (if p5$1 then v49$1 ++ v48$1 ++ v47$1 ++ v46$1 else $yn.0$1), (if p5$1 then $yn.0$1 else $ya.0$1), (if p5$1 then BV32_ADD($y1.0$1, 4294967295bv32) else $y1.0$1);
    $xn.0$2, $xa.0$2, $yn.0$2, $ya.0$2, $y1.0$2 := (if p5$2 then UI8_TO_FP32(v45$2) ++ UI8_TO_FP32(v40$2) ++ UI8_TO_FP32(v35$2) ++ UI8_TO_FP32(v30$2) else $xn.0$2), (if p5$2 then $xn.0$2 else $xa.0$2), (if p5$2 then v49$2 ++ v48$2 ++ v47$2 ++ v46$2 else $yn.0$2), (if p5$2 then $yn.0$2 else $ya.0$2), (if p5$2 then BV32_ADD($y1.0$2, 4294967295bv32) else $y1.0$2);
    p4$1 := (if p5$1 then true else p4$1);
    p4$2 := (if p5$2 then true else p4$2);
    goto $7.backedge, $7.tail;

  $7.tail:
    assume !p4$1 && !p4$2;
    return;

  $7.backedge:
    assume {:backedge} p4$1 || p4$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $7;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $3;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 0bv1;
  requires _P$2 ==> $0 == 0bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  requires {:barrier_divergence} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 == _P$2;
  modifies $$output, _TRACKING;



function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

const {:existential true} _b4: bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

const {:existential true} _b11: bool;

const {:existential true} _b12: bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const {:existential true} _b17: bool;

const {:existential true} _b18: bool;

const {:existential true} _b19: bool;

const _WATCHED_VALUE_$$input: bv8;

procedure {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _READ_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_READ_$$input(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$input);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$input: bool;

procedure {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$input, _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _WRITE_HAS_OCCURRED_$$input);
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



procedure _CHECK_WRITE_$$input(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_ATOMIC_$$input(_P: bool, _offset: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



const _WATCHED_VALUE_$$output: bv8;

procedure {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _READ_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_READ_$$output(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$output);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$output: bool;

procedure {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _WRITE_HAS_OCCURRED_$$output);
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



procedure _CHECK_WRITE_$$output(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_ATOMIC_$$output(_P: bool, _offset: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon4_Then, anon4_Else;

  anon4_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$output;
    goto anon1;

  anon1:
    goto anon5_Then, anon5_Else;

  anon5_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon3;

  anon3:
    havoc _TRACKING;
    return;

  anon5_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$output;
    goto anon3;

  anon4_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



const {:existential true} _b20: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b21: bool;

const {:existential true} _b22: bool;

const {:existential true} _b23: bool;

const {:existential true} _b24: bool;

const {:existential true} _b25: bool;

const {:existential true} _b26: bool;

const {:existential true} _b27: bool;

const {:existential true} _b28: bool;
