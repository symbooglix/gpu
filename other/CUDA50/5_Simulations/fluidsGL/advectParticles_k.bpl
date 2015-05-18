type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "part"} {:global} $$part: [bv32]bv32;

axiom {:array_info "$$part"} {:global} {:elem_width 32} {:source_name "part"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$part: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$part: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$part: bool;

axiom {:array_info "$$v"} {:global} {:elem_width 8} {:source_name "v"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$v: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$v: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$v: bool;

axiom {:array_info "$$pterm"} {:elem_width 32} {:source_name "pterm"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$vterm"} {:elem_width 8} {:source_name "vterm"} {:source_elem_width 64} {:source_dimensions "1"} true;

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

function FMUL32(bv32, bv32) : bv32;

function FP32_TO_SI32(bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "advectParticles_k"} {:kernel} $_Z17advectParticles_kP6float2S0_iifij($dx: bv32, $dy: bv32, $dt: bv32, $lb: bv32, $pitch: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $dx == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $dy == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $lb == 16bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$part && !_WRITE_HAS_OCCURRED_$$part && !_ATOMIC_HAS_OCCURRED_$$part;
  requires !_READ_HAS_OCCURRED_$$v && !_WRITE_HAS_OCCURRED_$$v && !_ATOMIC_HAS_OCCURRED_$$v;
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
  modifies _READ_HAS_OCCURRED_$$part, _WRITE_HAS_OCCURRED_$$part, _WRITE_READ_BENIGN_FLAG_$$part, _WRITE_READ_BENIGN_FLAG_$$part;



implementation {:source_name "advectParticles_k"} {:kernel} $_Z17advectParticles_kP6float2S0_iifij($dx: bv32, $dy: bv32, $dt: bv32, $lb: bv32, $pitch: bv32)
{
  var $p.0$1: bv32;
  var $p.0$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v24$1: bv32;
  var v24$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bool;
  var v4$2: bool;
  var v0$1: bv32;
  var v0$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v23$1: bv32;
  var v23$2: bv32;
  var v20$1: bv8;
  var v20$2: bv8;
  var v21$1: bv8;
  var v21$2: bv8;
  var v22$1: bv32;
  var v22$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v16$1: bv8;
  var v16$2: bv8;
  var v25$1: bv32;
  var v25$2: bv32;
  var v26$1: bv32;
  var v26$2: bv32;
  var v27$1: bv32;
  var v27$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
  var v8$1: bv32;
  var v8$2: bv32;
  var v15$1: bv8;
  var v15$2: bv8;
  var v17$1: bv8;
  var v17$2: bv8;
  var v18$1: bv8;
  var v18$2: bv8;
  var v19$1: bv8;
  var v19$2: bv8;
  var v35$1: bv32;
  var v35$2: bv32;
  var v28$1: bv8;
  var v28$2: bv8;
  var v29$1: bv8;
  var v29$2: bv8;
  var v30$1: bv8;
  var v30$2: bv8;
  var v31$1: bv8;
  var v31$2: bv8;
  var v36$1: bv32;
  var v36$2: bv32;
  var v37$1: bv32;
  var v37$2: bv32;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v32$1: bv32;
  var v32$2: bv32;
  var v33$1: bv32;
  var v33$2: bv32;
  var v34$1: bv32;
  var v34$2: bv32;
  var v38$1: bv32;
  var v38$2: bv32;
  var v39$1: bv32;
  var v39$2: bv32;
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
    assert {:block_sourceloc} {:sourceloc_num 5} p1$1 ==> true;
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
    v5$1 := (if p4$1 then BV32_ADD(BV32_MUL(v3$1, $dx), v0$1) else v5$1);
    v5$2 := (if p4$2 then BV32_ADD(BV32_MUL(v3$2, $dx), v0$2) else v5$2);
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$part(p4$1, BV32_MUL(v5$1, 2bv32), $$part[BV32_MUL(v5$1, 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$part(p4$2, BV32_MUL(v5$2, 2bv32), $$part[BV32_MUL(v5$2, 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$part"} true;
    v6$1 := (if p4$1 then $$part[BV32_MUL(v5$1, 2bv32)] else v6$1);
    v6$2 := (if p4$2 then $$part[BV32_MUL(v5$2, 2bv32)] else v6$2);
    $$pterm$0bv32$1 := (if p4$1 then v6$1 else $$pterm$0bv32$1);
    $$pterm$0bv32$2 := (if p4$2 then v6$2 else $$pterm$0bv32$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$part(p4$1, BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32), $$part[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$part(p4$2, BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32), $$part[BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$part"} true;
    v7$1 := (if p4$1 then $$part[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)] else v7$1);
    v7$2 := (if p4$2 then $$part[BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32)] else v7$2);
    $$pterm$1bv32$1 := (if p4$1 then v7$1 else $$pterm$1bv32$1);
    $$pterm$1bv32$2 := (if p4$2 then v7$2 else $$pterm$1bv32$2);
    v8$1 := (if p4$1 then $$pterm$0bv32$1 else v8$1);
    v8$2 := (if p4$2 then $$pterm$0bv32$2 else v8$2);
    v9$1 := (if p4$1 then $$pterm$1bv32$1 else v9$1);
    v9$2 := (if p4$2 then $$pterm$1bv32$2 else v9$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v10$1 := (if p4$1 then _HAVOC_bv8$1 else v10$1);
    v10$2 := (if p4$2 then _HAVOC_bv8$2 else v10$2);
    $$vterm$0bv32$1 := (if p4$1 then v10$1 else $$vterm$0bv32$1);
    $$vterm$0bv32$2 := (if p4$2 then v10$2 else $$vterm$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v11$1 := (if p4$1 then _HAVOC_bv8$1 else v11$1);
    v11$2 := (if p4$2 then _HAVOC_bv8$2 else v11$2);
    $$vterm$1bv32$1 := (if p4$1 then v11$1 else $$vterm$1bv32$1);
    $$vterm$1bv32$2 := (if p4$2 then v11$2 else $$vterm$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v12$1 := (if p4$1 then _HAVOC_bv8$1 else v12$1);
    v12$2 := (if p4$2 then _HAVOC_bv8$2 else v12$2);
    $$vterm$2bv32$1 := (if p4$1 then v12$1 else $$vterm$2bv32$1);
    $$vterm$2bv32$2 := (if p4$2 then v12$2 else $$vterm$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v13$1 := (if p4$1 then _HAVOC_bv8$1 else v13$1);
    v13$2 := (if p4$2 then _HAVOC_bv8$2 else v13$2);
    $$vterm$3bv32$1 := (if p4$1 then v13$1 else $$vterm$3bv32$1);
    $$vterm$3bv32$2 := (if p4$2 then v13$2 else $$vterm$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v14$1 := (if p4$1 then _HAVOC_bv8$1 else v14$1);
    v14$2 := (if p4$2 then _HAVOC_bv8$2 else v14$2);
    $$vterm$4bv32$1 := (if p4$1 then v14$1 else $$vterm$4bv32$1);
    $$vterm$4bv32$2 := (if p4$2 then v14$2 else $$vterm$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v15$1 := (if p4$1 then _HAVOC_bv8$1 else v15$1);
    v15$2 := (if p4$2 then _HAVOC_bv8$2 else v15$2);
    $$vterm$5bv32$1 := (if p4$1 then v15$1 else $$vterm$5bv32$1);
    $$vterm$5bv32$2 := (if p4$2 then v15$2 else $$vterm$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v16$1 := (if p4$1 then _HAVOC_bv8$1 else v16$1);
    v16$2 := (if p4$2 then _HAVOC_bv8$2 else v16$2);
    $$vterm$6bv32$1 := (if p4$1 then v16$1 else $$vterm$6bv32$1);
    $$vterm$6bv32$2 := (if p4$2 then v16$2 else $$vterm$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v17$1 := (if p4$1 then _HAVOC_bv8$1 else v17$1);
    v17$2 := (if p4$2 then _HAVOC_bv8$2 else v17$2);
    $$vterm$7bv32$1 := (if p4$1 then v17$1 else $$vterm$7bv32$1);
    $$vterm$7bv32$2 := (if p4$2 then v17$2 else $$vterm$7bv32$2);
    v18$1 := (if p4$1 then $$vterm$0bv32$1 else v18$1);
    v18$2 := (if p4$2 then $$vterm$0bv32$2 else v18$2);
    v19$1 := (if p4$1 then $$vterm$1bv32$1 else v19$1);
    v19$2 := (if p4$2 then $$vterm$1bv32$2 else v19$2);
    v20$1 := (if p4$1 then $$vterm$2bv32$1 else v20$1);
    v20$2 := (if p4$2 then $$vterm$2bv32$2 else v20$2);
    v21$1 := (if p4$1 then $$vterm$3bv32$1 else v21$1);
    v21$2 := (if p4$2 then $$vterm$3bv32$2 else v21$2);
    v22$1 := (if p4$1 then $$pterm$0bv32$1 else v22$1);
    v22$2 := (if p4$2 then $$pterm$0bv32$2 else v22$2);
    $$pterm$0bv32$1 := (if p4$1 then FADD32(v22$1, FMUL32($dt, v21$1 ++ v20$1 ++ v19$1 ++ v18$1)) else $$pterm$0bv32$1);
    $$pterm$0bv32$2 := (if p4$2 then FADD32(v22$2, FMUL32($dt, v21$2 ++ v20$2 ++ v19$2 ++ v18$2)) else $$pterm$0bv32$2);
    v23$1 := (if p4$1 then $$pterm$0bv32$1 else v23$1);
    v23$2 := (if p4$2 then $$pterm$0bv32$2 else v23$2);
    v24$1 := (if p4$1 then $$pterm$0bv32$1 else v24$1);
    v24$2 := (if p4$2 then $$pterm$0bv32$2 else v24$2);
    $$pterm$0bv32$1 := (if p4$1 then FSUB32(v23$1, SI32_TO_FP32(FP32_TO_SI32(v24$1))) else $$pterm$0bv32$1);
    $$pterm$0bv32$2 := (if p4$2 then FSUB32(v23$2, SI32_TO_FP32(FP32_TO_SI32(v24$2))) else $$pterm$0bv32$2);
    v25$1 := (if p4$1 then $$pterm$0bv32$1 else v25$1);
    v25$2 := (if p4$2 then $$pterm$0bv32$2 else v25$2);
    $$pterm$0bv32$1 := (if p4$1 then FADD32(v25$1, 1065353216bv32) else $$pterm$0bv32$1);
    $$pterm$0bv32$2 := (if p4$2 then FADD32(v25$2, 1065353216bv32) else $$pterm$0bv32$2);
    v26$1 := (if p4$1 then $$pterm$0bv32$1 else v26$1);
    v26$2 := (if p4$2 then $$pterm$0bv32$2 else v26$2);
    v27$1 := (if p4$1 then $$pterm$0bv32$1 else v27$1);
    v27$2 := (if p4$2 then $$pterm$0bv32$2 else v27$2);
    $$pterm$0bv32$1 := (if p4$1 then FSUB32(v26$1, SI32_TO_FP32(FP32_TO_SI32(v27$1))) else $$pterm$0bv32$1);
    $$pterm$0bv32$2 := (if p4$2 then FSUB32(v26$2, SI32_TO_FP32(FP32_TO_SI32(v27$2))) else $$pterm$0bv32$2);
    v28$1 := (if p4$1 then $$vterm$4bv32$1 else v28$1);
    v28$2 := (if p4$2 then $$vterm$4bv32$2 else v28$2);
    v29$1 := (if p4$1 then $$vterm$5bv32$1 else v29$1);
    v29$2 := (if p4$2 then $$vterm$5bv32$2 else v29$2);
    v30$1 := (if p4$1 then $$vterm$6bv32$1 else v30$1);
    v30$2 := (if p4$2 then $$vterm$6bv32$2 else v30$2);
    v31$1 := (if p4$1 then $$vterm$7bv32$1 else v31$1);
    v31$2 := (if p4$2 then $$vterm$7bv32$2 else v31$2);
    v32$1 := (if p4$1 then $$pterm$1bv32$1 else v32$1);
    v32$2 := (if p4$2 then $$pterm$1bv32$2 else v32$2);
    $$pterm$1bv32$1 := (if p4$1 then FADD32(v32$1, FMUL32($dt, v31$1 ++ v30$1 ++ v29$1 ++ v28$1)) else $$pterm$1bv32$1);
    $$pterm$1bv32$2 := (if p4$2 then FADD32(v32$2, FMUL32($dt, v31$2 ++ v30$2 ++ v29$2 ++ v28$2)) else $$pterm$1bv32$2);
    v33$1 := (if p4$1 then $$pterm$1bv32$1 else v33$1);
    v33$2 := (if p4$2 then $$pterm$1bv32$2 else v33$2);
    v34$1 := (if p4$1 then $$pterm$1bv32$1 else v34$1);
    v34$2 := (if p4$2 then $$pterm$1bv32$2 else v34$2);
    $$pterm$1bv32$1 := (if p4$1 then FSUB32(v33$1, SI32_TO_FP32(FP32_TO_SI32(v34$1))) else $$pterm$1bv32$1);
    $$pterm$1bv32$2 := (if p4$2 then FSUB32(v33$2, SI32_TO_FP32(FP32_TO_SI32(v34$2))) else $$pterm$1bv32$2);
    v35$1 := (if p4$1 then $$pterm$1bv32$1 else v35$1);
    v35$2 := (if p4$2 then $$pterm$1bv32$2 else v35$2);
    $$pterm$1bv32$1 := (if p4$1 then FADD32(v35$1, 1065353216bv32) else $$pterm$1bv32$1);
    $$pterm$1bv32$2 := (if p4$2 then FADD32(v35$2, 1065353216bv32) else $$pterm$1bv32$2);
    v36$1 := (if p4$1 then $$pterm$1bv32$1 else v36$1);
    v36$2 := (if p4$2 then $$pterm$1bv32$2 else v36$2);
    v37$1 := (if p4$1 then $$pterm$1bv32$1 else v37$1);
    v37$2 := (if p4$2 then $$pterm$1bv32$2 else v37$2);
    $$pterm$1bv32$1 := (if p4$1 then FSUB32(v36$1, SI32_TO_FP32(FP32_TO_SI32(v37$1))) else $$pterm$1bv32$1);
    $$pterm$1bv32$2 := (if p4$2 then FSUB32(v36$2, SI32_TO_FP32(FP32_TO_SI32(v37$2))) else $$pterm$1bv32$2);
    v38$1 := (if p4$1 then $$pterm$0bv32$1 else v38$1);
    v38$2 := (if p4$2 then $$pterm$0bv32$2 else v38$2);
    call {:sourceloc} {:sourceloc_num 59} _LOG_WRITE_$$part(p4$1, BV32_MUL(v5$1, 2bv32), v38$1, $$part[BV32_MUL(v5$1, 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$part(p4$2, BV32_MUL(v5$2, 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 59} _CHECK_WRITE_$$part(p4$2, BV32_MUL(v5$2, 2bv32), v38$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$part"} true;
    $$part[BV32_MUL(v5$1, 2bv32)] := (if p4$1 then v38$1 else $$part[BV32_MUL(v5$1, 2bv32)]);
    $$part[BV32_MUL(v5$2, 2bv32)] := (if p4$2 then v38$2 else $$part[BV32_MUL(v5$2, 2bv32)]);
    v39$1 := (if p4$1 then $$pterm$1bv32$1 else v39$1);
    v39$2 := (if p4$2 then $$pterm$1bv32$2 else v39$2);
    call {:sourceloc} {:sourceloc_num 61} _LOG_WRITE_$$part(p4$1, BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32), v39$1, $$part[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$part(p4$2, BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 61} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 61} _CHECK_WRITE_$$part(p4$2, BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32), v39$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$part"} true;
    $$part[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)] := (if p4$1 then v39$1 else $$part[BV32_ADD(BV32_MUL(v5$1, 2bv32), 1bv32)]);
    $$part[BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32)] := (if p4$2 then v39$2 else $$part[BV32_ADD(BV32_MUL(v5$2, 2bv32), 1bv32)]);
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



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 8bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$pterm$0bv32$1: bv32;

var $$pterm$0bv32$2: bv32;

var $$pterm$1bv32$1: bv32;

var $$pterm$1bv32$2: bv32;

var $$vterm$0bv32$1: bv8;

var $$vterm$0bv32$2: bv8;

var $$vterm$1bv32$1: bv8;

var $$vterm$1bv32$2: bv8;

var $$vterm$2bv32$1: bv8;

var $$vterm$2bv32$2: bv8;

var $$vterm$3bv32$1: bv8;

var $$vterm$3bv32$2: bv8;

var $$vterm$4bv32$1: bv8;

var $$vterm$4bv32$2: bv8;

var $$vterm$5bv32$1: bv8;

var $$vterm$5bv32$2: bv8;

var $$vterm$6bv32$1: bv8;

var $$vterm$6bv32$2: bv8;

var $$vterm$7bv32$1: bv8;

var $$vterm$7bv32$2: bv8;

const _WATCHED_VALUE_$$part: bv32;

procedure {:inline 1} _LOG_READ_$$part(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$part;



implementation {:inline 1} _LOG_READ_$$part(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$part := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$part == _value then true else _READ_HAS_OCCURRED_$$part);
    return;
}



procedure _CHECK_READ_$$part(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "part"} {:array "$$part"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$part && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$part);
  requires {:source_name "part"} {:array "$$part"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$part && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$part: bool;

procedure {:inline 1} _LOG_WRITE_$$part(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$part, _WRITE_READ_BENIGN_FLAG_$$part;



implementation {:inline 1} _LOG_WRITE_$$part(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$part := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$part == _value then true else _WRITE_HAS_OCCURRED_$$part);
    _WRITE_READ_BENIGN_FLAG_$$part := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$part == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$part);
    return;
}



procedure _CHECK_WRITE_$$part(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "part"} {:array "$$part"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$part && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$part != _value);
  requires {:source_name "part"} {:array "$$part"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$part && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$part != _value);
  requires {:source_name "part"} {:array "$$part"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$part && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$part(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$part;



implementation {:inline 1} _LOG_ATOMIC_$$part(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$part := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$part);
    return;
}



procedure _CHECK_ATOMIC_$$part(_P: bool, _offset: bv32);
  requires {:source_name "part"} {:array "$$part"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$part && _WATCHED_OFFSET == _offset);
  requires {:source_name "part"} {:array "$$part"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$part && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$part(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$part;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$part(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$part := (if _P && _WRITE_HAS_OCCURRED_$$part && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$part);
    return;
}



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



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
