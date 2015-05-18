type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP32(x: [bv32]bv32, y: bv32) returns (z$1: bv32, A$1: [bv32]bv32, z$2: bv32, A$2: [bv32]bv32);



var {:source_name "random_nums"} {:global} $$random_nums: [bv32]bv32;

axiom {:array_info "$$random_nums"} {:global} {:elem_width 32} {:source_name "random_nums"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$random_nums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$random_nums: bool;

var {:race_checking} {:global} {:elem_width 32} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$random_nums: bool;

var {:source_name "mt"} $$mt$1: [bv32]bv32;

var {:source_name "mt"} $$mt$2: [bv32]bv32;

axiom {:array_info "$$mt"} {:elem_width 32} {:source_name "mt"} {:source_elem_width 32} {:source_dimensions "19"} true;

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

function FDIV32(bv32, bv32) : bv32;

function UI32_TO_FP32(bv32) : bv32;

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvand"} BV32_AND(bv32, bv32) : bv32;

function {:bvbuiltin "bvlshr"} BV32_LSHR(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

function {:bvbuiltin "bvor"} BV32_OR(bv32, bv32) : bv32;

function {:bvbuiltin "bvsge"} BV32_SGE(bv32, bv32) : bool;

function {:bvbuiltin "bvshl"} BV32_SHL(bv32, bv32) : bv32;

function {:bvbuiltin "bvslt"} BV32_SLT(bv32, bv32) : bool;

function {:bvbuiltin "bvsub"} BV32_SUB(bv32, bv32) : bv32;

function {:bvbuiltin "bvxor"} BV32_XOR(bv32, bv32) : bv32;

procedure {:source_name "rand_MT_kernel"} {:kernel} $_Z14rand_MT_kernelPfjjjji($matrix_a: bv32, $mask_b: bv32, $mask_c: bv32, $seed: bv32, $n_per_RNG: bv32);
  requires !_READ_HAS_OCCURRED_$$random_nums && !_WRITE_HAS_OCCURRED_$$random_nums && !_ATOMIC_HAS_OCCURRED_$$random_nums;
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
  modifies _WRITE_HAS_OCCURRED_$$random_nums, _WRITE_READ_BENIGN_FLAG_$$random_nums, _WRITE_READ_BENIGN_FLAG_$$random_nums, _READ_HAS_OCCURRED_$$random_nums;



implementation {:source_name "rand_MT_kernel"} {:kernel} $_Z14rand_MT_kernelPfjjjji($matrix_a: bv32, $mask_b: bv32, $mask_c: bv32, $seed: bv32, $n_per_RNG: bv32)
{
  var $state.0: bv32;
  var $mti_1.0$1: bv32;
  var $mti_1.0$2: bv32;
  var $out.0: bv32;
  var $state1.0: bv32;
  var $state_1.0: bv32;
  var $state_M.0: bv32;
  var $0$1: bv32;
  var $0$2: bv32;
  var v0: bool;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4: bool;
  var v5: bv32;
  var v6: bv32;
  var v7: bool;
  var v8: bool;
  var v9$1: bv32;
  var v9$2: bv32;
  var v10$1: bv32;
  var v10$2: bv32;
  var v11$1: bv32;
  var v11$2: bv32;
  var v12$1: bool;
  var v12$2: bool;
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
  var p0$1: bool;
  var p0$2: bool;
  var p1$1: bool;
  var p1$2: bool;


  $0:
    $$mt$1[0bv32] := $seed;
    $$mt$2[0bv32] := $seed;
    $state.0 := 1bv32;
    assume {:captureState "loop_entry_state_1_0"} true;
    goto $1;

  $1:
    assume {:captureState "loop_head_state_1"} true;
    assume {:invGenSkippedLoop} true;
    assert {:block_sourceloc} {:sourceloc_num 2} true;
    v0 := BV32_SLT($state.0, 19bv32);
    goto $truebb, $falsebb;

  $falsebb:
    assume {:partition} !v0 && !v0;
    v3$1 := $$mt$1[0bv32];
    v3$2 := $$mt$2[0bv32];
    $mti_1.0$1, $out.0, $state1.0 := v3$1, 0bv32, 0bv32;
    $mti_1.0$2 := v3$2;
    assume {:captureState "loop_entry_state_0_0"} true;
    goto $5;

  $5:
    assume {:captureState "loop_head_state_0"} true;
    assert {:tag "accessBreak"} _b17 ==> _READ_HAS_OCCURRED_$$random_nums ==> group_id_x$1 == BV32_DIV(_WATCHED_OFFSET, group_size_x);
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b16 ==> _WRITE_HAS_OCCURRED_$$random_nums ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4096bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4096bv32), 1bv32), BV32_ADD(BV32_MUL(0bv32, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1))) || BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4096bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4096bv32), 1bv32), BV32_ADD(BV32_ADD(BV32_MUL(0bv32, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 1bv32));
    assert {:tag "accessedOffsetsSatisfyPredicates"} _b15 ==> _READ_HAS_OCCURRED_$$random_nums ==> BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4096bv32), 1bv32), _WATCHED_OFFSET) == BV32_AND(BV32_SUB(BV32_MUL(1bv32, 4096bv32), 1bv32), BV32_ADD(BV32_ADD(BV32_MUL(0bv32, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 1bv32));
    assert {:tag "accessUpperBoundBlock"} _b14 ==> _WRITE_HAS_OCCURRED_$$random_nums ==> BV32_SLT(_WATCHED_OFFSET, BV32_ADD(BV32_MUL(BV32_ADD(group_id_x$1, 1bv32), group_size_x), local_id_x$1));
    assert {:tag "accessLowerBoundBlock"} _b13 ==> _WRITE_HAS_OCCURRED_$$random_nums ==> BV32_SLE(BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1), _WATCHED_OFFSET);
    assert {:tag "loopBound"} {:thread 1} _b12 ==> BV32_UGE($state1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b12 ==> BV32_UGE($state1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b11 ==> BV32_ULE($state1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b11 ==> BV32_ULE($state1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b10 ==> BV32_SGE($state1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b10 ==> BV32_SGE($state1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b9 ==> BV32_SLE($state1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b9 ==> BV32_SLE($state1.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b8 ==> BV32_UGE($mti_1.0$1, v3$1);
    assert {:tag "loopBound"} {:thread 2} _b8 ==> BV32_UGE($mti_1.0$2, v3$2);
    assert {:tag "loopBound"} {:thread 1} _b7 ==> BV32_ULE($mti_1.0$1, v3$1);
    assert {:tag "loopBound"} {:thread 2} _b7 ==> BV32_ULE($mti_1.0$2, v3$2);
    assert {:tag "loopBound"} {:thread 1} _b6 ==> BV32_SGE($mti_1.0$1, v3$1);
    assert {:tag "loopBound"} {:thread 2} _b6 ==> BV32_SGE($mti_1.0$2, v3$2);
    assert {:tag "loopBound"} {:thread 1} _b5 ==> BV32_SLE($mti_1.0$1, v3$1);
    assert {:tag "loopBound"} {:thread 2} _b5 ==> BV32_SLE($mti_1.0$2, v3$2);
    assert {:tag "loopBound"} {:thread 1} _b4 ==> BV32_UGE($out.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b4 ==> BV32_UGE($out.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b3 ==> BV32_ULE($out.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b3 ==> BV32_ULE($out.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b2 ==> BV32_SGE($out.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b2 ==> BV32_SGE($out.0, 0bv32);
    assert {:tag "loopBound"} {:thread 1} _b1 ==> BV32_SLE($out.0, 0bv32);
    assert {:tag "loopBound"} {:thread 2} _b1 ==> BV32_SLE($out.0, 0bv32);
    assert {:tag "guardNonNeg"} {:thread 1} _b0 ==> BV32_SLE(0bv32, $out.0);
    assert {:tag "guardNonNeg"} {:thread 2} _b0 ==> BV32_SLE(0bv32, $out.0);
    assert {:block_sourceloc} {:sourceloc_num 10} true;
    v4 := BV32_SLT($out.0, $n_per_RNG);
    p0$1 := false;
    p0$2 := false;
    p1$1 := false;
    p1$2 := false;
    goto $truebb0, $falsebb0;

  $falsebb0:
    assume {:partition} !v4 && !v4;
    return;

  $truebb0:
    assume {:partition} v4 && v4;
    v5 := BV32_ADD($state1.0, 1bv32);
    v6 := BV32_ADD($state1.0, 9bv32);
    v7 := BV32_SGE(v5, 19bv32);
    goto $truebb1, $falsebb1;

  $falsebb1:
    assume {:partition} !v7 && !v7;
    $state_1.0 := v5;
    goto $8;

  $8:
    v8 := BV32_SGE(v6, 19bv32);
    goto $truebb2, $falsebb2;

  $falsebb2:
    assume {:partition} !v8 && !v8;
    $state_M.0 := v6;
    goto $10;

  $10:
    v9$1 := $$mt$1[$state_1.0];
    v9$2 := $$mt$2[$state_1.0];
    v10$1 := $$mt$1[$state_M.0];
    v10$2 := $$mt$2[$state_M.0];
    v11$1 := BV32_OR(BV32_AND($mti_1.0$1, 4294967294bv32), BV32_AND(v9$1, 1bv32));
    v11$2 := BV32_OR(BV32_AND($mti_1.0$2, 4294967294bv32), BV32_AND(v9$2, 1bv32));
    v12$1 := BV32_AND(v11$1, 1bv32) != 0bv32;
    v12$2 := BV32_AND(v11$2, 1bv32) != 0bv32;
    p1$1 := (if v12$1 then v12$1 else p1$1);
    p1$2 := (if v12$2 then v12$2 else p1$2);
    p0$1 := (if !v12$1 then !v12$1 else p0$1);
    p0$2 := (if !v12$2 then !v12$2 else p0$2);
    $0$1 := (if p0$1 then 0bv32 else $0$1);
    $0$2 := (if p0$2 then 0bv32 else $0$2);
    $0$1 := (if p1$1 then $matrix_a else $0$1);
    $0$2 := (if p1$2 then $matrix_a else $0$2);
    v13$1 := BV32_XOR(BV32_XOR(v10$1, BV32_LSHR(v11$1, 1bv32)), $0$1);
    v13$2 := BV32_XOR(BV32_XOR(v10$2, BV32_LSHR(v11$2, 1bv32)), $0$2);
    $$mt$1[$state1.0] := v13$1;
    $$mt$2[$state1.0] := v13$2;
    v14$1 := BV32_XOR(v13$1, BV32_LSHR(v13$1, 12bv32));
    v14$2 := BV32_XOR(v13$2, BV32_LSHR(v13$2, 12bv32));
    v15$1 := BV32_XOR(v14$1, BV32_AND(BV32_SHL(v14$1, 7bv32), $mask_b));
    v15$2 := BV32_XOR(v14$2, BV32_AND(BV32_SHL(v14$2, 7bv32), $mask_b));
    v16$1 := BV32_XOR(v15$1, BV32_AND(BV32_SHL(v15$1, 15bv32), $mask_c));
    v16$2 := BV32_XOR(v15$2, BV32_AND(BV32_SHL(v15$2, 15bv32), $mask_c));
    call {:sourceloc} {:sourceloc_num 22} _LOG_WRITE_$$random_nums(true, BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), FDIV32(FADD32(UI32_TO_FP32(BV32_XOR(v16$1, BV32_LSHR(v16$1, 18bv32))), 1065353216bv32), 1333788672bv32), $$random_nums[BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1))]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$random_nums(true, BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2)));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 22} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 22} _CHECK_WRITE_$$random_nums(true, BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2)), FDIV32(FADD32(UI32_TO_FP32(BV32_XOR(v16$2, BV32_LSHR(v16$2, 18bv32))), 1065353216bv32), 1333788672bv32));
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$random_nums"} true;
    $$random_nums[BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1))] := FDIV32(FADD32(UI32_TO_FP32(BV32_XOR(v16$1, BV32_LSHR(v16$1, 18bv32))), 1065353216bv32), 1333788672bv32);
    $$random_nums[BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2))] := FDIV32(FADD32(UI32_TO_FP32(BV32_XOR(v16$2, BV32_LSHR(v16$2, 18bv32))), 1065353216bv32), 1333788672bv32);
    call {:sourceloc} {:sourceloc_num 23} _LOG_READ_$$random_nums(true, BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 1bv32), $$random_nums[BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 23} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 23} _CHECK_READ_$$random_nums(true, BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2)), 1bv32), $$random_nums[BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2)), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$random_nums"} true;
    v17$1 := $$random_nums[BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 1bv32)];
    v17$2 := $$random_nums[BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2)), 1bv32)];
    call {:sourceloc} {:sourceloc_num 24} _LOG_WRITE_$$random_nums(true, BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 1bv32), v17$1, $$random_nums[BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$random_nums(true, BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2)), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 24} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 24} _CHECK_WRITE_$$random_nums(true, BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2)), 1bv32), v17$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$random_nums"} true;
    $$random_nums[BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$1, group_size_x), local_id_x$1)), 1bv32)] := v17$1;
    $$random_nums[BV32_ADD(BV32_ADD(BV32_MUL($out.0, 4096bv32), BV32_ADD(BV32_MUL(group_id_x$2, group_size_x), local_id_x$2)), 1bv32)] := v17$2;
    $mti_1.0$1, $out.0, $state1.0 := v9$1, BV32_ADD($out.0, 1bv32), $state_1.0;
    $mti_1.0$2 := v9$2;
    assume {:captureState "loop_back_edge_state_0_0"} true;
    goto $5;

  $truebb2:
    assume {:partition} v8 && v8;
    $state_M.0 := BV32_SUB(v6, 19bv32);
    goto $10;

  $truebb1:
    assume {:partition} v7 && v7;
    $state_1.0 := BV32_SUB(v5, 19bv32);
    goto $8;

  $truebb:
    assume {:partition} v0 && v0;
    v1$1 := $$mt$1[BV32_SUB($state.0, 1bv32)];
    v1$2 := $$mt$2[BV32_SUB($state.0, 1bv32)];
    v2$1 := $$mt$1[BV32_SUB($state.0, 1bv32)];
    v2$2 := $$mt$2[BV32_SUB($state.0, 1bv32)];
    $$mt$1[$state.0] := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v1$1, BV32_LSHR(v2$1, 30bv32))), $state.0);
    $$mt$2[$state.0] := BV32_ADD(BV32_MUL(1812433253bv32, BV32_XOR(v1$2, BV32_LSHR(v2$2, 30bv32))), $state.0);
    $state.0 := BV32_ADD($state.0, 1bv32);
    assume {:captureState "loop_back_edge_state_1_0"} true;
    goto $1;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 1024bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 4bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_y} local_id_y$1: bv32;

const {:local_id_y} local_id_y$2: bv32;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_y} group_id_y$1: bv32;

const {:group_id_y} group_id_y$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

function {:bvbuiltin "bvsle"} BV32_SLE(bv32, bv32) : bool;

const {:existential true} _b0: bool;

const {:existential true} _b1: bool;

const {:existential true} _b2: bool;

function {:bvbuiltin "bvule"} BV32_ULE(bv32, bv32) : bool;

const {:existential true} _b3: bool;

function {:bvbuiltin "bvuge"} BV32_UGE(bv32, bv32) : bool;

const {:existential true} _b4: bool;

const {:existential true} _b5: bool;

const {:existential true} _b6: bool;

const {:existential true} _b7: bool;

const {:existential true} _b8: bool;

const {:existential true} _b9: bool;

const {:existential true} _b10: bool;

const {:existential true} _b11: bool;

const {:existential true} _b12: bool;

const _WATCHED_VALUE_$$random_nums: bv32;

procedure {:inline 1} _LOG_READ_$$random_nums(_P: bool, _offset: bv32, _value: bv32);
  modifies _READ_HAS_OCCURRED_$$random_nums;



implementation {:inline 1} _LOG_READ_$$random_nums(_P: bool, _offset: bv32, _value: bv32)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$random_nums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$random_nums == _value then true else _READ_HAS_OCCURRED_$$random_nums);
    return;
}



procedure _CHECK_READ_$$random_nums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "random_nums"} {:array "$$random_nums"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$random_nums && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$random_nums);
  requires {:source_name "random_nums"} {:array "$$random_nums"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$random_nums && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$random_nums: bool;

procedure {:inline 1} _LOG_WRITE_$$random_nums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32);
  modifies _WRITE_HAS_OCCURRED_$$random_nums, _WRITE_READ_BENIGN_FLAG_$$random_nums;



implementation {:inline 1} _LOG_WRITE_$$random_nums(_P: bool, _offset: bv32, _value: bv32, _value_old: bv32)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$random_nums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$random_nums == _value then true else _WRITE_HAS_OCCURRED_$$random_nums);
    _WRITE_READ_BENIGN_FLAG_$$random_nums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$random_nums == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$random_nums);
    return;
}



procedure _CHECK_WRITE_$$random_nums(_P: bool, _offset: bv32, _value: bv32);
  requires {:source_name "random_nums"} {:array "$$random_nums"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$random_nums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$random_nums != _value);
  requires {:source_name "random_nums"} {:array "$$random_nums"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$random_nums && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$random_nums != _value);
  requires {:source_name "random_nums"} {:array "$$random_nums"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$random_nums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$random_nums(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$random_nums;



implementation {:inline 1} _LOG_ATOMIC_$$random_nums(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$random_nums := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$random_nums);
    return;
}



procedure _CHECK_ATOMIC_$$random_nums(_P: bool, _offset: bv32);
  requires {:source_name "random_nums"} {:array "$$random_nums"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$random_nums && _WATCHED_OFFSET == _offset);
  requires {:source_name "random_nums"} {:array "$$random_nums"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$random_nums && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$random_nums(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$random_nums;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$random_nums(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$random_nums := (if _P && _WRITE_HAS_OCCURRED_$$random_nums && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$random_nums);
    return;
}



var _TRACKING: bool;

function {:bvbuiltin "bvsgt"} BV32_SGT(bv32, bv32) : bool;

const {:existential true} _b13: bool;

const {:existential true} _b14: bool;

const {:existential true} _b15: bool;

const {:existential true} _b16: bool;

function {:bvbuiltin "bvsdiv"} BV32_DIV(bv32, bv32) : bv32;

const {:existential true} _b17: bool;
