type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "dst"} {:global} $$dst: [bv32]bv32;

axiom {:array_info "$$dst"} {:global} {:elem_width 32} {:source_name "dst"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$dst: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$dst: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$dst: bool;

axiom {:array_info "$$src"} {:global} {:elem_width 32} {:source_name "src"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$src: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$src: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$src: bool;

var {:source_name "block"} {:group_shared} $$_ZZ14CUDAkernel2DCTPfS_iE5block: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ14CUDAkernel2DCTPfS_iE5block"} {:group_shared} {:elem_width 32} {:source_name "block"} {:source_elem_width 32} {:source_dimensions "528"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block: bool;

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

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:num_groups_x} num_groups_x: bv32;

const {:num_groups_y} num_groups_y: bv32;

const {:num_groups_z} num_groups_z: bv32;

function FADD32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function FSUB32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "CUDAkernel2DCT"} {:kernel} $_Z14CUDAkernel2DCTPfS_i($ImgStride: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $ImgStride == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$dst && !_WRITE_HAS_OCCURRED_$$dst && !_ATOMIC_HAS_OCCURRED_$$dst;
  requires !_READ_HAS_OCCURRED_$$src && !_WRITE_HAS_OCCURRED_$$src && !_ATOMIC_HAS_OCCURRED_$$src;
  requires !_READ_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block && !_WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block && !_ATOMIC_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block;
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
  modifies $$_ZZ14CUDAkernel2DCTPfS_iE5block, _READ_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block, _WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block, _WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block, _WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block, _WRITE_HAS_OCCURRED_$$dst, _WRITE_READ_BENIGN_FLAG_$$dst, _WRITE_READ_BENIGN_FLAG_$$dst;



implementation {:source_name "CUDAkernel2DCT"} {:kernel} $_Z14CUDAkernel2DCTPfS_i($ImgStride: bv32)
{
  var $i.0: bv32;
  var $i1.0: bv32;
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
  var v5: bool;
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
  var v28$1: bv32;
  var v28$2: bv32;
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
  var v65: bool;
  var v66$1: bv32;
  var v66$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(local_id_y$1, 8bv32), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(local_id_y$2, 8bv32), local_id_x$2);
    v1$1 := BV32_MUL(local_id_z$1, 8bv32);
    v1$2 := BV32_MUL(local_id_z$2, 8bv32);
    v2$1 := BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$1, 16bv32), v1$1), $ImgStride), BV32_MUL(group_id_x$1, 32bv32)), v0$1);
    v2$2 := BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$2, 16bv32), v1$2), $ImgStride), BV32_MUL(group_id_x$2, 32bv32)), v0$2);
    v3$1 := BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$1, 16bv32), v1$1), $ImgStride), BV32_MUL(group_id_x$1, 32bv32)), v0$1);
    v3$2 := BV32_ADD(BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(group_id_y$2, 16bv32), v1$2), $ImgStride), BV32_MUL(group_id_x$2, 32bv32)), v0$2);
    v4$1 := BV32_MUL(v1$1, 33bv32);
    v4$2 := BV32_MUL(v1$2, 33bv32);
    $i.0 := 0bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 2} true;
    v5 := BV32_ULT($i.0, 8bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v5 && !v5;
    v7$1 := BV32_MUL(BV32_ADD(v1$1, local_id_x$1), 33bv32);
    v7$2 := BV32_MUL(BV32_ADD(v1$2, local_id_x$2), 33bv32);
    v8$1 := BV32_SUB(0bv32, local_id_x$1);
    v8$2 := BV32_SUB(0bv32, local_id_x$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1)]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v9$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1)];
    v9$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 9} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 7bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 7bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 9} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 7bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 7bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v10$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 7bv32)];
    v10$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 7bv32)];
    v11$1 := FADD32(v9$1, v10$1);
    v11$2 := FADD32(v9$2, v10$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 1bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 1bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v12$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 1bv32)];
    v12$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 1bv32)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 11} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 6bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 6bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 11} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 6bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 6bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v13$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 6bv32)];
    v13$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 6bv32)];
    v14$1 := FADD32(v12$1, v13$1);
    v14$2 := FADD32(v12$2, v13$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 12} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 2bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 12} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 12} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 2bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v15$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 2bv32)];
    v15$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 2bv32)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 5bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 5bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 5bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 5bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v16$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 5bv32)];
    v16$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 5bv32)];
    v17$1 := FADD32(v15$1, v16$1);
    v17$2 := FADD32(v15$2, v16$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 3bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 3bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v18$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 3bv32)];
    v18$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 3bv32)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 4bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 4bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v19$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 4bv32)];
    v19$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 4bv32)];
    v20$1 := FADD32(v18$1, v19$1);
    v20$2 := FADD32(v18$2, v19$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1)]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v21$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1)];
    v21$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 7bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 7bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 7bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 7bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v22$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 7bv32)];
    v22$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 7bv32)];
    v23$1 := FSUB32(v21$1, v22$1);
    v23$2 := FSUB32(v21$2, v22$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 18} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 6bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 6bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 18} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 6bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 6bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v24$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 6bv32)];
    v24$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 6bv32)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 1bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 1bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v25$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 1bv32)];
    v25$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 1bv32)];
    v26$1 := FSUB32(v24$1, v25$1);
    v26$2 := FSUB32(v24$2, v25$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 20} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 2bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 20} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 2bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v27$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 2bv32)];
    v27$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 2bv32)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 21} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 5bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 5bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 21} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 5bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 5bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v28$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 5bv32)];
    v28$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 5bv32)];
    v29$1 := FSUB32(v27$1, v28$1);
    v29$2 := FSUB32(v27$2, v28$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 4bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 4bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v30$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 4bv32)];
    v30$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 4bv32)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 3bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 3bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v31$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 3bv32)];
    v31$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 3bv32)];
    v32$1 := FSUB32(v30$1, v31$1);
    v32$2 := FSUB32(v30$2, v31$2);
    v33$1 := FADD32(v11$1, v20$1);
    v33$2 := FADD32(v11$2, v20$2);
    v34$1 := FSUB32(v11$1, v20$1);
    v34$2 := FSUB32(v11$2, v20$2);
    v35$1 := FADD32(v14$1, v17$1);
    v35$2 := FADD32(v14$2, v17$2);
    v36$1 := FSUB32(v14$1, v17$1);
    v36$2 := FSUB32(v14$2, v17$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), FMUL32(1052050675bv32, FADD32(v33$1, v35$1)), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2));
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), FMUL32(1052050675bv32, FADD32(v33$2, v35$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1)] := FMUL32(1052050675bv32, FADD32(v33$1, v35$1));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2)] := FMUL32(1052050675bv32, FADD32(v33$2, v35$2));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 25} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 2bv32), FMUL32(1052050675bv32, FADD32(FMUL32(1067924853bv32, v34$1), FMUL32(1057655764bv32, v36$1))), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 25} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 2bv32), FMUL32(1052050675bv32, FADD32(FMUL32(1067924853bv32, v34$2), FMUL32(1057655764bv32, v36$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 2bv32)] := FMUL32(1052050675bv32, FADD32(FMUL32(1067924853bv32, v34$1), FMUL32(1057655764bv32, v36$1)));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 2bv32)] := FMUL32(1052050675bv32, FADD32(FMUL32(1067924853bv32, v34$2), FMUL32(1057655764bv32, v36$2)));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 4bv32), FMUL32(1052050675bv32, FSUB32(v33$1, v35$1)), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 4bv32), FMUL32(1052050675bv32, FSUB32(v33$2, v35$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 4bv32)] := FMUL32(1052050675bv32, FSUB32(v33$1, v35$1));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 4bv32)] := FMUL32(1052050675bv32, FSUB32(v33$2, v35$2));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 6bv32), FMUL32(1052050675bv32, FSUB32(FMUL32(1057655764bv32, v34$1), FMUL32(1067924853bv32, v36$1))), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 6bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 6bv32));
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 6bv32), FMUL32(1052050675bv32, FSUB32(FMUL32(1057655764bv32, v34$2), FMUL32(1067924853bv32, v36$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 6bv32)] := FMUL32(1052050675bv32, FSUB32(FMUL32(1057655764bv32, v34$1), FMUL32(1067924853bv32, v36$1)));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 6bv32)] := FMUL32(1052050675bv32, FSUB32(FMUL32(1057655764bv32, v34$2), FMUL32(1067924853bv32, v36$2)));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 1bv32), FMUL32(1052050675bv32, FSUB32(FADD32(FSUB32(FMUL32(1068599942bv32, v23$1), FMUL32(1066828567bv32, v26$1)), FMUL32(1061757774bv32, v29$1)), FMUL32(1049445039bv32, v32$1))), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 1bv32), FMUL32(1052050675bv32, FSUB32(FADD32(FSUB32(FMUL32(1068599942bv32, v23$2), FMUL32(1066828567bv32, v26$2)), FMUL32(1061757774bv32, v29$2)), FMUL32(1049445039bv32, v32$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 1bv32)] := FMUL32(1052050675bv32, FSUB32(FADD32(FSUB32(FMUL32(1068599942bv32, v23$1), FMUL32(1066828567bv32, v26$1)), FMUL32(1061757774bv32, v29$1)), FMUL32(1049445039bv32, v32$1)));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 1bv32)] := FMUL32(1052050675bv32, FSUB32(FADD32(FSUB32(FMUL32(1068599942bv32, v23$2), FMUL32(1066828567bv32, v26$2)), FMUL32(1061757774bv32, v29$2)), FMUL32(1049445039bv32, v32$2)));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 3bv32), FMUL32(1052050675bv32, FADD32(FSUB32(FADD32(FMUL32(1066828567bv32, v23$1), FMUL32(1049445039bv32, v26$1)), FMUL32(1068599942bv32, v29$1)), FMUL32(1061757774bv32, v32$1))), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 3bv32), FMUL32(1052050675bv32, FADD32(FSUB32(FADD32(FMUL32(1066828567bv32, v23$2), FMUL32(1049445039bv32, v26$2)), FMUL32(1068599942bv32, v29$2)), FMUL32(1061757774bv32, v32$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 3bv32)] := FMUL32(1052050675bv32, FADD32(FSUB32(FADD32(FMUL32(1066828567bv32, v23$1), FMUL32(1049445039bv32, v26$1)), FMUL32(1068599942bv32, v29$1)), FMUL32(1061757774bv32, v32$1)));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 3bv32)] := FMUL32(1052050675bv32, FADD32(FSUB32(FADD32(FMUL32(1066828567bv32, v23$2), FMUL32(1049445039bv32, v26$2)), FMUL32(1068599942bv32, v29$2)), FMUL32(1061757774bv32, v32$2)));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 5bv32), FMUL32(1052050675bv32, FSUB32(FADD32(FADD32(FMUL32(1061757774bv32, v23$1), FMUL32(1068599942bv32, v26$1)), FMUL32(1049445039bv32, v29$1)), FMUL32(1066828567bv32, v32$1))), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 5bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 5bv32));
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 5bv32), FMUL32(1052050675bv32, FSUB32(FADD32(FADD32(FMUL32(1061757774bv32, v23$2), FMUL32(1068599942bv32, v26$2)), FMUL32(1049445039bv32, v29$2)), FMUL32(1066828567bv32, v32$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 5bv32)] := FMUL32(1052050675bv32, FSUB32(FADD32(FADD32(FMUL32(1061757774bv32, v23$1), FMUL32(1068599942bv32, v26$1)), FMUL32(1049445039bv32, v29$1)), FMUL32(1066828567bv32, v32$1)));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 5bv32)] := FMUL32(1052050675bv32, FSUB32(FADD32(FADD32(FMUL32(1061757774bv32, v23$2), FMUL32(1068599942bv32, v26$2)), FMUL32(1049445039bv32, v29$2)), FMUL32(1066828567bv32, v32$2)));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 31} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 7bv32), FMUL32(1052050675bv32, FADD32(FADD32(FADD32(FMUL32(1049445039bv32, v23$1), FMUL32(1061757774bv32, v26$1)), FMUL32(1066828567bv32, v29$1)), FMUL32(1068599942bv32, v32$1))), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 7bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 7bv32));
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 31} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 7bv32), FMUL32(1052050675bv32, FADD32(FADD32(FADD32(FMUL32(1049445039bv32, v23$2), FMUL32(1061757774bv32, v26$2)), FMUL32(1066828567bv32, v29$2)), FMUL32(1068599942bv32, v32$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(BV32_ADD(v7$1, v0$1), v8$1), 7bv32)] := FMUL32(1052050675bv32, FADD32(FADD32(FADD32(FMUL32(1049445039bv32, v23$1), FMUL32(1061757774bv32, v26$1)), FMUL32(1066828567bv32, v29$1)), FMUL32(1068599942bv32, v32$1)));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_ADD(v7$2, v0$2), v8$2), 7bv32)] := FMUL32(1052050675bv32, FADD32(FADD32(FADD32(FMUL32(1049445039bv32, v23$2), FMUL32(1061757774bv32, v26$2)), FMUL32(1066828567bv32, v29$2)), FMUL32(1068599942bv32, v32$2)));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(v4$1, v0$1), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(v4$1, v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_24"} {:captureState "check_state_24"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_24"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(v4$2, v0$2), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v4$2, v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v37$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(v4$1, v0$1)];
    v37$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v4$2, v0$2)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 33} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 231bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 231bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_25"} {:captureState "check_state_25"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_25"} {:sourceloc} {:sourceloc_num 33} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 231bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 231bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v38$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 231bv32)];
    v38$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 231bv32)];
    v39$1 := FADD32(v37$1, v38$1);
    v39$2 := FADD32(v37$2, v38$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 33bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 33bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_26"} {:captureState "check_state_26"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_26"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 33bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 33bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v40$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 33bv32)];
    v40$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 33bv32)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 35} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 198bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 198bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_27"} {:captureState "check_state_27"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_27"} {:sourceloc} {:sourceloc_num 35} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 198bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 198bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v41$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 198bv32)];
    v41$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 198bv32)];
    v42$1 := FADD32(v40$1, v41$1);
    v42$2 := FADD32(v40$2, v41$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 36} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 66bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 66bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_28"} {:captureState "check_state_28"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_28"} {:sourceloc} {:sourceloc_num 36} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 66bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 66bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v43$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 66bv32)];
    v43$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 66bv32)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 37} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 165bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 165bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_29"} {:captureState "check_state_29"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_29"} {:sourceloc} {:sourceloc_num 37} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 165bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 165bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v44$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 165bv32)];
    v44$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 165bv32)];
    v45$1 := FADD32(v43$1, v44$1);
    v45$2 := FADD32(v43$2, v44$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 38} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 99bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 99bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_30"} {:captureState "check_state_30"} {:sourceloc} {:sourceloc_num 38} true;
    call {:check_id "check_state_30"} {:sourceloc} {:sourceloc_num 38} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 99bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 99bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v46$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 99bv32)];
    v46$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 99bv32)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 39} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 132bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 132bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_31"} {:captureState "check_state_31"} {:sourceloc} {:sourceloc_num 39} true;
    call {:check_id "check_state_31"} {:sourceloc} {:sourceloc_num 39} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 132bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 132bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v47$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 132bv32)];
    v47$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 132bv32)];
    v48$1 := FADD32(v46$1, v47$1);
    v48$2 := FADD32(v46$2, v47$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 40} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(v4$1, v0$1), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(v4$1, v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_32"} {:captureState "check_state_32"} {:sourceloc} {:sourceloc_num 40} true;
    call {:check_id "check_state_32"} {:sourceloc} {:sourceloc_num 40} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(v4$2, v0$2), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v4$2, v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v49$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(v4$1, v0$1)];
    v49$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v4$2, v0$2)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 41} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 231bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 231bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_33"} {:captureState "check_state_33"} {:sourceloc} {:sourceloc_num 41} true;
    call {:check_id "check_state_33"} {:sourceloc} {:sourceloc_num 41} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 231bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 231bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v50$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 231bv32)];
    v50$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 231bv32)];
    v51$1 := FSUB32(v49$1, v50$1);
    v51$2 := FSUB32(v49$2, v50$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 42} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 198bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 198bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_34"} {:captureState "check_state_34"} {:sourceloc} {:sourceloc_num 42} true;
    call {:check_id "check_state_34"} {:sourceloc} {:sourceloc_num 42} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 198bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 198bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v52$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 198bv32)];
    v52$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 198bv32)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 43} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 33bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 33bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_35"} {:captureState "check_state_35"} {:sourceloc} {:sourceloc_num 43} true;
    call {:check_id "check_state_35"} {:sourceloc} {:sourceloc_num 43} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 33bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 33bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v53$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 33bv32)];
    v53$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 33bv32)];
    v54$1 := FSUB32(v52$1, v53$1);
    v54$2 := FSUB32(v52$2, v53$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 44} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 66bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 66bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_36"} {:captureState "check_state_36"} {:sourceloc} {:sourceloc_num 44} true;
    call {:check_id "check_state_36"} {:sourceloc} {:sourceloc_num 44} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 66bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 66bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v55$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 66bv32)];
    v55$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 66bv32)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 45} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 165bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 165bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_37"} {:captureState "check_state_37"} {:sourceloc} {:sourceloc_num 45} true;
    call {:check_id "check_state_37"} {:sourceloc} {:sourceloc_num 45} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 165bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 165bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v56$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 165bv32)];
    v56$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 165bv32)];
    v57$1 := FSUB32(v55$1, v56$1);
    v57$2 := FSUB32(v55$2, v56$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 46} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 132bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 132bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_38"} {:captureState "check_state_38"} {:sourceloc} {:sourceloc_num 46} true;
    call {:check_id "check_state_38"} {:sourceloc} {:sourceloc_num 46} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 132bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 132bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v58$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 132bv32)];
    v58$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 132bv32)];
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 47} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 99bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 99bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_39"} {:captureState "check_state_39"} {:sourceloc} {:sourceloc_num 47} true;
    call {:check_id "check_state_39"} {:sourceloc} {:sourceloc_num 47} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 99bv32), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 99bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v59$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 99bv32)];
    v59$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 99bv32)];
    v60$1 := FSUB32(v58$1, v59$1);
    v60$2 := FSUB32(v58$2, v59$2);
    v61$1 := FADD32(v39$1, v48$1);
    v61$2 := FADD32(v39$2, v48$2);
    v62$1 := FSUB32(v39$1, v48$1);
    v62$2 := FSUB32(v39$2, v48$2);
    v63$1 := FADD32(v42$1, v45$1);
    v63$2 := FADD32(v42$2, v45$2);
    v64$1 := FSUB32(v42$1, v45$1);
    v64$2 := FSUB32(v42$2, v45$2);
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 48} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(v4$1, v0$1), FMUL32(1052050675bv32, FADD32(v61$1, v63$1)), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(v4$1, v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(v4$2, v0$2));
    assume {:do_not_predicate} {:check_id "check_state_40"} {:captureState "check_state_40"} {:sourceloc} {:sourceloc_num 48} true;
    call {:check_id "check_state_40"} {:sourceloc} {:sourceloc_num 48} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(v4$2, v0$2), FMUL32(1052050675bv32, FADD32(v61$2, v63$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(v4$1, v0$1)] := FMUL32(1052050675bv32, FADD32(v61$1, v63$1));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(v4$2, v0$2)] := FMUL32(1052050675bv32, FADD32(v61$2, v63$2));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 49} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 66bv32), FMUL32(1052050675bv32, FADD32(FMUL32(1067924853bv32, v62$1), FMUL32(1057655764bv32, v64$1))), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 66bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 66bv32));
    assume {:do_not_predicate} {:check_id "check_state_41"} {:captureState "check_state_41"} {:sourceloc} {:sourceloc_num 49} true;
    call {:check_id "check_state_41"} {:sourceloc} {:sourceloc_num 49} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 66bv32), FMUL32(1052050675bv32, FADD32(FMUL32(1067924853bv32, v62$2), FMUL32(1057655764bv32, v64$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 66bv32)] := FMUL32(1052050675bv32, FADD32(FMUL32(1067924853bv32, v62$1), FMUL32(1057655764bv32, v64$1)));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 66bv32)] := FMUL32(1052050675bv32, FADD32(FMUL32(1067924853bv32, v62$2), FMUL32(1057655764bv32, v64$2)));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 50} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 132bv32), FMUL32(1052050675bv32, FSUB32(v61$1, v63$1)), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 132bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 132bv32));
    assume {:do_not_predicate} {:check_id "check_state_42"} {:captureState "check_state_42"} {:sourceloc} {:sourceloc_num 50} true;
    call {:check_id "check_state_42"} {:sourceloc} {:sourceloc_num 50} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 132bv32), FMUL32(1052050675bv32, FSUB32(v61$2, v63$2)));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 132bv32)] := FMUL32(1052050675bv32, FSUB32(v61$1, v63$1));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 132bv32)] := FMUL32(1052050675bv32, FSUB32(v61$2, v63$2));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 51} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 198bv32), FMUL32(1052050675bv32, FSUB32(FMUL32(1057655764bv32, v62$1), FMUL32(1067924853bv32, v64$1))), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 198bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 198bv32));
    assume {:do_not_predicate} {:check_id "check_state_43"} {:captureState "check_state_43"} {:sourceloc} {:sourceloc_num 51} true;
    call {:check_id "check_state_43"} {:sourceloc} {:sourceloc_num 51} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 198bv32), FMUL32(1052050675bv32, FSUB32(FMUL32(1057655764bv32, v62$2), FMUL32(1067924853bv32, v64$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 198bv32)] := FMUL32(1052050675bv32, FSUB32(FMUL32(1057655764bv32, v62$1), FMUL32(1067924853bv32, v64$1)));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 198bv32)] := FMUL32(1052050675bv32, FSUB32(FMUL32(1057655764bv32, v62$2), FMUL32(1067924853bv32, v64$2)));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 52} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 33bv32), FMUL32(1052050675bv32, FSUB32(FADD32(FSUB32(FMUL32(1068599942bv32, v51$1), FMUL32(1066828567bv32, v54$1)), FMUL32(1061757774bv32, v57$1)), FMUL32(1049445039bv32, v60$1))), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 33bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 33bv32));
    assume {:do_not_predicate} {:check_id "check_state_44"} {:captureState "check_state_44"} {:sourceloc} {:sourceloc_num 52} true;
    call {:check_id "check_state_44"} {:sourceloc} {:sourceloc_num 52} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 33bv32), FMUL32(1052050675bv32, FSUB32(FADD32(FSUB32(FMUL32(1068599942bv32, v51$2), FMUL32(1066828567bv32, v54$2)), FMUL32(1061757774bv32, v57$2)), FMUL32(1049445039bv32, v60$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 33bv32)] := FMUL32(1052050675bv32, FSUB32(FADD32(FSUB32(FMUL32(1068599942bv32, v51$1), FMUL32(1066828567bv32, v54$1)), FMUL32(1061757774bv32, v57$1)), FMUL32(1049445039bv32, v60$1)));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 33bv32)] := FMUL32(1052050675bv32, FSUB32(FADD32(FSUB32(FMUL32(1068599942bv32, v51$2), FMUL32(1066828567bv32, v54$2)), FMUL32(1061757774bv32, v57$2)), FMUL32(1049445039bv32, v60$2)));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 53} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 99bv32), FMUL32(1052050675bv32, FADD32(FSUB32(FADD32(FMUL32(1066828567bv32, v51$1), FMUL32(1049445039bv32, v54$1)), FMUL32(1068599942bv32, v57$1)), FMUL32(1061757774bv32, v60$1))), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 99bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 99bv32));
    assume {:do_not_predicate} {:check_id "check_state_45"} {:captureState "check_state_45"} {:sourceloc} {:sourceloc_num 53} true;
    call {:check_id "check_state_45"} {:sourceloc} {:sourceloc_num 53} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 99bv32), FMUL32(1052050675bv32, FADD32(FSUB32(FADD32(FMUL32(1066828567bv32, v51$2), FMUL32(1049445039bv32, v54$2)), FMUL32(1068599942bv32, v57$2)), FMUL32(1061757774bv32, v60$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 99bv32)] := FMUL32(1052050675bv32, FADD32(FSUB32(FADD32(FMUL32(1066828567bv32, v51$1), FMUL32(1049445039bv32, v54$1)), FMUL32(1068599942bv32, v57$1)), FMUL32(1061757774bv32, v60$1)));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 99bv32)] := FMUL32(1052050675bv32, FADD32(FSUB32(FADD32(FMUL32(1066828567bv32, v51$2), FMUL32(1049445039bv32, v54$2)), FMUL32(1068599942bv32, v57$2)), FMUL32(1061757774bv32, v60$2)));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 54} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 165bv32), FMUL32(1052050675bv32, FSUB32(FADD32(FADD32(FMUL32(1061757774bv32, v51$1), FMUL32(1068599942bv32, v54$1)), FMUL32(1049445039bv32, v57$1)), FMUL32(1066828567bv32, v60$1))), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 165bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 165bv32));
    assume {:do_not_predicate} {:check_id "check_state_46"} {:captureState "check_state_46"} {:sourceloc} {:sourceloc_num 54} true;
    call {:check_id "check_state_46"} {:sourceloc} {:sourceloc_num 54} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 165bv32), FMUL32(1052050675bv32, FSUB32(FADD32(FADD32(FMUL32(1061757774bv32, v51$2), FMUL32(1068599942bv32, v54$2)), FMUL32(1049445039bv32, v57$2)), FMUL32(1066828567bv32, v60$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 165bv32)] := FMUL32(1052050675bv32, FSUB32(FADD32(FADD32(FMUL32(1061757774bv32, v51$1), FMUL32(1068599942bv32, v54$1)), FMUL32(1049445039bv32, v57$1)), FMUL32(1066828567bv32, v60$1)));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 165bv32)] := FMUL32(1052050675bv32, FSUB32(FADD32(FADD32(FMUL32(1061757774bv32, v51$2), FMUL32(1068599942bv32, v54$2)), FMUL32(1049445039bv32, v57$2)), FMUL32(1066828567bv32, v60$2)));
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 55} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), 231bv32), FMUL32(1052050675bv32, FADD32(FADD32(FADD32(FMUL32(1049445039bv32, v51$1), FMUL32(1061757774bv32, v54$1)), FMUL32(1066828567bv32, v57$1)), FMUL32(1068599942bv32, v60$1))), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 231bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 231bv32));
    assume {:do_not_predicate} {:check_id "check_state_47"} {:captureState "check_state_47"} {:sourceloc} {:sourceloc_num 55} true;
    call {:check_id "check_state_47"} {:sourceloc} {:sourceloc_num 55} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), 231bv32), FMUL32(1052050675bv32, FADD32(FADD32(FADD32(FMUL32(1049445039bv32, v51$2), FMUL32(1061757774bv32, v54$2)), FMUL32(1066828567bv32, v57$2)), FMUL32(1068599942bv32, v60$2))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), 231bv32)] := FMUL32(1052050675bv32, FADD32(FADD32(FADD32(FMUL32(1049445039bv32, v51$1), FMUL32(1061757774bv32, v54$1)), FMUL32(1066828567bv32, v57$1)), FMUL32(1068599942bv32, v60$1)));
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), 231bv32)] := FMUL32(1052050675bv32, FADD32(FADD32(FADD32(FMUL32(1049445039bv32, v51$2), FMUL32(1061757774bv32, v54$2)), FMUL32(1066828567bv32, v57$2)), FMUL32(1068599942bv32, v60$2)));
    $i1.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 56} true;
    v65 := BV32_ULT($i1.0, 8bv32);
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v65 && !v65;
    return;

  $truebb0:
    assume {:partition} v65 && v65;
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    call {:sourceloc} {:sourceloc_num 58} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), BV32_MUL($i1.0, 33bv32)), $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), BV32_MUL($i1.0, 33bv32))]);
    assume {:do_not_predicate} {:check_id "check_state_48"} {:captureState "check_state_48"} {:sourceloc} {:sourceloc_num 58} true;
    call {:check_id "check_state_48"} {:sourceloc} {:sourceloc_num 58} _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), BV32_MUL($i1.0, 33bv32)), $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), BV32_MUL($i1.0, 33bv32))]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(true, true);
    v66$1 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), BV32_MUL($i1.0, 33bv32))];
    v66$2 := $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), BV32_MUL($i1.0, 33bv32))];
    call _PRE_WARP_SYNC_$$dst_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 59} _LOG_WRITE_$$dst(true, BV32_ADD(v3$1, BV32_MUL($i1.0, $ImgStride)), v66$1, $$dst[BV32_ADD(v3$1, BV32_MUL($i1.0, $ImgStride))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$dst(true, BV32_ADD(v3$2, BV32_MUL($i1.0, $ImgStride)));
    assume {:do_not_predicate} {:check_id "check_state_49"} {:captureState "check_state_49"} {:sourceloc} {:sourceloc_num 59} true;
    call {:check_id "check_state_49"} {:sourceloc} {:sourceloc_num 59} _CHECK_WRITE_$$dst(true, BV32_ADD(v3$2, BV32_MUL($i1.0, $ImgStride)), v66$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$dst"} true;
    call _POST_WARP_SYNC_$$dst_WRITE(true, true);
    $$dst[BV32_ADD(v3$1, BV32_MUL($i1.0, $ImgStride))] := v66$1;
    $$dst[BV32_ADD(v3$2, BV32_MUL($i1.0, $ImgStride))] := v66$2;
    $i1.0 := BV32_ADD($i1.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $5;

  $truebb:
    assume {:partition} v5 && v5;
    havoc v6$1, v6$2;
    call _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    call {:sourceloc} {:sourceloc_num 5} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$1, v0$1), BV32_MUL($i.0, 33bv32)), v6$1, $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), BV32_MUL($i.0, 33bv32))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), BV32_MUL($i.0, 33bv32)));
    assume {:do_not_predicate} {:check_id "check_state_50"} {:captureState "check_state_50"} {:sourceloc} {:sourceloc_num 5} true;
    call {:check_id "check_state_50"} {:sourceloc} {:sourceloc_num 5} _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(true, BV32_ADD(BV32_ADD(v4$2, v0$2), BV32_MUL($i.0, 33bv32)), v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block"} true;
    call _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(true, true);
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[1bv1][BV32_ADD(BV32_ADD(v4$1, v0$1), BV32_MUL($i.0, 33bv32))] := v6$1;
    $$_ZZ14CUDAkernel2DCTPfS_iE5block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(v4$2, v0$2), BV32_MUL($i.0, 33bv32))] := v6$2;
    $i.0 := BV32_ADD($i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $1;
}



axiom (if group_size_x == 8bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 2bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 32bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _PRE_WARP_SYNC_$$dst_WRITE(_P$1: bool, _P$2: bool);



procedure {:inline 1} _POST_WARP_SYNC_$$dst_WRITE(_P$1: bool, _P$2: bool);



const _WATCHED_VALUE_$$dst: bv32;

procedure {:inline 1} _LOG_READ_$$dst(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$dst;



implementation {:inline 1} _LOG_READ_$$dst(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dst == _value then true else _READ_HAS_OCCURRED_$$dst);
    return;
}



procedure _CHECK_READ_$$dst(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dst"} {:array "$$dst"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$dst);
  requires {:source_name "dst"} {:array "$$dst"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$dst: bool;

procedure {:inline 1} _LOG_WRITE_$$dst(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$dst, _WRITE_READ_BENIGN_FLAG_$$dst;



implementation {:inline 1} _LOG_WRITE_$$dst(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dst == _value then true else _WRITE_HAS_OCCURRED_$$dst);
    _WRITE_READ_BENIGN_FLAG_$$dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dst == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$dst);
    return;
}



procedure _CHECK_WRITE_$$dst(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "dst"} {:array "$$dst"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dst != _value);
  requires {:source_name "dst"} {:array "$$dst"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$dst != _value);
  requires {:source_name "dst"} {:array "$$dst"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$dst(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$dst;



implementation {:inline 1} _LOG_ATOMIC_$$dst(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$dst := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$dst);
    return;
}



procedure _CHECK_ATOMIC_$$dst(_P: bool, _offset: bv32);
  requires {:source_name "dst"} {:array "$$dst"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset);
  requires {:source_name "dst"} {:array "$$dst"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dst(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$dst;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$dst(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$dst := (if _P && _WRITE_HAS_OCCURRED_$$dst && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$dst);
    return;
}



const _WATCHED_VALUE_$$src: bv32;

procedure {:inline 1} _LOG_READ_$$src(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$src;



implementation {:inline 1} _LOG_READ_$$src(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$src := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$src == _value then true else _READ_HAS_OCCURRED_$$src);
    return;
}



procedure _CHECK_READ_$$src(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "src"} {:array "$$src"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$src && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$src);
  requires {:source_name "src"} {:array "$$src"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$src && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$src: bool;

procedure {:inline 1} _LOG_WRITE_$$src(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$src, _WRITE_READ_BENIGN_FLAG_$$src;



implementation {:inline 1} _LOG_WRITE_$$src(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$src := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$src == _value then true else _WRITE_HAS_OCCURRED_$$src);
    _WRITE_READ_BENIGN_FLAG_$$src := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$src == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$src);
    return;
}



procedure _CHECK_WRITE_$$src(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "src"} {:array "$$src"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$src && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$src != _value);
  requires {:source_name "src"} {:array "$$src"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$src && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$src != _value);
  requires {:source_name "src"} {:array "$$src"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$src && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$src(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$src;



implementation {:inline 1} _LOG_ATOMIC_$$src(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$src := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$src);
    return;
}



procedure _CHECK_ATOMIC_$$src(_P: bool, _offset: bv32);
  requires {:source_name "src"} {:array "$$src"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$src && _WATCHED_OFFSET == _offset);
  requires {:source_name "src"} {:array "$$src"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$src && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$src(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$src;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$src(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$src := (if _P && _WRITE_HAS_OCCURRED_$$src && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$src);
    return;
}



const _WATCHED_VALUE_$$_ZZ14CUDAkernel2DCTPfS_iE5block: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block;



implementation {:inline 1} _LOG_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ14CUDAkernel2DCTPfS_iE5block == _value then true else _READ_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block);
    return;
}



procedure _CHECK_READ_$$_ZZ14CUDAkernel2DCTPfS_iE5block(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "block"} {:array "$$_ZZ14CUDAkernel2DCTPfS_iE5block"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block"} {:array "$$_ZZ14CUDAkernel2DCTPfS_iE5block"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block, _WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block;



implementation {:inline 1} _LOG_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ14CUDAkernel2DCTPfS_iE5block == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ14CUDAkernel2DCTPfS_iE5block == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block);
    return;
}



procedure _CHECK_WRITE_$$_ZZ14CUDAkernel2DCTPfS_iE5block(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "block"} {:array "$$_ZZ14CUDAkernel2DCTPfS_iE5block"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ14CUDAkernel2DCTPfS_iE5block != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block"} {:array "$$_ZZ14CUDAkernel2DCTPfS_iE5block"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ14CUDAkernel2DCTPfS_iE5block != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block"} {:array "$$_ZZ14CUDAkernel2DCTPfS_iE5block"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ14CUDAkernel2DCTPfS_iE5block(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ14CUDAkernel2DCTPfS_iE5block(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ14CUDAkernel2DCTPfS_iE5block(_P: bool, _offset: bv32);
  requires {:source_name "block"} {:array "$$_ZZ14CUDAkernel2DCTPfS_iE5block"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block"} {:array "$$_ZZ14CUDAkernel2DCTPfS_iE5block"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ14CUDAkernel2DCTPfS_iE5block);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

implementation {:inline 1} _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block;
    assume !_ATOMIC_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_READ(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon0_Then, anon0_Else;

  anon0_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block;
    return;

  anon0_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block;
    assume !_WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block;
    assume !_ATOMIC_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block;
    goto anon0;

  anon0:
    havoc $$_ZZ14CUDAkernel2DCTPfS_iE5block;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$_ZZ14CUDAkernel2DCTPfS_iE5block_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$_ZZ14CUDAkernel2DCTPfS_iE5block;
    goto anon0;

  anon0:
    havoc $$_ZZ14CUDAkernel2DCTPfS_iE5block;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _PRE_WARP_SYNC_$$dst_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_READ_HAS_OCCURRED_$$dst;
    assume !_WRITE_HAS_OCCURRED_$$dst;
    assume !_ATOMIC_HAS_OCCURRED_$$dst;
    goto anon0;

  anon0:
    havoc $$dst;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}



implementation {:inline 1} _POST_WARP_SYNC_$$dst_WRITE(_P$1: bool, _P$2: bool)
{

  entry:
    goto anon1_Then, anon1_Else;

  anon1_Then:
    assume {:partition} _P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32);
    goto reset_warps;

  reset_warps:
    assume !_WRITE_HAS_OCCURRED_$$dst;
    goto anon0;

  anon0:
    havoc $$dst;
    return;

  anon1_Else:
    assume {:partition} !(_P$1 == _P$2 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && BV32_DIV(BV32_ADD(local_id_x$1, BV32_ADD(BV32_MUL(local_id_y$1, group_size_x), BV32_MUL(local_id_z$1, BV32_MUL(group_size_x, group_size_y)))), 32bv32) == BV32_DIV(BV32_ADD(local_id_x$2, BV32_ADD(BV32_MUL(local_id_y$2, group_size_x), BV32_MUL(local_id_z$2, BV32_MUL(group_size_x, group_size_y)))), 32bv32));
    return;
}


