type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "outputArray"} {:global} $$outputArray: [bv32]bv32;

axiom {:array_info "$$outputArray"} {:global} {:elem_width 32} {:source_name "outputArray"} {:source_elem_width 128} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$outputArray: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$outputArray: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 128} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$outputArray: bool;

var {:source_name "sortedArray"} {:global} $$sortedArray: [bv32]bv32;

axiom {:array_info "$$sortedArray"} {:global} {:elem_width 32} {:source_name "sortedArray"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$sortedArray: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$sortedArray: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$sortedArray: bool;

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

function __other_bv32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvugt"} BV32_UGT(bv32, bv32) : bool;

function {:bvbuiltin "bvult"} BV32_ULT(bv32, bv32) : bool;

function {:bvbuiltin "zero_extend 31"} BV1_ZEXT32(bv1) : bv32;

procedure {:source_name "binarySearch"} {:kernel} $binarySearch($findMe: bv32, $globalLowerBound: bv32, $globalUpperBound: bv32, $subdivSize: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $subdivSize == 1024bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $globalLowerBound == 0bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$outputArray && !_WRITE_HAS_OCCURRED_$$outputArray && !_ATOMIC_HAS_OCCURRED_$$outputArray;
  requires !_READ_HAS_OCCURRED_$$sortedArray && !_WRITE_HAS_OCCURRED_$$sortedArray && !_ATOMIC_HAS_OCCURRED_$$sortedArray;
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
  modifies _READ_HAS_OCCURRED_$$outputArray, _WRITE_HAS_OCCURRED_$$outputArray, _WRITE_READ_BENIGN_FLAG_$$outputArray, _WRITE_READ_BENIGN_FLAG_$$outputArray;



implementation {:source_name "binarySearch"} {:kernel} $binarySearch($findMe: bv32, $globalLowerBound: bv32, $globalUpperBound: bv32, $subdivSize: bv32)
{
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
  var v10$1: bool;
  var v10$2: bool;
  var v11$1: bool;
  var v11$2: bool;
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


  $0:
    v0$1 := BV32_ADD($globalLowerBound, BV32_MUL($subdivSize, BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1)));
    v0$2 := BV32_ADD($globalLowerBound, BV32_MUL($subdivSize, BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2)));
    v1$1 := BV32_SUB(BV32_ADD(v0$1, $subdivSize), 1bv32);
    v1$2 := BV32_SUB(BV32_ADD(v0$2, $subdivSize), 1bv32);
    v2$1 := $$sortedArray[v0$1];
    v2$2 := $$sortedArray[v0$2];
    v3$1 := $$sortedArray[v1$1];
    v3$2 := $$sortedArray[v1$2];
    assume BV1_ZEXT32((if BV32_ULT(v0$1, v1$1) ==> BV32_ULT(v2$1, v3$1) then 1bv1 else 0bv1)) != 0bv32 && BV1_ZEXT32((if BV32_ULT(v0$2, v1$2) ==> BV32_ULT(v2$2, v3$2) then 1bv1 else 0bv1)) != 0bv32;
    v4$1 := $$sortedArray[v1$2];
    v4$2 := $$sortedArray[v1$1];
    v5$1 := $$sortedArray[v0$1];
    v5$2 := $$sortedArray[v0$2];
    assume BV1_ZEXT32((if BV32_ULT(v1$2, v0$1) ==> BV32_ULT(v4$1, v5$1) then 1bv1 else 0bv1)) != 0bv32 && BV1_ZEXT32((if BV32_ULT(v1$1, v0$2) ==> BV32_ULT(v4$2, v5$2) then 1bv1 else 0bv1)) != 0bv32;
    v6$1 := $$sortedArray[v1$1];
    v6$2 := $$sortedArray[v1$2];
    v7$1 := $$sortedArray[v0$2];
    v7$2 := $$sortedArray[v0$1];
    assume BV1_ZEXT32((if BV32_ULT(v1$1, v0$2) ==> BV32_ULT(v6$1, v7$1) then 1bv1 else 0bv1)) != 0bv32 && BV1_ZEXT32((if BV32_ULT(v1$2, v0$1) ==> BV32_ULT(v6$2, v7$2) then 1bv1 else 0bv1)) != 0bv32;
    v8$1 := $$sortedArray[v0$1];
    v8$2 := $$sortedArray[v0$2];
    v9$1 := $$sortedArray[v1$1];
    v9$2 := $$sortedArray[v1$2];
    v10$1 := BV32_UGT(v8$1, $findMe);
    v10$2 := BV32_UGT(v8$2, $findMe);
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
    p3$1 := (if v10$1 then v10$1 else p3$1);
    p3$2 := (if v10$2 then v10$2 else p3$2);
    p1$1 := (if !v10$1 then !v10$1 else p1$1);
    p1$2 := (if !v10$2 then !v10$2 else p1$2);
    p3$1 := (if p0$1 then true else p3$1);
    p3$2 := (if p0$2 then true else p3$2);
    v11$1 := (if p1$1 then BV32_ULT(v9$1, $findMe) else v11$1);
    v11$2 := (if p1$2 then BV32_ULT(v9$2, $findMe) else v11$2);
    p3$1 := (if p1$1 && v11$1 then v11$1 else p3$1);
    p3$2 := (if p1$2 && v11$2 then v11$2 else p3$2);
    p4$1 := (if p1$1 && !v11$1 then !v11$1 else p4$1);
    p4$2 := (if p1$2 && !v11$2 then !v11$2 else p4$2);
    p3$1 := (if p2$1 then true else p3$1);
    p3$2 := (if p2$2 then true else p3$2);
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$outputArray(p4$1, 0bv32, $$outputArray[0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$outputArray(p4$2, 0bv32, $$outputArray[0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$outputArray"} true;
    v12$1 := (if p4$1 then $$outputArray[0bv32] else v12$1);
    v12$2 := (if p4$2 then $$outputArray[0bv32] else v12$2);
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$outputArray(p4$1, 1bv32, $$outputArray[1bv32]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$outputArray(p4$2, 1bv32, $$outputArray[1bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$outputArray"} true;
    v13$1 := (if p4$1 then $$outputArray[1bv32] else v13$1);
    v13$2 := (if p4$2 then $$outputArray[1bv32] else v13$2);
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$outputArray(p4$1, 2bv32, $$outputArray[2bv32]);
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$outputArray(p4$2, 2bv32, $$outputArray[2bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$outputArray"} true;
    v14$1 := (if p4$1 then $$outputArray[2bv32] else v14$1);
    v14$2 := (if p4$2 then $$outputArray[2bv32] else v14$2);
    call {:sourceloc} {:sourceloc_num 17} _LOG_READ_$$outputArray(p4$1, 3bv32, $$outputArray[3bv32]);
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 17} _CHECK_READ_$$outputArray(p4$2, 3bv32, $$outputArray[3bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$outputArray"} true;
    v15$1 := (if p4$1 then $$outputArray[3bv32] else v15$1);
    v15$2 := (if p4$2 then $$outputArray[3bv32] else v15$2);
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$outputArray(p4$1, 0bv32, v0$1, $$outputArray[0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputArray(p4$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$outputArray(p4$2, 0bv32, v0$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputArray"} true;
    $$outputArray[0bv32] := (if p4$1 then v0$1 else $$outputArray[0bv32]);
    $$outputArray[0bv32] := (if p4$2 then v0$2 else $$outputArray[0bv32]);
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$outputArray(p4$1, 1bv32, v13$1, $$outputArray[1bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputArray(p4$2, 1bv32);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$outputArray(p4$2, 1bv32, v13$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputArray"} true;
    $$outputArray[1bv32] := (if p4$1 then v13$1 else $$outputArray[1bv32]);
    $$outputArray[1bv32] := (if p4$2 then v13$2 else $$outputArray[1bv32]);
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$outputArray(p4$1, 2bv32, v14$1, $$outputArray[2bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputArray(p4$2, 2bv32);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$outputArray(p4$2, 2bv32, v14$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputArray"} true;
    $$outputArray[2bv32] := (if p4$1 then v14$1 else $$outputArray[2bv32]);
    $$outputArray[2bv32] := (if p4$2 then v14$2 else $$outputArray[2bv32]);
    call {:sourceloc} {:sourceloc_num 21} _LOG_WRITE_$$outputArray(p4$1, 3bv32, v15$1, $$outputArray[3bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputArray(p4$2, 3bv32);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 21} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 21} _CHECK_WRITE_$$outputArray(p4$2, 3bv32, v15$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputArray"} true;
    $$outputArray[3bv32] := (if p4$1 then v15$1 else $$outputArray[3bv32]);
    $$outputArray[3bv32] := (if p4$2 then v15$2 else $$outputArray[3bv32]);
    call {:sourceloc} {:sourceloc_num 22} _LOG_READ_$$outputArray(p4$1, 0bv32, $$outputArray[0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 22} _CHECK_READ_$$outputArray(p4$2, 0bv32, $$outputArray[0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$outputArray"} true;
    v16$1 := (if p4$1 then $$outputArray[0bv32] else v16$1);
    v16$2 := (if p4$2 then $$outputArray[0bv32] else v16$2);
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$outputArray(p4$1, 1bv32, $$outputArray[1bv32]);
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$outputArray(p4$2, 1bv32, $$outputArray[1bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$outputArray"} true;
    v17$1 := (if p4$1 then $$outputArray[1bv32] else v17$1);
    v17$2 := (if p4$2 then $$outputArray[1bv32] else v17$2);
    call {:sourceloc} {:sourceloc_num 24} _LOG_READ_$$outputArray(p4$1, 2bv32, $$outputArray[2bv32]);
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 24} _CHECK_READ_$$outputArray(p4$2, 2bv32, $$outputArray[2bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$outputArray"} true;
    v18$1 := (if p4$1 then $$outputArray[2bv32] else v18$1);
    v18$2 := (if p4$2 then $$outputArray[2bv32] else v18$2);
    call {:sourceloc} {:sourceloc_num 25} _LOG_READ_$$outputArray(p4$1, 3bv32, $$outputArray[3bv32]);
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 25} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 25} _CHECK_READ_$$outputArray(p4$2, 3bv32, $$outputArray[3bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$outputArray"} true;
    v19$1 := (if p4$1 then $$outputArray[3bv32] else v19$1);
    v19$2 := (if p4$2 then $$outputArray[3bv32] else v19$2);
    call {:sourceloc} {:sourceloc_num 26} _LOG_WRITE_$$outputArray(p4$1, 0bv32, v16$1, $$outputArray[0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputArray(p4$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_12"} {:captureState "check_state_12"} {:sourceloc} {:sourceloc_num 26} true;
    call {:check_id "check_state_12"} {:sourceloc} {:sourceloc_num 26} _CHECK_WRITE_$$outputArray(p4$2, 0bv32, v16$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputArray"} true;
    $$outputArray[0bv32] := (if p4$1 then v16$1 else $$outputArray[0bv32]);
    $$outputArray[0bv32] := (if p4$2 then v16$2 else $$outputArray[0bv32]);
    call {:sourceloc} {:sourceloc_num 27} _LOG_WRITE_$$outputArray(p4$1, 1bv32, v1$1, $$outputArray[1bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputArray(p4$2, 1bv32);
    assume {:do_not_predicate} {:check_id "check_state_13"} {:captureState "check_state_13"} {:sourceloc} {:sourceloc_num 27} true;
    call {:check_id "check_state_13"} {:sourceloc} {:sourceloc_num 27} _CHECK_WRITE_$$outputArray(p4$2, 1bv32, v1$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputArray"} true;
    $$outputArray[1bv32] := (if p4$1 then v1$1 else $$outputArray[1bv32]);
    $$outputArray[1bv32] := (if p4$2 then v1$2 else $$outputArray[1bv32]);
    call {:sourceloc} {:sourceloc_num 28} _LOG_WRITE_$$outputArray(p4$1, 2bv32, v18$1, $$outputArray[2bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputArray(p4$2, 2bv32);
    assume {:do_not_predicate} {:check_id "check_state_14"} {:captureState "check_state_14"} {:sourceloc} {:sourceloc_num 28} true;
    call {:check_id "check_state_14"} {:sourceloc} {:sourceloc_num 28} _CHECK_WRITE_$$outputArray(p4$2, 2bv32, v18$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputArray"} true;
    $$outputArray[2bv32] := (if p4$1 then v18$1 else $$outputArray[2bv32]);
    $$outputArray[2bv32] := (if p4$2 then v18$2 else $$outputArray[2bv32]);
    call {:sourceloc} {:sourceloc_num 29} _LOG_WRITE_$$outputArray(p4$1, 3bv32, v19$1, $$outputArray[3bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputArray(p4$2, 3bv32);
    assume {:do_not_predicate} {:check_id "check_state_15"} {:captureState "check_state_15"} {:sourceloc} {:sourceloc_num 29} true;
    call {:check_id "check_state_15"} {:sourceloc} {:sourceloc_num 29} _CHECK_WRITE_$$outputArray(p4$2, 3bv32, v19$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputArray"} true;
    $$outputArray[3bv32] := (if p4$1 then v19$1 else $$outputArray[3bv32]);
    $$outputArray[3bv32] := (if p4$2 then v19$2 else $$outputArray[3bv32]);
    call {:sourceloc} {:sourceloc_num 30} _LOG_READ_$$outputArray(p4$1, 0bv32, $$outputArray[0bv32]);
    assume {:do_not_predicate} {:check_id "check_state_16"} {:captureState "check_state_16"} {:sourceloc} {:sourceloc_num 30} true;
    call {:check_id "check_state_16"} {:sourceloc} {:sourceloc_num 30} _CHECK_READ_$$outputArray(p4$2, 0bv32, $$outputArray[0bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$outputArray"} true;
    v20$1 := (if p4$1 then $$outputArray[0bv32] else v20$1);
    v20$2 := (if p4$2 then $$outputArray[0bv32] else v20$2);
    call {:sourceloc} {:sourceloc_num 31} _LOG_READ_$$outputArray(p4$1, 1bv32, $$outputArray[1bv32]);
    assume {:do_not_predicate} {:check_id "check_state_17"} {:captureState "check_state_17"} {:sourceloc} {:sourceloc_num 31} true;
    call {:check_id "check_state_17"} {:sourceloc} {:sourceloc_num 31} _CHECK_READ_$$outputArray(p4$2, 1bv32, $$outputArray[1bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$outputArray"} true;
    v21$1 := (if p4$1 then $$outputArray[1bv32] else v21$1);
    v21$2 := (if p4$2 then $$outputArray[1bv32] else v21$2);
    call {:sourceloc} {:sourceloc_num 32} _LOG_READ_$$outputArray(p4$1, 2bv32, $$outputArray[2bv32]);
    assume {:do_not_predicate} {:check_id "check_state_18"} {:captureState "check_state_18"} {:sourceloc} {:sourceloc_num 32} true;
    call {:check_id "check_state_18"} {:sourceloc} {:sourceloc_num 32} _CHECK_READ_$$outputArray(p4$2, 2bv32, $$outputArray[2bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$outputArray"} true;
    v22$1 := (if p4$1 then $$outputArray[2bv32] else v22$1);
    v22$2 := (if p4$2 then $$outputArray[2bv32] else v22$2);
    call {:sourceloc} {:sourceloc_num 33} _LOG_READ_$$outputArray(p4$1, 3bv32, $$outputArray[3bv32]);
    assume {:do_not_predicate} {:check_id "check_state_19"} {:captureState "check_state_19"} {:sourceloc} {:sourceloc_num 33} true;
    call {:check_id "check_state_19"} {:sourceloc} {:sourceloc_num 33} _CHECK_READ_$$outputArray(p4$2, 3bv32, $$outputArray[3bv32]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$outputArray"} true;
    v23$1 := (if p4$1 then $$outputArray[3bv32] else v23$1);
    v23$2 := (if p4$2 then $$outputArray[3bv32] else v23$2);
    call {:sourceloc} {:sourceloc_num 34} _LOG_WRITE_$$outputArray(p4$1, 0bv32, v20$1, $$outputArray[0bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputArray(p4$2, 0bv32);
    assume {:do_not_predicate} {:check_id "check_state_20"} {:captureState "check_state_20"} {:sourceloc} {:sourceloc_num 34} true;
    call {:check_id "check_state_20"} {:sourceloc} {:sourceloc_num 34} _CHECK_WRITE_$$outputArray(p4$2, 0bv32, v20$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputArray"} true;
    $$outputArray[0bv32] := (if p4$1 then v20$1 else $$outputArray[0bv32]);
    $$outputArray[0bv32] := (if p4$2 then v20$2 else $$outputArray[0bv32]);
    call {:sourceloc} {:sourceloc_num 35} _LOG_WRITE_$$outputArray(p4$1, 1bv32, v21$1, $$outputArray[1bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputArray(p4$2, 1bv32);
    assume {:do_not_predicate} {:check_id "check_state_21"} {:captureState "check_state_21"} {:sourceloc} {:sourceloc_num 35} true;
    call {:check_id "check_state_21"} {:sourceloc} {:sourceloc_num 35} _CHECK_WRITE_$$outputArray(p4$2, 1bv32, v21$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputArray"} true;
    $$outputArray[1bv32] := (if p4$1 then v21$1 else $$outputArray[1bv32]);
    $$outputArray[1bv32] := (if p4$2 then v21$2 else $$outputArray[1bv32]);
    call {:sourceloc} {:sourceloc_num 36} _LOG_WRITE_$$outputArray(p4$1, 2bv32, v22$1, $$outputArray[2bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputArray(p4$2, 2bv32);
    assume {:do_not_predicate} {:check_id "check_state_22"} {:captureState "check_state_22"} {:sourceloc} {:sourceloc_num 36} true;
    call {:check_id "check_state_22"} {:sourceloc} {:sourceloc_num 36} _CHECK_WRITE_$$outputArray(p4$2, 2bv32, v22$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputArray"} true;
    $$outputArray[2bv32] := (if p4$1 then v22$1 else $$outputArray[2bv32]);
    $$outputArray[2bv32] := (if p4$2 then v22$2 else $$outputArray[2bv32]);
    call {:sourceloc} {:sourceloc_num 37} _LOG_WRITE_$$outputArray(p4$1, 3bv32, 1bv32, $$outputArray[3bv32]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputArray(p4$2, 3bv32);
    assume {:do_not_predicate} {:check_id "check_state_23"} {:captureState "check_state_23"} {:sourceloc} {:sourceloc_num 37} true;
    call {:check_id "check_state_23"} {:sourceloc} {:sourceloc_num 37} _CHECK_WRITE_$$outputArray(p4$2, 3bv32, 1bv32);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$outputArray"} true;
    $$outputArray[3bv32] := (if p4$1 then 1bv32 else $$outputArray[3bv32]);
    $$outputArray[3bv32] := (if p4$2 then 1bv32 else $$outputArray[3bv32]);
    return;
}



axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

const _WATCHED_VALUE_$$outputArray: bv32;

procedure {:inline 1} _LOG_READ_$$outputArray(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$outputArray;



implementation {:inline 1} _LOG_READ_$$outputArray(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$outputArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputArray == _value then true else _READ_HAS_OCCURRED_$$outputArray);
    return;
}



procedure _CHECK_READ_$$outputArray(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "outputArray"} {:array "$$outputArray"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$outputArray && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$outputArray);
  requires {:source_name "outputArray"} {:array "$$outputArray"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$outputArray && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$outputArray: bool;

procedure {:inline 1} _LOG_WRITE_$$outputArray(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$outputArray, _WRITE_READ_BENIGN_FLAG_$$outputArray;



implementation {:inline 1} _LOG_WRITE_$$outputArray(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$outputArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputArray == _value then true else _WRITE_HAS_OCCURRED_$$outputArray);
    _WRITE_READ_BENIGN_FLAG_$$outputArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputArray == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$outputArray);
    return;
}



procedure _CHECK_WRITE_$$outputArray(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "outputArray"} {:array "$$outputArray"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$outputArray && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputArray != _value);
  requires {:source_name "outputArray"} {:array "$$outputArray"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$outputArray && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$outputArray != _value);
  requires {:source_name "outputArray"} {:array "$$outputArray"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$outputArray && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$outputArray(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$outputArray;



implementation {:inline 1} _LOG_ATOMIC_$$outputArray(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$outputArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$outputArray);
    return;
}



procedure _CHECK_ATOMIC_$$outputArray(_P: bool, _offset: bv32);
  requires {:source_name "outputArray"} {:array "$$outputArray"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$outputArray && _WATCHED_OFFSET == _offset);
  requires {:source_name "outputArray"} {:array "$$outputArray"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$outputArray && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputArray(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$outputArray;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$outputArray(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$outputArray := (if _P && _WRITE_HAS_OCCURRED_$$outputArray && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$outputArray);
    return;
}



const _WATCHED_VALUE_$$sortedArray: bv32;

procedure {:inline 1} _LOG_READ_$$sortedArray(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$sortedArray;



implementation {:inline 1} _LOG_READ_$$sortedArray(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$sortedArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sortedArray == _value then true else _READ_HAS_OCCURRED_$$sortedArray);
    return;
}



procedure _CHECK_READ_$$sortedArray(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sortedArray"} {:array "$$sortedArray"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$sortedArray && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$sortedArray);
  requires {:source_name "sortedArray"} {:array "$$sortedArray"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$sortedArray && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$sortedArray: bool;

procedure {:inline 1} _LOG_WRITE_$$sortedArray(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$sortedArray, _WRITE_READ_BENIGN_FLAG_$$sortedArray;



implementation {:inline 1} _LOG_WRITE_$$sortedArray(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$sortedArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sortedArray == _value then true else _WRITE_HAS_OCCURRED_$$sortedArray);
    _WRITE_READ_BENIGN_FLAG_$$sortedArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sortedArray == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$sortedArray);
    return;
}



procedure _CHECK_WRITE_$$sortedArray(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "sortedArray"} {:array "$$sortedArray"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$sortedArray && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sortedArray != _value);
  requires {:source_name "sortedArray"} {:array "$$sortedArray"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$sortedArray && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$sortedArray != _value);
  requires {:source_name "sortedArray"} {:array "$$sortedArray"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$sortedArray && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$sortedArray(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$sortedArray;



implementation {:inline 1} _LOG_ATOMIC_$$sortedArray(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$sortedArray := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$sortedArray);
    return;
}



procedure _CHECK_ATOMIC_$$sortedArray(_P: bool, _offset: bv32);
  requires {:source_name "sortedArray"} {:array "$$sortedArray"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$sortedArray && _WATCHED_OFFSET == _offset);
  requires {:source_name "sortedArray"} {:array "$$sortedArray"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$sortedArray && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sortedArray(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$sortedArray;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$sortedArray(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$sortedArray := (if _P && _WRITE_HAS_OCCURRED_$$sortedArray && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$sortedArray);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;
