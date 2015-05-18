type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "newPos"} {:global} $$newPos: [bv32]bv32;

axiom {:array_info "$$newPos"} {:global} {:elem_width 32} {:source_name "newPos"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$newPos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$newPos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$newPos: bool;

axiom {:array_info "$$oldPos"} {:global} {:elem_width 32} {:source_name "oldPos"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$oldPos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$oldPos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$oldPos: bool;

var {:source_name "vel"} {:global} $$vel: [bv32]bv32;

axiom {:array_info "$$vel"} {:global} {:elem_width 32} {:source_name "vel"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$vel: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$vel: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$vel: bool;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$ai.i.i.i"} {:elem_width 32} {:source_name "ai.i.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$bi.i.i.i"} {:elem_width 32} {:source_name "bi.i.i.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$bj.i.i.i"} {:elem_width 32} {:source_name "bj.i.i.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$r.i.i.i"} {:elem_width 32} {:source_name "r.i.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$iPos.i.i"} {:elem_width 32} {:source_name "iPos.i.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$accel.i.i"} {:elem_width 32} {:source_name "accel.i.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$bodyPos.i"} {:elem_width 32} {:source_name "bodyPos.i"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$8"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$9"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$position"} {:elem_width 32} {:source_name "position"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$accel"} {:elem_width 32} {:source_name "accel"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$10"} {:elem_width 32} {:source_name ""} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$velocity"} {:elem_width 32} {:source_name "velocity"} {:source_elem_width 128} {:source_dimensions "1"} true;

var {:source_name "__smem"} {:group_shared} $$__smem: [bv1][bv32]bv32;

axiom {:array_info "$$__smem"} {:group_shared} {:elem_width 32} {:source_name "__smem"} {:source_elem_width 32} {:source_dimensions "0"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$__smem: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$__smem: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$__smem: bool;

var {:source_name "softeningSquared"} {:constant} $$softeningSquared$1: [bv32]bv32;

var {:source_name "softeningSquared"} {:constant} $$softeningSquared$2: [bv32]bv32;

axiom {:array_info "$$softeningSquared"} {:constant} {:elem_width 32} {:source_name "softeningSquared"} {:source_elem_width 32} {:source_dimensions "1"} true;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV64_ADD(bv64, bv64) : bv64;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsdiv"} BV32_SDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 32"} BV32_ZEXT64(bv32) : bv64;

procedure {:source_name "integrateBodies<float, false>"} {:kernel} $_Z15integrateBodiesIfLb0EEvPN4vec4IT_E4TypeES4_S4_jjffi($deviceOffset: bv32, $deviceNumBodies: bv32, $deltaTime: bv32, $damping: bv32, $totalNumBodies: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $deviceNumBodies == 13824bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$newPos && !_WRITE_HAS_OCCURRED_$$newPos && !_ATOMIC_HAS_OCCURRED_$$newPos;
  requires !_READ_HAS_OCCURRED_$$oldPos && !_WRITE_HAS_OCCURRED_$$oldPos && !_ATOMIC_HAS_OCCURRED_$$oldPos;
  requires !_READ_HAS_OCCURRED_$$vel && !_WRITE_HAS_OCCURRED_$$vel && !_ATOMIC_HAS_OCCURRED_$$vel;
  requires !_READ_HAS_OCCURRED_$$__smem && !_WRITE_HAS_OCCURRED_$$__smem && !_ATOMIC_HAS_OCCURRED_$$__smem;
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
  modifies $$__smem, _WRITE_HAS_OCCURRED_$$__smem, _WRITE_READ_BENIGN_FLAG_$$__smem, _WRITE_READ_BENIGN_FLAG_$$__smem, $$newPos, $$vel, _TRACKING, _READ_HAS_OCCURRED_$$__smem, _TRACKING, _READ_HAS_OCCURRED_$$vel, _WRITE_HAS_OCCURRED_$$newPos, _WRITE_READ_BENIGN_FLAG_$$newPos, _WRITE_READ_BENIGN_FLAG_$$newPos, _WRITE_HAS_OCCURRED_$$vel, _WRITE_READ_BENIGN_FLAG_$$vel, _WRITE_READ_BENIGN_FLAG_$$vel;



implementation {:source_name "integrateBodies<float, false>"} {:kernel} $_Z15integrateBodiesIfLb0EEvPN4vec4IT_E4TypeES4_S4_jjffi($deviceOffset: bv32, $deviceNumBodies: bv32, $deltaTime: bv32, $damping: bv32, $totalNumBodies: bv32)
{
  var $tile.i.0$1: bv32;
  var $tile.i.0$2: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var $j.i.i.0$1: bv64;
  var $j.i.i.0$2: bv64;
  var $counter.i.i.0$1: bv32;
  var $counter.i.i.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bool;
  var v1$2: bool;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v9$1: bv32;
  var v9$2: bv32;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;
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
  var v14$1: bool;
  var v14$2: bool;
  var v15$1: bool;
  var v15$2: bool;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bv32;
  var v17$2: bv32;
  var v18$1: bv32;
  var v18$2: bv32;
  var v22$1: bv32;
  var v22$2: bv32;
  var v19$1: bv32;
  var v19$2: bv32;
  var v20$1: bv32;
  var v20$2: bv32;
  var v21$1: bv32;
  var v21$2: bv32;
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
  var v33$1: bv32;
  var v33$2: bv32;
  var v34$1: bool;
  var v34$2: bool;
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
  var v42$1: bv32;
  var v42$2: bv32;
  var v43$1: bv32;
  var v43$2: bv32;
  var v44$1: bv32;
  var v44$2: bv32;
  var v45$1: bv32;
  var v45$2: bv32;
  var v46$1: bv32;
  var v46$2: bv32;
  var v47$1: bv32;
  var v47$2: bv32;
  var v48$1: bv32;
  var v48$2: bv32;
  var v49$1: bv32;
  var v49$2: bv32;
  var v50$1: bv32;
  var v50$2: bv32;
  var v51$1: bv32;
  var v51$2: bv32;
  var v52$1: bv32;
  var v52$2: bv32;
  var v53$1: bv32;
  var v53$2: bv32;
  var v54$1: bv32;
  var v54$2: bv32;
  var v55$1: bv32;
  var v55$2: bv32;
  var v56$1: bv32;
  var v56$2: bv32;
  var v57$1: bv32;
  var v57$2: bv32;
  var v58$1: bv32;
  var v58$2: bv32;
  var v59$1: bv32;
  var v59$2: bv32;
  var v60$1: bv32;
  var v60$2: bv32;
  var v61$1: bv32;
  var v61$2: bv32;
  var v62$1: bv32;
  var v62$2: bv32;
  var v63$1: bv32;
  var v63$2: bv32;
  var v64$1: bv32;
  var v64$2: bv32;
  var v65$1: bv32;
  var v65$2: bv32;
  var v66$1: bv32;
  var v66$2: bv32;
  var v67$1: bv32;
  var v67$2: bv32;
  var v68$1: bv32;
  var v68$2: bv32;
  var v69$1: bv32;
  var v69$2: bv32;
  var v70$1: bv32;
  var v70$2: bv32;
  var v71$1: bv32;
  var v71$2: bv32;
  var v72$1: bv32;
  var v72$2: bv32;
  var v73$1: bv32;
  var v73$2: bv32;
  var v74$1: bv32;
  var v74$2: bv32;
  var v75$1: bv32;
  var v75$2: bv32;
  var v76$1: bv32;
  var v76$2: bv32;
  var v77$1: bv32;
  var v77$2: bv32;
  var v78$1: bv32;
  var v78$2: bv32;
  var v79$1: bv32;
  var v79$2: bv32;
  var v80$1: bv32;
  var v80$2: bv32;
  var v81$1: bv32;
  var v81$2: bv32;
  var v82$1: bv32;
  var v82$2: bv32;
  var v83$1: bv32;
  var v83$2: bv32;
  var v84$1: bv32;
  var v84$2: bv32;
  var v85$1: bv32;
  var v85$2: bv32;
  var v86$1: bv32;
  var v86$2: bv32;
  var v87$1: bv32;
  var v87$2: bv32;
  var v88$1: bv32;
  var v88$2: bv32;
  var v89$1: bv32;
  var v89$2: bv32;
  var v90$1: bv32;
  var v90$2: bv32;
  var v91$1: bv32;
  var v91$2: bv32;
  var v92$1: bv32;
  var v92$2: bv32;
  var v93$1: bv32;
  var v93$2: bv32;
  var v94$1: bv32;
  var v94$2: bv32;
  var v95$1: bv32;
  var v95$2: bv32;
  var v96$1: bv32;
  var v96$2: bv32;
  var v97$1: bv32;
  var v97$2: bv32;
  var v98$1: bv32;
  var v98$2: bv32;
  var v99$1: bv32;
  var v99$2: bv32;
  var v100$1: bv32;
  var v100$2: bv32;
  var v101$1: bv32;
  var v101$2: bv32;
  var v102$1: bv32;
  var v102$2: bv32;
  var v103$1: bv32;
  var v103$2: bv32;
  var v104$1: bv32;
  var v104$2: bv32;
  var v105$1: bv32;
  var v105$2: bv32;
  var v106$1: bv32;
  var v106$2: bv32;
  var v107$1: bv32;
  var v107$2: bv32;
  var v116$1: bv32;
  var v116$2: bv32;
  var v108$1: bv32;
  var v108$2: bv32;
  var v109$1: bv32;
  var v109$2: bv32;
  var v110$1: bv32;
  var v110$2: bv32;
  var v111$1: bv32;
  var v111$2: bv32;
  var v112$1: bv32;
  var v112$2: bv32;
  var v113$1: bv32;
  var v113$2: bv32;
  var v114$1: bv32;
  var v114$2: bv32;
  var v115$1: bv32;
  var v115$2: bv32;
  var v117$1: bv32;
  var v117$2: bv32;
  var v118$1: bv32;
  var v118$2: bv32;
  var v119$1: bv32;
  var v119$2: bv32;
  var v120$1: bv32;
  var v120$2: bv32;
  var v121$1: bv32;
  var v121$2: bv32;
  var v122$1: bv32;
  var v122$2: bv32;
  var v123$1: bv32;
  var v123$2: bv32;
  var v124$1: bv32;
  var v124$2: bv32;
  var v125$1: bv32;
  var v125$2: bv32;
  var v126$1: bv32;
  var v126$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_UGE(v0$1, $deviceNumBodies);
    v1$2 := BV32_UGE(v0$2, $deviceNumBodies);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p1$1 := (if !v1$1 then !v1$1 else p1$1);
    p1$2 := (if !v1$2 then !v1$2 else p1$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p1$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p1$2 then _HAVOC_bv32$2 else v2$2);
    $$position$0bv32$1 := (if p1$1 then v2$1 else $$position$0bv32$1);
    $$position$0bv32$2 := (if p1$2 then v2$2 else $$position$0bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p1$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p1$2 then _HAVOC_bv32$2 else v3$2);
    $$position$1bv32$1 := (if p1$1 then v3$1 else $$position$1bv32$1);
    $$position$1bv32$2 := (if p1$2 then v3$2 else $$position$1bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v4$1 := (if p1$1 then _HAVOC_bv32$1 else v4$1);
    v4$2 := (if p1$2 then _HAVOC_bv32$2 else v4$2);
    $$position$2bv32$1 := (if p1$1 then v4$1 else $$position$2bv32$1);
    $$position$2bv32$2 := (if p1$2 then v4$2 else $$position$2bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v5$1 := (if p1$1 then _HAVOC_bv32$1 else v5$1);
    v5$2 := (if p1$2 then _HAVOC_bv32$2 else v5$2);
    $$position$3bv32$1 := (if p1$1 then v5$1 else $$position$3bv32$1);
    $$position$3bv32$2 := (if p1$2 then v5$2 else $$position$3bv32$2);
    v6$1 := (if p1$1 then $$position$0bv32$1 else v6$1);
    v6$2 := (if p1$2 then $$position$0bv32$2 else v6$2);
    $$10$0bv32$1 := (if p1$1 then v6$1 else $$10$0bv32$1);
    $$10$0bv32$2 := (if p1$2 then v6$2 else $$10$0bv32$2);
    v7$1 := (if p1$1 then $$position$1bv32$1 else v7$1);
    v7$2 := (if p1$2 then $$position$1bv32$2 else v7$2);
    $$10$1bv32$1 := (if p1$1 then v7$1 else $$10$1bv32$1);
    $$10$1bv32$2 := (if p1$2 then v7$2 else $$10$1bv32$2);
    v8$1 := (if p1$1 then $$position$2bv32$1 else v8$1);
    v8$2 := (if p1$2 then $$position$2bv32$2 else v8$2);
    $$10$2bv32$1 := (if p1$1 then v8$1 else $$10$2bv32$1);
    $$10$2bv32$2 := (if p1$2 then v8$2 else $$10$2bv32$2);
    v9$1 := (if p1$1 then $$position$3bv32$1 else v9$1);
    v9$2 := (if p1$2 then $$position$3bv32$2 else v9$2);
    $$10$3bv32$1 := (if p1$1 then v9$1 else $$10$3bv32$1);
    $$10$3bv32$2 := (if p1$2 then v9$2 else $$10$3bv32$2);
    v10$1 := (if p1$1 then $$10$0bv32$1 else v10$1);
    v10$2 := (if p1$2 then $$10$0bv32$2 else v10$2);
    v11$1 := (if p1$1 then $$10$1bv32$1 else v11$1);
    v11$2 := (if p1$2 then $$10$1bv32$2 else v11$2);
    v12$1 := (if p1$1 then $$10$2bv32$1 else v12$1);
    v12$2 := (if p1$2 then $$10$2bv32$2 else v12$2);
    v13$1 := (if p1$1 then $$10$3bv32$1 else v13$1);
    v13$2 := (if p1$2 then $$10$3bv32$2 else v13$2);
    $$bodyPos.i$0bv32$1 := (if p1$1 then v10$1 else $$bodyPos.i$0bv32$1);
    $$bodyPos.i$0bv32$2 := (if p1$2 then v10$2 else $$bodyPos.i$0bv32$2);
    $$bodyPos.i$1bv32$1 := (if p1$1 then v11$1 else $$bodyPos.i$1bv32$1);
    $$bodyPos.i$1bv32$2 := (if p1$2 then v11$2 else $$bodyPos.i$1bv32$2);
    $$bodyPos.i$2bv32$1 := (if p1$1 then v12$1 else $$bodyPos.i$2bv32$1);
    $$bodyPos.i$2bv32$2 := (if p1$2 then v12$2 else $$bodyPos.i$2bv32$2);
    $$bodyPos.i$3bv32$1 := (if p1$1 then v13$1 else $$bodyPos.i$3bv32$1);
    $$bodyPos.i$3bv32$2 := (if p1$2 then v13$2 else $$bodyPos.i$3bv32$2);
    $$6$0bv32$1 := (if p1$1 then 0bv32 else $$6$0bv32$1);
    $$6$0bv32$2 := (if p1$2 then 0bv32 else $$6$0bv32$2);
    $$6$1bv32$1 := (if p1$1 then 0bv32 else $$6$1bv32$1);
    $$6$1bv32$2 := (if p1$2 then 0bv32 else $$6$1bv32$2);
    $$6$2bv32$1 := (if p1$1 then 0bv32 else $$6$2bv32$1);
    $$6$2bv32$2 := (if p1$2 then 0bv32 else $$6$2bv32$2);
    $tile.i.0$1 := (if p1$1 then group_id_y$1 else $tile.i.0$1);
    $tile.i.0$2 := (if p1$2 then group_id_y$2 else $tile.i.0$2);
    p2$1 := (if p1$1 then true else p2$1);
    p2$2 := (if p1$2 then true else p2$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto __partitioned_block_$3_0;

  __partitioned_block_$3_0:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$__smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$__smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$__smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 31} p2$1 ==> true;
    v14$1 := (if p2$1 then BV32_ULT($tile.i.0$1, BV32_ADD(BV32_SDIV($totalNumBodies, BV32_MUL(group_size_x, group_size_y)), group_id_y$1)) else v14$1);
    v14$2 := (if p2$2 then BV32_ULT($tile.i.0$2, BV32_ADD(BV32_SDIV($totalNumBodies, BV32_MUL(group_size_x, group_size_y)), group_id_y$2)) else v14$2);
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p3$1 := (if p2$1 && v14$1 then v14$1 else p3$1);
    p3$2 := (if p2$2 && v14$2 then v14$2 else p3$2);
    p2$1 := (if p2$1 && !v14$1 then v14$1 else p2$1);
    p2$2 := (if p2$2 && !v14$2 then v14$2 else p2$2);
    v15$1 := (if p3$1 then BV32_ULT(BV32_ADD(group_id_x$1, $tile.i.0$1), num_groups_x) else v15$1);
    v15$2 := (if p3$2 then BV32_ULT(BV32_ADD(group_id_x$2, $tile.i.0$2), num_groups_x) else v15$2);
    p5$1 := (if p3$1 && v15$1 then v15$1 else p5$1);
    p5$2 := (if p3$2 && v15$2 then v15$2 else p5$2);
    p4$1 := (if p3$1 && !v15$1 then !v15$1 else p4$1);
    p4$2 := (if p3$2 && !v15$2 then !v15$2 else p4$2);
    $0$1 := (if p4$1 then BV32_SUB(BV32_ADD(group_id_x$1, $tile.i.0$1), num_groups_x) else $0$1);
    $0$2 := (if p4$2 then BV32_SUB(BV32_ADD(group_id_x$2, $tile.i.0$2), num_groups_x) else $0$2);
    $0$1 := (if p5$1 then BV32_ADD(group_id_x$1, $tile.i.0$1) else $0$1);
    $0$2 := (if p5$2 then BV32_ADD(group_id_x$2, $tile.i.0$2) else $0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v16$1 := (if p3$1 then _HAVOC_bv32$1 else v16$1);
    v16$2 := (if p3$2 then _HAVOC_bv32$2 else v16$2);
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$__smem(p3$1, BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32), v16$1, $$__smem[1bv1][BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$__smem(p3$2, BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$__smem(p3$2, BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32), v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$__smem"} true;
    $$__smem[1bv1][BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32)] := (if p3$1 then v16$1 else $$__smem[1bv1][BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32)]);
    $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32)] := (if p3$2 then v16$2 else $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32)]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v17$1 := (if p3$1 then _HAVOC_bv32$1 else v17$1);
    v17$2 := (if p3$2 then _HAVOC_bv32$2 else v17$2);
    call {:sourceloc} {:sourceloc_num 39} _LOG_WRITE_$$__smem(p3$1, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 1bv32), v17$1, $$__smem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$__smem(p3$2, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 39} _CHECK_WRITE_$$__smem(p3$2, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32), 1bv32), v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$__smem"} true;
    $$__smem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 1bv32)] := (if p3$1 then v17$1 else $$__smem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 1bv32)]);
    $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32), 1bv32)] := (if p3$2 then v17$2 else $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32), 1bv32)]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v18$1 := (if p3$1 then _HAVOC_bv32$1 else v18$1);
    v18$2 := (if p3$2 then _HAVOC_bv32$2 else v18$2);
    call {:sourceloc} {:sourceloc_num 41} _LOG_WRITE_$$__smem(p3$1, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 2bv32), v18$1, $$__smem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$__smem(p3$2, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 41} _CHECK_WRITE_$$__smem(p3$2, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32), 2bv32), v18$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$__smem"} true;
    $$__smem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 2bv32)] := (if p3$1 then v18$1 else $$__smem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 2bv32)]);
    $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32), 2bv32)] := (if p3$2 then v18$2 else $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32), 2bv32)]);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v19$1 := (if p3$1 then _HAVOC_bv32$1 else v19$1);
    v19$2 := (if p3$2 then _HAVOC_bv32$2 else v19$2);
    call {:sourceloc} {:sourceloc_num 43} _LOG_WRITE_$$__smem(p3$1, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 3bv32), v19$1, $$__smem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$__smem(p3$2, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 43} _CHECK_WRITE_$$__smem(p3$2, BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32), 3bv32), v19$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$__smem"} true;
    $$__smem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 3bv32)] := (if p3$1 then v19$1 else $$__smem[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$1, BV32_MUL(group_size_x, local_id_y$1)), 4bv32), 3bv32)]);
    $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32), 3bv32)] := (if p3$2 then v19$2 else $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(local_id_x$2, BV32_MUL(group_size_x, local_id_y$2)), 4bv32), 3bv32)]);
    goto __partitioned_block_$3_1;

  __partitioned_block_$3_1:
    call {:sourceloc_num 44} $bugle_barrier_duplicated_0(1bv1, 1bv1, p3$1, p3$2);
    v20$1 := (if p3$1 then $$bodyPos.i$0bv32$1 else v20$1);
    v20$2 := (if p3$2 then $$bodyPos.i$0bv32$2 else v20$2);
    $$8$0bv32$1 := (if p3$1 then v20$1 else $$8$0bv32$1);
    $$8$0bv32$2 := (if p3$2 then v20$2 else $$8$0bv32$2);
    v21$1 := (if p3$1 then $$bodyPos.i$1bv32$1 else v21$1);
    v21$2 := (if p3$2 then $$bodyPos.i$1bv32$2 else v21$2);
    $$8$1bv32$1 := (if p3$1 then v21$1 else $$8$1bv32$1);
    $$8$1bv32$2 := (if p3$2 then v21$2 else $$8$1bv32$2);
    v22$1 := (if p3$1 then $$bodyPos.i$2bv32$1 else v22$1);
    v22$2 := (if p3$2 then $$bodyPos.i$2bv32$2 else v22$2);
    $$8$2bv32$1 := (if p3$1 then v22$1 else $$8$2bv32$1);
    $$8$2bv32$2 := (if p3$2 then v22$2 else $$8$2bv32$2);
    v23$1 := (if p3$1 then $$bodyPos.i$3bv32$1 else v23$1);
    v23$2 := (if p3$2 then $$bodyPos.i$3bv32$2 else v23$2);
    $$8$3bv32$1 := (if p3$1 then v23$1 else $$8$3bv32$1);
    $$8$3bv32$2 := (if p3$2 then v23$2 else $$8$3bv32$2);
    v24$1 := (if p3$1 then $$6$0bv32$1 else v24$1);
    v24$2 := (if p3$2 then $$6$0bv32$2 else v24$2);
    $$9$0bv32$1 := (if p3$1 then v24$1 else $$9$0bv32$1);
    $$9$0bv32$2 := (if p3$2 then v24$2 else $$9$0bv32$2);
    v25$1 := (if p3$1 then $$6$1bv32$1 else v25$1);
    v25$2 := (if p3$2 then $$6$1bv32$2 else v25$2);
    $$9$1bv32$1 := (if p3$1 then v25$1 else $$9$1bv32$1);
    $$9$1bv32$2 := (if p3$2 then v25$2 else $$9$1bv32$2);
    v26$1 := (if p3$1 then $$6$2bv32$1 else v26$1);
    v26$2 := (if p3$2 then $$6$2bv32$2 else v26$2);
    $$9$2bv32$1 := (if p3$1 then v26$1 else $$9$2bv32$1);
    $$9$2bv32$2 := (if p3$2 then v26$2 else $$9$2bv32$2);
    v27$1 := (if p3$1 then $$8$0bv32$1 else v27$1);
    v27$2 := (if p3$2 then $$8$0bv32$2 else v27$2);
    v28$1 := (if p3$1 then $$8$1bv32$1 else v28$1);
    v28$2 := (if p3$2 then $$8$1bv32$2 else v28$2);
    v29$1 := (if p3$1 then $$8$2bv32$1 else v29$1);
    v29$2 := (if p3$2 then $$8$2bv32$2 else v29$2);
    v30$1 := (if p3$1 then $$8$3bv32$1 else v30$1);
    v30$2 := (if p3$2 then $$8$3bv32$2 else v30$2);
    v31$1 := (if p3$1 then $$9$0bv32$1 else v31$1);
    v31$2 := (if p3$2 then $$9$0bv32$2 else v31$2);
    v32$1 := (if p3$1 then $$9$1bv32$1 else v32$1);
    v32$2 := (if p3$2 then $$9$1bv32$2 else v32$2);
    v33$1 := (if p3$1 then $$9$2bv32$1 else v33$1);
    v33$2 := (if p3$2 then $$9$2bv32$2 else v33$2);
    $$iPos.i.i$0bv32$1 := (if p3$1 then v27$1 else $$iPos.i.i$0bv32$1);
    $$iPos.i.i$0bv32$2 := (if p3$2 then v27$2 else $$iPos.i.i$0bv32$2);
    $$iPos.i.i$1bv32$1 := (if p3$1 then v28$1 else $$iPos.i.i$1bv32$1);
    $$iPos.i.i$1bv32$2 := (if p3$2 then v28$2 else $$iPos.i.i$1bv32$2);
    $$iPos.i.i$2bv32$1 := (if p3$1 then v29$1 else $$iPos.i.i$2bv32$1);
    $$iPos.i.i$2bv32$2 := (if p3$2 then v29$2 else $$iPos.i.i$2bv32$2);
    $$iPos.i.i$3bv32$1 := (if p3$1 then v30$1 else $$iPos.i.i$3bv32$1);
    $$iPos.i.i$3bv32$2 := (if p3$2 then v30$2 else $$iPos.i.i$3bv32$2);
    $$accel.i.i$0bv32$1 := (if p3$1 then v31$1 else $$accel.i.i$0bv32$1);
    $$accel.i.i$0bv32$2 := (if p3$2 then v31$2 else $$accel.i.i$0bv32$2);
    $$accel.i.i$1bv32$1 := (if p3$1 then v32$1 else $$accel.i.i$1bv32$1);
    $$accel.i.i$1bv32$2 := (if p3$2 then v32$2 else $$accel.i.i$1bv32$2);
    $$accel.i.i$2bv32$1 := (if p3$1 then v33$1 else $$accel.i.i$2bv32$1);
    $$accel.i.i$2bv32$2 := (if p3$2 then v33$2 else $$accel.i.i$2bv32$2);
    $j.i.i.0$1, $counter.i.i.0$1 := (if p3$1 then 0bv64 else $j.i.i.0$1), (if p3$1 then 0bv32 else $counter.i.i.0$1);
    $j.i.i.0$2, $counter.i.i.0$2 := (if p3$2 then 0bv64 else $j.i.i.0$2), (if p3$2 then 0bv32 else $counter.i.i.0$2);
    p6$1 := (if p3$1 then true else p6$1);
    p6$2 := (if p3$2 then true else p6$2);
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $8;

  $8:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$__smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$__smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$__smem ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert p6$1 ==> p2$1;
    assert p6$2 ==> p2$2;
    assert {:block_sourceloc} {:sourceloc_num 73} p6$1 ==> true;
    v34$1 := (if p6$1 then BV32_ULT($counter.i.i.0$1, group_size_x) else v34$1);
    v34$2 := (if p6$2 then BV32_ULT($counter.i.i.0$2, group_size_x) else v34$2);
    p7$1 := false;
    p7$2 := false;
    p7$1 := (if p6$1 && v34$1 then v34$1 else p7$1);
    p7$2 := (if p6$2 && v34$2 then v34$2 else p7$2);
    p6$1 := (if p6$1 && !v34$1 then v34$1 else p6$1);
    p6$2 := (if p6$2 && !v34$2 then v34$2 else p6$2);
    v35$1 := (if p7$1 then $$accel.i.i$0bv32$1 else v35$1);
    v35$2 := (if p7$2 then $$accel.i.i$0bv32$2 else v35$2);
    $$3$0bv32$1 := (if p7$1 then v35$1 else $$3$0bv32$1);
    $$3$0bv32$2 := (if p7$2 then v35$2 else $$3$0bv32$2);
    v36$1 := (if p7$1 then $$accel.i.i$1bv32$1 else v36$1);
    v36$2 := (if p7$2 then $$accel.i.i$1bv32$2 else v36$2);
    $$3$1bv32$1 := (if p7$1 then v36$1 else $$3$1bv32$1);
    $$3$1bv32$2 := (if p7$2 then v36$2 else $$3$1bv32$2);
    v37$1 := (if p7$1 then $$accel.i.i$2bv32$1 else v37$1);
    v37$2 := (if p7$2 then $$accel.i.i$2bv32$2 else v37$2);
    $$3$2bv32$1 := (if p7$1 then v37$1 else $$3$2bv32$1);
    $$3$2bv32$2 := (if p7$2 then v37$2 else $$3$2bv32$2);
    v38$1 := (if p7$1 then $$iPos.i.i$0bv32$1 else v38$1);
    v38$2 := (if p7$2 then $$iPos.i.i$0bv32$2 else v38$2);
    $$4$0bv32$1 := (if p7$1 then v38$1 else $$4$0bv32$1);
    $$4$0bv32$2 := (if p7$2 then v38$2 else $$4$0bv32$2);
    v39$1 := (if p7$1 then $$iPos.i.i$1bv32$1 else v39$1);
    v39$2 := (if p7$2 then $$iPos.i.i$1bv32$2 else v39$2);
    $$4$1bv32$1 := (if p7$1 then v39$1 else $$4$1bv32$1);
    $$4$1bv32$2 := (if p7$2 then v39$2 else $$4$1bv32$2);
    v40$1 := (if p7$1 then $$iPos.i.i$2bv32$1 else v40$1);
    v40$2 := (if p7$2 then $$iPos.i.i$2bv32$2 else v40$2);
    $$4$2bv32$1 := (if p7$1 then v40$1 else $$4$2bv32$1);
    $$4$2bv32$2 := (if p7$2 then v40$2 else $$4$2bv32$2);
    v41$1 := (if p7$1 then $$iPos.i.i$3bv32$1 else v41$1);
    v41$2 := (if p7$2 then $$iPos.i.i$3bv32$2 else v41$2);
    $$4$3bv32$1 := (if p7$1 then v41$1 else $$4$3bv32$1);
    $$4$3bv32$2 := (if p7$2 then v41$2 else $$4$3bv32$2);
    call {:sourceloc} {:sourceloc_num 89} _LOG_READ_$$__smem(p7$1, BV32_MUL(BV64_ADD($j.i.i.0$1, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$1)))[32:0], 4bv32), $$__smem[1bv1][BV32_MUL(BV64_ADD($j.i.i.0$1, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$1)))[32:0], 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 89} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 89} _CHECK_READ_$$__smem(p7$2, BV32_MUL(BV64_ADD($j.i.i.0$2, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$2)))[32:0], 4bv32), $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV64_ADD($j.i.i.0$2, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$2)))[32:0], 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$__smem"} true;
    v42$1 := (if p7$1 then $$__smem[1bv1][BV32_MUL(BV64_ADD($j.i.i.0$1, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$1)))[32:0], 4bv32)] else v42$1);
    v42$2 := (if p7$2 then $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV64_ADD($j.i.i.0$2, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$2)))[32:0], 4bv32)] else v42$2);
    $$5$0bv32$1 := (if p7$1 then v42$1 else $$5$0bv32$1);
    $$5$0bv32$2 := (if p7$2 then v42$2 else $$5$0bv32$2);
    call {:sourceloc} {:sourceloc_num 91} _LOG_READ_$$__smem(p7$1, BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$1, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$1)))[32:0], 4bv32), 1bv32), $$__smem[1bv1][BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$1, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$1)))[32:0], 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 91} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 91} _CHECK_READ_$$__smem(p7$2, BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$2, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$2)))[32:0], 4bv32), 1bv32), $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$2, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$2)))[32:0], 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$__smem"} true;
    v43$1 := (if p7$1 then $$__smem[1bv1][BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$1, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$1)))[32:0], 4bv32), 1bv32)] else v43$1);
    v43$2 := (if p7$2 then $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$2, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$2)))[32:0], 4bv32), 1bv32)] else v43$2);
    $$5$1bv32$1 := (if p7$1 then v43$1 else $$5$1bv32$1);
    $$5$1bv32$2 := (if p7$2 then v43$2 else $$5$1bv32$2);
    call {:sourceloc} {:sourceloc_num 93} _LOG_READ_$$__smem(p7$1, BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$1, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$1)))[32:0], 4bv32), 2bv32), $$__smem[1bv1][BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$1, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$1)))[32:0], 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 93} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 93} _CHECK_READ_$$__smem(p7$2, BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$2, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$2)))[32:0], 4bv32), 2bv32), $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$2, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$2)))[32:0], 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$__smem"} true;
    v44$1 := (if p7$1 then $$__smem[1bv1][BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$1, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$1)))[32:0], 4bv32), 2bv32)] else v44$1);
    v44$2 := (if p7$2 then $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$2, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$2)))[32:0], 4bv32), 2bv32)] else v44$2);
    $$5$2bv32$1 := (if p7$1 then v44$1 else $$5$2bv32$1);
    $$5$2bv32$2 := (if p7$2 then v44$2 else $$5$2bv32$2);
    call {:sourceloc} {:sourceloc_num 95} _LOG_READ_$$__smem(p7$1, BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$1, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$1)))[32:0], 4bv32), 3bv32), $$__smem[1bv1][BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$1, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$1)))[32:0], 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 95} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 95} _CHECK_READ_$$__smem(p7$2, BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$2, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$2)))[32:0], 4bv32), 3bv32), $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$2, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$2)))[32:0], 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$__smem"} true;
    v45$1 := (if p7$1 then $$__smem[1bv1][BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$1, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$1)))[32:0], 4bv32), 3bv32)] else v45$1);
    v45$2 := (if p7$2 then $$__smem[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV64_ADD($j.i.i.0$2, BV32_ZEXT64(BV32_MUL(group_size_x, local_id_y$2)))[32:0], 4bv32), 3bv32)] else v45$2);
    $$5$3bv32$1 := (if p7$1 then v45$1 else $$5$3bv32$1);
    $$5$3bv32$2 := (if p7$2 then v45$2 else $$5$3bv32$2);
    v46$1 := (if p7$1 then $$3$0bv32$1 else v46$1);
    v46$2 := (if p7$2 then $$3$0bv32$2 else v46$2);
    v47$1 := (if p7$1 then $$3$1bv32$1 else v47$1);
    v47$2 := (if p7$2 then $$3$1bv32$2 else v47$2);
    v48$1 := (if p7$1 then $$3$2bv32$1 else v48$1);
    v48$2 := (if p7$2 then $$3$2bv32$2 else v48$2);
    v49$1 := (if p7$1 then $$4$0bv32$1 else v49$1);
    v49$2 := (if p7$2 then $$4$0bv32$2 else v49$2);
    v50$1 := (if p7$1 then $$4$1bv32$1 else v50$1);
    v50$2 := (if p7$2 then $$4$1bv32$2 else v50$2);
    v51$1 := (if p7$1 then $$4$2bv32$1 else v51$1);
    v51$2 := (if p7$2 then $$4$2bv32$2 else v51$2);
    v52$1 := (if p7$1 then $$4$3bv32$1 else v52$1);
    v52$2 := (if p7$2 then $$4$3bv32$2 else v52$2);
    v53$1 := (if p7$1 then $$5$0bv32$1 else v53$1);
    v53$2 := (if p7$2 then $$5$0bv32$2 else v53$2);
    v54$1 := (if p7$1 then $$5$1bv32$1 else v54$1);
    v54$2 := (if p7$2 then $$5$1bv32$2 else v54$2);
    v55$1 := (if p7$1 then $$5$2bv32$1 else v55$1);
    v55$2 := (if p7$2 then $$5$2bv32$2 else v55$2);
    v56$1 := (if p7$1 then $$5$3bv32$1 else v56$1);
    v56$2 := (if p7$2 then $$5$3bv32$2 else v56$2);
    $$ai.i.i.i$0bv32$1 := (if p7$1 then v46$1 else $$ai.i.i.i$0bv32$1);
    $$ai.i.i.i$0bv32$2 := (if p7$2 then v46$2 else $$ai.i.i.i$0bv32$2);
    $$ai.i.i.i$1bv32$1 := (if p7$1 then v47$1 else $$ai.i.i.i$1bv32$1);
    $$ai.i.i.i$1bv32$2 := (if p7$2 then v47$2 else $$ai.i.i.i$1bv32$2);
    $$ai.i.i.i$2bv32$1 := (if p7$1 then v48$1 else $$ai.i.i.i$2bv32$1);
    $$ai.i.i.i$2bv32$2 := (if p7$2 then v48$2 else $$ai.i.i.i$2bv32$2);
    $$bi.i.i.i$0bv32$1 := (if p7$1 then v49$1 else $$bi.i.i.i$0bv32$1);
    $$bi.i.i.i$0bv32$2 := (if p7$2 then v49$2 else $$bi.i.i.i$0bv32$2);
    $$bi.i.i.i$1bv32$1 := (if p7$1 then v50$1 else $$bi.i.i.i$1bv32$1);
    $$bi.i.i.i$1bv32$2 := (if p7$2 then v50$2 else $$bi.i.i.i$1bv32$2);
    $$bi.i.i.i$2bv32$1 := (if p7$1 then v51$1 else $$bi.i.i.i$2bv32$1);
    $$bi.i.i.i$2bv32$2 := (if p7$2 then v51$2 else $$bi.i.i.i$2bv32$2);
    $$bi.i.i.i$3bv32$1 := (if p7$1 then v52$1 else $$bi.i.i.i$3bv32$1);
    $$bi.i.i.i$3bv32$2 := (if p7$2 then v52$2 else $$bi.i.i.i$3bv32$2);
    $$bj.i.i.i$0bv32$1 := (if p7$1 then v53$1 else $$bj.i.i.i$0bv32$1);
    $$bj.i.i.i$0bv32$2 := (if p7$2 then v53$2 else $$bj.i.i.i$0bv32$2);
    $$bj.i.i.i$1bv32$1 := (if p7$1 then v54$1 else $$bj.i.i.i$1bv32$1);
    $$bj.i.i.i$1bv32$2 := (if p7$2 then v54$2 else $$bj.i.i.i$1bv32$2);
    $$bj.i.i.i$2bv32$1 := (if p7$1 then v55$1 else $$bj.i.i.i$2bv32$1);
    $$bj.i.i.i$2bv32$2 := (if p7$2 then v55$2 else $$bj.i.i.i$2bv32$2);
    $$bj.i.i.i$3bv32$1 := (if p7$1 then v56$1 else $$bj.i.i.i$3bv32$1);
    $$bj.i.i.i$3bv32$2 := (if p7$2 then v56$2 else $$bj.i.i.i$3bv32$2);
    v57$1 := (if p7$1 then $$bj.i.i.i$0bv32$1 else v57$1);
    v57$2 := (if p7$2 then $$bj.i.i.i$0bv32$2 else v57$2);
    v58$1 := (if p7$1 then $$bi.i.i.i$0bv32$1 else v58$1);
    v58$2 := (if p7$2 then $$bi.i.i.i$0bv32$2 else v58$2);
    $$r.i.i.i$0bv32$1 := (if p7$1 then FSUB32(v57$1, v58$1) else $$r.i.i.i$0bv32$1);
    $$r.i.i.i$0bv32$2 := (if p7$2 then FSUB32(v57$2, v58$2) else $$r.i.i.i$0bv32$2);
    v59$1 := (if p7$1 then $$bj.i.i.i$1bv32$1 else v59$1);
    v59$2 := (if p7$2 then $$bj.i.i.i$1bv32$2 else v59$2);
    v60$1 := (if p7$1 then $$bi.i.i.i$1bv32$1 else v60$1);
    v60$2 := (if p7$2 then $$bi.i.i.i$1bv32$2 else v60$2);
    $$r.i.i.i$1bv32$1 := (if p7$1 then FSUB32(v59$1, v60$1) else $$r.i.i.i$1bv32$1);
    $$r.i.i.i$1bv32$2 := (if p7$2 then FSUB32(v59$2, v60$2) else $$r.i.i.i$1bv32$2);
    v61$1 := (if p7$1 then $$bj.i.i.i$2bv32$1 else v61$1);
    v61$2 := (if p7$2 then $$bj.i.i.i$2bv32$2 else v61$2);
    v62$1 := (if p7$1 then $$bi.i.i.i$2bv32$1 else v62$1);
    v62$2 := (if p7$2 then $$bi.i.i.i$2bv32$2 else v62$2);
    $$r.i.i.i$2bv32$1 := (if p7$1 then FSUB32(v61$1, v62$1) else $$r.i.i.i$2bv32$1);
    $$r.i.i.i$2bv32$2 := (if p7$2 then FSUB32(v61$2, v62$2) else $$r.i.i.i$2bv32$2);
    v63$1 := (if p7$1 then $$r.i.i.i$0bv32$1 else v63$1);
    v63$2 := (if p7$2 then $$r.i.i.i$0bv32$2 else v63$2);
    v64$1 := (if p7$1 then $$r.i.i.i$0bv32$1 else v64$1);
    v64$2 := (if p7$2 then $$r.i.i.i$0bv32$2 else v64$2);
    v65$1 := (if p7$1 then $$r.i.i.i$1bv32$1 else v65$1);
    v65$2 := (if p7$2 then $$r.i.i.i$1bv32$2 else v65$2);
    v66$1 := (if p7$1 then $$r.i.i.i$1bv32$1 else v66$1);
    v66$2 := (if p7$2 then $$r.i.i.i$1bv32$2 else v66$2);
    v67$1 := (if p7$1 then $$r.i.i.i$2bv32$1 else v67$1);
    v67$2 := (if p7$2 then $$r.i.i.i$2bv32$2 else v67$2);
    v68$1 := (if p7$1 then $$r.i.i.i$2bv32$1 else v68$1);
    v68$2 := (if p7$2 then $$r.i.i.i$2bv32$2 else v68$2);
    v69$1 := (if p7$1 then $$softeningSquared$1[0bv32] else v69$1);
    v69$2 := (if p7$2 then $$softeningSquared$2[0bv32] else v69$2);
    call {:sourceloc_num 135} v70$1, v70$2 := $rsqrtf(p7$1, FADD32(FADD32(FADD32(FMUL32(v63$1, v64$1), FMUL32(v65$1, v66$1)), FMUL32(v67$1, v68$1)), v69$1), p7$2, FADD32(FADD32(FADD32(FMUL32(v63$2, v64$2), FMUL32(v65$2, v66$2)), FMUL32(v67$2, v68$2)), v69$2));
    assume {:captureState "call_return_state_0"} {:procedureName "$rsqrtf"} true;
    v71$1 := (if p7$1 then $$bj.i.i.i$3bv32$1 else v71$1);
    v71$2 := (if p7$2 then $$bj.i.i.i$3bv32$2 else v71$2);
    v72$1 := (if p7$1 then FMUL32(v71$1, FMUL32(FMUL32(v70$1, v70$1), v70$1)) else v72$1);
    v72$2 := (if p7$2 then FMUL32(v71$2, FMUL32(FMUL32(v70$2, v70$2), v70$2)) else v72$2);
    v73$1 := (if p7$1 then $$r.i.i.i$0bv32$1 else v73$1);
    v73$2 := (if p7$2 then $$r.i.i.i$0bv32$2 else v73$2);
    v74$1 := (if p7$1 then $$ai.i.i.i$0bv32$1 else v74$1);
    v74$2 := (if p7$2 then $$ai.i.i.i$0bv32$2 else v74$2);
    $$ai.i.i.i$0bv32$1 := (if p7$1 then FADD32(v74$1, FMUL32(v73$1, v72$1)) else $$ai.i.i.i$0bv32$1);
    $$ai.i.i.i$0bv32$2 := (if p7$2 then FADD32(v74$2, FMUL32(v73$2, v72$2)) else $$ai.i.i.i$0bv32$2);
    v75$1 := (if p7$1 then $$r.i.i.i$1bv32$1 else v75$1);
    v75$2 := (if p7$2 then $$r.i.i.i$1bv32$2 else v75$2);
    v76$1 := (if p7$1 then $$ai.i.i.i$1bv32$1 else v76$1);
    v76$2 := (if p7$2 then $$ai.i.i.i$1bv32$2 else v76$2);
    $$ai.i.i.i$1bv32$1 := (if p7$1 then FADD32(v76$1, FMUL32(v75$1, v72$1)) else $$ai.i.i.i$1bv32$1);
    $$ai.i.i.i$1bv32$2 := (if p7$2 then FADD32(v76$2, FMUL32(v75$2, v72$2)) else $$ai.i.i.i$1bv32$2);
    v77$1 := (if p7$1 then $$r.i.i.i$2bv32$1 else v77$1);
    v77$2 := (if p7$2 then $$r.i.i.i$2bv32$2 else v77$2);
    v78$1 := (if p7$1 then $$ai.i.i.i$2bv32$1 else v78$1);
    v78$2 := (if p7$2 then $$ai.i.i.i$2bv32$2 else v78$2);
    $$ai.i.i.i$2bv32$1 := (if p7$1 then FADD32(v78$1, FMUL32(v77$1, v72$1)) else $$ai.i.i.i$2bv32$1);
    $$ai.i.i.i$2bv32$2 := (if p7$2 then FADD32(v78$2, FMUL32(v77$2, v72$2)) else $$ai.i.i.i$2bv32$2);
    v79$1 := (if p7$1 then $$ai.i.i.i$0bv32$1 else v79$1);
    v79$2 := (if p7$2 then $$ai.i.i.i$0bv32$2 else v79$2);
    $$0$0bv32$1 := (if p7$1 then v79$1 else $$0$0bv32$1);
    $$0$0bv32$2 := (if p7$2 then v79$2 else $$0$0bv32$2);
    v80$1 := (if p7$1 then $$ai.i.i.i$1bv32$1 else v80$1);
    v80$2 := (if p7$2 then $$ai.i.i.i$1bv32$2 else v80$2);
    $$0$1bv32$1 := (if p7$1 then v80$1 else $$0$1bv32$1);
    $$0$1bv32$2 := (if p7$2 then v80$2 else $$0$1bv32$2);
    v81$1 := (if p7$1 then $$ai.i.i.i$2bv32$1 else v81$1);
    v81$2 := (if p7$2 then $$ai.i.i.i$2bv32$2 else v81$2);
    $$0$2bv32$1 := (if p7$1 then v81$1 else $$0$2bv32$1);
    $$0$2bv32$2 := (if p7$2 then v81$2 else $$0$2bv32$2);
    v82$1 := (if p7$1 then $$0$0bv32$1 else v82$1);
    v82$2 := (if p7$2 then $$0$0bv32$2 else v82$2);
    v83$1 := (if p7$1 then $$0$1bv32$1 else v83$1);
    v83$2 := (if p7$2 then $$0$1bv32$2 else v83$2);
    v84$1 := (if p7$1 then $$0$2bv32$1 else v84$1);
    v84$2 := (if p7$2 then $$0$2bv32$2 else v84$2);
    $$2$0bv32$1 := (if p7$1 then v82$1 else $$2$0bv32$1);
    $$2$0bv32$2 := (if p7$2 then v82$2 else $$2$0bv32$2);
    $$2$1bv32$1 := (if p7$1 then v83$1 else $$2$1bv32$1);
    $$2$1bv32$2 := (if p7$2 then v83$2 else $$2$1bv32$2);
    $$2$2bv32$1 := (if p7$1 then v84$1 else $$2$2bv32$1);
    $$2$2bv32$2 := (if p7$2 then v84$2 else $$2$2bv32$2);
    v85$1 := (if p7$1 then $$2$0bv32$1 else v85$1);
    v85$2 := (if p7$2 then $$2$0bv32$2 else v85$2);
    $$accel.i.i$0bv32$1 := (if p7$1 then v85$1 else $$accel.i.i$0bv32$1);
    $$accel.i.i$0bv32$2 := (if p7$2 then v85$2 else $$accel.i.i$0bv32$2);
    v86$1 := (if p7$1 then $$2$1bv32$1 else v86$1);
    v86$2 := (if p7$2 then $$2$1bv32$2 else v86$2);
    $$accel.i.i$1bv32$1 := (if p7$1 then v86$1 else $$accel.i.i$1bv32$1);
    $$accel.i.i$1bv32$2 := (if p7$2 then v86$2 else $$accel.i.i$1bv32$2);
    v87$1 := (if p7$1 then $$2$2bv32$1 else v87$1);
    v87$2 := (if p7$2 then $$2$2bv32$2 else v87$2);
    $$accel.i.i$2bv32$1 := (if p7$1 then v87$1 else $$accel.i.i$2bv32$1);
    $$accel.i.i$2bv32$2 := (if p7$2 then v87$2 else $$accel.i.i$2bv32$2);
    $j.i.i.0$1, $counter.i.i.0$1 := (if p7$1 then BV64_ADD($j.i.i.0$1, 1bv64) else $j.i.i.0$1), (if p7$1 then BV32_ADD($counter.i.i.0$1, 1bv32) else $counter.i.i.0$1);
    $j.i.i.0$2, $counter.i.i.0$2 := (if p7$2 then BV64_ADD($j.i.i.0$2, 1bv64) else $j.i.i.0$2), (if p7$2 then BV32_ADD($counter.i.i.0$2, 1bv32) else $counter.i.i.0$2);
    p6$1 := (if p7$1 then true else p6$1);
    p6$2 := (if p7$2 then true else p6$2);
    goto $8.backedge, __partitioned_block_$8.tail_0;

  __partitioned_block_$8.tail_0:
    assume !p6$1 && !p6$2;
    v88$1 := (if p3$1 then $$accel.i.i$0bv32$1 else v88$1);
    v88$2 := (if p3$2 then $$accel.i.i$0bv32$2 else v88$2);
    $$1$0bv32$1 := (if p3$1 then v88$1 else $$1$0bv32$1);
    $$1$0bv32$2 := (if p3$2 then v88$2 else $$1$0bv32$2);
    v89$1 := (if p3$1 then $$accel.i.i$1bv32$1 else v89$1);
    v89$2 := (if p3$2 then $$accel.i.i$1bv32$2 else v89$2);
    $$1$1bv32$1 := (if p3$1 then v89$1 else $$1$1bv32$1);
    $$1$1bv32$2 := (if p3$2 then v89$2 else $$1$1bv32$2);
    v90$1 := (if p3$1 then $$accel.i.i$2bv32$1 else v90$1);
    v90$2 := (if p3$2 then $$accel.i.i$2bv32$2 else v90$2);
    $$1$2bv32$1 := (if p3$1 then v90$1 else $$1$2bv32$1);
    $$1$2bv32$2 := (if p3$2 then v90$2 else $$1$2bv32$2);
    v91$1 := (if p3$1 then $$1$0bv32$1 else v91$1);
    v91$2 := (if p3$2 then $$1$0bv32$2 else v91$2);
    v92$1 := (if p3$1 then $$1$1bv32$1 else v92$1);
    v92$2 := (if p3$2 then $$1$1bv32$2 else v92$2);
    v93$1 := (if p3$1 then $$1$2bv32$1 else v93$1);
    v93$2 := (if p3$2 then $$1$2bv32$2 else v93$2);
    $$7$0bv32$1 := (if p3$1 then v91$1 else $$7$0bv32$1);
    $$7$0bv32$2 := (if p3$2 then v91$2 else $$7$0bv32$2);
    $$7$1bv32$1 := (if p3$1 then v92$1 else $$7$1bv32$1);
    $$7$1bv32$2 := (if p3$2 then v92$2 else $$7$1bv32$2);
    $$7$2bv32$1 := (if p3$1 then v93$1 else $$7$2bv32$1);
    $$7$2bv32$2 := (if p3$2 then v93$2 else $$7$2bv32$2);
    v94$1 := (if p3$1 then $$7$0bv32$1 else v94$1);
    v94$2 := (if p3$2 then $$7$0bv32$2 else v94$2);
    $$6$0bv32$1 := (if p3$1 then v94$1 else $$6$0bv32$1);
    $$6$0bv32$2 := (if p3$2 then v94$2 else $$6$0bv32$2);
    v95$1 := (if p3$1 then $$7$1bv32$1 else v95$1);
    v95$2 := (if p3$2 then $$7$1bv32$2 else v95$2);
    $$6$1bv32$1 := (if p3$1 then v95$1 else $$6$1bv32$1);
    $$6$1bv32$2 := (if p3$2 then v95$2 else $$6$1bv32$2);
    v96$1 := (if p3$1 then $$7$2bv32$1 else v96$1);
    v96$2 := (if p3$2 then $$7$2bv32$2 else v96$2);
    $$6$2bv32$1 := (if p3$1 then v96$1 else $$6$2bv32$1);
    $$6$2bv32$2 := (if p3$2 then v96$2 else $$6$2bv32$2);
    goto __partitioned_block_$8.tail_1;

  __partitioned_block_$8.tail_1:
    call {:sourceloc_num 183} $bugle_barrier_duplicated_1(1bv1, 1bv1, p3$1, p3$2);
    $tile.i.0$1 := (if p3$1 then BV32_ADD($tile.i.0$1, 1bv32) else $tile.i.0$1);
    $tile.i.0$2 := (if p3$2 then BV32_ADD($tile.i.0$2, 1bv32) else $tile.i.0$2);
    p2$1 := (if p3$1 then true else p2$1);
    p2$2 := (if p3$2 then true else p2$2);
    goto $3.backedge, $3.tail;

  $3.tail:
    assume !p2$1 && !p2$2;
    v97$1 := (if p1$1 then $$6$0bv32$1 else v97$1);
    v97$2 := (if p1$2 then $$6$0bv32$2 else v97$2);
    v98$1 := (if p1$1 then $$6$1bv32$1 else v98$1);
    v98$2 := (if p1$2 then $$6$1bv32$2 else v98$2);
    v99$1 := (if p1$1 then $$6$2bv32$1 else v99$1);
    v99$2 := (if p1$2 then $$6$2bv32$2 else v99$2);
    $$accel$0bv32$1 := (if p1$1 then v97$1 else $$accel$0bv32$1);
    $$accel$0bv32$2 := (if p1$2 then v97$2 else $$accel$0bv32$2);
    $$accel$1bv32$1 := (if p1$1 then v98$1 else $$accel$1bv32$1);
    $$accel$1bv32$2 := (if p1$2 then v98$2 else $$accel$1bv32$2);
    $$accel$2bv32$1 := (if p1$1 then v99$1 else $$accel$2bv32$1);
    $$accel$2bv32$2 := (if p1$2 then v99$2 else $$accel$2bv32$2);
    call {:sourceloc} {:sourceloc_num 191} _LOG_READ_$$vel(p1$1, BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), $$vel[BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 191} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 191} _CHECK_READ_$$vel(p1$2, BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), $$vel[BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$vel"} true;
    v100$1 := (if p1$1 then $$vel[BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32)] else v100$1);
    v100$2 := (if p1$2 then $$vel[BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32)] else v100$2);
    $$velocity$0bv32$1 := (if p1$1 then v100$1 else $$velocity$0bv32$1);
    $$velocity$0bv32$2 := (if p1$2 then v100$2 else $$velocity$0bv32$2);
    call {:sourceloc} {:sourceloc_num 193} _LOG_READ_$$vel(p1$1, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 1bv32), $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 193} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 193} _CHECK_READ_$$vel(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 1bv32), $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$vel"} true;
    v101$1 := (if p1$1 then $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 1bv32)] else v101$1);
    v101$2 := (if p1$2 then $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 1bv32)] else v101$2);
    $$velocity$1bv32$1 := (if p1$1 then v101$1 else $$velocity$1bv32$1);
    $$velocity$1bv32$2 := (if p1$2 then v101$2 else $$velocity$1bv32$2);
    call {:sourceloc} {:sourceloc_num 195} _LOG_READ_$$vel(p1$1, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 2bv32), $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 195} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 195} _CHECK_READ_$$vel(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 2bv32), $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$vel"} true;
    v102$1 := (if p1$1 then $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 2bv32)] else v102$1);
    v102$2 := (if p1$2 then $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 2bv32)] else v102$2);
    $$velocity$2bv32$1 := (if p1$1 then v102$1 else $$velocity$2bv32$1);
    $$velocity$2bv32$2 := (if p1$2 then v102$2 else $$velocity$2bv32$2);
    call {:sourceloc} {:sourceloc_num 197} _LOG_READ_$$vel(p1$1, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 3bv32), $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 197} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 197} _CHECK_READ_$$vel(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 3bv32), $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$vel"} true;
    v103$1 := (if p1$1 then $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 3bv32)] else v103$1);
    v103$2 := (if p1$2 then $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 3bv32)] else v103$2);
    $$velocity$3bv32$1 := (if p1$1 then v103$1 else $$velocity$3bv32$1);
    $$velocity$3bv32$2 := (if p1$2 then v103$2 else $$velocity$3bv32$2);
    v104$1 := (if p1$1 then $$accel$0bv32$1 else v104$1);
    v104$2 := (if p1$2 then $$accel$0bv32$2 else v104$2);
    v105$1 := (if p1$1 then $$velocity$0bv32$1 else v105$1);
    v105$2 := (if p1$2 then $$velocity$0bv32$2 else v105$2);
    $$velocity$0bv32$1 := (if p1$1 then FADD32(v105$1, FMUL32(v104$1, $deltaTime)) else $$velocity$0bv32$1);
    $$velocity$0bv32$2 := (if p1$2 then FADD32(v105$2, FMUL32(v104$2, $deltaTime)) else $$velocity$0bv32$2);
    v106$1 := (if p1$1 then $$accel$1bv32$1 else v106$1);
    v106$2 := (if p1$2 then $$accel$1bv32$2 else v106$2);
    v107$1 := (if p1$1 then $$velocity$1bv32$1 else v107$1);
    v107$2 := (if p1$2 then $$velocity$1bv32$2 else v107$2);
    $$velocity$1bv32$1 := (if p1$1 then FADD32(v107$1, FMUL32(v106$1, $deltaTime)) else $$velocity$1bv32$1);
    $$velocity$1bv32$2 := (if p1$2 then FADD32(v107$2, FMUL32(v106$2, $deltaTime)) else $$velocity$1bv32$2);
    v108$1 := (if p1$1 then $$accel$2bv32$1 else v108$1);
    v108$2 := (if p1$2 then $$accel$2bv32$2 else v108$2);
    v109$1 := (if p1$1 then $$velocity$2bv32$1 else v109$1);
    v109$2 := (if p1$2 then $$velocity$2bv32$2 else v109$2);
    $$velocity$2bv32$1 := (if p1$1 then FADD32(v109$1, FMUL32(v108$1, $deltaTime)) else $$velocity$2bv32$1);
    $$velocity$2bv32$2 := (if p1$2 then FADD32(v109$2, FMUL32(v108$2, $deltaTime)) else $$velocity$2bv32$2);
    v110$1 := (if p1$1 then $$velocity$0bv32$1 else v110$1);
    v110$2 := (if p1$2 then $$velocity$0bv32$2 else v110$2);
    $$velocity$0bv32$1 := (if p1$1 then FMUL32(v110$1, $damping) else $$velocity$0bv32$1);
    $$velocity$0bv32$2 := (if p1$2 then FMUL32(v110$2, $damping) else $$velocity$0bv32$2);
    v111$1 := (if p1$1 then $$velocity$1bv32$1 else v111$1);
    v111$2 := (if p1$2 then $$velocity$1bv32$2 else v111$2);
    $$velocity$1bv32$1 := (if p1$1 then FMUL32(v111$1, $damping) else $$velocity$1bv32$1);
    $$velocity$1bv32$2 := (if p1$2 then FMUL32(v111$2, $damping) else $$velocity$1bv32$2);
    v112$1 := (if p1$1 then $$velocity$2bv32$1 else v112$1);
    v112$2 := (if p1$2 then $$velocity$2bv32$2 else v112$2);
    $$velocity$2bv32$1 := (if p1$1 then FMUL32(v112$1, $damping) else $$velocity$2bv32$1);
    $$velocity$2bv32$2 := (if p1$2 then FMUL32(v112$2, $damping) else $$velocity$2bv32$2);
    v113$1 := (if p1$1 then $$velocity$0bv32$1 else v113$1);
    v113$2 := (if p1$2 then $$velocity$0bv32$2 else v113$2);
    v114$1 := (if p1$1 then $$position$0bv32$1 else v114$1);
    v114$2 := (if p1$2 then $$position$0bv32$2 else v114$2);
    $$position$0bv32$1 := (if p1$1 then FADD32(v114$1, FMUL32(v113$1, $deltaTime)) else $$position$0bv32$1);
    $$position$0bv32$2 := (if p1$2 then FADD32(v114$2, FMUL32(v113$2, $deltaTime)) else $$position$0bv32$2);
    v115$1 := (if p1$1 then $$velocity$1bv32$1 else v115$1);
    v115$2 := (if p1$2 then $$velocity$1bv32$2 else v115$2);
    v116$1 := (if p1$1 then $$position$1bv32$1 else v116$1);
    v116$2 := (if p1$2 then $$position$1bv32$2 else v116$2);
    $$position$1bv32$1 := (if p1$1 then FADD32(v116$1, FMUL32(v115$1, $deltaTime)) else $$position$1bv32$1);
    $$position$1bv32$2 := (if p1$2 then FADD32(v116$2, FMUL32(v115$2, $deltaTime)) else $$position$1bv32$2);
    v117$1 := (if p1$1 then $$velocity$2bv32$1 else v117$1);
    v117$2 := (if p1$2 then $$velocity$2bv32$2 else v117$2);
    v118$1 := (if p1$1 then $$position$2bv32$1 else v118$1);
    v118$2 := (if p1$2 then $$position$2bv32$2 else v118$2);
    $$position$2bv32$1 := (if p1$1 then FADD32(v118$1, FMUL32(v117$1, $deltaTime)) else $$position$2bv32$1);
    $$position$2bv32$2 := (if p1$2 then FADD32(v118$2, FMUL32(v117$2, $deltaTime)) else $$position$2bv32$2);
    v119$1 := (if p1$1 then $$position$0bv32$1 else v119$1);
    v119$2 := (if p1$2 then $$position$0bv32$2 else v119$2);
    call {:sourceloc} {:sourceloc_num 224} _LOG_WRITE_$$newPos(p1$1, BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), v119$1, $$newPos[BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newPos(p1$2, BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 224} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 224} _CHECK_WRITE_$$newPos(p1$2, BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), v119$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newPos"} true;
    $$newPos[BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32)] := (if p1$1 then v119$1 else $$newPos[BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32)]);
    $$newPos[BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32)] := (if p1$2 then v119$2 else $$newPos[BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32)]);
    v120$1 := (if p1$1 then $$position$1bv32$1 else v120$1);
    v120$2 := (if p1$2 then $$position$1bv32$2 else v120$2);
    call {:sourceloc} {:sourceloc_num 226} _LOG_WRITE_$$newPos(p1$1, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 1bv32), v120$1, $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newPos(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 226} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 226} _CHECK_WRITE_$$newPos(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 1bv32), v120$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newPos"} true;
    $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 1bv32)] := (if p1$1 then v120$1 else $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 1bv32)]);
    $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 1bv32)] := (if p1$2 then v120$2 else $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 1bv32)]);
    v121$1 := (if p1$1 then $$position$2bv32$1 else v121$1);
    v121$2 := (if p1$2 then $$position$2bv32$2 else v121$2);
    call {:sourceloc} {:sourceloc_num 228} _LOG_WRITE_$$newPos(p1$1, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 2bv32), v121$1, $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newPos(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 228} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 228} _CHECK_WRITE_$$newPos(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 2bv32), v121$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newPos"} true;
    $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 2bv32)] := (if p1$1 then v121$1 else $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 2bv32)]);
    $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 2bv32)] := (if p1$2 then v121$2 else $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 2bv32)]);
    v122$1 := (if p1$1 then $$position$3bv32$1 else v122$1);
    v122$2 := (if p1$2 then $$position$3bv32$2 else v122$2);
    call {:sourceloc} {:sourceloc_num 230} _LOG_WRITE_$$newPos(p1$1, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 3bv32), v122$1, $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$newPos(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 230} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 230} _CHECK_WRITE_$$newPos(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 3bv32), v122$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$newPos"} true;
    $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 3bv32)] := (if p1$1 then v122$1 else $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 3bv32)]);
    $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 3bv32)] := (if p1$2 then v122$2 else $$newPos[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 3bv32)]);
    v123$1 := (if p1$1 then $$velocity$0bv32$1 else v123$1);
    v123$2 := (if p1$2 then $$velocity$0bv32$2 else v123$2);
    call {:sourceloc} {:sourceloc_num 232} _LOG_WRITE_$$vel(p1$1, BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), v123$1, $$vel[BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$vel(p1$2, BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 232} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 232} _CHECK_WRITE_$$vel(p1$2, BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), v123$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$vel"} true;
    $$vel[BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32)] := (if p1$1 then v123$1 else $$vel[BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32)]);
    $$vel[BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32)] := (if p1$2 then v123$2 else $$vel[BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32)]);
    v124$1 := (if p1$1 then $$velocity$1bv32$1 else v124$1);
    v124$2 := (if p1$2 then $$velocity$1bv32$2 else v124$2);
    call {:sourceloc} {:sourceloc_num 234} _LOG_WRITE_$$vel(p1$1, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 1bv32), v124$1, $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$vel(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 234} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 234} _CHECK_WRITE_$$vel(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 1bv32), v124$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$vel"} true;
    $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 1bv32)] := (if p1$1 then v124$1 else $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 1bv32)]);
    $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 1bv32)] := (if p1$2 then v124$2 else $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 1bv32)]);
    v125$1 := (if p1$1 then $$velocity$2bv32$1 else v125$1);
    v125$2 := (if p1$2 then $$velocity$2bv32$2 else v125$2);
    call {:sourceloc} {:sourceloc_num 236} _LOG_WRITE_$$vel(p1$1, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 2bv32), v125$1, $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$vel(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 236} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 236} _CHECK_WRITE_$$vel(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 2bv32), v125$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$vel"} true;
    $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 2bv32)] := (if p1$1 then v125$1 else $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 2bv32)]);
    $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 2bv32)] := (if p1$2 then v125$2 else $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 2bv32)]);
    v126$1 := (if p1$1 then $$velocity$3bv32$1 else v126$1);
    v126$2 := (if p1$2 then $$velocity$3bv32$2 else v126$2);
    call {:sourceloc} {:sourceloc_num 238} _LOG_WRITE_$$vel(p1$1, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 3bv32), v126$1, $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$vel(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 238} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 238} _CHECK_WRITE_$$vel(p1$2, BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 3bv32), v126$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$vel"} true;
    $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 3bv32)] := (if p1$1 then v126$1 else $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$1), 4bv32), 3bv32)]);
    $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 3bv32)] := (if p1$2 then v126$2 else $$vel[BV32_ADD(BV32_MUL(BV32_ADD($deviceOffset, v0$2), 4bv32), 3bv32)]);
    return;

  $3.backedge:
    assume {:backedge} p2$1 || p2$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto __partitioned_block_$3_0;

  $8.backedge:
    assume {:backedge} p6$1 || p6$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $8;
}



procedure {:source_name "rsqrtf"} $rsqrtf(_P$1: bool, $0$1: bv32, _P$2: bool, $0$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 56bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  requires {:barrier_divergence} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 == _P$2;
  modifies $$__smem, $$newPos, $$vel, _TRACKING;



procedure {:inline 1} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool);
  requires _P$1 ==> $0 == 1bv1;
  requires _P$2 ==> $0 == 1bv1;
  requires _P$1 ==> $1 == 1bv1;
  requires _P$2 ==> $1 == 1bv1;
  requires {:barrier_divergence} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 == _P$2;
  modifies $$__smem, $$newPos, $$vel, _TRACKING;



var $$0$0bv32$1: bv32;

var $$0$0bv32$2: bv32;

var $$0$1bv32$1: bv32;

var $$0$1bv32$2: bv32;

var $$0$2bv32$1: bv32;

var $$0$2bv32$2: bv32;

var $$ai.i.i.i$0bv32$1: bv32;

var $$ai.i.i.i$0bv32$2: bv32;

var $$ai.i.i.i$1bv32$1: bv32;

var $$ai.i.i.i$1bv32$2: bv32;

var $$ai.i.i.i$2bv32$1: bv32;

var $$ai.i.i.i$2bv32$2: bv32;

var $$bi.i.i.i$0bv32$1: bv32;

var $$bi.i.i.i$0bv32$2: bv32;

var $$bi.i.i.i$1bv32$1: bv32;

var $$bi.i.i.i$1bv32$2: bv32;

var $$bi.i.i.i$2bv32$1: bv32;

var $$bi.i.i.i$2bv32$2: bv32;

var $$bi.i.i.i$3bv32$1: bv32;

var $$bi.i.i.i$3bv32$2: bv32;

var $$bj.i.i.i$0bv32$1: bv32;

var $$bj.i.i.i$0bv32$2: bv32;

var $$bj.i.i.i$1bv32$1: bv32;

var $$bj.i.i.i$1bv32$2: bv32;

var $$bj.i.i.i$2bv32$1: bv32;

var $$bj.i.i.i$2bv32$2: bv32;

var $$bj.i.i.i$3bv32$1: bv32;

var $$bj.i.i.i$3bv32$2: bv32;

var $$r.i.i.i$0bv32$1: bv32;

var $$r.i.i.i$0bv32$2: bv32;

var $$r.i.i.i$1bv32$1: bv32;

var $$r.i.i.i$1bv32$2: bv32;

var $$r.i.i.i$2bv32$1: bv32;

var $$r.i.i.i$2bv32$2: bv32;

var $$1$0bv32$1: bv32;

var $$1$0bv32$2: bv32;

var $$1$1bv32$1: bv32;

var $$1$1bv32$2: bv32;

var $$1$2bv32$1: bv32;

var $$1$2bv32$2: bv32;

var $$iPos.i.i$0bv32$1: bv32;

var $$iPos.i.i$0bv32$2: bv32;

var $$iPos.i.i$1bv32$1: bv32;

var $$iPos.i.i$1bv32$2: bv32;

var $$iPos.i.i$2bv32$1: bv32;

var $$iPos.i.i$2bv32$2: bv32;

var $$iPos.i.i$3bv32$1: bv32;

var $$iPos.i.i$3bv32$2: bv32;

var $$accel.i.i$0bv32$1: bv32;

var $$accel.i.i$0bv32$2: bv32;

var $$accel.i.i$1bv32$1: bv32;

var $$accel.i.i$1bv32$2: bv32;

var $$accel.i.i$2bv32$1: bv32;

var $$accel.i.i$2bv32$2: bv32;

var $$2$0bv32$1: bv32;

var $$2$0bv32$2: bv32;

var $$2$1bv32$1: bv32;

var $$2$1bv32$2: bv32;

var $$2$2bv32$1: bv32;

var $$2$2bv32$2: bv32;

var $$3$0bv32$1: bv32;

var $$3$0bv32$2: bv32;

var $$3$1bv32$1: bv32;

var $$3$1bv32$2: bv32;

var $$3$2bv32$1: bv32;

var $$3$2bv32$2: bv32;

var $$4$0bv32$1: bv32;

var $$4$0bv32$2: bv32;

var $$4$1bv32$1: bv32;

var $$4$1bv32$2: bv32;

var $$4$2bv32$1: bv32;

var $$4$2bv32$2: bv32;

var $$4$3bv32$1: bv32;

var $$4$3bv32$2: bv32;

var $$5$0bv32$1: bv32;

var $$5$0bv32$2: bv32;

var $$5$1bv32$1: bv32;

var $$5$1bv32$2: bv32;

var $$5$2bv32$1: bv32;

var $$5$2bv32$2: bv32;

var $$5$3bv32$1: bv32;

var $$5$3bv32$2: bv32;

var $$6$0bv32$1: bv32;

var $$6$0bv32$2: bv32;

var $$6$1bv32$1: bv32;

var $$6$1bv32$2: bv32;

var $$6$2bv32$1: bv32;

var $$6$2bv32$2: bv32;

var $$bodyPos.i$0bv32$1: bv32;

var $$bodyPos.i$0bv32$2: bv32;

var $$bodyPos.i$1bv32$1: bv32;

var $$bodyPos.i$1bv32$2: bv32;

var $$bodyPos.i$2bv32$1: bv32;

var $$bodyPos.i$2bv32$2: bv32;

var $$bodyPos.i$3bv32$1: bv32;

var $$bodyPos.i$3bv32$2: bv32;

var $$7$0bv32$1: bv32;

var $$7$0bv32$2: bv32;

var $$7$1bv32$1: bv32;

var $$7$1bv32$2: bv32;

var $$7$2bv32$1: bv32;

var $$7$2bv32$2: bv32;

var $$8$0bv32$1: bv32;

var $$8$0bv32$2: bv32;

var $$8$1bv32$1: bv32;

var $$8$1bv32$2: bv32;

var $$8$2bv32$1: bv32;

var $$8$2bv32$2: bv32;

var $$8$3bv32$1: bv32;

var $$8$3bv32$2: bv32;

var $$9$0bv32$1: bv32;

var $$9$0bv32$2: bv32;

var $$9$1bv32$1: bv32;

var $$9$1bv32$2: bv32;

var $$9$2bv32$1: bv32;

var $$9$2bv32$2: bv32;

var $$position$0bv32$1: bv32;

var $$position$0bv32$2: bv32;

var $$position$1bv32$1: bv32;

var $$position$1bv32$2: bv32;

var $$position$2bv32$1: bv32;

var $$position$2bv32$2: bv32;

var $$position$3bv32$1: bv32;

var $$position$3bv32$2: bv32;

var $$accel$0bv32$1: bv32;

var $$accel$0bv32$2: bv32;

var $$accel$1bv32$1: bv32;

var $$accel$1bv32$2: bv32;

var $$accel$2bv32$1: bv32;

var $$accel$2bv32$2: bv32;

var $$10$0bv32$1: bv32;

var $$10$0bv32$2: bv32;

var $$10$1bv32$1: bv32;

var $$10$1bv32$2: bv32;

var $$10$2bv32$1: bv32;

var $$10$2bv32$2: bv32;

var $$10$3bv32$1: bv32;

var $$10$3bv32$2: bv32;

var $$velocity$0bv32$1: bv32;

var $$velocity$0bv32$2: bv32;

var $$velocity$1bv32$1: bv32;

var $$velocity$1bv32$2: bv32;

var $$velocity$2bv32$1: bv32;

var $$velocity$2bv32$2: bv32;

var $$velocity$3bv32$1: bv32;

var $$velocity$3bv32$2: bv32;

const _WATCHED_VALUE_$$newPos: bv32;

procedure {:inline 1} _LOG_READ_$$newPos(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$newPos;



implementation {:inline 1} _LOG_READ_$$newPos(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$newPos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newPos == _value then true else _READ_HAS_OCCURRED_$$newPos);
    return;
}



procedure _CHECK_READ_$$newPos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "newPos"} {:array "$$newPos"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$newPos && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$newPos);
  requires {:source_name "newPos"} {:array "$$newPos"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$newPos && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$newPos: bool;

procedure {:inline 1} _LOG_WRITE_$$newPos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$newPos, _WRITE_READ_BENIGN_FLAG_$$newPos;



implementation {:inline 1} _LOG_WRITE_$$newPos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$newPos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newPos == _value then true else _WRITE_HAS_OCCURRED_$$newPos);
    _WRITE_READ_BENIGN_FLAG_$$newPos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newPos == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$newPos);
    return;
}



procedure _CHECK_WRITE_$$newPos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "newPos"} {:array "$$newPos"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$newPos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newPos != _value);
  requires {:source_name "newPos"} {:array "$$newPos"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$newPos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$newPos != _value);
  requires {:source_name "newPos"} {:array "$$newPos"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$newPos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$newPos(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$newPos;



implementation {:inline 1} _LOG_ATOMIC_$$newPos(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$newPos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$newPos);
    return;
}



procedure _CHECK_ATOMIC_$$newPos(_P: bool, _offset: bv32);
  requires {:source_name "newPos"} {:array "$$newPos"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$newPos && _WATCHED_OFFSET == _offset);
  requires {:source_name "newPos"} {:array "$$newPos"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$newPos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$newPos(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$newPos;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$newPos(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$newPos := (if _P && _WRITE_HAS_OCCURRED_$$newPos && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$newPos);
    return;
}



const _WATCHED_VALUE_$$oldPos: bv32;

procedure {:inline 1} _LOG_READ_$$oldPos(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$oldPos;



implementation {:inline 1} _LOG_READ_$$oldPos(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$oldPos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$oldPos == _value then true else _READ_HAS_OCCURRED_$$oldPos);
    return;
}



procedure _CHECK_READ_$$oldPos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "oldPos"} {:array "$$oldPos"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$oldPos && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$oldPos);
  requires {:source_name "oldPos"} {:array "$$oldPos"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$oldPos && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$oldPos: bool;

procedure {:inline 1} _LOG_WRITE_$$oldPos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$oldPos, _WRITE_READ_BENIGN_FLAG_$$oldPos;



implementation {:inline 1} _LOG_WRITE_$$oldPos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$oldPos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$oldPos == _value then true else _WRITE_HAS_OCCURRED_$$oldPos);
    _WRITE_READ_BENIGN_FLAG_$$oldPos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$oldPos == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$oldPos);
    return;
}



procedure _CHECK_WRITE_$$oldPos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "oldPos"} {:array "$$oldPos"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$oldPos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$oldPos != _value);
  requires {:source_name "oldPos"} {:array "$$oldPos"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$oldPos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$oldPos != _value);
  requires {:source_name "oldPos"} {:array "$$oldPos"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$oldPos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$oldPos(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$oldPos;



implementation {:inline 1} _LOG_ATOMIC_$$oldPos(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$oldPos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$oldPos);
    return;
}



procedure _CHECK_ATOMIC_$$oldPos(_P: bool, _offset: bv32);
  requires {:source_name "oldPos"} {:array "$$oldPos"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$oldPos && _WATCHED_OFFSET == _offset);
  requires {:source_name "oldPos"} {:array "$$oldPos"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$oldPos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$oldPos(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$oldPos;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$oldPos(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$oldPos := (if _P && _WRITE_HAS_OCCURRED_$$oldPos && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$oldPos);
    return;
}



const _WATCHED_VALUE_$$vel: bv32;

procedure {:inline 1} _LOG_READ_$$vel(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$vel;



implementation {:inline 1} _LOG_READ_$$vel(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vel == _value then true else _READ_HAS_OCCURRED_$$vel);
    return;
}



procedure _CHECK_READ_$$vel(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vel"} {:array "$$vel"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$vel && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$vel);
  requires {:source_name "vel"} {:array "$$vel"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$vel && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$vel: bool;

procedure {:inline 1} _LOG_WRITE_$$vel(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$vel, _WRITE_READ_BENIGN_FLAG_$$vel;



implementation {:inline 1} _LOG_WRITE_$$vel(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vel == _value then true else _WRITE_HAS_OCCURRED_$$vel);
    _WRITE_READ_BENIGN_FLAG_$$vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vel == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$vel);
    return;
}



procedure _CHECK_WRITE_$$vel(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vel"} {:array "$$vel"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$vel && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vel != _value);
  requires {:source_name "vel"} {:array "$$vel"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$vel && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vel != _value);
  requires {:source_name "vel"} {:array "$$vel"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$vel && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$vel(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$vel;



implementation {:inline 1} _LOG_ATOMIC_$$vel(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$vel := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$vel);
    return;
}



procedure _CHECK_ATOMIC_$$vel(_P: bool, _offset: bv32);
  requires {:source_name "vel"} {:array "$$vel"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$vel && _WATCHED_OFFSET == _offset);
  requires {:source_name "vel"} {:array "$$vel"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$vel && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vel(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$vel;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vel(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$vel := (if _P && _WRITE_HAS_OCCURRED_$$vel && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$vel);
    return;
}



const _WATCHED_VALUE_$$__smem: bv32;

procedure {:inline 1} _LOG_READ_$$__smem(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$__smem;



implementation {:inline 1} _LOG_READ_$$__smem(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$__smem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$__smem == _value then true else _READ_HAS_OCCURRED_$$__smem);
    return;
}



procedure _CHECK_READ_$$__smem(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "__smem"} {:array "$$__smem"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$__smem && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$__smem && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "__smem"} {:array "$$__smem"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$__smem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$__smem: bool;

procedure {:inline 1} _LOG_WRITE_$$__smem(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$__smem, _WRITE_READ_BENIGN_FLAG_$$__smem;



implementation {:inline 1} _LOG_WRITE_$$__smem(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$__smem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$__smem == _value then true else _WRITE_HAS_OCCURRED_$$__smem);
    _WRITE_READ_BENIGN_FLAG_$$__smem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$__smem == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$__smem);
    return;
}



procedure _CHECK_WRITE_$$__smem(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "__smem"} {:array "$$__smem"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$__smem && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$__smem != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "__smem"} {:array "$$__smem"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$__smem && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$__smem != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "__smem"} {:array "$$__smem"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$__smem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$__smem(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$__smem;



implementation {:inline 1} _LOG_ATOMIC_$$__smem(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$__smem := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$__smem);
    return;
}



procedure _CHECK_ATOMIC_$$__smem(_P: bool, _offset: bv32);
  requires {:source_name "__smem"} {:array "$$__smem"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$__smem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "__smem"} {:array "$$__smem"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$__smem && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$__smem(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$__smem;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$__smem(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$__smem := (if _P && _WRITE_HAS_OCCURRED_$$__smem && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$__smem);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$__smem;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$__smem;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$__smem;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$newPos;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$newPos;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$newPos;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$vel;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$vel;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$vel;
    goto anon5;

  anon5:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$newPos;
    goto anon7;

  anon7:
    havoc $$vel;
    goto anon8;

  anon10_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$__smem;
    goto anon3;

  anon9_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1, _P$1: bool, _P$2: bool)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !((!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2)));
    goto anon0;

  anon0:
    assume _P$1 && $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$__smem;
    assume _P$1 && $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$__smem;
    assume _P$1 && $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$__smem;
    goto anon1;

  anon1:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !((_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1));
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$newPos;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$newPos;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$newPos;
    goto anon4;

  anon4:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$vel;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$vel;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> _P$1 && $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$vel;
    goto anon5;

  anon5:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _P$1 && _P$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$newPos;
    goto anon7;

  anon7:
    havoc $$vel;
    goto anon8;

  anon10_Then:
    assume {:partition} (_P$1 && $0 != 0bv1) || (_P$2 && $0 != 0bv1);
    havoc $$__smem;
    goto anon3;

  anon9_Then:
    assume {:partition} (!_P$1 && !_P$2) || (group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && (!_P$1 || !_P$2));
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
