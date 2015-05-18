type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



axiom {:array_info "$$va"} {:global} {:elem_width 32} {:source_name "va"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$va: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$va: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$va: bool;

axiom {:array_info "$$vb"} {:global} {:elem_width 32} {:source_name "vb"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$vb: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$vb: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$vb: bool;

var {:source_name "vresult"} {:global} $$vresult: [bv32]bv32;

axiom {:array_info "$$vresult"} {:global} {:elem_width 32} {:source_name "vresult"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$vresult: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$vresult: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$vresult: bool;

var {:source_name "localA"} {:group_shared} $$_ZZ13mxm_amp_tiledPKfS0_PfE6localA: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA"} {:group_shared} {:elem_width 32} {:source_name "localA"} {:source_elem_width 32} {:source_dimensions "16,16"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA: bool;

var {:source_name "localB"} {:group_shared} $$_ZZ13mxm_amp_tiledPKfS0_PfE6localB: [bv1][bv32]bv32;

axiom {:array_info "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB"} {:group_shared} {:elem_width 32} {:source_name "localB"} {:source_elem_width 32} {:source_dimensions "16,16"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*,16"} _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "mxm_amp_tiled"} {:kernel} $_Z13mxm_amp_tiledPKfS0_Pf();
  requires !_READ_HAS_OCCURRED_$$va && !_WRITE_HAS_OCCURRED_$$va && !_ATOMIC_HAS_OCCURRED_$$va;
  requires !_READ_HAS_OCCURRED_$$vb && !_WRITE_HAS_OCCURRED_$$vb && !_ATOMIC_HAS_OCCURRED_$$vb;
  requires !_READ_HAS_OCCURRED_$$vresult && !_WRITE_HAS_OCCURRED_$$vresult && !_ATOMIC_HAS_OCCURRED_$$vresult;
  requires !_READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA && !_WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA && !_ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA;
  requires !_READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB && !_WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB && !_ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB;
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
  modifies $$_ZZ13mxm_amp_tiledPKfS0_PfE6localA, $$_ZZ13mxm_amp_tiledPKfS0_PfE6localB, _WRITE_HAS_OCCURRED_$$vresult, _WRITE_READ_BENIGN_FLAG_$$vresult, _WRITE_READ_BENIGN_FLAG_$$vresult, _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA, _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA, _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA, _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB, _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB, _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB, $$vresult, _TRACKING, _TRACKING, _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA, _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB;



implementation {:source_name "mxm_amp_tiled"} {:kernel} $_Z13mxm_amp_tiledPKfS0_Pf()
{
  var $temp_c.0$1: bv32;
  var $temp_c.0$2: bv32;
  var $i.0: bv32;
  var $temp_c.1$1: bv32;
  var $temp_c.1$2: bv32;
  var $k.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bool;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv32;
  var v4$2: bv32;
  var v5: bool;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv32;
  var v7$2: bv32;


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_id_y$1, group_size_y), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_id_y$2, group_size_y), local_id_y$2);
    $temp_c.0$1, $i.0 := 0bv32, 0bv32;
    $temp_c.0$2 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v2 := BV32_SLT($i.0, 256bv32);
    goto __partitioned_block_$truebb_0, $falsebb;

  $falsebb:
    assume {:partition} !v2 && !v2;
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$vresult(true, BV32_ADD(BV32_MUL(v1$1, 256bv32), v0$1), $temp_c.0$1, $$vresult[BV32_ADD(BV32_MUL(v1$1, 256bv32), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$vresult(true, BV32_ADD(BV32_MUL(v1$2, 256bv32), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$vresult(true, BV32_ADD(BV32_MUL(v1$2, 256bv32), v0$2), $temp_c.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$vresult"} true;
    $$vresult[BV32_ADD(BV32_MUL(v1$1, 256bv32), v0$1)] := $temp_c.0$1;
    $$vresult[BV32_ADD(BV32_MUL(v1$2, 256bv32), v0$2)] := $temp_c.0$2;
    return;

  __partitioned_block_$truebb_0:
    assume {:partition} v2 && v2;
    havoc v3$1, v3$2;
    call {:sourceloc} {:sourceloc_num 4} _LOG_WRITE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA(true, BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1), v3$1, $$_ZZ13mxm_amp_tiledPKfS0_PfE6localA[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA(true, BV32_ADD(BV32_MUL(local_id_y$2, 16bv32), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 4} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 4} _CHECK_WRITE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA(true, BV32_ADD(BV32_MUL(local_id_y$2, 16bv32), local_id_x$2), v3$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA"} true;
    $$_ZZ13mxm_amp_tiledPKfS0_PfE6localA[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1)] := v3$1;
    $$_ZZ13mxm_amp_tiledPKfS0_PfE6localA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 16bv32), local_id_x$2)] := v3$2;
    havoc v4$1, v4$2;
    call {:sourceloc} {:sourceloc_num 6} _LOG_WRITE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB(true, BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1), v4$1, $$_ZZ13mxm_amp_tiledPKfS0_PfE6localB[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB(true, BV32_ADD(BV32_MUL(local_id_y$2, 16bv32), local_id_x$2));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 6} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 6} _CHECK_WRITE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB(true, BV32_ADD(BV32_MUL(local_id_y$2, 16bv32), local_id_x$2), v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB"} true;
    $$_ZZ13mxm_amp_tiledPKfS0_PfE6localB[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), local_id_x$1)] := v4$1;
    $$_ZZ13mxm_amp_tiledPKfS0_PfE6localB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 16bv32), local_id_x$2)] := v4$2;
    goto __partitioned_block_$truebb_1;

  __partitioned_block_$truebb_1:
    call {:sourceloc_num 7} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $temp_c.1$1, $k.0 := $temp_c.0$1, 0bv32;
    $temp_c.1$2 := $temp_c.0$2;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $3;

  $3:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 8} true;
    v5 := BV32_ULT($k.0, 16bv32);
    goto $truebb0, __partitioned_block_$falsebb0_0;

  __partitioned_block_$falsebb0_0:
    assume {:partition} !v5 && !v5;
    goto __partitioned_block_$falsebb0_1;

  __partitioned_block_$falsebb0_1:
    call {:sourceloc_num 14} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    $temp_c.0$1, $i.0 := $temp_c.1$1, BV32_ADD($i.0, 16bv32);
    $temp_c.0$2 := $temp_c.1$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $1;

  $truebb0:
    assume {:partition} v5 && v5;
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 10} true;
    v6$1 := $$_ZZ13mxm_amp_tiledPKfS0_PfE6localA[1bv1][BV32_ADD(BV32_MUL(local_id_y$1, 16bv32), $k.0)];
    v6$2 := $$_ZZ13mxm_amp_tiledPKfS0_PfE6localA[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(local_id_y$2, 16bv32), $k.0)];
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 11} true;
    v7$1 := $$_ZZ13mxm_amp_tiledPKfS0_PfE6localB[1bv1][BV32_ADD(BV32_MUL($k.0, 16bv32), local_id_x$1)];
    v7$2 := $$_ZZ13mxm_amp_tiledPKfS0_PfE6localB[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL($k.0, 16bv32), local_id_x$2)];
    $temp_c.1$1, $k.0 := FADD32($temp_c.1$1, FMUL32(v6$1, v7$1)), BV32_ADD($k.0, 1bv32);
    $temp_c.1$2 := FADD32($temp_c.1$2, FMUL32(v6$2, v7$2));
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $3;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 16bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 16bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13mxm_amp_tiledPKfS0_PfE6localA, $$_ZZ13mxm_amp_tiledPKfS0_PfE6localB, $$vresult, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$_ZZ13mxm_amp_tiledPKfS0_PfE6localA, $$_ZZ13mxm_amp_tiledPKfS0_PfE6localB, $$vresult, _TRACKING;



const _WATCHED_VALUE_$$va: bv32;

procedure {:inline 1} _LOG_READ_$$va(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$va;



implementation {:inline 1} _LOG_READ_$$va(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$va := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$va == _value then true else _READ_HAS_OCCURRED_$$va);
    return;
}



procedure _CHECK_READ_$$va(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "va"} {:array "$$va"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$va);
  requires {:source_name "va"} {:array "$$va"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$va: bool;

procedure {:inline 1} _LOG_WRITE_$$va(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$va, _WRITE_READ_BENIGN_FLAG_$$va;



implementation {:inline 1} _LOG_WRITE_$$va(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$va := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$va == _value then true else _WRITE_HAS_OCCURRED_$$va);
    _WRITE_READ_BENIGN_FLAG_$$va := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$va == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$va);
    return;
}



procedure _CHECK_WRITE_$$va(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "va"} {:array "$$va"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$va != _value);
  requires {:source_name "va"} {:array "$$va"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$va != _value);
  requires {:source_name "va"} {:array "$$va"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$va(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$va;



implementation {:inline 1} _LOG_ATOMIC_$$va(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$va := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$va);
    return;
}



procedure _CHECK_ATOMIC_$$va(_P: bool, _offset: bv32);
  requires {:source_name "va"} {:array "$$va"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset);
  requires {:source_name "va"} {:array "$$va"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$va(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$va;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$va(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$va := (if _P && _WRITE_HAS_OCCURRED_$$va && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$va);
    return;
}



const _WATCHED_VALUE_$$vb: bv32;

procedure {:inline 1} _LOG_READ_$$vb(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$vb;



implementation {:inline 1} _LOG_READ_$$vb(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$vb := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vb == _value then true else _READ_HAS_OCCURRED_$$vb);
    return;
}



procedure _CHECK_READ_$$vb(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vb"} {:array "$$vb"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$vb);
  requires {:source_name "vb"} {:array "$$vb"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$vb: bool;

procedure {:inline 1} _LOG_WRITE_$$vb(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$vb, _WRITE_READ_BENIGN_FLAG_$$vb;



implementation {:inline 1} _LOG_WRITE_$$vb(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$vb := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vb == _value then true else _WRITE_HAS_OCCURRED_$$vb);
    _WRITE_READ_BENIGN_FLAG_$$vb := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vb == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$vb);
    return;
}



procedure _CHECK_WRITE_$$vb(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vb"} {:array "$$vb"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vb != _value);
  requires {:source_name "vb"} {:array "$$vb"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vb != _value);
  requires {:source_name "vb"} {:array "$$vb"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$vb(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$vb;



implementation {:inline 1} _LOG_ATOMIC_$$vb(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$vb := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$vb);
    return;
}



procedure _CHECK_ATOMIC_$$vb(_P: bool, _offset: bv32);
  requires {:source_name "vb"} {:array "$$vb"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset);
  requires {:source_name "vb"} {:array "$$vb"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vb(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$vb;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vb(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$vb := (if _P && _WRITE_HAS_OCCURRED_$$vb && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$vb);
    return;
}



const _WATCHED_VALUE_$$vresult: bv32;

procedure {:inline 1} _LOG_READ_$$vresult(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$vresult;



implementation {:inline 1} _LOG_READ_$$vresult(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$vresult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vresult == _value then true else _READ_HAS_OCCURRED_$$vresult);
    return;
}



procedure _CHECK_READ_$$vresult(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vresult"} {:array "$$vresult"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$vresult);
  requires {:source_name "vresult"} {:array "$$vresult"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$vresult: bool;

procedure {:inline 1} _LOG_WRITE_$$vresult(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$vresult, _WRITE_READ_BENIGN_FLAG_$$vresult;



implementation {:inline 1} _LOG_WRITE_$$vresult(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$vresult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vresult == _value then true else _WRITE_HAS_OCCURRED_$$vresult);
    _WRITE_READ_BENIGN_FLAG_$$vresult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vresult == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$vresult);
    return;
}



procedure _CHECK_WRITE_$$vresult(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "vresult"} {:array "$$vresult"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vresult != _value);
  requires {:source_name "vresult"} {:array "$$vresult"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$vresult != _value);
  requires {:source_name "vresult"} {:array "$$vresult"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$vresult(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$vresult;



implementation {:inline 1} _LOG_ATOMIC_$$vresult(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$vresult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$vresult);
    return;
}



procedure _CHECK_ATOMIC_$$vresult(_P: bool, _offset: bv32);
  requires {:source_name "vresult"} {:array "$$vresult"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset);
  requires {:source_name "vresult"} {:array "$$vresult"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vresult(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$vresult;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$vresult(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$vresult := (if _P && _WRITE_HAS_OCCURRED_$$vresult && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$vresult);
    return;
}



const _WATCHED_VALUE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA;



implementation {:inline 1} _LOG_READ_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA == _value then true else _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA);
    return;
}



procedure _CHECK_READ_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "localA"} {:array "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "localA"} {:array "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA, _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA;



implementation {:inline 1} _LOG_WRITE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA);
    return;
}



procedure _CHECK_WRITE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "localA"} {:array "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "localA"} {:array "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "localA"} {:array "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA(_P: bool, _offset: bv32);
  requires {:source_name "localA"} {:array "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "localA"} {:array "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA);
    return;
}



const _WATCHED_VALUE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB: bv32;

procedure {:inline 1} _LOG_READ_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB;



implementation {:inline 1} _LOG_READ_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB == _value then true else _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB);
    return;
}



procedure _CHECK_READ_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "localB"} {:array "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "localB"} {:array "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB: bool;

procedure {:inline 1} _LOG_WRITE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB, _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB;



implementation {:inline 1} _LOG_WRITE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB == _value then true else _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB);
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB);
    return;
}



procedure _CHECK_WRITE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "localB"} {:array "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "localB"} {:array "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "localB"} {:array "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB;



implementation {:inline 1} _LOG_ATOMIC_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB);
    return;
}



procedure _CHECK_ATOMIC_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB(_P: bool, _offset: bv32);
  requires {:source_name "localB"} {:array "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "localB"} {:array "$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB := (if _P && _WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$vresult;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$vresult;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$vresult;
    goto anon6;

  anon6:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$vresult;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13mxm_amp_tiledPKfS0_PfE6localA;
    goto anon4;

  anon4:
    havoc $$_ZZ13mxm_amp_tiledPKfS0_PfE6localB;
    goto anon5;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localA;
    goto anon1;

  anon1:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$_ZZ13mxm_amp_tiledPKfS0_PfE6localB;
    goto anon2;

  anon2:
    goto anon10_Then, anon10_Else;

  anon10_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon5;

  anon5:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$vresult;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$vresult;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$vresult;
    goto anon6;

  anon6:
    goto anon11_Then, anon11_Else;

  anon11_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon8;

  anon8:
    havoc _TRACKING;
    return;

  anon11_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$vresult;
    goto anon8;

  anon10_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$_ZZ13mxm_amp_tiledPKfS0_PfE6localA;
    goto anon4;

  anon4:
    havoc $$_ZZ13mxm_amp_tiledPKfS0_PfE6localB;
    goto anon5;

  anon9_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
