type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "v"} {:global} $$v: [bv32]bv8;

axiom {:array_info "$$v"} {:global} {:elem_width 8} {:source_name "v"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$v: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$v: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$v: bool;

axiom {:array_info "$$vx"} {:global} {:elem_width 32} {:source_name "vx"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$vx: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$vx: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$vx: bool;

axiom {:array_info "$$vy"} {:global} {:elem_width 32} {:source_name "vy"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$vy: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$vy: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$vy: bool;

axiom {:array_info "$$nvterm"} {:elem_width 8} {:source_name "nvterm"} {:source_elem_width 64} {:source_dimensions "1"} true;

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

function FDIV32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "updateVelocity_k"} {:kernel} $_Z16updateVelocity_kP6float2PfS1_iiiij($dx: bv32, $pdx: bv32, $dy: bv32, $lb: bv32, $pitch: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $dx == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $dy == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $lb == 16bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 3} {:thread 1} (if $pitch == 4096bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$v && !_WRITE_HAS_OCCURRED_$$v && !_ATOMIC_HAS_OCCURRED_$$v;
  requires !_READ_HAS_OCCURRED_$$vx && !_WRITE_HAS_OCCURRED_$$vx && !_ATOMIC_HAS_OCCURRED_$$vx;
  requires !_READ_HAS_OCCURRED_$$vy && !_WRITE_HAS_OCCURRED_$$vy && !_ATOMIC_HAS_OCCURRED_$$vy;
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
  modifies _WRITE_HAS_OCCURRED_$$v, _WRITE_READ_BENIGN_FLAG_$$v, _WRITE_READ_BENIGN_FLAG_$$v;



implementation {:source_name "updateVelocity_k"} {:kernel} $_Z16updateVelocity_kP6float2PfS1_iiiij($dx: bv32, $pdx: bv32, $dy: bv32, $lb: bv32, $pitch: bv32)
{
  var $p.0$1: bv32;
  var $p.0$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
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
  var v10$1: bv32;
  var v10$2: bv32;
  var v16$1: bv8;
  var v16$2: bv8;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v7$1: bv32;
  var v7$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_SLT(v0$1, $dx);
    v1$2 := BV32_SLT(v0$2, $dx);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p5$1 := false;
    p5$2 := false;
    p0$1 := (if v1$1 then v1$1 else p0$1);
    p0$2 := (if v1$2 then v1$2 else p0$2);
    $p.0$1 := (if p0$1 then 0bv32 else $p.0$1);
    $p.0$2 := (if p0$2 then 0bv32 else $p.0$2);
    p1$1 := (if p0$1 then true else p1$1);
    p1$2 := (if p0$2 then true else p1$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $2;

  $2:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b13 ==> _WRITE_HAS_OCCURRED_$$v ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $pitch), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), 8bv32))) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $pitch), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), 8bv32)), 1bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $pitch), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), 8bv32)), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $pitch), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), 8bv32)), 3bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $pitch), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), 8bv32)), 4bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $pitch), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), 8bv32)), 5bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $pitch), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), 8bv32)), 6bv32)) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, $pitch), 1bv32), BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $pitch), BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), 8bv32)), 7bv32));
    assert {:tag "accessUpperBoundBlock"} _b12 ==> _WRITE_HAS_OCCURRED_$$v ==> BV32_SLT(_WATCHED_OFFSET, BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), group_size_x), local_id_x$1), 8bv32));
    assert {:tag "accessLowerBoundBlock"} _b11 ==> _WRITE_HAS_OCCURRED_$$v ==> BV32_SLE(BV32_MUL(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), 8bv32), _WATCHED_OFFSET);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p1$1 ==> _b10 ==> p1$1 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), $dx);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p1$2 ==> _b10 ==> p1$2 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2), $dx);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b9 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), $dx) && BV32_SLT($p.0$1, $lb) ==> p1$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b9 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2), $dx) && BV32_SLT($p.0$2, $lb) ==> p1$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b8 ==> !BV32_SLT(v0$1, $dx) ==> !_READ_HAS_OCCURRED_$$vy;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b7 ==> !BV32_SLT(v0$1, $dx) ==> !_READ_HAS_OCCURRED_$$vx;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b6 ==> !BV32_SLT(v0$1, $dx) ==> !_WRITE_HAS_OCCURRED_$$v;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b5 ==> !BV32_SLT(v0$1, $dx) ==> !p1$1;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 2} _b5 ==> !BV32_SLT(v0$2, $dx) ==> !p1$2;
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b4 ==> BV32_UGE($p.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b4 ==> BV32_UGE($p.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b3 ==> BV32_ULE($p.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b3 ==> BV32_ULE($p.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b2 ==> BV32_SGE($p.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b2 ==> BV32_SGE($p.0$2, 0bv32);
    assert {:tag "loopBound"} {:thread 1} p1$1 ==> _b1 ==> BV32_SLE($p.0$1, 0bv32);
    assert {:tag "loopBound"} {:thread 2} p1$2 ==> _b1 ==> BV32_SLE($p.0$2, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} p1$1 ==> _b0 ==> BV32_SLE(0bv32, $p.0$1);
    assert {:tag "guardNonNeg"} {:thread 2} p1$2 ==> _b0 ==> BV32_SLE(0bv32, $p.0$2);
    assert {:block_sourceloc} {:sourceloc_num 6} p1$1 ==> true;
    v2$1 := (if p1$1 then BV32_SLT($p.0$1, $lb) else v2$1);
    v2$2 := (if p1$2 then BV32_SLT($p.0$2, $lb) else v2$2);
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p2$1 := (if p1$1 && v2$1 then v2$1 else p2$1);
    p2$2 := (if p1$2 && v2$2 then v2$2 else p2$2);
    p1$1 := (if p1$1 && !v2$1 then v2$1 else p1$1);
    p1$2 := (if p1$2 && !v2$2 then v2$2 else p1$2);
    v3$1 := (if p2$1 then BV32_ADD(BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb)), $p.0$1) else v3$1);
    v3$2 := (if p2$2 then BV32_ADD(BV32_ADD(BV32_MUL(group_id_y$2, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$2, $lb)), $p.0$2) else v3$2);
    v4$1 := (if p2$1 then BV32_SLT(v3$1, $dy) else v4$1);
    v4$2 := (if p2$2 then BV32_SLT(v3$2, $dy) else v4$2);
    p4$1 := (if p2$1 && v4$1 then v4$1 else p4$1);
    p4$2 := (if p2$2 && v4$2 then v4$2 else p4$2);
    v5$1 := (if p4$1 then BV32_ADD(BV32_MUL(v3$1, $pdx), v0$1) else v5$1);
    v5$2 := (if p4$2 then BV32_ADD(BV32_MUL(v3$2, $pdx), v0$2) else v5$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v6$1 := (if p4$1 then _HAVOC_bv32$1 else v6$1);
    v6$2 := (if p4$2 then _HAVOC_bv32$2 else v6$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v7$1 := (if p4$1 then _HAVOC_bv32$1 else v7$1);
    v7$2 := (if p4$2 then _HAVOC_bv32$2 else v7$2);
    v8$1 := (if p4$1 then FDIV32(1065353216bv32, SI32_TO_FP32(BV32_MUL($dx, $dy))) else v8$1);
    v8$2 := (if p4$2 then FDIV32(1065353216bv32, SI32_TO_FP32(BV32_MUL($dx, $dy))) else v8$2);
    v9$1 := (if p4$1 then FMUL32(v6$1, v8$1) else v9$1);
    v9$2 := (if p4$2 then FMUL32(v6$2, v8$2) else v9$2);
    $$nvterm$0bv32$1 := (if p4$1 then v9$1[8:0] else $$nvterm$0bv32$1);
    $$nvterm$0bv32$2 := (if p4$2 then v9$2[8:0] else $$nvterm$0bv32$2);
    $$nvterm$1bv32$1 := (if p4$1 then v9$1[16:8] else $$nvterm$1bv32$1);
    $$nvterm$1bv32$2 := (if p4$2 then v9$2[16:8] else $$nvterm$1bv32$2);
    $$nvterm$2bv32$1 := (if p4$1 then v9$1[24:16] else $$nvterm$2bv32$1);
    $$nvterm$2bv32$2 := (if p4$2 then v9$2[24:16] else $$nvterm$2bv32$2);
    $$nvterm$3bv32$1 := (if p4$1 then v9$1[32:24] else $$nvterm$3bv32$1);
    $$nvterm$3bv32$2 := (if p4$2 then v9$2[32:24] else $$nvterm$3bv32$2);
    v10$1 := (if p4$1 then FMUL32(v7$1, v8$1) else v10$1);
    v10$2 := (if p4$2 then FMUL32(v7$2, v8$2) else v10$2);
    $$nvterm$4bv32$1 := (if p4$1 then v10$1[8:0] else $$nvterm$4bv32$1);
    $$nvterm$4bv32$2 := (if p4$2 then v10$2[8:0] else $$nvterm$4bv32$2);
    $$nvterm$5bv32$1 := (if p4$1 then v10$1[16:8] else $$nvterm$5bv32$1);
    $$nvterm$5bv32$2 := (if p4$2 then v10$2[16:8] else $$nvterm$5bv32$2);
    $$nvterm$6bv32$1 := (if p4$1 then v10$1[24:16] else $$nvterm$6bv32$1);
    $$nvterm$6bv32$2 := (if p4$2 then v10$2[24:16] else $$nvterm$6bv32$2);
    $$nvterm$7bv32$1 := (if p4$1 then v10$1[32:24] else $$nvterm$7bv32$1);
    $$nvterm$7bv32$2 := (if p4$2 then v10$2[32:24] else $$nvterm$7bv32$2);
    v11$1 := (if p4$1 then $$nvterm$0bv32$1 else v11$1);
    v11$2 := (if p4$2 then $$nvterm$0bv32$2 else v11$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$v(p4$1, BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), v11$1, $$v[BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(p4$2, BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$v(p4$2, BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), v11$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32))] := (if p4$1 then v11$1 else $$v[BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32))]);
    $$v[BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32))] := (if p4$2 then v11$2 else $$v[BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32))]);
    v12$1 := (if p4$1 then $$nvterm$1bv32$1 else v12$1);
    v12$2 := (if p4$2 then $$nvterm$1bv32$2 else v12$2);
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$v(p4$1, BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 1bv32), v12$1, $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(p4$2, BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$v(p4$2, BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 1bv32), v12$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 1bv32)] := (if p4$1 then v12$1 else $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 1bv32)]);
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 1bv32)] := (if p4$2 then v12$2 else $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 1bv32)]);
    v13$1 := (if p4$1 then $$nvterm$2bv32$1 else v13$1);
    v13$2 := (if p4$2 then $$nvterm$2bv32$2 else v13$2);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$v(p4$1, BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 2bv32), v13$1, $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(p4$2, BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$v(p4$2, BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 2bv32), v13$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 2bv32)] := (if p4$1 then v13$1 else $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 2bv32)]);
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 2bv32)] := (if p4$2 then v13$2 else $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 2bv32)]);
    v14$1 := (if p4$1 then $$nvterm$3bv32$1 else v14$1);
    v14$2 := (if p4$2 then $$nvterm$3bv32$2 else v14$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$v(p4$1, BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 3bv32), v14$1, $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(p4$2, BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$v(p4$2, BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 3bv32), v14$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 3bv32)] := (if p4$1 then v14$1 else $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 3bv32)]);
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 3bv32)] := (if p4$2 then v14$2 else $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 3bv32)]);
    v15$1 := (if p4$1 then $$nvterm$4bv32$1 else v15$1);
    v15$2 := (if p4$2 then $$nvterm$4bv32$2 else v15$2);
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$v(p4$1, BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 4bv32), v15$1, $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(p4$2, BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$v(p4$2, BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 4bv32), v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 4bv32)] := (if p4$1 then v15$1 else $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 4bv32)]);
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 4bv32)] := (if p4$2 then v15$2 else $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 4bv32)]);
    v16$1 := (if p4$1 then $$nvterm$5bv32$1 else v16$1);
    v16$2 := (if p4$2 then $$nvterm$5bv32$2 else v16$2);
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$v(p4$1, BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 5bv32), v16$1, $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(p4$2, BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$v(p4$2, BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 5bv32), v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 5bv32)] := (if p4$1 then v16$1 else $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 5bv32)]);
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 5bv32)] := (if p4$2 then v16$2 else $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 5bv32)]);
    v17$1 := (if p4$1 then $$nvterm$6bv32$1 else v17$1);
    v17$2 := (if p4$2 then $$nvterm$6bv32$2 else v17$2);
    call {:sourceloc} {:sourceloc_num 32} _LOG_WRITE_$$v(p4$1, BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 6bv32), v17$1, $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(p4$2, BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 32} _CHECK_WRITE_$$v(p4$2, BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 6bv32), v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 6bv32)] := (if p4$1 then v17$1 else $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 6bv32)]);
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 6bv32)] := (if p4$2 then v17$2 else $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 6bv32)]);
    v18$1 := (if p4$1 then $$nvterm$7bv32$1 else v18$1);
    v18$2 := (if p4$2 then $$nvterm$7bv32$2 else v18$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$v(p4$1, BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 7bv32), v18$1, $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(p4$2, BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$v(p4$2, BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 7bv32), v18$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$v"} true;
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 7bv32)] := (if p4$1 then v18$1 else $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$1, $pitch), BV32_MUL(v0$1, 8bv32)), 7bv32)]);
    $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 7bv32)] := (if p4$2 then v18$2 else $$v[BV32_ADD(BV32_ADD(BV32_MUL(v3$2, $pitch), BV32_MUL(v0$2, 8bv32)), 7bv32)]);
    $p.0$1 := (if p2$1 then BV32_ADD($p.0$1, 1bv32) else $p.0$1);
    $p.0$2 := (if p2$2 then BV32_ADD($p.0$2, 1bv32) else $p.0$2);
    p1$1 := (if p2$1 then true else p1$1);
    p1$2 := (if p2$2 then true else p1$2);
    goto $2.backedge, $2.tail;

  $2.tail:
    assume !p1$1 && !p1$2;
    return;

  $2.backedge:
    assume {:backedge} p1$1 || p1$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $2;
}



axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$nvterm$0bv32$1: bv8;

var $$nvterm$0bv32$2: bv8;

var $$nvterm$1bv32$1: bv8;

var $$nvterm$1bv32$2: bv8;

var $$nvterm$2bv32$1: bv8;

var $$nvterm$2bv32$2: bv8;

var $$nvterm$3bv32$1: bv8;

var $$nvterm$3bv32$2: bv8;

var $$nvterm$4bv32$1: bv8;

var $$nvterm$4bv32$2: bv8;

var $$nvterm$5bv32$1: bv8;

var $$nvterm$5bv32$2: bv8;

var $$nvterm$6bv32$1: bv8;

var $$nvterm$6bv32$2: bv8;

var $$nvterm$7bv32$1: bv8;

var $$nvterm$7bv32$2: bv8;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

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

const _WATCHED_VALUE_$$v: bv8;

procedure {:inline 1} _LOG_READ_$$v(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$v;



implementation {:inline 1} _LOG_READ_$$v(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v == _value then true else _READ_HAS_OCCURRED_$$v);
    return;
}



procedure _CHECK_READ_$$v(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "v"} {:array "$$v"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$v);
  requires {:source_name "v"} {:array "$$v"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$v: bool;

procedure {:inline 1} _LOG_WRITE_$$v(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$v, _WRITE_READ_BENIGN_FLAG_$$v;



implementation {:inline 1} _LOG_WRITE_$$v(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v == _value then true else _WRITE_HAS_OCCURRED_$$v);
    _WRITE_READ_BENIGN_FLAG_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$v);
    return;
}



procedure _CHECK_WRITE_$$v(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "v"} {:array "$$v"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v != _value);
  requires {:source_name "v"} {:array "$$v"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v != _value);
  requires {:source_name "v"} {:array "$$v"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$v(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$v;



implementation {:inline 1} _LOG_ATOMIC_$$v(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$v);
    return;
}



procedure _CHECK_ATOMIC_$$v(_P: bool, _offset: bv32);
  requires {:source_name "v"} {:array "$$v"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset);
  requires {:source_name "v"} {:array "$$v"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$v;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$v(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$v := (if _P && _WRITE_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$v);
    return;
}



const _WATCHED_VALUE_$$vx: bv32;

procedure {:inline 1} _LOG_READ_$$vx(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$vx;



implementation {:inline 1} _LOG_READ_$$vx(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$vx := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vx == _value then true else _READ_HAS_OCCURRED_$$vx);
    return;
}



procedure _CHECK_READ_$$vx(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vx"} {:array "$$vx"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$vx && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$vx);
  requires {:source_name "vx"} {:array "$$vx"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$vx && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$vx: bool;

procedure {:inline 1} _LOG_WRITE_$$vx(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$vx, _WRITE_READ_BENIGN_FLAG_$$vx;



implementation {:inline 1} _LOG_WRITE_$$vx(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$vx := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vx == _value then true else _WRITE_HAS_OCCURRED_$$vx);
    _WRITE_READ_BENIGN_FLAG_$$vx := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vx == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$vx);
    return;
}



procedure _CHECK_WRITE_$$vx(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vx"} {:array "$$vx"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$vx && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vx != _value);
  requires {:source_name "vx"} {:array "$$vx"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$vx && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vx != _value);
  requires {:source_name "vx"} {:array "$$vx"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$vx && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$vx(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$vx;



implementation {:inline 1} _LOG_ATOMIC_$$vx(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$vx := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$vx);
    return;
}



procedure _CHECK_ATOMIC_$$vx(_P: bool, _offset: bv32);
  requires {:source_name "vx"} {:array "$$vx"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$vx && _WATCHED_OFFSET == _offset);
  requires {:source_name "vx"} {:array "$$vx"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$vx && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vx(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$vx;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vx(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$vx := (if _P && _WRITE_HAS_OCCURRED_$$vx && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$vx);
    return;
}



const _WATCHED_VALUE_$$vy: bv32;

procedure {:inline 1} _LOG_READ_$$vy(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$vy;



implementation {:inline 1} _LOG_READ_$$vy(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$vy := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vy == _value then true else _READ_HAS_OCCURRED_$$vy);
    return;
}



procedure _CHECK_READ_$$vy(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vy"} {:array "$$vy"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$vy && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$vy);
  requires {:source_name "vy"} {:array "$$vy"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$vy && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$vy: bool;

procedure {:inline 1} _LOG_WRITE_$$vy(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$vy, _WRITE_READ_BENIGN_FLAG_$$vy;



implementation {:inline 1} _LOG_WRITE_$$vy(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$vy := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vy == _value then true else _WRITE_HAS_OCCURRED_$$vy);
    _WRITE_READ_BENIGN_FLAG_$$vy := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vy == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$vy);
    return;
}



procedure _CHECK_WRITE_$$vy(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vy"} {:array "$$vy"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$vy && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vy != _value);
  requires {:source_name "vy"} {:array "$$vy"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$vy && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vy != _value);
  requires {:source_name "vy"} {:array "$$vy"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$vy && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$vy(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$vy;



implementation {:inline 1} _LOG_ATOMIC_$$vy(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$vy := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$vy);
    return;
}



procedure _CHECK_ATOMIC_$$vy(_P: bool, _offset: bv32);
  requires {:source_name "vy"} {:array "$$vy"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$vy && _WATCHED_OFFSET == _offset);
  requires {:source_name "vy"} {:array "$$vy"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$vy && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vy(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$vy;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vy(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$vy := (if _P && _WRITE_HAS_OCCURRED_$$vy && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$vy);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b11: bool;

const {:existential true} _b12: bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b13: bool;
