type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "gridParticleHash"} {:global} $$gridParticleHash: [bv32]bv32;

axiom {:array_info "$$gridParticleHash"} {:global} {:elem_width 32} {:source_name "gridParticleHash"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$gridParticleHash: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$gridParticleHash: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$gridParticleHash: bool;

var {:source_name "gridParticleIndex"} {:global} $$gridParticleIndex: [bv32]bv32;

axiom {:array_info "$$gridParticleIndex"} {:global} {:elem_width 32} {:source_name "gridParticleIndex"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$gridParticleIndex: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$gridParticleIndex: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$gridParticleIndex: bool;

axiom {:array_info "$$pos"} {:global} {:elem_width 32} {:source_name "pos"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$pos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$pos: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$pos: bool;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$p.i"} {:elem_width 32} {:source_name "p.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$gridPos.i"} {:elem_width 32} {:source_name "gridPos.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$p"} {:elem_width 32} {:source_name "p"} {:source_elem_width 128} {:source_dimensions "1"} true;

axiom {:array_info "$$gridPos"} {:elem_width 32} {:source_name "gridPos"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:source_name "params"} {:constant} $$params$1: [bv32]bv8;

var {:source_name "params"} {:constant} $$params$2: [bv32]bv8;

axiom {:array_info "$$params"} {:constant} {:elem_width 8} {:source_name "params"} {:source_elem_width 832} {:source_dimensions "1"} true;

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

function FDIV32(bv32, bv32) : bv32;

function FP32_CONV64(bv32) : bv64;

function FP64_TO_SI32(bv64) : bv32;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

procedure {:source_name "calcHashD"} {:kernel} $_Z9calcHashDPjS_P6float4j($numParticles: bv32);
  requires !_READ_HAS_OCCURRED_$$gridParticleHash && !_WRITE_HAS_OCCURRED_$$gridParticleHash && !_ATOMIC_HAS_OCCURRED_$$gridParticleHash;
  requires !_READ_HAS_OCCURRED_$$gridParticleIndex && !_WRITE_HAS_OCCURRED_$$gridParticleIndex && !_ATOMIC_HAS_OCCURRED_$$gridParticleIndex;
  requires !_READ_HAS_OCCURRED_$$pos && !_WRITE_HAS_OCCURRED_$$pos && !_ATOMIC_HAS_OCCURRED_$$pos;
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
  modifies _WRITE_HAS_OCCURRED_$$gridParticleHash, _WRITE_READ_BENIGN_FLAG_$$gridParticleHash, _WRITE_READ_BENIGN_FLAG_$$gridParticleHash, _WRITE_HAS_OCCURRED_$$gridParticleIndex, _WRITE_READ_BENIGN_FLAG_$$gridParticleIndex, _WRITE_READ_BENIGN_FLAG_$$gridParticleIndex;



implementation {:source_name "calcHashD"} {:kernel} $_Z9calcHashDPjS_P6float4j($numParticles: bv32)
{
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
  var v21$1: bv8;
  var v21$2: bv8;
  var v22$1: bv8;
  var v22$2: bv8;
  var v23$1: bv8;
  var v23$2: bv8;
  var v24$1: bv64;
  var v24$2: bv64;
  var v25$1: bv32;
  var v25$2: bv32;
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
  var v34$1: bv64;
  var v34$2: bv64;
  var v35$1: bv32;
  var v35$2: bv32;
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
  var v44$1: bv64;
  var v44$2: bv64;
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
  var v60$1: bv8;
  var v60$2: bv8;
  var v61$1: bv8;
  var v61$2: bv8;
  var v62$1: bv8;
  var v62$2: bv8;
  var v63$1: bv8;
  var v63$2: bv8;
  var v64$1: bv32;
  var v64$2: bv32;
  var v65$1: bv8;
  var v65$2: bv8;
  var v66$1: bv8;
  var v66$2: bv8;
  var v67$1: bv8;
  var v67$2: bv8;
  var v68$1: bv8;
  var v68$2: bv8;
  var v69$1: bv32;
  var v69$2: bv32;
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
  var v77$1: bv8;
  var v77$2: bv8;
  var v78$1: bv32;
  var v78$2: bv32;
  var v79$1: bv8;
  var v79$2: bv8;
  var v80$1: bv8;
  var v80$2: bv8;
  var v81$1: bv8;
  var v81$2: bv8;
  var v82$1: bv8;
  var v82$2: bv8;
  var v83$1: bv32;
  var v83$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_UGE(v0$1, $numParticles);
    v1$2 := BV32_UGE(v0$2, $numParticles);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p1$1 := (if !v1$1 then !v1$1 else p1$1);
    p1$2 := (if !v1$2 then !v1$2 else p1$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v2$1 := (if p1$1 then _HAVOC_bv32$1 else v2$1);
    v2$2 := (if p1$2 then _HAVOC_bv32$2 else v2$2);
    $$p$0bv32$1 := (if p1$1 then v2$1 else $$p$0bv32$1);
    $$p$0bv32$2 := (if p1$2 then v2$2 else $$p$0bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p1$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p1$2 then _HAVOC_bv32$2 else v3$2);
    $$p$1bv32$1 := (if p1$1 then v3$1 else $$p$1bv32$1);
    $$p$1bv32$2 := (if p1$2 then v3$2 else $$p$1bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v4$1 := (if p1$1 then _HAVOC_bv32$1 else v4$1);
    v4$2 := (if p1$2 then _HAVOC_bv32$2 else v4$2);
    $$p$2bv32$1 := (if p1$1 then v4$1 else $$p$2bv32$1);
    $$p$2bv32$2 := (if p1$2 then v4$2 else $$p$2bv32$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v5$1 := (if p1$1 then _HAVOC_bv32$1 else v5$1);
    v5$2 := (if p1$2 then _HAVOC_bv32$2 else v5$2);
    $$p$3bv32$1 := (if p1$1 then v5$1 else $$p$3bv32$1);
    $$p$3bv32$2 := (if p1$2 then v5$2 else $$p$3bv32$2);
    v6$1 := (if p1$1 then $$p$0bv32$1 else v6$1);
    v6$2 := (if p1$2 then $$p$0bv32$2 else v6$2);
    v7$1 := (if p1$1 then $$p$1bv32$1 else v7$1);
    v7$2 := (if p1$2 then $$p$1bv32$2 else v7$2);
    v8$1 := (if p1$1 then $$p$2bv32$1 else v8$1);
    v8$2 := (if p1$2 then $$p$2bv32$2 else v8$2);
    $$0$0bv32$1 := (if p1$1 then v6$1 else $$0$0bv32$1);
    $$0$0bv32$2 := (if p1$2 then v6$2 else $$0$0bv32$2);
    $$0$1bv32$1 := (if p1$1 then v7$1 else $$0$1bv32$1);
    $$0$1bv32$2 := (if p1$2 then v7$2 else $$0$1bv32$2);
    $$0$2bv32$1 := (if p1$1 then v8$1 else $$0$2bv32$1);
    $$0$2bv32$2 := (if p1$2 then v8$2 else $$0$2bv32$2);
    v9$1 := (if p1$1 then $$0$0bv32$1 else v9$1);
    v9$2 := (if p1$2 then $$0$0bv32$2 else v9$2);
    v10$1 := (if p1$1 then $$0$1bv32$1 else v10$1);
    v10$2 := (if p1$2 then $$0$1bv32$2 else v10$2);
    v11$1 := (if p1$1 then $$0$2bv32$1 else v11$1);
    v11$2 := (if p1$2 then $$0$2bv32$2 else v11$2);
    $$2$0bv32$1 := (if p1$1 then v9$1 else $$2$0bv32$1);
    $$2$0bv32$2 := (if p1$2 then v9$2 else $$2$0bv32$2);
    $$2$1bv32$1 := (if p1$1 then v10$1 else $$2$1bv32$1);
    $$2$1bv32$2 := (if p1$2 then v10$2 else $$2$1bv32$2);
    $$2$2bv32$1 := (if p1$1 then v11$1 else $$2$2bv32$1);
    $$2$2bv32$2 := (if p1$2 then v11$2 else $$2$2bv32$2);
    v12$1 := (if p1$1 then $$2$0bv32$1 else v12$1);
    v12$2 := (if p1$2 then $$2$0bv32$2 else v12$2);
    v13$1 := (if p1$1 then $$2$1bv32$1 else v13$1);
    v13$2 := (if p1$2 then $$2$1bv32$2 else v13$2);
    v14$1 := (if p1$1 then $$2$2bv32$1 else v14$1);
    v14$2 := (if p1$2 then $$2$2bv32$2 else v14$2);
    $$p.i$0bv32$1 := (if p1$1 then v12$1 else $$p.i$0bv32$1);
    $$p.i$0bv32$2 := (if p1$2 then v12$2 else $$p.i$0bv32$2);
    $$p.i$1bv32$1 := (if p1$1 then v13$1 else $$p.i$1bv32$1);
    $$p.i$1bv32$2 := (if p1$2 then v13$2 else $$p.i$1bv32$2);
    $$p.i$2bv32$1 := (if p1$1 then v14$1 else $$p.i$2bv32$1);
    $$p.i$2bv32$2 := (if p1$2 then v14$2 else $$p.i$2bv32$2);
    v15$1 := (if p1$1 then $$p.i$0bv32$1 else v15$1);
    v15$2 := (if p1$2 then $$p.i$0bv32$2 else v15$2);
    v16$1 := (if p1$1 then $$params$1[52bv32] else v16$1);
    v16$2 := (if p1$2 then $$params$2[52bv32] else v16$2);
    v17$1 := (if p1$1 then $$params$1[53bv32] else v17$1);
    v17$2 := (if p1$2 then $$params$2[53bv32] else v17$2);
    v18$1 := (if p1$1 then $$params$1[54bv32] else v18$1);
    v18$2 := (if p1$2 then $$params$2[54bv32] else v18$2);
    v19$1 := (if p1$1 then $$params$1[55bv32] else v19$1);
    v19$2 := (if p1$2 then $$params$2[55bv32] else v19$2);
    v20$1 := (if p1$1 then $$params$1[64bv32] else v20$1);
    v20$2 := (if p1$2 then $$params$2[64bv32] else v20$2);
    v21$1 := (if p1$1 then $$params$1[65bv32] else v21$1);
    v21$2 := (if p1$2 then $$params$2[65bv32] else v21$2);
    v22$1 := (if p1$1 then $$params$1[66bv32] else v22$1);
    v22$2 := (if p1$2 then $$params$2[66bv32] else v22$2);
    v23$1 := (if p1$1 then $$params$1[67bv32] else v23$1);
    v23$2 := (if p1$2 then $$params$2[67bv32] else v23$2);
    call {:sourceloc_num 38} v24$1, v24$2 := $floor(p1$1, FP32_CONV64(FDIV32(FSUB32(v15$1, v19$1 ++ v18$1 ++ v17$1 ++ v16$1), v23$1 ++ v22$1 ++ v21$1 ++ v20$1)), p1$2, FP32_CONV64(FDIV32(FSUB32(v15$2, v19$2 ++ v18$2 ++ v17$2 ++ v16$2), v23$2 ++ v22$2 ++ v21$2 ++ v20$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "$floor"} true;
    $$1$0bv32$1 := (if p1$1 then FP64_TO_SI32(v24$1) else $$1$0bv32$1);
    $$1$0bv32$2 := (if p1$2 then FP64_TO_SI32(v24$2) else $$1$0bv32$2);
    v25$1 := (if p1$1 then $$p.i$1bv32$1 else v25$1);
    v25$2 := (if p1$2 then $$p.i$1bv32$2 else v25$2);
    v26$1 := (if p1$1 then $$params$1[56bv32] else v26$1);
    v26$2 := (if p1$2 then $$params$2[56bv32] else v26$2);
    v27$1 := (if p1$1 then $$params$1[57bv32] else v27$1);
    v27$2 := (if p1$2 then $$params$2[57bv32] else v27$2);
    v28$1 := (if p1$1 then $$params$1[58bv32] else v28$1);
    v28$2 := (if p1$2 then $$params$2[58bv32] else v28$2);
    v29$1 := (if p1$1 then $$params$1[59bv32] else v29$1);
    v29$2 := (if p1$2 then $$params$2[59bv32] else v29$2);
    v30$1 := (if p1$1 then $$params$1[68bv32] else v30$1);
    v30$2 := (if p1$2 then $$params$2[68bv32] else v30$2);
    v31$1 := (if p1$1 then $$params$1[69bv32] else v31$1);
    v31$2 := (if p1$2 then $$params$2[69bv32] else v31$2);
    v32$1 := (if p1$1 then $$params$1[70bv32] else v32$1);
    v32$2 := (if p1$2 then $$params$2[70bv32] else v32$2);
    v33$1 := (if p1$1 then $$params$1[71bv32] else v33$1);
    v33$2 := (if p1$2 then $$params$2[71bv32] else v33$2);
    call {:sourceloc_num 49} v34$1, v34$2 := $floor(p1$1, FP32_CONV64(FDIV32(FSUB32(v25$1, v29$1 ++ v28$1 ++ v27$1 ++ v26$1), v33$1 ++ v32$1 ++ v31$1 ++ v30$1)), p1$2, FP32_CONV64(FDIV32(FSUB32(v25$2, v29$2 ++ v28$2 ++ v27$2 ++ v26$2), v33$2 ++ v32$2 ++ v31$2 ++ v30$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "$floor"} true;
    $$1$1bv32$1 := (if p1$1 then FP64_TO_SI32(v34$1) else $$1$1bv32$1);
    $$1$1bv32$2 := (if p1$2 then FP64_TO_SI32(v34$2) else $$1$1bv32$2);
    v35$1 := (if p1$1 then $$p.i$2bv32$1 else v35$1);
    v35$2 := (if p1$2 then $$p.i$2bv32$2 else v35$2);
    v36$1 := (if p1$1 then $$params$1[60bv32] else v36$1);
    v36$2 := (if p1$2 then $$params$2[60bv32] else v36$2);
    v37$1 := (if p1$1 then $$params$1[61bv32] else v37$1);
    v37$2 := (if p1$2 then $$params$2[61bv32] else v37$2);
    v38$1 := (if p1$1 then $$params$1[62bv32] else v38$1);
    v38$2 := (if p1$2 then $$params$2[62bv32] else v38$2);
    v39$1 := (if p1$1 then $$params$1[63bv32] else v39$1);
    v39$2 := (if p1$2 then $$params$2[63bv32] else v39$2);
    v40$1 := (if p1$1 then $$params$1[72bv32] else v40$1);
    v40$2 := (if p1$2 then $$params$2[72bv32] else v40$2);
    v41$1 := (if p1$1 then $$params$1[73bv32] else v41$1);
    v41$2 := (if p1$2 then $$params$2[73bv32] else v41$2);
    v42$1 := (if p1$1 then $$params$1[74bv32] else v42$1);
    v42$2 := (if p1$2 then $$params$2[74bv32] else v42$2);
    v43$1 := (if p1$1 then $$params$1[75bv32] else v43$1);
    v43$2 := (if p1$2 then $$params$2[75bv32] else v43$2);
    call {:sourceloc_num 60} v44$1, v44$2 := $floor(p1$1, FP32_CONV64(FDIV32(FSUB32(v35$1, v39$1 ++ v38$1 ++ v37$1 ++ v36$1), v43$1 ++ v42$1 ++ v41$1 ++ v40$1)), p1$2, FP32_CONV64(FDIV32(FSUB32(v35$2, v39$2 ++ v38$2 ++ v37$2 ++ v36$2), v43$2 ++ v42$2 ++ v41$2 ++ v40$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "$floor"} true;
    $$1$2bv32$1 := (if p1$1 then FP64_TO_SI32(v44$1) else $$1$2bv32$1);
    $$1$2bv32$2 := (if p1$2 then FP64_TO_SI32(v44$2) else $$1$2bv32$2);
    v45$1 := (if p1$1 then $$1$0bv32$1 else v45$1);
    v45$2 := (if p1$2 then $$1$0bv32$2 else v45$2);
    v46$1 := (if p1$1 then $$1$1bv32$1 else v46$1);
    v46$2 := (if p1$2 then $$1$1bv32$2 else v46$2);
    v47$1 := (if p1$1 then $$1$2bv32$1 else v47$1);
    v47$2 := (if p1$2 then $$1$2bv32$2 else v47$2);
    $$gridPos$0bv32$1 := (if p1$1 then v45$1 else $$gridPos$0bv32$1);
    $$gridPos$0bv32$2 := (if p1$2 then v45$2 else $$gridPos$0bv32$2);
    $$gridPos$1bv32$1 := (if p1$1 then v46$1 else $$gridPos$1bv32$1);
    $$gridPos$1bv32$2 := (if p1$2 then v46$2 else $$gridPos$1bv32$2);
    $$gridPos$2bv32$1 := (if p1$1 then v47$1 else $$gridPos$2bv32$1);
    $$gridPos$2bv32$2 := (if p1$2 then v47$2 else $$gridPos$2bv32$2);
    v48$1 := (if p1$1 then $$gridPos$0bv32$1 else v48$1);
    v48$2 := (if p1$2 then $$gridPos$0bv32$2 else v48$2);
    $$3$0bv32$1 := (if p1$1 then v48$1 else $$3$0bv32$1);
    $$3$0bv32$2 := (if p1$2 then v48$2 else $$3$0bv32$2);
    v49$1 := (if p1$1 then $$gridPos$1bv32$1 else v49$1);
    v49$2 := (if p1$2 then $$gridPos$1bv32$2 else v49$2);
    $$3$1bv32$1 := (if p1$1 then v49$1 else $$3$1bv32$1);
    $$3$1bv32$2 := (if p1$2 then v49$2 else $$3$1bv32$2);
    v50$1 := (if p1$1 then $$gridPos$2bv32$1 else v50$1);
    v50$2 := (if p1$2 then $$gridPos$2bv32$2 else v50$2);
    $$3$2bv32$1 := (if p1$1 then v50$1 else $$3$2bv32$1);
    $$3$2bv32$2 := (if p1$2 then v50$2 else $$3$2bv32$2);
    v51$1 := (if p1$1 then $$3$0bv32$1 else v51$1);
    v51$2 := (if p1$2 then $$3$0bv32$2 else v51$2);
    v52$1 := (if p1$1 then $$3$1bv32$1 else v52$1);
    v52$2 := (if p1$2 then $$3$1bv32$2 else v52$2);
    v53$1 := (if p1$1 then $$3$2bv32$1 else v53$1);
    v53$2 := (if p1$2 then $$3$2bv32$2 else v53$2);
    $$gridPos.i$0bv32$1 := (if p1$1 then v51$1 else $$gridPos.i$0bv32$1);
    $$gridPos.i$0bv32$2 := (if p1$2 then v51$2 else $$gridPos.i$0bv32$2);
    $$gridPos.i$1bv32$1 := (if p1$1 then v52$1 else $$gridPos.i$1bv32$1);
    $$gridPos.i$1bv32$2 := (if p1$2 then v52$2 else $$gridPos.i$1bv32$2);
    $$gridPos.i$2bv32$1 := (if p1$1 then v53$1 else $$gridPos.i$2bv32$1);
    $$gridPos.i$2bv32$2 := (if p1$2 then v53$2 else $$gridPos.i$2bv32$2);
    v54$1 := (if p1$1 then $$gridPos.i$0bv32$1 else v54$1);
    v54$2 := (if p1$2 then $$gridPos.i$0bv32$2 else v54$2);
    v55$1 := (if p1$1 then $$params$1[36bv32] else v55$1);
    v55$2 := (if p1$2 then $$params$2[36bv32] else v55$2);
    v56$1 := (if p1$1 then $$params$1[37bv32] else v56$1);
    v56$2 := (if p1$2 then $$params$2[37bv32] else v56$2);
    v57$1 := (if p1$1 then $$params$1[38bv32] else v57$1);
    v57$2 := (if p1$2 then $$params$2[38bv32] else v57$2);
    v58$1 := (if p1$1 then $$params$1[39bv32] else v58$1);
    v58$2 := (if p1$2 then $$params$2[39bv32] else v58$2);
    $$gridPos.i$0bv32$1 := (if p1$1 then BV32_AND(v54$1, BV32_SUB(v58$1 ++ v57$1 ++ v56$1 ++ v55$1, 1bv32)) else $$gridPos.i$0bv32$1);
    $$gridPos.i$0bv32$2 := (if p1$2 then BV32_AND(v54$2, BV32_SUB(v58$2 ++ v57$2 ++ v56$2 ++ v55$2, 1bv32)) else $$gridPos.i$0bv32$2);
    v59$1 := (if p1$1 then $$gridPos.i$1bv32$1 else v59$1);
    v59$2 := (if p1$2 then $$gridPos.i$1bv32$2 else v59$2);
    v60$1 := (if p1$1 then $$params$1[40bv32] else v60$1);
    v60$2 := (if p1$2 then $$params$2[40bv32] else v60$2);
    v61$1 := (if p1$1 then $$params$1[41bv32] else v61$1);
    v61$2 := (if p1$2 then $$params$2[41bv32] else v61$2);
    v62$1 := (if p1$1 then $$params$1[42bv32] else v62$1);
    v62$2 := (if p1$2 then $$params$2[42bv32] else v62$2);
    v63$1 := (if p1$1 then $$params$1[43bv32] else v63$1);
    v63$2 := (if p1$2 then $$params$2[43bv32] else v63$2);
    $$gridPos.i$1bv32$1 := (if p1$1 then BV32_AND(v59$1, BV32_SUB(v63$1 ++ v62$1 ++ v61$1 ++ v60$1, 1bv32)) else $$gridPos.i$1bv32$1);
    $$gridPos.i$1bv32$2 := (if p1$2 then BV32_AND(v59$2, BV32_SUB(v63$2 ++ v62$2 ++ v61$2 ++ v60$2, 1bv32)) else $$gridPos.i$1bv32$2);
    v64$1 := (if p1$1 then $$gridPos.i$2bv32$1 else v64$1);
    v64$2 := (if p1$2 then $$gridPos.i$2bv32$2 else v64$2);
    v65$1 := (if p1$1 then $$params$1[44bv32] else v65$1);
    v65$2 := (if p1$2 then $$params$2[44bv32] else v65$2);
    v66$1 := (if p1$1 then $$params$1[45bv32] else v66$1);
    v66$2 := (if p1$2 then $$params$2[45bv32] else v66$2);
    v67$1 := (if p1$1 then $$params$1[46bv32] else v67$1);
    v67$2 := (if p1$2 then $$params$2[46bv32] else v67$2);
    v68$1 := (if p1$1 then $$params$1[47bv32] else v68$1);
    v68$2 := (if p1$2 then $$params$2[47bv32] else v68$2);
    $$gridPos.i$2bv32$1 := (if p1$1 then BV32_AND(v64$1, BV32_SUB(v68$1 ++ v67$1 ++ v66$1 ++ v65$1, 1bv32)) else $$gridPos.i$2bv32$1);
    $$gridPos.i$2bv32$2 := (if p1$2 then BV32_AND(v64$2, BV32_SUB(v68$2 ++ v67$2 ++ v66$2 ++ v65$2, 1bv32)) else $$gridPos.i$2bv32$2);
    v69$1 := (if p1$1 then $$gridPos.i$2bv32$1 else v69$1);
    v69$2 := (if p1$2 then $$gridPos.i$2bv32$2 else v69$2);
    v70$1 := (if p1$1 then $$params$1[40bv32] else v70$1);
    v70$2 := (if p1$2 then $$params$2[40bv32] else v70$2);
    v71$1 := (if p1$1 then $$params$1[41bv32] else v71$1);
    v71$2 := (if p1$2 then $$params$2[41bv32] else v71$2);
    v72$1 := (if p1$1 then $$params$1[42bv32] else v72$1);
    v72$2 := (if p1$2 then $$params$2[42bv32] else v72$2);
    v73$1 := (if p1$1 then $$params$1[43bv32] else v73$1);
    v73$2 := (if p1$2 then $$params$2[43bv32] else v73$2);
    v74$1 := (if p1$1 then $$params$1[36bv32] else v74$1);
    v74$2 := (if p1$2 then $$params$2[36bv32] else v74$2);
    v75$1 := (if p1$1 then $$params$1[37bv32] else v75$1);
    v75$2 := (if p1$2 then $$params$2[37bv32] else v75$2);
    v76$1 := (if p1$1 then $$params$1[38bv32] else v76$1);
    v76$2 := (if p1$2 then $$params$2[38bv32] else v76$2);
    v77$1 := (if p1$1 then $$params$1[39bv32] else v77$1);
    v77$2 := (if p1$2 then $$params$2[39bv32] else v77$2);
    v78$1 := (if p1$1 then $$gridPos.i$1bv32$1 else v78$1);
    v78$2 := (if p1$2 then $$gridPos.i$1bv32$2 else v78$2);
    v79$1 := (if p1$1 then $$params$1[36bv32] else v79$1);
    v79$2 := (if p1$2 then $$params$2[36bv32] else v79$2);
    v80$1 := (if p1$1 then $$params$1[37bv32] else v80$1);
    v80$2 := (if p1$2 then $$params$2[37bv32] else v80$2);
    v81$1 := (if p1$1 then $$params$1[38bv32] else v81$1);
    v81$2 := (if p1$2 then $$params$2[38bv32] else v81$2);
    v82$1 := (if p1$1 then $$params$1[39bv32] else v82$1);
    v82$2 := (if p1$2 then $$params$2[39bv32] else v82$2);
    v83$1 := (if p1$1 then $$gridPos.i$0bv32$1 else v83$1);
    v83$2 := (if p1$2 then $$gridPos.i$0bv32$2 else v83$2);
    call {:sourceloc} {:sourceloc_num 113} _LOG_WRITE_$$gridParticleHash(p1$1, v0$1, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(v69$1, v73$1 ++ v72$1 ++ v71$1 ++ v70$1), v77$1 ++ v76$1 ++ v75$1 ++ v74$1), BV32_MUL(v78$1, v82$1 ++ v81$1 ++ v80$1 ++ v79$1)), v83$1), $$gridParticleHash[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridParticleHash(p1$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 113} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 113} _CHECK_WRITE_$$gridParticleHash(p1$2, v0$2, BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(v69$2, v73$2 ++ v72$2 ++ v71$2 ++ v70$2), v77$2 ++ v76$2 ++ v75$2 ++ v74$2), BV32_MUL(v78$2, v82$2 ++ v81$2 ++ v80$2 ++ v79$2)), v83$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gridParticleHash"} true;
    $$gridParticleHash[v0$1] := (if p1$1 then BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(v69$1, v73$1 ++ v72$1 ++ v71$1 ++ v70$1), v77$1 ++ v76$1 ++ v75$1 ++ v74$1), BV32_MUL(v78$1, v82$1 ++ v81$1 ++ v80$1 ++ v79$1)), v83$1) else $$gridParticleHash[v0$1]);
    $$gridParticleHash[v0$2] := (if p1$2 then BV32_ADD(BV32_ADD(BV32_MUL(BV32_MUL(v69$2, v73$2 ++ v72$2 ++ v71$2 ++ v70$2), v77$2 ++ v76$2 ++ v75$2 ++ v74$2), BV32_MUL(v78$2, v82$2 ++ v81$2 ++ v80$2 ++ v79$2)), v83$2) else $$gridParticleHash[v0$2]);
    call {:sourceloc} {:sourceloc_num 114} _LOG_WRITE_$$gridParticleIndex(p1$1, v0$1, v0$1, $$gridParticleIndex[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridParticleIndex(p1$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 114} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 114} _CHECK_WRITE_$$gridParticleIndex(p1$2, v0$2, v0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$gridParticleIndex"} true;
    $$gridParticleIndex[v0$1] := (if p1$1 then v0$1 else $$gridParticleIndex[v0$1]);
    $$gridParticleIndex[v0$2] := (if p1$2 then v0$2 else $$gridParticleIndex[v0$2]);
    return;
}



procedure {:source_name "floor"} $floor(_P$1: bool, $0$1: bv64, _P$2: bool, $0$2: bv64) returns ($ret$1: bv64, $ret$2: bv64);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 64bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$0$0bv32$1: bv32;

var $$0$0bv32$2: bv32;

var $$0$1bv32$1: bv32;

var $$0$1bv32$2: bv32;

var $$0$2bv32$1: bv32;

var $$0$2bv32$2: bv32;

var $$1$0bv32$1: bv32;

var $$1$0bv32$2: bv32;

var $$1$1bv32$1: bv32;

var $$1$1bv32$2: bv32;

var $$1$2bv32$1: bv32;

var $$1$2bv32$2: bv32;

var $$p.i$0bv32$1: bv32;

var $$p.i$0bv32$2: bv32;

var $$p.i$1bv32$1: bv32;

var $$p.i$1bv32$2: bv32;

var $$p.i$2bv32$1: bv32;

var $$p.i$2bv32$2: bv32;

var $$gridPos.i$0bv32$1: bv32;

var $$gridPos.i$0bv32$2: bv32;

var $$gridPos.i$1bv32$1: bv32;

var $$gridPos.i$1bv32$2: bv32;

var $$gridPos.i$2bv32$1: bv32;

var $$gridPos.i$2bv32$2: bv32;

var $$p$0bv32$1: bv32;

var $$p$0bv32$2: bv32;

var $$p$1bv32$1: bv32;

var $$p$1bv32$2: bv32;

var $$p$2bv32$1: bv32;

var $$p$2bv32$2: bv32;

var $$p$3bv32$1: bv32;

var $$p$3bv32$2: bv32;

var $$gridPos$0bv32$1: bv32;

var $$gridPos$0bv32$2: bv32;

var $$gridPos$1bv32$1: bv32;

var $$gridPos$1bv32$2: bv32;

var $$gridPos$2bv32$1: bv32;

var $$gridPos$2bv32$2: bv32;

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

const _WATCHED_VALUE_$$gridParticleHash: bv32;

procedure {:inline 1} _LOG_READ_$$gridParticleHash(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$gridParticleHash;



implementation {:inline 1} _LOG_READ_$$gridParticleHash(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$gridParticleHash := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridParticleHash == _value then true else _READ_HAS_OCCURRED_$$gridParticleHash);
    return;
}



procedure _CHECK_READ_$$gridParticleHash(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "gridParticleHash"} {:array "$$gridParticleHash"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$gridParticleHash && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$gridParticleHash);
  requires {:source_name "gridParticleHash"} {:array "$$gridParticleHash"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$gridParticleHash && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$gridParticleHash: bool;

procedure {:inline 1} _LOG_WRITE_$$gridParticleHash(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$gridParticleHash, _WRITE_READ_BENIGN_FLAG_$$gridParticleHash;



implementation {:inline 1} _LOG_WRITE_$$gridParticleHash(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$gridParticleHash := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridParticleHash == _value then true else _WRITE_HAS_OCCURRED_$$gridParticleHash);
    _WRITE_READ_BENIGN_FLAG_$$gridParticleHash := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridParticleHash == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$gridParticleHash);
    return;
}



procedure _CHECK_WRITE_$$gridParticleHash(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "gridParticleHash"} {:array "$$gridParticleHash"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$gridParticleHash && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridParticleHash != _value);
  requires {:source_name "gridParticleHash"} {:array "$$gridParticleHash"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$gridParticleHash && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridParticleHash != _value);
  requires {:source_name "gridParticleHash"} {:array "$$gridParticleHash"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$gridParticleHash && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$gridParticleHash(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$gridParticleHash;



implementation {:inline 1} _LOG_ATOMIC_$$gridParticleHash(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$gridParticleHash := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$gridParticleHash);
    return;
}



procedure _CHECK_ATOMIC_$$gridParticleHash(_P: bool, _offset: bv32);
  requires {:source_name "gridParticleHash"} {:array "$$gridParticleHash"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$gridParticleHash && _WATCHED_OFFSET == _offset);
  requires {:source_name "gridParticleHash"} {:array "$$gridParticleHash"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$gridParticleHash && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridParticleHash(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$gridParticleHash;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridParticleHash(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$gridParticleHash := (if _P && _WRITE_HAS_OCCURRED_$$gridParticleHash && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$gridParticleHash);
    return;
}



const _WATCHED_VALUE_$$gridParticleIndex: bv32;

procedure {:inline 1} _LOG_READ_$$gridParticleIndex(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$gridParticleIndex;



implementation {:inline 1} _LOG_READ_$$gridParticleIndex(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$gridParticleIndex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridParticleIndex == _value then true else _READ_HAS_OCCURRED_$$gridParticleIndex);
    return;
}



procedure _CHECK_READ_$$gridParticleIndex(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "gridParticleIndex"} {:array "$$gridParticleIndex"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$gridParticleIndex && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$gridParticleIndex);
  requires {:source_name "gridParticleIndex"} {:array "$$gridParticleIndex"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$gridParticleIndex && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$gridParticleIndex: bool;

procedure {:inline 1} _LOG_WRITE_$$gridParticleIndex(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$gridParticleIndex, _WRITE_READ_BENIGN_FLAG_$$gridParticleIndex;



implementation {:inline 1} _LOG_WRITE_$$gridParticleIndex(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$gridParticleIndex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridParticleIndex == _value then true else _WRITE_HAS_OCCURRED_$$gridParticleIndex);
    _WRITE_READ_BENIGN_FLAG_$$gridParticleIndex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridParticleIndex == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$gridParticleIndex);
    return;
}



procedure _CHECK_WRITE_$$gridParticleIndex(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "gridParticleIndex"} {:array "$$gridParticleIndex"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$gridParticleIndex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridParticleIndex != _value);
  requires {:source_name "gridParticleIndex"} {:array "$$gridParticleIndex"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$gridParticleIndex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$gridParticleIndex != _value);
  requires {:source_name "gridParticleIndex"} {:array "$$gridParticleIndex"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$gridParticleIndex && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$gridParticleIndex(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$gridParticleIndex;



implementation {:inline 1} _LOG_ATOMIC_$$gridParticleIndex(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$gridParticleIndex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$gridParticleIndex);
    return;
}



procedure _CHECK_ATOMIC_$$gridParticleIndex(_P: bool, _offset: bv32);
  requires {:source_name "gridParticleIndex"} {:array "$$gridParticleIndex"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$gridParticleIndex && _WATCHED_OFFSET == _offset);
  requires {:source_name "gridParticleIndex"} {:array "$$gridParticleIndex"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$gridParticleIndex && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridParticleIndex(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$gridParticleIndex;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$gridParticleIndex(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$gridParticleIndex := (if _P && _WRITE_HAS_OCCURRED_$$gridParticleIndex && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$gridParticleIndex);
    return;
}



const _WATCHED_VALUE_$$pos: bv32;

procedure {:inline 1} _LOG_READ_$$pos(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$pos;



implementation {:inline 1} _LOG_READ_$$pos(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pos == _value then true else _READ_HAS_OCCURRED_$$pos);
    return;
}



procedure _CHECK_READ_$$pos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pos"} {:array "$$pos"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$pos);
  requires {:source_name "pos"} {:array "$$pos"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$pos: bool;

procedure {:inline 1} _LOG_WRITE_$$pos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$pos, _WRITE_READ_BENIGN_FLAG_$$pos;



implementation {:inline 1} _LOG_WRITE_$$pos(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pos == _value then true else _WRITE_HAS_OCCURRED_$$pos);
    _WRITE_READ_BENIGN_FLAG_$$pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pos == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$pos);
    return;
}



procedure _CHECK_WRITE_$$pos(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "pos"} {:array "$$pos"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pos != _value);
  requires {:source_name "pos"} {:array "$$pos"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$pos != _value);
  requires {:source_name "pos"} {:array "$$pos"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$pos(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$pos;



implementation {:inline 1} _LOG_ATOMIC_$$pos(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$pos := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$pos);
    return;
}



procedure _CHECK_ATOMIC_$$pos(_P: bool, _offset: bv32);
  requires {:source_name "pos"} {:array "$$pos"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset);
  requires {:source_name "pos"} {:array "$$pos"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pos(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$pos;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$pos(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$pos := (if _P && _WRITE_HAS_OCCURRED_$$pos && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$pos);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
