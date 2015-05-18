type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "vx"} {:global} $$vx: [bv32]bv32;

axiom {:array_info "$$vx"} {:global} {:elem_width 32} {:source_name "vx"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$vx: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$vx: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$vx: bool;

var {:source_name "vy"} {:global} $$vy: [bv32]bv32;

axiom {:array_info "$$vy"} {:global} {:elem_width 32} {:source_name "vy"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$vy: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$vy: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$vy: bool;

axiom {:array_info "$$xterm"} {:elem_width 32} {:source_name "xterm"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$yterm"} {:elem_width 32} {:source_name "yterm"} {:source_elem_width 64} {:source_dimensions "1"} true;

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

function FADD32(bv32, bv32) : bv32;

function FDIV32(bv32, bv32) : bv32;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "diffuseProject_k"} {:kernel} $_Z16diffuseProject_kP6float2S0_iiffi($dx: bv32, $dy: bv32, $dt: bv32, $visc: bv32, $lb: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $dx == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $dy == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $lb == 16bv32 then 1bv1 else 0bv1) != 0bv1;
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
  modifies _READ_HAS_OCCURRED_$$vx, _READ_HAS_OCCURRED_$$vy, _WRITE_HAS_OCCURRED_$$vx, _WRITE_READ_BENIGN_FLAG_$$vx, _WRITE_READ_BENIGN_FLAG_$$vx, _WRITE_HAS_OCCURRED_$$vy, _WRITE_READ_BENIGN_FLAG_$$vy, _WRITE_READ_BENIGN_FLAG_$$vy;



implementation {:source_name "diffuseProject_k"} {:kernel} $_Z16diffuseProject_kP6float2S0_iiffi($dx: bv32, $dy: bv32, $dt: bv32, $visc: bv32, $lb: bv32)
{
  var $p.0$1: bv32;
  var $p.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bool;
  var v2$2: bool;
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
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
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
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bool;
  var v17$2: bool;
  var v18$1: bv32;
  var v18$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
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
  var v28$1: bv32;
  var v28$2: bv32;
  var v29$1: bv32;
  var v29$2: bv32;
  var v30$1: bv32;
  var v30$2: bv32;
  var v31$1: bv32;
  var v31$2: bv32;
  var v32$1: bv32;
  var v32$2: bv32;
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


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_SLT(v0$1, $dx);
    v1$2 := BV32_SLT(v0$2, $dx);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p9$1 := false;
    p9$2 := false;
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
    assert {:tag "accessBreak"} _b31 ==> _WRITE_HAS_OCCURRED_$$vy ==> local_id_x$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 2bv32), BV32_MUL(BV32_MUL(BV32_MUL(group_id_y$1, $dx), $lb), group_size_y)), BV32_MUL(BV32_MUL(local_id_y$1, $dx), $lb)), BV32_MUL(group_id_x$1, group_size_x));
    assert {:tag "accessBreak"} _b30 ==> _WRITE_HAS_OCCURRED_$$vy ==> group_id_x$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), group_size_x), BV32_DIV(BV32_MUL(BV32_MUL(BV32_MUL(group_id_y$1, $dx), $lb), group_size_y), group_size_x)), BV32_DIV(BV32_MUL(BV32_MUL(local_id_y$1, $dx), $lb), group_size_x)), BV32_DIV(local_id_x$1, group_size_x));
    assert {:tag "accessBreak"} _b29 ==> _WRITE_HAS_OCCURRED_$$vy ==> local_id_y$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), $dx), $lb), BV32_DIV(BV32_MUL(BV32_MUL(group_id_y$1, $lb), group_size_y), $lb)), BV32_DIV(BV32_DIV(BV32_MUL(group_id_x$1, group_size_x), $dx), $lb)), BV32_DIV(BV32_DIV(local_id_x$1, $dx), $lb));
    assert {:tag "accessBreak"} _b28 ==> _WRITE_HAS_OCCURRED_$$vy ==> group_id_y$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), $dx), $lb), group_size_y), BV32_DIV(BV32_DIV(BV32_MUL(local_id_y$1, $lb), $lb), group_size_y)), BV32_DIV(BV32_DIV(BV32_DIV(BV32_MUL(group_id_x$1, group_size_x), $dx), $lb), group_size_y)), BV32_DIV(BV32_DIV(BV32_DIV(local_id_x$1, $dx), $lb), group_size_y));
    assert {:tag "accessBreak"} _b27 ==> _READ_HAS_OCCURRED_$$vy ==> local_id_x$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 2bv32), BV32_MUL(BV32_MUL(BV32_MUL(group_id_y$1, $dx), $lb), group_size_y)), BV32_MUL(BV32_MUL(local_id_y$1, $dx), $lb)), BV32_MUL(group_id_x$1, group_size_x));
    assert {:tag "accessBreak"} _b26 ==> _READ_HAS_OCCURRED_$$vy ==> group_id_x$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), group_size_x), BV32_DIV(BV32_MUL(BV32_MUL(BV32_MUL(group_id_y$1, $dx), $lb), group_size_y), group_size_x)), BV32_DIV(BV32_MUL(BV32_MUL(local_id_y$1, $dx), $lb), group_size_x)), BV32_DIV(local_id_x$1, group_size_x));
    assert {:tag "accessBreak"} _b25 ==> _READ_HAS_OCCURRED_$$vy ==> local_id_y$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), $dx), $lb), BV32_DIV(BV32_MUL(BV32_MUL(group_id_y$1, $lb), group_size_y), $lb)), BV32_DIV(BV32_DIV(BV32_MUL(group_id_x$1, group_size_x), $dx), $lb)), BV32_DIV(BV32_DIV(local_id_x$1, $dx), $lb));
    assert {:tag "accessBreak"} _b24 ==> _READ_HAS_OCCURRED_$$vy ==> group_id_y$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), $dx), $lb), group_size_y), BV32_DIV(BV32_DIV(BV32_MUL(local_id_y$1, $lb), $lb), group_size_y)), BV32_DIV(BV32_DIV(BV32_DIV(BV32_MUL(group_id_x$1, group_size_x), $dx), $lb), group_size_y)), BV32_DIV(BV32_DIV(BV32_DIV(local_id_x$1, $dx), $lb), group_size_y));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b23 ==> _WRITE_HAS_OCCURRED_$$vy ==> BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $dx), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $dx), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 2bv32), 1bv32));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b22 ==> _READ_HAS_OCCURRED_$$vy ==> BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $dx), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $dx), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 2bv32), 1bv32));
    assert {:tag "accessBreak"} _b21 ==> _WRITE_HAS_OCCURRED_$$vx ==> local_id_x$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 2bv32), BV32_MUL(BV32_MUL(BV32_MUL(group_id_y$1, $dx), $lb), group_size_y)), BV32_MUL(BV32_MUL(local_id_y$1, $dx), $lb)), BV32_MUL(group_id_x$1, group_size_x));
    assert {:tag "accessBreak"} _b20 ==> _WRITE_HAS_OCCURRED_$$vx ==> group_id_x$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), group_size_x), BV32_DIV(BV32_MUL(BV32_MUL(BV32_MUL(group_id_y$1, $dx), $lb), group_size_y), group_size_x)), BV32_DIV(BV32_MUL(BV32_MUL(local_id_y$1, $dx), $lb), group_size_x)), BV32_DIV(local_id_x$1, group_size_x));
    assert {:tag "accessBreak"} _b19 ==> _WRITE_HAS_OCCURRED_$$vx ==> local_id_y$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), $dx), $lb), BV32_DIV(BV32_MUL(BV32_MUL(group_id_y$1, $lb), group_size_y), $lb)), BV32_DIV(BV32_DIV(BV32_MUL(group_id_x$1, group_size_x), $dx), $lb)), BV32_DIV(BV32_DIV(local_id_x$1, $dx), $lb));
    assert {:tag "accessBreak"} _b18 ==> _WRITE_HAS_OCCURRED_$$vx ==> group_id_y$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), $dx), $lb), group_size_y), BV32_DIV(BV32_DIV(BV32_MUL(local_id_y$1, $lb), $lb), group_size_y)), BV32_DIV(BV32_DIV(BV32_DIV(BV32_MUL(group_id_x$1, group_size_x), $dx), $lb), group_size_y)), BV32_DIV(BV32_DIV(BV32_DIV(local_id_x$1, $dx), $lb), group_size_y));
    assert {:tag "accessBreak"} _b17 ==> _READ_HAS_OCCURRED_$$vx ==> local_id_x$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(_WATCHED_OFFSET, 2bv32), BV32_MUL(BV32_MUL(BV32_MUL(group_id_y$1, $dx), $lb), group_size_y)), BV32_MUL(BV32_MUL(local_id_y$1, $dx), $lb)), BV32_MUL(group_id_x$1, group_size_x));
    assert {:tag "accessBreak"} _b16 ==> _READ_HAS_OCCURRED_$$vx ==> group_id_x$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), group_size_x), BV32_DIV(BV32_MUL(BV32_MUL(BV32_MUL(group_id_y$1, $dx), $lb), group_size_y), group_size_x)), BV32_DIV(BV32_MUL(BV32_MUL(local_id_y$1, $dx), $lb), group_size_x)), BV32_DIV(local_id_x$1, group_size_x));
    assert {:tag "accessBreak"} _b15 ==> _READ_HAS_OCCURRED_$$vx ==> local_id_y$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), $dx), $lb), BV32_DIV(BV32_MUL(BV32_MUL(group_id_y$1, $lb), group_size_y), $lb)), BV32_DIV(BV32_DIV(BV32_MUL(group_id_x$1, group_size_x), $dx), $lb)), BV32_DIV(BV32_DIV(local_id_x$1, $dx), $lb));
    assert {:tag "accessBreak"} _b14 ==> _READ_HAS_OCCURRED_$$vx ==> group_id_y$1 == BV32_SUB(BV32_SUB(BV32_SUB(BV32_DIV(BV32_DIV(BV32_DIV(BV32_DIV(_WATCHED_OFFSET, 2bv32), $dx), $lb), group_size_y), BV32_DIV(BV32_DIV(BV32_MUL(local_id_y$1, $lb), $lb), group_size_y)), BV32_DIV(BV32_DIV(BV32_DIV(BV32_MUL(group_id_x$1, group_size_x), $dx), $lb), group_size_y)), BV32_DIV(BV32_DIV(BV32_DIV(local_id_x$1, $dx), $lb), group_size_y));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b13 ==> _WRITE_HAS_OCCURRED_$$vx ==> BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $dx), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $dx), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 2bv32), 1bv32));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b12 ==> _READ_HAS_OCCURRED_$$vx ==> BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $dx), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 2bv32)) || BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(BV32_MUL(1bv32, $dx), 2bv32), 1bv32), BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(BV32_ADD(0bv32, BV32_ADD(BV32_MUL(group_id_y$1, BV32_MUL($lb, group_size_y)), BV32_MUL(local_id_y$1, $lb))), $dx), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 2bv32), 1bv32));
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 1} p1$1 ==> _b11 ==> p1$1 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), $dx);
    assert {:tag "conditionsImpliedByEnabledness"} {:thread 2} p1$2 ==> _b11 ==> p1$2 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2), $dx);
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 1} _b10 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), $dx) && BV32_SLT($p.0$1, $lb) ==> p1$1;
    assert {:do_not_predicate} {:tag "conditionsImplyingEnabledness"} {:thread 2} _b10 ==> BV32_SLT(BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2), $dx) && BV32_SLT($p.0$2, $lb) ==> p1$2;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b9 ==> !BV32_SLT(v0$1, $dx) ==> !_READ_HAS_OCCURRED_$$vy;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b8 ==> !BV32_SLT(v0$1, $dx) ==> !_READ_HAS_OCCURRED_$$vx;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b7 ==> !BV32_SLT(v0$1, $dx) ==> !_WRITE_HAS_OCCURRED_$$vy;
    assert {:do_not_predicate} {:tag "conditionalLoopExecution"} {:thread 1} _b6 ==> !BV32_SLT(v0$1, $dx) ==> !_WRITE_HAS_OCCURRED_$$vx;
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
    assert {:block_sourceloc} {:sourceloc_num 5} p1$1 ==> true;
    v2$1 := (if p1$1 then BV32_SLT($p.0$1, $lb) else v2$1);
    v2$2 := (if p1$2 then BV32_SLT($p.0$2, $lb) else v2$2);
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
    v5$1 := (if p4$1 then BV32_ADD(BV32_MUL(v3$1, $dx), v0$1) else v5$1);
    v5$2 := (if p4$2 then BV32_ADD(BV32_MUL(v3$2, $dx), v0$2) else v5$2);
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$vx(p4$1, BV32_MUL(v5$1, 2bv32), $$vx[BV32_MUL(v5$1, 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$vx(p4$2, BV32_MUL(v5$2, 2bv32), $$vx[BV32_MUL(v5$2, 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$vx"} true;
    v6$1 := (if p4$1 then $$vx[BV32_MUL(v5$1, 2bv32)] else v6$1);
    v6$2 := (if p4$2 then $$vx[BV32_MUL(v5$2, 2bv32)] else v6$2);
    $$xterm$0bv32$1 := (if p4$1 then v6$1 else $$xterm$0bv32$1);
    $$xterm$0bv32$2 := (if p4$2 then v6$2 else $$xterm$0bv32$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$vx(p4$1, BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32), $$vx[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$vx(p4$2, BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32), $$vx[BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$vx"} true;
    v7$1 := (if p4$1 then $$vx[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)] else v7$1);
    v7$2 := (if p4$2 then $$vx[BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32)] else v7$2);
    $$xterm$1bv32$1 := (if p4$1 then v7$1 else $$xterm$1bv32$1);
    $$xterm$1bv32$2 := (if p4$2 then v7$2 else $$xterm$1bv32$2);
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$vy(p4$1, BV32_MUL(v5$1, 2bv32), $$vy[BV32_MUL(v5$1, 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$vy(p4$2, BV32_MUL(v5$2, 2bv32), $$vy[BV32_MUL(v5$2, 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$vy"} true;
    v8$1 := (if p4$1 then $$vy[BV32_MUL(v5$1, 2bv32)] else v8$1);
    v8$2 := (if p4$2 then $$vy[BV32_MUL(v5$2, 2bv32)] else v8$2);
    $$yterm$0bv32$1 := (if p4$1 then v8$1 else $$yterm$0bv32$1);
    $$yterm$0bv32$2 := (if p4$2 then v8$2 else $$yterm$0bv32$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$vy(p4$1, BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32), $$vy[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$vy(p4$2, BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32), $$vy[BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$vy"} true;
    v9$1 := (if p4$1 then $$vy[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)] else v9$1);
    v9$2 := (if p4$2 then $$vy[BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32)] else v9$2);
    $$yterm$1bv32$1 := (if p4$1 then v9$1 else $$yterm$1bv32$1);
    $$yterm$1bv32$2 := (if p4$2 then v9$2 else $$yterm$1bv32$2);
    v10$1 := (if p4$1 then BV32_SGT(v3$1, BV32_SDIV($dy, 2bv32)) else v10$1);
    v10$2 := (if p4$2 then BV32_SGT(v3$2, BV32_SDIV($dy, 2bv32)) else v10$2);
    p6$1 := (if p4$1 && v10$1 then v10$1 else p6$1);
    p6$2 := (if p4$2 && v10$2 then v10$2 else p6$2);
    p5$1 := (if p4$1 && !v10$1 then !v10$1 else p5$1);
    p5$2 := (if p4$2 && !v10$2 then !v10$2 else p5$2);
    $0$1 := (if p5$1 then v3$1 else $0$1);
    $0$2 := (if p5$2 then v3$2 else $0$2);
    $0$1 := (if p6$1 then BV32_SUB(v3$1, $dy) else $0$1);
    $0$2 := (if p6$2 then BV32_SUB(v3$2, $dy) else $0$2);
    v11$1 := (if p4$1 then SI32_TO_FP32(BV32_ADD(BV32_MUL(v0$1, v0$1), BV32_MUL($0$1, $0$1))) else v11$1);
    v11$2 := (if p4$2 then SI32_TO_FP32(BV32_ADD(BV32_MUL(v0$2, v0$2), BV32_MUL($0$2, $0$2))) else v11$2);
    v12$1 := (if p4$1 then FDIV32(1065353216bv32, FADD32(1065353216bv32, FMUL32(FMUL32($visc, $dt), v11$1))) else v12$1);
    v12$2 := (if p4$2 then FDIV32(1065353216bv32, FADD32(1065353216bv32, FMUL32(FMUL32($visc, $dt), v11$2))) else v12$2);
    v13$1 := (if p4$1 then $$xterm$0bv32$1 else v13$1);
    v13$2 := (if p4$2 then $$xterm$0bv32$2 else v13$2);
    $$xterm$0bv32$1 := (if p4$1 then FMUL32(v13$1, v12$1) else $$xterm$0bv32$1);
    $$xterm$0bv32$2 := (if p4$2 then FMUL32(v13$2, v12$2) else $$xterm$0bv32$2);
    v14$1 := (if p4$1 then $$xterm$1bv32$1 else v14$1);
    v14$2 := (if p4$2 then $$xterm$1bv32$2 else v14$2);
    $$xterm$1bv32$1 := (if p4$1 then FMUL32(v14$1, v12$1) else $$xterm$1bv32$1);
    $$xterm$1bv32$2 := (if p4$2 then FMUL32(v14$2, v12$2) else $$xterm$1bv32$2);
    v15$1 := (if p4$1 then $$yterm$0bv32$1 else v15$1);
    v15$2 := (if p4$2 then $$yterm$0bv32$2 else v15$2);
    $$yterm$0bv32$1 := (if p4$1 then FMUL32(v15$1, v12$1) else $$yterm$0bv32$1);
    $$yterm$0bv32$2 := (if p4$2 then FMUL32(v15$2, v12$2) else $$yterm$0bv32$2);
    v16$1 := (if p4$1 then $$yterm$1bv32$1 else v16$1);
    v16$2 := (if p4$2 then $$yterm$1bv32$2 else v16$2);
    $$yterm$1bv32$1 := (if p4$1 then FMUL32(v16$1, v12$1) else $$yterm$1bv32$1);
    $$yterm$1bv32$2 := (if p4$2 then FMUL32(v16$2, v12$2) else $$yterm$1bv32$2);
    v17$1 := (if p4$1 then FLT32(0bv32, v11$1) else v17$1);
    v17$2 := (if p4$2 then FLT32(0bv32, v11$2) else v17$2);
    p8$1 := (if p4$1 && v17$1 then v17$1 else p8$1);
    p8$2 := (if p4$2 && v17$2 then v17$2 else p8$2);
    v18$1 := (if p8$1 then FDIV32(1065353216bv32, v11$1) else v18$1);
    v18$2 := (if p8$2 then FDIV32(1065353216bv32, v11$2) else v18$2);
    v19$1 := (if p8$1 then $$xterm$0bv32$1 else v19$1);
    v19$2 := (if p8$2 then $$xterm$0bv32$2 else v19$2);
    v20$1 := (if p8$1 then $$yterm$0bv32$1 else v20$1);
    v20$2 := (if p8$2 then $$yterm$0bv32$2 else v20$2);
    v21$1 := (if p8$1 then FADD32(FMUL32(SI32_TO_FP32(v0$1), v19$1), FMUL32(SI32_TO_FP32($0$1), v20$1)) else v21$1);
    v21$2 := (if p8$2 then FADD32(FMUL32(SI32_TO_FP32(v0$2), v19$2), FMUL32(SI32_TO_FP32($0$2), v20$2)) else v21$2);
    v22$1 := (if p8$1 then $$xterm$1bv32$1 else v22$1);
    v22$2 := (if p8$2 then $$xterm$1bv32$2 else v22$2);
    v23$1 := (if p8$1 then $$yterm$1bv32$1 else v23$1);
    v23$2 := (if p8$2 then $$yterm$1bv32$2 else v23$2);
    v24$1 := (if p8$1 then FADD32(FMUL32(SI32_TO_FP32(v0$1), v22$1), FMUL32(SI32_TO_FP32($0$1), v23$1)) else v24$1);
    v24$2 := (if p8$2 then FADD32(FMUL32(SI32_TO_FP32(v0$2), v22$2), FMUL32(SI32_TO_FP32($0$2), v23$2)) else v24$2);
    v25$1 := (if p8$1 then $$xterm$0bv32$1 else v25$1);
    v25$2 := (if p8$2 then $$xterm$0bv32$2 else v25$2);
    $$xterm$0bv32$1 := (if p8$1 then FSUB32(v25$1, FMUL32(FMUL32(v18$1, v21$1), SI32_TO_FP32(v0$1))) else $$xterm$0bv32$1);
    $$xterm$0bv32$2 := (if p8$2 then FSUB32(v25$2, FMUL32(FMUL32(v18$2, v21$2), SI32_TO_FP32(v0$2))) else $$xterm$0bv32$2);
    v26$1 := (if p8$1 then $$xterm$1bv32$1 else v26$1);
    v26$2 := (if p8$2 then $$xterm$1bv32$2 else v26$2);
    $$xterm$1bv32$1 := (if p8$1 then FSUB32(v26$1, FMUL32(FMUL32(v18$1, v24$1), SI32_TO_FP32(v0$1))) else $$xterm$1bv32$1);
    $$xterm$1bv32$2 := (if p8$2 then FSUB32(v26$2, FMUL32(FMUL32(v18$2, v24$2), SI32_TO_FP32(v0$2))) else $$xterm$1bv32$2);
    v27$1 := (if p8$1 then $$yterm$0bv32$1 else v27$1);
    v27$2 := (if p8$2 then $$yterm$0bv32$2 else v27$2);
    $$yterm$0bv32$1 := (if p8$1 then FSUB32(v27$1, FMUL32(FMUL32(v18$1, v21$1), SI32_TO_FP32($0$1))) else $$yterm$0bv32$1);
    $$yterm$0bv32$2 := (if p8$2 then FSUB32(v27$2, FMUL32(FMUL32(v18$2, v21$2), SI32_TO_FP32($0$2))) else $$yterm$0bv32$2);
    v28$1 := (if p8$1 then $$yterm$1bv32$1 else v28$1);
    v28$2 := (if p8$2 then $$yterm$1bv32$2 else v28$2);
    $$yterm$1bv32$1 := (if p8$1 then FSUB32(v28$1, FMUL32(FMUL32(v18$1, v24$1), SI32_TO_FP32($0$1))) else $$yterm$1bv32$1);
    $$yterm$1bv32$2 := (if p8$2 then FSUB32(v28$2, FMUL32(FMUL32(v18$2, v24$2), SI32_TO_FP32($0$2))) else $$yterm$1bv32$2);
    v29$1 := (if p4$1 then $$xterm$0bv32$1 else v29$1);
    v29$2 := (if p4$2 then $$xterm$0bv32$2 else v29$2);
    call {:sourceloc} {:sourceloc_num 42} _LOG_WRITE_$$vx(p4$1, BV32_MUL(v5$1, 2bv32), v29$1, $$vx[BV32_MUL(v5$1, 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$vx(p4$2, BV32_MUL(v5$2, 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 42} _CHECK_WRITE_$$vx(p4$2, BV32_MUL(v5$2, 2bv32), v29$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$vx"} true;
    $$vx[BV32_MUL(v5$1, 2bv32)] := (if p4$1 then v29$1 else $$vx[BV32_MUL(v5$1, 2bv32)]);
    $$vx[BV32_MUL(v5$2, 2bv32)] := (if p4$2 then v29$2 else $$vx[BV32_MUL(v5$2, 2bv32)]);
    v30$1 := (if p4$1 then $$xterm$1bv32$1 else v30$1);
    v30$2 := (if p4$2 then $$xterm$1bv32$2 else v30$2);
    call {:sourceloc} {:sourceloc_num 44} _LOG_WRITE_$$vx(p4$1, BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32), v30$1, $$vx[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$vx(p4$2, BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 44} _CHECK_WRITE_$$vx(p4$2, BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32), v30$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$vx"} true;
    $$vx[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)] := (if p4$1 then v30$1 else $$vx[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)]);
    $$vx[BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32)] := (if p4$2 then v30$2 else $$vx[BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32)]);
    v31$1 := (if p4$1 then $$yterm$0bv32$1 else v31$1);
    v31$2 := (if p4$2 then $$yterm$0bv32$2 else v31$2);
    call {:sourceloc} {:sourceloc_num 46} _LOG_WRITE_$$vy(p4$1, BV32_MUL(v5$1, 2bv32), v31$1, $$vy[BV32_MUL(v5$1, 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$vy(p4$2, BV32_MUL(v5$2, 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 46} _CHECK_WRITE_$$vy(p4$2, BV32_MUL(v5$2, 2bv32), v31$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$vy"} true;
    $$vy[BV32_MUL(v5$1, 2bv32)] := (if p4$1 then v31$1 else $$vy[BV32_MUL(v5$1, 2bv32)]);
    $$vy[BV32_MUL(v5$2, 2bv32)] := (if p4$2 then v31$2 else $$vy[BV32_MUL(v5$2, 2bv32)]);
    v32$1 := (if p4$1 then $$yterm$1bv32$1 else v32$1);
    v32$2 := (if p4$2 then $$yterm$1bv32$2 else v32$2);
    call {:sourceloc} {:sourceloc_num 48} _LOG_WRITE_$$vy(p4$1, BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32), v32$1, $$vy[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$vy(p4$2, BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 48} _CHECK_WRITE_$$vy(p4$2, BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32), v32$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$vy"} true;
    $$vy[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)] := (if p4$1 then v32$1 else $$vy[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)]);
    $$vy[BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32)] := (if p4$2 then v32$2 else $$vy[BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32)]);
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

axiom (if num_groups_x == 5bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$xterm$0bv32$1: bv32;

var $$xterm$0bv32$2: bv32;

var $$xterm$1bv32$1: bv32;

var $$xterm$1bv32$2: bv32;

var $$yterm$0bv32$1: bv32;

var $$yterm$0bv32$2: bv32;

var $$yterm$1bv32$1: bv32;

var $$yterm$1bv32$2: bv32;

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

const {:existential true} _b11: bool;

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

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

const {:existential true} _b12: bool;

const {:existential true} _b13: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

const {:existential true} _b17: bool;

const {:existential true} _b18: bool;

const {:existential true} _b19: bool;

const {:existential true} _b20: bool;

const {:existential true} _b21: bool;

const {:existential true} _b22: bool;

const {:existential true} _b23: bool;

const {:existential true} _b24: bool;

const {:existential true} _b25: bool;

const {:existential true} _b26: bool;

const {:existential true} _b27: bool;

const {:existential true} _b28: bool;

const {:existential true} _b29: bool;

const {:existential true} _b30: bool;

const {:existential true} _b31: bool;
