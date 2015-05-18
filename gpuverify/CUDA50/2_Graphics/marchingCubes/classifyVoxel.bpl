type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "voxelVerts"} {:global} $$voxelVerts: [bv32]bv32;

axiom {:array_info "$$voxelVerts"} {:global} {:elem_width 32} {:source_name "voxelVerts"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$voxelVerts: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$voxelVerts: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$voxelVerts: bool;

var {:source_name "voxelOccupied"} {:global} $$voxelOccupied: [bv32]bv32;

axiom {:array_info "$$voxelOccupied"} {:global} {:elem_width 32} {:source_name "voxelOccupied"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$voxelOccupied: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$voxelOccupied: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$voxelOccupied: bool;

axiom {:array_info "$$volume"} {:global} {:elem_width 8} {:source_name "volume"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$volume: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$volume: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$volume: bool;

axiom {:array_info "$$0"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$gridSizeShift.i"} {:elem_width 32} {:source_name "gridSizeShift.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$gridSizeMask.i"} {:elem_width 32} {:source_name "gridSizeMask.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$p.i19"} {:elem_width 32} {:source_name "p.i19"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$1"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$2"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$3"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i17"} {:elem_width 32} {:source_name "a.i17"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i18"} {:elem_width 32} {:source_name "b.i18"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$p.i16"} {:elem_width 32} {:source_name "p.i16"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$4"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$5"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$6"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i14"} {:elem_width 32} {:source_name "a.i14"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i15"} {:elem_width 32} {:source_name "b.i15"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$p.i13"} {:elem_width 32} {:source_name "p.i13"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$7"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$8"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$9"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i11"} {:elem_width 32} {:source_name "a.i11"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i12"} {:elem_width 32} {:source_name "b.i12"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$p.i10"} {:elem_width 32} {:source_name "p.i10"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$10"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$11"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$12"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i8"} {:elem_width 32} {:source_name "a.i8"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i9"} {:elem_width 32} {:source_name "b.i9"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$p.i7"} {:elem_width 32} {:source_name "p.i7"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$13"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$14"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$15"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i5"} {:elem_width 32} {:source_name "a.i5"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i6"} {:elem_width 32} {:source_name "b.i6"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$p.i4"} {:elem_width 32} {:source_name "p.i4"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$16"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$17"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$18"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i2"} {:elem_width 32} {:source_name "a.i2"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i3"} {:elem_width 32} {:source_name "b.i3"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$p.i1"} {:elem_width 32} {:source_name "p.i1"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$19"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$20"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$21"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$a.i"} {:elem_width 32} {:source_name "a.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$b.i"} {:elem_width 32} {:source_name "b.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$p.i"} {:elem_width 32} {:source_name "p.i"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$gridSize"} {:elem_width 32} {:source_name "gridSize"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$gridSizeShift"} {:elem_width 32} {:source_name "gridSizeShift"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$gridSizeMask"} {:elem_width 32} {:source_name "gridSizeMask"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$voxelSize"} {:elem_width 32} {:source_name "voxelSize"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$gridPos"} {:elem_width 32} {:source_name "gridPos"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$22"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$23"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$p"} {:elem_width 32} {:source_name "p"} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$field"} {:elem_width 32} {:source_name "field"} {:source_elem_width 32} {:source_dimensions "8"} true;

axiom {:array_info "$$24"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$25"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$26"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$27"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$28"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$29"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$30"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$31"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$32"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$33"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$34"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$35"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$36"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$37"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$38"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$39"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$40"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$41"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$42"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$43"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$44"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$45"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$46"} {:elem_width 32} {:source_name ""} {:source_elem_width 96} {:source_dimensions "1"} true;

axiom {:array_info "$$numVertsTex"} {:global} {:elem_width 32} {:source_name "numVertsTex"} {:source_elem_width 96} {:source_dimensions "1"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 96} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$numVertsTex: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 96} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$numVertsTex: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 96} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$numVertsTex: bool;

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

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function FADD32(bv32, bv32) : bv32;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

procedure {:source_name "classifyVoxel"} {:kernel} $_Z13classifyVoxelPjS_Ph5uint3S1_S1_j6float3f($gridSize.coerce0: bv32, $gridSize.coerce1: bv32, $gridSize.coerce2: bv32, $gridSizeShift.coerce0: bv32, $gridSizeShift.coerce1: bv32, $gridSizeShift.coerce2: bv32, $gridSizeMask.coerce0: bv32, $gridSizeMask.coerce1: bv32, $gridSizeMask.coerce2: bv32, $numVoxels: bv32, $voxelSize.coerce0: bv32, $voxelSize.coerce1: bv32, $voxelSize.coerce2: bv32, $isoValue: bv32);
  requires !_READ_HAS_OCCURRED_$$voxelVerts && !_WRITE_HAS_OCCURRED_$$voxelVerts && !_ATOMIC_HAS_OCCURRED_$$voxelVerts;
  requires !_READ_HAS_OCCURRED_$$voxelOccupied && !_WRITE_HAS_OCCURRED_$$voxelOccupied && !_ATOMIC_HAS_OCCURRED_$$voxelOccupied;
  requires !_READ_HAS_OCCURRED_$$volume && !_WRITE_HAS_OCCURRED_$$volume && !_ATOMIC_HAS_OCCURRED_$$volume;
  requires !_READ_HAS_OCCURRED_$$numVertsTex && !_WRITE_HAS_OCCURRED_$$numVertsTex && !_ATOMIC_HAS_OCCURRED_$$numVertsTex;
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
  modifies _WRITE_HAS_OCCURRED_$$voxelVerts, _WRITE_READ_BENIGN_FLAG_$$voxelVerts, _WRITE_READ_BENIGN_FLAG_$$voxelVerts, _WRITE_HAS_OCCURRED_$$voxelOccupied, _WRITE_READ_BENIGN_FLAG_$$voxelOccupied, _WRITE_READ_BENIGN_FLAG_$$voxelOccupied;



implementation {:source_name "classifyVoxel"} {:kernel} $_Z13classifyVoxelPjS_Ph5uint3S1_S1_j6float3f($gridSize.coerce0: bv32, $gridSize.coerce1: bv32, $gridSize.coerce2: bv32, $gridSizeShift.coerce0: bv32, $gridSizeShift.coerce1: bv32, $gridSizeShift.coerce2: bv32, $gridSizeMask.coerce0: bv32, $gridSizeMask.coerce1: bv32, $gridSizeMask.coerce2: bv32, $numVoxels: bv32, $voxelSize.coerce0: bv32, $voxelSize.coerce1: bv32, $voxelSize.coerce2: bv32, $isoValue: bv32)
{
  var v12$1: bv32;
  var v12$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
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
  var v42$1: bv32;
  var v42$2: bv32;
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
  var v33$1: bv32;
  var v33$2: bv32;
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
  var v41$1: bv32;
  var v41$2: bv32;
  var v39$1: bv32;
  var v39$2: bv32;
  var v40$1: bv32;
  var v40$2: bv32;
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
  var v106$1: bv32;
  var v106$2: bv32;
  var v105$1: bv32;
  var v105$2: bv32;
  var v107$1: bv32;
  var v107$2: bv32;
  var v238$1: bv32;
  var v238$2: bv32;
  var v239$1: bv32;
  var v239$2: bv32;
  var v240$1: bv32;
  var v240$2: bv32;
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
  var v116$1: bv32;
  var v116$2: bv32;
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
  var v127$1: bv32;
  var v127$2: bv32;
  var v128$1: bv32;
  var v128$2: bv32;
  var v129$1: bv32;
  var v129$2: bv32;
  var v130$1: bv32;
  var v130$2: bv32;
  var v131$1: bv32;
  var v131$2: bv32;
  var v132$1: bv32;
  var v132$2: bv32;
  var v133$1: bv32;
  var v133$2: bv32;
  var v134$1: bv32;
  var v134$2: bv32;
  var v135$1: bv32;
  var v135$2: bv32;
  var v136$1: bv32;
  var v136$2: bv32;
  var v137$1: bv32;
  var v137$2: bv32;
  var v138$1: bv32;
  var v138$2: bv32;
  var v139$1: bv32;
  var v139$2: bv32;
  var v140$1: bv32;
  var v140$2: bv32;
  var v141$1: bv32;
  var v141$2: bv32;
  var v142$1: bv32;
  var v142$2: bv32;
  var v143$1: bv32;
  var v143$2: bv32;
  var v144$1: bv32;
  var v144$2: bv32;
  var v145$1: bv32;
  var v145$2: bv32;
  var v146$1: bv32;
  var v146$2: bv32;
  var v147$1: bv32;
  var v147$2: bv32;
  var v148$1: bv32;
  var v148$2: bv32;
  var v149$1: bv32;
  var v149$2: bv32;
  var v150$1: bv32;
  var v150$2: bv32;
  var v151$1: bv32;
  var v151$2: bv32;
  var v152$1: bv32;
  var v152$2: bv32;
  var v153$1: bv32;
  var v153$2: bv32;
  var v154$1: bv32;
  var v154$2: bv32;
  var v155$1: bv32;
  var v155$2: bv32;
  var v156$1: bv32;
  var v156$2: bv32;
  var v157$1: bv32;
  var v157$2: bv32;
  var v158$1: bv32;
  var v158$2: bv32;
  var v159$1: bv32;
  var v159$2: bv32;
  var v160$1: bv32;
  var v160$2: bv32;
  var v161$1: bv32;
  var v161$2: bv32;
  var v162$1: bv32;
  var v162$2: bv32;
  var v163$1: bv32;
  var v163$2: bv32;
  var v164$1: bv32;
  var v164$2: bv32;
  var v165$1: bv32;
  var v165$2: bv32;
  var v166$1: bv32;
  var v166$2: bv32;
  var v167$1: bv32;
  var v167$2: bv32;
  var v168$1: bv32;
  var v168$2: bv32;
  var v169$1: bv32;
  var v169$2: bv32;
  var v170$1: bv32;
  var v170$2: bv32;
  var v171$1: bv32;
  var v171$2: bv32;
  var v172$1: bv32;
  var v172$2: bv32;
  var v173$1: bv32;
  var v173$2: bv32;
  var v174$1: bv32;
  var v174$2: bv32;
  var v175$1: bv32;
  var v175$2: bv32;
  var v176$1: bv32;
  var v176$2: bv32;
  var v177$1: bv32;
  var v177$2: bv32;
  var v178$1: bv32;
  var v178$2: bv32;
  var v179$1: bv32;
  var v179$2: bv32;
  var v180$1: bv32;
  var v180$2: bv32;
  var v181$1: bv32;
  var v181$2: bv32;
  var v182$1: bv32;
  var v182$2: bv32;
  var v183$1: bv32;
  var v183$2: bv32;
  var v184$1: bv32;
  var v184$2: bv32;
  var v185$1: bv32;
  var v185$2: bv32;
  var v186$1: bv32;
  var v186$2: bv32;
  var v187$1: bv32;
  var v187$2: bv32;
  var v188$1: bv32;
  var v188$2: bv32;
  var v189$1: bv32;
  var v189$2: bv32;
  var v190$1: bv32;
  var v190$2: bv32;
  var v191$1: bv32;
  var v191$2: bv32;
  var v192$1: bv32;
  var v192$2: bv32;
  var v193$1: bv32;
  var v193$2: bv32;
  var v194$1: bv32;
  var v194$2: bv32;
  var v195$1: bv32;
  var v195$2: bv32;
  var v196$1: bv32;
  var v196$2: bv32;
  var v197$1: bv32;
  var v197$2: bv32;
  var v198$1: bv32;
  var v198$2: bv32;
  var v199$1: bv32;
  var v199$2: bv32;
  var v200$1: bv32;
  var v200$2: bv32;
  var v201$1: bv32;
  var v201$2: bv32;
  var v202$1: bv32;
  var v202$2: bv32;
  var v203$1: bv32;
  var v203$2: bv32;
  var v204$1: bv32;
  var v204$2: bv32;
  var v205$1: bv32;
  var v205$2: bv32;
  var v206$1: bv32;
  var v206$2: bv32;
  var v207$1: bv32;
  var v207$2: bv32;
  var v208$1: bv32;
  var v208$2: bv32;
  var v209$1: bv32;
  var v209$2: bv32;
  var v210$1: bv32;
  var v210$2: bv32;
  var v211$1: bv32;
  var v211$2: bv32;
  var v212$1: bv32;
  var v212$2: bv32;
  var v213$1: bv32;
  var v213$2: bv32;
  var v214$1: bv32;
  var v214$2: bv32;
  var v215$1: bv32;
  var v215$2: bv32;
  var v216$1: bv32;
  var v216$2: bv32;
  var v217$1: bv32;
  var v217$2: bv32;
  var v218$1: bv32;
  var v218$2: bv32;
  var v219$1: bv32;
  var v219$2: bv32;
  var v220$1: bv32;
  var v220$2: bv32;
  var v221$1: bv32;
  var v221$2: bv32;
  var v222$1: bv32;
  var v222$2: bv32;
  var v223$1: bv32;
  var v223$2: bv32;
  var v224$1: bv32;
  var v224$2: bv32;
  var v225$1: bv32;
  var v225$2: bv32;
  var v226$1: bv32;
  var v226$2: bv32;
  var v227$1: bv32;
  var v227$2: bv32;
  var v228$1: bv32;
  var v228$2: bv32;
  var v229$1: bv32;
  var v229$2: bv32;
  var v230$1: bv32;
  var v230$2: bv32;
  var v231$1: bv32;
  var v231$2: bv32;
  var v232$1: bv32;
  var v232$2: bv32;
  var v233$1: bv32;
  var v233$2: bv32;
  var v234$1: bv32;
  var v234$2: bv32;
  var v235$1: bv32;
  var v235$2: bv32;
  var v236$1: bv32;
  var v236$2: bv32;
  var v237$1: bv32;
  var v237$2: bv32;
  var v241$1: bv32;
  var v241$2: bv32;
  var v242$1: bv32;
  var v242$2: bv32;
  var v243$1: bv32;
  var v243$2: bv32;
  var v244$1: bv32;
  var v244$2: bv32;
  var v245$1: bv32;
  var v245$2: bv32;
  var v246$1: bv32;
  var v246$2: bv32;
  var v247$1: bv32;
  var v247$2: bv32;
  var v248$1: bv32;
  var v248$2: bv32;
  var v249$1: bv32;
  var v249$2: bv32;
  var v250$1: bv32;
  var v250$2: bv32;
  var v251$1: bv32;
  var v251$2: bv32;
  var v252$1: bv32;
  var v252$2: bv32;
  var v253$1: bv32;
  var v253$2: bv32;
  var v254$1: bv32;
  var v254$2: bv32;
  var v255$1: bv32;
  var v255$2: bv32;
  var v256$1: bv32;
  var v256$2: bv32;
  var v257$1: bv32;
  var v257$2: bv32;
  var v258$1: bv32;
  var v258$2: bv32;
  var v259$1: bv32;
  var v259$2: bv32;
  var v260$1: bv32;
  var v260$2: bv32;
  var v261$1: bv32;
  var v261$2: bv32;
  var v262$1: bv32;
  var v262$2: bv32;
  var v263$1: bv32;
  var v263$2: bv32;
  var v264$1: bv32;
  var v264$2: bv32;
  var v265$1: bv32;
  var v265$2: bv32;
  var v266$1: bv32;
  var v266$2: bv32;
  var v267$1: bv32;
  var v267$2: bv32;
  var v268$1: bv32;
  var v268$2: bv32;
  var v269$1: bv32;
  var v269$2: bv32;
  var v270$1: bv32;
  var v270$2: bv32;
  var v271$1: bv32;
  var v271$2: bv32;
  var v272$1: bv32;
  var v272$2: bv32;
  var v273$1: bv32;
  var v273$2: bv32;
  var v274$1: bv32;
  var v274$2: bv32;
  var v275$1: bv32;
  var v275$2: bv32;
  var v276$1: bv32;
  var v276$2: bv32;
  var v277$1: bv32;
  var v277$2: bv32;
  var v278$1: bv32;
  var v278$2: bv32;
  var v279$1: bv32;
  var v279$2: bv32;
  var v280$1: bv32;
  var v280$2: bv32;
  var v281$1: bv32;
  var v281$2: bv32;
  var v282$1: bv32;
  var v282$2: bv32;
  var v283$1: bv32;
  var v283$2: bv32;
  var v284$1: bv32;
  var v284$2: bv32;
  var v285$1: bv32;
  var v285$2: bv32;
  var v286$1: bv32;
  var v286$2: bv32;
  var v287$1: bv32;
  var v287$2: bv32;
  var v288$1: bv32;
  var v288$2: bv32;
  var v289$1: bv32;
  var v289$2: bv32;
  var v290$1: bv32;
  var v290$2: bv32;
  var v291$1: bv32;
  var v291$2: bv32;
  var v292$1: bv32;
  var v292$2: bv32;
  var v293$1: bv32;
  var v293$2: bv32;
  var v294$1: bv32;
  var v294$2: bv32;
  var v295$1: bv32;
  var v295$2: bv32;
  var v297$1: bool;
  var v297$2: bool;
  var v296$1: bv32;
  var v296$2: bv32;
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;


  $0:
    $$gridSize$0bv32$1 := $gridSize.coerce0;
    $$gridSize$0bv32$2 := $gridSize.coerce0;
    $$gridSize$1bv32$1 := $gridSize.coerce1;
    $$gridSize$1bv32$2 := $gridSize.coerce1;
    $$gridSize$2bv32$1 := $gridSize.coerce2;
    $$gridSize$2bv32$2 := $gridSize.coerce2;
    $$gridSizeShift$0bv32$1 := $gridSizeShift.coerce0;
    $$gridSizeShift$0bv32$2 := $gridSizeShift.coerce0;
    $$gridSizeShift$1bv32$1 := $gridSizeShift.coerce1;
    $$gridSizeShift$1bv32$2 := $gridSizeShift.coerce1;
    $$gridSizeShift$2bv32$1 := $gridSizeShift.coerce2;
    $$gridSizeShift$2bv32$2 := $gridSizeShift.coerce2;
    $$gridSizeMask$0bv32$1 := $gridSizeMask.coerce0;
    $$gridSizeMask$0bv32$2 := $gridSizeMask.coerce0;
    $$gridSizeMask$1bv32$1 := $gridSizeMask.coerce1;
    $$gridSizeMask$1bv32$2 := $gridSizeMask.coerce1;
    $$gridSizeMask$2bv32$1 := $gridSizeMask.coerce2;
    $$gridSizeMask$2bv32$2 := $gridSizeMask.coerce2;
    $$voxelSize$0bv32$1 := $voxelSize.coerce0;
    $$voxelSize$0bv32$2 := $voxelSize.coerce0;
    $$voxelSize$1bv32$1 := $voxelSize.coerce1;
    $$voxelSize$1bv32$2 := $voxelSize.coerce1;
    $$voxelSize$2bv32$1 := $voxelSize.coerce2;
    $$voxelSize$2bv32$2 := $voxelSize.coerce2;
    v0$1 := BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$1, num_groups_x), group_id_x$1), group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$2, num_groups_x), group_id_x$2), group_size_x), local_id_x$2);
    v1$1 := $$gridSizeShift$0bv32$1;
    v1$2 := $$gridSizeShift$0bv32$2;
    $$22$0bv32$1 := v1$1;
    $$22$0bv32$2 := v1$2;
    v2$1 := $$gridSizeShift$1bv32$1;
    v2$2 := $$gridSizeShift$1bv32$2;
    $$22$1bv32$1 := v2$1;
    $$22$1bv32$2 := v2$2;
    v3$1 := $$gridSizeShift$2bv32$1;
    v3$2 := $$gridSizeShift$2bv32$2;
    $$22$2bv32$1 := v3$1;
    $$22$2bv32$2 := v3$2;
    v4$1 := $$gridSizeMask$0bv32$1;
    v4$2 := $$gridSizeMask$0bv32$2;
    $$23$0bv32$1 := v4$1;
    $$23$0bv32$2 := v4$2;
    v5$1 := $$gridSizeMask$1bv32$1;
    v5$2 := $$gridSizeMask$1bv32$2;
    $$23$1bv32$1 := v5$1;
    $$23$1bv32$2 := v5$2;
    v6$1 := $$gridSizeMask$2bv32$1;
    v6$2 := $$gridSizeMask$2bv32$2;
    $$23$2bv32$1 := v6$1;
    $$23$2bv32$2 := v6$2;
    v7$1 := $$22$0bv32$1;
    v7$2 := $$22$0bv32$2;
    v8$1 := $$22$1bv32$1;
    v8$2 := $$22$1bv32$2;
    v9$1 := $$22$2bv32$1;
    v9$2 := $$22$2bv32$2;
    v10$1 := $$23$0bv32$1;
    v10$2 := $$23$0bv32$2;
    v11$1 := $$23$1bv32$1;
    v11$2 := $$23$1bv32$2;
    v12$1 := $$23$2bv32$1;
    v12$2 := $$23$2bv32$2;
    $$gridSizeShift.i$0bv32$1 := v7$1;
    $$gridSizeShift.i$0bv32$2 := v7$2;
    $$gridSizeShift.i$1bv32$1 := v8$1;
    $$gridSizeShift.i$1bv32$2 := v8$2;
    $$gridSizeShift.i$2bv32$1 := v9$1;
    $$gridSizeShift.i$2bv32$2 := v9$2;
    $$gridSizeMask.i$0bv32$1 := v10$1;
    $$gridSizeMask.i$0bv32$2 := v10$2;
    $$gridSizeMask.i$1bv32$1 := v11$1;
    $$gridSizeMask.i$1bv32$2 := v11$2;
    $$gridSizeMask.i$2bv32$1 := v12$1;
    $$gridSizeMask.i$2bv32$2 := v12$2;
    v13$1 := $$gridSizeMask.i$0bv32$1;
    v13$2 := $$gridSizeMask.i$0bv32$2;
    $$0$0bv32$1 := BV32_AND(v0$1, v13$1);
    $$0$0bv32$2 := BV32_AND(v0$2, v13$2);
    v14$1 := $$gridSizeShift.i$1bv32$1;
    v14$2 := $$gridSizeShift.i$1bv32$2;
    v15$1 := $$gridSizeMask.i$1bv32$1;
    v15$2 := $$gridSizeMask.i$1bv32$2;
    $$0$1bv32$1 := BV32_AND(BV32_LSHR(v0$1, v14$1), v15$1);
    $$0$1bv32$2 := BV32_AND(BV32_LSHR(v0$2, v14$2), v15$2);
    v16$1 := $$gridSizeShift.i$2bv32$1;
    v16$2 := $$gridSizeShift.i$2bv32$2;
    v17$1 := $$gridSizeMask.i$2bv32$1;
    v17$2 := $$gridSizeMask.i$2bv32$2;
    $$0$2bv32$1 := BV32_AND(BV32_LSHR(v0$1, v16$1), v17$1);
    $$0$2bv32$2 := BV32_AND(BV32_LSHR(v0$2, v16$2), v17$2);
    v18$1 := $$0$0bv32$1;
    v18$2 := $$0$0bv32$2;
    v19$1 := $$0$1bv32$1;
    v19$2 := $$0$1bv32$2;
    v20$1 := $$0$2bv32$1;
    v20$2 := $$0$2bv32$2;
    $$gridPos$0bv32$1 := v18$1;
    $$gridPos$0bv32$2 := v18$2;
    $$gridPos$1bv32$1 := v19$1;
    $$gridPos$1bv32$2 := v19$2;
    $$gridPos$2bv32$1 := v20$1;
    $$gridPos$2bv32$2 := v20$2;
    v21$1 := $$gridPos$0bv32$1;
    v21$2 := $$gridPos$0bv32$2;
    v22$1 := $$voxelSize$0bv32$1;
    v22$2 := $$voxelSize$0bv32$2;
    $$p$0bv32$1 := FADD32(3212836864bv32, FMUL32(UI32_TO_FP32(v21$1), v22$1));
    $$p$0bv32$2 := FADD32(3212836864bv32, FMUL32(UI32_TO_FP32(v21$2), v22$2));
    v23$1 := $$gridPos$1bv32$1;
    v23$2 := $$gridPos$1bv32$2;
    v24$1 := $$voxelSize$1bv32$1;
    v24$2 := $$voxelSize$1bv32$2;
    $$p$1bv32$1 := FADD32(3212836864bv32, FMUL32(UI32_TO_FP32(v23$1), v24$1));
    $$p$1bv32$2 := FADD32(3212836864bv32, FMUL32(UI32_TO_FP32(v23$2), v24$2));
    v25$1 := $$gridPos$2bv32$1;
    v25$2 := $$gridPos$2bv32$2;
    v26$1 := $$voxelSize$2bv32$1;
    v26$2 := $$voxelSize$2bv32$2;
    $$p$2bv32$1 := FADD32(3212836864bv32, FMUL32(UI32_TO_FP32(v25$1), v26$1));
    $$p$2bv32$2 := FADD32(3212836864bv32, FMUL32(UI32_TO_FP32(v25$2), v26$2));
    v27$1 := $$p$0bv32$1;
    v27$2 := $$p$0bv32$2;
    $$24$0bv32$1 := v27$1;
    $$24$0bv32$2 := v27$2;
    v28$1 := $$p$1bv32$1;
    v28$2 := $$p$1bv32$2;
    $$24$1bv32$1 := v28$1;
    $$24$1bv32$2 := v28$2;
    v29$1 := $$p$2bv32$1;
    v29$2 := $$p$2bv32$2;
    $$24$2bv32$1 := v29$1;
    $$24$2bv32$2 := v29$2;
    v30$1 := $$24$0bv32$1;
    v30$2 := $$24$0bv32$2;
    v31$1 := $$24$1bv32$1;
    v31$2 := $$24$1bv32$2;
    v32$1 := $$24$2bv32$1;
    v32$2 := $$24$2bv32$2;
    $$p.i19$0bv32$1 := v30$1;
    $$p.i19$0bv32$2 := v30$2;
    $$p.i19$1bv32$1 := v31$1;
    $$p.i19$1bv32$2 := v31$2;
    $$p.i19$2bv32$1 := v32$1;
    $$p.i19$2bv32$2 := v32$2;
    v33$1 := $$p.i19$0bv32$1;
    v33$2 := $$p.i19$0bv32$2;
    v34$1 := $$p.i19$1bv32$1;
    v34$2 := $$p.i19$1bv32$2;
    v35$1 := $$p.i19$2bv32$1;
    v35$2 := $$p.i19$2bv32$2;
    v36$1 := FMUL32(v33$1, 1077936128bv32);
    v36$2 := FMUL32(v33$2, 1077936128bv32);
    v37$1 := FMUL32(v34$1, 1077936128bv32);
    v37$2 := FMUL32(v34$2, 1077936128bv32);
    v38$1 := FMUL32(v35$1, 1077936128bv32);
    v38$2 := FMUL32(v35$2, 1077936128bv32);
    $$field$0bv32$1 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v36$1, v36$1), v36$1), v36$1), FMUL32(FMUL32(1084227584bv32, v36$1), v36$1)), FMUL32(FMUL32(FMUL32(v37$1, v37$1), v37$1), v37$1)), FMUL32(FMUL32(1084227584bv32, v37$1), v37$1)), FMUL32(FMUL32(FMUL32(v38$1, v38$1), v38$1), v38$1)), FMUL32(FMUL32(1084227584bv32, v38$1), v38$1)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    $$field$0bv32$2 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v36$2, v36$2), v36$2), v36$2), FMUL32(FMUL32(1084227584bv32, v36$2), v36$2)), FMUL32(FMUL32(FMUL32(v37$2, v37$2), v37$2), v37$2)), FMUL32(FMUL32(1084227584bv32, v37$2), v37$2)), FMUL32(FMUL32(FMUL32(v38$2, v38$2), v38$2), v38$2)), FMUL32(FMUL32(1084227584bv32, v38$2), v38$2)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    v39$1 := $$p$0bv32$1;
    v39$2 := $$p$0bv32$2;
    $$26$0bv32$1 := v39$1;
    $$26$0bv32$2 := v39$2;
    v40$1 := $$p$1bv32$1;
    v40$2 := $$p$1bv32$2;
    $$26$1bv32$1 := v40$1;
    $$26$1bv32$2 := v40$2;
    v41$1 := $$p$2bv32$1;
    v41$2 := $$p$2bv32$2;
    $$26$2bv32$1 := v41$1;
    $$26$2bv32$2 := v41$2;
    v42$1 := $$voxelSize$0bv32$1;
    v42$2 := $$voxelSize$0bv32$2;
    $$1$0bv32$1 := v42$1;
    $$1$0bv32$2 := v42$2;
    $$1$1bv32$1 := 0bv32;
    $$1$1bv32$2 := 0bv32;
    $$1$2bv32$1 := 0bv32;
    $$1$2bv32$2 := 0bv32;
    v43$1 := $$1$0bv32$1;
    v43$2 := $$1$0bv32$2;
    v44$1 := $$1$1bv32$1;
    v44$2 := $$1$1bv32$2;
    v45$1 := $$1$2bv32$1;
    v45$2 := $$1$2bv32$2;
    $$27$0bv32$1 := v43$1;
    $$27$0bv32$2 := v43$2;
    $$27$1bv32$1 := v44$1;
    $$27$1bv32$2 := v44$2;
    $$27$2bv32$1 := v45$1;
    $$27$2bv32$2 := v45$2;
    v46$1 := $$26$0bv32$1;
    v46$2 := $$26$0bv32$2;
    v47$1 := $$26$1bv32$1;
    v47$2 := $$26$1bv32$2;
    v48$1 := $$26$2bv32$1;
    v48$2 := $$26$2bv32$2;
    v49$1 := $$27$0bv32$1;
    v49$2 := $$27$0bv32$2;
    v50$1 := $$27$1bv32$1;
    v50$2 := $$27$1bv32$2;
    v51$1 := $$27$2bv32$1;
    v51$2 := $$27$2bv32$2;
    $$a.i17$0bv32$1 := v46$1;
    $$a.i17$0bv32$2 := v46$2;
    $$a.i17$1bv32$1 := v47$1;
    $$a.i17$1bv32$2 := v47$2;
    $$a.i17$2bv32$1 := v48$1;
    $$a.i17$2bv32$2 := v48$2;
    $$b.i18$0bv32$1 := v49$1;
    $$b.i18$0bv32$2 := v49$2;
    $$b.i18$1bv32$1 := v50$1;
    $$b.i18$1bv32$2 := v50$2;
    $$b.i18$2bv32$1 := v51$1;
    $$b.i18$2bv32$2 := v51$2;
    v52$1 := $$a.i17$0bv32$1;
    v52$2 := $$a.i17$0bv32$2;
    v53$1 := $$b.i18$0bv32$1;
    v53$2 := $$b.i18$0bv32$2;
    v54$1 := $$a.i17$1bv32$1;
    v54$2 := $$a.i17$1bv32$2;
    v55$1 := $$b.i18$1bv32$1;
    v55$2 := $$b.i18$1bv32$2;
    v56$1 := $$a.i17$2bv32$1;
    v56$2 := $$a.i17$2bv32$2;
    v57$1 := $$b.i18$2bv32$1;
    v57$2 := $$b.i18$2bv32$2;
    $$2$0bv32$1 := FADD32(v52$1, v53$1);
    $$2$0bv32$2 := FADD32(v52$2, v53$2);
    $$2$1bv32$1 := FADD32(v54$1, v55$1);
    $$2$1bv32$2 := FADD32(v54$2, v55$2);
    $$2$2bv32$1 := FADD32(v56$1, v57$1);
    $$2$2bv32$2 := FADD32(v56$2, v57$2);
    v58$1 := $$2$0bv32$1;
    v58$2 := $$2$0bv32$2;
    v59$1 := $$2$1bv32$1;
    v59$2 := $$2$1bv32$2;
    v60$1 := $$2$2bv32$1;
    v60$2 := $$2$2bv32$2;
    $$3$0bv32$1 := v58$1;
    $$3$0bv32$2 := v58$2;
    $$3$1bv32$1 := v59$1;
    $$3$1bv32$2 := v59$2;
    $$3$2bv32$1 := v60$1;
    $$3$2bv32$2 := v60$2;
    v61$1 := $$3$0bv32$1;
    v61$2 := $$3$0bv32$2;
    v62$1 := $$3$1bv32$1;
    v62$2 := $$3$1bv32$2;
    v63$1 := $$3$2bv32$1;
    v63$2 := $$3$2bv32$2;
    $$25$0bv32$1 := v61$1;
    $$25$0bv32$2 := v61$2;
    $$25$1bv32$1 := v62$1;
    $$25$1bv32$2 := v62$2;
    $$25$2bv32$1 := v63$1;
    $$25$2bv32$2 := v63$2;
    v64$1 := $$25$0bv32$1;
    v64$2 := $$25$0bv32$2;
    v65$1 := $$25$1bv32$1;
    v65$2 := $$25$1bv32$2;
    v66$1 := $$25$2bv32$1;
    v66$2 := $$25$2bv32$2;
    $$p.i16$0bv32$1 := v64$1;
    $$p.i16$0bv32$2 := v64$2;
    $$p.i16$1bv32$1 := v65$1;
    $$p.i16$1bv32$2 := v65$2;
    $$p.i16$2bv32$1 := v66$1;
    $$p.i16$2bv32$2 := v66$2;
    v67$1 := $$p.i16$0bv32$1;
    v67$2 := $$p.i16$0bv32$2;
    v68$1 := $$p.i16$1bv32$1;
    v68$2 := $$p.i16$1bv32$2;
    v69$1 := $$p.i16$2bv32$1;
    v69$2 := $$p.i16$2bv32$2;
    v70$1 := FMUL32(v67$1, 1077936128bv32);
    v70$2 := FMUL32(v67$2, 1077936128bv32);
    v71$1 := FMUL32(v68$1, 1077936128bv32);
    v71$2 := FMUL32(v68$2, 1077936128bv32);
    v72$1 := FMUL32(v69$1, 1077936128bv32);
    v72$2 := FMUL32(v69$2, 1077936128bv32);
    $$field$1bv32$1 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v70$1, v70$1), v70$1), v70$1), FMUL32(FMUL32(1084227584bv32, v70$1), v70$1)), FMUL32(FMUL32(FMUL32(v71$1, v71$1), v71$1), v71$1)), FMUL32(FMUL32(1084227584bv32, v71$1), v71$1)), FMUL32(FMUL32(FMUL32(v72$1, v72$1), v72$1), v72$1)), FMUL32(FMUL32(1084227584bv32, v72$1), v72$1)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    $$field$1bv32$2 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v70$2, v70$2), v70$2), v70$2), FMUL32(FMUL32(1084227584bv32, v70$2), v70$2)), FMUL32(FMUL32(FMUL32(v71$2, v71$2), v71$2), v71$2)), FMUL32(FMUL32(1084227584bv32, v71$2), v71$2)), FMUL32(FMUL32(FMUL32(v72$2, v72$2), v72$2), v72$2)), FMUL32(FMUL32(1084227584bv32, v72$2), v72$2)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    v73$1 := $$p$0bv32$1;
    v73$2 := $$p$0bv32$2;
    $$29$0bv32$1 := v73$1;
    $$29$0bv32$2 := v73$2;
    v74$1 := $$p$1bv32$1;
    v74$2 := $$p$1bv32$2;
    $$29$1bv32$1 := v74$1;
    $$29$1bv32$2 := v74$2;
    v75$1 := $$p$2bv32$1;
    v75$2 := $$p$2bv32$2;
    $$29$2bv32$1 := v75$1;
    $$29$2bv32$2 := v75$2;
    v76$1 := $$voxelSize$0bv32$1;
    v76$2 := $$voxelSize$0bv32$2;
    v77$1 := $$voxelSize$1bv32$1;
    v77$2 := $$voxelSize$1bv32$2;
    $$4$0bv32$1 := v76$1;
    $$4$0bv32$2 := v76$2;
    $$4$1bv32$1 := v77$1;
    $$4$1bv32$2 := v77$2;
    $$4$2bv32$1 := 0bv32;
    $$4$2bv32$2 := 0bv32;
    v78$1 := $$4$0bv32$1;
    v78$2 := $$4$0bv32$2;
    v79$1 := $$4$1bv32$1;
    v79$2 := $$4$1bv32$2;
    v80$1 := $$4$2bv32$1;
    v80$2 := $$4$2bv32$2;
    $$30$0bv32$1 := v78$1;
    $$30$0bv32$2 := v78$2;
    $$30$1bv32$1 := v79$1;
    $$30$1bv32$2 := v79$2;
    $$30$2bv32$1 := v80$1;
    $$30$2bv32$2 := v80$2;
    v81$1 := $$29$0bv32$1;
    v81$2 := $$29$0bv32$2;
    v82$1 := $$29$1bv32$1;
    v82$2 := $$29$1bv32$2;
    v83$1 := $$29$2bv32$1;
    v83$2 := $$29$2bv32$2;
    v84$1 := $$30$0bv32$1;
    v84$2 := $$30$0bv32$2;
    v85$1 := $$30$1bv32$1;
    v85$2 := $$30$1bv32$2;
    v86$1 := $$30$2bv32$1;
    v86$2 := $$30$2bv32$2;
    $$a.i14$0bv32$1 := v81$1;
    $$a.i14$0bv32$2 := v81$2;
    $$a.i14$1bv32$1 := v82$1;
    $$a.i14$1bv32$2 := v82$2;
    $$a.i14$2bv32$1 := v83$1;
    $$a.i14$2bv32$2 := v83$2;
    $$b.i15$0bv32$1 := v84$1;
    $$b.i15$0bv32$2 := v84$2;
    $$b.i15$1bv32$1 := v85$1;
    $$b.i15$1bv32$2 := v85$2;
    $$b.i15$2bv32$1 := v86$1;
    $$b.i15$2bv32$2 := v86$2;
    v87$1 := $$a.i14$0bv32$1;
    v87$2 := $$a.i14$0bv32$2;
    v88$1 := $$b.i15$0bv32$1;
    v88$2 := $$b.i15$0bv32$2;
    v89$1 := $$a.i14$1bv32$1;
    v89$2 := $$a.i14$1bv32$2;
    v90$1 := $$b.i15$1bv32$1;
    v90$2 := $$b.i15$1bv32$2;
    v91$1 := $$a.i14$2bv32$1;
    v91$2 := $$a.i14$2bv32$2;
    v92$1 := $$b.i15$2bv32$1;
    v92$2 := $$b.i15$2bv32$2;
    $$5$0bv32$1 := FADD32(v87$1, v88$1);
    $$5$0bv32$2 := FADD32(v87$2, v88$2);
    $$5$1bv32$1 := FADD32(v89$1, v90$1);
    $$5$1bv32$2 := FADD32(v89$2, v90$2);
    $$5$2bv32$1 := FADD32(v91$1, v92$1);
    $$5$2bv32$2 := FADD32(v91$2, v92$2);
    v93$1 := $$5$0bv32$1;
    v93$2 := $$5$0bv32$2;
    v94$1 := $$5$1bv32$1;
    v94$2 := $$5$1bv32$2;
    v95$1 := $$5$2bv32$1;
    v95$2 := $$5$2bv32$2;
    $$6$0bv32$1 := v93$1;
    $$6$0bv32$2 := v93$2;
    $$6$1bv32$1 := v94$1;
    $$6$1bv32$2 := v94$2;
    $$6$2bv32$1 := v95$1;
    $$6$2bv32$2 := v95$2;
    v96$1 := $$6$0bv32$1;
    v96$2 := $$6$0bv32$2;
    v97$1 := $$6$1bv32$1;
    v97$2 := $$6$1bv32$2;
    v98$1 := $$6$2bv32$1;
    v98$2 := $$6$2bv32$2;
    $$28$0bv32$1 := v96$1;
    $$28$0bv32$2 := v96$2;
    $$28$1bv32$1 := v97$1;
    $$28$1bv32$2 := v97$2;
    $$28$2bv32$1 := v98$1;
    $$28$2bv32$2 := v98$2;
    v99$1 := $$28$0bv32$1;
    v99$2 := $$28$0bv32$2;
    v100$1 := $$28$1bv32$1;
    v100$2 := $$28$1bv32$2;
    v101$1 := $$28$2bv32$1;
    v101$2 := $$28$2bv32$2;
    $$p.i13$0bv32$1 := v99$1;
    $$p.i13$0bv32$2 := v99$2;
    $$p.i13$1bv32$1 := v100$1;
    $$p.i13$1bv32$2 := v100$2;
    $$p.i13$2bv32$1 := v101$1;
    $$p.i13$2bv32$2 := v101$2;
    v102$1 := $$p.i13$0bv32$1;
    v102$2 := $$p.i13$0bv32$2;
    v103$1 := $$p.i13$1bv32$1;
    v103$2 := $$p.i13$1bv32$2;
    v104$1 := $$p.i13$2bv32$1;
    v104$2 := $$p.i13$2bv32$2;
    v105$1 := FMUL32(v102$1, 1077936128bv32);
    v105$2 := FMUL32(v102$2, 1077936128bv32);
    v106$1 := FMUL32(v103$1, 1077936128bv32);
    v106$2 := FMUL32(v103$2, 1077936128bv32);
    v107$1 := FMUL32(v104$1, 1077936128bv32);
    v107$2 := FMUL32(v104$2, 1077936128bv32);
    $$field$2bv32$1 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v105$1, v105$1), v105$1), v105$1), FMUL32(FMUL32(1084227584bv32, v105$1), v105$1)), FMUL32(FMUL32(FMUL32(v106$1, v106$1), v106$1), v106$1)), FMUL32(FMUL32(1084227584bv32, v106$1), v106$1)), FMUL32(FMUL32(FMUL32(v107$1, v107$1), v107$1), v107$1)), FMUL32(FMUL32(1084227584bv32, v107$1), v107$1)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    $$field$2bv32$2 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v105$2, v105$2), v105$2), v105$2), FMUL32(FMUL32(1084227584bv32, v105$2), v105$2)), FMUL32(FMUL32(FMUL32(v106$2, v106$2), v106$2), v106$2)), FMUL32(FMUL32(1084227584bv32, v106$2), v106$2)), FMUL32(FMUL32(FMUL32(v107$2, v107$2), v107$2), v107$2)), FMUL32(FMUL32(1084227584bv32, v107$2), v107$2)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    v108$1 := $$p$0bv32$1;
    v108$2 := $$p$0bv32$2;
    $$32$0bv32$1 := v108$1;
    $$32$0bv32$2 := v108$2;
    v109$1 := $$p$1bv32$1;
    v109$2 := $$p$1bv32$2;
    $$32$1bv32$1 := v109$1;
    $$32$1bv32$2 := v109$2;
    v110$1 := $$p$2bv32$1;
    v110$2 := $$p$2bv32$2;
    $$32$2bv32$1 := v110$1;
    $$32$2bv32$2 := v110$2;
    v111$1 := $$voxelSize$1bv32$1;
    v111$2 := $$voxelSize$1bv32$2;
    $$7$0bv32$1 := 0bv32;
    $$7$0bv32$2 := 0bv32;
    $$7$1bv32$1 := v111$1;
    $$7$1bv32$2 := v111$2;
    $$7$2bv32$1 := 0bv32;
    $$7$2bv32$2 := 0bv32;
    v112$1 := $$7$0bv32$1;
    v112$2 := $$7$0bv32$2;
    v113$1 := $$7$1bv32$1;
    v113$2 := $$7$1bv32$2;
    v114$1 := $$7$2bv32$1;
    v114$2 := $$7$2bv32$2;
    $$33$0bv32$1 := v112$1;
    $$33$0bv32$2 := v112$2;
    $$33$1bv32$1 := v113$1;
    $$33$1bv32$2 := v113$2;
    $$33$2bv32$1 := v114$1;
    $$33$2bv32$2 := v114$2;
    v115$1 := $$32$0bv32$1;
    v115$2 := $$32$0bv32$2;
    v116$1 := $$32$1bv32$1;
    v116$2 := $$32$1bv32$2;
    v117$1 := $$32$2bv32$1;
    v117$2 := $$32$2bv32$2;
    v118$1 := $$33$0bv32$1;
    v118$2 := $$33$0bv32$2;
    v119$1 := $$33$1bv32$1;
    v119$2 := $$33$1bv32$2;
    v120$1 := $$33$2bv32$1;
    v120$2 := $$33$2bv32$2;
    $$a.i11$0bv32$1 := v115$1;
    $$a.i11$0bv32$2 := v115$2;
    $$a.i11$1bv32$1 := v116$1;
    $$a.i11$1bv32$2 := v116$2;
    $$a.i11$2bv32$1 := v117$1;
    $$a.i11$2bv32$2 := v117$2;
    $$b.i12$0bv32$1 := v118$1;
    $$b.i12$0bv32$2 := v118$2;
    $$b.i12$1bv32$1 := v119$1;
    $$b.i12$1bv32$2 := v119$2;
    $$b.i12$2bv32$1 := v120$1;
    $$b.i12$2bv32$2 := v120$2;
    v121$1 := $$a.i11$0bv32$1;
    v121$2 := $$a.i11$0bv32$2;
    v122$1 := $$b.i12$0bv32$1;
    v122$2 := $$b.i12$0bv32$2;
    v123$1 := $$a.i11$1bv32$1;
    v123$2 := $$a.i11$1bv32$2;
    v124$1 := $$b.i12$1bv32$1;
    v124$2 := $$b.i12$1bv32$2;
    v125$1 := $$a.i11$2bv32$1;
    v125$2 := $$a.i11$2bv32$2;
    v126$1 := $$b.i12$2bv32$1;
    v126$2 := $$b.i12$2bv32$2;
    $$8$0bv32$1 := FADD32(v121$1, v122$1);
    $$8$0bv32$2 := FADD32(v121$2, v122$2);
    $$8$1bv32$1 := FADD32(v123$1, v124$1);
    $$8$1bv32$2 := FADD32(v123$2, v124$2);
    $$8$2bv32$1 := FADD32(v125$1, v126$1);
    $$8$2bv32$2 := FADD32(v125$2, v126$2);
    v127$1 := $$8$0bv32$1;
    v127$2 := $$8$0bv32$2;
    v128$1 := $$8$1bv32$1;
    v128$2 := $$8$1bv32$2;
    v129$1 := $$8$2bv32$1;
    v129$2 := $$8$2bv32$2;
    $$9$0bv32$1 := v127$1;
    $$9$0bv32$2 := v127$2;
    $$9$1bv32$1 := v128$1;
    $$9$1bv32$2 := v128$2;
    $$9$2bv32$1 := v129$1;
    $$9$2bv32$2 := v129$2;
    v130$1 := $$9$0bv32$1;
    v130$2 := $$9$0bv32$2;
    v131$1 := $$9$1bv32$1;
    v131$2 := $$9$1bv32$2;
    v132$1 := $$9$2bv32$1;
    v132$2 := $$9$2bv32$2;
    $$31$0bv32$1 := v130$1;
    $$31$0bv32$2 := v130$2;
    $$31$1bv32$1 := v131$1;
    $$31$1bv32$2 := v131$2;
    $$31$2bv32$1 := v132$1;
    $$31$2bv32$2 := v132$2;
    v133$1 := $$31$0bv32$1;
    v133$2 := $$31$0bv32$2;
    v134$1 := $$31$1bv32$1;
    v134$2 := $$31$1bv32$2;
    v135$1 := $$31$2bv32$1;
    v135$2 := $$31$2bv32$2;
    $$p.i10$0bv32$1 := v133$1;
    $$p.i10$0bv32$2 := v133$2;
    $$p.i10$1bv32$1 := v134$1;
    $$p.i10$1bv32$2 := v134$2;
    $$p.i10$2bv32$1 := v135$1;
    $$p.i10$2bv32$2 := v135$2;
    v136$1 := $$p.i10$0bv32$1;
    v136$2 := $$p.i10$0bv32$2;
    v137$1 := $$p.i10$1bv32$1;
    v137$2 := $$p.i10$1bv32$2;
    v138$1 := $$p.i10$2bv32$1;
    v138$2 := $$p.i10$2bv32$2;
    v139$1 := FMUL32(v136$1, 1077936128bv32);
    v139$2 := FMUL32(v136$2, 1077936128bv32);
    v140$1 := FMUL32(v137$1, 1077936128bv32);
    v140$2 := FMUL32(v137$2, 1077936128bv32);
    v141$1 := FMUL32(v138$1, 1077936128bv32);
    v141$2 := FMUL32(v138$2, 1077936128bv32);
    $$field$3bv32$1 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v139$1, v139$1), v139$1), v139$1), FMUL32(FMUL32(1084227584bv32, v139$1), v139$1)), FMUL32(FMUL32(FMUL32(v140$1, v140$1), v140$1), v140$1)), FMUL32(FMUL32(1084227584bv32, v140$1), v140$1)), FMUL32(FMUL32(FMUL32(v141$1, v141$1), v141$1), v141$1)), FMUL32(FMUL32(1084227584bv32, v141$1), v141$1)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    $$field$3bv32$2 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v139$2, v139$2), v139$2), v139$2), FMUL32(FMUL32(1084227584bv32, v139$2), v139$2)), FMUL32(FMUL32(FMUL32(v140$2, v140$2), v140$2), v140$2)), FMUL32(FMUL32(1084227584bv32, v140$2), v140$2)), FMUL32(FMUL32(FMUL32(v141$2, v141$2), v141$2), v141$2)), FMUL32(FMUL32(1084227584bv32, v141$2), v141$2)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    v142$1 := $$p$0bv32$1;
    v142$2 := $$p$0bv32$2;
    $$35$0bv32$1 := v142$1;
    $$35$0bv32$2 := v142$2;
    v143$1 := $$p$1bv32$1;
    v143$2 := $$p$1bv32$2;
    $$35$1bv32$1 := v143$1;
    $$35$1bv32$2 := v143$2;
    v144$1 := $$p$2bv32$1;
    v144$2 := $$p$2bv32$2;
    $$35$2bv32$1 := v144$1;
    $$35$2bv32$2 := v144$2;
    v145$1 := $$voxelSize$2bv32$1;
    v145$2 := $$voxelSize$2bv32$2;
    $$10$0bv32$1 := 0bv32;
    $$10$0bv32$2 := 0bv32;
    $$10$1bv32$1 := 0bv32;
    $$10$1bv32$2 := 0bv32;
    $$10$2bv32$1 := v145$1;
    $$10$2bv32$2 := v145$2;
    v146$1 := $$10$0bv32$1;
    v146$2 := $$10$0bv32$2;
    v147$1 := $$10$1bv32$1;
    v147$2 := $$10$1bv32$2;
    v148$1 := $$10$2bv32$1;
    v148$2 := $$10$2bv32$2;
    $$36$0bv32$1 := v146$1;
    $$36$0bv32$2 := v146$2;
    $$36$1bv32$1 := v147$1;
    $$36$1bv32$2 := v147$2;
    $$36$2bv32$1 := v148$1;
    $$36$2bv32$2 := v148$2;
    v149$1 := $$35$0bv32$1;
    v149$2 := $$35$0bv32$2;
    v150$1 := $$35$1bv32$1;
    v150$2 := $$35$1bv32$2;
    v151$1 := $$35$2bv32$1;
    v151$2 := $$35$2bv32$2;
    v152$1 := $$36$0bv32$1;
    v152$2 := $$36$0bv32$2;
    v153$1 := $$36$1bv32$1;
    v153$2 := $$36$1bv32$2;
    v154$1 := $$36$2bv32$1;
    v154$2 := $$36$2bv32$2;
    $$a.i8$0bv32$1 := v149$1;
    $$a.i8$0bv32$2 := v149$2;
    $$a.i8$1bv32$1 := v150$1;
    $$a.i8$1bv32$2 := v150$2;
    $$a.i8$2bv32$1 := v151$1;
    $$a.i8$2bv32$2 := v151$2;
    $$b.i9$0bv32$1 := v152$1;
    $$b.i9$0bv32$2 := v152$2;
    $$b.i9$1bv32$1 := v153$1;
    $$b.i9$1bv32$2 := v153$2;
    $$b.i9$2bv32$1 := v154$1;
    $$b.i9$2bv32$2 := v154$2;
    v155$1 := $$a.i8$0bv32$1;
    v155$2 := $$a.i8$0bv32$2;
    v156$1 := $$b.i9$0bv32$1;
    v156$2 := $$b.i9$0bv32$2;
    v157$1 := $$a.i8$1bv32$1;
    v157$2 := $$a.i8$1bv32$2;
    v158$1 := $$b.i9$1bv32$1;
    v158$2 := $$b.i9$1bv32$2;
    v159$1 := $$a.i8$2bv32$1;
    v159$2 := $$a.i8$2bv32$2;
    v160$1 := $$b.i9$2bv32$1;
    v160$2 := $$b.i9$2bv32$2;
    $$11$0bv32$1 := FADD32(v155$1, v156$1);
    $$11$0bv32$2 := FADD32(v155$2, v156$2);
    $$11$1bv32$1 := FADD32(v157$1, v158$1);
    $$11$1bv32$2 := FADD32(v157$2, v158$2);
    $$11$2bv32$1 := FADD32(v159$1, v160$1);
    $$11$2bv32$2 := FADD32(v159$2, v160$2);
    v161$1 := $$11$0bv32$1;
    v161$2 := $$11$0bv32$2;
    v162$1 := $$11$1bv32$1;
    v162$2 := $$11$1bv32$2;
    v163$1 := $$11$2bv32$1;
    v163$2 := $$11$2bv32$2;
    $$12$0bv32$1 := v161$1;
    $$12$0bv32$2 := v161$2;
    $$12$1bv32$1 := v162$1;
    $$12$1bv32$2 := v162$2;
    $$12$2bv32$1 := v163$1;
    $$12$2bv32$2 := v163$2;
    v164$1 := $$12$0bv32$1;
    v164$2 := $$12$0bv32$2;
    v165$1 := $$12$1bv32$1;
    v165$2 := $$12$1bv32$2;
    v166$1 := $$12$2bv32$1;
    v166$2 := $$12$2bv32$2;
    $$34$0bv32$1 := v164$1;
    $$34$0bv32$2 := v164$2;
    $$34$1bv32$1 := v165$1;
    $$34$1bv32$2 := v165$2;
    $$34$2bv32$1 := v166$1;
    $$34$2bv32$2 := v166$2;
    v167$1 := $$34$0bv32$1;
    v167$2 := $$34$0bv32$2;
    v168$1 := $$34$1bv32$1;
    v168$2 := $$34$1bv32$2;
    v169$1 := $$34$2bv32$1;
    v169$2 := $$34$2bv32$2;
    $$p.i7$0bv32$1 := v167$1;
    $$p.i7$0bv32$2 := v167$2;
    $$p.i7$1bv32$1 := v168$1;
    $$p.i7$1bv32$2 := v168$2;
    $$p.i7$2bv32$1 := v169$1;
    $$p.i7$2bv32$2 := v169$2;
    v170$1 := $$p.i7$0bv32$1;
    v170$2 := $$p.i7$0bv32$2;
    v171$1 := $$p.i7$1bv32$1;
    v171$2 := $$p.i7$1bv32$2;
    v172$1 := $$p.i7$2bv32$1;
    v172$2 := $$p.i7$2bv32$2;
    v173$1 := FMUL32(v170$1, 1077936128bv32);
    v173$2 := FMUL32(v170$2, 1077936128bv32);
    v174$1 := FMUL32(v171$1, 1077936128bv32);
    v174$2 := FMUL32(v171$2, 1077936128bv32);
    v175$1 := FMUL32(v172$1, 1077936128bv32);
    v175$2 := FMUL32(v172$2, 1077936128bv32);
    $$field$4bv32$1 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v173$1, v173$1), v173$1), v173$1), FMUL32(FMUL32(1084227584bv32, v173$1), v173$1)), FMUL32(FMUL32(FMUL32(v174$1, v174$1), v174$1), v174$1)), FMUL32(FMUL32(1084227584bv32, v174$1), v174$1)), FMUL32(FMUL32(FMUL32(v175$1, v175$1), v175$1), v175$1)), FMUL32(FMUL32(1084227584bv32, v175$1), v175$1)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    $$field$4bv32$2 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v173$2, v173$2), v173$2), v173$2), FMUL32(FMUL32(1084227584bv32, v173$2), v173$2)), FMUL32(FMUL32(FMUL32(v174$2, v174$2), v174$2), v174$2)), FMUL32(FMUL32(1084227584bv32, v174$2), v174$2)), FMUL32(FMUL32(FMUL32(v175$2, v175$2), v175$2), v175$2)), FMUL32(FMUL32(1084227584bv32, v175$2), v175$2)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    v176$1 := $$p$0bv32$1;
    v176$2 := $$p$0bv32$2;
    $$38$0bv32$1 := v176$1;
    $$38$0bv32$2 := v176$2;
    v177$1 := $$p$1bv32$1;
    v177$2 := $$p$1bv32$2;
    $$38$1bv32$1 := v177$1;
    $$38$1bv32$2 := v177$2;
    v178$1 := $$p$2bv32$1;
    v178$2 := $$p$2bv32$2;
    $$38$2bv32$1 := v178$1;
    $$38$2bv32$2 := v178$2;
    v179$1 := $$voxelSize$0bv32$1;
    v179$2 := $$voxelSize$0bv32$2;
    v180$1 := $$voxelSize$2bv32$1;
    v180$2 := $$voxelSize$2bv32$2;
    $$13$0bv32$1 := v179$1;
    $$13$0bv32$2 := v179$2;
    $$13$1bv32$1 := 0bv32;
    $$13$1bv32$2 := 0bv32;
    $$13$2bv32$1 := v180$1;
    $$13$2bv32$2 := v180$2;
    v181$1 := $$13$0bv32$1;
    v181$2 := $$13$0bv32$2;
    v182$1 := $$13$1bv32$1;
    v182$2 := $$13$1bv32$2;
    v183$1 := $$13$2bv32$1;
    v183$2 := $$13$2bv32$2;
    $$39$0bv32$1 := v181$1;
    $$39$0bv32$2 := v181$2;
    $$39$1bv32$1 := v182$1;
    $$39$1bv32$2 := v182$2;
    $$39$2bv32$1 := v183$1;
    $$39$2bv32$2 := v183$2;
    v184$1 := $$38$0bv32$1;
    v184$2 := $$38$0bv32$2;
    v185$1 := $$38$1bv32$1;
    v185$2 := $$38$1bv32$2;
    v186$1 := $$38$2bv32$1;
    v186$2 := $$38$2bv32$2;
    v187$1 := $$39$0bv32$1;
    v187$2 := $$39$0bv32$2;
    v188$1 := $$39$1bv32$1;
    v188$2 := $$39$1bv32$2;
    v189$1 := $$39$2bv32$1;
    v189$2 := $$39$2bv32$2;
    $$a.i5$0bv32$1 := v184$1;
    $$a.i5$0bv32$2 := v184$2;
    $$a.i5$1bv32$1 := v185$1;
    $$a.i5$1bv32$2 := v185$2;
    $$a.i5$2bv32$1 := v186$1;
    $$a.i5$2bv32$2 := v186$2;
    $$b.i6$0bv32$1 := v187$1;
    $$b.i6$0bv32$2 := v187$2;
    $$b.i6$1bv32$1 := v188$1;
    $$b.i6$1bv32$2 := v188$2;
    $$b.i6$2bv32$1 := v189$1;
    $$b.i6$2bv32$2 := v189$2;
    v190$1 := $$a.i5$0bv32$1;
    v190$2 := $$a.i5$0bv32$2;
    v191$1 := $$b.i6$0bv32$1;
    v191$2 := $$b.i6$0bv32$2;
    v192$1 := $$a.i5$1bv32$1;
    v192$2 := $$a.i5$1bv32$2;
    v193$1 := $$b.i6$1bv32$1;
    v193$2 := $$b.i6$1bv32$2;
    v194$1 := $$a.i5$2bv32$1;
    v194$2 := $$a.i5$2bv32$2;
    v195$1 := $$b.i6$2bv32$1;
    v195$2 := $$b.i6$2bv32$2;
    $$14$0bv32$1 := FADD32(v190$1, v191$1);
    $$14$0bv32$2 := FADD32(v190$2, v191$2);
    $$14$1bv32$1 := FADD32(v192$1, v193$1);
    $$14$1bv32$2 := FADD32(v192$2, v193$2);
    $$14$2bv32$1 := FADD32(v194$1, v195$1);
    $$14$2bv32$2 := FADD32(v194$2, v195$2);
    v196$1 := $$14$0bv32$1;
    v196$2 := $$14$0bv32$2;
    v197$1 := $$14$1bv32$1;
    v197$2 := $$14$1bv32$2;
    v198$1 := $$14$2bv32$1;
    v198$2 := $$14$2bv32$2;
    $$15$0bv32$1 := v196$1;
    $$15$0bv32$2 := v196$2;
    $$15$1bv32$1 := v197$1;
    $$15$1bv32$2 := v197$2;
    $$15$2bv32$1 := v198$1;
    $$15$2bv32$2 := v198$2;
    v199$1 := $$15$0bv32$1;
    v199$2 := $$15$0bv32$2;
    v200$1 := $$15$1bv32$1;
    v200$2 := $$15$1bv32$2;
    v201$1 := $$15$2bv32$1;
    v201$2 := $$15$2bv32$2;
    $$37$0bv32$1 := v199$1;
    $$37$0bv32$2 := v199$2;
    $$37$1bv32$1 := v200$1;
    $$37$1bv32$2 := v200$2;
    $$37$2bv32$1 := v201$1;
    $$37$2bv32$2 := v201$2;
    v202$1 := $$37$0bv32$1;
    v202$2 := $$37$0bv32$2;
    v203$1 := $$37$1bv32$1;
    v203$2 := $$37$1bv32$2;
    v204$1 := $$37$2bv32$1;
    v204$2 := $$37$2bv32$2;
    $$p.i4$0bv32$1 := v202$1;
    $$p.i4$0bv32$2 := v202$2;
    $$p.i4$1bv32$1 := v203$1;
    $$p.i4$1bv32$2 := v203$2;
    $$p.i4$2bv32$1 := v204$1;
    $$p.i4$2bv32$2 := v204$2;
    v205$1 := $$p.i4$0bv32$1;
    v205$2 := $$p.i4$0bv32$2;
    v206$1 := $$p.i4$1bv32$1;
    v206$2 := $$p.i4$1bv32$2;
    v207$1 := $$p.i4$2bv32$1;
    v207$2 := $$p.i4$2bv32$2;
    v208$1 := FMUL32(v205$1, 1077936128bv32);
    v208$2 := FMUL32(v205$2, 1077936128bv32);
    v209$1 := FMUL32(v206$1, 1077936128bv32);
    v209$2 := FMUL32(v206$2, 1077936128bv32);
    v210$1 := FMUL32(v207$1, 1077936128bv32);
    v210$2 := FMUL32(v207$2, 1077936128bv32);
    $$field$5bv32$1 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v208$1, v208$1), v208$1), v208$1), FMUL32(FMUL32(1084227584bv32, v208$1), v208$1)), FMUL32(FMUL32(FMUL32(v209$1, v209$1), v209$1), v209$1)), FMUL32(FMUL32(1084227584bv32, v209$1), v209$1)), FMUL32(FMUL32(FMUL32(v210$1, v210$1), v210$1), v210$1)), FMUL32(FMUL32(1084227584bv32, v210$1), v210$1)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    $$field$5bv32$2 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v208$2, v208$2), v208$2), v208$2), FMUL32(FMUL32(1084227584bv32, v208$2), v208$2)), FMUL32(FMUL32(FMUL32(v209$2, v209$2), v209$2), v209$2)), FMUL32(FMUL32(1084227584bv32, v209$2), v209$2)), FMUL32(FMUL32(FMUL32(v210$2, v210$2), v210$2), v210$2)), FMUL32(FMUL32(1084227584bv32, v210$2), v210$2)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    v211$1 := $$p$0bv32$1;
    v211$2 := $$p$0bv32$2;
    $$41$0bv32$1 := v211$1;
    $$41$0bv32$2 := v211$2;
    v212$1 := $$p$1bv32$1;
    v212$2 := $$p$1bv32$2;
    $$41$1bv32$1 := v212$1;
    $$41$1bv32$2 := v212$2;
    v213$1 := $$p$2bv32$1;
    v213$2 := $$p$2bv32$2;
    $$41$2bv32$1 := v213$1;
    $$41$2bv32$2 := v213$2;
    v214$1 := $$voxelSize$0bv32$1;
    v214$2 := $$voxelSize$0bv32$2;
    v215$1 := $$voxelSize$1bv32$1;
    v215$2 := $$voxelSize$1bv32$2;
    v216$1 := $$voxelSize$2bv32$1;
    v216$2 := $$voxelSize$2bv32$2;
    $$16$0bv32$1 := v214$1;
    $$16$0bv32$2 := v214$2;
    $$16$1bv32$1 := v215$1;
    $$16$1bv32$2 := v215$2;
    $$16$2bv32$1 := v216$1;
    $$16$2bv32$2 := v216$2;
    v217$1 := $$16$0bv32$1;
    v217$2 := $$16$0bv32$2;
    v218$1 := $$16$1bv32$1;
    v218$2 := $$16$1bv32$2;
    v219$1 := $$16$2bv32$1;
    v219$2 := $$16$2bv32$2;
    $$42$0bv32$1 := v217$1;
    $$42$0bv32$2 := v217$2;
    $$42$1bv32$1 := v218$1;
    $$42$1bv32$2 := v218$2;
    $$42$2bv32$1 := v219$1;
    $$42$2bv32$2 := v219$2;
    v220$1 := $$41$0bv32$1;
    v220$2 := $$41$0bv32$2;
    v221$1 := $$41$1bv32$1;
    v221$2 := $$41$1bv32$2;
    v222$1 := $$41$2bv32$1;
    v222$2 := $$41$2bv32$2;
    v223$1 := $$42$0bv32$1;
    v223$2 := $$42$0bv32$2;
    v224$1 := $$42$1bv32$1;
    v224$2 := $$42$1bv32$2;
    v225$1 := $$42$2bv32$1;
    v225$2 := $$42$2bv32$2;
    $$a.i2$0bv32$1 := v220$1;
    $$a.i2$0bv32$2 := v220$2;
    $$a.i2$1bv32$1 := v221$1;
    $$a.i2$1bv32$2 := v221$2;
    $$a.i2$2bv32$1 := v222$1;
    $$a.i2$2bv32$2 := v222$2;
    $$b.i3$0bv32$1 := v223$1;
    $$b.i3$0bv32$2 := v223$2;
    $$b.i3$1bv32$1 := v224$1;
    $$b.i3$1bv32$2 := v224$2;
    $$b.i3$2bv32$1 := v225$1;
    $$b.i3$2bv32$2 := v225$2;
    v226$1 := $$a.i2$0bv32$1;
    v226$2 := $$a.i2$0bv32$2;
    v227$1 := $$b.i3$0bv32$1;
    v227$2 := $$b.i3$0bv32$2;
    v228$1 := $$a.i2$1bv32$1;
    v228$2 := $$a.i2$1bv32$2;
    v229$1 := $$b.i3$1bv32$1;
    v229$2 := $$b.i3$1bv32$2;
    v230$1 := $$a.i2$2bv32$1;
    v230$2 := $$a.i2$2bv32$2;
    v231$1 := $$b.i3$2bv32$1;
    v231$2 := $$b.i3$2bv32$2;
    $$17$0bv32$1 := FADD32(v226$1, v227$1);
    $$17$0bv32$2 := FADD32(v226$2, v227$2);
    $$17$1bv32$1 := FADD32(v228$1, v229$1);
    $$17$1bv32$2 := FADD32(v228$2, v229$2);
    $$17$2bv32$1 := FADD32(v230$1, v231$1);
    $$17$2bv32$2 := FADD32(v230$2, v231$2);
    v232$1 := $$17$0bv32$1;
    v232$2 := $$17$0bv32$2;
    v233$1 := $$17$1bv32$1;
    v233$2 := $$17$1bv32$2;
    v234$1 := $$17$2bv32$1;
    v234$2 := $$17$2bv32$2;
    $$18$0bv32$1 := v232$1;
    $$18$0bv32$2 := v232$2;
    $$18$1bv32$1 := v233$1;
    $$18$1bv32$2 := v233$2;
    $$18$2bv32$1 := v234$1;
    $$18$2bv32$2 := v234$2;
    v235$1 := $$18$0bv32$1;
    v235$2 := $$18$0bv32$2;
    v236$1 := $$18$1bv32$1;
    v236$2 := $$18$1bv32$2;
    v237$1 := $$18$2bv32$1;
    v237$2 := $$18$2bv32$2;
    $$40$0bv32$1 := v235$1;
    $$40$0bv32$2 := v235$2;
    $$40$1bv32$1 := v236$1;
    $$40$1bv32$2 := v236$2;
    $$40$2bv32$1 := v237$1;
    $$40$2bv32$2 := v237$2;
    v238$1 := $$40$0bv32$1;
    v238$2 := $$40$0bv32$2;
    v239$1 := $$40$1bv32$1;
    v239$2 := $$40$1bv32$2;
    v240$1 := $$40$2bv32$1;
    v240$2 := $$40$2bv32$2;
    $$p.i1$0bv32$1 := v238$1;
    $$p.i1$0bv32$2 := v238$2;
    $$p.i1$1bv32$1 := v239$1;
    $$p.i1$1bv32$2 := v239$2;
    $$p.i1$2bv32$1 := v240$1;
    $$p.i1$2bv32$2 := v240$2;
    v241$1 := $$p.i1$0bv32$1;
    v241$2 := $$p.i1$0bv32$2;
    v242$1 := $$p.i1$1bv32$1;
    v242$2 := $$p.i1$1bv32$2;
    v243$1 := $$p.i1$2bv32$1;
    v243$2 := $$p.i1$2bv32$2;
    v244$1 := FMUL32(v241$1, 1077936128bv32);
    v244$2 := FMUL32(v241$2, 1077936128bv32);
    v245$1 := FMUL32(v242$1, 1077936128bv32);
    v245$2 := FMUL32(v242$2, 1077936128bv32);
    v246$1 := FMUL32(v243$1, 1077936128bv32);
    v246$2 := FMUL32(v243$2, 1077936128bv32);
    $$field$6bv32$1 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v244$1, v244$1), v244$1), v244$1), FMUL32(FMUL32(1084227584bv32, v244$1), v244$1)), FMUL32(FMUL32(FMUL32(v245$1, v245$1), v245$1), v245$1)), FMUL32(FMUL32(1084227584bv32, v245$1), v245$1)), FMUL32(FMUL32(FMUL32(v246$1, v246$1), v246$1), v246$1)), FMUL32(FMUL32(1084227584bv32, v246$1), v246$1)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    $$field$6bv32$2 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v244$2, v244$2), v244$2), v244$2), FMUL32(FMUL32(1084227584bv32, v244$2), v244$2)), FMUL32(FMUL32(FMUL32(v245$2, v245$2), v245$2), v245$2)), FMUL32(FMUL32(1084227584bv32, v245$2), v245$2)), FMUL32(FMUL32(FMUL32(v246$2, v246$2), v246$2), v246$2)), FMUL32(FMUL32(1084227584bv32, v246$2), v246$2)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    v247$1 := $$p$0bv32$1;
    v247$2 := $$p$0bv32$2;
    $$44$0bv32$1 := v247$1;
    $$44$0bv32$2 := v247$2;
    v248$1 := $$p$1bv32$1;
    v248$2 := $$p$1bv32$2;
    $$44$1bv32$1 := v248$1;
    $$44$1bv32$2 := v248$2;
    v249$1 := $$p$2bv32$1;
    v249$2 := $$p$2bv32$2;
    $$44$2bv32$1 := v249$1;
    $$44$2bv32$2 := v249$2;
    v250$1 := $$voxelSize$1bv32$1;
    v250$2 := $$voxelSize$1bv32$2;
    v251$1 := $$voxelSize$2bv32$1;
    v251$2 := $$voxelSize$2bv32$2;
    $$19$0bv32$1 := 0bv32;
    $$19$0bv32$2 := 0bv32;
    $$19$1bv32$1 := v250$1;
    $$19$1bv32$2 := v250$2;
    $$19$2bv32$1 := v251$1;
    $$19$2bv32$2 := v251$2;
    v252$1 := $$19$0bv32$1;
    v252$2 := $$19$0bv32$2;
    v253$1 := $$19$1bv32$1;
    v253$2 := $$19$1bv32$2;
    v254$1 := $$19$2bv32$1;
    v254$2 := $$19$2bv32$2;
    $$45$0bv32$1 := v252$1;
    $$45$0bv32$2 := v252$2;
    $$45$1bv32$1 := v253$1;
    $$45$1bv32$2 := v253$2;
    $$45$2bv32$1 := v254$1;
    $$45$2bv32$2 := v254$2;
    v255$1 := $$44$0bv32$1;
    v255$2 := $$44$0bv32$2;
    v256$1 := $$44$1bv32$1;
    v256$2 := $$44$1bv32$2;
    v257$1 := $$44$2bv32$1;
    v257$2 := $$44$2bv32$2;
    v258$1 := $$45$0bv32$1;
    v258$2 := $$45$0bv32$2;
    v259$1 := $$45$1bv32$1;
    v259$2 := $$45$1bv32$2;
    v260$1 := $$45$2bv32$1;
    v260$2 := $$45$2bv32$2;
    $$a.i$0bv32$1 := v255$1;
    $$a.i$0bv32$2 := v255$2;
    $$a.i$1bv32$1 := v256$1;
    $$a.i$1bv32$2 := v256$2;
    $$a.i$2bv32$1 := v257$1;
    $$a.i$2bv32$2 := v257$2;
    $$b.i$0bv32$1 := v258$1;
    $$b.i$0bv32$2 := v258$2;
    $$b.i$1bv32$1 := v259$1;
    $$b.i$1bv32$2 := v259$2;
    $$b.i$2bv32$1 := v260$1;
    $$b.i$2bv32$2 := v260$2;
    v261$1 := $$a.i$0bv32$1;
    v261$2 := $$a.i$0bv32$2;
    v262$1 := $$b.i$0bv32$1;
    v262$2 := $$b.i$0bv32$2;
    v263$1 := $$a.i$1bv32$1;
    v263$2 := $$a.i$1bv32$2;
    v264$1 := $$b.i$1bv32$1;
    v264$2 := $$b.i$1bv32$2;
    v265$1 := $$a.i$2bv32$1;
    v265$2 := $$a.i$2bv32$2;
    v266$1 := $$b.i$2bv32$1;
    v266$2 := $$b.i$2bv32$2;
    $$20$0bv32$1 := FADD32(v261$1, v262$1);
    $$20$0bv32$2 := FADD32(v261$2, v262$2);
    $$20$1bv32$1 := FADD32(v263$1, v264$1);
    $$20$1bv32$2 := FADD32(v263$2, v264$2);
    $$20$2bv32$1 := FADD32(v265$1, v266$1);
    $$20$2bv32$2 := FADD32(v265$2, v266$2);
    v267$1 := $$20$0bv32$1;
    v267$2 := $$20$0bv32$2;
    v268$1 := $$20$1bv32$1;
    v268$2 := $$20$1bv32$2;
    v269$1 := $$20$2bv32$1;
    v269$2 := $$20$2bv32$2;
    $$21$0bv32$1 := v267$1;
    $$21$0bv32$2 := v267$2;
    $$21$1bv32$1 := v268$1;
    $$21$1bv32$2 := v268$2;
    $$21$2bv32$1 := v269$1;
    $$21$2bv32$2 := v269$2;
    v270$1 := $$21$0bv32$1;
    v270$2 := $$21$0bv32$2;
    v271$1 := $$21$1bv32$1;
    v271$2 := $$21$1bv32$2;
    v272$1 := $$21$2bv32$1;
    v272$2 := $$21$2bv32$2;
    $$43$0bv32$1 := v270$1;
    $$43$0bv32$2 := v270$2;
    $$43$1bv32$1 := v271$1;
    $$43$1bv32$2 := v271$2;
    $$43$2bv32$1 := v272$1;
    $$43$2bv32$2 := v272$2;
    v273$1 := $$43$0bv32$1;
    v273$2 := $$43$0bv32$2;
    v274$1 := $$43$1bv32$1;
    v274$2 := $$43$1bv32$2;
    v275$1 := $$43$2bv32$1;
    v275$2 := $$43$2bv32$2;
    $$p.i$0bv32$1 := v273$1;
    $$p.i$0bv32$2 := v273$2;
    $$p.i$1bv32$1 := v274$1;
    $$p.i$1bv32$2 := v274$2;
    $$p.i$2bv32$1 := v275$1;
    $$p.i$2bv32$2 := v275$2;
    v276$1 := $$p.i$0bv32$1;
    v276$2 := $$p.i$0bv32$2;
    v277$1 := $$p.i$1bv32$1;
    v277$2 := $$p.i$1bv32$2;
    v278$1 := $$p.i$2bv32$1;
    v278$2 := $$p.i$2bv32$2;
    v279$1 := FMUL32(v276$1, 1077936128bv32);
    v279$2 := FMUL32(v276$2, 1077936128bv32);
    v280$1 := FMUL32(v277$1, 1077936128bv32);
    v280$2 := FMUL32(v277$2, 1077936128bv32);
    v281$1 := FMUL32(v278$1, 1077936128bv32);
    v281$2 := FMUL32(v278$2, 1077936128bv32);
    $$field$7bv32$1 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v279$1, v279$1), v279$1), v279$1), FMUL32(FMUL32(1084227584bv32, v279$1), v279$1)), FMUL32(FMUL32(FMUL32(v280$1, v280$1), v280$1), v280$1)), FMUL32(FMUL32(1084227584bv32, v280$1), v280$1)), FMUL32(FMUL32(FMUL32(v281$1, v281$1), v281$1), v281$1)), FMUL32(FMUL32(1084227584bv32, v281$1), v281$1)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    $$field$7bv32$2 := FADD32(FMUL32(FADD32(FSUB32(FADD32(FSUB32(FADD32(FSUB32(FMUL32(FMUL32(FMUL32(v279$2, v279$2), v279$2), v279$2), FMUL32(FMUL32(1084227584bv32, v279$2), v279$2)), FMUL32(FMUL32(FMUL32(v280$2, v280$2), v280$2), v280$2)), FMUL32(FMUL32(1084227584bv32, v280$2), v280$2)), FMUL32(FMUL32(FMUL32(v281$2, v281$2), v281$2), v281$2)), FMUL32(FMUL32(1084227584bv32, v281$2), v281$2)), 1094503629bv32), 1045220557bv32), 1056964608bv32);
    v282$1 := $$field$0bv32$1;
    v282$2 := $$field$0bv32$2;
    v283$1 := $$field$1bv32$1;
    v283$2 := $$field$1bv32$2;
    v284$1 := $$field$2bv32$1;
    v284$2 := $$field$2bv32$2;
    v285$1 := $$field$3bv32$1;
    v285$2 := $$field$3bv32$2;
    v286$1 := $$field$4bv32$1;
    v286$2 := $$field$4bv32$2;
    v287$1 := $$field$5bv32$1;
    v287$2 := $$field$5bv32$2;
    v288$1 := $$field$6bv32$1;
    v288$2 := $$field$6bv32$2;
    v289$1 := $$field$7bv32$1;
    v289$2 := $$field$7bv32$2;
    havoc v290$1, v290$2;
    $$46$0bv32$1 := v290$1;
    $$46$0bv32$2 := v290$2;
    havoc v291$1, v291$2;
    $$46$1bv32$1 := v291$1;
    $$46$1bv32$2 := v291$2;
    havoc v292$1, v292$2;
    $$46$2bv32$1 := v292$1;
    $$46$2bv32$2 := v292$2;
    v293$1 := $$46$0bv32$1;
    v293$2 := $$46$0bv32$2;
    v294$1 := $$46$1bv32$1;
    v294$2 := $$46$1bv32$2;
    v295$1 := $$46$2bv32$1;
    v295$2 := $$46$2bv32$2;
    call {:sourceloc_num 511} v296$1, v296$2 := $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi(v293$1, v294$1, v295$1, BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(BV1_ZEXT32((if FLT32(v282$1, $isoValue) then 1bv1 else 0bv1)), BV32_MUL(BV1_ZEXT32((if FLT32(v283$1, $isoValue) then 1bv1 else 0bv1)), 2bv32)), BV32_MUL(BV1_ZEXT32((if FLT32(v284$1, $isoValue) then 1bv1 else 0bv1)), 4bv32)), BV32_MUL(BV1_ZEXT32((if FLT32(v285$1, $isoValue) then 1bv1 else 0bv1)), 8bv32)), BV32_MUL(BV1_ZEXT32((if FLT32(v286$1, $isoValue) then 1bv1 else 0bv1)), 16bv32)), BV32_MUL(BV1_ZEXT32((if FLT32(v287$1, $isoValue) then 1bv1 else 0bv1)), 32bv32)), BV32_MUL(BV1_ZEXT32((if FLT32(v288$1, $isoValue) then 1bv1 else 0bv1)), 64bv32)), BV32_MUL(BV1_ZEXT32((if FLT32(v289$1, $isoValue) then 1bv1 else 0bv1)), 128bv32)), v293$2, v294$2, v295$2, BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(BV32_ADD(BV1_ZEXT32((if FLT32(v282$2, $isoValue) then 1bv1 else 0bv1)), BV32_MUL(BV1_ZEXT32((if FLT32(v283$2, $isoValue) then 1bv1 else 0bv1)), 2bv32)), BV32_MUL(BV1_ZEXT32((if FLT32(v284$2, $isoValue) then 1bv1 else 0bv1)), 4bv32)), BV32_MUL(BV1_ZEXT32((if FLT32(v285$2, $isoValue) then 1bv1 else 0bv1)), 8bv32)), BV32_MUL(BV1_ZEXT32((if FLT32(v286$2, $isoValue) then 1bv1 else 0bv1)), 16bv32)), BV32_MUL(BV1_ZEXT32((if FLT32(v287$2, $isoValue) then 1bv1 else 0bv1)), 32bv32)), BV32_MUL(BV1_ZEXT32((if FLT32(v288$2, $isoValue) then 1bv1 else 0bv1)), 64bv32)), BV32_MUL(BV1_ZEXT32((if FLT32(v289$2, $isoValue) then 1bv1 else 0bv1)), 128bv32)));
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} true;
    v297$1 := BV32_ULT(v0$1, $numVoxels);
    v297$2 := BV32_ULT(v0$2, $numVoxels);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p0$1 := (if v297$1 then v297$1 else p0$1);
    p0$2 := (if v297$2 then v297$2 else p0$2);
    call {:sourceloc} {:sourceloc_num 513} _LOG_WRITE_$$voxelVerts(p0$1, v0$1, v296$1, $$voxelVerts[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$voxelVerts(p0$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 513} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 513} _CHECK_WRITE_$$voxelVerts(p0$2, v0$2, v296$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$voxelVerts"} true;
    $$voxelVerts[v0$1] := (if p0$1 then v296$1 else $$voxelVerts[v0$1]);
    $$voxelVerts[v0$2] := (if p0$2 then v296$2 else $$voxelVerts[v0$2]);
    call {:sourceloc} {:sourceloc_num 514} _LOG_WRITE_$$voxelOccupied(p0$1, v0$1, BV1_ZEXT32((if BV32_UGT(v296$1, 0bv32) then 1bv1 else 0bv1)), $$voxelOccupied[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$voxelOccupied(p0$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 514} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 514} _CHECK_WRITE_$$voxelOccupied(p0$2, v0$2, BV1_ZEXT32((if BV32_UGT(v296$2, 0bv32) then 1bv1 else 0bv1)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$voxelOccupied"} true;
    $$voxelOccupied[v0$1] := (if p0$1 then BV1_ZEXT32((if BV32_UGT(v296$1, 0bv32) then 1bv1 else 0bv1)) else $$voxelOccupied[v0$1]);
    $$voxelOccupied[v0$2] := (if p0$2 then BV1_ZEXT32((if BV32_UGT(v296$2, 0bv32) then 1bv1 else 0bv1)) else $$voxelOccupied[v0$2]);
    return;
}



procedure {:source_name "_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi"} $_Z10tex1DfetchIjET_7textureIS0_Li1EL19cudaTextureReadMode0EEi($0$1: bv32, $1$1: bv32, $2$1: bv32, $3$1: bv32, $0$2: bv32, $1$2: bv32, $2$2: bv32, $3$2: bv32) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

var $$0$0bv32$1: bv32;

var $$0$0bv32$2: bv32;

var $$0$1bv32$1: bv32;

var $$0$1bv32$2: bv32;

var $$0$2bv32$1: bv32;

var $$0$2bv32$2: bv32;

var $$gridSizeShift.i$0bv32$1: bv32;

var $$gridSizeShift.i$0bv32$2: bv32;

var $$gridSizeShift.i$1bv32$1: bv32;

var $$gridSizeShift.i$1bv32$2: bv32;

var $$gridSizeShift.i$2bv32$1: bv32;

var $$gridSizeShift.i$2bv32$2: bv32;

var $$gridSizeMask.i$0bv32$1: bv32;

var $$gridSizeMask.i$0bv32$2: bv32;

var $$gridSizeMask.i$1bv32$1: bv32;

var $$gridSizeMask.i$1bv32$2: bv32;

var $$gridSizeMask.i$2bv32$1: bv32;

var $$gridSizeMask.i$2bv32$2: bv32;

var $$p.i19$0bv32$1: bv32;

var $$p.i19$0bv32$2: bv32;

var $$p.i19$1bv32$1: bv32;

var $$p.i19$1bv32$2: bv32;

var $$p.i19$2bv32$1: bv32;

var $$p.i19$2bv32$2: bv32;

var $$1$0bv32$1: bv32;

var $$1$0bv32$2: bv32;

var $$1$1bv32$1: bv32;

var $$1$1bv32$2: bv32;

var $$1$2bv32$1: bv32;

var $$1$2bv32$2: bv32;

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

var $$a.i17$0bv32$1: bv32;

var $$a.i17$0bv32$2: bv32;

var $$a.i17$1bv32$1: bv32;

var $$a.i17$1bv32$2: bv32;

var $$a.i17$2bv32$1: bv32;

var $$a.i17$2bv32$2: bv32;

var $$b.i18$0bv32$1: bv32;

var $$b.i18$0bv32$2: bv32;

var $$b.i18$1bv32$1: bv32;

var $$b.i18$1bv32$2: bv32;

var $$b.i18$2bv32$1: bv32;

var $$b.i18$2bv32$2: bv32;

var $$p.i16$0bv32$1: bv32;

var $$p.i16$0bv32$2: bv32;

var $$p.i16$1bv32$1: bv32;

var $$p.i16$1bv32$2: bv32;

var $$p.i16$2bv32$1: bv32;

var $$p.i16$2bv32$2: bv32;

var $$4$0bv32$1: bv32;

var $$4$0bv32$2: bv32;

var $$4$1bv32$1: bv32;

var $$4$1bv32$2: bv32;

var $$4$2bv32$1: bv32;

var $$4$2bv32$2: bv32;

var $$5$0bv32$1: bv32;

var $$5$0bv32$2: bv32;

var $$5$1bv32$1: bv32;

var $$5$1bv32$2: bv32;

var $$5$2bv32$1: bv32;

var $$5$2bv32$2: bv32;

var $$6$0bv32$1: bv32;

var $$6$0bv32$2: bv32;

var $$6$1bv32$1: bv32;

var $$6$1bv32$2: bv32;

var $$6$2bv32$1: bv32;

var $$6$2bv32$2: bv32;

var $$a.i14$0bv32$1: bv32;

var $$a.i14$0bv32$2: bv32;

var $$a.i14$1bv32$1: bv32;

var $$a.i14$1bv32$2: bv32;

var $$a.i14$2bv32$1: bv32;

var $$a.i14$2bv32$2: bv32;

var $$b.i15$0bv32$1: bv32;

var $$b.i15$0bv32$2: bv32;

var $$b.i15$1bv32$1: bv32;

var $$b.i15$1bv32$2: bv32;

var $$b.i15$2bv32$1: bv32;

var $$b.i15$2bv32$2: bv32;

var $$p.i13$0bv32$1: bv32;

var $$p.i13$0bv32$2: bv32;

var $$p.i13$1bv32$1: bv32;

var $$p.i13$1bv32$2: bv32;

var $$p.i13$2bv32$1: bv32;

var $$p.i13$2bv32$2: bv32;

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

var $$9$0bv32$1: bv32;

var $$9$0bv32$2: bv32;

var $$9$1bv32$1: bv32;

var $$9$1bv32$2: bv32;

var $$9$2bv32$1: bv32;

var $$9$2bv32$2: bv32;

var $$a.i11$0bv32$1: bv32;

var $$a.i11$0bv32$2: bv32;

var $$a.i11$1bv32$1: bv32;

var $$a.i11$1bv32$2: bv32;

var $$a.i11$2bv32$1: bv32;

var $$a.i11$2bv32$2: bv32;

var $$b.i12$0bv32$1: bv32;

var $$b.i12$0bv32$2: bv32;

var $$b.i12$1bv32$1: bv32;

var $$b.i12$1bv32$2: bv32;

var $$b.i12$2bv32$1: bv32;

var $$b.i12$2bv32$2: bv32;

var $$p.i10$0bv32$1: bv32;

var $$p.i10$0bv32$2: bv32;

var $$p.i10$1bv32$1: bv32;

var $$p.i10$1bv32$2: bv32;

var $$p.i10$2bv32$1: bv32;

var $$p.i10$2bv32$2: bv32;

var $$10$0bv32$1: bv32;

var $$10$0bv32$2: bv32;

var $$10$1bv32$1: bv32;

var $$10$1bv32$2: bv32;

var $$10$2bv32$1: bv32;

var $$10$2bv32$2: bv32;

var $$11$0bv32$1: bv32;

var $$11$0bv32$2: bv32;

var $$11$1bv32$1: bv32;

var $$11$1bv32$2: bv32;

var $$11$2bv32$1: bv32;

var $$11$2bv32$2: bv32;

var $$12$0bv32$1: bv32;

var $$12$0bv32$2: bv32;

var $$12$1bv32$1: bv32;

var $$12$1bv32$2: bv32;

var $$12$2bv32$1: bv32;

var $$12$2bv32$2: bv32;

var $$a.i8$0bv32$1: bv32;

var $$a.i8$0bv32$2: bv32;

var $$a.i8$1bv32$1: bv32;

var $$a.i8$1bv32$2: bv32;

var $$a.i8$2bv32$1: bv32;

var $$a.i8$2bv32$2: bv32;

var $$b.i9$0bv32$1: bv32;

var $$b.i9$0bv32$2: bv32;

var $$b.i9$1bv32$1: bv32;

var $$b.i9$1bv32$2: bv32;

var $$b.i9$2bv32$1: bv32;

var $$b.i9$2bv32$2: bv32;

var $$p.i7$0bv32$1: bv32;

var $$p.i7$0bv32$2: bv32;

var $$p.i7$1bv32$1: bv32;

var $$p.i7$1bv32$2: bv32;

var $$p.i7$2bv32$1: bv32;

var $$p.i7$2bv32$2: bv32;

var $$13$0bv32$1: bv32;

var $$13$0bv32$2: bv32;

var $$13$1bv32$1: bv32;

var $$13$1bv32$2: bv32;

var $$13$2bv32$1: bv32;

var $$13$2bv32$2: bv32;

var $$14$0bv32$1: bv32;

var $$14$0bv32$2: bv32;

var $$14$1bv32$1: bv32;

var $$14$1bv32$2: bv32;

var $$14$2bv32$1: bv32;

var $$14$2bv32$2: bv32;

var $$15$0bv32$1: bv32;

var $$15$0bv32$2: bv32;

var $$15$1bv32$1: bv32;

var $$15$1bv32$2: bv32;

var $$15$2bv32$1: bv32;

var $$15$2bv32$2: bv32;

var $$a.i5$0bv32$1: bv32;

var $$a.i5$0bv32$2: bv32;

var $$a.i5$1bv32$1: bv32;

var $$a.i5$1bv32$2: bv32;

var $$a.i5$2bv32$1: bv32;

var $$a.i5$2bv32$2: bv32;

var $$b.i6$0bv32$1: bv32;

var $$b.i6$0bv32$2: bv32;

var $$b.i6$1bv32$1: bv32;

var $$b.i6$1bv32$2: bv32;

var $$b.i6$2bv32$1: bv32;

var $$b.i6$2bv32$2: bv32;

var $$p.i4$0bv32$1: bv32;

var $$p.i4$0bv32$2: bv32;

var $$p.i4$1bv32$1: bv32;

var $$p.i4$1bv32$2: bv32;

var $$p.i4$2bv32$1: bv32;

var $$p.i4$2bv32$2: bv32;

var $$16$0bv32$1: bv32;

var $$16$0bv32$2: bv32;

var $$16$1bv32$1: bv32;

var $$16$1bv32$2: bv32;

var $$16$2bv32$1: bv32;

var $$16$2bv32$2: bv32;

var $$17$0bv32$1: bv32;

var $$17$0bv32$2: bv32;

var $$17$1bv32$1: bv32;

var $$17$1bv32$2: bv32;

var $$17$2bv32$1: bv32;

var $$17$2bv32$2: bv32;

var $$18$0bv32$1: bv32;

var $$18$0bv32$2: bv32;

var $$18$1bv32$1: bv32;

var $$18$1bv32$2: bv32;

var $$18$2bv32$1: bv32;

var $$18$2bv32$2: bv32;

var $$a.i2$0bv32$1: bv32;

var $$a.i2$0bv32$2: bv32;

var $$a.i2$1bv32$1: bv32;

var $$a.i2$1bv32$2: bv32;

var $$a.i2$2bv32$1: bv32;

var $$a.i2$2bv32$2: bv32;

var $$b.i3$0bv32$1: bv32;

var $$b.i3$0bv32$2: bv32;

var $$b.i3$1bv32$1: bv32;

var $$b.i3$1bv32$2: bv32;

var $$b.i3$2bv32$1: bv32;

var $$b.i3$2bv32$2: bv32;

var $$p.i1$0bv32$1: bv32;

var $$p.i1$0bv32$2: bv32;

var $$p.i1$1bv32$1: bv32;

var $$p.i1$1bv32$2: bv32;

var $$p.i1$2bv32$1: bv32;

var $$p.i1$2bv32$2: bv32;

var $$19$0bv32$1: bv32;

var $$19$0bv32$2: bv32;

var $$19$1bv32$1: bv32;

var $$19$1bv32$2: bv32;

var $$19$2bv32$1: bv32;

var $$19$2bv32$2: bv32;

var $$20$0bv32$1: bv32;

var $$20$0bv32$2: bv32;

var $$20$1bv32$1: bv32;

var $$20$1bv32$2: bv32;

var $$20$2bv32$1: bv32;

var $$20$2bv32$2: bv32;

var $$21$0bv32$1: bv32;

var $$21$0bv32$2: bv32;

var $$21$1bv32$1: bv32;

var $$21$1bv32$2: bv32;

var $$21$2bv32$1: bv32;

var $$21$2bv32$2: bv32;

var $$a.i$0bv32$1: bv32;

var $$a.i$0bv32$2: bv32;

var $$a.i$1bv32$1: bv32;

var $$a.i$1bv32$2: bv32;

var $$a.i$2bv32$1: bv32;

var $$a.i$2bv32$2: bv32;

var $$b.i$0bv32$1: bv32;

var $$b.i$0bv32$2: bv32;

var $$b.i$1bv32$1: bv32;

var $$b.i$1bv32$2: bv32;

var $$b.i$2bv32$1: bv32;

var $$b.i$2bv32$2: bv32;

var $$p.i$0bv32$1: bv32;

var $$p.i$0bv32$2: bv32;

var $$p.i$1bv32$1: bv32;

var $$p.i$1bv32$2: bv32;

var $$p.i$2bv32$1: bv32;

var $$p.i$2bv32$2: bv32;

var $$gridSize$0bv32$1: bv32;

var $$gridSize$0bv32$2: bv32;

var $$gridSize$1bv32$1: bv32;

var $$gridSize$1bv32$2: bv32;

var $$gridSize$2bv32$1: bv32;

var $$gridSize$2bv32$2: bv32;

var $$gridSizeShift$0bv32$1: bv32;

var $$gridSizeShift$0bv32$2: bv32;

var $$gridSizeShift$1bv32$1: bv32;

var $$gridSizeShift$1bv32$2: bv32;

var $$gridSizeShift$2bv32$1: bv32;

var $$gridSizeShift$2bv32$2: bv32;

var $$gridSizeMask$0bv32$1: bv32;

var $$gridSizeMask$0bv32$2: bv32;

var $$gridSizeMask$1bv32$1: bv32;

var $$gridSizeMask$1bv32$2: bv32;

var $$gridSizeMask$2bv32$1: bv32;

var $$gridSizeMask$2bv32$2: bv32;

var $$voxelSize$0bv32$1: bv32;

var $$voxelSize$0bv32$2: bv32;

var $$voxelSize$1bv32$1: bv32;

var $$voxelSize$1bv32$2: bv32;

var $$voxelSize$2bv32$1: bv32;

var $$voxelSize$2bv32$2: bv32;

var $$gridPos$0bv32$1: bv32;

var $$gridPos$0bv32$2: bv32;

var $$gridPos$1bv32$1: bv32;

var $$gridPos$1bv32$2: bv32;

var $$gridPos$2bv32$1: bv32;

var $$gridPos$2bv32$2: bv32;

var $$22$0bv32$1: bv32;

var $$22$0bv32$2: bv32;

var $$22$1bv32$1: bv32;

var $$22$1bv32$2: bv32;

var $$22$2bv32$1: bv32;

var $$22$2bv32$2: bv32;

var $$23$0bv32$1: bv32;

var $$23$0bv32$2: bv32;

var $$23$1bv32$1: bv32;

var $$23$1bv32$2: bv32;

var $$23$2bv32$1: bv32;

var $$23$2bv32$2: bv32;

var $$p$0bv32$1: bv32;

var $$p$0bv32$2: bv32;

var $$p$1bv32$1: bv32;

var $$p$1bv32$2: bv32;

var $$p$2bv32$1: bv32;

var $$p$2bv32$2: bv32;

var $$field$0bv32$1: bv32;

var $$field$0bv32$2: bv32;

var $$field$1bv32$1: bv32;

var $$field$1bv32$2: bv32;

var $$field$2bv32$1: bv32;

var $$field$2bv32$2: bv32;

var $$field$3bv32$1: bv32;

var $$field$3bv32$2: bv32;

var $$field$4bv32$1: bv32;

var $$field$4bv32$2: bv32;

var $$field$5bv32$1: bv32;

var $$field$5bv32$2: bv32;

var $$field$6bv32$1: bv32;

var $$field$6bv32$2: bv32;

var $$field$7bv32$1: bv32;

var $$field$7bv32$2: bv32;

var $$24$0bv32$1: bv32;

var $$24$0bv32$2: bv32;

var $$24$1bv32$1: bv32;

var $$24$1bv32$2: bv32;

var $$24$2bv32$1: bv32;

var $$24$2bv32$2: bv32;

var $$25$0bv32$1: bv32;

var $$25$0bv32$2: bv32;

var $$25$1bv32$1: bv32;

var $$25$1bv32$2: bv32;

var $$25$2bv32$1: bv32;

var $$25$2bv32$2: bv32;

var $$26$0bv32$1: bv32;

var $$26$0bv32$2: bv32;

var $$26$1bv32$1: bv32;

var $$26$1bv32$2: bv32;

var $$26$2bv32$1: bv32;

var $$26$2bv32$2: bv32;

var $$27$0bv32$1: bv32;

var $$27$0bv32$2: bv32;

var $$27$1bv32$1: bv32;

var $$27$1bv32$2: bv32;

var $$27$2bv32$1: bv32;

var $$27$2bv32$2: bv32;

var $$28$0bv32$1: bv32;

var $$28$0bv32$2: bv32;

var $$28$1bv32$1: bv32;

var $$28$1bv32$2: bv32;

var $$28$2bv32$1: bv32;

var $$28$2bv32$2: bv32;

var $$29$0bv32$1: bv32;

var $$29$0bv32$2: bv32;

var $$29$1bv32$1: bv32;

var $$29$1bv32$2: bv32;

var $$29$2bv32$1: bv32;

var $$29$2bv32$2: bv32;

var $$30$0bv32$1: bv32;

var $$30$0bv32$2: bv32;

var $$30$1bv32$1: bv32;

var $$30$1bv32$2: bv32;

var $$30$2bv32$1: bv32;

var $$30$2bv32$2: bv32;

var $$31$0bv32$1: bv32;

var $$31$0bv32$2: bv32;

var $$31$1bv32$1: bv32;

var $$31$1bv32$2: bv32;

var $$31$2bv32$1: bv32;

var $$31$2bv32$2: bv32;

var $$32$0bv32$1: bv32;

var $$32$0bv32$2: bv32;

var $$32$1bv32$1: bv32;

var $$32$1bv32$2: bv32;

var $$32$2bv32$1: bv32;

var $$32$2bv32$2: bv32;

var $$33$0bv32$1: bv32;

var $$33$0bv32$2: bv32;

var $$33$1bv32$1: bv32;

var $$33$1bv32$2: bv32;

var $$33$2bv32$1: bv32;

var $$33$2bv32$2: bv32;

var $$34$0bv32$1: bv32;

var $$34$0bv32$2: bv32;

var $$34$1bv32$1: bv32;

var $$34$1bv32$2: bv32;

var $$34$2bv32$1: bv32;

var $$34$2bv32$2: bv32;

var $$35$0bv32$1: bv32;

var $$35$0bv32$2: bv32;

var $$35$1bv32$1: bv32;

var $$35$1bv32$2: bv32;

var $$35$2bv32$1: bv32;

var $$35$2bv32$2: bv32;

var $$36$0bv32$1: bv32;

var $$36$0bv32$2: bv32;

var $$36$1bv32$1: bv32;

var $$36$1bv32$2: bv32;

var $$36$2bv32$1: bv32;

var $$36$2bv32$2: bv32;

var $$37$0bv32$1: bv32;

var $$37$0bv32$2: bv32;

var $$37$1bv32$1: bv32;

var $$37$1bv32$2: bv32;

var $$37$2bv32$1: bv32;

var $$37$2bv32$2: bv32;

var $$38$0bv32$1: bv32;

var $$38$0bv32$2: bv32;

var $$38$1bv32$1: bv32;

var $$38$1bv32$2: bv32;

var $$38$2bv32$1: bv32;

var $$38$2bv32$2: bv32;

var $$39$0bv32$1: bv32;

var $$39$0bv32$2: bv32;

var $$39$1bv32$1: bv32;

var $$39$1bv32$2: bv32;

var $$39$2bv32$1: bv32;

var $$39$2bv32$2: bv32;

var $$40$0bv32$1: bv32;

var $$40$0bv32$2: bv32;

var $$40$1bv32$1: bv32;

var $$40$1bv32$2: bv32;

var $$40$2bv32$1: bv32;

var $$40$2bv32$2: bv32;

var $$41$0bv32$1: bv32;

var $$41$0bv32$2: bv32;

var $$41$1bv32$1: bv32;

var $$41$1bv32$2: bv32;

var $$41$2bv32$1: bv32;

var $$41$2bv32$2: bv32;

var $$42$0bv32$1: bv32;

var $$42$0bv32$2: bv32;

var $$42$1bv32$1: bv32;

var $$42$1bv32$2: bv32;

var $$42$2bv32$1: bv32;

var $$42$2bv32$2: bv32;

var $$43$0bv32$1: bv32;

var $$43$0bv32$2: bv32;

var $$43$1bv32$1: bv32;

var $$43$1bv32$2: bv32;

var $$43$2bv32$1: bv32;

var $$43$2bv32$2: bv32;

var $$44$0bv32$1: bv32;

var $$44$0bv32$2: bv32;

var $$44$1bv32$1: bv32;

var $$44$1bv32$2: bv32;

var $$44$2bv32$1: bv32;

var $$44$2bv32$2: bv32;

var $$45$0bv32$1: bv32;

var $$45$0bv32$2: bv32;

var $$45$1bv32$1: bv32;

var $$45$1bv32$2: bv32;

var $$45$2bv32$1: bv32;

var $$45$2bv32$2: bv32;

var $$46$0bv32$1: bv32;

var $$46$0bv32$2: bv32;

var $$46$1bv32$1: bv32;

var $$46$1bv32$2: bv32;

var $$46$2bv32$1: bv32;

var $$46$2bv32$2: bv32;

const _WATCHED_VALUE_$$voxelVerts: bv32;

procedure {:inline 1} _LOG_READ_$$voxelVerts(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$voxelVerts;



implementation {:inline 1} _LOG_READ_$$voxelVerts(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$voxelVerts := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$voxelVerts == _value then true else _READ_HAS_OCCURRED_$$voxelVerts);
    return;
}



procedure _CHECK_READ_$$voxelVerts(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "voxelVerts"} {:array "$$voxelVerts"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$voxelVerts && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$voxelVerts);
  requires {:source_name "voxelVerts"} {:array "$$voxelVerts"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$voxelVerts && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$voxelVerts: bool;

procedure {:inline 1} _LOG_WRITE_$$voxelVerts(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$voxelVerts, _WRITE_READ_BENIGN_FLAG_$$voxelVerts;



implementation {:inline 1} _LOG_WRITE_$$voxelVerts(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$voxelVerts := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$voxelVerts == _value then true else _WRITE_HAS_OCCURRED_$$voxelVerts);
    _WRITE_READ_BENIGN_FLAG_$$voxelVerts := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$voxelVerts == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$voxelVerts);
    return;
}



procedure _CHECK_WRITE_$$voxelVerts(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "voxelVerts"} {:array "$$voxelVerts"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$voxelVerts && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$voxelVerts != _value);
  requires {:source_name "voxelVerts"} {:array "$$voxelVerts"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$voxelVerts && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$voxelVerts != _value);
  requires {:source_name "voxelVerts"} {:array "$$voxelVerts"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$voxelVerts && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$voxelVerts(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$voxelVerts;



implementation {:inline 1} _LOG_ATOMIC_$$voxelVerts(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$voxelVerts := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$voxelVerts);
    return;
}



procedure _CHECK_ATOMIC_$$voxelVerts(_P: bool, _offset: bv32);
  requires {:source_name "voxelVerts"} {:array "$$voxelVerts"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$voxelVerts && _WATCHED_OFFSET == _offset);
  requires {:source_name "voxelVerts"} {:array "$$voxelVerts"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$voxelVerts && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$voxelVerts(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$voxelVerts;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$voxelVerts(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$voxelVerts := (if _P && _WRITE_HAS_OCCURRED_$$voxelVerts && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$voxelVerts);
    return;
}



const _WATCHED_VALUE_$$voxelOccupied: bv32;

procedure {:inline 1} _LOG_READ_$$voxelOccupied(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$voxelOccupied;



implementation {:inline 1} _LOG_READ_$$voxelOccupied(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$voxelOccupied := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$voxelOccupied == _value then true else _READ_HAS_OCCURRED_$$voxelOccupied);
    return;
}



procedure _CHECK_READ_$$voxelOccupied(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "voxelOccupied"} {:array "$$voxelOccupied"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$voxelOccupied && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$voxelOccupied);
  requires {:source_name "voxelOccupied"} {:array "$$voxelOccupied"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$voxelOccupied && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$voxelOccupied: bool;

procedure {:inline 1} _LOG_WRITE_$$voxelOccupied(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$voxelOccupied, _WRITE_READ_BENIGN_FLAG_$$voxelOccupied;



implementation {:inline 1} _LOG_WRITE_$$voxelOccupied(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$voxelOccupied := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$voxelOccupied == _value then true else _WRITE_HAS_OCCURRED_$$voxelOccupied);
    _WRITE_READ_BENIGN_FLAG_$$voxelOccupied := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$voxelOccupied == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$voxelOccupied);
    return;
}



procedure _CHECK_WRITE_$$voxelOccupied(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "voxelOccupied"} {:array "$$voxelOccupied"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$voxelOccupied && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$voxelOccupied != _value);
  requires {:source_name "voxelOccupied"} {:array "$$voxelOccupied"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$voxelOccupied && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$voxelOccupied != _value);
  requires {:source_name "voxelOccupied"} {:array "$$voxelOccupied"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$voxelOccupied && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$voxelOccupied(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$voxelOccupied;



implementation {:inline 1} _LOG_ATOMIC_$$voxelOccupied(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$voxelOccupied := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$voxelOccupied);
    return;
}



procedure _CHECK_ATOMIC_$$voxelOccupied(_P: bool, _offset: bv32);
  requires {:source_name "voxelOccupied"} {:array "$$voxelOccupied"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$voxelOccupied && _WATCHED_OFFSET == _offset);
  requires {:source_name "voxelOccupied"} {:array "$$voxelOccupied"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$voxelOccupied && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$voxelOccupied(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$voxelOccupied;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$voxelOccupied(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$voxelOccupied := (if _P && _WRITE_HAS_OCCURRED_$$voxelOccupied && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$voxelOccupied);
    return;
}



const _WATCHED_VALUE_$$volume: bv8;

procedure {:inline 1} _LOG_READ_$$volume(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$volume;



implementation {:inline 1} _LOG_READ_$$volume(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$volume := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$volume == _value then true else _READ_HAS_OCCURRED_$$volume);
    return;
}



procedure _CHECK_READ_$$volume(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "volume"} {:array "$$volume"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$volume && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$volume);
  requires {:source_name "volume"} {:array "$$volume"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$volume && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$volume: bool;

procedure {:inline 1} _LOG_WRITE_$$volume(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$volume, _WRITE_READ_BENIGN_FLAG_$$volume;



implementation {:inline 1} _LOG_WRITE_$$volume(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$volume := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$volume == _value then true else _WRITE_HAS_OCCURRED_$$volume);
    _WRITE_READ_BENIGN_FLAG_$$volume := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$volume == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$volume);
    return;
}



procedure _CHECK_WRITE_$$volume(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "volume"} {:array "$$volume"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$volume && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$volume != _value);
  requires {:source_name "volume"} {:array "$$volume"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$volume && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$volume != _value);
  requires {:source_name "volume"} {:array "$$volume"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$volume && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$volume(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$volume;



implementation {:inline 1} _LOG_ATOMIC_$$volume(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$volume := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$volume);
    return;
}



procedure _CHECK_ATOMIC_$$volume(_P: bool, _offset: bv32);
  requires {:source_name "volume"} {:array "$$volume"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$volume && _WATCHED_OFFSET == _offset);
  requires {:source_name "volume"} {:array "$$volume"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$volume && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$volume(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$volume;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$volume(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$volume := (if _P && _WRITE_HAS_OCCURRED_$$volume && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$volume);
    return;
}



const _WATCHED_VALUE_$$numVertsTex: bv32;

procedure {:inline 1} _LOG_READ_$$numVertsTex(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$numVertsTex;



implementation {:inline 1} _LOG_READ_$$numVertsTex(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$numVertsTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$numVertsTex == _value then true else _READ_HAS_OCCURRED_$$numVertsTex);
    return;
}



procedure _CHECK_READ_$$numVertsTex(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "numVertsTex"} {:array "$$numVertsTex"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$numVertsTex && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$numVertsTex);
  requires {:source_name "numVertsTex"} {:array "$$numVertsTex"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$numVertsTex && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$numVertsTex: bool;

procedure {:inline 1} _LOG_WRITE_$$numVertsTex(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$numVertsTex, _WRITE_READ_BENIGN_FLAG_$$numVertsTex;



implementation {:inline 1} _LOG_WRITE_$$numVertsTex(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$numVertsTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$numVertsTex == _value then true else _WRITE_HAS_OCCURRED_$$numVertsTex);
    _WRITE_READ_BENIGN_FLAG_$$numVertsTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$numVertsTex == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$numVertsTex);
    return;
}



procedure _CHECK_WRITE_$$numVertsTex(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "numVertsTex"} {:array "$$numVertsTex"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$numVertsTex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$numVertsTex != _value);
  requires {:source_name "numVertsTex"} {:array "$$numVertsTex"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$numVertsTex && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$numVertsTex != _value);
  requires {:source_name "numVertsTex"} {:array "$$numVertsTex"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$numVertsTex && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$numVertsTex(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$numVertsTex;



implementation {:inline 1} _LOG_ATOMIC_$$numVertsTex(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$numVertsTex := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$numVertsTex);
    return;
}



procedure _CHECK_ATOMIC_$$numVertsTex(_P: bool, _offset: bv32);
  requires {:source_name "numVertsTex"} {:array "$$numVertsTex"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$numVertsTex && _WATCHED_OFFSET == _offset);
  requires {:source_name "numVertsTex"} {:array "$$numVertsTex"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$numVertsTex && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$numVertsTex(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$numVertsTex;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$numVertsTex(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$numVertsTex := (if _P && _WRITE_HAS_OCCURRED_$$numVertsTex && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$numVertsTex);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
