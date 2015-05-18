type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



axiom {:array_info "$$data"} {:global} {:elem_width 32} {:source_name "data"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$data: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$data: bool;

var {:source_name "sharedArray"} {:group_shared} $$sharedArray: [bv1][bv32]bv8;

axiom {:array_info "$$sharedArray"} {:group_shared} {:elem_width 8} {:source_name "sharedArray"} {:source_elem_width 8} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sharedArray: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sharedArray: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 8} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sharedArray: bool;

var {:source_name "binResult"} {:global} $$binResult: [bv32]bv32;

axiom {:array_info "$$binResult"} {:global} {:elem_width 32} {:source_name "binResult"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$binResult: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$binResult: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$binResult: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvadd"} BV8_ADD(bv8, bv8) : bv8;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvudiv"} BV32_UDIV(bv32, bv32) : bv32;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 24"} BV8_ZEXT32(bv8) : bv32;

procedure {:source_name "histogram256"} {:kernel} $histogram256();
  requires !_READ_HAS_OCCURRED_$$data && !_WRITE_HAS_OCCURRED_$$data && !_ATOMIC_HAS_OCCURRED_$$data;
  requires !_READ_HAS_OCCURRED_$$binResult && !_WRITE_HAS_OCCURRED_$$binResult && !_ATOMIC_HAS_OCCURRED_$$binResult;
  requires !_READ_HAS_OCCURRED_$$sharedArray && !_WRITE_HAS_OCCURRED_$$sharedArray && !_ATOMIC_HAS_OCCURRED_$$sharedArray;
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
  modifies $$sharedArray, $$binResult, _TRACKING, _TRACKING, _WRITE_HAS_OCCURRED_$$binResult, _WRITE_READ_BENIGN_FLAG_$$binResult, _WRITE_READ_BENIGN_FLAG_$$binResult, _READ_HAS_OCCURRED_$$sharedArray, _WRITE_HAS_OCCURRED_$$sharedArray, _WRITE_READ_BENIGN_FLAG_$$sharedArray, _WRITE_READ_BENIGN_FLAG_$$sharedArray;



implementation {:source_name "histogram256"} {:kernel} $histogram256()
{
  var $i.0: bv32;
  var $i1.0: bv32;
  var $i2.0: bv32;
  var $binCount.0$1: bv32;
  var $binCount.0$2: bv32;
  var $j.0: bv32;
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2: bv32;
  var v3: bool;
  var v4: bool;
  var v5$1: bv32;
  var v5$2: bv32;
  var v6$1: bv32;
  var v6$2: bv32;
  var v7$1: bv8;
  var v7$2: bv8;
  var v8: bool;
  var v9: bool;
  var v10$1: bv8;
  var v10$2: bv8;


  $0:
    v0$1 := local_id_x$1;
    v0$2 := local_id_x$2;
    v1$1 := group_id_x$1;
    v1$2 := group_id_x$2;
    v2 := group_size_x;
    $i.0 := 0bv32;
    assume {:captureState "loop_entry_state_3_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_3"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sharedArray ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sharedArray ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sharedArray ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 1} true;
    v3 := BV32_SLT($i.0, 256bv32);
    goto $truebb, __partitioned_block_$falsebb_0;

  __partitioned_block_$falsebb_0:
    assume {:partition} !v3 && !v3;
    goto __partitioned_block_$falsebb_1;

  __partitioned_block_$falsebb_1:
    call {:sourceloc_num 6} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    $i1.0 := 0bv32;
    assume {:captureState "loop_entry_state_2_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_2"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sharedArray ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sharedArray ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sharedArray ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 7} true;
    v4 := BV32_SLT($i1.0, 256bv32);
    goto $truebb0, __partitioned_block_$falsebb0_0;

  __partitioned_block_$falsebb0_0:
    assume {:partition} !v4 && !v4;
    goto __partitioned_block_$falsebb0_1;

  __partitioned_block_$falsebb0_1:
    call {:sourceloc_num 14} $bugle_barrier_duplicated_1(1bv1, 0bv1);
    $i2.0 := 0bv32;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $9;

  $9:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sharedArray ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sharedArray ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sharedArray ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 15} true;
    v8 := BV32_ULT($i2.0, BV32_UDIV(256bv32, v2));
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v8 && !v8;
    return;

  $truebb1:
    assume {:partition} v8 && v8;
    $binCount.0$1, $j.0 := 0bv32, 0bv32;
    $binCount.0$2 := 0bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $11;

  $11:
    assume {:captureState "loop_head_state_1"} true;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _ATOMIC_HAS_OCCURRED_$$sharedArray ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _WRITE_HAS_OCCURRED_$$sharedArray ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:tag "groupSharedArraysDisjointAcrossGroups"} _READ_HAS_OCCURRED_$$sharedArray ==> group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2;
    assert {:block_sourceloc} {:sourceloc_num 17} true;
    v9 := BV32_ULT($j.0, v2);
    goto $truebb2, $falsebb2;

  $falsebb2:
    assume {:partition} !v9 && !v9;
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$binResult(true, BV32_ADD(BV32_ADD(BV32_MUL(v1$1, 256bv32), BV32_MUL($i2.0, v2)), v0$1), $binCount.0$1, $$binResult[BV32_ADD(BV32_ADD(BV32_MUL(v1$1, 256bv32), BV32_MUL($i2.0, v2)), v0$1)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$binResult(true, BV32_ADD(BV32_ADD(BV32_MUL(v1$2, 256bv32), BV32_MUL($i2.0, v2)), v0$2));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$binResult(true, BV32_ADD(BV32_ADD(BV32_MUL(v1$2, 256bv32), BV32_MUL($i2.0, v2)), v0$2), $binCount.0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$binResult"} true;
    $$binResult[BV32_ADD(BV32_ADD(BV32_MUL(v1$1, 256bv32), BV32_MUL($i2.0, v2)), v0$1)] := $binCount.0$1;
    $$binResult[BV32_ADD(BV32_ADD(BV32_MUL(v1$2, 256bv32), BV32_MUL($i2.0, v2)), v0$2)] := $binCount.0$2;
    $i2.0 := BV32_ADD($i2.0, 1bv32);
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $9;

  $truebb2:
    assume {:partition} v9 && v9;
    call {:sourceloc} {:sourceloc_num 19} _LOG_READ_$$sharedArray(true, BV32_ADD(BV32_ADD(BV32_MUL($j.0, 256bv32), BV32_MUL($i2.0, v2)), v0$1), $$sharedArray[1bv1][BV32_ADD(BV32_ADD(BV32_MUL($j.0, 256bv32), BV32_MUL($i2.0, v2)), v0$1)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 19} _CHECK_READ_$$sharedArray(true, BV32_ADD(BV32_ADD(BV32_MUL($j.0, 256bv32), BV32_MUL($i2.0, v2)), v0$2), $$sharedArray[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_MUL($j.0, 256bv32), BV32_MUL($i2.0, v2)), v0$2)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sharedArray"} true;
    v10$1 := $$sharedArray[1bv1][BV32_ADD(BV32_ADD(BV32_MUL($j.0, 256bv32), BV32_MUL($i2.0, v2)), v0$1)];
    v10$2 := $$sharedArray[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_ADD(BV32_MUL($j.0, 256bv32), BV32_MUL($i2.0, v2)), v0$2)];
    $binCount.0$1, $j.0 := BV32_ADD($binCount.0$1, BV8_ZEXT32(v10$1)), BV32_ADD($j.0, 1bv32);
    $binCount.0$2 := BV32_ADD($binCount.0$2, BV8_ZEXT32(v10$2));
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $11;

  $truebb0:
    assume {:partition} v4 && v4;
    havoc v5$1, v5$2;
    v6$1 := BV32_MUL(v0$1, 256bv32);
    v6$2 := BV32_MUL(v0$2, 256bv32);
    call {:sourceloc} {:sourceloc_num 10} _LOG_READ_$$sharedArray(true, v6$1, $$sharedArray[1bv1][v6$1]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 10} _CHECK_READ_$$sharedArray(true, v6$2, $$sharedArray[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v6$2]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$sharedArray"} true;
    v7$1 := $$sharedArray[1bv1][v6$1];
    v7$2 := $$sharedArray[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v6$2];
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$sharedArray(true, v6$1, BV8_ADD(v7$1, 1bv8), $$sharedArray[1bv1][v6$1]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sharedArray(true, v6$2);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$sharedArray(true, v6$2, BV8_ADD(v7$2, 1bv8));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sharedArray"} true;
    $$sharedArray[1bv1][v6$1] := BV8_ADD(v7$1, 1bv8);
    $$sharedArray[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][v6$2] := BV8_ADD(v7$2, 1bv8);
    $i1.0 := BV32_ADD($i1.0, 1bv32);
    assume {:captureState "loop_back_edge_state_2_0"} true;
    goto $5;

  $truebb:
    assume {:partition} v3 && v3;
    call {:sourceloc} {:sourceloc_num 3} _LOG_WRITE_$$sharedArray(true, BV32_ADD(BV32_MUL(v0$1, 256bv32), $i.0), 0bv8, $$sharedArray[1bv1][BV32_ADD(BV32_MUL(v0$1, 256bv32), $i.0)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$sharedArray(true, BV32_ADD(BV32_MUL(v0$2, 256bv32), $i.0));
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 3} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 3} _CHECK_WRITE_$$sharedArray(true, BV32_ADD(BV32_MUL(v0$2, 256bv32), $i.0), 0bv8);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$sharedArray"} true;
    $$sharedArray[1bv1][BV32_ADD(BV32_MUL(v0$1, 256bv32), $i.0)] := 0bv8;
    $$sharedArray[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(v0$2, 256bv32), $i.0)] := 0bv8;
    $i.0 := BV32_ADD($i.0, 1bv32);
    assume {:captureState "loop_back_edge_state_3_0"} true;
    goto $1;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 128bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 32bv32 then 1bv1 else 0bv1) != 0bv1;

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
  modifies $$sharedArray, $$binResult, _TRACKING;



procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_1($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$sharedArray, $$binResult, _TRACKING;



const _WATCHED_VALUE_$$data: bv32;

procedure {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$data;



implementation {:inline 1} _LOG_READ_$$data(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _READ_HAS_OCCURRED_$$data);
    return;
}



procedure _CHECK_READ_$$data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$data);
  requires {:source_name "data"} {:array "$$data"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$data: bool;

procedure {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$data, _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:inline 1} _LOG_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then true else _WRITE_HAS_OCCURRED_$$data);
    _WRITE_READ_BENIGN_FLAG_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$data);
    return;
}



procedure _CHECK_WRITE_$$data(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data != _value);
  requires {:source_name "data"} {:array "$$data"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$data != _value);
  requires {:source_name "data"} {:array "$$data"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$data(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$data;



implementation {:inline 1} _LOG_ATOMIC_$$data(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$data := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$data);
    return;
}



procedure _CHECK_ATOMIC_$$data(_P: bool, _offset: bv32);
  requires {:source_name "data"} {:array "$$data"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);
  requires {:source_name "data"} {:array "$$data"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$data;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$data(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$data := (if _P && _WRITE_HAS_OCCURRED_$$data && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$data);
    return;
}



const _WATCHED_VALUE_$$binResult: bv32;

procedure {:inline 1} _LOG_READ_$$binResult(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$binResult;



implementation {:inline 1} _LOG_READ_$$binResult(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$binResult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binResult == _value then true else _READ_HAS_OCCURRED_$$binResult);
    return;
}



procedure _CHECK_READ_$$binResult(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "binResult"} {:array "$$binResult"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$binResult && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$binResult);
  requires {:source_name "binResult"} {:array "$$binResult"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$binResult && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$binResult: bool;

procedure {:inline 1} _LOG_WRITE_$$binResult(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$binResult, _WRITE_READ_BENIGN_FLAG_$$binResult;



implementation {:inline 1} _LOG_WRITE_$$binResult(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$binResult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binResult == _value then true else _WRITE_HAS_OCCURRED_$$binResult);
    _WRITE_READ_BENIGN_FLAG_$$binResult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binResult == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$binResult);
    return;
}



procedure _CHECK_WRITE_$$binResult(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "binResult"} {:array "$$binResult"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$binResult && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binResult != _value);
  requires {:source_name "binResult"} {:array "$$binResult"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$binResult && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$binResult != _value);
  requires {:source_name "binResult"} {:array "$$binResult"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$binResult && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$binResult(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$binResult;



implementation {:inline 1} _LOG_ATOMIC_$$binResult(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$binResult := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$binResult);
    return;
}



procedure _CHECK_ATOMIC_$$binResult(_P: bool, _offset: bv32);
  requires {:source_name "binResult"} {:array "$$binResult"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$binResult && _WATCHED_OFFSET == _offset);
  requires {:source_name "binResult"} {:array "$$binResult"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$binResult && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$binResult(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$binResult;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$binResult(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$binResult := (if _P && _WRITE_HAS_OCCURRED_$$binResult && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$binResult);
    return;
}



const _WATCHED_VALUE_$$sharedArray: bv8;

procedure {:inline 1} _LOG_READ_$$sharedArray(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$sharedArray;



implementation {:inline 1} _LOG_READ_$$sharedArray(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sharedArray := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sharedArray == _value then true else _READ_HAS_OCCURRED_$$sharedArray);
    return;
}



procedure _CHECK_READ_$$sharedArray(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "sharedArray"} {:array "$$sharedArray"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sharedArray && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sharedArray && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sharedArray"} {:array "$$sharedArray"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sharedArray && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$sharedArray: bool;

procedure {:inline 1} _LOG_WRITE_$$sharedArray(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$sharedArray, _WRITE_READ_BENIGN_FLAG_$$sharedArray;



implementation {:inline 1} _LOG_WRITE_$$sharedArray(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sharedArray := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sharedArray == _value then true else _WRITE_HAS_OCCURRED_$$sharedArray);
    _WRITE_READ_BENIGN_FLAG_$$sharedArray := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sharedArray == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sharedArray);
    return;
}



procedure _CHECK_WRITE_$$sharedArray(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "sharedArray"} {:array "$$sharedArray"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sharedArray && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sharedArray != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sharedArray"} {:array "$$sharedArray"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sharedArray && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sharedArray != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sharedArray"} {:array "$$sharedArray"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sharedArray && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$sharedArray(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sharedArray;



implementation {:inline 1} _LOG_ATOMIC_$$sharedArray(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sharedArray := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sharedArray);
    return;
}



procedure _CHECK_ATOMIC_$$sharedArray(_P: bool, _offset: bv32);
  requires {:source_name "sharedArray"} {:array "$$sharedArray"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sharedArray && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "sharedArray"} {:array "$$sharedArray"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sharedArray && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sharedArray(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sharedArray;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sharedArray(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sharedArray := (if _P && _WRITE_HAS_OCCURRED_$$sharedArray && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sharedArray);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sharedArray;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sharedArray;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sharedArray;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$binResult;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$binResult;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$binResult;
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
    havoc $$binResult;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$sharedArray;
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$sharedArray;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$sharedArray;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$sharedArray;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$binResult;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$binResult;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$binResult;
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
    havoc $$binResult;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$sharedArray;
    goto anon3;

  anon7_Then:
    assume {:partition} false;
    goto __Disabled;

  __Disabled:
    return;
}



function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;
