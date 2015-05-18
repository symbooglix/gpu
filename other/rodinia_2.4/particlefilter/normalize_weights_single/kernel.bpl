type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "weights"} {:global} $$weights: [bv32]bv32;

axiom {:array_info "$$weights"} {:global} {:elem_width 32} {:source_name "weights"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$weights: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$weights: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$weights: bool;

axiom {:array_info "$$partial_sums"} {:global} {:elem_width 32} {:source_name "partial_sums"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$partial_sums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$partial_sums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$partial_sums: bool;

var {:source_name "CDF"} {:global} $$CDF: [bv32]bv32;

axiom {:array_info "$$CDF"} {:global} {:elem_width 32} {:source_name "CDF"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$CDF: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$CDF: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$CDF: bool;

var {:source_name "u"} {:global} $$u: [bv32]bv32;

axiom {:array_info "$$u"} {:global} {:elem_width 32} {:source_name "u"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$u: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$u: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$u: bool;

var {:source_name "seed"} {:global} $$seed: [bv32]bv32;

axiom {:array_info "$$seed"} {:global} {:elem_width 32} {:source_name "seed"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$seed: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$seed: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$seed: bool;

var {:source_name "sumWeights"} {:group_shared} $$normalize_weights_kernel.sumWeights: [bv1][bv32]bv32;

axiom {:array_info "$$normalize_weights_kernel.sumWeights"} {:group_shared} {:elem_width 32} {:source_name "sumWeights"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights: bool;

var {:source_name "u1"} {:group_shared} $$normalize_weights_kernel.u1: [bv1][bv32]bv32;

axiom {:array_info "$$normalize_weights_kernel.u1"} {:group_shared} {:elem_width 32} {:source_name "u1"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$normalize_weights_kernel.u1: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.u1: bool;

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

function FABS32(bv32) : bv32;

function FADD32(bv32, bv32) : bv32;

function FDIV32(bv32, bv32) : bv32;

function FMUL32(bv32, bv32) : bv32;

function SI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsrem"} BV32_SREM(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

procedure {:source_name "normalize_weights_kernel"} {:kernel} $normalize_weights_kernel($Nparticles: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $Nparticles == 400000bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$weights && !_WRITE_HAS_OCCURRED_$$weights && !_ATOMIC_HAS_OCCURRED_$$weights;
  requires !_READ_HAS_OCCURRED_$$partial_sums && !_WRITE_HAS_OCCURRED_$$partial_sums && !_ATOMIC_HAS_OCCURRED_$$partial_sums;
  requires !_READ_HAS_OCCURRED_$$CDF && !_WRITE_HAS_OCCURRED_$$CDF && !_ATOMIC_HAS_OCCURRED_$$CDF;
  requires !_READ_HAS_OCCURRED_$$u && !_WRITE_HAS_OCCURRED_$$u && !_ATOMIC_HAS_OCCURRED_$$u;
  requires !_READ_HAS_OCCURRED_$$seed && !_WRITE_HAS_OCCURRED_$$seed && !_ATOMIC_HAS_OCCURRED_$$seed;
  requires !_READ_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights && !_WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights && !_ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;
  requires !_READ_HAS_OCCURRED_$$normalize_weights_kernel.u1 && !_WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1 && !_ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.u1;
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
  modifies $$normalize_weights_kernel.sumWeights, $$normalize_weights_kernel.u1, _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights, _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.sumWeights, _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.sumWeights, $$weights, $$CDF, $$u, $$seed, _TRACKING, _READ_HAS_OCCURRED_$$weights, _READ_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights, _WRITE_HAS_OCCURRED_$$weights, _WRITE_READ_BENIGN_FLAG_$$weights, _WRITE_READ_BENIGN_FLAG_$$weights, _TRACKING, _WRITE_HAS_OCCURRED_$$CDF, _WRITE_READ_BENIGN_FLAG_$$CDF, _WRITE_READ_BENIGN_FLAG_$$CDF, _READ_HAS_OCCURRED_$$CDF, _READ_HAS_OCCURRED_$$seed, _WRITE_HAS_OCCURRED_$$seed, _WRITE_READ_BENIGN_FLAG_$$seed, _WRITE_READ_BENIGN_FLAG_$$seed, _WRITE_HAS_OCCURRED_$$u, _WRITE_READ_BENIGN_FLAG_$$u, _WRITE_READ_BENIGN_FLAG_$$u, _TRACKING, _READ_HAS_OCCURRED_$$u, _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1, _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.u1, _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.u1, _TRACKING, _READ_HAS_OCCURRED_$$normalize_weights_kernel.u1;



implementation {:source_name "normalize_weights_kernel"} {:kernel} $normalize_weights_kernel($Nparticles: bv32)
{
  var $x.i.0$1: bv32;
  var $x.i.0$2: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
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
  var v7$1: bool;
  var v7$2: bool;
  var v8$1: bv32;
  var v8$2: bv32;
  var v9$1: bool;
  var v9$2: bool;
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
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bool;
  var v16$2: bool;
  var v17$1: bv32;
  var v17$2: bv32;
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
  var _HAVOC_bv32$1: bv32;
  var _HAVOC_bv32$2: bv32;


  __partitioned_block_$0_0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := local_id_x$1;
    v1$2 := local_id_x$2;
    v2$1 := 0bv32 == v1$1;
    v2$2 := 0bv32 == v1$2;
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p5$1 := false;
    p5$2 := false;
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
    p0$1 := (if v2$1 then v2$1 else p0$1);
    p0$2 := (if v2$2 then v2$2 else p0$2);
    havoc _HAVOC_bv32$1, _HAVOC_bv32$2;
    v3$1 := (if p0$1 then _HAVOC_bv32$1 else v3$1);
    v3$2 := (if p0$2 then _HAVOC_bv32$2 else v3$2);
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$normalize_weights_kernel.sumWeights(p0$1, 0bv32, v3$1, $$normalize_weights_kernel.sumWeights[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.sumWeights(p0$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$normalize_weights_kernel.sumWeights(p0$2, 0bv32, v3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$normalize_weights_kernel.sumWeights"} true;
    $$normalize_weights_kernel.sumWeights[1bv1][0bv32] := (if p0$1 then v3$1 else $$normalize_weights_kernel.sumWeights[1bv1][0bv32]);
    $$normalize_weights_kernel.sumWeights[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := (if p0$2 then v3$2 else $$normalize_weights_kernel.sumWeights[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 6} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    v4$1 := BV32_SLT(v0$1, $Nparticles);
    v4$2 := BV32_SLT(v0$2, $Nparticles);
    p2$1 := (if v4$1 then v4$1 else p2$1);
    p2$2 := (if v4$2 then v4$2 else p2$2);
    call {:sourceloc} {:sourceloc_num 8} _LOG_READ_$$weights(p2$1, v0$1, $$weights[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 8} _CHECK_READ_$$weights(p2$2, v0$2, $$weights[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$weights"} true;
    v5$1 := (if p2$1 then $$weights[v0$1] else v5$1);
    v5$2 := (if p2$2 then $$weights[v0$2] else v5$2);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 9} true;
    v6$1 := (if p2$1 then $$normalize_weights_kernel.sumWeights[1bv1][0bv32] else v6$1);
    v6$2 := (if p2$2 then $$normalize_weights_kernel.sumWeights[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v6$2);
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$weights(p2$1, v0$1, FDIV32(v5$1, v6$1), $$weights[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$weights(p2$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$weights(p2$2, v0$2, FDIV32(v5$2, v6$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$weights"} true;
    $$weights[v0$1] := (if p2$1 then FDIV32(v5$1, v6$1) else $$weights[v0$1]);
    $$weights[v0$2] := (if p2$2 then FDIV32(v5$2, v6$2) else $$weights[v0$2]);
    goto __partitioned_block_$0_2;

  __partitioned_block_$0_2:
    call {:sourceloc_num 12} $bugle_barrier_duplicated_1(0bv1, 1bv1);
    v7$1 := v0$1 == 0bv32;
    v7$2 := v0$2 == 0bv32;
    p4$1 := (if v7$1 then v7$1 else p4$1);
    p4$2 := (if v7$2 then v7$2 else p4$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$weights(p4$1, 0bv32, $$weights[0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$weights(p4$2, 0bv32, $$weights[0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$weights"} true;
    v8$1 := (if p4$1 then $$weights[0bv32] else v8$1);
    v8$2 := (if p4$2 then $$weights[0bv32] else v8$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_WRITE_$$CDF(p4$1, 0bv32, v8$1, $$CDF[0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$CDF(p4$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 15} _CHECK_WRITE_$$CDF(p4$2, 0bv32, v8$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$CDF"} true;
    $$CDF[0bv32] := (if p4$1 then v8$1 else $$CDF[0bv32]);
    $$CDF[0bv32] := (if p4$2 then v8$2 else $$CDF[0bv32]);
    $x.i.0$1 := (if p4$1 then 1bv32 else $x.i.0$1);
    $x.i.0$2 := (if p4$2 then 1bv32 else $x.i.0$2);
    p5$1 := (if p4$1 then true else p5$1);
    p5$2 := (if p4$2 then true else p5$2);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $6;

  $6:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$normalize_weights_kernel.u1 ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 16} p5$1 ==> true;
    v9$1 := (if p5$1 then BV32_SLT($x.i.0$1, $Nparticles) else v9$1);
    v9$2 := (if p5$2 then BV32_SLT($x.i.0$2, $Nparticles) else v9$2);
    p6$1 := false;
    p6$2 := false;
    p6$1 := (if p5$1 && v9$1 then v9$1 else p6$1);
    p6$2 := (if p5$2 && v9$2 then v9$2 else p6$2);
    p5$1 := (if p5$1 && !v9$1 then v9$1 else p5$1);
    p5$2 := (if p5$2 && !v9$2 then v9$2 else p5$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_READ_$$weights(p6$1, $x.i.0$1, $$weights[$x.i.0$1]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 18} _CHECK_READ_$$weights(p6$2, $x.i.0$2, $$weights[$x.i.0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$weights"} true;
    v10$1 := (if p6$1 then $$weights[$x.i.0$1] else v10$1);
    v10$2 := (if p6$2 then $$weights[$x.i.0$2] else v10$2);
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$CDF(p6$1, BV32_SUB($x.i.0$1, 1bv32), $$CDF[BV32_SUB($x.i.0$1, 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$CDF(p6$2, BV32_SUB($x.i.0$2, 1bv32), $$CDF[BV32_SUB($x.i.0$2, 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$CDF"} true;
    v11$1 := (if p6$1 then $$CDF[BV32_SUB($x.i.0$1, 1bv32)] else v11$1);
    v11$2 := (if p6$2 then $$CDF[BV32_SUB($x.i.0$2, 1bv32)] else v11$2);
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$CDF(p6$1, $x.i.0$1, FADD32(v10$1, v11$1), $$CDF[$x.i.0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$CDF(p6$2, $x.i.0$2);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$CDF(p6$2, $x.i.0$2, FADD32(v10$2, v11$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$CDF"} true;
    $$CDF[$x.i.0$1] := (if p6$1 then FADD32(v10$1, v11$1) else $$CDF[$x.i.0$1]);
    $$CDF[$x.i.0$2] := (if p6$2 then FADD32(v10$2, v11$2) else $$CDF[$x.i.0$2]);
    $x.i.0$1 := (if p6$1 then BV32_ADD($x.i.0$1, 1bv32) else $x.i.0$1);
    $x.i.0$2 := (if p6$2 then BV32_ADD($x.i.0$2, 1bv32) else $x.i.0$2);
    p5$1 := (if p6$1 then true else p5$1);
    p5$2 := (if p6$2 then true else p5$2);
    goto $6.backedge, __partitioned_block_$6.tail_0;

  __partitioned_block_$6.tail_0:
    assume !p5$1 && !p5$2;
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$seed(p4$1, v0$1, $$seed[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$seed(p4$2, v0$2, $$seed[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$seed"} true;
    v12$1 := (if p4$1 then $$seed[v0$1] else v12$1);
    v12$2 := (if p4$2 then $$seed[v0$2] else v12$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_WRITE_$$seed(p4$1, v0$1, BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v12$1), 12345bv32), 2147483647bv32), $$seed[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$seed(p4$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 23} _CHECK_WRITE_$$seed(p4$2, v0$2, BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v12$2), 12345bv32), 2147483647bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$seed"} true;
    $$seed[v0$1] := (if p4$1 then BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v12$1), 12345bv32), 2147483647bv32) else $$seed[v0$1]);
    $$seed[v0$2] := (if p4$2 then BV32_SREM(BV32_ADD(BV32_MUL(1103515245bv32, v12$2), 12345bv32), 2147483647bv32) else $$seed[v0$2]);
    call {:sourceloc} {:sourceloc_num 24} _LOG_READ_$$seed(p4$1, v0$1, $$seed[v0$1]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 24} _CHECK_READ_$$seed(p4$2, v0$2, $$seed[v0$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$seed"} true;
    v13$1 := (if p4$1 then $$seed[v0$1] else v13$1);
    v13$2 := (if p4$2 then $$seed[v0$2] else v13$2);
    call {:sourceloc} {:sourceloc_num 25} _LOG_WRITE_$$u(p4$1, 0bv32, FMUL32(FDIV32(1065353216bv32, SI32_TO_FP32($Nparticles)), FABS32(FDIV32(SI32_TO_FP32(v13$1), SI32_TO_FP32(2147483647bv32)))), $$u[0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$u(p4$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 25} _CHECK_WRITE_$$u(p4$2, 0bv32, FMUL32(FDIV32(1065353216bv32, SI32_TO_FP32($Nparticles)), FABS32(FDIV32(SI32_TO_FP32(v13$2), SI32_TO_FP32(2147483647bv32)))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$u"} true;
    $$u[0bv32] := (if p4$1 then FMUL32(FDIV32(1065353216bv32, SI32_TO_FP32($Nparticles)), FABS32(FDIV32(SI32_TO_FP32(v13$1), SI32_TO_FP32(2147483647bv32)))) else $$u[0bv32]);
    $$u[0bv32] := (if p4$2 then FMUL32(FDIV32(1065353216bv32, SI32_TO_FP32($Nparticles)), FABS32(FDIV32(SI32_TO_FP32(v13$2), SI32_TO_FP32(2147483647bv32)))) else $$u[0bv32]);
    goto __partitioned_block_$6.tail_1;

  __partitioned_block_$6.tail_1:
    call {:sourceloc_num 27} $bugle_barrier_duplicated_2(0bv1, 1bv1);
    v14$1 := 0bv32 == v1$1;
    v14$2 := 0bv32 == v1$2;
    p8$1 := (if v14$1 then v14$1 else p8$1);
    p8$2 := (if v14$2 then v14$2 else p8$2);
    call {:sourceloc} {:sourceloc_num 29} _LOG_READ_$$u(p8$1, 0bv32, $$u[0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 29} _CHECK_READ_$$u(p8$2, 0bv32, $$u[0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$u"} true;
    v15$1 := (if p8$1 then $$u[0bv32] else v15$1);
    v15$2 := (if p8$2 then $$u[0bv32] else v15$2);
    call {:sourceloc} {:sourceloc_num 30} _LOG_WRITE_$$normalize_weights_kernel.u1(p8$1, 0bv32, v15$1, $$normalize_weights_kernel.u1[1bv1][0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.u1(p8$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 30} _CHECK_WRITE_$$normalize_weights_kernel.u1(p8$2, 0bv32, v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$normalize_weights_kernel.u1"} true;
    $$normalize_weights_kernel.u1[1bv1][0bv32] := (if p8$1 then v15$1 else $$normalize_weights_kernel.u1[1bv1][0bv32]);
    $$normalize_weights_kernel.u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] := (if p8$2 then v15$2 else $$normalize_weights_kernel.u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    goto __partitioned_block_$6.tail_2;

  __partitioned_block_$6.tail_2:
    call {:sourceloc_num 32} $bugle_barrier_duplicated_3(1bv1, 0bv1);
    v16$1 := BV32_SLT(v0$1, $Nparticles);
    v16$2 := BV32_SLT(v0$2, $Nparticles);
    p10$1 := (if v16$1 then v16$1 else p10$1);
    p10$2 := (if v16$2 then v16$2 else p10$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_READ_$$normalize_weights_kernel.u1(p10$1, 0bv32, $$normalize_weights_kernel.u1[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 34} _CHECK_READ_$$normalize_weights_kernel.u1(p10$2, 0bv32, $$normalize_weights_kernel.u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$normalize_weights_kernel.u1"} true;
    v17$1 := (if p10$1 then $$normalize_weights_kernel.u1[1bv1][0bv32] else v17$1);
    v17$2 := (if p10$2 then $$normalize_weights_kernel.u1[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32] else v17$2);
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$u(p10$1, v0$1, FADD32(v17$1, FDIV32(SI32_TO_FP32(v0$1), SI32_TO_FP32($Nparticles))), $$u[v0$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$u(p10$2, v0$2);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$u(p10$2, v0$2, FADD32(v17$2, FDIV32(SI32_TO_FP32(v0$2), SI32_TO_FP32($Nparticles))));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$u"} true;
    $$u[v0$1] := (if p10$1 then FADD32(v17$1, FDIV32(SI32_TO_FP32(v0$1), SI32_TO_FP32($Nparticles))) else $$u[v0$1]);
    $$u[v0$2] := (if p10$2 then FADD32(v17$2, FDIV32(SI32_TO_FP32(v0$2), SI32_TO_FP32($Nparticles))) else $$u[v0$2]);
    return;

  $6.backedge:
    assume {:backedge} p5$1 || p5$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $6;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 512bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 782bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$normalize_weights_kernel.sumWeights, $$normalize_weights_kernel.u1, $$weights, $$CDF, $$u, $$seed, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 0bv1;
  requires $1 == 1bv1;
  modifies $$normalize_weights_kernel.sumWeights, $$normalize_weights_kernel.u1, $$weights, $$CDF, $$u, $$seed, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_2($0: bv1, $1: bv1);
  requires $0 == 0bv1;
  requires $1 == 1bv1;
  modifies $$normalize_weights_kernel.sumWeights, $$normalize_weights_kernel.u1, $$weights, $$CDF, $$u, $$seed, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_3($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$normalize_weights_kernel.sumWeights, $$normalize_weights_kernel.u1, $$weights, $$CDF, $$u, $$seed, _TRACKING;



const _WATCHED_VALUE_$$weights: bv32;

procedure {:inline 1} _LOG_READ_$$weights(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$weights;



implementation {:inline 1} _LOG_READ_$$weights(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$weights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights == _value then true else _READ_HAS_OCCURRED_$$weights);
    return;
}



procedure _CHECK_READ_$$weights(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$weights);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$weights: bool;

procedure {:inline 1} _LOG_WRITE_$$weights(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$weights, _WRITE_READ_BENIGN_FLAG_$$weights;



implementation {:inline 1} _LOG_WRITE_$$weights(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$weights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights == _value then true else _WRITE_HAS_OCCURRED_$$weights);
    _WRITE_READ_BENIGN_FLAG_$$weights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$weights);
    return;
}



procedure _CHECK_WRITE_$$weights(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights != _value);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$weights != _value);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$weights(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$weights;



implementation {:inline 1} _LOG_ATOMIC_$$weights(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$weights := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$weights);
    return;
}



procedure _CHECK_ATOMIC_$$weights(_P: bool, _offset: bv32);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset);
  requires {:source_name "weights"} {:array "$$weights"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$weights(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$weights;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$weights(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$weights := (if _P && _WRITE_HAS_OCCURRED_$$weights && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$weights);
    return;
}



const _WATCHED_VALUE_$$partial_sums: bv32;

procedure {:inline 1} _LOG_READ_$$partial_sums(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$partial_sums;



implementation {:inline 1} _LOG_READ_$$partial_sums(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums == _value then true else _READ_HAS_OCCURRED_$$partial_sums);
    return;
}



procedure _CHECK_READ_$$partial_sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$partial_sums);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$partial_sums: bool;

procedure {:inline 1} _LOG_WRITE_$$partial_sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$partial_sums, _WRITE_READ_BENIGN_FLAG_$$partial_sums;



implementation {:inline 1} _LOG_WRITE_$$partial_sums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums == _value then true else _WRITE_HAS_OCCURRED_$$partial_sums);
    _WRITE_READ_BENIGN_FLAG_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$partial_sums);
    return;
}



procedure _CHECK_WRITE_$$partial_sums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums != _value);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$partial_sums != _value);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$partial_sums(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$partial_sums;



implementation {:inline 1} _LOG_ATOMIC_$$partial_sums(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$partial_sums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$partial_sums);
    return;
}



procedure _CHECK_ATOMIC_$$partial_sums(_P: bool, _offset: bv32);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);
  requires {:source_name "partial_sums"} {:array "$$partial_sums"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$partial_sums(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$partial_sums;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$partial_sums(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$partial_sums := (if _P && _WRITE_HAS_OCCURRED_$$partial_sums && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$partial_sums);
    return;
}



const _WATCHED_VALUE_$$CDF: bv32;

procedure {:inline 1} _LOG_READ_$$CDF(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$CDF;



implementation {:inline 1} _LOG_READ_$$CDF(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$CDF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$CDF == _value then true else _READ_HAS_OCCURRED_$$CDF);
    return;
}



procedure _CHECK_READ_$$CDF(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "CDF"} {:array "$$CDF"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$CDF);
  requires {:source_name "CDF"} {:array "$$CDF"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$CDF: bool;

procedure {:inline 1} _LOG_WRITE_$$CDF(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$CDF, _WRITE_READ_BENIGN_FLAG_$$CDF;



implementation {:inline 1} _LOG_WRITE_$$CDF(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$CDF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$CDF == _value then true else _WRITE_HAS_OCCURRED_$$CDF);
    _WRITE_READ_BENIGN_FLAG_$$CDF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$CDF == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$CDF);
    return;
}



procedure _CHECK_WRITE_$$CDF(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "CDF"} {:array "$$CDF"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$CDF != _value);
  requires {:source_name "CDF"} {:array "$$CDF"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$CDF != _value);
  requires {:source_name "CDF"} {:array "$$CDF"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$CDF(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$CDF;



implementation {:inline 1} _LOG_ATOMIC_$$CDF(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$CDF := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$CDF);
    return;
}



procedure _CHECK_ATOMIC_$$CDF(_P: bool, _offset: bv32);
  requires {:source_name "CDF"} {:array "$$CDF"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset);
  requires {:source_name "CDF"} {:array "$$CDF"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$CDF(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$CDF;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$CDF(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$CDF := (if _P && _WRITE_HAS_OCCURRED_$$CDF && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$CDF);
    return;
}



const _WATCHED_VALUE_$$u: bv32;

procedure {:inline 1} _LOG_READ_$$u(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$u;



implementation {:inline 1} _LOG_READ_$$u(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$u := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u == _value then true else _READ_HAS_OCCURRED_$$u);
    return;
}



procedure _CHECK_READ_$$u(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "u"} {:array "$$u"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$u);
  requires {:source_name "u"} {:array "$$u"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$u: bool;

procedure {:inline 1} _LOG_WRITE_$$u(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$u, _WRITE_READ_BENIGN_FLAG_$$u;



implementation {:inline 1} _LOG_WRITE_$$u(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$u := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u == _value then true else _WRITE_HAS_OCCURRED_$$u);
    _WRITE_READ_BENIGN_FLAG_$$u := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$u);
    return;
}



procedure _CHECK_WRITE_$$u(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "u"} {:array "$$u"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u != _value);
  requires {:source_name "u"} {:array "$$u"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$u != _value);
  requires {:source_name "u"} {:array "$$u"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$u(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$u;



implementation {:inline 1} _LOG_ATOMIC_$$u(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$u := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$u);
    return;
}



procedure _CHECK_ATOMIC_$$u(_P: bool, _offset: bv32);
  requires {:source_name "u"} {:array "$$u"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset);
  requires {:source_name "u"} {:array "$$u"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$u(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$u;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$u(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$u := (if _P && _WRITE_HAS_OCCURRED_$$u && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$u);
    return;
}



const _WATCHED_VALUE_$$seed: bv32;

procedure {:inline 1} _LOG_READ_$$seed(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$seed;



implementation {:inline 1} _LOG_READ_$$seed(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$seed := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seed == _value then true else _READ_HAS_OCCURRED_$$seed);
    return;
}



procedure _CHECK_READ_$$seed(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "seed"} {:array "$$seed"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$seed);
  requires {:source_name "seed"} {:array "$$seed"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$seed: bool;

procedure {:inline 1} _LOG_WRITE_$$seed(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$seed, _WRITE_READ_BENIGN_FLAG_$$seed;



implementation {:inline 1} _LOG_WRITE_$$seed(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$seed := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seed == _value then true else _WRITE_HAS_OCCURRED_$$seed);
    _WRITE_READ_BENIGN_FLAG_$$seed := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seed == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$seed);
    return;
}



procedure _CHECK_WRITE_$$seed(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "seed"} {:array "$$seed"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seed != _value);
  requires {:source_name "seed"} {:array "$$seed"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$seed != _value);
  requires {:source_name "seed"} {:array "$$seed"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$seed(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$seed;



implementation {:inline 1} _LOG_ATOMIC_$$seed(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$seed := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$seed);
    return;
}



procedure _CHECK_ATOMIC_$$seed(_P: bool, _offset: bv32);
  requires {:source_name "seed"} {:array "$$seed"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset);
  requires {:source_name "seed"} {:array "$$seed"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$seed(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$seed;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$seed(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$seed := (if _P && _WRITE_HAS_OCCURRED_$$seed && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$seed);
    return;
}



const _WATCHED_VALUE_$$normalize_weights_kernel.sumWeights: bv32;

procedure {:inline 1} _LOG_READ_$$normalize_weights_kernel.sumWeights(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;



implementation {:inline 1} _LOG_READ_$$normalize_weights_kernel.sumWeights(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalize_weights_kernel.sumWeights == _value then true else _READ_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights);
    return;
}



procedure _CHECK_READ_$$normalize_weights_kernel.sumWeights(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sumWeights"} {:array "$$normalize_weights_kernel.sumWeights"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.sumWeights && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sumWeights"} {:array "$$normalize_weights_kernel.sumWeights"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.sumWeights: bool;

procedure {:inline 1} _LOG_WRITE_$$normalize_weights_kernel.sumWeights(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights, _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.sumWeights;



implementation {:inline 1} _LOG_WRITE_$$normalize_weights_kernel.sumWeights(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalize_weights_kernel.sumWeights == _value then true else _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights);
    _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.sumWeights := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalize_weights_kernel.sumWeights == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.sumWeights);
    return;
}



procedure _CHECK_WRITE_$$normalize_weights_kernel.sumWeights(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sumWeights"} {:array "$$normalize_weights_kernel.sumWeights"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalize_weights_kernel.sumWeights != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sumWeights"} {:array "$$normalize_weights_kernel.sumWeights"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalize_weights_kernel.sumWeights != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sumWeights"} {:array "$$normalize_weights_kernel.sumWeights"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$normalize_weights_kernel.sumWeights(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;



implementation {:inline 1} _LOG_ATOMIC_$$normalize_weights_kernel.sumWeights(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights);
    return;
}



procedure _CHECK_ATOMIC_$$normalize_weights_kernel.sumWeights(_P: bool, _offset: bv32);
  requires {:source_name "sumWeights"} {:array "$$normalize_weights_kernel.sumWeights"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sumWeights"} {:array "$$normalize_weights_kernel.sumWeights"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.sumWeights(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.sumWeights;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.sumWeights(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.sumWeights := (if _P && _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.sumWeights);
    return;
}



const _WATCHED_VALUE_$$normalize_weights_kernel.u1: bv32;

procedure {:inline 1} _LOG_READ_$$normalize_weights_kernel.u1(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$normalize_weights_kernel.u1;



implementation {:inline 1} _LOG_READ_$$normalize_weights_kernel.u1(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$normalize_weights_kernel.u1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalize_weights_kernel.u1 == _value then true else _READ_HAS_OCCURRED_$$normalize_weights_kernel.u1);
    return;
}



procedure _CHECK_READ_$$normalize_weights_kernel.u1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "u1"} {:array "$$normalize_weights_kernel.u1"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1 && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.u1 && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "u1"} {:array "$$normalize_weights_kernel.u1"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.u1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.u1: bool;

procedure {:inline 1} _LOG_WRITE_$$normalize_weights_kernel.u1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1, _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.u1;



implementation {:inline 1} _LOG_WRITE_$$normalize_weights_kernel.u1(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalize_weights_kernel.u1 == _value then true else _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1);
    _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.u1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalize_weights_kernel.u1 == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.u1);
    return;
}



procedure _CHECK_WRITE_$$normalize_weights_kernel.u1(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "u1"} {:array "$$normalize_weights_kernel.u1"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalize_weights_kernel.u1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "u1"} {:array "$$normalize_weights_kernel.u1"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$normalize_weights_kernel.u1 && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$normalize_weights_kernel.u1 != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "u1"} {:array "$$normalize_weights_kernel.u1"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.u1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$normalize_weights_kernel.u1(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.u1;



implementation {:inline 1} _LOG_ATOMIC_$$normalize_weights_kernel.u1(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.u1 := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.u1);
    return;
}



procedure _CHECK_ATOMIC_$$normalize_weights_kernel.u1(_P: bool, _offset: bv32);
  requires {:source_name "u1"} {:array "$$normalize_weights_kernel.u1"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "u1"} {:array "$$normalize_weights_kernel.u1"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$normalize_weights_kernel.u1 && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.u1(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.u1;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.u1(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.u1 := (if _P && _WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1 && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$normalize_weights_kernel.u1);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon15_Then, anon15_Else;

  anon15_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$normalize_weights_kernel.u1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.u1;
    goto anon2;

  anon2:
    goto anon16_Then, anon16_Else;

  anon16_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$weights;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$CDF;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$CDF;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$CDF;
    goto anon7;

  anon7:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$u;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$u;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$u;
    goto anon8;

  anon8:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$seed;
    goto anon9;

  anon9:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon14;

  anon14:
    havoc _TRACKING;
    return;

  anon17_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$weights;
    goto anon11;

  anon11:
    havoc $$CDF;
    goto anon12;

  anon12:
    havoc $$u;
    goto anon13;

  anon13:
    havoc $$seed;
    goto anon14;

  anon16_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$normalize_weights_kernel.sumWeights;
    goto anon4;

  anon4:
    havoc $$normalize_weights_kernel.u1;
    goto anon5;

  anon15_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon15_Then, anon15_Else;

  anon15_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$normalize_weights_kernel.u1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.u1;
    goto anon2;

  anon2:
    goto anon16_Then, anon16_Else;

  anon16_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$weights;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$CDF;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$CDF;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$CDF;
    goto anon7;

  anon7:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$u;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$u;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$u;
    goto anon8;

  anon8:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$seed;
    goto anon9;

  anon9:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon14;

  anon14:
    havoc _TRACKING;
    return;

  anon17_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$weights;
    goto anon11;

  anon11:
    havoc $$CDF;
    goto anon12;

  anon12:
    havoc $$u;
    goto anon13;

  anon13:
    havoc $$seed;
    goto anon14;

  anon16_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$normalize_weights_kernel.sumWeights;
    goto anon4;

  anon4:
    havoc $$normalize_weights_kernel.u1;
    goto anon5;

  anon15_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_2($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon15_Then, anon15_Else;

  anon15_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$normalize_weights_kernel.u1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.u1;
    goto anon2;

  anon2:
    goto anon16_Then, anon16_Else;

  anon16_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$weights;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$CDF;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$CDF;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$CDF;
    goto anon7;

  anon7:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$u;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$u;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$u;
    goto anon8;

  anon8:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$seed;
    goto anon9;

  anon9:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon14;

  anon14:
    havoc _TRACKING;
    return;

  anon17_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$weights;
    goto anon11;

  anon11:
    havoc $$CDF;
    goto anon12;

  anon12:
    havoc $$u;
    goto anon13;

  anon13:
    havoc $$seed;
    goto anon14;

  anon16_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$normalize_weights_kernel.sumWeights;
    goto anon4;

  anon4:
    havoc $$normalize_weights_kernel.u1;
    goto anon5;

  anon15_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_3($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon15_Then, anon15_Else;

  anon15_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.sumWeights;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$normalize_weights_kernel.u1;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$normalize_weights_kernel.u1;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$normalize_weights_kernel.u1;
    goto anon2;

  anon2:
    goto anon16_Then, anon16_Else;

  anon16_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$weights;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$weights;
    goto anon6;

  anon6:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$CDF;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$CDF;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$CDF;
    goto anon7;

  anon7:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$u;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$u;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$u;
    goto anon8;

  anon8:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$seed;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$seed;
    goto anon9;

  anon9:
    goto anon17_Then, anon17_Else;

  anon17_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon14;

  anon14:
    havoc _TRACKING;
    return;

  anon17_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$weights;
    goto anon11;

  anon11:
    havoc $$CDF;
    goto anon12;

  anon12:
    havoc $$u;
    goto anon13;

  anon13:
    havoc $$seed;
    goto anon14;

  anon16_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$normalize_weights_kernel.sumWeights;
    goto anon4;

  anon4:
    havoc $$normalize_weights_kernel.u1;
    goto anon5;

  anon15_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
