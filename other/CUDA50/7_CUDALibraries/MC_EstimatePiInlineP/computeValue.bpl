type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "results"} {:global} $$results: [bv32]bv32;

axiom {:array_info "$$results"} {:global} {:elem_width 32} {:source_name "results"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$results: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$results: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$results: bool;

axiom {:array_info "$$rngStates"} {:global} {:elem_width 32} {:source_name "rngStates"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$rngStates: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$rngStates: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$rngStates: bool;

axiom {:array_info "$$localState"} {:elem_width 32} {:source_name "localState"} {:source_elem_width 32} {:source_dimensions "1"} true;

var {:source_name "sdata"} {:group_shared} $$sdata: [bv1][bv32]bv32;

axiom {:array_info "$$sdata"} {:group_shared} {:elem_width 32} {:source_name "sdata"} {:source_elem_width 32} {:source_dimensions "0"} true;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sdata: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sdata: bool;

var {:race_checking} {:group_shared} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sdata: bool;

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

function FADD32(bv32, bv32) : bv32;

function FLT32(bv32, bv32) : bool;

function FMUL32(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

procedure {:source_name "computeValue<float>"} {:kernel} $_Z12computeValueIfEvPjP17curandStateXORWOWj($numSims: bv32);
  requires !_READ_HAS_OCCURRED_$$results && !_WRITE_HAS_OCCURRED_$$results && !_ATOMIC_HAS_OCCURRED_$$results;
  requires !_READ_HAS_OCCURRED_$$rngStates && !_WRITE_HAS_OCCURRED_$$rngStates && !_ATOMIC_HAS_OCCURRED_$$rngStates;
  requires !_READ_HAS_OCCURRED_$$sdata && !_WRITE_HAS_OCCURRED_$$sdata && !_ATOMIC_HAS_OCCURRED_$$sdata;
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
  modifies $$sdata, _WRITE_HAS_OCCURRED_$$sdata, _WRITE_READ_BENIGN_FLAG_$$sdata, _WRITE_READ_BENIGN_FLAG_$$sdata, $$results, _TRACKING, _READ_HAS_OCCURRED_$$sdata, _WRITE_HAS_OCCURRED_$$results, _WRITE_READ_BENIGN_FLAG_$$results, _WRITE_READ_BENIGN_FLAG_$$results, _TRACKING;



implementation {:source_name "computeValue<float>"} {:kernel} $_Z12computeValueIfEvPjP17curandStateXORWOWj($numSims: bv32)
{
  var $pointsInside.0$1: bv32;
  var $pointsInside.0$2: bv32;
  var $i.0$1: bv32;
  var $i.0$2: bv32;
  var $pointsInside.1$1: bv32;
  var $pointsInside.1$2: bv32;
  var $s.i.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bool;
  var v2$2: bool;
  var v12: bool;
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
  var v11$1: bool;
  var v11$2: bool;
  var v13$1: bool;
  var v13$2: bool;
  var v14$1: bv32;
  var v14$2: bv32;
  var v15$1: bv32;
  var v15$2: bv32;
  var v16$1: bv32;
  var v16$2: bv32;
  var v17$1: bool;
  var v17$2: bool;
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


  $0:
    v0$1 := BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2);
    havoc v1$1, v1$2;
    $$localState$0bv32$1 := v1$1;
    $$localState$0bv32$2 := v1$2;
    $pointsInside.0$1, $i.0$1 := 0bv32, v0$1;
    $pointsInside.0$2, $i.0$2 := 0bv32, v0$2;
    p0$1 := false;
    p0$2 := false;
    p0$1 := true;
    p0$2 := true;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sdata ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sdata ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sdata ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 3} p0$1 ==> true;
    v2$1 := (if p0$1 then BV32_ULT($i.0$1, $numSims) else v2$1);
    v2$2 := (if p0$2 then BV32_ULT($i.0$2, $numSims) else v2$2);
    p1$1 := false;
    p1$2 := false;
    p2$1 := false;
    p2$2 := false;
    p3$1 := false;
    p3$2 := false;
    p4$1 := false;
    p4$2 := false;
    p1$1 := (if p0$1 && v2$1 then v2$1 else p1$1);
    p1$2 := (if p0$2 && v2$2 then v2$2 else p1$2);
    p0$1 := (if p0$1 && !v2$1 then v2$1 else p0$1);
    p0$2 := (if p0$2 && !v2$2 then v2$2 else p0$2);
    call {:sourceloc_num 5} v3$1, v3$2 := $_Z19__bugle_random_uintv(p1$1, p1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z19__bugle_random_uintv"} true;
    v4$1 := (if p1$1 then $$localState$0bv32$1 else v4$1);
    v4$2 := (if p1$2 then $$localState$0bv32$2 else v4$2);
    $$localState$0bv32$1 := (if p1$1 then BV32_ADD(v4$1, v3$1) else $$localState$0bv32$1);
    $$localState$0bv32$2 := (if p1$2 then BV32_ADD(v4$2, v3$2) else $$localState$0bv32$2);
    call {:sourceloc_num 8} v5$1, v5$2 := $_Z19__bugle_random_uintv(p1$1, p1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z19__bugle_random_uintv"} true;
    call {:sourceloc_num 9} v6$1, v6$2 := $_Z20__bugle_random_floatv(p1$1, p1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z20__bugle_random_floatv"} true;
    call {:sourceloc_num 10} v7$1, v7$2 := $_Z19__bugle_random_uintv(p1$1, p1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z19__bugle_random_uintv"} true;
    v8$1 := (if p1$1 then $$localState$0bv32$1 else v8$1);
    v8$2 := (if p1$2 then $$localState$0bv32$2 else v8$2);
    $$localState$0bv32$1 := (if p1$1 then BV32_ADD(v8$1, v7$1) else $$localState$0bv32$1);
    $$localState$0bv32$2 := (if p1$2 then BV32_ADD(v8$2, v7$2) else $$localState$0bv32$2);
    call {:sourceloc_num 13} v9$1, v9$2 := $_Z19__bugle_random_uintv(p1$1, p1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z19__bugle_random_uintv"} true;
    call {:sourceloc_num 14} v10$1, v10$2 := $_Z20__bugle_random_floatv(p1$1, p1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "$_Z20__bugle_random_floatv"} true;
    v11$1 := (if p1$1 then FLT32(FADD32(FMUL32(v6$1, v6$1), FMUL32(v10$1, v10$1)), 1065353216bv32) else v11$1);
    v11$2 := (if p1$2 then FLT32(FADD32(FMUL32(v6$2, v6$2), FMUL32(v10$2, v10$2)), 1065353216bv32) else v11$2);
    p3$1 := (if p1$1 && v11$1 then v11$1 else p3$1);
    p3$2 := (if p1$2 && v11$2 then v11$2 else p3$2);
    p2$1 := (if p1$1 && !v11$1 then !v11$1 else p2$1);
    p2$2 := (if p1$2 && !v11$2 then !v11$2 else p2$2);
    $pointsInside.1$1 := (if p2$1 then $pointsInside.0$1 else $pointsInside.1$1);
    $pointsInside.1$2 := (if p2$2 then $pointsInside.0$2 else $pointsInside.1$2);
    $pointsInside.1$1 := (if p3$1 then BV32_ADD($pointsInside.0$1, 1bv32) else $pointsInside.1$1);
    $pointsInside.1$2 := (if p3$2 then BV32_ADD($pointsInside.0$2, 1bv32) else $pointsInside.1$2);
    $pointsInside.0$1, $i.0$1 := (if p1$1 then $pointsInside.1$1 else $pointsInside.0$1), (if p1$1 then BV32_ADD($i.0$1, BV32_MUL(num_groups_x, group_size_x)) else $i.0$1);
    $pointsInside.0$2, $i.0$2 := (if p1$2 then $pointsInside.1$2 else $pointsInside.0$2), (if p1$2 then BV32_ADD($i.0$2, BV32_MUL(num_groups_x, group_size_x)) else $i.0$2);
    p0$1 := (if p1$1 then true else p0$1);
    p0$2 := (if p1$2 then true else p0$2);
    goto $1.backedge, __partitioned_block_$1.tail_0;

  __partitioned_block_$1.tail_0:
    assume !p0$1 && !p0$2;
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$sdata(true, local_id_x$1, $pointsInside.0$1, $$sdata[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sdata(true, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$sdata(true, local_id_x$2, $pointsInside.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sdata"} true;
    $$sdata[1bv1][local_id_x$1] := $pointsInside.0$1;
    $$sdata[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := $pointsInside.0$2;
    goto __partitioned_block_$1.tail_1;

  __partitioned_block_$1.tail_1:
    call {:sourceloc_num 20} $bugle_barrier_duplicated_0(1bv1, 1bv1);
    $s.i.0 := BV32_UDIV(group_size_x, 2bv32);
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $7;

  $7:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sdata ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sdata ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sdata ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 21} true;
    v12 := BV32_UGT($s.i.0, 0bv32);
    p5$1 := false;
    p5$2 := false;
    p6$1 := false;
    p6$2 := false;
    p7$1 := false;
    p7$2 := false;
    p8$1 := false;
    p8$2 := false;
    goto __partitioned_block_$truebb1_0, $falsebb1;

  $falsebb1:
    assume {:partition} !v12 && !v12;
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$sdata(true, 0bv32, $$sdata[1bv1][0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$sdata(true, 0bv32, $$sdata[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sdata"} true;
    v16$1 := $$sdata[1bv1][0bv32];
    v16$2 := $$sdata[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][0bv32];
    v17$1 := local_id_x$1 == 0bv32;
    v17$2 := local_id_x$2 == 0bv32;
    p7$1 := (if v17$1 then v17$1 else p7$1);
    p7$2 := (if v17$2 then v17$2 else p7$2);
    call {:sourceloc} {:sourceloc_num 32} _LOG_WRITE_$$results(p7$1, group_id_x$1, v16$1, $$results[group_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$results(p7$2, group_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 32} _CHECK_WRITE_$$results(p7$2, group_id_x$2, v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$results"} true;
    $$results[group_id_x$1] := (if p7$1 then v16$1 else $$results[group_id_x$1]);
    $$results[group_id_x$2] := (if p7$2 then v16$2 else $$results[group_id_x$2]);
    return;

  __partitioned_block_$truebb1_0:
    assume {:partition} v12 && v12;
    v13$1 := BV32_ULT(local_id_x$1, $s.i.0);
    v13$2 := BV32_ULT(local_id_x$2, $s.i.0);
    p6$1 := (if v13$1 then v13$1 else p6$1);
    p6$2 := (if v13$2 then v13$2 else p6$2);
    call {:sourceloc} {:sourceloc_num 24} _LOG_READ_$$sdata(p6$1, BV32_ADD(local_id_x$1, $s.i.0), $$sdata[1bv1][BV32_ADD(local_id_x$1, $s.i.0)]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 24} _CHECK_READ_$$sdata(p6$2, BV32_ADD(local_id_x$2, $s.i.0), $$sdata[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, $s.i.0)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sdata"} true;
    v14$1 := (if p6$1 then $$sdata[1bv1][BV32_ADD(local_id_x$1, $s.i.0)] else v14$1);
    v14$2 := (if p6$2 then $$sdata[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(local_id_x$2, $s.i.0)] else v14$2);
    call {:sourceloc} {:sourceloc_num 25} _LOG_READ_$$sdata(p6$1, local_id_x$1, $$sdata[1bv1][local_id_x$1]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 25} _CHECK_READ_$$sdata(p6$2, local_id_x$2, $$sdata[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sdata"} true;
    v15$1 := (if p6$1 then $$sdata[1bv1][local_id_x$1] else v15$1);
    v15$2 := (if p6$2 then $$sdata[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] else v15$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$sdata(p6$1, local_id_x$1, BV32_ADD(v15$1, v14$1), $$sdata[1bv1][local_id_x$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sdata(p6$2, local_id_x$2);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$sdata(p6$2, local_id_x$2, BV32_ADD(v15$2, v14$2));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sdata"} true;
    $$sdata[1bv1][local_id_x$1] := (if p6$1 then BV32_ADD(v15$1, v14$1) else $$sdata[1bv1][local_id_x$1]);
    $$sdata[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2] := (if p6$2 then BV32_ADD(v15$2, v14$2) else $$sdata[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][local_id_x$2]);
    goto __partitioned_block_$truebb1_1;

  __partitioned_block_$truebb1_1:
    call {:sourceloc_num 28} $bugle_barrier_duplicated_1(1bv1, 1bv1);
    $s.i.0 := BV32_LSHR($s.i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $7;

  $1.backedge:
    assume {:backedge} p0$1 || p0$2;
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $1;
}



procedure {:source_name "_Z20__bugle_random_floatv"} $_Z20__bugle_random_floatv(_P$1: bool, _P$2: bool) returns ($ret$1: bv32, $ret$2: bv32);



procedure {:source_name "_Z19__bugle_random_uintv"} $_Z19__bugle_random_uintv(_P$1: bool, _P$2: bool) returns ($ret$1: bv32, $ret$2: bv32);



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 195bv32 then 1bv1 else 0bv1) != 0bv1;

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
  requires $1 == 1bv1;
  modifies $$sdata, $$results, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 1bv1;
  modifies $$sdata, $$results, _TRACKING;



var $$localState$0bv32$1: bv32;

var $$localState$0bv32$2: bv32;

const _WATCHED_VALUE_$$results: bv32;

procedure {:inline 1} _LOG_READ_$$results(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$results;



implementation {:inline 1} _LOG_READ_$$results(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$results := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$results == _value then true else _READ_HAS_OCCURRED_$$results);
    return;
}



procedure _CHECK_READ_$$results(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "results"} {:array "$$results"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$results && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$results);
  requires {:source_name "results"} {:array "$$results"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$results && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$results: bool;

procedure {:inline 1} _LOG_WRITE_$$results(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$results, _WRITE_READ_BENIGN_FLAG_$$results;



implementation {:inline 1} _LOG_WRITE_$$results(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$results := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$results == _value then true else _WRITE_HAS_OCCURRED_$$results);
    _WRITE_READ_BENIGN_FLAG_$$results := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$results == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$results);
    return;
}



procedure _CHECK_WRITE_$$results(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "results"} {:array "$$results"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$results && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$results != _value);
  requires {:source_name "results"} {:array "$$results"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$results && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$results != _value);
  requires {:source_name "results"} {:array "$$results"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$results && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$results(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$results;



implementation {:inline 1} _LOG_ATOMIC_$$results(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$results := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$results);
    return;
}



procedure _CHECK_ATOMIC_$$results(_P: bool, _offset: bv32);
  requires {:source_name "results"} {:array "$$results"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$results && _WATCHED_OFFSET == _offset);
  requires {:source_name "results"} {:array "$$results"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$results && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$results(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$results;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$results(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$results := (if _P && _WRITE_HAS_OCCURRED_$$results && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$results);
    return;
}



const _WATCHED_VALUE_$$rngStates: bv32;

procedure {:inline 1} _LOG_READ_$$rngStates(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$rngStates;



implementation {:inline 1} _LOG_READ_$$rngStates(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$rngStates := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngStates == _value then true else _READ_HAS_OCCURRED_$$rngStates);
    return;
}



procedure _CHECK_READ_$$rngStates(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "rngStates"} {:array "$$rngStates"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$rngStates);
  requires {:source_name "rngStates"} {:array "$$rngStates"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$rngStates: bool;

procedure {:inline 1} _LOG_WRITE_$$rngStates(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$rngStates, _WRITE_READ_BENIGN_FLAG_$$rngStates;



implementation {:inline 1} _LOG_WRITE_$$rngStates(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$rngStates := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngStates == _value then true else _WRITE_HAS_OCCURRED_$$rngStates);
    _WRITE_READ_BENIGN_FLAG_$$rngStates := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngStates == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$rngStates);
    return;
}



procedure _CHECK_WRITE_$$rngStates(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "rngStates"} {:array "$$rngStates"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngStates != _value);
  requires {:source_name "rngStates"} {:array "$$rngStates"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$rngStates != _value);
  requires {:source_name "rngStates"} {:array "$$rngStates"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$rngStates(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$rngStates;



implementation {:inline 1} _LOG_ATOMIC_$$rngStates(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$rngStates := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$rngStates);
    return;
}



procedure _CHECK_ATOMIC_$$rngStates(_P: bool, _offset: bv32);
  requires {:source_name "rngStates"} {:array "$$rngStates"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset);
  requires {:source_name "rngStates"} {:array "$$rngStates"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$rngStates(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$rngStates;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$rngStates(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$rngStates := (if _P && _WRITE_HAS_OCCURRED_$$rngStates && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$rngStates);
    return;
}



const _WATCHED_VALUE_$$sdata: bv32;

procedure {:inline 1} _LOG_READ_$$sdata(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$sdata;



implementation {:inline 1} _LOG_READ_$$sdata(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sdata := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sdata == _value then true else _READ_HAS_OCCURRED_$$sdata);
    return;
}



procedure _CHECK_READ_$$sdata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sdata"} {:array "$$sdata"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sdata && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sdata && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sdata"} {:array "$$sdata"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sdata && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$sdata: bool;

procedure {:inline 1} _LOG_WRITE_$$sdata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$sdata, _WRITE_READ_BENIGN_FLAG_$$sdata;



implementation {:inline 1} _LOG_WRITE_$$sdata(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sdata := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sdata == _value then true else _WRITE_HAS_OCCURRED_$$sdata);
    _WRITE_READ_BENIGN_FLAG_$$sdata := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sdata == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sdata);
    return;
}



procedure _CHECK_WRITE_$$sdata(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sdata"} {:array "$$sdata"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sdata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sdata != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sdata"} {:array "$$sdata"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sdata && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sdata != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sdata"} {:array "$$sdata"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sdata && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$sdata(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sdata;



implementation {:inline 1} _LOG_ATOMIC_$$sdata(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sdata := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sdata);
    return;
}



procedure _CHECK_ATOMIC_$$sdata(_P: bool, _offset: bv32);
  requires {:source_name "sdata"} {:array "$$sdata"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sdata && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sdata"} {:array "$$sdata"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sdata && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sdata(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sdata;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sdata(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sdata := (if _P && _WRITE_HAS_OCCURRED_$$sdata && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sdata);
    return;
}



var _TRACKING: bool;

implementation {:inline 1} $bugle_barrier_duplicated_0($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sdata;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sdata;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sdata;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$results;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$results;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$results;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$results;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$sdata;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



implementation {:inline 1} $bugle_barrier_duplicated_1($0: bv1, $1: bv1)
{

  __BarrierImpl:
    goto anon7_Then, anon7_Else;

  anon7_Else:
    assume {:partition} true;
    goto anon0;

  anon0:
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sdata;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sdata;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sdata;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$results;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$results;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$results;
    goto anon4;

  anon4:
    goto anon9_Then, anon9_Else;

  anon9_Else:
    assume {:partition} !(group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1));
    goto anon6;

  anon6:
    havoc _TRACKING;
    return;

  anon9_Then:
    assume {:partition} group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && ($1 != 0bv1 || $1 != 0bv1);
    havoc $$results;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$sdata;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
