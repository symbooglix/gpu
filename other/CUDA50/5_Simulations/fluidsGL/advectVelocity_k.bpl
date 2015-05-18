type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



axiom {:array_info "$$v"} {:global} {:elem_width 32} {:source_name "v"} {:source_elem_width 64} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$v: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$v: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 64} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$v: bool;

var {:source_name "vx"} {:global} $$vx: [bv32]bv32;

axiom {:array_info "$$vx"} {:global} {:elem_width 32} {:source_name "vx"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$vx: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$vx: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$vx: bool;

var {:source_name "vy"} {:global} $$vy: [bv32]bv32;

axiom {:array_info "$$vy"} {:global} {:elem_width 32} {:source_name "vy"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$vy: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$vy: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$vy: bool;

axiom {:array_info "$$vterm"} {:elem_width 32} {:source_name "vterm"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$ploc"} {:elem_width 32} {:source_name "ploc"} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 8} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 32} {:source_name ""} {:source_elem_width 64} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 8} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$texref"} {:global} {:elem_width 8} {:source_name "texref"} {:source_elem_width 128} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$texref: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$texref: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$texref: bool;

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

function FSUB32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

procedure {:source_name "advectVelocity_k"} {:kernel} $_Z16advectVelocity_kP6float2PfS1_iiifi($dx: bv32, $pdx: bv32, $dy: bv32, $dt: bv32, $lb: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $dx == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $dy == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $lb == 16bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 3} {:thread 1} (if $pdx == 514bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$v && !_WRITE_HAS_OCCURRED_$$v && !_ATOMIC_HAS_OCCURRED_$$v;
  requires !_READ_HAS_OCCURRED_$$vx && !_WRITE_HAS_OCCURRED_$$vx && !_ATOMIC_HAS_OCCURRED_$$vx;
  requires !_READ_HAS_OCCURRED_$$vy && !_WRITE_HAS_OCCURRED_$$vy && !_ATOMIC_HAS_OCCURRED_$$vy;
  requires !_READ_HAS_OCCURRED_$$texref && !_WRITE_HAS_OCCURRED_$$texref && !_ATOMIC_HAS_OCCURRED_$$texref;
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
  modifies _WRITE_HAS_OCCURRED_$$vx, _WRITE_READ_BENIGN_FLAG_$$vx, _WRITE_READ_BENIGN_FLAG_$$vx, _WRITE_HAS_OCCURRED_$$vy, _WRITE_READ_BENIGN_FLAG_$$vy, _WRITE_READ_BENIGN_FLAG_$$vy;



implementation {:source_name "advectVelocity_k"} {:kernel} $_Z16advectVelocity_kP6float2PfS1_iiifi($dx: bv32, $pdx: bv32, $dy: bv32, $dt: bv32, $lb: bv32)
{
  var $p.0$1: bv32;
  var $p.0$2: bv32;
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
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v8$1: bv8;
  var v8$2: bv8;
  var v13$1: bv8;
  var v13$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;
  var v12$1: bv8;
  var v12$2: bv8;
  var v21$1: bv8;
  var v21$2: bv8;
  var v14$1: bv8;
  var v14$2: bv8;
  var v15$1: bv8;
  var v15$2: bv8;
  var v16$1: bv8;
  var v16$2: bv8;
  var v17$1: bv8;
  var v17$2: bv8;
  var v18$1: bv8;
  var v18$2: bv8;
  var v19$1: bv8;
  var v19$2: bv8;
  var v20$1: bv8;
  var v20$2: bv8;
  var v22$1: bv8;
  var v22$2: bv8;
  var v23$1: bv8;
  var v23$2: bv8;
  var v24$1: bv8;
  var v24$2: bv8;
  var v25$1: bv8;
  var v25$2: bv8;
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
  var v38$1: bv64;
  var v38$2: bv64;
  var v63$1: bv8;
  var v63$2: bv8;
  var v64$1: bv8;
  var v64$2: bv8;
  var v65$1: bv8;
  var v65$2: bv8;
  var v66$1: bv8;
  var v66$2: bv8;
  var v67$1: bv8;
  var v67$2: bv8;
  var v68$1: bv8;
  var v68$2: bv8;
  var v39$1: bv32;
  var v39$2: bv32;
  var v40$1: bv32;
  var v40$2: bv32;
  var v41$1: bv32;
  var v41$2: bv32;
  var v42$1: bv32;
  var v42$2: bv32;
  var v43$1: bv8;
  var v43$2: bv8;
  var v44$1: bv8;
  var v44$2: bv8;
  var v45$1: bv8;
  var v45$2: bv8;
  var v46$1: bv8;
  var v46$2: bv8;
  var v47$1: bv8;
  var v47$2: bv8;
  var v48$1: bv8;
  var v48$2: bv8;
  var v49$1: bv8;
  var v49$2: bv8;
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
  var v59$1: bv32;
  var v59$2: bv32;
  var v60$1: bv32;
  var v60$2: bv32;
  var v61$1: bv8;
  var v61$2: bv8;
  var v62$1: bv8;
  var v62$2: bv8;
  var v69$1: bv8;
  var v69$2: bv8;
  var v70$1: bv8;
  var v70$2: bv8;
  var v71$1: bv8;
  var v71$2: bv8;
  var v72$1: bv8;
  var v72$2: bv8;
  var v73$1: bv8;
  var v73$2: bv8;
  var v74$1: bv8;
  var v74$2: bv8;
  var v75$1: bv8;
  var v75$2: bv8;
  var v76$1: bv8;
  var v76$2: bv8;
  var v77$1: bv64;
  var v77$2: bv64;
  var v78$1: bv32;
  var v78$2: bv32;
  var v79$1: bv32;
  var v79$2: bv32;
  var v80$1: bv32;
  var v80$2: bv32;
  var v81$1: bv32;
  var v81$2: bv32;
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
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v6$1 := (if p4$1 then _HAVOC_bv8$1 else v6$1);
    v6$2 := (if p4$2 then _HAVOC_bv8$2 else v6$2);
    $$1$0bv32$1 := (if p4$1 then v6$1 else $$1$0bv32$1);
    $$1$0bv32$2 := (if p4$2 then v6$2 else $$1$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v7$1 := (if p4$1 then _HAVOC_bv8$1 else v7$1);
    v7$2 := (if p4$2 then _HAVOC_bv8$2 else v7$2);
    $$1$1bv32$1 := (if p4$1 then v7$1 else $$1$1bv32$1);
    $$1$1bv32$2 := (if p4$2 then v7$2 else $$1$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v8$1 := (if p4$1 then _HAVOC_bv8$1 else v8$1);
    v8$2 := (if p4$2 then _HAVOC_bv8$2 else v8$2);
    $$1$2bv32$1 := (if p4$1 then v8$1 else $$1$2bv32$1);
    $$1$2bv32$2 := (if p4$2 then v8$2 else $$1$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v9$1 := (if p4$1 then _HAVOC_bv8$1 else v9$1);
    v9$2 := (if p4$2 then _HAVOC_bv8$2 else v9$2);
    $$1$3bv32$1 := (if p4$1 then v9$1 else $$1$3bv32$1);
    $$1$3bv32$2 := (if p4$2 then v9$2 else $$1$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v10$1 := (if p4$1 then _HAVOC_bv8$1 else v10$1);
    v10$2 := (if p4$2 then _HAVOC_bv8$2 else v10$2);
    $$1$4bv32$1 := (if p4$1 then v10$1 else $$1$4bv32$1);
    $$1$4bv32$2 := (if p4$2 then v10$2 else $$1$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v11$1 := (if p4$1 then _HAVOC_bv8$1 else v11$1);
    v11$2 := (if p4$2 then _HAVOC_bv8$2 else v11$2);
    $$1$5bv32$1 := (if p4$1 then v11$1 else $$1$5bv32$1);
    $$1$5bv32$2 := (if p4$2 then v11$2 else $$1$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v12$1 := (if p4$1 then _HAVOC_bv8$1 else v12$1);
    v12$2 := (if p4$2 then _HAVOC_bv8$2 else v12$2);
    $$1$6bv32$1 := (if p4$1 then v12$1 else $$1$6bv32$1);
    $$1$6bv32$2 := (if p4$2 then v12$2 else $$1$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v13$1 := (if p4$1 then _HAVOC_bv8$1 else v13$1);
    v13$2 := (if p4$2 then _HAVOC_bv8$2 else v13$2);
    $$1$7bv32$1 := (if p4$1 then v13$1 else $$1$7bv32$1);
    $$1$7bv32$2 := (if p4$2 then v13$2 else $$1$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v14$1 := (if p4$1 then _HAVOC_bv8$1 else v14$1);
    v14$2 := (if p4$2 then _HAVOC_bv8$2 else v14$2);
    $$1$8bv32$1 := (if p4$1 then v14$1 else $$1$8bv32$1);
    $$1$8bv32$2 := (if p4$2 then v14$2 else $$1$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v15$1 := (if p4$1 then _HAVOC_bv8$1 else v15$1);
    v15$2 := (if p4$2 then _HAVOC_bv8$2 else v15$2);
    $$1$9bv32$1 := (if p4$1 then v15$1 else $$1$9bv32$1);
    $$1$9bv32$2 := (if p4$2 then v15$2 else $$1$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v16$1 := (if p4$1 then _HAVOC_bv8$1 else v16$1);
    v16$2 := (if p4$2 then _HAVOC_bv8$2 else v16$2);
    $$1$10bv32$1 := (if p4$1 then v16$1 else $$1$10bv32$1);
    $$1$10bv32$2 := (if p4$2 then v16$2 else $$1$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v17$1 := (if p4$1 then _HAVOC_bv8$1 else v17$1);
    v17$2 := (if p4$2 then _HAVOC_bv8$2 else v17$2);
    $$1$11bv32$1 := (if p4$1 then v17$1 else $$1$11bv32$1);
    $$1$11bv32$2 := (if p4$2 then v17$2 else $$1$11bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v18$1 := (if p4$1 then _HAVOC_bv8$1 else v18$1);
    v18$2 := (if p4$2 then _HAVOC_bv8$2 else v18$2);
    $$1$12bv32$1 := (if p4$1 then v18$1 else $$1$12bv32$1);
    $$1$12bv32$2 := (if p4$2 then v18$2 else $$1$12bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v19$1 := (if p4$1 then _HAVOC_bv8$1 else v19$1);
    v19$2 := (if p4$2 then _HAVOC_bv8$2 else v19$2);
    $$1$13bv32$1 := (if p4$1 then v19$1 else $$1$13bv32$1);
    $$1$13bv32$2 := (if p4$2 then v19$2 else $$1$13bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v20$1 := (if p4$1 then _HAVOC_bv8$1 else v20$1);
    v20$2 := (if p4$2 then _HAVOC_bv8$2 else v20$2);
    $$1$14bv32$1 := (if p4$1 then v20$1 else $$1$14bv32$1);
    $$1$14bv32$2 := (if p4$2 then v20$2 else $$1$14bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v21$1 := (if p4$1 then _HAVOC_bv8$1 else v21$1);
    v21$2 := (if p4$2 then _HAVOC_bv8$2 else v21$2);
    $$1$15bv32$1 := (if p4$1 then v21$1 else $$1$15bv32$1);
    $$1$15bv32$2 := (if p4$2 then v21$2 else $$1$15bv32$2);
    v22$1 := (if p4$1 then $$1$0bv32$1 else v22$1);
    v22$2 := (if p4$2 then $$1$0bv32$2 else v22$2);
    v23$1 := (if p4$1 then $$1$1bv32$1 else v23$1);
    v23$2 := (if p4$2 then $$1$1bv32$2 else v23$2);
    v24$1 := (if p4$1 then $$1$2bv32$1 else v24$1);
    v24$2 := (if p4$2 then $$1$2bv32$2 else v24$2);
    v25$1 := (if p4$1 then $$1$3bv32$1 else v25$1);
    v25$2 := (if p4$2 then $$1$3bv32$2 else v25$2);
    v26$1 := (if p4$1 then $$1$4bv32$1 else v26$1);
    v26$2 := (if p4$2 then $$1$4bv32$2 else v26$2);
    v27$1 := (if p4$1 then $$1$5bv32$1 else v27$1);
    v27$2 := (if p4$2 then $$1$5bv32$2 else v27$2);
    v28$1 := (if p4$1 then $$1$6bv32$1 else v28$1);
    v28$2 := (if p4$2 then $$1$6bv32$2 else v28$2);
    v29$1 := (if p4$1 then $$1$7bv32$1 else v29$1);
    v29$2 := (if p4$2 then $$1$7bv32$2 else v29$2);
    v30$1 := (if p4$1 then $$1$8bv32$1 else v30$1);
    v30$2 := (if p4$2 then $$1$8bv32$2 else v30$2);
    v31$1 := (if p4$1 then $$1$9bv32$1 else v31$1);
    v31$2 := (if p4$2 then $$1$9bv32$2 else v31$2);
    v32$1 := (if p4$1 then $$1$10bv32$1 else v32$1);
    v32$2 := (if p4$2 then $$1$10bv32$2 else v32$2);
    v33$1 := (if p4$1 then $$1$11bv32$1 else v33$1);
    v33$2 := (if p4$2 then $$1$11bv32$2 else v33$2);
    v34$1 := (if p4$1 then $$1$12bv32$1 else v34$1);
    v34$2 := (if p4$2 then $$1$12bv32$2 else v34$2);
    v35$1 := (if p4$1 then $$1$13bv32$1 else v35$1);
    v35$2 := (if p4$2 then $$1$13bv32$2 else v35$2);
    v36$1 := (if p4$1 then $$1$14bv32$1 else v36$1);
    v36$2 := (if p4$2 then $$1$14bv32$2 else v36$2);
    v37$1 := (if p4$1 then $$1$15bv32$1 else v37$1);
    v37$2 := (if p4$2 then $$1$15bv32$2 else v37$2);
    call {:sourceloc_num 57} v38$1, v38$2 := $_Z5tex2DI6float2ET_7textureIS1_Li2EL19cudaTextureReadMode0EEff(p4$1, v29$1 ++ v28$1 ++ v27$1 ++ v26$1 ++ v25$1 ++ v24$1 ++ v23$1 ++ v22$1, v33$1 ++ v32$1 ++ v31$1 ++ v30$1, v37$1 ++ v36$1 ++ v35$1 ++ v34$1, SI32_TO_FP32(v0$1), SI32_TO_FP32(v3$1), p4$2, v29$2 ++ v28$2 ++ v27$2 ++ v26$2 ++ v25$2 ++ v24$2 ++ v23$2 ++ v22$2, v33$2 ++ v32$2 ++ v31$2 ++ v30$2, v37$2 ++ v36$2 ++ v35$2 ++ v34$2, SI32_TO_FP32(v0$2), SI32_TO_FP32(v3$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DI6float2ET_7textureIS1_Li2EL19cudaTextureReadMode0EEff"} true;
    $$0$0bv32$1 := (if p4$1 then v38$1[32:0] else $$0$0bv32$1);
    $$0$0bv32$2 := (if p4$2 then v38$2[32:0] else $$0$0bv32$2);
    $$0$1bv32$1 := (if p4$1 then v38$1[64:32] else $$0$1bv32$1);
    $$0$1bv32$2 := (if p4$2 then v38$2[64:32] else $$0$1bv32$2);
    v39$1 := (if p4$1 then $$0$0bv32$1 else v39$1);
    v39$2 := (if p4$2 then $$0$0bv32$2 else v39$2);
    $$vterm$0bv32$1 := (if p4$1 then v39$1 else $$vterm$0bv32$1);
    $$vterm$0bv32$2 := (if p4$2 then v39$2 else $$vterm$0bv32$2);
    v40$1 := (if p4$1 then $$0$1bv32$1 else v40$1);
    v40$2 := (if p4$2 then $$0$1bv32$2 else v40$2);
    $$vterm$1bv32$1 := (if p4$1 then v40$1 else $$vterm$1bv32$1);
    $$vterm$1bv32$2 := (if p4$2 then v40$2 else $$vterm$1bv32$2);
    v41$1 := (if p4$1 then $$vterm$0bv32$1 else v41$1);
    v41$2 := (if p4$2 then $$vterm$0bv32$2 else v41$2);
    $$ploc$0bv32$1 := (if p4$1 then FSUB32(FADD32(SI32_TO_FP32(v0$1), 1056964608bv32), FMUL32(FMUL32($dt, v41$1), SI32_TO_FP32($dx))) else $$ploc$0bv32$1);
    $$ploc$0bv32$2 := (if p4$2 then FSUB32(FADD32(SI32_TO_FP32(v0$2), 1056964608bv32), FMUL32(FMUL32($dt, v41$2), SI32_TO_FP32($dx))) else $$ploc$0bv32$2);
    v42$1 := (if p4$1 then $$vterm$1bv32$1 else v42$1);
    v42$2 := (if p4$2 then $$vterm$1bv32$2 else v42$2);
    $$ploc$1bv32$1 := (if p4$1 then FSUB32(FADD32(SI32_TO_FP32(v3$1), 1056964608bv32), FMUL32(FMUL32($dt, v42$1), SI32_TO_FP32($dy))) else $$ploc$1bv32$1);
    $$ploc$1bv32$2 := (if p4$2 then FSUB32(FADD32(SI32_TO_FP32(v3$2), 1056964608bv32), FMUL32(FMUL32($dt, v42$2), SI32_TO_FP32($dy))) else $$ploc$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v43$1 := (if p4$1 then _HAVOC_bv8$1 else v43$1);
    v43$2 := (if p4$2 then _HAVOC_bv8$2 else v43$2);
    $$3$0bv32$1 := (if p4$1 then v43$1 else $$3$0bv32$1);
    $$3$0bv32$2 := (if p4$2 then v43$2 else $$3$0bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v44$1 := (if p4$1 then _HAVOC_bv8$1 else v44$1);
    v44$2 := (if p4$2 then _HAVOC_bv8$2 else v44$2);
    $$3$1bv32$1 := (if p4$1 then v44$1 else $$3$1bv32$1);
    $$3$1bv32$2 := (if p4$2 then v44$2 else $$3$1bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v45$1 := (if p4$1 then _HAVOC_bv8$1 else v45$1);
    v45$2 := (if p4$2 then _HAVOC_bv8$2 else v45$2);
    $$3$2bv32$1 := (if p4$1 then v45$1 else $$3$2bv32$1);
    $$3$2bv32$2 := (if p4$2 then v45$2 else $$3$2bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v46$1 := (if p4$1 then _HAVOC_bv8$1 else v46$1);
    v46$2 := (if p4$2 then _HAVOC_bv8$2 else v46$2);
    $$3$3bv32$1 := (if p4$1 then v46$1 else $$3$3bv32$1);
    $$3$3bv32$2 := (if p4$2 then v46$2 else $$3$3bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v47$1 := (if p4$1 then _HAVOC_bv8$1 else v47$1);
    v47$2 := (if p4$2 then _HAVOC_bv8$2 else v47$2);
    $$3$4bv32$1 := (if p4$1 then v47$1 else $$3$4bv32$1);
    $$3$4bv32$2 := (if p4$2 then v47$2 else $$3$4bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v48$1 := (if p4$1 then _HAVOC_bv8$1 else v48$1);
    v48$2 := (if p4$2 then _HAVOC_bv8$2 else v48$2);
    $$3$5bv32$1 := (if p4$1 then v48$1 else $$3$5bv32$1);
    $$3$5bv32$2 := (if p4$2 then v48$2 else $$3$5bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v49$1 := (if p4$1 then _HAVOC_bv8$1 else v49$1);
    v49$2 := (if p4$2 then _HAVOC_bv8$2 else v49$2);
    $$3$6bv32$1 := (if p4$1 then v49$1 else $$3$6bv32$1);
    $$3$6bv32$2 := (if p4$2 then v49$2 else $$3$6bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v50$1 := (if p4$1 then _HAVOC_bv8$1 else v50$1);
    v50$2 := (if p4$2 then _HAVOC_bv8$2 else v50$2);
    $$3$7bv32$1 := (if p4$1 then v50$1 else $$3$7bv32$1);
    $$3$7bv32$2 := (if p4$2 then v50$2 else $$3$7bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v51$1 := (if p4$1 then _HAVOC_bv8$1 else v51$1);
    v51$2 := (if p4$2 then _HAVOC_bv8$2 else v51$2);
    $$3$8bv32$1 := (if p4$1 then v51$1 else $$3$8bv32$1);
    $$3$8bv32$2 := (if p4$2 then v51$2 else $$3$8bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v52$1 := (if p4$1 then _HAVOC_bv8$1 else v52$1);
    v52$2 := (if p4$2 then _HAVOC_bv8$2 else v52$2);
    $$3$9bv32$1 := (if p4$1 then v52$1 else $$3$9bv32$1);
    $$3$9bv32$2 := (if p4$2 then v52$2 else $$3$9bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v53$1 := (if p4$1 then _HAVOC_bv8$1 else v53$1);
    v53$2 := (if p4$2 then _HAVOC_bv8$2 else v53$2);
    $$3$10bv32$1 := (if p4$1 then v53$1 else $$3$10bv32$1);
    $$3$10bv32$2 := (if p4$2 then v53$2 else $$3$10bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v54$1 := (if p4$1 then _HAVOC_bv8$1 else v54$1);
    v54$2 := (if p4$2 then _HAVOC_bv8$2 else v54$2);
    $$3$11bv32$1 := (if p4$1 then v54$1 else $$3$11bv32$1);
    $$3$11bv32$2 := (if p4$2 then v54$2 else $$3$11bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v55$1 := (if p4$1 then _HAVOC_bv8$1 else v55$1);
    v55$2 := (if p4$2 then _HAVOC_bv8$2 else v55$2);
    $$3$12bv32$1 := (if p4$1 then v55$1 else $$3$12bv32$1);
    $$3$12bv32$2 := (if p4$2 then v55$2 else $$3$12bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v56$1 := (if p4$1 then _HAVOC_bv8$1 else v56$1);
    v56$2 := (if p4$2 then _HAVOC_bv8$2 else v56$2);
    $$3$13bv32$1 := (if p4$1 then v56$1 else $$3$13bv32$1);
    $$3$13bv32$2 := (if p4$2 then v56$2 else $$3$13bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v57$1 := (if p4$1 then _HAVOC_bv8$1 else v57$1);
    v57$2 := (if p4$2 then _HAVOC_bv8$2 else v57$2);
    $$3$14bv32$1 := (if p4$1 then v57$1 else $$3$14bv32$1);
    $$3$14bv32$2 := (if p4$2 then v57$2 else $$3$14bv32$2);
    havoc _HAVOC_bv8$1, _HAVOC_bv8$2;
    v58$1 := (if p4$1 then _HAVOC_bv8$1 else v58$1);
    v58$2 := (if p4$2 then _HAVOC_bv8$2 else v58$2);
    $$3$15bv32$1 := (if p4$1 then v58$1 else $$3$15bv32$1);
    $$3$15bv32$2 := (if p4$2 then v58$2 else $$3$15bv32$2);
    v59$1 := (if p4$1 then $$ploc$0bv32$1 else v59$1);
    v59$2 := (if p4$2 then $$ploc$0bv32$2 else v59$2);
    v60$1 := (if p4$1 then $$ploc$1bv32$1 else v60$1);
    v60$2 := (if p4$2 then $$ploc$1bv32$2 else v60$2);
    v61$1 := (if p4$1 then $$3$0bv32$1 else v61$1);
    v61$2 := (if p4$2 then $$3$0bv32$2 else v61$2);
    v62$1 := (if p4$1 then $$3$1bv32$1 else v62$1);
    v62$2 := (if p4$2 then $$3$1bv32$2 else v62$2);
    v63$1 := (if p4$1 then $$3$2bv32$1 else v63$1);
    v63$2 := (if p4$2 then $$3$2bv32$2 else v63$2);
    v64$1 := (if p4$1 then $$3$3bv32$1 else v64$1);
    v64$2 := (if p4$2 then $$3$3bv32$2 else v64$2);
    v65$1 := (if p4$1 then $$3$4bv32$1 else v65$1);
    v65$2 := (if p4$2 then $$3$4bv32$2 else v65$2);
    v66$1 := (if p4$1 then $$3$5bv32$1 else v66$1);
    v66$2 := (if p4$2 then $$3$5bv32$2 else v66$2);
    v67$1 := (if p4$1 then $$3$6bv32$1 else v67$1);
    v67$2 := (if p4$2 then $$3$6bv32$2 else v67$2);
    v68$1 := (if p4$1 then $$3$7bv32$1 else v68$1);
    v68$2 := (if p4$2 then $$3$7bv32$2 else v68$2);
    v69$1 := (if p4$1 then $$3$8bv32$1 else v69$1);
    v69$2 := (if p4$2 then $$3$8bv32$2 else v69$2);
    v70$1 := (if p4$1 then $$3$9bv32$1 else v70$1);
    v70$2 := (if p4$2 then $$3$9bv32$2 else v70$2);
    v71$1 := (if p4$1 then $$3$10bv32$1 else v71$1);
    v71$2 := (if p4$2 then $$3$10bv32$2 else v71$2);
    v72$1 := (if p4$1 then $$3$11bv32$1 else v72$1);
    v72$2 := (if p4$2 then $$3$11bv32$2 else v72$2);
    v73$1 := (if p4$1 then $$3$12bv32$1 else v73$1);
    v73$2 := (if p4$2 then $$3$12bv32$2 else v73$2);
    v74$1 := (if p4$1 then $$3$13bv32$1 else v74$1);
    v74$2 := (if p4$2 then $$3$13bv32$2 else v74$2);
    v75$1 := (if p4$1 then $$3$14bv32$1 else v75$1);
    v75$2 := (if p4$2 then $$3$14bv32$2 else v75$2);
    v76$1 := (if p4$1 then $$3$15bv32$1 else v76$1);
    v76$2 := (if p4$2 then $$3$15bv32$2 else v76$2);
    call {:sourceloc_num 118} v77$1, v77$2 := $_Z5tex2DI6float2ET_7textureIS1_Li2EL19cudaTextureReadMode0EEff(p4$1, v68$1 ++ v67$1 ++ v66$1 ++ v65$1 ++ v64$1 ++ v63$1 ++ v62$1 ++ v61$1, v72$1 ++ v71$1 ++ v70$1 ++ v69$1, v76$1 ++ v75$1 ++ v74$1 ++ v73$1, v59$1, v60$1, p4$2, v68$2 ++ v67$2 ++ v66$2 ++ v65$2 ++ v64$2 ++ v63$2 ++ v62$2 ++ v61$2, v72$2 ++ v71$2 ++ v70$2 ++ v69$2, v76$2 ++ v75$2 ++ v74$2 ++ v73$2, v59$2, v60$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z5tex2DI6float2ET_7textureIS1_Li2EL19cudaTextureReadMode0EEff"} true;
    $$2$0bv32$1 := (if p4$1 then v77$1[32:0] else $$2$0bv32$1);
    $$2$0bv32$2 := (if p4$2 then v77$2[32:0] else $$2$0bv32$2);
    $$2$1bv32$1 := (if p4$1 then v77$1[64:32] else $$2$1bv32$1);
    $$2$1bv32$2 := (if p4$2 then v77$2[64:32] else $$2$1bv32$2);
    v78$1 := (if p4$1 then $$2$0bv32$1 else v78$1);
    v78$2 := (if p4$2 then $$2$0bv32$2 else v78$2);
    $$vterm$0bv32$1 := (if p4$1 then v78$1 else $$vterm$0bv32$1);
    $$vterm$0bv32$2 := (if p4$2 then v78$2 else $$vterm$0bv32$2);
    v79$1 := (if p4$1 then $$2$1bv32$1 else v79$1);
    v79$2 := (if p4$2 then $$2$1bv32$2 else v79$2);
    $$vterm$1bv32$1 := (if p4$1 then v79$1 else $$vterm$1bv32$1);
    $$vterm$1bv32$2 := (if p4$2 then v79$2 else $$vterm$1bv32$2);
    v80$1 := (if p4$1 then $$vterm$0bv32$1 else v80$1);
    v80$2 := (if p4$2 then $$vterm$0bv32$2 else v80$2);
    v81$1 := (if p4$1 then $$vterm$1bv32$1 else v81$1);
    v81$2 := (if p4$2 then $$vterm$1bv32$2 else v81$2);
    call {:sourceloc} {:sourceloc_num 127} _LOG_WRITE_$$vx(p4$1, v5$1, v80$1, $$vx[v5$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$vx(p4$2, v5$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 127} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 127} _CHECK_WRITE_$$vx(p4$2, v5$2, v80$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$vx"} true;
    $$vx[v5$1] := (if p4$1 then v80$1 else $$vx[v5$1]);
    $$vx[v5$2] := (if p4$2 then v80$2 else $$vx[v5$2]);
    call {:sourceloc} {:sourceloc_num 128} _LOG_WRITE_$$vy(p4$1, v5$1, v81$1, $$vy[v5$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$vy(p4$2, v5$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 128} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 128} _CHECK_WRITE_$$vy(p4$2, v5$2, v81$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$vy"} true;
    $$vy[v5$1] := (if p4$1 then v81$1 else $$vy[v5$1]);
    $$vy[v5$2] := (if p4$2 then v81$2 else $$vy[v5$2]);
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



procedure {:source_name "_Z5tex2DI6float2ET_7textureIS1_Li2EL19cudaTextureReadMode0EEff"} $_Z5tex2DI6float2ET_7textureIS1_Li2EL19cudaTextureReadMode0EEff(_P$1: bool, $0$1: bv64, $1$1: bv32, $2$1: bv32, $3$1: bv32, $4$1: bv32, _P$2: bool, $0$2: bv64, $1$2: bv32, $2$2: bv32, $3$2: bv32, $4$2: bv32) returns ($ret$1: bv64, $ret$2: bv64);



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

var $$vterm$0bv32$1: bv32;

var $$vterm$0bv32$2: bv32;

var $$vterm$1bv32$1: bv32;

var $$vterm$1bv32$2: bv32;

var $$ploc$0bv32$1: bv32;

var $$ploc$0bv32$2: bv32;

var $$ploc$1bv32$1: bv32;

var $$ploc$1bv32$2: bv32;

var $$0$0bv32$1: bv32;

var $$0$0bv32$2: bv32;

var $$0$1bv32$1: bv32;

var $$0$1bv32$2: bv32;

var $$1$0bv32$1: bv8;

var $$1$0bv32$2: bv8;

var $$1$1bv32$1: bv8;

var $$1$1bv32$2: bv8;

var $$1$2bv32$1: bv8;

var $$1$2bv32$2: bv8;

var $$1$3bv32$1: bv8;

var $$1$3bv32$2: bv8;

var $$1$4bv32$1: bv8;

var $$1$4bv32$2: bv8;

var $$1$5bv32$1: bv8;

var $$1$5bv32$2: bv8;

var $$1$6bv32$1: bv8;

var $$1$6bv32$2: bv8;

var $$1$7bv32$1: bv8;

var $$1$7bv32$2: bv8;

var $$1$8bv32$1: bv8;

var $$1$8bv32$2: bv8;

var $$1$9bv32$1: bv8;

var $$1$9bv32$2: bv8;

var $$1$10bv32$1: bv8;

var $$1$10bv32$2: bv8;

var $$1$11bv32$1: bv8;

var $$1$11bv32$2: bv8;

var $$1$12bv32$1: bv8;

var $$1$12bv32$2: bv8;

var $$1$13bv32$1: bv8;

var $$1$13bv32$2: bv8;

var $$1$14bv32$1: bv8;

var $$1$14bv32$2: bv8;

var $$1$15bv32$1: bv8;

var $$1$15bv32$2: bv8;

var $$2$0bv32$1: bv32;

var $$2$0bv32$2: bv32;

var $$2$1bv32$1: bv32;

var $$2$1bv32$2: bv32;

var $$3$0bv32$1: bv8;

var $$3$0bv32$2: bv8;

var $$3$1bv32$1: bv8;

var $$3$1bv32$2: bv8;

var $$3$2bv32$1: bv8;

var $$3$2bv32$2: bv8;

var $$3$3bv32$1: bv8;

var $$3$3bv32$2: bv8;

var $$3$4bv32$1: bv8;

var $$3$4bv32$2: bv8;

var $$3$5bv32$1: bv8;

var $$3$5bv32$2: bv8;

var $$3$6bv32$1: bv8;

var $$3$6bv32$2: bv8;

var $$3$7bv32$1: bv8;

var $$3$7bv32$2: bv8;

var $$3$8bv32$1: bv8;

var $$3$8bv32$2: bv8;

var $$3$9bv32$1: bv8;

var $$3$9bv32$2: bv8;

var $$3$10bv32$1: bv8;

var $$3$10bv32$2: bv8;

var $$3$11bv32$1: bv8;

var $$3$11bv32$2: bv8;

var $$3$12bv32$1: bv8;

var $$3$12bv32$2: bv8;

var $$3$13bv32$1: bv8;

var $$3$13bv32$2: bv8;

var $$3$14bv32$1: bv8;

var $$3$14bv32$2: bv8;

var $$3$15bv32$1: bv8;

var $$3$15bv32$2: bv8;

const _WATCHED_VALUE_$$v: bv32;

procedure {:inline 1} _LOG_READ_$$v(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$v;



implementation {:inline 1} _LOG_READ_$$v(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v == _value then true else _READ_HAS_OCCURRED_$$v);
    return;
}



procedure _CHECK_READ_$$v(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "v"} {:array "$$v"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$v);
  requires {:source_name "v"} {:array "$$v"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$v && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$v: bool;

procedure {:inline 1} _LOG_WRITE_$$v(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$v, _WRITE_READ_BENIGN_FLAG_$$v;



implementation {:inline 1} _LOG_WRITE_$$v(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v == _value then true else _WRITE_HAS_OCCURRED_$$v);
    _WRITE_READ_BENIGN_FLAG_$$v := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$v == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$v);
    return;
}



procedure _CHECK_WRITE_$$v(_P: bool, _offset: bv32, _value: bv32);
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



const _WATCHED_VALUE_$$texref: bv8;

procedure {:inline 1} _LOG_READ_$$texref(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$texref;



implementation {:inline 1} _LOG_READ_$$texref(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$texref := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texref == _value then true else _READ_HAS_OCCURRED_$$texref);
    return;
}



procedure _CHECK_READ_$$texref(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "texref"} {:array "$$texref"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$texref && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$texref);
  requires {:source_name "texref"} {:array "$$texref"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$texref && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$texref: bool;

procedure {:inline 1} _LOG_WRITE_$$texref(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$texref, _WRITE_READ_BENIGN_FLAG_$$texref;



implementation {:inline 1} _LOG_WRITE_$$texref(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$texref := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texref == _value then true else _WRITE_HAS_OCCURRED_$$texref);
    _WRITE_READ_BENIGN_FLAG_$$texref := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texref == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$texref);
    return;
}



procedure _CHECK_WRITE_$$texref(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "texref"} {:array "$$texref"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$texref && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texref != _value);
  requires {:source_name "texref"} {:array "$$texref"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$texref && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$texref != _value);
  requires {:source_name "texref"} {:array "$$texref"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$texref && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$texref(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$texref;



implementation {:inline 1} _LOG_ATOMIC_$$texref(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$texref := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$texref);
    return;
}



procedure _CHECK_ATOMIC_$$texref(_P: bool, _offset: bv32);
  requires {:source_name "texref"} {:array "$$texref"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$texref && _WATCHED_OFFSET == _offset);
  requires {:source_name "texref"} {:array "$$texref"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$texref && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$texref(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$texref;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$texref(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$texref := (if _P && _WRITE_HAS_OCCURRED_$$texref && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$texref);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
