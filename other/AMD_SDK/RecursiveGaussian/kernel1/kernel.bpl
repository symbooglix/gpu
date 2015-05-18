type _SIZE_T_TYPE = bv32;

procedure _ATOMIC_OP8(x: [bv32]bv8, y: bv32) returns (z$1: bv8, A$1: [bv32]bv8, z$2: bv8, A$2: [bv32]bv8);



var {:source_name "output"} {:global} $$output: [bv32]bv8;

axiom {:array_info "$$output"} {:global} {:elem_width 8} {:source_name "output"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$output: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$output: bool;

axiom {:array_info "$$input"} {:global} {:elem_width 8} {:source_name "input"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$input: bool;

var {:race_checking} {:global} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$input: bool;

var {:source_name "block"} {:group_shared} $$block: [bv1][bv32]bv8;

axiom {:array_info "$$block"} {:group_shared} {:elem_width 8} {:source_name "block"} {:source_elem_width 32} {:source_dimensions "*"} true;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _READ_HAS_OCCURRED_$$block: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _WRITE_HAS_OCCURRED_$$block: bool;

var {:race_checking} {:group_shared} {:elem_width 8} {:source_elem_width 32} {:source_dimensions "*"} _ATOMIC_HAS_OCCURRED_$$block: bool;

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

function {:bvbuiltin "bvadd"} BV32_ADD(bv32, bv32) : bv32;

function {:bvbuiltin "bvmul"} BV32_MUL(bv32, bv32) : bv32;

procedure {:source_name "transpose_kernel"} {:kernel} $transpose_kernel($width: bv32, $height: bv32, $blockSize: bv32);
  requires {:sourceloc_num 0} {:thread 1} (if $width == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 1} {:thread 1} (if $height == 512bv32 then 1bv1 else 0bv1) != 0bv1;
  requires {:sourceloc_num 2} {:thread 1} (if $blockSize == 2bv32 then 1bv1 else 0bv1) != 0bv1;
  requires !_READ_HAS_OCCURRED_$$output && !_WRITE_HAS_OCCURRED_$$output && !_ATOMIC_HAS_OCCURRED_$$output;
  requires !_READ_HAS_OCCURRED_$$input && !_WRITE_HAS_OCCURRED_$$input && !_ATOMIC_HAS_OCCURRED_$$input;
  requires !_READ_HAS_OCCURRED_$$block && !_WRITE_HAS_OCCURRED_$$block && !_ATOMIC_HAS_OCCURRED_$$block;
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
  modifies $$block, _WRITE_HAS_OCCURRED_$$block, _WRITE_READ_BENIGN_FLAG_$$block, _WRITE_READ_BENIGN_FLAG_$$block, $$output, _TRACKING, _READ_HAS_OCCURRED_$$block, _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output, _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:source_name "transpose_kernel"} {:kernel} $transpose_kernel($width: bv32, $height: bv32, $blockSize: bv32)
{
  var v0$1: bv32;
  var v0$2: bv32;
  var v1$1: bv32;
  var v1$2: bv32;
  var v2$1: bv32;
  var v2$2: bv32;
  var v3$1: bv32;
  var v3$2: bv32;
  var v4$1: bv8;
  var v4$2: bv8;
  var v5$1: bv8;
  var v5$2: bv8;
  var v6$1: bv8;
  var v6$2: bv8;
  var v7$1: bv8;
  var v7$2: bv8;
  var v8$1: bv8;
  var v8$2: bv8;
  var v9$1: bv8;
  var v9$2: bv8;
  var v10$1: bv8;
  var v10$2: bv8;
  var v11$1: bv8;
  var v11$2: bv8;


  __partitioned_block_$0_0:
    v0$1 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$1), local_id_x$1);
    v0$2 := BV32_ADD(BV32_MUL(group_size_x, group_id_x$2), local_id_x$2);
    v1$1 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$1), local_id_y$1);
    v1$2 := BV32_ADD(BV32_MUL(group_size_y, group_id_y$2), local_id_y$2);
    v2$1 := local_id_x$1;
    v2$2 := local_id_x$2;
    v3$1 := local_id_y$1;
    v3$2 := local_id_y$2;
    havoc v4$1, v4$2;
    havoc v5$1, v5$2;
    havoc v6$1, v6$2;
    havoc v7$1, v7$2;
    call {:sourceloc} {:sourceloc_num 8} _LOG_WRITE_$$block(true, BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), v4$1, $$block[1bv1][BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block(true, BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_0"} {:captureState "check_state_0"} {:sourceloc} {:sourceloc_num 8} true;
    call {:check_id "check_state_0"} {:sourceloc} {:sourceloc_num 8} _CHECK_WRITE_$$block(true, BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), v4$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block"} true;
    $$block[1bv1][BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32)] := v4$1;
    $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32)] := v4$2;
    call {:sourceloc} {:sourceloc_num 9} _LOG_WRITE_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 1bv32), v5$1, $$block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_1"} {:captureState "check_state_1"} {:sourceloc} {:sourceloc_num 9} true;
    call {:check_id "check_state_1"} {:sourceloc} {:sourceloc_num 9} _CHECK_WRITE_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 1bv32), v5$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block"} true;
    $$block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 1bv32)] := v5$1;
    $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 1bv32)] := v5$2;
    call {:sourceloc} {:sourceloc_num 10} _LOG_WRITE_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 2bv32), v6$1, $$block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_2"} {:captureState "check_state_2"} {:sourceloc} {:sourceloc_num 10} true;
    call {:check_id "check_state_2"} {:sourceloc} {:sourceloc_num 10} _CHECK_WRITE_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 2bv32), v6$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block"} true;
    $$block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 2bv32)] := v6$1;
    $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 2bv32)] := v6$2;
    call {:sourceloc} {:sourceloc_num 11} _LOG_WRITE_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 3bv32), v7$1, $$block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_3"} {:captureState "check_state_3"} {:sourceloc} {:sourceloc_num 11} true;
    call {:check_id "check_state_3"} {:sourceloc} {:sourceloc_num 11} _CHECK_WRITE_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 3bv32), v7$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$block"} true;
    $$block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 3bv32)] := v7$1;
    $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 3bv32)] := v7$2;
    goto __partitioned_block_$0_1;

  __partitioned_block_$0_1:
    call {:sourceloc_num 12} $bugle_barrier_duplicated_0(1bv1, 0bv1);
    call {:sourceloc} {:sourceloc_num 13} _LOG_READ_$$block(true, BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), $$block[1bv1][BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_4"} {:captureState "check_state_4"} {:sourceloc} {:sourceloc_num 13} true;
    call {:check_id "check_state_4"} {:sourceloc} {:sourceloc_num 13} _CHECK_READ_$$block(true, BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block"} true;
    v8$1 := $$block[1bv1][BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32)];
    v8$2 := $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32)];
    call {:sourceloc} {:sourceloc_num 14} _LOG_READ_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 1bv32), $$block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 1bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_5"} {:captureState "check_state_5"} {:sourceloc} {:sourceloc_num 14} true;
    call {:check_id "check_state_5"} {:sourceloc} {:sourceloc_num 14} _CHECK_READ_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 1bv32), $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 1bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block"} true;
    v9$1 := $$block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 1bv32)];
    v9$2 := $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 1bv32)];
    call {:sourceloc} {:sourceloc_num 15} _LOG_READ_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 2bv32), $$block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 2bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_6"} {:captureState "check_state_6"} {:sourceloc} {:sourceloc_num 15} true;
    call {:check_id "check_state_6"} {:sourceloc} {:sourceloc_num 15} _CHECK_READ_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 2bv32), $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 2bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block"} true;
    v10$1 := $$block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 2bv32)];
    v10$2 := $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 2bv32)];
    call {:sourceloc} {:sourceloc_num 16} _LOG_READ_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 3bv32), $$block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 3bv32)]);
    assume {:do_not_predicate} {:check_id "check_state_7"} {:captureState "check_state_7"} {:sourceloc} {:sourceloc_num 16} true;
    call {:check_id "check_state_7"} {:sourceloc} {:sourceloc_num 16} _CHECK_READ_$$block(true, BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 3bv32), $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 3bv32)]);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_READ_$$block"} true;
    v11$1 := $$block[1bv1][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$1, $blockSize), v2$1), 4bv32), 3bv32)];
    v11$2 := $$block[(if group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 then 1bv1 else 0bv1)][BV32_ADD(BV32_MUL(BV32_ADD(BV32_MUL(v3$2, $blockSize), v2$2), 4bv32), 3bv32)];
    call {:sourceloc} {:sourceloc_num 17} _LOG_WRITE_$$output(true, BV32_MUL(BV32_ADD(v1$1, BV32_MUL(v0$1, $height)), 4bv32), v8$1, $$output[BV32_MUL(BV32_ADD(v1$1, BV32_MUL(v0$1, $height)), 4bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_MUL(BV32_ADD(v1$2, BV32_MUL(v0$2, $height)), 4bv32));
    assume {:do_not_predicate} {:check_id "check_state_8"} {:captureState "check_state_8"} {:sourceloc} {:sourceloc_num 17} true;
    call {:check_id "check_state_8"} {:sourceloc} {:sourceloc_num 17} _CHECK_WRITE_$$output(true, BV32_MUL(BV32_ADD(v1$2, BV32_MUL(v0$2, $height)), 4bv32), v8$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_MUL(BV32_ADD(v1$1, BV32_MUL(v0$1, $height)), 4bv32)] := v8$1;
    $$output[BV32_MUL(BV32_ADD(v1$2, BV32_MUL(v0$2, $height)), 4bv32)] := v8$2;
    call {:sourceloc} {:sourceloc_num 18} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(v0$1, $height)), 4bv32), 1bv32), v9$1, $$output[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(v0$1, $height)), 4bv32), 1bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(v0$2, $height)), 4bv32), 1bv32));
    assume {:do_not_predicate} {:check_id "check_state_9"} {:captureState "check_state_9"} {:sourceloc} {:sourceloc_num 18} true;
    call {:check_id "check_state_9"} {:sourceloc} {:sourceloc_num 18} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(v0$2, $height)), 4bv32), 1bv32), v9$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(v0$1, $height)), 4bv32), 1bv32)] := v9$1;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(v0$2, $height)), 4bv32), 1bv32)] := v9$2;
    call {:sourceloc} {:sourceloc_num 19} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(v0$1, $height)), 4bv32), 2bv32), v10$1, $$output[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(v0$1, $height)), 4bv32), 2bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(v0$2, $height)), 4bv32), 2bv32));
    assume {:do_not_predicate} {:check_id "check_state_10"} {:captureState "check_state_10"} {:sourceloc} {:sourceloc_num 19} true;
    call {:check_id "check_state_10"} {:sourceloc} {:sourceloc_num 19} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(v0$2, $height)), 4bv32), 2bv32), v10$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(v0$1, $height)), 4bv32), 2bv32)] := v10$1;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(v0$2, $height)), 4bv32), 2bv32)] := v10$2;
    call {:sourceloc} {:sourceloc_num 20} _LOG_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(v0$1, $height)), 4bv32), 3bv32), v11$1, $$output[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(v0$1, $height)), 4bv32), 3bv32)]);
    call _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(v0$2, $height)), 4bv32), 3bv32));
    assume {:do_not_predicate} {:check_id "check_state_11"} {:captureState "check_state_11"} {:sourceloc} {:sourceloc_num 20} true;
    call {:check_id "check_state_11"} {:sourceloc} {:sourceloc_num 20} _CHECK_WRITE_$$output(true, BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(v0$2, $height)), 4bv32), 3bv32), v11$2);
    assume {:captureState "call_return_state_0"} {:procedureName "_CHECK_WRITE_$$output"} true;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(v1$1, BV32_MUL(v0$1, $height)), 4bv32), 3bv32)] := v11$1;
    $$output[BV32_ADD(BV32_MUL(BV32_ADD(v1$2, BV32_MUL(v0$2, $height)), 4bv32), 3bv32)] := v11$2;
    return;
}



axiom (if group_size_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_z == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_x == 256bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if group_size_y == 1bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_x == 2bv32 then 1bv1 else 0bv1) != 0bv1;

axiom (if num_groups_y == 512bv32 then 1bv1 else 0bv1) != 0bv1;

const {:local_id_z} local_id_z$1: bv32;

const {:local_id_z} local_id_z$2: bv32;

const {:group_id_z} group_id_z$1: bv32;

const {:group_id_z} group_id_z$2: bv32;

procedure {:inline 1} {:safe_barrier} {:source_name "bugle_barrier"} {:barrier} $bugle_barrier_duplicated_0($0: bv1, $1: bv1);
  requires $0 == 1bv1;
  requires $1 == 0bv1;
  modifies $$block, $$output, _TRACKING;



const _WATCHED_VALUE_$$output: bv8;

procedure {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_READ_$$output(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _READ_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_READ_$$output(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$output);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$output: bool;

procedure {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$output, _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _LOG_WRITE_$$output(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then true else _WRITE_HAS_OCCURRED_$$output);
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



procedure _CHECK_WRITE_$$output(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$output != _value);
  requires {:source_name "output"} {:array "$$output"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$output;



implementation {:inline 1} _LOG_ATOMIC_$$output(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$output := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$output);
    return;
}



procedure _CHECK_ATOMIC_$$output(_P: bool, _offset: bv32);
  requires {:source_name "output"} {:array "$$output"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);
  requires {:source_name "output"} {:array "$$output"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$output;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$output(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$output := (if _P && _WRITE_HAS_OCCURRED_$$output && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$output);
    return;
}



const _WATCHED_VALUE_$$input: bv8;

procedure {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_READ_$$input(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _READ_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_READ_$$input(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$input);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



var _WRITE_READ_BENIGN_FLAG_$$input: bool;

procedure {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$input, _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _LOG_WRITE_$$input(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then true else _WRITE_HAS_OCCURRED_$$input);
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



procedure _CHECK_WRITE_$$input(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$input != _value);
  requires {:source_name "input"} {:array "$$input"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$input;



implementation {:inline 1} _LOG_ATOMIC_$$input(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$input := (if _P && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$input);
    return;
}



procedure _CHECK_ATOMIC_$$input(_P: bool, _offset: bv32);
  requires {:source_name "input"} {:array "$$input"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);
  requires {:source_name "input"} {:array "$$input"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$input;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$input(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$input := (if _P && _WRITE_HAS_OCCURRED_$$input && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$input);
    return;
}



const _WATCHED_VALUE_$$block: bv8;

procedure {:inline 1} _LOG_READ_$$block(_P: bool, _offset: bv32, _value: bv8);
  modifies _READ_HAS_OCCURRED_$$block;



implementation {:inline 1} _LOG_READ_$$block(_P: bool, _offset: bv32, _value: bv8)
{

  log_access_entry:
    _READ_HAS_OCCURRED_$$block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block == _value then true else _READ_HAS_OCCURRED_$$block);
    return;
}



procedure _CHECK_READ_$$block(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "block"} {:array "$$block"} {:race} {:write_read} !(_P && _WRITE_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset && _WRITE_READ_BENIGN_FLAG_$$block && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block"} {:array "$$block"} {:race} {:atomic_read} !(_P && _ATOMIC_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



var _WRITE_READ_BENIGN_FLAG_$$block: bool;

procedure {:inline 1} _LOG_WRITE_$$block(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8);
  modifies _WRITE_HAS_OCCURRED_$$block, _WRITE_READ_BENIGN_FLAG_$$block;



implementation {:inline 1} _LOG_WRITE_$$block(_P: bool, _offset: bv32, _value: bv8, _value_old: bv8)
{

  log_access_entry:
    _WRITE_HAS_OCCURRED_$$block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block == _value then true else _WRITE_HAS_OCCURRED_$$block);
    _WRITE_READ_BENIGN_FLAG_$$block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block == _value then _value != _value_old else _WRITE_READ_BENIGN_FLAG_$$block);
    return;
}



procedure _CHECK_WRITE_$$block(_P: bool, _offset: bv32, _value: bv8);
  requires {:source_name "block"} {:array "$$block"} {:race} {:write_write} !(_P && _WRITE_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block"} {:array "$$block"} {:race} {:read_write} !(_P && _READ_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset && _WATCHED_VALUE_$$block != _value && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block"} {:array "$$block"} {:race} {:atomic_write} !(_P && _ATOMIC_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _LOG_ATOMIC_$$block(_P: bool, _offset: bv32);
  modifies _ATOMIC_HAS_OCCURRED_$$block;



implementation {:inline 1} _LOG_ATOMIC_$$block(_P: bool, _offset: bv32)
{

  log_access_entry:
    _ATOMIC_HAS_OCCURRED_$$block := (if _P && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 && _TRACKING && _WATCHED_OFFSET == _offset then true else _ATOMIC_HAS_OCCURRED_$$block);
    return;
}



procedure _CHECK_ATOMIC_$$block(_P: bool, _offset: bv32);
  requires {:source_name "block"} {:array "$$block"} {:race} {:write_atomic} !(_P && _WRITE_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);
  requires {:source_name "block"} {:array "$$block"} {:race} {:read_atomic} !(_P && _READ_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset && group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2);



procedure {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$block(_P: bool, _offset: bv32);
  modifies _WRITE_READ_BENIGN_FLAG_$$block;



implementation {:inline 1} _UPDATE_WRITE_READ_BENIGN_FLAG_$$block(_P: bool, _offset: bv32)
{

  _UPDATE_BENIGN_FLAG:
    _WRITE_READ_BENIGN_FLAG_$$block := (if _P && _WRITE_HAS_OCCURRED_$$block && _WATCHED_OFFSET == _offset then false else _WRITE_READ_BENIGN_FLAG_$$block);
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
    assume $0 != 0bv1 ==> !_READ_HAS_OCCURRED_$$block;
    assume $0 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$block;
    assume $0 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$block;
    goto anon1;

  anon1:
    goto anon8_Then, anon8_Else;

  anon8_Else:
    assume {:partition} !($0 != 0bv1 || $0 != 0bv1);
    goto anon3;

  anon3:
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_READ_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_WRITE_HAS_OCCURRED_$$output;
    assume group_id_x$1 == group_id_x$2 && group_id_y$1 == group_id_y$2 && group_id_z$1 == group_id_z$2 ==> $1 != 0bv1 ==> !_ATOMIC_HAS_OCCURRED_$$output;
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
    havoc $$output;
    goto anon6;

  anon8_Then:
    assume {:partition} $0 != 0bv1 || $0 != 0bv1;
    havoc $$block;
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
